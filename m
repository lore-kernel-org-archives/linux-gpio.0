From: Alexander Stein <alexanders83@web.de>
Subject: [PATCH 31/63] gpio: jantz-ttl: Allow compile testing
Date: Fri, 26 Feb 2016 14:19:30 +0100
Message-ID: <1456492778-21711-12-git-send-email-alexanders83@web.de>
References: <1456492692-21592-1-git-send-email-alexanders83@web.de>
 <1456492778-21711-1-git-send-email-alexanders83@web.de>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mout.web.de ([212.227.15.3]:60973 "EHLO mout.web.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753986AbcBZNTy (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Fri, 26 Feb 2016 08:19:54 -0500
In-Reply-To: <1456492778-21711-1-git-send-email-alexanders83@web.de>
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
index ce4dd23fa22f..de47e88ab51b 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -824,7 +824,7 @@ config GPIO_DLN2
 
 config GPIO_JANZ_TTL
 	tristate "Janz VMOD-TTL Digital IO Module"
-	depends on MFD_JANZ_CMODIO
+	depends on MFD_JANZ_CMODIO || COMPILE_TEST
 	help
 	  This enables support for the Janz VMOD-TTL Digital IO module.
 	  This driver provides support for driving the pins in output
-- 
2.7.2

