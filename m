From: <kamlakant.patel@linaro.org>
Subject: [PATCH v1 1/5] gpio: moxart: convert to use basic mmio gpio library
Date: Mon, 1 Dec 2014 17:39:34 +0530
Message-ID: <1417435778-21879-2-git-send-email-kamlakant.patel@linaro.org>
References: <1417435778-21879-1-git-send-email-kamlakant.patel@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-gw3-out.broadcom.com ([216.31.210.64]:14590 "EHLO
	mail-gw3-out.broadcom.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753051AbaLAMI7 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 1 Dec 2014 07:08:59 -0500
In-Reply-To: <1417435778-21879-1-git-send-email-kamlakant.patel@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Jonas Jensen <jonas.jensen@gmail.com>
Cc: Kamlakant Patel <kamlakant.patel@linaro.org>, linux-gpio@vger.kernel.org

From: Kamlakant Patel <kamlakant.patel@linaro.org>

This patch converts MOXART GPIO driver to use basic_mmio_gpio
generic library.

Signed-off-by: Kamlakant Patel <kamlakant.patel@linaro.org>
Tested-by: Jonas Jensen <jonas.jensen@gmail.com>
---
 drivers/gpio/Kconfig       |   1 +
 drivers/gpio/gpio-moxart.c | 101 ++++++++++++++-------------------------------
 2 files changed, 32 insertions(+), 70 deletions(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 0959ca9..3bd4d63 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -184,6 +184,7 @@ config GPIO_F7188X
 config GPIO_MOXART
 	bool "MOXART GPIO support"
 	depends on ARCH_MOXART
+	select GPIO_GENERIC
 	help
 	  Select this option to enable GPIO driver for
 	  MOXA ART SoC devices.
diff --git a/drivers/gpio/gpio-moxart.c b/drivers/gpio/gpio-moxart.c
index 4661e18..122958f 100644
--- a/drivers/gpio/gpio-moxart.c
+++ b/drivers/gpio/gpio-moxart.c
@@ -23,21 +23,12 @@
 #include <linux/delay.h>
 #include <linux/timer.h>
 #include <linux/bitops.h>
+#include <linux/basic_mmio_gpio.h>
 
 #define GPIO_DATA_OUT		0x00
 #define GPIO_DATA_IN		0x04
 #define GPIO_PIN_DIRECTION	0x08
 
-struct moxart_gpio_chip {
-	struct gpio_chip gpio;
-	void __iomem *base;
-};
-
-static inline struct moxart_gpio_chip *to_moxart_gpio(struct gpio_chip *chip)
-{
-	return container_of(chip, struct moxart_gpio_chip, gpio);
-}
-
 static int moxart_gpio_request(struct gpio_chip *chip, unsigned offset)
 {
 	return pinctrl_request_gpio(offset);
@@ -48,90 +39,60 @@ static void moxart_gpio_free(struct gpio_chip *chip, unsigned offset)
 	pinctrl_free_gpio(offset);
 }
 
-static void moxart_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
-{
-	struct moxart_gpio_chip *gc = to_moxart_gpio(chip);
-	void __iomem *ioaddr = gc->base + GPIO_DATA_OUT;
-	u32 reg = readl(ioaddr);
-
-	if (value)
-		reg = reg | BIT(offset);
-	else
-		reg = reg & ~BIT(offset);
-
-	writel(reg, ioaddr);
-}
-
 static int moxart_gpio_get(struct gpio_chip *chip, unsigned offset)
 {
-	struct moxart_gpio_chip *gc = to_moxart_gpio(chip);
-	u32 ret = readl(gc->base + GPIO_PIN_DIRECTION);
+	struct bgpio_chip *bgc = to_bgpio_chip(chip);
+	u32 ret = bgc->read_reg(bgc->reg_dir);
 
 	if (ret & BIT(offset))
-		return !!(readl(gc->base + GPIO_DATA_OUT) & BIT(offset));
+		return !!(bgc->read_reg(bgc->reg_set) & BIT(offset));
 	else
-		return !!(readl(gc->base + GPIO_DATA_IN) & BIT(offset));
-}
-
-static int moxart_gpio_direction_input(struct gpio_chip *chip, unsigned offset)
-{
-	struct moxart_gpio_chip *gc = to_moxart_gpio(chip);
-	void __iomem *ioaddr = gc->base + GPIO_PIN_DIRECTION;
-
-	writel(readl(ioaddr) & ~BIT(offset), ioaddr);
-	return 0;
-}
-
-static int moxart_gpio_direction_output(struct gpio_chip *chip,
-					unsigned offset, int value)
-{
-	struct moxart_gpio_chip *gc = to_moxart_gpio(chip);
-	void __iomem *ioaddr = gc->base + GPIO_PIN_DIRECTION;
-
-	moxart_gpio_set(chip, offset, value);
-	writel(readl(ioaddr) | BIT(offset), ioaddr);
-	return 0;
+		return !!(bgc->read_reg(bgc->reg_dat) & BIT(offset));
 }
 
-static struct gpio_chip moxart_template_chip = {
-	.label			= "moxart-gpio",
-	.request		= moxart_gpio_request,
-	.free			= moxart_gpio_free,
-	.direction_input	= moxart_gpio_direction_input,
-	.direction_output	= moxart_gpio_direction_output,
-	.set			= moxart_gpio_set,
-	.get			= moxart_gpio_get,
-	.ngpio			= 32,
-	.owner			= THIS_MODULE,
-};
-
 static int moxart_gpio_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct resource *res;
-	struct moxart_gpio_chip *mgc;
+	struct bgpio_chip *bgc;
+	void __iomem *base;
 	int ret;
 
-	mgc = devm_kzalloc(dev, sizeof(*mgc), GFP_KERNEL);
-	if (!mgc)
+	bgc = devm_kzalloc(dev, sizeof(*bgc), GFP_KERNEL);
+	if (!bgc)
 		return -ENOMEM;
-	mgc->gpio = moxart_template_chip;
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	mgc->base = devm_ioremap_resource(dev, res);
-	if (IS_ERR(mgc->base))
-		return PTR_ERR(mgc->base);
+	base = devm_ioremap_resource(dev, res);
+	if (IS_ERR(base))
+		return PTR_ERR(base);
 
-	mgc->gpio.dev = dev;
+	ret = bgpio_init(bgc, dev, 4, base + GPIO_DATA_IN,
+		    base + GPIO_DATA_OUT, NULL,
+		    base + GPIO_PIN_DIRECTION, NULL, 0);
+	if (ret) {
+		dev_err(&pdev->dev, "bgpio_init failed\n");
+		return ret;
+	}
 
-	ret = gpiochip_add(&mgc->gpio);
+	bgc->gc.label = "moxart-gpio";
+	bgc->gc.request = moxart_gpio_request;
+	bgc->gc.free = moxart_gpio_free;
+	bgc->gc.get = moxart_gpio_get;
+	bgc->data = bgc->read_reg(bgc->reg_set);
+	bgc->gc.base = 0;
+	bgc->gc.ngpio = 32;
+	bgc->gc.dev = dev;
+	bgc->gc.owner = THIS_MODULE;
+
+	ret = gpiochip_add(&bgc->gc);
 	if (ret) {
 		dev_err(dev, "%s: gpiochip_add failed\n",
 			dev->of_node->full_name);
 		return ret;
 	}
 
-	return 0;
+	return ret;
 }
 
 static const struct of_device_id moxart_gpio_match[] = {
-- 
1.9.1

