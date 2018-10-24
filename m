From: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH] pinctrl: meson: fix pinconf bias disable
Date: Wed, 24 Oct 2018 15:25:06 +0200
Message-ID: <e59dce0c-e26c-1918-724c-8508fd841678@baylibre.com>
References: <20181023160319.27003-1-jbrunet@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181023160319.27003-1-jbrunet@baylibre.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Jerome Brunet <jbrunet@baylibre.com>, Linus Walleij <linus.walleij@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Carlo Caione <carlo@caione.org>
Cc: linux-gpio@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

On 23/10/2018 18:03, Jerome Brunet wrote:
> If a bias is enabled on a pin of an Amlogic SoC, calling .pin_config_set()
> with PIN_CONFIG_BIAS_DISABLE will not disable the bias. Instead it will
> force a pull-down bias on the pin.
> 
> Instead of the pull type register bank, the driver should access the pull
> enable register bank.
> 
> Fixes: 6ac730951104 ("pinctrl: add driver for Amlogic Meson SoCs")
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>  drivers/pinctrl/meson/pinctrl-meson.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pinctrl/meson/pinctrl-meson.c b/drivers/pinctrl/meson/pinctrl-meson.c
> index 29a458da78db..4f3ab18636a3 100644
> --- a/drivers/pinctrl/meson/pinctrl-meson.c
> +++ b/drivers/pinctrl/meson/pinctrl-meson.c
> @@ -192,7 +192,7 @@ static int meson_pinconf_set(struct pinctrl_dev *pcdev, unsigned int pin,
>  			dev_dbg(pc->dev, "pin %u: disable bias\n", pin);
>  
>  			meson_calc_reg_and_bit(bank, pin, REG_PULL, &reg, &bit);
> -			ret = regmap_update_bits(pc->reg_pull, reg,
> +			ret = regmap_update_bits(pc->reg_pullen, reg,
>  						 BIT(bit), 0);
>  			if (ret)
>  				return ret;
> 

Acked-by: Neil Armstrong <narmstrong@baylibre.com>

Nice catch !

Neil
