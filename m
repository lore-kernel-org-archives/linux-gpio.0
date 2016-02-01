From: William Breathitt Gray <vilhelm.gray@gmail.com>
Subject: [PATCH 7/7] gpio: ws16c48: Use devm_request_region
Date: Mon,  1 Feb 2016 18:57:27 -0500
Message-ID: <25faadd8078eb0e4d350c203dad6f544fd96b352.1454342087.git.vilhelm.gray@gmail.com>
References: <cover.1454342087.git.vilhelm.gray@gmail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qg0-f67.google.com ([209.85.192.67]:33692 "EHLO
	mail-qg0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751087AbcBAX5d (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 1 Feb 2016 18:57:33 -0500
In-Reply-To: <cover.1454342087.git.vilhelm.gray@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org, gnurou@gmail.com
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org

By the time request_region is called in the WinSystems WS16C48 GPIO
driver, a corresponding device structure has already been allocated. The
devm_request_region function should be used to help simplify the cleanup
code and reduce the possible points of failure.

Signed-off-by: William Breathitt Gray <vilhelm.gray@gmail.com>
---
 drivers/gpio/gpio-ws16c48.c | 22 ++++++++--------------
 1 file changed, 8 insertions(+), 14 deletions(-)

diff --git a/drivers/gpio/gpio-ws16c48.c b/drivers/gpio/gpio-ws16c48.c
index 9dd9479..72b880f 100644
--- a/drivers/gpio/gpio-ws16c48.c
+++ b/drivers/gpio/gpio-ws16c48.c
@@ -314,11 +314,10 @@ static int __init ws16c48_probe(struct platform_device *pdev)
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
@@ -342,7 +341,7 @@ static int __init ws16c48_probe(struct platform_device *pdev)
 	err = gpiochip_add_data(&ws16c48gpio->chip, ws16c48gpio);
 	if (err) {
 		dev_err(dev, "GPIO registering failed (%d)\n", err);
-		goto err_gpio_register;
+		return err;
 	}
 
 	/* Disable IRQ by default */
@@ -356,24 +355,20 @@ static int __init ws16c48_probe(struct platform_device *pdev)
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
 
@@ -383,7 +378,6 @@ static int ws16c48_remove(struct platform_device *pdev)
 
 	free_irq(ws16c48gpio->irq, ws16c48gpio);
 	gpiochip_remove(&ws16c48gpio->chip);
-	release_region(ws16c48gpio->base, ws16c48gpio->extent);
 
 	return 0;
 }
-- 
2.4.10

