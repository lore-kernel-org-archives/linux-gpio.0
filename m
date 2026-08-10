Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2112.outbound.protection.partner.outlook.cn [139.219.17.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F019394780;
	Mon, 10 Aug 2026 06:37:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786343851; cv=fail; b=dbYffF10fCKJ+u/Hf+L9Phqhu6nHOOBPsLFpZMQMOAlGbtEfzDqozXLOqZVdbhpGeIxRffM6kBJ9DenBOdQMmnQns2777RJ21mpzVC+IQQgxzGpqR7cmWa9CwY4pbe8jCCSZsMcQeIVLzH+PPP9XPAi6UEHFBrXX4I49T4KpQ0I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786343851; c=relaxed/simple;
	bh=0/ABGnUuiAeAWzqILdGHYkTDoeFdB7fNiu2RKiRR5mY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=DQ1SXspsy/JdkwjoXA6k+aMUmsFdM9zMzx85AIxm6vJNJrrh32mTJ31jQZNI6GWw6hUN6nT7+c+dMAdcc0iiZehHsiuJGSUzFYi1pDwmavi1lMA/6pUdzhWv8EOvhxShFEMmUNtzAi/NWDKG+mblrezU/M7svM23bnK34aysxPI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OhmJGyRJKgvy47e3iDhUSX4YnFKzk+GR5vdr887fFr2HgQjRpDAXXAkppxNu76B096Z5pNjlg++h0drt2vltRcTwD8K1FRdY6iULfXLZXpbp05JDEczRAciKOpJWKAGdR6N2LZ2wwYOj28nN/xBwS1bbVvzX6ZIWFpiSOf4DRZb8QiKX9o7ZLDWIeq5T1wv2ANWFFyZQI5xXdtmcLaGWtaUjOfPwCp/UTSoTVyeSz4a5CtUfNm/189NA9Z3+R+q9CunCIBYi/HI4kae5zZmIB3nU07c1ELIEZ2Ztk9v3see1aEbEYsK9GLsQjDrJgvhOKqXEtgVpIgXof1bAqHRJlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/X9l2inH+xpjQyhTAAErSR22gbLH2acqhPL1QXa2qIM=;
 b=TcLbNHZ45e9vaRLeSEDnz+eZqKH5QN0QetxnjA0exj5gGk9Pp+vKGlY/ZDNPRdWq79eOka3flk4QCa7tc9bUPqn0v02GHoAgHLYSn7aIvZpkUFxTgZXzS9Uu1D41GF/fVi9QKdUAoeGoDWBddr3bE4rIymaUNmfiwIPOg1RUUpNaxNat8eYsUMBt324NCTx2O24hE7Q5a4TR2ambiOU/xCVj2oiemYAQW8luQ2Ar1EH80cUJnujcqTDwJJ8/QGf7J8Ir1KmjtnzYxJQoGjYjupBRKP+gW41qHieqceb5Fj1ViEFpSWhOzgvo9kX7LVk2uZ3GPQwjlplCKvEDFrY4xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1315.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:15::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Mon, 10 Aug
 2026 06:37:05 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0292.024; Mon, 10 Aug 2026 06:37:05 +0000
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
Subject: [PATCH v5 05/21] dt-bindings: pinctrl: Add starfive,jhb100-sys0h-pinctrl
Date: Sun,  9 Aug 2026 23:36:34 -0700
Message-Id: <20260810063650.239303-6-changhuang.liang@starfivetech.com>
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
X-MS-Office365-Filtering-Correlation-Id: ab52bd70-de7a-488f-616a-08def6a9cafc
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|52116014|366016|7416014|56012099006|10067099003|6133799003|3023799007|18002099003|22082099003|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	kUMmZ3jy3I2HzmYlVaaxdgjBh88fN5yfBiUUhPCwRDoR/qz+6Js0Q72d9ppSKsBjZgWbndrjnGTLU2K1Lj2rc2ln56lNZwiWLNrGI0a9Ggf2zB+hInQJ9jzb/I3pKRYGdNkcnLnI6ceqKMC6krXdTUM9Gh/NBliSjf3J/R6+yJ4ywNGnoCXi3tAKpPw7nPFZMMRp47gUHBeFHAOMrEG/zjLQUxjPAdY1bTODpp+lENAbDWbyouf0bop+HMg/ChqpATLvgeHLkhNM1/Yk93TkSbpI4alNjk8yqP4v4XlsXQQa5vQlhn14yFTy6QzOcKqXRskOgOfbexcaFwJyqsgXZO7Z+T/XkoHD+8Z8sAjRogiMYVwHiyTfWZwP+eadJCu5bvHV25uvmunufJ9Of5L30rPuWEGICC5Qt7ysntAsgpNCTgZLvuWVDQFoivCEnKgqQ0htD9fR+GrRW/kAN0uYJRlB7J5RYvlc/tQdXQ3cpqAVUGtOwrrpTtFsKMvelehWVTSA3dxOCHnDt70P7LHaBLz0/2+En24vR2S8KX7SOHJ8aCEMLt4Fj9eqN7YWoRK9bT1e2JJinz1Pg8Ihfiln8A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(52116014)(366016)(7416014)(56012099006)(10067099003)(6133799003)(3023799007)(18002099003)(22082099003)(38350700014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ldBJQAwH5Ydv7uigBxIoCYcGgqkUCenEUZ177ZekMpkK/Tu/UaUXLzL+9gBw?=
 =?us-ascii?Q?horJ8mKMbXhh13pjABQBUQKXMGBypbzjpLjeiexo0QNcAsKXcfBl+x459a38?=
 =?us-ascii?Q?ZFT23l+QoxApZitpdLtWgyan1iaTBAwD3a7Pw14bYgb8VacDUNOSREwd3mq/?=
 =?us-ascii?Q?0+OpjtP5XaP0hbD3UdPiJe9MArgb8VFRCrlsaPuIDDdJ7o2O1fAWkWB9mlpx?=
 =?us-ascii?Q?0ckWdFpvR93kWluiBdTJ2fREpu33eBs0SKmEFGpZwR835DBBkCKKJl83FOBg?=
 =?us-ascii?Q?/TXdnkAZgVli+rPaZuZzDWrN1jqsgHPnWI1qdauGs8VIPyZ+A8ihXloa+d0B?=
 =?us-ascii?Q?q8I4/rnqFnSOlkRfjvDOXz8uuXtScFpCsjmpQfH0xiKhviLAVVN6cA70nVhv?=
 =?us-ascii?Q?gdum2loHkbWW1+JWfv3d4IfL2K8dnNnXyNdY4LtkWC3p3C9JcGrW44t6c5me?=
 =?us-ascii?Q?PX3g2pQNg661UHgvjoPF0tj0DXi5zH2R44Y9A/ymn3pfv/Bg4Z+o02rJgflB?=
 =?us-ascii?Q?tCb919FMbXadF9dSGSjV7qkM+H5R/zNJ2bnvn/Ejr2Jv2PmeNuWsmP5wwTvH?=
 =?us-ascii?Q?QpJapHS7BG9DPKF6xuUNaLTYqCW3QX6W9pufq+HIGSsMgfVIEwa+RSZ7FJAs?=
 =?us-ascii?Q?xa3RFhRCRzm6KKoKLBcS6pLsk39v+ZI+JbJbYvhaC8AGF36tVe53JjhKYkIk?=
 =?us-ascii?Q?9wLvpqylPm3jTEuaWw7SWIUotHC11ZbCWVt9RxPohdehQZpCMIZ3lptfZuSa?=
 =?us-ascii?Q?SyNPHilBL/Szub/QNTzurZqApOFdVNm+x4LjG61hZhlOQMjMaIWfH0p240Rj?=
 =?us-ascii?Q?oiTWQ5RgUxJEFbUO0DXf780IxsImfaitGWDV586G+FzQ0+6cSW9LVqE6zPys?=
 =?us-ascii?Q?AhZOyRCpoCMjpslxIc+xTKEb6uHeyonfP/4vrD/0plWVN9mmPwGGz7QoXNNl?=
 =?us-ascii?Q?JxMY6VSRj5BJLUezWmxfM9Pr7TGud73sWEqx5AHZyC/EwRriRQ/0Y0zBAQ2h?=
 =?us-ascii?Q?oGJNZQ9dcmDK/HUlH6NUm4T86WWQRbPxQPIhbDYblTmHErwvCmE+KNwXlxBc?=
 =?us-ascii?Q?yE4LEMopkdm/PBGGwphM1yExPrJ0sQ+W/MWwDfdtOAo/Em1/LXdhX9zM2mGf?=
 =?us-ascii?Q?5ouy4xCtvuOrMMSvlV1J7l4K7DYNp1imMM8UYOpKuAT3rHQKXt9YEQLuw3T7?=
 =?us-ascii?Q?QCLBRhEymeLXWpq9rIUW3alkL+pDYvNcVRO4CmGmUi3hfTnOjH24KtybbDc4?=
 =?us-ascii?Q?DqQ2L9aUg2cSZBnkujprIu3NsIrwMc8siZF8gXX/0aUl6h1ka/C15zCUGiXD?=
 =?us-ascii?Q?qUhzhX9jY6/u+jf6bapxbHmWV5xt+2p2N4FZQndCJhbXS9faRZE8o5By72/T?=
 =?us-ascii?Q?65abDILwzx8kXMToxednKHDsx140U4wrPlwa3KZO7OrEWns3tisFwFHi9Oet?=
 =?us-ascii?Q?FnRD+SW35K2YTkJ2TpFsP5NEVTeh/43zZWmR2N+lMHVrtwHUmMP2D1/aoaQG?=
 =?us-ascii?Q?v2bz9n9e1lhxuXzY2SvudNLMD5Cca6U5DbQAULpz8d+bzJ2FZKgwxpybmmP/?=
 =?us-ascii?Q?WCxANE3R3RBJ96OfumQJU8+8GADC26etMzF4y7O7ygFzUi23UGzQhzjbtsXk?=
 =?us-ascii?Q?I3SEU9p3NUvmPBGJSxsFEUcpzM3BndXhVwZd/rLyDDnZBMjBPZpXUJR3WShs?=
 =?us-ascii?Q?F42yObVGMuwABWqNYJt6QB5tHWP4JXNfbe5RmjMqQZ+Cz7pH6D1h5ESTB5g9?=
 =?us-ascii?Q?Z2AU5bOAeElGzA1P3hMvd9RDk2SJ0FlRv9hVIbQAVz/JKdAV/HSO?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab52bd70-de7a-488f-616a-08def6a9cafc
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2026 06:37:05.0008
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u55k/k+2SvBoVDaCYbmjG+m4rhF4BBAMJ18CiiXHBQ221JnhPfzfoFeVtTyE4rXBCDZSYn1h9HZ2QVx2MBPWwEcYq9IvRaUXGnk1CT3KkfRZhbO/m6YqIGglXe+QWp3z
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1315

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
index 000000000000..92b82eb285d5
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
+            #interrupt-cells = <3>;
+            gpio-controller;
+            #gpio-cells = <3>;
+            gpio-ranges = <&pinctrl_sys0h 0 0 0 12>;
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

