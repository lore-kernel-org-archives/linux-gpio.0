From: Sebastian Reichel <sebastian.reichel@collabora.co.uk>
Subject: [PATCH 1/2] pinctrl: mcp23s08: switch to regmap caching
Date: Thu,  4 May 2017 15:24:10 +0200
Message-ID: <20170504132411.10973-2-sebastian.reichel@collabora.co.uk>
References: <20170504132411.10973-1-sebastian.reichel@collabora.co.uk>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([46.235.227.227]:36913 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752614AbdEDNY2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 4 May 2017 09:24:28 -0400
In-Reply-To: <20170504132411.10973-1-sebastian.reichel@collabora.co.uk>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Sebastian Reichel <sre@kernel.org>, Linus Walleij <linus.walleij@linaro.org>
Cc: Enric Balletbo i Serra <enric.balletbo@collabora.co.uk>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Sebastian Reichel <sebastian.reichel@collabora.co.uk>

Instead of using custom caching, this switches to regmap based
caching. Before the conversion the debugfs file used uncached
values, so that it was easily possible to see power-loss related
problems. The new code will check and recover at this place.

The patch will also ensure, that irqs are not cleared by checking
register status in debugfs.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.co.uk>
---
 drivers/pinctrl/pinctrl-mcp23s08.c | 287 +++++++++++++++++++++++++------------
 1 file changed, 192 insertions(+), 95 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-mcp23s08.c b/drivers/pinctrl/pinctrl-mcp23s08.c
index 7fad3a9e2222..c13b608388e0 100644
--- a/drivers/pinctrl/pinctrl-mcp23s08.c
+++ b/drivers/pinctrl/pinctrl-mcp23s08.c
@@ -67,14 +67,13 @@ struct mcp23s08 {
 	bool			irq_active_high;
 	bool			reg_shift;
 
-	u16			cache[11];
 	u16			irq_rise;
 	u16			irq_fall;
 	int			irq;
 	bool			irq_controller;
-	/* lock protects the cached values */
+	int			cached_gpio;
+	/* lock protects regmap access with bypass/cache flags */
 	struct mutex		lock;
-	struct mutex		irq_lock;
 
 	struct gpio_chip	chip;
 
@@ -85,20 +84,92 @@ struct mcp23s08 {
 	struct pinctrl_desc	pinctrl_desc;
 };
 
+struct reg_default mcp23x08_defaults[] = {
+	{.reg = MCP_IODIR,		.def = 0xff},
+	{.reg = MCP_IPOL,		.def = 0x00},
+	{.reg = MCP_GPINTEN,		.def = 0x00},
+	{.reg = MCP_DEFVAL,		.def = 0x00},
+	{.reg = MCP_INTCON,		.def = 0x00},
+	{.reg = MCP_IOCON,		.def = 0x00},
+	{.reg = MCP_GPPU,		.def = 0x00},
+	{.reg = MCP_OLAT,		.def = 0x00},
+};
+
+struct regmap_range mcp23x08_volatile_range = {
+	.range_min = MCP_INTF,
+	.range_max = MCP_GPIO,
+};
+
+struct regmap_access_table mcp23x08_volatile_table = {
+	.yes_ranges = &mcp23x08_volatile_range,
+	.n_yes_ranges = 1,
+};
+
+struct regmap_range mcp23x08_precious_range = {
+	.range_min = MCP_GPIO,
+	.range_max = MCP_GPIO,
+};
+
+struct regmap_access_table mcp23x08_precious_table = {
+	.yes_ranges = &mcp23x08_precious_range,
+	.n_yes_ranges = 1,
+};
+
 static const struct regmap_config mcp23x08_regmap = {
 	.reg_bits = 8,
 	.val_bits = 8,
 
 	.reg_stride = 1,
+	.volatile_table = &mcp23x08_volatile_table,
+	.precious_table = &mcp23x08_precious_table,
+	.reg_defaults = mcp23x08_defaults,
+	.num_reg_defaults = ARRAY_SIZE(mcp23x08_defaults),
+	.cache_type = REGCACHE_FLAT,
 	.max_register = MCP_OLAT,
 };
 
+struct reg_default mcp23x16_defaults[] = {
+	{.reg = MCP_IODIR << 1,		.def = 0xffff},
+	{.reg = MCP_IPOL << 1,		.def = 0x0000},
+	{.reg = MCP_GPINTEN << 1,	.def = 0x0000},
+	{.reg = MCP_DEFVAL << 1,	.def = 0x0000},
+	{.reg = MCP_INTCON << 1,	.def = 0x0000},
+	{.reg = MCP_IOCON << 1,		.def = 0x0000},
+	{.reg = MCP_GPPU << 1,		.def = 0x0000},
+	{.reg = MCP_OLAT << 1,		.def = 0x0000},
+};
+
+struct regmap_range mcp23x16_volatile_range = {
+	.range_min = MCP_INTF << 1,
+	.range_max = MCP_GPIO << 1,
+};
+
+struct regmap_access_table mcp23x16_volatile_table = {
+	.yes_ranges = &mcp23x16_volatile_range,
+	.n_yes_ranges = 1,
+};
+
+struct regmap_range mcp23x16_precious_range = {
+	.range_min = MCP_GPIO << 1,
+	.range_max = MCP_GPIO << 1,
+};
+
+struct regmap_access_table mcp23x16_precious_table = {
+	.yes_ranges = &mcp23x16_precious_range,
+	.n_yes_ranges = 1,
+};
+
 static const struct regmap_config mcp23x17_regmap = {
 	.reg_bits = 8,
 	.val_bits = 16,
 
 	.reg_stride = 2,
 	.max_register = MCP_OLAT << 1,
+	.volatile_table = &mcp23x16_volatile_table,
+	.precious_table = &mcp23x16_precious_table,
+	.reg_defaults = mcp23x16_defaults,
+	.num_reg_defaults = ARRAY_SIZE(mcp23x16_defaults),
+	.cache_type = REGCACHE_FLAT,
 	.val_format_endian = REGMAP_ENDIAN_LITTLE,
 };
 
@@ -112,27 +183,19 @@ static int mcp_write(struct mcp23s08 *mcp, unsigned int reg, unsigned int val)
 	return regmap_write(mcp->regmap, reg << mcp->reg_shift, val);
 }
 
-static int mcp_set_bit(struct mcp23s08 *mcp, unsigned int reg,
-		       unsigned int pin, bool enabled)
+static int mcp_set_mask(struct mcp23s08 *mcp, unsigned int reg,
+		       unsigned int mask, bool enabled)
 {
 	u16 val  = enabled ? 0xffff : 0x0000;
-	u16 mask = BIT(pin);
 	return regmap_update_bits(mcp->regmap, reg << mcp->reg_shift,
 				  mask, val);
 }
 
-static int mcp_update_cache(struct mcp23s08 *mcp)
+static int mcp_set_bit(struct mcp23s08 *mcp, unsigned int reg,
+		       unsigned int pin, bool enabled)
 {
-	int ret, reg, i;
-
-	for (i = 0; i < ARRAY_SIZE(mcp->cache); i++) {
-		ret = mcp_read(mcp, i, &reg);
-		if (ret < 0)
-			return ret;
-		mcp->cache[i] = reg;
-	}
-
-	return 0;
+	u16 mask = BIT(pin);
+	return mcp_set_mask(mcp, reg, mask, enabled);
 }
 
 static const struct pinctrl_pin_desc mcp23x08_pins[] = {
@@ -336,9 +399,9 @@ static int mcp23s08_direction_input(struct gpio_chip *chip, unsigned offset)
 	int status;
 
 	mutex_lock(&mcp->lock);
-	mcp->cache[MCP_IODIR] |= (1 << offset);
-	status = mcp_write(mcp, MCP_IODIR, mcp->cache[MCP_IODIR]);
+	status = mcp_set_bit(mcp, MCP_IODIR, offset, true);
 	mutex_unlock(&mcp->lock);
+
 	return status;
 }
 
@@ -353,33 +416,27 @@ static int mcp23s08_get(struct gpio_chip *chip, unsigned offset)
 	ret = mcp_read(mcp, MCP_GPIO, &status);
 	if (ret < 0)
 		status = 0;
-	else {
-		mcp->cache[MCP_GPIO] = status;
+	else
 		status = !!(status & (1 << offset));
-	}
+
+	mcp->cached_gpio = status;
+
 	mutex_unlock(&mcp->lock);
 	return status;
 }
 
