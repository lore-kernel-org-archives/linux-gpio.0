Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2094.outbound.protection.partner.outlook.cn [139.219.146.94])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6159C394792;
	Mon, 10 Aug 2026 06:37:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.94
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786343867; cv=fail; b=rHsHfxxnW1YW3+wZ9bNsTUDREajgWW0nQVrsd8UEOzPIBoijaMKQlySQYTQUtpOose27x4npSzfKiKb+GjFjsBVzNvM1PQCr2/+CwXG2LWBicGDu2Uc9O4DxBaA6tCvEnTVV/m5+Xnv75np6ANzTXhexAdWJSrjjNjmqVhiOn/c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786343867; c=relaxed/simple;
	bh=0cbc64c5OVa/mqPs2Nc09J/0/oh8yFFp4ZPgQw6cwSU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=MTct6jTzPkq7gNE0PastyglN+FkashWsDWVXmUOskL8bwJRLpG5nX84jep8mflGGMdpekWLEQTcTlNYRIp7obfIYihsl1UtjbDhGVBrcjzOdPnSvCb9qKh7RPoYHzweuK1qo8BiDJkKZ4SJzhH61c+figg1kri7xhSOPiHbRDH0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.94
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i6APA5uiU20hkJiftlW7nJidtfPzMetWmXWPtjPkExYO+iAJOmNYlEuZXoxgY6ahQLeXlwJOLaLHopJf4adOQpotAuLXimNMvpC1cwrl+fsrTsP/1EriZK1u0YowqcZwEfkuIcja9ds1sxIoMzkfc/Qvsl2s1DYAWROKv8k8qtFkG5yPLqGRMHKfwHMNBOt/sTChPqgDVmft5kUFKet6oNo/66MAV6AuTTK07yXVvWnry0jI4qlI4ww52FJWqRwl6M9Wm5KO9E4xgX5dgu/jd1qVOXVOxEOuZowjRMjcpP03W8693+qn4VsEenQf0mjZYTmCeaKxffb3MIjirypwIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=piBVlKM1i4I3OuBytL51Sbb2I1dGWHHGI/I8sqTIUMo=;
 b=fjC90SByiGTdHYmFnVtoTIN5qVOX52HBT2cKi6LCek9db7cHZyCLqXxbrhLDXcmJWSrbua7VUe4qig9OI2B4C0Tlu8SjmM47F/eezP7TMUxSocyEkGr+mMGpd3O7SR5MyMvlggNZKMluNXsUeZcmyzA21kBmTqXUEFKtGXotpP1JrskBtvrAl6njcMp3joB9QU19pTKKFjgLLV5Q3IldVPDYaQP9+ZphOBPSc+9u+Gr0JkknscN/GxQktndgFDGGeE1+1E/zYlwSNF+toa1tdGkf11ea+gvlnXw3/b7yMj95eeLK5gCVvFWBnxbPvzJzVZqPplR+wDlqTxT0bcAmZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1315.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:15::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Mon, 10 Aug
 2026 06:37:15 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0292.024; Mon, 10 Aug 2026 06:37:15 +0000
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
Subject: [PATCH v5 13/21] dt-bindings: pinctrl: Add starfive,jhb100-per1-pinctrl
Date: Sun,  9 Aug 2026 23:36:42 -0700
Message-Id: <20260810063650.239303-14-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260810063650.239303-1-changhuang.liang@starfivetech.com>
References: <20260810063650.239303-1-changhuang.liang@starfivetech.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BJSPR01CA0019.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:c::31) To ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1315:EE_
X-MS-Office365-Filtering-Correlation-Id: 161fe5c1-d192-45af-9967-08def6a9d171
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|52116014|366016|7416014|56012099006|10067099003|6133799003|3023799007|18002099003|22082099003|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	xoNdkg2VWzO9J16Kdcmur3vXEjQ8OlHg9osNU+MS7voNIOrcXzbzSoM+oLPCQPbQ924WTUl++ZyRLtKo5OeP42tv5/kS8tfp6J8LcZ7fGaj6/f4CWekeQXELQPkg+QD4XUHPm25Y7qQquvLimYbyvFvK38j/+Whd3PMmS5dEUZhj/W7UDKL6OQbIbE7lhgamGDmgZQt/YUa09OEp8a96ibCY8eM311pdh04pnggWRspTfWYeKQvbczxZUr0x5/Ca7ksE+OMSjpmPhy1Gi4vJqM7s0kyV5vB9nY9hTqy2Wdel3b7cjzLWkRucZDBpKXFI2opnhpEp59+cOG9veQjRDjNENdPFT8oI1VgU30hb6EHbi/fOWkuZM8tZNBswuQhgBCB56oQHNKdb2yfp+SPOqdsAB6sTOrlhTShx/LnMkk8j/C6uvHWtnjjg1DdElG+d/6i/5uFALa5OjRselBfUUGpxz+8C14UsA6mTTRBujk7TVb3otEOOMOTjv7oLHnKCNrlI530tt4Id/tjKhYmaOexxhUw4/x0lDEeM46C+ybRRbvVOax5qAIrWbOm6LPc0XfD3TPjoDRfP2O0o553HWg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(52116014)(366016)(7416014)(56012099006)(10067099003)(6133799003)(3023799007)(18002099003)(22082099003)(38350700014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?CjeBNxYHOsu/ruMClspNeSsh9I+DzN7788BgrnaLjgn6WHyH74MI74q0onx5?=
 =?us-ascii?Q?JkuS5mCBAupHWq70nOFJY5RYL11UuUED0n+CgXTuhhNGtX/q5zMoxrKjo9u9?=
 =?us-ascii?Q?l4CZPxViexpqPrZQOFrpeuLASC/sbhZuz7c7xwLqwfR0vm0VcLnnDTjAMR4/?=
 =?us-ascii?Q?2zD7+znzxLF0eoaw7vsCfZmHhTO6zTaJoWOH4RJWLGdWpXCwykKTn2Va9LH3?=
 =?us-ascii?Q?fiH1c0XHKTkWesp7/QP5q1/7+8zAPK651MEtRTgksCILbjYmMhauEv2/IJBs?=
 =?us-ascii?Q?opnWc8fOZ3AG5neMxU+XifurTqf3SWWa274/TJCDp5W3lzHjT1lN3rPBErvU?=
 =?us-ascii?Q?MtdCXql8bTY6uTVfvgv8Xpw7PXqyOP1peuLscH6SbddOIlKZNn8yjhVPVsSy?=
 =?us-ascii?Q?DnY/2NCFdvhXM2HsJaN+UeRKa33EMY6q76BqVyX+cmh1/C8fiink0dcxoCn5?=
 =?us-ascii?Q?H0eI9QhO7D6kUU9uWOCt1Cg9dg4jxKnF3MJzXCctBf3LN2clo7FZS4LEM6tG?=
 =?us-ascii?Q?nUgsOEVniLWYZ4hO91pk0rUD2m/BmGYEB3dcFMs4Se1LMjFcsoEFPzKwtRLp?=
 =?us-ascii?Q?G00O+Sk2UR1ebZPEX4MkVOyqwAvAQMsIcYir81bwNoYO8SrpQ4U/X49dYHdu?=
 =?us-ascii?Q?Fmo9hOMGy9GgIJ1GGIgix6TI5K7ShCnS5Gih6ifM9nImuJRYItTqx+l0Li0J?=
 =?us-ascii?Q?OzBAf7h0tGxTPoZiWW27DdWxNtAFlATYrEuJip1XoROQAQhx+/XSb/veVpY1?=
 =?us-ascii?Q?NlKkTnoMstK5xq4W1JlVQe1wipJ3Wj5R0g/yPbOtqaw+O8k4UMwUZwYXpl70?=
 =?us-ascii?Q?vVwFe1TLgJgZJksgnqQyPRAQl3GQDF7cZozF0hwfY4w05Zhq2lxSk8/VBxQR?=
 =?us-ascii?Q?WwNqhhpPVsf1cpgYeqrPQPpDXyFZzkFq3t4igUYoaFHGh1R0BAG1liAKnFVb?=
 =?us-ascii?Q?Y/GFgmV1L/C7eXH3wq28savoq0dF7EnsdQUDAAz9xCWOHyMJytjjGU7pWB8b?=
 =?us-ascii?Q?8NoHxzJqXwBd1MkXmRk0hCNCXBj3aF+vnMxOQphPW29/O5xMdThImviV65LR?=
 =?us-ascii?Q?pSVaL1Jn1bXU97qAY8psAToXtUZGpFzFrUNBwiUEpOPoVmrcnERpTLoGeSb+?=
 =?us-ascii?Q?ZkudNDYarBukJMe7qNsxc5drL88VqDXGSOk2lbXAK74g+UoN12mXfEZBvfG7?=
 =?us-ascii?Q?6AAxkeo+Yp/HrCoL9A5D9QaGA3sPX+AAg0HoIwKMhLoawh71Fn6GKP2mpEZP?=
 =?us-ascii?Q?Yg7YoiIE+oU3LAqbDi3yetFC1KRHOewVBoOUBOB/vduzL04m5j+zYVPSg7rK?=
 =?us-ascii?Q?y+tstv+U22D95J/yAUHr8gfRUKeu9ntydgwb63mI+e/UQhzoFah4iyCZaArr?=
 =?us-ascii?Q?0ziDX+baUVp+jJ9yPapBWaPtjbT+pxFJpOW0Zk2e2lU9MCfrUeoEe1a8hpwV?=
 =?us-ascii?Q?7TSdmVmr2pj0k4LRfySV47ZwmXrKMVyo1nHqjUzgMu0T/fsdPEml/WMK7iDj?=
 =?us-ascii?Q?1BC49l8lfNRFalnHCD5wLuM0n5RR2cmUOIb1t3oTROOcyPYwEBEgiiNwN0gB?=
 =?us-ascii?Q?iTlS/7BdM2iMdZCifL8CS9VF8ZJ0dYhBz5H601FMZzUc02/ZNXw185bbtHcj?=
 =?us-ascii?Q?XgmG2cUnDjdFaXLsklwm7qyNNTHOLXM9J5HFYBK6t9rc0lH6vW3QnYi9dc8y?=
 =?us-ascii?Q?6Xh4Mpp746Iv35saoJLVXfCAATIxfE/U8PDQ2zUGnH5tm2B+ufyROADPAQNH?=
 =?us-ascii?Q?JIK7TJ3goVYbWN4LwWU+q7NRAqGB2iIWKlpmgfOOjlyBuUBPbWr+?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 161fe5c1-d192-45af-9967-08def6a9d171
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2026 06:37:15.8132
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qPfAQXMThRXe14mbRH0mxyotH2yOv+ie/0wrouWvbXNjDAahKzlZWXUoq7aKUmuJ5qzxuSWDKcqaS9KasUnxqnmMNWl0WvpeWXeRe2pvSRY9Ffzxd7L/L/48lWM92YCu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1315

Add pinctrl bindings for StarFive JHB100 SoC Peripheral-1(per1) pinctrl
controller.

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 .../pinctrl/starfive,jhb100-per1-pinctrl.yaml | 179 ++++++++++++++++++
 .../pinctrl/starfive,jhb100-pinctrl.h         |  38 ++++
 2 files changed, 217 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per1-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per1-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per1-pinctrl.yaml
new file mode 100644
index 000000000000..85b64e2bbd53
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per1-pinctrl.yaml
@@ -0,0 +1,179 @@
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
+            #interrupt-cells = <3>;
+            gpio-controller;
+            #gpio-cells = <3>;
+            gpio-ranges = <&pinctrl_per1 0 0 0 32>,
+                          <&pinctrl_per1 1 0 32 4>;
+        };
+    };
diff --git a/include/dt-bindings/pinctrl/starfive,jhb100-pinctrl.h b/include/dt-bindings/pinctrl/starfive,jhb100-pinctrl.h
index e0ad453d6884..9f622468c294 100644
--- a/include/dt-bindings/pinctrl/starfive,jhb100-pinctrl.h
+++ b/include/dt-bindings/pinctrl/starfive,jhb100-pinctrl.h
@@ -139,4 +139,42 @@
 #define PADNUM_PER0_GPIO_B58				58
 #define PADNUM_PER0_GPIO_B59				59
 
