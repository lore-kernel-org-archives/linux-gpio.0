Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2112.outbound.protection.partner.outlook.cn [139.219.17.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 945BE3A1695;
	Mon, 10 Aug 2026 06:37:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786343875; cv=fail; b=JaSGp0eVaoHPPJyHdxlh/f9LJJhSkEZoxgDY9Llnhd9q+931H5l6AeWwZXZUzMyjNjzKYrv1VPd/abri7U4CN+1SsbRKKkXcC65hebPOFKOf9WiW4/6on9oeFkDkd7Mo3e5B416UrN98DhEYr9sdjgbPMEhiFYVS29pmp63l+A4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786343875; c=relaxed/simple;
	bh=qquvWs9xoUF66j9w1nRjNSxo02agtl6UaZSmI/vzUEI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=kWP3FMNu5Fq1I/Iz6OZCDWmgp9RXPYxX5gF4kI4LkNYYArcjMsYUWupVbEGdBLIt8eO7+6huRVzplvFuY3IUL5USGILTpMhWEphs9LI+m+SU4detcyUYoYGqe0GtN/CIoX0RYzADmSwr2guIdJwWMNq8K8w7og4htxvsQRFnH9Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mTGBMzvkcqwFxfC6VLLNDui6ZTGH/Ay44r7mZ81pS6fpssaXcD1F+BMweI6Cj9kmGcG7KnqsT7aDutdtW+AZ5tcQLlb5WIOGdoB7AW+Wkl5SksUTB4rnpoGDrRmgCFrfyUS+GnS8tz6EDoA2oLcOCIjjcO7oi43XPCeajW30dRLbyzfl8sCtYPn53h+PVi9Qr3Ev0RmLbeoOXwcMzVtuCopyzdM11IQHkrtK3oXLz85fiSX+C8lfSjq5QAJs3v5Oy9JHbJQn97v5yl04UoYAQuCl0hq4CjojBc8trc4iYJAgiAEsSlcl8ugAMT5rM5qT8IL1O/fmNaRitfZTpo48wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h1Z9Bih+nnOAMh38upBVLb7HQFapikXB8pFZ9g8KBj4=;
 b=AVsXukLEg8LUasY9AH9yZyy7H+c0qtg4DH81yLPH3J1r1KZyMWleJ5h2Y1zKPqRTCY9AbOviXYMpcsBDTBAH18YKSqSOCJZ/X6d+EIgMCxbSvXrxqVjSn9fZ/vTRpjCKIgmVDJ0L7UmEV5iDpcY+Dhh6QvjUJcO32CH4riEDJ2Z03F6HINGSrKbW+z3bzXnte+6Op6uLgl8/JR6QoL3BHodw3QAAJDQ4FHvo9WB6LT4PL8ZUZdYrzKpbxghhXZAEdzPt9Bhx4vJWJm/f7GlVB8rPCg2EoLhEMfEy4/7/QbhHPGYt8nChXD5Wo5bJlqEGpIOhZaozlwR325ESE2ASLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1315.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:15::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Mon, 10 Aug
 2026 06:37:25 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0292.024; Mon, 10 Aug 2026 06:37:25 +0000
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
Subject: [PATCH v5 20/21] pinctrl: starfive: Add StarFive JHB100 per3 controller driver
Date: Sun,  9 Aug 2026 23:36:49 -0700
Message-Id: <20260810063650.239303-21-changhuang.liang@starfivetech.com>
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
X-MS-Office365-Filtering-Correlation-Id: 34b637ad-b5e3-465f-a308-08def6a9d6e5
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|52116014|366016|7416014|56012099006|5023799004|10067099003|6133799003|3023799007|18002099003|22082099003|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	EP/XfcFlsL04bPoznR/2exb2JKQTUMJnS24wa3btljHBrcZCrMkkLxaHI9dl4K8YHxw85HDPbaxNoT6RPR1wfrumvRC/1+xOGAP8nv5qLL9J9zGt26rLn+/citjdNsMX+vxnvQVo+MmzqtNKTGgkxN+KxZRz7qhPQzJHgzIUOWunV4srCAo6N2jelbt3f0Eon5kOW2GIxR9cfk0e8JxjmZ45CD59/pVN+6GlmeBcaFu7CEoVTguUUJ9pVdAVILamFnAYYZnA/ho45u8k8LAjpIHXMHfWNCBK20dZqYADht/CFQGIbv/EmX5IbUidd+GWnBTiT8LZMxFdQ5k7KNktevHQ6fgytfjmPeSTNMKGzlAELRXaJYw52kPjnY/OqemsNlb9p4F3QBq6VmaSg8vOn51uRFhJv/NXlvN9zX5t5tbMRnVr6V0LuYvxV+99C/PWkIjLBiVSh8kX4BzV6atk7QqXhZFH2wJ/sBfcPQIU+dteghkldeCk478goZovMd1UdLiyMI+QIMEKNs00lpCUajzjjtO8aJLjC/q0WaIPJ9SO5N/ZwHDuUbLahAZlXWhnPfhJ4OuO+zb4EsSvkVSFiA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(52116014)(366016)(7416014)(56012099006)(5023799004)(10067099003)(6133799003)(3023799007)(18002099003)(22082099003)(38350700014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?BGg4WAPCrhCyaJ3Fd8xMV5pMSnpegFQKxiYy1UJ0F3dVECvp4R4EpoXIL/8P?=
 =?us-ascii?Q?SOvCqHgHxANbEhQ8CCXc8duGm51inys3ELH2Y/0WW68OsUOyZPEXEGQxeGUD?=
 =?us-ascii?Q?vY0qMXQ4lW2w+VRvj7hcpIDLik8myDY+qkVxbXhaWn+BBgHkrpIoa5PFpwDR?=
 =?us-ascii?Q?w+OIk06Srb1Er+wcTbHof3LPvwNp24OIRzNwUK8O3lasdMeSOTp8RpAj1VB3?=
 =?us-ascii?Q?uboeAz15GaEBUCL0Tne1yu2op5lNjpVIk6PwwijNfcb/MT9/hgCAeyt+x8tb?=
 =?us-ascii?Q?h/rfpy5eXztPhCAXMPoVMaSTWz37X+nUj3LiZFNc/jb1B0bLtk8IyrYLVOUa?=
 =?us-ascii?Q?NQ6wGBuV2n8Y8T3Xb9zgomquJENp8sBt96vtecmYWeLnSBwuZaMOii2nQEAV?=
 =?us-ascii?Q?LZHwM4ajrGNoGWDJ2DBDdQdLwmjXTNUJBSsDzpgTdG98TLyzknslzDMFl7jy?=
 =?us-ascii?Q?unVee5CisAJzgVooP9TQJzfCIwWLaijxJbuJWUdmgx/geVnPoSJVtQsevOQC?=
 =?us-ascii?Q?CCEFiuh90HpbksSwM9Iev7pPwkGl6al/sM4WpMsIyHwvvEbFBqSQU93TvZ9S?=
 =?us-ascii?Q?+aLFLRNuH5j1Rixvd1JJehaRTxBMiugz6fIwaJbREPwsAsqiydBnOGcqPu3P?=
 =?us-ascii?Q?/O+8x5atvCP4vndHpKBOZh2SBItxbjrMnWlV6vkJHOM/Y5eSAT1bSIxgmUC+?=
 =?us-ascii?Q?2j/M1LPsiI9lN5t/lOEKRjSLrgrsB3Wytzq0AjIkXsCwpSSbyvDxS5dL9CXh?=
 =?us-ascii?Q?pQwegdBe4MNTBrmNkzK3gBBdxQ2ZEfU4TN3F/rGBTLEGuI0NSZBn3O1kiL+v?=
 =?us-ascii?Q?tnCowIBm+f+A2rmXJgj0+zcc7mz2VEBrr3xYnCdI/aJ7xUKpS+LNzNVqfWa5?=
 =?us-ascii?Q?jCbAN0kxDsQAUxBSUn4oI9uac6FBKxibIDCe+oWmamOr3PKEj/PlycSF7kYD?=
 =?us-ascii?Q?d1967hqF0cEA0+ryNNeo8H6MK5KrdJHdimddafgPBxyuAEkmWs9lm/XqgtqX?=
 =?us-ascii?Q?DYZYJDCJX3Ns2x2uGMKbiDFohflGdGibOme9P6MIFLbA6zh8d3PEFhy0km4E?=
 =?us-ascii?Q?wxFHPbIvUrzbwAhG9vTr4ag7pqtZU3WsaJgu7YAtDP5Pkw2DHT/vfc9BBwAE?=
 =?us-ascii?Q?6XcZaBNMuulN8jTLEknGjwSPEOo+D9SRoX23jg+VUQac0Qj/HHOEs92o7muN?=
 =?us-ascii?Q?Vy4rYXwn40N+rhZAq4oBTgMohvrYic8bfnv1dl1TpKJJxwjMPkLATJnqjncw?=
 =?us-ascii?Q?lOaisO3oOeEYaGDROHjR62NpbmGbjvtW6MGnsW6aJu8h02Tyr7SI3l1W2wD3?=
 =?us-ascii?Q?qnhRBcwUQd9Qls3fJwuaRZNlCuaYopYyI9dVVaVKCxih2Xof9d8k3oJdUS3u?=
 =?us-ascii?Q?j5dPJ/r9Ek9cHKJsak1sPQ1r5RYzXMBor9uvY1dVPc5d2h4/DIASFaDeFEbE?=
 =?us-ascii?Q?DKB5FBjtfA8z7z1UoRJO93Fmw1/5TC6c01P9nLeafLe3fsXbpO53hyiw9roP?=
 =?us-ascii?Q?DNMOnbvLFqikp3onOGYTXMTDJwDGtRqwEl+Af5mpXKYZo35juAFvjeX20RaD?=
 =?us-ascii?Q?p+TRo+FY1F7bC9v9KcN0Wwmo6dUsYRjF5S1fsyIhA5PrWpHG/FmyDBZfNYMe?=
 =?us-ascii?Q?wa5mNqMd1auEu//ArkgZNTwffgSJsQAckm1o85yUYoBuo2szfhbXdXEEZIBJ?=
 =?us-ascii?Q?zvA9zXbQdyymzBtrqkcxux/4LZkH5ZVCeBsiRY5gndowsk1FWo3ABaSkf0/5?=
 =?us-ascii?Q?4P08F/o5C4oo9dqoRcfqg0gpBDwBZR2x3KlDHKWQiAIvVHDwkCbN?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34b637ad-b5e3-465f-a308-08def6a9d6e5
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2026 06:37:24.9665
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cZHsLX0gnvb0AAUqIFx1Aa0w3LPutHVOorvAi7pMR/qpiBLr2DGtYcmmr1qgRvdNUmFnwy+fBhU0sClbAaWZJZccrxo/+RS3GE87mFWy1/H/Joonuxjwheh8me3bm09g
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1315

Add pinctrl driver for StarFive JHB100 SoC Peripheral-3(per3) pinctrl
controller.

Co-developed-by: Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
Signed-off-by: Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
Signed-off-by: Alex Soo <yuklin.soo@starfivetech.com>
Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 drivers/pinctrl/starfive/Kconfig              |  11 ++
 drivers/pinctrl/starfive/Makefile             |   1 +
 .../starfive/pinctrl-starfive-jhb100-per3.c   | 117 ++++++++++++++++++
 3 files changed, 129 insertions(+)
 create mode 100644 drivers/pinctrl/starfive/pinctrl-starfive-jhb100-per3.c

diff --git a/drivers/pinctrl/starfive/Kconfig b/drivers/pinctrl/starfive/Kconfig
index cbbd6f1fc338..b67640cf0d26 100644
--- a/drivers/pinctrl/starfive/Kconfig
+++ b/drivers/pinctrl/starfive/Kconfig
@@ -101,6 +101,17 @@ config PINCTRL_STARFIVE_JHB100_PER2POK
 	  peripherals supporting inputs, outputs, configuring pull-up/pull-down
 	  and interrupts on input changes.
 
+config PINCTRL_STARFIVE_JHB100_PER3
+	tristate "StarFive JHB100 SoC Peripheral-3 pinctrl and GPIO driver"
+	depends on ARCH_STARFIVE || COMPILE_TEST
+	select PINCTRL_STARFIVE_JHB100
+	default ARCH_STARFIVE
+	help
+	  Say yes here to support Peripheral-3 pin control on the StarFive JHB100 SoC.
+	  This also provides an interface to the GPIO pins not used by other
+	  peripherals supporting inputs, outputs, configuring pull-up/pull-down
+	  and interrupts on input changes.
+
 config PINCTRL_STARFIVE_JHB100_SYS0
 	tristate "StarFive JHB100 SoC System-0 pinctrl and GPIO driver"
 	depends on ARCH_STARFIVE || COMPILE_TEST
diff --git a/drivers/pinctrl/starfive/Makefile b/drivers/pinctrl/starfive/Makefile
index 213002da9cdd..351fce524fec 100644
--- a/drivers/pinctrl/starfive/Makefile
+++ b/drivers/pinctrl/starfive/Makefile
@@ -11,6 +11,7 @@ obj-$(CONFIG_PINCTRL_STARFIVE_JHB100_PER0)	+= pinctrl-starfive-jhb100-per0.o
 obj-$(CONFIG_PINCTRL_STARFIVE_JHB100_PER1)	+= pinctrl-starfive-jhb100-per1.o
 obj-$(CONFIG_PINCTRL_STARFIVE_JHB100_PER2)	+= pinctrl-starfive-jhb100-per2.o
 obj-$(CONFIG_PINCTRL_STARFIVE_JHB100_PER2POK)	+= pinctrl-starfive-jhb100-per2pok.o
+obj-$(CONFIG_PINCTRL_STARFIVE_JHB100_PER3)	+= pinctrl-starfive-jhb100-per3.o
 obj-$(CONFIG_PINCTRL_STARFIVE_JHB100_SYS0)	+= pinctrl-starfive-jhb100-sys0.o
 obj-$(CONFIG_PINCTRL_STARFIVE_JHB100_SYS0H)	+= pinctrl-starfive-jhb100-sys0h.o
 obj-$(CONFIG_PINCTRL_STARFIVE_JHB100_SYS1)	+= pinctrl-starfive-jhb100-sys1.o
diff --git a/drivers/pinctrl/starfive/pinctrl-starfive-jhb100-per3.c b/drivers/pinctrl/starfive/pinctrl-starfive-jhb100-per3.c
new file mode 100644
index 000000000000..0643bd147210
--- /dev/null
+++ b/drivers/pinctrl/starfive/pinctrl-starfive-jhb100-per3.c
@@ -0,0 +1,117 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Pinctrl / GPIO driver for StarFive JHB100 SoC Peripheral-3 domain
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
+static const struct jhb100_pin_layout_desc jhb100_per3_pl_desc[] = {
+	{ .pin_start = 0, .pin_cnt = 11, .name = "gpio", .gpio_func_sel = 0 },
+	{ 0xff },
+};
+
+static const struct config_reg_layout_desc jhb100_per3_pinctrl_rl_desc[] = {
+	{
+		.pin_start					= 0,
+		.pin_cnt					= 2,
+		.fields[PAD_CFG_DRIVE_STRENGTH_2BIT]		= { .shift = 0, .width = 2 },
+		.fields[PAD_CFG_INPUT_ENABLE]			= { .shift = 2, .width = 1 },
+		.fields[PAD_CFG_PULL_DOWN]			= { .shift = 3, .width = 1 },
+		.fields[PAD_CFG_PULL_UP]			= { .shift = 4, .width = 1 },
+		.fields[PAD_CFG_SLEW_RATE]			= { .shift = 5, .width = 1 },
+		.fields[PAD_CFG_SCHMITT_TRIGGER_SELECT]		= { .shift = 6, .width = 1 },
+		.fields[PAD_CFG_DEBOUNCE_WIDTH]			= { .shift = 15, .width = 17 },
+	},
+	{
+		.pin_start					= 2,
+		.pin_cnt					= 9,
+		.fields[PAD_CFG_INPUT_ENABLE]			= { .shift = 0, .width = 1 },
+		.fields[PAD_CFG_SLEW_RATE]			= { .shift = 1, .width = 1 },
+		.fields[PAD_CFG_VSEL]				= { .shift = 2, .width = 2 },
+		.fields[PAD_CFG_DEBOUNCE_WIDTH]			= { .shift = 15, .width = 17 },
+	},
+	{ 0xff },
+};
+
+static const struct pinvref_desc pinvref_desc_per3[] = {
+	{
+		/* gpios */
+		.pin_grp = {
+			PADNUM_PER3_GPIO_E0,
+			PADNUM_PER3_GPIO_E1,
+			PADNUM_PER3_GPIO_E2,
+			PADNUM_PER3_GPIO_E3,
+			PADNUM_PER3_GPIO_E4,
+			PADNUM_PER3_GPIO_E5,
+			PADNUM_PER3_GPIO_E6,
+			PADNUM_PER3_GPIO_E7,
+			PADNUM_PER3_GPIO_E8,
+			PADNUM_PER3_GPIO_E9,
+			PADNUM_PER3_GPIO_E10
+		},
+		.num_pins = 11,
+		.range = BIT(JHB100_PINVREF_1_8V) | BIT(JHB100_PINVREF_2_5V) |
+			 BIT(JHB100_PINVREF_3_3V)
+	},
+};
+
+static const struct starfive_pinctrl_regs jhb100_per3_pinctrl_regs = {
+	.vref			= { .reg = 0x00, .pv_desc = pinvref_desc_per3,
+				    .num_pv = ARRAY_SIZE(pinvref_desc_per3) },
+	.func_sel		= { .reg = 0x3c, .width_per_pin = 2 },
+	.config			= 0x04,
+	.output			= 0x30,
+	.output_en		= 0x34,
+	.gpio_status		= 0x38,
+	.irq_en			= 0x40,
+	.irq_status		= 0x44,
+	.irq_clr		= 0x48,
+	.irq_trigger		= 0x4c,
+	.irq_level		= 0x50,
+	.irq_both_edge		= 0x54,
+	.irq_edge		= 0x58,
+};
+
+static const struct jhb100_pinctrl_func_maps jhb100_func_maps_per3[] = {
+	{ .func = "gmac_mdio",		.val = 1 },
+	{ .func = "gmac_rmii",		.val = 1 },
+	{ .func = "gpio",		.val = 0 },
+};
+
+static const struct jhb100_pinctrl_domain_info jhb100_per3_pinctrl_info = {
+	.name			= "jhb100-per3",
+	.pl_desc		= jhb100_per3_pl_desc,
+	.crl_desc		= jhb100_per3_pinctrl_rl_desc,
+	.regs			= &jhb100_per3_pinctrl_regs,
+	.fmaps			= jhb100_func_maps_per3,
+	.num_maps		= ARRAY_SIZE(jhb100_func_maps_per3),
+};
+
+static const struct of_device_id jhb100_per3_pinctrl_of_match[] = {
+	{
+		.compatible = "starfive,jhb100-per3-pinctrl",
+		.data = &jhb100_per3_pinctrl_info,
+	},
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, jhb100_per3_pinctrl_of_match);
+
+static struct platform_driver jhb100_per3_pinctrl_driver = {
+	.probe = jhb100_pinctrl_probe,
+	.driver = {
+		.name = "starfive-jhb100-per3-pinctrl",
+		.of_match_table = jhb100_per3_pinctrl_of_match,
+	},
+};
+module_platform_driver(jhb100_per3_pinctrl_driver);
+
+MODULE_DESCRIPTION("Pinctrl driver for StarFive JHB100 SoC Peripheral-3 domain");
+MODULE_AUTHOR("Alex Soo <yuklin.soo@starfivetech.com>");
+MODULE_LICENSE("GPL");
-- 
2.25.1

