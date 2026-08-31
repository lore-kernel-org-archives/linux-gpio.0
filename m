Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2104.outbound.protection.partner.outlook.cn [139.219.17.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3FFE3AFCE9;
	Mon, 31 Aug 2026 11:35:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.104
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788176144; cv=fail; b=Pw8F2z7yKyglQT2GeHattnyOuccLKDLPWYS+sQmCAgM66r7+uaW5u2YxF5e6bbBU9ppxQBzyYhLH2KwDzW9af+ds4uGFbDg+/Yb+r+rmyz5z1S2zpncq1lN243pcSCULKXEt37l1qXmAtZsiIQlbHu5L7j2ZLBwPaIP54BzSJVk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788176144; c=relaxed/simple;
	bh=xUJCUMV4esjeyZ20HPvVQfC+ac5Az8r9sExmmOmLsUU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=qvZYpWg/ak62HoR/xikPQVnM3kVagOJC7wdwwBQcWsLnZp+TLPooREmTRh9MTtLiG6gG8Gq0C5z78vXtqouqOdNNL9YR4SWQdueFd4QciC5J2k4HoroB2vX8Jqp7LBXcrDEEQKn2/MxmUzltV+m17FOS+v+t0Du8rcmBpPH1e14=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pm6HhJiu4cQEnE04geLLd0rz7Uw3evs18EEVllqnLwoNeRuOctxT8GGvLD4nwa8DBQOd5aPIXL2e6xqhnGsqLJVow0dHL9i/VfN+TLFpxmjni+IDG2AjxSeqdu3+S7JX2n4YAc2hKXpzOKzlVqPC4aNqsgAiPS9FyMSJefSoSbsxiUibQ1iP3dh5Ag3KQe61wV8obSnOJVduTYoet+ooqepwYYspvTAGO286/0rFSTRcqjghVP4iU+DOdebt6wlhcxWcJy4ffPwYgzvHcE6bqHNOP7ATxNHJ/vYA8WWEYIEntL8y2F9FEFKqqmz2XJMFcPqW9QhQp1KDxVUkaztE3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uZ3ZZgoTKV1TAwep35I+RdEHybp6JmLoM7rM8yi5P6o=;
 b=jTo2Dk1EBrKPgOzZO8eQR71M0vyEKhLtM74Hgh8MJOXDSiB9l6lEU5wIZ2iNuGkl/4FHvy1qd/eXDiITHEmmRvfESLDcindVgXsYD/EIkshUqCQAFj5tmE7FWb3FLpOVCGS8z2AJmQeCRrT/hoE1DkigJTohHQqsaeSjMv1zymMYn5NF2uXYQ+HIRF93L9hrG1bgDLZ9BR6ydHWe1UqgB06cN5nLBe9Gjv1EPR8HtF4xteF/+hjvzIrXcIctLexWG43HQIwadxlggthTojkTfvX/7e0FbrtVYpTdZR+MZVO7vBrozEsMkmM4PuBGjE8jqIpctjGVD2eLW+olUCVw2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1332.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:16::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Mon, 31 Aug
 2026 11:35:30 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0315.011; Mon, 31 Aug 2026 11:35:30 +0000
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
Subject: [PATCH v7 05/21] dt-bindings: pinctrl: Add starfive,jhb100-sys0h-pinctrl
Date: Mon, 31 Aug 2026 04:34:58 -0700
Message-Id: <20260831113514.66382-6-changhuang.liang@starfivetech.com>
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
X-MS-Office365-Filtering-Correlation-Id: aec289a6-3ef2-4ef8-bf97-08df0753f649
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|52116014|366016|1800799024|376014|7416014|18002099003|38350700014|22082099003|56012099006|3023799007|921020|10067099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	ILBUaUPKi3fbkSJFP6U4AVrkuTgGv1nri+jbe9hKoGQ9SWARs8j7iZYarKiBezKhplFtsJJdRtQLyZ/qtI4XT1yLaPSWy2XhkENe4yaB6o7BAz5HF8JxIufshrMUviLZIOFaKMKw2jUOd8vqy7PuOe8I/TDENwd8uBQVfOq5sFOGWOB7w6qhx9Z9s8mc7mYdmhBQd9tVVWpnpaQFy/Dv6ScVZkA04QiE20BFCwbKtxumN4LT46eWXVPRkJ9POqWPOxy0D7YL4nznhXB5iBlARP/86qJNrEkP0WmqmLiGzrpssX4HTWMOxZbBY1jBKfWllo4GDvl0wVMtkwLCkZTZZc3sFeIT1275+NQUrSzlGXiW8oqrd0P7jI7M9lham0ZmWRYy/bxM8lkr0cp2/6aLxxXt/AQEmF/iQ4zUfjRKtAeinWwkw0vfwgbaaNhQe+Q7+vHhxfpi+nkN3NHmO2ZYcRRm/9142J1uJtUoiBqGA4ZqZSWU6qdn1giFwzzse9ISvTcEI3XLJvqaagy5US/eaVVvFxb4Iy9DW+avDiQ0c7P1kGobctzvaSJLyGM3ZX208BJ5sMxhpTad81Pwdr9SuQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(52116014)(366016)(1800799024)(376014)(7416014)(18002099003)(38350700014)(22082099003)(56012099006)(3023799007)(921020)(10067099003)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?fL7HS121ek7MARkZRLQU1aUArF+6hkUoVr3kd07RDNDhbFWBYshda3pMRF8S?=
 =?us-ascii?Q?7l89/qyylNr2y3gJd4Eg1zfc5CLZXtSNPXGptLuxh0yRZPqlAxoGrHD2e+GQ?=
 =?us-ascii?Q?xTqRCog71qK0OdEjt7C8dBX+bBwfgLO3XD+W1y+m2uKlc0aoi8tB1+5HIWKn?=
 =?us-ascii?Q?POmRgIBOwID+QBfO35fvRvpiFPh0IoesQmLyUWp0KG4NfSGjSZajS9Lhi9nx?=
 =?us-ascii?Q?oxy539F7KZOsDEc+Jjs6QVCukH4Hjpg2bpcxjVfzLJt0AOrOXMpZCJ1idRoY?=
 =?us-ascii?Q?homCEkk5H8Q2hzGivisHFqPEaf/ab5rfZlM1AQjMQ7ptwoo2eTwLDzoQJpi0?=
 =?us-ascii?Q?UAuCp5R1BOapH45OVFJug9rTYZmImC9e68KkcRc3GRgzcTjJzqfKdA/6wp1M?=
 =?us-ascii?Q?gPwbTTdRJK6hciWyGTnMS7CeYHH4tNHlSlbkOvLZNjWjFb0dI/rG5eUCyOaF?=
 =?us-ascii?Q?AY3LduSrbrcsMnIoroNhQySfcywvDdCKdK6ffQoWfxzrYfBUOIm5ZU97SGeL?=
 =?us-ascii?Q?g45xULgdwCn9o5fqBodIYP90PPjsH9c3/lYFWsyqJCftabsIXw8iaKbWZIaw?=
 =?us-ascii?Q?erc/pQdUoyBNeLWrHHWdRO9XxqCdYwNzWZe0lsTPNheXrPKZRB57soOZQE5K?=
 =?us-ascii?Q?XXr268AXoaYF82xQtQWRU5u8LTpBkbYhez5XdQ7yE3J+hMvsz9nrKLPTK7UB?=
 =?us-ascii?Q?+Gc+0DN69PYSKlmXVer0Usj/sICbrkcEzbiB+2eR5ONIE7hYRLHuR83xx9nf?=
 =?us-ascii?Q?2f8nraT78GGoXf9gkRHWpmclFWh/iIGKDCwcimezaHIjCggDem8YVr/9owAI?=
 =?us-ascii?Q?ECMd4musp4qLSD2neeT2o10zLzSM96WmAk08dWQ8rVUGR/tObKWj4mqXYSvC?=
 =?us-ascii?Q?CoG2WZ7oCLrx2qorU8U3y+JvK8a3biq0dQa7QDSAHiq4opdSWGQxIyt8XfWw?=
 =?us-ascii?Q?n8D4HXiMShFygwDtWpfSsCtDw4lDw8uNNv8fT3LXPVPKYoMQY7NiGhJLusX/?=
 =?us-ascii?Q?thkN4h51bzf3cksJbUZzvyMcaSNKxEj1zizHlBltvxt657aqFYK2vyLJhfpz?=
 =?us-ascii?Q?hnbdAH8J9xV6iXK6RbLGPcJGkvcq4HCE/vDwxVTKcC6cz56mjycRnxG27r7O?=
 =?us-ascii?Q?LlqILuzL+0XlfhQbwyoO5VsI4yGQapBwMPICheabKZvBB0wCJDdVRpEweL01?=
 =?us-ascii?Q?jOkwKkXjWxrVFpTnt6sRzzRMFKqWKsFg+JqE8wOgfEtOZIl1Fins8Tii0Ier?=
 =?us-ascii?Q?JaM6XKILHyaWgdbBvHNiKgXVzAknc3yFeMiPEhUmmfVVfYQ9oSg+y8de6PYk?=
 =?us-ascii?Q?4VpXvn8/yKmIDtNNwdibSk3kjgsynG48nSQK58klVCvyKh8f1XvNrOpNxILL?=
 =?us-ascii?Q?FSNxjp7KAwkpMYmxOyzhNo/+rv8mDLVGVfk0HClPIOrhqn0WU0uGXYbrfZG6?=
 =?us-ascii?Q?3sHOUrdM325cYEVVqS28T17lIEXmxYaWC0QeP/Ojqf1iy+uAbh5rQab2oPQe?=
 =?us-ascii?Q?ytD8pXhITYyW6XvEk+kjYOzLPwAmLTATFwPDgRc+yw57rXy5pHtXaDwXvw2Y?=
 =?us-ascii?Q?EuWQihV3wb9gRzRsOKEJxrDZyiY1SwLmR8UqHyK+w0iBwvyZROhdb/ngjXNo?=
 =?us-ascii?Q?cqHyVb9X/4zKNOnt9Muru//xtXACp1jLvQrhYX1EQq2S3X4PoYBtOa/YZVEt?=
 =?us-ascii?Q?n3kr2Zsa6Yibfql7aAWjeogDRWIa5BlLpCQIIY9dkcBgDpBAfElzQwH/XesI?=
 =?us-ascii?Q?xjJ69J9v9Qgcb4fNSldrlgrDOUh5YEer3MabT1yCQ1Xj3rBMAvtN?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aec289a6-3ef2-4ef8-bf97-08df0753f649
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 11:35:30.6619
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xVmyolH6lgJyD3WT/WPclEVHyGJfccKOR4zpGh3IpE3yDfu8Py7qCwjitAmo7b6ypyptFhvWf9kpDARDYw/Vj85DuoZ2x9hvXVlWQMYC5SBKFHXMO+0XDzrEkjPyR4p9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1332

Add pinctrl bindings for StarFive JHB100 SoC System-0 host(sys0h) pinctrl
controller.

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 .../starfive,jhb100-sys0h-pinctrl.yaml        | 162 ++++++++++++++++++
 .../pinctrl/starfive,jhb100-pinctrl.h         |  14 ++
 2 files changed, 176 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys0h-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys0h-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys0h-pinctrl.yaml
new file mode 100644
index 000000000000..c988d724e708
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys0h-pinctrl.yaml
@@ -0,0 +1,162 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/starfive,jhb100-sys0h-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: StarFive JHB100 System-0 Host Pin Controller
+
+description: |
+  Pinctrl bindings for JHB100 RISC-V SoC from StarFive Technology Ltd.
+
+  The JHB100 SoC has 13 pinctrl domains - sys0, sys0h, sys1, sys2, per0, per1,
+  per2, per2pok, per3, adc0, adc1, emmc, and vga.
+  This document provides an overview of the "sys0h" pinctrl domain.
+
+  The "sys0h" domain has a pin controller which provides
+  - function selection for GPIO pads.
+  - GPIO pad configuration.
+  - GPIO interrupt handling.
+
+  In the SYS0H Pin Controller, there are 12 multi-function GPIO_PADs. Each of
+  them can be multiplexed to different hardware blocks through function
+  selection. Each iopad has a maximum of up to 3 functions - 0, 1, 2, and 3.
+  Function 0 is the default function which is generally the GPIO function
+  (or occasionally, it can be a peripheral signal).
+  Functions 1, 2, and 3 are the alternate functions or peripheral signals that
+  can be routed to the iopad. The function selection can be carried out by
+  writing the function number to the iopad function select register.
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
+      - const: starfive,jhb100-sys0h-pinctrl
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
+          trigger enable/disable, slew-rate, input debounce nanoseconds and
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
+            enum: [ espi, espi_reset, espi0_vw, espi1_vw, gpio, scap_trigger ]
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
+        pinctrl_sys0h: pinctrl@13080800 {
+            compatible = "starfive,jhb100-sys0h-pinctrl";
+            reg = <0x0 0x13080800 0x0 0x800>;
+            resets = <&sys0crg 3>;
+            interrupts = <57>;
+            interrupt-controller;
+            #interrupt-cells = <2>;
+            gpio-controller;
+            #gpio-cells = <2>;
+            gpio-ranges = <&pinctrl_sys0h 0 0 12>;
+        };
+    };
diff --git a/include/dt-bindings/pinctrl/starfive,jhb100-pinctrl.h b/include/dt-bindings/pinctrl/starfive,jhb100-pinctrl.h
index 6d8f5516a178..38d5a94e92e3 100644
--- a/include/dt-bindings/pinctrl/starfive,jhb100-pinctrl.h
+++ b/include/dt-bindings/pinctrl/starfive,jhb100-pinctrl.h
@@ -14,4 +14,18 @@
 #define PADNUM_SYS0_GPIO_A2				2
 #define PADNUM_SYS0_GPIO_A3				3
 
+/* sys0h pad numbers */
+#define PADNUM_SYS0H_GPIO_A4				0
+#define PADNUM_SYS0H_GPIO_A5				1
+#define PADNUM_SYS0H_GPIO_A6				2
+#define PADNUM_SYS0H_GPIO_A7				3
+#define PADNUM_SYS0H_GPIO_A8				4
+#define PADNUM_SYS0H_GPIO_A9				5
+#define PADNUM_SYS0H_GPIO_A10				6
+#define PADNUM_SYS0H_GPIO_A11				7
+#define PADNUM_SYS0H_GPIO_A12				8
+#define PADNUM_SYS0H_GPIO_A13				9
+#define PADNUM_SYS0H_GPIO_A14				10
+#define PADNUM_SYS0H_GPIO_A15				11
+
 #endif
-- 
2.25.1

