Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=139.219.17.129
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793701379;
	b=xJh/lh2WN6zLw4weibLWTESWLNC30OLnWohGEwaY2Jr8kzMiN3mTBh3XN2ue4r7iGNoe
	 R/Ew1/TB0oUWH+VbH2WCXEHbAVXrLP6HqUcc62TgJkdL03ylF8oxW2pNt1003vh53CTfl
	 1puIC33AbMoukEBwFD0KphnHRflSuPhYvytjFrUsC6EPKpDQ8AyL7sjWpezPF6nJBR9GE
	 UPs4hvIkG4GVV9IzRoYEdRF/XZBx1yVpmOMx1pDLDFCqZ4gQjl3iJPA/GMFP525MyT/t8
	 6bmkLVv0KUuLZfFSDw7KHKymS4LOstpmH9XEeNX50XA+TlHlYiT1hmqouW6f3g2eocg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793701379;
	h=DMARC-Filter:Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:Content-Transfer-Encoding:
	 Content-Type:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=cZVPigbL4RhxQy6CEu2vKnJ5YT0HuFDLfDGoHs+/bAs=;
	b=GkpWP390RQF/qWqcmoQacMAhPrw9VozoNR7N0nyQjKEaOI6mqwg9hBfoI+pgwQG06m71
	 Qek82108ClzRp6W5O5y/tPyT2u291TbCljcVQOmwnByMmRzQRuArlbQgfPzWzRNL+Tn14
	 K+CUmBSOFinXl5e6f/2n/ICGfzRvQHvAwXzhZcKMU+q6HtPEYdXiuWUAfCV5ACthrvAP/
	 B5WH2frFhcus9ARIH6OEM5iUaPs3RzBpSB2Fa5lzFx8zv+j8hE3UP3n4BOIHgyJUEIMiB
	 So2h/SlmJ5eYTYOJ1JAMFYg+d256GFgXQKUzzHpiTZY+7G4QOsjrZ4oHZsnNytwPUnQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=starfivetech.com;
	spf=pass smtp.mailfrom=starfivetech.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=139.219.17.129
Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2129.outbound.protection.partner.outlook.cn [139.219.17.129])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FD6B606A801;
	Tue,  3 Nov 2026 10:22:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8FD6B606A801
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xu3rzzOvKvb1BiMYTC2EqFI6jykLvn/hk2R7zUZdKcpqEXF5IJLlW2M55dITak6YrTxEC7oduF7gIoWrDYJDI+K+NcsmsW41DNWLnXU48e8Gb58DNfcF7w27dkY51cxa1z/XIGlOu5Tv0TlcBJWMLhhtJPf0IhWNSM43HMm20naWfbDcQNXkaWNOIRxIzBPk4/cpmP5BoRr6A1eJee3X4BFni4mehz/1500vcVfRdt/9mYYdafTnsb78C4ziLEgyrQaTaIWJ8XgTSjeQxqPoGvfpaYLCMWoEPfK1oh/KFCstLj2E0YI2iwlEAqeGW4kS3fYwB8FqBjaPrt3akMFnpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cZVPigbL4RhxQy6CEu2vKnJ5YT0HuFDLfDGoHs+/bAs=;
 b=KCmY5iVIhTEjsJzXWlOOUIdQzWyKoxJFX5fSbxjx8DfhFNQYXN2OB+d0xP08SkZ086gRzOVl8aN3vlgQSspUu5cADA193wFXLzPpkNdgLCFvQgDzQZj9tJD227OEtkqR73YsPdrPt/McUXRkOWYuFVCJF24UnKYDwaFpAtwo7Ej7zyZKFusYvPrakEOTOBfHABLrUoi1LkX8vFd/d3klqnhxmDfwISo6QmTd5xgbVIw+VxUrtETurXY4iHHoB1RPJiHK3cnDcCRWESRHWw5/F2BvscTxZCcNZ3HB+cw9/4QbQwSTzQ1NRZ811v3LdCgIHfGrDrHuikZEjqXaygi7RQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1329.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:16::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Tue, 3 Nov
 2026 10:22:46 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0569.011; Tue, 3 Nov 2026 10:22:46 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>,
	Changhuang Liang <changhuang.liang@starfivetech.com>
