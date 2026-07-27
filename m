Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11021083.outbound.protection.outlook.com [52.101.70.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 278664248C0;
	Mon, 27 Jul 2026 17:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.83
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785174129; cv=fail; b=N2JDTZ/vIE2XKnUqcMMDcMvwnY3vRhhngS6kslFNbxRSF5vkvuiZf7zKpbyCjIDSSMpgkwzxL3Smc1nyBJoKGjE+m3LNH2Ni++Sk0xJWGzarnBRDM9ve/SgY4Igy+BQDsq9sjC2e9YpoLGRH4oCPTBFG2i36BStrRZVZQX+gIUI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785174129; c=relaxed/simple;
	bh=zg934RrwikIyLYT1Z6PLwkfaapeTfMsMDTmmHJ1rquQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=b/6++Swr7px1nEa1cbwPb6wxkHtJuyj9HXDW+Pl8Ji/mEeh1g1MeXsoDuEXIKxK/wxDHv98CogPWcIwgNzp3Uc60SqWhRhNrePAMxuwyIoiWIEX1yw2CSo3P/0K0pW2z/yUbMjag0oBHlSl8J0AzLhYxu97G95fuh3fSb1nC58E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b=DwvQUXcc; arc=fail smtp.client-ip=52.101.70.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=genexis.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b="DwvQUXcc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=csMTrUVonZk9Zv0eJinNPNVxzzBuRJSWgSgtcI2cHAf0XSt5+EG8uaDjzmngqUoT0SnUK8TAgLHueE19x9iYCOYg7orEF8RSl8kqnUUCy1t/mK5/ELlQeSSs4IneWlV5qVkmaCD3fJqbbro9o+Io+HnjGuKQiGRxr2MaLuSXaFeYv4b952S4Gw4LcekQaiFfgGhGoN4L+AyDwVG8nlTGWZxIhz4k8NA1tmr1YL3djW3U204PMhIRtCzC3zeCfbuxk1db2eXYkJnmOt4qTBOJkxVHrAwSDY5vu2qUzsef9yVCz7dokvVufcyC4MwaPNgYrqMZtTfRUA06NhZI7Ij55w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vQAPX6Ef16d9WcjMIdXvoLizd3siScE7CRnBHygewkw=;
 b=sJsz0A05nz5nOihYjpCTtrQGqc9CqlqrN4lFZECXCxuBoUA/I4vNejwHho7Gh+dSYJ+wpFAiwpFFUnTsWcSvDerpfeeZcRR+Hsg8aD9AbQJEmERw/aDEs/rczWXr9U73x+YjCRE4mrY7Zj6vNQ8ZZq9RmpsFy9rqiQ52BbeLGC/Ho2Md/xlQEShpGTXQVrDP5+P+8Cc5AAz6bGRDzliwRE2exXPaE8eEuMDthe6IXOHmd8KqHM+zpCyKBRcHjXsSAXVCVQBTTZYrBFMKqrk+nJOJXy+iBKwd8NER0scVfOPLIdfLK4UXEWy8CQuIfrnjn1FuTS7vJeOGLCoXzhQ5XQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vQAPX6Ef16d9WcjMIdXvoLizd3siScE7CRnBHygewkw=;
 b=DwvQUXccFE2/5P3d0I/mjEqgvFX6H8ujh62VavMuMmysm/UJMZO9TV9QU9ARf4pmJ1rSl38GkaRUdPI1bFCx68X4NkLNvZM3rb5X+fg0P55vI1daX8q5Y8ZhlTnXxhqsLawzObWJsy4XWnadFcLUu1l+mNbldxPNVKm796186H28kjqB/0mKuBzY4xpWWcQtAI/V7qhtAxHtS21QCQOTlK4+NS2pGoywgCGRDw5yBc0RO0V34vdlxnlTHghTiM3NQNI3ZG/rWmtG4+UsA2ZvBzDeNtCmVo8hX9Oe1mmtUl1qWFmPDvfSfEnOtZxYvE6foMs4e3+fBM+gbGby2+BQoA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by AS1PR08MB7537.eurprd08.prod.outlook.com (2603:10a6:20b:481::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Mon, 27 Jul
 2026 17:41:59 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0245.012; Mon, 27 Jul 2026
 17:41:59 +0000
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
Subject: [PATCH v8 03/35] dt-bindings: pinctrl: airoha: an7583: fix device tree binding schema
Date: Mon, 27 Jul 2026 20:41:09 +0300
Message-ID: <20260727174141.664933-4-mikhail.kshevetskiy@iopsys.eu>
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
X-MS-TrafficTypeDiagnostic: DU2PR08MB10037:EE_|AS1PR08MB7537:EE_
X-MS-Office365-Filtering-Correlation-Id: dc65dab0-9b61-4b54-129c-08deec065c10
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|366016|23010399003|1800799024|38350700014|921020|6133799003|56012099006|10067099003|11063799006|3023799007|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	MKyaVmhaLtZ/cn07WjEvv5OIrorz4XLwLqL66Qb6Y6vpWUBkq6VrH1WgklmcMgLnYKj9o72tOjm25hWCJ076AHTlR9zV/6qiY5dJTHwvBJmM3HVKKvR8N4+etRgYB87cW0pRJDHsQHW3XVsLtZQzwX+fxCC5L99lom5x2R1tok+D3G6xq9+iIxlwhKWwgEq4t/WVaOw5hBXEintbp4Dv6eXuS/IDJtisJaUO8gHeKnHzVCRcoAKDz9U4F5J7wNg7RgtQU+ICyY+w1GfpZ777aQNiHHtlju5OMtPp+nudpxR/kLJbUhG22394DgAmQcN7jusnkbVpKgA8cq07NfOVi4/W1HRZSr7ZwAwI3snrLgV4m2x7uEdQN+KOIEWTBximv/62mjbJQZ1maeQxcUr1pwRNt6G2V/tr5R+cyu4z0Oyk+VdJd9r/0LT63ahZPwkeS1F91fX5yrNlnOmlpiHUHNEyM0YowCNDLSCyKFOyDYxAofQ5IkT4KPaZqy9Z2cZwnH0TkGN0ljCTw4251MK8bR6CWAfQg5CFCbo4h0Inpy5K02j2kbVEBhiFcuNBJ/hpShriyEcwxPvMV0KMeBx4OrVMZB3TvqGXx0101nbhGgJi++S/G0yd3Elbe4UmYbmdhOsfp2swpqktPV5qUooSQwh0VPtqbQYDbCnYtkWJyNUrtZXwAYaSgLwvWkthXc2ulU9571taSMIfDH0ZVoICO4+/yb4C8wD3uvQ0VZlfIgwlPogICIlyU6XP5/P1mexy
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(366016)(23010399003)(1800799024)(38350700014)(921020)(6133799003)(56012099006)(10067099003)(11063799006)(3023799007)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?lZzvlcS2pi2GfpZYvJZ5VO7gnP8jKGq/nuw8wTKrdXOSQzr0grvV/S6IAFSp?=
 =?us-ascii?Q?utLjywf1rwcqhIRBPFpsZyyFjx5SVuAE6WBVVzKBJN6+yBSWdXWnVAmJo/iI?=
 =?us-ascii?Q?97h3voUGaRzkLhYR1JMSiA1f2cMW56Us3IZo1JvYxOLMhW4TzjvYIdML5VSw?=
 =?us-ascii?Q?KxD4dJQ7y5LaNOAJD/a87eEfTwm74wXP5BkVq0FEYhfm8k+ZhWfQZMFHEOv5?=
 =?us-ascii?Q?mNf18d8S6J8pFNs2P7XFOVO8OY7eyWEQrlzncOaZANHvye/Hq/TEDp2f1UTF?=
 =?us-ascii?Q?jPygutKr0Ozf6oIUmNgYWMtiIBJImK88sR8dq79tYrlP3pnKntSVceNzAvwM?=
 =?us-ascii?Q?/2kO+UjGZyVMOGbhqGHW+VQqA+tAqNYsh685ORcr02GckhAwgyEk4r7iwntj?=
 =?us-ascii?Q?DdJrmjc5iUfoN/2d8RT/70ZXeWunNaxiSPEpYzTExCqwAFTJ4u71UhQrQlB/?=
 =?us-ascii?Q?C/RupjbLsNF6aTBTSywxvJ+uS4oGvNFJPMG8yixtMh/0Rotj8crWsPXOW/eO?=
 =?us-ascii?Q?QStQo6NCky1PKOqrTJO6aspea0cakuVrCPv5lg+Yo5cyrzIFncaMNQyPs4ED?=
 =?us-ascii?Q?m1nanAMm5DuajOh82ANB00YAWTxJPkFi1zlroSBz7hTrcMX3E8eMlbtQobYG?=
 =?us-ascii?Q?ziDnGj9LUhYBOjysGx+XkmZNgE3rDxyDtaCZWxCkHemqvhZGP+z67WqiUSE3?=
 =?us-ascii?Q?63p9rRJaBw/iwYwnMi/kdD4zK6F3hu266axLs/4synCr1D+5xXWo1gcBQAxb?=
 =?us-ascii?Q?YbsxkoM+WEBGxgOOFJqnySnygU8R5hgyA5dLfqZAE+xXdpG20l1tbErYt4i9?=
 =?us-ascii?Q?861DUvY1GTqTaP9gsQDvGNIx1/MhmiGXxiqpK54gvNB4D282XdQY16Av32a0?=
 =?us-ascii?Q?XgHs+hPsf55SVemQChrWdEVfrq6/sF66gujK+i4TeGcZbu7vb8i86rmK63Zi?=
 =?us-ascii?Q?IchDguLDwVqBKlaCthXWNaAHPGgEYo1mCZ+GuYI8NTzw/kLTL3Mfb3jUtkmy?=
 =?us-ascii?Q?/mtN3DF6ewS6wGLBP9KxEVD9SKQ6chIK0mHvQk8wg6fp5VwOu6BX6LlHxX+V?=
 =?us-ascii?Q?S13tM0yEedyUBUVj4o+YVOvR6Itf8slic5D1b001KIfGCVgpsl6hsABQnqpd?=
 =?us-ascii?Q?rgdFuWm3sHQB5SGZRCUEVoSN6H3sOS0yK/SGi+SmfaEmOAdan2Ont/omvt0W?=
 =?us-ascii?Q?ULVZQv+5szEhQbo8QmI13OlUpWzdHHsCNy4nuWQ1In9yopvswira1aMW8SED?=
 =?us-ascii?Q?G3B/tPshWv2A4r3R3juU8DVdWGmjj8/zdirVbiVZpO8QwogjcXHgtSdzqOA0?=
 =?us-ascii?Q?NrDStXhg+LLDr7krfM+DJRBMd2+Cm+k03Gmh5meMOv3zds5jTX2+bsVauaN9?=
 =?us-ascii?Q?ivScPz0VA+O9Y+gFDWYMajVJNAuENWrssBGQR+aMDtSi/U2j8uKRuv5WWH9F?=
 =?us-ascii?Q?c+UOejXRXuuEvvdwkyBawJOR9hkrJzXuC+7v3y3VCeos3pKjQyASTtHxmtV0?=
 =?us-ascii?Q?6S0mdlroCWcCGOVR5b8SyYjNU91VVcg6SBJNNV0TujCy+Mmrsi0fWrTRdH8u?=
 =?us-ascii?Q?1vOsfbeXRSOoebQUPG+KEq/6ShC1izHkpUjkLnmfyXx85humJoxUWHqc/SYw?=
 =?us-ascii?Q?9THD4gsFaw1dgM480yhZVXtaAb31bsaSKs3C+xT6ZXqZCXQdQyvepSHOo7Bj?=
 =?us-ascii?Q?o/fQlxSoP8tJhneAqWbbZwkj3pOT/1Lixr/BqBi5PJhGj0FaPnkcwoP1e/KP?=
 =?us-ascii?Q?VMow6a/HQo0tekuQpwvqOqLmknbdmL4=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: dc65dab0-9b61-4b54-129c-08deec065c10
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 17:41:59.2858
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6P9F6IgIt9PQGFul0BLms95o+IaO959sPzgDghELcdMkFZddUloG+ObioB3Xqcn9x6U2PlVqJq8Vqn//Me3dV+cmMGbSt5Fv0O9+2yQMk4E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR08MB7537

An7583 device tree binding schema was more or less blinly copied from
corresponding en7581 schema. As result it's not correct.

There are following issues:
 * i2s pin-function is not really defined for an7583
 * i2s pin-function by mistake was replaced by i2c pin-function in the
   functions/groups checks
 * pcm_spi pin-function defined for less number of pin-groups
 * pwm pin-function should have more pin-groups elements
 * unexisting pins was defined

This patch fixes an7583 schema, so it matches actual pinctrl driver.

Fixes: e6e47d31d3f8 ("dt-bindings: pinctrl: airoha: Document AN7583 Pin Controller")
Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
---
 .../pinctrl/airoha,an7583-pinctrl.yaml        | 37 +++++++------------
 1 file changed, 14 insertions(+), 23 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/airoha,an7583-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/airoha,an7583-pinctrl.yaml
index 79910214d9b5c..f52802a3ad79d 100644
--- a/Documentation/devicetree/bindings/pinctrl/airoha,an7583-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/airoha,an7583-pinctrl.yaml
@@ -61,7 +61,7 @@ patternProperties:
             description:
               A string containing the name of the function to mux to the group.
             enum: [pon, tod_1pps, sipo, mdio, uart, i2c, jtag, pcm, spi,
-                   pcm_spi, i2s, emmc, pnand, pcie_reset, pwm, phy1_led0,
+                   pcm_spi, emmc, pnand, pcie_reset, pwm, phy1_led0,
                    phy2_led0, phy3_led0, phy4_led0, phy1_led1, phy2_led1,
                    phy3_led1, phy4_led1]
 
@@ -159,17 +159,8 @@ patternProperties:
               properties:
                 groups:
                   items:
-                    enum: [pcm_spi, pcm_spi_int, pcm_spi_rst, pcm_spi_cs1,
-                           pcm_spi_cs2, pcm_spi_cs3, pcm_spi_cs4]
-                  maxItems: 7
-          - if:
-              properties:
-                function:
-                  const: i2c
-            then:
-              properties:
-                groups:
-                  enum: [i2s]
+                    enum: [pcm_spi, pcm_spi_rst, pcm_spi_cs1]
+                  maxItems: 3
           - if:
               properties:
                 function:
@@ -207,7 +198,8 @@ patternProperties:
                          gpio20, gpio21, gpio22, gpio23, gpio24, gpio25,
                          gpio26, gpio27, gpio28, gpio29, gpio30, gpio31,
                          gpio36, gpio37, gpio38, gpio39, gpio40, gpio41,
-                         gpio42, gpio43, gpio44, gpio45, gpio46, gpio47]
+                         gpio42, gpio43, gpio44, gpio45, gpio46, gpio47,
+                         gpio48]
           - if:
               properties:
                 function:
