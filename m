From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH/RFC 1/4] pinctrl: sh-pfc: Add PINMUX_SINGLE()
Date: Wed, 25 Nov 2015 02:49:55 +0200
Message-ID: <3546719.xIF05iocVT@avalon>
References: <1445369195-25117-1-git-send-email-geert+renesas@glider.be> <1445369195-25117-2-git-send-email-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:41158 "EHLO
	galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755456AbbKYAtq (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 24 Nov 2015 19:49:46 -0500
In-Reply-To: <1445369195-25117-2-git-send-email-geert+renesas@glider.be>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Linus Walleij <linus.walleij@linaro.org>, linux-sh@vger.kernel.org, linux-gpio@vger.kernel.org

Hi Geert,

Thank you for the patch.

On Tuesday 20 October 2015 21:26:32 Geert Uytterhoeven wrote:
> Add a macro to describe a pinmux configuration for a single-function
> pin.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  drivers/pinctrl/sh-pfc/sh_pfc.h | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/pinctrl/sh-pfc/sh_pfc.h
> b/drivers/pinctrl/sh-pfc/sh_pfc.h index 63e6cd050d0fb7d2..932fbef8bad400dd
> 100644
> --- a/drivers/pinctrl/sh-pfc/sh_pfc.h
> +++ b/drivers/pinctrl/sh-pfc/sh_pfc.h
> @@ -277,6 +277,13 @@ struct sh_pfc_soc_info {
>  	PINMUX_DATA(fn##_MARK, FN_##ms, FN_##ipsr, FN_##fn)
> 
>  /*
> + * Describe a pinmux configuration for a single-function pin.

I would say "single-function pin with GPIO capability".

Apart from that,

Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> + *   - fn: Function name
> + */
> +#define PINMUX_SINGLE(fn)						\
> +	PINMUX_DATA(fn##_MARK, FN_##fn)
> +
> +/*
>   * GP port style (32 ports banks)
>   */

-- 
Regards,

Laurent Pinchart

