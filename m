From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3 2/2] gpio: add Technologic I2C-FPGA gpio support
Date: Fri, 12 Aug 2016 15:48:34 +0200
Message-ID: <CACRpkdZL3=DDy1L4xZ9dkds=n-UpyVPHomhhda0QcWtOW02TBw@mail.gmail.com>
References: <1470947524-8137-1-git-send-email-lucile.quirion@savoirfairelinux.com>
 <1470947524-8137-3-git-send-email-lucile.quirion@savoirfairelinux.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1470947524-8137-3-git-send-email-lucile.quirion@savoirfairelinux.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Lucile Quirion <lucile.quirion@savoirfairelinux.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>, kernel <kernel@savoirfairelinux.com>
List-Id: linux-gpio@vger.kernel.org

On Thu, Aug 11, 2016 at 10:32 PM, Lucile Quirion
<lucile.quirion@savoirfairelinux.com> wrote:

> This driver is generic and aims to support all Technologic Systems's
> boards embedding FPGA GPIOs with an I2C interface.
>
> This driver supports TS-4900, TS-7970, TS-7990 and TS-4100 series.
>
> Signed-off-by: Lucile Quirion <lucile.quirion@savoirfairelinux.com>

Much smaller and nicer now :)

> +config GPIO_TS4900
> +       tristate "Technologic Systems FPGA I2C GPIO"

select REGMAP_I2C

Here.

> +#include <linux/gpio.h>

Drop that. You should not use this header in drivers.

> +static int ts4900_gpio_get_direction(struct gpio_chip *chip,
> +                                    unsigned int offset)
> +{
> +       struct ts4900_gpio_priv *priv = gpiochip_get_data(chip);
> +       unsigned int reg;
> +
> +       regmap_read(priv->regmap, offset, &reg);
> +
> +       return (reg & TS4900_GPIO_OE) ? GPIOF_DIR_OUT : GPIOF_DIR_IN;

Do not use GPIOF_DIR_OUT/GPIOF_DIR_IN. These are for the
machine descriptions, not drivers. Just return 0/1.

You can even:

return !(reg & TS4900_GPIO_OE);

I think that returns 0 on output and 1 on input.

After these fixes I will be happy I think.

Yours,
Linus Walleij
