Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2135.outbound.protection.partner.outlook.cn [139.219.17.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BB433BC68E;
	Thu, 10 Sep 2026 10:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.135
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789034689; cv=fail; b=Jr99Y4skOMYarrkVy8x7lIwyBGp3Pgx3AJ7ptRnJlW4vA5ZQxJBjANCzzrgAigH3J3/ZFJC1CvCb5g5HD5ttijzU2LQsodQLU3ub3YuvQ1FKIUcTHzGF5jJrPdnAKT5IH+knPIQXH30Sjp4NlJM4PyKnMzwISMGsQ5qiLZ9Vm10=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789034689; c=relaxed/simple;
	bh=PVVekmCvRXPJWVCWwqKDK9j+JyX/T8nUit+DfsHOOuY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=KIfbnnk5IQegSKclEhT6HAccCsWPkjRKu4euQJLRGz3s6q2qSEU5P0TTDDI5wQEeZ1acIlT/PTxvgi3MmDTBaFv/yAeOoHxxchMbkXgFkymBGnbVx4L62Qt4/3zrqH1YLI6P0F+mh9OiNTuyhy4ADbW+jPwwBnS1Wp9O5/Z3N78=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.135
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N/4zhBgih/HtZsSEQZvV7KtEEZAkSQkweRHuldyKw1/LpBV/9FFsOXdmpdjAe7iWg3NmE0JdAd+npWX77xt6K7+j7qkqliZUgw7dCypibdg17sriEr1ESs7oIE7/3b9qKOPJwm8YRf1KcrV9sM0S/bkRUMuJWu4pbJviiZdDMYf3IehwBoxzlWl2XTsEHaCy2JmzGZqPlj8xVFtAar7PporMsde8T6eGGZQ8iUu0F0ymbtOvZYtgXFR4GmIf3XzVmpQh/FMBeE0dEOFVByyjDc5liLWAwqw2Le3FjM1PrxGU05XnERFXx4R1NO/9XvWy1LKotRdi3piz6N+sQEY5yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yUn2xAGOCfWMJiSKI7j6fKt6bM8M2vYky96CfNfzDwQ=;
 b=F9l8Z8oU4FXX/AXj4CipoyV/shsNi5ITtl0Sv48r23TkOUe2DOyHfu8PPA75TJV3DNvOb5VAGHrzGeb9gOPkvVO/I9tPCRWTYGXbjHNY1FjiLqnAOIyOLTz3JZZNAMUgmHa89ujkXr6VeWciJC1oVC5U+6+WicjFhQFyHPaAY7RjIQse3dBU8G2ZSO/m1ex0DVphfHAaLi4CWKiohNTlhoIxTELav9vGY7Iz9BBdFMgsk9rbRSo+WkVxF6iZu2025XIz7kL2k+ItJ/g6PYX9hKMtbXCXSaAe3tvEcNUniauEuGtpKgjufTlPCoJdVtsLNkSd1P+LcPVcDuLn7/J6SA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1233.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:13::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Thu, 10 Sep
 2026 10:04:19 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0339.017; Thu, 10 Sep 2026 10:04:19 +0000
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
Subject: [PATCH v8 05/22] dt-bindings: pinctrl: Add starfive,jhb100-sys0h-pinctrl
Date: Thu, 10 Sep 2026 03:03:40 -0700
Message-Id: <20260910100357.130134-6-changhuang.liang@starfivetech.com>
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
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1233:EE_
X-MS-Office365-Filtering-Correlation-Id: 96f0f314-b3eb-4e14-a566-08df0f22de80
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|7416014|376014|23010399003|6133799003|56012099006|3023799007|10067099003|22082099003|18002099003|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	6V2HEtfTNb6UT3DC3dZm3aChc3TEKeaV76bSOlujx0Wju4GPlD5t14YBaGbr12GMjQK4/6Zvvdy/JoSVpIBkGcs8i+V6gOtYKCpOeTlEgAhKb3qtIeOUOIi60BbanbrEmT+vJB95+yCiFVCF9UDmm8hgveGnnV/lQBbo5ORQn1Pcg7fhAM4SZhRhG/TJfrEpLjwIntVnuKJ4sK/KofW7DlVyieiaXk+XW8dPWZ7qN/VkuHABMGbpkEJ/HBSQGmNRCB+E8ZkbzMVUHMtmA/lCLYTVE2PaskmctuBJ9rUTjkR8462lK8kN/FkD63+bDktIiAE1t4Wq3KmiJvaMskiv7FHKAT7+sbw/lnpPHQbK1VRm9YCc7FuZ6LQy7bWZM9AXVq986/GLwZepVIW8oXHdPgozZEjxnEG/uDwAfkSaQ9TpuP+R45+k1PrZt2oO8V6iVubu6VUaXe0lBqIikTId+v6IKu9StAaIg/x6MrQ3vy+ARmRnTXFujbdAgP9armZMDokmLR1/Gu9v9qqJr9MIuT80Tr/7wbOTMl9GFxUyybggusBJpq0qdOvdk4QBov6i6mlfsCZt9iKuEiq0S2s3Fw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(7416014)(376014)(23010399003)(6133799003)(56012099006)(3023799007)(10067099003)(22082099003)(18002099003)(38350700014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?FzADSBtETrNNX/HAVG5KLA85mYAJHHnFxf693Pmn7dL4NxBnEPp2sVobS0ma?=
 =?us-ascii?Q?kouW/hZnrAT6SSIVqWDlmDWILaG15dBYeSRWNxtH3vFOLu9+bX4ytKXZ3rR7?=
 =?us-ascii?Q?kAXCMqnyZaPJsdmjBA52nJ7XzlV/SQWBa5GvpaCjCLWvzkKofLM3zDnnLnan?=
 =?us-ascii?Q?f4ylIPaEk1Mq2vJsHV+2726/LPBVL4DYkdzikkGjwvBcOxbv0qpP4fQ35PgN?=
 =?us-ascii?Q?OH5dGrKz7NuxQx3JNZl0XvF8CLWtswZeXobuNOjxZbO1iV0KQIwHPcYjJUzs?=
 =?us-ascii?Q?DU7NkPjv0hR3l6rs1y8y0jtF8F00YT8v8xm7wL/MFFNmyQ7Sr/qN3F6faB1C?=
 =?us-ascii?Q?XxDYASTDmrQzH/tmXLf8BWj2HSG0ce7N89G9DTu8KneiJ0ZliKktdbo9h0fu?=
 =?us-ascii?Q?bn2PzYY8L9HVlwnaBiFrfD9YYyql70pHDGiWLvSvpOjDUxMHxPQRblEPM9AF?=
 =?us-ascii?Q?Vy7+nl8d12RjqenppdtC/2e7whwwa9+22GRuRiPF4ghubkATscGmN900zTZV?=
 =?us-ascii?Q?gBRlTpWamPtCsYbiV6POLvrbLf14WLIRfUrJ/oeMm2bX5Wunu+BuMv4mk/46?=
 =?us-ascii?Q?b27H7rYnmMNrlJzuDl2633lDZaWzwu00tWZr7kbRETi0CTZ1IzOmHXKxGOuK?=
 =?us-ascii?Q?NUKiDONyhFVLSX68HbPbHp11xxHcwDNdL62rYvUDeQe+vfanl3qNWh0fZRg2?=
 =?us-ascii?Q?mD0LSbKNNFXbOU/OaoMe3oiPUWAedZZORp+/qc+0alXg4bTS5vEd/Bwq6Gl8?=
 =?us-ascii?Q?Ut2DqiCIs4d3Z57R9dq9MjDbaPtZId8xNaRPRkwmK5Zx2iXihooAeqD3ibSw?=
 =?us-ascii?Q?/KuFN1zDHLVtEb9O8/IXIdJ6nmSe72ODVkUjTZMnjtshgTdYcdiI4dgRN/LR?=
 =?us-ascii?Q?sQ2S2cscgD723zVPeAhjOOe5QE2WzOmLhNQGTX89ALVdI6+63ogslnyQH5mm?=
 =?us-ascii?Q?Hk1KcsV1NQJFgfzAwWr8clEXXHmxWomf76YATsbNsfwtc3OhNdivP17yi+AO?=
 =?us-ascii?Q?4DK8EetKD3poixCWY0yBRXxjO1qXmvULrbj7SKNMgtEzp1vlyuhClqJUcYLW?=
 =?us-ascii?Q?cq+1ABc/3PzHubERfsNNwGOXlMX3iogTODxnGQBUVnAc67vQpBhWpmvWiwBX?=
 =?us-ascii?Q?ywTh5+CmVOritnrgsKxhexwp1IQciMnl9m9GZORttie9J/Gnl65TZg0PD9Ts?=
 =?us-ascii?Q?3PDn5y0kG2wVAyjqnphHADRt2Vle8O7fMa1S5Fs8v3I1YGhlmfIDUK7ak9HO?=
 =?us-ascii?Q?uc6wQqw/6AJbY7OqCWET7AXQq/8OXbDbKvgcZeFAFIkoAyo0LR57K6sJapVq?=
 =?us-ascii?Q?1D3W7ZNPa5gACCBEkG5rXSQX6DWcvX0urLOufFOSWry7svd9I7xlYhbHppHo?=
 =?us-ascii?Q?nTYFiSiAND7F5eddga+4ToRa/Jd+L7Hg74691vabX0+DjfsKwzsjFPBPh0zn?=
 =?us-ascii?Q?rgynF3W1wxwZ2oJ+6n4h+t7Ze+LvcIhUKn4ZOYqesSK3ETzC1uIAmSBCEetJ?=
 =?us-ascii?Q?L1rydXX4W0cjhZ5GbIZXigQfSGWBrj94X+E9BhMehqo0VgFEr8lQpR8a2nlk?=
 =?us-ascii?Q?GlVIjNSvff0u+uRJLHeMtrwdKy7qdIZ7ooq4RSyaf0OAQ0ab9WXIzuURrFoc?=
 =?us-ascii?Q?CTdiXRma6fcJasQNBAFrozLIjXZVk3yOUUHYd7lcWGTWbwvNA1HFPl2Ihzk3?=
 =?us-ascii?Q?RDV5Hl+/qCpP7D6DmfQT+4RzKWwdE1/4tvq9ECkiHl0tBtP2p9NnzCdHfUkv?=
 =?us-ascii?Q?F3XUnz6fq1sP5f7/y9sX2LwaToVoSvA8z5ym6GuvJkr672kCDGyt?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96f0f314-b3eb-4e14-a566-08df0f22de80
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 10:04:14.7399
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mQ685PWzS+IOa8qOk9r9lFuBYNO2GixCJwZTf+XrvPFV8ScO5aB6HuikkV7Ok/qDIwkkUiPL7S3cLscr0vCZqEdywdY8oZ4pH0HXdqpuwteNO3xNQAGBaI0nSqmb3OAs
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1233

Add pinctrl bindings for StarFive JHB100 SoC System-0 host(sys0h) pinctrl
controller.

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 .../starfive,jhb100-sys0h-pinctrl.yaml        | 162 ++++++++++++++++++
 1 file changed, 162 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys0h-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys0h-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys0h-pinctrl.yaml
new file mode 100644
index 000000000000..bfbd36928d7c
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
+  selection. Each iopad has a maximum of up to 4 functions - 0, 1, 2, and 3.
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
-- 
2.25.1

