From: Sebastian Reichel <sre@kernel.org>
Subject: [PATCH 1/2] gpio: mcp23s08: use regmap
Date: Fri, 27 Jan 2017 15:47:37 +0100
Message-ID: <20170127144738.21107-2-sre@kernel.org>
References: <20170127144738.21107-1-sre@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170127144738.21107-1-sre@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Sebastian Reichel <sre@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

Use regmap API to save some lines of codes and have
debugfs support for all of the MCP's registers.

Signed-off-by: Sebastian Reichel <sre@kernel.org>
---
 drivers/gpio/gpio-mcp23s08.c | 320 ++++++++++++++++++-------------------------
 1 file changed, 130 insertions(+), 190 deletions(-)

diff --git a/drivers/gpio/gpio-mcp23s08.c b/drivers/gpio/gpio-mcp23s08.c
index 504550665091..bdb692345428 100644
--- a/drivers/gpio/gpio-mcp23s08.c
+++ b/drivers/gpio/gpio-mcp23s08.c
@@ -23,6 +23,7 @@
 #include <linux/interrupt.h>
 #include <linux/of_irq.h>
 #include <linux/of_device.h>
+#include <linux/regmap.h>
 
 /**
  * MCP types supported by driver
@@ -58,16 +59,10 @@
 
 struct mcp23s08;
 
-struct mcp23s08_ops {
-	int	(*read)(struct mcp23s08 *mcp, unsigned reg);
-	int	(*write)(struct mcp23s08 *mcp, unsigned reg, unsigned val);
-	int	(*read_regs)(struct mcp23s08 *mcp, unsigned reg,
-			     u16 *vals, unsigned n);
-};
-
 struct mcp23s08 {
 	u8			addr;
 	bool			irq_active_high;
+	bool			reg_shift;
 
 	u16			cache[11];
 	u16			irq_rise;
@@ -80,188 +75,126 @@ struct mcp23s08 {
 
 	struct gpio_chip	chip;
 
-	const struct mcp23s08_ops	*ops;
-	void			*data; /* ops specific data */
+	struct regmap		*regmap;
+	struct device		*dev;
 };
 
