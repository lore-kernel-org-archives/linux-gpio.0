Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793776905;
	b=IG3zvZb7qaQvCP+Ja8/F7kJfdXSCN0784bENqd+487UcqK6oFMcrd2oZpkxr219/EO6Y
	 3PxNFZV9BybnFSCQ/aS3Pg/bilKkWGJRMG633JBVneZzAmdS07Zmqh9L+y60jD2nyXsDB
	 jnWHtxbzb9/X0Jz5vUZO6+hKjz8DRAxxyn5u/4t6Dt/CNjV/4cNTxqvbFetV6vH25pnUs
	 aoIPGz+CpRI60WUAAHdO/P5jeR8ElenvV8YXm93jILw7HpHH6Rwaea4g6LC9RMTk9qVDF
	 0PD/8eJnJa1yBu7ad4KvSYmSb8dT09aIWIXCDOQdJYBywK/YImy8hOsx06+vVuFnS7Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793776905;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=EtF98CtY6LXvBTT5bElU39ANVirbJybcfi4pIpgwGA0=;
	b=M6tqCUEE4WimVMF9a7OLW0D3MQIcNTI3OAHSwWSQVeIIZZuW+k3q/v7ffrr0ElU0nELh
	 EtwDnLbVhYdVc86bX5biNZZg6rbbU23kkxBc7hjKHLnWdXqDgyrxrzilq4ZMoI6MOtRFT
	 ONhq7dOSUYb/0wIrX/jtxIsWg4PbtazMkP7bYXMHWkjpezTZZMVLivDDUoY7rWR81y7mc
	 d29I00J0m4BST+Frmm1UqBlHtyX1frzpCeN4WxjQD5pTmMhPtP0BEZEb9AgPqwZ7142x1
	 NO7Xi0e55QkoLwKvNPrdSw6f8tttw3zXgGqSh4IU64hGMjMhk+/CWLHjVPJzSTne33Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TzrK9zHf;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE490606D80B;
	Wed,  4 Nov 2026 07:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TzrK9zHf
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793776904;
	b=PKyZ12Xlt9EXXrDcaAQMFTWxobhn2sAqXHylB9nv177PApxof9HOy30LLfqOpL80DPRO
	 uAVfFKjxvT3FwbzLX+cgFXYk0bRBvFyoW4z737HFx5TC7H0Gi0gRUlbzxMUO2au5+eRrR
	 hz/+bklamzF3KeVU9Vo2qMfwp6x97icRJWthrQk451zOXZaUsT7QtZgWRpsJbyh5qOxZy
	 BnCTsfn9424yNowOFGTWGz2O6GD5q3sfe8yJ/r5OSvwtv2xlL1BwP4gY+aw2nKzM3v9S7
	 1pc0LNMD1dqin7ktx2Z/7Qb72dJ9f1wvJk69adYs3/hP+0I4eddR43SnzVCwz9e1hbQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793776904;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=EtF98CtY6LXvBTT5bElU39ANVirbJybcfi4pIpgwGA0=;
	b=KrVeXu9OjQ+K3yidoTcrN+kzkTwV2GnL64dI+EkvzEZbGiS2py4WuM3wit5Ze0eb1+00
	 sykTT/TTCH6Kq2UphSP0wNizrv5v5QJHdwLbrQ4uIPGK0pGS+TAETTIHnRPWprT1zoD7Y
	 6kUAqYnNi0gwbT6/KdAFhIWKX1x8KpigxjXD3yoAw1zN8gaTa7pv/9ULVTioHRJrm9cZy
	 V9RaD3sbQz2d/Ju2dL45jxOgSR9pfN9O9MbtqwRSze6gjJa531DdpFqbntJPICds4Bhsk
	 yhknf7yshiqQ7glTpjccYQ+Nll9yBMWM0hQohKWzb6s81HjWWNIrz7xifKZK924PC0Q==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 848B91F00A16;
	Wed,  4 Nov 2026 07:21:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793776904;
	bh=EtF98CtY6LXvBTT5bElU39ANVirbJybcfi4pIpgwGA0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=TzrK9zHfJnpt2Di0v1K47j4oIhJs7boTCN4KYmfjmPJb47RmAiWBIhidXcTMBN1Ch
	 57/ONqcRPlqGhtczYKc094+Cl+Dz/XScqga6WzcX5LPgmq4lHFpPNqe85zP1k8IqeZ
	 l9joKS8uWGDgW3y96rVGj30VJNJ2PeFWKOX/iJZO45bDVU78ygsS3zTC4g/WRkNGLM
	 +oh9goGSKIATg6ReHouUoxB1Tmusf63rHllf6yNEf+GitCuZ1tHLF2bpwxi2OT2taD
	 feO4VCpiVhjgDWdbLvK+99x16zQ9ts966KlkBVv5pupv+8ZYS0p77gU89AtFZl/x/H
	 to4bo5vlmVTFw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 1A75646D10;
	Wed,  4 Nov 2026 07:21:43 +0000 (UTC)
