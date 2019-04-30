From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v2] pinctrl: intel: Clear interrupt status in mask/unmask
 callback
Date: Tue, 30 Apr 2019 19:48:13 +0300
Message-ID: <20190430164813.GP9224@smile.fi.intel.com>
References: <20190430083753.18197-1-kai.heng.feng@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190430083753.18197-1-kai.heng.feng@canonical.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kai-Heng Feng <kai.heng.feng@canonical.com>
Cc: mika.westerberg@linux.intel.com, linus.walleij@linaro.org, hotwater438@tutanota.com, hdegoede@redhat.com, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

On Tue, Apr 30, 2019 at 04:37:53PM +0800, Kai-Heng Feng wrote:
> Commit a939bb57cd47 ("pinctrl: intel: implement gpio_irq_enable") was
> added because clearing interrupt status bit is required to avoid
> unexpected behavior.
> 
> Turns out the unmask callback also needs the fix, which can solve weird
> IRQ triggering issues on I2C touchpad ELAN1200.

Pushed to my review and testing queue, thanks!

> 
> Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
> ---
> v2:
> - Clear interrupt status for both mask/umask cases.
> - Reduce calculation under irq spinlock.
> 
>  drivers/pinctrl/intel/pinctrl-intel.c | 37 +++++----------------------
>  1 file changed, 6 insertions(+), 31 deletions(-)
> 
> diff --git a/drivers/pinctrl/intel/pinctrl-intel.c b/drivers/pinctrl/intel/pinctrl-intel.c
> index 3b1818184207..717148d2818c 100644
> --- a/drivers/pinctrl/intel/pinctrl-intel.c
> +++ b/drivers/pinctrl/intel/pinctrl-intel.c
> @@ -913,35 +913,6 @@ static void intel_gpio_irq_ack(struct irq_data *d)
>  	}
>  }
>  
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
> @@ -954,15 +925,20 @@ static void intel_gpio_irq_mask_unmask(struct irq_data *d, bool mask)
>  	if (pin >= 0) {
>  		unsigned int gpp, gpp_offset;
>  		unsigned long flags;
> -		void __iomem *reg;
> +		void __iomem *reg, *is;
>  		u32 value;
>  
>  		gpp = padgrp->reg_num;
>  		gpp_offset = padgroup_offset(padgrp, pin);
>  
>  		reg = community->regs + community->ie_offset + gpp * 4;
> +		is = community->regs + community->is_offset + gpp * 4;
>  
>  		raw_spin_lock_irqsave(&pctrl->lock, flags);
> +
> +		/* Clear interrupt status first to avoid unexpected interrupt */
> +		writel(BIT(gpp_offset), is);
> +
>  		value = readl(reg);
>  		if (mask)
>  			value &= ~BIT(gpp_offset);
> @@ -1106,7 +1082,6 @@ static irqreturn_t intel_gpio_irq(int irq, void *data)
>  
>  static struct irq_chip intel_gpio_irqchip = {
>  	.name = "intel-gpio",
> -	.irq_enable = intel_gpio_irq_enable,
>  	.irq_ack = intel_gpio_irq_ack,
>  	.irq_mask = intel_gpio_irq_mask,
>  	.irq_unmask = intel_gpio_irq_unmask,
> -- 
> 2.17.1
> 

-- 
With Best Regards,
Andy Shevchenko
