From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH 21/50] pinctrl: msm: Use devm_pinctrl_register() for
 pinctrl registration
Date: Wed, 24 Feb 2016 10:11:09 -0800
Message-ID: <20160224181109.GO21240@tuxbot>
References: <1456319775-3216-1-git-send-email-ldewangan@nvidia.com>
 <1456319775-3216-22-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pa0-f50.google.com ([209.85.220.50]:32925 "EHLO
	mail-pa0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753606AbcBXSLN (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 24 Feb 2016 13:11:13 -0500
Received: by mail-pa0-f50.google.com with SMTP id fl4so16661239pad.0
        for <linux-gpio@vger.kernel.org>; Wed, 24 Feb 2016 10:11:13 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <1456319775-3216-22-git-send-email-ldewangan@nvidia.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: linus.walleij@linaro.org, corbet@lwn.net, lee@kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com, linux-mediatek@lists.infradead.org, Bjorn Andersson <bjorn.andersson@sonymobile.com>, Thomas Gleixner <tglx@linutronix.de>, Lee Jones <lee.jones@linaro.org>, Stephen Boyd <sboyd@codeaurora.org>

On Wed 24 Feb 05:15 PST 2016, Laxman Dewangan wrote:

> Use devm_pinctrl_register() for pin control registration and clean
> the error path.
> 
> Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
> Cc: Bjorn Andersson <bjorn.andersson@sonymobile.com>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Lee Jones <lee.jones@linaro.org>
> Cc: Stephen Boyd <sboyd@codeaurora.org>
> ---

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

>  drivers/pinctrl/qcom/pinctrl-msm.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
> index 8777cf0..dc7bf77 100644
> --- a/drivers/pinctrl/qcom/pinctrl-msm.c
> +++ b/drivers/pinctrl/qcom/pinctrl-msm.c
> @@ -898,17 +898,16 @@ int msm_pinctrl_probe(struct platform_device *pdev,
>  	msm_pinctrl_desc.name = dev_name(&pdev->dev);
>  	msm_pinctrl_desc.pins = pctrl->soc->pins;
>  	msm_pinctrl_desc.npins = pctrl->soc->npins;
> -	pctrl->pctrl = pinctrl_register(&msm_pinctrl_desc, &pdev->dev, pctrl);
> +	pctrl->pctrl = devm_pinctrl_register(&pdev->dev, &msm_pinctrl_desc,
> +					     pctrl);
>  	if (IS_ERR(pctrl->pctrl)) {
>  		dev_err(&pdev->dev, "Couldn't register pinctrl driver\n");
>  		return PTR_ERR(pctrl->pctrl);
>  	}
>  
>  	ret = msm_gpio_init(pctrl);
> -	if (ret) {
> -		pinctrl_unregister(pctrl->pctrl);
> +	if (ret)
>  		return ret;
> -	}
>  
>  	platform_set_drvdata(pdev, pctrl);
>  
> @@ -923,7 +922,6 @@ int msm_pinctrl_remove(struct platform_device *pdev)
>  	struct msm_pinctrl *pctrl = platform_get_drvdata(pdev);
>  
>  	gpiochip_remove(&pctrl->chip);
> -	pinctrl_unregister(pctrl->pctrl);
>  
>  	unregister_restart_handler(&pctrl->restart_nb);
>  
> -- 
> 2.1.4
> 
