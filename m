Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2094.outbound.protection.partner.outlook.cn [139.219.146.94])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CC15395AE9;
	Mon, 10 Aug 2026 06:37:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.94
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786343869; cv=fail; b=jjpGvW0cUtGbI/pj6ghqyWX9itCVntBUwGnesr1mKbkYddlk397CaZT8Y92OBDNOEKfu8q/wG6zkq5Q/ISvFrXuMTLsk5dDj1bIqiQ3bJ+0cI183bnIowfgFvldg+DjWdEMk7FS9i5Lmq0P4LXnPhIShN63DUCi7vDlz0aoBeus=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786343869; c=relaxed/simple;
	bh=4tTvxik2erP8bPpguMe5gLrJVdAZxNzYZn3iA24oF/k=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Vl1dvGLdRfxYH+3DLSrXJONdrtRryEVHpYg8Q8SRS6hJ+R8YZ75PbCYARnSmu+wr3nA43oECku9oJ9q48dF/Jv1k1hNeLl/0ROAXYf9oZPDjPwbYxSBwflhl59B08bgXF3k7b/qU9owteUXOzwXbC8pxWRoC8AyFij1VJp/eKPI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.94
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dcv00bib+6QxDThJtmn3JXuJd/FovPUmHvMX+pB7GPhM4YSL/ZoUe2GFiyxmb8CNpy/oKhj24XFmg+82hv/W+do+ndOpUNHJ6E4eOva3kGPF7+VNuZW68OYVuU7ZwYf5kcaKwB6gCt8Ko8Rl3IoMK+m7X0hYoe9z3My0vsoXnJQcmB/eRopfpVN3hFx4X8EOPnAQoo9D3VfLpIY5UipVMKj1akrJGxZOxYyv6ffyrlPF2oxPx9Z7kIVURaG6iC/XloQXsahCNRsq3dKh1hgM90oGS6BFEvPVrLSwZY5IgFvinm2FDD/SBhpxLLGh68h6vqKWE/5uFLZDoNyhs2tTxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dnaS+VhP6Hw86yA04hesw0WFGmMEc1/XYtDXc7pLB0s=;
 b=ZBkXwlLVoFHvd3R0dvSASdZi2ieLJwl7Y6I2sGPijwd8nPOaUahIhxl1rpEONNbY0Q2y7gWrD2AuOIDm+xqYGSA5VtcKOAGHtSW7dVYYj1fULjczLpEa144+oprAp36FTfq0q7dWzPkHc09YsJUhdS3VVDcywyPG4Vic87L+AuV7VOPl/6u88cx/3cIM3TlGkxEVy+7/7wQIaTRWgrFapB8/2c6+LEUiH2k+dB9agGPE5MyG+CriFTtBwc9RpHsLq7cGCDBPGvsig4gbz3MFdMWOistiQc832443e8o72Ptu/Kx4evMlfwHNO6byDmh9AxSgU7MH2WaoVkpBPpJuqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1315.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:15::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Mon, 10 Aug
 2026 06:37:18 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0292.024; Mon, 10 Aug 2026 06:37:18 +0000
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
Subject: [PATCH v5 15/21] dt-bindings: pinctrl: Add starfive,jhb100-per2-pinctrl
Date: Sun,  9 Aug 2026 23:36:44 -0700
Message-Id: <20260810063650.239303-16-changhuang.liang@starfivetech.com>
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
X-MS-Office365-Filtering-Correlation-Id: 5e4ee906-82ae-4da7-e9c4-08def6a9d2f1
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|52116014|366016|7416014|56012099006|10067099003|6133799003|3023799007|18002099003|22082099003|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	DUPJUT01yxD1Mlh7QdLMeLO5fExUhJR37+/ZDiKyFHUcaA6diFuw4593G3JaTbeJYZ0QqKUt7tkemUZ3Lk3ZeQ56wg9RwQ9bxgvI954Ad3tl1c773G294DdUz0UwpBRf94aOvCNaFb46mfOMCHb8V0PaRrKoYmZN6l8Bw2yeeB3ufXq4QgjaquE9mbFKv0SBCsSUXkAsUr51rgECYcnjeSME0o2Zxg/myVN+2jZiAojWC9j18Mj3HFgxF9KDQE6qX6FJy2KoSxbLp/QdI6ro0y1otW850eZEAv2hmmiuaLis20XA/BW5LDvXS8mwuJxDT6D+6jRKM5SJAQ14synnqDNysGfcTuv3rlcdA4Jm9ljchSnggHxQb9GIfY8XYVz/YN/7kUExbrQa+DDmZV79Qi6uuAbxvUPWscvyFf/0pZJKZI79hiVtFNvAiDXqVWBPAz4nRr6UoVylqGaVO5Mkg+v0XY8dHFseV3Chs2MBwLuTArpxDe0J7WvgV5RvaFApE5/SumHE8oDlcZ7dn2cpURGSes6DoGkiJ7o3dbVjfcRUxEBCeuxh7W8K5+n30kYHmGeY8bY8rRO53EomvZirtw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(52116014)(366016)(7416014)(56012099006)(10067099003)(6133799003)(3023799007)(18002099003)(22082099003)(38350700014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3imjSn39ltdUVpvdzf0igLg7PbFcA9xhe2Pyp3Da7XQeeqenDZoXjcqL8V5z?=
 =?us-ascii?Q?WOlVpXt4ElvF3oaxaz3ZOJveFth2oGkIqgS/onIQqu7/z9xp8lSw6w78br9d?=
 =?us-ascii?Q?q55QvfFL/LNNbZ3J+n0BhkuqjgRpjL5Z3iog15bN8cfs1MsD0cjlGiYzUgPD?=
 =?us-ascii?Q?UU79C7rybU3rMIcA/Ns8v/wkt5paXhq9cQvr62q2H+wzOK/f+J0qsK2rRnWm?=
 =?us-ascii?Q?7OwOhBhfs8QneEZbwhkPwXgT2Ot1CWuEqdm8akGxojJxwzrTj6psXEUaBsn4?=
 =?us-ascii?Q?eWmFI5ajhtN0WpKYKSLlfUZoGDg963KUTB2Qa3EsTyhicAWopVuMrwJM+Y7l?=
 =?us-ascii?Q?QwxL5hlhkEJM0ObwP+gi+EDmh3UkX5y0FhVIB+h2uYu96R+LSO863qDEoFAb?=
 =?us-ascii?Q?utFnkB2qQwkfnlGjmkj4NG+q4GeB5A1rczbCgFz8k5JAGIQ1Vsa36IxKA6hf?=
 =?us-ascii?Q?jE7gn2RqJfdLcSHtW2dchIDVudipct0IXDMzAmwbndSQRsD6xtg8DgFhdGkA?=
 =?us-ascii?Q?wIn6G92nm3lXxv8g9l6lx0iylPNI8MWU0wyPdtykVXupIWk/CoKK7ZU5sCmk?=
 =?us-ascii?Q?NVAWCj+Z6dlkd6Cske0rYw5WRxyob+ZhC5gmOKdbEn8kZA8zyuzn9WKlOPJC?=
 =?us-ascii?Q?IOYmxw480Y6UPYc/Lyxrwn89kwi/OeOJnoysCeNboA55LbcApaMsOUa7UyFa?=
 =?us-ascii?Q?qRs/h2nAfMWAnFz679hK4kig6ujOwZp8/QzP0bKm/ieVh3BeEHVUg7FozPzE?=
 =?us-ascii?Q?xdSnD8pUw+gyun6el83/QVczgZOAXUDBaieQ3gsWTTDghXnXbZin+m2Mb5H9?=
 =?us-ascii?Q?UuTNt1t9h6UJfwM3f4PD71Ex8THghmXwp5QvNnuvEYvIgLEKoO0R9U4qBNzq?=
 =?us-ascii?Q?+viuJujv5h55JLgyuRiBwtxrOGouB7zZNC7E5EX7FaLgi6+Pq4yJRRamVbDe?=
 =?us-ascii?Q?7/QptZY3alnM0n2soUdH524NAisRsdDTOneFb/oVZbmBPTNs5ocpSJl9UERK?=
 =?us-ascii?Q?h4yRdnelqF2IhwqK+VTDLhKTTSzH7sUXPr8ASFP7ZeWGxjmnnzkIbpCmo9nO?=
 =?us-ascii?Q?a0dXnSRxClbe0P+M/NE8rIRg1/xj7ONyki45n664hKHbRLS9IDZ5dsdnVE8D?=
 =?us-ascii?Q?Uu7uaYeuereZHbcUOIduOuf0KwwHMI9kDnT2ZNN1KEE7wU6XPtIXXXbMX1Lh?=
 =?us-ascii?Q?DSFSBpX0UWIa8ClXskLVPwczS1e5qAM53jYXKGRoqxYyftHXVkkNb2zVwdQo?=
 =?us-ascii?Q?BsJ0TTE6oHtGG/AHKEC8QQfamMdhc2U2Kfe7d3S8KWVG7z4O89IALm3166IC?=
 =?us-ascii?Q?IiJZ9rt2l9jN4SawJyhL+D1QAm0FvRJkmXvfFcQvdlwd1BfbA7O0C+zegkOP?=
 =?us-ascii?Q?dB7p/RhuHOzEjqHU16chPjHq9OX979r5peL845k1MpVfqF/WzA8h6xiLf5Uo?=
 =?us-ascii?Q?PwrldMjRsNd+g+nG4TrtCkItHsqb9plfcsVKS0DrCCRoLHNdYch1+07DNkKH?=
 =?us-ascii?Q?xAhkcSLWSUZhcQ9Wn7zMQ/hGo0V0dxbKMj6ASPqKwbEY09i+rQmFVGR8Yu4I?=
 =?us-ascii?Q?fxvVnfC8noNR8rmqK06Qd76Couxe68/ghmDW1iLt7xbgv8pykbJ9wzcrdgqu?=
 =?us-ascii?Q?9UDx3p9EZXcHwj08MqHkUuCW6vGyBWzbTe3VLYyfoq3wepE6xC9HFcRr1G+d?=
 =?us-ascii?Q?WBGXgHrByW5W98Ck+xmw79Ohcrcs0vYb/PCSXntTPwM/nhfxvFPI4yVjDG97?=
 =?us-ascii?Q?PUGxgB6ZVFf+4DZf8atqWYu67m9gsXsvOZnI75IFMWDLxNXKMmx8?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e4ee906-82ae-4da7-e9c4-08def6a9d2f1
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2026 06:37:18.3290
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9wHrHkJG4feSM73SMl6jThP5oB/beZzs8fYM6YYx/e0pgJEmr2wawDf4miZGYOPDsG1vWtxX5BHEx7Pk9rn86SkyX4TbTQnd+RtrG6168Eqyd/13WDcr2TZMdee11k8Z
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1315

Add pinctrl bindings for StarFive JHB100 SoC Peripheral-2(per2) pinctrl
controller.

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 .../pinctrl/starfive,jhb100-per2-pinctrl.yaml | 168 ++++++++++++++++++
 .../pinctrl/starfive,jhb100-pinctrl.h         |  33 ++++
 2 files changed, 201 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per2-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per2-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per2-pinctrl.yaml
new file mode 100644
index 000000000000..2df36903be2d
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per2-pinctrl.yaml
@@ -0,0 +1,168 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/starfive,jhb100-per2-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: StarFive JHB100 Peripheral-2 Pin Controller
+
+description: |
+  Pinctrl bindings for JHB100 RISC-V SoC from StarFive Technology Ltd.
+
+  The JHB100 SoC has 13 pinctrl domains - sys0, sys0h, sys1, sys2, per0, per1,
+  per2, per2pok, per3, adc0, adc1, emmc, and vga.
+  This document provides an overview of the "per2" pinctrl domain.
+
+  The "per2" domain has a pin controller which provides
+  - function selection for GPIO pads.
+  - GPIO pad configuration.
+  - GPIO interrupt handling.
+
+  In the Peripheral-2 Pin Controller, there are 31 multi-function GPIO_PADs.
+  Each of them can be multiplexed to several peripherals through function
+  selection. Each iopad has a maximum of up to 4 functions - 0, 1, 2, and 3.
+  Function 0 is the default function which is generally the GPIO function.
+  Function 1, 2, and 3 are the alternate functions or peripheral signals
+  that can be routed to an iopad. The function selection can be carried
+  out by writing the function number to the iopad function select register.
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
+      - const: starfive,jhb100-per2-pinctrl
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
+            enum: [ fan_tach, gmac_rgmii, gmac_rmii, gpio, host0_port80,
+                    host1_port80 ]
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
+        pinctrl_per2: pinctrl@11bc2000 {
+            compatible = "starfive,jhb100-per2-pinctrl";
+            reg = <0x0 0x11bc2000 0x0 0x400>;
+            resets = <&per2crg 0>;
+            interrupts = <62>;
+            interrupt-controller;
+            #interrupt-cells = <3>;
+            gpio-controller;
+            #gpio-cells = <3>;
+            gpio-ranges = <&pinctrl_per2 0 0 0 31>;
+        };
+    };
diff --git a/include/dt-bindings/pinctrl/starfive,jhb100-pinctrl.h b/include/dt-bindings/pinctrl/starfive,jhb100-pinctrl.h
index 9f622468c294..2d5150e3adb7 100644
--- a/include/dt-bindings/pinctrl/starfive,jhb100-pinctrl.h
+++ b/include/dt-bindings/pinctrl/starfive,jhb100-pinctrl.h
@@ -177,4 +177,37 @@
 #define PADNUM_PER1_GPIO_C34				34
 #define PADNUM_PER1_GPIO_C35				35
 
