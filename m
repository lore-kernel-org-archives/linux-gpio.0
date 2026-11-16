Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794794899;
	b=UGA0TXS9u4MIN+qkvpsFFE81B1gEheesLr6Q0c1a2qs3TP1qCJOB6io501848KSc4R0+
	 K6eD30Du1uqWe2F9bTgntJqsW1lt8R0wR0t2KY5tKUrt0r5l3xRBFN/OjZdXrASBHBuWR
	 OQkjgbzjkK0pfrMCbSi8Lruu+RK9LZfUAYm8xUWfqosBp3mqjpYcPVdM7mspjb4v1vS2Q
	 4+Jp4kypDiHbTRmB+0hrrLIUoaQG+snSiF/B4iz63Ch3LUBRTL1E7G4n9ejfgU8Eaoq+3
	 +me8c8375z+qW1YGl1gUuOEaeY5Y77IDj7SVrdPahp7QdfwhYLYyQGQ+D2Rc8+L/4Rw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794794899;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=BetBjmhGXt8DW4jM2WjGpW1/eZUJx05j/kEBSDSvL60=;
	b=ItY1AuuOVJiZE6X3CmBTm8+hXAq4sI2eUc73jU0SJAzwJ/B2GccV9TpbRlLYvTjPA+pm
	 0B99KEaluZDSkmwOHVP5JF6XFyOdyOnMVoODoMy2PnzJgEu/1PMtuXeMb4MwrKEwB9db0
	 rbfsZW4r/xEnv4CxYTFkdy4ZPf2eYJ4Z49sCIVUpr9yaOoapyvEc6LSuikVUFp1oMmYMC
	 XCZwQ/Jc3UIjhsxy8DzDBa4NDjlEqX19ZLm50ko3rA34jOhPw0nMh4pHiIwEPW5v8mHq3
	 6NH+plqJYekI0BvVqgwQf73qoMHA7Qrh/+harCTuLuaaalkvEKfGqZWgDnwq2BYPPQg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="Qi/ILujk";
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28E59606A336;
	Mon, 16 Nov 2026 02:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Qi/ILujk
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794794899;
	b=knHtuJocBZvQuoarmDoW/lmoPt/4GMN3cYpQkgWvKMzDnOcOG5p7cb7F6EMoEZF/sKkU
	 2aBun0VZr8SnqDFu0ot/bEs3oHZ97k7IMRBPZpSrKV7Pqa2lB2ZnPuXQ0wWdEMgPXaCfx
	 sRl4PgpWsRthviU72NiM0SoVNgR7UPCJ0pO1Ef4sb6jLssKfKEm8Crk92IhSzmH9FFU2i
	 lRvgJ6/OQ62Fvihruo2HXbcfiNAPEQEIj+/z0gMVhruhKH+sl0BpoM1JRMmR+aJHgYvte
	 u3puGLsdkvZd94bXaWwqMuN2fEZsylcznavjwpxF28/13T1/s8kuOGJzZQTC3fTPBKQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794794899;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=BetBjmhGXt8DW4jM2WjGpW1/eZUJx05j/kEBSDSvL60=;
	b=md2u9ElFafiV8QQXex3fxsc3ABkgogrOOA10GW3yhgqUfMVpt3F1IrNgL+D7SLxbEGhf
	 cHm8umW5EbY7UH3+Cd2lgIOotDNlAeBO2VtoRXLckoMSgl7cv2zocKkcdtBndnfUE3Gm/
	 mHDY1BP+ducMsRYbLNLhpOE6q8LFYOSTXyOhRnUKqJXcglLUveG2oDzeplzNDbwfDnyW5
	 eySiVMmu0X8KQ127b0g8jveG8CHPHE5mtuIjh/v8Hacgb0vYNrOaEoMkldD9Cwucn5IMr
	 S0gf/M23+eNOy86j8Mexq8vh9J2Kl4HPeTVPSpMET2dv8OLTAz1XJYdcEplCYpfZahg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id BED561F000C6;
	Mon, 16 Nov 2026 02:08:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794794899;
	bh=BetBjmhGXt8DW4jM2WjGpW1/eZUJx05j/kEBSDSvL60=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=Qi/ILujk59aV4XBv2Qj5IhVj1X3MXlTF3rqajaVeVcCcuuPA7FogjcceaU/9l8hBE
	 h4Y/qua0t7ZbBbkIK6CrfWDkzKQ/cRW3ki0BP+nCUqJ2XclmkOO82RwRn0HI4FUvyh
	 x6MyguQEG/94aBAj7De4qICCxgGUIKenZyWlDMcrrlk/LDPk4+/qk2eN20EAb7gAbE
	 Z0JFcLF4OBqz1m1q7onR0t24s2igF1NahwBPET8uG+5zcxiiTUfzYJrsASG26bpLdV
	 v6OCZ1IUFPoc4Pbt78Dv70iAcdjJPQbMiNTAAGfhxafhsdNyyT5Nlu3BjWhCcrA8Pm
	 uY6bkHTEkeHXA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 49F564A2D6;
	Mon, 16 Nov 2026 02:08:17 +0000 (UTC)
From: Fil Dunsky via B4 Relay <devnull+filipp.dunsky.gmail.com@kernel.org>
Date: Mon, 16 Nov 2026 05:08:17 +0300
Subject: [PATCH v4 2/2] gpio: Add Cortina Systems CS75xx GPIO driver
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
Message-Id: <20261116-cs75xx-gpio-v4-2-ad80a944e966@gmail.com>
References: <20261116-cs75xx-gpio-v4-0-ad80a944e966@gmail.com>
In-Reply-To: <20261116-cs75xx-gpio-v4-0-ad80a944e966@gmail.com>
To: Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Fil Dunsky <filipp.dunsky@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794794896; l=10329;
 i=filipp.dunsky@gmail.com; s=20260930; h=from:subject:message-id;
 bh=Gz0Y26r1FK2Ovtqw9qndmYE9sokvmJ+t4/QbjtBNUZo=;
 b=+LEP08UtEYPkzs6/cEaPO+PpUAmbkT7btZfZoOwUGqfu5IPwdJfDQ36qSG0ZgBN/oDezbamd8
 kEGypeBQ0jZCSBXX8i7wWZr+OO7XVfhXkD1X23dQKK2zvLUfPUmUdxx
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

Signed-off-by: Fil Dunsky <filipp.dunsky@gmail.com>
---
 drivers/gpio/Kconfig       |  12 ++
 drivers/gpio/Makefile      |   1 +
 drivers/gpio/gpio-cs75xx.c | 281 +++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 294 insertions(+)

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
index 000000000..b4f288910
--- /dev/null
+++ b/drivers/gpio/gpio-cs75xx.c
@@ -0,0 +1,281 @@
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


