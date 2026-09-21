Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11021127.outbound.protection.outlook.com [52.101.62.127])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CC343B4EAC;
	Mon, 21 Sep 2026 07:20:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.127
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789975241; cv=fail; b=TnRwRYYu8Rns+UL/dAo6JudnxHGUZnZlSYAC5adBc0rEpix4Ki2bC0hc8eZ87awCO3mqSFKItBtXSB75+OtyjOx89HIPVgaOAML27ajVZl68DfVz+s6JXm7crkzaCVhvNzmBMsLBMaQoMUeM7knVjXj2q0l/7ICpwrs/icwZkHc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789975241; c=relaxed/simple;
	bh=vujIMBokZjRnYoFvR/qFV+kyH/YklwthBcEUfARNMDg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ebnV3WZKdKsLyFRzBSfjVMDncMpJVJho5191eDjJoI9n5bdJB2vSzlM/aTp3mq3bd9hMSHx+Dw98zVFa48FvNE08AmoBnOD5mVMCY+VwY9oUtE+BNh0dTDN47cmz3O3w7d9p935nDSvPyWwxwDRGLC6rSXutQLj2ik+HGpEV7SY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com; spf=pass smtp.mailfrom=axiado.com; dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b=pgj5I3Q6; arc=fail smtp.client-ip=52.101.62.127
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axiado.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b="pgj5I3Q6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cVZshwlJ66DkFXc6D1mFsQQZD8nOpNKUK/PeiXg49pXb4zFMLUiIOVwgRG39DyWW0oxjp6xwKqVUsedpYK4s1Dbttm1sOvTthpaY0C/Mf0OWC1MgKiYNziuWYCSi0FaKjZ4PftJsBHrGbHLq865Ks9v3oJQ6uWAPKXl06tAsA4/X9Eb3BGiznMKP3az9bW2nbLozDlgP2vRpRPMPF2NBRMfYRrlA77p3zXntDalvTfopZayH008abuxK1907Kyo9SQLRA04KsQe9fvQGX3+1f2Hi8Mhvu/KiDqBAw73dEcWIjrDg59lToI2+gcQYa5zHrdlrP/e6dIH7W2w/dmJpzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x3jtozj8uiPjB3u1mBhupYPD2dtI5FmL6d077dy9dvI=;
 b=a7givhzMJdkxX4lAAoCgyWD5WT5jC7Jh7M4elFHi/QE8x6sd4OBtuTDZkUFbKwSg84Kwcc6mfBQdNUuNsWeUKiXyOyZ/FHG0hhcsTGIfd/BRzcdaHEYss01Dzf/g2b/NMLh4ot+UTbcjfoHJguGjPSjFVr9h+5IHivIJ5/U2HPIeAhU57obrxiywIfIzXqhzdkBoYhgSKx5yD+cin59Rah8x+Ru1b/AexapTwDaDG8VMsaiD/nfOSiKLYEvhIfAzwvdyy8hXycRbNxSVi6DLw9S45ppo2iGmCjgADKf3RqGRpu0ahC1h3I9YM28WbeJKFftC46hOg5CgHVwQjlsF/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 64.62.143.114) smtp.rcpttodomain=axiado.com smtp.mailfrom=axiado.com;
 dmarc=none action=none header.from=axiado.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x3jtozj8uiPjB3u1mBhupYPD2dtI5FmL6d077dy9dvI=;
 b=pgj5I3Q6gk1N37j3sFrAQNdVnx81UL8FSDdSYf3IGq39AwH1vG3jUGrM4UiiXuRyb8WBgKK2K8bqojOCab66MU2/Intzn7nkiri2e4QOZ+dqG4Yk3CQNTKaTen95Ww8zmZWB1HOwtoJzVPE19tI9BlWFdiHal+3umw6s+ViDo/P+Q49tcTvj486sVn8ASDFIU8wAmv7w+hnjR9Tu27qKypiorYfycDotY7sbpHxpvMr3FIRoq3yFxZIy9ikseS/Zd0RFta/hq5cNocXDOCF6lNm1GK479dHp1fK6u1hMxur79l+QgzQDa8iInyFIqOvMuOmD6KKFrk5ICvy7AZPPNA==
