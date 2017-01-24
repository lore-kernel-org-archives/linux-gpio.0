From: William Breathitt Gray <vilhelm.gray@gmail.com>
Subject: [PATCH 1/5] gpio: 104-dio-48e: Utilize devm_ functions in driver probe callback
Date: Tue, 24 Jan 2017 15:00:31 -0500
Message-ID: <282c88e9bee6c5edc16637e37cecb4b4b4c80898.1485287208.git.vilhelm.gray@gmail.com>
References: <cover.1485287208.git.vilhelm.gray@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1485287208.git.vilhelm.gray@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org, gnurou@gmail.com
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, William Breathitt Gray <vilhelm.gray@gmail.com>
List-Id: linux-gpio@vger.kernel.org

The devm_ resource manager functions allow memory to be automatically
released when a device is unbound. This patch takes advantage of the
resource manager functions and replaces the gpiochip_add_data call and
request_irq call with the devm_gpiochip_add_data call and
devm_request_irq call respectively. In addition, the dio48e_remove
function has been removed as no longer necessary due to the use of the
relevant devm_ resource manager functions.

Signed-off-by: William Breathitt Gray <vilhelm.gray@gmail.com>
---
 drivers/gpio/gpio-104-dio-48e.c | 27 +++++----------------------
 1 file changed, 5 insertions(+), 22 deletions(-)

diff --git a/drivers/gpio/gpio-104-dio-48e.c b/drivers/gpio/gpio-104-dio-48e.c
index fcf776971ca9..b6d756b09979 100644
--- a/drivers/gpio/gpio-104-dio-48e.c
+++ b/drivers/gpio/gpio-104-dio-48e.c
@@ -48,7 +48,6 @@ MODULE_PARM_DESC(irq, "ACCES 104-DIO-48E interrupt line numbers");
  * @control:	Control registers state
  * @lock:	synchronization lock to prevent I/O race conditions
  * @base:	base port address of the GPIO device
- * @irq:	Interrupt line number
  * @irq_mask:	I/O bits affected by interrupts
  */
 struct dio48e_gpio {
@@ -58,7 +57,6 @@ struct dio48e_gpio {
 	unsigned char control[2];
 	spinlock_t lock;
 	unsigned base;
-	unsigned irq;
 	unsigned char irq_mask;
 };
 
@@ -329,13 +327,12 @@ static int dio48e_probe(struct device *dev, unsigned int id)
 	dio48egpio->chip.get = dio48e_gpio_get;
 	dio48egpio->chip.set = dio48e_gpio_set;
 	dio48egpio->base = base[id];
-	dio48egpio->irq = irq[id];
 
 	spin_lock_init(&dio48egpio->lock);
 
 	dev_set_drvdata(dev, dio48egpio);
 
-	err = gpiochip_add_data(&dio48egpio->chip, dio48egpio);
+	err = devm_gpiochip_add_data(dev, &dio48egpio->chip, dio48egpio);
 	if (err) {
 		dev_err(dev, "GPIO registering failed (%d)\n", err);
 		return err;
@@ -360,30 +357,17 @@ static int dio48e_probe(struct device *dev, unsigned int id)
 		handle_edge_irq, IRQ_TYPE_NONE);
 	if (err) {
 		dev_err(dev, "Could not add irqchip (%d)\n", err);
-		goto err_gpiochip_remove;
+		return err;
 	}
 
-	err = request_irq(irq[id], dio48e_irq_handler, 0, name, dio48egpio);
+	err = devm_request_irq(dev, irq[id], dio48e_irq_handler, 0, name,
+		dio48egpio);
 	if (err) {
 		dev_err(dev, "IRQ handler registering failed (%d)\n", err);
-		goto err_gpiochip_remove;
+		return err;
 	}
 
 	return 0;
-
-err_gpiochip_remove:
-	gpiochip_remove(&dio48egpio->chip);
-	return err;
-}
-
-static int dio48e_remove(struct device *dev, unsigned int id)
-{
-	struct dio48e_gpio *const dio48egpio = dev_get_drvdata(dev);
-
-	free_irq(dio48egpio->irq, dio48egpio);
-	gpiochip_remove(&dio48egpio->chip);
-
-	return 0;
 }
 
 static struct isa_driver dio48e_driver = {
@@ -391,7 +375,6 @@ static struct isa_driver dio48e_driver = {
 	.driver = {
 		.name = "104-dio-48e"
 	},
-	.remove = dio48e_remove
 };
 module_isa_driver(dio48e_driver, num_dio48e);
 
-- 
2.11.0
