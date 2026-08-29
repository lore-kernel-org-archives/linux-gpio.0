Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2100.outbound.protection.partner.outlook.cn [139.219.17.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78F442931CB;
	Sat, 29 Aug 2026 02:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.100
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787972341; cv=fail; b=LmhNwfqjEQa6NKEBs8FS7Ew+Hb6x1NWok8XiST2qXq+/SRDs8lec1AfoeDn8xuhF4RjyiCblUBobC2ZFp1wnTOsbRbl1vTxT7fpxBL1W7e8RckumhneXa81rV5kmVpj4s9KIO/BkObSVwBgH8Q6mCKwm3hjA9irGITKkbea3QwQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787972341; c=relaxed/simple;
	bh=J/xLwg+VJll0koIIf6tQTGs8iOVmQFjDjoaq9PkWO1Q=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Rgk1G6B2UGHO6XVv74NKPge/SeVO4HuZiPEbg+m5ESlHTJ3wY7k6b4jyy5r3aXvaQ3GF7ARFZzx/YNfqzvec8qpG3DbScaIwOoAh3AsJqduH5u8Sy/JzPBkiqj8dvrcpez4WRwfIuKkirsVPBHDgzCvc6OF3eGV2/O8DdCJ9ZOw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H/AKvXQBSPLxWBCV9pLlZWgjFrhn/QlN2Zb4+TKezD10yDOG4bGIwi/QLfoSqx6hpAbolIsIbeSOBCeVt9mpOvBfXVHipGgSd1Xdp7iblZ7OB8/UnO2ukGOqeSGDyzzGjEYSQiNjxI3bmk01Xk5ePNosDV09JAS+X+ru+kVNtNtU5z2/VDPNbM9nrae5ctWW0KtVL8qtvTdTtm3m8KxPGjoijREKhTcYQxu5O3e79/qoHaHxll8cqlu2oRXSSU5hIO4Gg/F+2o5lNcoEkkyEIqzrJC8uazZI9F1r5GCLRQcBKzC31ExjvR4zeYbX615IHygUS1qLPpBiPFQYaeVW6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PTAoA/Pcq3DN9iSvwXFwXBLH8TJKbpyHP+dWZaHyTyM=;
 b=Q6h9znLRDEnIAEme345P65Rwxf0QOyR+wVTXHZxAdiZ6fxLBPmgAZ3ypEJPpqEHLxIZhUnxHsuX6LiStXbJyUXy6w96D23TbMJ+tTFlZSil223uAEo6iBQe/LUWtjaOK45Srv5jTvs5N6iOnBI+LySQEuvOdGfZoyBJrrDvnUIEoKHnNo1iiEDWz77X9pDlYP0YNfGcny8us0eKAv2XODU24rxPgK4sAe2qY98RH9y/MPUkptmagn4zvaY/h70PtdzrvM5Xdqpi4bgEIUc5Y4P8BVT9NyNfk151YjdYfjjYEZ/SX6igmdG1W9YT/2ZBA+tiTGtzZHXxYwr1Ex+8CIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1153.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:13::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.19; Sat, 29 Aug
 2026 02:57:46 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0315.011; Sat, 29 Aug 2026 02:57:46 +0000
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
Subject: [PATCH v6 09/21] dt-bindings: pinctrl: Add starfive,jhb100-sys2-pinctrl
Date: Fri, 28 Aug 2026 19:57:08 -0700
Message-Id: <20260829025720.23915-10-changhuang.liang@starfivetech.com>
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
X-MS-Office365-Filtering-Correlation-Id: 4ef9f7df-5d3d-40d3-d80d-08df05794d83
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|7416014|376014|52116014|3023799007|18002099003|22082099003|56012099006|6133799003|10067099003|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	0/3wRtQlniUOYOFBUEPDOdt2RKPP3StUe+ca439lHklvJg9DCUbanqGudIjuunibHNXIvccppcg4SdgVxsXmU9+QL8CpDbNM56GCVJg3vyDyJBTkKB86nuYD9wGecocDNZwJtVN+lk88SY3w9VPcBLU9jVU2CmdvZ/Jmt0iJdbSe/j42AEm/52COSzpNhIo5Lk9CmYQKMjEJ7fSobsyt4FNmo5E/EJh1AeMMNBbRdMV1rnXMPuPEUakvN/yd37SxyaXEEXt8JAlecRTypu1IDSQImdEhnzgV9CEyjBkvFnlywojEtrYRDDSRb5CNeU4d0ZZneb8BNZZRZXkY2Crr1LtG56fQ+estY5cYQBVC0csaAkRI08Gs90h2oCChv6A0UBgnoQKytfdY/N019p99lGCN+qwmq9Evl0VpjlWYQ6fEFSFFe3i9gxTLQHdhWo2agmDqKGgjskwQULJDzAEaWaMldrVcJQOl8Jwe+41CTf0xWzKU5LzomA8kGA40Pkyz1y9f+Ds9Fq+s6HGsIovDFMfGvsj+0NYwsU9TX2raCGje7V7VqmyYJfEVlQhBOGUxkgfHmJxwOyDGUyJXZF+0jw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(7416014)(376014)(52116014)(3023799007)(18002099003)(22082099003)(56012099006)(6133799003)(10067099003)(921020)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?e940lQHiWmb6D6n4TEgkILjkoNyBT6oIpZ6l0wUt0UjlD+pJtKrxuqUcj0f2?=
 =?us-ascii?Q?U42xYoI79YzfcfLVHnkSuAN9CLqEnLu4fVS3rr01y3mGgB8bo38HmrAEgYSf?=
 =?us-ascii?Q?tyAaGxy/ulkiaQHXKHBHxG2BiwlMxC6kMF7UeSe9H+SY+rs5NGmOKTbofLdq?=
 =?us-ascii?Q?iLvWOoD+ZA66isVnr71i++Z7K+hMWfBj/30W6YYkzyhVfR5qwz1ouQmRWhRz?=
 =?us-ascii?Q?IJwiEBxOvE0ACHglI6xn7OyBSxfXPJFXwoBJjdgLLOuzyPx/wGCRFG757iAG?=
 =?us-ascii?Q?wr068a0GimLpC2E1CS2kZdMX73SUQB+fnFAGNQ/Fpkif/dhTAyIvogxlpFw1?=
 =?us-ascii?Q?U49hqxFQjEySdFepMvusMBS2j6ENiWQRClEG3Jck6K7cftDN+9HiNRrrg2GB?=
 =?us-ascii?Q?5FImVlnc9tEWKAA9Lgva8nOAux8DGxtEiB8cmE0u34N5euq5cp8V2t74z8YM?=
 =?us-ascii?Q?PKGPmLCWLm2daTXWy1BmUnQEpaBzZba1NQQit5bFwlDkEGDPm6dO/EILQexY?=
 =?us-ascii?Q?sT6txQt10jP2UxptBuMKyx1t3jMhnKW3Lj3N6jjFH4e+IIS4t20fKm4BdvdX?=
 =?us-ascii?Q?NauyBjnJbKFpY7k/dZRpPrZU5QG9NptSdWjNHb7uz2DgHtGAERBe9jhWyUVF?=
 =?us-ascii?Q?UxtwmhnAiEyoPbh3QPcCmKTk1xVC5hQZqb/a2Yf0D11V5dIhfpGa2voiasM9?=
 =?us-ascii?Q?sSRdamFhoUvnqtXdKa4da0LSImyxdsl2Gz521yUTpHEmzzbc1t8QOidJqXXY?=
 =?us-ascii?Q?tSiy9R+B+MmvNNZE62JOKuV2rhqEI1+UkjhnQvq5tLgly4qNty8/M2i+tycC?=
 =?us-ascii?Q?CkfcBM9N5fxPrvOMsY6nZONaePoGL6Mqc/D6u3EMFSNJ2vS+tHHMBejkBBoi?=
 =?us-ascii?Q?Hmn5CT25wOmIprj34zo2kgklBAB3jkUHuxaW/c8dtGrvwZSh8JVnqpIEPG/S?=
 =?us-ascii?Q?F05AmScFzQ//A2kTkj8L7UtRCPftKxkq0I0734aLYVXr6k9uW4qRzYnOPkaZ?=
 =?us-ascii?Q?9kEwawkCiAR8jV2adF77Uz+o9tWgHgYIRU92Cc0o7DhVSgSEevs4xWq7kKC0?=
 =?us-ascii?Q?Lxop0SCVNFxu8lIcq/ksSl5GSVHa/pS5U6b8i4NxKoUVVXVIrPJPw2Ik6tEC?=
 =?us-ascii?Q?s7PyfyRvu3A2YDeAexrcIGctx/oz60jb5to9VesYmRW+9UBHkhLWpjtExH/m?=
 =?us-ascii?Q?LcycgVkjGMIKn87PDSs/UHWUNYOQvdsNK3Nz3mhalwaKbDJqd5oCwEbDRcLL?=
 =?us-ascii?Q?aA4XM88qO0++MbvlzYbhAbHesYQWMWkCXjQDTlMjxo0vpx5BFrkq96txSlCA?=
 =?us-ascii?Q?nmMfs9E6BNxN91ykXYrTjAlHw/EXW8ZJQAd6b5QhKpLlJf/EO6gWZzqvqs12?=
 =?us-ascii?Q?Lc7b+cRb3bpNfQCpzvuTh7rbZfzH7cWK5+pxy4NGgEWVJ4wxpt7zLZNl7ErH?=
 =?us-ascii?Q?Y9gjNys5v4PnVAlwVlDOkMmAIHGExJSKosB5syNuQvqdyebJjhRtMwnuwIzG?=
 =?us-ascii?Q?UfUV8z7Lg7GYGuKZSmLQPQ+5kqqOPXJM4qMs6VGCEmF5uSvtj0J+n+pfEvZB?=
 =?us-ascii?Q?CPaekNSG8UCdsJEOJ67rSFhuqRPckaqH5IOGrtkj15lkbrm8RwupD34otqzH?=
 =?us-ascii?Q?0EaG68yaVabJ6kET2nmk+4tNRlGCndW8L1qlNYAvpGgyp+be3BO24QehXYQ5?=
 =?us-ascii?Q?pTwJFqMUzG2htPFDxsYiO4ABXRqOpL+zeRxNFmpbPgjMZmxN+F8HdAvJup8M?=
 =?us-ascii?Q?bTwgpnpv1xgBfbKNzrOCqS6FJIVni/vo2f2dK5Pu0QZfd6xJDjQk?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ef9f7df-5d3d-40d3-d80d-08df05794d83
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2026 02:57:46.0518
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nHZNHxjuoSpim9rSkGs8SiRtZGBNNYC6mWEJalZ7lt/Z42Zac0fgWjoQplBYdrtGNiUMMkK8gkSVqB9bEoSxTfiCKr7NL/uVXwrlKPijbQpGRDHz+9QiMyCCqpbOjmt4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1153

Add pinctrl bindings for StarFive JHB100 SoC System-2(sys2) pinctrl
controller.

On the StarFive JHB100 SoC, every 32 GPIOs correspond to one register
address. Therefore, under this model, every 32 GPIOs can be regarded
as one GPIO instance. In this case, the following new approach can be
used to represent this model:

gpios = <&gpio [instance] offset flags>;
gpio-ranges = <&pinctrl [gpio_instance] gpio_offset pin_offset count>;

At the same time, this model also reduces the /32 and %32 operations
in the driver.

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 .../pinctrl/starfive,jhb100-sys2-pinctrl.yaml | 166 ++++++++++++++++++
 .../pinctrl/starfive,jhb100-pinctrl.h         |  39 ++++
 2 files changed, 205 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys2-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys2-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys2-pinctrl.yaml
new file mode 100644
index 000000000000..5b9b2b8c71ae
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys2-pinctrl.yaml
@@ -0,0 +1,166 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/starfive,jhb100-sys2-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: StarFive JHB100 System-2 Pin Controller
+
+description: |
+  Pinctrl bindings for JHB100 RISC-V SoC from StarFive Technology Ltd.
+
+  The JHB100 SoC has 13 pinctrl domains - sys0, sys0h, sys1, sys2, per0, per1,
+  per2, per2pok, per3, adc0, adc1, emmc, and vga.
+  This document provides an overview of the "sys2" pinctrl domain.
+
+  The "sys2" domain has a pin controller which provides
+  - function selection for GPIO pads.
+  - GPIO pad configuration.
+  - GPIO interrupt handling.
+
+  In the SYS2 Pin Controller, there are 37 multi-function GPIO_PADs. Each of
+  them can be multiplexed to different hardware blocks through function
+  selection. Each iopad has a maximum of up to 4 functions - 0, 1, 2, and 3.
+  Function 0 is the default function which is the GPIO function.
+  Function 1, 2, and 3 are the alternate functions or peripheral signals that
+  can be routed to the iopad. The function selection can be carried out by
+  writing the function number to the iopad function select register.
+
+  Each iopad is configurable with parameters such as input-enable, internal
+  pull-up/pull-down bias, drive strength, schmitt trigger, slew rate, input
+  debounce nanoseconds, power source.
+
+maintainers:
+  - Changhuang Liang <changhuang.liang@starfivetech.com>
+
+properties:
+  compatible:
+    items:
+      - const: starfive,jhb100-sys2-pinctrl
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  interrupt-controller: true
+
+  '#interrupt-cells':
+    const: 3
+
+  gpio-controller: true
+
+  '#gpio-cells':
+    const: 3
+
+  gpio-ranges: true
+
+  gpio-line-names: true
+
+patternProperties:
+  '-grp$':
+    type: object
+    additionalProperties: false
+    patternProperties:
+      '-pins$':
+        type: object
+        description: |
+          A pinctrl node should contain at least one subnode representing the
+          pinctrl groups available in the domain. Each subnode will list the
+          pins it needs, and how they should be configured, with regard to
+          function selection, bias, input enable/disable, input schmitt
+          trigger enable/disable, slew-rate, input debounce nanoseconds,
+          power-source and drive-strength.
+        allOf:
+          - $ref: /schemas/pinctrl/pincfg-node.yaml
+          - $ref: /schemas/pinctrl/pinmux-node.yaml
+        additionalProperties: false
+
+        properties:
+          pins:
+            description:
+              The list of IOs that properties in the pincfg node apply to.
+
+          function:
+            description:
+              A string containing the name of the function to mux for these
+              pins.
+            enum: [ gpio, host0_port80, host1_port80, jtag, smbalert, uart ]
+
+          bias-disable: true
+
+          bias-pull-down:
+            type: boolean
+
+          bias-pull-up:
+            type: boolean
+
+          drive-strength:
+            enum: [ 2, 4, 8, 12 ]
+
+          drive-strength-microamp:
+            enum: [ 2000, 4000, 8000, 12000 ]
+
+          input-debounce-ns:
+            minimum: 0
+            maximum: 10485680
+            description:
+              Debounce time in nanoseconds. The hardware counts in 80 ns
+              stages with a 17-bit counter, so the maximum is 10485680 ns.
+
+          input-disable: true
+
+          input-enable: true
+
+          input-schmitt-enable: true
+
+          input-schmitt-disable: true
+
+          power-source:
+            enum: [ 1800, 3300 ]
+            description: I/O voltage in millivolt.
+
+          slew-rate:
+            enum: [ 0, 1 ]
+            default: 0
+            description: |
+                0: slow
+                1: fast
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - interrupt-controller
+  - '#interrupt-cells'
+  - gpio-controller
+  - '#gpio-cells'
+  - gpio-ranges
+
+additionalProperties: false
+
+examples:
+  - |
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        pinctrl_sys2: pinctrl@13082000 {
+            compatible = "starfive,jhb100-sys2-pinctrl";
+            reg = <0x0 0x13082000 0x0 0x1000>;
+            interrupts = <59>;
+            interrupt-controller;
+            #interrupt-cells = <3>;
+            gpio-controller;
+            #gpio-cells = <3>;
+            gpio-ranges = <&pinctrl_sys2 0 0 0 32>,
+                          <&pinctrl_sys2 1 0 32 5>;
+        };
+    };
diff --git a/include/dt-bindings/pinctrl/starfive,jhb100-pinctrl.h b/include/dt-bindings/pinctrl/starfive,jhb100-pinctrl.h
index 30704a5a3418..e701c30913ce 100644
--- a/include/dt-bindings/pinctrl/starfive,jhb100-pinctrl.h
+++ b/include/dt-bindings/pinctrl/starfive,jhb100-pinctrl.h
@@ -38,4 +38,43 @@
 #define PADNUM_SYS1_GPIO_A22				6
 #define PADNUM_SYS1_GPIO_A23				7
 
