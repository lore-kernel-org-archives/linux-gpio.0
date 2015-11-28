From: Robert Jarzmik <robert.jarzmik@free.fr>
Subject: [PATCH 1/4] gpio: pxa: convert to one gpiochip
Date: Sat, 28 Nov 2015 22:37:42 +0100
Message-ID: <1448746665-13422-2-git-send-email-robert.jarzmik@free.fr>
References: <1448746665-13422-1-git-send-email-robert.jarzmik@free.fr>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1448746665-13422-1-git-send-email-robert.jarzmik@free.fr>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Haojian Zhuang <haojian.zhuang@gmail.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Daniel Mack <zonque@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>
List-Id: linux-gpio@vger.kernel.org

The pxa gpio IP is provided by one chip, which holds multiple banks.

Another reason the driver should register only one gpiochip instead of
multiple gpiochips (ie. 1 per each bank) is that for pincontrol and
devicetree integration (think gpio-ranges), it's impossible to have the
contiguous pin range 0..127 mapped to gpios 0..127.

This patch, amongst other thinks, paves the path to loosen the bond with
the global structure variable pxa_gpio_chip.

Signed-off-by: Robert Jarzmik <robert.jarzmik@free.fr>
---
 drivers/gpio/gpio-pxa.c | 221 ++++++++++++++++++++++++++----------------------
 1 file changed, 120 insertions(+), 101 deletions(-)

diff --git a/drivers/gpio/gpio-pxa.c b/drivers/gpio/gpio-pxa.c
index df2ce550f309..de2cfbeccaa1 100644
--- a/drivers/gpio/gpio-pxa.c
+++ b/drivers/gpio/gpio-pxa.c
@@ -69,15 +69,11 @@ static struct irq_domain *domain;
 static struct device_node *pxa_gpio_of_node;
 #endif
 
