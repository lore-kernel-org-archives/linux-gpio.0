From: "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Subject: Re: [PATCH 1/2] x86: gpio: AMD G-Series pch gpio platform driver
Date: Fri, 8 Feb 2019 14:50:24 +0100
Message-ID: <77668138-71eb-4e4b-ecbc-6fe838e1503a@metux.net>
References: <1549559639-9447-1-git-send-email-info@metux.net>
 <CAHp75Vdn-3aBOMo1yzGVS-rWOdgiYasK++yfvzi3iSyOL4Mtqg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAHp75Vdn-3aBOMo1yzGVS-rWOdgiYasK++yfvzi3iSyOL4Mtqg@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>, "Enrico Weigelt, metux IT consult" <info@metux.net>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Linus Walleij <linus.walleij@linaro.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Andy Shevchenko <andy@infradead.org>, Darren Hart <dvhart@infradead.org>
List-Id: linux-gpio@vger.kernel.org

On 07.02.19 19:06, Andy Shevchenko wrote:

Hi,

> Overall I have a feeling that this driver can be replaced with> existing generic one where one register per pin is allocated.>
Unfortunately, I didn't look deep into this and hope Linus will help> to
figure this out.
this also was my first thought, but i recall the generic one copes w/
devices that have per-flag- instead of per channel-registers
(IOW: all direction flags in one register, all level flags in another).
correct me if I'm wrong ..

I actually considered writing a generic per-register driver, where one
just configures which bit does what. But it didn't feel worth the extra
effort yet. OTOH, if we would have lots of consumers, the situation
would be different.

>> @@ -0,0 +1,171 @@
>> +/*
>> + * GPIO driver for the AMD G series FCH (eg. GX-412TC)
>> + *
>> + * Copyright (C) 2018 metux IT consult
>> + * Author: Enrico Weigelt <info@metux.net>
>> + *
> 
>> + * SPDX-License-Identifier: GPL+
> 
> SPDX should go as a separate first line in a proper format.

Fixed.
Maybe I should write an automatic check for that ;-)

By the way: are there already some tools that actually operate on that ?

>> +#define GPIO_BIT_DIR           23
>> +#define GPIO_BIT_WRITE         22
>> +#define GPIO_BIT_READ          16
> 
> Oh, namespace issues.
> What about using BIT() macro?

Ah, thanks, forgot that.

By the way: would it be a good idea to define a struct w/ bitfields
for the registers, instead of directly doing bitmask operations ?


>> +static uint32_t *amd_fch_gpio_addr(struct gpio_chip *gc, unsigned gpio)
>> +{
>> +       struct amd_fch_gpio_priv *priv = gpiochip_get_data(gc);
>> +
> 
>> +       if (gpio > priv->pdata->gpio_num) {
>> +               dev_err(&priv->pdev->dev, "gpio number %d out of range\n", gpio);
>> +               return NULL;
>> +       }
> 
> On which circumstances it may happen?

hopefully never, but I'm a bit paranoid ;-)
Shall I kick out that check ?

>> +       return priv->base + priv->pdata->gpio_reg[gpio].reg*sizeof(u32);
>> +}
>> +
>> +static int amd_fch_gpio_direction_input(struct gpio_chip *gc, unsigned offset)
>> +{
> 
>> +       volatile uint32_t *ptr = amd_fch_gpio_addr(gc, offset);
> 
> volatile?!
> 
> I think you need to use readl()/writel() (or their _relaxed variants) instead.

I assumed the compiler would already emit the correct code (and not try
any optimizations) if the field is declared volatile. But I'll change it
to readl()/writel().

By the way: do we already have helpers for doing such bit operations on
mmapped registers ? (eg. similar to those in bitops.h)

> Same applies for entire code.
> 
>> +       if (!ptr) return -EINVAL;
> 
> This code has style issues.
> Check your entire file.

Should it be written in two lines - like that ?

    if (!ptr)
        return -EINVAL;

>> +static int amd_fch_gpio_request(struct gpio_chip *chip, unsigned gpio_pin)
>> +{
> 
>> +       if (gpio_pin < chip->ngpio)
>> +               return 0;
> 
> Is it even possible?

Not sure. AFAIK, this function should check whether the requested pin is
available. Feels safer to me having this check.

>> +static int amd_fch_gpio_probe(struct platform_device *pdev)
>> +{
>> +       struct amd_fch_gpio_priv *priv;
> 
>> +       struct amd_fch_gpio_pdata *pdata = pdev->dev.platform_data;
> 
> We have a helper to get this. platform_get_data() IIRC.

found dev_get_platdata(const struct device *dev).

but nothing for working on struct platform_device directly - should we
introduce one ?

>> +       if (IS_ERR(priv->base = devm_ioremap_resource(&pdev->dev, &priv->pdata->res))) {
> 
>> +               dev_err(&pdev->dev, "failed to map iomem\n");
> 
> Noise (that function will print a message)
> 
>> +               return -ENXIO;
> 
> Shadowed error code.

Which one shall I use instead ?

>> +MODULE_LICENSE("GPL");
> 
> License mismatch. I really don't look what 'GPL+' means. OTOH I know
> this one corresponds to GPL-2.0+.

Typo, should have been GPL-2.0+.

>> + * struct amd_fch_gpio_reg - GPIO register definition
>> + * @reg: register index
>> + * @name: signal name
>> + */
>> +struct amd_fch_gpio_reg {
>> +    int         reg;
>> +    const char* name;
>> +};
> 
> Isn't this provided by GPIO library? We have so called labels.

hmm, haven't found a proper struct yet.

struct gpio indeed has a label and two int fields. but it doesn't seem
to be designed for holding register addresses ... using this one here
feels quite abusive. (and a waste of memory, too).

for consistency, I could rename 'name' to 'label', if you wish.


thanks for your review.


--mtx

-- 
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info@metux.net -- +49-151-27565287
