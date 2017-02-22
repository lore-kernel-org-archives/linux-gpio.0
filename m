From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: add NCT5104D gpio driver
Date: Wed, 22 Feb 2017 15:52:05 +0100
Message-ID: <CACRpkdbfOFCWQsytnf0f2ZvBsvHqQ85nk-aKK-zXpr8F=uJ3UQ@mail.gmail.com>
References: <77f71974-541e-7e06-d37d-c52b9623ed25@pignat.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f48.google.com ([209.85.214.48]:34736 "EHLO
        mail-it0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932170AbdBVOwH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 22 Feb 2017 09:52:07 -0500
Received: by mail-it0-f48.google.com with SMTP id k200so39859045itb.1
        for <linux-gpio@vger.kernel.org>; Wed, 22 Feb 2017 06:52:06 -0800 (PST)
In-Reply-To: <77f71974-541e-7e06-d37d-c52b9623ed25@pignat.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Marc Pignat <marc@pignat.org>, William Breathitt Gray <vilhelm.gray@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Thu, Feb 9, 2017 at 11:54 AM, Marc Pignat <marc@pignat.org> wrote:

I looped in Bjorn Helgaas to have a look at how this thing probes. Please
keep him on CC for future reposts.

I'd like William to look at this driver too, he's the authority on
EISA type cards
and port-mapped GPIO IO. Please keep him on CC too.

Please look a bit at drivers/gpio/gpio-it87.c, and gpio-f7188x.c it seems to me
that this is a simlar or identical chip to one of these. In that case,
you should
augment and extend an existing driver instead of writing a new one.
But I haven't
drilled into the problem and I don't know EISA well enough.

> +++ b/drivers/gpio/gpio-nct5104d.c
> @@ -0,0 +1,438 @@
> +/*
> + * GPIO driver for NCT5104D
> + *
> + * Author: Tasanakorn Phaipool <tasanakorn@gmail.com>
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + */
> +
> +#include <linux/module.h>
> +#include <linux/init.h>
> +#include <linux/platform_device.h>
> +#include <linux/io.h>
> +#include <linux/gpio.h>

Use #include <linux/gpio/driver.h> only

> +#define DRVNAME "gpio-nct5104d"

Usually I prefer to just hardcode the string when used.

> +/*
> + * Super-I/O registers
> + */
> +#define SIO_LDSEL              0x07    /* Logical device select */
> +#define SIO_CHIPID             0x20    /* Chaip ID (2 bytes) */
> +#define SIO_GPIO_ENABLE                0x30    /* GPIO enable */
> +#define SIO_GPIO1_MODE         0xE0    /* GPIO1 Mode OpenDrain/Push-Pull */
> +#define SIO_GPIO2_MODE         0xE1    /* GPIO2 Mode OpenDrain/Push-Pull */
> +
> +#define SIO_LD_GPIO            0x07    /* GPIO logical device */
> +#define SIO_LD_GPIO_MODE       0x0F    /* GPIO mode control device */
> +#define SIO_UNLOCK_KEY         0x87    /* Key to enable Super-I/O */
> +#define SIO_LOCK_KEY           0xAA    /* Key to disable Super-I/O */
> +
> +#define SIO_NCT5104D_ID                        0x1061  /* Chip ID */
> +#define SIO_PCENGINES_APU_NCT5104D_ID  0xc452  /* Chip ID */
> +
> +enum chips { nct5104d };
> +
> +static const char * const nct5104d_names[] = {
> +       "nct5104d"
> +};

This enum and name array seems a bit overkill? Are you already planning
to add support for a bunch of other chips?

> +/*
> + * GPIO chip.
> + */
> +
> +static int nct5104d_gpio_direction_in(struct gpio_chip *chip,
> +                                     unsigned int offset);
> +static int nct5104d_gpio_get(struct gpio_chip *chip, unsigned int offset);
> +static int nct5104d_gpio_direction_out(struct gpio_chip *chip,
> +                                      unsigned int offset, int value);
> +static void nct5104d_gpio_set(struct gpio_chip *chip, unsigned int offset,
> +                             int value);

Do you really have to forward-declare all this?

I strongly prefer if you move code around so as to avoid it.

> +#define NCT5104D_GPIO_BANK(_base, _ngpio, _regbase)                    \
> +       {                                                               \
> +               .chip = {                                               \
> +                       .label            = DRVNAME,                    \
> +                       .owner            = THIS_MODULE,                \
> +                       .direction_input  = nct5104d_gpio_direction_in, \
> +                       .get              = nct5104d_gpio_get,          \
> +                       .direction_output = nct5104d_gpio_direction_out,\
> +                       .set              = nct5104d_gpio_set,          \
> +                       .base             = _base,                      \
> +                       .ngpio            = _ngpio,                     \
> +                       .can_sleep        = true,                       \
> +               },                                                      \
> +               .regbase = _regbase,                                    \
> +       }

Please also implement .get_direction(), it is very helpful to have.

> +static int nct5104d_gpio_direction_in(struct gpio_chip *chip,
> +                                     unsigned int offset)
> +{
> +       int err;
> +       struct nct5104d_gpio_bank *bank =
> +               container_of(chip, struct nct5104d_gpio_bank, chip);
> +       struct nct5104d_sio *sio = bank->data->sio;
> +       u8 dir;
> +
> +       err = superio_enter(sio->addr);
> +       if (err)
> +               return err;
> +       superio_select(sio->addr, SIO_LD_GPIO);
> +
> +       dir = superio_inb(sio->addr, gpio_dir(bank->regbase));
> +       dir |= (1 << offset);

Please use:
#include <linux/bitops.h>

dir |= BIT(offset);

This applies to all sites using this pattern.

> +               err = gpiochip_add(&bank->chip);

Can you use devm_gpiochip_add_data() (you can pass NULL as data)
so you do not need the .remove() call below at all?

> +err_gpiochip:
> +       for (i = i - 1; i >= 0; i--) {
> +               struct nct5104d_gpio_bank *bank = &data->bank[i];
> +
> +               gpiochip_remove(&bank->chip);

Then conversely this needs devm_gpiochip_remove().

> +static int nct5104d_gpio_remove(struct platform_device *pdev)

And this could go away.

> +static int __init nct5104d_find(int addr, struct nct5104d_sio *sio)
> +{
> +       int err;
> +       u16 devid;
> +       u8 gpio_cfg;
> +
> +       err = superio_enter(addr);
> +       if (err)
> +               return err;
> +
> +       err = -ENODEV;
> +
> +       devid = superio_inw(addr, SIO_CHIPID);
> +       switch (devid) {
> +       case SIO_NCT5104D_ID:
> +       case SIO_PCENGINES_APU_NCT5104D_ID:
> +               sio->type = nct5104d;
> +               /* enable GPIO0 and GPIO1 */
> +               superio_select(addr, SIO_LD_GPIO);
> +               gpio_cfg = superio_inb(addr, SIO_GPIO_ENABLE);
> +               gpio_cfg |= 0x03;
> +               superio_outb(addr, SIO_GPIO_ENABLE, gpio_cfg);
> +               break;
> +       default:
> +               pr_info(DRVNAME ": Unsupported device 0x%04x\n", devid);
> +               goto err;
> +       }
> +       sio->addr = addr;
> +       err = 0;
> +
> +       pr_info(DRVNAME ": Found %s at %#x chip id 0x%04x\n",
> +               nct5104d_names[sio->type],
> +               (unsigned int) addr,
> +               (int) superio_inw(addr, SIO_CHIPID));
> +
> +       superio_select(sio->addr, SIO_LD_GPIO_MODE);
> +       superio_outb(sio->addr, SIO_GPIO1_MODE, 0x0);
> +       superio_outb(sio->addr, SIO_GPIO2_MODE, 0x0);
> +
> +err:
> +       superio_exit(addr);
> +       return err;
> +}
> +
> +static struct platform_device *nct5104d_gpio_pdev;
> +
> +static int __init
> +nct5104d_gpio_device_add(const struct nct5104d_sio *sio)
> +{
> +       int err;
> +
> +       nct5104d_gpio_pdev = platform_device_alloc(DRVNAME, -1);
> +       if (!nct5104d_gpio_pdev)
> +               pr_err(DRVNAME ": Error platform_device_alloc\n");
> +       if (!nct5104d_gpio_pdev)
> +               return -ENOMEM;
> +
> +       err = platform_device_add_data(nct5104d_gpio_pdev,
> +                                      sio, sizeof(*sio));
> +       if (err) {
> +               pr_err(DRVNAME "Platform data allocation failed\n");
> +               goto err;
> +       }
> +
> +       err = platform_device_add(nct5104d_gpio_pdev);
> +       if (err) {
> +               pr_err(DRVNAME "Device addition failed\n");
> +               goto err;
> +       }
> +       pr_info(DRVNAME ": Device added\n");
> +       return 0;
> +
> +err:
> +       platform_device_put(nct5104d_gpio_pdev);
> +
> +       return err;
> +}
> +
> +/*
> + */
> +
> +static struct platform_driver nct5104d_gpio_driver = {
> +       .driver = {
> +               .owner  = THIS_MODULE,
> +               .name   = DRVNAME,
> +       },
> +       .probe          = nct5104d_gpio_probe,
> +       .remove         = nct5104d_gpio_remove,
> +};
> +
> +static int __init nct5104d_gpio_init(void)
> +{
> +       int err;
> +       struct nct5104d_sio sio;
> +
> +       if (nct5104d_find(0x2e, &sio) &&
> +           nct5104d_find(0x4e, &sio))
> +               return -ENODEV;
> +
> +       err = platform_driver_register(&nct5104d_gpio_driver);
> +       if (!err) {
> +               pr_info(DRVNAME ": platform_driver_register\n");
> +               err = nct5104d_gpio_device_add(&sio);
> +               if (err)
> +                       platform_driver_unregister(&nct5104d_gpio_driver);
> +       }
> +
> +       return err;
> +}
> +subsys_initcall(nct5104d_gpio_init);
> +
> +static void __exit nct5104d_gpio_exit(void)
> +{
> +       platform_device_unregister(nct5104d_gpio_pdev);
> +       platform_driver_unregister(&nct5104d_gpio_driver);
> +}
> +module_exit(nct5104d_gpio_exit);

I'm not thrilled by this "plug-and-play" that seems very far from autodetection.

I need help reviewing this from someone who knows how to deal with
this kind of platform drivers on port-mapped I/O.

Yours,
Linus Walleij
