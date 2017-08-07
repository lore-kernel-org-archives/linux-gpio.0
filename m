From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 4/5] gpio: Add support for LMP92001 GPIO
Date: Mon, 7 Aug 2017 11:15:18 +0200
Message-ID: <CACRpkdZgWM6OJzoKhE2O5FATgkDwrRvuCSQZ2=szObTrF_c7RQ@mail.gmail.com>
References: <1501578947-4692-1-git-send-email-s.abhisit@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f49.google.com ([209.85.214.49]:37688 "EHLO
        mail-it0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752299AbdHGJPT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 7 Aug 2017 05:15:19 -0400
Received: by mail-it0-f49.google.com with SMTP id 76so20537ith.0
        for <linux-gpio@vger.kernel.org>; Mon, 07 Aug 2017 02:15:19 -0700 (PDT)
In-Reply-To: <1501578947-4692-1-git-send-email-s.abhisit@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: s.abhisit@gmail.com
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Tue, Aug 1, 2017 at 11:15 AM,  <s.abhisit@gmail.com> wrote:

> From: Abhisit Sangjan <s.abhisit@gmail.com>

That is a bit terse commit message for an entire new driver.
Elaborate some please.

> +#include <linux/gpio.h>

#include <linux/gpio/driver.h>

ONLY please.

> +#include <linux/platform_device.h>
> +#include <linux/seq_file.h>
> +#include <linux/mfd/core.h>
> +#include <linux/version.h>

Why? Supporting old kernels? We don't do that upstream.

Add this:
#include <linux/bitops.h>

(See below)

> +static inline struct lmp92001_gpio *to_lmp92001_gpio(struct gpio_chip *chip)
> +{
> +        return container_of(chip, struct lmp92001_gpio, gpio_chip);
> +}

Do not use this. Use the new devm_gpiochip_add_data() and pass a state container
as you data pointer.

> +
> +static int lmp92001_gpio_get_direction(struct gpio_chip *chip, unsigned offset)
> +{
> +        struct lmp92001_gpio *lmp92001_gpio = to_lmp92001_gpio(chip);

Then use this:
struct lmp92001_gpio *lmp92001_gpio = gpiochip_get_data(chip);

> +        return (val >> offset) & 1;

Do this:

return !!(val &BIT(offset));

> +static int lmp92001_gpio_direction_in(struct gpio_chip *chip, unsigned offset)
> +{
> +        struct lmp92001_gpio *lmp92001_gpio = to_lmp92001_gpio(chip);
> +        struct lmp92001 *lmp92001 =  lmp92001_gpio->lmp92001;
> +
> +        return regmap_update_bits(lmp92001->regmap, LMP92001_CGPO, 1 << offset,
> +                        1 << offset);

return regmap_update_bits(lmp92001->regmap, LMP92001_CGPO,
BIT(offset), BIT(offset));

But seriously: why do you need to mask the bit even?

return regmap_update_bits(lmp92001->regmap, LMP92001_CGPO, 0, BIT(offset));

should work shouldn't it?

Use the bitops BIT() and state container gpiochip_get_data() and resend
and I will look at more details.

Yours,
Linus Walleij
