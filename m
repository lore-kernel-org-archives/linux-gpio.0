Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794254991;
	b=ItlxceMStNh/1NN64ZOgQ8ubOB8xSe5MCfuJlsspq9sMEMuveyiq4cd9GehFiWlPFEJQ
	 2Bw6w74+U7Db2xOt5OUR/GPida7CBzfYy+2EqwaSdsY3WJlUBIatU/YQjKksDRv6/wSg2
	 sRoeCOER+HKIUv6GQ4iiwJVaD8aSN/3ve5t6HcpyhcBeYOXwcl04kePB3iTOlj1MVtXPg
	 tttW7eB4UvFkp30ruj1H6onqN6djyFHZyaOORX+QZ4a+QbUCEtrizzx6MmtsWrhuL3tGJ
	 2m+BXhYFHh3ZW+RMDIEsGWmY9xpO48f+d8dfIfq/Jnb8X7jpCrlJbDX0eyJhhsqLTSA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794254991;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=uBHpVpQmjtQYDCChIAnS+EJbenNQcXBtUciubhv5A5Y=;
	b=HOaYdOGj1Q80UsF6qO2/wiG1hovwhCgjTG+YkPtx/JGaM4uIWyYJhRj9j6DggvEm8yOn
	 M2KRv41YyYEIMfQPPqaYl7RfVIuDEEMULiUyX/OeiA92AWyGEYHHLrx96Fg4eLukmFi2b
	 NRtJBv1ek0ktxeOAHc0EIwXooHd/q8SjpqxyplAIYjDzUxiFIqgLEFIAmKK4DB36jIGus
	 fQRLG1ncPH1Q5avMJ9pnvpzXY37hTIcQodDiw1X6p+MHkK5vu+zztb8zn6d9d48OfNc/l
	 VIyFXxez0MiofH1LX4iP227RXAb1CnFiago3OcJ9vYlWVMBqrvmDStI5Ocu1K61jG4g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Wa8yEKNI;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA091606A31C;
	Mon,  9 Nov 2026 20:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Wa8yEKNI
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794254990;
	b=YE7CCat/D7VGhrg2vX1oxd2vFSm3fL2IWpBYm7xZIHVRKeDLhzMvixFgh3aWbEZDM7cc
	 9hfiXZiCL7dMHf04Y4oZAAFicQgx/25N7WAdqpxwxf5MssG/xKmv9W4/CXUorSrnQkG3I
	 66m1N2GnaGaMvMmE0AOxyg+HChWEB32+qq2W2r4qw7632WZ+PqbXo+rNoIxZ7zyXJXbsz
	 YLWrIW4tTMyf13GEXdTgce0vCZcGrCFEOhG8fCp8bD6KZVAgt2pfn8Zq9ejvsOmoq3m4I
	 irqqq4IMxtXP0K1X2k+d0wUFxY01YCxoy0fSd+DrxnP4yZTIK5CpZcDGLolqLuavLAA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794254990;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=uBHpVpQmjtQYDCChIAnS+EJbenNQcXBtUciubhv5A5Y=;
	b=YINkj7OenVbuenqmzaKAyv+H4f3RyiMiyPc2aAFjURFPuVB1SayYPSKR//9GLS5MKtUC
	 NQmqazvx8BFhqudVjEVmHjHNNQOB3ipJM0F7+4aSfUsqEq2onpIImYPK2chquT/+jty8m
	 LPQ7jP9rBFfB5BpY5PUod3jJlWHk8oekmUtdBA/CMR9Y/76HKk06QxPkIWxc3KKp7LhH0
	 3DRrR1rBMSsBQUAC6jp4bdq0RnwztZWzvDI2m7zp5On+yuoyFbLZgWPhZ2vlBxoCFJFql
	 BiLqVAtJYrEydzoEnvOVGKsgZV9gV4jO7Qs8SBDg1uZwLnSgEQA7ifT7O1zNvZTvQHQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 44EFB1F008A3;
	Mon,  9 Nov 2026 20:09:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794254990;
	bh=uBHpVpQmjtQYDCChIAnS+EJbenNQcXBtUciubhv5A5Y=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=Wa8yEKNI7iddJWt/FAyyI3LfCsPQ/li/k669Ayd7mIr1415Xlub6pZ/+4R3Lt7bKf
	 Af2cHsgBPlTh8XjBEnPakMKYUtkxcPhzSAj/kXOvLF1teGDQjfk0mIe2y9r1t/PZS9
	 yaIMHhN3j9X2ziHDnCN9kt+5TKUdtzNY+nyv8WYSdDXIokvhavclnXZKAn7Vg5WPiM
	 C1B5NJW1Ys1wB0u1a3mnFQhoijC0UxqnPqW9nljqCNRv+ctdmiE6KJO+Yx0R7ea+ae
	 UKZAhn12uHrD4H4FeIFoxOXjcTAWJs7JYP/cRZCTpsYhlFr7lzXaIUpfxc6KiMPfjp
	 gmZu0ppZ3fZKw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id C17D74863D;
	Mon,  9 Nov 2026 20:09:48 +0000 (UTC)
