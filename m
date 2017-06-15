From: sathyanarayanan kuppuswamy
        <sathyanarayanan.kuppuswamy@linux.intel.com>
Subject: Re: [PATCH v1 1/1] gpio: gpio-wcove: Fix GPIO control register offset
 calculation
Date: Thu, 15 Jun 2017 13:53:32 -0700
Message-ID: <f18a15e9-24f2-891e-679b-6c9c83c9acc9@linux.intel.com>
References: <c3bed7faffed058b1363ff5fdd35b6f107b83a78.1497476287.git.sathyanarayanan.kuppuswamy@linux.intel.com>
 <CAHp75Vd1w9FXF_Yfo0+mBAS3+JZmCv7O8tKCWvyAvTdjAcJn0A@mail.gmail.com>
Reply-To: sathyanarayanan.kuppuswamy@linux.intel.com
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga05.intel.com ([192.55.52.43]:64528 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750830AbdFOUxd (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 15 Jun 2017 16:53:33 -0400
In-Reply-To: <CAHp75Vd1w9FXF_Yfo0+mBAS3+JZmCv7O8tKCWvyAvTdjAcJn0A@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Sathyanarayanan Kuppuswamy Natarajan <sathyaosid@gmail.com>

Hi Andy,


On 06/15/2017 02:06 AM, Andy Shevchenko wrote:
> On Thu, Jun 15, 2017 at 12:39 AM,
> <sathyanarayanan.kuppuswamy@linux.intel.com> wrote:
>> From: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
>>
>> According to Whiskey Cove PMIC GPIO controller specification, for GPIO
>> pins 0-12, GPIO input and output register control address range from,
>>
>> 0x4e44-0x4e50 for GPIO outputs control register
>>
>> 0x4e51-0x4e5d for GPIO input control register
>>
>> But, currently when calculating the GPIO register offsets in to_reg()
>> function, all GPIO pins in the same bank uses the same GPIO control
>> register address. This logic is incorrect. This patch fixes this
>> issue.
>>
>> This patch also adds support to selectively skip register modification
>> for virtual GPIOs.
>>
>> In case of Whiskey Cove PMIC, ACPI code may use up 94 virtual GPIOs.
>> These virtual GPIOs are used by the ACPI code as means to access various
>> non GPIO bits of PMIC. So for these virtual GPIOs, we don't need to
>> manipulate the physical GPIO pin register. A similar patch has been
>> merged recently by Hans for Crystal Cove PMIC GPIO driver. You can
>> find more details about it in Commit 9a752b4c9ab9 ("gpio: crystalcove:
>> Do not write regular gpio registers for virtual GPIOs")
>>
>> Signed-off-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
>> Reported-by: Jukka Laitinen <jukka.laitinen@intel.com>
> It seems it should have a Fixes tag.
This issue exist from the first commit. Should I add fixes tag for it ?
>
>>   static inline unsigned int to_reg(int gpio, enum ctrl_register reg_type)
>>   {
>>          unsigned int reg;
>> -       int bank;
>>
>> -       if (gpio < BANK0_NR_PINS)
>> -               bank = 0;
>> -       else if (gpio < BANK0_NR_PINS + BANK1_NR_PINS)
>> -               bank = 1;
>> -       else
>> -               bank = 2;
>> +       if (gpio >= WCOVE_GPIO_NUM)
>> +               return -EOPNOTSUPP;
> How this can happen?
Whiskey Cove PMIC only has 13 real GPIO pins. But if you look at the 
gpio chip configuration in gpio-wcove.c driver, ngpio value is set as 94.

wg->chip.ngpio = WCOVE_VGPIO_NUM; // 94

So, 0 < gpio index < 13 are real GPIOs  and  13 <= gpio index <  94 are 
virtual GPIOs.  So for these virtual GPIOs we don't have any real 
configuration registers in the hardware. That's why we should skip 
register modifications for any GPIO pin index >= WCOVE_GPIO_NUM.


>>          if (reg_type == CTRL_IN)
>> -               reg = GPIO_IN_CTRL_BASE + bank;
>> +               /*
>> +                * GPIO input control registers
>> +                * (one per pin): 0x4e51 - 0x4e5d
>> +                */
> Noise.
Will remove it.
>
>> +               reg = GPIO_IN_CTRL_BASE + gpio;
>>          else
>> -               reg = GPIO_OUT_CTRL_BASE + bank;
>> +               /* GPIO output control registers
>> +                * (one per pin): 0x4e44 - 0x4e50
>> +                */
> Wrong multi-line comment and noise overall.
>
> If you wish to leave the comments, put them on top of the function as
> its description.
I will just remove it.
>
>> +               reg = GPIO_OUT_CTRL_BASE + gpio;
>>
>>          return reg;
>>   }
>> @@ -145,7 +147,10 @@ static void wcove_update_irq_mask(struct wcove_gpio *wg, int gpio)
>>
>>   static void wcove_update_irq_ctrl(struct wcove_gpio *wg, int gpio)
>>   {
>> -       unsigned int reg = to_reg(gpio, CTRL_IN);
>> +       int reg = to_reg(gpio, CTRL_IN);
>> +
>> +       if (reg < 0)
>> +               return;
> Since above comment this change would gone.
>
>> +       int reg = to_reg(gpio, CTRL_OUT);
>> +
>> +       if (reg < 0)
>> +               return 0;
>>
>> -       return regmap_write(wg->regmap, to_reg(gpio, CTRL_OUT),
>> -                           CTLO_INPUT_SET);
>> +       return regmap_write(wg->regmap, reg, CTLO_INPUT_SET);
> Ditto.
>
>> +       int reg = to_reg(gpio, CTRL_OUT);
>>
>> -       return regmap_write(wg->regmap, to_reg(gpio, CTRL_OUT),
>> -                           CTLO_OUTPUT_SET | value);
>> +       if (reg < 0)
>> +               return 0;
>> +
>> +       return regmap_write(wg->regmap, reg, CTLO_OUTPUT_SET | value);
> Ditto.
>
>> +       int ret, reg = to_reg(gpio, CTRL_OUT);
> Don't fit such variable on one line.
>
>> +
>> +       if (reg < 0)
>> +               return 0;
>>
>> -       ret = regmap_read(wg->regmap, to_reg(gpio, CTRL_OUT), &val);
>> +       ret = regmap_read(wg->regmap, reg, &val);
> This would gone after addressing first comment.
>
>> -       int ret;
>> +       int ret, reg = to_reg(gpio, CTRL_IN);
>> +
>> +       if (reg < 0)
>> +               return 0;
>>
>> -       ret = regmap_read(wg->regmap, to_reg(gpio, CTRL_IN), &val);
>> +       ret = regmap_read(wg->regmap, reg, &val);
> Ditto.
>
>> +       int reg = to_reg(gpio, CTRL_OUT);
>> +
>> +       if (reg < 0)
>> +               return;
>>
>>          if (value)
>> -               regmap_update_bits(wg->regmap, to_reg(gpio, CTRL_OUT), 1, 1);
>> +               regmap_update_bits(wg->regmap, reg, 1, 1);
>>          else
>> -               regmap_update_bits(wg->regmap, to_reg(gpio, CTRL_OUT), 1, 0);
>> +               regmap_update_bits(wg->regmap, reg, 1, 0);
> Ditto.
>
>> +       int reg = to_reg(gpio, CTRL_OUT);
>> +
>> +       if (reg < 0)
>> +               return 0;
>>
>>          switch (pinconf_to_config_param(config)) {
>>          case PIN_CONFIG_DRIVE_OPEN_DRAIN:
>> -               return regmap_update_bits(wg->regmap, to_reg(gpio, CTRL_OUT),
>> -                                               CTLO_DRV_MASK, CTLO_DRV_OD);
>> +               return regmap_update_bits(wg->regmap, reg, CTLO_DRV_MASK,
>> +                                         CTLO_DRV_OD);
>>          case PIN_CONFIG_DRIVE_PUSH_PULL:
>> -               return regmap_update_bits(wg->regmap, to_reg(gpio, CTRL_OUT),
>> -                                               CTLO_DRV_MASK, CTLO_DRV_CMOS);
>> +               return regmap_update_bits(wg->regmap, reg, CTLO_DRV_MASK,
>> +                                         CTLO_DRV_CMOS);
> Ditto.
>
>> +       if (data->hwirq >= WCOVE_GPIO_NUM)
>> +               return 0;
>> +
> How could it happen?
>
>> +       if (data->hwirq >= WCOVE_GPIO_NUM)
>> +               return;
> Ditto.
>
>> +       if (data->hwirq >= WCOVE_GPIO_NUM)
>> +               return;
> Ditto.
>

-- 
Sathyanarayanan Kuppuswamy
Linux kernel developer