@@ -288,17 +280,16 @@ patternProperties:
             description:
               An array of strings. Each string contains the name of a pin.
             items:
-              enum: [uart1_txd, uart1_rxd, i2c_scl, i2c_sda, spi_cs0, spi_clk,
-                     spi_mosi, spi_miso, gpio0, gpio1, gpio2, gpio3, gpio4,
-                     gpio5, gpio6, gpio7, gpio8, gpio9, gpio10, gpio11, gpio12,
-                     gpio13, gpio14, gpio15, gpio16, gpio17, gpio18, gpio19,
-                     gpio20, gpio21, gpio22, gpio23, gpio24, gpio25, gpio26,
-                     gpio27, gpio28, gpio29, gpio30, gpio31, gpio32, gpio33,
-                     gpio34, gpio35, gpio36, gpio37, gpio38, gpio39, gpio40,
-                     gpio41, gpio42, gpio43, gpio44, gpio45, gpio46,
-                     pcie_reset0, pcie_reset1, pcie_reset2]
+              enum: [gpio0, gpio1, gpio2, gpio3, gpio4, gpio5, gpio6, gpio7,
+                     gpio8, gpio9, gpio10, gpio11, gpio12, gpio13, gpio14,
+                     gpio15, gpio16, gpio17, gpio18, gpio19, gpio20, gpio21,
+                     gpio22, gpio23, gpio24, gpio25, gpio26, gpio27, gpio28,
+                     gpio29, gpio30, gpio31, gpio32, gpio33, gpio34, gpio35,
+                     gpio36, gpio37, gpio38, i2c0_scl, i2c0_sda, i2c1_scl,
+                     i2c1_sda, spi_clk, spi_cs, spi_mosi, spi_miso, uart_txd,
+                     uart_rxd, pcie_reset0, pcie_reset1, mdc_0, mdio_0]
             minItems: 1
-            maxItems: 58
+            maxItems: 53
 
           bias-disable: true
 
-- 
2.53.0

