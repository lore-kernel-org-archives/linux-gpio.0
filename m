From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [RFT PATCH 2/2] pinctrl: spmi-mpp: Fix pmic_mpp_config_get() to
 be compliant
Date: Mon, 3 Sep 2018 14:04:07 -0700
Message-ID: <20180903210407.GE1437@tuxbook-pro>
References: <20180830152340.242249-1-dianders@chromium.org>
 <20180830152340.242249-3-dianders@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180830152340.242249-3-dianders@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Douglas Anderson <dianders@chromium.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, "Ivan T . Ivanov" <iivanov@mm-sol.com>, Stephen Boyd <swboyd@chromium.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

On Thu 30 Aug 08:23 PDT 2018, Douglas Anderson wrote:

> If you look at "pinconf-groups" in debugfs for ssbi-mpp you'll notice
> it looks like nonsense.
> 
> The problem is fairly well described in commit 1cf86bc21257 ("pinctrl:
> qcom: spmi-gpio: Fix pmic_gpio_config_get() to be compliant") and
> commit 05e0c828955c ("pinctrl: msm: Fix msm_config_group_get() to be
> compliant"), but it was pointed out that ssbi-mpp has the same
> problem.  Let's fix it there too.
> 
> NOTE: in case it's helpful to someone reading this, the way to tell
> whether to do the -EINVAL or not is to look at the PCONFDUMP for a
> given attribute.  If the last element (has_arg) is false then you need
> to do the -EINVAL trick.
> 
> ALSO NOTE: it seems unlikely that the values returned when we try to
> get PIN_CONFIG_BIAS_PULL_UP will actually be printed since "has_arg"
> is false for that one, but I guess it's still fine to return different
> values so I kept doing that.  It seems like another driver (ssbi-gpio)
> uses a custom attribute (PM8XXX_QCOM_PULL_UP_STRENGTH) for something
> similar so maybe a future change should do that here too.
> 
> Fixes: cfb24f6ebd38 ("pinctrl: Qualcomm SPMI PMIC MPP pin controller driver")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> ---
> 
>  drivers/pinctrl/qcom/pinctrl-spmi-mpp.c | 19 ++++++++++++-------
>  1 file changed, 12 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/pinctrl/qcom/pinctrl-spmi-mpp.c b/drivers/pinctrl/qcom/pinctrl-spmi-mpp.c
> index 6556dbeae65e..ce2950ffd525 100644
> --- a/drivers/pinctrl/qcom/pinctrl-spmi-mpp.c
> +++ b/drivers/pinctrl/qcom/pinctrl-spmi-mpp.c
> @@ -343,13 +343,12 @@ static int pmic_mpp_config_get(struct pinctrl_dev *pctldev,
>  
>  	switch (param) {
>  	case PIN_CONFIG_BIAS_DISABLE:
> -		arg = pad->pullup == PMIC_MPP_PULL_UP_OPEN;
> +		if (pad->pullup != PMIC_MPP_PULL_UP_OPEN)
> +			return -EINVAL;
> +		arg = 1;
>  		break;
>  	case PIN_CONFIG_BIAS_PULL_UP:
>  		switch (pad->pullup) {
> -		case PMIC_MPP_PULL_UP_OPEN:
> -			arg = 0;
> -			break;
>  		case PMIC_MPP_PULL_UP_0P6KOHM:
>  			arg = 600;
>  			break;
> @@ -364,13 +363,17 @@ static int pmic_mpp_config_get(struct pinctrl_dev *pctldev,
>  		}
>  		break;
>  	case PIN_CONFIG_BIAS_HIGH_IMPEDANCE:
> -		arg = !pad->is_enabled;
> +		if (pad->is_enabled)
> +			return -EINVAL;
> +		arg = 1;
>  		break;
>  	case PIN_CONFIG_POWER_SOURCE:
>  		arg = pad->power_source;
>  		break;
>  	case PIN_CONFIG_INPUT_ENABLE:
> -		arg = pad->input_enabled;
> +		if (!pad->input_enabled)
> +			return -EINVAL;
> +		arg = 1;
>  		break;
>  	case PIN_CONFIG_OUTPUT:
>  		arg = pad->out_value;
> @@ -382,7 +385,9 @@ static int pmic_mpp_config_get(struct pinctrl_dev *pctldev,
>  		arg = pad->amux_input;
>  		break;
>  	case PMIC_MPP_CONF_PAIRED:
> -		arg = pad->paired;
> +		if (!pad->paired)
> +			return -EINVAL;
> +		arg = 1;
>  		break;
>  	case PIN_CONFIG_DRIVE_STRENGTH:
>  		arg = pad->drive_strength;
> -- 
> 2.19.0.rc0.228.g281dcd1b4d0-goog
> 