+/* per2 pad numbers */
+#define PADNUM_PER2_GPIO_D0				0
+#define PADNUM_PER2_GPIO_D1				1
+#define PADNUM_PER2_GPIO_D2				2
+#define PADNUM_PER2_GPIO_D3				3
+#define PADNUM_PER2_GPIO_D4				4
+#define PADNUM_PER2_GPIO_D5				5
+#define PADNUM_PER2_GPIO_D6				6
+#define PADNUM_PER2_GPIO_D7				7
+#define PADNUM_PER2_GPIO_D8				8
+#define PADNUM_PER2_GPIO_D9				9
+#define PADNUM_PER2_GPIO_D10				10
+#define PADNUM_PER2_GPIO_D11				11
+#define PADNUM_PER2_GPIO_D12				12
+#define PADNUM_PER2_GPIO_D13				13
+#define PADNUM_PER2_GPIO_D14				14
+#define PADNUM_PER2_GPIO_D15				15
+#define PADNUM_PER2_GPIO_D16				16
+#define PADNUM_PER2_GPIO_D17				17
+#define PADNUM_PER2_GPIO_D18				18
+#define PADNUM_PER2_GPIO_D19				19
+#define PADNUM_PER2_GPIO_D20				20
+#define PADNUM_PER2_GPIO_D21				21
+#define PADNUM_PER2_GPIO_D22				22
+#define PADNUM_PER2_GPIO_D23				23
+#define PADNUM_PER2_GPIO_D24				24
+#define PADNUM_PER2_GPIO_D25				25
+#define PADNUM_PER2_GPIO_D26				26
+#define PADNUM_PER2_GPIO_D27				27
+#define PADNUM_PER2_GPIO_D28				28
+#define PADNUM_PER2_GPIO_D29				29
+#define PADNUM_PER2_GPIO_D30				30
+
 #endif
-- 
2.25.1

