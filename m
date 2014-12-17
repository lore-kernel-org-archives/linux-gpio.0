From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [PATCH v1 1/5] gpio: moxart: convert to use basic mmio gpio library
Date: Wed, 17 Dec 2014 11:33:11 +0900
Message-ID: <CAAVeFuKB=BE6aVaNDrsMfVp35Q4SBzGjSfEisd3PJhgdDDsWkQ@mail.gmail.com>
References: <1417435778-21879-1-git-send-email-kamlakant.patel@linaro.org>
 <1417435778-21879-2-git-send-email-kamlakant.patel@linaro.org>
 <CAAVeFuLHjxTi+OyT2aV4u0BG3_2b9X2JxhD+sW+cU2MUvpWTMQ@mail.gmail.com> <CA+aN+ysw1UUwMHLFvZrr1smrHmPtSVmmdJ+n5XyMukGHAmhuSg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ie0-f171.google.com ([209.85.223.171]:60113 "EHLO
	mail-ie0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751055AbaLQCdc (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 16 Dec 2014 21:33:32 -0500
Received: by mail-ie0-f171.google.com with SMTP id rl12so14204921iec.30
        for <linux-gpio@vger.kernel.org>; Tue, 16 Dec 2014 18:33:31 -0800 (PST)
In-Reply-To: <CA+aN+ysw1UUwMHLFvZrr1smrHmPtSVmmdJ+n5XyMukGHAmhuSg@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Kamlakant Patel <kamlakant.patel@linaro.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Jonas Jensen <jonas.jensen@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Tue, Dec 16, 2014 at 2:17 PM, Kamlakant Patel
<kamlakant.patel@linaro.org> wrote:
> Hi Alexandre,
>
> On 4 December 2014 at 14:47, Alexandre Courbot <gnurou@gmail.com> wrote:
>> On Mon, Dec 1, 2014 at 9:09 PM,  <kamlakant.patel@linaro.org> wrote:
>>> From: Kamlakant Patel <kamlakant.patel@linaro.org>
>>>
>>> This patch converts MOXART GPIO driver to use basic_mmio_gpio
>>> generic library.
>>>
>>> Signed-off-by: Kamlakant Patel <kamlakant.patel@linaro.org>
>>> Tested-by: Jonas Jensen <jonas.jensen@gmail.com>
>>> ---
>>>  drivers/gpio/Kconfig       |   1 +
>>>  drivers/gpio/gpio-moxart.c | 101 ++++++++++++++-------------------------------
>>>  2 files changed, 32 insertions(+), 70 deletions(-)
>>>
>>> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
>>> index 0959ca9..3bd4d63 100644
>>> --- a/drivers/gpio/Kconfig
>>> +++ b/drivers/gpio/Kconfig
>>> @@ -184,6 +184,7 @@ config GPIO_F7188X
>>>  config GPIO_MOXART
>>>         bool "MOXART GPIO support"
>>>         depends on ARCH_MOXART
>>> +       select GPIO_GENERIC
>>>         help
>>>           Select this option to enable GPIO driver for
>>>           MOXA ART SoC devices.
>>> diff --git a/drivers/gpio/gpio-moxart.c b/drivers/gpio/gpio-moxart.c
>>> index 4661e18..122958f 100644
>>> --- a/drivers/gpio/gpio-moxart.c
>>> +++ b/drivers/gpio/gpio-moxart.c
>>> @@ -23,21 +23,12 @@
>>>  #include <linux/delay.h>
>>>  #include <linux/timer.h>
>>>  #include <linux/bitops.h>
>>> +#include <linux/basic_mmio_gpio.h>
>>>
>>>  #define GPIO_DATA_OUT          0x00
>>>  #define GPIO_DATA_IN           0x04
>>>  #define GPIO_PIN_DIRECTION     0x08
>>>
>>> -struct moxart_gpio_chip {
>>> -       struct gpio_chip gpio;
>>> -       void __iomem *base;
>>> -};
>>> -
>>> -static inline struct moxart_gpio_chip *to_moxart_gpio(struct gpio_chip *chip)
>>> -{
>>> -       return container_of(chip, struct moxart_gpio_chip, gpio);
>>> -}
>>> -
>>>  static int moxart_gpio_request(struct gpio_chip *chip, unsigned offset)
>>>  {
>>>         return pinctrl_request_gpio(offset);
>>> @@ -48,90 +39,60 @@ static void moxart_gpio_free(struct gpio_chip *chip, unsigned offset)
>>>         pinctrl_free_gpio(offset);
>>>  }
>>>
>>> -static void moxart_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
>>> -{
>>> -       struct moxart_gpio_chip *gc = to_moxart_gpio(chip);
>>> -       void __iomem *ioaddr = gc->base + GPIO_DATA_OUT;
>>> -       u32 reg = readl(ioaddr);
>>> -
>>> -       if (value)
>>> -               reg = reg | BIT(offset);
>>> -       else
>>> -               reg = reg & ~BIT(offset);
>>> -
>>> -       writel(reg, ioaddr);
>>> -}
>>> -
>>>  static int moxart_gpio_get(struct gpio_chip *chip, unsigned offset)
>>>  {
>>> -       struct moxart_gpio_chip *gc = to_moxart_gpio(chip);
>>> -       u32 ret = readl(gc->base + GPIO_PIN_DIRECTION);
>>> +       struct bgpio_chip *bgc = to_bgpio_chip(chip);
>>> +       u32 ret = bgc->read_reg(bgc->reg_dir);
>>>
>>>         if (ret & BIT(offset))
>>> -               return !!(readl(gc->base + GPIO_DATA_OUT) & BIT(offset));
>>> +               return !!(bgc->read_reg(bgc->reg_set) & BIT(offset));
>>>         else
>>> -               return !!(readl(gc->base + GPIO_DATA_IN) & BIT(offset));
>>> -}
>>> -
>>> -static int moxart_gpio_direction_input(struct gpio_chip *chip, unsigned offset)
>>> -{
>>> -       struct moxart_gpio_chip *gc = to_moxart_gpio(chip);
>>> -       void __iomem *ioaddr = gc->base + GPIO_PIN_DIRECTION;
>>> -
>>> -       writel(readl(ioaddr) & ~BIT(offset), ioaddr);
>>> -       return 0;
>>> -}
>>> -
>>> -static int moxart_gpio_direction_output(struct gpio_chip *chip,
>>> -                                       unsigned offset, int value)
>>> -{
>>> -       struct moxart_gpio_chip *gc = to_moxart_gpio(chip);
>>> -       void __iomem *ioaddr = gc->base + GPIO_PIN_DIRECTION;
>>> -
>>> -       moxart_gpio_set(chip, offset, value);
>>> -       writel(readl(ioaddr) | BIT(offset), ioaddr);
>>> -       return 0;
>>> +               return !!(bgc->read_reg(bgc->reg_dat) & BIT(offset));
>>>  }
>>>
>>> -static struct gpio_chip moxart_template_chip = {
>>> -       .label                  = "moxart-gpio",
>>> -       .request                = moxart_gpio_request,
>>> -       .free                   = moxart_gpio_free,
>>> -       .direction_input        = moxart_gpio_direction_input,
>>> -       .direction_output       = moxart_gpio_direction_output,
>>> -       .set                    = moxart_gpio_set,
>>> -       .get                    = moxart_gpio_get,
>>> -       .ngpio                  = 32,
>>> -       .owner                  = THIS_MODULE,
>>> -};
>>> -
>>>  static int moxart_gpio_probe(struct platform_device *pdev)
>>>  {
>>>         struct device *dev = &pdev->dev;
>>>         struct resource *res;
>>> -       struct moxart_gpio_chip *mgc;
>>> +       struct bgpio_chip *bgc;
>>> +       void __iomem *base;
>>>         int ret;
>>>
>>> -       mgc = devm_kzalloc(dev, sizeof(*mgc), GFP_KERNEL);
>>> -       if (!mgc)
>>> +       bgc = devm_kzalloc(dev, sizeof(*bgc), GFP_KERNEL);
>>> +       if (!bgc)
>>>                 return -ENOMEM;
>>> -       mgc->gpio = moxart_template_chip;
>>>
>>>         res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>>> -       mgc->base = devm_ioremap_resource(dev, res);
>>> -       if (IS_ERR(mgc->base))
>>> -               return PTR_ERR(mgc->base);
>>> +       base = devm_ioremap_resource(dev, res);
>>> +       if (IS_ERR(base))
>>> +               return PTR_ERR(base);
>>>
>>> -       mgc->gpio.dev = dev;
>>> +       ret = bgpio_init(bgc, dev, 4, base + GPIO_DATA_IN,
>>> +                   base + GPIO_DATA_OUT, NULL,
>>> +                   base + GPIO_PIN_DIRECTION, NULL, 0);
>>> +       if (ret) {
>>> +               dev_err(&pdev->dev, "bgpio_init failed\n");
>>> +               return ret;
>>> +       }
>>>
>>> -       ret = gpiochip_add(&mgc->gpio);
>>> +       bgc->gc.label = "moxart-gpio";
>>> +       bgc->gc.request = moxart_gpio_request;
>>> +       bgc->gc.free = moxart_gpio_free;
>>> +       bgc->gc.get = moxart_gpio_get;
>>> +       bgc->data = bgc->read_reg(bgc->reg_set);
>>> +       bgc->gc.base = 0;
>>
>> Do we actually want all instances of this driver to clain GPIOs 0..31?
>>
>
> Here is what I got from Jonas in previous discussion:
> ...
> Thanks, it works, tested on UC-7112-LX hardware.
>
> I have one additional nit..
>
> The GPIO base number is implicitly changed from 0 to 224
> (ARCH_NR_GPIOS (256) - ngpio (32)) which happen because of
> bgpio_init() (it sets base -1 / gpiochip_find_base() on
> gpiochip_add()). Which is confusing since the valid range (from user
> space) used to be 0-31. So on export we now get:
>
> [root@zurkon ~]# echo 24 > /sys/class/gpio/export
>     [   61.640000] gpio-24 (?): gpiod_request: status -517
>     [   61.650000] export_store: status -19
>
> I see other drivers explicitly set base after bgpio_init(), my
> suggestion is that we do the same here e.g. :
>
>> +       bgc->gc.label = "moxart-gpio";
>> +       bgc->gc.request = moxart_gpio_request;
>> +       bgc->gc.free = moxart_gpio_free;
>> +       bgc->gc.get = moxart_gpio_get;
>> +       bgc->data = bgc->read_reg(bgc->reg_set);
>> +       bgc->gc.ngpio = 32;
>> +       bgc->gc.dev = dev;
>> +       bgc->gc.owner = THIS_MODULE;
>
> bgc->gc.base = 0;

My problem is that drivers should not decide what their base GPIO
number is. If all drivers claimed 0, you just could not use two
different drivers on the same system.

But I assume that the driver was already doing that previously, so I
reluctantly maintain my ack. The GPIO base number is a different issue
than what this patch series addresses. With the Tested-by from Jonas I
guess we can at least apply this patch, if Linus agrees.
