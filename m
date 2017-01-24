From: Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH v2 2/2] gpio: aspeed: Add banks Y, Z, AA, AB and AC
Date: Tue, 24 Jan 2017 16:46:46 +1030
Message-ID: <20170124061646.9317-3-andrew@aj.id.au>
References: <20170124061646.9317-1-andrew@aj.id.au>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170124061646.9317-1-andrew@aj.id.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org
List-Id: linux-gpio@vger.kernel.org

This is less straight-forward than one would hope, as some banks only
have 4 pins rather than 8, others are output only, yet more (W and
X, already supported) are input-only, and in the case of the g4 SoC bank
AC doesn't exist.

Add some structs to describe the varying properties of different banks
and integrate mechanisms to deny requests for unsupported
configurations.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/gpio/gpio-aspeed.c | 174 +++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 160 insertions(+), 14 deletions(-)

diff --git a/drivers/gpio/gpio-aspeed.c b/drivers/gpio/gpio-aspeed.c
index 20f6f8ae4671..6e4b278a82f1 100644
--- a/drivers/gpio/gpio-aspeed.c
+++ b/drivers/gpio/gpio-aspeed.c
@@ -15,14 +15,27 @@
 #include <linux/io.h>
 #include <linux/spinlock.h>
 #include <linux/platform_device.h>
+#include <linux/gpio.h>
 #include <linux/gpio/driver.h>
 #include <linux/pinctrl/consumer.h>
 
+struct aspeed_bank_props {
+	unsigned int bank;
+	u32 input;
+	u32 output;
+};
+
+struct aspeed_gpio_config {
+	unsigned int nr_gpios;
+	const struct aspeed_bank_props *props;
+};
+
 struct aspeed_gpio {
 	struct gpio_chip chip;
 	spinlock_t lock;
 	void __iomem *base;
 	int irq;
+	const struct aspeed_gpio_config *config;
 };
 
 struct aspeed_gpio_bank {
@@ -62,11 +75,16 @@ static const struct aspeed_gpio_bank aspeed_gpio_banks[] = {
 		.irq_regs = 0x0148,
 		.names = { "U", "V", "W", "X" },
 	},
-	/*
-	 * A bank exists for { 'Y', 'Z', "AA", "AB" }, but is not implemented.
-	 * Only half of GPIOs Y support interrupt configuration, and none of Z,
-	 * AA or AB do as they are output only.
-	 */
+	{
+		.val_regs = 0x01E0,
+		.irq_regs = 0x0178,
+		.names = { "Y", "Z", "AA", "AB" },
+	},
+	{
+		.val_regs = 0x01E8,
+		.irq_regs = 0x01A8,
+		.names = { "AC", "", "", "" },
+	},
 };
 
 #define GPIO_BANK(x)	((x) >> 5)
@@ -90,6 +108,51 @@ static const struct aspeed_gpio_bank *to_bank(unsigned int offset)
 	return &aspeed_gpio_banks[bank];
 }
 
+static inline bool is_bank_props_sentinel(const struct aspeed_bank_props *props)
+{
+	return !(props->input || props->output);
+}
+
+static inline const struct aspeed_bank_props *find_bank_props(
+		struct aspeed_gpio *gpio, unsigned int offset)
+{
+	const struct aspeed_bank_props *props = gpio->config->props;
+
+	while (!is_bank_props_sentinel(props)) {
+		if (props->bank == GPIO_BANK(offset))
+			return props;
+		props++;
+	}
+
+	return NULL;
+}
+
+static inline bool have_gpio(struct aspeed_gpio *gpio, unsigned int offset)
+{
+	const struct aspeed_bank_props *props = find_bank_props(gpio, offset);
+	const struct aspeed_gpio_bank *bank = to_bank(offset);
+	unsigned int group = GPIO_OFFSET(offset) / 8;
+
+	return bank->names[group][0] != '\0' &&
+		(!props || ((props->input | props->output) & GPIO_BIT(offset)));
+}
+
+static inline bool have_input(struct aspeed_gpio *gpio, unsigned int offset)
+{
+	const struct aspeed_bank_props *props = find_bank_props(gpio, offset);
+
+	return !props || (props->input & GPIO_BIT(offset));
+}
+
+#define have_irq(g, o) have_input((g), (o))
+
+static inline bool have_output(struct aspeed_gpio *gpio, unsigned int offset)
+{
+	const struct aspeed_bank_props *props = find_bank_props(gpio, offset);
+
+	return !props || (props->output & GPIO_BIT(offset));
+}
+
 static void __iomem *bank_val_reg(struct aspeed_gpio *gpio,
 		const struct aspeed_gpio_bank *bank,
 		unsigned int reg)
