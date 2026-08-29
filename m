Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2100.outbound.protection.partner.outlook.cn [139.219.17.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 921A12D73B8;
	Sat, 29 Aug 2026 02:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.100
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787972335; cv=fail; b=X9Lu0O3XxdpUt3OCNdGAu2HF3SDBVm4kLIbULoxYmalrm+pX+GTNCNIAJoso89ZqXaNnkoe5eYQeSoJjrLFA0vToLWY8MaUJ50APxr7Qi0w/JaNNyHkbjuALwwD9MZlgDcn7QE0qTSg1GmizBVMEQrOL0+Xw6K/URxVX+UufYN4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787972335; c=relaxed/simple;
	bh=AhBHWd9b2GpogC1G86//cJ2Sv98SgxgCuRrTq6MIghs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=sbwjXUfjLFfKlp+cZOXBF7Yrt3P/fd/1U+CHcsZoh/t9iActwW1HFgXymJcfE+TeOHwlqJj51vlgcgTWisbTzI/WBUm16jnNd8BXoaELahyTddjUdG7dwg0rTHjR9kl+/UZdpYm4qcwiHF5I+gjUjc9lydz+RFuscZsbLvf5avM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LtCeLhDz/VpiQkpUN4U710GhI92Cs3l7lZDItELvn0gbk7Ev9xQsCZUt2ioLS1t22qERb+tSuuJ1K/sbtKEul8cGTCvWn9W5X3Pr96H0cTse1g1VXiygGgyHdDzzgNXyq3Dsh8q7o/QmOUEw9zpFehKJKDVKkGhcr0Yenzk7PbtTsXUyL0BR+1zZhII3QcIfCE7GzkjUqgsYvMZReJvpoaE+k6gH7k0x0hnyTon3hQgxdpwRUFxX2qWAtmKrPxIzBNuCJVxOjdsw7GI/gYGlncku86Vn2ripPzqt6xB8Ljmyf0Mbhuisvh2+aPxjfOgBbQkIPaNn7b3olC+rgBVFmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e+b+4ebnmXYzKgXyevoJgrCKehLyB5S4boBQ3d6SBKg=;
 b=Rrb8q796zPpmVSs30/jk9OEv4vNhPsqJlUEAm5vSbIlY3VnwSGd98BXXaGvMfyjIHEQodesplJ/GEf1XYYqxARAUQ3YLFafC8o3ULZfmd+WAf9UB1dc7hZYe4mA/gBKQ4c51Qlv4V+fNp/Xk1+iVlkdjUK/icraPy65IiwlQ1Z5fXfXZMfF8/HCeeXg7tARRtfs+HXdof7lAAVLrKTHjrx0N6L3Ie0Faihwz9eIGBCTgZ18rpxduFYLCgd09OrJQ3EBwwKywfcoA4pD1iWlUNEvV+SZMxWar3RqZu5geMaX76bYG3zX982WuLeIOoOhQ1jxJHFRn8Ld+/rtNHIqN+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1153.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:13::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.19; Sat, 29 Aug
 2026 02:57:43 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0315.011; Sat, 29 Aug 2026 02:57:43 +0000
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
Subject: [PATCH v6 07/21] dt-bindings: pinctrl: Add starfive,jhb100-sys1-pinctrl
Date: Fri, 28 Aug 2026 19:57:06 -0700
Message-Id: <20260829025720.23915-8-changhuang.liang@starfivetech.com>
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
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1153:EE_
X-MS-Office365-Filtering-Correlation-Id: 2cd5b117-4142-4678-2d3e-08df05794bd2
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|7416014|376014|52116014|3023799007|18002099003|22082099003|56012099006|6133799003|10067099003|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	n5t9Px6RdSdD0JwQupK0tHbm8oAWrggvJNqgJKP8myauyMiY3mUIx19f6XpzcivtQTNi+YnuxT7XTp5nixwgz048N0Q9SLu8JK68qcpV6y4e7mmXujr7ZHr01HSmzACr1sq0vEj7izmIZKPPAtU17cd10eTzh/3mobtwoE70klmIi6IxhB1nNJMrNKzrAPVfjTwCafqypSmmwgmYrGq6dvf+BRsn7S7EeDZdBmUFiCE6Q1r4zIm3zah10qzB5nfs+UxFUXfbDsLnTPhcBwmgcYojVyM7iA2HXP/aBdx8nubYDhy5qL6lxzrFPyTUbzcuwi2kT7ha+x7ZPO/rUjBOI7BfzbtsnFPe9RQKjS1YrOrP4tD/4pqZgpYYw3q/LPgeWMw72N5VWIVj9k3ev97ro8dZz6lFI/f96RufxW6kbKNfFvlPv5MGXqZfVh/tayqbp6l4R4Si+WuodOCrdGrw6K1p502yI9bA7nEkBdpciBIvvNMw5OQSlxr3xNEgVgRAC/90oSzgRvQ/MoFq+XCJuowJlqcu7D2Wg5kbvNT1I9UgPUgzOxP8FB6/AARGEZNm0oOhLssxJtDJjap8tLWSzg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(7416014)(376014)(52116014)(3023799007)(18002099003)(22082099003)(56012099006)(6133799003)(10067099003)(921020)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?oMJy+ZXjUl8iKPZQdylcrK4j0nI3p+3Yra1yJ0RUngZxIpvaf2lQ1FKs8hb8?=
 =?us-ascii?Q?L4zNlrIGyPH+wrjZwHCc0vkyJwyJbV3s+MiPaKnYlQrPhWeVucDPd+6J4w+8?=
 =?us-ascii?Q?kQYH4xEl/XkeQnOduwtNwydgvUKX+fYpzvJQnCqg8T5XlGv/RA+q9XiEgCWt?=
 =?us-ascii?Q?3TdNWFJCFlEeb3lpFcQF31Vkl8KN/bkkOKDcYfuMOhX7CwaoUYglbuqF5Oan?=
 =?us-ascii?Q?Bd55V2u88xa6MyDZdl4bZmX1QSGiupwb9oIKXx/M1bdILI+qKmvoLj3MMU6Q?=
 =?us-ascii?Q?tzZTwNJAhT5g9EytwDIjRlS0jvJzOM6b/0ht5HcwsGW5KrV+3xXCZJ+66mBd?=
 =?us-ascii?Q?eHSWyDsyFuatV50zNZ4nqxV+BtvnQy3ul2aeGgXmHST5PXautLByEsCsmZYT?=
 =?us-ascii?Q?zf9+gNv0PsNUDxjNsDeS0iiE6V31zt2I0XYh2slFI1qSvx/vsvyP2z2Frbq6?=
 =?us-ascii?Q?ZMiOfiKRwYgw8xzm1ulltTaEb0S8QrX77fky1whjUmxs0R89XGFGJuR12D2R?=
 =?us-ascii?Q?/6XTBf8OlJ7UuoIK1FV5P5bdFmEL24fwb2MjYoDwNhbdnRL7ohWRm1wTU/2+?=
 =?us-ascii?Q?nrqfQHdKuRJvBQrsodzCIlBw+bVDn0mI5+9iQMpbJTDV09kbp+wks+8B+RK8?=
 =?us-ascii?Q?E30ECIPsH5uZsbTzCd8HpwXqFOieFJJC9iKS3PDKnHAc4k9xcrQJKvN/zqz/?=
 =?us-ascii?Q?rPQ+2jYfTgYtW68GCHxir9otXvBM4oQ3TKBv5Ue264Dr3r4SR0FAOVj9F0Vy?=
 =?us-ascii?Q?qTlAPBmgMmbwsbwMuTN2mhyuU2xPzR1g9KP+XBMDRE0HFmf7aoIQ1RTM+DZt?=
 =?us-ascii?Q?ZBBhrjk1ccai6CVUIQZYsprCq4GJB+c2EsCDDTsHeDE/UUe0jCMZOVcit4Wv?=
 =?us-ascii?Q?kAqEN3PDPQUMYQm74HIjZ9qipxFWa9ofSXn//71GBEKmC0bN2LYYaQGOFCWm?=
 =?us-ascii?Q?pNNGw66AAo9S6oVwC5cVNx+YkSuFka+I3KGowDNlDgXSf+VBTS/EM09WFjDP?=
 =?us-ascii?Q?Jx6P9WR8nKUy/Gv2bUvwN+hyftC1U3w7wS60BVSMY+l0vr9ib+BmQIZtgcIL?=
 =?us-ascii?Q?jB1+MnsFcD8Nxrf1C/a0A7poHuHheDNdC00t3eJWYG08e4QQF/4SOZnab/xi?=
 =?us-ascii?Q?JXgtetDN6PVSHGC1psjqDmtaIPefY+AM1ZTIir4lA9HNKI9WLGZ/3fR/JulR?=
 =?us-ascii?Q?+BQg39Zhm5rxCpjfuaeFNLLZZkBNYw3zFQFEllBORZRIdh3vrNf5RyGTKxgM?=
 =?us-ascii?Q?Er+OwHuHBztkxAlrgHbkq/JHtJM3kVT2sNkgEa+Cejrugm6nVtx9p//Uh+c7?=
 =?us-ascii?Q?+6uGrdAsv6EzBaQDjuQD4gg8+3s5m1s2Ne7RQrZPzAOg6VhaZRX+9GXlHc/c?=
 =?us-ascii?Q?0aFUtBMSOh0ymd/u8HQTbiWnWDVu9MJdlk7sGoFwNNp6v2zFdUvVd7YI9XBe?=
 =?us-ascii?Q?iUFM8AifqrSs/F3WI/2z0efUGjW9FyrJgCtd5WA3yjkWAGZkzTmKUqLl6h8U?=
 =?us-ascii?Q?6lhOuLkFROciW60sGUmDuomJufACFmakJ2WZcpZpssmCXI9pBFumjK4/BMuN?=
 =?us-ascii?Q?8e7H59/RVrVYf/369V4HhKPeOf5bHv3rz1Oc1f9yE9kmMNsYVlFm344RZ6KF?=
 =?us-ascii?Q?x9DtA7kCQD1OcWj3xY7weClJC6PN51Gn7wgbffXE5hoITeLSJo2Gg1yzWEKf?=
 =?us-ascii?Q?lXpAlxUzxT/iCknPvJH6lhqCWOQQkf8rxxbQCvSsxzR6PatL9z2x84C9mnGE?=
 =?us-ascii?Q?cTRASHpJItsTpe6UETOlGJsIFVx2alPM1FyIYZiFbzFg9qcWSLUq?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2cd5b117-4142-4678-2d3e-08df05794bd2
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2026 02:57:43.2055
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hfvzpxKiBqfRnsU23TZhWCwU99qE8v6/05/YYI2WLZ8Dri/ZUsJf+RaCm8Ce4uQ9r/wuNLKBnjBiyk37CqhcKV7cbQyJRnd7J+F8GnqziHY9BJN/RUkExoxrHQGFbxBA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1153

Add pinctrl bindings for StarFive JHB100 SoC System-1(sys1) pinctrl
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
 .../pinctrl/starfive,jhb100-sys1-pinctrl.yaml | 164 ++++++++++++++++++
 .../pinctrl/starfive,jhb100-pinctrl.h         |  10 ++
 2 files changed, 174 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys1-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys1-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys1-pinctrl.yaml
new file mode 100644
index 000000000000..cffeee8e3da9
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys1-pinctrl.yaml
@@ -0,0 +1,164 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/starfive,jhb100-sys1-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: StarFive JHB100 System-1 Pin Controller
+
+description: |
+  Pinctrl bindings for JHB100 RISC-V SoC from StarFive Technology Ltd.
+
+  The JHB100 SoC has 13 pinctrl domains - sys0, sys0h, sys1, sys2, per0, per1,
+  per2, per2pok, per3, adc0, adc1, emmc, and vga.
+  This document provides an overview of the "sys1" pinctrl domain.
+
+  The "sys1" domain has a pin controller which provides
+  - function selection for GPIO pads.
+  - GPIO pad configuration.
+  - GPIO interrupt handling.
+
+  In the SYS1 Pin Controller, there are 8 multi-function GPIO_PADs. Each of
+  them can be multiplexed to different hardware blocks through function
+  selection. Each iopad has a maximum of up to 4 functions - 0, 1, 2, and 3.
+  Function 0 is the default function which is generally the GPIO function
+  (or occasionally, it can be a peripheral signal).
+  Function 1, 2, and 3 are the alternate functions or peripheral signals that
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
+      - const: starfive,jhb100-sys1-pinctrl
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
+            enum: [ espi, espi_reset, gpio, host0_port80, host1_port80 ]
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
+        pinctrl_sys1: pinctrl@13081000 {
+            compatible = "starfive,jhb100-sys1-pinctrl";
+            reg = <0x0 0x13081000 0x0 0x1000>;
+            resets = <&sys1crg 2>;
+            interrupts = <58>;
+            interrupt-controller;
+            #interrupt-cells = <3>;
+            gpio-controller;
+            #gpio-cells = <3>;
+            gpio-ranges = <&pinctrl_sys1 0 0 0 8>;
+        };
+    };
diff --git a/include/dt-bindings/pinctrl/starfive,jhb100-pinctrl.h b/include/dt-bindings/pinctrl/starfive,jhb100-pinctrl.h
index 38d5a94e92e3..30704a5a3418 100644
--- a/include/dt-bindings/pinctrl/starfive,jhb100-pinctrl.h
+++ b/include/dt-bindings/pinctrl/starfive,jhb100-pinctrl.h
@@ -28,4 +28,14 @@
 #define PADNUM_SYS0H_GPIO_A14				10
 #define PADNUM_SYS0H_GPIO_A15				11
 
+/* sys1 pad numbers */
+#define PADNUM_SYS1_GPIO_A16				0
+#define PADNUM_SYS1_GPIO_A17				1
+#define PADNUM_SYS1_GPIO_A18				2
+#define PADNUM_SYS1_GPIO_A19				3
+#define PADNUM_SYS1_GPIO_A20				4
+#define PADNUM_SYS1_GPIO_A21				5
+#define PADNUM_SYS1_GPIO_A22				6
+#define PADNUM_SYS1_GPIO_A23				7
+
 #endif
-- 
2.25.1

