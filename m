From: Alban Bedel <albeu@free.fr>
Subject: [PATCH 1/5] gpio: ath79: Move to the generic GPIO driver
Date: Thu, 28 Jan 2016 20:44:29 +0100
Message-ID: <1454010273-21513-1-git-send-email-albeu@free.fr>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from smtp2-g21.free.fr ([212.27.42.2]:61051 "EHLO smtp2-g21.free.fr"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755244AbcA1Toq (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Thu, 28 Jan 2016 14:44:46 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Antony Pavlov <antonynpavlov@gmail.com>, Gabor Juhos <juhosg@openwrt.org>, linux-kernel@vger.kernel.org, Alban Bedel <albeu@free.fr>

Drop most of the code in favor of the generic MMIO GPIO driver.
As the driver now depend on CONFIG_GPIO_GENERIC also add a Kconfig
entry to make the driver optional.

We leave the base pointer and lock in the data struct because they are
needed for the IRQ support.

Signed-off-by: Alban Bedel <albeu@free.fr>
---
 drivers/gpio/Kconfig      |   9 ++++
 drivers/gpio/Makefile     |   2 +-
 drivers/gpio/gpio-ath79.c | 126 ++++++----------------------------------------
 3 files changed, 24 insertions(+), 113 deletions(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 00f1767..ee9909c 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -126,6 +126,15 @@ config GPIO_AMDPT
 	  driver for GPIO functionality on Promontory IOHub
 	  Require ACPI ASL code to enumerate as a platform device.
 
+config GPIO_ATH79
+	tristate "Atheros AR71XX/AR724X/AR913X GPIO support"
+	default y if ATH79
+	depends on ATH79
+	select GPIO_GENERIC
+	help
+	  Select this option to enable GPIO driver for
+	  Atheros AR71XX/AR724X/AR913X SoC devices.
+
 config GPIO_BCM_KONA
 	bool "Broadcom Kona GPIO"
 	depends on OF_GPIO && (ARCH_BCM_MOBILE || COMPILE_TEST)
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index d4cc4f3..643b24e 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -24,7 +24,7 @@ obj-$(CONFIG_GPIO_ALTERA)  	+= gpio-altera.o
 obj-$(CONFIG_GPIO_AMD8111)	+= gpio-amd8111.o
 obj-$(CONFIG_GPIO_AMDPT)	+= gpio-amdpt.o
 obj-$(CONFIG_GPIO_ARIZONA)	+= gpio-arizona.o
-obj-$(CONFIG_ATH79)		+= gpio-ath79.o
+obj-$(CONFIG_GPIO_ATH79)	+= gpio-ath79.o
 obj-$(CONFIG_GPIO_BCM_KONA)	+= gpio-bcm-kona.o
 obj-$(CONFIG_GPIO_BRCMSTB)	+= gpio-brcmstb.o
 obj-$(CONFIG_GPIO_BT8XX)	+= gpio-bt8xx.o
diff --git a/drivers/gpio/gpio-ath79.c b/drivers/gpio/gpio-ath79.c
index d13dd13..13d9648 100644
--- a/drivers/gpio/gpio-ath79.c
+++ b/drivers/gpio/gpio-ath79.c
@@ -19,115 +19,11 @@
 #include <asm/mach-ath79/ar71xx_regs.h>
 
 struct ath79_gpio_ctrl {
-	struct gpio_chip chip;
+	struct gpio_chip gc;
 	void __iomem *base;
 	spinlock_t lock;
 };
 
-static void ath79_gpio_set_value(struct gpio_chip *chip,
-				unsigned gpio, int value)
-{
-	struct ath79_gpio_ctrl *ctrl = gpiochip_get_data(chip);
-
-	if (value)
-		__raw_writel(BIT(gpio), ctrl->base + AR71XX_GPIO_REG_SET);
-	else
-		__raw_writel(BIT(gpio), ctrl->base + AR71XX_GPIO_REG_CLEAR);
-}
-
-static int ath79_gpio_get_value(struct gpio_chip *chip, unsigned gpio)
-{
-	struct ath79_gpio_ctrl *ctrl = gpiochip_get_data(chip);
-
-	return (__raw_readl(ctrl->base + AR71XX_GPIO_REG_IN) >> gpio) & 1;
-}
-
-static int ath79_gpio_direction_input(struct gpio_chip *chip,
-				       unsigned offset)
-{
-	struct ath79_gpio_ctrl *ctrl = gpiochip_get_data(chip);
-	unsigned long flags;
-
-	spin_lock_irqsave(&ctrl->lock, flags);
-
-	__raw_writel(
-		__raw_readl(ctrl->base + AR71XX_GPIO_REG_OE) & ~BIT(offset),
-		ctrl->base + AR71XX_GPIO_REG_OE);
-
-	spin_unlock_irqrestore(&ctrl->lock, flags);
-
-	return 0;
-}
-
-static int ath79_gpio_direction_output(struct gpio_chip *chip,
-					unsigned offset, int value)
-{
-	struct ath79_gpio_ctrl *ctrl = gpiochip_get_data(chip);
-	unsigned long flags;
-
-	spin_lock_irqsave(&ctrl->lock, flags);
-
-	if (value)
-		__raw_writel(BIT(offset), ctrl->base + AR71XX_GPIO_REG_SET);
-	else
-		__raw_writel(BIT(offset), ctrl->base + AR71XX_GPIO_REG_CLEAR);
-
-	__raw_writel(
-		__raw_readl(ctrl->base + AR71XX_GPIO_REG_OE) | BIT(offset),
-		ctrl->base + AR71XX_GPIO_REG_OE);
-
-	spin_unlock_irqrestore(&ctrl->lock, flags);
-
-	return 0;
-}
-
-static int ar934x_gpio_direction_input(struct gpio_chip *chip, unsigned offset)
-{
-	struct ath79_gpio_ctrl *ctrl = gpiochip_get_data(chip);
-	unsigned long flags;
-
-	spin_lock_irqsave(&ctrl->lock, flags);
-
-	__raw_writel(
-		__raw_readl(ctrl->base + AR71XX_GPIO_REG_OE) | BIT(offset),
-		ctrl->base + AR71XX_GPIO_REG_OE);
-
-	spin_unlock_irqrestore(&ctrl->lock, flags);
-
-	return 0;
-}
-
-static int ar934x_gpio_direction_output(struct gpio_chip *chip, unsigned offset,
-					int value)
-{
-	struct ath79_gpio_ctrl *ctrl = gpiochip_get_data(chip);
-	unsigned long flags;
-
-	spin_lock_irqsave(&ctrl->lock, flags);
-
-	if (value)
-		__raw_writel(BIT(offset), ctrl->base + AR71XX_GPIO_REG_SET);
-	else
-		__raw_writel(BIT(offset), ctrl->base + AR71XX_GPIO_REG_CLEAR);
-
-	__raw_writel(
-		__raw_readl(ctrl->base + AR71XX_GPIO_REG_OE) & ~BIT(offset),
-		ctrl->base + AR71XX_GPIO_REG_OE);
-
-	spin_unlock_irqrestore(&ctrl->lock, flags);
-
-	return 0;
-}
-
-static const struct gpio_chip ath79_gpio_chip = {
-	.label			= "ath79",
-	.get			= ath79_gpio_get_value,
-	.set			= ath79_gpio_set_value,
-	.direction_input	= ath79_gpio_direction_input,
-	.direction_output	= ath79_gpio_direction_output,
-	.base			= 0,
-};
-
 static const struct of_device_id ath79_gpio_of_match[] = {
 	{ .compatible = "qca,ar7100-gpio" },
 	{ .compatible = "qca,ar9340-gpio" },
@@ -174,15 +70,21 @@ static int ath79_gpio_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	spin_lock_init(&ctrl->lock);
-	memcpy(&ctrl->chip, &ath79_gpio_chip, sizeof(ctrl->chip));
-	ctrl->chip.parent = &pdev->dev;
-	ctrl->chip.ngpio = ath79_gpio_count;
-	if (oe_inverted) {
-		ctrl->chip.direction_input = ar934x_gpio_direction_input;
-		ctrl->chip.direction_output = ar934x_gpio_direction_output;
+	err = bgpio_init(&ctrl->gc, &pdev->dev, 4,
+			ctrl->base + AR71XX_GPIO_REG_IN,
+			ctrl->base + AR71XX_GPIO_REG_SET,
+			ctrl->base + AR71XX_GPIO_REG_CLEAR,
+			oe_inverted ? NULL : ctrl->base + AR71XX_GPIO_REG_OE,
+			oe_inverted ? ctrl->base + AR71XX_GPIO_REG_OE : NULL,
+			0);
+	if (err) {
+		dev_err(&pdev->dev, "bgpio_init failed\n");
+		return err;
 	}
+	/* Use base 0 to stay compatible with legacy platforms */
+	ctrl->gc.base = 0;
 
-	err = gpiochip_add_data(&ctrl->chip, ctrl);
+	err = gpiochip_add_data(&ctrl->gc, ctrl);
 	if (err) {
 		dev_err(&pdev->dev,
 			"cannot add AR71xx GPIO chip, error=%d", err);
-- 
2.0.0

