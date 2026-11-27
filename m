Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795812641;
	b=WjFXN26CG2fN6WaM8oywT5zrobe7kGjRibezJFvl/2iBx/dK2DiZL5da4FXEXzmYUAAr
	 gKbS6Euxy9Y2ItCFq9wZCJGaimctPn/hY0+HfB/EdFnc2v+k8ZxvYcgMmg5E28DvosMuw
	 C8ndto0nwLyjl2UG+iwXGtCPZmrH+MWyIYphlRFFOLez0lTg8w308tJy25AMip1RLfM8Q
	 tMYEbegU8JrVzBq68OTUr/yLM1xzUMmv0lVB+dGXi/ku6DeRnPIQ4oZsoSQWqSmyyrKxY
	 pXHvS+5MzJJIed69KNY2W3TXP+d9u545b7A77kZz0j+WFfwrZ2xLNHTI+LZoM/ob4Gg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795812641;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=9jjys1NwSJjbk8KnYHOCkvlegt17jtVNL7dVvrptlBU=;
	b=XlDexxYCFnT6JVPdfK7uywzXtQA9Gg6UX9vHFeCJIxzfO62+fUHyRX3t3gmE1HtLErE6
	 trqdoYeAF5+Atn5UPrNXySf4by9aZcZrcawEn0CPPacZBqKb2FOhQnGUFa6uPYbrBAF+Q
	 2bmD5vFo7Ji24/GyVyhyaKRO8SSCEG3O6updmMB7knl7PhtEr/7iMFzzny77JNZEUAfJp
	 593RUI7fbYKi+s6nHLHVEzj3KtvMApFlq0+vjidlegDJ0NtI2QjfM362n0o2a9BHfCRgE
	 EEXBd7d2zRuDGx9i73BOKUZWVmwcSynOwNfyczy/NX1499pnZA495uqiayXoqAPrnNA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=egNWZpK2;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BDB2606A68B;
	Fri, 27 Nov 2026 20:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=egNWZpK2
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795812641;
	b=HLtfUXCMUUfyHqK+6xvJncg9iWPZDafjaS6Dw5esZNAgZAMPIlfgrWzY3WHem3B2AXkV
	 EPwi+3K2n8JIGQugUuZJ4Kpd+229/anLEpXqfpIbad4TNSvuouR2DKLBXP3L71LaHscp1
	 pIdod84yqTTupCb4WWw0t1a2zPlf598I/tSND4jJsf9xy+QrUJ3nh1tzGyy7Xg6k1rp/G
	 UAT9PoaIF/bYBxHdxchM5ivRJHv5v9O9dUEDAHVNCiOHLRlJWxlkT/zemu42evje+6hGI
	 T7v5fjjtr3S4ooFoQPVck4fUEphEh1L4czwDpFrPU7meyI+oMgea9LtthfBBcK2QVcw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795812641;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=9jjys1NwSJjbk8KnYHOCkvlegt17jtVNL7dVvrptlBU=;
	b=yvadVRCTDvMbnT/b/i8/8vlaGu678WXq3NBDZap+J5/uSJAvSIgqV9wbTQRi92yvMBZK
	 ZTwo8EmUHEE0/xb3uXYQ1ohran02xfooqDz6+nu1pvoeTwaLjxRWt08YAU3F/L+muHjxU
	 je2jEdJSAWauIv7AZo3vA8+nvAeQhSmPaEkmx8dEeodIP+2abqSvYFQtfvLeovVLd3uxU
	 70phUaCpQZbu76A5sPpM3Pz8AjiPWczxMz+AC7kA/0HvYsBgbGra59tvULc/y3kR1GbOL
	 +CKNGHlR+3jPnMRsYuDObV9yOUHtzeaAMNd+72fRET/I6stN4JnzteSUsljDCH3+MyQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C41E01F00899;
	Fri, 27 Nov 2026 20:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795812641;
	bh=9jjys1NwSJjbk8KnYHOCkvlegt17jtVNL7dVvrptlBU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=egNWZpK2VyWtOo1uHJQLI4l0YMYzUcivT38XAze+sHS6gLetY7vpyk/nLpKnKcExj
	 6ngwSTGxXR8yj/sB0iv2vrojWXFXx1+7r2mU8WlVP/H0wFqzmV3FsFLG9+h+cJhD+2
	 G+tfLzjhFRChsP4uOSo8WGRLkJkDq24W2Hj+VIwLf5FQyb3f2dSro0JNgpRDLSOjST
	 FALW0Ls/C1IqzkoMpLYllH6UcyrdU2FBeGgCk+bVosDi+TkYDQrat7a9sh82uGV/nH
	 eHhEqK7wChuedxcwB5FlFP8EAIbAyp/FYIoQXyb+Bv8HNbSSSI92jJkGB9X2AttnvC
	 P0lKik6Q8TTTg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 51F694DDDF;
	Fri, 27 Nov 2026 20:50:27 +0000 (UTC)
