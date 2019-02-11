From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] iio: adc: ti-ads7950: add GPIO support
Date: Mon, 11 Feb 2019 09:34:13 +0100
Message-ID: <CACRpkdY-nZrX0EDgsE79egVDK9Lmrj_+gJN6h9B3SQT1z3OUzA@mail.gmail.com>
References: <1549653856-47409-1-git-send-email-justinpopo6@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1549653856-47409-1-git-send-email-justinpopo6@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Justin Chen <justinpopo6@gmail.com>
Cc: linux-iio@vger.kernel.org, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>, Florian Fainelli <f.fainelli@gmail.com>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Jonathan Cameron <jic23@kernel.org>, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald <pmeerw@pmeerw.net>, David Lechner <david@lechnology.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

Hi Justin,

thanks for your patch!

On Fri, Feb 8, 2019 at 8:25 PM <justinpopo6@gmail.com> wrote:

> From: Justin Chen <justinpopo6@gmail.com>
>
> The ADS79XX has GPIO pins that can be used. Add support for the GPIO
> pins using the GPIO chip framework.
>
> Signed-off-by: Justin Chen <justinpopo6@gmail.com>
(...)

> @@ -56,11 +61,17 @@ struct ti_ads7950_state {
>         struct spi_message      ring_msg;
>         struct spi_message      scan_single_msg;
>
> +       struct iio_dev          *indio_dev;
> +       struct gpio_chip        *chip;

Why use a pointer here? Correct me if wrong by a struct ti_ads7950_state is
always allocated for each instance of the hardware right?
So just struct gpio_chip chip; should be fine, then just fill in that
struct.

> +       /* Add GPIO chip */
> +       st->chip->label = dev_name(&st->spi->dev);

So it would be st->chip.label = ... etc.

> +       chip = devm_kzalloc(&spi->dev, sizeof(*chip), GFP_KERNEL);
> +       if (!chip)
> +               return -ENOMEM;

And no need to do this.

Apart from that it looks OK to me, but there are some locking comments
I see.

Yours,
Linus Walleij
