From: William Breathitt Gray <vilhelm.gray@gmail.com>
Subject: [PATCH v2 1/7] gpio: 104-dio-48e: Use devm_request_region
Date: Wed,  3 Feb 2016 15:15:21 -0500
Message-ID: <98d3cf3c17e833e825f4a58d442339995fca8379.1454530144.git.vilhelm.gray@gmail.com>
References: <cover.1454530144.git.vilhelm.gray@gmail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-yw0-f196.google.com ([209.85.161.196]:35518 "EHLO
	mail-yw0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932793AbcBCUPu (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 3 Feb 2016 15:15:50 -0500
In-Reply-To: <cover.1454530144.git.vilhelm.gray@gmail.com>
In-Reply-To: <cover.1454530144.git.vilhelm.gray@gmail.com>
References: <cover.1454530144.git.vilhelm.gray@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org, gnurou@gmail.com
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org

By the time request_region is called in the ACCES 104-DIO-48E GPIO
driver, a corresponding device structure has already been allocated. The
devm_request_region function should be used to help simplify the cleanup
code and reduce the possible points of failure.

Signed-off-by: William Breathitt Gray <vilhelm.gray@gmail.com>
Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpio/gpio-104-dio-48e.c | 25 ++++++++-----------------
 1 file changed, 8 insertions(+), 17 deletions(-)

diff --git a/drivers/gpio/gpio-104-dio-48e.c b/drivers/gpio/gpio-104-dio-48e.c
index 279de39..b144bc9 100644
--- a/drivers/gpio/gpio-104-dio-48e.c
+++ b/drivers/gpio/gpio-104-dio-48e.c
@@ -40,7 +40,6 @@ MODULE_PARM_DESC(dio_48e_irq, "ACCES 104-DIO-48E interrupt line number");
  * @control:	Control registers state
  * @lock:	synchronization lock to prevent I/O race conditions
  * @base:	base port address of the GPIO device
- * @extent:	extent of port address region of the GPIO device
  * @irq:	Interrupt line number
  * @irq_mask:	I/O bits affected by interrupts
  */
@@ -51,7 +50,6 @@ struct dio48e_gpio {
 	unsigned char control[2];
 	spinlock_t lock;
 	unsigned base;
-	unsigned extent;
 	unsigned irq;
 	unsigned char irq_mask;
 };
@@ -310,11 +308,10 @@ static int __init dio48e_probe(struct platform_device *pdev)
 	if (!dio48egpio)
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
 
 	dio48egpio->chip.label = name;
@@ -328,7 +325,6 @@ static int __init dio48e_probe(struct platform_device *pdev)
 	dio48egpio->chip.get = dio48e_gpio_get;
 	dio48egpio->chip.set = dio48e_gpio_set;
 	dio48egpio->base = base;
-	dio48egpio->extent = extent;
 	dio48egpio->irq = irq;
 
 	spin_lock_init(&dio48egpio->lock);
@@ -338,7 +334,7 @@ static int __init dio48e_probe(struct platform_device *pdev)
 	err = gpiochip_add_data(&dio48egpio->chip, dio48egpio);
 	if (err) {
 		dev_err(dev, "GPIO registering failed (%d)\n", err);
-		goto err_gpio_register;
+		return err;
 	}
 
 	/* initialize all GPIO as output */
@@ -360,23 +356,19 @@ static int __init dio48e_probe(struct platform_device *pdev)
 		handle_edge_irq, IRQ_TYPE_NONE);
 	if (err) {
 		dev_err(dev, "Could not add irqchip (%d)\n", err);
-		goto err_gpiochip_irqchip_add;
+		goto err_gpiochip_remove;
 	}
 
 	err = request_irq(irq, dio48e_irq_handler, 0, name, dio48egpio);
 	if (err) {
 		dev_err(dev, "IRQ handler registering failed (%d)\n", err);
-		goto err_request_irq;
+		goto err_gpiochip_remove;
 	}
 
 	return 0;
 
-err_request_irq:
-err_gpiochip_irqchip_add:
+err_gpiochip_remove:
 	gpiochip_remove(&dio48egpio->chip);
-err_gpio_register:
-	release_region(base, extent);
-err_lock_io_port:
 	return err;
 }
 
@@ -386,7 +378,6 @@ static int dio48e_remove(struct platform_device *pdev)
 
 	free_irq(dio48egpio->irq, dio48egpio);
 	gpiochip_remove(&dio48egpio->chip);
-	release_region(dio48egpio->base, dio48egpio->extent);
 
 	return 0;
 }
-- 
2.4.10

