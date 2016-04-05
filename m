From: Alexander Stein <alexanders83@web.de>
Subject: [PATCH v2 22/63] gpio: adp5520: Allow compile testing
Date: Tue,  5 Apr 2016 19:38:52 +0200
Message-ID: <1459877949-29889-3-git-send-email-alexanders83@web.de>
References: <1459877772-11289-1-git-send-email-alexanders83@web.de>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mout.web.de ([212.227.17.11]:53682 "EHLO mout.web.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1759426AbcDERj3 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Tue, 5 Apr 2016 13:39:29 -0400
In-Reply-To: <1459877772-11289-1-git-send-email-alexanders83@web.de>
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
index 6b890958fe1b..308b43da6c80 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -769,7 +769,7 @@ menu "MFD GPIO expanders"
 
 config GPIO_ADP5520
 	tristate "GPIO Support for ADP5520 PMIC"
-	depends on PMIC_ADP5520
+	depends on PMIC_ADP5520 || COMPILE_TEST
 	help
 	  This option enables support for on-chip GPIO found
 	  on Analog Devices ADP5520 PMICs.
-- 
2.8.0

