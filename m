From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v5 08/14] pinctrl: pinctrl-pic32: Add PIC32 pin control driver
Date: Wed, 27 Jan 2016 14:49:26 +0100
Message-ID: <CACRpkdaDC5LLcQx5_=vm=tjAV0z6RHvzgjzSFK6S+_1M7faMuA@mail.gmail.com>
References: <1452734299-460-1-git-send-email-joshua.henderson@microchip.com>
	<1452734299-460-9-git-send-email-joshua.henderson@microchip.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f180.google.com ([209.85.214.180]:34804 "EHLO
	mail-ob0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932334AbcA0Nt1 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 27 Jan 2016 08:49:27 -0500
Received: by mail-ob0-f180.google.com with SMTP id vt7so7322139obb.1
        for <linux-gpio@vger.kernel.org>; Wed, 27 Jan 2016 05:49:26 -0800 (PST)
In-Reply-To: <1452734299-460-9-git-send-email-joshua.henderson@microchip.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Joshua Henderson <joshua.henderson@microchip.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Linux MIPS <linux-mips@linux-mips.org>, Ralf Baechle <ralf@linux-mips.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Thu, Jan 14, 2016 at 2:15 AM, Joshua Henderson
<joshua.henderson@microchip.com> wrote:

> Add a driver for the pin controller present on the Microchip PIC32
> including the specific variant PIC32MZDA. This driver provides pinmux
> and pinconfig operations as well as GPIO and IRQ chips for the GPIO
> banks.
>
> Signed-off-by: Joshua Henderson <joshua.henderson@microchip.com>
> Cc: Ralf Baechle <ralf@linux-mips.org>
> ---
> Changes since v4: None

Sorry for the delay. Fell between the cracks.

Overall this looks nice. Small things that need to be fixed below.

Is it possible to merge this patch separately into the pinctrl tree?

I was hoping there are no compile-time dependencies to the
MIPS tree so I can just merge this. Else I can provide some
kind of immutable branch to the MIPS maintainers.
(Having dangling symbols in Kconfig is OK with me if I know
they will come in from some other tree.)

> +#include <linux/clk.h>
> +#include <linux/gpio.h>

This include should not be needed, just the one below.

> +#include <linux/gpio/driver.h>
(...)
> +#include <linux/interrupt.h>
> +#include <linux/io.h>
> +#include <linux/irq.h>
> +#include <linux/of.h>
> +#include <linux/of_device.h>
> +#include <linux/pinctrl/pinconf.h>
> +#include <linux/pinctrl/pinconf-generic.h>
> +#include <linux/pinctrl/pinctrl.h>
> +#include <linux/pinctrl/pinmux.h>
> +#include <linux/platform_device.h>
> +#include <linux/slab.h>
> +#include <linux/spinlock.h>
> +
> +#include <asm/mach-pic32/pic32.h>

Oh this is how you do things still? Is this necessary? :/
Then I guess it has to be applied to the MIPS tree.

> +static inline u32 pctl_readl(struct pic32_pinctrl *pctl, u32 reg)
> +{
> +       return readl(pctl->reg_base + reg);
> +}
> +
> +static inline void pctl_writel(struct pic32_pinctrl *pctl, u32 val, u32 reg)
> +{
> +       writel(val, pctl->reg_base + reg);
> +}

This is a bit excess abstraction, I would just readl() and writel()
directly in the code, adding the offset. Butr it's you pick.

> +static inline struct pic32_gpio_bank *gc_to_bank(struct gpio_chip *gc)
> +{
> +       return container_of(gc, struct pic32_gpio_bank, gpio_chip);
> +}

Don't do this anymore.

Se all the "use gpiochip data pointer" patches I merged last
merge window.

Replace

= gc_to_bank(gc)
with
= gpiochip_get_data(gc);

everywhere and use

gpiochip_add_data(&gc, bank)

to make sure that gpipchip_get_data() returns what you want.

> +static inline struct pic32_gpio_bank *irqd_to_bank(struct irq_data *d)
> +{
> +       return gc_to_bank(irq_data_get_irq_chip_data(d));
> +}

For example this becomes:
return gpiochip_get_data(irq_data_get_irq_chip_data(d));

> +static inline u32 gpio_readl(struct pic32_gpio_bank *bank, u32 reg)
> +{
> +       return readl(bank->reg_base + reg);
> +}
> +
> +static inline void gpio_writel(struct pic32_gpio_bank *bank, u32 val,
> +                              u32 reg)
> +{
> +       writel(val, bank->reg_base + reg);
> +}

Again excessive abstraction IMO.

> +#define GPIO_BANK(_bank, _npins)                                       \
> +       {                                                               \
> +               .gpio_chip = {                                          \
> +                       .label = "GPIO" #_bank,                         \
> +                       .request = gpiochip_generic_request,            \
> +                       .free = gpiochip_generic_free,                  \
> +                       .get_direction = pic32_gpio_get_direction,      \
> +                       .direction_input = pic32_gpio_direction_input,  \
> +                       .direction_output = pic32_gpio_direction_output, \
> +                       .get = pic32_gpio_get,                          \
> +                       .set = pic32_gpio_set,                          \
> +                       .ngpio = _npins,                                \
> +                       .base = GPIO_BANK_START(_bank),                 \
> +                       .owner = THIS_MODULE,                           \
> +                       .can_sleep = 0,                                 \
> +               },                                                      \
> +               .irq_chip = {                                           \
> +                       .name = "GPIO" #_bank,                          \
> +                       .irq_startup = pic32_gpio_irq_startup,  \
> +                       .irq_ack = pic32_gpio_irq_ack,          \
> +                       .irq_mask = pic32_gpio_irq_mask,                \
> +                       .irq_unmask = pic32_gpio_irq_unmask,            \
> +                       .irq_set_type = pic32_gpio_irq_set_type,        \
> +               },                                                      \
> +       }
> +
> +static struct pic32_gpio_bank pic32_gpio_banks[] = {
> +       GPIO_BANK(0, PINS_PER_BANK),
> +       GPIO_BANK(1, PINS_PER_BANK),
> +       GPIO_BANK(2, PINS_PER_BANK),
> +       GPIO_BANK(3, PINS_PER_BANK),
> +       GPIO_BANK(4, PINS_PER_BANK),
> +       GPIO_BANK(5, PINS_PER_BANK),
> +       GPIO_BANK(6, PINS_PER_BANK),
> +       GPIO_BANK(7, PINS_PER_BANK),
> +       GPIO_BANK(8, PINS_PER_BANK),
> +       GPIO_BANK(9, PINS_PER_BANK),
> +};

Ewwwww.... I guess it's OK though. I would have made it with
some dynamic allocation and a for() loop in code.

> +       bank->gpio_chip.dev = &pdev->dev;

This is named .parent in the upstream kernel so you need to change it.

> +       bank->gpio_chip.of_node = np;
> +       ret = gpiochip_add(&bank->gpio_chip);

So use gpiochip_add_data()

Apart from this it looks pretty OK.

Yours,
Linus Walleij
