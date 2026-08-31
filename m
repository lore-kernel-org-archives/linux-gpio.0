Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2104.outbound.protection.partner.outlook.cn [139.219.17.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9378E3EDE54;
	Mon, 31 Aug 2026 11:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.104
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788176156; cv=fail; b=CwvN4JmqT2dZlwHCsxTiRA07v0JsmGpULQ/laZw1Or1Tw/ZTONWID79ezDDJj6TpsZAXAvVbyB/gaMo9JvCSg/1S/72E+aonI5CZtT6jsOFpEJ3sT2JeNFqOju+nEJc2yQqW55Y51JVB6HLtSvBi7NKGyYjpUH9PcXHVGSscs9o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788176156; c=relaxed/simple;
	bh=cV03k5cHt9RcmbpB/CJud68uZqJ2n3mcseUleN2qP8s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=fdEHn7B4q1U73jw0zYU/4myxePuDxrcIaPpyVAp8lEWxM7tPINTEX3YpjsJM9LadSpVCrLYtS9UHH/LFekpRzNHCh2EWuA/iB/io37XBjVUZe1UdMxWFjWGL3Y4yhJ2SmklF6vqu3CrL4bkVJhy2EpawIeln4C8hLMD3A7iY/RU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G/QeLepZSZ4Xs8HpJPg9P30NwGPFcTiv5yDf0fZ0x/eOK4i1xcy9PMnG+gHQf7N4fheO26TYk6+UlS7iDqtuA7DJeXwlvxTK3QlHHuCyfUjIEdJvUzCuu+YuawovOijMDfVAnAXZdDTzX0PNp/05NESxeuePYGtZlyu6UBMH98zrRc1w6mskrTPE+/mvI59wLUI8GLiB6g9d1zz0g9UeeIsEHoj01AbZKo7b8zdkOd9i4cLMI16RmzAg4mC7FW4JyBh/nV++nU3ETTi3j/BYFE0Qi2TSzKmK/+9t6cfTlhCMKH18B0LCq/7hKxZVv4we7fjx2lFQbxVxZf17zhKGAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HNG67xRUr125BiAIL2gKWrgqlmzNelfOa2/fHIhjxd4=;
 b=PcncbxMvtFBnI4nxqX3FyxNycyv1lV4+20wddbbr5AQGGNgSphjTVJ3x8d5ckNvKLkUGV5IlSZTibUREGTKGa19Vr+PIHq02gnj6bKob/6MDxVDFwq0aGLZEdwoYwopenBycgFe+yVR9LpCcezjvmGE0OZU6qzCDYZSbBxat5bqYqsApdnDyU+G5tpNcBEGjcr2NEkhzCOrqzdKGBZP+69rSRUd7Y3qL2siDm8cV35hvQ5IN4e00zfb3GyIQ0A/fG11oNOjUOdI/M2Ga1RsJnin5nrbTbU7yfZZa/fWhCgd+M/r9l/bv2IrlJBopvuzTrO7OeG+cVN4Em1f2zqSLqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1332.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:16::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Mon, 31 Aug
 2026 11:35:37 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0315.011; Mon, 31 Aug 2026 11:35:37 +0000
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
Subject: [PATCH v7 10/21] pinctrl: starfive: Add StarFive JHB100 sys2 controller driver
Date: Mon, 31 Aug 2026 04:35:03 -0700
Message-Id: <20260831113514.66382-11-changhuang.liang@starfivetech.com>
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
X-MS-Office365-Filtering-Correlation-Id: 069a832b-40ba-4610-16b1-08df0753fa02
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|52116014|366016|1800799024|376014|7416014|18002099003|38350700014|22082099003|56012099006|5023799004|3023799007|921020|10067099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	eWb6Ho82UXXM7QndeosZgobRT7wi/ybXrdvCC+Nsxd2nqly5kIlwlbTmcIlL3SNwwyYsGMcLQ2TI5JI+oyJh0rdgG5rYhweh/slKDucOo6RAAV1i38igfRs88YkQEZQVqFODIgJKU7LThOsscXG6gUQIFGdtMz7TAh8rJX4n5p2UNF4xOrPE7BsWKVGkY2Z/ComcHwNDCK2E5u91DxOYM6Lt+b4/Jx+a0bKmUx4fNO2UQj6OMoh4hupKTFD3SFXXpimVSZNMtQJO2csZfexvBQX1nqjGH5zDJxcULi4oB1ewQ/pzmGrPOJeW7yHRjQlktOb4uRFQViWkhZ2dY0KNG35j9qY34wBK2OCmfTKmlWE44EHtVjd6agOmUrOcT9SAncpP86/PyhBqLlXZJZrXWmwaIyauOObmYimje+ACZY1ECblprD9mnmAOhERn05WSFBFhe0HIqFsGH5BpBpZ+JQn6tbCOkctpu/BMzPsSn8ZT2u/UFG3UTZDHiNNIJ3WF6KGQw3DGJm7R5jQweIuDV4rmWblDdda/Qr0h/tQuENN/FH72dcl5dFbjF4rglwJnZ04XdCdTqpWKYWVd2ImLPw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(52116014)(366016)(1800799024)(376014)(7416014)(18002099003)(38350700014)(22082099003)(56012099006)(5023799004)(3023799007)(921020)(10067099003)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?uAYnyW70IqgzPctfR8ljLSktxintuVqKy+bRjOsidtq+/6jKjd59qoMXiZN5?=
 =?us-ascii?Q?8hPaOWHxqRSfbSzJC4XgpbnG1jzET3N4UpTJm0WbEax5B6UdkB/nCI4N6WPQ?=
 =?us-ascii?Q?XRj2yD46qtHrtBH2xDBp5ohK6hMcP7sBpv1NR+uLDPfROEkwGdXVUOkyEWa2?=
 =?us-ascii?Q?iU6+bZ3obMDBH+x6OmolXcsRObZa+hVWU8YWgwmqOAL0zXQu0fPzsXTdgTov?=
 =?us-ascii?Q?cXzbEQycN/OosXMmPf2A/NcsJ0tj+PVQZu7fy9jL8I6uSs9h1BFezNj6zEaG?=
 =?us-ascii?Q?tsj7z8DtbfQT2Sr/WyajiCGNIuXl1WIg12TONgUqw+jP5fYY+H++ewPnXE85?=
 =?us-ascii?Q?CPC8l8S554YlxJRg0Y/WAhVlNU/KODIDImLENajunKVoVB7/vKCx9Gs1KKRb?=
 =?us-ascii?Q?j1m8/f2aLBehgTg0q2f3P6QEQQEYmd8VgCPfRbtpUGmXZvv02WTheoTlnzdS?=
 =?us-ascii?Q?w3a1MCQOeKQIortfu8bFbU5xk1eyaLM8pAXnueCz3y4tBXQ8MvDb/f51kexn?=
 =?us-ascii?Q?ND2SOfB8p2o0dmEnkoOBXcFLsUR2hn4RhX5MTFBs1V7MnlGBq9sUoN6QJPiD?=
 =?us-ascii?Q?1TUEvyrtcuJCcHNXSBDi/ReCtu2XC4HXqGOZDeQCYm9lOSQq7rKeGHSvv4IV?=
 =?us-ascii?Q?r1QP2YVSO9hjs+fqx9um9DVA5JVQP4SR76aMG8alNdPX8amhOaUKw/oMM3vv?=
 =?us-ascii?Q?1jtz2+cePE7MMikQXpOoznEEbsZEcR8wRSlEjJ4dCUWzq4hMFLcKRNBPPU3A?=
 =?us-ascii?Q?KQgM9NUS6Hek7NjGHTGcbqfI1F9JzVrLqyNm1uauv80u7p8YRiVtBBegvswz?=
 =?us-ascii?Q?TTCrd2zmUT+pHMdoCFJEl1KfVl8ApBWEEXOfPkZeEWqMbr2jcCAV8aeTgj4K?=
 =?us-ascii?Q?9szfBy+1Tkw+xupn+9bGRHhF7MZNeMzyLGy4eAx5BkYVjhh6ys41CK3q+idM?=
 =?us-ascii?Q?eUcwcOiUIgidkXFxPU6S/lGw84JvRjHXnAM9meBFhc+DK1eU4Wjqx3G7QmMI?=
 =?us-ascii?Q?8WNTlQ/V1D1obHY+p0bWQ7v/ToCm94QRmry5hbFefE56jOh7ZQdrbPZCbRjX?=
 =?us-ascii?Q?pw6/lbCBeslsJ3lTncHHaJ9upuEpHVTVSSn1Lm9bdMoC8KPCDYIYWbCco+Gr?=
 =?us-ascii?Q?W1LSuCKAKDdNxtYTnYV7QKaoOMm9Viix7sj8Nqxj6gNDsC5N+5WPeeqYbJi4?=
 =?us-ascii?Q?csBPE6Q6BbReEIU3v7k7n/cAdJp8I7pHx40Eikt7bgUz9S328AGYKvOUvN88?=
 =?us-ascii?Q?YxVfXX9aoPlMTsCz8Uof55tylum9vFaoE1YkPrw7XfbW3BD3NHPXsCBiJfvK?=
 =?us-ascii?Q?NxXzT000l8XuEPHyGRExoPs+zjQhZn28AoQu68Vm8ZEbRozi7PUv5QQsjvJe?=
 =?us-ascii?Q?SjcjFtpC7sBTZmkr8rR3mssR/FQV12mb4mHc/clJ9Zi33FXGsZZP7mRcdZw/?=
 =?us-ascii?Q?VfGs2O6M/FZOqrsOXlqlL3NDloGFtcVtGlTsWgUZLzlcLxx+zhrGm+ulZjhH?=
 =?us-ascii?Q?E3DqeWFq2giY+UkZItP3j6bZ1NGCN8dRkIb1MIF7+veYeZufBo239cI+XPNO?=
 =?us-ascii?Q?0uahmSo1djihUsEaBg3QChh2OQG6XeiXN68Rx6z9VXUTk5+Fvf7uaX3QShQy?=
 =?us-ascii?Q?K4u3egF+EZiDhT78HdS07imLdwXyoxySsh7VB9tFCLWeFD03Z0hEBvwX0NwA?=
 =?us-ascii?Q?vvg1Iv+fxvO4mb05s+jG5Fo5o6R6EQll+9bE31f33rFJ57EYdmKSnGX55dGd?=
 =?us-ascii?Q?Fn1CkLsvQxxZ71MOIPar7QMyQI1rdeBO71fDhLgZiW7edHMfxZDg?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 069a832b-40ba-4610-16b1-08df0753fa02
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 11:35:36.9281
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HBJacS1UN3wqkhccu6oPrKeryUDnp/tDfmQD83QSUyRoe4a/RMuULTSbTXDIfmg1zRsOq1UI5/Igp2z41QBQPU323/55ECtUdCSdIabdr3+TcEa8gAEm9LohxA3vB2BK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1332

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
index 0b735cab89e1..bd2517b75c1e 100644
--- a/drivers/pinctrl/starfive/Kconfig
+++ b/drivers/pinctrl/starfive/Kconfig
@@ -88,3 +88,14 @@ config PINCTRL_STARFIVE_JHB100_SYS1
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

