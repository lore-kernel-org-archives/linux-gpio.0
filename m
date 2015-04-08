From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] gpio: move BCM Kona Kconfig option
Date: Wed,  8 Apr 2015 14:38:10 +0200
Message-ID: <1428496690-20126-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-la0-f49.google.com ([209.85.215.49]:33066 "EHLO
	mail-la0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752001AbbDHMiP (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 8 Apr 2015 08:38:15 -0400
Received: by layy10 with SMTP id y10so64827888lay.0
        for <linux-gpio@vger.kernel.org>; Wed, 08 Apr 2015 05:38:14 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Alexandre Courbot <acourbot@nvidia.com>, Linus Walleij <linus.walleij@linaro.org>

Move the Kconfig option for the Broadcom BCM Kona up to the
commin GPIO controllers, as it is currently grouped under
MODULbus expanders which it definately is not.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/Kconfig | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 65acf322e86a..1356c482f00c 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -136,6 +136,12 @@ config GPIO_ALTERA
 
 	  If driver is built as a module it will be called gpio-altera.
 
+config GPIO_BCM_KONA
+	bool "Broadcom Kona GPIO"
+	depends on OF_GPIO && (ARCH_BCM_MOBILE || COMPILE_TEST)
+	help
+	  Turn on GPIO support for Broadcom "Kona" chips.
+
 config GPIO_CLPS711X
 	tristate "CLPS711X GPIO support"
 	depends on ARCH_CLPS711X || COMPILE_TEST
@@ -952,12 +958,6 @@ config GPIO_MSIC
 	  Enable support for GPIO on intel MSIC controllers found in
 	  intel MID devices
 
-config GPIO_BCM_KONA
-	bool "Broadcom Kona GPIO"
-	depends on OF_GPIO && (ARCH_BCM_MOBILE || COMPILE_TEST)
-	help
-	  Turn on GPIO support for Broadcom "Kona" chips.
-
 comment "USB GPIO expanders:"
 
 config GPIO_VIPERBOARD
-- 
1.9.3

