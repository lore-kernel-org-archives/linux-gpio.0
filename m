From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH V1 1/2] pinctrl: qcom: spmi-gpio: Read REG_EN_CTL to get
 initial enable state
Date: Mon, 16 Oct 2017 15:19:01 -0700
Message-ID: <20171016221901.GP1165@minitux>
References: <20171013061550.996-1-fenglinw@codeaurora.org>
 <20171013061550.996-2-fenglinw@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20171013061550.996-2-fenglinw@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: fenglinw@codeaurora.org
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, collinsd@codeaurora.org, aghayal@codeaurora.org, wruan@codeaurora.org, subbaram@codeaurora.org, kgunda@codeaurora.org
List-Id: linux-gpio@vger.kernel.org

On Thu 12 Oct 23:15 PDT 2017, fenglinw@codeaurora.org wrote:

> From: Fenglin Wu <fenglinw@codeaurora.org>
> 
> Get initial value of is_enabled flag by reading REG_EN_CTL register
> so that it can reflect the correct hardware enable state before
> setting pin config.
> 
> Signed-off-by: Fenglin Wu <fenglinw@codeaurora.org>
> ---
>  drivers/pinctrl/qcom/pinctrl-spmi-gpio.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
> index a0edaa8..0a1e173 100644
> --- a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
> +++ b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
> @@ -106,6 +106,7 @@
>  
>  /* PMIC_GPIO_REG_EN_CTL */
>  #define PMIC_GPIO_REG_MASTER_EN_SHIFT		7
> +#define PMIC_GPIO_REG_MASTER_EN			0x80
>  
>  #define PMIC_GPIO_PHYSICAL_OFFSET		1
>  
> @@ -914,8 +915,12 @@ static int pmic_gpio_populate(struct pmic_gpio_state *state,
>  		pad->atest = (val & PMIC_GPIO_LV_MV_ANA_MUX_SEL_MASK) + 1;
>  	}
>  
> -	/* Pin could be disabled with PIN_CONFIG_BIAS_HIGH_IMPEDANCE */
> -	pad->is_enabled = true;
> +	val = pmic_gpio_read(state, pad, PMIC_GPIO_REG_EN_CTL);
> +	if (val < 0)
> +		return val;
> +
> +	pad->is_enabled = val & PMIC_GPIO_REG_MASTER_EN;

Please be more explicit here: is_enable = !!(val & ...)

> +

other than that,

Acked-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn
