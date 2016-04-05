From: Alexander Stein <alexanders83@web.de>
Subject: [PATCH v2 23/63] gpio: arizona: Allow compile testing
Date: Tue,  5 Apr 2016 19:38:53 +0200
Message-ID: <1459877949-29889-4-git-send-email-alexanders83@web.de>
References: <1459877772-11289-1-git-send-email-alexanders83@web.de>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mout.web.de ([212.227.17.12]:63784 "EHLO mout.web.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1758469AbcDERjU (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Tue, 5 Apr 2016 13:39:20 -0400
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
index 308b43da6c80..2954c068b151 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -776,7 +776,7 @@ config GPIO_ADP5520
 
 config GPIO_ARIZONA
 	tristate "Wolfson Microelectronics Arizona class devices"
-	depends on MFD_ARIZONA
+	depends on MFD_ARIZONA || COMPILE_TEST
 	help
 	  Support for GPIOs on Wolfson Arizona class devices.
 
-- 
2.8.0

