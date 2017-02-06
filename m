From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v3 1/2] gpio: mockup: add a dummy irqchip
Date: Mon,  6 Feb 2017 15:11:07 +0100
Message-ID: <1486390268-31362-2-git-send-email-bgolaszewski@baylibre.com>
References: <1486390268-31362-1-git-send-email-bgolaszewski@baylibre.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wm0-f52.google.com ([74.125.82.52]:38202 "EHLO
        mail-wm0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752321AbdBFOLV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 6 Feb 2017 09:11:21 -0500
Received: by mail-wm0-f52.google.com with SMTP id r141so115619552wmg.1
        for <linux-gpio@vger.kernel.org>; Mon, 06 Feb 2017 06:11:20 -0800 (PST)
In-Reply-To: <1486390268-31362-1-git-send-email-bgolaszewski@baylibre.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>, Lars-Peter Clausen <lars@metafoo.de>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>

Setup a dummy irqchip that will allow us to inject line events for
testing purposes.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/gpio/Kconfig       |  2 ++
 drivers/gpio/gpio-mockup.c | 79 ++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 81 insertions(+)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index d4cec61..0504307 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -298,6 +298,8 @@ config GPIO_MOCKUP
 	tristate "GPIO Testing Driver"
 	depends on GPIOLIB && SYSFS
 	select GPIO_SYSFS
+	select GPIOLIB_IRQCHIP
+	select IRQ_WORK
 	help
 	  This enables GPIO Testing driver, which provides a way to test GPIO
 	  subsystem through sysfs(or char device) and debugfs. GPIO_SYSFS
diff --git a/drivers/gpio/gpio-mockup.c b/drivers/gpio/gpio-mockup.c
index 0ce9acc3..03beadb 100644
--- a/drivers/gpio/gpio-mockup.c
+++ b/drivers/gpio/gpio-mockup.c
@@ -16,6 +16,9 @@
 #include <linux/gpio/driver.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
+#include <linux/interrupt.h>
+#include <linux/irq.h>
+#include <linux/irq_work.h>
 
 #define GPIO_MOCKUP_NAME	"gpio-mockup"
 #define	GPIO_MOCKUP_MAX_GC	10
@@ -35,9 +38,15 @@ struct gpio_mockup_line_status {
 	bool value;
 };
 
+struct gpio_mockup_irq_context {
+	struct irq_work work;
+	int irq;
+};
+
 struct gpio_mockup_chip {
 	struct gpio_chip gc;
 	struct gpio_mockup_line_status *lines;
+	struct gpio_mockup_irq_context irq_ctx;
 };
 
 static int gpio_mockup_ranges[GPIO_MOCKUP_MAX_GC << 1];
@@ -115,6 +124,57 @@ static int gpio_mockup_name_lines(struct device *dev,
 	return 0;
 }
 
+static int gpio_mockup_to_irq(struct gpio_chip *chip, unsigned int offset)
+{
+	return chip->irq_base + offset;
+}
+
+/*
+ * While we should generally support irqmask and irqunmask, this driver is
+ * for testing purposes only so we don't care.
+ */
+static void gpio_mockup_irqmask(struct irq_data *d) { }
+static void gpio_mockup_irqunmask(struct irq_data *d) { }
+
+static struct irq_chip gpio_mockup_irqchip = {
+	.name		= GPIO_MOCKUP_NAME,
+	.irq_mask	= gpio_mockup_irqmask,
+	.irq_unmask	= gpio_mockup_irqunmask,
+};
+
+static void gpio_mockup_handle_irq(struct irq_work *work)
+{
+	struct gpio_mockup_irq_context *irq_ctx;
+
+	irq_ctx = container_of(work, struct gpio_mockup_irq_context, work);
+	handle_simple_irq(irq_to_desc(irq_ctx->irq));
+}
+
+static int gpio_mockup_irqchip_setup(struct device *dev,
+				     struct gpio_mockup_chip *chip)
+{
+	struct gpio_chip *gc = &chip->gc;
+	int irq_base, i;
+
+	irq_base = irq_alloc_descs(-1, 0, gc->ngpio, 0);
+	if (irq_base < 0)
+		return irq_base;
+
+	gc->irq_base = irq_base;
+	gc->irqchip = &gpio_mockup_irqchip;
+
+	for (i = 0; i < gc->ngpio; i++) {
+		irq_set_chip(irq_base + i, gc->irqchip);
+		irq_set_handler(irq_base + i, &handle_simple_irq);
+		irq_modify_status(irq_base + i,
+				  IRQ_NOREQUEST | IRQ_NOAUTOEN, IRQ_NOPROBE);
+	}
+
+	init_irq_work(&chip->irq_ctx.work, gpio_mockup_handle_irq);
+
+	return 0;
+}
+
 static int gpio_mockup_add(struct device *dev,
 			   struct gpio_mockup_chip *chip,
 			   const char *name, int base, int ngpio)
@@ -132,6 +192,7 @@ static int gpio_mockup_add(struct device *dev,
 	gc->direction_output = gpio_mockup_dirout;
 	gc->direction_input = gpio_mockup_dirin;
 	gc->get_direction = gpio_mockup_get_direction;
+	gc->to_irq = gpio_mockup_to_irq;
 
 	chip->lines = devm_kzalloc(dev, sizeof(*chip->lines) * gc->ngpio,
 				   GFP_KERNEL);
@@ -144,6 +205,10 @@ static int gpio_mockup_add(struct device *dev,
 			return ret;
 	}
 
+	ret = gpio_mockup_irqchip_setup(dev, chip);
+	if (ret)
+		return ret;
+
 	return devm_gpiochip_add_data(dev, &chip->gc, chip);
 }
 
@@ -200,11 +265,25 @@ static int gpio_mockup_probe(struct platform_device *pdev)
 	return 0;
 }
 
+static int gpio_mockup_remove(struct platform_device *pdev)
+{
+	struct gpio_mockup_chip *chips;
+	int i;
+
+	chips = platform_get_drvdata(pdev);
+
+	for (i = 0; i < gpio_mockup_params_nr >> 1; i++)
+		irq_free_descs(chips[i].gc.irq_base, chips[i].gc.ngpio);
+
+	return 0;
+}
+
 static struct platform_driver gpio_mockup_driver = {
 	.driver = {
 		.name = GPIO_MOCKUP_NAME,
 	},
 	.probe = gpio_mockup_probe,
+	.remove = gpio_mockup_remove,
 };
 
 static struct platform_device *pdev;
-- 
2.9.3

