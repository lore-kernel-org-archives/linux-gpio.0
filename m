From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/3] pinctrl: Add pincontrol driver for ARTPEC-6 SoC
Date: Thu, 30 Mar 2017 14:07:33 +0200
Message-ID: <CACRpkda_o9nU9jyHAEJxoownO-DXw72fr3yuxf2zGJkJvPbW7g@mail.gmail.com>
References: <20170330113302.GF29118@axis.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170330113302.GF29118@axis.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jesper Nilsson <jesper.nilsson@axis.com>
Cc: Jesper Nilsson <jespern@axis.com>, Lars Persson <larper@axis.com>, Niklas Cassel <niklass@axis.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "David S. Miller" <davem@davemloft.net>, Geert Uytterhoeven <geert+renesas@glider.be>, Mauro Carvalho Chehab <mchehab@kernel.org>, chris.paterson@linux.pieboy.co.uk, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, linux-arm-kernel@axis.com
List-Id: linux-gpio@vger.kernel.org

On Thu, Mar 30, 2017 at 1:33 PM, Jesper Nilsson <jesper.nilsson@axis.com> wrote:

> Add pinctrl driver support for the Axis ARTPEC-6 SoC.
> There are only some pins that actually have different
> functions available, but all can control bias (pull-up/-down)
> and drive strength.
> Code originally written by Chris Paterson.
>
> Signed-off-by: Jesper Nilsson <jesper.nilsson@axis.com>

Very good start, but look at this:


> +#define ARTPEC6_PINMUX_P0_0_CTRL       0x000
> +#define ARTPEC6_PINMUX_P0_1_CTRL       0x004
> +#define ARTPEC6_PINMUX_P0_2_CTRL       0x008
> +#define ARTPEC6_PINMUX_P0_3_CTRL       0x00C
> +#define ARTPEC6_PINMUX_P0_4_CTRL       0x010
> +#define ARTPEC6_PINMUX_P0_5_CTRL       0x014
> +#define ARTPEC6_PINMUX_P0_6_CTRL       0x018
> +#define ARTPEC6_PINMUX_P0_7_CTRL       0x01C
> +#define ARTPEC6_PINMUX_P0_8_CTRL       0x020
> +#define ARTPEC6_PINMUX_P0_9_CTRL       0x024
> +#define ARTPEC6_PINMUX_P0_10_CTRL      0x028
> +#define ARTPEC6_PINMUX_P0_11_CTRL      0x02C
> +#define ARTPEC6_PINMUX_P0_12_CTRL      0x030
> +#define ARTPEC6_PINMUX_P0_13_CTRL      0x034
> +#define ARTPEC6_PINMUX_P0_14_CTRL      0x038
> +#define ARTPEC6_PINMUX_P0_15_CTRL      0x03C

It's pretty clear that the stride is always 4 bytes is it not.


> +static const unsigned int pin_regs[] = {
> +       ARTPEC6_PINMUX_P0_0_CTRL,       /* Pin 0 */
> +       ARTPEC6_PINMUX_P0_1_CTRL,
> +       ARTPEC6_PINMUX_P0_2_CTRL,
> +       ARTPEC6_PINMUX_P0_3_CTRL,
> +       ARTPEC6_PINMUX_P0_4_CTRL,
> +       ARTPEC6_PINMUX_P0_5_CTRL,
> +       ARTPEC6_PINMUX_P0_6_CTRL,
> +       ARTPEC6_PINMUX_P0_7_CTRL,
> +       ARTPEC6_PINMUX_P0_8_CTRL,
> +       ARTPEC6_PINMUX_P0_9_CTRL,
> +       ARTPEC6_PINMUX_P0_10_CTRL,
> +       ARTPEC6_PINMUX_P0_11_CTRL,
> +       ARTPEC6_PINMUX_P0_12_CTRL,
> +       ARTPEC6_PINMUX_P0_13_CTRL,
> +       ARTPEC6_PINMUX_P0_14_CTRL,
> +       ARTPEC6_PINMUX_P0_15_CTRL,

The oceans of redundant information are rising ;)

