Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=139.219.17.129
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793701383;
	b=IUCAwJ6xymVtfDh2IE3W7smXPYRdv1vGxdSQAvlyesD8RrgXeTPjAXQpTh7JceaWexfW
	 tQl4t8gwy8nYNN1Yxv1v/t8z9r0eJmH3fIy6M3Pjxsz2VHQXtqu6a1hDTm7zlsCh3Hqxr
	 akNL8lviyoeUJ7/7tnHg535qIyhMlZV1pkBi0u41S3b4eFR+Ml0u6XlHs3yHwCT6l9ST4
	 +kgfKNDDlzSXoEMyfTOjcbIVFHWTmac6dFiM7KJU4seP2pagCRdmCAGFB1loItofE9jZc
	 F8zQ33PFT4udoCsYIBS491wrhVTQzZNGqTcJQYJ1aGe9PQXD/l3HfNirm+3EAfeUIsg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793701383;
	h=DMARC-Filter:Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:Content-Transfer-Encoding:
	 Content-Type:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=Fg9RbYaao15Dc5QDyQ0gkfoBb4Fe3fSXIAbgMbRP9ZA=;
	b=MecV3UNUaetpcZD11xgysx6paWMSMqZdTxeIiqw5O6NTibRhnPeMt78FKufiMnfdgNRd
	 FIu29SDZca8O9+9mk+Neqz1xd9QcIhWEnD/wR0O0j9nfetoOHZEIkoG57uPy7JjEzDeK2
	 9BnYOH8qGjUy5ZFgt4Z59JnEKXoi8TcHHCSc6ifACODdnEUc7pzkfheEa8P8xIxniSt/2
	 /BchY7mhDnFxPSam2DvX3iP/FeJwVvGGnZKYwK6Cfi7IvRGo3PKCwuqCVRZiOh96h6GGT
	 blBJtjrijm6SX459oa6DtCz2YtfT+UKlSMJ1Gj36/h1e2UqKN05c0YMij55mWmg7Iag==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=starfivetech.com;
	spf=pass smtp.mailfrom=starfivetech.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=139.219.17.129
Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2129.outbound.protection.partner.outlook.cn [139.219.17.129])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57044606FACF;
	Tue,  3 Nov 2026 10:23:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57044606FACF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ioeH/gnZ7aBO/Sl/YlbYt7v2KHOLfbVesS7noCspHxuP3Mp5jjmTZ0WRjZ44LtVTNa4j5IdncV9MGLTIpzeMGkl9GDW/VbjC4qpiDkCN+AFxOCuI4f7ZBkWmsPuwf973ufgujEjkintvlQ2sgBmoJUgOn57iEBt7JOFHZDVuNQ/ki8d7B72uB2LijQTzPUsyctVYLKrKZjMh7VthJW9HyEbVCXJ0QVY1yDYnSZHF89u4mlOr1eqnIH8A70iHew0fASKiVmh2F8O/lcMP9OVA9XIxNdYRxytPTIkw7sQ8qecWHRIV6nIgu+q13u4GBTPUMBpv7z4acvx5qLZihGz+HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fg9RbYaao15Dc5QDyQ0gkfoBb4Fe3fSXIAbgMbRP9ZA=;
 b=eWORBuYwEMqWrZH5T5kgP0Vs4cFm5aMYySNnDq0akDVx1SCSMeh04GGhp8+SIAQ6GBVPiIE3MOJud1tEri8WPhtVy/tTtPGsVR2QHHa/T9q3DSBULCCy0yLWt2EQvoG7dNjSKSCAwYD/0CCS5KHRR41GhcLBsWNtromB5cb6dOTSq9MGsnA04+RD7Yt9pdXJ7TZzREzOWT8oWrYbrVBMKlVlnf2e9w1LNMU0byFTf//FpA4YdcnvgEuC7l3pvvCiUN6jpXo+y367EzalRf6154gZIMZ1eo514z+LKC8S3/kSPcYw+3YnVbDn+cPM5QhRhtj0tYFCKiSN9lBnuWeM5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1329.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:16::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Tue, 3 Nov
 2026 10:22:51 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0569.011; Tue, 3 Nov 2026 10:22:51 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>,
	Changhuang Liang <changhuang.liang@starfivetech.com>
