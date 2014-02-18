From: Kumar Gala <galak@codeaurora.org>
Subject: Re: [PATCH] gpio: msm: switch Kconfig to ARCH_QCOM depends
Date: Tue, 18 Feb 2014 10:40:39 -0600
Message-ID: <E7F3569D-CA91-4419-A7C2-B62E2830995E@codeaurora.org>
References: <1392150132-21877-1-git-send-email-galak@codeaurora.org>
Mime-Version: 1.0 (Mac OS X Mail 7.1 \(1827\))
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 8BIT
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <1392150132-21877-1-git-send-email-galak@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm <linux-arm-msm@vger.kernel.org>, linux-arm-kernel@lists.infradead.org
List-Id: linux-gpio@vger.kernel.org


On Feb 11, 2014, at 2:22 PM, Kumar Gala <galak@codeaurora.org> wrote:

> We've split Qualcomm MSM support into legacy and multiplatform.  The gpio
> msm-v2 driver is only relevant on the multiplatform supported SoCs so
> switch the Kconfig depends to ARCH_QCOM.
> 
> CC: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Kumar Gala <galak@codeaurora.org>
> ---
> Linus,
> 
> If you can ack this I'll send it via linux-qcom/arm-soc tree's
> 
> thanks
> 
> - k

ping

- k

> 
> drivers/gpio/Kconfig | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index 6973387..aa74949 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -192,7 +192,7 @@ config GPIO_MSM_V1
> 
> config GPIO_MSM_V2
> 	tristate "Qualcomm MSM GPIO v2"
> -	depends on GPIOLIB && OF && ARCH_MSM
> +	depends on GPIOLIB && OF && ARCH_QCOM
> 	help
> 	  Say yes here to support the GPIO interface on ARM v7 based
> 	  Qualcomm MSM chips.  Most of the pins on the MSM can be
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> hosted by The Linux Foundation
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-arm-msm" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

-- 
Employee of Qualcomm Innovation Center, Inc.
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
