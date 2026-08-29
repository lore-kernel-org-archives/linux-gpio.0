Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2120.outbound.protection.partner.outlook.cn [139.219.17.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAB102D73B8;
	Sat, 29 Aug 2026 02:58:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.120
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787972294; cv=fail; b=u1+l6Lf/CLfAj+qQB9Ci7lTDGeqOMNLz2FUrqv0xIHWRaE3hiG40CVq5k+jka54nYQJZYHMMEg774pKikQ70Wlk4nWJduv8Mb2CxLgsfxXgfiGBCjxLDX52exGWOcu4viy9zZR0knm2BQOHIqcLKX3wF99xiMWeoBZYik+09vbs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787972294; c=relaxed/simple;
	bh=ToBYrScOf8nhcQ2TcjCKlVccdfXjNkP0kloSgnV7Ixw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Ul7i98z/qbrnfgJAQ4DG78JQ0x/htYkIT0faSbWbQYUkk1WJjjXWZOh7E/SS/EIqVFwwc0EbEtFoFsW4NsUjckulnUEj3XlsbKphExlBb/uNUB+3fIC9dPZSz73OVSaoOzr6flqEqrtRd555HYvsZsu1uDFjn+dxLAiGXsuSdic=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m97TKc19PaleezGUDTvoRR02/W1mjiPCL0C+VrLsiClfHExZdJWAu8aoesYn0f/VVeciNoeA/3pUeVYjNZeINNNOHWl994UXkMAFOssX9uwq38cYh0r0qXCoEmEOUVifzJvK4GAhusigCXNb5jlQCYFItt3ixregJCDAagcVj7qsFqjIlOKv8gduvMgHvKnAxBpua/MVOtkHxsslcGfF/bSQ5CBfhdCbeLO6ngDrcyv1gKVA+OBTq2AFyPXEKdVDfck69JDPIKN4MWzjP5knzJHad/DsU4bv698CF4Q9qrexkNn2/QlrsSMMaxSUmnuQS1DHtOqHEq3cqQ99cn4gtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kALy8HA2BWX9Jk2DfgxjQE4aLoT2FH9rEuPjrdvtLzU=;
 b=jNQKIz8ceV6u//oxntsMdAXAQiHwL848WV9n7j7oHFfNsSkJAzsbv7QYRGxKMKE50K+ZwjZ4PcGfj/ZdkOWN2XLjLtJIpvYdQMeHo+WDeeu0f+xUd1PMXoufvK7Uu6pjnc7JldVdldX+KrfNG/G51hjOyaG4bBebGsHxljLcakxtFojS5qg4l008p79DIiwdlE7vYUS4g+IAW/spuO/YdqmxWIRnSe/e9yba/VRgoIy8Py15OLAU8Jcu62oj9QI+JDYIWu+BSPlgxGgcQgkZ+O7MLjQK2xeL1ErZOfuF2+qGzNRypsBlwdigJg/Rjq0lyqA2ZaqyJZbZjQFZ0aViXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1329.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:16::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Sat, 29 Aug
 2026 02:57:59 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0315.011; Sat, 29 Aug 2026 02:57:59 +0000
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
Subject: [PATCH v6 19/21] dt-bindings: pinctrl: Add starfive,jhb100-per3-pinctrl
Date: Fri, 28 Aug 2026 19:57:18 -0700
Message-Id: <20260829025720.23915-20-changhuang.liang@starfivetech.com>
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
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1329:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e7cb27d-e753-449e-b517-08df0579558f
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|7416014|366016|52116014|376014|22082099003|56012099006|18002099003|3023799007|921020|38350700014|6133799003|10067099003;
X-Microsoft-Antispam-Message-Info:
	1f2BMP0VoHmCBD1wYnLrD7N+jXTu5jK3Fd/qk1fElRVZ2H1sHCJWGVohYkfnbTEk8tArkzBui5a4zT7ZjONnG8nFOKOFmKGLzLoVH7FLGIBqSYEdQ1TjTpvRK0s/vURDgH3LSA5ozGRD0r4tYs+PRpqcOWeZxBsBdLROlZVYdjIQAoJaSeRd7tdo7+tgD29Xjdymlqj92gl9JL4aTZE4eBMJrWwkkyJnmHMZVv4n7cxbv1+m+iI/Nb7YHnDk6fGaSgFobpzivnX6CRqoZRjPvdWTDlGo3I66bH/IhDKYrkUdnbGVY59Mxg2WqGHLxWVJRv9ORHAhX3tklfpw+kj3quJMAnh/o4yOwNblLEsOK1KShSZRRH4S+YIAg1PItA5cztnxnvc1/siBLpVXViKlPVbf6hCUdMZmBMX5ZUBPWHqFxjlOxWYks5DjdlBIQTZqkxACqUfaOnJVEm/aSxeYvjo7OBtAcBdco34tzcCBKTAi7jwnp+VkRu0XX7yHQiK66lsd9D3I2PASdnuEcYiB38cInyjntes8aMvFZMu3kfqvRB92lqhVwIu/tAvnn1K5fp5GWwbeEtufbeZx861yig==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(7416014)(366016)(52116014)(376014)(22082099003)(56012099006)(18002099003)(3023799007)(921020)(38350700014)(6133799003)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?F2D8HQtI2siapSce6357+KmsZurMHvHjuUI0HmBgETFngoJHoKq8nWtig00x?=
 =?us-ascii?Q?LYHLCV9PLmdRHCVNH6iUvUuA7gc6YVNNsh09CV4wR/im/hmPmtuEaJofA2aB?=
 =?us-ascii?Q?zg8CLM2ED6V5iFzxDnIIXVan8m+aJhGP4X2sGmYC0wR35F4rJnMJvLB5XbRx?=
 =?us-ascii?Q?g3eE4zqh/S16AaMOmulUzCmVIIOo7Ygs/mX/LIBw4RN/yGozkK3S/SBng7fu?=
 =?us-ascii?Q?piX5MXtgLj8KbH34/qFg56sUNqUtGBuBCikEBZJ2oLujakSRiSVsC60xEW4u?=
 =?us-ascii?Q?6SfsS8onzEYeLrd+CKVwETy72O8uOge2nZ3wX0rcTgsJqyMwA6P/bXhzbq7d?=
 =?us-ascii?Q?XSkuuH1ajBkXP6P4CG5F8C+jCzt186ylE0Z87GkTCRsO+9yegM8Tg3fWN7sW?=
 =?us-ascii?Q?tRFa3098GZcrmJ4vE+8lL+CBal9c2ug3KsnYdXeSZhlrjMpEqZdun19dMcvN?=
 =?us-ascii?Q?tTZhkrBz5uayAr3tNerKKojwTYSuS1yeurhwb6mCuTv278/FCz/r/uKBHc4z?=
 =?us-ascii?Q?7Yyrkd3TWVkLBAJukHr+Dl9WgHUoaKSw9U3p3deMEn9fNil+NwvqvufXSbwV?=
 =?us-ascii?Q?625LkuYm8/1wG9CCsd9sWU9reGIAn/8o7bgFSj0Vh8RaFfNv7YNlTxXkkpQB?=
 =?us-ascii?Q?pl3l6Kz2aY+pnEaatxt2YxhmJH+gW3nNewhfIFd1hiZze1UnPEYJ7Zzwg/dW?=
 =?us-ascii?Q?OZ3ErkOwnPcBsEwaqq8AKUe/umQ4XUtM/oGHylWQfBWy5UOK/F1VZgZvMigv?=
 =?us-ascii?Q?mqPXHcZrnr7By2pZkhe7GeKN3vY/0a64SC4gnLQ9tv+TD03rwRpDtcO2XL6I?=
 =?us-ascii?Q?gMahVHbu1V+KQIWJ9454NZW3OMHd7Xp6GrElG7q9OcQgXgce3IAB/F+KcvuQ?=
 =?us-ascii?Q?cib30S4UcYCG/Xcr6KCAEniNx0ip9c2yDBOr9ZiOwouohHiCbqinwxNBTSeG?=
 =?us-ascii?Q?mq4YMfef1wlUqmQdi0/jOC3vJ8X670/jzPZYfl5/RzU7bAjPUuI+NW0WaE1H?=
 =?us-ascii?Q?w0CkSouOKSCZsCX7iSi7lrkVpCRNQD8mBvvYxTUlYbTI6tWTCYMB8/K/k//Y?=
 =?us-ascii?Q?3uU3CwK+0+SwB4VwGgw+ycTllIznKmkPvIsGIFSDNbGSURN3AL+AxuT1ZDfo?=
 =?us-ascii?Q?w15Em65psCziw2LxNMXRI0zHG6swuuUS9RwXY23XOVI3Cj2kynmmCTTWiJ86?=
 =?us-ascii?Q?Vct93Hr2in6+CfnKk3QruSuNBHLOFrTknihzeB4lfJxe6LDNXKZ+OTE/DHX+?=
 =?us-ascii?Q?HBpRS21sSov4MDJAgBUSXZgeujjGuOFnZfqiOk5UJOA6+WcgAqvSbyZzaQI5?=
 =?us-ascii?Q?15qoTYbwqE8axay7ujH2a5fty93S5IojGc0j1Yt0Amid+1MY7GGVMZ1PGeSU?=
 =?us-ascii?Q?3Rw3PmNIRhnvH8SR8Bo9Zd9fBlRciO0AtWdqpmg51dALj9NvU3Gv6iiGk039?=
 =?us-ascii?Q?QCkPOJ+hB5xx7bzm7Tab/JSk2dq43dOHblKN/xkt6L/Z2HAPatT/1O0qi7SG?=
 =?us-ascii?Q?JRRZPqWLSFO1GMytLC5YfbkWxtQwx0yXgdk41bHhhyumn4hMvPKx+sPvZypZ?=
 =?us-ascii?Q?VBAl5AED0xNUdgvp0EWoRe0Xab4+F1XpKTHixzQElM0evCF7M8XlLewaRdB/?=
 =?us-ascii?Q?qykwYMY3vPrB6TrlUfK4CK0ZAhwKomXbJcOkl6DmcsH1oO78yJG55EfLlTSr?=
 =?us-ascii?Q?SL3VnRY30A+PSe4g927aAh9JSQDHoE9Y894DkijwgN7o1rom2QWMV3Fb+I2T?=
 =?us-ascii?Q?6VZtb9xK0jKst0LriYd4fhoPGmJgPOc32M+qIZVFzMaoCmtVjbiQ?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e7cb27d-e753-449e-b517-08df0579558f
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2026 02:57:59.5419
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HFcxRVmdihBP8/HiharSnlXpsCnnxwXskys9UfzZBwwAHkbANXp7+OqZ5F625VUxilC/jZFe0a/pcebhaDw/HGNvHQss06MTtbYcuyyCIS+xfBTXanWqfcJNh3UE+JmG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1329

Add pinctrl bindings for StarFive JHB100 SoC Peripheral-3(per3) pinctrl
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
 .../pinctrl/starfive,jhb100-per3-pinctrl.yaml | 166 ++++++++++++++++++
 .../pinctrl/starfive,jhb100-pinctrl.h         |  14 ++
 2 files changed, 180 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per3-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per3-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per3-pinctrl.yaml
new file mode 100644
index 000000000000..9aeece0f53b5
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per3-pinctrl.yaml
@@ -0,0 +1,166 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/starfive,jhb100-per3-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: StarFive JHB100 Peripheral-3 Pin Controller
+
+description: |
+  Pinctrl bindings for JHB100 RISC-V SoC from StarFive Technology Ltd.
+
+  The JHB100 SoC has 13 pinctrl domains - sys0, sys0h, sys1, sys2, per0, per1,
+  per2, per2pok, per3, adc0, adc1, emmc, and vga.
+  This document provides an overview of the "per3" pinctrl domain.
+
+  The "per3" domain has a pin controller which provides
+  - function selection for GPIO pads.
+  - GPIO interrupt handling.
+
+  In the Peripheral-3 Pin Controller, there are 11 multi-function GPIO_PADs.
+  Each of them can be multiplexed to several peripherals through function
+  selection. Each iopad has a maximum of up to 2 functions - 0 and 1.
+  Function 0 is the default function which is generally the GPIO function.
+  Function 1 is the alternate function or peripheral signal that can be
+  routed to an iopad. The function selection can be carried out by writing
+  the function number to the iopad function select register.
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
+      - const: starfive,jhb100-per3-pinctrl
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
+            enum: [ gmac_mdio, gmac_rmii, gpio ]
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
+        pinctrl_per3: pinctrl@11c42000 {
+            compatible = "starfive,jhb100-per3-pinctrl";
+            reg = <0x0 0x11c42000 0x0 0x1000>;
+            resets = <&per3crg 6>;
+            interrupts = <64>;
+            interrupt-controller;
+            #interrupt-cells = <3>;
+            gpio-controller;
+            #gpio-cells = <3>;
+            gpio-ranges = <&pinctrl_per3 0 0 0 11>;
+        };
+    };
diff --git a/include/dt-bindings/pinctrl/starfive,jhb100-pinctrl.h b/include/dt-bindings/pinctrl/starfive,jhb100-pinctrl.h
index 4b7f349cd9d7..a645ddc836ff 100644
--- a/include/dt-bindings/pinctrl/starfive,jhb100-pinctrl.h
+++ b/include/dt-bindings/pinctrl/starfive,jhb100-pinctrl.h
@@ -230,4 +230,18 @@
 #define PADNUM_PER2POK_GPIO_D47				16
 #define PADNUM_PER2POK_GPIO_D48				17
 
+/* per3 pad numbers */
+#define PADNUM_PER3_GPIO_E0				0
+#define PADNUM_PER3_GPIO_E1				1
+#define PADNUM_PER3_GPIO_E2				2
+#define PADNUM_PER3_GPIO_E3				3
+#define PADNUM_PER3_GPIO_E4				4
+#define PADNUM_PER3_GPIO_E5				5
+#define PADNUM_PER3_GPIO_E6				6
+#define PADNUM_PER3_GPIO_E7				7
+#define PADNUM_PER3_GPIO_E8				8
+#define PADNUM_PER3_GPIO_E9				9
+#define PADNUM_PER3_GPIO_E10				10
+#define PADNUM_PER3_GPIO_E11				11
+
 #endif
-- 
2.25.1

