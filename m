From: Mika Westerberg <mika.westerberg@intel.com>
Subject: Re: [PATCH 2/3] pinctrl:Intel: clear interrupt status for every IRQ
 setup
Date: Fri, 11 Mar 2016 11:45:17 +0200
Message-ID: <20160311094517.GO1796@lahna.fi.intel.com>
References: <1457715962-108484-1-git-send-email-qipeng.zha@intel.com>
 <1457715962-108484-2-git-send-email-qipeng.zha@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga04.intel.com ([192.55.52.120]:6965 "EHLO mga04.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750999AbcCKJpV (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Fri, 11 Mar 2016 04:45:21 -0500
Content-Disposition: inline
In-Reply-To: <1457715962-108484-2-git-send-email-qipeng.zha@intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Qipeng Zha <qipeng.zha@intel.com>
Cc: linux-gpio@vger.kernel.org, linus.walleij@linaro.org, Qi Zheng <qi.zheng@intel.com>

On Sat, Mar 12, 2016 at 01:06:01AM +0800, Qipeng Zha wrote:
> There is one unexpected GPIO interrupt coming in below scenario.
> 1. GPIO X is going to be used as falling edge interrupt.
> 2. Before request_irq call, this GPIO X interrupt was masked.
> 3. But the IRQ mode may be set for some mode in default (by BIOS).
> 4. Toggle GPIO X from high to low.
> 5. The GPIO X interrupt status will be set even if it was masked.
> 6. Register the interrupt for GPIO X, the interrupt will be unmasked.
> 7. Even if no change on GPIO X afterwards, but one GPIO X interrupt
> will be triggered because the interrupt status was set.
> 
> To avoid above issue, the interrupt status need clear before request_irq.
> 
> Signed-off-by: Qi Zheng <qi.zheng@intel.com>
> Signed-off-by: Qipeng Zha <qipeng.zha@intel.com>
> ---
>  drivers/pinctrl/intel/pinctrl-intel.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/pinctrl/intel/pinctrl-intel.c b/drivers/pinctrl/intel/pinctrl-intel.c
> index ded5378..d6fe659 100644
> --- a/drivers/pinctrl/intel/pinctrl-intel.c
> +++ b/drivers/pinctrl/intel/pinctrl-intel.c
> @@ -773,6 +773,8 @@ static int intel_gpio_irq_type(struct irq_data *d, unsigned type)
>  		return -EPERM;
>  	}
>  
> +	intel_gpio_irq_ack(d);

If the pin toggles right here, we still have the same issue, no?

We should check in the interrupt handler whether the interrupt is
actually enabled which I think we do already. Maybe that code has bug
somewhere?

> +
>  	spin_lock_irqsave(&pctrl->lock, flags);
>  
>  	value = readl(reg);
> -- 
> 1.8.3.2
