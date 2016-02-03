From: William Breathitt Gray <vilhelm.gray@gmail.com>
Subject: [PATCH v2 2/7] gpio: 104-idi-48: Use devm_request_region
Date: Wed,  3 Feb 2016 15:15:22 -0500
Message-ID: <01cc31083ab67299d18425b6d9a6099479dbb549.1454530144.git.vilhelm.gray@gmail.com>
References: <cover.1454530144.git.vilhelm.gray@gmail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-yw0-f193.google.com ([209.85.161.193]:36269 "EHLO
	mail-yw0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932456AbcBCUQP (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 3 Feb 2016 15:16:15 -0500
In-Reply-To: <cover.1454530144.git.vilhelm.gray@gmail.com>
In-Reply-To: <cover.1454530144.git.vilhelm.gray@gmail.com>
References: <cover.1454530144.git.vilhelm.gray@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org, gnurou@gmail.com
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org

By the time request_region is called in the ACCES 104-IDI-48 GPIO
driver, a corresponding device structure has already been allocated. The
devm_request_region function should be used to help simplify the cleanup
code and reduce the possible points of failure.

Signed-off-by: William Breathitt Gray <vilhelm.gray@gmail.com>
Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpio/gpio-104-idi-48.c | 25 ++++++++-----------------
 1 file changed, 8 insertions(+), 17 deletions(-)

diff --git a/drivers/gpio/gpio-104-idi-48.c b/drivers/gpio/gpio-104-idi-48.c
index 285a075..81c98d5 100644
--- a/drivers/gpio/gpio-104-idi-48.c
+++ b/drivers/gpio/gpio-104-idi-48.c
@@ -39,7 +39,6 @@ MODULE_PARM_DESC(idi_48_irq, "ACCES 104-IDI-48 interrupt line number");
  * @ack_lock:	synchronization lock to prevent IRQ handler race conditions
  * @irq_mask:	input bits affected by interrupts
  * @base:	base port address of the GPIO device
- * @extent:	extent of port address region of the GPIO device
  * @irq:	Interrupt line number
  * @cos_enb:	Change-Of-State IRQ enable boundaries mask
  */
@@ -49,7 +48,6 @@ struct idi_48_gpio {
 	spinlock_t ack_lock;
 	unsigned char irq_mask[6];
 	unsigned base;
-	unsigned extent;
 	unsigned irq;
 	unsigned char cos_enb;
 };
@@ -227,11 +225,10 @@ static int __init idi_48_probe(struct platform_device *pdev)
 	if (!idi48gpio)
 		return -ENOMEM;
 
-	if (!request_region(base, extent, name)) {
-		dev_err(dev, "Unable to lock %s port addresses (0x%X-0x%X)\n",
-			name, base, base + extent);
-		err = -EBUSY;
-		goto err_lock_io_port;
+	if (!devm_request_region(dev, base, extent, name)) {
+		dev_err(dev, "Unable to lock port addresses (0x%X-0x%X)\n",
+			base, base + extent);
+		return -EBUSY;
 	}
 
 	idi48gpio->chip.label = name;
@@ -243,7 +240,6 @@ static int __init idi_48_probe(struct platform_device *pdev)
 	idi48gpio->chip.direction_input = idi_48_gpio_direction_input;
 	idi48gpio->chip.get = idi_48_gpio_get;
 	idi48gpio->base = base;
-	idi48gpio->extent = extent;
 	idi48gpio->irq = irq;
 
 	spin_lock_init(&idi48gpio->lock);
@@ -253,7 +249,7 @@ static int __init idi_48_probe(struct platform_device *pdev)
 	err = gpiochip_add_data(&idi48gpio->chip, idi48gpio);
 	if (err) {
 		dev_err(dev, "GPIO registering failed (%d)\n", err);
-		goto err_gpio_register;
+		return err;
 	}
 
 	/* Disable IRQ by default */
@@ -264,24 +260,20 @@ static int __init idi_48_probe(struct platform_device *pdev)
 		handle_edge_irq, IRQ_TYPE_NONE);
 	if (err) {
 		dev_err(dev, "Could not add irqchip (%d)\n", err);
-		goto err_gpiochip_irqchip_add;
+		goto err_gpiochip_remove;
 	}
 
 	err = request_irq(irq, idi_48_irq_handler, IRQF_SHARED, name,
 		idi48gpio);
 	if (err) {
 		dev_err(dev, "IRQ handler registering failed (%d)\n", err);
-		goto err_request_irq;
+		goto err_gpiochip_remove;
 	}
 
 	return 0;
 
-err_request_irq:
-err_gpiochip_irqchip_add:
+err_gpiochip_remove:
 	gpiochip_remove(&idi48gpio->chip);
-err_gpio_register:
-	release_region(base, extent);
-err_lock_io_port:
 	return err;
 }
 
@@ -291,7 +283,6 @@ static int idi_48_remove(struct platform_device *pdev)
 
 	free_irq(idi48gpio->irq, idi48gpio);
 	gpiochip_remove(&idi48gpio->chip);
-	release_region(idi48gpio->base, idi48gpio->extent);
 
 	return 0;
 }
-- 
2.4.10

