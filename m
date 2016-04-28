From: Alexander Stein <alexander.stein@systec-electronic.com>
Subject: Re: [PATCH 2/2] tools/gpio: add the gpio-hammer tool
Date: Thu, 28 Apr 2016 09:47:53 +0200
Message-ID: <5064400.LUANRz9U0Y@ws-stein>
References: <1461660866-18683-1-git-send-email-linus.walleij@linaro.org> <1461660866-18683-2-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from webbox1416.server-home.net ([77.236.96.61]:56562 "EHLO
	webbox1416.server-home.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751038AbcD1HsA convert rfc822-to-8bit
	(ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Thu, 28 Apr 2016 03:48:00 -0400
In-Reply-To: <1461660866-18683-2-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>, Lee Campbell <leecam@google.com>, Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>, Grant Likely <grant.likely@linaro.org>, Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Johan Hovold <johan@kernel.org>

On Tuesday 26 April 2016 10:54:26, Linus Walleij wrote:
> The gpio-hammer is used from userspace as an example of how
> to retrieve a GPIO handle for one or several GPIO lines and
> hammer the outputs from low to high and back again. It will
> pulse the selected lines once per second for a specified
> number of times or indefinitely if no loop count is
> supplied.
>=20
> Example output:
> $ gpio-hammer -n gpiochip0 -o5 -o6 -o7
> Hammer lines [5, 6, 7] on gpiochip0, initial states: [1, 1, 1]
> [-] [5: 0, 6: 0, 7: 0]
>=20
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

This might be a stupid question, but how do I build those tools? I've n=
ever=20
done this before and failed with the following command:
> ARCH=3Darm CROSS_COMPILE=3D/opt/OSELAS.Toolchain-2013.12.2/arm-cortex=
a8-linux-
gnueabi/gcc-4.8.3-glibc-2.18-binutils-2.24-kernel-3.12-sanitized/bin/ar=
m-
cortexa8-linux-gnueabi- make O=3Dbuild_arm V=3D1 tools/gpio

results:

make -C /home/alex/repo/linux/build_arm KBUILD_SRC=3D/home/alex/repo/li=
nux \
-f /home/alex/repo/linux/Makefile tools/gpio
make[1]: Verzeichnis =E2=80=9E/home/alex/repo/linux/build_arm=E2=80=9C =
wird betreten
mkdir -p ./tools
make LDFLAGS=3D MAKEFLAGS=3D"" O=3D/home/alex/repo/linux/build_arm subd=
ir=3Dtools -C=20
=2E./tools/ gpio
mkdir -p /home/alex/repo/linux/build_arm/tools/gpio && make=20
O=3D/home/alex/repo/linux/build_arm subdir=3Dtools/gpio --no-print-dire=
ctory -C=20
gpio=20
/opt/OSELAS.Toolchain-2013.12.2/arm-cortexa8-linux-gnueabi/gcc-4.8.3-
glibc-2.18-binutils-2.24-kernel-3.12-sanitized/bin/arm-cortexa8-linux-g=
nueabi-
gcc -O2 -Wall -g -D_GNU_SOURCE   -c -o lsgpio.o lsgpio.c
lsgpio.c:25:24: fatal error: linux/gpio.h: No such file or directory
 #include <linux/gpio.h>

Apparently the includes to $(srcdir)/include and=20
$(srcdir)/arch/${ARCH}/include are missing.

Best regards,
Alexander

--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
