From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH] pinctrl: intel: Clear interrupt status in unmask callback
Date: Sat, 27 Apr 2019 00:47:58 +0300
Message-ID: <20190426214758.GC9224@smile.fi.intel.com>
References: <20190422044539.16085-1-kai.heng.feng@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190422044539.16085-1-kai.heng.feng@canonical.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kai-Heng Feng <kai.heng.feng@canonical.com>
Cc: mika.westerberg@linux.intel.com, linus.walleij@linaro.org, hotwater438@tutanota.com, hdegoede@redhat.com, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

On Mon, Apr 22, 2019 at 12:45:39PM +0800, Kai-Heng Feng wrote:
> Commit a939bb57cd47 ("pinctrl: intel: implement gpio_irq_enable") was
> added because clearing interrupt status bit is required to avoid
> unexpected behavior.
> 
> Turns out the unmask callback also needs the fix, which can solve weird
> IRQ triggering issues on I2C touchpad ELAN1200.

> -static void intel_gpio_irq_enable(struct irq_data *d)
> -{
> -	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
> -	struct intel_pinctrl *pctrl = gpiochip_get_data(gc);
> -	const struct intel_community *community;
> -	const struct intel_padgroup *padgrp;
> -	int pin;
> -
> -	pin = intel_gpio_to_pin(pctrl, irqd_to_hwirq(d), &community, &padgrp);
> -	if (pin >= 0) {
> -		unsigned int gpp, gpp_offset, is_offset;
> -		unsigned long flags;
> -		u32 value;
> -
> -		gpp = padgrp->reg_num;
> -		gpp_offset = padgroup_offset(padgrp, pin);
> -		is_offset = community->is_offset + gpp * 4;
> -
> -		raw_spin_lock_irqsave(&pctrl->lock, flags);
> -		/* Clear interrupt status first to avoid unexpected interrupt */
> -		writel(BIT(gpp_offset), community->regs + is_offset);
> -
> -		value = readl(community->regs + community->ie_offset + gpp * 4);
> -		value |= BIT(gpp_offset);
> -		writel(value, community->regs + community->ie_offset + gpp * 4);
> -		raw_spin_unlock_irqrestore(&pctrl->lock, flags);
> -	}
> -}
> -
>  static void intel_gpio_irq_mask_unmask(struct irq_data *d, bool mask)
>  {
>  	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
> @@ -963,6 +934,11 @@ static void intel_gpio_irq_mask_unmask(struct irq_data *d, bool mask)
>  		reg = community->regs + community->ie_offset + gpp * 4;
>  
>  		raw_spin_lock_irqsave(&pctrl->lock, flags);
> +
> +		/* Clear interrupt status first to avoid unexpected interrupt */

> +		if (!mask)

Can we do this unconditionally?

> +			writel(BIT(gpp_offset), community->regs + community->is_offset + gpp * 4);

I would rather prefer to follow the below pattern, like

reg = ...;
writel(..., reg);

or, to decrease calculus under spin lock, something like

reg = ->regs + gpp * 4;

writel(..., reg + is_offset);

readl(reg + ie_offset);

etc.

> +
>  		value = readl(reg);
>  		if (mask)
>  			value &= ~BIT(gpp_offset);
> @@ -1106,7 +1082,6 @@ static irqreturn_t intel_gpio_irq(int irq, void *data)
>  
>  static struct irq_chip intel_gpio_irqchip = {
>  	.name = "intel-gpio",

> -	.irq_enable = intel_gpio_irq_enable,

Is it possible scenario when IRQ enable is called, but not masking callbacks?
For _AEI or GPE?

>  	.irq_ack = intel_gpio_irq_ack,
>  	.irq_mask = intel_gpio_irq_mask,
>  	.irq_unmask = intel_gpio_irq_unmask,

-- 
With Best Regards,
Andy Shevchenko
