From: William Breathitt Gray <vilhelm.gray@gmail.com>
Subject: [PATCH] gpio: 104-idio-16: Use lowercase symbol names for const
 variables
Date: Wed, 4 Nov 2015 07:30:08 -0500
Message-ID: <20151104123008.GA15302@sophia>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-yk0-f176.google.com ([209.85.160.176]:33382 "EHLO
	mail-yk0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754522AbbKDMaR (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 4 Nov 2015 07:30:17 -0500
Content-Disposition: inline
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org, gnurou@gmail.com
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org

To prevent confusion and to match existing coding style used in other
gpio drivers symbol names within the 104-idio-16 gpio driver should be
lowercase.

Signed-off-by: William Breathitt Gray <vilhelm.gray@gmail.com>
---
 drivers/gpio/gpio-104-idio-16.c | 31 +++++++++++++++----------------
 1 file changed, 15 insertions(+), 16 deletions(-)

diff --git a/drivers/gpio/gpio-104-idio-16.c b/drivers/gpio/gpio-104-idio-16.c
index 5400d7d..dbb1d38 100644
--- a/drivers/gpio/gpio-104-idio-16.c
+++ b/drivers/gpio/gpio-104-idio-16.c
@@ -70,21 +70,21 @@ static struct idio_16_gpio *to_idio16gpio(struct gpio_chip *gc)
 static int idio_16_gpio_get(struct gpio_chip *chip, unsigned offset)
 {
 	struct idio_16_gpio *const idio16gpio = to_idio16gpio(chip);
-	const unsigned BIT_MASK = 1U << (offset-16);
+	const unsigned mask = 1U << (offset-16);
 
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
+	const unsigned mask = 1U << offset;
 	unsigned long flags;
 
 	if (offset > 15)
@@ -93,9 +93,9 @@ static void idio_16_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
 	spin_lock_irqsave(&idio16gpio->lock, flags);
 
 	if (value)
-		idio16gpio->out_state |= BIT_MASK;
+		idio16gpio->out_state |= mask;
 	else
-		idio16gpio->out_state &= ~BIT_MASK;
+		idio16gpio->out_state &= ~mask;
 
 	if (offset > 7)
 		outb(idio16gpio->out_state >> 8, idio16gpio->base + 4);
@@ -109,24 +109,23 @@ static int __init idio_16_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct idio_16_gpio *idio16gpio;
+	const unsigned base = idio_16_base;
+	const unsigned extent = 8;
+	const char *const name = dev_name(dev);
 	int err;
 
-	const unsigned BASE = idio_16_base;
-	const unsigned EXTENT = 8;
-	const char *const NAME = dev_name(dev);
-
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
 	idio16gpio->chip.dev = dev;
 	idio16gpio->chip.owner = THIS_MODULE;
 	idio16gpio->chip.base = -1;
@@ -136,8 +135,8 @@ static int __init idio_16_probe(struct platform_device *pdev)
 	idio16gpio->chip.direction_output = idio_16_gpio_direction_output;
 	idio16gpio->chip.get = idio_16_gpio_get;
 	idio16gpio->chip.set = idio_16_gpio_set;
-	idio16gpio->base = BASE;
-	idio16gpio->extent = EXTENT;
+	idio16gpio->base = base;
+	idio16gpio->extent = extent;
 	idio16gpio->out_state = 0xFFFF;
 
 	spin_lock_init(&idio16gpio->lock);
@@ -153,7 +152,7 @@ static int __init idio_16_probe(struct platform_device *pdev)
 	return 0;
 
 err_gpio_register:
-	release_region(BASE, EXTENT);
+	release_region(base, extent);
 err_lock_io_port:
 	return err;
 }
-- 
2.4.10

