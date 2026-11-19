Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795086190;
	b=JpotVh/q8uUeTu5YfcO8GsK/o1J8byK2YsngsU2d5zlyfWFN2hWlTcwgXK7gpEGN2tuY
	 uY+mdtWgcMXusIkU3LPfZvRL2zE7bbwe71he5QDiSFEn0ZPxsRz8MV/Osfw1EBovqlWav
	 C284znWbv9Ec9VO7xFlJSFIBBas6EiyskrgJgILGd/imbUHPrIu88ES25pASzSuh/nHTj
	 JtiLjO4aqobufwiab0HMDNMo3glEu6LlOMETxY+oNJGHazmTy2l+/qW5Alu1icDNTl+N0
	 Ri9h8HatvmNlv1g6uEIlxvrxriUN6SwxmBXQtqaelDiUeZ96WiCzZn0KnXTH2HDj0Bg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795086190;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=V374vhCLF+Wk+6zO/0bsQmIu1zRg2QDczdW9dhiJxto=;
	b=JmiOfO9gO4F/GyD/3mQrC9onMVno1uOtG0Na0sAYDscZ+Lpi57gA+Ju6jf5LBL1UL1Oa
	 IO4kxaUqoXR3GP1Ho2jd6g+e1OZPhnWuoYwB3SiOq+DpNmmfQqCnxkCNZH8rvPsKA0Tuq
	 EHQl7Zr5tZuViYVPK8JXqCZi2CnhmgbUZ1WM8n7bgUcgR9URcoPfS/M7BF/PlADmMmUL0
	 0yoqQURhcwhVUFsIShH/Ece+HgCWGe7HDPmdisIa38lZ14uETP8YLs0bNxigxNi1+Ayaa
	 YMzsUHmrJR3Q8ip10gAZBVeFiivjbfcGCyzxQ16IW17D1khCOi2udBTzmaE5H3qY3TA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cuoFtAGc;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3795606A336;
	Thu, 19 Nov 2026 11:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cuoFtAGc
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795086190;
	b=as9+ZqlHKEt0L6hHQ3U2TU8rXvOnCSi4oESKoT7YP7hfmWzaacCnR5B3uc2QODFGWc9G
	 DA/cr3wTSuqm8bg0tn6LGinNkVNjmOQi1lS8Ti1r5Ba6RVOyrbWazKFE6FntU/otJWFcb
	 r1k3O7owr96tLCGHO2q0pfB2jWPKwS+aqSlUp67XzBEZFvd9IdlX5nHxushaJ4kCGXM59
	 tgYHZL2U/d9OqhwvmNiB+D95VbYWdgBSiGC5RKTtNzfVa5+d1xPt6JRryy2tDMCP6hB4y
	 ttwacmCMngOewJmaHrCkv46BzRi6FrXBG30NjRZ8a+mWupxp34SKBSj0PSU91MHdXDg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795086190;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=V374vhCLF+Wk+6zO/0bsQmIu1zRg2QDczdW9dhiJxto=;
	b=j93xnJ+u1uh1TKAqWNq6DxbMRwdqjKFB1MgFLQOPs9tgh7s0S7RHu3qfzHFGyzf8s/PY
	 FC4cLYcWg898eZ88gRy0uASTPKLWQFj7clwn/elJJ1SQrzvwykOCFiPDus5iMgF9zGxiL
	 K13D70I2fRXPYMGJ9tD7kFLFsVjuTj6xnJc+FbkfPeyR/gJPh7GGZRuyG3Ap7GtZIUMJh
	 Vr3YdaXijsto77U7Id4ejtI2tbxBycFXWqBQS9CXqZFYV6owqZzibk8n/vLIZWsw+pK5k
	 RhdEXPjku31JBn2453Q8Si3Ih/LY7WnYwoOGI09H+BOOiP8KvxAY5zFmjQa0gFHOhNQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D09121F000C9;
	Thu, 19 Nov 2026 11:03:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795086190;
	bh=V374vhCLF+Wk+6zO/0bsQmIu1zRg2QDczdW9dhiJxto=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=cuoFtAGclN1q9KPnMDSjT0tFf80hQs8mj1yU6z6Kg5azJs3fijU3eIGmfvhPCCP8D
	 fXHPONUlyvCKap0rGK4BJJ9IfpW/0OYBsTXucgEUYmD+FRhve6+lo5oj7QPyYxS2lH
	 qbqVjCH8I6q4SKyvgdFDj/7OsIax29HmlO6iSQ1ksCbhNVa9MMqWiP1vwnxLvhrsXS
	 uyoAKzKWy3rs0HssXNzaNJerinOiz9vm4HOwDeAWhNuOdWKuqLfjCC3qZKjbYR656e
	 n1JTNWQW7doa3j9dE1nK+RFlkcinNoZGAan/cFafkguJhPu8FVY/PrwnHCTUyX+IGG
	 Dq46Lrk6lFpBg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 5C8A14B26C;
	Thu, 19 Nov 2026 11:03:08 +0000 (UTC)
