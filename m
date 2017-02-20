From: Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH] gpio: aspeed: Add debounce support
Date: Tue, 21 Feb 2017 01:10:04 +1030
Message-ID: <20170220144004.10809-1-andrew@aj.id.au>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org
List-Id: linux-gpio@vger.kernel.org

Each GPIO in the Aspeed GPIO controller can choose one of four input
debounce states: to not debounce an input or to select from one of three
programmable debounce timer values. Each GPIO in a four-bank-set is
assigned one bit in each of two debounce configuration registers
dedicated to the set, and selects a debounce state by configuring the
two bits to select one of the four options.

The limitation on debounce timer values is managed by mapping offsets
onto a configured timer value and keeping count of the number of users
a timer has. Timer values are configured on a first-come-first-served
basis.

A small twist in the hardware design is that the debounce configuration
register numbering is reversed with respect to the binary representation
of the debounce timer of interest (i.e. debounce register 1 represents
bit 1, and debounce register 2 represents bit 0 of the timer numbering).

Open-drain/open-source support also introduced, but merely by deferring
to the gpiolib emulation (as per the datasheet).

Tested on an AST2500EVB.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/gpio/gpio-aspeed.c | 244 ++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 239 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpio-aspeed.c b/drivers/gpio/gpio-aspeed.c
index fb16cc771c0d..164a75272151 100644
--- a/drivers/gpio/gpio-aspeed.c
+++ b/drivers/gpio/gpio-aspeed.c
@@ -9,14 +9,17 @@
  * 2 of the License, or (at your option) any later version.
  */
 
-#include <linux/module.h>
-#include <linux/kernel.h>
+#include <asm/div64.h>
+#include <linux/clk.h>
+#include <linux/gpio/driver.h>
+#include <linux/hashtable.h>
 #include <linux/init.h>
 #include <linux/io.h>
-#include <linux/spinlock.h>
-#include <linux/platform_device.h>
-#include <linux/gpio/driver.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
 #include <linux/pinctrl/consumer.h>
