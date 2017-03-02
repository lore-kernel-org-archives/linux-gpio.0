From: Kever Yang <kever.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: Re: [PATCH v2 1/2] pinctrl: =?UTF-8?B?cm9ja2NoaXDvvJpBZGQgaW5wdXQ=?=
 =?UTF-8?B?IHNjaG1pdHQgc3VwcG9ydA==?=
Date: Thu, 02 Mar 2017 16:30:11 +0800
Message-ID: <58B7D813.90604@rock-chips.com>
References: <1488438684-1801-1-git-send-email-david.wu@rock-chips.com>
 <1488438684-1801-2-git-send-email-david.wu@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1488438684-1801-2-git-send-email-david.wu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: David Wu <david.wu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Cc: huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-gpio@vger.kernel.org

Hi David,

On 03/02/2017 03:11 PM, David Wu wrote:
> From: "david.wu" <david.wu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>

You do not need to add this when you send mail for yourself,
it's need when you send mail for others.

>
> To prevent external signal crosstalk, some pins need to
> enable input schmitt, like i2c pins, 32k-input pin and so on.
>
> Signed-off-by: david.wu <david.wu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>

Better to use "David Wu" for full name, you can correct this in your 
gitconfig file.

Thanks,
- Kever
> ---
> changes in v2:
>   - check the return value (Heiko)
>
>   drivers/pinctrl/pinctrl-rockchip.c | 73 ++++++++++++++++++++++++++++++++++++++
>   1 file changed, 73 insertions(+)
>
> diff --git a/drivers/pinctrl/pinctrl-rockchip.c b/drivers/pinctrl/pinctrl-rockchip.c
> index a20ce9f..9b8d516 100644
> --- a/drivers/pinctrl/pinctrl-rockchip.c
> +++ b/drivers/pinctrl/pinctrl-rockchip.c
> @@ -308,6 +308,9 @@ struct rockchip_pin_ctrl {
>   				    int *reg, u8 *bit);
>   	void	(*iomux_recalc)(u8 bank_num, int pin, int *reg,
>   				u8 *bit, int *mask);
> +	int	(*schmitt_calc_reg)(struct rockchip_pin_bank *bank,
> +				    int pin_num, struct regmap **regmap,
> +				    int *reg, u8 *bit);
>   };
>   
>   struct rockchip_pin_config {
> @@ -1355,6 +1358,57 @@ static int rockchip_set_pull(struct rockchip_pin_bank *bank,
>   	return ret;
>   }
>   
> +static int rockchip_get_schmitt(struct rockchip_pin_bank *bank, int pin_num)
> +{
> +	struct rockchip_pinctrl *info = bank->drvdata;
> +	struct rockchip_pin_ctrl *ctrl = info->ctrl;
> +	struct regmap *regmap;
> +	int reg, ret;
> +	u8 bit;
> +	u32 data;
> +
> +	ret = ctrl->schmitt_calc_reg(bank, pin_num, &regmap, &reg, &bit);
> +	if (ret)
> +		return ret;
> +
> +	ret = regmap_read(regmap, reg, &data);
> +	if (ret)
> +		return ret;
> +
> +	data >>= bit;
> +	return data & 0x1;
> +}
> +
> +static int rockchip_set_schmitt(struct rockchip_pin_bank *bank,
> +				int pin_num, int enable)
> +{
> +	struct rockchip_pinctrl *info = bank->drvdata;
> +	struct rockchip_pin_ctrl *ctrl = info->ctrl;
> +	struct regmap *regmap;
> +	int reg, ret;
> +	unsigned long flags;
> +	u8 bit;
> +	u32 data, rmask;
> +
> +	dev_dbg(info->dev, "setting input schmitt of GPIO%d-%d to %d\n",
> +		bank->bank_num, pin_num, enable);
> +
> +	ret = ctrl->schmitt_calc_reg(bank, pin_num, &regmap, &reg, &bit);
> +	if (ret)
> +		return ret;
> +
> +	spin_lock_irqsave(&bank->slock, flags);
> +
> +	/* enable the write to the equivalent lower bits */
> +	data = BIT(bit + 16) | (enable << bit);
> +	rmask = BIT(bit + 16) | BIT(bit);
> +
> +	ret = regmap_update_bits(regmap, reg, rmask, data);
> +	spin_unlock_irqrestore(&bank->slock, flags);
> +
> +	return ret;
> +}
> +
>   /*
>    * Pinmux_ops handling
>    */
> @@ -1574,6 +1628,15 @@ static int rockchip_pinconf_set(struct pinctrl_dev *pctldev, unsigned int pin,
>   			if (rc < 0)
>   				return rc;
>   			break;
> +		case PIN_CONFIG_INPUT_SCHMITT_ENABLE:
> +			if (!info->ctrl->schmitt_calc_reg)
> +				return -ENOTSUPP;
> +
> +			rc = rockchip_set_schmitt(bank,
> +						  pin - bank->pin_base, arg);
> +			if (rc < 0)
> +				return rc;
> +			break;
>   		default:
>   			return -ENOTSUPP;
>   			break;
> @@ -1634,6 +1697,16 @@ static int rockchip_pinconf_get(struct pinctrl_dev *pctldev, unsigned int pin,
>   
>   		arg = rc;
>   		break;
> +	case PIN_CONFIG_INPUT_SCHMITT_ENABLE:
> +		if (!info->ctrl->schmitt_calc_reg)
> +			return -ENOTSUPP;
> +
> +		rc = rockchip_get_schmitt(bank, pin - bank->pin_base);
> +		if (rc < 0)
> +			return rc;
> +
> +		arg = rc;
> +		break;
>   	default:
>   		return -ENOTSUPP;
>   		break;
