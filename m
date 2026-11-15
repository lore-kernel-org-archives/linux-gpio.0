Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794739507;
	b=XsMrNUufTmZZ/GT5mvyeTzUE/Q+CeZtaHHOrxRA5is+oRgMVK0ejXumrVT14Xi6IE9OA
	 QlLUncv9OZttraDqFFXJbppOc4D94EDNzFL1UCByXNAkXg32A+Stu58GYy+Tmx4q9kBy3
	 rMJvqiWddAeDsGAiQxwzjgMIMS2YesICKoDY3MruF1lmxqQSwiO7S1LYqIXgpnTtB6juv
	 verxoqlmkd++NNIKCQaZwI8vctHxjc6pNNgzoiXom6fTRQ+7CgzcCtNPBsSoZ7y/MTMh/
	 RZfqFq16lTe2LSBrEmdk4l+REWcQBAZ9aIAJmqNe5Y9E8nnotWEnvIRkgIPSdudCHqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794739507;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=e3r2cIqlU5KT1d3eWa2FJxe8PdY9NbAo+hSUvWzQ8cM=;
	b=gJAthsLaAwxEf14k2o4viOyN8X7SZ6tCAyqBPYIm3jkzhUIXS5ts1NprFDpShqX/C6yD
	 F2n1xzhBb+6IjXnBQ3ZlAHZjihWYFKS8O9q928Oqrna+7skhg31ABU/4XDWUhGF3wj4zX
	 pvwlT2MAU3Ujno6ZW83L+I3f33BNjsD1ckVXt2xw8p4a0xxKt8+9HpNUR19wNTjEy0M4+
	 tYL0DiFXM/gXFUhFQ6jrN2c+Z/14aujwd+m/L37xZalMKahBB9SyVYMVRt81Tde1eNP8F
	 y4sBLHyv7BchCJSeegRITOh5T8q0nAzdQGFey2TCfw4zXfp41k2E9nfzRijfZlHnlhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Vkpd+Zl3;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D36D606A337;
	Sun, 15 Nov 2026 10:45:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Vkpd+Zl3
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F1B31F000C8;
	Sun, 15 Nov 2026 10:45:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794739506;
	bh=e3r2cIqlU5KT1d3eWa2FJxe8PdY9NbAo+hSUvWzQ8cM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Vkpd+Zl3B/dYsRxrJgHsmzA4y5NNkyD1v+pFC5mm/Ugl44gMZcD5pu/zMiqlNbL6w
	 rVQ9YrKO8hZDVtLnxitznkl1yGWMCyOqij6gOE/yfM7ECHmDmJnxZ8oKY7EBogmDn+
	 P24W8FGqk8YQyoFsTn27W4Kf8N/BO97VSkux0zupn+45RAJJpqMbTFYE85++8W6jcu
	 FXbpsiYi01qNzATiZootPI2YD9V4OafQVk8FFNaC9Z8uPgInr5AMaebXA5NeITDYh1
	 M4r6BpFArimfY1tAjo/s6xzcXNkf7b7vb4xoR2mcxZPOPh7HNlqzQdKlvgvdjDYpSI
	 lD9w6riKTFKEA==
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
Subject: [PATCH v2 10/13] clk: berlin: add Synaptics SL2610 clocks and PLLs
Date: Sun, 15 Nov 2026 18:23:49 +0800
Message-ID: <20261115102401.3520-11-jszhang@kernel.org>
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

Support the SL2610 SoC, CPU, AVIO and MCU clocks. Register the PLL
outputs and the divider, gate and fixed-factor clocks used by the CPU
and peripherals.

Match MFD platform devices and register clock providers on their parent
system controller nodes.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 MAINTAINERS                     |   1 +
 drivers/clk/berlin/Kconfig      |  27 +++
 drivers/clk/berlin/Makefile     |   2 +
 drivers/clk/berlin/clk-sl2610.c | 360 ++++++++++++++++++++++++++++++++
 drivers/clk/berlin/sl2610-pll.c | 145 +++++++++++++
 drivers/clk/berlin/sl2610-pll.h |  14 ++
 6 files changed, 549 insertions(+)
 create mode 100644 drivers/clk/berlin/clk-sl2610.c
 create mode 100644 drivers/clk/berlin/sl2610-pll.c
 create mode 100644 drivers/clk/berlin/sl2610-pll.h

