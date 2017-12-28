From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH] pinctrl: spear: Delete an error message for a failed
 memory allocation in spear_pinctrl_probe()
Date: Thu, 28 Dec 2017 10:57:03 +0530
Message-ID: <20171228052703.GD8652@vireshk-i7>
References: <3d936763-6a8a-edd3-3bcf-0075c9343e37@users.sourceforge.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pg0-f67.google.com ([74.125.83.67]:47065 "EHLO
        mail-pg0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751062AbdL1F1G (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 28 Dec 2017 00:27:06 -0500
Received: by mail-pg0-f67.google.com with SMTP id r2so4171525pgq.13
        for <linux-gpio@vger.kernel.org>; Wed, 27 Dec 2017 21:27:06 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <3d936763-6a8a-edd3-3bcf-0075c9343e37@users.sourceforge.net>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Linus Walleij <linus.walleij@linaro.org>, Viresh Kumar <vireshk@kernel.org>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On 27-12-17, 22:48, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Wed, 27 Dec 2017 22:44:04 +0100
> 
> Omit an extra message for a memory allocation failure in this function.
> 
> This issue was detected by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  drivers/pinctrl/spear/pinctrl-spear.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/pinctrl/spear/pinctrl-spear.c b/drivers/pinctrl/spear/pinctrl-spear.c
> index 4db52ba38d8d..efe79d3f7659 100644
> --- a/drivers/pinctrl/spear/pinctrl-spear.c
> +++ b/drivers/pinctrl/spear/pinctrl-spear.c
> @@ -361,10 +361,8 @@ int spear_pinctrl_probe(struct platform_device *pdev,
>  		return -ENODEV;
>  
>  	pmx = devm_kzalloc(&pdev->dev, sizeof(*pmx), GFP_KERNEL);
> -	if (!pmx) {
> -		dev_err(&pdev->dev, "Can't alloc spear_pmx\n");
> +	if (!pmx)
>  		return -ENOMEM;
> -	}
>  
>  	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>  	pmx->vbase = devm_ioremap_resource(&pdev->dev, res);

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
