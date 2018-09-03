From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [RFT PATCH 1/2] pinctrl: ssbi-gpio: Fix pm8xxx_pin_config_get()
 to be compliant
Date: Mon, 3 Sep 2018 14:01:59 -0700
Message-ID: <20180903210159.GD1437@tuxbook-pro>
References: <20180830152340.242249-1-dianders@chromium.org>
 <20180830152340.242249-2-dianders@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180830152340.242249-2-dianders@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Douglas Anderson <dianders@chromium.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, "Ivan T . Ivanov" <iivanov@mm-sol.com>, Stephen Boyd <swboyd@chromium.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

On Thu 30 Aug 08:23 PDT 2018, Douglas Anderson wrote:

> If you look at "pinconf-groups" in debugfs for ssbi-gpio you'll notice
> it looks like nonsense.
> 
> The problem is fairly well described in commit 1cf86bc21257 ("pinctrl:
> qcom: spmi-gpio: Fix pmic_gpio_config_get() to be compliant") and
> commit 05e0c828955c ("pinctrl: msm: Fix msm_config_group_get() to be
> compliant"), but it was pointed out that ssbi-gpio has the same
> problem.  Let's fix it there too.
> 
> Fixes: b4c45fe974bc ("pinctrl: qcom: ssbi: Family A gpio & mpp drivers")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> ---
> 
>  drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c | 28 ++++++++++++++++++------
>  1 file changed, 21 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c b/drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c
> index f53e32a9d8fc..0e153bae322e 100644
> --- a/drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c
> +++ b/drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c
> @@ -260,22 +260,32 @@ static int pm8xxx_pin_config_get(struct pinctrl_dev *pctldev,
>  
>  	switch (param) {
>  	case PIN_CONFIG_BIAS_DISABLE:
> -		arg = pin->bias == PM8XXX_GPIO_BIAS_NP;
> +		if (pin->bias != PM8XXX_GPIO_BIAS_NP)
> +			return -EINVAL;
> +		arg = 1;
>  		break;
>  	case PIN_CONFIG_BIAS_PULL_DOWN:
> -		arg = pin->bias == PM8XXX_GPIO_BIAS_PD;
> +		if (pin->bias != PM8XXX_GPIO_BIAS_PD)
> +			return -EINVAL;
> +		arg = 1;
>  		break;
>  	case PIN_CONFIG_BIAS_PULL_UP:
> -		arg = pin->bias <= PM8XXX_GPIO_BIAS_PU_1P5_30;
> +		if (pin->bias > PM8XXX_GPIO_BIAS_PU_1P5_30)
> +			return -EINVAL;
> +		arg = 1;
>  		break;
>  	case PM8XXX_QCOM_PULL_UP_STRENGTH:
>  		arg = pin->pull_up_strength;
>  		break;
>  	case PIN_CONFIG_BIAS_HIGH_IMPEDANCE:
> -		arg = pin->disable;
> +		if (!pin->disable)
> +			return -EINVAL;
> +		arg = 1;
>  		break;
>  	case PIN_CONFIG_INPUT_ENABLE:
> -		arg = pin->mode == PM8XXX_GPIO_MODE_INPUT;
> +		if (pin->mode != PM8XXX_GPIO_MODE_INPUT)
> +			return -EINVAL;
> +		arg = 1;
>  		break;
>  	case PIN_CONFIG_OUTPUT:
>  		if (pin->mode & PM8XXX_GPIO_MODE_OUTPUT)
> @@ -290,10 +300,14 @@ static int pm8xxx_pin_config_get(struct pinctrl_dev *pctldev,
>  		arg = pin->output_strength;
>  		break;
>  	case PIN_CONFIG_DRIVE_PUSH_PULL:
> -		arg = !pin->open_drain;
> +		if (pin->open_drain)
> +			return -EINVAL;
> +		arg = 1;
>  		break;
>  	case PIN_CONFIG_DRIVE_OPEN_DRAIN:
> -		arg = pin->open_drain;
> +		if (!pin->open_drain)
> +			return -EINVAL;
> +		arg = 1;
>  		break;
>  	default:
>  		return -EINVAL;
> -- 
> 2.19.0.rc0.228.g281dcd1b4d0-goog
> 
