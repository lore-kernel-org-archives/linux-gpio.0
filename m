Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2126.outbound.protection.partner.outlook.cn [139.219.17.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B298303A04;
	Sat,  1 Aug 2026 10:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.126
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785578578; cv=fail; b=gJZgrOCislLpgrxQnXlHvoMOU6fSDwKuzMSLitKLA8Re0Q3DyNHsa03tcwa3GEMugicNxDmS11BzFKXO/Y77vi121Gwi1JHN75Ozgd3lePQaXCgd056y6pXPS+rVxkzAx12Ncv2dfH8bOQ7nC0YfiRDKsKi7m2/in2O1S8SjTSE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785578578; c=relaxed/simple;
	bh=f0lhecWrDqx3IxGVZagvRbb1uTrz1IHPtst/1FVavxc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=WKxzIySrqGNE0/CfLBGJjXTb93OtfUSuAeVK/3J7mq5H5CYB33ZwsxpQlqtfn0uqYrJyGNCFNBH4aax9FcPIxKjiGZVSyuf1BEaFsUADfcTdC2tQFWjgJBjZfT5YRcVyUOHWm2eym4DKAXKsCQgwNeMqvTOV4Q+tFi+b6dUp7g4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.126
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aV1w2T0zopabaAz+AS09Gk92ukCZ0/jBl8ewcqKcjiTPI6d/ilfMgRWDX1NMNQp1sp3mOdTaQUQZAKpKb5MzhSyQisEGCtHhixGcjgZfxCZq9WMu9+YY29HdWaS5uiDroD8Kw0G73yLO4V6v/5qBlI3eAH3fVvhdHvT4i2r42DT8moe42EIivJi1kBuKr+x09iI3vDiLmPMQuXmd+P2p9MxrIp+i8OVfS/tIjn90tefDdEwcIzPNvbuxF08Lv61z+fus7qGO9VR+1SXGQynvRSSJIJoNS+YU6JSzEgahtCVfDfoBqKFkKGWsx/L1AmPy5Svel0WxmWO5SwPk1+knqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1J2H896FyaWMobvkB+5SGam4bUw+snh9/frwWa4ES3U=;
 b=Pwod07fyrM55tsj63HSf57nZbyxgysWCWbKP/jjsi6GhB/q9kFwRl5PSHg42feLZmIbd+E/ymz2PhIzyaMCvUwOvwIlfRabJuB1Y3CLwe+9rhFXvmtsHoXYpQsg3Xd90PiHdapZBsbV4VLin5NhUTBbRJYNH3Ue1Ol+DstKkPxJYKGBZeDl7QRAc05YHQofaPFPTkXu61fcn6VJlcfI2SNq8ga49mfrQvUnPt6VhniY277iIs3/pCEqjTMqCM/TzCQ6d+D583vTGb1dB1yYjV7iqH/RZBP3e1vhtaQWWWJqFhvdckmeaFo7K70yR2tlL2ysGQINK5DrJk1tBSsRB6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1138.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.16; Sat, 1 Aug
 2026 07:27:36 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0270.015; Sat, 1 Aug 2026 07:27:36 +0000
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
Subject: [PATCH v4 12/21] pinctrl: starfive: Add StarFive JHB100 per0 controller driver
Date: Sat,  1 Aug 2026 00:27:02 -0700
Message-Id: <20260801072711.153217-13-changhuang.liang@starfivetech.com>
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
X-MS-Office365-Filtering-Correlation-Id: 730866cd-6b0d-4049-c855-08deef9e5c08
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|376014|366016|23010399003|1800799024|6133799003|5023799004|56012099006|3023799007|18002099003|22082099003|10067099003|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	IjrgN8sOaFIgkyX0jUgUf4QF6LpDgLTSt/KqrYW1h/ooExRCHVYhx9zz8zT76vupWEQtvYaWa3YnUlGleWtb1gVAfWwfR2kr22Nv0TwYTJNxWhC+kiCLIDUrlj7crjjELFLHaatwz63M6PUAjfw+Vllqb3d4rW0clMyjEokB2Mpzj/xt/vJVpMWXhM6IG25BP3xi6m6XK0FBUjX+FUBSYrNfjRix56hw/g//VaqUArEGNxwMInTTmiBRuSOJsr7X7ay1CvAeyCkUVq/SM9B7eRclrfjJ8LjPLLk9WopGs6I0YmvpTK8YLdzDy9k3hqHSThmjtZk5EeBUjwfHA3uNw+0Z/sI+zGi2uFRZcIEZqXGLra4p7wbIbyjseJU831DMeq1+SpAmD1+y8rugLGsH/Vl+fNFiMlLm98bOyzbz4n/V5mpOw+g4Fv8lbJ5EDGHv/ViYRXib78puTkSjgPQtOcRh3aqu+qr6e0AziNK64ILXjpVn/VUNhdjkl8DLC7xzjhimgZVXaOViUfJ5aYrmE9V6QXu3Fw7l2TgV7SPLzazO71i6kGYDgVVND7oFsPXlPdOTKPXGRoflDX5f+k7wLA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(366016)(23010399003)(1800799024)(6133799003)(5023799004)(56012099006)(3023799007)(18002099003)(22082099003)(10067099003)(921020)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?UEkPa9s+klRZcPOGqRjdThyRRWs8zyjubZT38DG4lupQBC7ToxTpapQcTMd7?=
 =?us-ascii?Q?ivZzqBL6jIraYjDzaZ1AgTsWJsB3eD/v0OenzhjnaRkZZTMbVjibo+TCiL+u?=
 =?us-ascii?Q?MXECRlWfFc94dTEuWHF/A80LQeynVH/NFbVHLhZr3su0RSA86DubiROTfN1b?=
 =?us-ascii?Q?WaLlGl/QEX6+mqXGFH4QJq0zb1gXNE+/VojQLE1E8KQhrrlk4NReYN53jccY?=
 =?us-ascii?Q?7HGcKJXGS627j+z5NsEApHJ5OsgF5UryZJ04jPC0GzJb+Q5KFWFfjypXJ4NL?=
 =?us-ascii?Q?0OF8wa6m+ueiSkCrYW6ezzjMAvYw3/M3jmgC48d3Hgz1tQCO+JiX2Dp959iX?=
 =?us-ascii?Q?JxQNteu2NZRYiTZGd/baIxZStLKBcqZXrhD5M0bsrXlE3PX1v37PAaS/MiaA?=
 =?us-ascii?Q?czboXvayq6kB05S4pXSbcHLjag5rD7NCwkxQdz1XRLQbLDY56Kxth51UANsv?=
 =?us-ascii?Q?8e2Io2uYPW+vG1+kBUkqm1svOCYd3qebDMW3ItZtOakfWQ9jdLipD2cD/Jj9?=
 =?us-ascii?Q?eFtVfYkpe/ouknhUuoALbqoOvZdxwbHTtHRRvcCieS+fqP7QZ5lWO6EQlxgx?=
 =?us-ascii?Q?N+7fDjRJFSvTwbfr4sTzPwqtCAyt6rX12f7B0sTUbcVTHWVqzVRlAZ5ry6OR?=
 =?us-ascii?Q?6kckb64lh7ZxJ0qnovBsFs2Ne7weyqgcsu80rgr2jJysh/oGf1dM1XG7MQEj?=
 =?us-ascii?Q?1UsB+KF2Bmksyw64PaBMlTe7+HYBZ5cps88GEZYHsREUfhC7lqxwuIC6ygMe?=
 =?us-ascii?Q?2QmPoIxRbzDOfpxto5O/XhT/PsrarT/u1MhvDoyNqp4T4qeJj+oViO2+XTzL?=
 =?us-ascii?Q?Fnao/BfbXw0H1HT+URO/HUHWJqjHT+4j0xGM0pO9k/FujiG3AAS4ZWDD5PXb?=
 =?us-ascii?Q?KLhkh6pkIeAXJY+e333Ji1SnXYMauzch4TO0eHbMArsFcnlofwR412EA2qOx?=
 =?us-ascii?Q?mlD0rqrwebNs5iv1hWXKGsdFKuumo5GWfZb9vQc/pxTqHApeTWlowAyT75E9?=
 =?us-ascii?Q?bV/sg0LM+ZBsSFA57DRSvLZTFmxuevHUMzHZzsipP0XJP90nwY9FLFUwEIT/?=
 =?us-ascii?Q?yqnPUj70r/CiiuVOyeK1gg4HuzYu9eXMqSrnZR/YqSxrYg/pJ2JfZESKs5y4?=
 =?us-ascii?Q?k5OJ62k4bYjzc7bFdhkMmlXW+7Unuv9kWUXD84+vdCwu9XIJC74PGIGvEoho?=
 =?us-ascii?Q?AlQJwfjdfrYEZjDeDba+olaCb0rHOyOKJu8YX8NaMpsFnUeO0ic3f5XMJJO/?=
 =?us-ascii?Q?B9mnhGbnpmWNSPknxsYrb4UEjlbwfrUMeJjQEEOCIoZp+AOzjcYzLthyeyXe?=
 =?us-ascii?Q?BfzmejsfMvsUaKibYnlI5k1S5GYwB9+ef+VgFXPup97aFrq7gs1qI5nCCY3k?=
 =?us-ascii?Q?CjV+qBsYwyspU/DSYm4YDxUCzcMLUp0sB9f+2dcdaF+Nm1mIFPG2I/2H4hdQ?=
 =?us-ascii?Q?prreZLL2MsOxTCoYWUesCJhK6D9NlK0x01W9Y/8nM/WoXXWFGY7Qf//1eNat?=
 =?us-ascii?Q?F2ezxOliysYZskuFUsaJFrGv+zVPflZ6T/UvGBIkwIqKX1K5iLaIT0AFlqRX?=
 =?us-ascii?Q?TWSok5V4SUtGraVqBO7YFdVYiCmP3vdLaF0RqGltqoVuMIO0H0cu63IChPmL?=
 =?us-ascii?Q?fTgzoVVwDKXmW3DcmzCroHM8Ck/bOo39cLHi9gyGkNqlqIVExhqGKUqEFPYo?=
 =?us-ascii?Q?cwwf/VYl1AaraDHmffkPh9H7h52bpkizR1NCnybrKWWsigiQvTs5qsRgDZos?=
 =?us-ascii?Q?0rmGRS3sfMxtsu5mku84OeutTamWPm3xGRzyJElF0JYx8GOSyYA2?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 730866cd-6b0d-4049-c855-08deef9e5c08
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2026 07:27:36.1897
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M3ss1a30GzPD1Zu4ZJejzZiXHqlx2KxkWouhYjyday6zYNmr1y5C6TbZwS1B7MYaTb7AFjUhBIiu50ABW0q/6FxK33QPUwmQOy9uHX/ZQoqPIH1wkgtCA7ucA2BbhHIV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1138

Add pinctrl driver for StarFive JHB100 SoC Peripheral-0(per0) pinctrl
controller.

Co-developed-by: Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
Signed-off-by: Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
Signed-off-by: Alex Soo <yuklin.soo@starfivetech.com>
Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 drivers/pinctrl/starfive/Kconfig              |  11 ++
 drivers/pinctrl/starfive/Makefile             |   1 +
 .../starfive/pinctrl-starfive-jhb100-per0.c   | 153 ++++++++++++++++++
 3 files changed, 165 insertions(+)
 create mode 100644 drivers/pinctrl/starfive/pinctrl-starfive-jhb100-per0.c

diff --git a/drivers/pinctrl/starfive/Kconfig b/drivers/pinctrl/starfive/Kconfig
index bb298419ab60..ddd39807e222 100644
--- a/drivers/pinctrl/starfive/Kconfig
+++ b/drivers/pinctrl/starfive/Kconfig
@@ -57,6 +57,17 @@ config PINCTRL_STARFIVE_JHB100
 	select GPIO_GENERIC
 	select OF_GPIO
 
+config PINCTRL_STARFIVE_JHB100_PER0
+	tristate "StarFive JHB100 SoC Peripheral-0 pinctrl and GPIO driver"
+	depends on ARCH_STARFIVE || COMPILE_TEST
+	select PINCTRL_STARFIVE_JHB100
+	default ARCH_STARFIVE
+	help
+	  Say yes here to support Peripheral-0 pin control on the StarFive JHB100 SoC.
+	  This also provides an interface to the GPIO pins not used by other
+	  peripherals supporting inputs, outputs, configuring pull-up/pull-down
+	  and interrupts on input changes.
+
 config PINCTRL_STARFIVE_JHB100_SYS0
 	tristate "StarFive JHB100 SoC System-0 pinctrl and GPIO driver"
 	depends on ARCH_STARFIVE || COMPILE_TEST
diff --git a/drivers/pinctrl/starfive/Makefile b/drivers/pinctrl/starfive/Makefile
index b817ad93b91d..f2bb0c35a2a0 100644
--- a/drivers/pinctrl/starfive/Makefile
+++ b/drivers/pinctrl/starfive/Makefile
@@ -7,6 +7,7 @@ obj-$(CONFIG_PINCTRL_STARFIVE_JH7110_SYS)	+= pinctrl-starfive-jh7110-sys.o
 obj-$(CONFIG_PINCTRL_STARFIVE_JH7110_AON)	+= pinctrl-starfive-jh7110-aon.o
 
 obj-$(CONFIG_PINCTRL_STARFIVE_JHB100)		+= pinctrl-starfive-jhb100.o
+obj-$(CONFIG_PINCTRL_STARFIVE_JHB100_PER0)	+= pinctrl-starfive-jhb100-per0.o
 obj-$(CONFIG_PINCTRL_STARFIVE_JHB100_SYS0)	+= pinctrl-starfive-jhb100-sys0.o
 obj-$(CONFIG_PINCTRL_STARFIVE_JHB100_SYS0H)	+= pinctrl-starfive-jhb100-sys0h.o
 obj-$(CONFIG_PINCTRL_STARFIVE_JHB100_SYS1)	+= pinctrl-starfive-jhb100-sys1.o
diff --git a/drivers/pinctrl/starfive/pinctrl-starfive-jhb100-per0.c b/drivers/pinctrl/starfive/pinctrl-starfive-jhb100-per0.c
new file mode 100644
index 000000000000..eccbd83de8c4
--- /dev/null
+++ b/drivers/pinctrl/starfive/pinctrl-starfive-jhb100-per0.c
@@ -0,0 +1,153 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Pinctrl / GPIO driver for StarFive JHB100 SoC Peripheral-0 domain
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
+static const struct jhb100_pin_layout_desc jhb100_per0_pl_desc[] = {
+	{ .pin_start = 0, .pin_cnt = 60, .name = "gpio", .gpio_func_sel = 0 },
+	{ 0xff },
+};
+
+static const struct config_reg_layout_desc jhb100_per0_pinctrl_rl_desc[] = {
+	{
+		.pin_start					= 0,
+		.pin_cnt					= 60,
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
+static const struct pinvref_desc pinvref_desc_per0[] = {
+	{
+		/* gpioe-i3c0 */
+		.pin_grp = {
+			PADNUM_PER0_GPIO_B8,
+			PADNUM_PER0_GPIO_B9,
+			PADNUM_PER0_GPIO_B10,
+			PADNUM_PER0_GPIO_B11,
+			PADNUM_PER0_GPIO_B32,
+			PADNUM_PER0_GPIO_B33
+		},
+		.num_pins = 6,
+		.range = BIT(JHB100_PINVREF_1_8V) | BIT(JHB100_PINVREF_3_3V)
+	},
+	{
+		/* gpioe-i3c1 */
+		.pin_grp = {
+			PADNUM_PER0_GPIO_B12,
+			PADNUM_PER0_GPIO_B13,
+			PADNUM_PER0_GPIO_B14,
+			PADNUM_PER0_GPIO_B15,
+			PADNUM_PER0_GPIO_B34,
+			PADNUM_PER0_GPIO_B35
+		},
+		.num_pins = 6,
+		.range = BIT(JHB100_PINVREF_1_8V) | BIT(JHB100_PINVREF_3_3V)
+	},
+	{
+		/* gpioe-i3c2 */
+		.pin_grp = {
+			PADNUM_PER0_GPIO_B16,
+			PADNUM_PER0_GPIO_B17,
+			PADNUM_PER0_GPIO_B18,
+			PADNUM_PER0_GPIO_B19,
+			PADNUM_PER0_GPIO_B20,
+			PADNUM_PER0_GPIO_B21,
+			PADNUM_PER0_GPIO_B22,
+			PADNUM_PER0_GPIO_B23
+		},
+		.num_pins = 8,
+		.range = BIT(JHB100_PINVREF_1_8V) | BIT(JHB100_PINVREF_3_3V)
+	},
+	{
+		/* gpioe-i3c4 */
+		.pin_grp = {
+			PADNUM_PER0_GPIO_B36,
+			PADNUM_PER0_GPIO_B37,
+			PADNUM_PER0_GPIO_B38,
+			PADNUM_PER0_GPIO_B39,
+			PADNUM_PER0_GPIO_B40,
+			PADNUM_PER0_GPIO_B41,
+			PADNUM_PER0_GPIO_B42,
+			PADNUM_PER0_GPIO_B43
+		},
+		.num_pins = 8,
+		.range = BIT(JHB100_PINVREF_1_8V) | BIT(JHB100_PINVREF_3_3V)
+	},
+};
+
+static const struct starfive_pinctrl_regs jhb100_per0_pinctrl_regs = {
+	.vref			= { .reg = 0x004, .pv_desc = pinvref_desc_per0,
+				    .num_pv = ARRAY_SIZE(pinvref_desc_per0) },
+	.func_sel		= { .reg = 0x11c, .width_per_pin = 2 },
+	.config			= 0x014,
+	.output			= 0x104,
+	.output_en		= 0x10c,
+	.gpio_status		= 0x114,
+	.irq_en			= 0x12c,
+	.irq_status		= 0x134,
+	.irq_clr		= 0x13c,
+	.irq_trigger		= 0x144,
+	.irq_level		= 0x14c,
+	.irq_both_edge		= 0x154,
+	.irq_edge		= 0x15c,
+};
+
+static const struct jhb100_pinctrl_func_maps jhb100_func_maps_per0[] = {
+	{ .func = "gmac_mdio",		.val = 2 },
+	{ .func = "gpio",		.val = 0 },
+	{ .func = "i2c",		.val = 1 },
+	{ .func = "i3c",		.val = 2,
+	  .max_pin = JHB100_FUNC_MAPS_MAX_PIN(PADNUM_PER0_GPIO_B23) },
+	{ .func = "i3c",		.val = 1,
+	  .max_pin = JHB100_FUNC_MAPS_MAX_PIN(PADNUM_PER0_GPIO_B59) },
+	{ .func = "smbalert",		.val = 1 },
+	{ .func = "wdt",		.val = 2 },
+};
+
+static const struct jhb100_pinctrl_domain_info jhb100_per0_pinctrl_info = {
+	.name			= "jhb100-per0",
+	.pl_desc		= jhb100_per0_pl_desc,
+	.crl_desc		= jhb100_per0_pinctrl_rl_desc,
+	.regs			= &jhb100_per0_pinctrl_regs,
+	.fmaps			= jhb100_func_maps_per0,
+	.num_maps		= ARRAY_SIZE(jhb100_func_maps_per0),
+};
+
+static const struct of_device_id jhb100_per0_pinctrl_of_match[] = {
+	{
+		.compatible = "starfive,jhb100-per0-pinctrl",
+		.data = &jhb100_per0_pinctrl_info,
+	},
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, jhb100_per0_pinctrl_of_match);
+
+static struct platform_driver jhb100_per0_pinctrl_driver = {
+	.probe = jhb100_pinctrl_probe,
+	.driver = {
+		.name = "starfive-jhb100-per0-pinctrl",
+		.of_match_table = jhb100_per0_pinctrl_of_match,
+	},
+};
+module_platform_driver(jhb100_per0_pinctrl_driver);
+
+MODULE_DESCRIPTION("Pinctrl driver for StarFive JHB100 SoC Peripheral-0 domain");
+MODULE_AUTHOR("Alex Soo <yuklin.soo@starfivetech.com>");
+MODULE_LICENSE("GPL");
-- 
2.25.1

