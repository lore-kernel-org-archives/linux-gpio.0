Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11022099.outbound.protection.outlook.com [40.107.209.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 967543BBFA1;
	Wed, 29 Jul 2026 07:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.99
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785308535; cv=fail; b=cxsE12Di8QekMXmmaG1f0j6bEhUw47NzwZ3PIjpwVqOjKOO0DB+nb/odpsaQMs/aForuKX4Z/e+Wen4DOTs5myfKS+sWdwstpU5YyBOsR1Kb0QazHvkjUXzb0lCP2HNQI5wzZ8f72Kf1HpGqJ66EaIoHSBYVsC1Mc6Ejo7IqOHw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785308535; c=relaxed/simple;
	bh=gu41BMQUXObzcCkp8CRxef+7ZWgXCwU2oD6y7g+cxXg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gpQNXOWhaTIXjbz9vU+mlKFzpRysw2H4k0+vuBuuDBfwlScADHWDsL9Rmt0euWPg5ztxtAnymvG24NqtZA7qpGtVud9rucLT8i7WGhExiW8Xh17JpQALLVgfcYwkYY3Muixzs7rrIThRfyj/vnKOE8ZI0FHZJY8/mH+HEh8lUWo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com; spf=pass smtp.mailfrom=axiado.com; dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b=TugRCvy9; arc=fail smtp.client-ip=40.107.209.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axiado.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b="TugRCvy9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PGqTbU9Vb/1zFga1E9d3aDIoRZ2z4xJ6/geGIYUMFJe0Nu+6OLIe2L1iaPsllGeOdYyNjUaJbr/cyT+oaDS+H+y2cAhzinyRiF4U582udIQqBOpHLTAWpAc7PxSK2UKoTJf6EGnP3iQyp6j3g2gMzrCj5nMOCDhrdFakOv67m8MP+RyJgTf9Mzk6ioSlAeAePgWKTmubtH63kkaKflCSkmTN54woUz6aB/GfQrzUsmOOR37NSItl9HcThmJO5I9K/DaE/B+wxAarr9UB17diIUymXYyH+rDVwPUeTRLicAAkbIN6Ha9wz7VGn3RdiSuUgjGO2KfVkZ4+PVrYDGipow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yp6HJ/M/gKo6BWfYlzfczKxcKIGNOWqobBVHeknXyMo=;
 b=N4eQiTK7hmiKzDhuMygKTDmzu5N+gMrce1du2ggDtnZGlXSjtz1JylYKdCnHHtdYGOpOdEU6anB1L525MAR4+p4srTv6jgAJ1Mh1zwkU4UCx5n4blfdGZ7kTiVmEJ4O47AvIgZEWtoji1DZdcnKROYraIuIK/LbDarf8D4aQtlLdAqM6PFSZJwv6kCuvwf8X2q0jOXQS1oNOv3nneM5YNaC6vsxe52cqfywzBOiCgWtlJ7zMaFXpW3TZC4keDV4DZGi5+zDIT6S4RgQbYZtnE7vRF37hIOcvthTTALmZtfsyZ8+Lk0RTSUPjWdJzchSuUyl2rBEFJa3xSfl8Om/DnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 64.62.143.114) smtp.rcpttodomain=axiado.com smtp.mailfrom=axiado.com;
 dmarc=none action=none header.from=axiado.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yp6HJ/M/gKo6BWfYlzfczKxcKIGNOWqobBVHeknXyMo=;
 b=TugRCvy9vpVoBoAjfnC+xm4BMnROYZprvrR6szjAG0iJ3ITZ+jhZFI2JGZI5KekjMhNK+ViwDqz7FnkvmnAb5llfnmHG6g5/VKPSoyAyS3FXicZbWq/Sd6KUrpT9ELZLhUhDnBlMsF3kne7MAqojME5XQNt0MZ6zfZBes1ADX9DZbgbES/iW+zZ+fLi4peJE8Zb3J/5b1+Wyzo7bgn7RbzqjCnGVPGOWR5k3DwBRsllvoji9++1qBwOvaA31jeMbZTfHd0+Y57CGDQ3TsdiyeHWrZCoNZR1SO1jSvWZ6qf187rSuaY7pmIsitJomww1GN0DSXTUtcm2APUXNYNy1zQ==
