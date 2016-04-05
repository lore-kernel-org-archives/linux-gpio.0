From: Alexander Stein <alexanders83@web.de>
Subject: [PATCH v2 45/63] gpio: viperboard: Allow compile testing
Date: Tue,  5 Apr 2016 19:39:26 +0200
Message-ID: <1459877980-31872-6-git-send-email-alexanders83@web.de>
References: <1459877772-11289-1-git-send-email-alexanders83@web.de>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mout.web.de ([212.227.15.3]:64790 "EHLO mout.web.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1758469AbcDERjr (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
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
index 259592622dcb..6a580fcd51c0 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -1112,7 +1112,7 @@ menu "USB GPIO expanders"
 
 config GPIO_VIPERBOARD
 	tristate "Viperboard GPIO a & b support"
-	depends on MFD_VIPERBOARD
+	depends on MFD_VIPERBOARD || COMPILE_TEST
 	help
 	  Say yes here to access the GPIO signals of Nano River
 	  Technologies Viperboard. There are two GPIO chips on the
-- 
2.8.0