From: Fil Dunsky via B4 Relay <devnull+filipp.dunsky.gmail.com@kernel.org>
Date: Thu, 19 Nov 2026 14:02:50 +0300
Subject: [PATCH v5 2/2] gpio: Add Cortina Systems CS75xx GPIO driver
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261119-cs75xx-gpio-v5-2-8d14f2bb614b@gmail.com>
References: <20261119-cs75xx-gpio-v5-0-8d14f2bb614b@gmail.com>
In-Reply-To: <20261119-cs75xx-gpio-v5-0-8d14f2bb614b@gmail.com>
To: Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Fil Dunsky <filipp.dunsky@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795086186; l=10491;
 i=filipp.dunsky@gmail.com; s=20260930; h=from:subject:message-id;
 bh=2tnGziWrBseSW4RURGkE53ZtaZ0kbwmEIU62H72AIQo=;
 b=e4TQWVyzBi5ZNeK1NnH9bCrBZ402CoA4EK87G28+X64wHMBff9V9TfAFiUSEnXprXRPA4eUf+
 uJlqCdIVJfTCv1XlF/Ah8fPUYRZaGc+9zgWdPPIk0gTvAfOQ6Fpr4jT
X-Developer-Key: i=filipp.dunsky@gmail.com; a=ed25519;
 pk=JAYP8e2rJ54DHOmhNtXud8rl1igAaAXoOHxtJmVXI1g=
X-Endpoint-Received: by B4 Relay for filipp.dunsky@gmail.com/20260930 with
 auth_id=1085
X-Original-From: Fil Dunsky <filipp.dunsky@gmail.com>
Reply-To: filipp.dunsky@gmail.com
Content-Transfer-Encoding: 7bit

From: Fil Dunsky <filipp.dunsky@gmail.com>

Add a driver for the GPIO banks of the Cortina Systems CS75xx SoCs. The
data and direction registers are handled by gpio-mmio; each bank has its
own interrupt with level and edge triggers, both edges are emulated by
flipping the polarity.

A pin only works as a GPIO when the pin mux in the global control block
selects the GPIO function. That is not part of the GPIO controller and
is left to the boot loader until there is a pin controller driver.

Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Fil Dunsky <filipp.dunsky@gmail.com>
---
 drivers/gpio/Kconfig       |  12 ++
 drivers/gpio/Makefile      |   1 +
 drivers/gpio/gpio-cs75xx.c | 283 +++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 296 insertions(+)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 55e428002..cc00cfe48 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -300,6 +300,18 @@ config GPIO_CLPS711X
 	help
 	  Say yes here to support GPIO on CLPS711X SoCs.
 
