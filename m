From: Alexander Stein <alexanders83@web.de>
Subject: [PATCH v2 54/63] gpio: bt8xx: Allow compile testing
Date: Tue,  5 Apr 2016 19:39:35 +0200
Message-ID: <1459877980-31872-15-git-send-email-alexanders83@web.de>
References: <1459877772-11289-1-git-send-email-alexanders83@web.de>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mout.web.de ([212.227.15.14]:50958 "EHLO mout.web.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1759596AbcDERjw (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Tue, 5 Apr 2016 13:39:52 -0400
In-Reply-To: <1459877772-11289-1-git-send-email-alexanders83@web.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: Alexander Stein <alexanders83@web.de>, linux-gpio@vger.kernel.org

Lower dependencies for compile testing.

Signed-off-by: Alexander Stein <alexanders83@web.de>
---
 drivers/gpio/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 17bcf01518d4..2007c1c76d12 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -981,7 +981,7 @@ config GPIO_WM8994
 endmenu
 
 menu "PCI GPIO expanders"
-	depends on PCI
+	depends on PCI || COMPILE_TEST
 
 config GPIO_AMD8111
 	tristate "AMD 8111 GPIO driver"
@@ -996,7 +996,7 @@ config GPIO_AMD8111
 
 config GPIO_BT8XX
 	tristate "BT8XX GPIO abuser"
-	depends on VIDEO_BT848=n
+	depends on VIDEO_BT848=n || COMPILE_TEST
 	help
 	  The BT8xx frame grabber chip has 24 GPIO pins that can be abused
 	  as a cheap PCI GPIO card.
-- 
2.8.0

