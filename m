From: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH v1 1/2] pinctrl: =?UTF-8?B?cm9ja2NoaXDvvJpBZGQ=?= input schmitt support
Date: Thu, 23 Feb 2017 17:51:41 +0100
Message-ID: <48027259.fqOrTqXNdI@phil>
References: <1487068541-14120-1-git-send-email-david.wu@rock-chips.com> <1487068541-14120-2-git-send-email-david.wu@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from gloria.sntech.de ([95.129.55.99]:42982 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751198AbdBWQwH (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 23 Feb 2017 11:52:07 -0500
In-Reply-To: <1487068541-14120-2-git-send-email-david.wu@rock-chips.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: David Wu <david.wu@rock-chips.com>
Cc: linus.walleij@linaro.org, huangtao@rock-chips.com, linux-rockchip@lists.infradead.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org

Hi David,

Am Dienstag, 14. Februar 2017, 18:35:40 CET schrieb David Wu:
> From: "david.wu" <david.wu@rock-chips.com>
> 
> To prevent external noise crosstalk, some pins need to
> enable input schmitt, like i2c pins, 32k-input pin and so on.
> 
> Signed-off-by: david.wu <david.wu@rock-chips.com>
> ---
>  drivers/pinctrl/pinctrl-rockchip.c | 69
> ++++++++++++++++++++++++++++++++++++++ 1 file changed, 69 insertions(+)
> 
> diff --git a/drivers/pinctrl/pinctrl-rockchip.c
> b/drivers/pinctrl/pinctrl-rockchip.c index a20ce9f..6a071b1 100644
> --- a/drivers/pinctrl/pinctrl-rockchip.c
> +++ b/drivers/pinctrl/pinctrl-rockchip.c
> @@ -308,6 +308,9 @@ struct rockchip_pin_ctrl {
>  				    int *reg, u8 *bit);
>  	void	(*iomux_recalc)(u8 bank_num, int pin, int *reg,
>  				u8 *bit, int *mask);
> +	void	(*schmitt_calc_reg)(struct rockchip_pin_bank *bank,
> +				    int pin_num, struct regmap **regmap,
> +				    int *reg, u8 *bit);
>  };
> 
>  struct rockchip_pin_config {
> @@ -1355,6 +1358,53 @@ static int rockchip_set_pull(struct rockchip_pin_bank
> *bank, return ret;
>  }
> 
> +static int rockchip_get_schmitt(struct rockchip_pin_bank *bank, int
> pin_num) +{
> +	struct rockchip_pinctrl *info = bank->drvdata;
> +	struct rockchip_pin_ctrl *ctrl = info->ctrl;
> +	struct regmap *regmap;
> +	int reg, ret;
> +	u8 bit;
> +	u32 data;
> +
> +	ctrl->schmitt_calc_reg(bank, pin_num, &regmap, &reg, &bit);

we might want to have and check an actual return value here.
On things like the rk3288 only some special pins have these schmitt triggers 
it seems, so we might want to abort if something tries to access an 
unsupported one.

> +
> +	ret = regmap_read(regmap, reg, &data);
> +	if (ret)
> +		return ret;
> +
> +	data >>= bit;
> +	return data & 0x1;

The mask seems to also be variable, for example on the rk3399 there seem to be 
multiple "levels" for at least gpio2. So your calc-callback might want to also 
set the right mask.

Otherwise looks good.


Heiko

