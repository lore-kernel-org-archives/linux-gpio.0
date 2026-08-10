Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2112.outbound.protection.partner.outlook.cn [139.219.17.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29327396B96;
	Mon, 10 Aug 2026 06:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786343870; cv=fail; b=YxEwFVKlcwg/9sosEug5PYk9P8UiSFZZbEsB2TVi4UMTdXkz2aG6GoYRFhRIGTo5uLwRoiTbt15eTv/bP+oDMhdVR+kThx+FemzZLyQHzD4A5Z5GE3/O2u+i1hV1wZS2w94Q7MrZ8Jv2uS9VdDp1kTfAvyLcHOOA7Pevto0QB8E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786343870; c=relaxed/simple;
	bh=itre0KOL72dcY9tiSKoJuI7DcI/CnanyaUz6jC4AYnA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=lMDI2ox3+WFLerFyqL2ABZIhdpc9eH8nn5LV5T2dTNGJzq1hlOhgqULfJXMggnNhol9bE8R+z9WhZNLBaN/6XXv+J15Ut73qbeN8XAwaOUlfZ5mTP8bjwfuTWF+/T7vAY/DWq/c2S+KuQ1fzBBbP1ogSI8bVmcymri3FEfZoyIo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YLQ2oqkhkDZSvW0yBhUXmzaX1wCV348Kd0XlJ7DbDXJzWzGjTiSrZLgUnnT5jt/I+/7ENYXHC/kL7fdDuNFhRwKJgZM3TWGoN6DnzMkeO3pGAWxjUivBXMyvt4Fc3dY5f0MiNFTAw9H/Dam/z2S/xGrRaC65PfRXGDhgKlufnYVTA9gB0YzJn54U9d+/F6YLZMReSyOJsD8AQ0tKObLWNqRzOjs89Q0lyUyUs99aNHk0/kHz/SOOAOLsbCGIeQp41tS79woSO1fqq9tuH0COQveVlkRbPP0J6MQlT4ToYo/EYZpaU5luPdv8bIodpJZHkwpv5WzmheFAx1WODuO6aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tjLaF5sazIKS4BMKVCphL3MvX6dXb29/yx4wmrdxWq0=;
 b=BCSHl2YNL2wWXjrB/6e19zSFnaBcEDl4Vk1e017fD2ad2jHrA1E7WMk6C4uxOGJUzDKwvDAldbUByKO8qF85p+jGhlP6rDXzH02ooJ/I5HiJSS98lDPhdusCHKoaI1U9cg7RZwC58vYFjCtUunn4Bnie3LHm8y3UI1ePcQgmBMWgWngAHhofaGC0OrPdZploFFL+xCM1l4jiRnsiqxPSJRxx0+no1VSAXeg6ZhhK4CwbWfQj+2JX+FNiU7h7LAGgiX15acnUbR3b17x3lwU+JY9XQe50DHK3Basn3Zr9y78YbimVfBcd2pqYzFvYLG2OrLX229/Vq23TF8OgzRX/yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1315.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:15::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Mon, 10 Aug
 2026 06:37:19 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0292.024; Mon, 10 Aug 2026 06:37:19 +0000
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
Subject: [PATCH v5 16/21] pinctrl: starfive: Add StarFive JHB100 per2 controller driver
Date: Sun,  9 Aug 2026 23:36:45 -0700
Message-Id: <20260810063650.239303-17-changhuang.liang@starfivetech.com>
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
X-MS-Office365-Filtering-Correlation-Id: 5f8ba305-0de9-4885-17a7-08def6a9d3b2
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|52116014|366016|7416014|56012099006|5023799004|10067099003|6133799003|3023799007|18002099003|22082099003|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	lPF8ON6zCpEgsQ6ie/lg95QyUQf44PYTewwjJLQbcUnd+WtOgucy6gQ24iM+wNJlW+vMZpjihOKZdNq94uUdTKu+HKK15Sg2WwtEGONKVBFRTXB1k6T1MYCAqvkDQ5GlmIa/ywgEFQA7z/ksBDb3ccq+nSsV0rpf7Qq16H71m+yuFmO0WGsnunkGzeZpil57cZjV/xAicK9PqDCzIA4hQO9gS1xGZrMmGarbPEvjmmbYdAwMxhZpXvKh7oSgEnZsyytFuG/2NP/F6HQBlH9seYzaHfnuVDK9wya+K3iQYUMpYOzOyB0WYYT3SA7JBBIuH1Oy2VjruSCphbKQvGkb+Crc8U1MdMrmxSUI3g6eNSuKe/WHOnLpd4TJIIvjSw88+jZa03Tbr661YDHPJ7eqMBfo1ovZUBBFlO1dG3qbxGM33CX8sgNjKKhgjbyNnLTVE5R3NpwS04fZo97hGjdBcN8B7Z7Om/m8EkPCVO04/LjlZA1AWTOo3mPSHirWQRGUX5YZin13BbMqBRUYnDpQ54ikJJksPwMJC2UCAdtz7EVlOIS7JFswj06c7q3iPzWYk4t858e5FLZvl6ysNn62Wg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(52116014)(366016)(7416014)(56012099006)(5023799004)(10067099003)(6133799003)(3023799007)(18002099003)(22082099003)(38350700014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?aUjK7nYaUN4cmlhykiNnJn+n5HDMCu8RDUJxlupqTGYTaCeeQhfA22PfzcZu?=
 =?us-ascii?Q?77iiVClKs7z7y0m8mojoZN6c+WP8td0V5XiMadXacuupztsCHUiHu4dsW26O?=
 =?us-ascii?Q?3xUou6mZWj8TAIMP1yb3jtFnopvxRryLMoq08V4oY493xGLLiZWQ/KIzE+BM?=
 =?us-ascii?Q?ciQ986qr6uKy02xi3juqBKNXzFB2GJNqzLDCCme4eA/w8VPj0FtlL2/dALAO?=
 =?us-ascii?Q?qOudRedq1lxYfd4Rq5Mp5avMOfFd9LKutuVBVTz08ig5joxFpomfwDMfTUt6?=
 =?us-ascii?Q?sxUYbtBC6HjlziJQ86Sx0xrpGgAYoRAkinQqWkp4MRbPbv7kIl5s7JHfe/Jz?=
 =?us-ascii?Q?o7qUY9/AZQNczfct6HSiJGN8TJUNXUsZ9gETA1J2GoRHM/e8JQJ62YJVahPs?=
 =?us-ascii?Q?GxnsF5el4nAsbuznoIhSg3McSr/HDUpcMu5jB9YzuA9ADQ+uowmm6oBBCjAg?=
 =?us-ascii?Q?efAX9CK6/eWRCe2Nytf1mInA2hUG8YmAaxihi6in6iG3byHSDc7xrmbjiErc?=
 =?us-ascii?Q?rQKr5xV8GT7fQq/1HimgKw0M0G2YEgcnOcPYY3QHKDRSKzNL5iNOumOhTIfE?=
 =?us-ascii?Q?9oWsENJQzNLF6D0B8NkdjEVSi7eGy5bfuE1VHf4GJ9pbFQPKiixMdpfIwG7K?=
 =?us-ascii?Q?dgRJrVZgSei/vAkp8KfPjsEpb+hCetwT+D/N8PVrKYvVWjDFHr9DixeJs6+x?=
 =?us-ascii?Q?yGyuXhtT20RPvR7SoxQEUd1OAkiYm8+vtHuzfEyv91X0Z3lo5PPz+rO5OyQj?=
 =?us-ascii?Q?PnqYxm/esxdpdKbVuAGg+Uy5cln+qNzPcJXY1um/WnqnRehvyEsqPQBeK36F?=
 =?us-ascii?Q?qMWIzD8rDXW9cAsDlJc2u7KWT56Fp/SGk0EKNZpGPTJ/VMu7ttZXHzeZNmIg?=
 =?us-ascii?Q?0nKXA2zBLiopq0PbhReBvl2rpGjuTo/HJ2jyOVYqFc5xvbUC8g2Mh6SpCH8Z?=
 =?us-ascii?Q?jMEftPCuy2DEjlQjM9folu0qIfJzmkq0rS4K+gwcwY8dYKUtkhkv6f/a0sJw?=
 =?us-ascii?Q?DnP4oUfnbS18yeM98FaEt1JYDD8Otqpmf/sHZhP8n1/UBf6Ehk0WSmlNU4LG?=
 =?us-ascii?Q?XWgBrT9J64f9PLkyWxLICsdqw+f2fbkQrj2F2dgOvWDgJ/xmOVOzpbvoVK/I?=
 =?us-ascii?Q?NQ5HuVGKXicFbicaBCgEy4IgScc00LjT225vpEjGlH3zlzCah6zf3aJVl3N1?=
 =?us-ascii?Q?8T6VbHRgO8Kl2b33kd1OLTU7WEm03r93gFTxHiwAhS1v5ZRi8jYA08J6Gz1b?=
 =?us-ascii?Q?C9AuYgi2ERIS2XZRPl6IO39YY+a4tBnYsRHEI94alGxkWFGwVD8EhIwb+BDL?=
 =?us-ascii?Q?P/12W5D7Ca75yBaOsV9XBSREPtyXLWRW+LV6W7KUCE3I4BCe5+Ocs0uwee7G?=
 =?us-ascii?Q?CPFnU6JghVpD43wKTkCn8aEZ5QKSRNo67+gFpO3OmcVNw2IR2yzItwPx5AT2?=
 =?us-ascii?Q?fABc/MV1JRDXDk482shk2CD/pAirmWnP3LyPJWh6uQhQuQqPNZmA0xGwyVvw?=
 =?us-ascii?Q?DZK6ncVo8KhtPXFjmZX/vOu/ejzvhENFiyThcGxnB3jWBWFeyn1MYgPyel4U?=
 =?us-ascii?Q?AivOqy19ThoyAi8cGaqVhSz0qvEDmsN9d4aR0+764JcxBJ5d0R462vP72/+t?=
 =?us-ascii?Q?ZLQzWrEjI1qpfKZGELJoQ8k7Qonxu+2Q4ICmHdUifDSGnITgXR1ZZkI9OKUP?=
 =?us-ascii?Q?vb7+6Ao79vbzNEj9lygCeKVajNgYaMpxDAasSLODyijiHRIzpcWfQzkLqPIF?=
 =?us-ascii?Q?gf6CMTTrGRip8k9z9XKT79LNYNjvfMWu4Sr0n2S958AwqOYc8RiY?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f8ba305-0de9-4885-17a7-08def6a9d3b2
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2026 06:37:19.5994
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2PMFLiWYHXwaNa4DB1Sb77Uyw9YGl0DhQRGbCkO+fIW1pEZp1DVM8Ff7z5jzR7tj4JbuFtkxLqpVYcBMtYWGjd+VOch64dgmHa3QMR8PlanrkHA3G995UyoO5S94DPx6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1315

Add pinctrl driver for StarFive JHB100 SoC Peripheral-2(per2) pinctrl
controller.

Co-developed-by: Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
Signed-off-by: Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
Signed-off-by: Alex Soo <yuklin.soo@starfivetech.com>
Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 drivers/pinctrl/starfive/Kconfig              |  11 ++
 drivers/pinctrl/starfive/Makefile             |   1 +
 .../starfive/pinctrl-starfive-jhb100-per2.c   | 123 ++++++++++++++++++
 3 files changed, 135 insertions(+)
 create mode 100644 drivers/pinctrl/starfive/pinctrl-starfive-jhb100-per2.c

diff --git a/drivers/pinctrl/starfive/Kconfig b/drivers/pinctrl/starfive/Kconfig
index 0fe2d21ba402..ad04a7331a86 100644
--- a/drivers/pinctrl/starfive/Kconfig
+++ b/drivers/pinctrl/starfive/Kconfig
@@ -79,6 +79,17 @@ config PINCTRL_STARFIVE_JHB100_PER1
 	  peripherals supporting inputs, outputs, configuring pull-up/pull-down
 	  and interrupts on input changes.
 
+config PINCTRL_STARFIVE_JHB100_PER2
+	tristate "StarFive JHB100 SoC Peripheral-2 pinctrl and GPIO driver"
+	depends on ARCH_STARFIVE || COMPILE_TEST
+	select PINCTRL_STARFIVE_JHB100
+	default ARCH_STARFIVE
+	help
+	  Say yes here to support Peripheral-2 pin control on the StarFive JHB100 SoC.
+	  This also provides an interface to the GPIO pins not used by other
+	  peripherals supporting inputs, outputs, configuring pull-up/pull-down
+	  and interrupts on input changes.
+
 config PINCTRL_STARFIVE_JHB100_SYS0
 	tristate "StarFive JHB100 SoC System-0 pinctrl and GPIO driver"
 	depends on ARCH_STARFIVE || COMPILE_TEST
diff --git a/drivers/pinctrl/starfive/Makefile b/drivers/pinctrl/starfive/Makefile
index 6beef7e313ef..33213bd1919f 100644
--- a/drivers/pinctrl/starfive/Makefile
+++ b/drivers/pinctrl/starfive/Makefile
@@ -9,6 +9,7 @@ obj-$(CONFIG_PINCTRL_STARFIVE_JH7110_AON)	+= pinctrl-starfive-jh7110-aon.o
 obj-$(CONFIG_PINCTRL_STARFIVE_JHB100)		+= pinctrl-starfive-jhb100.o
 obj-$(CONFIG_PINCTRL_STARFIVE_JHB100_PER0)	+= pinctrl-starfive-jhb100-per0.o
 obj-$(CONFIG_PINCTRL_STARFIVE_JHB100_PER1)	+= pinctrl-starfive-jhb100-per1.o
+obj-$(CONFIG_PINCTRL_STARFIVE_JHB100_PER2)	+= pinctrl-starfive-jhb100-per2.o
 obj-$(CONFIG_PINCTRL_STARFIVE_JHB100_SYS0)	+= pinctrl-starfive-jhb100-sys0.o
 obj-$(CONFIG_PINCTRL_STARFIVE_JHB100_SYS0H)	+= pinctrl-starfive-jhb100-sys0h.o
 obj-$(CONFIG_PINCTRL_STARFIVE_JHB100_SYS1)	+= pinctrl-starfive-jhb100-sys1.o
diff --git a/drivers/pinctrl/starfive/pinctrl-starfive-jhb100-per2.c b/drivers/pinctrl/starfive/pinctrl-starfive-jhb100-per2.c
new file mode 100644
index 000000000000..a2cf4995552e
--- /dev/null
+++ b/drivers/pinctrl/starfive/pinctrl-starfive-jhb100-per2.c
@@ -0,0 +1,123 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Pinctrl / GPIO driver for StarFive JHB100 SoC Peripheral-2 domain
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
+static const struct jhb100_pin_layout_desc jhb100_per2_pl_desc[] = {
+	{ .pin_start = 0, .pin_cnt = 15, .name = "gpio", .gpio_func_sel = 0 },
+	{ .pin_start = 15, .pin_cnt = 1, .name = "gpio", .gpio_func_sel = -1 },
+	{ .pin_start = 16, .pin_cnt = 15, .name = "gpio", .gpio_func_sel = 0 },
+	{ 0xff },
+};
+
+static const struct config_reg_layout_desc jhb100_per2_pinctrl_rl_desc[] = {
+	{
+		.pin_start					= 0,
+		.pin_cnt					= 19,
+		.fields[PAD_CFG_DRIVE_STRENGTH_2BIT]		= { .shift = 0, .width = 2 },
+		.fields[PAD_CFG_INPUT_ENABLE]			= { .shift = 2, .width = 1 },
+		.fields[PAD_CFG_PULL_DOWN]			= { .shift = 3, .width = 1 },
+		.fields[PAD_CFG_PULL_UP]			= { .shift = 4, .width = 1 },
+		.fields[PAD_CFG_SLEW_RATE]			= { .shift = 5, .width = 1 },
+		.fields[PAD_CFG_SCHMITT_TRIGGER_SELECT]		= { .shift = 6, .width = 1 },
+		.fields[PAD_CFG_DEBOUNCE_WIDTH]			= { .shift = 15, .width = 17 },
+	},
+	{
+		.pin_start					= 19,
+		.pin_cnt					= 12,
+		.fields[PAD_CFG_INPUT_ENABLE]			= { .shift = 0, .width = 1 },
+		.fields[PAD_CFG_SLEW_RATE]			= { .shift = 1, .width = 1 },
+		.fields[PAD_CFG_VSEL]				= { .shift = 2, .width = 2 },
+		.fields[PAD_CFG_DEBOUNCE_WIDTH]			= { .shift = 15, .width = 17 },
+	},
+	{ 0xff },
+};
+
+static const struct pinvref_desc pinvref_desc_per2[] = {
+	{
+		/* gpionw */
+		.pin_grp = {
+			PADNUM_PER2_GPIO_D19,
+			PADNUM_PER2_GPIO_D20,
+			PADNUM_PER2_GPIO_D21,
+			PADNUM_PER2_GPIO_D22,
+			PADNUM_PER2_GPIO_D23,
+			PADNUM_PER2_GPIO_D24,
+			PADNUM_PER2_GPIO_D25,
+			PADNUM_PER2_GPIO_D26,
+			PADNUM_PER2_GPIO_D27,
+			PADNUM_PER2_GPIO_D28,
+			PADNUM_PER2_GPIO_D29,
+			PADNUM_PER2_GPIO_D30
+		},
+		.num_pins = 12,
+		.range = BIT(JHB100_PINVREF_1_8V) | BIT(JHB100_PINVREF_2_5V) |
+			 BIT(JHB100_PINVREF_3_3V)
+	},
+};
+
+static const struct starfive_pinctrl_regs jhb100_per2_pinctrl_regs = {
+	.vref			= { .reg = 0x00, .pv_desc = pinvref_desc_per2,
+				    .num_pv = ARRAY_SIZE(pinvref_desc_per2) },
+	.func_sel		= { .reg = 0x8c, .width_per_pin = 2 },
+	.config			= 0x04,
+	.output			= 0x80,
+	.output_en		= 0x84,
+	.gpio_status		= 0x88,
+	.irq_en			= 0x94,
+	.irq_status		= 0x98,
+	.irq_clr		= 0x9c,
+	.irq_trigger		= 0xa0,
+	.irq_level		= 0xa4,
+	.irq_both_edge		= 0xa8,
+	.irq_edge		= 0xac,
+};
+
+static const struct jhb100_pinctrl_func_maps jhb100_func_maps_per2[] = {
+	{ .func = "fan_tach",		.val = 1 },
+	{ .func = "gmac_rgmii",		.val = 1 },
+	{ .func = "gmac_rmii",		.val = 2 },
+	{ .func = "gpio",		.val = 0 },
+	{ .func = "host0_port80",	.val = 2 },
+	{ .func = "host1_port80",	.val = 3 },
+};
+
+static const struct jhb100_pinctrl_domain_info jhb100_per2_pinctrl_info = {
+	.name			= "jhb100-per2",
+	.pl_desc		= jhb100_per2_pl_desc,
+	.crl_desc		= jhb100_per2_pinctrl_rl_desc,
+	.regs			= &jhb100_per2_pinctrl_regs,
+	.fmaps			= jhb100_func_maps_per2,
+	.num_maps		= ARRAY_SIZE(jhb100_func_maps_per2),
+};
+
+static const struct of_device_id jhb100_per2_pinctrl_of_match[] = {
+	{
+		.compatible = "starfive,jhb100-per2-pinctrl",
+		.data = &jhb100_per2_pinctrl_info,
+	},
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, jhb100_per2_pinctrl_of_match);
+
+static struct platform_driver jhb100_per2_pinctrl_driver = {
+	.probe = jhb100_pinctrl_probe,
+	.driver = {
+		.name = "starfive-jhb100-per2-pinctrl",
+		.of_match_table = jhb100_per2_pinctrl_of_match,
+	},
+};
+module_platform_driver(jhb100_per2_pinctrl_driver);
+
+MODULE_DESCRIPTION("Pinctrl driver for StarFive JHB100 SoC Peripheral-2 domain");
+MODULE_AUTHOR("Alex Soo <yuklin.soo@starfivetech.com>");
+MODULE_LICENSE("GPL");
-- 
2.25.1