+#include <linux/platform_device.h>
+#include <linux/spinlock.h>
 
 struct aspeed_bank_props {
 	unsigned int bank;
@@ -29,59 +32,81 @@ struct aspeed_gpio_config {
 	const struct aspeed_bank_props *props;
 };
 
+struct aspeed_debounce_timer {
+	unsigned int offset;
+	unsigned int timer;
+	struct hlist_node node;
+};
+
 struct aspeed_gpio {
 	struct gpio_chip chip;
 	spinlock_t lock;
 	void __iomem *base;
 	int irq;
 	const struct aspeed_gpio_config *config;
+
+	/* Debouncing */
+	DECLARE_HASHTABLE(offset_timer, 5);
+	unsigned int timer_users[3];
+	struct clk *clk;
 };
 
 struct aspeed_gpio_bank {
 	uint16_t	val_regs;
 	uint16_t	irq_regs;
+	uint16_t	debounce_regs;
 	const char	names[4][3];
 };
 
+static const int debounce_timers[3] = { 0x50, 0x54, 0x58 };
+
 static const struct aspeed_gpio_bank aspeed_gpio_banks[] = {
 	{
 		.val_regs = 0x0000,
 		.irq_regs = 0x0008,
+		.debounce_regs = 0x0040,
 		.names = { "A", "B", "C", "D" },
 	},
 	{
 		.val_regs = 0x0020,
 		.irq_regs = 0x0028,
+		.debounce_regs = 0x0048,
 		.names = { "E", "F", "G", "H" },
 	},
 	{
 		.val_regs = 0x0070,
 		.irq_regs = 0x0098,
+		.debounce_regs = 0x00b0,
 		.names = { "I", "J", "K", "L" },
 	},
 	{
 		.val_regs = 0x0078,
 		.irq_regs = 0x00e8,
+		.debounce_regs = 0x0100,
 		.names = { "M", "N", "O", "P" },
 	},
 	{
 		.val_regs = 0x0080,
 		.irq_regs = 0x0118,
+		.debounce_regs = 0x0130,
 		.names = { "Q", "R", "S", "T" },
 	},
 	{
 		.val_regs = 0x0088,
 		.irq_regs = 0x0148,
+		.debounce_regs = 0x0160,
 		.names = { "U", "V", "W", "X" },
 	},
 	{
 		.val_regs = 0x01E0,
 		.irq_regs = 0x0178,
+		.debounce_regs = 0x0190,
 		.names = { "Y", "Z", "AA", "AB" },
 	},
 	{
 		.val_regs = 0x01E8,
 		.irq_regs = 0x01A8,
+		.debounce_regs = 0x01c0,
 		.names = { "AC", "", "", "" },
 	},
 };
@@ -99,6 +124,13 @@ static const struct aspeed_gpio_bank aspeed_gpio_banks[] = {
 #define GPIO_IRQ_TYPE2	0x0c
 #define GPIO_IRQ_STATUS	0x10
 
+#define GPIO_DEBOUNCE_SEL1 0x00
+#define GPIO_DEBOUNCE_SEL2 0x04
+
+#define _GPIO_SET_DEBOUNCE(t, o, i) ((!!((t + 1) & BIT(i))) << GPIO_OFFSET(o))
+#define GPIO_SET_DEBOUNCE1(t, o) _GPIO_SET_DEBOUNCE(t, o, 1)
+#define GPIO_SET_DEBOUNCE2(t, o) _GPIO_SET_DEBOUNCE(t, o, 0)
+
 static const struct aspeed_gpio_bank *to_bank(unsigned int offset)
 {
 	unsigned int bank = GPIO_BANK(offset);
@@ -144,6 +176,7 @@ static inline bool have_input(struct aspeed_gpio *gpio, unsigned int offset)
 }
 
 #define have_irq(g, o) have_input((g), (o))
+#define have_debounce(g, o) have_input((g), (o))
 
 static inline bool have_output(struct aspeed_gpio *gpio, unsigned int offset)
 {
@@ -506,6 +539,200 @@ static void aspeed_gpio_free(struct gpio_chip *chip, unsigned int offset)
 	pinctrl_free_gpio(chip->base + offset);
 }
 
+static inline void __iomem *bank_debounce_reg(struct aspeed_gpio *gpio,
+		const struct aspeed_gpio_bank *bank,
+		unsigned int reg)
+{
+	return gpio->base + bank->debounce_regs + reg;
+}
+
+static inline int usecs_to_cycles(struct aspeed_gpio *gpio, unsigned long usecs,
+		u32 *cycles)
+{
+	u64 rate;
+	u64 n;
+
+	rate = clk_get_rate(gpio->clk);
+	if (!rate)
+		return -ENODEV;
+
+	n = rate * usecs;
+	do_div(n, 1000000);
+
+	if (n >= U32_MAX)
+		return -ERANGE;
+
+	/* At least as long as the requested time */
+	*cycles = n + 1;
+
+	return 0;
+}
+
+static int aspeed_gpio_set_debounce(struct gpio_chip *chip, unsigned int offset,
+				    unsigned long usecs)
+{
+	const struct aspeed_gpio_bank *bank = to_bank(offset);
+	struct aspeed_gpio *gpio = gpiochip_get_data(chip);
+	const u32 mask = GPIO_BIT(offset);
+	unsigned long flags;
+	void __iomem *addr;
+	u32 val;
+	int rc;
+
+	if (!have_debounce(gpio, offset))
+		return -ENOTSUPP;
+
+	if (usecs) {
+		struct aspeed_debounce_timer *dt, *newdt;
+		u32 requested_cycles;
+		int i;
+
+		/*
+		 * TODO: Look at improving these:
+		 *
+		 * - we always delete users of timers even if the call is for a
+		 *   duplicate debounce period for an offset
+		 * - we don't reuse struct aspeed_debounce_timer allocations if
+		 *   the offset is already using a timer
+		 */
+
+		rc = usecs_to_cycles(gpio, usecs, &requested_cycles);
+		if (rc < 0)
+			return rc;
+
+		newdt = devm_kmalloc(chip->parent, sizeof(*dt), GFP_KERNEL);
+		if (!newdt)
+			return -ENOMEM;
+
+		spin_lock_irqsave(&gpio->lock, flags);
+
+		/* Check if the @offset is already using a timer */
+		hash_for_each_possible(gpio->offset_timer, dt, node, offset) {
+			if (offset == dt->offset) {
+				hash_del(&dt->node);
+				WARN_ON(!gpio->timer_users[dt->timer]);
+				gpio->timer_users[dt->timer]--;
+				devm_kfree(chip->parent, dt);
+				break;
+			}
+		}
+
+		/*
+		 * Check if a timer is already configured for the requested
+		 * debounce period. If so, just add @offset as a user of this
+		 * timer
+		 */
+		for (i = 0; i < ARRAY_SIZE(debounce_timers); i++) {
+			u32 cycles;
+
+			addr = gpio->base + debounce_timers[i];
+			cycles = ioread32(addr);
+
+			if (requested_cycles == cycles)
+				break;
+		}
+
+		/* Otherwise, allocate a timer */
+		if (i == ARRAY_SIZE(debounce_timers)) {
+			for (i = 0; i < ARRAY_SIZE(gpio->timer_users); i++) {
+				if (gpio->timer_users[i] == 0)
+					break;
+			}
+
+			/* We have run out of timers */
+			if (i == ARRAY_SIZE(gpio->timer_users)) {
+				dev_warn(chip->parent,
+						"Debounce timers exhausted, cannot debounce for period %luus\n",
+						usecs);
+				rc = -EPERM;
+				goto err;
+			}
+
+			/* Timer update */
+			addr = gpio->base + debounce_timers[i];
+			iowrite32(requested_cycles, addr);
+		}
+
+		/* Register @offset as a user of timer i */
+		newdt->offset = offset;
+		newdt->timer = i;
+		hash_add(gpio->offset_timer, &newdt->node, offset);
+
+		WARN_ON(gpio->timer_users[i] == UINT_MAX);
+		gpio->timer_users[i]++;
+
+		/* Configure @offset to use timer i */
+		addr = bank_debounce_reg(gpio, bank, GPIO_DEBOUNCE_SEL1);
+		val = ioread32(addr);
+		iowrite32((val & ~mask) | GPIO_SET_DEBOUNCE1(i, offset), addr);
+
+		addr = bank_debounce_reg(gpio, bank, GPIO_DEBOUNCE_SEL2);
+		val = ioread32(addr);
+		iowrite32((val & ~mask) | GPIO_SET_DEBOUNCE2(i, offset), addr);
+
+		spin_unlock_irqrestore(&gpio->lock, flags);
+	} else {
+		struct aspeed_debounce_timer *dt;
+
+		spin_lock_irqsave(&gpio->lock, flags);
+
+		/* Unregister any record of timer use by @offset */
+		hash_for_each_possible(gpio->offset_timer, dt, node, offset) {
+			if (offset == dt->offset) {
+				WARN_ON(!gpio->timer_users[dt->timer]);
+
+				gpio->timer_users[dt->timer]--;
+				hash_del(&dt->node);
+				devm_kfree(chip->parent, dt);
+				break;
+			}
+		}
+
+		addr = bank_debounce_reg(gpio, bank, GPIO_DEBOUNCE_SEL1);
+		val = ioread32(addr);
+		iowrite32((val & ~mask), addr);
+
+		addr = bank_debounce_reg(gpio, bank, GPIO_DEBOUNCE_SEL2);
+		val = ioread32(addr);
+		iowrite32((val & ~mask), addr);
+
+		spin_unlock_irqrestore(&gpio->lock, flags);
+	}
+
+	return rc;
+
+err:
+	spin_unlock_irqrestore(&gpio->lock, flags);
+
+	return rc;
+}
+
+static int aspeed_gpio_set_config(struct gpio_chip *chip, unsigned int offset,
+				  unsigned long config)
+{
+	unsigned long param = pinconf_to_config_param(config);
+	u32 arg = pinconf_to_config_argument(config);
+	int rc;
+
+	switch (param) {
+	case PIN_CONFIG_INPUT_DEBOUNCE:
+		rc = aspeed_gpio_set_debounce(chip, offset, arg);
+		break;
+	case PIN_CONFIG_BIAS_DISABLE:
+	case PIN_CONFIG_BIAS_PULL_DOWN:
+	case PIN_CONFIG_DRIVE_STRENGTH:
+		rc = pinctrl_gpio_set_config(offset, config);
+		break;
+	case PIN_CONFIG_DRIVE_OPEN_DRAIN:
+	case PIN_CONFIG_DRIVE_OPEN_SOURCE:
+		/* Fallthrough for emulation, as per datasheet */
+	default:
+		rc = -ENOTSUPP;
+	}
+
+	return rc;
+}
+
 /*
  * Any banks not specified in a struct aspeed_bank_props array are assumed to
  * have the properties:
@@ -560,13 +787,19 @@ static int __init aspeed_gpio_probe(struct platform_device *pdev)
 		return PTR_ERR(gpio->base);
 
 	spin_lock_init(&gpio->lock);
+	hash_init(gpio->offset_timer);
 
 	gpio_id = of_match_node(aspeed_gpio_of_table, pdev->dev.of_node);
 	if (!gpio_id)
 		return -EINVAL;
 
+	gpio->clk = of_clk_get(pdev->dev.of_node, 0);
+	if (IS_ERR(gpio->clk))
+		return PTR_ERR(gpio->clk);
+
 	gpio->config = gpio_id->data;
 
+	gpio->chip.parent = &pdev->dev;
 	gpio->chip.ngpio = gpio->config->nr_gpios;
 	gpio->chip.parent = &pdev->dev;
 	gpio->chip.direction_input = aspeed_gpio_dir_in;
@@ -576,6 +809,7 @@ static int __init aspeed_gpio_probe(struct platform_device *pdev)
 	gpio->chip.free = aspeed_gpio_free;
 	gpio->chip.get = aspeed_gpio_get;
 	gpio->chip.set = aspeed_gpio_set;
+	gpio->chip.set_config = aspeed_gpio_set_config;
 	gpio->chip.label = dev_name(&pdev->dev);
 	gpio->chip.base = -1;
 	gpio->chip.irq_need_valid_mask = true;
-- 
2.9.3
