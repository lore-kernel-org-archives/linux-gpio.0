Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2101.outbound.protection.partner.outlook.cn [139.219.17.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49A453EFFD7;
	Thu, 10 Sep 2026 10:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.101
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789034707; cv=fail; b=Kv6fyOMoFSddlPlbDxHmiXikkpuyoO8nl3kGC7Y8w0k3GIGi70C5ZsWdp8ClIjI5/NSwDmtLfBDwVdzNzx0AcGXpnkaCkBuHO6fio8ds1BNGMyFU3Bwd35ABGiIUpT21dBhGlGEI8zEFqdWUkx1C1EH4yZZMSNR26BmJ+mlJT8M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789034707; c=relaxed/simple;
	bh=YbD8IWzMPidGBSsf5DVYEM6iu4QI3Z3LRZHzBUR3GD4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=bXF1oVY/KwCd8NlAp8XJBpUnw8mrEEaIhvT7DwJYzLYtqanC6SwLwQgCFICgtjiKEyxrAGN30JPMelSUR+sRsdps7j2CexzTpmVXyCO/liZsDjMfwQTSdgh2PovrRkuYiDpiINdXY70auD/WTEWCq03RkfbJ/YfTqi8pyjlBCI0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cJpTLrg9MKmNDOo2DlRzE/vr/S8e26riXTDbaO9p7Msa+vhrRryB/1SMbfz8x8dECTuvymWQIBMQ46TJdJhRg9cP2Q8HIsTiGreVdKqDWQjYUSrEJDAMlJqfb7cv/87pVnj6WG8amRyse9bX8X+9K7OhkbiRT6odNPBUOQ2QgeQlnMaxgXkqnxmfkzXKywCgNaUxIGVpR7t67f7f/tA+4W88XuRSeGWw3yh/z36/mGHGVI24rDo5dXWA3ufMvSbG/s6H+K2E/1KrOCtD7jORXwatvY9gB2UWq/SWJr5vpx2OH7K8vfZnSUB67PkAr551IlcETuzqrm74fHbpuHwhSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BswKypUKPYny2DLDvxJgQrLoQQGe0lMRuae+kgoHq3k=;
 b=bR09TsuvDKp0QVZYlLi1Iji+2AdbEkIzOnwRrt/n3k9GoTo5xWmTFjNUL+IqY3TKWa/RmnIjDSEqJ4HV6RpMtVs8C8asDKsiu/c0dri1pbKobXORcGZhLsntv9dYYW3c+qFWP47Fr9YSGoQdI4Il+9JECypl32nS5as4RpCo3wQCywfJnkYyugCEV7WxI9ko76PG1bCA+54pRSH8xJeNlTrwkKF7AJ4aMA5m+noAPXYmjZCAN0N/00cegb7IpTGmfmY9S8XViKH/fs/n1PVvKJT1+sC3KwlHyNcO2ytTc+NDUcRwvPM/uABQsiJKkn9FduXeMFrodNxrjxuKc8rQ7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1233.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:13::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Thu, 10 Sep
 2026 10:04:20 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0339.017; Thu, 10 Sep 2026 10:04:20 +0000
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
Subject: [PATCH v8 10/22] pinctrl: starfive: Add StarFive JHB100 sys2 controller driver
Date: Thu, 10 Sep 2026 03:03:45 -0700
Message-Id: <20260910100357.130134-11-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260910100357.130134-1-changhuang.liang@starfivetech.com>
References: <20260910100357.130134-1-changhuang.liang@starfivetech.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZQ0PR01CA0035.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:2::21) To ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1233:EE_
X-MS-Office365-Filtering-Correlation-Id: f770eda0-5d71-47d5-a473-08df0f22e1ab
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|7416014|376014|23010399003|5023799004|6133799003|56012099006|3023799007|10067099003|22082099003|18002099003|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	3FLWrm8miqS9aCiqYnFFcWGNHCdNq1pzw5E4d5egRILCMBO7po19Z+d9mYPTPxfUt11pHzws7YbKogOEdnOecWuZTm01k5VrR48RyaU1bmGF26jC5JT+XZ0wGMMG8FOn5obpzZUVQPaZZceMzf0H9mUnjlHrvTBr44y+rBJPPBK7++wFCcVKzKwLpM3zlnnDO2Xu2qH/NOdUJjBU3FcR1h3M7LUwSV+aDMK/0zsY/I1z0kQ/W/pSBk6v5lY5Ct8diGRSyGUynTG6zG2Ut7oVn7WMWCAwiWJMYQCQaajkXVuzAL3L8/vW+0w4+STDPCjxbfTEf4S6LrpIvCzXaH1HJcFkq/NomvWoyDNnOGsuOFx/2odxJT8B5DcEalIrSKvR2TDQFUndzr5mJU+03lpJwatylyLwZzHHkVleUWL6alvhL6FDWUwbPSM7BFEAqZMYbTh9gW1cJMwx8YAV9l0kBo5eNxS2tvSUZMT12fv1gF1iuPVXc+ODa3QQ9upLt1YMJ23qszh/VK8JqhBQ/FZJcV8DMqx9nuJ0buLO0hzgs6kz9lw5eKNYbYSAXEwfh8JHKPyXzFHZQPBw+X2a4L16Mg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(7416014)(376014)(23010399003)(5023799004)(6133799003)(56012099006)(3023799007)(10067099003)(22082099003)(18002099003)(38350700014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?FSqwYIcajL5IcVD2/vW2NJmr9hiGY7olArDR1ImqnGzaqyIS+0+TpGJDR196?=
 =?us-ascii?Q?Oan89r91MPZ7xjv3JwfZigOhpWKKjEdUu20nK6zNmiuktNtsOP+Jd23RWL18?=
 =?us-ascii?Q?m03uXBdpYHIWIjwunnpkuthFn2srn+qOJyxyMXoOAEnyhLZEQujfAXnIVXBh?=
 =?us-ascii?Q?cUvTnIHNPnafSCoVty6D5+yWmTBa/5Hlqu7uJ7zFSJBHNFSS0/NGyoGWhZkE?=
 =?us-ascii?Q?kUiuqt2D01u123R8UHgMn9fV1fNVjvwe9Tx219jb8c2B0ZF5odw3vxsT/DpY?=
 =?us-ascii?Q?HceumsnbiPMy0YlQORDBDiASFKwrtIVJe1J3gElQSUuD/U7jjYFkdCv0ERpY?=
 =?us-ascii?Q?YIQCmoB83O7FtO5AjYTQ0q/GIG4dPWsir/UV9Ef+L3L4GC3qCHtSOlK4XKOq?=
 =?us-ascii?Q?WpOafeYaPctDzqfd0dWFSPMDlghjGIm4pRJR9tuoywRhI625YAVdXWh0NWiu?=
 =?us-ascii?Q?rNiLJ3X5svoZsC/+9rN0k5L+7jvLMXjzx/5JuDGV+IQ90JQZQJaGK7BMCHLF?=
 =?us-ascii?Q?rjTFmmhT5qcxwzmE5H8kHq1hy9edefMTafJu2QGl9cT8PXH9/HcjEjlx0He6?=
 =?us-ascii?Q?z18KBabucnz00khj9mVytuailDzs6biWmrAhCdEImI3zMcsGTDDqMiO/NNvw?=
 =?us-ascii?Q?n/jM/3GYRqJFIFneuUQAMRuV+B4neDtL0AZlj//nEQcvKeqc+qU/DLCMJFoW?=
 =?us-ascii?Q?9AALSt7anmwCZkqEhsGlI2qBLd7BrjP/YkD6bDD3++VA2oHpxa6iGxAim0iL?=
 =?us-ascii?Q?/qnizDLP8uA0is9ALhEfrJr2zt2tfb5roo5ML7yBi8BqmERMCSBndE8uXocx?=
 =?us-ascii?Q?mCw1NMELodhtIENU7dz7zQs/S+SRous9JgVvcwrqliPhh0LNbvca9Mg18jt5?=
 =?us-ascii?Q?AK5JoKn1v4qOffojkzt+gq/M6XlkZ8og6xPEb+HrQSp6n99NKBzNxW931qL3?=
 =?us-ascii?Q?985wPQGdtGyswdHCEIoShpmTQPbcYX6NJTNZZXzDz1j5xu33wlMvZ3oSkhNV?=
 =?us-ascii?Q?0v7qp8+ohDPTnf1ChD8RdC5SN1wYC6sxtKnWLQm8kIEJTJuScAUh9vVLEzK/?=
 =?us-ascii?Q?zRms6y9Of/ID1ONux9Oo9utURSb7BooHmeJ1jYCGpPAgpA76n6egYhiVS5Ej?=
 =?us-ascii?Q?A6XRv5X7XEnisz0nON6nZaZX61YjwfnlkEqnmjHYp+orFCGLIm3+qr+24jHE?=
 =?us-ascii?Q?hRBX0g6bUf7pPa1uxflscPuD944Fzw3nuKZRNhM+uEBIi+C2zUm7TeWL+zyr?=
 =?us-ascii?Q?v0AC7HIrgyzJsS8KpPOEUedzOePuyHt0QAySgBPJUGZfzuJgZ6u8RdKFB2zc?=
 =?us-ascii?Q?Js/0eaC0xtUQGRrU4KOXZBQfh3p+1O0tZTgA8h/JP8zQcN5QE6EERgfEjFnX?=
 =?us-ascii?Q?0vFz0GBbBoy9VD0OpU5nZX3NJ9HFdSizPB5BfCoIChWRir7hvOASa76FT69c?=
 =?us-ascii?Q?6aToh06mVaRrRDI+bmsLAia6ibytM2v57qAFDhatfgbLbjefNK603Ox08ek/?=
 =?us-ascii?Q?fWabR4yfG8VlN2VHqeirF+XxbZJAtJIKJeUpRzUpS/4Qv2Eu1V9hF7StG0YO?=
 =?us-ascii?Q?H+ruKE5Y45Z6C9f8JO6AuuhhE1KmTfvnnGFdvUSOwBbp/cHWWwQpQuNkPeol?=
 =?us-ascii?Q?NQkllVMimRWuRIRweNijAdxTJos4uKkPjOPwmmirZ1jqCEai0xIJzRJGnPL9?=
 =?us-ascii?Q?6VkaEffqungK1OZ3e3gK/pOGxEneJz9ssqwhPSBaWXglgwfQKApOT4K3QpcR?=
 =?us-ascii?Q?Vhv/oIu2tdWEWlK+ihXw6Y9JUuIkODUiu5Mqi7LHd48l7CuZ1Kxc?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f770eda0-5d71-47d5-a473-08df0f22e1ab
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 10:04:20.0436
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nwnhSbO+zrGdYHDNpJUEoZm9bzpTmWVHJ14ffkZdIfYhTBLXjaJvhc90lszd9EAd5dc4KspkYqLEiI8fV0/7Vdj5dzLnLO4SdjXTbw4vb9D/KB2k/G1k7DeOC/hVg9ig
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1233

Add pinctrl driver for StarFive JHB100 SoC System-2(sys2) pinctrl
controller.

Co-developed-by: Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
Signed-off-by: Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
Signed-off-by: Alex Soo <yuklin.soo@starfivetech.com>
Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 drivers/pinctrl/starfive/Kconfig              |  11 ++
 drivers/pinctrl/starfive/Makefile             |   1 +
 .../starfive/pinctrl-starfive-jhb100-sys2.c   | 140 ++++++++++++++++++
 3 files changed, 152 insertions(+)
 create mode 100644 drivers/pinctrl/starfive/pinctrl-starfive-jhb100-sys2.c

diff --git a/drivers/pinctrl/starfive/Kconfig b/drivers/pinctrl/starfive/Kconfig
index 895b9cb0cb2a..1d7e661455a8 100644
--- a/drivers/pinctrl/starfive/Kconfig
+++ b/drivers/pinctrl/starfive/Kconfig
@@ -88,3 +88,14 @@ config PINCTRL_STARFIVE_JHB100_SYS1
 	  This also provides an interface to the GPIO pins not used by other
 	  peripherals supporting inputs, outputs, configuring pull-up/pull-down
 	  and interrupts on input changes.
+
+config PINCTRL_STARFIVE_JHB100_SYS2
+	tristate "StarFive JHB100 SoC System-2 pinctrl and GPIO driver"
+	depends on ARCH_STARFIVE || COMPILE_TEST
+	select PINCTRL_STARFIVE_JHB100
+	default ARCH_STARFIVE
+	help
+	  Say yes here to support System-2 pin control on the StarFive JHB100 SoC.
+	  This also provides an interface to the GPIO pins not used by other
+	  peripherals supporting inputs, outputs, configuring pull-up/pull-down
+	  and interrupts on input changes.
diff --git a/drivers/pinctrl/starfive/Makefile b/drivers/pinctrl/starfive/Makefile
index 8d96cf80d377..b817ad93b91d 100644
--- a/drivers/pinctrl/starfive/Makefile
+++ b/drivers/pinctrl/starfive/Makefile
@@ -10,3 +10,4 @@ obj-$(CONFIG_PINCTRL_STARFIVE_JHB100)		+= pinctrl-starfive-jhb100.o
 obj-$(CONFIG_PINCTRL_STARFIVE_JHB100_SYS0)	+= pinctrl-starfive-jhb100-sys0.o
 obj-$(CONFIG_PINCTRL_STARFIVE_JHB100_SYS0H)	+= pinctrl-starfive-jhb100-sys0h.o
 obj-$(CONFIG_PINCTRL_STARFIVE_JHB100_SYS1)	+= pinctrl-starfive-jhb100-sys1.o
+obj-$(CONFIG_PINCTRL_STARFIVE_JHB100_SYS2)	+= pinctrl-starfive-jhb100-sys2.o
diff --git a/drivers/pinctrl/starfive/pinctrl-starfive-jhb100-sys2.c b/drivers/pinctrl/starfive/pinctrl-starfive-jhb100-sys2.c
new file mode 100644
index 000000000000..2744744882e8
--- /dev/null
+++ b/drivers/pinctrl/starfive/pinctrl-starfive-jhb100-sys2.c
@@ -0,0 +1,140 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Pinctrl / GPIO driver for StarFive JHB100 SoC System-2 domain
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
+/* sys2 pad numbers */
+#define PADNUM_SYS2_GPIO_A36				12
+#define PADNUM_SYS2_GPIO_A37				13
+#define PADNUM_SYS2_GPIO_A38				14
+#define PADNUM_SYS2_GPIO_A39				15
+#define PADNUM_SYS2_GPIO_A40				16
+#define PADNUM_SYS2_GPIO_A41				17
+#define PADNUM_SYS2_GPIO_A42				18
+#define PADNUM_SYS2_GPIO_A43				19
+
+static const struct jhb100_pin_layout_desc jhb100_sys2_pl_desc[] = {
+	{ .pin_start = 0, .pin_cnt = 37, .name = "gpio", .gpio_func_sel = 0 },
+	{ .pin_start = 37, .pin_cnt = 1, .name = "jtag_tck", .gpio_func_sel = -1 },
+	{ .pin_start = 38, .pin_cnt = 1, .name = "jtag_tresetn", .gpio_func_sel = -1 },
+	{ .pin_start = 39, .pin_cnt = 1, .name = "jtag_tmc", .gpio_func_sel = -1 },
+	{ .pin_start = 40, .pin_cnt = 1, .name = "jtag_tdi", .gpio_func_sel = -1 },
+	{ .pin_start = 41, .pin_cnt = 1, .name = "jtag_tdo", .gpio_func_sel = -1 },
+	{ .pin_start = 42, .pin_cnt = 1, .name = "jtag_hpd", .gpio_func_sel = -1 },
+	{ 0xff },
+};
+
+static const struct config_reg_layout_desc jhb100_sys2_pinctrl_rl_desc[] = {
+	{
+		.pin_start					= 0,
+		.pin_cnt					= 37,
+		.fields[PAD_CFG_DRIVE_STRENGTH_2BIT]		= { .shift = 0, .width = 2 },
+		.fields[PAD_CFG_INPUT_ENABLE]			= { .shift = 2, .width = 1 },
+		.fields[PAD_CFG_PULL_DOWN]			= { .shift = 3, .width = 1 },
+		.fields[PAD_CFG_PULL_UP]			= { .shift = 4, .width = 1 },
+		.fields[PAD_CFG_SLEW_RATE]			= { .shift = 5, .width = 1 },
+		.fields[PAD_CFG_SCHMITT_TRIGGER_SELECT]		= { .shift = 6, .width = 1 },
+		.fields[PAD_CFG_DEBOUNCE_WIDTH]			= { .shift = 15, .width = 17 },
+	},
+	{
+		.pin_start					= 37,
+		.pin_cnt					= 6,
+		.fields[PAD_CFG_DRIVE_STRENGTH_2BIT]		= { .shift = 0, .width = 2 },
+		.fields[PAD_CFG_INPUT_ENABLE]			= { .shift = 2, .width = 1 },
+		.fields[PAD_CFG_PULL_DOWN]			= { .shift = 3, .width = 1 },
+		.fields[PAD_CFG_PULL_UP]			= { .shift = 4, .width = 1 },
+		.fields[PAD_CFG_SLEW_RATE]			= { .shift = 5, .width = 1 },
+		.fields[PAD_CFG_SCHMITT_TRIGGER_SELECT]		= { .shift = 6, .width = 1 },
+	},
+	{ 0xff },
+};
+
+static const struct pinvref_desc pinvref_desc_sys2[] = {
+	{
+		/* gpiow */
+		.pin_grp = {
+			PADNUM_SYS2_GPIO_A36,
+			PADNUM_SYS2_GPIO_A37,
+			PADNUM_SYS2_GPIO_A38,
+			PADNUM_SYS2_GPIO_A39
+		},
+		.num_pins = 4,
+		.range = BIT(JHB100_PINVREF_1_8V) | BIT(JHB100_PINVREF_3_3V)
+	},
+	{
+		/* gpiow-inner */
+		.pin_grp = {
+			PADNUM_SYS2_GPIO_A40,
+			PADNUM_SYS2_GPIO_A41,
+			PADNUM_SYS2_GPIO_A42,
+			PADNUM_SYS2_GPIO_A43
+		},
+		.num_pins = 4,
+		.range = BIT(JHB100_PINVREF_1_8V) | BIT(JHB100_PINVREF_3_3V)
+	},
+};
+
+static const struct starfive_pinctrl_regs jhb100_sys2_pinctrl_regs = {
+	.vref			= { .reg = 0x000, .pv_desc = pinvref_desc_sys2,
+				    .num_pv = ARRAY_SIZE(pinvref_desc_sys2) },
+	.func_sel		= { .reg = 0x0d4, .width_per_pin = 2 },
+	.config			= 0x010,
+	.output			= 0x0bc,
+	.output_en		= 0x0c4,
+	.gpio_status		= 0x0cc,
+	.irq_en			= 0x0e0,
+	.irq_status		= 0x0e8,
+	.irq_clr		= 0x0f0,
+	.irq_trigger		= 0x0f8,
+	.irq_level		= 0x100,
+	.irq_both_edge		= 0x108,
+	.irq_edge		= 0x110,
+};
+
+static const struct jhb100_pinctrl_func_maps jhb100_func_maps_sys2[] = {
+	{ .func = "gpio",		.val = 0 },
+	{ .func = "host0_port80",	.val = 2 },
+	{ .func = "host1_port80",	.val = 3 },
+	{ .func = "jtag",		.val = 2 },
+	{ .func = "smbalert",		.val = 2 },
+	{ .func = "uart",		.val = 1 },
+};
+
+static const struct jhb100_pinctrl_domain_info jhb100_sys2_pinctrl_info = {
+	.name			= "jhb100-sys2",
+	.pl_desc		= jhb100_sys2_pl_desc,
+	.crl_desc		= jhb100_sys2_pinctrl_rl_desc,
+	.regs			= &jhb100_sys2_pinctrl_regs,
+	.fmaps			= jhb100_func_maps_sys2,
+	.num_maps		= ARRAY_SIZE(jhb100_func_maps_sys2),
+};
+
+static const struct of_device_id jhb100_sys2_pinctrl_of_match[] = {
+	{
+		.compatible = "starfive,jhb100-sys2-pinctrl",
+		.data = &jhb100_sys2_pinctrl_info,
+	},
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, jhb100_sys2_pinctrl_of_match);
+
+static struct platform_driver jhb100_sys2_pinctrl_driver = {
+	.probe = jhb100_pinctrl_probe,
+	.driver = {
+		.name = "starfive-jhb100-sys2-pinctrl",
+		.of_match_table = jhb100_sys2_pinctrl_of_match,
+	},
+};
+module_platform_driver(jhb100_sys2_pinctrl_driver);
+
+MODULE_DESCRIPTION("Pinctrl driver for StarFive JHB100 SoC System-2 domain");
+MODULE_AUTHOR("Alex Soo <yuklin.soo@starfivetech.com>");
+MODULE_LICENSE("GPL");
-- 
2.25.1

