From: "Andrew F. Davis" <afd@ti.com>
Subject: [PATCH 5/5] gpio: davinci: Move driver local definitions to driver
Date: Fri, 31 Aug 2018 14:13:26 -0500
Message-ID: <20180831191326.25106-5-afd@ti.com>
References: <20180831191326.25106-1-afd@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180831191326.25106-1-afd@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sekhar Nori <nsekhar@ti.com>, Kevin Hilman <khilman@kernel.org>, Keerthy <j-keerthy@ti.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, "Andrew F . Davis" <afd@ti.com>
List-Id: linux-gpio@vger.kernel.org

These defines, structs and inline functions are used only internally by
the driver, they do not belong in platform_data. Move them.

Signed-off-by: Andrew F. Davis <afd@ti.com>
---
 drivers/gpio/gpio-davinci.c                | 28 ++++++++++++++++++++++
 include/linux/platform_data/gpio-davinci.h | 28 ----------------------
 2 files changed, 28 insertions(+), 28 deletions(-)

diff --git a/drivers/gpio/gpio-davinci.c b/drivers/gpio/gpio-davinci.c
index 121a7948f785..5c1564fcc24e 100644
--- a/drivers/gpio/gpio-davinci.c
+++ b/drivers/gpio/gpio-davinci.c
@@ -9,6 +9,7 @@
  * the Free Software Foundation; either version 2 of the License, or
  * (at your option) any later version.
  */
+
 #include <linux/gpio/driver.h>
 #include <linux/errno.h>
 #include <linux/kernel.h>
@@ -24,6 +25,12 @@
 #include <linux/platform_device.h>
 #include <linux/platform_data/gpio-davinci.h>
 #include <linux/irqchip/chained_irq.h>
+#include <linux/spinlock.h>
+
+#include <asm-generic/gpio.h>
+
+#define MAX_REGS_BANKS 5
+#define MAX_INT_PER_BANK 32
 
 struct davinci_gpio_regs {
 	u32	dir;
@@ -45,6 +52,27 @@ typedef struct irq_chip *(*gpio_get_irq_chip_cb_t)(unsigned int irq);
 static void __iomem *gpio_base;
 static unsigned int offset_array[5] = {0x10, 0x38, 0x60, 0x88, 0xb0};
 
+struct davinci_gpio_irq_data {
+	void __iomem			*regs;
+	struct davinci_gpio_controller	*chip;
+	int				bank_num;
+};
+
+struct davinci_gpio_controller {
+	struct gpio_chip	chip;
+	struct irq_domain	*irq_domain;
+	/* Serialize access to GPIO registers */
+	spinlock_t		lock;
+	void __iomem		*regs[MAX_REGS_BANKS];
+	int			gpio_unbanked;
+	int			irqs[MAX_INT_PER_BANK];
+};
+
+static inline u32 __gpio_mask(unsigned gpio)
+{
+	return 1 << (gpio % 32);
+}
+
 static inline struct davinci_gpio_regs __iomem *irq2regs(struct irq_data *d)
 {
 	struct davinci_gpio_regs __iomem *g;
diff --git a/include/linux/platform_data/gpio-davinci.h b/include/linux/platform_data/gpio-davinci.h
index 47695b342883..f92a47e18034 100644
--- a/include/linux/platform_data/gpio-davinci.h
+++ b/include/linux/platform_data/gpio-davinci.h
@@ -16,40 +16,12 @@
 #ifndef __DAVINCI_GPIO_PLATFORM_H
 #define __DAVINCI_GPIO_PLATFORM_H
 
-#include <linux/io.h>
-#include <linux/spinlock.h>
-
-#include <asm-generic/gpio.h>
-
-#define MAX_REGS_BANKS		5
-#define MAX_INT_PER_BANK 32
-
 struct davinci_gpio_platform_data {
 	u32	ngpio;
 	u32	gpio_unbanked;
 };
 
-struct davinci_gpio_irq_data {
-	void __iomem			*regs;
-	struct davinci_gpio_controller	*chip;
-	int				bank_num;
-};
-
-struct davinci_gpio_controller {
-	struct gpio_chip	chip;
-	struct irq_domain	*irq_domain;
-	/* Serialize access to GPIO registers */
-	spinlock_t		lock;
-	void __iomem		*regs[MAX_REGS_BANKS];
-	int			gpio_unbanked;
-	int			irqs[MAX_INT_PER_BANK];
-};
-
 /* Convert GPIO signal to GPIO pin number */
 #define GPIO_TO_PIN(bank, gpio)	(16 * (bank) + (gpio))
 
-static inline u32 __gpio_mask(unsigned gpio)
-{
-	return 1 << (gpio % 32);
-}
 #endif
-- 
2.18.0
