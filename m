Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795602865;
	b=TORmnEsme0LDMTpYxv7vufH98ARAeyUoWxHBA58h8yPCbgn5tFbieNLjszxlZSoOjFJo
	 YX3Yq9GTZ+Ye5J4Rhmqv6hal3YmM2AxuNlfnDVCqogs9Eu2u0PjKwu7evh/U6uwYSjHov
	 LhXdi8sC55WtKlM5mT623HZ/pfqH21yRBJkf8qP7PpOmoa39ZARmNVpE6M5yGRqLmnbZh
	 47K/ze+7uD3JdAbiT3k/FnO1DtfA7LTRNyGLFCzk8Ui3PA1cFu797pOFy3B6bKjSZ0Hui
	 WgTwiWKQN8TEI4UE5AnMZzqkYmc1hndKbKpqOlEElRME0bYPR4soDqJfJtGarqXtwfw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795602865;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=oCvYdqFnGBpwdhljQzammkoM2NAqgJQKHy3YaAbmt2w=;
	b=VjQzecL6mZTGz+T1XsX87WKfsZ7BcHdVDU/377Z9zS179ydSosVPdRO8L3o66NYO4tqn
	 QXsWI6qKauREoYjY0Up6QmGyTQtDGWn/OIWE2YVyJoiZ0DB05+okbW0hujlq/hcMP9V61
	 Sjjvrg0HA1lhexrqiZymn3shSftg2y5Z4gsPFjzRFP7hjzAvDNx145zcM5GX4BFuv8emz
	 xkQo6bTiu8+JR3Xpsm3tqd6FwSyo39U6QG8I/nAw9LFI0TsB/l75PxA3fdTQxSxs/5kjl
	 84YO7lIRGmsSBw4uzNHbggHBn46pRuAKSzFQEzM1KS3YgGCEll5AVs7QYvnG2J7ptQw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=meBcI4CM;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 709A060A3807;
	Wed, 25 Nov 2026 10:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=meBcI4CM
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795602865;
	b=SURr9m9waFqejrBVnSNRCzAHgdIjOKkaWBuJSX0i9MiSisO0DZ59FEq3wkTsk9zhkt9g
	 Bec07o5Ocq/Mt0ntbZRGL06h0oJ5CWp8CvcUStr0NEYo8vNC3bzBqelihyh2i14ZX1N8U
	 9tbWIGU5Ohkm0dttAzvwTKuPGrdQ7WGFf2CcnQD4xsaEX+ycxbjgPFerTMKk28knMimzS
	 1VK9D0TYbwVn7zGiVWNkMMqKfdnHL1/PLq5QvRvy372cW38Ahkg7HmCnklPqjCMhd+3C0
	 Sasx0aJKK63xy+YrOwf2fxMXVMWTlj/WgpapDDoa5JmXjeDtXEwsjvrF1RYwczt8ovw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795602865;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=oCvYdqFnGBpwdhljQzammkoM2NAqgJQKHy3YaAbmt2w=;
	b=NoIsPObIe+xKMj6cLkhgV2l8VQiOjFiVqxMKRHhmUux252WB3kGAhKSqyEtEUWnntQE7
	 6sviJspvf4uxTvrKLjZ/Ly72Q8X9dIX/JVv7nW+bOWCiOwXgBkm/ImlAKWVBubkY5QWoL
	 lha7GtG5q7PBQbA//q+n0YJLqg+RiD8TaAPOXsyk9k0OEc+7lVxiz7VBPWiURKONl1FAc
	 Hzftol18b0Jvy5Q5iaIDMoUyB+6iAMVb2+C21boO+xoazt3hVsKCMs43HqBRd3TzXpQ9c
	 uc0FhSPJIAARwuHI3sw16JDn6D3xV97fN3LlaeFx5vvseArYW2tsUaQjxPyP10cxosA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 83BC21F000CF;
	Wed, 25 Nov 2026 10:34:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795602865;
	bh=oCvYdqFnGBpwdhljQzammkoM2NAqgJQKHy3YaAbmt2w=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=meBcI4CMnhsjd1ihgRzGYr3GfQfr9yp0y2vVJ/pCoGscFGjg+QYwhxha3qxy08DUm
	 ZcvR1Mrvw3mTbnVHYlB92oyfIwoqLYm3apLb6xn3eVujHaVn8Cyvlk9SLrq5gLr5kO
	 HURdvV9nn+hVdefYk5/FNejD1pDB6SF1AnQHtD83OY/fWb10ok3rwxG1cUmES8k6cW
	 kIZwURjQhFEditjplOLyav02OElV+Q4EzbLizq5koMQgeVmF6Yang8hr61qm7YCuJ+
	 I3Dbb8pOt0jrdrjEp4Uf9qe2YIPqHx1kwGnmKii9/vradD9S5nd0rjE7fj5BZCmkY6
	 26miX1EiCc3jg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 0E1874CE58;
	Wed, 25 Nov 2026 10:34:10 +0000 (UTC)