+/* sys2 pad numbers */
+#define PADNUM_SYS2_GPIO_A24				0
+#define PADNUM_SYS2_GPIO_A25				1
+#define PADNUM_SYS2_GPIO_A26				2
+#define PADNUM_SYS2_GPIO_A27				3
+#define PADNUM_SYS2_GPIO_A28				4
+#define PADNUM_SYS2_GPIO_A29				5
+#define PADNUM_SYS2_GPIO_A30				6
+#define PADNUM_SYS2_GPIO_A31				7
+#define PADNUM_SYS2_GPIO_A32				8
+#define PADNUM_SYS2_GPIO_A33				9
+#define PADNUM_SYS2_GPIO_A34				10
+#define PADNUM_SYS2_GPIO_A35				11
+#define PADNUM_SYS2_GPIO_A36				12
+#define PADNUM_SYS2_GPIO_A37				13
+#define PADNUM_SYS2_GPIO_A38				14
+#define PADNUM_SYS2_GPIO_A39				15
+#define PADNUM_SYS2_GPIO_A40				16
+#define PADNUM_SYS2_GPIO_A41				17
+#define PADNUM_SYS2_GPIO_A42				18
+#define PADNUM_SYS2_GPIO_A43				19
+#define PADNUM_SYS2_GPIO_A44				20
+#define PADNUM_SYS2_GPIO_A45				21
+#define PADNUM_SYS2_GPIO_A46				22
+#define PADNUM_SYS2_GPIO_A47				23
+#define PADNUM_SYS2_GPIO_A48				24
+#define PADNUM_SYS2_GPIO_A49				25
+#define PADNUM_SYS2_GPIO_A50				26
+#define PADNUM_SYS2_GPIO_A51				27
+#define PADNUM_SYS2_GPIO_A52				28
+#define PADNUM_SYS2_GPIO_A53				29
+#define PADNUM_SYS2_GPIO_A54				30
+#define PADNUM_SYS2_GPIO_A55				31
+#define PADNUM_SYS2_GPIO_A56				32
+#define PADNUM_SYS2_GPIO_A57				33
+#define PADNUM_SYS2_GPIO_A58				34
+#define PADNUM_SYS2_GPIO_A59				35
+#define PADNUM_SYS2_GPIO_A60				36
+
 #endif
-- 
2.25.1

