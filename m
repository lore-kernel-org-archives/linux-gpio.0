Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2119.outbound.protection.partner.outlook.cn [139.219.17.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBBA13E44F3;
	Mon, 31 Aug 2026 11:35:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.119
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788176151; cv=fail; b=pMq97V9oFTKwxd/9u2DrEowsMfacdFHL6sKGVfxCo7RF1rlgHhvS6t3d+vM6dqvbU9iW5dcc+Ic+3VlRsQK27oMG6try/n/lm6EVFtRw+R16eDjK6+ZD+fVfgVzVcLx3ZBPwtJPypyo8UyOfWOlDrID9zSxzlpEph6IgB7bxggU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788176151; c=relaxed/simple;
	bh=L8oobSnJaGTPi7oC5ckI/RPhqvIxJemSjrAtothf9m4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Y1TZGTc6IlPFQg65ZyJCTUz/6ZUM7Blu8hYlcISaFt1oeZAyfLnQTWd5ierg5jHGSu80sI5Qn/U4VN0KKeFMYLSfE20G2fcDuLb0keUlRSzxON707IVmy4oifGFmaHE1SDtrRyzdGw53nfbDLQ0HsApNrHsuSC9PPrMH0WvKXPg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hYVXD8yomTklkxgD8+lUp2HtUJBPQf9AzYImJx8ubzCYemF5RipB3FKed461SE7xeR9F/NX5ZVF/TazVCYy7vC0XN6/9yvhrw7KivSvHGBroKFyJcKPRuAcWMq4RxCzeMcAB9kI9siuTOvppG3wxs/Agb0ONNopFewLBgGM+1RF/F14agzH3eCFKjR9CJBiZtWrA6q7+z2AMVM1kTnmnALsd5nSJOWN0TEcXWSL0mqPDidOIG1PtX6liuHHo0HwvVQwowYYO+rQQ5DYcmkKydQcLS0WZv/iz3aF3xQpbHeWE+qr1hqWzC+pTEgEXY3TdwotWTlMjyGMtCto10OdfFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uOfXu7dHy29M+qyoHtEGiiwCdFuV3g2Dlg75xRqdUUk=;
 b=V6Q8spyJDsAAcajFYwRnZL+z719wXUED8DSTbBaUudDqgHszTFulJP3j5onW1/goVW4MO3QMEQkoGODLX5+HiaYje2tUzsBoa9BXIzH0PsH6m9TP1VszIkJ23uLkEvzS3LYOjLFeeF9irjBj3M60bmykIS5us6GvXFN4Z62tlLSG0pPv8gOGevxBu2ZEBFH6+7TKUHrpVzpHPq6lX26NibjZQk2meVJj5uYk+0bfHnaVFv9TH8/SizGlJ1TJ3l6RZW13uLGRzZHq/fO000A0gPp+04F6ijNKX745sjfJAs5WTxYZ/4vd467ibzT8iJwU5eUOWnRLiV0zygdStIWV6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1332.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:16::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Mon, 31 Aug
 2026 11:35:31 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0315.011; Mon, 31 Aug 2026 11:35:31 +0000
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
Subject: [PATCH v7 06/21] pinctrl: starfive: Add StarFive JHB100 sys0h controller driver
Date: Mon, 31 Aug 2026 04:34:59 -0700
Message-Id: <20260831113514.66382-7-changhuang.liang@starfivetech.com>
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
X-MS-Office365-Filtering-Correlation-Id: 745aedbd-e567-43f2-9937-08df0753f6f8
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|52116014|366016|1800799024|376014|7416014|18002099003|38350700014|22082099003|56012099006|5023799004|3023799007|921020|10067099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	ndQf9zseI0A5Whv1tPnUI5hmOz5Coy0hWqKD+lOx1Ce0M0tj0z/TXOVnISj7f5x6nLkO/esmSCO7vSF+doH1Tt1lE/i/NbiNmAuoaBLuCcVcGAIoDYCXby14cW/JwbsCRewzL9y3PGztcYc4OD+VBzY/5Bsshhn1fbJgC7ndij7uxt4Y26gnHMEwFlxyUseghnBGnU7PLskBagLCiUMZr65uIosCbnDyzpCoWYDMW901m44MdQQtCgjPn9G0E0Ch5wfNhVHIKAUmwiAdEEhn0dk36DtYWR/h+/XZ9TBa24nnY98pk6PCRssnb89h+UISp4hY8EGjjvBEETHhMzaLCy6JnT4oKDBgFWoKQ4LpzZXUen/08hWtTB1mOUCH+A5eo8zGaZqwlEIP2XcEAzxNDgldpSTYyltO1X/uFnPXtGuUXln7atDB3d+TaPtsVV9q2anncmP7NBsDhR2ftl7F9IvtinlGwQLkfQq9HbiWxckY4DpdKLE0oa3Lzsb1Rz1LyciWU2SoKzuyl4J3b3JFluJgCpd28fnKllwMMhJoalEO3T3NnjciRqQgQM7hdx5E32JWeCWXCChl93digsp3OQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(52116014)(366016)(1800799024)(376014)(7416014)(18002099003)(38350700014)(22082099003)(56012099006)(5023799004)(3023799007)(921020)(10067099003)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?rkcQRRW1HSEdZSmaBOuD3mxd8Y8BzU6C4pEUIqkb/3FGha5zr0q4jTmCoEFb?=
 =?us-ascii?Q?JnxNRG7RDxic3z9aJOQravUpZP/0VFXDsxeDHbV4PV9+WPV4ITgfFrN7PlvP?=
 =?us-ascii?Q?z1z0XKXLofUG2PdqswPBbR1hK8w6eYZk3IwZ3EUYEKRCnEKGHWIKHsnAck8h?=
 =?us-ascii?Q?QTzkuXUSStWU+g61YkAXWPOoICSBLJvcl78MYcJfNQWoWzAd7+XNTNefF9Rt?=
 =?us-ascii?Q?7KE7HS9o99nIpJxOAbPrdINbhPL2VNRzcswE01v3/t80X+3PZGjNRtKT0Dfr?=
 =?us-ascii?Q?7pNoWAed6RqfEv8EVzClDmu7JfaAbfIeAFLVED1M0zGKA9gz21ztB++okTUJ?=
 =?us-ascii?Q?cW+gAKeJV6Cqtq4Yf4gzoC/bt8FhTT1aGeQ1eXQi2hNZM0WFKGRzQxtYdW0w?=
 =?us-ascii?Q?I5xZZUI4X0pNoo4LOhpGFtAXw/BDcoaZC72Oq0djcTKQ4aejaJSXxKxSmG5k?=
 =?us-ascii?Q?mWLujjFI+vY9tXBUHP7YnGYC/2+v7gOY1Qnk1QELZ57vlDSQMsP/YMgD52FG?=
 =?us-ascii?Q?PKypCw3uLtOtjWqV2g2xXUpZ26QRIRjaMpgUFGIrKeZDRLngBLS01gEx9PHg?=
 =?us-ascii?Q?4v8LvOy4iRPHvO2oUmU2k8T9iPK5/+LwYnIs/0XpdX9XPTXnfx2NkdzIjGz9?=
 =?us-ascii?Q?ysZHBJ14LywnEqlYMFIPFSu1lb3Y/4bSc4OnINiLVBAMTUKXyIjsFisw0nJC?=
 =?us-ascii?Q?EEdC69HB4K7oc9x5EPeUVXYSUcLOZi9ui9mbq6a92GFLezS8wKJonceUn8NT?=
 =?us-ascii?Q?aQi5Bv3cr6cbkRoIZSjahm60+IZSXE5gMg/zQSW2wzocN4rPJz4i57KDdAvR?=
 =?us-ascii?Q?Ok5qrAhGouauxOvnH5olkW3yhKlpzzWl423clyD2+8qdsVJqlVue+0kZLAhN?=
 =?us-ascii?Q?5oZ9UtTIEVvtD33tRJ3bL2UdJPEMeduEkJDWW7bMzKBm8Sf7khB7CrDdtaqm?=
 =?us-ascii?Q?baCAxyUrIGE3+b9zxW6d1KH4jlhbm+rrPzgnbHOTQr77W+uMMQSlaBEbwkkp?=
 =?us-ascii?Q?BFwmmRQDYEhs6gEgsVx6/SVl2vU8bX/6IMgS8i5wGnlChYV6pi29/LYUQka+?=
 =?us-ascii?Q?LpF08s2paC2U5JtXNTvYbCPWcAXCa2teGx8B8beMmGAGR71hueKGXJTbUw98?=
 =?us-ascii?Q?79XOaxZycRqub2d6sV4ASumOLIRy0Fdg0fIRAyOZFpQjFrgGdiCB0ZqMr4HR?=
 =?us-ascii?Q?Rh/pJFfdt5pqYKMRxhPjm+KqKDYg6vrOs+/J6xvpjIpv7A/5+cv1WvmJaTy3?=
 =?us-ascii?Q?oEfa7mRqfj5cNtORCNj3S4x/KbIEhnrINvzaKaXrZzPt8eL0XqLr51Ntl3zy?=
 =?us-ascii?Q?4G0YfneEw/rtrFY8Shu/q9hFjWmTOYUXc3tZxzUcV3HXNuipaCFDlOiOIONt?=
 =?us-ascii?Q?b7oZBETpB0ZyiGGKM2MDKO058cakRd2qEy/c2PhB/iMAxJU1HAYINsv7PLgu?=
 =?us-ascii?Q?jjXfGkqZX6zU7CWEAe4KSxSH6sUJjT7/Xf3HmPlridTUajmzblfs8axzJkQ7?=
 =?us-ascii?Q?iy8n7TW9y149il9ixw0c+3SZMce1t2DpmpA+ZvJ0cONq4GBBwjEdIQ2lMKSG?=
 =?us-ascii?Q?8SJMrQdxL8HxQCiMEZ9vfTxCeVyjz3RhVQwRaNsrtlfax032x2AfpL5wCx55?=
 =?us-ascii?Q?tcSoAhGfIs9337i8YAQEnREx100GgHjIBqXtZqQVJUYTKyUxi9Dm/k+BE+E8?=
 =?us-ascii?Q?9Xm5BP4qo/9qjbIprDNAMrLR9YCwKMDgtzC+U7x5NWDJSTiplH2lfSpxJX5M?=
 =?us-ascii?Q?VkZ3/mIbw0dlrLBTo17YNPkAxX4j64I/EAKJWNa+pBB0OxBEaKcM?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 745aedbd-e567-43f2-9937-08df0753f6f8
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 11:35:31.8631
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Oyzk04mhFH2n24ieA1+ESWr9BFPpRtQmc1cq0tfUvwIgtoArRLIN0IzR50KUqa50glEb7PrE2uW7gnpeoBA4ufyv4tHIBcVDM2OOMu7f7mPrgj3zjtFFSAsJ3QRl05W/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1332

Add pinctrl driver for StarFive JHB100 SoC System-0 Host(sys0h) pinctrl
controller.

Co-developed-by: Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
Signed-off-by: Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
Signed-off-by: Alex Soo <yuklin.soo@starfivetech.com>
Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 drivers/pinctrl/starfive/Kconfig              | 11 +++
 drivers/pinctrl/starfive/Makefile             |  1 +
 .../starfive/pinctrl-starfive-jhb100-sys0h.c  | 95 +++++++++++++++++++
 3 files changed, 107 insertions(+)
 create mode 100644 drivers/pinctrl/starfive/pinctrl-starfive-jhb100-sys0h.c

diff --git a/drivers/pinctrl/starfive/Kconfig b/drivers/pinctrl/starfive/Kconfig
index b3cb513c23de..f927283646d9 100644
--- a/drivers/pinctrl/starfive/Kconfig
+++ b/drivers/pinctrl/starfive/Kconfig
@@ -66,3 +66,14 @@ config PINCTRL_STARFIVE_JHB100_SYS0
 	  This also provides an interface to the GPIO pins not used by other
 	  peripherals supporting inputs, outputs, configuring pull-up/pull-down
 	  and interrupts on input changes.
+
+config PINCTRL_STARFIVE_JHB100_SYS0H
+	tristate "StarFive JHB100 SoC System-0 Host pinctrl and GPIO driver"
+	depends on ARCH_STARFIVE  || COMPILE_TEST
+	select PINCTRL_STARFIVE_JHB100
+	default ARCH_STARFIVE
+	help
+	  Say yes here to support System-0 Host pin control on the StarFive JHB100 SoC.
+	  This also provides an interface to the GPIO pins not used by other
+	  peripherals supporting inputs, outputs, configuring pull-up/pull-down
+	  and interrupts on input changes.
diff --git a/drivers/pinctrl/starfive/Makefile b/drivers/pinctrl/starfive/Makefile
index c0d368f413bc..b26156a6d0eb 100644
--- a/drivers/pinctrl/starfive/Makefile
+++ b/drivers/pinctrl/starfive/Makefile
@@ -8,3 +8,4 @@ obj-$(CONFIG_PINCTRL_STARFIVE_JH7110_AON)	+= pinctrl-starfive-jh7110-aon.o
 
 obj-$(CONFIG_PINCTRL_STARFIVE_JHB100)		+= pinctrl-starfive-jhb100.o
 obj-$(CONFIG_PINCTRL_STARFIVE_JHB100_SYS0)	+= pinctrl-starfive-jhb100-sys0.o
+obj-$(CONFIG_PINCTRL_STARFIVE_JHB100_SYS0H)	+= pinctrl-starfive-jhb100-sys0h.o
diff --git a/drivers/pinctrl/starfive/pinctrl-starfive-jhb100-sys0h.c b/drivers/pinctrl/starfive/pinctrl-starfive-jhb100-sys0h.c
new file mode 100644
index 000000000000..64305f9c1c3c
--- /dev/null
+++ b/drivers/pinctrl/starfive/pinctrl-starfive-jhb100-sys0h.c
@@ -0,0 +1,95 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Pinctrl / GPIO driver for StarFive JHB100 SoC System-0 host domain
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
+static const struct jhb100_pin_layout_desc jhb100_sys0h_pl_desc[] = {
+	{ .pin_start = 0, .pin_cnt = 7, .name = "gpio", .gpio_func_sel = 0 },
+	{ .pin_start = 7, .pin_cnt = 1, .name = "espi0_reset", .gpio_func_sel = 1 },
+	{ .pin_start = 8, .pin_cnt = 4, .name = "gpio", .gpio_func_sel = 0 },
+	{ 0xff },
+};
+
+static const struct config_reg_layout_desc jhb100_sys0h_pinctrl_rl_desc[] = {
+	{
+		.pin_start					= 0,
+		.pin_cnt					= 12,
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
+static const struct starfive_pinctrl_regs jhb100_sys0h_pinctrl_regs = {
+	.func_sel		= { .reg = 0x40, .width_per_pin = 2 },
+	.config			= 0x04,
+	.output			= 0x34,
+	.output_en		= 0x38,
+	.gpio_status		= 0x3c,
+	.irq_en			= 0x44,
+	.irq_status		= 0x48,
+	.irq_clr		= 0x4c,
+	.irq_trigger		= 0x50,
+	.irq_level		= 0x54,
+	.irq_both_edge		= 0x58,
+	.irq_edge		= 0x5c,
+};
+
+static const struct jhb100_pinctrl_func_maps jhb100_func_maps_sys0h[] = {
+	{ .func = "espi",		.val = 1 },
+	{ .func = "espi_reset",		.val = 0 },
+	{ .func = "espi0_vw",		.val = 1 },
+	{ .func = "espi1_vw",		.val = 2 },
+	{ .func = "gpio",		.val = 0,
+	  .max_pin = JHB100_FUNC_MAPS_MAX_PIN(PADNUM_SYS0H_GPIO_A10) },
+	{ .func = "gpio",		.val = 1,
+	  .max_pin = JHB100_FUNC_MAPS_MAX_PIN(PADNUM_SYS0H_GPIO_A11) },
+	{ .func = "gpio",		.val = 0,
+	  .max_pin = JHB100_FUNC_MAPS_MAX_PIN(PADNUM_SYS0H_GPIO_A15) },
+	{ .func = "scap_trigger",	.val = 3 },
+};
+
+static struct jhb100_pinctrl_domain_info jhb100_sys0h_pinctrl_info = {
+	.name			= "jhb100-sys0h",
+	.pl_desc		= jhb100_sys0h_pl_desc,
+	.crl_desc		= jhb100_sys0h_pinctrl_rl_desc,
+	.regs			= &jhb100_sys0h_pinctrl_regs,
+	.fmaps			= jhb100_func_maps_sys0h,
+	.num_maps		= ARRAY_SIZE(jhb100_func_maps_sys0h),
+};
+
+static const struct of_device_id jhb100_sys0h_pinctrl_of_match[] = {
+	{
+		.compatible = "starfive,jhb100-sys0h-pinctrl",
+		.data = &jhb100_sys0h_pinctrl_info,
+	},
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, jhb100_sys0h_pinctrl_of_match);
+
+static struct platform_driver jhb100_sys0h_pinctrl_driver = {
+	.probe = jhb100_pinctrl_probe,
+	.driver = {
+		.name = "starfive-jhb100-sys0h-pinctrl",
+		.of_match_table = jhb100_sys0h_pinctrl_of_match,
+	},
+};
+module_platform_driver(jhb100_sys0h_pinctrl_driver);
+
+MODULE_DESCRIPTION("Pinctrl driver for StarFive JHB100 SoC System-0 host domain");
+MODULE_AUTHOR("Alex Soo <yuklin.soo@starfivetech.com>");
+MODULE_LICENSE("GPL");
-- 
2.25.1

