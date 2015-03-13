From: Yingjoe Chen <yingjoe.chen@mediatek.com>
Subject: Re: [PATCH 1/2] pinctrl: mediatek: mtk-common: Remove kfree for
 memory allocated by devm_kzalloc
Date: Fri, 13 Mar 2015 21:47:21 +0800
Message-ID: <1426254441.16768.315.camel@mtksdaap41>
References: <1426168353.30920.2.camel@phoenix>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mailgw02.mediatek.com ([210.61.82.184]:34996 "EHLO
	mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
	with ESMTP id S1751209AbbCMNr2 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 13 Mar 2015 09:47:28 -0400
In-Reply-To: <1426168353.30920.2.camel@phoenix>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Axel Lin <axel.lin@ingics.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, Hongzhou Yang <hongzhou.yang@mediatek.com>, Chaotian Jing <chaotian.jing@mediatek.com>, Maoguang Meng <maoguang.meng@mediatek.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Thu, 2015-03-12 at 21:52 +0800, Axel Lin wrote:
> Signed-off-by: Axel Lin <axel.lin@ingics.com>
> ---
>  drivers/pinctrl/mediatek/pinctrl-mtk-common.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
> index b8f8bef..f82f57a 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
> +++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
> @@ -1222,7 +1222,7 @@ int mtk_pctrl_init(struct platform_device *pdev,
>  	if (!irq) {
>  		dev_err(&pdev->dev, "couldn't parse and map irq\n");
>  		ret = -EINVAL;
> -		goto free_edges;
> +		goto chip_error;
>  	}
>  
>  	pctl->domain = irq_domain_add_linear(np,
> @@ -1230,7 +1230,7 @@ int mtk_pctrl_init(struct platform_device *pdev,
>  	if (!pctl->domain) {
>  		dev_err(&pdev->dev, "Couldn't register IRQ domain\n");
>  		ret = -ENOMEM;
> -		goto free_edges;
> +		goto chip_error;
>  	}
>  
>  	mtk_eint_init(pctl);
> @@ -1248,8 +1248,6 @@ int mtk_pctrl_init(struct platform_device *pdev,
>  	set_irq_flags(irq, IRQF_VALID);
>  	return 0;
>  
> -free_edges:
> -	kfree(pctl->eint_dual_edges);
>  chip_error:
>  	gpiochip_remove(pctl->chip);
>  pctrl_error:

Hi Axel,

Thanks for fixing my bugs :)

Acked-by: Yingjoe Chen <yingjoe.chen@mediatek.com>

Joe.C



