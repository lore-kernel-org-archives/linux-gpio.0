From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2] gpiolib: return 0 or 1 in gpiod_get_value*() functions
Date: Thu, 10 Dec 2015 17:54:01 +0100
Message-ID: <CACRpkdYqX53dmg-SugBsGk-RYTXiLeAZkx1Ws5s8RMU6wjTjxA@mail.gmail.com>
References: <1448904631-30230-1-git-send-email-Jose.DiazdeGrenudePedro@digi.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1448904631-30230-1-git-send-email-Jose.DiazdeGrenudePedro@digi.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jose Diaz de Grenu de Pedro <Jose.DiazdeGrenudePedro@digi.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>, Hector Palacios <hector.palacios@digi.com>
List-Id: linux-gpio@vger.kernel.org

On Mon, Nov 30, 2015 at 6:30 PM, Jose Diaz de Grenu de Pedro
<Jose.DiazdeGrenudePedro@digi.com> wrote:

> Commit 79a9becda894 moved the awareness of active low state
> into the gpiod_get_value*() functions, but it only inverts the
> GPIO's raw value when it is active low. If the GPIO is active
> high, the gpiod_get_value*() functions return the raw value of
> the register, which can be any positive value.

No, because:

static int _gpiod_get_raw_value(const struct gpio_desc *desc)
{
        struct gpio_chip        *chip;
        int offset;
        int value;

        chip = desc->chip;
        offset = gpio_chip_hwgpio(desc);
        value = chip->get ? chip->get(chip, offset) : -EIO;
        value = value < 0 ? value : !!value;
        trace_gpio_value(desc_to_gpio(desc), 1, value);
        return value;
}

This returns a negative error code or the value clamped to [0,1]

Yours,
Linus Walleij
