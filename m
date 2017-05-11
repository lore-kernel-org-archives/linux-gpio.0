From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v4] gpiolib: Add stubs for gpiod lookup table interface
Date: Thu, 11 May 2017 22:02:41 +0300
Message-ID: <CAHp75VdziFXdN6an9XdNtL_kAOu_iBtDqu7n26EY0wkR6mkDKA@mail.gmail.com>
References: <1494527071-6412-1-git-send-email-agust@denx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qk0-f194.google.com ([209.85.220.194]:35648 "EHLO
        mail-qk0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933927AbdEKTCm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 11 May 2017 15:02:42 -0400
In-Reply-To: <1494527071-6412-1-git-send-email-agust@denx.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Anatolij Gustschin <agust@denx.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Thu, May 11, 2017 at 9:24 PM, Anatolij Gustschin <agust@denx.de> wrote:
> Add stubs for gpiod_add_lookup_table() and gpiod_remove_lookup_table()
> for the !GPIOLIB case to prevent build errors.
>

Thanks!

FWIW:
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

It will fix this kbuild bot complain: https://lkml.org/lkml/2017/4/2/209

> Signed-off-by: Anatolij Gustschin <agust@denx.de>
> ---
> Changes in v4:
>  - move stubs to gpio/machine.h
>
> Changes in v3:
>  - add stubs for !GPIOLIB case. Drop prototypes, these are
>    already in gpio/machine.h
>
> Changes in v2:
>  - move gpiod_lookup_table out of #ifdef
>
>  include/linux/gpio/machine.h | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/include/linux/gpio/machine.h b/include/linux/gpio/machine.h
> index c0d712d..f738d50 100644
> --- a/include/linux/gpio/machine.h
> +++ b/include/linux/gpio/machine.h
> @@ -56,7 +56,14 @@ struct gpiod_lookup_table {
>         .flags = _flags,                                                  \
>  }
>
> +#ifdef CONFIG_GPIOLIB
>  void gpiod_add_lookup_table(struct gpiod_lookup_table *table);
>  void gpiod_remove_lookup_table(struct gpiod_lookup_table *table);
> +#else
> +static inline
> +void gpiod_add_lookup_table(struct gpiod_lookup_table *table) {}
> +static inline
> +void gpiod_remove_lookup_table(struct gpiod_lookup_table *table) {}
> +#endif
>
>  #endif /* __LINUX_GPIO_MACHINE_H */
> --
> 2.7.4
>



-- 
With Best Regards,
Andy Shevchenko
