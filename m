From: Bjorn Andersson <bjorn.andersson@sonymobile.com>
Subject: Re: [PATCH 2/3] pinctrl: qcom-spmi-gpio: Fix input value report
Date: Thu, 9 Apr 2015 09:01:11 -0700
Message-ID: <20150409160111.GH19186@sonymobile.com>
References: <1428592717-21706-1-git-send-email-ivan.ivanov@linaro.org>
 <1428592717-21706-2-git-send-email-ivan.ivanov@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1428592717-21706-2-git-send-email-ivan.ivanov@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: "Ivan T. Ivanov" <ivan.ivanov@linaro.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Arnd Bergmann <arnd@arndb.de>, Soren Brinkmann <soren.brinkmann@xilinx.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Thu 09 Apr 08:18 PDT 2015, Ivan T. Ivanov wrote:

> Read input buffer when input is enabled, not when it is
> disabled. Also fix interpretation of the pmic_gpio_read()
> return code, negative value means an error.
> 
> Signed-off-by: Ivan T. Ivanov <ivan.ivanov@linaro.org>
> ---

>  drivers/pinctrl/qcom/pinctrl-spmi-gpio.c | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
> index 4b21aac..e8b74c6 100644
> --- a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
> +++ b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
> @@ -466,12 +466,13 @@ static void pmic_gpio_config_dbg_show(struct pinctrl_dev *pctldev,
>  		seq_puts(s, " ---");
>  	} else {
> 
> -		if (!pad->input_enabled) {
> +		if (pad->input_enabled) {
>  			ret = pmic_gpio_read(state, pad, PMIC_MPP_REG_RT_STS);
> -			if (!ret) {
> -				ret &= PMIC_MPP_REG_RT_STS_VAL_MASK;
> -				pad->out_value = ret;
> -			}
> +			if (ret < 0)
> +				return;
> +
> +			ret &= PMIC_MPP_REG_RT_STS_VAL_MASK;
> +			pad->out_value = ret;

I'm not too happy on pmic_gpio_read() returning the register value as an
signed int, sorry for not picking on this back when we merged the
driver.

As far as I can see bit 31 is reserved in all registers in the block
though, so there shouldn't be any practical issues with this _today_.

But please consider revising pmic_gpio_read() to take a u32* parameter
for the data instead.

Reviewed-by: Bjorn Andersson <bjorn.andersson@sonymobile.com>

Regards,
Bjorn
