Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2110.outbound.protection.partner.outlook.cn [139.219.146.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 972A33D904C;
	Sat, 17 Oct 2026 05:41:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.110
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792215720; cv=fail; b=PXaO+8FvlyFsLYMffa4vRLt2cNHAUkXY8OyE6gu10q1FjLRKPQtKIYf1azhM9AL720tawSLMkeZ4Koufl8tYe7i6yeM6rHGrwX8FJzLagQbHs0RK6x1zryZ2LnHy5icLOIDeWiCSaH3ztIpNBtprooz6hBTOr8igadCVQXl+l+I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792215720; c=relaxed/simple;
	bh=T9pOgqfSnUy7jGEaeJ1fR+4A9an++jTxVz4UDlLQ30o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=kT5sHUeVWpu5n11uXUsmIpA5G6lHZ7TXnh/WM/sv7iyg0S2HRzYiHCgAxJM6tzil68oYCi0Jf8/R3j08Uq+7ZtXFnbAGe/xCU2LFEg60BYvfQymnnmkYbe3H/WAc0iy4zb+pJDy8TDqU57u0ihzV9uLk99avzXF3NT3ivVlQQ2Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.110
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dH/RrdSYtK3zAvylhTjr5rYIladi1NrjI9xdOjfCbir4g8MWzzvF4pJsVXBZbh/Zw+Xlhd0rUAHvPAM0oCNRDQyotUbu7D04XX2bw8ft5CSKcpt7kLjYP7cXcR9VFcfMBqf5FI/cmAXFUvqOPpIxXBGCK56pqJdg+Byqntq3jxaaOpxfJrONxtfl7n7M/V1HUVhgoAOE8w1zr5B1UHzu4XHa9tq+qV6kTHWGY0YPQXltka+nAQpj7+G7PeiKl+OEaHYOt67hgYeMhuP9eaNu1UiuFUXPZFREmAFGJiUecljhv6DZqyJcS8R9D9xSrbSTHZDpWKKXPAU9lKT2UIPyrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WDK5WKqHuUOw6KkrAtZmxm6UU4i3cp82GvHlFRrYnVw=;
 b=Nk+M/6kjEqwAuaLyq2zeCmq8+OUiYJhL3atHgGVYrqyolMwgCoochtqPoQVDr5rYpyFJxQMk+Nt0ypWc7dnKQBcGEHoSMSdS8TicFoY5JmQaJGuhXuicHp/EHMZmXeVX5d1vPWQ/HDHdmuPOGXe3h8rDZ6XmxYI0sQbmiMxlk69645unCUlwetnWS02Go6yLbRiBEufHhIyD8f3SYNmazSArB5UY88iT5Xla7eR1F+5Qnzn/+wkeW/0MMqlD+4/Q0fFxu3ZXECrinFhbeurVIe73KEBZpj1flERj8nlDOt94Odf6mXjC6dM1J8CFVWgTmiucdL2PgxwJU5H1R+QfKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1220.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:14::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.17; Sat, 17 Oct
 2026 05:25:45 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0522.016; Sat, 17 Oct 2026 05:25:45 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>,
	Changhuang Liang <changhuang.liang@starfivetech.com>
Subject: [PATCH v1 3/8] dt-bindings: pinctrl: Add starfive,jhb100-adc1-pinctrl
Date: Fri, 16 Oct 2026 22:25:29 -0700
Message-Id: <20261017052534.115203-4-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261017052534.115203-1-changhuang.liang@starfivetech.com>
References: <20261017052534.115203-1-changhuang.liang@starfivetech.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: NT0PR01CA0031.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:c::14) To ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1220:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ae2f16e-bf01-4629-e41b-08df2c0f184d
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|366016|52116014|376014|38350700014|56012099006|261009223027099003|10067099003|18002099003|22082099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	authXhX/oBUbqRCo3y3npjux/DsNBmjzd1MPnz9zB7Br7ys1M0khYuorE8/pQdjvtfT1CbVkBWGoJa+A1/CHWYq4lihuiLN73Z/F63AQBR+/JwPRT+/DA/BjkW5+GgpdlNCjOGE4JmlrO/OctlfwTGV/jMAPwrb0byP7w0UBa+rWsU3iSSnKig2fhsEEiY0/L6wfOJ9SMGlhWvUapDtNXYLYLXprG/g0xIedBOXGFBNaZx3xWQBEwuSpX9JrhbBm0yxF6zxCgyt+IllSN7l5xlEU8dBYH8uVqa1/98L/ytXBvMRRXcDf+7TzupcVl5a6C4u/Dv+VyAKZW0bNBAFTSSiRi/XE9+dQ6r7OF1ZC7Z9gc+Z+zftEurDxyFv5RJ32nwCUN+3LrxTcnnlB3qEMVc96XITkoxwfI+G22MG5Wu6AvE5UKb1pWHnJ/yssjaHZUpD/u0WkoXgCKyDz9ZqfY+HqRpCmuJ5Mvu00SAXHvroXEIGlLk/9Y0iz+UfgWXpbZVIQurRxJm4u/qwfuVw2pSKryq1sfA+oRXDNcvTEU/9Wqh5cUC6PQlrP5lyM/AoK
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(52116014)(376014)(38350700014)(56012099006)(261009223027099003)(10067099003)(18002099003)(22082099003)(6133799003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?RsP3qVOW6kS6AesMBy+Mk9Mu24++ipriyT5/gtQfh315r9UmEKbyQlM3rcKr?=
 =?us-ascii?Q?LAmT3XqF5KPZi+tk7VDOjN+vFse7hhZchp8BtYwZGLztgXvheiNDjyg4AB7P?=
 =?us-ascii?Q?/Mbt2WbypNGIkrYjfzGXtSTrtsWbsXbnzbRKDVyQJY7SgR40pChM7WHMOXwH?=
 =?us-ascii?Q?nFtjuSrqKnTSFPmkeLbR8XBc9BkihCOhEtBkwlSiHCMS9ckPBNT1z9H56jFO?=
 =?us-ascii?Q?dIuEoimpmtslBOreGbDXeo38OARlDwZR9OKSNfK9UWvJdcNyexCTavUIiU3/?=
 =?us-ascii?Q?AMZt4jFxZ82f9+NoxJS2yd5dR9h8opsqGwl3KA2AR2/YABqvoxm30ZCDCtO7?=
 =?us-ascii?Q?A6be9+nu0tVKR66wfixagooIHiL4ndUoJ0xO+lC6ce6j2DRz0GVF8xx3nJsk?=
 =?us-ascii?Q?PhccenGvQ/hlMSLLtHAmJkXFCZN34F5+LpGRsN0ZMXSsTcDm2kIKFGU4l+JA?=
 =?us-ascii?Q?JJ5Tk8cggG5mSnjVounbbUh6VR4dU9LUhA8OcJ7om7nYjzYGICs0e3symngd?=
 =?us-ascii?Q?JKWKfEm97wswkNpzLt06Cv1wdWiV4KAdcYlVhYS9Y3usm0Npr/fKkyeu2DAp?=
 =?us-ascii?Q?9w8VZO7ka8aW9M6ZdGlFis8NKxdpTW1tBb34/+TJV6gu4ZoelHyOy2CYr1gb?=
 =?us-ascii?Q?nEE2eHHY4xskL5nE/hQZR+4nFpoKX00+CLqeekfSoPa50v6IypV3U2zcLQJz?=
 =?us-ascii?Q?LWCaa56XZ2D0MXsgIiyBqLee6b3E2NZhT1o46f9FPk9yoJo2mL8QhfI4LTI8?=
 =?us-ascii?Q?c+OxZXbimv2YjNMGZduIKiF8CU6J75duKdHbif1lUXLcLfPQXIDnPJnrCbN0?=
 =?us-ascii?Q?eJPKsGKSJbb5LQ1bO35Nn8Ig+vDDo/yQ1rIwrMmCTa6O7tMlMgqhWC4yqDm5?=
 =?us-ascii?Q?EkaU+J7boe5EzdeqoyYuMSNKnd1EPRXR6Ysj/IqixYRtgmJkwEN60/cbDnzi?=
 =?us-ascii?Q?1l0W57/NTIFlBIycj9oRRVbMZye3JsfCuGW03T/ro5zQnc456r+XX3NdgpbQ?=
 =?us-ascii?Q?ZtmecETtQFkOpbpycbNnYEIi8fA68bIuuiu7ZVLXryEYY8x0CbQVgoiEuZEr?=
 =?us-ascii?Q?jwDKSolmrgDr9dZcaspu2Ei6rJGt3rF6hxY7rx+HnspTiPwFeBzoyDsQb5fK?=
 =?us-ascii?Q?6zE0uJ7DhLkS/yG3WpekaebC9quBOJarResttwX93MhrF/ws1YDbVelERxaw?=
 =?us-ascii?Q?kQHk1eIjcvfaUETQB+WwPd6QN3PCw2bqymTHQ8pNPNqzJ3+s8XvR3F1+lWLS?=
 =?us-ascii?Q?JUqLYW+sR9BS7N+76RxvP2Xkr9lLF1ZYQxmXgtjfuZGFlqA0eakHy6fvD3dX?=
 =?us-ascii?Q?5oNzJsBOn1diXn1R4/42wrJ+yJ6EdV0wq3JdxNmKcH8EpLS1ajKoJkUqXDCb?=
 =?us-ascii?Q?PA+vmqDkBTUs0NvpooPgATHFCN1rojB08KNsDP4wqdCaZ+/Aaf/Q/hryHBq9?=
 =?us-ascii?Q?yi+5pVD0Uq2XgJuMmlBhVMjbMoOr+DAZfJKGBAXKA+OC7P/hnc4UyJL3OCc0?=
 =?us-ascii?Q?+X/aRxx1ff8rj9bj4Sa/DQ2x5c+IWv0NoDKw1g1rCU3cqyo6T2eJPrMrcM3O?=
 =?us-ascii?Q?yXHx2yNIJlUGNAvboT39eVODWPkZYwYHrT6PvjHja09xmaitIMeZ26sfHIig?=
 =?us-ascii?Q?foyTLkTI1P+xb5ET5KG/ezBtOF1E/IznSgz3YNUoTJe4MujNO09vJ7n+XAZQ?=
 =?us-ascii?Q?EwUrS8gRiU408j/1pVnFLGjTKXNunXb07CRIL6XrWfqOqfJPJJR4NbdYTP3g?=
 =?us-ascii?Q?zj1gxOLfU6Q+yTdxUYg6rHlp+VpMZVQPizpbOiUXiUwwhSIh5j9+?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ae2f16e-bf01-4629-e41b-08df2c0f184d
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2026 05:25:45.4746
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hQN8WekKW2Dj+gaOG5j1vprSJ70GoSiXvLe7ugdhbpZlRLUkw4xqs2qCrvPX/F4WWSAmlopl4qavo0mgJaPddW1acBTG8RpicE+fCRuFEwwE48O7H2IPRJUDRYluywwr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1220

Add pinctrl bindings for StarFive JHB100 SoC ADC-1(adc1) pinctrl
controller.

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 .../pinctrl/starfive,jhb100-adc1-pinctrl.yaml | 168 ++++++++++++++++++
 1 file changed, 168 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/starfive,jhb100-adc1-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-adc1-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-adc1-pinctrl.yaml
new file mode 100644
index 000000000000..6f1486b4a8bd
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-adc1-pinctrl.yaml
@@ -0,0 +1,168 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/starfive,jhb100-adc1-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: StarFive JHB100 ADC-1 Pin Controller
+
+description: |
+  Pinctrl bindings for JHB100 RISC-V SoC from StarFive Technology Ltd.
+
+  The JHB100 SoC has 13 pinctrl domains - sys0, sys0h, sys1, sys2, per0, per1,
+  per2, per2pok, per3, adc0, adc1, emmc, and vga.
+  This document provides an overview of the "adc1" pinctrl domain.
+
+  The "adc1" domain has a pin controller which provides
+  - function selection for GPIO pads.
+  - GPIO pad configuration.
+  - GPIO interrupt handling.
+
+  In the ADC-1 Pin Controller, there are 8 multi-function GPIO_PADs. Each of
+  them can be multiplexed to several peripherals through function selection.
+  Each iopad has a maximum of up to 4 functions - 0, 1, 2, and 3. Function 0
+  is the default function which is generally the GPIO function. Function 1,
+  2, and 3 are the alternate functions or peripheral signals that can be
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
+      - const: starfive,jhb100-adc1-pinctrl
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  resets:
+    items:
+      - description: ADC1 IOMUX
+      - description: ADC1 core
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
+            enum: [ adc, gpio, host1_port80, scap_trigger ]
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
+            enum: [ 2, 5, 8, 10, 14, 16, 18, 20 ]
+
+          drive-strength-microamp:
+            enum: [ 2000, 5000, 8000, 10000, 14000, 16000, 18000, 20000 ]
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
+  - clocks
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
+        pinctrl_adc1: pinctrl@11bc2c00 {
+            compatible = "starfive,jhb100-adc1-pinctrl";
+            reg = <0x0 0x11bc2c00 0x0 0x400>;
+            clocks = <&per2crg 68>;
+            resets = <&per2crg 12>,
+                     <&per2crg 13>;
+            interrupts = <148>;
+            interrupt-controller;
+            #interrupt-cells = <2>;
+            gpio-controller;
+            #gpio-cells = <2>;
+            gpio-ranges = <&pinctrl_adc1 0 0 8>;
+        };
+    };
-- 
2.25.1

