From: Rabin Vincent <rabin@rab.in>
Subject: [PATCH 2/2] gpio: etraxfs: add interrupt support
Date: Fri, 31 Jul 2015 14:48:57 +0200
Message-ID: <1438346937-9020-2-git-send-email-rabin@rab.in>
References: <1438346937-9020-1-git-send-email-rabin@rab.in>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1438346937-9020-1-git-send-email-rabin@rab.in>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org, gnurou@gmail.com
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Rabin Vincent <rabin@rab.in>
List-Id: linux-gpio@vger.kernel.org

On ETRAX FS, all pins on the first port (and only the first port) have
interrupt support.

On ARTPEC-3, all pins on all ports have interrupt support.  However,
there are only eight interrupts.  Each of the interrupts is associated
with a group of pins and for each interrupt the one pin from the group
which will trigger it can be selected.

Signed-off-by: Rabin Vincent <rabin@rab.in>
---
 drivers/gpio/Kconfig        |   1 +
 drivers/gpio/gpio-etraxfs.c | 259 ++++++++++++++++++++++++++++++++++++++++++--
 2 files changed, 253 insertions(+), 7 deletions(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 8f1fe73..c0f176a 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -172,6 +172,7 @@ config GPIO_ETRAXFS
 	depends on CRIS || COMPILE_TEST
 	depends on OF
 	select GPIO_GENERIC
+	select GPIOLIB_IRQCHIP
 	help
 	  Say yes here to support the GPIO controller on Axis ETRAX FS SoCs.
 
diff --git a/drivers/gpio/gpio-etraxfs.c b/drivers/gpio/gpio-etraxfs.c
index 7276891..92e065e 100644
--- a/drivers/gpio/gpio-etraxfs.c
+++ b/drivers/gpio/gpio-etraxfs.c
@@ -1,8 +1,10 @@
 #include <linux/kernel.h>
 #include <linux/init.h>
 #include <linux/gpio.h>
+#include <linux/gpio/driver.h>
 #include <linux/of_gpio.h>
 #include <linux/io.h>
+#include <linux/interrupt.h>
 #include <linux/platform_device.h>
 #include <linux/basic_mmio_gpio.h>
 
@@ -13,6 +15,7 @@
 #define ETRAX_FS_rw_intr_mask	16
 #define ETRAX_FS_rw_ack_intr	20
 #define ETRAX_FS_r_intr		24
+#define ETRAX_FS_r_masked_intr	28
 #define ETRAX_FS_rw_pb_dout	32
 #define ETRAX_FS_r_pb_din	36
 #define ETRAX_FS_rw_pb_oe	40
@@ -36,6 +39,37 @@
 #define ARTPEC3_rw_pc_dout	92
 #define ARTPEC3_rw_pc_oe	96
 #define ARTPEC3_r_pd_din	116
+#define ARTPEC3_rw_intr_cfg	120
+#define ARTPEC3_rw_intr_pins	124
+#define ARTPEC3_rw_intr_mask	128
+#define ARTPEC3_rw_ack_intr	132
+#define ARTPEC3_r_masked_intr	140
+
+#define GIO_CFG_OFF		0
+#define GIO_CFG_HI		1
+#define GIO_CFG_LO		2
+#define GIO_CFG_SET		3
+#define GIO_CFG_POSEDGE		5
+#define GIO_CFG_NEGEDGE		6
+#define GIO_CFG_ANYEDGE		7
+
+struct etraxfs_gpio_info;
+
+struct etraxfs_gpio_block {
+	spinlock_t lock;
+	u32 mask;
+	u32 cfg;
+	u32 pins;
+	unsigned int group[8];
+
+	void __iomem *regs;
+	const struct etraxfs_gpio_info *info;
+};
+
+struct etraxfs_gpio_chip {
+	struct bgpio_chip bgc;
+	struct etraxfs_gpio_block *block;
+};
 
 struct etraxfs_gpio_port {
 	const char *label;
@@ -48,6 +82,12 @@ struct etraxfs_gpio_port {
 struct etraxfs_gpio_info {
 	unsigned int num_ports;
 	const struct etraxfs_gpio_port *ports;
+
+	unsigned int rw_ack_intr;
+	unsigned int rw_intr_mask;
+	unsigned int rw_intr_cfg;
+	unsigned int rw_intr_pins;
+	unsigned int r_masked_intr;
 };
 
 static const struct etraxfs_gpio_port etraxfs_gpio_etraxfs_ports[] = {
@@ -91,6 +131,10 @@ static const struct etraxfs_gpio_port etraxfs_gpio_etraxfs_ports[] = {
 static const struct etraxfs_gpio_info etraxfs_gpio_etraxfs = {
 	.num_ports = ARRAY_SIZE(etraxfs_gpio_etraxfs_ports),
 	.ports = etraxfs_gpio_etraxfs_ports,
+	.rw_ack_intr	= ETRAX_FS_rw_ack_intr,
+	.rw_intr_mask	= ETRAX_FS_rw_intr_mask,
+	.rw_intr_cfg	= ETRAX_FS_rw_intr_cfg,
+	.r_masked_intr	= ETRAX_FS_r_masked_intr,
 };
 
 static const struct etraxfs_gpio_port etraxfs_gpio_artpec3_ports[] = {
@@ -125,8 +169,18 @@ static const struct etraxfs_gpio_port etraxfs_gpio_artpec3_ports[] = {
 static const struct etraxfs_gpio_info etraxfs_gpio_artpec3 = {
 	.num_ports = ARRAY_SIZE(etraxfs_gpio_artpec3_ports),
 	.ports = etraxfs_gpio_artpec3_ports,
+	.rw_ack_intr	= ARTPEC3_rw_ack_intr,
+	.rw_intr_mask	= ARTPEC3_rw_intr_mask,
+	.rw_intr_cfg	= ARTPEC3_rw_intr_cfg,
+	.r_masked_intr	= ARTPEC3_r_masked_intr,
+	.rw_intr_pins	= ARTPEC3_rw_intr_pins,
 };
 
+static unsigned int etraxfs_gpio_chip_to_port(struct gpio_chip *gc)
+{
+	return gc->label[0] - 'A';
+}
+
 static int etraxfs_gpio_of_xlate(struct gpio_chip *gc,
 			       const struct of_phandle_args *gpiospec,
 			       u32 *flags)
@@ -135,7 +189,7 @@ static int etraxfs_gpio_of_xlate(struct gpio_chip *gc,
 	 * Port numbers are A to E, and the properties are integers, so we
 	 * specify them as 0xA - 0xE.
 	 */
-	if (gc->label[0] - 'A' + 0xA != gpiospec->args[2])
+	if (etraxfs_gpio_chip_to_port(gc) + 0xA != gpiospec->args[2])
 		return -EINVAL;
 
 	return of_gpio_simple_xlate(gc, gpiospec, flags);
@@ -153,13 +207,159 @@ static const struct of_device_id etraxfs_gpio_of_table[] = {
 	{},
 };
 
+static unsigned int etraxfs_gpio_to_group_irq(unsigned int gpio)
+{
+	return gpio % 8;
+}
+
+static unsigned int etraxfs_gpio_to_group_pin(struct etraxfs_gpio_chip *chip,
+					      unsigned int gpio)
+{
+	return 4 * etraxfs_gpio_chip_to_port(&chip->bgc.gc) + gpio / 8;
+}
+
+static void etraxfs_gpio_irq_ack(struct irq_data *d)
+{
+	struct etraxfs_gpio_chip *chip = irq_data_get_irq_chip_data(d);
+	struct etraxfs_gpio_block *block = chip->block;
+	unsigned int grpirq = etraxfs_gpio_to_group_irq(d->hwirq);
+
+	writel(BIT(grpirq), block->regs + block->info->rw_ack_intr);
+}
+
+static void etraxfs_gpio_irq_mask(struct irq_data *d)
+{
+	struct etraxfs_gpio_chip *chip = irq_data_get_irq_chip_data(d);
+	struct etraxfs_gpio_block *block = chip->block;
+	unsigned int grpirq = etraxfs_gpio_to_group_irq(d->hwirq);
+
+	spin_lock(&block->lock);
+	block->mask &= ~BIT(grpirq);
+	writel(block->mask, block->regs + block->info->rw_intr_mask);
+	spin_unlock(&block->lock);
+}
+
+static void etraxfs_gpio_irq_unmask(struct irq_data *d)
+{
+	struct etraxfs_gpio_chip *chip = irq_data_get_irq_chip_data(d);
+	struct etraxfs_gpio_block *block = chip->block;
+	unsigned int grpirq = etraxfs_gpio_to_group_irq(d->hwirq);
+
+	spin_lock(&block->lock);
+	block->mask |= BIT(grpirq);
+	writel(block->mask, block->regs + block->info->rw_intr_mask);
+	spin_unlock(&block->lock);
+}
+
+static int etraxfs_gpio_irq_set_type(struct irq_data *d, u32 type)
+{
+	struct etraxfs_gpio_chip *chip = irq_data_get_irq_chip_data(d);
+	struct etraxfs_gpio_block *block = chip->block;
+	unsigned int grpirq = etraxfs_gpio_to_group_irq(d->hwirq);
+	u32 cfg;
+
+	switch (type) {
+	case IRQ_TYPE_EDGE_RISING:
+		cfg = GIO_CFG_POSEDGE;
+		break;
+	case IRQ_TYPE_EDGE_FALLING:
+		cfg = GIO_CFG_NEGEDGE;
+		break;
+	case IRQ_TYPE_EDGE_BOTH:
+		cfg = GIO_CFG_ANYEDGE;
+		break;
+	case IRQ_TYPE_LEVEL_LOW:
+		cfg = GIO_CFG_LO;
+		break;
+	case IRQ_TYPE_LEVEL_HIGH:
+		cfg = GIO_CFG_HI;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	spin_lock(&block->lock);
+	block->cfg &= ~(0x7 << (grpirq * 3));
+	block->cfg |= (cfg << (grpirq * 3));
+	writel(block->cfg, block->regs + block->info->rw_intr_cfg);
+	spin_unlock(&block->lock);
+
+	return 0;
+}
+
+static int etraxfs_gpio_irq_request_resources(struct irq_data *d)
+{
+	struct etraxfs_gpio_chip *chip = irq_data_get_irq_chip_data(d);
+	struct etraxfs_gpio_block *block = chip->block;
+	unsigned int grpirq = etraxfs_gpio_to_group_irq(d->hwirq);
+	int ret = -EBUSY;
+
+	spin_lock(&block->lock);
+	if (block->group[grpirq])
+		goto out;
+
+	ret = gpiochip_lock_as_irq(&chip->bgc.gc, d->hwirq);
+	if (ret)
+		goto out;
+
+	block->group[grpirq] = d->irq;
+	if (block->info->rw_intr_pins) {
+		unsigned int pin = etraxfs_gpio_to_group_pin(chip, d->hwirq);
+
+		block->pins &= ~(0xf << (grpirq * 4));
+		block->pins |= (pin << (grpirq * 4));
+
+		writel(block->pins, block->regs + block->info->rw_intr_pins);
+	}
+
+out:
+	spin_unlock(&block->lock);
+	return ret;
+}
+
+static void etraxfs_gpio_irq_release_resources(struct irq_data *d)
+{
+	struct etraxfs_gpio_chip *chip = irq_data_get_irq_chip_data(d);
+	struct etraxfs_gpio_block *block = chip->block;
+	unsigned int grpirq = etraxfs_gpio_to_group_irq(d->hwirq);
+
+	spin_lock(&block->lock);
+	block->group[grpirq] = 0;
+	gpiochip_unlock_as_irq(&chip->bgc.gc, d->hwirq);
+	spin_unlock(&block->lock);
+}
+
+static struct irq_chip etraxfs_gpio_irq_chip = {
+	.name		= "gpio-etraxfs",
+	.irq_ack	= etraxfs_gpio_irq_ack,
+	.irq_mask	= etraxfs_gpio_irq_mask,
+	.irq_unmask	= etraxfs_gpio_irq_unmask,
+	.irq_set_type	= etraxfs_gpio_irq_set_type,
+	.irq_request_resources = etraxfs_gpio_irq_request_resources,
+	.irq_release_resources = etraxfs_gpio_irq_release_resources,
+};
+
+static irqreturn_t etraxfs_gpio_interrupt(int irq, void *dev_id)
+{
+	struct etraxfs_gpio_block *block = dev_id;
+	unsigned long intr = readl(block->regs + block->info->r_masked_intr);
+	int bit;
+
+	for_each_set_bit(bit, &intr, 8)
+		generic_handle_irq(block->group[bit]);
+
+	return IRQ_RETVAL(intr & 0xff);
+}
+
 static int etraxfs_gpio_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	const struct etraxfs_gpio_info *info;
 	const struct of_device_id *match;
-	struct bgpio_chip *chips;
-	struct resource *res;
+	struct etraxfs_gpio_block *block;
+	struct etraxfs_gpio_chip *chips;
+	struct resource *res, *irq;
+	bool allportsirq = false;
 	void __iomem *regs;
 	int ret;
 	int i;
@@ -179,14 +379,44 @@ static int etraxfs_gpio_probe(struct platform_device *pdev)
 	if (!chips)
 		return -ENOMEM;
 
+	irq = platform_get_resource(pdev, IORESOURCE_IRQ, 0);
+	if (!irq)
+		return -EINVAL;
+
+	block = devm_kzalloc(dev, sizeof(*block), GFP_KERNEL);
+	if (!block)
+		return -ENOMEM;
+
+	spin_lock_init(&block->lock);
+
+	block->regs = regs;
+	block->info = info;
+
+	writel(0, block->regs + info->rw_intr_mask);
+	writel(0, block->regs + info->rw_intr_cfg);
+	if (info->rw_intr_pins) {
+		allportsirq = true;
+		writel(0, block->regs + info->rw_intr_pins);
+	}
+
+	ret = devm_request_irq(dev, irq->start, etraxfs_gpio_interrupt,
+			       IRQF_SHARED, dev_name(dev), block);
+	if (ret) {
+		dev_err(dev, "Unable to request irq %d\n", ret);
+		return ret;
+	}
+
 	for (i = 0; i < info->num_ports; i++) {
-		struct bgpio_chip *bgc = &chips[i];
+		struct etraxfs_gpio_chip *chip = &chips[i];
+		struct bgpio_chip *bgc = &chip->bgc;
 		const struct etraxfs_gpio_port *port = &info->ports[i];
 		unsigned long flags = BGPIOF_READ_OUTPUT_REG_SET;
 		void __iomem *dat = regs + port->din;
 		void __iomem *set = regs + port->dout;
 		void __iomem *dirout = regs + port->oe;
 
+		chip->block = block;
+
 		if (dirout == set) {
 			dirout = set = NULL;
 			flags = BGPIOF_NO_OUTPUT;
@@ -195,8 +425,11 @@ static int etraxfs_gpio_probe(struct platform_device *pdev)
 		ret = bgpio_init(bgc, dev, 4,
 				 dat, set, NULL, dirout, NULL,
 				 flags);
-		if (ret)
-			return ret;
+		if (ret) {
+			dev_err(dev, "Unable to init port %s\n",
+				port->label);
+			continue;
+		}
 
 		bgc->gc.ngpio = port->ngpio;
 		bgc->gc.label = port->label;
@@ -206,9 +439,21 @@ static int etraxfs_gpio_probe(struct platform_device *pdev)
 		bgc->gc.of_xlate = etraxfs_gpio_of_xlate;
 
 		ret = gpiochip_add(&bgc->gc);
-		if (ret)
+		if (ret) {
 			dev_err(dev, "Unable to register port %s\n",
 				bgc->gc.label);
+			continue;
+		}
+
+		if (i > 0 && !allportsirq)
+			continue;
+
+		ret = gpiochip_irqchip_add(&bgc->gc, &etraxfs_gpio_irq_chip, 0,
+					   handle_level_irq, IRQ_TYPE_NONE);
+		if (ret) {
+			dev_err(dev, "Unable to add irqchip to port %s\n",
+				bgc->gc.label);
+		}
 	}
 
 	return 0;
-- 
2.1.4
