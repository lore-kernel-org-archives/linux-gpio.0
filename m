Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2094.outbound.protection.partner.outlook.cn [139.219.146.94])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98D6539B95E;
	Mon, 10 Aug 2026 06:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.94
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786343871; cv=fail; b=GPQMGEgwIZdFgJ37E9ZoEtrCjqrUnNGyOQOGCzazF4k3VwzYLiTLv/unbeX3v5Sc8rWcEO74AyM2fLioUb1muIt3sDKeQZexXzSL0Zzngi53hPHmMv8+PhZp9S3LVBqHf1WIb3VAPflIBP34xEvwRUcM4g7XSoDWRxYrAaz0vkg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786343871; c=relaxed/simple;
	bh=sfAY5AhotOSVk7hFGIMmoCyHNpYNfvjMtWPI0mwQoEg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=cHJKK0UjvqWIea/0gQI/YXsFyvspLqciiqLKcr+BAUiurLretKDy82wd4ggQajJYdlW/ozSapivWNd+383Q+l2qHGh4Usm8LJ3YdQM8z49Uu2p6B8/NvVXt+nFhLRV1Kgy4CAIe5bInWdvX/xoZgkPTjUG/PhQ5hcCmvfjuJdrc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.94
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WpPQX1DIRMZ3ysp3J1zplcg7fPnS/fYZ6qhJI6gehGmPw+P/GeySgKl9c0pgxax+yLknb5PttHbT2/+ENzO8J0LXDW4BxBK6jg2hl7KsghWsIH7TRUKd0MhgB4EjWCc+wsUyfRb2LYhTATSpn9gEZTIzrufMvHKGULyzycEOrgpbyCQbuPGbnRJ8ftSS9R2Kwb+t1x95ORo7RMD7mlgJZqbovme9YWYmZfwweEuhQJ+NBWnqju0cO6gcPyDIZf+lUBiIZOjD3XNd2BKGH7mLPbBpo8HvIvltCAqeIXo7atkeKd2LdycwOAEwMBKn31ACAGpwfS2vNTUYCGxKae1lKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FsOGr+7249/jIZJEHKqIIF/3pZe2m/K3bKVpjN94erA=;
 b=PfVj50M1hufzs5dA5bjdV8AOACF7z7JP7Qk0SAjeu5rs6vLe1oRPpMKxBOun1Gsez7i7D4vbOiuiFdu4ivd0J3bVJ2N3MBiqwLW8kImIRYZKMTVg/KO8hNKyhbDpH/1yAoCdZcwaYgglTdRxbhWAbhqLiWK7pXIDQRn2YVFPAI4T4EVZ9EprNVQ8R56keQoTOTI/tFTW7G8vGJaduUteBPkUrj18+GtRy79TBjTZumza52pTPOGyxOf+QUFf/1dY6soG+pIgdMAmdGoyxy2SulMt0T13rxviTo7RXjTCNNk9Lb1EoJcwE6vbNEjnlPaaizdELBpzeHCg5GB5089ZjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1315.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:15::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Mon, 10 Aug
 2026 06:37:21 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0292.024; Mon, 10 Aug 2026 06:37:21 +0000
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
Subject: [PATCH v5 17/21] dt-bindings: pinctrl: Add starfive,jhb100-per2pok-pinctrl
Date: Sun,  9 Aug 2026 23:36:46 -0700
Message-Id: <20260810063650.239303-18-changhuang.liang@starfivetech.com>
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
X-MS-Office365-Filtering-Correlation-Id: fde2fd00-50dd-4b48-d08e-08def6a9d497
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|52116014|366016|7416014|56012099006|10067099003|6133799003|3023799007|18002099003|22082099003|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	IOEFhP7HOJAjmNZ/+qhCJgzyHFb2vzB+J4AxpR8ZjfDbLBQTo5NnsdtFmxAkaiMWP+Zktx7QWbZuSSn2b/KYNWNqRNvFbswkSvxQy++KgJsb/hY/KOSp4us7urhwzAkB2XAZpbwt3KYP1z9PEx1s6t9WEY4y9VnQs52y5ZUBmouuewuPmqPRhVxJgIv3NLQpxVPgnh1FE/zfy/1xz2I0/S8tAABTtSy6CZszSMfJ9uPZSJGAQN7dllrVgZ/lOZOAW1DyoTKNOVOKy/6TRx09hlDnrayzBLrbJJ9VgCa1lRe8QfDZMifkeqLb+e3wOYwVphWqQcivvmnlkqKNr3lproTkmn3X5EjV7M16msobUWgZJ12iPFZaHYvrHDbn9p1ciK2uuEDEi6SeMt6OdG5ujFolxjHJy81B9+GwfRXhf4we6ae0U60s7GbEn+sLCPhlXa2iTaE/D6IfYiq64kxzw5iNatc4AEW6Yi9TobQyWPsgFEcFd2i5Y5TDGM5zULYlDQub8VGeVzGztkcqosB8arH2qzkpYe1Uiq3qX6J/eygKz62lJDwEi1e5eRoSJhW+YJeBYitURc9fO2V2WFOzSg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(52116014)(366016)(7416014)(56012099006)(10067099003)(6133799003)(3023799007)(18002099003)(22082099003)(38350700014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?YrJuJW+mPw31MofJUTk0Nt2pwjWdjM0mRctI+EYEm2nER5hdgFbQsCbNPh3F?=
 =?us-ascii?Q?CYar55lmNnyItbOsbhd+mbB1wRY2dlT1IYL/imIJinLqSo/Lchv5b/d85qTm?=
 =?us-ascii?Q?w/V4mPDgMKCtF7YpwRIhcqQVX0xf4Uogkhffvv9GUYkod61YvXBRdjVSPYbR?=
 =?us-ascii?Q?vWME1zLsLjWiLCNPMvEfnNiMErfRqHDOfDPSC6uf9jgsWzvTsXHmH+bFitwU?=
 =?us-ascii?Q?i2Yalez7GcZeQVYtonl4+zugnNUzEEQABckp3lD5MmbJpR+Dca8Lcq0rnKrT?=
 =?us-ascii?Q?pGfmZxXK1CVrEctdpQ2J02ALffSujZCPvqfiFGBUKeHMdQZgXu+FUeVQh6r2?=
 =?us-ascii?Q?wRvHGicPEM/p4Sx2A2JhH6bCAzYjf9+13sb/1QmF+qT5qcDzUapwQHKAqEUA?=
 =?us-ascii?Q?GlFW6Fe7zcCj0hOLzo6pF+5vehTleRrrlzgdAdnFT9NHt40DoA5y8MXf117n?=
 =?us-ascii?Q?MJluX8gsh5YqBkaKYr/WNuK5Aqd4gNB+HgPQUqY7owAg6xmbVssQIJtseWec?=
 =?us-ascii?Q?fGh80NkDWRwR86p73W213sB3eSqRmjmNt8BEtbbW+XV+Q2YD485IqtXzqQcW?=
 =?us-ascii?Q?o8XO1hSguQg86i1+nxuocHEMwq21HChIYiNyT7sXps0iTrhvmyQeOgg1X0ys?=
 =?us-ascii?Q?pGnVE5sc7dRv1Jb1Dd47pDGZiF6qK3qj/oi6Tq/iKbjVXTmnCzEKPpZViaSV?=
 =?us-ascii?Q?mdo36X8ZrOWnsXKQsB/P6DJ8YDdCFQoEHEwUEo5tXAT8rUnlyXXt6bQNeLlf?=
 =?us-ascii?Q?fKLEYUOZA4g50DP/jRbxXXbXI8wV2sXG6l5c1lKarPH4kjZ6rXX/ADm8vOu2?=
 =?us-ascii?Q?63Cr7rwJfJdQKG/gPnzyh5C7nsJ5A2lT1X4gBC5RKMqM+aHfXU5af6nO+XML?=
 =?us-ascii?Q?d96tPCgPQVcx2dpT0xuz5yEzssIwaYG1mV5y/tqkaAzmtxkrCMSkoV64e1w1?=
 =?us-ascii?Q?H40eCLbLAQ0WN3wNxAjw6iLDObwOtlAfr9K0ZrXD5mvFviLlu/LVsFxPv3V7?=
 =?us-ascii?Q?3RehSEvE/SFDfQMDeeDu073AMao7RJuezzwz12kIDWwOJj61T3Yg1Mnkz/XO?=
 =?us-ascii?Q?3ZoXTEpNWyUCXE8/Ag+XtxukB6GTT9i4sl3uIf92cC80Y5qCquD6ar4U56qZ?=
 =?us-ascii?Q?UekopFHADVLJQNyvZkwRpqb0Y9yN7ABfA7aSq+uJ6AYg/9znLQ0SO+5efzPD?=
 =?us-ascii?Q?pny7xCeVTCbUPLahHJGyPFYqasFdKy6M7zLv4xoU6RR5c4Dm5ui6p8taQ+0f?=
 =?us-ascii?Q?nOHrv8zhTIpOsMd0jjJVMmvRqVSxbTc2Is6v5Cm9LqCZRL3kRweeu8ay3y5C?=
 =?us-ascii?Q?GHggStfxT6AUoSjkmk4G5wQynNWtbqQb6UXfrmmsdSbE4FBk8qkqgj1S4Mwd?=
 =?us-ascii?Q?iO2DH5Ty/NEWlOiKaNnAHkwnZwwrEZ6gUI9eiRbrqP/g+aCMUs2Xrc7XSHan?=
 =?us-ascii?Q?efTDxLMbxh15HgX0+0/1uofNwoVOVRzyzFFIJ+K5VxDtII7KmNGxe6rRZzvR?=
 =?us-ascii?Q?PA4DNEHXvD4uutnp27csjq+YUIyjZJuvYwnpSBgsck7ogf3eiM15tfwvmTKn?=
 =?us-ascii?Q?wnCwvOpIStU3PVH/W8FBNtM/esnEx4xjn68RxB8fLqfQrl2n1bx79iNiyP5F?=
 =?us-ascii?Q?izbrwLZ/JxgokNW/woJxGjLeLbBlA9RodnaaW1QvfdyqBvjFL3LBh9FoaYwk?=
 =?us-ascii?Q?PT1C+hyMT9WNP833MqrI4zCR/dc3SxHc43q08SzGcSmt56tHW8Jxj+ZEHkjJ?=
 =?us-ascii?Q?zzcAQ6va40E4ta0v0yjr1YWxFDeuMRyCDoOIwkXGDpnpI+16HUex?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fde2fd00-50dd-4b48-d08e-08def6a9d497
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2026 06:37:21.1229
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Fz7hUIIS1seekMBNBRYzvR56vjh5W5GaZBIb44ghx/9vpmyT6rnUkBo2+pH02D2gavVU4rUPXSvykgul6zQZN+jMlkAElaAXfQkdM66Nnlu7s858OeUQVWXvae8yAVLk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1315

Add pinctrl bindings for StarFive JHB100 SoC Peripheral-2 Power OK
(per2pok) pinctrl controller.

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 .../starfive,jhb100-per2pok-pinctrl.yaml      | 162 ++++++++++++++++++
 .../pinctrl/starfive,jhb100-pinctrl.h         |  20 +++
 2 files changed, 182 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per2pok-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per2pok-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per2pok-pinctrl.yaml
new file mode 100644
index 000000000000..90cd8eaeec6a
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per2pok-pinctrl.yaml
@@ -0,0 +1,162 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/starfive,jhb100-per2pok-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: StarFive JHB100 Peripheral-2 Power OK Pin Controller
+
+description: |
+  Pinctrl bindings for JHB100 RISC-V SoC from StarFive Technology Ltd.
+
+  The JHB100 SoC has 13 pinctrl domains - sys0, sys0h, sys1, sys2, per0, per1,
+  per2, per2pok, per3, adc0, adc1, emmc, and vga.
+  This document provides an overview of the "bper2pok" pinctrl domain.
+
+  The "per2pok" domain has a pin controller which provides
+  - function selection for GPIO pads.
+  - GPIO interrupt handling.
+
+  In the Peripheral-2 Power OK Pin Controller, there are 18 multi-function
+  GPIO_PADs. Each can be multiplexed to several peripherals through function
+  selection. Each iopad has a maximum of up to 4 functions - 0, 1, 2, and 3.
+  Function 0 is the default function or generally the GPIO function.
+  Function 1, 2, and 3 are alternate functions or peripheral signals that can
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
+      - const: starfive,jhb100-per2pok-pinctrl
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
+          trigger enable/disable, slew-rate, input debounce nanoseconds
+          and drive-strength.
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
+            enum: [ can, gpio, host0_port80, host1_port80, passthru, pwm ]
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
+        pinctrl_per2pok: pinctrl@11bc2400 {
+            compatible = "starfive,jhb100-per2pok-pinctrl";
+            reg = <0x0 0x11bc2400 0x0 0x400>;
+            resets = <&per2crg 1>;
+            interrupts = <63>;
+            interrupt-controller;
+            #interrupt-cells = <3>;
+            gpio-controller;
+            #gpio-cells = <3>;
+            gpio-ranges = <&pinctrl_per2pok 0 0 0 18>;
+        };
+    };
diff --git a/include/dt-bindings/pinctrl/starfive,jhb100-pinctrl.h b/include/dt-bindings/pinctrl/starfive,jhb100-pinctrl.h
index 2d5150e3adb7..4b7f349cd9d7 100644
--- a/include/dt-bindings/pinctrl/starfive,jhb100-pinctrl.h
+++ b/include/dt-bindings/pinctrl/starfive,jhb100-pinctrl.h
@@ -210,4 +210,24 @@
 #define PADNUM_PER2_GPIO_D29				29
 #define PADNUM_PER2_GPIO_D30				30
 
+/* per2pok pad numbers */
+#define PADNUM_PER2POK_GPIO_D31				0
+#define PADNUM_PER2POK_GPIO_D32				1
+#define PADNUM_PER2POK_GPIO_D33				2
+#define PADNUM_PER2POK_GPIO_D34				3
+#define PADNUM_PER2POK_GPIO_D35				4
+#define PADNUM_PER2POK_GPIO_D36				5
+#define PADNUM_PER2POK_GPIO_D37				6
+#define PADNUM_PER2POK_GPIO_D38				7
+#define PADNUM_PER2POK_GPIO_D39				8
+#define PADNUM_PER2POK_GPIO_D40				9
+#define PADNUM_PER2POK_GPIO_D41				10
+#define PADNUM_PER2POK_GPIO_D42				11
+#define PADNUM_PER2POK_GPIO_D43				12
+#define PADNUM_PER2POK_GPIO_D44				13
+#define PADNUM_PER2POK_GPIO_D45				14
+#define PADNUM_PER2POK_GPIO_D46				15
+#define PADNUM_PER2POK_GPIO_D47				16
+#define PADNUM_PER2POK_GPIO_D48				17
+
 #endif
-- 
2.25.1

