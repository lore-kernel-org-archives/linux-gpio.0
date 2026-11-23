Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795397858;
	b=znfR5Xps5CoZ41O+O1rJUGsr6KAQ5CLBtVzwp5Hu54AH+qJ5zQETaykoGm/bD3snS/Rp
	 z/1xPdwTwllX1KayTEy8HdUQF9Wp7W/FNAUEGXXKypiXa/sxPxix0GIm6KfBzFYhi2D8c
	 t5zKsDEFzI+Gudyve2XTuhxJ3ityvrM4rX8jZhhM3adPp3P+k5YmNMKH856S/0B+A2KWh
	 BBXEoEDUInA6K1LA2/g5oBLmSdTqf4izPhZAT/nTCCGsA716ZQwIXsIrKHuKTgZb91W5v
	 BtycMfuUlAv5vd5XFt3o+m7Wg4wLjVVkdazswP7jOaEeWLWWZQ5nmP1cwhUX6fngcng==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795397858;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=pH3FI74fubR+7fhtvtYJww9gsePhNdl/+sLUkBkEBa4=;
	b=hJgd98zcWsyhbrwZCF9KjF/PyeE9I5uVXOD9XkP7SXkKC55Erq3xk7FyGewDn0PBBrvv
	 4q8sPqtHWjrLbVeP+icKx8dtWedK4JIZMAc91PI8VLHrpoEAy018bsuYNbZshLZtaYaBL
	 Tez5ivhaUFMU0dHLtAC/UJX8pdBvi0L046Q64enqOyZrqLygpI5/6c+bfOt6lY6PfYA0y
	 ZvK7l5B1GSrJUanDA2nyPuanLEa9VfHNxjpLU5xk9JK58Z1y0B0+gr3PxaJLhaFXIGWv4
	 xssO5nQp3HsKsLE8GnhP32OGwxPf/3zNZhVm/SpA83q6Z8QuZfI9CIJV3vVJRkpb5Ew==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AYPVv8bw;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99BEF606A31D;
	Mon, 23 Nov 2026 01:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AYPVv8bw
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795397858;
	b=kQtQ/dnk+sF99wrLt8bbhEcjRLGNplQ6U9hmrBUrU6CJnWih9rbLEV/EilY4TgqXyLaQ
	 dov2/IugnVfu7nxs1mBOQIxDFkMcCeIzOaOg99E9uWCsGyK1XeKSIZoUjHvrSnIgbWaDj
	 qOX+HbSARaATnx8tgyH5ESNHtk1Mb5OIGutrUAZtXcZv8ZB9n/Y1gxBrw7E+SLG6W4jad
	 8kxY7ypC+6xUYtrH+qR3zgaKwssaguh7YO3M8qnbV6fE8ecyHAoLZ42kskaleJUcfUcSH
	 jsqoOlU+GwJkTb/pry0Uxn2kvOj9qcBPHJxhpYWyKcAYqxxwkkgsBkeNpRtD1NCdZLg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795397858;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=pH3FI74fubR+7fhtvtYJww9gsePhNdl/+sLUkBkEBa4=;
	b=sbrgLyqkS7ev3WE2JpvbNxVgGGAUDPTfFexQbEs3cKrM3/Hx3VYdGR0YsHMRLZlA7fl1
	 ADR/GMixl2A5SWXDgmjoI5c7da8woYiI5uycff0EI3PgVbNkGzbnPcblgQRGAOcJ0jHw3
	 BcDNvr42i7k5Ef3lILE7GMUt8bIPluktvv+8Gag6eiFYC7fUJz0LFH9dgB/no86aERsE9
	 ltaCysv0LFlMiW0GH1in5GbMPIFTaFk/LAMA4tRxKYV7XBDay8OS85D2oW9R9DNui7fXh
	 R2FCTV9QAwtClFhJLHJQ0Tqbv/iL3SJaaQrok+y+Etn28cgUb/6uqSFeP3zvnmc58jA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 844491F000D0;
	Mon, 23 Nov 2026 01:37:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795397858;
	bh=pH3FI74fubR+7fhtvtYJww9gsePhNdl/+sLUkBkEBa4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=AYPVv8bw8wHdeRoDFwY3yeH1u/YgUuQMaDBuwRxbBXljAttAzppNZeF9Cf5HnsgeQ
	 fnm1vyMPjYNafCvN5VY0+0sA5YwRi2NQI199kNFlGD6WYBhz5kHvtv7zQRfeGaDJXp
	 lWjjtFTbMI97zxUnx3B46hDj56cItE954dBzqbB+EsK0dn9Tx4SuKtfOowGYWVqEg7
	 NNHiuaDRD4GI/yh2jXXmh0Fqaeoqir3SvV6g80mtJ/sETznLSJKq1d8UzhmZGoYhAk
	 bSLYUKgKM0/h3vH+EqX9EVGbrlgywXh4OFP4qEP3yUjsVOADLPyfa18nr6T5T/lWDu
	 VaU0U2y19QOIA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 124064C2C6;
	Mon, 23 Nov 2026 01:37:28 +0000 (UTC)
