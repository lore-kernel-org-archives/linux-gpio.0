Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2106.outbound.protection.partner.outlook.cn [139.219.146.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C53C45563F;
	Thu, 10 Sep 2026 10:38:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.106
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789036726; cv=fail; b=i/iKYCIr+rZY7c2/52t6KbKpgFwmm4ywXaPgwQDXyl4FVJ/m98Jt6QHAoUhxVp96WBr+PVTQr0LGEyWRnh3+8xIuTHrCHh0MQJIERgPpspAsCmnuk79b/UXws8+UF/pNpjBy/NR28L9TGDbxnMDQV7CDYWb1oH0I+6jrjQqS75s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789036726; c=relaxed/simple;
	bh=rfFlXtyN/nqSpIymbQlG4jrSDB0+wW+HyPrqNnYSfS8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=VPVk6X7YICJ+oYnQ/+fPEwikKhAZBiiiHL7cEaXoDThr/jdFxR4iohMqrJsuW/kwtfstyiQatt8HObniG3m4egpNZpMFjXGOEKK4tmJXkh4qTcmfv+Wm7uyG5lU60JHFomNu2nIkRgCb7zWRmAzNhWFgU9hVIky/9Dy4ibLSF/w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VmhRssj65AXyO2LzrFpNhNW63BJJa3boyO93nmSQFRDWNybJlGbI1yUhrR8P2f4U9+K9gh9fmDpkUfhd4kuoRwlOYAGBmEMJ5qN7eKvA6W2iHsQLfGODXjr34PQ1xPKTOsgUvYzpX1AcuL8L7lhrOGM8LK4ILv/5VsNcdUiPWV/GE8/MjtaA7aJQWXoeSC06Gf1yPlFcH+yO2l4xARu6ydqdujshRq4kyHZo1nnm9Ppusp6DJI+sVB841Bo4Ve9bNGSE/IRaYeNFW0+6Sb1AWDz8UVh4EcUSAkx0mB2Vl4/qPXMLb5BYSu946ox1kk7f+cjIIB5vj/GUjKA4/7j+Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DrZ71xWltjKDDUpPmo0hfNI3YhejW4iSmty0oVA0ufY=;
 b=Y17RpteRK4PH4UeB1gQwb5SVB60PfKpy01N21adHJu0nPTFJXAo0gJDAxA4zZ1BBZz8369o/FChWxWg9XwCR5usz0Iz8UrtouEjqrVDjh28+3Goh1LyshpZg8Fbmb0cJC6wgS0D5RDvQgb/xnmdqZ2JA+oPMb3WhVYBvRrcIL4tNALegATEg7eVNVapDCGZ/A2j07vAKVHK+5asFwYMa4tNKB75Hz4Shm4MGsFYWxItlvRc8dBRYcrpeqGcD6VhDHHB6jCNABOEnl4LAvUFpLgHRiJK6WpwfrMTG+Ev+eYhgGK27Pi6svgdJmwvhd8r+9lEGV1kK1IFNxn/FztD30w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1170.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.18; Thu, 10 Sep
 2026 10:04:29 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0339.017; Thu, 10 Sep 2026 10:04:29 +0000
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
Subject: [PATCH v8 19/22] dt-bindings: pinctrl: Add starfive,jhb100-per3-pinctrl
Date: Thu, 10 Sep 2026 03:03:54 -0700
Message-Id: <20260910100357.130134-20-changhuang.liang@starfivetech.com>
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
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1170:EE_
X-MS-Office365-Filtering-Correlation-Id: 7761236a-6fc5-4d15-b888-08df0f22e769
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|7416014|1800799024|376014|52116014|6133799003|3023799007|10067099003|18002099003|22082099003|56012099006|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	nDFaOH+hjuCRROUVM1UM9VlV5Ifb5i6yxhGI12kvfjrcSQj2ucg3+GgqM9rCcys+rF92gSvtovS6BC9ctmF+Ggf5vJZPOsBU/EDiyRrOOH2ixNdUqzCady5+kUb2jSr5rQRBlTeG1yKb1pkrxhyuyFqacMMNRIZYKu/hzEaVsqZEa0IYggYFs1uIy1KB9r9E+b9iOdJUgj7adzOFxDbWtfllSVL09VzL3be7zD0a8WQxPdSsymp4VdxKwYntjLrMbGf5YsYHykqS/iMWumbcUazMZgtwnszSdSRWDsX5iPwQLDsuiJOmZXwKBvnAX9UHC3wR127UoZKlMOv1wKCqNWb74fCSgAbaTw1zYJy0dNIabQHX7PvnH5qzWTTLdqffDzUM8YXewUl9rKQ52neFP7mC9N6OyqQnesI8LcxFtuKgJzU6ecsl+D+/wjQjzpaWD9jOhRQHs5eGtQxSWXN8kOoGYpei7JZYflPJHI9YtkO7ayIzuCTeVj5B4FC+xJpKvc57BmMx/I4Fvaos8nvPKPwROfhaaJYta72etkrJi6nCmOd/i0RBUSXgnBbtaEYf8BuG8a4ScoLogAUx5cOJ9Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(7416014)(1800799024)(376014)(52116014)(6133799003)(3023799007)(10067099003)(18002099003)(22082099003)(56012099006)(38350700014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?XCXxtBy8hBvlEqER3MrVkFfQGJhpAq6HVRsd2178tg23ygsJ+4TGSS3aByFH?=
 =?us-ascii?Q?e0NwSCtUt5luhYOto42oaZldj8nEC3YB5HCPPaGBDR6KVzHznhrkWHGKc+Yd?=
 =?us-ascii?Q?Q4jvuVPNYW3K/J+DvlsEtCtv8hDUwcyOjNTlHE0IYn5LPaDLmunzjR1/nCvJ?=
 =?us-ascii?Q?7HtneC7foe0KQw9Y8XyDZ/MriN5pLIl07cIfNvUgT7Z1jevt1sWFKXrnJZ/l?=
 =?us-ascii?Q?SyjRU33yoGU9v8Yzr1rIJZkIXZcKlORLTY8JL2XDE2ttOHPZ3RZbPmZkLQ85?=
 =?us-ascii?Q?QFsaV05BwddC3PlE9LlgwyoOA9m5B0j8Yb4i5TM2wxaRaXdwEOqMxugfx1rp?=
 =?us-ascii?Q?ij1gDZP1QzshzekfLHlKVHSSRJmNVgCSyEZQYevTet84TCE+ntkEwG3h+CHU?=
 =?us-ascii?Q?v5FQuEk4qWEZ+q/pcqVAE+BUv6nQimA/kwLVXje7JRE4OmsPiOVsBh4/bDqX?=
 =?us-ascii?Q?H5Z7S6FhpVDQL2ZC+d4GSitFj3gf4Eo0ZSqLwOO1i4VosvVpNAPcBPdN1eW0?=
 =?us-ascii?Q?lml8+ckYFz5NTp7w4YgjeSLta03rW0A+NRwmf7+rPHn0DgsWTL9Y9Wq3vFMI?=
 =?us-ascii?Q?RZ4c+0WacsU9pp5OxEipLWSchH5Eh3XZeyE3f7fSXMrLbAXa9TonM8pdkJqZ?=
 =?us-ascii?Q?Geh4GfjWUkULiztPIQYM44rhZgzBHfoQfYVKEzLZ7TdzH+J58KSJbny7f1fA?=
 =?us-ascii?Q?vbfgNn14kb84RlFDcfKvA/Gw8peKMezq4uawc6b0vHbSP0XU32DnTEsAjCFj?=
 =?us-ascii?Q?1q2/CN5M70f5xGx/wS+XOevfIEZKcDH2A0xYi2u20hKDPXnKx5pOkn0rAE7z?=
 =?us-ascii?Q?Mh4Gbsx4VBR6gK+ibfzXvgi3YxPbMkEoVuz73yt7G6e62zuIDtZ+KtIlw83u?=
 =?us-ascii?Q?ah6xtnSFErVFFoNWSf/leJ+mn9V+bFSRqHAmc7SIHnKPHHQABU904SB5ahID?=
 =?us-ascii?Q?YQuZZl3JSBXxzowgbGOb2q4jUOtfgmjxQLrhQwIRyNf5hWkdIRfoZt43S6Hq?=
 =?us-ascii?Q?5pyYkK2BYSXLagKdjypMwB35GqY9iLTqXOWlGLBAqUoe2gwzZ16Jgk+FP6DA?=
 =?us-ascii?Q?JWbflZffpn6YRr2YNP4FMRHg0p1V5AHzyw5K5dvlhR+Uc4TILIV49Xu5YhW1?=
 =?us-ascii?Q?ZJKQ6Z7S3nHtVOJqD4xje3775Vb1I74pj/2qRrTvTDga72b/EkTLAzlleWze?=
 =?us-ascii?Q?LKaow6tWpKlsSrlGPWg9Li+GuL+JJprfCqVdRjfdDaAsawN2ad22IqE/6WcT?=
 =?us-ascii?Q?iDuEWQDjlhb4AKf9IEfolICznV2Etq5mBMAAEaGsxmdeaq16kJqXnlzN+ufC?=
 =?us-ascii?Q?es+GqCQX6n0323ejDY2uKiXM253IHGYVT9uCdo5sBrigp0/nPZbkJYeRdWPH?=
 =?us-ascii?Q?ChN9AhJlBukZ6IvoiDjaUcFLAUWSmxWhAgAD7Sie7zNhzVT46Mnfk1EYb+wB?=
 =?us-ascii?Q?tPowc0rgGUv2cZkJTDZOdwRe2SA4P5Df/cHAnsmxzJGZG2cMchSGtEWUx54C?=
 =?us-ascii?Q?vAG7Fm3AhQ6T6FCRqBgTC+uDN/So1cVgVqBBSlqdccSe4Hk07Rwp1IQi7Rid?=
 =?us-ascii?Q?HfDOGEcuS46eumeCOjlq+DxEHX4ICaKhyCzBeg7tpILIjwXCJoSOy1Jh+Af0?=
 =?us-ascii?Q?dHDbZXb5/6XcrjB4cbEyOC9/dz0sCHwk44BNk0yY7fM9OWO79qHfRn4nELcm?=
 =?us-ascii?Q?4M0zxIUhW6j3z0jdIp8K9K5P7YyqombP1UaXwqaLxSD051o5d9CNX88XVEtX?=
 =?us-ascii?Q?T3nSZAnDVBlgOYqpdcmxaI2p837r7hmnJOFHrlgk5o7jq9K1gKj0?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7761236a-6fc5-4d15-b888-08df0f22e769
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 10:04:29.6549
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /yw3bEKQhVRnBoRKxFJzvBLaqZo1o29abEFmozmOF8CW/lH12J9K1RuBWb5KL53grgK9tU1x9iRZZUAyTvj+CIuYvHW45dt5KNKZ0qpjLp33gBJg8qcXZ381/CTGewWG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1170

Add pinctrl bindings for StarFive JHB100 SoC Peripheral-3(per3) pinctrl
controller.

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 .../pinctrl/starfive,jhb100-per3-pinctrl.yaml | 166 ++++++++++++++++++
 1 file changed, 166 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per3-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per3-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per3-pinctrl.yaml
new file mode 100644
index 000000000000..92093315ef15
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
+            #interrupt-cells = <2>;
+            gpio-controller;
+            #gpio-cells = <2>;
+            gpio-ranges = <&pinctrl_per3 0 0 11>;
+        };
+    };
-- 
2.25.1

