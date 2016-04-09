From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] gpio: sx150x: move platform data into driver
Date: Sat,  9 Apr 2016 10:56:13 +0200
Message-ID: <1460192173-8995-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f47.google.com ([209.85.215.47]:35764 "EHLO
	mail-lf0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751266AbcDII4V (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sat, 9 Apr 2016 04:56:21 -0400
Received: by mail-lf0-f47.google.com with SMTP id c126so102883168lfb.2
        for <linux-gpio@vger.kernel.org>; Sat, 09 Apr 2016 01:56:20 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Wei Chen <Wei.Chen@csr.com>, Peter Rosin <peda@axentia.se>, Wolfram Sang <wsa@the-dreams.de>

The sx150x has some platform data definition in <linux/i2c/sx150x.h>
but this file is only included from the driver in the whole kernel
so move its contents into the driver.

Cc: Wei Chen <Wei.Chen@csr.com>
Cc: Peter Rosin <peda@axentia.se>
Cc: Wolfram Sang <wsa@the-dreams.de>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
Wolfram: I assume you're OK with me stealing this file.
---
 drivers/gpio/gpio-sx150x.c | 60 ++++++++++++++++++++++++++++++++-
 include/linux/i2c/sx150x.h | 82 ----------------------------------------------
 2 files changed, 59 insertions(+), 83 deletions(-)
 delete mode 100644 include/linux/i2c/sx150x.h

diff --git a/drivers/gpio/gpio-sx150x.c b/drivers/gpio/gpio-sx150x.c
index d57e8ad0bfd2..d4501d5f8b8e 100644
--- a/drivers/gpio/gpio-sx150x.c
+++ b/drivers/gpio/gpio-sx150x.c
@@ -25,7 +25,6 @@
 #include <linux/irq.h>
 #include <linux/mutex.h>
 #include <linux/slab.h>
-#include <linux/i2c/sx150x.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
 #include <linux/of_irq.h>
@@ -85,6 +84,65 @@ struct sx150x_device_data {
 	} pri;
 };
 
+/**
+ * struct sx150x_platform_data - config data for SX150x driver
+ * @gpio_base: The index number of the first GPIO assigned to this
+ *             GPIO expander.  The expander will create a block of
+ *             consecutively numbered gpios beginning at the given base,
+ *             with the size of the block depending on the model of the
+ *             expander chip.
+ * @oscio_is_gpo: If set to true, the driver will configure OSCIO as a GPO
+ *                instead of as an oscillator, increasing the size of the
+ *                GP(I)O pool created by this expander by one.  The
+ *                output-only GPO pin will be added at the end of the block.
+ * @io_pullup_ena: A bit-mask which enables or disables the pull-up resistor
+ *                 for each IO line in the expander.  Setting the bit at
+ *                 position n will enable the pull-up for the IO at
+ *                 the corresponding offset.  For chips with fewer than
+ *                 16 IO pins, high-end bits are ignored.
+ * @io_pulldn_ena: A bit-mask which enables-or disables the pull-down
+ *                 resistor for each IO line in the expander. Setting the
+ *                 bit at position n will enable the pull-down for the IO at
+ *                 the corresponding offset.  For chips with fewer than
+ *                 16 IO pins, high-end bits are ignored.
+ * @io_open_drain_ena: A bit-mask which enables-or disables open-drain
+ *                     operation for each IO line in the expander. Setting the
+ *                     bit at position n enables open-drain operation for
+ *                     the IO at the corresponding offset.  Clearing the bit
+ *                     enables regular push-pull operation for that IO.
+ *                     For chips with fewer than 16 IO pins, high-end bits
+ *                     are ignored.
+ * @io_polarity: A bit-mask which enables polarity inversion for each IO line
+ *               in the expander.  Setting the bit at position n inverts
+ *               the polarity of that IO line, while clearing it results
+ *               in normal polarity. For chips with fewer than 16 IO pins,
+ *               high-end bits are ignored.
+ * @irq_summary: The 'summary IRQ' line to which the GPIO expander's INT line
+ *               is connected, via which it reports interrupt events
+ *               across all GPIO lines.  This must be a real,
+ *               pre-existing IRQ line.
+ *               Setting this value < 0 disables the irq_chip functionality
+ *               of the driver.
+ * @irq_base: The first 'virtual IRQ' line at which our block of GPIO-based
+ *            IRQ lines will appear.  Similarly to gpio_base, the expander
+ *            will create a block of irqs beginning at this number.
+ *            This value is ignored if irq_summary is < 0.
+ * @reset_during_probe: If set to true, the driver will trigger a full
+ *                      reset of the chip at the beginning of the probe
+ *                      in order to place it in a known state.
+ */
+struct sx150x_platform_data {
+	unsigned gpio_base;
+	bool     oscio_is_gpo;
+	u16      io_pullup_ena;
+	u16      io_pulldn_ena;
+	u16      io_open_drain_ena;
+	u16      io_polarity;
+	int      irq_summary;
+	unsigned irq_base;
+	bool     reset_during_probe;
+};
+
 struct sx150x_chip {
 	struct gpio_chip                 gpio_chip;
 	struct i2c_client               *client;
diff --git a/include/linux/i2c/sx150x.h b/include/linux/i2c/sx150x.h
deleted file mode 100644
index 52baa79d69a7..000000000000
--- a/include/linux/i2c/sx150x.h
+++ /dev/null
@@ -1,82 +0,0 @@
-/*
- * Driver for the Semtech SX150x I2C GPIO Expanders
- *
- * Copyright (c) 2010, Code Aurora Forum. All rights reserved.
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License version 2 and
- * only version 2 as published by the Free Software Foundation.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program; if not, write to the Free Software
- * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
- * 02110-1301, USA.
- */
-#ifndef __LINUX_I2C_SX150X_H
-#define __LINUX_I2C_SX150X_H
-
-/**
- * struct sx150x_platform_data - config data for SX150x driver
- * @gpio_base: The index number of the first GPIO assigned to this
- *             GPIO expander.  The expander will create a block of
- *             consecutively numbered gpios beginning at the given base,
- *             with the size of the block depending on the model of the
- *             expander chip.
- * @oscio_is_gpo: If set to true, the driver will configure OSCIO as a GPO
- *                instead of as an oscillator, increasing the size of the
- *                GP(I)O pool created by this expander by one.  The
- *                output-only GPO pin will be added at the end of the block.
- * @io_pullup_ena: A bit-mask which enables or disables the pull-up resistor
- *                 for each IO line in the expander.  Setting the bit at
- *                 position n will enable the pull-up for the IO at
- *                 the corresponding offset.  For chips with fewer than
- *                 16 IO pins, high-end bits are ignored.
- * @io_pulldn_ena: A bit-mask which enables-or disables the pull-down
- *                 resistor for each IO line in the expander. Setting the
- *                 bit at position n will enable the pull-down for the IO at
- *                 the corresponding offset.  For chips with fewer than
- *                 16 IO pins, high-end bits are ignored.
- * @io_open_drain_ena: A bit-mask which enables-or disables open-drain
- *                     operation for each IO line in the expander. Setting the
- *                     bit at position n enables open-drain operation for
- *                     the IO at the corresponding offset.  Clearing the bit
- *                     enables regular push-pull operation for that IO.
- *                     For chips with fewer than 16 IO pins, high-end bits
- *                     are ignored.
- * @io_polarity: A bit-mask which enables polarity inversion for each IO line
- *               in the expander.  Setting the bit at position n inverts
- *               the polarity of that IO line, while clearing it results
- *               in normal polarity. For chips with fewer than 16 IO pins,
- *               high-end bits are ignored.
- * @irq_summary: The 'summary IRQ' line to which the GPIO expander's INT line
- *               is connected, via which it reports interrupt events
- *               across all GPIO lines.  This must be a real,
- *               pre-existing IRQ line.
- *               Setting this value < 0 disables the irq_chip functionality
- *               of the driver.
- * @irq_base: The first 'virtual IRQ' line at which our block of GPIO-based
- *            IRQ lines will appear.  Similarly to gpio_base, the expander
- *            will create a block of irqs beginning at this number.
- *            This value is ignored if irq_summary is < 0.
- * @reset_during_probe: If set to true, the driver will trigger a full
- *                      reset of the chip at the beginning of the probe
- *                      in order to place it in a known state.
- */
-struct sx150x_platform_data {
-	unsigned gpio_base;
-	bool     oscio_is_gpo;
-	u16      io_pullup_ena;
-	u16      io_pulldn_ena;
-	u16      io_open_drain_ena;
-	u16      io_polarity;
-	int      irq_summary;
-	unsigned irq_base;
-	bool     reset_during_probe;
-};
-
-#endif /* __LINUX_I2C_SX150X_H */
-- 
2.4.3

