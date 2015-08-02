From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH v2 03/11] misc: ti-st: Allow compile test of GPIO consumers if !GPIOLIB
Date: Sun,  2 Aug 2015 11:09:49 +0200
Message-ID: <1438506589-31587-1-git-send-email-geert@linux-m68k.org>
References: <1438506475-31012-1-git-send-email-geert@linux-m68k.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from baptiste.telenet-ops.be ([195.130.132.51]:55541 "EHLO
	baptiste.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752166AbbHBJJu (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sun, 2 Aug 2015 05:09:50 -0400
In-Reply-To: <1438506475-31012-1-git-send-email-geert@linux-m68k.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>

The GPIO subsystem provides dummy GPIO consumer functions if GPIOLIB is
not enabled. Hence drivers that depend on GPIOLIB, but use GPIO consumer
functionality only, can still be compiled if GPIOLIB is not enabled.

Relax the dependency on GPIOLIB if COMPILE_TEST is enabled, where
appropriate.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
Acked-by: Linus Walleij <linus.walleij@linaro.org>
---
v2:
  - Add Acked-by.
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

