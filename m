Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795602863;
	b=VABmvHb+QQlpkN1YNGbhc3cifXmcYcJouLsI1FBtTXG7RgqtKTAzsQVO7wCyyc44Ei1s
	 3x4TyMVp5rhxlsEift5I9LekgCQ90+h5imWXsRS4WYJ7fN/3nb146KI8s7SWXNsRUHkyo
	 EOOfsO7T+8T8WvqE6k2JCg2Z9mJKVSUs6qRQ+TZBN8aWhtNeYuKYj8Fp0+Ij9w/NjHXik
	 blLcogATNmUPvNYM2tpUTXOLgKOu3WPkiNQkC41OJ8Npx6iLpXC+FrIshXqlGHZakL5D1
	 dE249FYCFLfRvH2RJT0xVF2v8QVpZgPtIcnoKjYYD//RLaRJr8f2PLSbZ6WJxoJYY9Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795602863;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=MuvDDx18MLYvMKu0Vn+Huu+35+C3CUze9aGXgdhtbyE=;
	b=NiIMlbBEhhIfjf7xAcUBgyBWH1/VdQdJHYuvotRXI41hm/jtsan1F8muNd6TFqWY6sDB
	 SzlTIxOoHXGWBDkRZQQfVTpiyaDROhAL4IbiMrqt/pHOAccSx7TJ664Niw4tmURxzriua
	 VJeZLzfXNnIk+XD3AE/3RUb5Yqo3pTxEHnsYmwVODjn72vBkB7tE7DaN7U0KwshxaRGRA
	 3VSvSBW6NcE1SGz60kS4imReo6T99oqIYwLGlqjTY+zVLW1SRKAwOdUscS2tV7CI/v4vI
	 fVnsLZCZegrNvS9YyNLH5T1R/esdEDUG5vjpqlBXL+Ejukis9zpVu5Sgr5HGKOk6xog==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MHxRhrsD;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8039F606A327;
	Wed, 25 Nov 2026 10:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MHxRhrsD
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795602863;
	b=ZdcEy7V7q3ZA/nn3ziQ9PuNW/AVlvF9sC8rAyYDFKxej40iWegwgFf+GENrdF0td7/Du
	 K017WqZuCU35wQ3rSBCLKkgH7wV1gs5RWYGOqEaCgw/B1HAQdbHnpwiA91dNLtu/ZDqRF
	 TlVksdzjlBmCOQfimsc34AhNBWP4aAkKXyjU0YHLbKTF3+fwwEqHXkSpOMzbjgouHrAC0
	 WJruTPPzu7vJl0ZALhAPUvX9QLrCPtT8/yPqrZRrLJsca9hyQE02ppRTztZ8dj3yN5/AP
	 I9iXp9FI8D6faj+3wZHTFw0GPh1NG3dUwLzhAw2tL9A4NJmW8woUva2kxikfNEjKEyg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795602863;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=MuvDDx18MLYvMKu0Vn+Huu+35+C3CUze9aGXgdhtbyE=;
	b=2sZVMqj+Z2jv5iB6h4RnsC23Kq1N/zaGs3zNd06/9fWt2pZ7gQXPNGgGeX94ah0qEgmb
	 RmG3YddFkmrrgnTCDJW1bNxOmSJCty2rYIpC5L/kB/OHJ/+qBQp+EEWHWSa5oukFA3pek
	 IoZ7gtFwj+PhKBdtWEYqtiakn9CS4o8YRWnezgYE6MFB8CYt6R1SmjHrCSat9kGBcg4/p
	 WRD4i+NeDFC6T8lojTkLPauoEq4gZ0SjBvNVyI+AnTW3g92KC0JVMM6Hh4V3KLSCpjVMX
	 dDP4hBlHnP3wEQDtkYf8f+ZKljV4C0xKCavkBNFdLDQkQYA41IHCWYnFs5Y2iGD6OvQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 668B71F000C6;
	Wed, 25 Nov 2026 10:34:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795602863;
	bh=MuvDDx18MLYvMKu0Vn+Huu+35+C3CUze9aGXgdhtbyE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=MHxRhrsDCsdJzVJrekClJRZUPmSpyDC4aDeOuGt4nTt77z3dyX0pAGR4CY/eToYdv
	 qa3X6ZehEBm1c58FVhPvlRazmdRqi6aEWWCsG0BhVBXYrbu9EfQbSt5FB7Ua5/RvI3
	 mRUDPrBGMdeypisZLXRJnWeJOTOclnCw5KlXtAjOwNr4oB2Y576i00P1SU6bsnXj35
	 +A0xfZXPn+yO4z4GyFFtCgoZOGOKFoIfPAAovzLO/AVrR1uzVfev2UHbMwEIvg8YzE
	 xHpvZkBb3JqwqeOhgd7wEj/60gs8atYCpXII5Xpw80SYlxIk1H8m1M9CFcl8vsvCY/
	 5vBv7ZsB2KWMA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id E4D354CE54;
	Wed, 25 Nov 2026 10:34:09 +0000 (UTC)
From: Fil Dunsky via B4 Relay <devnull+filipp.dunsky.gmail.com@kernel.org>
Date: Wed, 25 Nov 2026 13:34:11 +0300
Subject: [PATCH v4 3/6] clk: Add Cortina Systems CS7542 clocks
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
Message-Id: <20261125-cs7542-syscon-v4-3-3337bb0d3b48@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795602848; l=6558;
 i=filipp.dunsky@gmail.com; s=20260930; h=from:subject:message-id;
 bh=lQjP3SZpYTRXU9UUI9S1FQzmKPgD3JVPx3ccHKEkVpU=;
 b=LAO2aDpZf9VdNIvVL/LySb9KXegsWcQeKYEZg1WSP6twkKndFR3WslUkCrAv2X6rDa0MoFxAN
 lyDonkjC2kjD4Lfv5T6oGWF9xiOSOgaL21AyqE9ntDF9c46shG6hcbq
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
index 000000000..5aa83dc71
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
+	return regmap_test_bits(gate->map, GLOBAL_CONFIG, gate->mask);
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


