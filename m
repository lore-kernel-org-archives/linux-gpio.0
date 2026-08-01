Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2113.outbound.protection.partner.outlook.cn [139.219.146.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B2EE353A71;
	Sat,  1 Aug 2026 08:00:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.113
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785571231; cv=fail; b=fYWbTkoTYxKlNoaqMuzGYzUwbFL88jJQglYO6PJKJ5m+eBIAuv1TywujpRsWVOoWDyTR/ndF5gorHs18uPJMmqxJdqr2qoHoqFl0cC+cveP4Q2ym52NG0lO2cxStQA9dFi7wwOH07mxfTsZIYZ1Ng65PbYBKF3/jkRZDHX2VCt4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785571231; c=relaxed/simple;
	bh=tgkzSl6MEgdWmhSkVvtykNTmTetnZ9VU3t5uY8ikP94=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=mRx73zF8vB3GhceAHDf9AlSzMCwho3aVwl3O1frvVw2hVIqhF0eJQF1ecwRPFP04O+3PUe9vVOzwu6qygRc6bkfKI4a7SxhQjBaUOvLtfVx3Uk24LhxD5Vo2CYLg1BIf/9ioFDdN0opFEuaCJTtzLy++3VhDkqa8aXMt7qiK+A8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.113
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b89l3GmmD0epBTxHhLNyYvBUkuHu99NZi1D2LyWASw9nJp+me2Pc85L0L7LeNdySbhwSfbvoKCpmLAyW0yQrTFbpPWfuwvi0hQy2jLsOe/efYtdWlErOxtUxI/ntSKLulGzfoslZSv1jzxf36mSzxNQP/44EBoilZ8afXDlbk6Mk4Ktg9xme9bvHqUtdil3Iywf5smw9CGYwZ7Is4aJRKz4xeA63bDR1M386SaqJZ5ImWbsJKkuoTwP/j0X1poxPjPz8N/HKnIrMc1jJ32/R3EaHfAqjM4QznIW453Vttor9QxfHHYVM7v7Z+si0Ot6Pg0IHow03hnn418tzw/8OLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=stiO+klEGZ1VKPKSM6FNz6bmLlTEugJBqydorzXx9t8=;
 b=mCumbjfvdns1bF+yX+DloR0nARmrXW4lsEU88F7V1b+jOgfOmCKH7cVZ1VnhPo1ODbZ6e7aMxBNivBKMkwEgq8XvwQkAcLs04RO01Z3c0W1NkzoltrbIfUzVzymV42vI1R+i5oPqPYy5SsSRbwIY911tkcJ2rzuk8MRvKSgMgsnxwXFKmiI48wO6DzOItU/NOLFp8ivGjFCaxvnd/PCHvz4YPNa7cb/OCM3KGC5FH6FL29tyCUBz9JBGje3tFG4hkYq9Vmy4I29ht5DH8RfbF5J265geeFF28VTarzz2H/6P/Vz93Ak1FwmYVOgJYPKN5mrUzvqZIP66dd6p05w8hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1329.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:16::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.17; Sat, 1 Aug
 2026 07:27:28 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0270.015; Sat, 1 Aug 2026 07:27:28 +0000
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
Subject: [PATCH v4 06/21] pinctrl: starfive: Add StarFive JHB100 sys0h controller driver
Date: Sat,  1 Aug 2026 00:26:56 -0700
Message-Id: <20260801072711.153217-7-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260801072711.153217-1-changhuang.liang@starfivetech.com>
References: <20260801072711.153217-1-changhuang.liang@starfivetech.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: NT0PR01CA0027.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:c::20) To ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1329:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e9c59da-9f50-4b63-97d3-08deef9e5721
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|23010399003|366016|1800799024|921020|38350700014|6133799003|56012099006|10067099003|5023799004|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	FFsPOyXpAHGlCkAFjfC6jlIQMn4ALgNf8ohmoL4K/gQ0rByCo7e+EvVHI1fBuvO61TYNoBuaskJ+ydg/u/oNHqWq6qX6Je07VZTzy0cgVYY0Xpr1jHIJOUD57NCh46tg/bt/C0DHhhv4FOZUoiO+71pOhc1GfHLXHOGxwk/Yj6d2mojoSdLEVSVPrK8RV6vXg3uP0CBA8P59VSEJta1pUqGOlww0Oh7tgsn1s9fyMxb+lOGbhftiuQnLVavx/XHJWmu+Vy8MF41PJPAaUKSauQn5GT6MBt9gsvpMzA/ZqIAn7HyYOCO9ia3rzWSoNVdjh3B0DP2/Ecs+E6scHubzt9d4DSkn7GGwR0y2MdzCiVQwGTVFtcD5u2VvjjA0aus8K+51tHf7rDHajFrk0xe2NoVwJ6KkO06PV/406iaeRKKPjC4FIqpYtuXBjF53F/pgeYDcU672LSay/AOzF+9R3Lr6modGp/bUwNUPIb9+S8q6bAvQCwzz7qdwRFM8e7zRwmgxR5Tcfg8ujdejFMkflszIKQuZYUFq78AxP3Zwmu60oVXIdJHraQGwUB5tFejEw/BNIkm0VhXAUuS8CpvQbw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(23010399003)(366016)(1800799024)(921020)(38350700014)(6133799003)(56012099006)(10067099003)(5023799004)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?KcWw/XSrDwEmdE5x+G2YdTdNHnCzRCvEKc1Eu596AcCVWU5Hcb7lzU0TQg66?=
 =?us-ascii?Q?4RVRbkyOGL+lzsu9Sfy48jvGLtNedtzXYy1fRl7Wr5cACzCQ3/DyEHrOKsa8?=
 =?us-ascii?Q?AIfzKcVNSugqEy45aYg1VxSq6Jk9sjxESpGu2lRrLjg9HGhfOXN/XBwVdY3j?=
 =?us-ascii?Q?2nIOwJRzY3Dzg9bz9s6sD/eeNoogyQ4SnlO1JnineEX+dY5hKQIWjwCP5Ulr?=
 =?us-ascii?Q?+CRCb3PlCsgeWoL/r2K5OLmIaDECTaU5s132z2e9MtpmL/Fj6tP9FdZd8Xvk?=
 =?us-ascii?Q?Phoss15k+iOrmFo0YYGHPX8azYVhocvQFX84Y9Eby8kECtDL5dn378Xi3X2B?=
 =?us-ascii?Q?mENhY3cMydQUtR8SB94iSMBjbleXxlnNpXOlQ3SSd9LMv1VFPxhF6xOvCHnz?=
 =?us-ascii?Q?o7dhB1Onrt/WBhY9Cn682+OqqfDWvAeBiI5U4gpZjkPKZ6VObek1X2FpIFis?=
 =?us-ascii?Q?pOfJ6EwenvreeInmcJHhzrkUBg0/aV3Ml2SI0QACFFCXMsF3A9bSNjsE0KpK?=
 =?us-ascii?Q?3dGAuqsK8fD9sCJwLPL/DEN20srdqmgO3AehpbEEPfZL4M/1ZbcFWoDmf9vF?=
 =?us-ascii?Q?PUujfztChbpK8reNlHHEStdkDMN3RtOPxWUGXeAkdx6vOTKQcxpvx7cbvtYT?=
 =?us-ascii?Q?6gHtU3hTqGUYXid10qaZReFom8VOUFMfzXcOUvMjHedM3qa5CBm5/gdWTfqF?=
 =?us-ascii?Q?lvXZpEp/ng3YBbiVEPv1+U+kXXArXGPWhH0d80lHZ409/Y9f+MfmWlpH6o7w?=
 =?us-ascii?Q?oyLXcZFE5uLzICksnjPX7S/QdvOy/vrGI/eXZriFEZUxWtaeQ/HhPh/reRNH?=
 =?us-ascii?Q?I87QmHhjIap/FuIMMZ4aVfOfTDJlODefuSl3oQe5WY++1feJaYfLV7rIFxdo?=
 =?us-ascii?Q?OSds8owPUKDaKPwKd4HFHaUVA26vChvnymq1hOheKbrigAWkegnwAEzgKME6?=
 =?us-ascii?Q?GhgH93WSFNCncmEcZWl347BZUBm60mxEf25XPdhXbZeTJGOUdFXyYZWVeTYq?=
 =?us-ascii?Q?nKUUeft/NT86+2ZsMU0XItPZQqhEEkFjQRgpcYsRtEAFJTyRM+dV7ETTPKhv?=
 =?us-ascii?Q?T7A9C9n0oikFoiF+I4zfjnVaBzB+e1mYrODbdWyxV+i8FFKyuucRxBTAtk76?=
 =?us-ascii?Q?G/ut0PWNNA666rSlWWz5re76WAyLe6kIh0hVpyJl/dcZafrZYHFlGytWJyKN?=
 =?us-ascii?Q?pHXUg/6mJGbEYmgFguqoH0pJco7JnmW9t683z1gVqQbAYJvozpQR5X7Zr/0S?=
 =?us-ascii?Q?FOEFwy3fKziLDs7UaPAOq52/YgP4/LrzyKJ1w6zKorXhxLMOvFRqpj4yV3sd?=
 =?us-ascii?Q?at12SUGIzlxJoEqFxJElxdB4osdQL367dsuvvKv4WOm5Wi9TLO3neyIyc5X9?=
 =?us-ascii?Q?ia+/1ClsQ6fgcwv3REq5ioTkjFAH3XZWjp/znWXHB9/p8J5namYYN1miO5fZ?=
 =?us-ascii?Q?g5mRiRUQ54Hu4cAy86uSsb6dx86AL349NHHkK8nUS+sAj5a58gY7yE0vr0Tt?=
 =?us-ascii?Q?uF9A++IGZEJLGRqW/U9qJro/LNGr+XNt/jqYpSY7axnVWMcxcVicnKa4kJ+0?=
 =?us-ascii?Q?lPNnfUs6fKDuY0jVBEIg479cK7qPyZLXJJc74oH0Hi3cRFeg2ikBwjc3ciAe?=
 =?us-ascii?Q?uDd4rWzwOt4vRX5HVsWvz9QblPFqUztserOooPPw0nSoSyWznVfoHtEho65r?=
 =?us-ascii?Q?WN3yimgFbEVK8Sh+sXUyCM04UQAhrd4gjk/3yxH3AO9JGGjrOkLEuxyaA/Zo?=
 =?us-ascii?Q?tIPVRByfD9p1CZ8CUEjPQ5n1fBayd8ObhNipKp29zCzCKQ6tkr5o?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e9c59da-9f50-4b63-97d3-08deef9e5721
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2026 07:27:27.9877
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N45V4EcEKfpAbt8EBRhiBUzwNBANMg6sFi/yxtp2qiMsPoYkrosAn4Vtm7EU8UyZe8q1Sh1YV/lus1gtoMDufhg62V5fivVSMTuyisPymFpqEeQi2UIOpwnp2DVMDW1+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1329