-static int __mcp23s08_set(struct mcp23s08 *mcp, unsigned mask, int value)
+static int __mcp23s08_set(struct mcp23s08 *mcp, unsigned mask, bool value)
 {
-	unsigned olat = mcp->cache[MCP_OLAT];
-
-	if (value)
-		olat |= mask;
-	else
-		olat &= ~mask;
-	mcp->cache[MCP_OLAT] = olat;
-	return mcp_write(mcp, MCP_OLAT, olat);
+	return mcp_set_mask(mcp, MCP_OLAT, mask, value);
 }
 
 static void mcp23s08_set(struct gpio_chip *chip, unsigned offset, int value)
 {
 	struct mcp23s08	*mcp = gpiochip_get_data(chip);
-	unsigned mask = 1 << offset;
+	unsigned mask = BIT(offset);
 
 	mutex_lock(&mcp->lock);
-	__mcp23s08_set(mcp, mask, value);
+	__mcp23s08_set(mcp, mask, !!value);
 	mutex_unlock(&mcp->lock);
 }
 
@@ -387,14 +444,13 @@ static int
 mcp23s08_direction_output(struct gpio_chip *chip, unsigned offset, int value)
 {
 	struct mcp23s08	*mcp = gpiochip_get_data(chip);
-	unsigned mask = 1 << offset;
+	unsigned mask = BIT(offset);
 	int status;
 
 	mutex_lock(&mcp->lock);
 	status = __mcp23s08_set(mcp, mask, value);
 	if (status == 0) {
-		mcp->cache[MCP_IODIR] &= ~mask;
-		status = mcp_write(mcp, MCP_IODIR, mcp->cache[MCP_IODIR]);
+		status = mcp_set_mask(mcp, MCP_IODIR, mask, false);
 	}
 	mutex_unlock(&mcp->lock);
 	return status;
@@ -404,7 +460,7 @@ mcp23s08_direction_output(struct gpio_chip *chip, unsigned offset, int value)
 static irqreturn_t mcp23s08_irq(int irq, void *data)
 {
 	struct mcp23s08 *mcp = data;
-	int intcap, intf, i, gpio, gpio_orig, intcap_mask;
+	int intcap, intcon, intf, i, gpio, gpio_orig, intcap_mask, defval;
 	unsigned int child_irq;
 	bool intf_set, intcap_changed, gpio_bit_changed,
 		defval_changed, gpio_set;
@@ -415,25 +471,31 @@ static irqreturn_t mcp23s08_irq(int irq, void *data)
 		return IRQ_HANDLED;
 	}
 
-	mcp->cache[MCP_INTF] = intf;
-
 	if (mcp_read(mcp, MCP_INTCAP, &intcap) < 0) {
 		mutex_unlock(&mcp->lock);
 		return IRQ_HANDLED;
 	}
 
-	mcp->cache[MCP_INTCAP] = intcap;
+	if (mcp_read(mcp, MCP_INTCON, &intcon) < 0) {
+		mutex_unlock(&mcp->lock);
+		return IRQ_HANDLED;
+	}
+
+	if (mcp_read(mcp, MCP_DEFVAL, &defval) < 0) {
+		mutex_unlock(&mcp->lock);
+		return IRQ_HANDLED;
+	}
 
 	/* This clears the interrupt(configurable on S18) */
 	if (mcp_read(mcp, MCP_GPIO, &gpio) < 0) {
 		mutex_unlock(&mcp->lock);
 		return IRQ_HANDLED;
 	}
-	gpio_orig = mcp->cache[MCP_GPIO];
-	mcp->cache[MCP_GPIO] = gpio;
+	gpio_orig = mcp->cached_gpio;
+	mcp->cached_gpio = gpio;
 	mutex_unlock(&mcp->lock);
 
-	if (mcp->cache[MCP_INTF] == 0) {
+	if (intf == 0) {
 		/* There is no interrupt pending */
 		return IRQ_HANDLED;
 	}
@@ -461,7 +523,7 @@ static irqreturn_t mcp23s08_irq(int irq, void *data)
 		 * to see if the input has changed.
 		 */
 
-		intf_set = BIT(i) & mcp->cache[MCP_INTF];
+		intf_set = intf & BIT(i);
 		if (i < 8 && intf_set)
 			intcap_mask = 0x00FF;
 		else if (i >= 8 && intf_set)
@@ -470,14 +532,14 @@ static irqreturn_t mcp23s08_irq(int irq, void *data)
 			intcap_mask = 0x00;
 
 		intcap_changed = (intcap_mask &
-			(BIT(i) & mcp->cache[MCP_INTCAP])) !=
+			(intcap & BIT(i))) !=
 			(intcap_mask & (BIT(i) & gpio_orig));
-		gpio_set = BIT(i) & mcp->cache[MCP_GPIO];
+		gpio_set = BIT(i) & gpio;
 		gpio_bit_changed = (BIT(i) & gpio_orig) !=
-			(BIT(i) & mcp->cache[MCP_GPIO]);
-		defval_changed = (BIT(i) & mcp->cache[MCP_INTCON]) &&
-			((BIT(i) & mcp->cache[MCP_GPIO]) !=
-			(BIT(i) & mcp->cache[MCP_DEFVAL]));
+			(BIT(i) & gpio);
+		defval_changed = (BIT(i) & intcon) &&
+			((BIT(i) & gpio) !=
+			(BIT(i) & defval));
 
 		if (((gpio_bit_changed || intcap_changed) &&
 			(BIT(i) & mcp->irq_rise) && gpio_set) ||
@@ -498,7 +560,7 @@ static void mcp23s08_irq_mask(struct irq_data *data)
 	struct mcp23s08 *mcp = gpiochip_get_data(gc);
 	unsigned int pos = data->hwirq;
 
-	mcp->cache[MCP_GPINTEN] &= ~BIT(pos);
+	mcp_set_bit(mcp, MCP_GPINTEN, pos, false);
 }
 
 static void mcp23s08_irq_unmask(struct irq_data *data)
@@ -507,7 +569,7 @@ static void mcp23s08_irq_unmask(struct irq_data *data)
 	struct mcp23s08 *mcp = gpiochip_get_data(gc);
 	unsigned int pos = data->hwirq;
 
-	mcp->cache[MCP_GPINTEN] |= BIT(pos);
+	mcp_set_bit(mcp, MCP_GPINTEN, pos, true);
 }
 
 static int mcp23s08_irq_set_type(struct irq_data *data, unsigned int type)
