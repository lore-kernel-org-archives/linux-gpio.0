Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2112.outbound.protection.partner.outlook.cn [139.219.17.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA9FB39793C;
	Mon, 10 Aug 2026 06:37:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786343867; cv=fail; b=dHnsK3oCl/yuXTbXt032LtVDe+7axaF4PC0CuZl8CGgBCSoRLReI+a1h0jucYg3hCYSgBXh5+CLlfkMpBGBS6SuRbagjWc/TsDsBI+rB1ZE3XtjCKmpOKfJuKa82rpP065/POrb8BdU7rDvJ9/fG27NqmNyegfX959gbZnqkPqQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786343867; c=relaxed/simple;
	bh=uGvZZ19lgxrn5I5uHULMRRBT7kxm+rw7yBOkroqP8RI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=IGy/zRSVraw/LsEWpjd17maNmM1nOfQKZd7XAQ57V5WxgZhEJEmulTVjlIiNDI5C7lRBojKZIcfXrN2DEsnBXQlKQs9S/a+g/sw/Z0cOPJ/YVRPJIMmLahx7OLZsS/KnX3NnuC5w9XqynqW0Bu5RmHyYW5y0jGR2N2vrTdPBEl8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IueKbsD5LbV0pCs7BkVk9+lozMr64CatNQY/udCRqHNQZxFp9z6L8erp5dyVyP2XoX9IIlVCP/cIOP8cmQOfkllEjwB7uZ7POfnd516ZZQEQtE3zXf8jE4tv1hXMYJMdDpCipWE9MOAZsddadeCsUceqISP2rUrPybJzBkaANXQIQ14SvKzwY5z+rSlZIHly2Pf+yVwMYkj00la/kBiCuLEJiON6uLEno+NLKgZbck3FIMfJIIhaXgqq3KToqmnCzv34lOrfJ3/ea1kjC7B98G5BRMs0EtBEnMt0DYMHDAymlpLgv1psn6kBzWlQkeR55FJk3iOvugPmmmg22EEdFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+3v+74vGZdHYmguQP0OqfE6/Bc+3dsl25nv9n+BABOs=;
 b=ENkWejad4BvY6GjaLvLmREbQrZuMVxbkwf74IuOv1jFvPrDJiK/fBeSrPT3eDkpkVgs8pyqEujLx93R4Bk2Ksaq3LGYECl+UWrO6ZSb9+/zMBeK0sVzhweVetJkRBC7A3NpOJ+1N2x0zZklRFCWRYyZKwq0k4wcQ+chEOvquIrcdKrDPm4kaWJH4XibBAKEPGvgIkao8ZHgPUUegkD0iak8IctcaSYjOmr386Qw3zqVveBR5DqTcM+T02AOxF7Yxso7feszAUHfbizsGWGbJlSTh++TsZSD5V54RR4PG6APrSCPVeFFOhjz0J0m33rSUfH30UNXhue0/0g3P2n6EYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1315.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:15::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Mon, 10 Aug
 2026 06:37:17 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0292.024; Mon, 10 Aug 2026 06:37:17 +0000
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
Subject: [PATCH v5 14/21] pinctrl: starfive: Add StarFive JHB100 per1 controller driver
Date: Sun,  9 Aug 2026 23:36:43 -0700
Message-Id: <20260810063650.239303-15-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260810063650.239303-1-changhuang.liang@starfivetech.com>
References: <20260810063650.239303-1-changhuang.liang@starfivetech.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BJSPR01CA0019.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:c::31) To ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1315:EE_
X-MS-Office365-Filtering-Correlation-Id: baee283f-b3dc-445b-6b45-08def6a9d231
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|52116014|366016|7416014|56012099006|5023799004|10067099003|6133799003|3023799007|18002099003|22082099003|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	TxmVmN+oK0DNUN8QSy0S1UAvHLRARP/isKabAJ+sHpARM6t+hNE+yIFnFS9EWY5N2h2MNF4BtRF5S1JSRorM8y7G2su9zI91fnlIMO3ehjVHLtnrkRba84RwBeOcz1X8144P77C/QgkdqAvz04S28YZjEl9K/Yy71BhbxnN9Q2DzkvhXyF6xagPsiRacvx5cm+YxxMGw/Itzc7rz5Adz0P45dCLBANDlBJhRmDxZIDvsaxlligiBQsN0Z1X0w9DZ2fbjMz49Sp4tPmmbjfi4dAG7ZaRp/zitlga57xTZl5XlgMzFVvUKsovXpuouFsF4nO8c9ND9S2j+BGUZezWIWT1cS0msEmIOxtZhZ9gCPSIgNW28BOldt/8MEkOQf9QdtuXVoLYAhLG7GXlzG7zcBwPwuiIV9y74Xkcl7Tf4EnL3eWCsxMBJOAbswuFSq1ij0hbV/JSYKpJ5s55Ilj4O6+7e//u51afwUduGkOTTMczU1knwvmSo8jn4Rsio35UCq3qBL47WnYzVcuTUvegqMZn0oyoTB1mhvOq+UUgSCFQQWB+z+YFPCcZ5EFdWosweboIbN3XrkSfY895r/M3pmQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(52116014)(366016)(7416014)(56012099006)(5023799004)(10067099003)(6133799003)(3023799007)(18002099003)(22082099003)(38350700014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ewfCkUqFlaJj2zW1fQfm1nye7Bppq+iHTEER/MIwLn2jpAlurnLlQs/f/bxm?=
 =?us-ascii?Q?/A3af6NG9QMzUuU3bK0eGNIKucOnKM9cewP7DlKotvjLqs47gfaeDg2N1dQY?=
 =?us-ascii?Q?3OIYO+APtEzAOQ4eCd9PUKcQdTCPWZww1ua3GYHJIqqJoHhsrAJ0is7NkkCF?=
 =?us-ascii?Q?O+FF0p3P01CbByEz4oW4AKjaqmE/7DxvrEDu9RO/eLDjoruKCClCUDf+Z5Or?=
 =?us-ascii?Q?FXDag8U9WZ3uIZkgIeIQcw0hWpCztRmxUjR+ZmvKdhXwiTcnuLpwgXjOvT26?=
 =?us-ascii?Q?7xTV+cMCAu5lx/6gSAh/yVvVvLKeJZqY/Rum+bKKoQvRCQtaxkI6uYVsU3Bo?=
 =?us-ascii?Q?Q3PMVeuy7Ijqc9ajiFUGBFDzks+rnkqPtfkHD5Akp3kCdiZa33JZEBfl6dz9?=
 =?us-ascii?Q?27l60mu/nM+owMuenZFe/WVw8TUxty9Aw1VOPPPXppKjmveYG4Szjr69gyxT?=
 =?us-ascii?Q?WQ7cj9aATnv6W4zynz/mxwa965uctj2BF+nnB286c03DNo8K5UEfvSdUeLnC?=
 =?us-ascii?Q?QQsLgjlCtgmMsu1uGAwVChWVvIYk5RVRA9RlN8QuM+Kdmt2qU72rfjS2/xM8?=
 =?us-ascii?Q?fJFcDq6AaWHZ8tcY15ePMsThzbqZ3+fNUGQQJwvndsPSboEF8JyBdrcWot8a?=
 =?us-ascii?Q?Z3zh7Z5KQHcUD87VSJzkUW7NKi844V75Z645otm9tpWQ7qONF49W7iGld/gX?=
 =?us-ascii?Q?QoICGkBy0joYzM1dwZkTLpx7T3DlWmaq+ZExRh7RceKqnvV9ShjHoV3YYM3R?=
 =?us-ascii?Q?9Cwf/9g6UhDsdwc2FmE8YTPpFd8j+ynXOdn/Ay8rwDEGQXK6tjwnLmiLuQdP?=
 =?us-ascii?Q?sB42wu7SV8vsGMx8CFkNX9r/L8907GwolgNAYKpisgXCHtM5wjGPIM0cFAZi?=
 =?us-ascii?Q?lmWST1z6AtlqC2i72AHpZNYbQLIQkPWIMAcKl/8wQozbqwJRfemuak3kOlDj?=
 =?us-ascii?Q?vmBHbaRp3GYawMbFPTcElEKGC3E/67Wwz89EERWl+193PwXh/hv4ydsnxLdr?=
 =?us-ascii?Q?vp7qBOQnvQtkkXNQdI/P0BSw0MnNngdncxwChcGnHHELpaz9HaD3c79RETpB?=
 =?us-ascii?Q?2U8Ph28oQ5N2RQSxcy04wN0LyTJmzipWSPCYI0mFU7n5m8iyts7yzLCPbhLi?=
 =?us-ascii?Q?tpg7AleeDf3JYnf0B2ZPm+BPGkxWZCzba3HhAAyY1a5FPCXRbFQzC8GRk/fA?=
 =?us-ascii?Q?r8Jt82rmxQ5YBg5jSYro5GMTJweLdvaT7u44Jgf2oFhlziOYaXewdTe17ovy?=
 =?us-ascii?Q?mxt6Ep9ztgzMuP5oE0TW32S1OcLBP+uvbgmCEoTMga4xaT9tyKxnNs5bsKmS?=
 =?us-ascii?Q?/4PSgZXc0Zb8CZvdPbkZqCVbI2lwV5bYCdtnXW76PLWFBmjxXvDh+cotFlC+?=
 =?us-ascii?Q?X3XhqGEjdqFZvaDTfIMxweu3S1HtfsdB8c+ItbIsHvonuoIhiUmKtb/Xvant?=
 =?us-ascii?Q?FluOu3Yum6SInzCVbWsblnkXxWVIDfk4oYeel8/PWD8HWxIbaem8aq6wbsaW?=
 =?us-ascii?Q?YHcwnxG7jr/s2Wq13NB6tWAZyCvJXWvM97/tKBjK0yIMZ+5kJiyRFT2uDxUX?=
 =?us-ascii?Q?TMIF2Bg0YsJmWazVcWeZbqW6+1/onsCmdv9vArhx8VLlpyWvs39ZsspRhlaD?=
 =?us-ascii?Q?M9m6vQYQd07o/yXLUWNCz8uro0lMGBQRk5alXYLaRDc+F+tujx1gKx/kwSVz?=
 =?us-ascii?Q?qwRCfwyNXk5iCAv/JGUyJiIWlnEf2J8l/xwZY6cfqVTkqMHnZ6fXa4JzIY61?=
 =?us-ascii?Q?QB5YMQQq2vWBslrqL4U2BVE/zp/YxQc+UFfmXIxrNJmeNLZX7ebw?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: baee283f-b3dc-445b-6b45-08def6a9d231
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2026 06:37:17.0722
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FrN2evEl/qSRtYC2+kRpn2ev+BZF+8WHnogPpJ4BcMT34QJIr/4WIObU/YLuihL+Nr4Hr3QYXufeT8OcfXiRCRJqr2Cw/TLjigsDuiWeX/gMJNN64mLRfLOgr1JRBPV+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1315

