From: "J, KEERTHY" <j-keerthy@ti.com>
Subject: Re: [PATCH v3 2/2] gpio: davinci: Do not assume continuous IRQ
 numbering
Date: Wed, 13 Jun 2018 06:36:36 +0530
Message-ID: <af41c620-6c3c-a348-80c1-89918d0db898@ti.com>
References: <1528790356-15945-1-git-send-email-j-keerthy@ti.com>
 <1528790356-15945-2-git-send-email-j-keerthy@ti.com>
 <4ef40eb2-774e-925c-f4f1-5ed431ec1268@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <4ef40eb2-774e-925c-f4f1-5ed431ec1268@ti.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Grygorii Strashko <grygorii.strashko@ti.com>, linus.walleij@linaro.org
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, t-kristo@ti.com
List-Id: linux-gpio@vger.kernel.org



On 6/13/2018 1:36 AM, Grygorii Strashko wrote:
> 
> 
> On 06/12/2018 02:59 AM, Keerthy wrote:
>> Currently the driver assumes that the interrupts are continuous
>> and does platform_get_irq only once and assumes the rest are continuous,
>> instead call platform_get_irq for all the interrupts and store them
>> in an array for later use.
>>
>> Signed-off-by: Keerthy <j-keerthy@ti.com>
>> ---
>>
>> Tested for GPIO Interrupts on da850-lcdk board.
>>
>> Changes in v3:
>>
>>     * Changed irqs type from unsigned to int
>>
>> Changes in v2:
>>
>>     * Extended the logic of using saved IRQs to unbanked IRQs
>>       as per Grygorii's suggestion.
>>
>>    drivers/gpio/gpio-davinci.c                | 54 +++++++++++++++++++-----------
>>    include/linux/platform_data/gpio-davinci.h |  3 +-
>>    2 files changed, 36 insertions(+), 21 deletions(-)
>>
> 
> [...]
> 
>>    
>> @@ -383,7 +396,7 @@ static int gpio_to_irq_unbanked(struct gpio_chip *chip, unsigned offset)
>>    	 * can provide direct-mapped IRQs to AINTC (up to 32 GPIOs).
>>    	 */
>>    	if (offset < d->gpio_unbanked)
>> -		return d->base_irq + offset;
>> +		return d->irqs[offset];
> 
> this one seems right
> 
>>    	else
>>    		return -ENODEV;
>>    }
>> @@ -396,7 +409,7 @@ static int gpio_irq_type_unbanked(struct irq_data *data, unsigned trigger)
>>    
>>    	d = (struct davinci_gpio_controller *)irq_data_get_irq_handler_data(data);
>>    	g = (struct davinci_gpio_regs __iomem *)d->regs[0];
>> -	mask = __gpio_mask(data->irq - d->base_irq);
>> +	mask = __gpio_mask(data->irq - d->irqs[0]);
> 
> but this one is not. You can't do "base + offset" or "irq - base" ops
> if Irqs range is not sequential. So, in my opinion, here you need to
> convert irq to gpio bank offset (hwirq value in irq_data is not offset
> - gic specific value) which means - walk through d->irqs[x] and find
> item with d->irqs[x] == irq which will give gpio bank offset.
> Than offset can be used to build mask.

Agreed.

> 
>>    
>>    	if (trigger & ~(IRQ_TYPE_EDGE_FALLING | IRQ_TYPE_EDGE_RISING))
>>    		return -EINVAL;
>> @@ -458,7 +471,7 @@ static struct irq_chip *keystone_gpio_get_irq_chip(unsigned int irq)
>>     * (dm6446) can be set appropriately for GPIOV33 pins.
>>     */
>>    
>> -static int davinci_gpio_irq_setup(struct platform_device *pdev, int bank_irq)
> 
> 
> [...]
> 
>>    #include <asm-generic/gpio.h>
>>    
>>    #define MAX_REGS_BANKS		5
>> +#define MAX_INT_PER_BANK 32
>>    
>>    struct davinci_gpio_platform_data {
>>    	u32	ngpio;
>> @@ -41,7 +42,7 @@ struct davinci_gpio_controller {
>>    	spinlock_t		lock;
>>    	void __iomem		*regs[MAX_REGS_BANKS];
>>    	int			gpio_unbanked;
>> -	unsigned int		base_irq;
>> +	int			irqs[MAX_INT_PER_BANK];
>>    	unsigned int		base;
>>    };
>>    
>>
> 
