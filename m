Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11020118.outbound.protection.outlook.com [52.101.69.118])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCF02444705;
	Mon, 27 Jul 2026 17:43:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.118
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785174220; cv=fail; b=umed0Axx64Pla0uhrraLa5cLRqqzFc4FI030VdtmFWoWFkPaW9OA7BAB2o8LvafAfKqsqI0yphLnN0WuzDajk+ZI29zcCFAkYw10ar8YnXqA2ROgZkRBEmxsA0LiGSqIkzZdyJE+l1iq1iifFz6XBJJLmIiv6HUy0wDuHIZBEdI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785174220; c=relaxed/simple;
	bh=8KaDEP6EDMm3QgmBPRH5wFS0Gpt1hpJ3QSlA8DwLuOw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=rP/+waorm0FePNmGLhZ7oADn4c4Pzhu7U0R1/DT1iWz1oO0h3qAruicT+ui/b0Y2PjWkLRrm7WpMoPz372+mEtEM3+Zf8ST+JUu4QiZoL5c49BOKaKkrb4zSFe4pcyouJJUFcIXDMwNN7pGLuZAx4v0I3WOuDRdhlHb9A4V+KsQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b=DUfWhcKe; arc=fail smtp.client-ip=52.101.69.118
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=genexis.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b="DUfWhcKe"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dSWHaiSSF86v+N11g0gr9iSmIba/p9Mah7bLPsKrlQvYDegfLLr0MBHb3auP6fcDnDe07Q/oiIToKhpOFkfnuD9oNSxjc8/ZSIR08/tp97Q6JB772BDBwR/05k6tz+bVWSvhOo4zWLtHHEhLyagU0DlDZ5zuYe/KVaGRWDpR7dz8Y91vSNS3sSF6cNmu7lX+2jrxumLb073DihM+PVsoyDrEgfX5PRzZA1SDZ/6Y5y6UTJ9tG4zLd86br4ATGIWqr+QqVRneDzkQQW/kyTCXmufAipgvz3H3T8wNPcILe9Oyn/3+p4086QDGuGY6+V2jqPCHlDVPdBN1xLyoGTaTug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=robBuPXmrJ2qY09qM1jH0W9prIrveTCRQzGFQkGA8rg=;
 b=dtSuRNP1JHtLhzH0lvZUwg3rF8fHHw+dYGIOUrbzzWCMQzHlhBaHu9revW9CzXMIaq7aQS7WQXKn1njp+uesZRpNbo3U9e+27d02hMQA7SlRFnohHLtIsl9l3MRlzm/wHjuW1ehh7EDZrBMTJJ7QVPWA/i/WfxCIuDXxgsvzZ8PcUAyjFvGZbMdgs6Z4I0PJmwAz34kZi9YWTCnBGhpGXPG9JM4BQAavA6m+nQhU7hsnn5FXmaEUlk5TGnR2n59w6EEx/OewilvqH98nXXsL/OamFHY4rlRsWo2UPOyypXRUE7qKgrxPZ+mYE8rhk7sy32rgfL01xCtCKiJqWPEUKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=robBuPXmrJ2qY09qM1jH0W9prIrveTCRQzGFQkGA8rg=;
 b=DUfWhcKejnTqydygNJ0XLTDAgzE8qNjb3cA0lRIHSa6WA13ItQAXwrNfoXcsudCEwcAsVSjA49b3SoVz5hNrBv+h9sF6C98t21WDf1TF8eAew6Av38uQ/ATkak2Na10ZW16HtfCKX8p4hE5kRdF8fRKQ043eEvKYCCNYcVbsesFkrvpAGXKPPlg0KRxtSO1PFho/4kYyco3EZowvrtGjTLuYA/Xh+dgYdxkgdk0i7L4Z4TVHewmtG8VHJvE1zZD9gt2ZAhI/Xpi13jOw+sVBkVy1B+QsZNTvtXKDbRaHxZB75dRObrhgd7vCebqtFKu2uuaEas2PnFobQ0NeQorL6A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by PA4PR08MB6111.eurprd08.prod.outlook.com (2603:10a6:102:e3::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.12; Mon, 27 Jul
 2026 17:43:15 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0245.012; Mon, 27 Jul 2026
 17:43:15 +0000
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
Subject: [PATCH v8 35/35] dt-bindings: pinctrl: airoha: add support of an7563 pin controller
Date: Mon, 27 Jul 2026 20:41:41 +0300
Message-ID: <20260727174141.664933-36-mikhail.kshevetskiy@iopsys.eu>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260727174141.664933-1-mikhail.kshevetskiy@iopsys.eu>
References: <20260727174141.664933-1-mikhail.kshevetskiy@iopsys.eu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS4P189CA0064.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:659::24) To DU2PR08MB10037.eurprd08.prod.outlook.com
 (2603:10a6:10:49a::20)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR08MB10037:EE_|PA4PR08MB6111:EE_
