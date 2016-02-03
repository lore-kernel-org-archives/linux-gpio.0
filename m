From: William Breathitt Gray <vilhelm.gray@gmail.com>
Subject: [PATCH v2 7/7] gpio: ws16c48: Use devm_request_region
Date: Wed,  3 Feb 2016 15:17:50 -0500
Message-ID: <9d450efe1f2e2e9bcb4a1f5bf15c59e8f4867b5e.1454530144.git.vilhelm.gray@gmail.com>
References: <cover.1454530144.git.vilhelm.gray@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1454530144.git.vilhelm.gray@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org, gnurou@gmail.com
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

By the time request_region is called in the WinSystems WS16C48 GPIO
driver, a corresponding device structure has already been allocated. The
devm_request_region function should be used to help simplify the cleanup
code and reduce the possible points of failure.

Signed-off-by: William Breathitt Gray <vilhelm.gray@gmail.com>
Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpio/gpio-ws16c48.c | 25 ++++++++-----------------
 1 file changed, 8 insertions(+), 17 deletions(-)

diff --git a/drivers/gpio/gpio-ws16c48.c b/drivers/gpio/gpio-ws16c48.c
index 9dd9479..b43643f 100644
--- a/drivers/gpio/gpio-ws16c48.c
+++ b/drivers/gpio/gpio-ws16c48.c
@@ -41,7 +41,6 @@ MODULE_PARM_DESC(ws16c48_irq, "WinSystems WS16C48 interrupt line number");
  * @irq_mask:	I/O bits affected by interrupts
  * @flow_mask:	IRQ flow type mask for the respective I/O bits
  * @base:	base port address of the GPIO device
- * @extent:	extent of port address region of the GPIO device
  * @irq:	Interrupt line number
  */
 struct ws16c48_gpio {
@@ -52,7 +51,6 @@ struct ws16c48_gpio {
 	unsigned long irq_mask;
 	unsigned long flow_mask;
 	unsigned base;
-	unsigned extent;
 	unsigned irq;
 };
 
@@ -314,11 +312,10 @@ static int __init ws16c48_probe(struct platform_device *pdev)
 	if (!ws16c48gpio)
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
 
 	ws16c48gpio->chip.label = name;
@@ -332,7 +329,6 @@ static int __init ws16c48_probe(struct platform_device *pdev)
 	ws16c48gpio->chip.get = ws16c48_gpio_get;
 	ws16c48gpio->chip.set = ws16c48_gpio_set;
 	ws16c48gpio->base = base;
-	ws16c48gpio->extent = extent;
 	ws16c48gpio->irq = irq;
 
 	spin_lock_init(&ws16c48gpio->lock);
@@ -342,7 +338,7 @@ static int __init ws16c48_probe(struct platform_device *pdev)
 	err = gpiochip_add_data(&ws16c48gpio->chip, ws16c48gpio);
 	if (err) {
 		dev_err(dev, "GPIO registering failed (%d)\n", err);
-		goto err_gpio_register;
+		return err;
 	}
 
 	/* Disable IRQ by default */
@@ -356,24 +352,20 @@ static int __init ws16c48_probe(struct platform_device *pdev)
 		handle_edge_irq, IRQ_TYPE_NONE);
 	if (err) {
 		dev_err(dev, "Could not add irqchip (%d)\n", err);
-		goto err_gpiochip_irqchip_add;
+		goto err_gpiochip_remove;
 	}
 
 	err = request_irq(irq, ws16c48_irq_handler, IRQF_SHARED, name,
 		ws16c48gpio);
 	if (err) {
 		dev_err(dev, "IRQ handler registering failed (%d)\n", err);
-		goto err_request_irq;
+		goto err_gpiochip_remove;
 	}
 
 	return 0;
 
-err_request_irq:
-err_gpiochip_irqchip_add:
+err_gpiochip_remove:
 	gpiochip_remove(&ws16c48gpio->chip);
-err_gpio_register:
-	release_region(base, extent);
-err_lock_io_port:
 	return err;
 }
 
@@ -383,7 +375,6 @@ static int ws16c48_remove(struct platform_device *pdev)
 
 	free_irq(ws16c48gpio->irq, ws16c48gpio);
 	gpiochip_remove(&ws16c48gpio->chip);
-	release_region(ws16c48gpio->base, ws16c48gpio->extent);
 
 	return 0;
 }
-- 
2.4.10
