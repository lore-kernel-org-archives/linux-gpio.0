From: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH v2 06/10] pinctrl: rockchip: add support for rk1108
Date: Tue, 15 Nov 2016 00:23:42 +0100
Message-ID: <1626303.kfRfHpSgHU@phil>
References: <1479124550-24037-1-git-send-email-andy.yan@rock-chips.com> <1479125447-24406-1-git-send-email-andy.yan@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1479125447-24406-1-git-send-email-andy.yan@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Yan <andy.yan@rock-chips.com>
Cc: shawn.lin@rock-chips.com, linux-rockchip@lists.infradead.org, linus.walleij@linaro.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

Am Montag, 14. November 2016, 20:10:47 CET schrieb Andy Yan:
> This add pinctrl support for Rockchip RK1108 Soc.
> 
> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>

still looks mostly good. I think I've now compared every register offset with 
the TRM - they all look good. I've noticed two styling issues below, with 
those fixed:

Reviewed-by: Heiko Stuebner <heiko@sntech.de>

> ---
> Changes in v2:
> - add pull and drive-strength functionality
> 
>  drivers/pinctrl/pinctrl-rockchip.c | 87
> +++++++++++++++++++++++++++++++++++++- 1 file changed, 86 insertions(+), 1
> deletion(-)
> 
> diff --git a/drivers/pinctrl/pinctrl-rockchip.c
> b/drivers/pinctrl/pinctrl-rockchip.c index 49bf7dc..fcc89fb 100644
> --- a/drivers/pinctrl/pinctrl-rockchip.c
> +++ b/drivers/pinctrl/pinctrl-rockchip.c
> @@ -59,6 +59,7 @@
>  #define GPIO_LS_SYNC		0x60
> 
>  enum rockchip_pinctrl_type {
> +	RK1108,
>  	RK2928,
>  	RK3066B,
>  	RK3188,
> @@ -624,6 +625,65 @@ static int rockchip_set_mux(struct rockchip_pin_bank
> *bank, int pin, int mux) return ret;
>  }
> 
> +#define RK1108_PULL_PMU_OFFSET		0x10
> +#define RK1108_PULL_OFFSET		0x110
> +#define RK1108_PULL_PINS_PER_REG	8
> +#define RK1108_PULL_BITS_PER_PIN	2
> +#define RK1108_PULL_BANK_STRIDE		16
> +
> +static void rk1108_calc_pull_reg_and_bit(struct rockchip_pin_bank *bank,
> +					 int pin_num, struct regmap **regmap,
> +					 int *reg, u8 *bit)
> +{
> +	struct rockchip_pinctrl *info = bank->drvdata;
> +
> +	/* The first 24 pins of the first bank are located in PMU */
> +	if (bank->bank_num == 0) {
> +		*regmap = info->regmap_pmu;
> +		*reg = RK1108_PULL_PMU_OFFSET;
> +	} else {
> +		*reg = RK1108_PULL_OFFSET;
> +		*regmap = info->regmap_base;
> +		/* correct the offset, as we're starting with the 2nd bank */
> +		*reg -= 0x10;
> +		*reg += bank->bank_num * RK1108_PULL_BANK_STRIDE;
> +	}
> +
> +	*reg += ((pin_num / RK1108_PULL_PINS_PER_REG) * 4);
> +	*bit = (pin_num % RK1108_PULL_PINS_PER_REG);
> +	*bit *= RK1108_PULL_BITS_PER_PIN;
> +}
> +
> +#define RK1108_DRV_PMU_OFFSET           0x20
> +#define RK1108_DRV_GRF_OFFSET           0x210
> +#define RK1108_DRV_BITS_PER_PIN         2
> +#define RK1108_DRV_PINS_PER_REG         8
> +#define RK1108_DRV_BANK_STRIDE          16

styling nitpick, spaces instead of tabs between name and value. The pull 
constants are correct though and only the drv constants need a fixup.

> +
> +static void rk1108_calc_drv_reg_and_bit(struct rockchip_pin_bank *bank,
> +					int pin_num, struct regmap **regmap,
> +					int *reg, u8 *bit)
> +{
> +	struct rockchip_pinctrl *info = bank->drvdata;
> +
> +	/* The first 24 pins of the first bank are located in PMU */
> +	if (bank->bank_num == 0) {
> +		*regmap = info->regmap_pmu;
> +		*reg = RK1108_DRV_PMU_OFFSET;
> +	} else {
> +		*regmap = info->regmap_base;
> +		*reg = RK1108_DRV_GRF_OFFSET;
> +
> +		/* correct the offset, as we're starting with the 2nd bank */
> +		*reg -= 0x10;
> +		*reg += bank->bank_num * RK1108_DRV_BANK_STRIDE;
> +	}
> +
> +	*reg += ((pin_num / RK1108_DRV_PINS_PER_REG) * 4);
> +	*bit = pin_num % RK1108_DRV_PINS_PER_REG;
> +	*bit *= RK1108_DRV_BITS_PER_PIN;
> +}
> +
>  #define RK2928_PULL_OFFSET		0x118
>  #define RK2928_PULL_PINS_PER_REG	16
>  #define RK2928_PULL_BANK_STRIDE		8

[...]

> @@ -1385,7 +1448,6 @@ static int rockchip_pinconf_set(struct pinctrl_dev
> *pctldev, unsigned int pin, for (i = 0; i < num_configs; i++) {
>  		param = pinconf_to_config_param(configs[i]);
>  		arg = pinconf_to_config_argument(configs[i]);
> -

unrelated change that should be removed.

>  		switch (param) {
>  		case PIN_CONFIG_BIAS_DISABLE:
>  			rc =  rockchip_set_pull(bank, pin - bank->pin_base,
