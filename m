Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2110.outbound.protection.partner.outlook.cn [139.219.146.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 544B138758D;
	Sat, 17 Oct 2026 05:41:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.110
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792215716; cv=fail; b=OD10BTQVwf/Bn0KdnVVhjdRKR/dWP5f8B/gjA8bmsKaxWNTBIlrJHpT2D8aclgG+wB+kO7y9mA0sivumChlOiesFDTiGDaomiWPjm9sJYwJR/Sh19yfujWCIqBvxaxiO7SIrK/os0PyVwHc4RBU6/V+hkvDdNhbnjNa3M5rkSCs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792215716; c=relaxed/simple;
	bh=ePERRN92OND3WFHbuu3xfPn1/kLISzatgdZ3Sk9AXr8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Npm8gRM19Rf720r6f0Gg7A4N9neYAa9eU/zzQpFJGYhcAyNGEndGIsObe2CPALoHSGdvzG8c9BoO9d8NuRDdeQQh+rdunodPKBjWxwMgy3r/+cKtSWyS3qxRUhq7RJz/zmFJtjJ99t4wII6t2MUbNz/yJ6Rzv1Wg51OLUDYJwu8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.110
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CmxM6NaydglTEkVRAnADU+halNYeKE2InZxRWAlWT9EwpSwVFprK/6b0C6w3cnVFhGrdAzKkQnXgEyZ9+PFT8I8PyFt9rlQaT28m8PM4VXwtgV0AnTuHid9HMIAWv6JGYHbQZM2omUk8vF80/WDqh3G7I4vCSaSpzImMmvX+Qbi4QwlJa39v3sJJ8fN/tB2LGKErcw7I7xu7AzmCr1jfcrOF4ElBinfUfTsz306T6vqmUgsYoBhn3VPQ9xb2eAzzzngYexEXOwARBDHZYJsYM6RFJmpe7CGMvtIMCY6/wB9Lkklsmn3wcecjJqi5jrV+myh8UYUPOjXDO42Mf8M3HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=76F6HtKyTxkIGGLBbMqWXG0fWxtsEewzbCna4myQQaw=;
 b=BQP0oYPeQ5SUhmtHzcDhWzpyshvpixv94qWSxRulGDhJI8UJAXXCkRsyp/mfcVKpzUms6WHPRNtHOMbBmnRiIWMnrKXxSmzZds+9BQLQMHrnSTEtu+ULMbCE/1+afhiVRcGXfFa7z0hiHX7bAZ3322u839Z+3/N9KGJebDelLkudZGORA2VkldNipiavrTAu3znkw8ByKLekLn33ZMZSPZFl+6RK4sj3jzxPkaQ72ampAo9Ty51W8Gfvzp2r3/jEhoMs0cPHSrSBEJBPLX+rqv6BPWtevLHWrf3J/i4icEwmMJzN75o0qLtYc7MRfCebhQVQ0yOniTDMD1v9qX5Zog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1220.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:14::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.17; Sat, 17 Oct
 2026 05:25:44 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0522.016; Sat, 17 Oct 2026 05:25:44 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>,
	Changhuang Liang <changhuang.liang@starfivetech.com>
Subject: [PATCH v1 2/8] pinctrl: starfive: Add StarFive JHB100 adc0 controller driver
Date: Fri, 16 Oct 2026 22:25:28 -0700
Message-Id: <20261017052534.115203-3-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261017052534.115203-1-changhuang.liang@starfivetech.com>
References: <20261017052534.115203-1-changhuang.liang@starfivetech.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: NT0PR01CA0031.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:c::14) To ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1220:EE_
X-MS-Office365-Filtering-Correlation-Id: 4cc1a936-6816-4b0a-4367-08df2c0f17b9
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|366016|52116014|376014|38350700014|56012099006|5023799004|261009223027099003|10067099003|18002099003|22082099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	O0xHxWWXbSUsWyy6s5mQa//NkzYZ8NjfNiVifVSMogfASq3i6yRTb+LAbZI6zM21yMEZgpK7A5yVUAEjh1iZ509iveHRuOG3YqM51F2mPBD7S/yeb1XZGKHXzmUaKpxHC8R4MydXGHcfpYgeptqv4gkkPSz+jfUftZ999OSjsmmu/4J08jiDzYcPXAFCget4wrmbw+gP8usvBCgLZgbzUvecJJkf5wGzZWPXOXGg3BuOsKx7FQ7v5dpfM9p58MGLSYH6z92FMIZYbCdldZ3AaN7akqqwpiEvg16BTlFMeCwZnLNBSIs8TwVWPFq6g+zRJRVpNfgg3ZUkTr3QDfK9h2xw4DWA9BgCFRUITqvY1aHQ8rWqtz8WqMUrciRt8oY4wd0WsIayA5+MAXHcIpqCiuecHeGmjuptizsAofkGKHgoHbVIGGzzZWmM+qwJ5WpQDdHcjxNHu++q/mhgNXw6fTQ65vL0KnY7uvOyLsaJBV/70jggfIgUnFoTHBkZyuKhwngQe2n+5LjaWcXrXt8tjr94LYmGd7VZmWMADq/8jx5n66pxuSfm5n5/khxaliAZ
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(52116014)(376014)(38350700014)(56012099006)(5023799004)(261009223027099003)(10067099003)(18002099003)(22082099003)(6133799003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?LNJA5an6VuJK3TRCBGWgPy+5ZN/TiYeu31gYXA8Scj3ABPFeLP/eEMc1z80U?=
 =?us-ascii?Q?DyMvGCTq0aytdLCkIzXgNy+aUNxG+xpiiw/r4Tn251trzU7Qo1vIeKvwWNE3?=
 =?us-ascii?Q?+kxdlhyomyB/277uLPXuE1JZoAsT+4W9kh/ZMF1RuKdz/BxVQn2ceOggl3/B?=
 =?us-ascii?Q?puKy9Ch/FOvbgPMBOv8OwZK7I4rwW/zXpusxkSjnRTQttKNpJsZ/UMg2j1qr?=
 =?us-ascii?Q?rWHVBmOaUyPXWA/BnMANpOrY075QqrBdteeKf9aBHKs6ZVGXnimyeK4h1grl?=
 =?us-ascii?Q?G7y0EU/yrcub/EGk5EKbyupGMlyoLYO0HYjMCZ5v/cQ/6li7xnhwiYZKSiSY?=
 =?us-ascii?Q?zU5dGDpwf2ecn24S7gZoVVhhhGCMC4GwUwes5xHPR86F/dqxSsDlFBE2uksG?=
 =?us-ascii?Q?sSt+YgpqrfJBlPH7yRn7OLLzyyY/Ozb8ty4Bel/LeGD4ODas3313TH33kohO?=
 =?us-ascii?Q?xazDx72ktR5eP7/NQJRRSms9xNIfJr9rYP8ndxgTxcuCIIRJ1GrdEXjDX8H9?=
 =?us-ascii?Q?YWmkqHOMRuwd51yAvauDRKUcLzgoytRspvHoOA0aEjcgkaERwPIGj6oxO1hx?=
 =?us-ascii?Q?KRiNPlX7TaRt/EVdeFV0DjgCKp/n+urwbyZcghKkK6OgiKW7RbmIXX1FYngO?=
 =?us-ascii?Q?TzAFJhS1BusUEkETsRo2KDCxUxNdE2PFxMLYGnVBgXBjt5oPpoxWjELOv415?=
 =?us-ascii?Q?KizJ2uMfBaWIzNi7w7pZAls89rw5zRugJVs34SbTYZQo3hI4VVaIx5jDUG0Q?=
 =?us-ascii?Q?mH80panwvrsBhIip8DlpMiddPluVf+Xdnx3Jr79yM4epTX4qalcWlQ8D0bp4?=
 =?us-ascii?Q?8MxIUdOxKci7t39OKI+47fO346oQ/WaM6BrImiMMAKijPGqaW/Q0JjrmcEUM?=
 =?us-ascii?Q?oS6sCV+7KyHr8ok1YUrLVxnWX1mDQWR/B/vQMorAg0C6+Plsg5TShPEm5Bup?=
 =?us-ascii?Q?64FcL4c8CL0133eJaxeiqaJN/R0SmjPqgT27V1r0BKUp+Wa1cWctgsnqWlH1?=
 =?us-ascii?Q?Iwtnm78UkJFZZAV/bk9ZUO0el2yksUb+Cr0n4hP1zpzTr+63JoZTusCDwHzK?=
 =?us-ascii?Q?GvY9ryrUS+fN3ZVs+8ib/JD1OFMcxm320RJs++l4+fgZ6Awxi8sVZa6KVYVf?=
 =?us-ascii?Q?juYkMjfUGs+A4dRbr4VojlerMU/lJ6tdF93OCG4t2qceqbZXffb04WMddnNO?=
 =?us-ascii?Q?nSBDztH+1O0vo9H0Nkg63xmQIzaUPjIOOxOncXq70+SKylHYuAshum4mz0Ge?=
 =?us-ascii?Q?A33YpyYKlBNCSGIl1qkBbj45ckuGrtli+A/xY7pezeir9+Zdxkwl1d85fglf?=
 =?us-ascii?Q?ckgau6I1qISDFVa6JvsQAvqKD0UtK7DVAlgBs1Ua9LhkX7nVMeAnvb6ySEJL?=
 =?us-ascii?Q?EPqhmk5uoDKRcvkuHJI0Xgy7aodWndjLLMPuG7HgsPoIRgHo8hxTLXmG2BeJ?=
 =?us-ascii?Q?ZUn4VNbeXKUT/mxDbM5aIw0/HGGdTzL+8NugSm0FVyWzwBmqd3mHWcGnqMzw?=
 =?us-ascii?Q?YECIFMznFjo0GJjIM2f6oPBUtj6N040rpHfgHL+7y1Vfn6NmAjkSC2AlSsxe?=
 =?us-ascii?Q?yNYB9C8UFG800oWXwl1apUvi7xOCKJHTrbv6ZDwziT7K9Mxbvg/r/m71zbtZ?=
 =?us-ascii?Q?ZUPru0cf0lM/GpzvNbN2AciEWeImQ0TsdqRjGhm+BX3xPYUUCSs5Sob8Z7hC?=
 =?us-ascii?Q?CtbPUcqlbkq3Ovnq8rl7EUWVJdRFRr4t0G3UpdUQLPSQ7A2dQNgVFMv1RB3L?=
 =?us-ascii?Q?xnyXZu7mVHIiewSRbXbmNkO4iHEwjNh4pXkrMPnqO7iwz6+NFZxY?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4cc1a936-6816-4b0a-4367-08df2c0f17b9
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2026 05:25:44.5034
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fku0cLFica6VSyYktAZq+fhQSLM/4YMp14sQIQovmFGVG5FLxUq5H53EO5gSCOkHdtogPzQo8Fz/eUTqFJgDWtXEeyfei+j01At4TR3NWlpZzPDE6VkURXU2fLiWghGO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1220

Add pinctrl driver for StarFive JHB100 SoC ADC-0(adc0) pinctrl
controller.

Co-developed-by: Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
Signed-off-by: Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
Signed-off-by: Alex Soo <yuklin.soo@starfivetech.com>
Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 drivers/pinctrl/starfive/Kconfig              | 11 +++
 drivers/pinctrl/starfive/Makefile             |  1 +
 .../starfive/pinctrl-starfive-jhb100-adc0.c   | 85 +++++++++++++++++++
 3 files changed, 97 insertions(+)
 create mode 100644 drivers/pinctrl/starfive/pinctrl-starfive-jhb100-adc0.c

diff --git a/drivers/pinctrl/starfive/Kconfig b/drivers/pinctrl/starfive/Kconfig
index 7ff506a15dd8..1622cc73d9ae 100644
--- a/drivers/pinctrl/starfive/Kconfig
+++ b/drivers/pinctrl/starfive/Kconfig
@@ -54,6 +54,17 @@ config PINCTRL_STARFIVE_JHB100
 	select GPIOLIB
 	select GPIOLIB_IRQCHIP
 
+config PINCTRL_STARFIVE_JHB100_ADC0
+	tristate "StarFive JHB100 SoC ADC-0 pinctrl and GPIO driver"
+	depends on ARCH_STARFIVE || COMPILE_TEST
+	select PINCTRL_STARFIVE_JHB100
+	default m if ARCH_STARFIVE
+	help
+	  Say yes here to support ADC-0 pin control on the StarFive JHB100 SoC.
+	  This also provides an interface to the GPIO pins not used by other
+	  peripherals supporting inputs, outputs, configuring pull-up/pull-down
+	  and interrupts on input changes.
+
 config PINCTRL_STARFIVE_JHB100_PER0
 	tristate "StarFive JHB100 SoC Peripheral-0 pinctrl and GPIO driver"
 	depends on ARCH_STARFIVE || COMPILE_TEST
diff --git a/drivers/pinctrl/starfive/Makefile b/drivers/pinctrl/starfive/Makefile
index 351fce524fec..1113e73657d7 100644
--- a/drivers/pinctrl/starfive/Makefile
+++ b/drivers/pinctrl/starfive/Makefile
@@ -7,6 +7,7 @@ obj-$(CONFIG_PINCTRL_STARFIVE_JH7110_SYS)	+= pinctrl-starfive-jh7110-sys.o
 obj-$(CONFIG_PINCTRL_STARFIVE_JH7110_AON)	+= pinctrl-starfive-jh7110-aon.o
 
 obj-$(CONFIG_PINCTRL_STARFIVE_JHB100)		+= pinctrl-starfive-jhb100.o
+obj-$(CONFIG_PINCTRL_STARFIVE_JHB100_ADC0)	+= pinctrl-starfive-jhb100-adc0.o
 obj-$(CONFIG_PINCTRL_STARFIVE_JHB100_PER0)	+= pinctrl-starfive-jhb100-per0.o
 obj-$(CONFIG_PINCTRL_STARFIVE_JHB100_PER1)	+= pinctrl-starfive-jhb100-per1.o
 obj-$(CONFIG_PINCTRL_STARFIVE_JHB100_PER2)	+= pinctrl-starfive-jhb100-per2.o
diff --git a/drivers/pinctrl/starfive/pinctrl-starfive-jhb100-adc0.c b/drivers/pinctrl/starfive/pinctrl-starfive-jhb100-adc0.c
new file mode 100644
index 000000000000..8aaa4fca52e6
--- /dev/null
+++ b/drivers/pinctrl/starfive/pinctrl-starfive-jhb100-adc0.c
@@ -0,0 +1,85 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Pinctrl / GPIO driver for StarFive JHB100 SoC ADC-0 domain
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
+static const struct jhb100_pin_layout_desc jhb100_adc0_pl_desc[] = {
+	{ .pin_start = 0, .pin_cnt = 8, .name = "gpio", .gpio_func_sel = 0 },
+	{ 0xff },
+};
+
+static const struct config_reg_layout_desc jhb100_adc0_pinctrl_crl_desc[] = {
+	{
+		.pin_start					= 0,
+		.pin_cnt					= 8,
+		.fields[PAD_CFG_DRIVE_STRENGTH_3BIT]		= { .shift = 0, .width = 3 },
+		.fields[PAD_CFG_INPUT_ENABLE]			= { .shift = 3, .width = 1 },
+		.fields[PAD_CFG_PULL_DOWN]			= { .shift = 4, .width = 1 },
+		.fields[PAD_CFG_PULL_UP]			= { .shift = 5, .width = 1 },
+		.fields[PAD_CFG_SLEW_RATE]			= { .shift = 6, .width = 1 },
+		.fields[PAD_CFG_SCHMITT_TRIGGER_SELECT]		= { .shift = 7, .width = 1 },
+		.fields[PAD_CFG_DEBOUNCE_WIDTH]			= { .shift = 15, .width = 17 },
+	},
+	{ 0xff },
+};
+
+static const struct starfive_pinctrl_regs jhb100_adc0_pinctrl_regs = {
+	.func_sel		= { .reg = 0x2c, .width_per_pin = 2 },
+	.config			= 0x00,
+	.output			= 0x20,
+	.output_en		= 0x24,
+	.gpio_status		= 0x28,
+	.irq_en			= 0x30,
+	.irq_status		= 0x34,
+	.irq_clr		= 0x38,
+	.irq_trigger		= 0x3c,
+	.irq_level		= 0x40,
+	.irq_both_edge		= 0x44,
+	.irq_edge		= 0x48,
+};
+
+static const struct jhb100_pinctrl_func_maps jhb100_func_maps_adc0[] = {
+	{ .func = "adc",		.val = 1 },
+	{ .func = "gpio",		.val = 0 },
+	{ .func = "host0_port80",	.val = 3 },
+	{ .func = "smbalert",		.val = 2 },
+};
+
+static const struct jhb100_pinctrl_domain_info jhb100_adc0_pinctrl_info = {
+	.name			= "jhb100-adc0",
+	.pl_desc		= jhb100_adc0_pl_desc,
+	.crl_desc		= jhb100_adc0_pinctrl_crl_desc,
+	.regs			= &jhb100_adc0_pinctrl_regs,
+	.fmaps			= jhb100_func_maps_adc0,
+	.num_maps		= ARRAY_SIZE(jhb100_func_maps_adc0),
+};
+
+static const struct of_device_id jhb100_adc0_pinctrl_of_match[] = {
+	{
+		.compatible = "starfive,jhb100-adc0-pinctrl",
+		.data = &jhb100_adc0_pinctrl_info,
+	},
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, jhb100_adc0_pinctrl_of_match);
+
+static struct platform_driver jhb100_adc0_pinctrl_driver = {
+	.probe = jhb100_pinctrl_probe,
+	.driver = {
+		.name = "starfive-jhb100-adc0-pinctrl",
+		.of_match_table = jhb100_adc0_pinctrl_of_match,
+	},
+};
+module_platform_driver(jhb100_adc0_pinctrl_driver);
+
+MODULE_DESCRIPTION("Pinctrl driver for StarFive JHB100 SoC ADC-0 domain");
+MODULE_AUTHOR("Alex Soo <yuklin.soo@starfivetech.com>");
+MODULE_LICENSE("GPL");
-- 
2.25.1

