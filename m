From: Lukas Wunner <lukas@wunner.de>
Subject: Re: Regression in v4.15 due to GPIO .get_multiple changes
Date: Mon, 15 Jan 2018 17:51:55 +0100
Message-ID: <20180115165155.GA20077@wunner.de>
References: <20180115153547.GA4441@archie.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from bmailout1.hostsharing.net ([83.223.95.100]:44909 "EHLO
        bmailout1.hostsharing.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S934380AbeAOQv5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 15 Jan 2018 11:51:57 -0500
Content-Disposition: inline
In-Reply-To: <20180115153547.GA4441@archie.localdomain>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Clemens Gruber <clemens.gruber@pqgruber.com>
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>

Hi Clemens,

thanks for reporting this and sorry for the breakage.

On Mon, Jan 15, 2018 at 04:35:48PM +0100, Clemens Gruber wrote:
> I noticed a regression when testing the GPIOs on an i.MX6 with the
> current v4.15-rc8 kernel.
> 
> When reading the input value of an internal GPIO, for example with
> libgpiod's gpiod_line_get_value, strace shows that userspace blocks
> indefinitely at:
> ioctl(45, GPIOHANDLE_GET_LINE_VALUES_IOCTL
> 
> (The process consumes 100% CPU afterwards and can't be killed)
> 
> I looked at changes between v4.14 (working) and v4.15-rc8 (broken),
> especially in drivers/gpio/gpio-{mxc,mmio}.c and identified the
> following two commits to be responsible:
> eec1d566cdf9 ("gpio: Introduce ->get_multiple callback")
> 80057cb417b2 ("gpio-mmio: Use the new .get_multiple() callback")
> 
> Reverting both of them (they are interdependent) fixed the problem.

They're not interdependent, the latter depends on the former but not
vice-versa.  Hence, reverting only the latter should be sufficient.
Can you confirm this?

Looking at 80057cb417b2, the only possible cause I can imagine is that
the following somehow becomes an infinite loop.  Can you insert a printk
to confirm this?

+       while ((bit = find_next_bit(mask, gc->ngpio, bit)) != gc->ngpio) {
+               if (gc->bgpio_dir & BIT(bit))
+                       set_mask |= BIT(bit);
+               else
+                       get_mask |= BIT(bit);
+       }

Is you platform big or little endian?

Thanks,

Lukas
