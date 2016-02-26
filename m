From: Alexander Stein <alexanders83@web.de>
Subject: [PATCH 62/63] gpio: grgpio: Allow compile testing
Date: Fri, 26 Feb 2016 16:00:54 +0100
Message-ID: <1456498855-25882-1-git-send-email-alexanders83@web.de>
References: <1456492692-21592-1-git-send-email-alexanders83@web.de>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mout.web.de ([212.227.15.4]:52238 "EHLO mout.web.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753896AbcBZPBI (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Fri, 26 Feb 2016 10:01:08 -0500
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
index b331dc3e050c..121605bd38fa 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -213,7 +213,7 @@ config GPIO_GENERIC_PLATFORM
 
 config GPIO_GRGPIO
 	tristate "Aeroflex Gaisler GRGPIO support"
-	depends on OF
+	depends on OF || COMPILE_TEST
 	select GPIO_GENERIC
 	select IRQ_DOMAIN
 	help
-- 
2.7.2

