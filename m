Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2114.outbound.protection.partner.outlook.cn [139.219.146.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 803F23AFCE4;
	Sat,  1 Aug 2026 07:27:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.114
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785569276; cv=fail; b=V1hb3eX/k8bwHxKmjL/mDZfpAsdxXzjRwdBJvvNr42ybODxx6+s/+zCnkHV3eY4sEpzhbytALqJDcem0c13lKxWze4C6OxwbkAhhKz5gOLnRMyWfYJQHVvEI8ukMdA4C20yLZ3ZHF1+xrerYRqohcxk8fQTnYlO6ZM9L03f2wWk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785569276; c=relaxed/simple;
	bh=iiLGVMysFSBN8bCZhznbJWO8COGIMZLT/ZjTA3YMQeg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Tgrf7ws31jXMuMCJApcytC7HMLAJBLVuGcaRgJHrSZ6ZiO6J4+j21xqn3J/UoUdd3uaTntczU0eSfc/E651cjJHOYLhCNrR2C+SzyMZNMqpOU2dZuJncK3uFI2W8AkxDjsB6v7vcwmuDsXKZSmC2FRxy+braMqpzMN+0y+zaf5A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kzu1CYSNAuXdyqBjUom9WWWpmsXPGndPEXQUQRxYkjE8ZyA6vNGzq7jXKmj41xBmcxMeruGPVsfYMAWtnnZYX0uN0PlnsHFCdPzIej13t1lJh7Uav1yrQej0U2zJrMYWON+DbkiXB5bFHJmdTBAahJRn054ZYXoqdYCJgTpKf9kaS+L2lA4k/5BapzDPApazsK0e3un2ymEodPSYQxKefphtdP1YXr3Oh3G53K6y9EQxFYMqJ6tYSonZH6gHBMoxwKSJuoTMyKy93MdZZOsahVcY2SlePSIpONfRKl3Xl6vU5VE5T8hPF71a+HWSKFdpt2SiyEnt/pEZfbPYU+9fIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B6ZE0ovpE/CKqkooiIp1PLt41/MrRNx+AaaJDT5ULn0=;
 b=imv3cnj/M2gV55OWcf+JbuPIAhZT0AZGzHnf7rqJwhm9MX1AuwesxANq3sJJEClKH6FWmVj6XgBCBE0oMnlQoCHFc6otRdoBklu8h3EMY3dVeWwzKxCjrIYzocL2u9WiIAjqxluq9+izfpk7KlWwNKaSQF2X1mP3uhcZqWY4leeezfeUmUt/WuW5ceqWOKkkAGLT4rCwifsZ060z9KSe03Pnsgd4asE0QRnazXvR5+YoJI1LroXXF0+R5ZmhWcKwo+rKUMh2O7SUvgP+gbbMXZ8MfCOSevAcn75PIdQQExDsXTKSwyiISm5h6vqPi35GxLMip1ItIbxmMGYeELAQmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1138.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.16; Sat, 1 Aug
 2026 07:27:41 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0270.015; Sat, 1 Aug 2026 07:27:41 +0000
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
Subject: [PATCH v4 16/21] pinctrl: starfive: Add StarFive JHB100 per2 controller driver
Date: Sat,  1 Aug 2026 00:27:06 -0700
Message-Id: <20260801072711.153217-17-changhuang.liang@starfivetech.com>
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
X-MS-Office365-Filtering-Correlation-Id: 53e9d940-141c-4237-27e2-08deef9e5f4a
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|376014|366016|23010399003|1800799024|6133799003|5023799004|56012099006|3023799007|18002099003|22082099003|10067099003|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	WvL1AnSlqcj7TfhH04IsT08KjZnDVa/SAj6EKLosgzk7pdrbGkb1GY765NfVUoABVyg3nZXsw3TFlYP/diAQviEKPHhsklbRAvsJ4fmvwkVoCKv8x4o/8docSwaNC2dTc/KY6XrJlGWPLBdE4jpRddvdZ1sHbrT3yBB+tzDRUgVrnLfIoOPycWWy0bDSbqfCD6f00cdyar44K3Q9pZQWN+OazsGE4hwiWh88THVtWOoKzUdM/08oQom79wepkZvKjG1N7qsW1TatFAPACcrfbrSoSw7Oi6ywHLzvDTYOgfbpxtQ3EuABTqj2SRyx4Njswt1Ej9sfmSIZ0HLK2DgvDhY+7lq6ZdE55T3yxrNiZt8BbAnoX5IuTvqqqrbhk2J9ODsIcHGzJh7v3DGRd829c6vB5b6WQkeHcB/HJwvl+Zar5ZAn6BuzstahBS485wm+CoEiS01h46MzhWArkwFC8bAAYzUcE9PXTxFX4x12C3FHAwaWL7zqeSVlEjCs8cyQ8JHWd1kcgNC3eLCfVHveIaJ0hsbWyBbDtIVcsNITBG36CyTJLeFKVxXeo/xQrFJZeZMh5l17raQ7BtcFo0ENnQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(366016)(23010399003)(1800799024)(6133799003)(5023799004)(56012099006)(3023799007)(18002099003)(22082099003)(10067099003)(921020)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?AV8xgXZAv7pFC0FhuB2y182bRJ9pfsmlTzfjv+k8VltOl37McvbOQ3gTGIoY?=
 =?us-ascii?Q?//VNTBramLLx/ALqmIu+lk7R9bHxigwgQbTOtK7jlxcOHgiWcp1Ct9suJ8fS?=
 =?us-ascii?Q?Ao5+VXuzXxVP3hxetGTPTz7A/oOFFJ9zXNCqFdkFLvUFcY4br3Q1ub/8AJO0?=
 =?us-ascii?Q?G7YmkB1vY4ezTn8s8FqlVplmQ/pVO8y6vSmKgabuldRVO/d7brZ1OgV9HATf?=
 =?us-ascii?Q?gdVr4INfe3DWARv6pxTKIT8N/RmbtTBinTOltxX8ejTlsSqD9/9HjLFyIr5j?=
 =?us-ascii?Q?dhJx9s1c/RESwxebyxZ+yiNvfDTRVMoL7gEIfo7NMMm0EtEKkbd3WJ19pdzS?=
 =?us-ascii?Q?czBM8fa6CURIqeVdjI3QQVaYZTJS6tdk6XO40ccsTPI7YBAk7uqRJJAhEzXe?=
 =?us-ascii?Q?z5pP7PmbKEox/8xpVlcBi8NCsuSxInwebTm5mfNwlRdGyDIBKktkfH2cupiw?=
 =?us-ascii?Q?Vto1RT1p5TjnKBtBq6n6PLWCwbiqwOIPJbWdGRta+TYJ8voYU27A0Xe5kuuM?=
 =?us-ascii?Q?8t3BT3sYlNelpKY2ObYi9iVZhsplTAtzz52MEaIjmiv6j/jdgXxlzjPPM/lT?=
 =?us-ascii?Q?d3l624QeWL7byjQW+iVTNDSc8MHRlDjbaGlzWF4tJf4Uuet/xLJaDt6UtHR/?=
 =?us-ascii?Q?Sf2fZMdMtBTylp8EcurEHFc7LBPDSDREmOREmZdzuBTj6DFx7wZf/HEXaafD?=
 =?us-ascii?Q?Yi2Xyno17TCO+t9H+qpuk53RyZVMCGOZZn3d+F+NoTYNmNrxOJig9gmdAQb8?=
 =?us-ascii?Q?0Ao2KP0Y0jERQDxX5Tq/BPA1srFlCrB/6SyYREpMDIyNcNfyBt8Audlqz5q2?=
 =?us-ascii?Q?LNOpV+CK08N3Los8+Xl+1PLP7V6/XAFkP+jAvyVFaBlJWOE6imVj0gi5nNND?=
 =?us-ascii?Q?j6sbUdTzPLgbSC+9R32P0ks3i1HqkkTE+D3C3JP/EHiG/GZsDDw2nvH6eCmh?=
 =?us-ascii?Q?mAKg3dIDRxqDHUZvNDNGUd00f90kUwTJDYoGKyflyZae2HxbeyXA8VEfucwz?=
 =?us-ascii?Q?WmJySMz6DZc+grvIpQfLGnMCizofule8gM3eYd1t3Lc+jv6hgMoc9cIUdbbU?=
 =?us-ascii?Q?C5aVFMapFpAD/hXFSqHy/HZazVKI5sgGRG8xSXf+8zQ5AAFiy1+fGfdRTNUG?=
 =?us-ascii?Q?lknvS+N4kYnnDMC6vW868hpErNIAzK2MX9mL2twxBqVGnpKJEB7QDzx33Fva?=
 =?us-ascii?Q?HBz13YzDhzICtWwBiatfpQXKjyLTqh+Il7ddI6F3K2VoLxCj0e8XWzwE0aMo?=
 =?us-ascii?Q?1cCT8zzFAYjbr5hdg9Y27YxRCrm/j30lvA7U30dB5u8XbuXoWlPxh40dfH44?=
 =?us-ascii?Q?oHsMNEbMnGI3XVmdcSHX75ZIbmpvgeOaaS0n1bZ9pc71MY507j5jLatA9vOr?=
 =?us-ascii?Q?ADRMk0GT2BpWAe9jWraFyEwbQxvnAIFI4Ny4J9f6P4mQZq9J9NgFBvUdHy4A?=
 =?us-ascii?Q?WHFvqbi24BlZH2Xy9YdQWIGasEdvXg5okhO3xBrzY0Aalxgd+RdCC0uDY5UJ?=
 =?us-ascii?Q?m8IHvS9L/zcbwSFJTocLeWkrNXDpWNQJBkO1vDUrywrJljDocDeTN1nHANJa?=
 =?us-ascii?Q?ydMOdyTbmioFXc51Oxl2ors3wBvQpfsFJMyHlt5RoqO3CYkvQBq4pKQBt1hg?=
 =?us-ascii?Q?FUmqfr0bkwf64qbE3WDI4j5QW9C9dFAMW6xNl7DrW14HGBcCCPm/OgEsA+Wu?=
 =?us-ascii?Q?keawtWQPlBTBUGMGUwNFLSBY2dSX2NzVdak3rd8ao/TZ70wffGOO+iiJXoqW?=
 =?us-ascii?Q?u1d5w7dpkFofoUmjHDqieWXoi9o5yNI1UxRPnLcm1nBN3qOhKWc5?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53e9d940-141c-4237-27e2-08deef9e5f4a
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2026 07:27:41.6549
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n+QXWH+iw+vbGfuaFQuCJ61hYXbNqWr8sNKEFQIs1SqDYE6GV2hI/9I8psy69tFJgiKVH//VijlZYVH+lcribcv5afsykogFDC/wMU9/3pw4yyoavzHk851uQ/qIjjN4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1138

Add pinctrl driver for StarFive JHB100 SoC Peripheral-2(per2) pinctrl
controller.

Co-developed-by: Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
Signed-off-by: Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
Signed-off-by: Alex Soo <yuklin.soo@starfivetech.com>
Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 drivers/pinctrl/starfive/Kconfig              |  11 ++
 drivers/pinctrl/starfive/Makefile             |   1 +
 .../starfive/pinctrl-starfive-jhb100-per2.c   | 124 ++++++++++++++++++
 3 files changed, 136 insertions(+)
 create mode 100644 drivers/pinctrl/starfive/pinctrl-starfive-jhb100-per2.c

diff --git a/drivers/pinctrl/starfive/Kconfig b/drivers/pinctrl/starfive/Kconfig
index 0fe2d21ba402..ad04a7331a86 100644
--- a/drivers/pinctrl/starfive/Kconfig
+++ b/drivers/pinctrl/starfive/Kconfig
@@ -79,6 +79,17 @@ config PINCTRL_STARFIVE_JHB100_PER1
 	  peripherals supporting inputs, outputs, configuring pull-up/pull-down
 	  and interrupts on input changes.
 
+config PINCTRL_STARFIVE_JHB100_PER2
+	tristate "StarFive JHB100 SoC Peripheral-2 pinctrl and GPIO driver"
+	depends on ARCH_STARFIVE || COMPILE_TEST
+	select PINCTRL_STARFIVE_JHB100
+	default ARCH_STARFIVE
+	help
+	  Say yes here to support Peripheral-2 pin control on the StarFive JHB100 SoC.
+	  This also provides an interface to the GPIO pins not used by other
+	  peripherals supporting inputs, outputs, configuring pull-up/pull-down
+	  and interrupts on input changes.
+
 config PINCTRL_STARFIVE_JHB100_SYS0
 	tristate "StarFive JHB100 SoC System-0 pinctrl and GPIO driver"
 	depends on ARCH_STARFIVE || COMPILE_TEST
diff --git a/drivers/pinctrl/starfive/Makefile b/drivers/pinctrl/starfive/Makefile
index 6beef7e313ef..33213bd1919f 100644
--- a/drivers/pinctrl/starfive/Makefile
+++ b/drivers/pinctrl/starfive/Makefile
@@ -9,6 +9,7 @@ obj-$(CONFIG_PINCTRL_STARFIVE_JH7110_AON)	+= pinctrl-starfive-jh7110-aon.o
 obj-$(CONFIG_PINCTRL_STARFIVE_JHB100)		+= pinctrl-starfive-jhb100.o
 obj-$(CONFIG_PINCTRL_STARFIVE_JHB100_PER0)	+= pinctrl-starfive-jhb100-per0.o
 obj-$(CONFIG_PINCTRL_STARFIVE_JHB100_PER1)	+= pinctrl-starfive-jhb100-per1.o
+obj-$(CONFIG_PINCTRL_STARFIVE_JHB100_PER2)	+= pinctrl-starfive-jhb100-per2.o
 obj-$(CONFIG_PINCTRL_STARFIVE_JHB100_SYS0)	+= pinctrl-starfive-jhb100-sys0.o
 obj-$(CONFIG_PINCTRL_STARFIVE_JHB100_SYS0H)	+= pinctrl-starfive-jhb100-sys0h.o
 obj-$(CONFIG_PINCTRL_STARFIVE_JHB100_SYS1)	+= pinctrl-starfive-jhb100-sys1.o
diff --git a/drivers/pinctrl/starfive/pinctrl-starfive-jhb100-per2.c b/drivers/pinctrl/starfive/pinctrl-starfive-jhb100-per2.c
new file mode 100644
index 000000000000..207225bd0c5b
--- /dev/null
+++ b/drivers/pinctrl/starfive/pinctrl-starfive-jhb100-per2.c
@@ -0,0 +1,124 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Pinctrl / GPIO driver for StarFive JHB100 SoC Peripheral-2 domain
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
+static const struct jhb100_pin_layout_desc jhb100_per2_pl_desc[] = {
+	{ .pin_start = 0, .pin_cnt = 15, .name = "gpio", .gpio_func_sel = 0 },
+	{ .pin_start = 15, .pin_cnt = 1, .name = "gpio", .gpio_func_sel = -1 },
+	{ .pin_start = 16, .pin_cnt = 15, .name = "gpio", .gpio_func_sel = 0 },
+	{ 0xff },
+};
+
+static const struct config_reg_layout_desc jhb100_per2_pinctrl_rl_desc[] = {
+	{
+		.pin_start					= 0,
+		.pin_cnt					= 19,
+		.fields[PAD_CFG_DRIVE_STRENGTH_2BIT]		= { .shift = 0, .width = 2 },
+		.fields[PAD_CFG_INPUT_ENABLE]			= { .shift = 2, .width = 1 },
+		.fields[PAD_CFG_PULL_DOWN]			= { .shift = 3, .width = 1 },
+		.fields[PAD_CFG_PULL_UP]			= { .shift = 4, .width = 1 },
+		.fields[PAD_CFG_SLEW_RATE]			= { .shift = 5, .width = 1 },
+		.fields[PAD_CFG_SCHMITT_TRIGGER_SELECT]		= { .shift = 6, .width = 1 },
+		.fields[PAD_CFG_DEBOUNCE_WIDTH]			= { .shift = 15, .width = 17 },
+	},
+	{
+		.pin_start					= 19,
+		.pin_cnt					= 12,
+		.fields[PAD_CFG_INPUT_ENABLE]			= { .shift = 0, .width = 1 },
+		.fields[PAD_CFG_SLEW_RATE]			= { .shift = 1, .width = 1 },
+		.fields[PAD_CFG_VSEL]				= { .shift = 2, .width = 2 },
+		.fields[PAD_CFG_DEBOUNCE_WIDTH]			= { .shift = 15, .width = 17 },
+	},
+	{ 0xff },
+};
+
+static const struct pinvref_desc pinvref_desc_per2[] = {
+	{
+		/* gpionw */
+		.pin_grp = {
+			PADNUM_PER2_GPIO_D19,
+			PADNUM_PER2_GPIO_D20,
+			PADNUM_PER2_GPIO_D21,
+			PADNUM_PER2_GPIO_D22,
+			PADNUM_PER2_GPIO_D23,
+			PADNUM_PER2_GPIO_D24,
+			PADNUM_PER2_GPIO_D25,
+			PADNUM_PER2_GPIO_D26,
+			PADNUM_PER2_GPIO_D27,
+			PADNUM_PER2_GPIO_D28,
+			PADNUM_PER2_GPIO_D29,
+			PADNUM_PER2_GPIO_D30
+		},
+		.num_pins = 12,
+		.range = BIT(JHB100_PINVREF_1_8V) | BIT(JHB100_PINVREF_2_5V) |
+			 BIT(JHB100_PINVREF_3_3V)
+	},
+};
+
+static const struct starfive_pinctrl_regs jhb100_per2_pinctrl_regs = {
+	.vref			= { .reg = 0x00, .pv_desc = pinvref_desc_per2,
+				    .num_pv = ARRAY_SIZE(pinvref_desc_per2) },
+	.func_sel		= { .reg = 0x8c, .width_per_pin = 2 },
+	.config			= 0x04,
+	.output			= 0x80,
+	.output_en		= 0x84,
+	.gpio_status		= 0x88,
+	.irq_en			= 0x94,
+	.irq_status		= 0x98,
+	.irq_clr		= 0x9c,
+	.irq_trigger		= 0xa0,
+	.irq_level		= 0xa4,
+	.irq_both_edge		= 0xa8,
+	.irq_edge		= 0xac,
+};
+
+static const struct jhb100_pinctrl_func_maps jhb100_func_maps_per2[] = {
+	{ .func = "fan_tach",		.val = 1 },
+	{ .func = "gmac_rgmii",		.val = 1 },
+	{ .func = "gmac_rmii",		.val = 2 },
+	{ .func = "gpio",		.val = 0 },
+	{ .func = "host0_port80",	.val = 2 },
+	{ .func = "host1_port80",	.val = 3 },
+};
+
+static const struct jhb100_pinctrl_domain_info jhb100_per2_pinctrl_info = {
+	.name			= "jhb100-per2",
+	.pl_desc		= jhb100_per2_pl_desc,
+	.crl_desc		= jhb100_per2_pinctrl_rl_desc,
+	.regs			= &jhb100_per2_pinctrl_regs,
+	.fmaps			= jhb100_func_maps_per2,
+	.num_maps		= ARRAY_SIZE(jhb100_func_maps_per2),
+};
+
+static const struct of_device_id jhb100_per2_pinctrl_of_match[] = {
+	{
+		.compatible = "starfive,jhb100-per2-pinctrl",
+		.data = &jhb100_per2_pinctrl_info,
+	},
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, jhb100_per2_pinctrl_of_match);
+
+static struct platform_driver jhb100_per2_pinctrl_driver = {
+	.probe = jhb100_pinctrl_probe,
+	.driver = {
+		.name = "starfive-jhb100-per2-pinctrl",
+		.of_match_table = jhb100_per2_pinctrl_of_match,
+	},
+};
+module_platform_driver(jhb100_per2_pinctrl_driver);
+
+MODULE_DESCRIPTION("Pinctrl driver for StarFive JHB100 SoC Peripheral-2 domain");
+MODULE_AUTHOR("Alex Soo <yuklin.soo@starfivetech.com>");
+MODULE_LICENSE("GPL");
-- 
2.25.1

