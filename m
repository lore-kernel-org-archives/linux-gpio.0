From: Sebastian Reichel <sebastian.reichel@collabora.co.uk>
Subject: [PATCHv3 11/14] pinctrl: mcp23s08: generalize irq property handling
Date: Mon, 15 May 2017 11:24:35 +0200
Message-ID: <20170515092438.13076-12-sebastian.reichel@collabora.co.uk>
References: <20170515092438.13076-1-sebastian.reichel@collabora.co.uk>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170515092438.13076-1-sebastian.reichel@collabora.co.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Sebastian Reichel <sre@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Steven Miao <realmz6@gmail.com>, Vladimir Zapolskiy <vz@mleia.com>, Sylvain Lemieux <slemieux.tyco@gmail.com>
Cc: Enric Balletbo i Serra <enric.balletbo@collabora.co.uk>, linux-gpio@vger.kernel.org, adi-buildroot-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, Sebastian Reichel <sebastian.reichel@collabora.co.uk>
List-Id: linux-gpio@vger.kernel.org

This moves irq property handling from spi/i2c specific code into
the generic mcp23s08_probe_one. This is possible because the
device properties are named equally.

As a side-effect this drops support for setting the properties via
pdata, which has no mainline users. If boardcode wants to enable
the chip as interrupt controller it can attach the device properties
instead.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.co.uk>
---
 drivers/pinctrl/pinctrl-mcp23s08.c | 27 +++++++++------------------
 include/linux/spi/mcp23s08.h       | 18 ------------------
 2 files changed, 9 insertions(+), 36 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-mcp23s08.c b/drivers/pinctrl/pinctrl-mcp23s08.c
index 541bf80a2a13..b39da587f2fa 100644
--- a/drivers/pinctrl/pinctrl-mcp23s08.c
+++ b/drivers/pinctrl/pinctrl-mcp23s08.c
@@ -783,7 +783,7 @@ static void mcp23s08_dbg_show(struct seq_file *s, struct gpio_chip *chip)
 
 static int mcp23s08_probe_one(struct mcp23s08 *mcp, struct device *dev,
 			      void *data, unsigned addr, unsigned type,
-			      struct mcp23s08_platform_data *pdata, int cs)
+			      unsigned int base, int cs)
 {
 	int status, ret;
 	bool mirror = false;
@@ -855,7 +855,7 @@ static int mcp23s08_probe_one(struct mcp23s08 *mcp, struct device *dev,
 	if (IS_ERR(mcp->regmap))
 		return PTR_ERR(mcp->regmap);
 
-	mcp->chip.base = pdata->base;
+	mcp->chip.base = base;
 	mcp->chip.can_sleep = true;
 	mcp->chip.parent = dev;
 	mcp->chip.owner = THIS_MODULE;
@@ -868,13 +868,14 @@ static int mcp23s08_probe_one(struct mcp23s08 *mcp, struct device *dev,
 	if (ret < 0)
 		goto fail;
 
-	mcp->irq_controller = pdata->irq_controller;
+	mcp->irq_controller =
+		device_property_read_bool(dev, "interrupt-controller");
 	if (mcp->irq && mcp->irq_controller) {
 		mcp->irq_active_high =
-			of_property_read_bool(mcp->chip.parent->of_node,
+			device_property_read_bool(dev,
 					      "microchip,irq-active-high");
 
-		mirror = pdata->mirror;
+		mirror = device_property_read_bool(dev, "microchip,irq-mirror");
 	}
 
 	if ((status & IOCON_SEQOP) || !(status & IOCON_HAEN) || mirror ||
@@ -1000,11 +1001,6 @@ static int mcp230xx_probe(struct i2c_client *client,
 	if (!pdata) {
 		pdata = &local_pdata;
 		pdata->base = -1;
-
-		pdata->irq_controller = device_property_read_bool(
-			&client->dev, "interrupt-controller");
-		pdata->mirror = device_property_read_bool(
-			&client->dev, "microchip,irq-mirror");
 	}
 
 	mcp = devm_kzalloc(&client->dev, sizeof(*mcp), GFP_KERNEL);
@@ -1013,7 +1009,7 @@ static int mcp230xx_probe(struct i2c_client *client,
 
 	mcp->irq = client->irq;
 	status = mcp23s08_probe_one(mcp, &client->dev, client, client->addr,
-				    id->driver_data, pdata, 0);
+				    id->driver_data, pdata->base, 0);
 	if (status)
 		return status;
 
@@ -1081,11 +1077,6 @@ static int mcp23s08_probe(struct spi_device *spi)
 		pdata = &local_pdata;
 		pdata->base = -1;
 
-		pdata->irq_controller = device_property_read_bool(&spi->dev,
-			"interrupt-controller");
-		pdata->mirror = device_property_read_bool(&spi->dev,
-			"microchip,irq-mirror");
-
 		status = device_property_read_u32(&spi->dev,
 			"microchip,spi-present-mask", &spi_present_mask);
 		if (status) {
@@ -1138,8 +1129,8 @@ static int mcp23s08_probe(struct spi_device *spi)
 		data->mcp[addr] = &data->chip[chips];
 		data->mcp[addr]->irq = spi->irq;
 		status = mcp23s08_probe_one(data->mcp[addr], &spi->dev, spi,
-					    0x40 | (addr << 1), type, pdata,
-					    addr);
+					    0x40 | (addr << 1), type,
+					    pdata->base, addr);
 		if (status < 0)
 			return status;
 
diff --git a/include/linux/spi/mcp23s08.h b/include/linux/spi/mcp23s08.h
index 080ecc6bb270..4af82ee63329 100644
--- a/include/linux/spi/mcp23s08.h
+++ b/include/linux/spi/mcp23s08.h
@@ -21,22 +21,4 @@ struct mcp23s08_platform_data {
 	 * base to base+15 (or base+31 for s17 variant).
 	 */
 	unsigned	base;
-	/* Marks the device as a interrupt controller.
-	 * NOTE: The interrupt functionality is only supported for i2c
-	 * versions of the chips. The spi chips can also do the interrupts,
-	 * but this is not supported by the linux driver yet.
-	 */
-	bool		irq_controller;
-
-	/* Sets the mirror flag in the IOCON register. Devices
-	 * with two interrupt outputs (these are the devices ending with 17 and
-	 * those that have 16 IOs) have two IO banks: IO 0-7 form bank 1 and
-	 * IO 8-15 are bank 2. These chips have two different interrupt outputs:
-	 * One for bank 1 and another for bank 2. If irq-mirror is set, both
-	 * interrupts are generated regardless of the bank that an input change
-	 * occurred on. If it is not set, the interrupt are only generated for
-	 * the bank they belong to.
-	 * On devices with only one interrupt output this property is useless.
-	 */
-	bool		mirror;
 };
-- 
2.11.0
