From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 05/13] pinctrl: Add Microsemi Ocelot SoC driver
Date: Wed, 13 Dec 2017 09:15:20 +0100
Message-ID: <CACRpkdZ=+pFZYteq=wM=z-CGejY+dX_SqhtDbbGBn+q60arQ4w@mail.gmail.com>
References: <20171208154618.20105-1-alexandre.belloni@free-electrons.com> <20171208154618.20105-6-alexandre.belloni@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171208154618.20105-6-alexandre.belloni@free-electrons.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Cc: Ralf Baechle <ralf@linux-mips.org>, Linux MIPS <linux-mips@linux-mips.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-gpio@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

On Fri, Dec 8, 2017 at 4:46 PM, Alexandre Belloni
<alexandre.belloni@free-electrons.com> wrote:

> The Microsemi Ocelot SoC has a few pins that can be used as GPIOs or take
> multiple other functions. Add a driver for the pinmuxing and the GPIOs.
>
> There is currently no support for interrupts.
>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: linux-gpio@vger.kernel.org
> Signed-off-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>

This looks very good. Nice work!

I was close to just applying it but found some very minor things.
When you resend this just send this patch and I can apply it directly
since there are only Kconfig symbol dependencies and no
compile-time dependencies in this patch.

> +config PINCTRL_OCELOT
> +       bool "Pinctrl driver for the Microsemi Ocelot SoCs"
> +       default y
> +       depends on OF
> +       depends on MSCC_OCELOT || COMPILE_TEST
> +       select GENERIC_PINCONF
> +       select GENERIC_PINCTRL_GROUPS
> +       select GENERIC_PINMUX_FUNCTIONS
> +       select REGMAP_MMIO

select GPIOLIB

When you run COMPILE_TEST you don't know if you have
GPIOLIB so select it.

> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)

Wow never saw that before. OK I guess.

> +#include <linux/compiler.h>
> +#include <linux/gpio.h>

Just:
#include <linux/gpio/driver.h>

<linux/gpio.h> is a legacy include and should not be used.

