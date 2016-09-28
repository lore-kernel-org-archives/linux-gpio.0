From: Patrice Chotard <patrice.chotard@st.com>
Subject: Re: [PATCH] gpio: stmpe: forbid unused lines to be mapped as IRQs
Date: Wed, 28 Sep 2016 09:22:06 +0200
Message-ID: <7e46342e-09c6-b3ff-5979-a960a7f590d0@st.com>
References: <1475017624-29686-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mx07-00178001.pphosted.com ([62.209.51.94]:52946 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1750785AbcI1HWP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 28 Sep 2016 03:22:15 -0400
In-Reply-To: <1475017624-29686-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>

Hi Linus

On 09/28/2016 01:07 AM, Linus Walleij wrote:
> Exploit the new mechanism for masking off disallowed IRQs
> added by Mika Westerberg to properly manage the STMPE
> "norequest mask" to disallow also mapping said lines as
> IRQs.
> 
> Cc: Patrice Chotard <patrice.chotard@st.com>
> Cc: Mika Westerberg <mika.westerberg@linux.intel.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  drivers/gpio/gpio-stmpe.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/gpio/gpio-stmpe.c b/drivers/gpio/gpio-stmpe.c
> index b51c5be55c3a..432b2ee173c7 100644
> --- a/drivers/gpio/gpio-stmpe.c
> +++ b/drivers/gpio/gpio-stmpe.c
> @@ -13,6 +13,7 @@
>  #include <linux/of.h>
>  #include <linux/mfd/stmpe.h>
>  #include <linux/seq_file.h>
> +#include <linux/bitops.h>
>  
>  /*
>   * These registers are modified under the irq bus lock and cached to avoid
> @@ -449,6 +450,8 @@ static int stmpe_gpio_probe(struct platform_device *pdev)
>  
>  	of_property_read_u32(np, "st,norequest-mask",
>  			&stmpe_gpio->norequest_mask);
> +	if (stmpe_gpio->norequest_mask)
> +		stmpe_gpio->chip.irq_need_valid_mask = true;
>  
>  	if (irq < 0)
>  		dev_info(&pdev->dev,
> @@ -473,6 +476,14 @@ static int stmpe_gpio_probe(struct platform_device *pdev)
>  			dev_err(&pdev->dev, "unable to get irq: %d\n", ret);
>  			goto out_disable;
>  		}
> +		if (stmpe_gpio->norequest_mask) {
> +			int i;
> +
> +			/* Forbid unused lines to be mapped as IRQs */
> +			for (i = 0; i < sizeof(u32); i++)
> +				if (stmpe_gpio->norequest_mask & BIT(i))
> +					clear_bit(i, stmpe_gpio->chip.irq_valid_mask);
> +		}
>  		ret =  gpiochip_irqchip_add(&stmpe_gpio->chip,
>  					    &stmpe_gpio_irq_chip,
>  					    0,
> 

Reviewed-by: Patrice Chotard <patrice.chotard@st.com>

Thanks
