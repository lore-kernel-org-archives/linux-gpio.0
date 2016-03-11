From: Mika Westerberg <mika.westerberg@intel.com>
Subject: Re: [PATCH 3/3] pinctrl:Intel: make the high level interrupt working
Date: Fri, 11 Mar 2016 11:49:42 +0200
Message-ID: <20160311094942.GP1796@lahna.fi.intel.com>
References: <1457715962-108484-1-git-send-email-qipeng.zha@intel.com>
 <1457715962-108484-3-git-send-email-qipeng.zha@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga02.intel.com ([134.134.136.20]:50220 "EHLO mga02.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750864AbcCKJtr (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Fri, 11 Mar 2016 04:49:47 -0500
Content-Disposition: inline
In-Reply-To: <1457715962-108484-3-git-send-email-qipeng.zha@intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Qipeng Zha <qipeng.zha@intel.com>
Cc: linux-gpio@vger.kernel.org, linus.walleij@linaro.org, Qi Zheng <qi.zheng@intel.com>

On Sat, Mar 12, 2016 at 01:06:02AM +0800, Qipeng Zha wrote:
> High level trigger mode of GPIO interrupt is not set correctly
> in intel_gpio_irq_type(), and will make this kind of interrupt
> not respond.

Good finding.

> Signed-off-by: Qi Zheng <qi.zheng@intel.com>
> Signed-off-by: Qipeng Zha <qipeng.zha@intel.com>
> ---
>  drivers/pinctrl/intel/pinctrl-intel.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/pinctrl/intel/pinctrl-intel.c b/drivers/pinctrl/intel/pinctrl-intel.c
> index d6fe659..706a21f 100644
> --- a/drivers/pinctrl/intel/pinctrl-intel.c
> +++ b/drivers/pinctrl/intel/pinctrl-intel.c
> @@ -790,6 +790,8 @@ static int intel_gpio_irq_type(struct irq_data *d, unsigned type)
>  		value |= PADCFG0_RXEVCFG_EDGE << PADCFG0_RXEVCFG_SHIFT;
>  	} else if (type & IRQ_TYPE_LEVEL_LOW) {
>  		value |= PADCFG0_RXINV;
> +	} else if (type & IRQ_TYPE_LEVEL_HIGH) {
> +		;

What about following instead?

	} else if (type & IRQ_TYPE_LEVEL_MASK) {
		if (type & IRQ_TYPE_LEVEL_LOW)
			value |= PADCFG0_RXINV;
	}


>  	} else {
>  		value |= PADCFG0_RXEVCFG_DISABLED << PADCFG0_RXEVCFG_SHIFT;
>  	}
> -- 
> 1.8.3.2
