From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: winbond: add driver
Date: Mon, 18 Dec 2017 22:22:12 +0100
Message-ID: <CACRpkdZAmUtPrh0Ku+vHbY-gYsCr4+3ORYuygtOaC6X0FNPVYA@mail.gmail.com>
References: <f105bdb7-9b29-517f-1fb6-935ee9e2045c@maciej.szmigiero.name>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f41.google.com ([209.85.214.41]:40454 "EHLO
        mail-it0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932927AbdLRVWO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 18 Dec 2017 16:22:14 -0500
Received: by mail-it0-f41.google.com with SMTP id f190so339750ita.5
        for <linux-gpio@vger.kernel.org>; Mon, 18 Dec 2017 13:22:14 -0800 (PST)
In-Reply-To: <f105bdb7-9b29-517f-1fb6-935ee9e2045c@maciej.szmigiero.name>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: "Maciej S. Szmigiero" <mail@maciej.szmigiero.name>, William Breathitt Gray <vilhelm.gray@gmail.com>
Cc: linux-kernel <linux-kernel@vger.kernel.org>, linux-gpio@vger.kernel.org

Hi Maciej!

Thanks for your patch!

On Thu, Dec 14, 2017 at 11:05 PM, Maciej S. Szmigiero
<mail@maciej.szmigiero.name> wrote:

> This commit adds GPIO driver for Winbond Super I/Os.
>
> Currently, only W83627UHG model (also known as Nuvoton NCT6627UD) is
> supported but in the future a support for other Winbond models, too, can
> be added to the driver.
>
> A module parameter "gpios" sets a bitmask of GPIO ports to enable (bit 0 is
> GPIO1, bit 1 is GPIO2, etc.).
> One should be careful which ports one tinkers with since some might be
> managed by the firmware (for functions like powering on and off, sleeping,
> BIOS recovery, etc.) and some of GPIO port pins are physically shared with
> other devices included in the Super I/O chip.
>
> Signed-off-by: Maciej S. Szmigiero <mail@maciej.szmigiero.name>

As this is a ioport-based driver I'd like William Breathitt Gray to
help reviewing it. He knows this stuff.

Add a license tag at the top of the file like this:

// SPDX-License-Identifier: GPL-2.0

It is part of our new dance.

> +#include <linux/errno.h>
> +#include <linux/gpio.h>

Only:

#include <linux/driver.h>

> +static int gpiobase = -1; /* dynamic */

Don't make this configurable.

> +static uint8_t gpios;
> +static uint8_t ppgpios;
> +static uint8_t odgpios;

Just use u8 unless you can tell me why I have to
switch it everywhere. Use u8, u16, u32 everywhere in place
of these, change globally.

> +static bool pledgpio;
> +static bool beepgpio;
> +static bool i2cgpio;
> +
> +static int winbond_sio_enter(uint16_t base)

And u16 as argument.

> +static void winbond_sio_reg_bclear(uint16_t base, uint8_t reg, uint8_t bit)
> +{
> +       uint8_t val;
> +
> +       val = winbond_sio_reg_read(base, reg);
> +       val &= ~BIT(bit);
> +       winbond_sio_reg_write(base, reg, val);

This kind of construction make me feel like we should have
an ioport regmap. But no requirement for this driver.

> +struct winbond_gpio_info {
> +       uint8_t dev;
> +       uint8_t ioreg;
> +       uint8_t invreg;
> +       uint8_t datareg;
> +};

Add kerneldoc to this struct please.

> +static const struct winbond_gpio_info winbond_gpio_infos[6] = {
> +       { .dev = WB_SIO_DEV_GPIO12, .ioreg = WB_SIO_GPIO12_REG_IO1,
> +         .invreg = WB_SIO_GPIO12_REG_INV1,
> +         .datareg = WB_SIO_GPIO12_REG_DATA1 },

Please break these up a bit:

{
    .dev = WB_SIO_DEV_GPIO12,
    .ioreg = WB_SIO_GPIO12_REG_IO1,
    .invreg = WB_SIO_GPIO12_REG_INV1,
    .datareg = WB_SIO_GPIO12_REG_DATA1,
},


> +/* returns whether changing a pin is allowed */
> +static bool winbond_gpio_get_info(unsigned int gpio_num,
> +                                 const struct winbond_gpio_info **info)
> +{
> +       bool allow_changing = true;
> +       unsigned int i;
> +
> +       for (i = 0; i < ARRAY_SIZE(winbond_gpio_infos); i++) {
> +               if (!(gpios & BIT(i)))
> +                       continue;
> +
> +               if (gpio_num < 8)
> +                       break;
> +
> +               gpio_num -= 8;
> +       }
> +

Add a comment here explaining why we warn on this.

> +       if (WARN_ON(i >= ARRAY_SIZE(winbond_gpio_infos)))
> +               i = 0;
> +
> +       *info = &winbond_gpio_infos[i];
> +

Add comment here explaining what is going on.

> +       if (i == 1) {
> +               if (gpio_num == 0 && !pledgpio)
> +                       allow_changing = false;
> +               else if (gpio_num == 1 && !beepgpio)
> +                       allow_changing = false;
> +               else if ((gpio_num == 5 || gpio_num == 6) && !i2cgpio)
> +                       allow_changing = false;
> +       }
> +
> +       return allow_changing;
> +}

(...)

> +static struct gpio_chip winbond_gpio_chip = {
> +       .label                  = WB_GPIO_DRIVER_NAME,
> +       .owner                  = THIS_MODULE,
> +       .can_sleep              = true,

Why can this ioport driver sleep?

> +static int winbond_gpio_probe(struct platform_device *pdev)
> +{
> +       uint16_t *base = dev_get_platdata(&pdev->dev);
> +       unsigned int i;
> +
> +       if (base == NULL)
> +               return -EINVAL;
> +

Add a comment explaining how the GPIO lines are detected here.

> +       winbond_gpio_chip.ngpio = 0;
> +       for (i = 0; i < 5; i++)
> +               if (gpios & BIT(i))
> +                       winbond_gpio_chip.ngpio += 8;
> +
> +       if (gpios & BIT(5))
> +               winbond_gpio_chip.ngpio += 5;
> +
> +       winbond_gpio_chip.base = gpiobase;
> +       winbond_gpio_chip.parent = &pdev->dev;
> +
> +       return devm_gpiochip_add_data(&pdev->dev, &winbond_gpio_chip, base);
> +}
> +
> +static void winbond_gpio_warn_conflict(unsigned int idx, const char *otherdev)
> +{
> +       pr_warn(WB_GPIO_DRIVER_NAME
> +               ": enabled GPIO%u share pins with active %s\n", idx + 1,
> +               otherdev);
> +}

I don't understand this otherdev business, is it pin multiplexing?

> +static void winbond_gpio_configure_common(uint16_t base, unsigned int idx,
> +                                         uint8_t dev, uint8_t enable_reg,
> +                                         uint8_t enable_bit,
> +                                         uint8_t output_reg,
> +                                         uint8_t output_pp_bit)
> +{
> +       winbond_sio_select_logical(base, dev);
> +
> +       winbond_sio_reg_bset(base, enable_reg, enable_bit);
> +
> +       if (ppgpios & BIT(idx))
> +               winbond_sio_reg_bset(base, output_reg,
> +                                    output_pp_bit);
> +       else if (odgpios & BIT(idx))
> +               winbond_sio_reg_bclear(base, output_reg,
> +                                      output_pp_bit);
> +       else
> +               pr_notice(WB_GPIO_DRIVER_NAME ": GPIO%u pins are %s\n", idx + 1,
> +                         winbond_sio_reg_btest(base, output_reg,
> +                                               output_pp_bit) ?
> +                         "push-pull" :
> +                         "open drain");

If your hardware supports open drain then implement .set_config() for
it in the gpio_chip so you can use the hardware open drain with the driver.

> +static void winbond_gpio_configure_0(uint16_t base)

This is an awkward name for a function. Give it some semantically
reasonable name please.

winbond_gpio_configure_uartb()?

> +{
> +       uint8_t val;
> +
> +       if (!(gpios & BIT(0)))
> +               return;
> +
> +       winbond_sio_select_logical(base, WB_SIO_DEV_UARTB);
> +       if (winbond_sio_reg_btest(base, WB_SIO_UARTB_REG_ENABLE,
> +                                 WB_SIO_UARTB_ENABLE_ON))
> +               winbond_gpio_warn_conflict(0, "UARTB");
> +
> +       val = winbond_sio_reg_read(base, WB_SIO_REG_GPIO1_MF);
> +       if ((val & WB_SIO_REG_G1MF_FS) != WB_SIO_REG_G1MF_FS_GPIO1) {
> +               pr_warn(WB_GPIO_DRIVER_NAME
> +                       ": GPIO1 pins were connected to something else (%.2x), fixing\n",
> +                       (unsigned int)val);
> +
> +               val &= ~WB_SIO_REG_G1MF_FS;
> +               val |= WB_SIO_REG_G1MF_FS_GPIO1;
> +
> +               winbond_sio_reg_write(base, WB_SIO_REG_GPIO1_MF, val);
> +       }
> +
> +       winbond_gpio_configure_common(base, 0, WB_SIO_DEV_GPIO12,
> +                                     WB_SIO_GPIO12_REG_ENABLE,
> +                                     WB_SIO_GPIO12_ENABLE_1,
> +                                     WB_SIO_REG_GPIO1_MF,
> +                                     WB_SIO_REG_G1MF_G1PP);
> +}
> +
> +static void winbond_gpio_configure_1(uint16_t base)

Same here. 0, 1? I don't get it.

winbond_gpio_configure_i2cgpio()?

> +{
> +       if (!(gpios & BIT(1)))
> +               return;
> +
> +       i2cgpio = !winbond_sio_reg_btest(base, WB_SIO_REG_I2C_PS,
> +                                        WB_SIO_REG_I2CPS_I2CFS);
> +       if (!i2cgpio)
> +               pr_warn(WB_GPIO_DRIVER_NAME
> +                       ": disabling GPIO2.5 and GPIO2.6 as I2C is enabled\n");
> +
> +       winbond_gpio_configure_common(base, 1, WB_SIO_DEV_GPIO12,
> +                                     WB_SIO_GPIO12_REG_ENABLE,
> +                                     WB_SIO_GPIO12_ENABLE_2,
> +                                     WB_SIO_REG_GPIO1_MF,
> +                                     WB_SIO_REG_G1MF_G2PP);
> +}
> +
> +static void winbond_gpio_configure_2(uint16_t base)

Etc.

> +{
> +       if (!(gpios & BIT(2)))
> +               return;
> +
> +       winbond_sio_select_logical(base, WB_SIO_DEV_UARTC);
> +       if (winbond_sio_reg_btest(base, WB_SIO_UARTC_REG_ENABLE,
> +                                 WB_SIO_UARTC_ENABLE_ON))
> +               winbond_gpio_warn_conflict(2, "UARTC");
> +
> +       winbond_gpio_configure_common(base, 2, WB_SIO_DEV_GPIO34,
> +                                     WB_SIO_GPIO34_REG_ENABLE,
> +                                     WB_SIO_GPIO34_ENABLE_3,
> +                                     WB_SIO_REG_OVTGPIO3456,
> +                                     WB_SIO_REG_OG3456_G3PP);
> +}
> +
> +static void winbond_gpio_configure_3(uint16_t base)

Etc.

> +{
> +       if (!(gpios & BIT(3)))
> +               return;
> +
> +       winbond_sio_select_logical(base, WB_SIO_DEV_UARTD);
> +       if (winbond_sio_reg_btest(base, WB_SIO_UARTD_REG_ENABLE,
> +                                 WB_SIO_UARTD_ENABLE_ON))
> +               winbond_gpio_warn_conflict(3, "UARTD");
> +
> +       winbond_gpio_configure_common(base, 3, WB_SIO_DEV_GPIO34,
> +                                     WB_SIO_GPIO34_REG_ENABLE,
> +                                     WB_SIO_GPIO34_ENABLE_4,
> +                                     WB_SIO_REG_OVTGPIO3456,
> +                                     WB_SIO_REG_OG3456_G4PP);
> +}
> +
> +static void winbond_gpio_configure_4(uint16_t base)

Etc.

We are starting to see code duplication. It needs to be made into
some kind of table.

> +{
> +       if (!(gpios & BIT(4)))
> +               return;
> +
> +       winbond_sio_select_logical(base, WB_SIO_DEV_UARTE);
> +       if (winbond_sio_reg_btest(base, WB_SIO_UARTE_REG_ENABLE,
> +                                 WB_SIO_UARTE_ENABLE_ON))
> +               winbond_gpio_warn_conflict(4, "UARTE");
> +
> +       winbond_gpio_configure_common(base, 4, WB_SIO_DEV_WDGPIO56,
> +                                     WB_SIO_WDGPIO56_REG_ENABLE,
> +                                     WB_SIO_WDGPIO56_ENABLE_5,
> +                                     WB_SIO_REG_OVTGPIO3456,
> +                                     WB_SIO_REG_OG3456_G5PP);
> +}
> +
> +static void winbond_gpio_configure_5(uint16_t base)

Yeah... a table :)

> +{
> +       if (!(gpios & BIT(5)))
> +               return;
> +
> +       if (winbond_sio_reg_btest(base, WB_SIO_REG_GLOBAL_OPT,
> +                                 WB_SIO_REG_GO_ENFDC)) {
> +               pr_warn(WB_GPIO_DRIVER_NAME
> +                       ": disabling GPIO6 as FDC is enabled\n");
> +
> +               gpios &= ~BIT(5);
> +               return;
> +       }
> +
> +       winbond_gpio_configure_common(base, 5, WB_SIO_DEV_WDGPIO56,
> +                                     WB_SIO_WDGPIO56_REG_ENABLE,
> +                                     WB_SIO_WDGPIO56_ENABLE_6,
> +                                     WB_SIO_REG_OVTGPIO3456,
> +                                     WB_SIO_REG_OG3456_G6PP);
> +}
> +
> +static int winbond_gpio_configure(uint16_t base)
> +{
> +       winbond_gpio_configure_0(base);
> +       winbond_gpio_configure_1(base);
> +       winbond_gpio_configure_2(base);
> +       winbond_gpio_configure_3(base);
> +       winbond_gpio_configure_4(base);
> +       winbond_gpio_configure_5(base);

So figure out some way to not have 6 similar functions but parameterize
the functions somehow with some struct or so?

> +       if (!(gpios & (BIT(5 + 1) - 1))) {
> +               pr_err(WB_GPIO_DRIVER_NAME
> +                      ": please use 'gpios' module parameter to select some active GPIO ports to enable\n");
> +               return -EINVAL;
> +       }
> +
> +       return 0;
> +}
> +
> +static struct platform_device *winbond_gpio_pdev;

Hm I guess this is needed with ISA devices.

> +static int winbond_gpio_init_one(uint16_t base)

One... GPIO device? Put in some more info in the function name.


> +module_param(gpiobase, int, 0444);
> +MODULE_PARM_DESC(gpiobase,
> +                "number of the first GPIO to register. default is -1, that is, dynamically allocated.");

Drop this. We don't support hammering down the GPIO base.
Not anymore.

> +module_param(gpios, byte, 0444);
> +MODULE_PARM_DESC(gpios,
> +                "bitmask of GPIO ports to enable (bit 0 - GPIO1, bit 1 - GPIO2, etc.");
> +
> +module_param(ppgpios, byte, 0444);
> +MODULE_PARM_DESC(ppgpios,
> +                "bitmask of GPIO ports to set to push-pull mode (bit 0 - GPIO1, bit 1 - GPIO2, etc.");
> +
> +module_param(odgpios, byte, 0444);
> +MODULE_PARM_DESC(odgpios,
> +                "bitmask of GPIO ports to set to open drain mode (bit 0 - GPIO1, bit 1 - GPIO2, etc.");
> +
> +module_param(pledgpio, bool, 0644);
> +MODULE_PARM_DESC(pledgpio,
> +                "enable changing value of GPIO2.0 bit (Power LED), default no.");
> +
> +module_param(beepgpio, bool, 0644);
> +MODULE_PARM_DESC(beepgpio,
> +                "enable changing value of GPIO2.1 bit (BEEP), default no.");

This is an awful lot of module parameters.

Why do we need so many?

Yours,
Linus Walleij
