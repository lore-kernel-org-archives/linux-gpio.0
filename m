From: "Wang, Yalin" <Yalin.Wang@sonymobile.com>
Subject: RE: [PATCH] gpiolib:change to use irq_alloc_descs_from to alloc
 virqs
Date: Wed, 24 Sep 2014 09:59:54 +0800
Message-ID: <35FD53F367049845BC99AC72306C23D103D6DB49162C@CNBJMBX05.corpusers.net>
References: <35FD53F367049845BC99AC72306C23D103CDBFBFB017@CNBJMBX05.corpusers.net>,<CACRpkdbmnPcDFHu6oLhXQERyFzXD2K1QHH1hRUtci41KuEDdtQ@mail.gmail.com>
 <35FD53F367049845BC99AC72306C23D103D6DB4D6F29@CNBJMBX05.corpusers.net>,<54216EA5.5010506@ti.com>,<35FD53F367049845BC99AC72306C23D103D6DB4D6F2A@CNBJMBX05.corpusers.net>,<35FD53F367049845BC99AC72306C23D103D6DB4D6F2B@CNBJMBX05.corpusers.net>
 <35FD53F367049845BC99AC72306C23D103D6DB4D6F2C@CNBJMBX05.corpusers.net>
 <54218BAC.3070303@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from cnbjrel01.sonyericsson.com ([219.141.167.165]:16275 "EHLO
	cnbjrel01.sonyericsson.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752738AbaIXB75 convert rfc822-to-8bit
	(ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Tue, 23 Sep 2014 21:59:57 -0400
In-Reply-To: <54218BAC.3070303@ti.com>
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: 'Grygorii Strashko' <grygorii.strashko@ti.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: "gnurou@gmail.com" <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>

Hi Grygorii,

Yeah, you are right,
I really make a mistake .

I think both our patch are ok to fix this problem,
But we use different solutions.

My patch have a advantage than yours that
It alloc virqs in one time and when free it,
Doesn't need call irqa_find_mapping() one by one, performance
Is better .

For my patch, you said " As for me, you patch will completely disable Sparse IRQ feature :("

Why? Could you make me clear ? :)

Then we can decide which solution to use to fix this issue. 

Thanks

-----Original Message-----
> hi
> 
> but it is not safe with a little problem, when remove , should not 
> assume physical irq start from 0, i change like this, store 
> gpiochip->irq_base = first_irq;
> 
> ---
> 
> 
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c index 
> 15cc0bb..c5fb2c1 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -517,14 +517,14 @@ static int gpiochip_to_irq(struct gpio_chip *chip, unsigned offset)
>    */
>   static void gpiochip_irqchip_remove(struct gpio_chip *gpiochip)
>   {
> -	unsigned int offset;
> -
> +	int i;
>   	acpi_gpiochip_free_interrupts(gpiochip);
>   
>   	/* Remove all IRQ mappings and delete the domain */
>   	if (gpiochip->irqdomain) {
> -		for (offset = 0; offset < gpiochip->ngpio; offset++)
> -			irq_dispose_mapping(gpiochip->irq_base + offset);
> +		for (i = 0; i < gpiochip->ngpio; i++)
> +			irq_dispose_mapping(irq_find_mapping(gpiochip->irqdomain,
> +						gpiochip->irq_base + i));

No:) it should start from 0
irq_dispose_mapping(irq_find_mapping(gpiochip->irqdomain, i));

irq_domain_add_simple() uses hwirq_base == 0 and current implementation of gpiolib irqchip helpers doesn't support setting of custom hwirq_base.
  

>   		irq_domain_remove(gpiochip->irqdomain);
>   	}
>   
> @@ -596,6 +596,7 @@ int gpiochip_irqchip_add(struct gpio_chip *gpiochip,
>   		gpiochip->irqchip = NULL;
>   		return -EINVAL;
>   	}
> +	gpiochip->irq_base = first_irq;
>   	irqchip->irq_request_resources = gpiochip_irq_reqres;
>   	irqchip->irq_release_resources = gpiochip_irq_relres;
>   
> @@ -604,14 +605,10 @@ int gpiochip_irqchip_add(struct gpio_chip *gpiochip,
>   	 * any gpiochip calls. If the first_irq was zero, this is
>   	 * necessary to allocate descriptors for all IRQs.
>   	 */
> -	for (offset = 0; offset < gpiochip->ngpio; offset++) {
> -		irq_base = irq_create_mapping(gpiochip->irqdomain, offset);
> -		if (offset == 0)
> -			/*
> -			 * Store the base into the gpiochip to be used when
> -			 * unmapping the irqs.
> -			 */
> -			gpiochip->irq_base = irq_base;
> +	if (first_irq == 0) {
> +		for (offset = 0; offset < gpiochip->ngpio; offset++)
> +			irq_base = irq_create_mapping(gpiochip->irqdomain, offset);
> +
>   	}
>   
>   	acpi_gpiochip_request_interrupts(gpiochip);
> 
> 

