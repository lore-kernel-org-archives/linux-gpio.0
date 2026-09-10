Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C4754A2601;
	Thu, 10 Sep 2026 13:35:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789047348; cv=none; b=eqzztZUZZ8hW0n3T7Tr7uptqndDncp7yrUJEn9FS7uNwu5LAtMg23688jU9Hw3Yv2ioau5b5G0a2rURpgK5FCseQf+/5uuuJUYLf+RPxCnvc+tdjd+clqCc/YOrZnlS5FRbQ1wQW0x4d3jQpJgDxhdu4ITqwPNC5dKjtkoJ0QQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789047348; c=relaxed/simple;
	bh=afNw4mfmWPusnYCWAuWnIcZqwy8vQndi0BEvd7sUpx8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HMFC7Mutp2kVK8WSqCTp3J3zTdeiaRSEv9vIKHl7qDfnoGDwtRD+eS3ajd0J02ZwOQ6DganWdYKt3nMMkYOD+aEEJEJXMCgvLkW9uWz8VMSNemoKOFIpFUqEH9i3GXL5vcBP2j3IdR4vqeBFed5cWDV6faFqlTXh1Tzjq8iYsPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=UfTRtROJ; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="UfTRtROJ"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5978922D7;
	Thu, 10 Sep 2026 06:35:42 -0700 (PDT)
Received: from e142021.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6DE663F528;
	Thu, 10 Sep 2026 06:35:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789047346; bh=afNw4mfmWPusnYCWAuWnIcZqwy8vQndi0BEvd7sUpx8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UfTRtROJp3o3h+kxey19i79i5p4qm5F7glE6bRJQrgIYbYioCZeEY5yrFrRBP1oFX
	 Wge3Vj4qNIzetJJqDKqGYvcETFwerYkqYBLrSrmevjQS6lhgc77Hxa3AwQ+DgaBSbA
	 K9PGVLIAGmHvsbT/PtW7vjT5XljEHaKEEa6SqU6U=
From: Andre Przywara <andre.przywara@arm.com>
To: Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	Yixun Lan <dlan@gentoo.org>,
	Enzo Adriano <enzo.adriano.code@gmail.com>,
	Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 7/7] pinctrl: sunxi: add support for the Allwinner A733
Date: Thu, 10 Sep 2026 15:35:18 +0200
Message-ID: <20260910133519.459011-8-andre.przywara@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260910133519.459011-1-andre.przywara@arm.com>
References: <20260910133519.459011-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Allwinner A733 changes the layout of the pinctrl MMIO register
frame, but stays otherwise rather close to the previous IP.
The main PIO looks similar to the one in the A523, with ports B-K being
implemented, each also with the same number of pins per port as on the
A523.

Use the DT based pinctrl driver to describe just the generic pinctrl
properties, so advertise the number of pins per bank, interrupt
capabilities and the new quirks. The actual function/mux assignment will
be taken from the devicetree.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 drivers/pinctrl/sunxi/Kconfig               |  5 +++
 drivers/pinctrl/sunxi/Makefile              |  1 +
 drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c | 50 +++++++++++++++++++++
 3 files changed, 56 insertions(+)
 create mode 100644 drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c

diff --git a/drivers/pinctrl/sunxi/Kconfig b/drivers/pinctrl/sunxi/Kconfig
index dc62eba96348e..831bb1dc93738 100644
--- a/drivers/pinctrl/sunxi/Kconfig
+++ b/drivers/pinctrl/sunxi/Kconfig
@@ -141,4 +141,9 @@ config PINCTRL_SUN55I_A523_R
 	default ARM64 && ARCH_SUNXI
 	select PINCTRL_SUNXI
 
+config PINCTRL_SUN60I_A733
+	bool "Support for the Allwinner A733 PIO"
+	default ARM64 && ARCH_SUNXI
+	select PINCTRL_SUNXI
+
 endif
diff --git a/drivers/pinctrl/sunxi/Makefile b/drivers/pinctrl/sunxi/Makefile
index 951b3f1e4b4f1..3658c9d06b498 100644
--- a/drivers/pinctrl/sunxi/Makefile
+++ b/drivers/pinctrl/sunxi/Makefile
@@ -29,5 +29,6 @@ obj-$(CONFIG_PINCTRL_SUN50I_H616)	+= pinctrl-sun50i-h616.o
 obj-$(CONFIG_PINCTRL_SUN50I_H616_R)	+= pinctrl-sun50i-h616-r.o
 obj-$(CONFIG_PINCTRL_SUN55I_A523)	+= pinctrl-sun55i-a523.o
 obj-$(CONFIG_PINCTRL_SUN55I_A523_R)	+= pinctrl-sun55i-a523-r.o
+obj-$(CONFIG_PINCTRL_SUN60I_A733)	+= pinctrl-sun60i-a733.o
 obj-$(CONFIG_PINCTRL_SUN9I_A80)		+= pinctrl-sun9i-a80.o
 obj-$(CONFIG_PINCTRL_SUN9I_A80_R)	+= pinctrl-sun9i-a80-r.o
diff --git a/drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c b/drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c
new file mode 100644
index 0000000000000..ca82f08a3a65b
--- /dev/null
+++ b/drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c
@@ -0,0 +1,50 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Allwinner A733 SoC pinctrl driver.
+ *
+ * Copyright (C) 2025 Arm Ltd.
+ */
+
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/pinctrl/pinctrl.h>
+
+#include "pinctrl-sunxi.h"
+
+static const u8 a733_nr_bank_pins[SUNXI_PINCTRL_MAX_BANKS] =
+/*	  PA  PB  PC  PD  PE  PF  PG  PH  PI  PJ  PK */
+	{  0, 11, 17, 24, 16,  7, 15, 20, 17, 28, 26 };
+
+static const u8 a733_irq_bank_muxes[SUNXI_PINCTRL_MAX_BANKS] =
+/*	  PA  PB  PC  PD  PE  PF  PG  PH  PI  PJ  PK */
+	{  0, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14};
+
+static struct sunxi_pinctrl_desc a733_pinctrl_data = {
+	.irq_banks = 10,
+	.irq_read_needs_mux = true,
+	.io_bias_cfg_variant = BIAS_VOLTAGE_PIO_POW_MODE_SEL,
+};
+
+static int a733_pinctrl_probe(struct platform_device *pdev)
+{
+	return sunxi_pinctrl_dt_table_init(pdev, a733_nr_bank_pins,
+					   a733_irq_bank_muxes,
+					   &a733_pinctrl_data,
+					   SUNXI_PINCTRL_NCAT3_REG_LAYOUT);
+}
+
+static const struct of_device_id a733_pinctrl_match[] = {
+	{ .compatible = "allwinner,sun60i-a733-pinctrl", },
+	{}
+};
+
+static struct platform_driver a733_pinctrl_driver = {
+	.probe	= a733_pinctrl_probe,
+	.driver	= {
+		.name		= "sun60i-a733-pinctrl",
+		.of_match_table	= a733_pinctrl_match,
+	},
+};
+builtin_platform_driver(a733_pinctrl_driver);
-- 
2.47.3

