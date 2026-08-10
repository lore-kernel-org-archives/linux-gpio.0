Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2112.outbound.protection.partner.outlook.cn [139.219.17.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6042F39CCF9;
	Mon, 10 Aug 2026 06:37:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786343872; cv=fail; b=fpbfql9FylAQ7eocugiYgsFUhIxAQK9pEYBKlS5i5I99z5brvze/uIkrXqqwIkmNbsU1KNOIMbpsmEZAmB9i0wEFdIXpzIUxZmWdKrEs/yfU5b+Tz2LzImlGxiANWvSWt1pmOnKbX/clhGdK0In2Sp0/fq1ImKqmjiJTWD1IItw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786343872; c=relaxed/simple;
	bh=uspZmE7QmLkesus3hxM9vvmTIKxlCtYYnI8ug0jf25g=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=FsWJMKA14M+nhtqABjVCU+j5SS34ROn5/jOpY/D2fvpqVEBrCU3O1jOA//Znl/PYWPZgyGGROyTj+YLwQnUwyv0GkteiVnSYp61athpp9ibXrVWSdBZWNGL0Tj4Y+dmnbM9AJgoEPUBSj6olxyx8UFKW205HBFItGb0+ex6g0so=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BJtVP2LckOGTq91B5b98KboHLTDXSgEu4uuCrYkvIuaono9WqKqIsawGTlEve8Q/O8+KMwKTLK1Sz5YGvG3RZ3ZPvVsw9Z3JKEehXqCkS3/5Gj3o3x8uLzbHDrxUbyyLwXYyW0/HHKKSXGmM6DMp8+D17WWFLweEh7GwznuONpv3MrJ05/JJBD93JlFE73HhtecdIf6+ofELVTAI3vRcmeaUPRyVdHICtYHV7+oMbza9NxOwLaOoOr4bYlooIJiDhro3vw1UF7Q/M4s1Uo+CrQVxd88we4W/SN/Fox3moH1RCV00ONBuuMAll8d83zzM/Fy9q7pKWmCVF0ofGLMJYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pqdM7TVd3wwrdROU1NL3U0Nk/g/MAtBv+F8JVaZ6tvY=;
 b=BZcZPNFTqGOcjHbkmrlQOimLVM/RgewQjbl3aw6aiYm+xvoldscDv8DCxsQvEuSQ4Gu0SOOKUg2gmUR6KzUqLoFfmL7UKKqAPeFlGvlS2l+irkj3G8RcnN5iqD24IH/uorUFe0uAJRBP55Xd4My1nBW/O7w0WdFppuenSH7WWLNbm+sjN636RP9lhLWdvMBUa4bab7Pc72TP78JCT+xr+LOdebBHhTVzxULEbLl9uX/8e8iKIwrCJgSQJoTExVCocduOcGR7WcitsRg52PTPGSDOdVyEzYZvLeEWuXDfzUVyoT9Z1VULiXHm7uJ8Sc7Gwk3bDNmb7zevCrQu8s6bGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1315.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:15::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Mon, 10 Aug
 2026 06:37:22 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0292.024; Mon, 10 Aug 2026 06:37:22 +0000
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
Subject: [PATCH v5 18/21] pinctrl: starfive: Add StarFive JHB100 per2pok controller driver
Date: Sun,  9 Aug 2026 23:36:47 -0700
Message-Id: <20260810063650.239303-19-changhuang.liang@starfivetech.com>
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
X-MS-Office365-Filtering-Correlation-Id: 03f484d5-80a7-47af-063e-08def6a9d55d
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|52116014|366016|7416014|56012099006|5023799004|10067099003|6133799003|3023799007|18002099003|22082099003|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	ZCn2FXWqYx9kQrukP2SlrE9FmSnToxK7MU/YWc3byb6CdlNWjQgQQ1fzC6OQgB1gzfvjaXTTY7Twk/eva6v157fWVeGdEW5+JA97DQ4I63KDaa6Iv/2axz9niqVaxrsBbsualMFRRjO2tdBTOsu7jCx4dIiEwSb5UPNU0OURGXo9By5OA6czE6f1acH4pGpTmgkFIJ+xxfhoJU8mIFDnTFU6npaeTtYh4oL8jmrhckJ4D54UAJ7D+zU9R5fzi85+zPkrTerQXCk3YG4kcZBF0akLctyiyURfmKyPp/71qitPR1tGie7wwpcPBSEf/P21SpeQgp42CtBNjQNSKp98CeLsAD/Nv9nnM1fHHPu9QRNnAn2maB5eQOggyEUIkztfu8yqAWhuY/niSSedGTPoqTfDyPnZ5pUwvmXJDrulpK+ROFsVhbNi6SAraRMmWPA/9hxC4I0CObdTMySJf3dzYYl028l5T+FU+N2si7+kwqQs7/RyLkEdizvMLnIAzu8gNyBZYo2lTZibf3IwiaZJ0ZAQZo2zQRCbVhsIddw0gK2T6wa4LAOy1qqBzbCWZ0TWttb7GmXb4AI7007EhucnZA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(52116014)(366016)(7416014)(56012099006)(5023799004)(10067099003)(6133799003)(3023799007)(18002099003)(22082099003)(38350700014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?n1RgxMnBYe4vKrHG2RLEaaunkbrWDA90v6knkGIBolpJiyWDP4zIzeTYjeaf?=
 =?us-ascii?Q?I4bJCpQGdfbqkwfy3RpvXl898Bf+KTcEj9vAc3Za35xqGWADtf8q6ADk2kVN?=
 =?us-ascii?Q?rSg79YlruA0rIeupcty+nnDiYeniuluvCcY82YAif06C++tyzOHVhlHy6aJL?=
 =?us-ascii?Q?hm+M1JI8AHOZuk3Nd4Wh873do8YtJ8osRva5RZ0JwbTESbXCukgmWAnRkXyO?=
 =?us-ascii?Q?dfndUIiE11zzXNTHg/F3oW7gYoGj9VU/lmeZIJb/lZR1xCmQsc4GKFiByxff?=
 =?us-ascii?Q?wy5MyPin8MYN4O0FuhOFgmUyTaceUUUyDmeorh6E+YvJBY2RiIhFhdPjbbiX?=
 =?us-ascii?Q?7bgZMrak68HBjKyKVqPotjAJTPgrtypob/gnaIirNv+F58g0pYvzknOWZieF?=
 =?us-ascii?Q?1HuhN2J888duXO7xtU9LqU4/9bTyjW82NZEOa0uJVKxXlNdnp1v9ojfGBfzA?=
 =?us-ascii?Q?zHGzwraRvQ2ugYmLDwt89WyI2kmNJgTpCjfO5H7f7IDbEWH6GYhu8P8z9++1?=
 =?us-ascii?Q?Ve+dnNZI3L6v7ZQiBbyHO55wXd/q2j6OSVQjVSzwajzXWwqS9rENIcKZ/CFd?=
 =?us-ascii?Q?CZxvb3j9FBiWYXaRH3keu1E1VJt9eyr0AyYIVz2TK/Dc4/KGF6jLNQlwv2lU?=
 =?us-ascii?Q?kKeGWg+aI49EUznKhZA8nW96vSfTEdKQfX6Ji01IbZ29tBTPaCkG+dqo90kO?=
 =?us-ascii?Q?MOxZWMxxjrAJ54UwNpHV1zsrVfZVzYXL1hFt6CFVzcZ8R6VES7IOVx5c/EPK?=
 =?us-ascii?Q?JAZ2HYAGCPtUYeWNEgNXZ9nuHj2Kn5PsFZuh3p1vuLuUd896rnI9rLKoiAP2?=
 =?us-ascii?Q?paSA/w/nhsQLxAAxje6aS5IsGDTz6ejJrrJnhrbFsTOgA+zaijlzYAry4MML?=
 =?us-ascii?Q?siQWgD2+qYplIRew/ZHXg0DYmImw6htgY+nt93pLL3DeazuFxz8i4VfmUMKf?=
 =?us-ascii?Q?SkzjSIX8WvbE9Tjraq1qWVycKPo+Hw2wuBIqX3nAzu1fb3Uq4DQeZVtqtvk3?=
 =?us-ascii?Q?KUgdhcnVpAdEWZRckueYHpGSdB/dK3+nKVlIXoT94+pD0D0CoUJxqMrBv2R8?=
 =?us-ascii?Q?+5J+215uyPs3PeDyYT3womlypKrWpbBZlBM3qe8Q3rPAYvDYktZqDPicmGWQ?=
 =?us-ascii?Q?fzfAni76uOq61c0KTBgVv/T7xR37l34d0z7SU/+Zg4qYNEbJUCmf8hZpQPsO?=
 =?us-ascii?Q?sNY6kZ/jg/97cLSdeLSdl7i/lzziSHlgpUA6l0kwvPOd45eT06XLli97bK9C?=
 =?us-ascii?Q?IkGj4Vu8Lcm/Mm+OXnADb5tkuLAjyYrWgEQM6PzxBe2d/b9NcQ+tIxZCljOX?=
 =?us-ascii?Q?+/ypOs38xWWg/hM0QLN8Pmj97x/nCZGE6iEaW3fu7nQBGBtquDB1EVauu0xt?=
 =?us-ascii?Q?os/5oqADOg29yuWg5J1ci5bMP/nNqSbcLCxd8f28q0LRhEeZxf4OMf8bqEqY?=
 =?us-ascii?Q?ZQR9FsxjLsuFWZ0aKjfrxS8PLPFPOK1dpBOSE7MA5DB/erM/OzdsXzIS4N4Q?=
 =?us-ascii?Q?Egq1taUP2u3PUxIGux90u4CfLDXhAluc+bhHx29ZaVQwmURT1frjSEEg08Yn?=
 =?us-ascii?Q?r8eI+BmxRbAzB21naE1lOpYyASpNgrTdepAf6r6rfX3vFXq8Cb0q9YSfZ6w5?=
 =?us-ascii?Q?jS4OojSccS9LRSNkiFUWR2B6uNAYO5qFw6B0VJYsY1tT0EezbfVo1aN0bXuZ?=
 =?us-ascii?Q?H2XOsSyAYFtvK1vOcVF/xkPoXboLCYwX1ICLWIAtgOFQNS7o88MkiPicBpQL?=
 =?us-ascii?Q?yAZyRF7HZIosxLzWAYKqJ8UzkBmwXeBZF/k+91fIWb+rw2yNy+mt?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03f484d5-80a7-47af-063e-08def6a9d55d
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2026 06:37:22.3944
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nWR26w+j7Gzrcu48D5Sw5fQPLplKKYvqcluy5O4ldksGEzJ7uAjvoqmleFdWRGnRjfKmBMUwYITJstNhwAbeEXSIYxvXWRvp+w2h3K1J81u8sTfW8mYZ6SSJJl/WuY9C
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1315

Add pinctrl driver for StarFive JHB100 SoC Peripheral-2 Power OK
(per2pok) pinctrl controller.

Co-developed-by: Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
Signed-off-by: Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
Signed-off-by: Alex Soo <yuklin.soo@starfivetech.com>
Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 drivers/pinctrl/starfive/Kconfig              | 11 +++
 drivers/pinctrl/starfive/Makefile             |  1 +
 .../pinctrl-starfive-jhb100-per2pok.c         | 95 +++++++++++++++++++
 3 files changed, 107 insertions(+)
 create mode 100644 drivers/pinctrl/starfive/pinctrl-starfive-jhb100-per2pok.c

diff --git a/drivers/pinctrl/starfive/Kconfig b/drivers/pinctrl/starfive/Kconfig
index ad04a7331a86..cbbd6f1fc338 100644
--- a/drivers/pinctrl/starfive/Kconfig
+++ b/drivers/pinctrl/starfive/Kconfig
@@ -90,6 +90,17 @@ config PINCTRL_STARFIVE_JHB100_PER2
 	  peripherals supporting inputs, outputs, configuring pull-up/pull-down
 	  and interrupts on input changes.
 
+config PINCTRL_STARFIVE_JHB100_PER2POK
+	tristate "StarFive JHB100 SoC Peripheral-2 Power OK pinctrl and GPIO driver"
+	depends on ARCH_STARFIVE || COMPILE_TEST
+	select PINCTRL_STARFIVE_JHB100
+	default ARCH_STARFIVE
+	help
+	  Say yes here to support Peripheral-2 Power OK pin control on the StarFive JHB100 SoC.
+	  This also provides an interface to the GPIO pins not used by other
+	  peripherals supporting inputs, outputs, configuring pull-up/pull-down
+	  and interrupts on input changes.
+
 config PINCTRL_STARFIVE_JHB100_SYS0
 	tristate "StarFive JHB100 SoC System-0 pinctrl and GPIO driver"
 	depends on ARCH_STARFIVE || COMPILE_TEST
diff --git a/drivers/pinctrl/starfive/Makefile b/drivers/pinctrl/starfive/Makefile
index 33213bd1919f..213002da9cdd 100644
--- a/drivers/pinctrl/starfive/Makefile
+++ b/drivers/pinctrl/starfive/Makefile
@@ -10,6 +10,7 @@ obj-$(CONFIG_PINCTRL_STARFIVE_JHB100)		+= pinctrl-starfive-jhb100.o
 obj-$(CONFIG_PINCTRL_STARFIVE_JHB100_PER0)	+= pinctrl-starfive-jhb100-per0.o
 obj-$(CONFIG_PINCTRL_STARFIVE_JHB100_PER1)	+= pinctrl-starfive-jhb100-per1.o
 obj-$(CONFIG_PINCTRL_STARFIVE_JHB100_PER2)	+= pinctrl-starfive-jhb100-per2.o
+obj-$(CONFIG_PINCTRL_STARFIVE_JHB100_PER2POK)	+= pinctrl-starfive-jhb100-per2pok.o
 obj-$(CONFIG_PINCTRL_STARFIVE_JHB100_SYS0)	+= pinctrl-starfive-jhb100-sys0.o
 obj-$(CONFIG_PINCTRL_STARFIVE_JHB100_SYS0H)	+= pinctrl-starfive-jhb100-sys0h.o
 obj-$(CONFIG_PINCTRL_STARFIVE_JHB100_SYS1)	+= pinctrl-starfive-jhb100-sys1.o
diff --git a/drivers/pinctrl/starfive/pinctrl-starfive-jhb100-per2pok.c b/drivers/pinctrl/starfive/pinctrl-starfive-jhb100-per2pok.c
new file mode 100644
index 000000000000..3d7c0f4c4f77
--- /dev/null
+++ b/drivers/pinctrl/starfive/pinctrl-starfive-jhb100-per2pok.c
@@ -0,0 +1,95 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Pinctrl / GPIO driver for StarFive JHB100 SoC Peripheral-2 Power OK domain
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
+static const struct jhb100_pin_layout_desc jhb100_per2pok_pl_desc[] = {
+	{ .pin_start = 0, .pin_cnt = 10, .name = "gpio", .gpio_func_sel = 0 },
+	{ .pin_start = 10, .pin_cnt = 8, .name = "pwm_channel", .gpio_func_sel = 1 },
+	{ 0xff },
+};
+
+static const struct config_reg_layout_desc jhb100_per2pok_pinctrl_rl_desc[] = {
+	{
+		.pin_start					= 0,
+		.pin_cnt					= 18,
+		.fields[PAD_CFG_DRIVE_STRENGTH_2BIT]		= { .shift = 0, .width = 2 },
+		.fields[PAD_CFG_INPUT_ENABLE]			= { .shift = 2, .width = 1 },
+		.fields[PAD_CFG_PULL_DOWN]			= { .shift = 3, .width = 1 },
+		.fields[PAD_CFG_PULL_UP]			= { .shift = 4, .width = 1 },
+		.fields[PAD_CFG_SLEW_RATE]			= { .shift = 5, .width = 1 },
+		.fields[PAD_CFG_SCHMITT_TRIGGER_SELECT]		= { .shift = 6, .width = 1 },
+		.fields[PAD_CFG_DEBOUNCE_WIDTH]			= { .shift = 15, .width = 17 },
+	},
+	{ 0xff },
+};
+
+static const struct starfive_pinctrl_regs jhb100_per2pok_pinctrl_regs = {
+	.func_sel		= { .reg = 0x58, .width_per_pin = 2 },
+	.config			= 0x04,
+	.output			= 0x4c,
+	.output_en		= 0x50,
+	.gpio_status		= 0x54,
+	.irq_en			= 0x60,
+	.irq_status		= 0x64,
+	.irq_clr		= 0x68,
+	.irq_trigger		= 0x6c,
+	.irq_level		= 0x70,
+	.irq_both_edge		= 0x74,
+	.irq_edge		= 0x78,
+};
+
+static const struct jhb100_pinctrl_func_maps jhb100_func_maps_per2pok[] = {
+	{ .func = "can",		.val = 1 },
+	{ .func = "gpio",		.val = 0,
+	  .max_pin = JHB100_FUNC_MAPS_MAX_PIN(PADNUM_PER2POK_GPIO_D40) },
+	{ .func = "gpio",		.val = 1,
+	  .max_pin = JHB100_FUNC_MAPS_MAX_PIN(PADNUM_PER2POK_GPIO_D48) },
+	{ .func = "host0_port80",	.val = 2 },
+	{ .func = "host1_port80",	.val = 3 },
+	{ .func = "passthru",		.val = 2,
+	  .max_pin = JHB100_FUNC_MAPS_MAX_PIN(PADNUM_PER2POK_GPIO_D36) },
+	{ .func = "passthru",		.val = 1,
+	  .max_pin = JHB100_FUNC_MAPS_MAX_PIN(PADNUM_PER2POK_GPIO_D40) },
+	{ .func = "pwm",		.val = 0 },
+};
+
+static const struct jhb100_pinctrl_domain_info jhb100_per2pok_pinctrl_info = {
+	.name			= "jhb100-per2pok",
+	.pl_desc		= jhb100_per2pok_pl_desc,
+	.crl_desc		= jhb100_per2pok_pinctrl_rl_desc,
+	.regs			= &jhb100_per2pok_pinctrl_regs,
+	.fmaps			= jhb100_func_maps_per2pok,
+	.num_maps		= ARRAY_SIZE(jhb100_func_maps_per2pok),
+};
+
+static const struct of_device_id jhb100_per2pok_pinctrl_of_match[] = {
+	{
+		.compatible = "starfive,jhb100-per2pok-pinctrl",
+		.data = &jhb100_per2pok_pinctrl_info,
+	},
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, jhb100_per2pok_pinctrl_of_match);
+
+static struct platform_driver jhb100_per2pok_pinctrl_driver = {
+	.probe = jhb100_pinctrl_probe,
+	.driver = {
+		.name = "starfive-jhb100-per2pok-pinctrl",
+		.of_match_table = jhb100_per2pok_pinctrl_of_match,
+	},
+};
+module_platform_driver(jhb100_per2pok_pinctrl_driver);
+
+MODULE_DESCRIPTION("Pinctrl driver for StarFive JHB100 SoC Peripheral-2 Power OK domain");
+MODULE_AUTHOR("Alex Soo <yuklin.soo@starfivetech.com>");
+MODULE_LICENSE("GPL");
-- 
2.25.1

