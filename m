From: Alexander Stein <alexanders83@web.de>
Subject: [PATCH 48/63] gpio: viperboard: Allow compile testing
Date: Fri, 26 Feb 2016 14:21:24 +0100
Message-ID: <1456492895-21835-9-git-send-email-alexanders83@web.de>
References: <1456492692-21592-1-git-send-email-alexanders83@web.de>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mout.web.de ([212.227.17.12]:51540 "EHLO mout.web.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753981AbcBZNVp (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
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
index a051c1ebf11b..fcbc767a685f 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -1095,7 +1095,7 @@ menu "USB GPIO expanders"
 
 config GPIO_VIPERBOARD
 	tristate "Viperboard GPIO a & b support"
-	depends on MFD_VIPERBOARD
+	depends on MFD_VIPERBOARD || COMPILE_TEST
 	help
 	  Say yes here to access the GPIO signals of Nano River
 	  Technologies Viperboard. There are two GPIO chips on the
-- 
2.7.2

