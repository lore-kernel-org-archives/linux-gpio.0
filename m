From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH v1 1/2] pinctrl: baytrail: Do not add all GPIOs to IRQ
 domain
Date: Wed, 11 Jan 2017 12:27:10 +0200
Message-ID: <20170111102710.GO2330@lahna.fi.intel.com>
References: <20170110201139.129737-1-andriy.shevchenko@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga02.intel.com ([134.134.136.20]:24801 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1754598AbdAKK3Y (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 11 Jan 2017 05:29:24 -0500
Content-Disposition: inline
In-Reply-To: <20170110201139.129737-1-andriy.shevchenko@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, "Robert R . Howell" <rhowell@uwyo.edu>

On Tue, Jan 10, 2017 at 10:11:38PM +0200, Andy Shevchenko wrote:
> It turns out that for some GPIO pins interrupts are bypassing standard
> chain.
> 
> Now the reason why some events such as touchscreen communication on ASuS
> T100TA does not work if we mask all the interrupts is that in order to
> generate either interrupts or GPEs the INTMASK register must have that
> particular interrupt unmasked. In case of GPEs the CPU does not trigger
> normal interrupt (and thus the GPIO driver does not see it) but instead
> it causes SCI (System Control Interrupt) to be triggered with the GPE in
> question set.
> 
> To make this all work as expected we add those GPIOs to the IRQ
> domain that can actually generate interrupts and skip others.

Actually what happens is that when DIRECT_IRQ_EN is set, the pin is
routed directly to the IO-APIC bypassing the GPIO driver completely.
However, the mask register is still used to determine if the pin is
supposed to generate IRQ or not.

So with commit 3ae02c14d964 the IRQ core masks all IRQs (because of
handle_bad_irq()) the pin connected to the touchscreen gets masked as
well and hence no interrupts.

This has nothing to do with GPEs, though.

The fix itself looks good to me.

> Fixes: 3ae02c14d964 ("pinctrl: intel: set default handler to be handle_bad_irq()")
> Reported-by: Robert R. Howell <rhowell@uwyo.edu>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/pinctrl/intel/pinctrl-baytrail.c | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/pinctrl/intel/pinctrl-baytrail.c b/drivers/pinctrl/intel/pinctrl-baytrail.c
> index 67e92699b84e..c123488266ce 100644
> --- a/drivers/pinctrl/intel/pinctrl-baytrail.c
> +++ b/drivers/pinctrl/intel/pinctrl-baytrail.c
> @@ -1623,6 +1623,8 @@ static void byt_gpio_irq_handler(struct irq_desc *desc)
>  
>  static void byt_gpio_irq_init_hw(struct byt_gpio *vg)
>  {
> +	struct gpio_chip *gc = &vg->chip;
> +	struct device *dev = &vg->pdev->dev;
>  	void __iomem *reg;
>  	u32 base, value;
>  	int i;
> @@ -1644,10 +1646,12 @@ static void byt_gpio_irq_init_hw(struct byt_gpio *vg)
>  		}
>  
>  		value = readl(reg);
> -		if ((value & BYT_PIN_MUX) == byt_get_gpio_mux(vg, i) &&
> -		    !(value & BYT_DIRECT_IRQ_EN)) {
> +		if (value & BYT_DIRECT_IRQ_EN) {
> +			clear_bit(i, gc->irq_valid_mask);
> +			dev_dbg(dev, "excluding GPIO %d from IRQ domain\n", i);
> +		} else if ((value & BYT_PIN_MUX) == byt_get_gpio_mux(vg, i)) {
>  			byt_gpio_clear_triggering(vg, i);
> -			dev_dbg(&vg->pdev->dev, "disabling GPIO %d\n", i);
> +			dev_dbg(dev, "disabling GPIO %d\n", i);
>  		}
>  	}
>  
> @@ -1686,6 +1690,7 @@ static int byt_gpio_probe(struct byt_gpio *vg)
>  	gc->can_sleep	= false;
>  	gc->parent	= &vg->pdev->dev;
>  	gc->ngpio	= vg->soc_data->npins;
> +	gc->irq_need_valid_mask	= true;
>  
>  #ifdef CONFIG_PM_SLEEP
>  	vg->saved_context = devm_kcalloc(&vg->pdev->dev, gc->ngpio,
> -- 
> 2.11.0
