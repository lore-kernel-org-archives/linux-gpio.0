Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2138.outbound.protection.partner.outlook.cn [139.219.146.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 805CB374721;
	Sat, 17 Oct 2026 05:27:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792214830; cv=fail; b=HGxeiw4ppew51dhs9j2KwtXT3nhLXWAtJAnzbUQN0LWiK9jO7gh19m8cfNRCcF+oq8Z8nCGz0jTc5xAEYSeqN/T/rSlDMDMC0ClTL+BFxymlEQ5UyyrnxLUKHxYSAvzsJJjfpokAzebffyQGOMGxAh2OnQY/DITyqDvoVu8hqjc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792214830; c=relaxed/simple;
	bh=RyLunJ2T48feqxGvk8px4pvLGtcgjeIZFotyfyuCJVM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=kcjDYYWOoexDDtk/+VGidJLinDlcOVirquCtXDQ3zCWfbfslYqjGdtVFY8YeZuneK2yNSgpm8mwtFyTerHGbm4ZuQ46IzT6jJ2SzBZn2+Gq6ZfFYwbCWRV3wNItgyG9lvgGq+qF0KR6YYNyFgchLHzfa4SA2YA8Uq0S183+4vbM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hZnkP/sSsQWO57U6fPLELXr1o6PhYXlvu8pfibCCUPmSQM+cOYjE/DbzavTaSVSo+pF5jVUdR0rxDletBG07rr22AqpWBOOBGwKDk12coQV4qow31YXJIB3IcuitrNFI7CQcTQjwDGEEyt2PEQIFFBkzgU+Y0hwqjDGTJ/W0hSbEBZGw0xzafoN+v7InkHSeoaWUqZ+oS7h/8lo047CkSWd+sDk2zq9zD67WEJTw2JwhDOdZNiIx7DCMjFti73NuzvRsYXb7ddHhOvpS3/NMX6tL3qkD1F3TN2ryGZbNX3QyG+RQNYiBPih3+0eauRcpvGFbmU27gsS7UWp2DVjIyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fg9RbYaao15Dc5QDyQ0gkfoBb4Fe3fSXIAbgMbRP9ZA=;
 b=HYPsYY1B42hFzjLpUQFtm0ZJ00qqcYAO8lH1KCzs4Uif8QgLXPo5mhr2uvLCaUKWbRqXuLG3S3BIACwrO8gYhcaEEJy80/jfQObCGLoGVtEzLUX7EsRi5vOnmnx2oCYgCF1++LBX3iG1acOYF0A2izbFJtpqjKBdlBV1gNa6REXUkCmZ90wJApCxivvs2O87Q3EaOMCZ9zo/3KLHNoIeXejmo+16qckOvg8POcvJ80Q0Vaf9R5POQre5kiwHglQ/cDYwyFj27/Yq42bHIc3BtQ8Es06qjbZmkLFCqY9RVhncu0Qc7xFDoYk7L/Av4M14mvb0mnOjR9nQ/w5jeOEzOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1220.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:14::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.17; Sat, 17 Oct
 2026 05:25:48 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0522.016; Sat, 17 Oct 2026 05:25:48 +0000
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
Subject: [PATCH v1 6/8] pinctrl: starfive: Add StarFive JHB100 emmc controller driver
Date: Fri, 16 Oct 2026 22:25:32 -0700
Message-Id: <20261017052534.115203-7-changhuang.liang@starfivetech.com>
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
X-MS-Office365-Filtering-Correlation-Id: 815b9a26-3865-4ef3-d49b-08df2c0f1a0b
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|366016|52116014|376014|38350700014|56012099006|5023799004|261009223027099003|10067099003|18002099003|22082099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	dRhZgqTtD+Q+SrJbW6ISM7F7GrUTliU+yb76i517AjMDllL2t24hXlZJwjDaCd75l6hDUrkP7UYB6MgLEnP3ZMMupfcvvu5DZ4viXXTFb9H0FQoOf2DHvQ4OsXpv7tSqPwG5mq3NP7PMfdQ2EClimoHtPlYBOI53S3fjyFg9m5si4pPHvqqIWcoFz0n/Lv6VfFDyiJoauSolO1zGReVNVAbAOjwzPj5l3dQ7NeGWHLLOhjjX9EFtyBbBtX38fgzhGWq1/2PYn0u/s07DauzhUgz9e6SfAFaw1KzzpuuWnM9xb9VWAAy+Tm7/vmlUvbfhottOEg3h/YYAGMUx5FWel1qybptWfl7GgZ3njEHvkEYqrOSMOacs5ts49aP4V//EchvzWxpbDMWAOaib3Az6vDd4o0bJvBG9gRi420FLy7EYZodDdo9Dx0voIj3ZCuNGGIW9NgAggtH1HIBuGAwZhvWLjRn6XFu5ULDk4GvQiRYgAkJUR39NDxNGt97nGW0YcVGs2Sny8zPwHgQOHLUomOY1sc73iwj3NbhIZVtyQB5Ezsb4N614Xl+u4NdceGoO
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(52116014)(376014)(38350700014)(56012099006)(5023799004)(261009223027099003)(10067099003)(18002099003)(22082099003)(6133799003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+ibKP3ubaLcqEfFcENX5+Kz/JTdvBS7+7UTtHU5H0w9bHdrKIpxzsYdbNDsM?=
 =?us-ascii?Q?W4r5g2BvEUa4hnZKEqgOV8WtWPtMnWjdlRH/iogM9WC2079EzxDuMIfWhdbc?=
 =?us-ascii?Q?P/+AoqpDpAVkizwhKAiOFs4mMawzUtkGtw4ACsIZ+t39P+HnM17fR3gVFuV+?=
 =?us-ascii?Q?rI7Yt5bKdXiubgPbAjYOG9TU4M2bue9acAxn6bTdYGQMZy6/iBPb1y7QP7sq?=
 =?us-ascii?Q?Mj48xQrTD9VzGNG7hba+omKCKMofxKg9DWsGDy75oXE2OIJNmm2qntIrk5M9?=
 =?us-ascii?Q?C7e7KyCaoxMJ5M5Q346h9gLywDpXP12OPqNgsPV0Kr4CbDdsJ3QwXEsjPrOp?=
 =?us-ascii?Q?VSPrG+7k5spJi3PLMMzc0o7ML7rIKrcNy2O7NJPWlM71RHPnn7MSCp282bvS?=
 =?us-ascii?Q?UP54pkle5eBVzbcmNn33ZUFMTs4wBKbnCcT2RSXwWYSEng+90htJeha6/pUB?=
 =?us-ascii?Q?unWJUmXbttVNpgl51SjcE06Mq76AC0A7CrHiXbmU3ktIxLFsCBw2JwT5K4B1?=
 =?us-ascii?Q?MPpIkdyb38NWvqkm4841fK6EQJfQsXKD5m1QQsunKjZ8sO+0KE23lyh/GtCi?=
 =?us-ascii?Q?lWFeBFxfDIol65CUko0l+aK2Mp5XIOby1HcBy6BpMbCJ9Xv99v/utpUHPLBZ?=
 =?us-ascii?Q?1JW7pfZkH9eAZuHzI6Kv3ArCDlcWkCzeHu8N5KHtJQhajEGN8PgS3VuKuNVg?=
 =?us-ascii?Q?fqpxVkWi6Mqzm1P4S4UKA2C7QW8MGoZbugee5NzXULnlMDDiyrUylJ01QOzU?=
 =?us-ascii?Q?6ADqz9ecbHVETM/RQaOm8ro04/KkoeEb6asOrrUfIlNLEBJK+eKyprdw8CjA?=
 =?us-ascii?Q?/tuIcy3/g3+MUr25B4sS5rKWjDoBJURCWl7M1lfVYGwzggSmwH1tk384uItk?=
 =?us-ascii?Q?kYmUH5bP9neaVDq/9cqjI/Pyg58PmPB152gtC5vt6AP+5Iss/oFAZ2YCo+3G?=
 =?us-ascii?Q?GE/0UtWh+iqOCYnkvQc9lAvrV28NNL29Qr3VzjUkiGHFvaqv4hks3mUS2GQr?=
 =?us-ascii?Q?kOUx/H2w8UYr+KEl7CQ5yH1xlEKgnMstai37a6ol7JVkKqNhInSgJ1A7s/Ui?=
 =?us-ascii?Q?s4GhexbjbhHQ5DxbgRLb+t1j6UI2OVFFuBjTvWgWt8Ub5+jnVQKDzzeTIfYU?=
 =?us-ascii?Q?IJXabIz6CiIO5KWzVjxdLZy8QKm/rOi6PTOBhHvOqPafXFu27L4L96EsDxcL?=
 =?us-ascii?Q?GL0asPOeILA0z4jZ4XYSIOWxuKyOTM2+1jK/XA9n3cUhTV9kTO4COXCOUtcg?=
 =?us-ascii?Q?N3kj5KMYL3zceWp2Uydtz8LGvPL4jHONiFFW+YafTV2qGk4m+OmwtcD4Q2Lu?=
 =?us-ascii?Q?DS0tRUnD6mTsCOrMy7k5kKaQl7wseH6Iq98XZOulwNYbwyPW56+5htBmhIbj?=
 =?us-ascii?Q?Pi7WHnxwrhG1OL96p1HJyVpvRihcHZtES7H77B0SRsr/z7Jgwh/tlRl5jKs+?=
 =?us-ascii?Q?xHsqLJglw+9TbzAOqLtIc/N382Mu8PwSs8MJ7Ng4FtfJy/TyeLbliOJzrBiQ?=
 =?us-ascii?Q?aDrMLyLqpJTEOo3xOPW2sfLY6k4sZnArnF08l9rSURJJLdioxvgvXjwdGCZt?=
 =?us-ascii?Q?FG7SG8v4PMZHr9Fv9OTHgEn/382tP4nB+V0MGC9W9DaSHKSACVi7Bo9rMJrG?=
 =?us-ascii?Q?Xq+QZdFrQPzgFupngCVGetqniRxo9TbvWx/IFBSbWLuQ56FYzxphz+51CZsj?=
 =?us-ascii?Q?L38wZ10YnApTe8BdT1nrwvRuxLHNAGbf4x50SXUcyeeO5yeBb/JDr1L+XCB9?=
 =?us-ascii?Q?mxeu90xoY0on67/l01gSH8/kt6C8lbFTeU4smoq4eTg1y0rmvS7t?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 815b9a26-3865-4ef3-d49b-08df2c0f1a0b
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2026 05:25:48.3814
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p+3R3bNDw0/s4F7stdtsRoBuIOj1v/+DV3Ro7bFQFWFPMNRV2G06SC669TtQKR6othKGxj3qe8Ai8xXG56Hrc1lD7cuwCwOinS3OTiJoHf1vZZWmbcSMYXKARHxdcDoX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1220

Add pinctrl driver for StarFive JHB100 SoC eMMC(emmc) pinctrl
controller.

Co-developed-by: Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
Signed-off-by: Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
Signed-off-by: Alex Soo <yuklin.soo@starfivetech.com>
Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 drivers/pinctrl/starfive/Kconfig              | 11 +++
 drivers/pinctrl/starfive/Makefile             |  1 +
 .../starfive/pinctrl-starfive-jhb100-emmc.c   | 77 +++++++++++++++++++
 3 files changed, 89 insertions(+)
 create mode 100644 drivers/pinctrl/starfive/pinctrl-starfive-jhb100-emmc.c

diff --git a/drivers/pinctrl/starfive/Kconfig b/drivers/pinctrl/starfive/Kconfig
index f869c474fc50..76f2d59e8a8d 100644
--- a/drivers/pinctrl/starfive/Kconfig
+++ b/drivers/pinctrl/starfive/Kconfig
@@ -76,6 +76,17 @@ config PINCTRL_STARFIVE_JHB100_ADC1
 	  peripherals supporting inputs, outputs, configuring pull-up/pull-down
 	  and interrupts on input changes.
 
+config PINCTRL_STARFIVE_JHB100_EMMC
+	tristate "StarFive JHB100 SoC eMMC pinctrl and GPIO driver"
+	depends on ARCH_STARFIVE || COMPILE_TEST
+	select PINCTRL_STARFIVE_JHB100
+	default m if ARCH_STARFIVE
+	help
+	  Say yes here to support eMMC pin control on the StarFive JHB100 SoC.
+	  This also provides an interface to the GPIO pins not used by other
+	  peripherals supporting inputs, outputs, input debounce and interrupts
+	  on input changes.
+
 config PINCTRL_STARFIVE_JHB100_PER0
 	tristate "StarFive JHB100 SoC Peripheral-0 pinctrl and GPIO driver"
 	depends on ARCH_STARFIVE || COMPILE_TEST
diff --git a/drivers/pinctrl/starfive/Makefile b/drivers/pinctrl/starfive/Makefile
index cc8ce1e67d4b..d570b192b260 100644
--- a/drivers/pinctrl/starfive/Makefile
+++ b/drivers/pinctrl/starfive/Makefile
@@ -9,6 +9,7 @@ obj-$(CONFIG_PINCTRL_STARFIVE_JH7110_AON)	+= pinctrl-starfive-jh7110-aon.o
 obj-$(CONFIG_PINCTRL_STARFIVE_JHB100)		+= pinctrl-starfive-jhb100.o
 obj-$(CONFIG_PINCTRL_STARFIVE_JHB100_ADC0)	+= pinctrl-starfive-jhb100-adc0.o
 obj-$(CONFIG_PINCTRL_STARFIVE_JHB100_ADC1)	+= pinctrl-starfive-jhb100-adc1.o
+obj-$(CONFIG_PINCTRL_STARFIVE_JHB100_EMMC)	+= pinctrl-starfive-jhb100-emmc.o
 obj-$(CONFIG_PINCTRL_STARFIVE_JHB100_PER0)	+= pinctrl-starfive-jhb100-per0.o
 obj-$(CONFIG_PINCTRL_STARFIVE_JHB100_PER1)	+= pinctrl-starfive-jhb100-per1.o
 obj-$(CONFIG_PINCTRL_STARFIVE_JHB100_PER2)	+= pinctrl-starfive-jhb100-per2.o
diff --git a/drivers/pinctrl/starfive/pinctrl-starfive-jhb100-emmc.c b/drivers/pinctrl/starfive/pinctrl-starfive-jhb100-emmc.c
new file mode 100644
index 000000000000..32f8c141133b
--- /dev/null
+++ b/drivers/pinctrl/starfive/pinctrl-starfive-jhb100-emmc.c
@@ -0,0 +1,77 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Pinctrl / GPIO driver for StarFive JHB100 SoC eMMC domain
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
+static const struct jhb100_pin_layout_desc jhb100_emmc_pl_desc[] = {
+	{ .pin_start = 0, .pin_cnt = 12, .name = "gpio", .gpio_func_sel = 0 },
+	{ 0xff },
+};
+
+static const struct config_reg_layout_desc jhb100_emmc_pinctrl_crl_desc[] = {
+	{
+		.pin_start					= 0,
+		.pin_cnt					= 12,
+		.fields[PAD_CFG_DEBOUNCE_WIDTH]			= { .shift = 0, .width = 17 },
+	},
+	{ 0xff },
+};
+
+static const struct starfive_pinctrl_regs jhb100_emmc_pinctrl_regs = {
+	.func_sel		= { .reg = 0x3c, .width_per_pin = 2 },
+	.config			= 0x00,
+	.output			= 0x30,
+	.output_en		= 0x34,
+	.gpio_status		= 0x38,
+	.irq_en			= 0x40,
+	.irq_status		= 0x44,
+	.irq_clr		= 0x48,
+	.irq_trigger		= 0x4c,
+	.irq_level		= 0x50,
+	.irq_both_edge		= 0x54,
+	.irq_edge		= 0x58,
+};
+
+static const struct jhb100_pinctrl_func_maps jhb100_func_maps_emmc[] = {
+	{ .func = "emmc",		.val = 1 },
+	{ .func = "gpio",		.val = 0 },
+};
+
+static const struct jhb100_pinctrl_domain_info jhb100_emmc_pinctrl_info = {
+	.name			= "jhb100-emmc",
+	.pl_desc		= jhb100_emmc_pl_desc,
+	.crl_desc		= jhb100_emmc_pinctrl_crl_desc,
+	.regs			= &jhb100_emmc_pinctrl_regs,
+	.fmaps			= jhb100_func_maps_emmc,
+	.num_maps		= ARRAY_SIZE(jhb100_func_maps_emmc),
+};
+
+static const struct of_device_id jhb100_emmc_pinctrl_of_match[] = {
+	{
+		.compatible = "starfive,jhb100-emmc-pinctrl",
+		.data = &jhb100_emmc_pinctrl_info,
+	},
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, jhb100_emmc_pinctrl_of_match);
+
+static struct platform_driver jhb100_emmc_pinctrl_driver = {
+	.probe = jhb100_pinctrl_probe,
+	.driver = {
+		.name = "starfive-jhb100-emmc-pinctrl",
+		.of_match_table = jhb100_emmc_pinctrl_of_match,
+	},
+};
+module_platform_driver(jhb100_emmc_pinctrl_driver);
+
+MODULE_DESCRIPTION("Pinctrl driver for StarFive JHB100 SoC eMMC domain");
+MODULE_AUTHOR("Alex Soo <yuklin.soo@starfivetech.com>");
+MODULE_LICENSE("GPL");
-- 
2.25.1

