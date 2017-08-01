From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH v2 3/3] gpio: mockup: use irq_sim
Date: Tue,  1 Aug 2017 16:50:28 +0200
Message-ID: <20170801145028.7558-4-brgl@bgdev.pl>
References: <20170801145028.7558-1-brgl@bgdev.pl>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170801145028.7558-1-brgl@bgdev.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <marc.zyngier@arm.com>, Jonathan Corbet <corbet@lwn.net>, Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>, Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>
List-Id: linux-gpio@vger.kernel.org

Shrink the driver by removing the code dealing with dummy interrupts
and replacing it with calls to the irq_sim API.

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 drivers/gpio/Kconfig       |  2 +-
 drivers/gpio/gpio-mockup.c | 77 +++++-----------------------------------------
 2 files changed, 8 insertions(+), 71 deletions(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index f235eae04c16..e2264fb31f87 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -311,7 +311,7 @@ config GPIO_MOCKUP
 	depends on GPIOLIB && SYSFS
 	select GPIO_SYSFS
 	select GPIOLIB_IRQCHIP
-	select IRQ_WORK
+	select IRQ_SIM
 	help
 	  This enables GPIO Testing driver, which provides a way to test GPIO
 	  subsystem through sysfs(or char device) and debugfs. GPIO_SYSFS
diff --git a/drivers/gpio/gpio-mockup.c b/drivers/gpio/gpio-mockup.c
index a6565e128f9e..6db7163e6d98 100644
--- a/drivers/gpio/gpio-mockup.c
+++ b/drivers/gpio/gpio-mockup.c
@@ -20,7 +20,7 @@
 #include <linux/slab.h>
 #include <linux/interrupt.h>
 #include <linux/irq.h>
-#include <linux/irq_work.h>
+#include <linux/irq_sim.h>
 #include <linux/debugfs.h>
 #include <linux/uaccess.h>
 
@@ -47,18 +47,12 @@ enum {
 struct gpio_mockup_line_status {
 	int dir;
 	bool value;
-	bool irq_enabled;
-};
-
-struct gpio_mockup_irq_context {
-	struct irq_work work;
-	int irq;
 };
 
 struct gpio_mockup_chip {
 	struct gpio_chip gc;
 	struct gpio_mockup_line_status *lines;
-	struct gpio_mockup_irq_context irq_ctx;
+	struct irq_sim irqsim;
 	struct dentry *dbg_dir;
 };
 
@@ -144,65 +138,11 @@ static int gpio_mockup_name_lines(struct device *dev,
 	return 0;
 }
 
-static int gpio_mockup_to_irq(struct gpio_chip *chip, unsigned int offset)
-{
-	return chip->irq_base + offset;
-}
-
-static void gpio_mockup_irqmask(struct irq_data *data)
+static int gpio_mockup_to_irq(struct gpio_chip *gc, unsigned int offset)
 {
-	struct gpio_chip *gc = irq_data_get_irq_chip_data(data);
 	struct gpio_mockup_chip *chip = gpiochip_get_data(gc);
 
-	chip->lines[data->irq - gc->irq_base].irq_enabled = false;
-}
-
-static void gpio_mockup_irqunmask(struct irq_data *data)
-{
-	struct gpio_chip *gc = irq_data_get_irq_chip_data(data);
-	struct gpio_mockup_chip *chip = gpiochip_get_data(gc);
-
-	chip->lines[data->irq - gc->irq_base].irq_enabled = true;
-}
-
-static struct irq_chip gpio_mockup_irqchip = {
-	.name		= GPIO_MOCKUP_NAME,
-	.irq_mask	= gpio_mockup_irqmask,
-	.irq_unmask	= gpio_mockup_irqunmask,
-};
-
-static void gpio_mockup_handle_irq(struct irq_work *work)
-{
-	struct gpio_mockup_irq_context *irq_ctx;
-
-	irq_ctx = container_of(work, struct gpio_mockup_irq_context, work);
-	handle_simple_irq(irq_to_desc(irq_ctx->irq));
-}
-
-static int gpio_mockup_irqchip_setup(struct device *dev,
-				     struct gpio_mockup_chip *chip)
-{
-	struct gpio_chip *gc = &chip->gc;
-	int irq_base, i;
-
-	irq_base = devm_irq_alloc_descs(dev, -1, 0, gc->ngpio, 0);
-	if (irq_base < 0)
-		return irq_base;
-
-	gc->irq_base = irq_base;
-	gc->irqchip = &gpio_mockup_irqchip;
-
-	for (i = 0; i < gc->ngpio; i++) {
-		irq_set_chip(irq_base + i, gc->irqchip);
-		irq_set_chip_data(irq_base + i, gc);
-		irq_set_handler(irq_base + i, &handle_simple_irq);
-		irq_modify_status(irq_base + i,
-				  IRQ_NOREQUEST | IRQ_NOAUTOEN, IRQ_NOPROBE);
-	}
-
-	init_irq_work(&chip->irq_ctx.work, gpio_mockup_handle_irq);
-
-	return 0;
+	return irq_sim_irqnum(&chip->irqsim, offset);
 }
 
 static ssize_t gpio_mockup_event_write(struct file *file,
@@ -228,11 +168,8 @@ static ssize_t gpio_mockup_event_write(struct file *file,
 	chip = priv->chip;
 	gc = &chip->gc;
 
-	if (chip->lines[priv->offset].irq_enabled) {
-		gpiod_set_value_cansleep(desc, val);
-		priv->chip->irq_ctx.irq = gc->irq_base + priv->offset;
-		irq_work_queue(&priv->chip->irq_ctx.work);
-	}
+	gpiod_set_value_cansleep(desc, val);
+	irq_sim_fire(&chip->irqsim, priv->offset);
 
 	return size;
 }
@@ -319,7 +256,7 @@ static int gpio_mockup_add(struct device *dev,
 			return ret;
 	}
 
-	ret = gpio_mockup_irqchip_setup(dev, chip);
+	ret = devm_irq_sim_init(dev, &chip->irqsim, gc->ngpio);
 	if (ret)
 		return ret;
 
-- 
2.13.2
