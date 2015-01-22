From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: gpio-sx150x.c build error
Date: Thu, 22 Jan 2015 12:02:39 +0900
Message-ID: <CAAVeFuJgG=wng_RAE76z-1BdNN-mzyuEbhmCk7_2XGv=9kkEng@mail.gmail.com>
References: <20150121092941.GA14840@kmu-tp-x230>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ie0-f172.google.com ([209.85.223.172]:36610 "EHLO
	mail-ie0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752375AbbAVDDC convert rfc822-to-8bit (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 21 Jan 2015 22:03:02 -0500
In-Reply-To: <20150121092941.GA14840@kmu-tp-x230>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Mike Krinkin <krinkin.m.u@gmail.com>, Wei Chen <Wei.Chen@csr.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Wed, Jan 21, 2015 at 6:29 PM, Mike Krinkin <krinkin.m.u@gmail.com> w=
rote:
> Hello,
>
> i failed to build linux-next for 20 Jan, because of the following bui=
ld error:
>
> drivers/gpio/gpio-sx150x.c:487:17: error: =E2=80=98struct gpio_chip=E2=
=80=99 has no member named =E2=80=98of_node=E2=80=99
>   chip->gpio_chip.of_node          =3D client->dev.of_node;
>                  ^
> drivers/gpio/gpio-sx150x.c:488:17: error: =E2=80=98struct gpio_chip=E2=
=80=99 has no member named =E2=80=98of_gpio_n_cells=E2=80=99
>   chip->gpio_chip.of_gpio_n_cells  =3D 2;
>                  ^
> make[2]: *** [drivers/gpio/gpio-sx150x.o] Error 1
> make[1]: *** [drivers/gpio] Error 2
> make: *** [drivers] Error 2
>
> This change introduced by Wei Chen commit 04d2264c3bf0 ("gpio: sx150x=
: add dts
> support for sx150x driver"). Maybe `#ifndef CONFIG_OF_GPIO` should be=
 here?
>
> FIY: i don't use this gpio, just happened to notice, and i have disab=
led this
> in my config.

Adding Wei. Could you have a look at this and send a fixup patch?

Thanks!
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
