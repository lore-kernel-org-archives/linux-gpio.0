Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2138.outbound.protection.partner.outlook.cn [139.219.146.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4861D3E0250;
	Sat, 17 Oct 2026 05:27:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792214839; cv=fail; b=X3QeM7PaWNzyPDySOpPIugQ9e7E3wgTOso6UKQ9dS0fBb8U8mcFPzrZtu7cesjtFJoHIvvbIyWK7F42nR+QANIB5UAS/6PPfsuwtqU1CXe2E8dpo1E8bpzR9aHzvES8ol4iDzUpBoo8d90MHBuwVFc0/NcRFjFibkPLtDBzACQw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792214839; c=relaxed/simple;
	bh=c5mXOLF9i7Z+vSbh8ZYSLO1QVBn9Zf9wkEWjG8cNxUo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=P4J81QUcDluwhMQxGBktn6+9fbAhe96B4lyGHw5KlBc8g2Rj5p31xWG4SMSMI8wOAvUtsGHlJOGuheodpd1nha97ogbCS3vcM1nH3uwtbokoYN39dntiR1AkGBOyafz0KhK37i1qA1FCzypAYrXzg04esJO5ZCGv3r0HLW2B6Pk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oAk/SMZCV9xG8aiYAPfuPTHnI6ca1oax9fHKgTr1VDp5Mt0snZq8W9Wq5Kqqa2QdVNWvvuTWMCvFrT/4WhjNeULlOlqlLoRGkMyh+GMzoYRYxluoZyUj1C4NaRsPlmqrOSChGl9X2388X0k0hicm61Vt9Zn7bI413B/JiS+mwD7urdKjFG5Yg93N8I6m+DDcZWSJwBQngctMaJ2r/EFxfecjdf17WQqAn4fZXMDuTqhqYewNLEmnWhnQ6fXFHlgYHuXDFrH51VoaO16zB8T69vKwy4AT+vQTA/bjbsJzm45lqH43EXh1H07l1JLjGIxdvoI4dGwFoRcM2e8I/mWMHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9z3ydN8JLPoLbbDVaL6ldu35NK6KAgZWw/OjNZ8MVOk=;
 b=oZUpYK6PCMjoMWGioVoa7O9MZ5SvMC3a0tVnFOhRCGkzohtY0uFnTgaBQCxrous1j3ZTJhBTotYyBvmYqkyEr0yRG9visL7KjYsVZ1Nj+JSL9XD/NIiLP3tsAwYXAe06kkEWLVMwmGbR0M8vvNlP4VkDUaby8c7NxVG1NgULCQ0AaTerKdoliqwwgVt3+GzG9BvYxVSRUU++n/+EmIEScRVYzTpZb3J6JxQtkX4C14qlylUoEF0waXEMxlquFOGyQDSb9kKnpUKzamlumUEkC6e6q7xlq2NU7v4uxB/m0wLBGNXSrVaeEi36dXU3bMAlzC95RCnqmvOpDCwO3br6QQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1220.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:14::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.17; Sat, 17 Oct
 2026 05:25:46 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0522.016; Sat, 17 Oct 2026 05:25:46 +0000
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
Subject: [PATCH v1 4/8] pinctrl: starfive: Add StarFive JHB100 adc1 controller driver
Date: Fri, 16 Oct 2026 22:25:30 -0700
Message-Id: <20261017052534.115203-5-changhuang.liang@starfivetech.com>
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
X-MS-Office365-Filtering-Correlation-Id: 0e339ea3-e50b-4fa3-1cf6-08df2c0f18e3
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|366016|52116014|376014|38350700014|56012099006|5023799004|261009223027099003|10067099003|18002099003|22082099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	J1VvmfSMEQLwBP7Tbeq/yKXyiRKAsDF52NctvFqRki4t6c7MdefheLSn4ojhUkncj9lL8c8qXwJFgPgvZSJ/YTEFvsnIP1YESRbb6LdAJbvdcSQxbY00Hh1/g9+GNNotE1Ma7WSZHUqE6uUinG3xbs/5fp5uIG906vLOGhShUVnGxLjotgrmvJGrGxBvwxIRaKfoSxQHHSiXjP1mSukm6/k/13c4NRi1hFr1inDVx3s+4NQtQs90drYeTWuq/TcYfhRGyecLaKn7S6rJVXSeCJIiYfQivMBw6EgBrKgfsGKubKMhKnhw6wv33tOFpx62oLpnINZdIKKwGBAZUDx0Sk0E8QnV28hdVu2LHdGjZJ7Bpl2/IiJvYuKxtRU3r+XEIGwB56Vt5qxdcFBcuMP4doK3JZ/6J/uwgEHZ4aNtlaneuiSgoegXEHvQWECr+nmO7OwWWCPEQu0dQkXiCz6EqTWE3GYuLp58AjHxqWku2RVqN7otoAD+fSQOGctwrn/vI3nONPh5MOtK2AhGZLjCwXjiGqsuJVQOU+JR0sLtnO/O3KMwxIVUCKcQZJI2e9Y+
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(52116014)(376014)(38350700014)(56012099006)(5023799004)(261009223027099003)(10067099003)(18002099003)(22082099003)(6133799003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8ot7BBWYeayTJmz11EvV1tnwbxUkZd34MFNr7Qb5+kW21T66cjLPO5tz2ZOP?=
 =?us-ascii?Q?0qFGkJZIMNAtA4vAu5yjVHhVmRrXL51yGQTYHokIvNoMcXj28cXP0R0m68gT?=
 =?us-ascii?Q?FuuWQsSVai3bb462gmcKQm8JRQfnEEfdA9bjBAZZ0ou2VVt7AjISgnSJzk4w?=
 =?us-ascii?Q?c8olmviB29/0XOgyEM7W1z6vzAyDAm9nMKBo68wZX7ZmWdRGVaWk/wwh/ihm?=
 =?us-ascii?Q?qLNmvBuFemtWP5HAxdfUzZ5jYabhEeHw9lL9dhICrC8rCsKDU5MX2SZWu93v?=
 =?us-ascii?Q?iDk+0U+XLJeZCGK+ttdc+Hr8Izs6sFhUagXst41IH4FzaZ9x/OnIsKcx4HBw?=
 =?us-ascii?Q?zv24ymEkdvKBhD/jthpk1Kw8MkQQOACZ6qjCe9qONnVXKiWvB88jcOEPmhfY?=
 =?us-ascii?Q?chupbMeBJs4Zd0P00kBEDwTUsZpN9ih6JiNkECwd2ozAAr9EIXOsJBbnKea3?=
 =?us-ascii?Q?kKX7bnuikBz4YfvnbN6m5LHzY1njNaU0Iy+6p+JoAkTmixqMzxDVffrmQqaE?=
 =?us-ascii?Q?SZffIh+vtK4wmek77fa0/bQlXNkLUBdkIMlRfXysPwpqx3G8Uv8EB5wS7Rjh?=
 =?us-ascii?Q?9+fHFAv0MG+SXL5aSLymOifQSdgzQhSaeE38etI0ZRFJaIK1sXurn1hQD6qO?=
 =?us-ascii?Q?q+ZinlVgnHqA6aEnLH6oJharSwCK9oM44VyPkkp89BzpnyXmz9VBF+th46Uc?=
 =?us-ascii?Q?HVR6pqV9jmcH/VXvkSGsv+uR1r+q6xSJ19n16xXgQPIDh+aDhWCzgHhQd2FI?=
 =?us-ascii?Q?lbonob8V4nFqOpXizKNhDRiIjzrzsDRh4x64momzlGBPXy7Q1bnmycwZeqo+?=
 =?us-ascii?Q?JwFVITJl7oOCxz0dsea3QgtVyc4yhy/uXEw5OMETde2Qhb731fYtXqL0uVwg?=
 =?us-ascii?Q?6GOhDbo0OHBxCxq3uNHkoMMIySl0KeQLRXLjf9e3OTI4KVOQ494ujZhc37Lp?=
 =?us-ascii?Q?LxX0O9aYTFZOnWYP4HsTNUcPHp3Sq094eUe0tkdpEarjUBULNyY6Slf3l/33?=
 =?us-ascii?Q?PHBvC3uTcCWkK9srL0RNNO+V5KwB2w3gsN8GzcSOJz44wCY5TwTrFXGusoCf?=
 =?us-ascii?Q?06KNhQ3/qpWhqzBrOHjbQTdHL55E/jNanKdB37MIiajWSUr3HFBDNEP98r++?=
 =?us-ascii?Q?QoJCCFR1exyWFKu2Hp6X8ASmLKGYW4cv4BgaFYHuRufbenzcoe5DU9ab0VYF?=
 =?us-ascii?Q?SUldz+/QdCrpwP8wPRWjopronbFjJ3tCgnVUiSUnOzPh1QbaqcBl4utlI69X?=
 =?us-ascii?Q?BM1629gRiOiCmFaxaNPWzqRn5JSOqwOpvl8bQTTopvMVh2N7T54nLp487RA5?=
 =?us-ascii?Q?CdF7Zt/Q1zFabqTvG5G73zIeCznB22K8myOfGMdBjic2n8draUYAwRCTGbn2?=
 =?us-ascii?Q?F7Dm/leEeCHqbUFR+73qcspUWnEGhj6FqwZFMbuljrQnxl/o4KjyktxqaH/K?=
 =?us-ascii?Q?UbT/DMH8L61QNt7H9WWLRgwCy9hcHP/lgZTT2RcUcmD+eEFirJek91rxUp2J?=
 =?us-ascii?Q?4aA8tpv+Wo9+JH2LY9DJ62C3vNhfNerkDmhcmpSoSCUU/TcdRptziRAqJgnc?=
 =?us-ascii?Q?HSEKDJyiNpqJ6M6Thn+G1f6NFTP4ARSZl7l9w1xqLc4yt4SN7Mg0wB1lrk+u?=
 =?us-ascii?Q?wn4SHRD6+yc0G1gNEaGGfz1XHyFATRPOEAcnN8JbPju1nLA3HXLXabw+A1Ur?=
 =?us-ascii?Q?SPmhwIJmM2XxIRrOj192gGNv4iXgVnprJgKY7VUVZ0nHHrItcwnpVwjO9y1t?=
 =?us-ascii?Q?EOIbxCcsTHW3VvS/O01b9VCeBgkVQ7bqFiRO3A7RzMexeQ5h019M?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e339ea3-e50b-4fa3-1cf6-08df2c0f18e3
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2026 05:25:46.4287
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pmwMiwckZgCvQ4fkhXvOiX4Qhc6dEidxogdi1b/UxzWN5DVVXJHL36i1pqoZ3qYob3FhUCwvMzBMMEW1I/VHOA+yPGJ2SqL9wmJKUukMmGhH8wmFyY2ugq8oz39QyEm3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1220

Add pinctrl driver for StarFive JHB100 SoC ADC-1(adc1) pinctrl
controller.

Co-developed-by: Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
Signed-off-by: Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
Signed-off-by: Alex Soo <yuklin.soo@starfivetech.com>
Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 drivers/pinctrl/starfive/Kconfig              | 11 +++
 drivers/pinctrl/starfive/Makefile             |  1 +
 .../starfive/pinctrl-starfive-jhb100-adc1.c   | 85 +++++++++++++++++++
 3 files changed, 97 insertions(+)
 create mode 100644 drivers/pinctrl/starfive/pinctrl-starfive-jhb100-adc1.c

diff --git a/drivers/pinctrl/starfive/Kconfig b/drivers/pinctrl/starfive/Kconfig
index 1622cc73d9ae..f869c474fc50 100644
--- a/drivers/pinctrl/starfive/Kconfig
+++ b/drivers/pinctrl/starfive/Kconfig
@@ -65,6 +65,17 @@ config PINCTRL_STARFIVE_JHB100_ADC0
 	  peripherals supporting inputs, outputs, configuring pull-up/pull-down
 	  and interrupts on input changes.
 
+config PINCTRL_STARFIVE_JHB100_ADC1
+	tristate "StarFive JHB100 SoC ADC-1 pinctrl and GPIO driver"
+	depends on ARCH_STARFIVE || COMPILE_TEST
+	select PINCTRL_STARFIVE_JHB100
+	default m if ARCH_STARFIVE
+	help
+	  Say yes here to support ADC-1 pin control on the StarFive JHB100 SoC.
+	  This also provides an interface to the GPIO pins not used by other
+	  peripherals supporting inputs, outputs, configuring pull-up/pull-down
+	  and interrupts on input changes.
+
 config PINCTRL_STARFIVE_JHB100_PER0
 	tristate "StarFive JHB100 SoC Peripheral-0 pinctrl and GPIO driver"
 	depends on ARCH_STARFIVE || COMPILE_TEST
diff --git a/drivers/pinctrl/starfive/Makefile b/drivers/pinctrl/starfive/Makefile
index 1113e73657d7..cc8ce1e67d4b 100644
--- a/drivers/pinctrl/starfive/Makefile
+++ b/drivers/pinctrl/starfive/Makefile
@@ -8,6 +8,7 @@ obj-$(CONFIG_PINCTRL_STARFIVE_JH7110_AON)	+= pinctrl-starfive-jh7110-aon.o
 
 obj-$(CONFIG_PINCTRL_STARFIVE_JHB100)		+= pinctrl-starfive-jhb100.o
 obj-$(CONFIG_PINCTRL_STARFIVE_JHB100_ADC0)	+= pinctrl-starfive-jhb100-adc0.o
+obj-$(CONFIG_PINCTRL_STARFIVE_JHB100_ADC1)	+= pinctrl-starfive-jhb100-adc1.o
 obj-$(CONFIG_PINCTRL_STARFIVE_JHB100_PER0)	+= pinctrl-starfive-jhb100-per0.o
 obj-$(CONFIG_PINCTRL_STARFIVE_JHB100_PER1)	+= pinctrl-starfive-jhb100-per1.o
 obj-$(CONFIG_PINCTRL_STARFIVE_JHB100_PER2)	+= pinctrl-starfive-jhb100-per2.o
diff --git a/drivers/pinctrl/starfive/pinctrl-starfive-jhb100-adc1.c b/drivers/pinctrl/starfive/pinctrl-starfive-jhb100-adc1.c
new file mode 100644
index 000000000000..9264e9684b41
--- /dev/null
+++ b/drivers/pinctrl/starfive/pinctrl-starfive-jhb100-adc1.c
@@ -0,0 +1,85 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Pinctrl / GPIO driver for StarFive JHB100 SoC ADC-1 domain
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
+static const struct jhb100_pin_layout_desc jhb100_adc1_pl_desc[] = {
+	{ .pin_start = 0, .pin_cnt = 8, .name = "gpio", .gpio_func_sel = 0 },
+	{ 0xff },
+};
+
+static const struct config_reg_layout_desc jhb100_adc1_pinctrl_crl_desc[] = {
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
+static const struct starfive_pinctrl_regs jhb100_adc1_pinctrl_regs = {
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
+static const struct jhb100_pinctrl_func_maps jhb100_func_maps_adc1[] = {
+	{ .func = "adc",		.val = 1 },
+	{ .func = "gpio",		.val = 0 },
+	{ .func = "host1_port80",	.val = 2 },
+	{ .func = "scap_trigger",	.val = 3 },
+};
+
+static const struct jhb100_pinctrl_domain_info jhb100_adc1_pinctrl_info = {
+	.name			= "jhb100-adc1",
+	.pl_desc		= jhb100_adc1_pl_desc,
+	.crl_desc		= jhb100_adc1_pinctrl_crl_desc,
+	.regs			= &jhb100_adc1_pinctrl_regs,
+	.fmaps			= jhb100_func_maps_adc1,
+	.num_maps		= ARRAY_SIZE(jhb100_func_maps_adc1),
+};
+
+static const struct of_device_id jhb100_adc1_pinctrl_of_match[] = {
+	{
+		.compatible = "starfive,jhb100-adc1-pinctrl",
+		.data = &jhb100_adc1_pinctrl_info,
+	},
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, jhb100_adc1_pinctrl_of_match);
+
+static struct platform_driver jhb100_adc1_pinctrl_driver = {
+	.probe = jhb100_pinctrl_probe,
+	.driver = {
+		.name = "starfive-jhb100-adc1-pinctrl",
+		.of_match_table = jhb100_adc1_pinctrl_of_match,
+	},
+};
+module_platform_driver(jhb100_adc1_pinctrl_driver);
+
+MODULE_DESCRIPTION("Pinctrl driver for StarFive JHB100 SoC ADC-1 domain");
+MODULE_AUTHOR("Alex Soo <yuklin.soo@starfivetech.com>");
+MODULE_LICENSE("GPL");
-- 
2.25.1

