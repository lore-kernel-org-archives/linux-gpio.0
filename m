From: Alexander Stein <alexanders83@web.de>
Subject: [PATCH 45/63] gpio: wm831x: Allow compile testing
Date: Fri, 26 Feb 2016 14:21:21 +0100
Message-ID: <1456492895-21835-6-git-send-email-alexanders83@web.de>
References: <1456492692-21592-1-git-send-email-alexanders83@web.de>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mout.web.de ([212.227.17.11]:50868 "EHLO mout.web.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753896AbcBZNVo (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Fri, 26 Feb 2016 08:21:44 -0500
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
index a971731a3735..fdcbe0946ea5 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -945,7 +945,7 @@ config GPIO_UCB1400
 
 config GPIO_WM831X
 	tristate "WM831x GPIOs"
-	depends on MFD_WM831X
+	depends on MFD_WM831X || COMPILE_TEST
 	help
 	  Say yes here to access the GPIO signals of WM831x power management
 	  chips from Wolfson Microelectronics.
-- 
2.7.2

