From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 05/33] gpio: add generic single-register fixed-direction
 GPIO driver
Date: Tue, 30 Aug 2016 23:25:19 +0200
Message-ID: <CACRpkdZJy9gZwH9__qXAf6nURN7xV6CbOaGC-JL6X5rDHN55VQ@mail.gmail.com>
References: <20160829102328.GA28796@n2100.armlinux.org.uk> <E1beJjz-0000mA-0o@rmk-PC.armlinux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f42.google.com ([209.85.218.42]:35618 "EHLO
        mail-oi0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753220AbcH3VZV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 30 Aug 2016 17:25:21 -0400
Received: by mail-oi0-f42.google.com with SMTP id p186so9678279oia.2
        for <linux-gpio@vger.kernel.org>; Tue, 30 Aug 2016 14:25:20 -0700 (PDT)
In-Reply-To: <E1beJjz-0000mA-0o@rmk-PC.armlinux.org.uk>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Russell King <rmk+kernel@armlinux.org.uk>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, linux-pcmcia@lists.infradead.org, Alexandre Courbot <gnurou@gmail.com>, Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>, Kristoffer Ericson <kristoffer.ericson@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>

On Mon, Aug 29, 2016 at 12:24 PM, Russell King
<rmk+kernel@armlinux.org.uk> wrote:

> Add a simple, generic, single register fixed-direction GPIO driver.
> This is able to support a single register where a fixed number of
> bits are used for input and a fixed number of bits used for output.
>
> Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>

Clever, I like it!

>  include/linux/gpio-reg.h |  12 ++++

Can we put this in include/linux/gpio/gpio-reg.h?

I try to do some scopeing to <linux/gpio/*> there.

> +#define to_gpio_reg(x) container_of(x, struct gpio_reg, gc)

You don't need that trickery anymore, just:

> +static int gpio_reg_get_direction(struct gpio_chip *gc, unsigned offset)
> +{
> +       struct gpio_reg *r = to_gpio_reg(gc);

struct gpio_reg *r = gpiochip_get_data(gc);

(applied everywhere)

> +       if (dev)
> +               ret = devm_gpiochip_add_data(dev, &r->gc, r);
> +       else
> +               ret = gpiochip_add_data(&r->gc, r);

Aha both device and device-less, I see.

Apart from that it looks nice, any other questionmarks were
fixed in the other replies.

Yours,
Linus Walleij
