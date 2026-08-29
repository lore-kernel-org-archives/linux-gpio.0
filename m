Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2127.outbound.protection.partner.outlook.cn [139.219.17.127])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3F0231E82B;
	Sat, 29 Aug 2026 03:32:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.127
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787974325; cv=fail; b=ZMgDoAHLgWJUnsqe+frtLCSj85S3CmOWfs8BSaxW2oMgay9DlBJkDzI56pLtSOV4gE4XbbjFD4UWJDk8QY2tUq9oB8g1odsuDdruHN87C5RHxDAH0UsM4HvGPfjUKWmI+6s4TSwWUTczaQLUx+J8oT+/SD36l6O9CKR5WSsLMP8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787974325; c=relaxed/simple;
	bh=TanqZ9/Dq4JmSQkQb6l8D/QmUVUDmdKTFmI63DQLB8k=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=JrTJB0G87aFbjBMl2qRaXMtbB/SqHO8QTgmSn0oOl56QVcXlF6cIZHlQ7+ACEEa5rZYd640CpZP6fKvL19IWVF6cKyt948C/MvsB8k7X2IfHZnm9PZg8yza/ONhoNNrzA22jdMMz1fSsw6SCjDHxYt4cesh6dYm1uuoN0NbbiMM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.127
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GeaAPqtBvPXXXe5fyEK9c7ck7B143glnTIyJ/DQ4YOQTdhmWLRuoj+xBwalAIHqQLvzZQRlZvDOagqhcP3djQnXOdmaXCKjq7UQWdUbKPAQ+Wv66Fn8lKpWmrZcLR3v/VTyMYNCEGi9LOXzZfhGEKrvS7y3vTK92GmmY38eddwWVpS68+R6NWVrFx8moSfLIsIgA4VNeneOQeDexngagKaVbW9GRzsP+HEvY8olYLnnmmk4z/OntUecuHsDWvmOcvLNla4dp9X7NmHEMx5jFG7xiPR4nA7zsm/Tw5QAIEwie6AiuxJg3driaPC/M3DCqRUVVhQYTjKbryj8EYQdNrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9rGJee3dllZHL1cK6HeTNWOs+9xmiv3s8ZVz+2EypNU=;
 b=Whoobww5wuNrHQzwc35tVyZUUs+79rhG1LnoyLmhp53RRZpqFmGx1lV/3DNUC4S1L9HZQH4sNV3hm5eWUlDYcCVw8j4KNVZf0eITkFykVEFNf+9J5eyukB7zqVc9Aaqc/XueGo4DNUy8kjD8/cas//cteNxjXqtWs1mKlQDOzVFghiq3FwINCx4dqA+bic6yA/l+Gvn6DpEmj0qzkfStrskeil+F0ZlTE05OQuT0GqhD3jVlSYPo0s5jK/vbfvQxhtKuboy4fbIYhLUzprU4zk+yD6o1GjUaoNd3qH50Q9pAOdY3Zdgs4xCKqOwZAQ2OSLk95FwRbVsFIZC213sppg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1153.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:13::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.19; Sat, 29 Aug
 2026 02:57:50 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0315.011; Sat, 29 Aug 2026 02:57:50 +0000
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
Subject: [PATCH v6 12/21] pinctrl: starfive: Add StarFive JHB100 per0 controller driver
Date: Fri, 28 Aug 2026 19:57:11 -0700
Message-Id: <20260829025720.23915-13-changhuang.liang@starfivetech.com>
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
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1153:EE_
X-MS-Office365-Filtering-Correlation-Id: f8e8565e-552f-4335-9334-08df05794fea
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|7416014|376014|52116014|3023799007|18002099003|22082099003|56012099006|5023799004|6133799003|10067099003|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	aYA5atwsJNwAk6+x5hKNHP4Wu7iIpoPkbyxQmrj22S/GcIPm7k5q1ct4ovhNEN21hEbp+Hx43UjeXB9Ym4Df41YGte8HoPR+ap5ZCMIi1Ala1nofb6lEFwR/HohuhjYWbYR6w3471HAmVU7FQ3YpvjPun8BoyYWeoJDtBHGTUPcQfsRCWcTn0yUElnO60BoraOcuqoUqGpO5a2QBOXoUyW71tHwYi0chklJjsfkx5ZHyZpk4hjEM/am4tzmfLqPaiMT/50+tVq6VjJ6SgJ0ocnpOXuxpdnZacFHFPPuKbwqWwWH1OqOByhA65w/CHbyD/gVzzz0iF6NBNFS4QZmtW1Vz5hCy6LXqtD7waWCntajrLdfv48L7ew/u54JDNUo1Bik+aCIP5QC3fW1AkPpFYm7kQous4pXqg029R/xq3m2c59ivNgyVEIbk/DhHu+lrOEbPoQIcAGnHExNxbUslR2FR63U20A2jnB50KToDgcrR+zPyEF3rHw8qgAU1WwpEOJDgOPNY3bj0/gvPLusigVDIbMjxgEH9cmAXrBvmE+pWyW8D8maqMYfqpx70B1jQY/N+/tvE0AT8XaRzw1R8PA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(7416014)(376014)(52116014)(3023799007)(18002099003)(22082099003)(56012099006)(5023799004)(6133799003)(10067099003)(921020)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?LdsBzXqgLskJqRDCDiNa2lgtmGrtENHffScAXJ0ApftrxgMqok0NoV1OGCGB?=
 =?us-ascii?Q?ISHccQf7YLCPhyrB9MSubFgYGNMA8Vgh0NGafN2Y/3jV8In1Ebv/KSRo//iT?=
 =?us-ascii?Q?RaMtKByVHXYDjRa86AK+wUoNiEnTiWOkfs0iS4qJkRob/p/wz+mFKNvz2dRp?=
 =?us-ascii?Q?jglprURJr89nZJQBdgCve8BtOTys5u+Hd+iabqqv2E9yFEaEa6yYREXnrTiE?=
 =?us-ascii?Q?dWr+PklFDC9Dl+4Nk2D9t7Ts/fmxUUvkMl67xt9DknDoipOPlWL+FGJD387E?=
 =?us-ascii?Q?+65YkJK2HjcC9sBAwRBifDLMK7xLMiEOFcrEEJFBEPsK/R1lUPXSBhF5yEPN?=
 =?us-ascii?Q?NR7pRzHlYvBvdajtRQxEhiIy3Yw30lIKehSQayU2RNoHley1dMHDWRcGuXIQ?=
 =?us-ascii?Q?aFQxcn9zognM9oTVafiylvcDZL2jZSiG4tbjAuDLv0zwZmgvv+WKeZXGsfXn?=
 =?us-ascii?Q?0rhgK8XQIc8GSiaR2eCYeu6Owdo87kAewHdCKe1RqFoS2mU8nbza/GlHbfrB?=
 =?us-ascii?Q?iGp8N7RbMVW+tAyR/yr+8JXGIOsD0GyFaX4vxYhrQfmHdcBbdojLWozF4rbt?=
 =?us-ascii?Q?oC3EWr7vSVDBonrokIpKZBcpQkyCX9Gb42/Pyn+54fZeDBDTOd6xbzpZHoBM?=
 =?us-ascii?Q?9O53wqYGFeOxP4ozNcuMjwtlHc+RVijZP8QUeEiN5O4R+vtk1/gmgSeKJPIA?=
 =?us-ascii?Q?j+OClddruQTDZB+py0CwIEoScLkBg3FWAWHPM+U80ZPkCv4hkfVxZ92I8MWR?=
 =?us-ascii?Q?tFjENDaD2IuMfwecZKxs71So4TnRQVO21rPHGBVBZM9kxY75baNSFgpAIOdo?=
 =?us-ascii?Q?3Jk6vhVZzsN5BG3yEgSunx4ilMLfew36L6bQvZ+TeC+LJe6gEG4vw6EfRP0k?=
 =?us-ascii?Q?49z6PSOlTJQ+2J2hH0X+f7jMPiBBDTUFSsp0mCmapZA9jdjXkurmfli6kLcg?=
 =?us-ascii?Q?AIMjqBePHkVUNUdajmA2P/nZ0toAmX6YyoWbbQ/8fPixFt9xUn7MuYL/uUXo?=
 =?us-ascii?Q?fwHmzBQPa8vZahwbbwLeGhapFBsPa67zPotD4rZ2zrcMSduIkJ1/YJ2wa6Gd?=
 =?us-ascii?Q?tCqwHTE5jKT74aLSxQYWXq6vnc//rKlYsr/LNbgwgxWYxi6wBc5yOz+m+dMd?=
 =?us-ascii?Q?Kj1lhswHUR8/zOj2sU1bYFEwW2IZDsyYVvU/7iSxfFC6Vndookg4wM4ZWE3e?=
 =?us-ascii?Q?ntXj27R2kTBVRQ59wlNMYv3q4r6B3+Dm67/7/ahwl3vALknpuRVTprah7ztc?=
 =?us-ascii?Q?baZGlK5ScgxRN9UlbJcQZWFjp0nmWeleb66fUTRUmEwsaII1xekY1hrwOnQl?=
 =?us-ascii?Q?CTphGJZi2um5Hg/TpNS3gLJw3kfYXHwsECSsEcHJcNCbcngC95NEUG+WTUbm?=
 =?us-ascii?Q?Ai1OUrNNGibNcDXh8hdf6ZuCvpQ66Swr7VrmepLxpSYu1LAPo6PfuTyia85A?=
 =?us-ascii?Q?zwd6t0wPxPXDR175o8TswJRHhn19J8xE2iEVaQxmUN1ZenoE1rfWfP/TtmBe?=
 =?us-ascii?Q?HOdhpD85LNFRsdsHyCX87XDFKGa4OZ4fPVKJSzrNMlupUpJlTE5iyoISMFol?=
 =?us-ascii?Q?DxAiEc+D+YWjIRyd7SyuTDCVjbc3mxwuZb4blFSDTTSUBWc2eNhgthc3Mx6O?=
 =?us-ascii?Q?U2PH80nSMU2CslTOjSuR0GK36XvrxqPE1jvEeEdyw96CkWBrmcywW7bHIKL0?=
 =?us-ascii?Q?8AJtQq0GmyzSChGrCHqNgQxLzBrxJ5IB6tg08P55cGtcffLLaABxr9H1pf20?=
 =?us-ascii?Q?U5QsTvZioIWOARucopDcR1VMo5aGBU5G3TuRIC5gO9qgZPbCM1MN?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8e8565e-552f-4335-9334-08df05794fea
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2026 02:57:50.0803
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YFKmpxdii8MPRToLnZw+PGXcHXs1qyCytdbNZgQnsvoeCoTdJVf8w38lGZWdXZy6Spzz9gh/2VtkQqGmaAKDxsXoFQB5lVBKshP0izBx/FqbMRHqjLNpNTAb+H9vvFUh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1153

Add pinctrl driver for StarFive JHB100 SoC Peripheral-0(per0) pinctrl
controller.

Co-developed-by: Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
Signed-off-by: Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
Signed-off-by: Alex Soo <yuklin.soo@starfivetech.com>
Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 drivers/pinctrl/starfive/Kconfig              |  11 ++
 drivers/pinctrl/starfive/Makefile             |   1 +
 .../starfive/pinctrl-starfive-jhb100-per0.c   | 152 ++++++++++++++++++
 3 files changed, 164 insertions(+)
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
index 000000000000..a3ec991c6187
--- /dev/null
+++ b/drivers/pinctrl/starfive/pinctrl-starfive-jhb100-per0.c
@@ -0,0 +1,152 @@
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

