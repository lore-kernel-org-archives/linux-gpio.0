From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: sysfs: wait for GPIO interrupt
Date: Fri, 16 May 2014 18:43:13 +0200
Message-ID: <CACRpkdZcDQPKxehZkPjeJ5yGsHPs_xvDu0Mn5UgE-azCi4m=-Q@mail.gmail.com>
References: <CAGm1_kuKvjAguez85MKWk+gw5T4-oa8thHEao6Rz0nES-woYiA@mail.gmail.com>
	<CABxcv=k7QTiNWNbHTLFKkjHdgk9o9xB4E4uq75wuKyvXYhqWMQ@mail.gmail.com>
	<CACRpkdZU+P_8NK_YX6aqcp5WtbAzgv7V73Uzj0_RxAQaQgaDzg@mail.gmail.com>
	<CAGm1_kuZGs0=hzPwUs7aC34PQVn7pL2r7V_rdbwXAtwCHxXBkA@mail.gmail.com>
	<CABxcv=m8go203DcdAy6kdQm0=vOo9TxFSKKdt1bwDMbW_72W-g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oa0-f49.google.com ([209.85.219.49]:59947 "EHLO
	mail-oa0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752733AbaEPQnO (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 16 May 2014 12:43:14 -0400
Received: by mail-oa0-f49.google.com with SMTP id eb12so3245537oac.8
        for <linux-gpio@vger.kernel.org>; Fri, 16 May 2014 09:43:13 -0700 (PDT)
In-Reply-To: <CABxcv=m8go203DcdAy6kdQm0=vOo9TxFSKKdt1bwDMbW_72W-g@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Javier Martinez Canillas <javier@dowhile0.org>, Grant Likely <grant.likely@linaro.org>
Cc: Yegor Yefremov <yegorslists@googlemail.com>, Alexandre Courbot <gnurou@gmail.com>, Linux GPIO List <linux-gpio@vger.kernel.org>, jack@embed.me.uk

On Wed, May 14, 2014 at 11:32 AM, Javier Martinez Canillas
<javier@dowhile0.org> wrote:

> If Linus agrees that a better GPIO interface that model the GPIO
> operations can be developed using a set of ioctl commands or netlink
> sockets I'll be very glad to help with the implementation.

That needs to be discussed with the wider kernel community and will
be a quite daunting task. But if you have the geist, do go ahead. Involved
people would include Grant Likely and Greg Kroah-Hartmann.

> On a related note I see that people are asking how they can mux a SoC
> pin in GPIO mode in order to use the GPIO sysfs interface. For example
> take a look to this thread [0].

Pin control shall be handled in the kernel.

> When OMAP was not using pinctrl-single but a custom driver for pin
> configuration there was a debugfs interface
> (/sys/kernel/debug/omap_mux) that allowed to change the pin mux setup.

If people want to do crazy stuff from userspace and they use
debugfs for that, they should be aware what the rules of debugfs
is: it is *NOT* an ABI! We may break that just because we feel
like it.

There are no plans for a proper userspace interface for pin control,
if that is desired an even bigger undertaking than moving GPIOs to
ioctl():s etc will be needed.

But here, too, I think the real answer is: edit device tree files.

Yours,
Linus Walleij
