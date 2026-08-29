Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2120.outbound.protection.partner.outlook.cn [139.219.17.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CB9B2D5432;
	Sat, 29 Aug 2026 02:58:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.120
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787972291; cv=fail; b=te5sEfbv1l4xIVaVUWjYRCahCVFogpzzihpn3tU8NtMclBytswj2kxtxwDFZa+TZ/eA/P4Ro3np1rVTVxj04uK55e+WsPyuv/RHjI3KqEeANWqTVq56Ym481jbKoS5kn4nEJnBUdFHw7uHEiQb9LurdxZZGSPfnCS/iou39Q4n4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787972291; c=relaxed/simple;
	bh=uspZmE7QmLkesus3hxM9vvmTIKxlCtYYnI8ug0jf25g=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=A0Dn8csvveMXle/fqjGiHF0mnV2hdht0qjRoPSGREHfvG2yQABkjs4Oh1ujNf436+vVFP682R8b/1pE/4aTTosccmFdqzhyPlEIMPDZNVN1+SEoyUNWbadXgP9s1Ehsb1I4/UAQfXEPpQPVQcpjcl4Q6WjZA6YufWhiPwOKuIo4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VZ6NyZgTbJA7L9S2lsy/AwRijz1VgRfr6TQ0rKm0VM4CNFOjLX9SvwWPWzeegTOJKtIs2AKXKbQiEDUs91a14K9U6S375W+WVIlsCKfVtZan10Ipl9F4LOMFj9YT/nuXZY9bV/P6Jz7bp0Vt0lSBUYJtrf7mHPW3ba7Ni/iKf3RgKAfUmPbjYNlhXddUdrw59po4QCutu2GeLEMUzkW7NyNLpfQCs67VXWb062f+QYjD6MDSgTXy3oEgrFOv67loAYvXDoNlw0PEuMQqyioWrAS37myIEe0Usryeapa5hH1xXsFEY38h5/CM0K/kWUP5nY1FaosXyK1POzicjjKYJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pqdM7TVd3wwrdROU1NL3U0Nk/g/MAtBv+F8JVaZ6tvY=;
 b=D3lxqLA89vrfD6dw7SHIQgAkaQ3/KfwXiucVszcUZYmTcyGvCZWbvHzInWJKNh521pUoPotNTji1PMOuzOaxur3tSNPkbjGsSmri/ASCx9pzmLhlskoG2kstS5+k1ZlMmtGb37iBmdTP4Ze309FBcU+g7EcVMlvp653Zclgf9UsG1PzUiNq8bmJ7uR7tjzSpOH7Pvy58lgYotJcswg8tdo8duwWB1eGJxe1GwNZ2M/kteH5AKqbui7k1CxndVtUckm3v9h5qT0rw2cJXNX9ufz9DjBnho130x7WfAXaC3TP2dbc7VGUMgQrWDHzGWDrgJ4mqwfMFWTZBQk6mOIShhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1329.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:16::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Sat, 29 Aug
 2026 02:57:58 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0315.011; Sat, 29 Aug 2026 02:57:58 +0000
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
Subject: [PATCH v6 18/21] pinctrl: starfive: Add StarFive JHB100 per2pok controller driver
Date: Fri, 28 Aug 2026 19:57:17 -0700
Message-Id: <20260829025720.23915-19-changhuang.liang@starfivetech.com>
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
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1329:EE_
X-MS-Office365-Filtering-Correlation-Id: 3aa7f588-c5f4-44cb-ca0e-08df057954c0
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|7416014|366016|52116014|376014|22082099003|5023799004|56012099006|18002099003|3023799007|921020|38350700014|6133799003|10067099003;
X-Microsoft-Antispam-Message-Info:
	s9nKeDLrUfU8M+Sy34R5rvaLFNBmwANOWOptGVDTtK+iiNXdSfwFdl45NUxtqe5KIQw3/8kEik09Xf1TYEyhR8dE/L31ECXevnLNL/17KKMqWMiVT8PGtzz173b0i2+BAuPdAhwfxVsRKwkq9ZwQKvgmeuOzPvD+ITPXJaUOzk+pDrr2Hz9BaWp/29Ce/KugXw2n6ogopNxRK/TGJQfrzLRuIQPZIasWV1IhqI2ZqNOM7MRYs3yokJwYTlWrN5RG/uYlfp4WXCX1fltejallOmbg/nC3YF/ffwrl3MJ1z2vxBzhFDposFKvt3wDTYrHLo+NV6oW/DC6l24/Cy1lqzVjp9K22sRK/lsw3g9nw18b61G6oLIsRswUPMATYV0WmZ8vvgdjV3hyDBejudh/HfWCYYXtTJBmT47570muCU4AwLr1++LejauyC36YSsVRYbLqqc3x65vmsb8ZnoT8/wAbIzNfIshU5moxkC9mCR3PQ4n43q7qbg/he/ZtFnNlYzWvAxMRhNJN3GexUns1mqaAOHzc2V1HpxH9DXhYYCSqvXH174K+OWd/yeRT28gDNHnm/siXSEE2i2I5WBwpNyw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(7416014)(366016)(52116014)(376014)(22082099003)(5023799004)(56012099006)(18002099003)(3023799007)(921020)(38350700014)(6133799003)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3ht78/5GQUjU6F4hhbJ/VWqowxJ8uQmsmi4M8DYjiD3sjpgmts+27sXPeiM4?=
 =?us-ascii?Q?jDSku5Q4IEqlwwUtKTcgdi65ZXoCpgI0+AnY0qRgLbAn4PZ/R9CSeo0Bvxci?=
 =?us-ascii?Q?yDmAA5oS/FKtCuXI06G1roi4Bo6ZX4AdrDqhP+6ojmDx+9vI+UXzXNqbr1Sl?=
 =?us-ascii?Q?asWHrKUTvvIflkqAXLjoa7lgNpIk5SuOHvoYhj/HOylebD5UCZkOXD4B1uiG?=
 =?us-ascii?Q?YGlGIFB8ifBAU/m98FIey12JORyONiGhDxhu69uu9rKXL7y8D5ZAtIMo47cS?=
 =?us-ascii?Q?xAynrsGCB+JVMH45CYomDUiTbbZc2nDA+Zs9sFTQEHUrAshYS+pZGyYyd9gT?=
 =?us-ascii?Q?yqiFpHkaUwhQVqfB0oP1kbkLhczsqbja5ZLQs+iEi5iL7xQDMfwNZDjLKwZ9?=
 =?us-ascii?Q?YP5oaejae1+gXC4L5S54Mq8QUFUmMVVCIbZKaF1OehCGIriH4In02Hwvl4cx?=
 =?us-ascii?Q?dPAxQW7RjaBN18Edc/lBlcZWDkRbbBOxTAQ7OwBCFC5vkjxCFnQOg257uBqP?=
 =?us-ascii?Q?VwG7tCMzH+Vu8DSYqp/saEvevYnh46mTtvwEE8E3JLZUlIuz76z2hHlfXrh/?=
 =?us-ascii?Q?ojKf1WrAkRYd1iZ55b591h2XP1+LvTgE6N8TByJ11/hHlRHKodLB5sdYIPsn?=
 =?us-ascii?Q?TjPS4IbeJipw5qKv6Xd/QYVEyhIQaj7X47WZaU7ltZSJm7mbWOn5rvmjLOgW?=
 =?us-ascii?Q?kI1a2acJl3eWDAOswRO79so4tADx5nx8CliIy7vi1y/sc4gAdjoCqGNNMUoO?=
 =?us-ascii?Q?HgF0n0lDZLkcnkNDNQpUVBqxmyxcU8qdSufJnLeBRIXBaYHWa6wojseKaV62?=
 =?us-ascii?Q?CEmIQd3MNMEoanPjAKASQwz7YQjlU3/vOrk3AwviJFwSx46upP9+V7JxLu2Z?=
 =?us-ascii?Q?lga2RCbr5yag+tfUl0NNLTsSzlE/P7z22C/YdC6UKWW12i7lYYpxxmcR5PNE?=
 =?us-ascii?Q?DUxjQ+2WYhM0cctc4+hTdTrtFL/KGcl3+gk4tiPJGyozxGOL8vtKEr5XngHL?=
 =?us-ascii?Q?sj0blfSzCmXqzZL67qkiIyMcjFdveKXAfbGDIaIYupeJwy4BuLbvVbWipT/w?=
 =?us-ascii?Q?0IjsHsACXL/hGJ8e0+d8ZcllvpE/CSRs8XE1kGJh8rRf+TltPNlzPhmB5vCM?=
 =?us-ascii?Q?lPjCTnR+Knwp/PMPE9AhLcDdGun9TIBve+X9VnDP+9uUovql7c2weUDCRkaN?=
 =?us-ascii?Q?1t0dHfCV9Vs39Dv9c2k+6T92iiwVSrtsh3odNvAV0EGdnG4k6Mqk2rufQpeI?=
 =?us-ascii?Q?bM9UTj+DrgnjibRTFqAqhWJeL7/mR89RnIERVMQ2BRSdpSyR5/GfdzqwPMMH?=
 =?us-ascii?Q?Ahnsw5x62UuRIdoqMrlS19PwhFxKOq5iER6zW9GL9RFA3Fnqm7mtaDT1X8Nm?=
 =?us-ascii?Q?rtjLPJCAsyZSbivuTgOHZOcOKf1Zz2x6Si7mqv6t001jDFaU8W+ofBmkzV/Z?=
 =?us-ascii?Q?ZvyTZxMMbkg4ko+0/d8y7ZCICqPSMcOVDf4jNAdd0q8G/+knQzrSLUeEtdKF?=
 =?us-ascii?Q?LmG8X4soAVLzmi1QiEfkGb7gSscZdE5tpgoNEXyS+OE55h9CPrqT+ktqeLFN?=
 =?us-ascii?Q?v9Qlm6lTAuAvtZGoUilzhH2hb+5njZwHmgfJkraZCam33fRsSYLU+N5fwQD6?=
 =?us-ascii?Q?UZjz7tfyBITcr4x8ecJ9/yt6qvN4XwQC/OyhTaTQGeBPYZ5cf8TR3VjjicLM?=
 =?us-ascii?Q?oSfyWfmWqZvur+Xr7xS4b7d8ie+3f0vo2ZeZjznp5LBczE0VgW0anGHPGtyS?=
 =?us-ascii?Q?7vF2qnCfCuoJg7WyloCJdNydigwe4wuyaH6GAg2QOiWt9LCbBBvf?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3aa7f588-c5f4-44cb-ca0e-08df057954c0
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2026 02:57:58.1885
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b6PBtdhuUYtAn6lS5PTHlqm9ilZNOnypYcno85tW46NTkOMHvKGt1cbYPwEAb+lwNGBXlc91wRrvJ3/XyFTrBHCtSdG1IiZno7dfYTlHIaphdnlIwxam635w2Fy/iKFZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1329

Add pinctrl driver for StarFive JHB100 SoC Peripheral-2 Power OK
(per2pok) pinctrl controller.

Co-developed-by: Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
Signed-off-by: Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
Signed-off-by: Alex Soo <yuklin.soo@starfivetech.com>
Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 drivers/pinctrl/starfive/Kconfig              | 11 +++
 drivers/pinctrl/starfive/Makefile             |  1 +
 .../pinctrl-starfive-jhb100-per2pok.c         | 95 +++++++++++++++++++
 3 files changed, 107 insertions(+)
 create mode 100644 drivers/pinctrl/starfive/pinctrl-starfive-jhb100-per2pok.c

diff --git a/drivers/pinctrl/starfive/Kconfig b/drivers/pinctrl/starfive/Kconfig
index ad04a7331a86..cbbd6f1fc338 100644
--- a/drivers/pinctrl/starfive/Kconfig
+++ b/drivers/pinctrl/starfive/Kconfig
@@ -90,6 +90,17 @@ config PINCTRL_STARFIVE_JHB100_PER2
 	  peripherals supporting inputs, outputs, configuring pull-up/pull-down
 	  and interrupts on input changes.
 
+config PINCTRL_STARFIVE_JHB100_PER2POK
+	tristate "StarFive JHB100 SoC Peripheral-2 Power OK pinctrl and GPIO driver"
+	depends on ARCH_STARFIVE || COMPILE_TEST
+	select PINCTRL_STARFIVE_JHB100
+	default ARCH_STARFIVE
+	help
+	  Say yes here to support Peripheral-2 Power OK pin control on the StarFive JHB100 SoC.
+	  This also provides an interface to the GPIO pins not used by other
+	  peripherals supporting inputs, outputs, configuring pull-up/pull-down
+	  and interrupts on input changes.
+
 config PINCTRL_STARFIVE_JHB100_SYS0
 	tristate "StarFive JHB100 SoC System-0 pinctrl and GPIO driver"
 	depends on ARCH_STARFIVE || COMPILE_TEST
diff --git a/drivers/pinctrl/starfive/Makefile b/drivers/pinctrl/starfive/Makefile
index 33213bd1919f..213002da9cdd 100644
--- a/drivers/pinctrl/starfive/Makefile
+++ b/drivers/pinctrl/starfive/Makefile
@@ -10,6 +10,7 @@ obj-$(CONFIG_PINCTRL_STARFIVE_JHB100)		+= pinctrl-starfive-jhb100.o
 obj-$(CONFIG_PINCTRL_STARFIVE_JHB100_PER0)	+= pinctrl-starfive-jhb100-per0.o
 obj-$(CONFIG_PINCTRL_STARFIVE_JHB100_PER1)	+= pinctrl-starfive-jhb100-per1.o
 obj-$(CONFIG_PINCTRL_STARFIVE_JHB100_PER2)	+= pinctrl-starfive-jhb100-per2.o
+obj-$(CONFIG_PINCTRL_STARFIVE_JHB100_PER2POK)	+= pinctrl-starfive-jhb100-per2pok.o
 obj-$(CONFIG_PINCTRL_STARFIVE_JHB100_SYS0)	+= pinctrl-starfive-jhb100-sys0.o
 obj-$(CONFIG_PINCTRL_STARFIVE_JHB100_SYS0H)	+= pinctrl-starfive-jhb100-sys0h.o
 obj-$(CONFIG_PINCTRL_STARFIVE_JHB100_SYS1)	+= pinctrl-starfive-jhb100-sys1.o
diff --git a/drivers/pinctrl/starfive/pinctrl-starfive-jhb100-per2pok.c b/drivers/pinctrl/starfive/pinctrl-starfive-jhb100-per2pok.c
new file mode 100644
index 000000000000..3d7c0f4c4f77
--- /dev/null
+++ b/drivers/pinctrl/starfive/pinctrl-starfive-jhb100-per2pok.c
@@ -0,0 +1,95 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Pinctrl / GPIO driver for StarFive JHB100 SoC Peripheral-2 Power OK domain
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
+static const struct jhb100_pin_layout_desc jhb100_per2pok_pl_desc[] = {
+	{ .pin_start = 0, .pin_cnt = 10, .name = "gpio", .gpio_func_sel = 0 },
+	{ .pin_start = 10, .pin_cnt = 8, .name = "pwm_channel", .gpio_func_sel = 1 },
+	{ 0xff },
+};
+
+static const struct config_reg_layout_desc jhb100_per2pok_pinctrl_rl_desc[] = {
+	{
+		.pin_start					= 0,
+		.pin_cnt					= 18,
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
+static const struct starfive_pinctrl_regs jhb100_per2pok_pinctrl_regs = {
+	.func_sel		= { .reg = 0x58, .width_per_pin = 2 },
+	.config			= 0x04,
+	.output			= 0x4c,
+	.output_en		= 0x50,
+	.gpio_status		= 0x54,
+	.irq_en			= 0x60,
+	.irq_status		= 0x64,
+	.irq_clr		= 0x68,
+	.irq_trigger		= 0x6c,
+	.irq_level		= 0x70,
+	.irq_both_edge		= 0x74,
+	.irq_edge		= 0x78,
+};
+
+static const struct jhb100_pinctrl_func_maps jhb100_func_maps_per2pok[] = {
+	{ .func = "can",		.val = 1 },
+	{ .func = "gpio",		.val = 0,
+	  .max_pin = JHB100_FUNC_MAPS_MAX_PIN(PADNUM_PER2POK_GPIO_D40) },
+	{ .func = "gpio",		.val = 1,
+	  .max_pin = JHB100_FUNC_MAPS_MAX_PIN(PADNUM_PER2POK_GPIO_D48) },
+	{ .func = "host0_port80",	.val = 2 },
+	{ .func = "host1_port80",	.val = 3 },
+	{ .func = "passthru",		.val = 2,
+	  .max_pin = JHB100_FUNC_MAPS_MAX_PIN(PADNUM_PER2POK_GPIO_D36) },
+	{ .func = "passthru",		.val = 1,
+	  .max_pin = JHB100_FUNC_MAPS_MAX_PIN(PADNUM_PER2POK_GPIO_D40) },
+	{ .func = "pwm",		.val = 0 },
+};
+
+static const struct jhb100_pinctrl_domain_info jhb100_per2pok_pinctrl_info = {
+	.name			= "jhb100-per2pok",
+	.pl_desc		= jhb100_per2pok_pl_desc,
+	.crl_desc		= jhb100_per2pok_pinctrl_rl_desc,
+	.regs			= &jhb100_per2pok_pinctrl_regs,
+	.fmaps			= jhb100_func_maps_per2pok,
+	.num_maps		= ARRAY_SIZE(jhb100_func_maps_per2pok),
+};
+
+static const struct of_device_id jhb100_per2pok_pinctrl_of_match[] = {
+	{
+		.compatible = "starfive,jhb100-per2pok-pinctrl",
+		.data = &jhb100_per2pok_pinctrl_info,
+	},
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, jhb100_per2pok_pinctrl_of_match);
+
+static struct platform_driver jhb100_per2pok_pinctrl_driver = {
+	.probe = jhb100_pinctrl_probe,
+	.driver = {
+		.name = "starfive-jhb100-per2pok-pinctrl",
+		.of_match_table = jhb100_per2pok_pinctrl_of_match,
+	},
+};
+module_platform_driver(jhb100_per2pok_pinctrl_driver);
+
+MODULE_DESCRIPTION("Pinctrl driver for StarFive JHB100 SoC Peripheral-2 Power OK domain");
+MODULE_AUTHOR("Alex Soo <yuklin.soo@starfivetech.com>");
+MODULE_LICENSE("GPL");
-- 
2.25.1

