From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH V1 2/2] pinctrl: qcom: spmi-gpio: Set is_enabled flag in
 set_mux()
Date: Mon, 16 Oct 2017 15:29:55 -0700
Message-ID: <20171016222955.GQ1165@minitux>
References: <20171013061550.996-1-fenglinw@codeaurora.org>
 <20171013061550.996-3-fenglinw@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20171013061550.996-3-fenglinw@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: fenglinw@codeaurora.org
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, collinsd@codeaurora.org, aghayal@codeaurora.org, wruan@codeaurora.org, subbaram@codeaurora.org, kgunda@codeaurora.org
List-Id: linux-gpio@vger.kernel.org

On Thu 12 Oct 23:15 PDT 2017, fenglinw@codeaurora.org wrote:

> From: Fenglin Wu <fenglinw@codeaurora.org>
> 
> The initial value of is_enabled flag is read out from hardware in
> pmic_gpio_populate(), and it will be set in pmic_gpio_config_set() if
> pinconf is defined. For any GPIOs disabled initially in hardware which
> only have pinmux defined, they won't be enabled in pmic_gpio_set_mux()
> calling. So set is_enabled flag in set_mux() to ensure the GPIO module
> could be enabled in above case.
> 

I'm still interested in knowing when it is valid to configure a pin with
only mux, no config.  I.e. in what cases does setting a alternative
function make the pinconfig not count.

Regards,
Bjorn

> Signed-off-by: Fenglin Wu <fenglinw@codeaurora.org>
> ---
>  drivers/pinctrl/qcom/pinctrl-spmi-gpio.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
> index 0a1e173..219c934 100644
> --- a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
> +++ b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
> @@ -312,6 +312,7 @@ static int pmic_gpio_set_mux(struct pinctrl_dev *pctldev, unsigned function,
>  	}
>  
>  	pad = pctldev->desc->pins[pin].drv_data;
> +	pad->is_enabled = true;
>  	/*
>  	 * Non-LV/MV subtypes only support 2 special functions,
>  	 * offsetting the dtestx function values by 2
> -- 
> Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project.
> 
