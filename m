Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2114.outbound.protection.partner.outlook.cn [139.219.146.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D37B3BE635;
	Sat,  1 Aug 2026 07:28:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.114
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785569293; cv=fail; b=npBn5XH/p16VtF4fb1+zloRmbF8kGrmCLDKbGuFskEaM1/AQTUfMyhojcrySocl3COKqfg4hUx1dQrxNflYwIrCrx0GGDazjDSLCFmMEPqmxeyAr0fT0HDlAEqA7uz52U540FgF/nvus28yGIws4k72+B4GbPtnM2SOjYQCdNY4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785569293; c=relaxed/simple;
	bh=rCRq8sNp/vuFROzk+4OmqFrbClui1pD1rmRy1edtmKY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=OsIvUgMYZOHVH25ai4cvGuZEtPsvv68xx6McFX6o3gsJsnIlGyLuzs1dwfVKH64eaikfDgLVerYvL3JaVAUxajCObQqyj1VDtVTuce+zPHwfCjD0L83FzwfPdzowRx6ytO0FdT/XI17CGk/p1XrqTJ5S32ZWXZyIuXPcLqVFXQE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Im5V7RuDBRfLIga4/rtJhRlqQXM0lUNIR8bZmMoMuV24eDa+wYdRbBPU3ipTJVAQyMmrsU/steQW4e5q4SIeC09ClOxxc05s9LWW8Ya7zoL9BLKGKg9q6uyViT1J9Ly8cj+Cvs/79xdOu6JPl3Du71kUqFUWd97FWDjhn8tJvuQgeMLSw03RLUtNatXKj4OWnCVyQo4PKvisF4LHLVbVnTNzGn6nPvRJO3fKVo9X7naHyxGv/yAUwB06oqYB4JRzEZUajrfWs3n6bdsQfa9qahqLxm10xkQwPyuvS0zcKG5DMAGXqFrXEBa8253pPhzQmmtTq43a/dyujixR/wSZUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mPepwZ2f3B9JQHxf9a5yhUARhPHUNgU8p3f5FPdd4I4=;
 b=kB/OjD5U5rPw7GbUXLER/NAlNQNT/IOPO9gcPvZf8IITHha9Qo1/kvVSYBl8UNWbz9YTp4TJYrw2C4L7WKJb8Z1Fcjqyovr8gKELWdrPhtxiGbfYgXd8kdrvtvQ+PCoXLyo+Nb+tBIQt15eReTScTSnV8LuhlR7WYVzMwX+rNeRY54pklaF2g9aC2lOGJXOAUKEWKhh5B+w0uoOqprDSGElYsZKV+Idm61kD5BV3apINuIrFu3Yf/mUzEK3375A77nQTTdvpog4vRm41a8uIJrdjYGhHLudzaTxWBrjvowN1WlgK0pDiUwwaltuvsHzECtuXeTEZBZoewEOMIlldOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1138.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.16; Sat, 1 Aug
 2026 07:27:47 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0270.015; Sat, 1 Aug 2026 07:27:47 +0000
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
Subject: [PATCH v4 20/21] pinctrl: starfive: Add StarFive JHB100 per3 controller driver
Date: Sat,  1 Aug 2026 00:27:10 -0700
Message-Id: <20260801072711.153217-21-changhuang.liang@starfivetech.com>
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
X-MS-Office365-Filtering-Correlation-Id: 1a575097-af66-4669-fd83-08deef9e628b
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|376014|366016|23010399003|1800799024|6133799003|5023799004|56012099006|3023799007|18002099003|22082099003|10067099003|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	mMw7Jwb5k3LYvd9WaH4iv23owRFTnUMQtuGJEQH7ftXyyxJOOs92u2uPrBfu3l083q0H+Ok3MYtliH2j8ackBVERjbv26waCU54yKRKZhihSIv88pISz5IX8Fs+ZDH20EYVYpuUYbHi78fKWShfb5yTZHjnuSVJLlYhi2ynQ8ZpmmEpHh98yy7grollC0qg7AsmWTmH8Gn4uvnMK/pVgCSDYJYdSLmJYUApEIVk0HFuHH8iHh5kKeDePlGBMcDBR4GpGoYV6cIeqsXKWf85udYTViR33vPne3w2JEkFRFSDr333mfdwfIKNrA8VmasU5D4isNDklV4TqmX6zur2RETaWF6DGnTh7vwqghBck9dAwCby7C+aOMWVSX3g1Cowg3l2sZS0KSP2MtFzn7VH0u1YJqoAEqkI8+vAo3xe3R1Lter6sk62kMjWrGyr9HwzJ0q7K6zxmo+fJc0zRQL+p45u9FcQZUwiqDFcBc7se+J5kvLjAjd7RXxyjPS72eFCZ7JUvK9Fp6P8Wyh3oiH//Ki4PJ6cHd6l0vbxilxjfUQOAxOvPJkWVkK2j65zwNUgkjs+T2+3KMfFDi1j8savlhQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(366016)(23010399003)(1800799024)(6133799003)(5023799004)(56012099006)(3023799007)(18002099003)(22082099003)(10067099003)(921020)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?957BCisyAefjO9DBbm+KIYYYYip6K6BFxf6l+OpHBDRYhYi+ItjFuScyN5SM?=
 =?us-ascii?Q?PSaJ9cdMd9zL9nJ0VmhLTQtiHIj8Hse25IjYMlhqAXrtXP+bUsJn5c9+yn+3?=
 =?us-ascii?Q?2+pnmFDF4mcMYOLtQjoPOIcJZBFi4yIRZXI0pHA7sFAMAIkCq71D0NYsXT/+?=
 =?us-ascii?Q?L8wq082Bq1OaGLsX/EMvmfToc49pnsbmhvfh3hIFGdoYbeqUlZShQkWavPuY?=
 =?us-ascii?Q?bE+4llSlpAQeoBfvfCQTASUtVHQAqFbUolRQ0p8NqiIoFAX9d3RGP/7nCgTI?=
 =?us-ascii?Q?c44WgvquQ4oseVO6uaPJDIWdSk3esgFsZzg0gC3XWkdQuuTeQFpLJNC6/gC/?=
 =?us-ascii?Q?xnFaGDFggjYul8S6jw2I3Hy2qSZ6XXd6qcWiKmRIaN+qubiS5lFj33lIYiVm?=
 =?us-ascii?Q?6tUjOYBlQWr5aFBhk23slfxBQIOBEjn6xLlYSdez03HMN5mUHhJ2NL8n2b+I?=
 =?us-ascii?Q?baAieBRYtJLYxjOyVL0N4YzEK3g95+eOg6ojZVDVNSGNOkfU5DzfuQsU2ptc?=
 =?us-ascii?Q?8p+zRAgO2DjbkOrrLVK420u3wrfv792CZze/cHk3yzkBhk6LvrT6THWdrq4v?=
 =?us-ascii?Q?KmXCIORRHnj7OjGtbfcrialHIo0eSFVmlbHw7H5MIcIVPNcC61rtQqk9q65d?=
 =?us-ascii?Q?sRHcBv4wi89JaK9a9L/EuC13r2OsywM7QS0obzK9hheY0pNLt31lwuUzslmz?=
 =?us-ascii?Q?DXv1eaEHowkYVqYfE+d5xjvIP4L10eDkTk79fmm7th+eppuDLS76yQZPBf9i?=
 =?us-ascii?Q?UFjdoAywoDmjbmmevkjjmsHl6qU4H59guhhWhE80bkaCp4ZWd82Uxt320uqS?=
 =?us-ascii?Q?q5pMusuIDyeo8A09A0RTml3iEAuSVhiXBOCRnAMABXVBHNwRx0iBtmIFSqcO?=
 =?us-ascii?Q?Yr/rc/QSX173pH10VY0eJkvVuxzF15k54rS/V8VWNozYSaDvO9rryBrsUyx7?=
 =?us-ascii?Q?WYHeI4meaqc/wEAcShqySAFiqVLSd/1RshTWBoYPHvvVXTfMVOERzMneUncH?=
 =?us-ascii?Q?sI/0EnHLsp0spBCxOg1FqJWu4zrmhKhk/iaBwhfSDjzOmwTiBFVH1hnRv0be?=
 =?us-ascii?Q?zrfVDQ9KiqxS4yJdm9W9v3BJ4yopbxN6Az2CxnX98kk4OWkUq+lVW8Q2bxlq?=
 =?us-ascii?Q?842+e3B6VwgCGunNeY08eZWmyJqs6UBGPmedFQ/AcIO7I0KbKXqUVmxHYd5J?=
 =?us-ascii?Q?XUIvCUxpA9domTF9dTu10SUVnM2JJgM6Ml7qna16c1QZkrgEZ0laowp3soln?=
 =?us-ascii?Q?D+Req12wr0TWhmLuTIESG9EH7EJmbdL6oc3shjPRY1n+yNBS10wj/6IIF9tR?=
 =?us-ascii?Q?+K2a1a4QmlDkDBuHb4uUkNSSKimVHCJYxX0dgtQOvC1aXnRXzh/tsPv6Ocrc?=
 =?us-ascii?Q?dvha0/OJaHTNHuVIreg7P1h/b8e44eF1HouadAOwjERM+SMAe9HvfPhpZAeJ?=
 =?us-ascii?Q?1tHOxrJQ6q5fdkD1s/X8z+Y/WwCWNnY1oWcOSllmB6jKHsXDh2NIJmt0wdKW?=
 =?us-ascii?Q?YBYzZw37RZzLRPPLR2kjvdWnlsyiOJq7NRy1uXdcriXe8hpWLiVFhZTSHbu4?=
 =?us-ascii?Q?zaqScmye/K3UDUr6b+gWw5SzEDHAukXYJk46H19T90xDGF4A7dwiT/z+R/z+?=
 =?us-ascii?Q?IY0aNeb1Q//ILqSgVIaDSGVvMhcfrayMspFikFDfK5j2FVVrwZYG9Vil91ui?=
 =?us-ascii?Q?Zh3hGCB4UaRStBb+pHQJrhiTZaK/WlkhDpzCshAWv46HKByc03khV2nefKnn?=
 =?us-ascii?Q?bpAA2x3b79aQOjlR3ttq+B1A9NHui7W1mRDFlIc1QiQ1TXMuya+n?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a575097-af66-4669-fd83-08deef9e628b
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2026 07:27:47.1333
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yosk8kQ0qMoUSHS63FJL+OuuGkhwACPDDJcVwavDO/xt3Ek7mNKw7DchKAcM9MTfBB6XwicmzSsnc3xwG4MK84+x3GXEMM4nckMCcbfCJCAlknRYfYSqAxs1gYAGPFS/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1138

Add pinctrl driver for StarFive JHB100 SoC Peripheral-3(per3) pinctrl
controller.

Co-developed-by: Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
Signed-off-by: Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
Signed-off-by: Alex Soo <yuklin.soo@starfivetech.com>
Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 drivers/pinctrl/starfive/Kconfig              |  11 ++
 drivers/pinctrl/starfive/Makefile             |   1 +
 .../starfive/pinctrl-starfive-jhb100-per3.c   | 118 ++++++++++++++++++
 3 files changed, 130 insertions(+)
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
index 000000000000..e0765450cd78
--- /dev/null
+++ b/drivers/pinctrl/starfive/pinctrl-starfive-jhb100-per3.c
@@ -0,0 +1,118 @@
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
+#include <linux/mod_devicetable.h>
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

