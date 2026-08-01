Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2114.outbound.protection.partner.outlook.cn [139.219.146.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A17A3B9D98;
	Sat,  1 Aug 2026 07:28:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.114
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785569289; cv=fail; b=t+SsEN5V9NfMM95Y6GzOM5o2ZOFrrsZfFxjDobwQvR6Z1f/Rs07Ubkzvjspn0tftTVGnPevjIYsM5kpHiVn34as8zX3VpOzsV69RLUxoe6JGxz50bGeN+vDjxRyNULjei26kx2wuClil871f2RLoFxNUh3dicA1WKozctRfYugY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785569289; c=relaxed/simple;
	bh=Gm2ksyzp2Kn368+O5iMeL5OXNstA1B3oY03yh8tE7cU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=FjO7i06pY450+jNGNEEdjMobjJ460ejoqfRmExfb0ZApsNKGbCL3SOKfO9xhOGkOLfIW6h2WTmfIH/EwTB+QwolIyb0apCyy734yQmCU+1QbHZsJQd5aEzs+j5pFeU/7jJMZd8dF1Fm/gsmiXzo6RWwlbe87d5CORKXWZkRfX8g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KrRI94tpCjjyp/QL+3utS1XDhrkI9bwqrRH98D7C3MF92xXIjB47tvpivUvhfSK4N/4I5RcEWVYXmZUqa8Ls2SX3jVP3rUpfbW3/ws6AHjT7M90LfKFky/8nXIuwHKsuThQjWWqQzB1xsVOrK7KBab1GWgrCV9bwxeJHgOmmJaw17Qpc3Q985TDKKiD80pbZGmzDAsbGfnYtLyS9kJNnJhNX8IZo3wmCpJb0xbg8oA/b/IOf3OP58qnuk4UCTqlLjiLTLATJi7H+1vC45ezWc6Wq8dEelFbyfPvd5VApCTw5uYDYrY03k3B7lIyjYEtBrgxaPF5KKiI2059XSJUDAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nspAYNHj6BaQNi3Tsqf/LUFrE/VLUz0EgemLsx83VOQ=;
 b=hsnNYE0Q9TbXpQa+gC01p6sAnLMNtEVHVJOt5zrma+wqcw3e24YxXtZPc8ym0U7hiPrkOSrfwATYPTSPdBgGRcU9KkNa+31j11LCv8wC6wDcIRtpWRP5izyF1tizRXufygfbM3M3wW71+V+XEoKyxouVrk/TeYNeg134pigGfyC8Epr3aT+98zcdo74GR/TSTq3bnl4UQ8+KHUbwfRcYKiv+Z46WWG6en1bFtAUi+Mdrf3QDj6yfbKzL5rN+FFx6dZySNZqL19QQq1waQr/B6+CA1GT79s7pIUEWcFGJ/hbsvYP+4Xj6ObIrd4DtYGBPNBflreehYs9HtfGtR8+BYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1138.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.16; Sat, 1 Aug
 2026 07:27:44 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0270.015; Sat, 1 Aug 2026 07:27:44 +0000
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
Subject: [PATCH v4 18/21] pinctrl: starfive: Add StarFive JHB100 per2pok controller driver
Date: Sat,  1 Aug 2026 00:27:08 -0700
Message-Id: <20260801072711.153217-19-changhuang.liang@starfivetech.com>
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
X-MS-Office365-Filtering-Correlation-Id: b21630bb-58c3-478d-40a4-08deef9e60e7
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|376014|366016|23010399003|1800799024|6133799003|5023799004|56012099006|3023799007|18002099003|22082099003|10067099003|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	KXWgBrlIOYgTPb7dqirdR0ZZnPP7R1vTODOut+4o6pUmccDcik0v/baxWjaqURETS8ALVwXB9YNKqdIAGKlvl+WoJUVJvH0Rm2tpCvi47KpiWNlwClF7ERZS1zarCFZtsp6txrFgIFTxNzYGBdRq0SbTQUiaMJjqW7xPBK0CGzLuxrQJp0QXatoByMMQzMkzQNNj4A5qZmIVhkcOVD3s7Tfe48IvFculBjSF1bT4zYLEfeciEZJj9rVpC9h8BVk45mpnjKJG9pnf2DEYE0oA28DVZ6zl6qZl2fznCxDIxPycwI0hC2HDoOaq1dAB0662m/AyeFfGDWJBuT11MkbBJyfwXdManCKusvdWOT1cXrE8gaegSsgEVH96i0VIfPVu7Ptt8VL+EaXO/g1c+8v4Trq0opnhWv9vYn7UQBY52hOPhu+R50rv8/gZOD4x8Q3xqXRnX9gANZRBO7QP91oArEnNtQ0lM5nG1KnZrAaGGDPkzxJPbwww5ZMCMUUobpm+W81a0ES3mb9Agpobfu7V45zX4H0T1uNnYJGc4gsND2CPG0VJ9k+Xwiq87flZU8D98MKgryDy4iPgeX7X1zadCQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(366016)(23010399003)(1800799024)(6133799003)(5023799004)(56012099006)(3023799007)(18002099003)(22082099003)(10067099003)(921020)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?axGb9WJEbzW/SZ4xU/AQy+J1HNXp7N0UMeM0YWYR35zGh1rdiQVs+kbeiJ2p?=
 =?us-ascii?Q?1ul/APwFv9+L5dZF9SNEqYYRgMouAXQ0IblwTNk9OkKW6BeKw5tAEE6YvjzG?=
 =?us-ascii?Q?MVcqE7vfaikvbPudUmMd845EUnOYu/lwJp2THJhFuoghwDHDsdUb79mi2TAs?=
 =?us-ascii?Q?XJ6Msu+0lPD1fNtagE9RsJpwWZrNDMgPnQ6ee8pSXz0S/SKyXP1vY/CFOlPK?=
 =?us-ascii?Q?lM9t/2vepPT8ULYooJ4f2Wrn9vjSsqEanvtpHV3JGappD0Fv7Pr9vUsUy1/N?=
 =?us-ascii?Q?FOleQz0/+htuU8qZVhBXC+UExbOvRZGsv6vAKH18LHjFnmdsOFcfT7mQnRYI?=
 =?us-ascii?Q?WKjhC6b9j4RktWxmnbTu/W6yXQ/K6y/YaMldMIPwxCZAb8duc6jQfHhn4cTx?=
 =?us-ascii?Q?4FYp3dfJRsXaqeNVEm2V6iQGycEXtgexGF1aUfryz6PEPD7a5G/66h24vOsj?=
 =?us-ascii?Q?UW3YdaMEr1yXUXjFMTRS+HxaD//47RlKLF0zwmuXd1ChcbYt2nXbQV62PwRk?=
 =?us-ascii?Q?Sz8UEdXUW1+dZYWbhplLIXIniWc/OAE6E9Gq/S/qLWUGfwOxCPmlsx9CDha1?=
 =?us-ascii?Q?eEwH8E+rOhuFxAEwgdSXAo3Q4H9zsjvCZxLzBEDBHzOPfGim/GrNf1Y4RVDl?=
 =?us-ascii?Q?nrhBIC7drIJN4rjPHQVfozBNUjs2cYKcCG8eNVz+ctkqjR30CEk0WSjf/tcT?=
 =?us-ascii?Q?02afBdLhvkhPyleCdmr9hVZeKMSO1+gILcnX8ERGtVjXt2hzexksnzDMBWIU?=
 =?us-ascii?Q?BTUNQuN+EO5a9cOncZATWmeukU2fnmEGt1ArblioGfnK64oSGE3QG4BXMNq+?=
 =?us-ascii?Q?vu0M+G2hNPLea0iw3oWSs7qseuhLTblHANQtvNePI7yaxOhDybwHF8wxv9PZ?=
 =?us-ascii?Q?F5sxiZbX3e2JnzxMmZ1Krp9k9Rko+7o4HbeP58/JsdYOx++mJgtDP4TeDczN?=
 =?us-ascii?Q?+a6ftcH3XXJ0UdXEjb0b1XiaGWzG0iZ9derIv+PB7ZxVtxRYmqzbBOMU2FdO?=
 =?us-ascii?Q?jQRxWUlBa4Zr80E4GsLE++1bG/J0v2+a9YDdzbBzW8u/n8Iked2L3HaW40Oe?=
 =?us-ascii?Q?tg4aDTlwj8I5GmZTvjo4mBaibkFJB7uJLaTjQO0m/zQ7WTOjDDBdAfgxoG5s?=
 =?us-ascii?Q?67Xev23lulRNXJmgvCgkX5PSFMmWZJXr3HcG6J1oMVP8D4SjT2W/yl7AOC+l?=
 =?us-ascii?Q?SbxrJHSAwouwB6uYd6SXXwotF590Qck8CSdhQXMzFFnDNROOa2tWQmMOjkNl?=
 =?us-ascii?Q?M+KqIImEYvPTspsY94WOc5e9714nnUPq6b+NUF6QyfzZsT7mW+OecaCrq8Gn?=
 =?us-ascii?Q?1lsT7nxXxIqJd/VqzQpqvmniK8eZRIp1Nv/yrNxHQjDfhlMVsnbmN2BUTBto?=
 =?us-ascii?Q?mByIFmzRldqO5puXVYRDYCO+Ng0TtAQamzcEhMZ0EkoRFCmu+ypTbXnRT2z0?=
 =?us-ascii?Q?yL+W87fBry0wF0WVQmIC1CgCmBr8s4vWghVKoGgA5EE9+Q0l5p+WuC+FrIBL?=
 =?us-ascii?Q?q8v8prBXp4XhA8jEC18JUy9nH2jyk4GV6ozKbJyY7+9EFI0MuD05D9cF+Pwf?=
 =?us-ascii?Q?G4ZfzF2u0r8JQIZQFWnH4uCELUIYN+/909aC6jhJl0hSNnGGSPJW+4TmCCwK?=
 =?us-ascii?Q?NijGQsL3a3P3Si3j/e/yWMCjoMdBEXFArzdVzWN7jdWB8oKuTbBjSe1M1EdB?=
 =?us-ascii?Q?W37aigIyj9MZ+8Qi9L2Aqw3YfslEzi+u7oNhkLdhc22rq1MPO4Dn9qNBisnr?=
 =?us-ascii?Q?oVbYfYW5l/nSb9U9Q5ZSRFgIZegcdjrubLxZ/ITscExpcJXCuybh?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b21630bb-58c3-478d-40a4-08deef9e60e7
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2026 07:27:44.3935
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cdHcLWIsniV5TZ7kx6h21lItfmYaRvGCznQUEcVof4/bFUSVAe0hVXWo0ygGwPfghMPe55kPF8MYT2ydGCFHr4NfzhTbsCKFS4gqwwe7mk5xHthAGPk3kInX4szieQkg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1138

Add pinctrl driver for StarFive JHB100 SoC Peripheral-2 Power OK
(per2pok) pinctrl controller.

Co-developed-by: Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
Signed-off-by: Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
Signed-off-by: Alex Soo <yuklin.soo@starfivetech.com>
Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 drivers/pinctrl/starfive/Kconfig              | 11 +++
 drivers/pinctrl/starfive/Makefile             |  1 +
 .../pinctrl-starfive-jhb100-per2pok.c         | 96 +++++++++++++++++++
 3 files changed, 108 insertions(+)
 create mode 100644 drivers/pinctrl/starfive/pinctrl-starfive-jhb100-per2pok.c

diff --git a/drivers/pinctrl/starfive/Kconfig b/drivers/pinctrl/starfive/Kconfig
index ad04a7331a86..cbbd6f1fc338 100644
--- a/drivers/pinctrl/starfive/Kconfig
+++ b/drivers/pinctrl/starfive/Kconfig
@@ -90,6 +90,17 @@ config PINCTRL_STARFIVE_JHB100_PER2
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
index 000000000000..3380c852d759
--- /dev/null
+++ b/drivers/pinctrl/starfive/pinctrl-starfive-jhb100-per2pok.c
@@ -0,0 +1,96 @@
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
+#include <linux/mod_devicetable.h>
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

