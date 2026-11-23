Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795459289;
	b=wO+LyzIpjj2aRJnm53WYheCseeNhOJ3znH4QLMJqeVjAwVYbOAY8to5e78cYNMwCzd9a
	 UG50v5zXs3oNnLl8hr5fxGupA3C1vl8++tozKmxelk5WvcGfkvHPcVzXYsiRIZDRbxA1g
	 BIerOOblvUdWxjCk5nSlGZUzqqpmSiaFOCs6+P7sX3VSpx1uHgfyyMIVsvlD3cWfkl1qc
	 7KF+bmzMrGjO1xvwX//i0xBOfc4AD+Ga6YtspSOMop/p6AxKIOHPwkdwSyrHvDp6xbblN
	 EHyOF7DvvikqT4h/nSaLdASPjEpmIp2/xsbUcbJFoSS0+7fDGRuK6r7cTHwUamar8Hw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795459289;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=O14BbX1wLIKYJhhhZsc1QX5KnrTbKI8v08Tn9x+QgPI=;
	b=vsF9OeU45GSU+0AUTfzIEWf49xFvE+kHaSP9ZcQRX9xA38jYzrjAGKxHTx3XA7ZKirQv
	 s3D8BfhFnXb17BglqkMerwqANI6qptI+/M1wg66R6jvTcd101oxF3LPIA5+U9sfsjwiSx
	 qAazu244Dtbg4yxA/d9pZom3EFuRgp1tfW6/dmOENzX6Yn2zcUJqxjgRDYS368IUQ1nzj
	 Sxu2omAsXeTvKsQMCFzeQBudH1t++7MotkcDW9k5+nAqgH6jyAChBOjvuD/NZz+ehOYGO
	 BA1bOP/cLjmNMMzA/2b89CrcHtTNvn/VBKqBne6o8pgx0XaWrA5DAuyV8siK0dWVUBw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QoAQqCrQ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08261606A690;
	Mon, 23 Nov 2026 18:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QoAQqCrQ
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795459288;
	b=IeO5z3h8NcHm3Zq3Diy0ZVYuXD++TphEuxMgn+JccK/NhWT/Xj94bBkUoDyc/V2FW/SY
	 xgScHFKm2OmZ/ss75h4g34BEL2gWAS3aPJG9lbYpdqo5CMq87y5IskvlgTFQvBRJfDtba
	 fCMqoL7cbOCxj2n3xnH8y5J/4v+ERBEHYHcKIVHrccXKRh+d4AMq6jagMchKqybkdCmae
	 M0EmrsgQraqa8zhNrV2X8PIMLzkW/5WoYXJ3qnPlCAB4KHaXg2dgM5//fIo/FMOv6+qw3
	 4l6seBR6ByCkW/BzJ6VE+ul0bDxqF+kLxxPyzgCQW3DrSdjnT2koIih68D1ylx5FVIg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795459288;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=O14BbX1wLIKYJhhhZsc1QX5KnrTbKI8v08Tn9x+QgPI=;
	b=V3v6OxhDuSktbdkRePBDYlAqc1Q5rlLtanPQIq8xiD4O1gd74UYDpQYYJ7NEkY6+5Qix
	 NdwjPw3gvkOC51n9/nl71eEk6Uvseu9a+6Zu0g5jBOO/iNMVbMavHw+Y5GHbrvZwTdKNn
	 OAnbq/rp8Cd1JEN2QgnVVXXlx+mRWSxB170OzgdcOPqg9m8KAkqWopU3l8v8YS2pKiE3m
	 SKs5MhiMBqZFt3312osxnID9M06NSlcBf4tnLegqnYqvw5xZPuRe8JXGXKf5FWLWkkuAD
	 AqPGa+beocfBfQmcSjG/arNWq1aSXiLr1gscB6Fjp7GSwRRNF8Cp4egZDuyvp9tI9Lg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3C34A1F000D8;
	Mon, 23 Nov 2026 18:41:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795459288;
	bh=O14BbX1wLIKYJhhhZsc1QX5KnrTbKI8v08Tn9x+QgPI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=QoAQqCrQWkMvHImLgV0+zKzlmX78AIEO/c7wbo7ao2mYua2Gbskopn/5S7CgovvhB
	 Oazb16HQM6nvx+tyPOQknj4R24A0ECiRHxbR2K/BeBQXyAerZ4jWXbMTa9iIacBHH8
	 jz5wLVijcm6wjWKZ7Z2Y68ul34MXNEo4TwLQh7DGTelKKLPuJbRpMAK/dfTk2pzLJ9
	 xyoC+bTfZe6hNdkNrdWU7C6PMaDH7lEkmfULBJXdC5ertt6sFzOi5Yav+Bv22ceiqj
	 SqmSTR3VRkuYKOm8iXHayHiH6zOL4QLrc5sVBAXSkiIRFIeGkR/1mECERptt1mgaHa
	 U0Jm/5MhYct0A==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 6C1D34C5B7;
	Mon, 23 Nov 2026 18:41:13 +0000 (UTC)
From: Fil Dunsky via B4 Relay <devnull+filipp.dunsky.gmail.com@kernel.org>
Date: Mon, 23 Nov 2026 21:41:14 +0300
Subject: [PATCH 3/5] clk: Add Cortina Systems CS7542 strap-selected clocks
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
Message-Id: <20261123-cs7542-syscon-v1-3-49858e631449@gmail.com>
References: <20261123-cs7542-syscon-v1-0-49858e631449@gmail.com>
In-Reply-To: <20261123-cs7542-syscon-v1-0-49858e631449@gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Linus Walleij <linusw@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-gpio@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795459271; l=5002;
 i=filipp.dunsky@gmail.com; s=20260930; h=from:subject:message-id;
 bh=JEa90SGQ0FgER4S1FcL2NkC7oSwXVNfRbOUFnfhpGuk=;
 b=e0rWIO8xaF7w/JxsQI1xMpXHd7PA0yFu8QyZU0nPuYXJuZbaup7pL+v3doiI2mBjTRi0pqYQ3
 4w6h8Ukd29VAWNQe8XizC1ikSTIqHkjSXy5cPSfa07jcQ2a0Jt0chie
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


