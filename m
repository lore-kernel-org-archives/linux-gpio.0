From: Hongzhou Yang <hongzhou.yang@mediatek.com>
Subject: Re: [PATCH] pinctrl: mediatek: mt8135/mt8173: Constify of_device_id
 table
Date: Fri, 13 Mar 2015 12:50:35 -0700
Message-ID: <1426276235.22708.8.camel@mussux00.eus.mediatek.inc>
References: <1426229083.15007.1.camel@phoenix>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mailgw01.mediatek.com ([66.228.70.111]:40804 "EHLO
	mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
	with ESMTP id S932260AbbCMTzn (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 13 Mar 2015 15:55:43 -0400
In-Reply-To: <1426229083.15007.1.camel@phoenix>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Axel Lin <axel.lin@ingics.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Fri, 2015-03-13 at 14:44 +0800, Axel Lin wrote:
> Also make the table a bit compact.
> 
> Signed-off-by: Axel Lin <axel.lin@ingics.com>
> ---
>  drivers/pinctrl/mediatek/pinctrl-mt8135.c | 8 +++-----
>  drivers/pinctrl/mediatek/pinctrl-mt8173.c | 8 +++-----
>  2 files changed, 6 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/pinctrl/mediatek/pinctrl-mt8135.c b/drivers/pinctrl/mediatek/pinctrl-mt8135.c
> index 1296d6d..b7e91c1 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-mt8135.c
> +++ b/drivers/pinctrl/mediatek/pinctrl-mt8135.c
> @@ -347,11 +347,9 @@ static int mt8135_pinctrl_probe(struct platform_device *pdev)
>  	return mtk_pctrl_init(pdev, &mt8135_pinctrl_data);
>  }
>  
> -static struct of_device_id mt8135_pctrl_match[] = {
> -	{
> -		.compatible = "mediatek,mt8135-pinctrl",
> -	}, {
> -	}
> +static const struct of_device_id mt8135_pctrl_match[] = {
> +	{ .compatible = "mediatek,mt8135-pinctrl", },
> +	{ }
>  };
>  MODULE_DEVICE_TABLE(of, mt8135_pctrl_match);
>  
> diff --git a/drivers/pinctrl/mediatek/pinctrl-mt8173.c b/drivers/pinctrl/mediatek/pinctrl-mt8173.c
> index f07cafb..46e4f6e 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-mt8173.c
> +++ b/drivers/pinctrl/mediatek/pinctrl-mt8173.c
> @@ -427,11 +427,9 @@ static int mt8173_pinctrl_probe(struct platform_device *pdev)
>  	return mtk_pctrl_init(pdev, &mt8173_pinctrl_data);
>  }
>  
> -static struct of_device_id mt8173_pctrl_match[] = {
> -	{
> -		.compatible = "mediatek,mt8173-pinctrl",
> -	}, {
> -	}
> +static const struct of_device_id mt8173_pctrl_match[] = {
> +	{ .compatible = "mediatek,mt8173-pinctrl", },
> +	{ }
>  };
>  MODULE_DEVICE_TABLE(of, mt8173_pctrl_match);
>  

Hi Axel,

Thank you very much.

Acked-by: Hongzhou Yang <hongzhou.yang@mediatek.com>

Hongzhou

