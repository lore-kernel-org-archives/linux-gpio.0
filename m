Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2101.outbound.protection.partner.outlook.cn [139.219.146.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8CBA360EF0;
	Mon, 10 Aug 2026 08:12:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.101
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786349557; cv=fail; b=Q/YEDOyN0FkMQjMH8qgP0yUVjdLmkt2R/sfXMwX4PtXEEWwy4vLNBBMGKYnioMdCHLu2MbpIIjfukX1pCk3CbP+HDHVo2LGHABEz0N5KEetTMHSi69K8E5tJOzP55eTK9APfAlKbq51V//sdlZh8J0zN3IE9TfXIGWbLMnyjZ1Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786349557; c=relaxed/simple;
	bh=KYG5tI63+c5nZ/ZYFnCFsLyl4sGX6sryPR9iyf2LH/A=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=grO17yY0j+4Z7jMn64GFtlfYzUv/BJpcxYLAvnfMz8qp//HAktaH6vTGfGZC7VCcnCFtlPb6KHX4bA8vuRUVlbaV2X2DzKEfVNp0o9rmxbUcrPprQpGT6kx0dG883QrBRW7uBZY2Sdw6Oc7Ud/DtB9yxfLPPdyVdxxDdXPalnlo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RRYLEtrPHynRKl7ljZeq6ATqiszb6FxpbV3HOV+Xcdp21RbbavUcddD0DEo8psA6gR15nFcQp0a/xZm5xT3YeoSo3wwc/cGCBwdbXI2kP/YPuZsreQHxiw9DK3hdU4MbZyeavPDFEAr41uDJIM4uI3rLDyDLIfKIfT73gMv2dTlV2OaN8Yb5rW7h4QnySf9oGmK6LIV+hnv7j6S7SEny8i7B6G9vWRemrzdMkLwxf82Pesv6hfI+wFFJr+HmZFvhkmg1MTwQ9VA+uOO2uPi97rvkj98dEOUfNimsQnqM5MRvqVGLruT9Er98cXJr7gEfFAEA39TgRDo+1dob3DSACg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z24CXpsalh264fdKw+UafxWSYyzreMnov+RWeN+o4+M=;
 b=kffhU0hSb+6JR8tTA+iGSZ0xZ4RWHS91q0alVS7naLZgkXfipZ1czaap7UwMh7QMiffdHaex1qrR1fHuNxcqXjUJHBH8SZYU9LrYo5ejYRgCQBYoO5De68e7UF16kwX+uMntKyuHFQlWnyWSHstvD8Ec9VEzEmvNjDFddBYdR8S69Cn04YdsBrAmdzoPJ0MaKgwfbd7k50jBsH1jrS2rNydyHlXbbBaWqRBDn0yUK8VAsU80ZRCHVdOQGULnyZmi0SVh7QpwTCE1RI2qo+E5v8dc9EWObkMmPhHcUq1Mcv+XIBN+al26Dw2XcUcpMhWo50fyh2+WqCkihFZ0G3YSvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1284.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:14::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Mon, 10 Aug
 2026 06:37:26 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0292.024; Mon, 10 Aug 2026 06:37:26 +0000
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
Subject: [PATCH v5 21/21] riscv: dts: starfive: jhb100: Add pinctrl nodes
Date: Sun,  9 Aug 2026 23:36:50 -0700
Message-Id: <20260810063650.239303-22-changhuang.liang@starfivetech.com>
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
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1284:EE_
X-MS-Office365-Filtering-Correlation-Id: dd6f6386-5315-472b-978e-08def6a9d7a9
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|7416014|52116014|10067099003|56012099006|22082099003|18002099003|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	yq5JAUF49gxLaao6KOBPytSFEDvWS6UwiBqGHDxf0ksmpI8SbPOPLfzcqJwZXU2K1aX8xvq9hy3921RfxyfBwBqmbykKYBR3KdpYhPgGGMDFh+c1Ewe94fFxf3AWovDwEmOZWjoN9gF+SuswKuyA+M8uLvJFYB0qTHt1DO7TTQ7hmsn3R492L2fzCBAW5tG/6PpALG93jupRrry3y6AFQZGHJYjNsl8Bz/rPGotOQo3+C+aM/BsEO9IVHWi78ocenN8RBA3cYbc7Pn61+oo/aCJ3v3jVSBK49p6jWdoJ7xlnXT+Poxkm2tO4hHIkcQzHYYJJzmtI+2IRWnlrXqgUPznwPch73d3fGYO+N0BMfGlWsWLRxwgqZsJAX1liAVuuywgpWOZdMzE5ZFCwdfobEO2QKmSEaXq1jHgWk/32Xx4HnNfPe9Qqidof/aviNsToH4t7NqetofBGWY979DC7PL7amma6PikU8tTXikc41wsHjflj43IJg/JS+D2NhAYjqdX/fgCXHRmjCDkhTfrkGLZ7O2TlQk05CHsA6b4G48pEeoYlSxbERcxtG08EPXww9M7pbSbM0Je+hF6RJWS5dg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(7416014)(52116014)(10067099003)(56012099006)(22082099003)(18002099003)(38350700014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1RSaxg1hohyGZlLn1YRp5miTRSsCpq1hNIrayO2RfzmycS9gFOUU2ln2X3dL?=
 =?us-ascii?Q?bGoa04fXkEI1/u3ZQaYLhF+vF0cXNBWeS4XlHqJoQxKMNFWLtR6L7F3GyMlo?=
 =?us-ascii?Q?LQwTe5neZyWJLs5tag2r1dlCn0wy7Ks0LNauqRvQjRFLpZXwWxPSpMG+Fbcm?=
 =?us-ascii?Q?+YFbaS3YXKZDsQABAc4AeHUgV0cxmL14E45FVspysxd5f1/B/zQSRE3KvBjF?=
 =?us-ascii?Q?ZRaYTGu90rz8CIhkS1eAv/KotDS14XGkx815AtOME0dG87jphk+RVItzycEK?=
 =?us-ascii?Q?GfjYKqucDeKjnWGaKm0DkyXGXS0U4rHuyf2joq446i3sIUR4Lp9XsY+TIYp9?=
 =?us-ascii?Q?kREzMkjCGcXV67/nd9qKGXWv1APTKTlifncMRRq9wSBFToNrcjjH8UFBlCCS?=
 =?us-ascii?Q?9LQ3/eJFE8jwK7NG8YVZ/51oUZmficd8pI56uUsLOHjkqsRoiHuNb4p1m7Qa?=
 =?us-ascii?Q?5RfX4VC3gw7TOKwzPe/G24T1tmsPg6b16WN+wHVEtGeid3RdlxmaE5U0pXlo?=
 =?us-ascii?Q?kiIKjFMjIKgJR/hvzjqcnypVT3WnvzaCWkkI3SNc29mKJdGJnqyCcgZFZNhy?=
 =?us-ascii?Q?QK3CSPWsTSQfMBOre3gfC5Zs3XA4/hI1RiuAwWMFo7E3BkHalBgkQ+qKb/Hx?=
 =?us-ascii?Q?4hrtI34xIZYIlDivVkkWWuSkoOsth0T3z7aXEAlj2pjqYUzwuLXxBmmArYuh?=
 =?us-ascii?Q?PP+6PytJds8P18ekKE3tmpfd/bR0c1E3885F728R3Ddk13FHAMa+tb3iB/oU?=
 =?us-ascii?Q?2xDFSW8hVxH3EknX3aQRd/+o5yPGMIJ8iEalox/NWqM+EH+SHlgznlUCsZZ9?=
 =?us-ascii?Q?OZyw09E3cseXW2Yse73wIWAubOfJJoOxsiPRXWx5DlgXhDcQf278sg7jdh3K?=
 =?us-ascii?Q?4bq9JD1XlYIp7cr+hL4EJRLB0jeglstctreaIycOOZU04Xi3L9E9uAwvOPGi?=
 =?us-ascii?Q?Xhr4Uv6oK9Zqj32TzJc8eFPv3f5WJ4HgEybWKieKlO3BUJCIHQYPHOe1Dslc?=
 =?us-ascii?Q?VbO7KCd2hpTrdF87s3sjOn+2oR8xrlYLN0ti1q6cUIKDcmF99DEOCZaO8+X9?=
 =?us-ascii?Q?AbWGe2U9eeHJkFAaLF0PUV8E6CDj8QxO3aMqLRBMdRKwkCeamie4tYNUR8sH?=
 =?us-ascii?Q?QF3vcSPgX+/PdNYYjEJsyqT7EFg6A/sdDnzoq0VX7NFwCn/axiIfJXypgHNj?=
 =?us-ascii?Q?UYJNOIcxDqF1u8KVE2q5N0Z4nyvvxlc5xay3m/pNbubqGvZYbBqGwTvlFX9L?=
 =?us-ascii?Q?cziDNoaLpW0zElIq680ronprERHVrRQBBmlde+NIvPJse4yZB9vQ7Cre7h7+?=
 =?us-ascii?Q?dyAdcSm04J1pcSogW0yU4HWhgV+3ZervU1SRflgPUePualb5V7otaa/21Q9q?=
 =?us-ascii?Q?h0ez1hxltNXVVIA/62wViM9YnGNj3ZMh58xkNv/080+JRbuWMRuyzyqGg719?=
 =?us-ascii?Q?q6xc+67jbHJ7oPB6mbW9Abaq3+eoASpYi1uqMdj/933pWBv64/JunhfzSRBz?=
 =?us-ascii?Q?QrH0DDFeZwAdGdkGQpvji3r9ggt3b4nmfDhCc8Dn3kFhQMzvW+renQ2liZWT?=
 =?us-ascii?Q?bh8MY94Ca4D35ERUBagYSCYZ5AgaUtSjjRmhyJIZRAil/fCyicWXfkUCZC/i?=
 =?us-ascii?Q?zoGH+p7E6vmeb/GiNmOL6GzKHNzqFgBvvqwBTRUPdNEKC4mLUblIH+7DcNby?=
 =?us-ascii?Q?YQFSuRFm3MMTxTklFlA5Zpq3BWb1jUfskbmGmy/mmZgvTH7ccdW9TWwh8VCL?=
 =?us-ascii?Q?1aXqTGPjNTF3TEsRQ1ETNnvshYXaVw7viEEzi/7Mp9dZuBEzPEgT?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd6f6386-5315-472b-978e-08def6a9d7a9
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2026 06:37:26.2852
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MtXmvFVBBSX4g8r1OhoQ1wOabfs31jrqNTqOZ7chi+8IkE1YASO40SFv4blQP/+C6Z1262G0EvoKTic4UccBz+PMRTV9hQZt9s8yRby5TdHKo6l69QfCACcywUh+O2x9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1284

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

