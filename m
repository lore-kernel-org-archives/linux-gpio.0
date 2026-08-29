Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2100.outbound.protection.partner.outlook.cn [139.219.17.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C37E8233939;
	Sat, 29 Aug 2026 02:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.100
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787972347; cv=fail; b=WmjteXbZumxGE45BTPW9PCOasu3Wj7nuTZ4lJrsAWUexsgvmGeMvZyizCrtVMNXVt+MUzMfjlBBv77o+XGsK4Aa9kJQ+VygFACTz/5qgaGtxyNW6gR1RJgzoj6lzjH8wSX4sSg5Q1cuStrdLIxJUF8xBdspXBFsHAbm+4df/qaQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787972347; c=relaxed/simple;
	bh=4scRk9hqpylmDspu7jq89NBKrNj4GaKymowOmBFHK5E=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Fdcf86rqvvX6ScnR3/wJ/55cXagcVQGVh9bfjdqxBqWavv4RT59Mwp8hKXqiVQM1N8e43uknD5ccjPlNv+QNcGqzx0etwv1VWghiwtAtVYz9e8hel1U6jchWzi37QCZyPDFDo9fwEEzm0m4QKS/INf3IrguzyEfGv3n8lmIQK4Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JdIoOe7fn7GEPwdnGhPxgoM2eIYbzWZrRs/RosiDcm6ObNHFYj1sV85NP+P1TqPTw1ZxpXZLDeZDCasF3W4ds0npD0Eeu930PXSl2Nd4IKiWwscm8+zIzRAQaSsXQpMTWPRlzg+/Ad67/fjqQ64Z0JR/U2p/jY2d5EwR2AERD1j57b6YXlst0a5IWshcfD01aQY23g8vTS6pIlegPxClmEQmIdUkMO5kO0p4TqX6jDfluPwhFXDbgo+NaK0yIGH78TkouEi8CdPspYYPZqU9KpuJ+bZGxEN9x4IO72I2X7oekwkbWoH1T14XeQafk/BX/Leao49IJ9N9HS6PWNrueQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=baDrH8dRQYLc2YZU0blBzv3MdCYHipeVkxXYguDyeWk=;
 b=kXOZ0hNdxEUncWYTr98oKqjauHu8wjA4grSI/i+4NZtRP/VvHb5xe4M1AUSnTifHHz67x07UIF5BYECzWChjjPf/FM50edcYJ0GMIpn4xXkAGxkm+5VCdkOLI3imZtRvXQWIYN2r2xMVyxkId0O+D2zqI1Xp1ei2S2VBDAju+Y3MqoZYkZscSK+E5VvtSqC5iTyCqpReDpXUB4N1vVJv2sUzHIGuuXAeatx9EUwZ6/k9VJHBK/WjofKXFldfoteBLXDno6kbv3Kqtw0lyl+EkhaN9WI3+YLBh4ISoYXZUJ2MzYYmhAoXirWNPQWKaxOscd/gK3vyfysoaCrhoqRwrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1153.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:13::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.19; Sat, 29 Aug
 2026 02:57:48 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0315.011; Sat, 29 Aug 2026 02:57:48 +0000
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
Subject: [PATCH v6 11/21] dt-bindings: pinctrl: Add starfive,jhb100-per0-pinctrl
Date: Fri, 28 Aug 2026 19:57:10 -0700
Message-Id: <20260829025720.23915-12-changhuang.liang@starfivetech.com>
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
X-MS-Office365-Filtering-Correlation-Id: b2ad0836-59e0-4e66-3946-08df05794f1d
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|7416014|376014|52116014|3023799007|18002099003|22082099003|56012099006|6133799003|10067099003|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	PSHOsd8GwZGqjDE/7teHdpy8P1XqU9whdvTi3scEwrS8TJcoKWHp2VE9ejGdIDtLNChpapLO1gBx/cMwXeVxmd2oaJCdOTa08nRmnOI/KEruE+p0tD08JHd4BrjjJd4BugcEZ7JGtS4AJiANxyeEGHF+RZE6EtOic+0DsvCASNHh3H0QYjRTnuDg67/XH10DkeoP9QOtOvN51JCH1LwlkwIDHrLYS60nt2GciTobGy56mCn9ZvUklqn5iz0jzguOlwNi2fzT5JcdiDbAGvXRJ2KU68oDHM/hNoxbZQt/CTvAwKWMec0dJPfKAhziZh6fg0JAO8iVvFM/qsu1mdbKJj2zp2ZGIJOrErsvu08xgF1ccbzqqN97A6hsqkgobOW5qTTn8uM5cgDRrUBydq2uyZVqcBcBe9q4YOG+EJM3XXHLYbaREhPTGOkfD8bsI710Z6JP5Y5ojXDpLjZuT1Eih4kqyTjF/kcYOAVuuDHR1SBZfiCINOlc9H+7HQJSiqrzx8JnRY7x6ocVqemlTfhcwt38ySUUpr7t9qFuV0iBe3EO/Aa5F3YDfDSK1YXUu0gCkdWt9bSXT9WjTcO3mOWMbQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(7416014)(376014)(52116014)(3023799007)(18002099003)(22082099003)(56012099006)(6133799003)(10067099003)(921020)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?uz5+3PQEy5MSsiCtYh4bKsjyQ0bx/PETAARaIm/zBVb/xz3wNbgjKv+eMrQg?=
 =?us-ascii?Q?uzzmwtUTiiLuqKzN+KJp1YNThy+G+fEtwAQTqThGba+Z0HeoCr+mt7ZlNmWv?=
 =?us-ascii?Q?941QivSMW76kMHxi3BhV5a1rHOs0PLVKBhmY1t9qTWaU1xrVFeJ7QPN7fcIf?=
 =?us-ascii?Q?fmNv16387rZ99mcWgRBs64CC+7VBsmY9wmR12fhCykZ2kcHucZYVDULaDVeD?=
 =?us-ascii?Q?UN1KbsbnX/n/9LximlNxMlR5gm9MULJbNg32I0d4lCa4mCPCT+eucqvlOz71?=
 =?us-ascii?Q?4fU2dJWPra/4B4Oaj93OPTNj1xsieBm4VgVNxgqr2ptQXk+u1oKdU0ZUX+U6?=
 =?us-ascii?Q?mUu96LMKrOB/t4LPaeKr4bx3QvoNPMGIhhpMznVZ3bo2tWZ+FaekfzK4kkTM?=
 =?us-ascii?Q?GOtchwr70vGOTHUZ0GWk/7nELnRqAdU/8wbLyLv9P+lQZzJlIWM/5u5VGHEQ?=
 =?us-ascii?Q?NDp4y9Ke72E4IU1r0WbqJMedA0kwatr/fbHCfZdUoc/aTTaJ+cUk1Mz27VgO?=
 =?us-ascii?Q?foI/ZRHtQSz6Vd2g6y67K9TC1ta/kfdjhcJwv586zxfH04OQ2eHtOwCCM8kF?=
 =?us-ascii?Q?YjSHuJsrOOvJn6GWW90weMqCC8NJWiqufGMxs9MpzR2IvtabYR8JZfwECxfM?=
 =?us-ascii?Q?tJ5wniQ6Kg2XuRrr5eXTXdj9bhlNC30/L//vOdV13eUimYGav4bTT8TWu0VY?=
 =?us-ascii?Q?3fpyMQrfwToR4yJzsjJbRyG4AAX0TlDMBhkpkD3ygCcDzyrXSC+AlaNzw1Of?=
 =?us-ascii?Q?CaGQ+dba3dCPrb/I85VFn/olLRfdGxXR8gmWhaWWysSVtvjJvAC9cKgnOeUl?=
 =?us-ascii?Q?f1/oVVLvBwJVLsHlZ7t1qnfjTV/Y8fr+xU5l90jTi4WsBBQV6eV2em7zCwd/?=
 =?us-ascii?Q?kEzdZcdKkAaAd7ETsDWHetsP2uAObEzHBedJSrsVOAELZY5Skg5IG07PCnoU?=
 =?us-ascii?Q?nBBy7FkbHs7CNTzZxoEz7W7RP4zQOrTlIeX/r8TQWU7dVS+hCOwvCJq95dlm?=
 =?us-ascii?Q?EPmwk1KpY8hlMCgmX3FFGSTjTkNRbo/fnW5oN0Ru7LV4zFz5tkYtjrqUhiE0?=
 =?us-ascii?Q?sJvkvdsBJmXPzrH3z+T2X3J3ySvXNYlfY6H/RHioiTrumJbvREBD+dPJbnot?=
 =?us-ascii?Q?/U/qjA6K8BsMAJ9Yfmu+yRRbK8WqJyqbpvYleBZ34R2bY/dplarIqbT1e27Z?=
 =?us-ascii?Q?Nrw/aq/LPOphtEJ8h9eOUVKvVB6xaWXs6ROqHyqwMPHbgIvCDm3DcRyWH5XT?=
 =?us-ascii?Q?k5Yvj6mpyAK9nP47e5/eEiECZGnYWlf06MUygcNE3q3Ko9ejPaMIB4gxdcUq?=
 =?us-ascii?Q?idqF0FAalHZiOLCyLRk6vfAbVuPZqliKS+7K+AzgvVHlbcEu3EI+pROWw4uH?=
 =?us-ascii?Q?Z7fA7+uHZd9w0RVTYS0TjkvGzdmpE6rf2kIsmIZowlYYWEw7rLa6VW+lO1Cb?=
 =?us-ascii?Q?iI4BSymzj80OMy12lXc8J44WQ2N10HUcJibHK1ZUKdhBoNsipJAHpSuxy7uV?=
 =?us-ascii?Q?03u8/6cUZftx9ciGaoFuQNvauTdBUuIAPzqvzs0mWlE5o5TyHdD8X/uukv1k?=
 =?us-ascii?Q?XXLymfrDC1GmoEBVJv7Bp3NtSv78SbBmZOXMutX01F744WTS+yM0myzWVP7k?=
 =?us-ascii?Q?2cbGWqLX+aMywjJSc1TWMYPmkGUVW8MeBycA/xnfTX3Rkmt45f4JZG6uFRnY?=
 =?us-ascii?Q?Dg8lW97R1UxAg7NafrfUdqK8WCNEH1z/+rw0z5wg3L77qq8NFc/5RB7zOxeU?=
 =?us-ascii?Q?vZ4vIvufTUv31MVQfZIkldzgqlY1ae8QmO6y54Hs51QcToRYkp4w?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2ad0836-59e0-4e66-3946-08df05794f1d
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2026 02:57:48.7396
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Cazgb8kSsG+QOJOc1D6OpgpqmI9KP+HxJyyGwJlHDBimjG84gPo3PSqcUAtw4vovvu3W4BMpUy5tF13no/jHrKrAqi3+npyxy8wGQoSjepIawXxbpovBXPHIHfBF5N/P
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1153

Add pinctrl bindings for StarFive JHB100 SoC Peripheral-0(per0) pinctrl
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
 .../pinctrl/starfive,jhb100-per0-pinctrl.yaml | 180 ++++++++++++++++++
 .../pinctrl/starfive,jhb100-pinctrl.h         |  62 ++++++
 2 files changed, 242 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per0-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per0-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per0-pinctrl.yaml
new file mode 100644
index 000000000000..596b284769a1
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per0-pinctrl.yaml
@@ -0,0 +1,180 @@
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
+            #interrupt-cells = <3>;
+            gpio-controller;
+            #gpio-cells = <3>;
+            gpio-ranges = <&pinctrl_per0 0 0 0 32>,
+                          <&pinctrl_per0 1 0 32 28>;
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

