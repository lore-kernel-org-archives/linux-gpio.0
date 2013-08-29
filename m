From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpiolib: Fix crash when exporting non-existant gpio
Date: Thu, 29 Aug 2013 11:52:44 +0200
Message-ID: <CACRpkdYTytiOd=Lhb84XTKZpOWe20sqFxzwNf_0U8hvoy5deUA@mail.gmail.com>
References: <1377370108-2867-1-git-send-email-daniel.santos@pobox.com>
	<1377377305-11695-1-git-send-email-daniel.santos@pobox.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oa0-f52.google.com ([209.85.219.52]:62104 "EHLO
	mail-oa0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755867Ab3H2Jwo (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 29 Aug 2013 05:52:44 -0400
Received: by mail-oa0-f52.google.com with SMTP id f4so236627oah.39
        for <linux-gpio@vger.kernel.org>; Thu, 29 Aug 2013 02:52:44 -0700 (PDT)
In-Reply-To: <1377377305-11695-1-git-send-email-daniel.santos@pobox.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Daniel Santos <daniel.santos@pobox.com>, Alexandre Courbot <acourbot@nvidia.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Guenter Roeck <linux@roeck-us.net>, Alexandre Courbot <gnurou@gmail.com>

On Sat, Aug 24, 2013 at 10:48 PM,  <danielfsantos@att.net> wrote:

> [  222.961384] Unable to handle kernel NULL pointer dereference at
> virtual address 00000044
> [  222.969486] pgd = d97d0000
> [  222.972190] [00000044] *pgd=1aaca831, *pte=00000000, *ppte=00000000
> [  222.978483] Internal error: Oops: 17 [#1] PREEMPT ARM
> ---
>  drivers/gpio/gpiolib.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index d6413b2..db7c6bb 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -123,7 +123,8 @@ static int gpio_chip_hwgpio(const struct gpio_desc *desc)
>   */
>  static struct gpio_desc *gpio_to_desc(unsigned gpio)
>  {
> -       if (WARN(!gpio_is_valid(gpio), "invalid GPIO %d\n", gpio))
> +       if (WARN(!gpio_is_valid(gpio) || !gpio_desc[gpio].chip,
> +                       "invalid GPIO %d\n", gpio))
>                 return NULL;
>         else
>                 return &gpio_desc[gpio];
> @@ -1406,8 +1407,7 @@ static int gpiod_request(struct gpio_desc *desc, const char *label)
>         spin_lock_irqsave(&gpio_lock, flags);
>
>         chip = desc->chip;
> -       if (chip == NULL)
> -               goto done;
> +       BUG_ON(!chip);

It'd be good if Alexandre took a look at this.

BUG_ON() is pretty nasty, atleast replace it with
a warning.

Yours,
Linus Walleij
