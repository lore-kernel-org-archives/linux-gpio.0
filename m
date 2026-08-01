Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2114.outbound.protection.partner.outlook.cn [139.219.146.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 503C73AFB0C;
	Sat,  1 Aug 2026 07:27:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.114
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785569273; cv=fail; b=j+dUSfy4l3tZAxMCw8xYAafdLGqqe3zYj7LX1qgFpSF11WZlUAy1PaxWn3tJdPZA0/LmJ0f6SdWkZibBRGjGpujonDcb2PKKIw5YOKcyambZ+19Gnh3pLp0KhkpOCNx68Q+YxVGCWE8kP2RN3SSUEynqDtuF6IAgzT87V/RmaLE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785569273; c=relaxed/simple;
	bh=oI2QESaj2gak7Oxl1UJ2dOiJOr06Xg/lMAspLNrSYek=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=XwfjDhTOqSbH2x7PvrJin4R9s08uuA/K2zPINboat8TsN4XloU76Pf8jxmN32lVbK09Ij0p1dzK7XeFPISvnKZxAgFbGhk9UGemMRzMo2oL7ZQOv2bg3haHybJCI+PmJytQb9GGSAoSRI5T+ugKROu/WKzCKtOsxdEe+qR9gQ9M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FWJvdllT81kJ2WMFnt0I1ObE2m66nfYZd/fp9PtByI3NPS0k44UAT3kUBnlFGc6aak/PMyS+cVZLAZ0Z2GNtupJMrRelOFhx4Xhe4fFQWb4a0Nfxouk8sJVQd+a7v3dKbfRzNach/xqocJXuA8aSlzggRbVn29x7uGl4b1QJJssJHuW0SMRSi1C2ILUIknKOwwRWGQ+PhNKTr0E/5FIm3MTZ9/HuBwW8WmBisjEUtrfH/VMkeHii0FT20ydAP6EkZukVwNuDICMLXmr3NKZ15K75+OCXbNx3bNgXC9RKJIAn58Jqs8iD8UOYx/2ngoLV/CCKMA9ow+kv4RncBA6QOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/796kmCbg3N7hB5fvPRZ2ohwriLDQzv/BTTXVXNV7tY=;
 b=NjISxH/b8autq4TuDDYsFIM/uO6E4N3PiIki0mOTHmVvr/CkFIAiwes3fWDjy1fbS4BWdKcLkMUx+bzhOU67HMRLL7DXgdWKr/DeJVQKqR+x8/xV/CqxTVKm6XFifwncOwyW5f83WSnDfff/hfwFRyMsaYDDOBYbmdQVEtrhJCUkJCFZtXzMO7X7DhjP0MTdEO3uPUAvDzuzudoNS9sp/fQ5fgr6Q2LmjaOUQRk19yalwYGEKg1ZmXRY4aIP5v0uAJw9bts4rJ7Ikcx1/nX4QJdXaqNYlknEIndSkeEEeVL/JukTSK1HPpKYMPbkj7SJSeLx3hRiByLf50JhRU32Jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1138.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.16; Sat, 1 Aug
 2026 07:27:39 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0270.015; Sat, 1 Aug 2026 07:27:39 +0000
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
Subject: [PATCH v4 14/21] pinctrl: starfive: Add StarFive JHB100 per1 controller driver
Date: Sat,  1 Aug 2026 00:27:04 -0700
Message-Id: <20260801072711.153217-15-changhuang.liang@starfivetech.com>
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
X-MS-Office365-Filtering-Correlation-Id: 87a63084-076f-43ba-3720-08deef9e5da2
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|376014|366016|23010399003|1800799024|6133799003|5023799004|56012099006|3023799007|18002099003|22082099003|10067099003|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	NINJYemSJfNjt6ZyeYlb1agtWKl3ZAZOPPxAMQFh7E6m97pF+B5PISGj2HMatte8oclaXj2XFPjfooG5lXW6zfo0YSngBH1AX+mpSip8h+Qlq+Io7FJAKreaRnQZMQvmKSAw9jy1muNczKxltM+btNrxEDJurquw1Yr1Wr09Dx5RDmoJnQ46YR9/er1h8fLHPa96o+Mmz4/F7TPdrgbEl3Cf++/ktjjH8UGY6YCp0CnRePxU7rtsTVWwgaokBAl9x5myhYhLpT8OfA7/OaiAwt43bPC15NbQp0ROb0OvLORb55HH4L7K+xhEovKgqPhgGROtQ3haCBSwrtxE2uf9dUz7lvDHg5EpK/4U8bjyEuL+UuMAEIAOYoA0pLECKiRvJpcoIPfmG1SCiGr3OJs0nUYqkvL6FlnKxeszAPxnIjznUy04QhiZiswgCciENOkeyEAZGgySUysNgh7umeZhSN0dxYCzDnoK2jycfTpmHhpE7aUbgm34oyqrExE99P1YFHvcG5QQ5Hy25Sf/UemOWsXQI1a/kUPDjiFzKByqgG8buY+OAWhS9pnkRYYiK1irSkQBpPJZ9aEdd2dqmz0qPQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(366016)(23010399003)(1800799024)(6133799003)(5023799004)(56012099006)(3023799007)(18002099003)(22082099003)(10067099003)(921020)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?srJ3iHlse+gZH1cEvnKjFO6CT+5C7amUu4Px/4Kjr4ssZMwG7K73Ht38kgUA?=
 =?us-ascii?Q?yxSurwI6y3PosMUAgejc7H2KZ5Yb/ZMD6WLSNyaSfbmtHR/7X9iWDRoDp5NA?=
 =?us-ascii?Q?FSxuxcGsvUItuRDG7JDDGujByfzLZ5CUTrfLru3cgnhppvuOTXgFcGH+XP3r?=
 =?us-ascii?Q?Bb7FRmf2gz5qKPq8YOjDHSfzgSNuq/KU+yRynUeoN7USYPUUPv8k1xNfNFnH?=
 =?us-ascii?Q?CXVNBgvAIf+HDOmQ0yzEc0tHKaN9Kd5+1axu3kUMaMBbuzovgbbFqrXd2jBg?=
 =?us-ascii?Q?sFX3WX4oWeoD8P9s8dvumPaHIRzuRmmAWObNWxuSH/FktT/u1Iuffo7+nN8a?=
 =?us-ascii?Q?wSJC52J/K9QNo3GjJfs6GwoRnoRH7O01X0lJKjABDm+c+KODa5aFRwGGTCbX?=
 =?us-ascii?Q?vYxbOH6+TvTjqIUdlh+YuiBhFXLkjK3GW82OtLmAWZOrDwDydE78ysNQfXh9?=
 =?us-ascii?Q?7E4I5IkGSdJ5nSNXjSGC433aR/Pi5N+EOhYUvgcvHtcjwWvwKyHZgCF/tf6p?=
 =?us-ascii?Q?TAMESwY5/74E4ZmqtECWXdbsjKXtxSE4t8mX4XHmFUpciUTuuYuXP7OafF+6?=
 =?us-ascii?Q?IjPRRt+1av+VvGVrsQAuh4h4H89ShQUKfOSfCUtNhaFbpC9lo98m4nlIN/MY?=
 =?us-ascii?Q?uTWGpfx7XEmk2Jy4Uu/FPststk+H7fM50iGdlzQW8YPKta7CDt9qdkMZVO5d?=
 =?us-ascii?Q?kP0GEzexJjD0LQTZtf3dflFWl6WvjEAR5zQJHo5n5BuQCyVPJnY12C60ilaP?=
 =?us-ascii?Q?D38JIYl5QLNP2sy+I8kk2eEQ1ez7emtjViBLdt+HQY0jDixROlldhrbJ3ogO?=
 =?us-ascii?Q?Ly5ZmiwLK4y4irHbh1hgkA2cSSTyJ0XADuQTyaYvqwA8p1genjwAWdXLaWOP?=
 =?us-ascii?Q?4MuJ2ZqIyHWTY8QKMdEGMSYlRwkbbmGbnMXUqNegZqwTZO6gbwzU9rFa/KRX?=
 =?us-ascii?Q?lcIzy9wOnb/MOjxxw/vv6cNAm4KvFmw3V1O0ZY/OBHR4n5ZxxEhlD06S77d6?=
 =?us-ascii?Q?QgurqTKs3Rx92Wx6NiZ+U49DUVceaJQER14ZMKwANVwgFTmuY0buiVZM/aS+?=
 =?us-ascii?Q?FGdNnEoCHZY70kVlHTwyMnK6+zjk2M8WTaebRIeL8ioe8jFNnypRuZo7wIzL?=
 =?us-ascii?Q?05xReyMozDJEbYdFcvte1LQgMH8/o2PsxvEwfz1hz+BT4myJEojJsOJzWSrd?=
 =?us-ascii?Q?fbKrQWCYKrNepvcqH7iyFOQFyDKQpBx1AMSd2p91B7XnAnLR9PA7/f6Xlt/Q?=
 =?us-ascii?Q?tIIWlFtLmGc3C96fhfUp5hhsm0l0IOG9yNGz3RkjdeufX8YlE7pC/eyFgweb?=
 =?us-ascii?Q?/gtP5bzXcX4G+POQA14M+JUsbOVlY/jxTX38Au3HiJt8mgTEmvwNTgwhNwqD?=
 =?us-ascii?Q?1/IhxfCBXcNv7gN8NXOegNaNsKk+9DSygV60lb5ralBGuQA6bMYlnEk6+gej?=
 =?us-ascii?Q?wgJc9gzYa1EadtD4ulGmY2ZNHbUoVRaYNjyO8cT4PTvCXiJJT5AcJ+0D1aED?=
 =?us-ascii?Q?mcjWC5jSClrml+wNwSciXzu/lkxz++b/QVtOGaLmaSq73ZsjfbiplowVLETj?=
 =?us-ascii?Q?7W0Rz944AKmwY3UPi+LwafgUKE5Bh7+Vb+HGt9I59J8nfrfvhhrdj2TOkXnd?=
 =?us-ascii?Q?WjACCr5q51HVhbOySVJY7HKgh5qTaP84rEuU+dUSB93s/MfQf8oXrtetHZkc?=
 =?us-ascii?Q?mK+h99BUaPNN6m1D9NoFEdlMqHDgewcueh10Gvhcsg4xHlQnJl1Zbd0cepXd?=
 =?us-ascii?Q?RkcV1+KT4c8UPYyUH9K3gxfkh6nqM4jnqUEfnyy1cu7vL86NXnLJ?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87a63084-076f-43ba-3720-08deef9e5da2
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2026 07:27:38.8998
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NgkQHsxeQa6aZ5hN1eYFcwOWwgBdUt2NT4kb531GmlCeI80/GwHOJ1g7pp9au+zjB+z4FqupIQG87d9v9Ea69V2jz6EyhtYt1T0KRekk2l17zLJRvWWr0sjEV7YBx994
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1138

Add pinctrl driver for StarFive JHB100 SoC Peripheral-1(per1) pinctrl
controller.

Co-developed-by: Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
Signed-off-by: Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
Signed-off-by: Alex Soo <yuklin.soo@starfivetech.com>
Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 drivers/pinctrl/starfive/Kconfig              |  11 ++
 drivers/pinctrl/starfive/Makefile             |   1 +
 .../starfive/pinctrl-starfive-jhb100-per1.c   | 163 ++++++++++++++++++
 3 files changed, 175 insertions(+)
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
index 000000000000..d1f722a7ccc6
--- /dev/null
+++ b/drivers/pinctrl/starfive/pinctrl-starfive-jhb100-per1.c
@@ -0,0 +1,163 @@
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
+#include <linux/mod_devicetable.h>
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