-/* A given spi_device can represent up to eight mcp23sxx chips
- * sharing the same chipselect but using different addresses
- * (e.g. chips #0 and #3 might be populated, but not #1 or $2).
- * Driver data holds all the per-chip data.
- */
-struct mcp23s08_driver_data {
-	unsigned		ngpio;
-	struct mcp23s08		*mcp[8];
-	struct mcp23s08		chip[];
-};
+static const struct regmap_config mcp23x08_regmap = {
+	.reg_bits = 8,
+	.val_bits = 8,
 
-/*----------------------------------------------------------------------*/
-
-#if IS_ENABLED(CONFIG_I2C)
-
-static int mcp23008_read(struct mcp23s08 *mcp, unsigned reg)
-{
-	return i2c_smbus_read_byte_data(mcp->data, reg);
-}
-
-static int mcp23008_write(struct mcp23s08 *mcp, unsigned reg, unsigned val)
-{
-	return i2c_smbus_write_byte_data(mcp->data, reg, val);
-}
-
-static int
-mcp23008_read_regs(struct mcp23s08 *mcp, unsigned reg, u16 *vals, unsigned n)
-{
-	while (n--) {
-		int ret = mcp23008_read(mcp, reg++);
-		if (ret < 0)
-			return ret;
-		*vals++ = ret;
-	}
-
-	return 0;
-}
-
-static int mcp23017_read(struct mcp23s08 *mcp, unsigned reg)
-{
-	return i2c_smbus_read_word_data(mcp->data, reg << 1);
-}
-
-static int mcp23017_write(struct mcp23s08 *mcp, unsigned reg, unsigned val)
-{
-	return i2c_smbus_write_word_data(mcp->data, reg << 1, val);
-}
-
-static int
-mcp23017_read_regs(struct mcp23s08 *mcp, unsigned reg, u16 *vals, unsigned n)
-{
-	while (n--) {
-		int ret = mcp23017_read(mcp, reg++);
-		if (ret < 0)
-			return ret;
-		*vals++ = ret;
-	}
-
-	return 0;
-}
-
-static const struct mcp23s08_ops mcp23008_ops = {
-	.read		= mcp23008_read,
-	.write		= mcp23008_write,
-	.read_regs	= mcp23008_read_regs,
+	.reg_stride = 1,
+	.max_register = MCP_OLAT,
 };
 
-static const struct mcp23s08_ops mcp23017_ops = {
-	.read		= mcp23017_read,
-	.write		= mcp23017_write,
-	.read_regs	= mcp23017_read_regs,
-};
+static const struct regmap_config mcp23x17_regmap = {
+	.reg_bits = 8,
+	.val_bits = 16,
 
-#endif /* CONFIG_I2C */
+	.reg_stride = 2,
+	.max_register = MCP_OLAT << 1,
+	.val_format_endian = REGMAP_ENDIAN_LITTLE,
+};
 
 /*----------------------------------------------------------------------*/
 
 #ifdef CONFIG_SPI_MASTER
 
-static int mcp23s08_read(struct mcp23s08 *mcp, unsigned reg)
+static int mcp23sxx_spi_write(void *context, const void *data, size_t count)
 {
-	u8	tx[2], rx[1];
-	int	status;
+	struct mcp23s08 *mcp = context;
+	struct spi_device *spi = to_spi_device(mcp->dev);
+	struct spi_message m;
+	struct spi_transfer t[2] = { { .tx_buf = &mcp->addr, .len = 1, },
+				     { .tx_buf = data, .len = count, }, };
 
-	tx[0] = mcp->addr | 0x01;
-	tx[1] = reg;
-	status = spi_write_then_read(mcp->data, tx, sizeof(tx), rx, sizeof(rx));
-	return (status < 0) ? status : rx[0];
+	spi_message_init(&m);
+	spi_message_add_tail(&t[0], &m);
+	spi_message_add_tail(&t[1], &m);
+
+	return spi_sync(spi, &m);
 }
 
-static int mcp23s08_write(struct mcp23s08 *mcp, unsigned reg, unsigned val)
+static int mcp23sxx_spi_gather_write(void *context,
+				const void *reg, size_t reg_size,
+				const void *val, size_t val_size)
 {
-	u8	tx[3];
+	struct mcp23s08 *mcp = context;
+	struct spi_device *spi = to_spi_device(mcp->dev);
+	struct spi_message m;
+	struct spi_transfer t[3] = { { .tx_buf = &mcp->addr, .len = 1, },
+				     { .tx_buf = reg, .len = reg_size, },
+				     { .tx_buf = val, .len = val_size, }, };
 
-	tx[0] = mcp->addr;
-	tx[1] = reg;
-	tx[2] = val;
-	return spi_write_then_read(mcp->data, tx, sizeof(tx), NULL, 0);
+	spi_message_init(&m);
+	spi_message_add_tail(&t[0], &m);
+	spi_message_add_tail(&t[1], &m);
+	spi_message_add_tail(&t[2], &m);
+
+	return spi_sync(spi, &m);
 }
 
-static int
-mcp23s08_read_regs(struct mcp23s08 *mcp, unsigned reg, u16 *vals, unsigned n)
+static int mcp23sxx_spi_read(void *context, const void *reg, size_t reg_size,
+				void *val, size_t val_size)
 {
-	u8	tx[2], *tmp;
-	int	status;
+	struct mcp23s08 *mcp = context;
+	struct spi_device *spi = to_spi_device(mcp->dev);
+	u8 tx[2];
 
-	if ((n + reg) > sizeof(mcp->cache))
+	if (reg_size != 1)
 		return -EINVAL;
+
 	tx[0] = mcp->addr | 0x01;
-	tx[1] = reg;
+	tx[1] = *((u8 *) reg);
 
-	tmp = (u8 *)vals;
-	status = spi_write_then_read(mcp->data, tx, sizeof(tx), tmp, n);
-	if (status >= 0) {
-		while (n--)
-			vals[n] = tmp[n]; /* expand to 16bit */
-	}
-	return status;
+	return spi_write_then_read(spi, tx, sizeof(tx), val, val_size);
 }
 
-static int mcp23s17_read(struct mcp23s08 *mcp, unsigned reg)
-{
-	u8	tx[2], rx[2];
-	int	status;
+static const struct regmap_bus mcp23sxx_spi_regmap = {
+	.write = mcp23sxx_spi_write,
+	.gather_write = mcp23sxx_spi_gather_write,
+	.read = mcp23sxx_spi_read,
+};
 
-	tx[0] = mcp->addr | 0x01;
-	tx[1] = reg << 1;
-	status = spi_write_then_read(mcp->data, tx, sizeof(tx), rx, sizeof(rx));
-	return (status < 0) ? status : (rx[0] | (rx[1] << 8));
-}
+#endif /* CONFIG_SPI_MASTER */
 
-static int mcp23s17_write(struct mcp23s08 *mcp, unsigned reg, unsigned val)
+static int mcp_read(struct mcp23s08 *mcp, unsigned int reg, unsigned int *val)
 {
-	u8	tx[4];
-
-	tx[0] = mcp->addr;
-	tx[1] = reg << 1;
-	tx[2] = val;
-	tx[3] = val >> 8;
-	return spi_write_then_read(mcp->data, tx, sizeof(tx), NULL, 0);
+	return regmap_read(mcp->regmap, reg << mcp->reg_shift, val);
 }
 
-static int
-mcp23s17_read_regs(struct mcp23s08 *mcp, unsigned reg, u16 *vals, unsigned n)
+static int mcp_write(struct mcp23s08 *mcp, unsigned int reg, unsigned int val)
 {
-	u8	tx[2];
-	int	status;
+	return regmap_write(mcp->regmap, reg << mcp->reg_shift, val);
+}
 
-	if ((n + reg) > sizeof(mcp->cache))
-		return -EINVAL;
-	tx[0] = mcp->addr | 0x01;
-	tx[1] = reg << 1;
+static int mcp_update_cache(struct mcp23s08 *mcp)
+{
+	int ret, reg, i;
 
-	status = spi_write_then_read(mcp->data, tx, sizeof(tx),
-				     (u8 *)vals, n * 2);
-	if (status >= 0) {
-		while (n--)
-			vals[n] = __le16_to_cpu((__le16)vals[n]);
+	for (i = 0; i < ARRAY_SIZE(mcp->cache); i++) {
+		ret = mcp_read(mcp, i, &reg);
+		if (ret < 0)
+			return ret;
+		mcp->cache[i] = reg;
 	}
 
-	return status;
+	return 0;
 }
 
-static const struct mcp23s08_ops mcp23s08_ops = {
-	.read		= mcp23s08_read,
-	.write		= mcp23s08_write,
-	.read_regs	= mcp23s08_read_regs,
-};
+/*----------------------------------------------------------------------*/
 
-static const struct mcp23s08_ops mcp23s17_ops = {
-	.read		= mcp23s17_read,
-	.write		= mcp23s17_write,
-	.read_regs	= mcp23s17_read_regs,
+/* A given spi_device can represent up to eight mcp23sxx chips
+ * sharing the same chipselect but using different addresses
+ * (e.g. chips #0 and #3 might be populated, but not #1 or $2).
+ * Driver data holds all the per-chip data.
+ */
+struct mcp23s08_driver_data {
+	unsigned		ngpio;
+	struct mcp23s08		*mcp[8];
+	struct mcp23s08		chip[];
 };
 
-#endif /* CONFIG_SPI_MASTER */
-
-/*----------------------------------------------------------------------*/
 
 static int mcp23s08_direction_input(struct gpio_chip *chip, unsigned offset)
 {
@@ -270,7 +203,7 @@ static int mcp23s08_direction_input(struct gpio_chip *chip, unsigned offset)
 
 	mutex_lock(&mcp->lock);
 	mcp->cache[MCP_IODIR] |= (1 << offset);
-	status = mcp->ops->write(mcp, MCP_IODIR, mcp->cache[MCP_IODIR]);
+	status = mcp_write(mcp, MCP_IODIR, mcp->cache[MCP_IODIR]);
 	mutex_unlock(&mcp->lock);
 	return status;
 }
@@ -278,13 +211,13 @@ static int mcp23s08_direction_input(struct gpio_chip *chip, unsigned offset)
 static int mcp23s08_get(struct gpio_chip *chip, unsigned offset)
 {
 	struct mcp23s08	*mcp = gpiochip_get_data(chip);
-	int status;
+	int status, ret;
 
 	mutex_lock(&mcp->lock);
 
 	/* REVISIT reading this clears any IRQ ... */
-	status = mcp->ops->read(mcp, MCP_GPIO);
-	if (status < 0)
+	ret = mcp_read(mcp, MCP_GPIO, &status);
+	if (ret < 0)
 		status = 0;
 	else {
 		mcp->cache[MCP_GPIO] = status;
@@ -303,7 +236,7 @@ static int __mcp23s08_set(struct mcp23s08 *mcp, unsigned mask, int value)
 	else
 		olat &= ~mask;
 	mcp->cache[MCP_OLAT] = olat;
-	return mcp->ops->write(mcp, MCP_OLAT, olat);
+	return mcp_write(mcp, MCP_OLAT, olat);
 }
 
 static void mcp23s08_set(struct gpio_chip *chip, unsigned offset, int value)
@@ -327,7 +260,7 @@ mcp23s08_direction_output(struct gpio_chip *chip, unsigned offset, int value)
 	status = __mcp23s08_set(mcp, mask, value);
 	if (status == 0) {
 		mcp->cache[MCP_IODIR] &= ~mask;
-		status = mcp->ops->write(mcp, MCP_IODIR, mcp->cache[MCP_IODIR]);
+		status = mcp_write(mcp, MCP_IODIR, mcp->cache[MCP_IODIR]);
 	}
 	mutex_unlock(&mcp->lock);
 	return status;
@@ -341,16 +274,14 @@ static irqreturn_t mcp23s08_irq(int irq, void *data)
 	unsigned int child_irq;
 
 	mutex_lock(&mcp->lock);
-	intf = mcp->ops->read(mcp, MCP_INTF);
-	if (intf < 0) {
+	if (mcp_read(mcp, MCP_INTF, &intf) < 0) {
 		mutex_unlock(&mcp->lock);
 		return IRQ_HANDLED;
 	}
 
 	mcp->cache[MCP_INTF] = intf;
 
-	intcap = mcp->ops->read(mcp, MCP_INTCAP);
-	if (intcap < 0) {
+	if (mcp_read(mcp, MCP_INTCAP, &intcap) < 0) {
 		mutex_unlock(&mcp->lock);
 		return IRQ_HANDLED;
 	}
@@ -435,9 +366,9 @@ static void mcp23s08_irq_bus_unlock(struct irq_data *data)
 	struct mcp23s08 *mcp = gpiochip_get_data(gc);
 
 	mutex_lock(&mcp->lock);
-	mcp->ops->write(mcp, MCP_GPINTEN, mcp->cache[MCP_GPINTEN]);
-	mcp->ops->write(mcp, MCP_DEFVAL, mcp->cache[MCP_DEFVAL]);
-	mcp->ops->write(mcp, MCP_INTCON, mcp->cache[MCP_INTCON]);
+	mcp_write(mcp, MCP_GPINTEN, mcp->cache[MCP_GPINTEN]);
+	mcp_write(mcp, MCP_DEFVAL, mcp->cache[MCP_DEFVAL]);
+	mcp_write(mcp, MCP_INTCON, mcp->cache[MCP_INTCON]);
 	mutex_unlock(&mcp->lock);
 	mutex_unlock(&mcp->irq_lock);
 }
@@ -514,7 +445,7 @@ static void mcp23s08_dbg_show(struct seq_file *s, struct gpio_chip *chip)
 	bank = '0' + ((mcp->addr >> 1) & 0x7);
 
 	mutex_lock(&mcp->lock);
-	t = mcp->ops->read_regs(mcp, 0, mcp->cache, ARRAY_SIZE(mcp->cache));
+	t = mcp_update_cache(mcp);
 	if (t < 0) {
 		seq_printf(s, " I/O ERROR %d\n", t);
 		goto done;
@@ -549,12 +480,12 @@ static int mcp23s08_probe_one(struct mcp23s08 *mcp, struct device *dev,
 			      void *data, unsigned addr, unsigned type,
 			      struct mcp23s08_platform_data *pdata, int cs)
 {
-	int status;
+	int status, ret;
 	bool mirror = false;
 
 	mutex_init(&mcp->lock);
 
-	mcp->data = data;
+	mcp->dev = dev;
 	mcp->addr = addr;
 	mcp->irq_active_high = false;
 
@@ -571,19 +502,25 @@ static int mcp23s08_probe_one(struct mcp23s08 *mcp, struct device *dev,
 	switch (type) {
 #ifdef CONFIG_SPI_MASTER
 	case MCP_TYPE_S08:
-		mcp->ops = &mcp23s08_ops;
+		mcp->regmap = devm_regmap_init(dev, &mcp23sxx_spi_regmap, mcp,
+					       &mcp23x08_regmap);
+		mcp->reg_shift = 0;
 		mcp->chip.ngpio = 8;
 		mcp->chip.label = "mcp23s08";
 		break;
 
 	case MCP_TYPE_S17:
-		mcp->ops = &mcp23s17_ops;
+		mcp->regmap = devm_regmap_init(dev, &mcp23sxx_spi_regmap, mcp,
+					       &mcp23x17_regmap);
+		mcp->reg_shift = 1;
 		mcp->chip.ngpio = 16;
 		mcp->chip.label = "mcp23s17";
 		break;
 
 	case MCP_TYPE_S18:
-		mcp->ops = &mcp23s17_ops;
+		mcp->regmap = devm_regmap_init(dev, &mcp23sxx_spi_regmap, mcp,
+					       &mcp23x17_regmap);
+		mcp->reg_shift = 1;
 		mcp->chip.ngpio = 16;
 		mcp->chip.label = "mcp23s18";
 		break;
@@ -591,13 +528,15 @@ static int mcp23s08_probe_one(struct mcp23s08 *mcp, struct device *dev,
 
 #if IS_ENABLED(CONFIG_I2C)
 	case MCP_TYPE_008:
-		mcp->ops = &mcp23008_ops;
+		mcp->regmap = devm_regmap_init_i2c(data, &mcp23x08_regmap);
+		mcp->reg_shift = 0;
 		mcp->chip.ngpio = 8;
 		mcp->chip.label = "mcp23008";
 		break;
 
 	case MCP_TYPE_017:
-		mcp->ops = &mcp23017_ops;
+		mcp->regmap = devm_regmap_init_i2c(data, &mcp23x17_regmap);
+		mcp->reg_shift = 1;
 		mcp->chip.ngpio = 16;
 		mcp->chip.label = "mcp23017";
 		break;
@@ -608,6 +547,9 @@ static int mcp23s08_probe_one(struct mcp23s08 *mcp, struct device *dev,
 		return -EINVAL;
 	}
 
+	if (IS_ERR(mcp->regmap))
+		return PTR_ERR(mcp->regmap);
+
 	mcp->chip.base = pdata->base;
 	mcp->chip.can_sleep = true;
 	mcp->chip.parent = dev;
@@ -617,8 +559,8 @@ static int mcp23s08_probe_one(struct mcp23s08 *mcp, struct device *dev,
 	 * and MCP_IOCON.HAEN = 1, so we work with all chips.
 	 */
 
-	status = mcp->ops->read(mcp, MCP_IOCON);
-	if (status < 0)
+	ret = mcp_read(mcp, MCP_IOCON, &status);
+	if (ret < 0)
 		goto fail;
 
 	mcp->irq_controller = pdata->irq_controller;
@@ -646,51 +588,49 @@ static int mcp23s08_probe_one(struct mcp23s08 *mcp, struct device *dev,
 		if (type == MCP_TYPE_S18)
 			status |= IOCON_INTCC | (IOCON_INTCC << 8);
 
-		status = mcp->ops->write(mcp, MCP_IOCON, status);
-		if (status < 0)
+		ret = mcp_write(mcp, MCP_IOCON, status);
+		if (ret < 0)
 			goto fail;
 	}
 
 	/* configure ~100K pullups */
-	status = mcp->ops->write(mcp, MCP_GPPU, pdata->chip[cs].pullups);
-	if (status < 0)
+	ret = mcp_write(mcp, MCP_GPPU, pdata->chip[cs].pullups);
+	if (ret < 0)
 		goto fail;
 
-	status = mcp->ops->read_regs(mcp, 0, mcp->cache, ARRAY_SIZE(mcp->cache));
-	if (status < 0)
+	ret = mcp_update_cache(mcp);
+	if (ret < 0)
 		goto fail;
 
 	/* disable inverter on input */
 	if (mcp->cache[MCP_IPOL] != 0) {
 		mcp->cache[MCP_IPOL] = 0;
-		status = mcp->ops->write(mcp, MCP_IPOL, 0);
-		if (status < 0)
+		ret = mcp_write(mcp, MCP_IPOL, 0);
+		if (ret < 0)
 			goto fail;
 	}
 
 	/* disable irqs */
 	if (mcp->cache[MCP_GPINTEN] != 0) {
 		mcp->cache[MCP_GPINTEN] = 0;
-		status = mcp->ops->write(mcp, MCP_GPINTEN, 0);
-		if (status < 0)
+		ret = mcp_write(mcp, MCP_GPINTEN, 0);
+		if (ret < 0)
 			goto fail;
 	}
 
-	status = gpiochip_add_data(&mcp->chip, mcp);
-	if (status < 0)
+	ret = gpiochip_add_data(&mcp->chip, mcp);
+	if (ret < 0)
 		goto fail;
 
 	if (mcp->irq && mcp->irq_controller) {
-		status = mcp23s08_irq_setup(mcp);
-		if (status) {
+		ret = mcp23s08_irq_setup(mcp);
+		if (ret)
 			goto fail;
-		}
 	}
 fail:
-	if (status < 0)
-		dev_dbg(dev, "can't setup chip %d, --> %d\n",
-			addr, status);
-	return status;
+	if (ret < 0)
+		dev_dbg(dev, "can't setup chip %d, --> %d\n", addr, ret);
+	return ret;
 }
 
 /*----------------------------------------------------------------------*/
-- 
2.11.0
