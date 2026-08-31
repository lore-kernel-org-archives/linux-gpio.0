Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2097.outbound.protection.partner.outlook.cn [139.219.146.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C5C83F23C5;
	Mon, 31 Aug 2026 11:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.97
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788176159; cv=fail; b=FW/W+CwdxXav3fyI8ke4oAtnKjQON53lR1sJHs3pBfYXuNyhImJpT2xAQq62gAgVxAR90l+ScyVQhC7/cdPSouRv+zaEn4r/QNI11K5IIsHU08w3yvK1SGBGe5nBMMt532qhyd2v7QnNvRogfPp3YehvSjpJQ9mA9pGsuhicWTY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788176159; c=relaxed/simple;
	bh=hz5K/DN88B93WlDPEqeOBA8/Yg+JzNsOUcm4L2nJiSk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=TJXOmoCRCoHGDL1UZ2X/XF3SkwuKtuzhiJulBYjATrETtkNnibF4LY2AVURVumqsZSc/TtVqoUxDIMl47FFFdDHR4zbcVbwf3nCa2VIkl2ZzucV8lKHWJ5Bp460okuqK/Rb5IyHI9aD2jKeCmP+aDj2FooQJDaj62r0F8o9MQQ8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S1QvKLaVD4icGUOgeVZgYBArOen39RNm5IFsvmaqc7A+e0mrFQbeyto0/PfOkjluXexrayaMLKPglp34KVx8DAtIgFezUAKls4act/SyjwzKi1ytSbQDdK60OHY+ct0E0FcRTb0Z1syQTzA3cfR29nspMsaV3LAE2WEhYF0KfOf6UAZ20ErrgJ11/HG5oQKUTzLBkClkXbO3PvBbnl/gbsRHF8JGbP+tpCnNNt1fMc1MQWFFBhJUeIbwkzSt0u38qxVW8lqN2Ba4lZ7JE6YqeVyS4vAb9hzPs6jb9b3OA0IEDJt4ll5OElj96FKNUnE2inNlSC/FkB383LwBn4PqyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qYPhMGl89ol9C3ncA++kgioHMfs1Ahh5/YpqwpNNTLY=;
 b=KjbW575c8djAUEHQiS3egkPxDog1xPWXy58Yg2UpoNBNIzeCHc1eS4pYZCO3RKVA/fHKegNpvz/fBd9b+Ex8w0kqWh7Mx/aAtAA46TO4qn10DoeBfIMalFw1utd4WpEpeJkiSJJoroFzD6+/8m2+Tc0hq4uikdMfoWPkfAfGpfdiSY0kQa4aI0T86b4VU4k8TNk6eBnhFMizAMKTQ8K/l4ZNYppELfeEwKcwHcpi7aXt3Fj/4sJRE6H3CzCCmS+kyAEUtvdh+5QPy+7lXLVNFouYvGxGxKBnvUogFXdz37++mjQkb/ExXhuDTIdiHjqmY1R0cVg8oKn9M/eBxgc1Fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1332.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:16::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Mon, 31 Aug
 2026 11:35:34 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0315.011; Mon, 31 Aug 2026 11:35:34 +0000
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
Subject: [PATCH v7 08/21] pinctrl: starfive: Add StarFive JHB100 sys1 controller driver
Date: Mon, 31 Aug 2026 04:35:01 -0700
Message-Id: <20260831113514.66382-9-changhuang.liang@starfivetech.com>
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
X-MS-Office365-Filtering-Correlation-Id: 7735975c-02b1-4958-1225-08df0753f894
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|52116014|366016|1800799024|376014|7416014|18002099003|38350700014|22082099003|56012099006|5023799004|3023799007|921020|10067099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	W82CpyFdky21XidU8+S86yeBIFkKh4Ptsv2L2jdPG4Q6QIfZf83LmbV8IZ1yrZHztwScQtZXqEAwVqbeqXqMG2NFK8MGeV7HWtvYOvQZ31h4aq1ioRcgqX8KoJU+G37qHYrPiPG+Tawhr0cpPlCCwn2h+Ft2FYo2w5Lb8atqRcAbI3uxulVhQWThawoB+X8zg9srfgjlsGB+wpnAYZekyy1Jx/bUwcoiV2rFqFOyIDAm5YvsmG0peR+U5V8qZdXjiOII/WBhqfjtbSfmq6EuR7UR1eLLOPwB4lINdqa3euuVeTob55rh1LEDvSfvlhg8F1aJVSolhwKGsGHWii8MLHV3/4t3uTmrW01ZT+Krcl8UfJJUp3UagMeUR5P+OuWLHi9mfgyUvmwaj4CZ/xkGFPBZfdYDEVEwTuO8BQ1IIqdsQgaXHs1ioMhaL/HusH753oWwnpX0PuM5rz2hbkm7RwNjsdFX63X42dMv5YwkA5fBt65Cov58xTE+KrdPK7ruc+pV694azQj7mnepIv087EGJY1DyMJUyYS1062hICWvCFGFjy9ogJW8juRXSkq597t7Uw6+yifSmfxWQG7588Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(52116014)(366016)(1800799024)(376014)(7416014)(18002099003)(38350700014)(22082099003)(56012099006)(5023799004)(3023799007)(921020)(10067099003)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6R7gd4nLAeXXDE6t1hqtnUE5Kyz1t7dAKV29dKoML9ApYpVQzn7Sg2J9NnIq?=
 =?us-ascii?Q?TfYrGSGE4Xyp7NpiLfRSF2jjQ7BvLeJliTMC/1TfCZKlMBT/7nt3WhM1hla7?=
 =?us-ascii?Q?2+MSzn3sp01SavuzuME+1JUZD/Z8jZV3r+qysOvD4D/X1+1/vdZk17T9+SvZ?=
 =?us-ascii?Q?vC+slIQaYBz2cQtjMypVtkqRyOCFSG/THB8J0EyS+c7ncovO6thji0ZF2lYP?=
 =?us-ascii?Q?TK7mbp44U5mMKf+vytUZZMXsM9FimKJi6sk7WtkR8YsIczYd1lr0jyqWi9E0?=
 =?us-ascii?Q?Yr3ikGNBIphJdhAXQFBZQxhWzw3sG5wHd7X1LlivCb1HCnoq7o9y8JGxDnSx?=
 =?us-ascii?Q?sjt/wGoqQdY85OxwG/EuujAvMiG04yr9ZoIdqKRru4UNfOnmH6nWeYv1Jcu6?=
 =?us-ascii?Q?1tN+X/B1LpAyZv+QVUkh8pvz0rJe1+2o06b/I912BxtboxJnQu+mccxEL9he?=
 =?us-ascii?Q?B4kz8E8EVnDPG3+iazNNk4kBNH9tqETZIMoI/yPsND4V43blzFjGEM0y7Z0F?=
 =?us-ascii?Q?Jh1xklFeaxgh1C09uVX8YMOAwVnC/7NxLe0rxCi/CuTpjVUoYtJ9EP5d3Bgn?=
 =?us-ascii?Q?gy6ukTBqZ2TLpxHZ/JqoD+BDOEVc4sAaan2BCOmgwjfPVGCPLoKULFfiFnyQ?=
 =?us-ascii?Q?J6A5B8CHaIIV7QO9GdYYOe9Q3Xb/PxhdF5QamVNlbqwoVZ0vINrnuEv89F5B?=
 =?us-ascii?Q?gSeSNIw1ephoFbjapuSWumuKs+QyEGhjd90seiY3DGybUa25qhr1oCHL0U0l?=
 =?us-ascii?Q?WhLLjPMo9LhqsKVBM7iIxs1Mr07/AJlDN7kqvySU8c9e5z4+xhRpleEkLP7H?=
 =?us-ascii?Q?8vqEHLN7BoXkRjsm8BdGivBCDhaseZUa52DRqFpxtYMreuBb3bXliXt3qeHi?=
 =?us-ascii?Q?U72c+yRNTXzMC09JXxD1HFyTGlEkH1KJKvWG0uKrKeREpzEfWSLIw2KoDbwl?=
 =?us-ascii?Q?NxyC497c+11mb76VSItmfQzi2o1qh6lwjetDk1OadztaYoiZF1HuTFV0N2lq?=
 =?us-ascii?Q?h9sefqKBdOnJTiDWBBJef5ZPT+6cHadoe94R4U5mj+I0kbtFMOLFGXQl71vz?=
 =?us-ascii?Q?xFIX0ps6/S4y6Vi/Ug01pylc7aXPCz4Gh+V/sUaUQqVf/BRC5afMiPzFjppV?=
 =?us-ascii?Q?RpZLiybD2Aw+3c0YwqVYnDMmEnu/ApwOq7uHXwJyk8jPp+qf+G2hTyLjWz+P?=
 =?us-ascii?Q?23+5wjOnjgezmYrFwI+gSJNP7uU+GSPka8M82CP7k3rDeBq8p6B5ovMMMs3a?=
 =?us-ascii?Q?5lqWLJhXIfHBVmNav56vHWq5824l91jBwY6aJJFDaT33v7RYf8KSdbwFCLHc?=
 =?us-ascii?Q?ajtCky9GS/mS7aczWNKx8wdiPA02XriaKmZBrMrmCYvaKWPCN4dnZb6KkBm2?=
 =?us-ascii?Q?czt0Izxi25p9oV9R7/DRzajF6YK65KTW5WEXOKT8Yl/18T3uHQsdX/ye1cuv?=
 =?us-ascii?Q?zceYw95OqDoLHfLV5LHHivfrqPcIrjhdPkRayiJ8YxM7PvOzLtHngQoDyHHJ?=
 =?us-ascii?Q?aplpfxD9brvtAmwXbqMJTHG/+f9Vm4M9N6CzW3IaNC1BvWsPaK8TnxKgCuoZ?=
 =?us-ascii?Q?7zX1JU+hl6M4JBj0MTUc0frfZNb5cucuicmHg4LvjG0Wk/qBiX9YXYA6E+qK?=
 =?us-ascii?Q?hvr3zeQWVEgu22y7C6IYcWBd2jSyRQB78hoy7vNXn/xjCLOumMjKbwwhPDyN?=
 =?us-ascii?Q?qf9zvDsYYs1gz7Ab5VEplmYJM5Kx2YtPRcU8DY0qok/QfR7JzA9QNzykANCh?=
 =?us-ascii?Q?sOOZl5eNObOB0yFFxOgzaCYgw/rdrvSqNtbm52pzdsh6mtznrY3N?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7735975c-02b1-4958-1225-08df0753f894
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 11:35:34.5337
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p+VkkXEzl5n3locjJ4PuTSMq+wce1b8L2GPleBCcieF8+Vh57qd6bFruJJS31sLqsDudv8hzxsd/TQhD7xz4PnvfTE2paIilA8tVAe8o2tJm8B2XK0+FTAIfq2JdHAor
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1332

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
index f927283646d9..0b735cab89e1 100644
--- a/drivers/pinctrl/starfive/Kconfig
+++ b/drivers/pinctrl/starfive/Kconfig
@@ -77,3 +77,14 @@ config PINCTRL_STARFIVE_JHB100_SYS0H
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

