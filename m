Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795467296;
	b=N52o7OD3kluROdNR23OrrITl/Y+a8RiaRKyo4FYOymTQVJnomEZ+dM4zIiIQ3tIBnK2k
	 yCs7VuFbFRuJtD68/jsYUd1ak7f2bH7wyMfpgGBtoXE4wND/PjVU02aEzj1iFcMV5dWoj
	 c04P+/PsNL3bF6kwuWRPy2Ptaq2nHrLEnF4NQNHIBxxjE85SSwKwJW//n7zl+Kp5DeoQj
	 RHcV76s0uxdOj5wS8/VaDCYCcFFa0InY5hZTrNuCRrjrroKauRfHZdJhFml/N6YIT6/gW
	 lzsRyTYYI6OGkzYlTNpfbA0mv6iZ3Mao6VPoAE+JoPYR0DRZ6vAh6idpc6uuZqYarww==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795467296;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=O14BbX1wLIKYJhhhZsc1QX5KnrTbKI8v08Tn9x+QgPI=;
	b=rnxYEgPdNbo3gv3o3X5iJAXJk/Ah/f/QTpuuIQyu0rC35cjQgZ1K4ZOyDJthUyXeSdXf
	 GDcv3RfP6SSCSwnHvOCjDn2JBMQ1OSsY6YybzY35np5fULkv2OkkQSo6fF7W29Pjv4Xg7
	 gl0roVbvreoX0rX5H7cIwrH+wj1OcRKIRiLKdjhrKYIdQWvoxhmRYnnOOG4ebWgPj2omi
	 HPQRgYXK/SC/Gx0y/ZFYqujTc92uA5RGr+iST7DRWRzxWYWplpR8BYusxOpoOcPoGNHCF
	 icCKAdHE55Waqyv+oo39to30r7NrfIy12MlqBo3cVK5pLasKVa8DS2JPKOORwRSzPmA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=USLZqMPm;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BA0B606A32E;
	Mon, 23 Nov 2026 20:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=USLZqMPm
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795467296;
	b=e3J1xNbfjkm/98W8rs6wDE0xTJiUcc8EoIelIF1mvbnbk165sDSjCIh+tFU4QdYoBCJy
	 UMrhT/tVJ7MfY08LeouqEHcxbRD+4cGN2wlVVGTelYK9UU0ww42Y1/uli7eA06TTzTOQo
	 N86KqDdnPR2wlYIW0tR84dHq4qRsexIQcCgc2DLDPwAvVrcrzcTVw+e3NWTAfra1t2VC7
	 6ZepQh/gnM/8aTCk5g5UpXYhpdPh0kt48ReoLIJ+rJNUFi4YxOnWm+O1hdgEhnEWlwBpA
	 NMLHC/YfljUOTq4594uOWoQJ9OK0VmOLgK3l87lcy0sHoi23upfNdEhQ8JV5UwNAgMg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795467296;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=O14BbX1wLIKYJhhhZsc1QX5KnrTbKI8v08Tn9x+QgPI=;
	b=kghqJ9NQBKU8uFLVrc4pieWl2lXs8MBCJsc1HqFA2JNwxcwAlYuZ0msz6ZH8B/DvXJbn
	 h2kK+JfI0egDum7o+NJGo6XRQQ7CNvPNjAbNUyxcChgtZDMHa7bQAIJmKHPE1BE0OLOLs
	 cKg2u6Iae+aXajyT6+1LRsT5pj17FE8wsMq6dFShNJpkYBwD4dF63CVkR5UqwppzM5SkZ
	 W77XhBISD2+5ivMosADMX3qULFgZyBNco+oYKH60x2OPPTTjsnqkqJvgTBa7VEExYsbTu
	 frfVT3ZsrwtZSpk6fnQ5TErmt3mS21E+QEErCHV7ONBdejFU13cq8h6XcZhcX5cY2Dg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id BD1001F000C6;
	Mon, 23 Nov 2026 20:54:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795467296;
	bh=O14BbX1wLIKYJhhhZsc1QX5KnrTbKI8v08Tn9x+QgPI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=USLZqMPm+JPxXT4tlSNfrZG4JNRlvqU+87qzq+i27zzOZNaDA16f+1k0upXFW7H/e
	 IAcGYWf/Rx/hOfGmKSELiJ0BzCZmQ7VAagLlbdTh9tpRhH+OBurRKHgqYPjm/KXpLc
	 mU0pC3fZnaF2yszq79b/UI5/t3SvSTofM65etvtMi+Tv/g+0VE7R7m49yKdBDk7z33
	 VgSyHgNtiE4JWKakMY/eSKTgIF/EuaQujhlyDrijejEIizOEL26aB/aAe0JGvoWR/2
	 mhsfdrN4VpD9ipNVUaYAlsVOFi+cxgIhfCFvXmBX51VIaCYuDMbJ/MuPSuJVfMxnVr
	 x7nZ0mYSkmGSw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 4EF9F4C746;
	Mon, 23 Nov 2026 20:54:46 +0000 (UTC)
