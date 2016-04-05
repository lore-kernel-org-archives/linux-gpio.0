From: Alexander Stein <alexanders83@web.de>
Subject: [PATCH v2 35/63] gpio: tps65218: Allow compile testing
Date: Tue,  5 Apr 2016 19:39:05 +0200
Message-ID: <1459877949-29889-16-git-send-email-alexanders83@web.de>
References: <1459877772-11289-1-git-send-email-alexanders83@web.de>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mout.web.de ([212.227.17.11]:63506 "EHLO mout.web.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1758933AbcDERj3 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Tue, 5 Apr 2016 13:39:29 -0400
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
index 327cc857f3ad..7518bc83187c 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -913,7 +913,7 @@ config GPIO_TPS65086
 
 config GPIO_TPS65218
 	tristate "TPS65218 GPIO"
-	depends on MFD_TPS65218
+	depends on MFD_TPS65218 || COMPILE_TEST
 	help
 	  Select this option to enable GPIO driver for the TPS65218
 	  chip family.
-- 
2.8.0

