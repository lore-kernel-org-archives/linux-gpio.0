From: William Breathitt Gray <vilhelm.gray@gmail.com>
Subject: [PATCH 3/7] gpio: 104-idio-16: Use devm_request_region
Date: Mon,  1 Feb 2016 18:54:28 -0500
Message-ID: <13ff690ef1cd7e11066582c1d0611602fab66c02.1454342087.git.vilhelm.gray@gmail.com>
References: <cover.1454342087.git.vilhelm.gray@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1454342087.git.vilhelm.gray@gmail.com>
In-Reply-To: <cover.1454342087.git.vilhelm.gray@gmail.com>
References: <cover.1454342087.git.vilhelm.gray@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org, gnurou@gmail.com
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

By the time request_region is called in the ACCES 104-IDIO-16 GPIO
driver, a corresponding device structure has already been allocated. The
devm_request_region function should be used to help simplify the cleanup
code and reduce the possible points of failure.

Signed-off-by: William Breathitt Gray <vilhelm.gray@gmail.com>
---
 drivers/gpio/gpio-104-idio-16.c | 22 ++++++++--------------
 1 file changed, 8 insertions(+), 14 deletions(-)

diff --git a/drivers/gpio/gpio-104-idio-16.c b/drivers/gpio/gpio-104-idio-16.c
index 4d69b50..aecdc02 100644
--- a/drivers/gpio/gpio-104-idio-16.c
+++ b/drivers/gpio/gpio-104-idio-16.c
@@ -201,11 +201,10 @@ static int __init idio_16_probe(struct platform_device *pdev)
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
@@ -230,7 +229,7 @@ static int __init idio_16_probe(struct platform_device *pdev)
 	err = gpiochip_add_data(&idio16gpio->chip, idio16gpio);
 	if (err) {
 		dev_err(dev, "GPIO registering failed (%d)\n", err);
-		goto err_gpio_register;
+		return err;
 	}
 
 	/* Disable IRQ by default */
@@ -241,23 +240,19 @@ static int __init idio_16_probe(struct platform_device *pdev)
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
 
@@ -267,7 +262,6 @@ static int idio_16_remove(struct platform_device *pdev)
 
 	free_irq(idio16gpio->irq, idio16gpio);
 	gpiochip_remove(&idio16gpio->chip);
-	release_region(idio16gpio->base, idio16gpio->extent);
 
 	return 0;
 }
-- 
2.4.10
