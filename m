From: Alexander Stein <alexanders83@web.de>
Subject: [PATCH v2 62/63] gpio: tps65086: Allow compile testing
Date: Tue,  5 Apr 2016 20:40:49 +0200
Message-ID: <1459881650-26051-1-git-send-email-alexanders83@web.de>
References: <1459877772-11289-1-git-send-email-alexanders83@web.de>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mout.web.de ([212.227.15.3]:63628 "EHLO mout.web.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1759821AbcDESk6 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Tue, 5 Apr 2016 14:40:58 -0400
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
index 57a8b628af14..21dc5e97d38a 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -905,7 +905,7 @@ config GPIO_TIMBERDALE
 
 config GPIO_TPS65086
 	tristate "TI TPS65086 GPO"
-	depends on MFD_TPS65086
+	depends on MFD_TPS65086 || COMPILE_TEST
 	help
 	  This driver supports the GPO on TI TPS65086x PMICs.
 
-- 
2.8.0

