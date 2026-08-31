Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2104.outbound.protection.partner.outlook.cn [139.219.17.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C00B73EDABA;
	Mon, 31 Aug 2026 11:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.104
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788176164; cv=fail; b=N13rM5hPh0dzB5UCHJ4AxdWI1hY1hU7w9V4N3xs5ENSlfFavhEBQli8KJC8n4TpnJz08BynBw57Ik9kNRL077BWDQCZ6TKtm0C3EnXAhW+XM+KlcTn/A847FP/MacqewbIT84QziFvJWvlZGkfqaTEyuWI20Rdg+sLaVLrGm4UE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788176164; c=relaxed/simple;
	bh=UhuygV5mNKv5jKEuWAQUaxjSqmxasTrXZVUpsCeArXc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=TI3u4L9vRLpLSaGnn5NDUV/3jiIcie8nF1JHJF26v5bZGoS+uXRdwWULiHCeEVxTe/Pt8//tPl0OopKe5K/UPzoeomjZ8ihnH+5McOk1Z4gWmstVS6akfC5ooNyFcVGFerWTpB0G+dtRyL0907sMQtP9ZHfUJqyNdKMi/HDIwsI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nCxKgrcDOOfPsIxn2s+tN+LxDSyGfv7C6g5mrTFxM1HAVo9uPfJA8ZCC3WVut2A7mxx/kYoSbFA4hMsYl6Y0VYx1Pau7PmUwatEHD8wlN7+WrXoN+WHkRNScwOOmcYqTaghMin8fCWU4PHXHP+zk0cp7ECW8RjAO4TPPrQM8Aznb6Po2QZ+oOlNUBobqI1iHTdvkcyDBUSiOMM1i9fBX/C6JGJ2AjneI4T6tJNnEAVIIr4AtHkgJB6BOxZ6j6zIToXc014yGoe5f1tgWOGGKOe7yJTqhwWlcM3f/J4Xat/ZAmzNmwYoe0RoIJwtOjntx8rNxgINrKCw8qr9s0Uzz2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SuUqFw5llJ2M7YTCh7J0Cl8RnmljSvel9k1XPHt5g4c=;
 b=VcA98kCcMMy28HUK9zw3zvLf9cwjIfHtvZhe9MxOCSQKKQJi7K036DkvjaaOSADc/87yqAHlIowiIv6XmGDPOrnr1KWRgI2fzjSZp2LZ3SYTBKxYmD5ZbZloFJt/g3ZOrYuLU6iOSaBk3+0gSDHN8Mh6TiGDwAU7ZMOnkY1W4T0oNOS/PITjxhOAo88Rq4vjvP+xXemoFxnGvI6KTvqISQ/XmdVjiZ23Jw3MRfv/q4EqsQLRvEwErNrUOn2/LnNvqZcNLniWNBOZGwtj/hdpm1BGJ3Fdn9XloCQ7mlSLFDPNSsZKxLsOezpFQ7AnBR/LPKkMw1OcEE8sx6ePfo4yzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1332.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:16::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Mon, 31 Aug
 2026 11:35:41 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0315.011; Mon, 31 Aug 2026 11:35:41 +0000
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
Subject: [PATCH v7 14/21] pinctrl: starfive: Add StarFive JHB100 per1 controller driver
Date: Mon, 31 Aug 2026 04:35:07 -0700
Message-Id: <20260831113514.66382-15-changhuang.liang@starfivetech.com>
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
X-MS-Office365-Filtering-Correlation-Id: d2c15cb3-91d6-4c3e-6fa9-08df0753fcdd
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|52116014|366016|1800799024|376014|7416014|18002099003|38350700014|22082099003|56012099006|5023799004|3023799007|921020|10067099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	cukHjtnP3jOnBho6D1IpescGz1FrQpRoa6eZBi6hYkj5CzryCtrCMU223eLsJPcT0Fju0KRpKzmWaZ6ejjg1xqHSKBjaBefhIQF0kZmn3D/qxigee+9ESjCudfJUZY2zi4ig+VKXPbdi5WSOcOIEBc707lh2chnlhXeGFLFzn1F5xuQXGBoAZpRlVex5tvfhalNi4LEfZSh30t855CkcpK/McgM4u15ZYQbyzYy0+hllFAGLhZx2is3qiRRapRQifuBi4YdU2gNZqS+ZonUYLz3gzQGOLhMxUlVCvlHZOXOtEikr8TtoKBMC5lrQTXIpt/OoAjvN9Eoz8jwgfTOH8p1Hxagh7x0BcNTBj3LN0CENb0jos1eZh3oyCjr+LvNHah2HS9DYXbFMRQfECC0P/hihOUywYIY6K8ureu9qNhjAEwL7shG7QEZ+1U49ay2d3B9OfAEdODgnvkvtoa/mG6DtPiwxuhDvYzntgLzFTBy5b9KNUuEMJRioyofceNEWXvgcJrATyypRF3J9lzvN3nC5fh7aUHo//ZSQHlMnkG+TtfVMDDZqhBPifZPOUXWLDZp8rZwYhl3Ppb9puH+dXQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(52116014)(366016)(1800799024)(376014)(7416014)(18002099003)(38350700014)(22082099003)(56012099006)(5023799004)(3023799007)(921020)(10067099003)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?fybehbj5EE9mlZByyB5cMMAblGJyeNcrzcGA0FUBeXZm35pfMmZL6pYSNbrR?=
 =?us-ascii?Q?LZdIp7KzF9LEQfD6zVGqJhBd0su2LM454vrp1Wcp93Tf1BNNdJg/5jyk3ifW?=
 =?us-ascii?Q?sT1E2fMmzdglTKjyiVeg+4UWu9tIQuWinVxmEsSnLM00BlP830AYRA5WjwnL?=
 =?us-ascii?Q?JxqRN7jWYC7uAtjYYrvDpOoch4FMMvxp8N78620Emv1jEtcXrqNFwCkqTaN4?=
 =?us-ascii?Q?GcPJIF4Nq+u/aHZcVPi2EPLY9fi+wP5UjtF+9s7cAOoZYMXK+bCL8J3hCNqi?=
 =?us-ascii?Q?cMvEoWqTnwXVR8Bdf4DTvQKLC9C/NsMo3jRN0LG2UNSNtMBGRuwRpZHuVvyX?=
 =?us-ascii?Q?fXCR3lRj1sFn5RAY6+uN3wVmpSk01QCjrbEh2My8xthklYVAzQ+8fbusFE6F?=
 =?us-ascii?Q?dEGq+HtOcOuK6RH3b0iCjU25MrEmsoT8soKGfwv1Is4Ch0+24pYjNvx2LU6i?=
 =?us-ascii?Q?l9FsnZDEE0LefiNvx//96gZh4WhTZmkLgYoxFT/n7gyvwLSrZwRIsVFzylsD?=
 =?us-ascii?Q?b0qZD/OB4avC5BsRIFOpMKMMB+I5HPTqj6fMye/4qRWtGeeMNtRd8ABUzHFZ?=
 =?us-ascii?Q?94ds9zxu4iU3oVL9PyDaK+0wMjTqi20To5CkB57T41kkzdUx6RbXV8Mly6FF?=
 =?us-ascii?Q?UDWkL43LSl5VUJLvOpTpRmOEu8OrfJxa1XcufEEixJjaUl8qqBJdG3uSys+e?=
 =?us-ascii?Q?YaAKFqNUZQ+561Xlz9CkPKEgeT9sDcDQuPiN3moQyU3IIuLovr5P0qcawNCv?=
 =?us-ascii?Q?N6tqq3c/J+SbINEh2ElB4BZ8PhmjIN1JE7sfXnZ7tdE8mm8AHRMqMOgsi/iX?=
 =?us-ascii?Q?zByVkh7wVHS4/oAi88F/GK3d8pd05a6CCFYcX7SCzd3/h6WiIeH37HZaURI9?=
 =?us-ascii?Q?N6rHHxYWPnl/CTHZ+QnPhdPFJ2aWiuA4Qy6Pd0KKz3RKL2zp1Gt/5VgvWFTa?=
 =?us-ascii?Q?Jy9wkgU8z37w8UqT9JUC2tUeGRHZJG62hs8urRDFg++asoDvfOR6zreuNTlD?=
 =?us-ascii?Q?0BpmtoaxxV3IbmFu3IHAJDPPd4eqgDmk4trPMGFKxYCAajEhoALa/6dyZ5Pq?=
 =?us-ascii?Q?dgmwotNarwauPMbo+eoIB0/crMs1MXYB5F5eLmi8337sjEZj6cn0yPfQa9A9?=
 =?us-ascii?Q?YTgFs8EgmiarzOoApkvcUJ20xXjW4pPtiffmLDv9xoJUK26S5sIXengCmbjw?=
 =?us-ascii?Q?ciEslIcjPWLVEFcGsh9+Bs1br3m195C1yhQrEB6HPAYUc8S0gbXCmQM0T2JX?=
 =?us-ascii?Q?z0MhmAYBQq78lcy4/PW6sxOW9APQsjGMngrA+gITOPG+El7mB+93BnnwLDIU?=
 =?us-ascii?Q?l4lHmIdhlHr1oym56YWg+qdHU4xYPXfE+z1o6TnD0pRuCCpHkL0XzOAOrVF9?=
 =?us-ascii?Q?+rpmBI4D2yDzE/mUO919nCuUXkBhkw+K367QP30+RcexLhNIar7X7t4TwHPh?=
 =?us-ascii?Q?SMSis8W7ccJRCAznGakAZDh/jt5NZdUCbQucKLsCHHOHI2wZbJ3o6YSjZeKa?=
 =?us-ascii?Q?yJ9zu2+ZhX4C/rQU/nI0bP+tce4KI73dCHMF1NxZkzA1BM3GMV7frNuvVdS/?=
 =?us-ascii?Q?Gc59WEjuvj+emr7igrRR72i9vXQjnvFoId0+p3uR3z/Z8b4U1p4DgxyvSMMb?=
 =?us-ascii?Q?gdOo0wlOCMKbJeBUd1gpD5FKmhU5FDwEQSUUjZLVyuYFL5wKO8TkR1oumNzu?=
 =?us-ascii?Q?EaH3Ow3UBsknj6yuqsHhvXs8s32AidnLDcgHbOagI8at0u0Ct7kLz6He0UGD?=
 =?us-ascii?Q?dlmxfuMDfzFWoLT3FemkXMxvr8YTTQtoEaiWbSzvuR3q5zqS9N77?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2c15cb3-91d6-4c3e-6fa9-08df0753fcdd
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 11:35:41.6923
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I5PGfD6heLC9C7JT2UoqmX1p57pdurO1UCXSx4Z6Tr0lP7rG8uuFwI1yV3HWCwRYoZ/bSkjdGUr4oC+g0EulL+kvUjvGDSubcHI2L5xjbkCr2zplSwOQjlqjPJ9XWV5H
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1332

Add pinctrl driver for StarFive JHB100 SoC Peripheral-1(per1) pinctrl
controller.

Co-developed-by: Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
Signed-off-by: Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
Signed-off-by: Alex Soo <yuklin.soo@starfivetech.com>
Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 drivers/pinctrl/starfive/Kconfig              |  11 ++
 drivers/pinctrl/starfive/Makefile             |   1 +
 .../starfive/pinctrl-starfive-jhb100-per1.c   | 162 ++++++++++++++++++
 3 files changed, 174 insertions(+)
 create mode 100644 drivers/pinctrl/starfive/pinctrl-starfive-jhb100-per1.c

diff --git a/drivers/pinctrl/starfive/Kconfig b/drivers/pinctrl/starfive/Kconfig
index ff25bfcd3ff4..9140263eb396 100644
--- a/drivers/pinctrl/starfive/Kconfig
+++ b/drivers/pinctrl/starfive/Kconfig
@@ -67,6 +67,17 @@ config PINCTRL_STARFIVE_JHB100_PER0
 	  peripherals supporting inputs, outputs, configuring pull-up/pull-down
 	  and interrupts on input changes.
 
+config PINCTRL_STARFIVE_JHB100_PER1
+	tristate "StarFive JHB100 SoC Peripheral-1 pinctrl and GPIO driver"
+	depends on ARCH_STARFIVE || COMPILE_TEST
+	select PINCTRL_STARFIVE_JHB100
+	default ARCH_STARFIVE
+	help
+	  Say yes here to support Peripheral-1 pin control on the StarFive JHB100 SoC.
+	  This also provides an interface to the GPIO pins not used by other
+	  peripherals supporting inputs, outputs, configuring pull-up/pull-down
+	  and interrupts on input changes.
+
 config PINCTRL_STARFIVE_JHB100_SYS0
 	tristate "StarFive JHB100 SoC System-0 pinctrl and GPIO driver"
 	depends on ARCH_STARFIVE || COMPILE_TEST
diff --git a/drivers/pinctrl/starfive/Makefile b/drivers/pinctrl/starfive/Makefile
index f2bb0c35a2a0..6beef7e313ef 100644
--- a/drivers/pinctrl/starfive/Makefile
+++ b/drivers/pinctrl/starfive/Makefile
@@ -8,6 +8,7 @@ obj-$(CONFIG_PINCTRL_STARFIVE_JH7110_AON)	+= pinctrl-starfive-jh7110-aon.o
 
 obj-$(CONFIG_PINCTRL_STARFIVE_JHB100)		+= pinctrl-starfive-jhb100.o
 obj-$(CONFIG_PINCTRL_STARFIVE_JHB100_PER0)	+= pinctrl-starfive-jhb100-per0.o
+obj-$(CONFIG_PINCTRL_STARFIVE_JHB100_PER1)	+= pinctrl-starfive-jhb100-per1.o
 obj-$(CONFIG_PINCTRL_STARFIVE_JHB100_SYS0)	+= pinctrl-starfive-jhb100-sys0.o
 obj-$(CONFIG_PINCTRL_STARFIVE_JHB100_SYS0H)	+= pinctrl-starfive-jhb100-sys0h.o
 obj-$(CONFIG_PINCTRL_STARFIVE_JHB100_SYS1)	+= pinctrl-starfive-jhb100-sys1.o
diff --git a/drivers/pinctrl/starfive/pinctrl-starfive-jhb100-per1.c b/drivers/pinctrl/starfive/pinctrl-starfive-jhb100-per1.c
new file mode 100644
index 000000000000..ffaf3aaf94ed
--- /dev/null
+++ b/drivers/pinctrl/starfive/pinctrl-starfive-jhb100-per1.c
@@ -0,0 +1,162 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Pinctrl / GPIO driver for StarFive JHB100 SoC Peripheral-1 domain
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
+static const struct jhb100_pin_layout_desc jhb100_per1_pl_desc[] = {
+	{ .pin_start = 0, .pin_cnt = 36, .name = "gpio", .gpio_func_sel = 0 },
+	{ 0xff },
+};
+
+static const struct config_reg_layout_desc jhb100_per1_pinctr_rldesc[] = {
+	{
+		.pin_start					= 0,
+		.pin_cnt					= 32,
+		.fields[PAD_CFG_DRIVE_STRENGTH_2BIT]		= { .shift = 0, .width = 2 },
+		.fields[PAD_CFG_INPUT_ENABLE]			= { .shift = 2, .width = 1 },
+		.fields[PAD_CFG_PULL_DOWN]			= { .shift = 3, .width = 1 },
+		.fields[PAD_CFG_PULL_UP]			= { .shift = 4, .width = 1 },
+		.fields[PAD_CFG_SLEW_RATE]			= { .shift = 5, .width = 1 },
+		.fields[PAD_CFG_SCHMITT_TRIGGER_SELECT]		= { .shift = 6, .width = 1 },
+		.fields[PAD_CFG_DEBOUNCE_WIDTH]			= { .shift = 15, .width = 17 },
+	},
+	{
+		.pin_start					= 32,
+		.pin_cnt					= 4,
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
+static const struct pinvref_desc pinvref_desc_per1[] = {
+	{
+		/* gpioe-spi */
+		.pin_grp = {
+			PADNUM_PER1_GPIO_C0,
+			PADNUM_PER1_GPIO_C1,
+			PADNUM_PER1_GPIO_C2,
+			PADNUM_PER1_GPIO_C3,
+			PADNUM_PER1_GPIO_C4
+		},
+		.num_pins = 5,
+		.range = BIT(JHB100_PINVREF_1_8V) | BIT(JHB100_PINVREF_3_3V)
+	},
+	{
+		/* gpioe-qspi0 */
+		.pin_grp = {
+			PADNUM_PER1_GPIO_C5,
+			PADNUM_PER1_GPIO_C6,
+			PADNUM_PER1_GPIO_C7,
+			PADNUM_PER1_GPIO_C8,
+			PADNUM_PER1_GPIO_C9,
+			PADNUM_PER1_GPIO_C10,
+			PADNUM_PER1_GPIO_C11
+		},
+		.num_pins = 7,
+		.range = BIT(JHB100_PINVREF_1_8V) | BIT(JHB100_PINVREF_3_3V)
+	},
+	{
+		/* gpioe-qspi1 */
+		.pin_grp = {
+			PADNUM_PER1_GPIO_C12,
+			PADNUM_PER1_GPIO_C13,
+			PADNUM_PER1_GPIO_C14,
+			PADNUM_PER1_GPIO_C15,
+			PADNUM_PER1_GPIO_C16,
+			PADNUM_PER1_GPIO_C17,
+			PADNUM_PER1_GPIO_C18,
+			PADNUM_PER1_GPIO_C19
+		},
+		.num_pins = 8,
+		.range = BIT(JHB100_PINVREF_1_8V) | BIT(JHB100_PINVREF_3_3V)
+	},
+	{
+		/* gpioe-qspi2 */
+		.pin_grp = {
+			PADNUM_PER1_GPIO_C20,
+			PADNUM_PER1_GPIO_C21,
+			PADNUM_PER1_GPIO_C22,
+			PADNUM_PER1_GPIO_C23,
+			PADNUM_PER1_GPIO_C24,
+			PADNUM_PER1_GPIO_C25,
+			PADNUM_PER1_GPIO_C26,
+			PADNUM_PER1_GPIO_C27
+		},
+		.num_pins = 8,
+		.range = BIT(JHB100_PINVREF_1_8V) | BIT(JHB100_PINVREF_3_3V)
+	},
+};
+
+static const struct starfive_pinctrl_regs jhb100_per1_pinctrl_regs = {
+	.vref			= { .reg = 0x00, .pv_desc = pinvref_desc_per1,
+				    .num_pv = ARRAY_SIZE(pinvref_desc_per1) },
+	.func_sel		= { .reg = 0xbc, .width_per_pin = 2 },
+	.config			= 0x14,
+	.output			= 0xa4,
+	.output_en		= 0xac,
+	.gpio_status		= 0xb4,
+	.irq_en			= 0xc8,
+	.irq_status		= 0xd0,
+	.irq_clr		= 0xd8,
+	.irq_trigger		= 0xe0,
+	.irq_level		= 0xe8,
+	.irq_both_edge		= 0xf0,
+	.irq_edge		= 0xf8,
+};
+
+static const struct jhb100_pinctrl_func_maps jhb100_func_maps_per1[] = {
+	{ .func = "gpio",		.val = 0 },
+	{ .func = "i2c",		.val = 1 },
+	{ .func = "sfc",		.val = 1 },
+	{ .func = "sgpio",		.val = 1,
+	  .max_pin = JHB100_FUNC_MAPS_MAX_PIN(PADNUM_PER1_GPIO_C31) },
+	{ .func = "sgpio",		.val = 2,
+	  .max_pin = JHB100_FUNC_MAPS_MAX_PIN(PADNUM_PER1_GPIO_C35) },
+	{ .func = "spi",		.val = 1 },
+};
+
+static const struct jhb100_pinctrl_domain_info jhb100_per1_pinctrl_info = {
+	.name			= "jhb100-per1",
+	.pl_desc		= jhb100_per1_pl_desc,
+	.crl_desc		= jhb100_per1_pinctr_rldesc,
+	.regs			= &jhb100_per1_pinctrl_regs,
+	.fmaps			= jhb100_func_maps_per1,
+	.num_maps		= ARRAY_SIZE(jhb100_func_maps_per1),
+};
+
+static const struct of_device_id jhb100_per1_pinctrl_of_match[] = {
+	{
+		.compatible = "starfive,jhb100-per1-pinctrl",
+		.data = &jhb100_per1_pinctrl_info,
+	},
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, jhb100_per1_pinctrl_of_match);
+
+static struct platform_driver jhb100_per1_pinctrl_driver = {
+	.probe = jhb100_pinctrl_probe,
+	.driver = {
+		.name = "starfive-jhb100-per1-pinctrl",
+		.of_match_table = jhb100_per1_pinctrl_of_match,
+	},
+};
+module_platform_driver(jhb100_per1_pinctrl_driver);
+
+MODULE_DESCRIPTION("Pinctrl driver for StarFive JHB100 SoC Peripheral-1 domain");
+MODULE_AUTHOR("Alex Soo <yuklin.soo@starfivetech.com>");
+MODULE_LICENSE("GPL");
-- 
2.25.1

