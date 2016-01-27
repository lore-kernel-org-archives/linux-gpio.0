From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [PATCH] gpio: check first for invalid gpio
Date: Wed, 27 Jan 2016 09:24:14 +0900
Message-ID: <CAAVeFuLveMieca-OuQO9tATPL4629YapB4c8xBRdid31sknEyA@mail.gmail.com>
References: <1451637053-17283-1-git-send-email-sudipm.mukherjee@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f178.google.com ([209.85.223.178]:33904 "EHLO
	mail-io0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751110AbcA0AYe (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 26 Jan 2016 19:24:34 -0500
In-Reply-To: <1451637053-17283-1-git-send-email-sudipm.mukherjee@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Fri, Jan 1, 2016 at 5:30 PM, Sudip Mukherjee
<sudipm.mukherjee@gmail.com> wrote:
> Even if an invalid gpio number is sent to gpio_to_desc() we try to find
> it in the list before checking if it is invalid. We can check it first
> so that it will save us from traversing the list incase of invalid gpio.

The motivation for having that test at the end is that being provided
an invalid GPIO number should be the exceptional case (i.e. it does
not happen unless there is an error in the client code). Thus for
valid GPIOs (the vast majority) we find an entry in the list and save
that test.

>
> Signed-off-by: Sudip Mukherjee <sudip@vectorindia.org>
> ---
>  drivers/gpio/gpiolib.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index ca66302..17a1cd5 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -70,6 +70,11 @@ struct gpio_desc *gpio_to_desc(unsigned gpio)
>         struct gpio_chip *chip;
>         unsigned long flags;
>
> +       if (!gpio_is_valid(gpio)) {
> +               WARN(1, "invalid GPIO %d\n", gpio);
> +               return NULL;
> +       }
> +
>         spin_lock_irqsave(&gpio_lock, flags);
>
>         list_for_each_entry(chip, &gpio_chips, list) {
> @@ -81,9 +86,6 @@ struct gpio_desc *gpio_to_desc(unsigned gpio)
>
>         spin_unlock_irqrestore(&gpio_lock, flags);
>
> -       if (!gpio_is_valid(gpio))
> -               WARN(1, "invalid GPIO %d\n", gpio);
> -
>         return NULL;
>  }
>  EXPORT_SYMBOL_GPL(gpio_to_desc);
> --
> 1.9.1
>
