From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: [PATCH 3/4] gpio: spear-spics: drop unused MODULE_ tags from
 non-modular code
Date: Wed, 24 Aug 2016 00:19:28 +0900
Message-ID: <CAK7LNAS73g5vXNM+C5Pv5hj12ooRwrWiS_W7b16jH4tfASCWkw@mail.gmail.com>
References: <20160822164833.3633-1-paul.gortmaker@windriver.com> <20160822164833.3633-4-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160822164833.3633-4-paul.gortmaker@windriver.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Shiraz Hashim <shiraz.linux.kernel@gmail.com>, linux-gpio@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

2016-08-23 1:48 GMT+09:00 Paul Gortmaker <paul.gortmaker@windriver.com>:
> The Kconfig currently controlling compilation of this code is:
>
> drivers/gpio/Kconfig:config GPIO_SPEAR_SPICS
> drivers/gpio/Kconfig:   bool "ST SPEAr13xx SPI Chip Select as GPIO support"
>
> ...meaning that it currently is not being built as a module by anyone.
>
> Lets remove the couple traces of modular infrastructure use, so that
> when reading the driver there is no doubt it is builtin-only.
>
> We delete the MODULE_LICENSE tag etc. since all that information
> is now contained at the top of the file in the comments.
>
> Also note that MODULE_DEVICE_TABLE is a no-op for non-modular code.
>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Alexandre Courbot <gnurou@gmail.com>
> Cc: Shiraz Hashim <shiraz.linux.kernel@gmail.com>
> Cc: linux-gpio@vger.kernel.org
> Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
> ---
>  drivers/gpio/gpio-spear-spics.c | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
>
> diff --git a/drivers/gpio/gpio-spear-spics.c b/drivers/gpio/gpio-spear-spics.c
> index 7ffd16495286..22267479ba68 100644
> --- a/drivers/gpio/gpio-spear-spics.c
> +++ b/drivers/gpio/gpio-spear-spics.c
> @@ -12,7 +12,7 @@
>  #include <linux/err.h>
>  #include <linux/gpio.h>
>  #include <linux/io.h>
> -#include <linux/module.h>
> +#include <linux/init.h>
>  #include <linux/of.h>
>  #include <linux/platform_device.h>
>  #include <linux/types.h>

Please keep the includes sorted alphabetically,
i.e. <linux/init.h> above <linux/io.h>.

I was a little late, though.



-- 
Best Regards
Masahiro Yamada
