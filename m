From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH V1 3/3] pinctrl: qcom: spmi-gpio: Correct power_source
 range check
Date: Wed, 12 Jul 2017 14:33:14 -0700
Message-ID: <20170712213314.GL1618@tuxbook>
References: <20170613061707.13892-1-fenglinw@codeaurora.org>
 <20170613061707.13892-4-fenglinw@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170613061707.13892-4-fenglinw@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: fenglinw@codeaurora.org, Linus Walleij <linus.walleij@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, linux-soc@vger.kernel.org, linux-gpio@vger.kernel.org, collinsd@quicinc.com, aghayal@qti.qualcomm.com, wruan@quicinc.com, kgunda@qti.qualcomm.com
List-Id: linux-gpio@vger.kernel.org

On Mon 12 Jun 23:16 PDT 2017, fenglinw@codeaurora.org wrote:

> From: Fenglin Wu <fenglinw@codeaurora.org>
> 
> Power source selection in DIG_VIN_CTL is indexed from 0, in the range
> check it shouldn't be equal to the total number of power sources.
> 
> Signed-off-by: Fenglin Wu <fenglinw@codeaurora.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

This patch is unrelated to the other patches in the series, when this is
the case it's better to send it on its own.

Regards,
Bjorn

> ---
>  drivers/pinctrl/qcom/pinctrl-spmi-gpio.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
> index 581309d..1fd677c 100644
> --- a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
> +++ b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
> @@ -500,7 +500,7 @@ static int pmic_gpio_config_set(struct pinctrl_dev *pctldev, unsigned int pin,
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
