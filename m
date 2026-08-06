Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11023093.outbound.protection.outlook.com [40.107.159.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20E0F4F798C;
	Thu,  6 Aug 2026 22:07:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.93
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786054058; cv=fail; b=R9j9drSRMZjyLr/riqxgYkDbTp2ywfuovg+0s0ZNAfZmroCb5f3jG62hEWF2OddHJN1/VrkaKWFlCyDpq1CziL3GrXZ1xJiTHrGyQRRFFoYsFP8R9KNXMAhIj9kU99KOsUQ6cf0WsjxNIrSh+qDcJeur00l7TIkmPvt95AkRM2c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786054058; c=relaxed/simple;
	bh=p7adsl1pdyEcTwlDQN/PEB2alK34UbQ1N9nCd4NeXPQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=llMooevtrbByu6VG23I3q2wT+0Vd2pUdar6s1uXa2ixI9Co5lzwYAH+RrorbY05Fn8CysxRuTlksnSpPRHEKD1F4Wot0A3Mh6UcgH3ZURbnJfIa2sNAQ0+GWZZI/8UKLSTpBrbVaczb173Xt10n4nhipy/Jl+vOSFUJHpIy1U5U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b=fBq+kpeJ; arc=fail smtp.client-ip=40.107.159.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=genexis.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b="fBq+kpeJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=olUIbH8Mf3FulTpSjeCk3IKAXql7yTHYRKBzdpsDV1gF822Ywf6NRm/RvypfMY9uFKZOHnq2jmuoEj+ps9ZIvdwPQznKp2YbukCDvE5ORuq6Qx63vhFQkOWdUiAh7pCKTB2ftEjvxfSF8rwJs/jizyWlZAV0/YBXvQ+OxVHUZHylRyW8GeP6p/ARBQ2Sir5nUgQGdmv7/51QwYcOM/+QWfmSaHrElZE9SVW1ftUdJx+PlwrqVFRA+zoCHR25M4nsMcAgQAc+L2LYgJ14/P7og/O6WcCmDbIdIctQhUiUqSLHjcqjNWw3aB8tk69q0cl1aQuTFyfYCocA2JKJfPjzdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CFPaRGU9oGAI2SM3iE1cus8absod+eRk6az4rJnUfro=;
 b=HesH8mrb44twmiwFfeI2nPEHn9Clfw7Wsape2dsRdS7pJhOyEVOCoO22B+B9eADZbhj0nm/fjkpVzlck2b8ym4uMYh/AfmHCQmB1pMrs/t7f2YiOpwLzi+7eg32ijhX3s7xysimLfE7eV+YhRt0AWX63rnrSufUigGcFpuutf3V6vz5fuEuaVDFxDo3XygwA7+f7PZgWT2AaOMbMnORV3txakNWlZffaJRVD2cAuS9L7rjumLHE5uSsCjW6DU1WYoRuTM2mQW6otT27QQ4IkPsFO2uFrH8IAY2Z5AvtgGArjdpKvoyZ/i21cbc9/y9T4QIZMn8MCbd15UE42KU+adA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CFPaRGU9oGAI2SM3iE1cus8absod+eRk6az4rJnUfro=;
 b=fBq+kpeJdyx7mVmo12E13G0k1FJEeEWysO1xWpJr7hrT0PqlP5WHWvOluxj2p8RQYhB7cAb58UfKsjUTGSFpfe8CswaIGJeBV7hiXXo/9ej7onuYn+CiOfa1tTTe/LpiW5DAORd+ZF0JaV2fZU5b2wWh2o4LiocoCKXFq3NX6VU1GkneklJy8pNBTFkTN/lFgykjWIcJWV/LN3YjYI45w2VBuKGW4onuRygcpa9dglOn2cHaNhZjETasBIh6Ytkmp77fDxKY2qJ9YE3k5LpYVn+kMKrivQarwSlUMflpaJKUq/VBizTNfShntrmdtXv090zbRau8jRf4vatJFQPdGA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by GV2PR08MB9374.eurprd08.prod.outlook.com (2603:10a6:150:d0::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.19; Thu, 6 Aug
 2026 22:07:31 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0292.013; Thu, 6 Aug 2026
 22:07:31 +0000
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
Subject: [PATCH v11 36/37] dt-bindings: pinctrl: airoha: add support of an7563 pin controller
Date: Fri,  7 Aug 2026 01:06:14 +0300
Message-ID: <20260806220615.4078303-37-mikhail.kshevetskiy@iopsys.eu>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260806220615.4078303-1-mikhail.kshevetskiy@iopsys.eu>
References: <20260806220615.4078303-1-mikhail.kshevetskiy@iopsys.eu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR3P281CA0102.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a1::17) To DU2PR08MB10037.eurprd08.prod.outlook.com
 (2603:10a6:10:49a::20)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR08MB10037:EE_|GV2PR08MB9374:EE_
X-MS-Office365-Filtering-Correlation-Id: 95e51907-c7c1-4493-d025-08def4071c6c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|52116014|23010399003|366016|1800799024|921020|38350700014|6133799003|10067099003|11063799006|56012099006|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	8tNn8pu4z56rtYLNHWXDNVSAdU82bnntIQ+PpYJsVHKp0zog6vWei4wFRejqlV3pJULr+F3VT89OAfkxg9zCuG7RB9j3hK9fnUCazofCLFKQ8yYIvMcNKmChsg4C1/MvQTgoBD9eBEm+kJFP1hehaPkKmAWqCEM1D+iUfoOTMIAGJOPEgOftdZ3QQJFlbfe5gHDd6bZ06pg1VTWFG2Xf6hCk/fPfhtxZTc44jtQYdL3B3DIjXrIhGEJinwxy1FOR2WhZhoj1viKZn/6Lq1KzybVYVyVDd1K3WCyBgQv8Lo7tozepoLKZnb8g9JU9116UrzhWy3au7ro30/GR7wYGgj2MQ17O3oC86X7Hf3QWCtGFhyZ8p58x/6iw3c4HrffTzKf0kWGASekIFd77COqdKrPaKnaTgXO3xtD0PP3nDq8Q8zsdlOABziC4ucRWjVF0NHMQpaABf3K6PGryje6JjEprY+e3tENC6nFeMsDtgMQWDC4aiSJLC4FESO5npGT0nmxIsvTGKLQAgYJNJd4YMazq1aV8mapEBrygN9+mE61TViztemldytHCNyM5Yz6CmU4bAqkI/Jw8B48ct2HRlZrHVoIkqFLEzCqEkH4RuCTSU711VoKPTZdpZHabI2vvaj5neXdqWux+pgRhrDPNomlQkFuoqGwQyhrCtv9SE0IrW/LZGjIipcSGhd0Ywfd7JLTcs/P3KuKh5aVguC1swqP+1RmilL9Ok2Twd3PHeJSznm6Wd1SBOrwgFIyEZKcj
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(23010399003)(366016)(1800799024)(921020)(38350700014)(6133799003)(10067099003)(11063799006)(56012099006)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6CEtAJeLVjAqZ04nsUFHLIuuYzs9FFRmtSTQ/NWhKdadT5cM0eLGqmpFCqKf?=
 =?us-ascii?Q?3M6mc4l+VMK1FC4B0TtzpjPHOrXJO+raofHewxjLSoKkcgzIW6c+UAblhYWc?=
 =?us-ascii?Q?9VHC2DBTOXko9cEh7F5FYtdVvfT6lXoWkVomyJpD+czA4uNngdr9+FhuTuU1?=
 =?us-ascii?Q?dbj+iNa/EWgZvwa92G6jnOkNWcu0xE5zdc3159d2+Y1CfpFVAY2Ren0k2a9X?=
 =?us-ascii?Q?YaxnkUiw4HenBR3BhErQ+eOFUGI57f0hCgmTGMVPP7FyQh4AUnEVSCh5Wskp?=
 =?us-ascii?Q?iK6L1WmPtj4gSsmx6T9GkzOzMiIruEpjiaz9igF0toHTooOT0UBLOtp3HY4h?=
 =?us-ascii?Q?DcsEEQArvUul4qpE7Rrdqe8coIEW6BfbDzZ3SUCNLeT/vbUxKnFQZ2rhnnFd?=
 =?us-ascii?Q?IjpjrJwNTX/7gq8O8NBnIvUOen06SEi0/QPmTMW+wGbCcQvsQ3JhElZlyrbt?=
 =?us-ascii?Q?2YJAQ2lMG1sgTi5k9aSZLnwVQtXYQkJ+LjrhoXkjHV2bSzigyEATrpalDTFU?=
 =?us-ascii?Q?glPaUN3O3MoklQmuyd2aLhTr0O3Gvk1iFyxiSxPeJhIoPFf7D9g2hj2OcC2k?=
 =?us-ascii?Q?qbnhAoXKg6r+Pm97DOQ0DWKPBf+0rgFvz5HcfN52Z0BUljrx/QFeaXkAvEks?=
 =?us-ascii?Q?lCMk/W8LVCe8i42nMu8U1PxSU4XzpurVa6fU9hcVzkthVQV5ul9QUhkJh+IG?=
 =?us-ascii?Q?jaYhMMnizos3KJ12PUJN4yDsOyTYLOq+zt++r+QgLJhIsQyVH/lpBRh6n3cc?=
 =?us-ascii?Q?NoXYxdbjyIMyJpS87YTyvZPFaudA/hV1DpHy8kbryeoOgtYuMryiL+lYy2EH?=
 =?us-ascii?Q?0l+JDXjICuYvkZAnwbDp4IAECKB+KHKyHP0PPRhefrhv2XxpiYDZodhRkF4+?=
 =?us-ascii?Q?MSJY3lEGy5RDg1djCiF8L2c5W1jp+sBnScQc+XeMJfewdwFH1daXyKYzaQxB?=
 =?us-ascii?Q?Y5jUe5dENRgwyYXgzCKlhoBlxSocHys8vFND8x0zD2lOehUbTejyoGret/S+?=
 =?us-ascii?Q?X9bwOnZvyzvepYYFQ3+y+6bpHmKcdND5AcBSKWeiXRP01YPLnv9fa5+IpjB1?=
 =?us-ascii?Q?r6ivkD3/GeMbkJh5gNdOo/72djUiN1RKzL63jVqHiicF7J6pJhMK9kulYtSR?=
 =?us-ascii?Q?VOAW215G/3eruj1iOi7lqpx/3Cr7vU2qIl5gtovJu8wJJgSOGTQ1WKYvejUh?=
 =?us-ascii?Q?ef2FvwPsV0VThSFgJ+pWaPatY2THkySP4GVoc3oJYL9yW4bJNQxN/zN7Fyft?=
 =?us-ascii?Q?7qsWhxXYZNQFLZmA3Uz7MFLzsuI12Q2fJhMozbxhhHlehf5AOMeXRkrooRii?=
 =?us-ascii?Q?NAZnoFGH0tjRC4HAEYHlY79xStY6hVwD5BaCQl8XQpZYKVMauWXH7e+mfER7?=
 =?us-ascii?Q?pDDgIJzSobIgO/+J1dnLcNU30Wulf8npifGpqZ7Clbaw2Ik79X1raRn+QDAT?=
 =?us-ascii?Q?reX8lKMtFC9wzlEUmTjnSE16nAh9MUkc39oVAqQP2wgqge0tsr3c7jBRMum0?=
 =?us-ascii?Q?3LDN1ognMvUSVI6ppwXtqwXGAgpZLV9BjXxCLTgnnSf8XOBjtDeOxIQQgPoE?=
 =?us-ascii?Q?fL0LEcey1k67FCaL/okjhaAZ/W8iAUXoiw1fz/jZ4kHlP7VsQ9KAqDNe/l4Q?=
 =?us-ascii?Q?flXmulJ2L2T/VopV0DL/XQE2f42kLWxfg6OJcUw16E8yIdtGJ7Qji+JVfkDo?=
 =?us-ascii?Q?T4tujkkezf/ihKFqySkfXimJSA0/kctsj6VYv+/RVJrrvCJjYzyGVs4ZObxg?=
 =?us-ascii?Q?hz64TBY364ARyi2k2zaXpSiRmDJCdzs=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 95e51907-c7c1-4493-d025-08def4071c6c
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2026 22:07:31.3434
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vMQOOfascqwS4BuQh5hSg7N42rDX6mWjx8tDizVL7u0i/4AFm68McOZhleLLnnec84RFMWrr0L6XIwexItGRAf0IMKeIpjQGddZf8D6cJTM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB9374

Introduce device tree binding schema for Airoha AN7563 SoC pin controller.

Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
---
 .../pinctrl/airoha,an7563-pinctrl.yaml        | 350 ++++++++++++++++++
 1 file changed, 350 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/airoha,an7563-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/airoha,an7563-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/airoha,an7563-pinctrl.yaml
new file mode 100644
index 0000000000000..6d186ebe4a41b
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/airoha,an7563-pinctrl.yaml
@@ -0,0 +1,350 @@
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
+      gpio-ranges = <&pinctrl 0 0 38>;
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

