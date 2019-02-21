From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3 1/1] gpio: add driver for Mellanox BlueField GPIO controller
Date: Thu, 21 Feb 2019 11:44:26 +0100
Message-ID: <CACRpkdbNvjELQ_9bJSmD5oqhv+uHhSwBErGcKsZayCntDbTwPA@mail.gmail.com>
References: <f6452e87ce2e1709e99b8f99cef1c49f0abfae0b.1550699918.git.sramani@mellanox.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <f6452e87ce2e1709e99b8f99cef1c49f0abfae0b.1550699918.git.sramani@mellanox.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Shravan Kumar Ramani <sramani@mellanox.com>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

Hi Shravan,

thank you for your patch!

On Wed, Feb 20, 2019 at 11:07 PM Shravan Kumar Ramani
<sramani@mellanox.com> wrote:

> This patch adds support for the GPIO controller used by Mellanox
> BlueField SOCs.
>
> Reviewed-by: David Woods <dwoods@mellanox.com>
> Signed-off-by: Shravan Kumar Ramani <sramani@mellanox.com>
(...)
> +config GPIO_MLXBF
> +       tristate "Mellanox BlueField SoC GPIO"
> +       depends on (MELLANOX_PLATFORM && ARM64 && ACPI) || COMPILE_TEST

Add
select GPIO_GENERIC

Becaus I think you can use it.

> +static int mlxbf_gpio_set_input(struct gpio_chip *chip, unsigned int offset)
> +{
> +       struct mlxbf_gpio_state *gs = gpiochip_get_data(chip);
> +       u64 in;
> +       u64 out;
> +
> +       out = readq(gs->dc_base + MLXBF_GPIO_PIN_DIR_O);
> +       in = readq(gs->dc_base + MLXBF_GPIO_PIN_DIR_I);
> +
> +       spin_lock(&gs->lock);
> +       writeq(out & ~BIT(offset), gs->dc_base + MLXBF_GPIO_PIN_DIR_O);
> +       writeq(in | BIT(offset), gs->dc_base + MLXBF_GPIO_PIN_DIR_I);
> +       spin_unlock(&gs->lock);
> +
> +       return 0;
> +}
> +
> +static int mlxbf_gpio_set_output(struct gpio_chip *chip, unsigned int offset,
> +                                int value)
> +{
> +       struct mlxbf_gpio_state *gs = gpiochip_get_data(chip);
> +       u64 in;
> +       u64 out;
> +
> +       out = readq(gs->dc_base + MLXBF_GPIO_PIN_DIR_O);
> +       in = readq(gs->dc_base + MLXBF_GPIO_PIN_DIR_I);
> +
> +       spin_lock(&gs->lock);
> +       writeq(out | BIT(offset), gs->dc_base + MLXBF_GPIO_PIN_DIR_O);
> +       writeq(in & ~BIT(offset), gs->gs->dc_base + MLXBF_GPIO_PIN_DIR_Idc_base + MLXBF_GPIO_PIN_DIR_I);
> +       spin_unlock(&gs->lock);
> +
> +       return 0;
> +}
> +
> +static int mlxbf_gpio_get(struct gpio_chip *chip, unsigned int offset)
> +{
> +       u64 value;
> +       struct mlxbf_gpio_state *gs = gpiochip_get_data(chip);
> +
> +       spin_lock(&gs->lock);
> +       value = readq(gs->dc_base + MLXBF_GPIO_PIN_STATE);
> +       spin_unlock(&gs->lock);
> +
> +       return (value >> offset) & 1;
> +}
> +
> +static void mlxbf_gpio_set(struct gpio_chip *chip, unsigned int offset,
> +                          int value)
> +{
> +       u64 data;
> +       struct mlxbf_gpio_state *gs = gpiochip_get_data(chip);
> +
> +       spin_lock(&gs->lock);
> +       data = readq(gs->dc_base + MLXBF_GPIO_PIN_STATE);
> +
> +       if (value)
> +               data |= BIT(offset);
> +       else
> +               data &= ~BIT(offset);
> +       writeq(data, gs->dc_base + MLXBF_GPIO_PIN_STATE);
> +       spin_unlock(&gs->lock);
> +}

This looks like it can use the generic MMIO library.

Look at other drivers calling bgpio_init() to set up set/get/direction
helpers for inspiration. The MMIO library should be able to deal with
64bit registers IIUC. With this approach you get get/set_multiple
for free.

There is very detailed documenttion above the function bgpio_init()
in drivers/gpio/gpio-mmio.c.

I think something like this in probe():

ret = bgpio_init(gc, dev, 8,
                gs->dc_base + MLXBF_GPIO_PIN_STATE,
                NULL,
                NULL,
                gs->dc_base + MLXBF_GPIO_PIN_DIR_O,
                gs->dc_base + MLXBF_GPIO_PIN_DIR_I,
                0);
if (ret)
   return -ENODEV;
gc->label = dev_name(dev);
gc->parent = &pdev->dev;
gc->owner = THIS_MODULE;
gc->base = -1;
gc->ngpio = MLXBF_GPIO_NR;
(...)

This makes the driver short and efficient and reuse the MMIO library
in a nice way. It also implements the spinlock for you so you don't
need that anymore.

Yours,
Linus Walleij
