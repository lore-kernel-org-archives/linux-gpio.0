Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2097.outbound.protection.partner.outlook.cn [139.219.146.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6519E3FF8AC;
	Mon, 31 Aug 2026 11:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.97
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788176173; cv=fail; b=RpIdLusAM6sVsyt0QzxomOTEnQlT0OYY0Vdvba9yKXY/4sg3uowLuuppCtufpKz251F9d6c5m6JSf+DcCQ9QahY0qNzGCV+Sih6X8Z3iawlezYNGGLAzcRTJnKLQvyhur4pzaERWS2nYCHLAjaS6m+GxkQf4opJ9/7MqkNWkzFE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788176173; c=relaxed/simple;
	bh=FcGpg7FBqWOuc5yTLhpBfKVMqTvtiE2Ux3Tdl7y7cD8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=aZYAW7sT9Hf8pjBTHWAsFVpnKe5nqGZfS1nCYnwOh9DzvcNgmbXOhL+eYAebVvwLfz44u28OcDaxiTAyhQLGAzSL7/4XaQ0sLRyQNGiT1FLl0ejcGlJAuBY44uHb7P+2lGFn7etdWc4xvMI8nLRYA/FQ/fsHa6RmivtSnnY5X08=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nAbWWyR9NQZUMApSbRT0bj45sm0yYzWRzGmBuJE6krvHjE0HjrdMIXS9PjYKVTpVhmDoaugYGKJyu5KcmDayw0PtApDJmv/Ey4zCWaxJ2nYRYz7Z27MBM7X/dLAUX/peqGdj1xDcvl6KBPOOmuHyLyfox/AZAUsaLSO3BiVs8N23SV8AhawjkyxAFCpqBcBRcq4Z63cdZ3NSg3MFVhPy0t/4mF1KD1uBxiGVUSri550IWFUQ/rtG7jAvin0hZfxrB7tR9iu60Euto2lxhGR+65nzDeM4Qo6N7bVsD/RBE1cNMTIqicbOeUX/OiBQZwjJ4tl1eNBbkYG4ZaCqfbGZiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ofd5dDMH0G7purkHZgdvfz+193f1UwudkEEe6R3l/5Y=;
 b=it9IXiDrsv7UYCdShdVBktGL35zPIXaduI9M6KMtoDWRW+IvGldovOXTLynfwrh01yQzIOxs0L47LZnC0vsyilpyqq/E+BXZ9KNmfT9B/mPxmCI0PxyRP7y4uvFZCh4aDfAHOgPJOTPRbwBw8+oKz/bFm0D5X4GQhDyGFZRDG0cKtMJuWmbLEmH+0bFu0GrZxbRDy6FYkbOfQX/B95PKPa+cDP6Sy8D889l0X4IjepCaBSywhSbOIhmNGN20RMkfZwAxqDiMXL7PhkNSl11bltMELN9L6hMN3w4Wj0sVK7ZEc/TUImSfN04nMPoB5YfQtc0bke5vXs80rKZZKkEoCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1332.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:16::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Mon, 31 Aug
 2026 11:35:48 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0315.011; Mon, 31 Aug 2026 11:35:48 +0000
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
Subject: [PATCH v7 20/21] pinctrl: starfive: Add StarFive JHB100 per3 controller driver
Date: Mon, 31 Aug 2026 04:35:13 -0700
Message-Id: <20260831113514.66382-21-changhuang.liang@starfivetech.com>
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
X-MS-Office365-Filtering-Correlation-Id: 6dd66fa8-1707-45d8-c0cf-08df07540117
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|52116014|366016|1800799024|376014|7416014|18002099003|38350700014|22082099003|56012099006|5023799004|3023799007|921020|10067099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	oDacKBe2hmCPRhR3vE/Vy0HQSJuhFdhYSifg6FySP8pWbj0mu2CC1uv31kz+qmvd9f0km07nOK/m/DDq/+k9wDFshlgjlp5IYRsQNlaTJawZulMESvoCldgRWEHuougLtt0gOGN1f7do5TC3RjuXej3HyLwIussunrF/5w/DHEBPL2Nl06jTXr4iFUJ2tnr8QrxtZautmxneva/7+IKNl3fjjkzS5wxn1vSyIPikpAZEKwJsryW7jtkFslldw8UGPPd74CDRcj+SjiZ87fFMShP5mv0bhbphJC2EtCDyGg2mG4567/MXyk02zlJyoAq36lbQSk/JKFyckC+A0UQxlZr9kSPsEhERUcFBT8eiD0vNIP3XLaFFMymeZ/eiz90081/MZjLsZqfbT74ldLHjBqlLfA9JFhzcu8gHQosz0b8RoakhLJtTPfVO/Qaov8Y1/PvIMolK5khcKrU+4bmQoUQGdSHF4MBBSrrqTjFOh+WWt0AO/F0JKOsqAVmBHmz5sdYkIWkTlSX4EyUuquARZVcMWma7MMpJoTgrUq6HFCMldx95gw7C62XEE7DUJP0jf0ZMfi72rE96RzHqFq9WIg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(52116014)(366016)(1800799024)(376014)(7416014)(18002099003)(38350700014)(22082099003)(56012099006)(5023799004)(3023799007)(921020)(10067099003)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?koXSucWSXw0kbut9/fyX/kQpGN5lBvmJBAYbAOjHbFLUMzHHALJL+qJysAN4?=
 =?us-ascii?Q?Dh1Wtm3LNkK8tJKFTmfSh32auVQ0Hx73Y2j/yyWcWdFMQAKdUB9oHaNUWOZ+?=
 =?us-ascii?Q?oYaUiPQd7ICrIyGOth2PBxBqX8kfEuFnzMnhhz5ySbWvpF+yxXuTLXk7fOTM?=
 =?us-ascii?Q?nKB+iz/dQE2tXWfWRR/o+z7dbbWX9iQSNHQqcV0GZRQmBFo4clqy2QtMgD7/?=
 =?us-ascii?Q?8p8VIV1JiKIiy4D0GDkwKZphU3rMJomYIr2MNOwCgh/8sv8ZnTG+d2hDqFdR?=
 =?us-ascii?Q?5p+BF98tNDkLJkQ7jurrW3yu1K+rQE/SDD7CJHyF+E4oxWylMmFg7KahbRS2?=
 =?us-ascii?Q?ouoDnv0WTDGFbKfSZqwFGKBTjnL2ANJnrxwK/wzAxkzX8RrR2Tk2dGWaIRkY?=
 =?us-ascii?Q?81bbsglCbs6OkGA8190QRgwu9lHfsBWGK4BA3c12lg0jpPzpsvZ03IVP4Vcd?=
 =?us-ascii?Q?O9HRGDx8xbvADqkFWsTQeYae7932XPov6UlN7VxCkFTIYvNoqOzschvoN2LF?=
 =?us-ascii?Q?OAp7kWLhcPZpQsYH11H6YdDPKxSbjZJUQbk0yF+JVg3fKdPm3iRWHyKKLphB?=
 =?us-ascii?Q?iMSLo7jd8EpoIFS/q7ebLyu/IQUnqqQ7HJtS89xTYGS2l/Kf4tykN/CMBycw?=
 =?us-ascii?Q?l5yYaxXsegy315lV7jhT3LrPSeArjOvmgQG6FbN7sa5p8HV2D7hhhLU31fh2?=
 =?us-ascii?Q?eD5iJToKl1GaN/A4j+Tx7Nasncmbn8qJIBOFxDefsDolIhBq9XWAtUs+pVwf?=
 =?us-ascii?Q?xhq5r0Xgjbv4bvIZXN37mDysvqAB73AwfPKQ4/Sj2FKiNbErtHHf4I6zDgS/?=
 =?us-ascii?Q?Q543G2S4CqKisu4nM4YRaasTeHQZNgqFdlXcgXT8y9K6qCkOmS6cgK6Dizh2?=
 =?us-ascii?Q?pIF1WX6KbC6X0krbVC8avhaUqZIzsRu1sD6RC5jLUmdUMd85YhOR1BPg2Ams?=
 =?us-ascii?Q?yMtioc6Y1FN0eK5IqzrnXHYA8n4Udah+T5BC3C83UWvyohChwn4Crm/ZDDTf?=
 =?us-ascii?Q?aG6s+BJIguLUtIW4oSrQgneSr81jvqREdnpmHFv3xfa2d2vC7A8Gqn3kP+sn?=
 =?us-ascii?Q?K6IHQvrjbSlFLYV1lOiFz5dta1Bbjd21xTfADuky0WSwXZkVVSnyK7kHxKdA?=
 =?us-ascii?Q?/WHoSPgnK8mlATIsRMejp6ElptBNg+m5ytXT4qeXwOKCLhE6LYk4jzWTyqKR?=
 =?us-ascii?Q?kcoqL4gkYHleLBJX0EU5jycSvikTm3ksGIGvcg0l6qlLRwPx81xdOyNSRbcc?=
 =?us-ascii?Q?US47aPqsTvwszSZzl1WpXj5IxEbu3YefH4Pnsmr+WvnqGk6j9ssvlUhyk9S6?=
 =?us-ascii?Q?3iR7KX5kF8fPmXuDwLL51XxmTk/trMvYdsiS4rs5wfIvPnC+jePfMKKLNABi?=
 =?us-ascii?Q?enMa7LuimTtAXCLYM93t4Dw3yxGJBQoqHodNA/1HKF6rNnVLa8cPMalJC1ZX?=
 =?us-ascii?Q?5nC03qy2TBLYgWltk590ZNSVBTtwyY7jTX+mUlkVdRd9j32LIvKfT9t45ibO?=
 =?us-ascii?Q?4XOHxFFjNYWqyon5SiRk9Yi0FSKcbA/OKJMSttiuHp+FVspdUzwM9lDcYZ3i?=
 =?us-ascii?Q?8ggtWryeXzfXWPh5R6NandfkhDvjzYk4UMLDiLhNdCdHGr5akgIjmNGjxfMf?=
 =?us-ascii?Q?kamtwUzplLm5oc86ikG7PS0kacRAhJ1fEorPcXQ5svp5ypbkOdINiC8buhQi?=
 =?us-ascii?Q?gu6obtpMMEPOsVuvzjGVF0yG22w2wRzeUBoLHepHCKb62vR451LoiN/nsXY1?=
 =?us-ascii?Q?tsrrGs10KNO1/q3F0MwHtWBea5YNyAYQyU5uqavvWFk32xLF9wPo?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6dd66fa8-1707-45d8-c0cf-08df07540117
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 11:35:48.7878
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aipYOeU6dHDc0k6a56Sa+SG6p+y3WuwdH3FnSlFWXLxF6lhpbu0Ex5dRH+DugzqPxmN+E77rcdT2PCedE1tAnvx+W7Hc8ovldI4tSuPPSjQLxY55K2MgYJptcvVlgghp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1332

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
index 081e3ec4464d..85fbc4063238 100644
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

