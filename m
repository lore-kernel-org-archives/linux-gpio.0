From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH -next] sh-pfc: Use PTR_ERR_OR_ZERO() to simplify the code
Date: Wed, 06 Jul 2016 16:01:53 +0300
Message-ID: <1961959.7IpAs0pFbF@avalon>
References: <1467806612-23904-1-git-send-email-weiyj_lk@163.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1467806612-23904-1-git-send-email-weiyj_lk@163.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: weiyj_lk@163.com
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Linus Walleij <linus.walleij@linaro.org>, Wei Yongjun <yongjun_wei@trendmicro.com.cn>, linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

Hello Wei,

Thank you for the patch.

On Wednesday 06 Jul 2016 12:03:32 weiyj_lk@163.com wrote:
> From: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
> 
> Use PTR_ERR_OR_ZERO rather than if(IS_ERR(...)) + PTR_ERR.
> 
> Signed-off-by: Wei Yongjun <yongjun_wei@trendmicro.com.cn>

Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/pinctrl/sh-pfc/pinctrl.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/drivers/pinctrl/sh-pfc/pinctrl.c
> b/drivers/pinctrl/sh-pfc/pinctrl.c index d4e65bc..e208ee0 100644
> --- a/drivers/pinctrl/sh-pfc/pinctrl.c
> +++ b/drivers/pinctrl/sh-pfc/pinctrl.c
> @@ -814,8 +814,5 @@ int sh_pfc_register_pinctrl(struct sh_pfc *pfc)
>  	pmx->pctl_desc.npins = pfc->info->nr_pins;
> 
>  	pmx->pctl = devm_pinctrl_register(pfc->dev, &pmx->pctl_desc, pmx);
> -	if (IS_ERR(pmx->pctl))
> -		return PTR_ERR(pmx->pctl);
> -
> -	return 0;
> +	return PTR_ERR_OR_ZERO(pmx->pctl);
>  }

-- 
Regards,

Laurent Pinchart
