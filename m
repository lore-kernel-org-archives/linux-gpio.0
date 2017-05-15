From: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH] gpio: crystalcove: Do not write regular gpio registers
 for virtual GPIOs
Date: Mon, 15 May 2017 19:10:25 +0200
Message-ID: <7a87b747-e187-0592-5415-815e8bd5b4ac@redhat.com>
References: <20170513123953.22142-1-hdegoede@redhat.com>
 <1494838625.6967.48.camel@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:47560 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751364AbdEORKf (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 15 May 2017 13:10:35 -0400
In-Reply-To: <1494838625.6967.48.camel@linux.intel.com>
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: linux-gpio@vger.kernel.org, Aaron Lu <aaron.lu@intel.com>

Hi,

On 15-05-17 10:57, Andy Shevchenko wrote:
> On Sat, 2017-05-13 at 14:39 +0200, Hans de Goede wrote:
>> The Crystal Cove PMIC has 16 real GPIOs but the ACPI code for devices
>> with this PMIC may address up to 95 GPIOs, these extra GPIOs are
>> called virtual GPIOs and are used by the ACPI code as a method of
>> accessing various non GPIO bits of PMIC.
>>
>> Commit dcdc3018d635 ("gpio: crystalcove: support virtual GPIO") added
>> dummy support for these to avoid a bunch of ACPI errors, but instead
>> of
>> ignoring writes / reads to them by doing:
>>
>> if (gpio >= CRYSTALCOVE_GPIO_NUM)
>> 	return 0;
>>
>> It accidentally introduced the following wrong check:
>>
>> if (gpio > CRYSTALCOVE_VGPIO_NUM)
>> 	return 0;
>>
>> Which means that attempts by the ACPI code to access these gpios
>> causes some arbitrary gpio to get touched through for example
>> GPIO1P0CTLO + gpionr % 8.
>>
>> Since we do support input/output (but not interrupts) on the 0x5e
>> virtual GPIO, this commit makes to_reg return -ENOTSUPP for
>> unsupported
>> virtual GPIOs so as to not have to check for (gpio >=
>> CRYSTALCOVE_GPIO_NUM
>> && gpio != 0x5e) everywhere and to make it easier to add support for
>> more
>> virtual GPIOs in the future.
>>
>> It then adds a check for to_reg returning an error to all callers
>> where
>> this may happen fixing the ACPI code accessing virtual GPIOs
>> accidentally
>> causing changes to real GPIOs.
> 
> Looks fine to me.
> FWIW:
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Thank you.

> P.S. Should it have Fixes tag?

I guess that a:

Fixes: dcdc3018d635 ("gpio: crystalcove: support virtual GPIO")

Might be a good idea to add when merging.

Regards,

Hans




> 
>>
>> Cc: Aaron Lu <aaron.lu@intel.com>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>>   drivers/gpio/gpio-crystalcove.c | 54 +++++++++++++++++++++++++++-----
>> ---------
>>   1 file changed, 36 insertions(+), 18 deletions(-)
>>
>> diff --git a/drivers/gpio/gpio-crystalcove.c b/drivers/gpio/gpio-
>> crystalcove.c
>> index 2197368cc899..e60156ec0c18 100644
>> --- a/drivers/gpio/gpio-crystalcove.c
>> +++ b/drivers/gpio/gpio-crystalcove.c
>> @@ -90,8 +90,18 @@ static inline int to_reg(int gpio, enum
>> ctrl_register reg_type)
>>   {
>>   	int reg;
>>   
>> -	if (gpio == 94)
>> -		return GPIOPANELCTL;
>> +	if (gpio >= CRYSTALCOVE_GPIO_NUM) {
>> +		/*
>> +		 * Virtual GPIO called from ACPI, for now we only
>> support
>> +		 * the panel ctl.
>> +		 */
>> +		switch (gpio) {
>> +		case 0x5e:
>> +			return GPIOPANELCTL;
>> +		default:
>> +			return -EOPNOTSUPP;
>> +		}
>> +	}
>>   
>>   	if (reg_type == CTRL_IN) {
>>   		if (gpio < 8)
>> @@ -130,36 +140,36 @@ static void crystalcove_update_irq_ctrl(struct
>> crystalcove_gpio *cg, int gpio)
>>   static int crystalcove_gpio_dir_in(struct gpio_chip *chip, unsigned
>> gpio)
>>   {
>>   	struct crystalcove_gpio *cg = gpiochip_get_data(chip);
>> +	int reg = to_reg(gpio, CTRL_OUT);
>>   
>> -	if (gpio > CRYSTALCOVE_VGPIO_NUM)
>> +	if (reg < 0)
>>   		return 0;
>>   
>> -	return regmap_write(cg->regmap, to_reg(gpio, CTRL_OUT),
>> -			    CTLO_INPUT_SET);
>> +	return regmap_write(cg->regmap, reg, CTLO_INPUT_SET);
>>   }
>>   
>>   static int crystalcove_gpio_dir_out(struct gpio_chip *chip, unsigned
>> gpio,
>>   				    int value)
>>   {
>>   	struct crystalcove_gpio *cg = gpiochip_get_data(chip);
>> +	int reg = to_reg(gpio, CTRL_OUT);
>>   
>> -	if (gpio > CRYSTALCOVE_VGPIO_NUM)
>> +	if (reg < 0)
>>   		return 0;
>>   
>> -	return regmap_write(cg->regmap, to_reg(gpio, CTRL_OUT),
>> -			    CTLO_OUTPUT_SET | value);
>> +	return regmap_write(cg->regmap, reg, CTLO_OUTPUT_SET |
>> value);
>>   }
>>   
>>   static int crystalcove_gpio_get(struct gpio_chip *chip, unsigned
>> gpio)
>>   {
>>   	struct crystalcove_gpio *cg = gpiochip_get_data(chip);
>> -	int ret;
>>   	unsigned int val;
>> +	int ret, reg = to_reg(gpio, CTRL_IN);
>>   
>> -	if (gpio > CRYSTALCOVE_VGPIO_NUM)
>> +	if (reg < 0)
>>   		return 0;
>>   
>> -	ret = regmap_read(cg->regmap, to_reg(gpio, CTRL_IN), &val);
>> +	ret = regmap_read(cg->regmap, reg, &val);
>>   	if (ret)
>>   		return ret;
>>   
>> @@ -170,14 +180,15 @@ static void crystalcove_gpio_set(struct
>> gpio_chip *chip,
>>   				 unsigned gpio, int value)
>>   {
>>   	struct crystalcove_gpio *cg = gpiochip_get_data(chip);
>> +	int reg = to_reg(gpio, CTRL_OUT);
>>   
>> -	if (gpio > CRYSTALCOVE_VGPIO_NUM)
>> +	if (reg < 0)
>>   		return;
>>   
>>   	if (value)
>> -		regmap_update_bits(cg->regmap, to_reg(gpio,
>> CTRL_OUT), 1, 1);
>> +		regmap_update_bits(cg->regmap, reg, 1, 1);
>>   	else
>> -		regmap_update_bits(cg->regmap, to_reg(gpio,
>> CTRL_OUT), 1, 0);
>> +		regmap_update_bits(cg->regmap, reg, 1, 0);
>>   }
>>   
>>   static int crystalcove_irq_type(struct irq_data *data, unsigned type)
>> @@ -185,6 +196,9 @@ static int crystalcove_irq_type(struct irq_data
>> *data, unsigned type)
>>   	struct crystalcove_gpio *cg =
>>   		gpiochip_get_data(irq_data_get_irq_chip_data(data));
>>   
>> +	if (data->hwirq >= CRYSTALCOVE_GPIO_NUM)
>> +		return 0;
>> +
>>   	switch (type) {
>>   	case IRQ_TYPE_NONE:
>>   		cg->intcnt_value = CTLI_INTCNT_DIS;
>> @@ -235,8 +249,10 @@ static void crystalcove_irq_unmask(struct
>> irq_data *data)
>>   	struct crystalcove_gpio *cg =
>>   		gpiochip_get_data(irq_data_get_irq_chip_data(data));
>>   
>> -	cg->set_irq_mask = false;
>> -	cg->update |= UPDATE_IRQ_MASK;
>> +	if (data->hwirq < CRYSTALCOVE_GPIO_NUM) {
>> +		cg->set_irq_mask = false;
>> +		cg->update |= UPDATE_IRQ_MASK;
>> +	}
>>   }
>>   
>>   static void crystalcove_irq_mask(struct irq_data *data)
>> @@ -244,8 +260,10 @@ static void crystalcove_irq_mask(struct irq_data
>> *data)
>>   	struct crystalcove_gpio *cg =
>>   		gpiochip_get_data(irq_data_get_irq_chip_data(data));
>>   
>> -	cg->set_irq_mask = true;
>> -	cg->update |= UPDATE_IRQ_MASK;
>> +	if (data->hwirq < CRYSTALCOVE_GPIO_NUM) {
>> +		cg->set_irq_mask = true;
>> +		cg->update |= UPDATE_IRQ_MASK;
>> +	}
>>   }
>>   
>>   static struct irq_chip crystalcove_irqchip = {
> 
