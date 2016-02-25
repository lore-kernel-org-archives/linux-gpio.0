From: John Crispin <blogic@openwrt.org>
Subject: Re: [PATCH 39/50] pinctrl: lantiq: Use devm_pinctrl_register() for
 pinctrl registration
Date: Thu, 25 Feb 2016 15:24:49 +0100
Message-ID: <56CF0EB1.304@openwrt.org>
References: <1456319775-3216-1-git-send-email-ldewangan@nvidia.com>
 <1456319775-3216-40-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from arrakis.dune.hu ([78.24.191.176]:52113 "EHLO arrakis.dune.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1760085AbcBYOYz (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Thu, 25 Feb 2016 09:24:55 -0500
In-Reply-To: <1456319775-3216-40-git-send-email-ldewangan@nvidia.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>, linus.walleij@linaro.org, corbet@lwn.net, lee@kernel.org
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org



On 24/02/2016 14:16, Laxman Dewangan wrote:
> Use devm_pinctrl_register() for pin control registration.
> 
> Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>

Acked-by: John Crispin <blogic@openwrt.org>




> ---
>  drivers/pinctrl/pinctrl-lantiq.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pinctrl/pinctrl-lantiq.c b/drivers/pinctrl/pinctrl-lantiq.c
> index fc38a85..a4d6474 100644
> --- a/drivers/pinctrl/pinctrl-lantiq.c
> +++ b/drivers/pinctrl/pinctrl-lantiq.c
> @@ -336,7 +336,7 @@ int ltq_pinctrl_register(struct platform_device *pdev,
>  	desc->pmxops = &ltq_pmx_ops;
>  	info->dev = &pdev->dev;
>  
> -	info->pctrl = pinctrl_register(desc, &pdev->dev, info);
> +	info->pctrl = devm_pinctrl_register(&pdev->dev, desc, info);
>  	if (IS_ERR(info->pctrl)) {
>  		dev_err(&pdev->dev, "failed to register LTQ pinmux driver\n");
>  		return PTR_ERR(info->pctrl);
> 
