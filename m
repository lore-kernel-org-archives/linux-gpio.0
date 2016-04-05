From: Alexander Stein <alexanders83@web.de>
Subject: [PATCH v2 24/63] gpio: crystalcove: Allow compile testing
Date: Tue,  5 Apr 2016 19:38:54 +0200
Message-ID: <1459877949-29889-5-git-send-email-alexanders83@web.de>
References: <1459877772-11289-1-git-send-email-alexanders83@web.de>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mout.web.de ([212.227.17.12]:52025 "EHLO mout.web.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1759205AbcDERjZ (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Tue, 5 Apr 2016 13:39:25 -0400
In-Reply-To: <1459877772-11289-1-git-send-email-alexanders83@web.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: Alexander Stein <alexanders83@web.de>, linux-gpio@vger.kernel.org

Lower dependencies for compile testing.

Signed-off-by: Alexander Stein <alexanders83@web.de>
---
 drivers/gpio/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 2954c068b151..f10da927adb9 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -782,7 +782,7 @@ config GPIO_ARIZONA
 
 config GPIO_CRYSTAL_COVE
 	tristate "GPIO support for Crystal Cove PMIC"
-	depends on INTEL_SOC_PMIC
+	depends on INTEL_SOC_PMIC || COMPILE_TEST
 	select GPIOLIB_IRQCHIP
 	help
 	  Support for GPIO pins on Crystal Cove PMIC.
-- 
2.8.0

