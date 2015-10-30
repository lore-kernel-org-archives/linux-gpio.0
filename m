From: Alban Bedel <albeu@free.fr>
Subject: [PATCH 2/3] gpio: ath79: Move to the generic GPIO driver
Date: Fri, 30 Oct 2015 11:36:30 +0100
Message-ID: <1446201391-22553-2-git-send-email-albeu@free.fr>
References: <1446201391-22553-1-git-send-email-albeu@free.fr>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1446201391-22553-1-git-send-email-albeu@free.fr>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Alban Bedel <albeu@free.fr>
List-Id: linux-gpio@vger.kernel.org

Turn the ath79 driver into a true driver supporting multiple
instances while dropping most of the code in favor of the generic
MMIO GPIO driver.

As the driver now depend on CONFIG_GPIO_GENERIC also add a Kconfig
entry to make the driver optional.

Signed-off-by: Alban Bedel <albeu@free.fr>
---
 drivers/gpio/Kconfig      |   9 +++
 drivers/gpio/Makefile     |   2 +-
 drivers/gpio/gpio-ath79.c | 152 +++++++++-------------------------------------
 3 files changed, 38 insertions(+), 125 deletions(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 8949b3f..a979f1a 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -119,6 +119,15 @@ config GPIO_ALTERA
 
 	  If driver is built as a module it will be called gpio-altera.
 
+config GPIO_ATH79
+	tristate "Atheros AR71XX/AR724X/AR913X GPIO support"
+	default y if ATH79
+	depends on ATH79 || COMPILE_TEST
+	select GPIO_GENERIC
+	help
+	  Select this option to enable GPIO driver for
+	  Atheros AR71XX/AR724X/AR913X SoC devices.
+
 config GPIO_BCM_KONA
 	bool "Broadcom Kona GPIO"
 	depends on OF_GPIO && (ARCH_BCM_MOBILE || COMPILE_TEST)
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index f79a7c4..24c7371 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -20,7 +20,7 @@ obj-$(CONFIG_GPIO_ADP5588)	+= gpio-adp5588.o
 obj-$(CONFIG_GPIO_ALTERA)  	+= gpio-altera.o
 obj-$(CONFIG_GPIO_AMD8111)	+= gpio-amd8111.o
 obj-$(CONFIG_GPIO_ARIZONA)	+= gpio-arizona.o
-obj-$(CONFIG_ATH79)		+= gpio-ath79.o
+obj-$(CONFIG_GPIO_ATH79)	+= gpio-ath79.o
 obj-$(CONFIG_GPIO_BCM_KONA)	+= gpio-bcm-kona.o
 obj-$(CONFIG_GPIO_BRCMSTB)	+= gpio-brcmstb.o
 obj-$(CONFIG_GPIO_BT8XX)	+= gpio-bt8xx.o
diff --git a/drivers/gpio/gpio-ath79.c b/drivers/gpio/gpio-ath79.c
index 03b9953..3e71ced 100644
--- a/drivers/gpio/gpio-ath79.c
+++ b/drivers/gpio/gpio-ath79.c
@@ -12,129 +12,15 @@
  *  by the Free Software Foundation.
  */
 
-#include <linux/kernel.h>
-#include <linux/init.h>
-#include <linux/module.h>
-#include <linux/types.h>
-#include <linux/spinlock.h>
-#include <linux/io.h>
-#include <linux/ioport.h>
-#include <linux/gpio.h>
+#include <linux/gpio/driver.h>
 #include <linux/platform_data/gpio-ath79.h>
 #include <linux/of_device.h>
+#include <linux/basic_mmio_gpio.h>
 
 #include <asm/mach-ath79/ar71xx_regs.h>
 
-static void __iomem *ath79_gpio_base;
-static u32 ath79_gpio_count;
-static DEFINE_SPINLOCK(ath79_gpio_lock);
-
-static void __ath79_gpio_set_value(unsigned gpio, int value)
-{
-	void __iomem *base = ath79_gpio_base;
-
-	if (value)
-		__raw_writel(1 << gpio, base + AR71XX_GPIO_REG_SET);
-	else
-		__raw_writel(1 << gpio, base + AR71XX_GPIO_REG_CLEAR);
-}
-
-static int __ath79_gpio_get_value(unsigned gpio)
-{
-	return (__raw_readl(ath79_gpio_base + AR71XX_GPIO_REG_IN) >> gpio) & 1;
-}
-
-static int ath79_gpio_get_value(struct gpio_chip *chip, unsigned offset)
-{
-	return __ath79_gpio_get_value(offset);
-}
-
-static void ath79_gpio_set_value(struct gpio_chip *chip,
-				  unsigned offset, int value)
-{
-	__ath79_gpio_set_value(offset, value);
-}
-
-static int ath79_gpio_direction_input(struct gpio_chip *chip,
-				       unsigned offset)
-{
-	void __iomem *base = ath79_gpio_base;
-	unsigned long flags;
-
-	spin_lock_irqsave(&ath79_gpio_lock, flags);
-
-	__raw_writel(__raw_readl(base + AR71XX_GPIO_REG_OE) & ~(1 << offset),
-		     base + AR71XX_GPIO_REG_OE);
-
-	spin_unlock_irqrestore(&ath79_gpio_lock, flags);
-
-	return 0;
-}
-
-static int ath79_gpio_direction_output(struct gpio_chip *chip,
-					unsigned offset, int value)
-{
-	void __iomem *base = ath79_gpio_base;
-	unsigned long flags;
-
-	spin_lock_irqsave(&ath79_gpio_lock, flags);
-
-	if (value)
-		__raw_writel(1 << offset, base + AR71XX_GPIO_REG_SET);
-	else
-		__raw_writel(1 << offset, base + AR71XX_GPIO_REG_CLEAR);
-
-	__raw_writel(__raw_readl(base + AR71XX_GPIO_REG_OE) | (1 << offset),
-		     base + AR71XX_GPIO_REG_OE);
-
-	spin_unlock_irqrestore(&ath79_gpio_lock, flags);
-
-	return 0;
-}
-
-static int ar934x_gpio_direction_input(struct gpio_chip *chip, unsigned offset)
-{
-	void __iomem *base = ath79_gpio_base;
-	unsigned long flags;
-
-	spin_lock_irqsave(&ath79_gpio_lock, flags);
-
-	__raw_writel(__raw_readl(base + AR71XX_GPIO_REG_OE) | (1 << offset),
-		     base + AR71XX_GPIO_REG_OE);
-
-	spin_unlock_irqrestore(&ath79_gpio_lock, flags);
-
-	return 0;
-}
-
-static int ar934x_gpio_direction_output(struct gpio_chip *chip, unsigned offset,
-					int value)
-{
-	void __iomem *base = ath79_gpio_base;
-	unsigned long flags;
-
-	spin_lock_irqsave(&ath79_gpio_lock, flags);
-
-	if (value)
-		__raw_writel(1 << offset, base + AR71XX_GPIO_REG_SET);
-	else
-		__raw_writel(1 << offset, base + AR71XX_GPIO_REG_CLEAR);
-
-	__raw_writel(__raw_readl(base + AR71XX_GPIO_REG_OE) & ~(1 << offset),
-		     base + AR71XX_GPIO_REG_OE);
-
-	spin_unlock_irqrestore(&ath79_gpio_lock, flags);
-
-	return 0;
-}
-
-static struct gpio_chip ath79_gpio_chip = {
-	.label			= "ath79",
-	.get			= ath79_gpio_get_value,
-	.set			= ath79_gpio_set_value,
-	.direction_input	= ath79_gpio_direction_input,
-	.direction_output	= ath79_gpio_direction_output,
-	.base			= 0,
+struct ath79_gpio {
+	struct bgpio_chip bgc;
 };
 
 static const struct of_device_id ath79_gpio_of_match[] = {
@@ -147,10 +33,17 @@ static int ath79_gpio_probe(struct platform_device *pdev)
 {
 	struct ath79_gpio_platform_data *pdata = pdev->dev.platform_data;
 	struct device_node *np = pdev->dev.of_node;
+	void __iomem *ath79_gpio_base;
+	struct ath79_gpio *ctrl;
 	struct resource *res;
+	u32 ath79_gpio_count;
 	bool oe_inverted;
 	int err;
 
+	ctrl = devm_kzalloc(&pdev->dev, sizeof(*ctrl), GFP_KERNEL);
+	if (!ctrl)
+		return -ENOMEM;
+
 	if (np) {
 		err = of_property_read_u32(np, "ngpios", &ath79_gpio_count);
 		if (err) {
@@ -176,14 +69,25 @@ static int ath79_gpio_probe(struct platform_device *pdev)
 	if (!ath79_gpio_base)
 		return -ENOMEM;
 
-	ath79_gpio_chip.dev = &pdev->dev;
-	ath79_gpio_chip.ngpio = ath79_gpio_count;
-	if (oe_inverted) {
-		ath79_gpio_chip.direction_input = ar934x_gpio_direction_input;
-		ath79_gpio_chip.direction_output = ar934x_gpio_direction_output;
+	err = bgpio_init(&ctrl->bgc, &pdev->dev, 4,
+			ath79_gpio_base + AR71XX_GPIO_REG_IN,
+			ath79_gpio_base + AR71XX_GPIO_REG_SET,
+			ath79_gpio_base + AR71XX_GPIO_REG_CLEAR,
+			oe_inverted ?
+				NULL : ath79_gpio_base + AR71XX_GPIO_REG_OE,
+			oe_inverted ?
+				ath79_gpio_base + AR71XX_GPIO_REG_OE : NULL,
+			0);
+	if (err) {
+		dev_err(&pdev->dev, "bgpio_init failed\n");
+		return err;
 	}
 
-	err = gpiochip_add(&ath79_gpio_chip);
+	ctrl->bgc.gc.label = "ath79";
+	ctrl->bgc.gc.base = 0;
+	ctrl->bgc.gc.ngpio = ath79_gpio_count;
+
+	err = gpiochip_add(&ctrl->bgc.gc);
 	if (err) {
 		dev_err(&pdev->dev,
 			"cannot add AR71xx GPIO chip, error=%d", err);
-- 
2.0.0
