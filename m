From: Joel Stanley <joel@jms.id.au>
Subject: Re: [PATCH] pinctrl: aspeed: Add initial pinconf support
Date: Wed, 22 Feb 2017 14:09:14 +1030
Message-ID: <CACPK8XeXW_YjGkV0S5OJj2b814DA1tT33o-_0ToNvJ7UM4sy7w@mail.gmail.com>
References: <20170220143850.10723-1-andrew@aj.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-yw0-f196.google.com ([209.85.161.196]:33572 "EHLO
        mail-yw0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753661AbdBVDjk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 21 Feb 2017 22:39:40 -0500
In-Reply-To: <20170220143850.10723-1-andrew@aj.id.au>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Andrew Jeffery <andrew@aj.id.au>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, OpenBMC Maillist <openbmc@lists.ozlabs.org>

On Tue, Feb 21, 2017 at 1:08 AM, Andrew Jeffery <andrew@aj.id.au> wrote:
> Several pinconf parameters have a fairly straight-forward mapping onto
> the Aspeed pin controller. These include management of pull-down bias,
> drive-strength, and some debounce configuration.
>
> Pin biasing largely is managed on a per-GPIO-bank basis, aside from the
> ADC and RMII/RGMII pins. As the bias configuration for each pin in a
> bank maps onto a single per-bank bit, configuration tables are
> introduced to describe the ranges of pins and the supported pinconf
> parameter. The use of tables also helps with the sparse support of
> pinconf properties, and the fact that not all GPIO banks support
> biasing or drive-strength configuration.
>
> Further, as the pin controller uses a consistent approach for bias and
> drive strength configuration at the register level, a second table is
> defined for looking up the the bit-state required to enable or query the
> provided configuration.
>
> Testing for pinctrl-aspeed-g4 was performed on an OpenPOWER Palmetto
> system, and pinctrl-aspeed-g5 on an AST2500EVB. The test method was to
> set the appropriate bits via devmem and verify the result through the
> controller's pinconf-pins debugfs file. This simultaneously validates
> the get() path and half of the set() path. The remainder of the set()
> path was validated by configuring a handful of pins via the devicetree
> with the supported pinconf properties and verifying the appropriate
> registers were touched.
>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>

Looks good. I assume the bindings are generic and don't need any
update for this. Perhaps an update to the example would be helpful.

Some minor comments below.

> ---
>  drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c | 117 +++++++++++++++-
>  drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c | 153 ++++++++++++++++++++-
>  drivers/pinctrl/aspeed/pinctrl-aspeed.c    | 207 +++++++++++++++++++++++++++++
>  drivers/pinctrl/aspeed/pinctrl-aspeed.h    |  28 ++++
>  4 files changed, 503 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c b/drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c
> index 7de596e2b9d4..3e8625110136 100644
> --- a/drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c
> +++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c
> @@ -2234,6 +2234,110 @@ static const struct aspeed_pin_function aspeed_g4_functions[] = {
>         ASPEED_PINCTRL_FUNC(WDTRST2),
>  };
>
> +static struct aspeed_pin_config aspeed_g4_configs[] = {

I think this could be const.

> +       /* GPIO banks ranges [A, B], [D, J], [M, R] */
> +       { PIN_CONFIG_BIAS_PULL_DOWN, { D6,  D5  }, SCU8C, BIT(16) },
> +       { PIN_CONFIG_BIAS_DISABLE,   { D6,  D5  }, SCU8C, BIT(16) },
> +       { PIN_CONFIG_BIAS_PULL_DOWN, { J21, E18 }, SCU8C, BIT(17) },
> +       { PIN_CONFIG_BIAS_DISABLE,   { J21, E18 }, SCU8C, BIT(17) },

I didn't verify every definition is correct. I wondered why we skipped
bit 18, but it is reserved by the looks.

> +       { PIN_CONFIG_BIAS_PULL_DOWN, { A18, E15 }, SCU8C, BIT(19) },
> +       { PIN_CONFIG_BIAS_DISABLE,   { A18, E15 }, SCU8C, BIT(19) },
> +       { PIN_CONFIG_BIAS_PULL_DOWN, { D15, B14 }, SCU8C, BIT(20) },
> +       { PIN_CONFIG_BIAS_DISABLE,   { D15, B14 }, SCU8C, BIT(20) },

> diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c b/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c
> index 43221a3c7e23..b22523bdd79b 100644
> --- a/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c
> +++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c

>  static struct pinmux_ops aspeed_g5_pinmux_ops = {
> @@ -2308,16 +2450,25 @@ static struct pinctrl_ops aspeed_g5_pinctrl_ops = {
>         .get_group_name = aspeed_pinctrl_get_group_name,
>         .get_group_pins = aspeed_pinctrl_get_group_pins,
>         .pin_dbg_show = aspeed_pinctrl_pin_dbg_show,
> -       .dt_node_to_map = pinconf_generic_dt_node_to_map_pin,
> +       .dt_node_to_map = pinconf_generic_dt_node_to_map_all,
>         .dt_free_map = pinctrl_utils_free_map,
>  };
>
> +static struct pinconf_ops aspeed_g5_conf_ops = {

const here too?

> +       .is_generic = true,
> +       .pin_config_get = aspeed_pin_config_get,
> +       .pin_config_set = aspeed_pin_config_set,
> +       .pin_config_group_get = aspeed_pin_config_group_get,
> +       .pin_config_group_set = aspeed_pin_config_group_set,
> +};

> --- a/drivers/pinctrl/aspeed/pinctrl-aspeed.h
> +++ b/drivers/pinctrl/aspeed/pinctrl-aspeed.h
> @@ -514,6 +514,20 @@ struct aspeed_pin_desc {
>         SIG_EXPR_LIST_DECL_SINGLE(gpio, gpio); \
>         MS_PIN_DECL_(pin, SIG_EXPR_LIST_PTR(gpio))
>
> +/**
> + * @param The pinconf parameter type
> + * @pins The pin range this config struct covers, [low, high]
> + * @reg The register housing the configuration bits
> + * @mask The mask to select the bits of interest in @reg
> + */
> +struct aspeed_pin_config {
> +       enum pin_config_param param;
> +       unsigned int pins[2];
> +       unsigned int reg;
> +       u32 mask;
> +       u32 value;

Can we save some space by making these smaller types. pins could be
u16 at least.

> +};
> +
