From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/2] gpio: xlp: GPIO controller for Netlogic XLP SoCs
Date: Wed, 6 May 2015 16:45:04 +0200
Message-ID: <CACRpkdbB=xg+wc+HfsPmdGxPHM3Vcck2T0h4xCTvVwepd8dP5g@mail.gmail.com>
References: <1430232045-5114-1-git-send-email-kamlakant.patel@broadcom.com>
	<1430232045-5114-3-git-send-email-kamlakant.patel@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f54.google.com ([209.85.218.54]:33167 "EHLO
	mail-oi0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751047AbbEFOpF (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 6 May 2015 10:45:05 -0400
Received: by oica37 with SMTP id a37so9186931oic.0
        for <linux-gpio@vger.kernel.org>; Wed, 06 May 2015 07:45:04 -0700 (PDT)
In-Reply-To: <1430232045-5114-3-git-send-email-kamlakant.patel@broadcom.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Kamlakant Patel <kamlakant.patel@broadcom.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Tue, Apr 28, 2015 at 4:40 PM,  <kamlakant.patel@broadcom.com> wrote:

> From: Kamlakant Patel <kamlakant.patel@broadcom.com>
>
> Add GPIO controller driver for Netlogic XLP MIPS64 SOCs.
>
> This driver is instantiated by device tree and supports interrupts
> for GPIOs.
>
> Signed-off-by: Kamlakant Patel <kamlakant.patel@broadcom.com>

Looking good, some stuff to go...

> +config GPIO_XLP
> +       tristate "Netlogic XLP GPIO support"
> +       depends on CPU_XLP
> +       select GPIOLIB_IRQCHIP

Don't you need:
depends on OF_GPIO

> +static irqreturn_t xlp_gpio_generic_handler(int irq, void *data)
> +{
> +       struct xlp_gpio_priv *priv = data;
> +       int gpio, regoff;
> +       u32 gpio_stat;
> +
> +       regoff = -1;
> +       gpio_stat = 0;

Usually we use a chained handler for this type of devices, meaning you
just get the IRQ and call gpiochip_set_chained_irqchip() in probe() and
do things like this in the handler:

struct irq_chip *host_chip = irq_get_chip(irq);

chained_irq_enter(host_chip, desc);

> +       for_each_set_bit(gpio, priv->gpio_enabled_mask, XLP_MAX_NR_GPIO) {
> +               if (regoff != gpio / XLP_GPIO_REGSZ) {
> +                       regoff = gpio / XLP_GPIO_REGSZ;
> +                       gpio_stat = readl(priv->gpio_intr_stat + regoff * 4);
> +               }
> +               if (gpio_stat & BIT(gpio % XLP_GPIO_REGSZ))
> +                       generic_handle_irq(irq_find_mapping(
> +                                               priv->chip.irqdomain, gpio));
> +       }

chained_irq_exit(host_chip, desc);

> +
> +       return IRQ_HANDLED;
> +}

Any place where the GPIO IRQ line is connected to a higher-order
IRQ controller this should be done like so...

(...)
> +static int xlp_gpio_probe(struct platform_device *pdev)
> +{
(...)
> +       irq_base = irq_alloc_descs(-1, XLP_GPIO_IRQ_BASE, gc->ngpio, 0);
> +       if (irq_base < 0) {
> +               dev_err(&pdev->dev, "Failed to allocate IRQ numbers\n");
> +               return err;
> +       }

Why are you doing this? GPIOLIB_IRQCHIP handles this for you.
Just drop this code and irq_base altogether.

> +       err = gpiochip_irqchip_add(gc, &xlp_gpio_irq_chip, irq_base,
> +                               handle_level_irq, IRQ_TYPE_NONE);

Pass 0 as irq_base and it will allocate IRQ descriptors.

Yours,
Linus Walleij
