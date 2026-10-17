Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2139.outbound.protection.partner.outlook.cn [139.219.146.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C980F23EAAD;
	Sat, 17 Oct 2026 05:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.139
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792216755; cv=fail; b=GsT45Lb9ZrSIHAJLDdF5stVIp5xSicOEuj8qLo96DJP7edBy9s8w5Cs6jDrT6PUn5XQikwQrwmxfpoyC/xUrXmwukrmq1EhOcVp6h8D+fufqXdOLnR4dS15XR5sEyPsaNTv5crQRVcEWe9Q4w0B2IHuwgPrbMaiqnlBKVj24+J4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792216755; c=relaxed/simple;
	bh=UnK0fHrcWAMTSUqoeUTLyaLydLgzCVsXAxxW/LYlChM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=n49+irwRDdc3G2JLkmsuNG01jOH78XPICDQClcooA20uuoBx0yfLHkPm1yAxxdRqe3hq7aUqbBKI1OgOydD534Iyc8cp2GJcJCyJRU9rMWGRrHvuY2/YIjhVb4ViVDK7ACm+4jlhhRsTL0NxPMr9TfOpOX1OukCyzR3q07ucR94=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BUrFApdBxnA80opk0vdcfWRDz/vizHq2bm09JuQ92if9FLMLZV6BxbHKbPYqNgUyp4R3OV2xN4093t2UzAViCZi/fLf0QZggs6HIvHTWo7APQ/7x5bFB+B2iCBhrXavMBHFz2BZUPkJ/pPE3gaJTuphvCevgE36AgBpjOrXlaAZbQhQHAtQ4gfXCyfmGgkYlnM0BEAhaC9f9waIQRvVyAU50mWo82xsmqK5pvOIwIMG92GKNEGgNjLFh1suQmCPI4Nxcicd7qJjAqgjJKRTQPrVTc+nYatsv2DGEZwE+OsmMH6ucrm7EScfUBGyD/NL9QYMQnGL+jKwjtHiHOv7hAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=alQFqWmzQ9EC7l1080t8Ol52j8qfzSUOKng2lpL7wBo=;
 b=Vk7R7zZtVsjp1lIWF8ZMSZGC6ocix88R6KCFzq/oZlsM7DqXi4AwUE3Pa76+VRTvei15FN8o4ieqtVU/1U0emJPEiNUFwXhxB9CEum0hi4jTQopim2lB2w43qG2YXOOD+7ovc5iR+YWtUBUJrk0DT9Vtft7ZvVbw/c9TLMrIhddj+0K9AMztQfwLRhhwotmK+j9Dn+QqeHdB7AYHENJFO707x6zWJLxgCAatB9/bO6GOJkxIgCDoTMkcoxxl5hNzMIAavFn+9ylZJ9s3y6X0srCDp93DRTYenvS6JjWo19RifgEDzygxb+iAVUVcOpldBEXwJKNJUZclaYsnyZi8Sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1220.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:14::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.17; Sat, 17 Oct
 2026 05:25:43 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0522.016; Sat, 17 Oct 2026 05:25:43 +0000
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
Subject: [PATCH v1 1/8] dt-bindings: pinctrl: Add starfive,jhb100-adc0-pinctrl
Date: Fri, 16 Oct 2026 22:25:27 -0700
Message-Id: <20261017052534.115203-2-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261017052534.115203-1-changhuang.liang@starfivetech.com>
References: <20261017052534.115203-1-changhuang.liang@starfivetech.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: NT0PR01CA0031.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:c::14) To ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1220:EE_
X-MS-Office365-Filtering-Correlation-Id: c19e437a-c11e-4d43-1402-08df2c0f171e
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|366016|52116014|376014|38350700014|56012099006|261009223027099003|10067099003|18002099003|22082099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	LUj4QzJaQiUDwIeQDso5yqim9dVJGFFEqWH3cQFRn+CdZuaa231KAJYtL+HhAJZMK4CoAuXYZuTMxpyq5eolkJiEMukJYEyuso/GbUU+op1CEDNXuBtT54PwDNWjGb77KIMpuHO+hIjXPTvJ2x9czwl6D9cgsWu0ZwqF3QMA4pPzoaJw6w8QqCuIft+uwFs5fCbEC06wdCesuyaNs6Bjod6jpoaisM8E2eShd4pxTaUtMlZ3bYyg6tzSCs8kfT0nwa/Z3cpafpClt2r6cxhKZJtxQQl9lTUPLhToHV2Yjlc0K4hBFTVsQZ1Lav6tkF25Fv4SyKaIkTGGxUfUqKIFSeqwoQ5YwlqnZi/WLX031qi1AUKwysCbib4IoR5O1lTjaVhoOzYAFvxwBL7YH79vIIEk0o89IhQ3jmCW35PaZPt/tCmjeDWLLWTRiOFaNhUpJLoA4iWLGIUll9GlgKmuLIh7iwtWBv+nGHnTQs7i3clhI6HmyxgNuh2Hn9alPahIULtuv1ikJiFSHIMhN2Xj6m6Bh3dRxMdDaB+2TDBxmhjkR7jx4G/IovOe5rAUMw5G
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(52116014)(376014)(38350700014)(56012099006)(261009223027099003)(10067099003)(18002099003)(22082099003)(6133799003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?IWs06/o+egHZ4LY5do8YB9NfinEBmy4EvR1QG0RCfn22rY6T/REqIC1PPpfv?=
 =?us-ascii?Q?CEQPFxaiN5hk6gpg8/lCKrCerO219mbdfyCOwphbk4wIHII4cB3+yGXGlqI+?=
 =?us-ascii?Q?uTXLbObBpHh0gcL/NBjKaRiUhgDBsJHn6NgrG/9fCZ8hDVmTDdyp9RNPGg/J?=
 =?us-ascii?Q?pOaSrzMxyubrYprdpZAP2a/HWLIR1yS44D5/pj3Xf8GIpjUmdQbkPEjsZ8+V?=
 =?us-ascii?Q?6bYtJ3OIFlAg/ZjkIK79dkC6eWzz0fjgrJgcvDBlLQgahi2ir7aNvg5O/a0g?=
 =?us-ascii?Q?2Xd5V6hdwOn+YknuVnfd3+tSLURYfywlVIhgPdMLAgqunyjdUvFc8ETR2TT5?=
 =?us-ascii?Q?pdiupSrb1oCQE8j7vgXvScExZCeuGOukNj/imgrRzXO5Wda2Umk71Yc/r52P?=
 =?us-ascii?Q?8L6o2eyChKBjxGYfyMqs8ik/a13GkLyvGuxeTj1MN6rkuRtQMKSj8HYo62o1?=
 =?us-ascii?Q?8pjFGobVDAZvHLxIGQ4DMhB+mBP8rUI1ilL4jTB8x7gDHrkvOMKr14weyK1g?=
 =?us-ascii?Q?8LlHCX0yzHPUbrmNWIDHZugtDC8B2gDibhAw3wTecwMSUcHPBieZedIA40k4?=
 =?us-ascii?Q?HnrR0tz7D1dfqWYFktK7xOJf6KWIrD/NXxuEqb56clWOYIekguZiaKWXyyE6?=
 =?us-ascii?Q?pTigTRVtQsbyyLdHUhWzxWBtlJGUsquWQ0ckYnXgJSo/5j0n0WdifvTvX6ql?=
 =?us-ascii?Q?CWTN3Knu2WNENC5yNUXlviPZKw0oVKqrMry28HRr4Yk3tPiB1jXGEK4ECdaz?=
 =?us-ascii?Q?jzzQlADnKe2zf81FYR9fy+ZKCR9C5pCKPMc4suNClfE88APePrzIAJv1edlL?=
 =?us-ascii?Q?hOOeWhWudujQMYi3u6NpaMzwJzqoh5ybKh9+P87BJRqCGqr9X9IPWqqujlvs?=
 =?us-ascii?Q?AVh82M6D7222euHPjV3/CKTAC8pGo6BzDP4rwnGgB5UwxlFD+tjZGLtzCpZO?=
 =?us-ascii?Q?Lb2/fy8Hp7OmyJSCuIrOkY3cJbNk3UnwW5VoPRfJEcjlNmEwiE5cR2Fi0h/c?=
 =?us-ascii?Q?NFX+gmDZDKzDbz9WYtT3qo1hg/84/cY9CTSFOnrV0svmtnGA7tQ8NIOVc37T?=
 =?us-ascii?Q?jQXQxt+PH0/vZv+t5QzDvNX64YuVSccAsThQIle3moKKZ4cTETdBXOGC0XAN?=
 =?us-ascii?Q?9DWwzDZ8ZpbeY4x//oFMuh9eoVENRQNS3Ss6IgDHPhe0nDpb+YXEXoas16a/?=
 =?us-ascii?Q?hEKTo44YxPuvszafa5FuLtiztzuth0EbHUW8h6PC68YP7FFOuf2nBto6UXDL?=
 =?us-ascii?Q?81E2yQXWUWnafvfKaq16jQ///BL2NzjWvUWJQLhwb2r68vxIIJSwYyESpVs4?=
 =?us-ascii?Q?Hc5ycSjw2Btp/1+/TRxxMRSvFhJPa44moCPr7wrV49op4c2egjfHiLWMT5xC?=
 =?us-ascii?Q?6EAkQG7BeOgwRD26eG9GdtoTTsJ3iKwIZ4x17Pp6c7CN0XsdndDZ4gaDt1P/?=
 =?us-ascii?Q?S4iHk0MlOWb8389Stx7/0zc3gubf/YLdQQvmFs98oQMXWId3TGggYTcJCqCj?=
 =?us-ascii?Q?EViT0klg2rmt+vka/ih+85MQQM3AgUFfiYIP9jgG+DtbWhE+OfvAum50CFKW?=
 =?us-ascii?Q?aW4a7aEHf+CJodD4OEyjnWTh4Fki4Wlaur81Pri6Hbva/gJ3Ynnsnf+mUH97?=
 =?us-ascii?Q?LibxO2py7t+eJjDkdAJL9AHGPBbtvaPa6OOgMzBv53JIQTFXhUBNt1/oY8E+?=
 =?us-ascii?Q?eYOwzv7qv9YnaMD3XFYKQxJXaZ0vUz6g+AVFAT6jLXJYG0dYyujUy9pC7900?=
 =?us-ascii?Q?dvUc48VcEMNH8eaWLo2/GCCwa2vR9Md+QcrG/T2yDhePai+84Rgo?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c19e437a-c11e-4d43-1402-08df2c0f171e
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2026 05:25:43.5137
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wK3i7ioafEdLsSbtK6mrdIm65HO/+L9brU6aSdq7r4NE0Pc8SfUve2VxjOigd2h6RruQ+IwoZ5iiFy76IQyJzVoWQG+Qi8GPTuuhpFky/7L8a9KTnNvwk1/q5AFc71dN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1220

Add pinctrl bindings for StarFive JHB100 SoC ADC-0(adc0) pinctrl
controller.

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
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

