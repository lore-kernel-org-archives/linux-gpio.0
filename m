From: Grygorii Strashko <grygorii.strashko@ti.com>
Subject: Re: [PATCH] pinctrl: cherryview: fix issues caused by dynamic gpio
 irqs mapping
Date: Tue, 3 Oct 2017 13:20:05 -0500
Message-ID: <1ff05c6b-9bac-b8e7-fb10-cd146e4e8bf8@ti.com>
References: <20171003170049.24480-1-grygorii.strashko@ti.com>
 <CAHp75Vce0v0d9x4AiDnbNfqv4c_erxwNXsd+ApCTEfybCEOMdA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from fllnx210.ext.ti.com ([198.47.19.17]:20529 "EHLO
        fllnx210.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751115AbdJCSUI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 3 Oct 2017 14:20:08 -0400
In-Reply-To: <CAHp75Vce0v0d9x4AiDnbNfqv4c_erxwNXsd+ApCTEfybCEOMdA@mail.gmail.com>
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Chris Gorman <chrisjohgorman@gmail.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, theadamlevy@gmail.com



On 10/03/2017 12:54 PM, Andy Shevchenko wrote:
> On Tue, Oct 3, 2017 at 8:00 PM, Grygorii Strashko
> <grygorii.strashko@ti.com> wrote:
>> New GPIO IRQs are allocated and mapped dynamically by default when
>> GPIO IRQ infrastructure is used by cherryview-pinctrl driver.
>> This causes issues on some Intel platforms [1][2] with broken BIOS which
>> hardcodes Linux IRQ numbers in their ACPI tables.
>>
>> On such platforms cherryview-pinctrl driver should allocate and map all
>> GPIO IRQs at probe time.
>> Side effect - "Cannot allocate irq_descs @ IRQ%d, assuming pre-allocated\n"
>> can be seen at boot log.
>>
>> NOTE. It still may fail if boot sequence will changed and some interrupt
>> controller will be probed before cherryview-pinctrl which will shift Linux IRQ
>> numbering (expected with CONFIG_SPARCE_IRQ enabled).
>>
>> [1] https://bugzilla.kernel.org/show_bug.cgi?id=194945
>> [2] https://lkml.org/lkml/2017/9/28/153
> 
> Btw, you might want to use one of
> 
> Buglink:
> Bugzilla:
> Link:
> 
> tags.
> 
>> Cc: Andy Shevchenko <andy.shevchenko@gmail.com>
>> Cc: Chris Gorman <chrisjohgorman@gmail.com>
>> Cc: Mika Westerberg <mika.westerberg@linux.intel.com>
>> Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
>> Signed-off-by: Grygorii Strashko <grygorii.strashko@ti.com>
>> Reported-by: Chris Gorman <chrisjohgorman@gmail.com>
>> Reported-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> 
> I'm not sure about this approach. It might be some other broken BIOS
> discovered with some other driver (like pinctrl-baytrail.c as an
> hypothetical example).

It can be made more safe by fixing gpio chip base irq numbers, but this info
should be passed to drivers somehow. Of course, above note will be still valid
- as W/A, required IRQ ranges can be reserved very early during boot in platform code.

> 
> Alternative is to deselect SPARSE_IRQ (though it makes it non-usable
> in entire x86 world).

:) nuke mix.

> 
>>   drivers/pinctrl/intel/pinctrl-cherryview.c | 14 +++++++++++++-
>>   1 file changed, 13 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/pinctrl/intel/pinctrl-cherryview.c b/drivers/pinctrl/intel/pinctrl-cherryview.c
>> index 04e929f..fadbca9 100644
>> --- a/drivers/pinctrl/intel/pinctrl-cherryview.c
>> +++ b/drivers/pinctrl/intel/pinctrl-cherryview.c
>> @@ -1577,6 +1577,7 @@ static int chv_gpio_probe(struct chv_pinctrl *pctrl, int irq)
>>          struct gpio_chip *chip = &pctrl->chip;
>>          bool need_valid_mask = !dmi_check_system(chv_no_valid_mask);
>>          int ret, i, offset;
>> +       int irq_base;
>>
>>          *chip = chv_gpio_chip;
>>
>> @@ -1622,7 +1623,18 @@ static int chv_gpio_probe(struct chv_pinctrl *pctrl, int irq)
>>          /* Clear all interrupts */
>>          chv_writel(0xffff, pctrl->regs + CHV_INTSTAT);
>>
>> -       ret = gpiochip_irqchip_add(chip, &chv_gpio_irqchip, 0,
>> +       if (!need_valid_mask) {
>> +               irq_base = devm_irq_alloc_descs(pctrl->dev, -1, 0,
>> +                                               chip->ngpio, NUMA_NO_NODE);
>> +               if (irq_base < 0) {
>> +                       dev_err(pctrl->dev, "Failed to allocate IRQ numbers\n");
>> +                       return irq_base;
>> +               }
>> +       } else {
>> +               irq_base = 0;
>> +       }
>> +
>> +       ret = gpiochip_irqchip_add(chip, &chv_gpio_irqchip, irq_base,
>>                                     handle_bad_irq, IRQ_TYPE_NONE);
>>          if (ret) {
>>                  dev_err(pctrl->dev, "failed to add IRQ chip\n");
>> --
>> 2.10.1
>>
> 
> 
> 

-- 
regards,
-grygorii