Add pinctrl driver for StarFive JHB100 SoC Peripheral-1(per1) pinctrl
controller.

Co-developed-by: Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
Signed-off-by: Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
Signed-off-by: Alex Soo <yuklin.soo@starfivetech.com>
Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 drivers/pinctrl/starfive/Kconfig              |  11 ++
 drivers/pinctrl/starfive/Makefile             |   1 +
 .../starfive/pinctrl-starfive-jhb100-per1.c   | 162 ++++++++++++++++++
 3 files changed, 174 insertions(+)
 create mode 100644 drivers/pinctrl/starfive/pinctrl-starfive-jhb100-per1.c

diff --git a/drivers/pinctrl/starfive/Kconfig b/drivers/pinctrl/starfive/Kconfig
index ddd39807e222..0fe2d21ba402 100644
--- a/drivers/pinctrl/starfive/Kconfig
+++ b/drivers/pinctrl/starfive/Kconfig
@@ -68,6 +68,17 @@ config PINCTRL_STARFIVE_JHB100_PER0
 	  peripherals supporting inputs, outputs, configuring pull-up/pull-down
 	  and interrupts on input changes.
 
+config PINCTRL_STARFIVE_JHB100_PER1
+	tristate "StarFive JHB100 SoC Peripheral-1 pinctrl and GPIO driver"
+	depends on ARCH_STARFIVE || COMPILE_TEST
+	select PINCTRL_STARFIVE_JHB100
+	default ARCH_STARFIVE
+	help
+	  Say yes here to support Peripheral-1 pin control on the StarFive JHB100 SoC.
+	  This also provides an interface to the GPIO pins not used by other
+	  peripherals supporting inputs, outputs, configuring pull-up/pull-down
+	  and interrupts on input changes.
+
 config PINCTRL_STARFIVE_JHB100_SYS0
 	tristate "StarFive JHB100 SoC System-0 pinctrl and GPIO driver"
 	depends on ARCH_STARFIVE || COMPILE_TEST
