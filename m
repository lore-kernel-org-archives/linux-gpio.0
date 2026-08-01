Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2111.outbound.protection.partner.outlook.cn [139.219.17.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7953739A048;
	Sat,  1 Aug 2026 15:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.111
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785596660; cv=fail; b=noV2+nIR7Ag4e182cMiiFI8BsbpcX0SfXy5LnqLtQBXDuLdrE7z5R3PZDGLQrv9ywv7D75yvlkYAJysdFyu3FPYHXlCrqu9iV6KctwiJH1Rn5al8KVCsbyRJ2G3C1XlZJdp0tYikWqvHq3y23UOTyDmzy453lKhfibUwZFg8MRc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785596660; c=relaxed/simple;
	bh=/5o8pdTJDf/gXJEtAYubaBMl5EIf8FF2PUtPtmiYT3I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=MAOiaxdP9wk7PwLF/PSMaw0CKF/jPUOmKICmefWXeaWlNMXIeFbqS4lb+ODikR3rwKXZ0HB3PNSnlEtR+bGfU6yPUWDmrI/BWZzdB3eUrg1Z1WgLwwBVPaHPblAxbIJAa0vd7SyhkvtmpWmdtIz+QRJzYKe9NiyDzWwQFeOpeac=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OmDNi3kmrOS3mPerQSjxB6nPnN/omKETLVkLtyXi+39WnJ6NLVBe9i4u8rNWOK19hrbXyrtGTeAmkUuaAFsiZWx6YUw9TZmpfpMDWnKby0MlwiIXd8Eph72m2KxwM82wsg1uJm30NFKYbnhh+btU1jtDjGRQm1/nbi1ZKTzt9U4Gw6Sa7qWffkOG4b/kGRcbr7cD4eW6csQ4OUlT8dCp8hb0NrAvUrTt6pGB8JrUPTIq7RzeLYf1t2cRHjw9Qm1ZePUdJWqHWO/YbXTdQug7YnuGu2gNhHrQX5Z2g0ji7cvGZuHgZHsK4JW/d9EBk5rAy70hZrh8iQOiPQeNg/ZqVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cdPeRhmVKmrpDQv8jof8kVZMGMHqlJvYx3hd1m+rBW8=;
 b=jYCt42ksd8BF5KlYG2T/V35Wn/WfW6iM+oWCHFWdhjF6YbPnxhb2ZUxzbmAmjsz3dmiRyDKk+RAr3CSAT4Y2zdH+kqv5Kn+7h67+5aJjcSTaCsUQAC+JeSEmQfiFQmyc6OivkyjSSEFM7tbhVZg9QAuPF9QAWvr6/tvG6pJS1WdOuWWpvmOwgV1NpElKJKk+8W5ojvO1aMkra4rVSBgvETUsC5ARCGjNMPkZCNLRrBptIq3ymmIAJuAS46x50swbBEavI/xnb7hRdq4DCqk1/4qmJfwxcWoFHP70155JZVTzKaen0H/Yy8+wI4h9R3646iFMhO8tCfIkeIODRTvyiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1138.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.16; Sat, 1 Aug
 2026 07:27:33 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0270.015; Sat, 1 Aug 2026 07:27:33 +0000
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
Subject: [PATCH v4 10/21] pinctrl: starfive: Add StarFive JHB100 sys2 controller driver
Date: Sat,  1 Aug 2026 00:27:00 -0700
Message-Id: <20260801072711.153217-11-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260801072711.153217-1-changhuang.liang@starfivetech.com>
References: <20260801072711.153217-1-changhuang.liang@starfivetech.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: NT0PR01CA0027.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:c::20) To ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1138:EE_
X-MS-Office365-Filtering-Correlation-Id: a92d669b-fba1-4bcc-e987-08deef9e5a6b
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|376014|366016|23010399003|1800799024|6133799003|5023799004|56012099006|3023799007|18002099003|22082099003|10067099003|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	6VygV79A5U1+bavfMpxNTfeXBspekHzkZthFLweJtWKxGak+jwvIlgchkjavtgYUzVtXXDOFqqc3XjjHqUe0OxrPwk8IEkljwOLa1I/BtlLVsqunG3Tk/fBtJ7B5urVkz3WFLxdxUgPpBxOikNzcwmNV7gBliLBWR5Zl7hsmxMEkPlBD2YNM3EAWAZyOhFNZ+6nlVAjss6y3BL+k1FWLufD0Bz/cKAiYFgTnlpbeAwxM8jrJ1fCLtZokCwt/PjtKx49G0oYv8h14eGFFXMvOLVHjsSInb5PEYurwILCKSrTy+HADWbALvR1jPWfUhHjje9bibI/lwWFEx/Aa6e8n9rina1ApQ+dbjlr0XiobzXAfJYKb65bYhbBbAKQ24CM5JcO3q4ugSo22k3BZRdj1afNVJiprxjxMXsjw8SaE2XZx25N6nfPhfNb6o2hfJbXl29k/U4mqcseXMdbEGp+EM+yYd+j7FEBfBD+LpnOKxVAsByVFV2qIeEpWevgAD6ZqrVmybeT5vq8tVihQ4LqHzRjYoxSqYP2r+yenk6AzUI7WtDmvlV20z3ZrHJ/5+6ryK5NaDsGE4cfG90Q8U326RA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(366016)(23010399003)(1800799024)(6133799003)(5023799004)(56012099006)(3023799007)(18002099003)(22082099003)(10067099003)(921020)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Qr2RRVtIPLLLwhLDw/yrxuC6RtGExjPUvE8g3JqFHDrNDL1k7zkVO9z0nKdN?=
 =?us-ascii?Q?OcEV2QhdnQI5QKjvtOS8+bMYoaywRAhh4ChuPU+udtvn8r2RR6PyxKd/fM2F?=
 =?us-ascii?Q?z0N0OfFoVqzyQaHHGKreBHOzhEz6AaJV4R5YLEDCXqpU5iv7nIrjdw7VFpIq?=
 =?us-ascii?Q?qXO5M5uD0irdOj6bO49EWurayQDO+fWoaMvWELJkjFUZb4k8iJhcpjpoYMsk?=
 =?us-ascii?Q?9T1L3H4ir3UVa5ypxCRPXZIPEWAt/cIZC3MsjmZ4EpjieMvN6Yt+wsT/wLcW?=
 =?us-ascii?Q?FibYmi6nQc61TMzuExlz0fzMbnrsZsc89924L0BczlHyWGqSKX2Lu/O3Bedk?=
 =?us-ascii?Q?geKEFgqT6Ji7NTm2DdO6Idv3vzrUuIeplwYGq274rhQSq1mpLvuMy9okcV6A?=
 =?us-ascii?Q?9mUtei6m7KP8Dw46ZI86ZEqguabgloZtgQglXNnnmXPf4MRUCdf3ghbcmLW+?=
 =?us-ascii?Q?wWdtWV4M6CduAqhAMmJ7ipyvK/+2kdd4xQQ5ryyy+cSHYJ3DBDOouydef+VQ?=
 =?us-ascii?Q?pgJe9iuWpsnnGbZiQyFU6qeUVY05vCr4REpSuAcU2BwXeElEfzvnkiwQKDR4?=
 =?us-ascii?Q?lJwUf0MZLyYyQS7zNt9bgcW2Dw1ook+vkZ1oEQ6Y/LaRakzEnir+DsKEVLWT?=
 =?us-ascii?Q?Y2TSxNN1C6WQYux/CZLHP1ZnnlVtEUwX8f2wVCWUtJjmQwH9XaG4pCiR8t5B?=
 =?us-ascii?Q?rey4Bp4r0cpe8tmxOPRX+OJWP5FSxuI+suZVHhFxF6Ag7rv9xw5jVAer7OlN?=
 =?us-ascii?Q?GpLTemSYZ5lRBoRMlCqJ7ZU7OzLaDxOApbxhIgLEh4+THtqhFMHqaGCmRrON?=
 =?us-ascii?Q?ZCN/cfHT91x0REMkdTpfa6Yh1tn0D7YxbHHgS8Nelnjq6lJNSloEPs5yoeu7?=
 =?us-ascii?Q?s4OOYHFsxss6s2iwOyISqASQxL0w99WT5cl99330n09KtS70yOPh4aP9Cmin?=
 =?us-ascii?Q?liJY72irHj7eAf20oFYxcfHVi+tnYZeINlzl337WFlHKbj8lT+CBp8snBnrO?=
 =?us-ascii?Q?eJlU6DSm+Ssaxsxjp8F2VZ9Tk9l/23W6XPRre11n0HyBXBb8uaBv3Tkfapgk?=
 =?us-ascii?Q?1CYlDwmccuIKuxsyBjAsAgkClGyjL8TWzL0H776z52Ta8e+LJZGZzuPP7Ifk?=
 =?us-ascii?Q?Q22VOtKuWMEJukREktty65krOdhh3tDI7lVcOwk0oNHmHO1bR1cj/VtNbikO?=
 =?us-ascii?Q?vPwc2QkfN2/AcWwtTit9I7dWyVm52qeOSKUCfyn7awsKtXQQ457W3JHAodDi?=
 =?us-ascii?Q?8omIlc2MryySe2xoAXoBmbVfZWhR0XahAEPsPV1ZkB7QTjKLv784dkVQJSUU?=
 =?us-ascii?Q?Y6XPAYR+/oF00ASOxzcjkNN66r1ddGEUujekyoxlXOLlHqnxjDheYvDKTZkt?=
 =?us-ascii?Q?j/n2JcVAGLL37mHfsHEQXWxNY6Cn4vlJgnLqREFGUyUHVD3EN7/IFwhRoRnB?=
 =?us-ascii?Q?yQmVc7VI9vM907lHZEOANm+UoZEGiqspxvKICaNmXj9Lb9zzrLYhlJrxXyrF?=
 =?us-ascii?Q?7JbAYcBX3EITIETRehqxaMBZcUkp+sDckWLlI5Bshz5zhid35VxNnTpPomn9?=
 =?us-ascii?Q?kYlQVqkx8gcdnY8yMgkI6oVt69C12kLM1UgAoo7q2H1JPDsaX2lc4LZzDiSE?=
 =?us-ascii?Q?UaYHfwnBdegYiJRrnQLorkWcNWe3FKm4lomtaWSi2dC4Df1nKBVCEmMbcj1i?=
 =?us-ascii?Q?WXbAIvHiCALbiKgqSa1AzkW8SPzKY8jVjd0qu/+Zta9OMNIeevY5wLcffafm?=
 =?us-ascii?Q?XXsWV9FSlnZhaTKU/9UymK48RNg76+t8VaPkNgcwVANkRoeW82Gw?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a92d669b-fba1-4bcc-e987-08deef9e5a6b
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2026 07:27:33.4882
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eHA3WwpT0UGA4C3NJt+FU5HS9ikzcUb6iQuiK4+zcXdCD5bK5132BLh92wTs4UfkrsgxJMo9tX0xhT209DEswRJLxi1e1OXDuHFdkA8P6o2OgVIj/K3o3covfvnpWVU8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1138

Add pinctrl driver for StarFive JHB100 SoC System-2(sys2) pinctrl
controller.

Co-developed-by: Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
Signed-off-by: Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
Signed-off-by: Alex Soo <yuklin.soo@starfivetech.com>
Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 drivers/pinctrl/starfive/Kconfig              |  11 ++
 drivers/pinctrl/starfive/Makefile             |   1 +
 .../starfive/pinctrl-starfive-jhb100-sys2.c   | 132 ++++++++++++++++++
 3 files changed, 144 insertions(+)
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
index 000000000000..07c470ab80b0
--- /dev/null
+++ b/drivers/pinctrl/starfive/pinctrl-starfive-jhb100-sys2.c
@@ -0,0 +1,132 @@
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
+#include <linux/mod_devicetable.h>
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

