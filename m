Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2128.outbound.protection.partner.outlook.cn [139.219.17.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F3723B6343;
	Thu, 10 Sep 2026 10:04:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.128
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789034698; cv=fail; b=e250YCD3EaJpsefarW0uCUb2t26/ZW/+wDuhXPFTm6IVPf7jTgtraf5VIBvSeluZrE6fcwizQX6TDyVCyv6p6DqzfLWmRCuWZYnhiDIqRiBpEF24vZOODNRgP/i5zG/lY9FJTsyETK2Q/efdybwlyTzgGl923aNCPqj9pGOT72E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789034698; c=relaxed/simple;
	bh=j/RO6f5ixOq29+zCF565lZXZzXNEVjA+pgCqgj5+yho=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=lVqVLWOSq5MPW65n3mQhpW5iNxqzqv4EZjIcfFKI+fjl2yEv08pgd5yF4M7fBM5f2+oWQTv2nXjOMfPRMTxh0hOtcP6MiIA5SyaMbt3KeCFYgSK9TpTUdZYJ7riNTIZEsIj0JhgxzBz3TKsF+DGo/iaa6CbGfsBUxnpAqNJcnzA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vfb7LFsRi3s2xJt03zJM74X/hF2LFUHrUvkfUuu7wj5L6fMGpM8LRuBBkB796bNRsjPrX3d+k5vDFAjwAnihhpyh3ATf2q19pN07eeNuvUhQbhPtUXtAvRw5hvCTUddlmH04jC46CnB5Q+0MDnXdgmMxWTgTcPXdN+5i7n8rbH51AK6p4Y8MgWSM9TaPp+dDNT71/MHIFwnFaaBkszRQHh8ZJIMmJZJULGWdO71LSPuqdn9CfhRNJy/Imh3KB1pmsWyT1slIgAVXedBHFqx5ed0+8b59OO4ZMsrQAWesT4+WdZDPX2LDX/FSJ09m0iC+KKbbkmKGYI0izGFiqbyIrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T5UUQcVTxTvjqxIxUr++9BDySDkmzrXODpYkitrD3XU=;
 b=Brpnpdmq5nv1wN27SqB4dkwtFqqsyrHkQP6X619x9DKQW0fK9ZVa8zGk9A7T5N7fR48vqEXs4CQFE1rr4rlQKhKmcHrrybbsYyNhZe6ib2XVWAYn34MhfImIpQf4CNo5ZA5Yn55jB0qHZn+1voPDcCahiRQtvFmqmlcaZig00cZZzI9q9jFnmMeWmKIbmtL8mN6fIn2HL6iHO5mu2qIZILxhmzBtJx4zDWG3OP1wdVovq3vnI7sQ7Iuw11eiWWB5YD4Hl10NVFIhla/SGLAi90WkvO8IIGgco0wDxB4UvDQpnlWr79DnDL98inmfr2klJ0jb3jCvmyVIaH0bOmyPrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1233.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:13::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Thu, 10 Sep
 2026 10:04:20 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0339.017; Thu, 10 Sep 2026 10:04:20 +0000
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
Subject: [PATCH v8 09/22] dt-bindings: pinctrl: Add starfive,jhb100-sys2-pinctrl
Date: Thu, 10 Sep 2026 03:03:44 -0700
Message-Id: <20260910100357.130134-10-changhuang.liang@starfivetech.com>
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
X-MS-Office365-Filtering-Correlation-Id: 9abfe1d3-7faa-4d3f-7cbd-08df0f22e104
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|7416014|376014|23010399003|6133799003|56012099006|3023799007|10067099003|22082099003|18002099003|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	RzCpUOosFWMs2hIyLbWNdHQuxVhHHAXa9rihDkog5Ekv+vGLWX265Yw3z/cVmuu12VFgSH/9yNKwLzyloRb+wijJyMxIrUzHCPOZQUniQJ75wZFPom2ri6GYopk+fofP8kotRLtDG5abefvBT4CPyR/qBKJV+YsjXqLYaQ+wtXRHkRbI36W7chXNK6S60nz1cC9OXy5Oel8d6dENv55MftU9sN8tr9yT0G5t7xaKQnb7aAA+T6PSIqEf8HoDutcbaznDhzVjPE7l8gd4YHn4AsaX//9pkfjuqDfmnDHnbAb90CTCfTfqMEb7sWMz6EoGJN7J4jtC7IQkF09JUJbvEGFp3vRX06jPcQ+F/28/8IIPNu8//4FI0S4zeLddeJfa+JRQjTWwcRigSq/gZdUpP1j425h1Csf7CT5tu6g9l4aKeDM//EJm7pC9X27N6NNDblmTccx5+YKoyzkGSXi4IFIl7T0eEeno6/CfRJQvtTlKhrPkynZJvzKAS9Hy+HeT2mGtKBYVP8wPicegi/teBy+NED1BpmosoDVyZIOR5LuXfbmXLDX7wgig8+o0jez/9PFkZvswKT/BGPFGqXaa1Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(7416014)(376014)(23010399003)(6133799003)(56012099006)(3023799007)(10067099003)(22082099003)(18002099003)(38350700014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?wAjb2dnQUA4fO4WXsHIv4D3qA7P0iA+4RjhCpewrKR9LZJpC816LUhH99ChM?=
 =?us-ascii?Q?4mB18GOa+CfZ1lzK+iPHuhninj8T4az6AjBtTudlaZlHAySn9pyTTbdjmLx2?=
 =?us-ascii?Q?W3hbisQUiMI9lyQLCv5s02e5Sksn7W9PM9ukbrIUHoT+KLIB1OTo/fRO7Rul?=
 =?us-ascii?Q?Z7rWoGMCzUP0CLFBdKnpCKsIr3sGwjizQdaHOxRsXf3q3B2ETePAPaEgzdW4?=
 =?us-ascii?Q?3c9F9gBog0o7F1qnKG/dUlgC028ViGuajUnZhpHAG676ovVQ2Qu4cEmkws6i?=
 =?us-ascii?Q?b4wAomIGj8fkWzVLc0+c0AZ2p9LxLsv8XaizljL7EVQVZXPf20yFgk/QWg2X?=
 =?us-ascii?Q?j1kNN20BoJuoyOoD/k6TWKTWtaWDSqUHyx/OVj8FG/471ziJbcejKNt+ii4l?=
 =?us-ascii?Q?hyee8oWGQERt7y21zQQRUlqabQ04ub4NhSRruQr/KHb2pox17xrbXoAPXEk1?=
 =?us-ascii?Q?GI/0Y/NPnT2OPklOp/485WG75vkxMB863gmmsZcWE187G6+5NrpUxOsVLW8M?=
 =?us-ascii?Q?u0uo9FaNNs3ZZCn+lDfz88tn1mnShND3C8cUuZbXyMUP5dajixNXcFOgXuVh?=
 =?us-ascii?Q?q+yH59SaVMeWC+buUjQPzRDB7jfdFDxHbGgkXefM96bwgvCBjRzfF93HdH2t?=
 =?us-ascii?Q?Hr5Y+PNVUssXshJ6rfa7Iflt0xml2Q7rRHgUrAaTkpgxkGRZlkOKPlzAFkAW?=
 =?us-ascii?Q?ml9CxxlFQs+WsHITnEITRSsDHt1XNBU3nDsEvY9gw91bGd8OPjN0149pO8eX?=
 =?us-ascii?Q?jyy4w5Pc3eFEY545WKbCvBhShh1ii8FCNAmjVPjNe3H9Llvh4iMLGLa80W84?=
 =?us-ascii?Q?ayiE91qzuci/CnI4xeECA52SMWzh2YPljhlkY80jASllZyCf3n9iZX0lYwhx?=
 =?us-ascii?Q?KwuH4tMVaQZD0HTpWNj2i86bqLDtsrjyCytZDD7aU7XgirqnJvKGBlTiQbB2?=
 =?us-ascii?Q?S+bpAA5xDuQG3RHc1zzf4Mu8zVHdf2SJ0G1SDGLSLMAk34VJbvzjdXGjQKYW?=
 =?us-ascii?Q?j7zX5om5RZwsRUnIuQF6st5z2vRoLuzQZid28qttYFxPHjSgJlSx+TF9ehds?=
 =?us-ascii?Q?t6yOeRn9hAAsBC+JhpAEDZzG6UeVxhRhRyWPkWH3bUgN8mdLanZiGMmkFuQT?=
 =?us-ascii?Q?76tp1K6gw9duh+8htxoWUOZxJHIp20Q0gYcLGuXa6lIPesvDdgxrkdTcCbbQ?=
 =?us-ascii?Q?3m/tZdUDJTjv+nRZS/NJRz5blcLLv1ogH0qO7Bm1L60ZhRypYo9Y4TLXuf8r?=
 =?us-ascii?Q?inuw/22FoXFPqQqtu/J2usu1UDvfBK/Boh4hB2K71ntJ1OQKuz0y2KeHK3DC?=
 =?us-ascii?Q?/OlKPmuln8bU/G4IofYtrOEgMZzT3lJp6mnHmPSX7i0fDsI1K9oOHXap6uh1?=
 =?us-ascii?Q?9C9+OloFuvLVEkqlcRbcaKaIC3vifhBn/+aatwE/tcpgmZDnNAt7f5j6P8LC?=
 =?us-ascii?Q?vQtxbPh2dGfQiaEhlzkDg48Ecwa9KJFhG+JTnx8c5oDX+Qx7LWkpOM7EdgJy?=
 =?us-ascii?Q?jJw6quRyuT+A5r5FBwCgyh6jg1M6YWy0Q0chJqv+Vlcn3IZBeIkVv8n7gwKQ?=
 =?us-ascii?Q?D7Q5rSImfku/Z80+BCFWt24abqgjLEUZj5mRAzcgO5lgIiY7wDTtE68McsB/?=
 =?us-ascii?Q?W45dt4VodY7Eg3wi3DPURiHz6qqANrKMldgs4UdGETPZW2neYw1s98BHtl9M?=
 =?us-ascii?Q?nYOehcXMD0rZrGXaszCrN0k8o3R7aY+8/7UwR1ZqdDO35zWHgyMWhPZSfWfW?=
 =?us-ascii?Q?PMdLExSK4pBREl6UTJHn39qe1LnEMLXqak3VqhGWg0GwV2kpebvu?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9abfe1d3-7faa-4d3f-7cbd-08df0f22e104
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 10:04:18.9436
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g8Y7nw/bamc9M6Ki1OAtdmavxKv7R72/ECv2W3qpI9iIzDUm4LI443HPzeUK8KvJ+ZVaQmjMy5E2j77Z8GXFHOUkW8VQzt0JJFbwQuE0xC2zC94eUUXI1rEIJlA0z7+j
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1233

Add pinctrl bindings for StarFive JHB100 SoC System-2(sys2) pinctrl
controller.

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 .../pinctrl/starfive,jhb100-sys2-pinctrl.yaml | 165 ++++++++++++++++++
 1 file changed, 165 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys2-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys2-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys2-pinctrl.yaml
new file mode 100644
index 000000000000..e2d18e0d4916
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys2-pinctrl.yaml
@@ -0,0 +1,165 @@
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
+            #interrupt-cells = <2>;
+            gpio-controller;
+            #gpio-cells = <2>;
+            gpio-ranges = <&pinctrl_sys2 0 0 37>;
+        };
+    };
-- 
2.25.1