From: Joseph Telaak via B4 Relay <devnull+joseph.telaak.dev@kernel.org>
Date: Sun, 22 Nov 2026 20:37:19 -0500
Subject: [PATCH v3 2/2] gpio: Add Siflower GPIO controller driver
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
Message-Id: <20261122-sf19a2890-gpio-v3-2-3a4857ebc84a@telaak.dev>
References: <20261122-sf19a2890-gpio-v3-0-3a4857ebc84a@telaak.dev>
In-Reply-To: <20261122-sf19a2890-gpio-v3-0-3a4857ebc84a@telaak.dev>
To: Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: Chuanhong Guo <gch981213@gmail.com>, Qingfang Deng <dqfext@gmail.com>, 
 Michael Walle <mwalle@kernel.org>, linux-mips@vger.kernel.org, 
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Qingfang Deng <qingfang.deng@siflower.com.cn>, 
 Joseph Telaak <joseph@telaak.dev>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795397847; l=13478;
 i=joseph@telaak.dev; s=20261104; h=from:subject:message-id;
 bh=k1pP3XHZsSFsQ00lD8MpussH+G4HJCo9w2Ijs75Whlo=;
 b=It/AW+kdNxYr39YgUODp+v1K3tVf4j9ONk63MJAOmqwPZxYVIJ8YDk0wtrzCmwD6BAcz7Q950
 XSEzGWg0i8yCUMHi2e02cm+P1fL9dudwWnmeSm6PUYde1pXrbSZK5yX
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
[Joseph Telaak:
  - take it from Chuanhong's siflower-7.1 branch
  - depend on MACH_SIFLOWER_MIPS instead of OF_GPIO, longer Kconfig help
  - get the reset with devm_reset_control_get_exclusive_deasserted(),
    so it is asserted again only after the GPIO chip is removed, not in
    a .remove that ran first
  - use gpio-regmap on regmap-mmio, with the 0x40 stride in
    reg_mask_xlate() and the debounce in set_config(), and put the
    interrupts on an IRQ domain of the driver's own, as gpio-regmap
    sets up no gpio_irq_chip and each group of 16 lines has its own
    parent interrupt
  - drop the irq_set_affinity callback, which reached the parent
    through irq_to_desc(), not exported with SPARSE_IRQ
  - call gpio_regmap_disable_irq() and gpio_regmap_enable_irq() from
    mask and unmask, as an immutable irqchip must
  - find the group by its parent IRQ instead of assuming consecutive
    numbers
  - take the number of lines from the match data, not from an
    ngpios property
  - include linux/math64.h, drop the unused linux/pinctrl/consumer.h,
    sort the includes, spell it "Siflower"
  - subject]
Co-developed-by: Joseph Telaak <joseph@telaak.dev>
Signed-off-by: Joseph Telaak <joseph@telaak.dev>
---
 MAINTAINERS                  |   1 +
 drivers/gpio/Kconfig         |  14 ++
 drivers/gpio/Makefile        |   1 +
 drivers/gpio/gpio-siflower.c | 344 +++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 360 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 4193b433c915..0a3f91844072 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25711,6 +25711,7 @@ M:	Joseph Telaak <joseph@telaak.dev>
 L:	linux-gpio@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/gpio/siflower,sf19a2890-gpio.yaml
+F:	drivers/gpio/gpio-siflower.c
 
 SILEAD TOUCHSCREEN DRIVER
 M:	Hans de Goede <hansg@kernel.org>
diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 55e4280029d8..0b52fc2a5335 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -721,6 +721,20 @@ config GPIO_SIFIVE
 	help
 	  Say yes here to support the GPIO device on SiFive SoCs.
 
