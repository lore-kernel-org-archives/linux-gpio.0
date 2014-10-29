From: <kamlakant.patel@linaro.org>
Subject: [PATCH 2/5] gpio: timberdale: convert to use basic mmio gpio library
Date: Wed, 29 Oct 2014 19:26:42 +0530
Message-ID: <1414591005-30961-3-git-send-email-kamlakant.patel@linaro.org>
References: <1414591005-30961-1-git-send-email-kamlakant.patel@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-gw3-out.broadcom.com ([216.31.210.64]:36456 "EHLO
	mail-gw3-out.broadcom.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932834AbaJ2N50 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 29 Oct 2014 09:57:26 -0400
In-Reply-To: <1414591005-30961-1-git-send-email-kamlakant.patel@linaro.org>
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
 drivers/gpio/gpio-timberdale.c | 90 ++++++++++++------------------------------
 2 files changed, 27 insertions(+), 64 deletions(-)

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
index a685a3c..363ede8 100644
--- a/drivers/gpio/gpio-timberdale.c
+++ b/drivers/gpio/gpio-timberdale.c
@@ -28,7 +28,7 @@
 #include <linux/timb_gpio.h>
 #include <linux/interrupt.h>
 #include <linux/slab.h>
-
+#include <linux/basic_mmio_gpio.h>
 #define DRIVER_NAME "timb-gpio"
 
 #define TGPIOVAL	0x00
@@ -50,52 +50,6 @@ struct timbgpio {
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
 	struct timbgpio *tgpio = container_of(gpio, struct timbgpio, gpio);
@@ -225,7 +179,7 @@ static int timbgpio_probe(struct platform_device *pdev)
 {
 	int err, i;
 	struct device *dev = &pdev->dev;
-	struct gpio_chip *gc;
+	struct bgpio_chip *bgc;
 	struct timbgpio *tgpio;
 	struct resource *iomem;
 	struct timbgpio_platform_data *pdata = dev_get_platdata(&pdev->dev);
@@ -247,6 +201,11 @@ static int timbgpio_probe(struct platform_device *pdev)
 		dev_err(dev, "Memory alloc failed\n");
 		return -EINVAL;
 	}
+
+	bgc = devm_kzalloc(dev, sizeof(*bgc), GFP_KERNEL);
+	if (!bgc)
+		return -EINVAL;
+
 	tgpio->irq_base = pdata->irq_base;
 
 	spin_lock_init(&tgpio->lock);
@@ -263,22 +222,25 @@ static int timbgpio_probe(struct platform_device *pdev)
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
+	err = bgpio_init(bgc, dev, 4, tgpio->membase + TGPIOVAL,
+			 NULL, NULL, tgpio->membase + TGPIODIR, NULL, 0);
+
+	if (err) {
+		dev_err(&pdev->dev, "bgpio_init failed\n");
+		return err;
+	}
+	bgc->gc.label = dev_name(&pdev->dev);
+	bgc->gc.owner = THIS_MODULE;
+	bgc->gc.dev = &pdev->dev;
+	bgc->gc.to_irq = (irq >= 0 && tgpio->irq_base > 0) ?
+						timbgpio_to_irq : NULL;
+	bgc->gc.dbg_show = NULL;
+	bgc->gc.base = pdata->gpio_base;
+	bgc->gc.ngpio = pdata->nr_pins;
+	bgc->gc.can_sleep = false;
+
+	tgpio->gpio = bgc->gc;
+	err = gpiochip_add(&bgc->gc);
 	if (err)
 		return err;
 
-- 
1.9.1

