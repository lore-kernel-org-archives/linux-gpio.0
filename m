Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2129.outbound.protection.partner.outlook.cn [139.219.146.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C310231E830;
	Sat,  1 Aug 2026 11:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.129
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785582043; cv=fail; b=c4kxznosY1BENeFNu2skBzylcztCY/v9Bhvg7JVjtPuANT0Pw80JsNRD5h1eQu76gZaU+cz7eNES+hRsZg2NDzFqPEf+pJOU4pJ64BSdu5iZtz9qiSSnaOo/Nh8x0+u0mAepKcUsOOc9riD5aVfB2HC5DwXSInAPYq7SQa8b240=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785582043; c=relaxed/simple;
	bh=KYG5tI63+c5nZ/ZYFnCFsLyl4sGX6sryPR9iyf2LH/A=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=AM4FHlyqCET06+KU10/9utKnVtCiPWRIITdGOTI5kkVEBZyEvB9RZ0OzdZCRCeU1YigZHkEjR/uuDTpvX3KbC49pCtJRKfFt8jKZDaYT4SEPwEwL/0sbvRzDfxvKce8aGcI57bjQa1uvM3jkdAlrUnrBk5ivcrWlYyCu2RXZ3ao=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C5MnnA5gzIjJzYoxuLjD7tUYPmZYd35OKDuXwko8QJc5uykjYeT2U8kgEk5+nFcoZioPAqz+pl59q7BoGkJHDzbNEn/2WLVcNnLiFcY80ttSZeGKdmKugVNRyxXsFJERzn/+HZiP/V4OxtRBahfh0EuN8c3leG8tfeTK1RqaRaQ2K8SFckIJ+eAw3WMnAYP9LXz7gnQyaS99qs+XPvpM7nH4xBy00faKr+5agzSzIs1WO8lCnsPSUQ95G/+Lh7t4H8qgrCQ9OOSLQxd10uQ4c6UasJoPZxT6M7ajS7ca6fjw2JUc9duUDGT9ZTWOL0LJIKE/qTEdrTNQZm5ItLwDFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z24CXpsalh264fdKw+UafxWSYyzreMnov+RWeN+o4+M=;
 b=MpAs8wcGBtyaxv6VfgQxEPO1TMOx+PPKe/DE/JLtf+mUzXdvDZdkOMgKw0EAgEvsJcNx1JF0+7WokSB1EufBuiDjU8QTq3o86Ad44zGcj3cxZD6NHF1n+upW5LaGsznvSWevBxX6MWkG1yFglQJ/NtZa4pQEFgXzyqAwzCpNv8skGbN95T+6kVZzpQIglnpDyJP8Pbv98LWHawZpoxv8pyPsGYNNCAck9qXyT8APBfYWPijAdOoQXRU73eig+6gRYtnkm9UQuUhuKwARJ3qx4MVJQVuj2jJC+zQgw+EkcENghAB83yvmE/x1u0l66oGiWfJfSlux1swoFcTEhB+fcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.16; Sat, 1 Aug
 2026 07:27:48 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0270.015; Sat, 1 Aug 2026 07:27:48 +0000
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
Subject: [PATCH v4 21/21] riscv: dts: starfive: jhb100: Add pinctrl nodes
Date: Sat,  1 Aug 2026 00:27:11 -0700
Message-Id: <20260801072711.153217-22-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260801072711.153217-1-changhuang.liang@starfivetech.com>
References: <20260801072711.153217-1-changhuang.liang@starfivetech.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: NT0PR01CA0027.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:c::20) To ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_
X-MS-Office365-Filtering-Correlation-Id: c067f9b1-c282-4f9d-ae2f-08deef9e635c
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|1800799024|52116014|366016|376014|23010399003|22082099003|18002099003|56012099006|10067099003|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	/Elyv4aQPxnl7eHR/vBDCZUSiwnx/B0H9S3WgnuAj5vpE6gDZDSQPrl08LbJ3DsHwUtzqFA0nnggHtToIIsip/+v7a3Oa/vWszltE5FaOlcfkhYTFDUOeMcTnAVqxYb/62Pu+rH/4yk1IykTQ3mJF3/Cpsv1uCJ6k4EYBiOwEK5ecI1qUNWCKv+Fx2dtgg/i/9X0OFT+3xs9nBOSE8zkC+sOJsyMjNXnfqFwleKTxHnSVRxizmIT634rdSraErCJxoVA6nY2YIiK04iD++A1WUfXo+VaIVyNtgk8l2LvQsfzHlWGOM7akPWxPx3s+dnE0CMQEP0q7TJll2XU5qy9XhIKr2M/5w20KkUc3ytfGcnwe4nA5jQ9l/AaswEiPn2k+MA0pDnAtlrRIMTFOZJM4BkDEG86DMIJsvJK7X55CxHelRVnHFQdlnm+tt9a2ICXTQIf4POSjGsrSuNJ0ddDxEiLFnMRu9MsDRh30+sEJYnv6ifLzuo0KC88t8cOZSssfeM+EM/eRtflJgOA3I8DTa58U68r7nnTda9qQ831w0wl8vPbPX+zZtzXjqGo0OwtBBDP1wAy6scTGgRCOQxiMA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(52116014)(366016)(376014)(23010399003)(22082099003)(18002099003)(56012099006)(10067099003)(921020)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?lwexKlV9Tf5S8sm631F6aYaaPNFdJuaQl+YU30VaI+BGzW17750rhf351Uk2?=
 =?us-ascii?Q?sLsl8ZShipOqnuO+XZQ7fZvG6LyQAyHAeC6SrHMrpUMhrb6ipYBtVjFL5DTq?=
 =?us-ascii?Q?vlr7yVlLAaYAlfUoDOTIozG4EZBKPca4bBuTmn0uOhX3bu1ZP6ixjkGoKPsI?=
 =?us-ascii?Q?GuWF+h7r3Ma9bXFX/e/0bSYuthVQN/aijXEGnKLxg7C5yE6Qn4TgkBuARY/+?=
 =?us-ascii?Q?2cHsUAHOJIoo4L1Rr1T0uaWlkiC+7CE5CSEcSQw5pMkFdsoSe67i8UjZPjks?=
 =?us-ascii?Q?t1SzuvO3P/1DRrGpmEgWdlbl/LGCFJ6hEXwA1t/uDTJS4boUx4itvOI+AKk3?=
 =?us-ascii?Q?2TGtO2juCGPHSHXqrhf8dnIBIZVCpYsHaPTFfZrU/aznaWVLm7Ax0Ge0t9en?=
 =?us-ascii?Q?6Npg2QqoigmLvG+Y51MQHziiUr7Rh6eYXZnPij03ADjycWlmkiWgvD0vTsMV?=
 =?us-ascii?Q?poPO2p9rTBH6FbAA8erC6Lm/GZ5p36pEe7mjAhjjIA8tlxOofplcssPyR+gQ?=
 =?us-ascii?Q?+XVQGiuYAg6Beh/aVZ9nsS6BcOy/MlmcZEW7ieWtEbBGWEiRjrf4CXPoIqZB?=
 =?us-ascii?Q?rbxBn0IE/iZMzIM5f3kB4uietWp7LFQ3zkddeEOqMtm/YWgBxni5sEHIWfQs?=
 =?us-ascii?Q?id6IuYPBnNEPb3QZV8fF3Kkut34eGWnxKg46JFDYVsfyH22yNQqcJ9PFYZOT?=
 =?us-ascii?Q?SRJQEEe6lH7rRBQU0GVBpyu/KqU0lY2zIhpn4kMbvRTLWBq7fgMIBVGah0tl?=
 =?us-ascii?Q?1gZBKcPMsT7lp+lC6utOmCiUwwROS8UTF4Yc2FAi36PmdFbL3OrFjc2YZjpx?=
 =?us-ascii?Q?+8/oM9eaQsWvjmXEQcDJWZLA9zB8uysdg3b2rm5H2ffVJCJvAFk+FiPTzyDC?=
 =?us-ascii?Q?yiJjcXiChECdLRT5V9xn9V9iGJGR/IYa+UmpOXS6XishPBfoW+pd6XzvhyWv?=
 =?us-ascii?Q?5E89Mmc8I9ZmVmcdMoVfXUvO2qlz7G9Rf18a+Dbq5+UyK/TpP0XFzGmkkJjC?=
 =?us-ascii?Q?06JIyA+Yh9lWPA8BwnTzzvLcChfCnpaPhO+rnrqVDks/54CWUIxroU/Lowm7?=
 =?us-ascii?Q?bHFdtPSdmbd0M9YlXCuTuKIXG4euswO+v5HEecS9GJv8nLQWzxNtU43nMNaN?=
 =?us-ascii?Q?glaIBB1hkOWpfyM32qsMtX2QaJaAUj+5akrka/ECDgma8dSP+Zl6Qr6FsafO?=
 =?us-ascii?Q?xZJlbkrTL1CQGNl2/0i0AYi+TNLGny8o06SJZ2Tt8rcStp6/0+u2q40P2HCL?=
 =?us-ascii?Q?9USmAVS6dmfUiumJ7wMTpoaCou1tJ90XEj/WQcYMcny6r/kQCUlxh1imOUdC?=
 =?us-ascii?Q?67LKBfsuwqLxqR1x25YpANXqAcdTfcHeXhWHPJHRQA508WMJGD1xar4JUq97?=
 =?us-ascii?Q?2UP61HBSxz9FTJZY8aOZIi1vVEcJvNaKih0s8tyFeAed4DEgMOoWtt32Hy6M?=
 =?us-ascii?Q?G+v/wl7tl6SCSFAjsKPUbGQEr6MYonKLD9e+AiFEqfrNxI73U4XZ1Ry5c5Vh?=
 =?us-ascii?Q?0eYpsNPoCN5/+x44K3JzkASASZQ6jbIUWHG1TNy4XlmJRbwB+Xw1kfA2HrTy?=
 =?us-ascii?Q?8ByCqEug8yuBf4z+C3Qy0zBHlcd6bV1ZOAQVdkMUDxTVDiiGiugv+KP5CNR6?=
 =?us-ascii?Q?QEp8+HlaoMOfz6S0MisZ4ra9njufYD19Y6gj5IVb59PzeZtUzAEn03nC14YV?=
 =?us-ascii?Q?V55qde86ulYRa6N0+lQkO3UrKbUw7suX8y2GnD0+nmvbTSYDaS7k1WF4vyd4?=
 =?us-ascii?Q?T9hxy1gxmwLwn6bbYYR6NPpIMYgJ3q73JI5uhMjAOF5bOJ6gF+bg?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c067f9b1-c282-4f9d-ae2f-08deef9e635c
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2026 07:27:48.5206
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TE+Yk+Z45OH1RLMTP/MeiZijf1hJ/+mPE/LT4S1zdfWgglx1BTUauysdhex04DnmK62aKQC9HW87tRhsTPeccZL2y9f34X0uX5V5ZHiSdUIiTjJMycEBIoe8SS+vd4Kk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1202

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

