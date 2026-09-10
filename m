Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2128.outbound.protection.partner.outlook.cn [139.219.17.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FAEA3D5259;
	Thu, 10 Sep 2026 10:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.128
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789034705; cv=fail; b=Qu4LWUNuThnmRvqkKTrANLbD2WKQzJnh5HRVaemkgwZ/QvLOlOcPfFY3RMa00XE9pOTyKA7dS7Og242V6PbdJwEibWXpKl8fnR8xVOjgs7vwUtZuPCWJ03RBU6fivxcfNsFWdtwb/OHEalteA26WcKSv6e/U3MrK+dmmC3tf5CM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789034705; c=relaxed/simple;
	bh=ZpoST9jo5GJh3qX0QUn0Md03iVO9dzCJbaOXVredJDs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=W4UvK8XU5AbVYdQK3fOxEtGjWj0vG88sskxjqLIrA3hsmkZxXAu1GHSbFBELznnaS2jEjasRO4jIqjwkp059WEKJpN8sO379n+h31uuWjw7FZszeRl7rKwnBoP6CKfhbLYd8DXllKM56bCwxfLVJZXod1RSowzhhI76l0TrZplk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lSHemxdoqjLbglYPVuFQWyDOXWaZ6cEEaUw1pXHjAqF3I2KUt4Ro2JlAValCb7KftjiHCLZtp13t0Fi8SYlLNBLIIfVfIyr9TceelcJTcnbvn2ygrLH0dvXzqXN1aNp85BjLcaQso1NyMfCcZszZBWAbwQRNmKRavurzUMXFcPAItavf02mWn8ofBXpfgGOlAQGAUpquDARLjE4+2LOhbifzOu3LT0TWdOjrl1u/B+lmCjuKUR3TeYwZJ6I2MfLeFyoKwhuba83XSODj/H0t5cctmsOYscB1Ai8wsVWLtB03BK44q1OhINd514NNWdvThEkETBYjWCZnRUrqd12AZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QoDfTdweOrbyR6rTYZWleXq1Phvh3r0JJ52FkNiJ/lg=;
 b=V2VUN/Thw2a/3mqQbexkwU4ttHjspkhjWslr8IeGk+bEfUXHDACq5Boh/SQbuIZIapc39OjNX4krUX5bmCwRMhaAS+kV7pHKu3IhrcCm3qqk1m/ofaclSmFUIlcy2CnK1cexA0THJkmJXGBqp6Wxy2Oq+jAujg4+JEGUAmKC/YdMUi/pJw9qRBhWWKeq7+xrgfugjU9QvYBQp9eJjzRSh8UBdgwOd063BhzbpAFW4wOU+m7pws0ICRgYZpawKcCGdXJ+bI2K6cI1mQXRofcdIBVVlZSIWCWJ6mXX/I2tL9z0uX2Nu4nwcgnnnrX5/xJqcWtKv23IcKeBbKuAPk8JuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1233.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:13::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Thu, 10 Sep
 2026 10:04:21 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0339.017; Thu, 10 Sep 2026 10:04:21 +0000
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
Subject: [PATCH v8 11/22] dt-bindings: pinctrl: Add starfive,jhb100-per0-pinctrl
Date: Thu, 10 Sep 2026 03:03:46 -0700
Message-Id: <20260910100357.130134-12-changhuang.liang@starfivetech.com>
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
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1233:EE_
X-MS-Office365-Filtering-Correlation-Id: 13c287d4-e28f-4492-83a2-08df0f22e250
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|7416014|376014|23010399003|6133799003|56012099006|3023799007|10067099003|22082099003|18002099003|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	/5uNxTMozh0kjR7wVH8jp9l18dSkfJ5ABU04pSjcYdgMgu6nfCTZf6TUqL+f7Lddu5csSj2d2u60zqn59nPwEOHsHSFtF0vX2zMBtq+ctHqJ4a7mX65EoebWFEwBneNneHRT++P0p199my0f6gEi1kuvGrVUNDgBuG8wKVhkrIsbwiOqCUbwDNsS5a2EjLzMlBAt5I/Y3IxbqiH3PbQWYCt9TmJz7kw2SF2qWkLJOvw8HmeDxMCvR6+k45IHPrDbxz0VYD5XRSpk3SJ418KsrgXczuBBYSjgrN8UrtHvn6gpvx22J9jXgNdTgiS2+ZwIWxx9bxdpupuhx6Rdac54XG36C1FbcHpeqwUFtWCcvuwUpwAI/lrn+zTYDLrhiGjpffU4xYiFP8DX+Y6QVY6i0UcTvsOHwdiiz/20B746Unj0NISE1tgzK3H0s1p9rExZ5Q9qh3BU10biXH4bzclYHs5X7DQNWviChrIbNZLWlf1qp0mMQqeV8mwLw4CMiV40Pkj+i7Od7+JO2ZuYId6saLxQtBxa8BubT455wO3cXv8xJPjh8gV6jnMCcegsqELY4e9i6UWAdxakHuqimVybxQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(7416014)(376014)(23010399003)(6133799003)(56012099006)(3023799007)(10067099003)(22082099003)(18002099003)(38350700014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?j7cfo3p3gn01pNXUlMVkKcv3J4jkl4S3OXc0Ta33lDozPvaaTgde07iFdaR2?=
 =?us-ascii?Q?iRUyhEyyk3PB/hDcNJ3R1pYg8LXzmyJ2xrHR9iqmge/ztRukLKf5FzU6UN6r?=
 =?us-ascii?Q?DbkT47b46xPPnpB6SXhRlraMmdelmA016ToqCjz/h9SAZAHuTH+YT7FWoBmL?=
 =?us-ascii?Q?eU21vB5WHbfGJYtKnas1QIVxj+lL6Hh5cSkUz26V3HQkm5AYDYwnXITsj9si?=
 =?us-ascii?Q?sVrautIDZj8CxCCHMuWUHFbMjS7vQM2/XAFrqRsaXkISYOShHV/FwiNWDZEZ?=
 =?us-ascii?Q?grhs4GX2X0xQIVaNMcX8BrPyJD4o/ei0INkQU91YV/s3B074X3Nl7wRUIXcg?=
 =?us-ascii?Q?77lbMQKSUHZvrFgDInDtYWvQCMZ5hF07wnee688HyN21d/M+nJlcLYtSR60n?=
 =?us-ascii?Q?w92dBDAyee3xDQrGj/GwvTmwmLwIeu2Tmw9xSg4wO0O0qaAeuaR2ByqZSQ+s?=
 =?us-ascii?Q?UdYRIFjHZlpzUhtCpQ7wtDEfDfDcLfeuYyf9s6Mc5SX2Tn9YBoGyVvhUYCV3?=
 =?us-ascii?Q?Tu8+ALbjtU7T5UuzMSsnNlWna88HLfrUJQuFhbVvxCCOzTpIO76b+65JIFaL?=
 =?us-ascii?Q?/cC8z50dVvf87ADzJrmEvQJQraHVMuKdo3ldrVTlW7/tn+nkOu4a9jO1VsSk?=
 =?us-ascii?Q?A88eN/klwTocymaPDInOvTxR6OH/c8O2msf5ZJvuK38V8AqttWAFJQXdrqMy?=
 =?us-ascii?Q?fVEXoYdWrd/DHuCKGkb23pEm4zZCCDxQDFwoBCfiVHx6/vX/E7GFrN/8fEfj?=
 =?us-ascii?Q?sERuZoxs3GOvAdOcDGvSP9RuCorox/LIYrDMz+B6pxBnaG2qLQv+gN74wAf7?=
 =?us-ascii?Q?NeegNIgP58jTcngFe0l1GTsqfp306ovF9KFtIQthR+vWkKLQV3esyI4xEt6T?=
 =?us-ascii?Q?25HE4GOjKp451Q9OnGirpPcZHgPOD4bZ9og+NUbVsStviNvlAUANTgs7HD1g?=
 =?us-ascii?Q?RUC40TNqZLHdcuGWWWig6fzcxnGuxnCej0JHlOwHr37qYSUArqXPjPLXbYmm?=
 =?us-ascii?Q?CbdtxVwms3ZiQbrg5vH+jt2A1jg5ZwdTEFhTApwWjVTBKjGQ9exDJyQpsizc?=
 =?us-ascii?Q?73TjWE1UnMXe0pLM05QgJRd7zXHYLVt/126wONlVEpFV47L6lK6wSDB5nsv0?=
 =?us-ascii?Q?pMnVgqBco4wq09amEbp0gX1R/v1MK933Ow6p8IPlFBVjJxiqBWqHh4rzTSaT?=
 =?us-ascii?Q?oXjo1GW0Tij1vC6OgzckT+l/xyWFYB/vYQ1pU3F2LXBJUeUfz62JkKvigR3E?=
 =?us-ascii?Q?aosoo2ajVptLUimx4evvCO+UVNfrqGZT47eqUqgXzhpM5NyZaD+2inQvyxe7?=
 =?us-ascii?Q?LDpaXrUtOUeCo1k1a+IIgKwhdMxxBYO985HMF/nSWJ+axJRm/t495CctDnHN?=
 =?us-ascii?Q?ifKrMdpzLCwWf2oy0gl91eV7yLi0Jh7GU+u/y3sp/fzyP3l79wrsemaXo4Vi?=
 =?us-ascii?Q?5RP3pCglAZGhQQtVkYEpaFhUtfwkMNvdWxDrM8IpoL7d2IxQ/cDzyGUvUgj8?=
 =?us-ascii?Q?J2cMA9Qm3iYtPYEGtl78BMTSLfu7BbuNCN86uo+k013ruyCnhATEXBrsIWTn?=
 =?us-ascii?Q?A/xV2x7uvM1WqMAGMKPSLCBMmaheB0oufXY5OdGuh+iahGPYCamD9nfDNMfN?=
 =?us-ascii?Q?p++w8XVbBODGrLmCCe0kw5RLTOWN8iGvp3QK2EI3Yt3J/j5FubhC9UWdFCDI?=
 =?us-ascii?Q?EilytMHmcw48r3HpKl+3oDzJ7hi4Erj239hgVfkRbRYNjP2JLKlK1ovr0xLn?=
 =?us-ascii?Q?6+AY4TZgp+7izt0u8K2cOzPW2BWuVQNMo/Ej450XmTETPeQE661j?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13c287d4-e28f-4492-83a2-08df0f22e250
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 10:04:21.1031
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KCJaFfqEXAyLuGIFM7TRTnwq8WJhIy4rumyPqNW2tjk+6mldDAiDMA7dQOH/gPBdfH8H0rlkU+FkSdOB9J+Da498qwGx99cgoyH3jz7MHgfHtF04958euKGFrTAGVWCY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1233

Add pinctrl bindings for StarFive JHB100 SoC Peripheral-0(per0) pinctrl
controller.

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 .../pinctrl/starfive,jhb100-per0-pinctrl.yaml | 179 ++++++++++++++++++
 1 file changed, 179 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per0-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per0-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per0-pinctrl.yaml
new file mode 100644
index 000000000000..0e7e7f231e2b
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per0-pinctrl.yaml
@@ -0,0 +1,179 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/starfive,jhb100-per0-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: StarFive JHB100 Peripheral-0 Pin Controller
+
+description: |
+  Pinctrl bindings for JHB100 RISC-V SoC from StarFive Technology Ltd.
+
+  The JHB100 SoC has 13 pinctrl domains - sys0, sys0h, sys1, sys2, per0, per1,
+  per2, per2pok, per3, adc0, adc1, emmc, and vga.
+  This document provides an overview of the "per0" pinctrl domain.
+
+  The "per0" domain has a pin controller which provides
+  - function selection for GPIO pads.
+  - GPIO pad configuration.
+  - GPIO interrupt handling.
+
+  In the Peripheral-0  Pin Controller, there are 60 multi-function GPIO_PADs.
+  Each of them can be multiplexed to several hardware blocks through function
+  selection. Each iopad has a maximum of up to 3 functions - 0, 1, and 2.
+  Function 0 is the default function which is generally the GPIO function.
+  Function 1 and 2 are the alternate function or signal of an iopad.  The
+  function 1 and function 2 are other optional functions or peripheral
+  signals that can be routed to an iopad. The function selection can be carried
+  out by writing the function number to the iopad function select register.
+
+  Each iopad is configurable with parameters such as input-enable, internal
+  pull-up/pull-down bias, drive strength, schmitt trigger, slew rate, input
+  debounce nanoseconds, power source and drive type (open-drain or push-pull).
+
+maintainers:
+  - Changhuang Liang <changhuang.liang@starfivetech.com>
+
+properties:
+  compatible:
+    items:
+      - const: starfive,jhb100-per0-pinctrl
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
+    const: 2
+
+  gpio-controller: true
+
+  '#gpio-cells':
+    const: 2
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
+          drive-open-drain, drive-push-pull, power-source and drive-strength.
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
+            enum: [ gmac_mdio, gpio, i2c, i3c, smbalert, wdt ]
+
+          bias-disable: true
+
+          bias-pull-down:
+            type: boolean
+
+          bias-pull-up:
+            oneOf:
+              - type: boolean
+              - enum: [ 600, 900, 1200, 2000 ]
+                description: Pull up RSEL type resistance values (in ohms)
+            description:
+              For normal pull up type there is no need to specify a resistance
+              value, hence this can be specified as a boolean property.
+              For RSEL pull up type a resistance value (in ohms) can be added.
+
+          drive-open-drain: true
+
+          drive-push-pull: true
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
+        pinctrl_per0: pinctrl@11a0a000 {
+            compatible = "starfive,jhb100-per0-pinctrl";
+            reg = <0x0 0x11a0a000 0x0 0x1000>;
+            resets = <&per0crg 0>;
+            interrupts = <60>;
+            interrupt-controller;
+            #interrupt-cells = <2>;
+            gpio-controller;
+            #gpio-cells = <2>;
+            gpio-ranges = <&pinctrl_per0 0 0 60>;
+        };
+    };
-- 
2.25.1

