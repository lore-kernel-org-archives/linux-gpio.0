From: Keerthy <j-keerthy@ti.com>
Subject: Re: [PATCH 2/3] gpio: davinci: Redesign driver to accommodate ngpios
 in one gpio chip
Date: Fri, 13 Jan 2017 09:12:57 +0530
Message-ID: <ddba9b96-c740-1976-a4ab-fac02c51d0b0@ti.com>
References: <1484110841-2391-1-git-send-email-j-keerthy@ti.com>
 <1484110841-2391-3-git-send-email-j-keerthy@ti.com>
 <e2b903a2-24e2-43ef-ef08-d50c0748d046@ti.com>
 <3a017847-abad-f215-30d9-764a0cb07041@ti.com>
 <fd6a1bc4-bcb1-a2ed-4058-35514d114211@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from lelnx193.ext.ti.com ([198.47.27.77]:24733 "EHLO
        lelnx193.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750960AbdAMDnC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 12 Jan 2017 22:43:02 -0500
In-Reply-To: <fd6a1bc4-bcb1-a2ed-4058-35514d114211@ti.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Grygorii Strashko <grygorii.strashko@ti.com>, linus.walleij@linaro.org, t-kristo@ti.com
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, gnurou@gmail.com



On Friday 13 January 2017 12:36 AM, Grygorii Strashko wrote:
>
>
> On 01/11/2017 08:00 PM, Keerthy wrote:
>>
>>
>> On Wednesday 11 January 2017 11:23 PM, Grygorii Strashko wrote:
>>>
>>>
>>> On 01/10/2017 11:00 PM, Keerthy wrote:
>>>> The Davinci GPIO driver is implemented to work with one monolithic
>>>> Davinci GPIO platform device which may have up to Y(144) gpios.
>>>> The Davinci GPIO driver instantiates number of GPIO chips with
>>>> max 32 gpio pins per each during initialization and one IRQ domain.
>>>> So, the current GPIO's  opjects structure is:
>>>>
>>>> <platform device> Davinci GPIO controller
>>>>  |- <gpio0_chip0> ------|
>>>>  ...                    |--- irq_domain (hwirq [0..143])
>>>>  |- <gpio0_chipN> ------|
>>>>
>>>> Current driver creates one chip for every 32 GPIOs in a controller.
>>>> This was a limitation earlier now there is no need for that. Hence
>>>> redesigning the driver to create one gpio chip for all the ngpio
>>>> in the controller.
>>>>
>>>> |- <gpio0_chip0> ------|--- irq_domain (hwirq [0..143]).
>>>>
>>>> The previous discussion on this can be found here:
>>>> https://www.spinics.net/lists/linux-omap/msg132869.html
>>>
>>> nice rework.
>>
>> Thanks!
>>
>>>
>>>>
>>>> Signed-off-by: Keerthy <j-keerthy@ti.com>
>>>> ---
>>>>
>>>> Boot tested on Davinci platform.
>>>>
>>>>  drivers/gpio/gpio-davinci.c                | 127
>>>> +++++++++++++++++------------
>
> [...]
>
>>>>
>>>>  #ifdef CONFIG_OF_GPIO
>>>> -        chips[i].chip.of_gpio_n_cells = 2;
>>>> -        chips[i].chip.of_xlate = davinci_gpio_of_xlate;
>>>> -        chips[i].chip.parent = dev;
>>>> -        chips[i].chip.of_node = dev->of_node;
>>>> +    chips->chip.of_gpio_n_cells = 2;
>>>> +    chips->chip.of_xlate = davinci_gpio_of_xlate;
>>>
>>> I think It's not necessary to have custom .xlate() and
>>> it can be removed, then gpiolib will assign default one
>>> of_gpio_simple_xlate().
>>
>> Okay. Can i do that as a separate patch?
>
> I think it's ok.
>
>>
>>>
>>>> +    chips->chip.parent = dev;
>>>> +    chips->chip.of_node = dev->of_node;
>>>>  #endif
>>>> -        spin_lock_init(&chips[i].lock);
>>>> -
>
> [...]
>
>>>>
>>>>      irq_set_chip_and_handler_name(irq, &gpio_irqchip,
>>>> handle_simple_irq,
>>>>                  "davinci_gpio");
>>>> @@ -459,6 +468,7 @@ static int davinci_gpio_irq_setup(struct
>>>> platform_device *pdev)
>>>>      struct irq_domain    *irq_domain = NULL;
>>>>      const struct of_device_id *match;
>>>>      struct irq_chip *irq_chip;
>>>> +    struct davinci_gpio_irq_data *irqdata[MAX_BANKED_IRQS];
>>>
>>> You declare irqdata as array here but it has not been used anywhere
>>> except for assignment. Could you remove this array and MAX_BANKED_IRQS
>>> define?
>>
>> irq_set_chained_handler_and_data(bank_irq, gpio_irq_handler,
>>                          &chips[gpio / 32]);
>>                          irqdata[bank]);
>>
>> That is hooked as data for each bank. As there is only one controller
>> now and the differentiating parameters per bank is the irqdata data
>> structure with the registers pointer and the bank number.
>> This structure makes it very easy in the irq handler to identify the
>> register sets that need to be modified and the bank irqs.
>
> That I understood, but why do you need array here?
>
>>
>>>
>>> Seems you can just use struct davinci_gpio_irq_data *irqdata;
>
> why can't you use (see below):
>     struct davinci_gpio_irq_data *irqdata;

Understood your comment now thanks for clarifying. I will do like you 
have suggested.

>>>
>>>>      gpio_get_irq_chip_cb_t gpio_get_irq_chip;
>>>>
>>>>      /*
>>>> @@ -514,10 +524,8 @@ static int davinci_gpio_irq_setup(struct
>>>> platform_device *pdev)
>>>>       * IRQs, while the others use banked IRQs, would need some setup
>>>>       * tweaks to recognize hardware which can do that.
>>>>       */
>
> [...]
>
>>>>
>>>> @@ -567,8 +575,19 @@ static int davinci_gpio_irq_setup(struct
>>>> platform_device *pdev)
>>>>           * gpio irqs. Pass the irq bank's corresponding controller to
>>>>           * the chained irq handler.
>>>>           */
>>>> +        irqdata[bank] = devm_kzalloc(&pdev->dev,
>>>> +                         sizeof(struct
>>>> +                            davinci_gpio_irq_data),
>>>> +                         GFP_KERNEL);
>
> irqdata = devm_kzalloc(&pdev->dev,
>                         sizeof(struct
>                             davinci_gpio_irq_data),
>                          GFP_KERNEL);
>

Okay.

>>>> +        if (!irqdata[bank])
>>>> +            return -ENOMEM;
>>>> +
>>>> +        irqdata[bank]->regs = g;
>>>> +        irqdata[bank]->bank_num = bank;
>>>> +        irqdata[bank]->chip = chips;
>>>> +
>>>>          irq_set_chained_handler_and_data(bank_irq, gpio_irq_handler,
>>>> -                         &chips[gpio / 32]);
>>>> +                         irqdata[bank]);
>
>          irq_set_chained_handler_and_data(bank_irq, gpio_irq_handler,
>                          irqdata);
>

I will post the new set with the above changes.

>
> [...]
>
