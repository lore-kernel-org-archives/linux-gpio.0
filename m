From: Alexander Stein <alexanders83@web.de>
Subject: [PATCH v2 21/63] gpio: mc9s08dz60: Allow compile testing
Date: Tue,  5 Apr 2016 19:38:51 +0200
Message-ID: <1459877949-29889-2-git-send-email-alexanders83@web.de>
References: <1459877772-11289-1-git-send-email-alexanders83@web.de>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mout.web.de ([212.227.17.11]:64092 "EHLO mout.web.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1759382AbcDERj3 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Tue, 5 Apr 2016 13:39:29 -0400
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
index 34e1547277e3..6b890958fe1b 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -687,7 +687,7 @@ config GPIO_MAX732X_IRQ
 
 config GPIO_MC9S08DZ60
 	bool "MX35 3DS BOARD MC9S08DZ60 GPIO functions"
-	depends on I2C=y && MACH_MX35_3DS
+	depends on I2C=y && MACH_MX35_3DS || COMPILE_TEST
 	help
 	  Select this to enable the MC9S08DZ60 GPIO driver
 
-- 
2.8.0

