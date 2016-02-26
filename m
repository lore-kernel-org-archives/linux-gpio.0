From: Alexander Stein <alexanders83@web.de>
Subject: [PATCH 38/63] gpio: tps65218: Allow compile testing
Date: Fri, 26 Feb 2016 14:19:37 +0100
Message-ID: <1456492778-21711-19-git-send-email-alexanders83@web.de>
References: <1456492692-21592-1-git-send-email-alexanders83@web.de>
 <1456492778-21711-1-git-send-email-alexanders83@web.de>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mout.web.de ([212.227.15.3]:56519 "EHLO mout.web.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754035AbcBZNTz (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Fri, 26 Feb 2016 08:19:55 -0500
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
index ab17a7bb359b..b2f4237883d3 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -897,7 +897,7 @@ config GPIO_TIMBERDALE
 
 config GPIO_TPS65218
 	tristate "TPS65218 GPIO"
-	depends on MFD_TPS65218
+	depends on MFD_TPS65218 || COMPILE_TEST
 	help
 	  Select this option to enable GPIO driver for the TPS65218
 	  chip family.
-- 
2.7.2

