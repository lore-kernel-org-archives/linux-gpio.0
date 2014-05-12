From: Javier Martinez Canillas <javier@dowhile0.org>
Subject: Re: sysfs: wait for GPIO interrupt
Date: Tue, 13 May 2014 01:45:06 +0200
Message-ID: <CABxcv=k7QTiNWNbHTLFKkjHdgk9o9xB4E4uq75wuKyvXYhqWMQ@mail.gmail.com>
References: <CAGm1_kuKvjAguez85MKWk+gw5T4-oa8thHEao6Rz0nES-woYiA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-we0-f175.google.com ([74.125.82.175]:60476 "EHLO
	mail-we0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751272AbaELXpH (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 12 May 2014 19:45:07 -0400
Received: by mail-we0-f175.google.com with SMTP id t61so7486534wes.20
        for <linux-gpio@vger.kernel.org>; Mon, 12 May 2014 16:45:06 -0700 (PDT)
In-Reply-To: <CAGm1_kuKvjAguez85MKWk+gw5T4-oa8thHEao6Rz0nES-woYiA@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Yegor Yefremov <yegorslists@googlemail.com>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: Linux GPIO List <linux-gpio@vger.kernel.org>, jack@embed.me.uk

Hello Yegor,

On Thu, May 8, 2014 at 10:19 AM, Yegor Yefremov
<yegorslists@googlemail.com> wrote:
> I've stumbled upon following issue. When waiting for interrupt with
> poll() like described in this example [1], the program returns from
> poll() immediately. This thread [2] describes a workaround for this
> issue via making read() before invoking poll().
>
> My system is am335x, kernel 3.15-rc4
>
> I experience this behavior by both SoC's own GPIO and i2c expander tca6416.
>

I tested with an OMAP3 board which uses the same GPIO driver than the
am335x and I was able to reproduce your issue.

> Is this the proper way (invoke read() before poll()) to work with
> GPIOs from user space, so that this approach should be incorporated
> into such libraries as libsoc [3]
>

I don't think that this should be an expected behavior, it seems that
this is either a bug on gpiolib sysfs interface or gpio-omap.c and
gpio-pca953x.c drivers (most probably the later than the former).

The question is what side effect has to do a read(2) syscall before a
poll(2) to make it succeed. I looked at
drivers/gpio/gpiolib.c:gpio_value_show() but didn't find anything
relevant.

I didn't have time to dig futher on this but I'll try to take a look
this weekend when I've more time. But for now I've added to Linus and
Alexandre in cc in case they have an idea of what's going on.

> Yegor
>
> [1] https://developer.ridgerun.com/wiki/index.php/Gpio-int-test.c
> [2] http://comments.gmane.org/gmane.linux.distributions.gumstix.general/61286
> [3] https://github.com/jackmitch/libsoc

Best regards,
Javier
