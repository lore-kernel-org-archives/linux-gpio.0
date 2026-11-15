Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794739487;
	b=p2EvPDFqCAn9vp44kn6DVXbZzRo3PI0yw+htQ5LyDR6EclblfbkKSJiTDHHbcEa/YteC
	 TSlga1f06zY9Fokm3/ZYHnK3jwbCI+oiqSQD9nWsLPim0LFDTjpBm2lJv5DhiDEAr4eBm
	 Yi6il0ioOemkw5xzIsY2KPDRAo7iwD+/4N4WYmnn/Xw/wb2jT+DEKkOKEP8cjXrpfyJ4N
	 g3Ez5zwDodonLaZi962PWXGSiWf0jOaedZlhDlI2P5r0UOMM98SiezhBis+PK3F4nlTVt
	 AVLJ2EDKl/FmIBxTWmQ387SzUQ9G6QBzeCZ5rbtO1vf8RcxOeSPpT/MAEHFsVNmnD0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794739487;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=flzTljZaFRQx/jUo4nd9R1iWKcBGyf/HIN2QRt0GDSc=;
	b=fCg++a9z6qlx2Euk9/9WXiwE0op+n1bFjMYmvyKSYF2cog6nVf7ctyqM6drDgrD114pO
	 FXsa54w8MsraiCpwLQEHDTi1y0oqmRmFMyhsA3hrDipgeY9Be59CMO0FT6H/8BasOQQ9n
	 9gU7P0qdSh1ViFWOkGBZAT4coCIahv5JgjrN4Ruu+upKT4XVK4s2/rNs6KhuKdk5vo9dZ
	 9PvYVFpqYwsoAShgh/BJhlyOHvncPmWyqHXH22FLC4aN2BlQ1bF/M58rVdOtDrDWYKkoQ
	 bIzHTvjSxbr13OiH9dCsUg4j9tjLAv9GA5spCZXHR9KfkW0o6hr+iwV+2jMiD0m1FAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KgPc9291;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0990A606A31F;
	Sun, 15 Nov 2026 10:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KgPc9291
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 887371F000C7;
	Sun, 15 Nov 2026 10:44:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794739486;
	bh=flzTljZaFRQx/jUo4nd9R1iWKcBGyf/HIN2QRt0GDSc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=KgPc9291/NdZVFdU5ucoWbsp7rxGMzN2ZZd/0hEItNdo4iFJd+aRa781eQay4TCrr
	 Tnpo66lxIQ2+cf2zu6/7gi+bUxpYDzX8e59J03opLcU91OXuv+H+t+43PCgaFwLEQd
	 F13rcjVJ29nrAhE0AHVQXlMfz/c+ZH1nv/CIOyOdBjaYnCaq+7cI5h12tEGWsH9zLs
	 JJhEs313/b1cLk7o22+I7q8VFjzrDFszu8gAWWNjFMR//I3Y9jQV18BSjXfGOaJPRl
	 QBbTFQsRGCZpoJ4kQoieK6jI00KBln5piRPrsBNgNqGLe/pQYRPBBZidm7Ac5XveV+
	 niYeswr7c2hgQ==
From: Jisheng Zhang <jszhang@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Linus Walleij <linusw@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH v2 06/13] soc: synaptics: add SL2610 system controller support
Date: Sun, 15 Nov 2026 18:23:45 +0800
Message-ID: <20261115102401.3520-7-jszhang@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261115102401.3520-1-jszhang@kernel.org>
References: <20261115102401.3520-1-jszhang@kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Create the clock, reset and pin controller platform devices implemented
by each SL2610 system control block. Select the appropriate MFD cells
from per-block compatible data while keeping register access available
through the shared syscon.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 MAINTAINERS                           |  1 +
 drivers/soc/Kconfig                   |  1 +
 drivers/soc/Makefile                  |  1 +
 drivers/soc/synaptics/Kconfig         | 14 +++++
 drivers/soc/synaptics/Makefile        |  2 +
 drivers/soc/synaptics/sl2610-syscon.c | 84 +++++++++++++++++++++++++++
 6 files changed, 103 insertions(+)
 create mode 100644 drivers/soc/synaptics/Kconfig
 create mode 100644 drivers/soc/synaptics/Makefile
 create mode 100644 drivers/soc/synaptics/sl2610-syscon.c

diff --git a/MAINTAINERS b/MAINTAINERS
index e7c061ae5a87..eae1493485ee 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3812,6 +3812,7 @@ F:	Documentation/devicetree/bindings/soc/synaptics/
 F:	arch/arm/boot/dts/synaptics/
 F:	arch/arm/mach-berlin/
 F:	arch/arm64/boot/dts/synaptics/
+F:	drivers/soc/synaptics/
 F:	include/dt-bindings/clock/syna,sl2610.h
 F:	include/dt-bindings/reset/syna,sl2610-reset.h
 
diff --git a/drivers/soc/Kconfig b/drivers/soc/Kconfig
index 483cbdcae153..5fe7348cddab 100644
--- a/drivers/soc/Kconfig
+++ b/drivers/soc/Kconfig
@@ -27,6 +27,7 @@ source "drivers/soc/sophgo/Kconfig"
 source "drivers/soc/st/Kconfig"
 source "drivers/soc/starfive/Kconfig"
 source "drivers/soc/sunxi/Kconfig"
+source "drivers/soc/synaptics/Kconfig"
 source "drivers/soc/tegra/Kconfig"
 source "drivers/soc/ti/Kconfig"
 source "drivers/soc/ux500/Kconfig"
