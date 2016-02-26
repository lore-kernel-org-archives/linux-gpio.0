From: Alexander Stein <alexanders83@web.de>
Subject: [PATCH 04/63] gpio: davinci: Allow compile testing
Date: Fri, 26 Feb 2016 14:17:13 +0100
Message-ID: <1456492692-21592-5-git-send-email-alexanders83@web.de>
References: <1456492692-21592-1-git-send-email-alexanders83@web.de>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mout.web.de ([212.227.17.11]:63074 "EHLO mout.web.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751678AbcBZNSU (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
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
index 8bf09873977c..ffc6a2bf9b8b 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -161,7 +161,7 @@ config GPIO_CLPS711X
 config GPIO_DAVINCI
 	bool "TI Davinci/Keystone GPIO support"
 	default y if ARCH_DAVINCI
-	depends on ARM && (ARCH_DAVINCI || ARCH_KEYSTONE)
+	depends on ARM && (ARCH_DAVINCI || ARCH_KEYSTONE) || COMPILE_TEST
 	help
 	  Say yes here to enable GPIO support for TI Davinci/Keystone SoCs.
 
-- 
2.7.2

