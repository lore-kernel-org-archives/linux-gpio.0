Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=139.219.17.129
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793701380;
	b=cbrJ4sjUw9R+0utoFeGNHH7cidQy+TqMsAa98UGqqCMURUxVd5lye1dv018080Np8S6k
	 eapcNJWW4jMrukXtBTmYy5en1GZ6xwayxAhnM0jUqUnKy2bLJx2k2LMr/tdNXkegNG5sb
	 HUP7x09nTqHpBs3cYwcs3WykWhWmrZ5Tr1YXSi263BA8dcyDMrYFfm+6vzOJA5sVUp644
	 7B8RAGJ8tejaq+P8I/KYT3/9OKDB0/zHV+nno+7fp5lhSb+j1C8ASrlYZuxRhrvl/cB1J
	 FfIa66dysOoDBHjZ6zPmVqASMJ1J3j+0xN8zCh5MTQV9OEtGQFO+Zs5Q7O1VPt8DZxQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793701380;
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
	bh=idZdg+72mnygZQqDVS59Jyf8tfLvfpoIp12hXRqsQhA=;
	b=IINplXmD/Whd657Ue4Nh/a/6Tx2jB8HySYWR760wgeFBb7quGXiOBuK0/nl5PtSE0SOb
	 Ks5m6z1jXAROAUdtwJfoHPSylJcmcXgwNQdsK6Ahw4ZM/CCjkaUukAFXQG4MMhAn6sDfC
	 el09se7geRrRhMB9uIWMH4isOrPSLTfS5bi/b5HsfvYO9yQhO2yAWaZXvuQKOzjE5R+8q
	 k6B2IgpwF0az9QIvxqIpp9jRnxaabzIQ88KaQTfSKUoYjp56WSfCfjcOLfna8eN/Bvklp
	 aXLEHwTQJorYh4cyz2nGlKXhxNAoZqzo4R+a83tuWzx4Bwr4wSel9L0zgBXFWsAglVA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=starfivetech.com;
	spf=pass smtp.mailfrom=starfivetech.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=139.219.17.129
Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2129.outbound.protection.partner.outlook.cn [139.219.17.129])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 428E0606A82B;
	Tue,  3 Nov 2026 10:22:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 428E0606A82B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I31WRMhFhSyPhZ3FsTfc5ubpvWA7crbvWp1HLmXQY2av7djXxIBy7RJqTTnWVNPqB2N0v7U2GUP2MvjDZE9RwA2wvOitlZwZ0eUiWGVMmsjieqq7LY43mYa79jwKzuBL8u7pJG3YD88F27f6O8cenIeSD7G7SyG7jnTWR+7e6MHFbgWsett1MvxgfOLpo94Ss6L7ZpUULaKnw8fA56oVU7JTTn4cb3KTMTvKD/DXvuTX1hp2aJowSD537DqV7g7LQWLbOC2z+ckKhCJhjoxVVFIqGEPrTEZIaQKjxH52T628yQVWzlJmYFHZfF5MypNu5+DJewj/6uAESMmBomeI+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=idZdg+72mnygZQqDVS59Jyf8tfLvfpoIp12hXRqsQhA=;
 b=d7tc6MA2zSv2buNvuADPlp8wU96CKQ4AR4pb2/BcJL/ybMWh3ovrl/GiA3O1LbVCxMrWLCCJLeExZHWuIatAaWrrhmWlE8HglR6RFwfWQHALqnhYDs6ZZmc3ImrXwz6ISI1fQzgf1WgZWPD01h1MFGzE3OLmk/Zur/3+RiSid5nA8cZbVJOvbLEDACj4e/qcLVpaWwAUlovUeLftZSMCg/X5PFTZOhpGpZTXW9bcpX8MkHo03TLisrgYkffFhc8PyXKlnyBBn31funVzLWmDOgvNGFUmGE2e9BDVDYhpV+GL5agfTP5td859BMsxYAtMmgdAqBsI02qta8LcGcmoig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1329.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:16::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Tue, 3 Nov
 2026 10:22:48 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0569.011; Tue, 3 Nov 2026 10:22:48 +0000
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
Subject: [PATCH v1 RESEND 3/8] dt-bindings: pinctrl: Add starfive,jhb100-adc1-pinctrl
Date: Tue,  3 Nov 2026 02:22:31 -0800
Message-Id: <20261103102236.96872-4-changhuang.liang@starfivetech.com>
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
X-MS-Office365-Filtering-Correlation-Id: a03fbfd4-ec82-4ac6-0a01-08df39946871
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|23010399003|6133799003|10067099003|261102123227099003|22082099003|18002099003|3023799007|38350700014|56012099006|261022075727099003|261026121527099003|261026140227099003|261021121427099003|261022105027099003|261009223027099003|261028144727099003;
X-Microsoft-Antispam-Message-Info:
	5cNwbZxmN3VWoYJD6vBcR9ZNroQYdixDlFf3Vj9IPvCEdXJXUtKJdoYLvN6lmUXwO8gIXUoGbpAiHo+YY0+bngbu2HT+dJX9CcpdlFESLKoTUp4WPWPIg/mvE/JLPTSbSuadeE6k4h/kL4dv1OcKOecsWxeeK8cqvBNo7pY8kVQWkTeFOdrzOFCBOrydvm3oPhvUViJzn8Q/CwWxOgSyZFINd51pnRDMuTWKZ97wqAguWOHJ7kx38PvJ9BJyxYt+uDkTiThlfIikLoG5jrRZn6LLIOS692bEMW+XYdft4Gg2/NhSmv/F9H5pd0pV4K1swz8LXTNm/89OgkCoRrg4HHLWVNeqUNf/Hrj+yGQvMmzVbo9e35W1t/sOqYknKzj4LizeLs8GAI9K4DCEe/T8Ph4VmDTxUT0b6+UFtFgD8b7GCtCyYIJS0D9gMiY9wAZUAwIubkQti4mJzgmx6mePdxSryI2cHXCH9VvHjVW1SWh76M+DUTs1n8s5plomi3jfeyCOzNmn9Ze/2x0IRveuGU+0m/Qm0qTsnfgx4WM1aSF/oSVwkjHFY9c8gE8Ji+7m
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(23010399003)(6133799003)(10067099003)(261102123227099003)(22082099003)(18002099003)(3023799007)(38350700014)(56012099006)(261022075727099003)(261026121527099003)(261026140227099003)(261021121427099003)(261022105027099003)(261009223027099003)(261028144727099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Nar0L/03dWy+tegccCk3VQclbidMEyITqdBV1PXZsHnHwDmSGIgRexf84uTU?=
 =?us-ascii?Q?ix0IftbwyNWX8SdvAmaEbvgUQclmmxNeKCzLUIwRBKp1wunoU8r9Fnduw/ht?=
 =?us-ascii?Q?cg9gwJDFw52AjXufOsGBzpxKXYuxbWL1BUVcenMM5hQpJQOPRamwzk3/RWnX?=
 =?us-ascii?Q?fPLIoVs/Ipjw0n6M3vFDb+zgmS0ZChnEDdCfPXAOqBl8x+VDqUZShmgb+1mI?=
 =?us-ascii?Q?d0ZPss29dOTDLonGtTZyK2BmZBBzpvtDnsJSrUnZNR26eeaOn1tCIsThh5ui?=
 =?us-ascii?Q?WAsuimGKJVcx/uXlRGyotUhCrChU+nRazOuYBfnDCDicovaZcmod89GGaJC/?=
 =?us-ascii?Q?d030Q3qIboQOAR5TH2iiVgO9d8TjSWyw9hwaYdVCYe4uB5/e2RNbC8caa2Qx?=
 =?us-ascii?Q?pZ5bMREfALxRELFB6ntcEKLu5wLZZWXq6IRs+pI5Uz90BeSB8IkHdeWTKfZ9?=
 =?us-ascii?Q?pOIKqmNIEqrUK4vCQ9eQIeK1C5PYpZjh8Edr5pqzTnx91FEA7tRieZozkwcE?=
 =?us-ascii?Q?qpM5AGdG4yuMp7H/m1CSuA4tn8BiHl4A2NGYpheYP4G/sBYLnZfWIcNcETu+?=
 =?us-ascii?Q?5cSI2kL0tYrtuLkX3WowR5cshAE6wcCAUQefedyTwYHPBGgXJNQLhpUuIUt7?=
 =?us-ascii?Q?rkDln3jG3nfiaDPpcgJpVcypxwstzeP+fL7SqtaK58JPhTwFnO/ib6Xlk9Hp?=
 =?us-ascii?Q?8P1mKdLBk7pAgACY+w6H1LiUpL4/hhSgN0pxG+lXH/iMmSwJqlOY3TKK2was?=
 =?us-ascii?Q?z8KWlgJ+fiPs2EsLslUN5XOIL1EeJs03Y7D5JPWgj8/Dmm/RKB8BsHk7NX2y?=
 =?us-ascii?Q?qGud2Fbq7/nHVDkhh+5ehcnZJNP8sPQfogyIH7Uoiu0hlTYDqjL0pVm+A/n/?=
 =?us-ascii?Q?r8KDUnR9eIg5ok4YC/AKyFSzcrOzxu5Xreoyg7QWdinOJ+Nmzom4OxCt2hfZ?=
 =?us-ascii?Q?KLlQMwSAahjnbtPWQ0pCojfoFeZebk7+a7YSdqyfZdcm2q2vm4K+PeJcfcbn?=
 =?us-ascii?Q?UxHKpfK3zlIpyNZ9B8Pk1SJ36ZWYlIYrrhcdZidHXyriwnOn4SrNVFqEpJA8?=
 =?us-ascii?Q?kpFXIc8xjsROxi9SoKbtMxiuqtEvqhmciupde2/gdscT7Dx2KAk10tjf8c6b?=
 =?us-ascii?Q?wsZcPy3pon+gDw8KbrURFCIyc5GvwSAKKDqmPyhULEmmhriDqCgl8pt5D2j7?=
 =?us-ascii?Q?Kfidw3sjZ2V6GiJ7QxPpM2a4zrn0CtdilBdjefEl6I7sLxeUueQ48Fleq6QR?=
 =?us-ascii?Q?JyJw7NeMC3tiBoJtBSXN/CCqJs5ox/yGoeB3G0y5RP3nTgKAeZvBkSNz/Ehu?=
 =?us-ascii?Q?Ac3xLI3+5nRlS0RetvXf/z68mg7jRqq9ceZOcSpESyE/2UGCBmC58JpJ+znw?=
 =?us-ascii?Q?+LbSYTAajTc/JM2ljFTwXmMB3LMQwQfe4fp+uamJOzZ8JalYv2fL+kcHs4+H?=
 =?us-ascii?Q?8H0RmzjvOWZ480Jr/PV2IdmHQXJYq+5zW5JK+0YSIFw3UIO0HjwUVt0E119d?=
 =?us-ascii?Q?2evEz360kvu4d918v9CYJAVys1Av9I2euuL+LxLmZA31EDlJsjuNSLVmKFWw?=
 =?us-ascii?Q?sIcmNEsCjMCKGhf+WTGnnPaeWZP7PSW6j8FluZRenxL3Wfbho1Zq2JRGdCn0?=
 =?us-ascii?Q?g5gIDz4gITaH9vWVHL2GwW8uak/Rr4u9R3ccsWrXG3+7OwObx+XS1eFZOYp+?=
 =?us-ascii?Q?EXxImvEJtQsQOxv1IzUFETQ/pK54FujRwTrFMWo4cM1ipejAE/a4j6o/Saf5?=
 =?us-ascii?Q?O7WhGN/TUPIGB790R5xT8zTsj8g6opitaWXlueBb2a0ygPc2lfdE?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a03fbfd4-ec82-4ac6-0a01-08df39946871
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2026 10:22:48.1454
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 008t2SWuQy5Ly8+ndd/LhHySE0rUEYCsIF/TQ2D2EOYc8VEksnAMXjma5UBmY1q6yivgdwPnnPi+xjMLLQsBJxGxbXmQS90TdVsbYTV7ReTVnSPDLEX4d8TQo/xeaorF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1329

Add pinctrl bindings for StarFive JHB100 SoC ADC-1(adc1) pinctrl
controller.

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../pinctrl/starfive,jhb100-adc1-pinctrl.yaml | 168 ++++++++++++++++++
 1 file changed, 168 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/starfive,jhb100-adc1-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-adc1-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-adc1-pinctrl.yaml
new file mode 100644
index 000000000000..6f1486b4a8bd
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-adc1-pinctrl.yaml
@@ -0,0 +1,168 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/starfive,jhb100-adc1-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: StarFive JHB100 ADC-1 Pin Controller
+
+description: |
+  Pinctrl bindings for JHB100 RISC-V SoC from StarFive Technology Ltd.
+
+  The JHB100 SoC has 13 pinctrl domains - sys0, sys0h, sys1, sys2, per0, per1,
+  per2, per2pok, per3, adc0, adc1, emmc, and vga.
+  This document provides an overview of the "adc1" pinctrl domain.
+
+  The "adc1" domain has a pin controller which provides
+  - function selection for GPIO pads.
+  - GPIO pad configuration.
+  - GPIO interrupt handling.
+
+  In the ADC-1 Pin Controller, there are 8 multi-function GPIO_PADs. Each of
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
+      - const: starfive,jhb100-adc1-pinctrl
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  resets:
+    items:
+      - description: ADC1 IOMUX
+      - description: ADC1 core
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
+            enum: [ adc, gpio, host1_port80, scap_trigger ]
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
+        pinctrl_adc1: pinctrl@11bc2c00 {
+            compatible = "starfive,jhb100-adc1-pinctrl";
+            reg = <0x0 0x11bc2c00 0x0 0x400>;
+            clocks = <&per2crg 68>;
+            resets = <&per2crg 12>,
+                     <&per2crg 13>;
+            interrupts = <148>;
+            interrupt-controller;
+            #interrupt-cells = <2>;
+            gpio-controller;
+            #gpio-cells = <2>;
+            gpio-ranges = <&pinctrl_adc1 0 0 8>;
+        };
+    };
-- 
2.25.1