Add pinctrl driver for StarFive JHB100 SoC System-0 Host(sys0h) pinctrl
controller.

Co-developed-by: Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
Signed-off-by: Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
Signed-off-by: Alex Soo <yuklin.soo@starfivetech.com>
Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 drivers/pinctrl/starfive/Kconfig              | 11 +++
 drivers/pinctrl/starfive/Makefile             |  1 +
 .../starfive/pinctrl-starfive-jhb100-sys0h.c  | 96 +++++++++++++++++++
 3 files changed, 108 insertions(+)
 create mode 100644 drivers/pinctrl/starfive/pinctrl-starfive-jhb100-sys0h.c

diff --git a/drivers/pinctrl/starfive/Kconfig b/drivers/pinctrl/starfive/Kconfig
index eb0b3b705ec5..d4babf78f8c5 100644
--- a/drivers/pinctrl/starfive/Kconfig
+++ b/drivers/pinctrl/starfive/Kconfig
@@ -67,3 +67,14 @@ config PINCTRL_STARFIVE_JHB100_SYS0
 	  This also provides an interface to the GPIO pins not used by other
 	  peripherals supporting inputs, outputs, configuring pull-up/pull-down
 	  and interrupts on input changes.
+
+config PINCTRL_STARFIVE_JHB100_SYS0H
+	tristate "StarFive JHB100 SoC System-0 Host pinctrl and GPIO driver"
+	depends on ARCH_STARFIVE  || COMPILE_TEST
+	select PINCTRL_STARFIVE_JHB100
+	default ARCH_STARFIVE
+	help
+	  Say yes here to support System-0 Host pin control on the StarFive JHB100 SoC.
+	  This also provides an interface to the GPIO pins not used by other
+	  peripherals supporting inputs, outputs, configuring pull-up/pull-down
+	  and interrupts on input changes.
diff --git a/drivers/pinctrl/starfive/Makefile b/drivers/pinctrl/starfive/Makefile
index c0d368f413bc..b26156a6d0eb 100644
--- a/drivers/pinctrl/starfive/Makefile
+++ b/drivers/pinctrl/starfive/Makefile
@@ -8,3 +8,4 @@ obj-$(CONFIG_PINCTRL_STARFIVE_JH7110_AON)	+= pinctrl-starfive-jh7110-aon.o
 
 obj-$(CONFIG_PINCTRL_STARFIVE_JHB100)		+= pinctrl-starfive-jhb100.o
 obj-$(CONFIG_PINCTRL_STARFIVE_JHB100_SYS0)	+= pinctrl-starfive-jhb100-sys0.o
