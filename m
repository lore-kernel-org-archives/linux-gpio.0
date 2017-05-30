From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH][V2] gpiolib: remove unused variable 'i'
Date: Tue, 30 May 2017 16:12:27 +0300
Message-ID: <CAHp75Vf2NuqPOGak4az41L3LHR0F2Mcerw4b-1p5gNLyLxctZA@mail.gmail.com>
References: <20170530110206.785-1-colin.king@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qt0-f195.google.com ([209.85.216.195]:33953 "EHLO
        mail-qt0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750890AbdE3NM2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 30 May 2017 09:12:28 -0400
In-Reply-To: <20170530110206.785-1-colin.king@canonical.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Colin King <colin.king@canonical.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, kernel-janitors@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Tue, May 30, 2017 at 2:02 PM, Colin King <colin.king@canonical.com> wrote:
> From: Colin Ian King <colin.king@canonical.com>
>
> Fixes smatch warning:unused variable 'i' [-Wunused-variable]

Arnd was faster :)

https://lkml.org/lkml/2017/5/30/224

>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/gpio/gpiolib.c                   | 2 --
>  sound/soc/generic/audio-graph-scu-card.c | 2 +-
>  2 files changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index be8097097326..62ffb4e293d2 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -1471,8 +1471,6 @@ static struct gpio_chip *find_chip_by_name(const char *name)
>
>  static int gpiochip_irqchip_init_valid_mask(struct gpio_chip *gpiochip)
>  {
> -       int i;
> -
>         if (!gpiochip->irq_need_valid_mask)
>                 return 0;
>
>



-- 
With Best Regards,
Andy Shevchenko
