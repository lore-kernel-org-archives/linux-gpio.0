From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] gpio: export add/remove lookup table functions
Date: Fri, 21 Apr 2017 22:24:49 +0300
Message-ID: <CAHp75VeHmOpSAAZM87_0Y120mrXpPG0aCns=Zp5tBTMh3GBXmw@mail.gmail.com>
References: <1492723400-16657-1-git-send-email-agust@denx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qk0-f195.google.com ([209.85.220.195]:36044 "EHLO
        mail-qk0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1424812AbdDUTYu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 21 Apr 2017 15:24:50 -0400
In-Reply-To: <1492723400-16657-1-git-send-email-agust@denx.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Anatolij Gustschin <agust@denx.de>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>

On Fri, Apr 21, 2017 at 12:23 AM, Anatolij Gustschin <agust@denx.de> wrote:
> For hot-pluggable devices adding GPIOs dynamically we need to
> assemble and add the gpio lookup tables at probe time in modules,
> so that requesting these GPIOs in attached drivers can work.
> Export lookup table functions for modules.
>
> Signed-off-by: Anatolij Gustschin <agust@denx.de>

...and still a question "Do we go with stubs for them in case of !GPIOLIB?"

Patch below looks good to me:
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

> ---
>  drivers/gpio/gpiolib.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index 4aa1e78..9196b1e 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -3008,6 +3008,7 @@ void gpiod_add_lookup_table(struct gpiod_lookup_table *table)
>
>         mutex_unlock(&gpio_lookup_lock);
>  }
> +EXPORT_SYMBOL_GPL(gpiod_add_lookup_table);
>
>  /**
>   * gpiod_remove_lookup_table() - unregister GPIO device consumers
> @@ -3021,6 +3022,7 @@ void gpiod_remove_lookup_table(struct gpiod_lookup_table *table)
>
>         mutex_unlock(&gpio_lookup_lock);
>  }
> +EXPORT_SYMBOL_GPL(gpiod_remove_lookup_table);
>
>  static struct gpiod_lookup_table *gpiod_find_lookup_table(struct device *dev)
>  {
> --
> 2.7.4
>



-- 
With Best Regards,
Andy Shevchenko