From: Fil Dunsky via B4 Relay <devnull+filipp.dunsky.gmail.com@kernel.org>
Date: Fri, 27 Nov 2026 23:50:28 +0300
Subject: [PATCH v5 3/6] clk: Add Cortina Systems CS7542 clocks
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
Message-Id: <20261127-cs7542-syscon-v5-3-d5a373c72b05@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795812625; l=6562;
 i=filipp.dunsky@gmail.com; s=20260930; h=from:subject:message-id;
 bh=zO7JbACrM9uYJ7gzn3nVwA9o6Uh0BovScf7z3en9G34=;
 b=UlFwtDdf2Y0Q2EFLZPqcbaL48hLVTPQgG8aw1TUUFL/WfpGpVhcTK6jLOWOl1xsWNjb/9dO5e
 390uF/fq7c7DYMYnOdleByWJ3Jmv2zwoUgcQnlThitq07q1zvWxRLHv
X-Developer-Key: i=filipp.dunsky@gmail.com; a=ed25519;
 pk=JAYP8e2rJ54DHOmhNtXud8rl1igAaAXoOHxtJmVXI1g=
X-Endpoint-Received: by B4 Relay for filipp.dunsky@gmail.com/20260930 with
 auth_id=1085
X-Original-From: Fil Dunsky <filipp.dunsky@gmail.com>
Reply-To: filipp.dunsky@gmail.com
Content-Transfer-Encoding: 7bit

From: Fil Dunsky <filipp.dunsky@gmail.com>

Register the APB, CPU and AXI clocks from the boot strap and the three
PCIe gates through one provider on the global syscon. Timers require
the APB rate before platform device registration.

Signed-off-by: Fil Dunsky <filipp.dunsky@gmail.com>
---
 drivers/clk/Kconfig      |   9 +++
 drivers/clk/Makefile     |   1 +
 drivers/clk/clk-cs7542.c | 161 +++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 171 insertions(+)

diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
index 37a8e35d4..acf16b40c 100644
--- a/drivers/clk/Kconfig
+++ b/drivers/clk/Kconfig
@@ -58,6 +58,15 @@ config LMK04832
 	  Say yes here to build support for Texas Instruments' LMK04832 Ultra
 	  Low-Noise JESD204B Compliant Clock Jitter Cleaner With Dual Loop PLLs
 
+config COMMON_CLK_CS7542
+	bool "Cortina Systems CS7542 clocks"
+	depends on OF && HAS_IOMEM
+	select MFD_SYSCON
+	help
+	  Read the boot straps to provide the APB, CPU and AXI clocks.
+	  Also provide the three PCIe clock gates. The APB clock is needed
+	  by the timers before platform devices probe.
+
 config COMMON_CLK_APPLE_NCO
 	tristate "Clock driver for Apple SoC NCOs"
 	depends on ARCH_APPLE || COMPILE_TEST
diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
index 52d138d4f..16b1168c8 100644
--- a/drivers/clk/Makefile
+++ b/drivers/clk/Makefile
@@ -63,6 +63,7 @@ obj-$(CONFIG_ARCH_AXXIA)		+= clk-axm5516.o
 obj-$(CONFIG_COMMON_CLK_BD718XX)	+= clk-bd718x7.o
 obj-$(CONFIG_COMMON_CLK_BM1880)		+= clk-bm1880.o
 obj-$(CONFIG_COMMON_CLK_CDCE706)	+= clk-cdce706.o
+obj-$(CONFIG_COMMON_CLK_CS7542)		+= clk-cs7542.o
 obj-$(CONFIG_COMMON_CLK_CDCE925)	+= clk-cdce925.o
 obj-$(CONFIG_ARCH_CLPS711X)		+= clk-clps711x.o
 obj-$(CONFIG_COMMON_CLK_CS2000_CP)	+= clk-cs2000-cp.o
diff --git a/drivers/clk/clk-cs7542.c b/drivers/clk/clk-cs7542.c
new file mode 100644
index 000000000..643bfaf84
--- /dev/null
+++ b/drivers/clk/clk-cs7542.c
@@ -0,0 +1,161 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/* Cortina Systems CS7542 global clocks. */
+
+#include <linux/bitfield.h>
+#include <linux/clk-provider.h>
+#include <linux/err.h>
+#include <linux/init.h>
+#include <linux/mfd/syscon.h>
+#include <linux/of.h>
+#include <linux/printk.h>
+#include <linux/regmap.h>
+#include <linux/slab.h>
+
+#include <dt-bindings/clock/cortina,cs7542-clock.h>
+
+#define CS7542_GLOBAL_STRAP	0x0c
+#define CS7542_STRAP_SPEED	GENMASK(3, 1)
+#define CS7542_NUM_FIXED_CLKS	3
+#define CS7542_NUM_CLKS		6
+
+/* Rates from the GPL vendor kernel's get_platform_clk(). */
+static const unsigned long cs7542_rates[][CS7542_NUM_FIXED_CLKS] = {
+	/* APB, CPU, AXI */
+	{ 100000000, 400000000, 133333333 },
+	{ 100000000, 600000000, 150000000 },
+	{ 100000000, 700000000, 140000000 },
+	{ 100000000, 800000000, 160000000 },
+	{ 100000000, 900000000, 150000000 },
+	{ 150000000, 750000000, 150000000 },
+	{ 170000000, 850000000, 141666667 },
+};
+
+static const char * const cs7542_clock_names[] = {
+	[CS7542_CLK_APB] = "cs7542-apb",
+	[CS7542_CLK_CPU] = "cs7542-cpu",
+	[CS7542_CLK_AXI] = "cs7542-axi",
+	[CS7542_CLK_PCIE0] = "cs7542-pcie0",
+	[CS7542_CLK_PCIE1] = "cs7542-pcie1",
+	[CS7542_CLK_PCIE2] = "cs7542-pcie2",
+};
+
+#define CS7542_PORTS	3
+#define GLOBAL_CONFIG	0x10
+
+struct cs7542_gate {
+	struct clk_hw hw;
+	struct regmap *map;
+	u32 mask;
+};
+
+struct cs7542_clocks {
+	struct cs7542_gate gates[CS7542_PORTS];
+	struct clk_hw_onecell_data *clks;
+};
+
+static int cs7542_gate_prepare(struct clk_hw *hw)
+{
+	struct cs7542_gate *gate = container_of(hw, struct cs7542_gate, hw);
+
+	return regmap_update_bits(gate->map, GLOBAL_CONFIG, gate->mask, gate->mask);
+}
+
+static void cs7542_gate_unprepare(struct clk_hw *hw)
+{
+	struct cs7542_gate *gate = container_of(hw, struct cs7542_gate, hw);
+
+	regmap_update_bits(gate->map, GLOBAL_CONFIG, gate->mask, 0);
+}
+
+static int cs7542_gate_is_prepared(struct clk_hw *hw)
+{
+	struct cs7542_gate *gate = container_of(hw, struct cs7542_gate, hw);
+
+	return regmap_test_bits(gate->map, GLOBAL_CONFIG, gate->mask) > 0;
+}
+
+static const struct clk_ops cs7542_gate_ops = {
+	.prepare = cs7542_gate_prepare,
+	.unprepare = cs7542_gate_unprepare,
+	.is_prepared = cs7542_gate_is_prepared,
+};
+
+static void __init cs7542_clk_init(struct device_node *np)
+{
+	struct cs7542_clocks *ctl;
+	struct regmap *map;
+	unsigned int strap, speed;
+	int i, j, ret;
+
+	map = syscon_node_to_regmap(np);
+	if (IS_ERR(map)) {
+		pr_err("%pOF: cannot get global regmap: %ld\n", np, PTR_ERR(map));
+		return;
+	}
+
+	ret = regmap_read(map, CS7542_GLOBAL_STRAP, &strap);
+	if (ret) {
+		pr_err("%pOF: cannot read clock strap: %d\n", np, ret);
+		return;
+	}
+
+	speed = FIELD_GET(CS7542_STRAP_SPEED, strap);
+	if (speed >= ARRAY_SIZE(cs7542_rates)) {
+		pr_err("%pOF: unsupported clock strap %u\n", np, speed);
+		return;
+	}
+
+	ctl = kzalloc(sizeof(*ctl), GFP_KERNEL);
+	if (!ctl)
+		return;
+	ctl->clks = kzalloc_flex(*ctl->clks, hws, CS7542_NUM_CLKS);
+	if (!ctl->clks) {
+		kfree(ctl);
+		return;
+	}
+	ctl->clks->num = CS7542_NUM_CLKS;
+
+	for (i = 0; i < CS7542_NUM_FIXED_CLKS; i++) {
+		ctl->clks->hws[i] = clk_hw_register_fixed_rate(NULL,
+							       cs7542_clock_names[i], NULL,
+							       0, cs7542_rates[speed][i]);
+		if (IS_ERR(ctl->clks->hws[i])) {
+			ret = PTR_ERR(ctl->clks->hws[i]);
+			goto err_unregister_fixed;
+		}
+	}
+
+	for (j = 0; j < CS7542_PORTS; j++) {
+		struct cs7542_gate *gate = &ctl->gates[j];
+		struct clk_init_data init = {
+			.name = cs7542_clock_names[CS7542_CLK_PCIE0 + j],
+			.ops = &cs7542_gate_ops,
+		};
+
+		/* Gate-only controls: no source frequency is assumed. */
+		gate->map = map;
+		gate->mask = BIT(10 + 2 * j);
+		gate->hw.init = &init;
+		ret = clk_hw_register(NULL, &gate->hw);
+		if (ret)
+			goto err_unregister_gates;
+		ctl->clks->hws[CS7542_CLK_PCIE0 + j] = &gate->hw;
+	}
+
+	ret = of_clk_add_hw_provider(np, of_clk_hw_onecell_get, ctl->clks);
+	if (!ret)
+		return;
+
+err_unregister_gates:
+	while (j--)
+		clk_hw_unregister(&ctl->gates[j].hw);
+err_unregister_fixed:
+	while (i--)
+		clk_hw_unregister_fixed_rate(ctl->clks->hws[i]);
+	kfree(ctl->clks);
+	kfree(ctl);
+	pr_err("%pOF: cannot register clocks: %d\n", np, ret);
+}
+
+/* Timers need APB before platform devices, but the pinctrl child must probe. */
+CLK_OF_DECLARE_DRIVER(cs7542_clk, "cortina,cs7542-syscon", cs7542_clk_init);

-- 
2.53.0


