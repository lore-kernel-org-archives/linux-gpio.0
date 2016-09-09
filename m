From: Alexander Shiyan <shc_work@mail.ru>
Subject: [PATCH] gpio: iop: Use generic GPIO MMIO functions for driver
Date: Fri,  9 Sep 2016 09:20:03 +0300
Message-ID: <1473402003-24424-1-git-send-email-shc_work@mail.ru>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from fallback6.mail.ru ([94.100.181.147]:41510 "EHLO
        fallback6.mail.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750841AbcIIGll (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 9 Sep 2016 02:41:41 -0400
Received: from smtp12.mail.ru (smtp12.mail.ru [94.100.181.93])
        by fallback6.mail.ru (mPOP.Fallback_MX) with ESMTP id C0B883530C2D
        for <linux-gpio@vger.kernel.org>; Fri,  9 Sep 2016 09:21:07 +0300 (MSK)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Alexander Shiyan <shc_work@mail.ru>

This patch switches the driver to use the generic GPIO MMIO functions
that removes a bit of redundant and duplicate code.
---
Compile tested only.

Signed-off-by: Alexander Shiyan <shc_work@mail.ru>
---
 drivers/gpio/Kconfig    |   3 +-
 drivers/gpio/gpio-iop.c | 115 +++++++++---------------------------------------
 2 files changed, 24 insertions(+), 94 deletions(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 66a9410..60944f4 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -237,7 +237,8 @@ config GPIO_ICH
 
 config GPIO_IOP
 	tristate "Intel IOP GPIO"
-	depends on ARM && (ARCH_IOP32X || ARCH_IOP33X)
+	depends on ARCH_IOP32X || ARCH_IOP33X || COMPILE_TEST
+	select GPIO_GENERIC
 	help
 	  Say yes here to support the GPIO functionality of a number of Intel
 	  IOP32X or IOP33X.
diff --git a/drivers/gpio/gpio-iop.c b/drivers/gpio/gpio-iop.c
index 860c535..98c7ff2 100644
--- a/drivers/gpio/gpio-iop.c
+++ b/drivers/gpio/gpio-iop.c
@@ -10,111 +10,40 @@
  * your option) any later version.
  */
 
-#include <linux/device.h>
-#include <linux/init.h>
-#include <linux/types.h>
-#include <linux/errno.h>
-#include <linux/gpio.h>
-#include <linux/export.h>
+#include <linux/err.h>
+#include <linux/module.h>
+#include <linux/gpio/driver.h>
 #include <linux/platform_device.h>
-#include <linux/bitops.h>
-#include <linux/io.h>
 
-#define IOP3XX_N_GPIOS	8
-
-#define GPIO_IN			0
-#define GPIO_OUT		1
-#define GPIO_LOW		0
-#define GPIO_HIGH		1
-
-/* Memory base offset */
-static void __iomem *base;
-
-#define IOP3XX_GPIO_REG(reg)	(base + (reg))
-#define IOP3XX_GPOE		IOP3XX_GPIO_REG(0x0000)
-#define IOP3XX_GPID		IOP3XX_GPIO_REG(0x0004)
-#define IOP3XX_GPOD		IOP3XX_GPIO_REG(0x0008)
-
-static void gpio_line_config(int line, int direction)
-{
-	unsigned long flags;
-	u32 val;
-
-	local_irq_save(flags);
-	val = readl(IOP3XX_GPOE);
-	if (direction == GPIO_IN) {
-		val |= BIT(line);
-	} else if (direction == GPIO_OUT) {
-		val &= ~BIT(line);
-	}
-	writel(val, IOP3XX_GPOE);
-	local_irq_restore(flags);
-}
-
-static int gpio_line_get(int line)
-{
-	return !!(readl(IOP3XX_GPID) & BIT(line));
-}
-
-static void gpio_line_set(int line, int value)
-{
-	unsigned long flags;
-	u32 val;
-
-	local_irq_save(flags);
-	val = readl(IOP3XX_GPOD);
-	if (value == GPIO_LOW) {
-		val &= ~BIT(line);
-	} else if (value == GPIO_HIGH) {
-		val |= BIT(line);
-	}
-	writel(val, IOP3XX_GPOD);
-	local_irq_restore(flags);
-}
-
-static int iop3xx_gpio_direction_input(struct gpio_chip *chip, unsigned gpio)
-{
-	gpio_line_config(gpio, GPIO_IN);
-	return 0;
-}
-
-static int iop3xx_gpio_direction_output(struct gpio_chip *chip, unsigned gpio, int level)
-{
-	gpio_line_set(gpio, level);
-	gpio_line_config(gpio, GPIO_OUT);
-	return 0;
-}
-
-static int iop3xx_gpio_get_value(struct gpio_chip *chip, unsigned gpio)
-{
-	return gpio_line_get(gpio);
-}
-
-static void iop3xx_gpio_set_value(struct gpio_chip *chip, unsigned gpio, int value)
-{
-	gpio_line_set(gpio, value);
-}
-
-static struct gpio_chip iop3xx_chip = {
-	.label			= "iop3xx",
-	.direction_input	= iop3xx_gpio_direction_input,
-	.get			= iop3xx_gpio_get_value,
-	.direction_output	= iop3xx_gpio_direction_output,
-	.set			= iop3xx_gpio_set_value,
-	.base			= 0,
-	.ngpio			= IOP3XX_N_GPIOS,
-};
+#define IOP3XX_GPOE	0x0000
+#define IOP3XX_GPID	0x0004
+#define IOP3XX_GPOD	0x0008
 
 static int iop3xx_gpio_probe(struct platform_device *pdev)
 {
 	struct resource *res;
+	struct gpio_chip *gc;
+	void __iomem *base;
+	int err;
+
+	gc = devm_kzalloc(&pdev->dev, sizeof(*gc), GFP_KERNEL);
+	if (!gc)
+		return -ENOMEM;
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	base = devm_ioremap_resource(&pdev->dev, res);
 	if (IS_ERR(base))
 		return PTR_ERR(base);
 
-	return devm_gpiochip_add_data(&pdev->dev, &iop3xx_chip, NULL);
+	err = bgpio_init(gc, &pdev->dev, 1, base + IOP3XX_GPID,
+			 base + IOP3XX_GPOD, NULL, NULL, base + IOP3XX_GPOE, 0);
+	if (err)
+		return err;
+
+	gc->base = 0;
+	gc->owner = THIS_MODULE;
+
+	return devm_gpiochip_add_data(&pdev->dev, gc, NULL);
 }
 
 static struct platform_driver iop3xx_gpio_driver = {
-- 
2.7.3

