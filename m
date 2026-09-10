Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2128.outbound.protection.partner.outlook.cn [139.219.17.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 975773BED24;
	Thu, 10 Sep 2026 10:04:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.128
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789034690; cv=fail; b=VlQf3zGDjuPpwyXdm4jDdUQxIy/CnLiKswSGc8WaIIHkLT0DeUkAmgWnXBD+vlrB5/9qhk6/Yqrf7WQz4ZVTKm4+tmIwbR5HlvTryRTznbJZlcoh4lDmd6WJaBhNmzS97V3w5MJlopCwZkHX+YgMg7H9twvZ/5m3fh5vFLa4s3A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789034690; c=relaxed/simple;
	bh=dmHNIMpEYowe1PhVA4S/bc3+nDclfb2/DSojk3t2Svk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=kzvVv94F5JefsG4ikAb76KsXy8MRALjKYJ5k4goaoWzOX/s6VD+onHizIse4cep0VPJt3qWgt8thbcVqkqP3/dSnF6Xdlv5V3MX2N3eZ6V9UzRwKvCPkx4+beMpmrvJ3RvQX4ICz7ukQufRUMUT4SH/9+X01N1RPKO0W/x4g+hw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dXb55XNOYZABBRQv91SiBHpnXWpR2DkgiIVHSDVdaXB4Q7wLczuV4S0vsmwllOFJKtkvly8uVTRPIlGvi8R9XHku3ixCNedYYS4ELCWesRZt4Gd0/ykFVlaiox6aBZMgVXuLkc0OHtD02iX77GGLZJzVuCiOmaVHny5usSZyE7Iy7D3VITlI1gswHcqifJA+QH6KljwbdVerrPqEwiY5/8nykPkq5R770Wc/5/zLjsCpd+mfP74WL7qHYBSk3/jzF4AK+BU1G6laQR5Uka7FounY5pOwmSbIbnOaderlBC74auHPot5v1mpURqHoSKpSzJnLgygLJ6UluhuhYCfIPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ieoL/E4j93TahPQbnY6pLcHY0egvHhgJOt6ROv1ZhT0=;
 b=Tj0KeaGUcK0BJ8qKHB34QZVzN5x5C+bEoUCUTVoOG6WAjN4mBBFvwjL5tqrf658xSBZabOPjRDDCH3CgqrZhRHd6XTu7tsnNwek0OKtJfNbgzRi6f1k6g3WRLQd3wQKWf6IYeSlt25UqMhcSLg4gNoI032fidCuGDTXY41c29hY25s2BWC17kwTmTbiTX0PAr2pLpcbmOz/bKvUhOhz75OiJY2Q5tsp/jhC/gFUFjn776gnjWi2XagwlDzXq5+FrRzj/HK3PgWZ8Gij5LJ06BrTDd11dpTUWNWxGRiu8txSMJMrw5UZaxAkAlzpDtAFqp4qCY8M+f3iR7pD0DLVo+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1233.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:13::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Thu, 10 Sep
 2026 10:04:19 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0339.017; Thu, 10 Sep 2026 10:04:19 +0000
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
Subject: [PATCH v8 06/22] pinctrl: starfive: Add StarFive JHB100 sys0h controller driver
Date: Thu, 10 Sep 2026 03:03:41 -0700
Message-Id: <20260910100357.130134-7-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260910100357.130134-1-changhuang.liang@starfivetech.com>
References: <20260910100357.130134-1-changhuang.liang@starfivetech.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZQ0PR01CA0035.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:2::21) To ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1233:EE_
X-MS-Office365-Filtering-Correlation-Id: 522fe3ae-038b-4fea-25fe-08df0f22df22
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|7416014|376014|23010399003|5023799004|6133799003|56012099006|3023799007|10067099003|22082099003|18002099003|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	9chx7aHfantxAdesDaBVOuzzYKlu/gXah/efxbzw9tG8NnQpcKMz9z1s4JJB3nuXIdqv/xr8pLJQ520/P0Hdr2v1HGMFvmOG0B7xC51XxdFg3OGqhSepWxg/H2yht4hBaYz758TyVOVspZuNLQalMZXJPUUM4V6bIBFOV1AaAU5GsBUJd01ATot9eB3R+KrtwjLT/Ym9ctb8pBuwg3zhbpvTU1ghveeyUVmmOtBWr5Fh3qU9Vwt0G7xfKolTiXlCdXcgTyad4ioYLI1oW65yU7bbnwDUqqkwHrvyzvAWIPaBbh5IU2jZZc1d7v8u3yG4bD8nOKXDPAa2Jj6gL42lVrkOj6FKa17DSGTFqoOnqwyGDYrgUhAXSjj7E6lKWf6/Y+lrAc54+kB6l0xmm5KMPMqfH+FDxv1INuzbmZZ1wzqjSfhnYeGdQMYwH5bPThdwU2KjfAwR0qUPJL0uALRQ9uMnKOwFP5mb4vYzXghF30vSSmBtdM8bLWddx7lsfGdaRs66Gvzkin3PF/ZFC6n49oc5SkAeutcth1Wr1tLsj0N0xrBQ1FUx+ZLa/4Q+/cFal/C28uYNm0bc48Rn9ivOaw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(7416014)(376014)(23010399003)(5023799004)(6133799003)(56012099006)(3023799007)(10067099003)(22082099003)(18002099003)(38350700014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?pDTTfOQtcFBim5trJUjUjWIww22mhnWABp81qkKcTNrdzTjrnTAg4zDkR1yj?=
 =?us-ascii?Q?gxHh8XnDXMszqGeLGY4dbL8tk111pyV68irwzxP+IJRhRURpnHcwDS0pc/nE?=
 =?us-ascii?Q?ZUxxuhL4DF8AZ7mBdiggYKhJi2orMbk9BF91H5k/le3eF3fPkeoxSk+VWHI8?=
 =?us-ascii?Q?5MC7VWmtE6sND9sKWlQSWC62B9JaVbTHK2GNa83CAB1fbsBZyy6yBOzzz/up?=
 =?us-ascii?Q?pyVBUcrk6GxZemUEo77CXzrCVjTzU9IEToarOkFcsQkBKSrqjZktCaxkpWz6?=
 =?us-ascii?Q?arUGU7B96HOmoVGcSVWtdoIjJhnHvImnYPga9r3iej7XKoogzMAz2jkyseid?=
 =?us-ascii?Q?4zd5JGSUZ/7qVgRmXBc3gNNvSQUxYylmxx/s/T04LaJxRcLa6XDkhDeJbgJi?=
 =?us-ascii?Q?3eXhEVJ9NSd/Tjm+zqinoQT6Srqppe4csh4c7Ea2BZij1u2UinA0dcuX0iCN?=
 =?us-ascii?Q?OrsS8OUBPiFHubOOi+NDotrP2KQfK2m3RD+U6HiatKjgxzUSCxWXVSML6i2A?=
 =?us-ascii?Q?w6fel+qDX0miHHZbm6CjphpOAZJJRhFSrm5sYSJh6l7b7tDpyuTXV1Itl6iM?=
 =?us-ascii?Q?5Zwap/x23gM80C63elFvTpBSeEh8KslD9EFNpiJt+hHMc7wqK9aGE/VophIz?=
 =?us-ascii?Q?0jt7FbXV3Uk1UUJpOGHlYEkNvbtBA9IuVlymXZNBanLKIDIBOUJvwvLQQJCa?=
 =?us-ascii?Q?TCbujLz8b/WTkLOaTnvzJcP45Znw6ijiBbYNyud5rsPis3eV0iZhJWgwF1Ow?=
 =?us-ascii?Q?MVbRzEeBh3mYvjbbMsjN+YfyaIj0CezhpMPQsyZUDGH3KPMqZkZ0SpbUvm+L?=
 =?us-ascii?Q?NqygAQ7yPK7P3T9bahX5bMeHH8WQWwYpijf1M4Op44ssWJiCk1qN/4ypPVLt?=
 =?us-ascii?Q?TcyV45ytIOLeduAtbXrk6Sh8iLqompJApqUNeSroZk2hz624iMllr9x7gKnj?=
 =?us-ascii?Q?UvY+qO1UH83773BLPwwpO0EZpHsYUiO60LrS5Ra9AU3NgMmrhyWsNp+NH1XI?=
 =?us-ascii?Q?owct3VbYLbvQxWoamxnpRA3poqpW9qOIdHLzwBhCKQBVAhpMimxpFOIO3+vi?=
 =?us-ascii?Q?A7+rEKWVWJK0+0lOsX9HbaBxex90MBrDC0+tVtaDSG0iW3ilRZwzKGm52Hqh?=
 =?us-ascii?Q?YxQrUDtJEnI2KJBmngB7YSiRdcKD8WVd/JPILqxRZ9WXl6zDVzxZCZujr7lh?=
 =?us-ascii?Q?RGLpoNnV1TnpxCCKHvHdzxKXPD7GjZBX8euRraEtPvh/7YSTTnEgM5UP+Rr5?=
 =?us-ascii?Q?PwrbhDdEjbylYZ2yQN0WXcn4ZYdlmkG8qTeuHoFSPjVbo9R0AawiygXtFFki?=
 =?us-ascii?Q?Ni16pIJFYtH9+Hz2yodfTgJLOLKdxX/+Vf0SdKwbDhnNbEBv8hVGfirkTtRz?=
 =?us-ascii?Q?535j6WZLkgK/TM6Q2zPtIxwNqUmm7rCTK/jj/GSuNLO3+xYa4oLp3kgqCTyc?=
 =?us-ascii?Q?65gAiftafu9mw+K4SjM72iw6EBOFPz7evtM9XaqZHjzNZcMxhMD71TFmbasn?=
 =?us-ascii?Q?XLLdYbjjrNNEyiCS0NwP85/CGCU9RySCL0wlAQNd7P3Yv2PQIPuyeTN4Nfjg?=
 =?us-ascii?Q?mQ6dhbF8mXvL0FteVUSUP38QbYVKePs2kuSZK9HkZW0h/eXDB6V84ELvhabw?=
 =?us-ascii?Q?Sg/XEaamzSJJXO6Uyt0tFaEegpaGrLoGKPcrSmTsc9rIyVv9GAGinCLksvOI?=
 =?us-ascii?Q?RAeznuDV0+wmHygdjzEeN6JzDhHjBJt11P2yfrHNqkl9h5NHWDCcj3AyBDSt?=
 =?us-ascii?Q?Fj9e95cwKx4+ABOYJImaqH6IojZ/02WGRzYMVZCYm9ZlIV86a7L5?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 522fe3ae-038b-4fea-25fe-08df0f22df22
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 10:04:15.7766
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9LTKNH3BZFkgQg3dZQh+ZW+qIDPZ6oYXvnExyFKvJmVeYHcR8wcW2XCA4cpduu1nQOOUxyJ510hPbPSVS6nwELQIOPg1sgiiuRFpAgQP1zc77FjHSqFFb4mdJtZs15RO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1233

Add pinctrl driver for StarFive JHB100 SoC System-0 Host(sys0h) pinctrl
controller.

Co-developed-by: Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
Signed-off-by: Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
Signed-off-by: Alex Soo <yuklin.soo@starfivetech.com>
Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 drivers/pinctrl/starfive/Kconfig              | 11 +++
 drivers/pinctrl/starfive/Makefile             |  1 +
 .../starfive/pinctrl-starfive-jhb100-sys0h.c  | 99 +++++++++++++++++++
 3 files changed, 111 insertions(+)
 create mode 100644 drivers/pinctrl/starfive/pinctrl-starfive-jhb100-sys0h.c

diff --git a/drivers/pinctrl/starfive/Kconfig b/drivers/pinctrl/starfive/Kconfig
index b3cb513c23de..992238f5b49d 100644
--- a/drivers/pinctrl/starfive/Kconfig
+++ b/drivers/pinctrl/starfive/Kconfig
@@ -66,3 +66,14 @@ config PINCTRL_STARFIVE_JHB100_SYS0
 	  This also provides an interface to the GPIO pins not used by other
 	  peripherals supporting inputs, outputs, configuring pull-up/pull-down
 	  and interrupts on input changes.
+
+config PINCTRL_STARFIVE_JHB100_SYS0H
+	tristate "StarFive JHB100 SoC System-0 Host pinctrl and GPIO driver"
+	depends on ARCH_STARFIVE || COMPILE_TEST
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
index 000000000000..fb486ac60072
--- /dev/null
+++ b/drivers/pinctrl/starfive/pinctrl-starfive-jhb100-sys0h.c
@@ -0,0 +1,99 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Pinctrl / GPIO driver for StarFive JHB100 SoC System-0 host domain
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
+/* sys0h pad numbers */
+#define PADNUM_SYS0H_GPIO_A10				6
+#define PADNUM_SYS0H_GPIO_A11				7
+#define PADNUM_SYS0H_GPIO_A15				11
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
+static const struct jhb100_pinctrl_domain_info jhb100_sys0h_pinctrl_info = {
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