+config GPIO_SIFLOWER
+	tristate "Siflower GPIO support"
+	depends on MACH_SIFLOWER_MIPS || COMPILE_TEST
+	select GPIOLIB_IRQCHIP
+	select GPIO_REGMAP
+	select REGMAP_MMIO
+	help
+	  GPIO controller driver for the Siflower SF19A2890. Each line can be
+	  an input or an output and raise an interrupt on either edge or
+	  level, and inputs can be debounced in hardware.
+
+	  To compile this driver as a module, choose M here: the module will
+	  be called gpio-siflower.
+
 config GPIO_SIOX
 	tristate "SIOX GPIO support"
 	depends on SIOX
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index 88f748846e60..bde6181081f9 100644
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
index 000000000000..4bf7e36960e4
--- /dev/null
+++ b/drivers/gpio/gpio-siflower.c
@@ -0,0 +1,344 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * GPIO controller driver for Siflower MIPS and RISC-V SoCs including:
+ *  Siflower SF19A2890
+ *  Siflower SF21A6826
+ *  Siflower SF21H8898
+ */
+
+#include <linux/bitops.h>
+#include <linux/clk.h>
+#include <linux/gpio/driver.h>
+#include <linux/gpio/regmap.h>
+#include <linux/irq.h>
+#include <linux/irqchip/chained_irq.h>
+#include <linux/irqdomain.h>
+#include <linux/math64.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/property.h>
+#include <linux/regmap.h>
+#include <linux/reset.h>
+
+/* Each line has its own registers, GPIO_STRIDE apart */
+#define GPIO_STRIDE	0x40
+#define GPIO_IR(n)	(GPIO_STRIDE * (n) + 0x00)
+#define GPIO_OR(n)	(GPIO_STRIDE * (n) + 0x04)
+#define GPIO_OEN(n)	(GPIO_STRIDE * (n) + 0x08)
+#define GPIO_IMR(n)	(GPIO_STRIDE * (n) + 0x0c)
+#define GPIO_GPIMR(n)	(GPIO_STRIDE * (n) + 0x10)
+#define GPIO_PIR(n)	(GPIO_STRIDE * (n) + 0x14)
+#define GPIO_ITR(n)	(GPIO_STRIDE * (n) + 0x18)
+#define GPIO_IFR(n)	(GPIO_STRIDE * (n) + 0x1c)
+#define GPIO_ICR(n)	(GPIO_STRIDE * (n) + 0x20)
+#define GPIO_GPxIR(n)	(0x4 * (n) + 0x4000)
+
+#define GPIOS_PER_GROUP	16
+
+static struct lock_class_key sf_gpio_irq_lock_class;
+static struct lock_class_key sf_gpio_irq_request_class;
+
+struct sf_gpio_soc_data {
+	unsigned int ngpios;
+};
+
+struct sf_gpio_priv {
+	struct gpio_regmap *gpio;
+	struct regmap *regmap;
+	struct irq_domain *domain;
+	struct clk *clk;
+	unsigned int ngroups;
+	unsigned int irq[];
+};
+
+static int sf_gpio_reg_mask_xlate(struct gpio_regmap *gpio,
+				  enum gpio_regmap_operation op,
+				  unsigned int base, unsigned int offset,
+				  unsigned int *reg, unsigned int *mask)
+{
+	*reg = base + GPIO_STRIDE * offset;
+	*mask = BIT(0);
+	return 0;
+}
+
+static int sf_gpio_set_debounce(struct sf_gpio_priv *priv, unsigned int offset,
+				u32 debounce)
+{
+	unsigned long freq = clk_get_rate(priv->clk);
+	u64 mul;
+	int ret;
+
+	/* (ICR + 1) * IFR = debounce_us * clkfreq_mhz / 4 */
+	mul = (u64)debounce * freq;
+	do_div(mul, 1000000 * 4);
+	if (mul > 0xff00)
+		return -EINVAL;
+
+	ret = regmap_write(priv->regmap, GPIO_ICR(offset), 0xff);
+	if (ret)
+		return ret;
+
+	return regmap_write(priv->regmap, GPIO_IFR(offset),
+			    DIV_ROUND_UP(mul, 0x100));
+}
+
+static int sf_gpio_set_config(struct gpio_regmap *gpio, struct gpio_chip *gc,
+			      unsigned int offset, unsigned long config)
+{
+	struct sf_gpio_priv *priv = gpio_regmap_get_drvdata(gpio);
+
+	switch (pinconf_to_config_param(config)) {
+	case PIN_CONFIG_INPUT_DEBOUNCE:
+		return sf_gpio_set_debounce(priv, offset,
+			pinconf_to_config_argument(config));
+	default:
+		return gpiochip_generic_config(gc, offset, config);
+	}
+}
+
+static void sf_gpio_irq_ack(struct irq_data *data)
+{
+	struct sf_gpio_priv *priv = irq_data_get_irq_chip_data(data);
+
+	regmap_write(priv->regmap, GPIO_PIR(irqd_to_hwirq(data)), 0);
+}
+
+static void sf_gpio_irq_mask(struct irq_data *data)
+{
+	struct sf_gpio_priv *priv = irq_data_get_irq_chip_data(data);
+	irq_hw_number_t hwirq = irqd_to_hwirq(data);
+
+	regmap_write(priv->regmap, GPIO_IMR(hwirq), 1);
+	regmap_write(priv->regmap, GPIO_GPIMR(hwirq), 1);
+	gpio_regmap_disable_irq(priv->gpio, hwirq);
+}
+
+static void sf_gpio_irq_unmask(struct irq_data *data)
+{
+	struct sf_gpio_priv *priv = irq_data_get_irq_chip_data(data);
+	irq_hw_number_t hwirq = irqd_to_hwirq(data);
+
+	gpio_regmap_enable_irq(priv->gpio, hwirq);
+	regmap_write(priv->regmap, GPIO_IMR(hwirq), 0);
+	regmap_write(priv->regmap, GPIO_GPIMR(hwirq), 0);
+}
+
+static int sf_gpio_irq_set_type(struct irq_data *data, unsigned int flow_type)
+{
+	struct sf_gpio_priv *priv = irq_data_get_irq_chip_data(data);
+	u32 val;
+	int ret;
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
+
+	ret = regmap_write(priv->regmap, GPIO_ITR(irqd_to_hwirq(data)), val);
+	if (ret)
+		return ret;
+
+	if (flow_type & IRQ_TYPE_LEVEL_MASK)
+		irq_set_handler_locked(data, handle_level_irq);
+	else
+		irq_set_handler_locked(data, handle_edge_irq);
+
+	return 0;
+}
+
+static int sf_gpio_irq_request_resources(struct irq_data *data)
+{
+	struct sf_gpio_priv *priv = irq_data_get_irq_chip_data(data);
+
+	return gpio_regmap_reqres_irq(priv->gpio, irqd_to_hwirq(data));
+}
+
+static void sf_gpio_irq_release_resources(struct irq_data *data)
+{
+	struct sf_gpio_priv *priv = irq_data_get_irq_chip_data(data);
+
+	gpio_regmap_relres_irq(priv->gpio, irqd_to_hwirq(data));
+}
+
+static const struct irq_chip sf_gpio_irqchip = {
+	.name			= KBUILD_MODNAME,
+	.irq_ack		= sf_gpio_irq_ack,
+	.irq_mask		= sf_gpio_irq_mask,
+	.irq_unmask		= sf_gpio_irq_unmask,
+	.irq_set_type		= sf_gpio_irq_set_type,
+	.irq_request_resources	= sf_gpio_irq_request_resources,
+	.irq_release_resources	= sf_gpio_irq_release_resources,
+	.flags			= IRQCHIP_IMMUTABLE,
+};
+
+static void sf_gpio_irq_handler(struct irq_desc *desc)
+{
+	struct sf_gpio_priv *priv = irq_desc_get_handler_data(desc);
+	struct irq_chip *ic = irq_desc_get_chip(desc);
+	unsigned int irq = irq_desc_get_irq(desc);
+	unsigned int group, n, val;
+	unsigned long pending;
+
+	for (group = 0; group < priv->ngroups; group++)
+		if (priv->irq[group] == irq)
+			break;
+	if (WARN_ON_ONCE(group == priv->ngroups))
+		return;
+
+	chained_irq_enter(ic, desc);
+
+	if (!regmap_read(priv->regmap, GPIO_GPxIR(group), &val)) {
+		pending = val;
+		for_each_set_bit(n, &pending, GPIOS_PER_GROUP)
+			generic_handle_domain_irq(priv->domain,
+						  n + group * GPIOS_PER_GROUP);
+	}
+
+	chained_irq_exit(ic, desc);
+}
+
+static int sf_gpio_irq_map(struct irq_domain *domain, unsigned int irq,
+			   irq_hw_number_t hwirq)
+{
+	irq_set_chip_data(irq, domain->host_data);
+	irq_set_chip_and_handler(irq, &sf_gpio_irqchip, handle_bad_irq);
+	irq_set_noprobe(irq);
+	irq_set_lockdep_class(irq, &sf_gpio_irq_lock_class,
+			      &sf_gpio_irq_request_class);
+
+	return 0;
+}
+
+static const struct irq_domain_ops sf_gpio_irq_domain_ops = {
+	.map	= sf_gpio_irq_map,
+	.xlate	= irq_domain_xlate_twocell,
+};
+
+static void sf_gpio_remove_chained_handler(void *data)
+{
+	irq_set_chained_handler_and_data((unsigned long)data, NULL, NULL);
+}
+
+static const struct regmap_config sf_gpio_regmap_config = {
+	.reg_bits	= 32,
+	.reg_stride	= 4,
+	.val_bits	= 32,
+};
+
+static int sf_gpio_probe(struct platform_device *pdev)
+{
+	struct gpio_regmap_config config = { };
+	struct irq_domain_info d_info = { };
+	struct device *dev = &pdev->dev;
+	const struct sf_gpio_soc_data *soc;
+	struct reset_control *rstc;
+	struct sf_gpio_priv *priv;
+	unsigned int ngroups, i;
+	void __iomem *base;
+	int ret;
+
+	soc = device_get_match_data(dev);
+	if (!soc)
+		return -ENODEV;
+
+	ngroups = DIV_ROUND_UP(soc->ngpios, GPIOS_PER_GROUP);
+	priv = devm_kzalloc(dev, struct_size(priv, irq, ngroups), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->ngroups = ngroups;
+
+	base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(base))
+		return PTR_ERR(base);
+
+	priv->regmap = devm_regmap_init_mmio(dev, base, &sf_gpio_regmap_config);
+	if (IS_ERR(priv->regmap))
+		return PTR_ERR(priv->regmap);
+
+	priv->clk = devm_clk_get_enabled(dev, NULL);
+	if (IS_ERR(priv->clk))
+		return PTR_ERR(priv->clk);
+
+	rstc = devm_reset_control_get_exclusive_deasserted(dev, NULL);
+	if (IS_ERR(rstc))
+		return PTR_ERR(rstc);
+
+	d_info.fwnode = dev_fwnode(dev);
+	d_info.size = soc->ngpios;
+	d_info.hwirq_max = soc->ngpios;
+	d_info.ops = &sf_gpio_irq_domain_ops;
+	d_info.host_data = priv;
+
+	priv->domain = devm_irq_domain_instantiate(dev, &d_info);
+	if (IS_ERR(priv->domain))
+		return PTR_ERR(priv->domain);
+
+	for (i = 0; i < ngroups; i++) {
+		ret = platform_get_irq(pdev, i);
+		if (ret < 0)
+			return ret;
+
+		priv->irq[i] = ret;
+		irq_set_chained_handler_and_data(priv->irq[i],
+						 sf_gpio_irq_handler, priv);
+		ret = devm_add_action_or_reset(dev,
+					       sf_gpio_remove_chained_handler,
+					       (void *)(unsigned long)priv->irq[i]);
+		if (ret)
+			return ret;
+	}
+
+	config.parent = dev;
+	config.regmap = priv->regmap;
+	config.ngpio = soc->ngpios;
+	config.reg_dat_base = GPIO_REGMAP_ADDR(GPIO_IR(0));
+	config.reg_set_base = GPIO_OR(0);
+	config.reg_dir_in_base = GPIO_OEN(0);
+	config.reg_mask_xlate = sf_gpio_reg_mask_xlate;
+	config.set_config = sf_gpio_set_config;
+	config.irq_domain = priv->domain;
+	config.drvdata = priv;
+
+	priv->gpio = devm_gpio_regmap_register(dev, &config);
+
+	return PTR_ERR_OR_ZERO(priv->gpio);
+}
+
+static const struct sf_gpio_soc_data sf19a2890_gpio_data = {
+	.ngpios = 49,
+};
+
+static const struct of_device_id sf_gpio_ids[] = {
+	{ .compatible = "siflower,sf19a2890-gpio", .data = &sf19a2890_gpio_data },
+	{ }
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


