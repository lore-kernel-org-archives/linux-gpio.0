From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 2/3] pinctrl: sunxi: Add support for
 fetching pinconf settings from hardware
Date: Fri, 11 Nov 2016 09:36:27 +0100
Message-ID: <20161111083627.yooctcxqs4ow7sn3@lukather>
References: <20161111024455.16883-1-wens@csie.org>
 <20161111024455.16883-3-wens@csie.org>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="6zko3kx573tyunym"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBDEGS3AQKGQEBAWGE3I-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <20161111024455.16883-3-wens-jdAy2FN1RRM@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: linux-gpio@vger.kernel.org


--6zko3kx573tyunym
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

On Fri, Nov 11, 2016 at 10:44:54AM +0800, Chen-Yu Tsai wrote:
> The sunxi pinctrl driver only caches whatever pinconf setting was last
> set on a given pingroup. This is not particularly helpful, nor is it
> correct.
> 
> Fix this by actually reading the hardware registers and returning
> the correct results or error codes. Also filter out unsupported
> pinconf settings. Since this driver has a peculiar setup of 1 pin
> per group, we can support both pin and pingroup pinconf setting
> read back with the same code. The sunxi_pconf_reg helper and code
> structure is inspired by pinctrl-msm.
> 
> With this done we can also claim to support generic pinconf, by
> setting .is_generic = true in pinconf_ops.
> 
> Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
> ---
>  drivers/pinctrl/sunxi/pinctrl-sunxi.c | 84 +++++++++++++++++++++++++++++++++--
>  1 file changed, 81 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
> index e04edda8629d..3e9f7c675d36 100644
> --- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
> +++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
> @@ -438,15 +438,91 @@ static const struct pinctrl_ops sunxi_pctrl_ops = {
>  	.get_group_pins		= sunxi_pctrl_get_group_pins,
>  };
>  
> +static int sunxi_pconf_reg(unsigned pin, enum pin_config_param param,
> +			   u32 *offset, u32 *shift, u32 *mask)
> +{
> +	switch (param) {
> +	case PIN_CONFIG_DRIVE_STRENGTH:
> +		*offset = sunxi_dlevel_reg(pin);
> +		*shift = sunxi_dlevel_offset(pin);
> +		*mask = DLEVEL_PINS_MASK;
> +		break;
> +
> +	case PIN_CONFIG_BIAS_PULL_UP:
> +	case PIN_CONFIG_BIAS_PULL_DOWN:
> +	case PIN_CONFIG_BIAS_DISABLE:
> +		*offset = sunxi_pull_reg(pin);
> +		*shift = sunxi_pull_offset(pin);
> +		*mask = PULL_PINS_MASK;
> +		break;
> +
> +	default:
> +		return -ENOTSUPP;
> +	}
> +
> +	return 0;
> +}
> +
> +static int sunxi_pconf_get(struct pinctrl_dev *pctldev, unsigned pin,
> +			   unsigned long *config)
> +{
> +	struct sunxi_pinctrl *pctl = pinctrl_dev_get_drvdata(pctldev);
> +	enum pin_config_param param = pinconf_to_config_param(*config);
> +	u32 offset, shift, mask, val;
> +	u16 arg;
> +	int ret;
> +
> +	pin -= pctl->desc->pin_base;
> +
> +	ret = sunxi_pconf_reg(pin, param, &offset, &shift, &mask);
> +	if (ret < 0)
> +		return ret;
> +
> +	val = (readl(pctl->membase + offset) >> shift) & mask;
> +
> +	switch (pinconf_to_config_param(*config)) {
> +	case PIN_CONFIG_DRIVE_STRENGTH:
> +		arg = (val + 1) * 10;
> +		break;
> +
> +	case PIN_CONFIG_BIAS_PULL_UP:
> +		if (val != SUN4I_PINCTRL_PULL_UP)
> +			return -EINVAL;
> +		arg = 1; /* hardware is weak pull-up */
> +		break;
> +
> +	case PIN_CONFIG_BIAS_PULL_DOWN:
> +		if (val != SUN4I_PINCTRL_PULL_DOWN)
> +			return -EINVAL;
> +		arg = 1; /* hardware is weak pull-down */
> +		break;
> +
> +	case PIN_CONFIG_BIAS_DISABLE:
> +		if (val != SUN4I_PINCTRL_NO_PULL)
> +			return -EINVAL;
> +		arg = 0;
> +		break;
> +
> +	default:
> +		/* sunxi_pconf_reg should catch anything unsupported */
> +		WARN_ON(1);
> +		return -ENOTSUPP;
> +	}
> +
> +	*config = pinconf_to_config_packed(param, arg);
> +
> +	return 0;
> +}
> +
>  static int sunxi_pconf_group_get(struct pinctrl_dev *pctldev,
>  				 unsigned group,
>  				 unsigned long *config)
>  {
>  	struct sunxi_pinctrl *pctl = pinctrl_dev_get_drvdata(pctldev);
> +	struct sunxi_pinctrl_group *g = &pctl->groups[group];
>  
> -	*config = pctl->groups[group].config;

Do we still need this variable? Looking at the code, it doesn't look
that way, and we can remove the caching in the _group_set function and
the variable itslef in the sunxi_pincttrl_group structure.

Thanks!
Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
--6zko3kx573tyunym--
