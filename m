From: Alexander Stein <alexanders83@web.de>
Subject: [PATCH v2 14/63] gpio: sta2x11: Allow compile testing
Date: Tue,  5 Apr 2016 19:35:23 +0200
Message-ID: <1459877772-11289-15-git-send-email-alexanders83@web.de>
References: <1459877772-11289-1-git-send-email-alexanders83@web.de>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mout.web.de ([212.227.17.11]:60600 "EHLO mout.web.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751920AbcDERgv (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Tue, 5 Apr 2016 13:36:51 -0400
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
index db84932018d6..3eb6d6f3f39c 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -373,7 +373,7 @@ config GPIO_SPEAR_SPICS
 
 config GPIO_STA2X11
 	bool "STA2x11/ConneXt GPIO support"
-	depends on MFD_STA2X11
+	depends on MFD_STA2X11 || COMPILE_TEST
 	select GENERIC_IRQ_CHIP
 	help
 	  Say yes here to support the STA2x11/ConneXt GPIO device.
-- 
2.8.0

