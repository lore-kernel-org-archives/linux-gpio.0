From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 4/5] gpio: ath79: Add support for the interrupt controller
Date: Wed, 10 Feb 2016 11:37:39 +0100
Message-ID: <CACRpkdaCCrqBFuP9s_gVrvyp-M5+3JGHUra3OErkMe9zcPQbMg@mail.gmail.com>
References: <1454010273-21513-1-git-send-email-albeu@free.fr>
	<1454010273-21513-4-git-send-email-albeu@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f180.google.com ([209.85.214.180]:35572 "EHLO
	mail-ob0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752137AbcBJKhk (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 10 Feb 2016 05:37:40 -0500
Received: by mail-ob0-f180.google.com with SMTP id xk3so21067792obc.2
        for <linux-gpio@vger.kernel.org>; Wed, 10 Feb 2016 02:37:40 -0800 (PST)
In-Reply-To: <1454010273-21513-4-git-send-email-albeu@free.fr>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alban Bedel <albeu@free.fr>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>, Antony Pavlov <antonynpavlov@gmail.com>, Gabor Juhos <juhosg@openwrt.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Thu, Jan 28, 2016 at 8:44 PM, Alban Bedel <albeu@free.fr> wrote:

> Add support for the interrupt controller using GPIOLIB_IRQCHIP.
> Both edges isn't supported by the chip and has to be emulated
> by switching the polarity on each interrupt.
>
> Signed-off-by: Alban Bedel <albeu@free.fr>

Patch applied (you know this better than me and I assume you have
tested it), but look into the following:

> +static struct ath79_gpio_ctrl *irq_data_to_ath79_gpio(struct irq_data *data)
> +{
> +       struct gpio_chip *gc = irq_data_get_irq_chip_data(data);
> +
> +       return container_of(gc, struct ath79_gpio_ctrl, gc);

That looks like it could be

return gpiochip_get_data(gc);

> +static u32 ath79_gpio_read(struct ath79_gpio_ctrl *ctrl, unsigned reg)
> +{
> +       return readl(ctrl->base + reg);
> +}
> +
> +static void ath79_gpio_write(struct ath79_gpio_ctrl *ctrl,
> +                       unsigned reg, u32 val)
> +{
> +       return writel(val, ctrl->base + reg);
> +}

Do you really need these wrappers? I would just inline the functions.
No strong preference but please consider.

> +static bool ath79_gpio_update_bits(
> +       struct ath79_gpio_ctrl *ctrl, unsigned reg, u32 mask, u32 bits)
> +{
> +       u32 old_val, new_val;
> +
> +       old_val = ath79_gpio_read(ctrl, reg);
> +       new_val = (old_val & ~mask) | (bits & mask);
> +
> +       if (new_val != old_val)
> +               ath79_gpio_write(ctrl, reg, new_val);
> +
> +       return new_val != old_val;
> +}

This is starting to look like regmap. One thing it provides is caching.

Look at my commit 179c8fb3c2a6cc86cc746e6d071be00f611328de
"clk: versatile-icst: convert to use regmap" for example.

Very light suggestion, but regmap has regmap_update_bits().

I would rather just read-modify-write the register.

> +static int ath79_gpio_irq_set_type(struct irq_data *data,
> +                               unsigned int flow_type)
> +{
> +       struct ath79_gpio_ctrl *ctrl = irq_data_to_ath79_gpio(data);
> +       u32 mask = BIT(irqd_to_hwirq(data));
> +       u32 type = 0, polarity = 0;
> +       unsigned long flags;
> +       bool disabled;
> +
> +       switch (flow_type) {
> +       case IRQ_TYPE_EDGE_RISING:
> +               polarity |= mask;
> +       case IRQ_TYPE_EDGE_FALLING:
> +       case IRQ_TYPE_EDGE_BOTH:
> +               break;
> +
> +       case IRQ_TYPE_LEVEL_HIGH:
> +               polarity |= mask;
> +       case IRQ_TYPE_LEVEL_LOW:
> +               type |= mask;

Some more comments on edge handling below...

> +               break;
> +
> +       default:
> +               return -EINVAL;
> +       }
> +
> +       spin_lock_irqsave(&ctrl->lock, flags);
> +
> +       if (flow_type == IRQ_TYPE_EDGE_BOTH) {
> +               ctrl->both_edges |= mask;
> +               polarity = ~ath79_gpio_read(ctrl, AR71XX_GPIO_REG_IN);
> +       } else {
> +               ctrl->both_edges &= ~mask;
> +       }

Maybe insert a comment about the trick used to toggle the
detection edge?

> +static struct irq_chip ath79_gpio_irqchip = {
> +       .name = "gpio-ath79",
> +       .irq_enable = ath79_gpio_irq_enable,
> +       .irq_disable = ath79_gpio_irq_disable,
> +       .irq_mask = ath79_gpio_irq_mask,
> +       .irq_unmask = ath79_gpio_irq_unmask,
> +       .irq_set_type = ath79_gpio_irq_set_type,
> +};

Hm no .irq_ack... even though using edge irqs. See below.

> +static void ath79_gpio_irq_handler(struct irq_desc *desc)
> +{
> +       struct gpio_chip *gc = irq_desc_get_handler_data(desc);
> +       struct irq_chip *irqchip = irq_desc_get_chip(desc);
> +       struct ath79_gpio_ctrl *ctrl =
> +               container_of(gc, struct ath79_gpio_ctrl, gc);
> +       unsigned long flags, pending;
> +       u32 both_edges, state;
> +       int irq;
> +
> +       chained_irq_enter(irqchip, desc);
> +
> +       spin_lock_irqsave(&ctrl->lock, flags);
> +
> +       pending = ath79_gpio_read(ctrl, AR71XX_GPIO_REG_INT_PENDING);
> +
> +       /* Update the polarity of the both edges irqs */
> +       both_edges = ctrl->both_edges & pending;
> +       if (both_edges) {
> +               state = ath79_gpio_read(ctrl, AR71XX_GPIO_REG_IN);
> +               ath79_gpio_update_bits(ctrl, AR71XX_GPIO_REG_INT_POLARITY,
> +                               both_edges, ~state);
> +       }
> +
> +       spin_unlock_irqrestore(&ctrl->lock, flags);
> +
> +       if (pending) {
> +               for_each_set_bit(irq, &pending, gc->ngpio)
> +                       generic_handle_irq(
> +                               irq_linear_revmap(gc->irqdomain, irq));
> +       }
> +
> +       chained_irq_exit(irqchip, desc);
> +}

This is an edge-only handler, this should not be used for level IRQs.
Have you really tested level IRQs?

> +       err = gpiochip_irqchip_add(&ctrl->gc, &ath79_gpio_irqchip, 0,
> +                               handle_simple_irq, IRQ_TYPE_NONE);
> +       if (err) {
> +               dev_err(&pdev->dev, "failed to add gpiochip_irqchip\n");
> +               goto gpiochip_remove;
> +       }

Doesn't the chip requireq ACKing the level IRQs in some register?

If it happens automagically when issueing
ath79_gpio_read(ctrl, AR71XX_GPIO_REG_INT_PENDING);
then it's OK like this I guess.

Usually we use handle_edge_irq() and requires defining an
.irq_ack() callback in the irqchip that ACKs the irqs. But if
they are ACKed by the register read like that, it is not needed.

Yours,
Linus Walleij
