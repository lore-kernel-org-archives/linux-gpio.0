From: Alexander Stein <alexanders83@web.de>
Subject: [PATCH 32/63] gpio: kempld: Allow compile testing
Date: Fri, 26 Feb 2016 14:19:31 +0100
Message-ID: <1456492778-21711-13-git-send-email-alexanders83@web.de>
References: <1456492692-21592-1-git-send-email-alexanders83@web.de>
 <1456492778-21711-1-git-send-email-alexanders83@web.de>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mout.web.de ([212.227.15.4]:52089 "EHLO mout.web.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753793AbcBZNTx (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Fri, 26 Feb 2016 08:19:53 -0500
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
index de47e88ab51b..03e87377d3d9 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -832,7 +832,7 @@ config GPIO_JANZ_TTL
 
 config GPIO_KEMPLD
 	tristate "Kontron ETX / COMexpress GPIO"
-	depends on MFD_KEMPLD
+	depends on MFD_KEMPLD || COMPILE_TEST
 	help
 	  This enables support for the PLD GPIO interface on some Kontron ETX
 	  and COMexpress (ETXexpress) modules.
-- 
2.7.2

