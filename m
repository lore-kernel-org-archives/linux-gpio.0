From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH 1/2] gpio: ingenic: add CONFIG_OF dependency
Date: Mon, 29 May 2017 14:57:48 +0200
Message-ID: <20170529125802.163127-1-arnd@arndb.de>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([217.72.192.74]:56197 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750985AbdE2M6J (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 29 May 2017 08:58:09 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Paul Cercueil <paul@crapouillou.net>, Arnd Bergmann <arnd@arndb.de>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org

The driver cannot access the of_node field when CONFIG_OF is disabled:

drivers/gpio/gpio-ingenic.c: In function 'ingenic_gpio_probe':
drivers/gpio/gpio-ingenic.c:324:10: error: 'struct gpio_chip' has no member named 'of_node'

Fixes: b0653ce39a0d ("gpio: Add gpio-ingenic driver")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpio/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index fe25de1b187c..436c38cdb297 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -245,6 +245,7 @@ config GPIO_ICH
 config GPIO_INGENIC
 	tristate "Ingenic JZ47xx SoCs GPIO support"
 	depends on MACH_INGENIC || COMPILE_TEST
+	depends on OF
 	select GPIOLIB_IRQCHIP
 	help
 	  Say yes here to support the GPIO functionality present on the
-- 
2.9.0

