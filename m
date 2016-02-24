From: Ray Jui <ray.jui@broadcom.com>
Subject: Re: [PATCH 03/50] pinctrl: bcm281xx: Use devm_pinctrl_register() for
 pinctrl registration
Date: Wed, 24 Feb 2016 10:25:38 -0800
Message-ID: <d5eeb969-8c51-e716-ff21-084feed01183@broadcom.com>
References: <1456319775-3216-1-git-send-email-ldewangan@nvidia.com>
 <1456319775-3216-4-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from 5520-maca-inet1-outside.broadcom.com ([216.31.211.11]:28631
	"EHLO mail-irv-18.broadcom.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1758098AbcBXSZj (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>);
	Wed, 24 Feb 2016 13:25:39 -0500
In-Reply-To: <1456319775-3216-4-git-send-email-ldewangan@nvidia.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>, linus.walleij@linaro.org, corbet@lwn.net, lee@kernel.org
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com, linux-mediatek@lists.infradead.org, Ray Jui <rjui@broadcom.com>



On 2/24/2016 5:15 AM, Laxman Dewangan wrote:
> Use devm_pinctrl_register() for pin control registration.
>
> Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
> Cc: Ray Jui <rjui@broadcom.com>
> ---
>  drivers/pinctrl/bcm/pinctrl-bcm281xx.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/drivers/pinctrl/bcm/pinctrl-bcm281xx.c b/drivers/pinctrl/bcm/pinctrl-bcm281xx.c
> index c3c692e..0c0c0f0 100644
> --- a/drivers/pinctrl/bcm/pinctrl-bcm281xx.c
> +++ b/drivers/pinctrl/bcm/pinctrl-bcm281xx.c
> @@ -1422,9 +1422,7 @@ static int __init bcm281xx_pinctrl_probe(struct platform_device *pdev)
>  	bcm281xx_pinctrl_desc.pins = bcm281xx_pinctrl.pins;
>  	bcm281xx_pinctrl_desc.npins = bcm281xx_pinctrl.npins;
>
> -	pctl = pinctrl_register(&bcm281xx_pinctrl_desc,
> -				&pdev->dev,
> -				pdata);
> +	pctl = devm_pinctrl_register(&pdev->dev, &bcm281xx_pinctrl_desc, pdata);
>  	if (IS_ERR(pctl)) {
>  		dev_err(&pdev->dev, "Failed to register pinctrl\n");
>  		return PTR_ERR(pctl);
>

Acked-by: Ray Jui <ray.jui@broadcom.com>

Thanks!

Ray
