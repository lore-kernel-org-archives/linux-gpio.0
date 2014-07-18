From: Varka Bhadram <varkabhadram@gmail.com>
Subject: Re: [PATCH 3/3] gpio: zynq: Fix IRQ handlers
Date: Fri, 18 Jul 2014 15:28:40 +0530
Message-ID: <53C8EFD0.3020008@gmail.com>
References: <1405677133-8706-1-git-send-email-lars@metafoo.de> <1405677133-8706-3-git-send-email-lars@metafoo.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pd0-f174.google.com ([209.85.192.174]:50834 "EHLO
	mail-pd0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1761091AbaGRJ75 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 18 Jul 2014 05:59:57 -0400
Received: by mail-pd0-f174.google.com with SMTP id fp1so4783015pdb.33
        for <linux-gpio@vger.kernel.org>; Fri, 18 Jul 2014 02:59:57 -0700 (PDT)
In-Reply-To: <1405677133-8706-3-git-send-email-lars@metafoo.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Lars-Peter Clausen <lars@metafoo.de>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: Michal Simek <michal.simek@xilinx.com>, Harini Katakam <harini.katakam@xilinx.com>, linux-gpio@vger.kernel.org

On 07/18/2014 03:22 PM, Lars-Peter Clausen wrote:
>   drivers/gpio/gpio-zynq.c | 36 ++++++++++++++++++++++++++++--------
>   1 file changed, 28 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpio/gpio-zynq.c b/drivers/gpio/gpio-zynq.c
> index fa3ad23..bfbcf97 100644
> --- a/drivers/gpio/gpio-zynq.c
> +++ b/drivers/gpio/gpio-zynq.c
> @@ -95,6 +95,9 @@ struct zynq_gpio {
>   	struct clk *clk;
>   };
>   
> +static struct irq_chip zynq_gpio_level_irqchip;
> +static struct irq_chip zynq_gpio_edge_irqchip;
> +
>   /**
>    * zynq_gpio_get_bank_pin - Get the bank number and pin number within that bank
>    * for a given pin in the GPIO device
> @@ -433,6 +436,15 @@ static int zynq_gpio_set_irq_type(struct irq_data *irq_data, unsigned int type)
>   		       gpio->base_addr + ZYNQ_GPIO_INTPOL_OFFSET(bank_num));
>   	writel_relaxed(int_any,
>   		       gpio->base_addr + ZYNQ_GPIO_INTANY_OFFSET(bank_num));
> +
> +	if (type & IRQ_TYPE_LEVEL_MASK) {
> +		__irq_set_chip_handler_name_locked(irq_data->irq,
> +			&zynq_gpio_level_irqchip, handle_fasteoi_irq, NULL);

Should match open parenthesis:
	__irq_set_chip_handler_name_locked(irq_data->irq,
					   &zynq_gpio_level_irqchip,
					   handle_fasteoi_irq, NULL);

> +	} else {
> +		__irq_set_chip_handler_name_locked(irq_data->irq,
> +			&zynq_gpio_edge_irqchip, handle_level_irq, NULL);

Dto..

> +	}
> +
>   	return 0;
>   }
>   
> @@ -447,9 +459,21 @@ static int zynq_gpio_set_wake(struct irq_data *data, unsigned int on)
>   }
>   
>   /* irq chip descriptor */
> -static struct irq_chip zynq_gpio_irqchip = {
> +static struct irq_chip zynq_gpio_level_irqchip = {
>   	.name		= DRIVER_NAME,
>   	.irq_enable	= zynq_gpio_irq_enable,
> +	.irq_eoi	= zynq_gpio_irq_ack,
> +	.irq_mask	= zynq_gpio_irq_mask,
> +	.irq_unmask	= zynq_gpio_irq_unmask,
> +	.irq_set_type	= zynq_gpio_set_irq_type,
> +	.irq_set_wake	= zynq_gpio_set_wake,
> +	.flags		= IRQCHIP_EOI_THREADED | IRQCHIP_EOI_IF_HANDLED,
> +};
> +
> +static struct irq_chip zynq_gpio_edge_irqchip = {
> +	.name		= DRIVER_NAME,
> +	.irq_enable	= zynq_gpio_irq_enable,
> +	.irq_ack	= zynq_gpio_irq_ack,
>   	.irq_mask	= zynq_gpio_irq_mask,
>   	.irq_unmask	= zynq_gpio_irq_unmask,
>   	.irq_set_type	= zynq_gpio_set_irq_type,
> @@ -493,10 +517,6 @@ static void zynq_gpio_irqhandler(unsigned int irq, struct irq_desc *desc)
>   							 offset + bank_offset);
>   				generic_handle_irq(gpio_irq);
>   			}
> -
> -			/* clear IRQ in HW */
> -			writel_relaxed(int_sts, gpio->base_addr +
> -					ZYNQ_GPIO_INTSTS_OFFSET(bank_num));
>   		}
>   	}
>   
> @@ -634,14 +654,14 @@ static int zynq_gpio_probe(struct platform_device *pdev)
>   		writel_relaxed(ZYNQ_GPIO_IXR_DISABLE_ALL, gpio->base_addr +
>   			       ZYNQ_GPIO_INTDIS_OFFSET(bank_num));
>   
> -	ret = gpiochip_irqchip_add(chip, &zynq_gpio_irqchip, 0,
> -				   handle_simple_irq, IRQ_TYPE_NONE);
> +	ret = gpiochip_irqchip_add(chip, &zynq_gpio_edge_irqchip, 0,
> +				   handle_level_irq, IRQ_TYPE_NONE);
>   	if (ret) {
>   		dev_err(&pdev->dev, "Failed to add irq chip\n");
>   		goto err_rm_gpiochip;
>   	}
>   
> -	gpiochip_set_chained_irqchip(chip, &zynq_gpio_irqchip, irq,
> +	gpiochip_set_chained_irqchip(chip, &zynq_gpio_edge_irqchip, irq,
>   				     zynq_gpio_irqhandler);
>   
>   	pm_runtime_set_active(&pdev->dev);


-- 
Regards,
Varka Bhadram.

