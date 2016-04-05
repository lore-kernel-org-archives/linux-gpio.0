From: Alexander Stein <alexanders83@web.de>
Subject: [PATCH v2 48/63] gpio: tc3589x: Move dependencies to a single line
Date: Tue,  5 Apr 2016 19:39:29 +0200
Message-ID: <1459877980-31872-9-git-send-email-alexanders83@web.de>
References: <1459877772-11289-1-git-send-email-alexanders83@web.de>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mout.web.de ([212.227.15.3]:51109 "EHLO mout.web.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1759622AbcDERj7 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Tue, 5 Apr 2016 13:39:59 -0400
In-Reply-To: <1459877772-11289-1-git-send-email-alexanders83@web.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: Alexander Stein <alexanders83@web.de>, linux-gpio@vger.kernel.org

It's easier to add a simple || COMPILE_TEST whis way.

Signed-off-by: Alexander Stein <alexanders83@web.de>
---
 drivers/gpio/Kconfig | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 3a4d192646e6..b5d1e4641dd4 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -891,8 +891,7 @@ config GPIO_STMPE
 
 config GPIO_TC3589X
 	bool "TC3589X GPIOs"
-	depends on MFD_TC3589X
-	depends on OF_GPIO
+	depends on MFD_TC3589X && OF_GPIO
 	select GPIOLIB_IRQCHIP
 	help
 	  This enables support for the GPIOs found on the TC3589X
-- 
2.8.0

