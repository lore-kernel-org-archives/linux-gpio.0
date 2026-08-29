Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2100.outbound.protection.partner.outlook.cn [139.219.17.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6451C320A14;
	Sat, 29 Aug 2026 02:59:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.100
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787972344; cv=fail; b=txvqgjpbPEKjui/R/Hk0G6UCGUYStIigqShl0cLNRFubeGiHTcx+cVVfT3V+pT2h5xCDh7wrtNoSX+Hyixk2iXAt69JydXFe+hp6WCGcnnxiCc+EvKqyg5/qiW5WxkpVGKO0Ez+nZx5tWgg+WSOYgOUrbbfBE7vTKQblr5CbAe8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787972344; c=relaxed/simple;
	bh=tHellBI331VnyJwjzegeNK4tX+2H1PnPvH/R0+obfYI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=nw1WNJRjziOwcpMRaOqrt7YDdeu6j9rtQPEFy9BZ4wnU4PfXOfYCdwWxMWuc+AXSF+TJPJdKRSHKJ4Xa/Y5qAm5qLwopDAG6TEK2zHl8CSHTumn8ak7Q7tkFew0tKqbhZvvNawb9JOmFs98G2U7HEuctg9sRFhCHVvFOJsbric0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FRtlmLYa8TNlZkIoZl0z3GR2TqNX1XvmN8q6Ary3NpjIDmoYVsfnBV8Eu7x/oalYEsi2K1eAHsNeodI+xKYuiMHua3TQOQCzeUkmxt2saTZeK58pazE8QkNVbd0H+6+519LEMw9zFeKuJMXc6jqcUOhVrXi1W+0hJiEjv2+nkx3mg6pbNbrWfkvRSlmK8TPvQiPIpoacKkVCgvjqJ91L62TKviJh8/jlo0OA+1IVy0s5wFjoEaUnGVrjKeIL89UlNU3ojHHia7gVAkNPmApAT4Yc/ZoIU0dr4g9WZMrMTaDqSZEq4Hz79fculmNBscso5XOE43+V8tzAZRpiizY84w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qEOB6xg25nwkDC0MNE703GEiuNYC2sHBbX+/8Th2jLo=;
 b=ZAcy37KsgndfbvW0jMYDD0WRhEVD5vfv7zJLaSGirTyeI2K+Lf6KgMqlkBOr7Q3Clqx5WEnOeYovUYtPdwdm+oYJtAE/zgDOCl0KXYl/660PS+zecTNom9R/usI+MFGzjlEH+8orpgZfFKH2+0JQ5pV7J7GKMCG3EFbe3i8ipF8fYMFZRZek0MPQ0A8g3S4pxyEGR7QMSO6Y6zu4MPPjL6CQ8fhhydorXzOQBN3fPGbV/iMhWD+jZp0kiqi2i3nfFb/Nu8UVhN3gBOJ6DgX2X8CBtVr3STvIo8Vd4WpIFcsj0Eb24uhi65OcRamx2OTFxt/+7KQp+K3F1G5sXlcmiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1153.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:13::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.19; Sat, 29 Aug
 2026 02:57:47 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0315.011; Sat, 29 Aug 2026 02:57:47 +0000
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
Subject: [PATCH v6 10/21] pinctrl: starfive: Add StarFive JHB100 sys2 controller driver
Date: Fri, 28 Aug 2026 19:57:09 -0700
Message-Id: <20260829025720.23915-11-changhuang.liang@starfivetech.com>
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
X-MS-Office365-Filtering-Correlation-Id: c966d246-1435-44c0-fbc7-08df05794e4f
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|7416014|376014|52116014|3023799007|18002099003|22082099003|56012099006|5023799004|6133799003|10067099003|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	I+JGIQIIi/Rk0e1Q0S2PCEw0WzObXLM+C/5lS1/DZRpqksYBfpf8Cngp+Tbd7exZucokT3MwLi85JQE6oJfv4R0SRNpmG9lrHlqbhase38MqAINRHIoWV5Ab3zyqw0NqOnFYK4iyL9TLro0RnIuM6YpOpwUPuWxOc2VIEkK9nmEeLQVtTnvO4msW58NVcefTwWbYt9aqI9nwjHGVUX4QoEZ4qznfGHS/LCniZe17VFPPQjvuOTJHtmulCzcBd+tDNDBekFkzhXHFCNnZNiFDZdcLXh5VbcpocgcSeyEWOFkGhmClSWcINgTv8hAhBxRKJXExD8kYiOzgqQtI242zeo9NVnsrC80j7a0qHP+xJiRs9XpbuxE3Cy0oiZLR9QqtveKNDzyxRAhx4uhZ39E4dWUhfLjZJ6x4Z21Reu56/KmKYtz6zmcHf3edhE4u5lOUWLJQa/SKs2P7P15pDOxeVvDaufFOPG5o0eHCUhtVTSbJ2nHpYQFZC/OpYM4WD3C9QWt6ykbr8PEOawsAxJ98tH1875quyANqZqxCLbGj3itNqVwiyn5OYzg9yEAPe5Ef69LkqbzLD41ceIVtaile9Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(7416014)(376014)(52116014)(3023799007)(18002099003)(22082099003)(56012099006)(5023799004)(6133799003)(10067099003)(921020)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?IGhi2d8Nefcwz4dUyfJ2upELLDTBnYzytlC2TkjiPwPcH+QdW0vtoIA9TEBQ?=
 =?us-ascii?Q?Sx2savbRDMYsn8rOk+9Vly/LqsCCwDoyNN5/wjHh8O2u+Q5TJ8l91WfpRztj?=
 =?us-ascii?Q?0TGE1F7Pkd9j2WVEwp3M+WMIgycKxvAdOQtx7u5VbCUBKrKb7EqlWPFCFDs5?=
 =?us-ascii?Q?/51nFLKxveL1qJ6yrjUO7gBt4es4YqNYWfmBHzu+1XS5UCiSQLZh1VpKamOE?=
 =?us-ascii?Q?6VUXoCsdv2RVd3D+JuwoM8aE6CVeZoO+jS+vNDS5xESQa7ihIJOZ5KtXgIMH?=
 =?us-ascii?Q?hGoJSSrdnoTpDgtWo04VXXhEX0j78wEQ/pS/oUJm9XrhlSU98VMKjkJriqe1?=
 =?us-ascii?Q?zY7s6zD7Y+qd07LPB6eVBCu47OWWWYnbws6g77rmEeCq22N0cY7T6dNNClwY?=
 =?us-ascii?Q?sqJfi5p1oBGsWvp1W1lYBEnBM0fH0wWsAaCVLBmCoJOGs6u0iCsOdgBJYzF6?=
 =?us-ascii?Q?TNgIC6O71VijjTM+p43r4ii9FkJMDepNPz9M1vtEXL4ls/6cVBCgjiL/5kK7?=
 =?us-ascii?Q?42G+3d/vr6mikzMD2fqmEw2CpF4BcDmTgcDqY+j2DwQuXdAVuylI3gqQI58m?=
 =?us-ascii?Q?VaHx3n7eYH3kN6qqIcRHA7UlHx4sdcPxBQAZ/2RGhNgvBsFNFW8YaqhaZ03M?=
 =?us-ascii?Q?8vgMTgNKO1MXQK7V+uh/U/dgtLPnFGn4E4Vzm7lLYYDwkA6Ms5lD1shb1aYc?=
 =?us-ascii?Q?bHdvmpE8gJceNMRw8+voBQA15qg6AX6EOdkwWvafZfehSNCc29IqyAz3h85l?=
 =?us-ascii?Q?2agXMJUonobCmc8ZRGO19jTdyoY5rMDa52UxV235KBtLiqg3jROfQadiybiL?=
 =?us-ascii?Q?MShD8/MvyrkNzjch5GBSCEN/5DVkr4mMbREdJSYB8Ybrm3aqHfV2X+rr83RM?=
 =?us-ascii?Q?CCe+zLBae5Eb3Hclg2ovx76nQvw5voDm+nYc5XRYsITaat6ACKI9XPvvfcVg?=
 =?us-ascii?Q?IqWOL4cS/RoubGfdvNryc6/Pek8hvSQb0iR+m8NOc3bCe3ru0nas6HukFngM?=
 =?us-ascii?Q?FLsd0aUUbJEBtg562Rfd+VCtxOenqzHzqU0gFoejI+Mc/9ojp94VYtc8jZiy?=
 =?us-ascii?Q?V9xY+ytT6zk48rKFUEWhUPE34AdCMVtdihz6LPO1Iz8K4g0AUKikVPL9PPA8?=
 =?us-ascii?Q?qQCurd7mTno7wIHnxhSSUqCCqnt+3B1TZJ+XLpEdV/LpCllXmms+8AM3lt5+?=
 =?us-ascii?Q?M5X6FW1chZXXI2ciV9nLSY3KqgyS5fX83F41s17Iy5NZxUu3l3gt/D/0S0MQ?=
 =?us-ascii?Q?80D/z8RKV2uo5FOCx4iMSyQdljwrMxDoovYf/4owEUkA8SD2aQ+87hxZaGVs?=
 =?us-ascii?Q?4sGOlMSyMKQ8kK2HBj0z47qc3Q2OSjiNtVSDwkDa0J60kDyoteoZYPnAaRFo?=
 =?us-ascii?Q?eCxckXTozhA58ju0VQ5v2oaoGphAZLM8nN0EopKhXkep8s8ho/dhi3X/Fssx?=
 =?us-ascii?Q?yELufRunr/JZ4pSJE8rDCzuecep+Iat8AMmis2QFtWZa/0eUbtw+P6SSFJi7?=
 =?us-ascii?Q?KNu8OXjeSHe04Q2YUTisrHYKpE6YFMmkTjhpfvwyTRrluuUTDgLB/4qTFf9r?=
 =?us-ascii?Q?DbExIbhssAv/LZVghpRNcQp4qqyzpLvjUncbhDKlo++qm88CDak2VPAHNgU+?=
 =?us-ascii?Q?68kNOuG2qNddKVxo/ktiuKPeIQ+pneT2A2KdpS1hOgJfxqxEPO5C3hVPu+Sw?=
 =?us-ascii?Q?qGwuQYH4vypWM9LoY6jB5X71so2O05r+eN8dgbGcyMivDbB/GV4MLlf8esNk?=
 =?us-ascii?Q?y6j0RgFYrZuvdVPPTMIMZRjCL3Gq3VIEged2dmBxSxNgAKKnbcj3?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c966d246-1435-44c0-fbc7-08df05794e4f
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2026 02:57:47.3880
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aLNM+QTwkyiy4OTcInNc4NTooQ7r9B+SxlZg+qP1m4SLqG9WmJjhesjiJgtqLBSvMRk6XZBmcCAUGaXp989syh8Wu6wjn4OyyQsBM/tiCBsbySnGcPCLg/27vs8xK50x
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1153

Add pinctrl driver for StarFive JHB100 SoC System-2(sys2) pinctrl
controller.

Co-developed-by: Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
Signed-off-by: Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
Signed-off-by: Alex Soo <yuklin.soo@starfivetech.com>
Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 drivers/pinctrl/starfive/Kconfig              |  11 ++
 drivers/pinctrl/starfive/Makefile             |   1 +
 .../starfive/pinctrl-starfive-jhb100-sys2.c   | 131 ++++++++++++++++++
 3 files changed, 143 insertions(+)
 create mode 100644 drivers/pinctrl/starfive/pinctrl-starfive-jhb100-sys2.c

diff --git a/drivers/pinctrl/starfive/Kconfig b/drivers/pinctrl/starfive/Kconfig
index 1cf43e0ae1d7..bb298419ab60 100644
--- a/drivers/pinctrl/starfive/Kconfig
+++ b/drivers/pinctrl/starfive/Kconfig
@@ -89,3 +89,14 @@ config PINCTRL_STARFIVE_JHB100_SYS1
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
index 000000000000..d7609deb580d
--- /dev/null
+++ b/drivers/pinctrl/starfive/pinctrl-starfive-jhb100-sys2.c
@@ -0,0 +1,131 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Pinctrl / GPIO driver for StarFive JHB100 SoC System-2 domain
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
+static struct config_reg_layout_desc jhb100_sys2_pinctrl_rl_desc[] = {
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

