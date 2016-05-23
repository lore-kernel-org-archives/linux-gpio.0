From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [RFC PATCH] drivers/pinctrl: Add pinctrl-ast2400
Date: Mon, 23 May 2016 14:38:24 +0200
Message-ID: <CACRpkdb+xG53oRYro5NecwDL=JTfsxb=3AFgruPj4j=U+Gbh=A@mail.gmail.com>
References: <1462515608-20566-1-git-send-email-andrew@aj.id.au>
	<1462515608-20566-2-git-send-email-andrew@aj.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1462515608-20566-2-git-send-email-andrew@aj.id.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Jeffery <andrew@aj.id.au>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Milton Miller II <miltonm@us.ibm.com>, Joel Stanley <joel@jms.id.au>, Jeremy Kerr <jk@ozlabs.org>
List-Id: linux-gpio@vger.kernel.org

Hi sorry for taking so long before reviewing. Too busy, what can I say.

On Fri, May 6, 2016 at 8:20 AM, Andrew Jeffery <andrew@aj.id.au> wrote:

> Add pinctrl/pinmux support for the Aspeed AST2400 SoC. Configuration of
> the SoC is somewhat involved: Enabling functions can involve writes of
> multiple bits to multiple registers, and signals provided by a pin are
> determined on a priority basis. That is, without care, it's possible to
> configure a function in the mux and to not gain expected functionality.
>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>

> +#include <linux/bitops.h>
> +#include <linux/io.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>

You should include your changes to Kconfig and Makefile in the patch
so it is a complete driver. This is an example of why: if I can't see if
your driver is really tristate in Kconfig I don't know whether <linux/module.h>
should be included or not.

If it is a bool don't include this.
If it is a bool, don't use any MODULE_* macros either.

> +/* Challenges in the AST2400 Multifunction Pin Design
> + * --------------------------------------------------
> + *
> + * * Reasonable number of pins (216)
> + *
> + * * The SoC function enabled on a pin is determined on a priority basis
> + *
> + * * Using the priority system, pins can provide up to 3 different signals
> + *   types
> + *
> + * * The signal active on a pin is often described by compound logical
> + *   expressions involving multiple operators, registers and bits
> + *
> + *   * The high and low priority functions' bit masks are frequently not the
> + *     same
> + *     (i.e. cannot just flip a bit to change from high to low), or even in the
> + *     same register.
> + *
> + *   * Not all functions are disabled by unsetting bits, some require setting
> + *     bits
> + *
> + *   * Not all signals can be deactivated as some expressions depend on values
> + *     in the hardware strapping register, which is treated as read-only.

Try to compresse the bullet list to text. This looks like a powerpoint
presentation.

> + * SoC Multi-function Pin Expression Examples
> + * ------------------------------------------
> + *
> + * Here are some sample mux configurations from the datasheet to illustrate the
> + * corner cases, roughly in order of least to most corner. In the table, HP and
> + * LP are high- and low- priority respectively.

I believe that you got the hardware details right. Only someone with
experience with the same hardware could review these gory details.
So I will just trust that you got that part right.

> + * * Pins provide two to three signals in a priority order
> + *
> + * * For priorities levels defined on a pin, each priority provides one signal
> + *
> + * * Enabling lower priority signals requires higher priority signals be
> + *   disabled
(...)
> + * * A signal at a given priority on a given pin is active if any of the
> + *   functions in which the signal participates are active, and no higher
> + *   priority signal on the pin is active

That's a pretty baroque design. I wonder who came up with the idea
that this needed to be a priority-based state machine thing. Did they
have a usecase of different software threads independently competing
about using the hardware or what?

Or is it some hardware aid to help the programmer from shooting
him/herself in the foot?

> +#define A4 2
> +SSSF_PIN_DECL(A4, GPIOA2, TIMER3, FUNC_DESC_SET(SCU80, 2));
> +
> +FUNC_EXPR_DECL_SINGLE(SD1, FUNC_DESC_SET(SCU90, 0));
> +
> +FUNC_EXPR_DECL_SINGLE(I2C10, FUNC_DESC_SET(SCU90, 23));
> +
> +#define C4 16
> +MS_PIN_DECL(C4, GPIOC0, SD1, I2C10);
> +#define B3 17
> +MS_PIN_DECL(B3, GPIOC1, SD1, I2C10);

These things look very terse. But I guess there is no way to alleviate
the terseness that you can think of?

> +/* Note we account for GPIOY4-GPIOY7 even though they're not valid, thus 216
> + * pins becomes 220.
> + */
> +#define AST2400_NR_GPIOS 220

Rename AST2400_NR_PINS, they are not just GPIO's right?

> +static struct pinctrl_ops ast2400_pinctrl_ops = {
> +       .get_groups_count = ast2400_pinctrl_get_groups_count,
> +       .get_group_name = ast2400_pinctrl_get_group_name,
> +       .get_group_pins = ast2400_pinctrl_get_group_pins,
> +       .pin_dbg_show = ast2400_pinctrl_pin_dbg_show,
> +       .dt_node_to_map = pinconf_generic_dt_node_to_map_pin,
> +       .dt_free_map = pinctrl_utils_dt_free_map,

This has been renamed in the upstream kernel so rebase the patch
on v4.6-rc1 when it's out.

> +static bool func_expr_disable(const struct func_expr *expr, void __iomem *base)
> +static inline bool maybe_disable(const struct func_expr **expr,
> +               void __iomem *base)
> +static bool sig_in_exprs(const struct func_expr **exprs,
> +               const struct func_expr *sig)

Those functions are very hard to understand, maybe you could
kerneldoc them? Just a few line about what each does.

> +static int ast2400_gpio_request_enable(struct pinctrl_dev *pctldev,
> +               struct pinctrl_gpio_range *range,
> +               unsigned offset)
> +{
> +       unsigned pin = range->base + offset;
> +       const struct ast2400_pinctrl_data *pdata =
> +               pinctrl_dev_get_drvdata(pctldev);
> +       const struct pin_prio *pprio =
> +               pdata->pins[pin].drv_data;
> +
> +       if (!pprio)
> +               return 0;
> +
> +       if (!maybe_disable(pprio->high, pdata->reg_base))
> +               return -1;
> +
> +       if (!maybe_disable(pprio->low, pdata->reg_base))
> +               return -1;

No returning opaque -1, use -ENODEV or something sensible.

> +static struct pinctrl_gpio_range ast2400_gpios = {
> +       .name = "ast2400-pctrl-gpio-range",
> +       .npins = ARRAY_SIZE(ast2400_pins),
> +};

Nope.

> +       /* grange.name = "exynos5440-pctrl-gpio-range"; */
> +       pinctrl_add_gpio_range(pctl, &ast2400_gpios);

And nope.

A device tree driver should define the GPIO ranges in the
device tree using gpio-ranges = <...>. There is documentation and
examples of how to do this in
Documentation/devicetree/bindings/gpio/gpio.txt

Yours,
Linus Walleij