From: Fil Dunsky via B4 Relay <devnull+filipp.dunsky.gmail.com@kernel.org>
Date: Wed, 25 Nov 2026 13:34:12 +0300
Subject: [PATCH v4 4/6] reset: Add Cortina Systems CS7542 global reset
 controller
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
Message-Id: <20261125-cs7542-syscon-v4-4-3337bb0d3b48@gmail.com>
References: <20261125-cs7542-syscon-v4-0-3337bb0d3b48@gmail.com>
In-Reply-To: <20261125-cs7542-syscon-v4-0-3337bb0d3b48@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-gpio@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795602848; l=6210;
 i=filipp.dunsky@gmail.com; s=20260930; h=from:subject:message-id;
 bh=Ass96zx9V9S2GY99MTNCkP+grHT3PLmWF2LFuWIH+Es=;
 b=+1V3RPXUKjnsNN3rhNATqJQsKGzESizsJ7nZ95Z6VQHscPGaXUq5c5Y/1u20KLRvQM52Qq1Xj
 9SGTPyrVHT7AQrHletHGtKbGHAdmeOHq9dOsLiqh5V0og/Yfg63d07i
X-Developer-Key: i=filipp.dunsky@gmail.com; a=ed25519;
 pk=JAYP8e2rJ54DHOmhNtXud8rl1igAaAXoOHxtJmVXI1g=
X-Endpoint-Received: by B4 Relay for filipp.dunsky@gmail.com/20260930 with
 auth_id=1085
X-Original-From: Fil Dunsky <filipp.dunsky@gmail.com>
Reply-To: filipp.dunsky@gmail.com
Content-Transfer-Encoding: 7bit

From: Fil Dunsky <filipp.dunsky@gmail.com>

Use the shared syscon regmap to control three PCIe and seven network
engine reset signals. PCIe consumers supply their own assert and
recovery timing. Verify level transitions of the network resets before
the consumer releases DMA buffers. Reject the unassigned group ID to
preserve exclusive ownership of the underlying lines.

The clock provider registers early for timers. Match the platform
device for the same syscon when reset consumers can probe.

Signed-off-by: Fil Dunsky <filipp.dunsky@gmail.com>
---
 drivers/reset/Kconfig        |  10 ++++
 drivers/reset/Makefile       |   1 +
 drivers/reset/reset-cs7542.c | 134 +++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 145 insertions(+)

diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
index eda9c698a..544cb79fa 100644
--- a/drivers/reset/Kconfig
+++ b/drivers/reset/Kconfig
@@ -73,6 +73,16 @@ config RESET_BRCMSTB_RESCAL
 	  This enables the RESCAL reset controller for SATA, PCIe0, or PCIe1 on
 	  BCM7216 or the BCM2712.
 
+config RESET_CS7542
+	tristate "Cortina Systems CS7542 reset controller"
+	depends on OF && HAS_IOMEM
+	select MFD_SYSCON
+	help
+	  Control the individual PCIe and network engine reset signals in
+	  the CS7542 global register block.
+	  The PCIe controllers have independent level resets. The network
+	  engine uses seven reset lines, including the shared DMA block.
+
 config RESET_DR1V90
 	tristate "Anlogic DR1V90 reset controller"
 	depends on ARCH_ANLOGIC || COMPILE_TEST
diff --git a/drivers/reset/Makefile b/drivers/reset/Makefile
index 489fafd6b..df183fc0a 100644
--- a/drivers/reset/Makefile
+++ b/drivers/reset/Makefile
@@ -14,6 +14,7 @@ obj-$(CONFIG_RESET_BCM6345) += reset-bcm6345.o
 obj-$(CONFIG_RESET_BERLIN) += reset-berlin.o
 obj-$(CONFIG_RESET_BRCMSTB) += reset-brcmstb.o
 obj-$(CONFIG_RESET_BRCMSTB_RESCAL) += reset-brcmstb-rescal.o
+obj-$(CONFIG_RESET_CS7542) += reset-cs7542.o
 obj-$(CONFIG_RESET_DR1V90) += reset-dr1v90.o
 obj-$(CONFIG_RESET_EIC7700) += reset-eic7700.o
 obj-$(CONFIG_RESET_EIC7700_HSP) += reset-eic7700-hsp.o
