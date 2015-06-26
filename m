From: Tien Hock Loh <thloh@altera.com>
Subject: Re: [PATCH 1/2] gpio: altera: kill bogus dependency on GPIO_GENERIC
Date: Thu, 25 Jun 2015 20:15:01 -0700
Message-ID: <1435288501.22927.1.camel@ubuntu>
References: <1434713464-32069-1-git-send-email-yamada.masahiro@socionext.com>
	 <CAK7LNAS=TeGSM9QD=kRhUDgDf85O0+GWjQ9YBvBa+oZ+6o6JpA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-bn1on0091.outbound.protection.outlook.com ([157.56.110.91]:35200
	"EHLO na01-bn1-obe.outbound.protection.outlook.com"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1751662AbbFZDtb convert rfc822-to-8bit (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 25 Jun 2015 23:49:31 -0400
In-Reply-To: <CAK7LNAS=TeGSM9QD=kRhUDgDf85O0+GWjQ9YBvBa+oZ+6o6JpA@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Acked-by: Tien Hock Loh <thloh@altera.com>

On Sun, 2015-06-21 at 08:48 +0900, Masahiro Yamada wrote:
> Adding Tien.
> 
> 
> 2015-06-19 20:31 GMT+09:00 Masahiro Yamada <yamada.masahiro@socionext.com>:
> > The driver gpio-altera.c does not depend on gpio-generic.c at all.
> > Drop unneeded "select GPIO_GENERIC".
> >
> > Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> > ---
> >
> >  drivers/gpio/Kconfig | 1 -
> >  1 file changed, 1 deletion(-)
> >
> > diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> > index caefe80..25c232e 100644
> > --- a/drivers/gpio/Kconfig
> > +++ b/drivers/gpio/Kconfig
> > @@ -113,7 +113,6 @@ config GPIO_74XX_MMIO
> >  config GPIO_ALTERA
> >         tristate "Altera GPIO"
> >         depends on OF_GPIO
> > -       select GPIO_GENERIC
> >         select GPIOLIB_IRQCHIP
> >         help
> >           Say Y or M here to build support for the Altera PIO device.
> > --
> > 1.9.1
> >
> > --
> > To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> > Please read the FAQ at  http://www.tux.org/lkml/
> 
> 
> 

