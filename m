From: Alban Bedel <albeu@free.fr>
Subject: [PATCH 4/5] gpio: ath79: Add support for the interrupt controller
Date: Thu, 28 Jan 2016 20:44:32 +0100
Message-ID: <1454010273-21513-4-git-send-email-albeu@free.fr>
References: <1454010273-21513-1-git-send-email-albeu@free.fr>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from smtp2-g21.free.fr ([212.27.42.2]:63202 "EHLO smtp2-g21.free.fr"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S967078AbcA1TpM (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Thu, 28 Jan 2016 14:45:12 -0500
In-Reply-To: <1454010273-21513-1-git-send-email-albeu@free.fr>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Antony Pavlov <antonynpavlov@gmail.com>, Gabor Juhos <juhosg@openwrt.org>, linux-kernel@vger.kernel.org, Alban Bedel <albeu@free.fr>

Add support for the interrupt controller using GPIOLIB_IRQCHIP.
Both edges isn't supported by the chip and has to be emulated
by switching the polarity on each interrupt.

Signed-off-by: Alban Bedel <albeu@free.fr>
---
 drivers/gpio/Kconfig      |   1 +
 drivers/gpio/gpio-ath79.c | 205 ++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 206 insertions(+)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 04118f3..585a587 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -131,6 +131,7 @@ config GPIO_ATH79
 	default y if ATH79
 	depends on ATH79 || COMPILE_TEST
 	select GPIO_GENERIC
+	select GPIOLIB_IRQCHIP
 	help
 	  Select this option to enable GPIO driver for
 	  Atheros AR71XX/AR724X/AR913X SoC devices.
diff --git a/drivers/gpio/gpio-ath79.c b/drivers/gpio/gpio-ath79.c
index 6b15792..0d94c0b 100644
--- a/drivers/gpio/gpio-ath79.c
+++ b/drivers/gpio/gpio-ath79.c
@@ -15,18 +15,205 @@
 #include <linux/gpio/driver.h>
 #include <linux/platform_data/gpio-ath79.h>
 #include <linux/of_device.h>
+#include <linux/interrupt.h>
+#include <linux/irq.h>
 
 #define AR71XX_GPIO_REG_OE		0x00
 #define AR71XX_GPIO_REG_IN		0x04
 #define AR71XX_GPIO_REG_SET		0x0c
 #define AR71XX_GPIO_REG_CLEAR		0x10
 
+#define AR71XX_GPIO_REG_INT_ENABLE	0x14
+#define AR71XX_GPIO_REG_INT_TYPE	0x18
+#define AR71XX_GPIO_REG_INT_POLARITY	0x1c
+#define AR71XX_GPIO_REG_INT_PENDING	0x20
+#define AR71XX_GPIO_REG_INT_MASK	0x24
+
 struct ath79_gpio_ctrl {
 	struct gpio_chip gc;
 	void __iomem *base;
 	spinlock_t lock;
+	unsigned long both_edges;
 };
 
+static struct ath79_gpio_ctrl *irq_data_to_ath79_gpio(struct irq_data *data)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(data);
+
+	return container_of(gc, struct ath79_gpio_ctrl, gc);
+}
+
+static u32 ath79_gpio_read(struct ath79_gpio_ctrl *ctrl, unsigned reg)
+{
+	return readl(ctrl->base + reg);
+}
+
+static void ath79_gpio_write(struct ath79_gpio_ctrl *ctrl,
+			unsigned reg, u32 val)
+{
+	return writel(val, ctrl->base + reg);
+}
+
+static bool ath79_gpio_update_bits(
+	struct ath79_gpio_ctrl *ctrl, unsigned reg, u32 mask, u32 bits)
+{
+	u32 old_val, new_val;
+
+	old_val = ath79_gpio_read(ctrl, reg);
+	new_val = (old_val & ~mask) | (bits & mask);
+
+	if (new_val != old_val)
+		ath79_gpio_write(ctrl, reg, new_val);
+
+	return new_val != old_val;
+}
+
+static void ath79_gpio_irq_unmask(struct irq_data *data)
+{
+	struct ath79_gpio_ctrl *ctrl = irq_data_to_ath79_gpio(data);
+	u32 mask = BIT(irqd_to_hwirq(data));
+	unsigned long flags;
+
+	spin_lock_irqsave(&ctrl->lock, flags);
+	ath79_gpio_update_bits(ctrl, AR71XX_GPIO_REG_INT_MASK, mask, mask);
+	spin_unlock_irqrestore(&ctrl->lock, flags);
+}
+
+static void ath79_gpio_irq_mask(struct irq_data *data)
+{
+	struct ath79_gpio_ctrl *ctrl = irq_data_to_ath79_gpio(data);
+	u32 mask = BIT(irqd_to_hwirq(data));
+	unsigned long flags;
+
+	spin_lock_irqsave(&ctrl->lock, flags);
+	ath79_gpio_update_bits(ctrl, AR71XX_GPIO_REG_INT_MASK, mask, 0);
+	spin_unlock_irqrestore(&ctrl->lock, flags);
+}
+
+static void ath79_gpio_irq_enable(struct irq_data *data)
+{
+	struct ath79_gpio_ctrl *ctrl = irq_data_to_ath79_gpio(data);
+	u32 mask = BIT(irqd_to_hwirq(data));
+	unsigned long flags;
+
+	spin_lock_irqsave(&ctrl->lock, flags);
+	ath79_gpio_update_bits(ctrl, AR71XX_GPIO_REG_INT_ENABLE, mask, mask);
+	ath79_gpio_update_bits(ctrl, AR71XX_GPIO_REG_INT_MASK, mask, mask);
+	spin_unlock_irqrestore(&ctrl->lock, flags);
+}
+
+static void ath79_gpio_irq_disable(struct irq_data *data)
+{
+	struct ath79_gpio_ctrl *ctrl = irq_data_to_ath79_gpio(data);
+	u32 mask = BIT(irqd_to_hwirq(data));
+	unsigned long flags;
+
+	spin_lock_irqsave(&ctrl->lock, flags);
+	ath79_gpio_update_bits(ctrl, AR71XX_GPIO_REG_INT_MASK, mask, 0);
+	ath79_gpio_update_bits(ctrl, AR71XX_GPIO_REG_INT_ENABLE, mask, 0);
+	spin_unlock_irqrestore(&ctrl->lock, flags);
+}
+
+static int ath79_gpio_irq_set_type(struct irq_data *data,
+				unsigned int flow_type)
+{
+	struct ath79_gpio_ctrl *ctrl = irq_data_to_ath79_gpio(data);
+	u32 mask = BIT(irqd_to_hwirq(data));
+	u32 type = 0, polarity = 0;
+	unsigned long flags;
+	bool disabled;
+
+	switch (flow_type) {
+	case IRQ_TYPE_EDGE_RISING:
+		polarity |= mask;
+	case IRQ_TYPE_EDGE_FALLING:
+	case IRQ_TYPE_EDGE_BOTH:
+		break;
+
+	case IRQ_TYPE_LEVEL_HIGH:
+		polarity |= mask;
+	case IRQ_TYPE_LEVEL_LOW:
+		type |= mask;
+		break;
+
+	default:
+		return -EINVAL;
+	}
+
+	spin_lock_irqsave(&ctrl->lock, flags);
+
+	if (flow_type == IRQ_TYPE_EDGE_BOTH) {
+		ctrl->both_edges |= mask;
+		polarity = ~ath79_gpio_read(ctrl, AR71XX_GPIO_REG_IN);
+	} else {
+		ctrl->both_edges &= ~mask;
+	}
+
+	/* As the IRQ configuration can't be loaded atomically we
+	 * have to disable the interrupt while the configuration state
+	 * is invalid.
+	 */
+	disabled = ath79_gpio_update_bits(
+		ctrl, AR71XX_GPIO_REG_INT_ENABLE, mask, 0);
+
+	ath79_gpio_update_bits(
+		ctrl, AR71XX_GPIO_REG_INT_TYPE, mask, type);
+	ath79_gpio_update_bits(
+		ctrl, AR71XX_GPIO_REG_INT_POLARITY, mask, polarity);
+
+	if (disabled)
+		ath79_gpio_update_bits(
+			ctrl, AR71XX_GPIO_REG_INT_ENABLE, mask, mask);
+
+	spin_unlock_irqrestore(&ctrl->lock, flags);
+
+	return 0;
+}
+
+static struct irq_chip ath79_gpio_irqchip = {
+	.name = "gpio-ath79",
+	.irq_enable = ath79_gpio_irq_enable,
+	.irq_disable = ath79_gpio_irq_disable,
+	.irq_mask = ath79_gpio_irq_mask,
+	.irq_unmask = ath79_gpio_irq_unmask,
+	.irq_set_type = ath79_gpio_irq_set_type,
+};
+
+static void ath79_gpio_irq_handler(struct irq_desc *desc)
+{
+	struct gpio_chip *gc = irq_desc_get_handler_data(desc);
+	struct irq_chip *irqchip = irq_desc_get_chip(desc);
+	struct ath79_gpio_ctrl *ctrl =
+		container_of(gc, struct ath79_gpio_ctrl, gc);
+	unsigned long flags, pending;
+	u32 both_edges, state;
+	int irq;
+
+	chained_irq_enter(irqchip, desc);
+
+	spin_lock_irqsave(&ctrl->lock, flags);
+
+	pending = ath79_gpio_read(ctrl, AR71XX_GPIO_REG_INT_PENDING);
+
+	/* Update the polarity of the both edges irqs */
+	both_edges = ctrl->both_edges & pending;
+	if (both_edges) {
+		state = ath79_gpio_read(ctrl, AR71XX_GPIO_REG_IN);
+		ath79_gpio_update_bits(ctrl, AR71XX_GPIO_REG_INT_POLARITY,
+				both_edges, ~state);
+	}
+
+	spin_unlock_irqrestore(&ctrl->lock, flags);
+
+	if (pending) {
+		for_each_set_bit(irq, &pending, gc->ngpio)
+			generic_handle_irq(
+				irq_linear_revmap(gc->irqdomain, irq));
+	}
+
+	chained_irq_exit(irqchip, desc);
+}
+
 static const struct of_device_id ath79_gpio_of_match[] = {
 	{ .compatible = "qca,ar7100-gpio" },
 	{ .compatible = "qca,ar9340-gpio" },
@@ -95,7 +282,25 @@ static int ath79_gpio_probe(struct platform_device *pdev)
 		return err;
 	}
 
+	if (np && !of_property_read_bool(np, "interrupt-controller"))
+		return 0;
+
+	err = gpiochip_irqchip_add(&ctrl->gc, &ath79_gpio_irqchip, 0,
+				handle_simple_irq, IRQ_TYPE_NONE);
+	if (err) {
+		dev_err(&pdev->dev, "failed to add gpiochip_irqchip\n");
+		goto gpiochip_remove;
+	}
+
+	gpiochip_set_chained_irqchip(&ctrl->gc, &ath79_gpio_irqchip,
+				platform_get_irq(pdev, 0),
+				ath79_gpio_irq_handler);
+
 	return 0;
+
+gpiochip_remove:
+	gpiochip_remove(&ctrl->gc);
+	return err;
 }
 
 static int ath79_gpio_remove(struct platform_device *pdev)
-- 
2.0.0