Subject: [PATCH v1 RESEND 1/8] dt-bindings: pinctrl: Add starfive,jhb100-adc0-pinctrl
Date: Tue,  3 Nov 2026 02:22:29 -0800
Message-Id: <20261103102236.96872-2-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261103102236.96872-1-changhuang.liang@starfivetech.com>
References: <20261103102236.96872-1-changhuang.liang@starfivetech.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BJXPR01CA0066.CHNPR01.prod.partner.outlook.cn (10.43.33.33)
 To ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn (10.2.3.102)
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1329:EE_
X-MS-Office365-Filtering-Correlation-Id: fb2def4b-37e4-4a87-d431-08df39946753
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|23010399003|6133799003|10067099003|261102123227099003|22082099003|18002099003|3023799007|38350700014|56012099006|261022075727099003|261026121527099003|261026140227099003|261021121427099003|261022105027099003|261009223027099003|261028144727099003;
X-Microsoft-Antispam-Message-Info:
	O6nUIV9KHq4/S/TcRrN5dXhWz1hRb6TStMRRI6ekr3Hwd4ZvHPk11haAZaHlfxWDLPDC62ps3TlKwXxjNhuNbR9zgStdYpKhIm3tvWi2rBH3gtj1mXZRHN6o9jHJow1l5P6NHfnJOq8m+cbcI7lKXQWGwefeByHj/u5b7ATBoB2kV0L2Sds5uZZSfaqWMDOcJWfzlgwpBmvKVo/Ult3Sv3mt9bdq9tqNS1UBExLjHJBMUDcAqDqYZV4EzFUjj98cl6seYD1gukj1UfRPyKIX11J8ApS7VZUfwM1ivnQ7GHBesmUlckpoREuMXtQtVvCCc5L9EjES2sQauRVxW02hi26BEuhJiywYqrNO5sk2eZx6+x8ORv5dSHeP4NDiota41J7ALCKdNPA9/SI7ZVqxgAzwCJg0Vo/nIqEjjBrkonlnLJZiPlZLMmvHgwRHw4NJRuH+XoPzWmmUv7a1Wz8UT7bfpnwrm45k1429pyoOpOwxrUR07DGxhPElahZLh2htdf1GWsUSjlp/p8JVuO9WcP5Z83lt/OuDNliJGuP92PyS+lYuMXtg3O0tyCPxnokv
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(23010399003)(6133799003)(10067099003)(261102123227099003)(22082099003)(18002099003)(3023799007)(38350700014)(56012099006)(261022075727099003)(261026121527099003)(261026140227099003)(261021121427099003)(261022105027099003)(261009223027099003)(261028144727099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?YJR31grVRKUbbmnVnXSO7EQnm2zWBClmIOnlhUaaZmGRyQUNvQt+uYhOlLeJ?=
 =?us-ascii?Q?kBf4kFSxraIsh/RFUE7RE8Bc8Xe2RsDK6yurLnD7XtS5J0wtJnuNfoWDCLal?=
 =?us-ascii?Q?HsQUM4YGEti8sNnvKSrspm92dsaMucFi4CkDhs7pbc38pgRdhtfuRMBSQU4s?=
 =?us-ascii?Q?5EcZL5Q3DgdJpisXLMheMmR3TR940YNrcZ0VZ6YXec9SZKhoENhlWUN0Nj4Y?=
 =?us-ascii?Q?w0HpKQY2Bwdz0lP/sKvMZoYOu5ZBBOGQFahbgWqARGehQcdhpCjYLBMi4fSI?=
 =?us-ascii?Q?p/lwvtgE7Y6BIB2XP3ItwdPhi+Fisg6z+eKX10oqFmOlwiAXFjvj20hkMjad?=
 =?us-ascii?Q?B1Zx6ydML/yfo+QVjxFFjWVvzfsCMU0t7P2aNJSxShaNV9qWrAz6bZTlok2A?=
 =?us-ascii?Q?6g29Rpt0dR0ZBV51govMDhYNikuhTIkD7aEssYcrNxbQ0N4VMZkX4I3kIMGc?=
 =?us-ascii?Q?LsR3/ufwYG2FZTod6AGmDcTBPN6ESyzHFLiSBXtCsvMynsN3wHtcfSuQR7Z6?=
 =?us-ascii?Q?m/5ZkAHLqJi9v/sHvBtkZ5HWKL/f4kEbtMj3ZkyrMqbqE/P4/XW9PP+2Y6ek?=
 =?us-ascii?Q?qUW0XaYGFhKrePKU7iMPPrNlflGckCg/TzzDU0WSSSL/14GL7H79Djv11+hA?=
 =?us-ascii?Q?vNr7IMSpxrXNkOnItHed3SyWXApDbpjBeR2EgQcwTr2AKZwCGnNir2TOxReV?=
 =?us-ascii?Q?DpYqCpEa2eLBT4Jz7jHX0wdG+Oe4l9c/iwk9Hg06/nFlAbc0/USk5MZIxvmG?=
 =?us-ascii?Q?q+u8E8oqOWaQiRFvzNR8wwpmrgjxGv6VNC+94aVxefAjzpyC5iBAvRIhSXon?=
 =?us-ascii?Q?23bx1Gaww8QenkfP+/i7THVI2Pp5HMdqKJHf4eabIe211SFOnnnK61phlkzh?=
 =?us-ascii?Q?f73HixbpkY0c9J3piSkrzJMk0Cg6zkFKasW1gUGUeJILRmSaOrAFdW+Wic2U?=
 =?us-ascii?Q?yU79rhL8A9J9BPviIl4CsSn45U9QRnokuXnX4NXnUZcLyxqajUz1bV5XML3i?=
 =?us-ascii?Q?XOSBYovle+FvVRPNk9PJjNo8FJzj7ey7SSn5RwZWXNNZroYn6nuBRIPZibG1?=
 =?us-ascii?Q?cnzPWpx1zhJVVVUYa0NJShMMLUXVLUMGJfQFSAzUcJIyVYukdOXENSNTVuBK?=
 =?us-ascii?Q?cXoBa1IqZ+eHkZq1tnx5LQXnCrkNx7KrJelm3ZR47ZXJmr/1xi9ql2PlNOfM?=
 =?us-ascii?Q?dqRK8qK0mLwe7Hd2p/RMtOfBcjy7cYKzQwYoY712Jx/lPTjUFaSy0+EhYjtE?=
 =?us-ascii?Q?Ky1f6RZ3Jm2xbj06ESuAiUME3U0McUm5dkPYJvpAEDUnqU1vzcbal6vZIBIk?=
 =?us-ascii?Q?Iih6fire6qVzk7FDO7Xjcb4w3xkmow2EtPyCQpGfyB1qq1CYdhD/eLQKtza+?=
 =?us-ascii?Q?bpCcbHQMVrEX1TtPgkKqvIHyqdcvQIUuTSk6rWb/6RI7zL5AiaRK6zjveQgp?=
 =?us-ascii?Q?qfInk8RfOI+YT//v3AXV8hnsaqYSVub1F+84ms+SWdd5XovsjvW4fZROCR+v?=
 =?us-ascii?Q?6NuEkBf6sVIvXwyaWn6NrpHPUHNEJ0x8kObL5lLB3Yx5ctKMikAq4gWGuJSp?=
 =?us-ascii?Q?LaBn+2X1emzSv8h184ghVrY7c3MWVh3X5kc3lBM8z/wpmR/z16rEGML5oOad?=
 =?us-ascii?Q?IEUwr83clEkFif3NoaSRL/ZmFbSjw4XpPX2ZR0LmVw7wg28Uxxiy7xeTmxqH?=
 =?us-ascii?Q?SIAaS0Rh6iSF/4Gr3McSjbSlF0JIs4FOKzTzX3292FOdlqKIFVEmq3h9k3rF?=
 =?us-ascii?Q?YhEe6IKH1dw8vDB1YqpN/mkGRao8KEe+C3WJu8WYn2mbe/cgCPVL?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb2def4b-37e4-4a87-d431-08df39946753
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2026 10:22:46.2722
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pMdHhvk1JOdc8lkwD7Y7/8nSn9eqtpbU2yKKi3JP98nxQff2exURxUcCsGUQDshOjdlI0YizEtQQWmiNyUZ9XHwSzx/gMu/7FD+u/i23btN+Ukj8QSqNfEFEpwLkbXA9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1329

Add pinctrl bindings for StarFive JHB100 SoC ADC-0(adc0) pinctrl
controller.

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../pinctrl/starfive,jhb100-adc0-pinctrl.yaml | 168 ++++++++++++++++++
 1 file changed, 168 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/starfive,jhb100-adc0-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-adc0-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-adc0-pinctrl.yaml
new file mode 100644
index 000000000000..5b4b44c5776c
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-adc0-pinctrl.yaml
@@ -0,0 +1,168 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/starfive,jhb100-adc0-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: StarFive JHB100 ADC-0 Pin Controller
+
+description: |
+  Pinctrl bindings for JHB100 RISC-V SoC from StarFive Technology Ltd.
+
+  The JHB100 SoC has 13 pinctrl domains - sys0, sys0h, sys1, sys2, per0, per1,
+  per2, per2pok, per3, adc0, adc1, emmc, and vga.
+  This document provides an overview of the "adc0" pinctrl domain.
+
+  The "adc0" domain has a pin controller which provides
+  - function selection for GPIO pads.
+  - GPIO pad configuration.
+  - GPIO interrupt handling.
+
+  In the ADC-0 Pin Controller, there are 8 multi-function GPIO_PADs. Each of
+  them can be multiplexed to several peripherals through function selection.
+  Each iopad has a maximum of up to 4 functions - 0, 1, 2, and 3. Function 0
+  is the default function which is generally the GPIO function. Function 1,
+  2, and 3 are the alternate functions or peripheral signals that can be
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
+      - const: starfive,jhb100-adc0-pinctrl
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  resets:
+    items:
+      - description: ADC0 IOMUX
+      - description: ADC0 core
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
+          trigger enable/disable, slew-rate, input debounce and
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
+            enum: [ adc, gpio, host0_port80, smbalert ]
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
+            enum: [ 2, 5, 8, 10, 14, 16, 18, 20 ]
+
+          drive-strength-microamp:
+            enum: [ 2000, 5000, 8000, 10000, 14000, 16000, 18000, 20000 ]
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
+  - clocks
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
+        pinctrl_adc0: pinctrl@11bc2800 {
+            compatible = "starfive,jhb100-adc0-pinctrl";
+            reg = <0x0 0x11bc2800 0x0 0x400>;
+            clocks = <&per2crg 67>;
+            resets = <&per2crg 10>,
+                     <&per2crg 11>;
+            interrupts = <147>;
+            interrupt-controller;
+            #interrupt-cells = <2>;
+            gpio-controller;
+            #gpio-cells = <2>;
+            gpio-ranges = <&pinctrl_adc0 0 0 8>;
+        };
+    };
-- 
2.25.1