diff --git a/drivers/pinctrl/starfive/Makefile b/drivers/pinctrl/starfive/Makefile
index f2bb0c35a2a0..6beef7e313ef 100644
--- a/drivers/pinctrl/starfive/Makefile
+++ b/drivers/pinctrl/starfive/Makefile
@@ -8,6 +8,7 @@ obj-$(CONFIG_PINCTRL_STARFIVE_JH7110_AON)	+= pinctrl-starfive-jh7110-aon.o
 
 obj-$(CONFIG_PINCTRL_STARFIVE_JHB100)		+= pinctrl-starfive-jhb100.o
 obj-$(CONFIG_PINCTRL_STARFIVE_JHB100_PER0)	+= pinctrl-starfive-jhb100-per0.o
+obj-$(CONFIG_PINCTRL_STARFIVE_JHB100_PER1)	+= pinctrl-starfive-jhb100-per1.o
 obj-$(CONFIG_PINCTRL_STARFIVE_JHB100_SYS0)	+= pinctrl-starfive-jhb100-sys0.o
 obj-$(CONFIG_PINCTRL_STARFIVE_JHB100_SYS0H)	+= pinctrl-starfive-jhb100-sys0h.o
 obj-$(CONFIG_PINCTRL_STARFIVE_JHB100_SYS1)	+= pinctrl-starfive-jhb100-sys1.o
