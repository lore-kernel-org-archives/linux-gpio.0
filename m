From: Alexander Stein <alexanders83@web.de>
Subject: [PATCH 41/63] gpio: tps65912: Allow compile testing
Date: Fri, 26 Feb 2016 14:21:17 +0100
Message-ID: <1456492895-21835-2-git-send-email-alexanders83@web.de>
References: <1456492692-21592-1-git-send-email-alexanders83@web.de>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mout.web.de ([212.227.17.11]:63367 "EHLO mout.web.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753125AbcBZNVo (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Fri, 26 Feb 2016 08:21:44 -0500
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
index a9f0befdf119..b9ee764a1d60 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -918,7 +918,7 @@ config GPIO_TPS65910
 
 config GPIO_TPS65912
 	tristate "TI TPS65912 GPIO"
-	depends on (MFD_TPS65912_I2C || MFD_TPS65912_SPI)
+	depends on (MFD_TPS65912_I2C || MFD_TPS65912_SPI) || COMPILE_TEST
 	help
 	  This driver supports TPS65912 gpio chip
 
-- 
2.7.2

