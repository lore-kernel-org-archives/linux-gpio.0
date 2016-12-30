From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/6] pinctrl: armada-37xx: Add pin controller support for
 Armada 37xx
Date: Fri, 30 Dec 2016 09:44:49 +0100
Message-ID: <CACRpkdbnfkb8tDtjzbQdhg8JxV1S5FdFjPx7B8NAT+nkeUO=Lw@mail.gmail.com>
References: <20161222172501.16121-1-gregory.clement@free-electrons.com> <20161222172501.16121-3-gregory.clement@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qt0-f176.google.com ([209.85.216.176]:35546 "EHLO
        mail-qt0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751683AbcL3Iou (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 30 Dec 2016 03:44:50 -0500
Received: by mail-qt0-f176.google.com with SMTP id c47so390505130qtc.2
        for <linux-gpio@vger.kernel.org>; Fri, 30 Dec 2016 00:44:50 -0800 (PST)
In-Reply-To: <20161222172501.16121-3-gregory.clement@free-electrons.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Gregory CLEMENT <gregory.clement@free-electrons.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Nadav Haklai <nadavh@marvell.com>, Victor Gu <xigu@marvell.com>, Omri Itach <omrii@marvell.com>, Marcin Wojtas <mw@semihalf.com>, Wilson Ding <dingwei@marvell.com>, Hua Jing <jinghua@marvell.com>, Terry Zhou <bjzhou@marvell.com>

On Thu, Dec 22, 2016 at 6:24 PM, Gregory CLEMENT
<gregory.clement@free-electrons.com> wrote:

> The Armada 37xx SoC come with 2 pin controllers: one on the south
> bridge (managing 28 pins) and one on the north bridge (managing 36 pins).
>
> At the hardware level the controller configure the pins by group and not
> pin by pin. This constraint is reflected in the design of the driver:
> only the group related functions are implemented.
>
> Signed-off-by: Gregory CLEMENT <gregory.clement@free-electrons.com>

Overall this looks good.

> diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
> index 715ef1256838..0786e3e0f5c6 100644
> --- a/arch/arm64/Kconfig.platforms
> +++ b/arch/arm64/Kconfig.platforms
> @@ -105,6 +105,8 @@ config ARCH_MVEBU
>         select ARMADA_37XX_CLK
>         select MVEBU_ODMI
>         select MVEBU_PIC
> +       select PINCTRL
> +       select PINCTRL_ARMADA_37XX

Do you already select MFD_SYSCON? It seems to be required.

I can't merge patches to ARM SoC and prefer not to. Split this into a separate
patch for ARM SoC in the Armada/Marvell tree.

> -obj-$(CONFIG_PINCTRL_MVEBU)    += mvebu/
> +obj-y                          += mvebu/

Just make sure everything is guarded with proper symbols.

> +config PINCTRL_ARMADA_37XX
> +       bool
> +       select PINMUX
> +       select PINCONF
> +       select GENERIC_PINCONF

Nice!

> +struct armada_37xx_pin_group {
> +       const char      *name;
> +       unsigned int    start_pin;
> +       unsigned int    npins;
> +       u32             reg_mask;
> +       unsigned int    extra_pin;
> +       unsigned int    extra_npins;
> +       const char      *funcs[NB_FUNCS];
> +       unsigned int    *pins;
> +};

I would prefer if you add some kerneldoc to this struct.
Especially the extra_pin things are not evident so explain this
in detail here.

> +struct armada_37xx_pin_data {
> +       u8                              nr_pins;
> +       char                            *name;
> +       struct armada_37xx_pin_group    *groups;
> +       int                             ngroups;
> +};
> +
> +struct armada_37xx_pmx_func {
> +       const char              *name;
> +       const char              **groups;
> +       unsigned int            ngroups;
> +};
> +
> +struct armada_37xx_pinctrl {
> +       struct regmap                   *regmap;
> +       struct armada_37xx_pin_data     *data;
> +       struct device                   *dev;
> +       struct pinctrl_desc             pctl;
> +       struct pinctrl_dev              *pctl_dev;
> +       struct armada_37xx_pin_group    *groups;
> +       unsigned int                    ngroups;
> +       struct armada_37xx_pmx_func     *funcs;
> +       unsigned int                    nfuncs;
> +};

You do not need to document these. They are self-explanatory.

> +static int armada_37xx_pin_config_group_get(struct pinctrl_dev *pctldev,
> +                           unsigned int selector, unsigned long *config)
> +{
> +       return -ENOTSUPP;
> +}
> +
> +static int armada_37xx_pin_config_group_set(struct pinctrl_dev *pctldev,
> +                           unsigned int selector, unsigned long *configs,
> +                           unsigned int num_configs)
> +{
> +       return -ENOTSUPP;
> +}
> +
> +static struct pinconf_ops armada_37xx_pinconf_ops = {
> +       .is_generic = true,
> +       .pin_config_group_get = armada_37xx_pin_config_group_get,
> +       .pin_config_group_set = armada_37xx_pin_config_group_set,
> +};

Don't we support just leaving group set/get uninitialized? Too bad in that case.

> +static int _add_function(struct armada_37xx_pmx_func *funcs, int *funcsize,
> +                        const char *name)

No _foo opaque underscore prefix please. Git this a reasonable name
like armada_37xx_add_function() or so.

Apart from that it looks good.

Yours,
Linus Walleij
