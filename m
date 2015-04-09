From: Bjorn Andersson <bjorn.andersson@sonymobile.com>
Subject: Re: [PATCH 3/3] pinctrl: qcom-spmi-mpp: Fix input value report
Date: Thu, 9 Apr 2015 09:03:55 -0700
Message-ID: <20150409160355.GI19186@sonymobile.com>
References: <1428592717-21706-1-git-send-email-ivan.ivanov@linaro.org>
 <1428592717-21706-3-git-send-email-ivan.ivanov@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from seldrel01.sonyericsson.com ([212.209.106.2]:12380 "EHLO
	seldrel01.sonyericsson.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S932708AbbDIQEB (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 9 Apr 2015 12:04:01 -0400
Content-Disposition: inline
In-Reply-To: <1428592717-21706-3-git-send-email-ivan.ivanov@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: "Ivan T. Ivanov" <ivan.ivanov@linaro.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>

On Thu 09 Apr 08:18 PDT 2015, Ivan T. Ivanov wrote:

> Fix interpretation of the pmic_mpp_read() return code,
> negative value means an error.
> 
> Signed-off-by: Ivan T. Ivanov <ivan.ivanov@linaro.org>
> ---
>  drivers/pinctrl/qcom/pinctrl-spmi-mpp.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/pinctrl/qcom/pinctrl-spmi-mpp.c b/drivers/pinctrl/qcom/pinctrl-spmi-mpp.c
> index 8f36c5f..8f6c7be 100644
> --- a/drivers/pinctrl/qcom/pinctrl-spmi-mpp.c
> +++ b/drivers/pinctrl/qcom/pinctrl-spmi-mpp.c
> @@ -576,10 +576,11 @@ static void pmic_mpp_config_dbg_show(struct pinctrl_dev *pctldev,
> 
>  		if (pad->input_enabled) {
>  			ret = pmic_mpp_read(state, pad, PMIC_MPP_REG_RT_STS);
> -			if (!ret) {
> -				ret &= PMIC_MPP_REG_RT_STS_VAL_MASK;
> -				pad->out_value = ret;
> -			}
> +			if (ret < 0)
> +				return;
> +
> +			ret &= PMIC_MPP_REG_RT_STS_VAL_MASK;
> +			pad->out_value = ret;

Same as with the gpio driver.

Reviewed-by: Bjorn Andersson <bjorn.andersson@sonymobile.com>

Regards,
Bjrn