@@ -152,6 +215,9 @@ static int aspeed_gpio_dir_in(struct gpio_chip *gc, unsigned int offset)
 	unsigned long flags;
 	u32 reg;
 
+	if (!have_input(gpio, offset))
+		return -ENOTSUPP;
+
 	spin_lock_irqsave(&gpio->lock, flags);
 
 	reg = ioread32(bank_val_reg(gpio, bank, GPIO_DIR));
@@ -170,6 +236,9 @@ static int aspeed_gpio_dir_out(struct gpio_chip *gc,
 	unsigned long flags;
 	u32 reg;
 
+	if (!have_output(gpio, offset))
+		return -ENOTSUPP;
+
 	spin_lock_irqsave(&gpio->lock, flags);
 
 	reg = ioread32(bank_val_reg(gpio, bank, GPIO_DIR));
@@ -189,6 +258,12 @@ static int aspeed_gpio_get_direction(struct gpio_chip *gc, unsigned int offset)
 	unsigned long flags;
 	u32 val;
 
+	if (!have_input(gpio, offset))
+		return GPIOF_DIR_OUT;
+
+	if (!have_output(gpio, offset))
+		return GPIOF_DIR_IN;
+
 	spin_lock_irqsave(&gpio->lock, flags);
 
 	val = ioread32(bank_val_reg(gpio, bank, GPIO_DIR)) & GPIO_BIT(offset);
@@ -205,10 +280,17 @@ static inline int irqd_to_aspeed_gpio_data(struct irq_data *d,
 		u32 *bit)
 {
 	int offset;
+	struct aspeed_gpio *internal;
 
 	offset = irqd_to_hwirq(d);
 
-	*gpio = irq_data_get_irq_chip_data(d);
+	internal = irq_data_get_irq_chip_data(d);
+
+	/* This might be a bit of a questionable place to check */
+	if (!have_irq(internal, offset))
+		return -ENOTSUPP;
+
+	*gpio = internal;
 	*bank = to_bank(offset);
 	*bit = GPIO_BIT(offset);
 
@@ -364,6 +446,28 @@ static struct irq_chip aspeed_gpio_irqchip = {
 	.irq_set_type	= aspeed_gpio_set_type,
 };
 
+static void set_irq_valid_mask(struct aspeed_gpio *gpio)
+{
+	const struct aspeed_bank_props *props = gpio->config->props;
+
+	while (!is_bank_props_sentinel(props)) {
+		unsigned int offset;
+		const unsigned long int input = props->input;
+
+		/* Pretty crummy approach, but similar to GPIO core */
+		for_each_clear_bit(offset, &input, 32) {
+			unsigned int i = props->bank * 32 + offset;
+
+			if (i >= gpio->config->nr_gpios)
+				break;
+
+			clear_bit(i, gpio->chip.irq_valid_mask);
+		}
+
+		props++;
+	}
+}
+
 static int aspeed_gpio_setup_irqs(struct aspeed_gpio *gpio,
 		struct platform_device *pdev)
 {
@@ -375,6 +479,8 @@ static int aspeed_gpio_setup_irqs(struct aspeed_gpio *gpio,
 
 	gpio->irq = rc;
 
+	set_irq_valid_mask(gpio);
+
 	rc = gpiochip_irqchip_add(&gpio->chip, &aspeed_gpio_irqchip,
 			0, handle_bad_irq, IRQ_TYPE_NONE);
 	if (rc) {
@@ -390,6 +496,9 @@ static int aspeed_gpio_setup_irqs(struct aspeed_gpio *gpio,
 
 static int aspeed_gpio_request(struct gpio_chip *chip, unsigned int offset)
 {
+	if (!have_gpio(gpiochip_get_data(chip), offset))
+		return -ENODEV;
+
 	return pinctrl_request_gpio(chip->base + offset);
 }
 
@@ -398,8 +507,46 @@ static void aspeed_gpio_free(struct gpio_chip *chip, unsigned int offset)
 	pinctrl_free_gpio(chip->base + offset);
 }
 
+/*
+ * Any banks not specified in a struct aspeed_bank_props array are assumed to
+ * have the properties:
+ *
+ *     { .input = 0xffffffff, .output = 0xffffffff }
+ */
+
+static const struct aspeed_bank_props ast2400_bank_props[] = {
+	/*     input	  output   */
+	{ 5, 0xffffffff, 0x0000ffff }, /* U/V/W/X */
+	{ 6, 0x0000000f, 0x0fffff0f }, /* Y/Z/AA/AB, two 4-GPIO holes */
+	{ },
+};
+
+static const struct aspeed_gpio_config ast2400_config =
+	/* 220 for simplicity, really 216 with two 4-GPIO holes, four at end */
+	{ .nr_gpios = 220, .props = ast2400_bank_props, };
+
+static const struct aspeed_bank_props ast2500_bank_props[] = {
+	/*     input	  output   */
+	{ 5, 0xffffffff, 0x0000ffff }, /* U/V/W/X */
+	{ 6, 0x0fffffff, 0x0fffffff }, /* Y/Z/AA/AB, 4-GPIO hole */
+	{ 7, 0x000000ff, 0x000000ff }, /* AC */
+	{ },
+};
+
+static const struct aspeed_gpio_config ast2500_config =
+	/* 232 for simplicity, actual number is 228 (4-GPIO hole in GPIOAB) */
+	{ .nr_gpios = 232, .props = ast2500_bank_props, };
+
+static const struct of_device_id aspeed_gpio_of_table[] = {
+	{ .compatible = "aspeed,ast2400-gpio", .data = &ast2400_config, },
+	{ .compatible = "aspeed,ast2500-gpio", .data = &ast2500_config, },
+	{}
+};
+MODULE_DEVICE_TABLE(of, aspeed_gpio_of_table);
+
 static int __init aspeed_gpio_probe(struct platform_device *pdev)
 {
+	const struct of_device_id *gpio_id;
 	struct aspeed_gpio *gpio;
 	struct resource *res;
 	int rc;
@@ -415,8 +562,13 @@ static int __init aspeed_gpio_probe(struct platform_device *pdev)
 
 	spin_lock_init(&gpio->lock);
 
-	gpio->chip.ngpio = ARRAY_SIZE(aspeed_gpio_banks) * 32;
+	gpio_id = of_match_node(aspeed_gpio_of_table, pdev->dev.of_node);
+	if (!gpio_id)
+		return -EINVAL;
 
+	gpio->config = gpio_id->data;
+
+	gpio->chip.ngpio = gpio->config->nr_gpios;
 	gpio->chip.parent = &pdev->dev;
 	gpio->chip.direction_input = aspeed_gpio_dir_in;
 	gpio->chip.direction_output = aspeed_gpio_dir_out;
@@ -427,6 +579,7 @@ static int __init aspeed_gpio_probe(struct platform_device *pdev)
 	gpio->chip.set = aspeed_gpio_set;
 	gpio->chip.label = dev_name(&pdev->dev);
 	gpio->chip.base = -1;
+	gpio->chip.irq_need_valid_mask = true;
 
 	rc = devm_gpiochip_add_data(&pdev->dev, &gpio->chip, gpio);
 	if (rc < 0)
@@ -435,13 +588,6 @@ static int __init aspeed_gpio_probe(struct platform_device *pdev)
 	return aspeed_gpio_setup_irqs(gpio, pdev);
 }
 
-static const struct of_device_id aspeed_gpio_of_table[] = {
-	{ .compatible = "aspeed,ast2400-gpio" },
-	{ .compatible = "aspeed,ast2500-gpio" },
-	{}
-};
-MODULE_DEVICE_TABLE(of, aspeed_gpio_of_table);
-
 static struct platform_driver aspeed_gpio_driver = {
 	.driver = {
 		.name = KBUILD_MODNAME,
-- 
2.9.3
