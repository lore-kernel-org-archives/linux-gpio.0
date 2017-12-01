From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH] pinctrl: cherryview: Mask all interrupts on Intel_Strago
 based systems
Date: Fri, 1 Dec 2017 10:21:27 -0800
Message-ID: <20171201182127.GA15633@roeck-us.net>
References: <20171201102504.38709-1-mika.westerberg@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pf0-f193.google.com ([209.85.192.193]:35189 "EHLO
        mail-pf0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750872AbdLASVa (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 1 Dec 2017 13:21:30 -0500
Received: by mail-pf0-f193.google.com with SMTP id j124so4989858pfc.2
        for <linux-gpio@vger.kernel.org>; Fri, 01 Dec 2017 10:21:30 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <20171201102504.38709-1-mika.westerberg@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-gpio@vger.kernel.org

On Fri, Dec 01, 2017 at 01:25:04PM +0300, Mika Westerberg wrote:
> Guenter Roeck reported an interrupt storm on a prototype system which is
> based on Cyan Chromebook. The root cause turned out to be a incorrectly
> configured pin that triggers spurious interrupts. This will be fixed in
> coreboot but currently we need to prevent the interrupt storm from
> happening by masking all interrupts (but not GPEs) on those systems.
> 
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=194945
> Reported-by: Guenter Roeck <linux@roeck-us.net>
> Reported-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>

Tested-by: Guenter Roeck <linux@roeck-us.net>

Guenter

> ---
>  drivers/pinctrl/intel/pinctrl-cherryview.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/drivers/pinctrl/intel/pinctrl-cherryview.c b/drivers/pinctrl/intel/pinctrl-cherryview.c
> index aa6c9f569c2b..083ffd397154 100644
> --- a/drivers/pinctrl/intel/pinctrl-cherryview.c
> +++ b/drivers/pinctrl/intel/pinctrl-cherryview.c
> @@ -1601,6 +1601,22 @@ static int chv_gpio_probe(struct chv_pinctrl *pctrl, int irq)
>  			clear_bit(i, chip->irq.valid_mask);
>  	}
>  
> +	/*
> +	 * The same set of machines in chv_no_valid_mask[] have incorrectly
> +	 * configured GPIOs that generate spurious interrupts so we use
> +	 * this same list to apply another quirk for them.
> +	 *
> +	 * See also https://bugzilla.kernel.org/show_bug.cgi?id=197953.
> +	 */
> +	if (!need_valid_mask) {
> +		/*
> +		 * Mask all interrupts the community is able to generate
> +		 * but leave the ones that can only generate GPEs unmasked.
> +		 */
> +		chv_writel(~(BIT(pctrl->community->nirqs) - 1),
> +			   pctrl->regs + CHV_INTMASK);
> +	}
> +
>  	/* Clear all interrupts */
>  	chv_writel(0xffff, pctrl->regs + CHV_INTSTAT);
>  
> -- 
> 2.15.0
> 
