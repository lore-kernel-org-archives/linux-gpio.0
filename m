From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH] pinctrl: qcom: add get_direction function
Date: Fri, 10 Feb 2017 15:25:17 -0800
Message-ID: <8652c018-4051-5c77-3126-2d41d150518a@codeaurora.org>
References: <1486768860-18237-1-git-send-email-timur@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:33484 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751014AbdBJXZT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 10 Feb 2017 18:25:19 -0500
In-Reply-To: <1486768860-18237-1-git-send-email-timur@codeaurora.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Timur Tabi <timur@codeaurora.org>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org

On 02/10/2017 03:21 PM, Timur Tabi wrote:
> The get_direction callback function allows gpiolib to know the current
> direction (input vs output) for a given GPIO.
>
> This is particularly useful on ACPI systems, where the GPIOs are
> configured only by firmware (typically UEFI), so the only way to
> know the initial values to query the hardware directly.  Without
> this function, gpiolib thinks that all GPIOs are configured for
> input.
>
> Signed-off-by: Timur Tabi <timur@codeaurora.org>
> ---
>  drivers/pinctrl/qcom/pinctrl-msm.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>
> diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
> index f8e9e1c..c978be5 100644
> --- a/drivers/pinctrl/qcom/pinctrl-msm.c
> +++ b/drivers/pinctrl/qcom/pinctrl-msm.c
> @@ -422,6 +422,20 @@ static int msm_gpio_direction_output(struct gpio_chip *chip, unsigned offset, in
>  	return 0;
>  }
>  
> +static int msm_gpio_get_direction(struct gpio_chip *chip, unsigned int offset)
> +{
> +	struct msm_pinctrl *pctrl = gpiochip_get_data(chip);
> +	const struct msm_pingroup *g;
> +	u32 val;
> +
> +	g = &pctrl->soc->groups[offset];
> +
> +	val = readl(pctrl->regs + g->ctl_reg);
> +
> +	/* 0 = output, 1 = input */
> +	return val & BIT(g->oe_bit) ? 0 : 1;

Maybe we can use the macros GPIOF_DIR_IN and GPIOF_DIR_OUT here instead?

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project

