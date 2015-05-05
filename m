From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH 25/27] w1: Allow compile test of GPIO consumers if !GPIOLIB
Date: Tue,  5 May 2015 18:32:41 +0200
Message-ID: <1430843563-18615-25-git-send-email-geert@linux-m68k.org>
References: <1430836404-15513-1-git-send-email-geert@linux-m68k.org>
 <1430843563-18615-1-git-send-email-geert@linux-m68k.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1430843563-18615-1-git-send-email-geert@linux-m68k.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Arnd Bergmann <arnd@arndb.de>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>, Evgeniy Polyakov <zbr@ioremap.net>
List-Id: linux-gpio@vger.kernel.org

The GPIO subsystem provides dummy GPIO consumer functions if GPIOLIB is
not enabled. Hence drivers that depend on GPIOLIB, but use GPIO consumer
functionality only, can still be compiled if GPIOLIB is not enabled.

Relax the dependency on GPIOLIB if COMPILE_TEST is enabled, where
appropriate.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Evgeniy Polyakov <zbr@ioremap.net>
---
 drivers/w1/masters/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/w1/masters/Kconfig b/drivers/w1/masters/Kconfig
index 1708b2300c7a9ca2..00827d2897b534bc 100644
--- a/drivers/w1/masters/Kconfig
+++ b/drivers/w1/masters/Kconfig
@@ -49,7 +49,7 @@ config W1_MASTER_DS1WM
 
 config W1_MASTER_GPIO
 	tristate "GPIO 1-wire busmaster"
-	depends on GPIOLIB
+	depends on GPIOLIB || COMPILE_TEST
 	help
 	  Say Y here if you want to communicate with your 1-wire devices using
 	  GPIO pins. This driver uses the GPIO API to control the wire.
-- 
1.9.1
