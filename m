From: Grygorii Strashko <grygorii.strashko@ti.com>
Subject: [PATCH] gpio: pcf857x: get rid of slock spinlock
Date: Thu, 25 Jun 2015 18:18:11 +0300
Message-ID: <1435245491-18012-1-git-send-email-grygorii.strashko@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from bear.ext.ti.com ([192.94.94.41]:56248 "EHLO bear.ext.ti.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751239AbbFYPSS (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Thu, 25 Jun 2015 11:18:18 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: Sekhar Nori <nsekhar@ti.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Grygorii Strashko <grygorii.strashko@ti.com>, Geert Uytterhoeven <geert+renesas@glider.be>

The spinlock 'slock' is used now to protect pcf857x_irq() from itself
which is unnecessary (especially after switching to use threaded
IRQs). Hence, remove it and use mutex to protect device data in IRQ
handler.

Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Grygorii Strashko <grygorii.strashko@ti.com>
---
 drivers/gpio/gpio-pcf857x.c | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/drivers/gpio/gpio-pcf857x.c b/drivers/gpio/gpio-pcf857x.c
index 404f3c6..1d4d9bc 100644
--- a/drivers/gpio/gpio-pcf857x.c
+++ b/drivers/gpio/gpio-pcf857x.c
@@ -88,7 +88,6 @@ struct pcf857x {
 	struct gpio_chip	chip;
 	struct i2c_client	*client;
 	struct mutex		lock;		/* protect 'out' */
-	spinlock_t		slock;		/* protect irq demux */
 	unsigned		out;		/* software latch */
 	unsigned		status;		/* current status */
 	unsigned int		irq_parent;
@@ -185,23 +184,21 @@ static void pcf857x_set(struct gpio_chip *chip, unsigned offset, int value)
 static irqreturn_t pcf857x_irq(int irq, void *data)
 {
 	struct pcf857x  *gpio = data;
-	unsigned long change, i, status, flags;
+	unsigned long change, i, status;
 
 	status = gpio->read(gpio->client);
 
-	spin_lock_irqsave(&gpio->slock, flags);
-
 	/*
 	 * call the interrupt handler iff gpio is used as
 	 * interrupt source, just to avoid bad irqs
 	 */
-
+	mutex_lock(&gpio->lock);
 	change = (gpio->status ^ status) & gpio->irq_enabled;
-	for_each_set_bit(i, &change, gpio->chip.ngpio)
-		handle_nested_irq(irq_find_mapping(gpio->chip.irqdomain, i));
 	gpio->status = status;
+	mutex_unlock(&gpio->lock);
 
-	spin_unlock_irqrestore(&gpio->slock, flags);
+	for_each_set_bit(i, &change, gpio->chip.ngpio)
+		handle_nested_irq(irq_find_mapping(gpio->chip.irqdomain, i));
 
 	return IRQ_HANDLED;
 }
@@ -293,7 +290,6 @@ static int pcf857x_probe(struct i2c_client *client,
 		return -ENOMEM;
 
 	mutex_init(&gpio->lock);
-	spin_lock_init(&gpio->slock);
 
 	gpio->chip.base			= pdata ? pdata->gpio_base : -1;
 	gpio->chip.can_sleep		= true;
-- 
2.4.4

