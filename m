From: William Breathitt Gray <vilhelm.gray@gmail.com>
Subject: [PATCH 5/5] gpio: ws16c48: Utilize devm_ functions in driver probe callback
Date: Tue, 24 Jan 2017 15:01:15 -0500
Message-ID: <ba4aa1f760d413470204e4c4a4d9d9a80788397b.1485287208.git.vilhelm.gray@gmail.com>
References: <cover.1485287208.git.vilhelm.gray@gmail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-yb0-f196.google.com ([209.85.213.196]:34516 "EHLO
        mail-yb0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751085AbdAXUBW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 24 Jan 2017 15:01:22 -0500
In-Reply-To: <cover.1485287208.git.vilhelm.gray@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org, gnurou@gmail.com
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, William Breathitt Gray <vilhelm.gray@gmail.com>

The devm_ resource manager functions allow memory to be automatically
released when a device is unbound. This patch takes advantage of the
resource manager functions and replaces the gpiochip_add_data call and
request_irq call with the devm_gpiochip_add_data call and
devm_request_irq call respectively. In addition, the ws16c48_remove
function has been removed as no longer necessary due to the use of the
relevant devm_ resource manager functions.

Signed-off-by: William Breathitt Gray <vilhelm.gray@gmail.com>
---
 drivers/gpio/gpio-ws16c48.c | 28 +++++-----------------------
 1 file changed, 5 insertions(+), 23 deletions(-)

diff --git a/drivers/gpio/gpio-ws16c48.c b/drivers/gpio/gpio-ws16c48.c
index eaa71d440ccf..66129355e3a3 100644
--- a/drivers/gpio/gpio-ws16c48.c
+++ b/drivers/gpio/gpio-ws16c48.c
@@ -46,7 +46,6 @@ MODULE_PARM_DESC(irq, "WinSystems WS16C48 interrupt line numbers");
  * @irq_mask:	I/O bits affected by interrupts
  * @flow_mask:	IRQ flow type mask for the respective I/O bits
  * @base:	base port address of the GPIO device
- * @irq:	Interrupt line number
  */
 struct ws16c48_gpio {
 	struct gpio_chip chip;
@@ -56,7 +55,6 @@ struct ws16c48_gpio {
 	unsigned long irq_mask;
 	unsigned long flow_mask;
 	unsigned base;
-	unsigned irq;
 };
 
 static int ws16c48_gpio_get_direction(struct gpio_chip *chip, unsigned offset)
@@ -330,13 +328,12 @@ static int ws16c48_probe(struct device *dev, unsigned int id)
 	ws16c48gpio->chip.get = ws16c48_gpio_get;
 	ws16c48gpio->chip.set = ws16c48_gpio_set;
 	ws16c48gpio->base = base[id];
-	ws16c48gpio->irq = irq[id];
 
 	spin_lock_init(&ws16c48gpio->lock);
 
 	dev_set_drvdata(dev, ws16c48gpio);
 
-	err = gpiochip_add_data(&ws16c48gpio->chip, ws16c48gpio);
+	err = devm_gpiochip_add_data(dev, &ws16c48gpio->chip, ws16c48gpio);
 	if (err) {
 		dev_err(dev, "GPIO registering failed (%d)\n", err);
 		return err;
@@ -353,31 +350,17 @@ static int ws16c48_probe(struct device *dev, unsigned int id)
 		handle_edge_irq, IRQ_TYPE_NONE);
 	if (err) {
 		dev_err(dev, "Could not add irqchip (%d)\n", err);
-		goto err_gpiochip_remove;
+		return err;
 	}
 
-	err = request_irq(irq[id], ws16c48_irq_handler, IRQF_SHARED, name,
-		ws16c48gpio);
+	err = devm_request_irq(dev, irq[id], ws16c48_irq_handler, IRQF_SHARED,
+		name, ws16c48gpio);
 	if (err) {
 		dev_err(dev, "IRQ handler registering failed (%d)\n", err);
-		goto err_gpiochip_remove;
+		return err;
 	}
 
 	return 0;
-
-err_gpiochip_remove:
-	gpiochip_remove(&ws16c48gpio->chip);
-	return err;
-}
-
-static int ws16c48_remove(struct device *dev, unsigned int id)
-{
-	struct ws16c48_gpio *const ws16c48gpio = dev_get_drvdata(dev);
-
-	free_irq(ws16c48gpio->irq, ws16c48gpio);
-	gpiochip_remove(&ws16c48gpio->chip);
-
-	return 0;
 }
 
 static struct isa_driver ws16c48_driver = {
@@ -385,7 +368,6 @@ static struct isa_driver ws16c48_driver = {
 	.driver = {
 		.name = "ws16c48"
 	},
-	.remove = ws16c48_remove
 };
 
 module_isa_driver(ws16c48_driver, num_ws16c48);
-- 
2.11.0

