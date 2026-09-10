Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2101.outbound.protection.partner.outlook.cn [139.219.17.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E7E23D6CAA;
	Thu, 10 Sep 2026 10:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.101
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789034697; cv=fail; b=ExGYpOobbvzxX5DEXYECiJHg95AIYXcNPNuiKodwhjSCnJ6fJpa/sq7wUNtsza4gmXFSvpnltuZ0s7muYOqLhnrtQjKeaWDSaXoL+7lwC2yr5zBm64wV06yzkeo2+WsxbcxV9p+QeJGgZB8NptDi+/l0hDzHu5F9dK42GE0DTbk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789034697; c=relaxed/simple;
	bh=KejSYxC8t5ko5DhhL+u6rcgSrHFXSMMsSNog9VHpOis=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=u7LvIGRELTHaxrQSCZ+kmHknTsraWPosd78vZMFVbJz/VfPAPGrvAXXn6D4gej3EoS+PD3/wQyCwc0HtWnGxZgcWKsEt3WxS8dA3KadoM5Vi6EJyeN1x8EsbhP9P1b2zBTBvQ0AIl9x745lvAlmAO6X1cCrRc/XTLwu6U7BEffY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fnzXsFgvwNT/MbVhd94Py814LzzYJvAJ5nLJhpAEgjpZeqyO5TxVJR/Bxz8+MR4EqWp9t2cqsvo0xTkVS3PiuAgShqqkQVDu2k7Y6TrIkkdAX8O+G39SPWp4TvLIVp4L16rfhrn5wMc8xiqzjHrluYG3OeCJGRn61wkynXjI0l6X0/YhSARL2KxTLRwJ8EJCbMM0DjX/nS4QDFT9l/5/CDGD286QTsSTuNUWwXo6+HEZ7Fz2BrubT5qvYWVE2Cc1457aoAJ8JPoefcXfpd3g6LlQG5WgODcDuw0Fk/bhDUVJBCiayNTvra3R7oKQTv92qy5CS87uIuEgitnsgeuv+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tyP0EEwHQ+/lzhRy44VM0aQez3JWfJEZGRUqjmZPqKs=;
 b=fPQNVcD3wZalq1gv6Klw+N17Fxamxle812m+PEi8HES184A9zo2QK9i3jYPVh9zYAqBOWLOli6F3zTlxN/CNZ6+5BhWM4+sdO4G336qCNndf95z+Hk8qBLWsO/rLhg4sA+eMByFqXIBjcyVSbRFlHtvcn4/R+YOTgRGX6Lmf0/uY5S+gi04DItxsKytR2Y+yvG0d7VIDNj2qKDtl3uPNGcO46ntpKSzEJJJgXrYQAPLTkZJJAEnsXqNr2s8hygypYgtpu/Sk9j7N4M6PA2fJ738kDqn6ZhUvp9+sBajP8cgPP0+SZK1UuARvvaV9RIDzmldEvDamAyeJnO8IVrBeeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1233.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:13::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Thu, 10 Sep
 2026 10:04:19 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0339.017; Thu, 10 Sep 2026 10:04:19 +0000
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
Subject: [PATCH v8 07/22] dt-bindings: pinctrl: Add starfive,jhb100-sys1-pinctrl
Date: Thu, 10 Sep 2026 03:03:42 -0700
Message-Id: <20260910100357.130134-8-changhuang.liang@starfivetech.com>
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
X-MS-Office365-Filtering-Correlation-Id: 82961c79-c2e2-46ed-6e8f-08df0f22dfc2
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|7416014|376014|23010399003|6133799003|56012099006|3023799007|10067099003|22082099003|18002099003|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	u709UQnafsNziqxDIoFINtTuNuT1ADBKHl/9G7W1sOOCJ3/QE/gWfr2uqW5J3rV5EQp6FxuW/vtPtc3RQp9/tIxEhm8JQttrVnbAeJHl2cNf4lCWwp2BijXAdmOPQ7WzzL83pT/bqdBmA6pbFqt31BgdTGXtmXRiIhOZYnk4valMD0n9b9rqmlD30AbqyWAxvwTtlFiB+2Qb+mMGn8NTSE/Fc+lt72cgT8zj2BfH8GYEouQmWf5AXNp4uDaMFkS5N+a68ab+VvKMl1cpPwc6jMZa+n9OEjo22koKCiDU31AyekCPwnybgZGxZ+UV6dnQpE94qAS7/nBcJjK3ni0B9DY3OutB89IIga7TsQ5Jbt3TAekl+JHducNsRnxkOp23CJZaE8hXW/1OalYQcWgNcyxRgYe6K/PuntKey6dirARbLp0773Vb4us+Fq+M69YdsC3aV91Is0SeKl7KQiiHD2pDpZs+BdvE8T4g1jUJETbcDnKkx2bV92jwdB+DzEXQAnSKz1RKT6xNU0BuC6Ao6vPG+yV0yd8e5n7S9ew+QPpu3Xew4o4z+t4GW/CZUBdTTlK8mvyzuLn5m8SmGJJJRw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(7416014)(376014)(23010399003)(6133799003)(56012099006)(3023799007)(10067099003)(22082099003)(18002099003)(38350700014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?YIcrkUuucgIBEGTlTwTXig5qwOu6TDjb4OSdTV8CJFKvsUHqAKMSl8veTyh7?=
 =?us-ascii?Q?G5b/3hXBkFWEn/HxbnNsKcIZ92z9qWoujHFFoGiQhYwwZpSwDfOBbJGlWEU6?=
 =?us-ascii?Q?zwCx3mBjdjfDiqzGFNIAzHpSvcmukJlKsJiGbTCkQX/x6y18CDZQVF+yn7Zv?=
 =?us-ascii?Q?7vvOXBBIXOU1tmZsKRf5W0oaFjiv7FDSLg42H632tW9E6yIUK8KFPGrfugZK?=
 =?us-ascii?Q?bZ5gcF1ibxG0qJC6jo2G8DksyhwQHSQBrk9lk32Lpj3UmSb4TC4DnKtEDIwW?=
 =?us-ascii?Q?MVoZ8Ib9nOwGAGpPaXej2ozL9P1b+bEUYVSYTT+A/sscfTcrrnOYwchOakI9?=
 =?us-ascii?Q?5JEKQkIt1aBafZ77ACvPjmI8e31FYBrrfxIc7mJxNBh86nLy2Hw29gWdt3on?=
 =?us-ascii?Q?czzbEnDnAOdkQ10wLfi+dBpreVT5TuFdgjP87ZP2byzKY4wqKLIzw9LeZQhc?=
 =?us-ascii?Q?zIc0TtdaqUzIOET29UGK7cwR0uXKHTN3Kp4S/B0O2yhNHsByNTn4KBc4n0Nx?=
 =?us-ascii?Q?RMmCq01zArneRrTEGt3+Y0ICVe/Tfq3UEYe/XOQq3wUhv/09XnBLJTfCeaWb?=
 =?us-ascii?Q?WK7FpIjkCcjm1bDv6mG2mLvYocdvjoPkYcL0G/pquOeQHrG8TgCiJcRLPVZW?=
 =?us-ascii?Q?Sr+TdUDatWwgVGXLvczhQHv0XyET8iyP57rNR3uUFSlc/9+NlcF9NeZvBs8G?=
 =?us-ascii?Q?yZHMPHzv7bTSMuGmhQNfO+q1MAXlWm611N1skPYJ4NtIHn3Su9kK3RSYarmx?=
 =?us-ascii?Q?kK3NVQd3ckR5HRpm8sGMUp3yBwEgFzfq1UgYbv+qSzulJYPSyAtSXjXVnbJL?=
 =?us-ascii?Q?OraJGwtZwEjPg9xHLUMwOQ/jVol36FQ2iWPumU27f0r7fFBAf+fBKU4pecdb?=
 =?us-ascii?Q?7ywUzLUcBN+icCr/5Vu+D+c+uzt+5NCba6Tbd00OuwbZ7wDzFaEUplvDfsN6?=
 =?us-ascii?Q?T8HYoO6VIugbSbcQu9hjAOgdSkGHPr1UhQPpxT3kRN9iXWY5W+g6XGTecbQe?=
 =?us-ascii?Q?Gn6Z1gfCD5+dWzbc2MSlY08lwDwsyozZ3rHfDLsX1Rrf44I4Qu55gQdnk16L?=
 =?us-ascii?Q?lApK75VDc3BD5PvcdCpZ0aAeYgIOSNuXMGysOYPK9AQxj9Q68EvAz4vPLQLa?=
 =?us-ascii?Q?2IjweCCwpgHTEbsu2Jl/esWTCPxC2zsaSubJ6oG8XobPs7cRm7CW/fHNv9u4?=
 =?us-ascii?Q?+4IExYq2TlkFWxH2X9kPJlJFqkOJnRWpyOQ8Fw9I936II3jyViJxkqyDMQby?=
 =?us-ascii?Q?DC/XMBQ06stiYHIOdbJ1qzCTHyTieB1z5zLqeA7wGTGA+eEEfESqNj/VVWj1?=
 =?us-ascii?Q?os6zpZzm6vd2+ma9I+T+LCZJtRArekYINc3rJtz13cNAqNh6S8TC4ecu4JLQ?=
 =?us-ascii?Q?v2KN7z3T8LpjZQ3xKOF1A/awdcj388HmeOaH+7fwbrXANXGAxreqmUAfTpKH?=
 =?us-ascii?Q?mjk2q++5l8rhOZgOMDFLg/3TmWj9oBnQPxkVueINkLr6bKSIndZIxUCGUpLW?=
 =?us-ascii?Q?7bdBxBv51Zc/iOpcuM1qzo1faPGvI044gIP5+xEK4PkjxwYf9hX7pMHTsMMx?=
 =?us-ascii?Q?jKwspmBrmCPdp7I9rV4+qgDsE9rNcfrpk+IWnAtw8kPiW0PPM92bIYxEbFKk?=
 =?us-ascii?Q?5OCbsaycpl54JD/xsRvRyh0w2E9xQLdSmda1aIIs70J+k0Z1Z2qfxy7Xyorq?=
 =?us-ascii?Q?FrYUSf6jR9m28oeURYoieE/ne4S4rVyUahP+rP0zgPHcLbMOmwtxoNBtMyYQ?=
 =?us-ascii?Q?grVfP+myJdlE6MhBrmTHeSsabLRBd3kQ4o494EMv/PM+ueciq4bT?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82961c79-c2e2-46ed-6e8f-08df0f22dfc2
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 10:04:16.8216
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NveaTZvzRl64tE6M8d1CCBtYkbxIFGUCwzvXeKy70Huj5jPMYlL1XjG80vGuUGsUH7ff3izhPrJDtgdqCuRSNg0NnRE5XDk9tjJLI3mfHX26qsV0e71DxdiB8+DYbNLX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1233

Add pinctrl bindings for StarFive JHB100 SoC System-1(sys1) pinctrl
controller.

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 .../pinctrl/starfive,jhb100-sys1-pinctrl.yaml | 164 ++++++++++++++++++
 1 file changed, 164 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys1-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys1-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys1-pinctrl.yaml
new file mode 100644
index 000000000000..55e111117ea0
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys1-pinctrl.yaml
@@ -0,0 +1,164 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/starfive,jhb100-sys1-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: StarFive JHB100 System-1 Pin Controller
+
+description: |
+  Pinctrl bindings for JHB100 RISC-V SoC from StarFive Technology Ltd.
+
+  The JHB100 SoC has 13 pinctrl domains - sys0, sys0h, sys1, sys2, per0, per1,
+  per2, per2pok, per3, adc0, adc1, emmc, and vga.
+  This document provides an overview of the "sys1" pinctrl domain.
+
+  The "sys1" domain has a pin controller which provides
+  - function selection for GPIO pads.
+  - GPIO pad configuration.
+  - GPIO interrupt handling.
+
+  In the SYS1 Pin Controller, there are 8 multi-function GPIO_PADs. Each of
+  them can be multiplexed to different hardware blocks through function
+  selection. Each iopad has a maximum of up to 4 functions - 0, 1, 2, and 3.
+  Function 0 is the default function which is generally the GPIO function
+  (or occasionally, it can be a peripheral signal).
+  Function 1, 2, and 3 are the alternate functions or peripheral signals that
+  can be routed to the iopad. The function selection can be carried out by
+  writing the function number to the iopad function select register.
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
+      - const: starfive,jhb100-sys1-pinctrl
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
+            enum: [ espi, espi_reset, gpio, host0_port80, host1_port80 ]
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
+        pinctrl_sys1: pinctrl@13081000 {
+            compatible = "starfive,jhb100-sys1-pinctrl";
+            reg = <0x0 0x13081000 0x0 0x1000>;
+            resets = <&sys1crg 2>;
+            interrupts = <58>;
+            interrupt-controller;
+            #interrupt-cells = <2>;
+            gpio-controller;
+            #gpio-cells = <2>;
+            gpio-ranges = <&pinctrl_sys1 0 0 8>;
+        };
+    };
-- 
2.25.1

