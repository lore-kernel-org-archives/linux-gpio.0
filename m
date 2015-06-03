From: Grygorii Strashko <grygorii.strashko@ti.com>
Subject: [PATCH] gpio: pcf857x: handle only enabled irqs
Date: Wed, 3 Jun 2015 22:33:08 +0300
Message-ID: <1433359988-3456-1-git-send-email-grygorii.strashko@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from devils.ext.ti.com ([198.47.26.153]:49541 "EHLO
	devils.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754235AbbFCTdW (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 3 Jun 2015 15:33:22 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: nsekhar@ti.com, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Grygorii Strashko <grygorii.strashko@ti.com>, Geert Uytterhoeven <geert+renesas@glider.be>

Now pcf857x_irq() IRQ's dispatcher will try to run nested
IRQ handlers for each GPIO pin which state has changed.
Such IRQs are, actually, spurious and nested IRQ handlers
have to be called only for IRQs wich were enabled by users.
This is not critical issue - just  /proc/interrupts
will display counters for unused IRQS:
399:          4          0   pcf857x   0 Edge
428:          1          0   pcf857x  13 Edge
430:          1          0   pcf857x  15 Edge

Hence, fix it by adding irq_enabled field in struct pcf857x to track
enabled GPIO IRQs and corresponding callbacks in pcf857x_irq_chip.

Similar functionality was presented in pcf857x driver, commit
 21fd3cd1874a ('gpio: pcf857x: call the gpio user handler iff...')

and then it was removed by commit
 a39294bdf4b0 ('gpio: pcf857x: Switch to use gpiolib irqchip...')

Cc: Geert Uytterhoeven <geert+renesas@glider.be>

Fixes: a39294bdf4b0 ('gpio: pcf857x: Switch to use gpiolib irqchip helpers')
Signed-off-by: Grygorii Strashko <grygorii.strashko@ti.com>
---
 drivers/gpio/gpio-pcf857x.c | 42 +++++++++++++++++++++++++++++++++---------
 1 file changed, 33 insertions(+), 9 deletions(-)

diff --git a/drivers/gpio/gpio-pcf857x.c b/drivers/gpio/gpio-pcf857x.c
index 945f0cd..699d8a5 100644
--- a/drivers/gpio/gpio-pcf857x.c
+++ b/drivers/gpio/gpio-pcf857x.c
@@ -91,6 +91,7 @@ struct pcf857x {
 	spinlock_t		slock;		/* protect irq demux */
 	unsigned		out;		/* software latch */
 	unsigned		status;		/* current status */
+	unsigned		irq_enabled;	/* enabled irqs */
 
 	int (*write)(struct i2c_client *client, unsigned data);
 	int (*read)(struct i2c_client *client);
@@ -194,7 +195,7 @@ static irqreturn_t pcf857x_irq(int irq, void *data)
 	 * interrupt source, just to avoid bad irqs
 	 */
 
-	change = (gpio->status ^ status);
+	change = (gpio->status ^ status) & gpio->irq_enabled;
 	for_each_set_bit(i, &change, gpio->chip.ngpio)
 		handle_nested_irq(irq_find_mapping(gpio->chip.irqdomain, i));
 	gpio->status = status;
@@ -209,29 +210,52 @@ static irqreturn_t pcf857x_irq(int irq, void *data)
  */
 static void noop(struct irq_data *data) { }
 
-static unsigned int noop_ret(struct irq_data *data)
+static int pcf857x_irq_set_wake(struct irq_data *data, unsigned int on)
 {
+	struct pcf857x *gpio = irq_data_get_irq_chip_data(data);
+
+	irq_set_irq_wake(gpio->client->irq, on);
 	return 0;
 }
 
-static int pcf857x_irq_set_wake(struct irq_data *data, unsigned int on)
+static void pcf857x_irq_enable(struct irq_data *data)
 {
 	struct pcf857x *gpio = irq_data_get_irq_chip_data(data);
 
-	irq_set_irq_wake(gpio->client->irq, on);
-	return 0;
+	gpio->irq_enabled |= (1 << data->hwirq);
+}
+
+static void pcf857x_irq_disable(struct irq_data *data)
+{
+	struct pcf857x *gpio = irq_data_get_irq_chip_data(data);
+
+	gpio->irq_enabled &= ~(1 << data->hwirq);
+}
+
+static void pcf857x_irq_bus_lock(struct irq_data *data)
+{
+	struct pcf857x *gpio = irq_data_get_irq_chip_data(data);
+
+	mutex_lock(&gpio->lock);
+}
+
+static void pcf857x_irq_bus_sync_unlock(struct irq_data *data)
+{
+	struct pcf857x *gpio = irq_data_get_irq_chip_data(data);
+
+	mutex_unlock(&gpio->lock);
 }
 
 static struct irq_chip pcf857x_irq_chip = {
 	.name		= "pcf857x",
-	.irq_startup	= noop_ret,
-	.irq_shutdown	= noop,
-	.irq_enable	= noop,
-	.irq_disable	= noop,
+	.irq_enable	= pcf857x_irq_enable,
+	.irq_disable	= pcf857x_irq_disable,
 	.irq_ack	= noop,
 	.irq_mask	= noop,
 	.irq_unmask	= noop,
 	.irq_set_wake	= pcf857x_irq_set_wake,
+	.irq_bus_lock		= pcf857x_irq_bus_lock,
+	.irq_bus_sync_unlock	= pcf857x_irq_bus_sync_unlock,
 };
 
 /*-------------------------------------------------------------------------*/
-- 
1.9.1

