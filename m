Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2091.outbound.protection.partner.outlook.cn [139.219.146.91])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69D083B38B4;
	Thu, 10 Sep 2026 10:04:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.91
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789034701; cv=fail; b=M8H/xkdueiv0XzsmeTT2pbSv2jpvYgp50LmvibnjKeH/ay96GwkWPnh+bQHebrDR+l5SB4bYowvkR5BMRSzz/v/GmM5rYgj9ssyfnL3+HAvoSTbjwlYns3uUcyEHqEowH2rIztGoslE7B6Pd6RqBX4jXn/2RPvc9tDM2T4/g3/U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789034701; c=relaxed/simple;
	bh=Fo0YEGEwHUYxwih0su0NZKkA253TS69SIYOQnHuiGLU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=LTLUS2ykgJo+VycbhSqiw7VxcXsWRmSc7lvQmn5Rn9JGFoXLyGxR6CoYxMVq8CZmjH/kUgpyFXxOBqGGuYQv2RLCbVfluD7qlSOM60miiJh2A/kgH10Vd62mhUlatqJXbcrceDh7fga/U99nnhLDJtkNk8uKSDGjUyK9OVW/GdY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GJaEMh/lMdMbFGdkOCegIwYhGqWQrgNpSPdZF4dsXFL54GjnJhkZejxFk2bicxT9Pgu9ORkr6a/tuj6c97ZgYyKxXJ5jB4Swv2G1ZNDtIU+52TGKZKG3MQYES+my2dzlqEPDeTXfNQO2cAJHvDztj/GHGwSxksypg+RshuOtYlo3KyL8PwiZ1+38DXU0wmmFGCNYlt8iPQih+N+CVbfmF2EWvWBkxfwxJ85PdP5PjVE2vCiNc6efSjGy2t9NRXl18ufxePN16fbx+8m8c/yxm00A3O3f8M7ludjPQWjWJN0lhpwyBrt51jZLpv9LkKsmL/crLwXY383rp49P3DQwTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xskOhsZs5h3MkAqIdKPoRjYqUgrNj6YvH8+1iNqkxT0=;
 b=cANTqn8+H3O/rUL5mbVGjStN7Yi6w43sRBgte2rUGK2jmoQzIccvLb0j1nidU8bmhTQI8cmn/jyVck6XCgM30ZgdVtEg5pl4/41kqXwZf6K2M6IRQYfhbRI18z10k33rZP6lW8PYdH4p0GqpukUysxL7mjl7M9egdzN4JyKjNJG0DHjg4vqI8St47IaTSPpIjoVOoujqu5n/O51n0e4CVtZkxwVGH4pYWio4rmqEF8KhA74xQSAqwBNpktTPSlOpxSoUcZNKWipxOfOn0H9IaK4+fH4+YqgM2KpMwAqWJQzVYG2oTFJbaFsJeMdKjTdCrlBcKXusN/ozoPYBFMlYgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1170.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.18; Thu, 10 Sep
 2026 10:04:30 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0339.017; Thu, 10 Sep 2026 10:04:30 +0000
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
Subject: [PATCH v8 20/22] pinctrl: starfive: Add StarFive JHB100 per3 controller driver
Date: Thu, 10 Sep 2026 03:03:55 -0700
Message-Id: <20260910100357.130134-21-changhuang.liang@starfivetech.com>
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
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1170:EE_
X-MS-Office365-Filtering-Correlation-Id: 4660e569-9ad1-4c08-bbf7-08df0f22e806
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|7416014|1800799024|376014|52116014|6133799003|3023799007|10067099003|18002099003|22082099003|56012099006|5023799004|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	Grnfjjyy2nVFnFBxFduHiHrP2DlvcEDo5IXLqyPVOEn8/X25sw5cdgSzgWQc8rMSDPqMfXt4wc4cZANfeHyXkvMqiLivP3yt0FEtS6SOw1P+1yvLugN+UWV6RfiSiLTtloEYe5RP7GlvW6QVyJi810FnIVqmXo2Y7/hDWsoV8VgeQT0uO2EGro0Vo9on3+utgZrBO9J7tLVcXSr/OGh020fPbJMeFe0wretHWHYcGl/3bw2c1UjWVX+lkLieCz+DTNBvnzTy7EfggDHDUHQVWLZ2mg4kVKN8Hs80MDdRTyWK5J651A/I70OKV9QW4mmURDQLETKqlPSrR962Ax9iUqO35JimfsMk7nOGDgFXc9M4cSXh5FxUinCy+vefR4K62YD4zkpZ9guRPzrAX/MGhbaEc0HZJRH6DwUnVmSrGr5H5ObL+QGNE188s19+k4nZaE33Tnn+BkUgXg5BjXyO9JzUhj4UJF2X08skXgUfDCUDvndYgofXtxUY+oZhyN2YLC3kKMj+5R7O9fQ+0igh4do/mkgg4HSjy1gB/7TyqpQIIRnC0CRXRZ9N68wG2ANg
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(7416014)(1800799024)(376014)(52116014)(6133799003)(3023799007)(10067099003)(18002099003)(22082099003)(56012099006)(5023799004)(38350700014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?qGB7sHsM0I+eIK4T/txcJzunjqtHn9yg22UEz5dcnpSevITGBeVBbaSiYfNE?=
 =?us-ascii?Q?JML7wYyKf591IWs46+FnsJOfOL7NAru59ckQr+8B1wt8gehikxIPsLuJMEX7?=
 =?us-ascii?Q?vr5OcN/uHbuIJtTFI3oidrup4fI6ccWtVoNc/cRdRmysddBo6oYuE59jqmC8?=
 =?us-ascii?Q?qz6LDhTclSndE5lhfnzfGgLfZpGgRkGGGYv5FDt2pCZVOPM/c9Yzn5CGEqtq?=
 =?us-ascii?Q?WhXgbzE2q6mvSXE8k4hdWf8mhcPoLQqcR4AJO5G5Kc3MEVFclzj4t7qTwMRX?=
 =?us-ascii?Q?AtIH0DJG8X4soW9ZV0YUA/CEwSBE66q0bmZHJ9tGKESlODQrD3DUX5P7JEzo?=
 =?us-ascii?Q?bjAf1jOfzcEvCskTamJiDAbJWOnLZXDcPv4uiD3XqRA6cjkJxcQto5LOBY+5?=
 =?us-ascii?Q?zIOYiEFff2JuTan/3yVGnL7TbMtxtvL0ROKLMY1XJAA6OJJxXs5JYPVbWAE1?=
 =?us-ascii?Q?iDK/GQTd1upPSjUtaK1NjDYiu8mF3KizN85+ACnY2jhXiho/IgnpfzPbM8ao?=
 =?us-ascii?Q?XKsKkaFAbC83bYYfvHj+UJQ9rsuHLXjaFy29zhvNUSOMcJyEx6JN2KzJGzXF?=
 =?us-ascii?Q?VRKrOJOpesL1A7+OSUx3DSgL8naH00xN9Tjguv1DVB6wzoZex20nRpgY74HG?=
 =?us-ascii?Q?YMF6y9+N/F+cv9M3KPyMYrJg9yqcNb40vQR/ODVbaecEtS+x3VGqc/RUYHNV?=
 =?us-ascii?Q?tyjYJ3WiQ1uTFrvjvCEA7v7ohzIJJRJu3M11KMxVatlBdBE0JByub9AGXndP?=
 =?us-ascii?Q?YUEjH2RVwy6Eu7N0dUCl+SJ3AL3jiRcoJTdSejqmlb2oFqdeUYl6Pa9lkfPV?=
 =?us-ascii?Q?qVefbmHNMsda5t7aX4s3yE9d5wO7mt3UDuPuegpGa7WhKyZroQWnewHc7Uey?=
 =?us-ascii?Q?4hPPsU3CLVrdDwaufL2kfHgBOXSzR6wfARzXmKGQgTmasUwilg+7dk0xZl4+?=
 =?us-ascii?Q?lTyj3laaS9T6XUKTuGoP3EEXOLAfM6RnGaav1HlWZ0iwHXE46DlgfPeWgnqB?=
 =?us-ascii?Q?MwY3Wi6ShHOiDaBc8AAZVYH+78+dyDZJQGbD1IKMomGzTPVj4BsU5Md8M7x4?=
 =?us-ascii?Q?yfbyTpgo9XxT50VxptZJoT/587JFvv+bDNxCnnhYQ6qlMTnot31Dw8qsrzB9?=
 =?us-ascii?Q?YN0hlTvf9bEg3XT6XDEkTLmhVg425VI5Z58H8iqZ1US8y0oprAKThUVH8CfN?=
 =?us-ascii?Q?cSnu5l2InR+wvEhOMvhm9+lavd1u29G9ytByxuAJZf3ARc2MISPBa6wecVTa?=
 =?us-ascii?Q?KZ7rAt4xNmGhd9TqKb06v7DvgbEHjerGg+iz3IJKxfDcHk26YAQAEuw1u5TX?=
 =?us-ascii?Q?SmZMoGj3tgRqawSB5fw0oKewCJy9RmQXQ1nqp+cwkYSr9Qdcw0QLuIf61wrk?=
 =?us-ascii?Q?DZL1tYh+x7hOPy+LIBRywXdsEWY7nl1VLSX+sX7J43e8GLNkPwYNLwESRxJl?=
 =?us-ascii?Q?r6z+9LHwoorhNucrmRyGBZe5BGuxy3tErXcbMvTSgGLRPxlQRZiwmz9O3NIW?=
 =?us-ascii?Q?oUozQ1NKZkN6SgGtUwjDRtfA58ED11NJY2u2HmVjbVMIqL4JojfqJPhBwnun?=
 =?us-ascii?Q?NDxwvw9vUnR8XxQ8Tf8o8N/2Hs6o2WcdpiL1ggJxVGJu09ZWIfq505UTmG2P?=
 =?us-ascii?Q?vtkjT0FOWGxD1tq5GiCJzybd45+QV/cC757cSCK7qDokXbyaYiSG/9HYCWo4?=
 =?us-ascii?Q?EZ5Bnt/DEwWWrkcI82dDsuoahjVEOCVktVA0+8JFn6mHtMFWb0UBx3p/sb13?=
 =?us-ascii?Q?deA/6EQltspaduAL9Px2nGJ9Xf2nrjxu8KbdYJnw7LOZy9zfJ7Bm?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4660e569-9ad1-4c08-bbf7-08df0f22e806
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 10:04:30.6879
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FSf9l4jcur3W+SEkw+iAIVmP1UyD36xzMW9YBVVrsI6ceOT+Qo2wtFllaWhqYGF14dsR0aYQS87rxkheOlPyMkg6fBUVXMl+YUwAi6T82cHPZn4p0oER3Ky60RC01uBm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1170

Add pinctrl driver for StarFive JHB100 SoC Peripheral-3(per3) pinctrl
controller.

Co-developed-by: Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
Signed-off-by: Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
Signed-off-by: Alex Soo <yuklin.soo@starfivetech.com>
Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 drivers/pinctrl/starfive/Kconfig              |  11 ++
 drivers/pinctrl/starfive/Makefile             |   1 +
 .../starfive/pinctrl-starfive-jhb100-per3.c   | 129 ++++++++++++++++++
 3 files changed, 141 insertions(+)
 create mode 100644 drivers/pinctrl/starfive/pinctrl-starfive-jhb100-per3.c

diff --git a/drivers/pinctrl/starfive/Kconfig b/drivers/pinctrl/starfive/Kconfig
index 426be481a3fb..11bd429b45b7 100644
--- a/drivers/pinctrl/starfive/Kconfig
+++ b/drivers/pinctrl/starfive/Kconfig
@@ -100,6 +100,17 @@ config PINCTRL_STARFIVE_JHB100_PER2POK
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
index 000000000000..24158d90f75d
--- /dev/null
+++ b/drivers/pinctrl/starfive/pinctrl-starfive-jhb100-per3.c
@@ -0,0 +1,129 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Pinctrl / GPIO driver for StarFive JHB100 SoC Peripheral-3 domain
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
+/* per3 pad numbers */
+#define PADNUM_PER3_GPIO_E0				0
+#define PADNUM_PER3_GPIO_E1				1
+#define PADNUM_PER3_GPIO_E2				2
+#define PADNUM_PER3_GPIO_E3				3
+#define PADNUM_PER3_GPIO_E4				4
+#define PADNUM_PER3_GPIO_E5				5
+#define PADNUM_PER3_GPIO_E6				6
+#define PADNUM_PER3_GPIO_E7				7
+#define PADNUM_PER3_GPIO_E8				8
+#define PADNUM_PER3_GPIO_E9				9
+#define PADNUM_PER3_GPIO_E10				10
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

