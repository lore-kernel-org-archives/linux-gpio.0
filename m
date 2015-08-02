From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH v2 10/11] w1: Allow compile test of GPIO consumers if !GPIOLIB
Date: Sun,  2 Aug 2015 11:09:54 +0200
Message-ID: <1438506594-31888-1-git-send-email-geert@linux-m68k.org>
References: <1438506475-31012-1-git-send-email-geert@linux-m68k.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from michel.telenet-ops.be ([195.130.137.88]:35143 "EHLO
	michel.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752180AbbHBJJz (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sun, 2 Aug 2015 05:09:55 -0400
In-Reply-To: <1438506475-31012-1-git-send-email-geert@linux-m68k.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Evgeniy Polyakov <zbr@ioremap.net>
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

