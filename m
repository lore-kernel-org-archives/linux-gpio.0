Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2135.outbound.protection.partner.outlook.cn [139.219.146.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E5AC24679C;
	Sat, 29 Aug 2026 04:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.135
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787977994; cv=fail; b=f3XRD7Q/txgD0XuiTGqNCzDQnzA2WEWU3RTlR6QfMmmzfFqp6c8YdO8Ijw2sApvAuVgSDX1eOsh+aFD3BsGmtAfjjks7S4YkWxwLE7ySM792UTDCwjh1zywm3qCNlcC8qm37KNItmzWNpgSDG3WzeUweF0OUL0hlZH19wqRDIZI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787977994; c=relaxed/simple;
	bh=DP3MK67NYb8JJQ7CZh6uOb//fqzQSF9SJ4RZ5PkUdJ4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=qo3XGb2AgNmRC3ngIyWNW89bhb3yjgP8WMCGwdfBNi8h3LYISLwK2Cj6lj8Fmtd2pokF6omVf60hVDD/+DdfFeKYQwG3uu/LdpX7JjvAQXlarGIz68JejmRQ0fkOJTpX4KHYEk21AX7SfkLE+JmlEh4c7FjIDDNqtW8zqFSlGQs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.135
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WBKoMMeaP36v3cEhRH3EDHqx3pxHTZs30vS1sbsf04ocaYBnGA7jizugQJc9dzE0O5dout1dB3Qi33ADWffPWueuhQ6L7LAncAq/U8nv7PQTxyngmn/2Mfq8BlbGJxHSUrpcZ1+TcHX3hatWpzxthTkayQ79EUA7O5PQkmpeeoWjlxTvUWrGJqxwRzUr1dsIRPe7QlXFinOorZGP6Q8Bbo+KCamFTw0WWDaQ0Cb9KvbLAGJ0JvpKyjPJxtplirfsYmhN8gdEgRx2YIAiJTq8NhgxwxHkoep1rRfGp8QFAdP+nv/QYPDQdnykrbwqN02x1Rw3jJyXXq31vGZ8HwQKew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mm06+Z+G61D0q/tyao7koX2YCkdfaWI2Kl7I+FUMtbY=;
 b=cFWs+FF81ANc+MtGMoiVP6Y+s+kZ/r8/qkCSvH5NcjCJ7H6EyfBKgQhgtGuc+CsWw2mhlK6gS7DwWDLJBIPfZmy8JKcpB0cGzA4/rmrxgoFSwzDN1yo8yJReLs5AWhnkR+Zyp0NAs8ufU95jo1GQt+zQl8EIaZTNX7JoVaxBAs5fupaYLNK8SMcKWx2p67s4ydPSxemFUtE2L6h80pchNQZqBlyWM4O5xpzlRmeiim9XWBIqo/5CKnhZCdYWkbEhmGsIFeugXRuoefjvckQPDRVieOcokrBYekTA4pQjcvh347Bn556E88PAceSVNSK5mkiGE8bxBFvGfJ97wRR2bA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1153.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:13::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.19; Sat, 29 Aug
 2026 02:57:54 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0315.011; Sat, 29 Aug 2026 02:57:54 +0000
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
Subject: [PATCH v6 15/21] dt-bindings: pinctrl: Add starfive,jhb100-per2-pinctrl
Date: Fri, 28 Aug 2026 19:57:14 -0700
Message-Id: <20260829025720.23915-16-changhuang.liang@starfivetech.com>
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
X-MS-Office365-Filtering-Correlation-Id: 9004e4f4-4cdd-484a-1817-08df0579524e
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|7416014|376014|52116014|3023799007|18002099003|22082099003|56012099006|6133799003|10067099003|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	phMQwKSVAxA6dA5JZvAB7t+7UC6EMk1KOWzEwSZviu8+R5QaMwJHAyYiPX+/58ZdkPK/wBy0M7LnAlQukp0YFYk/LiAve/ELKPLUlihS8NSOWbdHk9/qq3XtAhZu7mQ4+IX+uGceFDUfKE85S/OkRur3grXtHICljvEl+eFsSZviP++wBuIrnSVLrhFi0WGc7SoGILPaFtpMTHQOS0db80qWYOPCKZiFqkfQ6JOZm3siOp9MYEWKYW0eFZ793r/dnL4neWhM9kgFGXTEiCF0qa7qw3GmK3sYhZ2lMoz8d3UIedxcAZZE0GFc86snuf3Nj1jtsUHc4pYsDQHGCvfdPeMnzJ6T5mwTA6oqpil8NrU5gntmfXI8fpLWWDPM0x5VdNk2P1CpGJDQC/x6PqAUudKsOpzzTgr4lZPIHuBy2PyvWqGB7/j3THnhYTp9h4od6zDlO7tzWFdCYE3iSCXlEmGU0Ybr1HiEULP0NVRK70cQrXeBH+kKBBnizvzlXkH5CWwB9ysAWbiykmIFr3fdAsyNFWTv24cnhd+Pda3RP7h14jJ9/x3aAQoYhh/BOYUu1TMUzLYS70DO0yFOSYfzqQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(7416014)(376014)(52116014)(3023799007)(18002099003)(22082099003)(56012099006)(6133799003)(10067099003)(921020)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?EcTXSAggA+X+DUzxPCiuGvSAzIiqhz+QMof+kvVteA7xuRpCq0kJn2UAvXCl?=
 =?us-ascii?Q?wLroXB95/n5kBjaPf1+da6uvrpmcLe9yOL5Trg73qWyZfE4qXSPdvLL5bcXt?=
 =?us-ascii?Q?kPlXWGqf5vtGrtThGsQ0nFLcbEYvzth5lxaJtUOHAaeZ1EsUWDsJyE8117VS?=
 =?us-ascii?Q?uvmsXXfolU5c2n4pTuJ4MpP3CyHGqljpnwk3xM2ClI/muhdUtcmxiLFFGKDu?=
 =?us-ascii?Q?hLzIfl4xyZj9xTqeuUfF9Es9pd6D3MrHYATAw8YdARwA6S4bmbg69kZGN0yt?=
 =?us-ascii?Q?yWjKYQmlJS/9h1slhOL++9jtQpNisGD3K+FKgS37/P+d3Ui6pmpOB9Ah7Jgs?=
 =?us-ascii?Q?nGsJZ//UfRgm4XSdNh0dz4q27ika5s5CMb/xDmHaleuW+FgwfUuoYpG0Ju1D?=
 =?us-ascii?Q?4cpFP7mG2YTLvq7XVWkool2TH3Mreh7O20TIZ6fYzPAKfiwOKuRUr9OcMhcX?=
 =?us-ascii?Q?KBq29yAZi21W2MdI6DiRu4B0/5YC4Rn2a9tT6eEOZiRNSb/KjMJq4Wy12Bv6?=
 =?us-ascii?Q?b+3f/lpz2SlN9eTnKlLqj6gYF5RcMIaKVVBHD+1m6zbjqg0CS2suCHKRnGER?=
 =?us-ascii?Q?bfbEsqzW7tutWtL2VDn7BdMpp/BjwkhJneHEKe8hAsgKmKgaAuRcV1e68KOc?=
 =?us-ascii?Q?YgKwbuTqETsho1aRohtSLd6Y+ShUxjdqcnVs4SQ+NiMasLqDZ2H/i5A1/RIE?=
 =?us-ascii?Q?cnGXPQo2UUq8Sdfh0KWZvGNo+4xfFnwkZq/IudnoMavQGLz1kls3Ivvp8dhJ?=
 =?us-ascii?Q?9s6rodssamcAGxPpLjd5p7mV1JAKTvAyxJ07qem7cMLhDuKHKdJLQS5QqY6o?=
 =?us-ascii?Q?lKDq7fhDQvKXizMZUSbi2vGLg00CrCA0ZOZtVOOJDNhyE6Bkq12q7jLZACup?=
 =?us-ascii?Q?D1VUosFXKGa0nHSgy8l1A5VlF70zIrzKd1uy2tRwsL5DC7tS2NS/K/0rHU+C?=
 =?us-ascii?Q?8r6cfQNRiDp4C3oUyMxCRBqrg7kfu7FSZkW8yAWxKU5AI7zlABNLqJSuHyef?=
 =?us-ascii?Q?xXo+pmVfnYpXLXYfpm8LjoITOcocSTJDsMQ/KckzZvxWN5oXFTk4uSYd8+fo?=
 =?us-ascii?Q?e01WZDLnNZ/Sn5Hi6fQgHZGe9s2Uh+XsyABMJ7P0X0StMp0UOWuytwjx7Rwn?=
 =?us-ascii?Q?DOWhfBzZYDBwa/T/apTvfBCp8WaqS68ZFIkNlcsMM2cOIY4pHhz88ldYXKYh?=
 =?us-ascii?Q?49jRvRUpXyVYQVTcrb/8qnSS41ykIcFZjR7sRN5ut3QRFdskcbSTMJ/dXzXT?=
 =?us-ascii?Q?SokhddGlcep7JSR7Mb3UFpleLWhMqHRqgVT3ijkUks7YTuJZ/OPDeFmEckgt?=
 =?us-ascii?Q?GEW8iov31xLpobyMCRvD2Uyi1E9N98y+8dwoVc9OLTO58RIXREVGFAm45E4G?=
 =?us-ascii?Q?TEZJsg3brgajdJvA1/jKf9Ut5D0z0qAkJ6t9WXDmrSqWTDd9f7tMrGO/sYBt?=
 =?us-ascii?Q?jl4E/cHvCOER8V017wvC7VKilVdowf+1SvPrBYqSukcRB4+hiMM2gwp+S11X?=
 =?us-ascii?Q?TeC9A3h9b9oy2xbsb1vpIArcAvqo8lVyGu9KcESCDw9BIHn5p2rehcQvW8pd?=
 =?us-ascii?Q?0Ln8gE+ZARcAy1n7Nf765+E0yvJ33ziXfKkARq1TCEEcmno6BkQBx2DvFeSY?=
 =?us-ascii?Q?0CaFcEIu2IsduHCTK2yxyl9wy1sjcrCl6jly6S9G83x4XVMkZhLcgXWibGg+?=
 =?us-ascii?Q?P+hBvFlDKy6KwnwzYGexVplx29DqTrRF0tFCmK7nqX8QGupgtBBMOJmpz0Mb?=
 =?us-ascii?Q?mq/9U7LfT7b+g5krA+PVHJ6vI7fmjp//z/4853IDH1/2K48U8Ca6?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9004e4f4-4cdd-484a-1817-08df0579524e
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2026 02:57:54.0870
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +gg+rPPoqHpWB5CesqUmcHBXZRzly3I786a0jQF1G05bNOPIzWXwqTljSO2fkSOGhFW0PHsFPR+x4lANHM7zEaUwLtY979vtQgJaMUTmKu7Xry73aqH3SvCCCtReBdwL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1153

Add pinctrl bindings for StarFive JHB100 SoC Peripheral-2(per2) pinctrl
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

