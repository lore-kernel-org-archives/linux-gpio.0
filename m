From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: Question about non-boolean gpio sysfs values
Date: Wed, 5 Feb 2014 10:54:02 +0900
Message-ID: <CAAVeFuLX5Bynin71fRGgThR36kCHszNupx+XJzc+7Kwnoihijw@mail.gmail.com>
References: <52ED84A5.3050102@contactless.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ve0-f173.google.com ([209.85.128.173]:57734 "EHLO
	mail-ve0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751470AbaBEByW (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 4 Feb 2014 20:54:22 -0500
Received: by mail-ve0-f173.google.com with SMTP id oz11so6663015veb.18
        for <linux-gpio@vger.kernel.org>; Tue, 04 Feb 2014 17:54:22 -0800 (PST)
In-Reply-To: <52ED84A5.3050102@contactless.ru>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Evgeny Boger <boger@contactless.ru>, Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Sun, Feb 2, 2014 at 8:35 AM, Evgeny Boger <boger@contactless.ru> wrote:
> Hello,
>
> I'm now getting non-boolean values from gpio sysfs interface on 3.13, like
> this
>
> root@wirenboard:~# cat /sys/class/gpio/gpio16/value
> 65536
>
> (I'm working with imx23 soc which is handled by gpio-generic.c driver)
>
> Looks like these weird non-boolean values appeared after this commit:
> https://github.com/torvalds/linux/commit/79a9becda8940deb2274b5aa4577c86d52ee7ecb
> .
>
>
> 1) Is it an expected behavior or not?

This seems wrong to me, a GPIO should always be 0 or 1.

> 2) If it's not the case, which one of these should be fixed?
>   a) bgpio_get in gpio-generic.c to return only boolean values
> or
>   b) gpio_value_show so only the sysfs interface will be affected
> or
>  c) gpiod_get_value and gpiod_get_value_cansleep functions

>From what I understand of gpio-generic, this driver uses simple
register accesses and a bitmask to set/read GPIOs. Interestingly you
are accessing GPIO 16, and the value returned is 65536, which happens
to be (1 << 16).

As it turns out, bgpio_get() does the following:

    return bgc->read_reg(bgc->reg_dat) & bgc->pin2mask(bgc, gpio);

So it seems like this is where your unexpected value comes from. As
for where to fix it, the GPIO driver should return the value of the
GPIO itself, and not some mask that indicates how it handles GPIOs
internally. But I suppose it would also be nice to make
gpiod_get_value*() more consistent so the whole subsystem gets fixed
in one shot (I suspect a few other drivers are doing the same). I
mean, we never expect a GPIO to be something else than 0 or 1, do we?

Alex.
