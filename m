From: Mike Krinkin <krinkin.m.u@gmail.com>
Subject: gpio-sx150x.c build error
Date: Wed, 21 Jan 2015 12:29:41 +0300
Message-ID: <20150121092941.GA14840@kmu-tp-x230>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-la0-f53.google.com ([209.85.215.53]:57715 "EHLO
	mail-la0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750813AbbAUJ3p (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 21 Jan 2015 04:29:45 -0500
Content-Disposition: inline
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org, gnurou@gmail.com
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org

Hello,=20

i failed to build linux-next for 20 Jan, because of the following build=
 error:

drivers/gpio/gpio-sx150x.c:487:17: error: =E2=80=98struct gpio_chip=E2=80=
=99 has no member named =E2=80=98of_node=E2=80=99
  chip->gpio_chip.of_node          =3D client->dev.of_node;
                 ^
drivers/gpio/gpio-sx150x.c:488:17: error: =E2=80=98struct gpio_chip=E2=80=
=99 has no member named =E2=80=98of_gpio_n_cells=E2=80=99
  chip->gpio_chip.of_gpio_n_cells  =3D 2;
                 ^
make[2]: *** [drivers/gpio/gpio-sx150x.o] Error 1
make[1]: *** [drivers/gpio] Error 2
make: *** [drivers] Error 2

This change introduced by Wei Chen commit 04d2264c3bf0 ("gpio: sx150x: =
add dts
support for sx150x driver"). Maybe `#ifndef CONFIG_OF_GPIO` should be h=
ere?

=46IY: i don't use this gpio, just happened to notice, and i have disab=
led this
in my config.
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
