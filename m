From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio-dwapb: reset mask register on probe
Date: Tue, 17 Mar 2015 17:54:57 +0100
Message-ID: <CACRpkdYMtAzWyshP0_x-qucz2j=1JE_=DE3Y7TARWGxDQxnurA@mail.gmail.com>
References: <1425372461-17859-1-git-send-email-abrodkin@synopsys.com>
	<CACRpkdaknfTMb=1LVqNLTtV8Te+mjRdSZ=grk4NUGxKBt6gpCg@mail.gmail.com>
	<1425934566.2312.16.camel@synopsys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f54.google.com ([209.85.218.54]:35940 "EHLO
	mail-oi0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932553AbbCQQy6 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 17 Mar 2015 12:54:58 -0400
Received: by oigv203 with SMTP id v203so13712423oig.3
        for <linux-gpio@vger.kernel.org>; Tue, 17 Mar 2015 09:54:57 -0700 (PDT)
In-Reply-To: <1425934566.2312.16.camel@synopsys.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Vineet.Gupta1@synopsys.com" <Vineet.Gupta1@synopsys.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "gnurou@gmail.com" <gnurou@gmail.com>

On Mon, Mar 9, 2015 at 9:56 PM, Alexey Brodkin
<Alexey.Brodkin@synopsys.com> wrote:
> On Mon, 2015-03-09 at 14:59 +0100, Linus Walleij wrote:
>> On Tue, Mar 3, 2015 at 9:47 AM, Alexey Brodkin
>> <Alexey.Brodkin@synopsys.com> wrote:

> Interestingly what I observed in my testing that if both
> enable()/disable() and mask()/unmask() are implemented in driver then
> only enable()/disable() pair will be actually used.
>
> Look at how generic irq_enable() function is implemented -
> http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/kernel/irq/chip.c#n208
>
>  --->8---
>  void irq_enable(struct irq_desc *desc)
>  {
>         irq_state_clr_disabled(desc);
>         if (desc->irq_data.chip->irq_enable)
>                 desc->irq_data.chip->irq_enable(&desc->irq_data);
>         else
>                 desc->irq_data.chip->irq_unmask(&desc->irq_data);
>         irq_state_clr_masked(desc);
>  }
>  --->8---
>
>> The real problem I think is that struct irq_chip contains
>> mask()/unmask() callbacks that are not implemented
>> by this driver.
>
> I'd say that mask()/unmask() callbacks are implemented in this driver
> already.
>
> See
> http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/drivers/gpio/gpio-dwapb.c#n334
>  --->8---
>                 ct->chip.irq_mask = irq_gc_mask_set_bit;
>                 ct->chip.irq_unmask = irq_gc_mask_clr_bit;
>                 ct->chip.irq_set_type = dwapb_irq_set_type;
>                 ct->chip.irq_enable = dwapb_irq_enable;
>                 ct->chip.irq_disable = dwapb_irq_disable;
>  --->8---
>
> It actually uses generic implementation of mask set bit and clear bit:
> irq_gc_mask_set_bit()/irq_gc_mask_clr_bit() that operate under
> GPIO_INTMASK register. And I may confirm that these functions correctly
> set/reset bits in mask register of GPIO controller.

Grrr how typical, I got it all wrong and I'm doing stupid things :(

So you mean these generic mask/unmask callbacks sets the bits
correctly and then there is no problem.

>> +static void dwapb_irq_mask(struct irq_data *d)
>> +static void dwapb_irq_unmask(struct irq_data *d)
>
> Why would we need these custom functions if there're already
> irq_gc_mask_set_bit()/irq_gc_mask_clr_bit() implemented in
> kernel/irq/generic-chip.c

You're right...

>>  static void dwapb_irq_enable(struct irq_data *d)
>>  {
>>      struct irq_chip_generic *igc = irq_data_get_irq_chip_data(d);
>> @@ -302,6 +326,10 @@ static void dwapb_configure_irqs(struct dwapb_gpio *gpio,
>>      struct irq_chip_type *ct;
>>      int err, i;
>>
>> +    /* Mask out and disable all interrupts */
>> +    dwapb_write(gpio, GPIO_INTMASK, 0xffffffff);
>> +    dwapb_write(gpio, GPIO_INTEN, 0);
>
> This looks good to me - it's always a good idea to make sure defaults
> are set as we expect.

So should I cook a patch doing just these two lines?

But the initial patch unmasking all IRQs then? Is that even needed?

>>      gpio->domain = irq_domain_add_linear(node, ngpio,
>>                           &irq_generic_chip_ops, gpio);
>>      if (!gpio->domain)
>> @@ -334,6 +362,8 @@ static void dwapb_configure_irqs(struct dwapb_gpio *gpio,
>>          ct->chip.irq_mask = irq_gc_mask_set_bit;
>>          ct->chip.irq_unmask = irq_gc_mask_clr_bit;
>>          ct->chip.irq_set_type = dwapb_irq_set_type;
>> +        ct->chip.irq_mask = dwapb_irq_mask;
>> +        ct->chip.irq_unmask = dwapb_irq_unmask;
>
> Looks like we set "ct->chip.irq_mask" and "ct->chip.irq_unmask" twice,
> don't we?

Yep, my bad.

Yours,
Linus Walleij