diff --git a/drivers/soc/Makefile b/drivers/soc/Makefile
index 5a3efd68355c..3e51563b914c 100644
--- a/drivers/soc/Makefile
+++ b/drivers/soc/Makefile
@@ -33,6 +33,7 @@ obj-y				+= sophgo/
 obj-y				+= st/
 obj-y				+= starfive/
 obj-y				+= sunxi/
+obj-y				+= synaptics/
 obj-$(CONFIG_ARCH_TEGRA)	+= tegra/
 obj-y				+= ti/
 obj-$(CONFIG_ARCH_U8500)	+= ux500/
diff --git a/drivers/soc/synaptics/Kconfig b/drivers/soc/synaptics/Kconfig
new file mode 100644
index 000000000000..9f0324a1a3b7
--- /dev/null
+++ b/drivers/soc/synaptics/Kconfig
@@ -0,0 +1,14 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+config SOC_SL2610_SYSCON
+	tristate "Synaptics SL2610 system controller"
+	depends on ARCH_BERLIN || COMPILE_TEST
+	depends on OF && HAS_IOMEM
+	select MFD_CORE
+	select MFD_SYSCON
+	help
+	  Support the global and control register blocks on Synaptics SL2610
+	  SoCs. This creates devices for the clock, reset and pin controllers
+	  provided by each register block.
+
+	  Say Y here to enable access to these functions on SL2610 systems.
diff --git a/drivers/soc/synaptics/Makefile b/drivers/soc/synaptics/Makefile
new file mode 100644
index 000000000000..13710fc58903
--- /dev/null
+++ b/drivers/soc/synaptics/Makefile
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0-only
+obj-$(CONFIG_SOC_SL2610_SYSCON) += sl2610-syscon.o
diff --git a/drivers/soc/synaptics/sl2610-syscon.c b/drivers/soc/synaptics/sl2610-syscon.c
new file mode 100644
index 000000000000..c6fc2955ac0d
--- /dev/null
+++ b/drivers/soc/synaptics/sl2610-syscon.c
@@ -0,0 +1,84 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2026 Synaptics Incorporated
+ */
+
+#include <linux/mfd/core.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+
+struct sl2610_syscon_data {
+	const struct mfd_cell *cells;
+	unsigned int num_cells;
+};
+
+static const struct mfd_cell sl2610_soc_cells[] = {
+	MFD_CELL_NAME("sl2610-soc-clk"),
+	MFD_CELL_NAME("sl2610-soc-reset"),
+	MFD_CELL_NAME("sl2610-soc-pinctrl"),
+};
+
+static const struct mfd_cell sl2610_mcu_cells[] = {
+	MFD_CELL_NAME("sl2610-mcu-clk"),
+	MFD_CELL_NAME("sl2610-mcu-reset"),
+	MFD_CELL_NAME("sl2610-mcu-pinctrl"),
+};
+
+static const struct mfd_cell sl2610_avio_cells[] = {
+	MFD_CELL_NAME("sl2610-avio-clk"),
+};
+
+static const struct mfd_cell sl2610_cpu_cells[] = {
+	MFD_CELL_NAME("sl2610-cpu-clk"),
+};
+
+static const struct sl2610_syscon_data sl2610_soc_data = {
+	.cells = sl2610_soc_cells,
+	.num_cells = ARRAY_SIZE(sl2610_soc_cells),
+};
+
+static const struct sl2610_syscon_data sl2610_mcu_data = {
+	.cells = sl2610_mcu_cells,
+	.num_cells = ARRAY_SIZE(sl2610_mcu_cells),
+};
+
+static const struct sl2610_syscon_data sl2610_avio_data = {
+	.cells = sl2610_avio_cells,
+	.num_cells = ARRAY_SIZE(sl2610_avio_cells),
+};
+
+static const struct sl2610_syscon_data sl2610_cpu_data = {
+	.cells = sl2610_cpu_cells,
+	.num_cells = ARRAY_SIZE(sl2610_cpu_cells),
+};
+
+static int sl2610_syscon_probe(struct platform_device *pdev)
+{
+	const struct sl2610_syscon_data *data = device_get_match_data(&pdev->dev);
+
+	return devm_mfd_add_devices(&pdev->dev, PLATFORM_DEVID_AUTO,
+				    data->cells, data->num_cells, NULL, 0, NULL);
+}
+
+static const struct of_device_id sl2610_syscon_of_match[] = {
+	{ .compatible = "syna,sl2610-soc-syscon", .data = &sl2610_soc_data },
+	{ .compatible = "syna,sl2610-mcu-syscon", .data = &sl2610_mcu_data },
+	{ .compatible = "syna,sl2610-avio-syscon", .data = &sl2610_avio_data },
+	{ .compatible = "syna,sl2610-cpu-syscon", .data = &sl2610_cpu_data },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, sl2610_syscon_of_match);
+
+static struct platform_driver sl2610_syscon_driver = {
+	.probe = sl2610_syscon_probe,
+	.driver = {
+		.name = "sl2610-syscon",
+		.of_match_table = sl2610_syscon_of_match,
+	},
+};
+module_platform_driver(sl2610_syscon_driver);
+
+MODULE_AUTHOR("Jisheng Zhang <jszhang@kernel.org>");
+MODULE_DESCRIPTION("Synaptics SL2610 system controller");
+MODULE_LICENSE("GPL");
-- 
2.55.0

