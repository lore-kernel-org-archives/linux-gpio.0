From: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH] pinctrl: meson-gxl: add tsin_a pins
Date: Fri, 9 Jun 2017 11:54:39 +0200
Message-ID: <07bb156f-1d19-a477-95fd-59978528a79a@baylibre.com>
References: <20170608130948.16426-1-jbrunet@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wr0-f180.google.com ([209.85.128.180]:36730 "EHLO
        mail-wr0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751596AbdFIJy5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 9 Jun 2017 05:54:57 -0400
Received: by mail-wr0-f180.google.com with SMTP id v111so28181219wrc.3
        for <linux-gpio@vger.kernel.org>; Fri, 09 Jun 2017 02:54:56 -0700 (PDT)
In-Reply-To: <20170608130948.16426-1-jbrunet@baylibre.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Jerome Brunet <jbrunet@baylibre.com>, Linus Walleij <linus.walleij@linaro.org>, Kevin Hilman <khilman@baylibre.com>
Cc: Carlo Caione <carlo@caione.org>, linux-gpio@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org

On 06/08/2017 03:09 PM, Jerome Brunet wrote:
> Add Tsin A pins to bank DV and X.
> We don't have a driver for the tsin yet but since the tsin A pinmux is
> enabled by default at boot time, declaring this pinmux is required to
> properly operate on GPIOX.
> 
> Without this change, GPIOX 8, 9, 10 and 11 can't be driven as GPIO output
> as the tsin A seems to have priority.
> 
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>  drivers/pinctrl/meson/pinctrl-meson-gxl.c | 36 +++++++++++++++++++++++++++++++
>  1 file changed, 36 insertions(+)
> 
> diff --git a/drivers/pinctrl/meson/pinctrl-meson-gxl.c b/drivers/pinctrl/meson/pinctrl-meson-gxl.c
> index 190f50c6a9ba..2624b0d4d3c4 100644
> --- a/drivers/pinctrl/meson/pinctrl-meson-gxl.c
> +++ b/drivers/pinctrl/meson/pinctrl-meson-gxl.c
> @@ -243,6 +243,25 @@ static const unsigned int spdif_out_h_pins[]	= { PIN(GPIOH_4, EE_OFF) };
>  static const unsigned int eth_link_led_pins[]	= { PIN(GPIOZ_14, EE_OFF) };
>  static const unsigned int eth_act_led_pins[]	= { PIN(GPIOZ_15, EE_OFF) };
>  
> +static const unsigned int tsin_a_d0_pins[]	= { PIN(GPIODV_0, EE_OFF) };
> +static const unsigned int tsin_a_d0_x_pins[]	= { PIN(GPIOX_10, EE_OFF) };
> +static const unsigned int tsin_a_clk_pins[]	= { PIN(GPIODV_8, EE_OFF) };
> +static const unsigned int tsin_a_clk_x_pins[]	= { PIN(GPIOX_11, EE_OFF) };
> +static const unsigned int tsin_a_sop_pins[]	= { PIN(GPIODV_9, EE_OFF) };
> +static const unsigned int tsin_a_sop_x_pins[]	= { PIN(GPIOX_8, EE_OFF) };
> +static const unsigned int tsin_a_d_valid_pins[]	= { PIN(GPIODV_10, EE_OFF) };
> +static const unsigned int tsin_a_d_valid_x_pins[] = { PIN(GPIOX_9, EE_OFF) };
> +static const unsigned int tsin_a_fail_pins[]	= { PIN(GPIODV_11, EE_OFF) };
> +static const unsigned int tsin_a_dp_pins[] = {
> +	PIN(GPIODV_1, EE_OFF),
> +	PIN(GPIODV_2, EE_OFF),
> +	PIN(GPIODV_3, EE_OFF),
> +	PIN(GPIODV_4, EE_OFF),
> +	PIN(GPIODV_5, EE_OFF),
> +	PIN(GPIODV_6, EE_OFF),
> +	PIN(GPIODV_7, EE_OFF),
> +};
> +
>  static const struct pinctrl_pin_desc meson_gxl_aobus_pins[] = {
>  	MESON_PIN(GPIOAO_0, 0),
>  	MESON_PIN(GPIOAO_1, 0),
> @@ -421,6 +440,10 @@ static struct meson_pmx_group meson_gxl_periphs_groups[] = {
>  	GROUP(spi_miso,		5,	2),
>  	GROUP(spi_ss0,		5,	1),
>  	GROUP(spi_sclk,		5,	0),
> +	GROUP(tsin_a_sop_x,	6,	3),
> +	GROUP(tsin_a_d_valid_x,	6,	2),
> +	GROUP(tsin_a_d0_x,	6,	1),
> +	GROUP(tsin_a_clk_x,	6,	0),
>  
>  	/* Bank Z */
>  	GROUP(eth_mdio,		4,	23),
> @@ -469,6 +492,12 @@ static struct meson_pmx_group meson_gxl_periphs_groups[] = {
>  	GROUP(i2c_sck_c,	1,	10),
>  	GROUP(pwm_b,		2,	11),
>  	GROUP(pwm_d,		2,	12),
> +	GROUP(tsin_a_d0,	2,	4),
> +	GROUP(tsin_a_dp,	2,	3),
> +	GROUP(tsin_a_clk,	2,	2),
> +	GROUP(tsin_a_sop,	2,	1),
> +	GROUP(tsin_a_d_valid,	2,	0),
> +	GROUP(tsin_a_fail,	1,	31),
>  
>  	/* Bank BOOT */
>  	GROUP(emmc_nand_d07,	7,	31),
> @@ -675,6 +704,12 @@ static const char * const eth_led_groups[] = {
>  	"eth_link_led", "eth_act_led",
>  };
>  
> +static const char * const tsin_a_groups[] = {
> +	"tsin_a_clk", "tsin_a_clk_x", "tsin_a_sop", "tsin_a_sop_x",
> +	"tsin_a_d_valid", "tsin_a_d_valid_x", "tsin_a_d0", "tsin_a_d0_x",
> +	"tsin_a_dp", "tsin_a_fail",
> +};
> +
>  static const char * const gpio_aobus_groups[] = {
>  	"GPIOAO_0", "GPIOAO_1", "GPIOAO_2", "GPIOAO_3", "GPIOAO_4",
>  	"GPIOAO_5", "GPIOAO_6", "GPIOAO_7", "GPIOAO_8", "GPIOAO_9",
> @@ -747,6 +782,7 @@ static struct meson_pmx_func meson_gxl_periphs_functions[] = {
>  	FUNCTION(i2s_out),
>  	FUNCTION(spdif_out),
>  	FUNCTION(eth_led),
> +	FUNCTION(tsin_a),
>  };
>  
>  static struct meson_pmx_func meson_gxl_aobus_functions[] = {
> 

Acked-by: Neil Armstrong <narmstrong@baylibre.com>
