Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795465630;
	b=QIbvI+cBFzCeeJ5Mq/wKy5Tp1SxDWwWbCWhFYKW5gcApqBoH3ozsSxcOjn0cyRxGcuyL
	 1373M/Oz0u1P4lb5okY0ymh4VfC947xmEq4b9jgmvYLL7RLk4NpnlKqglREHQqpjJt41e
	 m/ey9x3OwwDsXFYvlGLrsuWvrhICL5KumhYy98ziY3x4PKvk0aqJYEfhMRqED5ug9aqNp
	 7d6QDwSbR65SyoMH9odyOAWlNjKJyi5ax9mvcV583mFM389445fs2YiVf06Uer5wAW9UE
	 9g7XhkrOD893Aiz3CpVh7tZzsSfzrGiXpHE1SgHg+9sUrcrwQ8TNiLMIaZstFVwq83Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795465630;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=kxyZ6UZFcbYGCnLOm2Vxd4l9fBPKFCro49fi48VVP/w=;
	b=I03ZNEwoWP1FoOV7ziXrdIQVOJ8F+xw+b2hgiNAbRL1WDa51q4Ycdq/60nJ4h3rc8rO0
	 3L8cJkg4gP9G2pu58R9zD54QqYTaZ/C6nHic7odCkaKGshcFKkpop7GuLAFS8SWsDFjp/
	 FI/dxcz1RF4teJ2YtXS/gvdGxyqf0MZxTa56ZP7GMrH4MDJJsqsXHK3qdDVgCRRgv6N8R
	 vOCco9NoM00FaftMhqcE8XVCdGmnedQ+SMCdT2Mwm8U0SHJxRStb3VMb/muKX0IEziWf3
	 udnMUi1rXYC+4ueWxQ3AZP0I87goWCsY8p+ps2Czyhg46K5AGYfSAtFV4PKpYbcLaMw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MKbYXgiO;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A2E2606A334;
	Mon, 23 Nov 2026 20:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MKbYXgiO
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795465629;
	b=R9summlmE0LO4xu/L4OSgtlicDzgwEG0bbgPhPuJ8lh2WTQjkOelk+gfdQqMDrHNI/8Q
	 mgjHZUWRwejHgXdFh2+k93RsuXgHks23BrCNHtqt+x3cDGBCXQjE8Zjl3Cd08lujXxzL6
	 g+mLS5nRBVfz2GXSezFVgj+6hcCJlkXi99/tajOT0Sig9AWi6oB8BaD1Z2Qg3JVclqzfu
	 Z3HE8IhPqVOijd6L2P1oCZ7LJp4QmhFmZV6wnK4NmhN/k/ck04gGA2X6cbYNzOYtc7YPA
	 MYKkGtGummsr7IyK5cu+Yrp0c3PkVPNpzaoS0AjVSEKiKLmWUOEx5hLEzK20sTXf8AQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795465629;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=kxyZ6UZFcbYGCnLOm2Vxd4l9fBPKFCro49fi48VVP/w=;
	b=lv0zZjVSx/5mD+ls/O3EjwKpAQb9TiRdfdWtCEq9InL2v9lXza9q4Nl/dOdOM0X3joIo
	 3MxXgCEuQlO1vaxXRKXv21Dk8Y4ZCTdrDij1wgq8iO1rnruDp7cWY244tvjRYdiJGpWzk
	 635VuiUzzhbUci65t/j5tEdoIeZ4RFqcZH0LQ7G/II4IJeCBOlGcRZpA/lFJThxQJ9jAJ
	 Iplm3I8hZl3+3On2Qo0acAIdkUvua/rmcnMeO2wprvimcmE6fuQbhbdAt+nQ0dAL1lID7
	 rdk3u95Y3N3awB8zWW3+FaPFMu20a/czSc4/O9yN1Bb6Vt6K7moCDErOyp5IwK2vlsg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0D4241F000D1;
	Mon, 23 Nov 2026 20:26:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795465629;
	bh=kxyZ6UZFcbYGCnLOm2Vxd4l9fBPKFCro49fi48VVP/w=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=MKbYXgiOAaJ9dpffi8ODYhKdF9PoPgziAqdZ0M2q2bBx0tobN6I+LoI1TFMrb0sCj
	 p4e/7bLSSbWcFaDNHldBK/VQGbRORj5MkWJWcRGVli9k/2CXayw2pKL0+2a5LUAe3d
	 dkyrKa4UCwPgltiH7vReXYqp1Ku4AHhBYg2iEvsKNaEek7s7uhV4rKQmkei+nvy1K9
	 fAsRDVg7VuT1NP9rQLe3FYpkSsIrN8N3YVGKvZerDKjrZwspieZnpioqx8a4UyuIOY
	 AEopZhteidhk9VRjCS6zCzLAjLxslW8sUNp/hei9eSSM7XzaaAvjYlgODj2FqLrFow
	 XcW6jZ0NW29oA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 8FF5C4C6D9;
	Mon, 23 Nov 2026 20:26:58 +0000 (UTC)