From: Joseph Telaak via B4 Relay <devnull+joseph.telaak.dev@kernel.org>
Date: Wed, 04 Nov 2026 02:21:38 -0500
Subject: [PATCH 2/2] gpio: Add Siflower GPIO controller driver
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261104-sf19a2890-gpio-v1-2-45e463c48728@telaak.dev>
References: <20261104-sf19a2890-gpio-v1-0-45e463c48728@telaak.dev>
In-Reply-To: <20261104-sf19a2890-gpio-v1-0-45e463c48728@telaak.dev>
To: Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: Chuanhong Guo <gch981213@gmail.com>, Qingfang Deng <dqfext@gmail.com>, 
 linux-mips@vger.kernel.org, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Qingfang Deng <qingfang.deng@siflower.com.cn>, 
 Joseph Telaak <joseph@telaak.dev>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793776902; l=11522;
 i=joseph@telaak.dev; s=20261104; h=from:subject:message-id;
 bh=hvtIQF9wFX5xwYYbEiJ6e+l+MvAgPRbi7hVznRA8n6k=;
 b=7+mSE+liF8V1BMoKVl4b141BLU0uXa6Rwgzj5WbB+58SUkWW2qT3MnJNhjKq6tU4lR4tSuwpV
 oLkXcDC9K2rAe5E5yyjein5JLt7saxVI7kHc/AJLh3ershtYR0m/783
X-Developer-Key: i=joseph@telaak.dev; a=ed25519;
 pk=oQI+UfddlZ0wK2ac4WKOGNjUl1ZEN8j9ZVFSqEDoNP0=
X-Endpoint-Received: by B4 Relay for joseph@telaak.dev/20261104 with
 auth_id=1404
X-Original-From: Joseph Telaak <joseph@telaak.dev>
Reply-To: joseph@telaak.dev

From: Qingfang Deng <qingfang.deng@siflower.com.cn>

Add a driver for the GPIO controller on Siflower SoCs.
This controller is found on all current Siflower MIPS and RISC-V
chips including SF19A2890, SF21A6826 and SF21H8898.

Signed-off-by: Qingfang Deng <qingfang.deng@siflower.com.cn>
Signed-off-by: Chuanhong Guo <gch981213@gmail.com>
[jt: from Chuanhong's siflower-7.1 branch; depend on MACH_SIFLOWER_MIPS,
 longer Kconfig help, assert the reset through a devm action instead of in
 .remove, which ran before the GPIO chip was removed, drop .owner and the
 unused drvdata, drop the irq_set_affinity callback, which reached the
 parent through irq_to_desc() (not exported with SPARSE_IRQ), call
 gpiochip_disable_irq() and gpiochip_enable_irq() from mask and unmask as
 an immutable irqchip must, find the group by its parent IRQ instead of
 assuming consecutive numbers, return 0 or 1 from .get, read ngpios with
 device_property_read_u32(), linux/math64.h and sorted includes, "Siflower"
 spelling, subject]
Signed-off-by: Joseph Telaak <joseph@telaak.dev>
---
 drivers/gpio/Kconfig         |  11 ++
 drivers/gpio/Makefile        |   1 +
 drivers/gpio/gpio-siflower.c | 325 +++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 337 insertions(+)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 55e428002..6125a8452 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -721,6 +721,17 @@ config GPIO_SIFIVE
 	help
 	  Say yes here to support the GPIO device on SiFive SoCs.
 
