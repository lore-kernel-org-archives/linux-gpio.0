From: Roger Quadros <rogerq@ti.com>
Subject: [PATCH] gpio: pcf857x: Fix interrupts on multiple instances
Date: Wed, 9 Jan 2019 11:11:24 +0200
Message-ID: <1547025084-16999-1-git-send-email-rogerq@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <stable-owner@vger.kernel.org>
Sender: stable-owner@vger.kernel.org
To: linus.walleij@linaro.org, bgolaszewski@baylibre.com
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Roger Quadros <rogerq@ti.com>, "Stable # 4 . 20+" <stable@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

When multiple instances of pcf857x chips are present, a fix up
message [1] is printed during the probe of the 2nd and later
instances.

The issue is that the driver is using the same irq_chip data
structure between multiple instances.

Fix this by allocating the irq_chip data structure per instance.

[1] fix up message addressed by this patch
[    1.212100] gpio gpiochip9: (pcf8575): detected irqchip that is shared with multiple gpiochips: please fix the driver.

Cc: Stable <stable@vger.kernel.org> # 4.20+
Signed-off-by: Roger Quadros <rogerq@ti.com>
---
 drivers/gpio/gpio-pcf857x.c | 26 ++++++++++++--------------
 1 file changed, 12 insertions(+), 14 deletions(-)

diff --git a/drivers/gpio/gpio-pcf857x.c b/drivers/gpio/gpio-pcf857x.c
index adf72dd..68a35b6 100644
--- a/drivers/gpio/gpio-pcf857x.c
+++ b/drivers/gpio/gpio-pcf857x.c
@@ -84,6 +84,7 @@ MODULE_DEVICE_TABLE(of, pcf857x_of_table);
  */
 struct pcf857x {
 	struct gpio_chip	chip;
+	struct irq_chip		irqchip;
 	struct i2c_client	*client;
 	struct mutex		lock;		/* protect 'out' */
 	unsigned		out;		/* software latch */
@@ -252,18 +253,6 @@ static void pcf857x_irq_bus_sync_unlock(struct irq_data *data)
 	mutex_unlock(&gpio->lock);
 }
 
-static struct irq_chip pcf857x_irq_chip = {
-	.name		= "pcf857x",
-	.irq_enable	= pcf857x_irq_enable,
-	.irq_disable	= pcf857x_irq_disable,
-	.irq_ack	= noop,
-	.irq_mask	= noop,
-	.irq_unmask	= noop,
-	.irq_set_wake	= pcf857x_irq_set_wake,
-	.irq_bus_lock		= pcf857x_irq_bus_lock,
-	.irq_bus_sync_unlock	= pcf857x_irq_bus_sync_unlock,
-};
-
 /*-------------------------------------------------------------------------*/
 
 static int pcf857x_probe(struct i2c_client *client,
@@ -376,8 +365,17 @@ static int pcf857x_probe(struct i2c_client *client,
 
 	/* Enable irqchip if we have an interrupt */
 	if (client->irq) {
+		gpio->irqchip.name = "pcf857x",
+		gpio->irqchip.irq_enable = pcf857x_irq_enable,
+		gpio->irqchip.irq_disable = pcf857x_irq_disable,
+		gpio->irqchip.irq_ack = noop,
+		gpio->irqchip.irq_mask = noop,
+		gpio->irqchip.irq_unmask = noop,
+		gpio->irqchip.irq_set_wake = pcf857x_irq_set_wake,
+		gpio->irqchip.irq_bus_lock = pcf857x_irq_bus_lock,
+		gpio->irqchip.irq_bus_sync_unlock = pcf857x_irq_bus_sync_unlock,
 		status = gpiochip_irqchip_add_nested(&gpio->chip,
-						     &pcf857x_irq_chip,
+						     &gpio->irqchip,
 						     0, handle_level_irq,
 						     IRQ_TYPE_NONE);
 		if (status) {
@@ -392,7 +390,7 @@ static int pcf857x_probe(struct i2c_client *client,
 		if (status)
 			goto fail;
 
-		gpiochip_set_nested_irqchip(&gpio->chip, &pcf857x_irq_chip,
+		gpiochip_set_nested_irqchip(&gpio->chip, &gpio->irqchip,
 					    client->irq);
 		gpio->irq_parent = client->irq;
 	}
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
