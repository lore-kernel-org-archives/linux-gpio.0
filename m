Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2114.outbound.protection.partner.outlook.cn [139.219.146.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC8D6363C60;
	Sat,  1 Aug 2026 08:01:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.114
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785571294; cv=fail; b=JOsICYsgBtd7WByNuRoAnFQnMr391rEH3opwP/7OH9kt/B/wL28Ik8tYcmHf0/zzjPjPELFM+vJQHJAx9ADK5Qf8i9Y/2FmPwAXNjuGIuncuDDlbpBaGLyFhIK3+jSTJmXQ4/AFMtTR+qzYmTLm/lXyVu0uV/Fz1sJGAiiVLnWg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785571294; c=relaxed/simple;
	bh=7miSfy3hCTtreSmjj14a8Z/0hNAqSLY7A3gtV3ZqpEA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=AXWZVs+najpopDir8qGPDQTgqziXs7vde2GCDpCrLq8744pPHeHKxFw+p71wv+yEwzJCiPxXFWiNEUvo2oxV1rdpGUWjA+CCTtHORxMT94MY/fqebBToN0d4dcBil5uCljv6bjMalD4y0TasqNw2dW2vJ2Uvfaxq9O8swZUfwuU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QvPhCuFzw8yuk+3Xsj+mLWhux427lPQsUrDWqAhAu7p5O334OqUDW4TbNE9q2AOho9E30udzN8TWedTqPqoJZoO9saHYSQfF7mfGD5sM7uiyAObJviRmHxFCLKqR+ueK0/DK2DMWyuc1MnQYQBl0AOeXeLOxcbfKAu7TndHe+HKUKEMWrBOfS9RXBumfqjWY9r376pzk6Ls7OOVlHbhlu2c/T8QnfC8Vgj91l8IhOL4Yzt+Q17ksBKL++bQ9S6VzSqqj2WoBSOy4Eo87YKrKDBx1lHbXn6SrkTjPtbd+oFi+nPd9ipw3C/UwQvq7hVpkLYEcJLjmUyh6j2absXoxPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7zGDiw+uK4rj7ko0f3jhQI81IvTV7dlt7XK590+Zvbc=;
 b=POQCeca/wNNb3xiULv47IYWU8sRNU4PPodqBe28aELrvumk0n+gsOUBPVfiKeyfYAa/bo6jylLDCgpbV69uPIv5Iws2bvt32hp3ds7vatSS36hB7pcITlsliyB60dj/zVTRQVP6nBR7whxYMzvN8X5Yg23KQg3O9TmG6VKXJ9gnB+wL+Vjy35513OvNGVtlMPBE9sXix4VnvVyG85brKB4Udo0w6EpOHALA2bsTh5pa+tlQC26resbrxZgmBM2xTGX7U3NTC3837h2++4k7K7nmeyAnkC4/Av/AgYw/bVQFgaJx+mE46kJEs8rf6gsQngWG7/SVKwcuAgwDLLf4/uQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1329.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:16::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.17; Sat, 1 Aug
 2026 07:27:29 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0270.015; Sat, 1 Aug 2026 07:27:29 +0000
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
Subject: [PATCH v4 07/21] dt-bindings: pinctrl: Add starfive,jhb100-sys1-pinctrl
Date: Sat,  1 Aug 2026 00:26:57 -0700
Message-Id: <20260801072711.153217-8-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260801072711.153217-1-changhuang.liang@starfivetech.com>
References: <20260801072711.153217-1-changhuang.liang@starfivetech.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: NT0PR01CA0027.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:c::20) To ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1329:EE_
X-MS-Office365-Filtering-Correlation-Id: 092fbfd5-8655-41da-3871-08deef9e57fd
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|23010399003|366016|1800799024|921020|38350700014|6133799003|56012099006|10067099003|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	Rvv+oENPBNWvFmxTzUfs0fstzwpaBHxhCH/sEY4drtrSojc1Z+tF9i8S57fVMxYchKSTgec6n6i00L2L9JkNBfKO8W4h9xeSmeqdPUo1HpBOxmHDZMgwvKUQGuklVd42DgeOwIXWZhVLs/X3JfrX2mOqeqQYAR6Np7gyJVcCYxAAdfDsT42AOa96vnKC8akq04l1d9ZkqdzX64Bn2opopMtQ17m6usMrDkHo6XoSnm2y+ArBL7SvzxZu9IIccUi0PeRNGdKDMDMCweWPcTUZn6ZcVkvAinVdwFQoav1epQkMXM/EXvtApemVbl/uBSKAVo6T/O85gykrLUgq0e/Rk6zxOmG8DagXa/AgfAZuE3arx7yeVbl5HtDqVEkdLC280GTN7y9zyzUDA4s88Vs5qU0tzP1YqyuxPI8DPI9SUMKJVNHA/+knwAF9C4SH++Ah4VjN5+0DzkzF1eGSr6b6fmtWUvk8YILuE6jH4gCOjvBEERteq4gOh3QKNAjzelldR2HYrCnYXcQb/ChnvgCjY3xfXZH1mbTEjweC/9wMMrNQqJnVLcNP/5CF0kA4MbEABnvwPvcd6TfbCg2AhgmWBQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(23010399003)(366016)(1800799024)(921020)(38350700014)(6133799003)(56012099006)(10067099003)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?uiTQXZpBV3ipczEmMnAntsenv2TY5KsFc5RXMFm891fnnqKpw754gpecfSqg?=
 =?us-ascii?Q?HOdSC5SPIhBNG8Z9UMlFNdFbYNg0au1BeMqBkwftNac2Wk0bvgR8OjzKmS3D?=
 =?us-ascii?Q?3CMyYGdY9Y3FXlzq2RRPSly8kWFHiMZHlzBfXfUJT6MyjB5ATowPlpVct9Ms?=
 =?us-ascii?Q?MyF5aGQAU8VRYOLjZw5T1xo+wgGAkGpUFWWH++uUI1xKhTO9mtlNfPCfHHjx?=
 =?us-ascii?Q?Vda9i2NsCVnieuup5CLNwLXbgHBsePJqwwjoxjcEvOKN2ODugOWIf/q4WatS?=
 =?us-ascii?Q?NKs6J/vlbRyX0mT/95XOqe9DxckoDxYsW1z63LgmiWDjbXZkdzHWacIwCzEg?=
 =?us-ascii?Q?pFIOvApUK3i/Gg4BP7Hx7qxeurzt4xMou+v/jdYTb35S+zbmUXODu+s3YUcz?=
 =?us-ascii?Q?GZGZ05dUtpoWq7+TnBWsFO/6M8xTsB8ht/4xc5RgVCwKeGcf0IZ42SVtyeQo?=
 =?us-ascii?Q?vhCZyhbzWfGMhPXZhQBfWAOmDaX+T3y+nxDYVbTMx+0peA/0NlBV0yqHLiMp?=
 =?us-ascii?Q?UXCUwvyj7UcPuvGtpWVYwmsoUTqHqMrQXZguvdrh1Ff9pHZcHGugVCbYefFD?=
 =?us-ascii?Q?5zwmWhDJduggUy8iYWS350mXtuuaBHiwUSUYLKD8Dv1dtb+FNPSFilfT61dv?=
 =?us-ascii?Q?Ztfmu34laxqhMxOVFWmwUYAqOg4vV4atxnvwDNlYaSdBAXAMxEHID5NLxCJC?=
 =?us-ascii?Q?ahWItAaUbHv/eyyg06bZS3aheHe7CFP4zMZKZKeGP6G7crB0YJSwJ5bGgfKF?=
 =?us-ascii?Q?Dgl/jh1YYeznzo236C0q5K4qXWYJpdhti3M70J6HBc0aUbAuvX6vPnPHaAbA?=
 =?us-ascii?Q?JxbHR+zi25hQOGIC2VDx80KboFsml+lw3x3/otq9ou80mdZgdjRKHIgbLyHE?=
 =?us-ascii?Q?UCI6sD0JkFvuPbZSQOjEmeJ0xwVMRBAWy1q8r41YpBolqn4Pzx4lr/Ugc+Zw?=
 =?us-ascii?Q?FQ08OG6Tbo9acDDNwGrIs/4+/q96eY1zjHrNMx0EjBX4UsCxjdie/4syOEcu?=
 =?us-ascii?Q?eVx9HFYI5TAlqSYe9MctWy0kGOQ62jqc9tJWS+tiM/bBYwSEBz176Kjm2eFu?=
 =?us-ascii?Q?mAilF9dPCFdLg6nRX6BQxLz3HQNrF56zrH5ux1/XvzWa/9xG/ewk5DiB9Z5O?=
 =?us-ascii?Q?H0rHB0c6Xby+N/UZhHJUx6Lj+iRvKZUqg4B7D7WNsEUt940PHJZoB8oW1/GG?=
 =?us-ascii?Q?HLnFJFvYR4AwVz0zX3Efj+rjrNwZtBD53m1d5rhKhX8g41bT7/pMT1a/7vAo?=
 =?us-ascii?Q?yy6IpKCT+JfSZpT0h8hnHkJ4ZOjKIYHq8Higg00Ddv2Q97dr2VYRg//r1G7M?=
 =?us-ascii?Q?eW1pwF6JtIBlbl4kXMt1uMMIdJKHT2deFY8u1sWhAjggKJ3tEl6CNLBWp5f/?=
 =?us-ascii?Q?uRzBrA9VCndVWl35760eApXXy3jYhuJsVtEEHsyTl/1aHPWW+xfALGfmNMlA?=
 =?us-ascii?Q?iL+nFxA62fcf1nHMsog1OvVKo/CdwhuL1k9fqr0tvy+ZvemmKUDkms+OKacV?=
 =?us-ascii?Q?QSRlm+RbGsqbc0PT9NPKPv3/gVz0sxjp1wIfSx1eWadl+q5BsAWDXgbtFv1h?=
 =?us-ascii?Q?ilafJNkkrQDS/L4QCPVYgbGM5b8Mv2iOtFOH0KuGPPuXlvKki6ySVyO8yhGl?=
 =?us-ascii?Q?3c0MsSez+v7nKSZ/f49p6msNrTk9eibArAhlduGAcvr13Z8XwwO2afUN+A95?=
 =?us-ascii?Q?ItFkrfHfVvAuXpTrKb8t9iVQiY6+CRvzVxcfu2e11ROEUB5DbsK1pb/xpUEJ?=
 =?us-ascii?Q?onyPrCo3ovRoundefOeJUM4R4JuG5uGKy4JsEFlSaRt3JDKpY6N0?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 092fbfd5-8655-41da-3871-08deef9e57fd
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2026 07:27:29.4051
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1wBH6z1q/w/pwlWzxwtVRIkh9KmndJlRgV19fC4Wz8G/CWKmcVefKNDfpXVenXUvzVSLGK9vKHNFzfN8W1dRDkgmf3eQEdyISQGVQWrf+YlcAXlVvVKA+DzSmdjdWWbI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1329

Add pinctrl bindings for StarFive JHB100 SoC System-1(sys1) pinctrl
controller.

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 .../pinctrl/starfive,jhb100-sys1-pinctrl.yaml | 164 ++++++++++++++++++
 .../pinctrl/starfive,jhb100-pinctrl.h         |  10 ++
 2 files changed, 174 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys1-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys1-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys1-pinctrl.yaml
new file mode 100644
index 000000000000..6ef209d9ea55
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
+                0: slow (half frequency)
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

