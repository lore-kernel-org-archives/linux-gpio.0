From: Keerthy <a0393675@ti.com>
Subject: Re: [PATCH 1/2] gpio: davinci: Add the missing of-node pointer in the
 irq_domain_add_legacy function call
Date: Mon, 8 Feb 2016 15:18:12 +0530
Message-ID: <56B8645C.1050800@ti.com>
References: <1453988331-17111-1-git-send-email-j-keerthy@ti.com>
 <1453988331-17111-2-git-send-email-j-keerthy@ti.com>
 <56AA232D.3040509@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <56AA232D.3040509@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Grygorii Strashko <grygorii.strashko@ti.com>, Keerthy <j-keerthy@ti.com>, linus.walleij@linaro.org, Alexandre Courbot <gnurou@gmail.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, lokeshvutla@ti.com, Santosh Shilimkar <ssantosh@kernel.org>, Sekhar Nori <nsekhar@ti.com>
List-Id: linux-gpio@vger.kernel.org



On Thursday 28 January 2016 07:48 PM, Grygorii Strashko wrote:
> On 01/28/2016 03:38 PM, Keerthy wrote:
>> Currently the first parameter of irq_domain_add_legacy is NULL.
>> irq_find_host function returns NULL when we do not populate the of_node
>> and hence irq_of_parse_and_map call fails whenever we want to request a
>> gpio irq. This fixes the request_irq failures for gpio interrupts.
>>
>> Signed-off-by: Keerthy <j-keerthy@ti.com>
>
> Reviewed-by: Grygorii Strashko <grygorii.strashko@ti.com>

A gentle ping on this patch. Thanks Grygorii for the review.

>
>> ---
>>   drivers/gpio/gpio-davinci.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpio/gpio-davinci.c b/drivers/gpio/gpio-davinci.c
>> index ec58f42..c889f31 100644
>> --- a/drivers/gpio/gpio-davinci.c
>> +++ b/drivers/gpio/gpio-davinci.c
>> @@ -511,7 +511,7 @@ static int davinci_gpio_irq_setup(struct
>> platform_device *pdev)
>>               return irq;
>>           }
>>
>> -        irq_domain = irq_domain_add_legacy(NULL, ngpio, irq, 0,
>> +        irq_domain = irq_domain_add_legacy(dev->of_node, ngpio, irq, 0,
>>                               &davinci_gpio_irq_ops,
>>                               chips);
>>           if (!irq_domain) {
>>
>
>
