From: Alexander Stein <alexanders83@web.de>
Subject: [PATCH 17/63] gpio: syscon: Allow compile testing
Date: Fri, 26 Feb 2016 14:17:26 +0100
Message-ID: <1456492692-21592-18-git-send-email-alexanders83@web.de>
References: <1456492692-21592-1-git-send-email-alexanders83@web.de>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mout.web.de ([212.227.17.12]:60513 "EHLO mout.web.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751678AbcBZNSW (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
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
index 23b40c839459..52cdd093e31b 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -383,7 +383,7 @@ config GPIO_STP_XWAY
 
 config GPIO_SYSCON
 	tristate "GPIO based on SYSCON"
-	depends on MFD_SYSCON && OF
+	depends on MFD_SYSCON && OF || COMPILE_TEST
 	help
 	  Say yes here to support GPIO functionality though SYSCON driver.
 
-- 
2.7.2

