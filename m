From: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Subject: [PATCH v3] regmap: regmap-irq/gpio-max77620: add level-irq support
Date: Tue, 18 Dec 2018 13:59:31 +0200
Message-ID: <20181218115931.GA21253@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: mazziesaccount@gmail.com, matti.vaittinen@fi.rohmeurope.com
Cc: heikki.haikola@fi.rohmeurope.com, mikko.mutanen@fi.rohmeurope.com, broonie@kernel.org, gregkh@linuxfoundation.org, rafael@kernel.org, linus.walleij@linaro.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, vladimir_zapolskiy@mentor.com
List-Id: linux-gpio@vger.kernel.org

Add level active IRQ support to regmap-irq irqchip. Change breaks
existing regmap-irq type setting. Convert the existing drivers which
use regmap-irq with trigger type setting (gpio-max77620) to work
with this new approach. So we do not magically support level-active
IRQs on gpio-max77620 - but add support to the regmap-irq for chips
which support them =)

We do not support distinguishing situation where HW supports rising
and falling edge detection but not both. Separating this would require
inventing yet another flags for IRQ types.

Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
---

Version 3 of this patch is intended to be functionally identical to v2.
This patch is rebased on top of a tree which contains changes:
"regmap: irq: handle HW using separate rising/falling edge interrupts"
from Bartosz Golaszewski and the change
"regmap: regmap-irq: Remove default irq type setting from core"
(proposed here):
https://lore.kernel.org/lkml/20181218105813.GA6957@localhost.localdomain/

There should not be direct dependency to "regmap: regmap-irq: Remove
default irq type setting from core" though. Patch was also tested to
apply cleany on regmap-tree.

Same statement regarding testing applies - gpio-max77620 are only
tested to compile. All real testing would be _HIGHLY_ appreciated.

 drivers/base/regmap/regmap-irq.c | 35 ++++++++++-----
 drivers/gpio/gpio-max77620.c     | 96 ++++++++++++++++++++++++++--------------
 include/linux/regmap.h           | 27 ++++++++---
 3 files changed, 110 insertions(+), 48 deletions(-)

diff --git a/drivers/base/regmap/regmap-irq.c b/drivers/base/regmap/regmap-irq.c
index 8b216b2e2c19..31d23c9a5ae7 100644
--- a/drivers/base/regmap/regmap-irq.c
+++ b/drivers/base/regmap/regmap-irq.c
@@ -199,7 +199,7 @@ static void regmap_irq_enable(struct irq_data *data)
 	const struct regmap_irq *irq_data = irq_to_regmap_irq(d, data->hwirq);
 	unsigned int mask, type;
 
