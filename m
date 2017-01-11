From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/3] gpio: gpio-rz: GPIO driver for Renesas RZ series
Date: Wed, 11 Jan 2017 15:55:00 +0100
Message-ID: <CACRpkdbMVu1pe9fYf+DRsnm7Uy_S3T+TONs5qKYWXOLfLDJzwQ@mail.gmail.com>
References: <1483990318-26927-1-git-send-email-jacopo+renesas@jmondi.org> <1483990318-26927-3-git-send-email-jacopo+renesas@jmondi.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qt0-f179.google.com ([209.85.216.179]:35663 "EHLO
        mail-qt0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S938051AbdAKOzB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Jan 2017 09:55:01 -0500
Received: by mail-qt0-f179.google.com with SMTP id x49so131168196qtc.2
        for <linux-gpio@vger.kernel.org>; Wed, 11 Jan 2017 06:55:01 -0800 (PST)
In-Reply-To: <1483990318-26927-3-git-send-email-jacopo+renesas@jmondi.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc: Magnus Damm <magnus.damm@gmail.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Geert Uytterhoeven <geert+renesas@glider.be>, chris.brandt@renesas.com, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Mon, Jan 9, 2017 at 8:31 PM, Jacopo Mondi <jacopo+renesas@jmondi.org> wrote:

> From: Magnus Damm <damm@opensource.se>
>
> This commit combines Magnus' original driver and minor fixes to
> forward-port it to a more recent kernel version (v4.10)
>
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
>
> ---------------------------------------------------------------
> gpio: Renesas RZ GPIO driver V3
>
> This patch adds a GPIO driver for the RZ series of SoCs from
> Renesas. The V3 of the driver requires DT to be used.
>
> The hardware allows control of GPIOs in blocks of up to 16 pins.
> Interrupts are not included in this hardware block, if interrupts
> are needed then the PFC needs to be configured to a IRQ pin function
> which is handled by the GIC hardware.
>
> Tested with yet-to-be-posted DT devices on r7s72100 and Genmai using
> LEDs, DIP switches and I2C bitbang.
>
> Signed-off-by: Magnus Damm <damm@opensource.se>
>
> gpio: gpio-rz: Port to v4.10-rc1
>
> Fix invalid return value in gpio remove function and change gpiochip's
> "dev" field name to "parent" to compile driver against v4.10
>
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

This commit message looks seriously mangled, please make it look like a regular
one with all signed offs at the end.

> +config GPIO_RZ
> +       tristate "Renesas RZ GPIO"
> +       depends on ARM

ARM really? Not some Renesas or so?
Include || COMPILE_TEST?

> +#include <linux/bitops.h>
> +#include <linux/err.h>
> +#include <linux/gpio.h>

No. Use only
#include <linux/gpio/driver.h>

> +static inline struct rz_gpio_priv *gpio_to_priv(struct gpio_chip *chip)
> +{
> +       return container_of(chip, struct rz_gpio_priv, gpio_chip);
> +}

Please get rid of this and use gpiochip_get_data()
after adding the chip with devm_gpiochip_add_data()
supplying the data you need.

Look at other GPIO drivers for examples.

> +static int rz_gpio_get(struct gpio_chip *chip, unsigned offset)
> +{
> +       /* Get bit from PPR register to determine pin state */
> +       return rz_gpio_read_ppr(gpio_to_priv(chip), offset);

return !!rz_gpio_read_ppr(gpio_to_priv(chip), offset);

To clamp to bool.

> +static void rz_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
> +{
> +       /* Set bit in P register via PSR to control output */
> +       rz_gpio_write(gpio_to_priv(chip), REG_PSR, offset, !!value);
> +}

Ironically you can trust the value to be 0/1 here. Check the
gpiolib.

> +static int rz_gpio_request(struct gpio_chip *chip, unsigned offset)
> +{
> +       return pinctrl_request_gpio(chip->base + offset);
> +}

What about just using gpiochip_generic_request instead?

> +static void rz_gpio_free(struct gpio_chip *chip, unsigned offset)
> +{
> +       pinctrl_free_gpio(chip->base + offset);
> +
> +       /* Set the GPIO as an input to ensure that the next GPIO request won't
> +       * drive the GPIO pin as an output.
> +       */
> +       rz_gpio_direction_input(chip, offset);
> +}

Very close to gpiochip_generic_free()

Maybe we should actually set lines as input in the
generic routine!

> +       gpio_chip = &p->gpio_chip;
> +       gpio_chip->direction_input = rz_gpio_direction_input;
> +       gpio_chip->get = rz_gpio_get;
> +       gpio_chip->direction_output = rz_gpio_direction_output;

Please implement .get_direction() as well.

> +       gpio_chip->set = rz_gpio_set;
> +       gpio_chip->request = rz_gpio_request;
> +       gpio_chip->free = rz_gpio_free;
> +       gpio_chip->label = dev_name(&pdev->dev);
> +       gpio_chip->parent = &pdev->dev;
> +       gpio_chip->owner = THIS_MODULE;
> +       gpio_chip->base = -1;
> +       gpio_chip->ngpio = ret == 0 ? args.args[2] : RZ_GPIOS_PER_PORT;
> +
> +       ret = gpiochip_add(gpio_chip);

Use devm_gpiochip_add_data() providing struct rz_gpio_priv * as
data.

> +static int rz_gpio_remove(struct platform_device *pdev)
> +{
> +       struct rz_gpio_priv *p = platform_get_drvdata(pdev);
> +
> +       gpiochip_remove(&p->gpio_chip);
> +       return 0;
> +}

And with the devm_gpiochip_add_data() you don't even need
this remove().

Yours,
Linus Walleij
