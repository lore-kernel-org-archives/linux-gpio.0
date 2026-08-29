Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2120.outbound.protection.partner.outlook.cn [139.219.17.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C0DA2D5432;
	Sat, 29 Aug 2026 02:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.120
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787972299; cv=fail; b=rP9JrYlShK+4utqWHL8r3xEdUufVabS8BLstXV+RQvL8LHVsOcgGvcCSx8HuHcYkmJpGSKnzvG/ROHW9+ZlTEM2J1XJoatXVYJX2g2ZHmrTIbr+dzdljny6iZdfNtzqYECcT+h4y61QXNM+VuwqgL3tB88uQD6Z2DDbvvQXirFs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787972299; c=relaxed/simple;
	bh=KYG5tI63+c5nZ/ZYFnCFsLyl4sGX6sryPR9iyf2LH/A=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Z+vsFuUfDEZIGUgyd+0HwAGHeHLBY+UqXRFwot1ru3ksiklhiFb1t481FvMK8y6rsZHB3CfIpMoFODtmyk7686GFkfzz6A5X9Esf3MhQ1rLnwfJqWhUyGZU99z0a9EwAZHW0GYvMQKZrWTddkQaDRh/pwMf+nzul2tLuKo7uRIc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MEN/dPr6inFSvO1JsQEpVl+Hgz3Lj2wFHVFOcssevaixinagv/eODhV4d3jH+jNMhH27+/gLOq8UfRj1h0IAFtPFGRnc+Hn4G7VZYEt4haZI48OxRaEJtcEY/Xrc17N7wcUQ0HMdQHJf1dhbaDYfTZzmyCvlaLp55QVZIWF2qnhI8vdkr8u9VFNl90sHNg1d4o8HmDhrJL1txgHboXtsd0h6zgdG8ykYvg5FWc05cLXncNwdgiXMxO9bU43+CYbugXH5anm0veb4I8tYwZIWtLXqXVfunx8Z2yNEa0mTjTH+JP/r30DI/RhqOtc26E84GpmqKEdFQbL0SSfR7MEwtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z24CXpsalh264fdKw+UafxWSYyzreMnov+RWeN+o4+M=;
 b=KycD3cSOe3jyO0Q96x459RHFXmd/1/Swtg8eIYV/62eww/Hz9DZYK8zzkFYicbRuttS2lr8bJ7ivKrcrDqNEVu+dSZ1xKroogZMPE1X48JyorAMmLmY/Zyf8YInbbe+tgoGyodFYnBJuD89g+NUYJf2t47bXqQAAU2y9V1mXItNq8EUwgzd9Fu3FfFwoAtdT2X6Bi6gEPC1SqHqXUk5FZM58/UFNPgBHt9tKaFJbDMSBuUZwIMKUALDBgCaYlCegkg2OFv0O6RI3R8dXKJJokVEfm/XxxBCrfy+kI0WBLWXjZMEgFF4PWsHZ9BHuWTRcxZnFYDuVGgHKLpuyfuUXZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1329.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:16::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Sat, 29 Aug
 2026 02:58:02 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0315.011; Sat, 29 Aug 2026 02:58:02 +0000
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
Subject: [PATCH v6 21/21] riscv: dts: starfive: jhb100: Add pinctrl nodes
Date: Fri, 28 Aug 2026 19:57:20 -0700
Message-Id: <20260829025720.23915-22-changhuang.liang@starfivetech.com>
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
X-MS-Office365-Filtering-Correlation-Id: 2788c393-caf0-4ec3-474e-08df05795729
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|7416014|366016|52116014|376014|22082099003|56012099006|18002099003|921020|38350700014|10067099003;
X-Microsoft-Antispam-Message-Info:
	QztPjrS9GoSkIXftWeOtIDkjCF0y7JT8iuWEXO7BGwiXyVjiaWQCNKykvJYp+Vwd/lEJ2IZuYrKVaMO1ImcGOZ79XVGMzngOsS0MTh6mB/c6yrpobkUILtrKZ53T1IztG1SHCGqPZNAqsakZKZnQomDG+Lgvt5bF0DeeMtUtg5VUy7XZFk27A87i8n69cmjURjvhj/dJY+T6bf55wLD3BwzlCtLKsnU2MXv/ct+1Gd4nKef5EaRoSbOHHTQk4Pf70BfHRrBFT1Bas7OsWYW37zGKsVQ6R9jsIY/FJZTXfQIdsvg671+hp0fsw0VnNSXFTfReuSlZ8Yp6I3g7xyvUkdqW6tFcErzEz4nP1he8u9ATT4nxU7r3BPYSrMGMTr2c1Wgh/btq+QIqLk3CRe3T3k/dDIcqj4nl32sIpFf/IGdDbn2pQ9Mp7ubwuTdiIswXH4tuZ7UDSkLrrS6HwLOh7VcMfZBDYgOYQ8i60Y0tsfxYmGb8/ZtQ7VK4RTkKto4tZJYEB5h6e8uvHhQV8t8et+axJqjo1bWQq1MPF7AXDjRoWPmWh8dG0UFQ4/5g1cE6jumG9nPr27EQFQ5HJ+kRtA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(7416014)(366016)(52116014)(376014)(22082099003)(56012099006)(18002099003)(921020)(38350700014)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/6i5vXg/esF8mB64e3hxFSqIat/W2T3pmDZsZCge4HvTFmot0jHgwayO0SRD?=
 =?us-ascii?Q?gcQ52urE47IojXGT144twJBlgrsL3Tga/t8AGYm0FOXvWx9IKlLP0HrWJhW0?=
 =?us-ascii?Q?wWPRIquVS1lzyTnQuaOcoPKm8+rpWWIFFg1thpT7nTSHfoCMSD7zn5X+JlcM?=
 =?us-ascii?Q?z/qOlDnEqxtNNzhEnKT0UNQVWoEPQcM48i8fL32hmw+MT4m5BvYsiaze4HfA?=
 =?us-ascii?Q?Q8JM+bQZFc1v4KzZpvvkqodajOTEBfptKfJylOuvu5XZmmLlHPIcK6C8cWO2?=
 =?us-ascii?Q?XXQuWSpGWbZ/54M16w+gpVdkrMZnZdJ/gLJ1rwg5757CTadNL1WysZCxB9cJ?=
 =?us-ascii?Q?ySaiOliKxWdo5HnTZ1PkkNMxY9NtfGQcIU2Gg4fhTfUe91ygXpUv4zUyL8rh?=
 =?us-ascii?Q?NraPzhj3EGvhroxXw9kQbIXbb0je6JlUhis9Izk6EsEBotuYpC7+G+BaXEg1?=
 =?us-ascii?Q?zxLyviF/3DckTYWnIxCQdJeD6PUjEt382/XfYtHgBF/dmYpYKQLETcG+Rjdo?=
 =?us-ascii?Q?qDc3mVF6ucRn95nDtjUpAT0wbYOXBucIyBI+GG0d6da4dH4a6Ty3C1wI5Xv2?=
 =?us-ascii?Q?WgTwsZUQWHh9Qc5/fYtWvd+RMSx7CpUBM8eblocxe2M5upmuaKwJSzgkYfwN?=
 =?us-ascii?Q?1ud98lw2mh0MjVJlDeM6G73ojUJVYoUxvwdIV3JMC5+BUcUYw6d1UfQHzgfc?=
 =?us-ascii?Q?5IrhshoJJM1shEfuSTfELtAME8e/1V/qT9TgZuqY7es/kWnGL1x20j2RUX7O?=
 =?us-ascii?Q?TOIxgUey+YlbS5WA3fBBbxFo3wFg7jS619iFHcZ/HeiRLig9t18852eAe8Pq?=
 =?us-ascii?Q?Fld/4fXi8lbt761JThX71Wma0hV6z2EJuFESpz893MrW7rxwSl7H91lPJN0d?=
 =?us-ascii?Q?GO3A+gCs4gDBJAenEeyl035S2jPz/5lSbUNvLchM+B5ndJo/AWDDoafQnA8g?=
 =?us-ascii?Q?r0OR2h7ucAH5DHtjEs82e9KJ3cOxSFymqahhvMAvct6i++iwAVArpvB1m4hK?=
 =?us-ascii?Q?/WEpmIjDd6CZW0r346cxc7lC2CSFMNaS49jYNS1dWXzTd0Hw+RAa65Scd5fN?=
 =?us-ascii?Q?qlxjLpk5pdPurzYll6mTo0hNtYAAAzaC5+tGid4ADb9NvDijh4IAcZAQMDmY?=
 =?us-ascii?Q?r7STOjtakoLEzuA3E9ElWhnvWKD4OD8WxJf7ooK0pwxVaI/RCZA66bVklBSy?=
 =?us-ascii?Q?VzgKyWBrlrRVmVvCrXd8JWPFpSFhyeQ75g4bylKFf5HL/bAKI3Ko72yWvEvZ?=
 =?us-ascii?Q?TvUs77JKTwNEeHBDBSzdmirAbo7K98nmhPidZVmlk+DgsTJzypQV+8Sz5rYO?=
 =?us-ascii?Q?lCzxLgKN2Qrd33doP2RIUID5jlXFgcTBlX1moW5XYpL4gXMbrA33O/RsLwJD?=
 =?us-ascii?Q?Ykuqp42QCRrUxk3q8jIroZ+x8bOh5D3oTyUnvTiGiuSTKOXobcgGe3oXetB+?=
 =?us-ascii?Q?1oK3LnvF5ME7gu3+ZoiN1FZbZiwD5+v60RtKoO39I9lxxD0L6huZ7xj4FMtL?=
 =?us-ascii?Q?oML+HWXOtXaPHjmaqXo2vWgpv/RNISiWmWgSEHZ2lR0BKVY4NUPGdex9xOTe?=
 =?us-ascii?Q?ZeMd2gfpDolwDAWnH3tEco1reeIEFsuVDO1ZGhv9rboItaIadcMcy+3MfnEw?=
 =?us-ascii?Q?TYO3QFlrrFWDOhm0Se/Rm+Vn/QY+lQHsQh040Si9UWO8p8efUGy8ZVOdhnPC?=
 =?us-ascii?Q?Yqjh3kYB1esHnbeV7bfUzdVFEh9eAcayRvSF4RGLbUumKTd2vOWBo0HpSTUK?=
 =?us-ascii?Q?gEiZ6EnzMN7ToLDkYkCfBFukqWre1vX5lVlCsgY+og7VvBmYOYhS?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2788c393-caf0-4ec3-474e-08df05795729
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2026 02:58:02.2173
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R01i3slgnydEMo/vaDS0NTYJcL84Dr3aEAIWww5blD0PhHvTDxplGDjFYK9TWpqIjmPzDktdpt/Xsnop9bJkBEiAHk1njKlfPMoc123/+huVG2wtstkAhtexcPMZugYb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1329

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
 arch/riscv/boot/dts/starfive/jhb100.dtsi      | 110 ++++++++++++++++++
 3 files changed, 136 insertions(+)
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
index 000000000000..13d9ff146743
--- /dev/null
+++ b/arch/riscv/boot/dts/starfive/jhb100-pinctrl.dtsi
@@ -0,0 +1,23 @@
+// SPDX-License-Identifier: GPL-2.0 OR MIT
+/*
+ * Copyright (c) 2025-2026 StarFive Technology Co., Ltd.
+ */
+
+#include <dt-bindings/pinctrl/starfive,jhb100-pinctrl.h>
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
index 943324b3b2fd..f9a7fa9d37e3 100644
--- a/arch/riscv/boot/dts/starfive/jhb100.dtsi
+++ b/arch/riscv/boot/dts/starfive/jhb100.dtsi
@@ -428,6 +428,19 @@ per0crg: clock-controller@11a08000 {
 				#reset-cells = <1>;
 			};
 
+			pinctrl_per0: pinctrl@11a0a000 {
+				compatible = "starfive,jhb100-per0-pinctrl";
+				reg = <0x0 0x11a0a000 0x0 0x1000>;
+				resets = <&per0crg JHB100_PER0RST_GPIO_IOMUX_PRESETN>;
+				interrupts = <60>;
+				interrupt-controller;
+				#interrupt-cells = <3>;
+				gpio-controller;
+				#gpio-cells = <3>;
+				gpio-ranges = <&pinctrl_per0 0 0 0 32>,
+					      <&pinctrl_per0 1 0 32 28>;
+			};
+
 			per1crg: clock-controller@11b40000 {
 				compatible = "starfive,jhb100-per1crg";
 				reg = <0x0 0x11b40000 0x0 0x1000>;
@@ -443,6 +456,19 @@ per1crg: clock-controller@11b40000 {
 				#reset-cells = <1>;
 			};
 
+			pinctrl_per1: pinctrl@11b42000 {
+				compatible = "starfive,jhb100-per1-pinctrl";
+				reg = <0x0 0x11b42000 0x0 0x800>;
+				resets = <&per1crg JHB100_PER1RST_IOMUX_PRESETN>;
+				interrupts = <61>;
+				interrupt-controller;
+				#interrupt-cells = <3>;
+				gpio-controller;
+				#gpio-cells = <3>;
+				gpio-ranges = <&pinctrl_per1 0 0 0 32>,
+					      <&pinctrl_per1 1 0 32 4>;
+			};
+
 			per2crg: clock-controller@11bc0000 {
 				compatible = "starfive,jhb100-per2crg";
 				reg = <0x0 0x11bc0000 0x0 0x1000>;
@@ -464,6 +490,30 @@ per2crg: clock-controller@11bc0000 {
 				#reset-cells = <1>;
 			};
 
+			pinctrl_per2: pinctrl@11bc2000 {
+				compatible = "starfive,jhb100-per2-pinctrl";
+				reg = <0x0 0x11bc2000 0x0 0x400>;
+				resets = <&per2crg JHB100_PER2RST_IOMUX_PRESETN>;
+				interrupts = <62>;
+				interrupt-controller;
+				#interrupt-cells = <3>;
+				gpio-controller;
+				#gpio-cells = <3>;
+				gpio-ranges = <&pinctrl_per2 0 0 0 31>;
+			};
+
+			pinctrl_per2pok: pinctrl@11bc2400 {
+				compatible = "starfive,jhb100-per2pok-pinctrl";
+				reg = <0x0 0x11bc2400 0x0 0x400>;
+				resets = <&per2crg JHB100_PER2RST_POK_IOMUX_PRESETN>;
+				interrupts = <63>;
+				interrupt-controller;
+				#interrupt-cells = <3>;
+				gpio-controller;
+				#gpio-cells = <3>;
+				gpio-ranges = <&pinctrl_per2pok 0 0 0 18>;
+			};
+
 			per3crg: clock-controller@11c40000 {
 				compatible = "starfive,jhb100-per3crg";
 				reg = <0x0 0x11c40000 0x0 0x1000>;
@@ -483,6 +533,18 @@ per3crg: clock-controller@11c40000 {
 				#reset-cells = <1>;
 			};
 
+			pinctrl_per3: pinctrl@11c42000 {
+				compatible = "starfive,jhb100-per3-pinctrl";
+				reg = <0x0 0x11c42000 0x0 0x1000>;
+				resets = <&per3crg JHB100_PER3RST_IOMUX_PRESETN>;
+				interrupts = <64>;
+				interrupt-controller;
+				#interrupt-cells = <3>;
+				gpio-controller;
+				#gpio-cells = <3>;
+				gpio-ranges = <&pinctrl_per3 0 0 0 11>;
+			};
+
 			sys0crg: clock-controller@13000000 {
 				compatible = "starfive,jhb100-sys0crg";
 				reg = <0x0 0x13000000 0x0 0x4000>;
@@ -517,6 +579,54 @@ sys2crg: clock-controller@13008000 {
 				#reset-cells = <1>;
 			};
 
+			pinctrl_sys0: pinctrl@13080000 {
+				compatible = "starfive,jhb100-sys0-pinctrl";
+				reg = <0x0 0x13080000 0x0 0x800>;
+				resets = <&sys0crg JHB100_SYS0RST_SYS0_IOMUX_PRESETN>;
+				interrupts = <56>;
+				interrupt-controller;
+				#interrupt-cells = <3>;
+				gpio-controller;
+				#gpio-cells = <3>;
+				gpio-ranges = <&pinctrl_sys0 0 0 0 4>;
+			};
+
+			pinctrl_sys0h: pinctrl@13080800 {
+				compatible = "starfive,jhb100-sys0h-pinctrl";
+				reg = <0x0 0x13080800 0x0 0x800>;
+				resets = <&sys0crg JHB100_SYS0RST_SYS0H_IOMUX_PRESETN>;
+				interrupts = <57>;
+				interrupt-controller;
+				#interrupt-cells = <3>;
+				gpio-controller;
+				#gpio-cells = <3>;
+				gpio-ranges = <&pinctrl_sys0h 0 0 0 12>;
+			};
+
+			pinctrl_sys1: pinctrl@13081000 {
+				compatible = "starfive,jhb100-sys1-pinctrl";
+				reg = <0x0 0x13081000 0x0 0x1000>;
+				resets = <&sys1crg JHB100_SYS1RST_SYS1_IOMUX_PRESETN>;
+				interrupts = <58>;
+				interrupt-controller;
+				#interrupt-cells = <3>;
+				gpio-controller;
+				#gpio-cells = <3>;
+				gpio-ranges = <&pinctrl_sys1 0 0 0 8>;
+			};
+
+			pinctrl_sys2: pinctrl@13082000 {
+				compatible = "starfive,jhb100-sys2-pinctrl";
+				reg = <0x0 0x13082000 0x0 0x1000>;
+				interrupts = <59>;
+				interrupt-controller;
+				#interrupt-cells = <3>;
+				gpio-controller;
+				#gpio-cells = <3>;
+				gpio-ranges = <&pinctrl_sys2 0 0 0 32>,
+					      <&pinctrl_sys2 1 0 32 5>;
+			};
+
 			intc: interrupt-controller@13220000 {
 				compatible = "starfive,jhb100-intc";
 				reg = <0x0 0x13220000 0x0 0x80>;
-- 
2.25.1

