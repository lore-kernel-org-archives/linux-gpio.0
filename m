From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH] gpio: generic: make bgpio_pdata always visible
Date: Sat, 09 Jan 2016 22:16:42 +0100
Message-ID: <21095568.bdP2eOAsBs@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([217.72.192.74]:58710 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755886AbcAIVRK (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sat, 9 Jan 2016 16:17:10 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org
Cc: Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Alexander Shiyan <shc_work@mail.ru>

Board files that define their own bgpio_pdata are broken when
CONFIG_GPIO_GENERIC is disabled and the bgpio_pdata structure
definition is hidden by the #ifdef:

arch/arm/mach-clps711x/board-autcpu12.c:148:15: error: variable 'autcpu12_mmgpio_pdata' has initializer but incomplete type
 static struct bgpio_pdata autcpu12_mmgpio_pdata __initdata = {
arch/arm/mach-clps711x/board-autcpu12.c:149:2: error: unknown field 'base' specified in initializer
  .base = AUTCPU12_MMGPIO_BASE,

Since the board files should generally not care what drivers are
enabled, this makes the structure definition visible again.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
Fixes: 0f4630f3720e ("gpio: generic: factor into gpio_chip struct")

diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index e2d05fd0e6e3..82fda487453f 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -220,14 +220,14 @@ static inline void *gpiochip_get_data(struct gpio_chip *chip)
 
 struct gpio_chip *gpiod_to_chip(const struct gpio_desc *desc);
 
-#if IS_ENABLED(CONFIG_GPIO_GENERIC)
-
 struct bgpio_pdata {
 	const char *label;
 	int base;
 	int ngpio;
 };
 
+#if IS_ENABLED(CONFIG_GPIO_GENERIC)
+
 int bgpio_init(struct gpio_chip *gc, struct device *dev,
 	       unsigned long sz, void __iomem *dat, void __iomem *set,
 	       void __iomem *clr, void __iomem *dirout, void __iomem *dirin,

