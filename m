From: Alexander Stein <alexanders83@web.de>
Subject: [PATCH 42/63] gpio: twl4030: Allow compile testing
Date: Fri, 26 Feb 2016 14:21:18 +0100
Message-ID: <1456492895-21835-3-git-send-email-alexanders83@web.de>
References: <1456492692-21592-1-git-send-email-alexanders83@web.de>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mout.web.de ([212.227.17.11]:52412 "EHLO mout.web.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752937AbcBZNVn (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Fri, 26 Feb 2016 08:21:43 -0500
In-Reply-To: <1456492692-21592-1-git-send-email-alexanders83@web.de>
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
index b9ee764a1d60..ba9e7e3f3a56 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -924,7 +924,7 @@ config GPIO_TPS65912
 
 config GPIO_TWL4030
 	tristate "TWL4030, TWL5030, and TPS659x0 GPIOs"
-	depends on TWL4030_CORE
+	depends on TWL4030_CORE || COMPILE_TEST
 	help
 	  Say yes here to access the GPIO signals of various multi-function
 	  power management chips from Texas Instruments.
-- 
2.7.2

