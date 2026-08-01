Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2114.outbound.protection.partner.outlook.cn [139.219.146.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58FFD380FFE;
	Sat,  1 Aug 2026 07:28:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.114
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785569284; cv=fail; b=MUGBsjeF+rpghV51s5Wx1Mau8F6rH84YU/0PNulH9aaEjReuAMB2SGtJ1rg+/MLWdP3ilaFVBGQIWXhztNRdABIYx5vTZYkhZHGeWme9FU/KqmLclQIWdbt9dLYCkd7rrRaYNxjKuOZ/cl+a3FE9We8l7w2Nai2rUw1R/NnT8Io=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785569284; c=relaxed/simple;
	bh=vusmntnunQGyPPG1gIJ2krM2yhrJddG+/ojnsfDhK2I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=iWVYZBycqrtGkU5hysmbhwabS9ymVJUGg2BQD3bKfHGQPB8Wg+ORbSjqJCdM7HglrEqCFmjNEq/vY+8Ae+2b8abs6avkod6QYqQJDEhOqpOPRrV/rrVbXU2bnzaVph17zhOjx4EvsX6L3F/lJwIQY6Rx/pyKSH/UJSQ5AmJpNrA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YofAw7KSwBxnDv9DjPxYYseyjQuzDZ/SjEpz8UuSmQQ+D4p7B2LgOpUGaZaFAB5NJddOU8QmrZPPEnoHZ7UV7C6MJbBdLD0rwyOPIpD/OZ7bCkyTTwGyofZWNK5uKyDmbXP42CtGfcL5vSrs6odRk0x4VbrTBBU9ujlHg/R2zL5VcA8+vI6GtW0kBr9LJi4lP4VSieM4ZD2QX7s0lwDOum60UfZhQXBACG2mb0+prz18CBdkQ2fqTYo/ddkPoWdkogLv5aJDVaXrXDbqMt55mraWxUV1JEyhb/OOLL7uThpgKR0gqMKZt9LLrbE8IP9f81wRsKxdR0Z5Qj3B0ItdkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XQR5JNX1WrbWDfcbB+OFBzTQuhg7AEzntFyWp2aW+HA=;
 b=dVbQYTIEANTxT00QqFchLMMR6rWV1N0hdbt96Kf4WwrEvgSEynUjAyqe5BWUgtP50fEpjALSGTMATQ43dViZg0zjtj1ucl/5+oSm4Sa5fBXeaQm8cqtoWduQ587jiYBOJ7WBagW8cWdgt+ZSNsjxT4aSFyVX6id10kMthX/80bGMnTzy471qRU+TgBxNu31efrUPDqISonY/RnuwkRiBF8zZaUswLvEimKq9Xx6629HfZhEu7ZlC5RlB8mTXA7p4yyoUCL9DIvIsLy9VnbaNR0WYvzwcdWhiKEDAWaKOK6ANDTpE1Dn2oyyCARx2jR83baqzDO0UH+F3CUQ82D/i2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1138.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.16; Sat, 1 Aug
 2026 07:27:45 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0270.015; Sat, 1 Aug 2026 07:27:45 +0000
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
Subject: [PATCH v4 19/21] dt-bindings: pinctrl: Add starfive,jhb100-per3-pinctrl
Date: Sat,  1 Aug 2026 00:27:09 -0700
Message-Id: <20260801072711.153217-20-changhuang.liang@starfivetech.com>
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
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1138:EE_
X-MS-Office365-Filtering-Correlation-Id: bc5182fe-ba17-47ef-b540-08deef9e61bb
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|376014|366016|23010399003|1800799024|6133799003|56012099006|3023799007|18002099003|22082099003|10067099003|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	8s0n/G7YR3lDubibmNGUc6Zfpp5Mu/5a2FJSNgVlfC2Dr7DEtdWoXvOCj1tfUCHTiqPYrd3TW4DX5Xj5qYdux99b23NOskwXd1TWYAouDnE1DHU1bgAJ45ZNRPMey/hKsWMmyrlQABBA8jXJeYVICdeWDjdTGWNJmLfaxkVjXbzfHMgxhgoUCjSDOHTGiDsvEGnAnoRDw3nK7ZvwOx2+cTB+BjdCZlTv91mNPnt86yYvPd4+4CX/DPfm+doG4nwFFGMgVnq3LVtAwZl86NZiRsAN4QNG7BR8Cc+itOoHkYAblK3adgt/XQiDtvrls80XZSMxeaMWrwKXoXkKIStvI6VNTNrlbjwpBB6ehqlDDWayWoYBh1WVcG0u+faF6RSyirwWZmJS/66zPv6VJ0nQ7WsOQ6inFNhmRLx5XPsJ5dbPUnvgiFPl+N946Fdd7olembbYMEfj38QRym0pfLu+uk3lE3EwkVg2tKTbckX8PxtT2P4flAVIzGCNIXej5csUCtWoiR+iBRdhyThlA6u0iNnR4MWQ5nXVusa3/kRuqrjyOTHV0OaYeo3W4dWBlI/8QDvQpqpVLy8duT6Ii9xINg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(366016)(23010399003)(1800799024)(6133799003)(56012099006)(3023799007)(18002099003)(22082099003)(10067099003)(921020)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ccX/9xKGLyyRQ1v8i22h+5OBJTRxILtNSD+zuCuS6GdqAdpU1U9EIfdrHcGO?=
 =?us-ascii?Q?KFaFYvuu41eNsjXN9az58kLs+Hn68i0tHvZ2Otj546kFYRvkNB3Bf0+ImErA?=
 =?us-ascii?Q?qT53zqBwBU5AjBVAHdUz1goiknfzZW4+LTPi60oMKY877gCzkpCnSgirUzzo?=
 =?us-ascii?Q?R4DnRlUZcz6KR9smrcGmEy+MmNq2UP+roH4FeGfvIOl4mxiYoz2zamdD337K?=
 =?us-ascii?Q?qs8EnQSuWOxXcZzAKA05Cf0IpuH+U8nBiQzBcPY37u1Rat91198ZvBf2rvuG?=
 =?us-ascii?Q?w9rEg4y8dh3R8N05KIGayKHOqy7x3mL6dGQP9JVB4BEQ8IsgdlzCuyQ58/i3?=
 =?us-ascii?Q?PcFNwFUMQi0TCeaQlWvln156TpC/tml+kRlL8PTVLhfGuXHyRA+NIUxKafz/?=
 =?us-ascii?Q?DRG/biRlNNdX0h4l4Auv5CuOmrre/47/ixpvIvvf7WKlXM/ul05nJxK0Yb1/?=
 =?us-ascii?Q?NPzpNPq7yAVn+hLBWdfiuvH6+78r1bojrzkKSH+bni5UnsSArFIBkTjPlEwk?=
 =?us-ascii?Q?hpVTr7uGmPGe2QnfNjUDjbwRU+V+Ee+74rSiM8KlD4gvjo+7DB9H6w8GTmgO?=
 =?us-ascii?Q?gvA+P+E0soPBydBQ8/eIWvI2DNPi5eVc8Y0XoeR6i8VGMT6LZBC87di535yM?=
 =?us-ascii?Q?5XkelAwxJcfP/8B5xV92CXZqmE4Q+kGFzl7kLgXMJi6WCJ/xk5uA7LuntwSe?=
 =?us-ascii?Q?VxSsrSMBRe+CsFFSYuaFNEIrHLUu5mxZ9HkQdEueqBLiNxcURL7zLos2QJ4j?=
 =?us-ascii?Q?pIMtIlq6FK3uoWkCc3SnbHJTeHd9CJ8dLtSc0KyUyzYp87AemmMu0Kj+I8MD?=
 =?us-ascii?Q?mDxbAsD2U53VtAyOR6ImaXRrYHL/35yQEU7oPWFLt7XERVqq6F/pvy8XRQ3R?=
 =?us-ascii?Q?0ec63w0lL8uNkypWOKRsOQDX6r9XH+d2XI03eb2CoCEZ/gtC1VI9vjmWI44R?=
 =?us-ascii?Q?9T9lJu0wCTFV4s4th2AiMXBqd3Meget5ixVJfvz/hBIpQqRn4lAwpR1s2TOa?=
 =?us-ascii?Q?AevbsGlX1Qp9w4JYOlAFwXgGJYEKyKGRzn3lVeFLcM+6lj0eYMHECnlNmFPM?=
 =?us-ascii?Q?t63GWgEbh/MpHtkG7MdbDffrAS3q0bwa+XHuRMJaPpEV5l0oxTgmXq5fH6x+?=
 =?us-ascii?Q?Jr73N8TAzcFfvFq0VfEXzY/buI9XmXxj96emsFinfgVrG8s4feV2zVWiCz3l?=
 =?us-ascii?Q?/OC444y+yXsrAMPRHZ8MJB57mcTBYw8pNeNwbE2Bwu7wN9q50m6OtGxrwIht?=
 =?us-ascii?Q?PcgiXjMiXnZrCvDwAOHS5aowGRRQBcJGm1e4KQNoQfjpH3FHoy1tWBCbvoZ7?=
 =?us-ascii?Q?EuwOpceWnE3uy2C5Ug/FVUEi9yCBJmVD5/p+m8Oj6vSJlib9VTlTVSEKX7dB?=
 =?us-ascii?Q?hQgsVhDUISrpOKCCMdsVnsx3eOnfhQiiwGk3UbYdyig9SYBJWMdXeD6t+0Fq?=
 =?us-ascii?Q?uRWUqg6A3FXSkYDmEuO9SM3rb1kGharjMdyAdkTXJXUkLEHllpHIHsemmFIb?=
 =?us-ascii?Q?afsMpRUj64hJBP7czjNJUr61zE9WnNydPqb2RU1kjLp3AXzgdTp7L2is4Opi?=
 =?us-ascii?Q?HNv3dyf0uJ+iPRTVFTAKQVhZODNI2JURId0pO9Kb232qEmyvFCmR0BOTTnQA?=
 =?us-ascii?Q?GY6QL0tqRAE8yrWVjo5Kuv6W5m1Js7gzu9IFSNGXYLuJQ/1HmnDw7YBstPch?=
 =?us-ascii?Q?t5vWcv17D1jTEIHvi2WDQ856IEQIveusumhyfxAHho3dcYWk0rTTpn20qXwc?=
 =?us-ascii?Q?1mJrIKrA6pGZ8IzpJKhhJBr7WIQ1xisc9iBqEEPBv09CMMtaH6Gr?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc5182fe-ba17-47ef-b540-08deef9e61bb
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2026 07:27:45.7605
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UC5lZO6x4Vj1Rvt+S+Tv2/PKo5AxuCOdlongMuyKdDEd1HcsS88qo26l+RFWNNjT/fhMTdjrv379ss73RLlSLwkcQLMjrHXN9R4kEF9qvd6hFyq6nyhGMXfljuVPh7gx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1138

Add pinctrl bindings for StarFive JHB100 SoC Peripheral-3(per3) pinctrl
controller.

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 .../pinctrl/starfive,jhb100-per3-pinctrl.yaml | 166 ++++++++++++++++++
 .../pinctrl/starfive,jhb100-pinctrl.h         |  14 ++
 2 files changed, 180 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per3-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per3-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per3-pinctrl.yaml
new file mode 100644
index 000000000000..bad9fa4b6149
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

