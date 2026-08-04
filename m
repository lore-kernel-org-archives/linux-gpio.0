Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11021116.outbound.protection.outlook.com [52.101.70.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B34A247F2F9;
	Tue,  4 Aug 2026 16:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.116
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785859546; cv=fail; b=AIcjlKLh6muAaQrVAQ9vmJhfgtAqWI1wggLS58O1mXcM0Q7ybVFbo+7nlsreFmH06iRhqob9lwZXCJnCkqU4ZR0qcPpGfPrr7Tp7iiwGlvRBJAT9RjjYwTq1tq8e7l8rgLhQzkqsovmleFIpFDjn/gTn1r7Utrx1q8+g9mX8n08=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785859546; c=relaxed/simple;
	bh=uhwv02hyWy4jvMAlPbPESGHd9HIuF4vepgBveFWR8bo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=eIZ8ZURRpyVxxciS3t58muQwO0F7/RYC2tKn6fGgxLjocU+KcROtCzjoCEJQmsp5fVDQ35flix/YsRG6XJt5qjDWBeXzlYMxyM5iIEhsc21BPeFKcDaFjbpXn+tbc/VknQWIbegoYtS4UjBFzI5BTHKtBBMdfTOvShx0qcrjOU8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b=5dIDLnHe; arc=fail smtp.client-ip=52.101.70.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=genexis.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b="5dIDLnHe"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NmvskvAPAfvYyVZbwDlLr88APhFudRbJZZ/ym4P9vZVRuNeORlXasW2dv7ws93jakiepLu0Utp8B1uipWd0IMFg9AfOyAoXT2niOifha/JyCBSTg7gS2LJV4N6usWuoVUTqlNt3GvOyuqKpREUDZxIUwT5zI8fqxuoBy1rTpbwyzTQIYPlyzRpQNNOMBs+RQ/phAXEEUv/iJcQzVHLR40MFLbGUbC/DT8mTtOWAdITk3U+K7aING3emj89gfvf6LnRIpvrTq6/hax35KS2lG6mHvC6TYSXeFs7f0pvkrrT51VtBofQXDRPS5hc1p4I5fotbtsUCMLZDTa4BP6qV0cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uPKl2ygvAL63frhs8p9ydt20/1YHpj2PKtclDWEVpfI=;
 b=F7PjarnbEDZ5dR/zJQf9LJpzS7hO00B8+5EtwVZOK1L/Q3gdDP60r40Ra6C5jHjADjWUDLyW7qbMhRijd8pfcYLQeUYpXkn5oUiRfJzz1p9Th/0MHPkQRuWwQmHrF1olGbaTjWkzFY/+/gxylyuJKTB4rSA385jCLdnheqnnF/RlX5BCfL7q9vUL6a9RPDe57dA1rVTZ4tsYualMkUwDzOim/Wxp2EzUcOK0on5CQv/EPrvbw/pyOC2rKzgaoOjLgMQSFCLsggwwwOezQmw0o1LyOl4p5fviQkckr4qnvRaEA8AZJaLZ+2LYUNW/lULuwYc5EEAs3Zk17+8aWingCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uPKl2ygvAL63frhs8p9ydt20/1YHpj2PKtclDWEVpfI=;
 b=5dIDLnHeCG9fAmipi3TeP9c//eaQmNESJ93UBo1u3uKnDSPr3z2GRFkwMLOyFy732N1Au+u8BN7MXQcIzMgbDiRAzB2oa4Lia+DoJqac9x2QkIv/Q30zuEUJBPudVH0axRlI3KaeS7a8YdO6TqPgP4M6SScatpEiTaAhXWwxWczDJ/5CLO0DgLRSCO5X7TX54mCXhhGB+B6NO3Ob7xtn2/ZAWE8ukAL61XOuDCPj84PvYM3M4zHyDMIL+qZ3nbFC//didltX9qYdMXe1BKLNV+Z3RqB/zo5Sc/7GDZIlkF/CcGUkM8TrzvWLQmtn3BTht+e5HlXtcyfUFE5ionndUQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by GV1PR08MB10792.eurprd08.prod.outlook.com (2603:10a6:150:160::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.15; Tue, 4 Aug
 2026 16:05:36 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0292.013; Tue, 4 Aug 2026
 16:05:33 +0000
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
Subject: [PATCH v9 34/36] dt-bindings: pinctrl: airoha: add support of en7523 pin controller
Date: Tue,  4 Aug 2026 19:04:17 +0300
Message-ID: <20260804160419.3592327-35-mikhail.kshevetskiy@iopsys.eu>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260804160419.3592327-1-mikhail.kshevetskiy@iopsys.eu>
References: <20260804160419.3592327-1-mikhail.kshevetskiy@iopsys.eu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0237.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e9::12) To DU2PR08MB10037.eurprd08.prod.outlook.com
 (2603:10a6:10:49a::20)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR08MB10037:EE_|GV1PR08MB10792:EE_
