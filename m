From: Alexander Stein <alexanders83@web.de>
Subject: [PATCH 54/63] gpio: lynxpoint: Allow compile testing
Date: Fri, 26 Feb 2016 14:21:30 +0100
Message-ID: <1456492895-21835-15-git-send-email-alexanders83@web.de>
References: <1456492692-21592-1-git-send-email-alexanders83@web.de>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mout.web.de ([212.227.17.11]:63099 "EHLO mout.web.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753896AbcBZNVr (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Fri, 26 Feb 2016 08:21:47 -0500
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
index d4e09553f8c2..4bfacf1d4137 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -258,7 +258,7 @@ config GPIO_LPC18XX
 
 config GPIO_LYNXPOINT
 	tristate "Intel Lynxpoint GPIO support"
-	depends on ACPI && X86
+	depends on ACPI && X86 || COMPILE_TEST
 	select GPIOLIB_IRQCHIP
 	help
 	  driver for GPIO functionality on Intel Lynxpoint PCH chipset
-- 
2.7.2

