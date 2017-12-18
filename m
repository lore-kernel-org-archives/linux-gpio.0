From: "Maciej S. Szmigiero" <mail@maciej.szmigiero.name>
Subject: Re: [PATCH] gpio: winbond: add driver
Date: Tue, 19 Dec 2017 00:07:39 +0100
Message-ID: <73983ef2-ab7e-cc31-042e-d7831bb6fee0@maciej.szmigiero.name>
References: <f105bdb7-9b29-517f-1fb6-935ee9e2045c@maciej.szmigiero.name>
 <CACRpkdZAmUtPrh0Ku+vHbY-gYsCr4+3ORYuygtOaC6X0FNPVYA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from vps-vb.mhejs.net ([37.28.154.113]:35822 "EHLO vps-vb.mhejs.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S935324AbdLRXHm (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 18 Dec 2017 18:07:42 -0500
In-Reply-To: <CACRpkdZAmUtPrh0Ku+vHbY-gYsCr4+3ORYuygtOaC6X0FNPVYA@mail.gmail.com>
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: William Breathitt Gray <vilhelm.gray@gmail.com>, linux-kernel <linux-kernel@vger.kernel.org>, linux-gpio@vger.kernel.org

Hi Linus,

On 18.12.2017 22:22, Linus Walleij wrote:
> Hi Maciej!
> 
> Thanks for your patch!

Thanks for your review, see also my comments below.

> On Thu, Dec 14, 2017 at 11:05 PM, Maciej S. Szmigiero
> <mail@maciej.szmigiero.name> wrote:
> 
>> This commit adds GPIO driver for Winbond Super I/Os.
>>
>> Currently, only W83627UHG model (also known as Nuvoton NCT6627UD) is
>> supported but in the future a support for other Winbond models, too, can
>> be added to the driver.
>>
>> A module parameter "gpios" sets a bitmask of GPIO ports to enable (bit 0 is
>> GPIO1, bit 1 is GPIO2, etc.).
>> One should be careful which ports one tinkers with since some might be
>> managed by the firmware (for functions like powering on and off, sleeping,
>> BIOS recovery, etc.) and some of GPIO port pins are physically shared with
>> other devices included in the Super I/O chip.
>>
>> Signed-off-by: Maciej S. Szmigiero <mail@maciej.szmigiero.name>
> 
> As this is a ioport-based driver I'd like William Breathitt Gray to
> help reviewing it. He knows this stuff.
> 
> Add a license tag at the top of the file like this:
> 
> // SPDX-License-Identifier: GPL-2.0
>
> It is part of our new dance.

Will do.

> 
>> +#include <linux/errno.h>
>> +#include <linux/gpio.h>
> 
> Only:
> 
> #include <linux/driver.h>

Will do.

>> +static int gpiobase = -1; /* dynamic */
> 
> Don't make this configurable.

Will do.

>> +static uint8_t gpios;
>> +static uint8_t ppgpios;
>> +static uint8_t odgpios;
> 
> Just use u8 unless you can tell me why I have to
> switch it everywhere. Use u8, u16, u32 everywhere in place
> of these, change globally.

Will do.

>> +static bool pledgpio;
>> +static bool beepgpio;
>> +static bool i2cgpio;
>> +
>> +static int winbond_sio_enter(uint16_t base)
> 
> And u16 as argument.

Will do.

>> +static void winbond_sio_reg_bclear(uint16_t base, uint8_t reg, uint8_t bit)
>> +{
>> +       uint8_t val;
>> +
>> +       val = winbond_sio_reg_read(base, reg);
>> +       val &= ~BIT(bit);
>> +       winbond_sio_reg_write(base, reg, val);
> 
> This kind of construction make me feel like we should have
> an ioport regmap. But no requirement for this driver.
> 
>> +struct winbond_gpio_info {
>> +       uint8_t dev;
>> +       uint8_t ioreg;
>> +       uint8_t invreg;
>> +       uint8_t datareg;
>> +};
> 
> Add kerneldoc to this struct please.

Will do.

>> +static const struct winbond_gpio_info winbond_gpio_infos[6] = {
>> +       { .dev = WB_SIO_DEV_GPIO12, .ioreg = WB_SIO_GPIO12_REG_IO1,
>> +         .invreg = WB_SIO_GPIO12_REG_INV1,
>> +         .datareg = WB_SIO_GPIO12_REG_DATA1 },
> 
> Please break these up a bit:
> 
> {
>     .dev = WB_SIO_DEV_GPIO12,
>     .ioreg = WB_SIO_GPIO12_REG_IO1,
>     .invreg = WB_SIO_GPIO12_REG_INV1,
>     .datareg = WB_SIO_GPIO12_REG_DATA1,
> },
> 

Will do.

>> +/* returns whether changing a pin is allowed */
>> +static bool winbond_gpio_get_info(unsigned int gpio_num,
>> +                                 const struct winbond_gpio_info **info)
>> +{
>> +       bool allow_changing = true;
>> +       unsigned int i;
>> +
>> +       for (i = 0; i < ARRAY_SIZE(winbond_gpio_infos); i++) {
>> +               if (!(gpios & BIT(i)))
>> +                       continue;
>> +
>> +               if (gpio_num < 8)
>> +                       break;
>> +
>> +               gpio_num -= 8;
>> +       }
>> +
> 
> Add a comment here explaining why we warn on this.

(Guess you meant the warning below) Will do.

>> +       if (WARN_ON(i >= ARRAY_SIZE(winbond_gpio_infos)))
>> +               i = 0;
>> +
>> +       *info = &winbond_gpio_infos[i];
>> +
> 
> Add comment here explaining what is going on.

(Guess you meant the 'if' block below) Will do.

>> +       if (i == 1) {
>> +               if (gpio_num == 0 && !pledgpio)
>> +                       allow_changing = false;
>> +               else if (gpio_num == 1 && !beepgpio)
>> +                       allow_changing = false;
>> +               else if ((gpio_num == 5 || gpio_num == 6) && !i2cgpio)
>> +                       allow_changing = false;
>> +       }
>> +
>> +       return allow_changing;
>> +}
> 
> (...)
> 
>> +static struct gpio_chip winbond_gpio_chip = {
>> +       .label                  = WB_GPIO_DRIVER_NAME,
>> +       .owner                  = THIS_MODULE,
>> +       .can_sleep              = true,
> 
> Why can this ioport driver sleep?

This driver shares a I/O port with other drivers accessing a Super I/O
chip via request_muxed_region().
This function can sleep.

> 
>> +static int winbond_gpio_probe(struct platform_device *pdev)
>> +{
>> +       uint16_t *base = dev_get_platdata(&pdev->dev);
>> +       unsigned int i;
>> +
>> +       if (base == NULL)
>> +               return -EINVAL;
>> +
> 
> Add a comment explaining how the GPIO lines are detected here.

Will do.
 
>> +       winbond_gpio_chip.ngpio = 0;
>> +       for (i = 0; i < 5; i++)
>> +               if (gpios & BIT(i))
>> +                       winbond_gpio_chip.ngpio += 8;
>> +
>> +       if (gpios & BIT(5))
>> +               winbond_gpio_chip.ngpio += 5;
>> +
>> +       winbond_gpio_chip.base = gpiobase;
>> +       winbond_gpio_chip.parent = &pdev->dev;
>> +
>> +       return devm_gpiochip_add_data(&pdev->dev, &winbond_gpio_chip, base);
>> +}
>> +
>> +static void winbond_gpio_warn_conflict(unsigned int idx, const char *otherdev)
>> +{
>> +       pr_warn(WB_GPIO_DRIVER_NAME
>> +               ": enabled GPIO%u share pins with active %s\n", idx + 1,
>> +               otherdev);
>> +}
> 
> I don't understand this otherdev business, is it pin multiplexing?

Yes, some GPIO pins are shared with some other devices and functions.

But this is a x86 Super I/O chip so we don't really have a general
ability to detect which should be configured how (and a BIOS might not
have configured pins that it didn't care about correctly).

So the only practical way is to have an user tell us which GPIO devices
he wants to use and then enable only these (maybe stealing pins from
other devices).

>> +static void winbond_gpio_configure_common(uint16_t base, unsigned int idx,
>> +                                         uint8_t dev, uint8_t enable_reg,
>> +                                         uint8_t enable_bit,
>> +                                         uint8_t output_reg,
>> +                                         uint8_t output_pp_bit)
>> +{
>> +       winbond_sio_select_logical(base, dev);
>> +
>> +       winbond_sio_reg_bset(base, enable_reg, enable_bit);
>> +
>> +       if (ppgpios & BIT(idx))
>> +               winbond_sio_reg_bset(base, output_reg,
>> +                                    output_pp_bit);
>> +       else if (odgpios & BIT(idx))
>> +               winbond_sio_reg_bclear(base, output_reg,
>> +                                      output_pp_bit);
>> +       else
>> +               pr_notice(WB_GPIO_DRIVER_NAME ": GPIO%u pins are %s\n", idx + 1,
>> +                         winbond_sio_reg_btest(base, output_reg,
>> +                                               output_pp_bit) ?
>> +                         "push-pull" :
>> +                         "open drain");
> 
> If your hardware supports open drain then implement .set_config() for
> it in the gpio_chip so you can use the hardware open drain with the driver.

The problem here is that the device doesn't support per-pin
output driver configuration, only per-GPIO device (8 pins)
configuration.

I think that implementing this method would be kind of like advertising
a capability that the device doesn't have.

>> +static void winbond_gpio_configure_0(uint16_t base)
> 
> This is an awkward name for a function. Give it some semantically
> reasonable name please.
> 
> winbond_gpio_configure_uartb()?

UARTB is a device that the first GPIO device conflicts with.
Should it give a name to this GPIO device configuration function?

Datasheet calls this device just "GPIO1" (the driver uses zero-based
index internally, however).

> 
>> +{
>> +       uint8_t val;
>> +
>> +       if (!(gpios & BIT(0)))
>> +               return;
>> +
>> +       winbond_sio_select_logical(base, WB_SIO_DEV_UARTB);
>> +       if (winbond_sio_reg_btest(base, WB_SIO_UARTB_REG_ENABLE,
>> +                                 WB_SIO_UARTB_ENABLE_ON))
>> +               winbond_gpio_warn_conflict(0, "UARTB");
>> +
>> +       val = winbond_sio_reg_read(base, WB_SIO_REG_GPIO1_MF);
>> +       if ((val & WB_SIO_REG_G1MF_FS) != WB_SIO_REG_G1MF_FS_GPIO1) {
>> +               pr_warn(WB_GPIO_DRIVER_NAME
>> +                       ": GPIO1 pins were connected to something else (%.2x), fixing\n",
>> +                       (unsigned int)val);
>> +
>> +               val &= ~WB_SIO_REG_G1MF_FS;
>> +               val |= WB_SIO_REG_G1MF_FS_GPIO1;
>> +
>> +               winbond_sio_reg_write(base, WB_SIO_REG_GPIO1_MF, val);
>> +       }
>> +
>> +       winbond_gpio_configure_common(base, 0, WB_SIO_DEV_GPIO12,
>> +                                     WB_SIO_GPIO12_REG_ENABLE,
>> +                                     WB_SIO_GPIO12_ENABLE_1,
>> +                                     WB_SIO_REG_GPIO1_MF,
>> +                                     WB_SIO_REG_G1MF_G1PP);
>> +}
>> +
>> +static void winbond_gpio_configure_1(uint16_t base)
> 
> Same here. 0, 1? I don't get it.
> 
> winbond_gpio_configure_i2cgpio()?

Same issue, should a fact that I2C conflicts with two pins of this GPIO
device give its configuration function a "I2C" name?

>> +{
>> +       if (!(gpios & BIT(1)))
>> +               return;
>> +
>> +       i2cgpio = !winbond_sio_reg_btest(base, WB_SIO_REG_I2C_PS,
>> +                                        WB_SIO_REG_I2CPS_I2CFS);
>> +       if (!i2cgpio)
>> +               pr_warn(WB_GPIO_DRIVER_NAME
>> +                       ": disabling GPIO2.5 and GPIO2.6 as I2C is enabled\n");
>> +
>> +       winbond_gpio_configure_common(base, 1, WB_SIO_DEV_GPIO12,
>> +                                     WB_SIO_GPIO12_REG_ENABLE,
>> +                                     WB_SIO_GPIO12_ENABLE_2,
>> +                                     WB_SIO_REG_GPIO1_MF,
>> +                                     WB_SIO_REG_G1MF_G2PP);
>> +}
>> +
>> +static void winbond_gpio_configure_2(uint16_t base)
> 
> Etc.
> 
>> +{
>> +       if (!(gpios & BIT(2)))
>> +               return;
>> +
>> +       winbond_sio_select_logical(base, WB_SIO_DEV_UARTC);
>> +       if (winbond_sio_reg_btest(base, WB_SIO_UARTC_REG_ENABLE,
>> +                                 WB_SIO_UARTC_ENABLE_ON))
>> +               winbond_gpio_warn_conflict(2, "UARTC");
>> +
>> +       winbond_gpio_configure_common(base, 2, WB_SIO_DEV_GPIO34,
>> +                                     WB_SIO_GPIO34_REG_ENABLE,
>> +                                     WB_SIO_GPIO34_ENABLE_3,
>> +                                     WB_SIO_REG_OVTGPIO3456,
>> +                                     WB_SIO_REG_OG3456_G3PP);
>> +}
>> +
>> +static void winbond_gpio_configure_3(uint16_t base)
> 
> Etc.
> 
>> +{
>> +       if (!(gpios & BIT(3)))
>> +               return;
>> +
>> +       winbond_sio_select_logical(base, WB_SIO_DEV_UARTD);
>> +       if (winbond_sio_reg_btest(base, WB_SIO_UARTD_REG_ENABLE,
>> +                                 WB_SIO_UARTD_ENABLE_ON))
>> +               winbond_gpio_warn_conflict(3, "UARTD");
>> +
>> +       winbond_gpio_configure_common(base, 3, WB_SIO_DEV_GPIO34,
>> +                                     WB_SIO_GPIO34_REG_ENABLE,
>> +                                     WB_SIO_GPIO34_ENABLE_4,
>> +                                     WB_SIO_REG_OVTGPIO3456,
>> +                                     WB_SIO_REG_OG3456_G4PP);
>> +}
>> +
>> +static void winbond_gpio_configure_4(uint16_t base)
> 
> Etc.
> 
> We are starting to see code duplication. It needs to be made into
> some kind of table.
> 
>> +{
>> +       if (!(gpios & BIT(4)))
>> +               return;
>> +
>> +       winbond_sio_select_logical(base, WB_SIO_DEV_UARTE);
>> +       if (winbond_sio_reg_btest(base, WB_SIO_UARTE_REG_ENABLE,
>> +                                 WB_SIO_UARTE_ENABLE_ON))
>> +               winbond_gpio_warn_conflict(4, "UARTE");
>> +
>> +       winbond_gpio_configure_common(base, 4, WB_SIO_DEV_WDGPIO56,
>> +                                     WB_SIO_WDGPIO56_REG_ENABLE,
>> +                                     WB_SIO_WDGPIO56_ENABLE_5,
>> +                                     WB_SIO_REG_OVTGPIO3456,
>> +                                     WB_SIO_REG_OG3456_G5PP);
>> +}
>> +
>> +static void winbond_gpio_configure_5(uint16_t base)
> 
> Yeah... a table :)
> 
>> +{
>> +       if (!(gpios & BIT(5)))
>> +               return;
>> +
>> +       if (winbond_sio_reg_btest(base, WB_SIO_REG_GLOBAL_OPT,
>> +                                 WB_SIO_REG_GO_ENFDC)) {
>> +               pr_warn(WB_GPIO_DRIVER_NAME
>> +                       ": disabling GPIO6 as FDC is enabled\n");
>> +
>> +               gpios &= ~BIT(5);
>> +               return;
>> +       }
>> +
>> +       winbond_gpio_configure_common(base, 5, WB_SIO_DEV_WDGPIO56,
>> +                                     WB_SIO_WDGPIO56_REG_ENABLE,
>> +                                     WB_SIO_WDGPIO56_ENABLE_6,
>> +                                     WB_SIO_REG_OVTGPIO3456,
>> +                                     WB_SIO_REG_OG3456_G6PP);
>> +}
>> +
>> +static int winbond_gpio_configure(uint16_t base)
>> +{
>> +       winbond_gpio_configure_0(base);
>> +       winbond_gpio_configure_1(base);
>> +       winbond_gpio_configure_2(base);
>> +       winbond_gpio_configure_3(base);
>> +       winbond_gpio_configure_4(base);
>> +       winbond_gpio_configure_5(base);
> 
> So figure out some way to not have 6 similar functions but parameterize
> the functions somehow with some struct or so?

Please note that all these 6 functions share only 3 lines of a
boilerplate code:
>> +       if (!(gpios & BIT(x)))
>> +               return;

and: 
>> +       winbond_gpio_configure_common(base, x, WB_SIO_DEV_FOO,
>> +                                     WB_SIO_BAR,
>> +                                     WB_SIO_XXX,
>> +                                     WB_SIO_YYY,
>> +                                     WB_SIO_ZZZ);
(Okay, that's technically a more than one line, but only due to line
wrapping).

Devices 0, 2, 3, 4 share additional three lines:
>> +       winbond_sio_select_logical(base, WB_SIO_DEV_FOO);

and:
>> +       if (winbond_sio_reg_btest(base, WB_SIO_XXX,
>> +                                 WB_SIO_YYY))
>> +               winbond_gpio_warn_conflict(x, "FOO");

Rest of the code is unique for a particular GPIO device and
the code common for all these devices is already in
winbond_gpio_configure_common().

Naturally, it can be made into a one, parametrized function, but at a
cost of adding a few additional "if" blocks inside - won't that make it
less readable than separate ones?

> 
>> +       if (!(gpios & (BIT(5 + 1) - 1))) {
>> +               pr_err(WB_GPIO_DRIVER_NAME
>> +                      ": please use 'gpios' module parameter to select some active GPIO ports to enable\n");
>> +               return -EINVAL;
>> +       }
>> +
>> +       return 0;
>> +}
>> +
>> +static struct platform_device *winbond_gpio_pdev;
> 
> Hm I guess this is needed with ISA devices.
> 
>> +static int winbond_gpio_init_one(uint16_t base)
> 
> One... GPIO device? Put in some more info in the function name.
> 

Will do.

>> +module_param(gpiobase, int, 0444);
>> +MODULE_PARM_DESC(gpiobase,
>> +                "number of the first GPIO to register. default is -1, that is, dynamically allocated.");
> 
> Drop this. We don't support hammering down the GPIO base.
> Not anymore.

Will do.

>> +module_param(gpios, byte, 0444);
>> +MODULE_PARM_DESC(gpios,
>> +                "bitmask of GPIO ports to enable (bit 0 - GPIO1, bit 1 - GPIO2, etc.");
>> +

This sets which GPIO devices (ports) we enable.

>> +module_param(ppgpios, byte, 0444);
>> +MODULE_PARM_DESC(ppgpios,
>> +                "bitmask of GPIO ports to set to push-pull mode (bit 0 - GPIO1, bit 1 - GPIO2, etc.");
>> +
>> +module_param(odgpios, byte, 0444);
>> +MODULE_PARM_DESC(odgpios,
>> +                "bitmask of GPIO ports to set to open drain mode (bit 0 - GPIO1, bit 1 - GPIO2, etc.");

These two above configure which GPIO devices (ports) we enable.
It can't be a one bitmask since we need three values per port: push-pull,
open-drain and keep as-is.

>> +module_param(pledgpio, bool, 0644);
>> +MODULE_PARM_DESC(pledgpio,
>> +                "enable changing value of GPIO2.0 bit (Power LED), default no.");
>> +
>> +module_param(beepgpio, bool, 0644);
>> +MODULE_PARM_DESC(beepgpio,
>> +                "enable changing value of GPIO2.1 bit (BEEP), default no.");

These two control a basic PC functionality that I don't think we should
allow tinkering with by default (it is very likely that the firmware
owns these pins).

Of course, this can be rolled into one "flags" parameter but I think
this is a cleaner interface.

> This is an awful lot of module parameters.
> 
> Why do we need so many?

I've described their meanings above.

> Yours,
> Linus Walleij
> 

Best regards,
Maciej Szmigiero
