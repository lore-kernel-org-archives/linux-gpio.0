From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH] sh-pfc: r8a7794: add MMCIF pin groups
Date: Tue, 17 Feb 2015 07:20:06 +0200
Message-ID: <1563325.OcWih86DEg@avalon>
References: <2352429.FfRv9a1MoB@wasted.cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:42477 "EHLO
	galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752778AbbBQFTN (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 17 Feb 2015 00:19:13 -0500
In-Reply-To: <2352429.FfRv9a1MoB@wasted.cogentembedded.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: linus.walleij@linaro.org, linux-sh@vger.kernel.org, linux-gpio@vger.kernel.org, shinobu.uehara.xc@renesas.com

Hi Sergei,

Thank you for the patch.

On Tuesday 17 February 2015 01:33:14 Sergei Shtylyov wrote:
> From: Shinobu Uehara <shinobu.uehara.xc@renesas.com>
> 
> Add MMCIF pin groups to R8A7794 PFC driver.
> 
> Signed-off-by: Shinobu Uehara <shinobu.uehara.xc@renesas.com>
> [Sergei: rebased, renamed, added changelog.]
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
> The patch is against the 'devel' branch of Linus W.'s 'linux-pinctrl.git'
> repo plus the R8A7794 PFC support patch posted last week.
> 
>  drivers/pinctrl/sh-pfc/pfc-r8a7794.c |   46 +++++++++++++++++++++++++++++++
>  1 file changed, 46 insertions(+)
> 
> Index: linux-pinctrl/drivers/pinctrl/sh-pfc/pfc-r8a7794.c
> ===================================================================
> --- linux-pinctrl.orig/drivers/pinctrl/sh-pfc/pfc-r8a7794.c
> +++ linux-pinctrl/drivers/pinctrl/sh-pfc/pfc-r8a7794.c
> @@ -1900,6 +1900,40 @@ static const unsigned int intc_irq9_pins
>  static const unsigned int intc_irq9_mux[] = {
>  	IRQ9_MARK,
>  };
> +/* - MMCIF
> ------------------------------------------------------------------ */
> +static const unsigned int mmc_data1_pins[] = {
> +	/* D[0] */
> +	RCAR_GP_PIN(6, 18),
> +};
> +static const unsigned int mmc_data1_mux[] = {
> +	MMC_D0_MARK,
> +};
> +static const unsigned int mmc_data4_pins[] = {
> +	/* D[0:3] */
> +	RCAR_GP_PIN(6, 18), RCAR_GP_PIN(6, 19),
> +	RCAR_GP_PIN(6, 20), RCAR_GP_PIN(6, 21),
> +};
> +static const unsigned int mmc_data4_mux[] = {
> +	MMC_D0_MARK, MMC_D1_MARK, MMC_D2_MARK, MMC_D3_MARK,
> +};
> +static const unsigned int mmc_data8_pins[] = {
> +	/* D[0:7] */
> +	RCAR_GP_PIN(6, 18), RCAR_GP_PIN(6, 19),
> +	RCAR_GP_PIN(6, 20), RCAR_GP_PIN(6, 21),
> +	RCAR_GP_PIN(6, 22), RCAR_GP_PIN(6, 23),
> +	RCAR_GP_PIN(6, 24), RCAR_GP_PIN(6, 25),
> +};
> +static const unsigned int mmc_data8_mux[] = {
> +	MMC_D0_MARK, MMC_D1_MARK, MMC_D2_MARK, MMC_D3_MARK,
> +	MMC_D4_MARK, MMC_D5_MARK, MMC_D6_MARK, MMC_D7_MARK,
> +};
> +static const unsigned int mmc_ctrl_pins[] = {
> +	/* CLK, CMD */
> +	RCAR_GP_PIN(6, 16), RCAR_GP_PIN(6, 17),
> +};
> +static const unsigned int mmc_ctrl_mux[] = {
> +	MMC_CLK_MARK, MMC_CMD_MARK,
> +};
>  /* - MSIOF0
> ----------------------------------------------------------------- */ static
> const unsigned int msiof0_clk_pins[] = {
>  	/* SCK */
> @@ -2664,6 +2698,10 @@ static const struct sh_pfc_pin_group pin
>  	SH_PFC_PIN_GROUP(intc_irq7),
>  	SH_PFC_PIN_GROUP(intc_irq8),
>  	SH_PFC_PIN_GROUP(intc_irq9),
> +	SH_PFC_PIN_GROUP(mmc_data1),
> +	SH_PFC_PIN_GROUP(mmc_data4),
> +	SH_PFC_PIN_GROUP(mmc_data8),
> +	SH_PFC_PIN_GROUP(mmc_ctrl),
>  	SH_PFC_PIN_GROUP(msiof0_clk),
>  	SH_PFC_PIN_GROUP(msiof0_sync),
>  	SH_PFC_PIN_GROUP(msiof0_ss1),
> @@ -2850,6 +2888,13 @@ static const char * const intc_groups[]
>  	"intc_irq9",
>  };
> 
> +static const char * const mmc_groups[] = {
> +	"mmc_data1",
> +	"mmc_data4",
> +	"mmc_data8",
> +	"mmc_ctrl",
> +};
> +
>  static const char * const msiof0_groups[] = {
>  	"msiof0_clk",
>  	"msiof0_sync",
> @@ -3016,6 +3061,7 @@ static const struct sh_pfc_function pinm
>  	SH_PFC_FUNCTION(i2c3),
>  	SH_PFC_FUNCTION(i2c4),
>  	SH_PFC_FUNCTION(intc),
> +	SH_PFC_FUNCTION(mmc),
>  	SH_PFC_FUNCTION(msiof0),
>  	SH_PFC_FUNCTION(msiof1),
>  	SH_PFC_FUNCTION(msiof2),

-- 
Regards,

Laurent Pinchart

