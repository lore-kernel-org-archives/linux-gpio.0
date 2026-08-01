Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2113.outbound.protection.partner.outlook.cn [139.219.146.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9391326056C;
	Sat,  1 Aug 2026 13:01:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.113
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785589272; cv=fail; b=N3BLgzmgJvEUO5hLNCwU13CvqunvVzhMJ+1hRvdvio9mC4l2XZGBML1mqw6O6zJdkovIApID6jK1ASjNDltdUQtbxAuNVHRUTjTNEhNraoloOomsWgYeEhWUfCw8fZ6T+HWiZsgaxHvHrbodRGLCVf/uZ6eZRO0pmqEaWJYA04Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785589272; c=relaxed/simple;
	bh=ypPSma5gufva0247Faig85Gh8hT6NdK8ZaFXL1c9mos=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=V8rZumApXoj5+EReXLweNdxyIev3HzSbNsJ6wyMAZXmNmYMhB5uDWUONpnbRpLdS4J+mbSATccgYl1ZQw1tKHf7Ob2b+wCH1AdIzZln0oex3RvPEA4wtE/V4ljb8Yrs/uo2NjP6wUg5xbxQ3xpOexQeFZq8xLZFQTJr9SgBeiCU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.113
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dIY+8Sqpi0p3cuKFOd+xhWmA9XOAfIPjcObvlToMxJhun6OJwaXG8MOd4dpUBcbP/B4ctFboIB2W6Ap1/1ExjQhxwniAV7FmJzZEe9QX1EMlxWyDUwmbMcBOOhDpXdGtty6PWkcsNnmoa3LccHtigfaH5qyWJc1v0EEzou3LSNpCW4sXnxF/hemE5rtdnTFpoq9auWaAKB+wttkmTG8yALI/PgXXZb4tn3TvaGQdc/bnE4MjqqHjp5mJxErCfA7GtdLq+QSvCmzururpYtSLS54rh6aRaCg1F2ozdzJCKDqpSbqgUHzzCiKlUUXpvH+VvuA0UbOZuCYaxQ3br49NeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6mSdTgaM9h1qj3L/avdKtsIzrSmlb6g0qvYhD3Iz9Zc=;
 b=c92nql/AJ1sfeGFxBB1x9SPV0itV7OyHcSV9XhBO08QBilL3wRl/ArP6gJPkGEaxNKkZOEK5VGgLMnyfj1nZ90wM35rqyEOwe0Du+aGZo/Y/UGsGaYCcstWICH0ut/JqAkg+IR+gD48rRv4I9h9ZAP9824niDFWO6xZWx8APhW5Hts0e8nx34iPdYMnFTKLoB3iUQ/Ql5gugIGAjVtmcibnBWc3dz70vJbGkdui7Ms37PE0oED19dYAmEEocvIJ0N6c09txqB/tYSU6W1XmYu1X5phk4MrOduuzn1GEeyIuY8eorYtAocym8fbqx38aQlIuWRh15nHpVpSm/TxwURg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1138.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.16; Sat, 1 Aug
 2026 07:27:32 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0270.015; Sat, 1 Aug 2026 07:27:32 +0000
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
Subject: [PATCH v4 09/21] dt-bindings: pinctrl: Add starfive,jhb100-sys2-pinctrl
Date: Sat,  1 Aug 2026 00:26:59 -0700
Message-Id: <20260801072711.153217-10-changhuang.liang@starfivetech.com>
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
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1138:EE_
X-MS-Office365-Filtering-Correlation-Id: 661ef36c-e982-4813-624c-08deef9e59a0
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|376014|366016|23010399003|1800799024|6133799003|56012099006|3023799007|18002099003|22082099003|10067099003|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	mX3+dYAts3U+/zUnvK4TFhPjKX78k/UI8HWKhy0wO7JEmuX+s9oYFnH3VWZIZM7AjVeFDHGWf5Cfe8mT4Gp5bn0h8l2GnwrLE2HMgCE/ZPGSKYsdcfmHeF8UrxB46ERdnkwAvARcVswHNMa1cyRnq8caa+pKgmNSON/6U0P8491x2VgeOj5lMKEIta4Q/4tKDtFo+Roh6SIdoHTXvQnEALVeSWH1TiLOQ3TvXt1E6x79ne6QuoT9ZZgRK90M3zQfsjotEaFgvjPPqHILUrbLnBrrFVgjFEUgTvV83/eOYARxAA5h39JMJq4OQr1cijwR78g6gpB0kkGuSd7c+Tn76yKIG7lCEkKgS97nBsAi2TGYTVr0Z32ialzpkBMJWI1TiNUoreGXsXR14tv0IHGDObPWEq/x5wi6XAwL9KDel5Sgcfv5FaxnJjiDy1dMyS64rCydoqsW1XSvxu4Xnd9Ur2hRlsCX1/sPZMyVZaiKshs5r/qAiPn/XBKXcqIap9W2ZD+Ij+qCiqU9Sfk9pC/8LDMfHuQ4NCY/rCl747bt8xMOSS5nVG1PmVzp1ys40tm9BIaY/Jf1z36FPzMAWuqRiw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(366016)(23010399003)(1800799024)(6133799003)(56012099006)(3023799007)(18002099003)(22082099003)(10067099003)(921020)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8GREeBTD8ruSCeZKqfJDY3i2Z1tz3ceAy2msOHACWvBiGhnk5IBw1iKZlRWm?=
 =?us-ascii?Q?l2ZpElohzZD9UC7eNB5KaG/qrHGxFvpGs/IXVPB62WFsk5G/9qt0DSahkq1o?=
 =?us-ascii?Q?unkqta6XiEfd7ZLmo8EsBN1M6+VS/7ToBGPqx0KmHN+6twnTiVXuLXIgRm0M?=
 =?us-ascii?Q?laMaggXQ2lqVouvehgYi4Z1KHUZip/MiIHY3J7EmArVaZwyj43G7SY7c9i3D?=
 =?us-ascii?Q?fMpEnHWN7KMLG0DlYNEL6/CyD4NsoNpHLb6kxfGlsSmwQguSwYJE5nE1pCxn?=
 =?us-ascii?Q?NlnIDu3jY1WfXNCxpcs7elBnf3WHbDhIg46eOtPJSKw0Ck7US9ggkq8ZCvll?=
 =?us-ascii?Q?Kr25kyCfOCCxIUhwQxvt0LAPUnd9iqpsBF2OlWTjvdZJt37BUdumB1kfBuWA?=
 =?us-ascii?Q?Movt/EC+N2UYYwMopDZmCJTZJ0Eqs8rtVOMX6Ax2j96hRC8F9rnZz6SUiYzo?=
 =?us-ascii?Q?Hgh6aHsl5LdgKqSG/tMcZc9pPFpCOiWUsyFUHFHL90E3GbjtmxA1uch9TgGG?=
 =?us-ascii?Q?iJbCHhpfVo3Wg6Hl00OletYKqHuIgJEtsZwhrS8AUyMFw8b6uhpgtwbtDZj2?=
 =?us-ascii?Q?m9R0nUiacFrgipvxGNUsfIjTRIVI/eaG8x53ItKRM/kEkWd1cqqs1MruWFTr?=
 =?us-ascii?Q?CdtYlp94l/Wa/iU3whkVdZG7IO/ePKEhI/42xh+5VVlVfrNIDLs/4xLB/TFx?=
 =?us-ascii?Q?u5lTB/9SU2tRhJfimip1LRnmrrN5b6RoP5c19ditavNbAm2YvzQu/XqQATvp?=
 =?us-ascii?Q?96rAT7/luaE5PNCUTQshNAojET85vuUzMPundSRCmK/8UL9ObHh2oxHEaZF2?=
 =?us-ascii?Q?vP/wJcAnAPAY64YMNgmz+s5EdQxUfP8kC4wwd+D3JADUuO7HOMoAqG+PB17s?=
 =?us-ascii?Q?IA/DAPmUk21d9QB5jJc7sycLAUtC2Noc6rz9HEXyt73KDkyQn3nQp+c7057F?=
 =?us-ascii?Q?pdikawkIma1ShZf0A5pmtYRbF60OquDW4Qk6foeFMP4JEX74J1q25LiMfldQ?=
 =?us-ascii?Q?JzZ4UTxMJqpNuvsDV5dXWG4Eu1kz5LIeIs76gUwEO9JIEO6bShBommMOKQue?=
 =?us-ascii?Q?2y74SIvo8QBWjFI8SXcq+fe5nJPxt2sxNPyMAVgRxEJNjUBGM3A62Yj5EHgY?=
 =?us-ascii?Q?BY/rRYWpcItw1Ba2OUF11WfjNLT/LjxGgUoK1j1GchBxSNO8uo05S6LvB+ms?=
 =?us-ascii?Q?BPVV4GS04r5HSMT6qmtZkAKF+swkQ1csG4qS7nJLosqOsFC1K811+Q0tNuw8?=
 =?us-ascii?Q?A3wttiOrUI8JWScj7qrk2jknL8Kh0/+FA3zQHNAV2Zw/1H/lTro1xLKhhnCa?=
 =?us-ascii?Q?4atf9k5pvL6gmgsUuGf/oUddCrAW4863CvgpqICyE8VW12qD0apWuP4rTq0j?=
 =?us-ascii?Q?ozmHHY/oE8hh47PGV9o76wgKwXT5UwVlcEbIdLcGCHKtiwcXIO/kiUwnNb68?=
 =?us-ascii?Q?w3bQkYKhh8K0TlDTaeszh2MGhTsi4O4FQph8j1D6SIFkJ4bWP6W1e6zTlQNo?=
 =?us-ascii?Q?ysXzGwLTrE/453iP6+Bkh88r4duu/GtWapWJOXmeDRQuT3N/dAjTo0OAXWmm?=
 =?us-ascii?Q?GPUOy5lDkNkQcDZtLxIzqHHXMXnFZDsIWA5s31BCJKGn8K03+JHbRy5VGUd8?=
 =?us-ascii?Q?JTqcPsqlUh2CE8GPVDr7Ht8l0BY2T+OlzskAAKwXiXvY+QoUjsN3pW8oeVoZ?=
 =?us-ascii?Q?0hTreiU7meHGupi7c+RmpRw8xuEh38gffWtpB4HsYCm7OWOhc2YmNwJsuCFs?=
 =?us-ascii?Q?nekO+yY7if6vogGQ7F3+mGVr4sZRUHxfPNrV7H6h5Cilug8ZgLKz?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 661ef36c-e982-4813-624c-08deef9e59a0
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2026 07:27:32.1525
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QAZYPFKQ5yE2ZgvQ/F64lWQSW3zkdzGzjyLRcLL2MtEYgZdRzp34mFXiSaQWHQ9Za83fcwyA8z/fai3tBs+RbSJTRbSER1lex9eCeyH03XO6ENDxrVWIOhfGVjzsjjfS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1138

Add pinctrl bindings for StarFive JHB100 SoC System-2(sys2) pinctrl
controller.

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 .../pinctrl/starfive,jhb100-sys2-pinctrl.yaml | 170 ++++++++++++++++++
 .../pinctrl/starfive,jhb100-pinctrl.h         |  39 ++++
 2 files changed, 209 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys2-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys2-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys2-pinctrl.yaml
new file mode 100644
index 000000000000..1efda0c079ad
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys2-pinctrl.yaml
@@ -0,0 +1,170 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/starfive,jhb100-sys2-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: StarFive JHB100 System-2 Pin Controller
+
+description: |
+  Pinctrl bindings for JHB100 RISC-V SoC from StarFive Technology Ltd.
+
+  The JHB100 SoC has 13 pinctrl domains - sys0, sys0h, sys1, sys2, per0, per1,
+  per2, per2pok, per3, adc0, adc1, emmc, and vga.
+  This document provides an overview of the "sys2" pinctrl domain.
+
+  The "sys2" domain has a pin controller which provides
+  - function selection for GPIO pads.
+  - GPIO pad configuration.
+  - GPIO interrupt handling.
+
+  In the SYS2 Pin Controller, there are 37 multi-function GPIO_PADs. Each of
+  them can be multiplexed to different hardware blocks through function
+  selection. Each iopad has a maximum of up to 4 functions - 0, 1, 2, and 3.
+  Function 0 is the default function which is the GPIO function.
+  Function 1, 2, and 3 are the alternate functions or peripheral signals that
+  can be routed to the iopad. The function selection can be carried out by
+  writing the function number to the iopad function select register.
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
+      - const: starfive,jhb100-sys2-pinctrl
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
+            enum: [ gpio, host0_port80, host1_port80, jtag, smbalert, uart ]
+
+          bias-disable: true
+
+          bias-pull-down:
+            type: boolean
+
+          bias-pull-up:
+            type: boolean
+
+          drive-open-drain: true
+
+          drive-push-pull: true
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
+            enum: [ 1800, 3300 ]
+            description: I/O voltage in millivolt.
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
+        pinctrl_sys2: pinctrl@13082000 {
+            compatible = "starfive,jhb100-sys2-pinctrl";
+            reg = <0x0 0x13082000 0x0 0x1000>;
+            interrupts = <59>;
+            interrupt-controller;
+            #interrupt-cells = <3>;
+            gpio-controller;
+            #gpio-cells = <3>;
+            gpio-ranges = <&pinctrl_sys2 0 0 0 32>,
+                          <&pinctrl_sys2 1 0 32 5>;
+        };
+    };
diff --git a/include/dt-bindings/pinctrl/starfive,jhb100-pinctrl.h b/include/dt-bindings/pinctrl/starfive,jhb100-pinctrl.h
index 30704a5a3418..e701c30913ce 100644
--- a/include/dt-bindings/pinctrl/starfive,jhb100-pinctrl.h
+++ b/include/dt-bindings/pinctrl/starfive,jhb100-pinctrl.h
@@ -38,4 +38,43 @@
 #define PADNUM_SYS1_GPIO_A22				6
 #define PADNUM_SYS1_GPIO_A23				7
 
