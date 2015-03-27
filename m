From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [RFC] gpio: add set_active_low() function to gpio_chip
Date: Fri, 27 Mar 2015 09:45:58 +0100
Message-ID: <CACRpkdZDA9Tz3rk++3iJWfLvWCXFiJSMLtG4PpfcV1aB0SXscA@mail.gmail.com>
References: <1426709782-2763-1-git-send-email-david.a.cohen@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1426709782-2763-1-git-send-email-david.a.cohen@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: David Cohen <david.a.cohen@linux.intel.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Wed, Mar 18, 2015 at 9:16 PM, David Cohen
<david.a.cohen@linux.intel.com> wrote:

> +++ b/drivers/gpio/gpiolib-sysfs.c
> @@ -289,11 +289,15 @@ static DEVICE_ATTR(edge, 0644, gpio_edge_show, gpio_edge_store);
>  static int sysfs_set_active_low(struct gpio_desc *desc, struct device *dev,
>                                 int value)
>  {
> +       struct gpio_chip        *chip = desc->chip;
>         int                     status = 0;
>
>         if (!!test_bit(FLAG_ACTIVE_LOW, &desc->flags) == !!value)
>                 return 0;
>
> +       if (chip->set_active_low)
> +               chip->set_active_low(chip, gpio_chip_hwgpio(desc), value);
> +
>         if (value)
>                 set_bit(FLAG_ACTIVE_LOW, &desc->flags);

Since the only user seems to be this abominable sysfs, and since that is
definitely not on the hotpath due to context switching, this cannot possibly
gain any performance benefits.

Unless we can come up with a use case where this actually improves
performance we should just let software handle this instead.

I like to have all hardware features implemented usually, so I'm a bit
torn. But this one lacks a plausible use case. It looks like some hardware
engineers attempt to be helpful to software developers.

Any takers?

Yours,
Linus Walleij
