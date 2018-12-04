From: Florian Eckert <fe@dev.tdt.de>
Subject: Re: [PATCH v5 1/2] gpio: Add driver for PC Engines APU boards
Date: Tue, 04 Dec 2018 11:17:37 +0100
Message-ID: <9102ea20a4f7fec9021ea4e11570865a@dev.tdt.de>
References: <20181127132508.5501-1-fe@dev.tdt.de>
 <20181127132508.5501-2-fe@dev.tdt.de>
 <CAHp75Vc0-t=nBGPbYjbaJDoPEg77xKLVDuhUtFQ6imgnkNuz-g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAHp75Vc0-t=nBGPbYjbaJDoPEg77xKLVDuhUtFQ6imgnkNuz-g@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Eckert.Florian@googlemail.com, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org



> /*
>  * Multi-line comments
>  * have this style
>  */

fixed


>> +#include <linux/kernel.h>
> 
> kbuild bot complains for absence of
> 
> #include <linux/mod_devicetable.h>
> 
> here.
> 

fixed

>> +static int gpio_apu_get_dir(struct gpio_chip *chip, unsigned int 
>> offset)
>> +{
>> +       u32 val;
>> +       struct apu_gpio_pdata *apu_gpio = gpiochip_get_data(chip);
>> +
>> +       spin_lock(&apu_gpio->lock);
>> +
> 
>> +       val = ~ioread32(apu_gpio->addr[offset]);
> 
> There is no need to do ~ under spin lock.
> 

fixed

>> +
>> +       spin_unlock(&apu_gpio->lock);
>> +
>> +       return !!(val & BIT(APU_GPIO_BIT_DIR));
>> +}
> 
>> +       if (dmi_check_system(apu3_gpio_dmi_table)) {
> 
> (1)
> 
>> +               apu_gpio->addr = devm_kzalloc(&pdev->dev,
>> +                               sizeof(apu3_gpio_offset),
>> +                               GFP_KERNEL);
> 
>> +
> 
> No need to have this blank line. Same for the other cases.
> 

fixed

>> +               if (!apu_gpio->addr)
>> +                       return -ENOMEM;
> 
>> +       } else if (dmi_check_system(apu2_gpio_dmi_table)) {
> 
> (2)
> 
> I think I have already told about (1) and (2). You may create two
> callbacks and utilize .callback member in DMI table.
> 

Done but I do not seen any advantage. I used the following driver as 
basis.
https://github.com/torvalds/linux/blob/master/drivers/leds/leds-clevo-mail.c

>> +       }
> 
>> +static int __init apu_gpio_init(void)
>> +{
> 
>> +       if (!(dmi_check_system(apu2_gpio_dmi_table)) &&
>> +               !(dmi_check_system(apu3_gpio_dmi_table))) {
>> +               pr_err("No PC Engines board detected\n");
>> +               return -ENODEV;
>> +       }
> 
> I don't think we need this.
> 

see below


>> +}
>> +
>> +module_init(apu_gpio_init);
>> +module_exit(apu_gpio_exit);

> 
> After removing unneeded checks why not to simple use
> module_platform_driver()
> ?

I have fixed all the above hints from you now but using 
"module_platform_driver" is no option.
I played around with them but the driver does not find any device. So I 
need the init function
to add a platform device. Only if I do this way driver and device will 
find and match. And I
see the gpios under /sys/class/gpio. So I think I need this?
I have not find any driver who has the same problems
I used the following drivers as my basis:
https://github.com/torvalds/linux/blob/master/drivers/leds/leds-apu.c
https://github.com/torvalds/linux/blob/master/drivers/leds/leds-clevo-mail.c
They all use dmi and need init/exit for platform device register and 
unregister
