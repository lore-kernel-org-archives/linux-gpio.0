From: Alexander Stein <alexanders83@web.de>
Subject: [PATCH 46/63] gpio: wm8350: Allow compile testing
Date: Fri, 26 Feb 2016 14:21:22 +0100
Message-ID: <1456492895-21835-7-git-send-email-alexanders83@web.de>
References: <1456492692-21592-1-git-send-email-alexanders83@web.de>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mout.web.de ([212.227.17.12]:59461 "EHLO mout.web.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752937AbcBZNVp (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Fri, 26 Feb 2016 08:21:45 -0500
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
index fdcbe0946ea5..3e78eca42b2b 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -952,7 +952,7 @@ config GPIO_WM831X
 
 config GPIO_WM8350
 	tristate "WM8350 GPIOs"
-	depends on MFD_WM8350
+	depends on MFD_WM8350 || COMPILE_TEST
 	help
 	  Say yes here to access the GPIO signals of WM8350 power management
 	  chips from Wolfson Microelectronics.
-- 
2.7.2

