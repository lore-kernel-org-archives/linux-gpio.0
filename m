From: Alexander Stein <alexanders83@web.de>
Subject: [PATCH v2 61/63] gpio: mvebu: Allow compile testing
Date: Tue,  5 Apr 2016 19:39:59 +0200
Message-ID: <1459878001-32430-2-git-send-email-alexanders83@web.de>
References: <1459877772-11289-1-git-send-email-alexanders83@web.de>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mout.web.de ([212.227.17.11]:64953 "EHLO mout.web.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1759624AbcDERkG (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Tue, 5 Apr 2016 13:40:06 -0400
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
index 712ff1ffa4c3..57a8b628af14 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -311,7 +311,7 @@ config GPIO_MPC8XXX
 config GPIO_MVEBU
 	def_bool y
 	depends on PLAT_ORION || COMPILE_TEST
-	depends on OF
+	depends on OF || COMPILE_TEST
 	select GENERIC_IRQ_CHIP
 
 config GPIO_MXC
-- 
2.8.0

