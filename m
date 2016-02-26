From: Alexander Stein <alexanders83@web.de>
Subject: [PATCH 26/63] gpio: arizona: Allow compile testing
Date: Fri, 26 Feb 2016 14:19:25 +0100
Message-ID: <1456492778-21711-7-git-send-email-alexanders83@web.de>
References: <1456492692-21592-1-git-send-email-alexanders83@web.de>
 <1456492778-21711-1-git-send-email-alexanders83@web.de>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mout.web.de ([212.227.15.3]:64003 "EHLO mout.web.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754080AbcBZNTv (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
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
index 818493192a0b..db828cf76ca8 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -766,7 +766,7 @@ config GPIO_ADP5520
 
 config GPIO_ARIZONA
 	tristate "Wolfson Microelectronics Arizona class devices"
-	depends on MFD_ARIZONA
+	depends on MFD_ARIZONA || COMPILE_TEST
 	help
 	  Support for GPIOs on Wolfson Arizona class devices.
 
-- 
2.7.2

