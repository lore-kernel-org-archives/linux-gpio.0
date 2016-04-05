From: Alexander Stein <alexanders83@web.de>
Subject: [PATCH v2 30/63] gpio: lp3943: Allow compile testing
Date: Tue,  5 Apr 2016 19:39:00 +0200
Message-ID: <1459877949-29889-11-git-send-email-alexanders83@web.de>
References: <1459877772-11289-1-git-send-email-alexanders83@web.de>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mout.web.de ([212.227.17.11]:50448 "EHLO mout.web.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1759192AbcDERjW (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Tue, 5 Apr 2016 13:39:22 -0400
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
index ba4459005399..de9b8802e295 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -852,7 +852,7 @@ config GPIO_KEMPLD
 
 config GPIO_LP3943
 	tristate "TI/National Semiconductor LP3943 GPIO expander"
-	depends on MFD_LP3943
+	depends on MFD_LP3943 || COMPILE_TEST
 	help
 	  GPIO driver for LP3943 MFD.
 	  LP3943 can be used as a GPIO expander which provides up to 16 GPIOs.
-- 
2.8.0