X-MS-Office365-Filtering-Correlation-Id: fd06528a-ed35-4af3-e27a-08def24236a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|52116014|376014|7416014|1800799024|366016|38350700014|921020|56012099006|11063799006|3023799007|6133799003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	jf7yiF5rCK6sm/E9/fkel2Ewv/aiy7Lsldcqj6CvZSWFrj/QJmNuHZZTx6jZagbsuXWpKj9yrG0YDz7nHa9HGCQLuJUyl139Ig5HD0R1t+gzmqb1BL7LIhjmTG1RKnpxw9zJ8tiQkNRvxmsv1UyFJNVznJcuOUZ419xS/kPRUkaaxAlCXc6ObnyyBWZ3rYp082fAevDijKpyjlnw+OMEfhSNsrFMECHoGkJbwmDkaujdCKtZwhMTwno0dOnSVPLfBMJlSeUx3N27NY9edHum4z1n52PlKzEHUqEufGSdt7219OIICmCMIRePGGRefE3D1vUw2T5g/cSz5GdvHO4fsjSdEijnUshl/3nidXCYSz5rMcNYK2tvD922xxXuYttd7HIK5uD1IoCNyeLVf8glVx8PhWBJqhyvQOUXRbrknTsJuLITjSLRM5IFtUFmm62jz3IQnlBykI+ma8nBjSp+Mf7rub3+csbkHSzt/L/qeKn2Cqf1LW2hdXKLJnLFZ/AdZBACteLhDUIdpMEQ8UDgKUIqiKzrDKluLvcMCBUko9n0HuIv1IihpHLRtJJlAtXZGLyFEPjW+jeTJfuqCrUvlegVJEnQHpCR5vKSoJjTtoSbMmgUW+3b+BxyX6SRK/50r5Vte9H2OYqSDzaNQzpGNc/s/fwMC0POJNZhNa7zQVNzs1flNzarfVpawkp7F7X5
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(52116014)(376014)(7416014)(1800799024)(366016)(38350700014)(921020)(56012099006)(11063799006)(3023799007)(6133799003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?jtVaucRG4Xy//rfbfdvQBdT2jlYRd6upZZXnUO3WyATqNb2XNbTYHII5YHaK?=
 =?us-ascii?Q?KP7uBP2SuxIvyadLdxAtki40fzOO8k4Qo3kczTFzfklz5DJiDgT+LjmbmpCb?=
 =?us-ascii?Q?noT4aKT8Um5aOc05KKUFXyolWFA1gFHiE5h5cY0/+VG5CDYK21PkkDUeE7rQ?=
 =?us-ascii?Q?x6h7RoHxMHA39GRJcsbxwuDzd4Hfyj7sfc6lH3cPqot5Y3c08qqkS9LPW4lp?=
 =?us-ascii?Q?pXdt82gfsoTEEwKyD3oGC67l0lsrCrxlVtq9yAxY33ihqCtF/NkOuWmX3HVJ?=
 =?us-ascii?Q?L2kFDCWE4tymBvmupdhDCuY1mUJJ/hv4urJKv73STesPJ89OIRzuGSNhQMZ1?=
 =?us-ascii?Q?sKEG0R1TZtLnI1Flxlr4mCGvF4OZ8Q+7aqo4v/CcGOz6n3U0bFLwxBw0Iqzt?=
 =?us-ascii?Q?208+W2YKa2BcNvLjOi4ZXGKAd/sRlkqyCO8CyF3De+A/x2zHCie9aHRuHPqf?=
 =?us-ascii?Q?As5cbhiCbLmYQMGL8CVfH5UXR1h3sfCfMLst7jPcf1fHSo73vEp1VJEK0HT+?=
 =?us-ascii?Q?X7F8O0Hz5rHrFwCGZo9S0n2AWA0j9zGJycoLTM4N5L+/7lVuTFxNT3LxWNXC?=
 =?us-ascii?Q?PXRoQHeVF0XsjAngc1QulwZJ4m0Kz/lkMHyUo6/jm+oE5WncIUBhiQBqwPkX?=
 =?us-ascii?Q?InSZYD6EDHcqlf76S2eUZe9tSuKe/8WRk0vnq3T+oowtt8ytsJC5ethg2A5K?=
 =?us-ascii?Q?Lt8wietbIMWEhurSCCked2v+rF1MnJl+UxNV5gKi/z4U+5iPnp27MTykiLTi?=
 =?us-ascii?Q?6uer4IiQ2IAwFMXwe/9uNTBxJnn6BebEy3wYqS7qbE+7HyeR1aywW9qq9csn?=
 =?us-ascii?Q?DHXtWIodA6eZ1DGhQeSPYicwsR1G3Zj0ENbSCtnxSGFSHwsqohJhZp50lcqd?=
 =?us-ascii?Q?4inz+A3bI7PoGyi7FX94q58817Shqq7ja98umFBtFScR2bFHSu1hCuAVTBkT?=
 =?us-ascii?Q?khvFUqQIBPi+/BzLqldBmvaGSbn5Ij+fDui0cciAHo23s2Xj9L1+goGAHung?=
 =?us-ascii?Q?pqhdlf6D6w2ZfBuBmSxcG/0R5wxaj46CmO4368WGb899kU+XfpwyJHUOy3Z1?=
 =?us-ascii?Q?YwaOHmc/g5H6uJn26E3vDrC+0SKHBwH5mItDKzIHIKQ6HxPwr19iBoRxxpb1?=
 =?us-ascii?Q?Z3HjAM5W/hvd5lpnc9CYYo4eSBvkvtVSczys8ZJwYcRM3jk4Nn8nzdY9epdM?=
 =?us-ascii?Q?RS2Eymf0FIHU237eVT9fVwOUbdr3grkQAGJuwG3nWTEpKYZdPxKZN+oAchds?=
 =?us-ascii?Q?O1E+xDQOjz/hKh4JYAW/pXAmVMI91297MRvbDyypJf7uQIok4mlE9mJN+0Ca?=
 =?us-ascii?Q?OGkV9juQsWtrAxxwiVPRDV7TMcxgm+H9XFzcgXTqRkO2Z94LZqt7w/QzRoKW?=
 =?us-ascii?Q?9O/L9mgrjpbusTB1xolk/oVseOoub9aUGOWK90i6R4X0wLozf1mIxNpKzkhW?=
 =?us-ascii?Q?yc2qyq/moGoafK+oEgZufEFkrbJ7vt3U2ZV6E07gSU+T+PJniM6ZPbEUuo2H?=
 =?us-ascii?Q?Va8JipNcjnlzP2kaIdvZGSxsRAxUkO5eU1TBGb1567Mu/smyheICxBhXZ9bp?=
 =?us-ascii?Q?NbINEIyvv/4AvqpGwCzqbz7YRUC4xW32L3hyQgqp+09ByululBSF3DT29MRb?=
 =?us-ascii?Q?glLR64HwI03B7dEyPsD74Xt+r2T0WI8HUpc252WYiXu0PSWQWUO/agw7WcYA?=
 =?us-ascii?Q?4q/W2q+gVvai9ei/p+GfboCp55fZKjm4DvaEhggytVKTSfT83LfnARgTHPp9?=
 =?us-ascii?Q?uDkCAh0GDI/nVCl8HFuYHfSxpd74OsI=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: fd06528a-ed35-4af3-e27a-08def24236a2
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 16:05:33.4105
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2u1isLtIxtQgWBK5qPqgXQVR5lunJLRN8IphW31F89/4zOHtNJfnf95Xd4OwHbVhxoaPVeC3xd2nz+5tiZVu/hm5/2VDUjTyW15jt9mA8jI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB10792

This patch adds device tree binding schema for Airoha EN7523 SoC pin
controller.

Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
---
 .../pinctrl/airoha,en7523-pinctrl.yaml        | 379 ++++++++++++++++++
 1 file changed, 379 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/airoha,en7523-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/airoha,en7523-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/airoha,en7523-pinctrl.yaml
new file mode 100644
index 0000000000000..dd5b3b51f7694
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/airoha,en7523-pinctrl.yaml
@@ -0,0 +1,379 @@
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
+  gpio-ranges: true
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

