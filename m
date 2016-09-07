From: Vladimir Zapolskiy <vz@mleia.com>
Subject: [PATCH] gpio: lpc32xx: remove unused platform data file
Date: Thu,  8 Sep 2016 02:58:32 +0300
Message-ID: <1473292712-8061-1-git-send-email-vz@mleia.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mleia.com ([178.79.152.223]:43534 "EHLO mail.mleia.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751673AbcIGX6l (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 7 Sep 2016 19:58:41 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, Sylvain Lemieux <slemieux.tyco@gmail.com>, linux-gpio@vger.kernel.org

ARM LPC32xx platform is device-tree only, there is no need to keep
a file with GPIO platform data structures, however some of macro
definitions should be moved to the driver code, which is the only user
of the removed header file.

Signed-off-by: Vladimir Zapolskiy <vz@mleia.com>
---
 drivers/gpio/gpio-lpc32xx.c                | 15 ++++++++-
 include/linux/platform_data/gpio-lpc32xx.h | 50 ------------------------------
 2 files changed, 14 insertions(+), 51 deletions(-)
 delete mode 100644 include/linux/platform_data/gpio-lpc32xx.h

diff --git a/drivers/gpio/gpio-lpc32xx.c b/drivers/gpio/gpio-lpc32xx.c
index fc5f197..92b3ae2 100644
--- a/drivers/gpio/gpio-lpc32xx.c
+++ b/drivers/gpio/gpio-lpc32xx.c
@@ -25,7 +25,6 @@
 #include <linux/of_gpio.h>
 #include <linux/platform_device.h>
 #include <linux/module.h>
-#include <linux/platform_data/gpio-lpc32xx.h>
 
 #include <mach/hardware.h>
 #include <mach/platform.h>
@@ -68,6 +67,20 @@
 #define GPI3_PIN_IN_SEL(x, y)			(((x) >> (y)) & 1)
 #define GPO3_PIN_IN_SEL(x, y)			(((x) >> (y)) & 1)
 
+#define LPC32XX_GPIO_P0_MAX	8
+#define LPC32XX_GPIO_P1_MAX	24
+#define LPC32XX_GPIO_P2_MAX	13
+#define LPC32XX_GPIO_P3_MAX	6
+#define LPC32XX_GPI_P3_MAX	29
+#define LPC32XX_GPO_P3_MAX	24
+
+#define LPC32XX_GPIO_P0_GRP	0
+#define LPC32XX_GPIO_P1_GRP	(LPC32XX_GPIO_P0_GRP + LPC32XX_GPIO_P0_MAX)
+#define LPC32XX_GPIO_P2_GRP	(LPC32XX_GPIO_P1_GRP + LPC32XX_GPIO_P1_MAX)
+#define LPC32XX_GPIO_P3_GRP	(LPC32XX_GPIO_P2_GRP + LPC32XX_GPIO_P2_MAX)
+#define LPC32XX_GPI_P3_GRP	(LPC32XX_GPIO_P3_GRP + LPC32XX_GPIO_P3_MAX)
+#define LPC32XX_GPO_P3_GRP	(LPC32XX_GPI_P3_GRP + LPC32XX_GPI_P3_MAX)
+
 struct gpio_regs {
 	void __iomem *inp_state;
 	void __iomem *outp_state;
diff --git a/include/linux/platform_data/gpio-lpc32xx.h b/include/linux/platform_data/gpio-lpc32xx.h
deleted file mode 100644
index a544e96..0000000
--- a/include/linux/platform_data/gpio-lpc32xx.h
+++ /dev/null
@@ -1,50 +0,0 @@
-/*
- * Author: Kevin Wells <kevin.wells@nxp.com>
- *
- * Copyright (C) 2010 NXP Semiconductors
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- */
-
-#ifndef __MACH_GPIO_LPC32XX_H
-#define __MACH_GPIO_LPC32XX_H
-
-/*
- * Note!
- * Muxed GP pins need to be setup to the GP state in the board level
- * code prior to using this driver.
- * GPI pins : 28xP3 group
- * GPO pins : 24xP3 group
- * GPIO pins: 8xP0 group, 24xP1 group, 13xP2 group, 6xP3 group
- */
-
-#define LPC32XX_GPIO_P0_MAX 8
-#define LPC32XX_GPIO_P1_MAX 24
-#define LPC32XX_GPIO_P2_MAX 13
-#define LPC32XX_GPIO_P3_MAX 6
-#define LPC32XX_GPI_P3_MAX 29
-#define LPC32XX_GPO_P3_MAX 24
-
-#define LPC32XX_GPIO_P0_GRP 0
-#define LPC32XX_GPIO_P1_GRP (LPC32XX_GPIO_P0_GRP + LPC32XX_GPIO_P0_MAX)
-#define LPC32XX_GPIO_P2_GRP (LPC32XX_GPIO_P1_GRP + LPC32XX_GPIO_P1_MAX)
-#define LPC32XX_GPIO_P3_GRP (LPC32XX_GPIO_P2_GRP + LPC32XX_GPIO_P2_MAX)
-#define LPC32XX_GPI_P3_GRP (LPC32XX_GPIO_P3_GRP + LPC32XX_GPIO_P3_MAX)
-#define LPC32XX_GPO_P3_GRP (LPC32XX_GPI_P3_GRP + LPC32XX_GPI_P3_MAX)
-
-/*
- * A specific GPIO can be selected with this macro
- * ie, GPIO_05 can be selected with LPC32XX_GPIO(LPC32XX_GPIO_P3_GRP, 5)
- * See the LPC32x0 User's guide for GPIO group numbers
- */
-#define LPC32XX_GPIO(x, y) ((x) + (y))
-
-#endif /* __MACH_GPIO_LPC32XX_H */
-- 
2.8.1

