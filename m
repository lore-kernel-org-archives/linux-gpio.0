From: Alexander Stein <alexanders83@web.de>
Subject: [PATCH 60/63] gpio: 74x164: Allow compile testing
Date: Fri, 26 Feb 2016 14:21:58 +0100
Message-ID: <1456492921-21905-1-git-send-email-alexanders83@web.de>
References: <1456492692-21592-1-git-send-email-alexanders83@web.de>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mout.web.de ([212.227.15.14]:62340 "EHLO mout.web.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752937AbcBZNWI (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Fri, 26 Feb 2016 08:22:08 -0500
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
index aa6007b71a16..8cbece5e9955 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -1049,7 +1049,7 @@ menu "SPI GPIO expanders"
 
 config GPIO_74X164
 	tristate "74x164 serial-in/parallel-out 8-bits shift register"
-	depends on OF
+	depends on OF || COMPILE_TEST
 	help
 	  Driver for 74x164 compatible serial-in/parallel-out 8-outputs
 	  shift registers. This driver can be used to provide access
-- 
2.7.2