+config GPIO_SIFLOWER
+	tristate "Siflower GPIO support"
+	depends on OF_GPIO
+	depends on MACH_SIFLOWER_MIPS || COMPILE_TEST
+	select GPIOLIB_IRQCHIP
+	help
+	  GPIO controller driver for Siflower MIPS and RISC-V SoCs
+	  including SF19A2890, SF21A6826 and SF21H8898. Each line can be an
+	  input or an output and raise an interrupt on either edge or level,
+	  and inputs can be debounced in hardware.
+
 config GPIO_SIOX
 	tristate "SIOX GPIO support"
 	depends on SIOX
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index 88f748846..bde618108 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -171,6 +171,7 @@ obj-$(CONFIG_GPIO_SCH311X)		+= gpio-sch311x.o
 obj-$(CONFIG_GPIO_SCH)			+= gpio-sch.o
 obj-$(CONFIG_GPIO_SHARED_PROXY)		+= gpio-shared-proxy.o
 obj-$(CONFIG_GPIO_SIFIVE)		+= gpio-sifive.o
+obj-$(CONFIG_GPIO_SIFLOWER)		+= gpio-siflower.o
 obj-$(CONFIG_GPIO_SIM)			+= gpio-sim.o
 obj-$(CONFIG_GPIO_SIOX)			+= gpio-siox.o
 obj-$(CONFIG_GPIO_SL28CPLD)		+= gpio-sl28cpld.o
