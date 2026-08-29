Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2133.outbound.protection.partner.outlook.cn [139.219.146.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C950D1F936;
	Sat, 29 Aug 2026 03:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.133
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787973242; cv=fail; b=eGZ9lWiByVXzB5di38OINbWujgW9eP+ZCB+jQFwgNgPkRJSbfJR97n0/cBvysTSaNn/FBFvKMqKke0ayV7z6Fz/LSwk/cauysfl6T/AlSBaZJZNecT5t4G6T0MvbQmr/wRLChZG0dBUJTcj63N2/lxD1ZDtbtpMP8/Qkx4phXxg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787973242; c=relaxed/simple;
	bh=uGvZZ19lgxrn5I5uHULMRRBT7kxm+rw7yBOkroqP8RI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=kf3A4It7MPDCJ287ths5SpjVFIx24QSloKdc4udflyvilnrOQTckuJ1h+yK0/8GgHLyPx6bwTR27y6K1V7v8UaQ9S0zcOhB3OYuhbvCzyhJGpNfI+EcJLDhIZiY46l9vafqqJovaPuTBK8s3AFjEWW2afLGttzxmghF5im99BRo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MjM8IyaTf+R3kjF3FDdYu+Skp3gcYKud986grdAvLgr1FSHYij1UlVOIGi1XwyDMOxVdbdpaqSzR4k29toqaLvPwd9WfQpuPW5Q6I/mpXZQRnyhWLFWbhKdoLbecxibGJJnVc2717JqTFOXID53iILDYqfvczBb79/SAY/5E5zTy6e3CTlJin9OvKszGjiF8cXsPMefmX1pKBM6fh1GYuvU5qvr+jDx3km41waFpLJqaDwRhpxdoxg+o6eFjPdC8RnEwH/7aqjYGvzaioUCTzf2wrKavnFh4dy2hT9iePnXWGMYR3C6vmN4VfAWKlB/Z7xEk7jsJ2ySNNTYKjQFRyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+3v+74vGZdHYmguQP0OqfE6/Bc+3dsl25nv9n+BABOs=;
 b=ULexoahOYGxyJ+IvjMdmVsYxLRRnDvWhonfK+rRXrhNpFv5FLRpQlbhZADTOANv/C39e5DOKDw49jtAVrUKjEsSrv9csgN01+cOdwnw02P+C27w1Xanw3fQVYvshy5pErPQv13tjkM/iw2Wy0V5KW4XJXGOjPdy5puJ4zwTR/hWZ+JnfSFpD/VDBSew1B/B3Mj83mreI7/Z+WDL3WM0ufU4afZyu3oHCYOu1G+IJScxEPlkcm2KmOsQLCfasH3RsTnsm/XadYBJaGB+czFvZYKkBsPHvoTyjaowumlyLfR88JYGY77DUMtL4oYS3UMxWudKIMBCI5bQxM7Kr5kvJcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1153.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:13::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.19; Sat, 29 Aug
 2026 02:57:52 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0315.011; Sat, 29 Aug 2026 02:57:52 +0000
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
Subject: [PATCH v6 14/21] pinctrl: starfive: Add StarFive JHB100 per1 controller driver
Date: Fri, 28 Aug 2026 19:57:13 -0700
Message-Id: <20260829025720.23915-15-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260829025720.23915-1-changhuang.liang@starfivetech.com>
References: <20260829025720.23915-1-changhuang.liang@starfivetech.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: NT0PR01CA0020.CHNPR01.prod.partner.outlook.cn (10.2.8.16)
 To ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn (10.2.3.102)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1153:EE_
X-MS-Office365-Filtering-Correlation-Id: 740205c1-447a-4441-3406-08df05795184
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|7416014|376014|52116014|3023799007|18002099003|22082099003|56012099006|5023799004|6133799003|10067099003|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	7FHCJYOxSnkIlkkRu3qw3JtwTjKSheW/T1NjzKwx2+7sLGjYQFAZ6ZLjSRkB3HXroW6wFI4w3CNWJ/mCre7yzPUyTqINUfFuO9t9x7PWGI+L34k17CxenApz3ij0T5SOkavvK1CVI/m8yQQC6U4e13tJrR2+9kqKT+bDaYeGA1t7ekKWvq8WJOF2e8PD0BgXo4ykgYWSOwI8GYndidOlVfaC81BHPN+nNL3TH/HhZi2MBYhylwp4J0RZvhayCtJ0JtCLsSSCCrxpjFCM7/1v1lrhtSBmAf+BCOSVRLj9N0FR54PZez1kfq3AvyeIEj9Shwspm38TyKKPdIJf5PGv5sP/p//xKxkAM2NCIvvh+IVSuHktJvOwsswBofLT+ufWY9eTetP8eN2Fi6gAQtDzgfECREGiUFIfRzWh3M6P6z1n8uQupXe1mcTnswzTurSzjO5Vdpf0R0iwa1xiFFJsdnXoJ5zZEGbY99EhVgLLKKGx9LVqK3BkEH5u+HeZcSyxZi2LvpRmQr75OUkQn+6tIgi5hBX3qUo6SuW0fdGVlLacKYeWSd5kXFABRhc75WC0kyxeGw19kKISnJyfea7Qyw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(7416014)(376014)(52116014)(3023799007)(18002099003)(22082099003)(56012099006)(5023799004)(6133799003)(10067099003)(921020)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6h0xTjtC65Yn0gM0HbPHCS4aXP9ADMcIdZdZB684Dz7TISwx/ghv2ercLOD/?=
 =?us-ascii?Q?BnN0qhbdY3sPVp8DvBJ61YXJvQuaeWm1b9NYDYJn8EM2lyUUFbYCV9+IQzLB?=
 =?us-ascii?Q?Ls27UUGy3HBByWOSrSDwz3mQu6JdMd+5+Ct0PwCewjI4xdqcoNT7rihMzaj8?=
 =?us-ascii?Q?GUZJtZ9VnIZyPn+/QoZ9OIVGYuqEwUJUYQGop4dlzgvADNO8QF4jrABcRnqC?=
 =?us-ascii?Q?sJ8tbED0Xhjr0tRSYUzppanikMp4RV2gLeiCR077gLEjGMPAeP8T5bwdrsmH?=
 =?us-ascii?Q?/CaD8N1tjx9at6UFPj3i6jwEaaYcsNkgPgokXOMTG5Q8TmbLcGzJkiAb2+r4?=
 =?us-ascii?Q?t2Ul7NWyKS1lyWNaYiZSt+341+VDqaxU5U2aERra/FlvBAt7v8qWM1v+be8y?=
 =?us-ascii?Q?trMj/cVvDMa/je5ZwrZGPXStUemxC//BnHqYLHnSeghj0ZjnFAsoW8ivf4Ff?=
 =?us-ascii?Q?FBwWhJOYWvOwW1RI4WFFefjy+MccWJQ3dZOMEaaeDLW3ZrvBMxe3fY/Jo8As?=
 =?us-ascii?Q?qvSKLQIqkAdc4UyMki30xat+b635z46JPY0jXMdtZYb7k83C8BT9cROTtgmJ?=
 =?us-ascii?Q?cP0ywB7taU+ZtlysYRpFAYh7AQDkwNmf5CSnb7pN96VG1I5o2TUoCw5eSKrM?=
 =?us-ascii?Q?btWvyCbM68jIJz5Caci15R/a6t//Hgg+Box0ePTMl/UrEvNoj/bjGYe4h5P8?=
 =?us-ascii?Q?STHgOjbF8hsYu4etBYSeOo5uxbhoiiTT83sfqgBlMCVu9BSivVODakQyLJ3T?=
 =?us-ascii?Q?HgDASCqV+cSLLRO/kK4KqxZeIh82Dx9tAy+cscV6zqqqWFCAxq9Xe2sGeIcm?=
 =?us-ascii?Q?ahbd0Dd6hqtx6cF3/45EXSPYDWlHbtvVT6+V4UMboupY0/xPMgs/s8SIqKlb?=
 =?us-ascii?Q?6i+/kT5nbUKtgAornI3we5NByhxbVa9ZKF4xVciesYA4UuN4RLDdNax2FLAk?=
 =?us-ascii?Q?bIyjFNi+vXt8dLNG2MhhVQ/qJ+zxUstxdAKkrzt2Ws3TGZTfi9Y4tKmxTEN/?=
 =?us-ascii?Q?trYlZ2mS8Z717qsD/akGmRqfmyhcuGixwkjs6IlZJT1b685NKUDcLlX8xf9R?=
 =?us-ascii?Q?/1BihYT/C4LadE8g7gMDbU8gsFlnDQMZQD0+DCSaiSbubRoAs5HB3vxmo1w2?=
 =?us-ascii?Q?XAu/uun3KNVvmm5rZEyeYm1Ff7NvP7DBwTxCLGoUn8OnOJJOPw7hlOMzJjgD?=
 =?us-ascii?Q?HIrw5O9ZECgflyPy8/q5XOqDcGe8cNh2kem5wnt4se423VCbMReqVUAvFYfE?=
 =?us-ascii?Q?KDVe2E91PuoTxNO0zxMl/oF2hMVYeysCrQIq/nEF1l+ewO34IiOBNq0j82dF?=
 =?us-ascii?Q?TN8CKrfmYJ2O6itC9T2jvTp3gRCCETLHxgUk14UILLdyBOoAbVdXDpAWT+0R?=
 =?us-ascii?Q?mW/T8qrTQBi+fUI0Dtz6Jo2yumQx6FyXldxU+XBGQvqkAwBnn+il+Kk4ZyqB?=
 =?us-ascii?Q?cP7JLl6Ebfx+wh+AjVjEkFuE4JYu8c1YVP85J8z76Iy7s4THI84p+rJ7Hvzy?=
 =?us-ascii?Q?+zHs9mxhc0BNzgwO0vr08hL3gEzQ7EYwvCV7KVgJZW3eH9owL4VUqQzwqv9X?=
 =?us-ascii?Q?3mTScbr9M+BcgaviYxr2vGpEMSBdIFyI98hWsDlf3q2jggvZzUe41+l34bsG?=
 =?us-ascii?Q?WhCRWgdD/5xqWiVz8YV5XL7eHV6jZipep8IpXMk7pDVUa87J11Fpje1wlgQ7?=
 =?us-ascii?Q?ZMGTLA2rS2IeWmo3gr7Hb696a1MdlIPeLfgCwXSRKnZ3pz6ZWTbwhitPmmWP?=
 =?us-ascii?Q?yzRZ6KHFUrb8lWOWk+Ooay+RKSQ7HlyoEHbu/M5H6UGlnzqYp259?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 740205c1-447a-4441-3406-08df05795184
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2026 02:57:52.7537
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W/kmjf8XMzMfHyEXkIC1zMQ5FEWkL5thpImlwkUxSXKeG3LHy3S6wpeGeOmHAVSBUdzTJnrUEJ7Rux+Me9vuk0/Tb65EVXyv/nnDDTDpGFSwbCDccUMpIzmK60vFnmRb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1153

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
index ddd39807e222..0fe2d21ba402 100644
--- a/drivers/pinctrl/starfive/Kconfig
+++ b/drivers/pinctrl/starfive/Kconfig
@@ -68,6 +68,17 @@ config PINCTRL_STARFIVE_JHB100_PER0
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

