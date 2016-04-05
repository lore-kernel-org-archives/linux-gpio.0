From: Alexander Stein <alexanders83@web.de>
Subject: [PATCH v2 09/63] gpio: mxs: Allow compile testing
Date: Tue,  5 Apr 2016 19:35:18 +0200
Message-ID: <1459877772-11289-10-git-send-email-alexanders83@web.de>
References: <1459877772-11289-1-git-send-email-alexanders83@web.de>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mout.web.de ([212.227.17.11]:51906 "EHLO mout.web.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751070AbcDERgt (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Tue, 5 Apr 2016 13:36:49 -0400
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
index 44ae3e5c0776..8748a94c2d45 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -322,7 +322,7 @@ config GPIO_MXC
 
 config GPIO_MXS
 	def_bool y
-	depends on ARCH_MXS
+	depends on ARCH_MXS || COMPILE_TEST
 	select GPIO_GENERIC
 	select GENERIC_IRQ_CHIP
 
-- 
2.8.0