Received: from SJ2P221CA0010.NAMP221.PROD.OUTLOOK.COM (2603:10b6:a03:5db::19)
 by PH0PR18MB988498.namprd18.prod.outlook.com (2603:10b6:510:120::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.15; Mon, 21 Sep
 2026 07:20:25 +0000
Received: from BY1PEPF0001AE1A.namprd04.prod.outlook.com
 (2603:10b6:a03:5db:cafe::4c) by SJ2P221CA0010.outlook.office365.com
 (2603:10b6:a03:5db::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.16 via Frontend Transport; Mon,
 21 Sep 2026 07:20:25 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 64.62.143.114)
 smtp.mailfrom=axiado.com; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received-SPF: Fail (protection.outlook.com: domain of axiado.com does not
 designate 64.62.143.114 as permitted sender) receiver=protection.outlook.com;
 client-ip=64.62.143.114; helo=smtp.corp.axiado.com;
Received: from smtp.corp.axiado.com (64.62.143.114) by
 BY1PEPF0001AE1A.mail.protection.outlook.com (10.167.242.102) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.8
 via Frontend Transport; Mon, 21 Sep 2026 07:20:25 +0000
Received: from axz-uw1-build-vm02.corp.axiado.com (unknown [10.14.1.22])
	by smtp.corp.axiado.com (Postfix) with ESMTP id 6235A40BFE04;
	Mon, 21 Sep 2026 00:20:25 -0700 (PDT)
From: Petar Stepanovic <pstepanovic@axiado.com>
Date: Mon, 21 Sep 2026 00:20:23 -0700
Subject: [PATCH v4 2/2] gpio: axiado: add AX3005 SGPIO controller support
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-axiado-ax3000-sgpio-controller-v4-2-79c444be7faf@axiado.com>
References: <20260921-axiado-ax3000-sgpio-controller-v4-0-79c444be7faf@axiado.com>
In-Reply-To: <20260921-axiado-ax3000-sgpio-controller-v4-0-79c444be7faf@axiado.com>
To: Petar Stepanovic <pstepanovic@axiado.com>, 
 Tzu-Hao Wei <twei@axiado.com>, Swark Yang <syang@axiado.com>, 
 Prasad Bolisetty <pbolisetty@axiado.com>, Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Harshit Shah <hshah@axiado.com>, 
 SriNavmani A <srinavmani@axiado.com>, 
 Karthikeyan Mitran <kmitran@axiado.com>, Michael Walle <mwalle@kernel.org>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 openbmc@lists.ozlabs.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789975225; l=24493;
 i=pstepanovic@axiado.com; s=20250916; h=from:subject:message-id;
 bh=vujIMBokZjRnYoFvR/qFV+kyH/YklwthBcEUfARNMDg=;
 b=/yqYvh1ryXaFPDtQopvu9RBhFxRRBTrQzode61ENn2q2ebLk04XHyPVJ8IRoSJW4xkjpFuiY4
 6VxN3gIZUvKDaZmlRlpNjoSUuXeaDP4DEU6YhzFb4XgV5KpD4KlH7zS
X-Developer-Key: i=pstepanovic@axiado.com; a=ed25519;
 pk=70f1UJOGT9U11ZK6o+ENXtv0I5wBE3e+Y9YWODzRsdI=
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE1A:EE_|PH0PR18MB988498:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b8826d3-8009-4b70-2de2-08df17b0ce96
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|376014|7416014|23010399003|1800799024|10067099003|56012099006|6133799003|3023799007|18002099003|22082099003|5023799004|921020;
X-Microsoft-Antispam-Message-Info:
	XuIKfu6Z3XS3Tw8MM9F2UK/1YsX/2L3FSx6HRpOAxpAkKHYg2llleuq0YyE7E8lah70Sfx/cDJcavaWyz7atTLH2gEKWW8auzUQoqrrfbN4myuwyTTmJ9VW86GyXbHQYrKNnLFdApCtW/bNIREMS8adyjkkoa9dil9UGRU0Rl9dbMPT4+ZptRhsKrK4egkuSxHjujFkzVcc3U33O2T8x3ne6vfru79XsK0K8UURaubPcdBsNTjy9iudD2RvB5PyD07UHirkTDESGsDN4875uSeJx9WyHB3WNTJNU9OE+MYWV2VaHmEpQ7HYx36wZ/zQKY7znLzrzcRpOStW/2L4GU0H/CsqBAvJeQyFCudJfKXRd2q9fUlSdMK4kP0dvAKHBR29L0SrGqVeQ+yYaK9pWHggEhqxyTNK0VXpOte/57rvHffom7wdYutSPzXWxkLxew6HZHOYi00r6nTdU1t477tWC+uRx2YvjJiQcOYi0SBqlZ+C3bOajXKzdfPMV3pt8kgOxDzF1mqj73X6lNurXlx6OAXuhieIbkIjpCOnq4bVXRze1NnfEFGUnGE0Re5/tcpmaJJHNA05Z4xJl0lKFq6Wk+L2MUIztjt/WXzfoNeApCp16n35lTt4xlzLmlaf3DGW/LF6x/bDsQb+h6aTXa5+Y8SGTTghIPs595YaDBiTukiHYzMeTC82k3PQMUggvne47ifo1ZcguKD8eugnjtVs3iX+Ok24wNwy86rUEzGnGCqwPNQXyGGYJNtmrr7dq
X-Forefront-Antispam-Report:
	CIP:64.62.143.114;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtp.corp.axiado.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(7416014)(23010399003)(1800799024)(10067099003)(56012099006)(6133799003)(3023799007)(18002099003)(22082099003)(5023799004)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	wOKWUsoWj5vDMxA43Nln1tfpv5kLyBHVXPHTbQAMveKBExWz5OHp4tKaTn9bgtoMWWWp8ru+IOizFvfD+VOWA6z+Y4L5miqAyvd6oPVD4sjV7CqqXY6Nz+vsH86DrFTbxIboWOl/oT0RBO1krM2jAbm9gulvsF6nIJzpla9ik2OimP85pXHBJ1zgO7KjMM/0Ybenq2/5aW3pvCVhyfCpvU3xLQYreLts8/sQi2qDZ/eCEnoFnzr8Mna3MI0HZZ20pjO4tSSH32rZpAlzoGwoh1ft9OO7mIAIcr5d/0fvu8iB2BwMGl5k5ypFuRevbGVPCFuw8bgcPCLZU83UUMG6dONRCn4V/mjoztBA74K9XBNeiYgOvf5YIjYyNtBp6BA1kzD5SeNmJCGfJRfaqHVOYBiMJUul58tU/okcCEe0eADztyI4twAf31TciOuQA23x
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 07:20:25.6548
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b8826d3-8009-4b70-2de2-08df17b0ce96
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=ff2db17c-4338-408e-9036-2dee8e3e17d7;Ip=[64.62.143.114];Helo=[smtp.corp.axiado.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF0001AE1A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR18MB988498

Add support for the Axiado AX3005 SGPIO controller.

Each SGPIO position provides one input GPIO and one output GPIO with
fixed directions. The driver registers the controller as a gpio_chip,
supports interrupts on input GPIOs, and uses regmap for register access.

Signed-off-by: Petar Stepanovic <pstepanovic@axiado.com>
---
 MAINTAINERS                      |   1 +
 drivers/gpio/Kconfig             |  21 ++
 drivers/gpio/Makefile            |   1 +
 drivers/gpio/gpio-axiado-sgpio.c | 736 +++++++++++++++++++++++++++++++++++++++
 4 files changed, 759 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 5bec6ea50c70..aeedf503d422 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4413,6 +4413,7 @@ M:	Prasad Bolisetty <pbolisetty@axiado.com>
 L:	linux-gpio@vger.kernel.org
 S:	Supported
 F:	Documentation/devicetree/bindings/gpio/axiado,ax3005-sgpio.yaml
+F:	drivers/gpio/gpio-axiado-sgpio.c
 
 AXIS ARTPEC ARM64 SoC SUPPORT
 M:	Jesper Nilsson <jesper.nilsson@axis.com>
diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index a48586bb8edb..364472b3788f 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -204,6 +204,27 @@ config GPIO_ATH79
 	  Select this option to enable GPIO driver for
 	  Atheros AR71XX/AR724X/AR913X SoC devices.
 
+config GPIO_AXIADO_SGPIO
+	tristate "Axiado AX3005 SGPIO support"
+	depends on ARCH_AXIADO || COMPILE_TEST
+	select GPIOLIB_IRQCHIP
+	select GPIO_REGMAP
+	select REGMAP_MMIO
+	help
+	  Enable support for the Axiado AX3005 Serial GPIO (SGPIO)
+	  controller.
+
+	  The SGPIO controller provides a serialized interface for
+	  controlling multiple GPIO signals over a limited number of
+	  physical lines. Each signal is exposed as one input and one
+	  output line, and input lines can raise interrupts.
+
+	  This driver integrates with the Linux GPIO subsystem and
+	  exposes the controller as a standard GPIO provider.
+
+	  To compile this driver as a module, choose M here: the module
+	  will be called gpio-axiado-sgpio.
+
 config GPIO_RASPBERRYPI_EXP
 	tristate "Raspberry Pi 3 GPIO Expander"
 	default RASPBERRYPI_FIRMWARE
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index dc9e6d643b5b..b2820e4cf98a 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -40,6 +40,7 @@ obj-$(CONFIG_GPIO_ARIZONA)		+= gpio-arizona.o
 obj-$(CONFIG_GPIO_ASPEED)		+= gpio-aspeed.o
 obj-$(CONFIG_GPIO_ASPEED_SGPIO)		+= gpio-aspeed-sgpio.o
 obj-$(CONFIG_GPIO_ATH79)		+= gpio-ath79.o
+obj-$(CONFIG_GPIO_AXIADO_SGPIO)		+= gpio-axiado-sgpio.o
 obj-$(CONFIG_GPIO_BCM_KONA)		+= gpio-bcm-kona.o
 obj-$(CONFIG_GPIO_BCM_XGS_IPROC)	+= gpio-xgs-iproc.o
 obj-$(CONFIG_GPIO_BD71815)		+= gpio-bd71815.o
diff --git a/drivers/gpio/gpio-axiado-sgpio.c b/drivers/gpio/gpio-axiado-sgpio.c
new file mode 100644
index 000000000000..b57a5074ccef
--- /dev/null
+++ b/drivers/gpio/gpio-axiado-sgpio.c
@@ -0,0 +1,736 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2022-2026 Axiado Corporation
+ */
+
+#include <linux/bitfield.h>
+#include <linux/bitmap.h>
+#include <linux/bitops.h>
+#include <linux/bits.h>
+#include <linux/clk.h>
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/gpio/driver.h>
+#include <linux/gpio/regmap.h>
+#include <linux/interrupt.h>
+#include <linux/irq.h>
+#include <linux/irqdesc.h>
+#include <linux/irqdomain.h>
+#include <linux/math.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/property.h>
+#include <linux/regmap.h>
+#include <linux/types.h>
+
+struct axiado_sgpio_reg_offsets {
+	u32 mux_0;
+	u32 preset_0;
+	u32 count_0;
+	u32 pos_0;
+
+	u32 mux_1;
+	u32 ld;
+	u32 ld_ss;
+
+	u32 preset_1;
+	u32 count_1;
+	u32 pos_1;
+
+	u32 mux_2;
+	u32 dout;
+	u32 dout_ss;
+
+	u32 preset_2;
+	u32 count_2;
+	u32 pos_2;
+
+	u32 mux_3;
+	u32 preset_3;
+	u32 count_3;
+	u32 pos_3;
+
+	u32 mux_4;
+	u32 oe;
+	u32 oe_ss;
+
+	u32 preset_4;
+	u32 count_4;
+	u32 pos_4;
+
+	u32 mask;
+	u32 ctrl_en;
+	u32 ctrl_en_pos;
+
+	u32 din_ss;
+	u32 status;
+};
+
+static const struct axiado_sgpio_reg_offsets axiado_sgpio_offsets = {
+	.mux_0 = 0x000,
+	.preset_0 = 0x1dc,
+	.count_0 = 0x1f0,
+	.pos_0 = 0x204,
+
+	.mux_1 = 0x004,
+	.ld = 0x014,
+	.ld_ss = 0x0d8,
+
+	.preset_1 = 0x1e0,
+	.count_1 = 0x1f4,
+	.pos_1 = 0x208,
+
+	.mux_2 = 0x008,
+	.dout = 0x054,
+	.dout_ss = 0x158,
+
+	.preset_2 = 0x1e4,
+	.count_2 = 0x1f8,
+	.pos_2 = 0x20c,
+
+	.mux_3 = 0x00c,
+	.preset_3 = 0x1e8,
+	.count_3 = 0x1fc,
+	.pos_3 = 0x210,
+
+	.mux_4 = 0x010,
+	.oe = 0x0d4,
+	.oe_ss = 0x1d8,
+
+	.preset_4 = 0x1ec,
+	.count_4 = 0x200,
+	.pos_4 = 0x214,
+
+	.mask = 0x224,
+	.ctrl_en = 0x218,
+	.ctrl_en_pos = 0x21c,
+
+	.din_ss = 0x198,
+	.status = 0x228,
+};
+
+/* Number of SGPIO positions held by one bank register. */
+#define SGPIO_BANK_SIZE			32
+#define SGPIO_MAX_SIGNALS		512
+#define SGPIO_NUM_BANKS			16
+
+/*
+ * Slice mux encodings taken from the AX3005 SGPIO programming sequence.
+ */
+#define SGPIO_MUX_CLK			0x306
+#define SGPIO_MUX_DATA			0x30c
+#define SGPIO_MUX_DIN			0x14c
+#define SGPIO_MUX_OE			0x10c
+
+/* A POS register holds the first and the last position driven by the slice. */
+#define SGPIO_POS_FIRST			GENMASK(31, 16)
+#define SGPIO_POS_LAST			GENMASK(15, 0)
+#define SGPIO_POS(pos)			(FIELD_PREP(SGPIO_POS_FIRST, (pos)) | \
+					 FIELD_PREP(SGPIO_POS_LAST, (pos)))
+
+/* The clock and output enable slices always cover a full bank. */
+#define SGPIO_POS_FULL_BANK		SGPIO_POS(SGPIO_BANK_SIZE - 1)
+
+/* The enable and interrupt registers hold one bit per slice. */
+#define SGPIO_SLICE_MASK		GENMASK(15, 0)
+
+/*
+ * Interrupt sources enabled by the programming sequence. Bit 13 is left
+ * masked, the remaining slice events are all reported.
+ */
+#define SGPIO_IRQ_ENABLE		0xdfff
+
+/* The upper half of the status register reports one bit per data bank. */
+#define SGPIO_STATUS_EXCHANGE		GENMASK(31, 16)
+
+struct axiado_sgpio {
+	u32 preset_value;
+	u32 count_value;
+	u32 pos_reg;
+	/* Last sampled input word of each bank, for edge detection. */
+	u32 *din_shadow;
+	unsigned long *irq_unmasked;
+	unsigned long *irq_rising;
+	unsigned long *irq_falling;
+	u32 nsignals;
+	u32 din_bank_shift;
+	unsigned long *dir_out;
+	struct gpio_regmap *gpio;
+	struct irq_domain *domain;
+	struct regmap *regmap;
+	const struct axiado_sgpio_reg_offsets *regs;
+};
+
+/*
+ * Tell lockdep that these interrupts are in a different category than the
+ * parent they are handled from, so that the nested handling is not reported
+ * as recursion.
+ */
+static struct lock_class_key axiado_sgpio_irq_lock_class;
+static struct lock_class_key axiado_sgpio_irq_request_class;
+
+/*
+ * Each SGPIO signal is exposed as two GPIO lines: an even line for the serial
+ * input and the following odd line for the serial output. Signal n therefore
+ * lives in bit (n % 32) of bank (n / 32) of either the input or the output
+ * register.
+ */
+static int axiado_sgpio_reg_mask_xlate(struct gpio_regmap *gpio,
+				       enum gpio_regmap_operation op,
+				       unsigned int base, unsigned int offset,
+				       unsigned int *reg, unsigned int *mask)
+{
+	struct axiado_sgpio *sgpio = gpio_regmap_get_drvdata(gpio);
+	unsigned int signal = offset / 2;
+	unsigned int bank = signal / SGPIO_BANK_SIZE;
+
+	/*
+	 * An output line lives in the output register for both reads and
+	 * writes, so the register follows from the line rather than from the
+	 * operation. The AX3005 input banks are right aligned, hence the
+	 * shift.
+	 */
+	if (offset % 2)
+		base = sgpio->regs->dout_ss;
+	else
+		bank += sgpio->din_bank_shift;
+
+	*reg = base + bank * sizeof(u32);
+	*mask = BIT(signal % SGPIO_BANK_SIZE);
+
+	return 0;
+}
+
+static irqreturn_t axiado_sgpio_irq_handler(int irq, void *arg)
+{
+	struct axiado_sgpio *sgpio = arg;
+	unsigned int nbanks = DIV_ROUND_UP(sgpio->nsignals, SGPIO_BANK_SIZE);
+	u32 status, new_value, changed_value;
+	unsigned int bit, reg_ptr, i;
+	int ret;
+
+	/* Read-on-clear (ACK) parent cause */
+	ret = regmap_read(sgpio->regmap, sgpio->regs->status, &status);
+	if (ret)
+		return IRQ_NONE;
+
+	/* Nothing pending: the interrupt came from somebody else. */
+	if (!status)
+		return IRQ_NONE;
+
+	status = FIELD_GET(SGPIO_STATUS_EXCHANGE, status);
+
+	reg_ptr = sgpio->din_bank_shift;
+
+	for (i = 0; i < nbanks; i++, reg_ptr++) {
+		if (status & BIT(reg_ptr)) {
+			ret = regmap_read(sgpio->regmap,
+					  sgpio->regs->din_ss + reg_ptr * sizeof(u32),
+					  &new_value);
+			if (ret)
+				continue;
+
+			/*
+			 * Track every signal so that the shadow always holds
+			 * the last sampled level, then report only the ones
+			 * whose interrupt is unmasked. Transitions of a masked
+			 * signal are dropped rather than delivered later, the
+			 * hardware has no per signal latch to replay them
+			 * from. Only this handler touches the shadow and it is
+			 * not reentrant.
+			 */
+			changed_value = sgpio->din_shadow[i] ^ new_value;
+			sgpio->din_shadow[i] = new_value;
+			changed_value &= bitmap_read(sgpio->irq_unmasked,
+						     i * SGPIO_BANK_SIZE,
+						     SGPIO_BANK_SIZE);
+
+			while (changed_value) {
+				unsigned int child_irq;
+				irq_hw_number_t hwirq;
+				unsigned int position;
+				bool rising;
+
+				bit = __ffs(changed_value);
+				changed_value &= ~BIT(bit);
+
+				position = i * SGPIO_BANK_SIZE + bit;
+				hwirq = position * 2;
+
+				rising = !!(new_value & BIT(bit));
+
+				if (!test_bit(position, rising ? sgpio->irq_rising
+							       : sgpio->irq_falling))
+					continue;
+
+				child_irq = irq_find_mapping(sgpio->domain, hwirq);
+				if (child_irq)
+					handle_nested_irq(child_irq);
+			}
+		}
+	}
+
+	return IRQ_HANDLED;
+}
+
+static int axiado_sgpio_hw_init(struct axiado_sgpio *sgpio)
+{
+	const struct axiado_sgpio_reg_offsets *regs = sgpio->regs;
+	unsigned int nbanks = DIV_ROUND_UP(sgpio->nsignals, SGPIO_BANK_SIZE);
+	unsigned int last_bank = (sgpio->nsignals - 1) / SGPIO_BANK_SIZE;
+	unsigned int last_bit = (sgpio->nsignals - 1) % SGPIO_BANK_SIZE;
+	unsigned int i;
+	int ret;
+
+	/* Slice A0 is the shift clock, slice B1 the data load. */
+	const struct reg_sequence pre_load[] = {
+		{ regs->mask, 0 },
+		{ regs->mux_0, SGPIO_MUX_CLK },
+		{ regs->preset_0, sgpio->preset_value },
+		{ regs->count_0, sgpio->count_value },
+		{ regs->pos_0, SGPIO_POS_FULL_BANK },
+		{ regs->mux_1, SGPIO_MUX_DATA },
+	};
+	/* Slice C2 is the data output. */
+	const struct reg_sequence pre_dout[] = {
+		{ regs->preset_1, sgpio->preset_value },
+		{ regs->count_1, sgpio->count_value },
+		{ regs->pos_1, sgpio->pos_reg },
+		{ regs->mux_2, SGPIO_MUX_DATA },
+	};
+	/* Slice D3 is the data input, slice E4 the output enable. */
+	const struct reg_sequence post_dout[] = {
+		{ regs->preset_2, sgpio->preset_value },
+		{ regs->count_2, sgpio->count_value },
+		{ regs->pos_2, sgpio->pos_reg },
+		{ regs->mux_3, SGPIO_MUX_DIN },
+		{ regs->preset_3, sgpio->preset_value },
+		{ regs->count_3, sgpio->count_value },
+		{ regs->pos_3, sgpio->pos_reg },
+		{ regs->mux_4, SGPIO_MUX_OE },
+		{ regs->oe, GENMASK(31, 0) },
+		{ regs->oe_ss, GENMASK(31, 0) },
+		{ regs->preset_4, sgpio->preset_value },
+		{ regs->count_4, sgpio->count_value },
+		{ regs->pos_4, SGPIO_POS_FULL_BANK },
+		{ regs->ctrl_en, SGPIO_SLICE_MASK },
+		{ regs->ctrl_en_pos, SGPIO_SLICE_MASK },
+	};
+
+	ret = regmap_multi_reg_write(sgpio->regmap, pre_load,
+				     ARRAY_SIZE(pre_load));
+	if (ret)
+		return ret;
+
+	/*
+	 * Latch the signals that are present. Only the last bank may be
+	 * partially populated; a last bit of zero still describes one signal.
+	 */
+	for (i = 0; i < nbanks; i++) {
+		u32 val = i < last_bank ? GENMASK(SGPIO_BANK_SIZE - 1, 0) :
+					  GENMASK(last_bit, 0);
+
+		ret = regmap_write(sgpio->regmap, regs->ld + i * 4, val);
+		if (ret)
+			return ret;
+
+		ret = regmap_write(sgpio->regmap, regs->ld_ss + i * 4, val);
+		if (ret)
+			return ret;
+	}
+
+	ret = regmap_multi_reg_write(sgpio->regmap, pre_dout,
+				     ARRAY_SIZE(pre_dout));
+	if (ret)
+		return ret;
+
+	/* All outputs start out driving zero. */
+	for (i = 0; i < nbanks; i++) {
+		ret = regmap_write(sgpio->regmap, regs->dout + i * 4, 0);
+		if (ret)
+			return ret;
+
+		ret = regmap_write(sgpio->regmap, regs->dout_ss + i * 4, 0);
+		if (ret)
+			return ret;
+	}
+
+	return regmap_multi_reg_write(sgpio->regmap, post_dout,
+				      ARRAY_SIZE(post_dout));
+}
+
+static int axiado_sgpio_irq_enable(struct axiado_sgpio *sgpio)
+{
+	return regmap_write(sgpio->regmap, sgpio->regs->mask,
+			    SGPIO_IRQ_ENABLE);
+}
+
+static void axiado_sgpio_disable(void *data)
+{
+	struct axiado_sgpio *sgpio = data;
+
+	/* Mask the interrupts and stop the shift engine. */
+	regmap_write(sgpio->regmap, sgpio->regs->mask, 0);
+	regmap_write(sgpio->regmap, sgpio->regs->ctrl_en, 0);
+}
+
+static int axiado_sgpio_set_irq_type(struct irq_data *d, unsigned int type)
+{
+	struct axiado_sgpio *sgpio = irq_data_get_irq_chip_data(d);
+	irq_hw_number_t hwirq = irqd_to_hwirq(d);
+	unsigned int position;
+
+	/* Only even GPIO offsets represent SGPIO inputs. */
+	if (hwirq & 1)
+		return -EINVAL;
+
+	position = hwirq / 2;
+	if (position >= sgpio->nsignals)
+		return -EINVAL;
+
+	type &= IRQ_TYPE_SENSE_MASK;
+
+	switch (type) {
+	case IRQ_TYPE_EDGE_BOTH:
+	case IRQ_TYPE_EDGE_RISING:
+	case IRQ_TYPE_EDGE_FALLING:
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	assign_bit(position, sgpio->irq_rising, type & IRQ_TYPE_EDGE_RISING);
+	assign_bit(position, sgpio->irq_falling, type & IRQ_TYPE_EDGE_FALLING);
+
+	return 0;
+}
+
+static void axiado_sgpio_mask_irq(struct irq_data *d)
+{
+	struct axiado_sgpio *sgpio = irq_data_get_irq_chip_data(d);
+	irq_hw_number_t hwirq = irqd_to_hwirq(d);
+
+	clear_bit(hwirq / 2, sgpio->irq_unmasked);
+	gpio_regmap_disable_irq(sgpio->gpio, hwirq);
+}
+
+static void axiado_sgpio_unmask_irq(struct irq_data *d)
+{
+	struct axiado_sgpio *sgpio = irq_data_get_irq_chip_data(d);
+	irq_hw_number_t hwirq = irqd_to_hwirq(d);
+
+	gpio_regmap_enable_irq(sgpio->gpio, hwirq);
+	set_bit(hwirq / 2, sgpio->irq_unmasked);
+}
+
+static int axiado_sgpio_irq_request_resources(struct irq_data *d)
+{
+	struct axiado_sgpio *sgpio = irq_data_get_irq_chip_data(d);
+
+	return gpio_regmap_reqres_irq(sgpio->gpio, d->hwirq);
+}
+
+static void axiado_sgpio_irq_release_resources(struct irq_data *d)
+{
+	struct axiado_sgpio *sgpio = irq_data_get_irq_chip_data(d);
+
+	gpio_regmap_relres_irq(sgpio->gpio, d->hwirq);
+}
+
+static const struct irq_chip axiado_sgpio_irqchip = {
+	.name = "axiado-sgpio",
+	.irq_mask = axiado_sgpio_mask_irq,
+	.irq_unmask = axiado_sgpio_unmask_irq,
+	.irq_set_type = axiado_sgpio_set_irq_type,
+	.flags = IRQCHIP_IMMUTABLE | IRQCHIP_MASK_ON_SUSPEND,
+	.irq_request_resources = axiado_sgpio_irq_request_resources,
+	.irq_release_resources = axiado_sgpio_irq_release_resources,
+};
+
+static int axiado_sgpio_irq_map(struct irq_domain *domain, unsigned int virq,
+				irq_hw_number_t hwirq)
+{
+	struct axiado_sgpio *sgpio = domain->host_data;
+
+	/* Only even offsets represent input GPIOs. */
+	if (hwirq % 2)
+		return -EINVAL;
+
+	irq_set_chip_data(virq, sgpio);
+	irq_set_lockdep_class(virq, &axiado_sgpio_irq_lock_class,
+			      &axiado_sgpio_irq_request_class);
+	irq_set_chip_and_handler(virq, &axiado_sgpio_irqchip, handle_simple_irq);
+	irq_set_nested_thread(virq, true);
+	irq_set_noprobe(virq);
+
+	return 0;
+}
+
+static const struct irq_domain_ops axiado_sgpio_domain_ops = {
+	.map = axiado_sgpio_irq_map,
+	.xlate = irq_domain_xlate_twocell,
+};
+
+static int axiado_sgpio_init_input_cache(struct axiado_sgpio *sgpio)
+{
+	unsigned int num_banks = DIV_ROUND_UP(sgpio->nsignals,
+					      SGPIO_BANK_SIZE);
+	unsigned int reg_ptr = sgpio->din_bank_shift;
+	unsigned int i;
+	int ret;
+
+	for (i = 0; i < num_banks; i++, reg_ptr++) {
+		ret = regmap_read(sgpio->regmap,
+				  sgpio->regs->din_ss + reg_ptr * sizeof(u32),
+				  &sgpio->din_shadow[i]);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static bool axiado_sgpio_dout_reg(const struct axiado_sgpio *sgpio,
+				  unsigned int reg)
+{
+	unsigned int span = SGPIO_NUM_BANKS * sizeof(u32);
+
+	return reg >= sgpio->regs->dout_ss &&
+	       reg < sgpio->regs->dout_ss + span;
+}
+
+static bool axiado_sgpio_readable_reg(struct device *dev, unsigned int reg)
+{
+	const struct axiado_sgpio *sgpio = dev_get_drvdata(dev);
+
+	/* The status register is the last one of the block. */
+	if (reg > sgpio->regs->status)
+		return false;
+
+	/*
+	 * The output shadow feeds the shift register and cannot be read back,
+	 * the driven value is kept in the register cache instead.
+	 */
+	return !axiado_sgpio_dout_reg(sgpio, reg);
+}
+
+static bool axiado_sgpio_volatile_reg(struct device *dev, unsigned int reg)
+{
+	const struct axiado_sgpio *sgpio = dev_get_drvdata(dev);
+
+	/*
+	 * Everything but the output shadow is live hardware state: shifted in
+	 * data, running counters and the interrupt status. Caching any of it
+	 * would hand out stale values, so the cache holds the output banks
+	 * alone.
+	 */
+	return !axiado_sgpio_dout_reg(sgpio, reg);
+}
+
+static bool axiado_sgpio_precious_reg(struct device *dev, unsigned int reg)
+{
+	const struct axiado_sgpio *sgpio = dev_get_drvdata(dev);
+
+	/* Reading the status register acknowledges the interrupts. */
+	return reg == sgpio->regs->status;
+}
+
+static const struct regmap_config axiado_sgpio_regmap_config = {
+	.reg_bits = 32,
+	.val_bits = 32,
+	.reg_stride = 4,
+	.readable_reg = axiado_sgpio_readable_reg,
+	.volatile_reg = axiado_sgpio_volatile_reg,
+	.precious_reg = axiado_sgpio_precious_reg,
+	.cache_type = REGCACHE_MAPLE,
+};
+
+static int axiado_sgpio_probe(struct platform_device *pdev)
+{
+	struct gpio_regmap_config config = { };
+	struct irq_domain_info d_info = { };
+	struct axiado_sgpio *sgpio;
+	unsigned int ngpio, i;
+	unsigned long apb_freq;
+	struct clk *apb_clk;
+	void __iomem *base;
+	u32 sgpio_freq;
+	int irq, rc;
+
+	sgpio = devm_kzalloc(&pdev->dev, sizeof(*sgpio), GFP_KERNEL);
+	if (!sgpio)
+		return -ENOMEM;
+
+	/* The regmap callbacks below need both of these. */
+	platform_set_drvdata(pdev, sgpio);
+
+	sgpio->regs = &axiado_sgpio_offsets;
+
+	base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(base))
+		return PTR_ERR(base);
+
+	sgpio->regmap = devm_regmap_init_mmio(&pdev->dev, base,
+					      &axiado_sgpio_regmap_config);
+	if (IS_ERR(sgpio->regmap))
+		return dev_err_probe(&pdev->dev, PTR_ERR(sgpio->regmap),
+				     "Failed to init regmap\n");
+
+	rc = device_property_read_u32(&pdev->dev, "ngpios", &ngpio);
+	if (rc)
+		return dev_err_probe(&pdev->dev, rc,
+				     "Failed to read ngpios property\n");
+
+	/*
+	 * Each SGPIO signal is exposed as one input and one output line, so
+	 * the number of lines is twice the number of signals.
+	 */
+	if (!ngpio || ngpio % 2 || ngpio > SGPIO_MAX_SIGNALS * 2)
+		return dev_err_probe(&pdev->dev, -EINVAL,
+				     "Invalid ngpios value: %u (even, max %u)\n",
+				     ngpio, SGPIO_MAX_SIGNALS * 2);
+
+	sgpio->nsignals = ngpio / 2;
+
+	sgpio->din_shadow = devm_kcalloc(&pdev->dev,
+					 DIV_ROUND_UP(sgpio->nsignals,
+						      SGPIO_BANK_SIZE),
+					 sizeof(*sgpio->din_shadow), GFP_KERNEL);
+	sgpio->irq_unmasked = devm_bitmap_zalloc(&pdev->dev, sgpio->nsignals,
+						 GFP_KERNEL);
+	sgpio->irq_rising = devm_bitmap_zalloc(&pdev->dev, sgpio->nsignals,
+					       GFP_KERNEL);
+	sgpio->irq_falling = devm_bitmap_zalloc(&pdev->dev, sgpio->nsignals,
+						GFP_KERNEL);
+	if (!sgpio->din_shadow || !sgpio->irq_unmasked ||
+	    !sgpio->irq_rising || !sgpio->irq_falling)
+		return -ENOMEM;
+
+	apb_clk = devm_clk_get_enabled(&pdev->dev, NULL);
+	if (IS_ERR(apb_clk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(apb_clk),
+				     "Failed to get and enable APB clock\n");
+
+	rc = device_property_read_u32(&pdev->dev, "bus-frequency",
+				      &sgpio_freq);
+	if (rc)
+		return dev_err_probe(&pdev->dev, rc,
+				     "Failed to read bus-frequency\n");
+
+	apb_freq = clk_get_rate(apb_clk);
+
+	if (!apb_freq || !sgpio_freq || sgpio_freq > apb_freq)
+		return dev_err_probe(&pdev->dev, -EINVAL,
+				     "Invalid SGPIO bus frequency\n");
+
+	sgpio->preset_value = (apb_freq / sgpio_freq) - 1;
+	sgpio->count_value = sgpio->preset_value;
+
+	sgpio->pos_reg = SGPIO_POS(sgpio->nsignals - 1);
+
+	sgpio->din_bank_shift =	SGPIO_NUM_BANKS -
+				DIV_ROUND_UP(sgpio->nsignals, SGPIO_BANK_SIZE);
+
+	/*
+	 * From here on the hardware may be running, so the shutdown action has
+	 * to be in place before the first register is programmed. It only ever
+	 * writes zeroes, which is harmless if initialisation never got that
+	 * far, and it runs before the APB clock is disabled because that was
+	 * requested earlier.
+	 */
+	rc = devm_add_action_or_reset(&pdev->dev, axiado_sgpio_disable, sgpio);
+	if (rc)
+		return rc;
+
+	rc = axiado_sgpio_hw_init(sgpio);
+	if (rc)
+		return dev_err_probe(&pdev->dev, rc,
+				     "Failed to initialize hardware\n");
+
+	rc = axiado_sgpio_init_input_cache(sgpio);
+	if (rc)
+		return dev_err_probe(&pdev->dev, rc,
+				     "Failed to initialize input cache\n");
+
+	sgpio->dir_out = devm_bitmap_zalloc(&pdev->dev, ngpio, GFP_KERNEL);
+	if (!sgpio->dir_out)
+		return -ENOMEM;
+
+	/* Even lines are the serial inputs, odd lines the serial outputs. */
+	for (i = 1; i < ngpio; i += 2)
+		__set_bit(i, sgpio->dir_out);
+
+	d_info.fwnode = dev_fwnode(&pdev->dev);
+	d_info.size = ngpio;
+	d_info.hwirq_max = ngpio;
+	d_info.ops = &axiado_sgpio_domain_ops;
+	d_info.host_data = sgpio;
+
+	sgpio->domain = devm_irq_domain_instantiate(&pdev->dev, &d_info);
+	if (IS_ERR(sgpio->domain))
+		return PTR_ERR(sgpio->domain);
+
+	config.parent = &pdev->dev;
+	config.regmap = sgpio->regmap;
+	config.ngpio = ngpio;
+	config.reg_dat_base = GPIO_REGMAP_ADDR(sgpio->regs->din_ss);
+	config.reg_set_base = GPIO_REGMAP_ADDR(sgpio->regs->dout_ss);
+	config.reg_mask_xlate = axiado_sgpio_reg_mask_xlate;
+	config.fixed_direction_output = sgpio->dir_out;
+	config.irq_domain = sgpio->domain;
+	config.drvdata = sgpio;
+
+	sgpio->gpio = devm_gpio_regmap_register(&pdev->dev, &config);
+	if (IS_ERR(sgpio->gpio))
+		return dev_err_probe(&pdev->dev, PTR_ERR(sgpio->gpio),
+				     "Could not register gpiochip\n");
+
+	irq = platform_get_irq(pdev, 0);
+	if (irq < 0)
+		return irq;
+
+	rc = devm_request_threaded_irq(&pdev->dev, irq, NULL, axiado_sgpio_irq_handler,
+				       IRQF_ONESHOT, dev_name(&pdev->dev), sgpio);
+	if (rc)
+		return dev_err_probe(&pdev->dev, rc, "Failed to request IRQ\n");
+
+	rc = axiado_sgpio_irq_enable(sgpio);
+	if (rc)
+		return dev_err_probe(&pdev->dev, rc,
+				     "Failed to enable interrupts\n");
+
+	return 0;
+}
+
+static void axiado_sgpio_remove(struct platform_device *pdev)
+{
+	struct axiado_sgpio *sgpio = platform_get_drvdata(pdev);
+
+	/*
+	 * Runs before the devres unwind, so the interrupts are masked while the
+	 * parent interrupt is still requested. The shift engine is stopped by
+	 * axiado_sgpio_disable(), registered before the hardware was programmed
+	 * so that it also covers failures during probe.
+	 */
+	regmap_write(sgpio->regmap, sgpio->regs->mask, 0);
+}
+
+static const struct of_device_id axiado_sgpio_of_match[] = {
+	{ .compatible = "axiado,ax3005-sgpio" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, axiado_sgpio_of_match);
+
+static struct platform_driver axiado_sgpio_driver = {
+	.driver = {
+		.name = KBUILD_MODNAME,
+		.of_match_table = axiado_sgpio_of_match,
+	},
+	.probe = axiado_sgpio_probe,
+	.remove = axiado_sgpio_remove,
+};
+module_platform_driver(axiado_sgpio_driver);
+
+MODULE_DESCRIPTION("Axiado AX3005 Serial GPIO Driver");
+MODULE_AUTHOR("Axiado Corporation");
+MODULE_LICENSE("GPL");

-- 
2.34.1