+config GPIO_CS75XX
+	tristate "Cortina Systems CS75xx GPIO support"
+	depends on ARCH_CORTINA_ACCESS || COMPILE_TEST
+	select GPIO_GENERIC
+	select GPIOLIB_IRQCHIP
+	help
+	  Say yes here to support the GPIO banks of the Cortina Systems
+	  CS75xx SoCs, including their interrupts.
+
+	  This driver can also be built as a module. If so, the module
+	  will be called gpio-cs75xx.
+
 config GPIO_DAVINCI
 	tristate "TI Davinci/Keystone GPIO support"
 	default y if ARCH_DAVINCI
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index 88f748846..2c2e18ef2 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -60,6 +60,7 @@ obj-$(CONFIG_GPIO_SNPS_CREG)		+= gpio-creg-snps.o
 obj-$(CONFIG_GPIO_CROS_EC)		+= gpio-cros-ec.o
 obj-$(CONFIG_GPIO_CRYSTAL_COVE)		+= gpio-crystalcove.o
 obj-$(CONFIG_GPIO_CS5535)		+= gpio-cs5535.o
+obj-$(CONFIG_GPIO_CS75XX)		+= gpio-cs75xx.o
 obj-$(CONFIG_GPIO_DA9052)		+= gpio-da9052.o
 obj-$(CONFIG_GPIO_DA9055)		+= gpio-da9055.o
 obj-$(CONFIG_GPIO_DAVINCI)		+= gpio-davinci.o
