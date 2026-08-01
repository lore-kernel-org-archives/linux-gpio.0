Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2133.outbound.protection.partner.outlook.cn [139.219.17.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2416395AF0;
	Sat,  1 Aug 2026 10:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.133
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785578496; cv=fail; b=sUCUnd2ITZzQmtXRFsUa3QaCFosi1ooam19Y45B5uG2mI7uy5AXg6KUmreysJU0QXrTNoL4d/Tz34x85NunlTigZIMAj28F1sT3PDcYhrVnVqIL0fft6THwn84ynoFM5WGqw/tpo4j7OeGgyFVfaN6ZTwJtVuFcRLyEp6rgiiyY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785578496; c=relaxed/simple;
	bh=G4WaiBXhWaSfd/2KkWyKqoyUoQWLscfdEn7ROl8LUyQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=lYw/g9NHwViyyeas4VDu1axvHUcHT41adZsgi/DCp+YNfUl6zirWxky58e9q+Sq15620gVWeIIsAJ9o6TRRMMRwOEaXE1wNUSRBBVAXxggLRkA1isNSLTlmjk0xv7NmVaE6HWpQqIczmCmlNEul/CrpzpO0Ju/BVqBOlbTXyz2U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YMvAqV7wWgfIoEs2eyvHW5xZCxEYlVv9HmmazPMf0rOk7iaY1pJWPvCTzzeZLXUq8KXgu3iCVO/Ag0AslCZCSgBjB1IUQxOiZ3g/ZLi+mMbmv/+dMqawoOh2NBj+be7GWX4qsnF0ILda8E3455GTgbSK/DOD2rhPvTYvoZz+iraCzE+HIqvRPUy16fl8kfIItHgSPhwGWFy13eSb7DzHwUXvvO2U8NxxreSD9NpwM9a9BPhMzHZo5nCFf+1MJpHNRYqWHyGEi77rwl+Q/JVIk+WsC5ZuDMVEMLW9PFp53llz+r1CldKnPvnuNXBfOK/Feg2t+QVvHpAN2cznyXvm0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f/VTlv8oYLlyWzTrsXH+to55fi1GizXa8U9+OvPKxhA=;
 b=MdM3vNQ+bWpm5hhFJbiPd0hBu1pvZR5ExE6BXtBF1xajHNwiCEpigfG9Rux6Vmw3cLComYFoWB1wGavUdF7rBpsdk1eg+HFqIpRnRM7/C5oKIdgYYvGXZROIVox0jvvUTHeQ8RR0P6qwkPATVhFZ/D6gA9V9DTYa/ESxcZ3/N3xXtXdIvxiEO2tHYR/0sMMwsRl98uAbzBUKHWV2fo80EtRLRGI+19l1pPlp2vmitOaskdnKfO/dNoD7uMoQ5YIrYPThnb+sfZjYSI9z6T2VYzvACOTC1k14ehjhvEm7Blzd4XZE/gPqzSJJWb9iWPgZkDqAp8mFBatq1PpgRNaabQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1329.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:16::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.17; Sat, 1 Aug
 2026 07:27:23 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0270.015; Sat, 1 Aug 2026 07:27:23 +0000
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
Subject: [PATCH v4 03/21] dt-bindings: pinctrl: Add starfive,jhb100-sys0-pinctrl
Date: Sat,  1 Aug 2026 00:26:53 -0700
Message-Id: <20260801072711.153217-4-changhuang.liang@starfivetech.com>
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
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1329:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b483365-c7ae-49a2-9e30-08deef9e549e
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|23010399003|366016|1800799024|921020|38350700014|6133799003|56012099006|10067099003|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	aDI8sQTWakj/xnASHpMn2zmzhEmWy3Twjj4TwpwoRXLxAF+nmrXRW2uxfXFtzWY+A0SC8BTm8dS3EgO1AI0v6SuV2nAte8cpPLrdCOghzVGq64ffbwRS7Y7YsSMUp9ZZjoya/SOIvL5OzqV8TRYrS+8B9DenfdSCedmZmdhChyj8BDbK+lnqF/bOubAtA6HpMn8s72e/ORaWP5pPtxAOQmrYLQEz18WzsMgY2gJWwRet94Pxt7MA//V8hzvhN7OEu2ogo/j2lilt11C5RJmqoNbwl/YP+zXu2ZWjmvjvDvo1etitxNzj71rAjpneltIoDpKtMVWeY2AcKwWN6DWYe3pcWnYvG7Fo5qa6rYLB8EmaceZlnFI3Ru+a3LiDOpv1F/T8H6BKdXoatgX2GkhKJe1YqwqEu7SwrZsxW4iN79ZT/wCoeZhQNdIG+z7WlVbhodPqKfM38FfhUDHSARxqFjVBckVcXs/mnFSFIN3nwoF+p3vBI6vG00W4hrvJXUuPxjy0BCtTwkC4oPw19jU/95blJrZfvlujDIy0dlTLrCIMBcRZ7zMzovprA7I90+nQ8MOwdw58Zq9e6P6mYA7eLw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(23010399003)(366016)(1800799024)(921020)(38350700014)(6133799003)(56012099006)(10067099003)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?bVJfyASHMuAwsuSyRaGH+7d8Ldw2yAZ5lNw8MG/o8s516CXMpUjCpdnc/QZO?=
 =?us-ascii?Q?isi3OY9zh/A+Y0c5Q2EFvYhgFinQ0olvnRFaqh6C5DAX4iAbJyAGiGVxG5yR?=
 =?us-ascii?Q?j7E458ZOE7IAv6ko+LhLiUoBgPN7QOSpM+ahhIcgtZ5+NBaqp/nD5c80Afmr?=
 =?us-ascii?Q?Ys9cTvCJI/ASnN2sZCINx1sx9GV0ReA0CaXfrwJyXDBfEhEePa3rm173m+31?=
 =?us-ascii?Q?8mwRJ2eCh6Bv772pm6Asdq7MZm2XiRNFurpYhIJSZpnry+uNl2fpLggR+TUm?=
 =?us-ascii?Q?2ljb41nblZXhsXHMBNY6U+NoLABWb9n332pvjXC2E/5+dIkcPn+Wtk6H8Y4B?=
 =?us-ascii?Q?Sj61OUN/nZunLor0H/v4F2X+pdBbZMO/pw9Ug/kY0eyE/1HuJ8+OfN0aFEfg?=
 =?us-ascii?Q?EJMXygw5mzyfWV7Xfx+hWeSsHfhkoX40TRFnHr6MosokWzJZnq06a/hagBLS?=
 =?us-ascii?Q?QZjnefQ9EvR5j6942dFdFUWR2jNPpsP4jLIeqE5BGScElYPvpAF+qK94Tct7?=
 =?us-ascii?Q?MBW2OIizuKbB3KFmDW56e9/U6ant3AFwLcSYrqTw9tjs/+bTxdojf0qQ02ZU?=
 =?us-ascii?Q?JjMqPPoyC+l14YRvZPlroj2a4ufN0p4dpfMqBT3iCTuXVI4RFehKP08zxMIo?=
 =?us-ascii?Q?Bix3ZbOETaiWV7qqxtWv3Bc+V9G3FGuOWjpb1QYoXPgH45nRAgjrND/iFnzd?=
 =?us-ascii?Q?cEinW1gtyS9QBSwEzCm0dMY29Y/3Km5u8LxFDwF4YgB3Uc03t3a3dcF6FRGP?=
 =?us-ascii?Q?FJ4Uq0H7nV2XJMooDlRbBScJ+NZKaiMB/h9RCsKTi+O5z9sFaeJPFrClFVlJ?=
 =?us-ascii?Q?buZJ4W4NW5/SBeX4/KBU1CAYIgjBRt+g6WkvTECn4yuNb6R2/Y2/5aYsrn2F?=
 =?us-ascii?Q?OWX5YBoaX86nthyN72RI4d2XVcWjXJOTKIRI7h2RH9UC7DsWqRhevrbyhYy6?=
 =?us-ascii?Q?rM2oqywM+vGsivfdTWjPDw+1+BfTe5ienL/1Y8PmoAS2y+HnpA/pRELeLs7o?=
 =?us-ascii?Q?PvnV2TwlhTIqWZh4gJwnVKxxwwCNpqNuvN9pTZwfGARos/TgcLQqcgm50R2/?=
 =?us-ascii?Q?MJ52yMm487cMAJYWzIe2OomnsMU1dTOrX2MPlL0j79QiIPO6Jcl4KDEwGprD?=
 =?us-ascii?Q?RBzLk9ySJ52MRqFGXBcbIsTwh2IxFF+6bfx7H+8JGWfh6LL5tiXgO+igh++q?=
 =?us-ascii?Q?VSCBqkowuCfHsu1TZT3KyF7tpoqKIf3XCWDy9LmUl1+oB/jRquvzYs9UAcNt?=
 =?us-ascii?Q?9GTElhclhWknXmdh81YLnZKcQewoLoqCmojyuDiZlb+8yC+RWXmvg7RScNcO?=
 =?us-ascii?Q?OY7mh6YhdkfP/0FjRE5Htnwo5AmEIO+NkxBKPtUX8+y3AnJijapF5j2BopcF?=
 =?us-ascii?Q?jG85BnvJ7Vy7V/wUFsQx0jjo8uYmus5xnyU9kBXAIIEtmPhLoxDlcTJeFhvf?=
 =?us-ascii?Q?bSuzg94jFMTlRSfD6EBPNP+rW/0AxFpFYn+kiknakSoBWOz7PpMSHSIzec9j?=
 =?us-ascii?Q?BOHQ4t/yLAKxIq6n/ppiiX5+ON+D12czS5GP7DKgatAc3FFfBJTuvzYSmpe+?=
 =?us-ascii?Q?MoBJLeiG4M6fFUjaMD0gxd1kKiTjd6DyqRdUvsrqfp30LSe0wL9DbkLx7zy7?=
 =?us-ascii?Q?2/zF1IkJHeIOgWZXIlvMs4RD0zJAaz5cs7GQTl9uBoEOqP2T15Ue3AE1Zw1p?=
 =?us-ascii?Q?IDSm/xEwxK6qyUzOlk3tVRqIRd0zTUEASyl71OJrtCT5HausMG63VDnDAGeC?=
 =?us-ascii?Q?6wy48CuzYk2L/zDk/HsfkhsBZwLorIhD4gMVR2QaDkVUhBPUcWan?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b483365-c7ae-49a2-9e30-08deef9e549e
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2026 07:27:23.8293
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Rv/KUAg+dGrTTC+IX50vHEaTOjBq557pLD3Rydb4Zsw/KIUwTNjahes74KN0Hn8ye/sfjB4e83Kaz7DssDNxl07hDIWMZ7M6hUoRwKPph9lTiwJtcNIQ/uwvxRWLbsJc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1329

Add pinctrl bindings for StarFive JHB100 SoC System-0(sys0) pinctrl
controller.

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 .../pinctrl/starfive,jhb100-sys0-pinctrl.yaml | 164 ++++++++++++++++++
 .../pinctrl/starfive,jhb100-pinctrl.h         |  17 ++
 2 files changed, 181 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys0-pinctrl.yaml
 create mode 100644 include/dt-bindings/pinctrl/starfive,jhb100-pinctrl.h

diff --git a/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys0-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys0-pinctrl.yaml
new file mode 100644
index 000000000000..135767b3dc65
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys0-pinctrl.yaml
@@ -0,0 +1,164 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/starfive,jhb100-sys0-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: StarFive JHB100 System-0 Pin Controller
+
+description: |
+  Pinctrl bindings for JHB100 RISC-V SoC from StarFive Technology Ltd.
+
+  The JHB100 SoC has 13 pinctrl domains - sys0, sys0h, sys1, sys2, per0, per1,
+  per2, per2pok, per3, adc0, adc1, emmc, and vga.
+  This document provides an overview of the "sys0" pinctrl domain.
+
+  The "sys0" domain has a pin controller which provides
+  - function selection for GPIO pads.
+  - GPIO pad configuration.
+  - GPIO interrupt handling.
+
+  In the SYS0 Pin Controller, there are 4 multi-function GPIO_PADs. Each of
+  them can be multiplexed to different hardware blocks through function
+  selection and each iopad has a maximum of up to 2 functions - 0 and 1.
+  Function 0 is the default function which is generally the GPIO function
+  (or occasionally, it can be a peripheral signal).
+  Function 1 is the alternate function or peripheral signal that can be
+  routed to the iopad. The function selection is carried out by writing
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
+      - const: starfive,jhb100-sys0-pinctrl
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
+          trigger enable/disable, slew-rate, input debounce and
+          drive-strength.
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
+            enum: [ auxpwrgood, gpio, hbled, pe2rst_out ]
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
+        pinctrl_sys0: pinctrl@13080000 {
+            compatible = "starfive,jhb100-sys0-pinctrl";
+            reg = <0x0 0x13080000 0x0 0x800>;
+            resets = <&sys0crg 2>;
+            interrupts = <56>;
+            interrupt-controller;
+            #interrupt-cells = <3>;
+            gpio-controller;
+            #gpio-cells = <3>;
+            gpio-ranges = <&pinctrl_sys0 0 0 0 4>;
+        };
+    };
diff --git a/include/dt-bindings/pinctrl/starfive,jhb100-pinctrl.h b/include/dt-bindings/pinctrl/starfive,jhb100-pinctrl.h
new file mode 100644
index 000000000000..6d8f5516a178
--- /dev/null
+++ b/include/dt-bindings/pinctrl/starfive,jhb100-pinctrl.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: GPL-2.0 OR MIT */
+/*
+ * Copyright (C) 2022 StarFive Technology Co., Ltd.
+ *
+ * Author: Changhuang Liang <changhuang.liang@starfivetech.com>
+ */
+
+#ifndef __DT_BINDINGS_PINCTRL_STARFIVE_JHB100_H__
+#define __DT_BINDINGS_PINCTRL_STARFIVE_JHB100_H__
+
+/* sys0 pad numbers */
+#define PADNUM_SYS0_GPIO_A0				0
+#define PADNUM_SYS0_GPIO_A1				1
+#define PADNUM_SYS0_GPIO_A2				2
+#define PADNUM_SYS0_GPIO_A3				3
+
+#endif
-- 
2.25.1