+obj-$(CONFIG_PINCTRL_STARFIVE_JHB100_SYS0H)	+= pinctrl-starfive-jhb100-sys0h.o
diff --git a/drivers/pinctrl/starfive/pinctrl-starfive-jhb100-sys0h.c b/drivers/pinctrl/starfive/pinctrl-starfive-jhb100-sys0h.c
new file mode 100644
index 000000000000..92632d1656f8
--- /dev/null
+++ b/drivers/pinctrl/starfive/pinctrl-starfive-jhb100-sys0h.c
@@ -0,0 +1,96 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Pinctrl / GPIO driver for StarFive JHB100 SoC System-0 host domain
+ *
+ * Copyright (C) 2024 StarFive Technology Co., Ltd.
+ * Author: Alex Soo <yuklin.soo@starfivetech.com>
+ *
+ */
+
+#include <dt-bindings/pinctrl/starfive,jhb100-pinctrl.h>
+#include <linux/mod_devicetable.h>
+#include <linux/platform_device.h>
+
+#include "pinctrl-starfive-jhb100.h"
+
+static const struct jhb100_pin_layout_desc jhb100_sys0h_pl_desc[] = {
+	{ .pin_start = 0, .pin_cnt = 7, .name = "gpio", .gpio_func_sel = 0 },
+	{ .pin_start = 7, .pin_cnt = 1, .name = "espi0_reset", .gpio_func_sel = 1 },
+	{ .pin_start = 8, .pin_cnt = 4, .name = "gpio", .gpio_func_sel = 0 },
+	{ 0xff },
+};
+
+static const struct config_reg_layout_desc jhb100_sys0h_pinctrl_rl_desc[] = {
+	{
+		.pin_start					= 0,
+		.pin_cnt					= 12,
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
+static const struct starfive_pinctrl_regs jhb100_sys0h_pinctrl_regs = {
+	.func_sel		= { .reg = 0x40, .width_per_pin = 2 },
+	.config			= 0x04,
+	.output			= 0x34,
+	.output_en		= 0x38,
+	.gpio_status		= 0x3c,
+	.irq_en			= 0x44,
+	.irq_status		= 0x48,
+	.irq_clr		= 0x4c,
+	.irq_trigger		= 0x50,
+	.irq_level		= 0x54,
+	.irq_both_edge		= 0x58,
+	.irq_edge		= 0x5c,
+};
+
+static const struct jhb100_pinctrl_func_maps jhb100_func_maps_sys0h[] = {
+	{ .func = "espi",		.val = 1 },
+	{ .func = "espi_reset",		.val = 0 },
+	{ .func = "espi0_vw",		.val = 1 },
+	{ .func = "espi1_vw",		.val = 2 },
+	{ .func = "gpio",		.val = 0,
+	  .max_pin = JHB100_FUNC_MAPS_MAX_PIN(PADNUM_SYS0H_GPIO_A10) },
+	{ .func = "gpio",		.val = 1,
+	  .max_pin = JHB100_FUNC_MAPS_MAX_PIN(PADNUM_SYS0H_GPIO_A11) },
+	{ .func = "gpio",		.val = 0,
+	  .max_pin = JHB100_FUNC_MAPS_MAX_PIN(PADNUM_SYS0H_GPIO_A15) },
+	{ .func = "scap_trigger",	.val = 3 },
+};
+
+static struct jhb100_pinctrl_domain_info jhb100_sys0h_pinctrl_info = {
+	.name			= "jhb100-sys0h",
+	.pl_desc		= jhb100_sys0h_pl_desc,
+	.crl_desc		= jhb100_sys0h_pinctrl_rl_desc,
+	.regs			= &jhb100_sys0h_pinctrl_regs,
+	.fmaps			= jhb100_func_maps_sys0h,
+	.num_maps		= ARRAY_SIZE(jhb100_func_maps_sys0h),
+};
+
+static const struct of_device_id jhb100_sys0h_pinctrl_of_match[] = {
+	{
+		.compatible = "starfive,jhb100-sys0h-pinctrl",
+		.data = &jhb100_sys0h_pinctrl_info,
+	},
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, jhb100_sys0h_pinctrl_of_match);
+
+static struct platform_driver jhb100_sys0h_pinctrl_driver = {
+	.probe = jhb100_pinctrl_probe,
+	.driver = {
+		.name = "starfive-jhb100-sys0h-pinctrl",
+		.of_match_table = jhb100_sys0h_pinctrl_of_match,
+	},
+};
+module_platform_driver(jhb100_sys0h_pinctrl_driver);
+
+MODULE_DESCRIPTION("Pinctrl driver for StarFive JHB100 SoC System-0 host domain");
+MODULE_AUTHOR("Alex Soo <yuklin.soo@starfivetech.com>");
+MODULE_LICENSE("GPL");
-- 
2.25.1