Subject: [PATCH v1 RESEND 6/8] pinctrl: starfive: Add StarFive JHB100 emmc controller driver
Date: Tue,  3 Nov 2026 02:22:34 -0800
Message-Id: <20261103102236.96872-7-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261103102236.96872-1-changhuang.liang@starfivetech.com>
References: <20261103102236.96872-1-changhuang.liang@starfivetech.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BJXPR01CA0066.CHNPR01.prod.partner.outlook.cn (10.43.33.33)
 To ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn (10.2.3.102)
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1329:EE_
X-MS-Office365-Filtering-Correlation-Id: 947c3382-9da2-4887-94af-08df39946a1e
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|23010399003|6133799003|10067099003|261102123227099003|22082099003|18002099003|3023799007|38350700014|56012099006|5023799004|261022075727099003|261026121527099003|261026140227099003|261021121427099003|261022105027099003|261009223027099003|261028144727099003;
X-Microsoft-Antispam-Message-Info:
	JgdVdEC9L8plkJJN71MVJPSojghWREIQYPe+kbzi7C24gRTz4UFzbtx8wFsk2TV5xCg+jZq2hcTrmxHyINTDgnC7zmJz0JebfINH8OQAOCwR94F/x7MbfqsuCp+Feoqgyi3xjYKkGfTn+FAgnbIA0PdT6qFoW7gQUOKpYhqJsuhiDyXPYObiG/ac6bX4qk3OXpUVnY2uTgnv44owREp/WzBkyqb5DHy6lGWdBOe/kjR7n0c26ugCMyn7JhVEUlNPQYAPWSGIM0oXbY9m5FAYE8cMyzvK7iiK3VPSPJ2HL8ONExySGdtoINfKYSOWUK3/ZXE+BymH9nVwuTxGK8ZSzxSVlbzrf1uiUFDDeazBZilNdoiEDEZ8iCbWJ03c2LajRpFSa4RuPsZKMQcDS1HNbCppdimNwvHfvXLBBV+e9//eZLNujm53PEnJs94GVsMZIU7WJXAy+WJ5DSSlOVhiObyvObDTPSuBQOsiW9HdD9XruBQK41b5gYesGyNma1MTy/9rgb4n1VolW0CJMz3eeJfMZ4h8TiSvppQWSgqwvsQJgyzDWAeyUBi4Rr8GBSiU
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(23010399003)(6133799003)(10067099003)(261102123227099003)(22082099003)(18002099003)(3023799007)(38350700014)(56012099006)(5023799004)(261022075727099003)(261026121527099003)(261026140227099003)(261021121427099003)(261022105027099003)(261009223027099003)(261028144727099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?S8BmOqppeXyn5gRqof7+QxpRuTbY3rMv7BlYSM9NPKU4rjnDdSlRMR7NU3TO?=
 =?us-ascii?Q?F0RGHRjtuvGi33WMnYoQTYBLPJ0mssJbWFCO/E7zpDmeEq6slcZExk9s42ys?=
 =?us-ascii?Q?85TvL1dkw4z9RZ/X8HTNT6tb+FNpNWpH+Z4pkoijElwsG8lBrWMa7Mi6Zjs7?=
 =?us-ascii?Q?r81EXpu58JCplhk42E6t11VGnOO8JzAusKZpQqZ9qwJhG+vVyq+JxCHR3dnm?=
 =?us-ascii?Q?YJb2fXSZ6c7NARhsIS3k8zErJ8MoJxg3TJjLsXNeoFLpGthDUzm/FO9BtSAo?=
 =?us-ascii?Q?gc2M12JPqcqSPHo62kkcr5jY6X7tsAgACOxpUvBXQHNFAXvbFblalsjGvWHq?=
 =?us-ascii?Q?lhB6AwB7od4W9/qOcNjR+WDDtCNQTb8SZlxJsSUn36mCfXIG6Sebwo2kkZl5?=
 =?us-ascii?Q?03D9ziL1493yYsW5IEh0KZq3WFh4h2FnPhUmwwi3vFp+hKw7AICb/Gfp9sbb?=
 =?us-ascii?Q?fDkaLsMOjK6jMBIy3Sv0hiCqqA0xr2P1W+RZd2WPxbq9MV+R01zv5vHOJLlc?=
 =?us-ascii?Q?AEndr7yZ/epkP2DK/Px5f9UE6OrcoFIVXZxRWp0nVceIY+bmOzqm1bcwxIpb?=
 =?us-ascii?Q?B31h443feHvE+kO3N/Ps1PnAEg+7pQQBCxfup9Z8pqiR6Mw3IRPEc0C+FaNA?=
 =?us-ascii?Q?GTPycaurYCGvnFIw2F+SIJnKZGocZuDiAgvQ/pvNZw3i084dE2S6YyRCv3gO?=
 =?us-ascii?Q?4T9KoCNipmaCR8sJOX8HWeCG6gDfTLRBoVuF+2ywByuE+XMfG/gyYtU0py4T?=
 =?us-ascii?Q?hKLVN1UxKNOfBO3GxRNHL/LACDsLB48rC8k+PRN9s91plj0dGj53YyHMMZKI?=
 =?us-ascii?Q?gfZ19QVLitWgEDUiThPp8R0vOvSYtlj3SmkBv6Y2Hj8tMDuLwqjSfE80oHF4?=
 =?us-ascii?Q?BAoMavlT/myCf9yjcKBvwbsPh1NoyaE7kzzvF5Sz4Jowj/dH9Ih3s0cSeGjR?=
 =?us-ascii?Q?DA+MqsTvstnVzKa4nX4B4mzn5LGxQplgWLqE/aidHIkyYMADUS/j/71hTIG5?=
 =?us-ascii?Q?M8PTM/Jyi/PMX5YavgHHcHQDroK8fGl0iO8jhcg3uOxbqmephHZBn33Uuet+?=
 =?us-ascii?Q?7rmK6xsoanHMHY0yuoRhiuqUMm6Zq0YXlCjoFgsLZtH8GDiqVOgSQXIGdz4/?=
 =?us-ascii?Q?q3b8ASmIPcOvTnhkZnyt0aUcXjc/zcqfxYJ+h+hfemVkgR6BqwSCDx7BRYJ1?=
 =?us-ascii?Q?gqY3CyTe3wY8BbQ/M20ZNWbHBqkfk1BiXFZ0XKOBQ8wtT89+PYYgmhZ96nAH?=
 =?us-ascii?Q?MMMaRzye4wYFrampgb2hm0f7bZOoWsZ22RwHAU74cwxtb+5PEjSe6xK/nBb+?=
 =?us-ascii?Q?n2SO7hNyMNsE2vDfiY1m7YkTeT9KXKVG+dneTiA1AlufJ+hVeom3pcKkMFD2?=
 =?us-ascii?Q?5VsJBwZ/Np1ZVwm+5H7wohvgyAxvekDkF4Avr/Gb7PER5TFyVIfBZzMP+aw7?=
 =?us-ascii?Q?M3+lCJxIm4LpJ+wf0dZ0P3NCZIdoOZWMVps/2qOLFhMu3OlrPck03Ic7LbWZ?=
 =?us-ascii?Q?KSW/ceNX0ve+8Hc+Qgxeli21KO6eL0RzGEmdOlJtpSZz2LngpjnxE35OMegm?=
 =?us-ascii?Q?/sncFrWc2VhCufVJJIf8N2n/0PWmsbuLvhC9JH0DpnVpaOqR+10zfj89/UDS?=
 =?us-ascii?Q?DbLeJVQsb50wVs1uDG5TTl4UFa5Am+gRovtN2hERmCptTkA+WRyWoooAGIxe?=
 =?us-ascii?Q?6kJqhcrDIxppIbEioHnBe5cKZzqcxWXQ26R7SBZekJUgGM0te8/pO0A6Qwdp?=
 =?us-ascii?Q?sn+fGGSWTvAwJaxnUuzW/cxRhtU6W3EJu4z4TPmIBuSRT9/s7eIc?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 947c3382-9da2-4887-94af-08df39946a1e
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2026 10:22:51.0490
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BDyd9+aK/HpgxbpvyNvMmSAak0IlI7dm1x+0ekP4dyG6NDL2nspEOg0b1leLvkqxc2RYcRF37hIhCFytVFcG8IeNwPuZ+n3EBweebqES61EY/ACzFrmsLnnpV4+PyT6y
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1329

Add pinctrl driver for StarFive JHB100 SoC eMMC(emmc) pinctrl
controller.

Co-developed-by: Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
Signed-off-by: Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
Signed-off-by: Alex Soo <yuklin.soo@starfivetech.com>
Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 drivers/pinctrl/starfive/Kconfig              | 11 +++
 drivers/pinctrl/starfive/Makefile             |  1 +
 .../starfive/pinctrl-starfive-jhb100-emmc.c   | 77 +++++++++++++++++++
 3 files changed, 89 insertions(+)
 create mode 100644 drivers/pinctrl/starfive/pinctrl-starfive-jhb100-emmc.c

diff --git a/drivers/pinctrl/starfive/Kconfig b/drivers/pinctrl/starfive/Kconfig
index f869c474fc50..76f2d59e8a8d 100644
--- a/drivers/pinctrl/starfive/Kconfig
+++ b/drivers/pinctrl/starfive/Kconfig
@@ -76,6 +76,17 @@ config PINCTRL_STARFIVE_JHB100_ADC1
 	  peripherals supporting inputs, outputs, configuring pull-up/pull-down
 	  and interrupts on input changes.
 
+config PINCTRL_STARFIVE_JHB100_EMMC
+	tristate "StarFive JHB100 SoC eMMC pinctrl and GPIO driver"
+	depends on ARCH_STARFIVE || COMPILE_TEST
+	select PINCTRL_STARFIVE_JHB100
+	default m if ARCH_STARFIVE
+	help
+	  Say yes here to support eMMC pin control on the StarFive JHB100 SoC.
+	  This also provides an interface to the GPIO pins not used by other
+	  peripherals supporting inputs, outputs, input debounce and interrupts
+	  on input changes.
+
 config PINCTRL_STARFIVE_JHB100_PER0
 	tristate "StarFive JHB100 SoC Peripheral-0 pinctrl and GPIO driver"
 	depends on ARCH_STARFIVE || COMPILE_TEST
diff --git a/drivers/pinctrl/starfive/Makefile b/drivers/pinctrl/starfive/Makefile
index cc8ce1e67d4b..d570b192b260 100644
--- a/drivers/pinctrl/starfive/Makefile
+++ b/drivers/pinctrl/starfive/Makefile
@@ -9,6 +9,7 @@ obj-$(CONFIG_PINCTRL_STARFIVE_JH7110_AON)	+= pinctrl-starfive-jh7110-aon.o
 obj-$(CONFIG_PINCTRL_STARFIVE_JHB100)		+= pinctrl-starfive-jhb100.o
 obj-$(CONFIG_PINCTRL_STARFIVE_JHB100_ADC0)	+= pinctrl-starfive-jhb100-adc0.o
 obj-$(CONFIG_PINCTRL_STARFIVE_JHB100_ADC1)	+= pinctrl-starfive-jhb100-adc1.o
+obj-$(CONFIG_PINCTRL_STARFIVE_JHB100_EMMC)	+= pinctrl-starfive-jhb100-emmc.o
 obj-$(CONFIG_PINCTRL_STARFIVE_JHB100_PER0)	+= pinctrl-starfive-jhb100-per0.o
 obj-$(CONFIG_PINCTRL_STARFIVE_JHB100_PER1)	+= pinctrl-starfive-jhb100-per1.o
 obj-$(CONFIG_PINCTRL_STARFIVE_JHB100_PER2)	+= pinctrl-starfive-jhb100-per2.o
diff --git a/drivers/pinctrl/starfive/pinctrl-starfive-jhb100-emmc.c b/drivers/pinctrl/starfive/pinctrl-starfive-jhb100-emmc.c
new file mode 100644
index 000000000000..32f8c141133b
--- /dev/null
+++ b/drivers/pinctrl/starfive/pinctrl-starfive-jhb100-emmc.c
@@ -0,0 +1,77 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Pinctrl / GPIO driver for StarFive JHB100 SoC eMMC domain
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
+static const struct jhb100_pin_layout_desc jhb100_emmc_pl_desc[] = {
+	{ .pin_start = 0, .pin_cnt = 12, .name = "gpio", .gpio_func_sel = 0 },
+	{ 0xff },
+};
+
+static const struct config_reg_layout_desc jhb100_emmc_pinctrl_crl_desc[] = {
+	{
+		.pin_start					= 0,
+		.pin_cnt					= 12,
+		.fields[PAD_CFG_DEBOUNCE_WIDTH]			= { .shift = 0, .width = 17 },
+	},
+	{ 0xff },
+};
+
+static const struct starfive_pinctrl_regs jhb100_emmc_pinctrl_regs = {
+	.func_sel		= { .reg = 0x3c, .width_per_pin = 2 },
+	.config			= 0x00,
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
+static const struct jhb100_pinctrl_func_maps jhb100_func_maps_emmc[] = {
+	{ .func = "emmc",		.val = 1 },
+	{ .func = "gpio",		.val = 0 },
+};
+
+static const struct jhb100_pinctrl_domain_info jhb100_emmc_pinctrl_info = {
+	.name			= "jhb100-emmc",
+	.pl_desc		= jhb100_emmc_pl_desc,
+	.crl_desc		= jhb100_emmc_pinctrl_crl_desc,
+	.regs			= &jhb100_emmc_pinctrl_regs,
+	.fmaps			= jhb100_func_maps_emmc,
+	.num_maps		= ARRAY_SIZE(jhb100_func_maps_emmc),
+};
+
+static const struct of_device_id jhb100_emmc_pinctrl_of_match[] = {
+	{
+		.compatible = "starfive,jhb100-emmc-pinctrl",
+		.data = &jhb100_emmc_pinctrl_info,
+	},
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, jhb100_emmc_pinctrl_of_match);
+
+static struct platform_driver jhb100_emmc_pinctrl_driver = {
+	.probe = jhb100_pinctrl_probe,
+	.driver = {
+		.name = "starfive-jhb100-emmc-pinctrl",
+		.of_match_table = jhb100_emmc_pinctrl_of_match,
+	},
+};
+module_platform_driver(jhb100_emmc_pinctrl_driver);
+
+MODULE_DESCRIPTION("Pinctrl driver for StarFive JHB100 SoC eMMC domain");
+MODULE_AUTHOR("Alex Soo <yuklin.soo@starfivetech.com>");
+MODULE_LICENSE("GPL");
-- 
2.25.1

