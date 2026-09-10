Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2101.outbound.protection.partner.outlook.cn [139.219.17.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02845356A12;
	Thu, 10 Sep 2026 10:04:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.101
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789034676; cv=fail; b=rAEQB3dZkA0yhdldEGb+fbSVoH1FscCNzpG0scD9FqkCKLYOaaje+fnvfva61OxuaT61v0j3KMa52V/SCghWD28F88PsHV67bV58l7YMJZ05E588j9kVSo93Wwz5HFwurwS7em0yhkl/PNxmhdWPX8jp++TPjmQDazR1/Z0NgjM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789034676; c=relaxed/simple;
	bh=9nbDMsvhUpfUfwnWdXDTqMR/FUf0WNXNDzMtQrSXS1E=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=pISJrA1ueJnI4uLYcpWllengNQG5s78LjdBtW+KujNeanVwcNiJSYts7dgXxuyHJRemZsPLNXKO1j5ErOO882vOfzCRB1dPXbszm0FC+qKA9dsHNe9iiNBvfdSJIEB6eKegcbuBwSTHAFCtYMknW8BtqQtM+clDpOM31SEH0Enc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GFOh3KhIytIUV33ykPyS0qCu8UtRsTweVTk+Gnq5/BJH04pPYJXygmeWVtUTQnAyZIaFktmkEZnMovs1pH/OVcEXYxp1R2iizqtvi8e/4ys5oEBfJLSvsYO3/BMoV4BzenlZAuVbeUHRpyBcVCBK/BAJZrw//bX+h9cXs7BinP8PR1mKoLHwbAGK3jlmUEsDBKwHcZhlnwlV6SiuOU7NbqZVTDPWOJKxEjyGAuDK6GpJ9ZFY/lebiMhnkKyE0OoD9S0N/yBhxq0Prz3MCyx4lQxWSoGYDVfMGZKr7sWHZ9C88lee2vVoBDa8PtXPKIJW1ykxt3bOCJHPO3dFtRQQdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l1eLVdSljDzddZuO4MOaaJgRg+Q8LoaGQepWCaeNlFQ=;
 b=HKgnkeQKbDK4GBxsLydMWkZpMcaOwKZ2hiGoQl12ivmllVjXALZIPZVQ2Hi8hLkyicV2B9pFvd/by2QHWo+m9n7EVllICb1srsqRKNY5ePjhM9R/A0a8TWIZUG0viQNM+MvL3oHTjUauddt5iyx7ycFT+drVv6prF8I3zguCq5Mt4XGSL/W+ddiFMcoXklNdu7huRPppx0ljLfLTyldi1b+x3JfQ2vQfdyX7tG5Svw4nS2Qb3Ph0wYvr4Ap+bL6weGmdwFryRNiUFcU3xd7GP8WDzRm0dwwqqwOwMSYqsiaK1adXHLC5+vwpg4ps8Lc8KWUH4L8Mbv42CB42heBAKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1233.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:13::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Thu, 10 Sep
 2026 10:04:18 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0339.017; Thu, 10 Sep 2026 10:04:18 +0000
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
Subject: [PATCH v8 03/22] dt-bindings: pinctrl: Add starfive,jhb100-sys0-pinctrl
Date: Thu, 10 Sep 2026 03:03:38 -0700
Message-Id: <20260910100357.130134-4-changhuang.liang@starfivetech.com>
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
X-MS-Office365-Filtering-Correlation-Id: 698560f7-e8f9-4286-f142-08df0f22dd30
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|7416014|376014|23010399003|6133799003|56012099006|3023799007|10067099003|22082099003|18002099003|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	N1E4nlZflgjlzW/zc3CB5tZrh1bKWcErazGRkNU+4a2QT1jURYFQC0aMQP88NF74pEpJWMHD5dJBoJ80UG3wERlTXELD/dTd+LLofbrAr2YGNeiHvom8x+MvuttOgVRgtjd1YQu9EwEoBYOB1j/Ldi6ezsqhKz3NvXy99MQVxt5TC0SJx+L9YUt2pqtaBpkVWid1R73ne0l+M7z9+9HiCeJgLINbIPO9HpFQZEqpy/p9ARO6KIRnkSv6lSpJX0PKZ3AxGHQs0j2/ifOkArawToI4yUTAFyD4hXXzyb0BQwrWDehJYlic8J6vyAg8v6de7tVb79xIgLUun12UlGrDjBlONePgDMg3WE4bGTh4ga1W0nfoLjZnCqoYRMcV3HHap0CSCndo+rqwoeRreSPfbySDdCMY0ncAkfvvqQH0/LL77jXL5vrMGKCOv75fgskltphtWOTUoVNe8gQY7f/tKlDVoxY7dEPZOzJa/iidoOub5HWOLUAKvy3rlNbFY5dryC0HU/BwfkwJcf8EM68T3CC8jSe+QTgGvmRYqwBb7wK9HMHfKWpREyz0evlp0Jfn4cq1syefX6vd6d3Upkik9w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(7416014)(376014)(23010399003)(6133799003)(56012099006)(3023799007)(10067099003)(22082099003)(18002099003)(38350700014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1Nv6h1bW+4NcFXa2nahKUWSbObOzELoMcAnh7vF29y7ScQClWugb/HGa7RIw?=
 =?us-ascii?Q?XgF2LAnPeRJS/dlqfqmbqqI1gF4B0cOzCKaS4eWwmXRUUUClVQMJGuvuSEXl?=
 =?us-ascii?Q?NKF02eABh0uNACsjv08E6cxo6zJVZTo4J1X5CfiuGoyCnzcEWUlPaQDoMOPw?=
 =?us-ascii?Q?k09WOuNUsLIv0LPrFTvWlpZH9q0fBsx6gBaPqN1xcc4AL8iROItDs/sl7qPC?=
 =?us-ascii?Q?wTobQfZvDL9LT5+3BsBbuHELLNtCTCBfCE34us5+piIYgKhdubUjzMsgsj/P?=
 =?us-ascii?Q?0NvLlFNVJJ3OH/iKOtdX/HiLAzAmgF8jMseIZS4J9JgdV4P7sQ8JawmBwa2U?=
 =?us-ascii?Q?sS2+xEFPlBfmGPVeYr2kmTtGnBrAYsCh0JyCeaRRFzSvC6iUMSZaex5rq+hr?=
 =?us-ascii?Q?06jEczddAnrc4YcLTS+MdGa6udIGmlW2dWFEqtKaUtyHJuouXTsVK4TyNJq6?=
 =?us-ascii?Q?jA8y7RfUXUp/VKq3d1Chq3OGosmoEUH6EOJxFUZKkXXX1Id9tXP8OVXr2dEL?=
 =?us-ascii?Q?tTmGYMPQo94ncwsIPz1z1Vdb0/mlUPdyWE9SE1EZNYhdKF53zsNW+zUNOisQ?=
 =?us-ascii?Q?G1Wv7sz5+Qv3UjzZU3QqrLpMj6WLHSiAdkxcoD+iLrFLhkJ78H+ryBUzCGr1?=
 =?us-ascii?Q?rA/ZTPH1c0w/wZYNynrePgqv1+rySXxT3LWw5tMnQ5fH33VoTCcPcXC+Elnd?=
 =?us-ascii?Q?DEkOjAv3xt5thIe3WLThd4EqO10PvIAoF7uTCr1qSaPAqrmb10DvOCz76f2+?=
 =?us-ascii?Q?y7rNSLhM5/mn9EL3drM5olS1qPtJWusx7UqsSQTLLGjzbWpxKfc6p68xYeJs?=
 =?us-ascii?Q?gG9F2gx2SeD0drlkmzmAe8QKqyV01db6g/oHApnfI1pKkArmLYk8xGkN79aB?=
 =?us-ascii?Q?WwK7wSve1psCrzWFRpZy4sJazkw04ZQO4ezZYt+5v5B/eN1XFGZkikk2NYDI?=
 =?us-ascii?Q?g7JE9Bwa1KL+Lo4SI918dbD0a/7kMoBiy5HHXinmU+FkfqBnjVampdaedtcw?=
 =?us-ascii?Q?8njmBueiv3i4aBxt6lXlAIaiwi1qQpEu4lCBcq9qP7X8Y0oM8zc/RRukYNUv?=
 =?us-ascii?Q?NHQ99TWQiLjC+WTtb6uCid8FibErvSWUH0b+RCJFAYBqIjSrgorMY2fT64na?=
 =?us-ascii?Q?Io/AlDPNgN1Kq5qX+FMc1sIkeokTCq1PBkwNVsX7cf8VdLiqbX76comsOxSn?=
 =?us-ascii?Q?KW2OLRL3T9EYo02aX7liZLG5I+FO9lE3qqy+MNA5gZMqlXVBfcNj3Fucq4wo?=
 =?us-ascii?Q?OyrdrIByxpgfY5XammRU+hHXQArkPK/LL/mLNiQsRZNIOcb6HSjxFkV5BVwF?=
 =?us-ascii?Q?AbeudTXwEV8xl+6rnA/BbHOYxeUQCsJ51OEXGftLytvzOm+T+Hg9qzOkzyN7?=
 =?us-ascii?Q?gHzX5oBncqIEm4+lkLqezhItZqssINxYfnyfVpG/xEALZqo4trtlpJNmsppp?=
 =?us-ascii?Q?GzW8MgvQm7aj7Ow5xM6YIGCCdgke3e0jR8Caz1rM4kPs706iXYkhGi/pP66A?=
 =?us-ascii?Q?tzNklOJI9sxWFH1Q6WQ9o//ds1BVE/YIFEXp2dCSQ/DSn/EIsiZUV75my+9n?=
 =?us-ascii?Q?DVL+anERVIRTnCDUOTERQPbKB0d3CVVrA4ErbbqRkB/5C7TSodnlVsF7T4H9?=
 =?us-ascii?Q?H8Jaagwg42wBoWPz7BOrDGYlp0Vke/5MVN1OtrIfLa0ztiPlL0QrwmDODMtm?=
 =?us-ascii?Q?ay+9dohdNaABAYeD+EZ6FF3UZVCOZyKdgftdj8lIAhewCrNQGBorr+lKoEDK?=
 =?us-ascii?Q?pR4xEEmK/DzFtvIEVcWvAjEMQPj25ESLjNJ8GlTJHHNw1JUce69Q?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 698560f7-e8f9-4286-f142-08df0f22dd30
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 10:04:12.5145
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IOYVlyGQZOzFyUFXrnohdf8RTpvPDXH1hzQhhW1GYml++qL+vQcbx5+uvBOAKOA+yJBLcBl12Vc8dzoMLoumt0ua0cgf+lUxTk1xTcHdJHC2jb2WyXpYKPEnlLOCrkew
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1233

Add pinctrl bindings for StarFive JHB100 SoC System-0(sys0) pinctrl
controller.

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 .../pinctrl/starfive,jhb100-sys0-pinctrl.yaml | 164 ++++++++++++++++++
 1 file changed, 164 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys0-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys0-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys0-pinctrl.yaml
new file mode 100644
index 000000000000..a6f8d1b5c459
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys0-pinctrl.yaml
@@ -0,0 +1,164 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/starfive,jhb100-sys0-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: StarFive JHB100 System-0 Pin Controller
+
+description: |
+  Pinctrl bindings for JHB100 RISC-V SoC from StarFive Technology Ltd.
+
+  The JHB100 SoC has 13 pinctrl domains - sys0, sys0h, sys1, sys2, per0, per1,
+  per2, per2pok, per3, adc0, adc1, emmc, and vga.
+  This document provides an overview of the "sys0" pinctrl domain.
+
+  The "sys0" domain has a pin controller which provides
+  - function selection for GPIO pads.
+  - GPIO pad configuration.
+  - GPIO interrupt handling.
+
+  In the SYS0 Pin Controller, there are 4 multi-function GPIO_PADs. Each of
+  them can be multiplexed to different hardware blocks through function
+  selection and each iopad has a maximum of up to 2 functions - 0 and 1.
+  Function 0 is the default function which is generally the GPIO function
+  (or occasionally, it can be a peripheral signal).
+  Function 1 is the alternate function or peripheral signal that can be
+  routed to the iopad. The function selection is carried out by writing
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
+      - const: starfive,jhb100-sys0-pinctrl
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
+            enum: [ auxpwrgood, gpio, hbled, pe2rst_out ]
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
+        pinctrl_sys0: pinctrl@13080000 {
+            compatible = "starfive,jhb100-sys0-pinctrl";
+            reg = <0x0 0x13080000 0x0 0x800>;
+            resets = <&sys0crg 2>;
+            interrupts = <56>;
+            interrupt-controller;
+            #interrupt-cells = <2>;
+            gpio-controller;
+            #gpio-cells = <2>;
+            gpio-ranges = <&pinctrl_sys0 0 0 4>;
+        };
+    };
-- 
2.25.1