diff --git a/drivers/gpio/gpio-cs75xx.c b/drivers/gpio/gpio-cs75xx.c
new file mode 100644
index 000000000..733284444
--- /dev/null
+++ b/drivers/gpio/gpio-cs75xx.c
@@ -0,0 +1,283 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Cortina Systems CS75xx GPIO controller
+ *
+ * Each bank has 32 lines with direction, data and interrupt registers.
+ * Whether a pin is driven by the GPIO bank or by its peripheral function
+ * (NAND, Ethernet, UART, ...) is selected in the global control block,
+ * which this driver does not touch: the pin mux is left as the boot loader
+ * set it up.
+ */
+
+#include <linux/bitops.h>
+#include <linux/cleanup.h>
+#include <linux/gpio/driver.h>
+#include <linux/gpio/generic.h>
+#include <linux/interrupt.h>
+#include <linux/io.h>
+#include <linux/irq.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
+
+#define CS75XX_GPIO_CFG		0x00	/* 1: input, 0: output */
+#define CS75XX_GPIO_OUT		0x04
+#define CS75XX_GPIO_IN		0x08
+#define CS75XX_GPIO_LVL		0x0c	/* 1: high level or rising edge */
+#define CS75XX_GPIO_EDGE	0x10	/* 1: edge, 0: level */
+#define CS75XX_GPIO_IE		0x14
+#define CS75XX_GPIO_INT		0x18	/* write 1 to clear */
+
+struct cs75xx_gpio {
+	struct gpio_generic_chip chip;
+	void __iomem *base;
+	u32 both_edges;
+};
+
+/* Both edges are emulated by flipping the polarity on every interrupt */
+static void cs75xx_gpio_set_polarity(struct cs75xx_gpio *g, u32 mask)
+{
+	u32 lvl = readl(g->base + CS75XX_GPIO_LVL);
+
+	if (readl(g->base + CS75XX_GPIO_IN) & mask)
+		lvl &= ~mask;
+	else
+		lvl |= mask;
+
+	writel(lvl, g->base + CS75XX_GPIO_LVL);
+}
+
+static void cs75xx_gpio_irq_ack(struct irq_data *d)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct cs75xx_gpio *g = gpiochip_get_data(gc);
+	u32 mask = BIT(irqd_to_hwirq(d));
+
+	guard(gpio_generic_lock_irqsave)(&g->chip);
+	writel(mask, g->base + CS75XX_GPIO_INT);
+	/* Arm the opposite edge after the ack, so that it is not lost */
+	if (g->both_edges & mask)
+		cs75xx_gpio_set_polarity(g, mask);
+}
+
+static void cs75xx_gpio_irq_mask(struct irq_data *d)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct cs75xx_gpio *g = gpiochip_get_data(gc);
+	irq_hw_number_t hwirq = irqd_to_hwirq(d);
+
+	scoped_guard(gpio_generic_lock_irqsave, &g->chip) {
+		u32 ie = readl(g->base + CS75XX_GPIO_IE);
+
+		writel(ie & ~BIT(hwirq), g->base + CS75XX_GPIO_IE);
+	}
+
+	gpiochip_disable_irq(gc, hwirq);
+}
+
+static void cs75xx_gpio_irq_unmask(struct irq_data *d)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct cs75xx_gpio *g = gpiochip_get_data(gc);
+	irq_hw_number_t hwirq = irqd_to_hwirq(d);
+	u32 ie;
+
+	gpiochip_enable_irq(gc, hwirq);
+
+	guard(gpio_generic_lock_irqsave)(&g->chip);
+	/*
+	 * The status of a level interrupt is latched while the line is
+	 * asserted, also after the ack, so it may be stale by now. Clear it,
+	 * it is set again right away if the line is still asserted.
+	 */
+	if (irqd_is_level_type(d))
+		writel(BIT(hwirq), g->base + CS75XX_GPIO_INT);
+	ie = readl(g->base + CS75XX_GPIO_IE);
+	writel(ie | BIT(hwirq), g->base + CS75XX_GPIO_IE);
+}
+
+static int cs75xx_gpio_irq_set_type(struct irq_data *d, unsigned int type)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct cs75xx_gpio *g = gpiochip_get_data(gc);
+	u32 mask = BIT(irqd_to_hwirq(d));
+	u32 lvl, edge, both_edges;
+
+	guard(gpio_generic_lock_irqsave)(&g->chip);
+
+	lvl = readl(g->base + CS75XX_GPIO_LVL);
+	edge = readl(g->base + CS75XX_GPIO_EDGE);
+	both_edges = g->both_edges & ~mask;
+
+	switch (type & IRQ_TYPE_SENSE_MASK) {
+	case IRQ_TYPE_LEVEL_LOW:
+		lvl &= ~mask;
+		edge &= ~mask;
+		break;
+	case IRQ_TYPE_LEVEL_HIGH:
+		lvl |= mask;
+		edge &= ~mask;
+		break;
+	case IRQ_TYPE_EDGE_FALLING:
+		lvl &= ~mask;
+		edge |= mask;
+		break;
+	case IRQ_TYPE_EDGE_RISING:
+		lvl |= mask;
+		edge |= mask;
+		break;
+	case IRQ_TYPE_EDGE_BOTH:
+		both_edges |= mask;
+		edge |= mask;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	g->both_edges = both_edges;
+	writel(lvl, g->base + CS75XX_GPIO_LVL);
+	writel(edge, g->base + CS75XX_GPIO_EDGE);
+	if (g->both_edges & mask)
+		cs75xx_gpio_set_polarity(g, mask);
+	/* The new trigger may have latched the status already, drop it */
+	writel(mask, g->base + CS75XX_GPIO_INT);
+
+	if (type & IRQ_TYPE_LEVEL_MASK)
+		irq_set_handler_locked(d, handle_level_irq);
+	else
+		irq_set_handler_locked(d, handle_edge_irq);
+
+	return 0;
+}
+
+static int cs75xx_gpio_irq_reqres(struct irq_data *d)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	irq_hw_number_t hwirq = irqd_to_hwirq(d);
+	int ret;
+
+	/*
+	 * The boot loader may leave the line configured as an output. Only
+	 * touch it when nobody else has requested it.
+	 */
+	char *label __free(kfree) = gpiochip_dup_line_label(gc, hwirq);
+	if (IS_ERR(label))
+		return PTR_ERR(label);
+	if (!label) {
+		ret = gc->direction_input(gc, hwirq);
+		if (ret)
+			return ret;
+	}
+
+	return gpiochip_reqres_irq(gc, hwirq);
+}
+
+static void cs75xx_gpio_irq_relres(struct irq_data *d)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+
+	gpiochip_relres_irq(gc, irqd_to_hwirq(d));
+}
+
+static const struct irq_chip cs75xx_gpio_irq_chip = {
+	.name			= "cs75xx-gpio",
+	.irq_ack		= cs75xx_gpio_irq_ack,
+	.irq_mask		= cs75xx_gpio_irq_mask,
+	.irq_unmask		= cs75xx_gpio_irq_unmask,
+	.irq_set_type		= cs75xx_gpio_irq_set_type,
+	.irq_request_resources	= cs75xx_gpio_irq_reqres,
+	.irq_release_resources	= cs75xx_gpio_irq_relres,
+	.flags			= IRQCHIP_IMMUTABLE | IRQCHIP_MASK_ON_SUSPEND,
+};
+
+static void cs75xx_gpio_irq_handler(struct irq_desc *desc)
+{
+	struct gpio_chip *gc = irq_desc_get_handler_data(desc);
+	struct cs75xx_gpio *g = gpiochip_get_data(gc);
+	struct irq_chip *chip = irq_desc_get_chip(desc);
+	unsigned long pending;
+	unsigned int offset;
+
+	chained_irq_enter(chip, desc);
+
+	pending = readl(g->base + CS75XX_GPIO_INT) &
+		  readl(g->base + CS75XX_GPIO_IE);
+
+	for_each_set_bit(offset, &pending, gc->ngpio)
+		generic_handle_domain_irq(gc->irq.domain, offset);
+
+	chained_irq_exit(chip, desc);
+}
+
+static int cs75xx_gpio_probe(struct platform_device *pdev)
+{
+	struct gpio_generic_chip_config config;
+	struct device *dev = &pdev->dev;
+	struct gpio_irq_chip *girq;
+	struct cs75xx_gpio *g;
+	int irq, ret;
+
+	g = devm_kzalloc(dev, sizeof(*g), GFP_KERNEL);
+	if (!g)
+		return -ENOMEM;
+
+	g->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(g->base))
+		return PTR_ERR(g->base);
+
+	irq = platform_get_irq(pdev, 0);
+	if (irq < 0)
+		return irq;
+
+	config = (struct gpio_generic_chip_config) {
+		.dev = dev,
+		.sz = 4,
+		.dat = g->base + CS75XX_GPIO_IN,
+		.set = g->base + CS75XX_GPIO_OUT,
+		.dirin = g->base + CS75XX_GPIO_CFG,
+	};
+
+	ret = gpio_generic_chip_init(&g->chip, &config);
+	if (ret)
+		return dev_err_probe(dev, ret, "unable to init generic GPIO\n");
+
+	if (g->chip.gc.ngpio > 32)
+		return dev_err_probe(dev, -EINVAL, "too many lines: %u\n",
+				     g->chip.gc.ngpio);
+
+	/* Mask and clear all interrupts before the parent is set up */
+	writel(0, g->base + CS75XX_GPIO_IE);
+	writel(~0, g->base + CS75XX_GPIO_INT);
+
+	girq = &g->chip.gc.irq;
+	gpio_irq_chip_set_chip(girq, &cs75xx_gpio_irq_chip);
+	girq->parent_handler = cs75xx_gpio_irq_handler;
+	girq->num_parents = 1;
+	girq->parents = devm_kcalloc(dev, 1, sizeof(*girq->parents),
+				     GFP_KERNEL);
+	if (!girq->parents)
+		return -ENOMEM;
+	girq->parents[0] = irq;
+	girq->default_type = IRQ_TYPE_NONE;
+	girq->handler = handle_bad_irq;
+
+	return devm_gpiochip_add_data(dev, &g->chip.gc, g);
+}
+
+static const struct of_device_id cs75xx_gpio_of_match[] = {
+	{ .compatible = "cortina,cs7542-gpio" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, cs75xx_gpio_of_match);
+
+static struct platform_driver cs75xx_gpio_driver = {
+	.probe = cs75xx_gpio_probe,
+	.driver = {
+		.name = "cs75xx-gpio",
+		.of_match_table = cs75xx_gpio_of_match,
+	},
+};
+module_platform_driver(cs75xx_gpio_driver);
+
+MODULE_DESCRIPTION("Cortina Systems CS75xx GPIO driver");
+MODULE_LICENSE("GPL");

-- 
2.53.0