From: Fil Dunsky via B4 Relay <devnull+filipp.dunsky.gmail.com@kernel.org>
Date: Mon, 23 Nov 2026 23:54:46 +0300
Subject: [PATCH v3 3/5] clk: Add Cortina Systems CS7542 strap-selected
 clocks
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
Message-Id: <20261123-cs7542-syscon-v3-3-f1c07a1703f8@gmail.com>
References: <20261123-cs7542-syscon-v3-0-f1c07a1703f8@gmail.com>
In-Reply-To: <20261123-cs7542-syscon-v3-0-f1c07a1703f8@gmail.com>
To: Linus Walleij <linusw@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-gpio@vger.kernel.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795467283; l=5002;
 i=filipp.dunsky@gmail.com; s=20260930; h=from:subject:message-id;
 bh=JEa90SGQ0FgER4S1FcL2NkC7oSwXVNfRbOUFnfhpGuk=;
 b=q7vPc27CatrgQ7mXqRoO5H9jy6aRr2rDPV3CLenuqNbFUVq2uFIpwpdQcs3jel7pyeWKNoPqQ
 oKZW8JbE55QBvU5eSB0FU08J+uIk6xqmSO/pjh9X9ISETbiIR18g8Og
X-Developer-Key: i=filipp.dunsky@gmail.com; a=ed25519;
 pk=JAYP8e2rJ54DHOmhNtXud8rl1igAaAXoOHxtJmVXI1g=
X-Endpoint-Received: by B4 Relay for filipp.dunsky@gmail.com/20260930 with
 auth_id=1085
X-Original-From: Fil Dunsky <filipp.dunsky@gmail.com>
Reply-To: filipp.dunsky@gmail.com
Content-Transfer-Encoding: 7bit

From: Fil Dunsky <filipp.dunsky@gmail.com>

Register APB, CPU and AXI fixed-rate outputs from GLOBAL_STRAP[3:1],
using the seven configurations recorded in the vendor kernel. Reject
the reserved encoding instead of publishing a guessed frequency.

Register before timer initialization and leave the syscon platform node
available for its pinctrl child. Use the shared regmap, only read strap
status, and unwind all registered clocks if provider setup fails. This
is intentionally not a DVFS or programmable PLL driver.

AI assistance: Codex prepared this change from the existing OpenWrt port
and GPL vendor sources.

Signed-off-by: Fil Dunsky <filipp.dunsky@gmail.com>
---
 drivers/clk/Kconfig      |  9 +++++
 drivers/clk/Makefile     |  1 +
 drivers/clk/clk-cs7542.c | 90 ++++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 100 insertions(+)

diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
index 37a8e35d4..47b5265fe 100644
--- a/drivers/clk/Kconfig
+++ b/drivers/clk/Kconfig
@@ -58,6 +58,15 @@ config LMK04832
 	  Say yes here to build support for Texas Instruments' LMK04832 Ultra
 	  Low-Noise JESD204B Compliant Clock Jitter Cleaner With Dual Loop PLLs
 
+config COMMON_CLK_CS7542
+	bool "Cortina Systems CS7542 strap-selected clocks"
+	depends on OF && HAS_IOMEM
+	select MFD_SYSCON
+	help
+	  Read the boot straps of the CS7542 global control block to provide
+	  its APB, CPU and AXI clocks. This driver does not change PLLs or
+	  dividers. It is built in because the APB clock is needed by timers.
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
index 000000000..4e6c1e98a
--- /dev/null
+++ b/drivers/clk/clk-cs7542.c
@@ -0,0 +1,90 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/* Cortina Systems CS7542 strap-selected clocks */
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
+#define CS7542_NUM_CLKS		3
+
+/* Rates from the GPL vendor kernel's get_platform_clk(). */
+static const unsigned long cs7542_rates[][CS7542_NUM_CLKS] = {
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
+};
+
+static void __init cs7542_clk_init(struct device_node *np)
+{
+	struct clk_hw_onecell_data *data;
+	struct regmap *map;
+	unsigned int strap, speed;
+	int i, ret;
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
+	data = kzalloc_flex(*data, hws, CS7542_NUM_CLKS);
+	if (!data)
+		return;
+	data->num = CS7542_NUM_CLKS;
+
+	for (i = 0; i < CS7542_NUM_CLKS; i++) {
+		data->hws[i] = clk_hw_register_fixed_rate(NULL,
+							  cs7542_clock_names[i], NULL,
+							  0, cs7542_rates[speed][i]);
+		if (IS_ERR(data->hws[i])) {
+			ret = PTR_ERR(data->hws[i]);
+			goto err_unregister;
+		}
+	}
+
+	ret = of_clk_add_hw_provider(np, of_clk_hw_onecell_get, data);
+	if (!ret)
+		return;
+
+err_unregister:
+	while (i--)
+		clk_hw_unregister_fixed_rate(data->hws[i]);
+	kfree(data);
+	pr_err("%pOF: cannot register clocks: %d\n", np, ret);
+}
+
+/* Timers need APB before platform devices, but the pinctrl child must probe. */
+CLK_OF_DECLARE_DRIVER(cs7542_clk, "cortina,cs7542-syscon", cs7542_clk_init);

-- 
2.53.0


