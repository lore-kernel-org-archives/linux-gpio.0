From: Alexander Stein <alexanders83@web.de>
Subject: [PATCH 57/63] gpio: bt8xx: Allow compile testing
Date: Fri, 26 Feb 2016 14:21:33 +0100
Message-ID: <1456492895-21835-18-git-send-email-alexanders83@web.de>
References: <1456492692-21592-1-git-send-email-alexanders83@web.de>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mout.web.de ([212.227.17.12]:63823 "EHLO mout.web.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754139AbcBZNVs (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Fri, 26 Feb 2016 08:21:48 -0500
In-Reply-To: <1456492692-21592-1-git-send-email-alexanders83@web.de>
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
index b83bb56d290d..99c45b846530 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -965,7 +965,7 @@ config GPIO_WM8994
 endmenu
 
 menu "PCI GPIO expanders"
-	depends on PCI
+	depends on PCI || COMPILE_TEST
 
 config GPIO_AMD8111
 	tristate "AMD 8111 GPIO driver"
@@ -980,7 +980,7 @@ config GPIO_AMD8111
 
 config GPIO_BT8XX
 	tristate "BT8XX GPIO abuser"
-	depends on VIDEO_BT848=n
+	depends on VIDEO_BT848=n || COMPILE_TEST
 	help
 	  The BT8xx frame grabber chip has 24 GPIO pins that can be abused
 	  as a cheap PCI GPIO card.
-- 
2.7.2

