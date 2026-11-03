Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=139.219.17.129
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793701384;
	b=0Pu50MGmvc85WINkQ+3hS2SjLJuYdOsKsFlyt6uQTvVCQVwYy0X7X+FK09Ib/GtwUgrl
	 X8FPo/CMgTRJXjow2yImbnQCcuXSWZZANg1kD6YRt7bSQbCHdm570rYtLdu3R4lDQ3oZR
	 r2UUkF/UZVL4YC4gdbsOVMsjPkq7YjsINF/YwLv3MHF5rqEDDD1xachiPhZV2MpobHN2x
	 G3XCfZ851i2eIINQb7c/5L2FOz34rK3gbTVFFBWqDD/HQ+4ThCR6msjxi/smjcFWq/dM9
	 gBbaMsR3DQm51+qVXkIlSmDDyqSdwsYorBlv3QHeYg8H+SmqdDoLWN0eB1mQTc7klzA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793701384;
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
	bh=5DKAMgnpjqZ2qJo7tp17BVb72LsfOofvXQmqn0W7A98=;
	b=KFGbxhOQmxJWebVvGJZoLXMNxQFuPG4ftU4mp86YJ0WP6jAdYEznBCDS7a+f+1eZr8DG
	 L8cqmvtqDiNwK5qQ2UyvKcfdXeVYZhlkknJ0BjlvE5t+0yOxiAKp9VgJVtgpdj53UWWWG
	 ZCAoAn5Oc1IXSfiadrTdKtawI00nXrvvyZGHa1LfmRDDzZXWV/WMLDmjsLFiW9dXDxBIc
	 Jm6GaUxG2OAPC1ZDqqCk8ZEy+wap6ivgu8gQXM5cHGSUgwaDoBk89KRhqRd5xw2QnXZQb
	 aYKtqbGMhD8e3oKVWExd5477hDOQ9KMPsUFNE5vD1UfTft1k0yay3GEp3yLRAx2NBCQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=starfivetech.com;
	spf=pass smtp.mailfrom=starfivetech.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=139.219.17.129
Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2129.outbound.protection.partner.outlook.cn [139.219.17.129])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74B09606A837;
	Tue,  3 Nov 2026 10:23:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 74B09606A837
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PL2/n8akhIdXh+44ScI9c9FLGyO1Vw16sA6mKV7KkZ0Tq/Ne4PvnNen5NlTbIqDDxczTAOQklTKzs+6e+7j+NUtPu7caBVDGsbRSV2+b/bMhyZVt8yOd0mUWJM2JCIZntgxq4ZaEOTZT6uepyvprrYzVyw25pxMlpbaUZp6H1Wjf1QyOL4R4EW3vK5CEsBx27VhpX7KiDacuFVlAink5g1ox/bEWmGNL4s3y6rMFJYkQKbPUUkTXi6ctG1saVvQzOVVYgOnbiTU1wnYgTEEXs43HQD8cIsmDfGEaAr4OP/073Eua4zQJ7UVPcilEHBLsiRFP53sKTY+gAYcH+fIomQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5DKAMgnpjqZ2qJo7tp17BVb72LsfOofvXQmqn0W7A98=;
 b=kmQ2/xyhUhpJwKIumuxfwo0X3GlFPElKCYg2I8sf8T3nslbrSXpdaQm5uCvaWFrQ/+MlUi4LSkRMZzV0HoimerdslFMBf4ohq1rTjsh1czhwBKQMIlhYwclsaqmhaE8mKg/rPN7r0JfJpRed5R1vjPVICiYw4S1JXX8kgHxHRewcwFCFN0ZzfBxHxmajCnb/ZXhaiUh4ov/WSxQBqfZ9Lv+hS/DQdcO7T/D+AW3H6c1U7P391BimoRgBX9NHHJYboasHTFu7BR3KBzHI5ryZmAhIkCt6tByv3CJGXqr0wUNVvBJPCTE58Z9S8KM+cV7FBkiApaWcSQtXvcSPCiZtOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1329.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:16::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Tue, 3 Nov
 2026 10:22:52 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0569.011; Tue, 3 Nov 2026 10:22:52 +0000
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
Subject: [PATCH v1 RESEND 7/8] dt-bindings: pinctrl: Add starfive,jhb100-vga-pinctrl
Date: Tue,  3 Nov 2026 02:22:35 -0800
Message-Id: <20261103102236.96872-8-changhuang.liang@starfivetech.com>
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
X-MS-Office365-Filtering-Correlation-Id: bb5cc841-e08c-442b-5795-08df39946ad5
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|23010399003|6133799003|10067099003|261102123227099003|22082099003|18002099003|3023799007|38350700014|56012099006|261022075727099003|261026121527099003|261026140227099003|261021121427099003|261022105027099003|261009223027099003|261028144727099003;
X-Microsoft-Antispam-Message-Info:
	Q1GTpo5+qtAaRFrqB2fQP7tcHASLFReTqHd6eAoYBjXXXWnKQwvHB/xhwuQFnWizJyvIPcBcMOEEykD2bKXhG5WOW0Jli+qIsT+La+qfnWtwoDi2UXSTp7PMU2Oi5El7pf+fuOUsE/XgggiZEHc6E1qNB7Y/Gg0sD1UERFJv18Cfxdjak5kZTPRamFucia0NlaTrw7l+ZZEskIr7q0v4UysTODFOUujbC79Wi3B1omUqcxrJdLGb/SgUQxYUdV+4MjmhsUBTRaLFQ0eM+ESWatBRut2avNqMv6ksxSMfzDokkQEGRcEVgXhPWzllGX1AKEnSE9pThzAfF+NUkwNJ8xKXx+ukjpkdTjiw97jHBsX6g/WR5fExItbaXHsW2xPZfElgduA06m/y9CcRNjQ/D+miUaJKtdOgFp2z6JtaTIolzGbljtu7Qpd2rHbTuJ1M78loUAi53XlmG0EQ536p6JfAqDWzJluiSCP9UiVCuM3/ZjN/AatU6SzPPsjAddSl8dI0tNOUppvMg/6kuYQ5n2EYjVmIwh9JisUPtTz946G3H2lihoNpWoAz3sghbw8y
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(23010399003)(6133799003)(10067099003)(261102123227099003)(22082099003)(18002099003)(3023799007)(38350700014)(56012099006)(261022075727099003)(261026121527099003)(261026140227099003)(261021121427099003)(261022105027099003)(261009223027099003)(261028144727099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?zOJwM0wFjQSqptxTWZYmskmPy1qMygJ9gBlqbUx0Yy1+/BJeLWKaxDjIqVWI?=
 =?us-ascii?Q?+RacVGnfUKAGn5eriAvRvtoC2+zz7hVd6CLl6mR/rkd9xEJ/ep8iEzv71xke?=
 =?us-ascii?Q?ut0MdfDiFdKEbVcBuKYAo2yU5OdXa7JFaOaXT33HSjlklPsATxfSOuiQmIrO?=
 =?us-ascii?Q?RUoYVKgoI4N3NlQ2sGiIUM3LZRwE25uemWMXekR/iJFB0FZWx3zqaBtEciBe?=
 =?us-ascii?Q?7ANgvAe45qxMLpmWlKq3sKRDvdvsZahr8IRgs79j1Tf1z/VhIgdAmQnHHqwz?=
 =?us-ascii?Q?3KW7IHvY+KT+ZoT31dzMx4mtIFV+GlygROVP1c/N84uhnI816ckt1T9WmclR?=
 =?us-ascii?Q?GBZjyWTYi9kQ2iUb/Tvc8LhEeU6dzOhukdEuip06HaayTsvimqnjciCzz/Im?=
 =?us-ascii?Q?eytN/zHzGw0C74rA1Thypmz5011YB51kAOQLmhzQDE/QyFWh9bM5dYmQExCO?=
 =?us-ascii?Q?ldRvqh6VVpuAljARWXeXToMCEtHyLLkIK0T2SAqZb/FZDx/fWAHQeaX5QroA?=
 =?us-ascii?Q?rgbJvvH/fGIbdTNR50ETShJ0JX2LGSkI2WXUB8c85jeQMrdJ9M/BJsTOs+zT?=
 =?us-ascii?Q?DkVqKRnzZ25eOT8BB5cerFoJpnZbTX3mOCeOnpeWwHzgd+eF/a3ecST1+cCJ?=
 =?us-ascii?Q?cEF8aT8ddnr/GZuE3sMwXS94pkH1nVOArTIfsKxp2+y0NAuUzOopUj11j64D?=
 =?us-ascii?Q?VSQ4pVEdVcNjwPKDG3jeF2h/J592UReRUpMboIz/6kq7+7PhnJm3IEh4L6Lz?=
 =?us-ascii?Q?Roa7pPX5PRh5SlqhssrvZUx+SAq9XYqpmFgeFG9sevB8BiOe1nsz/GvC5DCa?=
 =?us-ascii?Q?flo+3qtqyoTSs3Rch9Tx90AZtm5IJLaD49PUcJFjr386YsIKbCBDM7PLaw7z?=
 =?us-ascii?Q?URQWb/RnqXDMeB4PIhnlHTJ0N+f1eatyaFJaEbVHH0P6j25JGglCQiP/YgiG?=
 =?us-ascii?Q?lB1PRQ6CI8/RI5ti6YMpdxMZwebhvC1xIrI1bS6aEdmQQyx1xdSObh8e9Ce1?=
 =?us-ascii?Q?lZnxTI+eQslg89G7NddEp1jfAec6svixSESXtZjMvjeLpNEs0H5cM+UveQP6?=
 =?us-ascii?Q?9ruTq73GE2wzHhett7oLLBHUGS18o2WAqPsj1h3jsTSvKJUT/+JX2cEuBOLO?=
 =?us-ascii?Q?5t8qGgy8EhaikGbJwGFysCsDhCPVa0y4PJ0cbwYa+QyRyTopUL1Fo4K/Ded6?=
 =?us-ascii?Q?mJzu7YwXUQv+TiA22E9Z5Zzq983m1UbR0rfDrm1iKUAChpSV72II5PyNroGd?=
 =?us-ascii?Q?PKbsgTlv1AGeN8zTnuMQL/YaAWvksdy2gpymoRYSW4hAAPEvHhacKo/lzMrG?=
 =?us-ascii?Q?puUU/LWF1TmpgCGCNsUuWdQzCITGk8HUFC8zvWO/pHJCcfFFjOIsaoE4mEMc?=
 =?us-ascii?Q?ajcD8LUks0u13EqN2I/VHOjc61mg5tHh8C6axVA8eF5oRHnvByAclk4BZV4p?=
 =?us-ascii?Q?x3Wuc6MN1KaWOdHQ+OKgRd2RdEg4VnyMCG1ahbFGhqAoKizJist1jiNolhGX?=
 =?us-ascii?Q?FOWLjYa9Gw2DhFfbfEPpjV2vYXg7JbsX+MzvcnMbEglmuOeMrDhpVlkud09s?=
 =?us-ascii?Q?UYlVnVNeR4iHPo1FQUc1nRIbD6xuIJqi79RG87RrrEAnJAv8qEt084MWTav3?=
 =?us-ascii?Q?9lhhei9pM2tWpXmvoRnvGX13SOeytTWHnmBw93zEDMCY/xFCXHpxs3LqpUWA?=
 =?us-ascii?Q?dBYaDxyI2AF8mOeMo+dyyLkRedoNtVhGdZZ04YjuxrslNBcMEnmkcAlb5XGI?=
 =?us-ascii?Q?S4/wvDrPT9jHLLFadxdfQFGf5A5TGhol8uUcLdMVFwKeaufymGtG?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb5cc841-e08c-442b-5795-08df39946ad5
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2026 10:22:52.2636
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 37CGUFZDjB2BQSWbRmbpd9YNJeAY4XTP7SoDUSMqpfLfmtm/fBOiiirSSiSZq78TwzT/Ctoq2J7YBQmhckppGWo3zvzSKRUpQG7MT799CZmt6sJi/b1fD84norEwgk1X
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1329

Add pinctrl bindings for StarFive JHB100 SoC VGA(vga) pinctrl
controller.

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../pinctrl/starfive,jhb100-vga-pinctrl.yaml  | 163 ++++++++++++++++++
 1 file changed, 163 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/starfive,jhb100-vga-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-vga-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-vga-pinctrl.yaml
new file mode 100644
index 000000000000..f0e35da58eab
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-vga-pinctrl.yaml
@@ -0,0 +1,163 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/starfive,jhb100-vga-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: StarFive JHB100 VGA Pin Controller
+
+description: |
+  Pinctrl bindings for JHB100 RISC-V SoC from StarFive Technology Ltd.
+
+  The JHB100 SoC has 13 pinctrl domains - sys0, sys0h, sys1, sys2, per0, per1,
+  per2, per2pok, per3, adc0, adc1, emmc, and vga.
+  This document provides an overview of the "vga" pinctrl domain.
+
+  The "vga" domain has a pin controller which provides
+  - function selection for GPIO pads.
+  - GPIO pad configuration.
+  - GPIO interrupt handling.
+
+  In the VGA Pin Controller, there are 4 multi-function GPIO_PADs. Each of
+  them can be multiplexed to several peripherals through function selection.
+  Each iopad has a maximum of up to 2 functions - 0 and 1. Function 1
+  is the default function which is generally the GPIO function. Function 0
+  is the alternate functions or peripheral signals that can be routed to an
+  iopad. The function selection can be carried out by writing the function
+  number to the iopad function select register.
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
+      - const: starfive,jhb100-vga-pinctrl
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
+            enum: [ gpio, vga ]
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
+        pinctrl_vga: pinctrl@11136100 {
+            compatible = "starfive,jhb100-vga-pinctrl";
+            reg = <0x0 0x11136100 0x0 0x100>;
+            resets = <&voutcrg 14>;
+            interrupts = <236>;
+            interrupt-controller;
+            #interrupt-cells = <2>;
+            gpio-controller;
+            #gpio-cells = <2>;
+            gpio-ranges = <&pinctrl_vga 0 0 4>;
+        };
+    };
-- 
2.25.1