+/* per1 pad numbers */
+#define PADNUM_PER1_GPIO_C0				0
+#define PADNUM_PER1_GPIO_C1				1
+#define PADNUM_PER1_GPIO_C2				2
+#define PADNUM_PER1_GPIO_C3				3
+#define PADNUM_PER1_GPIO_C4				4
+#define PADNUM_PER1_GPIO_C5				5
+#define PADNUM_PER1_GPIO_C6				6
+#define PADNUM_PER1_GPIO_C7				7
+#define PADNUM_PER1_GPIO_C8				8
+#define PADNUM_PER1_GPIO_C9				9
+#define PADNUM_PER1_GPIO_C10				10
+#define PADNUM_PER1_GPIO_C11				11
+#define PADNUM_PER1_GPIO_C12				12
+#define PADNUM_PER1_GPIO_C13				13
+#define PADNUM_PER1_GPIO_C14				14
+#define PADNUM_PER1_GPIO_C15				15
+#define PADNUM_PER1_GPIO_C16				16
+#define PADNUM_PER1_GPIO_C17				17
+#define PADNUM_PER1_GPIO_C18				18
+#define PADNUM_PER1_GPIO_C19				19
+#define PADNUM_PER1_GPIO_C20				20
+#define PADNUM_PER1_GPIO_C21				21
+#define PADNUM_PER1_GPIO_C22				22
+#define PADNUM_PER1_GPIO_C23				23
+#define PADNUM_PER1_GPIO_C24				24
+#define PADNUM_PER1_GPIO_C25				25
+#define PADNUM_PER1_GPIO_C26				26
+#define PADNUM_PER1_GPIO_C27				27
+#define PADNUM_PER1_GPIO_C28				28
+#define PADNUM_PER1_GPIO_C29				29
+#define PADNUM_PER1_GPIO_C30				30
+#define PADNUM_PER1_GPIO_C31				31
+#define PADNUM_PER1_GPIO_C32				32
+#define PADNUM_PER1_GPIO_C33				33
+#define PADNUM_PER1_GPIO_C34				34
+#define PADNUM_PER1_GPIO_C35				35
+
 #endif
-- 
2.25.1

