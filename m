Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795812640;
	b=HvFKGsa7Ppux+dzoe+WNXtwmnFPlRsCPGCcUJxi9Fv6jVW2rg43lR1i7JW8zDClUZUCh
	 Rodh89Av9hBrZyl1SGgMd0rtJU3aF4InCDW/vrL1tMNtrBlUtD+f2x4ocvKzKhwJJ4qyD
	 zOkwo/M2BpWXtv3p6AZ2c/flVfLp6U/iDhlhZ1KIl5UBZDDBBU2VMAq1nVOp630zzqzEo
	 YA4IIKl4qRbAbo6UGO+O3sNaPEg5yY400RxpgCuj2Y7c4rwBtB1PuUxH9YcBFIRLHXc1W
	 Y8oe3zUwPgMI/WzIkeqEm2+HYiUMlD6JL1Gogcl7j32QGQr8c33gEaNWGa7Yk8UQVRw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795812640;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=zN+6c4k3IKic25BZ49YS6U2tLrq5jw8qUCqKdxTafyA=;
	b=rjXXgJzcr9UBPaayBKgMUs6VuT+L+kHVSIcYBHopfp17ZX0jAY2BRTrZUM+V9+4pDg7M
	 8XfRNAHys30P6D0HNfC95Fy67Hrvk/EfXRGtpjM3yuHvW9RvSxfQZ46AjaBMUcaTxugqV
	 /9HwfcV7KN9jWaJzri5OE3Uk+G5YM73EHIm2kfW3f6Tp66jCnt9FghaxEYZNHp+JzogLC
	 itVOxTuFCxZr/0sbCZxxkhlS811RT0vcsm+QqwoM9s5pciAq8f8BV5MNVgjvLcKEmWhmh
	 Odqylx1whjxqB9KmjO8ewwOiLYBdZ3hXgmgka0CBxPqg8T1QomdSJijycOWrbedn8DQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GXctJNO2;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B6E9606A327;
	Fri, 27 Nov 2026 20:50:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GXctJNO2
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795812639;
	b=KGy6490ZABlqQAcPltpIpXS7ZIN9u6K4LwQCkaPoDn8VGdnS3yhLtQSyf1Tym+wMUGdF
	 oqjnJ7jF0/XPp9ZNUILWuiuE4SV9xtsP0U/KxokKWshp9qsHM0r0CGrS1vHiMH5AThR14
	 uBUOa6EAsR4CLicGbFhXza/kv7lNFnPhY3P2tMEeBZ1nMVds9OSgNi7HD80PGbH2hN3Vq
	 1tjodvoqH6u6kUqY1/zH4QFderJib58kretwK9Xq2GNzr+8kLa4vhilp+iXBFJopWXc8u
	 FibyefQYkgbyPQ5lAmDUl5Dv0+t3rIaGzqPdjwysNhK5QcmpsuCUpBtQ9WGtDJRiJiQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795812639;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=zN+6c4k3IKic25BZ49YS6U2tLrq5jw8qUCqKdxTafyA=;
	b=sDUW68XWZi9KVJuMDnegTkWJ9U+prCfJBjHwgv/JLSLq8CQOoYHtzgrGNFDPYXt4tzkW
	 dWSScvmKtPMfctVKga3qyUOmiKnwRb4cVTVoyd7Q2kl9f4smCugdL9UCY8nUr2//Qdrtm
	 r5sbJbeHScYfW7f/3Ch5YWRTXY8T41rmO0ROIIcmPi6Ky97Qy9kyxix0SA9JpNa3E7Cez
	 NSggEz7esXxBaFEvtaX23lCYXMRjPxPZKRkejUgx+iCbcvdM8WRbiygRGGUPAVsa1wjJw
	 pdfd8EOfjL1UCVtObj+1CjAZrSaEh2Aywd99z22qJ3GlCkEhoPDKjeKI6dirXWJlrdw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A0CFB1F0089F;
	Fri, 27 Nov 2026 20:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795812639;
	bh=zN+6c4k3IKic25BZ49YS6U2tLrq5jw8qUCqKdxTafyA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=GXctJNO2NNfjAjuFksEcPoCeGvC4aNm56BehVkYiYAOLVNhkumVqV+e8RN/VOwl5K
	 Ulv8LsISRKEFpFtqNr7QWaYviPRjpTVhHmU4814PGD2MKM7F/lY5vfqEPn/qw6deAO
	 YGdI3XiOOsfnYfxKI5K+C1ZsqqH3kHbYbfoEqlTGwsSFSViR/Ys9VLcQ/SO0JAPOys
	 FdDLhzY07rUQbFVN8PPORH/MA8GfwPjc2rLyiTGGydm9l6V3j1o1+gDZfb7trMUYVL
	 5I3DSTOb6Rk1MY3uOASl0a1W3wAKHzeXrhsPHcPJo+LyiJhruwDCLZTRTCKSEv5/eN
	 BzQoyOrfmdM6w==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 9A2844DDE7;
	Fri, 27 Nov 2026 20:50:27 +0000 (UTC)
From: Fil Dunsky via B4 Relay <devnull+filipp.dunsky.gmail.com@kernel.org>
Date: Fri, 27 Nov 2026 23:50:30 +0300
Subject: [PATCH v5 5/6] pinctrl: Add Cortina Systems CS7542 pin multiplexer
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
Message-Id: <20261127-cs7542-syscon-v5-5-d5a373c72b05@gmail.com>
References: <20261127-cs7542-syscon-v5-0-d5a373c72b05@gmail.com>
In-Reply-To: <20261127-cs7542-syscon-v5-0-d5a373c72b05@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-gpio@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795812625; l=8372;
 i=filipp.dunsky@gmail.com; s=20260930; h=from:subject:message-id;
 bh=swKgo2GIeH24alE68CiVQWwTM+uJD9TyCwLGYdF3ylU=;
 b=fSvldvx2EYXm6dp+8dk4BQk43grvFl9FPGv2iE6XMC6H3Kfny7GoQp3f+RUrPWLd0QYjvRx+Y
 UMP2Uwj0eCNCTADUYaAt+9ieGf8lmEQFKa/iElwQ4iDnQ+81iHGZive
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

Reviewed-by: Linus Walleij <linusw@kernel.org>
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