@@ -518,23 +580,23 @@ static int mcp23s08_irq_set_type(struct irq_data *data, unsigned int type)
 	int status = 0;
 
 	if ((type & IRQ_TYPE_EDGE_BOTH) == IRQ_TYPE_EDGE_BOTH) {
-		mcp->cache[MCP_INTCON] &= ~BIT(pos);
+		mcp_set_bit(mcp, MCP_INTCON, pos, false);
 		mcp->irq_rise |= BIT(pos);
 		mcp->irq_fall |= BIT(pos);
 	} else if (type & IRQ_TYPE_EDGE_RISING) {
-		mcp->cache[MCP_INTCON] &= ~BIT(pos);
+		mcp_set_bit(mcp, MCP_INTCON, pos, false);
 		mcp->irq_rise |= BIT(pos);
 		mcp->irq_fall &= ~BIT(pos);
 	} else if (type & IRQ_TYPE_EDGE_FALLING) {
-		mcp->cache[MCP_INTCON] &= ~BIT(pos);
+		mcp_set_bit(mcp, MCP_INTCON, pos, false);
 		mcp->irq_rise &= ~BIT(pos);
 		mcp->irq_fall |= BIT(pos);
 	} else if (type & IRQ_TYPE_LEVEL_HIGH) {
-		mcp->cache[MCP_INTCON] |= BIT(pos);
-		mcp->cache[MCP_DEFVAL] &= ~BIT(pos);
+		mcp_set_bit(mcp, MCP_INTCON, pos, true);
+		mcp_set_bit(mcp, MCP_DEFVAL, pos, false);
 	} else if (type & IRQ_TYPE_LEVEL_LOW) {
-		mcp->cache[MCP_INTCON] |= BIT(pos);
-		mcp->cache[MCP_DEFVAL] |= BIT(pos);
+		mcp_set_bit(mcp, MCP_INTCON, pos, true);
+		mcp_set_bit(mcp, MCP_DEFVAL, pos, true);
 	} else
 		return -EINVAL;
 
