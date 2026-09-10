Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2135.outbound.protection.partner.outlook.cn [139.219.17.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A0963E5598;
	Thu, 10 Sep 2026 10:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.135
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789034711; cv=fail; b=VfcLTw7acO/eNOkiUj/QXJ4PjZh4bxUg0gpn5B9UEQfACSUY9bhifr6QLPy6OqgQN3GXGBTTpTEOli3jhh6k+WmZcBsMruwouEyWC3PuLpewENLH7EA8Ru3tY53jmrpQxgV9Y5JxaWxYcEim3Z1qsxEtWecayi2PB8ZHZ8b980w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789034711; c=relaxed/simple;
	bh=bAK8xl5PO77qkMgp2c4V71DfsbYZNih8WNvqU12EUBc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=J2xELwzalbp5pxBriBaNOu8vMkXiOUV0H9ol3jhRo8QAqSoVXk1COKr75DpvJH8Qu5Vg25eP6YWAYFGvBlA+XOr9lbSygbuzi9lCAvjJLYYOYCGBxa26SHuTa2FgDZDO2lZffYw+18byhFpYGCBG4L4EjJfjYEBRt9UuVnrmQbo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.135
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mDr1NTjEnsVkz4n+okDfIdWykveRNsBEbMTPk0ptUNy08QbEAFixp3gE5xRS7RRrqR20gvMKjN54ChXQOjd8gs8h0wcur1OCBI3gVxyrcERMw1ZHAKwN+lTc01KZt6vnDWrz5hLPZMYEgnv8i5kHnGFh6FYt1SBj9vnjOnRbXLb8jxBBgegEJg9R77u4WxeuLtZkNX3IpnDvbRB+VhfGO3WZBKuDxHqab/NPz2RGMY5kmNxsEEKKKY8P0DHnsDB1xTUlvLyyFYafhTMsofdk7RM9UWyYNvXUDbt1sJtRcT6DlH62xuiG1KMvqvlpmVRV3LvF5R/CBILBteQ9vK0VXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lRQpV2VziYtB79Xi1/iolmmGGaFOl9BQyS2WV/enzt4=;
 b=IHTOlxvzh3P+opYIqIp/a8jHT4njhfhvwLNXY4bN7IMnA8Pxa67FChk0jz9Xk+MELN5fUavKz3Pvlo/T18fWcUHO8kh7iHVYCSsbBNPAaGlUBm079Cd+kED1uHb0ycB1UJD8F0M8+/arN+lxTWQYQLXTx1UfswnLzDH7Xzahc631bCMNHF1bdOuR5uCW65NqdKjzyobMpeSg6YGm8zO8cAxyRFGR0/d2ken9vH+q89cWA4+idKbxY+n9i2MzyVeHYevmM5LIZ0uYb2mHIR2diDKMeUx2Z86ZiLbinXNFggORFKVs4XdAJR/Ufcav4fCX08IIrBPc7QSLdEPiqIpUCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1233.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:13::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Thu, 10 Sep
 2026 10:04:22 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0339.017; Thu, 10 Sep 2026 10:04:22 +0000
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
Subject: [PATCH v8 12/22] pinctrl: starfive: Add StarFive JHB100 per0 controller driver
Date: Thu, 10 Sep 2026 03:03:47 -0700
Message-Id: <20260910100357.130134-13-changhuang.liang@starfivetech.com>
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
X-MS-Office365-Filtering-Correlation-Id: 49db8a64-5069-4ef8-5dd4-08df0f22e2f0
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|7416014|376014|23010399003|5023799004|6133799003|56012099006|3023799007|10067099003|22082099003|18002099003|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	wJTKTDH2IlwWLrSv0dumaWKvKs8dJvoApUDRtnDdfmW7xWTYhSlbOoahP56I0I3hshBGU315e0OUnGp2tqS3orvnNkFCRlka4TOUNNIjEuGJz2jzi1qY2fayUZKXn6XryR32uvk7Og9L6N1g7fMXjbgkdWbwbjjDVXSci9W36PFB0ZvR+X8KZlL2UKfXIM/djmsRtkT2+aJ4hTSOMac0/H2l4Z1ccHt/rjEhiUou++lkJqjXhCJTH4SAadQ3HN35hf34rocVDtvY7etTak44EgLolhuzkH2/6dG6Qx3UaMyM0cu88ZR4r0eGcJr9IVKqtlaC+iWkS3xqp4oTKHrvMHkL2vEPmALNWQfsPQ+V8WAjAonAFW4wS7PMFzX6nXqigR6cFuqPEESypHav+fsUT9Hcly508iBhP9I+d8uoGk6Jc7TzWcXLUjbMIy+z1NtU0fIGEpSWBx1CMlgXfnczqfMPhiubHunbh5yKD/ismIi1ZT0iNFkFkcZU7edNnsTj3gkpK9it+edZAoWxXFd7OcT4t2hLQaLaKIGh4DcT9675u1AA6T42yMptSjZWYEmhOeHhqyPb8cWliDqZiGB/8g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(7416014)(376014)(23010399003)(5023799004)(6133799003)(56012099006)(3023799007)(10067099003)(22082099003)(18002099003)(38350700014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ehSbP5zvV1PQbbdbDOAalVD4P6j2PD6uDts716aN2N/PzB7B+Q/AiWylwVSJ?=
 =?us-ascii?Q?lHuTKgjYsZ56JROIqiObuC8A5O0+0CIPUGhkvikWcvrg+DGR+dNK4pgnk/Fg?=
 =?us-ascii?Q?lykop6JRJA5ZAYkcL+N4oHsD59pxxleZ3WQ85elVxmCqiOOc+hyHj5oc55v5?=
 =?us-ascii?Q?ZEhX+mLc0eqWKVwo04gTXpzf+QjRQsu2jet1fvkIm4NH3da71s9eP+d9UtKA?=
 =?us-ascii?Q?EQhYACNYELCaucEADMCkDjccg3zBDDPLPpxXvrSyMWMfTDy6XJu/nH5Fj6dB?=
 =?us-ascii?Q?ul0197atfQM99+lk/NFscSi0UdizPO6iaCb/eRJQNTwmeD30Fm9oWKm9Fdd0?=
 =?us-ascii?Q?aiSpUH8JhtaqCgzj4cxb8Pi0rsGmTpW7tTfpe1yD8fwYSVRb7AzSFsoV4/bq?=
 =?us-ascii?Q?dPV7bmHLnq54pX2DfSnzeB8iCzm/F43jEYwgXStbnT9lB7TU7JaYvUTJTQMV?=
 =?us-ascii?Q?7xEWhcMRV+wX0pPY1Zuyw2uID2zsMwK3ohWV0kHfAeoG40eIX7Z8OKux2l4y?=
 =?us-ascii?Q?0mJTK1K6RGk8FaRBhAJ2sGqUMts8zfH2TpsEYEzmVgqfa6wOPgHQONyHPvPN?=
 =?us-ascii?Q?zUnDEpC4pwRVYktw6mxifQiYTsy8YsQyBbMiNTN0om+FyiNQsBmBhyRIX04O?=
 =?us-ascii?Q?R6eXv24Y0mSBgAUaSefxxMDFKZHCc9vNAAoDkCewIxEVNbvRB6mT3ruhfkFR?=
 =?us-ascii?Q?jM87/t4ZYLp+RRFwjaSlujJBPdwJNz7gONMUDkVhChUM4Tt6lB8Y4QLhvou4?=
 =?us-ascii?Q?EPYfYdJaH69+0zJEas1yiuUuxzr1kZfwcDy18+nlPu8SUoUClzTN5IGTx0Pp?=
 =?us-ascii?Q?CA4JteZqSRoKhc1QyEl1av7lTulK94ZtrrdKz6wo2sdqLovF94T6Vw9LIo5q?=
 =?us-ascii?Q?OVW/9DonXfiG5W90PVMA8bwhBD2V0I5eHbNu1DlQrr/B3NCOJyZHZi8NNoJs?=
 =?us-ascii?Q?YIgwAJSntTCmJoeEH3bo/qkSvzBHSqlJUqP5JLwnzXaTPfF/NlidUJbDy8SP?=
 =?us-ascii?Q?6I0KAHl9SbgsjQAC6o2KFlADV676zm4O4fVFAlFE9OH74bVp7tG7LHFyKiy3?=
 =?us-ascii?Q?NNKeic0r+MBMyKtM5meRpU3Tif/mWoPFTwDQIKTF0AEgaHpwXcwomS4VXsaG?=
 =?us-ascii?Q?jAF++KZLu4dQwrsTK9+cGSj4fJQeIZb1cVW+6WpuQQzfQ6TPTh+QU9+pyDQ9?=
 =?us-ascii?Q?sgSgBZiu8wGZ8kNHlLh4QyhkdeMmQznqd2MGnGdTrcqpi0dzydJX/e+oSsnA?=
 =?us-ascii?Q?7XHiIEqbtUaV7IZBec3SE6OEwVNwijMPTk/ildNDTYVbMnryQnwDAlj2+0I8?=
 =?us-ascii?Q?sz9KGijksE/pqZ8Y+VGIoBVQg8hdTuZ4b1dXGjwHk/jXnwXXdmF/IaFMsjO8?=
 =?us-ascii?Q?Jcz+kUcNy6y87RN5r9caLR3C28plgwzX3fQc9PEtjyKGSjVJGJLFDDczqhj4?=
 =?us-ascii?Q?Lg0vBtGVlhU9uIeCCE8DK43ink/sdRDRbot/aq8/NHun32xD6c3GRzNhvDC5?=
 =?us-ascii?Q?44EbdscEcLrl77/d7SF2qnmwsQqSSoCbQM6e5S98Ecj1hS0lQgmKAvDh1e/L?=
 =?us-ascii?Q?cOg+ZtK6pWNQxt+POKXs8cHuTTYQ/pSz0uQl32rUD+w0Ue2KsvMPHZhrVQ52?=
 =?us-ascii?Q?lPZHLdFwmTl4JqHZYxcRCUsda6SOyVD/iTnuqjnIBU2KjfeH1uCsduVTgiSe?=
 =?us-ascii?Q?kk9DKaNeMvtLX90LNVrSM7Cc9KioaXk2zcIMEyI3pFDi8C7iRPjWkdRJZHGz?=
 =?us-ascii?Q?xqDyVDRvtxzcUSLGmWig2pu0q4W01a/zwTqU9PLWanCUsfEDLhY3?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49db8a64-5069-4ef8-5dd4-08df0f22e2f0
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 10:04:22.1786
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oShqICncoVp+TOdmwKDhSlzJkGPlFxdObfsIi9AKq2NDcqn0HXsktx/0OgjPZ2OlLdyqTIhIlltpfQGCNEAD3fXiOlwzOPqBvV+5Xsq2Kyw8YJrZClE/WbMcm8HiPA3e
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1233

Add pinctrl driver for StarFive JHB100 SoC Peripheral-0(per0) pinctrl
controller.

Co-developed-by: Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
Signed-off-by: Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
Signed-off-by: Alex Soo <yuklin.soo@starfivetech.com>
Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 drivers/pinctrl/starfive/Kconfig              |  11 ++
 drivers/pinctrl/starfive/Makefile             |   1 +
 .../starfive/pinctrl-starfive-jhb100-per0.c   | 182 ++++++++++++++++++
 3 files changed, 194 insertions(+)
 create mode 100644 drivers/pinctrl/starfive/pinctrl-starfive-jhb100-per0.c

diff --git a/drivers/pinctrl/starfive/Kconfig b/drivers/pinctrl/starfive/Kconfig
index 1d7e661455a8..07f9cb3d6eae 100644
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
index 000000000000..679954b19808
--- /dev/null
+++ b/drivers/pinctrl/starfive/pinctrl-starfive-jhb100-per0.c
@@ -0,0 +1,182 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Pinctrl / GPIO driver for StarFive JHB100 SoC Peripheral-0 domain
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
+/* per0 pad numbers */
+#define PADNUM_PER0_GPIO_B8				8
+#define PADNUM_PER0_GPIO_B9				9
+#define PADNUM_PER0_GPIO_B10				10
+#define PADNUM_PER0_GPIO_B11				11
+#define PADNUM_PER0_GPIO_B12				12
+#define PADNUM_PER0_GPIO_B13				13
+#define PADNUM_PER0_GPIO_B14				14
+#define PADNUM_PER0_GPIO_B15				15
+#define PADNUM_PER0_GPIO_B16				16
+#define PADNUM_PER0_GPIO_B17				17
+#define PADNUM_PER0_GPIO_B18				18
+#define PADNUM_PER0_GPIO_B19				19
+#define PADNUM_PER0_GPIO_B20				20
+#define PADNUM_PER0_GPIO_B21				21
+#define PADNUM_PER0_GPIO_B22				22
+#define PADNUM_PER0_GPIO_B23				23
+#define PADNUM_PER0_GPIO_B32				32
+#define PADNUM_PER0_GPIO_B33				33
+#define PADNUM_PER0_GPIO_B34				34
+#define PADNUM_PER0_GPIO_B35				35
+#define PADNUM_PER0_GPIO_B36				36
+#define PADNUM_PER0_GPIO_B37				37
+#define PADNUM_PER0_GPIO_B38				38
+#define PADNUM_PER0_GPIO_B39				39
+#define PADNUM_PER0_GPIO_B40				40
+#define PADNUM_PER0_GPIO_B41				41
+#define PADNUM_PER0_GPIO_B42				42
+#define PADNUM_PER0_GPIO_B43				43
+#define PADNUM_PER0_GPIO_B59				59
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

