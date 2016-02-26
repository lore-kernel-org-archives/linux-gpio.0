From: Alexander Stein <alexanders83@web.de>
Subject: [PATCH 21/63] gpio: xgene: Allow compile testing
Date: Fri, 26 Feb 2016 14:19:20 +0100
Message-ID: <1456492778-21711-2-git-send-email-alexanders83@web.de>
References: <1456492692-21592-1-git-send-email-alexanders83@web.de>
 <1456492778-21711-1-git-send-email-alexanders83@web.de>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mout.web.de ([212.227.15.3]:54054 "EHLO mout.web.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753978AbcBZNTv (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Fri, 26 Feb 2016 08:19:51 -0500
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
index 275e2ab2af57..5f0591e5ebb6 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -447,7 +447,7 @@ config GPIO_VX855
 
 config GPIO_XGENE
 	bool "APM X-Gene GPIO controller support"
-	depends on ARM64 && OF_GPIO
+	depends on ARM64 && OF_GPIO || COMPILE_TEST
 	help
 	  This driver is to support the GPIO block within the APM X-Gene SoC
 	  platform's generic flash controller. The GPIO pins are muxed with
-- 
2.7.2

