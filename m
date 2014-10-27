From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] gpio: dwapb: fix compile errors
Date: Mon, 27 Oct 2014 18:20:14 +0100
Message-ID: <1414430414-12586-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wg0-f50.google.com ([74.125.82.50]:60429 "EHLO
	mail-wg0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751368AbaJ0RUU (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 27 Oct 2014 13:20:20 -0400
Received: by mail-wg0-f50.google.com with SMTP id z12so3648181wgg.33
        for <linux-gpio@vger.kernel.org>; Mon, 27 Oct 2014 10:20:19 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Alexandre Courbot <acourbot@nvidia.com>, Linus Walleij <linus.walleij@linaro.org>, Jamie Iles <jamie@jamieiles.com>, Alan Tull <atull@altera.com>

Whereas the DWAPB driver does not really depend on the ARM
architecture, it uses [readl|writel]_relaxed() not found on
arch such as Blackfin, so restrict this to ARM until there is
another architecture that can make use of it.

It is also using the of_node of the gpiochip, so fix this
too by requiring OF_GPIO.

All error/warnings:

make.cross ARCH=blackfin
drivers/gpio/gpio-dwapb.c: In function 'dwapb_irq_handler':
drivers/gpio/gpio-dwapb.c:91:2: error: implicit declaration of function 'readl_relaxed' [-Werror=implicit-function-declaration]
drivers/gpio/gpio-dwapb.c: In function 'dwapb_configure_irqs':
drivers/gpio/gpio-dwapb.c:212:32: error: 'struct gpio_chip' has no member named 'of_node'
drivers/gpio/gpio-dwapb.c:221:16: error: 'struct gpio_chip' has no member named 'of_node'
drivers/gpio/gpio-dwapb.c: In function 'dwapb_gpio_add_port':
drivers/gpio/gpio-dwapb.c:331:14: error: 'struct gpio_chip' has no member named 'of_node'
cc1: some warnings being treated as errors

Cc: Jamie Iles <jamie@jamieiles.com>
Cc: Alan Tull <atull@altera.com>
Reported-by: kbuild test robot <fengguang.wu@intel.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 690ad0b20414..414d0559d32f 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -148,6 +148,8 @@ config GPIO_GENERIC_PLATFORM
 
 config GPIO_DWAPB
 	tristate "Synopsys DesignWare APB GPIO driver"
+	depends on ARM
+	depends on OF_GPIO
 	select GPIO_GENERIC
 	select GENERIC_IRQ_CHIP
 	help
-- 
1.9.3