diff --git a/MAINTAINERS b/MAINTAINERS
index f3067f71d54c..430758242906 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3812,6 +3812,7 @@ F:	Documentation/devicetree/bindings/soc/synaptics/
 F:	arch/arm/boot/dts/synaptics/
 F:	arch/arm/mach-berlin/
 F:	arch/arm64/boot/dts/synaptics/
+F:	drivers/clk/berlin/*sl2610*
 F:	drivers/clk/berlin/sl-*
 F:	drivers/pinctrl/berlin/pinctrl-sl2610.c
 F:	drivers/reset/reset-sl2610.c
diff --git a/drivers/clk/berlin/Kconfig b/drivers/clk/berlin/Kconfig
index 8f71d4c7a478..be7e47e0ff52 100644
--- a/drivers/clk/berlin/Kconfig
+++ b/drivers/clk/berlin/Kconfig
@@ -5,3 +5,30 @@ config SL_COMMON_CLK
 
 config SL_SYSMGR_CLK
 	bool
+
+config SL2610_PLL
+	tristate "Synaptics SL2610 PLL Driver"
+	depends on ARCH_BERLIN || COMPILE_TEST
+	default n
+	help
+	  Support the integer and fractional PLL outputs used by the SoC,
+	  CPU and audio clock controllers on Synaptics SL2610 SoCs.
+
+	  To compile this driver as a module, choose M here. The module will
+	  be called sl2610-pll.
+
+config SL2610_CLK
+	tristate "Synaptics SL2610 Clock Driver"
+	depends on ARCH_BERLIN || COMPILE_TEST
+	depends on OF && HAS_IOMEM
+	select SL2610_PLL
+	select SL_COMMON_CLK
+	select SL_SYSMGR_CLK
+	select SOC_SL2610_SYSCON
+	help
+	  This driver provides support for clock controller on Synaptics SL2610
+	  SoC. The clock controller generates and supplies clocks to various
+	  peripherals within the SoC.
+
+	  To compile this driver as a module, choose M here. The module will
+	  be called clk-sl2610.
diff --git a/drivers/clk/berlin/Makefile b/drivers/clk/berlin/Makefile
index 5dbd0fd264ad..ec87dbed7dd4 100644
--- a/drivers/clk/berlin/Makefile
+++ b/drivers/clk/berlin/Makefile
@@ -5,3 +5,5 @@ obj-$(CONFIG_MACH_BERLIN_BG2CD)	+= bg2.o
 obj-$(CONFIG_MACH_BERLIN_BG2Q)	+= bg2q.o
 obj-$(CONFIG_SL_COMMON_CLK)	+= sl-clk.o
 obj-$(CONFIG_SL_SYSMGR_CLK)	+= sl-sysmgr-clk.o
+obj-$(CONFIG_SL2610_PLL)	+= sl2610-pll.o
+obj-$(CONFIG_SL2610_CLK)	+= clk-sl2610.o
diff --git a/drivers/clk/berlin/clk-sl2610.c b/drivers/clk/berlin/clk-sl2610.c
new file mode 100644
index 000000000000..b51d3523028d
--- /dev/null
+++ b/drivers/clk/berlin/clk-sl2610.c
@@ -0,0 +1,360 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2025 Synaptics Incorporated
+ *
+ * Author: Jisheng Zhang <jszhang@kernel.org>
+ *
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/platform_device.h>
+#include <linux/of_address.h>
+#include <linux/module.h>
+
+#include <dt-bindings/clock/syna,sl2610.h>
+
+#include "sl2610-pll.h"
+#include "sl-clk.h"
+#include "sl-sysmgr-clk.h"
+
+#define REG_CLKENABLE		0x0420
+
+#define CLK_GATE_CTRL0		0x0600
+
+#define SYSPLL0_OFFSET		0x0200
+#define SYSPLL1_OFFSET		0x0220
+#define CPUPLL_OFFSET		0x2000
+#define APLL0_OFFSET		0x0008
+#define APLL1_OFFSET		0x0030
+
+static DEFINE_SPINLOCK(gate_lock);
+static DEFINE_SPINLOCK(lock);
+
+enum {
+	SYSPLL0_OUT, SYSPLL0_OUTF,
+	SYSPLL1_OUT, SYSPLL1_OUTF,
+	CPUPLL_OUT, CPUPLL_OUTF,
+	APLL0_OUT, APLL0_OUTF,
+	APLL1_OUT, APLL1_OUTF,
+};
+
+static const char * const clk_names[] = {
+	[SYSPLL0_OUT]		= "syspll0_out",
+	[SYSPLL0_OUTF]		= "syspll0_outf",
+	[SYSPLL1_OUT]		= "syspll1_out",
+	[SYSPLL1_OUTF]		= "syspll1_outf",
+	[CPUPLL_OUT]		= "cpupll_out",
+	[CPUPLL_OUTF]		= "cpupll_outf",
+	[APLL0_OUT]		= "apll0_out",
+	[APLL0_OUTF]		= "apll0_outf",
+	[APLL1_OUT]		= "apll1_out",
+	[APLL1_OUTF]		= "apll1_outf",
+};
+
+static const struct sl_gateclk_desc sl2610_gates[] = {
+	{ "usb0coreclk",	"perifsysclk",	CLK_USB0CORE,		0 },
+	{ "sdiosysclk",		"perifsysclk",	CLK_SDIOSYS,		1 },
+	{ "emmcsysclk",		"perifsysclk",	CLK_EMMCSYS,		2 },
+	{ "gpuaxiclk",		"hpcclk",	CLK_GPUAXI,		3 },
+	{ "gethrgmiisysclk",	"perifsysclk",	CLK_GETHRGMIISYS,	4 },
+	{ "sdio1sysclk",	"perifsysclk",	CLK_SDIO1SYS,		5 },
+	{ "usb1coreclk",	"perifsysclk",	CLK_USB1CORE,		6 },
+	{ "gethrgmii1sysclk",	"perifsysclk",	CLK_GETHRGMII1SYS,	7 },
+	{ "usb0phyrefclk",	"perifsysclk",	CLK_USB0PHYREF,		8 },
+	{ "usb1phyrefclk",	"perifsysclk",	CLK_USB1PHYREF,		9 },
+	{ "apbuart0clk",	"apbcoreclk",	CLK_APBUART0,		10 },
+	{ "apbuart1clk",	"apbcoreclk",	CLK_APBUART1,		11 },
+	{ "apbuart2clk",	"apbcoreclk",	CLK_APBUART2,		12 },
+	{ "apbuart3lck",	"apbcoreclk",	CLK_APBUART3,		13 },
+	{ "apbi2c0clk",		"apbcoreclk",	CLK_APBI2C0,		14 },
+	{ "apbi2c1lck",		"apbcoreclk",	CLK_APBI2C1,		15 },
+	{ "apbspi0clk",		"apbcoreclk",	CLK_APBSPI0,		16 },
+	{ "apbspi1clk",		"apbcoreclk",	CLK_APBSPI1,		17 },
+	{ "apbspi2clk",		"apbcoreclk",	CLK_APBSPI2,		18 },
+	{ "apbspi3clk",		"apbcoreclk",	CLK_APBSPI3,		19 },
+	{ "apbgpioclk",		"apbcoreclk",	CLK_APBGPIO,		20 },
+	{ "apbtimersclk",	"apbcoreclk",	CLK_APBTIMERS,		21 },
+	{ "apbsyscntclk",	"apbcoreclk",	CLK_APBSYSCNT,		22 },
+	{ "apbwdtclk",		"apbcoreclk",	CLK_APBWDT,		23 },
+	{ "apbdmaclk",		"apbcoreclk",	CLK_APBDMA,		24 },
+};
+
+static const struct sl_clk_desc sl2610_descs[] = {
+	{ "cpufastrefclk",	CLK_CPUFASTREF,		0x440, CLK_IS_CRITICAL },
+	{ "memfastrefclk",	CLK_MEMFASTREF,		0x444, CLK_IS_CRITICAL },
+	{ "cfgclk",		CLK_CFG,		0x448, CLK_IS_CRITICAL },
+	{ "sysclk",		CLK_SYS,		0x44c, CLK_IS_CRITICAL },
+	{ "perifsysclk",	CLK_PERIFSYS,		0x450, CLK_IS_CRITICAL },
+	{ "apbcoreclk",		CLK_APBCORE,		0x454, CLK_IS_CRITICAL },
+	{ "apbserclk",		CLK_APBSER,		0x458, CLK_IS_CRITICAL },
+	{ "atbclk",		CLK_ATB,		0x45c },
+	{ "hpcclk",		CLK_HPC,		0x460, CLK_IS_CRITICAL },
+	{ "emmcclk",		CLK_EMMC,		0x464 },
+	{ "sd0clk",		CLK_SD0,		0x468 },
+	{ "sd1clk",		CLK_SD1,		0x46c },
+	{ "gethrgmiiclk",	CLK_GETHRGMII,		0x470 },
+	{ "gethrgmii1clk",	CLK_GETHRGMII1,		0x474 },
+	{ "ge0_ptp_refclk",	CLK_GE0_PTP_REF,	0x478 },
+	{ "ge1_ptp_refclk",	CLK_GE1_PTP_REF,	0x47c },
+	{ "usb2testclk",	CLK_USB2TEST,		0x480 },
+	{ "usb2test480mg0clk",	CLK_USB2TEST480MG0,	0x484 },
+	{ "usb2test480mg1clk",	CLK_USB2TEST480MG1,	0x488 },
+	{ "usb2test480mg2clk",	CLK_USB2TEST480MG2,	0x48c },
+	{ "usb2test100mg0clk",	CLK_USB2TEST100MG0,	0x490 },
+	{ "usb2test100mg1clk",	CLK_USB2TEST100MG1,	0x494 },
+	{ "usb2test100mg2clk",	CLK_USB2TEST100MG2,	0x498 },
+	{ "usb2test100mg3clk",	CLK_USB2TEST100MG3,	0x49c },
+	{ "periftest125mg0clk",	CLK_PERIFTEST125MG0,	0x4a0 },
+	{ "periftest200mg0clk",	CLK_PERIFTEST200MG0,	0x4a4 },
+	{ "periftest200mg1clk",	CLK_PERIFTEST200MG1,	0x4a8 },
+	{ "gpuclk",		CLK_GPU,		0x4ac },
+	{ "npuclk",		CLK_NPU,		0x4b0 },
+	{ "aviosysclk",		CLK_AVIOSYS,		0x4b4, CLK_IS_CRITICAL },
+	{ "aiosysclk",		CLK_AIOSYS,		0x4b8, CLK_IS_CRITICAL },
+	{ "avio_lcdc2scanclk",	CLK_AVIO_LCDC2SCAN,	0x4bc },
+	{ "avio_ipiclk",	CLK_AVIO_IPI,		0x4c0 },
+	{ "avio_pclk",		CLK_AVIO_P,		0x4c4 },
+	{ "avio_dphyrxtxescclk", CLK_AVIO_DPHYRXTXESC,	0x4c8 },
+	{ "aviofpllclk",	CLK_AVIOFPLL,		0x4cc },
+	{ "avio_rx_scanbyteclk", CLK_AVIO_RX_SCANBYTE,	0x4d0 },
+	{ "avio_rx_scantestclk", CLK_AVIO_RX_SCANTEST,	0x4d4 },
+};
+
+static const char * const default_parent_names[] = {
+	"syspll0_out",
+	"apll0_out",
+	"syspll0_outf",
+	"apll0_outf",
+	"syspll1_out",
+	"syspll1_outf",
+};
+
+static const char * const ge_ptp_refclk_parent_names[] = {
+	"osc",
+	"apll0_outf",
+	"syspll1_out",
+	"syspll0_out",
+	"clk_mcu_axi",
+};
+
+static int sl2610_soc_clk_setup(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct device_node *parent_np = dev->parent->of_node;
+	struct clk_hw_onecell_data *clk_data;
+	const char * const *parent_names;
+	int num_parents;
+	void __iomem *base;
+	struct clk_hw **hws;
+	int n, ret;
+	u32 id;
+
+	base = devm_of_iomap(dev, parent_np, 0, NULL);
+	if (IS_ERR(base))
+		return PTR_ERR(base);
+
+	clk_data = devm_kzalloc(dev, struct_size(clk_data, hws, SL2610_CLK_MAX), GFP_KERNEL);
+	if (!clk_data)
+		return -ENOMEM;
+	clk_data->num = SL2610_CLK_MAX;
+	hws = clk_data->hws;
+
+	/* sysplls */
+	ret = sl2610_pll_register(dev, base + SYSPLL0_OFFSET,
+				  clk_names[SYSPLL0_OUT], clk_names[SYSPLL0_OUTF]);
+	if (ret)
+		return ret;
+	ret = sl2610_pll_register(dev, base + SYSPLL1_OFFSET,
+				  clk_names[SYSPLL1_OUT], clk_names[SYSPLL1_OUTF]);
+	if (ret)
+		return ret;
+
+	/* normal clocks */
+	for (n = 0; n < ARRAY_SIZE(sl2610_descs); n++) {
+		const struct sl_clk_desc *cd = &sl2610_descs[n];
+
+		id = cd->id;
+		if (id == CLK_GE0_PTP_REF || id == CLK_GE1_PTP_REF) {
+			parent_names = ge_ptp_refclk_parent_names;
+			num_parents = ARRAY_SIZE(ge_ptp_refclk_parent_names);
+		} else {
+			parent_names = default_parent_names;
+			num_parents = ARRAY_SIZE(default_parent_names);
+		}
+		hws[id] = sl_clk_register(dev, base + cd->offset, cd->name,
+					  parent_names, num_parents, cd->flags, &lock);
+		if (IS_ERR(hws[id]))
+			return PTR_ERR(hws[id]);
+	}
+
+	/* gate clocks */
+	for (n = 0; n < ARRAY_SIZE(sl2610_gates); n++) {
+		const struct sl_gateclk_desc *gd = &sl2610_gates[n];
+
+		id = gd->id;
+		hws[id] = devm_clk_hw_register_gate(dev, gd->name, gd->parent_name,
+						    gd->flags, base + REG_CLKENABLE,
+						    gd->bit_idx, 0, &gate_lock);
+		if (IS_ERR(hws[id]))
+			return PTR_ERR(hws[id]);
+	}
+
+	return devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get, clk_data);
+}
+
+static int sl2610_cpu_clk_setup(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct device_node *parent_np = dev->parent->of_node;
+	struct clk_hw_onecell_data *clk_data;
+	struct clk_hw **hws;
+	void __iomem *base;
+	int ret;
+
+	base = devm_of_iomap(dev, parent_np, 0, NULL);
+	if (IS_ERR(base))
+		return PTR_ERR(base);
+
+	clk_data = devm_kzalloc(dev, struct_size(clk_data, hws, SL2610_CPU_CLK_MAX), GFP_KERNEL);
+	if (!clk_data)
+		return -ENOMEM;
+	clk_data->num = SL2610_CPU_CLK_MAX;
+	hws = clk_data->hws;
+
+	/* cpupll */
+	ret = sl2610_pll_register(dev, base + CPUPLL_OFFSET,
+				  clk_names[CPUPLL_OUT], clk_names[CPUPLL_OUTF]);
+	if (ret)
+		return ret;
+
+	/* TODO: support cpupll bypass */
+	hws[CLK_CPU0] =
+		devm_clk_hw_register_fixed_factor(dev, "cpu0", clk_names[CPUPLL_OUTF], 0, 1, 1);
+	if (IS_ERR(hws[CLK_CPU0]))
+		return PTR_ERR(hws[CLK_CPU0]);
+	hws[CLK_CPU1] =
+		devm_clk_hw_register_fixed_factor(dev, "cpu1", clk_names[CPUPLL_OUTF], 0, 1, 1);
+	if (IS_ERR(hws[CLK_CPU1]))
+		return PTR_ERR(hws[CLK_CPU1]);
+	hws[CLK_DSU] =
+		devm_clk_hw_register_fixed_factor(dev, "dsu", clk_names[CPUPLL_OUT], 0, 1, 1);
+	if (IS_ERR(hws[CLK_DSU]))
+		return PTR_ERR(hws[CLK_DSU]);
+
+	return devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get, clk_data);
+}
+
+static int sl2610_aio_clk_setup(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct device_node *parent_np = dev->parent->of_node;
+	void __iomem *base;
+	int ret;
+
+	base = devm_of_iomap(dev, parent_np, 0, NULL);
+	if (IS_ERR(base))
+		return PTR_ERR(base);
+
+	/* aplls */
+	ret = sl2610_pll_register(dev, base + APLL0_OFFSET,
+				  clk_names[APLL0_OUT], clk_names[APLL0_OUTF]);
+	if (ret)
+		return ret;
+	ret = sl2610_pll_register(dev, base + APLL1_OFFSET,
+				  clk_names[APLL1_OUT], clk_names[APLL1_OUTF]);
+	if (ret)
+		return ret;
+
+	/* TODO aio clks */
+
+	return 0;
+}
+
+static const struct sl_sysmgr_fixedclk_desc sl2610_sysmgr_fixeds[] = {
+	{ "clk_mcu_ref",	CLK_MCU_REF,	25000000 },
+	{ "clk_mcu_pll",	CLK_MCU_PLL,	400000000 },
+	{ "clk_mcu_io_pll",	CLK_MCU_IO_PLL,	300000000 },
+	{ "clk_mcu_apb",	CLK_MCU_APB,	100000000 },
+	{ "clk_mcu_axi",	CLK_MCU_AXI,	200000000 },
+};
+
+static const struct sl_sysmgr_gateclk_desc sl2610_sysmgr_gates[] = {
+	{ "clk_cfg_uart0",	"clk_mcu_apb",	CLK_CFG_UART0,	0 },
+	{ "clk_ser_uart0",	"clk_mcu_ref",	CLK_SER_UART0,	1 },
+	{ "clk_cfg_uart1",	"clk_mcu_apb",	CLK_CFG_UART1,	2 },
+	{ "clk_cfg_uart2",	"clk_mcu_apb",	CLK_CFG_UART2,	3 },
+	{ "clk_cfg_uart3",	"clk_mcu_apb",	CLK_CFG_UART3,	4 },
+	{ "clk_cfg_gpio",	"clk_mcu_apb",	CLK_CFG_GPIO,	5 },
+	{ "clk_cfg_i2cm0",	"clk_mcu_apb",	CLK_CFG_I2CM0,	6 },
+	{ "clk_cfg_i2cm1",	"clk_mcu_apb",	CLK_CFG_I2CM1,	7 },
+	{ "clk_cfg_spim",	"clk_mcu_apb",	CLK_CFG_SPIM,	8 },
+	{ "clk_cfg_spis",	"clk_mcu_apb",	CLK_CFG_SPIS,	9 },
+	{ "clk_cfg_i3c",	"clk_mcu_apb",	CLK_CFG_I3C,	10 },
+	{ "clk_cfg_xspi",	"clk_mcu_apb",	CLK_CFG_XSPI,	11 },
+	{ "clk_axi_xspi",	"clk_mcu_axi",	CLK_AXI_XSPI,	12 },
+	{ "clk_cfg_pvt",	"clk_mcu_apb",	CLK_CFG_PVT,	13 },
+	{ "clk_cfg_adc",	"clk_mcu_apb",	CLK_CFG_ADC,	14 },
+	{ "clk_cfg_pwm",	"clk_mcu_apb",	CLK_CFG_PWM,	15 },
+	{ "clk_bus_can0",	"clk_mcu_axi",	CLK_BUS_CAN0,	16 },
+	{ "clk_bus_can1",	"clk_mcu_axi",	CLK_BUS_CAN1,	17 },
+	{ "clk_cfg_pdm",	"clk_mcu_apb",	CLK_CFG_PDM,	18 },
+};
+
+static const struct sl_sysmgr_clk_desc sl2610_sysmgr_clks[] = {
+	{ "clk_ser_uart1",	"clk_mcu_pll",	CLK_SER_UART1,	0x604,	4 },
+	{ "clk_ser_uart2",	"clk_mcu_pll",	CLK_SER_UART2,	0x608,	4 },
+	{ "clk_ser_uart3",	"clk_mcu_pll",	CLK_SER_UART3,	0x60c,	4 },
+	{ "clk_deb_gpio",	"clk_mcu_pll",	CLK_DEB_GPIO,	0x610,	4 },
+	{ "clk_ser_i2cm0",	"clk_mcu_pll",	CLK_SER_I2CM0,	0x614,	4 },
+	{ "clk_ser_i2cm1",	"clk_mcu_pll",	CLK_SER_I2CM1,	0x618,	4 },
+	{ "clk_ser_spim",	"clk_mcu_pll",	CLK_SER_SPIM,	0x61c,	4 },
+	{ "clk_ser_spis",	"clk_mcu_pll",	CLK_SER_SPIS,	0x620,	4 },
+	{ "clk_ser_i3c",	"clk_mcu_pll",	CLK_SER_I3C,	0x624,	4 },
+	{ "clk_ser_xspi",	"clk_mcu_io_pll", CLK_SER_XSPI,	0x628,	4 },
+	{ "clk_hs_pvt",		"clk_mcu_pll",	CLK_HS_PVT,	0x62c,	4 },
+	{ "clk_core_adc",	"clk_mcu_pll",	CLK_CORE_ADC,	0x630,	8 },
+	{ "clk_ser_pwm",	"clk_mcu_pll",	CLK_SER_PWM,	0x634,	4 },
+	{ "clk_ser_can0",	"clk_mcu_pll",	CLK_SER_CAN0,	0x638,	4 },
+	{ "clk_ser_can1",	"clk_mcu_pll",	CLK_SER_CAN1,	0x63c,	4 },
+	{ "clk_ser_pdm",	"clk_mcu_pll",	CLK_SER_PDM,	0x640,	8 },
+	{ "clk_ref_calib",	"clk_mcu_pll",	CLK_REF_CALIB,	0x644,	8 },
+};
+
+static int sl2610_sysmgr_clk_setup(struct platform_device *pdev)
+{
+	return sl_sysmgr_clk_setup(pdev, sl2610_sysmgr_fixeds, ARRAY_SIZE(sl2610_sysmgr_fixeds),
+				   sl2610_sysmgr_gates, ARRAY_SIZE(sl2610_sysmgr_gates),
+				   CLK_GATE_CTRL0,
+				   sl2610_sysmgr_clks, ARRAY_SIZE(sl2610_sysmgr_clks));
+}
+
+static const struct platform_device_id sl2610_clks_ids[] = {
+	{ "sl2610-soc-clk", (kernel_ulong_t)sl2610_soc_clk_setup },
+	{ "sl2610-cpu-clk", (kernel_ulong_t)sl2610_cpu_clk_setup },
+	{ "sl2610-avio-clk", (kernel_ulong_t)sl2610_aio_clk_setup },
+	{ "sl2610-mcu-clk", (kernel_ulong_t)sl2610_sysmgr_clk_setup },
+	{ }
+};
+MODULE_DEVICE_TABLE(platform, sl2610_clks_ids);
+
+static int sl2610_clks_probe(struct platform_device *pdev)
+{
+	int (*clk_setup)(struct platform_device *pdev);
+
+	clk_setup = (void *)platform_get_device_id(pdev)->driver_data;
+
+	return clk_setup(pdev);
+}
+
+static struct platform_driver sl2610_clks_driver = {
+	.probe = sl2610_clks_probe,
+	.id_table = sl2610_clks_ids,
+	.driver = {
+		.name = "sl2610-clk",
+	},
+};
+module_platform_driver(sl2610_clks_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Jisheng Zhang <jszhang@kernel.org>");
+MODULE_DESCRIPTION("Synaptics SL2610 clock driver");
diff --git a/drivers/clk/berlin/sl2610-pll.c b/drivers/clk/berlin/sl2610-pll.c
new file mode 100644
index 000000000000..62c5d2d19c36
--- /dev/null
+++ b/drivers/clk/berlin/sl2610-pll.c
@@ -0,0 +1,145 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2019-2021 Synaptics Incorporated
+ *
+ * Author: Jisheng Zhang <jszhang@kernel.org>
+ */
+
+#include <linux/bitops.h>
+#include <linux/clk-provider.h>
+#include <linux/clk.h>
+#include <linux/container_of.h>
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/io.h>
+#include <linux/math64.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_clk.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
+
+#include "sl2610-pll.h"
+
+#define FRAC_BITS		24
+
+#define CTRLC			0x08
+#define DIVR_MASK		GENMASK(8, 0)
+#define CTRLD			0x0c
+#define DIVF_MASK		GENMASK(8, 0)
+#define CTRLE			0x10
+#define DIVFF_MASK		GENMASK(23, 0)
+#define CTRLF			0x14
+#define DIVQ_MASK		GENMASK(4, 0)
+#define CTRLG			0x18
+#define DIVQF_MASK		GENMASK(2, 0)
+
+#define SL2610_APLL
+struct sl2610_pll {
+	void __iomem *ctrl;
+	struct clk_hw pllout;
+	struct clk_hw plloutf;
+};
+
+#define to_pllout(_hw) container_of(_hw, struct sl2610_pll, pllout)
+#define to_plloutf(_hw) container_of(_hw, struct sl2610_pll, plloutf)
+
+static unsigned long sl2610_pll_recalc_rate(struct sl2610_pll *pll,
+					    unsigned long parent_rate, bool fractional_output)
+{
+	u32 dm, dn, frac, dp;
+	u64 rate;
+
+	dm = (readl_relaxed(pll->ctrl + CTRLC) & DIVR_MASK) + 1;
+	dn = (readl_relaxed(pll->ctrl + CTRLD) & DIVF_MASK) + 1;
+	frac = readl_relaxed(pll->ctrl + CTRLE) & DIVFF_MASK;
+
+	if (fractional_output)
+		dp = (readl_relaxed(pll->ctrl + CTRLG) & DIVQF_MASK) + 1;
+	else
+		dp = ((readl_relaxed(pll->ctrl + CTRLF) & DIVQ_MASK) + 1) * 2;
+
+	rate = (u64)parent_rate * dn;
+	rate += ((u64)parent_rate * frac + BIT_ULL(FRAC_BITS - 1)) >> FRAC_BITS;
+	rate = DIV_ROUND_CLOSEST_ULL(rate * 4, dm * dp);
+
+	return rate;
+}
+
+static unsigned long sl2610_pllout_recalc_rate(struct clk_hw *hw,
+					       unsigned long parent_rate)
+{
+	return sl2610_pll_recalc_rate(to_pllout(hw), parent_rate, false);
+}
+
+static unsigned long sl2610_plloutf_recalc_rate(struct clk_hw *hw,
+						unsigned long parent_rate)
+{
+	return sl2610_pll_recalc_rate(to_plloutf(hw), parent_rate, true);
+}
+
+static const struct clk_ops sl2610_pllout_ops = {
+	.recalc_rate = sl2610_pllout_recalc_rate,
+};
+
+static const struct clk_ops sl2610_plloutf_ops = {
+	.recalc_rate = sl2610_plloutf_recalc_rate,
+};
+
+static void sl2610_pll_put_clk(void *data)
+{
+	clk_put(data);
+}
+
+int sl2610_pll_register(struct device *dev, void __iomem *ctrl,
+			const char *out, const char *outf)
+{
+	struct device_node *np = dev->parent->of_node;
+	struct clk_parent_data parent = {};
+	struct clk_init_data init = {};
+	struct sl2610_pll *pll;
+	struct clk *input;
+	int ret;
+
+	if (!dev || !ctrl || !out || !outf)
+		return -EINVAL;
+
+	input = of_clk_get(np, 0);
+	if (IS_ERR(input))
+		return dev_err_probe(dev, PTR_ERR(input),
+				     "failed to get PLL reference clock\n");
+	parent.hw = __clk_get_hw(input);
+	ret = devm_add_action_or_reset(dev, sl2610_pll_put_clk, input);
+	if (ret)
+		return ret;
+
+	pll = devm_kzalloc(dev, sizeof(*pll), GFP_KERNEL);
+	if (!pll)
+		return -ENOMEM;
+	pll->ctrl = ctrl;
+
+	init.name = out;
+	init.ops = &sl2610_pllout_ops;
+	init.parent_data = &parent;
+	init.num_parents = 1;
+	init.flags = CLK_GET_RATE_NOCACHE;
+	pll->pllout.init = &init;
+
+	ret = devm_clk_hw_register(dev, &pll->pllout);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to register pllout\n");
+
+	init.name = outf;
+	init.ops = &sl2610_plloutf_ops;
+	pll->plloutf.init = &init;
+
+	ret = devm_clk_hw_register(dev, &pll->plloutf);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to register plloutf\n");
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(sl2610_pll_register);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("Synaptics SL2610 PLL clock driver");
diff --git a/drivers/clk/berlin/sl2610-pll.h b/drivers/clk/berlin/sl2610-pll.h
new file mode 100644
index 000000000000..b61a93b28610
--- /dev/null
+++ b/drivers/clk/berlin/sl2610-pll.h
@@ -0,0 +1,14 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __SL2610_PLL_H
+#define __SL2610_PLL_H
+
+#include <linux/io.h>
+
+struct clk_hw_onecell_data;
+struct device;
+struct device_node;
+
+int sl2610_pll_register(struct device *dev, void __iomem *ctrl,
+			const char *out, const char *outf);
+
+#endif /* __SL2610_PLL_H */
-- 
2.55.0

