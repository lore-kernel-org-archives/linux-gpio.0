From: David Cohen <david.a.cohen@linux.intel.com>
Subject: Re: [PATCH] gpio: intel-mid: switch to using gpiolib irqchip helpers
Date: Fri, 30 May 2014 09:45:11 -0700
Message-ID: <20140530164511.GB29032@psi-dev26.jf.intel.com>
References: <1401375653-12758-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga14.intel.com ([192.55.52.115]:16665 "EHLO mga14.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932148AbaE3QpP (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Fri, 30 May 2014 12:45:15 -0400
Content-Disposition: inline
In-Reply-To: <1401375653-12758-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>, "xinhui.pan" <xinhuiX.pan@intel.com>

Hi Linus,

On Thu, May 29, 2014 at 05:00:53PM +0200, Linus Walleij wrote:
> This switches the Intel MID GPIO driver over to using the gpiolib
> irqchip helpers in the gpiolib core.
> 
> Cc: David Cohen <david.a.cohen@linux.intel.com>
> Cc: xinhui.pan <xinhuiX.pan@intel.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> David can you test this? It's probably easiest for you to just
> pull in this branch from my GPIO tree and test, because of
> dependencies:

Sure. I'll test this patch.

Br, David

> 
> git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git#intel-mid-irqchip-helpers
> 
> THANKS!
> ---
>  drivers/gpio/gpio-intel-mid.c | 86 +++++++++++++------------------------------
>  1 file changed, 25 insertions(+), 61 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-intel-mid.c b/drivers/gpio/gpio-intel-mid.c
> index 118a6bf455d9..aa28c65eb6b4 100644
> --- a/drivers/gpio/gpio-intel-mid.c
> +++ b/drivers/gpio/gpio-intel-mid.c
> @@ -28,12 +28,10 @@
>  #include <linux/stddef.h>
>  #include <linux/interrupt.h>
>  #include <linux/init.h>
> -#include <linux/irq.h>
>  #include <linux/io.h>
> -#include <linux/gpio.h>
> +#include <linux/gpio/driver.h>
>  #include <linux/slab.h>
>  #include <linux/pm_runtime.h>
> -#include <linux/irqdomain.h>
>  
>  #define INTEL_MID_IRQ_TYPE_EDGE		(1 << 0)
>  #define INTEL_MID_IRQ_TYPE_LEVEL	(1 << 1)
> @@ -78,10 +76,12 @@ struct intel_mid_gpio {
>  	void __iomem			*reg_base;
>  	spinlock_t			lock;
>  	struct pci_dev			*pdev;
> -	struct irq_domain		*domain;
>  };
>  
> -#define to_intel_gpio_priv(chip) container_of(chip, struct intel_mid_gpio, chip)
> +static inline struct intel_mid_gpio *to_intel_gpio_priv(struct gpio_chip *gc)
> +{
> +	return container_of(gc, struct intel_mid_gpio, chip);
> +}
>  
>  static void __iomem *gpio_reg(struct gpio_chip *chip, unsigned offset,
>  			      enum GPIO_REG reg_type)
> @@ -182,15 +182,10 @@ static int intel_gpio_direction_output(struct gpio_chip *chip,
>  	return 0;
>  }
>  
> -static int intel_gpio_to_irq(struct gpio_chip *chip, unsigned offset)
> -{
> -	struct intel_mid_gpio *priv = to_intel_gpio_priv(chip);
> -	return irq_create_mapping(priv->domain, offset);
> -}
> -
>  static int intel_mid_irq_type(struct irq_data *d, unsigned type)
>  {
> -	struct intel_mid_gpio *priv = irq_data_get_irq_chip_data(d);
> +	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
> +	struct intel_mid_gpio *priv = to_intel_gpio_priv(gc);
>  	u32 gpio = irqd_to_hwirq(d);
>  	unsigned long flags;
>  	u32 value;
> @@ -231,33 +226,11 @@ static void intel_mid_irq_mask(struct irq_data *d)
>  {
>  }
>  
> -static int intel_mid_irq_reqres(struct irq_data *d)
> -{
> -	struct intel_mid_gpio *priv = irq_data_get_irq_chip_data(d);
> -
> -	if (gpio_lock_as_irq(&priv->chip, irqd_to_hwirq(d))) {
> -		dev_err(priv->chip.dev,
> -			"unable to lock HW IRQ %lu for IRQ\n",
> -			irqd_to_hwirq(d));
> -		return -EINVAL;
> -	}
> -	return 0;
> -}
> -
> -static void intel_mid_irq_relres(struct irq_data *d)
> -{
> -	struct intel_mid_gpio *priv = irq_data_get_irq_chip_data(d);
> -
> -	gpio_unlock_as_irq(&priv->chip, irqd_to_hwirq(d));
> -}
> -
>  static struct irq_chip intel_mid_irqchip = {
>  	.name		= "INTEL_MID-GPIO",
>  	.irq_mask	= intel_mid_irq_mask,
>  	.irq_unmask	= intel_mid_irq_unmask,
>  	.irq_set_type	= intel_mid_irq_type,
> -	.irq_request_resources = intel_mid_irq_reqres,
> -	.irq_release_resources = intel_mid_irq_relres,
>  };
>  
>  static const struct intel_mid_gpio_ddata gpio_lincroft = {
> @@ -330,8 +303,9 @@ MODULE_DEVICE_TABLE(pci, intel_gpio_ids);
>  
>  static void intel_mid_irq_handler(unsigned irq, struct irq_desc *desc)
>  {
> +	struct gpio_chip *gc = irq_desc_get_handler_data(desc);
> +	struct intel_mid_gpio *priv = to_intel_gpio_priv(gc);
>  	struct irq_data *data = irq_desc_get_irq_data(desc);
> -	struct intel_mid_gpio *priv = irq_data_get_irq_handler_data(data);
>  	struct irq_chip *chip = irq_data_get_irq_chip(data);
>  	u32 base, gpio, mask;
>  	unsigned long pending;
> @@ -345,7 +319,7 @@ static void intel_mid_irq_handler(unsigned irq, struct irq_desc *desc)
>  			mask = BIT(gpio);
>  			/* Clear before handling so we can't lose an edge */
>  			writel(mask, gedr);
> -			generic_handle_irq(irq_find_mapping(priv->domain,
> +			generic_handle_irq(irq_find_mapping(gc->irqdomain,
>  							    base + gpio));
>  		}
>  	}
> @@ -371,23 +345,6 @@ static void intel_mid_irq_init_hw(struct intel_mid_gpio *priv)
>  	}
>  }
>  
> -static int intel_gpio_irq_map(struct irq_domain *d, unsigned int irq,
> -			    irq_hw_number_t hwirq)
> -{
> -	struct intel_mid_gpio *priv = d->host_data;
> -
> -	irq_set_chip_and_handler(irq, &intel_mid_irqchip, handle_simple_irq);
> -	irq_set_chip_data(irq, priv);
> -	irq_set_irq_type(irq, IRQ_TYPE_NONE);
> -
> -	return 0;
> -}
> -
> -static const struct irq_domain_ops intel_gpio_irq_ops = {
> -	.map = intel_gpio_irq_map,
> -	.xlate = irq_domain_xlate_twocell,
> -};
> -
>  static int intel_gpio_runtime_idle(struct device *dev)
>  {
>  	int err = pm_schedule_suspend(dev, 500);
> @@ -441,7 +398,6 @@ static int intel_gpio_probe(struct pci_dev *pdev,
>  	priv->chip.direction_output = intel_gpio_direction_output;
>  	priv->chip.get = intel_gpio_get;
>  	priv->chip.set = intel_gpio_set;
> -	priv->chip.to_irq = intel_gpio_to_irq;
>  	priv->chip.base = gpio_base;
>  	priv->chip.ngpio = ddata->ngpio;
>  	priv->chip.can_sleep = false;
> @@ -449,11 +405,6 @@ static int intel_gpio_probe(struct pci_dev *pdev,
>  
>  	spin_lock_init(&priv->lock);
>  
> -	priv->domain = irq_domain_add_simple(pdev->dev.of_node, ddata->ngpio,
> -					irq_base, &intel_gpio_irq_ops, priv);
> -	if (!priv->domain)
> -		return -ENOMEM;
> -
>  	pci_set_drvdata(pdev, priv);
>  	retval = gpiochip_add(&priv->chip);
>  	if (retval) {
> @@ -461,10 +412,23 @@ static int intel_gpio_probe(struct pci_dev *pdev,
>  		return retval;
>  	}
>  
> +	retval = gpiochip_irqchip_add(&priv->chip,
> +				      &intel_mid_irqchip,
> +				      irq_base,
> +				      handle_simple_irq,
> +				      IRQ_TYPE_NONE);
> +	if (retval) {
> +		dev_err(&pdev->dev,
> +			"could not connect irqchip to gpiochip\n");
> +		return retval;
> +	}
> +
>  	intel_mid_irq_init_hw(priv);
>  
> -	irq_set_handler_data(pdev->irq, priv);
> -	irq_set_chained_handler(pdev->irq, intel_mid_irq_handler);
> +	gpiochip_set_chained_irqchip(&priv->chip,
> +				     &intel_mid_irqchip,
> +				     pdev->irq,
> +				     intel_mid_irq_handler);
>  
>  	pm_runtime_put_noidle(&pdev->dev);
>  	pm_runtime_allow(&pdev->dev);
> -- 
> 1.9.3
> 
