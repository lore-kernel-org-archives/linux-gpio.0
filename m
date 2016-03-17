From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 1/2] pinctrl: sh-pfc: enable to indicate GPSR/IPSR/MOD_SEL for debug
Date: Thu, 17 Mar 2016 08:26:15 +0200
Message-ID: <1664968.xJ82UUQeDG@avalon>
References: <8760wnfe3r.wl%kuninori.morimoto.gx@renesas.com> <874mc7fe29.wl%kuninori.morimoto.gx@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <874mc7fe29.wl%kuninori.morimoto.gx@renesas.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Linus Walleij <linus.walleij@linaro.org>, Magnus <magnus.damm@gmail.com>, Simon <horms@verge.net.au>, linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

Hi Morimoto-san,

Thank you for the patch.

On Wednesday 16 March 2016 00:47:48 Kuninori Morimoto wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> Current sh_pfc can't indicate GPSR/IPSR/MOD_SEL name for debug.
> Of course we can get it from indicated register address, but it
> is not convenient. This patch enables to indicate these.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>  drivers/pinctrl/sh-pfc/core.c   | 3 ++-
>  drivers/pinctrl/sh-pfc/sh_pfc.h | 9 ++++++---
>  2 files changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/pinctrl/sh-pfc/core.c b/drivers/pinctrl/sh-pfc/core.c
> index 0c2d14c..c59f858 100644
> --- a/drivers/pinctrl/sh-pfc/core.c
> +++ b/drivers/pinctrl/sh-pfc/core.c
> @@ -204,8 +204,9 @@ static void sh_pfc_write_config_reg(struct sh_pfc *pfc,
> 
>  	sh_pfc_config_reg_helper(pfc, crp, field, &mapped_reg, &mask, &pos);
> 
> -	dev_dbg(pfc->dev, "write_reg addr = %x, value = 0x%x, field = %u, "
> +	dev_dbg(pfc->dev, "%s: write_reg addr = %x, value = 0x%x, field = %u, "
>  		"r_width = %u, f_width = %u\n",
> +		crp->name,
>  		crp->reg, value, field, crp->reg_width, crp->field_width);
> 
>  	mask = ~(mask << pos);
> diff --git a/drivers/pinctrl/sh-pfc/sh_pfc.h
> b/drivers/pinctrl/sh-pfc/sh_pfc.h index a490834..2b593fc 100644
> --- a/drivers/pinctrl/sh-pfc/sh_pfc.h
> +++ b/drivers/pinctrl/sh-pfc/sh_pfc.h
> @@ -94,6 +94,7 @@ struct pinmux_func {
>  };
> 
>  struct pinmux_cfg_reg {
> +	const char *name;

This will increase the kernel size, I would remove the name field when 
compiling the kernel in non-debug mode. You could use CONFIG_DYNAMIC_DEBUG or 
CONFIG_DEBUG_PINCTRL.

>  	u32 reg;
>  	u8 reg_width, field_width;
>  	const u16 *enum_ids;
> @@ -110,7 +111,8 @@ struct pinmux_cfg_reg {
>   * (from left to right, i.e. MSB to LSB), 2^f_width enum IDs must be
> specified, * one for each possible combination of the register field bit
> values. */
> -#define PINMUX_CFG_REG(name, r, r_width, f_width) \
> +#define PINMUX_CFG_REG(_name, r, r_width, f_width) \
> +	.name = _name, \
>  	.reg = r, .reg_width = r_width, .field_width = f_width,		\
>  	.enum_ids = (const u16 [(r_width / f_width) * (1 << f_width)])
> 
> @@ -125,7 +127,8 @@ struct pinmux_cfg_reg {
>   * (from left to right, i.e. MSB to LSB), 2^var_fwi enum IDs must be
> specified, * one for each possible combination of the register field bit
> values. */
> -#define PINMUX_CFG_REG_VAR(name, r, r_width, var_fw0, var_fwn...) \
> +#define PINMUX_CFG_REG_VAR(_name, r, r_width, var_fw0, var_fwn...) \
> +	.name = _name, \
>  	.reg = r, .reg_width = r_width,	\
>  	.var_field_width = (const u8 [r_width]) \
>  		{ var_fw0, var_fwn, 0 }, \
> @@ -465,7 +468,7 @@ struct sh_pfc_soc_info {
>   */
>  #define PORTCR(nr, reg)							\
>  	{								\
> -		PINMUX_CFG_REG_VAR("PORT" nr "CR", reg, 8, 2, 2, 1, 3) {\
> +		PINMUX_CFG_REG_VAR("PORT" #nr "CR", reg, 8, 2, 2, 1, 3) {\
>  			/* PULMD[1:0], handled by .set_bias() */	\
>  			0, 0, 0, 0,					\
>  			/* IE and OE */					\

-- 
Regards,

Laurent Pinchart
