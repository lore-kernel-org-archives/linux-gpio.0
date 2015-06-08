From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [PATCH] added device tree support to gpio-generic driver
Date: Mon, 8 Jun 2015 15:39:31 +0900
Message-ID: <CAAVeFuKvqrJpF81QHWWV_VpMUzLVLZfLMpucECL7O0WZjJ74Ug@mail.gmail.com>
References: <1433487062-10647-1-git-send-email-romain.baeriswyl@alitech.com>
 <CAAVeFuKRbFpw0_nyQy-nG9mx33FM59FJvwJ4r24=qaZcetuqRA@mail.gmail.com> <55753580.6060306@alitech.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f50.google.com ([209.85.218.50]:35309 "EHLO
	mail-oi0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750917AbbFHGjw (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 8 Jun 2015 02:39:52 -0400
In-Reply-To: <55753580.6060306@alitech.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Romain Baeriswyl <romain.baeriswyl@alitech.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Christian Ruppert <christian.ruppert@alitech.com>, Anton Vorontsov <cbouatmailru@gmail.com>, Rojhalat Ibrahim <imr@rtschenk.de>, abdoulaye berthe <berthe.ab@gmail.com>, Anthony Fee <anthony.fee@emutex.com>, Alexander Shiyan <shc_work@mail.ru>

On Mon, Jun 8, 2015 at 3:26 PM, Romain Baeriswyl
<romain.baeriswyl@alitech.com> wrote:
>
>
> On 2015-06-08 06:19, Alexandre Courbot wrote:
>> On Fri, Jun 5, 2015 at 3:51 PM, Romain Baeriswyl
>> <romain.baeriswyl@alitech.com> wrote:
>>> ---
>>
>> Your patch is missing a detailed commit message.
>>
>>>  .../devicetree/bindings/gpio/gpio-generic.txt      |   19 +++++
>>>  drivers/gpio/gpio-generic.c                        |   81 ++++++++++++++-----
>>>  2 files changed, 78 insertions(+), 22 deletions(-)
>>>  create mode 100644 Documentation/devicetree/bindings/gpio/gpio-generic.txt
>>>
>>> diff --git a/Documentation/devicetree/bindings/gpio/gpio-generic.txt b/Documentation/devicetree/bindings/gpio/gpio-generic.txt
>>> new file mode 100644
>>> index 0000000..c2c4b98
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/gpio/gpio-generic.txt
>>> @@ -0,0 +1,19 @@
>>> +Bindings for gpio-generic
>>> +
>>> +Required properties:
>>> +- compatible : "basic-mmio-gpio" for little endian register access or
>>> +               "basic-mmio-gpio-be" for big endian register access
>>> +- ngpios: Specifies the number of gpio mapped in the register. The value is
>>> +          limited to the number of bits of the LONG type.
>>> +
>>> +Optional properties:
>>> +- base: Allows to forces the gpio number base offset used to index the gpio in
>>> +        the device. If it is not see then the driver search autonoumously for
>>> +        valid index range.
>>
>> A base property for GPIO drivers is frown upon nowadays. >:/
>>
> OK, I will remove it.
>
>>> +
>>> +Examples:
>>> +
>>> +       gpio_a {
>>> +               compatible = "basic-mmio-gpio";
>>> +               ngpios = <32>;
>>> +       };
>>> diff --git a/drivers/gpio/gpio-generic.c b/drivers/gpio/gpio-generic.c
>>> index b92a690..9a4354c 100644
>>> --- a/drivers/gpio/gpio-generic.c
>>> +++ b/drivers/gpio/gpio-generic.c
>>> @@ -15,11 +15,11 @@
>>>   *  `.just a single "data" register, where GPIO state can be read and/or `
>>>   *    `,..written. ,,..``~~~~ .....``.`.`.~~.```.`.........``````.```````
>>>   *        `````````
>>> -                                    ___
>>> -_/~~|___/~|   . ```~~~~~~       ___/___\___     ,~.`.`.`.`````.~~...,,,,...
>>> -__________|~$@~~~        %~    /o*o*o*o*o*o\   .. Implementing such a GPIO .
>>> -o        `                     ~~~~\___/~~~~    ` controller in FPGA is ,.`
>>> -                                                 `....trivial..'~`.```.```
>>> + *                                   ___
>>> + * _/~~|___/~|   . ```~~~~~~       ___/___\___     ,~.`.`.`.`````.~~...,,,,...
>>> + * __________|~$@~~~        %~    /o*o*o*o*o*o\   .. Implementing such a GPIO .
>>> + * o        `                     ~~~~\___/~~~~    ` controller in FPGA is ,.`
>>> + *                                                `....trivial..'~`.```.```
>>
>> Comment fix? Why not, but this is not related to the subject of this
>> patch. Please do this in a separate patch.
>>
> I just added the '*' to have the checkpatch.pl passing.

Would be great as the first patch of your series then. :P

>
>>>   *                                                    ```````
>>>   *  .```````~~~~`..`.``.``.
>>>   * .  The driver supports  `...       ,..```.`~~~```````````````....````.``,,
>>> @@ -61,6 +61,8 @@ o        `                     ~~~~\___/~~~~    ` controller in FPGA is ,.`
>>>  #include <linux/platform_device.h>
>>>  #include <linux/mod_devicetable.h>
>>>  #include <linux/basic_mmio_gpio.h>
>>> +#include <linux/of.h>
>>> +#include <linux/of_device.h>
>>>
>>>  static void bgpio_write8(void __iomem *reg, unsigned long data)
>>>  {
>>> @@ -375,10 +377,9 @@ static int bgpio_setup_accessors(struct device *dev,
>>>                         dev_err(dev,
>>>                                 "64 bit big endian byte order unsupported\n");
>>>                         return -EINVAL;
>>> -               } else {
>>> -                       bgc->read_reg   = bgpio_read64;
>>> -                       bgc->write_reg  = bgpio_write64;
>>>                 }
>>> +               bgc->read_reg   = bgpio_read64;
>>> +               bgc->write_reg  = bgpio_write64;
>>
>> Why change this? This if/else sequence was consistent with the other
>> cases, I think it would be better to keep it that way.
>>
> The else is actually not required as there is a return in the first
> case. This change was also suggested by checkpatch.pl.

checkpatch is a useful script, but at the end of the day you still
should apply your judgment to know whether what it suggests actually
makes sense or not. In this case, I would favor code consistency over
arbitrary rules.

>
>>>                 break;
>>>  #endif /* BITS_PER_LONG >= 64 */
>>>         default:
>>> @@ -564,6 +565,27 @@ static void __iomem *bgpio_map(struct platform_device *pdev,
>>>         return ret;
>>>  }
>>>
>>> +static const struct platform_device_id bgpio_id_table[] = {
>>> +       { "basic-mmio-gpio",
>>> +         .driver_data  = 0,
>>> +       }, { "basic-mmio-gpio-be",
>>> +         .driver_data  = BGPIOF_BIG_ENDIAN
>>> +       },
>>> +       { },
>>> +};
>>
>> Formatting is wrong here. Please keep the same formatting as the
>> original statement.
>>
> OK
>
>>> +MODULE_DEVICE_TABLE(platform, bgpio_id_table);
>>> +
>>> +static const struct of_device_id  bgpio_dt_ids[] = {
>>> +       { .compatible = "basic-mmio-gpio",
>>
>> Same remark about formatting.
>>
>>> +         .data = bgpio_id_table + 0
>>
>> I would probably prefer &bgpio_id_table[0], but your call.
>>
>>> +       },
>>> +       { .compatible = "basic-mmio-gpio-be",
>>> +         .data = bgpio_id_table + 1
>>> +       },
>>
>> Instead of having two different compatible strings, how about making
>> the big-endian option a boolean DT property?
>>
> I wanted to keep this device tree version aligned with the platform data
> version.

Mmm makes sense, but in this case I think the platform got it wrong.
The BIG_ENDIAN flag should be part of the platform data, not selected
from the driver's name. I'm open to be refuted, of course.
