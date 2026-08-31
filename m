Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2119.outbound.protection.partner.outlook.cn [139.219.17.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 865DE3FB7DE;
	Mon, 31 Aug 2026 11:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.119
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788176167; cv=fail; b=bQdWmu862PUxxGIvp15IRlms0DXdvaqzJ+k2hN+rVzH2bulNyfLeyDphhmhdfDjB6piR34B17pHUVnQ+sck+i3P9CtSrhv8nUT90tA7Hn9Glc5VIWvlwlcv/+AZk23DNXOs6+ylNImmuuWtiqP+WdXDcoUoOm+dPHY38k7nrYPo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788176167; c=relaxed/simple;
	bh=eIFCjX95zx0J4oTIfuaMXGI2QjwI23QYBVFAxgR2WT8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=doIgFUZQQ4THJpCtTi257FV8V/GA1x0gEJhoeBpl7pkuhRALQ6PofLOm6q77I63yVvLc4Khf1syWRAdLeNdHDgQxWl1LLvILk6PnenMRTb+/JFpivRMuty3vsq8qZHl43ACP8opYJG0FEunfTMnrBrpb05KYEZ+lne+3qSCGRTE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hSa84Yu3AWJAAYoji803L1obVqPelX9eFnK8k8BVuhuMiAt6IQGveWGrnBjxiZC/+CSiLG21j/rwBginnCWh9esmNo0udB33FH5rwKvGaZEQq+TAdcPxwKTUvbFl2tPa/3WDg1f5VJs15Aa/e43NOsHWoctXDPvw1/AjE0YwuxfIECIO7HE2eyeuW2kcEgPfypWbvHr5qwf3tLXeCAhiW21LZrTM39nGEypSDQrS3S7WWusYES3uAzm+IC2SYjZWtXozovmHNNgVn3XYoHtV+7GZgTY1L9B9I8LFmYAfqQq2OQzCGHyhG3BeBkKRoPYxHyetrqjJdgmQMP7CQpJfdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pRTncn0g+ZGPBwqNIcQII8SeieqvUp6JF+8zt7m1tTM=;
 b=PpnkRVcWtBdblrwCXVd8UimjH4gDnysvNtz03khKOTgyzPfThSy6DqRJF7+m0N2GyLcXYRfGCIQj8zKykgI2PW66gnLuKF10SsjH3AO3r/LbXdYftJahaJXODXwwCHhaW+u1TTLnjOqmYXElf2tJgeilPrENORHyXJE6YoHmSUMfZo+LvdazWa/GA+oHk7uueAHNji3HqVO4lyqKyroOGidP0kij4ujMm/ZF7X+LZ/rg7mDBaIlzzzzVOSmcWGXTSQWDO6YOfDnDaKtiMl4UmkdnInUNj9wUsW/o4ffhTOR1FonVsRJ3nZ9/DnzE9G++ZUFK79xtk/tmyaV5vZDIxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1332.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:16::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Mon, 31 Aug
 2026 11:35:46 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0315.011; Mon, 31 Aug 2026 11:35:46 +0000
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
Subject: [PATCH v7 18/21] pinctrl: starfive: Add StarFive JHB100 per2pok controller driver
Date: Mon, 31 Aug 2026 04:35:11 -0700
Message-Id: <20260831113514.66382-19-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260831113514.66382-1-changhuang.liang@starfivetech.com>
References: <20260831113514.66382-1-changhuang.liang@starfivetech.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZQ0PR01CA0013.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:5::8) To ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1332:EE_
X-MS-Office365-Filtering-Correlation-Id: 5597eded-7999-479c-fed6-08df0753ff9c
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|52116014|366016|1800799024|376014|7416014|18002099003|38350700014|22082099003|56012099006|5023799004|3023799007|921020|10067099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	EnI7jLNgYAXH1bTPNDAE61UNKbuCz2h07I5pkHFOddsPMEM8CSbLx7Hqp7IfR600e2wwcWKfk3lNN2pE8ZPaYwjfXDrZx4+n9AGude4PthE+GLGU/0QZAw484FaygAwgfBCWk1rtgWFEQTcX+mpTXnS6SZ0LQc9Ica8xfqdTyYpHcf6F3fX3JLWCslGLitSdAJjTxXAOzguelf//b+RYjNaPbe93Ii2O3hiWe2pRdc6aiS9DtKLD9HdoEbCqJ8h3+xcW6iHCqgaouVnbhCCC+mA9cnOwyx76WzFMmHZztaN3zOUoJf0ZZiderqvInVtbTs5q4518oQ7s3howJvjJaGBNfbGk+ANO0B5Dt6KZ4/S76DZvzQ7yknORqi6KZHNjEv5Ca7lK1gAbJJUF+JvGp6nX5fdHCzCV9wqvn7s/Sqi5KLhoWjdA6NWr+P5xmPgsOW7boxJl76W4grKPaFmC3kYxXVfaVHqx8vicGVsn/WWLdsrxT9m7WP6EfgUnBFvb/dRdZeXH17F2fcIU5bztlukZCuBI4EuEoAJG3W4BoHutA6hzM0psHwGFyDNSnqrmBA+5gMGLIv6oPTj94AD+Ow==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(52116014)(366016)(1800799024)(376014)(7416014)(18002099003)(38350700014)(22082099003)(56012099006)(5023799004)(3023799007)(921020)(10067099003)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?spl7S8ODdzvoa63lalyTJLI4XwIdfZKwWRBZfBmtYoNlCg/onB6bwU0Uh8cx?=
 =?us-ascii?Q?PckV/d3jvvZwepOmi9AppZ85bsAJ/ZkqdnNQ5yC97Qzf6+XTG857UuQJQoZY?=
 =?us-ascii?Q?1hnUoo0vi9lMtt7EGWoa043y5XSTy4XxG+/hrtyekj5GH3i29zStzH+1qpSU?=
 =?us-ascii?Q?bkKqnJTlVGaj4sfFNU1O5IxwwKyllJCg6q7tFTRds3y4LRnKD58ugPFVrfYu?=
 =?us-ascii?Q?vx223leyADpNmqGaTepL0h1PDWSzYR0MqGMHC3Z2o5wFy3vIFyaoXYTPluZJ?=
 =?us-ascii?Q?gy+us3asR6scNNwVN5oEKV4Bi1lI3U0zbmATlcsrywNzahWbIKI5o3M4WKqq?=
 =?us-ascii?Q?9j/yroAqRNkprqtC3lVqixTcrndAfVGmLnm9oAXBgw2yDCe2LHZ9DbytpCJq?=
 =?us-ascii?Q?cOLbPgMbGHJRQHYhgjO9iIXHm2KrZlE6hnBAkZ11QfRUOv6EYCg/RW4DoNBB?=
 =?us-ascii?Q?y4oN8IgMmyKwUYeaHUv+g1nciDdDypCR5qOiHfhWdzP/vmhqwcsT5dOYCKDD?=
 =?us-ascii?Q?w589bNPbcyQhl1f79RtDNTmruSZP7rzzMdlg/xtN8q5uET6x5E2ZwVxf9QZu?=
 =?us-ascii?Q?NRjcseIb1wQIvJt8a9I8W08RE7tQy8ITufDzWd3LZeGhzxWuWTKKpF2FiI+y?=
 =?us-ascii?Q?iaCY+kZUdh8LGGUotTFWQEwZC1XLsG/zva1lncVEyW6xqb+Pgh5C4LSo8WBv?=
 =?us-ascii?Q?pDYlf6c7MPfjnoO5CXdBVDAizMEGfu2K6nkP5sWJI7n73GkWunHYa4Zocd6d?=
 =?us-ascii?Q?O+PnoOepmEFKgdWOdVZsPVWd0d6RU0ZMOIoEjQkR7bBaZ1Nz/d0hM7w3lp7k?=
 =?us-ascii?Q?JowzlfVivWHBaGkb8R5hFJv9XP1cDEJprGe5/NWfCzAjOda/u33JlgSAV2nj?=
 =?us-ascii?Q?WRyDdSqdmhDDn2+VeVAZc6KyFAM6jkxaPHJ6REGbkmnA+MTz4lMcHUBFDuIQ?=
 =?us-ascii?Q?F8yAmd/i1K+8t52DD5ZTLUdDfiaHx8Z99+w94v3taUD3FKJW8Bo/LsOZTmKJ?=
 =?us-ascii?Q?Z7NJDl7ppdIwUAnIG1x3rpcnpjDNLfCgVB6krLbqZdPXRNmzqhjEHAzem0c5?=
 =?us-ascii?Q?rm80f8We9wpMuDKnXmpyH+98g2z72XpUVF5HvQtlBMBrq0FHWN5LeNtqGzZX?=
 =?us-ascii?Q?rdWbYOa3xEdyhjTZ4YZ20h8M2fQqBIewVNrcPw97HcY3Dx2ozsADHYpHcniZ?=
 =?us-ascii?Q?D+ErqczMVpJ2PczuIp3XwjIAJIGau1jVYSbBJCg4JCIwjyj7mL11RwhBynGy?=
 =?us-ascii?Q?K2WdZFvAxCjcVUEMZ2n3DqYOHNkoG/yCRXThOKTvg0MZNFJD9VLNvppHICFb?=
 =?us-ascii?Q?wUl6/MYNeqMjz5wJApRYK9H8KCMInQNMOz20871KBKV1KKjldyYHmdYoaakV?=
 =?us-ascii?Q?CEClzdD8cb+ZfMcYypMLZUicIYLYWUiIrcgkPc4XwpLeYhnLnopfaN/Dc6cr?=
 =?us-ascii?Q?OKguxzxtbftfso56SmjC2rGPgFfkz2EgFyFHe+CgH3lFriWwzb5R4UgKec8A?=
 =?us-ascii?Q?JlyBW9qTE6qWnA/Ak418Y7QKhbbWZqmiL+Bf13OPQ54OAlpwK87gRnpe8/Ye?=
 =?us-ascii?Q?EXwOeSUyDQhGSInlwUcOzFV+BRFrdcmizISCybUNsZUpUfMPwdiPZg67wowU?=
 =?us-ascii?Q?PONpNnJoMe8wdk4u5py9UvZSTzXBTlHpGlP1XGt7AOlYMOdjRMQFZkqnaP+j?=
 =?us-ascii?Q?gIahaMYT7Y8XulS46ayF/cAkme7hzlE3+m/GEqFxBb49BznFDiuGgyXR7If2?=
 =?us-ascii?Q?Tl13n5SwMi0tYz6AVIl1LB20xDzrDYLMGZHyTLe36M3TFysVjWXH?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5597eded-7999-479c-fed6-08df0753ff9c
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 11:35:46.4084
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ifg+JJN1XN1ogi48fpv6HpEiA5fh5pGOgL8wEZ/O3PtQn8/Bnw4jhEau2YNukZmVF+A+0WFvIaWDktdpFEl0ygYd8F2OdY4b+PGXEGCRLK9yBE7MmXPZU/Az+V69pbjx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1332

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
index 1567b0a54ee4..081e3ec4464d 100644
--- a/drivers/pinctrl/starfive/Kconfig
+++ b/drivers/pinctrl/starfive/Kconfig
@@ -89,6 +89,17 @@ config PINCTRL_STARFIVE_JHB100_PER2
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