X-MS-Office365-Filtering-Correlation-Id: a1a166d5-451d-4a86-11b0-08deec067b48
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|7416014|376014|52116014|366016|11063799006|10067099003|56012099006|6133799003|3023799007|18002099003|22082099003|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	c3NENEUwF2eJYtDWBJZo/5MU1K29JIstaTc41uyABrQQPshr5rS4/5Uca63LifvLUs332qWdSZTirL8OdQ3p94mKxKnVAhSaEs6dTwyADMo1KS28xqNOt4NGObOohJkx4QrKYbOsezVejD9FakuT32YJBY74wb2tOGD9RrymUni1UewGvuLTNJwuH2TnXdXsx76orYsHcWOPdqbvyMwcV0/HE9CQP9YidLQmuaPCTa/FYFgF5q/RbelQKT8ghk78GBV0L/KQkRxg5Nd9N11ozk9x0sTmoA5vVS8GSA0JVLBvDw95vXFQAC5tOsM6GczCISS3XnBM4pnF7vnLeuYYyVAcTXDT1+0VNi3aQqZANcWNkLe2h/9Xezs1wtYCUsHvMWvhfGgoGEojJU0a79mD8aE+uDnCYSZDPqSWEH7uSoRH4S6vR7emE2kqFNeI/xOOtN6SY+8eRC66kfOokAN26Q+mHoV8R1Ph8ACJ5d6haYvqG1ZJ1UKRgZ1YhxWyobJOcDZE5br/nwTTIbxA0/z7LGwArb7ROGLTCpj//Vp98LcdatuH6zoltdREbTrLDiSonYvnVSlddX7NCMXyp7f0yZJ0jxc+XmhZsM0dkuqahPdTaxBq4pysRT+0qQ+t0VPFNQw7V0EXqr1ySIhWMtdSWWeKpluXDuzobdCDckpriujL7a0CRtPapIQwstV4eGNP
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(7416014)(376014)(52116014)(366016)(11063799006)(10067099003)(56012099006)(6133799003)(3023799007)(18002099003)(22082099003)(38350700014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/YH58kSHvcrQlmghoThECOi56MLM85TpxGi0hIkl9ReHcogjEIH4LQNVJpx2?=
 =?us-ascii?Q?SD5bVGJeuxZH54PwuGQR6iv1UsZ5zopkUV3WRm/ndpFpOXx/Yo07I6fg3gIb?=
 =?us-ascii?Q?Kzii0Zhxd8feGHHFaGmMEdYyn6juufBZrmYULU9OTl+7o1m18qsj3NWUSjJj?=
 =?us-ascii?Q?9Rmlw7f9fck5zPDjtk1hxgnew9Exm2dGJ7AJZQiXq5WIPOjG+F/KAFWHSB5q?=
 =?us-ascii?Q?fShdpGhpmuBKfH3z8A2vA5ZmAx0MRWA8T2Gwst6R5eJA69D5V4HPela1Fh24?=
 =?us-ascii?Q?lldUFe3kkUvwyY+SZxgVeQKmmGaz1iVTPNBWXmgqaQnQEdYyR267xSA+f2NI?=
 =?us-ascii?Q?lBthz0mRrqZ1MKDrIPiYwcJRzd066/Q/GpuPvSpA/7cObP6X6QMyo0HkgDQh?=
 =?us-ascii?Q?mXTb3kRZ9yNvd7rzRT4HFGmW1mSB8wXTo/CvI2kfBlE86h7HCGQftscD7c8G?=
 =?us-ascii?Q?An8m+Y1iVSzuTKrn6oP+OZEG8eG/LZZJVaWiEhXnEbiwWVbc/sk4F2IaRoFW?=
 =?us-ascii?Q?9SPoyJPwpXGnj7HouH3iKUh/pel/2Sx/BT6ns6P57hkry63xRlpr1eq2CkWV?=
 =?us-ascii?Q?hVpyJfM+wUYQbP5ckNHCWB9cYA/1/+sgNvhAxU+C/cmQ1gz+CdlReIwB0hq/?=
 =?us-ascii?Q?78wbMBTJZVjmaFcRZOB0lgzmU8mskPlsPEcGC1+gqxNFR0DZYRx+GtvqLQ/9?=
 =?us-ascii?Q?SdurvCzBLu+nIs46tVUZEBOQiNs8sByhEn5GN15hIeck9MWhu5R+c2BEnEbf?=
 =?us-ascii?Q?EikQEWcVmfip1F0eQA3pYVMOmBMN+wEqfVqHOkZwjC7fNkSzakYpUiSHF9DV?=
 =?us-ascii?Q?rOM2yNx+8u3y9tDXH0kHvHNrrwYOqcRI1cJJJbAyhgZh2j+bkVHEBduKjWAe?=
 =?us-ascii?Q?GvAPLjFl7YRuJXvZafjuH3MQpDL9LP9Ji0ukYsGxLIMX5h3sHS171KlX6yEW?=
 =?us-ascii?Q?dtihbgfeB39CWWKVYX3Oubg/kzoZe8cTC2r3i/g4V0K0PHq13s3k4xWLx9S6?=
 =?us-ascii?Q?Rpoyg0fwACnaeTtaIpetS5FHd/NDjUB+Z9XygYFIQyQgaa2X2qAT2LIhDqoy?=
 =?us-ascii?Q?yMVqwDBNS9/kretd2nZ6KZbiJRGV/c4m20fnB2PhFfuPoNuNoqIpC51U46lE?=
 =?us-ascii?Q?wGWrZlCrxbX7fUoFWNjytzhD4RlMoIBUPyLHixbGs0/6jH0/ufd+z2UAEQhl?=
 =?us-ascii?Q?DFzCMHWMhzEOxFcA9zos45M4XI7X1HEwab/K4zBOqlulLv4wps7udeMmNGRs?=
 =?us-ascii?Q?kyjP1F9Ab/D9B2jCIgULsQ6O3qSD3hnsXWi+GTQKCQYBntzYXgJt8Odk5uuf?=
 =?us-ascii?Q?9N+U196wdgz3CV9/hgV2Rr7J0WI+gwfnhYG7OPym85mWSLGdNW680lxxFsP5?=
 =?us-ascii?Q?A6Zt/UrGytvKoOFSvEu38W857OoL8m57ldhH2iZL/nVgZZG535zJDFIypzus?=
 =?us-ascii?Q?PG89Mxq/qm0Ivf0GSyACVy9jPMjR9yEawc/B6HZenHRetn+RgpyZ03eaPTmE?=
 =?us-ascii?Q?fdmWpck/CVRRE4d4jJnyO8YiAiz5CozcX+gdDomAo3o/iLuOb6BOwdhq9NgC?=
 =?us-ascii?Q?WvDxmDza6eHDKQBsSVHnpUmfTEYdmvX0yl6NaH6EpVo6AHYZKQJLJBNHIsHc?=
 =?us-ascii?Q?Ube8qy21S8ZP4JgIvXWrUPjQSXNTyYiAO9fpRtxPng71sJITV8XvbWsxM7jQ?=
 =?us-ascii?Q?jc+ODFIAVOFnPhDa5t7uGGz8z4vwWkSZk++pIRYxNZy4H0egB0aJNvkboHyr?=
 =?us-ascii?Q?qcZB/lg/E2ubnJV8Qe2jgd6JMLfddwo=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: a1a166d5-451d-4a86-11b0-08deec067b48
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 17:42:51.6946
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WydpeexPTiwaYwX53C/R1S4jG3ZwR2PRP8L6vIB/nvw8H8iash5GVZrbdhqgfATlzHrhnU0kzea92suI5Yi7voGwkrqzRc/1KFWodXmCUx0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6111

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

