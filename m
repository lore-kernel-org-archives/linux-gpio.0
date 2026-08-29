Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2100.outbound.protection.partner.outlook.cn [139.219.17.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69AAB32695F;
	Sat, 29 Aug 2026 02:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.100
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787972354; cv=fail; b=iIEHo/SJWXGjq9ckpAMWkL7ynzgMkws3/40P1jSJkGzboDq268yR5LVFkGqYZjLWXgOI5KEHarQ/ofvauNap/3d9NLCJB/sO1hjqZl7uHjl08677L5RjvDL9P5n2MlbvM/oMdScfjUsReBrsnq0c1jsVGrRT8xgvlexteTUfTEk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787972354; c=relaxed/simple;
	bh=itre0KOL72dcY9tiSKoJuI7DcI/CnanyaUz6jC4AYnA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=V80QQ97eErtv+7gYOwVkcw3P9ne7vOiLU7ijNnZvP8xhwaJY8hTmMe+zUtLzuEL1PCOJzZbpWHV9XEkziKzYIKgRL1ncm6eZnBxPfUuGahKUxmHXXJi6FjmcVOBBzRm+DC1cy5YhPWFNpYFwCUZYoKtbVcNhqXzYalMjPvWr6WY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZtoJk4fdO6K3JtGlGtXYqT4USJE+4r9zZ3zc43PMiYzjDvf88Il7CTBxYXaT6kBZGQrFArfteLgoWYeo0U9SoDuXGoX+Pd8u4lVOXA7l8cfY00fji4ngDeAFEHyLNunz44pPOaduSDVxKs/ny4Oou0X2LR39L1uW/c51r3A729QSQVBsJpPwC0MS1BKECg9KLDPDOq6a/ztaIwoQ36EC/U42dy+xlBTW4MF/qCder5wBH+wbxDE0SG/1r3w8C6avPvE9NokkszMIYxoXcVQiXlW4hYCPiN21vUIMy70UCXmyXf75oMWh6itpSqgTApNG11Gk2wCR1EO6Ruc+clbSCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tjLaF5sazIKS4BMKVCphL3MvX6dXb29/yx4wmrdxWq0=;
 b=OpsQ0GIQN0l1nezPAshRWEkdOS3rnhNi2rTvi2xpXUn5G9XmrDahIhX1TEZ6uk4qFd5VZ0w1GHbbnBsCk2agn9PzFj4GBjg5vp5E59nQcd4u3HTNf2EZYgkJocjiPjv7k6Z4YZJ3Y/x2vdppzGlzwmbihNmpBzXp3xR25clz95+bVN3e7WHPo5RhgsJjdNbDeLxymjJQoqilbvcZF1NlyuUJ+uw+rRl+iJMYROYy1bJUpJHLfih2dvPO/7otwu1MBIRWlmXHtjqwzGkHdfoSEt/R2oihM5nDD6mVOWv6ChQQtxfdmN3o0kJXP0eomsd7W6i3Ap+yHy2jpvVdfg8HwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1153.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:13::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.19; Sat, 29 Aug
 2026 02:57:55 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0315.011; Sat, 29 Aug 2026 02:57:55 +0000
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
Subject: [PATCH v6 16/21] pinctrl: starfive: Add StarFive JHB100 per2 controller driver
Date: Fri, 28 Aug 2026 19:57:15 -0700
Message-Id: <20260829025720.23915-17-changhuang.liang@starfivetech.com>
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
X-MS-Office365-Filtering-Correlation-Id: 113ce3fc-19d0-4853-f2d9-08df0579531a
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|7416014|376014|52116014|3023799007|18002099003|22082099003|56012099006|5023799004|6133799003|10067099003|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	zvewIbDXccV2mNEVM6J3lvHV1Jo8/Q59H7s868Dkq14ypEfpPzjQ+jVg41tbDdgNWPQ1/rmB/gviiWQP514/PksdQJHIRbhj8+OhEgqbaA0OQlSI3sMm4shO19//l8AKpmYHmp6qKBtpoEfgMjVvGm1snuxTWtUeQbAdUCtbIlD/iq9wuN1SlQFoqcFyLj0mjqdCKdCGhRkDHShsp62G9asEcxS0Du5oxtDcpND82PmJKyvvkdtCZOkRD/Q5wny6w5yS4a0ouDVGytQIOIVkPNGWoz68nTDO2T+c2lz9avUIyechE7VCs77HwIAfG+rBe87b+l6UVDLMlSWzTqkVGVEkrawpoaTB5OYZhPQp8stMzg9JFkO3I68Z/w+BJDH5vf/kqBdKmge8kBGe06PHuHKZjwnRJMMB0FLsVUkDQy2KSEhMQeXBHMRnWdChR07EfvnrCiHUgdg7hIN2brCARJPCk3pLDXFioxmNasxlN1KZF3a/hiLIZrL96N94NVU9y9f2GzAN+wwIYq21U8lv9oYz/fkZMEckj4b715YeQSlA8USfgda9cphgk3DZ8iyfYj8ofJx8t0HZjU5ZTeX/tQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(7416014)(376014)(52116014)(3023799007)(18002099003)(22082099003)(56012099006)(5023799004)(6133799003)(10067099003)(921020)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?5wJ8Xnjy2e3tqHkzGZtkcZkJE5r2F2qjyyXBqUHBkq6rlcdKu1jdu0doYfax?=
 =?us-ascii?Q?h2qUaaoA3aL0ZwONYHdTBz6wQD8KxgfC+6RjBmwcztPnkfD05EnlpcXQiVoq?=
 =?us-ascii?Q?dsxvMCIxQR6kv+wk82z6ObY0e7JlqLwhgPo0uzwLVfsRdMnvj6kUqnltgJ1f?=
 =?us-ascii?Q?uiyPe1iwKgK6MjhH1vn2GKOl9Uw1wOPpZme8ZfXyoRBeQV54g515I6SQmN/t?=
 =?us-ascii?Q?2euvQHt2/K1bq3QB9sulcOrheKu5WoKUMELfmnOMeYc02H6GaqJRMT8H8R+f?=
 =?us-ascii?Q?iTKOSLMauM3W046OHieCfIXTH1OnR4o2hzQg1v5QYtevBenhZ/3+L8GJbHBD?=
 =?us-ascii?Q?jmftkN+c+0zkW22C+53saii991r+qjn7XUb3cAyx9EbsPwwQeZ2E/Rs+p7sZ?=
 =?us-ascii?Q?Ag77Ko52NhIFDXSi656EvkiaXMmYB+Z4Be/ziu2qkAGKL7gM97NeBAsBosWk?=
 =?us-ascii?Q?nkz9fcn8CiCdL0ot47nR8wpOORmaAYgLWDLfLewCXSY9+36wPe1JUjdcu+se?=
 =?us-ascii?Q?oyW/8zyH5GZJ4uk3Bm9gPGF3HI2dF2aB40FkHxwzgD1cVgsxt68Mbl0mxjGA?=
 =?us-ascii?Q?hX/EIjH/YnzbCiH2Pd5Tzz1CPoWAT+dEDPm59XuQVwaJZZ76JXx3uXgwVEvI?=
 =?us-ascii?Q?qDZTf3zN6Z1X7HER27nz3p5OdGVXg+6khazNpZZ5X4U8QDY0hQaujDVCBbKK?=
 =?us-ascii?Q?hbaU+wR+MSqNDQND721OqSnnn28MsnTA3lVnwaGeZdRAhdcbJ/OC3WB+mH4q?=
 =?us-ascii?Q?TMugHNYwcE3+G+CKS6122SBDtQ41+SJk5T6wbRIMf4oazu2HPbWDC/u/aQQ9?=
 =?us-ascii?Q?VCm6vS8zfq/zrsBSzbPhVNRZsGSjYC4ZpYeYDDZXameloLJQ5ta+V1QZtcIn?=
 =?us-ascii?Q?6osCDOFszwJaSDYbbdl87jHEwAekCH27ZgpZgqiL5fKzb/MpWnuN+tA+kqmH?=
 =?us-ascii?Q?bGg0r5NHySsA+fdK3X3hj92TloZxAZNSDhe2T3TYV0DQv74ne8jirhZLPxWo?=
 =?us-ascii?Q?eN+pEWBwHAptyvLRHapSUpyWusBDb1RiBbVupkfVqeB3AF5+34YxCtcC+uMZ?=
 =?us-ascii?Q?dBhqBhk4OtNWBG22yFg4KSs2LXZ0IhpEmUjG5K+YNdM2KGDbwq6ckYRurNgK?=
 =?us-ascii?Q?1RWP0AY/Yc8LFbtXnuSVCW3+Oxby+tiueAojJZmZaxomXMzdQ6zOxHtG2R4j?=
 =?us-ascii?Q?zogR3maqp9ejsOpufJthYXmO+8L2dxLj4An4GoKH7q+TR0FQCUVtP4ruzP+W?=
 =?us-ascii?Q?GrDZuRSRpkvSYIYY0r1yLNR05U/qDCWCYWFQLYXtaVQLFCM+z9bo34c4Wpd9?=
 =?us-ascii?Q?HmdAgqTa5nPluE7MVoqafgzKd30cIWKmo7WRz0FIWWCzqlTCaKHkMAKlF6bM?=
 =?us-ascii?Q?lCueI5xDYweZU980+2E/N6MLy5t6+DlRVad2mLiOSNoF/OkghIFSkNMKBBYX?=
 =?us-ascii?Q?GN8/6gNx4ipOzr3QKfLmBeT52AS1ACGwEPYwxANPwPayusLhV6W0+R/OPJfS?=
 =?us-ascii?Q?b6FA/XUQOAj/18xVWmJsuUI/IyEEPgs1yIq7/C/OFZfY1m+OUI1qp/z4tXli?=
 =?us-ascii?Q?dCWHbueYkhJ7bRAmDhqf2UVijBUiy6R502NcEeXkJmAMEkCooW2n4UCzVVNZ?=
 =?us-ascii?Q?pgAavB7cWMZ8HN2WWlXW15Z+xjVWLpoVBp2qjUsg9eSWsuApwkZ2y2hsRDH/?=
 =?us-ascii?Q?y/uZllxywsIzZ8Us1kI3w46AlotgmqxyZkclDHDCf8vFFhS4cSl3LUD1/R7i?=
 =?us-ascii?Q?Axt9Txvil3+kIIWde0OB1pBa0CyshSnKUbYx/eLDn8dj9w5clbf4?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 113ce3fc-19d0-4853-f2d9-08df0579531a
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2026 02:57:55.4622
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LjEPyfqk201YrbVfI9l4bv5F9GbE4af/y4u69T5vjR/y4KKVjtpM3vOl9Lv15V55WLSBZyGWqNAMkNzmZe5R5HuG8mfne2C5PDTUL/zpksXSFstjJUkvqvE4dk+kfN8B
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1153

Add pinctrl driver for StarFive JHB100 SoC Peripheral-2(per2) pinctrl
controller.

Co-developed-by: Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
Signed-off-by: Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
Signed-off-by: Alex Soo <yuklin.soo@starfivetech.com>
Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 drivers/pinctrl/starfive/Kconfig              |  11 ++
 drivers/pinctrl/starfive/Makefile             |   1 +
 .../starfive/pinctrl-starfive-jhb100-per2.c   | 123 ++++++++++++++++++
 3 files changed, 135 insertions(+)
 create mode 100644 drivers/pinctrl/starfive/pinctrl-starfive-jhb100-per2.c

diff --git a/drivers/pinctrl/starfive/Kconfig b/drivers/pinctrl/starfive/Kconfig
index 0fe2d21ba402..ad04a7331a86 100644
--- a/drivers/pinctrl/starfive/Kconfig
+++ b/drivers/pinctrl/starfive/Kconfig
@@ -79,6 +79,17 @@ config PINCTRL_STARFIVE_JHB100_PER1
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
index 000000000000..a2cf4995552e
--- /dev/null
+++ b/drivers/pinctrl/starfive/pinctrl-starfive-jhb100-per2.c
@@ -0,0 +1,123 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Pinctrl / GPIO driver for StarFive JHB100 SoC Peripheral-2 domain
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

