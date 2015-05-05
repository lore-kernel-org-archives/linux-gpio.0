From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH 12/27] misc: ti-st: Allow compile test of GPIO consumers if !GPIOLIB
Date: Tue,  5 May 2015 18:32:28 +0200
Message-ID: <1430843563-18615-12-git-send-email-geert@linux-m68k.org>
References: <1430836404-15513-1-git-send-email-geert@linux-m68k.org>
 <1430843563-18615-1-git-send-email-geert@linux-m68k.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1430843563-18615-1-git-send-email-geert@linux-m68k.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Arnd Bergmann <arnd@arndb.de>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>
List-Id: linux-gpio@vger.kernel.org

The GPIO subsystem provides dummy GPIO consumer functions if GPIOLIB is
not enabled. Hence drivers that depend on GPIOLIB, but use GPIO consumer
functionality only, can still be compiled if GPIOLIB is not enabled.

Relax the dependency on GPIOLIB if COMPILE_TEST is enabled, where
appropriate.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Arnd Bergmann <arnd@arndb.de>
---
 drivers/misc/ti-st/Kconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/misc/ti-st/Kconfig b/drivers/misc/ti-st/Kconfig
index f34dcc51473052cf..5bb92698bc80f450 100644
--- a/drivers/misc/ti-st/Kconfig
+++ b/drivers/misc/ti-st/Kconfig
@@ -5,7 +5,8 @@
 menu "Texas Instruments shared transport line discipline"
 config TI_ST
 	tristate "Shared transport core driver"
-	depends on NET && GPIOLIB && TTY
+	depends on NET && TTY
+	depends on GPIOLIB || COMPILE_TEST
 	select FW_LOADER
 	help
 	  This enables the shared transport core driver for TI
-- 
1.9.1
