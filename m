From: Stanimir Varbanov <svarbanov@mm-sol.com>
Subject: Re: [PATCH] pinctrl/qcom Kconfig CFG repeated
Date: Wed, 15 Jul 2015 18:04:42 +0300
Message-ID: <55A6768A.7010605@mm-sol.com>
References: <1436972027-2914-1-git-send-email-simhavcs@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from ns.mm-sol.com ([37.157.136.199]:33519 "EHLO extserv.mm-sol.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751987AbbGOPEq (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Wed, 15 Jul 2015 11:04:46 -0400
In-Reply-To: <1436972027-2914-1-git-send-email-simhavcs@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Vinay Simha BN <simhavcs@gmail.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: Bjorn Andersson <bjorn.andersson@sonymobile.com>, "Ivan T. Ivanov" <iivanov@mm-sol.com>, Joonwoo Park <joonwoop@codeaurora.org>, Georgi Djakov <gdjakov@mm-sol.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org

On 07/15/2015 05:53 PM, Vinay Simha BN wrote:
> repeatation of the same configs
> obj-$(CONFIG_PINCTRL_APQ8084)   += pinctrl-apq8084.o

hm you might be kidding, apq8064 and apq8084 are different SoCs.

> 
> Signed-off-by: Vinay Simha BN <simhavcs@gmail.com>
> ---
>  drivers/pinctrl/qcom/Makefile | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/pinctrl/qcom/Makefile b/drivers/pinctrl/qcom/Makefile
> index 3666c70..d26a878 100644
> --- a/drivers/pinctrl/qcom/Makefile
> +++ b/drivers/pinctrl/qcom/Makefile
> @@ -1,7 +1,6 @@
>  # Qualcomm pin control drivers
>  obj-$(CONFIG_PINCTRL_MSM)	+= pinctrl-msm.o
>  obj-$(CONFIG_PINCTRL_APQ8064)	+= pinctrl-apq8064.o
> -obj-$(CONFIG_PINCTRL_APQ8084)	+= pinctrl-apq8084.o
>  obj-$(CONFIG_PINCTRL_IPQ8064)	+= pinctrl-ipq8064.o
>  obj-$(CONFIG_PINCTRL_MSM8660)	+= pinctrl-msm8660.o
>  obj-$(CONFIG_PINCTRL_MSM8960)	+= pinctrl-msm8960.o
> 


-- 
regards,
Stan
