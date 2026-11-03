Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=139.219.17.108
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793701384;
	b=d+EsqZAvMCDbvUx82nZSbbE07gX5yTRDluW7S01UjqkUTuTT0OOcELWKDc1RzxdAvIH1
	 D70xy26To3vU/0e8YPr8PGFmseX6xrcqKV26ROHL46wf8lvSpBq9/hkUEQYjjsBeekJm5
	 vO6cMTbSqSPDv6SRZa/V2oZ6GU0npWMoIfkrIADlth4P3ITbITLlKjXriZCYUICIfe8+C
	 pjdZAgSCORJt8OQFYjP76wlvlj3X7H6PNZIy/XcZ6GD/rYyn0pSA1F3fUaThLOfYznGAO
	 7b3njWtpcRSueZ8HfVtWjni3WSCLuAI8/CyIsNfdrOeql6apvGiNAwmNvgY++YRpcGw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793701384;
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
	bh=76F6HtKyTxkIGGLBbMqWXG0fWxtsEewzbCna4myQQaw=;
	b=Lq5gLY/YoY3GJ4LhrNHyXxB8xtjqcvrYe6X3PZMTJiLBOMniUip5wLIKpVjV7VV/GmVz
	 W+rH8CoJ8MERG82yPaBNewc8YobrUMsT0zizfNU9HM+TRmvvbL+WZRCe3s3ZnI7zy9ZrG
	 5vjJI9eTYtbTGbTgHLFAh9NtVZDNYOukGTdtOSeWIJ0jbHE/CEoPhldwfDpVGfrOk3ObO
	 NHVs3fEEOykab2LEho+QWhL68GC1GWMwyvvjC0EDOWCcmoVNGW3Ul7sI2v6fmyeHjnQ4O
	 NRtpH0wpI7WGRn4iWx5Y/gZkFGgjxXNZZIRL+EWQShvTeWBuj5E/a7ju5OYUwZ1MmIQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=starfivetech.com;
	spf=pass smtp.mailfrom=starfivetech.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=139.219.17.108
Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2108.outbound.protection.partner.outlook.cn [139.219.17.108])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1CE0606FAE6;
	Tue,  3 Nov 2026 10:23:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1CE0606FAE6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hZGc2eyjK/l9WRxQwWzLhL8c7Ov5+Eo5MjEQovbCKUZq/iEhHSgSaD+cK5nbx8fFunwr1cr420d0jCKSjHhXXfXqgaycjCKmWKSJIsKyhs39vGudpBgWKNkWFWL6UTr959kaTnMJ3wO5KZZcZrZLadFC0sNh15k/hZh+0QfDixTqK30C+SbkYiqu5cqEQJ7AvP5r9KY31DIJKzRxI4cw5p99MmtsuEfEoWLTcEXk8YaEZIwOvqDvqwTElQhNvO+6BgYopToSPxflKXX9MEGHtvQ2P92DFwC8W99aSaz7tTmUpnazYgMx7VG9kXzqqoXatQx9LXeFm0v5FgT0ZodGjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=76F6HtKyTxkIGGLBbMqWXG0fWxtsEewzbCna4myQQaw=;
 b=HOEwONp+h6iqEaZpaHdQjCOpHRvhcJFlfUmF8OwhGL1Jg4NwSvZmTs5p1GhRPBeQIGxwwwaWIsDcyH1d75hZcJxtg9JkUd+w4BOQ354YoUEkCTpiIMx2elXYHS4Dbza2vmp16Fhy1wzdp65lb4fZnOUUYvl2uw8IkzeJ2RcyjHlBqd5CorQfPpRFV6oM3kyxtMmhT8WcVyFvPPa/9HVNUEaGuYVxTSin9Ao1QLo03bltTua6x+7gogCNPaXPP9LjnS01y/geoa+IcXOcl3UB9ZBpn2qSGWG6XLIRE4lFXao4SIhjh0KoYgK9x1DD/M3BJANJfZ2bhkbtjGYvGHJjBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1329.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:16::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Tue, 3 Nov
 2026 10:22:47 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0569.011; Tue, 3 Nov 2026 10:22:47 +0000
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
Subject: [PATCH v1 RESEND 2/8] pinctrl: starfive: Add StarFive JHB100 adc0 controller driver
Date: Tue,  3 Nov 2026 02:22:30 -0800
Message-Id: <20261103102236.96872-3-changhuang.liang@starfivetech.com>
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
X-MS-Office365-Filtering-Correlation-Id: 4408287b-dc11-4640-c935-08df399467e2
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|23010399003|6133799003|10067099003|261102123227099003|22082099003|18002099003|3023799007|38350700014|56012099006|5023799004|261022075727099003|261026121527099003|261026140227099003|261021121427099003|261022105027099003|261009223027099003|261028144727099003;
X-Microsoft-Antispam-Message-Info:
	+CbtTv8Dxa9V/q0uxe45WvZL+EwcP91UTkjxnswum0ecUIRug3alSeEWHxT1luCQNEB96UN1I+G8s5A09DU6otHYtui2Llw6NFJzgAQFiRl58MLqORPO9lWzTgV8Bl1CZHiQURKAR3bYm5A8w33WWtCdpfAc4Cb7Y1cXRUTlvK7iLxHQAq4Xbl5/5XZwLQBKvop3iXbF8NrhazY0gwGSxRKdFasP5KGSbUAs1zts4we0c/WMEFloFfZW+6ziu8/KTP+QzjwKTVnjygheyAdFgPzEWfdaRoRQPpNlfABp3U6n36h1iRrZAP29M/XNj7lJxBplqZXmVNsOKxK5r/8zia1PgZWDKUDjDT85qYmMNFK8pcQnWHJFHIxDr4WU/vfRkq0ro4CHCobHltGdxSY/FRSYMOhQmMgv1CDgT5kL/zWHoIcB/5tC3fleM9jram8jTDtp+u6SotwKRTUy6YsXmkpoUMhkSbNohVze7xPOGcb2FsVyz0L2TLhJ4ybeGtVDGxqRCWF5nvZTXM7npJBfnbTMX1Tv5RQQGbvPmoNa1PiZZrTRdYzGTTsTXkdyG6sm
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(23010399003)(6133799003)(10067099003)(261102123227099003)(22082099003)(18002099003)(3023799007)(38350700014)(56012099006)(5023799004)(261022075727099003)(261026121527099003)(261026140227099003)(261021121427099003)(261022105027099003)(261009223027099003)(261028144727099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?UXxv8EepvL297taX5GrX+mIzvo1YQoqb1WbGX9Yo92Y+ncfGKJLPUD3ME/d5?=
 =?us-ascii?Q?2RxCJy4fvthIHRzz1xOiPWR2AkBBSgxtlP2a5ghPOYf7yA6SA2L43h3PzUaw?=
 =?us-ascii?Q?bO6dJSDz8B7uAQjbtPnbPgYMia5XKsZszNAGS1dNjS8K6wwQ5P23mEFliPIK?=
 =?us-ascii?Q?EndDTQH1XUEvtN3BR4raE3LYzjvJw8VCoXfUDpXzoLYD5xWtzrKVQQNSG6V0?=
 =?us-ascii?Q?ds1cXs9+08Luf5lc6gbyAwIUM1wQyXvXi8uCcM5kmZ1nzv/gprK+1PhUlJLI?=
 =?us-ascii?Q?mEZAAiTCzRDLBoNwFn/XTRxyDJkRrCML9VZCt6Jrmy75HaM+Kaog2FT4JuMS?=
 =?us-ascii?Q?Lz1KVT+RNTMRZ5lZdhokb6vDhd9nC3Lsq5bxkdRky5VhtOUVeLBIzBMm4nMN?=
 =?us-ascii?Q?eekUUAJaTiBK+Mm5p9s0j+7Uo82KuHCwkmFH6QRyxVLhvrQs38CkW3wa2Qze?=
 =?us-ascii?Q?vN2F3klmfhTUrg7xgLsO30uqSfPDRpEz3qDjqiSJeogaiG6LSbwWLmSLlOy/?=
 =?us-ascii?Q?ZRCayz+1Ny2csyTZyFcslGhSFOBEuNr7Rnw4/ttlpkH9KlKFmsow8t1kFPGk?=
 =?us-ascii?Q?z6M6jLUhYZBHxrhWEH73nDC6VrX+vj75MweKSi5yeSq5ZbjwFZS6lR8xb2wV?=
 =?us-ascii?Q?YjpakMYNbrudTih/eOnbfeJMwQpVvGQhhy9jvmBz006hjTaiccUWbVkCmajD?=
 =?us-ascii?Q?YW0xWa7gXrjRt9VJy5BOs9K9PIY/wGU9F9RTVsgl6Hdd0uNmO5pT46zR+eQJ?=
 =?us-ascii?Q?JGiBMsJv2Lk9XHPaM37+XgTGxVhN5rfGIQ06ZwniZivg0deU+x+Fk6i2zT2G?=
 =?us-ascii?Q?5m23Rnd3vNJIqFZ46L/mnKYCjLhXquup/QBtxy60FcjCsI2kgz27DUDBBc3v?=
 =?us-ascii?Q?VgIJ9EqW4WmLpiAtNtQ4u2/za+xsFl8OD1ZwTeDIspG0cUDY+E/eNCDrzPbk?=
 =?us-ascii?Q?t1ByiYbK0PQGEz2cgyvBrJXL1vd6b21tkt3t/9mjW4A+tsafrt5/d7U0JjPi?=
 =?us-ascii?Q?HPjMyV8pZok5QsB+XQEePkJRStEr4xZTP6Rrz9PM6nsoSdQsZKy0eTjTVX6Q?=
 =?us-ascii?Q?qtbnHunPF9fRCoK2ecSshXoVS+xm6jZRLfG3V9KV9xMdi4wq/liChG4kOa57?=
 =?us-ascii?Q?Xp+wpdWPDwd5g+FvvdL2BC0ZU0Dm1BZwr40Tu+QqID6qWT2w+HmG6XNc/9RJ?=
 =?us-ascii?Q?mO6AWSGuyUS3lIo0ugpPpBc7Iseen9azCoMxW5mrltE4g/iy+zDtRzd2Hq+M?=
 =?us-ascii?Q?XnAJwHQwtG/O6hbJ01yrP5pSw37eFt6uA2wLqqg95HxngxILJAtJLD/rgfYV?=
 =?us-ascii?Q?mx1i2Dw0At5MiajWtT9EbhrmfgvDqwo1lcnTv0nHMA7YR/1snDNmzgwZm/j4?=
 =?us-ascii?Q?uwLbEIUgm2qk8rT9C76Trt6dUv+6IuHF5WGxDu3VZa0YjmKok/ypwFgKXd0I?=
 =?us-ascii?Q?VwY+p2cS1LLmKmVSkcOhgicev/OUkMg2xw2f0yMteBPqyUqmcM/0L4/Vdseq?=
 =?us-ascii?Q?H7lfKGEdhrUUVpb7/xWPBHeDxzMJIytXqL0HmrFBZAWiqOjFfPDrH2TvKwY3?=
 =?us-ascii?Q?n1Y7zI1MYQ3JFWeEzUb4WeJFpSPIlwFbSByq8NphJodlbgrTNIYQf4mzAbDR?=
 =?us-ascii?Q?DkeycmsJ0/foao4zvJqYaCer0KGjtMb9tpPAoGbbY3rJZGryo7WXq6Svaa1+?=
 =?us-ascii?Q?efQVW+6Vi0HminfC4aztqbiXMQhslCtCJKtsCg0oE1Bv6IY3lDF8s6LC0h3J?=
 =?us-ascii?Q?DZSUxjQ/BuGKzGHSQgiEOYy2TfaxQqA4aa80YSFNx/0Ych26h2OZ?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4408287b-dc11-4640-c935-08df399467e2
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2026 10:22:47.2105
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ysFpHPZYIZZBW/KbhLpuv/2OtHF/CyM8fnT85/3ZmjPPxwbg6MIdpsLm4qYylGtW2IiJ21PksJ67unjea8gz0dVPnwhCWTD/oLAxE9EY3LOkiECsg66Ijr6hcAmRSeuc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1329

Add pinctrl driver for StarFive JHB100 SoC ADC-0(adc0) pinctrl
controller.

Co-developed-by: Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
Signed-off-by: Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
Signed-off-by: Alex Soo <yuklin.soo@starfivetech.com>
Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 drivers/pinctrl/starfive/Kconfig              | 11 +++
 drivers/pinctrl/starfive/Makefile             |  1 +
 .../starfive/pinctrl-starfive-jhb100-adc0.c   | 85 +++++++++++++++++++
 3 files changed, 97 insertions(+)
 create mode 100644 drivers/pinctrl/starfive/pinctrl-starfive-jhb100-adc0.c

diff --git a/drivers/pinctrl/starfive/Kconfig b/drivers/pinctrl/starfive/Kconfig
index 7ff506a15dd8..1622cc73d9ae 100644
--- a/drivers/pinctrl/starfive/Kconfig
+++ b/drivers/pinctrl/starfive/Kconfig
@@ -54,6 +54,17 @@ config PINCTRL_STARFIVE_JHB100
 	select GPIOLIB
 	select GPIOLIB_IRQCHIP
 
+config PINCTRL_STARFIVE_JHB100_ADC0
+	tristate "StarFive JHB100 SoC ADC-0 pinctrl and GPIO driver"
+	depends on ARCH_STARFIVE || COMPILE_TEST
+	select PINCTRL_STARFIVE_JHB100
+	default m if ARCH_STARFIVE
+	help
+	  Say yes here to support ADC-0 pin control on the StarFive JHB100 SoC.
+	  This also provides an interface to the GPIO pins not used by other
+	  peripherals supporting inputs, outputs, configuring pull-up/pull-down
+	  and interrupts on input changes.
+
 config PINCTRL_STARFIVE_JHB100_PER0
 	tristate "StarFive JHB100 SoC Peripheral-0 pinctrl and GPIO driver"
 	depends on ARCH_STARFIVE || COMPILE_TEST
diff --git a/drivers/pinctrl/starfive/Makefile b/drivers/pinctrl/starfive/Makefile
index 351fce524fec..1113e73657d7 100644
--- a/drivers/pinctrl/starfive/Makefile
+++ b/drivers/pinctrl/starfive/Makefile
@@ -7,6 +7,7 @@ obj-$(CONFIG_PINCTRL_STARFIVE_JH7110_SYS)	+= pinctrl-starfive-jh7110-sys.o
 obj-$(CONFIG_PINCTRL_STARFIVE_JH7110_AON)	+= pinctrl-starfive-jh7110-aon.o
 
 obj-$(CONFIG_PINCTRL_STARFIVE_JHB100)		+= pinctrl-starfive-jhb100.o
+obj-$(CONFIG_PINCTRL_STARFIVE_JHB100_ADC0)	+= pinctrl-starfive-jhb100-adc0.o
 obj-$(CONFIG_PINCTRL_STARFIVE_JHB100_PER0)	+= pinctrl-starfive-jhb100-per0.o
 obj-$(CONFIG_PINCTRL_STARFIVE_JHB100_PER1)	+= pinctrl-starfive-jhb100-per1.o
 obj-$(CONFIG_PINCTRL_STARFIVE_JHB100_PER2)	+= pinctrl-starfive-jhb100-per2.o
diff --git a/drivers/pinctrl/starfive/pinctrl-starfive-jhb100-adc0.c b/drivers/pinctrl/starfive/pinctrl-starfive-jhb100-adc0.c
new file mode 100644
index 000000000000..8aaa4fca52e6
--- /dev/null
+++ b/drivers/pinctrl/starfive/pinctrl-starfive-jhb100-adc0.c
@@ -0,0 +1,85 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Pinctrl / GPIO driver for StarFive JHB100 SoC ADC-0 domain
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
+static const struct jhb100_pin_layout_desc jhb100_adc0_pl_desc[] = {
+	{ .pin_start = 0, .pin_cnt = 8, .name = "gpio", .gpio_func_sel = 0 },
+	{ 0xff },
+};
+
+static const struct config_reg_layout_desc jhb100_adc0_pinctrl_crl_desc[] = {
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
+static const struct starfive_pinctrl_regs jhb100_adc0_pinctrl_regs = {
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
+static const struct jhb100_pinctrl_func_maps jhb100_func_maps_adc0[] = {
+	{ .func = "adc",		.val = 1 },
+	{ .func = "gpio",		.val = 0 },
+	{ .func = "host0_port80",	.val = 3 },
+	{ .func = "smbalert",		.val = 2 },
+};
+
+static const struct jhb100_pinctrl_domain_info jhb100_adc0_pinctrl_info = {
+	.name			= "jhb100-adc0",
+	.pl_desc		= jhb100_adc0_pl_desc,
+	.crl_desc		= jhb100_adc0_pinctrl_crl_desc,
+	.regs			= &jhb100_adc0_pinctrl_regs,
+	.fmaps			= jhb100_func_maps_adc0,
+	.num_maps		= ARRAY_SIZE(jhb100_func_maps_adc0),
+};
+
+static const struct of_device_id jhb100_adc0_pinctrl_of_match[] = {
+	{
+		.compatible = "starfive,jhb100-adc0-pinctrl",
+		.data = &jhb100_adc0_pinctrl_info,
+	},
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, jhb100_adc0_pinctrl_of_match);
+
+static struct platform_driver jhb100_adc0_pinctrl_driver = {
+	.probe = jhb100_pinctrl_probe,
+	.driver = {
+		.name = "starfive-jhb100-adc0-pinctrl",
+		.of_match_table = jhb100_adc0_pinctrl_of_match,
+	},
+};
+module_platform_driver(jhb100_adc0_pinctrl_driver);
+
+MODULE_DESCRIPTION("Pinctrl driver for StarFive JHB100 SoC ADC-0 domain");
+MODULE_AUTHOR("Alex Soo <yuklin.soo@starfivetech.com>");
+MODULE_LICENSE("GPL");
-- 
2.25.1

