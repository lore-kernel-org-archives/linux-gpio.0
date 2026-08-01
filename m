Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2114.outbound.protection.partner.outlook.cn [139.219.146.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D06CC7263B;
	Sat,  1 Aug 2026 07:27:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.114
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785569269; cv=fail; b=fYRB7FIfZk5OuQwepA9mDDGyWbIfuYbWp0F1AAP4KeRwuA1Ea2crjNWd8+mKJN7ymolnI17iSW78MUxn/U+Twk7rsn+t/Dta4vYymtGJBBOeUZYIowjgMjcjcJu7DJ1FrCUXOB8EZFzCEQkg2M+mOUAGgmvaFQcSIseH5sTkmb4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785569269; c=relaxed/simple;
	bh=1k9yUAVr6+YwfvvLhE7aYTO4F+RAT54Z6sxJoCtVFmE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=X754WJ971aNJPAgwJ5iGKLV8Q9HeQGCWMb9cKlRjefM6AvwiaxXCeeZEVsgHUaLKjWF/gOt2Qwv2KOqglR67mKviSjhvBfyyaEU/ZkZnL609JBx9+GVrpcQi5/5LAq148Q7uRJlL9QULOdipbvLVswmiTEE0cBtsorh3mf7jG7U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V0tBmZMYT6fYRAc2C134IXtZnvUHgD7w4BtGz2n0qeJ+4C8kuh0ItF8DocrZOZpTMnfl/08siGi0VgF/EQYBels8Id1nJmOhad/pCxpy7H4gM9y7f2//t2emFlyZzfHnP19oY/8jIveN2YLjvl1rt53TW5x0IluRCl0Igx1UVtUYUzRcs7YXtyzcRq0WrFDULxViZYRMHh5m82zO6+xjMmVohuTrR0a2pQwzs/3VFOBmjFgonzksGfw2JplPSUxn/An+2KLlfhObIkeRHgjZeAJE82GF2iEuPBc8dNU1YyBfJJLOORdURV81GDIB3uy2j/3tZv3u9ZFTcXY879r1vA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8C9feofNpEwYFJUP9ObzLTLpeWBAIotx7KL9gnSfsKs=;
 b=B9PZGa3/GUuGCznY9AVOa6kqKTxjHxUeiMaL4AuLwPgwFIGFCdez9VciPAIuxha/qVpDPTrB+HqNq+cWtGQBwnfBK0jjuX9nLzRgSdvawFNOSyViFRhLr1616u2iPT5r2b/lupZqIMKU4RDCw8svLKshbYdyX/gD7bQ/I4RpvofVC8nXm7dKWnxlF6u3AikCyxii67PwJ+yPw4H+6SLSDg9ADmwALNv/VRWmmd0Lw39jaHHgyzL0mBGToQbwy1JjFTbS5b+FOFPInu5v849uHDKIu6gLoQdgtNP9+xMDMO0L5pXcq4CCRpkto6GPss7ptW/BWFrZ4YD03oCqDpVjnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1138.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.16; Sat, 1 Aug
 2026 07:27:30 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0270.015; Sat, 1 Aug 2026 07:27:30 +0000
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
Subject: [PATCH v4 08/21] pinctrl: starfive: Add StarFive JHB100 sys1 controller driver
Date: Sat,  1 Aug 2026 00:26:58 -0700
Message-Id: <20260801072711.153217-9-changhuang.liang@starfivetech.com>
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
X-MS-Office365-Filtering-Correlation-Id: afbf747d-6210-4e14-1106-08deef9e58cf
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|376014|366016|23010399003|1800799024|6133799003|5023799004|56012099006|3023799007|18002099003|22082099003|10067099003|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	+rvy7cVJ3PTKGMfYjhVjOthfJg7czHGYAwwFqgyrM8uCHqkmv3X0l+yVS4qKMCg2sKCzJdc1YVVzYSKIDfxZFT25kV642dDVPUZnTO7JG4812RlpTzcnWTDNUN9MD60bpD6Z1wRe3OPr+kxWyMp+kYfUvMpW27uHvGuMs1r4grXPGp1fE6bnk2cB7uPQHuE5QiUNBWKqlj49ZTKzqGiv1nT8E2G3wu+HERo4PVRjsZoRVbGOC3WfZ/pQxfkGIJA8WHZSLf1X0B71qcreS3LGadhGyN+GOwaTDCQrs7/HwcaMy9LL7ACn8GhGppebkQtlGYzadh1zg7MZ1nfN3S3m7pY87bJWtgWuEkkRCe+wYrxllX1JLg9JVZ8d8bUuKMwwcfFAB2R1KxRx4rPZZx7frkSvWJCsQ9mrK4ab8jWoe/Apyv0uEOynYS7PzNY4nD0mroGsIu0ZJaCtvv7zJRikd5QZrLf222DKQZo9x0mwx5a+LoFoh68vWEV6z9cazN69SIWJ+yFxFyAMSkvcfywgymxd9c/D7i8A0pAmZ12u4K0hhxDeNkSwlbHcRVBltRoP9cftTWKEwaR+NyQceyW/Hw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(366016)(23010399003)(1800799024)(6133799003)(5023799004)(56012099006)(3023799007)(18002099003)(22082099003)(10067099003)(921020)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?yZMb7o29fQ+WtOP8R926bGMnm6ya5yo4dJMqXeh6YsskFW62IOzIonj8dKR2?=
 =?us-ascii?Q?3YexERRrOyjQS0LnB0AgTAbarww7YjB/63IRdTr7mKoNVR5yWvWXQn8XzFdb?=
 =?us-ascii?Q?lADQ9a1XZZzT/jALc7btsw2ZMUdj85glbl35/gJy/P5NOm6gwoXV7lfGLn5c?=
 =?us-ascii?Q?l1ZmBBmwvzX032ntpjj4IJFnsBPq0GkI5fS2zk1o1Oqb3naTW744GkCV4Bmo?=
 =?us-ascii?Q?eU6qYKbnKHJ77Ujp+7Cl40RhXEFpq2GpTRw7tG7QJXsWheeMnR9uYpWLaJX7?=
 =?us-ascii?Q?/1JZvoASlvGmgwSnrSaVoQQElPek+m382F7zGwnBVUsCuGU/6FW/Lh7QtP/4?=
 =?us-ascii?Q?c0Sdo6GiMqg+Huk3zWPSroLmbfUqFeiDeJyP/MqKcLIueCksPl+6YatxUE5U?=
 =?us-ascii?Q?zb672AxkFM9qYa883w8fsBQ9q9gSZjYXunTQ63ubksbwLadCcp2SUXNap17C?=
 =?us-ascii?Q?C/XH4BBKzhuQBvwNshwaFPTn/rRQyIuyiJ6mZayMLfF8EiVqSxjbEvoOZ+5u?=
 =?us-ascii?Q?S6v8YqmPqHd/FTWu8uSE+C+2elpczj+SLRIaFFz5pLm4miGY/KkJcwnqHG44?=
 =?us-ascii?Q?BsCFs65x5b/M2+iPFyayWleSpMFfuSa4lVoFf/RgDHeqscB7U6Zxod5MmneE?=
 =?us-ascii?Q?KlY5llVbzHNxCrSsNp4sq9CYba1KybX7Y0eIBkRzMtntzzQen61BeHGSN0ir?=
 =?us-ascii?Q?TdcxpkP5Oy/zvewUoKd2cGkO3Qs3AXFOqQSGeySLgZVbk0+KK5+eLy0r//gH?=
 =?us-ascii?Q?fxgOA5k3J1RxvwYM9GRcC4vy8aX5a/mwxR67SWkINgX37ArEX2owCg5AkvRs?=
 =?us-ascii?Q?uf63FLKCKRzVShyf18J3CGaCS9CgPctUQvhyCAGHB7PZBk1NipGhxBknOZmj?=
 =?us-ascii?Q?m+OhE6ZflPGFHQVAemGYR9sb9JLOmHP7TlRbPh69Dq6qHaWK0Bfsip0vz9U3?=
 =?us-ascii?Q?HJP6Dl13RmwNh+Fv4yJC3CbQZOwSULVBB6Y6mTpkPPVPYHpXVjm+A2pLnBu6?=
 =?us-ascii?Q?PabGYUo/pXavg0tJnZSUgNnPfGm0xgutVYPtTJQOVeFh4gBHBjMl9t+9rkIq?=
 =?us-ascii?Q?hmRKpmsAbuLsntLs4/0Z5zDGi5qHtxEa8EGh9hZsBKmabQS4flGwbfAvZICR?=
 =?us-ascii?Q?dEleOObYJPPy1fthw6k7BhNReyBotboReoYxdfVLIJKF/f0OUpz28JxNXf+h?=
 =?us-ascii?Q?VPE60V4nw43xEFUiF83VbSGgdW2yV9wzYKAIW+OmSYITLzJcOU3yVprL9w61?=
 =?us-ascii?Q?P4Iztwo4dpw9UDuIAKdHzF1KT1ul3gufwT/V4IH6Mp8IbFd2HkQ5+h/zCiE6?=
 =?us-ascii?Q?QEylRKvNcOpHnXY+LZKK0kL+iUAKE4VVGZolL+8bPddXxqz9GpHciSFqQUC1?=
 =?us-ascii?Q?f8JsnUS2a4ExVr2VGj+1voj4XpzNY7NLY1903EI4hLrkv4dhMi9yAXgaVzQK?=
 =?us-ascii?Q?kX096dUqwlwG0nmK1UsdKd2F4R22Fm2r3JTXUzJqpbLVNw8BpCy0c3YpvQMg?=
 =?us-ascii?Q?EVgDFpmnogULyUKEy6mx+Tjd/ri1JUXIf5hRqobbJwtBja5YDKmZUCzwP/FO?=
 =?us-ascii?Q?f32bH1zYSfnnWMEmimqNpBPKX4eAKxyQ6PBQ77s+S9HAyzUV+IiUiys353vq?=
 =?us-ascii?Q?1xv2uBwWvPrSKcZq1+6xInQ+kaY+LAquTnWZK5Wm7q6oRT6ZsL1ECUpJINlt?=
 =?us-ascii?Q?gonOJMvZWD4zi4g3RpSfA9/CMY1cEBHPRvslLNAzn/RqQQphRorqu1fRHgI4?=
 =?us-ascii?Q?wWgGvQr3u8OE/TdhoMOP0DbV8l2DSUZTUDpx3P0yKDZZ/mrgOmPW?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: afbf747d-6210-4e14-1106-08deef9e58cf
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2026 07:27:30.8059
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N+a7WZOQWfjaPxYF3nlhdioOVco/l+DGUiFkkOyY1foA+GcZPSvPd8qz+s2umKbs7dIKfg3bAbEgQq06dGNKNuNkJDkyrYKQwhNdFER0/6Ot1D5tXR+vhSKPR/xOft15
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1138

Add pinctrl driver for StarFive JHB100 SoC System-1(sys1) pinctrl
controller.

Co-developed-by: Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
Signed-off-by: Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
Signed-off-by: Alex Soo <yuklin.soo@starfivetech.com>
Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 drivers/pinctrl/starfive/Kconfig              | 11 +++
 drivers/pinctrl/starfive/Makefile             |  1 +
 .../starfive/pinctrl-starfive-jhb100-sys1.c   | 92 +++++++++++++++++++
 3 files changed, 104 insertions(+)
 create mode 100644 drivers/pinctrl/starfive/pinctrl-starfive-jhb100-sys1.c

diff --git a/drivers/pinctrl/starfive/Kconfig b/drivers/pinctrl/starfive/Kconfig
index d4babf78f8c5..1cf43e0ae1d7 100644
--- a/drivers/pinctrl/starfive/Kconfig
+++ b/drivers/pinctrl/starfive/Kconfig
@@ -78,3 +78,14 @@ config PINCTRL_STARFIVE_JHB100_SYS0H
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
index 000000000000..4d74afaec1e2
--- /dev/null
+++ b/drivers/pinctrl/starfive/pinctrl-starfive-jhb100-sys1.c
@@ -0,0 +1,92 @@
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
+#include <linux/mod_devicetable.h>
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

