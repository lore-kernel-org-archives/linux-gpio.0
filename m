From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH] gpio/qoriq: select IRQ_DOMAIN
Date: Tue, 19 Apr 2016 14:10:08 +0200
Message-ID: <1461067821-2031706-1-git-send-email-arnd@arndb.de>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.17.13]:61087 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752113AbcDSMK3 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 19 Apr 2016 08:10:29 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Liu Gang <Gang.Liu@nxp.com>, Arnd Bergmann <arnd@arndb.de>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org

The gpio-mpc8xxx driver requires IRQ domains but can be built
without them, resulting on a failure to build certain randconfigs
on ARM:

drivers/gpio/gpio-mpc8xxx.c: In function 'mpc8xxx_gpio_to_irq':
drivers/gpio/gpio-mpc8xxx.c:92:10: error: implicit declaration of function 'irq_create_mapping' [-Werror=implicit-function-declaration]
   return irq_create_mapping(mpc8xxx_gc->irq, offset);

This selects IRQ_DOMAIN from the driver to ensure we can build it.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
Fixes: 5df7fd46b70b ("gpio/qoriq: Add qoriq platforms support")
---
 drivers/gpio/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index f73f26b43532..dcdf3fb301d1 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -304,6 +304,7 @@ config GPIO_MPC8XXX
 		   FSL_SOC_BOOKE || PPC_86xx || ARCH_LAYERSCAPE || ARM || \
 		   COMPILE_TEST
 	select GPIO_GENERIC
+	select IRQ_DOMAIN
 	help
 	  Say Y here if you're going to use hardware that connects to the
 	  MPC512x/831x/834x/837x/8572/8610/QorIQ GPIOs.
-- 
2.7.0