Received: from CH0PR03CA0303.namprd03.prod.outlook.com (2603:10b6:610:118::16)
 by MWHPR18MB988536.namprd18.prod.outlook.com (2603:10b6:303:29f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Wed, 29 Jul
 2026 07:02:07 +0000
Received: from DS2PEPF000061C8.namprd02.prod.outlook.com
 (2603:10b6:610:118:cafe::2b) by CH0PR03CA0303.outlook.office365.com
 (2603:10b6:610:118::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.13 via Frontend Transport; Wed,
 29 Jul 2026 07:02:07 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 64.62.143.114)
 smtp.mailfrom=axiado.com; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received-SPF: Fail (protection.outlook.com: domain of axiado.com does not
 designate 64.62.143.114 as permitted sender) receiver=protection.outlook.com;
 client-ip=64.62.143.114; helo=smtp.corp.axiado.com;
Received: from smtp.corp.axiado.com (64.62.143.114) by
 DS2PEPF000061C8.mail.protection.outlook.com (10.167.23.75) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.5
 via Frontend Transport; Wed, 29 Jul 2026 07:02:07 +0000
Received: from axz-uw1-build-vm02.corp.axiado.com (unknown [10.14.1.22])
	by smtp.corp.axiado.com (Postfix) with ESMTP id B0B5E4186B5D;
	Wed, 29 Jul 2026 00:02:06 -0700 (PDT)
From: Petar Stepanovic <pstepanovic@axiado.com>
Date: Wed, 29 Jul 2026 00:02:04 -0700
Subject: [PATCH v2 2/2] gpio: axiado: add SGPIO controller support
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260729-axiado-ax3000-sgpio-controller-v2-2-976f4ed11438@axiado.com>
References: <20260729-axiado-ax3000-sgpio-controller-v2-0-976f4ed11438@axiado.com>
In-Reply-To: <20260729-axiado-ax3000-sgpio-controller-v2-0-976f4ed11438@axiado.com>
To: Petar Stepanovic <pstepanovic@axiado.com>, 
 Tzu-Hao Wei <twei@axiado.com>, Swark Yang <syang@axiado.com>, 
 Prasad Bolisetty <pbolisetty@axiado.com>, Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Harshit Shah <hshah@axiado.com>, 
 SriNavmani A <srinavmani@axiado.com>, 
 Karthikeyan Mitran <kmitran@axiado.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785308526; l=23377;
 i=pstepanovic@axiado.com; s=20250916; h=from:subject:message-id;
 bh=gu41BMQUXObzcCkp8CRxef+7ZWgXCwU2oD6y7g+cxXg=;
 b=GH8SNDp90xq/5ayGAvKe5B2kJMDw56o3f+eFxxo/6wn5aNMExnhGIdzoUxPxgzC4LpHV3wtWz
 CML3aJymFYyAH9culwKvFZam9R8mqQEiNEzaeH5J9jYKs4S/FdEWTW7
X-Developer-Key: i=pstepanovic@axiado.com; a=ed25519;
 pk=70f1UJOGT9U11ZK6o+ENXtv0I5wBE3e+Y9YWODzRsdI=
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF000061C8:EE_|MWHPR18MB988536:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c257393-9c28-441e-b84c-08deed3f4da6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|82310400026|36860700016|1800799024|376014|56012099006|10067099003|3023799007|921020|18002099003|6133799003|22082099003;
X-Microsoft-Antispam-Message-Info:
	GScdYA+5ChJ1c+w8zv8rfShguh4znTyGlsfzCNgDvl+pnMUvreOPGsj1yXgAkm4YkW4WFNAzLo+B4gepu2njilOpM22a14NwrKm0HsennYpyQAx05dqPOz5DjfWGlkLIl29Z1J0UJYQifPJKEIjR1VyG010NsL/+oseHHhzuhUc30/3uflKo/NYMp75rIEtg2T6653LIkPAaA+YJ35k7xsrS54VU2kB1zQnabtuAM65hAovnv/O5KG0Qvo1f3XsLJOVapo9WDTnN21YUkzv3s9NZ01sGUlfTFxcrDfdWkzG5SfhjCU7gYxSKJ1MO5ewbDU1OZW0H46BTbZutMCSA+zSc5Wt9KB0kcQ5ib5NuYEuGALGGvCXBkXoHOQnb/qZ4ClMuTmlGTXt0U3R1ds+IlPrCSnlvenqhrgDTrdI3xI6fvzBBH4uRzRRD5vrLehaWemid5eBZEHO3Sfg1Nm5OQp224UpsDGUck6yWZYLEtVSdxLmaj1GpkeSJvwUNdKqUEzd1jtipbqA0RSu53haSSI7OJHGD8fczIL4dN6+K69YSDQocKLDJgMXQw/X4jGUfPz20g1NEpNYvYPXbYGHeHRTLE9oQGNBh+A7euJQnuP1mU3w3F8JTFKDdg/iUYBXEuTCeCWkTAI6Uf0t8O3/dPGYxO9xnv2eG+AdtqlOgiiHHT6PXTfmwlzIpPvZ83myqURCAOzxcXDc+Q+Igk2CoeK25lYj7iWwsAHZop+8Qqq0G1n5dsRU3UMvr3rhH4ptX
X-Forefront-Antispam-Report:
	CIP:64.62.143.114;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtp.corp.axiado.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(36860700016)(1800799024)(376014)(56012099006)(10067099003)(3023799007)(921020)(18002099003)(6133799003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	6A0jPdt3UH+Sz594q6Yy/RjIPp/dL4+weNIDoZ4amajisizepZ3tfslbFRbzEb4eNVPhX8nmXYdSixSELGR/z1E18vGNNN7zZbGns7uB6ExsHLfjBBvSV58rElA7VnuzB5sA53LJ+XDjCjIKDZXMO0GIWzFG12tb0k4QyPykxTNiizAc1grSpJ5KKTGc8gR87HzMjYhQY3EdOzcjg0W/epsLi1KvDgCIB/ksaIZdZkiJLMC8stZEFlyDirKOMQ4Fr0A/GrxFcCBf2tnBkfTpNIVlGxDhpk7P7aeNPaEt15TR3lbh2518g0vQr+vXHDIyodf6rNgpVZfm68fjBxVmmJqpSnUVL1RMFsqRSRuQErdTdGlGOplXEqf+TnKVTaAGe758K0w9C7T+fCUbC6FyKQkJcePByoOWb/WFOvmAe9GRNSW+RXWIl9+Pnzp7rAQf
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 07:02:07.2578
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c257393-9c28-441e-b84c-08deed3f4da6
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=ff2db17c-4338-408e-9036-2dee8e3e17d7;Ip=[64.62.143.114];Helo=[smtp.corp.axiado.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF000061C8.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR18MB988536

Add support for the Axiado SGPIO controller.

Each SGPIO position provides one input GPIO and one output GPIO with
fixed directions. The driver registers the controller as a gpio_chip,
supports interrupts on input GPIOs, and uses regmap for register access.

Signed-off-by: Petar Stepanovic <pstepanovic@axiado.com>
---
 MAINTAINERS                      |   1 +
 drivers/gpio/Kconfig             |  18 +
 drivers/gpio/Makefile            |   1 +
 drivers/gpio/gpio-axiado-sgpio.c | 795 +++++++++++++++++++++++++++++++++++++++
 4 files changed, 815 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index fc613271f435..dd556d9252bb 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4414,6 +4414,7 @@ M:	Prasad Bolisetty <pbolisetty@axiado.com>
 L:	linux-gpio@vger.kernel.org
 S:	Supported
 F:	Documentation/devicetree/bindings/gpio/axiado,sgpio.yaml
+F:	drivers/gpio/gpio-axiado-sgpio.c
 
 AXIS ARTPEC ARM64 SoC SUPPORT
 M:	Jesper Nilsson <jesper.nilsson@axis.com>
diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 28cf6d2e83c2..80db12d908bb 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -204,6 +204,24 @@ config GPIO_ATH79
 	  Select this option to enable GPIO driver for
 	  Atheros AR71XX/AR724X/AR913X SoC devices.
 
+config GPIO_AXIADO_SGPIO
+	bool "Axiado SGPIO support"
+	depends on OF_GPIO
+	depends on ARCH_AXIADO || COMPILE_TEST
+	select GPIOLIB_IRQCHIP
+	select REGMAP_MMIO
+	help
+	  Enable support for the Axiado Serial GPIO (SGPIO) controller.
+
+	  The SGPIO controller provides a serialized interface for
+	  controlling multiple GPIO signals over a limited number of
+	  physical lines. Each SGPIO position provides one fixed-direction
+	  input GPIO and one fixed-direction output GPIO. Interrupts are
+	  supported on input GPIOs.
+
+	  This driver integrates with the Linux GPIO subsystem and
+	  exposes the controller as a standard GPIO provider.
+
 config GPIO_RASPBERRYPI_EXP
 	tristate "Raspberry Pi 3 GPIO Expander"
 	default RASPBERRYPI_FIRMWARE
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index 4d0e900402fc..6ae73dbe7102 100644
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
index 000000000000..91e63239c99d
--- /dev/null
+++ b/drivers/gpio/gpio-axiado-sgpio.c
@@ -0,0 +1,795 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2022-2026 Axiado Corporation
+ */
+
+#include <linux/bitfield.h>
+#include <linux/cleanup.h>
+#include <linux/clk.h>
+#include <linux/gpio/driver.h>
+#include <linux/interrupt.h>
+#include <linux/irq.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/spinlock.h>
+#include <linux/types.h>
+
+struct sgpio_reg_offsets {
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
+static const struct sgpio_reg_offsets sgpio_offsets_512 = {
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
+static const struct sgpio_reg_offsets sgpio_offsets_128 = {
+	.mux_0 = 0x000,
+	.preset_0 = 0x08c,
+	.count_0 = 0x0a0,
+	.pos_0 = 0x0b4,
+
+	.mux_1 = 0x004,
+	.ld = 0x014,
+	.ld_ss = 0x048,
+
+	.preset_1 = 0x090,
+	.count_1 = 0x0a4,
+	.pos_1 = 0x0b8,
+
+	.mux_2 = 0x008,
+	.dout = 0x024,
+	.dout_ss = 0x068,
+
+	.preset_2 = 0x094,
+	.count_2 = 0x0a8,
+	.pos_2 = 0x0bc,
+
+	.mux_3 = 0x00c,
+	.preset_3 = 0x098,
+	.count_3 = 0x0ac,
+	.pos_3 = 0x0c0,
+
+	.mux_4 = 0x010,
+	.oe = 0x044,
+	.oe_ss = 0x088,
+
+	.preset_4 = 0x09c,
+	.count_4 = 0x0b0,
+	.pos_4 = 0x0c4,
+
+	.mask = 0x0d4,
+	.ctrl_en = 0x0c8,
+	.ctrl_en_pos = 0x0cc,
+
+	.din_ss = 0x078,
+	.status = 0x0d8,
+};
+
+#define MAX_SGPIO_PINS 512
+#define MAX_OFFSET_REG 16
+#define MAX_SLICE_COUNT 5
+
+struct ax3000_slice_info {
+	u32 out_mux;
+	u32 sgpio_mux;
+	u32 slice_mux;
+	u32 reg[MAX_OFFSET_REG];
+	u32 reg_ss[MAX_OFFSET_REG];
+	u32 preset;
+	u32 count;
+	u32 pos;
+};
+
+struct ax3000_sgpio {
+	u32 preset_value;
+	u32 count_value;
+	u32 pos_reg;
+	struct ax3000_slice_info
+		slices[MAX_SLICE_COUNT]; /* 0=clk,1=load,2=out,3=in,4=oe */
+	spinlock_t lock;
+	struct mutex output_lock;
+	u32 ngpios;
+	u32 max_sgpio_pins;
+	u32 max_offset_regs;
+	struct gpio_chip chip;
+	u32 irq_unmasked[MAX_SGPIO_PINS];
+	unsigned int irq_type[MAX_SGPIO_PINS];
+	struct regmap *regmap;
+	u32 regmap_base_offset;
+	const struct sgpio_reg_offsets *regs;
+};
+
+struct axiado_sgpio_soc_data {
+	const struct sgpio_reg_offsets *regs;
+	u32 max_sgpio_pins;
+	u32 max_offset_regs;
+};
+
+static const struct axiado_sgpio_soc_data ax3000_sgpio_data = {
+	.regs = &sgpio_offsets_128,
+	.max_sgpio_pins = 128,
+	.max_offset_regs = 4,
+};
+
+static const struct axiado_sgpio_soc_data ax3005_sgpio_data = {
+	.regs = &sgpio_offsets_512,
+	.max_sgpio_pins = 512,
+	.max_offset_regs = 16,
+};
+
+static int sgpio_set_irq_type(struct irq_data *d, unsigned int type);
+static void sgpio_mask_irq(struct irq_data *d);
+static void sgpio_unmask_irq(struct irq_data *d);
+static void sgpio_irq_shutdown(struct irq_data *d);
+
+static const struct irq_chip axiado_sgpio_irqchip = {
+	.name = "axiado-sgpio",
+	.irq_mask = sgpio_mask_irq,
+	.irq_unmask = sgpio_unmask_irq,
+	.irq_set_type = sgpio_set_irq_type,
+	.irq_shutdown = sgpio_irq_shutdown,
+	.flags = IRQCHIP_IMMUTABLE | IRQCHIP_MASK_ON_SUSPEND,
+	GPIOCHIP_IRQ_RESOURCE_HELPERS,
+};
+
+static int ax3000_sgpio_set(struct gpio_chip *chip, unsigned int offset,
+			     int value)
+{
+	struct ax3000_sgpio *sgpio = gpiochip_get_data(chip);
+	u32 position = (offset / 2) % 32;
+	u32 bank = (offset / 2) / 32;
+	u32 val;
+	int ret;
+
+	if (!(offset % 2))
+		return -EINVAL;
+
+	guard(mutex)(&sgpio->output_lock);
+
+	val = sgpio->slices[2].reg_ss[bank];
+
+	if (value)
+		val |= BIT(position);
+	else
+		val &= ~BIT(position);
+
+	ret = regmap_write(sgpio->regmap,
+			   sgpio->regmap_base_offset + sgpio->regs->dout_ss +
+			   bank * sizeof(u32), val);
+	if (ret)
+		return ret;
+
+	sgpio->slices[2].reg_ss[bank] = val;
+
+	return 0;
+}
+
+static int ax3000_sgpio_get_direction(struct gpio_chip *chip,
+				      unsigned int offset)
+{
+	if (!(offset % 2))
+		return GPIO_LINE_DIRECTION_IN;
+
+	return GPIO_LINE_DIRECTION_OUT;
+}
+
+static int ax3000_sgpio_get(struct gpio_chip *chip, unsigned int offset)
+{
+	struct ax3000_sgpio *sgpio = gpiochip_get_data(chip);
+	u32 position = (offset / 2) % 32;
+	u32 bank = (offset / 2) / 32;
+	u32 val;
+
+	if (!(offset % 2)) {
+		guard(spinlock_irqsave)(&sgpio->lock);
+
+		val = sgpio->slices[3].reg_ss[bank];
+	} else {
+		guard(mutex)(&sgpio->output_lock);
+
+		val = sgpio->slices[2].reg_ss[bank];
+	}
+
+	return !!(val & BIT(position));
+}
+
+static int ax3000_sgpio_dir_in(struct gpio_chip *chip, unsigned int offset)
+{
+	if (!(offset % 2))
+		return 0;
+
+	return -EINVAL;
+}
+
+static int ax3000_sgpio_dir_out(struct gpio_chip *chip, unsigned int offset,
+				int value)
+{
+	/* Even offsets represent input GPIOs. */
+	if (!(offset % 2))
+		return -EINVAL;
+
+	return ax3000_sgpio_set(chip, offset, value);
+}
+
+static irqreturn_t sgpio_irq_handler(int irq, void *arg)
+{
+	struct ax3000_sgpio *sgpio = (struct ax3000_sgpio *)arg;
+	u32 status, new_value;
+	u32 changed_value;
+	int bit, reg_ptr;
+	int ret, i;
+
+	/* Read-on-clear (ACK) parent cause */
+	ret = regmap_read(sgpio->regmap,
+			  sgpio->regmap_base_offset + sgpio->regs->status,
+			  &status);
+	if (ret)
+		return IRQ_NONE;
+
+	status >>= 16;
+
+	bool has_shifted_layout = (sgpio->max_offset_regs == MAX_OFFSET_REG);
+
+	reg_ptr = has_shifted_layout ? 16 - DIV_ROUND_UP(sgpio->ngpios, 32) : 0;
+
+	for (i = 0; i < DIV_ROUND_UP(sgpio->ngpios, 32); i++, reg_ptr++) {
+		if (status & BIT(reg_ptr)) {
+			ret = regmap_read(sgpio->regmap,
+					  sgpio->regmap_base_offset +
+					  sgpio->regs->din_ss +
+					  reg_ptr * sizeof(u32),
+					  &new_value);
+			if (ret)
+				continue;
+
+			{
+				guard(spinlock_irqsave)(&sgpio->lock);
+				changed_value = sgpio->slices[3].reg_ss[i] ^ new_value;
+				sgpio->slices[3].reg_ss[i] = new_value;
+			}
+
+			while (changed_value) {
+				irq_hw_number_t hwirq;
+				unsigned int position;
+				unsigned int type;
+				bool rising;
+
+				bit = __ffs(changed_value);
+				changed_value &= ~BIT(bit);
+
+				position = i * 32 + bit;
+				hwirq = position * 2;
+
+				rising = !!(new_value & BIT(bit));
+				type = READ_ONCE(sgpio->irq_type[position]);
+
+				if (rising &&
+				    !(type & IRQ_TYPE_EDGE_RISING))
+					continue;
+
+				if (!rising &&
+				    !(type & IRQ_TYPE_EDGE_FALLING))
+					continue;
+
+				if (READ_ONCE(sgpio->irq_unmasked[position])) {
+					unsigned int child_irq;
+
+					child_irq = irq_find_mapping(sgpio->chip.irq.domain,
+								     hwirq);
+					if (child_irq)
+						handle_nested_irq(child_irq);
+				}
+			}
+		}
+	}
+
+	return IRQ_HANDLED;
+}
+
+static void sgpio_hw_init(struct ax3000_sgpio *sgpio)
+{
+	bool has_shifted_layout = (sgpio->max_offset_regs == MAX_OFFSET_REG);
+	u32 position;
+	u32 bank;
+	int i;
+
+	regmap_write(sgpio->regmap,
+		     sgpio->regmap_base_offset + sgpio->regs->mask, 0);
+
+	/* slice A0, Clock Pin - 0 */
+	regmap_write(sgpio->regmap,
+		     sgpio->regmap_base_offset + sgpio->regs->mux_0, 0x306);
+	regmap_write(sgpio->regmap,
+		     sgpio->regmap_base_offset + sgpio->regs->preset_0,
+		     sgpio->preset_value);
+	regmap_write(sgpio->regmap,
+		     sgpio->regmap_base_offset + sgpio->regs->count_0,
+		     sgpio->count_value);
+	regmap_write(sgpio->regmap,
+		     sgpio->regmap_base_offset + sgpio->regs->pos_0, 0x1f001f);
+
+	/* Slice B1, Data Load Pin - 1 */
+	bank = (sgpio->ngpios - 1) / 32;
+	position = (sgpio->ngpios - 1) % 32;
+
+	regmap_write(sgpio->regmap,
+		     sgpio->regmap_base_offset + sgpio->regs->mux_1,
+		     has_shifted_layout ? 0x30c : 0x304);
+
+	for (i = 0; i < bank; i++) {
+		regmap_write(sgpio->regmap,
+			     sgpio->regmap_base_offset + sgpio->regs->ld +
+				     (i * 4),
+			     0xffffffff);
+		regmap_write(sgpio->regmap,
+			     sgpio->regmap_base_offset + sgpio->regs->ld_ss +
+				     (i * 4),
+			     0xffffffff);
+	}
+
+	if (position) {
+		u32 val;
+
+		val = sgpio->slices[1].reg_ss[i];
+		val |= GENMASK(position, 0);
+
+		regmap_write(sgpio->regmap,
+			     sgpio->regmap_base_offset + sgpio->regs->ld +
+				     (i * 4),
+			     val);
+		regmap_write(sgpio->regmap,
+			     sgpio->regmap_base_offset + sgpio->regs->ld_ss +
+				     (i * 4),
+			     val);
+	}
+
+	regmap_write(sgpio->regmap,
+		     sgpio->regmap_base_offset + sgpio->regs->preset_1,
+		     sgpio->preset_value);
+	regmap_write(sgpio->regmap,
+		     sgpio->regmap_base_offset + sgpio->regs->count_1,
+		     sgpio->count_value);
+	regmap_write(sgpio->regmap,
+		     sgpio->regmap_base_offset + sgpio->regs->pos_1,
+		     sgpio->pos_reg);
+
+	/* Slice C2, Data Out Pin - 2 */
+	bank = sgpio->ngpios / 32;
+	position = sgpio->ngpios % 32;
+
+	regmap_write(sgpio->regmap,
+		     sgpio->regmap_base_offset + sgpio->regs->mux_2,
+		     has_shifted_layout ? 0x30c : 0x304);
+
+	for (i = 0; i < bank; i++) {
+		regmap_write(sgpio->regmap,
+			     sgpio->regmap_base_offset + sgpio->regs->dout +
+				     (i * 4),
+			     sgpio->slices[2].reg_ss[i]);
+		regmap_write(sgpio->regmap,
+			     sgpio->regmap_base_offset + sgpio->regs->dout_ss +
+				     (i * 4),
+			     sgpio->slices[2].reg_ss[i]);
+	}
+
+	if (position) {
+		regmap_write(sgpio->regmap,
+			     sgpio->regmap_base_offset + sgpio->regs->dout +
+				     (i * 4),
+			     sgpio->slices[2].reg_ss[i]);
+		regmap_write(sgpio->regmap,
+			     sgpio->regmap_base_offset + sgpio->regs->dout_ss +
+				     (i * 4),
+			     sgpio->slices[2].reg_ss[i]);
+	}
+
+	regmap_write(sgpio->regmap,
+		     sgpio->regmap_base_offset + sgpio->regs->preset_2,
+		     sgpio->preset_value);
+	regmap_write(sgpio->regmap,
+		     sgpio->regmap_base_offset + sgpio->regs->count_2,
+		     sgpio->count_value);
+	regmap_write(sgpio->regmap,
+		     sgpio->regmap_base_offset + sgpio->regs->pos_2,
+		     sgpio->pos_reg);
+
+	/* Slice D3, Data In Pin - 3 */
+	regmap_write(sgpio->regmap,
+		     sgpio->regmap_base_offset + sgpio->regs->mux_3, 0x14C);
+	regmap_write(sgpio->regmap,
+		     sgpio->regmap_base_offset + sgpio->regs->preset_3,
+		     sgpio->preset_value);
+	regmap_write(sgpio->regmap,
+		     sgpio->regmap_base_offset + sgpio->regs->count_3,
+		     sgpio->count_value);
+	regmap_write(sgpio->regmap,
+		     sgpio->regmap_base_offset + sgpio->regs->pos_3,
+		     sgpio->pos_reg);
+
+	/* Slice E4, Output Enable for respective pins */
+	regmap_write(sgpio->regmap,
+		     sgpio->regmap_base_offset + sgpio->regs->mux_4,
+		     has_shifted_layout ? 0x10c : 0x104);
+	regmap_write(sgpio->regmap, sgpio->regmap_base_offset + sgpio->regs->oe,
+		     0xffffffff);
+	regmap_write(sgpio->regmap,
+		     sgpio->regmap_base_offset + sgpio->regs->oe_ss,
+		     0xffffffff);
+	regmap_write(sgpio->regmap,
+		     sgpio->regmap_base_offset + sgpio->regs->preset_4,
+		     sgpio->preset_value);
+	regmap_write(sgpio->regmap,
+		     sgpio->regmap_base_offset + sgpio->regs->count_4,
+		     sgpio->count_value);
+	regmap_write(sgpio->regmap,
+		     sgpio->regmap_base_offset + sgpio->regs->pos_4, 0x1f001f);
+	regmap_write(sgpio->regmap,
+		     sgpio->regmap_base_offset + sgpio->regs->ctrl_en, 0xffff);
+	regmap_write(sgpio->regmap,
+		     sgpio->regmap_base_offset + sgpio->regs->ctrl_en_pos,
+		     0xffff);
+}
+
+static int axiado_sgpio_irq_enable(struct ax3000_sgpio *sgpio)
+{
+	return regmap_write(sgpio->regmap,
+			    sgpio->regmap_base_offset + sgpio->regs->mask,
+			    0xdfff);
+}
+
+static int sgpio_set_irq_type(struct irq_data *d, unsigned int type)
+{
+	struct gpio_chip *chip = irq_data_get_irq_chip_data(d);
+	struct ax3000_sgpio *sgpio = gpiochip_get_data(chip);
+	irq_hw_number_t hwirq = irqd_to_hwirq(d);
+	unsigned int position;
+
+	/* Only even GPIO offsets represent SGPIO inputs. */
+	if (hwirq & 1)
+		return -EINVAL;
+
+	position = hwirq / 2;
+	if (position >= sgpio->ngpios)
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
+	WRITE_ONCE(sgpio->irq_type[position], type);
+	irq_set_handler_locked(d, handle_edge_irq);
+
+	return 0;
+}
+
+static void sgpio_mask_irq(struct irq_data *d)
+{
+	struct gpio_chip *chip = irq_data_get_irq_chip_data(d);
+	struct ax3000_sgpio *sgpio = gpiochip_get_data(chip);
+	irq_hw_number_t hwirq = irqd_to_hwirq(d);
+
+	WRITE_ONCE(sgpio->irq_unmasked[hwirq / 2], 0);
+	gpiochip_disable_irq(chip, hwirq);
+}
+
+static void sgpio_unmask_irq(struct irq_data *d)
+{
+	struct gpio_chip *chip = irq_data_get_irq_chip_data(d);
+	struct ax3000_sgpio *sgpio = gpiochip_get_data(chip);
+	irq_hw_number_t hwirq = irqd_to_hwirq(d);
+
+	gpiochip_enable_irq(chip, hwirq);
+	WRITE_ONCE(sgpio->irq_unmasked[hwirq / 2], 1);
+}
+
+static void sgpio_irq_shutdown(struct irq_data *d)
+{
+	sgpio_mask_irq(d);
+}
+
+static void axiado_sgpio_irq_init_valid_mask(struct gpio_chip *chip,
+					 unsigned long *valid_mask,
+					 unsigned int ngpios)
+{
+	unsigned int offset;
+
+	/* Only even offsets represent input GPIOs. */
+	for (offset = 1; offset < ngpios; offset += 2)
+		clear_bit(offset, valid_mask);
+}
+
+static int axiado_sgpio_init_input_cache(struct ax3000_sgpio *sgpio)
+{
+	unsigned int num_banks = DIV_ROUND_UP(sgpio->ngpios, 32);
+	unsigned int reg_ptr;
+	unsigned int i;
+	int ret;
+
+	reg_ptr = sgpio->max_offset_regs == MAX_OFFSET_REG ?
+		  MAX_OFFSET_REG - num_banks : 0;
+
+	for (i = 0; i < num_banks; i++, reg_ptr++) {
+		ret = regmap_read(sgpio->regmap,
+				  sgpio->regmap_base_offset +
+				  sgpio->regs->din_ss +
+				  reg_ptr * sizeof(u32),
+				  &sgpio->slices[3].reg_ss[i]);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static const struct regmap_config regmap_config = {
+	.reg_bits = 32,
+	.val_bits = 32,
+	.reg_stride = 4,
+};
+
+static int sgpio_probe(struct platform_device *pdev)
+{
+	const struct axiado_sgpio_soc_data *soc_data;
+	struct gpio_irq_chip *girq;
+	struct ax3000_sgpio *sgpio;
+	unsigned long apb_freq;
+	struct clk *apb_clk;
+	void __iomem *base;
+	u32 sgpio_freq;
+	int irq, rc;
+	u32 pos;
+
+	sgpio = devm_kzalloc(&pdev->dev, sizeof(*sgpio), GFP_KERNEL);
+	if (!sgpio)
+		return -ENOMEM;
+
+	spin_lock_init(&sgpio->lock);
+	mutex_init(&sgpio->output_lock);
+
+	sgpio->regmap = dev_get_regmap(pdev->dev.parent, NULL);
+
+	if (sgpio->regmap) {
+		rc = device_property_read_u32(&pdev->dev, "reg",
+					      &sgpio->regmap_base_offset);
+		if (rc)
+			return dev_err_probe(&pdev->dev, rc,
+					     "Failed to read reg property\n");
+
+		dev_info(&pdev->dev, "Using regmap with base offset: 0x%x\n",
+			 sgpio->regmap_base_offset);
+	} else {
+		base = devm_platform_ioremap_resource(pdev, 0);
+		if (IS_ERR(base))
+			return PTR_ERR(base);
+
+		sgpio->regmap =
+			devm_regmap_init_mmio(&pdev->dev, base, &regmap_config);
+
+		if (IS_ERR(sgpio->regmap))
+			return PTR_ERR(sgpio->regmap);
+
+		sgpio->regmap_base_offset = 0;
+
+		dev_info(&pdev->dev, "Using MMIO regmap\n");
+	}
+
+	rc = device_property_read_u32(&pdev->dev, "ngpios", &sgpio->ngpios);
+	if (rc)
+		return dev_err_probe(&pdev->dev, rc,
+				     "Failed to read ngpios property\n");
+
+	soc_data = device_get_match_data(&pdev->dev);
+	if (!soc_data)
+		return -EINVAL;
+
+	sgpio->regs = soc_data->regs;
+	sgpio->max_sgpio_pins = soc_data->max_sgpio_pins;
+	sgpio->max_offset_regs = soc_data->max_offset_regs;
+
+	if (!sgpio->ngpios ||
+	    (sgpio->ngpios != 128 && sgpio->ngpios != 512) ||
+	    sgpio->ngpios > sgpio->max_sgpio_pins)
+		return dev_err_probe(&pdev->dev, -EINVAL,
+				     "Invalid ngpios value: %u\n",
+				     sgpio->ngpios);
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
+	pos = sgpio->ngpios - 1;
+	sgpio->pos_reg = FIELD_PREP(GENMASK(31, 16), pos) |
+			 FIELD_PREP(GENMASK(15, 0), pos);
+
+	sgpio_hw_init(sgpio);
+
+	rc = axiado_sgpio_init_input_cache(sgpio);
+	if (rc)
+		return dev_err_probe(&pdev->dev, rc,
+				     "Failed to initialize input cache\n");
+
+	irq = platform_get_irq(pdev, 0);
+	if (irq < 0)
+		return irq;
+
+	rc = devm_request_threaded_irq(&pdev->dev, irq, NULL, sgpio_irq_handler,
+				       IRQF_ONESHOT, dev_name(&pdev->dev), sgpio);
+
+	if (rc)
+		return dev_err_probe(&pdev->dev, rc, "Failed to request IRQ\n");
+
+	sgpio->chip.parent = &pdev->dev;
+	sgpio->chip.ngpio = sgpio->ngpios * 2;
+	sgpio->chip.get_direction = ax3000_sgpio_get_direction;
+	sgpio->chip.direction_input = ax3000_sgpio_dir_in;
+	sgpio->chip.direction_output = ax3000_sgpio_dir_out;
+	sgpio->chip.get = ax3000_sgpio_get;
+	sgpio->chip.set = ax3000_sgpio_set;
+	sgpio->chip.can_sleep = true;
+	sgpio->chip.label = dev_name(&pdev->dev);
+	sgpio->chip.base = -1;
+
+	girq = &sgpio->chip.irq;
+
+	gpio_irq_chip_set_chip(girq, &axiado_sgpio_irqchip);
+	girq->handler = handle_bad_irq;
+	girq->default_type = IRQ_TYPE_NONE;
+	girq->init_valid_mask = axiado_sgpio_irq_init_valid_mask;
+	girq->threaded = true;
+	girq->parent_handler = NULL;
+	girq->num_parents = 0;
+	girq->parents = NULL;
+
+	rc = devm_gpiochip_add_data(&pdev->dev, &sgpio->chip, sgpio);
+	if (rc < 0)
+		return dev_err_probe(&pdev->dev, rc,
+				     "Could not register gpiochip\n");
+
+	rc = axiado_sgpio_irq_enable(sgpio);
+	if (rc)
+		return dev_err_probe(&pdev->dev, rc,
+				     "Failed to enable interrupts\n");
+
+	platform_set_drvdata(pdev, sgpio);
+
+	return 0;
+}
+
+static void sgpio_remove(struct platform_device *pdev)
+{
+	struct ax3000_sgpio *sgpio = platform_get_drvdata(pdev);
+
+	/* Disable interrupts in hardware */
+	if (sgpio->regs) {
+		regmap_write(sgpio->regmap,
+			     sgpio->regmap_base_offset + sgpio->regs->mask,
+			     0x0);
+		regmap_write(sgpio->regmap,
+			     sgpio->regmap_base_offset + sgpio->regs->ctrl_en,
+			     0x0);
+	}
+}
+
+static const struct of_device_id axiado_sgpio_of_match[] = {
+	{ .compatible = "axiado,ax3000-sgpio", .data = &ax3000_sgpio_data },
+	{ .compatible = "axiado,ax3005-sgpio", .data = &ax3005_sgpio_data },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, axiado_sgpio_of_match);
+
+static struct platform_driver sgpio_driver = {
+	.driver = {
+		.name = KBUILD_MODNAME,
+		.of_match_table = axiado_sgpio_of_match,
+	},
+	.probe = sgpio_probe,
+	.remove = sgpio_remove,
+};
+
+module_platform_driver(sgpio_driver);
+MODULE_DESCRIPTION("Axiado Serial GPIO Driver");
+MODULE_AUTHOR("Axiado Corporation");
+MODULE_LICENSE("GPL");

-- 
2.34.1