From: Fil Dunsky via B4 Relay <devnull+filipp.dunsky.gmail.com@kernel.org>
Date: Mon, 23 Nov 2026 23:26:58 +0300
Subject: [PATCH v2 4/5] pinctrl: Add Cortina Systems CS7542 pin multiplexer
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
Message-Id: <20261123-cs7542-syscon-v2-4-1cd74b2522f9@gmail.com>
References: <20261123-cs7542-syscon-v2-0-1cd74b2522f9@gmail.com>
In-Reply-To: <20261123-cs7542-syscon-v2-0-1cd74b2522f9@gmail.com>
To: Linus Walleij <linusw@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-gpio@vger.kernel.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795465614; l=8324;
 i=filipp.dunsky@gmail.com; s=20260930; h=from:subject:message-id;
 bh=UNpZwyEFgKF3jz0tUixduHTlnN10XC0JDB4foaScjk8=;
 b=HjzHWx+KKncsOSVhOPBX+wdlq2A4QvsU0p3wP8K1BIXGnvOpq41si01WU2NvLEsAA5apHw8Og
 hupMUzlYTJnBWt6yTGOBPPrVc7hsF8ft9gvaqqJJbVcB9qVnAQfc1sN
X-Developer-Key: i=filipp.dunsky@gmail.com; a=ed25519;
 pk=JAYP8e2rJ54DHOmhNtXud8rl1igAaAXoOHxtJmVXI1g=
X-Endpoint-Received: by B4 Relay for filipp.dunsky@gmail.com/20260930 with
 auth_id=1085
X-Original-From: Fil Dunsky <filipp.dunsky@gmail.com>
Reply-To: filipp.dunsky@gmail.com
Content-Transfer-Encoding: 7bit

From: Fil Dunsky <filipp.dunsky@gmail.com>

Use the global syscon regmap for the five GPIO mux registers. Each
bit selects GPIO when set and a peripheral signal when clear. Support
GPIO on all 160 lines and the six UART pins exercised by the OpenWrt
port. Do not guess mux settings for the other peripherals.

Use masked regmap updates so independent pins and users of the shared
block retain their settings. No register changes are made merely by
probing; only a selected state or a GPIO request changes a pin.
Register and initialize the controller before enabling its own hogs.

AI assistance: Codex prepared this change from the existing OpenWrt port
and GPL vendor sources.

Signed-off-by: Fil Dunsky <filipp.dunsky@gmail.com>
---
 drivers/pinctrl/Kconfig          |  13 +++
 drivers/pinctrl/Makefile         |   1 +
 drivers/pinctrl/pinctrl-cs7542.c | 195 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 209 insertions(+)

diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
index dc7138302..89f247cb2 100644
--- a/drivers/pinctrl/Kconfig
+++ b/drivers/pinctrl/Kconfig
@@ -188,6 +188,19 @@ config PINCTRL_BM1880
 	help
 	  Pinctrl driver for Bitmain BM1880 SoC.
 
+config PINCTRL_CS7542
+	tristate "Cortina Systems CS7542 pin multiplexer"
+	depends on OF && HAS_IOMEM
+	select MFD_SYSCON
+	select PINMUX
+	select GENERIC_PINCONF
+	help
+	  Select GPIO mode or the supported peripheral signals in the CS7542
+	  global control block. This driver shares the syscon register map
+	  with the clock provider and leaves unrelated pins unchanged.
+	  Electrical pin configuration and other peripheral routes are not
+	  implemented.
+
 config PINCTRL_CY8C95X0
 	tristate "Cypress CY8C95X0 I2C pinctrl and GPIO driver"
 	depends on I2C
