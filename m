From: Hongzhou Yang <hongzhou.yang@mediatek.com>
Subject: Re: [PATCH 2/2] pinctrl: mediatek: mtk-common: Use devm_kcalloc at
 appropriate places
Date: Fri, 13 Mar 2015 12:47:55 -0700
Message-ID: <1426276075.22708.7.camel@mussux00.eus.mediatek.inc>
References: <1426168353.30920.2.camel@phoenix>
	 <1426168412.30920.3.camel@phoenix>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mailgw02.mediatek.com ([66.228.70.112]:45567 "EHLO
	mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
	with ESMTP id S1757107AbbCMTxD (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 13 Mar 2015 15:53:03 -0400
In-Reply-To: <1426168412.30920.3.camel@phoenix>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Axel Lin <axel.lin@ingics.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, Chaotian Jing <chaotian.jing@mediatek.com>, Yingjoe Chen <yingjoe.chen@mediatek.com>, Maoguang Meng <maoguang.meng@mediatek.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Thu, 2015-03-12 at 21:53 +0800, Axel Lin wrote:
> Prefer devm_kcalloc over devm_kzalloc with multiply.
> 
> Signed-off-by: Axel Lin <axel.lin@ingics.com>
> ---
>  drivers/pinctrl/mediatek/pinctrl-mtk-common.c | 17 +++++++----------
>  1 file changed, 7 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
> index f82f57a..493294c 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
> +++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
> @@ -1076,16 +1076,14 @@ static int mtk_pctrl_build_state(struct platform_device *pdev)
>  	pctl->ngroups = pctl->devdata->npins;
>  
>  	/* Allocate groups */
> -	pctl->groups = devm_kzalloc(&pdev->dev,
> -				    pctl->ngroups * sizeof(*pctl->groups),
> -				    GFP_KERNEL);
> +	pctl->groups = devm_kcalloc(&pdev->dev, pctl->ngroups,
> +				    sizeof(*pctl->groups), GFP_KERNEL);
>  	if (!pctl->groups)
>  		return -ENOMEM;
>  
>  	/* We assume that one pin is one group, use pin name as group name. */
> -	pctl->grp_names = devm_kzalloc(&pdev->dev,
> -				    pctl->ngroups * sizeof(*pctl->grp_names),
> -				    GFP_KERNEL);
> +	pctl->grp_names = devm_kcalloc(&pdev->dev, pctl->ngroups,
> +				       sizeof(*pctl->grp_names), GFP_KERNEL);
>  	if (!pctl->grp_names)
>  		return -ENOMEM;
>  
> @@ -1152,8 +1150,7 @@ int mtk_pctrl_init(struct platform_device *pdev,
>  		return -EINVAL;
>  	}
>  
> -	pins = devm_kzalloc(&pdev->dev,
> -			    pctl->devdata->npins * sizeof(*pins),
> +	pins = devm_kcalloc(&pdev->dev, pctl->devdata->npins, sizeof(*pins),
>  			    GFP_KERNEL);
>  	if (!pins)
>  		return -ENOMEM;
> @@ -1211,8 +1208,8 @@ int mtk_pctrl_init(struct platform_device *pdev,
>  		goto chip_error;
>  	}
>  
> -	pctl->eint_dual_edges = devm_kzalloc(&pdev->dev,
> -			sizeof(int) * pctl->devdata->ap_num, GFP_KERNEL);
> +	pctl->eint_dual_edges = devm_kcalloc(&pdev->dev, pctl->devdata->ap_num,
> +					     sizeof(int), GFP_KERNEL);
>  	if (!pctl->eint_dual_edges) {
>  		ret = -ENOMEM;
>  		goto chip_error;

Hi Axel,

Thanks a lot.

Acked-by: Hongzhou Yang <hongzhou.yang@mediatek.com>

Hongzhou

