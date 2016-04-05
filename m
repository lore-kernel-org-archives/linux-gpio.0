From: Alexander Stein <alexanders83@web.de>
Subject: [PATCH v2 38/63] gpio: tps65912: Allow compile testing
Date: Tue,  5 Apr 2016 19:39:08 +0200
Message-ID: <1459877949-29889-19-git-send-email-alexanders83@web.de>
References: <1459877772-11289-1-git-send-email-alexanders83@web.de>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mout.web.de ([212.227.17.11]:54769 "EHLO mout.web.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1759486AbcDERjb (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Tue, 5 Apr 2016 13:39:31 -0400
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
index 1178e56bd83d..143552c5ddd3 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -934,7 +934,7 @@ config GPIO_TPS65910
 
 config GPIO_TPS65912
 	tristate "TI TPS65912 GPIO"
-	depends on MFD_TPS65912
+	depends on MFD_TPS65912 || COMPILE_TEST
 	help
 	  This driver supports TPS65912 gpio chip
 
-- 
2.8.0