+/* sys2 pad numbers */
+#define PADNUM_SYS2_GPIO_A24				0
+#define PADNUM_SYS2_GPIO_A25				1
+#define PADNUM_SYS2_GPIO_A26				2
+#define PADNUM_SYS2_GPIO_A27				3
+#define PADNUM_SYS2_GPIO_A28				4
+#define PADNUM_SYS2_GPIO_A29				5
+#define PADNUM_SYS2_GPIO_A30				6
+#define PADNUM_SYS2_GPIO_A31				7
+#define PADNUM_SYS2_GPIO_A32				8
+#define PADNUM_SYS2_GPIO_A33				9
+#define PADNUM_SYS2_GPIO_A34				10
+#define PADNUM_SYS2_GPIO_A35				11
+#define PADNUM_SYS2_GPIO_A36				12
+#define PADNUM_SYS2_GPIO_A37				13
+#define PADNUM_SYS2_GPIO_A38				14
+#define PADNUM_SYS2_GPIO_A39				15
+#define PADNUM_SYS2_GPIO_A40				16
+#define PADNUM_SYS2_GPIO_A41				17
+#define PADNUM_SYS2_GPIO_A42				18
+#define PADNUM_SYS2_GPIO_A43				19
+#define PADNUM_SYS2_GPIO_A44				20
+#define PADNUM_SYS2_GPIO_A45				21
+#define PADNUM_SYS2_GPIO_A46				22
+#define PADNUM_SYS2_GPIO_A47				23
+#define PADNUM_SYS2_GPIO_A48				24
+#define PADNUM_SYS2_GPIO_A49				25
+#define PADNUM_SYS2_GPIO_A50				26
+#define PADNUM_SYS2_GPIO_A51				27
+#define PADNUM_SYS2_GPIO_A52				28
+#define PADNUM_SYS2_GPIO_A53				29
+#define PADNUM_SYS2_GPIO_A54				30
+#define PADNUM_SYS2_GPIO_A55				31
+#define PADNUM_SYS2_GPIO_A56				32
+#define PADNUM_SYS2_GPIO_A57				33
+#define PADNUM_SYS2_GPIO_A58				34
+#define PADNUM_SYS2_GPIO_A59				35
+#define PADNUM_SYS2_GPIO_A60				36
+
 #endif
-- 
2.25.1

