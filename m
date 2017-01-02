From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH] pinctrl: qcom: msm8660: rename some SDC1->SDC4
Date: Mon, 2 Jan 2017 10:19:55 -0800
Message-ID: <20170102181955.GB23061@minitux>
References: <20170102084228.7890-1-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170102084228.7890-1-linus.walleij@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

On Mon 02 Jan 00:42 PST 2017, Linus Walleij wrote:

> These four pins are for SDC4, not SDC1. They are grouped for
> SDC4 later in the file so this must be a typo.
> 
> Cc: Björn Andersson <bjorn.andersson@linaro.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> ---
>  drivers/pinctrl/qcom/pinctrl-msm8660.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/pinctrl/qcom/pinctrl-msm8660.c b/drivers/pinctrl/qcom/pinctrl-msm8660.c
> index 5591d093bf78..bb71dd1e6279 100644
> --- a/drivers/pinctrl/qcom/pinctrl-msm8660.c
> +++ b/drivers/pinctrl/qcom/pinctrl-msm8660.c
> @@ -193,9 +193,9 @@ static const struct pinctrl_pin_desc msm8660_pins[] = {
>  	PINCTRL_PIN(171, "GPIO_171"),
>  	PINCTRL_PIN(172, "GPIO_172"),
>  
> -	PINCTRL_PIN(173, "SDC1_CLK"),
> -	PINCTRL_PIN(174, "SDC1_CMD"),
> -	PINCTRL_PIN(175, "SDC1_DATA"),
> +	PINCTRL_PIN(173, "SDC4_CLK"),
> +	PINCTRL_PIN(174, "SDC4_CMD"),
> +	PINCTRL_PIN(175, "SDC4_DATA"),
>  	PINCTRL_PIN(176, "SDC3_CLK"),
>  	PINCTRL_PIN(177, "SDC3_CMD"),
>  	PINCTRL_PIN(178, "SDC3_DATA"),
> -- 
> 2.9.3
> 
