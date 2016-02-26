From: Alexander Stein <alexanders83@web.de>
Subject: [PATCH 25/63] gpio: adp5520: Allow compile testing
Date: Fri, 26 Feb 2016 14:19:24 +0100
Message-ID: <1456492778-21711-6-git-send-email-alexanders83@web.de>
References: <1456492692-21592-1-git-send-email-alexanders83@web.de>
 <1456492778-21711-1-git-send-email-alexanders83@web.de>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mout.web.de ([212.227.15.4]:58531 "EHLO mout.web.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753793AbcBZNTv (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
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
index d5df32cccabb..818493192a0b 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -759,7 +759,7 @@ menu "MFD GPIO expanders"
 
 config GPIO_ADP5520
 	tristate "GPIO Support for ADP5520 PMIC"
-	depends on PMIC_ADP5520
+	depends on PMIC_ADP5520 || COMPILE_TEST
 	help
 	  This option enables support for on-chip GPIO found
 	  on Analog Devices ADP5520 PMICs.
-- 
2.7.2

