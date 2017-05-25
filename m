From: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH 2/4] pinctrl: rockchip: Add iomux-route switching support for rk3228
Date: Thu, 25 May 2017 23:12:45 +0200
Message-ID: <3063930.sJt1b8WyHP@phil>
References: <1495717952-9762-1-git-send-email-david.wu@rock-chips.com> <1495717952-9762-3-git-send-email-david.wu@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from gloria.sntech.de ([95.129.55.99]:41108 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S932369AbdEYVM5 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 25 May 2017 17:12:57 -0400
In-Reply-To: <1495717952-9762-3-git-send-email-david.wu@rock-chips.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: David Wu <david.wu@rock-chips.com>
Cc: linus.walleij@linaro.org, huangtao@rock-chips.com, dianders@chromium.org, linux-rockchip@lists.infradead.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org

Hi David,

Am Donnerstag, 25. Mai 2017, 21:12:30 CEST schrieb David Wu:
> There are 9 IP blocks pin routes need to be switched, that are
> pwm-0, pwm-1, pwm-2, pwm-3, sdio, spi, emmc, uart2, uart1.
> 
> Signed-off-by: David Wu <david.wu@rock-chips.com>

This series come pretty close to what I had in mind, but I do have some
change requests inline below.

The comments are in this patch but apply to the whole series.


> ---
>  drivers/pinctrl/pinctrl-rockchip.c | 176 ++++++++++++++++++++++++++++++++++++-
>  1 file changed, 172 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/pinctrl/pinctrl-rockchip.c b/drivers/pinctrl/pinctrl-rockchip.c
> index f5dd1c3..be4c16e 100644
> --- a/drivers/pinctrl/pinctrl-rockchip.c
> +++ b/drivers/pinctrl/pinctrl-rockchip.c
> @@ -187,6 +187,20 @@ struct rockchip_pin_bank {
>  		},					\
>  	}
>  
> +#define PIN_BANK_ROUTE(id, pins, label, route)		\
> +	{						\
> +		.bank_num	= id,			\
> +		.nr_pins	= pins,			\
> +		.name		= label,		\
> +		.route_mask	= route,		\
> +		.iomux		= {			\
> +			{ .offset = -1 },		\
> +			{ .offset = -1 },		\
> +			{ .offset = -1 },		\
> +			{ .offset = -1 },		\
> +		},					\
> +	}
> +
>  #define PIN_BANK_IOMUX_FLAGS(id, pins, label, iom0, iom1, iom2, iom3)	\
>  	{								\
>  		.bank_num	= id,					\
> @@ -605,6 +619,159 @@ static void rk3328_recalc_mux(u8 bank_num, int pin, int *reg,
>  	*bit = data->bit;
>  }
>  
> +static const struct rockchip_mux_route_data  rk3228_mux_route_data[] = {
> +	{
> +		/* pwm0-0 */
> +		.bank = 0,
> +		.pin = 26,
> +		.func = 1,
> +		.route_offset = 0x50,
> +		.route_val = BIT(16),
> +	}, {
> +		/* pwm0-1 */
> +		.bank = 3,
> +		.pin = 21,
> +		.func = 1,
> +		.route_offset = 0x50,
> +		.route_val = BIT(16) | BIT(0),
> +	}, {
> +		/* pwm1-0 */
> +		.bank = 0,
> +		.pin = 27,
> +		.func = 1,
> +		.route_offset = 0x50,
> +		.route_val = BIT(16 + 1),
> +	}, {
> +		/* pwm1-1 */
> +		.bank = 0,
> +		.pin = 30,
> +		.func = 2,
> +		.route_offset = 0x50,
> +		.route_val = BIT(16 + 1) | BIT(1),
> +	}, {
> +		/* pwm2-0 */
> +		.bank = 0,
> +		.pin = 28,
> +		.func = 1,
> +		.route_offset = 0x50,
> +		.route_val = BIT(16 + 2),
> +	}, {
> +		/* pwm2-1 */
> +		.bank = 1,
> +		.pin = 12,
> +		.func = 2,
> +		.route_offset = 0x50,
> +		.route_val = BIT(16 + 2) | BIT(2),
> +	}, {
> +		/* pwm3-0 */
> +		.bank = 3,
> +		.pin = 26,
> +		.func = 1,
> +		.route_offset = 0x50,
> +		.route_val = BIT(16 + 3),
> +	}, {
> +		/* pwm3-1 */
> +		.bank = 1,
> +		.pin = 11,
> +		.func = 2,
> +		.route_offset = 0x50,
> +		.route_val = BIT(16 + 3) | BIT(3),
> +	}, {
> +		/* sdio-0_d0 */
> +		.bank = 1,
> +		.pin = 1,
> +		.func = 1,
> +		.route_offset = 0x50,
> +		.route_val = BIT(16 + 4),
> +	}, {
> +		/* sdio-1_d0 */
> +		.bank = 3,
> +		.pin = 2,
> +		.func = 1,
> +		.route_offset = 0x50,
> +		.route_val = BIT(16 + 4) | BIT(4),
> +	}, {
> +		/* spi-0_rx */
> +		.bank = 0,
> +		.pin = 13,
> +		.func = 2,
> +		.route_offset = 0x50,
> +		.route_val = BIT(16 + 5),
> +	}, {
> +		/* spi-1_rx */
> +		.bank = 2,
> +		.pin = 0,
> +		.func = 2,
> +		.route_offset = 0x50,
> +		.route_val = BIT(16 + 5) | BIT(5),
> +	}, {
> +		/* emmc-0_cmd */
> +		.bank = 1,
> +		.pin = 22,
> +		.func = 2,
> +		.route_offset = 0x50,
> +		.route_val = BIT(16 + 7),
> +	}, {
> +		/* emmc-1_cmd */
> +		.bank = 2,
> +		.pin = 4,
> +		.func = 2,
> +		.route_offset = 0x50,
> +		.route_val = BIT(16 + 7) | BIT(7),
> +	}, {
> +		/* uart2-0_rx */
> +		.bank = 1,
> +		.pin = 19,
> +		.func = 2,
> +		.route_offset = 0x50,
> +		.route_val = BIT(16 + 8),
> +	}, {
> +		/* uart2-1_rx */
> +		.bank = 1,
> +		.pin = 10,
> +		.func = 2,
> +		.route_offset = 0x50,
> +		.route_val = BIT(16 + 8) | BIT(8),
> +	}, {
> +		/* uart1-0_rx */
> +		.bank = 1,
> +		.pin = 10,
> +		.func = 1,
> +		.route_offset = 0x50,
> +		.route_val = BIT(16 + 11),
> +	}, {
> +		/* uart1-1_rx */
> +		.bank = 3,
> +		.pin = 13,
> +		.func = 1,
> +		.route_offset = 0x50,
> +		.route_val = BIT(16 + 11) | BIT(11),
> +	},
> +};
> +
> +static bool rk3228_set_mux_route(u8 bank_num, int pin,
> +				 int mux, u32 *reg, u32 *value)

instead of referencing this function in the per-soc struct, please make
it generic and reference the route array + size in the per-soc struct.

Except for referencing a different array, the function is the same
everywhere, so there is no need to duplicate it for each soc.

> +{
> +	const struct rockchip_mux_route_data *data = NULL;
> +	int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(rk3228_mux_route_data); i++)
> +		if ((rk3228_mux_route_data[i].bank == bank_num) &&
> +		    (rk3228_mux_route_data[i].pin == pin) &&
> +		    (rk3228_mux_route_data[i].func == mux)) {
> +			data = &rk3228_mux_route_data[i];
> +			break;
> +		}
> +
> +	if (!data)
> +		return false;
> +
> +	*reg = data->route_offset;
> +	*value = data->route_val;
> +
> +	return true;
> +}
> +
>  static int rockchip_get_mux(struct rockchip_pin_bank *bank, int pin)
>  {
>  	struct rockchip_pinctrl *info = bank->drvdata;
> @@ -2852,10 +3019,10 @@ static int rockchip_pinctrl_probe(struct platform_device *pdev)
>  };
>  
>  static struct rockchip_pin_bank rk3228_pin_banks[] = {
> -	PIN_BANK(0, 32, "gpio0"),
> -	PIN_BANK(1, 32, "gpio1"),
> -	PIN_BANK(2, 32, "gpio2"),
> -	PIN_BANK(3, 32, "gpio3"),
> +	PIN_BANK_ROUTE(0, 32, "gpio0", 0x5c002000),
> +	PIN_BANK_ROUTE(1, 32, "gpio1", 0x00483c02),
> +	PIN_BANK_ROUTE(2, 32, "gpio2", 0x00000011),
> +	PIN_BANK_ROUTE(3, 32, "gpio3", 0x04202004),

Requiring developers to calculate this pin-bit-value for each bank
is cumbersome and error-prone. With the routes-struct known in
the driver (see above and below), you can keep the the value element
in rockchip_pin_bank, but calculate the per-bank value dynamically
when the bank gets created.

For example in rockchip_pinctrl_get_soc_data just parse the route-struct
and calculate that value when the driver probes.

This reduces possible errors and also spares us the clutter of all the
additional PIN_BANK_* defines.


>  };
>  
>  static struct rockchip_pin_ctrl rk3228_pin_ctrl = {
> @@ -2866,6 +3033,7 @@ static int rockchip_pinctrl_probe(struct platform_device *pdev)
>  		.grf_mux_offset		= 0x0,
>  		.pull_calc_reg		= rk3228_calc_pull_reg_and_bit,
>  		.drv_calc_reg		= rk3228_calc_drv_reg_and_bit,
> +		.iomux_route		= rk3228_set_mux_route,

		.iomux_routes	= rk3228_mux_route_data,
		.niomux_routes	= ARRAY_SIZE(rk3228_mux_route_data),


Heiko

>  };
>  
>  static struct rockchip_pin_bank rk3288_pin_banks[] = {
> 


