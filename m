From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH V1] pinctrl: qcom: spmi-gpio: Correct power_source range
 check
Date: Wed, 23 Aug 2017 22:03:26 -0700
Message-ID: <20170824050326.GD29306@minitux>
References: <20170719064121.13948-1-fenglinw@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pg0-f43.google.com ([74.125.83.43]:34330 "EHLO
        mail-pg0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751038AbdHXFDa (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 24 Aug 2017 01:03:30 -0400
Received: by mail-pg0-f43.google.com with SMTP id s14so11055740pgs.1
        for <linux-gpio@vger.kernel.org>; Wed, 23 Aug 2017 22:03:30 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <20170719064121.13948-1-fenglinw@codeaurora.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: fenglinw@codeaurora.org
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, collinsd@codeaurora.org, aghayal@codeaurora.org, wruan@codeaurora.org, kgunda@codeaurora.org

On Tue 18 Jul 23:39 PDT 2017, fenglinw@codeaurora.org wrote:

> From: Fenglin Wu <fenglinw@codeaurora.org>
> 
> Power source selection in DIG_VIN_CTL is indexed from 0, in the range
> check it shouldn't be equal to the total number of power sources.
> 

Acked-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> Signed-off-by: Fenglin Wu <fenglinw@codeaurora.org>
> ---
>  drivers/pinctrl/qcom/pinctrl-spmi-gpio.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
> index 664b641..8b77c04 100644
> --- a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
> +++ b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
> @@ -375,7 +375,7 @@ static int pmic_gpio_config_set(struct pinctrl_dev *pctldev, unsigned int pin,
>  			pad->is_enabled = false;
>  			break;
>  		case PIN_CONFIG_POWER_SOURCE:
> -			if (arg > pad->num_sources)
> +			if (arg >= pad->num_sources)
>  				return -EINVAL;
>  			pad->power_source = arg;
>  			break;
> -- 
> Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project.
> 
