From: kamlakant.patel@broadcom.com
Subject: [PATCH v2] gpio: xlp: Add GPIO driver support for Broadcom Vulcan ARM64
Date: Thu, 24 Mar 2016 15:01:40 +0530
Message-ID: <1458811900-6920-1-git-send-email-kamlakant.patel@broadcom.com>
References: <1458652125-4527-1-git-send-email-kamlakant.patel@broadcom.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-gw3-out.broadcom.com ([216.31.210.64]:43795 "EHLO
	mail-gw3-out.broadcom.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754137AbcCXJkL (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 24 Mar 2016 05:40:11 -0400
In-Reply-To: <1458652125-4527-1-git-send-email-kamlakant.patel@broadcom.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Kamlakant Patel <kamlakant.patel@broadcom.com>, Grant Likely <grant.likely@linaro.org>, linux-gpio@vger.kernel.org

From: Kamlakant Patel <kamlakant.patel@broadcom.com>

- Add GPIO support for Broadcom Vulcan ARM64.
- Add depends on ARCH_VULCAN to Kconfig to enable gpio controller
  driver for Broadcom Vulcan ARM64 SoCs.

Signed-off-by: Kamlakant Patel <kamlakant.patel@broadcom.com>
---
v2: Add devicetree binding documentation for GPIO on
    Broadcom Vulcan ARM64 SoCs

 .../devicetree/bindings/gpio/gpio-xlp.txt          |    3 ++
 drivers/gpio/Kconfig                               |    2 +-
 drivers/gpio/gpio-xlp.c                            |   25 ++++++++++++++++----
 3 files changed, 24 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/gpio/gpio-xlp.txt b/Documentation/devicetree/bindings/gpio/gpio-xlp.txt
index 262ee4d..28662d8 100644
--- a/Documentation/devicetree/bindings/gpio/gpio-xlp.txt
+++ b/Documentation/devicetree/bindings/gpio/gpio-xlp.txt
@@ -3,6 +3,8 @@ Netlogic XLP Family GPIO
 
 This GPIO driver is used for following Netlogic XLP SoCs:
 	XLP832, XLP316, XLP208, XLP980, XLP532
+This GPIO driver is also compatible with GPIO controller found on
+Broadcom Vulcan ARM64.
 
 Required properties:
 -------------------
@@ -13,6 +15,7 @@ Required properties:
   - "netlogic,xlp208-gpio": For Netlogic XLP208
   - "netlogic,xlp980-gpio": For Netlogic XLP980
   - "netlogic,xlp532-gpio": For Netlogic XLP532
+  - "brcm,vulcan-gpio": For Broadcom Vulcan ARM64
 - reg: Physical base address and length of the controller's registers.
 - #gpio-cells: Should be two. The first cell is the pin number and the second
   cell is used to specify optional parameters (currently unused).
diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index c88dd24..4107602 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -445,7 +445,7 @@ config GPIO_XILINX
 
 config GPIO_XLP
 	tristate "Netlogic XLP GPIO support"
-	depends on CPU_XLP && OF_GPIO
+	depends on OF_GPIO && (CPU_XLP || ARCH_VULCAN || COMPILE_TEST)
 	select GPIOLIB_IRQCHIP
 	help
 	  This driver provides support for GPIO interface on Netlogic XLP MIPS64
diff --git a/drivers/gpio/gpio-xlp.c b/drivers/gpio/gpio-xlp.c
index aa5813d..08897dc 100644
--- a/drivers/gpio/gpio-xlp.c
+++ b/drivers/gpio/gpio-xlp.c
@@ -85,7 +85,8 @@ enum {
 	XLP_GPIO_VARIANT_XLP316,
 	XLP_GPIO_VARIANT_XLP208,
 	XLP_GPIO_VARIANT_XLP980,
-	XLP_GPIO_VARIANT_XLP532
+	XLP_GPIO_VARIANT_XLP532,
+	GPIO_VARIANT_VULCAN
 };
 
 struct xlp_gpio_priv {
@@ -285,6 +286,10 @@ static const struct of_device_id xlp_gpio_of_ids[] = {
 		.compatible = "netlogic,xlp532-gpio",
 		.data	    = (void *)XLP_GPIO_VARIANT_XLP532,
 	},
+	{
+		.compatible = "brcm,vulcan-gpio",
+		.data	    = (void *)GPIO_VARIANT_VULCAN,
+	},
 	{ /* sentinel */ },
 };
 MODULE_DEVICE_TABLE(of, xlp_gpio_of_ids);
@@ -347,6 +352,7 @@ static int xlp_gpio_probe(struct platform_device *pdev)
 		break;
 	case XLP_GPIO_VARIANT_XLP980:
 	case XLP_GPIO_VARIANT_XLP532:
+	case GPIO_VARIANT_VULCAN:
 		priv->gpio_out_en = gpio_base + GPIO_9XX_OUTPUT_EN;
 		priv->gpio_paddrv = gpio_base + GPIO_9XX_PADDRV;
 		priv->gpio_intr_stat = gpio_base + GPIO_9XX_INT_STAT;
@@ -354,7 +360,12 @@ static int xlp_gpio_probe(struct platform_device *pdev)
 		priv->gpio_intr_pol = gpio_base + GPIO_9XX_INT_POL;
 		priv->gpio_intr_en = gpio_base + GPIO_9XX_INT_EN00;
 
-		ngpio = (soc_type == XLP_GPIO_VARIANT_XLP980) ? 66 : 67;
+		if (soc_type == XLP_GPIO_VARIANT_XLP980)
+			ngpio = 66;
+		else if (soc_type == XLP_GPIO_VARIANT_XLP532)
+			ngpio = 67;
+		else
+			ngpio = 70;
 		break;
 	default:
 		dev_err(&pdev->dev, "Unknown Processor type!\n");
@@ -377,10 +388,14 @@ static int xlp_gpio_probe(struct platform_device *pdev)
 	gc->get = xlp_gpio_get;
 
 	spin_lock_init(&priv->lock);
-	irq_base = irq_alloc_descs(-1, XLP_GPIO_IRQ_BASE, gc->ngpio, 0);
-	if (irq_base < 0) {
+	/* XLP has fixed IRQ range for GPIO interrupts */
+	if (soc_type == GPIO_VARIANT_VULCAN)
+		irq_base = irq_alloc_descs(-1, 0, gc->ngpio, 0);
+	else
+		irq_base = irq_alloc_descs(-1, XLP_GPIO_IRQ_BASE, gc->ngpio, 0);
+	if (IS_ERR_VALUE(irq_base)) {
 		dev_err(&pdev->dev, "Failed to allocate IRQ numbers\n");
-		return -ENODEV;
+		return irq_base;
 	}
 
 	err = gpiochip_add_data(gc, priv);
-- 
1.7.1

