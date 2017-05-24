From: Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH 5/5] pinctrl: meson-gxl: Add Ethernet PHY LEDS pins
Date: Wed, 24 May 2017 10:57:01 +0200
Message-ID: <1495616221.14589.12.camel@baylibre.com>
References: <1495614042-2676-1-git-send-email-narmstrong@baylibre.com>
         <1495614042-2676-6-git-send-email-narmstrong@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wm0-f41.google.com ([74.125.82.41]:38587 "EHLO
        mail-wm0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S938787AbdEXI5E (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 24 May 2017 04:57:04 -0400
Received: by mail-wm0-f41.google.com with SMTP id e127so64372759wmg.1
        for <linux-gpio@vger.kernel.org>; Wed, 24 May 2017 01:57:03 -0700 (PDT)
In-Reply-To: <1495614042-2676-6-git-send-email-narmstrong@baylibre.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Neil Armstrong <narmstrong@baylibre.com>, linus.walleij@linaro.org
Cc: linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org

On Wed, 2017-05-24 at 10:20 +0200, Neil Armstrong wrote:
> The Amlogic Meson GXL SoCs embeds an 10/100 Ethernet PHY, this patchs enables
> the Link and Activity LEDs signals.

Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>

> 
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  drivers/pinctrl/meson/pinctrl-meson-gxl.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/pinctrl/meson/pinctrl-meson-gxl.c
> b/drivers/pinctrl/meson/pinctrl-meson-gxl.c
> index 7d81287..78a9af5 100644
> --- a/drivers/pinctrl/meson/pinctrl-meson-gxl.c
> +++ b/drivers/pinctrl/meson/pinctrl-meson-gxl.c
> @@ -239,6 +239,9 @@
>  
>  static const unsigned int spdif_out_h_pins[]	= { PIN(GPIOH_4, EE_OFF)
> };
>  
> +static const unsigned int eth_link_led_pins[]	= { PIN(GPIOZ_14,
> EE_OFF) };
> +static const unsigned int eth_act_led_pins[]	= { PIN(GPIOZ_15, EE_OFF)
> };
> +
>  static const struct pinctrl_pin_desc meson_gxl_aobus_pins[] = {
>  	MESON_PIN(GPIOAO_0, 0),
>  	MESON_PIN(GPIOAO_1, 0),
> @@ -437,6 +440,8 @@
>  	GROUP(i2s_out_ch23_z,	3,	26),
>  	GROUP(i2s_out_ch45_z,	3,	25),
>  	GROUP(i2s_out_ch67_z,	3,	24),
> +	GROUP(eth_link_led,	4,	25),
> +	GROUP(eth_act_led,	4,	24),
>  
>  	/* Bank H */
>  	GROUP(hdmi_hpd,		6,	31),
> @@ -665,6 +670,10 @@
>  	"spdif_out_h",
>  };
>  
> +static const char * const eth_led_groups[] = {
> +	"eth_link_led", "eth_act_led",
> +};
> +
>  static const char * const gpio_aobus_groups[] = {
>  	"GPIOAO_0", "GPIOAO_1", "GPIOAO_2", "GPIOAO_3", "GPIOAO_4",
>  	"GPIOAO_5", "GPIOAO_6", "GPIOAO_7", "GPIOAO_8", "GPIOAO_9",
> @@ -736,6 +745,7 @@
>  	FUNCTION(hdmi_i2c),
>  	FUNCTION(i2s_out),
>  	FUNCTION(spdif_out),
> +	FUNCTION(eth_led),
>  };
>  
>  static struct meson_pmx_func meson_gxl_aobus_functions[] = {