diff --git a/drivers/pinctrl/Makefile b/drivers/pinctrl/Makefile
index ce0825f4f..59541be4d 100644
--- a/drivers/pinctrl/Makefile
+++ b/drivers/pinctrl/Makefile
@@ -23,6 +23,7 @@ obj-$(CONFIG_PINCTRL_AW9523)	+= pinctrl-aw9523.o
 obj-$(CONFIG_PINCTRL_AXP209)	+= pinctrl-axp209.o
 obj-$(CONFIG_PINCTRL_BM1880)	+= pinctrl-bm1880.o
 obj-$(CONFIG_PINCTRL_CY8C95X0)	+= pinctrl-cy8c95x0.o
+obj-$(CONFIG_PINCTRL_CS7542)	+= pinctrl-cs7542.o
 obj-$(CONFIG_PINCTRL_DA850_PUPD) += pinctrl-da850-pupd.o
 obj-$(CONFIG_PINCTRL_DA9062)	+= pinctrl-da9062.o
 obj-$(CONFIG_PINCTRL_DIGICOLOR)	+= pinctrl-digicolor.o
diff --git a/drivers/pinctrl/pinctrl-cs7542.c b/drivers/pinctrl/pinctrl-cs7542.c
new file mode 100644
index 000000000..748682675
--- /dev/null
+++ b/drivers/pinctrl/pinctrl-cs7542.c
@@ -0,0 +1,195 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/* Cortina Systems CS7542 GPIO/peripheral pin multiplexer */
+
+#include <linux/bits.h>
+#include <linux/err.h>
+#include <linux/mfd/syscon.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/slab.h>
+
+#include <linux/pinctrl/pinconf-generic.h>
+#include <linux/pinctrl/pinctrl.h>
+#include <linux/pinctrl/pinmux.h>
+
+#include "pinctrl-utils.h"
+
+#define CS7542_GPIO_MUX		0x1c
+#define CS7542_NUM_PINS		160
+#define CS7542_UART_FIRST	72
+#define CS7542_UART_LAST	77
+
+enum cs7542_function {
+	CS7542_FUNCTION_GPIO,
+	CS7542_FUNCTION_UART,
+};
+
+struct cs7542_pinctrl {
+	struct regmap *map;
+	struct pinctrl_desc desc;
+	struct pinctrl_pin_desc pins[CS7542_NUM_PINS];
+	const char *groups[CS7542_NUM_PINS];
+};
+
+static const char * const cs7542_functions[] = { "gpio", "uart" };
+static const char * const cs7542_uart_groups[] = {
+	"gpio72", "gpio73", "gpio74", "gpio75", "gpio76", "gpio77",
+};
+
+static int cs7542_get_groups_count(struct pinctrl_dev *pctldev)
+{
+	return CS7542_NUM_PINS;
+}
+
+static const char *cs7542_get_group_name(struct pinctrl_dev *pctldev,
+					 unsigned int group)
+{
+	struct cs7542_pinctrl *pctl = pinctrl_dev_get_drvdata(pctldev);
+
+	return pctl->groups[group];
+}
+
+static int cs7542_get_group_pins(struct pinctrl_dev *pctldev,
+				 unsigned int group, const unsigned int **pins,
+				 unsigned int *num_pins)
+{
+	struct cs7542_pinctrl *pctl = pinctrl_dev_get_drvdata(pctldev);
+
+	*pins = &pctl->pins[group].number;
+	*num_pins = 1;
+	return 0;
+}
+
+static const struct pinctrl_ops cs7542_pinctrl_ops = {
+	.get_groups_count = cs7542_get_groups_count,
+	.get_group_name = cs7542_get_group_name,
+	.get_group_pins = cs7542_get_group_pins,
+	.dt_node_to_map = pinconf_generic_dt_node_to_map_pin,
+	.dt_free_map = pinctrl_utils_free_map,
+};
+
+static int cs7542_get_functions_count(struct pinctrl_dev *pctldev)
+{
+	return ARRAY_SIZE(cs7542_functions);
+}
+
+static const char *cs7542_get_function_name(struct pinctrl_dev *pctldev,
+					    unsigned int function)
+{
+	return cs7542_functions[function];
+}
+
+static int cs7542_get_function_groups(struct pinctrl_dev *pctldev,
+				      unsigned int function,
+				      const char * const **groups,
+				      unsigned int *num_groups)
+{
+	struct cs7542_pinctrl *pctl = pinctrl_dev_get_drvdata(pctldev);
+
+	if (function == CS7542_FUNCTION_GPIO) {
+		*groups = pctl->groups;
+		*num_groups = CS7542_NUM_PINS;
+	} else {
+		*groups = cs7542_uart_groups;
+		*num_groups = ARRAY_SIZE(cs7542_uart_groups);
+	}
+	return 0;
+}
+
+static int cs7542_set_mux(struct pinctrl_dev *pctldev, unsigned int function,
+			  unsigned int group)
+{
+	struct cs7542_pinctrl *pctl = pinctrl_dev_get_drvdata(pctldev);
+	unsigned int mask;
+
+	if (group >= CS7542_NUM_PINS || function >= ARRAY_SIZE(cs7542_functions))
+		return -EINVAL;
+	if (function == CS7542_FUNCTION_UART &&
+	    (group < CS7542_UART_FIRST || group > CS7542_UART_LAST))
+		return -EINVAL;
+
+	mask = BIT(group % 32);
+	return regmap_update_bits(pctl->map, CS7542_GPIO_MUX + (group / 32) * 4,
+				  mask, function == CS7542_FUNCTION_GPIO ? mask : 0);
+}
+
+static int cs7542_gpio_request_enable(struct pinctrl_dev *pctldev,
+				      struct pinctrl_gpio_range *range,
+				      unsigned int pin)
+{
+	return cs7542_set_mux(pctldev, CS7542_FUNCTION_GPIO, pin);
+}
+
+static bool cs7542_function_is_gpio(struct pinctrl_dev *pctldev,
+				    unsigned int selector)
+{
+	return selector == CS7542_FUNCTION_GPIO;
+}
+
+static const struct pinmux_ops cs7542_pinmux_ops = {
+	.get_functions_count = cs7542_get_functions_count,
+	.get_function_name = cs7542_get_function_name,
+	.get_function_groups = cs7542_get_function_groups,
+	.function_is_gpio = cs7542_function_is_gpio,
+	.set_mux = cs7542_set_mux,
+	.gpio_request_enable = cs7542_gpio_request_enable,
+	.strict = true,
+};
+
+static int cs7542_pinctrl_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct cs7542_pinctrl *pctl;
+	struct pinctrl_dev *pctldev;
+	unsigned int i;
+	int ret;
+
+	pctl = devm_kzalloc(dev, sizeof(*pctl), GFP_KERNEL);
+	if (!pctl)
+		return -ENOMEM;
+
+	pctl->map = syscon_node_to_regmap(dev->of_node->parent);
+	if (IS_ERR(pctl->map))
+		return dev_err_probe(dev, PTR_ERR(pctl->map), "cannot get global regmap\n");
+
+	for (i = 0; i < CS7542_NUM_PINS; i++) {
+		pctl->groups[i] = devm_kasprintf(dev, GFP_KERNEL, "gpio%u", i);
+		if (!pctl->groups[i])
+			return -ENOMEM;
+		pctl->pins[i].number = i;
+		pctl->pins[i].name = pctl->groups[i];
+	}
+
+	pctl->desc.name = dev_name(dev);
+	pctl->desc.owner = THIS_MODULE;
+	pctl->desc.pins = pctl->pins;
+	pctl->desc.npins = CS7542_NUM_PINS;
+	pctl->desc.pctlops = &cs7542_pinctrl_ops;
+	pctl->desc.pmxops = &cs7542_pinmux_ops;
+
+	ret = devm_pinctrl_register_and_init(dev, &pctl->desc, pctl, &pctldev);
+	if (ret)
+		return dev_err_probe(dev, ret, "cannot register pin controller\n");
+
+	return pinctrl_enable(pctldev);
+}
+
+static const struct of_device_id cs7542_pinctrl_match[] = {
+	{ .compatible = "cortina,cs7542-pinctrl" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, cs7542_pinctrl_match);
+
+static struct platform_driver cs7542_pinctrl_driver = {
+	.probe = cs7542_pinctrl_probe,
+	.driver = {
+		.name = "cs7542-pinctrl",
+		.of_match_table = cs7542_pinctrl_match,
+	},
+};
+module_platform_driver(cs7542_pinctrl_driver);
+
+MODULE_DESCRIPTION("Cortina Systems CS7542 pin multiplexer");
+MODULE_LICENSE("GPL");

-- 
2.53.0


