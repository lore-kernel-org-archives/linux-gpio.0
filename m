From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] gpio: split gpiod board registration into machine header
Date: Thu, 24 Jul 2014 20:16:41 +0200
Message-ID: <1406225801-30295-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wg0-f43.google.com ([74.125.82.43]:48198 "EHLO
	mail-wg0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S934165AbaGXSQy (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 24 Jul 2014 14:16:54 -0400
Received: by mail-wg0-f43.google.com with SMTP id l18so3062731wgh.14
        for <linux-gpio@vger.kernel.org>; Thu, 24 Jul 2014 11:16:50 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Alexandre Courbot <acourbot@nvidia.com>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Andrew Victor <linux@maxim.org.za>, Nicolas Ferre <nicolas.ferre@atmel.com>, Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>, Ralf Baechle <ralf@linux-mips.org>, Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>

As per example from the regulator subsystem: put all defines and
functions related to registering board info for GPIO descriptors
into a separate <linux/gpio/machine.h> header.

Cc: Alexandre Courbot <gnurou@gmail.com>
Cc: Andrew Victor <linux@maxim.org.za>
Cc: Nicolas Ferre <nicolas.ferre@atmel.com>
Cc: Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: Stephen Warren <swarren@wwwdotorg.org>
Cc: Thierry Reding <thierry.reding@gmail.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 Documentation/gpio/board.txt            |  2 +-
 arch/arm/mach-at91/at91rm9200_devices.c |  2 +-
 arch/arm/mach-tegra/board-paz00.c       |  2 +-
 arch/mips/jz4740/board-qi_lb60.c        |  1 +
 drivers/gpio/gpiolib.c                  |  1 +
 include/linux/gpio/driver.h             | 54 ------------------------------
 include/linux/gpio/machine.h            | 58 +++++++++++++++++++++++++++++++++
 7 files changed, 63 insertions(+), 57 deletions(-)
 create mode 100644 include/linux/gpio/machine.h

diff --git a/Documentation/gpio/board.txt b/Documentation/gpio/board.txt
index ba169faad5c6..4452786225b8 100644
--- a/Documentation/gpio/board.txt
+++ b/Documentation/gpio/board.txt
@@ -60,7 +60,7 @@ Platform Data
 Finally, GPIOs can be bound to devices and functions using platform data. Board
 files that desire to do so need to include the following header:
 
-	#include <linux/gpio/driver.h>
+	#include <linux/gpio/machine.h>
 
 GPIOs are mapped by the means of tables of lookups, containing instances of the
 gpiod_lookup structure. Two macros are defined to help declaring such mappings:
diff --git a/arch/arm/mach-at91/at91rm9200_devices.c b/arch/arm/mach-at91/at91rm9200_devices.c
index 3f4bb58aea54..74f1eaf97801 100644
--- a/arch/arm/mach-at91/at91rm9200_devices.c
+++ b/arch/arm/mach-at91/at91rm9200_devices.c
@@ -15,7 +15,7 @@
 
 #include <linux/dma-mapping.h>
 #include <linux/gpio.h>
-#include <linux/gpio/driver.h>
+#include <linux/gpio/machine.h>
 #include <linux/platform_device.h>
 #include <linux/i2c-gpio.h>
 
diff --git a/arch/arm/mach-tegra/board-paz00.c b/arch/arm/mach-tegra/board-paz00.c
index 9c6029ba526f..91fd858ced0d 100644
--- a/arch/arm/mach-tegra/board-paz00.c
+++ b/arch/arm/mach-tegra/board-paz00.c
@@ -18,7 +18,7 @@
  */
 
 #include <linux/platform_device.h>
-#include <linux/gpio/driver.h>
+#include <linux/gpio/machine.h>
 #include <linux/rfkill-gpio.h>
 #include "board.h"
 
diff --git a/arch/mips/jz4740/board-qi_lb60.c b/arch/mips/jz4740/board-qi_lb60.c
index 088e92a79ae6..c454525e7695 100644
--- a/arch/mips/jz4740/board-qi_lb60.c
+++ b/arch/mips/jz4740/board-qi_lb60.c
@@ -15,6 +15,7 @@
 #include <linux/kernel.h>
 #include <linux/init.h>
 #include <linux/gpio.h>
+#include <linux/gpio/machine.h>
 
 #include <linux/input.h>
 #include <linux/gpio_keys.h>
diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 768f0831db18..18b069e6ba03 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -14,6 +14,7 @@
 #include <linux/slab.h>
 #include <linux/acpi.h>
 #include <linux/gpio/driver.h>
+#include <linux/gpio/machine.h>
 
 #include "gpiolib.h"
 
diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index 4c463fb0155e..e78a2373e374 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -151,60 +151,6 @@ void gpio_unlock_as_irq(struct gpio_chip *chip, unsigned int offset);
 
 struct gpio_chip *gpiod_to_chip(const struct gpio_desc *desc);
 
-enum gpio_lookup_flags {
-	GPIO_ACTIVE_HIGH = (0 << 0),
-	GPIO_ACTIVE_LOW = (1 << 0),
-	GPIO_OPEN_DRAIN = (1 << 1),
-	GPIO_OPEN_SOURCE = (1 << 2),
-};
-
-/**
- * struct gpiod_lookup - lookup table
- * @chip_label: name of the chip the GPIO belongs to
- * @chip_hwnum: hardware number (i.e. relative to the chip) of the GPIO
- * @con_id: name of the GPIO from the device's point of view
- * @idx: index of the GPIO in case several GPIOs share the same name
- * @flags: mask of GPIO_* values
- *
- * gpiod_lookup is a lookup table for associating GPIOs to specific devices and
- * functions using platform data.
- */
-struct gpiod_lookup {
-	const char *chip_label;
-	u16 chip_hwnum;
-	const char *con_id;
-	unsigned int idx;
-	enum gpio_lookup_flags flags;
-};
-
-struct gpiod_lookup_table {
-	struct list_head list;
-	const char *dev_id;
-	struct gpiod_lookup table[];
-};
-
-/*
- * Simple definition of a single GPIO under a con_id
- */
-#define GPIO_LOOKUP(_chip_label, _chip_hwnum, _con_id, _flags) \
-	GPIO_LOOKUP_IDX(_chip_label, _chip_hwnum, _con_id, 0, _flags)
-
-/*
- * Use this macro if you need to have several GPIOs under the same con_id.
- * Each GPIO needs to use a different index and can be accessed using
- * gpiod_get_index()
- */
-#define GPIO_LOOKUP_IDX(_chip_label, _chip_hwnum, _con_id, _idx, _flags)  \
-{                                                                         \
-	.chip_label = _chip_label,                                        \
-	.chip_hwnum = _chip_hwnum,                                        \
-	.con_id = _con_id,                                                \
-	.idx = _idx,                                                      \
-	.flags = _flags,                                                  \
-}
-
-void gpiod_add_lookup_table(struct gpiod_lookup_table *table);
-
 #ifdef CONFIG_GPIOLIB_IRQCHIP
 
 void gpiochip_set_chained_irqchip(struct gpio_chip *gpiochip,
diff --git a/include/linux/gpio/machine.h b/include/linux/gpio/machine.h
new file mode 100644
index 000000000000..b8ad87fab4ce
--- /dev/null
+++ b/include/linux/gpio/machine.h
@@ -0,0 +1,58 @@
+#ifndef __LINUX_GPIO_MACHINE_H
+#define __LINUX_GPIO_MACHINE_H
+
+enum gpio_lookup_flags {
+	GPIO_ACTIVE_HIGH = (0 << 0),
+	GPIO_ACTIVE_LOW = (1 << 0),
+	GPIO_OPEN_DRAIN = (1 << 1),
+	GPIO_OPEN_SOURCE = (1 << 2),
+};
+
+/**
+ * struct gpiod_lookup - lookup table
+ * @chip_label: name of the chip the GPIO belongs to
+ * @chip_hwnum: hardware number (i.e. relative to the chip) of the GPIO
+ * @con_id: name of the GPIO from the device's point of view
+ * @idx: index of the GPIO in case several GPIOs share the same name
+ * @flags: mask of GPIO_* values
+ *
+ * gpiod_lookup is a lookup table for associating GPIOs to specific devices and
+ * functions using platform data.
+ */
+struct gpiod_lookup {
+	const char *chip_label;
+	u16 chip_hwnum;
+	const char *con_id;
+	unsigned int idx;
+	enum gpio_lookup_flags flags;
+};
+
+struct gpiod_lookup_table {
+	struct list_head list;
+	const char *dev_id;
+	struct gpiod_lookup table[];
+};
+
+/*
+ * Simple definition of a single GPIO under a con_id
+ */
+#define GPIO_LOOKUP(_chip_label, _chip_hwnum, _con_id, _flags) \
+	GPIO_LOOKUP_IDX(_chip_label, _chip_hwnum, _con_id, 0, _flags)
+
+/*
+ * Use this macro if you need to have several GPIOs under the same con_id.
+ * Each GPIO needs to use a different index and can be accessed using
+ * gpiod_get_index()
+ */
+#define GPIO_LOOKUP_IDX(_chip_label, _chip_hwnum, _con_id, _idx, _flags)  \
+{                                                                         \
+	.chip_label = _chip_label,                                        \
+	.chip_hwnum = _chip_hwnum,                                        \
+	.con_id = _con_id,                                                \
+	.idx = _idx,                                                      \
+	.flags = _flags,                                                  \
+}
+
+void gpiod_add_lookup_table(struct gpiod_lookup_table *table);
+
+#endif /* __LINUX_GPIO_MACHINE_H */
-- 
1.9.3

