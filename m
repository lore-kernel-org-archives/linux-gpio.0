From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v3 2/3] pinctrl: sunxi: Add support for
 fetching pinconf settings from hardware
Date: Fri, 11 Nov 2016 14:51:59 +0100
Message-ID: <20161111135159.zqjqjjn7azg4gkzx@lukather>
References: <20161111095036.11803-1-wens@csie.org>
 <20161111095036.11803-3-wens@csie.org>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="zmbf6zajye4tbzdn"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBAE2S7AQKGQEGUHRNIA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <20161111095036.11803-3-wens-jdAy2FN1RRM@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: linux-gpio@vger.kernel.org


--zmbf6zajye4tbzdn
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

On Fri, Nov 11, 2016 at 05:50:35PM +0800, Chen-Yu Tsai wrote:
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
> Also remove the cached config value. The behavior of this was never
> correct, as it only cached 1 setting instead of all of them. Since
> we can now read back settings directly from the hardware, it is no
> longer required.
> 
> Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
> ---
>  drivers/pinctrl/sunxi/pinctrl-sunxi.c | 86 +++++++++++++++++++++++++++++++++--
>  drivers/pinctrl/sunxi/pinctrl-sunxi.h |  1 -
>  2 files changed, 81 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
> index e04edda8629d..ed71bff39869 100644
> --- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
> +++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
> @@ -438,15 +438,91 @@ static const struct pinctrl_ops sunxi_pctrl_ops = {
>  	.get_group_pins		= sunxi_pctrl_get_group_pins,
>  };
>  
> +static int sunxi_pconf_reg(unsigned pin, enum pin_config_param param,

Sorry, this went unnoticed in your previous version, but checkpatch
reports:

WARNING: Prefer 'unsigned int' to bare use of 'unsigned'

For this one and the next function.

Once fixed,
Acked-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>

Thanks!
Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
--zmbf6zajye4tbzdn--
