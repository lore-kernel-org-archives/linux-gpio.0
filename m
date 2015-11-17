From: William Breathitt Gray <vilhelm.gray@gmail.com>
Subject: [PATCH v2] gpio: 104-idio-16: Use lowercase symbol names for const
 variables
Date: Tue, 17 Nov 2015 18:58:16 -0500
Message-ID: <20151117235815.GA9477@sophia>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-yk0-f177.google.com ([209.85.160.177]:34354 "EHLO
	mail-yk0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753953AbbKQX6Z (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 17 Nov 2015 18:58:25 -0500
Content-Disposition: inline
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org, gnurou@gmail.com
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org

To prevent confusion, and to match the existing coding style used in
other GPIO drivers, symbol names within the 104-idio-16 GPIO driver
should be lowercase.

Signed-off-by: William Breathitt Gray <vilhelm.gray@gmail.com>
Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
---
Changes in v2:
  - Rebase to resolve conflict with commit 68d33ef.
  - Lowercase const variables introduced in commit 68d33ef.
  - Utilize BIT macro to match coding style of commit 68d33ef.

 drivers/gpio/gpio-104-idio-16.c | 37 ++++++++++++++++++-------------------
 1 file changed, 18 insertions(+), 19 deletions(-)

diff --git a/drivers/gpio/gpio-104-idio-16.c b/drivers/gpio/gpio-104-idio-16.c
index 4e8adee..81b6904 100644
--- a/drivers/gpio/gpio-104-idio-16.c
+++ b/drivers/gpio/gpio-104-idio-16.c
@@ -80,21 +80,21 @@ static struct idio_16_gpio *to_idio16gpio(struct gpio_chip *gc)
 static int idio_16_gpio_get(struct gpio_chip *chip, unsigned offset)
 {
 	struct idio_16_gpio *const idio16gpio = to_idio16gpio(chip);
-	const unsigned BIT_MASK = 1U << (offset-16);
+	const unsigned mask = BIT(offset-16);
 
 	if (offset < 16)
 		return -EINVAL;
 
 	if (offset < 24)
-		return !!(inb(idio16gpio->base + 1) & BIT_MASK);
+		return !!(inb(idio16gpio->base + 1) & mask);
 
-	return !!(inb(idio16gpio->base + 5) & (BIT_MASK>>8));
+	return !!(inb(idio16gpio->base + 5) & (mask>>8));
 }
 
 static void idio_16_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
 {
 	struct idio_16_gpio *const idio16gpio = to_idio16gpio(chip);
-	const unsigned BIT_MASK = 1U << offset;
+	const unsigned mask = BIT(offset);
 	unsigned long flags;
 
 	if (offset > 15)
@@ -103,9 +103,9 @@ static void idio_16_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
 	spin_lock_irqsave(&idio16gpio->lock, flags);
 
 	if (value)
-		idio16gpio->out_state |= BIT_MASK;
+		idio16gpio->out_state |= mask;
 	else
-		idio16gpio->out_state &= ~BIT_MASK;
+		idio16gpio->out_state &= ~mask;
 
 	if (offset > 7)
 		outb(idio16gpio->out_state >> 8, idio16gpio->base + 4);
@@ -200,25 +200,24 @@ static int __init idio_16_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct idio_16_gpio *idio16gpio;
+	const unsigned base = idio_16_base;
+	const unsigned extent = 8;
+	const char *const name = dev_name(dev);
 	int err;
-
-	const unsigned BASE = idio_16_base;
-	const unsigned EXTENT = 8;
-	const unsigned IRQ = idio_16_irq;
-	const char *const NAME = dev_name(dev);
+	const unsigned irq = idio_16_irq;
 
 	idio16gpio = devm_kzalloc(dev, sizeof(*idio16gpio), GFP_KERNEL);
 	if (!idio16gpio)
 		return -ENOMEM;
 
-	if (!request_region(BASE, EXTENT, NAME)) {
+	if (!request_region(base, extent, name)) {
 		dev_err(dev, "Unable to lock %s port addresses (0x%X-0x%X)\n",
-			NAME, BASE, BASE + EXTENT);
+			name, base, base + extent);
 		err = -EBUSY;
 		goto err_lock_io_port;
 	}
 
-	idio16gpio->chip.label = NAME;
+	idio16gpio->chip.label = name;
 	idio16gpio->chip.parent = dev;
 	idio16gpio->chip.owner = THIS_MODULE;
 	idio16gpio->chip.base = -1;
@@ -228,9 +227,9 @@ static int __init idio_16_probe(struct platform_device *pdev)
 	idio16gpio->chip.direction_output = idio_16_gpio_direction_output;
 	idio16gpio->chip.get = idio_16_gpio_get;
 	idio16gpio->chip.set = idio_16_gpio_set;
-	idio16gpio->base = BASE;
-	idio16gpio->extent = EXTENT;
-	idio16gpio->irq = IRQ;
+	idio16gpio->base = base;
+	idio16gpio->extent = extent;
+	idio16gpio->irq = irq;
 	idio16gpio->out_state = 0xFFFF;
 
 	spin_lock_init(&idio16gpio->lock);
@@ -250,7 +249,7 @@ static int __init idio_16_probe(struct platform_device *pdev)
 		goto err_gpiochip_irqchip_add;
 	}
 
-	err = request_irq(IRQ, idio_16_irq_handler, 0, NAME, idio16gpio);
+	err = request_irq(irq, idio_16_irq_handler, 0, name, idio16gpio);
 	if (err) {
 		dev_err(dev, "IRQ handler registering failed (%d)\n", err);
 		goto err_request_irq;
@@ -262,7 +261,7 @@ err_request_irq:
 err_gpiochip_irqchip_add:
 	gpiochip_remove(&idio16gpio->chip);
 err_gpio_register:
-	release_region(BASE, EXTENT);
+	release_region(base, extent);
 err_lock_io_port:
 	return err;
 }
-- 
2.4.10

