Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2097.outbound.protection.partner.outlook.cn [139.219.146.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C0FE340DA6;
	Mon, 31 Aug 2026 11:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.97
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788176163; cv=fail; b=gtU9XNme2EFm/PXyWGKja43aPQWBIRZ+PfJSC1XoIjnuh9b0fb0FOt3xPeuWsP2i9LUCeahFuK29Fq29CkVlRbhZwYodUPckcWA0RqadsjPPnvBKPlIWtYikigUlW3X8NM9JxD6m2xfSGvWKmRl79aXRupB97xrUjloAj2TQxC8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788176163; c=relaxed/simple;
	bh=f27RUBPNCVLF7ed1+1ymBgeLS4OHCIewOGYMNtICv+s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Tc4iVZTXB7BWyOZQ6RwIXIW1U9Cktl2BvlFlc13dpeSvwsB7YR/BuDhxQluFDBWenLPOaCxaNLK/lj53BKgoFFrgdHcvkFUYoxgdCPebPUXxAVboYPd9zS6HQ9TDXAVBLavWIHV40MWiseCvVA32GNLWEROTOqRKThTLh4I/jFA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PWdf3lgipMPBns2zYefmotT22sgLms1v4FCsAJ1Q1fzorr8oWrJfcsG8KIKZMHhoY29v9b/t+NiJk5TFX5A4xh32cO03FXc3fHEnxVMvMRCR3YhOh7/Nsf6Vu7wnPbme4sIGgdCvry3iABqFY8OyMQNzpo8j8UYvDR2MMRA5qw+TJK3zgp8yVYK01G/JsQdTwwNieZa7VZeMFgYndIdrey9MT4jm+i/L+gcO5UWPFdSslb4monEGQd2oObDUPse2O6PoVMq18Wpz4u11l3J8PCYqeXgSNWkHHtKsPZrdpisjiehrgivWM+hD4u+7gtaCMDVmU9XvQc16fWyCKkepQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aJZQ+TX1aDp7B5dxZGztDjmHXumC8Ewe8FvYaCsjec8=;
 b=jO/tZDl1jyFMTaHVy8EW8M9RGFOYMYl5IVHccbUK3qkqULQY43NwbjRQWgpW9hbqgUNo+4PizTDAL27eskC1/W+jY4yDqEX1GNhGq675iLjf2riEcmGw+uRb9N+oe/ba6YFtORgYprUEXm9YLXn+cf+JIGE/B4hKowZ+VFuZjoCJ/WfIFSsg+Rp+y7a3k+MLdU8DlgqR46ZFH/mBGoOQ5yd9Ybqi/lvVQphKHwOclcGZFAIoXDKQx4i7Var95ubjO3UCxJpbOjtOUQIVj2uXeuXP/PLpqQepDn2KXy1u7fqgrSMnrUKt8cimOrS0k1sdsyVh6YwGnMrsF4SrhaPI4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1332.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:16::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Mon, 31 Aug
 2026 11:35:42 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0315.011; Mon, 31 Aug 2026 11:35:42 +0000
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
Subject: [PATCH v7 15/21] dt-bindings: pinctrl: Add starfive,jhb100-per2-pinctrl
Date: Mon, 31 Aug 2026 04:35:08 -0700
Message-Id: <20260831113514.66382-16-changhuang.liang@starfivetech.com>
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
X-MS-Office365-Filtering-Correlation-Id: c6c30221-6ff1-4249-0acd-08df0753fd8a
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|52116014|366016|1800799024|376014|7416014|18002099003|38350700014|22082099003|56012099006|3023799007|921020|10067099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	OGRHE9QiSDa8ianpUTvvBkeXvHQu6qg91pMX0bfxE+frs3YAlcp3OGsiXoL5mDW/ux2uG+Nn11++3SxdhESf+eZG7Fvzu+nknqejywRAnJiC+7wmAXn4DbHMsQK9LwAUwb8Q448Ky6HJHFlfk0cjvUPRxC7YTq4LNW/rlqrtaTTEDQg9SYllsCLhcq7v8hX4DeG+3zaHpZHzR0qeQcGRCurtAh5l54xuGYbxOsEEvIWamiG5p9cH/Ao01G4JCEYTxa6CsE78zObrd28MH7u94Bvz8jRzYubbKcsB1pof1EOLdyC7tZTQGfSquGB5+8HUujByPDbN3YTi17vL4iMZ+jp1NfLNVSRbAQ3W/43qUEfE/K+T2kWl9EdobK0TxnZ63DlI14/AWKk1KOadyzgvjKBioRMlozW9spK8mFKBN0NhzxPW82FcDXhVGOolTcV3fUA0ucRGOtqdhOu0sCZMg8AO5fTb9pXCVrPkepbRzgXnblVKjn06db15YyEl0wmCQ4tHHxMRXhyygTznyKiwYEVOpuZNxPC10jLB+dff7JOreuHgIYFId7Pp0W3zcSdi2ncwX6ym9S32ehlZwU1x6Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(52116014)(366016)(1800799024)(376014)(7416014)(18002099003)(38350700014)(22082099003)(56012099006)(3023799007)(921020)(10067099003)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?IkKhxV2i16fH0mr4R8kX61Wn8V0KLok8RUR6Lq+tw1T0vCO8v9S1pRdznqvg?=
 =?us-ascii?Q?Rwkox1yRWh2zf+CAZ0989Pise0SAISnIts7PeC3llFIxmuzHPzHiYnkZk8B3?=
 =?us-ascii?Q?jF/ln1xRUkKHyF6LkdzgmS3vpObWF+SYntoyCvOyqAyLwvzLKYnaeFLxdM93?=
 =?us-ascii?Q?nnPbtEXDVBQL9e6oYY7/aWiVI/tBckDF9zBYco6WJcT35ZjkZveENN5bR1yo?=
 =?us-ascii?Q?f/GLiCqoWPhhKcs7bveAufByjym/H8/wt7gt9iMrhXQ4HPB8kivfxmViUqZl?=
 =?us-ascii?Q?nsugX796P01tDAwYEXL21LgXHypQlJiTAHFlWRkN6wxvoJh5S79kMp/sJLD6?=
 =?us-ascii?Q?U5n2IeAt4Qedd/QzvjS/DxvWe8NMsWAzI16MhX1IlvOzA4ZzVgVNQQl5ny8Q?=
 =?us-ascii?Q?DIka5pPBO4Lc8hG8dG4QJRfy1KHAXlYYBvP/UMBwYLzAGM9ARnLbjSDm31Pg?=
 =?us-ascii?Q?bMyhofrJ6TRV3s1V0uVPzlrPvpdwqdJ9l34+eTWhIUpK3aCuYTf93JGbtEUP?=
 =?us-ascii?Q?RMk7GYbKOlfUSP7ot+LXq/hgCri8i9GgJedDfJQq/tjc3n8GzXLV6lm7jJ+B?=
 =?us-ascii?Q?47IUgT6ChHwLze7K0Ocmd/RbUhpCrvpG2bGLCnl3nWUQYNrcwWpHesaGOhG7?=
 =?us-ascii?Q?xPkgeJjtMaG6DA8I76z1Z7C/WkOtBIdlMIYbVPnHdSH0ySqyeD6aJ7Xt/Djk?=
 =?us-ascii?Q?Sh9K/pXub6btf+nBf3j1Y2/hmCtThekxYsyHHfmHfuozQQlg7OAo1mX9axQV?=
 =?us-ascii?Q?Efn5sBtR3Eh3KrtF7IcJkQ6XBg8k364f6aR6HtdUjkUhBmQMYu0SsNU8Wt3U?=
 =?us-ascii?Q?1c5QAw1iYsb0GK3hsor4B0bIUR8kIADUlW2s/surPyGDbuMiMa6yqrfo+z7B?=
 =?us-ascii?Q?cepMjYA8igXZ5cRF2HnplHWZGtejqAsKME2SPM9VtNSgWUQWvUMRLHdHk/Nt?=
 =?us-ascii?Q?8eh4fcJvcDFQj5QB2axvmQzzWsv5APLpQhm5HGOyMj064it4P+TQ5rDPnbVR?=
 =?us-ascii?Q?CKjmvDZF/g2J/DdChbCQkLlFEh/UeZy58nhtW0AXejN2+NOydMh8hgEJHhCE?=
 =?us-ascii?Q?eag8+y3P9blJXchnMhb7NtI2yII4NY+4lMUoGGnTTxWIqV09zmJ7C4+ik1cE?=
 =?us-ascii?Q?4UTl+WZvnd1ewwXBpBGsDVOLaV8E7xBxzF1AuB/M3x6N4rNjK+JM3AR4SVtg?=
 =?us-ascii?Q?Wwflo7cPigHAweP6XHkLkkqXBf08aVFiUbAHIA+GdjCDIWR8GUq7gCSh0yO5?=
 =?us-ascii?Q?7sc7Kwkv5Lj5GZd5oyrdZ+wR2ls1tWxzprbQuf3sYERVtifX2c2AUI5a6fET?=
 =?us-ascii?Q?Bj7FrVvFX+ggJKmNZGGvgwAqVzFYkMc5nB2OT2FxZ+u/LX+Tdv+3BCN1FF+v?=
 =?us-ascii?Q?GY1pxtaPiDGyAlNQy9a6jO7CqJC3BR71sw2yaho9qeqhoCvQ0drbWUA9IYCz?=
 =?us-ascii?Q?ipUWwReoFy2VS5fsvLrYwM6zfHG/cFF0BqZOyKXJUhIWyUfqCC3QavbFnZJO?=
 =?us-ascii?Q?NMfYmNA1HFVFp6YEJo6v0dMJiAnfPO/9TO1vuItbZ24tfv4UmLlPFN1XnODL?=
 =?us-ascii?Q?54NPF69nExdE7Odd9yepMP7SJBvoSl8hlhCRFfjbvMXAPYZBN9LMebqGl4GF?=
 =?us-ascii?Q?h8mQCGLnwlJ4JARpUq2PeAkehu8I6RnZG0jOez5KdWw7GzzxrHm4QWo/c5Aj?=
 =?us-ascii?Q?5dUZJ51pFPVYXuPmvibCV1mRbmzRMqzzveeY63fGJnrRZum46PvK2TctrM+A?=
 =?us-ascii?Q?sq89QxomyyaDYH/9mDdH3rg3HxFkQXPFVjv+ZIWaiXoM6zT/qkCR?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6c30221-6ff1-4249-0acd-08df0753fd8a
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 11:35:42.8198
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KZSVhY9iPYNYuJkwubqxqBBftfw0WxJDcTTDIHQVX9UZmq71e4Kb3EyqotKwyZmyYx4vxOzXkHqqzhbtIineiatKSyr+/qHlByiwXPQmHElgypiSvfbqCx55Z/BAZMUc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1332

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
index 000000000000..18ee37a2bb1f
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
+        pinctrl_per2: pinctrl@11bc2000 {
+            compatible = "starfive,jhb100-per2-pinctrl";
+            reg = <0x0 0x11bc2000 0x0 0x400>;
+            resets = <&per2crg 0>;
+            interrupts = <62>;
+            interrupt-controller;
+            #interrupt-cells = <2>;
+            gpio-controller;
+            #gpio-cells = <2>;
+            gpio-ranges = <&pinctrl_per2 0 0 31>;
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

