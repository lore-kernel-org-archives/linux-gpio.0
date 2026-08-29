Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2107.outbound.protection.partner.outlook.cn [139.219.146.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5233D18FC97;
	Sat, 29 Aug 2026 03:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.107
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787974297; cv=fail; b=H8pcuC56FIbzxMA5/yHahLPu5Q21cPH2nEhhBt53nNtrKHqO/qlZwmmr3NMfVURZeulxzAUFWUp3IQeeqEQqTYlnWM0nHwNAA7ykga0RtSKltKMZO2UwE5FWzGCNr4hFOnsfh2DpT4UEyIJTu64nWcaeRWKt9sFWd+ZBvuBF6nQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787974297; c=relaxed/simple;
	bh=nPXERAw6K6xp/QpJWAW1ADn4zyDGXLeltGF/V1kx2KE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=KLMkonYd13gF7PTUvaWBrMp+WsKV0bWySgf6K/tSVdFexjX085YSMQ6cXdoxgyBmY5tdlWhXXvMNW5Ra+6Dp08BaKKtuBrHKUNN2QHmc2nr+0tokTJnsDpRZvPbpIqBpp89FGNVn3Sje3hMTv26g1SOFyaQ1YiNCsTaNYV+u6PM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.107
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DJKLY9tgvXSyijC2RvnApDRGheqR0jPNSzKVZ1wPQN+2UvRXLzuYR7DzFQxKjtyhpKHoX1+xNDyNupWJz5rNxYX5Dylp48U1Dd5Mgpu+tw8sWuuSeEHDySK1lfTLZsZpFpZKaMwS2P5EqBp39Q8ePP0Euq8vaEUQN0s1iVbFF1Ei5d76KFX577CeBd0dNDR6OyIm+/jQNMYv1kQEsQc0XJQEp6u3gL4XCXBPooAWORDH2jFL5DtWjgThhGFEpp16Q7g284gX0dd778hhrgTXf8Jq2muchLvOqppHOyCqFKV2rKjc2OPON2TRtRvOh8Dc+c4dVqCErBaIXOzZHsm+6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=po1pzcV8G+4MX10P/Y6IoZleJpO/gT0HZX0XY6Nj2h0=;
 b=a3JR5DmJsEC79z6xi/m2aQrL25e2j+fvSt0fuYsCtDQWmcdooFNvmxsMEopXpb7z1io8Rwbp0sa4+far3R3jngZrfEOApQ/ji+/k8OhTp/s0sUcYtrWJNuU+z56MR4veO/PliHd4naV76lbVDTkX8W2+194aSk+4OUd7g4loeSUytXo+G4lE0oN6VgHuhbMKF4031apQndpP4w9DmMhaa9l2ZXWTNSAwD4epmWZWfi1SWSCt9OTTAcFc481UgWW4PtbTfnZpFZ8p7T1CkgJq/U5BCi/GmFOSWoKxMjo/siYgDeuHgVuwTawqJywJnjg9AEDqFNqCXrlNaI6tYTI1aQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1153.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:13::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.19; Sat, 29 Aug
 2026 02:57:37 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0315.011; Sat, 29 Aug 2026 02:57:37 +0000
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
Subject: [PATCH v6 03/21] dt-bindings: pinctrl: Add starfive,jhb100-sys0-pinctrl
Date: Fri, 28 Aug 2026 19:57:02 -0700
Message-Id: <20260829025720.23915-4-changhuang.liang@starfivetech.com>
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
X-MS-Office365-Filtering-Correlation-Id: 92caf5a8-232d-4f5d-e494-08df05794874
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|7416014|376014|52116014|3023799007|18002099003|22082099003|56012099006|6133799003|10067099003|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	6w2dWIn2rq0uOMJ2DeEWYyZGsabT/XYxcf+B+ciGcTXmJ/P788DG/amXg7HTXnXPUR7C8UfM6+y9gwrYLBdPNQGl0LCt9ePbQ8p1pswaWCHfSBc+gSmwum4uLbRLJUHKgxiI3TAjoUd5r4XRQJHyuh2ZKuXY2lLGIop3JWxojMq5YsPa24UtO6lDp7Vwtnh8L/25Uy+saEb/Akt8mokwnEYC/yRgObu879OwAfj+4cAAvZKa8vbXeTHxOdm4ktrH6nPlu8M4JP0AWFF0ELQkJbpoVPVeol3GEZT0YkECdDnTqqR3w55Gs81F4VwyoYyAO/zvPcdwRQIaAn9OeqsNH9hH9G9KdQv0YgINWzt4+f5kZO3TMR4djMCp9F7/jGBh78Ch1CgMrDz5LnhUdy8u+fe9wruni4Ipo9adKxDI8ul7ns8khwVIHqA6C9YLg/L66Cwbi0BQfD6LfRzw7iB4C5A7LX0YylwWFTeTzRuuuYQi5Jbxw1UvOxyMmbVJuLSELvmXYtLwEFjcB94I2UOXIWfA2DC2373mXl3sUD23tS48WdJYtjTVfAhhxa+mA1FbsuGrnlIzx4Dm2wpCMDhENw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(7416014)(376014)(52116014)(3023799007)(18002099003)(22082099003)(56012099006)(6133799003)(10067099003)(921020)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?urLFyb8j6Zd/gA2068hitrunPo7fhFUGqjAQwCs0L/VQaLPKoV91L8W/ldTo?=
 =?us-ascii?Q?B+cYpcDiu6BGjFakJWmfLvvmcqnP67fuBYJkZI+l7HZKS7sLKvZh0QeZPF92?=
 =?us-ascii?Q?AdgqZhVrR04+haCUmHHx44AE5XNUGXtcRkCeZ8U14/cXKTV6rmmdd+TsTCkO?=
 =?us-ascii?Q?WdxHZ7ckhPAOncJs3Pp6GET6tTvTGRpL5wXL/VFu4g06jSU5zb/6HeOX/rek?=
 =?us-ascii?Q?oQ8hsGqeyFwtIQW/XR+Ffax0T0LpNKWlMjajtuEaV+oFv+JQl+LVrhm6LSUc?=
 =?us-ascii?Q?dEqXkO/1huXp0QuDM2PZEmurJ4UwT+74lzpdEdL+rdBi18TyctgSMOPQqE0X?=
 =?us-ascii?Q?hqHPlmfzeCGArCePM5n+n2CdIS86MFvcy4+U9pnXwiu1MrTPqtgbOy2UXqt6?=
 =?us-ascii?Q?DGEut0Hk4dlDCNvG26OWFQhSHD2/w/iml/cpyPwhtv+Fax1+HWIZAac6Cwfl?=
 =?us-ascii?Q?n1TVFW/WE25yhJKEeRN8F11WBdm/sRLh6flKZhipYKDBiTZV/efFbAyZtH7P?=
 =?us-ascii?Q?TdvyR2pb18vYxRCIHgeh5qwd+7EUpLLLPZ4/LAxULWoK1/YqfFjBkkVvW3RC?=
 =?us-ascii?Q?sKIZX2JE8rd7amGH7Zxpb2fPohrf3rIDZv2m86tgxkF8R8BW0ZvRcJIr6FCU?=
 =?us-ascii?Q?MThV4+nRfBAqdWQZnImsHG6AvsncbU/z2GIN/XLZ8tgtl2UIx9HCcJ+GaBaV?=
 =?us-ascii?Q?iyJ3xt29NmcfsGc/Tsn9DreqZwh3GVDEfITPO2uxt3CU+bS6zdMaYk0+oM99?=
 =?us-ascii?Q?9z/hdJZlWPVwdNQAKbbvAuAF2YW18ZP4V7asNVzHLoVSypdZYDQmU8HfBS1Z?=
 =?us-ascii?Q?vQFx8sLWPXiUBrunDMbKwyMDRQjxglFxgSGnlty/R9sfg/mot21kfMCDoxHb?=
 =?us-ascii?Q?nD1QbaCJn74MlXvLtk065PFQyoni9Vx9zSDIjb0jYE6R6SLc+bZCOCOakwNz?=
 =?us-ascii?Q?zjbqN6b3K6fkpbYmpOUPW+/t2o0legaJ8rkvGBHBvBDumRjkke4qLkCYXj/Q?=
 =?us-ascii?Q?lT7bWK6JtyCLDMoF1AJykk2ONBxJCEgORZI94Cr9wB9hzsWtCJ/ueDbn52fB?=
 =?us-ascii?Q?hKQpWlLpdF8AeRnKH1CJAuesY/yK7JbLBHGaG3CmzyTR3b326B4K5ApB8biu?=
 =?us-ascii?Q?jfGHJdy1LdM/8YfNCXLVVchWfzNUPKdENG2m97zicrmcCL8xpXESh13h7swz?=
 =?us-ascii?Q?zj3SOhEfWefxCoeWZpM3hxNLi9VmfeRK8hFihE894nCk5UT/4ppMc3qklPeE?=
 =?us-ascii?Q?BtNoia8WqGBAD3XLdoMrsTgU+L4ez6stNPWncx7GVF5gpx1xTOLtcTIxUDLk?=
 =?us-ascii?Q?v4R5Wdk3Cvpz8cu7c9I5X7HMFMYpW07hcZTRp+seog+vVB5012/2r+Ek6Hz6?=
 =?us-ascii?Q?6VnnSsrX8iokWTy+s4BpM0Y6HOPw72wzikIVoeJPjLcOsmrN6kkY0KjhsxLe?=
 =?us-ascii?Q?/KixgQF70ZlHAeW+S00SV34lrDjYP9QDfhrkOA0KrENQd7Uaze0r1WmOakEG?=
 =?us-ascii?Q?7WZaDu/hNYn+6a1r8VkebGJheTyenvgWEpYu25t7cDrgx3goQGYe3vmMFvWW?=
 =?us-ascii?Q?eZRhrqsKTzDZ/9lZvXiMycD+H8d5ZIIeJBAKDcp0N07svLtZGjzWiB1lpa0h?=
 =?us-ascii?Q?5V2qhaSYrK352Qe4NXROJLAkgLwA7PUReqx68ZlZ+fBdPQ9wnGJa6rxc3ztX?=
 =?us-ascii?Q?AnBq1KvKeXV6yb7cDl6TTqMpIeswEBqwj5fuxdh2k4a7h8D+Yo66OmbWlZQ0?=
 =?us-ascii?Q?7Vo0mwMdNe9Pnt4bKeh5Ube7b9I20rns2+Xecsjqh1XC+Yb2apAR?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92caf5a8-232d-4f5d-e494-08df05794874
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2026 02:57:37.5680
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mDl+SmkQIoXt3qQuPo1GvjFO7sLzSO7qTYOxD4EVsZEe5EKoK6oSorGG9j5efuYJaQkfeQA1DwamyXcZM2x9XKDiF2FA3PvB8yqwF9BOKfWzJc5DVUekNJVYyzqdbc8R
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1153

Add pinctrl bindings for StarFive JHB100 SoC System-0(sys0) pinctrl
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
 .../pinctrl/starfive,jhb100-sys0-pinctrl.yaml | 164 ++++++++++++++++++
 .../pinctrl/starfive,jhb100-pinctrl.h         |  17 ++
 2 files changed, 181 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys0-pinctrl.yaml
 create mode 100644 include/dt-bindings/pinctrl/starfive,jhb100-pinctrl.h

diff --git a/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys0-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys0-pinctrl.yaml
new file mode 100644
index 000000000000..7df1a1f39f14
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

