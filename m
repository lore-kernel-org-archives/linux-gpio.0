From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 5/7] pinctrl: sh-pfc: Remove empty gpio_function_free()
Date: Tue, 30 Jun 2015 12:34:19 +0300
Message-ID: <1450850.G82aWGCP42@avalon>
References: <1435650327-2542-1-git-send-email-geert+renesas@glider.be> <1435650327-2542-6-git-send-email-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:50601 "EHLO
	galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750913AbbF3JeP (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 30 Jun 2015 05:34:15 -0400
In-Reply-To: <1435650327-2542-6-git-send-email-geert+renesas@glider.be>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <maxime.ripard@free-electrons.com>, Boris Brezillon <boris.brezillon@free-electrons.com>, Benoit Parrot <bparrot@ti.com>, linux-gpio@vger.kernel.org, linux-sh@vger.kernel.org, linux-arm-kernel@lists.infradead.org

Hi Geert,

Thank you for the patch.

On Tuesday 30 June 2015 09:45:25 Geert Uytterhoeven wrote:
> gpio_chip.free() is optional, and can just be left unimplemented.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
> Untested due to lack of hardware (used on sh only).
> ---
>  drivers/pinctrl/sh-pfc/gpio.c | 5 -----
>  1 file changed, 5 deletions(-)
> 
> diff --git a/drivers/pinctrl/sh-pfc/gpio.c b/drivers/pinctrl/sh-pfc/gpio.c
> index 1be118e4865fd3f8..b8929b5e2fa26c53 100644
> --- a/drivers/pinctrl/sh-pfc/gpio.c
> +++ b/drivers/pinctrl/sh-pfc/gpio.c
> @@ -286,17 +286,12 @@ static int gpio_function_request(struct gpio_chip *gc,
> unsigned offset) return ret;
>  }
> 
> -static void gpio_function_free(struct gpio_chip *gc, unsigned offset)
> -{
> -}
> -
>  static int gpio_function_setup(struct sh_pfc_chip *chip)
>  {
>  	struct sh_pfc *pfc = chip->pfc;
>  	struct gpio_chip *gc = &chip->gpio_chip;
> 
>  	gc->request = gpio_function_request;
> -	gc->free = gpio_function_free;
> 
>  	gc->label = pfc->info->name;
>  	gc->owner = THIS_MODULE;

-- 
Regards,

Laurent Pinchart

