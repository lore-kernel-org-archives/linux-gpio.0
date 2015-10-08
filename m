From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [RFC/PATCH 2/2] gpio: pcf857x: Add PCA9621 support
Date: Thu,  8 Oct 2015 21:32:32 +0300
Message-ID: <1444329152-11946-3-git-send-email-laurent.pinchart@ideasonboard.com>
References: <1444329152-11946-1-git-send-email-laurent.pinchart@ideasonboard.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:51283 "EHLO
	galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754712AbbJHScf (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 8 Oct 2015 14:32:35 -0400
In-Reply-To: <1444329152-11946-1-git-send-email-laurent.pinchart@ideasonboard.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Alexandre Courbot <gnurou@gmail.com>, Linus Walleij <linus.walleij@linaro.org>

The PCA9621 is an I2C 8-bit output open-drain expander. The driver has
to be adapted to support open-drain outputs as the register bit values
are inverted compared to currently supported chips.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/gpio/gpio-pcf857x.c | 41 ++++++++++++++++++++++++++++++++++++-----
 1 file changed, 36 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpio-pcf857x.c b/drivers/gpio/gpio-pcf857x.c
index 404f3c61ef9b..24788f2da93b 100644
--- a/drivers/gpio/gpio-pcf857x.c
+++ b/drivers/gpio/gpio-pcf857x.c
@@ -31,6 +31,9 @@
 #include <linux/slab.h>
 #include <linux/spinlock.h>
 
+#define PCF857X_FLAG_OPEN_DRAIN		(1 << 8)
+#define PCF857X_FLAGS_MASK		(0xff << 8)
+#define PCF857X_INPUTS_MASK		0xff
 
 static const struct i2c_device_id pcf857x_id[] = {
 	{ "pcf8574", 8 },
@@ -41,6 +44,7 @@ static const struct i2c_device_id pcf857x_id[] = {
 	{ "pca9674", 8 },
 	{ "pcf8575", 16 },
 	{ "pca8575", 16 },
+	{ "pca9621", 8 | OPEN_DRAIN },
 	{ "pca9671", 16 },
 	{ "pca9673", 16 },
 	{ "pca9675", 16 },
@@ -56,6 +60,7 @@ static const struct of_device_id pcf857x_of_table[] = {
 	{ .compatible = "nxp,pcf8574" },
 	{ .compatible = "nxp,pcf8574a" },
 	{ .compatible = "nxp,pca8574" },
+	{ .compatible = "nxp,pca9621" },
 	{ .compatible = "nxp,pca9670" },
 	{ .compatible = "nxp,pca9672" },
 	{ .compatible = "nxp,pca9674" },
@@ -93,6 +98,7 @@ struct pcf857x {
 	unsigned		status;		/* current status */
 	unsigned int		irq_parent;
 	unsigned		irq_enabled;	/* enabled irqs */
+	unsigned		flags;
 
 	int (*write)(struct i2c_client *client, unsigned data);
 	int (*read)(struct i2c_client *client);
@@ -142,7 +148,10 @@ static int pcf857x_input(struct gpio_chip *chip, unsigned offset)
 	int		status;
 
 	mutex_lock(&gpio->lock);
-	gpio->out |= (1 << offset);
+	if (gpio->flags & PCF857X_FLAG_OPEN_DRAIN)
+		gpio->out &= ~(1 << offset);
+	else
+		gpio->out |= (1 << offset);
 	status = gpio->write(gpio->client, gpio->out);
 	mutex_unlock(&gpio->lock);
 
@@ -155,7 +164,13 @@ static int pcf857x_get(struct gpio_chip *chip, unsigned offset)
 	int		value;
 
 	value = gpio->read(gpio->client);
-	return (value < 0) ? 0 : (value & (1 << offset));
+	if (value < 0)
+		return 0;
+
+	if (gpio->flags & PCF857X_FLAG_OPEN_DRAIN)
+		return !(value & (1 << offset));
+	else
+		return value & (1 << offset);
 }
 
 static int pcf857x_output(struct gpio_chip *chip, unsigned offset, int value)
@@ -164,6 +179,17 @@ static int pcf857x_output(struct gpio_chip *chip, unsigned offset, int value)
 	unsigned	bit = 1 << offset;
 	int		status;
 
+	if (gpio->flags & PCF857X_FLAG_OPEN_DRAIN) {
+		/* The output is open-drain and can't be driven high. */
+		if (value)
+			return -EINVAL;
+
+		/* To set the direction to output the register value has to be
+		 * set to 1.
+		 */
+		value = 1;
+	}
+
 	mutex_lock(&gpio->lock);
 	if (value)
 		gpio->out |= bit;
@@ -295,6 +321,8 @@ static int pcf857x_probe(struct i2c_client *client,
 	mutex_init(&gpio->lock);
 	spin_lock_init(&gpio->slock);
 
+	gpio->flags = id->driver_data & PCF857X_FLAGS_MASK;
+
 	gpio->chip.base			= pdata ? pdata->gpio_base : -1;
 	gpio->chip.can_sleep		= true;
 	gpio->chip.dev			= &client->dev;
@@ -303,7 +331,7 @@ static int pcf857x_probe(struct i2c_client *client,
 	gpio->chip.set			= pcf857x_set;
 	gpio->chip.direction_input	= pcf857x_input;
 	gpio->chip.direction_output	= pcf857x_output;
-	gpio->chip.ngpio		= id->driver_data;
+	gpio->chip.ngpio		= id->driver_data & PCF857X_INPUTS_MASK;
 
 	/* NOTE:  the OnSemi jlc1562b is also largely compatible with
 	 * these parts, notably for output.  It has a low-resolution
@@ -321,12 +349,15 @@ static int pcf857x_probe(struct i2c_client *client,
 		gpio->read	= i2c_read_le8;
 
 		if (!i2c_check_functionality(client->adapter,
-				I2C_FUNC_SMBUS_BYTE))
+				I2C_FUNC_SMBUS_BYTE)) {
 			status = -EIO;
 
 		/* fail if there's no chip present */
-		else
+		} else {
 			status = i2c_smbus_read_byte(client);
+			if (gpio->flags & PCF857X_FLAG_OPEN_DRAIN)
+				n_latch = status;
+		}
 
 	/* '75/'75c addresses are 0x20..0x27, just like the '74;
 	 * the '75c doesn't have a current source pulling high.
-- 
2.4.9

