Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=139.219.17.129
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793701385;
	b=Mp3gaAdotsEvWxpGixTgUJ0Q6I2mT7+N3zKD1tpgrzIw5JHC//9K7KzRdvOmkOKOt5HK
	 3uZSGUgxIeVrNN1rJDa5IIYZnpH6/YsG2im3zWOMVZyc0hXci/fG56uAEzglq1jo52Iip
	 P8tjJOpe5kE+zadLwooME+eMrhGGpAqaXQEhXO25OHMYR+Z1/5PMo+HVMqWWMuA0mqJAf
	 6vzo2F1tEE60LQtC453S4D6DC9uhrb59elK4ihmeV9fapQ7oRs7cbZ29kB27NQYxoWfU8
	 mNiw8FwC+nert1Kj8onI4NWEzUPDJw316voUvD3ODHSL3FttSF7PF3Ha9PAQWQMagPA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793701385;
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
	bh=IttzzPfdCeOTx6nD/ulxWS4SWWI92GtSiIJ+mQufLRY=;
	b=SVuk+sI/UwpPg2b5bcNrSezC66H/JOftzhzmQqQNqjwhHGWwLk7pQIlmftl+gDGERIXf
	 TDowsSGsCnNQ9sTz6IKkQd2d3LTuqQxb2skaIBu3R9CqBog1wFSzBcKYI5bcvxR45Y+Cc
	 DNVnE//cDgXqFRKQqqAC0i5vvCr4BRu2R8DY8bnTV6x/Niz1tr7bKsqONkPKBY/5jDpR+
	 aXhdOhwl6HaGKTM3/nKeILBhKSyyBOfeMQSe/YXjvnaxp/4lBaddcbESOKUJxzeqKtDE5
	 ITQN9r7GRTV48sFjGY7TvBFUCFnDfDnsAin1SeMitJ/JVOnR3UHSs2Jm/9JKIeTWThQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=starfivetech.com;
	spf=pass smtp.mailfrom=starfivetech.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=139.219.17.129
Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2129.outbound.protection.partner.outlook.cn [139.219.17.129])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67FF8606FAF5;
	Tue,  3 Nov 2026 10:23:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67FF8606FAF5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hlnMvhqphSvrAgWQThI+Um1pMaOXF556HVTDNqpmLxvRVDQ9WjS+UApHerbCwmn4JO+ypXpsRKfJQJ2rGmJtk9tYt7ay2afWK9Pe215YuX1w7x7nr1QBrbwxKUNXx5m3n80c+cRyFTZHZFPWH3qzP4EqDwAVrOM95HBWu0aDGnS6BeQowo1KlxKxZEO6UYqOhVEEUu+BHVnj3cq/k8kBEuYZL67F9/eNfdgkBuaQZ227h79iYCy/GzV9f/bv8RmUp85IQyTIwDJ7IMhk+uGM0loVqhRg5Hnlk9AXHxGSlnDPOXW+cGvgfcs/FtHBYEJgSGHkUqwqsHpSdaXEiS1UZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IttzzPfdCeOTx6nD/ulxWS4SWWI92GtSiIJ+mQufLRY=;
 b=O2xwgEn89wcxfdezGO1KV5WHJr4shDHoZPW+f3B7kP0XeaXeKud0YbICHSt4wmf2H6/ZW2xNftefmS/5R6fMDtgMLCxDHwACWK6rVH9vALHXum6NKb2QhXu7uCz9aQHqTuIvjVCfR/yUv/IkJAeRZLaCyiKdtck//qP9p7KeNWeTzew/VtEZXgEUif3Hw4kpNx5WIzI9BIunUXezYHU7VPBZyiYWZwXPX7ckoGC22MHbIVJFfW0Ycl3p/Vci8WDZd5S4ZrpvmBlHT9I8MivHPHHR1So7KDZMOS2ghZh01wf8OYNZj1Sc8TSKkJIwHoDJWpTFVT13wJHC5miKZG1jbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1329.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:16::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Tue, 3 Nov
 2026 10:22:53 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0569.011; Tue, 3 Nov 2026 10:22:53 +0000
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
Subject: [PATCH v1 RESEND 8/8] pinctrl: starfive: Add StarFive JHB100 vga controller driver
Date: Tue,  3 Nov 2026 02:22:36 -0800
Message-Id: <20261103102236.96872-9-changhuang.liang@starfivetech.com>
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
X-MS-Office365-Filtering-Correlation-Id: b87c1554-ef15-4cdb-a07d-08df39946b9a
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|23010399003|6133799003|10067099003|261102123227099003|22082099003|18002099003|3023799007|38350700014|56012099006|5023799004|261022075727099003|261026121527099003|261026140227099003|261021121427099003|261022105027099003|261009223027099003|261028144727099003;
X-Microsoft-Antispam-Message-Info:
	HkAEK6e/WHFsHMD+zxb88inH7BgYwpNexICd1oU6GYTqPgZKYFccG6dqjMfvkSh75wvxMVpqMZkR1pteYqgfAa9xrpjotMKXEvEZjbKKmt3j6iVz9DshyB0HUpbo+CrZZpAgu/FF3UWr5ODpXo8LiQhnUU8JGALMjKlgdK+z6uOtLv+9O+UmYaeJrrwHNRohscMELvx7diUtJkcQqhFUwS0ZHjmvQlCcXbBvzjuggRdUa+LBEQdMUN+ICCepn3P7oMKeBqMo82fzIH8SyVH5EfSqbDM8waXEYNomYQdQX6jUZBeTr7KRndnnzFWw/mQAL/dOWrBOCCitT5ru3K+y5eIIyN1ot8Qs4p1GI3/KV1xeQQtqnS3Na1uRpJ3wgUee9ARkdYHbAQKhIuaY0xOaqkhY93RbqoCnCoIEK+15AKYpPgGKrEba032w+JInTvcFDhEMnt6Mz+JMm69sBgY2zTrNAP95S1Sy6wBp+ot1Bp1bdlNAitXvJrV6YNYzOdMMceLbSOYX62NPYJBKhg6xgtI5IgA8SbaJcGzOom0zmkUUv5/Fer3SMAx8mXF33ap6
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(23010399003)(6133799003)(10067099003)(261102123227099003)(22082099003)(18002099003)(3023799007)(38350700014)(56012099006)(5023799004)(261022075727099003)(261026121527099003)(261026140227099003)(261021121427099003)(261022105027099003)(261009223027099003)(261028144727099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?yKC8fDUW8l8MBkKat80YXgBQrTOuz/I/oJU4Yo8G42STKUSn+ZDD8T9fSK4D?=
 =?us-ascii?Q?3frhYGSi89sjMrCuXXpJWAKIPWDJ+n16apoK+S3rm1aeduSkcwK1J15bYEyc?=
 =?us-ascii?Q?UKQ4SzAep+r/K6nGwUgMKWxE1MI9UhPEf3YiKOIhoMXOMmMjgYCugKN/kA6B?=
 =?us-ascii?Q?ANwlZaNLo3c2HG4uzRcz0/4UJTImAWky5ySOvm6yj2ECjWzNqoF1GT4nJTcd?=
 =?us-ascii?Q?QlZdNSCmoElgFiJzLaJc8L8zDM7KjfuRpfCzVX6VxR3niRREEDy6yJTAjiRT?=
 =?us-ascii?Q?w22yvEy00z5lwWwBuL56T380lLa8rvloN5rhum6M3UDAkF2Vcyq6z/uJwveM?=
 =?us-ascii?Q?6vulTnrfxPSzVglhMBvsBDyLmBdpyCv8G4+6p0fORFhbh3FAptFRP+Uh1Na1?=
 =?us-ascii?Q?jGeiwLJzFzkcf99VEU8MapQm7zz6urG79LSjPwO1A/WT1vImUAXhA3f0DHBl?=
 =?us-ascii?Q?0jQkfN6sZaft77vsF/uTRQYx7KfSILWZOi5JtrD3Pawj/tWdFmhpRefm+igd?=
 =?us-ascii?Q?IQFuiIhpYSWX3uOgeEcniEMcRNmM6+NKyonIBe85Z8NCVbYjjy6B2j1h9Rs8?=
 =?us-ascii?Q?e4vaM91BptB2O7q97D3imsSqg0tRF/rGv1OYz9BcgOzI8PLxFtZsan/haFee?=
 =?us-ascii?Q?gB5WB6BoYjtEdpNZV3jg9K7tskeQUJiJtMzUYb/3F0cS4cA92prJLOo1kMap?=
 =?us-ascii?Q?H2ibsrCSVzA0az4QpELiKZHawjBfltnAPfm0jOYqna0n7JWPOsubwnPFs2Ay?=
 =?us-ascii?Q?YsbDgEfhMse7s0b0+MVTy+gFYmolwrC7y5ebzklvC8EvCWQnYzgwIB3xUEYl?=
 =?us-ascii?Q?P9FB3avvymFgF3tRnoAdpPhumsGt2ifYCcP3cZ1GZmEywf6wzuYsfvjXFcLo?=
 =?us-ascii?Q?g5hGjW3KyU7wz9CeHy/3ndflqFtQeef4FbL8gjG1Ttdi+/BMcDXlzbDvNY9p?=
 =?us-ascii?Q?T23flC+SpVj6fidZ91oS/hF+TGjIaj3hPUhnCMeopNqyyhsidz/UQshGkufl?=
 =?us-ascii?Q?gNF21Fqwk9weZvSHmje9kZkXxoVh7AiaPPw5Qq2Q/kAAGOUA/zMBaaPBNH0X?=
 =?us-ascii?Q?KHOwYZWpjeH8xaHfY9H6WVKHxB0cGD5Ku578WKSZgdzVXqx6zBv/WK2ekZCr?=
 =?us-ascii?Q?v/GXonUtreB7kgAM3wo+SmG5t4Uj8jEq22hXfGAKhAZE5SIReR9/Kb+EVD4n?=
 =?us-ascii?Q?gBakZaqCpuh4+HZ17JUieTeFCzluQJG9Vz7f+mezTMvHmQ8i16KZFeePBA5B?=
 =?us-ascii?Q?be327bKHd8U6LMBaS5MMVgBJcmyr0p5i44x2JuT4HIIH3wl1pJUoVHvJgbe+?=
 =?us-ascii?Q?o0UwqfJ+bNPrk8oaLuZS5DRly9K+bDwo6k027A4c6DkcFydT+15nTjFN5r2L?=
 =?us-ascii?Q?WizhDMCgVDea1z4c2764TZsDYjlCo5AQPDA9uL3nJrLbG1QaXxyXJ6OIXQq0?=
 =?us-ascii?Q?oeB/8O3zmCr6Sd2IBwk2LDHwaPaN2ky1uapHYSDZx9v5EEY3y4qVHkcGAGpJ?=
 =?us-ascii?Q?2rYn5b21S+PMxh0tSv4AxUwKMeUPD6TqgtO14GC/8DYCxRcJFr35J5QLnF+5?=
 =?us-ascii?Q?CEQoUSguaPdo9AsgR1LJ9nGtt8eaSy57gKD2JgbwMMhBVvEsZuf9GBNdCEA8?=
 =?us-ascii?Q?1Ls0o06V9aB64QxSU5+ZlW/0qtjeegDSxqqeNmlIDv8aUhkJcpoJcJ022OEQ?=
 =?us-ascii?Q?S+elIb28R/WfYPiILo1um1dR3/dCAK9FCFNRO46ECtSya0rGLSK5J7bNroUk?=
 =?us-ascii?Q?pwv1t1F/8VSOROxKIgxk12/KbEUqZAPa2gx1NP8q475Tcm3X9JAb?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b87c1554-ef15-4cdb-a07d-08df39946b9a
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2026 10:22:53.6687
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Pei0Ekio4akdzjqdddKhBqFrqytuvKMXEBhUTmI8NYQIM9EQMkif+aUhBOnj0usOTv9mDGh/qbbTYphGahe6NCkYQDc1g0jbbw8Txohjc+eo4ERAm46kB0bVX/unttg1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1329

Add pinctrl driver for StarFive JHB100 SoC VGA(vga) pinctrl
controller.

Co-developed-by: Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
Signed-off-by: Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
Signed-off-by: Alex Soo <yuklin.soo@starfivetech.com>
Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 drivers/pinctrl/starfive/Kconfig              | 11 +++
 drivers/pinctrl/starfive/Makefile             |  1 +
 .../starfive/pinctrl-starfive-jhb100-vga.c    | 86 +++++++++++++++++++
 3 files changed, 98 insertions(+)
 create mode 100644 drivers/pinctrl/starfive/pinctrl-starfive-jhb100-vga.c

diff --git a/drivers/pinctrl/starfive/Kconfig b/drivers/pinctrl/starfive/Kconfig
index 76f2d59e8a8d..5b10b0a22078 100644
--- a/drivers/pinctrl/starfive/Kconfig
+++ b/drivers/pinctrl/starfive/Kconfig
@@ -185,3 +185,14 @@ config PINCTRL_STARFIVE_JHB100_SYS2
 	  This also provides an interface to the GPIO pins not used by other
 	  peripherals supporting inputs, outputs, configuring pull-up/pull-down
 	  and interrupts on input changes.
+
+config PINCTRL_STARFIVE_JHB100_VGA
+	tristate "StarFive JHB100 SoC VGA pinctrl and GPIO driver"
+	depends on ARCH_STARFIVE || COMPILE_TEST
+	select PINCTRL_STARFIVE_JHB100
+	default m if ARCH_STARFIVE
+	help
+	  Say yes here to support VGA pin control on the StarFive JHB100 SoC.
+	  This also provides an interface to the GPIO pins not used by other
+	  peripherals supporting inputs, outputs, configuring pull-up/pull-down
+	  and interrupts on input changes.
diff --git a/drivers/pinctrl/starfive/Makefile b/drivers/pinctrl/starfive/Makefile
index d570b192b260..170b24a7f29f 100644
--- a/drivers/pinctrl/starfive/Makefile
+++ b/drivers/pinctrl/starfive/Makefile
@@ -19,3 +19,4 @@ obj-$(CONFIG_PINCTRL_STARFIVE_JHB100_SYS0)	+= pinctrl-starfive-jhb100-sys0.o
 obj-$(CONFIG_PINCTRL_STARFIVE_JHB100_SYS0H)	+= pinctrl-starfive-jhb100-sys0h.o
 obj-$(CONFIG_PINCTRL_STARFIVE_JHB100_SYS1)	+= pinctrl-starfive-jhb100-sys1.o
 obj-$(CONFIG_PINCTRL_STARFIVE_JHB100_SYS2)	+= pinctrl-starfive-jhb100-sys2.o
+obj-$(CONFIG_PINCTRL_STARFIVE_JHB100_VGA)	+= pinctrl-starfive-jhb100-vga.o
diff --git a/drivers/pinctrl/starfive/pinctrl-starfive-jhb100-vga.c b/drivers/pinctrl/starfive/pinctrl-starfive-jhb100-vga.c
new file mode 100644
index 000000000000..8cdabd91016f
--- /dev/null
+++ b/drivers/pinctrl/starfive/pinctrl-starfive-jhb100-vga.c
@@ -0,0 +1,86 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Pinctrl / GPIO driver for StarFive JHB100 SoC VGA domain
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
+static const struct jhb100_pin_layout_desc jhb100_vga_pl_desc[] = {
+	{ .pin_start = 0, .pin_cnt = 1, .name = "hsync", .gpio_func_sel = 1 },
+	{ .pin_start = 1, .pin_cnt = 1, .name = "vsync", .gpio_func_sel = 1 },
+	{ .pin_start = 2, .pin_cnt = 1, .name = "ddcclk", .gpio_func_sel = 1 },
+	{ .pin_start = 3, .pin_cnt = 1, .name = "ddcdat", .gpio_func_sel = 1 },
+	{ 0xff },
+};
+
+static const struct config_reg_layout_desc jhb100_vga_pinctrl_crl_desc[] = {
+	{
+		.pin_start					= 0,
+		.pin_cnt					= 4,
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
+static const struct starfive_pinctrl_regs jhb100_vga_pinctrl_regs = {
+	.func_sel		= { .reg = 0x1c, .width_per_pin = 2 },
+	.config			= 0x00,
+	.output			= 0x10,
+	.output_en		= 0x14,
+	.gpio_status		= 0x18,
+	.irq_en			= 0x20,
+	.irq_status		= 0x24,
+	.irq_clr		= 0x28,
+	.irq_trigger		= 0x2c,
+	.irq_level		= 0x30,
+	.irq_both_edge		= 0x34,
+	.irq_edge		= 0x38,
+};
+
+static const struct jhb100_pinctrl_func_maps jhb100_func_maps_vga[] = {
+	{ .func = "gpio",		.val = 1 },
+	{ .func = "vga",		.val = 0 },
+};
+
+static const struct jhb100_pinctrl_domain_info jhb100_vga_pinctrl_info = {
+	.name			= "jhb100-vga",
+	.pl_desc		= jhb100_vga_pl_desc,
+	.crl_desc		= jhb100_vga_pinctrl_crl_desc,
+	.regs			= &jhb100_vga_pinctrl_regs,
+	.fmaps			= jhb100_func_maps_vga,
+	.num_maps		= ARRAY_SIZE(jhb100_func_maps_vga),
+};
+
+static const struct of_device_id jhb100_vga_pinctrl_of_match[] = {
+	{
+		.compatible = "starfive,jhb100-vga-pinctrl",
+		.data = &jhb100_vga_pinctrl_info,
+	},
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, jhb100_vga_pinctrl_of_match);
+
+static struct platform_driver jhb100_vga_pinctrl_driver = {
+	.probe = jhb100_pinctrl_probe,
+	.driver = {
+		.name = "starfive-jhb100-vga-pinctrl",
+		.of_match_table = jhb100_vga_pinctrl_of_match,
+	},
+};
+module_platform_driver(jhb100_vga_pinctrl_driver);
+
+MODULE_DESCRIPTION("Pinctrl driver for StarFive JHB100 SoC VGA domain");
+MODULE_AUTHOR("Alex Soo <yuklin.soo@starfivetech.com>");
+MODULE_LICENSE("GPL");
-- 
2.25.1

