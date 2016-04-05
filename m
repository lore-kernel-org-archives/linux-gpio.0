From: Alexander Stein <alexanders83@web.de>
Subject: [PATCH v2 58/63] gpio: 74x164: Allow compile testing
Date: Tue,  5 Apr 2016 19:39:39 +0200
Message-ID: <1459877980-31872-19-git-send-email-alexanders83@web.de>
References: <1459877772-11289-1-git-send-email-alexanders83@web.de>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mout.web.de ([212.227.15.4]:63337 "EHLO mout.web.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1759595AbcDERkF (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Tue, 5 Apr 2016 13:40:05 -0400
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
index d77281285d24..03ff9e8a8759 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -1065,7 +1065,7 @@ menu "SPI GPIO expanders"
 
 config GPIO_74X164
 	tristate "74x164 serial-in/parallel-out 8-bits shift register"
-	depends on OF
+	depends on OF || COMPILE_TEST
 	help
 	  Driver for 74x164 compatible serial-in/parallel-out 8-outputs
 	  shift registers. This driver can be used to provide access
-- 
2.8.0

