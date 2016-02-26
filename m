From: Alexander Stein <alexanders83@web.de>
Subject: [PATCH 51/63] gpio: tc3589x: Move dependencies to a single line
Date: Fri, 26 Feb 2016 14:21:27 +0100
Message-ID: <1456492895-21835-12-git-send-email-alexanders83@web.de>
References: <1456492692-21592-1-git-send-email-alexanders83@web.de>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mout.web.de ([212.227.17.12]:59162 "EHLO mout.web.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753793AbcBZNVq (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Fri, 26 Feb 2016 08:21:46 -0500
In-Reply-To: <1456492692-21592-1-git-send-email-alexanders83@web.de>
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
index 2f03157a41bc..cf183cb3ac82 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -881,8 +881,7 @@ config GPIO_STMPE
 
 config GPIO_TC3589X
 	bool "TC3589X GPIOs"
-	depends on MFD_TC3589X
-	depends on OF_GPIO
+	depends on MFD_TC3589X && OF_GPIO
 	select GPIOLIB_IRQCHIP
 	help
 	  This enables support for the GPIOs found on the TC3589X
-- 
2.7.2

