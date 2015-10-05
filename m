From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] GPIO: Add GPIO support for the ACCES 104-IDIO-16
Date: Mon, 5 Oct 2015 10:29:14 +0200
Message-ID: <CACRpkdaimDeCZZXfma4sLRRRC=0YQCy7_7=V-qzubMRAY8HF6w@mail.gmail.com>
References: <20151001015832.GA11317@sophia>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20151001015832.GA11317@sophia>
Sender: linux-kernel-owner@vger.kernel.org
To: William Breathitt Gray <vilhelm.gray@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Thu, Oct 1, 2015 at 3:58 AM, William Breathitt Gray
<vilhelm.gray@gmail.com> wrote:

> The ACCES 104-IDIO-16 family of PC/104 utility boards

Sounds like a PC104 keyboard :D

> feature 16
> optically isolated inputs and 16 optically isolated FET solid state
> outputs. This driver provides GPIO support for these 32 channels of
> digital I/O. Change-of-State detection interrupts are not supported.

So it has IRQ support but it's not supported yet I take it.

> GPIO 0-15 correspond to digital outputs 0-15, while GPIO 16-31
> correspond to digital inputs 0-15.
>
> Signed-off-by: William Breathitt Gray <vilhelm.gray@gmail.com>

> +menu "ISA GPIO expanders"

Interesting submenu. I guess it is proper to have so OK.

Add:
depends on PCI

As they all will need that, I guess?

> +menuconfig GPIO_104_IDIO_16
> +       tristate "ACCES 104-IDIO-16 GPIO support"
> +       help
> +         Enables GPIO support for the ACCES 104-IDIO-16 family.
> +
> +config 104_IDIO_16_BASE
> +       hex "ACCES 104-IDIO-16 base address"
> +       depends on GPIO_104_IDIO_16
> +       default 0x000

This can't be right. PCI devices have their config space for a reason
I'm told. On other platforms we use device tree or ACPI to set this
up but PCI is either hotplug or wrong I think.

The driver is full of ISA style inb/outb stuff, I get all confused. Why
is this not using the PCI infrastructure?

Involving Bj=C3=B6rn Helg=C3=A5s for a comment on this.

> +#include <linux/gpio.h>

Only
#include <linux/gpio/driver.h>

> +#include <linux/io.h>
> +#include <linux/ioport.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/printk.h>
> +#include <linux/spinlock.h>
> +
> +struct a_104_idio_16_gpio {
> +       struct gpio_chip chip;
> +       spinlock_t lock;
> +       unsigned base;

Isn't this void __iomem *base?

> +       unsigned data;
> +};

kerneldoc this.

> +static void __exit a_104_idio_16_exit(void);
> +static int a_104_idio_16_gpio_direction_input(struct gpio_chip *chip=
,
> +       unsigned offset);
> +static int a_104_idio_16_gpio_direction_output(struct gpio_chip *chi=
p,
> +       unsigned offset, int value);
> +static int a_104_idio_16_gpio_get(struct gpio_chip *chip, unsigned o=
ffset);
> +static void a_104_idio_16_gpio_set(struct gpio_chip *chip, unsigned =
offset,
> +       int value);
> +static int __init a_104_idio_16_init(void);

Re-arrange code to avoid forward declarations please.

> +static const unsigned A_104_IDIO_16_EXTENT =3D 8;

Looks like it could be a #define A_104_IDIO_16_EXTENT 8

> +static struct a_104_idio_16_gpio gp =3D {
> +       .chip =3D {
> +               .label =3D "104-IDIO-16 GPIO",
> +               .owner =3D THIS_MODULE,
> +               .base =3D -1,
> +               .ngpio =3D 32,
> +               .direction_input =3D a_104_idio_16_gpio_direction_inp=
ut,
> +               .direction_output =3D a_104_idio_16_gpio_direction_ou=
tput,
> +               .get =3D a_104_idio_16_gpio_get,
> +               .set =3D a_104_idio_16_gpio_set
> +       },
> +       .base =3D CONFIG_104_IDIO_16_BASE
> +};

So if you put this *below* the functions you need not forward-declare t=
hem.

> +static void __exit a_104_idio_16_exit(void)
> +{
> +       pr_info("104-idio-16: Exiting 104-idio-16 module\n");
> +
> +       gpiochip_remove(&gp.chip);

Where is that &gp.chip? Not in this file. Nor should you use any global=
s.

Does this driver even compile?

> +static int a_104_idio_16_gpio_get(struct gpio_chip *chip, unsigned o=
ffset)
> +{
> +       struct a_104_idio_16_gpio *a104i16gp =3D to_a104i16gp(chip);
> +       const unsigned BIT_MASK =3D 1U << (offset-16);
> +
> +       if (offset < 16)
> +               return 0;

Always return 0, why? Is that really correct?

> +static int __init a_104_idio_16_init(void)
> +       spin_lock_init(&gp.lock);
> +       err =3D gpiochip_add(&gp.chip);

This gp global again. Read
Documentation/driver-model/design-patterns.txt
Please.

Yours,
Linus Walleij
