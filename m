Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2104.outbound.protection.partner.outlook.cn [139.219.17.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A3B43F23BE;
	Mon, 31 Aug 2026 11:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.104
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788176159; cv=fail; b=VDvZLp8w5m2irO/h6X1dkOiHjNPCFNrQ6Q1IUp+ankcDipKjFUfqkCL4noozG7A3CrhP2DAdX7PnKrXiR8NctRY12wAP7YBLNHz8xXEIx5ryQPWAhwwsCcxa3MdCJTgU8jR0PtYSWYL7C+xvp5G31+fZtr4QOt4eyLN78FUA9sk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788176159; c=relaxed/simple;
	bh=D0qkaqlEtlM59PeO+Ges8zxa9Lsj4LPB5fK9keO2dww=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=eLddmcnuekdHHVnzgtQLwjC1hdLUd0Q8NxorRwQz/oB5ZeVplMywLPTnSwZEy6fiecW/kRflSc2ywJbIM8+wA7esfvR4pEe8KxSp2fjZ9CI4FPrVzk7wvN90EW8q2Jg24R1h5pislqlMzVpr2elYoA3GEg08FSbzYHyf7/9hQCE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FkLAb+fBLOnI7mp/eXLXTjKxk55z4nHKqcDAzdyFtIw8lr+iJuXtspSl4H+kylp3cHxo8R5XRQ5AEJFDfAk7M2ypCT4a5rpBshYZ0DqEDAZt8z9gRcyD6UAtUuHiVPDCj1HyE+/1EZ44wfwsZK9hOXN0Ff43oDjhqApEO1CNxsbcrjShU+NKlPiLLFI9jsrnJzBQnebRCgZMuRwBiruiAfkrLekF40C1mAlAwZrRnLAE1WQFtvJf6n2J4SWxGxsEwS6Sl30VKrbMCFa7J7en7tn7SFaNHickY2TMJOWWI7FOqAlDZYI8CID5k09OxZyzO0d6tXF61RamtrK+hl17jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TzIQV/iNG2sRek+FqrPH+4YOYg1wCQ4DtmF78PAy2yQ=;
 b=kVh4IYYJMVZNAwy54+OlQ10NlkxUTbpKmOpFD3+qL/0b/IFAE6CQcX2exKnKy5YqmuFiuK2/CG7tTlJbvi4qRZnbe1MBVgbtfoaafwVsh2R5ZW2D7U7MEDHCCzLp6WH4l0avIiFRBfiCCg3SbHHRbfPBfHnEW79wAAVhCS01Wd8eZ6AO6+EoH20/slz05Gf5zZ0ZD3OeA5bP3/2Isd521bklzJZtJXF77Az9eVs2eZ/Kv+Sz8bzf6erDuRuI3PmC2O3Qy/wHKTWNoUhdZdak0nRe/RMqB/55AbJmjaK8bUeOA1N/eILPBGKiKf5twd7Q6qzP3waqM0HB4S4DNioikw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1332.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:16::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Mon, 31 Aug
 2026 11:35:39 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0315.011; Mon, 31 Aug 2026 11:35:39 +0000
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
Subject: [PATCH v7 12/21] pinctrl: starfive: Add StarFive JHB100 per0 controller driver
Date: Mon, 31 Aug 2026 04:35:05 -0700
Message-Id: <20260831113514.66382-13-changhuang.liang@starfivetech.com>
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
X-MS-Office365-Filtering-Correlation-Id: d8a5023b-13d2-40e8-bdef-08df0753fb6b
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|52116014|366016|1800799024|376014|7416014|18002099003|38350700014|22082099003|56012099006|5023799004|3023799007|921020|10067099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	M8zR3rbXblEIasj8svJSHhQLCP9dsE2aQFDaUSEJ9MZ6pQN+m8CXjJOa/imQZIhWK+ymZ0ghVZRch2pVRLzFRjNk2QzvxJatKiiwHt1GEn/lqeDf7LLgdpuckvfDO/l8ceHQtrhffn2RL+vDjaAeQGd/Xw4Ac34q89SnqKGgwKs7mo7MSFL6X/W+wcbtn9BNtG0s39kUqXEWksKVekIg9D0p81vFB+WoLE2xZPm/EBO3PQr6eUr/t0M6ErN1gSKadG2v9UYtweNpc1BU9JvcVeyKrzcIkakwwoqqzsMvBUFJayUh0EdRqoKB8u81d8GXGhW64idD8XIbB8bZ+Vh4BFvXJTvF+o5ycMod+3gE57v3zc1W886zFGq2U7ZOMnzrS6KuvmvekNWHq32DiGQU/lQu+smiUXOH6KVyGaAQMsUpS1TFh81vGYrLB7/PndUPOM3Imph4hBWANhzhGDtaIACRN14CM8EOjNjr6hBgXcO0FwZHzGMX3gwH7EHa+KPD5+q/dl2SMJ0a4tD2rNMfP4MAPLbB5pyvv/M6idwZzwb5hXNZVgYxFn+RWCqKNp4W
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(52116014)(366016)(1800799024)(376014)(7416014)(18002099003)(38350700014)(22082099003)(56012099006)(5023799004)(3023799007)(921020)(10067099003)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ARyuT7FSlYJmX0XxAhOb7VN3bdcBUU/A/M9ntEnhNLtavAJnZtFdWylZ1AGM?=
 =?us-ascii?Q?4HMUVzGmK3WArOCMZo2d1IcB82Pd1zJNljinc7dc12ETID18cM7Mh2EdLZJQ?=
 =?us-ascii?Q?Hzt2t8vrHqU4DWYLJCRVC+S9ke3F0osTPsuVm0sJG0wTZ2V5z2aNfqaBJchm?=
 =?us-ascii?Q?ZipEWRT0jdkxPaR+OwquuQ6+5/oQj96qIGEKOR1ZDhMEx/5VfOlF9q1cZhha?=
 =?us-ascii?Q?PGxA+uXhg7lvLXfi+dKpOqXejdscGtV7B898qls33O7OItsmlPpifN+1LBa4?=
 =?us-ascii?Q?ZaKGgJqBhVP68rUiT3dk716rj2pBGj29ZZNPp594Ut2sV8pE1cBsCHqrRw5x?=
 =?us-ascii?Q?8CzK0lBxFVDI4ESLBrbzyB3p7Ts9BcShWA8cRij6BKEeRhsetTahJoH+ke5J?=
 =?us-ascii?Q?Wc6NfKykh1dshn9lyZzIXql6k4+D05GkI0ht5unamdOdN5/XEjuyt4cl8Od3?=
 =?us-ascii?Q?1TxCovNSnvzJ4D2p316xcK4jSvR03O835ZA1LaKXpAORj5vZZx+RW0dUOBOa?=
 =?us-ascii?Q?wNHRJJI5GqsWJPf00bawq7pN95qiwd5y6IPW8awqE+iKu45774iJ8j0paU1u?=
 =?us-ascii?Q?WOdterh4ZxxhbBBFUDKj3KGEhGkaFaj54E02td2PRKuMvXHDcb0GZRSBQ6Qo?=
 =?us-ascii?Q?PBuJH6zgptpL/k7NVd58CR6XBlG3fR8jSkxZhebIBXLMUD9Cy5nft81C/0zK?=
 =?us-ascii?Q?Mi1YGT3nr9ebehPOg+Fk63DSU4uAlCojdeVV9YPZdlPxKShklhEZm0J8RfBV?=
 =?us-ascii?Q?CNHyXLFv6dER8dz0urtqr4khLSVSfl3yGQR9vumicMkx4G8l93YDNaPAAVmu?=
 =?us-ascii?Q?CqN1SJy2dBCfESnYaR/nAebRwNjVB4J3VxnhPxnzzuf20Pp4WyaabF/V8tgu?=
 =?us-ascii?Q?5JJsZ+R1rZbdUI5Yd3kjufjpYW6gu1eXKfOB/i3r84o9zvssBVAbs+SBaAZ9?=
 =?us-ascii?Q?CWKh3wDOIzkIyaFYXuNldd/kTj5Q817vcPmVT8uiOyV8V7NDcUKATa4Oy+a6?=
 =?us-ascii?Q?9p8dSPftRp870mdBpKS66oWR/gbMh+CPBqB6oAL4aeju5RQ0NOhCpU0jT03t?=
 =?us-ascii?Q?7hJ0vlleEVwopPMdNsXUaCOcjcGnkdcEcYWBFcfGDoLMe9iWH8yM4sZuer2m?=
 =?us-ascii?Q?1JcSwPfHDKD+mcoUI/gXP8C0QWZFlNZ4qkBO6syY/vmb3gprNdo2iv1UmbEz?=
 =?us-ascii?Q?OHasvzWbN2HYPYsEJHwB4nSOnrCGlScsoeLJBasn2y1oN1qhY1xuka+5cIz5?=
 =?us-ascii?Q?Va9eJZLLKQeULX74AVJSsseG8IvyskNPnJCNB7DeoWhvzMnUdQQDJbtNQugY?=
 =?us-ascii?Q?6H8yrryVZl9/vrmyNh036H0HlPf+4CLWYAu5n0B0ziQtAeFPE8f7GQlYhaMU?=
 =?us-ascii?Q?X/G2xV0pnrkIn22qTUmOMKAG84XXCFCMyyDoOqa5NMws128iAbSZIdRrIOk3?=
 =?us-ascii?Q?HE7E3iVoDrHg62e0jwzD52GU+zst0hheVeiPP7szXcJftN8cSF4+m8TJt6BV?=
 =?us-ascii?Q?GlZUp9o+CFMPoJVN09EXW9brHVxXvCOieN3vlOUOpPkDDfae9XFL4u5IxR2s?=
 =?us-ascii?Q?YkfNd1CpDxK+EwEpUmn5k9FjDJF4NvcdGQKGtLzeURuICyaizIlD3//IJTl4?=
 =?us-ascii?Q?SmoYpuxGY+uZqNwU1fn2Zb3l52kwukgNrEh10k9VYkqyxISAv8NF8RqaVv+Y?=
 =?us-ascii?Q?kqy0zOywNan2grQ+GwvVP/KYOeqnNXkuCiRFNNTfvqQ0rXB6wiWd7ekfExCY?=
 =?us-ascii?Q?2vx3gOOdaHQP0ctjt+EYGM4K1lt7Ff0Y0dC9/sBHns91FKcbq64t?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8a5023b-13d2-40e8-bdef-08df0753fb6b
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 11:35:39.2440
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ExLd9QbS1LwFva4N90niWnHwMFU/9u5PcTxB0GG7HCjA7RqpEDyTshPniEsQ5+ozFGCb/NZPc7ssBhI+rY1QBkKeFQyRnVh9bkYFoknK0y1P8OO8pG7Dw9KOIWDBz2YZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1332

Add pinctrl driver for StarFive JHB100 SoC Peripheral-0(per0) pinctrl
controller.

Co-developed-by: Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
Signed-off-by: Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
Signed-off-by: Alex Soo <yuklin.soo@starfivetech.com>
Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 drivers/pinctrl/starfive/Kconfig              |  11 ++
 drivers/pinctrl/starfive/Makefile             |   1 +
 .../starfive/pinctrl-starfive-jhb100-per0.c   | 152 ++++++++++++++++++
 3 files changed, 164 insertions(+)
 create mode 100644 drivers/pinctrl/starfive/pinctrl-starfive-jhb100-per0.c

diff --git a/drivers/pinctrl/starfive/Kconfig b/drivers/pinctrl/starfive/Kconfig
index bd2517b75c1e..ff25bfcd3ff4 100644
--- a/drivers/pinctrl/starfive/Kconfig
+++ b/drivers/pinctrl/starfive/Kconfig
@@ -56,6 +56,17 @@ config PINCTRL_STARFIVE_JHB100
 	select GPIOLIB_IRQCHIP
 	select OF_GPIO
 
+config PINCTRL_STARFIVE_JHB100_PER0
+	tristate "StarFive JHB100 SoC Peripheral-0 pinctrl and GPIO driver"
+	depends on ARCH_STARFIVE || COMPILE_TEST
+	select PINCTRL_STARFIVE_JHB100
+	default ARCH_STARFIVE
+	help
+	  Say yes here to support Peripheral-0 pin control on the StarFive JHB100 SoC.
+	  This also provides an interface to the GPIO pins not used by other
+	  peripherals supporting inputs, outputs, configuring pull-up/pull-down
+	  and interrupts on input changes.
+
 config PINCTRL_STARFIVE_JHB100_SYS0
 	tristate "StarFive JHB100 SoC System-0 pinctrl and GPIO driver"
 	depends on ARCH_STARFIVE || COMPILE_TEST
diff --git a/drivers/pinctrl/starfive/Makefile b/drivers/pinctrl/starfive/Makefile
index b817ad93b91d..f2bb0c35a2a0 100644
--- a/drivers/pinctrl/starfive/Makefile
+++ b/drivers/pinctrl/starfive/Makefile
@@ -7,6 +7,7 @@ obj-$(CONFIG_PINCTRL_STARFIVE_JH7110_SYS)	+= pinctrl-starfive-jh7110-sys.o
 obj-$(CONFIG_PINCTRL_STARFIVE_JH7110_AON)	+= pinctrl-starfive-jh7110-aon.o
 
 obj-$(CONFIG_PINCTRL_STARFIVE_JHB100)		+= pinctrl-starfive-jhb100.o
+obj-$(CONFIG_PINCTRL_STARFIVE_JHB100_PER0)	+= pinctrl-starfive-jhb100-per0.o
 obj-$(CONFIG_PINCTRL_STARFIVE_JHB100_SYS0)	+= pinctrl-starfive-jhb100-sys0.o
 obj-$(CONFIG_PINCTRL_STARFIVE_JHB100_SYS0H)	+= pinctrl-starfive-jhb100-sys0h.o
 obj-$(CONFIG_PINCTRL_STARFIVE_JHB100_SYS1)	+= pinctrl-starfive-jhb100-sys1.o
diff --git a/drivers/pinctrl/starfive/pinctrl-starfive-jhb100-per0.c b/drivers/pinctrl/starfive/pinctrl-starfive-jhb100-per0.c
new file mode 100644
index 000000000000..a3ec991c6187
--- /dev/null
+++ b/drivers/pinctrl/starfive/pinctrl-starfive-jhb100-per0.c
@@ -0,0 +1,152 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Pinctrl / GPIO driver for StarFive JHB100 SoC Peripheral-0 domain
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
+static const struct jhb100_pin_layout_desc jhb100_per0_pl_desc[] = {
+	{ .pin_start = 0, .pin_cnt = 60, .name = "gpio", .gpio_func_sel = 0 },
+	{ 0xff },
+};
+
+static const struct config_reg_layout_desc jhb100_per0_pinctrl_rl_desc[] = {
+	{
+		.pin_start					= 0,
+		.pin_cnt					= 60,
+		.fields[PAD_CFG_INPUT_ENABLE]			= { .shift = 0, .width = 1 },
+		.fields[PAD_CFG_MODE_SELECT]			= { .shift = 1, .width = 2 },
+		.fields[PAD_CFG_PULL_DOWN]			= { .shift = 3, .width = 1 },
+		.fields[PAD_CFG_PULL_UP]			= { .shift = 4, .width = 1 },
+		.fields[PAD_CFG_OPEN_DRAIN_PULL_UP_SEL]		= { .shift = 5, .width = 2 },
+		.fields[PAD_CFG_SCHMITT_TRIGGER_SELECT]		= { .shift = 7, .width = 1 },
+		.fields[PAD_CFG_DEBOUNCE_WIDTH]			= { .shift = 15, .width = 17 },
+	},
+	{ 0xff },
+};
+
+static const struct pinvref_desc pinvref_desc_per0[] = {
+	{
+		/* gpioe-i3c0 */
+		.pin_grp = {
+			PADNUM_PER0_GPIO_B8,
+			PADNUM_PER0_GPIO_B9,
+			PADNUM_PER0_GPIO_B10,
+			PADNUM_PER0_GPIO_B11,
+			PADNUM_PER0_GPIO_B32,
+			PADNUM_PER0_GPIO_B33
+		},
+		.num_pins = 6,
+		.range = BIT(JHB100_PINVREF_1_8V) | BIT(JHB100_PINVREF_3_3V)
+	},
+	{
+		/* gpioe-i3c1 */
+		.pin_grp = {
+			PADNUM_PER0_GPIO_B12,
+			PADNUM_PER0_GPIO_B13,
+			PADNUM_PER0_GPIO_B14,
+			PADNUM_PER0_GPIO_B15,
+			PADNUM_PER0_GPIO_B34,
+			PADNUM_PER0_GPIO_B35
+		},
+		.num_pins = 6,
+		.range = BIT(JHB100_PINVREF_1_8V) | BIT(JHB100_PINVREF_3_3V)
+	},
+	{
+		/* gpioe-i3c2 */
+		.pin_grp = {
+			PADNUM_PER0_GPIO_B16,
+			PADNUM_PER0_GPIO_B17,
+			PADNUM_PER0_GPIO_B18,
+			PADNUM_PER0_GPIO_B19,
+			PADNUM_PER0_GPIO_B20,
+			PADNUM_PER0_GPIO_B21,
+			PADNUM_PER0_GPIO_B22,
+			PADNUM_PER0_GPIO_B23
+		},
+		.num_pins = 8,
+		.range = BIT(JHB100_PINVREF_1_8V) | BIT(JHB100_PINVREF_3_3V)
+	},
+	{
+		/* gpioe-i3c4 */
+		.pin_grp = {
+			PADNUM_PER0_GPIO_B36,
+			PADNUM_PER0_GPIO_B37,
+			PADNUM_PER0_GPIO_B38,
+			PADNUM_PER0_GPIO_B39,
+			PADNUM_PER0_GPIO_B40,
+			PADNUM_PER0_GPIO_B41,
+			PADNUM_PER0_GPIO_B42,
+			PADNUM_PER0_GPIO_B43
+		},
+		.num_pins = 8,
+		.range = BIT(JHB100_PINVREF_1_8V) | BIT(JHB100_PINVREF_3_3V)
+	},
+};
+
+static const struct starfive_pinctrl_regs jhb100_per0_pinctrl_regs = {
+	.vref			= { .reg = 0x004, .pv_desc = pinvref_desc_per0,
+				    .num_pv = ARRAY_SIZE(pinvref_desc_per0) },
+	.func_sel		= { .reg = 0x11c, .width_per_pin = 2 },
+	.config			= 0x014,
+	.output			= 0x104,
+	.output_en		= 0x10c,
+	.gpio_status		= 0x114,
+	.irq_en			= 0x12c,
+	.irq_status		= 0x134,
+	.irq_clr		= 0x13c,
+	.irq_trigger		= 0x144,
+	.irq_level		= 0x14c,
+	.irq_both_edge		= 0x154,
+	.irq_edge		= 0x15c,
+};
+
+static const struct jhb100_pinctrl_func_maps jhb100_func_maps_per0[] = {
+	{ .func = "gmac_mdio",		.val = 2 },
+	{ .func = "gpio",		.val = 0 },
+	{ .func = "i2c",		.val = 1 },
+	{ .func = "i3c",		.val = 2,
+	  .max_pin = JHB100_FUNC_MAPS_MAX_PIN(PADNUM_PER0_GPIO_B23) },
+	{ .func = "i3c",		.val = 1,
+	  .max_pin = JHB100_FUNC_MAPS_MAX_PIN(PADNUM_PER0_GPIO_B59) },
+	{ .func = "smbalert",		.val = 1 },
+	{ .func = "wdt",		.val = 2 },
+};
+
+static const struct jhb100_pinctrl_domain_info jhb100_per0_pinctrl_info = {
+	.name			= "jhb100-per0",
+	.pl_desc		= jhb100_per0_pl_desc,
+	.crl_desc		= jhb100_per0_pinctrl_rl_desc,
+	.regs			= &jhb100_per0_pinctrl_regs,
+	.fmaps			= jhb100_func_maps_per0,
+	.num_maps		= ARRAY_SIZE(jhb100_func_maps_per0),
+};
+
+static const struct of_device_id jhb100_per0_pinctrl_of_match[] = {
+	{
+		.compatible = "starfive,jhb100-per0-pinctrl",
+		.data = &jhb100_per0_pinctrl_info,
+	},
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, jhb100_per0_pinctrl_of_match);
+
+static struct platform_driver jhb100_per0_pinctrl_driver = {
+	.probe = jhb100_pinctrl_probe,
+	.driver = {
+		.name = "starfive-jhb100-per0-pinctrl",
+		.of_match_table = jhb100_per0_pinctrl_of_match,
+	},
+};
+module_platform_driver(jhb100_per0_pinctrl_driver);
+
+MODULE_DESCRIPTION("Pinctrl driver for StarFive JHB100 SoC Peripheral-0 domain");
+MODULE_AUTHOR("Alex Soo <yuklin.soo@starfivetech.com>");
+MODULE_LICENSE("GPL");
-- 
2.25.1

