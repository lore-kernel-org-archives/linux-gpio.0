From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v4 1/2] gpio: Add driver for PC Engines APU boards
Date: Mon, 19 Nov 2018 14:46:06 +0100
Message-ID: <CACRpkdZx-GgfgfGmB6KmTjzBEMnKyq3pUsHsgaZ1uBooN_sj9g@mail.gmail.com>
References: <20181115133201.29092-1-fe@dev.tdt.de> <20181115133201.29092-2-fe@dev.tdt.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181115133201.29092-2-fe@dev.tdt.de>
Sender: linux-kernel-owner@vger.kernel.org
To: fe@dev.tdt.de
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, piotr.krol@3mdeb.com, Eckert.Florian@googlemail.com, Darren Hart <dvhart@infradead.org>, platform-driver-x86 <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Thu, Nov 15, 2018 at 2:32 PM Florian Eckert <fe@dev.tdt.de> wrote:

> Add a new device driver "gpio-apu" which will handle the GPIOs on APU2
> and APU3 devices from PC Engines.
>
> APU2 (https://pcengines.ch/schema/apu2c.pdf page 7):
> - G32 is "button_reset" connected to the smd-button on the frontpanel
> - G50 is "mpcie2_reset" connected to mPCIe2 reset line
> - G51 is "mpcie3_reset" connected to mPCIe3 reset line
>
> APU3 (https://pcengines.ch/schema/apu3c.pdf page 7):
> - G32 is "button_reset" connected to the smd-button on the frontpanel
> - G50 is "mpcie2_reset" connected to mPCIe2 reset line
> - G51 is "mpcie3_reset" connected to mPCIe3 reset line
> - G33 is "simswap" connected to SIM switch IC to swap the SIM between
>   mPCIe2 and mPCIe3 slot
>
> Signed-off-by: Florian Eckert <fe@dev.tdt.de>

This is looking better and better! Thanks to everyone helping out
and thanks for your perseverance Florian!

> +config GPIO_APU
> +       tristate "PC Engines APU2/APU3 GPIO support"
> +       depends on X86
> +       select GPIO_GENERIC

Excellent idea.

But it seems you are not using this. You would be using
it if you used bgpio_init() but if I understand correctly this
driver cannot use that because this GPIO is something like
one register per pin, correct?

Let me suggest:

> +struct apu_gpio_pdata {
> +       struct platform_device *pdev;
> +       struct gpio_chip *chip;

Make that a real member of this struct and not a pointer.
I.e. just remove the "*".

> +static struct apu_gpio_pdata *apu_gpio;

Why a static local? It seems you can just pass around
the pointer.

> +static int gpio_apu_get_dir(struct gpio_chip *chip, unsigned int offset)
> +{
> +       u32 val;
> +
> +       spin_lock(&apu_gpio->lock);
> +
> +       val = ~ioread32(apu_gpio->addr[offset]);
> +       val = (val >> APU_GPIO_BIT_DIR) & 1;

I would just:

#include <linux/bits.h>

val = ~ioread32(apu_gpio->addr[offset]);
spin_unlock();

return !!(val & BIT(APU_GPIO_BIT_DIR));

This clamps the value to [0,1] in a nice way.

> +static int gpio_apu_get_data(struct gpio_chip *chip, unsigned int offset)
> +{
> +       u32 val;
> +
> +       spin_lock(&apu_gpio->lock);
> +
> +       val = ioread32(apu_gpio->addr[offset]);
> +
> +       spin_unlock(&apu_gpio->lock);
> +
> +       return (val >> APU_GPIO_BIT_RD) & 1;

return !!(val & BIT(APU_GPIO_BIT_RD));

> +       return devm_gpiochip_add_data(&pdev->dev, apu_gpio->chip, NULL);

Instead of passing NULL pas apu_gpio as the last argument and in
all callbacks you can use:

struct apu_gpio_pdata *apu_gpio = gpiochip_get_data(gc);

To get a pointer to the per-instance state container.

Yours,
Linus Walleij
