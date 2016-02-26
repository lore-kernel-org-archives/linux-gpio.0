From: Alexander Stein <alexanders83@web.de>
Subject: [PATCH 24/63] gpio: mc9s08dz60: Allow compile testing
Date: Fri, 26 Feb 2016 14:19:23 +0100
Message-ID: <1456492778-21711-5-git-send-email-alexanders83@web.de>
References: <1456492692-21592-1-git-send-email-alexanders83@web.de>
 <1456492778-21711-1-git-send-email-alexanders83@web.de>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mout.web.de ([212.227.15.14]:56574 "EHLO mout.web.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754035AbcBZNTv (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Fri, 26 Feb 2016 08:19:51 -0500
In-Reply-To: <1456492778-21711-1-git-send-email-alexanders83@web.de>
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
index 49897590e9b3..d5df32cccabb 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -677,7 +677,7 @@ config GPIO_MAX732X_IRQ
 
 config GPIO_MC9S08DZ60
 	bool "MX35 3DS BOARD MC9S08DZ60 GPIO functions"
-	depends on I2C=y && MACH_MX35_3DS
+	depends on I2C=y && MACH_MX35_3DS || COMPILE_TEST
 	help
 	  Select this to enable the MC9S08DZ60 GPIO driver
 
-- 
2.7.2

