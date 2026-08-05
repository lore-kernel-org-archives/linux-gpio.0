Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11023116.outbound.protection.outlook.com [40.107.162.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9011A476CCD;
	Wed,  5 Aug 2026 12:35:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.116
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785933346; cv=fail; b=JzHULifOmiArSqksS2+VoAy4NE0kLIn8Fy8uKzpgHbZs02WschIw6ujYfE1BpTxtWaV6z+J06VnJ+XqgTO2vHlnNJWwhQMLe2SY8WeTClQF5W7wG28Cknh4rMXROJMm9Sy/Rm8xI8ZuG5uWo5fei+Dpzfk/aYCrFukLGrlq4bhU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785933346; c=relaxed/simple;
	bh=8KaDEP6EDMm3QgmBPRH5wFS0Gpt1hpJ3QSlA8DwLuOw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=oc3sm6uvNxPtFGFFFc1eSvEZzc0I21ub5Zw3CDxtPhMAzJzo/puuXgS94j4l7Vj1jVsN8gdgmqgn8b5Jcd8FzbNNfD6eK4++iL/gectyKgLyo/RtsNslrI48DQhCuGl8NzHEXyH0LTBg7wr72tK2Vll3rycK/Qommi6oEXUdBX0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b=MapVkvuJ; arc=fail smtp.client-ip=40.107.162.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=genexis.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b="MapVkvuJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=veccgS0TgXfW4IMOAgiNsq2D4vi9VXCjRkZ+iHCKr2ivZALSgJIpTYr9NPsckEFzwQdS+tjutrWS8sCDCUghfT1gJDVpViPtjR74sfvts4+3jHySTVk/Ix4qRZHJUlbZoxP1/Mdrrr+gkPrqIcqpME+j6WTZBfPNXoxl0G+S+lZoTcZGKP9RzZ2+qWOl6QP1jYC2pR/aW1xA82fjSIrXgTsS4AMZCLfwqBY/IoypcZCPITazQZOH3Q4CSe9QvDhZzO3/ch+gXn+ialkQUuqtlUrguZUjgS/4vgpwMywq0kagpZoJQYKuL2j73AXsSG90uDYnwEPX/+TMXwf/PJhKoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=robBuPXmrJ2qY09qM1jH0W9prIrveTCRQzGFQkGA8rg=;
 b=xf2XKLdbKDRmB/LZYOMdrDCYWRvRsmljt+CONkE0T7NPRA+QStkbwqDlPlkrHNhp0hhaPJCuwzUPp95KZ1ajU9QXKXcx1UjLopXx/3Dbwz2vAA7dEqNoQGtXbgAlNXYVx/gXCcCMRl+rwaEn3aobKYuXp8OcDBFoGgpv7UKJzh61gMEHjI56vq7l7PoNKL2UumaLWvig8FPjkcs/uJm4wE7SdP2ShtyCdSUO1q9TwIXGibSHb1vDmwLRko5gfqnRmh41c+DZ1ccqaft4U4i87WyFt6GT8hWzf1QoK+yB9ZTrSNbJ5ky1EALUFit6JgU9vN9sRMH8aUXUzd3h04wVmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=robBuPXmrJ2qY09qM1jH0W9prIrveTCRQzGFQkGA8rg=;
 b=MapVkvuJe3+49auLuh2Vm9JSZ9GUgccywRXvHP8dQVtDuNj3NTksg1zsFf4QNzvw8uVzEjwMfr86Qi0JbevhuIGQTxc3dqJ9uSHyjUXyobFRTERc9RQn7kzOHCYHkPYeZgOOFduoY2PaJ3kURMrkcETVLtpJA+lZUqTD83UpAWPlAD1P8fw4KFLreDSSaMn0rx9x3LTUams1WY0bKR6rVIhAMJJxN7LwUfAFFngI/nbTcpYB5SzBPSqmV0PLroZCMImZCbM1d7/s47RNKXYczNRHNJJe0hmTPelksWfdnBQg0QtWGxzGVuAeamPCq55WCf5tqjram0YTJee/eBC3YA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by AS4PR08MB7831.eurprd08.prod.outlook.com (2603:10a6:20b:51b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Wed, 5 Aug
 2026 12:35:29 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0292.013; Wed, 5 Aug 2026
 12:35:29 +0000
From: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
To: Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benjamin Larsson <benjamin.larsson@genexis.eu>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Markus Gothe <markus.gothe@genexis.eu>,
	Matheus Sampaio Queiroga <srherobrine20@gmail.com>,
	Daniel Schwierzeck <daniel.schwierzeck@gmail.com>
Cc: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Subject: [PATCH v10 36/36] dt-bindings: pinctrl: airoha: add support of an7563 pin controller
Date: Wed,  5 Aug 2026 15:34:08 +0300
Message-ID: <20260805123408.3767648-37-mikhail.kshevetskiy@iopsys.eu>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260805123408.3767648-1-mikhail.kshevetskiy@iopsys.eu>
References: <20260805123408.3767648-1-mikhail.kshevetskiy@iopsys.eu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0065.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ce::8) To DU2PR08MB10037.eurprd08.prod.outlook.com
 (2603:10a6:10:49a::20)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR08MB10037:EE_|AS4PR08MB7831:EE_
X-MS-Office365-Filtering-Correlation-Id: 16f072b9-738e-4b26-e11d-08def2ee08a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|376014|366016|1800799024|23010399003|11063799006|56012099006|10067099003|6133799003|22082099003|18002099003|3023799007|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	M0R59ey2hHgAdPxy5UBRD7Gof0JGRUzvSThmbaA9MY6aN+NFdHm7sLC1lRfi0NMfpwj2Oe2xUvH728oIt15+mGvgwuj4rIKl+k1K81FM8RvXvadLTpeCpYUxiPkcBGmWyINfCEYL/bmHHr+BflN8k0xmAZONWraNQBxr6mI53YyoJha5T58e1PkzSW365qglJXqT2WKLwecRFmWMqerib404K9iVh+O6vLwVjS63j8q5X9hALFc4uY0hh+WLvnhXe5mnj6M/G9wUihFsSLMRzFbAFTHgY6OtSAxWoZd4131iQB8OWN0icCFdMMRdYET1Ef1Xh37Qyk4E90EVbDWsVGInlsBXWVQruHRwiDGosjpB3jHA29owTLXRDwToHlUYS5PdLVfTTKl8ItOKfhRNV6qqB5GH2cfKUQ4LgiZlLtFAgW8Cnr1LSgIuBhl809868NupZyBdY7/tgAgtQhQ+ziNSscRWiR3VOzSUINhzMrHpMqJL5IjJBjY2oAVRZjFMmfUbB7FY2NdNyakANF5UTOo8qliCMq1dSrGpuDRGO5qm/yP6huK0y5pbWCacLwjIbKqPGmNvbat6hSOVcN+N4p5lxrvKjmcPH9XWf6c3v/wEH4I9KHGIMe8WKG+n9rdBy9eDXZDIOZpJdILUPDP0Ffk6ld9POGOJkZg8eTPpWVBoG98QMt4gsXCT6uOkM+IJ84NyVM+lPxsHt++FFWbppJFgjV5XKLyxDEhH7lweIxDo/DHqk8G/OECwXbKpaBa7
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(366016)(1800799024)(23010399003)(11063799006)(56012099006)(10067099003)(6133799003)(22082099003)(18002099003)(3023799007)(921020)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?rIO2UoZ1rBdl0l9HEMHHGx5u+uKLHrQ+w3t0AFEHD9ayXnYUqop1s7D0yfQI?=
 =?us-ascii?Q?/nWvwaa46TwYPLKXgeXsKYbympkNY0HfvcpUBftgEvLqWGSDrwjqYNcJCBSQ?=
 =?us-ascii?Q?6x2KC3zrRn+FLB7rbT/VNgkivQE2D52LaE/g3bQqXYy9Q3gpOsYqIiahnMeO?=
 =?us-ascii?Q?dO798GWCypyCJ4faCt3VQ/eFke5GDmQrzTsmSLs3NgJ0i04tUeCsg1+bHWnn?=
 =?us-ascii?Q?gFi9RlyZNnNFes/V1w6rPCOx7FXCx73YYMZhdcssi9DqQZV8bt8wOhk4so5/?=
 =?us-ascii?Q?ib+t6JxMEwOgEpX7mkZtuvYHqOxNcwAS5O3wcEDLk2h7wXkrzYxQn+CUHzHD?=
 =?us-ascii?Q?EMx9iHnBIY4q/+QZjEWXAxCZqQ40RlZ4MEh6nA+UcxF9I5lxrzUH6SyvPorF?=
 =?us-ascii?Q?flKY0QhXWiYL3T2+Ta37Y7Yof2xQUJlOkQa62a+VJuHWtzNFOXqpxdWuL2JS?=
 =?us-ascii?Q?yYLvtjkN3h3omxEx3oPLWw1zY0R03O3IFQj2Q0EV1LsbZ/DgsH+69G30EoBQ?=
 =?us-ascii?Q?5faF5zOvWgHXR+NwXEo7JtqhCZiRwp2qsUNswFBoG5FTEGpQdIdxHxnFVyd+?=
 =?us-ascii?Q?NEdAOEbESNyxAI0G2i0pWa/9833UcUuolJm2qhOMkIvXtP4MSBJ+0ER0JjSu?=
 =?us-ascii?Q?Fcmus7CW1oRBDBRTLND+gTXUUq3AIuiM3UE+U99jCs5sqaCfPyeFVqOUMixD?=
 =?us-ascii?Q?7vCnsONRCBPysHhkMPmfKoz2lDBbLarZlVQulfNwrmJUWoFfadXhwrNMvNV8?=
 =?us-ascii?Q?LLXb+b7ncipD8uqX30Mtc0eH6+AQxyF6tgvxfIuoCrybMx/Ji1Z0h11yUXm6?=
 =?us-ascii?Q?/L/oBzeKV2NGfZAJw7o++5m+tBy79TwKBrbulIdbXCrN8/y3kZi6MkzQHxFf?=
 =?us-ascii?Q?WwQ1T5H01hTOcVngpThHvIUn20SF08YPTmc8pWniNauBTKkjdtQq9tbwegkd?=
 =?us-ascii?Q?ZbZuLfCz/3iAXZHzsYULps7XeA1ZLNlLoxl/SUqAJzYlh1swLyk3ChI/CTTj?=
 =?us-ascii?Q?fd8ABihK4j5jiZYk9hn7ooSmppkfipbcKcIaK3yEaVLtL5927ozXCCtf2Bok?=
 =?us-ascii?Q?Ns8IPVL1r7n7UGSPO0s6yClK8pwmpZUMHAnvYemqeDfXy7jKFLDqx7fG34L2?=
 =?us-ascii?Q?8Y2iNrt+E/dT/3GEZiIQESKr8fa+bsgHkyylJjlTGp0vs0zq8WP+LROndWHE?=
 =?us-ascii?Q?XCGnqBSg1pE0c/PUundbHALKdl1gLUbyZA44qFMXdZSgOTk1bG3llC9mm+EC?=
 =?us-ascii?Q?krUxZ2il6py+5eabigUJCQWf77ihsk/CQFGy7GXxpWBnjZ9sPRZeUBGMK9gA?=
 =?us-ascii?Q?eFasGxT+X6Ve5i5GeVHPAohq45B5SzO3ucqfoQoEKQRtPbj/UJNnPad3Tyhs?=
 =?us-ascii?Q?xnOcMsYcHj14MDVFNRUqPtn4VjxZluD2hw8/FuD6zKPUKhm3+VZsx3pP+NZY?=
 =?us-ascii?Q?e5VdtaL+rFfD3yn0MIvK8U7bFf7Um4rgF7w4qDFtQpQDqerqrW3aa38lDgJu?=
 =?us-ascii?Q?djsltPDPTVWvLTh34J2ErDbctrC+yCOTsHn+zoKpYAWmzeYat4xwliwJn811?=
 =?us-ascii?Q?nJAzKa6uAQTecoMrcqOfzYLYKXzjAhP+yOCHOZY96GDhLjuYFXseNT4vuWem?=
 =?us-ascii?Q?VJkT/ZSFKZzzuujoPpRVKJORm3zYK/huhrwXVH7EWgzVUf8B4CkV/HXPfQrN?=
 =?us-ascii?Q?/oeW2pgpt5J5NZ/Ia9x1m2/3Mych8VjzkAgW0RW+g19bO2C/qJDU3WBqKd9J?=
 =?us-ascii?Q?yG0ZrnUTY+txW/+LUYDVkrruMixRWSs=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 16f072b9-738e-4b26-e11d-08def2ee08a5
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2026 12:35:29.5733
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N8i1JZAbl468sAwyPJlCoCQu1JLVatu94K/XFiwUfOdpIvoxea/Jl/3KxfnVs6dtdtPnmjJlckYuoOI+6KgYm1VAclPlYiHDG99kmDu3vA0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7831

This patch adds device tree binding schema for Airoha AN7563 SoC pin
controller.

Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
---
 .../pinctrl/airoha,an7563-pinctrl.yaml        | 348 ++++++++++++++++++
 1 file changed, 348 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/airoha,an7563-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/airoha,an7563-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/airoha,an7563-pinctrl.yaml
new file mode 100644
index 0000000000000..e626d34661285
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/airoha,an7563-pinctrl.yaml
@@ -0,0 +1,348 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/airoha,an7563-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Airoha AN7563 Pin Controller
+
+maintainers:
+  - Lorenzo Bianconi <lorenzo@kernel.org>
+
+description:
+  The Airoha's AN7563 Pin controller is used to control SoC pins.
+
+properties:
+  compatible:
+    const: airoha,an7563-pinctrl
+
+  interrupts:
+    maxItems: 1
+
+  gpio-controller: true
+
+  '#gpio-cells':
+    const: 2
+
+  gpio-ranges:
+    maxItems: 1
+
+  interrupt-controller: true
+
+  '#interrupt-cells':
+    const: 2
+
+allOf:
+  - $ref: pinctrl.yaml#
+
+required:
+  - compatible
+  - interrupts
+  - gpio-controller
+  - "#gpio-cells"
+  - interrupt-controller
+  - "#interrupt-cells"
+
+patternProperties:
+  '-pins$':
+    type: object
+
+    patternProperties:
+      '^mux(-|$)':
+        type: object
+
+        description:
+          pinmux configuration nodes.
+
+        $ref: /schemas/pinctrl/pinmux-node.yaml
+
+        properties:
+          function:
+            description:
+              A string containing the name of the function to mux to the group.
+            enum: [pon, sipo, mdio, uart, jtag, pcm, spi, pnand, gpio,
+                   pcie_reset, pwm, phy1_led0, phy2_led0, phy3_led0,
+                   phy4_led0, phy1_led1, phy2_led1, phy3_led1, phy4_led1]
+
+          groups:
+            description:
+              An array of strings. Each string contains the name of a group.
+
+        required:
+          - function
+          - groups
+
+        allOf:
+          - if:
+              properties:
+                function:
+                  const: pon
+            then:
+              properties:
+                groups:
+                  enum: [pon]
+          - if:
+              properties:
+                function:
+                  const: sipo
+            then:
+              properties:
+                groups:
+                  enum: [sipo, sipo_rclk]
+          - if:
+              properties:
+                function:
+                  const: mdio
+            then:
+              properties:
+                groups:
+                  enum: [mdio]
+          - if:
+              properties:
+                function:
+                  const: uart
+            then:
+              properties:
+                groups:
+                  items:
+                    enum: [hsuart, hsuart_cts_rts]
+                  maxItems: 2
+          - if:
+              properties:
+                function:
+                  const: jtag
+            then:
+              properties:
+                groups:
+                  enum: [jtag_udi, jtag_dfd]
+          - if:
+              properties:
+                function:
+                  const: pcm
+            then:
+              properties:
+                groups:
+                  enum: [pcm1, pcm2]
+          - if:
+              properties:
+                function:
+                  const: spi
+            then:
+              properties:
+                groups:
+                  items:
+                    enum: [spi_quad, spi_cs1]
+                  maxItems: 2
+          - if:
+              properties:
+                function:
+                  const: pnand
+            then:
+              properties:
+                groups:
+                  enum: [pnand]
+          - if:
+              properties:
+                function:
+                  const: gpio
+            then:
+              properties:
+                groups:
+                  enum: [gpio28, gpio29, gpio30, gpio31, gpio32,
+                         gpio33, gpio34, gpio35, gpio36, gpio37]
+          - if:
+              properties:
+                function:
+                  const: pcie_reset
+            then:
+              properties:
+                groups:
+                  enum: [pcie_reset0, pcie_reset1]
+          - if:
+              properties:
+                function:
+                  const: pwm
+            then:
+              properties:
+                groups:
+                  enum: [gpio0, gpio1, gpio2, gpio3, gpio4, gpio5, gpio6,
+                         gpio7, gpio8, gpio9, gpio10, gpio11, gpio12, gpio13,
+                         gpio14, gpio15, gpio16, gpio17, gpio18, gpio19,
+                         gpio20, gpio21, gpio22, gpio23, gpio24, gpio25,
+                         gpio26, gpio27, gpio28, gpio29, gpio30, gpio31,
+                         gpio36, gpio37]
+          - if:
+              properties:
+                function:
+                  const: phy1_led0
+            then:
+              properties:
+                groups:
+                  enum: [gpio8, gpio9, gpio10, gpio11]
+          - if:
+              properties:
+                function:
+                  const: phy2_led0
+            then:
+              properties:
+                groups:
+                  enum: [gpio8, gpio9, gpio10, gpio11]
+          - if:
+              properties:
+                function:
+                  const: phy3_led0
+            then:
+              properties:
+                groups:
+                  enum: [gpio8, gpio9, gpio10, gpio11]
+          - if:
+              properties:
+                function:
+                  const: phy4_led0
+            then:
+              properties:
+                groups:
+                  enum: [gpio8, gpio9, gpio10, gpio11]
+          - if:
+              properties:
+                function:
+                  const: phy1_led1
+            then:
+              properties:
+                groups:
+                  enum: [gpio4, gpio5, gpio6, gpio7]
+          - if:
+              properties:
+                function:
+                  const: phy2_led1
+            then:
+              properties:
+                groups:
+                  enum: [gpio4, gpio5, gpio6, gpio7]
+          - if:
+              properties:
+                function:
+                  const: phy3_led1
+            then:
+              properties:
+                groups:
+                  enum: [gpio4, gpio5, gpio6, gpio7]
+          - if:
+              properties:
+                function:
+                  const: phy4_led1
+            then:
+              properties:
+                groups:
+                  enum: [gpio4, gpio5, gpio6, gpio7]
+
+        additionalProperties: false
+
+      '^conf(-|$)':
+        type: object
+
+        description:
+          pinconf configuration nodes.
+
+        $ref: /schemas/pinctrl/pincfg-node.yaml
+
+        properties:
+          pins:
+            description:
+              An array of strings. Each string contains the name of a pin.
+            items:
+              enum: [gpio0, gpio1, gpio2, gpio3, gpio4, gpio5, gpio6, gpio7,
+                     gpio8, gpio9, gpio10, gpio11, gpio12, gpio13, gpio14,
+                     gpio15, gpio16, gpio17, gpio18, gpio19, gpio20, gpio21,
+                     gpio22, gpio23, gpio24, gpio25, gpio26, gpio27,
+                     pcie_reset0, pcie_reset1, i2c_scl, i2c_sda, spi_clk,
+                     spi_cs, spi_mosi, spi_miso, uart_txd, uart_rxd]
+            minItems: 1
+            maxItems: 38
+
+          bias-disable: true
+
+          bias-pull-up: true
+
+          bias-pull-down: true
+
+          input-enable: true
+
+          output-enable: true
+
+          output-low: true
+
+          output-high: true
+
+          drive-open-drain: true
+
+          drive-strength:
+            description:
+              Selects the drive strength for MIO pins, in mA.
+            enum: [2, 4, 6, 8]
+
+        required:
+          - pins
+
+        additionalProperties: false
+
+    additionalProperties: false
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    pinctrl {
+      compatible = "airoha,an7563-pinctrl";
+
+      interrupt-parent = <&gic>;
+      interrupts = <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>;
+
+      gpio-controller;
+      #gpio-cells = <2>;
+
+      interrupt-controller;
+      #interrupt-cells = <2>;
+
+      pcie1-rst-pins {
+        conf {
+          pins = "pcie_reset1";
+          drive-open-drain = <1>;
+        };
+      };
+
+      pwm-pins {
+        mux {
+          function = "pwm";
+          groups = "gpio18";
+        };
+      };
+
+      spi-pins {
+        mux {
+          function = "spi";
+          groups = "spi_quad", "spi_cs1";
+        };
+      };
+
+      hsuart-pins {
+        mux {
+          function = "uart";
+          groups = "hsuart", "hsuart_cts_rts";
+        };
+      };
+
+      mdio-pins {
+        mux {
+          function = "mdio";
+          groups = "mdio";
+        };
+
+        conf {
+          pins = "gpio2";
+          output-enable;
+        };
+      };
+    };
-- 
2.53.0

