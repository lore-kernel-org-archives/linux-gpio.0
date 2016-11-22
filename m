From: "Shah, Nehal-bakulchandra" <Nehal-Bakulchandra.shah@amd.com>
Subject: Re: [PATCH] pinctrl: amd: Add support for additional GPIO
Date: Tue, 22 Nov 2016 15:49:02 +0530
Message-ID: <469f529e-818b-392f-9ddb-b02e87e50ca9@amd.com>
References: <MWHPR12MB1357C965EBE3F1161823C223A0B90@MWHPR12MB1357.namprd12.prod.outlook.com>
 <CACRpkdbab3iEwLOucpAz38AJZaEgpO6mrZrLev+YSYuO7Ox_JA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-bl2nam02on0070.outbound.protection.outlook.com ([104.47.38.70]:36160
        "EHLO NAM02-BL2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S932329AbcKVMvs (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 22 Nov 2016 07:51:48 -0500
In-Reply-To: <CACRpkdbab3iEwLOucpAz38AJZaEgpO6mrZrLev+YSYuO7Ox_JA@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Cc: "gnurou@gmail.com" <gnurou@gmail.com>, "S-k, Shyam-sundar" <Shyam-sundar.S-k@amd.com>



On 11/14/2016 6:48 PM, Linus Walleij wrote:
> On Wed, Nov 9, 2016 at 11:28 AM, Shah, Nehal-bakulchandra
> <Nehal-bakulchandra.Shah@amd.com> wrote:
> 
>> This Provide IRQ sharing for AMD's GPIO devices.And set IRQCHIP_SKIP_SET_WAKE flag.
>>
>> Also, fix the build issue for devm_request_irq()
>>
>> Reviewed-by: S-k, Shyam-sundar <Shyam-sundar.S-k@amd.com>
>> Signed-off-by: Nehal Shah <Nehal-bakulchandra.Shah@amd.com>
> 
> This is not looking correct at all.
> 
>> @@ -529,16 +531,13 @@ static void amd_gpio_irq_handler(struct irq_desc *desc)
>>                 }
>>         }
>>
>> -       if (handled == 0)
>> -               handle_bad_irq(desc);
>> -
>>         spin_lock_irqsave(&gpio_dev->lock, flags);
>>         reg = readl(gpio_dev->base + WAKE_INT_MASTER_REG);
>>         reg |= EOI_MASK;
>>         writel(reg, gpio_dev->base + WAKE_INT_MASTER_REG);
>>         spin_unlock_irqrestore(&gpio_dev->lock, flags);
>>
>> -       chained_irq_exit(chip, desc);
>> +       return 0;
> 
> You are removing the chained interrupt handling for no good reason.
> The commit message does not say why this is being done.
> 
> It's especially erroneous to remove chained_irq_exit() but not
> chained_irq_enter(), but generally, NONE of them should be
> removed this *is* a chained interrupt handler.
> 
>>         gpiochip_set_chained_irqchip(&gpio_dev->gc,
>>                                  &amd_gpio_irqchip,
>>                                  irq_base,
>> -                                amd_gpio_irq_handler);
>> +                                NULL);
>> +
>> +       ret = devm_request_irq(&pdev->dev, irq_base, amd_gpio_irq_handler,
>> +                              IRQF_SHARED, dev_name(&pdev->dev), gpio_dev);
>> +       if (ret)
>> +               goto out2;
> 
> This is just wrong. The gpiochip_set_chained_irqchip() should not
> be called in combination with devm_request_irq() like this.
> 
> devm_request_irq() should not be used at all. Keep the chained
> handler.
> 
> I'm worried that this patch has a "trial-and-error" quality, it seems
> you don't really know what is going on.
> 
> Please investigate and send the patch with a commitlog that describes
> exactly why you are doing what you are doing.
> 
> Yours,
> Linus Walleij
> 
Hi Linus,
 
I understood that chained irq and devm_irq can't be used together. Surely, 
I will rework on the patch. The reason behind using devm_irq is that in our 
upcoming platform bios may report two gpio controllers. Both will have same IRQs. 
In my understanding if I use chained irq handler, it will not be clear interrupt 
is due to which gpio controller.It may lead to serve irq twice. 
Looking at this constrain we changed the logic to devm irq.

Please let me know if anything is incorrect in my understanding or if there is 
a better way to handle this situation.
 
Your valuable inputs will help us a lot.
 
Thanks and Regards
Nehal
