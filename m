Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2097.outbound.protection.partner.outlook.cn [139.219.17.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A791733F585;
	Sat,  1 Aug 2026 09:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.97
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785574884; cv=fail; b=rilkCMp3b4TxDQStC14+zh9HFPrkzaje8+nkmeiLCZhsMioOsNfdjMlfVpb4KT41D+mf+80SAKBdjnpnZ5F2XFj6U0Z7zFlkgAjBns8xRZWL5JO0qjltsL0EoOEmwjUQ5POOHCtc16mIko7Fmv4RN4opK6tTY+LGsklc5eclxUk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785574884; c=relaxed/simple;
	bh=ElblwLcsUaqFWcKAwMh+ALTUh2sO/73SNridqro60hA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=YQMCPnwxLmh9mnmd5pSrz1bldeLwCLZQDv+8sTWJUJGKbZ0fyvLto2XFmaFILkf3qPHuIk/0FDYcaIUvPYLIH4NJR9u4wseNbF2xHvJ1Vm4SUqs0aDGuDAqsIB/Hw6fWr63p+WNWicpKDZZ26i0gQ7o7paIXsqjso8laJkgATjo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PBIHwB6TbikrhffuE1dmEvFfQTbpKXRTCIOiWFFm0ZaC1LJ1SUnaKAc7EQlSQNx2JIewUDcH7goq20bRr13D/55Z4i6r2acpj45EN6cvJEyqHo8OseGXWZJPe50tDmeyX9dzWQkSh58Vg8IoTMqA502jqg9F1dfe6vVa6ZZpVdhbzMdOLqPLseCOnAX30Xbw8fGXC7N8DoALvR2hxZH3A9qgZmZbXjLcY8P6ejJ7zeFLa6MruQa+pI49DXZYBFsJCA3LGQ3QVf0FSuVM91Tp8jsH3EecvZKdT9oXsc4M4dsih26NMUQLKn8+3nHXcD/CsV+dUtBSPOZJPvV59iuipA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I8IAgksq9nLKx4OeDWED9/P9Ksbh4DBZDlECTAYlemo=;
 b=ZHYRpUWQx4sbIH07K9X2OW02JmBV7ZfA+y0ff6hq8a59GtyzdmiOJjwNSr42P4xgsWBtnfjmvvauefvtea+SPtt4yJLIkBi1JarUUw2Uxj+ZrhHEccwpjv42KzXTWNj4vHb+gHNOpi2L4ZyMnJS41CsbD2RmSw8rLVJ8GxybEd/An37+a6P7P0ldgWISGyegKDwbbnDSX1NwKh9dNhM8pa+It+t7T29SbpctABeBbzC4Upy5pT5O0esGlPKqsPuAz525lJWHXA6h0jjvWDb9Q8HyXoYZGONSVmmbCKWJbvEftDxPs0N+1T075X4YpypVidDCuYvEHTU1e26xFE1cAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1138.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.16; Sat, 1 Aug
 2026 07:27:40 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0270.015; Sat, 1 Aug 2026 07:27:40 +0000
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
Subject: [PATCH v4 15/21] dt-bindings: pinctrl: Add starfive,jhb100-per2-pinctrl
Date: Sat,  1 Aug 2026 00:27:05 -0700
Message-Id: <20260801072711.153217-16-changhuang.liang@starfivetech.com>
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
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1138:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f274d53-5fb0-4bcb-5ce6-08deef9e5e7e
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|376014|366016|23010399003|1800799024|6133799003|56012099006|3023799007|18002099003|22082099003|10067099003|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	g5adiciMG+13f/WIyWrdsI1rorMNIU7dmPh4SZ8fOjYGuJnL8waYJD8lA+lqYxWd1eCe7E3Fg7cKf5Y2SRvt2xAbahId8h750KQWwHoaz+YkwSJ850iUNjjTZ0B30Dw+bYIZW4P1R40sb7T+MCe7KJA/LspySsH/2Gz14V6qjscSMXyTW6ZRfvWfn2h4S7nbd9VB29H6ltcOfRUZbZkTzqjP+0pUZQAwkRedoV2KxFA1B+ERG2ZbNvbTxphens9dI99YRkO9OrKqYI540QysGzb61vFDwyydXsjmYpSTb0qKB/LmZ+gV+uKiFA2Nlh5e0CtA9t0Gz0dwDyZuQH9zz2gcQCDrp72VlgCoGZltKfamAgU3Labhg4c05lpc07wV21hF9Q+LCl5rR2NCJquA+QCaHnGcgAZYW0QD105HuSfw6WTESoG8crglfznQ09EN77PrQRtg8v9mIgsTJas66FQs9k86m9InfaL289Qs6WByEDx9IiX6lRwFCwh01d9wD8j1sEfG0TQcK2H/ZN859c29Bho9wqI8hbZyrtWZDiwQAH2VEhkbOgdsYNDeeX3W0sWDV9e2jQqM5eCW4TZjWA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(366016)(23010399003)(1800799024)(6133799003)(56012099006)(3023799007)(18002099003)(22082099003)(10067099003)(921020)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?oev8ZK4XRYgnu/QfVzOm4BXSrKLUcGAHSt88NdNkixHk75qw2RQ5n1TTXcva?=
 =?us-ascii?Q?zryW4TEVuEpvyRqMaFsqoU/4tVkCLhCgdiMIqi2kl3o62RgdsE5FNP9T+frh?=
 =?us-ascii?Q?gPfqYW6KFViXwNPKyWyb41kQJrHhz/mCJl/2gcvgjo8GInVlGYAUQ2que0ww?=
 =?us-ascii?Q?MFAgayTc0n/FV3grnhVclzIK19LutwAiJjMcKuUUU5ZfMMAZyKQ2ju0rRooC?=
 =?us-ascii?Q?GYoWtGySQK744XB5JTlyywcH3tgDt3mm1IcY7LPkqMJLOU5YaTu7+51HcatK?=
 =?us-ascii?Q?LqhjS3IrbyjFZia/msqoVSLSNbKnbIdenVoGeNnzo2zCuTYcHxr+mB9M5dlT?=
 =?us-ascii?Q?hLtIExkQ0pDpZmHWOzpALALkMcC+sl6XswLwwlLWgvMNnv70Yki0lMFOkBWX?=
 =?us-ascii?Q?57JM7QRHiyoPsjuiMc6PLxA5+GxnLYzTeuKZdsoVGD0F2kwCrmynYmIwu1so?=
 =?us-ascii?Q?JmF1rlJQ+ROzWyF3JfrrcVxh/f0J+ZraiHDLoK8Wh0bUawW01O4w0ftQi6OR?=
 =?us-ascii?Q?zvW+b4oTJ87DdnfkhDW7xFmLaEO3nO5jNCHsVHntvsTZRIKyDumCpi6FPmxW?=
 =?us-ascii?Q?3y2aGFWyHa/fEb5PtjKWwD4C1+n6ygQm7934AAAEoigzr1kkieI5X+JAK3IY?=
 =?us-ascii?Q?6PN5XuBpZ5G259HsFGMz8rkqmjR35RCA9aFsLhKawagtxKYZmm3BNvOSyZ7U?=
 =?us-ascii?Q?Za/ZEsQmsObhR/Mx6XNY34y1jPcEcd8zWxjdWHhFZQsrWqf+qYmjwozBdRqY?=
 =?us-ascii?Q?L10DU/gShNIue21JZM2Ph98u3BEgtgOT2Ilmiq4Kiid70tfuK871R3EZhITx?=
 =?us-ascii?Q?KyM+zJ/tv2YXn/U2jrAYilqSLEd1fWPopv21psc/R2CTlV8rHnGkL6YJgoic?=
 =?us-ascii?Q?EVxdo9GMLu51cNkEj2aDJpU0Cqkok9hFVsENA8LanZ34TfFq9gETMJMOeQgH?=
 =?us-ascii?Q?kPfTxkZkUIQblj29FL0FsR5V6ZJjRNcydJMIAtON7brhyeySrRCvtFhBePhi?=
 =?us-ascii?Q?PUHy0AIdvpINTAzqt9Y5bHmuC734j4LgKf9z3e49RKR67l7tXPbvkRCI5CHk?=
 =?us-ascii?Q?uiljl9wF8lhotF4MH3TvORsnTmeLt0UqK5yUd1o3XrQvkrmuGINXflXfesLe?=
 =?us-ascii?Q?EeKk0h2AoAchbIG2Zxh+dyZrDT9erTPwFA1CG50gOA3D+wFFKr4/YMnnkTX3?=
 =?us-ascii?Q?qIU/1S4MwxgNW9pZ73FlrtttBCyTlSnkMHlvWL5c8Ihvyg7doa9xhC8aVGj2?=
 =?us-ascii?Q?yuCNOyWorijgTjYoVXSJIuu5FVQTJIrQFtDEAXwgBErry2+7oa0XFhUJJQ6X?=
 =?us-ascii?Q?xUCRGQkmLMJcOM0opJqXB1IQA6w294YuLmL/6hwZkh54L/U84aVr8syJvXSV?=
 =?us-ascii?Q?jKlDWN2Qh5678pqUXOeKft5HF5xiqBjK0x7IU9nWueNRSmjPUyrwAvDbTQUc?=
 =?us-ascii?Q?g0Vlra66W/yg5ksk0xCCP4V5f5VyP2zyJUwntKgef1xWxOmRZvgVKUku6IXx?=
 =?us-ascii?Q?8hBT5w29I3lOPGkIXDYRVtdn3gzJH/tW1rll5AEIX/AjsjfYfa/nQWnkqo9A?=
 =?us-ascii?Q?5bvJ+Nv3rmNbpcr0p80UQSGsuMeiqW1SU+GsqGlZ22a7aolpETywORjhuATP?=
 =?us-ascii?Q?1a8bkwONa2roj7NewO5TRxpS4Nj8FbTau0Vf0oZ1gz/q8nbvMbARkdl7l4Ko?=
 =?us-ascii?Q?ZnBviP43m8PeGuu/0dtpQ6wENMh4R57dWfc5nKD5OvObaA4sjn/hZRTY/LVY?=
 =?us-ascii?Q?xQeAolRgsm4/PnBfTyruQp7coqNRL2bOV1Dsog1Wev1qHaPm3UUS?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f274d53-5fb0-4bcb-5ce6-08deef9e5e7e
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2026 07:27:40.3173
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MUTrhApNO/leQYayiaEnMQ2IFfr3yDO1oI42djmk1inbDGlc2JBE/beuTevcYof4FeMwU2amSWotc2FNJ3C5OoKMEN/y4rKiT+iq453MaJE+S0PN6849/Ix4SMpsNSKj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1138

Add pinctrl bindings for StarFive JHB100 SoC Peripheral-2(per2) pinctrl
controller.

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 .../pinctrl/starfive,jhb100-per2-pinctrl.yaml | 168 ++++++++++++++++++
 .../pinctrl/starfive,jhb100-pinctrl.h         |  33 ++++
 2 files changed, 201 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per2-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per2-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per2-pinctrl.yaml
new file mode 100644
index 000000000000..90c0f15452eb
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per2-pinctrl.yaml
@@ -0,0 +1,168 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/starfive,jhb100-per2-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: StarFive JHB100 Peripheral-2 Pin Controller
+
+description: |
+  Pinctrl bindings for JHB100 RISC-V SoC from StarFive Technology Ltd.
+
+  The JHB100 SoC has 13 pinctrl domains - sys0, sys0h, sys1, sys2, per0, per1,
+  per2, per2pok, per3, adc0, adc1, emmc, and vga.
+  This document provides an overview of the "per2" pinctrl domain.
+
+  The "per2" domain has a pin controller which provides
+  - function selection for GPIO pads.
+  - GPIO pad configuration.
+  - GPIO interrupt handling.
+
+  In the Peripheral-2 Pin Controller, there are 31 multi-function GPIO_PADs.
+  Each of them can be multiplexed to several peripherals through function
+  selection. Each iopad has a maximum of up to 4 functions - 0, 1, 2, and 3.
+  Function 0 is the default function which is generally the GPIO function.
+  Function 1, 2, and 3 are the alternate functions or peripheral signals
+  that can be routed to an iopad. The function selection can be carried
+  out by writing the function number to the iopad function select register.
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
+      - const: starfive,jhb100-per2-pinctrl
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
+            enum: [ fan_tach, gmac_rgmii, gmac_rmii, gpio, host0_port80,
+                    host1_port80 ]
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
+            enum: [ 1800, 2500, 3300 ]
+            description: I/O voltage in millivolt.
+
+          slew-rate:
+            enum: [ 0, 1 ]
+            default: 0
+            description: |
+                0: slow (half frequency)
+                1: fast
+
+required:
+  - compatible
+  - reg
+  - resets
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
+        pinctrl_per2: pinctrl@11bc2000 {
+            compatible = "starfive,jhb100-per2-pinctrl";
+            reg = <0x0 0x11bc2000 0x0 0x400>;
+            resets = <&per2crg 0>;
+            interrupts = <62>;
+            interrupt-controller;
+            #interrupt-cells = <3>;
+            gpio-controller;
+            #gpio-cells = <3>;
+            gpio-ranges = <&pinctrl_per2 0 0 0 31>;
+        };
+    };
diff --git a/include/dt-bindings/pinctrl/starfive,jhb100-pinctrl.h b/include/dt-bindings/pinctrl/starfive,jhb100-pinctrl.h
index 9f622468c294..2d5150e3adb7 100644
--- a/include/dt-bindings/pinctrl/starfive,jhb100-pinctrl.h
+++ b/include/dt-bindings/pinctrl/starfive,jhb100-pinctrl.h
@@ -177,4 +177,37 @@
 #define PADNUM_PER1_GPIO_C34				34
 #define PADNUM_PER1_GPIO_C35				35
 
