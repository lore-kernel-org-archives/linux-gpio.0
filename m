From: Varka Bhadram <varkabhadram@gmail.com>
Subject: Re: [PATCH v2] gpio: zx: Add ZTE zx296702 GPIO support
Date: Wed, 24 Jun 2015 16:26:39 +0530
Message-ID: <558A8CE7.7020709@gmail.com>
References: <1435138299-20561-1-git-send-email-jun.nie@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pd0-f179.google.com ([209.85.192.179]:35322 "EHLO
	mail-pd0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751061AbbFXK5O (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 24 Jun 2015 06:57:14 -0400
Received: by pdbci14 with SMTP id ci14so28267452pdb.2
        for <linux-gpio@vger.kernel.org>; Wed, 24 Jun 2015 03:57:13 -0700 (PDT)
In-Reply-To: <1435138299-20561-1-git-send-email-jun.nie@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Jun Nie <jun.nie@linaro.org>, haojian.zhuang@linaro.org, linus.walleij@linaro.org, linux-gpio@vger.kernel.org
Cc: tony@atomide.com, shawn.guo@linaro.org, wan.zhijun@zte.com.cn, jason.liu@linaro.org

Hi Jun Nie,

On 06/24/2015 03:01 PM, Jun Nie wrote:

> Add ZTE zx296702 GPIO controller support
>
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> ---

(...)

> +static int zx_gpio_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct zx_gpio *chip;
> +	struct resource *res;
> +	int irq, id, ret;
> +
> +	chip = devm_kzalloc(dev, sizeof(*chip), GFP_KERNEL);
> +	if (chip == NULL)
> +		return -ENOMEM;

We can simply check some thing like this:
	if (!chip)
		return -ENOMEM;

> +
> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	chip->base = devm_ioremap_resource(dev, res);
> +	if (IS_ERR(chip->base))
> +		return PTR_ERR(chip->base);
> +
> +	spin_lock_init(&chip->lock);
> +	if (of_property_read_bool(dev->of_node, "gpio-ranges"))
> +		chip->uses_pinctrl = true;
> +
> +	id = of_alias_get_id(dev->of_node, "gpio");
> +	chip->gc.request = zx_gpio_request;
> +	chip->gc.free = zx_gpio_free;
> +	chip->gc.direction_input = zx_direction_input;
> +	chip->gc.direction_output = zx_direction_output;
> +	chip->gc.get = zx_get_value;
> +	chip->gc.set = zx_set_value;
> +	chip->gc.base = ZX_GPIO_NR * id;
> +	chip->gc.ngpio = ZX_GPIO_NR;
> +	chip->gc.label = dev_name(dev);
> +	chip->gc.dev = dev;
> +	chip->gc.owner = THIS_MODULE;
> +
> +	ret = gpiochip_add(&chip->gc);
> +	if (ret)
> +		return ret;
> +
> +	/*
> +	 * irq_chip support
> +	 */
> +	writew_relaxed(0xffff, chip->base + ZX_GPIO_IM);
> +	writew_relaxed(0, chip->base + ZX_GPIO_IE);
> +	irq = platform_get_irq(pdev, 0);
> +	if (irq < 0) {
> +		dev_err(dev, "invalid IRQ\n");

You added the gpiochio, but not removing on error here.

> +		return -ENODEV;
> +	}
> +
> +	ret = gpiochip_irqchip_add(&chip->gc, &zx_irqchip,
> +				   0, handle_simple_irq,
> +				   IRQ_TYPE_NONE);
> +	if (ret) {
> +		dev_info(dev, "could not add irqchip\n");

I think it should be dev_err().

Here also gpiochip_remove() ?

> +		return ret;
> +	}
> +	gpiochip_set_chained_irqchip(&chip->gc, &zx_irqchip,
> +				     irq, zx_irq_handler);
> +
> +	platform_set_drvdata(pdev, chip);
> +	dev_info(dev, "ZX GPIO chip registered\n");
> +
> +	return 0;
> +}
> +
> +#if defined(CONFIG_OF)
> +static const struct of_device_id zx_gpio_match[] = {
> +	{
> +		.compatible = "zte,zx296702-gpio",
> +	},
> +	{ },
> +};
> +MODULE_DEVICE_TABLE(of, zx_gpio_match);
> +#endif
> +

This driver may be populated through OF.

Do you think this #if..#endif is required ?


-- 
Best regards,
Varka Bhadram.

