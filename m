From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v1 1/2] pinctrl: baytrail: Do not add all GPIOs to IRQ
 domain
Date: Tue, 10 Jan 2017 22:16:42 +0200
Message-ID: <1484079402.2133.46.camel@linux.intel.com>
References: <20170110201139.129737-1-andriy.shevchenko@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga03.intel.com ([134.134.136.65]:8081 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1763673AbdAJUQq (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 10 Jan 2017 15:16:46 -0500
In-Reply-To: <20170110201139.129737-1-andriy.shevchenko@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, Mika Westerberg <mika.westerberg@linux.intel.com>, "Robert R . Howell" <rhowell@uwyo.edu>

On Tue, 2017-01-10 at 22:11 +0200, Andy Shevchenko wrote:
> It turns out that for some GPIO pins interrupts are bypassing standard
> chain.
> 
> Now the reason why some events such as touchscreen communication on
> ASuS
> T100TA does not work if we mask all the interrupts is that in order to
> generate either interrupts or GPEs the INTMASK register must have that
> particular interrupt unmasked. In case of GPEs the CPU does not
> trigger
> normal interrupt (and thus the GPIO driver does not see it) but
> instead
> it causes SCI (System Control Interrupt) to be triggered with the GPE
> in
> question set.
> 
> To make this all work as expected we add those GPIOs to the IRQ
> domain that can actually generate interrupts and skip others.
> 

Suggested-by: Mika.

Mika, please check if I wrote description clearly.

> Fixes: 3ae02c14d964 ("pinctrl: intel: set default handler to be
> handle_bad_irq()")
> Reported-by: Robert R. Howell <rhowell@uwyo.edu>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/pinctrl/intel/pinctrl-baytrail.c | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/pinctrl/intel/pinctrl-baytrail.c
> b/drivers/pinctrl/intel/pinctrl-baytrail.c
> index 67e92699b84e..c123488266ce 100644
> --- a/drivers/pinctrl/intel/pinctrl-baytrail.c
> +++ b/drivers/pinctrl/intel/pinctrl-baytrail.c
> @@ -1623,6 +1623,8 @@ static void byt_gpio_irq_handler(struct irq_desc
> *desc)
>  
>  static void byt_gpio_irq_init_hw(struct byt_gpio *vg)
>  {
> +	struct gpio_chip *gc = &vg->chip;
> +	struct device *dev = &vg->pdev->dev;
>  	void __iomem *reg;
>  	u32 base, value;
>  	int i;
> @@ -1644,10 +1646,12 @@ static void byt_gpio_irq_init_hw(struct
> byt_gpio *vg)
>  		}
>  
>  		value = readl(reg);
> -		if ((value & BYT_PIN_MUX) == byt_get_gpio_mux(vg, i)
> &&
> -		    !(value & BYT_DIRECT_IRQ_EN)) {
> +		if (value & BYT_DIRECT_IRQ_EN) {
> +			clear_bit(i, gc->irq_valid_mask);
> +			dev_dbg(dev, "excluding GPIO %d from IRQ
> domain\n", i);
> +		} else if ((value & BYT_PIN_MUX) ==
> byt_get_gpio_mux(vg, i)) {
>  			byt_gpio_clear_triggering(vg, i);
> -			dev_dbg(&vg->pdev->dev, "disabling GPIO
> %d\n", i);
> +			dev_dbg(dev, "disabling GPIO %d\n", i);
>  		}
>  	}
>  
> @@ -1686,6 +1690,7 @@ static int byt_gpio_probe(struct byt_gpio *vg)
>  	gc->can_sleep	= false;
>  	gc->parent	= &vg->pdev->dev;
>  	gc->ngpio	= vg->soc_data->npins;
> +	gc->irq_need_valid_mask	= true;
>  
>  #ifdef CONFIG_PM_SLEEP
>  	vg->saved_context = devm_kcalloc(&vg->pdev->dev, gc->ngpio,

-- 
Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy
