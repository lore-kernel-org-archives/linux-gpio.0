From: William Breathitt Gray <vilhelm.gray@gmail.com>
Subject: [PATCH 3/5] gpio: 104-idio-16: Utilize devm_ functions in driver probe callback
Date: Tue, 24 Jan 2017 15:00:54 -0500
Message-ID: <b0562b512f25c17e060847161ab613079ebc1462.1485287208.git.vilhelm.gray@gmail.com>
References: <cover.1485287208.git.vilhelm.gray@gmail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-yw0-f195.google.com ([209.85.161.195]:36086 "EHLO
        mail-yw0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751021AbdAXUBG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 24 Jan 2017 15:01:06 -0500
In-Reply-To: <cover.1485287208.git.vilhelm.gray@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org, gnurou@gmail.com
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, William Breathitt Gray <vilhelm.gray@gmail.com>

The devm_ resource manager functions allow memory to be automatically
released when a device is unbound. This patch takes advantage of the
resource manager functions and replaces the gpiochip_add_data call and
request_irq call with the devm_gpiochip_add_data call and
devm_request_irq call respectively. In addition, the idio_16_remove
function has been removed as no longer necessary due to the use of the
relevant devm_ resource manager functions.

Signed-off-by: William Breathitt Gray <vilhelm.gray@gmail.com>
---
 drivers/gpio/gpio-104-idio-16.c | 27 +++++----------------------
 1 file changed, 5 insertions(+), 22 deletions(-)

diff --git a/drivers/gpio/gpio-104-idio-16.c b/drivers/gpio/gpio-104-idio-16.c
index 6787b8fcf0d8..277e52b56a39 100644
--- a/drivers/gpio/gpio-104-idio-16.c
+++ b/drivers/gpio/gpio-104-idio-16.c
@@ -46,7 +46,6 @@ MODULE_PARM_DESC(irq, "ACCES 104-IDIO-16 interrupt line numbers");
  * @lock:	synchronization lock to prevent I/O race conditions
  * @irq_mask:	I/O bits affected by interrupts
  * @base:	base port address of the GPIO device
- * @irq:	Interrupt line number
  * @out_state:	output bits state
  */
 struct idio_16_gpio {
@@ -54,7 +53,6 @@ struct idio_16_gpio {
 	spinlock_t lock;
 	unsigned long irq_mask;
 	unsigned base;
-	unsigned irq;
 	unsigned out_state;
 };
 
@@ -220,14 +218,13 @@ static int idio_16_probe(struct device *dev, unsigned int id)
 	idio16gpio->chip.get = idio_16_gpio_get;
 	idio16gpio->chip.set = idio_16_gpio_set;
 	idio16gpio->base = base[id];
-	idio16gpio->irq = irq[id];
 	idio16gpio->out_state = 0xFFFF;
 
 	spin_lock_init(&idio16gpio->lock);
 
 	dev_set_drvdata(dev, idio16gpio);
 
-	err = gpiochip_add_data(&idio16gpio->chip, idio16gpio);
+	err = devm_gpiochip_add_data(dev, &idio16gpio->chip, idio16gpio);
 	if (err) {
 		dev_err(dev, "GPIO registering failed (%d)\n", err);
 		return err;
@@ -241,30 +238,17 @@ static int idio_16_probe(struct device *dev, unsigned int id)
 		handle_edge_irq, IRQ_TYPE_NONE);
 	if (err) {
 		dev_err(dev, "Could not add irqchip (%d)\n", err);
-		goto err_gpiochip_remove;
+		return err;
 	}
 
-	err = request_irq(irq[id], idio_16_irq_handler, 0, name, idio16gpio);
+	err = devm_request_irq(dev, irq[id], idio_16_irq_handler, 0, name,
+		idio16gpio);
 	if (err) {
 		dev_err(dev, "IRQ handler registering failed (%d)\n", err);
-		goto err_gpiochip_remove;
+		return err;
 	}
 
 	return 0;
-
-err_gpiochip_remove:
-	gpiochip_remove(&idio16gpio->chip);
-	return err;
-}
-
-static int idio_16_remove(struct device *dev, unsigned int id)
-{
-	struct idio_16_gpio *const idio16gpio = dev_get_drvdata(dev);
-
-	free_irq(idio16gpio->irq, idio16gpio);
-	gpiochip_remove(&idio16gpio->chip);
-
-	return 0;
 }
 
 static struct isa_driver idio_16_driver = {
@@ -272,7 +256,6 @@ static struct isa_driver idio_16_driver = {
 	.driver = {
 		.name = "104-idio-16"
 	},
-	.remove = idio_16_remove
 };
 
 module_isa_driver(idio_16_driver, num_idio_16);
-- 
2.11.0

