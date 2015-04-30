From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH 2/2] pinctrl: sh-pfc: Remove r8a73a4 platform_device_id
 entry
Date: Thu, 30 Apr 2015 14:50:04 +0900
Message-ID: <20150430055003.GO15511@verge.net.au>
References: <1430216107-31501-1-git-send-email-geert+renesas@glider.be>
 <1430216107-31501-2-git-send-email-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:56423 "EHLO
	kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751064AbbD3FuH (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 30 Apr 2015 01:50:07 -0400
Content-Disposition: inline
In-Reply-To: <1430216107-31501-2-git-send-email-geert+renesas@glider.be>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Linus Walleij <linus.walleij@linaro.org>, linux-sh@vger.kernel.org, linux-gpio@vger.kernel.org

On Tue, Apr 28, 2015 at 12:15:07PM +0200, Geert Uytterhoeven wrote:
> As of commit 9d07d414d4c33d86 ("ARM: shmobile: r8a73a4: ape6evm: Remove
> legacy platform"), r8a73a4 is only supported in generic DT-only ARM
> multi-platform builds.  The driver doesn't need to match platform
> devices by name anymore, hence remove the corresponding
> platform_device_id entry.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Acked-by: Simon Horman <horms+renesas@verge.net.au>

> ---
>  drivers/pinctrl/sh-pfc/core.c | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/drivers/pinctrl/sh-pfc/core.c b/drivers/pinctrl/sh-pfc/core.c
> index 7b2c9495c3832410..287a3d048a5e1cf9 100644
> --- a/drivers/pinctrl/sh-pfc/core.c
> +++ b/drivers/pinctrl/sh-pfc/core.c
> @@ -579,9 +579,6 @@ static int sh_pfc_remove(struct platform_device *pdev)
>  }
>  
>  static const struct platform_device_id sh_pfc_id_table[] = {
> -#ifdef CONFIG_PINCTRL_PFC_R8A73A4
> -	{ "pfc-r8a73a4", (kernel_ulong_t)&r8a73a4_pinmux_info },
> -#endif
>  #ifdef CONFIG_PINCTRL_PFC_R8A7740
>  	{ "pfc-r8a7740", (kernel_ulong_t)&r8a7740_pinmux_info },
>  #endif
> -- 
> 1.9.1
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-sh" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
