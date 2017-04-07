From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH RFC] gpio: f7188x: Add F71889A GPIO support.
Date: Fri, 7 Apr 2017 09:07:30 +0200
Message-ID: <CACRpkdYJqV86NYsNqPpcDmK7zD1KLFKNWgnX2mo2rmJScC3tGg@mail.gmail.com>
References: <20170406033039.qgs5nb4dnvpjhqtu@tha-monstah.mydomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f175.google.com ([209.85.223.175]:36764 "EHLO
        mail-io0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753070AbdDGHHc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 7 Apr 2017 03:07:32 -0400
Received: by mail-io0-f175.google.com with SMTP id l7so44125266ioe.3
        for <linux-gpio@vger.kernel.org>; Fri, 07 Apr 2017 00:07:32 -0700 (PDT)
In-Reply-To: <20170406033039.qgs5nb4dnvpjhqtu@tha-monstah.mydomain>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Marty Plummer <netz.kernel@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Cc: Alexandre Courbot <gnurou@gmail.com>

Top-posting so that the GPIO mailing list gets a copy.

Does it work? It seems simple so should I just apply it?

Yours,
Linus Walleij

On Thu, Apr 6, 2017 at 5:30 AM, Marty Plummer <netz.kernel@gmail.com> wrote:
> Add F71889A GPIO support.
>
> Fintek F71889A is a SuperIO. It contains HWMON/GPIO/Serial Ports.
>
> Datasheet:
> http://www.alldatasheet.com/datasheet-pdf/pdf/459076/FINTEK/F71889A.html
>
> Its virtually identical to the F71889F superio as far as gpios go.
>
> One oddity is GPIO2 at index 0xD0; the datasheet only lists gpio's 7-5,
> but it logically seems that it should continue down to 0. I'm not sure
> if the driver can handle gpios that are shifted away from index 0 as it
> currently stands.
>
> Signed-off-by: Marty Plummer <netz.kernel@gmail.com>
> ---
>  drivers/gpio/gpio-f7188x.c | 23 +++++++++++++++++++++--
>  1 file changed, 21 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpio/gpio-f7188x.c b/drivers/gpio/gpio-f7188x.c
> index 56bd76c33767..c013ff5deb70 100644
> --- a/drivers/gpio/gpio-f7188x.c
> +++ b/drivers/gpio/gpio-f7188x.c
> @@ -37,14 +37,16 @@
>  #define SIO_F71869A_ID         0x1007  /* F71869A chipset ID */
>  #define SIO_F71882_ID          0x0541  /* F71882 chipset ID */
>  #define SIO_F71889_ID          0x0909  /* F71889 chipset ID */
> +#define SIO_F71889A_ID         0x1005  /* F71889A chipset ID */
>  #define SIO_F81866_ID          0x1010  /* F81866 chipset ID */
>
> -enum chips { f71869, f71869a, f71882fg, f71889f, f81866 };
> +enum chips { f71869, f71869a, f71882fg, f71889a, f71889f, f81866 };
>
>  static const char * const f7188x_names[] = {
>         "f71869",
>         "f71869a",
>         "f71882fg",
> +       "f71889a",
>         "f71889f",
>         "f81866",
>  };
> @@ -187,6 +189,17 @@ static struct f7188x_gpio_bank f71882_gpio_bank[] = {
>         F7188X_GPIO_BANK(40, 4, 0xB0),
>  };
>
> +static struct f7188x_gpio_bank f71889a_gpio_bank[] = {
> +       F7188X_GPIO_BANK(0, 7, 0xF0),
> +       F7188X_GPIO_BANK(10, 7, 0xE0),
> +       F7188X_GPIO_BANK(20, 8, 0xD0),
> +       F7188X_GPIO_BANK(30, 8, 0xC0),
> +       F7188X_GPIO_BANK(40, 8, 0xB0),
> +       F7188X_GPIO_BANK(50, 5, 0xA0),
> +       F7188X_GPIO_BANK(60, 8, 0x90),
> +       F7188X_GPIO_BANK(70, 8, 0x80),
> +};
> +
>  static struct f7188x_gpio_bank f71889_gpio_bank[] = {
>         F7188X_GPIO_BANK(0, 7, 0xF0),
>         F7188X_GPIO_BANK(10, 7, 0xE0),
> @@ -382,6 +395,9 @@ static int f7188x_gpio_probe(struct platform_device *pdev)
>                 data->nr_bank = ARRAY_SIZE(f71882_gpio_bank);
>                 data->bank = f71882_gpio_bank;
>                 break;
> +       case f71889a:
> +               data->nr_bank = ARRAY_SIZE(f71889a_gpio_bank);
> +               data->bank = f71889a_gpio_bank;
>         case f71889f:
>                 data->nr_bank = ARRAY_SIZE(f71889_gpio_bank);
>                 data->bank = f71889_gpio_bank;
> @@ -443,6 +459,9 @@ static int __init f7188x_find(int addr, struct f7188x_sio *sio)
>         case SIO_F71882_ID:
>                 sio->type = f71882fg;
>                 break;
> +       case SIO_F71889A_ID:
> +               sio->type = f71889a;
> +               break;
>         case SIO_F71889_ID:
>                 sio->type = f71889f;
>                 break;
> @@ -538,6 +557,6 @@ static void __exit f7188x_gpio_exit(void)
>  }
>  module_exit(f7188x_gpio_exit);
>
> -MODULE_DESCRIPTION("GPIO driver for Super-I/O chips F71869, F71869A, F71882FG, F71889F and F81866");
> +MODULE_DESCRIPTION("GPIO driver for Super-I/O chips F71869, F71869A, F71882FG, F71889A, F71889F and F81866");
>  MODULE_AUTHOR("Simon Guinot <simon.guinot@sequanux.org>");
>  MODULE_LICENSE("GPL");
> --
> 2.12.2
>
