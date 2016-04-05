From: Alexander Stein <alexanders83@web.de>
Subject: [PATCH v2 29/63] gpio: kempld: Allow compile testing
Date: Tue,  5 Apr 2016 19:38:59 +0200
Message-ID: <1459877949-29889-10-git-send-email-alexanders83@web.de>
References: <1459877772-11289-1-git-send-email-alexanders83@web.de>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mout.web.de ([212.227.17.12]:63573 "EHLO mout.web.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1757920AbcDERjW (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Tue, 5 Apr 2016 13:39:22 -0400
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
index c8fde6e7953e..ba4459005399 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -842,7 +842,7 @@ config GPIO_JANZ_TTL
 
 config GPIO_KEMPLD
 	tristate "Kontron ETX / COMexpress GPIO"
-	depends on MFD_KEMPLD
+	depends on MFD_KEMPLD || COMPILE_TEST
 	help
 	  This enables support for the PLD GPIO interface on some Kontron ETX
 	  and COMexpress (ETXexpress) modules.
-- 
2.8.0

