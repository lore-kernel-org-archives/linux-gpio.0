From: Varka Bhadram <varkabhadram@gmail.com>
Subject: Re: [PATCHv3 3/3] gpio: sch: Enable IRQ support for Quark X1000
Date: Thu, 16 Oct 2014 09:31:44 +0530
Message-ID: <543F4328.2030801@gmail.com>
References: <1413431475-12799-1-git-send-email-rebecca.swee.fun.chang@intel.com> <1413431475-12799-4-git-send-email-rebecca.swee.fun.chang@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pd0-f174.google.com ([209.85.192.174]:64234 "EHLO
	mail-pd0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750719AbaJPEEe (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 16 Oct 2014 00:04:34 -0400
In-Reply-To: <1413431475-12799-4-git-send-email-rebecca.swee.fun.chang@intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Chang Rebecca Swee Fun <rebecca.swee.fun.chang@intel.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: Mika Westerberg <mika.westerberg@intel.com>, GPIO Subsystem Mailing List <linux-gpio@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Denis Turischev <denis.turischev@compulab.co.il>

On 10/16/2014 09:21 AM, Chang Rebecca Swee Fun wrote:
> Intel Quark X1000 GPIO controller supports interrupt handling for
> both core power well and resume power well. This patch is to enable
> the IRQ support and provide IRQ handling for Intel Quark X1000
> GPIO-SCH device driver.

(...)

>   static int sch_gpio_probe(struct platform_device *pdev)
>   {
>   	struct sch_gpio *sch;
> -	struct resource *res;
> +	struct resource *res, *irq;
> +	int err;
>   
>   	sch = devm_kzalloc(&pdev->dev, sizeof(*sch), GFP_KERNEL);
>   	if (!sch)
> @@ -203,6 +376,17 @@ static int sch_gpio_probe(struct platform_device *pdev)
>   				 pdev->name))
>   		return -EBUSY;
>   
> +	irq = platform_get_resource(pdev, IORESOURCE_IRQ, 0);
> +	sch->irq_support = !!irq;
> +	if (sch->irq_support) {
> +		sch->irq_num = irq->start;
> +		if (sch->irq_num < 0) {
> +			dev_warn(&pdev->dev,
> +				 "failed to obtain irq number for device\n");
> +			sch->irq_support = false;
> +		}
> +	}
> +
>   	spin_lock_init(&sch->lock);
>   	sch->iobase = res->start;
>   	sch->chip = sch_gpio_chip;
> @@ -251,15 +435,64 @@ static int sch_gpio_probe(struct platform_device *pdev)
>   		return -ENODEV;
>   	}
>   
> +	err = gpiochip_add(&sch->chip);
> +	if (err < 0)
> +		goto err_sch_gpio;
> +
> +	if (sch->irq_support) {
> +		sch->irq_base = irq_alloc_descs(-1, 0, sch->chip.ngpio,
> +						NUMA_NO_NODE);
> +		if (sch->irq_base < 0) {
> +			dev_err(&pdev->dev,
> +				"failed to allocate GPIO IRQ descs\n");
> +			goto err_sch_intr_chip;
> +		}
> +
> +		/* disable interrupts */
> +		sch_gpio_irq_disable_all(sch, sch->chip.ngpio);
> +
> +		err = request_irq(sch->irq_num, sch_gpio_irq_handler,
> +				  IRQF_SHARED, KBUILD_MODNAME, sch);
> +		if (err) {
> +			dev_err(&pdev->dev,
> +				"%s failed to request IRQ\n", __func__);
> +			goto err_sch_request_irq;
> +		}
> +
> +		sch_gpio_irqs_init(sch, sch->chip.ngpio);
> +	}
> +
>   	platform_set_drvdata(pdev, sch);
>   
> -	return gpiochip_add(&sch->chip);
> +	return 0;
> +
> +err_sch_request_irq:
> +	irq_free_descs(sch->irq_base, sch->chip.ngpio);
> +
> +err_sch_intr_chip:
> +	if (gpiochip_remove(&sch->chip))

gpiochip_remove() return 'void' [0].

> +		dev_err(&pdev->dev,
> +			"%s gpiochip_remove() failed\n", __func__);
> +
> +err_sch_gpio:
> +	release_region(res->start, resource_size(res));
> +
> +	return err;
>   }

[0]:https://git.kernel.org/cgit/linux/kernel/git/linusw/linux-gpio.git/tree/drivers/gpio/gpiolib.c#n311


-- 
Regards,
Varka Bhadram.

