From: William Breathitt Gray <vilhelm.gray@gmail.com>
Subject: [PATCH v2 3/7] gpio: 104-idio-16: Use devm_request_region
Date: Wed,  3 Feb 2016 15:17:02 -0500
Message-ID: <f677671320a122d51768cbbe8aea3f6260233858.1454530144.git.vilhelm.gray@gmail.com>
References: <cover.1454530144.git.vilhelm.gray@gmail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-yw0-f193.google.com ([209.85.161.193]:35585 "EHLO
	mail-yw0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932999AbcBCURJ (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 3 Feb 2016 15:17:09 -0500
In-Reply-To: <cover.1454530144.git.vilhelm.gray@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org, gnurou@gmail.com
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org

By the time request_region is called in the ACCES 104-IDIO-16 GPIO
driver, a corresponding device structure has already been allocated. The
devm_request_region function should be used to help simplify the cleanup
code and reduce the possible points of failure.

Signed-off-by: William Breathitt Gray <vilhelm.gray@gmail.com>
Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpio/gpio-104-idio-16.c | 25 ++++++++-----------------
 1 file changed, 8 insertions(+), 17 deletions(-)

diff --git a/drivers/gpio/gpio-104-idio-16.c b/drivers/gpio/gpio-104-idio-16.c
index 4d69b50..e7f881f 100644
--- a/drivers/gpio/gpio-104-idio-16.c
+++ b/drivers/gpio/gpio-104-idio-16.c
@@ -38,7 +38,6 @@ MODULE_PARM_DESC(idio_16_irq, "ACCES 104-IDIO-16 interrupt line number");
  * @lock:	synchronization lock to prevent I/O race conditions
  * @irq_mask:	I/O bits affected by interrupts
  * @base:	base port address of the GPIO device
- * @extent:	extent of port address region of the GPIO device
  * @irq:	Interrupt line number
  * @out_state:	output bits state
  */
@@ -47,7 +46,6 @@ struct idio_16_gpio {
 	spinlock_t lock;
 	unsigned long irq_mask;
 	unsigned base;
-	unsigned extent;
 	unsigned irq;
 	unsigned out_state;
 };
@@ -201,11 +199,10 @@ static int __init idio_16_probe(struct platform_device *pdev)
 	if (!idio16gpio)
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
 
 	idio16gpio->chip.label = name;
@@ -219,7 +216,6 @@ static int __init idio_16_probe(struct platform_device *pdev)
 	idio16gpio->chip.get = idio_16_gpio_get;
 	idio16gpio->chip.set = idio_16_gpio_set;
 	idio16gpio->base = base;
-	idio16gpio->extent = extent;
 	idio16gpio->irq = irq;
 	idio16gpio->out_state = 0xFFFF;
 
@@ -230,7 +226,7 @@ static int __init idio_16_probe(struct platform_device *pdev)
 	err = gpiochip_add_data(&idio16gpio->chip, idio16gpio);
 	if (err) {
 		dev_err(dev, "GPIO registering failed (%d)\n", err);
-		goto err_gpio_register;
+		return err;
 	}
 
 	/* Disable IRQ by default */
@@ -241,23 +237,19 @@ static int __init idio_16_probe(struct platform_device *pdev)
 		handle_edge_irq, IRQ_TYPE_NONE);
 	if (err) {
 		dev_err(dev, "Could not add irqchip (%d)\n", err);
-		goto err_gpiochip_irqchip_add;
+		goto err_gpiochip_remove;
 	}
 
 	err = request_irq(irq, idio_16_irq_handler, 0, name, idio16gpio);
 	if (err) {
 		dev_err(dev, "IRQ handler registering failed (%d)\n", err);
-		goto err_request_irq;
+		goto err_gpiochip_remove;
 	}
 
 	return 0;
 
-err_request_irq:
-err_gpiochip_irqchip_add:
+err_gpiochip_remove:
 	gpiochip_remove(&idio16gpio->chip);
-err_gpio_register:
-	release_region(base, extent);
-err_lock_io_port:
 	return err;
 }
 
@@ -267,7 +259,6 @@ static int idio_16_remove(struct platform_device *pdev)
 
 	free_irq(idio16gpio->irq, idio16gpio);
 	gpiochip_remove(&idio16gpio->chip);
-	release_region(idio16gpio->base, idio16gpio->extent);
 
 	return 0;
 }
-- 
2.4.10

