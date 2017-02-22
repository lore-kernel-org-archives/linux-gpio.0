From: William Breathitt Gray <vilhelm.gray@gmail.com>
Subject: Re: [PATCH] gpio: add NCT5104D gpio driver
Date: Wed, 22 Feb 2017 16:04:20 -0500
Message-ID: <20170222210420.GA15290@sophia>
References: <77f71974-541e-7e06-d37d-c52b9623ed25@pignat.org>
 <CACRpkdbfOFCWQsytnf0f2ZvBsvHqQ85nk-aKK-zXpr8F=uJ3UQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-yw0-f193.google.com ([209.85.161.193]:36524 "EHLO
        mail-yw0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754654AbdBVVFx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 22 Feb 2017 16:05:53 -0500
Received: by mail-yw0-f193.google.com with SMTP id 2so1099764ywn.3
        for <linux-gpio@vger.kernel.org>; Wed, 22 Feb 2017 13:04:28 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <CACRpkdbfOFCWQsytnf0f2ZvBsvHqQ85nk-aKK-zXpr8F=uJ3UQ@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Marc Pignat <marc@pignat.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Wed, Feb 22, 2017 at 03:52:05PM +0100, Linus Walleij wrote:
>On Thu, Feb 9, 2017 at 11:54 AM, Marc Pignat <marc@pignat.org> wrote:
>
>I looped in Bjorn Helgaas to have a look at how this thing probes. Please
>keep him on CC for future reposts.
>
>I'd like William to look at this driver too, he's the authority on
>EISA type cards
>and port-mapped GPIO IO. Please keep him on CC too.
>
>Please look a bit at drivers/gpio/gpio-it87.c, and gpio-f7188x.c it seems to me
>that this is a simlar or identical chip to one of these. In that case,
>you should
>augment and extend an existing driver instead of writing a new one.
>But I haven't
>drilled into the problem and I don't know EISA well enough.
>

Hi Linus,

This looks like a Super I/O chip (correct me if I'm mistaken Marc).
Super I/O chips typically communicate via the LPC bus (which is software
compatible with the ISA bus) hence the ioport operations.

The F7188x and IT87xx drivers handle respective Super I/O chips as well.
It appears that a lot of code duplication is occurring between these
three drivers; this makes sense since the functionality would be similar
between these devices.

>> +++ b/drivers/gpio/gpio-nct5104d.c
>> @@ -0,0 +1,438 @@
>> +/*
>> + * GPIO driver for NCT5104D
>> + *
>> + * Author: Tasanakorn Phaipool <tasanakorn@gmail.com>
>> + *
>> + * This program is free software; you can redistribute it and/or modify
>> + * it under the terms of the GNU General Public License as published by
>> + * the Free Software Foundation; either version 2 of the License, or
>> + * (at your option) any later version.
>> + */
>> +
>> +#include <linux/module.h>
>> +#include <linux/init.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/io.h>
>> +#include <linux/gpio.h>
>
>Use #include <linux/gpio/driver.h> only
>
>> +#define DRVNAME "gpio-nct5104d"
>
>Usually I prefer to just hardcode the string when used.
>
>> +/*
>> + * Super-I/O registers
>> + */
>> +#define SIO_LDSEL              0x07    /* Logical device select */
>> +#define SIO_CHIPID             0x20    /* Chaip ID (2 bytes) */
>> +#define SIO_GPIO_ENABLE                0x30    /* GPIO enable */
>> +#define SIO_GPIO1_MODE         0xE0    /* GPIO1 Mode OpenDrain/Push-Pull */
>> +#define SIO_GPIO2_MODE         0xE1    /* GPIO2 Mode OpenDrain/Push-Pull */
>> +
>> +#define SIO_LD_GPIO            0x07    /* GPIO logical device */
>> +#define SIO_LD_GPIO_MODE       0x0F    /* GPIO mode control device */
>> +#define SIO_UNLOCK_KEY         0x87    /* Key to enable Super-I/O */
>> +#define SIO_LOCK_KEY           0xAA    /* Key to disable Super-I/O */
>> +
>> +#define SIO_NCT5104D_ID                        0x1061  /* Chip ID */
>> +#define SIO_PCENGINES_APU_NCT5104D_ID  0xc452  /* Chip ID */
>> +
>> +enum chips { nct5104d };
>> +
>> +static const char * const nct5104d_names[] = {
>> +       "nct5104d"
>> +};
>
>This enum and name array seems a bit overkill? Are you already planning
>to add support for a bunch of other chips?
>
>> +/*
>> + * GPIO chip.
>> + */
>> +
>> +static int nct5104d_gpio_direction_in(struct gpio_chip *chip,
>> +                                     unsigned int offset);
>> +static int nct5104d_gpio_get(struct gpio_chip *chip, unsigned int offset);
>> +static int nct5104d_gpio_direction_out(struct gpio_chip *chip,
>> +                                      unsigned int offset, int value);
>> +static void nct5104d_gpio_set(struct gpio_chip *chip, unsigned int offset,
>> +                             int value);
>
>Do you really have to forward-declare all this?
>
>I strongly prefer if you move code around so as to avoid it.
>
>> +#define NCT5104D_GPIO_BANK(_base, _ngpio, _regbase)                    \
>> +       {                                                               \
>> +               .chip = {                                               \
>> +                       .label            = DRVNAME,                    \
>> +                       .owner            = THIS_MODULE,                \
>> +                       .direction_input  = nct5104d_gpio_direction_in, \
>> +                       .get              = nct5104d_gpio_get,          \
>> +                       .direction_output = nct5104d_gpio_direction_out,\
>> +                       .set              = nct5104d_gpio_set,          \
>> +                       .base             = _base,                      \
>> +                       .ngpio            = _ngpio,                     \
>> +                       .can_sleep        = true,                       \
>> +               },                                                      \
>> +               .regbase = _regbase,                                    \
>> +       }
>
>Please also implement .get_direction(), it is very helpful to have.
>
>> +static int nct5104d_gpio_direction_in(struct gpio_chip *chip,
>> +                                     unsigned int offset)
>> +{
>> +       int err;
>> +       struct nct5104d_gpio_bank *bank =
>> +               container_of(chip, struct nct5104d_gpio_bank, chip);
>> +       struct nct5104d_sio *sio = bank->data->sio;
>> +       u8 dir;
>> +
>> +       err = superio_enter(sio->addr);
>> +       if (err)
>> +               return err;
>> +       superio_select(sio->addr, SIO_LD_GPIO);
>> +
>> +       dir = superio_inb(sio->addr, gpio_dir(bank->regbase));
>> +       dir |= (1 << offset);
>
>Please use:
>#include <linux/bitops.h>
>
>dir |= BIT(offset);
>
>This applies to all sites using this pattern.
>
>> +               err = gpiochip_add(&bank->chip);
>
>Can you use devm_gpiochip_add_data() (you can pass NULL as data)
>so you do not need the .remove() call below at all?
>
>> +err_gpiochip:
>> +       for (i = i - 1; i >= 0; i--) {
>> +               struct nct5104d_gpio_bank *bank = &data->bank[i];
>> +
>> +               gpiochip_remove(&bank->chip);
>
>Then conversely this needs devm_gpiochip_remove().
>
>> +static int nct5104d_gpio_remove(struct platform_device *pdev)
>
>And this could go away.
>
>> +static int __init nct5104d_find(int addr, struct nct5104d_sio *sio)
>> +{
>> +       int err;
>> +       u16 devid;
>> +       u8 gpio_cfg;
>> +
>> +       err = superio_enter(addr);
>> +       if (err)
>> +               return err;
>> +
>> +       err = -ENODEV;
>> +
>> +       devid = superio_inw(addr, SIO_CHIPID);
>> +       switch (devid) {
>> +       case SIO_NCT5104D_ID:
>> +       case SIO_PCENGINES_APU_NCT5104D_ID:
>> +               sio->type = nct5104d;
>> +               /* enable GPIO0 and GPIO1 */
>> +               superio_select(addr, SIO_LD_GPIO);
>> +               gpio_cfg = superio_inb(addr, SIO_GPIO_ENABLE);
>> +               gpio_cfg |= 0x03;
>> +               superio_outb(addr, SIO_GPIO_ENABLE, gpio_cfg);
>> +               break;
>> +       default:
>> +               pr_info(DRVNAME ": Unsupported device 0x%04x\n", devid);
>> +               goto err;
>> +       }
>> +       sio->addr = addr;
>> +       err = 0;
>> +
>> +       pr_info(DRVNAME ": Found %s at %#x chip id 0x%04x\n",
>> +               nct5104d_names[sio->type],
>> +               (unsigned int) addr,
>> +               (int) superio_inw(addr, SIO_CHIPID));
>> +
>> +       superio_select(sio->addr, SIO_LD_GPIO_MODE);
>> +       superio_outb(sio->addr, SIO_GPIO1_MODE, 0x0);
>> +       superio_outb(sio->addr, SIO_GPIO2_MODE, 0x0);
>> +
>> +err:
>> +       superio_exit(addr);
>> +       return err;
>> +}
>> +
>> +static struct platform_device *nct5104d_gpio_pdev;
>> +
>> +static int __init
>> +nct5104d_gpio_device_add(const struct nct5104d_sio *sio)
>> +{
>> +       int err;
>> +
>> +       nct5104d_gpio_pdev = platform_device_alloc(DRVNAME, -1);
>> +       if (!nct5104d_gpio_pdev)
>> +               pr_err(DRVNAME ": Error platform_device_alloc\n");
>> +       if (!nct5104d_gpio_pdev)
>> +               return -ENOMEM;
>> +
>> +       err = platform_device_add_data(nct5104d_gpio_pdev,
>> +                                      sio, sizeof(*sio));
>> +       if (err) {
>> +               pr_err(DRVNAME "Platform data allocation failed\n");
>> +               goto err;
>> +       }
>> +
>> +       err = platform_device_add(nct5104d_gpio_pdev);
>> +       if (err) {
>> +               pr_err(DRVNAME "Device addition failed\n");
>> +               goto err;
>> +       }
>> +       pr_info(DRVNAME ": Device added\n");
>> +       return 0;
>> +
>> +err:
>> +       platform_device_put(nct5104d_gpio_pdev);
>> +
>> +       return err;
>> +}
>> +
>> +/*
>> + */
>> +
>> +static struct platform_driver nct5104d_gpio_driver = {
>> +       .driver = {
>> +               .owner  = THIS_MODULE,
>> +               .name   = DRVNAME,
>> +       },
>> +       .probe          = nct5104d_gpio_probe,
>> +       .remove         = nct5104d_gpio_remove,
>> +};
>> +
>> +static int __init nct5104d_gpio_init(void)
>> +{
>> +       int err;
>> +       struct nct5104d_sio sio;
>> +
>> +       if (nct5104d_find(0x2e, &sio) &&
>> +           nct5104d_find(0x4e, &sio))
>> +               return -ENODEV;
>> +
>> +       err = platform_driver_register(&nct5104d_gpio_driver);
>> +       if (!err) {
>> +               pr_info(DRVNAME ": platform_driver_register\n");
>> +               err = nct5104d_gpio_device_add(&sio);
>> +               if (err)
>> +                       platform_driver_unregister(&nct5104d_gpio_driver);
>> +       }
>> +
>> +       return err;
>> +}
>> +subsys_initcall(nct5104d_gpio_init);
>> +
>> +static void __exit nct5104d_gpio_exit(void)
>> +{
>> +       platform_device_unregister(nct5104d_gpio_pdev);
>> +       platform_driver_unregister(&nct5104d_gpio_driver);
>> +}
>> +module_exit(nct5104d_gpio_exit);
>

Marc,

I recommend utilizing the isa_driver since you are interfacing a super
I/O chip. This should simplify your __init and __exit code by removing
the need for all those platform_driver setup calls you make; instead you
would simply call isa_register_driver.

Check out the respective __init, __exit, probe, and remove code in
drivers/watchdog/ebc-c384_wdt.c file a simple example of how to use the
isa_driver calls. If you need more specific help, let me know and I'll
go into more detail.

>I'm not thrilled by this "plug-and-play" that seems very far from autodetection.
>

Linus,

I believe the best course of action forward would be the development of
a "super_io_driver" to handle the detection of these type of devices.
Super I/O chips typically have a ioport base address at 0x2E; this is
why you see all of these Super I/O chip drivers probing that address.

Since device IDs can be found at the standard Super I/O base address, it
would be useful to have a super_io_driver structure with an id_table
member filled with possible device IDs of devices supported by the
respective driver. I imagine that this would enable automatic driver
loads and device probes such as we have with the PCI bus driver, where a
super_io_driver structure can be populated by the driver author and then
passed to a super_io_register_driver call.

Furthermore, a Super I/O driver could provide the common read/write
operations we see across the existing Super I/O drivers, thus
eliminating the code duplication (superio_outb, superio_inw, etc. become
standardized).

This plan would obviously require more time to get right, so if you
decide to merge this particular driver now, I suggest at least using the
isa_driver idioms for now to ease the transition to a possible future
super_io_driver.

William Breathitt Gray

>I need help reviewing this from someone who knows how to deal with
>this kind of platform drivers on port-mapped I/O.
>
>Yours,
>Linus Walleij
