From: Hoan Tran <hotran@apm.com>
Subject: Re: [PATCH v2] gpio: dwapb: Add support for next generation of X-Gene SoC
Date: Fri, 17 Feb 2017 14:47:03 -0800
Message-ID: <CAFHUOYxm0UQv5JVSs8sqPuDgs3Z5Wuy5pGOjJSy698Rmsb88fw@mail.gmail.com>
References: <1487293289-9807-1-git-send-email-hotran@apm.com> <CAHp75Vew+D_vCTEY_iAZBFB8pUEh25+9Cr61S8z=CV5LEmZ7qQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ot0-f176.google.com ([74.125.82.176]:35054 "EHLO
        mail-ot0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S935080AbdBQWrF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 17 Feb 2017 17:47:05 -0500
Received: by mail-ot0-f176.google.com with SMTP id 45so40561917otd.2
        for <linux-gpio@vger.kernel.org>; Fri, 17 Feb 2017 14:47:05 -0800 (PST)
In-Reply-To: <CAHp75Vew+D_vCTEY_iAZBFB8pUEh25+9Cr61S8z=CV5LEmZ7qQ@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Jamie Iles <jamie@jamieiles.com>, Weike Chen <alvin.chen@intel.com>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Loc Ho <lho@apm.com>, Duc Dang <dhdang@apm.com>

Hi Andy,

On Fri, Feb 17, 2017 at 2:23 AM, Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Fri, Feb 17, 2017 at 3:01 AM, Hoan Tran <hotran@apm.com> wrote:
>> Next generation of X-Gene SoC's GPIO hardware register map is very
>> similar to DW GPIO. It only differs by a few register addresses.
>> This patch modifies DW GPIO driver to accommodate the difference
>> in a few register addresses.
>
>> --- a/drivers/gpio/gpio-dwapb.c
>> +++ b/drivers/gpio/gpio-dwapb.c
>> @@ -55,6 +56,13 @@
>>  #define GPIO_SWPORT_DR_SIZE    (GPIO_SWPORTB_DR - GPIO_SWPORTA_DR)
>>  #define GPIO_SWPORT_DDR_SIZE   (GPIO_SWPORTB_DDR - GPIO_SWPORTA_DDR)
>>
>> +#define GPIO_REG_OFFSET_V2     1
>
> + empty line
>
>> +#define GPIO_INTMASK_V2                0x44
>> +#define GPIO_INTTYPE_LEVEL_V2  0x34
>> +#define GPIO_INT_POLARITY_V2   0x38
>> +#define GPIO_INTSTATUS_V2      0x3c
>> +#define GPIO_PORTA_EOI_V2      0x40
>
>> +       unsigned int            flags;
>
>> +static inline u32 gpio_reg_convert(struct dwapb_gpio *gpio, unsigned int offset)
>> +{
>
>> +       if (!(gpio->flags & GPIO_REG_OFFSET_V2))
>> +               return offset;
>
> I would split this to to functions:
>
> ... u32 gpio_reg_convert(...) {
>  if (gpio->flags & ...)
>   return gpio_reg_v2_convert();
>  return offset;
> }
>
>> +       switch (offset) {
>> +       case GPIO_INTMASK:
>> +               return GPIO_INTMASK_V2;
>> +       case GPIO_INTTYPE_LEVEL:
>> +               return GPIO_INTTYPE_LEVEL_V2;
>> +       case GPIO_INT_POLARITY:
>> +               return GPIO_INT_POLARITY_V2;
>> +       case GPIO_INTSTATUS:
>> +               return GPIO_INTSTATUS_V2;
>> +       case GPIO_PORTA_EOI:
>> +               return GPIO_PORTA_EOI_V2;
>> +       }
>> +
>> +       return offset;
>> +}
>
>> -       return gc->read_reg(reg_base + offset);
>> +       return gc->read_reg(reg_base + gpio_reg_convert(gpio, offset));
>
> I'm still not convinced why we can't use
>
> gc->read_reg = ..._read_reg_v2;
>
> It will be called only in case of v2.
>
> Sorry if I missed the point.

This gc->read_reg is from gpio_chip and it is assigned by the upper layer.

>
>>  static int dwapb_gpio_to_irq(struct gpio_chip *gc, unsigned offset)
>> @@ -336,8 +366,8 @@ static void dwapb_configure_irqs(struct dwapb_gpio *gpio,
>>                 ct->chip.irq_disable = dwapb_irq_disable;
>>                 ct->chip.irq_request_resources = dwapb_irq_reqres;
>>                 ct->chip.irq_release_resources = dwapb_irq_relres;
>> -               ct->regs.ack = GPIO_PORTA_EOI;
>> -               ct->regs.mask = GPIO_INTMASK;
>> +               ct->regs.ack = gpio_reg_convert(gpio, GPIO_PORTA_EOI);
>> +               ct->regs.mask = gpio_reg_convert(gpio, GPIO_INTMASK);
>>                 ct->type = IRQ_TYPE_LEVEL_MASK;
>>         }
>>
>> @@ -520,6 +550,21 @@ static void dwapb_gpio_unregister(struct dwapb_gpio *gpio)
>>         return pdata;
>>  }
>
>
>> +static const struct of_device_id dwapb_of_match[] = {
>> +       { .compatible = "snps,dw-apb-gpio", .data = (void *)0},
>> +       { .compatible = "apm,xgene-gpio-v2", .data = (void *)GPIO_REG_OFFSET_V2},
>> +       { /* Sentinel */ }
>> +};
>> +MODULE_DEVICE_TABLE(of, dwapb_of_match);
>> +
>> +static const struct acpi_device_id dwapb_acpi_match[] = {
>> +       {"HISI0181", 0},
>> +       {"APMC0D07", 0},
>> +       {"APMC0D81", GPIO_REG_OFFSET_V2},
>> +       { }
>> +};
>> +MODULE_DEVICE_TABLE(acpi, dwapb_acpi_match);
>> +
>
> Since you are adding stuff here, I would consider at least two patches:
> 1. Move tables up here
> 2. Add and enable V2

