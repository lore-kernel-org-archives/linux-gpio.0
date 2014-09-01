From: Sonic Zhang <sonic.adi@gmail.com>
Subject: [PATCH v3] gpio: make driver mcp23s08 to support both device tree and platform data
Date: Mon, 1 Sep 2014 11:19:52 +0800
Message-ID: <1409541592-27787-1-git-send-email-sonic.adi@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-bn1on0091.outbound.protection.outlook.com ([157.56.110.91]:56146
	"EHLO na01-bn1-obe.outbound.protection.outlook.com"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1750749AbaIAEwx (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Mon, 1 Sep 2014 00:52:53 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: linux-gpio@vger.kernel.org, adi-buildroot-devel@lists.sourceforge.net, Sonic Zhang <sonic.zhang@analog.com>

From: Sonic Zhang <sonic.zhang@analog.com>

Device tree is not enabled in some archtecture where gpio driver mcp23s08
is still required.

Signed-off-by: Sonic Zhang <sonic.zhang@analog.com>
Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>

v2-changes:
- Parse device tree properties into platform data other than individual variables.

v3-changes:
- Use of_node in gpio_chip device structure, because the struct device * always
has an of_node which is NULL when OF is not used.
---
 drivers/gpio/Kconfig         |  1 -
 drivers/gpio/gpio-mcp23s08.c | 64 +++++++++++++++++++++++---------------------
 include/linux/spi/mcp23s08.h | 18 +++++++++++++
 3 files changed, 52 insertions(+), 31 deletions(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 9de1515..f155b6b 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -796,7 +796,6 @@ config GPIO_MAX7301
 
 config GPIO_MCP23S08
 	tristate "Microchip MCP23xxx I/O expander"
-	depends on OF_GPIO
 	depends on (SPI_MASTER && !I2C) || I2C
 	help
 	  SPI/I2C driver for Microchip MCP23S08/MCP23S17/MCP23008/MCP23017
diff --git a/drivers/gpio/gpio-mcp23s08.c b/drivers/gpio/gpio-mcp23s08.c
index 6f183d9..8488e2f 100644
--- a/drivers/gpio/gpio-mcp23s08.c
+++ b/drivers/gpio/gpio-mcp23s08.c
@@ -479,7 +479,7 @@ static int mcp23s08_irq_setup(struct mcp23s08 *mcp)
 
 	mutex_init(&mcp->irq_lock);
 
-	mcp->irq_domain = irq_domain_add_linear(chip->of_node, chip->ngpio,
+	mcp->irq_domain = irq_domain_add_linear(chip->dev->of_node, chip->ngpio,
 						&irq_domain_simple_ops, mcp);
 	if (!mcp->irq_domain)
 		return -ENODEV;
@@ -581,7 +581,7 @@ done:
 
 static int mcp23s08_probe_one(struct mcp23s08 *mcp, struct device *dev,
 			      void *data, unsigned addr, unsigned type,
-			      unsigned base, unsigned pullups)
+			      struct mcp23s08_platform_data *pdata, int cs)
 {
 	int status;
 	bool mirror = false;
@@ -635,7 +635,7 @@ static int mcp23s08_probe_one(struct mcp23s08 *mcp, struct device *dev,
 		return -EINVAL;
 	}
 
-	mcp->chip.base = base;
+	mcp->chip.base = pdata->base;
 	mcp->chip.can_sleep = true;
 	mcp->chip.dev = dev;
 	mcp->chip.owner = THIS_MODULE;
@@ -648,11 +648,9 @@ static int mcp23s08_probe_one(struct mcp23s08 *mcp, struct device *dev,
 	if (status < 0)
 		goto fail;
 
-	mcp->irq_controller = of_property_read_bool(mcp->chip.of_node,
-						"interrupt-controller");
+	mcp->irq_controller = pdata->irq_controller;
 	if (mcp->irq && mcp->irq_controller && (type == MCP_TYPE_017))
-		mirror = of_property_read_bool(mcp->chip.of_node,
-						"microchip,irq-mirror");
+		mirror = pdata->mirror;
 
 	if ((status & IOCON_SEQOP) || !(status & IOCON_HAEN) || mirror) {
 		/* mcp23s17 has IOCON twice, make sure they are in sync */
@@ -668,7 +666,7 @@ static int mcp23s08_probe_one(struct mcp23s08 *mcp, struct device *dev,
 	}
 
 	/* configure ~100K pullups */
-	status = mcp->ops->write(mcp, MCP_GPPU, pullups);
+	status = mcp->ops->write(mcp, MCP_GPPU, pdata->chip[cs].pullups);
 	if (status < 0)
 		goto fail;
 
@@ -768,25 +766,29 @@ MODULE_DEVICE_TABLE(of, mcp23s08_i2c_of_match);
 static int mcp230xx_probe(struct i2c_client *client,
 				    const struct i2c_device_id *id)
 {
-	struct mcp23s08_platform_data *pdata;
+	struct mcp23s08_platform_data *pdata, local_pdata;
 	struct mcp23s08 *mcp;
-	int status, base, pullups;
+	int status;
 	const struct of_device_id *match;
 
 	match = of_match_device(of_match_ptr(mcp23s08_i2c_of_match),
 					&client->dev);
-	pdata = dev_get_platdata(&client->dev);
-	if (match || !pdata) {
-		base = -1;
-		pullups = 0;
+	if (match) {
+		pdata = &local_pdata;
+		pdata->base = -1;
+		pdata->chip[0].pullups = 0;
+		pdata->irq_controller =	of_property_read_bool(
+					client->dev.of_node,
+					"interrupt-controller");
+		pdata->mirror = of_property_read_bool(client->dev.of_node,
+						      "microchip,irq-mirror");
 		client->irq = irq_of_parse_and_map(client->dev.of_node, 0);
 	} else {
-		if (!gpio_is_valid(pdata->base)) {
+		pdata = dev_get_platdata(&client->dev);
+		if (!pdata || !gpio_is_valid(pdata->base)) {
 			dev_dbg(&client->dev, "invalid platform data\n");
 			return -EINVAL;
 		}
-		base = pdata->base;
-		pullups = pdata->chip[0].pullups;
 	}
 
 	mcp = kzalloc(sizeof(*mcp), GFP_KERNEL);
@@ -795,7 +797,7 @@ static int mcp230xx_probe(struct i2c_client *client,
 
 	mcp->irq = client->irq;
 	status = mcp23s08_probe_one(mcp, &client->dev, client, client->addr,
-				    id->driver_data, base, pullups);
+				    id->driver_data, pdata, 0);
 	if (status)
 		goto fail;
 
@@ -863,14 +865,12 @@ static void mcp23s08_i2c_exit(void) { }
 
 static int mcp23s08_probe(struct spi_device *spi)
 {
-	struct mcp23s08_platform_data	*pdata;
+	struct mcp23s08_platform_data	*pdata, local_pdata;
 	unsigned			addr;
 	int				chips = 0;
 	struct mcp23s08_driver_data	*data;
 	int				status, type;
-	unsigned			base = -1,
-					ngpio = 0,
-					pullups[ARRAY_SIZE(pdata->chip)];
+	unsigned			ngpio = 0;
 	const struct			of_device_id *match;
 	u32				spi_present_mask = 0;
 
@@ -893,11 +893,18 @@ static int mcp23s08_probe(struct spi_device *spi)
 			return -ENODEV;
 		}
 
+		pdata = &local_pdata;
+		pdata->base = -1;
 		for (addr = 0; addr < ARRAY_SIZE(pdata->chip); addr++) {
-			pullups[addr] = 0;
+			pdata->chip[addr].pullups = 0;
 			if (spi_present_mask & (1 << addr))
 				chips++;
 		}
+		pdata->irq_controller =	of_property_read_bool(
+					spi->dev.of_node,
+					"interrupt-controller");
+		pdata->mirror = of_property_read_bool(spi->dev.of_node,
+						      "microchip,irq-mirror");
 	} else {
 		type = spi_get_device_id(spi)->driver_data;
 		pdata = dev_get_platdata(&spi->dev);
@@ -917,10 +924,7 @@ static int mcp23s08_probe(struct spi_device *spi)
 				return -EINVAL;
 			}
 			spi_present_mask |= 1 << addr;
-			pullups[addr] = pdata->chip[addr].pullups;
 		}
-
-		base = pdata->base;
 	}
 
 	if (!chips)
@@ -938,13 +942,13 @@ static int mcp23s08_probe(struct spi_device *spi)
 		chips--;
 		data->mcp[addr] = &data->chip[chips];
 		status = mcp23s08_probe_one(data->mcp[addr], &spi->dev, spi,
-					    0x40 | (addr << 1), type, base,
-					    pullups[addr]);
+					    0x40 | (addr << 1), type, pdata,
+					    addr);
 		if (status < 0)
 			goto fail;
 
-		if (base != -1)
-			base += (type == MCP_TYPE_S17) ? 16 : 8;
+		if (pdata->base != -1)
+			pdata->base += (type == MCP_TYPE_S17) ? 16 : 8;
 		ngpio += (type == MCP_TYPE_S17) ? 16 : 8;
 	}
 	data->ngpio = ngpio;
diff --git a/include/linux/spi/mcp23s08.h b/include/linux/spi/mcp23s08.h
index 2d676d5..aa07d7b 100644
--- a/include/linux/spi/mcp23s08.h
+++ b/include/linux/spi/mcp23s08.h
@@ -22,4 +22,22 @@ struct mcp23s08_platform_data {
 	 * base to base+15 (or base+31 for s17 variant).
 	 */
 	unsigned	base;
+	/* Marks the device as a interrupt controller.
+	 * NOTE: The interrupt functionality is only supported for i2c
+	 * versions of the chips. The spi chips can also do the interrupts,
+	 * but this is not supported by the linux driver yet.
+	 */
+	bool		irq_controller;
+
+	/* Sets the mirror flag in the IOCON register. Devices
+	 * with two interrupt outputs (these are the devices ending with 17 and
+	 * those that have 16 IOs) have two IO banks: IO 0-7 form bank 1 and
+	 * IO 8-15 are bank 2. These chips have two different interrupt outputs:
+	 * One for bank 1 and another for bank 2. If irq-mirror is set, both
+	 * interrupts are generated regardless of the bank that an input change
+	 * occurred on. If it is not set, the interrupt are only generated for
+	 * the bank they belong to.
+	 * On devices with only one interrupt output this property is useless.
+	 */
+	bool		mirror;
 };
-- 
1.8.2.3

