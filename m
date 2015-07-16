From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio-pca953x: Support NXP PCAL9555A with Agile I/O
Date: Thu, 16 Jul 2015 13:54:55 +0200
Message-ID: <CACRpkdbVQwkLfVdXyuWr4gOezeNcuFHHb5A2VLBwOnHb=k0o5Q@mail.gmail.com>
References: <1435858426-19623-1-git-send-email-clemens.gruber@pqgruber.com>
	<1435858426-19623-2-git-send-email-clemens.gruber@pqgruber.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f179.google.com ([209.85.214.179]:34980 "EHLO
	mail-ob0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754154AbbGPLy4 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 16 Jul 2015 07:54:56 -0400
Received: by obbop1 with SMTP id op1so45173737obb.2
        for <linux-gpio@vger.kernel.org>; Thu, 16 Jul 2015 04:54:55 -0700 (PDT)
In-Reply-To: <1435858426-19623-2-git-send-email-clemens.gruber@pqgruber.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Clemens Gruber <clemens.gruber@pqgruber.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>

On Thu, Jul 2, 2015 at 7:33 PM, Clemens Gruber
<clemens.gruber@pqgruber.com> wrote:

> This patch adds support for the NXP PCAL9555A GPIO expander's extra
> features, called Agile I/O:
> Input latching, interrupt masks and open-drain output stages can be
> configured via 3 optional device tree properties.
>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Alexandre Courbot <gnurou@gmail.com>
> Signed-off-by: Clemens Gruber <clemens.gruber@pqgruber.com>

(...)

> +Optional properties for chips with Agile I/O:
> +- nxp,input-latch: Latch input states by setting the pin's corresponding bits

What does "latch" mean here. We need to know if this is something we will see
a hundred times in the future or only this once.

I am also very suspicious as to whether this should be in the GPIO controller,
I think it should be on the consumer, because surely it is the user of the
GPIO line that requires this, not the GPIO chip.

> +- nxp,intr-mask: Enable interrupts by clearing the pin's corresponding mask bits

This is just wrong. Let the irqchip portions of the driver enable interrupts by
masking them, don't try to outsmart operating system functions with
hammering down things in device tree.

> +- nxp,open-drain: Enable the open-drain output stage, one bit per port (bank)

Again, this should be done on the consumer side. Any driver that reference
a GPIO line can do this:

foo-gpios = <&gpioN 12 GPIO_ACTIVE_LOW>;

So why should it not be able to do this:

foo-gpios = <&gpioN 12 GPIO_OPEN_DRAIN>;

Add GPIO_OPEN_DRAIN to include/dt-bindings/gpio/gpio.h and implement
handling in the GPIO core drivers/gpio/gpiolib-of.c instead of trying to
duct-tape it with things like this. We already have GPIO_OPEN_DRAIN
in include/linux/gpio/machine.h for the boardfile case, so implement similar
handling.

Yours,
Linus Walleij
