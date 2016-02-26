From: Alexander Stein <alexanders83@web.de>
Subject: [PATCH 40/63] gpio: tps65910: Allow compile testing
Date: Fri, 26 Feb 2016 14:21:16 +0100
Message-ID: <1456492895-21835-1-git-send-email-alexanders83@web.de>
References: <1456492692-21592-1-git-send-email-alexanders83@web.de>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mout.web.de ([212.227.17.12]:49798 "EHLO mout.web.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752049AbcBZNVn (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Fri, 26 Feb 2016 08:21:43 -0500
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
index 01497752ae3c..a9f0befdf119 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -911,7 +911,7 @@ config GPIO_TPS6586X
 
 config GPIO_TPS65910
 	bool "TPS65910 GPIO"
-	depends on MFD_TPS65910
+	depends on MFD_TPS65910 || COMPILE_TEST
 	help
 	  Select this option to enable GPIO driver for the TPS65910
 	  chip family.
-- 
2.7.2

