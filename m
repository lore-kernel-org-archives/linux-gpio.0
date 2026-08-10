Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2138.outbound.protection.partner.outlook.cn [139.219.146.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CF77339378;
	Mon, 10 Aug 2026 06:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786344736; cv=fail; b=OoKgdmmlm6OxpkF65IV9fV/INllijAbaQi9QlCjqwSgtMhaDuhWRqHttLBmCIxwmrnY17q5yjNIF1osCn8jEgTeyYAszgw5EShl/nrkCCvZqvi/Ali7fz9AhYED9mCTkYNyqDffXS/uOtDTQDB1dsfsqeDGWWfqRuUB9Z5FC6hY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786344736; c=relaxed/simple;
	bh=fkT3wNjAkzCEosEPgA1VCWrycpUeIJuqbaPtbEvZVsw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=PznuJ4yXeOsBbo4ohwE9u9D5zxf4oKzXfZAMlijuiIImzvSn/+F5Z1i8E+ZrgWHDG1XkJ9WrJtYbTJN7M7neMK7ttXrRk+XNDRITsqX9hr/XKS60cbLl7Dx+A2Kn06aBxZlPUf4UuEkmlX8qWU36EN39WMSWgkd7vrW/DXfR8W8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=amitMkEvUhf4uF0JSPCjMfJ8mMKsf6N7jTGvfwub1ZF4dgjBsIyPwQdCL1tW3GOgKwkP8Bg1XRhz5jSJ60/2AZqw+HZ0JM9bk0GOlkdDwAR4GM6JnbIcP3RIlQBJoeaBgXtyfXxukZ3DueZfecTq+51U2Fzb+y5EiBKIh9GYWuGENI3iEgtTy+IdfHYwPg6V5BuThZq68F78omTXw+ETlxyV3sCxSMfUDA2iUkG/Wa/IwuFqT62za63mYn02PON5qkE5ZGQS+DzNz4bJ3tGrHA3YvJbXCKw2b//HDvA5U+JbfSMsNJauZ2Tgr8kGmqb7OFcLcqtodQX0ZhqCWPT9Cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZL189OgXpXPwUI+cjZRl1y0Ryjhz/bcYrXw1BhX8i9E=;
 b=ZTKw3XZS+Kv6aJoUi87rz7f7P7pILHcDFd1lEpq0k9q67e3lr+Ia1jP/wYvIpKKRPlBSdqD0y3Q4yqnmdNKpgHuTJAUXfH4nlCan6BpsAAlvu8ljXzN4tw0H1NATHQSrskQ7ue+0cN4zptIFl0wyTY40NGXhSMeTJQZ3ndoagpW8iLH2VLQFcrEFEyg1hXK6E0cGjdyE2LZqXIytI0xVX4CShRKBpSN0NVEQEbej0EbbQqqCGz3PTksc3wmWUBYIZ3xmdWv+l46H9rjzw1nbZ5xb6qz+FIq5hVUg543JAbECq6oVPQDOF/CBJUKDfl7D9oJaRD4zQpIwmWm4cBYJhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1315.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:15::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Mon, 10 Aug
 2026 06:37:03 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0292.024; Mon, 10 Aug 2026 06:37:03 +0000
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
Subject: [PATCH v5 04/21] pinctrl: starfive: Add StarFive JHB100 sys0 controller driver
Date: Sun,  9 Aug 2026 23:36:33 -0700
Message-Id: <20260810063650.239303-5-changhuang.liang@starfivetech.com>
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
X-MS-Office365-Filtering-Correlation-Id: 76a811d7-568a-4f16-490d-08def6a9ca25
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|52116014|366016|7416014|56012099006|5023799004|10067099003|6133799003|3023799007|18002099003|22082099003|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	HMqzxS55T8YPg0xjmGyxG2QNo9cg0Uz2nGtZ3jwHJmnO/c11qvP9uTdQnSN5gVezCnFrPDwdxwzktTBC+ZfkSHWhG2up1DO/NYPoOjMsGAt/JLqHUy1+9EfAzswZIb5IQyjC5+frPD4cjvJLAUNGDb4GL+lTVKGpLYWWuAADkumvzug3F1ceHl7Bnnf+cac50llcUSBw4c/O8MVVnQoe/cAnpoJit1plK9Xhur0kKxYK56iqv8FGfEDg0BSwk13swIut1mVoualV9aKTs/y/UzdcjwereSFERowqN8mgyPjSdCQWjEbDB8SBntdRgMk7IDBxkn/Bz2HdexPnmC9+3EmdXpmCjn/stcEUrhOIgmGRCS+Z+rWd6oGSpk9HHUu4SCDNWXMKU0GFERqfyP3tMKRSTnhntuSEGyAWg+LwzCzYAlaAWdQ26QgLNcTUC10Z9lM+kfENuB73zy9EG96yCjg72B+bx/t9zLvjpQDeGxFVfvGUNLpyanfCkN9uwG86VVOinhl2EzSYQXntoFIpu+0sqZTp1ZEZkXTy9/eLCwIocBMSTqJw8kCdYNRj6cNEpLXCJiP26tgCzf1ZcjvAtQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(52116014)(366016)(7416014)(56012099006)(5023799004)(10067099003)(6133799003)(3023799007)(18002099003)(22082099003)(38350700014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6MrC0xHINNqGxcxR0ijgnNha+iqihOzZAHNiGOIt/0Jbdl61qwnMVJSpbMgb?=
 =?us-ascii?Q?gcfPCDOC/M2N1P7lSQSRuzUrTF11FpP+Cl+nUFJSKTjLTsrh98H6gyVVQ5GF?=
 =?us-ascii?Q?frgrnMqHm0Fyq7AuQxhvcP5PUNzXdnFEq6QQmFQkAjeWzRE7lEQfCVvngp6U?=
 =?us-ascii?Q?opLAe40wYdOHjRbX2kngl1/nzzjy46DBKfz8MK5Ub606SrO3ouk0BMVyfSVi?=
 =?us-ascii?Q?pNnHZ2qOkcbk3kYTo2NNQp0ogVYEGcQEf8evTIPdxSVLOcoRSc9CtJAgHfcy?=
 =?us-ascii?Q?UdBnJvKYpIhmwf3qrYy03wM+W2QJVgyHoS2+bHExDLruA6nIZe/SWgJmIsKR?=
 =?us-ascii?Q?RKE+0eWpe46DjmeiuPGcrAHqIcmZM5RR6DkwgLcLjUkpqlwMK7sbabiL8Gog?=
 =?us-ascii?Q?/3EfGuhhtP8GZBkQOvcqbMkRUvLTpt9piPETVZNYF8Lw6kF7F/u0KkRfVIvE?=
 =?us-ascii?Q?9L/brd7sgU9pibK+zYY5OSmjG/J0q38RYIArfRqUktN46GUkSypv850ngShr?=
 =?us-ascii?Q?IWjcVSfhHEzrwOee3Pr+9uHLjftfxk6QVLu9t0jUH6Tf8j75Lx8YE9P/uK02?=
 =?us-ascii?Q?Qw68qDqCajIWMecQATPMmbKJVmf0huptkQGBV9K2mCxB+L+yRC7CGFbx0HF+?=
 =?us-ascii?Q?fmgLk72ISzHBGF+3KTp7zAgKXCpDdv5uKFjcHguId4B6UEnzgDfRDKFIS5kP?=
 =?us-ascii?Q?t3h/OQXihIgDkET9FeHTaMRBPFAuPqsfpf4clYr6Kxpz2G9VCp4iVXMann6k?=
 =?us-ascii?Q?NZAjhc4TesxAU0BL8R7VBfYvXoAjGviGTCDayoQbTKYO67zuwyumjNVwxSUh?=
 =?us-ascii?Q?ntk0DDguEhF986XuSm7JJ8j48vPpfKfd1Vzjt3ZFQ0EBcx7autIkLkQ0/WiR?=
 =?us-ascii?Q?imoUejk2fpFW1Xe9Pkcx2XlEIJnka7yd+zChwOA8XzFJ9yCsVICkc32ERllU?=
 =?us-ascii?Q?UC/r/DHGeWltQPaTuSq+yMN2wHLuNzWcFTfvc4OUhHhaH8yQ85AJgzE78/t2?=
 =?us-ascii?Q?NY01Eh7beBgdni/YtZJmevzMP9ycKJQUIIjlzlX836aBTgYgyVVs2MIDXdz2?=
 =?us-ascii?Q?NqKerxdR9YeEgR1Xp3IckV6HrJqVwU91kWVb3Wl94k+fSqO9sSdX8mlwBkdg?=
 =?us-ascii?Q?xi/DAdQlsw8Is2bwdfqSB/NLWbBasFnnrPORZ1JIbTqz2BE6heElsiszSDaO?=
 =?us-ascii?Q?sa9XRbE+f31uHDRFXVGExs6+DS7iWaIwj8quhNJYTOgM+oeqv8U2HkAjJqg7?=
 =?us-ascii?Q?1WWW5oxKahicvCBvpq3dvkjHTtjasuMdt1Bk44U33ZPzC4BQ/55vx4o+uGib?=
 =?us-ascii?Q?xcf5PkuFNeCOIBS53fDrxoD1bJy8D9Y6IBLYUUUZkDW/aCAKGHIOE6gZvKCK?=
 =?us-ascii?Q?r/Vh1w+rhHHWkL8iJ4vz5NbL26URStBmZjs+sBlGL63GTMrCzGPRd5dfnomK?=
 =?us-ascii?Q?RGpGjBzAUpHDYjGHIdSv/wQHVodFabbvKUDuUGZjiQbj6wfUnQBkSQJchblk?=
 =?us-ascii?Q?veTAujG3f9HtFsWhV+6Haze7xKDvhJjRu+ocOqN840Os0ydxDYGUEIoonj8M?=
 =?us-ascii?Q?AB3a3woHsadMM2Mor9iCsJVyuC4yNPBbChdyfjq2MGh+CbKhwn0FD3Aewy5B?=
 =?us-ascii?Q?sOlGlJOl+R8ESse6FGvezj23yJmbHxFP4JjxCEnS0vxonhT59CWdCJh2eoWi?=
 =?us-ascii?Q?dVDMb+oaKQfh26l2AE5I1OaGhT1Gr7cuOOqXXCsxioFg5614MEzV237qfme1?=
 =?us-ascii?Q?U921Y6Ub9lp+4CAuTlpaijeXJSh2kGdDApAgvqJds8J8tfDs2MVa?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76a811d7-568a-4f16-490d-08def6a9ca25
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2026 06:37:03.6903
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4qwfX8T3fUkmsCR2znrbH6ewABMmF0yXWe1RgBcSMQD5UzrH32gQfO86vxtw9DnHziaeQC/EQHx0kdSs7feBpCqjIo9E/OVneqK7wVMOR0h7PVpxNrU0jD6m5QA/t3T3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1315

Add pinctrl driver for StarFive JHB100 SoC System-0(sys0) pinctrl
controller.

Simultaneously add a generic pinctrl driver framework for registering
the pinctrl of other domains (sys1, sys2, and so on) in the JHB100 SoC.

Co-developed-by: Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
Signed-off-by: Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
Signed-off-by: Alex Soo <yuklin.soo@starfivetech.com>
Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 MAINTAINERS                                   |    9 +
 drivers/pinctrl/starfive/Kconfig              |   20 +
 drivers/pinctrl/starfive/Makefile             |    3 +
 .../starfive/pinctrl-starfive-jhb100-sys0.c   |  118 ++
 .../starfive/pinctrl-starfive-jhb100.c        | 1456 +++++++++++++++++
 .../starfive/pinctrl-starfive-jhb100.h        |  159 ++
 6 files changed, 1765 insertions(+)
 create mode 100644 drivers/pinctrl/starfive/pinctrl-starfive-jhb100-sys0.c
 create mode 100644 drivers/pinctrl/starfive/pinctrl-starfive-jhb100.c
 create mode 100644 drivers/pinctrl/starfive/pinctrl-starfive-jhb100.h

diff --git a/MAINTAINERS b/MAINTAINERS
index e2b317c57a49..198c88b907a0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25910,6 +25910,15 @@ S:	Supported
 F:	Documentation/devicetree/bindings/interrupt-controller/starfive,jhb100-intc.yaml
 F:	drivers/irqchip/irq-starfive-jhb100-intc.c
 
+STARFIVE JHB100 PINCTRL DRIVERS
+M:	Changhuang Liang <changhuang.liang@starfivetech.com>
+M:	Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
+L:	linux-gpio@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/pinctrl/starfive,jhb1*.yaml
+F:	drivers/pinctrl/starfive/pinctrl-starfive-jhb1*
+F:	include/dt-bindings/pinctrl/starfive,jhb100-pinctrl.h
+
 STARFIVE JHB100 RESET CONTROLLER DRIVERS
 M:	Changhuang Liang <changhuang.liang@starfivetech.com>
 S:	Maintained
diff --git a/drivers/pinctrl/starfive/Kconfig b/drivers/pinctrl/starfive/Kconfig
index a9a7cb101684..eb0b3b705ec5 100644
--- a/drivers/pinctrl/starfive/Kconfig
+++ b/drivers/pinctrl/starfive/Kconfig
@@ -47,3 +47,23 @@ config PINCTRL_STARFIVE_JH7110_AON
 	  This also provides an interface to the GPIO pins not used by other
 	  peripherals supporting inputs, outputs, configuring pull-up/pull-down
 	  and interrupts on input changes.
+
+config PINCTRL_STARFIVE_JHB100
+	bool
+	depends on OF
+	select GENERIC_PINCTRL
+	select GPIOLIB
+	select GPIOLIB_IRQCHIP
+	select GPIO_GENERIC
+	select OF_GPIO
+
+config PINCTRL_STARFIVE_JHB100_SYS0
+	tristate "StarFive JHB100 SoC System-0 pinctrl and GPIO driver"
+	depends on ARCH_STARFIVE || COMPILE_TEST
+	select PINCTRL_STARFIVE_JHB100
+	default ARCH_STARFIVE
+	help
+	  Say yes here to support system-0 pin control on the StarFive JHB100 SoC.
+	  This also provides an interface to the GPIO pins not used by other
+	  peripherals supporting inputs, outputs, configuring pull-up/pull-down
+	  and interrupts on input changes.
diff --git a/drivers/pinctrl/starfive/Makefile b/drivers/pinctrl/starfive/Makefile
index ee0d32d085cb..c0d368f413bc 100644
--- a/drivers/pinctrl/starfive/Makefile
+++ b/drivers/pinctrl/starfive/Makefile
@@ -5,3 +5,6 @@ obj-$(CONFIG_PINCTRL_STARFIVE_JH7100)	+= pinctrl-starfive-jh7100.o
 obj-$(CONFIG_PINCTRL_STARFIVE_JH7110)		+= pinctrl-starfive-jh7110.o
 obj-$(CONFIG_PINCTRL_STARFIVE_JH7110_SYS)	+= pinctrl-starfive-jh7110-sys.o
 obj-$(CONFIG_PINCTRL_STARFIVE_JH7110_AON)	+= pinctrl-starfive-jh7110-aon.o
+
+obj-$(CONFIG_PINCTRL_STARFIVE_JHB100)		+= pinctrl-starfive-jhb100.o
+obj-$(CONFIG_PINCTRL_STARFIVE_JHB100_SYS0)	+= pinctrl-starfive-jhb100-sys0.o
diff --git a/drivers/pinctrl/starfive/pinctrl-starfive-jhb100-sys0.c b/drivers/pinctrl/starfive/pinctrl-starfive-jhb100-sys0.c
new file mode 100644
index 000000000000..3ed6a7b63064
--- /dev/null
+++ b/drivers/pinctrl/starfive/pinctrl-starfive-jhb100-sys0.c
@@ -0,0 +1,118 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Pinctrl / GPIO driver for StarFive JHB100 SoC System-0 domain
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
+static const struct jhb100_pin_layout_desc jhb100_sys0_pl_desc[] = {
+	{ .pin_start = 0, .pin_cnt = 3, .name = "gpio", .gpio_func_sel = 0, },
+	{ .pin_start = 3, .pin_cnt = 1, .name = "bmcpcierp_pe2rst_out", .gpio_func_sel = 1, },
+	{ .pin_start = 4, .pin_cnt = 1, .name = "testen", .gpio_func_sel = -1, },
+	{ .pin_start = 5, .pin_cnt = 1, .name = "syspok_in", .gpio_func_sel = -1, },
+	{ .pin_start = 6, .pin_cnt = 1, .name = "sysrstn_in", .gpio_func_sel = -1, },
+	{ .pin_start = 7, .pin_cnt = 1, .name = "perstn0_in", .gpio_func_sel = -1, },
+	{ .pin_start = 8, .pin_cnt = 1, .name = "perstn1_in", .gpio_func_sel = -1, },
+	{ .pin_start = 9, .pin_cnt = 1, .name = "aprstn_out", .gpio_func_sel = -1, },
+	{ .pin_start = 10, .pin_cnt = 1, .name = "pcierp_wake", .gpio_func_sel = -1, },
+	{ 0xff },
+};
+
+static const struct config_reg_layout_desc jhb100_sys0_pinctrl_crl_desc[] = {
+	{
+		.pin_start					= 0,
+		.pin_cnt					= 4,
+		.fields[PAD_CFG_DRIVE_STRENGTH_2BIT]		= { .shift = 0, .width = 2 },
+		.fields[PAD_CFG_INPUT_ENABLE]			= { .shift = 2, .width = 1 },
+		.fields[PAD_CFG_PULL_DOWN]			= { .shift = 3, .width = 1 },
+		.fields[PAD_CFG_PULL_UP]			= { .shift = 4, .width = 1 },
+		.fields[PAD_CFG_SLEW_RATE]			= { .shift = 5, .width = 1 },
+		.fields[PAD_CFG_SCHMITT_TRIGGER_SELECT]		= { .shift = 6, .width = 1 },
+		.fields[PAD_CFG_DEBOUNCE_WIDTH]			= { .shift = 15, .width = 17 },
+	},
+	{
+		.pin_start					= 4,
+		.pin_cnt					= 5,
+		.fields[PAD_CFG_SCHMITT_TRIGGER_SELECT]		= { .shift = 0, .width = 1 },
+	},
+	{
+		.pin_start					= 9,
+		.pin_cnt					= 1,
+		.fields[PAD_CFG_DRIVE_STRENGTH_2BIT]		= { .shift = 0, .width = 2 },
+		.fields[PAD_CFG_SLEW_RATE]			= { .shift = 2, .width = 1 },
+	},
+	{
+		.pin_start					= 10,
+		.pin_cnt					= 1,
+		.fields[PAD_CFG_DRIVE_STRENGTH_2BIT]		= { .shift = 0, .width = 2 },
+		.fields[PAD_CFG_INPUT_ENABLE]			= { .shift = 2, .width = 1 },
+		.fields[PAD_CFG_PULL_DOWN]			= { .shift = 3, .width = 1 },
+		.fields[PAD_CFG_PULL_UP]			= { .shift = 4, .width = 1 },
+		.fields[PAD_CFG_SLEW_RATE]			= { .shift = 5, .width = 1 },
+		.fields[PAD_CFG_SCHMITT_TRIGGER_SELECT]		= { .shift = 6, .width = 1 },
+	},
+	{ 0xff },
+};
+
+static const struct starfive_pinctrl_regs jhb100_sys0_pinctrl_regs = {
+	.func_sel		= { .reg = 0x44, .width_per_pin = 2 },
+	.config			= 0x0c,
+	.output			= 0x38,
+	.output_en		= 0x3c,
+	.gpio_status		= 0x40,
+	.irq_en			= 0x48,
+	.irq_status		= 0x4c,
+	.irq_clr		= 0x50,
+	.irq_trigger		= 0x54,
+	.irq_level		= 0x58,
+	.irq_both_edge		= 0x5c,
+	.irq_edge		= 0x60,
+};
+
+static const struct jhb100_pinctrl_func_maps jhb100_func_maps_sys0[] = {
+	{ .func = "auxpwrgood",		.val = 1 },
+	{ .func = "gpio",		.val = 0,
+	  .max_pin = JHB100_FUNC_MAPS_MAX_PIN(PADNUM_SYS0_GPIO_A2) },
+	{ .func = "gpio",		.val = 1,
+	  .max_pin = JHB100_FUNC_MAPS_MAX_PIN(PADNUM_SYS0_GPIO_A3) },
+	{ .func = "hbled",		.val = 1 },
+	{ .func = "pe2rst_out",		.val = 0 },
+};
+
+static const struct jhb100_pinctrl_domain_info jhb100_sys0_pinctrl_info = {
+	.name			= "jhb100-sys0",
+	.pl_desc		= jhb100_sys0_pl_desc,
+	.crl_desc		= jhb100_sys0_pinctrl_crl_desc,
+	.regs			= &jhb100_sys0_pinctrl_regs,
+	.fmaps			= jhb100_func_maps_sys0,
+	.num_maps		= ARRAY_SIZE(jhb100_func_maps_sys0),
+};
+
+static const struct of_device_id jhb100_sys0_pinctrl_of_match[] = {
+	{
+		.compatible = "starfive,jhb100-sys0-pinctrl",
+		.data = &jhb100_sys0_pinctrl_info,
+	},
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, jhb100_sys0_pinctrl_of_match);
+
+static struct platform_driver jhb100_sys0_pinctrl_driver = {
+	.probe = jhb100_pinctrl_probe,
+	.driver = {
+		.name = "starfive-jhb100-sys0-pinctrl",
+		.of_match_table = jhb100_sys0_pinctrl_of_match,
+	},
+};
+module_platform_driver(jhb100_sys0_pinctrl_driver);
+
+MODULE_DESCRIPTION("Pinctrl driver for StarFive JHB100 SoC System-0 domain");
+MODULE_AUTHOR("Alex Soo <yuklin.soo@starfivetech.com>");
+MODULE_LICENSE("GPL");
diff --git a/drivers/pinctrl/starfive/pinctrl-starfive-jhb100.c b/drivers/pinctrl/starfive/pinctrl-starfive-jhb100.c
new file mode 100644
index 000000000000..aec2cb66d5cf
--- /dev/null
+++ b/drivers/pinctrl/starfive/pinctrl-starfive-jhb100.c
@@ -0,0 +1,1456 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Pinctrl / GPIO driver for StarFive JHB100 SoC
+ *
+ * Copyright (C) 2024 StarFive Technology Co., Ltd.
+ * Author: Alex Soo <yuklin.soo@starfivetech.com>
+ *
+ */
+
+#include <linux/bitfield.h>
+#include <linux/bits.h>
+#include <linux/clk.h>
+#include <linux/gpio/driver.h>
+#include <linux/gpio/generic.h>
+#include <linux/io.h>
+#include <linux/irq.h>
+#include <linux/minmax.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/reset.h>
+#include <linux/seq_file.h>
+#include <linux/spinlock.h>
+#include <linux/string.h>
+
+#include <linux/pinctrl/consumer.h>
+#include <linux/pinctrl/pinconf.h>
+#include <linux/pinctrl/pinmux.h>
+
+#include "../core.h"
+#include "../pinconf.h"
+#include "../pinctrl-utils.h"
+#include "../pinmux.h"
+#include "pinctrl-starfive-jhb100.h"
+
+#define GPOEN_ENABLE				0
+#define GPOEN_DISABLE				1
+
+#define JHB100_DEBOUNCE_WIDTH_STAGES_MAX	GENMASK(16, 0)
+#define JHB100_DEBOUNCE_WIDTH_STAGE_NS		80
+
+/* mode select */
+#define JHB100_PUSH_PULL			0
+#define JHB100_OPEN_DRAIN			1
+#define JHB100_LEGACY_FAST_MODE_PLUS		2
+#define JHB100_LEGACY_FAST_MODE			3
+
+/* i2c open-drain pull-up select */
+#define JHB100_I2C_OPEN_DRAIN_PU_600_OHMS	0
+#define JHB100_I2C_OPEN_DRAIN_PU_900_OHMS	1
+#define JHB100_I2C_OPEN_DRAIN_PU_1200_OHMS	2
+#define JHB100_I2C_OPEN_DRAIN_PU_2000_OHMS	3
+
+#define JHB100_NR_GPIOS_PER_BANK		32
+#define JHB100_BANK_OFFSET(n)			((n) * 4)
+
+static int jhb100_map_get_func_val(struct jhb100_pinctrl *sfp, const char *function,
+				   unsigned int pin)
+{
+	const struct jhb100_pinctrl_func_maps *fmaps = sfp->info->fmaps;
+	size_t num = sfp->info->num_maps;
+
+	for (int i = 0; i < num; i++) {
+		if (!strcmp(function, fmaps[i].func)) {
+			if (!fmaps[i].max_pin)
+				return fmaps[i].val;
+
+			if (pin < fmaps[i].max_pin)
+				return fmaps[i].val;
+
+			continue;
+		}
+	}
+
+	return -EINVAL;
+}
+
+static const struct config_reg_layout_desc *get_crl_desc_by_pin(struct jhb100_pinctrl *sfp,
+								unsigned int pin)
+{
+	const struct config_reg_layout_desc *crl_desc = sfp->info->crl_desc;
+	unsigned int i = 0;
+
+	do {
+		if (pin >= crl_desc[i].pin_start &&
+		    pin < crl_desc[i].pin_start + crl_desc[i].pin_cnt)
+			return &crl_desc[i];
+	} while (crl_desc[i++].pin_start != 0xff);
+
+	return NULL;
+}
+
+static inline struct jhb100_gpio_bank *jhb100_gc_to_bank(struct gpio_chip *gc)
+{
+	struct gpio_generic_chip *chip = to_gpio_generic_chip(gc);
+
+	return container_of(chip, struct jhb100_gpio_bank, chip);
+}
+
+static unsigned int jhb100_gpio_to_pin(struct gpio_chip *gc, unsigned int gpio)
+{
+	struct jhb100_gpio_bank *bank = jhb100_gc_to_bank(gc);
+
+	return bank->id * JHB100_NR_GPIOS_PER_BANK + gpio;
+}
+
+static const struct pinctrl_ops jhb100_pinctrl_ops = {
+	.get_groups_count = pinctrl_generic_get_group_count,
+	.get_group_name	  = pinctrl_generic_get_group_name,
+	.get_group_pins   = pinctrl_generic_get_group_pins,
+	.dt_node_to_map	  = pinctrl_generic_pins_function_dt_node_to_map,
+	.dt_free_map	  = pinctrl_utils_free_map,
+};
+
+static void jhb100_set_function(struct jhb100_pinctrl *sfp,
+				unsigned int pin, u8 func)
+{
+	const struct starfive_pinctrl_regs *pinctrl_regs = sfp->info->regs;
+	unsigned int pins_per_reg, offset, shift;
+	void __iomem *func_sel_reg;
+	u32 func_sel_mask;
+	u32 func_sel_val;
+
+	if (!pinctrl_regs->func_sel.reg || !pinctrl_regs->func_sel.width_per_pin)
+		return;
+
+	pins_per_reg = 32 / pinctrl_regs->func_sel.width_per_pin;
+	offset = 4 * (pin / pins_per_reg);
+	shift = pinctrl_regs->func_sel.width_per_pin * (pin % pins_per_reg);
+
+	func_sel_reg = sfp->base + pinctrl_regs->func_sel.reg + offset;
+	func_sel_mask = GENMASK(pinctrl_regs->func_sel.width_per_pin - 1, 0) << shift;
+	func_sel_val = func << shift;
+
+	guard(raw_spinlock_irqsave)(&sfp->lock);
+
+	func_sel_val |= readl_relaxed(func_sel_reg) & ~func_sel_mask;
+	writel_relaxed(func_sel_val, func_sel_reg);
+}
+
+static int jhb100_set_one_pin_mux(struct jhb100_pinctrl *sfp,
+				  unsigned int pin,
+				  u8 func)
+{
+	jhb100_set_function(sfp, pin, func);
+
+	return 0;
+}
+
+static int jhb100_set_mux(struct pinctrl_dev *pctldev,
+			  unsigned int fsel, unsigned int gsel)
+{
+	struct jhb100_pinctrl *sfp = pinctrl_dev_get_drvdata(pctldev);
+	const struct group_desc *group;
+	unsigned int i;
+	const char **functions;
+
+	group = pinctrl_generic_get_group(pctldev, gsel);
+	if (!group)
+		return -EINVAL;
+
+	functions = group->data;
+
+	for (i = 0; i < group->grp.npins; i++) {
+		int function;
+
+		function = jhb100_map_get_func_val(sfp, functions[i], group->grp.pins[i]);
+		if (function < 0) {
+			dev_err(pctldev->dev, "invalid function %s\n", functions[i]);
+			return function;
+		}
+
+		jhb100_set_one_pin_mux(sfp, group->grp.pins[i], function);
+	}
+
+	return 0;
+}
+
+static int jhb100_gpio_request_enable(struct pinctrl_dev *pctldev,
+				      struct pinctrl_gpio_range *range,
+				      unsigned int pin)
+{
+	struct jhb100_pinctrl *sfp = pinctrl_dev_get_drvdata(pctldev);
+	const struct starfive_pinctrl_regs *pinctrl_regs = sfp->info->regs;
+	const struct jhb100_pinctrl_domain_info *info = sfp->info;
+	unsigned int pins_per_reg, offset, shift;
+	u32 func_sel_mask, fs;
+	void __iomem *reg_gpio_func_sel;
+	s8 gpio_func_sel = sfp->gpio_func_sel_arr[pin];
+
+	if (!pinctrl_regs->func_sel.reg || !pinctrl_regs->func_sel.width_per_pin)
+		return -EINVAL;
+
+	pins_per_reg = 32 / pinctrl_regs->func_sel.width_per_pin;
+	offset = 4 * (pin / pins_per_reg);
+	shift = pinctrl_regs->func_sel.width_per_pin * (pin % pins_per_reg);
+
+	reg_gpio_func_sel = sfp->base + info->regs->func_sel.reg + offset;
+	func_sel_mask = GENMASK(info->regs->func_sel.width_per_pin - 1, 0) << shift;
+
+	if (gpio_func_sel < 0)
+		return -EINVAL;
+
+	guard(raw_spinlock_irqsave)(&sfp->lock);
+
+	fs = readl_relaxed(reg_gpio_func_sel);
+	fs &= ~func_sel_mask;
+	fs |= (gpio_func_sel << shift);
+	writel_relaxed(fs, reg_gpio_func_sel);
+
+	return 0;
+}
+
+static void jhb100_padcfg_rmw(struct jhb100_pinctrl *sfp,
+			      unsigned int pin, u32 mask, u32 value)
+{
+	void __iomem *reg;
+	unsigned int offset;
+	int padcfg_base;
+
+	padcfg_base = sfp->info->regs->config;
+
+	offset = 4 * pin;
+
+	reg = sfp->base + padcfg_base + offset;
+
+	value &= mask;
+
+	guard(raw_spinlock_irqsave)(&sfp->lock);
+
+	value |= readl_relaxed(reg) & ~mask;
+	writel_relaxed(value, reg);
+}
+
+static int jhb100_gpio_direction_input(struct gpio_chip *gc,
+				       unsigned int gpio)
+{
+	struct jhb100_gpio_bank *bank = jhb100_gc_to_bank(gc);
+	struct jhb100_pinctrl *sfp = gpiochip_get_data(gc);
+	const struct jhb100_pinctrl_domain_info *info = sfp->info;
+	const struct config_reg_layout_desc *crl_desc;
+	unsigned int pin = jhb100_gpio_to_pin(gc, gpio);
+	unsigned int offset = 4 * bank->id;
+	void __iomem *reg_gpio_oen;
+	u32 doen = 0;
+
+	crl_desc = get_crl_desc_by_pin(sfp, pin);
+	if (!crl_desc) {
+		dev_err(sfp->dev, "pin %d can't not found reg layout descriptor\n",
+			pin);
+		return -EINVAL;
+	}
+
+	jhb100_padcfg_rmw(sfp, pin,
+			  RL_DESC_GENMASK(crl_desc, PAD_CFG_INPUT_ENABLE) |
+			  RL_DESC_GENMASK(crl_desc, PAD_CFG_SCHMITT_TRIGGER_SELECT),
+			  RL_DESC_GENMASK(crl_desc, PAD_CFG_INPUT_ENABLE) |
+			  RL_DESC_GENMASK(crl_desc, PAD_CFG_SCHMITT_TRIGGER_SELECT));
+
+	reg_gpio_oen = sfp->base + info->regs->output_en + offset;
+
+	guard(raw_spinlock_irqsave)(&sfp->lock);
+	doen = readl_relaxed(reg_gpio_oen) | BIT(gpio);
+	writel_relaxed(doen, reg_gpio_oen);
+
+	return 0;
+}
+
+static int jhb100_gpio_direction_output(struct gpio_chip *gc, unsigned int gpio)
+{
+	struct jhb100_gpio_bank *bank = jhb100_gc_to_bank(gc);
+	struct jhb100_pinctrl *sfp = gpiochip_get_data(gc);
+	const struct jhb100_pinctrl_domain_info *info = sfp->info;
+	const struct config_reg_layout_desc *crl_desc;
+	unsigned int pin = jhb100_gpio_to_pin(gc, gpio);
+	unsigned int offset = 4 * bank->id;
+	void __iomem *reg_gpio_oen;
+	u32 doen = 0;
+
+	crl_desc = get_crl_desc_by_pin(sfp, pin);
+	if (!crl_desc) {
+		dev_err(sfp->dev, "pin %d can't not found reg layout descriptor\n",
+			pin);
+		return -EINVAL;
+	}
+
+	jhb100_padcfg_rmw(sfp, pin,
+			  RL_DESC_GENMASK(crl_desc, PAD_CFG_INPUT_ENABLE) |
+			  RL_DESC_GENMASK(crl_desc, PAD_CFG_SCHMITT_TRIGGER_SELECT) |
+			  RL_DESC_GENMASK(crl_desc, PAD_CFG_PULL_DOWN) |
+			  RL_DESC_GENMASK(crl_desc, PAD_CFG_PULL_UP),
+			  0);
+
+	reg_gpio_oen = sfp->base + info->regs->output_en + offset;
+
+	guard(raw_spinlock_irqsave)(&sfp->lock);
+	doen = readl_relaxed(reg_gpio_oen) & ~BIT(gpio);
+	writel_relaxed(doen, reg_gpio_oen);
+
+	return 0;
+}
+
+static int jhb100_gpio_set_direction(struct pinctrl_dev *pctldev,
+				     struct pinctrl_gpio_range *range,
+				     unsigned int pin,
+				     bool input)
+{
+	struct jhb100_pinctrl *sfp = pinctrl_dev_get_drvdata(pctldev);
+	unsigned int id = pin / JHB100_NR_GPIOS_PER_BANK;
+	unsigned int gpio = pin % JHB100_NR_GPIOS_PER_BANK;
+
+	if (input)
+		return jhb100_gpio_direction_input(&sfp->banks[id].chip.gc, gpio);
+
+	return jhb100_gpio_direction_output(&sfp->banks[id].chip.gc, gpio);
+}
+
+static const struct pinmux_ops jhb100_pinmux_ops = {
+	.get_functions_count	= pinmux_generic_get_function_count,
+	.get_function_name	= pinmux_generic_get_function_name,
+	.get_function_groups	= pinmux_generic_get_function_groups,
+	.set_mux		= jhb100_set_mux,
+	.gpio_request_enable	= jhb100_gpio_request_enable,
+	.gpio_set_direction	= jhb100_gpio_set_direction,
+};
+
+static const u8 jhb100_drive_strength_ma[4] = { 2, 4, 8, 12 };
+
+static const u8 jhb100_drive_strength_ma_3bit[8] = { 2, 5, 8, 10, 14, 16, 18, 20 };
+
+static u32 jhb100_padcfg_ds_to_mA(u32 padcfg)
+{
+	return jhb100_drive_strength_ma[padcfg];
+}
+
+static u32 jhb100_padcfg_ds_to_mA_3bit(u32 padcfg)
+{
+	return jhb100_drive_strength_ma_3bit[padcfg];
+}
+
+static u32 jhb100_padcfg_ds_to_uA(u32 padcfg)
+{
+	return (jhb100_drive_strength_ma[padcfg] * 1000);
+}
+
+static u32 jhb100_padcfg_ds_to_uA_3bit(u32 padcfg)
+{
+	return (jhb100_drive_strength_ma_3bit[padcfg] * 1000);
+}
+
+static u32 jhb100_padcfg_ds_from_mA(u32 v)
+{
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(jhb100_drive_strength_ma); i++) {
+		if (v <= jhb100_drive_strength_ma[i])
+			break;
+	}
+	return i;
+}
+
+static u32 jhb100_padcfg_ds_from_mA_3bit(u32 v)
+{
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(jhb100_drive_strength_ma_3bit); i++) {
+		if (v <= jhb100_drive_strength_ma_3bit[i])
+			break;
+	}
+	return i;
+}
+
+static u32 jhb100_padcfg_ds_from_uA(u32 v)
+{
+	/* Convert from uA to mA */
+	v /= 1000;
+
+	return jhb100_padcfg_ds_from_mA(v);
+}
+
+static u32 jhb100_padcfg_ds_from_uA_3bit(u32 v)
+{
+	/* Convert from uA to mA */
+	v /= 1000;
+
+	return jhb100_padcfg_ds_from_mA_3bit(v);
+}
+
+static u32 jhb100_padcfg_vsel_to_reg(u32 val)
+{
+	switch (val) {
+	case 3300:
+	case 1800:
+		return 0;
+	case 2500:
+		return 1;
+	default:
+		return 0;
+	}
+}
+
+static int jhb100_pincfg_reg_to_vref(u32 val)
+{
+	const int vref_table[JHB100_PINVREF_NUM] = { 3300, 2500, 1800 };
+
+	return (val < JHB100_PINVREF_NUM) ? vref_table[val] : -ENOTSUPP;
+}
+
+static u32 jhb100_pincfg_vref_to_reg(u32 val)
+{
+	switch (val) {
+	case 3300:
+		return JHB100_PINVREF_3_3V;
+	case 2500:
+		return JHB100_PINVREF_2_5V;
+	case 1800:
+		return JHB100_PINVREF_1_8V;
+	default:
+		return JHB100_PINVREF_3_3V;
+	}
+}
+
+static int jhb100_pincfg_pin_vref_get(struct jhb100_pinctrl *sfp, unsigned int pin)
+{
+	const struct pinvref_reg *vref = &sfp->info->regs->vref;
+	u32 grp = 0, i;
+	int val;
+
+	while (grp < vref->num_pv) {
+		for (i = 0; i < vref->pv_desc[grp].num_pins; i++) {
+			if (pin != vref->pv_desc[grp].pin_grp[i])
+				continue;
+
+			val = readl(sfp->base + vref->reg + grp * 4);
+
+			return jhb100_pincfg_reg_to_vref(val);
+		}
+
+		grp++;
+	}
+
+	return -ENOTSUPP;
+}
+
+static void jhb100_pincfg_pin_vref_set(struct jhb100_pinctrl *sfp, unsigned int pin,
+				       u32 arg)
+{
+	const struct pinvref_reg *vref = &sfp->info->regs->vref;
+	u32 grp = 0, i;
+
+	while (grp < vref->num_pv) {
+		for (i = 0; i < vref->pv_desc[grp].num_pins; i++) {
+			if (pin != vref->pv_desc[grp].pin_grp[i])
+				continue;
+
+			arg = jhb100_pincfg_vref_to_reg(arg);
+
+			if (!(vref->pv_desc[grp].range & BIT(arg)))
+				return;
+
+			guard(raw_spinlock_irqsave)(&sfp->lock);
+			writel(arg, sfp->base + vref->reg + grp * 4);
+			return;
+		}
+
+		grp++;
+	}
+}
+
+static int jhb100_pinconf_get(struct pinctrl_dev *pctldev,
+			      unsigned int pin, unsigned long *config)
+{
+	struct jhb100_pinctrl *sfp = pinctrl_dev_get_drvdata(pctldev);
+	int param = pinconf_to_config_param(*config);
+	const struct config_reg_layout_desc *crl_desc;
+	unsigned int padcfg_base, offset;
+	bool enabled = false;
+	u32 padcfg, arg;
+	int ret;
+
+	padcfg_base = sfp->info->regs->config;
+	offset = 4 * pin;
+
+	if (pin >= sfp->npins)
+		return -EINVAL;
+
+	padcfg = readl_relaxed(sfp->base + padcfg_base + offset);
+
+	crl_desc = get_crl_desc_by_pin(sfp, pin);
+	if (!crl_desc) {
+		dev_err(sfp->dev, "pin %d can't not found reg layout descriptor\n", pin);
+		return -EINVAL;
+	}
+
+	switch (param) {
+	case PIN_CONFIG_BIAS_DISABLE:
+		arg = 0;
+
+		if (!RL_DESC_SUPPORTED(crl_desc, PAD_CFG_PULL_DOWN) ||
+		    !RL_DESC_SUPPORTED(crl_desc, PAD_CFG_PULL_UP))
+			return -ENOTSUPP;
+
+		enabled = !(padcfg & (RL_DESC_GENMASK(crl_desc, PAD_CFG_PULL_DOWN) |
+				      RL_DESC_GENMASK(crl_desc, PAD_CFG_PULL_UP)));
+		break;
+	case PIN_CONFIG_BIAS_PULL_DOWN:
+		arg = 1;
+
+		if (!RL_DESC_SUPPORTED(crl_desc, PAD_CFG_PULL_DOWN))
+			return -ENOTSUPP;
+
+		enabled = (padcfg & RL_DESC_GENMASK(crl_desc, PAD_CFG_PULL_DOWN))
+			  >> RL_DESC_SHIFT(crl_desc, PAD_CFG_PULL_DOWN);
+		break;
+	case PIN_CONFIG_BIAS_PULL_UP:
+		if (!RL_DESC_SUPPORTED(crl_desc, PAD_CFG_PULL_UP) &&
+		    !RL_DESC_SUPPORTED(crl_desc, PAD_CFG_OPEN_DRAIN_PULL_UP_SEL))
+			return -ENOTSUPP;
+
+		if (RL_DESC_SUPPORTED(crl_desc, PAD_CFG_PULL_UP)) {
+			arg = (padcfg & RL_DESC_GENMASK(crl_desc, PAD_CFG_PULL_UP)) >>
+			      RL_DESC_SHIFT(crl_desc, PAD_CFG_PULL_UP);
+
+			enabled = arg ? true : false;
+		}
+
+		if (!enabled && RL_DESC_SUPPORTED(crl_desc, PAD_CFG_OPEN_DRAIN_PULL_UP_SEL)) {
+			enabled = true;
+
+			arg = (padcfg &
+			       RL_DESC_GENMASK(crl_desc, PAD_CFG_OPEN_DRAIN_PULL_UP_SEL)) >>
+			       RL_DESC_SHIFT(crl_desc, PAD_CFG_OPEN_DRAIN_PULL_UP_SEL);
+
+			if (arg == JHB100_I2C_OPEN_DRAIN_PU_600_OHMS)
+				arg = 600;
+			else if (arg == JHB100_I2C_OPEN_DRAIN_PU_900_OHMS)
+				arg = 900;
+			else if (arg == JHB100_I2C_OPEN_DRAIN_PU_1200_OHMS)
+				arg = 1200;
+			else if (arg == JHB100_I2C_OPEN_DRAIN_PU_2000_OHMS)
+				arg = 2000;
+			else
+				return -ENOTSUPP;
+		}
+
+		break;
+	case PIN_CONFIG_DRIVE_STRENGTH:
+		if (RL_DESC_SUPPORTED(crl_desc, PAD_CFG_DRIVE_STRENGTH_2BIT)) {
+			enabled = true;
+
+			arg = (padcfg & RL_DESC_GENMASK(crl_desc, PAD_CFG_DRIVE_STRENGTH_2BIT)) >>
+			      RL_DESC_SHIFT(crl_desc, PAD_CFG_DRIVE_STRENGTH_2BIT);
+			arg = jhb100_padcfg_ds_to_mA(arg);
+		} else if (RL_DESC_SUPPORTED(crl_desc, PAD_CFG_DRIVE_STRENGTH_3BIT)) {
+			enabled = true;
+
+			arg = (padcfg & RL_DESC_GENMASK(crl_desc, PAD_CFG_DRIVE_STRENGTH_3BIT)) >>
+			      RL_DESC_SHIFT(crl_desc, PAD_CFG_DRIVE_STRENGTH_3BIT);
+			arg = jhb100_padcfg_ds_to_mA_3bit(arg);
+		} else {
+			return -ENOTSUPP;
+		}
+		break;
+	case PIN_CONFIG_DRIVE_STRENGTH_UA:
+		if (RL_DESC_SUPPORTED(crl_desc, PAD_CFG_DRIVE_STRENGTH_2BIT)) {
+			enabled = true;
+
+			arg = (padcfg & RL_DESC_GENMASK(crl_desc, PAD_CFG_DRIVE_STRENGTH_2BIT)) >>
+			      RL_DESC_SHIFT(crl_desc, PAD_CFG_DRIVE_STRENGTH_2BIT);
+			arg = jhb100_padcfg_ds_to_uA(arg);
+		} else if (RL_DESC_SUPPORTED(crl_desc, PAD_CFG_DRIVE_STRENGTH_3BIT)) {
+			enabled = true;
+
+			arg = (padcfg & RL_DESC_GENMASK(crl_desc, PAD_CFG_DRIVE_STRENGTH_3BIT)) >>
+			      RL_DESC_SHIFT(crl_desc, PAD_CFG_DRIVE_STRENGTH_3BIT);
+			arg = jhb100_padcfg_ds_to_uA_3bit(arg);
+		} else {
+			return -ENOTSUPP;
+		}
+		break;
+	case PIN_CONFIG_INPUT_ENABLE:
+		if (!RL_DESC_SUPPORTED(crl_desc, PAD_CFG_INPUT_ENABLE))
+			return -ENOTSUPP;
+
+		enabled = (padcfg & RL_DESC_GENMASK(crl_desc, PAD_CFG_INPUT_ENABLE))
+			   >> RL_DESC_SHIFT(crl_desc, PAD_CFG_INPUT_ENABLE);
+		arg = enabled;
+		break;
+	case PIN_CONFIG_INPUT_SCHMITT_ENABLE:
+		if (!RL_DESC_SUPPORTED(crl_desc, PAD_CFG_SCHMITT_TRIGGER_SELECT))
+			return -ENOTSUPP;
+
+		enabled = (padcfg & RL_DESC_GENMASK(crl_desc, PAD_CFG_SCHMITT_TRIGGER_SELECT))
+			   >> RL_DESC_SHIFT(crl_desc, PAD_CFG_SCHMITT_TRIGGER_SELECT);
+		arg = enabled;
+		break;
+	case PIN_CONFIG_SLEW_RATE:
+		if (RL_DESC_SUPPORTED(crl_desc, PAD_CFG_SLEW_RATE)) {
+			enabled = true;
+
+			arg = (padcfg & RL_DESC_GENMASK(crl_desc, PAD_CFG_SLEW_RATE)) >>
+			      RL_DESC_SHIFT(crl_desc, PAD_CFG_SLEW_RATE);
+		} else if (RL_DESC_SUPPORTED(crl_desc, PAD_CFG_MODE_SELECT)) {
+			enabled = true;
+
+			arg = (padcfg & RL_DESC_GENMASK(crl_desc, PAD_CFG_MODE_SELECT)) >>
+			      RL_DESC_SHIFT(crl_desc, PAD_CFG_MODE_SELECT);
+
+			if (arg == JHB100_LEGACY_FAST_MODE_PLUS)
+				arg = 1;
+			else if (arg == JHB100_LEGACY_FAST_MODE)
+				arg = 0;
+			else
+				return -ENOTSUPP;
+		} else {
+			return -ENOTSUPP;
+		}
+		break;
+	case PIN_CONFIG_DRIVE_PUSH_PULL:
+		if (!RL_DESC_SUPPORTED(crl_desc, PAD_CFG_MODE_SELECT))
+			return -ENOTSUPP;
+
+		arg = (padcfg & RL_DESC_GENMASK(crl_desc, PAD_CFG_MODE_SELECT)) >>
+		      RL_DESC_SHIFT(crl_desc, PAD_CFG_MODE_SELECT);
+
+		if (arg == JHB100_PUSH_PULL)
+			enabled = true;
+
+		break;
+	case PIN_CONFIG_DRIVE_OPEN_DRAIN:
+		if (!RL_DESC_SUPPORTED(crl_desc, PAD_CFG_MODE_SELECT))
+			return -ENOTSUPP;
+
+		arg = (padcfg & RL_DESC_GENMASK(crl_desc, PAD_CFG_MODE_SELECT)) >>
+		      RL_DESC_SHIFT(crl_desc, PAD_CFG_MODE_SELECT);
+
+		if (arg == JHB100_OPEN_DRAIN)
+			enabled = true;
+
+		break;
+	case PIN_CONFIG_INPUT_DEBOUNCE_NS:
+		if (!RL_DESC_SUPPORTED(crl_desc, PAD_CFG_DEBOUNCE_WIDTH))
+			return -ENOTSUPP;
+
+		enabled = true;
+
+		arg = (padcfg & RL_DESC_GENMASK(crl_desc, PAD_CFG_DEBOUNCE_WIDTH)) >>
+		      RL_DESC_SHIFT(crl_desc, PAD_CFG_DEBOUNCE_WIDTH);
+
+		arg *= JHB100_DEBOUNCE_WIDTH_STAGE_NS;
+
+		break;
+	case PIN_CONFIG_POWER_SOURCE:
+		if (!sfp->info->regs->vref.num_pv)
+			return -ENOTSUPP;
+
+		ret = jhb100_pincfg_pin_vref_get(sfp, pin);
+		if (ret < 0)
+			return ret;
+
+		arg = ret;
+		enabled = true;
+
+		break;
+	default:
+		return -ENOTSUPP;
+	}
+
+	*config = pinconf_to_config_packed(param, arg);
+	return enabled ? 0 : -EINVAL;
+}
+
+static int jhb100_pinconf_set(struct pinctrl_dev *pctldev,
+			      unsigned int pin, unsigned long *configs,
+			      unsigned int num_configs)
+{
+	struct jhb100_pinctrl *sfp = pinctrl_dev_get_drvdata(pctldev);
+	const struct config_reg_layout_desc *crl_desc;
+	bool vref_set = false;
+	u32 value = 0;
+	u32 mask = 0;
+	u32 vref = 0;
+	int i;
+
+	crl_desc = get_crl_desc_by_pin(sfp, pin);
+	if (!crl_desc) {
+		dev_err(sfp->dev, "pin %d can't not found reg layout descriptor\n", pin);
+		return -EINVAL;
+	}
+
+	for (i = 0; i < num_configs; i++) {
+		int param = pinconf_to_config_param(configs[i]);
+		u32 arg = pinconf_to_config_argument(configs[i]);
+
+		switch (param) {
+		case PIN_CONFIG_BIAS_DISABLE:
+			if (!RL_DESC_SUPPORTED(crl_desc, PAD_CFG_PULL_DOWN) ||
+			    !RL_DESC_SUPPORTED(crl_desc, PAD_CFG_PULL_UP))
+				return -ENOTSUPP;
+
+			mask |= RL_DESC_GENMASK(crl_desc, PAD_CFG_PULL_DOWN) |
+				RL_DESC_GENMASK(crl_desc, PAD_CFG_PULL_UP);
+			value &= ~(RL_DESC_GENMASK(crl_desc, PAD_CFG_PULL_DOWN) |
+				   RL_DESC_GENMASK(crl_desc, PAD_CFG_PULL_UP));
+			break;
+		case PIN_CONFIG_BIAS_PULL_DOWN:
+			if (!arg || !RL_DESC_SUPPORTED(crl_desc, PAD_CFG_PULL_DOWN) ||
+			    !RL_DESC_SUPPORTED(crl_desc, PAD_CFG_PULL_UP))
+				return -ENOTSUPP;
+
+			mask |= RL_DESC_GENMASK(crl_desc, PAD_CFG_PULL_DOWN) |
+				RL_DESC_GENMASK(crl_desc, PAD_CFG_PULL_UP);
+			value &= ~(RL_DESC_GENMASK(crl_desc, PAD_CFG_PULL_DOWN) |
+				   RL_DESC_GENMASK(crl_desc, PAD_CFG_PULL_UP));
+			value |= RL_DESC_GENMASK(crl_desc, PAD_CFG_PULL_DOWN);
+			break;
+		case PIN_CONFIG_BIAS_PULL_UP:
+			if ((!arg || arg == 1) && RL_DESC_SUPPORTED(crl_desc, PAD_CFG_PULL_UP)) {
+				mask |= RL_DESC_GENMASK(crl_desc, PAD_CFG_PULL_DOWN) |
+					RL_DESC_GENMASK(crl_desc, PAD_CFG_PULL_UP);
+				value &= ~(RL_DESC_GENMASK(crl_desc, PAD_CFG_PULL_DOWN) |
+					RL_DESC_GENMASK(crl_desc, PAD_CFG_PULL_UP));
+				value |= RL_DESC_GENMASK(crl_desc, PAD_CFG_PULL_UP);
+			} else if (arg &&
+				   RL_DESC_SUPPORTED(crl_desc, PAD_CFG_OPEN_DRAIN_PULL_UP_SEL)) {
+				mask |= RL_DESC_GENMASK(crl_desc,
+							PAD_CFG_OPEN_DRAIN_PULL_UP_SEL);
+				value &= ~RL_DESC_GENMASK(crl_desc,
+							  PAD_CFG_OPEN_DRAIN_PULL_UP_SEL);
+				switch (arg) {
+				case 600:
+					value |= JHB100_I2C_OPEN_DRAIN_PU_600_OHMS <<
+						 RL_DESC_SHIFT(crl_desc,
+							       PAD_CFG_OPEN_DRAIN_PULL_UP_SEL);
+					break;
+				case 900:
+					value |= JHB100_I2C_OPEN_DRAIN_PU_900_OHMS <<
+						 RL_DESC_SHIFT(crl_desc,
+							       PAD_CFG_OPEN_DRAIN_PULL_UP_SEL);
+					break;
+				case 1200:
+					value |= JHB100_I2C_OPEN_DRAIN_PU_1200_OHMS <<
+						 RL_DESC_SHIFT(crl_desc,
+							       PAD_CFG_OPEN_DRAIN_PULL_UP_SEL);
+					break;
+				case 2000:
+					value |= JHB100_I2C_OPEN_DRAIN_PU_2000_OHMS <<
+						 RL_DESC_SHIFT(crl_desc,
+							       PAD_CFG_OPEN_DRAIN_PULL_UP_SEL);
+					break;
+				default:
+					return -ENOTSUPP;
+				}
+			} else {
+				return -ENOTSUPP;
+			}
+			break;
+		case PIN_CONFIG_DRIVE_STRENGTH:
+			if (RL_DESC_SUPPORTED(crl_desc, PAD_CFG_DRIVE_STRENGTH_2BIT)) {
+				mask |= RL_DESC_GENMASK(crl_desc, PAD_CFG_DRIVE_STRENGTH_2BIT);
+				value &= ~RL_DESC_GENMASK(crl_desc, PAD_CFG_DRIVE_STRENGTH_2BIT);
+				value |= jhb100_padcfg_ds_from_mA(arg) <<
+					 RL_DESC_SHIFT(crl_desc, PAD_CFG_DRIVE_STRENGTH_2BIT);
+			} else if (RL_DESC_SUPPORTED(crl_desc, PAD_CFG_DRIVE_STRENGTH_3BIT)) {
+				mask |= RL_DESC_GENMASK(crl_desc, PAD_CFG_DRIVE_STRENGTH_3BIT);
+				value &= ~RL_DESC_GENMASK(crl_desc, PAD_CFG_DRIVE_STRENGTH_3BIT);
+				value |= jhb100_padcfg_ds_from_mA_3bit(arg) <<
+					 RL_DESC_SHIFT(crl_desc, PAD_CFG_DRIVE_STRENGTH_3BIT);
+			} else {
+				return -ENOTSUPP;
+			}
+			break;
+		case PIN_CONFIG_DRIVE_STRENGTH_UA:
+			if (RL_DESC_SUPPORTED(crl_desc, PAD_CFG_DRIVE_STRENGTH_2BIT)) {
+				mask |= RL_DESC_GENMASK(crl_desc, PAD_CFG_DRIVE_STRENGTH_2BIT);
+				value &= ~RL_DESC_GENMASK(crl_desc, PAD_CFG_DRIVE_STRENGTH_2BIT);
+				value |= jhb100_padcfg_ds_from_uA(arg) <<
+					 RL_DESC_SHIFT(crl_desc, PAD_CFG_DRIVE_STRENGTH_2BIT);
+			} else if (RL_DESC_SUPPORTED(crl_desc, PAD_CFG_DRIVE_STRENGTH_3BIT)) {
+				mask |= RL_DESC_GENMASK(crl_desc, PAD_CFG_DRIVE_STRENGTH_3BIT);
+				value &= ~RL_DESC_GENMASK(crl_desc, PAD_CFG_DRIVE_STRENGTH_3BIT);
+				value |= jhb100_padcfg_ds_from_uA_3bit(arg) <<
+					 RL_DESC_SHIFT(crl_desc, PAD_CFG_DRIVE_STRENGTH_3BIT);
+			} else {
+				return -ENOTSUPP;
+			}
+			break;
+		case PIN_CONFIG_INPUT_ENABLE:
+			if (!RL_DESC_SUPPORTED(crl_desc, PAD_CFG_INPUT_ENABLE))
+				return -ENOTSUPP;
+
+			mask |= RL_DESC_GENMASK(crl_desc, PAD_CFG_INPUT_ENABLE);
+			value = arg ? (value | RL_DESC_GENMASK(crl_desc, PAD_CFG_INPUT_ENABLE))
+				: value;
+			break;
+		case PIN_CONFIG_INPUT_SCHMITT_ENABLE:
+			if (!RL_DESC_SUPPORTED(crl_desc, PAD_CFG_SCHMITT_TRIGGER_SELECT))
+				return -ENOTSUPP;
+
+			mask |= RL_DESC_GENMASK(crl_desc, PAD_CFG_SCHMITT_TRIGGER_SELECT);
+			value = arg ?
+				(value | RL_DESC_GENMASK(crl_desc, PAD_CFG_SCHMITT_TRIGGER_SELECT))
+				: value;
+			break;
+		case PIN_CONFIG_SLEW_RATE:
+			if (RL_DESC_SUPPORTED(crl_desc, PAD_CFG_SLEW_RATE)) {
+				mask |= RL_DESC_GENMASK(crl_desc, PAD_CFG_SLEW_RATE);
+				value = arg ?
+					(value | RL_DESC_GENMASK(crl_desc, PAD_CFG_SLEW_RATE)) :
+					value;
+			} else if (RL_DESC_SUPPORTED(crl_desc, PAD_CFG_MODE_SELECT)) {
+				mask |= RL_DESC_GENMASK(crl_desc, PAD_CFG_MODE_SELECT);
+				value &= ~RL_DESC_GENMASK(crl_desc, PAD_CFG_MODE_SELECT);
+				value |= arg ?
+					 JHB100_LEGACY_FAST_MODE_PLUS <<
+					 RL_DESC_SHIFT(crl_desc, PAD_CFG_MODE_SELECT) :
+					 JHB100_LEGACY_FAST_MODE <<
+					 RL_DESC_SHIFT(crl_desc, PAD_CFG_MODE_SELECT);
+			} else {
+				return -ENOTSUPP;
+			}
+			break;
+		case PIN_CONFIG_DRIVE_PUSH_PULL:
+			if (!RL_DESC_SUPPORTED(crl_desc, PAD_CFG_MODE_SELECT))
+				return -ENOTSUPP;
+
+			mask |= RL_DESC_GENMASK(crl_desc, PAD_CFG_MODE_SELECT);
+			value &= ~RL_DESC_GENMASK(crl_desc, PAD_CFG_MODE_SELECT);
+			value |= JHB100_PUSH_PULL <<
+				 RL_DESC_SHIFT(crl_desc, PAD_CFG_MODE_SELECT);
+			break;
+		case PIN_CONFIG_DRIVE_OPEN_DRAIN:
+			if (!RL_DESC_SUPPORTED(crl_desc, PAD_CFG_MODE_SELECT))
+				return -ENOTSUPP;
+
+			mask |= RL_DESC_GENMASK(crl_desc, PAD_CFG_MODE_SELECT);
+			value &= ~RL_DESC_GENMASK(crl_desc, PAD_CFG_MODE_SELECT);
+			value |= JHB100_OPEN_DRAIN <<
+				 RL_DESC_SHIFT(crl_desc, PAD_CFG_MODE_SELECT);
+			break;
+		case PIN_CONFIG_INPUT_DEBOUNCE_NS: {
+			u32 debounce_stage;
+
+			if (!RL_DESC_SUPPORTED(crl_desc, PAD_CFG_DEBOUNCE_WIDTH))
+				return -ENOTSUPP;
+
+			mask |= RL_DESC_GENMASK(crl_desc, PAD_CFG_DEBOUNCE_WIDTH);
+			value &= ~RL_DESC_GENMASK(crl_desc, PAD_CFG_DEBOUNCE_WIDTH);
+
+			debounce_stage = arg ? arg / JHB100_DEBOUNCE_WIDTH_STAGE_NS : 0;
+			debounce_stage = umin(debounce_stage, JHB100_DEBOUNCE_WIDTH_STAGES_MAX);
+
+			value |= (debounce_stage <<
+				  RL_DESC_SHIFT(crl_desc, PAD_CFG_DEBOUNCE_WIDTH));
+
+			break;
+		};
+		case PIN_CONFIG_POWER_SOURCE:
+			if (!sfp->info->regs->vref.num_pv &&
+			    !RL_DESC_SUPPORTED(crl_desc, PAD_CFG_VSEL))
+				return -ENOTSUPP;
+
+			if (sfp->info->regs->vref.num_pv) {
+				vref_set = true;
+				vref = arg;
+			}
+
+			if (RL_DESC_SUPPORTED(crl_desc, PAD_CFG_VSEL)) {
+				mask |= RL_DESC_GENMASK(crl_desc, PAD_CFG_VSEL);
+				value &= ~RL_DESC_GENMASK(crl_desc, PAD_CFG_VSEL);
+
+				value |= jhb100_padcfg_vsel_to_reg(arg) <<
+					 RL_DESC_SHIFT(crl_desc, PAD_CFG_VSEL);
+			}
+			break;
+		default:
+			return -ENOTSUPP;
+		}
+	}
+
+	jhb100_padcfg_rmw(sfp, pin, mask, value);
+
+	if (vref_set)
+		jhb100_pincfg_pin_vref_set(sfp, pin, vref);
+
+	return 0;
+}
+
+static int jhb100_pinconf_group_get(struct pinctrl_dev *pctldev,
+				    unsigned int gsel,
+				    unsigned long *config)
+{
+	const struct group_desc *group;
+
+	group = pinctrl_generic_get_group(pctldev, gsel);
+	if (!group)
+		return -EINVAL;
+
+	return jhb100_pinconf_get(pctldev, group->grp.pins[0], config);
+}
+
+static int jhb100_pinconf_group_set(struct pinctrl_dev *pctldev,
+				    unsigned int gsel,
+				    unsigned long *configs,
+				    unsigned int num_configs)
+{
+	const struct group_desc *group;
+	int ret;
+	u32 i;
+
+	group = pinctrl_generic_get_group(pctldev, gsel);
+	if (!group)
+		return -EINVAL;
+
+	for (i = 0; i < group->grp.npins; i++) {
+		ret = jhb100_pinconf_set(pctldev, group->grp.pins[i], configs, num_configs);
+		if (ret) {
+			dev_err(pctldev->dev, "failed to set config for pin %d\n",
+				group->grp.pins[i]);
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
+static const struct pinconf_ops jhb100_pinconf_ops = {
+	.pin_config_get		= jhb100_pinconf_get,
+	.pin_config_set		= jhb100_pinconf_set,
+	.pin_config_group_get	= jhb100_pinconf_group_get,
+	.pin_config_group_set	= jhb100_pinconf_group_set,
+	.is_generic		= true,
+};
+
+static int jhb100_gpio_get_direction(struct gpio_chip *gc,
+				     unsigned int gpio)
+{
+	struct jhb100_gpio_bank *bank = jhb100_gc_to_bank(gc);
+	struct jhb100_pinctrl *sfp = gpiochip_get_data(gc);
+	const struct jhb100_pinctrl_domain_info *info = sfp->info;
+	unsigned int offset = 4 * bank->id;
+	u32 doen;
+	void __iomem *reg_gpio_oen;
+
+	reg_gpio_oen = sfp->base + info->regs->output_en + offset;
+
+	doen = (readl_relaxed(reg_gpio_oen) & BIT(gpio)) >> gpio;
+
+	return doen == GPOEN_ENABLE ? GPIO_LINE_DIRECTION_OUT : GPIO_LINE_DIRECTION_IN;
+}
+
+static int jhb100_pinctrl_gpio_direction_output(struct gpio_chip *chip,
+						unsigned int offset, int value)
+{
+	if (chip->set)
+		chip->set(chip, offset, value);
+
+	return pinctrl_gpio_direction_output(chip, offset);
+}
+
+static void jhb100_irq_ack(struct irq_data *d)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct jhb100_gpio_bank *bank = jhb100_gc_to_bank(gc);
+	struct jhb100_pinctrl *sfp = gpiochip_get_data(gc);
+	const struct starfive_pinctrl_regs *pinctrl_regs = sfp->info->regs;
+	irq_hw_number_t gpio = irqd_to_hwirq(d);
+	unsigned int offset = 4 * bank->id;
+	void __iomem *ic;
+	u32 value;
+	u32 mask;
+
+	ic = sfp->base + pinctrl_regs->irq_clr + offset;
+	mask = BIT(gpio);
+
+	guard(raw_spinlock_irqsave)(&sfp->lock);
+
+	value = readl_relaxed(ic) & ~mask;
+	writel_relaxed(value | mask, ic);
+	value = readl_relaxed(ic) & ~mask;
+	writel_relaxed(value, ic);
+}
+
+static void jhb100_irq_mask(struct irq_data *d)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct jhb100_gpio_bank *bank = jhb100_gc_to_bank(gc);
+	struct jhb100_pinctrl *sfp = gpiochip_get_data(gc);
+	const struct starfive_pinctrl_regs *pinctrl_regs = sfp->info->regs;
+	irq_hw_number_t gpio = irqd_to_hwirq(d);
+	unsigned int offset = 4 * bank->id;
+	void __iomem *ien;
+	u32 value;
+	u32 mask;
+
+	ien = sfp->base + pinctrl_regs->irq_en + offset;
+	mask = BIT(gpio);
+
+	guard(raw_spinlock_irqsave)(&sfp->lock);
+
+	value = readl_relaxed(ien) & ~mask;
+	writel_relaxed(value, ien);
+
+	gpiochip_disable_irq(gc, d->hwirq);
+}
+
+static void jhb100_irq_mask_ack(struct irq_data *d)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct jhb100_gpio_bank *bank = jhb100_gc_to_bank(gc);
+	struct jhb100_pinctrl *sfp = gpiochip_get_data(gc);
+	const struct starfive_pinctrl_regs *pinctrl_regs = sfp->info->regs;
+	irq_hw_number_t gpio = irqd_to_hwirq(d);
+	unsigned int offset = 4 * bank->id;
+	void __iomem *ien;
+	void __iomem *ic;
+	u32 value;
+	u32 mask;
+
+	ien = sfp->base + pinctrl_regs->irq_en + offset;
+	ic = sfp->base + pinctrl_regs->irq_clr + offset;
+	mask = BIT(gpio);
+
+	guard(raw_spinlock_irqsave)(&sfp->lock);
+
+	value = readl_relaxed(ien) & ~mask;
+	writel_relaxed(value, ien);
+
+	value = readl_relaxed(ic) & ~mask;
+	writel_relaxed(value | mask, ic);
+	value = readl_relaxed(ic) & ~mask;
+	writel_relaxed(value, ic);
+}
+
+static void jhb100_irq_unmask(struct irq_data *d)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct jhb100_gpio_bank *bank = jhb100_gc_to_bank(gc);
+	struct jhb100_pinctrl *sfp = gpiochip_get_data(gc);
+	const struct starfive_pinctrl_regs *pinctrl_regs = sfp->info->regs;
+	irq_hw_number_t gpio = irqd_to_hwirq(d);
+	unsigned int offset = 4 * bank->id;
+	void __iomem *ien;
+	u32 value;
+	u32 mask;
+
+	ien = sfp->base + pinctrl_regs->irq_en + offset;
+	mask = BIT(gpio);
+
+	gpiochip_enable_irq(gc, d->hwirq);
+
+	guard(raw_spinlock_irqsave)(&sfp->lock);
+
+	value = readl_relaxed(ien) | mask;
+	writel_relaxed(value, ien);
+}
+
+static int jhb100_irq_set_type(struct irq_data *d, unsigned int trigger)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct jhb100_gpio_bank *bank = jhb100_gc_to_bank(gc);
+	struct jhb100_pinctrl *sfp = gpiochip_get_data(gc);
+	const struct starfive_pinctrl_regs *pinctrl_regs = sfp->info->regs;
+	irq_hw_number_t gpio = irqd_to_hwirq(d);
+	unsigned int offset = 4 * bank->id;
+	void __iomem *base;
+	u32 irq_type, edge_both, polarity, mask;
+
+	base = sfp->base + offset;
+	mask = BIT(gpio);
+
+	switch (trigger) {
+	case IRQ_TYPE_EDGE_RISING:
+		irq_type  = mask; /* 1: edge triggered */
+		edge_both = 0;    /* 0: single edge */
+		polarity  = mask; /* 1: rising edge */
+		break;
+	case IRQ_TYPE_EDGE_FALLING:
+		irq_type  = mask; /* 1: edge triggered */
+		edge_both = 0;    /* 0: single edge */
+		polarity  = 0;    /* 0: falling edge */
+		break;
+	case IRQ_TYPE_EDGE_BOTH:
+		irq_type  = mask; /* 1: edge triggered */
+		edge_both = mask; /* 1: both edges */
+		polarity  = 0;    /* 0: ignored */
+		break;
+	case IRQ_TYPE_LEVEL_HIGH:
+		irq_type  = 0;    /* 0: level triggered */
+		edge_both = 0;    /* 0: ignored */
+		polarity  = mask; /* 1: high level */
+		break;
+	case IRQ_TYPE_LEVEL_LOW:
+		irq_type  = 0;    /* 0: level triggered */
+		edge_both = 0;    /* 0: ignored */
+		polarity  = 0;    /* 0: low level */
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	if (trigger & IRQ_TYPE_EDGE_BOTH)
+		irq_set_handler_locked(d, handle_edge_irq);
+	else
+		irq_set_handler_locked(d, handle_level_irq);
+
+	guard(raw_spinlock_irqsave)(&sfp->lock);
+
+	irq_type |= readl_relaxed(base + pinctrl_regs->irq_trigger) & ~mask;
+	writel_relaxed(irq_type, base + pinctrl_regs->irq_trigger);
+
+	edge_both |= readl_relaxed(base + pinctrl_regs->irq_both_edge) & ~mask;
+	writel_relaxed(edge_both, base + pinctrl_regs->irq_both_edge);
+
+	if (irq_type & mask) { /* edge polarity */
+		polarity |= readl_relaxed(base + pinctrl_regs->irq_edge) & ~mask;
+		writel_relaxed(polarity, base + pinctrl_regs->irq_edge);
+	} else { /* level polarity */
+		polarity |= readl_relaxed(base + pinctrl_regs->irq_level) & ~mask;
+		writel_relaxed(polarity, base + pinctrl_regs->irq_level);
+	}
+
+	return 0;
+}
+
+static int jhb100_irq_set_wake(struct irq_data *d, unsigned int enable)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct jhb100_pinctrl *sfp = gpiochip_get_data(gc);
+	int ret;
+
+	if (enable)
+		ret = enable_irq_wake(sfp->irq);
+	else
+		ret = disable_irq_wake(sfp->irq);
+	if (ret)
+		dev_err(sfp->dev, "failed to %s wake-up interrupt\n",
+			enable ? "enable" : "disable");
+
+	return ret;
+}
+
+static void jhb100_irq_print_chip(struct irq_data *d, struct seq_file *p)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct jhb100_gpio_bank *bank = jhb100_gc_to_bank(gc);
+
+	seq_printf(p, "%s-%d", gc->label, bank->id);
+}
+
+static const struct irq_chip jhb100_irq_chip = {
+	.irq_ack        = jhb100_irq_ack,
+	.irq_mask       = jhb100_irq_mask,
+	.irq_mask_ack   = jhb100_irq_mask_ack,
+	.irq_unmask     = jhb100_irq_unmask,
+	.irq_set_type   = jhb100_irq_set_type,
+	.irq_set_wake   = jhb100_irq_set_wake,
+	.irq_print_chip = jhb100_irq_print_chip,
+	.flags          = IRQCHIP_SET_TYPE_MASKED |
+			  IRQCHIP_IMMUTABLE |
+			  IRQCHIP_ENABLE_WAKEUP_ON_SUSPEND |
+			  IRQCHIP_MASK_ON_SUSPEND,
+	GPIOCHIP_IRQ_RESOURCE_HELPERS,
+};
+
+static irqreturn_t jhb100_gpio_irq_handler(int irq, void *dev_id)
+{
+	struct jhb100_gpio_bank *bank = dev_id;
+	struct gpio_chip *gc = &bank->chip.gc;
+	struct jhb100_pinctrl *sfp = gpiochip_get_data(gc);
+	struct gpio_irq_chip *girq = &gc->irq;
+	const struct starfive_pinctrl_regs *pinctrl_regs = sfp->info->regs;
+	unsigned int irq_status = pinctrl_regs->irq_status + JHB100_BANK_OFFSET(bank->id);
+	unsigned long is;
+	unsigned int gpio;
+
+	is = readl_relaxed(sfp->base + irq_status);
+	if (!is)
+		return IRQ_NONE;
+
+	for_each_set_bit(gpio, &is, gc->ngpio)
+		generic_handle_domain_irq(girq->domain, gpio);
+
+	return IRQ_HANDLED;
+}
+
+static
+struct pinctrl_pin_desc *devm_create_pins_from_pld(struct device *dev,
+						   const struct jhb100_pin_layout_desc *desc,
+						   const char *prefix,
+						   unsigned int *total_pins,
+						   unsigned int *total_gpios,
+						   s8 **gpio_func_sel_arr)
+{
+	struct pinctrl_pin_desc *pins = NULL;
+	unsigned int i, j, ngpios = 0, npins = 0, pin_index = 0;
+	unsigned int same_name_found = 0;
+	s8 *arr;
+
+	if (!dev || !desc || !prefix) {
+		dev_err(dev, "Invalid parameters: desc=%p, prefix=%s\n",
+			desc, prefix);
+		return ERR_PTR(-EINVAL);
+	}
+
+	for (i = 0; desc[i].pin_start != 0xff; i++) {
+		if (!desc[i].pin_cnt) {
+			dev_err(dev, "Invalid pin cnt\n");
+			return ERR_PTR(-EINVAL);
+		}
+
+		npins += desc[i].pin_cnt;
+	}
+
+	if (npins == 0) {
+		dev_err(dev, "No pins defined\n");
+		return ERR_PTR(-EINVAL);
+	}
+
+	dev_dbg(dev, "Total pins to create: %d\n", npins);
+
+	pins = devm_kcalloc(dev, npins, sizeof(*pins), GFP_KERNEL);
+	if (!pins)
+		return ERR_PTR(-ENOMEM);
+
+	arr = devm_kzalloc(dev, npins, GFP_KERNEL);
+	if (!arr)
+		return ERR_PTR(-ENOMEM);
+
+	for (i = 0; desc[i].pin_start != 0xff; i++) {
+		same_name_found = 0;
+
+		for (j = 0; j < i; j++) {
+			if (!strcmp(desc[j].name, desc[i].name)) {
+				same_name_found = 1;
+				break;
+			}
+		}
+
+		for (j = 0; j < desc[i].pin_cnt; j++) {
+			char *name = NULL;
+			int pin_num = desc[i].pin_start + j;
+
+			pins[pin_index].number = pin_num;
+			if (same_name_found) {
+				name = devm_kasprintf(dev, GFP_KERNEL, "%s_%s_%d",
+						      prefix, desc[i].name,
+						      desc[i].pin_start + j);
+			} else {
+				if (desc[i].pin_cnt > 1)
+					name = devm_kasprintf(dev, GFP_KERNEL, "%s_%s_%d",
+							      prefix, desc[i].name, j);
+				else
+					name = devm_kasprintf(dev, GFP_KERNEL, "%s_%s",
+							      prefix, desc[i].name);
+			}
+
+			if (!name) {
+				dev_err(dev, "Failed to allocate pin name for pin %d\n",
+					pin_num);
+				return ERR_PTR(-ENOMEM);
+			}
+
+			if (!strcmp(desc[i].name, "gpio") || desc[i].gpio_func_sel != -1)
+				ngpios++;
+
+			pins[pin_index].name = name;
+			arr[pin_index] = desc[i].gpio_func_sel;
+			pin_index++;
+		}
+	}
+
+	*total_pins = npins;
+	*total_gpios = ngpios;
+	*gpio_func_sel_arr = arr;
+
+	return pins;
+}
+
+static bool starfive_of_node_instance_match(struct gpio_chip *gc, unsigned int i)
+{
+	struct jhb100_pinctrl *sfp = gpiochip_get_data(gc);
+
+	if (i >= sfp->num_banks)
+		return false;
+
+	return (gc == &sfp->banks[i].chip.gc);
+}
+
+static void jhb100_reset_control_assert(void *data)
+{
+	reset_control_assert(data);
+}
+
+int jhb100_pinctrl_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct gpio_irq_chip *girq;
+	const struct jhb100_pinctrl_domain_info *info;
+	struct jhb100_pinctrl *sfp;
+	struct pinctrl_desc *jhb100_pinctrl_desc;
+	const struct starfive_pinctrl_regs *pinctrl_regs;
+	struct reset_control *rst;
+	struct clk *clk;
+	int ret;
+
+	info = of_device_get_match_data(&pdev->dev);
+	if (!info)
+		return -ENODEV;
+
+	pinctrl_regs = info->regs;
+
+	sfp = devm_kzalloc(dev, sizeof(*sfp), GFP_KERNEL);
+	if (!sfp)
+		return -ENOMEM;
+
+	sfp->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(sfp->base))
+		return PTR_ERR(sfp->base);
+
+	clk = devm_clk_get_optional_enabled(dev, NULL);
+	if (IS_ERR(clk))
+		return dev_err_probe(dev, PTR_ERR(clk), "could not get & enable clock\n");
+
+	rst = devm_reset_control_array_get_optional_shared(dev);
+	if (IS_ERR(rst))
+		return dev_err_probe(dev, PTR_ERR(rst), "could not get reset control\n");
+
+	ret = reset_control_deassert(rst);
+	if (ret)
+		return dev_err_probe(dev, ret, "could not deassert reset\n");
+
+	ret = devm_add_action_or_reset(dev, jhb100_reset_control_assert, rst);
+	if (ret)
+		return ret;
+
+	sfp->irq = platform_get_irq(pdev, 0);
+	if (sfp->irq < 0)
+		return sfp->irq;
+
+	sfp->pins = devm_create_pins_from_pld(dev, info->pl_desc, info->name,
+					      &sfp->npins, &sfp->ngpios,
+					      &sfp->gpio_func_sel_arr);
+	if (IS_ERR(sfp->pins))
+		return PTR_ERR(sfp->pins);
+
+	jhb100_pinctrl_desc = devm_kzalloc(&pdev->dev,
+					   sizeof(*jhb100_pinctrl_desc),
+					   GFP_KERNEL);
+	if (!jhb100_pinctrl_desc)
+		return -ENOMEM;
+
+	jhb100_pinctrl_desc->name = dev_name(dev);
+	jhb100_pinctrl_desc->pctlops = &jhb100_pinctrl_ops;
+	jhb100_pinctrl_desc->pmxops = &jhb100_pinmux_ops;
+	jhb100_pinctrl_desc->confops = &jhb100_pinconf_ops;
+	jhb100_pinctrl_desc->owner = THIS_MODULE;
+	jhb100_pinctrl_desc->pins = sfp->pins;
+	jhb100_pinctrl_desc->npins = sfp->npins;
+
+	sfp->info = info;
+	sfp->dev = dev;
+	platform_set_drvdata(pdev, sfp);
+
+	raw_spin_lock_init(&sfp->lock);
+
+	ret = devm_pinctrl_register_and_init(dev, jhb100_pinctrl_desc,
+					     sfp, &sfp->pctl);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "could not register pinctrl driver\n");
+
+	ret = pinctrl_enable(sfp->pctl);
+	if (ret)
+		return ret;
+
+	sfp->num_banks = DIV_ROUND_UP(sfp->ngpios, JHB100_NR_GPIOS_PER_BANK);
+	if (sfp->num_banks > JHB100_MAX_BANKS)
+		return dev_err_probe(dev, -EINVAL,
+				     "%u GPIOs need %u banks, max %d\n",
+				     sfp->ngpios, sfp->num_banks, JHB100_MAX_BANKS);
+
+	for (unsigned int i = 0; i < sfp->num_banks; i++) {
+		struct jhb100_gpio_bank *gb = &sfp->banks[i];
+		struct gpio_generic_chip_config config;
+		struct gpio_chip *gc = &gb->chip.gc;
+		void __iomem *dat, *set;
+		unsigned int remaining;
+
+		dat = sfp->base + pinctrl_regs->gpio_status + JHB100_BANK_OFFSET(i);
+		set = sfp->base + pinctrl_regs->output + JHB100_BANK_OFFSET(i);
+
+		config = (struct gpio_generic_chip_config) {
+			.dev = dev,
+			.sz = 4,
+			.dat = dat,
+			.set = set,
+			.flags = GPIO_GENERIC_UNREADABLE_REG_SET | GPIO_GENERIC_PINCTRL_BACKEND,
+		};
+
+		ret = gpio_generic_chip_init(&gb->chip, &config);
+		if (ret)
+			return dev_err_probe(dev, ret, "failed to init gpio chip\n");
+
+		gb->id = i;
+
+		/*
+		 * JHB100 GPIO domain may not be fully aligned to 32 GPIOs per bank.
+		 * For example, per0 domain has 60 GPIOs, split as:
+		 *   bank0: 32 GPIOs
+		 *   bank1: 28 GPIOs
+		 * Calculate the actual number of GPIOs for the last bank.
+		 */
+
+		remaining = sfp->ngpios - i * JHB100_NR_GPIOS_PER_BANK;
+		gc->ngpio = min(remaining, JHB100_NR_GPIOS_PER_BANK);
+
+		gc->owner = THIS_MODULE;
+		gc->get_direction = jhb100_gpio_get_direction;
+		gc->direction_input = pinctrl_gpio_direction_input;
+		gc->direction_output = jhb100_pinctrl_gpio_direction_output;
+		gc->set_config = gpiochip_generic_config;
+		gc->base = -1;
+		gc->of_gpio_n_cells = 3;
+		gc->of_node_instance_match = starfive_of_node_instance_match;
+
+		girq = &gc->irq;
+		girq->handler = handle_simple_irq;
+
+		gpio_irq_chip_set_chip(girq, &jhb100_irq_chip);
+
+		/* mask all GPIO interrupts */
+		writel_relaxed(0U, sfp->base + pinctrl_regs->irq_en + JHB100_BANK_OFFSET(i));
+		/* clear all interrupts */
+		writel_relaxed(~0U, sfp->base + pinctrl_regs->irq_clr + JHB100_BANK_OFFSET(i));
+		writel_relaxed(0U, sfp->base + pinctrl_regs->irq_clr + JHB100_BANK_OFFSET(i));
+
+		ret = devm_gpiochip_add_data(dev, gc, sfp);
+		if (ret)
+			return dev_err_probe(dev, ret, "could not register gpiochip\n");
+
+		ret = devm_request_irq(dev, sfp->irq, jhb100_gpio_irq_handler, IRQF_SHARED,
+				       gc->label, &sfp->banks[i]);
+		if (ret < 0)
+			return ret;
+	}
+
+	dev_info(dev, "StarFive JHB100 GPIO chip registered %d GPIOs\n",
+		 sfp->ngpios);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(jhb100_pinctrl_probe);
+
+MODULE_DESCRIPTION("Pinctrl driver for the StarFive JHB100 SoC");
+MODULE_AUTHOR("Alex Soo <yuklin.soo@starfivetech.com>");
+MODULE_LICENSE("GPL");
diff --git a/drivers/pinctrl/starfive/pinctrl-starfive-jhb100.h b/drivers/pinctrl/starfive/pinctrl-starfive-jhb100.h
new file mode 100644
index 000000000000..9e2c1658096c
--- /dev/null
+++ b/drivers/pinctrl/starfive/pinctrl-starfive-jhb100.h
@@ -0,0 +1,159 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Pinctrl / GPIO driver for StarFive JHB100 SoC
+ *
+ * Copyright (C) 2024 StarFive Technology Co., Ltd.
+ * Author: Alex Soo <yuklin.soo@starfivetech.com>
+ *
+ */
+
+#ifndef __PINCTRL_STARFIVE_JHB100_H__
+#define __PINCTRL_STARFIVE_JHB100_H__
+
+#include <linux/gpio/driver.h>
+#include <linux/gpio/generic.h>
+#include <linux/pinctrl/pinconf-generic.h>
+#include <linux/pinctrl/pinmux.h>
+
+/* power-source value */
+enum jhb100_pinvref {
+	JHB100_PINVREF_3_3V,
+	JHB100_PINVREF_2_5V,
+	JHB100_PINVREF_1_8V,
+	JHB100_PINVREF_NUM
+};
+
+#define JHB100_MAX_BANKS			2
+
+struct jhb100_pin_layout_desc {
+	unsigned int pin_start;
+	unsigned int pin_cnt;
+	const char *name;
+	s8 gpio_func_sel;
+};
+
+struct jhb100_gpio_bank {
+	struct gpio_generic_chip chip;
+	unsigned int id;
+};
+
+struct jhb100_pinctrl {
+	struct device *dev;
+	struct jhb100_gpio_bank banks[JHB100_MAX_BANKS];
+	unsigned int num_banks;
+	struct pinctrl_gpio_range gpios;
+	raw_spinlock_t lock;
+	const char *iodomain_name;
+	void __iomem *base;
+	struct pinctrl_dev *pctl;
+	/* register read/write mutex */
+	struct mutex mutex;
+	const struct jhb100_pinctrl_domain_info *info;
+	int irq;
+	struct irq_domain *irq_domain;
+	const struct pinctrl_pin_desc *pins;
+	unsigned int npins;
+	unsigned int ngpios;
+	s8 *gpio_func_sel_arr;
+};
+
+struct pinvref_desc {
+	unsigned int range;
+	u32 pin_grp[32];
+	u32 num_pins;
+};
+
+struct pinvref_reg {
+	unsigned int reg;
+	const struct pinvref_desc *pv_desc;
+	u32 num_pv;
+};
+
+struct gpio_irq_reg {
+	unsigned int reg;
+	unsigned int width_per_pin;
+};
+
+struct starfive_pinctrl_regs {
+	struct pinvref_reg vref;
+	struct gpio_irq_reg func_sel;
+	unsigned int config;
+	unsigned int output;
+	unsigned int output_en;
+	unsigned int gpio_status;
+	unsigned int irq_en;
+	unsigned int irq_status;
+	unsigned int irq_clr;
+	unsigned int irq_trigger;
+	unsigned int irq_level;
+	unsigned int irq_both_edge;
+	unsigned int irq_edge;
+};
+
+struct reg_layout_field {
+	unsigned char shift;
+	unsigned char width;
+};
+
+enum jhb100_pad_cfg_field {
+	PAD_CFG_DEBOUNCE_WIDTH,
+	PAD_CFG_DRIVE_STRENGTH_2BIT,
+	PAD_CFG_DRIVE_STRENGTH_3BIT,
+	PAD_CFG_INPUT_ENABLE,
+	PAD_CFG_VSEL,
+	PAD_CFG_MODE_SELECT,
+	PAD_CFG_OPEN_DRAIN_PULL_UP_SEL,
+	PAD_CFG_PULL_DOWN,
+	PAD_CFG_PULL_UP,
+	PAD_CFG_SCHMITT_TRIGGER_SELECT,
+	PAD_CFG_SLEW_RATE,
+	PAD_CFG_COUNT
+};
+
+#define RL_DESC_SUPPORTED(crl_desc, field_enum) ({ \
+	typeof(crl_desc) _desc = (crl_desc); \
+	(_desc && (_desc)->fields[(field_enum)].width > 0); \
+})
+
+#define RL_DESC_SHIFT(crl_desc, field_enum) ({ \
+	typeof(crl_desc) __desc = (crl_desc); \
+	(__desc)->fields[(field_enum)].shift; \
+})
+
+#define RL_DESC_GENMASK(crl_desc, field_enum) ({ \
+	typeof(crl_desc) __desc = (crl_desc); \
+	RL_DESC_SUPPORTED(__desc, field_enum) ? \
+	GENMASK( \
+		(__desc)->fields[(field_enum)].shift + (__desc)->fields[(field_enum)].width - 1, \
+		(__desc)->fields[(field_enum)].shift \
+	) : 0; \
+})
+
+struct config_reg_layout_desc {
+	unsigned int pin_start;
+	unsigned int pin_cnt;
+
+	struct reg_layout_field fields[PAD_CFG_COUNT];
+};
+
+#define JHB100_FUNC_MAPS_MAX_PIN(n)	((n) + 1)
+
+struct jhb100_pinctrl_func_maps {
+	char *func;
+	unsigned char val;
+	u32 max_pin;
+};
+
+struct jhb100_pinctrl_domain_info {
+	const char *name;
+	const struct pinctrl_pin_desc *pins;
+	const struct jhb100_pin_layout_desc *pl_desc;
+	const struct jhb100_pinctrl_func_maps *fmaps;
+	u32 num_maps;
+	const struct config_reg_layout_desc *crl_desc;
+	const struct starfive_pinctrl_regs *regs;
+};
+
+int jhb100_pinctrl_probe(struct platform_device *pdev);
+
+#endif /* __PINCTRL_STARFIVE_JHB100_H__ */
-- 
2.25.1