+/* per2 pad numbers */
+#define PADNUM_PER2_GPIO_D0				0
+#define PADNUM_PER2_GPIO_D1				1
+#define PADNUM_PER2_GPIO_D2				2
+#define PADNUM_PER2_GPIO_D3				3
+#define PADNUM_PER2_GPIO_D4				4
+#define PADNUM_PER2_GPIO_D5				5
+#define PADNUM_PER2_GPIO_D6				6
+#define PADNUM_PER2_GPIO_D7				7
+#define PADNUM_PER2_GPIO_D8				8
+#define PADNUM_PER2_GPIO_D9				9
+#define PADNUM_PER2_GPIO_D10				10
+#define PADNUM_PER2_GPIO_D11				11
+#define PADNUM_PER2_GPIO_D12				12
+#define PADNUM_PER2_GPIO_D13				13
+#define PADNUM_PER2_GPIO_D14				14
+#define PADNUM_PER2_GPIO_D15				15
+#define PADNUM_PER2_GPIO_D16				16
+#define PADNUM_PER2_GPIO_D17				17
+#define PADNUM_PER2_GPIO_D18				18
+#define PADNUM_PER2_GPIO_D19				19
+#define PADNUM_PER2_GPIO_D20				20
+#define PADNUM_PER2_GPIO_D21				21
+#define PADNUM_PER2_GPIO_D22				22
+#define PADNUM_PER2_GPIO_D23				23
+#define PADNUM_PER2_GPIO_D24				24
+#define PADNUM_PER2_GPIO_D25				25
+#define PADNUM_PER2_GPIO_D26				26
+#define PADNUM_PER2_GPIO_D27				27
+#define PADNUM_PER2_GPIO_D28				28
+#define PADNUM_PER2_GPIO_D29				29
+#define PADNUM_PER2_GPIO_D30				30
+
 #endif
-- 
2.25.1

