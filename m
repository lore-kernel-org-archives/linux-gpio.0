From: <kamlakant.patel@broadcom.com>
Subject: [PATCH] gpio: xlp: Convert to use gpiolib irqchip helpers
Date: Thu, 15 Oct 2015 18:23:32 +0530
Message-ID: <1444913612-14291-1-git-send-email-kamlakant.patel@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-gw3-out.broadcom.com ([216.31.210.64]:13077 "EHLO
	mail-gw3-out.broadcom.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750774AbbJOM5i (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 15 Oct 2015 08:57:38 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Kamlakant Patel <kamlakant.patel@broadcom.com>, linux-gpio@vger.kernel.org, Jayachandran C <jchandra@broadcom.com>

From: Kamlakant Patel <kamlakant.patel@broadcom.com>

commit "325f0a (MIPS: Netlogic: Use chip_data for irq_chip methods)"
Updates "mips/netlogic/common/irq.c" to use chip_data to store interrupt
controller data pointer. Before this commit handler_data was used to
store interrupt controller data which caused errors while using
gpiochip_set_chained_irqchip.

Update XLP GPIO driver to use the gpiolib irqchip helpers.
And add missing depends on OF_GPIO in Kconfig.

Signed-off-by: Kamlakant Patel <kamlakant.patel@broadcom.com>
---
 drivers/gpio/Kconfig    |    2 +-
 drivers/gpio/gpio-xlp.c |   21 +++++++++++----------
 2 files changed, 12 insertions(+), 11 deletions(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 8949b3f..95ace35 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -514,7 +514,7 @@ config GPIO_XILINX
 
 config GPIO_XLP
 	tristate "Netlogic XLP GPIO support"
-	depends on CPU_XLP
+	depends on CPU_XLP && OF_GPIO
 	select GPIOLIB_IRQCHIP
 	help
 	  This driver provides support for GPIO interface on Netlogic XLP MIPS64
diff --git a/drivers/gpio/gpio-xlp.c b/drivers/gpio/gpio-xlp.c
index e02499a..bc06a2c 100644
--- a/drivers/gpio/gpio-xlp.c
+++ b/drivers/gpio/gpio-xlp.c
@@ -18,6 +18,7 @@
 #include <linux/module.h>
 #include <linux/irq.h>
 #include <linux/interrupt.h>
+#include <linux/irqchip/chained_irq.h>
 
 /*
  * XLP GPIO has multiple 32 bit registers for each feature where each register
@@ -208,25 +209,28 @@ static struct irq_chip xlp_gpio_irq_chip = {
 	.flags		= IRQCHIP_ONESHOT_SAFE,
 };
 
-static irqreturn_t xlp_gpio_generic_handler(int irq, void *data)
+static void xlp_gpio_generic_handler(struct irq_desc *desc)
 {
-	struct xlp_gpio_priv *priv = data;
+	struct xlp_gpio_priv *priv = irq_desc_get_handler_data(desc);
+	struct irq_chip *irqchip = irq_desc_get_chip(desc);
 	int gpio, regoff;
 	u32 gpio_stat;
 
 	regoff = -1;
 	gpio_stat = 0;
+
+	chained_irq_enter(irqchip, desc);
 	for_each_set_bit(gpio, priv->gpio_enabled_mask, XLP_MAX_NR_GPIO) {
 		if (regoff != gpio / XLP_GPIO_REGSZ) {
 			regoff = gpio / XLP_GPIO_REGSZ;
 			gpio_stat = readl(priv->gpio_intr_stat + regoff * 4);
 		}
+
 		if (gpio_stat & BIT(gpio % XLP_GPIO_REGSZ))
 			generic_handle_irq(irq_find_mapping(
 						priv->chip.irqdomain, gpio));
 	}
-
-	return IRQ_HANDLED;
+	chained_irq_exit(irqchip, desc);
 }
 
 static int xlp_gpio_dir_output(struct gpio_chip *gc, unsigned gpio, int state)
@@ -378,12 +382,6 @@ static int xlp_gpio_probe(struct platform_device *pdev)
 	gc->get = xlp_gpio_get;
 
 	spin_lock_init(&priv->lock);
-
-	err = devm_request_irq(&pdev->dev, irq, xlp_gpio_generic_handler,
-			IRQ_TYPE_NONE, pdev->name, priv);
-	if (err)
-		return err;
-
 	irq_base = irq_alloc_descs(-1, XLP_GPIO_IRQ_BASE, gc->ngpio, 0);
 	if (irq_base < 0) {
 		dev_err(&pdev->dev, "Failed to allocate IRQ numbers\n");
@@ -401,6 +399,9 @@ static int xlp_gpio_probe(struct platform_device *pdev)
 		goto out_gpio_remove;
 	}
 
+	gpiochip_set_chained_irqchip(gc, &xlp_gpio_irq_chip, irq,
+			xlp_gpio_generic_handler);
+
 	dev_info(&pdev->dev, "registered %d GPIOs\n", gc->ngpio);
 
 	return 0;
-- 
1.7.1

