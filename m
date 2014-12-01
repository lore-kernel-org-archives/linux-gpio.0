From: <kamlakant.patel@linaro.org>
Subject: [PATCH v1 2/5] gpio: timberdale: convert to use basic mmio gpio library
Date: Mon, 1 Dec 2014 17:39:35 +0530
Message-ID: <1417435778-21879-3-git-send-email-kamlakant.patel@linaro.org>
References: <1417435778-21879-1-git-send-email-kamlakant.patel@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-gw2-out.broadcom.com ([216.31.210.63]:29411 "EHLO
	mail-gw2-out.broadcom.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753051AbaLAMJA (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 1 Dec 2014 07:09:00 -0500
In-Reply-To: <1417435778-21879-1-git-send-email-kamlakant.patel@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: Kamlakant Patel <kamlakant.patel@linaro.org>, linux-gpio@vger.kernel.org, Grant Likely <grant.likely@secretlab.ca>

From: Kamlakant Patel <kamlakant.patel@linaro.org>

This patch converts TIMBERDALE GPIO driver to use basic_mmio_gpio
generic library.

Signed-off-by: Kamlakant Patel <kamlakant.patel@linaro.org>
---
 drivers/gpio/Kconfig           |  1 +
 drivers/gpio/gpio-timberdale.c | 96 ++++++++++++------------------------------
 2 files changed, 28 insertions(+), 69 deletions(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 3bd4d63..875d312 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -783,6 +783,7 @@ config GPIO_SODAVILLE
 config GPIO_TIMBERDALE
 	bool "Support for timberdale GPIO IP"
 	depends on MFD_TIMBERDALE
+	select GPIO_GENERIC
 	---help---
 	Add support for the GPIO IP in the timberdale FPGA.
 
diff --git a/drivers/gpio/gpio-timberdale.c b/drivers/gpio/gpio-timberdale.c
index a685a3c..8849851 100644
--- a/drivers/gpio/gpio-timberdale.c
+++ b/drivers/gpio/gpio-timberdale.c
@@ -28,6 +28,7 @@
 #include <linux/timb_gpio.h>
 #include <linux/interrupt.h>
 #include <linux/slab.h>
+#include <linux/basic_mmio_gpio.h>
 
 #define DRIVER_NAME "timb-gpio"
 
@@ -45,60 +46,15 @@
 struct timbgpio {
 	void __iomem		*membase;
 	spinlock_t		lock; /* mutual exclusion */
-	struct gpio_chip	gpio;
+	struct bgpio_chip	bgc;
 	int			irq_base;
 	unsigned long		last_ier;
 };
 
-static int timbgpio_update_bit(struct gpio_chip *gpio, unsigned index,
-	unsigned offset, bool enabled)
-{
-	struct timbgpio *tgpio = container_of(gpio, struct timbgpio, gpio);
-	u32 reg;
-
-	spin_lock(&tgpio->lock);
-	reg = ioread32(tgpio->membase + offset);
-
-	if (enabled)
-		reg |= (1 << index);
-	else
-		reg &= ~(1 << index);
-
-	iowrite32(reg, tgpio->membase + offset);
-	spin_unlock(&tgpio->lock);
-
-	return 0;
-}
-
-static int timbgpio_gpio_direction_input(struct gpio_chip *gpio, unsigned nr)
-{
-	return timbgpio_update_bit(gpio, nr, TGPIODIR, true);
-}
-
-static int timbgpio_gpio_get(struct gpio_chip *gpio, unsigned nr)
-{
-	struct timbgpio *tgpio = container_of(gpio, struct timbgpio, gpio);
-	u32 value;
-
-	value = ioread32(tgpio->membase + TGPIOVAL);
-	return (value & (1 << nr)) ? 1 : 0;
-}
-
-static int timbgpio_gpio_direction_output(struct gpio_chip *gpio,
-						unsigned nr, int val)
-{
-	return timbgpio_update_bit(gpio, nr, TGPIODIR, false);
-}
-
-static void timbgpio_gpio_set(struct gpio_chip *gpio,
-				unsigned nr, int val)
-{
-	timbgpio_update_bit(gpio, nr, TGPIOVAL, val != 0);
-}
-
 static int timbgpio_to_irq(struct gpio_chip *gpio, unsigned offset)
 {
-	struct timbgpio *tgpio = container_of(gpio, struct timbgpio, gpio);
+	struct bgpio_chip *bgc = container_of(gpio, struct bgpio_chip, gc);
+	struct timbgpio *tgpio = container_of(bgc, struct timbgpio, bgc);
 
 	if (tgpio->irq_base <= 0)
 		return -EINVAL;
@@ -142,7 +98,7 @@ static int timbgpio_irq_type(struct irq_data *d, unsigned trigger)
 	u32 ver;
 	int ret = 0;
 
-	if (offset < 0 || offset > tgpio->gpio.ngpio)
+	if (offset < 0 || offset > tgpio->bgc.gc.ngpio)
 		return -EINVAL;
 
 	ver = ioread32(tgpio->membase + TGPIO_VER);
@@ -208,8 +164,8 @@ static void timbgpio_irq(unsigned int irq, struct irq_desc *desc)
 	 */
 	iowrite32(0, tgpio->membase + TGPIO_IER);
 
-	for_each_set_bit(offset, &ipr, tgpio->gpio.ngpio)
-		generic_handle_irq(timbgpio_to_irq(&tgpio->gpio, offset));
+	for_each_set_bit(offset, &ipr, tgpio->bgc.gc.ngpio)
+		generic_handle_irq(timbgpio_to_irq(&tgpio->bgc.gc, offset));
 
 	iowrite32(tgpio->last_ier, tgpio->membase + TGPIO_IER);
 }
@@ -225,7 +181,6 @@ static int timbgpio_probe(struct platform_device *pdev)
 {
 	int err, i;
 	struct device *dev = &pdev->dev;
-	struct gpio_chip *gc;
 	struct timbgpio *tgpio;
 	struct resource *iomem;
 	struct timbgpio_platform_data *pdata = dev_get_platdata(&pdev->dev);
@@ -247,6 +202,7 @@ static int timbgpio_probe(struct platform_device *pdev)
 		dev_err(dev, "Memory alloc failed\n");
 		return -EINVAL;
 	}
+
 	tgpio->irq_base = pdata->irq_base;
 
 	spin_lock_init(&tgpio->lock);
@@ -263,22 +219,24 @@ static int timbgpio_probe(struct platform_device *pdev)
 		return -ENOMEM;
 	}
 
-	gc = &tgpio->gpio;
-
-	gc->label = dev_name(&pdev->dev);
-	gc->owner = THIS_MODULE;
-	gc->dev = &pdev->dev;
-	gc->direction_input = timbgpio_gpio_direction_input;
-	gc->get = timbgpio_gpio_get;
-	gc->direction_output = timbgpio_gpio_direction_output;
-	gc->set = timbgpio_gpio_set;
-	gc->to_irq = (irq >= 0 && tgpio->irq_base > 0) ? timbgpio_to_irq : NULL;
-	gc->dbg_show = NULL;
-	gc->base = pdata->gpio_base;
-	gc->ngpio = pdata->nr_pins;
-	gc->can_sleep = false;
-
-	err = gpiochip_add(gc);
+	err = bgpio_init(&tgpio->bgc, dev, 4, tgpio->membase + TGPIOVAL,
+			 NULL, NULL, NULL, tgpio->membase + TGPIODIR, 0);
+
+	if (err) {
+		dev_err(&pdev->dev, "bgpio_init failed\n");
+		return err;
+	}
+	tgpio->bgc.gc.label = dev_name(&pdev->dev);
+	tgpio->bgc.gc.owner = THIS_MODULE;
+	tgpio->bgc.gc.dev = &pdev->dev;
+	tgpio->bgc.gc.to_irq = (irq >= 0 && tgpio->irq_base > 0) ?
+						timbgpio_to_irq : NULL;
+	tgpio->bgc.gc.dbg_show = NULL;
+	tgpio->bgc.gc.base = pdata->gpio_base;
+	tgpio->bgc.gc.ngpio = pdata->nr_pins;
+	tgpio->bgc.gc.can_sleep = false;
+
+	err = gpiochip_add(&tgpio->bgc.gc);
 	if (err)
 		return err;
 
@@ -322,7 +280,7 @@ static int timbgpio_remove(struct platform_device *pdev)
 		irq_set_handler_data(irq, NULL);
 	}
 
-	gpiochip_remove(&tgpio->gpio);
+	gpiochip_remove(&tgpio->bgc.gc);
 
 	return 0;
 }
-- 
1.9.1

