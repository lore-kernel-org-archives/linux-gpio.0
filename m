Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11020142.outbound.protection.outlook.com [52.101.84.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16E173F3299;
	Mon, 27 Jul 2026 07:43:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.142
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785138237; cv=fail; b=Pm7K25cqqHj8zgrhtiIW2ypm6OWFjSc8q6FF/V+hyVwbSGqWrVIljeOGD7nUV0giOg0XtWQsGoBACQL+i8AuwP8AUn73cG6W0E0gvc1E/QAKhtoNbWXqaemGTie6XVoCSgSTp2yWgz0D+MByrCH+H08u9pulX/dJ7lpPnhIfRWA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785138237; c=relaxed/simple;
	bh=VaQgO4YAwytQ2Xcrpjs7FFmfC3MDiSMkJCr4wGqcCwE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jf4PdZRoEqS2wxXvY2iWR4CLksnxy3N0RW195asJEQ8bQdP/PaI7Smulp2tYR/qlYWcWUoa+wA3b216iuqdkynSR4ymQ3w36ok814AiHHtAbwmGDD79+d/O4jlCr9rjngWFTV5WRPhc72QrJFgtEHLGGLRwcmt9Nzyod4wLpIvA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b=haIml7DI; arc=fail smtp.client-ip=52.101.84.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=genexis.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b="haIml7DI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z7ojGEPJVfgw7XYM4BOEDWjnbFers2/flMUMDAC6V0bMLDESndiWvSAQzWzNCf0WbLBE/A5/SEEMjvl3gCY9ZpQbegJO4kGn38rv5TLPyVYEuX5uDgPq/5F0bZTTyYNtKaVi7ULnzUzFKDJ0UT8c5P+QlaFhSN2H2oCxA2NienBtC2XosBPr6Qdo1FAriDmpGUDus/kQ+R4eEc4YzB3UrLzHs26QVGIsCqj3AQ3/ngx9R/YjXk/6WgojfkGnsuFs/letHnxqVcXBISdSN6hWpWnvaIoI8xdWgEPpq5hCIxZ9MaTbP2898Z0ioFSMES1+MRwOgWIH9pwwSHdnru2OJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nRzbrUma1V+4pJ6PcxpTr773PZbRSQg0GZEx4bNNvFM=;
 b=eaWhMV3ShpK0Ht76I7b2Tc3WXhnHHqJY7orLPKHHVz9hLq4NB5iUI3Qja+2E4xJ0XLMy0Ha6W4dZBrAvqOVBtEB/X22t7sY0w53LOm+lmj+iD/PAvj6SrPTKcr6W6YABBTthLE35943aRl+aYsX3+HoK3hm9515nEyfRJp+d6WbYBTWm20784DJ8EEWRs2lECoX+t1XOIuX5k+VpH1LIP4aEISLeRmVn3WqF+LGjHC3zGstVwJVPt1ihrb1Mge43a5VuiWelODjNxdA+R9FFYFzeGO0snJp/ibAOW/IQ65lGxUl08ZKDOGYtDZdaRKM1qDIYtpKsgVlwWvfsKXVBLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nRzbrUma1V+4pJ6PcxpTr773PZbRSQg0GZEx4bNNvFM=;
 b=haIml7DIFLP/WDoTUZPdG9e1vPBCPBHMyDfj8T/bUpq7lu4RdSVs75lCwHKm8rQTKPXx8crmec0Rb1OJDJgMOe1fRDVusXj+qt/cd2IXt+UCYKbCzeXBEy16ANeQd/r2HqBnCbtLRI3CMcwQqYEz9Eg8spdAYBfqk7YF5D0zOKheu77AnpfCEktdfqoVYUF541CbUmHQWmLZ9Ugnj0TXaue8QQItmgth6agJUZnc88zd9jhkXIimLaeH98jBEB1SzYwP2GtPgBk+uNLVzx4pbqWWPIMv6u+UHdALQVMUHmNYdG5OIaVTk8HnbnNczelqovZG2JgAZJAfEWLfG9ndaQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by FRZPR08MB11139.eurprd08.prod.outlook.com (2603:10a6:d10:13b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Mon, 27 Jul
 2026 07:43:49 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0245.012; Mon, 27 Jul 2026
 07:43:49 +0000
From: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
To: Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Benjamin Larsson <benjamin.larsson@genexis.eu>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Markus Gothe <markus.gothe@genexis.eu>,
	Matheus Sampaio Queiroga <srherobrine20@gmail.com>
Cc: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Subject: [PATCH v7 32/34] dt-bindings: pinctrl: airoha: add support of en7523 pin controller
Date: Mon, 27 Jul 2026 10:42:32 +0300
Message-ID: <20260727074234.3761170-33-mikhail.kshevetskiy@iopsys.eu>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260727074234.3761170-1-mikhail.kshevetskiy@iopsys.eu>
References: <20260727074234.3761170-1-mikhail.kshevetskiy@iopsys.eu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR5P281CA0051.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f0::20) To DU2PR08MB10037.eurprd08.prod.outlook.com
 (2603:10a6:10:49a::20)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR08MB10037:EE_|FRZPR08MB11139:EE_
X-MS-Office365-Filtering-Correlation-Id: daf5bf6f-fa29-49eb-6974-08deebb2cbb8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|52116014|366016|376014|7416014|11063799006|56012099006|10067099003|6133799003|3023799007|22082099003|18002099003|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	i5Ak+I5HAwtJDPsf52rZC78os6BgjCT9iTJubuaGaLPijSB23ZuIkZOgeTc2DqTlzM11Ti2RFwbqoU9s119ozlCwC/r+vGyQyBN0Pp1MR1g9hpL/P3D8mdoaY8+o2R3M+rNYzTK94KcTac+rC3b3n8iSBTf/q2yn1K+9DSOA2h7Dr2JO82owOmxfVggXW5iCQ3t0e53PfwDz8RP1MgADLtjjyhf3LNI9UqtdCl1CuLaTm+snby3C/QCtL4wfS+4DdiMWwSCK+j8ZzFAoLyFCfDgqHSG+HPsVj8v9S5SozHw06CP057Z0aKOB3jgVt3pvg2QxSGOFomFsyUsgrnnk7McEfRnb9qle979nHqXpETuPBZDoJvj7obFzLpXy+17SV46ceUlL2o1K02eUgzyEOST7b/tEBVMfW6eq5ck53GYBSaD5LNBcpZTUgA2XQsvSDefm3P4k5rNDKQTZ5RFUiGJkHK9VTXsysfrzI56L6xLqyfPSn3KqvIp2OSAynfJBvWqrg3YAh88Yqw2/qMjJ1B4iRkcoCC1Gm2I8ZgQ5bgMByoOh62NRQWmnWIbzIbX3LARc+FZq3Q0+7Xft0WwmZrss2SizcHofVC4hDy9N8GOMaW4Xd+OkUWteDv+Qxj7Z1sm8tjzIVhq/m786u6NBpSwzUWpGWOMqeuwQjJGbMgYRYcwI+PSkdfFXaCo6pzb3
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(52116014)(366016)(376014)(7416014)(11063799006)(56012099006)(10067099003)(6133799003)(3023799007)(22082099003)(18002099003)(38350700014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?zp7LXj8YP7YQcr15uiAmzoe31X39NGiJpo21bY0Ic5NjXXomfjSe8nWGE2gt?=
 =?us-ascii?Q?gaq8ktghGFpZTCzLo3cRnT4qb+/lLS82jOk/au/BjkrXYAmRY42R1C3B/h8g?=
 =?us-ascii?Q?I35oKsN5ACe0Rjx+Ugz4AD8tPI4aNWD+5nWJ9q0meuHg/wKJhXreToNEjta8?=
 =?us-ascii?Q?qucyAt5or0Jp+cAkOhx7ZcaVlpGXCxCJ/usgcnIbYYtGdycmaFoz+Yxr6+Bw?=
 =?us-ascii?Q?ZFlAhK/MEz/ZUBoT8JsLX0FGvjRmBQOmBp/eLxR30DqZQCt2wqmX8v7EQU+Q?=
 =?us-ascii?Q?17NLwMiqijacfKG9wBgxgTu7SboITfjv0NesjdE5V6Bc0DPQtMQKHx5tBaOI?=
 =?us-ascii?Q?EeAsUzGrKNzztK3nXowPC14nEjoGe6umyY0gsBNu7n1gZSpV8zW/ccFh6bL6?=
 =?us-ascii?Q?YsOmandbsr10aoqgm/zdjJO8L+bgI8iHQSgCMTTIDkp5/f4u6iuGtcxtwBcl?=
 =?us-ascii?Q?74JS5q+rEfrpdQ0EV/8uE+DWiv94qTi9K8m2dH6/WOfs7SK4T4/pWDBWU/OW?=
 =?us-ascii?Q?aV8vOLkbMkVW5ybPmk09r2dzcCO8KDLazhoTh6V/sFAki+yTaB45/53LhCAC?=
 =?us-ascii?Q?FqfijV9u7ebMtZFiHN9o56+6DsVBYGBo+/+iuH8FCjF6TmRNOvxzYo49N0bf?=
 =?us-ascii?Q?ex6bz3LiVxoUkKZclxXVzNnwrqEvj8ZPFqM1etfKCPX8VvUBIbw0HzxrQS1H?=
 =?us-ascii?Q?tui0ebNyVpvw2SRI9+buF9q55HjohYMWo5VzgPLZgCnGUaGnu5wll4cm/E0W?=
 =?us-ascii?Q?vMhV2pUyPY7dWbyKYqWLjXIQ9uhAvrTzQBzgYvz3PlvZ6otWOzAO3HeQLPfH?=
 =?us-ascii?Q?FTd52mNqG7oBz8pA0Xla0QDM+5dwK8iOyzhg/GaoYpGwoe6hESmsylGaJpeA?=
 =?us-ascii?Q?KcXVGuwD7Ry0+1GRp9weXTzJsO9pzAwrs2/pyZ0IWqd5Ds36vpMRBqECf/wi?=
 =?us-ascii?Q?mW4C9U2b+9I7WK/uU42n7GKxysZV0EVfTLBgkjanC4gpA4uDNITzaI1jw0Lb?=
 =?us-ascii?Q?uq6eWmQ4fWZoNe4fkTOXHOy60IsG31FMqKgamcfJAAB1QYrfTgVmbvnaERiz?=
 =?us-ascii?Q?kyqDBQ8baQAbPNT7zoTN2pQCfVgeAi4ID6TEm9wAHGVzz/dLRRa16pOQvk5N?=
 =?us-ascii?Q?N9wGvjjwBj6PzKyLRy5JiWyUniaoFnhuCsjXkUIMfG8pIZ9nwX4nS6eYsBTI?=
 =?us-ascii?Q?CMYaieqpqg48khr3aE7jaYn9p+UwVZE36bejrmLhzW1IFtY3fvNqTOoFWRnE?=
 =?us-ascii?Q?g30sJa6ERaEfZUA7ERKJKP+JPBn39X9h9vZG0awmAAOFizVjzuVeQJ/p2H1n?=
 =?us-ascii?Q?i3yEMIabNO0O3bzFN/1i4+SS72BdlEakMqrgaIy2fjC/FdSVHJTwT3p3oFk8?=
 =?us-ascii?Q?vdC02P1+L+qHIVtLUj6vXiFnehmE76Px1WVA/7r840JB5id3MR2ivhA3bKzg?=
 =?us-ascii?Q?yiIvrUDiF2Sk3dqxl2HVXnrqS1bOG2XEq9bIpVU04QqANH6SzIfOttpOyFpo?=
 =?us-ascii?Q?U90qQC+8+Q1tkEuwWXc4HdCxvYZfh4fBZ7DsekpAOtFBzTx0MqaNXqimuoa9?=
 =?us-ascii?Q?jabojHd7KxWF/vDUJXNiXIw1a9T2G8nw2nSaMkTWOsuoPnCt5oc4YyZ2m778?=
 =?us-ascii?Q?EORF/6Ir2jKJOu86wDsljH8VLCWkJTqGTa5nGzrauO1xz5WwuSn39n9Deo8c?=
 =?us-ascii?Q?Q+sOd5fl7Tvm8X1lfV9vtpVAdm7+dK+LgLu7vu7kcTy67TZ0/1p4tETkTDd9?=
 =?us-ascii?Q?+iRwpNRz6lpPSC1C58dh9JQ0K6qmzlg=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: daf5bf6f-fa29-49eb-6974-08deebb2cbb8
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 07:43:48.9818
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3XGQziVlFGMFmX9pQEp9AjTk4o6XzzS6gvNE5XgheUxKkwAT6Kzu5+uHwz1VcPQBraF3GCQJCmTweQDza3sv67Hk9eaGvGLsIl2OexXJoA8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRZPR08MB11139

This patch adds device tree binding schema for Airoha EN7523 SoC pin
controller.

Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
---
 .../pinctrl/airoha,en7523-pinctrl.yaml        | 375 ++++++++++++++++++
 1 file changed, 375 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/airoha,en7523-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/airoha,en7523-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/airoha,en7523-pinctrl.yaml
new file mode 100644
index 0000000000000..db8e39af1a152
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/airoha,en7523-pinctrl.yaml
@@ -0,0 +1,375 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/airoha,en7523-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Airoha EN7523 Pin Controller
+
+maintainers:
+  - Lorenzo Bianconi <lorenzo@kernel.org>
+
+description:
+  The Airoha's EN7523 Pin controller is used to control SoC pins.
+
+properties:
+  compatible:
+    const: airoha,en7523-pinctrl
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
+            enum: [pon, tod_1pps, sipo, mdio, uart, i2c, jtag, pcm, spi,
+                   pcm_spi, i2s, gpio, pcie_reset, pwm, phy1_led0,
+                   phy2_led0, phy3_led0, phy4_led0, phy1_led1, phy2_led1,
+                   phy3_led1, phy4_led1]
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
+                  const: tod_1pps
+            then:
+              properties:
+                groups:
+                  enum: [pon_tod_1pps, gsw_tod_1pps]
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
+                    enum: [uart2, npu_uart]
+                  maxItems: 2
+          - if:
+              properties:
+                function:
+                  const: i2c
+            then:
+              properties:
+                groups:
+                  enum: [i2c1]
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
+                  const: pcm_spi
+            then:
+              properties:
+                groups:
+                  items:
+                    enum: [pcm_spi, pcm_spi_int, pcm_spi_rst, pcm_spi_cs1,
+                           pcm_spi_cs2_p156, pcm_spi_cs2_p128, pcm_spi_cs3,
+                           pcm_spi_cs4]
+                  maxItems: 7
+          - if:
+              properties:
+                function:
+                  const: i2s
+            then:
+              properties:
+                groups:
+                  enum: [i2s]
+          - if:
+              properties:
+                function:
+                  const: gpio
+            then:
+              properties:
+                groups:
+                  enum: [gpio28, gpio29]
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
+                         gpio26, gpio27, gpio28, gpio29]
+          - if:
+              properties:
+                function:
+                  const: phy1_led0
+            then:
+              properties:
+                groups:
+                  enum: [gpio22, gpio23, gpio24, gpio25]
+          - if:
+              properties:
+                function:
+                  const: phy2_led0
+            then:
+              properties:
+                groups:
+                  enum: [gpio22, gpio23, gpio24, gpio25]
+          - if:
+              properties:
+                function:
+                  const: phy3_led0
+            then:
+              properties:
+                groups:
+                  enum: [gpio22, gpio23, gpio24, gpio25]
+          - if:
+              properties:
+                function:
+                  const: phy4_led0
+            then:
+              properties:
+                groups:
+                  enum: [gpio22, gpio23, gpio24, gpio25]
+          - if:
+              properties:
+                function:
+                  const: phy1_led1
+            then:
+              properties:
+                groups:
+                  enum: [gpio7, gpio6, gpio5, gpio4]
+          - if:
+              properties:
+                function:
+                  const: phy2_led1
+            then:
+              properties:
+                groups:
+                  enum: [gpio7, gpio6, gpio5, gpio4]
+          - if:
+              properties:
+                function:
+                  const: phy3_led1
+            then:
+              properties:
+                groups:
+                  enum: [gpio7, gpio6, gpio5, gpio4]
+          - if:
+              properties:
+                function:
+                  const: phy4_led1
+            then:
+              properties:
+                groups:
+                  enum: [gpio7, gpio6, gpio5, gpio4]
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
+              enum: [i2c_sda, i2c_scl, spi_cs0, spi_clk, spi_mosi, spi_miso,
+                     uart1_txd, uart1_rxd, gpio0, gpio1, gpio2, gpio3, gpio4,
+                     gpio5, gpio6, gpio7, gpio8, gpio9, gpio10, gpio11, gpio12,
+                     gpio13, gpio14, gpio15, gpio16, gpio17, gpio18, gpio19,
+                     gpio20, gpio21, gpio22, gpio23, gpio24, gpio25, gpio26,
+                     gpio27, pcie_reset0, pcie_reset1]
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
+      compatible = "airoha,en7523-pinctrl";
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
+      uart2-pins {
+        mux {
+          function = "uart";
+          groups = "uart2";
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

