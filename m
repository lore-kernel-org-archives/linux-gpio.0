From: Hoan Tran <hotran@apm.com>
Subject: [PATCH v3] gpio: dwapb: Add support for next generation of X-Gene SoC
Date: Tue, 21 Feb 2017 11:32:43 -0800
Message-ID: <1487705563-8054-1-git-send-email-hotran@apm.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pg0-f47.google.com ([74.125.83.47]:35249 "EHLO
        mail-pg0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753088AbdBUTdP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 21 Feb 2017 14:33:15 -0500
Received: by mail-pg0-f47.google.com with SMTP id b129so40091843pgc.2
        for <linux-gpio@vger.kernel.org>; Tue, 21 Feb 2017 11:33:15 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Jamie Iles <jamie@jamieiles.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, lho@apm.com, Hoan Tran <hotran@apm.com>

Next generation of X-Gene SoC's GPIO hardware register map is very
similar to DW GPIO. It only differs by a few register addresses.
This patch modifies DW GPIO driver to accommodate the difference
in a few register addresses.

Signed-off-by: Hoan Tran <hotran@apm.com>
---
v3:
* Add gpio_reg_v2_convert() function
* Revise the register version parsing based on Andy's comment

v2:
* Remove ifdef CONFIG_ACPI
---
 drivers/gpio/gpio-dwapb.c | 91 ++++++++++++++++++++++++++++++++++++++---------
 1 file changed, 74 insertions(+), 17 deletions(-)

diff --git a/drivers/gpio/gpio-dwapb.c b/drivers/gpio/gpio-dwapb.c
index 6193f62..b80ccdb 100644
--- a/drivers/gpio/gpio-dwapb.c
+++ b/drivers/gpio/gpio-dwapb.c
@@ -21,6 +21,7 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
+#include <linux/of_device.h>
 #include <linux/of_irq.h>
 #include <linux/platform_device.h>
 #include <linux/property.h>
@@ -55,6 +56,14 @@
 #define GPIO_SWPORT_DR_SIZE	(GPIO_SWPORTB_DR - GPIO_SWPORTA_DR)
 #define GPIO_SWPORT_DDR_SIZE	(GPIO_SWPORTB_DDR - GPIO_SWPORTA_DDR)
 
+#define GPIO_REG_OFFSET_V2	1
+
+#define GPIO_INTMASK_V2		0x44
+#define GPIO_INTTYPE_LEVEL_V2	0x34
+#define GPIO_INT_POLARITY_V2	0x38
+#define GPIO_INTSTATUS_V2	0x3c
+#define GPIO_PORTA_EOI_V2	0x40
+
 struct dwapb_gpio;
 
 #ifdef CONFIG_PM_SLEEP
@@ -87,14 +96,41 @@ struct dwapb_gpio {
 	struct dwapb_gpio_port	*ports;
 	unsigned int		nr_ports;
 	struct irq_domain	*domain;
+	unsigned int		flags;
 };
 
+static inline u32 gpio_reg_v2_convert(unsigned int offset)
+{
+	switch (offset) {
+	case GPIO_INTMASK:
+		return GPIO_INTMASK_V2;
+	case GPIO_INTTYPE_LEVEL:
+		return GPIO_INTTYPE_LEVEL_V2;
+	case GPIO_INT_POLARITY:
+		return GPIO_INT_POLARITY_V2;
+	case GPIO_INTSTATUS:
+		return GPIO_INTSTATUS_V2;
+	case GPIO_PORTA_EOI:
+		return GPIO_PORTA_EOI_V2;
+	}
+
+	return offset;
+}
+
+static inline u32 gpio_reg_convert(struct dwapb_gpio *gpio, unsigned int offset)
+{
+	if (gpio->flags & GPIO_REG_OFFSET_V2)
+		return gpio_reg_v2_convert(offset);
+
+	return offset;
+}
+
 static inline u32 dwapb_read(struct dwapb_gpio *gpio, unsigned int offset)
 {
 	struct gpio_chip *gc	= &gpio->ports[0].gc;
 	void __iomem *reg_base	= gpio->regs;
 
-	return gc->read_reg(reg_base + offset);
+	return gc->read_reg(reg_base + gpio_reg_convert(gpio, offset));
 }
 
 static inline void dwapb_write(struct dwapb_gpio *gpio, unsigned int offset,
@@ -103,7 +139,7 @@ static inline void dwapb_write(struct dwapb_gpio *gpio, unsigned int offset,
 	struct gpio_chip *gc	= &gpio->ports[0].gc;
 	void __iomem *reg_base	= gpio->regs;
 
-	gc->write_reg(reg_base + offset, val);
+	gc->write_reg(reg_base + gpio_reg_convert(gpio, offset), val);
 }
 
 static int dwapb_gpio_to_irq(struct gpio_chip *gc, unsigned offset)
@@ -336,8 +372,8 @@ static void dwapb_configure_irqs(struct dwapb_gpio *gpio,
 		ct->chip.irq_disable = dwapb_irq_disable;
 		ct->chip.irq_request_resources = dwapb_irq_reqres;
 		ct->chip.irq_release_resources = dwapb_irq_relres;
-		ct->regs.ack = GPIO_PORTA_EOI;
-		ct->regs.mask = GPIO_INTMASK;
+		ct->regs.ack = gpio_reg_convert(gpio, GPIO_PORTA_EOI);
+		ct->regs.mask = gpio_reg_convert(gpio, GPIO_INTMASK);
 		ct->type = IRQ_TYPE_LEVEL_MASK;
 	}
 
@@ -520,6 +556,21 @@ static void dwapb_gpio_unregister(struct dwapb_gpio *gpio)
 	return pdata;
 }
 
+static const struct of_device_id dwapb_of_match[] = {
+	{ .compatible = "snps,dw-apb-gpio", .data = (void *)0},
+	{ .compatible = "apm,xgene-gpio-v2", .data = (void *)GPIO_REG_OFFSET_V2},
+	{ /* Sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, dwapb_of_match);
+
+static const struct acpi_device_id dwapb_acpi_match[] = {
+	{"HISI0181", 0},
+	{"APMC0D07", 0},
+	{"APMC0D81", GPIO_REG_OFFSET_V2},
+	{ }
+};
+MODULE_DEVICE_TABLE(acpi, dwapb_acpi_match);
+
 static int dwapb_gpio_probe(struct platform_device *pdev)
 {
 	unsigned int i;
@@ -555,6 +606,25 @@ static int dwapb_gpio_probe(struct platform_device *pdev)
 	if (IS_ERR(gpio->regs))
 		return PTR_ERR(gpio->regs);
 
+	gpio->flags = 0;
+	if (dev->of_node) {
+		const struct of_device_id *of_devid;
+
+		of_devid = of_match_device(dwapb_of_match, dev);
+		if (of_devid) {
+			if (of_devid->data)
+				gpio->flags = (uintptr_t)of_devid->data;
+		}
+	} else if (has_acpi_companion(dev)) {
+		const struct acpi_device_id *acpi_id;
+
+		acpi_id = acpi_match_device(dwapb_acpi_match, dev);
+		if (acpi_id) {
+			if (acpi_id->driver_data)
+				gpio->flags = acpi_id->driver_data;
+		}
+	}
+
 	for (i = 0; i < gpio->nr_ports; i++) {
 		err = dwapb_gpio_add_port(gpio, &pdata->properties[i], i);
 		if (err)
@@ -581,19 +651,6 @@ static int dwapb_gpio_remove(struct platform_device *pdev)
 	return 0;
 }
 
-static const struct of_device_id dwapb_of_match[] = {
-	{ .compatible = "snps,dw-apb-gpio" },
-	{ /* Sentinel */ }
-};
-MODULE_DEVICE_TABLE(of, dwapb_of_match);
-
-static const struct acpi_device_id dwapb_acpi_match[] = {
-	{"HISI0181", 0},
-	{"APMC0D07", 0},
-	{ }
-};
-MODULE_DEVICE_TABLE(acpi, dwapb_acpi_match);
-
 #ifdef CONFIG_PM_SLEEP
 static int dwapb_gpio_suspend(struct device *dev)
 {
-- 
1.9.1

