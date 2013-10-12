From: Baruch Siach <baruch@tkos.co.il>
Subject: Re: [PATCH] gpio: pl061: drop references to "virtual" IRQ
Date: Sat, 12 Oct 2013 21:59:02 +0300
Message-ID: <20131012185901.GA4276@tarshish>
References: <1381513327-7787-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from guitar.tcltek.co.il ([192.115.133.116]:44996 "EHLO
	sivan.tkos.co.il" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752744Ab3JLTJd (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sat, 12 Oct 2013 15:09:33 -0400
Content-Disposition: inline
In-Reply-To: <1381513327-7787-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>, Haojian Zhuang <haojian.zhuang@linaro.org>, Rob Herring <rob.herring@calxeda.com>

Hi Linus,

On Fri, Oct 11, 2013 at 07:42:07PM +0200, Linus Walleij wrote:
> Rename the argument "virq" to just "irq", this IRQ isn't any
> more "virtual" than any other Linux IRQ number, we use "hwirq"
> for the actual hw-numbers, "virq" is just bogus.
> 
> Cc: Haojian Zhuang <haojian.zhuang@linaro.org>
> Cc: Rob Herring <rob.herring@calxeda.com>
> Cc: Baruch Siach <baruch@tkos.co.il>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Acked-by: Baruch Siach <baruch@tkos.co.il>

baruch

> ---
>  drivers/gpio/gpio-pl061.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-pl061.c b/drivers/gpio/gpio-pl061.c
> index 4274e2e..f22f7f3 100644
> --- a/drivers/gpio/gpio-pl061.c
> +++ b/drivers/gpio/gpio-pl061.c
> @@ -238,15 +238,15 @@ static struct irq_chip pl061_irqchip = {
>  	.irq_set_type	= pl061_irq_type,
>  };
>  
> -static int pl061_irq_map(struct irq_domain *d, unsigned int virq,
> -			 irq_hw_number_t hw)
> +static int pl061_irq_map(struct irq_domain *d, unsigned int irq,
> +			 irq_hw_number_t hwirq)
>  {
>  	struct pl061_gpio *chip = d->host_data;
>  
> -	irq_set_chip_and_handler_name(virq, &pl061_irqchip, handle_simple_irq,
> +	irq_set_chip_and_handler_name(irq, &pl061_irqchip, handle_simple_irq,
>  				      "pl061");
> -	irq_set_chip_data(virq, chip);
> -	irq_set_irq_type(virq, IRQ_TYPE_NONE);
> +	irq_set_chip_data(irq, chip);
> +	irq_set_irq_type(irq, IRQ_TYPE_NONE);
>  
>  	return 0;
>  }

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