@@ -546,7 +608,8 @@ static void mcp23s08_irq_bus_lock(struct irq_data *data)
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(data);
 	struct mcp23s08 *mcp = gpiochip_get_data(gc);
 
-	mutex_lock(&mcp->irq_lock);
+	mutex_lock(&mcp->lock);
+	regcache_cache_only(mcp->regmap, true);
 }
 
 static void mcp23s08_irq_bus_unlock(struct irq_data *data)
@@ -554,12 +617,10 @@ static void mcp23s08_irq_bus_unlock(struct irq_data *data)
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(data);
 	struct mcp23s08 *mcp = gpiochip_get_data(gc);
 
-	mutex_lock(&mcp->lock);
-	mcp_write(mcp, MCP_GPINTEN, mcp->cache[MCP_GPINTEN]);
-	mcp_write(mcp, MCP_DEFVAL, mcp->cache[MCP_DEFVAL]);
-	mcp_write(mcp, MCP_INTCON, mcp->cache[MCP_INTCON]);
+	regcache_cache_only(mcp->regmap, false);
+	regcache_sync(mcp->regmap);
+
 	mutex_unlock(&mcp->lock);
-	mutex_unlock(&mcp->irq_lock);
 }
 
 static struct irq_chip mcp23s08_irq_chip = {
@@ -577,8 +638,6 @@ static int mcp23s08_irq_setup(struct mcp23s08 *mcp)
 	int err;
 	unsigned long irqflags = IRQF_ONESHOT | IRQF_SHARED;
 
-	mutex_init(&mcp->irq_lock);
-
 	if (mcp->irq_active_high)
 		irqflags |= IRQF_TRIGGER_HIGH;
 	else
@@ -618,6 +677,47 @@ static int mcp23s08_irq_setup(struct mcp23s08 *mcp)
 #include <linux/seq_file.h>
 
 /*
+ * This compares the chip's registers with the register
+ * cache and corrects any incorrectly set register. This
+ * can be used to fix state for MCP23xxx, that temporary
+ * lost its power supply.
+ */
+#define MCP23S08_CONFIG_REGS 8
+static int __check_mcp23s08_reg_cache(struct mcp23s08 *mcp)
+{
+	int cached[MCP23S08_CONFIG_REGS];
+	int err = 0, i;
+
+	/* read cached config registers */
+	for (i=0; i < MCP23S08_CONFIG_REGS; i++) {
+		err = mcp_read(mcp, i, &cached[i]);
+		if (err)
+			goto out;
+	}
+
+	regcache_cache_bypass(mcp->regmap, true);
+
+	for (i=0; i < MCP23S08_CONFIG_REGS; i++) {
+		int uncached;
+		err = mcp_read(mcp, i, &uncached);
+		if (err)
+			goto out;
+
+		if (uncached != cached[i]) {
+			dev_err(mcp->dev, "restoring reg 0x%02x from 0x%04x to 0x%04x (power-loss?)\n",
+				i, uncached, cached[i]);
+			mcp_write(mcp, i, cached[i]);
+		}
+	}
+
+out:
+	if (err)
+		dev_err(mcp->dev, "read error: reg=%02x, err=%d", i, err);
+	regcache_cache_bypass(mcp->regmap, false);
+	return err;
+}
+
+/*
  * This shows more info than the generic gpio dump code:
  * pullups, deglitching, open drain drive.
  */
@@ -627,6 +727,7 @@ static void mcp23s08_dbg_show(struct seq_file *s, struct gpio_chip *chip)
 	char		bank;
 	int		t;
 	unsigned	mask;
+	int iodir, gpio, gppu;
 
 	mcp = gpiochip_get_data(chip);
 
@@ -634,14 +735,30 @@ static void mcp23s08_dbg_show(struct seq_file *s, struct gpio_chip *chip)
 	bank = '0' + ((mcp->addr >> 1) & 0x7);
 
 	mutex_lock(&mcp->lock);
-	t = mcp_update_cache(mcp);
-	if (t < 0) {
-		seq_printf(s, " I/O ERROR %d\n", t);
+
+	t = __check_mcp23s08_reg_cache(mcp);
+	if (t) {
+		seq_printf(s, " I/O Error\n");
+		goto done;
+	}
+	t = mcp_read(mcp, MCP_IODIR, &iodir);
+	if (t) {
+		seq_printf(s, " I/O Error\n");
+		goto done;
+	}
+	t = mcp_read(mcp, MCP_GPIO, &gpio);
+	if (t) {
+		seq_printf(s, " I/O Error\n");
+		goto done;
+	}
+	t = mcp_read(mcp, MCP_GPPU, &gppu);
+	if (t) {
+		seq_printf(s, " I/O Error\n");
 		goto done;
 	}
 
-	for (t = 0, mask = 1; t < chip->ngpio; t++, mask <<= 1) {
-		const char	*label;
+	for (t = 0, mask = BIT(0); t < chip->ngpio; t++, mask <<= 1) {
+		const char *label;
 
 		label = gpiochip_is_requested(chip, t);
 		if (!label)
@@ -649,9 +766,9 @@ static void mcp23s08_dbg_show(struct seq_file *s, struct gpio_chip *chip)
 
 		seq_printf(s, " gpio-%-3d P%c.%d (%-12s) %s %s %s",
 			chip->base + t, bank, t, label,
-			(mcp->cache[MCP_IODIR] & mask) ? "in " : "out",
-			(mcp->cache[MCP_GPIO] & mask) ? "hi" : "lo",
-			(mcp->cache[MCP_GPPU] & mask) ? "up" : "  ");
+			(iodir & mask) ? "in " : "out",
+			(gpio & mask) ? "hi" : "lo",
+			(gppu & mask) ? "up" : "  ");
 		/* NOTE:  ignoring the irq-related registers */
 		seq_puts(s, "\n");
 	}
@@ -782,26 +899,6 @@ static int mcp23s08_probe_one(struct mcp23s08 *mcp, struct device *dev,
 			goto fail;
 	}
 
-	ret = mcp_update_cache(mcp);
-	if (ret < 0)
-		goto fail;
-
-	/* disable inverter on input */
-	if (mcp->cache[MCP_IPOL] != 0) {
-		mcp->cache[MCP_IPOL] = 0;
-		ret = mcp_write(mcp, MCP_IPOL, 0);
-		if (ret < 0)
-			goto fail;
-	}
-
-	/* disable irqs */
-	if (mcp->cache[MCP_GPINTEN] != 0) {
-		mcp->cache[MCP_GPINTEN] = 0;
-		ret = mcp_write(mcp, MCP_GPINTEN, 0);
-		if (ret < 0)
-			goto fail;
-	}
-
 	ret = gpiochip_add_data(&mcp->chip, mcp);
 	if (ret < 0)
 		goto fail;
-- 
2.11.0