Do we really need to have a separate patch for move the table up?

>
> or even 3:
> 1. Move tables
> 2. Extend functionality
> 3. Add ACPI ID
>
>> +       of_devid = of_match_device(dwapb_of_match, dev);
>> +       if (of_devid) {
>
> Why not to follow the below pattern, i.e.
>
> if (dev.of_node) {
>       const struct of_device_id *of_id;
> ...
> } else if (has_acpi_companion(...)) {
> ...
> }
>
> ?
>
>> +               if (of_devid->data)
>> +                       gpio->flags = (uintptr_t)of_devid->data;
>
> Type inconsistency.
> (unsigned int) would work.

I tried and got this warning.
warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]

Thanks
Hoan

>
>> +       } else {
>> +               const struct acpi_device_id *acpi_id;
>> +
>> +               acpi_id = acpi_match_device(dwapb_acpi_match, &pdev->dev);
>> +               if (acpi_id) {
>> +                       if (acpi_id->driver_data)
>> +                               gpio->flags = acpi_id->driver_data;
>> +               }
>> +       }
>
>> @@ -581,19 +642,6 @@ static int dwapb_gpio_remove(struct platform_device *pdev)
>
>> -static const struct of_device_id dwapb_of_match[] = {
>> -       { .compatible = "snps,dw-apb-gpio" },
>> -       { /* Sentinel */ }
>> -};
>> -MODULE_DEVICE_TABLE(of, dwapb_of_match);
>> -
>> -static const struct acpi_device_id dwapb_acpi_match[] = {
>> -       {"HISI0181", 0},
>> -       {"APMC0D07", 0},
>> -       { }
>> -};
>> -MODULE_DEVICE_TABLE(acpi, dwapb_acpi_match);
>> -
>
> --
> With Best Regards,
> Andy Shevchenko
