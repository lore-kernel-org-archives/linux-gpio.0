Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11020142.outbound.protection.outlook.com [52.101.84.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93D7D3E5A0E;
	Mon, 27 Jul 2026 07:44:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.142
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785138244; cv=fail; b=SS7BycdhKU6AJ7OYorsnHd/2Zv6N3Eini7Pc/BVxror8knExVH1ctZXVE2zAp4GkErpXkhShdkmsOqXkvLI6de6MABB9CJzdGQzJPcJs3qo4unqw6Yi70bQ60kgQC8NGN7HzocKR9JwZdGws6EVxKXDJMUYy9bAXdh2FTgJ9bc8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785138244; c=relaxed/simple;
	bh=8KaDEP6EDMm3QgmBPRH5wFS0Gpt1hpJ3QSlA8DwLuOw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=P2ijGt5BNopCGrbajTZE3SJZQlzd4BanM7wTHioy9BX5EvGiX+j5O+7Yfah+4Zt93K8rxANTlncJEENawCiLwSM5yM/LX88Zwoq3/YX9Z6mTEtatt2TSOOgUVr/ZdXixebESxiHbFgHVm1jraySyp7kl1NUCP/LKDy8yxg3qXY8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b=5qdeVa3/; arc=fail smtp.client-ip=52.101.84.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=genexis.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b="5qdeVa3/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tvi2yzn7joiqOenZVMw6aCDCcYCJq6uYKHxXhkVgka5noVVUYLQoLJJBx/cos1FGP4RGBVO66wMoC651tTZiWHFlAOwAOtAHkB+A159wA1kHmSd/L9Z8Q8Ymlx/3acXTtu9FKEu8C4qE/oT/MpjvLCesiqOCYE2yj8JsdfzE1IMXOTZLs1zMvqpm6U19Syu+Ds9ffk4rjceBIOAQOmzMbFn2Wx8aItil6jR1IeqbCr2FbT/vQ+MokGC/dUx53LJ0PIvfMckQwnNdFPdwS7N8t5cW6FU8/85yaUmHWO7mBpTZPENeBADy7oVmAzpqk9WCLIXqWGgDo2uQ3nb/AnpTeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=robBuPXmrJ2qY09qM1jH0W9prIrveTCRQzGFQkGA8rg=;
 b=ycbjZA9CfqZ3rf1Ygj3eBRYbMgJf6sH8IipQlFTG7+yuXkl8cmzhkZ/idWt0QfXSxyB5djH6wkwCpBV9XoJgx3r9Zzj97WewoxcbmaXsp1XhnA27HvT+V86ZSVxXwOC8Z7MLEnPVoDSVmpflp+EZKaGVDJH59zxkL6CgbIujQCizFQ/BIuewwx5dqxsX0GPjIE19u37rQx6I06wWjLPqGJEsRrUIX92aty1Zxv09iIMHBAIjNNX6O4mpMZBBSyYDymM5bQ+hT2SXf1iJjG23mjSf6LIfZAQxDwS8Boki65WGYwyiaHJREzSoSuTr/XDrDOgGwPvfAUXG3rSfV3UCww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=robBuPXmrJ2qY09qM1jH0W9prIrveTCRQzGFQkGA8rg=;
 b=5qdeVa3/F4ORMc6HEe3ojATapgEqDwCezyF3DrRgF7VCMNzzMlJDJjPTWRpGG2F8ZXt21NGLM2w9bWp55EMMh3PFdHkzC63KvNfkJleErI15IPjL0ORNZAyNCYfpGoyty/w5Z5YnQ2bxfEVi5OoULtIgz3RTirYCebR2GutIgtd8v3WpdMYDrhNx1zoljesVbB2ntN05SWzgObSp9JfzniXa/ga7Aio5g/21bcRFNT4VzU88kStajYLEyG0j7EyDHYNMzcAVOS2JL9d3Vpukoa8BBxzMl4KYBev4L1xLWubs4IIV/jNT3yCzENLR/5Xp5nOkDm2IaTpjLDw/e2sBng==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by FRZPR08MB11139.eurprd08.prod.outlook.com (2603:10a6:d10:13b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Mon, 27 Jul
 2026 07:43:53 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0245.012; Mon, 27 Jul 2026
 07:43:53 +0000
From: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
To: Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Benjamin Larsson <benjamin.larsson@genexis.eu>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Markus Gothe <markus.gothe@genexis.eu>,
	Matheus Sampaio Queiroga <srherobrine20@gmail.com>
Cc: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Subject: [PATCH v7 34/34] dt-bindings: pinctrl: airoha: add support of an7563 pin controller
Date: Mon, 27 Jul 2026 10:42:34 +0300
Message-ID: <20260727074234.3761170-35-mikhail.kshevetskiy@iopsys.eu>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260727074234.3761170-1-mikhail.kshevetskiy@iopsys.eu>
References: <20260727074234.3761170-1-mikhail.kshevetskiy@iopsys.eu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR5P281CA0051.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f0::20) To DU2PR08MB10037.eurprd08.prod.outlook.com
 (2603:10a6:10:49a::20)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR08MB10037:EE_|FRZPR08MB11139:EE_
X-MS-Office365-Filtering-Correlation-Id: 657ff6d6-7f09-4e8e-ce78-08deebb2ce19
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|52116014|366016|376014|7416014|11063799006|56012099006|10067099003|6133799003|3023799007|22082099003|18002099003|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	PjTM4+mBSn2KoKkztwggx/eHdv9IAODxws/+frtktxmlakP44bvemt2IyJ+aZ7ys7SDP7MvdMBA3XGjSIqQcUQqrJ2YP97IDiCnlC3xhBmGZZQPRqNcWbitCpYI+31BaBIIrVxOZkWMZ3DnIvJTgGa7Ev3WjQk+kXO8gQDjwlFjj2u3i9+B3JgtQqSwNIhYdv/R3mJTuaonBOOlBnZY0WOyi/d36jHnpvLs+0HW84SSwSLB8Thb2X/OhCMySvfrcSm4bkuKWThs/DRMlee7DHqEI5pmeIH7Wg8wkk9IfJN1eZwy5PTYui+UYzTSzf/SrJr9S/hRKy6tzbPQVNJHVERTHYZze0TguicDADYBWbJ3aFO52G2uBbbz5G98FdqBiZ5JP19p0O/8lWGVPOFJTliYJZ2/qQq90wI7WZ1PHCuK3lpemruUHZDEKSzuZf/grPTwsdDBrZXjQbxCsC/xzJSEsjksYXXZab1yt0h1i+trV2ySRAsgAQ3BZXrpH/m+sWhOJmg5LDTMx/YoMrmfFj5DUUNapP4ZnDUWfBCsn7E8htjbW3NS/ZyKWcn0Ofk5ouOjQZpctSMaNEu8Ffau+IMFmIsU0l6BT1pZP/UoQ+MvqDDOnRgE5dgmbJkC5jJIBcwip5IHdmhtWsKkSqCbzkipwjlrHDvEzoy8G96LyOJf1b4+iDlgy/qVsmUUTaseX
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(52116014)(366016)(376014)(7416014)(11063799006)(56012099006)(10067099003)(6133799003)(3023799007)(22082099003)(18002099003)(38350700014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?YX1czeyYSun82XY9Ku+ca6YhrYwOeSePIWjbAvjJpYtn7FefYYk1AdLe0vn0?=
 =?us-ascii?Q?yDavEgJ6RqyRacQ9cUjErhsJKJJxleDxHjueKtfjEUyrcEqLbKfIaJbry7b0?=
 =?us-ascii?Q?PbnLuhSJcanPV15/CmIdL1LbtJM+eJJtij2/9xWbGSr1ACbAZV6ylQpQRFxJ?=
 =?us-ascii?Q?yE/whwZBDz//QgtKA2C4Z6jq3RvU4ArIU7NMxx8fTQUFnvMkx3GJijlibZGw?=
 =?us-ascii?Q?kZn4dGeVzCOBNeHR6FgB5u2HD6VobxTP+E59bGuElxrLV5mjrQTR/enJBfpK?=
 =?us-ascii?Q?7SzIPda5WfKaxfv+gfE8PoFPLW80qsO2YozKmM3gfV5UefvKE72DSkYAnA6/?=
 =?us-ascii?Q?jYA4HWrkxbuPaC7WuCUbz8VhpegixMgVNP7wJodNSG4T/mPTgONeWqtLPoOH?=
 =?us-ascii?Q?iQQCWTc8LJGxyLNG7fKC+PUaaEUvtNlysuLea+O6jRtCm+bzeeQYmeeHpnPW?=
 =?us-ascii?Q?sh00jpLO6EPrN3uGFswcDXBwJC2HQPVeZu0JvvZ5Pl868MwAByzzIDFNmMLg?=
 =?us-ascii?Q?oF6oMaKQx31tcXvqfRbaoSqJ4YKKUGmw0AySjaAV8MNUsHzHAVOQYqApXRLI?=
 =?us-ascii?Q?CLU4k0yULWq5HH6zyEf2WA+d5IEUaA03KO+OdxHOcvW1b/T/2Hr+EyK1zsnc?=
 =?us-ascii?Q?5SRpDFg7vaj4LcjRW5y+f7zmlc+oIZYYzwD0X0eFUA3veyJqJhq6AnIafMBY?=
 =?us-ascii?Q?UFPBQyO2t5K4BGbmZNuOxCfIcjfub81fH5GLXrXIx/IT5ykjCDZW1uSZdoey?=
 =?us-ascii?Q?uE/PsqC9VfFkIlocGZ66feqJlj75+BjbFMHxIAR4tD15OhsNvng52LE3mugD?=
 =?us-ascii?Q?rpEyPuv2YtdGzhYZ0lAO1lcWU/p1rL7asaMu9XshvuYlNBRsMkXc8VNJT+C8?=
 =?us-ascii?Q?9g+eHtORcu933jgl8s6qk1MrT0nCcWk5MSR5lJScnSXImFhJuddyfb0myXYg?=
 =?us-ascii?Q?lJmRgo+Vz6MZ7M5Bml0z1LEVyDJ4z5gFsjwT9eRuYybtPL1Jz9cz1EeIh4IG?=
 =?us-ascii?Q?WpxcgzzYFDxsOO5+6+ur/ajyi0X6GsnilYsqE7VCphIq7x9EHP1grCAjITDz?=
 =?us-ascii?Q?YIquGZev30xfUhpSxqHp7v3He+bRuXEz5as3YyQrg5W/faDfFtNM7AuBozAg?=
 =?us-ascii?Q?OelKW4vCIc8rjzwVjJah5o7c6jyMl+qRUNAOnDKjWJX5hbaYR7kTJUBC6RC+?=
 =?us-ascii?Q?3W1hirZpXm2Lh7oB8e9yzyHrg44i91WLeoACebMCwwX6HHr/f93RhvuxP1hY?=
 =?us-ascii?Q?jL3toj1MZlQJGy4NpLkcsNXuCiHv8tLL8jr5195rdmKsuUOhRMe+S/cJx8ox?=
 =?us-ascii?Q?8KLBsEZeaCP/rnA2xRX5oOjhQhb1/qFpn4w95k/YiHSuDB/aK2sQs8sVT8/z?=
 =?us-ascii?Q?kmdSlDB7lP9gtRz978L1YYDUSlDyBXwKr0StJbUFADf88vvasEAy6N9AOoRd?=
 =?us-ascii?Q?nl/WkF8A3eiCYG3LfVqwh3mkCxtBpEISrc3VBaRPNWfVvBNk035NGJvrQ+R0?=
 =?us-ascii?Q?j3UyijTrw0xxjxAl3CqYuXHHtDd2PMEeZteq7n2efRnE0Xz1gfWHEwsAlMAq?=
 =?us-ascii?Q?TfhA9SD+/VX35VF7ZmXED7uCuaJn47nhDMeBVW8YIrrQ3SkmXuT1nxsjRiB2?=
 =?us-ascii?Q?NPnf7WRHW814vVIbn+Y7ngPTkf+lr1smTROM0b0zdZc0AAi/6trzpe0Ex6Vw?=
 =?us-ascii?Q?/5vuoPWr4Ah7gNoo8hdSE9309LxKzcjh99tzajEpW7aFy85MlnorMekaOoup?=
 =?us-ascii?Q?igJpYeZNmho7hbAmV9qgjNJkBIDclYU=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 657ff6d6-7f09-4e8e-ce78-08deebb2ce19
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 07:43:53.0009
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fpD6sJDhvGl0J4oI5+KtXQqjSTL4tqx5LsuuDve7iubksABw0rQqe2jW/DF61CdKboIIEcx2IVrj5NJCRHzAZGExPjwAs7OhdumXQoYqQ4c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRZPR08MB11139

This patch adds device tree binding schema for Airoha AN7563 SoC pin
controller.

Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
---
 .../pinctrl/airoha,an7563-pinctrl.yaml        | 348 ++++++++++++++++++
 1 file changed, 348 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/airoha,an7563-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/airoha,an7563-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/airoha,an7563-pinctrl.yaml
new file mode 100644
index 0000000000000..e626d34661285
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/airoha,an7563-pinctrl.yaml
@@ -0,0 +1,348 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/airoha,an7563-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Airoha AN7563 Pin Controller
+
+maintainers:
+  - Lorenzo Bianconi <lorenzo@kernel.org>
+
+description:
+  The Airoha's AN7563 Pin controller is used to control SoC pins.
+
+properties:
+  compatible:
+    const: airoha,an7563-pinctrl
+
+  interrupts:
+    maxItems: 1
+
+  gpio-controller: true
+
+  '#gpio-cells':
+    const: 2
+
+  gpio-ranges:
+    maxItems: 1
+
+  interrupt-controller: true
+
+  '#interrupt-cells':
+    const: 2
+
+allOf:
+  - $ref: pinctrl.yaml#
+
+required:
+  - compatible
+  - interrupts
+  - gpio-controller
+  - "#gpio-cells"
+  - interrupt-controller
+  - "#interrupt-cells"
+
+patternProperties:
+  '-pins$':
+    type: object
+
+    patternProperties:
+      '^mux(-|$)':
+        type: object
+
+        description:
+          pinmux configuration nodes.
+
+        $ref: /schemas/pinctrl/pinmux-node.yaml
+
+        properties:
+          function:
+            description:
+              A string containing the name of the function to mux to the group.
+            enum: [pon, sipo, mdio, uart, jtag, pcm, spi, pnand, gpio,
+                   pcie_reset, pwm, phy1_led0, phy2_led0, phy3_led0,
+                   phy4_led0, phy1_led1, phy2_led1, phy3_led1, phy4_led1]
+
+          groups:
+            description:
+              An array of strings. Each string contains the name of a group.
+
+        required:
+          - function
+          - groups
+
+        allOf:
+          - if:
+              properties:
+                function:
+                  const: pon
+            then:
+              properties:
+                groups:
+                  enum: [pon]
+          - if:
+              properties:
+                function:
+                  const: sipo
+            then:
+              properties:
+                groups:
+                  enum: [sipo, sipo_rclk]
+          - if:
+              properties:
+                function:
+                  const: mdio
+            then:
+              properties:
+                groups:
+                  enum: [mdio]
+          - if:
+              properties:
+                function:
+                  const: uart
+            then:
+              properties:
+                groups:
+                  items:
+                    enum: [hsuart, hsuart_cts_rts]
+                  maxItems: 2
+          - if:
+              properties:
+                function:
+                  const: jtag
+            then:
+              properties:
+                groups:
+                  enum: [jtag_udi, jtag_dfd]
+          - if:
+              properties:
+                function:
+                  const: pcm
+            then:
+              properties:
+                groups:
+                  enum: [pcm1, pcm2]
+          - if:
+              properties:
+                function:
+                  const: spi
+            then:
+              properties:
+                groups:
+                  items:
+                    enum: [spi_quad, spi_cs1]
+                  maxItems: 2
+          - if:
+              properties:
+                function:
+                  const: pnand
+            then:
+              properties:
+                groups:
+                  enum: [pnand]
+          - if:
+              properties:
+                function:
+                  const: gpio
+            then:
+              properties:
+                groups:
+                  enum: [gpio28, gpio29, gpio30, gpio31, gpio32,
+                         gpio33, gpio34, gpio35, gpio36, gpio37]
+          - if:
+              properties:
+                function:
+                  const: pcie_reset
+            then:
+              properties:
+                groups:
+                  enum: [pcie_reset0, pcie_reset1]
+          - if:
+              properties:
+                function:
+                  const: pwm
+            then:
+              properties:
+                groups:
+                  enum: [gpio0, gpio1, gpio2, gpio3, gpio4, gpio5, gpio6,
+                         gpio7, gpio8, gpio9, gpio10, gpio11, gpio12, gpio13,
+                         gpio14, gpio15, gpio16, gpio17, gpio18, gpio19,
+                         gpio20, gpio21, gpio22, gpio23, gpio24, gpio25,
+                         gpio26, gpio27, gpio28, gpio29, gpio30, gpio31,
+                         gpio36, gpio37]
+          - if:
+              properties:
+                function:
+                  const: phy1_led0
+            then:
+              properties:
+                groups:
+                  enum: [gpio8, gpio9, gpio10, gpio11]
+          - if:
+              properties:
+                function:
+                  const: phy2_led0
+            then:
+              properties:
+                groups:
+                  enum: [gpio8, gpio9, gpio10, gpio11]
+          - if:
+              properties:
+                function:
+                  const: phy3_led0
+            then:
+              properties:
+                groups:
+                  enum: [gpio8, gpio9, gpio10, gpio11]
+          - if:
+              properties:
+                function:
+                  const: phy4_led0
+            then:
+              properties:
+                groups:
+                  enum: [gpio8, gpio9, gpio10, gpio11]
+          - if:
+              properties:
+                function:
+                  const: phy1_led1
+            then:
+              properties:
+                groups:
+                  enum: [gpio4, gpio5, gpio6, gpio7]
+          - if:
+              properties:
+                function:
+                  const: phy2_led1
+            then:
+              properties:
+                groups:
+                  enum: [gpio4, gpio5, gpio6, gpio7]
+          - if:
+              properties:
+                function:
+                  const: phy3_led1
+            then:
+              properties:
+                groups:
+                  enum: [gpio4, gpio5, gpio6, gpio7]
+          - if:
+              properties:
+                function:
+                  const: phy4_led1
+            then:
+              properties:
+                groups:
+                  enum: [gpio4, gpio5, gpio6, gpio7]
+
+        additionalProperties: false
+
+      '^conf(-|$)':
+        type: object
+
+        description:
+          pinconf configuration nodes.
+
+        $ref: /schemas/pinctrl/pincfg-node.yaml
+
+        properties:
+          pins:
+            description:
+              An array of strings. Each string contains the name of a pin.
+            items:
+              enum: [gpio0, gpio1, gpio2, gpio3, gpio4, gpio5, gpio6, gpio7,
+                     gpio8, gpio9, gpio10, gpio11, gpio12, gpio13, gpio14,
+                     gpio15, gpio16, gpio17, gpio18, gpio19, gpio20, gpio21,
+                     gpio22, gpio23, gpio24, gpio25, gpio26, gpio27,
+                     pcie_reset0, pcie_reset1, i2c_scl, i2c_sda, spi_clk,
+                     spi_cs, spi_mosi, spi_miso, uart_txd, uart_rxd]
+            minItems: 1
+            maxItems: 38
+
+          bias-disable: true
+
+          bias-pull-up: true
+
+          bias-pull-down: true
+
+          input-enable: true
+
+          output-enable: true
+
+          output-low: true
+
+          output-high: true
+
+          drive-open-drain: true
+
+          drive-strength:
+            description:
+              Selects the drive strength for MIO pins, in mA.
+            enum: [2, 4, 6, 8]
+
+        required:
+          - pins
+
+        additionalProperties: false
+
+    additionalProperties: false
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    pinctrl {
+      compatible = "airoha,an7563-pinctrl";
+
+      interrupt-parent = <&gic>;
+      interrupts = <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>;
+
+      gpio-controller;
+      #gpio-cells = <2>;
+
+      interrupt-controller;
+      #interrupt-cells = <2>;
+
+      pcie1-rst-pins {
+        conf {
+          pins = "pcie_reset1";
+          drive-open-drain = <1>;
+        };
+      };
+
+      pwm-pins {
+        mux {
+          function = "pwm";
+          groups = "gpio18";
+        };
+      };
+
+      spi-pins {
+        mux {
+          function = "spi";
+          groups = "spi_quad", "spi_cs1";
+        };
+      };
+
+      hsuart-pins {
+        mux {
+          function = "uart";
+          groups = "hsuart", "hsuart_cts_rts";
+        };
+      };
+
+      mdio-pins {
+        mux {
+          function = "mdio";
+          groups = "mdio";
+        };
+
+        conf {
+          pins = "gpio2";
+          output-enable;
+        };
+      };
+    };
-- 
2.53.0

