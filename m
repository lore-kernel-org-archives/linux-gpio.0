From: Axel Lin <axel.lin@ingics.com>
Subject: Re: [PATCH 2/2] gpio: mb86s70: Revert "Return error if requesting an
 already assigned gpio"
Date: Sat, 28 Oct 2017 09:53:12 +0800
Message-ID: <CAFRkauAjui8WbA6G977b9xVYk3nRQEXZCwRy1+0DX0Ah1CB7FQ@mail.gmail.com>
References: <20171027202148.4188-1-ard.biesheuvel@linaro.org> <20171027202148.4188-3-ard.biesheuvel@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wr0-f196.google.com ([209.85.128.196]:48898 "EHLO
        mail-wr0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750915AbdJ1BxN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 27 Oct 2017 21:53:13 -0400
Received: by mail-wr0-f196.google.com with SMTP id 15so7620371wrb.5
        for <linux-gpio@vger.kernel.org>; Fri, 27 Oct 2017 18:53:13 -0700 (PDT)
In-Reply-To: <20171027202148.4188-3-ard.biesheuvel@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Daniel Thompson <daniel.thompson@linaro.org>, leif.lindholm@linaro.org, Jassi Brar <jaswinder.singh@linaro.org>, masami.hiramatsu@linaro.org

2017-10-28 4:21 GMT+08:00 Ard Biesheuvel <ard.biesheuvel@linaro.org>:
> Commit fd9c963c5661 ("gpio: mb86s70: Return error if requesting an
> already assigned gpio") adds code that infers from the state of the
> GPIO Pin Function Register (PFR) whether a GPIO has been assigned
> already. This assumes that the pin functions are set to 'peripheral'
> when the driver is loaded, which is not guaranteed. Also, the GPIO
> layer is perfectly capable of keeping track of which GPIOs have been
> assigned already, so we shouldn't need this check in the first place.
Yes, agree.
Acked-by: Axel Lin <axel.lin@ingics.com>

>
> This reverts commit fd9c963c5661af3403e77e312c0d9941773b6c1b.
>
> Cc: Axel Lin <axel.lin@ingics.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Ard Biesheuvel <ard.biesheuvel@linaro.org>
> ---
>  drivers/gpio/gpio-mb86s7x.c | 5 -----
>  1 file changed, 5 deletions(-)
>
> diff --git a/drivers/gpio/gpio-mb86s7x.c b/drivers/gpio/gpio-mb86s7x.c
> index 6e1598471733..5cd77dcdbb16 100644
> --- a/drivers/gpio/gpio-mb86s7x.c
> +++ b/drivers/gpio/gpio-mb86s7x.c
> @@ -53,11 +53,6 @@ static int mb86s70_gpio_request(struct gpio_chip *gc, unsigned gpio)
>         spin_lock_irqsave(&gchip->lock, flags);
>
>         val = readl(gchip->base + PFR(gpio));
> -       if (!(val & OFFSET(gpio))) {
> -               spin_unlock_irqrestore(&gchip->lock, flags);
> -               return -EINVAL;
> -       }
> -
>         val &= ~OFFSET(gpio);
>         writel(val, gchip->base + PFR(gpio));
>
> --
> 2.11.0
>
