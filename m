From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v2 2/4] pinctrl: sh-pfc: Use unsigned int for register/field widths and offsets
Date: Thu, 12 Mar 2015 03:00:01 +0200
Message-ID: <1705055.eTGDDjPxdV@avalon>
References: <1425985583-26279-1-git-send-email-geert+renesas@glider.be> <1425985583-26279-3-git-send-email-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:39601 "EHLO
	galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751008AbbCLBAP (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Mar 2015 21:00:15 -0400
In-Reply-To: <1425985583-26279-3-git-send-email-geert+renesas@glider.be>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, linux-sh@vger.kernel.org

Hi Geert,

Thank you for the patch.

On Tuesday 10 March 2015 12:06:21 Geert Uytterhoeven wrote:
> As register and field widths and offsets are in the range 1..32, use
> unsigned int (mostly replacing unsigned long) to store them in local
> variables and for passing them around.
> 
> Move to one variable per line and move variables to the beginning of
> the block where they are used while we are at it.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v2:
>   - Move to one variable per line and move variables to the beginning of
>     the block where they are used for the code that is touched.
> ---
>  drivers/pinctrl/sh-pfc/core.c | 59 +++++++++++++++++++--------------------
>  drivers/pinctrl/sh-pfc/core.h |  4 +--
>  drivers/pinctrl/sh-pfc/gpio.c |  4 +--
>  3 files changed, 33 insertions(+), 34 deletions(-)
> 
> diff --git a/drivers/pinctrl/sh-pfc/core.c b/drivers/pinctrl/sh-pfc/core.c
> index 5591baf9738b5de9..aaf9c7fa742cc9c1 100644
> --- a/drivers/pinctrl/sh-pfc/core.c
> +++ b/drivers/pinctrl/sh-pfc/core.c

[snip]

> @@ -322,13 +319,15 @@ int sh_pfc_config_mux(struct sh_pfc *pfc, unsigned
> mark, int pinmux_type) return -EINVAL;
>  	}
> 
> -	pos = 0;
> -	enum_id = 0;
> -	field = 0;
> -	value = 0;
> -
>  	/* Iterate over all the configuration fields we need to update. */
>  	while (1) {
> +		const struct pinmux_cfg_reg *cr = NULL;
> +		unsigned int field = 0;
> +		u16 enum_id = 0;
> +		u32 value = 0;

There's no need to initialize field, enum_id and value to 0 here.

With that fixed,

Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +		int in_range;
> +		int ret;
> +
>  		pos = sh_pfc_mark_to_enum(pfc, mark, pos, &enum_id);
>  		if (pos < 0)
>  			return pos;

-- 
Regards,

Laurent Pinchart