-struct pxa_gpio_chip {
-	struct gpio_chip chip;
+struct pxa_gpio_bank {
 	void __iomem	*regbase;
-	char label[10];
-
 	unsigned long	irq_mask;
 	unsigned long	irq_edge_rise;
 	unsigned long	irq_edge_fall;
-	int (*set_wake)(unsigned int gpio, unsigned int on);
 
 #ifdef CONFIG_PM
 	unsigned long	saved_gplr;
@@ -87,6 +83,16 @@ struct pxa_gpio_chip {
 #endif
 };
 
+struct pxa_gpio_chip {
+	struct device *dev;
+	struct gpio_chip chip;
+	struct pxa_gpio_bank *banks;
+
+	int irq0;
+	int irq1;
+	int (*set_wake)(unsigned int gpio, unsigned int on);
+};
+
 enum pxa_gpio_type {
 	PXA25X_GPIO = 0,
 	PXA26X_GPIO,
@@ -104,9 +110,8 @@ struct pxa_gpio_id {
 };
 
 static DEFINE_SPINLOCK(gpio_lock);
-static struct pxa_gpio_chip *pxa_gpio_chips;
+static struct pxa_gpio_chip *pxa_gpio_chip;
 static enum pxa_gpio_type gpio_type;
-static void __iomem *gpio_reg_base;
 
 static struct pxa_gpio_id pxa25x_id = {
 	.type		= PXA25X_GPIO,
@@ -148,17 +153,27 @@ static struct pxa_gpio_id pxa1928_id = {
 	.gpio_nums	= 224,
 };
 
-#define for_each_gpio_chip(i, c)			\
-	for (i = 0, c = &pxa_gpio_chips[0]; i <= pxa_last_gpio; i += 32, c++)
+#define for_each_gpio_bank(i, b, pc)					\
+	for (i = 0, b = pc->banks; i <= pxa_last_gpio; i += 32, b++)
 
-static inline void __iomem *gpio_chip_base(struct gpio_chip *c)
+static inline struct pxa_gpio_chip *chip_to_pxachip(struct gpio_chip *c)
 {
-	return container_of(c, struct pxa_gpio_chip, chip)->regbase;
+	struct pxa_gpio_chip *pxa_chip =
+		container_of(c, struct pxa_gpio_chip, chip);
+
+	return pxa_chip;
 }
+static inline void __iomem *gpio_bank_base(struct gpio_chip *c, int gpio)
+{
+	struct pxa_gpio_bank *bank = chip_to_pxachip(c)->banks + (gpio / 32);
 
-static inline struct pxa_gpio_chip *gpio_to_pxachip(unsigned gpio)
+	return bank->regbase;
+}
+
+static inline struct pxa_gpio_bank *gpio_to_pxabank(struct gpio_chip *c,
+						    unsigned gpio)
 {
-	return &pxa_gpio_chips[gpio_to_bank(gpio)];
+	return chip_to_pxachip(c)->banks + gpio / 32;
 }
 
 static inline int gpio_is_pxa_type(int type)
@@ -187,15 +202,13 @@ static inline int __gpio_is_inverted(int gpio)
  * is attributed as "occupied" here (I know this terminology isn't
  * accurate, you are welcome to propose a better one :-)
  */
-static inline int __gpio_is_occupied(unsigned gpio)
+static inline int __gpio_is_occupied(struct pxa_gpio_chip *pchip, unsigned gpio)
 {
-	struct pxa_gpio_chip *pxachip;
 	void __iomem *base;
 	unsigned long gafr = 0, gpdr = 0;
 	int ret, af = 0, dir = 0;
 
-	pxachip = gpio_to_pxachip(gpio);
-	base = gpio_chip_base(&pxachip->chip);
+	base = gpio_bank_base(&pchip->chip, gpio);
 	gpdr = readl_relaxed(base + GPDR_OFFSET);
 
 	switch (gpio_type) {
@@ -220,7 +233,7 @@ static inline int __gpio_is_occupied(unsigned gpio)
 
 static int pxa_gpio_to_irq(struct gpio_chip *chip, unsigned offset)
 {
-	return chip->base + offset + irq_base;
+	return offset + irq_base;
 }
 
 int pxa_irq_to_gpio(int irq)
@@ -230,8 +243,8 @@ int pxa_irq_to_gpio(int irq)
 
 static int pxa_gpio_direction_input(struct gpio_chip *chip, unsigned offset)
 {
-	void __iomem *base = gpio_chip_base(chip);
-	uint32_t value, mask = 1 << offset;
+	void __iomem *base = gpio_bank_base(chip, offset);
+	uint32_t value, mask = GPIO_bit(offset);
 	unsigned long flags;
 
 	spin_lock_irqsave(&gpio_lock, flags);
@@ -250,8 +263,8 @@ static int pxa_gpio_direction_input(struct gpio_chip *chip, unsigned offset)
 static int pxa_gpio_direction_output(struct gpio_chip *chip,
 				     unsigned offset, int value)
 {
-	void __iomem *base = gpio_chip_base(chip);
-	uint32_t tmp, mask = 1 << offset;
+	void __iomem *base = gpio_bank_base(chip, offset);
+	uint32_t tmp, mask = GPIO_bit(offset);
 	unsigned long flags;
 
 	writel_relaxed(mask, base + (value ? GPSR_OFFSET : GPCR_OFFSET));
@@ -271,14 +284,18 @@ static int pxa_gpio_direction_output(struct gpio_chip *chip,
 
 static int pxa_gpio_get(struct gpio_chip *chip, unsigned offset)
 {
-	u32 gplr = readl_relaxed(gpio_chip_base(chip) + GPLR_OFFSET);
-	return !!(gplr & (1 << offset));
+	void __iomem *base = gpio_bank_base(chip, offset);
+	u32 gplr = readl_relaxed(base + GPLR_OFFSET);
+
+	return !!(gplr & GPIO_bit(offset));
 }
 
 static void pxa_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
 {
-	writel_relaxed(1 << offset, gpio_chip_base(chip) +
-				(value ? GPSR_OFFSET : GPCR_OFFSET));
+	void __iomem *base = gpio_bank_base(chip, offset);
+
+	writel_relaxed(GPIO_bit(offset),
+		       base + (value ? GPSR_OFFSET : GPCR_OFFSET));
 }
 
 #ifdef CONFIG_OF_GPIO
@@ -289,61 +306,49 @@ static int pxa_gpio_of_xlate(struct gpio_chip *gc,
 	if (gpiospec->args[0] > pxa_last_gpio)
 		return -EINVAL;
 
-	if (gc != &pxa_gpio_chips[gpiospec->args[0] / 32].chip)
-		return -EINVAL;
-
 	if (flags)
 		*flags = gpiospec->args[1];
 
-	return gpiospec->args[0] % 32;
+	return gpiospec->args[0];
 }
 #endif
 
-static int pxa_init_gpio_chip(int gpio_end,
-					int (*set_wake)(unsigned int, unsigned int))
+static int pxa_init_gpio_chip(struct pxa_gpio_chip *pchip, int ngpio,
+			      void __iomem *regbase)
 {
-	int i, gpio, nbanks = gpio_to_bank(gpio_end) + 1;
-	struct pxa_gpio_chip *chips;
+	int i, gpio, nbanks = DIV_ROUND_UP(ngpio, 32);
+	struct pxa_gpio_bank *bank;
 
-	chips = kzalloc(nbanks * sizeof(struct pxa_gpio_chip), GFP_KERNEL);
-	if (chips == NULL) {
-		pr_err("%s: failed to allocate GPIO chips\n", __func__);
+	pchip->banks = devm_kcalloc(pchip->dev, nbanks, sizeof(*pchip->banks),
+				    GFP_KERNEL);
+	if (!pchip->banks)
 		return -ENOMEM;
-	}
 
-	for (i = 0, gpio = 0; i < nbanks; i++, gpio += 32) {
-		struct gpio_chip *c = &chips[i].chip;
-
-		sprintf(chips[i].label, "gpio-%d", i);
-		chips[i].regbase = gpio_reg_base + BANK_OFF(i);
-		chips[i].set_wake = set_wake;
-
-		c->base  = gpio;
-		c->label = chips[i].label;
-
-		c->direction_input  = pxa_gpio_direction_input;
-		c->direction_output = pxa_gpio_direction_output;
-		c->get = pxa_gpio_get;
-		c->set = pxa_gpio_set;
-		c->to_irq = pxa_gpio_to_irq;
+	pchip->chip.label = "gpio-pxa";
+	pchip->chip.direction_input  = pxa_gpio_direction_input;
+	pchip->chip.direction_output = pxa_gpio_direction_output;
+	pchip->chip.get = pxa_gpio_get;
+	pchip->chip.set = pxa_gpio_set;
+	pchip->chip.to_irq = pxa_gpio_to_irq;
+	pchip->chip.ngpio = ngpio;
 #ifdef CONFIG_OF_GPIO
-		c->of_node = pxa_gpio_of_node;
-		c->of_xlate = pxa_gpio_of_xlate;
-		c->of_gpio_n_cells = 2;
+	pchip->chip.of_node = pxa_gpio_of_node;
+	pchip->chip.of_xlate = pxa_gpio_of_xlate;
+	pchip->chip.of_gpio_n_cells = 2;
 #endif
 
-		/* number of GPIOs on last bank may be less than 32 */
-		c->ngpio = (gpio + 31 > gpio_end) ? (gpio_end - gpio + 1) : 32;
-		gpiochip_add(c);
+	for (i = 0, gpio = 0; i < nbanks; i++, gpio += 32) {
+		bank = pchip->banks + i;
+		bank->regbase = regbase + BANK_OFF(i);
 	}
-	pxa_gpio_chips = chips;
-	return 0;
+
+	return gpiochip_add(&pchip->chip);
 }
 
 /* Update only those GRERx and GFERx edge detection register bits if those
  * bits are set in c->irq_mask
  */
-static inline void update_edge_detect(struct pxa_gpio_chip *c)
+static inline void update_edge_detect(struct pxa_gpio_bank *c)
 {
 	uint32_t grer, gfer;
 
@@ -357,12 +362,11 @@ static inline void update_edge_detect(struct pxa_gpio_chip *c)
 
 static int pxa_gpio_irq_type(struct irq_data *d, unsigned int type)
 {
-	struct pxa_gpio_chip *c;
+	struct pxa_gpio_chip *pchip = pxa_gpio_chip;
 	int gpio = pxa_irq_to_gpio(d->irq);
+	struct pxa_gpio_bank *c = gpio_to_pxabank(&pchip->chip, gpio);
 	unsigned long gpdr, mask = GPIO_bit(gpio);
 
-	c = gpio_to_pxachip(gpio);
-
 	if (type == IRQ_TYPE_PROBE) {
 		/* Don't mess with enabled GPIOs using preconfigured edges or
 		 * GPIOs set to alternate function or to output during probe
@@ -370,7 +374,7 @@ static int pxa_gpio_irq_type(struct irq_data *d, unsigned int type)
 		if ((c->irq_edge_rise | c->irq_edge_fall) & GPIO_bit(gpio))
 			return 0;
 
-		if (__gpio_is_occupied(gpio))
+		if (__gpio_is_occupied(pchip, gpio))
 			return 0;
 
 		type = IRQ_TYPE_EDGE_RISING | IRQ_TYPE_EDGE_FALLING;
@@ -403,18 +407,17 @@ static int pxa_gpio_irq_type(struct irq_data *d, unsigned int type)
 
 static void pxa_gpio_demux_handler(struct irq_desc *desc)
 {
-	struct pxa_gpio_chip *c;
-	int loop, gpio, gpio_base, n;
+	int loop, gpio, n, handled = 0;
 	unsigned long gedr;
 	struct irq_chip *chip = irq_desc_get_chip(desc);
+	struct pxa_gpio_chip *pchip = pxa_gpio_chip;
+	struct pxa_gpio_bank *c;
 
 	chained_irq_enter(chip, desc);
 
 	do {
 		loop = 0;
-		for_each_gpio_chip(gpio, c) {
-			gpio_base = c->chip.base;
-
+		for_each_gpio_bank(gpio, c, pchip) {
 			gedr = readl_relaxed(c->regbase + GEDR_OFFSET);
 			gedr = gedr & c->irq_mask;
 			writel_relaxed(gedr, c->regbase + GEDR_OFFSET);
@@ -422,7 +425,7 @@ static void pxa_gpio_demux_handler(struct irq_desc *desc)
 			for_each_set_bit(n, &gedr, BITS_PER_LONG) {
 				loop = 1;
 
-				generic_handle_irq(gpio_to_irq(gpio_base + n));
+				generic_handle_irq(gpio_to_irq(gpio + n));
 			}
 		}
 	} while (loop);
@@ -432,41 +435,45 @@ static void pxa_gpio_demux_handler(struct irq_desc *desc)
 
 static void pxa_ack_muxed_gpio(struct irq_data *d)
 {
+	struct pxa_gpio_chip *pchip = pxa_gpio_chip;
 	int gpio = pxa_irq_to_gpio(d->irq);
-	struct pxa_gpio_chip *c = gpio_to_pxachip(gpio);
+	void __iomem *base = gpio_bank_base(&pchip->chip, gpio);
 
-	writel_relaxed(GPIO_bit(gpio), c->regbase + GEDR_OFFSET);
+	writel_relaxed(GPIO_bit(gpio), base + GEDR_OFFSET);
 }
 
 static void pxa_mask_muxed_gpio(struct irq_data *d)
 {
+	struct pxa_gpio_chip *pchip = pxa_gpio_chip;
 	int gpio = pxa_irq_to_gpio(d->irq);
-	struct pxa_gpio_chip *c = gpio_to_pxachip(gpio);
+	struct pxa_gpio_bank *b = gpio_to_pxabank(&pchip->chip, gpio);
+	void __iomem *base = gpio_bank_base(&pchip->chip, gpio);
 	uint32_t grer, gfer;
 
-	c->irq_mask &= ~GPIO_bit(gpio);
+	b->irq_mask &= ~GPIO_bit(gpio);
 
-	grer = readl_relaxed(c->regbase + GRER_OFFSET) & ~GPIO_bit(gpio);
-	gfer = readl_relaxed(c->regbase + GFER_OFFSET) & ~GPIO_bit(gpio);
-	writel_relaxed(grer, c->regbase + GRER_OFFSET);
-	writel_relaxed(gfer, c->regbase + GFER_OFFSET);
+	grer = readl_relaxed(base + GRER_OFFSET) & ~GPIO_bit(gpio);
+	gfer = readl_relaxed(base + GFER_OFFSET) & ~GPIO_bit(gpio);
+	writel_relaxed(grer, base + GRER_OFFSET);
+	writel_relaxed(gfer, base + GFER_OFFSET);
 }
 
 static int pxa_gpio_set_wake(struct irq_data *d, unsigned int on)
 {
 	int gpio = pxa_irq_to_gpio(d->irq);
-	struct pxa_gpio_chip *c = gpio_to_pxachip(gpio);
+	struct pxa_gpio_chip *pchip = pxa_gpio_chip;
 
-	if (c->set_wake)
-		return c->set_wake(gpio, on);
+	if (pchip->set_wake)
+		return pchip->set_wake(gpio, on);
 	else
 		return 0;
 }
 
 static void pxa_unmask_muxed_gpio(struct irq_data *d)
 {
+	struct pxa_gpio_chip *pchip = pxa_gpio_chip;
 	int gpio = pxa_irq_to_gpio(d->irq);
-	struct pxa_gpio_chip *c = gpio_to_pxachip(gpio);
+	struct pxa_gpio_bank *c = gpio_to_pxabank(&pchip->chip, gpio);
 
 	c->irq_mask |= GPIO_bit(gpio);
 	update_edge_detect(c);
@@ -533,9 +540,10 @@ const struct irq_domain_ops pxa_irq_domain_ops = {
 	.xlate	= irq_domain_xlate_twocell,
 };
 
-static int pxa_gpio_probe_dt(struct platform_device *pdev)
+static int pxa_gpio_probe_dt(struct platform_device *pdev,
+			     struct pxa_gpio_chip *pchip)
 {
-	int ret = 0, nr_gpios;
+	int nr_gpios;
 	struct device_node *np = pdev->dev.of_node;
 	const struct of_device_id *of_id =
 				of_match_device(pxa_gpio_dt_ids, &pdev->dev);
@@ -554,40 +562,44 @@ static int pxa_gpio_probe_dt(struct platform_device *pdev)
 	irq_base = irq_alloc_descs(-1, 0, nr_gpios, 0);
 	if (irq_base < 0) {
 		dev_err(&pdev->dev, "Failed to allocate IRQ numbers\n");
-		ret = irq_base;
-		goto err;
+		return irq_base;
 	}
 	domain = irq_domain_add_legacy(np, nr_gpios, irq_base, 0,
-				       &pxa_irq_domain_ops, NULL);
+				       &pxa_irq_domain_ops, pchip);
 	pxa_gpio_of_node = np;
 	return 0;
-err:
-	iounmap(gpio_reg_base);
-	return ret;
 }
 #else
-#define pxa_gpio_probe_dt(pdev)		(-1)
+#define pxa_gpio_probe_dt(pdev, pchip)		(-1)
 #endif
 
 static int pxa_gpio_probe(struct platform_device *pdev)
 {
-	struct pxa_gpio_chip *c;
+	struct pxa_gpio_chip *pchip;
+	struct pxa_gpio_bank *c;
 	struct resource *res;
 	struct clk *clk;
 	struct pxa_gpio_platform_data *info;
+	void __iomem *gpio_reg_base;
 	int gpio, irq, ret, use_of = 0;
 	int irq0 = 0, irq1 = 0, irq_mux, gpio_offset = 0;
 
+	pchip = devm_kzalloc(&pdev->dev, sizeof(*pchip), GFP_KERNEL);
+	if (!pchip)
+		return -ENOMEM;
+	pchip->dev = &pdev->dev;
+
 	info = dev_get_platdata(&pdev->dev);
 	if (info) {
 		irq_base = info->irq_base;
 		if (irq_base <= 0)
 			return -EINVAL;
 		pxa_last_gpio = pxa_gpio_nums(pdev);
+		pchip->set_wake = info->gpio_set_wake;
 	} else {
 		irq_base = 0;
 		use_of = 1;
-		ret = pxa_gpio_probe_dt(pdev);
+		ret = pxa_gpio_probe_dt(pdev, pchip);
 		if (ret < 0)
 			return -EINVAL;
 	}
@@ -626,10 +638,14 @@ static int pxa_gpio_probe(struct platform_device *pdev)
 	}
 
 	/* Initialize GPIO chips */
-	pxa_init_gpio_chip(pxa_last_gpio, info ? info->gpio_set_wake : NULL);
+	ret = pxa_init_gpio_chip(pchip, pxa_last_gpio + 1, gpio_reg_base);
+	if (ret) {
+		clk_put(clk);
+		return ret;
+	}
 
 	/* clear all GPIO edge detects */
-	for_each_gpio_chip(gpio, c) {
+	for_each_gpio_bank(gpio, c, pchip) {
 		writel_relaxed(0, c->regbase + GFER_OFFSET);
 		writel_relaxed(0, c->regbase + GRER_OFFSET);
 		writel_relaxed(~0, c->regbase + GEDR_OFFSET);
@@ -664,6 +680,7 @@ static int pxa_gpio_probe(struct platform_device *pdev)
 		irq_set_chained_handler(irq0, pxa_gpio_demux_handler);
 	if (irq1 > 0)
 		irq_set_chained_handler(irq1, pxa_gpio_demux_handler);
+	pxa_gpio_chip = pchip;
 
 	irq_set_chained_handler(irq_mux, pxa_gpio_demux_handler);
 	return 0;
@@ -699,10 +716,11 @@ postcore_initcall(pxa_gpio_init);
 #ifdef CONFIG_PM
 static int pxa_gpio_suspend(void)
 {
-	struct pxa_gpio_chip *c;
+	struct pxa_gpio_chip *pchip = pxa_gpio_chip;
+	struct pxa_gpio_bank *c;
 	int gpio;
 
-	for_each_gpio_chip(gpio, c) {
+	for_each_gpio_bank(gpio, c, pchip) {
 		c->saved_gplr = readl_relaxed(c->regbase + GPLR_OFFSET);
 		c->saved_gpdr = readl_relaxed(c->regbase + GPDR_OFFSET);
 		c->saved_grer = readl_relaxed(c->regbase + GRER_OFFSET);
@@ -716,10 +734,11 @@ static int pxa_gpio_suspend(void)
 
 static void pxa_gpio_resume(void)
 {
-	struct pxa_gpio_chip *c;
+	struct pxa_gpio_chip *pchip = pxa_gpio_chip;
+	struct pxa_gpio_bank *c;
 	int gpio;
 
-	for_each_gpio_chip(gpio, c) {
+	for_each_gpio_bank(gpio, c, pchip) {
 		/* restore level with set/clear */
 		writel_relaxed(c->saved_gplr, c->regbase + GPSR_OFFSET);
 		writel_relaxed(~c->saved_gplr, c->regbase + GPCR_OFFSET);
-- 
2.1.4
