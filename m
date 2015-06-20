From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: [PATCH 2/2] gpio: mvebu: kill bogus dependency on GPIO_GENERIC
Date: Sun, 21 Jun 2015 08:54:40 +0900
Message-ID: <CAK7LNAR_uGLtGYt0ioOwbOA=iAH1dOE4q+TQ2yRuMqf5P242Yg@mail.gmail.com>
References: <1434713464-32069-1-git-send-email-yamada.masahiro@socionext.com>
	<1434713464-32069-2-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from conssluserg002.nifty.com ([202.248.44.40]:21641 "EHLO
	conssluserg002-v.nifty.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1754763AbbFTXy7 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>);
	Sat, 20 Jun 2015 19:54:59 -0400
In-Reply-To: <1434713464-32069-2-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Axel Lin <axel.lin@ingics.com>, Gregory CLEMENT <gregory.clement@free-electrons.com>, Andrew Lunn <andrew@lunn.ch>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Adding more people.

I'd like them to check if this patch is correct.


2015-06-19 20:31 GMT+09:00 Masahiro Yamada <yamada.masahiro@socionext.com>:
> The driver gpio-mvebu.c does not depend on gpio-generic.c at all.
> Drop unneeded "select GPIO_GENERIC".
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
>
>  drivers/gpio/Kconfig | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index 25c232e..241d441 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -283,7 +283,6 @@ config GPIO_MVEBU
>         def_bool y
>         depends on PLAT_ORION
>         depends on OF
> -       select GPIO_GENERIC
>         select GENERIC_IRQ_CHIP
>
>  config GPIO_MXC
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
