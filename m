Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2101.outbound.protection.partner.outlook.cn [139.219.17.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A48F84028CA;
	Thu, 10 Sep 2026 10:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.101
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789034720; cv=fail; b=qp1cEvHYjlisfvJyUZX4jnotnh8pX6IrB2uYAaiB36XppXDUlSGrsbY198/bsKsRlbXm8YkK1AHtuUou0WyIbCxp2ogPaeaMqmrzZc3zkUajl8oo3gzgcfNc8qZd4KtEFc68EkHPVHkU3O1mmG21o1sd+vdfztSc25F2l+fNjQE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789034720; c=relaxed/simple;
	bh=qSlUXPYZNxOCtsUl0TpTvoYnj5paczRSPiztqFoW+88=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=EYW5nPxoQftbLsAJYA6Odjv5nL+HllhrtAKgnJsMIQosA/t05mGf2eMSk20/FVlNxBAz/buUriFqpDsOIGomUyFYXqjYyGxKn9d4qJEUZGk/JvI7pwPeSKmIqaauV9MJLyhHelm3++wOT8o3OfBgYdoOQKI/itVxtGGSQAGToB4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T34QTzI/BUsHKU4KHDPg/aL2cjzsFF4nXxNq3JShX6RjTXENPxKNQZ82PRwp8lhSlTyd++9cYMACoFTQJxGHv3idpneWn/rHjk1C1YR72EwOu+K071NCLFnO3F2t4qtkb9SWPkB4Wj0jMkxxHeuU6Cuy2q6W1VLAO7v8dBgGWjNKuiZv6i+sAONsTIAaQmDphdbebQAy3NTZJBa4mDat5DSFy8l55wxl23CWvl8cQELqoXLSVmEda7X7k9OpG7n1T4d3QoOy2IXJU4scK1zo1QhiEdf9MJigI2GSYpY79fovO1PWyBWW5Bq1KjxxRxd6x4upycTJXkZh2qV0+VifiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lXtJCCnBbVQQd7Ujk5LwuIgnFm1fyJZWkDmzN90NeUs=;
 b=Ce4rgyz5PhEHgqZVmjApYzEecqDGd0weyd6ziQgORtow8BXSvwcbsylmqkoKTrFt+gRzetaicNpiuonh4Kew2FzL89vlKchEOSFzB8srzoAUuCUiQfT72ELWqpSKCRzBPmPWoilArwdIqEb7E8j4G8h6970Bsbg+wELEEx19AV5a2ampgQw3YdTOQAZSfPHCJkSeBF2u57E6HPrKtTUVm3Cc4Vh6XKWsTvFQl3cwYK0jzP4njm6/nO9PRoeTda22NI6Oofbfe9w8ryQ2/vASsG0+iycr7jGbs7Vcdo0z0WNdE1Gx4A9HJTQrRF1F8IeVTErQCO4Yzv3NX/YtnjJNSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1233.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:13::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Thu, 10 Sep
 2026 10:04:24 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0339.017; Thu, 10 Sep 2026 10:04:24 +0000
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
Subject: [PATCH v8 14/22] pinctrl: starfive: Add StarFive JHB100 per1 controller driver
Date: Thu, 10 Sep 2026 03:03:49 -0700
Message-Id: <20260910100357.130134-15-changhuang.liang@starfivetech.com>
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
X-MS-Office365-Filtering-Correlation-Id: a51e6e30-b885-4946-b980-08df0f22e439
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|7416014|376014|23010399003|5023799004|6133799003|56012099006|3023799007|10067099003|22082099003|18002099003|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	yLfToweAbdrHXVSUPAZoUXV6SzYnlJnYLdLbE+8RerXRZpGS44I3YVIs302R74M27fHHWDxREVxHLRnd3saApl8vT70YAGpGV0bF9dfhkplk/bLTzZHqBp1xbdj1Hki0d21PZCAoEG3FxQWjxjC5FhArbzLnNRX48Tghbg2Vd4rhlQX7at8BspJ5SrtfiI8u/thALy6iqo/CiTe+wb3G6K2MFzNKoQpVEajv/gl0DPvsf4EB5BnWK/h8nInZsxI/kjYyXHMX8Ukmar2ok1EVYCxMckdX8NIVYD9yLWiJxAjxKFmFPuvEqsiNoaCuX1JaGazoJtfrBuD4yn/4AXRBIOZoyCPIix6wA7sJHQ0UaMKCCuZAVFWw7thMByqqAlfgopY2B4J99CZ5/qKMiVJEVhZH48HG8aWQ+4N7xj/spxznokqirzG3+fplaGsigCTvYSbVOS9qYYdZ4eP7ntWC7isRkXwku8/dAj6trvz62aK2Q7NFIC80IysRr2ILYLGt5pGA1gGIgUCRQGR4NChm5zNkAFHcN5L7IdX+8NoQVmdOEWYxGsZSJVNFTVlExtQ2zT/iJiDkzYM8OzAEmEIBWg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(7416014)(376014)(23010399003)(5023799004)(6133799003)(56012099006)(3023799007)(10067099003)(22082099003)(18002099003)(38350700014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?jPn96aTXbx62oag8Qs8sI1OT/rMSk8VMXPhycqwzQmEDA3ok/IP2hEGKDJxT?=
 =?us-ascii?Q?JW6uRCM5BHYK3N2by1JrN3uCcvcgMeMqLLveTXcoFOx53E4qsKp0DeEE87FU?=
 =?us-ascii?Q?cyoBMo/jBGlX8jR/kERUTiaEG4ddCi1aJLe/g2HSHFPvyZvBELvJSERN0Zyp?=
 =?us-ascii?Q?wao8gw8m1PdtlSRXr2002AzjgsC89gepcybuvy6+YvEXKYMBsQMuXIejv2Am?=
 =?us-ascii?Q?wQnn9eujO+9F8tUAI+x6Y0h1OMD6sfzvn3Awh5K60SAhBqjh1oBnLAe6MN+/?=
 =?us-ascii?Q?eVk0t4UhEnNH1xLDe6EPBHb19xxgI1FNK1sBM7VNyjrieCRs3TGXngY3JCtr?=
 =?us-ascii?Q?MELnGdM6Y/IP8eJzcMlA+wC2VEBXoWNHd6XSExCIvHhrZls7PfeVkI7w9T9E?=
 =?us-ascii?Q?QMjP0E/9cWBU8TTrRO4K5TJjsw9kCwRT1E0/LfQPAkleuNwdaJEqhEC3xFrx?=
 =?us-ascii?Q?XHkqKvhI4PaHYOcOn/ogCb6VVjN3uucnfqOdHfoG93sM5A5D+n1X3ZkziGxL?=
 =?us-ascii?Q?cahw0oCp+OwpxH2EyWlEbaoG47hVfKPt+Sg+XzBpQSngp2gz6LpWUmyKFGKp?=
 =?us-ascii?Q?cA5AXrfZ4MXd7SVaoLEiLWEAT8hUqULmj2kbX4Oq7PFI/BpBvxaJMXemltUw?=
 =?us-ascii?Q?5F+IjfYrNmyKmjp1avnUWReQ6qZr4vuL0ne4NB15bvN4JS7/G8tXjVCCMCmM?=
 =?us-ascii?Q?/oyZaN5MiN1AlELNKqXEwvt2Ess7/mdPqng4z3h5pzSshcnpxFENq1IkJzUR?=
 =?us-ascii?Q?7MMXjrkGQgqEWkKztO5t56u3kNh9Vwfga7myAk8MJZnvFLgeQsCiJkEhFsNO?=
 =?us-ascii?Q?eOy8JFD96x5YcTdGSeSgiemkT2ylVM2qXmvIf7V49ui/Pjgq5APUgZhAqrRP?=
 =?us-ascii?Q?8LInWN5laMxzkGoWI6scqKm5CYTtwCW+Jq+KSn0WInWM1WOhM/ks9w/HOY6+?=
 =?us-ascii?Q?Ku2lrIYbcI3oh8kdDHTuTt/wRZppxf6oXJr4tK7ZmCTzkagt0uUT/SB6m6N3?=
 =?us-ascii?Q?M1OsHWshwPeL16UVUEGiz/14ysnTXNQf8oFjQmt1Ww6cSRq2G6jSh/8HusHy?=
 =?us-ascii?Q?h2ZGpj2mayQOyETPQNOcoyzd6t+HlQTw67bd5gV2T0gADs7I5TRRxZwwvjoZ?=
 =?us-ascii?Q?q90vnJuQHugS9Dvzt8g14464RxFQANSh5A9o7qccCmsMb5QV38vAg0bw4lpv?=
 =?us-ascii?Q?jL55+/cUb7PUa2wU1HfT8qOj1+84IvdnPHwRlMg4qz89rE7QBk48fK1lh0wX?=
 =?us-ascii?Q?dCN3h3AYQm6r64Arpxt5+mlaAkALSJR+azObVmI7bUI2bzOmLEnfNdy9CvcS?=
 =?us-ascii?Q?8mtiG7iP+nmS9iXw7tEwhPuiuCUlxifXTWToGpZwFx8dz+hg0CUhMaHzGV2g?=
 =?us-ascii?Q?/xVqGF/tmuEK/8cSiwM74sdWrmw+8lhGJ9X13HwAPZWhcuyBO8LFLKq1gMUk?=
 =?us-ascii?Q?fRgUzvb1JtTAVUi6iPYrxo2aFZGLZzOWVPYCrD9uN0g7IBFhcTXiDhGwlaxl?=
 =?us-ascii?Q?Rxaa6LSjictRAmL/IbKLGhFnNlgm0rhclEpwohannkPwpSQcFT04Gu2Aky93?=
 =?us-ascii?Q?V6htrHBrZzA5ODGl7dwxfJ6rJLgqzxya60nyPNb52UE5XKjDtP+71SY9f7q/?=
 =?us-ascii?Q?ConFtbqYRVcY7zT7l4jJMcLMExgm3D17zE4sQRXnnQHGkJpE+K0JRqK2NJq4?=
 =?us-ascii?Q?2SaruKw0R1eTqYKDZzplsm7ewujCFgE5nxjaAeb/pURMudKZuh+bqz62yoqB?=
 =?us-ascii?Q?SMgU7nIzSxg7tI2OK12zw10dfhlVEnicCIzBkIwuZ16O8pyE066+?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a51e6e30-b885-4946-b980-08df0f22e439
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 10:04:24.3332
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WUtIrAuMNRil6jca58C2ckK+FUY1QjRQt40yBx00upzYYfw1JaSt9KNtx+x9hoC5CAe/WgMPkAcINOlsxTOYSL5N2rT7YJhdIUERo0yX4EL5BSNwzxXu3vkKBlq7DYGa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1233

Add pinctrl driver for StarFive JHB100 SoC Peripheral-1(per1) pinctrl
controller.

Co-developed-by: Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
Signed-off-by: Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
Signed-off-by: Alex Soo <yuklin.soo@starfivetech.com>
Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 drivers/pinctrl/starfive/Kconfig              |  11 +
 drivers/pinctrl/starfive/Makefile             |   1 +
 .../starfive/pinctrl-starfive-jhb100-per1.c   | 193 ++++++++++++++++++
 3 files changed, 205 insertions(+)
 create mode 100644 drivers/pinctrl/starfive/pinctrl-starfive-jhb100-per1.c

diff --git a/drivers/pinctrl/starfive/Kconfig b/drivers/pinctrl/starfive/Kconfig
index 07f9cb3d6eae..823062be6d9f 100644
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
index 000000000000..45fc231e2c86
--- /dev/null
+++ b/drivers/pinctrl/starfive/pinctrl-starfive-jhb100-per1.c
@@ -0,0 +1,193 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Pinctrl / GPIO driver for StarFive JHB100 SoC Peripheral-1 domain
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
+/* per1 pad numbers */
+#define PADNUM_PER1_GPIO_C0				0
+#define PADNUM_PER1_GPIO_C1				1
+#define PADNUM_PER1_GPIO_C2				2
+#define PADNUM_PER1_GPIO_C3				3
+#define PADNUM_PER1_GPIO_C4				4
+#define PADNUM_PER1_GPIO_C5				5
+#define PADNUM_PER1_GPIO_C6				6
+#define PADNUM_PER1_GPIO_C7				7
+#define PADNUM_PER1_GPIO_C8				8
+#define PADNUM_PER1_GPIO_C9				9
+#define PADNUM_PER1_GPIO_C10				10
+#define PADNUM_PER1_GPIO_C11				11
+#define PADNUM_PER1_GPIO_C12				12
+#define PADNUM_PER1_GPIO_C13				13
+#define PADNUM_PER1_GPIO_C14				14
+#define PADNUM_PER1_GPIO_C15				15
+#define PADNUM_PER1_GPIO_C16				16
+#define PADNUM_PER1_GPIO_C17				17
+#define PADNUM_PER1_GPIO_C18				18
+#define PADNUM_PER1_GPIO_C19				19
+#define PADNUM_PER1_GPIO_C20				20
+#define PADNUM_PER1_GPIO_C21				21
+#define PADNUM_PER1_GPIO_C22				22
+#define PADNUM_PER1_GPIO_C23				23
+#define PADNUM_PER1_GPIO_C24				24
+#define PADNUM_PER1_GPIO_C25				25
+#define PADNUM_PER1_GPIO_C26				26
+#define PADNUM_PER1_GPIO_C27				27
+#define PADNUM_PER1_GPIO_C31				31
+#define PADNUM_PER1_GPIO_C35				35
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

