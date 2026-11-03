Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=139.219.17.129
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793701381;
	b=YtFImoRKCxbZCfoudvrimFBWV9v+RCLfOQSQ2hMD6wdVcqpVGN8uexYIHd7HnS8aOobb
	 4aZM6SPUNPJfxnGoIhskY7KjWjO9wNcwwoBbncltj8ibxuNv+oZUu8N+7scwlyhB6lTtc
	 W6UyKp9kiZPVMdGGes+whgs+Xdv7V1UcJPJ19J93LDozI42Vr+urvyB7yJh2bcUGFDGS+
	 Pizx6iTISBDoyPWgCI7fOBfiu1IxzrSFAEpiHm6psdknggZinSNviX63mRhv+RfIJpx7Z
	 HXhAonzqi3WHAPEaZYBKKbfY434pJ4Rby3hoJrK3vkgxtnXRe/HP4Zq0mMnxEDWjl7A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793701381;
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
	bh=9z3ydN8JLPoLbbDVaL6ldu35NK6KAgZWw/OjNZ8MVOk=;
	b=thg/KhxfsFEQwHuzpgi0opLCThgd/UMbiaSmrf/rq9Fy5W8rwBDll3rEyb1+YLdv9qM+
	 5+grbU7kpNsfgPWCO35ptASOD7LsiaKf15w6YKTNx3WeG88EHi4Mkwj4pUovFGznB/Ucs
	 67xOU1CtseYqdFd3nB3yEca4TwnqjChP13UwMRzP4KPs4eXVsfO4FQjJ/hluKjGusqR5A
	 /1mdm1l34Gwl0rb8p98J5p2IT4kN5uEhPlcFeFBwXiGf3rNt703EXFwqIlDjxjXJtnxGD
	 N3ItftkW7kziSsKLkW84GyJYUMpNvXAWZnO8L3Nbq2NIBBg4zUI+hSC37N3BbRdlVug==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=starfivetech.com;
	spf=pass smtp.mailfrom=starfivetech.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=139.219.17.129
Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2129.outbound.protection.partner.outlook.cn [139.219.17.129])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5596C606B10C;
	Tue,  3 Nov 2026 10:23:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5596C606B10C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NovJ4LqrkI5gVQLAsYqLRYTY+jLUEDg/eH3KxHryEeuGrLNGyBMoBQEQIkccK0YGSVCb20EGNhRErhosDS4zaFVzjT1Lg/Es8EVVJc1khRzf2Cgs7MdKiJtTgNNBU4lf0oD68c5zNycDqIq3su4u04m/o3vPEwSgw8MHcWvTZgdqtWHCff9FNI/NE35H0k8cXHx/k1JeWLLVyZTcEOoeZFR+7bdv52vZfd/wsPEdQVuKNsk5Jt8W2YS5jdAh4UGWsG/xKT03OWAJfP1V9Ov/VqDae37HmthNWuTDlK6lt3Bj7DZFB+XZYoQvoUMFbvDIlHu9+JZc+eUL419n02kBdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9z3ydN8JLPoLbbDVaL6ldu35NK6KAgZWw/OjNZ8MVOk=;
 b=mznbmU3IgyRsyr3Qcqe7+XS5krWJCzfgb9isCzUNaWSACVLa8X9Ug5mYMVUjI8N7Rt5Y1Xwg8CW3TobFXtZ2Oz6B7Smp1idbk9xeAmRWpx4l17lmVQtDrjDYbHNYpJmPnS9SSFCOS3atNZrh0xZ4zRNiLE6fLeao+tbsubhSU6QXbLH9/IDp70beBOmpvJG1o18DqnSJjh32Q7gOxihsB33+aJ+xrktakq9ClFuTxLdCkb75xpSEv4ZT3HeeEjB7NoXv6v+5jLRcXEzpc7fLAnMnPgGnjHojcVmhJ7S9iDjfwd7++OJx3zDPgQrk+oGUg0BSBIWcKVjwLsb0aX+DEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1329.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:16::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Tue, 3 Nov
 2026 10:22:49 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0569.011; Tue, 3 Nov 2026 10:22:49 +0000
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
Subject: [PATCH v1 RESEND 4/8] pinctrl: starfive: Add StarFive JHB100 adc1 controller driver
Date: Tue,  3 Nov 2026 02:22:32 -0800
Message-Id: <20261103102236.96872-5-changhuang.liang@starfivetech.com>
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
X-MS-Office365-Filtering-Correlation-Id: 26e27048-8853-4b32-5713-08df399468ff
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|23010399003|6133799003|10067099003|261102123227099003|22082099003|18002099003|3023799007|38350700014|56012099006|5023799004|261022075727099003|261026121527099003|261026140227099003|261021121427099003|261022105027099003|261009223027099003|261028144727099003;
X-Microsoft-Antispam-Message-Info:
	TBRXjb9Z0+3CQMLfS2irz6MiQ8RWABaD3pN9pOGEHPubyHmCth0vqsbxNx2Iez6uNfZS2JbK4qVofmWqNzGFv/U0YRhz47/L2rF4761BS6aXcxOrZ6rZON3yFNQRlqlT6m3NcGY5sZezdDpvfXKini0B6F/gB1ZqcDfoZR4q6b2mSdICovCCq1fXmgfXKjx+sYhimVJmeWxCOqKawdoumw0IGj7kf4oZZ7tCiR195juoIsNN1lY7o42THvoy3B1AyOr3+YBTxLA9IJ16QeYz0VqlQ5WPgsa6n3QgjWfXb3OyG7lwN/IANvKQttGe2olTALtBcf7N6EE8a+oX5PiFhr0xyPI7DXQDtxUlATyZZnTKxzRmlvau8L0Z/991IGcSS29EO9eMXlKjMlfTBWaw9d+nMftrP+zDoBx+mtL3/M9A/TgWyKbWgQrDgKVuIvh2kvsf+5PT4dB0ys5XH26F9ubyBO/dPFYDEebwQ8s0c/OlQVrNCBwww8vZVnLYoQhRrF7KGRoIfcOdlE2TynH0/3MgW30ToZcSGffra/9LmSfDMISevlI7ZY78xoud7/So
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(23010399003)(6133799003)(10067099003)(261102123227099003)(22082099003)(18002099003)(3023799007)(38350700014)(56012099006)(5023799004)(261022075727099003)(261026121527099003)(261026140227099003)(261021121427099003)(261022105027099003)(261009223027099003)(261028144727099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ljxYVOCnYt9MZNMOGq8CjhTdU8hl3BLpDCScvElsiGnj/6TvuPY6gThp8PkH?=
 =?us-ascii?Q?aq8TqOAqD6s360mlCFQrhzKoA3pjRG+tC1KVvRD5qpeYRICPBRtkHzXq7ZpK?=
 =?us-ascii?Q?9h6tZ/Oe3sBKGO1ekJ0CeE2rdy6enni95HuG2TLec6T5mXsKGYod1P4mc344?=
 =?us-ascii?Q?MAP61endStr0G5C3dbVD8DoqzGSsxvTVvsjWlmuEwPl9TTpAEx7xSLmlKOLj?=
 =?us-ascii?Q?mYJ0ODsHfc/NFUO8i1nyxma8aLDJ84HICjnlNy06pg0E5IWB2FKkWDZZ79ZC?=
 =?us-ascii?Q?uebdZE57vJvTDbM86oUwmuN5wChWtdmW0EZi/aCMnLQ18zNPQf6DSsfG66l7?=
 =?us-ascii?Q?XpProIgIiOzcM/7nuBZjkZ6FJEAAQkte0R+Pidu1gZrPuKNnQ8grSpOgC/9G?=
 =?us-ascii?Q?zncQFAAiIdIHN+6siF1UMR70txfRY4asOqRdJ+AMfZg++R+Zxr7oM38krfGs?=
 =?us-ascii?Q?eeVXw2It+QagZ3KlQwOEgmRGBUDnOsfTgZxkKvALzfcGxA4S24xaNwnzHI1f?=
 =?us-ascii?Q?s6rcKoXupt2ujLhqjMtd5cRSwu4pbtZruIjSwyRUF1fB59k6+o7Rv8dSxWFk?=
 =?us-ascii?Q?DKZ68qcLBIcJ+FxRKSvxy/y361EUbe/AZ775NTeFZekuTtR40YusAi3UNhi+?=
 =?us-ascii?Q?mVJxxiw/GB/iDD18uzNy5jJ9GG9MjidVR1r5r6Fdu19ngqqBFFbx8Vwa6knK?=
 =?us-ascii?Q?KPzDbV/85O79DBLo5PulOthDjDbDARCsVpTXbcD/y8eHKenIVtHrNpO0CsN3?=
 =?us-ascii?Q?1DQZhwJjo23g6GeyQPm5QIrRxGXkcbkJ3qiOWPN/bgdhx1fzOluRspJhVVp+?=
 =?us-ascii?Q?X7CProuWLh4ZqCZS9m2z7wYjTU9gF8t7V4NnRuON+QIVXLHKhzCQIXGpbt+j?=
 =?us-ascii?Q?vm3FNv5NNyGMHGjA80/Rx3YMtDV2HhszhDfsRJI1jP1NhEpyvl4aXbA/TIvR?=
 =?us-ascii?Q?Ta8RIbqHbunnr/fVTYfDlKfc80D7UW5z6EVA0BBrHnUxk0KZeoMaheuubJZH?=
 =?us-ascii?Q?mXXH+1hWRp1Rl0pmdUJZZRpoiW60Dn3ekxtQHOUTUfsU24B39gKbMxDlw7Yy?=
 =?us-ascii?Q?STbSmm1w+Ao7dN647TqiJ2xYiW15T//V9S/8TLcKl531RC4aefAnFNK8kyM/?=
 =?us-ascii?Q?RR2SyYJMYR65yWUKdBmNT8Yd8wggQ3/OtoXwyAlxBstcIQqCsXzzi4UHgFLp?=
 =?us-ascii?Q?cL8jk06NrOfjgqB98ik+ZAOiam7C5Sc4YPWxlEn4osDm900JBglC49QbJhqz?=
 =?us-ascii?Q?N/oZL+QE7E580e/AIdFh4Y0aQbzs1+R5WIYjSl013KyGpi5rB3LylIgkwXRv?=
 =?us-ascii?Q?4JDrEzy2cHm5xsEjsL0LBaR68TndbHEl6mqwEMOFprCr3ExsEv3ER8951+iH?=
 =?us-ascii?Q?RLIqwr0I0pzarQJAiWzOJ7iZs/xDOAm/PU5HVxQEkOcAZVOg1tgxWlgYx8UL?=
 =?us-ascii?Q?K0Z+Yp7tcBA83bwOgjEpWu/CePWmFPee+t1O9wm63qk/ipLpToydqa5B2Imt?=
 =?us-ascii?Q?IPuSsfCwP0htMRwKYzT+hMxy0sqHnA5jimn97Bc14tDR83snM/0IlzkNs2Oo?=
 =?us-ascii?Q?u6OTqWkxp5qtEPRP4B4yfSd+xQWNu6/9m42v1vgPH/ht2nhznbH0lgRxdNlY?=
 =?us-ascii?Q?3MV4KrOn4yJuJP9nyntWFrv8C17PyJliXDMaF/G7Ctdvy94azEp9NP9G7czc?=
 =?us-ascii?Q?WaZIJrGxPb+jR6NVmycEi3gLGOBfLPbGBAHl4OqlNe3aaXMQDeXHyTwlq4Ey?=
 =?us-ascii?Q?2anuEgNItUR4omGkH16ewn93mAxZhkIlvJLcncOIZKbYH8Atoe8M?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26e27048-8853-4b32-5713-08df399468ff
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2026 10:22:49.0682
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t9xNduHaUaJk2VCNOhzlAPwi/sY/HdOdPyLU/quWaxfMLu3EQyqYb6ssnEPRT4MKep3HKMbdmy6ThGm4CGwenLjaj4GOXrO+r4j7NQMgFH21V9PRfREhRSPOlA3VuO+W
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1329

Add pinctrl driver for StarFive JHB100 SoC ADC-1(adc1) pinctrl
controller.

Co-developed-by: Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
Signed-off-by: Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
Signed-off-by: Alex Soo <yuklin.soo@starfivetech.com>
Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 drivers/pinctrl/starfive/Kconfig              | 11 +++
 drivers/pinctrl/starfive/Makefile             |  1 +
 .../starfive/pinctrl-starfive-jhb100-adc1.c   | 85 +++++++++++++++++++
 3 files changed, 97 insertions(+)
 create mode 100644 drivers/pinctrl/starfive/pinctrl-starfive-jhb100-adc1.c

diff --git a/drivers/pinctrl/starfive/Kconfig b/drivers/pinctrl/starfive/Kconfig
index 1622cc73d9ae..f869c474fc50 100644
--- a/drivers/pinctrl/starfive/Kconfig
+++ b/drivers/pinctrl/starfive/Kconfig
@@ -65,6 +65,17 @@ config PINCTRL_STARFIVE_JHB100_ADC0
 	  peripherals supporting inputs, outputs, configuring pull-up/pull-down
 	  and interrupts on input changes.
 
+config PINCTRL_STARFIVE_JHB100_ADC1
+	tristate "StarFive JHB100 SoC ADC-1 pinctrl and GPIO driver"
+	depends on ARCH_STARFIVE || COMPILE_TEST
+	select PINCTRL_STARFIVE_JHB100
+	default m if ARCH_STARFIVE
+	help
+	  Say yes here to support ADC-1 pin control on the StarFive JHB100 SoC.
+	  This also provides an interface to the GPIO pins not used by other
+	  peripherals supporting inputs, outputs, configuring pull-up/pull-down
+	  and interrupts on input changes.
+
 config PINCTRL_STARFIVE_JHB100_PER0
 	tristate "StarFive JHB100 SoC Peripheral-0 pinctrl and GPIO driver"
 	depends on ARCH_STARFIVE || COMPILE_TEST
diff --git a/drivers/pinctrl/starfive/Makefile b/drivers/pinctrl/starfive/Makefile
index 1113e73657d7..cc8ce1e67d4b 100644
--- a/drivers/pinctrl/starfive/Makefile
+++ b/drivers/pinctrl/starfive/Makefile
@@ -8,6 +8,7 @@ obj-$(CONFIG_PINCTRL_STARFIVE_JH7110_AON)	+= pinctrl-starfive-jh7110-aon.o
 
 obj-$(CONFIG_PINCTRL_STARFIVE_JHB100)		+= pinctrl-starfive-jhb100.o
 obj-$(CONFIG_PINCTRL_STARFIVE_JHB100_ADC0)	+= pinctrl-starfive-jhb100-adc0.o
+obj-$(CONFIG_PINCTRL_STARFIVE_JHB100_ADC1)	+= pinctrl-starfive-jhb100-adc1.o
 obj-$(CONFIG_PINCTRL_STARFIVE_JHB100_PER0)	+= pinctrl-starfive-jhb100-per0.o
 obj-$(CONFIG_PINCTRL_STARFIVE_JHB100_PER1)	+= pinctrl-starfive-jhb100-per1.o
 obj-$(CONFIG_PINCTRL_STARFIVE_JHB100_PER2)	+= pinctrl-starfive-jhb100-per2.o
diff --git a/drivers/pinctrl/starfive/pinctrl-starfive-jhb100-adc1.c b/drivers/pinctrl/starfive/pinctrl-starfive-jhb100-adc1.c
new file mode 100644
index 000000000000..9264e9684b41
--- /dev/null
+++ b/drivers/pinctrl/starfive/pinctrl-starfive-jhb100-adc1.c
@@ -0,0 +1,85 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Pinctrl / GPIO driver for StarFive JHB100 SoC ADC-1 domain
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
+static const struct jhb100_pin_layout_desc jhb100_adc1_pl_desc[] = {
+	{ .pin_start = 0, .pin_cnt = 8, .name = "gpio", .gpio_func_sel = 0 },
+	{ 0xff },
+};
+
+static const struct config_reg_layout_desc jhb100_adc1_pinctrl_crl_desc[] = {
+	{
+		.pin_start					= 0,
+		.pin_cnt					= 8,
+		.fields[PAD_CFG_DRIVE_STRENGTH_3BIT]		= { .shift = 0, .width = 3 },
+		.fields[PAD_CFG_INPUT_ENABLE]			= { .shift = 3, .width = 1 },
+		.fields[PAD_CFG_PULL_DOWN]			= { .shift = 4, .width = 1 },
+		.fields[PAD_CFG_PULL_UP]			= { .shift = 5, .width = 1 },
+		.fields[PAD_CFG_SLEW_RATE]			= { .shift = 6, .width = 1 },
+		.fields[PAD_CFG_SCHMITT_TRIGGER_SELECT]		= { .shift = 7, .width = 1 },
+		.fields[PAD_CFG_DEBOUNCE_WIDTH]			= { .shift = 15, .width = 17 },
+	},
+	{ 0xff },
+};
+
+static const struct starfive_pinctrl_regs jhb100_adc1_pinctrl_regs = {
+	.func_sel		= { .reg = 0x2c, .width_per_pin = 2 },
+	.config			= 0x00,
+	.output			= 0x20,
+	.output_en		= 0x24,
+	.gpio_status		= 0x28,
+	.irq_en			= 0x30,
+	.irq_status		= 0x34,
+	.irq_clr		= 0x38,
+	.irq_trigger		= 0x3c,
+	.irq_level		= 0x40,
+	.irq_both_edge		= 0x44,
+	.irq_edge		= 0x48,
+};
+
+static const struct jhb100_pinctrl_func_maps jhb100_func_maps_adc1[] = {
+	{ .func = "adc",		.val = 1 },
+	{ .func = "gpio",		.val = 0 },
+	{ .func = "host1_port80",	.val = 2 },
+	{ .func = "scap_trigger",	.val = 3 },
+};
+
+static const struct jhb100_pinctrl_domain_info jhb100_adc1_pinctrl_info = {
+	.name			= "jhb100-adc1",
+	.pl_desc		= jhb100_adc1_pl_desc,
+	.crl_desc		= jhb100_adc1_pinctrl_crl_desc,
+	.regs			= &jhb100_adc1_pinctrl_regs,
+	.fmaps			= jhb100_func_maps_adc1,
+	.num_maps		= ARRAY_SIZE(jhb100_func_maps_adc1),
+};
+
+static const struct of_device_id jhb100_adc1_pinctrl_of_match[] = {
+	{
+		.compatible = "starfive,jhb100-adc1-pinctrl",
+		.data = &jhb100_adc1_pinctrl_info,
+	},
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, jhb100_adc1_pinctrl_of_match);
+
+static struct platform_driver jhb100_adc1_pinctrl_driver = {
+	.probe = jhb100_pinctrl_probe,
+	.driver = {
+		.name = "starfive-jhb100-adc1-pinctrl",
+		.of_match_table = jhb100_adc1_pinctrl_of_match,
+	},
+};
+module_platform_driver(jhb100_adc1_pinctrl_driver);
+
+MODULE_DESCRIPTION("Pinctrl driver for StarFive JHB100 SoC ADC-1 domain");
+MODULE_AUTHOR("Alex Soo <yuklin.soo@starfivetech.com>");
+MODULE_LICENSE("GPL");
-- 
2.25.1