diff --git a/drivers/reset/reset-cs7542.c b/drivers/reset/reset-cs7542.c
new file mode 100644
index 000000000..b86c82554
--- /dev/null
+++ b/drivers/reset/reset-cs7542.c
@@ -0,0 +1,134 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/* Cortina Systems CS7542 global reset controller */
+
+#include <linux/bits.h>
+#include <linux/mfd/syscon.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/reset-controller.h>
+#include <linux/slab.h>
+
+#include <dt-bindings/reset/cortina,cs7542-reset.h>
+
+#define CS7542_GLOBAL_RESET	0x04
+
+static const u32 cs7542_reset_masks[] = {
+	[CS7542_RESET_PCIE0] = BIT(6),
+	[CS7542_RESET_PCIE1] = BIT(7),
+	[CS7542_RESET_PCIE2] = BIT(8),
+	[CS7542_RESET_NI] = BIT(0),
+	[CS7542_RESET_FE] = BIT(1),
+	[CS7542_RESET_TM] = BIT(2),
+	[CS7542_RESET_SCH] = BIT(3),
+	[CS7542_RESET_QM] = BIT(5),
+	[CS7542_RESET_DMA] = BIT(16),
+	[CS7542_RESET_NI_XRAM] = BIT(17),
+};
+
+struct cs7542_reset {
+	struct reset_controller_dev rcdev;
+	struct regmap *map;
+};
+
+static int cs7542_reset_update(struct reset_controller_dev *rcdev,
+			       unsigned long id, bool assert)
+{
+	struct cs7542_reset *rst = container_of(rcdev, struct cs7542_reset, rcdev);
+	u32 mask = cs7542_reset_masks[id];
+	u32 target = assert ? mask : 0;
+	unsigned int value;
+	int ret;
+
+	ret = regmap_update_bits(rst->map, CS7542_GLOBAL_RESET, mask, target);
+	if (ret || id < CS7542_RESET_NI)
+		return ret;
+
+	return regmap_read_poll_timeout(rst->map, CS7542_GLOBAL_RESET, value,
+					(value & mask) == target, 1, 1000);
+}
+
+static int cs7542_reset_assert(struct reset_controller_dev *rcdev,
+			       unsigned long id)
+{
+	return cs7542_reset_update(rcdev, id, true);
+}
+
+static int cs7542_reset_deassert(struct reset_controller_dev *rcdev,
+				 unsigned long id)
+{
+	return cs7542_reset_update(rcdev, id, false);
+}
+
+static int cs7542_reset_status(struct reset_controller_dev *rcdev,
+			       unsigned long id)
+{
+	struct cs7542_reset *rst = container_of(rcdev, struct cs7542_reset, rcdev);
+
+	return regmap_test_bits(rst->map, CS7542_GLOBAL_RESET, cs7542_reset_masks[id]);
+}
+
+static int cs7542_reset_xlate(struct reset_controller_dev *rcdev,
+			      const struct of_phandle_args *spec)
+{
+	unsigned int id = spec->args[0];
+
+	if (id >= rcdev->nr_resets || !cs7542_reset_masks[id])
+		return -EINVAL;
+
+	return id;
+}
+
+static const struct reset_control_ops cs7542_reset_ops = {
+	.assert = cs7542_reset_assert,
+	.deassert = cs7542_reset_deassert,
+	.status = cs7542_reset_status,
+};
+
+static int cs7542_reset_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct cs7542_reset *rst;
+
+	/* Clock-only descriptions also use this syscon. */
+	if (!of_property_present(dev->of_node, "#reset-cells"))
+		return 0;
+
+	rst = devm_kzalloc(dev, sizeof(*rst), GFP_KERNEL);
+	if (!rst)
+		return -ENOMEM;
+
+	rst->map = syscon_node_to_regmap(dev->of_node);
+	if (IS_ERR(rst->map))
+		return dev_err_probe(dev, PTR_ERR(rst->map), "cannot get global regmap\n");
+
+	rst->rcdev.owner = THIS_MODULE;
+	rst->rcdev.dev = dev;
+	rst->rcdev.of_node = dev->of_node;
+	rst->rcdev.ops = &cs7542_reset_ops;
+	rst->rcdev.nr_resets = ARRAY_SIZE(cs7542_reset_masks);
+	rst->rcdev.of_reset_n_cells = 1;
+	rst->rcdev.of_xlate = cs7542_reset_xlate;
+
+	return devm_reset_controller_register(dev, &rst->rcdev);
+}
+
+static const struct of_device_id cs7542_reset_of_match[] = {
+	{ .compatible = "cortina,cs7542-syscon" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, cs7542_reset_of_match);
+
+static struct platform_driver cs7542_reset_driver = {
+	.probe = cs7542_reset_probe,
+	.driver = {
+		.name = "cs7542-reset",
+		.of_match_table = cs7542_reset_of_match,
+		.suppress_bind_attrs = true,
+	},
+};
+module_platform_driver(cs7542_reset_driver);
+
+MODULE_DESCRIPTION("Cortina Systems CS7542 global reset controller");
+MODULE_LICENSE("GPL");

-- 
2.53.0


