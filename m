From: <kamlakant.patel@linaro.org>
Subject: [PATCH 3/5] gpio: iop: convert to use basic mmio gpio library
Date: Wed, 29 Oct 2014 19:26:43 +0530
Message-ID: <1414591005-30961-4-git-send-email-kamlakant.patel@linaro.org>
References: <1414591005-30961-1-git-send-email-kamlakant.patel@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-gw1-out.broadcom.com ([216.31.210.62]:24659 "EHLO
	mail-gw1-out.broadcom.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932834AbaJ2N52 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 29 Oct 2014 09:57:28 -0400
In-Reply-To: <1414591005-30961-1-git-send-email-kamlakant.patel@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: Kamlakant Patel <kamlakant.patel@linaro.org>, linux-gpio@vger.kernel.org, Lennert Buytenhek <kernel@wantstofly.org>, Dan Williams <dan.j.williams@intel.com>, Mikael Pettersson <mikpe@it.uu.se>

From: Kamlakant Patel <kamlakant.patel@linaro.org>

This patch converts IOP GPIO driver to use basic_mmio_gpio
generic library.

Signed-off-by: Kamlakant Patel <kamlakant.patel@linaro.org>
---
 drivers/gpio/Kconfig    |  1 +
 drivers/gpio/gpio-iop.c | 96 +++++++++----------------------------------------
 2 files changed, 18 insertions(+), 79 deletions(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 875d312..8cbc3ab 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -407,6 +407,7 @@ config GPIO_ICH
 config GPIO_IOP
 	tristate "Intel IOP GPIO"
 	depends on ARM && (ARCH_IOP32X || ARCH_IOP33X)
+	select GPIO_GENERIC
 	help
 	  Say yes here to support the GPIO functionality of a number of Intel
 	  IOP32X or IOP33X.
diff --git a/drivers/gpio/gpio-iop.c b/drivers/gpio/gpio-iop.c
index 0a5e9d3..c7bbc73 100644
--- a/drivers/gpio/gpio-iop.c
+++ b/drivers/gpio/gpio-iop.c
@@ -14,19 +14,12 @@
 #include <linux/init.h>
 #include <linux/types.h>
 #include <linux/errno.h>
-#include <linux/gpio.h>
 #include <linux/export.h>
 #include <linux/platform_device.h>
-#include <linux/bitops.h>
-#include <linux/io.h>
+#include <linux/basic_mmio_gpio.h>
 
 #define IOP3XX_N_GPIOS	8
 
-#define GPIO_IN			0
-#define GPIO_OUT		1
-#define GPIO_LOW		0
-#define GPIO_HIGH		1
-
 /* Memory base offset */
 static void __iomem *base;
 
@@ -35,86 +28,31 @@ static void __iomem *base;
 #define IOP3XX_GPID		IOP3XX_GPIO_REG(0x0004)
 #define IOP3XX_GPOD		IOP3XX_GPIO_REG(0x0008)
 
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
-
 static int iop3xx_gpio_probe(struct platform_device *pdev)
 {
 	struct resource *res;
+	struct bgpio_chip *bgc;
+	int ret;
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	base = devm_ioremap_resource(&pdev->dev, res);
 	if (IS_ERR(base))
 		return PTR_ERR(base);
+	bgc = devm_kzalloc(&pdev->dev, sizeof(*bgc), GFP_KERNEL);
+	if (!bgc)
+		return -EINVAL;
+
+	ret = bgpio_init(bgc, &pdev->dev, 4, IOP3XX_GPID,
+			 IOP3XX_GPOD, NULL, IOP3XX_GPOE, NULL, 0);
+	if (ret) {
+		dev_err(&pdev->dev, "bgpio_init failed\n");
+		return ret;
+	}
+	bgc->gc.label			= "iop3xx";
+	bgc->gc.base			= 0;
+	bgc->gc.ngpio			= IOP3XX_N_GPIOS;
 
-	return gpiochip_add(&iop3xx_chip);
+	return gpiochip_add(&bgc->gc);
 }
 
 static struct platform_driver iop3xx_gpio_driver = {
-- 
1.9.1

