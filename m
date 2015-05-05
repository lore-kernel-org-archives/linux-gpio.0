From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH 04/27] extcon: Allow compile test of GPIO consumers if !GPIOLIB
Date: Tue,  5 May 2015 18:32:20 +0200
Message-ID: <1430843563-18615-4-git-send-email-geert@linux-m68k.org>
References: <1430836404-15513-1-git-send-email-geert@linux-m68k.org>
 <1430843563-18615-1-git-send-email-geert@linux-m68k.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from laurent.telenet-ops.be ([195.130.137.89]:40223 "EHLO
	laurent.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1761315AbbEEQcy (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 5 May 2015 12:32:54 -0400
In-Reply-To: <1430843563-18615-1-git-send-email-geert@linux-m68k.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Arnd Bergmann <arnd@arndb.de>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>, MyungJoo Ham <myungjoo.ham@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>

The GPIO subsystem provides dummy GPIO consumer functions if GPIOLIB is
not enabled. Hence drivers that depend on GPIOLIB, but use GPIO consume=
r
functionality only, can still be compiled if GPIOLIB is not enabled.

Relax the dependency on GPIOLIB if COMPILE_TEST is enabled, where
appropriate.

If GPIOLIB=3Dn and asm-generic/gpio.h is not used:

    drivers/extcon/extcon-usb-gpio.c: In function =E2=80=98usb_extcon_d=
etect_cable=E2=80=99:
    drivers/extcon/extcon-usb-gpio.c:63: error: implicit declaration of=
 function =E2=80=98gpiod_get_value_cansleep=E2=80=99
    drivers/extcon/extcon-usb-gpio.c: In function =E2=80=98usb_extcon_p=
robe=E2=80=99:
    drivers/extcon/extcon-usb-gpio.c:116: error: implicit declaration o=
f function =E2=80=98devm_gpiod_get=E2=80=99
    drivers/extcon/extcon-usb-gpio.c:116: warning: assignment makes poi=
nter from integer without a cast
    drivers/extcon/extcon-usb-gpio.c:122: error: implicit declaration o=
f function =E2=80=98gpiod_set_debounce=E2=80=99
    drivers/extcon/extcon-usb-gpio.c:129: error: implicit declaration o=
f function =E2=80=98gpiod_to_irq=E2=80=99

Add the missing #include <linux/gpio/consumer.h> to fix this.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: MyungJoo Ham <myungjoo.ham@samsung.com>
Cc: Chanwoo Choi <cw00.choi@samsung.com>
---
 drivers/extcon/Kconfig           | 4 ++--
 drivers/extcon/extcon-usb-gpio.c | 1 +
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/extcon/Kconfig b/drivers/extcon/Kconfig
index fdc0bf0543ce43ec..5d8d7244349870ca 100644
--- a/drivers/extcon/Kconfig
+++ b/drivers/extcon/Kconfig
@@ -30,7 +30,7 @@ config EXTCON_ARIZONA
=20
 config EXTCON_GPIO
 	tristate "GPIO extcon support"
-	depends on GPIOLIB
+	depends on GPIOLIB || COMPILE_TEST
 	help
 	  Say Y here to enable GPIO based extcon support. Note that GPIO
 	  extcon supports single state per extcon instance.
@@ -105,7 +105,7 @@ config EXTCON_SM5502
=20
 config EXTCON_USB_GPIO
 	tristate "USB GPIO extcon support"
-	depends on GPIOLIB
+	depends on GPIOLIB || COMPILE_TEST
 	help
 	  Say Y here to enable GPIO based USB cable detection extcon support.
 	  Used typically if GPIO is used for USB ID pin detection.
diff --git a/drivers/extcon/extcon-usb-gpio.c b/drivers/extcon/extcon-u=
sb-gpio.c
index de67fce189840eee..6c6fc33029826132 100644
--- a/drivers/extcon/extcon-usb-gpio.c
+++ b/drivers/extcon/extcon-usb-gpio.c
@@ -15,6 +15,7 @@
  */
=20
 #include <linux/extcon.h>
+#include <linux/gpio/consumer.h>
 #include <linux/init.h>
 #include <linux/interrupt.h>
 #include <linux/irq.h>
--=20
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
