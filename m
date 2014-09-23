From: Grygorii Strashko <grygorii.strashko@ti.com>
Subject: Re: [PATCH] gpiolib:change to use irq_alloc_descs_from to alloc virqs
Date: Tue, 23 Sep 2014 18:03:08 +0300
Message-ID: <54218BAC.3070303@ti.com>
References: <35FD53F367049845BC99AC72306C23D103CDBFBFB017@CNBJMBX05.corpusers.net>,<CACRpkdbmnPcDFHu6oLhXQERyFzXD2K1QHH1hRUtci41KuEDdtQ@mail.gmail.com> <35FD53F367049845BC99AC72306C23D103D6DB4D6F29@CNBJMBX05.corpusers.net>,<54216EA5.5010506@ti.com>,<35FD53F367049845BC99AC72306C23D103D6DB4D6F2A@CNBJMBX05.corpusers.net>,<35FD53F367049845BC99AC72306C23D103D6DB4D6F2B@CNBJMBX05.corpusers.net> <35FD53F367049845BC99AC72306C23D103D6DB4D6F2C@CNBJMBX05.corpusers.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from bear.ext.ti.com ([192.94.94.41]:44158 "EHLO bear.ext.ti.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755334AbaIWPDU (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Tue, 23 Sep 2014 11:03:20 -0400
In-Reply-To: <35FD53F367049845BC99AC72306C23D103D6DB4D6F2C@CNBJMBX05.corpusers.net>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: "Wang, Yalin" <Yalin.Wang@sonymobile.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: "gnurou@gmail.com" <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>

On 09/23/2014 05:15 PM, Wang, Yalin wrote:
> hi
> 
> but it is not safe with a little problem,
> when remove , should not assume physical irq start from 0,
> i change like this,
> store gpiochip->irq_base = first_irq;
> 
> ---
> 
> 
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index 15cc0bb..c5fb2c1 100644
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

irq_domain_add_simple() uses hwirq_base == 0 and current implementation of
gpiolib irqchip helpers doesn't support setting of custom hwirq_base.
  

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
> ________________________________________
> From: Wang, Yalin
> Sent: Tuesday, September 23, 2014 9:39 PM
> To: Wang, Yalin; Grygorii Strashko; Linus Walleij
> Cc: gnurou@gmail.com; linux-gpio@vger.kernel.org; akpm@linux-foundation.org
> Subject: RE: [PATCH] gpiolib:change to use irq_alloc_descs_from to alloc virqs
> 
> hi
> 
> sorry,
> i don't notice Grygorii's patch ,
> yes, this patch is more easy,
> it is ok to fix this problem.
> 
> Great!
> ________________________________________
> From: Wang, Yalin
> Sent: Tuesday, September 23, 2014 9:37 PM
> To: Grygorii Strashko; Linus Walleij
> Cc: gnurou@gmail.com; linux-gpio@vger.kernel.org; akpm@linux-foundation.org
> Subject: RE: [PATCH] gpiolib:change to use irq_alloc_descs_from to alloc virqs
> 
> Hi
> 
> In fact, i don't encounter any problem about gpio code,
> i just find this issue when i see the source code,
> i feel it is not safe, so i make a patch for it.
> 
> yes, you are right,
> "irq_base" is used only twice in gpiolib code,
> but it maybe used by some other drivers,
> if remove it, some drivers will can't get virq base.
> it should get it by find_irq_mapping(), but it is also ok.
> 
> in fact , we can allow the virq are allocated one by one,
> but this need change gpiochip_irqchip_remove( ) function,
> it should not assume the virq are contentious,
> i think both method are ok ,
> it is just decided by how you want design it :)
> 
> To summarize, we should make gpiochip_irqchip_add() and
> gpiochip_irqchip_remove() both work correctly.
> 
> 
> ________________________________________
> From: Grygorii Strashko [grygorii.strashko@ti.com]
> Sent: Tuesday, September 23, 2014 8:59 PM
> To: Wang, Yalin; Linus Walleij
> Cc: gnurou@gmail.com; linux-gpio@vger.kernel.org; akpm@linux-foundation.org
> Subject: Re: [PATCH] gpiolib:change to use irq_alloc_descs_from to alloc virqs
> 
> Hi Wang,
> 
> On 09/23/2014 03:03 PM, Wang, Yalin wrote:
>> hi
>>
>> this is because , here:
>>
>> gpiochip->irqdomain = irq_domain_add_simple(of_node,
>>                                        gpiochip->ngpio, first_irq,
>>                                        &gpiochip_domain_ops, gpiochip);
>>
>>
>>    irq_domain_add_simple() in this function,
>>        if (first_irq > 0) {
>>                if (IS_ENABLED(CONFIG_SPARSE_IRQ)) {
>>                        /* attempt to allocated irq_descs */
>>                        int rc = irq_alloc_descs(first_irq, first_irq, size,
>>                                        of_node_to_nid(of_node));
>>                        if (rc < 0)
>>                                pr_info("Cannot allocate irq_descs @ IRQ%d, assuming pre-allocated\n",
>>                                                first_irq);
>>                }
>>                irq_domain_associate_many(domain, first_irq, 0, size);
>>        }
>>
>> if first_irq  > 0 , it will allocate it ,
>> and make sure the return virq is equal to first_irq  .
>> so we don't need allocate it again .
> 
> Could provide a little bit more information about issue you've observed, pls?
> 
> As for me, you patch will completely disable Sparse IRQ feature :(
> 
> Also, I'm sure that struct gpio_chip->irq_base field can
> be removed from gpiolib irqchip code - GPIO drivers shouldn't use it also,
> because otherwise they will be incompatible with Sparse IRQ feature.
> 
> Now the "irq_base" is used only twice in gpiolib code and below diff should
> allow to drop it completely from gpiolib code.
> 
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index 15cc0bb..81762ed 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -524,7 +524,7 @@ static void gpiochip_irqchip_remove(struct gpio_chip *gpiochip)
>          /* Remove all IRQ mappings and delete the domain */
>          if (gpiochip->irqdomain) {
>                  for (offset = 0; offset < gpiochip->ngpio; offset++)
> -                       irq_dispose_mapping(gpiochip->irq_base + offset);
> +                       irq_dispose_mapping(irq_find_mapping(gpiochip->irqdomain, offset));
>                  irq_domain_remove(gpiochip->irqdomain);
>          }
> 
> not tested.
> 
> 
> 
>> ________________________________________
>> From: Linus Walleij [linus.walleij@linaro.org]
>> Sent: Tuesday, September 23, 2014 6:21 PM
>> To: Wang, Yalin
>> Cc: gnurou@gmail.com; linux-gpio@vger.kernel.org; akpm@linux-foundation.org
>> Subject: Re: [PATCH] gpiolib:change to use irq_alloc_descs_from to alloc virqs
>>
>> On Tue, Sep 9, 2014 at 9:12 AM, Wang, Yalin <Yalin.Wang@sonymobile.com> wrote:
>>
>>> this patch change use from irq_create_mapping to irq_alloc_descs_from,
>>> use irq_create_mapping to alloc virq one by one is not safe,
>>> it can't promise the allcated virqs are continuous,
>>> in stead, we use irq_alloc_descs_from() to alloc virqs in one time,
>>> so that the allocated virqs are in continuous bitmaps.
>>>
>>> Signed-off-by: Yalin Wang <yalin.wang@sonymobile.com>
>>
>> (...)
>>
>>> -       for (offset = 0; offset < gpiochip->ngpio; offset++) {
>>> -               irq_base = irq_create_mapping(gpiochip->irqdomain, offset);
>>> -               if (offset == 0)
>>> -                       /*
>>> -                        * Store the base into the gpiochip to be used when
>>> -                        * unmapping the irqs.
>>> -                        */
>>> -                       gpiochip->irq_base = irq_base;
>>> +       if (first_irq > 0) {
>>> +               gpiochip->irq_base = first_irq;
>>
>> Wait is this safe? Now you assume all descriptors are pre-allocated
>> and associated in this case, atleast explain what is going on.
>>
>>> +       } else {
>>> +               gpiochip->irq_base = irq_alloc_descs_from(1, gpiochip->ngpio,
>>> +                               of_node_to_nid(of_node));
>>> +               irq_domain_associate_many(gpiochip->irqdomain,
>>> +                               gpiochip->irq_base, 0, gpiochip->ngpio);
>>
>> This part looks OK.
>>
>> I'm holding this patch back until the above is clarified.
>>
>> Yours,
>> Linus Walleij--
>> To unsubscribe from this list: send the line "unsubscribe linux-gpio" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>
> 
> Best regards,
> -grygorii--
> To unsubscribe from this list: send the line "unsubscribe linux-gpio" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

