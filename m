Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2094.outbound.protection.partner.outlook.cn [139.219.146.94])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E69253939D7;
	Mon, 10 Aug 2026 06:37:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.94
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786343852; cv=fail; b=W5/GXIz/4wHh4/AhV0BSx0HwqbuLvoF7npm3jSocRp27HfmwwZ4VxwVRctZ2lkqltvdaYm/podITMbV5GuFm938Z71hwtOrs5JL6AQ6uQ42C03N5SIjUMIEMmbMGyHoOMDy9ncIjEOt4dVH63K+F8byUj+jagvBhGyUYG6d5RXA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786343852; c=relaxed/simple;
	bh=tHellBI331VnyJwjzegeNK4tX+2H1PnPvH/R0+obfYI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ixFrUX6n0te4k6pcPwYxinM5yLEDMWa6X7lFr6d9HsAcYDzS5H782tIJkAbiZY42xWD8PW19PsOJYFSXI9JAuGWWIZhBaWf/J1h1b0t1PqS+fxtsZWAT/H5UWSNs8zSoYbVaUf0E3DM3/wA7SFe6ICrGppYA6J1H4AgMKyV1xoA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.94
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LBS2OU9q7ZzGdrtM5FbVKtj9rEq0O8MrUZc/VgtPiw6CPwePZ/EstVrsAZtUJ5yPajLQ7t4nxrkOEkR6qA1UH8soNchamIWs8rh99HVmhMCNJYr+i4V0LbcOG/F9AFoglAh6WXwTicpsheCBY+pxspdap75hrTMcrxUudHBcwSBGZaTHU93ro/SsWgESUvnftmSSSWap26MnOdi+JSdCrXl1GuCLhetS5MXZuA7m92P2QqeQysOT/J1IwzPCAyPS8dBwx0L3TEIEDllZeb6BAAWsuY/WkyZ1fG84WTwbSv4Om5BB9RVAsdCWw26Zv6cARxbXD47GgP0hL9tE47E24Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qEOB6xg25nwkDC0MNE703GEiuNYC2sHBbX+/8Th2jLo=;
 b=Hwe+O2oSW5UwJ39QtTLcnysklXLOWPPyDzh1nQ24ptjemF13vMRbmME+jMkQjFeyWJ6pJ+vVd1y2xPGgGuUGfKUszbiOznlI5BzYbtLHltj3obiozCeI5wsbxbEDF3K7EhtUPpGvpUd//0jpa5l0D2g6yLAea3CxMrR/r7mj2qXjUbfU0ZCVz/Er2tFg5sx4jOSgycvc5mLWeJum/XKNv3Dz7GHDPaci7wxKFGt5X4/kkuCapOAI6HrN/gcf0J5wjHoJReOnTLTf5NdOCE18mHN4sHdP/NF4lUTNFqGuf+T1WXkhKEXZj4UM2bw31HC5wXdgdosDhK13khqAylkiEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1315.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:15::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Mon, 10 Aug
 2026 06:37:12 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0292.024; Mon, 10 Aug 2026 06:37:12 +0000
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
Subject: [PATCH v5 10/21] pinctrl: starfive: Add StarFive JHB100 sys2 controller driver
Date: Sun,  9 Aug 2026 23:36:39 -0700
Message-Id: <20260810063650.239303-11-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260810063650.239303-1-changhuang.liang@starfivetech.com>
References: <20260810063650.239303-1-changhuang.liang@starfivetech.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BJSPR01CA0019.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:c::31) To ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1315:EE_
X-MS-Office365-Filtering-Correlation-Id: ef6849e9-d73a-4353-93ab-08def6a9cf2a
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|52116014|366016|7416014|56012099006|5023799004|10067099003|6133799003|3023799007|18002099003|22082099003|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	e00RD3+GYhaXLSDxYVsBpmBQEbW4rL4YXEBKvPEkaccECZq9P56x2baq2ndAd6oRaOOZ5H0mrQQ0m1RYNMr+S6S3SO0+JE4XmYppiIrzQGt7OkoNJuZXtElPGIWWzy+qSIplY0s+gUOwoILlH3cLVPSaka/ynomCi8QlO+VPxBlvktr4AtEXeVbth+BH4iSxAh6bTyGmo0kI7ikpJwAbGWfTCj8L8qoWO2+1ntrvkgSAEShposMocDHLkd7ffcCvQesX63o79Nkss5jSNytZpvJi8nYcaxBlp09xsgiNGg4EFYzeW6WNIsk864dDIx/gpWOCLm8uWpRSYkOQFm79UCwZ3lOGr1EIAYaceczHtWwEBDi5/jp9TQfJhtelbN9F6B+0dsDjb5dUANN5YXvaNEzZF421bptkhg/Q4jxbvZHF9XFaFtGZVABDHMipROOUdFQykeuT9wcv6SUh+Sasn6y9DBvIPDr/h07ziYuytWtQIHSMKrVqU6ILE/1IR31KCuYYkBr5G6fBNXOn1zcUUjKe6vIhzgl9WvHnYQBWHOR6hwVgBISdl+G31TihojwyjccThHO5m3Xp2b0C9EmOmg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(52116014)(366016)(7416014)(56012099006)(5023799004)(10067099003)(6133799003)(3023799007)(18002099003)(22082099003)(38350700014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?k9Jieh2zLE6+ICZEXZuz5t/qdbYoZOvSsWwmBeTZ3Rm0tXwpt/aPCwFiTuv8?=
 =?us-ascii?Q?csC21ZvYfe6sStE+baVQeIqjJaGj1IfmFDFOT1CJ+REiKW8mEeljsFAJjSkM?=
 =?us-ascii?Q?ZubkTJPi5TVIDLojc4P0nO9kJHKyMRmsrLtK4JKgAMIDZ/rST8KUyqK2xpIH?=
 =?us-ascii?Q?zlLgr40INQQc65Dyszadsh8kyrPWoZT0hKP3jJZNPVgtLvBO8II6OdPKT70R?=
 =?us-ascii?Q?nrZ4S9g7d1QwYmJ/OOB/Tp3VnXQC6rXaXRzcot1toA4vK+7bkzmCAch++8pl?=
 =?us-ascii?Q?VMzx4OfANA2tCzKg10VezbrsZxc4ZRpy4CFBjEoxXkRwxCtjG8ig1W/jMa4p?=
 =?us-ascii?Q?COKPAl1WzrICj/Ks+wheT7hQnzhRtqawTb6xNf9MfD3BFb+P0e2YpEZpdxFm?=
 =?us-ascii?Q?0/VPjL6Cur1zMQhjuQ8Uja1dAYzvFNK8pkgcxqiCT5up9CSlIyfX/WAd2ESj?=
 =?us-ascii?Q?jphembDBDuZAnKhT2Hp1KRkhOcqvue1ucx/v65uOqX1wLqN4mcCRk2+ElGnK?=
 =?us-ascii?Q?XRKNF6kg2+8VTKNZaQ27Bzzjh6doxoA26kipMRyQ1LvdZwHW68HUV/LF+58w?=
 =?us-ascii?Q?PBXK8GqMFtK1qZFsBq8x/CO4oTRRVGdX6lI0ZDMK3beL67P7n9B2bjAWlBfQ?=
 =?us-ascii?Q?4fv2v+95YP82BuHoTwHceBjcYzziJM8YOLrxf5zXK/5uXt5WCSBX6p46ZUCf?=
 =?us-ascii?Q?i2xjyzz9i2Na+70xVPpyfL2Oa+tX9g3xvtS3Ck9mKOfqc1YpLTD4u+LbUDDZ?=
 =?us-ascii?Q?tdadyOcy1Fhswvaf7iR0IYegR5exKx+Ya8dqjp4DqzdOW1sD8O5sxHTMIb5u?=
 =?us-ascii?Q?KcgcWBCp+fKAn6n9Q7Xh416ZV+E8Cpq2TpCESsqTB4DPggkOy06cmj+5Q2DX?=
 =?us-ascii?Q?2C9UnZJBvBqvcAQnqZ6zrcIIX8+baGC+wLIFRWGDMziw4tVthjXvAa/WfNfB?=
 =?us-ascii?Q?ghMnYjBSv0hQIQa8YmjMPLU7pI4TF6S898447+OYLo81a9H+bv+7ouLjix3R?=
 =?us-ascii?Q?VnggXWeB2FhIiIGCy/wWTuQ7TxZCVaamhBUoYvguLdcVgVM0rbNK73SQWYh0?=
 =?us-ascii?Q?wOobKpG71WpnjjXhr7FWS/um2KWUsTi37q0ypsg+EBp8IdMqCY9YKJsoIOuA?=
 =?us-ascii?Q?08QTvSn4+O2P85N9FpQizlaLb5GIYcUYumYYHTOkZ6jt/5BcwK2d02aXhWrr?=
 =?us-ascii?Q?8S5EKrs+9Bw5J9lMhclBaLIylrk/j/9otQEr4SIA1GGYCbAyX2Js00ne4H/Z?=
 =?us-ascii?Q?/5+TBSD4hLRhUwJZ6kZ7lc8c27Y940hy2f2Jrn4hGxS0sRsPszNzYmiHA4PY?=
 =?us-ascii?Q?yf5DiQbxKMii0WzAtHwrN6cR8mcxPraQnemTLg1B60AhrIYB1hECz4Q5kRWG?=
 =?us-ascii?Q?mnfaTfMFlAq3q7/C7XHx0X1SGn0hO/yYKn8rDDtgMbRpDMV9MaPtmcA/CLD9?=
 =?us-ascii?Q?4fUR+15Owwbz9XLMkhlbrajHR8sLgZH/4TfJmVuilNtw/ETxaFIPRwuFbHJk?=
 =?us-ascii?Q?YdmAG52sgPIE0mh5JoLrG3+7lMYSjlFV5LsfAhgYhy75QhlpcrwdMLPMeBKG?=
 =?us-ascii?Q?qf8FHuA/rzvtmv1uskw+32jlFxYechhpmj9mnwVsJj+nakx0Brx64H2IhWH4?=
 =?us-ascii?Q?F386W9HUUOWBz9i0mOpIn+kSv9csS8PJFRIGyO1GV3tsGECBRvi6lAUqXbPr?=
 =?us-ascii?Q?dlz8ZRezOdvFJ27Wz299SCwrHvi49qTxHMl4vNk9n8P4fi9CSw7ZXAOjtDIr?=
 =?us-ascii?Q?fsufIoXaKLuLk4jKv8kOlc6KS4sDaFQc6UeBL98at0HQ7q3L/GdG?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef6849e9-d73a-4353-93ab-08def6a9cf2a
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2026 06:37:12.0062
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: utM5+AJSl8Hehn9zGGgL9ePLSpT8UUHOTON4yL7mFCpeB0IfkCwr8HNSHbg7TEhERrq40LRASyvADgnyepr0+qbCX6IPeD673YlPv44RGzsOpfem9327TSCSdXyIdmb1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1315

Add pinctrl driver for StarFive JHB100 SoC System-2(sys2) pinctrl
controller.

Co-developed-by: Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
Signed-off-by: Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
Signed-off-by: Alex Soo <yuklin.soo@starfivetech.com>
Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 drivers/pinctrl/starfive/Kconfig              |  11 ++
 drivers/pinctrl/starfive/Makefile             |   1 +
 .../starfive/pinctrl-starfive-jhb100-sys2.c   | 131 ++++++++++++++++++
 3 files changed, 143 insertions(+)
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
index 000000000000..d7609deb580d
--- /dev/null
+++ b/drivers/pinctrl/starfive/pinctrl-starfive-jhb100-sys2.c
@@ -0,0 +1,131 @@
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

