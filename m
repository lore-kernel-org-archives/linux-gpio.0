From: "Zheng, Qi" <qi.zheng@intel.com>
Subject: RE: [PATCH 3/3] pinctrl:Intel: make the high level interrupt working
Date: Mon, 14 Mar 2016 01:40:10 +0000
Message-ID: <0DD381DBF8F68D419C32ACFCEB28EB2521D10385@SHSMSX101.ccr.corp.intel.com>
References: <1457715962-108484-1-git-send-email-qipeng.zha@intel.com>
 <1457715962-108484-3-git-send-email-qipeng.zha@intel.com>
 <20160311094942.GP1796@lahna.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga02.intel.com ([134.134.136.20]:30860 "EHLO mga02.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751207AbcCNBkT convert rfc822-to-8bit (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sun, 13 Mar 2016 21:40:19 -0400
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: "Westerberg, Mika" <mika.westerberg@intel.com>, "Zha, Qipeng" <qipeng.zha@intel.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linus.walleij@linaro.org" <linus.walleij@linaro.org>



On Sat, Mar 12, 2016 at 01:06:02AM +0800, Qipeng Zha wrote:
> High level trigger mode of GPIO interrupt is not set correctly in 
> intel_gpio_irq_type(), and will make this kind of interrupt not 
> respond.

> Good finding.

> Signed-off-by: Qi Zheng <qi.zheng@intel.com>
> Signed-off-by: Qipeng Zha <qipeng.zha@intel.com>
> ---
>  drivers/pinctrl/intel/pinctrl-intel.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/pinctrl/intel/pinctrl-intel.c
> b/drivers/pinctrl/intel/pinctrl-intel.c
> index d6fe659..706a21f 100644
> --- a/drivers/pinctrl/intel/pinctrl-intel.c
> +++ b/drivers/pinctrl/intel/pinctrl-intel.c
> @@ -790,6 +790,8 @@ static int intel_gpio_irq_type(struct irq_data *d, unsigned type)
>  		value |= PADCFG0_RXEVCFG_EDGE << PADCFG0_RXEVCFG_SHIFT;
>  	} else if (type & IRQ_TYPE_LEVEL_LOW) {
>  		value |= PADCFG0_RXINV;
> +	} else if (type & IRQ_TYPE_LEVEL_HIGH) {
> +		;

> What about following instead?

> Nothing need to do.
> Because the default setting below  in the intel_gpio_irq_type is for high level mode interrupt. 
>	value &= ~(PADCFG0_RXEVCFG_MASK | PADCFG0_RXINV);

Sorry, misunderstood your points.
The following looks fine to me.
Thanks.

>
>	} else if (type & IRQ_TYPE_LEVEL_MASK) {
>		if (type & IRQ_TYPE_LEVEL_LOW)
>			value |= PADCFG0_RXINV;
>	}



>  	} else {
>  		value |= PADCFG0_RXEVCFG_DISABLED << PADCFG0_RXEVCFG_SHIFT;
>  	}
> --
> 1.8.3.2
