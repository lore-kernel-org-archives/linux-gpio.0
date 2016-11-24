From: Gary Bisson <gary.bisson@boundarydevices.com>
Subject: Re: [PATCH] pinctrl: imx: fix imx_pinctrl_desc initialization
Date: Thu, 24 Nov 2016 19:14:12 +0100
Message-ID: <20161124181412.k2r246pwoeft3b65@t450s.lan>
References: <20161124181151.29419-1-gary.bisson@boundarydevices.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wj0-f175.google.com ([209.85.210.175]:35544 "EHLO
        mail-wj0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S934360AbcKXSVS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 24 Nov 2016 13:21:18 -0500
Received: by mail-wj0-f175.google.com with SMTP id v7so39733634wjy.2
        for <linux-gpio@vger.kernel.org>; Thu, 24 Nov 2016 10:21:17 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <20161124181151.29419-1-gary.bisson@boundarydevices.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: shawnguo@kernel.org
Cc: linus.walleij@linaro.org, vladimir_zapolskiy@mentor.com, van.freenix@gmail.com, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org

Hi all,

Just resending this email since there was a typo in Shawn's e-mail
address.

Regards,
Gary

On Thu, Nov 24, 2016 at 07:11:51PM +0100, Gary Bisson wrote:
> Was introduced by:
> 6e408ed pinctrl: imx: fix initialization of imx_pinctrl_desc
> 
> Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
> ---
>  drivers/pinctrl/freescale/pinctrl-imx.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/pinctrl/freescale/pinctrl-imx.c b/drivers/pinctrl/freescale/pinctrl-imx.c
> index 79c4e14..5ef7e87 100644
> --- a/drivers/pinctrl/freescale/pinctrl-imx.c
> +++ b/drivers/pinctrl/freescale/pinctrl-imx.c
> @@ -778,10 +778,10 @@ int imx_pinctrl_probe(struct platform_device *pdev,
>  	imx_pinctrl_desc->name = dev_name(&pdev->dev);
>  	imx_pinctrl_desc->pins = info->pins;
>  	imx_pinctrl_desc->npins = info->npins;
> -	imx_pinctrl_desc->pctlops = &imx_pctrl_ops,
> -	imx_pinctrl_desc->pmxops = &imx_pmx_ops,
> -	imx_pinctrl_desc->confops = &imx_pinconf_ops,
> -	imx_pinctrl_desc->owner = THIS_MODULE,
> +	imx_pinctrl_desc->pctlops = &imx_pctrl_ops;
> +	imx_pinctrl_desc->pmxops = &imx_pmx_ops;
> +	imx_pinctrl_desc->confops = &imx_pinconf_ops;
> +	imx_pinctrl_desc->owner = THIS_MODULE;
>  
>  	ret = imx_pinctrl_probe_dt(pdev, info);
>  	if (ret) {
> -- 
> 2.9.3
> 
