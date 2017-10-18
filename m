From: Phil Reid <preid@electromag.com.au>
Subject: Re: pinctrl-mcp23s08: 1 changed pin -> multiple interrupts
Date: Wed, 18 Oct 2017 17:46:10 +0800
Message-ID: <caf1c6ce-9361-86b8-0f96-863bfeb853c9@electromag.com.au>
References: <CALieaeeBpmbr6f_zP7yUniSKODaWasybPoAGVKjWyTJ9+Vg3nA@mail.gmail.com>
 <CALieaeeCnKukPH+K9CiS-tr3XZ1bxj0R0+mXvsG+LHFJ=pLi3Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from anchovy3.45ru.net.au ([203.30.46.155]:47296 "EHLO
        anchovy.45ru.net.au" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1754877AbdJRJqQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 18 Oct 2017 05:46:16 -0400
In-Reply-To: <CALieaeeCnKukPH+K9CiS-tr3XZ1bxj0R0+mXvsG+LHFJ=pLi3Q@mail.gmail.com>
Content-Language: en-AU
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Dmitry Mastykin <mastichi@gmail.com>, linux-gpio@vger.kernel.org, Sebastian Reichel <sebastian.reichel@collabora.co.uk>

G'day Dimitry
On 17/10/2017 16:12, Dmitry Mastykin wrote:
> I'm sorry for very bad previous report, problem was more simple,
> cached_gpio was wrongly distorted in mcp23s08_get().
> Dmitry

Thanks for this, saved me some time for the same issue.

I can confirm this regression which happened with the switch to regmap caching by the looks.
Prior to patch gpio keys would not work for either.

+cc Sebastian.

You'll need to resubmit the patch with the following

Needs [PATCH v2] in the subject. Make it v3 now.
Needs signed off.
Add fixes commit 8f38910ba4f6 ("pinctrl: mcp23s08: switch to regmap caching")

feel free to a add my:
Tested-by: Phil Reid <preid@electromag.com.au>




> 
> diff --git a/drivers/pinctrl/pinctrl-mcp23s08.c
> b/drivers/pinctrl/pinctrl-mcp23s08.c
> index 3e40d42..9c950bbf 100644
> --- a/drivers/pinctrl/pinctrl-mcp23s08.c
> +++ b/drivers/pinctrl/pinctrl-mcp23s08.c
> @@ -407,10 +407,10 @@ static int mcp23s08_get(struct gpio_chip *chip,
> unsigned offset)
>    ret = mcp_read(mcp, MCP_GPIO, &status);
>    if (ret < 0)
>    status = 0;
> - else
> + else {
> + mcp->cached_gpio = status;
>    status = !!(status & (1 << offset));
> -
> - mcp->cached_gpio = status;
> + }
> 
>    mutex_unlock(&mcp->lock);
>    return status;
> 
> 2017-10-16 18:19 GMT+03:00 Dmitry Mastykin <mastichi@gmail.com>:
>> Hello,
>> I had problems with pinctrl-mcp23s08 driver.
>> I use it with MCP23008 chip. Half of the chip is used by gpio-keys,
>> other half is eventually used via sysfs.
>> Pushing a key caused interrupts for all the 4 keys. In result - no
>> keyboard codes generated.
>> I found that problem was in mcp23s08_get() that being called by isr
>> for each changed pin clobbers the cached_gpio.
>> With following patch driver works for me.
>>
>> Regards,
>> Dmitry
>>
>>
>> diff --git a/drivers/pinctrl/pinctrl-mcp23s08.c
>> b/drivers/pinctrl/pinctrl-mcp23s08.c
>> index 3e40d42..27ce202 100644
>> --- a/drivers/pinctrl/pinctrl-mcp23s08.c
>> +++ b/drivers/pinctrl/pinctrl-mcp23s08.c
>> @@ -63,6 +63,7 @@ struct mcp23s08 {
>>    int irq;
>>    bool irq_controller;
>>    int cached_gpio;
>> + int cached_gpinten;
>>    /* lock protects regmap access with bypass/cache flags */
>>    struct mutex lock;
>>
>> @@ -401,6 +402,9 @@ static int mcp23s08_get(struct gpio_chip *chip,
>> unsigned offset)
>>    struct mcp23s08 *mcp = gpiochip_get_data(chip);
>>    int status, ret;
>>
>> + if (mcp->cached_gpinten & (1 << offset))
>> + return !!(mcp->cached_gpio & (1 << offset));
>> +
>>    mutex_lock(&mcp->lock);
>>
>>    /* REVISIT reading this clears any IRQ ... */
>> @@ -486,15 +490,15 @@ static irqreturn_t mcp23s08_irq(int irq, void *data)
>>    mcp->cached_gpio = gpio;
>>    mutex_unlock(&mcp->lock);
>>
>> + dev_dbg(mcp->chip.parent,
>> + "intcap 0x%04X intf 0x%04X gpio_orig 0x%04X gpio 0x%04X\n",
>> + intcap, intf, gpio_orig, gpio);
>> +
>>    if (intf == 0) {
>>    /* There is no interrupt pending */
>>    return IRQ_HANDLED;
>>    }
>>
>> - dev_dbg(mcp->chip.parent,
>> - "intcap 0x%04X intf 0x%04X gpio_orig 0x%04X gpio 0x%04X\n",
>> - intcap, intf, gpio_orig, gpio);
>> -
>>    for (i = 0; i < mcp->chip.ngpio; i++) {
>>    /* We must check all of the inputs on the chip,
>>    * otherwise we may not notice a change on >=2 pins.
>> @@ -514,6 +518,9 @@ static irqreturn_t mcp23s08_irq(int irq, void *data)
>>    * to see if the input has changed.
>>    */
>>
>> + if (!(mcp->cached_gpinten & BIT(i)))
>> + continue;
>> +
>>    intf_set = intf & BIT(i);
>>    if (i < 8 && intf_set)
>>    intcap_mask = 0x00FF;
>> @@ -552,6 +559,7 @@ static void mcp23s08_irq_mask(struct irq_data *data)
>>    unsigned int pos = data->hwirq;
>>
>>    mcp_set_bit(mcp, MCP_GPINTEN, pos, false);
>> + mcp->cached_gpinten &= ~BIT(pos);
>>   }
>>
>>   static void mcp23s08_irq_unmask(struct irq_data *data)
>> @@ -561,6 +569,7 @@ static void mcp23s08_irq_unmask(struct irq_data *data)
>>    unsigned int pos = data->hwirq;
>>
>>    mcp_set_bit(mcp, MCP_GPINTEN, pos, true);
>> + mcp->cached_gpinten |= BIT(pos);
>>   }
>>
>>   static int mcp23s08_irq_set_type(struct irq_data *data, unsigned int type)
>> @@ -891,6 +900,8 @@ static int mcp23s08_probe_one(struct mcp23s08
>> *mcp, struct device *dev,
>>    goto fail;
>>    }
>>
>> + mcp_read(mcp, MCP_GPIO, &mcp->cached_gpio);  // initial value
>> +
>>    ret = devm_gpiochip_add_data(dev, &mcp->chip, mcp);
>>    if (ret < 0)
>>    goto fail;
> --



-- 
Regards
Phil Reid

ElectroMagnetic Imaging Technology Pty Ltd
Development of Geophysical Instrumentation & Software
www.electromag.com.au

3 The Avenue, Midland WA 6056, AUSTRALIA
Ph: +61 8 9250 8100
Fax: +61 8 9250 7100
Email: preid@electromag.com.au
