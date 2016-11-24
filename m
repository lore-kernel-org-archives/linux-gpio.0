From: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
Subject: Re: [PATCH] pinctrl: imx: fix imx_pinctrl_desc initialization
Date: Thu, 24 Nov 2016 22:17:55 +0200
Message-ID: <fac988ce-f5be-e50c-8436-c122175f03da@mentor.com>
References: <20161124181151.29419-1-gary.bisson@boundarydevices.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from relay1.mentorg.com ([192.94.38.131]:63529 "EHLO
        relay1.mentorg.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1757276AbcKXUSJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 24 Nov 2016 15:18:09 -0500
In-Reply-To: <20161124181151.29419-1-gary.bisson@boundarydevices.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Gary Bisson <gary.bisson@boundarydevices.com>, shawnguo@kernel.org
Cc: linus.walleij@linaro.org, van.freenix@gmail.com, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Gary,

On 11/24/2016 08:11 PM, Gary Bisson wrote:
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
>

excellent catch, my compiler does not report the issue.

Subject and commit message are not quite informative, but
the change is trivial, so please feel free to add my

Reviewed-by: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>

--
With best wishes,
Vladimir
