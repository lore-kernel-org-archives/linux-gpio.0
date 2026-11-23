Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795465628;
	b=uCy8Pac955AwXu+UujyLSYRKfzsFEDZrZ3rdsQVRdmdENtCOdhzW+xu2S6c56vxWk8O+
	 5WvwviQXqecmu0fueNJYG3VVeX0clXh7f3WfNIeO+sMMx1v+k0I7b5Xzm9xiaSHG0Rdaw
	 9Vr0HXJ7aemY37B5e4yOm/jHyK91sn5g4+Yvyrj2MbO1ejxD9P3YmL3U1gFZa1g4/pTPF
	 PG+7HyxpPVRxIhPnkMRddFP0AABRzityxN7nHJyhYi90jIQvTPKrBZ2tZVDbjbmKHTofn
	 /s+Zs0d/LqVa2FW5ZKqUw7P9d0wQ6zaMIMdteoczSuoOpfs4tfI+V/dU/4m3FHNSreA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795465628;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=O14BbX1wLIKYJhhhZsc1QX5KnrTbKI8v08Tn9x+QgPI=;
	b=V5exbmWVX8iC6ECo2QTThuXVoxt0T+ThH/73BD2nB0pylRmlyVBT6K9MX1Y1OYMJeT/L
	 tNVSD1DcpnnsFRkMM8pvpdGEPKiVOCc2b9Z+dsvuxRgx+Oekkv/f3KONsEgYqrP3Ij1Un
	 qe64c7wGI8eM8lz/pvKOlPNP+5gjF+JUVTQsxw7QJ/0viz4/9GEIDTQcm1sdhwH8JJJpW
	 yVv1W+E6m/2Sa4MMGjqqVb/mQiRQcpgIis3+vHNPghYsBNxzCfvR7iNrarkzlu13UVJqD
	 SdcjpH4HO6NoEO0dL+jP+0ESo65zLhVYyVCl8zMRkvp0A2VosF/5x1S1fzKHR7VHe7Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lVFlym97;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2C56606A335;
	Mon, 23 Nov 2026 20:27:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lVFlym97
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795465627;
	b=zcDU9SzB9mjAMueaWowi9WK0zAuslpOIciK30dZzI/JCKDxg0mSZE15e9au6vKBqeJBG
	 3DL/YvIZUFwt60p5TNIskg8N1ggcJMbxE+0qzGIWXniTO60/D68fKyjvwfQe9rtA0xKSI
	 Z3NTIaARVFG/ZBAYLjow+y6W56fgNEp69KrRNy+IEfd84SDQLG4iO+n/KeX+Ipyt6QByh
	 LCAozFDLBAzSfOpFUCDCuZ+anNREqgINEKAnPFAOYhk0L1G/oabknera4b1BtUCfjrEAv
	 PYprLjy61MPhstt7mjehoBfXJvWXZyueh6Uu5nADCu6dHP/sZ2nQlfbRQiGHLGp3aGg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795465627;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=O14BbX1wLIKYJhhhZsc1QX5KnrTbKI8v08Tn9x+QgPI=;
	b=1aTmfdT22yw4oFHfjEFtQ6ovUB6fwDxEjPBJU+k3xMVEWRTmGuR2EbvoyWxV6XvA1gQZ
	 mUNjSs2PZREo61mHyBK25e8pgMjGYxCzSS+WemSRMavxOEAamtgNfA/KYDnpqB4HeOe2L
	 gl6/66dBAob4ur9wSrLX/K7y07GexswipTLdp/d7Hn0cPzzUIKRNvgOux/7PgybNKggFi
	 Z5l81yzy5aJuGJaBNDj+Tz3RyXu/RCjwv6Fp9xryHxFmUhuP010N60jCUqk8uVTFlgJ9N
	 +JCJQx646W1FqlHIt2bvvO2SGSfmmSF8HjcMkSOirmL9nEHOXn/n6y7Uh7WNdyo24Lw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E4CA41F000CF;
	Mon, 23 Nov 2026 20:26:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795465627;
	bh=O14BbX1wLIKYJhhhZsc1QX5KnrTbKI8v08Tn9x+QgPI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=lVFlym97nQ2sbSL5ozZO1aDO1fR1U3e7RJFB3YZp9m5I1SuVS296R67yGRppUBFGF
	 Hlfdyj+THm0I4/O8FVx1zOlUn5kUfV+qXd3rFJylJG3A+tOQTgQmU+5pfx5+UJmzSM
	 Le7+QFMLdlq/hYmm74hxKVtk1+0xbumTju1i60XX9MTyEAs/ANQoJ79TaJLc7CdwuV
	 vJXUY6MaNdQ5F1V+iXXTsxLqmmmboOvE3bk3WcEXJn3NdFJ88fYgNXaXsm11A3c82h
	 ldLAHSzr83WomvtqOkahsmTfBnckIyx9AtAK4D6dAdvPeLptOYrK62HE/vfn3/Ad7X
	 GOfqE0YARPsLA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 723E54C6D5;
	Mon, 23 Nov 2026 20:26:58 +0000 (UTC)
From: Fil Dunsky via B4 Relay <devnull+filipp.dunsky.gmail.com@kernel.org>
Date: Mon, 23 Nov 2026 23:26:57 +0300
Subject: [PATCH v2 3/5] clk: Add Cortina Systems CS7542 strap-selected
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
Message-Id: <20261123-cs7542-syscon-v2-3-1cd74b2522f9@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795465614; l=5002;
 i=filipp.dunsky@gmail.com; s=20260930; h=from:subject:message-id;
 bh=JEa90SGQ0FgER4S1FcL2NkC7oSwXVNfRbOUFnfhpGuk=;
 b=KrJrQvjcrLUCB14UeBuoQd6zHRVPzDzRsfrhDKpL6DMmJCWveSgSQ8Yw1RS4Z1LTeOMkV6Tbb
 Dqbf19a8KAKA0WHbYwp4Ug2P8ilCGXXOFwHxSe4hyozneb65cUE/PbR
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


