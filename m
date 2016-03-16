From: Mika Westerberg <mika.westerberg@intel.com>
Subject: Re: [PATCH 2/2] pinctrl:Intel: implement gpio_irq_enable
Date: Wed, 16 Mar 2016 12:03:12 +0200
Message-ID: <20160316100312.GD1793@lahna.fi.intel.com>
References: <1458120064-74635-1-git-send-email-qipeng.zha@intel.com>
 <1458120064-74635-2-git-send-email-qipeng.zha@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga11.intel.com ([192.55.52.93]:26453 "EHLO mga11.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S934448AbcCPKDS (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Wed, 16 Mar 2016 06:03:18 -0400
Content-Disposition: inline
In-Reply-To: <1458120064-74635-2-git-send-email-qipeng.zha@intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Qipeng Zha <qipeng.zha@intel.com>
Cc: linux-gpio@vger.kernel.org, linus.walleij@linaro.org, Qi Zheng <qi.zheng@intel.com>

On Wed, Mar 16, 2016 at 05:21:04PM +0800, Qipeng Zha wrote:
> From: Qi Zheng <qi.zheng@intel.com>
> 
> There is unexpected gpio interrupt after irq_enable. If not
> implemeted gpio_irq_enable callback, irq_enable calls irq_unmask
> instead. But if there was interrupt set before the irq_enable,
> unmask it may trigger the unexpected interrupt. By implementing
> the gpio_irq_enable callback, do interrupt status ack, the issue
> has gone.
> 
> Signed-off-by: Qi Zheng <qi.zheng@intel.com>
> Signed-off-by: Qipeng Zha <qipeng.zha@intel.com>
> ---
>  drivers/pinctrl/intel/pinctrl-intel.c | 31 +++++++++++++++++++++++++++++++
>  1 file changed, 31 insertions(+)
> 
> diff --git a/drivers/pinctrl/intel/pinctrl-intel.c b/drivers/pinctrl/intel/pinctrl-intel.c
> index c216cb3..768118d 100644
> --- a/drivers/pinctrl/intel/pinctrl-intel.c
> +++ b/drivers/pinctrl/intel/pinctrl-intel.c
> @@ -665,6 +665,36 @@ static void intel_gpio_irq_ack(struct irq_data *d)
>  	spin_unlock(&pctrl->lock);
>  }
>  
> +static void intel_gpio_irq_enable(struct irq_data *d)
> +{
> +	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
> +	struct intel_pinctrl *pctrl = gpiochip_get_data(gc);
> +	const struct intel_community *community;
> +	unsigned pin = irqd_to_hwirq(d);
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&pctrl->lock, flags);
> +
> +	community = intel_get_community(pctrl, pin);
> +	if (community) {
> +		unsigned padno = pin_to_padno(community, pin);
> +		unsigned gpp_size = community->gpp_size;
> +		unsigned gpp_offset = padno % gpp_size;
> +		unsigned gpp = padno / gpp_size;
> +		u32 value;
> +
> +		/* Clear interrupt status first to avoid unexpected interrupt */
> +		writel(BIT(gpp_offset), community->regs + GPI_IS + gpp * 4);
> +
> +		value = readl(community->regs + community->ie_offset + gpp * 4);
> +		value |= BIT(gpp_offset);
> +		writel(value, community->regs + community->ie_offset + gpp * 4);
> +	}
> +
> +	spin_unlock_irqrestore(&pctrl->lock, flags);
> +}
> +
> +

Please remove the second blank line here.

Then you can add my

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>

(as I think this code was based on my original code).

>  static void intel_gpio_irq_mask_unmask(struct irq_data *d, bool mask)
>  {
>  	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
> @@ -853,6 +883,7 @@ static irqreturn_t intel_gpio_irq(int irq, void *data)
>  
>  static struct irq_chip intel_gpio_irqchip = {
>  	.name = "intel-gpio",
> +	.irq_enable = intel_gpio_irq_enable,
>  	.irq_ack = intel_gpio_irq_ack,
>  	.irq_mask = intel_gpio_irq_mask,
>  	.irq_unmask = intel_gpio_irq_unmask,
> -- 
> 1.8.3.2