-	type = irq_data->type_falling_mask | irq_data->type_rising_mask;
+	type = irq_data->type.type_falling_val | irq_data->type.type_rising_val;
 
 	/*
 	 * The type_in_mask flag means that the underlying hardware uses
@@ -234,27 +234,42 @@ static int regmap_irq_set_type(struct irq_data *data, unsigned int type)
 	struct regmap_irq_chip_data *d = irq_data_get_irq_chip_data(data);
 	struct regmap *map = d->map;
 	const struct regmap_irq *irq_data = irq_to_regmap_irq(d, data->hwirq);
-	int reg = irq_data->type_reg_offset / map->reg_stride;
+	int reg;
+	const struct regmap_irq_type *t = &irq_data->type;
 
-	if (!(irq_data->type_rising_mask | irq_data->type_falling_mask))
-		return 0;
+	if ((t->types_supported & type) != type)
+		return -ENOTSUPP;
+
+	reg = t->type_reg_offset / map->reg_stride;
 
-	d->type_buf[reg] &= ~(irq_data->type_falling_mask |
-					irq_data->type_rising_mask);
+	if (t->type_reg_mask)
+		d->type_buf[reg] &= ~t->type_reg_mask;
+	else
+		d->type_buf[reg] &= ~(t->type_falling_val |
+				      t->type_rising_val |
+				      t->type_level_low_val |
+				      t->type_level_high_val);
 	switch (type) {
 	case IRQ_TYPE_EDGE_FALLING:
-		d->type_buf[reg] |= irq_data->type_falling_mask;
+		d->type_buf[reg] |= t->type_falling_val;
 		break;
 
 	case IRQ_TYPE_EDGE_RISING:
-		d->type_buf[reg] |= irq_data->type_rising_mask;
+		d->type_buf[reg] |= t->type_rising_val;
 		break;
 
 	case IRQ_TYPE_EDGE_BOTH:
-		d->type_buf[reg] |= (irq_data->type_falling_mask |
-					irq_data->type_rising_mask);
+		d->type_buf[reg] |= (t->type_falling_val |
+					t->type_rising_val);
 		break;
 
+	case IRQ_TYPE_LEVEL_HIGH:
+		d->type_buf[reg] |= t->type_level_high_val;
+		break;
+
+	case IRQ_TYPE_LEVEL_LOW:
+		d->type_buf[reg] |= t->type_level_low_val;
+		break;
 	default:
 		return -EINVAL;
 	}
diff --git a/drivers/gpio/gpio-max77620.c b/drivers/gpio/gpio-max77620.c
index 538bce4b5b42..65fa3a198ebd 100644
--- a/drivers/gpio/gpio-max77620.c
+++ b/drivers/gpio/gpio-max77620.c
@@ -25,60 +25,92 @@ struct max77620_gpio {
 
 static const struct regmap_irq max77620_gpio_irqs[] = {
 	[0] = {
-		.mask = MAX77620_IRQ_LVL2_GPIO_EDGE0,
-		.type_rising_mask = MAX77620_CNFG_GPIO_INT_RISING,
-		.type_falling_mask = MAX77620_CNFG_GPIO_INT_FALLING,
 		.reg_offset = 0,
-		.type_reg_offset = 0,
+		.mask = MAX77620_IRQ_LVL2_GPIO_EDGE0,
+		.type = {
+			.type_rising_val = MAX77620_CNFG_GPIO_INT_RISING,
+			.type_falling_val = MAX77620_CNFG_GPIO_INT_FALLING,
+			.type_reg_mask = MAX77620_CNFG_GPIO_INT_MASK,
+			.type_reg_offset = 0,
+			.types_supported = IRQ_TYPE_EDGE_BOTH,
+		},
 	},
 	[1] = {
-		.mask = MAX77620_IRQ_LVL2_GPIO_EDGE1,
-		.type_rising_mask = MAX77620_CNFG_GPIO_INT_RISING,
-		.type_falling_mask = MAX77620_CNFG_GPIO_INT_FALLING,
 		.reg_offset = 0,
-		.type_reg_offset = 1,
+		.mask = MAX77620_IRQ_LVL2_GPIO_EDGE1,
+		.type = {
+			.type_rising_val = MAX77620_CNFG_GPIO_INT_RISING,
+			.type_falling_val = MAX77620_CNFG_GPIO_INT_FALLING,
+			.type_reg_mask = MAX77620_CNFG_GPIO_INT_MASK,
+			.type_reg_offset = 1,
+			.types_supported = IRQ_TYPE_EDGE_BOTH,
+		},
 	},
 	[2] = {
-		.mask = MAX77620_IRQ_LVL2_GPIO_EDGE2,
-		.type_rising_mask = MAX77620_CNFG_GPIO_INT_RISING,
-		.type_falling_mask = MAX77620_CNFG_GPIO_INT_FALLING,
 		.reg_offset = 0,
-		.type_reg_offset = 2,
+		.mask = MAX77620_IRQ_LVL2_GPIO_EDGE2,
+		.type = {
+			.type_rising_val = MAX77620_CNFG_GPIO_INT_RISING,
+			.type_falling_val = MAX77620_CNFG_GPIO_INT_FALLING,
+			.type_reg_mask = MAX77620_CNFG_GPIO_INT_MASK,
+			.type_reg_offset = 2,
+			.types_supported = IRQ_TYPE_EDGE_BOTH,
+		},
 	},
 	[3] = {
-		.mask = MAX77620_IRQ_LVL2_GPIO_EDGE3,
-		.type_rising_mask = MAX77620_CNFG_GPIO_INT_RISING,
-		.type_falling_mask = MAX77620_CNFG_GPIO_INT_FALLING,
 		.reg_offset = 0,
-		.type_reg_offset = 3,
+		.mask = MAX77620_IRQ_LVL2_GPIO_EDGE3,
+		.type = {
+			.type_rising_val = MAX77620_CNFG_GPIO_INT_RISING,
+			.type_falling_val = MAX77620_CNFG_GPIO_INT_FALLING,
+			.type_reg_mask = MAX77620_CNFG_GPIO_INT_MASK,
+			.type_reg_offset = 3,
+			.types_supported = IRQ_TYPE_EDGE_BOTH,
+		},
 	},
 	[4] = {
-		.mask = MAX77620_IRQ_LVL2_GPIO_EDGE4,
-		.type_rising_mask = MAX77620_CNFG_GPIO_INT_RISING,
-		.type_falling_mask = MAX77620_CNFG_GPIO_INT_FALLING,
 		.reg_offset = 0,
-		.type_reg_offset = 4,
+		.mask = MAX77620_IRQ_LVL2_GPIO_EDGE4,
+		.type = {
+			.type_rising_val = MAX77620_CNFG_GPIO_INT_RISING,
+			.type_falling_val = MAX77620_CNFG_GPIO_INT_FALLING,
+			.type_reg_mask = MAX77620_CNFG_GPIO_INT_MASK,
+			.type_reg_offset = 4,
+			.types_supported = IRQ_TYPE_EDGE_BOTH,
+		},
 	},
 	[5] = {
-		.mask = MAX77620_IRQ_LVL2_GPIO_EDGE5,
-		.type_rising_mask = MAX77620_CNFG_GPIO_INT_RISING,
-		.type_falling_mask = MAX77620_CNFG_GPIO_INT_FALLING,
 		.reg_offset = 0,
-		.type_reg_offset = 5,
+		.mask = MAX77620_IRQ_LVL2_GPIO_EDGE5,
+		.type = {
+			.type_rising_val = MAX77620_CNFG_GPIO_INT_RISING,
+			.type_falling_val = MAX77620_CNFG_GPIO_INT_FALLING,
+			.type_reg_mask = MAX77620_CNFG_GPIO_INT_MASK,
+			.type_reg_offset = 5,
+			.types_supported = IRQ_TYPE_EDGE_BOTH,
+		},
 	},
 	[6] = {
-		.mask = MAX77620_IRQ_LVL2_GPIO_EDGE6,
-		.type_rising_mask = MAX77620_CNFG_GPIO_INT_RISING,
-		.type_falling_mask = MAX77620_CNFG_GPIO_INT_FALLING,
 		.reg_offset = 0,
-		.type_reg_offset = 6,
+		.mask = MAX77620_IRQ_LVL2_GPIO_EDGE6,
+		.type = {
+			.type_rising_val = MAX77620_CNFG_GPIO_INT_RISING,
+			.type_falling_val = MAX77620_CNFG_GPIO_INT_FALLING,
+			.type_reg_mask = MAX77620_CNFG_GPIO_INT_MASK,
+			.type_reg_offset = 6,
+			.types_supported = IRQ_TYPE_EDGE_BOTH,
+		},
 	},
 	[7] = {
-		.mask = MAX77620_IRQ_LVL2_GPIO_EDGE7,
-		.type_rising_mask = MAX77620_CNFG_GPIO_INT_RISING,
-		.type_falling_mask = MAX77620_CNFG_GPIO_INT_FALLING,
 		.reg_offset = 0,
-		.type_reg_offset = 7,
+		.mask = MAX77620_IRQ_LVL2_GPIO_EDGE7,
+		.type = {
+			.type_rising_val = MAX77620_CNFG_GPIO_INT_RISING,
+			.type_falling_val = MAX77620_CNFG_GPIO_INT_FALLING,
+			.type_reg_mask = MAX77620_CNFG_GPIO_INT_MASK,
+			.type_reg_offset = 7,
+			.types_supported = IRQ_TYPE_EDGE_BOTH,
+		},
 	},
 };
 
diff --git a/include/linux/regmap.h b/include/linux/regmap.h
index b7aa50cfb306..a904f87151e8 100644
--- a/include/linux/regmap.h
+++ b/include/linux/regmap.h
@@ -1089,22 +1089,37 @@ int regmap_fields_read(struct regmap_field *field, unsigned int id,
 int regmap_fields_update_bits_base(struct regmap_field *field,  unsigned int id,
 				   unsigned int mask, unsigned int val,
 				   bool *change, bool async, bool force);
+/**
+ * struct regmap_irq_type - IRQ type definitions.
+ *
+ * @type_reg_offset: Offset register for the irq type setting.
+ * @type_rising_val: Register value to configure RISING type irq.
+ * @type_falling_val: Register value to configure FALLING type irq.
+ * @type_level_low_val: Register value to configure LEVEL_LOW type irq.
+ * @type_level_high_val: Register value to configure LEVEL_HIGH type irq.
+ * @types_supported: logical OR of IRQ_TYPE_* flags indicating supported types.
+ */
+struct regmap_irq_type {
+	unsigned int type_reg_offset;
+	unsigned int type_reg_mask;
+	unsigned int type_rising_val;
+	unsigned int type_falling_val;
+	unsigned int type_level_low_val;
+	unsigned int type_level_high_val;
+	unsigned int types_supported;
+};
 
 /**
  * struct regmap_irq - Description of an IRQ for the generic regmap irq_chip.
  *
  * @reg_offset: Offset of the status/mask register within the bank
  * @mask:       Mask used to flag/control the register.
- * @type_reg_offset: Offset register for the irq type setting.
- * @type_rising_mask: Mask bit to configure RISING type irq.
- * @type_falling_mask: Mask bit to configure FALLING type irq.
+ * @type:	IRQ trigger type setting details if supported.
  */
 struct regmap_irq {
 	unsigned int reg_offset;
 	unsigned int mask;
-	unsigned int type_reg_offset;
-	unsigned int type_rising_mask;
-	unsigned int type_falling_mask;
+	struct regmap_irq_type type;
 };
 
 #define REGMAP_IRQ_REG(_irq, _off, _mask)		\
-- 
2.14.3


-- 
Matti Vaittinen
ROHM Semiconductors

~~~ "I don't think so," said Rene Descartes.  Just then, he vanished ~~~
