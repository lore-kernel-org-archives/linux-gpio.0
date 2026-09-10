Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2091.outbound.protection.partner.outlook.cn [139.219.146.91])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E09243B19B2;
	Thu, 10 Sep 2026 10:05:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.91
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789034708; cv=fail; b=Pw80GPtV8mKmT1FVssEhB3FSMm2q3jA2PSFY5LT4Xnj5snnVGr9CdBEY/ry7xlk9Fqj+7xJa3BUo89pSdebnBt43TSnTfVE+xp0g7zAVWplBJ+oQMpGEvRCjAY+YWR0nZOQ2NR1vXvuRU3te24KCMXK6c/AFHU9Z1IQE+kiZX04=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789034708; c=relaxed/simple;
	bh=qksMbgzGnyE21IEeeQeGacLWEVSFcAuSlZMiT7vwq/o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Cw+IQzwGcG/KGmaUfYWAnz7EeS1uEoCidbubYdBC6aZ8XZtSlKipMCWPmKiuVWdiRUm2Imt17bWImcMMS+aEVESlx81pW4SKbBq5MKeWW3xW4U+X4sr9ujhjAlLw4L7g3rXaAsOsomwYhcWuIgBTRjLz1iFeEUQYFDSldg1wHlo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cyW24QqfXZVmuIpRwd21fowEa+CzojzkfL59Ns1+GwzpYHN0tGbTxO4z+FTcA2b8ePsv7x7mo+E47lJuS3OhOQUHdABhzAB93Bpum7KToVt1WRiPueqit532nuYX2NdIFZfzUjOT4NGq+iJ+yghd2Bv64UxhseU6HqSQldhTEyM+jJNNbIDyLJHkWkeDvjcDdUflEX+LD/gIJX5Zk6ohtP5Spn2LWih7rBzY59pQyd1WGG6G2aZok71VOmpvgB+ogZDGWe5Iqy5cZtrNioXBt/AwS/HT69DGXmR4u+K8y7p6eKLI624MOQVJDMDVuhZ7w6vO4D47pP9YihNB3uoo1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8A1EOZlE/47u0KE9L+45tDhwbmnTE7fa4674D6173HE=;
 b=h9dnTw1gN2uk8mqJwp4+68OQFO+rRK8BdTiJd/ZaxndU0EkSRWmRXbUYULLL57T2H5UbD5BqyjA6IU9vbsN0eSoP2J6HgqPkyV72LPBRdi/0P76kvG9pqfs8EPOgivD97L4PtVuIqJxHjagEyuESa30/qMHlY2RnDuiu/vQKFr3rpunkYAewly1y0AzaF5PxFA89fJREk2eLFJskSAViBkHpu/502UP0vZTBhmqb4gtAFmildGdOmIaixIfsrrohkQBI3OYwfbdG71dRc+IwmPc/WytTbxU7JMHb1bQp35fsCZEEju9wFkWOF1m7frbqTqTDIC/le8+N4h8qviT6Zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1170.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.18; Thu, 10 Sep
 2026 10:04:32 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0339.017; Thu, 10 Sep 2026 10:04:32 +0000
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
Subject: [PATCH v8 22/22] riscv: dts: starfive: jhb100: Add pinctrl nodes
Date: Thu, 10 Sep 2026 03:03:57 -0700
Message-Id: <20260910100357.130134-23-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260910100357.130134-1-changhuang.liang@starfivetech.com>
References: <20260910100357.130134-1-changhuang.liang@starfivetech.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZQ0PR01CA0035.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:2::21) To ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1170:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e668192-854e-4ca7-5c83-08df0f22e93d
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|7416014|1800799024|376014|52116014|10067099003|18002099003|22082099003|56012099006|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	/AtdXds4SUhdaQtLKKH+iDyQm5/HTxX7mWS5jQXU3KPPRPIae9oIn0pB6hPDCq6sqNDuI+pKCLBlCq4p96NbgWULEHCrsJv9K+p8mly/alaN0cW8GHjxY/uR/ibxOphIEas84XDICYrqfN4eFO98vLW8XL4qVyvR7bEw7gHFSZVowqNYMZR0ef0nLf4XVW/FAUlj7d0frIZADWBSI/1sml92kCEq6Zk8rBjlYzY7lQA3yhtuFITTBlJuUnGKYyfB8bCHhs31TR7vgeLwL/S6zoM5HkT56mp7om6c8kXQL40HQbZ7X3gseY4GKZQYBK2Py1HLzphOJ5ysKmwPcZQ5qZ+okBX8e7zKg4nvNMvJ54iNGmVPzzB2Ze1iipivhtl43oOLrRwM48ATTR+O3B8i4UTae8Qme6iGcOB19FG9m4Ap8Xz8KrT1uaV/jZdpgdAcOGQn6RlbA+3VJZgpcDcu1/2eOeMmbxufFn2x2NtG9ckA6I3Lv6tw8GxwjvmRs6HfL8loSvP0P6mjiyZ1fC0Oytn7XnAG4wxkAQbicDxy6MH62vJ2gQtwCaKF6nkfisve62DqOO2F5QGpknycGPhhPQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(7416014)(1800799024)(376014)(52116014)(10067099003)(18002099003)(22082099003)(56012099006)(38350700014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?P80v6Wh+FkcaHtUskNuCLPnxGsMVVhjxY8dnhGvDUrWePChywyFGpcUL5zFV?=
 =?us-ascii?Q?QUAQsHtXvPZyI0IGtkgSlZgbpXV2OVI5o2KkdNaH1/tuSndkSdc/FWRPUvwV?=
 =?us-ascii?Q?aCAB5G5PGw20d87rCaRtwJArh7xP8/5pxwsudkWWIeoBX484tkxA61yaQrgv?=
 =?us-ascii?Q?Y5gVKan7050FQdRkhHiBn1EknD9ZfyltKatSl4kT2zLpQuCJpVQzfeYCRn/L?=
 =?us-ascii?Q?MyJVE+ucNHExdyPW2rAjotEIB2QiYsrtLRowPfCiA0rEM/uocdqRgwgPyuie?=
 =?us-ascii?Q?5f/l+zq11f8YF0WJOT8PwMFedKgAeVGEw1pUVJOeO+Pd7qZsa1mb6SJ99M0I?=
 =?us-ascii?Q?2SHOgrpkAVOU7BszDEx3nuc4tAFU1Cssra2P63lTWCgP+OTjzOjk3AfxkmeE?=
 =?us-ascii?Q?A1SI9aPmGNiMJJV3ejlbuVdejwTpsQcBZWfaYqxxXZGmVFF+iGBllDTsoo3R?=
 =?us-ascii?Q?McUdz68vqFnGGUwRfDGu5Rj+8JDdp8WrIwvuzl9EKyD9HhY+PT6FrdEP9sWx?=
 =?us-ascii?Q?FHfQMvonvCHPY31wDmwXLSVbm34XNf5yZdz0bRvVuBE3qqWpiAA3J0MMUQqQ?=
 =?us-ascii?Q?I0H7f+o0+/LE8DDtOqZkKBHy/i22ilRcN7rColiDeSzR3O/QPq84Rcrat3zN?=
 =?us-ascii?Q?GVUBs0j6cJY2EuZ54fR7P3r4lsR6cSnFn+LyCLcaJTesRTlVxIQ77hmk3rcu?=
 =?us-ascii?Q?a/blBxNCRC9SbzyN3M0hdysP6ML2/OMGCF5sNhKqficAKcBo07rgC9W7q/OF?=
 =?us-ascii?Q?kCZ5niunKfSV96DFvEz0ciWzT0vBm3ficcCdyZNy9+wiCrjk1BjjeDGN2wdj?=
 =?us-ascii?Q?QkEAWHkOwUBdv4zwo2GHLdfvtl3xNi6ZRa30exWaHLehhozGyJNdfUMpFS8s?=
 =?us-ascii?Q?9aGeBTPYesbKwTqeX2NzQU0VmgJw1oTpnwWsGkL8ttjgomzdED7OFvxDY/Lt?=
 =?us-ascii?Q?fjxjOk7MZ2raC9ZO4xg0wCSZB6fF3ORHk9XJ4tIyBh+epNeoDjZl0b7oArox?=
 =?us-ascii?Q?Qbp8SqfmssxcWQwb/ZIUzEhvGb+ETdX060LTRDbw+nEvGRlB2qfkPljZYHkw?=
 =?us-ascii?Q?4ETJHxk1wi0bGSOXy1dxEeL3TewSJ5Zmgc8I4oO+gCvrKSSeMTgjT91AW10x?=
 =?us-ascii?Q?eDGqIrweNIumgSxkdwfhjNWVYYeK/y4fm8ACRAALqsb+SYodxjxsOP67CPHx?=
 =?us-ascii?Q?gmCNhPRT7NhZyUlsCJI3hExRLLvngmZ0JAmws3zf0UeFWQXYebdO+dSa/Lzt?=
 =?us-ascii?Q?/SYlxyU+vnxWC6ITjJY2m+ZBDvI1pMh7lUILORCSZom4AA5cd1fxSwYpq/Yd?=
 =?us-ascii?Q?140s7SzMC9vWMgscdkmvJAB86ozWYF7cm0fBCUm9oVvnPfl9s6d/jiBmMTOK?=
 =?us-ascii?Q?3V0dRDQl7W0vhFkvIgnhsgC0mR7AQr74OELc3sSdne0PTqzoqMrGZZzT9IaS?=
 =?us-ascii?Q?bqKQE3iPDCCch80e6Hg8dJ2Y6PmvSJnk4XvnVUlYuPGYRSwQ9ph9XEi63Wl6?=
 =?us-ascii?Q?sCGDNVB0/BMJJ6YPF1VVxcq1zV5XKJhaMKIOt+Sx6HRT0LMCZfpocCKzckbb?=
 =?us-ascii?Q?JjseZLd1ic6YhU0C7mv6Bg2TNYCTg9i5UeB6xBRGeDke+rmIsLpQDGw5zMja?=
 =?us-ascii?Q?iwqwXZxkwVQpAIpb21um8jAtwGij2PIS/IvwEZnQFbdHT9NKbM64Aay48yQV?=
 =?us-ascii?Q?EoVmoGK9OVlS1F35dz8PeLTL8Np2CWsEAvlJOlBVrBSDfDAyWaRparSYtDot?=
 =?us-ascii?Q?4EukOO+cFgYCfwMeXo02G/qG/r6D6knvzSwrRj0ifomw292NioLJ?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e668192-854e-4ca7-5c83-08df0f22e93d
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 10:04:32.7257
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HvyWkxL+zIfbQ34fCVC03A7wvqoE8J9FFeM+AI+wlCBhJ5yY8Y4xwko72d20YmC7/x3bSqDL1e9HyG495D5yMXp5ZSGKHs1ldUOfXHyLL5NolIlAlpQXn2P2B5chGP3L
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1170

Add pinctrl nodes for starfive JHB100 SoC. They contain
pinctrl_per0/pinctrl_per1/pinctrl_per2/pinctrl_per2pok/pinctrl_per3/
pinctrl_sys0/pinctrl_sys0h/pinctrl_sys1/pinctrl_sys2.

Simultaneously add the pinctrl reference for uart6.

Co-developed-by: Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
Signed-off-by: Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 arch/riscv/boot/dts/starfive/jhb100-evb1.dts  |   3 +
 .../boot/dts/starfive/jhb100-pinctrl.dtsi     |  23 ++++
 arch/riscv/boot/dts/starfive/jhb100.dtsi      | 107 ++++++++++++++++++
 3 files changed, 133 insertions(+)
 create mode 100644 arch/riscv/boot/dts/starfive/jhb100-pinctrl.dtsi

diff --git a/arch/riscv/boot/dts/starfive/jhb100-evb1.dts b/arch/riscv/boot/dts/starfive/jhb100-evb1.dts
index 462b6fb7953b..8ad2b30a4e0b 100644
--- a/arch/riscv/boot/dts/starfive/jhb100-evb1.dts
+++ b/arch/riscv/boot/dts/starfive/jhb100-evb1.dts
@@ -4,6 +4,7 @@
  */
 
 #include "jhb100.dtsi"
+#include "jhb100-pinctrl.dtsi"
 
 / {
 	model = "StarFive JHB100 EVB-1";
@@ -29,4 +30,6 @@ memory@40000000 {
 
 &uart6 {
 	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart6_pins>;
 };
diff --git a/arch/riscv/boot/dts/starfive/jhb100-pinctrl.dtsi b/arch/riscv/boot/dts/starfive/jhb100-pinctrl.dtsi
new file mode 100644
index 000000000000..45fbef398a9e
--- /dev/null
+++ b/arch/riscv/boot/dts/starfive/jhb100-pinctrl.dtsi
@@ -0,0 +1,23 @@
+// SPDX-License-Identifier: GPL-2.0 OR MIT
+/*
+ * Copyright (c) 2025-2026 StarFive Technology Co., Ltd.
+ */
+
+#include "starfive,jhb100-pinctrl.h"
+
+&pinctrl_sys2 {
+	uart6_pins: uart6-grp {
+		uart6-tx-pins {
+			pins = <PADNUM_SYS2_GPIO_A38>;
+			function = "uart";
+			power-source = <3300>;
+		};
+
+		uart6-rx-pins {
+			pins = <PADNUM_SYS2_GPIO_A39>;
+			function = "uart";
+			input-enable;
+			power-source = <3300>;
+		};
+	};
+};
diff --git a/arch/riscv/boot/dts/starfive/jhb100.dtsi b/arch/riscv/boot/dts/starfive/jhb100.dtsi
index 943324b3b2fd..ecd952084535 100644
--- a/arch/riscv/boot/dts/starfive/jhb100.dtsi
+++ b/arch/riscv/boot/dts/starfive/jhb100.dtsi
@@ -428,6 +428,18 @@ per0crg: clock-controller@11a08000 {
 				#reset-cells = <1>;
 			};
 
+			pinctrl_per0: pinctrl@11a0a000 {
+				compatible = "starfive,jhb100-per0-pinctrl";
+				reg = <0x0 0x11a0a000 0x0 0x1000>;
+				resets = <&per0crg JHB100_PER0RST_GPIO_IOMUX_PRESETN>;
+				interrupts = <60>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+				gpio-controller;
+				#gpio-cells = <2>;
+				gpio-ranges = <&pinctrl_per0 0 0 60>;
+			};
+
 			per1crg: clock-controller@11b40000 {
 				compatible = "starfive,jhb100-per1crg";
 				reg = <0x0 0x11b40000 0x0 0x1000>;
@@ -443,6 +455,18 @@ per1crg: clock-controller@11b40000 {
 				#reset-cells = <1>;
 			};
 
+			pinctrl_per1: pinctrl@11b42000 {
+				compatible = "starfive,jhb100-per1-pinctrl";
+				reg = <0x0 0x11b42000 0x0 0x800>;
+				resets = <&per1crg JHB100_PER1RST_IOMUX_PRESETN>;
+				interrupts = <61>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+				gpio-controller;
+				#gpio-cells = <2>;
+				gpio-ranges = <&pinctrl_per1 0 0 36>;
+			};
+
 			per2crg: clock-controller@11bc0000 {
 				compatible = "starfive,jhb100-per2crg";
 				reg = <0x0 0x11bc0000 0x0 0x1000>;
@@ -464,6 +488,30 @@ per2crg: clock-controller@11bc0000 {
 				#reset-cells = <1>;
 			};
 
+			pinctrl_per2: pinctrl@11bc2000 {
+				compatible = "starfive,jhb100-per2-pinctrl";
+				reg = <0x0 0x11bc2000 0x0 0x400>;
+				resets = <&per2crg JHB100_PER2RST_IOMUX_PRESETN>;
+				interrupts = <62>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+				gpio-controller;
+				#gpio-cells = <2>;
+				gpio-ranges = <&pinctrl_per2 0 0 31>;
+			};
+
+			pinctrl_per2pok: pinctrl@11bc2400 {
+				compatible = "starfive,jhb100-per2pok-pinctrl";
+				reg = <0x0 0x11bc2400 0x0 0x400>;
+				resets = <&per2crg JHB100_PER2RST_POK_IOMUX_PRESETN>;
+				interrupts = <63>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+				gpio-controller;
+				#gpio-cells = <2>;
+				gpio-ranges = <&pinctrl_per2pok 0 0 18>;
+			};
+
 			per3crg: clock-controller@11c40000 {
 				compatible = "starfive,jhb100-per3crg";
 				reg = <0x0 0x11c40000 0x0 0x1000>;
@@ -483,6 +531,18 @@ per3crg: clock-controller@11c40000 {
 				#reset-cells = <1>;
 			};
 
+			pinctrl_per3: pinctrl@11c42000 {
+				compatible = "starfive,jhb100-per3-pinctrl";
+				reg = <0x0 0x11c42000 0x0 0x1000>;
+				resets = <&per3crg JHB100_PER3RST_IOMUX_PRESETN>;
+				interrupts = <64>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+				gpio-controller;
+				#gpio-cells = <2>;
+				gpio-ranges = <&pinctrl_per3 0 0 11>;
+			};
+
 			sys0crg: clock-controller@13000000 {
 				compatible = "starfive,jhb100-sys0crg";
 				reg = <0x0 0x13000000 0x0 0x4000>;
@@ -517,6 +577,53 @@ sys2crg: clock-controller@13008000 {
 				#reset-cells = <1>;
 			};
 
+			pinctrl_sys0: pinctrl@13080000 {
+				compatible = "starfive,jhb100-sys0-pinctrl";
+				reg = <0x0 0x13080000 0x0 0x800>;
+				resets = <&sys0crg JHB100_SYS0RST_SYS0_IOMUX_PRESETN>;
+				interrupts = <56>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+				gpio-controller;
+				#gpio-cells = <2>;
+				gpio-ranges = <&pinctrl_sys0 0 0 4>;
+			};
+
+			pinctrl_sys0h: pinctrl@13080800 {
+				compatible = "starfive,jhb100-sys0h-pinctrl";
+				reg = <0x0 0x13080800 0x0 0x800>;
+				resets = <&sys0crg JHB100_SYS0RST_SYS0H_IOMUX_PRESETN>;
+				interrupts = <57>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+				gpio-controller;
+				#gpio-cells = <2>;
+				gpio-ranges = <&pinctrl_sys0h 0 0 12>;
+			};
+
+			pinctrl_sys1: pinctrl@13081000 {
+				compatible = "starfive,jhb100-sys1-pinctrl";
+				reg = <0x0 0x13081000 0x0 0x1000>;
+				resets = <&sys1crg JHB100_SYS1RST_SYS1_IOMUX_PRESETN>;
+				interrupts = <58>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+				gpio-controller;
+				#gpio-cells = <2>;
+				gpio-ranges = <&pinctrl_sys1 0 0 8>;
+			};
+
+			pinctrl_sys2: pinctrl@13082000 {
+				compatible = "starfive,jhb100-sys2-pinctrl";
+				reg = <0x0 0x13082000 0x0 0x1000>;
+				interrupts = <59>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+				gpio-controller;
+				#gpio-cells = <2>;
+				gpio-ranges = <&pinctrl_sys2 0 0 37>;
+			};
+
 			intc: interrupt-controller@13220000 {
 				compatible = "starfive,jhb100-intc";
 				reg = <0x0 0x13220000 0x0 0x80>;
-- 
2.25.1

