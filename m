From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH] pinctrl: sh-pfc: sh7757: Fix duplicate initializer in GPIO pinmux data
Date: Fri, 10 Jun 2016 15:17:48 +0300
Message-ID: <2053199.LgvzIZkihe@avalon>
References: <1465552699-5990-1-git-send-email-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-sh-owner@vger.kernel.org>
In-Reply-To: <1465552699-5990-1-git-send-email-geert+renesas@glider.be>
Sender: linux-sh-owner@vger.kernel.org
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-renesas-soc@vger.kernel.org, linux-sh@vger.kernel.org, linux-gpio@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

Hi Geert,

Thank you for the patch.

On Friday 10 Jun 2016 11:58:19 Geert Uytterhoeven wrote:
> With C=1:
> 
>     drivers/pinctrl/sh-pfc/pfc-sh7757.c:1613:9: warning: Initializer entry
> defined twice drivers/pinctrl/sh-pfc/pfc-sh7757.c:1628:9:   also defined
> here
> 
> Remove the duplicate initializer to fix this.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
> Based on the comment near the definition of A16_MARK, which states A16
> belongs to the "PTV" section.
> 
> I do not have a sh7757 datasheet.
> ---
>  drivers/pinctrl/sh-pfc/pfc-sh7757.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/pinctrl/sh-pfc/pfc-sh7757.c
> b/drivers/pinctrl/sh-pfc/pfc-sh7757.c index
> 0555a1fe076ed353..6d8c31caefc105e0 100644
> --- a/drivers/pinctrl/sh-pfc/pfc-sh7757.c
> +++ b/drivers/pinctrl/sh-pfc/pfc-sh7757.c
> @@ -1625,7 +1625,6 @@ static const struct pinmux_func pinmux_func_gpios[] =
> { GPIO_FN(VBIOS_CS),
> 
>  	/* PTW (mobule: LBSC, EVC, SCIF) */
> -	GPIO_FN(A16),
>  	GPIO_FN(A15),
>  	GPIO_FN(A14),
>  	GPIO_FN(A13),

-- 
Regards,

Laurent Pinchart

