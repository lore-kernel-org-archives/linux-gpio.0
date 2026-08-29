Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2130.outbound.protection.partner.outlook.cn [139.219.146.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78511331EA6;
	Sat, 29 Aug 2026 03:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.130
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787973298; cv=fail; b=VaAAWnIAmE0hq7cUIBHSxJ2O8AVAwn8IqQVhGpZ/RA0IDBb1rbsNsdeD4/Zjur1Mh3IijRXn1d1DYiw8Y1gx4qOiYBqkJPRdEJbyle8mDRlkJJla13JMo4bS5ugOBpCqkyuhC2RovUnYnNwuy2Koqms6AexWXuhOu9k06pHA4xA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787973298; c=relaxed/simple;
	bh=/QRUPMgPzlnxClCovX464WuFtlAAzfzRRNIGwplclQc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=HHGsUKA9guTqbBbSsekIzEDEFfaEnrRHy1YLLUv92BnOaoPTvLtoVAI9i7+A2tMdk2Y2FvXDsaMGsn0lRhRtbyt+TEYWEUldvla+5/iLBh8n/BDSiC2DY+BMjrVN625kpGr/37HoIwXReIk2EpdOd/RuFhttDBLd15UKeT4mz/g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BPi5eBaxv5ebuu2Oljyries/RjcEpmJWFneNKPTVqyCyXnU509l5OSf4cBh6R5WVJnhsu/zli10jj5+3/QTNOUlX3RWyWfIJ+Hv1/aY59BO+5Xv4TosP+rLlPUEZ0dj6qnx1qje85c8pg0bFlVSWEVKweWTf03xE/xX20+Cf5lgvOqPhEKfW7mcMsOXidHfFdeVxJDvoZ/88ZLye1trXlBptVdfjkeUM9/PYY43iSPaM/YpaOeVntuKxOgjsQdLskFOEkHD7g0jxA9MxZf1c/4c73ZQ++CFRsNN+f85efIYmMM+m5MSTREdQlWVqnVeh7xtugSnRv+MQu7m/B52uSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c/Un8q99WBfoZ5H5w+n/6gPJBMUV2k3U2UUf9+kAh/c=;
 b=J9YusXk/85t67J2UDRRlUUNsfrc5p/l128LF7o3dBAroKWRN6kE4bWVgu5KhwxMP/f1KKcnja6x4/HX+Vb1ZooD9lMnK5DX4jMzdX3l73gnT1MESM9AA2AXg0xn2yAfat9jMJ8XQKAj/0y+gaNOxiYw3py1u6Y6sdz+Komv65z69hSxogcNBTYdo5zPtSxNaSpao8yB+mMRHr3TVM0KAaAPvKPGALyi3OQntOMqg28nufPjFOfUEAYBYu39mW8pAOkpLM3Kjwzq8lhKIoUdblgC7NNwXLdcgCPgf5Zm7NXxq5JVsB+/9GAxmP6j1xleMH+UWdBr3xFFZD3fppD3yLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1153.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:13::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.19; Sat, 29 Aug
 2026 02:57:41 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0315.011; Sat, 29 Aug 2026 02:57:41 +0000
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
Subject: [PATCH v6 06/21] pinctrl: starfive: Add StarFive JHB100 sys0h controller driver
Date: Fri, 28 Aug 2026 19:57:05 -0700
Message-Id: <20260829025720.23915-7-changhuang.liang@starfivetech.com>
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
X-MS-Office365-Filtering-Correlation-Id: e86aa2bb-253d-416c-7647-08df05794af6
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|7416014|376014|52116014|3023799007|18002099003|22082099003|56012099006|5023799004|6133799003|10067099003|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	B1GgfIaOdPUMYU7uTzU726zWZdXpiaG9sVmZVoIRnkB1f/9PYxcgGT2MgYictrAxCdwAhbii+LYh88OMOaHCml+iynZY7+1D0UcaKd1qfVUgCNikp5HIXvHFE/QknBJIhHXPDJgQPnvoCjQHyR6tTtZ8V9n+yhzNmK2Yg6xnYv+yXiOLsmGON5n9/jN1b/B1fJU3FXaGEVxmGRCnnlWeCLaNzte2n5NUpjXKv6GVtJShT7RcsfTtIcTbN0gPvXIZFVvlLRTU9P9TAjSB0sJMNJCrh5yWZLPLaHtPNEHvxbkjmypE65IymQT7IC9OLBvxKjJOaOg2GYnjRfLSaRfpocmFTfV8dRj0eSUFbBl44g8cArasGhC3nGoo5PHVycdhykuSurgG3NozNgnkcgYeXMTsQOOzj2U53uwCUxG7aGliGsbWG2yjPhlWRmM0Tuvh+m+h8DIJwPwfz1/sc2YKh39d4Z7OJxTEPIOvjLiJ9Jmjvf43btCq26GcRI3H7BQtB7+TcOrG4ln46gntkxEhYKrRO9fHLfyjz6Fflf1rcIkapUTrUA6hbQQushSnXtubeZgy0du7QKH18vt0As9vzg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(7416014)(376014)(52116014)(3023799007)(18002099003)(22082099003)(56012099006)(5023799004)(6133799003)(10067099003)(921020)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?UzAhLO6gHaB7dFprzZOY7oPw4L6MQQLtklJxvfHkMnnUHBgto9Eg32DB+3gM?=
 =?us-ascii?Q?jdY2AxzP+q+pg8Q1cEMTvPEfvgtLiz6KMdlzFDdf56wbzxPffFCehgE2f9qD?=
 =?us-ascii?Q?10DxzRMa2HR/TiWtg17j41p3sFVlkf/4bMj+tkGDfYQib47qiVcqwpBwzUcc?=
 =?us-ascii?Q?dqVXtAeVb1Ngo3IidZ3ajMpYZ8VcrjKQGVWqi1oyJt+20M/wHjXnQlhLmEQt?=
 =?us-ascii?Q?Ntk89qqaNutD33fkspafBhr/AdoemFOinRWrbZyTJZnH1kYsfkrSTEp1VoSA?=
 =?us-ascii?Q?qR5xU1pPcq8Fbkg3iBRLK8HtVtAf/kxIQogErS1wNSLouetOXQikGWrGxy2j?=
 =?us-ascii?Q?Oyoh7lsokeeHKUyjm5iofAVwzpcTs0HfbqBA2Rq4Cc8jLF7pYO62TVqEGAsD?=
 =?us-ascii?Q?lDjFMhbjviv9+KSwrp3MU7qfXtbvE+ASkey6x7pI/U6VloybuuPo7c/N6+cK?=
 =?us-ascii?Q?jQunYV19XfGJgt0g1mUt3ejy0iCdHw9RHhE/8VmxBP9F6hPP83+iV/w9aE6R?=
 =?us-ascii?Q?R3+o49Z60Ssq3weOiujRIwBVZ1drab/fnf3quO1GLWCRGQiRgmIqspjMfrub?=
 =?us-ascii?Q?KSA+aaG8zUVb8CEz1T8ldn9rst0N1u1AEUeOAX1Vj7ydc1jWqG1ikhrf2yYQ?=
 =?us-ascii?Q?+M5+/gwXa9lyWMCY4Kk8DrtL223GLSaaj/ETTWjgPps0DZSZ5SwsN4zoRanS?=
 =?us-ascii?Q?S2dlCra5HDRSBwndJxytNLzvGKg4HMXUGJ+NV0b8j20cPZIo+VvjP1PDvO0J?=
 =?us-ascii?Q?jthLHdM8KeXpupspH3UW1M2XvnIyzW7TSnojys4zLwkFJZ4XC9H9ttgzA0l7?=
 =?us-ascii?Q?Jq38xOy3E6cnBJCTy83jexEAzRe3stybNGZ+cAiXBuH9QsEb9L1FAdKPijrh?=
 =?us-ascii?Q?y7rblViuW7JNEy9pOtjGINMs5l1HFosNnW7WGqnC/U6oW1QyILfBHm3AHhH5?=
 =?us-ascii?Q?Nu2YqbJZVkGl+/z7n5HRoZlhFnfVnZ4puuJyJ7cgYbLI1n1fZXVb8AJS5Q8l?=
 =?us-ascii?Q?5ULIFVWclrFx4WxrLW5VDK6IqzWkPHuaFdtB2kMxXB0qQkY3hMvr5OWxnew9?=
 =?us-ascii?Q?KLlZAjVW1nia0bAPBdMWG2TrE4HnE+k6c5zEYAj78/W3nQ6siook9GqWzWgi?=
 =?us-ascii?Q?zKGMvRnUszkQgcGMCCkaysDbDUWb6UG1qiLMcmlejcF4Lvy+3wQdp9qyB4JX?=
 =?us-ascii?Q?99KMOTWoTasY2fSj8oKsVcDwXF9MApKm3IGMVtvrCp16Gnv5bBVCj8HA7AWR?=
 =?us-ascii?Q?v7i8PdNwpG+rJlbT7WLYWwsJMn3s2lYbnqPmJ467ahm5Z3zdfZcW3uantq3S?=
 =?us-ascii?Q?0DncODB2xt2V6zJHFbkZm1+A6jyh8uBicixn0xebvT1IFrQdJdOQMAkwdLJ5?=
 =?us-ascii?Q?XifSuQrFfe3KEYA4d1nwwcBTdP9qIw69ksbwzdbPtnbmS0w0Nwz85FNbEtZm?=
 =?us-ascii?Q?a0B0J1ONtISB/ymP3OToL+xA9qCMczfH7UwB78N2fKvyEu1Lz+pcUhFy+UCt?=
 =?us-ascii?Q?VPmILjMngmFb7GsZODbEqfPLJMwGZFGAJ+lYdZ35Zj5I7N1aaEguPta5hD+6?=
 =?us-ascii?Q?CajZ3+JtUUO8pBngnc5ct6kzXGS7xG7j+lZTHbPLK24hFGCruZ+IGXQuyicV?=
 =?us-ascii?Q?1gAJXxv/+ioKNOGf1rQT3+SdlODn1Mps6+ooed4UzDiu06BiZlgA54wWJE+A?=
 =?us-ascii?Q?6dfNFYlLqtfBCL18O+rCMhAskNffb3dAYkdHYI1B3OcgAK3fb1vG6NVNhwk2?=
 =?us-ascii?Q?5GpY0SXEew+15J7Io0/R4OYtPleo6oyb/RIHbhGb9/zrq+qM4Bg7?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e86aa2bb-253d-416c-7647-08df05794af6
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2026 02:57:41.8661
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z2ehG0j4zvOTgPcZj/qcOzbBhK9mtjtG5Dtk/zKCeasa0gySIDURkmPZ0bgnUee7KOXZelU2XLH5EInrlcAW2q76twATX8sgWWICmGsSHhohgDEdxduE4YOYYUQxBqYy
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1153

Add pinctrl driver for StarFive JHB100 SoC System-0 Host(sys0h) pinctrl
controller.

Co-developed-by: Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
Signed-off-by: Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
Signed-off-by: Alex Soo <yuklin.soo@starfivetech.com>
Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 drivers/pinctrl/starfive/Kconfig              | 11 +++
 drivers/pinctrl/starfive/Makefile             |  1 +
 .../starfive/pinctrl-starfive-jhb100-sys0h.c  | 95 +++++++++++++++++++
 3 files changed, 107 insertions(+)
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
index 000000000000..64305f9c1c3c
--- /dev/null
+++ b/drivers/pinctrl/starfive/pinctrl-starfive-jhb100-sys0h.c
@@ -0,0 +1,95 @@
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