> +static const unsigned int uart0_regs0[] = {
> +       ARTPEC6_PINMUX_P1_0_CTRL,
> +       ARTPEC6_PINMUX_P1_1_CTRL,
> +       ARTPEC6_PINMUX_P1_2_CTRL,
> +       ARTPEC6_PINMUX_P1_3_CTRL,
> +       ARTPEC6_PINMUX_P1_4_CTRL,
> +       ARTPEC6_PINMUX_P1_5_CTRL,
> +       ARTPEC6_PINMUX_P1_6_CTRL,
> +       ARTPEC6_PINMUX_P1_7_CTRL,
> +       ARTPEC6_PINMUX_P1_8_CTRL,
> +       ARTPEC6_PINMUX_P1_9_CTRL,
> +};

And rising.

> +       {
> +               .name = "uart0grp0",
> +               .pins = uart0_pins0,
> +               .num_pins = ARRAY_SIZE(uart0_pins0),
> +               .reg_offsets = uart0_regs0,
> +               .num_regs = ARRAY_SIZE(uart0_regs0),
> +               .config = ARTPEC6_CONFIG_1,
> +       },

So what if the struct artpec6_pin_group...

> +struct artpec6_pin_group {
> +       const char         *name;
> +       const unsigned int *pins;
> +       const unsigned int num_pins;
> +       const unsigned int *reg_offsets;
> +       const unsigned int num_regs;
> +       unsigned char      config;
> +};

Instead of reg_offsets had reg_offset_base, and you just
calculate it with base + pin * 4 when you need it?

I also highly suspect that num_pins and num_regs above
are exactly the same number in all cases, correct? You
probably only need num_pins.

> +static struct artpec6_pmx_func artpec6_pmx_functions[] = {

Needs const

> +static void artpec6_pmx_select_func(struct pinctrl_dev *pctldev,
> +                                   unsigned int function, unsigned int group,
> +                                   bool enable)
> +{
> +       unsigned int regval, val;
> +       int i;
> +       const unsigned int *pmx_regs;
> +       struct artpec6_pmx *pmx = pinctrl_dev_get_drvdata(pctldev);
> +
> +       pmx_regs = artpec6_pin_groups[group].reg_offsets;
> +
> +       for (i = 0; i < artpec6_pin_groups[group].num_regs; i++) {
> +               /* Ports 4-8 do not have a SEL field and are always selected */
> +               if (pmx_regs[i] >= ARTPEC6_PINMUX_P4_0_CTRL)
> +                       continue;
> +
> +               if (!strcmp(artpec6_pmx_get_fname(pctldev, function), "gpio")) {
> +                       /* GPIO is always config 0 */
> +                       val = ARTPEC6_CONFIG_0 << ARTPEC6_PINMUX_SEL_SHIFT;
> +               } else {
> +                       if (enable)
> +                               val = artpec6_pin_groups[group].config
> +                                       << ARTPEC6_PINMUX_SEL_SHIFT;
> +                       else
> +                               val = ARTPEC6_CONFIG_0
> +                                       << ARTPEC6_PINMUX_SEL_SHIFT;
> +               }
> +
> +               regval = readl(pmx->base + pmx_regs[i]);
> +               regval &= ~ARTPEC6_PINMUX_SEL_MASK;
> +               regval |= val;
> +               writel(regval, pmx->base + pmx_regs[i]);
> +       }

So thus look can be different and include something like +=4 for the registers
for each iteration.

> --- /dev/null
> +++ b/drivers/pinctrl/pinctrl-artpec6.h

You don't need to have these defines in their own file, just copy it into
the top of the driver file.

> +/* Pinmux control register offset definitions */
> +
> +#define ARTPEC6_PINMUX_P1_0_CTRL       0x040
> +#define ARTPEC6_PINMUX_P1_1_CTRL       0x044
(...)

So for these defines you only need the first one.

With these things fixes I'm pretty sure it is close to finished.

Yours,
Linus Walleij
