From: Alexander Stein <alexanders83@web.de>
Subject: [PATCH v2 18/63] gpio: vf610: Allow compile testing
Date: Tue,  5 Apr 2016 19:35:27 +0200
Message-ID: <1459877772-11289-19-git-send-email-alexanders83@web.de>
References: <1459877772-11289-1-git-send-email-alexanders83@web.de>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mout.web.de ([212.227.17.11]:50545 "EHLO mout.web.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752060AbcDERgw (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Tue, 5 Apr 2016 13:36:52 -0400
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
index c86b4381c3fb..ec14f1153908 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -431,7 +431,7 @@ config GPIO_TZ1090_PDC
 
 config GPIO_VF610
 	def_bool y
-	depends on ARCH_MXC && SOC_VF610
+	depends on ARCH_MXC && SOC_VF610 || COMPILE_TEST
 	select GPIOLIB_IRQCHIP
 	help
 	  Say yes here to support Vybrid vf610 GPIOs.
-- 
2.8.0

