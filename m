From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/2] gpio: etraxfs: add interrupt support
Date: Mon, 3 Aug 2015 11:34:23 +0200
Message-ID: <CACRpkdZOztPHykq99bC0P9t0jQkAdYqrrbC2shwWa9d2O5DQXw@mail.gmail.com>
References: <1438346937-9020-1-git-send-email-rabin@rab.in>
	<1438346937-9020-2-git-send-email-rabin@rab.in>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f178.google.com ([209.85.214.178]:35333 "EHLO
	mail-ob0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752100AbbHCJeX (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 3 Aug 2015 05:34:23 -0400
Received: by obbop1 with SMTP id op1so95044692obb.2
        for <linux-gpio@vger.kernel.org>; Mon, 03 Aug 2015 02:34:23 -0700 (PDT)
In-Reply-To: <1438346937-9020-2-git-send-email-rabin@rab.in>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Rabin Vincent <rabin@rab.in>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Fri, Jul 31, 2015 at 2:48 PM, Rabin Vincent <rabin@rab.in> wrote:

> On ETRAX FS, all pins on the first port (and only the first port) have
> interrupt support.
>
> On ARTPEC-3, all pins on all ports have interrupt support.  However,
> there are only eight interrupts.  Each of the interrupts is associated
> with a group of pins and for each interrupt the one pin from the group
> which will trigger it can be selected.
>
> Signed-off-by: Rabin Vincent <rabin@rab.in>

Hm wait now I get confused ... probably tripping over my own shoelaces
as usual but help me here:

> +static void etraxfs_gpio_irq_ack(struct irq_data *d)
> +{
> +       struct etraxfs_gpio_chip *chip = irq_data_get_irq_chip_data(d);

I don't see how this works in the irqchip functions.

Usually the chip data is the struct gpio_chip when using the
GPIOLIB_IRQCHIP, then we use some container_of to boil
out the containing struct, like:

static inline struct extraxfs_gpio_chip *to_etraxfs(struct gpio_chip *chip)
{
        return container_of(chip, struct etraxfs_gpio_chip, bgc.gc);
}

So it would be:

struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
struct etraxfs_gpio_chip *chip = to_etraxfs(gc);

so how did you manage to replace that pointer with a pointer
to your struct etraxfs_gpio_chip?

> +               ret = gpiochip_irqchip_add(&bgc->gc, &etraxfs_gpio_irq_chip, 0,
> +                                          handle_level_irq, IRQ_TYPE_NONE);

Because this sets the irqdomain host_data to gc, then the
irqdomain .map function sets the chip data to the same.

Yours,
Linus Walleij
