Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11023116.outbound.protection.outlook.com [40.107.162.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCCBA3546EA;
	Wed,  5 Aug 2026 12:35:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.116
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785933340; cv=fail; b=I/LvzgOtVMx9Hz6xTGA5VGdjpauY21TG3/RH8obIerHqOcoksC46SRy0sjt4ib+yplrHduKoIfgc5ymTRufOUS4MxWRTnYJnp0uVubBHGz2fhyRNCN9YCXLv996/gq6L6T2wMEaqCPD06HLf0UbR+b/4Y1nPfvWwS61FmB1tsZE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785933340; c=relaxed/simple;
	bh=7oB7Of3jLLa86nSaDUrBMGQvZyvoUsomhh6a3UD2oos=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=A10yjUGV6I2+mu3rxVo++wu+Esl4cD6rkEurmeBtRVhSxv3e6y6IOubgYxDIsM0w3brw1A+T4Fy4whHOkoIHl6/6mqGdSx+p1SUeXMO2/48KiQvJbwK6pHqy5I+1OZiGW3kEtA8PiPP+m3TzyS6KVYnqGUdUThzKx4Vhu+nNFAw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b=DauxlCwq; arc=fail smtp.client-ip=40.107.162.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=genexis.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b="DauxlCwq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YMjVFXu+qeByH6tPDlRW01LYFDz4LYPs8vuumW+7Sej/BgI5SOnzxYkXpZWQ/X5+ix5TW41tZZobRj4mMx+2NigKuMCn+v6ShAgngbPp80+if4IoF4XKSb1sejxrT50JdC1m6b42ga3cMxefz5Hj3OIdiAb3Atf6AcVJJ11IFj1ItwrzAgzAMd4HfrVpAxz2h5KcHLVWAL+k8ayIQD5DF7j75XCA7QupplNMRcG/GUzx5MDKe4zFZTwdG54b5A895gUfXmEF4GBSlnnypoyqwOTOPJJjQK5F76u4pPNXUv+vBagoaz7NbPs3BOJ9yJpv1DgOpTBKQ54FeyawxI5lMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=USneXvSxRhgqeMw+cx0S4/3GF1nIUXehLb+CEir/oac=;
 b=ZSpmyupps2S1jW67eF7mqqJRlen7kbByHJ1gPQZ20QxBLIwL4zUjeK6INm3/D/liT7bA0PXktahZTujLpZUaoslZJtLH48c/dhXhIpOsHJhksi6vJoNG2xBpc7a0ZxB4E4ckV8iUo5uTnaDFTTQQSGmGLop94rSEFfVo9CGoqTRHuOYzWVjD+8ZTpMM9HN/7AqFKIXnmpJ322SnBBJgEAHMuz+DjqApWwJY/BPEWyNhGWmxBAJDSEeI3p6QeMxdMK3/sxDpzGpDwN4xLu+fucezpHnLp3K/mpC7nvTn1uPOBAOA0cjELXlCHGsnskJ+DISdJantPcvfzAKSaBkTTmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=USneXvSxRhgqeMw+cx0S4/3GF1nIUXehLb+CEir/oac=;
 b=DauxlCwqn/u7K6EtLalauSX/4kdod19FEdw0zK9GAsW4gg3OGK/t9lvYPRgrKmtMed6jaVFQ5r738bCvE2/HboicPWC26JPx1vlySsrhE/0md0R5XyWcowEAe6VTvm2lC8X3c/w6djnA07XSZ0rqvp5XKEU3aarMftPdRMlCqJflGtPAKfOaM/Qhai3RGt49BM/U4uC144lSkYSbfNQU90cyh8Z9+5NRwH/qyqss9o9lZOjH1eU9KuwoL5ElPJB1fJ24fTDkhqv+ODeguBHX1toKSDJgtFVFfIqm3o71iQJJ30lYtrUVdTpc6ZjahtqVMLMXb8lRvpVDnmtu+jTHKQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by AS4PR08MB7831.eurprd08.prod.outlook.com (2603:10a6:20b:51b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Wed, 5 Aug
 2026 12:35:26 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0292.013; Wed, 5 Aug 2026
 12:35:26 +0000
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
Subject: [PATCH v10 34/36] dt-bindings: pinctrl: airoha: add support of en7523 pin controller
Date: Wed,  5 Aug 2026 15:34:06 +0300
Message-ID: <20260805123408.3767648-35-mikhail.kshevetskiy@iopsys.eu>
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
X-MS-Office365-Filtering-Correlation-Id: 04bf69d4-5a54-48e2-6fce-08def2ee066b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|376014|366016|1800799024|23010399003|11063799006|56012099006|10067099003|6133799003|22082099003|18002099003|3023799007|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	4LbJPfJlUW10TGatLmVrYktW+JnoDc8pTnNT1SmBdBBjDFQq7m57duiP+XEtjOkoq9y+PiebzE1fEBvrDRYYa+TFsGm7wHkJBH0xBsLtsMgMjXmgVBdda6EORsIQ8JuR71ji3I6+yh9iVT5EhoHkaSAW+4YQIlK0bhElaux/h+v0pSrIWq4SHMwBzQf9cZjAGVH1iSK96AvczL+//+8Deb49A/R68+LR3lFjAonvtgwZFPZ/DYZCaNdxVKcfGQGv+Vi/kpFk238KqA7PgtPFr6Sqzk8yc8S1RDqQrAPR80G3nQgRNJzTxUN/M5syVIDJF8FK7N1WVszdKvxw/jxGMBZsR3UR910RfrOeXgLSs0TX6TM9nMbm49r9UUtLW5vN6AiwKo9FO/t156akL36st0aOlNV2EYtRRVINzNkrsFDrn/OKK0Z82FVnAreTpX4P99qRxWBUDSHLWE5S/DXfhtOvRe6F3znEhUiIKyzjXLyDM8sDpX81VS0i9Qm9EEYLwUI/ITYnluQPGMmUMcpaf6MoAnxWgdJAkiBrkPofbIK3aSqd1UvU4zTPW2CoOrCZ1eXfohudbbtld7AqK+e9X/bF2F4PTjUD/0fA1k7lVSzfBYNY9eOmqRW3eyOs6kqmpOee4YFf5GbZo+Q9z7pDgWvueFdE7Xs2kcs46VQSAGi7amq0jpK/oKmXzvd8Mvz++drxw5l8gWdb65CyMP4SqXiQqjzhM29W2x2RUgX//th0siC8RpxBYR16ApfbHbRU
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(366016)(1800799024)(23010399003)(11063799006)(56012099006)(10067099003)(6133799003)(22082099003)(18002099003)(3023799007)(921020)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?mJXV3caqOL7NpXfLNOu1N9XE9dHfC9l/J16sD6OLGl0EHsijcqQUOltsXeLT?=
 =?us-ascii?Q?OPEc+l9LT5x3MzKokMFkJBkLTGoYusqzPMcm7mmaPnFn+N412zTa7AONSTgA?=
 =?us-ascii?Q?0ixAa/lDh9SJPXBLBl9KObRw2HTHJUTVa4cMdh7SGq7kAC73PGEteTp7tMoY?=
 =?us-ascii?Q?BFdODqsn1CQDgCNNlRYq9ttBXPufzTmaN/y1CH9Ndryq6iTm0kaUuwZAzxEB?=
 =?us-ascii?Q?hwfrZ/hUOv09U+CCZAKiW5+bHiSLt9b9QT8do3noXis9fXtL9aHZyJi8nhub?=
 =?us-ascii?Q?xYBPxooIkZKwGTmDh6u3qxzWJlZ3wJLxAqC2MiKofqajePMuZxXWqpuVoLy4?=
 =?us-ascii?Q?7lKlQcqRhEjvbaZGFEsaGFK3PLYXackARXaNfo9PK4YOOP6LES6D6zNsFb9+?=
 =?us-ascii?Q?Cehu4A7qsooMSC7/vFJ+9mNtbZvPRoIzXqhqC188ANsTzmogdOeG/2TyJgog?=
 =?us-ascii?Q?2LjE5Sg4dX5wt821mxY7MPAScEqUknbhy8CV5jZBxBzh0750NIhajnPrYdSO?=
 =?us-ascii?Q?2/s9x2BRwcRGj69YoQnFT88LyoDC7kz+BFA9SzZYlL+RRrRrq0imN7JnLBpy?=
 =?us-ascii?Q?VB/HEtyTh7kyxTRoGH3wtQ6rFKVzaJ9SFGr41XVFnnzwugqCtkHizx3wY7XE?=
 =?us-ascii?Q?13ijOOzMiHcbuQGvNVLCAhjAwL95LkoaKc1fRei7qLHjQPw06GgSbrZ5iPaW?=
 =?us-ascii?Q?2fSY9r5297vj9HSnUWRtJXtmkuRLWZNRnYJBSaYtsYMcg2GtN4yP0ycvc0Sb?=
 =?us-ascii?Q?jb58ItYcUk9OUl6K70wQwwswliZmm5/E3yEpNJ4o/7RJxRmW9IchXDzFVYPv?=
 =?us-ascii?Q?QiOUNBcU0kfUVCgI5PHFHRWHDgwFQI/6hXsXphNLnYrJQAq8uQj2DzDNTvK3?=
 =?us-ascii?Q?bpOxdVMuntBWeH5XXIHlQg7nAt36K8h2RjreAAec8bMI0cn+rJOTAa48DxV2?=
 =?us-ascii?Q?ieJQPvoRFqmoccb1vnwCf5GUFFgnjmYpSThYQ6j0JySVAecothz9lxZ6HaBb?=
 =?us-ascii?Q?ZFNYVzTUWqNQa8tUJFldqI9YFOghmae/9r32Ss7pg/OiSaGVnoHkrYgSCrLZ?=
 =?us-ascii?Q?yN7jFaSVl00tLfXhn8mMIAAn9m29Vre+uXHIvnrNK5n8lsCY/rsv0Ocb9+zi?=
 =?us-ascii?Q?+4f6ikbcfm8wJ4PvSCSCg05D3tmFMf8fGbv0yugoQRwtfEBJQR167vZf5rT1?=
 =?us-ascii?Q?zcxoTU7C3pthBc89PmV8PGc10v6sBxHXOTOv+0hevZ8LukMt6MsN7MjIy0Mf?=
 =?us-ascii?Q?12wOVizSrXWK5Kg0UTaHfAlWd/ej+weRWHwD2vszcLuZ1fucDXxr1B6gBYLD?=
 =?us-ascii?Q?/j9UeazaDsraGVD+GiA+uLuyDUx2XI3Bv4SjslGabuQUy+esKPXIRmT1ffYx?=
 =?us-ascii?Q?n57I7lkOb1AoJc5DrArJOaMp3l2+dTgCPk62qSm8Liiu+PXdyCziKDNJbVLy?=
 =?us-ascii?Q?wlGp/w7KsXs4aq5d0OzYXKisDGhpPekFD8BCJNEQfNeZHLvcHRj8Q4DjYMWC?=
 =?us-ascii?Q?kwMIgYmm2yJrIipcppeF0zwxxhXXiG48zOIwPNxHqi1WdyOWTDE+Nc6DITqF?=
 =?us-ascii?Q?RSBzUFQ1aZe+552T/J3BRwtGb1t2IqYSWnmxgsEM+3m5Uzph3LKeJxOBBQ3r?=
 =?us-ascii?Q?0qMJWY7V5DOoqzWzkGul1nqIFr7w1gYxZyx97KwtXViQl7PitGZxEWC5Nu6q?=
 =?us-ascii?Q?WVqheM6kQuHvNeiyUrc4cp5qi8XyKFplzXXlA6TFFMCTvOE7d3MUUDP73qPm?=
 =?us-ascii?Q?bm406iLV4dH2OUHt6eBHSmNLbhvg228=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 04bf69d4-5a54-48e2-6fce-08def2ee066b
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2026 12:35:25.8601
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L3n3rWcE2kXDitUT/UmBbapAZhuynzJP9FVZNjUbSD+PwUwik0/9XeuflYTImfmZnZ5oMWnHODLc3tLCcEVhqCUvdHTV8Fue//vvy84NIbE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7831

This patch adds device tree binding schema for Airoha EN7523 SoC pin
controller.

Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
---
 .../pinctrl/airoha,en7523-pinctrl.yaml        | 378 ++++++++++++++++++
 1 file changed, 378 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/airoha,en7523-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/airoha,en7523-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/airoha,en7523-pinctrl.yaml
new file mode 100644
index 0000000000000..599f80e94432b
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/airoha,en7523-pinctrl.yaml
@@ -0,0 +1,378 @@
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
+  - gpio-ranges
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
+      gpio-ranges = <&pinctrl 0 12 30>;
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