From: Joseph Telaak via B4 Relay <devnull+joseph.telaak.dev@kernel.org>
Date: Mon, 09 Nov 2026 15:09:32 -0500
Subject: [PATCH v2 2/2] gpio: Add Siflower GPIO controller driver
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
Message-Id: <20261109-sf19a2890-gpio-v2-2-b885fbd84c4c@telaak.dev>
References: <20261109-sf19a2890-gpio-v2-0-b885fbd84c4c@telaak.dev>
In-Reply-To: <20261109-sf19a2890-gpio-v2-0-b885fbd84c4c@telaak.dev>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794254988; l=12083;
 i=joseph@telaak.dev; s=20261104; h=from:subject:message-id;
 bh=mqbjDOWPMhY4iBG3cQePNaKpIlyeef23uSc1bYB6gIs=;
 b=7MncLPaI/pXntJ2l7QKghvSVAMn40fsz0LLdsvkD6F7HBotdJWIC6O/midmaM/R8Fe65HwDBx
 yjSFmqE+ywIC0bJS2AmpywlgHiAus1+j2CkYUasaj4+SQzAGfA3IpyK
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
  - drop .owner and the unused drvdata, and get priv with
    gpiochip_get_data()
  - drop the irq_set_affinity callback, which reached the parent
    through irq_to_desc(), not exported with SPARSE_IRQ
  - call gpiochip_disable_irq() and gpiochip_enable_irq() from mask
    and unmask, as an immutable irqchip must
  - find the group by its parent IRQ instead of assuming consecutive
    numbers
  - return 0 or 1 from .get
  - use readl() and writel() directly, without wrapper functions
  - take the number of lines from the match data, not from an
    ngpios property
  - include linux/math64.h, drop the unused linux/pinctrl/consumer.h,
    sort the includes, spell it "Siflower"
  - subject]
Co-developed-by: Joseph Telaak <joseph@telaak.dev>
Signed-off-by: Joseph Telaak <joseph@telaak.dev>
---
 MAINTAINERS                  |   1 +
 drivers/gpio/Kconfig         |  12 ++
 drivers/gpio/Makefile        |   1 +
 drivers/gpio/gpio-siflower.c | 310 +++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 324 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 4193b433c..0a3f91844 100644
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
index 55e428002..623c09832 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -721,6 +721,18 @@ config GPIO_SIFIVE
 	help
 	  Say yes here to support the GPIO device on SiFive SoCs.
 
