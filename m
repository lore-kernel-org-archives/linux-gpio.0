From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH 1/1] pinctrl: baytrail: Add spinlock usage to all
 read/write access
Date: Thu, 26 Jan 2017 22:52:19 +0200
Message-ID: <20170126205219.GO17297@lahna.fi.intel.com>
References: <20170126141418.5624-1-alexander.stein@systec-electronic.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga01.intel.com ([192.55.52.88]:58612 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751933AbdAZVHR (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 26 Jan 2017 16:07:17 -0500
Content-Disposition: inline
In-Reply-To: <20170126141418.5624-1-alexander.stein@systec-electronic.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alexander Stein <alexander.stein@systec-electronic.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org

On Thu, Jan 26, 2017 at 03:14:18PM +0100, Alexander Stein wrote:
> According to VLI64 Intel Atom E3800 Specification Update (#329901)
> concurrent read accesses may result in returning 0xffffffff and write
> accesses may be dropped silently.
> To workaround all accesses must be protected by locks.
> 
> Signed-off-by: Alexander Stein <alexander.stein@systec-electronic.com>
> ---
> I actually had the case where the read access in byt_irq_unmask returned
> 0xffffffff. After OR'ing the trigger bits and writing 0xffffffff back to
> BYT_CONF0_REG things started to act strange.
> 
>  drivers/pinctrl/intel/pinctrl-baytrail.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/drivers/pinctrl/intel/pinctrl-baytrail.c b/drivers/pinctrl/intel/pinctrl-baytrail.c
> index 6cce314..7294c88 100644
> --- a/drivers/pinctrl/intel/pinctrl-baytrail.c
> +++ b/drivers/pinctrl/intel/pinctrl-baytrail.c
> @@ -1594,6 +1594,7 @@ static void byt_gpio_irq_handler(struct irq_desc *desc)
>  	void __iomem *reg;
>  	unsigned long pending;
>  	unsigned int virq;
> +	unsigned long flags;

Can you move this variable after "pending" like:

  	unsigned long pending;
	unsigned long flags;
  	unsigned int virq;

>  
>  	/* check from GPIO controller which pin triggered the interrupt */
>  	for (base = 0; base < vg->chip.ngpio; base += 32) {
> @@ -1606,7 +1607,9 @@ static void byt_gpio_irq_handler(struct irq_desc *desc)
>  			continue;
>  		}
>  
> +		raw_spin_lock_irqsave(&vg->lock, flags);
>  		pending = readl(reg);
> +		raw_spin_unlock_irqrestore(&vg->lock, flags);
>  		for_each_set_bit(pin, &pending, 32) {
>  			virq = irq_find_mapping(vg->chip.irqdomain, base + pin);
>  			generic_handle_irq(virq);
> @@ -1620,6 +1623,7 @@ static void byt_gpio_irq_init_hw(struct byt_gpio *vg)
>  	void __iomem *reg;
>  	u32 base, value;
>  	int i;
> +	unsigned long flags;

Here also arrange it like

	unsigned long flags;
  	void __iomem *reg;
  	u32 base, value;
  	int i;

>  
>  	/*
>  	 * Clear interrupt triggers for all pins that are GPIOs and
> @@ -1637,7 +1641,9 @@ static void byt_gpio_irq_init_hw(struct byt_gpio *vg)
>  			continue;
>  		}
>  
> +		raw_spin_lock_irqsave(&vg->lock, flags);

Is this really necessary as we are initializing the driver?

>  		value = readl(reg);
> +		raw_spin_unlock_irqrestore(&vg->lock, flags);
>  		if ((value & BYT_PIN_MUX) == byt_get_gpio_mux(vg, i) &&
>  		    !(value & BYT_DIRECT_IRQ_EN)) {
>  			byt_gpio_clear_triggering(vg, i);
> @@ -1656,10 +1662,12 @@ static void byt_gpio_irq_init_hw(struct byt_gpio *vg)
>  			continue;
>  		}
>  
> +		raw_spin_lock_irqsave(&vg->lock, flags);
>  		writel(0xffffffff, reg);
>  		/* make sure trigger bits are cleared, if not then a pin
>  		   might be misconfigured in bios */
>  		value = readl(reg);
> +		raw_spin_unlock_irqrestore(&vg->lock, flags);
>  		if (value)
>  			dev_err(&vg->pdev->dev,
>  				"GPIO interrupt error, pins misconfigured\n");
> @@ -1828,7 +1836,9 @@ static int byt_gpio_suspend(struct device *dev)
>  	struct platform_device *pdev = to_platform_device(dev);
>  	struct byt_gpio *vg = platform_get_drvdata(pdev);
>  	int i;
> +	unsigned long flags;

Here also, please make it look like:

	unsigned long flags;
  	int i;

> +	raw_spin_lock_irqsave(&vg->lock, flags);
>  	for (i = 0; i < vg->soc_data->npins; i++) {
>  		void __iomem *reg;
>  		u32 value;
> @@ -1848,6 +1858,7 @@ static int byt_gpio_suspend(struct device *dev)
>  		value = readl(reg) & BYT_VAL_RESTORE_MASK;
>  		vg->saved_context[i].val = value;
>  	}
> +	raw_spin_unlock_irqrestore(&vg->lock, flags);
>  
>  	return 0;
>  }
> @@ -1857,7 +1868,9 @@ static int byt_gpio_resume(struct device *dev)
>  	struct platform_device *pdev = to_platform_device(dev);
>  	struct byt_gpio *vg = platform_get_drvdata(pdev);
>  	int i;
> +	unsigned long flags;
>  
> +	raw_spin_lock_irqsave(&vg->lock, flags);
>  	for (i = 0; i < vg->soc_data->npins; i++) {
>  		void __iomem *reg;
>  		u32 value;
> @@ -1894,6 +1907,7 @@ static int byt_gpio_resume(struct device *dev)
>  			}
>  		}
>  	}
> +	raw_spin_unlock_irqrestore(&vg->lock, flags);
>  
>  	return 0;
>  }
> -- 
> 2.10.2
