From: Alexander Stein <alexanders83@web.de>
Subject: [PATCH v2 42/63] gpio: wm831x: Allow compile testing
Date: Tue,  5 Apr 2016 19:39:23 +0200
Message-ID: <1459877980-31872-3-git-send-email-alexanders83@web.de>
References: <1459877772-11289-1-git-send-email-alexanders83@web.de>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mout.web.de ([212.227.15.4]:49357 "EHLO mout.web.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1759591AbcDERjr (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Tue, 5 Apr 2016 13:39:47 -0400
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
index 260f26a0c79a..3331e5a5313e 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -961,7 +961,7 @@ config GPIO_UCB1400
 
 config GPIO_WM831X
 	tristate "WM831x GPIOs"
-	depends on MFD_WM831X
+	depends on MFD_WM831X || COMPILE_TEST
 	help
 	  Say yes here to access the GPIO signals of WM831x power management
 	  chips from Wolfson Microelectronics.
-- 
2.8.0

