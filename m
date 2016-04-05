From: Alexander Stein <alexanders83@web.de>
Subject: [PATCH v2 25/63] gpio: da9052: Allow compile testing
Date: Tue,  5 Apr 2016 19:38:55 +0200
Message-ID: <1459877949-29889-6-git-send-email-alexanders83@web.de>
References: <1459877772-11289-1-git-send-email-alexanders83@web.de>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mout.web.de ([212.227.17.11]:59420 "EHLO mout.web.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1759270AbcDERjZ (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Tue, 5 Apr 2016 13:39:25 -0400
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
index f10da927adb9..4d06fdbfc438 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -805,7 +805,7 @@ config GPIO_CS5535
 
 config GPIO_DA9052
 	tristate "Dialog DA9052 GPIO"
-	depends on PMIC_DA9052
+	depends on PMIC_DA9052 || COMPILE_TEST
 	help
 	  Say yes here to enable the GPIO driver for the DA9052 chip.
 
-- 
2.8.0

