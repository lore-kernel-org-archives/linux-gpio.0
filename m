Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2130.outbound.protection.partner.outlook.cn [139.219.17.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22552397E75;
	Mon, 10 Aug 2026 06:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.130
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786344820; cv=fail; b=NGB/1u/moo+cDZaYzQ6Q+GClF9cF57IVGa69Qag3xi8wles3Paa18Oeo1muIZ9G2hvVDv6iLg2uWiLNwER+VDQlaHr9N3ErPa5MutvubjuWp47ERvmN/3ToQKSqlSxLdqHEuwS7jwOz32xA4b2jProJbTWqNMRCMqW4ak0JZYlw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786344820; c=relaxed/simple;
	bh=XsbeZa1+ETQRca+5sPob7bO3nH2mi5ufHaY+jPpBYnw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=SIUB7aSARpuT946X52+QcoelXLmpDG98sX2Mqp9g8gshEwjKniv+12yd9KApouvcNshZUTTJYyhCCGRLBp7w2eS3UglFphTYxfNG5ydRihxpLBueoc4gv2YiosE7WwDhn29H6JxeeoBF9A9SuslN8iC0GEQocsPWKCn5x6qHEIs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O08TRsPMMOHEmtyYR5oiqEkWaz0yiv/hgyeB0crijh8gI24i/t0zq9VB6lbynSZR35KfrSi2mXcIPQk1EBb2vGyzi/jUMg1lKZ3mhDovMk3MASGuERTJLCqprNYWsyQCnZayKJAxKQkLA7PIrqKSjUdeaqsrUqFl25GNc3UjxAZY6KOl0MfGkDXrZtAJ3fpMrZx319uXgeAVAiYuY1wTSyRhoS95+nrFSif1u1NRuiV/Z01Rt4deNl8p+3bWAOPb2t0TCsuszPY3MPT9foR+gSA3orplLUe2JotyrVvfCF3mRmuFp0XTeLMYaZRYFkJRUapRcpyzQ4GG9QABex9mXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R8a+Y+I/rgrb4wsJHQ6U7o7ktzt+P/D7hRa1JQApIuA=;
 b=DIMe42Q019tObpuzwj9fbE00pVAzrwFkGcNiXfzwSDgEW8atTjQTDCauxDArhThGLhgZdqI+tbP1Ch8j3GNPZxD0ZTkMETTOeezp9psJijZZXbozawjgTUIfJ4VNo5lXwkCHskp/4/bJWPAEqKFvg5Z7ZMV//3ByDWIv0PbeKooHi6NCwwNMiWjSd9HqtFLC0ptSykb5UgY702whmU+84TkIXVlxCJ7E4nRkZxbNLEdu2vUBDOmzFgrVwvskAMQx+LLL8D6Tbx/Y43r7j++v5u0IlccwbPqClXfIL2CPVoTnY856hri1S8A2S2FyFdRCfDsp0Zf4RX6CAaOjA109CA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1315.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:15::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Mon, 10 Aug
 2026 06:37:09 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0292.024; Mon, 10 Aug 2026 06:37:09 +0000
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
Subject: [PATCH v5 08/21] pinctrl: starfive: Add StarFive JHB100 sys1 controller driver
Date: Sun,  9 Aug 2026 23:36:37 -0700
Message-Id: <20260810063650.239303-9-changhuang.liang@starfivetech.com>
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
X-MS-Office365-Filtering-Correlation-Id: f6637e25-1857-4968-0427-08def6a9cd84
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|52116014|366016|7416014|56012099006|5023799004|10067099003|6133799003|3023799007|18002099003|22082099003|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	AYyFb4rY7kqQO12bCyIUlCJrlB5WEt+PSmoeiD24GZ6Ft3+rw6BEpFqEurcOcFpzUaipA+zMXWbg0OX4UvBxSFNiQA46XZ4vwGaYw8TdSZg1WiTfoe4AX6DZS8uIAnKbuOOUY/SOoX5uWd5om/mj8AFaoPmNh7j0ZsSnXBdA6jo8mkp2MV5WyxCV4z6s6QKH5UKFZ5wME0GXlybi8nMjGdyDz8J6S7+vzsZMHJkReEBg2OUHemzfRwhDfu5H2fzy9VgDPRuNkUikjb253F3eerbR8EU2+2909YrmK7yU7FurExTu/hamcjioAywrGAq7XmqNYJnH0y6NaqQhaseoa6ZRQXLMveTK+dflf5nYePbLOWYGs0VzwdEL4EfSUvxM7X1P34BWIzSWk81kfM3XPDrTxlFTdfZ6zVpjWpWEhjhaaPKhN2sy+3Co7DMGkcMF12YelSlF4I8IJQp+Xpsz3rV2DbXVZ7r0z7Lm10SMMybAW+5CTOeemhxXFuKRD23dZIzrzA6UDz7Stw59OXgHdzDuJWNUWB08DPINgZa9hyX59M389Vk/AH5ozla6xiaOHcADF+LKUY/wPlfM2AlmQw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(52116014)(366016)(7416014)(56012099006)(5023799004)(10067099003)(6133799003)(3023799007)(18002099003)(22082099003)(38350700014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?2lRV+m8LAh888rTlLKcAE1EDcvu57mGnLuCHlvaVeOsKOft7fX8Jgb7+V5hb?=
 =?us-ascii?Q?SHO6fHHm9HnUuHAiozt/+os+J3s9wUprd7zEGTapj7UMhwQDyYfqV/DOdcZ1?=
 =?us-ascii?Q?sk5jB8jLMn9yA/6mUFidiNqmGMxB2W6qObX7JqNsAlJ8ExTSYf64jvuwOyTf?=
 =?us-ascii?Q?tR72BCCM+jXZyhd/KA1XD7axmdUd9jyX7KBGwAFhf88AVE08W5snpTPlRNYi?=
 =?us-ascii?Q?gHGDMm6yJj9ogh8d8/Et5JOhZrLUFfndsxNLSb4bQrIPHvjCe9c8ozEKTAvR?=
 =?us-ascii?Q?kIeAzZOp+yitNEFHDEQPA2me6sisG2pB8hhjIwKiV/9xqQBo3j2X7qygkKWS?=
 =?us-ascii?Q?y06thprWS2Zp/TvHixCXdrQnniKGCF8Vjg7f0J29S07G7kNkKuYVWhaJNZRc?=
 =?us-ascii?Q?hAazWRg+E2HzZVI6fmL23M0IaKpkRYy9almvjo0y30/0+CUX3yiCG/bSHnBT?=
 =?us-ascii?Q?jeThrqqe39lFq3RdJlPRd5gVD0huytybj6a3C6jGFIMyy1D494jsUYoraSKC?=
 =?us-ascii?Q?jRzu7NgqDMzMz94GPOa4tLHE+psRK4NeBocq0ZgpoTWiFUJVQ0XnWqvurefo?=
 =?us-ascii?Q?DWszlWDvhUJHOfPgV0kmmVTFUpTYy35bukWbq8ytZUB0y1dze8DlPbJZlA8k?=
 =?us-ascii?Q?HW02nYoGVWJjppz4K1MQ9N2yEOWtaxid3sDHPcvXt7agQv2C57l31vnIi/hG?=
 =?us-ascii?Q?n0d0nH9npDCcCELO2U77vOpAC+fu9JDL44zdEZv9dCSWp40uVzY8MNG9bl/+?=
 =?us-ascii?Q?l72894xklKcz0DvnrFnI+Phv8Z/uW72xITaOtYEOZDuPYLlzpPbG0d2BulD+?=
 =?us-ascii?Q?fV1KS8zwQI6H2YuZe5CR+siSe7SHfRexxvPIUi2oVpeEdrAhTvvNYMZQhzL6?=
 =?us-ascii?Q?EkHQxhcegUpVkoNN2IWuq/3UkZf5yQPf4KQeXPNdEVinZEcSdzLYmvWZdez0?=
 =?us-ascii?Q?ECGS3P7Ts5nQBjC2ZICy2D+56EWPqfNXr4OIYsbLPLTwUYKCiAHgjejDFFb7?=
 =?us-ascii?Q?C0yxBHVuoJLBrXON0eZRPjux01D6/ZW9K//Vmlk5KOJ08MvDBezNljZxsOH2?=
 =?us-ascii?Q?5bwp6KVIaQwiXa4Q7he0vr0rPj6bVPEl7OSVb0UHEMU/kAAH6E6PHXWFMo+N?=
 =?us-ascii?Q?rgpBQNBKNgTjamcQ+X3+9D1P9R6Pr1kVRwlNTy0KEyv4UBFDuawnY6wYlF3p?=
 =?us-ascii?Q?8LuS3wHs2CZfEahN5MFQngbHppOG4Yo10LR5h/3VUAaEDpqz5PcXqSCCZDgQ?=
 =?us-ascii?Q?eLIFMGegt8LfniFsDLWZsP3ntUHIl0kjpyUJ/pq5oHbTJ5psB4D+GVSqbavS?=
 =?us-ascii?Q?L253ag4J/yRexRlMDuUOGTmo4fRDdfNQWrU5IVdbmoPvd9pc5PcX1SwGDKcx?=
 =?us-ascii?Q?D5UKXCbydX0vu79TAH3g//LLAUqx85qYvxUUn/uBEVGI8/LRRMkblS//jD49?=
 =?us-ascii?Q?IuDo0oKAI7rhUWzjf2bvaUW9hN8m7Wyza/suWC/f6K/bpEXXIlRYQde15Dwt?=
 =?us-ascii?Q?YqH8Ls5gWNbnF3E3klq5R5BdEQ65Y/XAC6SuXCmv4o8u7TMqABfGAwt+Xzk/?=
 =?us-ascii?Q?wW05p4j/GCFSlpCrr92XRkB/fmsyZ7EFDV0ySA3IqCCwM+0/SZ43kZf/TWPU?=
 =?us-ascii?Q?jVD/3yK1j8sLTwQmjRbEhkTb8AwyCnIwxamysy0r5yN9iHCkkMA6jiOvj/71?=
 =?us-ascii?Q?zrEqjJFnTHUOIGbrTa3gSAd0YMU4cruzE+6dbVACCrk4+OKVMoXOhhWWokra?=
 =?us-ascii?Q?NA8kNVTsKhMv4Nj1UxYFqffhxcL60Yg=3D?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6637e25-1857-4968-0427-08def6a9cd84
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2026 06:37:09.2603
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Oxou+bFMkQ6cRPyNSUj3mPMay48sj20iQ/Yl6zaaiOH2M6KL2Obj264EBMOB+qUDwtWB8KTOO/upHPqi+65kPDHJypU8oCaPc9KsgHh6GSkHtaOKyzJNAKr1H3XoKV1n
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1315

Add pinctrl driver for StarFive JHB100 SoC System-1(sys1) pinctrl
controller.

Co-developed-by: Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
Signed-off-by: Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
Signed-off-by: Alex Soo <yuklin.soo@starfivetech.com>
Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 drivers/pinctrl/starfive/Kconfig              | 11 +++
 drivers/pinctrl/starfive/Makefile             |  1 +
 .../starfive/pinctrl-starfive-jhb100-sys1.c   | 91 +++++++++++++++++++
 3 files changed, 103 insertions(+)
 create mode 100644 drivers/pinctrl/starfive/pinctrl-starfive-jhb100-sys1.c

diff --git a/drivers/pinctrl/starfive/Kconfig b/drivers/pinctrl/starfive/Kconfig
index d4babf78f8c5..1cf43e0ae1d7 100644
--- a/drivers/pinctrl/starfive/Kconfig
+++ b/drivers/pinctrl/starfive/Kconfig
@@ -78,3 +78,14 @@ config PINCTRL_STARFIVE_JHB100_SYS0H
 	  This also provides an interface to the GPIO pins not used by other
 	  peripherals supporting inputs, outputs, configuring pull-up/pull-down
 	  and interrupts on input changes.
+
+config PINCTRL_STARFIVE_JHB100_SYS1
+	tristate "StarFive JHB100 SoC System-1 pinctrl and GPIO driver"
+	depends on ARCH_STARFIVE  || COMPILE_TEST
+	select PINCTRL_STARFIVE_JHB100
+	default ARCH_STARFIVE
+	help
+	  Say yes here to support System-1 pin control on the StarFive JHB100 SoC.
+	  This also provides an interface to the GPIO pins not used by other
+	  peripherals supporting inputs, outputs, configuring pull-up/pull-down
+	  and interrupts on input changes.
diff --git a/drivers/pinctrl/starfive/Makefile b/drivers/pinctrl/starfive/Makefile
index b26156a6d0eb..8d96cf80d377 100644
--- a/drivers/pinctrl/starfive/Makefile
+++ b/drivers/pinctrl/starfive/Makefile
@@ -9,3 +9,4 @@ obj-$(CONFIG_PINCTRL_STARFIVE_JH7110_AON)	+= pinctrl-starfive-jh7110-aon.o
 obj-$(CONFIG_PINCTRL_STARFIVE_JHB100)		+= pinctrl-starfive-jhb100.o
 obj-$(CONFIG_PINCTRL_STARFIVE_JHB100_SYS0)	+= pinctrl-starfive-jhb100-sys0.o
 obj-$(CONFIG_PINCTRL_STARFIVE_JHB100_SYS0H)	+= pinctrl-starfive-jhb100-sys0h.o
+obj-$(CONFIG_PINCTRL_STARFIVE_JHB100_SYS1)	+= pinctrl-starfive-jhb100-sys1.o
diff --git a/drivers/pinctrl/starfive/pinctrl-starfive-jhb100-sys1.c b/drivers/pinctrl/starfive/pinctrl-starfive-jhb100-sys1.c
new file mode 100644
index 000000000000..29e2788968b9
--- /dev/null
+++ b/drivers/pinctrl/starfive/pinctrl-starfive-jhb100-sys1.c
@@ -0,0 +1,91 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Pinctrl / GPIO driver for StarFive JHB100 SoC System-1 domain
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
+static const struct jhb100_pin_layout_desc jhb100_sys1_pl_desc[] = {
+	{ .pin_start = 0, .pin_cnt = 7, .name = "gpio", .gpio_func_sel = 0 },
+	{ .pin_start = 7, .pin_cnt = 1, .name = "espi1_reset", .gpio_func_sel = 1 },
+	{ 0xff },
+};
+
+static struct config_reg_layout_desc jhb100_sys1_pinctrl_rl_desc[] = {
+	{
+		.pin_start					= 0,
+		.pin_cnt					= 8,
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
+static const struct starfive_pinctrl_regs jhb100_sys1_pinctrl_regs = {
+	.func_sel		= { .reg = 0x30, .width_per_pin = 2 },
+	.config			= 0x04,
+	.output			= 0x24,
+	.output_en		= 0x28,
+	.gpio_status		= 0x2c,
+	.irq_en			= 0x34,
+	.irq_status		= 0x38,
+	.irq_clr		= 0x3c,
+	.irq_trigger		= 0x40,
+	.irq_level		= 0x44,
+	.irq_both_edge		= 0x48,
+	.irq_edge		= 0x4c,
+};
+
+static const struct jhb100_pinctrl_func_maps jhb100_func_maps_sys1[] = {
+	{ .func = "espi",		.val = 1 },
+	{ .func = "espi_reset",		.val = 0 },
+	{ .func = "gpio",		.val = 0,
+	  .max_pin = JHB100_FUNC_MAPS_MAX_PIN(PADNUM_SYS1_GPIO_A22) },
+	{ .func = "gpio",		.val = 1,
+	  .max_pin = JHB100_FUNC_MAPS_MAX_PIN(PADNUM_SYS1_GPIO_A23) },
+	{ .func = "host0_port80",	.val = 2 },
+	{ .func = "host1_port80",	.val = 3 },
+};
+
+static const struct jhb100_pinctrl_domain_info jhb100_sys1_pinctrl_info = {
+	.name			= "jhb100-sys1",
+	.pl_desc		= jhb100_sys1_pl_desc,
+	.crl_desc		= jhb100_sys1_pinctrl_rl_desc,
+	.regs			= &jhb100_sys1_pinctrl_regs,
+	.fmaps			= jhb100_func_maps_sys1,
+	.num_maps		= ARRAY_SIZE(jhb100_func_maps_sys1),
+};
+
+static const struct of_device_id jhb100_sys1_pinctrl_of_match[] = {
+	{
+		.compatible = "starfive,jhb100-sys1-pinctrl",
+		.data = &jhb100_sys1_pinctrl_info,
+	},
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, jhb100_sys1_pinctrl_of_match);
+
+static struct platform_driver jhb100_sys1_pinctrl_driver = {
+	.probe = jhb100_pinctrl_probe,
+	.driver = {
+		.name = "starfive-jhb100-sys1-pinctrl",
+		.of_match_table = jhb100_sys1_pinctrl_of_match,
+	},
+};
+module_platform_driver(jhb100_sys1_pinctrl_driver);
+
+MODULE_DESCRIPTION("Pinctrl driver for StarFive JHB100 SoC System-1 domain");
+MODULE_AUTHOR("Alex Soo <yuklin.soo@starfivetech.com>");
+MODULE_LICENSE("GPL");
-- 
2.25.1