> +static int ocelot_pinmux_set_mux(struct pinctrl_dev *pctldev,
> +                                unsigned int selector, unsigned int group)
> +{
> +       struct ocelot_pinctrl *info = pinctrl_dev_get_drvdata(pctldev);
> +       struct ocelot_pin_caps *pin = ocelot_pins[group].drv_data;
> +       int f;
> +
> +       f = ocelot_pin_function_idx(group, selector);
> +       if (f < 0)
> +               return -EINVAL;
> +
> +       regmap_update_bits(info->map, OCELOT_GPIO_ALT0, BIT(pin->pin),
> +                          f << pin->pin);
> +       regmap_update_bits(info->map, OCELOT_GPIO_ALT1, BIT(pin->pin),
> +                          f << (pin->pin - 1));

You need to add some comment on what is happening here and how the
bits are used because just reading these two lines is pretty hard.

I guess f = 0, 1, 2 .... 31 or so.

pin->pin is also 0, 1, 2 ... 31?

BIT(pin->pin) is pretty self-evident. It is masking the bit controlling
this pin in each register.

But setting bits (f << (pin->pin)) and then in the other register
(f << (pin->pin -1))?

Maybe you should even add an illustrative dev_dbg() print here
showing which bits you mask and set, or use some helper bools
so it is crystal clear what is going on.

So there is two registers to select "alternative functions" (I guess?)
And each has one bit for the *same* pin.

This is the case also in drivers/pinctrl/nomadik/pinctrl-nomadik.c.
It turns out to be a pretty horrible design decision: since the two
bits are not changed in the same register transaction, switching
from say function "00" to function "11" creates a "glitch" where
you first activate funcion "10" after writing the first register,
then finally go to function "11" after writing the second.

This had horrible electrical consequences and required special
workarounds in Nomadik so be on the lookout for this type
of problem.

> +static int ocelot_gpio_set_direction(struct pinctrl_dev *pctldev,
> +                                    struct pinctrl_gpio_range *range,
> +                                    unsigned int pin, bool input)
> +{
> +       struct ocelot_pinctrl *info = pinctrl_dev_get_drvdata(pctldev);
> +
> +       regmap_update_bits(info->map, OCELOT_GPIO_OE, BIT(pin),
> +                          input ? BIT(pin) : 0);
> +
> +       return 0;
> +}
(...)
> +static const struct pinmux_ops ocelot_pmx_ops = {
> +       .get_functions_count = ocelot_get_functions_count,
> +       .get_function_name = ocelot_get_function_name,
> +       .get_function_groups = ocelot_get_function_groups,
> +       .set_mux = ocelot_pinmux_set_mux,
> +       .gpio_set_direction = ocelot_gpio_set_direction,
> +       .gpio_request_enable = ocelot_gpio_request_enable,
> +};

This looks a bit weird since the same register is also written
by the gpiochip to set direction.

If you want to relay the direction setting entirely to the pin
control subsystem, then just have your callbacks in the
gpiochip like this:

static int ocelot_gpio_direction_input(struct gpio_chip *chip, unsigned offset)
{
        return pinctrl_gpio_direction_input(chip->base + offset);
}

static int ocelot_gpio_direction_output(struct gpio_chip *chip, unsigned offset,
                                       int value)
{
       struct ocelot_pinctrl *info = gpiochip_get_data(chip);
       unsigned int pin = BIT(offset);

       if (value)
               regmap_write(info->map, OCELOT_GPIO_OUT_SET, pin);
       else
               regmap_write(info->map, OCELOT_GPIO_OUT_CLR, pin);

        return pinctrl_gpio_direction_output(chip->base + offset);
}

Then all direction setting will just be relayed to the pin control
side.

Shouldn't this call also set up the altfunction so you know
the pin is now set in GPIO mode? That is how some other
drivers do it at least. But maybe you prefer to do the
muxing "on the side" (using pinmux ops only, and explicitly
setting up the line as GPIO in e.g. the device tree)?

In that case I think you might not need this callback at all.

Also: are you should you do not need to disable OCELOT_GPIO_OE
in the .gpio_disable_free() callback?

> +static const struct pinctrl_ops ocelot_pctl_ops = {
> +       .get_groups_count = ocelot_pctl_get_groups_count,
> +       .get_group_name = ocelot_pctl_get_group_name,
> +       .get_group_pins = ocelot_pctl_get_group_pins,
> +       .dt_node_to_map = pinconf_generic_dt_node_to_map_pin,
> +       .dt_free_map = pinconf_generic_dt_free_map,
> +};

Nice use of the generic parsers, thanks!

> +       ret = devm_gpiochip_add_data(&pdev->dev, gc, info);
> +       if (ret)
> +               return ret;
> +       //TODO irqchip

/* Please use oldschool comments for now, the license on the top is
fine though */

> +static const struct regmap_config ocelot_pinctrl_regmap_config = {
> +       .reg_bits = 32,
> +       .val_bits = 32,
> +       .reg_stride = 4,
> +};

Looks like it could have some more limitations (like max register
and so on) but it's OK.

> +       base = devm_ioremap_resource(dev,
> +                       platform_get_resource(pdev, IORESOURCE_MEM, 0));
> +       if (IS_ERR(base)) {
> +               dev_err(dev, "Failed to ioremap registers\n");
> +               return PTR_ERR(base);
> +       }
> +
> +       info->map = devm_regmap_init_mmio(dev, base,
> +                                         &ocelot_pinctrl_regmap_config);
> +       if (IS_ERR(info->map)) {
> +               dev_err(dev, "Failed to create regmap\n");
> +               return PTR_ERR(info->map);
> +       }

Nice use of regmap MMIO!

Yours,
Linus Walleij
