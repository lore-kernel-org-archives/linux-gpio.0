Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2138.outbound.protection.partner.outlook.cn [139.219.146.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8913F3D3CFD;
	Sat, 17 Oct 2026 05:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792214834; cv=fail; b=fvMTsNrp9+90jPX1HJ5t2GN95NieFeCMmOSzhdAoEZKV5fhoeqiCENkgpVmLUPgcB5tH4G2xHvNFMaWS1rI7iWUEwPxIJb+/SCLJi1YMHONiX8SJLG/E+bGynzq99jDI7JRvFG+95oB8y5Bjzzva+z142TugW157DvM1EONTUEQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792214834; c=relaxed/simple;
	bh=Gv1hDQ7CzF6DoGnUGTWLfdbV7JD4/fJ8My7j17LCWLQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=JS0WovNLWGupSVDFCmLeXc1K7kMH0Nn9X3r3BIPSIveaOr/HrWn3U8/0PRR5NL2vENK27KUoEayFuBRUCD7prbhe94a3CC1h6cTqL6IEHZgHVZjsrc04/yLuCgQD0S+nmQFJJRiDTOhipeiWfmzdQO/7fRklyQdVPtuj05XUY5s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z7YqJCkw3+fIPL55sdS44YR2zeQDSl+90tuXtwmveXuDodZrqxFHW3TWvCff8gb4tJJ5lEMNcpv1/60jPJgzH47XUyqeMOgziBJpqwgXCa4yjKmwWnJRgu74SV95pBn7+w4n7bSML9eWTORxJ2pAraAZha8dlPA3WfXw8LCtizBsvv6CSqpFFYIriVuaWKTNd8UH/No6PlaBL8hOQIubHuCxNrC1ShatBe+61XfdjPGAv1KH96nCrfEzxPTJKN+PqmBHePUtvAn3i0krU1haqwESSmYk4rNQzyWW4rKJpxBsx93HbJM3DFvGREZ5HdM2Rm5ZrAOR/Z0xAD2yXu3NeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H3ahyiRuulTYWguIulHcDXoQYXi6o3E+p1xgDT7TfGw=;
 b=FDO2U8raBoKmGMXzIy/qkwh3LftGLOFPj7XMLIlnbnbx1TNequKgLFXX4GzX1xxfYUfQSx5rVNCKq47B1el/oI/6yNnZ/gHK7z0qrCufnCmyEdGewl6pBLHKjKEthw6xdo5B+9W3hVlrbEcjW/jD7uSLxDsyNhEtMVeV1dexMOrAz6z8dPr3ML11SLU+sMPETZ19wgkPgDyyYQ8LKCJ8sGngq14edtLtgQSPkRWuUCRtjU7saLzca8GFUzM7K1FntxhyjHcQOYvSicMpVMCv7goENu9i/wCVP7gRhrYIY+dn2e4SCo8TrApcqRFM3FvVFqaeGxbPWGbCM6aq40ihQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1220.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:14::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.17; Sat, 17 Oct
 2026 05:25:49 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0522.016; Sat, 17 Oct 2026 05:25:49 +0000
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
Subject: [PATCH v1 7/8] dt-bindings: pinctrl: Add starfive,jhb100-vga-pinctrl
Date: Fri, 16 Oct 2026 22:25:33 -0700
Message-Id: <20261017052534.115203-8-changhuang.liang@starfivetech.com>
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
X-MS-Office365-Filtering-Correlation-Id: 752a1ccc-13bb-45e4-317c-08df2c0f1a9d
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|366016|52116014|376014|38350700014|56012099006|261009223027099003|10067099003|18002099003|22082099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	z4RoNrIJ1ixZQ+Q5dN9D/IbWIm5cVw4YeXTj+5xXrVrK+1vG4FY4GnTtq0UP/jfUE6AvpUrMuofvqrK4OHLPnBL9SHABQpf/8HkQZeApFPXTJIvspLLn3hPM/vHdHHTIfJTCeQZzAkpnBU4KjBV7fEOQPzAXcQ5Jhj0UpYlqfz+ePuGc2mpqGQJBjhkIfyLiqisF5pnAmZuwBrPjW+T5rsEXR3lWZwLvHKaUkL0epfCbCn8jyLkjKToCRHJS4in/RSnkPPSwz/sB4KzzKqgbl9udz8jLT5xffu8UfLlUeFmmSg/YHTTTv3/PQbRpUUwSeNvQfKbuszBVGisRzTmG1XOMdil4UiK0Os5Y3Ppam14FB/OTRo/OJ7MYkStoaZXAvkKlEqeDnpo+Jkleq1s3xWtP7QiCizktKLNfh13nUh5s6vwvCRwBPHAiNee9wGh8k0wUg3wImr5tYKfpCqrifDnj7Fd+IlbyYeOJXRzQNYwdH4NzhHb7hB0kZISd9U6Y/L8kKXknSvR0QWnrbTKGsx78hD603/1YVvz/z3eMsdq9LoRjCAy4tBXQ4SR6Zbdk
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(52116014)(376014)(38350700014)(56012099006)(261009223027099003)(10067099003)(18002099003)(22082099003)(6133799003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3SRo3OvnXEu4iN8TyE8NbjlCXKFBCAVW009SDSXjE+vzDc9NHebAB1N2Zfa7?=
 =?us-ascii?Q?2cvaISMaKy8fnppCaZjh7r2vAkCdRiAEuLsgN/oG4vxlj12GQGM8MF4OjLtf?=
 =?us-ascii?Q?IPuJHhdZMVGwf355tPof/XG2JB7Wux+3viJujiPGdMdaMxw4jpTdgYD6bN0I?=
 =?us-ascii?Q?/4WY6A0W/ionrcA2HMnpqRHReSGpxMxXzM5O66Qka/XAAohYSVASTyFw+JvP?=
 =?us-ascii?Q?QmnjIAWpF/3AI3R8gsPVkW9r2sPjeZG+JQWtXFEVullKDkmErKdRFLiupkjS?=
 =?us-ascii?Q?RJjig1rM/zVqzCTAx3tUF/8A7ltRiHevj2v0ZdcOb7Qk9+YSTdE2ow2Nk+iu?=
 =?us-ascii?Q?h87kklzgVRWhDze7x1b571DNuqVXwQiz4Suoh3pVYsWW0kF/ElwgStBwP5z0?=
 =?us-ascii?Q?V39ItNq/cbsgVBPHA4SqrZ+81plPS8y0x2dl1wXVvhXD7o42N5z6tb5jQAwT?=
 =?us-ascii?Q?XCX5/83a1TFnXsG02UZym9FeQGjf+l6v1Dm8C2Q2mIuH9pqPrMea8AJkxW1U?=
 =?us-ascii?Q?JByGK9FceaSMjwAtQH54HJ+IMW/S2YEKN6hP49rgvl65z2dwo1QxPBTGZ7Vm?=
 =?us-ascii?Q?niucmg5k9aPRA9YuwO2VfOWolKjjpj7o5+kIssuXCaGtGHaz2BJCpvIU5iYN?=
 =?us-ascii?Q?05VUK0TKTJqvDDnQo/WjIwFHspqpZUbJnvsQyDDVNxBjofBPqivZK7CPAKh8?=
 =?us-ascii?Q?oxIUqy0+99PytZ47wVLrc26EVahYQkdjZ4Hkx5aMj+43pro5a+Ossr4jvArh?=
 =?us-ascii?Q?EnuIspXnQUehQItTM9zVxFAEs1R08L26LKQMh7d85q2fRPuAiiY99yPWcKH7?=
 =?us-ascii?Q?Xm4DP3R6bVqEOlRhxAgjQ/oSLGz3JJ27LT1dbDkJSBODi3OwfnFMwJp0F2QF?=
 =?us-ascii?Q?+KI7YOu3EUzGmn/h90bk1VFbJD01vKcA3pCORdZteEcQdk+1n7w0YQIvNWts?=
 =?us-ascii?Q?QIatfm8FNnLKTSq5MGDlOyNqKk6zeDoODTl0/z/uM0MGA4iB6jLZadD8Ztua?=
 =?us-ascii?Q?4+HXSpNIbX6o51NexDea6bJQKmNBAWjbckM/iQPW62BHZ2beRgdu2qjrSe4s?=
 =?us-ascii?Q?cfNd8p5tXikIMuyKqQqeJM4bj70fB/nRZMhuD0fVyg0yvjHD/6kITGvKAcjr?=
 =?us-ascii?Q?LSM3z5AzspeovMJD6/TdsLGJnQTnQ7DghOAA1E5SC4LlkVChm9YPomgXydvR?=
 =?us-ascii?Q?Idb0Mxf6E1EbCBNzcF+1nhoQtHvhDUXTvcq2zmVptbMRyni6CXB7nnD6QFa5?=
 =?us-ascii?Q?y4HsFEwdGxj03pyvhMv//rXW5fONF+HvxgiF1WjysFWG2cNtlkZpWndOwA/b?=
 =?us-ascii?Q?ULFMhfImCfrRUkQv6ek2OYQKv8+m74kmUEJSDd07CzIoxCOJlvoHIWsrXJ+i?=
 =?us-ascii?Q?c+n4ta9E+zkLiozLKVs90IUvA62MA/0I1iZCW3QIbzSYsmWIYAhaAFNgXUqk?=
 =?us-ascii?Q?Vj2aImp5s8MeCK0eoND+jXLelLfGkPc6GR2ZVn7IM+87tGxL4nzjiaI6+eP7?=
 =?us-ascii?Q?YY1eaVtZP+/YqBdiDGQnAi+oVgrXJo2tIp0nQAcseDui2Il25eZ1STIj9pv+?=
 =?us-ascii?Q?T6f3Id1T4+jTYvFkq8BAfAE8yhTN42FGpzsSGeNYgH/ahy6i/Q01dLEiMd1j?=
 =?us-ascii?Q?51XVBbUmbBatpq4b3+jIsrS/7acghizpMsFUemLEvsFfbJq0051Mhwk7yKd2?=
 =?us-ascii?Q?4uNVXRRh3smeTt+Ylkjqzfy4KE7+dA8rT4MaeS49G642gd3laas2DGMuY0bf?=
 =?us-ascii?Q?7cR48HN1WgR2mPIqTSvVWDmWGrE0hK6og+PghbE5dROB1Ebc4wJU?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 752a1ccc-13bb-45e4-317c-08df2c0f1a9d
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2026 05:25:49.3468
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 20p7nA74Q7DoIiKzahKe2movUWmbDC/8h5Jpm7N+iQQc2MLSd9m9oBgRuK76S2uId5aaSAqhjN2l4NbncZT1FXrkny/fJxQy6+VRQA9KX6H6pWG7KsXFRuB/Ih5INFym
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1220

Add pinctrl bindings for StarFive JHB100 SoC VGA(vga) pinctrl
controller.

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
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

