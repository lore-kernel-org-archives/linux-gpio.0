From: Alexander Stein <alexanders83@web.de>
Subject: [PATCH v2 63/63] gpio: xgene-sb: Allow compile testing
Date: Tue,  5 Apr 2016 20:40:50 +0200
Message-ID: <1459881650-26051-2-git-send-email-alexanders83@web.de>
References: <1459877772-11289-1-git-send-email-alexanders83@web.de>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mout.web.de ([212.227.15.3]:59162 "EHLO mout.web.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1759862AbcDESk6 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Tue, 5 Apr 2016 14:40:58 -0400
In-Reply-To: <1459877772-11289-1-git-send-email-alexanders83@web.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: Alexander Stein <alexanders83@web.de>, linux-gpio@vger.kernel.org

Lower dependencies for compile testing unless IRQ_DOMAIN_HIERARCHY is
undefined, which is required by the driver to compile.

Signed-off-by: Alexander Stein <alexanders83@web.de>
---
 drivers/gpio/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 21dc5e97d38a..ac910d3e0389 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -465,7 +465,7 @@ config GPIO_XGENE
 
 config GPIO_XGENE_SB
 	tristate "APM X-Gene GPIO standby controller support"
-	depends on ARCH_XGENE && OF_GPIO
+	depends on ARCH_XGENE && OF_GPIO || COMPILE_TEST && IRQ_DOMAIN_HIERARCHY
 	select GPIO_GENERIC
 	select GPIOLIB_IRQCHIP
 	help
-- 
2.8.0