diff --git a/drivers/pinctrl/starfive/pinctrl-starfive-jhb100-per1.c b/drivers/pinctrl/starfive/pinctrl-starfive-jhb100-per1.c
new file mode 100644
index 000000000000..ffaf3aaf94ed
--- /dev/null
+++ b/drivers/pinctrl/starfive/pinctrl-starfive-jhb100-per1.c
@@ -0,0 +1,162 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Pinctrl / GPIO driver for StarFive JHB100 SoC Peripheral-1 domain
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
+static const struct jhb100_pin_layout_desc jhb100_per1_pl_desc[] = {
+	{ .pin_start = 0, .pin_cnt = 36, .name = "gpio", .gpio_func_sel = 0 },
+	{ 0xff },
+};
+
+static const struct config_reg_layout_desc jhb100_per1_pinctr_rldesc[] = {
+	{
+		.pin_start					= 0,
+		.pin_cnt					= 32,
+		.fields[PAD_CFG_DRIVE_STRENGTH_2BIT]		= { .shift = 0, .width = 2 },
+		.fields[PAD_CFG_INPUT_ENABLE]			= { .shift = 2, .width = 1 },
+		.fields[PAD_CFG_PULL_DOWN]			= { .shift = 3, .width = 1 },
+		.fields[PAD_CFG_PULL_UP]			= { .shift = 4, .width = 1 },
+		.fields[PAD_CFG_SLEW_RATE]			= { .shift = 5, .width = 1 },
+		.fields[PAD_CFG_SCHMITT_TRIGGER_SELECT]		= { .shift = 6, .width = 1 },
+		.fields[PAD_CFG_DEBOUNCE_WIDTH]			= { .shift = 15, .width = 17 },
+	},
+	{
+		.pin_start					= 32,
+		.pin_cnt					= 4,
+		.fields[PAD_CFG_INPUT_ENABLE]			= { .shift = 0, .width = 1 },
+		.fields[PAD_CFG_MODE_SELECT]			= { .shift = 1, .width = 2 },
+		.fields[PAD_CFG_PULL_DOWN]			= { .shift = 3, .width = 1 },
+		.fields[PAD_CFG_PULL_UP]			= { .shift = 4, .width = 1 },
+		.fields[PAD_CFG_OPEN_DRAIN_PULL_UP_SEL]		= { .shift = 5, .width = 2 },
+		.fields[PAD_CFG_SCHMITT_TRIGGER_SELECT]		= { .shift = 7, .width = 1 },
+		.fields[PAD_CFG_DEBOUNCE_WIDTH]			= { .shift = 15, .width = 17 },
+	},
+	{ 0xff },
+};
+
+static const struct pinvref_desc pinvref_desc_per1[] = {
+	{
+		/* gpioe-spi */
+		.pin_grp = {
+			PADNUM_PER1_GPIO_C0,
+			PADNUM_PER1_GPIO_C1,
+			PADNUM_PER1_GPIO_C2,
+			PADNUM_PER1_GPIO_C3,
+			PADNUM_PER1_GPIO_C4
+		},
+		.num_pins = 5,
+		.range = BIT(JHB100_PINVREF_1_8V) | BIT(JHB100_PINVREF_3_3V)
+	},
+	{
+		/* gpioe-qspi0 */
+		.pin_grp = {
+			PADNUM_PER1_GPIO_C5,
+			PADNUM_PER1_GPIO_C6,
+			PADNUM_PER1_GPIO_C7,
+			PADNUM_PER1_GPIO_C8,
+			PADNUM_PER1_GPIO_C9,
+			PADNUM_PER1_GPIO_C10,
+			PADNUM_PER1_GPIO_C11
+		},
+		.num_pins = 7,
+		.range = BIT(JHB100_PINVREF_1_8V) | BIT(JHB100_PINVREF_3_3V)
+	},
+	{
+		/* gpioe-qspi1 */
+		.pin_grp = {
+			PADNUM_PER1_GPIO_C12,
+			PADNUM_PER1_GPIO_C13,
+			PADNUM_PER1_GPIO_C14,
+			PADNUM_PER1_GPIO_C15,
+			PADNUM_PER1_GPIO_C16,
+			PADNUM_PER1_GPIO_C17,
+			PADNUM_PER1_GPIO_C18,
+			PADNUM_PER1_GPIO_C19
+		},
+		.num_pins = 8,
+		.range = BIT(JHB100_PINVREF_1_8V) | BIT(JHB100_PINVREF_3_3V)
+	},
+	{
+		/* gpioe-qspi2 */
+		.pin_grp = {
+			PADNUM_PER1_GPIO_C20,
+			PADNUM_PER1_GPIO_C21,
+			PADNUM_PER1_GPIO_C22,
+			PADNUM_PER1_GPIO_C23,
+			PADNUM_PER1_GPIO_C24,
+			PADNUM_PER1_GPIO_C25,
+			PADNUM_PER1_GPIO_C26,
+			PADNUM_PER1_GPIO_C27
+		},
+		.num_pins = 8,
+		.range = BIT(JHB100_PINVREF_1_8V) | BIT(JHB100_PINVREF_3_3V)
+	},
+};
+
+static const struct starfive_pinctrl_regs jhb100_per1_pinctrl_regs = {
+	.vref			= { .reg = 0x00, .pv_desc = pinvref_desc_per1,
+				    .num_pv = ARRAY_SIZE(pinvref_desc_per1) },
+	.func_sel		= { .reg = 0xbc, .width_per_pin = 2 },
+	.config			= 0x14,
+	.output			= 0xa4,
+	.output_en		= 0xac,
+	.gpio_status		= 0xb4,
+	.irq_en			= 0xc8,
+	.irq_status		= 0xd0,
+	.irq_clr		= 0xd8,
+	.irq_trigger		= 0xe0,
+	.irq_level		= 0xe8,
+	.irq_both_edge		= 0xf0,
+	.irq_edge		= 0xf8,
+};
+
+static const struct jhb100_pinctrl_func_maps jhb100_func_maps_per1[] = {
+	{ .func = "gpio",		.val = 0 },
+	{ .func = "i2c",		.val = 1 },
+	{ .func = "sfc",		.val = 1 },
+	{ .func = "sgpio",		.val = 1,
+	  .max_pin = JHB100_FUNC_MAPS_MAX_PIN(PADNUM_PER1_GPIO_C31) },
+	{ .func = "sgpio",		.val = 2,
+	  .max_pin = JHB100_FUNC_MAPS_MAX_PIN(PADNUM_PER1_GPIO_C35) },
+	{ .func = "spi",		.val = 1 },
+};
+
+static const struct jhb100_pinctrl_domain_info jhb100_per1_pinctrl_info = {
+	.name			= "jhb100-per1",
+	.pl_desc		= jhb100_per1_pl_desc,
+	.crl_desc		= jhb100_per1_pinctr_rldesc,
+	.regs			= &jhb100_per1_pinctrl_regs,
+	.fmaps			= jhb100_func_maps_per1,
+	.num_maps		= ARRAY_SIZE(jhb100_func_maps_per1),
+};
+
+static const struct of_device_id jhb100_per1_pinctrl_of_match[] = {
+	{
+		.compatible = "starfive,jhb100-per1-pinctrl",
+		.data = &jhb100_per1_pinctrl_info,
+	},
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, jhb100_per1_pinctrl_of_match);
+
+static struct platform_driver jhb100_per1_pinctrl_driver = {
+	.probe = jhb100_pinctrl_probe,
+	.driver = {
+		.name = "starfive-jhb100-per1-pinctrl",
+		.of_match_table = jhb100_per1_pinctrl_of_match,
+	},
+};
+module_platform_driver(jhb100_per1_pinctrl_driver);
+
+MODULE_DESCRIPTION("Pinctrl driver for StarFive JHB100 SoC Peripheral-1 domain");
+MODULE_AUTHOR("Alex Soo <yuklin.soo@starfivetech.com>");
+MODULE_LICENSE("GPL");
-- 
2.25.1

