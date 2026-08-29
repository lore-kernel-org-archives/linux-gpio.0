Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2120.outbound.protection.partner.outlook.cn [139.219.17.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 629A430F7FF;
	Sat, 29 Aug 2026 02:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.120
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787972297; cv=fail; b=IFDlAQ3FbLy1qtRVfBxKxSLh0JLMGaxqFpVCnthlfNa9N+SQOUtrcxmHppnCWL75IRxVS6JH3nWxKoKR+2XCDyXPxFbW7xerQIwk+nAOCbhOfitYmbnWbSbO+LnFu70OOpBDfcynbZ7+gRmup12qAWfXe0DOfEOolnxujUvKZFU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787972297; c=relaxed/simple;
	bh=qquvWs9xoUF66j9w1nRjNSxo02agtl6UaZSmI/vzUEI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=bArww17y7rhDMWNuWrn8Q6hG6/nzSKIRuGwv5aBTFt4+uvWaAp9cPsx+TCSqItMbY/wqpI/UWVogpbGCOWI6uD3rKWmKcVY1fAKHaA2bqAbgYqUTQGDO1pxwS8HjNiEUU3Iy56OTGQ7pRxgBrFo0X0n7JOeZA6w3fdXA+KyfKcA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fetkduNJsQcBmn76UgrBP226RY+cqPHILBLiTjZ42jwMSqjO10TOR2Jd2oMp4xk4Bp88nukiItRMD43uRcSiUAwgFZJzlLVWGcNWnRTqt2NYnuXM7VGkuEcqp/nK1gTplaEAxqBqHoi3Iku5rQEyzxqaxqV7yY4GUc3W4faEan7ooKdyleLL+1oME+s5Fk0GX10VUbOfW6xA20UO4SqNPrb86Ve5RchVxrP68bCQR9Ht3NFIP6avMKnOjgQdox1QyzwB0pDIeuinLnpLNohlgc4o6yvg2/SZL0DObtYpdHAj6uhBjrRl71wSeiD4q37Iyi9bbuqnj5cpA3AXyAfVKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h1Z9Bih+nnOAMh38upBVLb7HQFapikXB8pFZ9g8KBj4=;
 b=mCa+OktlA0qGn+D1eZcbIF5ib4Ah7IBLbNEwlhK0Nk86Wz/lYkDFJ0o2VkOVdYsn5g0FDOGL17WxA23DoYlPy0ifxAAG/Tts0rJlhgHCc8aaZspTTrSReNOQHo1/L7ighzc5hWI9D9ypTGimRXlC3B08nDeVGiLV3M+ozG6F2Z3rsjB0tloWl7/b1y7fgH1UedMURNJ/g9753hMpTz5BySuWJbL6jV40E8uPbPXVae23nQfNs65a5rMTM1jyNCu81EeECDKTkev3JJIloErFW4fO+PiNEtEKxmTVf0H8WOsMdnYVGeYjSM+kGPwvw/RHFVPZ38yllAOnnaS8Xxcksw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1329.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:16::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Sat, 29 Aug
 2026 02:58:01 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0315.011; Sat, 29 Aug 2026 02:58:00 +0000
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
Subject: [PATCH v6 20/21] pinctrl: starfive: Add StarFive JHB100 per3 controller driver
Date: Fri, 28 Aug 2026 19:57:19 -0700
Message-Id: <20260829025720.23915-21-changhuang.liang@starfivetech.com>
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
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1329:EE_
X-MS-Office365-Filtering-Correlation-Id: 074028a4-ef81-4015-6f06-08df0579565a
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|7416014|366016|52116014|376014|22082099003|5023799004|56012099006|18002099003|3023799007|921020|38350700014|6133799003|10067099003;
X-Microsoft-Antispam-Message-Info:
	+cy4C1ugCgFrA2xihrkQJRzw+jCStM7KMVob8V8l8V0L2twLmOa8C1JeEXwbjbIhjqyS+y+RkmIlwFg1IOaxchjZjwG8pFKiCS6XF4e3OaWvaioizmwHyoAQIZnmoov0jMLFJ351HaGyjiJ3hImOK5WnNNvnLUmfWk9BUNmLV2Z2Tj+flBW8CeFAiSP+pcFEK+YpvW7SEzCqDqmZ7SlYIbF2iIvbI8PDU4QjnPxp4NG5sanwuoZdid4tH3iUyiGRXqCi9YqRlnXfSbXod/nqXDcSAQUmpET5V6SLOnJ+y0YhgNOmd15rIbh8jrHmSY5cNmzI13Go/bMxgXvRcXZz5B9G1dOy8LlAiyxBLG83z1rXLwBuscxN/64PmRxZGAq1fvM8IuTZbKVMm/fxYBzTvswW3o7YV3FGCbnCJpxjCDE/f0/1rxQRlMsR9F2fIUEdLTtIM4na25u//jBkRL1IGN9+gGklHuUF/SdHdvqDJMjQViJqp2tWAe72F350nfsszQpVrSq1uHtC++QMBoK4Vt481YsPDB0t8jkuyK4UEvae198kZ+Z3WMDqNA0zVhNOKb+JdjfXCZkwBYDWz9/yFw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(7416014)(366016)(52116014)(376014)(22082099003)(5023799004)(56012099006)(18002099003)(3023799007)(921020)(38350700014)(6133799003)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?JL03Mrglercc1oOIUv0xiPK9UeUKx85oEa/mIcSJ5br26YUhAgTcek8zzF7Q?=
 =?us-ascii?Q?BVNHOIr3gThFS0RJgLS/ZuY8hV9vRz305/jI5/owOmSF3UQWcTcdDZRQrXwQ?=
 =?us-ascii?Q?4fyc+mCBIkaRLaFTAtAgCDOKZkFuujnAe5g2fbRQf9oCSJm45igsD3jJptE7?=
 =?us-ascii?Q?1aItpQPhuaWu2pj2Lx538nqEiZXi5aMrk95Ty/480hRumo/be1mCbLX2TmYe?=
 =?us-ascii?Q?XiQhd8D2PrlC17B4/9Walu5yl+DJwCeOo0VYIvSSSk2RLqSMLxx9DTIrXBdv?=
 =?us-ascii?Q?hvnnGFN8e5VQPN+j0FbIZY0Yba+k6JWMakeDbNqdxLY6qdQf4lKFZytcRxvE?=
 =?us-ascii?Q?qCDjiQ3/DD9UIASjSXqyKAyJer2q70o/SIPuuddu2kmnYEdcUFuncvi6ReAW?=
 =?us-ascii?Q?DOMV6D9v36EmzyT/nKIl5e8eItsy9nEJlnZIm08HOMyzFZvjGXw6GrZhkP3U?=
 =?us-ascii?Q?/D26AEKgxmurOdUvr9BfiC+AnWRpwflVQQxpWS5PS6PY3R4pR85ja97m+2vv?=
 =?us-ascii?Q?sDhLXzgFA9r6tJ1/iY0p1MJR6c1jOEJcTmxXzaVuOsKaujDujqZQJB0TGl84?=
 =?us-ascii?Q?mqiGNz8fUv92qF638Po+JaCQDkYsRGWLuEZIbwGC0yNuNcAB82kB3/GTIvR9?=
 =?us-ascii?Q?fKU7fa0A7cyLY1e+AbU7/HHYCqm690SNsa7BMF1OGRKOjKarA8zUEf66tmLF?=
 =?us-ascii?Q?657pSIKj5x1TWA3hx08m7BIhU9sQ4SPyizY9EyL669dpj06JdGRH1Bg5tA92?=
 =?us-ascii?Q?yhhezkqKYmhi44Mp/aDNO0+t1CWH+PYoKIwzW9Gcmi0Oks2CQ/MM4IRBb6VP?=
 =?us-ascii?Q?zLRXaUtgiZ7q5RIxkXqr1bRpQDa/RXt8Dxxe06b87fwfDq+2Gn8ZbiixPir8?=
 =?us-ascii?Q?DaaKLrF/0S3o215Elga/LegNWNUlvjTriFPvq77nWNdidL4cQ0E8kPqvdhWU?=
 =?us-ascii?Q?AdKBP/Nt+AtA8A/qvxNhInVj0zoC88+EqAyoR/FmFQ4Kmr9yjBIsfDKk6fTp?=
 =?us-ascii?Q?+uQGUjvnNKmkATqFg3AhfbYfPUcZ73iogXHNi/SUY+DfO5l1KVgTjb74LzvO?=
 =?us-ascii?Q?PD9wTFO77KCbMSrNutqcv1BfbKRN+jDVdClcT89x+BSx4rKsBxZYOdLQ6HmA?=
 =?us-ascii?Q?Camkviai9uO9T6a2KlIlexjXD5XaBuRi7xEwRhYga7j8cPHw/m60+eTARPJY?=
 =?us-ascii?Q?YZpHWtZdnADRy08UHwa/JWLDEQ65NR9B3DL/ZxFNT1SuP/rrhQkRp2saXlM8?=
 =?us-ascii?Q?le6BKpZgru7ZMV6gXv9nnEUGYlz1T5XOdU9iHE7kt9HRfzBcoPKXvzdc6Afo?=
 =?us-ascii?Q?XIFIhE5C+IcutcM+Zs7OVrMU+VW4K6EnWscPO3spAmgKQq8V9n5k7cmXjIMs?=
 =?us-ascii?Q?gDzAgsfZUPNQlSdPPPAj7e9LAPpJxc9n1OjhNR7cjZlvJIhuit3BhL0HL4qq?=
 =?us-ascii?Q?f/QeR65CG2/pStimP7OKZL9dnKMEld/mtJoVzuzIiJSSpR3iNTzV0IZ7Py0X?=
 =?us-ascii?Q?GRuraDhyZqwmqMjv3pcZfMZ9yXIajHvC9spnsKHrmCWC6ie1yLY6+4ScynFu?=
 =?us-ascii?Q?aqlTT9pBGQI6GXJe5+daMLkjwTjqrdJB6w4nej/W7ZPtAk+agEiWL7kknLva?=
 =?us-ascii?Q?kEOGGq8G0LsqyHYcOiV2q2AlCe4ejCbVQpoguAPvKn1maqMyz8M1hEDn158T?=
 =?us-ascii?Q?raf5MsrFjFKkDltnR1icy13dL6wtaOo1AovRyq9jpOP2HkyhNO+Xdb/RV70o?=
 =?us-ascii?Q?eH+C9wq777vj+J+f6B9XKBG95gdCq0dmH/4cHv9hUwjoKs0Q/RXd?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 074028a4-ef81-4015-6f06-08df0579565a
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2026 02:58:00.8809
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mJX/EtkP4tfctcrH2R8bxg8u2FB/ao5DRzCOFJI2jZIr+yphtGa5cJL4vr4hWKCV6gW4VaMv1fggdq1VH3dXVB+3MQSPoN2sYXNCHx9KVMMH7Vt8Oadhcrohis3l90Kx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1329

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

