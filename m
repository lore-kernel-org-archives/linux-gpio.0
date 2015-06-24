From: Romain Baeriswyl <romain.baeriswyl@alitech.com>
Subject: Re: [PATCH] added device tree support to gpio-generic driver
Date: Wed, 24 Jun 2015 09:42:31 +0200
Message-ID: <558A5F67.30205@alitech.com>
References: <1433487062-10647-1-git-send-email-romain.baeriswyl@alitech.com> <CAAVeFuKRbFpw0_nyQy-nG9mx33FM59FJvwJ4r24=qaZcetuqRA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from nopam.alitech.com ([202.3.176.31]:13792 "EHLO nopam.alitech.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750933AbbFXHmk convert rfc822-to-8bit (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 24 Jun 2015 03:42:40 -0400
In-Reply-To: <CAAVeFuKRbFpw0_nyQy-nG9mx33FM59FJvwJ4r24=qaZcetuqRA@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alexandre Courbot <gnurou@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Christian Ruppert <christian.ruppert@alitech.com>, Anton Vorontsov <cbouatmailru@gmail.com>, Rojhalat Ibrahim <imr@rtschenk.de>, abdoulaye berthe <berthe.ab@gmail.com>, Anthony Fee <anthony.fee@emutex.com>, Alexander Shiyan <shc_work@mail.ru>, Dennis Dai <Dennis.Dai@alitech.com>

>> ---
> 
> Your patch is missing a detailed commit message.
> 
>>  .../devicetree/bindings/gpio/gpio-generic.txt      |   19 +++++
>>  drivers/gpio/gpio-generic.c                        |   81 ++++++++++++++-----
>>  2 files changed, 78 insertions(+), 22 deletions(-)
>>  create mode 100644 Documentation/devicetree/bindings/gpio/gpio-generic.txt
>>
>> diff --git a/Documentation/devicetree/bindings/gpio/gpio-generic.txt b/Documentation/devicetree/bindings/gpio/gpio-generic.txt
>> new file mode 100644
>> index 0000000..c2c4b98
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/gpio/gpio-generic.txt
>> @@ -0,0 +1,19 @@
>> +Bindings for gpio-generic
>> +
>> +Required properties:
>> +- compatible : "basic-mmio-gpio" for little endian register access or
>> +               "basic-mmio-gpio-be" for big endian register access
>> +- ngpios: Specifies the number of gpio mapped in the register. The value is
>> +          limited to the number of bits of the LONG type.
>> +
>> +Optional properties:
>> +- base: Allows to forces the gpio number base offset used to index the gpio in
>> +        the device. If it is not see then the driver search autonoumously for
>> +        valid index range.
> 
> A base property for GPIO drivers is frown upon nowadays. >:/

With the gpio index base managed by the gpio framework, how can we know
the gpio index to be used with the gpio sysfs interface (export, import)?
The base may change when adding/removing one instance of this driver.

> 
>> +
>> +Examples:
>> +
>> +       gpio_a {
>> +               compatible = "basic-mmio-gpio";
>> +               ngpios = <32>;
>> +       };
>> diff --git a/drivers/gpio/gpio-generic.c b/drivers/gpio/gpio-generic.c
>> index b92a690..9a4354c 100644
>> --- a/drivers/gpio/gpio-generic.c
>> +++ b/drivers/gpio/gpio-generic.c
>> @@ -15,11 +15,11 @@
>>   *  `.just a single "data" register, where GPIO state can be read and/or `
>>   *    `,..written. ,,..``~~~~ .....``.`.`.~~.```.`.........``````.```````
>>   *        `````````
>> -                                    ___
>> -_/~~|___/~|   . ```~~~~~~       ___/___\___     ,~.`.`.`.`````.~~...,,,,...
>> -__________|~$@~~~        %~    /o*o*o*o*o*o\   .. Implementing such a GPIO .
>> -o        `                     ~~~~\___/~~~~    ` controller in FPGA is ,.`
>> -                                                 `....trivial..'~`.```.```
>> + *                                   ___
>> + * _/~~|___/~|   . ```~~~~~~       ___/___\___     ,~.`.`.`.`````.~~...,,,,...
>> + * __________|~$@~~~        %~    /o*o*o*o*o*o\   .. Implementing such a GPIO .
>> + * o        `                     ~~~~\___/~~~~    ` controller in FPGA is ,.`
>> + *                                                `....trivial..'~`.```.```
> 
> Comment fix? Why not, but this is not related to the subject of this
> patch. Please do this in a separate patch.
> 
>>   *                                                    ```````
>>   *  .```````~~~~`..`.``.``.
>>   * .  The driver supports  `...       ,..```.`~~~```````````````....````.``,,
>> @@ -61,6 +61,8 @@ o        `                     ~~~~\___/~~~~    ` controller in FPGA is ,.`
>>  #include <linux/platform_device.h>
>>  #include <linux/mod_devicetable.h>
>>  #include <linux/basic_mmio_gpio.h>
>> +#include <linux/of.h>
>> +#include <linux/of_device.h>
>>
>>  static void bgpio_write8(void __iomem *reg, unsigned long data)
>>  {
>> @@ -375,10 +377,9 @@ static int bgpio_setup_accessors(struct device *dev,
>>                         dev_err(dev,
>>                                 "64 bit big endian byte order unsupported\n");
>>                         return -EINVAL;
>> -               } else {
>> -                       bgc->read_reg   = bgpio_read64;
>> -                       bgc->write_reg  = bgpio_write64;
>>                 }
>> +               bgc->read_reg   = bgpio_read64;
>> +               bgc->write_reg  = bgpio_write64;
> 
> Why change this? This if/else sequence was consistent with the other
> cases, I think it would be better to keep it that way.
> 
>>                 break;
>>  #endif /* BITS_PER_LONG >= 64 */
>>         default:
>> @@ -564,6 +565,27 @@ static void __iomem *bgpio_map(struct platform_device *pdev,
>>         return ret;
>>  }
>>
>> +static const struct platform_device_id bgpio_id_table[] = {
>> +       { "basic-mmio-gpio",
>> +         .driver_data  = 0,
>> +       }, { "basic-mmio-gpio-be",
>> +         .driver_data  = BGPIOF_BIG_ENDIAN
>> +       },
>> +       { },
>> +};
> 
> Formatting is wrong here. Please keep the same formatting as the
> original statement.
> 
>> +MODULE_DEVICE_TABLE(platform, bgpio_id_table);
>> +
>> +static const struct of_device_id  bgpio_dt_ids[] = {
>> +       { .compatible = "basic-mmio-gpio",
> 
> Same remark about formatting.
> 
>> +         .data = bgpio_id_table + 0
> 
> I would probably prefer &bgpio_id_table[0], but your call.
> 
>> +       },
>> +       { .compatible = "basic-mmio-gpio-be",
>> +         .data = bgpio_id_table + 1
>> +       },
> 
> Instead of having two different compatible strings, how about making
> the big-endian option a boolean DT property?
> 
>> +       { }
>> +};
>> +MODULE_DEVICE_TABLE(of, bgpio_dt_ids);
>> +
>>  static int bgpio_pdev_probe(struct platform_device *pdev)
>>  {
>>         struct device *dev = &pdev->dev;
>> @@ -574,10 +596,37 @@ static int bgpio_pdev_probe(struct platform_device *pdev)
>>         void __iomem *dirout;
>>         void __iomem *dirin;
>>         unsigned long sz;
>> -       unsigned long flags = pdev->id_entry->driver_data;
>> +       unsigned long flags;
>>         int err;
>>         struct bgpio_chip *bgc;
>> -       struct bgpio_pdata *pdata = dev_get_platdata(dev);
>> +       struct bgpio_pdata *pdata;
>> +
>> +       if (of_have_populated_dt()) {
>> +               const struct of_device_id *of_id =
>> +                       of_match_device(bgpio_dt_ids, dev);
>> +
>> +               pdata = devm_kzalloc(dev, sizeof(struct bgpio_pdata),
>> +                                    GFP_KERNEL);
>> +               if (!pdata)
>> +                       return -ENOMEM;
>> +
>> +               if (of_property_read_u32(dev->of_node, "ngpio",
>> +                                        &pdata->ngpio)) {
>> +                       dev_err(dev, "Failed to get field ngpio");
>> +                       return -EINVAL;
>> +               }
>> +               if (of_property_read_u32(dev->of_node, "base", &pdata->base))
>> +                       pdata->base = -1;
>> +
>> +               dev->platform_data = pdata;
>> +
>> +               if (of_id)
>> +                       pdev->id_entry = of_id->data;
>> +       }
> 
> Could you move this to a bgpio_parse_dt() function to keep this
> function short and clear?
> 
>> +
>> +       pdata = dev_get_platdata(dev);
>> +
>> +       flags = pdev->id_entry->driver_data;
>>
>>         r = platform_get_resource_byname(pdev, IORESOURCE_MEM, "dat");
>>         if (!r)
>> @@ -633,18 +682,6 @@ static int bgpio_pdev_remove(struct platform_device *pdev)
>>         return bgpio_remove(bgc);
>>  }
>>
>> -static const struct platform_device_id bgpio_id_table[] = {
>> -       {
>> -               .name           = "basic-mmio-gpio",
>> -               .driver_data    = 0,
>> -       }, {
>> -               .name           = "basic-mmio-gpio-be",
>> -               .driver_data    = BGPIOF_BIG_ENDIAN,
>> -       },
>> -       { }
>> -};
>> -MODULE_DEVICE_TABLE(platform, bgpio_id_table);
>> -
>>  static struct platform_driver bgpio_driver = {
>>         .driver = {
>>                 .name = "basic-mmio-gpio",
>> --
>> 1.7.1
>>
>> *********************************************************
>> This message contains information that may be confidential and/or privileged and is intended only for the individual or entity named in the body of email above. If this message has been received in error, your receipt of this message is not intended to waive any applicable privilege. No one else may disclose, copy, distribute or use the contents of this message. Unauthorized use, dissemination and duplication is strictly prohibited, and may be unlawful.
>>
>>
>>
>>

