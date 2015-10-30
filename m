From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH] pinctrl: sh-pfc: r8a7795: Make PORT_GP_x() macros consistent
Date: Fri, 30 Oct 2015 16:24:57 +0200
Message-ID: <13270943.yfEHAtTNEp@avalon>
References: <1446147587-20216-1-git-send-email-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:58631 "EHLO
	galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753387AbbJ3OY6 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 30 Oct 2015 10:24:58 -0400
In-Reply-To: <1446147587-20216-1-git-send-email-geert+renesas@glider.be>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Linus Walleij <linus.walleij@linaro.org>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, linux-sh@vger.kernel.org, linux-gpio@vger.kernel.org

Hi Geert,

Thank you for the patch.

On Thursday 29 October 2015 20:39:47 Geert Uytterhoeven wrote:
> On r8a7795, PORT_GP_x() is a macro for defining GPIOs 0..x.
> In all other sh-pfc code, PORT_GP_x() is a macro for defining GPIOs
> 0..(x-1).
> 
> Make the r8a7795 macro definitions consistent with the rest of the
> sh-pfc codebase.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/pinctrl/sh-pfc/pfc-r8a7795.c | 36 +++++++++++++++++----------------
>  1 file changed, 18 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
> b/drivers/pinctrl/sh-pfc/pfc-r8a7795.c index
> 7ddb2adfc5a53d7b..29d001b8a727e154 100644
> --- a/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
> +++ b/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
> @@ -13,12 +13,12 @@
>  #include "core.h"
>  #include "sh_pfc.h"
> 
> -#define PORT_GP_3(bank, fn, sfx)					\
> +#define PORT_GP_4(bank, fn, sfx)					\
>  	PORT_GP_1(bank, 0,  fn, sfx), PORT_GP_1(bank, 1,  fn, sfx),	\
>  	PORT_GP_1(bank, 2,  fn, sfx), PORT_GP_1(bank, 3,  fn, sfx)
> 
> -#define PORT_GP_14(bank, fn, sfx)					\
> -	PORT_GP_3(bank, fn, sfx),					\
> +#define PORT_GP_15(bank, fn, sfx)					\
> +	PORT_GP_4(bank, fn, sfx),					\
>  	PORT_GP_1(bank, 4,  fn, sfx), PORT_GP_1(bank, 5,  fn, sfx),	\
>  	PORT_GP_1(bank, 6,  fn, sfx), PORT_GP_1(bank, 7,  fn, sfx),	\
>  	PORT_GP_1(bank, 8,  fn, sfx), PORT_GP_1(bank, 9,  fn, sfx),	\
> @@ -26,33 +26,33 @@
>  	PORT_GP_1(bank, 12, fn, sfx), PORT_GP_1(bank, 13, fn, sfx),	\
>  	PORT_GP_1(bank, 14, fn, sfx)
> 
> -#define PORT_GP_15(bank, fn, sfx)					\
> -	PORT_GP_14(bank, fn, sfx),   PORT_GP_1(bank, 15, fn, sfx)
> +#define PORT_GP_16(bank, fn, sfx)					\
> +	PORT_GP_15(bank, fn, sfx),   PORT_GP_1(bank, 15, fn, sfx)
> 
> -#define PORT_GP_17(bank, fn, sfx)					\
> -	PORT_GP_15(bank, fn, sfx),					\
> +#define PORT_GP_18(bank, fn, sfx)					\
> +	PORT_GP_16(bank, fn, sfx),					\
>  	PORT_GP_1(bank, 16, fn, sfx), PORT_GP_1(bank, 17, fn, sfx)
> 
> -#define PORT_GP_25(bank, fn, sfx)					\
> -	PORT_GP_17(bank, fn, sfx),					\
> +#define PORT_GP_26(bank, fn, sfx)					\
> +	PORT_GP_18(bank, fn, sfx),					\
>  	PORT_GP_1(bank, 18, fn, sfx), PORT_GP_1(bank, 19, fn, sfx),	\
>  	PORT_GP_1(bank, 20, fn, sfx), PORT_GP_1(bank, 21, fn, sfx),	\
>  	PORT_GP_1(bank, 22, fn, sfx), PORT_GP_1(bank, 23, fn, sfx),	\
>  	PORT_GP_1(bank, 24, fn, sfx), PORT_GP_1(bank, 25, fn, sfx)
> 
> -#define PORT_GP_27(bank, fn, sfx)					\
> -	PORT_GP_25(bank, fn, sfx),					\
> +#define PORT_GP_28(bank, fn, sfx)					\
> +	PORT_GP_26(bank, fn, sfx),					\
>  	PORT_GP_1(bank, 26, fn, sfx), PORT_GP_1(bank, 27, fn, sfx)
> 
>  #define CPU_ALL_PORT(fn, sfx)						\
> -	PORT_GP_15(0, fn, sfx),						\
> -	PORT_GP_27(1, fn, sfx),						\
> -	PORT_GP_14(2, fn, sfx),						\
> -	PORT_GP_15(3, fn, sfx),						\
> -	PORT_GP_17(4, fn, sfx),						\
> -	PORT_GP_25(5, fn, sfx),						\
> +	PORT_GP_16(0, fn, sfx),						\
> +	PORT_GP_28(1, fn, sfx),						\
> +	PORT_GP_15(2, fn, sfx),						\
> +	PORT_GP_16(3, fn, sfx),						\
> +	PORT_GP_18(4, fn, sfx),						\
> +	PORT_GP_26(5, fn, sfx),						\
>  	PORT_GP_32(6, fn, sfx),						\
> -	PORT_GP_3(7, fn, sfx)
> +	PORT_GP_4(7, fn, sfx)
>  /*
>   * F_() : just information
>   * FM() : macro for FN_xxx / xxx_MARK

-- 
Regards,

Laurent Pinchart

