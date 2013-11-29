From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: add GPIO support for SMSC SCH311x
Date: Fri, 29 Nov 2013 15:40:01 +0100
Message-ID: <CACRpkdaXO+tYRq=uyQiAopRDPwKv1_F4yZwCWr4-JL1xnio4Wg@mail.gmail.com>
References: <1385597895-26418-1-git-send-email-br1@einfach.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oa0-f50.google.com ([209.85.219.50]:57654 "EHLO
	mail-oa0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756457Ab3K2OkC (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 29 Nov 2013 09:40:02 -0500
Received: by mail-oa0-f50.google.com with SMTP id n16so10444891oag.37
        for <linux-gpio@vger.kernel.org>; Fri, 29 Nov 2013 06:40:01 -0800 (PST)
In-Reply-To: <1385597895-26418-1-git-send-email-br1@einfach.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Bruno Randolf <br1@einfach.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, Mathias Nyman <mathias.nyman@linux.intel.com>, David Cohen <david.a.cohen@intel.com>, Simon Guinot <simon.guinot@sequanux.org>
Cc: Wim Van Sebroeck <wim@iguana.be>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Thu, Nov 28, 2013 at 1:18 AM, Bruno Randolf <br1@einfach.org> wrote:

> This patch adds support for the first eight GPIOs found on the SMSC "Super I/O"
> chips SCH311x.

Simon Guinot recently added another "Super I/O" driver, Simon can
you have a look at this driver?

> This chip is used on Atom based embedded boards (e.g. "Advantec MIO-2261") and
> actually has more GPIO lines, but they are not connected on the board I have
> access to.

But please write a driver for the chip, not for the board. Make it enabled
to handle all the GPIO lines on that chip, i.e. handle all registers, then
configure the driver to only use the first eight lines on this board.

Besides: tomorrow someone will mount this in another X86 thing
and use more of the lines.

> +config GPIO_SCH311X
> +       tristate "SMSC SCH311x SuperI/O GPIO"
> +       depends on X86

Really? What stops me from soldering this onto one of my ARM or
MIPS boards? This is not good for compile coverage either.

> +++ b/drivers/gpio/gpio-sch311x.c
(...)
> +/* Runtime registers */
> +
> +#define GP1    0x4B    /* GP10-17 data register */
> +
> +static unsigned int sch311x_gpio_conf[] = {
> +       { 0x23,         /* GP10 config register */
> +       0x24,           /* GP11 config register */
> +       0x25,           /* GP12 config register */
> +       0x26,           /* GP13 config register */
> +       0x27,           /* GP14 config register */
> +       0x29,           /* GP15 config register */
> +       0x2a,           /* GP16 config register */
> +       0x2b,           /* GP17 config register */
> +};
> +
> +#define SCH311X_GPIO_CONF_IN           0x01
> +#define SCH311X_GPIO_CONF_OUT          0x00
> +#define SCH311X_GPIO_CONF_INV          0x02
> +#define SCH311X_GPIO_CONF_OPEN_DRAIN   0x80
> +
> +static int sch311x_ioports[] = { 0x2e, 0x4e, 0x162e, 0x164e, 0x00 };

ISA-style probing, yeah I had to accept this last time ...
So no discovery on this system, no ACPI?

> +/* internal variables */
> +static struct platform_device *sch311x_gpio_pdev;
> +static struct platform_device *i2c_gpio_pdev;
> +
> +static struct {
> +       unsigned short runtime_reg;     /* Runtime Register base address */
> +       spinlock_t lock;                /* lock for io operations */
> +} sch311x_gpio_data;

This is a singleton. What happens the day someone mounts two
of these chips on a board? Please devm_kzalloc() a state container
instead, look in other GPIO drivers for examples of this.

> +static inline void sch311x_sio_enter(int sio_config_port)
> +{
> +       outb(0x55, sio_config_port);
> +}

0x55?

> +static inline void sch311x_sio_exit(int sio_config_port)
> +{
> +       outb(0xaa, sio_config_port);
> +}

0xaa?

Please #define thise magic values.

> +static int sch311x_gpio_get(struct gpio_chip *chip, unsigned offset)
> +{
> +       unsigned char data = inb(sch311x_gpio_data.runtime_reg + GP1);
> +       return ((data >> offset) & 1);

Use this:

#include <linux/bitops.h>

return !!(data & BIT(offset));

> +static void __sch311x_gpio_set(unsigned offset, int value)
> +{
> +       unsigned char data;
> +       data = inb(sch311x_gpio_data.runtime_reg + GP1);
> +       if (value)
> +               data |= 1 << offset;

BIT(offset);

> +       else
> +               data &= ~(1 << offset);

BIT(offset);

> +       outb(data, sch311x_gpio_data.runtime_reg + GP1);
> +}

> +static int sch311x_gpio_direction_in(struct gpio_chip *chip, unsigned offset)
> +{
> +       spin_lock(&sch311x_gpio_data.lock);

This is a sure sign that singletons are not so good.

> +static int sch311x_gpio_direction_out(struct gpio_chip *chip, unsigned offset, int value)
> +{
> +       spin_lock(&sch311x_gpio_data.lock);
> +
> +#if 0
> +       /* configure as "push/pull": output voltage is 3.3V */
> +       outb(SCH311X_GPIO_CONF_OUT, sch311x_gpio_data.runtime_reg + sch311x_gpio_conf[offset]);

No #if 0 code! Delete this.

> +#else
> +       /* configure as "open drain": output voltage is 5V on an unconnected PIN */
> +       outb(SCH311X_GPIO_CONF_OUT | SCH311X_GPIO_CONF_OPEN_DRAIN,
> +            sch311x_gpio_data.runtime_reg + sch311x_gpio_conf[offset]);

So if you really only support push/pull, open drain and maybe even
open source, then it's OK to use the GPIO subsystem. If you start
doing more things, this becomes a matter of pin control.

> +#endif
> +       __sch311x_gpio_set(offset, value);
> +
> +       spin_unlock(&sch311x_gpio_data.lock);
> +       return 0;
> +}
> +
> +static struct gpio_chip sc_gpio_chip = {
> +       .label                  = "sch311x_gpio",
> +       .owner                  = THIS_MODULE,
> +       .direction_input        = sch311x_gpio_direction_in,
> +       .get                    = sch311x_gpio_get,
> +       .direction_output       = sch311x_gpio_direction_out,
> +       .set                    = sch311x_gpio_set,
> +       .can_sleep              = 0,
> +       .base                   = 0,

So what happens when there is a system with two of these
chips? How do you intend to pass a different config for another
board?

> +       .ngpio                  = 8,

This should nominally be set to however many GPIOs the
chip can actually handle, then augmented for the board.

The rest of the struct is OK.

> +static int sch311x_gpio_probe(struct platform_device *pdev)
> +{
> +       struct device *dev = &pdev->dev;
> +       int err, i;


Here, devm_kzalloc(&pdev->dev, sizeof(container), GFP_KERNEL);

etc

> +static int __init sch311x_detect(int sio_config_port, unsigned short *addr)
> +{
> +       int err = 0, reg;
> +       unsigned short base_addr;
> +       unsigned char dev_id;
> +
> +       sch311x_sio_enter(sio_config_port);
> +
> +       /* Check device ID. We currently know about:
> +        * SCH3112 (0x7c), SCH3114 (0x7d), and SCH3116 (0x7f). */
> +       reg = sch311x_sio_inb(sio_config_port, 0x20);
> +       if (!(reg == 0x7c || reg == 0x7d || reg == 0x7f)) {
> +               err = -ENODEV;
> +               goto exit;
> +       }
> +       dev_id = reg == 0x7c ? 2 : reg == 0x7d ? 4 : 6;

This gives me the creeps but I guess I have to live with it?

> +static int __init sch311x_gpio_init(void)
> +{
> +       int err, i, found = 0;
> +       unsigned short addr = 0;
> +
> +       for (i = 0; !found && sch311x_ioports[i]; i++)
> +               if (sch311x_detect(sch311x_ioports[i], &addr) == 0)
> +                       found++;
> +
> +       if (!found)
> +               return -ENODEV;
> +
> +       sch311x_gpio_data.runtime_reg = addr;
> +
> +       err = platform_driver_register(&sch311x_gpio_driver);
> +       if (err)
> +               return err;
> +
> +       sch311x_gpio_pdev = platform_device_register_simple(DRV_NAME, addr, NULL, 0);


At the very least I want the driver split up in two files: one that
adds the GPIO driver for an arbitrary number of pins, and one
that adds this boards' configuration. You can put the latter in
drivers/platform/x86 or wherever, just not in drivers/gpio.

Maybe this leads to another interesting discussion on why
ACPI is not used for configuring the board...

Yours,
Linus Walleij
