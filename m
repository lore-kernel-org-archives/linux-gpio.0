From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: [PATCH 1/2] gpio: altera: kill bogus dependency on GPIO_GENERIC
Date: Sun, 21 Jun 2015 08:48:04 +0900
Message-ID: <CAK7LNAS=TeGSM9QD=kRhUDgDf85O0+GWjQ9YBvBa+oZ+6o6JpA@mail.gmail.com>
References: <1434713464-32069-1-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from conssluserg004.nifty.com ([202.248.44.42]:64688 "EHLO
	conssluserg004-v.nifty.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1750812AbbFTXsS (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>);
	Sat, 20 Jun 2015 19:48:18 -0400
In-Reply-To: <1434713464-32069-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Tien Hock Loh <thloh@altera.com>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Adding Tien.


2015-06-19 20:31 GMT+09:00 Masahiro Yamada <yamada.masahiro@socionext.com>:
> The driver gpio-altera.c does not depend on gpio-generic.c at all.
> Drop unneeded "select GPIO_GENERIC".
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
>
>  drivers/gpio/Kconfig | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index caefe80..25c232e 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -113,7 +113,6 @@ config GPIO_74XX_MMIO
>  config GPIO_ALTERA
>         tristate "Altera GPIO"
>         depends on OF_GPIO
> -       select GPIO_GENERIC
>         select GPIOLIB_IRQCHIP
>         help
>           Say Y or M here to build support for the Altera PIO device.
> --
> 1.9.1
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> Please read the FAQ at  http://www.tux.org/lkml/



-- 
Best Regards
Masahiro Yamada
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" in
