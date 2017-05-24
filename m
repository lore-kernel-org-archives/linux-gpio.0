From: Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH 2/5] pinctrl: meson-gxl: Fix typo in AO SPDIF pins
Date: Wed, 24 May 2017 10:42:14 +0200
Message-ID: <1495615334.14589.7.camel@baylibre.com>
References: <1495614042-2676-1-git-send-email-narmstrong@baylibre.com>
         <1495614042-2676-3-git-send-email-narmstrong@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1495614042-2676-3-git-send-email-narmstrong@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Neil Armstrong <narmstrong@baylibre.com>, linus.walleij@linaro.org
Cc: linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

On Wed, 2017-05-24 at 10:20 +0200, Neil Armstrong wrote:
> The AO SPDIF pins were incorrectly defined with the EE pin offset.
> 

Thx for catching this !
Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>

> Cc: Jerome Brunet <jbrunet@baylibre.com>
> Fixes: b840d649f9ec ("pinctrl: meson: gxl: add spdif output pins")
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  drivers/pinctrl/meson/pinctrl-meson-gxl.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/pinctrl/meson/pinctrl-meson-gxl.c
> b/drivers/pinctrl/meson/pinctrl-meson-gxl.c
> index 9af8e6a..454d73f 100644
> --- a/drivers/pinctrl/meson/pinctrl-meson-gxl.c
> +++ b/drivers/pinctrl/meson/pinctrl-meson-gxl.c
> @@ -279,8 +279,8 @@
>  static const unsigned int i2s_out_ch23_ao_pins[] = { PIN(GPIOAO_8, 0) };
>  static const unsigned int i2s_out_ch45_ao_pins[] = { PIN(GPIOAO_9, 0) };
>  
> -static const unsigned int spdif_out_ao_6_pins[]	= { PIN(GPIOAO_6,
> EE_OFF) };
> -static const unsigned int spdif_out_ao_9_pins[]	= { PIN(GPIOAO_9,
> EE_OFF) };
> +static const unsigned int spdif_out_ao_6_pins[]	= { PIN(GPIOAO_6, 0)
> };
> +static const unsigned int spdif_out_ao_9_pins[]	= { PIN(GPIOAO_9, 0)
> };
>  
>  static struct meson_pmx_group meson_gxl_periphs_groups[] = {
>  	GPIO_GROUP(GPIOZ_0, EE_OFF),
