Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2112.outbound.protection.partner.outlook.cn [139.219.17.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5D233939D2;
	Mon, 10 Aug 2026 06:37:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786343865; cv=fail; b=SYzPEs53NkIqnGzKoc9GjyXO9LHGinUyfef0Znej+F7xD+/pVS9mzOO+iz2WEDZ34LejaJY9WO34VEc8ZmQzYjG+GgimxyQKGxZ4QwnFTdCZt6Ovlgrog89y/PfTSUxkdvxmltsZQY3Nlahoj0aQ3dqpCeurONkK7rkzOYqIGsw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786343865; c=relaxed/simple;
	bh=TanqZ9/Dq4JmSQkQb6l8D/QmUVUDmdKTFmI63DQLB8k=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=oq30x7j0hHYIuBErfnGwHojLVgY3cvs6QtX3+RUITgq8YLCDQ5RrelC+BEhs51saJax1xajXWWUN85EypZNOUINj1b7uuRYGUjqmtS0oVI6Amec1ijMcwlhWHZ7t8z5mUTF80kL9jAnH7XtQIgrF3CnRl76b7zLfNORLQQQbakU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ItZeOdnMPV3hUru05jlKXVJC/eyemhLP5oOehne6jFzq08rQfRCoA3/pU2/D2xWfK2lg/ZxoHFF48X1wAx5f62n1D+aH+5itxhHki8SCeVCUdKs8ppqEF7N/0wdCFj7+T7T6mG5P/DVkywycJHQGY/smEwmFT4xn2ol3cTJtAzOE1aUqj1ZWm1N+ciyYw5SHOmdgbDKa7dDgRS84LarteVLL+pEA0KqpyR/qnwLVT7wXlzaWmIRgtyWcQ0lodHd/l52XpgXquREGHP+qdSL2tMC8VgqSVI2z4Mh93FCVXr82ngmv1Z7Ex8pAbpVbycl3UvBXDSKSmy7G5gsz8XQvIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9rGJee3dllZHL1cK6HeTNWOs+9xmiv3s8ZVz+2EypNU=;
 b=TYp1+YjGV7XdOSxjXj8v8p8xx+ZPxfBiLutQI26oOb8C/4fa3NJayWHLWpTJC0wDrz7UUzmWRVr9HSDXA0bJOvOxY7E2nxseIYAIcCSDqzKXBeY4XlMTBlD3gE29iAzW3iNk/HDxly+26owVws2JpH1ShJbiANwPZRrsAKAl5B7LmBIsMVO7ez2kWBevA5Sy6QSdTOuAczbZs82JGsfcetfJJ9+102enf7/zL7CRZmGt82U3r/LTWuqPGdO1vui9Uee5wyYNjFEjEHVJIDVMRPRNIm4ZLwtIP+Es39Jattmtx4O/IjQEzgTuvUC9WwwBDqZxBbRFfRtS+Zf8zpoy0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1315.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:15::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Mon, 10 Aug
 2026 06:37:14 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0292.024; Mon, 10 Aug 2026 06:37:14 +0000
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
Subject: [PATCH v5 12/21] pinctrl: starfive: Add StarFive JHB100 per0 controller driver
Date: Sun,  9 Aug 2026 23:36:41 -0700
Message-Id: <20260810063650.239303-13-changhuang.liang@starfivetech.com>
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
X-MS-Office365-Filtering-Correlation-Id: bb9ed086-741d-4a03-45ab-08def6a9d0ae
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|52116014|366016|7416014|56012099006|5023799004|10067099003|6133799003|3023799007|18002099003|22082099003|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	kusyzeYXW4uH1SLp4EDrcDVcW8FC3Ke4KfVwz3du0W54mgKubXr0D+op7I4oMXOmUusRMtxKcH8Cgwta51WW6wznw67D6YBFvVNszNS3RtU21u5XTJP7V7zx638nQTlnmScEkdjO527CFp2eeCpUfsOhLX0ZO4r/KZX4sbT4CDy6oodlCyZfbjwHvPEVJ3+jF7FRM9PCHxQTzTapcaDs6ZZ/Z7DY5lW69MUlxO8Xl+A+oMBcPCizHQen0jN33i58QNifO/lXnCKsLMsmIrYVr1C8XOmKCs5x1oOH1OMBQiDqEH24MNAVDgmmTSL1hv6bnZkmGn4TP/D9A6KEkZqAOGZzueI8RvtKAM7LCURG1CQP3g9/IKHuNBM1AdKIp1OgJD3WRW7yEtavVMthO6an4t6VVgjBrzYa5ewI4Tw4aTVymYmKp48k7Xo/Fl4PyIffuN2Ulz6MmDRTQYELAFohjTsz1c8/kM+/OshoguLEvXD3Jfsx5ZcZnSPt577WNB73WoozYrhz68Js0QNegR7JodQ6jaYWPQK2AcmMBmnbyyvb9bgMxI1dGD7MLYJGPz1SbJObpipBR7xYlUFuk/XAeA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(52116014)(366016)(7416014)(56012099006)(5023799004)(10067099003)(6133799003)(3023799007)(18002099003)(22082099003)(38350700014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?gWPfcaR80IVnw9Hbt7mUBWWbcRsC7pADIy2c0w8ngQJS30wWb4K2czcjMxne?=
 =?us-ascii?Q?Uf5R2JHEuoKrWDkQSiDuKlOiSnXFPJiCELrfR6SKDWeB7uy48EjXdMc1uNK9?=
 =?us-ascii?Q?SNDZuVWGT+7ZrXGv6MUqxRdNNpcSIXnTo4ZkmDOcpn0SxPbiLime353GwUbg?=
 =?us-ascii?Q?lgU5jWZvkdYB7Q9EgF8LKYIB96MNT/Auud2nadcLFVRPe2eDxaeT2fKeGrqL?=
 =?us-ascii?Q?cv6HEad5wSb/tdINN3ifY5R6aXGvlrnAT8OzW4U7cZQoHfdJHjxsTsxPJrhQ?=
 =?us-ascii?Q?F4DoaoQqa1ZIO/JCTqFzF+NzAG31GqbswaBQjb6wRSBQp+YsjBZ+XqIoRCXx?=
 =?us-ascii?Q?lmnfatCyIRdpCQX0Bcb54wjtf2rGoqjQ/Ig9G77I0VLPO1mB1MGbaH9RCdg6?=
 =?us-ascii?Q?jCTBHzIkoPVVYRzqPnMuBnOGl3JpfkNQPuTF2lYbXZJ8/7PRe39z6koEE1Rz?=
 =?us-ascii?Q?SS7DbpP6Nd7vtDH/7VxAeO9Z2VZnhRmyY/JZjYNxY9sUXq6/HTgGdsygUqkc?=
 =?us-ascii?Q?WHHiEIr98HXeMjW2GjWiFt/4mEYUq1t6lduujsMzPUS4ARQsb/2p/wkDJiqi?=
 =?us-ascii?Q?IrDfom14YPi7wmRbAn6/oqN5ZRCX7QZox1GyaXawTbAx5D3rEdvwCI4lX8dn?=
 =?us-ascii?Q?quSVnxIqLdvjUr1cKjBTFP5p+K1VPxN6jTXb+a+bp2rg1s/mBXulhIZVZto1?=
 =?us-ascii?Q?a2LEHhB5PC30bMicmYB1/AVuwoOJ+YHDsbdlOpsCWudkpu61dUk7k21T2wk2?=
 =?us-ascii?Q?GBITYPXxJH8zdkPEvGhIv5XDRUfLddWwPao8/MRG+kF+OoRTFduDpab8O0tH?=
 =?us-ascii?Q?M/r77DhgOHsIKNm1/9gD/AS2uTeXExFUz2OBgJVZuHl6n3sOlrBs5m2Gl/pa?=
 =?us-ascii?Q?v+yGea5m37mNSHHm7ysYXjX/cicHDkd07It+hSW2EZDZMYyHuBw9b1WuMPnc?=
 =?us-ascii?Q?kuYPCVE0sh0jhmhyWoY9Pn+pRPHo4UbRewvL5utr30XF4wINaKL6lb3/r84J?=
 =?us-ascii?Q?LSZsZWcQ4jtaVsozRYgz6zoPJOE7XnC8p8NSGcmrXehKNgrhaLcGE4w+9on2?=
 =?us-ascii?Q?yEamGTrmnZAPT8lGXp56sd2Log4sKFGNGp6yC+og06CejuiRFWNvyqdrEGxX?=
 =?us-ascii?Q?UrJFOPOll24mO2s2uY0yvAwEC1ct2IwGksoXHWyZQVtJJwuFjdkazG7jWLSZ?=
 =?us-ascii?Q?b+sVt3ksFLzWj5OTkX/YQ7WWYJLnFWJ8OnRA6QaWNpv+0uhmuEgxQbpPbBGp?=
 =?us-ascii?Q?tMSzgOe6ovzFGgOuVIQxE8yBcmdvHVy5rbgjOF6J07PDlhMascA16/zOQ0sE?=
 =?us-ascii?Q?sWkroeuD23AsG//QOREtPPOkTos+9gwErsB5iYt/dGUcQ2dFM7uzjVHY829e?=
 =?us-ascii?Q?+SC0dlz1xeqeRBx5DY0AHt4NEIjLPDjNjCe1H9t3YubYCGzHF9oqcKn/OBqC?=
 =?us-ascii?Q?5/JACRKKK4M/7b2yW0yqUBlNhwjONnJg+6acPuyjwomEqrejzOD+WM5f2UCE?=
 =?us-ascii?Q?ndXtStXqTqAQRPGXParMiMjsuWiu85iXuvPRhZ6h6qNiveUqpnpAKYUmAMDV?=
 =?us-ascii?Q?AJH1OSjZlS/3amRRp7ohm97bSVpp0QOO0VzFLftbeKH27ePLKXWchXm1j1bG?=
 =?us-ascii?Q?iXN7YqvDo1HRRgGNJuRkAn4vz2n31ffXvfF2x2P6AWOAM3sNDwmkeZFCovnE?=
 =?us-ascii?Q?Kwo88zUDS3olNJ37wfcjWGBN4Vl9up9r1D929D/kFal3ilcA/UyRom9rC/jb?=
 =?us-ascii?Q?fRP5KnLNzJOGlFCmuBvBdv0pCq0MGXUCnfvuCv1oJsmet9ghFsOA?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb9ed086-741d-4a03-45ab-08def6a9d0ae
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2026 06:37:14.5420
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fTrPjjdoH3HQZFrBLCxoJAwBOOJJ2G7XyqcmP4qMAB4UUhF+bCAQQ19tOE84h7pJBP3gu1ucznKdXH8w7dP5BmGR/Hm/NkmRhsUcAnmgNrlHXJ9hW4080cnoZsggIzYt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1315

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
index bb298419ab60..ddd39807e222 100644
--- a/drivers/pinctrl/starfive/Kconfig
+++ b/drivers/pinctrl/starfive/Kconfig
@@ -57,6 +57,17 @@ config PINCTRL_STARFIVE_JHB100
 	select GPIO_GENERIC
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

