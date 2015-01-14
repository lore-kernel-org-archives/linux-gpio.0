From: Martyn Welch <martyn.welch@ge.com>
Subject: Re: [PATCH v1 4/5] gpio: ge: convert to use basic mmio gpio library
Date: Wed, 14 Jan 2015 09:37:53 +0000
Message-ID: <54B638F1.9080600@ge.com>
References: <1417435778-21879-1-git-send-email-kamlakant.patel@linaro.org>	<1417435778-21879-5-git-send-email-kamlakant.patel@linaro.org> <CACRpkdbVgBiciT4RUux7bBxR0dzfp+xv1oxRH6j9K-e6U-uOgQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mx0a-00176a03.pphosted.com ([67.231.149.52]:20027 "EHLO
	mx0a-00176a03.pphosted.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751706AbbANLBO (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>);
	Wed, 14 Jan 2015 06:01:14 -0500
Received: from pps.filterd (m0048274.ppops.net [127.0.0.1])
	by m0048274.ppops.net-00176a03. (8.14.7/8.14.7) with SMTP id t0E9YhwW018524
	for <linux-gpio@vger.kernel.org>; Wed, 14 Jan 2015 04:38:06 -0500
Received: from cinmlip14.e2k.ad.ge.com (n165-156-000-000.static.ge.com [165.156.4.1] (may be forged))
	by m0048274.ppops.net-00176a03. with ESMTP id 1rwnew00t8-4
	(version=TLSv1/SSLv3 cipher=RC4-SHA bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 14 Jan 2015 04:38:06 -0500
In-Reply-To: <CACRpkdbVgBiciT4RUux7bBxR0dzfp+xv1oxRH6j9K-e6U-uOgQ@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Kamlakant Patel <kamlakant.patel@linaro.org>, Martyn Welch <martyn.welch@gefanuc.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

Hi Linus,

Sorry for the delayed response, little bit snowed under.

I'm not going to get a chance to test it, but it looks sane to me. I'm 
happy for this to be applied.

Thanks for your patience,

Martyn

On 09/01/15 09:21, Linus Walleij wrote:
> Martyn,
>
> do you have some feedback on this patch? Can you test it?
> Shall I just apply it?
>
> Yours,
> Linus Walleij
>
> On Mon, Dec 1, 2014 at 1:09 PM,  <kamlakant.patel@linaro.org> wrote:
>> From: Kamlakant Patel <kamlakant.patel@linaro.org>
>>
>> This patch converts GE GPIO driver to use basic_mmio_gpio
>> generic library.
>>
>> Signed-off-by: Kamlakant Patel <kamlakant.patel@linaro.org>
>> ---
>>   drivers/gpio/Kconfig   |  1 +
>>   drivers/gpio/gpio-ge.c | 96 ++++++++++++++++++++------------------------------
>>   2 files changed, 40 insertions(+), 57 deletions(-)
>>
>> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
>> index 8cbc3ab..35a315d 100644
>> --- a/drivers/gpio/Kconfig
>> +++ b/drivers/gpio/Kconfig
>> @@ -429,6 +429,7 @@ config GPIO_VX855
>>   config GPIO_GE_FPGA
>>          bool "GE FPGA based GPIO"
>>          depends on GE_FPGA
>> +       select GPIO_GENERIC
>>          help
>>            Support for common GPIO functionality provided on some GE Single Board
>>            Computers.
>> diff --git a/drivers/gpio/gpio-ge.c b/drivers/gpio/gpio-ge.c
>> index 1237a73..7579d2e 100644
>> --- a/drivers/gpio/gpio-ge.c
>> +++ b/drivers/gpio/gpio-ge.c
>> @@ -21,7 +21,9 @@
>>   #include <linux/io.h>
>>   #include <linux/of_device.h>
>>   #include <linux/of_gpio.h>
>> +#include <linux/of_address.h>
>>   #include <linux/module.h>
>> +#include <linux/basic_mmio_gpio.h>
>>
>>   #define GEF_GPIO_DIRECT                0x00
>>   #define GEF_GPIO_IN            0x04
>> @@ -33,53 +35,6 @@
>>   #define GEF_GPIO_OVERRUN       0x1C
>>   #define GEF_GPIO_MODE          0x20
>>
>> -static void gef_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
>> -{
>> -       struct of_mm_gpio_chip *mmchip = to_of_mm_gpio_chip(chip);
>> -       unsigned int data;
>> -
>> -       data = ioread32be(mmchip->regs + GEF_GPIO_OUT);
>> -       if (value)
>> -               data = data | BIT(offset);
>> -       else
>> -               data = data & ~BIT(offset);
>> -       iowrite32be(data, mmchip->regs + GEF_GPIO_OUT);
>> -}
>> -
>> -static int gef_gpio_dir_in(struct gpio_chip *chip, unsigned offset)
>> -{
>> -       unsigned int data;
>> -       struct of_mm_gpio_chip *mmchip = to_of_mm_gpio_chip(chip);
>> -
>> -       data = ioread32be(mmchip->regs + GEF_GPIO_DIRECT);
>> -       data = data | BIT(offset);
>> -       iowrite32be(data, mmchip->regs + GEF_GPIO_DIRECT);
>> -
>> -       return 0;
>> -}
>> -
>> -static int gef_gpio_dir_out(struct gpio_chip *chip, unsigned offset, int value)
>> -{
>> -       unsigned int data;
>> -       struct of_mm_gpio_chip *mmchip = to_of_mm_gpio_chip(chip);
>> -
>> -       /* Set value before switching to output */
>> -       gef_gpio_set(mmchip->regs + GEF_GPIO_OUT, offset, value);
>> -
>> -       data = ioread32be(mmchip->regs + GEF_GPIO_DIRECT);
>> -       data = data & ~BIT(offset);
>> -       iowrite32be(data, mmchip->regs + GEF_GPIO_DIRECT);
>> -
>> -       return 0;
>> -}
>> -
>> -static int gef_gpio_get(struct gpio_chip *chip, unsigned offset)
>> -{
>> -       struct of_mm_gpio_chip *mmchip = to_of_mm_gpio_chip(chip);
>> -
>> -       return !!(ioread32be(mmchip->regs + GEF_GPIO_IN) & BIT(offset));
>> -}
>> -
>>   static const struct of_device_id gef_gpio_ids[] = {
>>          {
>>                  .compatible     = "gef,sbc610-gpio",
>> @@ -99,22 +54,49 @@ static int __init gef_gpio_probe(struct platform_device *pdev)
>>   {
>>          const struct of_device_id *of_id =
>>                  of_match_device(gef_gpio_ids, &pdev->dev);
>> -       struct of_mm_gpio_chip *mmchip;
>> +       struct bgpio_chip *bgc;
>> +       void __iomem *regs;
>> +       int ret;
>>
>> -       mmchip = devm_kzalloc(&pdev->dev, sizeof(*mmchip), GFP_KERNEL);
>> -       if (!mmchip)
>> +       bgc = devm_kzalloc(&pdev->dev, sizeof(*bgc), GFP_KERNEL);
>> +       if (!bgc)
>>                  return -ENOMEM;
>>
>> +       regs = of_iomap(pdev->dev.of_node, 0);
>> +       if (!regs)
>> +               return -ENOMEM;
>> +
>> +       ret = bgpio_init(bgc, &pdev->dev, 4, regs + GEF_GPIO_IN,
>> +                        regs + GEF_GPIO_OUT, NULL, NULL,
>> +                        regs + GEF_GPIO_DIRECT, BGPIOF_BIG_ENDIAN_BYTE_ORDER);
>> +       if (ret) {
>> +               dev_err(&pdev->dev, "bgpio_init failed\n");
>> +               goto err0;
>> +       }
>> +
>>          /* Setup pointers to chip functions */
>> -       mmchip->gc.ngpio = (u16)(uintptr_t)of_id->data;
>> -       mmchip->gc.of_gpio_n_cells = 2;
>> -       mmchip->gc.direction_input = gef_gpio_dir_in;
>> -       mmchip->gc.direction_output = gef_gpio_dir_out;
>> -       mmchip->gc.get = gef_gpio_get;
>> -       mmchip->gc.set = gef_gpio_set;
>> +       bgc->gc.label = kstrdup(pdev->dev.of_node->full_name, GFP_KERNEL);
>> +       if (!bgc->gc.label)
>> +               goto err0;
>> +
>> +       bgc->gc.base = -1;
>> +       bgc->gc.ngpio = (u16)(uintptr_t)of_id->data;
>> +       bgc->gc.of_gpio_n_cells = 2;
>> +       bgc->gc.of_node = pdev->dev.of_node;
>>
>>          /* This function adds a memory mapped GPIO chip */
>> -       return of_mm_gpiochip_add(pdev->dev.of_node, mmchip);
>> +       ret = gpiochip_add(&bgc->gc);
>> +       if (ret)
>> +               goto err1;
>> +
>> +       return 0;
>> +err1:
>> +       kfree(bgc->gc.label);
>> +err0:
>> +       iounmap(regs);
>> +       pr_err("%s: GPIO chip registration failed\n",
>> +                       pdev->dev.of_node->full_name);
>> +       return ret;
>>   };
>>
>>   static struct platform_driver gef_gpio_driver = {
>> --
>> 1.9.1
>>

-- 
Martyn Welch (Lead Software Engineer)  | Registered in England and Wales
GE Intelligent Platforms               | (3828642) at 100 Barbirolli Square
T +44(0)1327322748                     | Manchester, M2 3AB
E martyn.welch@ge.com                  | VAT:GB 927559189
