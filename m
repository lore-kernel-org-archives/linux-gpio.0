From: Alexander Stein <alexanders83@web.de>
Subject: [PATCH v2 39/63] gpio: twl4030: Allow compile testing
Date: Tue,  5 Apr 2016 19:39:09 +0200
Message-ID: <1459877949-29889-20-git-send-email-alexanders83@web.de>
References: <1459877772-11289-1-git-send-email-alexanders83@web.de>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mout.web.de ([212.227.17.11]:49418 "EHLO mout.web.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1758774AbcDERj2 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Tue, 5 Apr 2016 13:39:28 -0400
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
index 143552c5ddd3..0d3fad059ac5 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -940,7 +940,7 @@ config GPIO_TPS65912
 
 config GPIO_TWL4030
 	tristate "TWL4030, TWL5030, and TPS659x0 GPIOs"
-	depends on TWL4030_CORE
+	depends on TWL4030_CORE || COMPILE_TEST
 	help
 	  Say yes here to access the GPIO signals of various multi-function
 	  power management chips from Texas Instruments.
-- 
2.8.0

