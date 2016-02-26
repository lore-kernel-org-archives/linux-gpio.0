From: Alexander Stein <alexanders83@web.de>
Subject: [PATCH 08/63] gpio: moxart: Allow compile testing
Date: Fri, 26 Feb 2016 14:17:17 +0100
Message-ID: <1456492692-21592-9-git-send-email-alexanders83@web.de>
References: <1456492692-21592-1-git-send-email-alexanders83@web.de>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mout.web.de ([212.227.17.12]:51578 "EHLO mout.web.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752049AbcBZNSU (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Fri, 26 Feb 2016 08:18:20 -0500
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
index d470f93ef7a7..558c4d2789c6 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -280,7 +280,7 @@ config GPIO_MM_LANTIQ
 
 config GPIO_MOXART
 	bool "MOXART GPIO support"
-	depends on ARCH_MOXART
+	depends on ARCH_MOXART || COMPILE_TEST
 	select GPIO_GENERIC
 	help
 	  Select this option to enable GPIO driver for
-- 
2.7.2

