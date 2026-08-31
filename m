Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2097.outbound.protection.partner.outlook.cn [139.219.146.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EE313FB067;
	Mon, 31 Aug 2026 11:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.97
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788176167; cv=fail; b=RDfsFjniP37UkeCSsMVj/p9A6mgo3mRVIkVcSVmjmtC0oSxlnkD+7iQSehUtzyCi4GUN+2o0BwW4wlEUx2cuXvOYVH0Q/tZBzjyCNo/bprzLemBOZoTJLDphsxEby6D39R1BAMSGraCPoqkqXKXn5m+fpRC0paUekaCNAERJ4gI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788176167; c=relaxed/simple;
	bh=kXZ2f5pczuJnNDpZt9Tq7b9IH6ZkaAeoxX1El6cTzyc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=dITCqUo13dsbMRgwg0CpUGSAdlXiJOEQUN5bZZJU2et7/KyWT2L4IjLlWYhHIY4FZSK0s0GCAPRkieMlaqB3WqRKBFgWDYlLm3qBlVewk+LY1/RQd3eeNpbOJPdvnWYEATuLCqllbu+Zzx/obfABhlhWdj7G0IEHnSBwULgEjGo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XvIpTPJfrgXlPfgxGUzwbvbou1QXGrudmyMHSNyUL/AN950YoYz1336twLxGPz8sZy1M0NbtXjMYmc9C8SngfMoF4dbX/7fGNS9MkHINPhKGRB+MF78qd62prpQQTKKGeeW1povCHtZrnK6mmfOCPeaYweYadeTwvI2M8d71fbjGiWX1EnqfNdcuL9eoCNRZc1IAQKeTQ76aDUJdfpz2wnZ9K8pJr2NqpRXz+Vvz/nuaI/xFXvsoK74h9F+X9NMQdNHPE7DnsiBlUMkOdz0ALzkm1Cj9gDLbhzSOJs+A2VrKEzCvKedUiT6z00kMq+U5jORetvU2Tq45Tuxp6bfeZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1uEvwou/Z3qOQAAKZk3aRFFtKOcQSeavuMiPo1MGcCk=;
 b=TtbkIj0rXjhlVDIcplY5zypG/ZV7DCDr0UJtmqIHlQqTk0UO8R/agE66NtwIt04Kog/tGxKvSayjHBR7jhGBB2bAIyUsCAxRJ+7GPRzM0Nuk8d8NumIz9YVKM+SqxJGzNXuVlR/SYT5xA5bnRqXHsouOOdV6P9IoKGcc36A3t0mzBVRDQxZOazGiq5K80zHuDP00PyG6zFb2sP2bv3L//xjTbsUXZU7iioeuJsUR02wOuO6ZjELDmfg4/cuX2wk1PhqbmR+y3cTW+2yeP5CSxAjmlcxjevNrq0uWPI4ilPMzvRbPyq0gME5HW/8BKGzaB1naTXGr1B6ZiB3jZ9L5lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1332.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:16::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Mon, 31 Aug
 2026 11:35:45 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0315.011; Mon, 31 Aug 2026 11:35:45 +0000
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
Subject: [PATCH v7 17/21] dt-bindings: pinctrl: Add starfive,jhb100-per2pok-pinctrl
Date: Mon, 31 Aug 2026 04:35:10 -0700
Message-Id: <20260831113514.66382-18-changhuang.liang@starfivetech.com>
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
X-MS-Office365-Filtering-Correlation-Id: 3da0c30a-7fca-4ff8-056d-08df0753feda
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|52116014|366016|1800799024|376014|7416014|18002099003|38350700014|22082099003|56012099006|3023799007|921020|10067099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	2/bQTjf4lUhWWkNfBLMauWjSy8bpKPr+KYQcx5wc3yhtJQysvfaH4BGjQeB4utOIg2sFQ8omI2E0A2a4mR3GoKpEuq75fNHzH5TMN/E+NY+WzLQ6LkXATg75sCuxz95EGLo2cvZQrIU8FKxH358gw7NEM6bajjfoIuajxuPb7hZPMwookGA25yC7G+uMvwFp/pntLk6jdd6kjQw4389B0vWNWo4MJFdLk0G7QUR5qAQrvKDZ3UNvJGt182e+Jh/brR/Rf9/b6LDOxJzJpWrNFHtk0c7BS0VqOYt3wWJFGeKdX+FQHvhfTfMj803eev1tgDdcr2Gxng3F3JNUnYouuJzKw3iFNLx18NoauWiIaEQZ6Cp0yTj0ArSAtVPyU4YPS+y3DdTRs8zhyKtws0Py+621f/x2tDlkuAwCACOWNZFFK69B6xAkmRKIlXI76SkdmOxzKKXbuoVFL+Jh/AMxB+fb2SwsgJulW74lG7XoaUhgnAjU+pNUfwGkFGJDDxGTYVZ66gqIFYnHUaxw9EcgkHRcGwkU8bBRE6R/8nMYeGj3n1HCnUm48B7+iRkwVSt+S6owmyJd+Ww+wCn/tvFU1Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(52116014)(366016)(1800799024)(376014)(7416014)(18002099003)(38350700014)(22082099003)(56012099006)(3023799007)(921020)(10067099003)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?EK4iKvUbihPzP09YSSA18jRqdG2eCLjKYwPUblVF32f15ZgyLJOQcS4asCgI?=
 =?us-ascii?Q?OIjGEMAuNc9LSALdfl55ayuJuGol/IjeZlOWOP82z4WxpvGnssgehToUvkSY?=
 =?us-ascii?Q?FrS+l4f2fvGgWlJQSekODjpkgpQBNnbE7/gXnDfLKel1gL2udzr24oPSuBVE?=
 =?us-ascii?Q?DP/cfjnEN0/Wtm5BuugnBwy4oXw70DXa13KlC0QNL+OwfVQHxHOAtDiqQM7z?=
 =?us-ascii?Q?/vLt5n81eoQ0nTRKloHudy4cdelx3dPb6fiWXubTZIQ7hvhi9wmbD5tsaWTt?=
 =?us-ascii?Q?YFkBjJIQ3Yetri9L80xWv8R0bXfMGWJghfPWm67K7ersRVUI0rdbKFWABLEw?=
 =?us-ascii?Q?dFdyniaE/YkR7skmuHVl2URzeCzIlXK+4MIXQquY3eXghH86ts5iZMpuFH0N?=
 =?us-ascii?Q?4ciMLmVHv9k6nZy10Sz89cYlh2rTob03j9B5vx9AVG8jJAph1IbOdrsN+GeG?=
 =?us-ascii?Q?84iz63weuLoyUrLzCSn93oYXGAhl8HMDYBrqF8a1Zogwgpr/BY2gEwHrdQz3?=
 =?us-ascii?Q?LeqhEU9x8ZVfgOO3R8U9uR1dvKWeypvdxYFgCmyJBCFu3S9fHsjS9gvmQSJT?=
 =?us-ascii?Q?e2Z1wisxb6rpYC3iSr0ZCqTx/YwTTzomKQ9FHiYeNCHDiFqeyQEFF8XapCoW?=
 =?us-ascii?Q?ApuYYFcAujtiS2dz7mQAmAssl1/C3jVwyjRH4Mijw/O0bhTMC7Jx69aB7x/n?=
 =?us-ascii?Q?yviguMd93ToIj6B1tPz4kKWLUr4GjhfwZP8C06OEKPZXwv0kJdeMALujkoPg?=
 =?us-ascii?Q?VlhNQE12KnP7CaOR89BcZpNykwYBPoHCVqGJoMOlxlw1AG3YgZYSLAqah+VK?=
 =?us-ascii?Q?bCo2wrjh06FJufjcMbyHsi+tAS1z1oUtpzxlwStRKhbygLQCEs1eQI+oXN7F?=
 =?us-ascii?Q?AzMA9oiQHcbSfmS8xqd3Tolcf6fufj0hX0JFnXLLv3J4ZQEkGgIHnmj98bG/?=
 =?us-ascii?Q?T2jSJd/RRl4Kx7cppZjDJxjPqDpXGC+nBdB1sjMuDIRZg+F6veDLjkdSWZth?=
 =?us-ascii?Q?AWUYQn1/R+Bh1rLxukr65O+xh1GvjmnP88sphRuB2rTX1/EkkcgPsRxr8kaz?=
 =?us-ascii?Q?o1CTSM0FVIzx4YnY6Iq7d8/DORCbl2tJYjq2tOK485a7YaY61Oqk1439T9Qt?=
 =?us-ascii?Q?9EC7YbGxALCYYBuz1K4uYAEkA8KEcrq72yXL1kwOmjsIVrDZysCvI6MKPwpP?=
 =?us-ascii?Q?Q+uWseL0vmAkRbj4LtTHp5ZRuQgcY1TeENsWhsSSBn1nUTZmedqdkSdHKQBb?=
 =?us-ascii?Q?iTEtFUMLcobZoPyAmwx7wHuoSiC85/HZ7TJqU2hIZOJtO6VDenrhiQbeUEWj?=
 =?us-ascii?Q?HA4+zpFVUIMxscz6IL5OKRuFq8+mnI7qibjnAO7oQQ17JKoxT3pErls/fwL0?=
 =?us-ascii?Q?+hpHWgsXGdxNEDQp9ViSNOec5WhdFGh7RmlmmIANjJBSBkv7LZhXJyTHDb+2?=
 =?us-ascii?Q?tqIYz5AtmJYBeYAzR4VhTLnfmHmAIe8HHjcKB6ZiV5X/E3w/2zv0YP3UMCIx?=
 =?us-ascii?Q?+dtZ4uUEuYVaKLWanDicqPbJEVNOJIHgAm3WnuOyRpM+B34R7n8oUm9d/L+r?=
 =?us-ascii?Q?GWIxqTmL8pk64zCKfdw2BkMPAORre7L+dbViZiYOecgew7b1Z/Mv3kYv7389?=
 =?us-ascii?Q?69xc3LTeoU2jAwChOLsmxNGEXk6k0fNgMv0gqA/a7H3ORHxDqtS5l27hQhUK?=
 =?us-ascii?Q?dQny6fH0xpQf6sPNR4eaPZEsmDv+cjyD6ZsGvQRHWzaYK2/xurXAmD3jRCCe?=
 =?us-ascii?Q?tXT/jOLdAWfGQCmzsE17kPnXW6hjol7wt2Yl88XqOSBVrjkW70fv?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3da0c30a-7fca-4ff8-056d-08df0753feda
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 11:35:45.0753
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2bc9bQ5H/R5fUYcyplYL/IJqm+PT7SYzRi5ED1Pa/hv43XP1+FvsdfdFpuw9plO9yQuPDM9cMLpBIdvZN3q0YmDyqtygPy+glGg/02bOZyhTs/yRxoGIB7bA8cmNn6ZG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1332

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
index 000000000000..c3e6b01ef9bb
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
+            #interrupt-cells = <2>;
+            gpio-controller;
+            #gpio-cells = <2>;
+            gpio-ranges = <&pinctrl_per2pok 0 0 18>;
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

