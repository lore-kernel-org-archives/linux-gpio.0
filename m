Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2128.outbound.protection.partner.outlook.cn [139.219.17.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97B3C400986;
	Thu, 10 Sep 2026 10:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.128
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789034715; cv=fail; b=iU0jF/vnSAwcCyBhLFqBIRq9oRTyU3g+G9jibb/gz9xv4Uk6ZfWDfpG9DVkHraVwROSmASUayuRNoDsDP3WwN851dMIHfIUaGm1i7ZpW2mG7ZhKJx3CnVjCOujXA/heD4wB0YhbKyDwa9XBdJEYWhQrwbQjQDpzToeGPO3tuLQg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789034715; c=relaxed/simple;
	bh=ezh8CeT6YJlE3T4ChSeG5VHA5O4cWUrwxFUqN9+PVKk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=LZQXuY26sOLipqlNQBoG6eW6phus9ohiFeWk2kWnZPoQcoV63dOOIkiGZDP3VFgVPIWvCRSY3YD1eCz7LvNmzkyk0EPrCBvspE2ir2z1K5mekWf9ApgIiULgREE2Lh+E6tyb/Ns2n3NdeK0ZDfalUOgjQEP9LTWhsfWhBt2WNwY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eFq2wWJ+FbaOvR1ZVhR1FSoHdWgffKu9zFeAft6S6W6yp063ltYU6rDmwmh9tdukVr4T/1PO0GnPHAlG/tSPVxd4pyRvLQ8vgwQiy2rDp/Fk5+itmidVJ6t5AhAhTxNQJobJlWAuoC/wcITL3zqRxYJbIRVeKPuNFPic13jVQ/fAASh1h5YwYFlQYo99mkmqb1pWQVtX3sS+BS5iXu8taGliNyohouFFwO3zWKtL/EdVGLrHN0H5G0cxkTHakRB+bpmsPmYTti1JyN6ScbtD1rvPN+MZ1ZbogHEaNBUcx1NthLJR7YJZknaZ81LDiIduyH5he2e+p1JOuPzXptSrFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zi+Ve0J7zYP7BR2wDhsrOBotAWi0cknBQbUyr1IEZ9Y=;
 b=YQ/cu1w9qCz5a/c4Do600jRgTzF3muPOcmzNdjSHbZk+nwENxbpV7jXWsFVB3O05ruGHhuZy79LXTnH5frkyF5APeXK3sZ+NfMFxtyNkNwMDAketpBxv2DPOdaQhQOL529cQp3tRsEURsbSstn989D7IP8pKFtqwaHKMbddDh0ajVygJYeQ/TDpKwROfez7VgoEb6Pq1FUnuzBKNECEZJp9vsUS2COj5SOChw//caClDzsfcH5Q6vt6nkc+KuWAw0h24j06R4u2IXpbIThosliqylan0fbUd+6suG1CJnO6pz7IPxg85nd+ZzAGDyUw0kPHRYuAxHhfNxMBkKfbwNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1233.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:13::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Thu, 10 Sep
 2026 10:04:23 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0339.017; Thu, 10 Sep 2026 10:04:23 +0000
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
Subject: [PATCH v8 13/22] dt-bindings: pinctrl: Add starfive,jhb100-per1-pinctrl
Date: Thu, 10 Sep 2026 03:03:48 -0700
Message-Id: <20260910100357.130134-14-changhuang.liang@starfivetech.com>
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
X-MS-Office365-Filtering-Correlation-Id: d0fee3b2-caf2-4c5a-914c-08df0f22e39b
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|7416014|376014|23010399003|6133799003|56012099006|3023799007|10067099003|22082099003|18002099003|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	2tmKgPLRbKmnDgmqeXUWvBI39Cx+QeSlTYxwKPkMyJt+EK8wyAtNUYQSsoU/ob3OJvZWFIM8uUfkDdD3XUOp2ivhsAIZfhyJiQ0R1je/bZPWC77jgcsY5k55JmMDGs/H89aPStXc+abKcBJ1RIhcRiTTqxKvOoi11eXKo3qnnq3DotDpoCOKN4TgkZ5SspiaKpK7MZlUSmt3OvqTMWCdwJu+0Jge/LtceXnAOqZ6La8k8ZvLrHc3HPYKSRL7kbnXuP5L/ZLzrQUCTl4l3Y4rZhZWLTFhJcdhiApjm020zQ8IBLIl0nilfbSLjmYUbK6g3TaF6mIK7zDysv2AIFjyrJvGcTrYg8XcKobUQXeRZsUzlWH7fxJJYIaz50LzC5YoHaAqKI9iC8dwKyaGMLMHNhURbMY4Ppi8wo74uOSqNqQZQxFnrfZ17KBGhb5211fJoYhD+jCZQRBqo4+gysVytg1c5CHkIY6RWBsednifXhpk6/UxfJm0dZDGtLconZ4XUxtgiF5aLwOcWxW9OHJGA7JHkZtxUNNnMWP59n1Pdg5eJH/0Voyaja60+YD0lZhUMhUU2ANXww1zdYC2+QTEag==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(7416014)(376014)(23010399003)(6133799003)(56012099006)(3023799007)(10067099003)(22082099003)(18002099003)(38350700014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?LB135Loit0WDaxIbQocdPpYXm6ZOi/B/wpsdVRD5Ev1VohuJuv0Ell/hl7LG?=
 =?us-ascii?Q?Wqcokjiy9aBnppVHHcn1nJnigmt6F1czEmBBkkhhT8FYqGtX8wBlvE3Q1BCW?=
 =?us-ascii?Q?xW65tCu9ct0WuHKKdJT613MOxJL7J19Em+/HCxVL4WlC9Zr14vDnYKaXAuYA?=
 =?us-ascii?Q?JOv/sxTqM3Cu6eCW2gXyDMkM9vYcfdLRtF8GK/O47g0NtySfNMysz22F3Vog?=
 =?us-ascii?Q?nB+S3ev7HMoE2qj6MftJJpJARRC3kN9p6FlkJ3P+OzUQgCRlFn07xnjkji/J?=
 =?us-ascii?Q?y4Lk34lAyG9Tki/qlnYvLOp6y/mshTO1oI/a5WHA+KB3oeYJCaKF3ZlLuFKz?=
 =?us-ascii?Q?w/A8I/y/EwYHf4T6DRmMBzBovUrgU3JfyHrOl2FK8T5RovHAT77pT+w7NBNO?=
 =?us-ascii?Q?VR9RN06P5/arFDxi7Xxk21DTgKIiXZE4cr83wmeLhGLFdmw1IuVMDjCbgDzW?=
 =?us-ascii?Q?GmtqUQooazdC4zJjQ/RYgSPFh0K3kWwcT/VM6IvcakAHky1Rx298gszwPpVE?=
 =?us-ascii?Q?CdhUAaFPuYTBXAuUxk96RyXSeZiDVRDi6TVDnyv8FkHd9gf/0pMcfXt9bECD?=
 =?us-ascii?Q?Qk+iJPIfUrhFDEBiCSwrBdIkcak1c61g/rdxAtRCW0Dp1ekBK8N0VInk9Xp1?=
 =?us-ascii?Q?6kE76qmf+nvvdezsdfuFkUj2XOB9BG6UY0psu1JQTnMR1S7laJt7VKlLTPvE?=
 =?us-ascii?Q?fXfxNx5aCtR/ybW4tlCZzpdjtAnEt0yhLqh7Z3IP40d7D7k3yOnAhEEkF9q+?=
 =?us-ascii?Q?JpD5xHeDNW7KLmNu6FTldxrl7J2uRokbLRY8+pGLyRpeM6tUjauw7K/LacTJ?=
 =?us-ascii?Q?wQSwmESWnEhvDQ4why/9B74L8dvZbq0uNdDn6pDOekVUBCcGzQ/FI0Tte/U5?=
 =?us-ascii?Q?YtMFr2MwBv++ZBFxapzpCMUyMriXfBcewkppHcYlq5ON7VhP2+OKf+wZaBVq?=
 =?us-ascii?Q?YcqtuoiENYlTHaO+yfk01qTdCaFb7bIrIXx6PJkOsZVqE0TJIvRWfjgy7Vs3?=
 =?us-ascii?Q?arF4kT/Fbb9e4A2yeFDbU91MiJRLq36RdhFNjXhMiIdATeleuCew8DgCRS/O?=
 =?us-ascii?Q?Iw2DeEVKWR6Fp6MAdSXEdgakPaVtgg7q85B0KwkLbZjQCZxr8SNdmy4FVwMK?=
 =?us-ascii?Q?/tn5YHKth8HlAY6i7e0IyjHwEDnQdC51mYIMhvmcyVq9IBkg+yc0E9RM5SI4?=
 =?us-ascii?Q?Dw/WIKM1597pza4oOJg+VJSjc8Y92Xwcu5OXQBbngRWFhi3h2xcIY3lFRiGs?=
 =?us-ascii?Q?9KPUhUfnTjuivfWtJaWQvmaJvyqJ68nMYtqN+MAwskG251fSCiU3I6ZUAKNG?=
 =?us-ascii?Q?iFeB9mEhB34WzLYHz/zrFkVZx0xP6PM9AwmP+J8HGb46kT5UWXJ6/v4hQioC?=
 =?us-ascii?Q?9vZJZAr0H5H6bbCugqQRQmJyvjKDqcg7MeWYZbw2Ru0NjcIallBVzlDiUWNc?=
 =?us-ascii?Q?WmNn0/UJ5zBP5uDbhM7nYAu63qvV2clhtumYQuPhqwN/LQ3PJRYtsjB9KZjj?=
 =?us-ascii?Q?wjoo1K3QqMsoCEGDCyMsGn7ce7kA3fAR+3KMsSL5YT1b4Ne8Vm+Te9YtrsCn?=
 =?us-ascii?Q?rkNe55j6Xr2GXBM9EUF1lNfIoAAhB6ZzRdlRNtrCp3lka+EnLTxbQ2syRIdp?=
 =?us-ascii?Q?GuEQM/GdIUowPxVovcLGYfRD9H1GQcsGkKmSGg4PeoE+X3aVgjkGmcygP0um?=
 =?us-ascii?Q?DTcc30Kd9evnoMSRqzlH9iGmPD86KVwEgE7y8Kdn3VJ1JCqH+i6y3sQiuLy1?=
 =?us-ascii?Q?6wsUfGkPoqyq56HA9taP/EGw6j9hy4ytJS7DG/nZD+XtLf9X/9t+?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0fee3b2-caf2-4c5a-914c-08df0f22e39b
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 10:04:23.2735
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Xd26oP6LiJnf1i2GhJP80X4rlFeR0WqIuF1D7J4YGYiHDcsHHUak6nzbM6RYTaV1AjL9YNGHyhdP2sdjYPIV2/6YZtjQxWdBTSyruXfbtSLn6lGb+1vuoU9t+Z8/gkKB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1233

Add pinctrl bindings for StarFive JHB100 SoC Peripheral-1(per1) pinctrl
controller.

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 .../pinctrl/starfive,jhb100-per1-pinctrl.yaml | 178 ++++++++++++++++++
 1 file changed, 178 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per1-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per1-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per1-pinctrl.yaml
new file mode 100644
index 000000000000..932dcc8ace85
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per1-pinctrl.yaml
@@ -0,0 +1,178 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/starfive,jhb100-per1-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: StarFive JHB100 Peripheral-1 Pin Controller
+
+description: |
+  Pinctrl bindings for JHB100 RISC-V SoC from StarFive Technology Ltd.
+
+  The JHB100 SoC has 13 pinctrl domains - sys0, sys0h, sys1, sys2, per0, per1,
+  per2, per2pok, per3, adc0, adc1, emmc, and vga.
+  This document provides an overview of the "per1" pinctrl domain.
+
+  The "per1" domain has a pin controller which provides
+  - function selection for GPIO pads.
+  - GPIO pad configuration.
+  - GPIO interrupt handling.
+
+  In the Peripheral-1 Pin Controller, there are 36 multi-function GPIO_PADs.
+  Each of them can be multiplexed to several peripherals through function
+  selection. Each iopad has a maximum of up to 3 functions - 0, 1, and 2.
+  Function 0 is the default function which is generally the GPIO function.
+  Function 1 and 2 are the alternate functions or peripheral signals that
+  can be routed to the iopad. The function selection can be carried out by
+  writing the function number to the iopad function select register.
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
+      - const: starfive,jhb100-per1-pinctrl
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
+            enum: [ gpio, i2c, sfc, sgpio, spi ]
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
+        pinctrl_per1: pinctrl@11b42000 {
+            compatible = "starfive,jhb100-per1-pinctrl";
+            reg = <0x0 0x11b42000 0x0 0x800>;
+            resets = <&per1crg 0>;
+            interrupts = <61>;
+            interrupt-controller;
+            #interrupt-cells = <2>;
+            gpio-controller;
+            #gpio-cells = <2>;
+            gpio-ranges = <&pinctrl_per1 0 0 36>;
+        };
+    };
-- 
2.25.1

