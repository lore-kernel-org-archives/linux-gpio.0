Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2119.outbound.protection.partner.outlook.cn [139.219.17.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C0403E3D91;
	Mon, 31 Aug 2026 11:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.119
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788176157; cv=fail; b=pItt+fr587bjapXcAeLnmnKgYzqsPnquRmVcMCw8Apbx9i418PatF3dGsScY81Kdo4PSoFOqtG4Js4I0nohGhNYoUH1aKAOEwDWJMF82gDc1X8OPBBhH5wl519ZCLfqHrjX53lTC5BXsPqBNW+BZ6PQ8Tah8Wqpl+X/Fdgfh2rc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788176157; c=relaxed/simple;
	bh=YTBwlsJ8LegmNckGHsltKhKyTH3nW/Pe9rO7hs3CMjo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=QI9KK1ekoX3gnWBC629Q02Jcd+4IVDBTrOtIOIM/U7PpLcLyxthcRVNaWf/Y+SUq7hmuDZEyLKTbRVgzp1pg6KGX24H8vgMVlldvjkcPA/lPWO2hS7cn+nSvN/MRIzYg34AJ6gczjsysGRRgokIneXrGfmvDLKqLw8YwZ4RLZfs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hrbfnztNPFhVXjd6+NvEge/ObgEmlueh5rXOoeY8yGzoUetp9WErHmEFE9nWwoBR5eNrxuyJlZcdvlAxzxRV+9SuQaJb4RdXoRXd1uz0B4BI2TJP9QFEHuUg6WFuqIaosVveJaESJX1565Ao2YKLWF05nskhM6R6QZfXycSktLJ9mKDDeh4+z4qlys3xB2o+Ya/kLKBIZq+k9ijQWYjrjaKWnJ6qufJ0PYzEOURRBk4LJ3D3GdHkDDgNkUbLpTeV9TxPt0mOrjX9i2nqlcx1eREH+gfrcwCZ+SCxXOzUZWEp4x/QyieHiUhPZSwh1s5aci7FkpvmUdET0V6Bl01ByA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Omj9//JMmRBbHj/LdQUt/T1wkrSMoX6RMu/l0g0kPus=;
 b=m1hKxK/m1lsJM3+zrhJ9pINwblGAwVnpDM6xhn83x1QQQuPwRQ5Nks+HZ5AsALzD/JBpzPGzARr7FHRN8sEQeKLpFlzKTRmbezMqXxCVidMX2jORPSu1YklsMPSe9FKSwCIiG1JCUwveZ7yprz/FfW6h7Vm07qv3LNR4+LaRLtvmg3yREt9ujoSGZOGvLx2rKNDfVk76k//TB7zMtLusE3dVd8cezp29qW8wCFnysXTloi2yykoIkYJsPJSvhohipU41FLYXIl2dgtP7db6ZSwFVAWb9oFNSl1f9QAWoBVd0KZc+7UXx6P6PjibeuZrXsakZXuotSt9SR5Y40nvfSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1332.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:16::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Mon, 31 Aug
 2026 11:35:38 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0315.011; Mon, 31 Aug 2026 11:35:38 +0000
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
Subject: [PATCH v7 11/21] dt-bindings: pinctrl: Add starfive,jhb100-per0-pinctrl
Date: Mon, 31 Aug 2026 04:35:04 -0700
Message-Id: <20260831113514.66382-12-changhuang.liang@starfivetech.com>
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
X-MS-Office365-Filtering-Correlation-Id: d700830b-f20a-4d4d-f0cc-08df0753fab4
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|52116014|366016|1800799024|376014|7416014|18002099003|38350700014|22082099003|56012099006|3023799007|921020|10067099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	0rkwmpLlSiFwlZLo7hytg1g2PfrKKGmmMSFkZCyx/QT68dF/IaijOgVmL2p77U4NR/d9nU1LzZHqnp6/yw3LBpC4nc0RaoyNAeUcnYQHEvPws96Nomp1f8SpN0QnS8XR6hQpwPl/pTCsNAM9OUSW3dFg7Cmf8xJsbC8t3HD4PruKGzKeuOYzNDwrknMQLXzI19BXgED1Y/dqIlUczBDXDRNPSw2fJzuMmmQjyOt8kRLCmBY4TR16QgnQ+L6sxQoaQA/m2xIhpJFwZnhEcY8AMZoIYLOpMylO/luFV7uWqh1bqOlX/Y0fCrcBZK2J6OfqqwyIwaLPEsokXD4tQN1V4MotnZHONHXwAWr3F1fzobgekXjFBxScW4ho6HbOSTFU+lr27Pp7EwboffpS4Fn1lEH3XIEv83og/+mDpGwfY7gohSEkMzpaCoo+RuLooEzLOwSo/RHiE7SDz2n+QXdJQO9SLpPjqg3mkFcsEoOOPJtug7/dCjs7zZ2yBl+slGkU/Acn+H8B/CYneyEC+3JDTNOiC2cqi6qR2qSRAILuu3O1U1oOhan8jwS3Ny9EfjqADZ1OJ8/jX5lfCGStW9iG+A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(52116014)(366016)(1800799024)(376014)(7416014)(18002099003)(38350700014)(22082099003)(56012099006)(3023799007)(921020)(10067099003)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?kK49c2ga9pNBH+16DH1sdkOK0SaTZMoa2DSv9FZELVeP8NfJ0Xj3oXWjaqk8?=
 =?us-ascii?Q?gCUAURyOwM8bMW/rONin6EkdHOuFfecP+s3MFr6ozzGuwiLyTYvv9AGo5Lxc?=
 =?us-ascii?Q?w+qBdnr0n5gLdV8jUh/hgrtxqoJsAVgEQCcYY5V+nU+Ie7IYkOIA6HPXXy0C?=
 =?us-ascii?Q?anNmaiPWp2uRnC3L+/MpaCcpNmeQ33DxBN8kixZtE6LS3vJ6W5QRSshEPOp2?=
 =?us-ascii?Q?ODVQKqqWF/tipDDkYVALJB4S1emVhZ7mBrZgHineTZyQWytwrY81rhwnuF9A?=
 =?us-ascii?Q?UZrKvDQIx0qnODl8VwBC4iyqrp6sSI8UhekAyIG8c5X6NY7DGyQ78OFmCmjn?=
 =?us-ascii?Q?9TlZGd9xnxH1pcOaugnm63Nb/9xMB78quBicvYIwkpMG1MsfcjIxIj5vv+MT?=
 =?us-ascii?Q?CVsW4iNp7g8FZQO0bU6VWpFwCHccz7JIw+ewzYHmRtDS3pEmb4QMVh2d2QiN?=
 =?us-ascii?Q?o+DSCHX0xkCG5YNooqXKMewJW3XNRAdmO2o+lGYgLKwVZYRcNHkVcfEAUpxo?=
 =?us-ascii?Q?b6LLoTfYZ1chYypx2nQe+bP5EijsHjkL1HGS9m0CmESh//ipWPN6KB1K1bKa?=
 =?us-ascii?Q?07RLqzWLl/dZcKdeLH6d592NqUSRMSdFtXpdf13B3ez8WFFWhJ/cjtNjqgfa?=
 =?us-ascii?Q?YGz4phZr4fvxERWdmXuxBpZihLGAfzafoWMqJ2Qv+FPsrge7k65Ey0Y8qL/0?=
 =?us-ascii?Q?sjGcskcPQYAIcUBnROFsd3xCUNE7P5mzL25CjEcgNWPs23941S3Eo6aX2aLY?=
 =?us-ascii?Q?9Fn6I5/IbeLRbXoFr4j2V4yxOYmMHCSfGs0NU+t2ZyxewjvaJnaELuSbcZJE?=
 =?us-ascii?Q?uFwmoxXwr76eMmzQnFWaBRoTWn03AGugONWcd3vHC3WNT5wY6e4RwhJlfKJt?=
 =?us-ascii?Q?dsc6g9vyG5+scLVjcXT1kQ9ejH0qlr2CourJO/7NtaUBPUYrRryBd8nTdU0N?=
 =?us-ascii?Q?1NFqASazlXnp0x7Bj54UDmVSUYrhTR6LdV0Y/2z/tqq+jfTSL65ByIkwaic8?=
 =?us-ascii?Q?B2cl8Sdz+xgRaEvV0G1YVnaKyQuL/guD64QvgAo7bGYfntGzcnzjwEu6M5nq?=
 =?us-ascii?Q?n0WBa96BrGYojNKLI9sVQrq1RL4ci64+tgZIgClcS+BghmAduxKMFJI61smT?=
 =?us-ascii?Q?jEA0ms6CFFN4QXfKNuRxaZ0reshINa3R+C5+byHFIzQx+zAVuykIk6ifTU5/?=
 =?us-ascii?Q?Y0l/ReS8O9Mry5JHkP2kEMQYAj031YOilDltiAnYtRtb3hAHtHTrNk8am0og?=
 =?us-ascii?Q?LVZvDajiQMjx6Rrzbf0HD8jatkAk2UDGBwSg9lnY+da4vTCu8lUcrDoz7w14?=
 =?us-ascii?Q?J411LyKdkr9yGQXoAbsYKvu3aQOE6kazUClZFERT3NqH/gdBHXj9SQd0tlSs?=
 =?us-ascii?Q?RpRwhzZ3veTwR/QZejMhFBFrI3MiWvP8lmyU5YaJi3IhBFzQ4pgfIdQcoKOA?=
 =?us-ascii?Q?Ew1WjRhJ2Uo/Z7sqnZTXKrstvxBQiX0RPLN57ED63LSAPTjPZAvpfHz/UGbk?=
 =?us-ascii?Q?byzcCX/xVSJvR1fdgN/whC+lE41sjitfHG91rvkV5kmJfp1c37G2Tt5xtBAn?=
 =?us-ascii?Q?Jv12kMiSNaFo4Xp4Cv//swGgIOWJ7C6q6TvHvlt1fghpQbbkRq6kR0F2XXXv?=
 =?us-ascii?Q?llT+twdGx6pvXrHjXSMYO0OOSCWKfEohKzX807ujpDVwxq1KZQd6ABDxEJsL?=
 =?us-ascii?Q?cdQU0HRtuko6TkQYT43aH/My4UstisqjO3xx0VLlE32pz6dJGWEMAddswEES?=
 =?us-ascii?Q?TeOJ13dhpvKIGjQ5mniQ1M1C79C41VhxpKEehWQkYdv7jI8b8irR?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d700830b-f20a-4d4d-f0cc-08df0753fab4
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 11:35:38.0929
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9pPOlo1oWEwgOCr6BLivaChqQORg1NeglIC3yUIDmyXsWtEG88Wu1W7kw7MIq4KwpIKvJg7ioXAzJseOzm5AvoddejTrlSOT9WyI8rcHFiWRlyohbAu18FmKMzoBN2fA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1332

Add pinctrl bindings for StarFive JHB100 SoC Peripheral-0(per0) pinctrl
controller.

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 .../pinctrl/starfive,jhb100-per0-pinctrl.yaml | 179 ++++++++++++++++++
 .../pinctrl/starfive,jhb100-pinctrl.h         |  62 ++++++
 2 files changed, 241 insertions(+)
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
diff --git a/include/dt-bindings/pinctrl/starfive,jhb100-pinctrl.h b/include/dt-bindings/pinctrl/starfive,jhb100-pinctrl.h
index e701c30913ce..e0ad453d6884 100644
--- a/include/dt-bindings/pinctrl/starfive,jhb100-pinctrl.h
+++ b/include/dt-bindings/pinctrl/starfive,jhb100-pinctrl.h
@@ -77,4 +77,66 @@
 #define PADNUM_SYS2_GPIO_A59				35
 #define PADNUM_SYS2_GPIO_A60				36
 
+/* per0 pad numbers */
+#define PADNUM_PER0_GPIO_B0				0
+#define PADNUM_PER0_GPIO_B1				1
+#define PADNUM_PER0_GPIO_B2				2
+#define PADNUM_PER0_GPIO_B3				3
+#define PADNUM_PER0_GPIO_B4				4
+#define PADNUM_PER0_GPIO_B5				5
+#define PADNUM_PER0_GPIO_B6				6
+#define PADNUM_PER0_GPIO_B7				7
+#define PADNUM_PER0_GPIO_B8				8
+#define PADNUM_PER0_GPIO_B9				9
+#define PADNUM_PER0_GPIO_B10				10
+#define PADNUM_PER0_GPIO_B11				11
+#define PADNUM_PER0_GPIO_B12				12
+#define PADNUM_PER0_GPIO_B13				13
+#define PADNUM_PER0_GPIO_B14				14
+#define PADNUM_PER0_GPIO_B15				15
+#define PADNUM_PER0_GPIO_B16				16
+#define PADNUM_PER0_GPIO_B17				17
+#define PADNUM_PER0_GPIO_B18				18
+#define PADNUM_PER0_GPIO_B19				19
+#define PADNUM_PER0_GPIO_B20				20
+#define PADNUM_PER0_GPIO_B21				21
+#define PADNUM_PER0_GPIO_B22				22
+#define PADNUM_PER0_GPIO_B23				23
+#define PADNUM_PER0_GPIO_B24				24
+#define PADNUM_PER0_GPIO_B25				25
+#define PADNUM_PER0_GPIO_B26				26
+#define PADNUM_PER0_GPIO_B27				27
+#define PADNUM_PER0_GPIO_B28				28
+#define PADNUM_PER0_GPIO_B29				29
+#define PADNUM_PER0_GPIO_B30				30
+#define PADNUM_PER0_GPIO_B31				31
+#define PADNUM_PER0_GPIO_B32				32
+#define PADNUM_PER0_GPIO_B33				33
+#define PADNUM_PER0_GPIO_B34				34
+#define PADNUM_PER0_GPIO_B35				35
+#define PADNUM_PER0_GPIO_B36				36
+#define PADNUM_PER0_GPIO_B37				37
+#define PADNUM_PER0_GPIO_B38				38
+#define PADNUM_PER0_GPIO_B39				39
+#define PADNUM_PER0_GPIO_B40				40
+#define PADNUM_PER0_GPIO_B41				41
+#define PADNUM_PER0_GPIO_B42				42
+#define PADNUM_PER0_GPIO_B43				43
+#define PADNUM_PER0_GPIO_B44				44
+#define PADNUM_PER0_GPIO_B45				45
+#define PADNUM_PER0_GPIO_B46				46
+#define PADNUM_PER0_GPIO_B47				47
+#define PADNUM_PER0_GPIO_B48				48
+#define PADNUM_PER0_GPIO_B49				49
+#define PADNUM_PER0_GPIO_B50				50
+#define PADNUM_PER0_GPIO_B51				51
+#define PADNUM_PER0_GPIO_B52				52
+#define PADNUM_PER0_GPIO_B53				53
+#define PADNUM_PER0_GPIO_B54				54
+#define PADNUM_PER0_GPIO_B55				55
+#define PADNUM_PER0_GPIO_B56				56
+#define PADNUM_PER0_GPIO_B57				57
+#define PADNUM_PER0_GPIO_B58				58
+#define PADNUM_PER0_GPIO_B59				59
+
 #endif
-- 
2.25.1

