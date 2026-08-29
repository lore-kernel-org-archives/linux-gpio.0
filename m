Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2093.outbound.protection.partner.outlook.cn [139.219.146.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AD341E22E9;
	Sat, 29 Aug 2026 03:14:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.93
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787973274; cv=fail; b=mG/9TenEalnNRFhwRf+wESbT/omH1+xmAGfNpm04vq+d7I0Fy2CSDIFWGeNAnNL7T4f8Z/0vbxLo0FIUZEyC9V1+RPfzuponzTMiBvHGh+qfYYeA0pnZkDBuGbe/xB4tlCLdsvsqhxVNBHsa8M/z+hiPRZb+u39G1ZuDVbdkKzc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787973274; c=relaxed/simple;
	bh=XsbeZa1+ETQRca+5sPob7bO3nH2mi5ufHaY+jPpBYnw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=uxxYHX36B4Z6iwze9qq8Vc8jxT5vVK3yxNYqIEZ/Ws0ysqmgdIISB0bnKH7DEhlvcs9tzgJkq/mXOSf9Htg6Rfp35zKFaFMhdHSWz+C/huLr1OQ0m800cbmiG969jfXaw6MGgfd/4sut8Eo07E/4lXfuz5fUrpeNuSfp8xHlTSw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cYW3vhO+ohA6dACZs1+CmSOJ+4XEjd2l744J5gdC5+L8nf8qYbJ/LdjmlFf4DukTBCeI1ukFRsXwvQueFNCeY5Eh43H1xH5gEY+wEURk3FiZZQbrISQf8nHQgNBtLRm1Nm45dtnBrqzgRWGF22vo5NBb2XJvzMc1nTW8Ps53VwjfdwAT3l1IVzJgkEn0+dzjCewwPL+h9XUr9ORntL6VxYQSRCUZvamtvCeBKcg/xiInxtUtXnZGJsj4Dlf67YJO9vJ4pHuAh8+sxASZwZ4qy4NRsqHdQqv8lH2qv/sIk84qZKnGSgoDAjxWF2MMnx5RS4WT9+bZOwlVFZpSjfZsIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R8a+Y+I/rgrb4wsJHQ6U7o7ktzt+P/D7hRa1JQApIuA=;
 b=VmSYwT/GJWAZD6k4jrPbL+VwURbXGHzEpNIDDXMLSOspbCcseiaeUV1f8T1sDDeY0uP3DsCDbOs9Mi2qZOtl4MUMhbvImgvrrKtcUCVCKpzQnOwqp9sTvXo5hS8aPXBVS2uHju5zQx0kmDW3kyYrq1gTh4KZZAoC/M1+gmhgT03VdaZR9j/CBaa5Iuqi6RlU7ym8Lm+w1nJZoX8/o8k18e26yRo2JYxbRTcWDQ/MXYtYFHDhXWTtYUuw1XaFY/jamdjIGV09oEHRKrFVCSenMa+Po6Z4In65jlW9k4BIvX4ZdSCsJK0xOxwiPlvk/VLSZ/p6ZVxS01AdLF5hNMdymQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1153.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:13::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.19; Sat, 29 Aug
 2026 02:57:44 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0315.011; Sat, 29 Aug 2026 02:57:44 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Paul Walmsley <pjw@kernel.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>,
	Changhuang Liang <changhuang.liang@starfivetech.com>
Subject: [PATCH v6 08/21] pinctrl: starfive: Add StarFive JHB100 sys1 controller driver
Date: Fri, 28 Aug 2026 19:57:07 -0700
Message-Id: <20260829025720.23915-9-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260829025720.23915-1-changhuang.liang@starfivetech.com>
References: <20260829025720.23915-1-changhuang.liang@starfivetech.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: NT0PR01CA0020.CHNPR01.prod.partner.outlook.cn (10.2.8.16)
 To ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn (10.2.3.102)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1153:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a477461-659e-46ed-118f-08df05794cb6
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|7416014|376014|52116014|3023799007|18002099003|22082099003|56012099006|5023799004|6133799003|10067099003|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	mNhkJrAnuRZqy6hK1ijGXn0MeBxHRE4ht62HecPgDF4wGYVXKVJSUxgL6dCmxorVxzfy0bkomfJDkPCxjoHqnQ3aUI8wbo10CB4JJLvXwds5TpgllMXOwwiQNJl4f+CI5JzP8x7CSj7HJyE5K3lYzUW1Tj2DBRD/tECXV0ZBWTT4TFwsEipSWWAP3AZ82eMBpxqIRxKJV4ADnTMYPAcQq5TFd9DAbLEA99/O9qhVCSOUdSt+Yml2k+c12ENyMZhzvA6G1tkCgVegfk4Ofum3Nuje04PAp4k8g8arKDunrk77DxIfFFRxrDc8lOKjQiqq6/JKc5Mr0TFnakX7yTmikVKCHpywGwvc/xgglOULYur5imdIBjpQCgvtODp7aGsz+8UHyM3OP9ifACVIoURvlb0oGw8lGhDtAizsDtNz4sNH8a3Gg4PW5iNgmrM25tXe+RoBVimtZmf2Zf+fH/GO0/T31pvOsw4f1RrycPOKWsugrUK3QNi+Bse4VXgFv2S+46dveqoeL6vc5kik2epwCkQZr+hUN9AeGCoDpN7kcNOfV/RbKH28prVxbjKPRZHfnwL4jDPDn8J9wkEXrRq7qg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(7416014)(376014)(52116014)(3023799007)(18002099003)(22082099003)(56012099006)(5023799004)(6133799003)(10067099003)(921020)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6fRKOI5a6ol6k5HD1QLiIa2DL6oof1f8PeIFxuOIHwsjH634venTtAnA1U6u?=
 =?us-ascii?Q?cFbktTPqzurera7N//0CP6dAPnpPHuBxeoU/wrWg9jX5gMYvvSWDAsRNV2yN?=
 =?us-ascii?Q?RN96AUIluyZlsfsjLSWKjxQiX8CMdUkEP+VQ1MFjbelM267M3M9o40Y7v9c4?=
 =?us-ascii?Q?YIrX3owz8Yqi50XgKoFd/obxzNpjq9nOBRIm6kpz7icw5qMQUey74siAbJDb?=
 =?us-ascii?Q?I6kSgpHm/S9TYhHSVtXzhJO92lUh0a8cgh5uLVyT0ZGF/VCCl2cG3drwYG3G?=
 =?us-ascii?Q?vrfOeoZkpmelqys5UYuXkH2g6jU3/cC9+sEjE1J5DNdVtdDnKx8kRKldu2Vp?=
 =?us-ascii?Q?FG+bhkTuMQ27gfRp20caRRW0Ek8W7x7gU7YxVM/Js86vhMBe51ImoRkNZrDq?=
 =?us-ascii?Q?MGcrVNQNXlPTVRtDPuiIt5A/QXZsHNvjBFpYS495CK1zAdb5JUGQZrlSpheh?=
 =?us-ascii?Q?6f2rhFkAEpjlSW8BLfTzpZunICC9nvhBs4R8cVLoDZZCP/oac/BMmbQfV5Jn?=
 =?us-ascii?Q?OOPUd+GbI7/0yAYhEQ9P4bN5crZkTZLiVIIx/RIA1wLCesgg2Uvld4abyLWU?=
 =?us-ascii?Q?471zK2VU44XObUfHzYkBVwn1m4GV11JLXxx9C6JtSbO8wMfYSCsSWman2JN7?=
 =?us-ascii?Q?gaI8ZYBsiowmpPWrBHia/S2F54HxZCxT2rSI16WQOYx2NQ33F+Wu6J/p1sx7?=
 =?us-ascii?Q?zRAR9byOmTRMjs37EMFlbdqKGuih8DT9MAoAb9oVDKo2/JrrFWoLGq6NSm0O?=
 =?us-ascii?Q?Yy2G4Y6w+MbToETREZ//bkPgYjDGhMl+8Eho+U71XhOScJg+bFmuwBQH79l0?=
 =?us-ascii?Q?bKWx7dMfSpB1iSwORtlbe2j2tKOghNMYDe1Iae6pVOxleRf3LHJjJc4Cgh2c?=
 =?us-ascii?Q?uvqgYSNt9dLLCo4MQktkp5jC+TOioyrnWLN7cy81eaCHWfdBYt5rLyBkaFhB?=
 =?us-ascii?Q?8aWxKcRCO9GjZRZl+zxSdffYcwKz/bZ8Lw0UZ6mpvV64kyBcmLuW+B78kfnO?=
 =?us-ascii?Q?7DtV5NVcW67kS8VKFHXDt9Z+o3lGEPW0Q6S14NV6CeqBFF4PbofBkAyf/+uX?=
 =?us-ascii?Q?oHeL5BskU9yl145bmYBDkKphBrhlVbXwf/2sgMLunjuaTVpMplrBdfxmkrso?=
 =?us-ascii?Q?c9AE3vRxZclca+7T1WKjviREnEmF73eKCSzq3z2X0Twc4J8G5xvS9Sd406Yd?=
 =?us-ascii?Q?1DCEYtl1I+kGyfpV/VR25VHE7BzSJGe18AHOI46jzcLddWBhFj4UDFyx8gqf?=
 =?us-ascii?Q?3w6q5BIlssy6w4esARFTAfrQxfYWsZRxf1D5eJ6zdNNFGnvNtA3AUYuDoHts?=
 =?us-ascii?Q?GQ1B2dLV9fe03VZd/a/zAjltRcjIu+ksI7w9dYGuwRoXcl29JU7WYVKYWv0C?=
 =?us-ascii?Q?1YoVmFck58SFf2pnIx/c88VVz4+GwQ+s9Vq5meNped8I4QL+HV+L+jO7g7K6?=
 =?us-ascii?Q?KeYN0zr6NKuCtKY8JnGhvb+8JJXJFzTnr6Hj4LA46ZMvfeQFRnf1ykPDwyBO?=
 =?us-ascii?Q?x5+u+h3uGB4B27C4B9sRrj6TuBvIcJqnNbYmMkfxjkjJJxTH3LGFQuqr1w00?=
 =?us-ascii?Q?aDMK0kWjxmu3dRfeLA4I02NL4MA1IMc1bbfjlr31ij0IVHG/k58vK97QwLNH?=
 =?us-ascii?Q?7bIeG7PWKLPKT1dxjr913B8Z2N4JQTY+AionzWtlrvN2532zuyjcofOhOFKa?=
 =?us-ascii?Q?IxYfQDf9GWVLXHMco+SvGLd9cQjK6BD2PLFaFyJxNvfFZu75NPtpz19NnfnU?=
 =?us-ascii?Q?G6o4NodIIzTqw/g9Z4IvYJzTo6CeNKulqG8uVfXo4YCbWOVUitvX?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a477461-659e-46ed-118f-08df05794cb6
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2026 02:57:44.7032
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: doJZcEVaT+vhQ1hf2+NMEdmZMfxAZbcrsFFGuJg5go3pCz7FOqFFOwfNEKLYegZbDpz160aDmcELWqlqmg6H0eDL0roq09lMZMIWyH7R7evF16jcDw/B9IAftJHQ80Pv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1153

Add pinctrl driver for StarFive JHB100 SoC System-1(sys1) pinctrl
controller.

Co-developed-by: Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
Signed-off-by: Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
Signed-off-by: Alex Soo <yuklin.soo@starfivetech.com>
Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 drivers/pinctrl/starfive/Kconfig              | 11 +++
 drivers/pinctrl/starfive/Makefile             |  1 +
 .../starfive/pinctrl-starfive-jhb100-sys1.c   | 91 +++++++++++++++++++
 3 files changed, 103 insertions(+)
 create mode 100644 drivers/pinctrl/starfive/pinctrl-starfive-jhb100-sys1.c

diff --git a/drivers/pinctrl/starfive/Kconfig b/drivers/pinctrl/starfive/Kconfig
index d4babf78f8c5..1cf43e0ae1d7 100644
--- a/drivers/pinctrl/starfive/Kconfig
+++ b/drivers/pinctrl/starfive/Kconfig
@@ -78,3 +78,14 @@ config PINCTRL_STARFIVE_JHB100_SYS0H
 	  This also provides an interface to the GPIO pins not used by other
 	  peripherals supporting inputs, outputs, configuring pull-up/pull-down
 	  and interrupts on input changes.
+
+config PINCTRL_STARFIVE_JHB100_SYS1
+	tristate "StarFive JHB100 SoC System-1 pinctrl and GPIO driver"
+	depends on ARCH_STARFIVE  || COMPILE_TEST
+	select PINCTRL_STARFIVE_JHB100
+	default ARCH_STARFIVE
+	help
+	  Say yes here to support System-1 pin control on the StarFive JHB100 SoC.
+	  This also provides an interface to the GPIO pins not used by other
+	  peripherals supporting inputs, outputs, configuring pull-up/pull-down
+	  and interrupts on input changes.
diff --git a/drivers/pinctrl/starfive/Makefile b/drivers/pinctrl/starfive/Makefile
index b26156a6d0eb..8d96cf80d377 100644
--- a/drivers/pinctrl/starfive/Makefile
+++ b/drivers/pinctrl/starfive/Makefile
@@ -9,3 +9,4 @@ obj-$(CONFIG_PINCTRL_STARFIVE_JH7110_AON)	+= pinctrl-starfive-jh7110-aon.o
 obj-$(CONFIG_PINCTRL_STARFIVE_JHB100)		+= pinctrl-starfive-jhb100.o
 obj-$(CONFIG_PINCTRL_STARFIVE_JHB100_SYS0)	+= pinctrl-starfive-jhb100-sys0.o
 obj-$(CONFIG_PINCTRL_STARFIVE_JHB100_SYS0H)	+= pinctrl-starfive-jhb100-sys0h.o
+obj-$(CONFIG_PINCTRL_STARFIVE_JHB100_SYS1)	+= pinctrl-starfive-jhb100-sys1.o
diff --git a/drivers/pinctrl/starfive/pinctrl-starfive-jhb100-sys1.c b/drivers/pinctrl/starfive/pinctrl-starfive-jhb100-sys1.c
new file mode 100644
index 000000000000..29e2788968b9
--- /dev/null
+++ b/drivers/pinctrl/starfive/pinctrl-starfive-jhb100-sys1.c
@@ -0,0 +1,91 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Pinctrl / GPIO driver for StarFive JHB100 SoC System-1 domain
+ *
+ * Copyright (C) 2024 StarFive Technology Co., Ltd.
+ * Author: Alex Soo <yuklin.soo@starfivetech.com>
+ *
+ */
+
+#include <dt-bindings/pinctrl/starfive,jhb100-pinctrl.h>
+#include <linux/platform_device.h>
+
+#include "pinctrl-starfive-jhb100.h"
+
+static const struct jhb100_pin_layout_desc jhb100_sys1_pl_desc[] = {
+	{ .pin_start = 0, .pin_cnt = 7, .name = "gpio", .gpio_func_sel = 0 },
+	{ .pin_start = 7, .pin_cnt = 1, .name = "espi1_reset", .gpio_func_sel = 1 },
+	{ 0xff },
+};
+
+static struct config_reg_layout_desc jhb100_sys1_pinctrl_rl_desc[] = {
+	{
+		.pin_start					= 0,
+		.pin_cnt					= 8,
+		.fields[PAD_CFG_DRIVE_STRENGTH_2BIT]		= { .shift = 0, .width = 2 },
+		.fields[PAD_CFG_INPUT_ENABLE]			= { .shift = 2, .width = 1 },
+		.fields[PAD_CFG_PULL_DOWN]			= { .shift = 3, .width = 1 },
+		.fields[PAD_CFG_PULL_UP]			= { .shift = 4, .width = 1 },
+		.fields[PAD_CFG_SLEW_RATE]			= { .shift = 5, .width = 1 },
+		.fields[PAD_CFG_SCHMITT_TRIGGER_SELECT]		= { .shift = 6, .width = 1 },
+		.fields[PAD_CFG_DEBOUNCE_WIDTH]			= { .shift = 15, .width = 17 },
+	},
+	{ 0xff },
+};
+
+static const struct starfive_pinctrl_regs jhb100_sys1_pinctrl_regs = {
+	.func_sel		= { .reg = 0x30, .width_per_pin = 2 },
+	.config			= 0x04,
+	.output			= 0x24,
+	.output_en		= 0x28,
+	.gpio_status		= 0x2c,
+	.irq_en			= 0x34,
+	.irq_status		= 0x38,
+	.irq_clr		= 0x3c,
+	.irq_trigger		= 0x40,
+	.irq_level		= 0x44,
+	.irq_both_edge		= 0x48,
+	.irq_edge		= 0x4c,
+};
+
+static const struct jhb100_pinctrl_func_maps jhb100_func_maps_sys1[] = {
+	{ .func = "espi",		.val = 1 },
+	{ .func = "espi_reset",		.val = 0 },
+	{ .func = "gpio",		.val = 0,
+	  .max_pin = JHB100_FUNC_MAPS_MAX_PIN(PADNUM_SYS1_GPIO_A22) },
+	{ .func = "gpio",		.val = 1,
+	  .max_pin = JHB100_FUNC_MAPS_MAX_PIN(PADNUM_SYS1_GPIO_A23) },
+	{ .func = "host0_port80",	.val = 2 },
+	{ .func = "host1_port80",	.val = 3 },
+};
+
+static const struct jhb100_pinctrl_domain_info jhb100_sys1_pinctrl_info = {
+	.name			= "jhb100-sys1",
+	.pl_desc		= jhb100_sys1_pl_desc,
+	.crl_desc		= jhb100_sys1_pinctrl_rl_desc,
+	.regs			= &jhb100_sys1_pinctrl_regs,
+	.fmaps			= jhb100_func_maps_sys1,
+	.num_maps		= ARRAY_SIZE(jhb100_func_maps_sys1),
+};
+
+static const struct of_device_id jhb100_sys1_pinctrl_of_match[] = {
+	{
+		.compatible = "starfive,jhb100-sys1-pinctrl",
+		.data = &jhb100_sys1_pinctrl_info,
+	},
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, jhb100_sys1_pinctrl_of_match);
+
+static struct platform_driver jhb100_sys1_pinctrl_driver = {
+	.probe = jhb100_pinctrl_probe,
+	.driver = {
+		.name = "starfive-jhb100-sys1-pinctrl",
+		.of_match_table = jhb100_sys1_pinctrl_of_match,
+	},
+};
+module_platform_driver(jhb100_sys1_pinctrl_driver);
+
+MODULE_DESCRIPTION("Pinctrl driver for StarFive JHB100 SoC System-1 domain");
+MODULE_AUTHOR("Alex Soo <yuklin.soo@starfivetech.com>");
+MODULE_LICENSE("GPL");
-- 
2.25.1

