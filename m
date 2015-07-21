From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [PATCH] gpio: remove unneeded initializer in gpiochip_add_to_list()
Date: Tue, 21 Jul 2015 14:50:49 +0900
Message-ID: <CAAVeFuKMvTmwkPdVB4-6-sr1ErZ6FUzc+_UEvhz=Nq3Na=N5NA@mail.gmail.com>
References: <1437457540-1778-1-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lb0-f179.google.com ([209.85.217.179]:36441 "EHLO
	mail-lb0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751027AbbGUFvK (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 21 Jul 2015 01:51:10 -0400
In-Reply-To: <1437457540-1778-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Tue, Jul 21, 2015 at 2:45 PM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
> This variable is used as an iterator and initialized in the
> list_for_each() loop.
>

Looks good, thanks!

Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>

> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
>
>  drivers/gpio/gpiolib.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index bf4bd1d..adb03c6 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -190,7 +190,7 @@ EXPORT_SYMBOL_GPL(gpiod_get_direction);
>   */
>  static int gpiochip_add_to_list(struct gpio_chip *chip)
>  {
> -       struct list_head *pos = &gpio_chips;
> +       struct list_head *pos;
>         struct gpio_chip *_chip;
>         int err = 0;
>
> --
> 1.9.1
>
