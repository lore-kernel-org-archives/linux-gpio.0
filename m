Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2138.outbound.protection.partner.outlook.cn [139.219.146.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA72C3D7A0F;
	Sat, 17 Oct 2026 05:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792214837; cv=fail; b=a4ygQSaq1ToLOb5tPifs4m+EO9jFkCZIsiyDPkRdpP97chJnR5hoIAiPeCjLSHiweIL+2+koyD3Jyr7PHfLzjBwvi0d6u6Y6nK/Kv3YiSjUgkE04urqi4LwnXxmfCie+BOOttlapJ2XTkUScK3kEvsPc3q9KsHavYbme2UoANEE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792214837; c=relaxed/simple;
	bh=uJQtQiRozmpTnkyqfNVM/wqq0sws6ZwySXMxnnyyruM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ovIt9gxs7DKjdNvmnavjn06qgfFZBX+NZC7JMFRpCQyS/6uE5DWpiLjZYvxcLZp0jWeZtHgTH0mJBuL4BeGVL1m4fSkjWmgZ8heSfewSsHDr9tFfPw55wmeTtPfhS67F/W4b7nd5hn32kSB/iMqKI/1wmN+gBUp1zaMf9SOaCC0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lwghSxDmjkisKJyiHRT7Cymzt1jrOJdm/MQ7A0A+QlZEHbM0P5/DWNohh2wdfxyrNNysqNoCcQOlgKr+ffWVkl/tRqty684DaIz/959x1I3Po4xsj+Ym1SaJChTVCCPCiZ6F6B4DU8qv30JdENHW7q2GuWaOZ15m/bvfTB8xxGSvC4mjcqxb3JXfimEr1Ou+HPITOverkIStrkysGgWcNztpPeHR1AxxnxeZsYVWMZsp2ZTjS9cY/IXsTOhtLXy9aGT1H4pZcDDPLyw8d6BsR6BGNoUsK00vsbvb6XZRx6Af5pNbsYcnUOM+3vTJQRlFCzn+2n8kN7u+XtvUaaKHjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IttzzPfdCeOTx6nD/ulxWS4SWWI92GtSiIJ+mQufLRY=;
 b=IKLBjK1ofRf9TqaZrFs9vcfi+VZFpT9m1DkitqwGEAh9YlxL8UWlZbX5ChXG90sV1Wk2jzTN3xwjypIo0rLfCBdRj6d14ePuQBILRV/QqjWp/c6iQ83YbNWQ2d5Gk6kg4HbH+FcROR2jOJ5lnk5bKgyhJzbtS30fnTK9RBgSdLnIO5nyZFo+JW93ZaCdDepHQsPQjp3YjtOP4uYthgCBHt7EYM4t6l4fK7qoxJz4HrzkrHBnvAdYJnPLaJ2tIcMqmSvmLrtsxzzhku/hmpp88MSY4ghFql5yz9qFzhRA5XIEbd5BbTvt3A1qmlxfQCzx8zkf5oLKprDmBr6uXgBhTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1220.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:14::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.17; Sat, 17 Oct
 2026 05:25:50 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0522.016; Sat, 17 Oct 2026 05:25:50 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>,
	Changhuang Liang <changhuang.liang@starfivetech.com>
Subject: [PATCH v1 8/8] pinctrl: starfive: Add StarFive JHB100 vga controller driver
Date: Fri, 16 Oct 2026 22:25:34 -0700
Message-Id: <20261017052534.115203-9-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261017052534.115203-1-changhuang.liang@starfivetech.com>
References: <20261017052534.115203-1-changhuang.liang@starfivetech.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: NT0PR01CA0031.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:c::14) To ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1220:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c6e4d69-3947-4094-622a-08df2c0f1b33
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|366016|52116014|376014|38350700014|56012099006|5023799004|261009223027099003|10067099003|18002099003|22082099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	AmuBeMJW3iEzspcEZVXBPuLPBIHNyilTBToQrWWOcvIPzMTk8mzLyBDJOWxvnoKaDyeVDlnea5wb0WcDht2mKtBIY1WCAYquEVUI4PNjo0b5Wcb1HB8JVbi8/h84S0mwkOmt08fiP8O8TMX76SiMp1U3ptnOmj4C8kbXgI29yrBVaByhCtYvs8axDVb8XUI/zYco1DhJoeLzctVnJazlkDhIg58TxqFxprVoSdvIqdlTVGZiXmYe3OR08cvYiPDjC3L1ARYNxMfsPo2VfsJqM8kRkS7R78+0+GXfMeuUP2JArlQvxfzyfvMIjYioM9VKlbXSCKQFE7HM/KkeyUYVb49hE/2sxhnMvMGghif3ZWqe0EvhUM/qOqvUlXOP1fcUkXMmbikprKCoAf3qrFOGI0Kf4oPdTdiILhsVtHZIuJP8Sl0cgq+/ehGNyJc59qTQlKJ7bLg/8DLDmc1tdgrL1FMKppJjU8ipHTQqcuO3ZXFWxGJX66xVKQhAq/6t8lzjnobjnTRz95iLFzx9m+DKDhEdiYggnKtIJ8dPcHFPHUIDCeLkzqRYWRDPjSAX9McM
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(52116014)(376014)(38350700014)(56012099006)(5023799004)(261009223027099003)(10067099003)(18002099003)(22082099003)(6133799003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?AXppqJCXfYDszY7swMq//Jqd9A+K5py/E2f+vplnScm0CETDN697YeSrZgfF?=
 =?us-ascii?Q?78eS2GsZSf9gkpatWrkAIqderrkWFy4vjRR+enoTVGRGcjmLX2dC5WYlOuOx?=
 =?us-ascii?Q?BC6wKArmwN8eLK9kF7GS93wsLcHrzkR+cl4VSEFBWS7Zi5KGtVAJxJL84Hlz?=
 =?us-ascii?Q?jBiEVhLyJEPpYdj0IHJUcY9kqkummzjSCkGhJYG8uKcLjQgjKJzDguLVmtaj?=
 =?us-ascii?Q?pMZximHLHf585nJ+wdt4BLcmONCZ0EGVx9MTeAq6PI0CHBKO/dD+s7sUdsax?=
 =?us-ascii?Q?w5i923ccDxPYb2d12p8EXuWdmV0lCGVa9WXji2fPy4rniEjFmTHJv12bMNUg?=
 =?us-ascii?Q?Fh6aCo1w4Wn48Pb1b9AbTwo7NwU7j5QrlVgRfiraiCq82HC5eu96f5l4ux+3?=
 =?us-ascii?Q?P3yYemTn4c3gdGaOqNBDhxyVctbUR3JZ2tcVIvVasAv2cciZYsoOD+u2/FzV?=
 =?us-ascii?Q?4aLXO0jKTy1SsXDzqVf5Ado2Kpt3bXlr+Jb6tIBmX/aNNbbG6rrNpPPtqQrk?=
 =?us-ascii?Q?/mF9DSbPStEHbdDWABHT4hfixoa/QY9HB4ac9Xpt5NEfQseBlVFbt3suJ33f?=
 =?us-ascii?Q?ELCCThBz4JvGZITOSQD8BnMI0+WNiI/3pzEqkoiQj88wYKxKRlEWluw4RrYI?=
 =?us-ascii?Q?ldPgWNHTleYYm6ZGB7GcDCArdi0TT2OGAPhBrd5gpEsSoFPThZ0VsETSlf9c?=
 =?us-ascii?Q?/RZikpGstOVmd9Ng5j0xS56nVgQFlJRmL+7ouLj3hO9EGwifYbE23gtaBIeo?=
 =?us-ascii?Q?zpPr9t1a5uuxwRmU+FUoNmenVU599t/v4BACiJE/XN/YNja+8mYCnGEK4uFH?=
 =?us-ascii?Q?ZC3GmvVwYLm0UpcSYAzO9QJGsN5yb/Kew0ChVlrFi31w3pgi1O5dGlwR84Rw?=
 =?us-ascii?Q?XcIGqmCd5YPWQ7EY32e9YUBdtyuYcynS8oOcBEPY1Io39IaklxVghIJ1eXya?=
 =?us-ascii?Q?1G12YFnM92xv0kaQ3exwvPfyJrRobMJdiYSdce1JPeAxI/eMgUZOxqJlK9dt?=
 =?us-ascii?Q?bl67Y/W2Qp0uc4YgMxrrZzhb/IYiVgkRyERvSHOPA4bNoTiX4PpOcfUCZs8d?=
 =?us-ascii?Q?QWUv+NZIwb6szWiiedvnS0r3jwU5ji8UJbzakZHmyTTKtKeFzT6KHSDf+6sU?=
 =?us-ascii?Q?AymirzSL+Zn0XEdIrpQos35N3uukmUEjiESzjPFPbMN25MoLpt0l0CnhwiAk?=
 =?us-ascii?Q?JhZBzHG7auAHyzUSIELUMetrEqxZ3/mmNhVY0h47ueGDNI8M05bHZdOal/jo?=
 =?us-ascii?Q?nk75tcIopFueuqzMI86EH9oJdaYio7p0FW7flWnZBnnDphU5/4pk1o0wcAzA?=
 =?us-ascii?Q?fqY8iULZHngQ7BCgkyOLeXaI8ysNGbjrBkTjTXNISsIXHIuJJ4f2SkB/N842?=
 =?us-ascii?Q?Ld/Wbc7EGrgInYFAkV3aJIAMQ+Mg05ZcUOUgWdXQA2Qpypput0W35HSxpKe4?=
 =?us-ascii?Q?efMdUdNPPAf2/OWDPNAYZvAZKsvFEAyhW6+v1aWalWHGDpArczGMYV7iEmUg?=
 =?us-ascii?Q?APGDvLRmn2rAweClz4i5eshTlQNLkqMnBCW8ZDC6dpX0KDnxcklMm/Z346dW?=
 =?us-ascii?Q?ZDkMo0VPnKP+30uwkboBWWaPAbXbkajtTc260V4glPFKb35Vrnz+00d1woie?=
 =?us-ascii?Q?cuHI/4DYjX+fm5RYzUk9TIL7+2y2T3/R01UJwFU+Jh3K1A8cxmTgugXu7FuG?=
 =?us-ascii?Q?Chy6qaoQgEkpEmAOsNobQJTNws/TD0GoTqzZaZH8fF8FXO7C73AujyVnErXD?=
 =?us-ascii?Q?jRf9y2AhJLORPHsny49i/EvB0j/E0xQXzLKevVW1XIlM/ylKMH07?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c6e4d69-3947-4094-622a-08df2c0f1b33
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2026 05:25:50.3166
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pD+7bwHUpVypBHcDV+dWJNlKJNwcrCCMyIDF99uWX/nrLd+/yOUx6G/G7w55dftYHnvSdWcqbjbioNV+w4nyLEbQ/Ki7xMnWdymrfFQZwBVjjC8mgaeVen7bU2AtcFu1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1220

Add pinctrl driver for StarFive JHB100 SoC VGA(vga) pinctrl
controller.

Co-developed-by: Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
Signed-off-by: Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
Signed-off-by: Alex Soo <yuklin.soo@starfivetech.com>
Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 drivers/pinctrl/starfive/Kconfig              | 11 +++
 drivers/pinctrl/starfive/Makefile             |  1 +
 .../starfive/pinctrl-starfive-jhb100-vga.c    | 86 +++++++++++++++++++
 3 files changed, 98 insertions(+)
 create mode 100644 drivers/pinctrl/starfive/pinctrl-starfive-jhb100-vga.c

diff --git a/drivers/pinctrl/starfive/Kconfig b/drivers/pinctrl/starfive/Kconfig
index 76f2d59e8a8d..5b10b0a22078 100644
--- a/drivers/pinctrl/starfive/Kconfig
+++ b/drivers/pinctrl/starfive/Kconfig
@@ -185,3 +185,14 @@ config PINCTRL_STARFIVE_JHB100_SYS2
 	  This also provides an interface to the GPIO pins not used by other
 	  peripherals supporting inputs, outputs, configuring pull-up/pull-down
 	  and interrupts on input changes.
+
+config PINCTRL_STARFIVE_JHB100_VGA
+	tristate "StarFive JHB100 SoC VGA pinctrl and GPIO driver"
+	depends on ARCH_STARFIVE || COMPILE_TEST
+	select PINCTRL_STARFIVE_JHB100
+	default m if ARCH_STARFIVE
+	help
+	  Say yes here to support VGA pin control on the StarFive JHB100 SoC.
+	  This also provides an interface to the GPIO pins not used by other
+	  peripherals supporting inputs, outputs, configuring pull-up/pull-down
+	  and interrupts on input changes.
diff --git a/drivers/pinctrl/starfive/Makefile b/drivers/pinctrl/starfive/Makefile
index d570b192b260..170b24a7f29f 100644
--- a/drivers/pinctrl/starfive/Makefile
+++ b/drivers/pinctrl/starfive/Makefile
@@ -19,3 +19,4 @@ obj-$(CONFIG_PINCTRL_STARFIVE_JHB100_SYS0)	+= pinctrl-starfive-jhb100-sys0.o
 obj-$(CONFIG_PINCTRL_STARFIVE_JHB100_SYS0H)	+= pinctrl-starfive-jhb100-sys0h.o
 obj-$(CONFIG_PINCTRL_STARFIVE_JHB100_SYS1)	+= pinctrl-starfive-jhb100-sys1.o
 obj-$(CONFIG_PINCTRL_STARFIVE_JHB100_SYS2)	+= pinctrl-starfive-jhb100-sys2.o
+obj-$(CONFIG_PINCTRL_STARFIVE_JHB100_VGA)	+= pinctrl-starfive-jhb100-vga.o
diff --git a/drivers/pinctrl/starfive/pinctrl-starfive-jhb100-vga.c b/drivers/pinctrl/starfive/pinctrl-starfive-jhb100-vga.c
new file mode 100644
index 000000000000..8cdabd91016f
--- /dev/null
+++ b/drivers/pinctrl/starfive/pinctrl-starfive-jhb100-vga.c
@@ -0,0 +1,86 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Pinctrl / GPIO driver for StarFive JHB100 SoC VGA domain
+ *
+ * Copyright (C) 2024 StarFive Technology Co., Ltd.
+ * Author: Alex Soo <yuklin.soo@starfivetech.com>
+ *
+ */
+
+#include <linux/platform_device.h>
+
+#include "pinctrl-starfive-jhb100.h"
+
+static const struct jhb100_pin_layout_desc jhb100_vga_pl_desc[] = {
+	{ .pin_start = 0, .pin_cnt = 1, .name = "hsync", .gpio_func_sel = 1 },
+	{ .pin_start = 1, .pin_cnt = 1, .name = "vsync", .gpio_func_sel = 1 },
+	{ .pin_start = 2, .pin_cnt = 1, .name = "ddcclk", .gpio_func_sel = 1 },
+	{ .pin_start = 3, .pin_cnt = 1, .name = "ddcdat", .gpio_func_sel = 1 },
+	{ 0xff },
+};
+
+static const struct config_reg_layout_desc jhb100_vga_pinctrl_crl_desc[] = {
+	{
+		.pin_start					= 0,
+		.pin_cnt					= 4,
+		.fields[PAD_CFG_DRIVE_STRENGTH_3BIT]		= { .shift = 0, .width = 3 },
+		.fields[PAD_CFG_INPUT_ENABLE]			= { .shift = 3, .width = 1 },
+		.fields[PAD_CFG_PULL_DOWN]			= { .shift = 4, .width = 1 },
+		.fields[PAD_CFG_PULL_UP]			= { .shift = 5, .width = 1 },
+		.fields[PAD_CFG_SLEW_RATE]			= { .shift = 6, .width = 1 },
+		.fields[PAD_CFG_SCHMITT_TRIGGER_SELECT]		= { .shift = 7, .width = 1 },
+		.fields[PAD_CFG_DEBOUNCE_WIDTH]			= { .shift = 15, .width = 17 },
+	},
+	{ 0xff },
+};
+
+static const struct starfive_pinctrl_regs jhb100_vga_pinctrl_regs = {
+	.func_sel		= { .reg = 0x1c, .width_per_pin = 2 },
+	.config			= 0x00,
+	.output			= 0x10,
+	.output_en		= 0x14,
+	.gpio_status		= 0x18,
+	.irq_en			= 0x20,
+	.irq_status		= 0x24,
+	.irq_clr		= 0x28,
+	.irq_trigger		= 0x2c,
+	.irq_level		= 0x30,
+	.irq_both_edge		= 0x34,
+	.irq_edge		= 0x38,
+};
+
+static const struct jhb100_pinctrl_func_maps jhb100_func_maps_vga[] = {
+	{ .func = "gpio",		.val = 1 },
+	{ .func = "vga",		.val = 0 },
+};
+
+static const struct jhb100_pinctrl_domain_info jhb100_vga_pinctrl_info = {
+	.name			= "jhb100-vga",
+	.pl_desc		= jhb100_vga_pl_desc,
+	.crl_desc		= jhb100_vga_pinctrl_crl_desc,
+	.regs			= &jhb100_vga_pinctrl_regs,
+	.fmaps			= jhb100_func_maps_vga,
+	.num_maps		= ARRAY_SIZE(jhb100_func_maps_vga),
+};
+
+static const struct of_device_id jhb100_vga_pinctrl_of_match[] = {
+	{
+		.compatible = "starfive,jhb100-vga-pinctrl",
+		.data = &jhb100_vga_pinctrl_info,
+	},
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, jhb100_vga_pinctrl_of_match);
+
+static struct platform_driver jhb100_vga_pinctrl_driver = {
+	.probe = jhb100_pinctrl_probe,
+	.driver = {
+		.name = "starfive-jhb100-vga-pinctrl",
+		.of_match_table = jhb100_vga_pinctrl_of_match,
+	},
+};
+module_platform_driver(jhb100_vga_pinctrl_driver);
+
+MODULE_DESCRIPTION("Pinctrl driver for StarFive JHB100 SoC VGA domain");
+MODULE_AUTHOR("Alex Soo <yuklin.soo@starfivetech.com>");
+MODULE_LICENSE("GPL");
-- 
2.25.1

