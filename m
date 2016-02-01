From: William Breathitt Gray <vilhelm.gray@gmail.com>
Subject: [PATCH 1/7] gpio: 104-dio-48e: Use devm_request_region
Date: Mon,  1 Feb 2016 18:54:26 -0500
Message-ID: <0cb77525d1892211b612a9fbec1be94e87ee44ba.1454342087.git.vilhelm.gray@gmail.com>
References: <cover.1454342087.git.vilhelm.gray@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1454342087.git.vilhelm.gray@gmail.com>
In-Reply-To: <cover.1454342087.git.vilhelm.gray@gmail.com>
References: <cover.1454342087.git.vilhelm.gray@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org, gnurou@gmail.com
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

By the time request_region is called in the ACCES 104-DIO-48E GPIO
driver, a corresponding device structure has already been allocated. The
devm_request_region function should be used to help simplify the cleanup
code and reduce the possible points of failure.

Signed-off-by: William Breathitt Gray <vilhelm.gray@gmail.com>
---
 drivers/gpio/gpio-104-dio-48e.c | 22 ++++++++--------------
 1 file changed, 8 insertions(+), 14 deletions(-)

diff --git a/drivers/gpio/gpio-104-dio-48e.c b/drivers/gpio/gpio-104-dio-48e.c
index 279de39..e8fcbb8 100644
--- a/drivers/gpio/gpio-104-dio-48e.c
+++ b/drivers/gpio/gpio-104-dio-48e.c
@@ -310,11 +310,10 @@ static int __init dio48e_probe(struct platform_device *pdev)
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
@@ -338,7 +337,7 @@ static int __init dio48e_probe(struct platform_device *pdev)
 	err = gpiochip_add_data(&dio48egpio->chip, dio48egpio);
 	if (err) {
 		dev_err(dev, "GPIO registering failed (%d)\n", err);
-		goto err_gpio_register;
+		return err;
 	}
 
 	/* initialize all GPIO as output */
@@ -360,23 +359,19 @@ static int __init dio48e_probe(struct platform_device *pdev)
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
 
@@ -386,7 +381,6 @@ static int dio48e_remove(struct platform_device *pdev)
 
 	free_irq(dio48egpio->irq, dio48egpio);
 	gpiochip_remove(&dio48egpio->chip);
-	release_region(dio48egpio->base, dio48egpio->extent);
 
 	return 0;
 }
-- 
2.4.10
