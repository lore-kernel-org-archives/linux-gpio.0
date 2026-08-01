Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2108.outbound.protection.partner.outlook.cn [139.219.146.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2229341737C;
	Sat,  1 Aug 2026 11:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.108
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785582088; cv=fail; b=fs2UQcU9PnutpmLDTdyt2PVjjFe9MwRh9JZkdcCeR58RuXITyKbRVv8wHpn5c14eXcLAyjAWcf9LDIx4VjtR0qf6WXrhq8ZaHlF7JJA47LYxLwOb/ve9pQSx6YhBgSSrM7D4B84IB5CX5spXb2lA1AAJkRlDut28+++xO8HinQY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785582088; c=relaxed/simple;
	bh=iIsWTF8E7NQBgWXERyrEBaTr075sES8eTIVZKwlBc3w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=OxrXgqZe1SpVWtvT2xm1D8lw3qDVKWj767IYGZb4Gfj3mjvA8b1lI9jf/rPIGT7rNiR4yB3aInNNyZAHNGg69eFrKk7JJ9ISmkg+UKuOhOVO9JFfA2jfge3/PU079Grw/znMTv7BNb96Yiah2TyKYgoPUQaRZRVDj+cGFpNCJbw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gOQpg0KYxlWEor42S7EGqCQPbH7aSIL0sXd1PdHf50eJzP5wD3mCgpZJ0ASCcd8uyxxuH4ERsgQ7e4XiVFfjgRvLNPpQucU1mA1PZeEjrix2hHvwqf9SCfLSFj1CBJhvH/0lGN0cwDaUReE5ZSt6bSkzS3py+AGzm4ePIQF7ZXZIe1Eo8/GWAJNVoajwMNFZnU/aMEJMliKJn+NEDjm+gxnM3pZwVSvfLst0OzhwLxJsaOu35H7QN98PCCgeLLWnVxW/3WA6Fmba8bv03l8vu4s44q3I/P7csFSn0yugP1Su/XZyD97dQwwKcPte1TNXrxG0f0/E/YUFGEb/loJIag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h5FCc8DKCZ7AnfN2EA0Vj2Qb22x1myeyAHh5mvvqH0o=;
 b=bjVbNWKHsAPhzP3Bc/+SkZxPqUDZUL8cT3tXUNegdX9h/6TMhONWRXFNQQAfFI7xoQr84Sb12Y3J4ZSGeNiDzWLgPCSk8vcm0wk397rJhWUE+aKH/DtOm14qH+xZLhxL++bj//WSpiHLUeav7oKyw273xbY5LC5HjDvwpBNxYM8pJDOkenKsEOUePAM8ETMLabB7kZuNq/VFgH8s6XFVPuvvVEKk5IXjTE+48XJmXbe+1kmEErfq9kQj3R4WqY3Pg3OhTmFTsF6jpvL0cXFiDCqz60LeBJWu4UIlK82riIRzCwmdUyyQzl/N7PDUx/srCLX1tTG7hwqVQ7HJoEufWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1138.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.16; Sat, 1 Aug
 2026 07:27:43 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0270.015; Sat, 1 Aug 2026 07:27:43 +0000
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
Subject: [PATCH v4 17/21] dt-bindings: pinctrl: Add starfive,jhb100-per2pok-pinctrl
Date: Sat,  1 Aug 2026 00:27:07 -0700
Message-Id: <20260801072711.153217-18-changhuang.liang@starfivetech.com>
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
X-MS-Office365-Filtering-Correlation-Id: a2331889-9361-4c2e-9c16-08deef9e6017
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|376014|366016|23010399003|1800799024|6133799003|56012099006|3023799007|18002099003|22082099003|10067099003|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	jK/bLm55MqLK1WVgXQ4bjm99iRtB2bBNnk6TNy0HlMJVVwkvohd/czzTiX9v7Z4iQ0X6rPbYFN1uSn7Md6XkNXdRc2bG9cOC9Nydsm0PpF+PUbBlTFDwCumw3x5JXhSgHw93ttUQ+chxaHZQaV5SXOsOPIeBxYqsHsB9efsYlX/GH8dVkpNL/bIc5jFswLn+MhCFS2uwBzZLzS4nAjZRB4OQufFcluBwib/pi9inlACVtzGfNPe5DAnQEnn3lNm0WsgiR0uzZ13G4nm+biWY+xyb8zPxmwncRQ6yPS43GwSiCKz90ZuQ/kLI8rcHbp+Pck793oeDMp8o8wLY2iii+jtfWtpEKbXwM2yJoHpK1kr1uSRLXxSxbqCt68wZxTyyA4pMZ3n/GfACgUYMoHKRfo09YvvfuDfeGzBWWNWlCyR6iQ80jpu3HcOuue+ITQk0kszkgPtoFw3moSYlhbEYHEDeP28+Sk6U8Ryyo19i7YBNe3/aG1Pax2JPdZD8Qn8u8MsS4xGSEVGFWB2zQSlkbUCu7lclV6GSwPTYo8BicLNUkZLel3f9r/PsUFSx4XR3JAZkvYcdqEPllGX6KWdFqQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(366016)(23010399003)(1800799024)(6133799003)(56012099006)(3023799007)(18002099003)(22082099003)(10067099003)(921020)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Hl6fVrPxHzjbCB87NmMsdMvQm/7lI5Kn3VjYnYxxUDjEmUlNLAQZXQ18x4FB?=
 =?us-ascii?Q?zYg2xEwhrHwtl3IUICgQyUJ0w0r2zO3OCGuoVYheNdkmOCWtVPrz4t4c5ZAB?=
 =?us-ascii?Q?MlTBeFP8zY46HDKTiNYJRRqYdb6BGLhlay8FpjjJpJQSNHpo4pOK+2wzQM5l?=
 =?us-ascii?Q?9/SztB1PLKgckWuCpAaRoX/tbExRqkuFmPtEcZbOSxSYBQvidV0KwR1V7bu1?=
 =?us-ascii?Q?VskG3ztx6CXp+5Q8d1uebGykniTrqcozcJN+niwkHBj/5gh1TGQ6EqNzThWw?=
 =?us-ascii?Q?lDVuRv/9pL4gQr1fIoY4Do8Iry/YEcJbXA6G4qfGW3WCD7rq/e8xHgRN2AI2?=
 =?us-ascii?Q?V10Vu+boOT6wohLqdG3g6qihZwc9LMsR4wDcpclEo08PlG7K6YICvnAt0fJC?=
 =?us-ascii?Q?SkEgoFO1Qz6gjBOtMECEe3pxsDYjKJAnFuq6PREItYHUmRFFmb1ZpvND+m3S?=
 =?us-ascii?Q?cHngL8DmAng7RFnkpvokiFTTF7NyU9xMJqYJGo9Y4hRhkTgRFQQ5zi2o59m8?=
 =?us-ascii?Q?W6v4+KU1eiquI01G2P10ik6rYIXjcdFCBbiB+SEWjP3haaHIzDqenv7UA6pg?=
 =?us-ascii?Q?xZC6ja9WRbUJloZxFGVQcACvax4qICJMKk0GQh93toFBELu2uQEw/McIx0pD?=
 =?us-ascii?Q?7ZyYtL/Rft/xSL2d4F9Jpdx52xFpXMgPhdRB56h/4lRUzM7h9HkP6PWlnio7?=
 =?us-ascii?Q?Q45qk2SJB2RP5SQxwq6qZWLmr/RbYNeqXmQePR7tdL98rKe0kfpgIZgvFID+?=
 =?us-ascii?Q?akWB4WLEN3pwkXllXWGmKIwWM2M7iFBFxDrfZadB8IZrNDpfcjgz2Tt4vSuZ?=
 =?us-ascii?Q?JFtYNG1bBz13xnbtyv2lsQ4WUduY4pZl/4VXcK8/qM3zq8jyi+19kRLTZ/uO?=
 =?us-ascii?Q?5tFxmA4fEYQMxHCeI7M25FNfUfhXRBDQPIHsTukD2Wxl9ATUiBVUUlIRMB0A?=
 =?us-ascii?Q?0irUOMMIPLoouqw4yiCAJ/Wf/iMxy0FaaK3VlmP/IZQrlm4QLWAirmxByhi9?=
 =?us-ascii?Q?6RWByAT9sBqQxzJimsdwa/uDLIcmbdcZRvCZTiLZR4adCI+O2sA0Wpj7QHD/?=
 =?us-ascii?Q?88kAl5w/xxLtPsW0O1DQH+1ClzgcidXbksNOchmSaJzin5/HcZKQ+d+0HW4P?=
 =?us-ascii?Q?MeFOTcvOg7M2VOsnwSw186FwLkZCRARGziLR3JB2YBwNwQ7zmuaxFmSXWAbF?=
 =?us-ascii?Q?e39WasysE/lmnRgN4ZJyYS2rgrfhHNx9/A/WKvLRCJaBlzNgcjsAVl6WDFiB?=
 =?us-ascii?Q?7chgtV5Sy31lHnyukq9agwvGKq15iaInDMhqk5cjMBvDT2LARXkMsLeQmEES?=
 =?us-ascii?Q?DlLEwXs/K88i4ScaE/MnpBx5K1D+rTuZpdNOeSgbhpCDTmDvhEJ4yII2fcYA?=
 =?us-ascii?Q?55MEL6GDeUX4gU11QZSLqE+NkbpZzmY/FNS9s1mDPEhFt6khSwxGT5X8Ef5h?=
 =?us-ascii?Q?WsrrjSYiRsUvw8GIUVyqeoHzU46VJWHwk/9r44A0jEhZBJvwnTfdA8q6SZnO?=
 =?us-ascii?Q?Ixs+/dTAcWJetZYJayVJeKdbuhYOYFEbGtHUwZPPNqe8ghpQtCaTWp+KuSTb?=
 =?us-ascii?Q?E1iU5XBnw4+DuNUeEFl+Wws8xIvFnvgETiAlHRigE7rel7Vso7o+PYXW/p/R?=
 =?us-ascii?Q?nWO7GIuUt2ThYtrGS0uRI9GXWlNh6fa9Hk84biv4OsG4HEXub7htKzjZ5jQr?=
 =?us-ascii?Q?TnBNQcRK4NC1E0CLRioOL5U273J+FMSkUBdxMzSIY3Jn0En2Hu+ymRte7NrN?=
 =?us-ascii?Q?9PLk2YvfFhfLcBIL/h9XpOX6jM5iYRutl4Pden8cLHiJtjAj/VR9?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2331889-9361-4c2e-9c16-08deef9e6017
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2026 07:27:43.0243
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jc/TAoFPbCISDXjCLCfDt82W7O6pzt3D6kIW7xz56zTNfLvP5cCL3qX/Nu/ySxMbqHU/+gIg0+xhSLL36R7ihfcKOgSNALPEb025GSitOL4Euw2yhGEj4Rz5rG8H4wXI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1138

Add pinctrl bindings for StarFive JHB100 SoC Peripheral-2 Power OK
(per2pok) pinctrl controller.

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 .../starfive,jhb100-per2pok-pinctrl.yaml      | 162 ++++++++++++++++++
 .../pinctrl/starfive,jhb100-pinctrl.h         |  20 +++
 2 files changed, 182 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per2pok-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per2pok-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per2pok-pinctrl.yaml
new file mode 100644
index 000000000000..5c741e23f206
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per2pok-pinctrl.yaml
@@ -0,0 +1,162 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/starfive,jhb100-per2pok-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: StarFive JHB100 Peripheral-2 Power OK Pin Controller
+
+description: |
+  Pinctrl bindings for JHB100 RISC-V SoC from StarFive Technology Ltd.
+
+  The JHB100 SoC has 13 pinctrl domains - sys0, sys0h, sys1, sys2, per0, per1,
+  per2, per2pok, per3, adc0, adc1, emmc, and vga.
+  This document provides an overview of the "bper2pok" pinctrl domain.
+
+  The "per2pok" domain has a pin controller which provides
+  - function selection for GPIO pads.
+  - GPIO interrupt handling.
+
+  In the Peripheral-2 Power OK Pin Controller, there are 18 multi-function
+  GPIO_PADs. Each can be multiplexed to several peripherals through function
+  selection. Each iopad has a maximum of up to 4 functions - 0, 1, 2, and 3.
+  Function 0 is the default function or generally the GPIO function.
+  Function 1, 2, and 3 are alternate functions or peripheral signals that can
+  routed to an iopad. The function selection can be carried out by writing
+  the function number to the iopad function select register.
+
+  Each iopad is configurable with parameters such as input-enable, internal
+  pull-up/pull-down bias, drive strength, schmitt trigger, slew rate, input
+  debounce nanoseconds.
+
+maintainers:
+  - Changhuang Liang <changhuang.liang@starfivetech.com>
+
+properties:
+  compatible:
+    items:
+      - const: starfive,jhb100-per2pok-pinctrl
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
+          trigger enable/disable, slew-rate, input debounce nanoseconds
+          and drive-strength.
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
+            enum: [ can, gpio, host0_port80, host1_port80, passthru, pwm ]
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
+        pinctrl_per2pok: pinctrl@11bc2400 {
+            compatible = "starfive,jhb100-per2pok-pinctrl";
+            reg = <0x0 0x11bc2400 0x0 0x400>;
+            resets = <&per2crg 1>;
+            interrupts = <63>;
+            interrupt-controller;
+            #interrupt-cells = <3>;
+            gpio-controller;
+            #gpio-cells = <3>;
+            gpio-ranges = <&pinctrl_per2pok 0 0 0 18>;
+        };
+    };
diff --git a/include/dt-bindings/pinctrl/starfive,jhb100-pinctrl.h b/include/dt-bindings/pinctrl/starfive,jhb100-pinctrl.h
index 2d5150e3adb7..4b7f349cd9d7 100644
--- a/include/dt-bindings/pinctrl/starfive,jhb100-pinctrl.h
+++ b/include/dt-bindings/pinctrl/starfive,jhb100-pinctrl.h
@@ -210,4 +210,24 @@
 #define PADNUM_PER2_GPIO_D29				29
 #define PADNUM_PER2_GPIO_D30				30
 
+/* per2pok pad numbers */
+#define PADNUM_PER2POK_GPIO_D31				0
+#define PADNUM_PER2POK_GPIO_D32				1
+#define PADNUM_PER2POK_GPIO_D33				2
+#define PADNUM_PER2POK_GPIO_D34				3
+#define PADNUM_PER2POK_GPIO_D35				4
+#define PADNUM_PER2POK_GPIO_D36				5
+#define PADNUM_PER2POK_GPIO_D37				6
+#define PADNUM_PER2POK_GPIO_D38				7
+#define PADNUM_PER2POK_GPIO_D39				8
+#define PADNUM_PER2POK_GPIO_D40				9
+#define PADNUM_PER2POK_GPIO_D41				10
+#define PADNUM_PER2POK_GPIO_D42				11
+#define PADNUM_PER2POK_GPIO_D43				12
+#define PADNUM_PER2POK_GPIO_D44				13
+#define PADNUM_PER2POK_GPIO_D45				14
+#define PADNUM_PER2POK_GPIO_D46				15
+#define PADNUM_PER2POK_GPIO_D47				16
+#define PADNUM_PER2POK_GPIO_D48				17
+
 #endif
-- 
2.25.1

