From: Alexander Stein <alexanders83@web.de>
Subject: [PATCH 16/63] gpio: sta2x11: Allow compile testing
Date: Fri, 26 Feb 2016 14:17:25 +0100
Message-ID: <1456492692-21592-17-git-send-email-alexanders83@web.de>
References: <1456492692-21592-1-git-send-email-alexanders83@web.de>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mout.web.de ([212.227.17.12]:64021 "EHLO mout.web.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753900AbcBZNSW (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Fri, 26 Feb 2016 08:18:22 -0500
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
index 127fa465273a..23b40c839459 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -365,7 +365,7 @@ config GPIO_SPEAR_SPICS
 
 config GPIO_STA2X11
 	bool "STA2x11/ConneXt GPIO support"
-	depends on MFD_STA2X11
+	depends on MFD_STA2X11 || COMPILE_TEST
 	select GENERIC_IRQ_CHIP
 	help
 	  Say yes here to support the STA2x11/ConneXt GPIO device.
-- 
2.7.2