diff --git a/drivers/gpio/gpio-siflower.c b/drivers/gpio/gpio-siflower.c
new file mode 100644
index 000000000..6eb560da7
--- /dev/null
+++ b/drivers/gpio/gpio-siflower.c
@@ -0,0 +1,325 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * GPIO controller driver for Siflower MIPS and RISC-V SoCs including:
+ *  Siflower SF19A2890
+ *  Siflower SF21A6826
+ *  Siflower SF21H8898
+ *
+ */
+#include <linux/clk.h>
+#include <linux/gpio/driver.h>
+#include <linux/irqchip/chained_irq.h>
+#include <linux/math64.h>
+#include <linux/module.h>
+#include <linux/pinctrl/consumer.h>
+#include <linux/platform_device.h>
+#include <linux/property.h>
+#include <linux/reset.h>
+
+#define GPIO_IR(n)	(0x40 * (n) + 0x00)
+#define GPIO_OR(n)	(0x40 * (n) + 0x04)
+#define GPIO_OEN(n)	(0x40 * (n) + 0x08)
+#define GPIO_IMR(n)	(0x40 * (n) + 0x0c)
+#define GPIO_GPIMR(n)	(0x40 * (n) + 0x10)
+#define GPIO_PIR(n)	(0x40 * (n) + 0x14)
+#define GPIO_ITR(n)	(0x40 * (n) + 0x18)
+#define GPIO_IFR(n)	(0x40 * (n) + 0x1c)
+#define GPIO_ICR(n)	(0x40 * (n) + 0x20)
+#define GPIO_GPxIR(n)	(0x4 * (n) + 0x4000)
+
+#define GPIOS_PER_GROUP	16
+
+struct sf_gpio_priv {
+	struct gpio_chip gc;
+	void __iomem *base;
+	struct clk *clk;
+	struct reset_control *rstc;
+	unsigned int irq[];
+};
+
+#define to_sf_gpio(x)	container_of(x, struct sf_gpio_priv, gc)
+
+static u32 sf_gpio_rd(struct sf_gpio_priv *priv, unsigned long reg)
+{
+	return readl_relaxed(priv->base + reg);
+}
+
+static void sf_gpio_wr(struct sf_gpio_priv *priv, unsigned long reg,
+		       u32 val)
+{
+	writel_relaxed(val, priv->base + reg);
+}
+
+static int sf_gpio_get_value(struct gpio_chip *gc, unsigned int offset)
+{
+	struct sf_gpio_priv *priv = to_sf_gpio(gc);
+
+	return !!sf_gpio_rd(priv, GPIO_IR(offset));
+}
+
+static int sf_gpio_set_value(struct gpio_chip *gc, unsigned int offset,
+			     int value)
+{
+	struct sf_gpio_priv *priv = to_sf_gpio(gc);
+
+	sf_gpio_wr(priv, GPIO_OR(offset), value);
+	return 0;
+}
+
+static int sf_gpio_get_direction(struct gpio_chip *gc, unsigned int offset)
+{
+	struct sf_gpio_priv *priv = to_sf_gpio(gc);
+
+	if (sf_gpio_rd(priv, GPIO_OEN(offset)))
+		return GPIO_LINE_DIRECTION_IN;
+	else
+		return GPIO_LINE_DIRECTION_OUT;
+}
+
+static int sf_gpio_direction_input(struct gpio_chip *gc, unsigned int offset)
+{
+	struct sf_gpio_priv *priv = to_sf_gpio(gc);
+
+	sf_gpio_wr(priv, GPIO_OEN(offset), 1);
+	return 0;
+}
+
+static int sf_gpio_direction_output(struct gpio_chip *gc, unsigned int offset,
+				    int value)
+{
+	struct sf_gpio_priv *priv = to_sf_gpio(gc);
+
+	sf_gpio_wr(priv, GPIO_OR(offset), value);
+	sf_gpio_wr(priv, GPIO_OEN(offset), 0);
+	return 0;
+}
+
+static int sf_gpio_set_debounce(struct gpio_chip *gc, unsigned int offset,
+				u32 debounce)
+{
+	struct sf_gpio_priv *priv = to_sf_gpio(gc);
+	unsigned long freq = clk_get_rate(priv->clk);
+	u64 mul;
+
+	/* (ICR + 1) * IFR = debounce_us * clkfreq_mhz / 4 */
+	mul = (u64)debounce * freq;
+	do_div(mul, 1000000 * 4);
+	if (mul > 0xff00)
+		return -EINVAL;
+
+	sf_gpio_wr(priv, GPIO_ICR(offset), 0xff);
+	sf_gpio_wr(priv, GPIO_IFR(offset), DIV_ROUND_UP(mul, 0x100));
+
+	return 0;
+}
+
+static int sf_gpio_set_config(struct gpio_chip *gc, unsigned int offset,
+			      unsigned long config)
+{
+	switch (pinconf_to_config_param(config)) {
+	case PIN_CONFIG_INPUT_DEBOUNCE:
+		return sf_gpio_set_debounce(gc, offset,
+			pinconf_to_config_argument(config));
+	default:
+		return gpiochip_generic_config(gc, offset, config);
+	}
+}
+
+static void sf_gpio_irq_ack(struct irq_data *data)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(data);
+	struct sf_gpio_priv *priv = to_sf_gpio(gc);
+	unsigned long offset = irqd_to_hwirq(data);
+
+	sf_gpio_wr(priv, GPIO_PIR(offset), 0);
+}
+
+static void sf_gpio_irq_mask(struct irq_data *data)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(data);
+	struct sf_gpio_priv *priv = to_sf_gpio(gc);
+	unsigned long offset = irqd_to_hwirq(data);
+
+	sf_gpio_wr(priv, GPIO_IMR(offset), 1);
+	sf_gpio_wr(priv, GPIO_GPIMR(offset), 1);
+	gpiochip_disable_irq(gc, offset);
+}
+
+static void sf_gpio_irq_unmask(struct irq_data *data)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(data);
+	struct sf_gpio_priv *priv = to_sf_gpio(gc);
+	unsigned long offset = irqd_to_hwirq(data);
+
+	gpiochip_enable_irq(gc, offset);
+	sf_gpio_wr(priv, GPIO_IMR(offset), 0);
+	sf_gpio_wr(priv, GPIO_GPIMR(offset), 0);
+}
+
+static int sf_gpio_irq_set_type(struct irq_data *data, unsigned int flow_type)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(data);
+	struct sf_gpio_priv *priv = to_sf_gpio(gc);
+	unsigned long offset = irqd_to_hwirq(data);
+	u32 val;
+
+	switch (flow_type) {
+	case IRQ_TYPE_EDGE_RISING:
+		val = 4;
+		break;
+	case IRQ_TYPE_EDGE_FALLING:
+		val = 2;
+		break;
+	case IRQ_TYPE_EDGE_BOTH:
+		val = 6;
+		break;
+	case IRQ_TYPE_LEVEL_HIGH:
+		val = 1;
+		break;
+	case IRQ_TYPE_LEVEL_LOW:
+		val = 0;
+		break;
+	default:
+		return -EINVAL;
+	}
+	sf_gpio_wr(priv, GPIO_ITR(offset), val);
+
+	if (flow_type & IRQ_TYPE_LEVEL_MASK)
+		irq_set_handler_locked(data, handle_level_irq);
+	else
+		irq_set_handler_locked(data, handle_edge_irq);
+
+	return 0;
+}
+
+static const struct irq_chip sf_gpio_irqchip = {
+	.name			= KBUILD_MODNAME,
+	.irq_ack		= sf_gpio_irq_ack,
+	.irq_mask		= sf_gpio_irq_mask,
+	.irq_unmask		= sf_gpio_irq_unmask,
+	.irq_set_type		= sf_gpio_irq_set_type,
+	.flags			= IRQCHIP_IMMUTABLE,
+	GPIOCHIP_IRQ_RESOURCE_HELPERS,
+};
+
+static void sf_gpio_irq_handler(struct irq_desc *desc)
+{
+	struct gpio_chip *gc = irq_desc_get_handler_data(desc);
+	struct irq_chip *ic = irq_desc_get_chip(desc);
+	struct sf_gpio_priv *priv = to_sf_gpio(gc);
+	unsigned int irq = irq_desc_get_irq(desc);
+	unsigned long pending;
+	unsigned int group, n;
+
+	for (group = 0; group < gc->irq.num_parents; group++)
+		if (priv->irq[group] == irq)
+			break;
+	if (WARN_ON_ONCE(group == gc->irq.num_parents))
+		return;
+
+	chained_irq_enter(ic, desc);
+
+	pending = sf_gpio_rd(priv, GPIO_GPxIR(group));
+	for_each_set_bit(n, &pending, GPIOS_PER_GROUP) {
+		generic_handle_domain_irq(gc->irq.domain,
+					  n + group * GPIOS_PER_GROUP);
+	}
+
+	chained_irq_exit(ic, desc);
+}
+
+static void sf_gpio_reset_assert(void *data)
+{
+	reset_control_assert(data);
+}
+
+static int sf_gpio_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct sf_gpio_priv *priv;
+	struct gpio_irq_chip *girq;
+	struct gpio_chip *gc;
+	u32 ngpios, ngroups;
+	int ret, i;
+
+	ret = device_property_read_u32(dev, "ngpios", &ngpios);
+	if (ret)
+		return ret;
+
+	ngroups = DIV_ROUND_UP(ngpios, GPIOS_PER_GROUP);
+	priv = devm_kzalloc(dev, struct_size(priv, irq, ngroups), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(priv->base))
+		return PTR_ERR(priv->base);
+
+	priv->clk = devm_clk_get_enabled(dev, NULL);
+	if (IS_ERR(priv->clk))
+		return PTR_ERR(priv->clk);
+
+	priv->rstc = devm_reset_control_get_optional(&pdev->dev, NULL);
+	if (IS_ERR(priv->rstc))
+		return PTR_ERR(priv->rstc);
+
+	ret = reset_control_deassert(priv->rstc);
+	if (ret)
+		return ret;
+
+	ret = devm_add_action_or_reset(dev, sf_gpio_reset_assert, priv->rstc);
+	if (ret)
+		return ret;
+
+	for (i = 0; i < ngroups; i++) {
+		ret = platform_get_irq(pdev, i);
+		if (ret < 0)
+			return ret;
+
+		priv->irq[i] = ret;
+	}
+
+	gc = &priv->gc;
+	gc->label = KBUILD_MODNAME;
+	gc->parent = dev;
+	gc->owner = THIS_MODULE;
+	gc->request = gpiochip_generic_request;
+	gc->free = gpiochip_generic_free;
+	gc->get_direction = sf_gpio_get_direction;
+	gc->direction_input = sf_gpio_direction_input;
+	gc->direction_output = sf_gpio_direction_output;
+	gc->get = sf_gpio_get_value;
+	gc->set = sf_gpio_set_value;
+	gc->set_config = sf_gpio_set_config;
+	gc->base = -1;
+	gc->ngpio = ngpios;
+
+	girq = &gc->irq;
+	gpio_irq_chip_set_chip(girq, &sf_gpio_irqchip);
+	girq->num_parents = ngroups;
+	girq->parents = priv->irq;
+	girq->parent_handler = sf_gpio_irq_handler;
+	girq->default_type = IRQ_TYPE_NONE;
+	girq->handler = handle_bad_irq;
+
+	return devm_gpiochip_add_data(dev, gc, priv);
+}
+
+static const struct of_device_id sf_gpio_ids[] = {
+	{ .compatible = "siflower,sf19a2890-gpio" },
+	{},
+};
+MODULE_DEVICE_TABLE(of, sf_gpio_ids);
+
+static struct platform_driver sf_gpio_driver = {
+	.probe		= sf_gpio_probe,
+	.driver = {
+		.name		= "siflower_gpio",
+		.of_match_table	= sf_gpio_ids,
+	},
+};
+module_platform_driver(sf_gpio_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Qingfang Deng <qingfang.deng@siflower.com.cn>");
+MODULE_DESCRIPTION("GPIO driver for Siflower SoCs");

-- 
Git-155)