+config GPIO_SIFLOWER
+	tristate "Siflower GPIO support"
+	depends on MACH_SIFLOWER_MIPS || COMPILE_TEST
+	select GPIOLIB_IRQCHIP
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
index 000000000..3fde9a287
--- /dev/null
+++ b/drivers/gpio/gpio-siflower.c
@@ -0,0 +1,310 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * GPIO controller driver for Siflower MIPS and RISC-V SoCs including:
+ *  Siflower SF19A2890
+ *  Siflower SF21A6826
+ *  Siflower SF21H8898
+ */
+
+#include <linux/clk.h>
+#include <linux/gpio/driver.h>
+#include <linux/irqchip/chained_irq.h>
+#include <linux/math64.h>
+#include <linux/module.h>
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
+struct sf_gpio_soc_data {
+	unsigned int ngpios;
+};
+
+struct sf_gpio_priv {
+	struct gpio_chip gc;
+	void __iomem *base;
+	struct clk *clk;
+	unsigned int irq[];
+};
+
+static int sf_gpio_get_value(struct gpio_chip *gc, unsigned int offset)
+{
+	struct sf_gpio_priv *priv = gpiochip_get_data(gc);
+
+	return !!readl(priv->base + GPIO_IR(offset));
+}
+
+static int sf_gpio_set_value(struct gpio_chip *gc, unsigned int offset,
+			     int value)
+{
+	struct sf_gpio_priv *priv = gpiochip_get_data(gc);
+
+	writel(value, priv->base + GPIO_OR(offset));
+	return 0;
+}
+
+static int sf_gpio_get_direction(struct gpio_chip *gc, unsigned int offset)
+{
+	struct sf_gpio_priv *priv = gpiochip_get_data(gc);
+
+	if (readl(priv->base + GPIO_OEN(offset)))
+		return GPIO_LINE_DIRECTION_IN;
+
+	return GPIO_LINE_DIRECTION_OUT;
+}
+
+static int sf_gpio_direction_input(struct gpio_chip *gc, unsigned int offset)
+{
+	struct sf_gpio_priv *priv = gpiochip_get_data(gc);
+
+	writel(1, priv->base + GPIO_OEN(offset));
+	return 0;
+}
+
+static int sf_gpio_direction_output(struct gpio_chip *gc, unsigned int offset,
+				    int value)
+{
+	struct sf_gpio_priv *priv = gpiochip_get_data(gc);
+
+	writel(value, priv->base + GPIO_OR(offset));
+	writel(0, priv->base + GPIO_OEN(offset));
+	return 0;
+}
+
+static int sf_gpio_set_debounce(struct gpio_chip *gc, unsigned int offset,
+				u32 debounce)
+{
+	struct sf_gpio_priv *priv = gpiochip_get_data(gc);
+	unsigned long freq = clk_get_rate(priv->clk);
+	u64 mul;
+
+	/* (ICR + 1) * IFR = debounce_us * clkfreq_mhz / 4 */
+	mul = (u64)debounce * freq;
+	do_div(mul, 1000000 * 4);
+	if (mul > 0xff00)
+		return -EINVAL;
+
+	writel(0xff, priv->base + GPIO_ICR(offset));
+	writel(DIV_ROUND_UP(mul, 0x100), priv->base + GPIO_IFR(offset));
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
+	struct sf_gpio_priv *priv = gpiochip_get_data(gc);
+	unsigned long offset = irqd_to_hwirq(data);
+
+	writel(0, priv->base + GPIO_PIR(offset));
+}
+
+static void sf_gpio_irq_mask(struct irq_data *data)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(data);
+	struct sf_gpio_priv *priv = gpiochip_get_data(gc);
+	unsigned long offset = irqd_to_hwirq(data);
+
+	writel(1, priv->base + GPIO_IMR(offset));
+	writel(1, priv->base + GPIO_GPIMR(offset));
+	gpiochip_disable_irq(gc, offset);
+}
+
+static void sf_gpio_irq_unmask(struct irq_data *data)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(data);
+	struct sf_gpio_priv *priv = gpiochip_get_data(gc);
+	unsigned long offset = irqd_to_hwirq(data);
+
+	gpiochip_enable_irq(gc, offset);
+	writel(0, priv->base + GPIO_IMR(offset));
+	writel(0, priv->base + GPIO_GPIMR(offset));
+}
+
+static int sf_gpio_irq_set_type(struct irq_data *data, unsigned int flow_type)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(data);
+	struct sf_gpio_priv *priv = gpiochip_get_data(gc);
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
+	writel(val, priv->base + GPIO_ITR(offset));
+
+	if (flow_type & IRQ_TYPE_LEVEL_MASK) {
+		irq_set_handler_locked(data, handle_level_irq);
+		return 0;
+	}
+
+	irq_set_handler_locked(data, handle_edge_irq);
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
+	struct sf_gpio_priv *priv = gpiochip_get_data(gc);
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
+	pending = readl(priv->base + GPIO_GPxIR(group));
+	for_each_set_bit(n, &pending, GPIOS_PER_GROUP) {
+		generic_handle_domain_irq(gc->irq.domain,
+					  n + group * GPIOS_PER_GROUP);
+	}
+
+	chained_irq_exit(ic, desc);
+}
+
+static int sf_gpio_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	const struct sf_gpio_soc_data *soc;
+	struct reset_control *rstc;
+	struct sf_gpio_priv *priv;
+	struct gpio_irq_chip *girq;
+	struct gpio_chip *gc;
+	u32 ngpios, ngroups;
+	int ret, i;
+
+	soc = device_get_match_data(dev);
+	if (!soc)
+		return -ENODEV;
+
+	ngpios = soc->ngpios;
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
+	rstc = devm_reset_control_get_exclusive_deasserted(dev, NULL);
+	if (IS_ERR(rstc))
+		return PTR_ERR(rstc);
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


