From: William Breathitt Gray <vilhelm.gray@gmail.com>
Subject: [PATCH 2/5] gpio: 104-idi-48: Utilize devm_ functions in driver probe callback
Date: Tue, 24 Jan 2017 15:00:43 -0500
Message-ID: <9867e73be56728749f123534b6ef144269cdac9c.1485287208.git.vilhelm.gray@gmail.com>
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
devm_request_irq call respectively. In addition, the idi_48_remove
function has been removed as no longer necessary due to the use of the
relevant devm_ resource manager functions.

Signed-off-by: William Breathitt Gray <vilhelm.gray@gmail.com>
---
 drivers/gpio/gpio-104-idi-48.c | 28 +++++-----------------------
 1 file changed, 5 insertions(+), 23 deletions(-)

diff --git a/drivers/gpio/gpio-104-idi-48.c b/drivers/gpio/gpio-104-idi-48.c
index 2d2763ea1a68..eafbf053f3e8 100644
--- a/drivers/gpio/gpio-104-idi-48.c
+++ b/drivers/gpio/gpio-104-idi-48.c
@@ -47,7 +47,6 @@ MODULE_PARM_DESC(irq, "ACCES 104-IDI-48 interrupt line numbers");
  * @ack_lock:	synchronization lock to prevent IRQ handler race conditions
  * @irq_mask:	input bits affected by interrupts
  * @base:	base port address of the GPIO device
- * @irq:	Interrupt line number
  * @cos_enb:	Change-Of-State IRQ enable boundaries mask
  */
 struct idi_48_gpio {
@@ -56,7 +55,6 @@ struct idi_48_gpio {
 	spinlock_t ack_lock;
 	unsigned char irq_mask[6];
 	unsigned base;
-	unsigned irq;
 	unsigned char cos_enb;
 };
 
@@ -244,14 +242,13 @@ static int idi_48_probe(struct device *dev, unsigned int id)
 	idi48gpio->chip.direction_input = idi_48_gpio_direction_input;
 	idi48gpio->chip.get = idi_48_gpio_get;
 	idi48gpio->base = base[id];
-	idi48gpio->irq = irq[id];
 
 	spin_lock_init(&idi48gpio->lock);
 	spin_lock_init(&idi48gpio->ack_lock);
 
 	dev_set_drvdata(dev, idi48gpio);
 
-	err = gpiochip_add_data(&idi48gpio->chip, idi48gpio);
+	err = devm_gpiochip_add_data(dev, &idi48gpio->chip, idi48gpio);
 	if (err) {
 		dev_err(dev, "GPIO registering failed (%d)\n", err);
 		return err;
@@ -265,31 +262,17 @@ static int idi_48_probe(struct device *dev, unsigned int id)
 		handle_edge_irq, IRQ_TYPE_NONE);
 	if (err) {
 		dev_err(dev, "Could not add irqchip (%d)\n", err);
-		goto err_gpiochip_remove;
+		return err;
 	}
 
-	err = request_irq(irq[id], idi_48_irq_handler, IRQF_SHARED, name,
-		idi48gpio);
+	err = devm_request_irq(dev, irq[id], idi_48_irq_handler, IRQF_SHARED,
+		name, idi48gpio);
 	if (err) {
 		dev_err(dev, "IRQ handler registering failed (%d)\n", err);
-		goto err_gpiochip_remove;
+		return err;
 	}
 
 	return 0;
-
-err_gpiochip_remove:
-	gpiochip_remove(&idi48gpio->chip);
-	return err;
-}
-
-static int idi_48_remove(struct device *dev, unsigned int id)
-{
-	struct idi_48_gpio *const idi48gpio = dev_get_drvdata(dev);
-
-	free_irq(idi48gpio->irq, idi48gpio);
-	gpiochip_remove(&idi48gpio->chip);
-
-	return 0;
 }
 
 static struct isa_driver idi_48_driver = {
@@ -297,7 +280,6 @@ static struct isa_driver idi_48_driver = {
 	.driver = {
 		.name = "104-idi-48"
 	},
-	.remove = idi_48_remove
 };
 module_isa_driver(idi_48_driver, num_idi_48);
 
-- 
2.11.0
