Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2106.outbound.protection.partner.outlook.cn [139.219.146.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66B34449EB7;
	Thu, 10 Sep 2026 10:38:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.106
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789036721; cv=fail; b=lFwhzCXfyZsD4gqypYGoM5AtHL4KYgMwrni5wZQeSWqvSSN/0oz/ROpZX+NUAA64f9Z/UDaV1kmfHKZFcCgKJgM3XD0oC5awc/E7rPIz8koOQxdJxcyhRjJxeGeqj6fMe6ImjwPaAiq7Teq2nVL1SdMTM2QHobOaV8ZD70DLp4w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789036721; c=relaxed/simple;
	bh=n8sdF54mXS8FpzCUCu9qWAfOW7d1lyCkl+3+7mWEaX8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=fiUriI/k102/DJFzwK20JBoAXqYhpXlMsZkMIr/83jAxcqL3WuE5K6LHP2tj+b35WhygvJWDtaEMFoftwZlp/nA8nZxS8AL+GPo9uyyK8YXr5tM3iFFG+mdQbQoorqh8YJ+/CDTHneamJCT5znOzYpB0ulSPwt3Em/JvjwHQ4cQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l9Fe3lyq/wsOCpacEg9M9UZJojommO066dLdvYggCLBFUQki3/tkI4JQW8YXta1kAekajxW3NHYVrpND6K+I632cS1QFDP1OOFX54z99OlXFimQpu19SGp7r25Ahem5Z5BuG9OJLr6BSIs2NCmAeDpGXifl+gXZ7arrHHUyXBZjIX9hWomXazgcHYW/DNoKPiX1FXsqHIHqW4Nl1IDhrm4KjhZkYTzaZadfyC4SPBr50zl3oXIpg2r8BfIVuRvi/PjbIL+9aJC9rC+UJ1t7r2enQXjxQXBmBj2nO3m0xqxsRIPdrfDGKwReeZftquIVPI9TLyvHUEqR+FRYahPgfmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WlGTjjYY4SrRWxrIt6PkbJcTEP/aVzkRcOsuUiI3VtM=;
 b=ObYjTkFf4Fvi/aq0SyRxssXY32P8DXjy6Y3r4rdmQH5XSXPRZZXc6pot0nORlvaTsFP1+hguSe1V0GJAt/kNeE9uFmGUmClb5edhc7me9zOSij8iAhq/CGsmwBDZ3+u5t8PusNDYIly9aKV8zhIHIi8yFbV22uMDjBfET7Cfai0UF/E4PN3VF7K/nGvaRf4pgm5bDe2WtCcVzrGM/mqokuZ/N8mDk053v1BDkl56AxKv7ISA7EDpbwVKOAdgpA9k4robk2p4dGyG8Pd3R/J/5GUBz3lwUve+z0g+kfGnwrSSKBjZ5EXnKEDUKQGqHogWcwQJrqqXQYu2pba23f+nIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1170.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.18; Thu, 10 Sep
 2026 10:04:28 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0339.017; Thu, 10 Sep 2026 10:04:28 +0000
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
Subject: [PATCH v8 18/22] pinctrl: starfive: Add StarFive JHB100 per2pok controller driver
Date: Thu, 10 Sep 2026 03:03:53 -0700
Message-Id: <20260910100357.130134-19-changhuang.liang@starfivetech.com>
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
X-MS-Office365-Filtering-Correlation-Id: 6265500b-9f48-4e03-4954-08df0f22e6cb
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|7416014|1800799024|376014|52116014|6133799003|3023799007|10067099003|18002099003|22082099003|56012099006|5023799004|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	CKkeFyrgin3aTytOKnHFOGNShqbMq0aUs/7v5cO6E9ugxvCwjMj1Bz/s/8GqlircNczYQ8OUySiZXwYAagW7JcIuychJlhumeVEKCsYvx3KijYto6zn4cr8+M/T6GniFDNeqgRZiQFLRbPyorjvZzfURlxeB9BKIXN49wYXoNQ7y1cA2mw6dpaZaXQYNmxmzCButu9FueTpIittWhVI/t6lStyrPPgG2yZebwDHC2lMebl8fOUJiV5U5bMAbMdQYd9elNa+QvhBYJQaZef2fTSuRIvKQSjxtdWAL/2LpZWsRWPBSEq3488k4+PXvkipvsuJfMPla7bhZpowU8mL2KiLge20LOIM/HhjnVE+GpXJ8g0IvqhPq8q/fyFOElJa5vd0jFec78Hj7U2x/AlgBAJ7eeMkEWqBYRGV4AfuSSHePFYki2lZeIXvO0pO8A0uaNxa8eZn7Gie4/TfFuVGb39NYU4vtSz+b/nv3bCuwBf5M/liQ5t7mogwQf19j4XgKnG36FHP8Cwv3CN5SmbFxGVxAi9cpnuw3ASDb5lT1S1zxoqc6+wRdzPi5pFjOocqAfrL/It23H/Nk/0nc5/MSYQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(7416014)(1800799024)(376014)(52116014)(6133799003)(3023799007)(10067099003)(18002099003)(22082099003)(56012099006)(5023799004)(38350700014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1gx/iBvV/6PlcMQ6H+N9RE98X03Kt2XjvDVIacL750zvdHmiXblY/zt2zxEO?=
 =?us-ascii?Q?UVo7h/wahfRGSzZKhbLPWMCPL4JDslQAvaVSWf54ifs5UgX7qYJXSQex6A1R?=
 =?us-ascii?Q?YdORYZHlYmGTISmyAmoV78Awp7C+FvOZDtLX8/QuGMp6a1+O25NrfyjYnsh9?=
 =?us-ascii?Q?Aowqi0kfz8HSPvoJH2J4lmgwxGlZ1Ic60uH/b8qaHtaUcz94R0El4Up7Wt2j?=
 =?us-ascii?Q?oE+4FElzY1A7tSSniRlOoRkilM7B3UtugkybEDUF3DF0aKba0OcmS7vDVjF0?=
 =?us-ascii?Q?fvRc3jVVa7/ZZhR0QvhcZldYvdD+7Gi7raJzmSH9tr312Bs24AFfKE8I9Yqs?=
 =?us-ascii?Q?znd3n5EJckTNNFMkD5sovPzY5iyM8B8OAT4X1DLU9FXZ4fQocwZ1yqfdIr6P?=
 =?us-ascii?Q?GIyJoyjWMRD6Wd0oI2S+2o3pGszzAnVls8XVgz8oQInKp59yFOJVO3WM4rYw?=
 =?us-ascii?Q?hOgK80WsQ8ScNHcjA5aa0/kXB1rvXrSAfYVSw5i+L+2UuSZsWzT5jsweefgL?=
 =?us-ascii?Q?Lcn/EotIgvOAkDp4rgX6kDSCYt5uBImhLHZk+vHIzlek3lQY1Q/ieceEjueq?=
 =?us-ascii?Q?jb6Y7E0DFl7v8Ni1b3OitBp0HKHlWXqySw7s9MjBzVkk8axlAAcOg5wRHT5/?=
 =?us-ascii?Q?Nv0uBTSVcS4CFe5mj1lamIZ1RJHL5GFi6g+H8y8XhBz265az/nDAjKhThz/b?=
 =?us-ascii?Q?+fLXNpSSLipm5wVpF9eUjcnhyQwchAHUyalfMO4LCI2oHRJywQyjLyX2cuKJ?=
 =?us-ascii?Q?Owyc6qYXK29iBKN8Yv4QxiVej1d5n5GB3At+s72fQlZamq6tHy5BVQUfr39n?=
 =?us-ascii?Q?lSYWxSA64cVDRkWcveNbQP7gQ+N73mJOA3wY0HfzudaAxosDAp95FSc5JRYu?=
 =?us-ascii?Q?qe3oPdHl4ajztrZr9nCOBNZJPGn/K81fHnsPiGJ9TqUvkd0Qig/pZGRzXBjM?=
 =?us-ascii?Q?tmnMKHZ9j3xQEztKj5NNAiLLcABHTHerZHqww5r9B8r4rPfCQ4hjfeV6AMBT?=
 =?us-ascii?Q?a/zLngOdDkrapADN3fkC5tSkap75Yi2G8UE9OVPeh4MH/QPxToMCH2W9uhov?=
 =?us-ascii?Q?mhZdTscWcjFUfB9LY53P4cSsKYlctqTctRIt8kQGyRSBG78bntjgtptOG1y8?=
 =?us-ascii?Q?R/p3fctKTeFwFdwA9txDBpLvAMpcTL870Wk+9oCZ5Ubis0bw7pCeNEuNy0TO?=
 =?us-ascii?Q?J2qqzQHfPL613MAmctjyJkl66b6S3dTBWuuXTgYexOuUkrjQ4o/K7sbGoE7w?=
 =?us-ascii?Q?OSKX7a1H8BRLkTW4n1EBF01aUS2CmAVL7GyA4cSI0/IjsFScVIqgEyewmgtz?=
 =?us-ascii?Q?6UZO3XmpYjbtu2pep/xWYj4mEp6EdkszKOhRGH+bub3QJ2KIcmSq5TG5U1aW?=
 =?us-ascii?Q?SMnyalg9GWY+jr0wU+uitrFo/55h8sk1ETARmyzXhPWo/Ok6fHngbSxDFOgi?=
 =?us-ascii?Q?89hpDW2luvjVEZ2P1Iv68gw0xpmZt/BN+ekBCoJHq4NtOhwsmVA+AJ7D8CL5?=
 =?us-ascii?Q?2iGpX5xV6jSrx86GRpG2BbnUjroUWxdLdnJuH63n3qLWnQoj16BwP8gOwXKu?=
 =?us-ascii?Q?tbfwA7bPuRI/9+43h52wdE37JiTU97BQd2GP2w4sp3KTt5V/WvthyPPPxfaV?=
 =?us-ascii?Q?UtYvVBHBJ8E6PWp9HMJJgP3rotcr7kOPlxe7sIPrbiMw9eXLeMil1Hnp9DY8?=
 =?us-ascii?Q?Wbr1SfLBO2a1qW2d5zkidnqk6oj1Jn8qNMtdH0vC1+sFV3viyHOiNxf9NY7Q?=
 =?us-ascii?Q?Fz/41UJV/ICGm80yituyDbuWmaK68u7W1UBGtNtaOv00TUQ9hfmy?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6265500b-9f48-4e03-4954-08df0f22e6cb
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 10:04:28.6241
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hZAYvgsttf8yNJ1WngFpXwG7Q0AZjWkIlY4OmslTHOTQYEkZ+xTltee+/+7998smHxhUB/tXtZxGKGB9f3GVJ12S8uxy+6e1mBrOYHZ9aySVPiY2T0LmewZ/MJhwisQA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1170

Add pinctrl driver for StarFive JHB100 SoC Peripheral-2 Power OK
(per2pok) pinctrl controller.

Co-developed-by: Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
Signed-off-by: Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
Signed-off-by: Alex Soo <yuklin.soo@starfivetech.com>
Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 drivers/pinctrl/starfive/Kconfig              | 11 +++
 drivers/pinctrl/starfive/Makefile             |  1 +
 .../pinctrl-starfive-jhb100-per2pok.c         | 99 +++++++++++++++++++
 3 files changed, 111 insertions(+)
 create mode 100644 drivers/pinctrl/starfive/pinctrl-starfive-jhb100-per2pok.c

diff --git a/drivers/pinctrl/starfive/Kconfig b/drivers/pinctrl/starfive/Kconfig
index 0c55d712c2e8..426be481a3fb 100644
--- a/drivers/pinctrl/starfive/Kconfig
+++ b/drivers/pinctrl/starfive/Kconfig
@@ -89,6 +89,17 @@ config PINCTRL_STARFIVE_JHB100_PER2
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
index 000000000000..6bb3b47e65f0
--- /dev/null
+++ b/drivers/pinctrl/starfive/pinctrl-starfive-jhb100-per2pok.c
@@ -0,0 +1,99 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Pinctrl / GPIO driver for StarFive JHB100 SoC Peripheral-2 Power OK domain
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
+/* per2pok pad numbers */
+#define PADNUM_PER2POK_GPIO_D36				5
+#define PADNUM_PER2POK_GPIO_D40				9
+#define PADNUM_PER2POK_GPIO_D48				17
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

