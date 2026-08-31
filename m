Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2119.outbound.protection.partner.outlook.cn [139.219.17.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 940C73EC6B6;
	Mon, 31 Aug 2026 11:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.119
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788176160; cv=fail; b=oK6PwNV7dhjjf2+I+ERjQtTamdEAP/SM1tvmOH7lCpXCG7wuCHPYa6Dp/KVlw7vE6Hlot1SXTwxdp5ByP1ww0hSuEdLv4/tBvtWzXZWMVpYNda7PS1bqzoc/2Y2DdB2l4JjgNh/+y1jmN/GlohcG+qSJW8YqAIi9qfeXCv/mO7M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788176160; c=relaxed/simple;
	bh=adUb7mhZFKoTTRna7P8Se/9I6e57meVyc51mVknxXKA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=VhkQb/xOKYH/IWRUSU18ksOPkEojRDXKzpGVqCi7RwUWlVnDrsKLqqHHN+dOhHuTd1lLgkTyJTJJegQ4+kkDkIiD6LnpfymKGij95Vx1CIOBWkRJ2TY3I8EIE62c7fLpCcyVWnxARDcN0xVWLmZPMovpZzoEJPZsU34oOCDVaZ0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WXZQ9de7ThYZBFFW6hTsglaF9IqrjkfyvT5I9hFCzls9ViJ9XJK3qzkJSKBOqRwyKMVGHvd9DVgBx61BGB2DlpiDIvUCd0ITs17bR7pXEHlYFnRh5dRRJCqeG5oOMG8W7Qvalp6BkjufRVcc8rG8AXEQZ7GUJu7I+XKXu7D5T1qGeT3ziJbsMEh7FWobk5SYfe6Qi/s6Q82dIsCxdDQzo6z/eku1a1LueqdWwlo1fO6XHD/PWVNlK3afjC1K9IXaVbKF5hcIZ1/jWt2AvXKDxj5FHHpzaAcLe9SKwWON3VDo8YXyNE/rnJ/haXFqVfQpnOjtU7I4nrUjbTmp1obh0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gOfi2UMI/9qTb03pjp6ZV/VOf41CV9pEpko/wB+NvHk=;
 b=jskmI1dQwsYrHptY0KqC2jSiWmBdLdC03PdEzkO059J6kacKZvgG9yOGm4W8U5YzIdZTuhFie6/HDjBUiIQuD3ZA0Gn9+1b/jfPQeQzPIo7KP+D8FPXmD0BsPM0jZ5pM0Twngr5fl5LvBWn9tAdVBCK2linduBo0Ex3ogaFbT5xqvJWx5mKfkmrx2PNg4T1sdoDbSq3x+49JmnnJSPaOuZoHcSQmPnEb9vsKhaqoK3O/oV6bZqTDl3IYkDpHIP8ZvYSZgjyFIdzifUPYTMYs/W92RWCsbM/fFIOiRWzIDdlhNIPQ4fc44bJbOnV+cnGsstIiWrEeOpC3+DV4VRV/9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1332.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:16::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Mon, 31 Aug
 2026 11:35:40 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0315.011; Mon, 31 Aug 2026 11:35:40 +0000
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
Subject: [PATCH v7 13/21] dt-bindings: pinctrl: Add starfive,jhb100-per1-pinctrl
Date: Mon, 31 Aug 2026 04:35:06 -0700
Message-Id: <20260831113514.66382-14-changhuang.liang@starfivetech.com>
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
X-MS-Office365-Filtering-Correlation-Id: 43057a19-d8eb-49de-60f4-08df0753fc1e
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|52116014|366016|1800799024|376014|7416014|18002099003|38350700014|22082099003|56012099006|3023799007|921020|10067099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	IPnQyr6nfYMOytfAXanB9VRyUNcKEddyJIODQeqeZCWjjMl3d62md0erDyuw6ei/u2kkPqjqkfSzWsBNkF/cCkLEHO8HAG4ezyRrhv4TzJVJ81FD/nV2SIuPrUNknhkLOECBOF3UcCNsU/kSB+ZhpicfWaxjCZ3a6Sb4OqH1COsULfmHY1LAHqRTAvM/PXOsxJJ0qDjaOkVGjMkyd3uKyf/8j9E2sSvHZgdPr5bzPgn6I4ZXf5BRa3pdm6uFNapiptiYnzOSrriW3Vsk4R+vEaD6NQCvWMR89bjTFRq1ohcQAA7xPDTfzuJV6VghbX1HuzXAfZMDIecV2Q7l9lHtSmPsUqxdqgrVqU18HQaT89LwRRdegX8S67PyQ4y15u3jXNOZH3neq6orFBD9h2r3n2rKRuBoXWzALqaxbwAiBYkNW3heCMp3GhfHgIIn7SoeH6dz7QnrjVy30avo5vHs3m1O9Z2XgZ6mCH7X3E+/bzvBakyes3kPqiQGS+HbYSEmQ9/JCgCt+lCDhdwmpt3CGm2Kxx9auu9y1Hhc9DAlx1qUuDrc2R5R10UMl4NAiWEBYh3tnlYz1srP4PuIQoNB+g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(52116014)(366016)(1800799024)(376014)(7416014)(18002099003)(38350700014)(22082099003)(56012099006)(3023799007)(921020)(10067099003)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1O3q1Suaa+Phuar1DyKEE/axfItbH9LBEQvIUSEFHWcTLkZ2dKFjLaFN7n0d?=
 =?us-ascii?Q?qyjRImVK4Q+n2ngKI+D3kNR4H/nviT0Te+yTSd8I+gDWqH22UZClg1e0gb/r?=
 =?us-ascii?Q?eA7YK5p5nqF9yZmNyPYh7vmjdKui9HAbCuwCsMN88m+DhjUjPYn1G9NPl8Pj?=
 =?us-ascii?Q?YFomrQmumDuIqRz8r65U79JLONhxkF0rqG4tY/6evQnpBKNYlsSM4r91xcb3?=
 =?us-ascii?Q?zepMWhdzuEm2g36uRwCwVnoR1vIr+YB5Qbxd5qe3dsl8C/ILAseqeJqlnj4D?=
 =?us-ascii?Q?ZitRLcoi49d+JFonc4Ax6SwOi9erEn25C67uyBP08a6iFULUCa84HclLjb/A?=
 =?us-ascii?Q?C/jBCwqpGh2bvue3KGtgKz9498RW9htQ2IQmgU1UHmL9rgn5TMW/gBYEEHYK?=
 =?us-ascii?Q?mQG0Zjm8j33lpCEYasNu0TpsxudBiCVP7KcMfPy/ENjwYREiiiRydGO59WU+?=
 =?us-ascii?Q?61ATnx3sE3QfaVPDzraTNQP6DJhYhiUZ7Xrxfpyo5s9m41woYwbdO5tvNIuI?=
 =?us-ascii?Q?V69K2JKULoKzoOrgbM5LJmBZ1HVQ6z2Eq5i+12CHA43+mG6+XWrgGa4vSg8h?=
 =?us-ascii?Q?A7jZMEvujnlnQEa4WS7zeRQDYbw3XMiNXPJBTyrrJSLbE8GesUq3BJgJwUpq?=
 =?us-ascii?Q?NVEz/zOflmAldNHLnwm7htTO3Es9gCOTaJiTvhQVmMRGAM5CTSoWN5H888uH?=
 =?us-ascii?Q?MF7Eq2vZb8vbVvReW/pR2r0RtGeJIJK1SsBTQIyE3I5mrJEzEoXSSWXQeg72?=
 =?us-ascii?Q?UKSL0aJrZ7glPxI55dXuAE8Oj/A/9dT9z3R9Y9ZHeWhlQJMrhb92jaK3BVSx?=
 =?us-ascii?Q?zQtWemOE/jwCt8W0sw+bvRoNY+93NUkcH7v7V1J2gCr0ZMyMrIFgH48zncQl?=
 =?us-ascii?Q?U6kcTL/IOzyN+P0uNMS0gV+qrlcAoeHxh9GDJVgGHYa4p7zb3uAVdvSc3tcw?=
 =?us-ascii?Q?t4eHXxoEhQ0T/ZiPuMU3PHqFQj1YPo9cvvhF0FgwwX3V1WSOS1ucZ4vEp32X?=
 =?us-ascii?Q?pJGHN4Lt6qD/g1NsImCwGf6I4h+x5moqMcHHK9TcsS16+EX33e2F1QlQt3e2?=
 =?us-ascii?Q?cHxUqS8pkcBkD8Nou6jmlKZlgl6y49XbIMIgPzXp+mt5lByfFUYUfc1fT5ez?=
 =?us-ascii?Q?e3QbKtuFu9UaZlGqYep+DUcAWuYCdj6VARzoD2BMtoM/VBW5RfiaClEQKfBf?=
 =?us-ascii?Q?FAI6D7Zzj5V7fFJ2K2e3U4u1pUCyvAFFvc2ruFX+epsUR5vVIOrwsSbIKlfO?=
 =?us-ascii?Q?TB3TE646DIyPwFfewdM/ux20BYmGifH/3O5fkg64LOX6eXUvX3AIiPeftlzf?=
 =?us-ascii?Q?73ec+b9vZ7ozKhgJAbaBCvjwgCBUSqn2+vK6oRYIqnibF6xf8yhoRIXM7Jxa?=
 =?us-ascii?Q?mr79i85F4MgJa08xBj7Hjm/FMbEWU1j0V5iQLJ4Hq98UmWUC0WMm9jnLtGLI?=
 =?us-ascii?Q?K1X1BZlej1PlB5I8u71m75clfL0q7Vjhdd3zY4qf4HyRDDe70tfxjTl6RXfi?=
 =?us-ascii?Q?w2iuKNJur/IaR42cEsAIZYjLZDlFvZhc7C3uaANSUUbPTgp1JUQK1DKLCJ0/?=
 =?us-ascii?Q?zrxkN/NxpA97BRcKUMt/70p+kwlFpn5JXP672kntNBwZdYhWkEmW9wbmrWlv?=
 =?us-ascii?Q?jphPhrzMRIYAhW8K/mNGtIbaP9lWAIS4b34ahBOf7SYZuaISKeL4OjwR1I1d?=
 =?us-ascii?Q?AMx7rZyXRwA8gzqmwlUQgb4l7OOUprAIjD5UFqP89Ot5UA+UQBbPbr4HnOsY?=
 =?us-ascii?Q?jyjsRUtay9ZufblPuVQ24eVIAsJ4p5lmqgXdqkTWcxNYo2ovD9hn?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43057a19-d8eb-49de-60f4-08df0753fc1e
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 11:35:40.4304
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: et/du2H+/uRdz91FqGJhKqDNjH3gJNacGrqRG6XAjRk0FaOGSky90Q3UbcDXEod3vIYjwvRmiBhlAQRLIkWT+nMO4gKkik6sFB8hebK4SgzjsQf23AQiSptsWWzbd1HB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1332

Add pinctrl bindings for StarFive JHB100 SoC Peripheral-1(per1) pinctrl
controller.

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 .../pinctrl/starfive,jhb100-per1-pinctrl.yaml | 178 ++++++++++++++++++
 .../pinctrl/starfive,jhb100-pinctrl.h         |  38 ++++
 2 files changed, 216 insertions(+)
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

