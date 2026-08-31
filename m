Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2119.outbound.protection.partner.outlook.cn [139.219.17.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 633B43F8EBE;
	Mon, 31 Aug 2026 11:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.119
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788176172; cv=fail; b=esalxCmhhzFqSRUQ28OFa+dT1jZlTkTPcooTrBP5eq9w5X/d45quPgqYU6hVwgR6rUAX1nWUQ6VrSNRwXyHx8RCke0FJbA65lRwIBGf1TnHxIeo/6sS/XlTznI3KrbEuKtIQ8zgdSusHvASVuXySxvHF2dqs56TPQytTk2ou8xo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788176172; c=relaxed/simple;
	bh=QDs36TAXKqTU+vANkcNGUmAiO3GBIuGsepwlwC2makc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=lEnOHSorhdJfSJxkEAfIMMqCbB1i9AuLdVXbthrk/27Kiieq2Y1rpsAAIpMXpAQoMxEKIrLJHrVgcvE4glULiunBZN5iTqKaPwVAPinrvnjnC+GSMX9bzHt0t44RYjONzDnL46gb+aC7GoKax5QIJD4rzUkFgmDwLJU8wljorU8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QevaWyi9f74ZnHnWv/X2NSzDvvRE49IN8QkPIC1Wf5K4PIRWDzMA2NwsmNXOsYBOWJgPdwY6hRCbvDCVDxHxKUUPljJmgXogChVnnsr2TfM3XYoVP3+yp6F7U8hKINdcGDcYcotVjS4dZCjF+xd2YB0JrbOzq2QJ969UPzD0cmA9JTpBihSqdENy8BRY+vd19p08NYkmenYovKNQb/HJdm261AFR3Q2aIQITH3z9PrbIz7jiidtFwXx2oFso76e6gNjmdf74h7TiQc1Cp2/pg111MjnvEyv9wtk8zmNF4IucGd1ZVq8tQvKudafZkVfhyY5+8RprjcO6F6t9AzwLGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AfebZAwclns8lWbu8dG+rc8FFCatPg/skZuurMwemOw=;
 b=D9/a6ChObyGg5HUhbG8pQOSiewMlE/DNDSO1XZnHxiIfHrL+z6bwoal9ci7e3LEg6HajW4LP3CcuP8Y/85FDzrjmpXTfsvHji57iKHXrtGvUCeqZ/0C680Dvonqv9VuB5cJAgFEt0JqplfXi5d1hIxydlWILyqitCtqjQZYhWS2FH4PUwPILkrptaP4kz04ihEivzGphAW7YVRfkwkKUFAnKOQItEqlmoPudbueNW7Y+7JyOOsiS02u5tNU2ZcDrahM0o8Q42+/fWcEaHbtuXk4gBDWjoTyMFCC/BmS8IPu7QaC2x2b5Zdd0Wficer9jqRQ5z0f+OW2JIRy+uFqaTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1332.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:16::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Mon, 31 Aug
 2026 11:35:50 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0315.011; Mon, 31 Aug 2026 11:35:50 +0000
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
Subject: [PATCH v7 21/21] riscv: dts: starfive: jhb100: Add pinctrl nodes
Date: Mon, 31 Aug 2026 04:35:14 -0700
Message-Id: <20260831113514.66382-22-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260831113514.66382-1-changhuang.liang@starfivetech.com>
References: <20260831113514.66382-1-changhuang.liang@starfivetech.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZQ0PR01CA0013.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:5::8) To ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1332:EE_
X-MS-Office365-Filtering-Correlation-Id: d19fafb8-0bf8-4352-e70c-08df075401c4
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|52116014|366016|1800799024|376014|7416014|18002099003|38350700014|22082099003|56012099006|921020|10067099003;
X-Microsoft-Antispam-Message-Info:
	SmIFFpSw6yslPQ2UJsL6ODVYaH0AKg/Rb5oDdbm0MzeW2TKkxrejYuS1GKUzym9xbEX9bZoTiy+s4GfcPIc45KXOsuq0ZUtdHEeJevCmDD25f7VSGElWr5rMKTZtj8VVx3o5Sal5hH9zZ5v/4M8pPdcZbf6yVXrm8sRP5n5WmOw/NhJY+j4L0i87TDkZXbRB/VJ+wvZy0oB6QoC+FXvmW+/61AxOZPrHMB72vnxWZhNZqqVVR+S3n9ZkwGgrze/Kq4DI+2ecDaKUrYnojbSG2dc7gOiNvAYQ9vy2ulLaz/SbWw80Hz3coKuBNAwU1nLFtdjctQQtlDFUFVLxlvBcrjySzL5MqyMXsW5X1AyTsB9OGh1lBvK58yLWD67793kEYrH3J3yTIPpiVatXZEw4bfqh3ytrwpeciLuF3N6o3FvD7N37E7Y/YYjuK4Rit7nMse2PhVBZz0lL2TZFqtWFaujB168EjH5rvM5BWCf4w2JhNkxpx+LPa2932QN6qwcuVKADq+iXxTtg0JAGHC/UCANUKFBITqrtOOaTn7T306NXoDR7Ar0sVhzTSkfPc2nFzuRALSVCGx0oCSOd4kGMnw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(52116014)(366016)(1800799024)(376014)(7416014)(18002099003)(38350700014)(22082099003)(56012099006)(921020)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Oc3gy+8IIMgr0MHed0ndpVMYikx8DkLfem8ar+WJfld+HlxQDnmZLl7aoBj9?=
 =?us-ascii?Q?IsYMia0XW+g/HDEt5j2ILiJMdOU4xcRofb8SEoCgzeIWiUTaAjCHeIrfeLal?=
 =?us-ascii?Q?TdiYGUFV9HOcX1cH3KXvXM4sZMaaScSsWtNDMYauBJoh8uokB4FBDZD2G3mD?=
 =?us-ascii?Q?ANUlP+6/mqrYYqjpTNdMiDTZmqAu+KL5Q0DbxIgHx6BHPQ/i8nRzCqkYToeL?=
 =?us-ascii?Q?eK1uHQUxkwP/p71TMNTMY/2sxS6BWH4lCU5eTIeVbc0TTmat5HbmrQn/mJ6A?=
 =?us-ascii?Q?GmBJRvMXkiiecl/WUjJzH6QI+klNykFNOYqYUAmn4iMO26bNky26+2MFM5nD?=
 =?us-ascii?Q?1ifKjBQ4Ui1n2OacFhYJ1L4xIgzJIc4ZtDXqf5Dkbs6xG4SlajpNGxYYvkWu?=
 =?us-ascii?Q?T7VvnLZ+XYHFXwtFmfOmM2cgnvYLNq+YRkHZQVoEaaV9INAuDlmzk8gyk1lF?=
 =?us-ascii?Q?amUif1d1yjgB1GKqZ4IYXXDqL5o05fkoaGD/ZZ3OYQlXAprtI2V1wZDztCJm?=
 =?us-ascii?Q?YIrfcEC0NdfNLjHnXaZN6QUQxO1exeoEi64VhXmYYTVOpJoASc0TQFAdFHvd?=
 =?us-ascii?Q?p+4z0ukKd/3Trt2dSjvKjXf6+XXoU66HjnE3AQm1A6N9jw1sHlH2+Vqccmb+?=
 =?us-ascii?Q?CbNstj2jNJb54KUT3jGHIP8S4ysCb/z0+KWIQRY0XIbVJQ7heIF9m9sX/2N7?=
 =?us-ascii?Q?iPzh+K2N8CslCv+K8RRZ7Dx5RlRQSHtkMQlkkVK6HD4WWIhrJawtaTToq5Jl?=
 =?us-ascii?Q?W6O4slpFzaFNUzCB8qwB2RoWtzDxNGJFyYFpIST5INcKJuoYb2BdsuHVY43f?=
 =?us-ascii?Q?7OESCOSZMzPpcyPZzTk7FmfX6e4GNwi4wMlIabY3Tc8spLR1GMptCe+baJ4n?=
 =?us-ascii?Q?/OFWLewBZSXcSG57sAuCYVR82PUQmdfJoAdwfLfiubBs32JQcp4twwQ/YnnV?=
 =?us-ascii?Q?nsh0H919u5AXFhZrRYVxCtGjmQU4KEgG4HO14lKcLPSJQn398zK4vs2ZV4fO?=
 =?us-ascii?Q?vUDNq7Ihj3yX0xKAmZ3tpiGT88wTPxLw+KxiAHTwSnw3e5tVN7rXlxJ4GsQ8?=
 =?us-ascii?Q?6sLrPSy322Kd8USSO525SVgGq4jHuU5L/m/mYPfekYuxvE16JXRH0VaG3o7F?=
 =?us-ascii?Q?A1Vxjqv0XOy5t3ees54wjoX/lmFE+Bc+SZrT6psiJsHizDG1FwY5ks5O5w7Q?=
 =?us-ascii?Q?inRPIqiqWVZXhFaBlvKIhoC0ESwb6HC80RLuEIBqFaX1FT2FDqbCFVDWPuwU?=
 =?us-ascii?Q?MWG6aaiN/o++K4EQRzdCU/Zimw5quu/sA2SXI8hSiIXhaI2ipXkw0kZD0QSx?=
 =?us-ascii?Q?7W/17zjbLzXCYcRTRz0ehkenjtIpkhcxP7RyiTr7r6HC/DhUGmMc6NNYlzzv?=
 =?us-ascii?Q?TtrY4HKOGJLFEiuB4epVo1kpebCc6rUg1aDIOnA+rhIBF9YLyDdZ3tZwRTPY?=
 =?us-ascii?Q?VS93PCWVVTZE5Wz5o26vVonKG9x2R5JYtvTF9ujEI6TdR4VqkrLeLhUHumlk?=
 =?us-ascii?Q?7sd3PvRmiFqHGmFy5+1ZDXdhKmcMOtyyXCtuSGxWNCXfnzkq59qR5J9rNb5i?=
 =?us-ascii?Q?mLR01Fd/yxYG5n9KmTVyCoqDoxZ35OVKZjauQdhgcZBlPi/AMWMrEGmrZSaO?=
 =?us-ascii?Q?02apSF6tvfH6tFmKkXBfBQ7QmU3fGNzNxSad9AVyZc6ZCEWQvhdCwNrN0+XQ?=
 =?us-ascii?Q?wqKZZ+59qdF2AlyenyptmaiR6vgNLgo5pHcbFT/IDLJL8ZFKH8fZXQk0zWD8?=
 =?us-ascii?Q?Qw1xwzH8tUfwL+Uk2uMnvqCOQUBGTukWxNrD/+9srBZxSMQ3+C2X?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d19fafb8-0bf8-4352-e70c-08df075401c4
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 11:35:49.9290
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kzuOUTkwqoHTdPyKuo8Cs5/ucOv9Jgm9cTSz2EeJoeyAvgAPJCQwmDcC3T7QI61V2+fRLQufpVUw54/jMQXolJnETXuoySm77DecqS4iTOa41e1OppGTioGkiba7abZW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1332

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

