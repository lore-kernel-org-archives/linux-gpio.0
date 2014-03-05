From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: clamp returned values to the boolean range
Date: Wed, 5 Mar 2014 09:49:24 +0800
Message-ID: <CACRpkdY-oBdxxWhsGraEU31qyu+RWJAiRA+KEip6QNW3jRwGUA@mail.gmail.com>
References: <1393378800-7220-1-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1393378800-7220-1-git-send-email-acourbot@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>
List-Id: linux-gpio@vger.kernel.org

On Wed, Feb 26, 2014 at 9:40 AM, Alexandre Courbot <acourbot@nvidia.com> wrote:

> Nothing prevents GPIO drivers from returning values outside the
> boolean range, and as it turns out a few drivers are actually doing so.
> These values were passed as-is to unsuspecting consumers and created
> confusion.
>
> This patch makes the internal _gpiod_get_raw_value() function return a
> bool, effectively clamping the GPIO value to the boolean range no
> matter what the driver does.

No, that will not be the semantic effect of this patch, bool is just
another name for an int, maybe some static checkers will be able
to use it however.

If you really want the desired semantic effect, do this:

static int _gpiod_get_raw_value(const struct gpio_desc *desc)
{
        struct gpio_chip        *chip;
-        int value;
+       bool value;
        int offset;

        chip = desc->chip;
        offset = gpio_chip_hwgpio(desc);
-        value = chip->get ? chip->get(chip, offset) : 0;
+        value = chip->get ? !!(chip->get(chip, offset)) : false;
        trace_gpio_value(desc_to_gpio(desc), 1, value);
        return value;
}

Can you please update the patch accordingly, maybe also the
commit message.

Yours,
Linus Walleij
