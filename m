Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2091.outbound.protection.partner.outlook.cn [139.219.146.91])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 695E73BAD84;
	Thu, 10 Sep 2026 10:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.91
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789034688; cv=fail; b=jcXYddhb1917ZIGmEYaaAnPrWTq5F0vKgljrUPrXYEZifRDNmDhXEG7ntTXWcHqBhyyJcd/spAS61DsUhHpuA7bA92bNlY1Tg7suGY9uPOEqF3bHAgFs0ma+cvdfi17GaIgIT3NqBcmmIbisMMgSk1pmjZDCnZAvVH6vDnZ7NbE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789034688; c=relaxed/simple;
	bh=4mnJoq7lzKnDrvkY6ubybs4+5RYT9pBI26Q9q7kfYEw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=pN7BboutbdbdNEWHSAHNorgHP0STTNNq0yT2woZjdBUxC7hVP8cU+aBnGxBEQ/hvChxUIR1pSSsRHEPoRXNVEAOyEbD6D0mv1tVk0zEwfD4V4iLmwrm1r1uMwa1Ab4ZzL8BAgyXzFzy/cfVH4LLJSwNnmJDtOfPK87PXXJEJcu4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QslHluwC+M38F6d7yqykYYKqSlW6EHFrUVBa32YikGHlI6uwarle0F2m2riExmREeT1+rhvDEnhVb1QCSU0bfxC5eFCbhHRPvgG8iaq607xfIctIMo3pGDHWox0LgDeWLjTf1U+VkKYJjhpre7TGxsBYrscYX/QdwePH3UmVS+E3BfSjKvQU9G3WLu3arhEsraTvNbwh3rUYaC8kIg7T0bxVYfHL17H/hc/D9273uUhI3ObUBetCeGd3bxz8wJPh0ypkQWpqXA1IpnIstIgjkOCGChkbiXkBDSrsPbtMGOfU8nLvVK2vZx4h1p4H+272/GUTdfD0QrJN3ajXMJewTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UL+UnF3T1w9eSYM5cwCWKodvKBNl/mFZa0YsQFHi86M=;
 b=KZVcfrJAow/JROws9EslhQAvFL7mqcy/QyGWCChe16mHnSc61v2wt3QSLwi2keME2deXbSE97+mM96Mb5TWI5G0rbI9nPhIIjGF3NF932rNH7U6LjOXb+I9LVhPdbwEKnhzf9WMI02ognuykoW4TWMgE3579uP2SlHu7a/zyhRnXRJtGnI7xe2uwqF4wasRXQ6mPZAC4hmoQSTGvYqoBy+Ltvk+xeI44vKtypZ1UoxPqwwEar4lBTIZy6H3RDgZSzmpAdl+M3AuNV1vDctp/l7qiNwIJXi2VB1/1ynm2ehchYAjJsBoN5gIfydiq1iisTRZMmPuZWUUc8rcx9Mzqbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1170.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.18; Thu, 10 Sep
 2026 10:04:26 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0339.017; Thu, 10 Sep 2026 10:04:26 +0000
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
Subject: [PATCH v8 16/22] pinctrl: starfive: Add StarFive JHB100 per2 controller driver
Date: Thu, 10 Sep 2026 03:03:51 -0700
Message-Id: <20260910100357.130134-17-changhuang.liang@starfivetech.com>
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
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1170:EE_
X-MS-Office365-Filtering-Correlation-Id: d20034d5-9e0a-4516-cfdc-08df0f22e58d
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|7416014|1800799024|376014|52116014|6133799003|3023799007|10067099003|18002099003|22082099003|56012099006|5023799004|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	Ojsun3ks+wPeT8FyjO7WQvJcm838s8apIGKY3DeLcaE7G71YiGK/PohZUeCzoVL/7YoO+6aQfeNqVC/1r2WFQ5ngchzaRhV7u9UV52U+iZGRMPzJ7gllxTnM3d0/WbgwNS3gBPzBXIfWTqrmBwlLa5gxRB7gL4rs4bYIPWuAtXAoojYVX4lXwr2ztEAR7A3ieQECoE9GNpPMSN0te/dsKHZWWSxEvKuMZfFNasbQka2DJsk9MwggLgiWnnmGFEDvu+lfIfrtWTUQmt/xwoFKoZ3t9wD0cNbyPp2Bn56nqmzfSag/ydB7VfLm/J3LOu3Sp7y4KToza8bIAaLvjtfqhoXjm4uN7kdtWurTrn+064Y5lhD0pveGwvJCgbn2ufLQ1ihMFU3zyU48U7c+t0BGFGq6UirTjn60a6h1WGMWC1NInFf3QJz66hLk+JFRHbpGkvDqU35iEY4GSXAGpkekX+y4ZEIJrnaCepW7Bsc2tM6kzRdpw998lozVdAnoB/N3HkS7eDON26IFQ6Y5kla5C1ptHeWmbDOaLFcbWspXBL4TmVIEuEu9zYG2ytu73WDlvrc6Rv7uPZv5/sVRvI/QfA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(7416014)(1800799024)(376014)(52116014)(6133799003)(3023799007)(10067099003)(18002099003)(22082099003)(56012099006)(5023799004)(38350700014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?BnpABgeV8/ocr6Pu+kKWu1eWccSJAs4jwXLY0s5/OJvej598eSN32TL1a3pK?=
 =?us-ascii?Q?7ZQN1FiGpji9wDUfRjOvaJy/ukeH6anFfbcEmdpQ08ZmHJfQWsZeXVTHdsbM?=
 =?us-ascii?Q?5uwIq86piL3N1IaLHa0NVzsD2MYPUz+um5QHP0Yzj9H5GyrGZ3bb2qIJgIbi?=
 =?us-ascii?Q?KhCiqMKYeER6pykM10grC1Dd5GB6Rnk9FSQbfKfZfhUr9MVg1CGTaUMuFhBH?=
 =?us-ascii?Q?lh7C6dYn4oiy4HOl8FCG3QoVyWhgsnXCE41w8S558h2Q0dVFvMClyAy+0Pao?=
 =?us-ascii?Q?eHw1ainqmjvbbyq8YgmSdRwpNH04rYW1yeGVyp2LGmsQlybpAlsNs6KcLnQr?=
 =?us-ascii?Q?FWBRLtGU6N9O8skj9mphXcpL4SpB3pW4qN+oKsNODAkRHwAJtEqIFFXWOyHJ?=
 =?us-ascii?Q?tnthtMXITGGSUelIOE6HQU89tr0Bnya9aaLK7kMaIx9qNRMtq1UTTYOVZYwp?=
 =?us-ascii?Q?ICLXx3JskN3zei+qmUt3x64w/jgYdDkqc3A3PagOdy81x+lSa668DyOhtQ9O?=
 =?us-ascii?Q?8s7EaPVlH6T1JfR2HksWkJavYOP1/a/pqm75y71kDPRa+y+XayMM7vgtQHPR?=
 =?us-ascii?Q?breaJHJ2WlaMQEsoTbhbZI84O0GZuTXUK7ZA4uauBbVtFDsqMOYv+3/QzUSO?=
 =?us-ascii?Q?+3VylEf5iZz4qMH+vXd1xDc575itnoKP2BDR/7I6w6Y8y2h/sA0MGvLk1nPU?=
 =?us-ascii?Q?fg9duLJ7nVt9kwZPGIar5TeCeDd7N7Pjii3c8aCUp219t1jiGSePpedrMcD7?=
 =?us-ascii?Q?9/Hzm60nUahjml+vtkTSOd5bzMLP8FnKCcjPg99mE/z4CSbSOWNjgiZ7HoBY?=
 =?us-ascii?Q?H5Ssa+j1/KWaF7HjuWL3MoBDPVldd2EThLO/aDdYTsUcbCUyu3KxP72r5UxH?=
 =?us-ascii?Q?alnR9dvj3gbY/Kf2gqwWaELmMpOh9RlAnllJ5ZNbw0dlXmfiWmAA2YxYQqE2?=
 =?us-ascii?Q?icBgawVxeWAs2fpItaNKZhVynO5ndqf/DHqtxnc+ae5ehxXC4Y4WgyLNiKII?=
 =?us-ascii?Q?LGoLKGhWp2bQPQYNiX+XrSE98AzafpETtInjIZWWOXbjwFztHvJclTisdpGm?=
 =?us-ascii?Q?vnB96mYXvPdQjq5CKEMnKeo4IbQj8tLjMuZMY7JLZZUZXXy9QcbWSJ0LYMSK?=
 =?us-ascii?Q?qs2BraZdh5WiYWrag1TsV7So2SZHBFf7IDdoHYci97sZLNM1Zrq1tgXjegMg?=
 =?us-ascii?Q?oz6ZHFRSQRS0CAKv1znxhhJzQNk9YIueTWikJYqHj4Zl2M5eYKWsGw4UyIQ8?=
 =?us-ascii?Q?rWAhZG2TM23cpsYiL1h03hkSX1ZYRN2U+SBdnpbDExNSZ3v0f/6B9i0es25K?=
 =?us-ascii?Q?UGBMPOzBPcrjHRrZ/5LT2C8s9i7ndNbtNEKQBzsQ/lSnHrVkobqqQRNhsxxU?=
 =?us-ascii?Q?MXZi3UH49TV8StBnc2ipTp9kugIHgqzj9Cc0A2+UNCEADz/f/Cf5HCdJXk5/?=
 =?us-ascii?Q?JXnTK8LLzSrzKXqZkDOonFnm6gFEtP4+V/OYcqMKHImnI/Taky3CIXY2zswT?=
 =?us-ascii?Q?0LUeOT+dnBdss+wgwJpi9RLUiOZxw3rKCCrAhDDFogOGgW4F7nxwm4CHXe4p?=
 =?us-ascii?Q?uFeKV03rURMTo9trUlA7nlYWXY7e3th5erdeanSdO4Kb4I6Czu/iyk+gpdcR?=
 =?us-ascii?Q?xwnT0gJSkMFKAOqAYr1BmngTLh74jq3M/S7Pp6xwv+HI0fSGy4HyDeBmGwiN?=
 =?us-ascii?Q?lqmDgLYnfrCWITR57HIN+XcJ9VrVmd1tqGTr3lzi3d+H7yhpO36ZIMAksQh+?=
 =?us-ascii?Q?h22ffIibCriD9D7U6W4dD+CT4VX2i7ZrpXLl4Q0Hyrxlp+wTAJvt?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d20034d5-9e0a-4516-cfdc-08df0f22e58d
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 10:04:26.5329
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8YCe265BBc+hUp+GfxuE2+G134HEqtGJYASQD3jQ4QFBv7TgvQ/m1JhK1F2S57VSiO17zXnkp2WzYSB5b/uzyKHgcEzZAOgxHKMjZaUNaaUl994b+PFURwdbCxx172+K
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1170

Add pinctrl driver for StarFive JHB100 SoC Peripheral-2(per2) pinctrl
controller.

Co-developed-by: Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
Signed-off-by: Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
Signed-off-by: Alex Soo <yuklin.soo@starfivetech.com>
Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 drivers/pinctrl/starfive/Kconfig              |  11 ++
 drivers/pinctrl/starfive/Makefile             |   1 +
 .../starfive/pinctrl-starfive-jhb100-per2.c   | 136 ++++++++++++++++++
 3 files changed, 148 insertions(+)
 create mode 100644 drivers/pinctrl/starfive/pinctrl-starfive-jhb100-per2.c

diff --git a/drivers/pinctrl/starfive/Kconfig b/drivers/pinctrl/starfive/Kconfig
index 823062be6d9f..0c55d712c2e8 100644
--- a/drivers/pinctrl/starfive/Kconfig
+++ b/drivers/pinctrl/starfive/Kconfig
@@ -78,6 +78,17 @@ config PINCTRL_STARFIVE_JHB100_PER1
 	  peripherals supporting inputs, outputs, configuring pull-up/pull-down
 	  and interrupts on input changes.
 
+config PINCTRL_STARFIVE_JHB100_PER2
+	tristate "StarFive JHB100 SoC Peripheral-2 pinctrl and GPIO driver"
+	depends on ARCH_STARFIVE || COMPILE_TEST
+	select PINCTRL_STARFIVE_JHB100
+	default ARCH_STARFIVE
+	help
+	  Say yes here to support Peripheral-2 pin control on the StarFive JHB100 SoC.
+	  This also provides an interface to the GPIO pins not used by other
+	  peripherals supporting inputs, outputs, configuring pull-up/pull-down
+	  and interrupts on input changes.
+
 config PINCTRL_STARFIVE_JHB100_SYS0
 	tristate "StarFive JHB100 SoC System-0 pinctrl and GPIO driver"
 	depends on ARCH_STARFIVE || COMPILE_TEST
diff --git a/drivers/pinctrl/starfive/Makefile b/drivers/pinctrl/starfive/Makefile
index 6beef7e313ef..33213bd1919f 100644
--- a/drivers/pinctrl/starfive/Makefile
+++ b/drivers/pinctrl/starfive/Makefile
@@ -9,6 +9,7 @@ obj-$(CONFIG_PINCTRL_STARFIVE_JH7110_AON)	+= pinctrl-starfive-jh7110-aon.o
 obj-$(CONFIG_PINCTRL_STARFIVE_JHB100)		+= pinctrl-starfive-jhb100.o
 obj-$(CONFIG_PINCTRL_STARFIVE_JHB100_PER0)	+= pinctrl-starfive-jhb100-per0.o
 obj-$(CONFIG_PINCTRL_STARFIVE_JHB100_PER1)	+= pinctrl-starfive-jhb100-per1.o
+obj-$(CONFIG_PINCTRL_STARFIVE_JHB100_PER2)	+= pinctrl-starfive-jhb100-per2.o
 obj-$(CONFIG_PINCTRL_STARFIVE_JHB100_SYS0)	+= pinctrl-starfive-jhb100-sys0.o
 obj-$(CONFIG_PINCTRL_STARFIVE_JHB100_SYS0H)	+= pinctrl-starfive-jhb100-sys0h.o
 obj-$(CONFIG_PINCTRL_STARFIVE_JHB100_SYS1)	+= pinctrl-starfive-jhb100-sys1.o
diff --git a/drivers/pinctrl/starfive/pinctrl-starfive-jhb100-per2.c b/drivers/pinctrl/starfive/pinctrl-starfive-jhb100-per2.c
new file mode 100644
index 000000000000..282266a127c7
--- /dev/null
+++ b/drivers/pinctrl/starfive/pinctrl-starfive-jhb100-per2.c
@@ -0,0 +1,136 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Pinctrl / GPIO driver for StarFive JHB100 SoC Peripheral-2 domain
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
+/* per2 pad numbers */
+#define PADNUM_PER2_GPIO_D19				19
+#define PADNUM_PER2_GPIO_D20				20
+#define PADNUM_PER2_GPIO_D21				21
+#define PADNUM_PER2_GPIO_D22				22
+#define PADNUM_PER2_GPIO_D23				23
+#define PADNUM_PER2_GPIO_D24				24
+#define PADNUM_PER2_GPIO_D25				25
+#define PADNUM_PER2_GPIO_D26				26
+#define PADNUM_PER2_GPIO_D27				27
+#define PADNUM_PER2_GPIO_D28				28
+#define PADNUM_PER2_GPIO_D29				29
+#define PADNUM_PER2_GPIO_D30				30
+
+static const struct jhb100_pin_layout_desc jhb100_per2_pl_desc[] = {
+	{ .pin_start = 0, .pin_cnt = 15, .name = "gpio", .gpio_func_sel = 0 },
+	{ .pin_start = 15, .pin_cnt = 1, .name = "gpio", .gpio_func_sel = -1 },
+	{ .pin_start = 16, .pin_cnt = 15, .name = "gpio", .gpio_func_sel = 0 },
+	{ 0xff },
+};
+
+static const struct config_reg_layout_desc jhb100_per2_pinctrl_rl_desc[] = {
+	{
+		.pin_start					= 0,
+		.pin_cnt					= 19,
+		.fields[PAD_CFG_DRIVE_STRENGTH_2BIT]		= { .shift = 0, .width = 2 },
+		.fields[PAD_CFG_INPUT_ENABLE]			= { .shift = 2, .width = 1 },
+		.fields[PAD_CFG_PULL_DOWN]			= { .shift = 3, .width = 1 },
+		.fields[PAD_CFG_PULL_UP]			= { .shift = 4, .width = 1 },
+		.fields[PAD_CFG_SLEW_RATE]			= { .shift = 5, .width = 1 },
+		.fields[PAD_CFG_SCHMITT_TRIGGER_SELECT]		= { .shift = 6, .width = 1 },
+		.fields[PAD_CFG_DEBOUNCE_WIDTH]			= { .shift = 15, .width = 17 },
+	},
+	{
+		.pin_start					= 19,
+		.pin_cnt					= 12,
+		.fields[PAD_CFG_INPUT_ENABLE]			= { .shift = 0, .width = 1 },
+		.fields[PAD_CFG_SLEW_RATE]			= { .shift = 1, .width = 1 },
+		.fields[PAD_CFG_VSEL]				= { .shift = 2, .width = 2 },
+		.fields[PAD_CFG_DEBOUNCE_WIDTH]			= { .shift = 15, .width = 17 },
+	},
+	{ 0xff },
+};
+
+static const struct pinvref_desc pinvref_desc_per2[] = {
+	{
+		/* gpionw */
+		.pin_grp = {
+			PADNUM_PER2_GPIO_D19,
+			PADNUM_PER2_GPIO_D20,
+			PADNUM_PER2_GPIO_D21,
+			PADNUM_PER2_GPIO_D22,
+			PADNUM_PER2_GPIO_D23,
+			PADNUM_PER2_GPIO_D24,
+			PADNUM_PER2_GPIO_D25,
+			PADNUM_PER2_GPIO_D26,
+			PADNUM_PER2_GPIO_D27,
+			PADNUM_PER2_GPIO_D28,
+			PADNUM_PER2_GPIO_D29,
+			PADNUM_PER2_GPIO_D30
+		},
+		.num_pins = 12,
+		.range = BIT(JHB100_PINVREF_1_8V) | BIT(JHB100_PINVREF_2_5V) |
+			 BIT(JHB100_PINVREF_3_3V)
+	},
+};
+
+static const struct starfive_pinctrl_regs jhb100_per2_pinctrl_regs = {
+	.vref			= { .reg = 0x00, .pv_desc = pinvref_desc_per2,
+				    .num_pv = ARRAY_SIZE(pinvref_desc_per2) },
+	.func_sel		= { .reg = 0x8c, .width_per_pin = 2 },
+	.config			= 0x04,
+	.output			= 0x80,
+	.output_en		= 0x84,
+	.gpio_status		= 0x88,
+	.irq_en			= 0x94,
+	.irq_status		= 0x98,
+	.irq_clr		= 0x9c,
+	.irq_trigger		= 0xa0,
+	.irq_level		= 0xa4,
+	.irq_both_edge		= 0xa8,
+	.irq_edge		= 0xac,
+};
+
+static const struct jhb100_pinctrl_func_maps jhb100_func_maps_per2[] = {
+	{ .func = "fan_tach",		.val = 1 },
+	{ .func = "gmac_rgmii",		.val = 1 },
+	{ .func = "gmac_rmii",		.val = 2 },
+	{ .func = "gpio",		.val = 0 },
+	{ .func = "host0_port80",	.val = 2 },
+	{ .func = "host1_port80",	.val = 3 },
+};
+
+static const struct jhb100_pinctrl_domain_info jhb100_per2_pinctrl_info = {
+	.name			= "jhb100-per2",
+	.pl_desc		= jhb100_per2_pl_desc,
+	.crl_desc		= jhb100_per2_pinctrl_rl_desc,
+	.regs			= &jhb100_per2_pinctrl_regs,
+	.fmaps			= jhb100_func_maps_per2,
+	.num_maps		= ARRAY_SIZE(jhb100_func_maps_per2),
+};
+
+static const struct of_device_id jhb100_per2_pinctrl_of_match[] = {
+	{
+		.compatible = "starfive,jhb100-per2-pinctrl",
+		.data = &jhb100_per2_pinctrl_info,
+	},
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, jhb100_per2_pinctrl_of_match);
+
+static struct platform_driver jhb100_per2_pinctrl_driver = {
+	.probe = jhb100_pinctrl_probe,
+	.driver = {
+		.name = "starfive-jhb100-per2-pinctrl",
+		.of_match_table = jhb100_per2_pinctrl_of_match,
+	},
+};
+module_platform_driver(jhb100_per2_pinctrl_driver);
+
+MODULE_DESCRIPTION("Pinctrl driver for StarFive JHB100 SoC Peripheral-2 domain");
+MODULE_AUTHOR("Alex Soo <yuklin.soo@starfivetech.com>");
+MODULE_LICENSE("GPL");
-- 
2.25.1

