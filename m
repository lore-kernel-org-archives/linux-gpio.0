From: Sonic Zhang <sonic.adi@gmail.com>
Subject: [PATCH] gpio: make driver mcp23s08 to support both device tree and platform data
Date: Wed, 20 Aug 2014 17:57:58 +0800
Message-ID: <1408528678-22214-1-git-send-email-sonic.adi@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-bn1lp0140.outbound.protection.outlook.com ([207.46.163.140]:32899
	"EHLO na01-bn1-obe.outbound.protection.outlook.com"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1751640AbaHTJ6h (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Wed, 20 Aug 2014 05:58:37 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: linux-gpio@vger.kernel.org, adi-buildroot-devel@lists.sourceforge.net, Sonic Zhang <sonic.zhang@analog.com>

From: Sonic Zhang <sonic.zhang@analog.com>

Device tree is not enabled in some archtecture where gpio driver mcp23s08
is still required.

Signed-off-by: Sonic Zhang <sonic.zhang@analog.com>
---
 drivers/gpio/Kconfig         |  1 -
 drivers/gpio/gpio-mcp23s08.c | 29 +++++++++++++++++++++++------
 include/linux/spi/mcp23s08.h | 18 ++++++++++++++++++
 3 files changed, 41 insertions(+), 7 deletions(-)

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
index 6f183d9..867e8c5 100644
--- a/drivers/gpio/gpio-mcp23s08.c
+++ b/drivers/gpio/gpio-mcp23s08.c
@@ -479,8 +479,13 @@ static int mcp23s08_irq_setup(struct mcp23s08 *mcp)
 
 	mutex_init(&mcp->irq_lock);
 
+#ifdef CONFIG_OF
 	mcp->irq_domain = irq_domain_add_linear(chip->of_node, chip->ngpio,
 						&irq_domain_simple_ops, mcp);
+#else
+	mcp->irq_domain = irq_domain_add_linear(NULL, chip->ngpio,
+						&irq_domain_simple_ops, mcp);
+#endif
 	if (!mcp->irq_domain)
 		return -ENODEV;
 
@@ -581,7 +586,9 @@ done:
 
 static int mcp23s08_probe_one(struct mcp23s08 *mcp, struct device *dev,
 			      void *data, unsigned addr, unsigned type,
-			      unsigned base, unsigned pullups)
+			      unsigned base, unsigned pullups,
+			      const struct of_device_id *match,
+			      struct mcp23s08_platform_data *pdata)
 {
 	int status;
 	bool mirror = false;
@@ -648,11 +655,20 @@ static int mcp23s08_probe_one(struct mcp23s08 *mcp, struct device *dev,
 	if (status < 0)
 		goto fail;
 
-	mcp->irq_controller = of_property_read_bool(mcp->chip.of_node,
+	if (match) {
+#ifdef CONFIG_OF
+		mcp->irq_controller = of_property_read_bool(mcp->chip.of_node,
 						"interrupt-controller");
-	if (mcp->irq && mcp->irq_controller && (type == MCP_TYPE_017))
-		mirror = of_property_read_bool(mcp->chip.of_node,
+		if (mcp->irq && mcp->irq_controller && (type == MCP_TYPE_017))
+			mirror = of_property_read_bool(mcp->chip.of_node,
 						"microchip,irq-mirror");
+#endif
+	} else {
+		mcp->irq_controller = pdata->irq_controller;
+
+		if (mcp->irq && mcp->irq_controller && (type == MCP_TYPE_017))
+			mirror = pdata->mirror;
+	}
 
 	if ((status & IOCON_SEQOP) || !(status & IOCON_HAEN) || mirror) {
 		/* mcp23s17 has IOCON twice, make sure they are in sync */
@@ -795,7 +811,8 @@ static int mcp230xx_probe(struct i2c_client *client,
 
 	mcp->irq = client->irq;
 	status = mcp23s08_probe_one(mcp, &client->dev, client, client->addr,
-				    id->driver_data, base, pullups);
+				    id->driver_data, base, pullups,
+				    match, pdata);
 	if (status)
 		goto fail;
 
@@ -939,7 +956,7 @@ static int mcp23s08_probe(struct spi_device *spi)
 		data->mcp[addr] = &data->chip[chips];
 		status = mcp23s08_probe_one(data->mcp[addr], &spi->dev, spi,
 					    0x40 | (addr << 1), type, base,
-					    pullups[addr]);
+					    pullups[addr], match, pdata);
 		if (status < 0)
 			goto fail;
 
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

