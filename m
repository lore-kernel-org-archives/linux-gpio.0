From: Joel Stanley <joel@jms.id.au>
Subject: Re: [PATCH] gpio: aspeed: Remove dependence on GPIOF_* macros
Date: Thu, 2 Feb 2017 16:03:56 +1030
Message-ID: <CACPK8XcwRc__FscVSS9N3MOpyjigNFo4MiFQn0_qqxxE=q46oA@mail.gmail.com>
References: <20170202042817.8033-1-andrew@aj.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f65.google.com ([209.85.218.65]:35115 "EHLO
        mail-oi0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750808AbdBBFeS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 2 Feb 2017 00:34:18 -0500
In-Reply-To: <20170202042817.8033-1-andrew@aj.id.au>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Andrew Jeffery <andrew@aj.id.au>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, OpenBMC Maillist <openbmc@lists.ozlabs.org>

On Thu, Feb 2, 2017 at 2:58 PM, Andrew Jeffery <andrew@aj.id.au> wrote:
> 1736f75d35e47409ad776273133d0f558a4c8253 is a (v2) patch which had
> unresolved review comments[1]. Address the comments by removing the use
> of macros from the consumer header (this patch represents the diff
> between v2 and v3[2]).
>
> [1] https://lkml.org/lkml/2017/1/26/337
> [2] https://lkml.org/lkml/2017/1/26/786
>
> Fixes: 1736f75d35e4 ("gpio: aspeed: Add banks Y, Z, AA, AB and AC")
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>

Acked-by: Joel Stanley <joel@jms.id.au>

Cheers,

Joel

> ---
>
> Note: This should be applied to pinctrl/devel where the linked GPIO patches
> have landed. See discussion at https://lkml.org/lkml/2017/2/1/390
>
>  drivers/gpio/gpio-aspeed.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpio/gpio-aspeed.c b/drivers/gpio/gpio-aspeed.c
> index 6e4b278a82f1..fb16cc771c0d 100644
> --- a/drivers/gpio/gpio-aspeed.c
> +++ b/drivers/gpio/gpio-aspeed.c
> @@ -15,7 +15,6 @@
>  #include <linux/io.h>
>  #include <linux/spinlock.h>
>  #include <linux/platform_device.h>
> -#include <linux/gpio.h>
>  #include <linux/gpio/driver.h>
>  #include <linux/pinctrl/consumer.h>
>
> @@ -259,10 +258,10 @@ static int aspeed_gpio_get_direction(struct gpio_chip *gc, unsigned int offset)
>         u32 val;
>
>         if (!have_input(gpio, offset))
> -               return GPIOF_DIR_OUT;
> +               return 0;
>
>         if (!have_output(gpio, offset))
> -               return GPIOF_DIR_IN;
> +               return 1;
>
>         spin_lock_irqsave(&gpio->lock, flags);
>
> --
> 2.9.3
>
