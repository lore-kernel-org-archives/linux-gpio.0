From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: [PATCH] gpio: thunderx: remove unused .map() hook from irq_domain_ops
Date: Fri, 15 Sep 2017 10:48:44 +0900
Message-ID: <CAK7LNAQMPv3ovFYjPEiVMpzfX-sxpd_DyqtFwaXUO4pbyVzx6Q@mail.gmail.com>
References: <1505356645-19765-1-git-send-email-yamada.masahiro@socionext.com> <fe9c91d8-33a4-2ecf-8665-3031aa33547f@caviumnetworks.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from conssluserg-01.nifty.com ([210.131.2.80]:54838 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751687AbdIOBta (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 14 Sep 2017 21:49:30 -0400
In-Reply-To: <fe9c91d8-33a4-2ecf-8665-3031aa33547f@caviumnetworks.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: David Daney <ddaney@caviumnetworks.com>
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, David Daney <david.daney@cavium.com>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi David,

2017-09-15 1:59 GMT+09:00 David Daney <ddaney@caviumnetworks.com>:
> On 09/13/2017 07:37 PM, Masahiro Yamada wrote:
>>
>> This driver implements .alloc() hook, so .map() is not used.
>>
>
> Have you tested this?


No.  I do not have access to this hardware.

It is just, in my understanding,
.alloc() and .map() are exclusive.



> I will have to test this on a real system next week before I can really
> comment on it.
>
> David.
>
>
>
>
>> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
>> ---
>>
>>   drivers/gpio/gpio-thunderx.c | 13 -------------
>>   1 file changed, 13 deletions(-)
>>
>> diff --git a/drivers/gpio/gpio-thunderx.c b/drivers/gpio/gpio-thunderx.c
>> index 57efb25..b5adb79 100644
>> --- a/drivers/gpio/gpio-thunderx.c
>> +++ b/drivers/gpio/gpio-thunderx.c
>> @@ -417,18 +417,6 @@ static struct irq_chip thunderx_gpio_irq_chip = {
>>         .flags                  = IRQCHIP_SET_TYPE_MASKED
>>   };
>>   -static int thunderx_gpio_irq_map(struct irq_domain *d, unsigned int
>> irq,
>> -                                irq_hw_number_t hwirq)
>> -{
>> -       struct thunderx_gpio *txgpio = d->host_data;
>> -
>> -       if (hwirq >= txgpio->chip.ngpio)
>> -               return -EINVAL;
>> -       if (!thunderx_gpio_is_gpio_nowarn(txgpio, hwirq))
>> -               return -EPERM;
>> -       return 0;
>> -}
>> -
>>   static int thunderx_gpio_irq_translate(struct irq_domain *d,
>>                                        struct irq_fwspec *fwspec,
>>                                        irq_hw_number_t *hwirq,
>> @@ -455,7 +443,6 @@ static int thunderx_gpio_irq_alloc(struct irq_domain
>> *d, unsigned int virq,
>>   }
>>     static const struct irq_domain_ops thunderx_gpio_irqd_ops = {
>> -       .map            = thunderx_gpio_irq_map,
>>         .alloc          = thunderx_gpio_irq_alloc,
>>         .translate      = thunderx_gpio_irq_translate
>>   };
>>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-gpio" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



-- 
Best Regards
Masahiro Yamada
