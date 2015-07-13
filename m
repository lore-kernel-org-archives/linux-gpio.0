From: Thomas Gleixner <tglx@linutronix.de>
Subject: [patch 13/19] gpio: Use irq_desc_get_xxx() to avoid redundant lookup
 of irq_desc
Date: Mon, 13 Jul 2015 20:41:35 -0000
Message-ID: <20150712232405.813240119@linutronix.de>
References: <20150712232317.244138485@linutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from www.linutronix.de ([62.245.132.108]:55803 "EHLO
	Galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753550AbbGMUlo (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 13 Jul 2015 16:41:44 -0400
Content-Disposition: inline;
 filename=gpio-Use-irq_desc_get_xxx-to-avoid-redundant-lookup-.patch
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: LKML <linux-kernel@vger.kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org, Jiang Liu <jiang.liu@linux.intel.com>

From: Jiang Liu <jiang.liu@linux.intel.com>

Use irq_desc_get_xxx() to avoid redundant lookup of irq_desc while we
already have a pointer to corresponding irq_desc.

Preparatory patch for the removal of the 'irq' argument from irq flow
handlers.

Signed-off-by: Jiang Liu <jiang.liu@linux.intel.com>
Acked-by: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>
Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
 drivers/gpio/gpio-bcm-kona.c   |    2 +-
 drivers/gpio/gpio-dwapb.c      |    2 +-
 drivers/gpio/gpio-mvebu.c      |    2 +-
 drivers/gpio/gpio-mxc.c        |    6 +++---
 drivers/gpio/gpio-mxs.c        |    2 +-
 drivers/gpio/gpio-omap.c       |    2 +-
 drivers/gpio/gpio-tegra.c      |    4 +---
 drivers/gpio/gpio-timberdale.c |    5 +++--
 drivers/gpio/gpio-vf610.c      |    2 +-
 drivers/gpio/gpio-zynq.c       |    2 +-
 10 files changed, 14 insertions(+), 15 deletions(-)

Index: tip/drivers/gpio/gpio-bcm-kona.c
===================================================================
--- tip.orig/drivers/gpio/gpio-bcm-kona.c
+++ tip/drivers/gpio/gpio-bcm-kona.c
@@ -438,7 +438,7 @@ static void bcm_kona_gpio_irq_handler(un
 	void __iomem *reg_base;
 	int bit, bank_id;
 	unsigned long sta;
-	struct bcm_kona_gpio_bank *bank = irq_get_handler_data(irq);
+	struct bcm_kona_gpio_bank *bank = irq_desc_get_handler_data(desc);
 	struct irq_chip *chip = irq_desc_get_chip(desc);
 
 	chained_irq_enter(chip, desc);
Index: tip/drivers/gpio/gpio-dwapb.c
===================================================================
--- tip.orig/drivers/gpio/gpio-dwapb.c
+++ tip/drivers/gpio/gpio-dwapb.c
@@ -149,7 +149,7 @@ static u32 dwapb_do_irq(struct dwapb_gpi
 
 static void dwapb_irq_handler(u32 irq, struct irq_desc *desc)
 {
-	struct dwapb_gpio *gpio = irq_get_handler_data(irq);
+	struct dwapb_gpio *gpio = irq_desc_get_handler_data(desc);
 	struct irq_chip *chip = irq_desc_get_chip(desc);
 
 	dwapb_do_irq(gpio);
Index: tip/drivers/gpio/gpio-mvebu.c
===================================================================
--- tip.orig/drivers/gpio/gpio-mvebu.c
+++ tip/drivers/gpio/gpio-mvebu.c
@@ -460,7 +460,7 @@ static int mvebu_gpio_irq_set_type(struc
 
 static void mvebu_gpio_irq_handler(unsigned int irq, struct irq_desc *desc)
 {
-	struct mvebu_gpio_chip *mvchip = irq_get_handler_data(irq);
+	struct mvebu_gpio_chip *mvchip = irq_desc_get_handler_data(desc);
 	struct irq_chip *chip = irq_desc_get_chip(desc);
 	u32 cause, type;
 	int i;
Index: tip/drivers/gpio/gpio-mxc.c
===================================================================
--- tip.orig/drivers/gpio/gpio-mxc.c
+++ tip/drivers/gpio/gpio-mxc.c
@@ -275,8 +275,8 @@ static void mxc_gpio_irq_handler(struct
 static void mx3_gpio_irq_handler(u32 irq, struct irq_desc *desc)
 {
 	u32 irq_stat;
-	struct mxc_gpio_port *port = irq_get_handler_data(irq);
-	struct irq_chip *chip = irq_get_chip(irq);
+	struct mxc_gpio_port *port = irq_desc_get_handler_data(desc);
+	struct irq_chip *chip = irq_desc_get_chip(desc);
 
 	chained_irq_enter(chip, desc);
 
@@ -292,7 +292,7 @@ static void mx2_gpio_irq_handler(u32 irq
 {
 	u32 irq_msk, irq_stat;
 	struct mxc_gpio_port *port;
-	struct irq_chip *chip = irq_get_chip(irq);
+	struct irq_chip *chip = irq_desc_get_chip(desc);
 
 	chained_irq_enter(chip, desc);
 
Index: tip/drivers/gpio/gpio-mxs.c
===================================================================
--- tip.orig/drivers/gpio/gpio-mxs.c
+++ tip/drivers/gpio/gpio-mxs.c
@@ -157,7 +157,7 @@ static void mxs_flip_edge(struct mxs_gpi
 static void mxs_gpio_irq_handler(u32 irq, struct irq_desc *desc)
 {
 	u32 irq_stat;
-	struct mxs_gpio_port *port = irq_get_handler_data(irq);
+	struct mxs_gpio_port *port = irq_desc_get_handler_data(desc);
 
 	desc->irq_data.chip->irq_ack(&desc->irq_data);
 
Index: tip/drivers/gpio/gpio-omap.c
===================================================================
--- tip.orig/drivers/gpio/gpio-omap.c
+++ tip/drivers/gpio/gpio-omap.c
@@ -714,7 +714,7 @@ static void omap_gpio_irq_handler(unsign
 	struct gpio_bank *bank;
 	int unmasked = 0;
 	struct irq_chip *irqchip = irq_desc_get_chip(desc);
-	struct gpio_chip *chip = irq_get_handler_data(irq);
+	struct gpio_chip *chip = irq_desc_get_handler_data(desc);
 
 	chained_irq_enter(irqchip, desc);
 
Index: tip/drivers/gpio/gpio-tegra.c
===================================================================
--- tip.orig/drivers/gpio/gpio-tegra.c
+++ tip/drivers/gpio/gpio-tegra.c
@@ -268,16 +268,14 @@ static void tegra_gpio_irq_shutdown(stru
 
 static void tegra_gpio_irq_handler(unsigned int irq, struct irq_desc *desc)
 {
-	struct tegra_gpio_bank *bank;
 	int port;
 	int pin;
 	int unmasked = 0;
 	struct irq_chip *chip = irq_desc_get_chip(desc);
+	struct tegra_gpio_bank *bank = irq_desc_get_handler_data(desc);
 
 	chained_irq_enter(chip, desc);
 
-	bank = irq_get_handler_data(irq);
-
 	for (port = 0; port < 4; port++) {
 		int gpio = tegra_gpio_compose(bank->bank, port, 0);
 		unsigned long sta = tegra_gpio_readl(GPIO_INT_STA(gpio)) &
Index: tip/drivers/gpio/gpio-timberdale.c
===================================================================
--- tip.orig/drivers/gpio/gpio-timberdale.c
+++ tip/drivers/gpio/gpio-timberdale.c
@@ -194,11 +194,12 @@ out:
 
 static void timbgpio_irq(unsigned int irq, struct irq_desc *desc)
 {
-	struct timbgpio *tgpio = irq_get_handler_data(irq);
+	struct timbgpio *tgpio = irq_desc_get_handler_data(desc);
+	struct irq_data *data = irq_desc_get_irq_data(desc);
 	unsigned long ipr;
 	int offset;
 
-	desc->irq_data.chip->irq_ack(irq_get_irq_data(irq));
+	data->chip->irq_ack(data);
 	ipr = ioread32(tgpio->membase + TGPIO_IPR);
 	iowrite32(ipr, tgpio->membase + TGPIO_ICR);
 
Index: tip/drivers/gpio/gpio-vf610.c
===================================================================
--- tip.orig/drivers/gpio/gpio-vf610.c
+++ tip/drivers/gpio/gpio-vf610.c
@@ -120,7 +120,7 @@ static int vf610_gpio_direction_output(s
 
 static void vf610_gpio_irq_handler(u32 irq, struct irq_desc *desc)
 {
-	struct vf610_gpio_port *port = irq_get_handler_data(irq);
+	struct vf610_gpio_port *port = irq_desc_get_handler_data(desc);
 	struct irq_chip *chip = irq_desc_get_chip(desc);
 	int pin;
 	unsigned long irq_isfr;
Index: tip/drivers/gpio/gpio-zynq.c
===================================================================
--- tip.orig/drivers/gpio/gpio-zynq.c
+++ tip/drivers/gpio/gpio-zynq.c
@@ -518,7 +518,7 @@ static void zynq_gpio_irqhandler(unsigne
 {
 	u32 int_sts, int_enb;
 	unsigned int bank_num;
-	struct zynq_gpio *gpio = irq_get_handler_data(irq);
+	struct zynq_gpio *gpio = irq_desc_get_handler_data(desc);
 	struct irq_chip *irqchip = irq_desc_get_chip(desc);
 
 	chained_irq_enter(irqchip, desc);


