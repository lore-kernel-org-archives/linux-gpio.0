Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2112.outbound.protection.partner.outlook.cn [139.219.17.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DCD83932FA;
	Mon, 10 Aug 2026 06:37:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786343853; cv=fail; b=GWhjoGVr5hHtRAUsb4STg9wcXdlZKtpiNta4jFe/8Jb/FcKFYcB1aMkMxHrDbG2364CF81SZSt1bn+egUAPbc+g+nlisFWRYjJ3j1uJGRwHUwz3rB6NtmZXVXPXIuHKd+2BKVW+Ix3dLu0xylNJNxV5C1Vvpd+Q4dhaHVkj5dtY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786343853; c=relaxed/simple;
	bh=4YFHbkWDOckzh0KFtQFMBcOK8gPxrHKDanlVKLt7k90=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=LlBwbhFnviNhDBkbX75hG0+651UesT+S0fHigS9GA+PVN1G8BZx5o/zg3NzQKc0y/FF3Czi5OZqm7moYqLmcxexm/TBgbUBKcOefV+6a3zFeiL2iETcTYjvzOuQebQKUp9utvSrHwYIB31Bj8tSYIPYwiB1OX9WOLoKKEIYcttM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=obxfBzSoMcqI7e3EhlQHY9WY8xVbVeXyR8KmfU6092fkmm/xkr+0ODot+kAMaQD4ULs+497MtPpz0KXSFUc5RZ3i2u3KRSaSnlA3xw3clU5hgumebY4QNdfONCN9kj6giO7kgl9iNOTHxwa4oNLt6huMLWYvr45bJ+cY3vluI/ixxl2i+jIOBzkpUhgznPZCF2tIsU2sRvhgg0a/1BoIVOPCoUIk9M+QEWgxJsSCzSzcFnVScnaiQrQpaiTIXgYsxBPspxO/3VXRMjygqO+pn7GOM4Tk9O4b5twVXadCAbsLQV5mjQYPXtwFhXr2dKFJcIyJnQRrDKTY4YrYC5HIWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BsePdKnWHo3NhK1hAM/vgNCefB8sS9kAvbyYAZ+2pNE=;
 b=UyJ31S57YBGfZu8iOMhR7Z5mLIPRsGGh6xzWKxkU5qbYxEBXnhLagZhcLUTcwj0UpVTeiDdZ7lHF6YrdNfHnAxswDCvRTszbxofhiZyVYpghYcgDcbKzWVbzVrEIxOSMgq3HBZQlULZZkl4rc4uGl0UKZugP/gthn0Oftwkmp3YEZ2niBXJUA6z0Lno3e8zs68ReB7gk4tFB+Tf71jxgjDXRp0PDLKhv0r920OL1j6dBDKeZHTnrvolmJ8/7bDTa6GCmUKeHMiaBzODyv0DXPQK19GwMP9OVNwFK/sjwgGHBhLXWqIl4ZREVgS0xrEgxlTE6f4YP29Ya6tnH91mLqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1315.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:15::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Mon, 10 Aug
 2026 06:37:10 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0292.024; Mon, 10 Aug 2026 06:37:10 +0000
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
Subject: [PATCH v5 09/21] dt-bindings: pinctrl: Add starfive,jhb100-sys2-pinctrl
Date: Sun,  9 Aug 2026 23:36:38 -0700
Message-Id: <20260810063650.239303-10-changhuang.liang@starfivetech.com>
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
X-MS-Office365-Filtering-Correlation-Id: 9f43b81f-ae54-4d39-c880-08def6a9ce66
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|52116014|366016|7416014|56012099006|10067099003|6133799003|3023799007|18002099003|22082099003|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	6qBRtUjI8pnI3JaWiyQ9L0XXbmiAbjJa4uIr5gqwKK1qbm2YKb220ImlYRVTk4T1I+itWiacb1e37FjbD4aktKllfEhHzLKzIOG3SR1CYScMizKeOhrqgRc9zB4qenzx7EyDVBwTUeJ1JaRqKeDoIjc5fyAY59F/kepcZCO2mgEFtjgazZxxuCxlzq2Ojhsl/069j77AfeUaDG3O2Oc9EmwLnkdNeUPwa/MEcbfPQhHXw0ZdpXNreUrl88EXqMY9MNd8h/1Lol+/cRMSUn4GAF16AZoqg33xyij72tV55MxLK44eVpcrS/8OUTH1LlQlK2NKEWYfDO15qd7Li3o6Y4yReTHEuyoFrq0qo5g0vm+x56WFoErfi/puxVaW9RGOadfQIWLzDFfHi7IfOc2aCM55XgU8EtARQhutQAHni1oxFgZ0vmmsLNSEAxoz5voYZf8ldN9s/vEIBoxD3x0z9Vk+6rmZhB9i/fb4As70WAVFPfNe/yqFvt7ooHhq9iTf3KQnDUuHuDvzNiOVC5MnS0bSfJN6oWwUPkTvdPUPuvjssIPj06Q21RIOsO4dVW0Xq7sn4+osLAFy3GJKKqRYww==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(52116014)(366016)(7416014)(56012099006)(10067099003)(6133799003)(3023799007)(18002099003)(22082099003)(38350700014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Df57+s/+kX84PQMbGwAlC1mYPpUajDONJRCLi7149WjvVx7ty7cL3MmZncUW?=
 =?us-ascii?Q?jMliUk8578opxNJpB5QB6H1+spDTYaSoMex5uDFGG+T/fYG+iZTOarNlkPkH?=
 =?us-ascii?Q?fg4FD3LEtf0uYux3jbmsPas+8F2oAv32tvBl9OCcLTq7i26k+YeCLykhfxck?=
 =?us-ascii?Q?7TXf4xC0d21OfhkecuRdV/UOH/EmDYi3PhqOLEqMT2qxzNNgLhBbeQXMigYC?=
 =?us-ascii?Q?fnESyqNN/4mI40FH3/qmVk3j14ER8zokfjWii+mmuB92VSzQ3IHd3LFUB9Ye?=
 =?us-ascii?Q?6J7i0ksuNwwMZhlAFCzfwTbWHzcPF+zbUrAYVB/U6g18u8H23jjs9/hvbkcF?=
 =?us-ascii?Q?I6Y+KFAxC/FP8XR2EfFLZvCdwzD7i60geBIclB/GoNT9DcoUhybe7JITrCyr?=
 =?us-ascii?Q?VY8hU2+vwF8KPjIoi03KhFjE4Lm6GA+uQV4tqmztY65LQSWG0W0YFRJkg+GJ?=
 =?us-ascii?Q?stQTBi09xXs3dliw8GaOGIRCczAgmb3hNHTNTCUO+NCNDg1hoWesHgl3fMLK?=
 =?us-ascii?Q?Tm9ergFpgvBDZkQD5va48zY7nap/kY6hjBfIPp7XkxeTQbJzplZ2Yu8lviK6?=
 =?us-ascii?Q?oxy3iWxl2IPLRe1X1ajqUCSnVl20yz1DJCUfcmBxeSH2/ic/Ti5sOlm1LFx8?=
 =?us-ascii?Q?FIHyoIAtv2ycM+B12JGEFnbfeTDpKg+zy7FVKSaNIiA3hRC1agKTrdx259rJ?=
 =?us-ascii?Q?+YxbJrJ7m7NFdfUrjJyzYOgqLj1HOTYv1e+YlWi6VdPf5ykpyrIa+F36yQe8?=
 =?us-ascii?Q?6JFULiugJbJASCMjT04KA40ArzzCtQbP0eJ+0UlQKgaeGNs08J8IuWXWv2Ci?=
 =?us-ascii?Q?v1/XdlVVcBPQNTyUV6eC8Y3k2t658FDJqTUocVyM0MwLzLUMF7OEsThJWw6Z?=
 =?us-ascii?Q?qrDeRbb0bGzcA2ewUkhA5epkFbuWRXravE+FZeHGfnZ5vjFFmRHJssrZUQpX?=
 =?us-ascii?Q?6KXZhagrXWJyQfne2kFo1qDaE3kUpYM+Gv2Xmhxfqhm3quAkei/Vg/uwsTTI?=
 =?us-ascii?Q?N7hMaS3ONMiwDD2cL+oE2hTKwsO+X84B0ejgAXFgDqzkgTvocwJBRTrDWZ/G?=
 =?us-ascii?Q?OqXu+JH+CF5Hu9j+G8jUSQ2YWUBcdLo1uXBsCOJT2SSyhiFyIaNeWHSasBEN?=
 =?us-ascii?Q?OufLEq9C0KRlRf9/UTuvF0bKW1QzJUl89xRVGTLJPFF00MqVz9kJgXG7zj/h?=
 =?us-ascii?Q?A3Pqwo43PRHOuRutt2k7F7Iw9tchSn8NAfzYgC5lmRh/ORG4sgaV+gwTHR65?=
 =?us-ascii?Q?UIFaohiXKEXyEm2MtHQLZl1Sglkavu8F1vkXxyVl3XLVvsvvkFIK2/WjJzcC?=
 =?us-ascii?Q?AR98X0ph2nnS0WttRu2ExVc68ZJr9e4jNlJoC85ns9C45WAHQEyC5L/YaOcD?=
 =?us-ascii?Q?1oB5GPvcrxzNhOyIdaAjVBOmVtb/3ouO/OyN5FSSOsdElbx3HFW9ndSudpnS?=
 =?us-ascii?Q?iRdPk9XE9cvr8yi0FjYDqYSdRfDTM3gzTmctCniweFQMvNDH9C50sqVi/1JV?=
 =?us-ascii?Q?sNYAhukfOFnCO9OTqE4qBAyf9zn0aqJ+uYYgArQq88+YAaq59FlePeqwK9JW?=
 =?us-ascii?Q?6DLL68qs41+hgW38+h7vgYiNhEw7KBJqr4/QeXc1RdDG5gEwfBAI1QxcRaeC?=
 =?us-ascii?Q?OnXIVRP1Zs9niWRO6PBUGg7lD4xuE+zxegz49GHUpjjOXuGQUX6y20lGqXr4?=
 =?us-ascii?Q?STklN2j+ZsJD6IJVht/QuvUIXmh3xUQi2uxf4jNt3zToUgEU/MGgpcBP3rnP?=
 =?us-ascii?Q?msGmhPw60mfY/07GAtKehDYyu2nBQqI=3D?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f43b81f-ae54-4d39-c880-08def6a9ce66
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2026 06:37:10.7271
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MZKh5j5+n33iEpdmTTKUOiQrh6B6KVPB1oGJFAZdMlhFQwNbmRYyHTVhy+fYq0pJieC/V1liMjV4S4eh4J87uhG/44VILjgfcrco2PzzG/GKygQc4zbBsLAStqan2MPv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1315

Add pinctrl bindings for StarFive JHB100 SoC System-2(sys2) pinctrl
controller.

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 .../pinctrl/starfive,jhb100-sys2-pinctrl.yaml | 166 ++++++++++++++++++
 .../pinctrl/starfive,jhb100-pinctrl.h         |  39 ++++
 2 files changed, 205 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys2-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys2-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys2-pinctrl.yaml
new file mode 100644
index 000000000000..5b9b2b8c71ae
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys2-pinctrl.yaml
@@ -0,0 +1,166 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/starfive,jhb100-sys2-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: StarFive JHB100 System-2 Pin Controller
+
+description: |
+  Pinctrl bindings for JHB100 RISC-V SoC from StarFive Technology Ltd.
+
+  The JHB100 SoC has 13 pinctrl domains - sys0, sys0h, sys1, sys2, per0, per1,
+  per2, per2pok, per3, adc0, adc1, emmc, and vga.
+  This document provides an overview of the "sys2" pinctrl domain.
+
+  The "sys2" domain has a pin controller which provides
+  - function selection for GPIO pads.
+  - GPIO pad configuration.
+  - GPIO interrupt handling.
+
+  In the SYS2 Pin Controller, there are 37 multi-function GPIO_PADs. Each of
+  them can be multiplexed to different hardware blocks through function
+  selection. Each iopad has a maximum of up to 4 functions - 0, 1, 2, and 3.
+  Function 0 is the default function which is the GPIO function.
+  Function 1, 2, and 3 are the alternate functions or peripheral signals that
+  can be routed to the iopad. The function selection can be carried out by
+  writing the function number to the iopad function select register.
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
+      - const: starfive,jhb100-sys2-pinctrl
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
+            enum: [ gpio, host0_port80, host1_port80, jtag, smbalert, uart ]
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
+        pinctrl_sys2: pinctrl@13082000 {
+            compatible = "starfive,jhb100-sys2-pinctrl";
+            reg = <0x0 0x13082000 0x0 0x1000>;
+            interrupts = <59>;
+            interrupt-controller;
+            #interrupt-cells = <3>;
+            gpio-controller;
+            #gpio-cells = <3>;
+            gpio-ranges = <&pinctrl_sys2 0 0 0 32>,
+                          <&pinctrl_sys2 1 0 32 5>;
+        };
+    };
diff --git a/include/dt-bindings/pinctrl/starfive,jhb100-pinctrl.h b/include/dt-bindings/pinctrl/starfive,jhb100-pinctrl.h
index 30704a5a3418..e701c30913ce 100644
--- a/include/dt-bindings/pinctrl/starfive,jhb100-pinctrl.h
+++ b/include/dt-bindings/pinctrl/starfive,jhb100-pinctrl.h
@@ -38,4 +38,43 @@
 #define PADNUM_SYS1_GPIO_A22				6
 #define PADNUM_SYS1_GPIO_A23				7
 
+/* sys2 pad numbers */
+#define PADNUM_SYS2_GPIO_A24				0
+#define PADNUM_SYS2_GPIO_A25				1
+#define PADNUM_SYS2_GPIO_A26				2
+#define PADNUM_SYS2_GPIO_A27				3
+#define PADNUM_SYS2_GPIO_A28				4
+#define PADNUM_SYS2_GPIO_A29				5
+#define PADNUM_SYS2_GPIO_A30				6
+#define PADNUM_SYS2_GPIO_A31				7
+#define PADNUM_SYS2_GPIO_A32				8
+#define PADNUM_SYS2_GPIO_A33				9
+#define PADNUM_SYS2_GPIO_A34				10
+#define PADNUM_SYS2_GPIO_A35				11
+#define PADNUM_SYS2_GPIO_A36				12
+#define PADNUM_SYS2_GPIO_A37				13
+#define PADNUM_SYS2_GPIO_A38				14
+#define PADNUM_SYS2_GPIO_A39				15
+#define PADNUM_SYS2_GPIO_A40				16
+#define PADNUM_SYS2_GPIO_A41				17
+#define PADNUM_SYS2_GPIO_A42				18
+#define PADNUM_SYS2_GPIO_A43				19
+#define PADNUM_SYS2_GPIO_A44				20
+#define PADNUM_SYS2_GPIO_A45				21
+#define PADNUM_SYS2_GPIO_A46				22
+#define PADNUM_SYS2_GPIO_A47				23
+#define PADNUM_SYS2_GPIO_A48				24
+#define PADNUM_SYS2_GPIO_A49				25
+#define PADNUM_SYS2_GPIO_A50				26
+#define PADNUM_SYS2_GPIO_A51				27
+#define PADNUM_SYS2_GPIO_A52				28
+#define PADNUM_SYS2_GPIO_A53				29
+#define PADNUM_SYS2_GPIO_A54				30
+#define PADNUM_SYS2_GPIO_A55				31
+#define PADNUM_SYS2_GPIO_A56				32
+#define PADNUM_SYS2_GPIO_A57				33
+#define PADNUM_SYS2_GPIO_A58				34
+#define PADNUM_SYS2_GPIO_A59				35
+#define PADNUM_SYS2_GPIO_A60				36
+
 #endif
-- 
2.25.1

