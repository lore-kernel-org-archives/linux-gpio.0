From: Alexander Stein <alexanders83@web.de>
Subject: [PATCH v2 04/63] gpio: em: Allow compile testing
Date: Tue,  5 Apr 2016 19:35:13 +0200
Message-ID: <1459877772-11289-5-git-send-email-alexanders83@web.de>
References: <1459877772-11289-1-git-send-email-alexanders83@web.de>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mout.web.de ([212.227.17.12]:61475 "EHLO mout.web.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751620AbcDERgs (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Tue, 5 Apr 2016 13:36:48 -0400
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
index 0917f2fdd674..68f83d317c49 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -176,7 +176,7 @@ config GPIO_DWAPB
 
 config GPIO_EM
 	tristate "Emma Mobile GPIO"
-	depends on ARM && OF_GPIO
+	depends on ARM && OF_GPIO || COMPILE_TEST
 	help
 	  Say yes here to support GPIO on Renesas Emma Mobile SoCs.
 
-- 
2.8.0

