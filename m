Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11021102.outbound.protection.outlook.com [52.101.65.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 052D042376A;
	Thu,  6 Aug 2026 22:06:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.102
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786053995; cv=fail; b=o1nVfWu75rGPYzYWh4NZYBGmtqNIgzQG+ujYZqtl3f3z07aUR3WcKkxBWR0ccLGtZz5bjqsb7C5PwyUUayp8FjFhKDlh8SNuPXpKF58ZlvpsxKPLk6MCyvfNr7MnE+uljO2HaqlpdmB2q+d7cTaBsCJsOGIS/kBfXNBRK3OT+5s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786053995; c=relaxed/simple;
	bh=ut1wkMmrtxYLgIRuVZ3bJTi9wf6AkUmH8iN1JHoN0eU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Kf59Dx2PpaHJx1bMRc+RQUSwbC3/HDPQaNfHiOZw3xfj+iIIxjp10cj/ULzlX8BfAcC8LskDmlfP0Vb4JbJ7BJyDCUwOqd2E8FesCBRnSJiI7FJnEY4cWEwOQp+yTp9S1PhgrpR10Qy6aLHiu/9mowmHyt43DAwzNjiAP+z0GgI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b=mII5nEnG; arc=fail smtp.client-ip=52.101.65.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=genexis.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b="mII5nEnG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uAv8KoS1iuOuPA1gx5OnS1f0LJXV/hB5fBFEJjbfxnmYC+0UhqPuCFDnhgbahv/8KBiPAWAHo8/Qh++2qeYBlJaZiCZF/C8rPkIhzRRcbCWciBrsADZCxtGPrN1Pj4iSujHzGoSPsR9avNhqcxAaxtOe0p14k/HcWIA831F3iqRNEEfHxWMEbsA4eTLI4rJZ56NFFO7TNdmL/ami1RylwYU15HQW5lXv6xS0PHsyyQ52Er2XsTjCyYayALRqaEUhfNc3Wn1bVGnvJqoxQuJ7CLiPLUCJRUdgpL7GWOALs2prYEJkIU+QaDLVd6AkHHD/sAQOfUx/Py2xwAHwMMhWfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WrLkZUEKeZ8UlJprxMuGzc7+lKM2edyo5K+IihRyREA=;
 b=WX+DYGkt4WfDl/VPcqsr2Tvm8FiFiOqTlcyAJsUO2IR9E3ohTjQtGcfMT0xc+fvMay3uT2DzkiNIAJb22C5NjNUl+ZYd6orsUnWaZEd4TeFloocBpGtHyFh4H751TTk2q278tI4SBSYSqIixkzfaXmZL5OkyHSp8uJLfLHvZgTFdgEXszjZD/HfyppDOZzMrFKZ5rnz9q3M8QxsUbPZvnN4kDbXGs79XlUtDE1DZFJJSzXOMcvS9tRX6A58pSvfyuDc27r1mXaE1sWpHJlIU+s6lxA3R2U7S+H61PF3N6BfBrcZT2qw6zeRH2ZiJ6TdU/GizRuyrH8JvzD3P9uKAvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WrLkZUEKeZ8UlJprxMuGzc7+lKM2edyo5K+IihRyREA=;
 b=mII5nEnGo8nQVROYoptip9UiIncxndWr0FbPb8gV23hzsq9j/KwFA7CIaZRToEupBCBulaL3pUYy9HlqZAOvIYnKZ8fmCmYHBeWjevPwzQgd6oC4j99yZoWwLily1PKaZ3k5DVWoLrbwHvVuirKpcSJG/6Xb1WD4ZJrG+h3pI4vWNYNI+8juJf0GNUl0x9MEs6xsMRXY0eRINxLqhI+Kl6C1kD4sTmfFD439Po5mzctimir9lOKAeE1foWEFSY+UkXm8ApFDao3ZiH7L12cAt1uMDwtDlP/Bq3EnnwvXFLjeXe5MN7cRf60XW4U7KM499biUSK3Qh/2yRRkCuvKBAA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by AM9PR08MB6705.eurprd08.prod.outlook.com (2603:10a6:20b:300::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Thu, 6 Aug
 2026 22:06:28 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0292.013; Thu, 6 Aug 2026
 22:06:28 +0000
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
Cc: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v11 02/37] dt-bindings: pinctrl: airoha: an7583: fix device tree binding schema
Date: Fri,  7 Aug 2026 01:05:40 +0300
Message-ID: <20260806220615.4078303-3-mikhail.kshevetskiy@iopsys.eu>
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
X-MS-TrafficTypeDiagnostic: DU2PR08MB10037:EE_|AM9PR08MB6705:EE_
X-MS-Office365-Filtering-Correlation-Id: 722d24a2-6c2f-4689-8679-08def406f6e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|52116014|7416014|56012099006|10067099003|11063799006|3023799007|6133799003|18002099003|22082099003|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	FZjDNvNVupg92TbCDJ+Voq3hKmwaF7snfcm8okIVfWLjxJLYfrDgHxnAlei5WS7hcFpvu4ynsEqFe2J/q62+OTNjys2DV/K4uECuykEhD8HDt8Jo9jxOcXYamgU/QsO8H+oJAmuJV0qqhIjS+3ptSZ2pqiJmdywOhb402434L9VC08Bt8EYLZ5cuT0qLtFWqr78ZcgYzTafagM/V732ifvYCcyuplTp9tuKEDL4m3BA0KxPW7fMF553K8I/156E3bM1pMi7kUwtLcK8t/qCbh8dUXpcR9L20Qbhs4MOGpepp/6GA9nnB0DFqKPxyMKWoKfwLGRwj+8CoIWTuXJNXMUfh7BbJKXsCjoc3UHvuNa2/oPVrn1qhw26Xkoqh1YEiw06u3esXhFMVsRR3H6ysODsGHp2KLZRdZRUEDlXunPrw14oA6+PeEVTQAD3WCFqKw2yuKPwM5mY/9Vtd3gmXnx7VIJGsZ7r3syGgHQmJOKV3ZqYP4ox5wy1OjXBpPwi69eIb4fVpzTTO89qfWtLkp2l0Zm9YjphqIE16RI8/ekIHz+FsPSwg+uADfEWlMuPn5esMmCT49G4eXGV6+cwqe6utDima7NN0pETOEzX64WgCSXEqfSO1wWAdyin32/+mBveNIQFYk9Xs7wLtihUFPZw/7WR1tV0vHAtWTqwQdVx11dibglK6EGDOLYkQyNoeIYdCcztPnsls9e6+HXGGyV5wojWZzZe6MjxYhgJ8J4dbYVOLVzlv+W3jxbkZ3ulq
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(52116014)(7416014)(56012099006)(10067099003)(11063799006)(3023799007)(6133799003)(18002099003)(22082099003)(921020)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?q6THRF1TtftCSpWvm5zY0uNMIaBU6pIKd+kVlhKpvIvRUMxgPhNBY5By0Hyd?=
 =?us-ascii?Q?HlFadpi/RUbDGSHCEqn/H3wmMKy42TRhyZfsezzuLx+A+tOzSVCUH+pPLz3U?=
 =?us-ascii?Q?hoFnATMVaCowbp4KebuptmBEEj9GYi8qnHfQEJojnnX7VrF+2aHv1NT7zi9A?=
 =?us-ascii?Q?wyrYeY0Yp0po6Pgg9didOZro06/W6aUeVEWSN+HvSnd58moBTJkrYP+bmY7q?=
 =?us-ascii?Q?E8LIIrl2X1k5oAnelbt8g2FSWwqi5+Chm/Se36aRfYq7upD9NThTOX1eTCpt?=
 =?us-ascii?Q?7IjM+L7OU8XHej+cKLrbbPMeYBQNkdDxjV65GMx/WGr/CL7JFUtRU32ceEQu?=
 =?us-ascii?Q?+riRSlW2Us3Ouz/UcR5D7pNkG3WwRWM9urJeOPLYtQgGRdQ5yp2t//UBEn2V?=
 =?us-ascii?Q?8ox5elZp8n/7oP4XbNMdq69DyNkIW2WSpRVF255LvkJsU5vr2v32i1JfMGe4?=
 =?us-ascii?Q?nAwLA6UarQTnT65SUmnBl3+f7LPPVHdaXBMfn9ughhrxocv4EHbSlBd3/7Nn?=
 =?us-ascii?Q?pKFPB8Z6k8rIRF0GjyE3Hve2BL+2iEP/tZ9KKk5NlCPig0blSGc8VI/PvSzR?=
 =?us-ascii?Q?FrUhBwaKtamfaaLaqJbHjW4dcvNhe2hKWDgIYRchLrGNNf23tKNPQRCiBPP4?=
 =?us-ascii?Q?iMIpbquDOyXupU5w98/vA3Un8eMt3k8lSmOUbWaDrw/5R/ZJws/59UwvQzRy?=
 =?us-ascii?Q?QO6Mu4ngpS7UtC8/RD5Twutzm1I+GWzekrdoZgNPwcA/2ctUG4EzOvFxI48S?=
 =?us-ascii?Q?cs8BpEak15XJGDMRCSshC6e1ndfbz2+hq5SKozXLrt5L+ULT9iln/Ssuf0Uv?=
 =?us-ascii?Q?k0zqrURikwcQtVO/l5PjGL2gNiLiiwRaBizx/1RnWwzE4WtfxPwcusR00T3U?=
 =?us-ascii?Q?pmuSLWBzTeR1RtQ1etDMz6dOqMU2Ctr7Z/PVW0xUP5NpNXgv0v0OeR4dtdP2?=
 =?us-ascii?Q?rOeh8gABBcVWku4NmgS5t860hn063Iz4Gq2T6u+g+lNuw1ALjy9NoltdiGEd?=
 =?us-ascii?Q?teKyQolLoReIIVlsbq2F2OMYrXTRO2nMUsxkwqsaniuyfChM6Ie/KVCPCA5v?=
 =?us-ascii?Q?xTp1zdrcnqvny2nmAPjopK1SvyB1HH6VXMJIEV+RObz45s01Fia9cJJLSddL?=
 =?us-ascii?Q?eoklBxFQvP29dT2KkRPjXvUOo+fCLYpmjYp8tUbul0HyPeHQEdVTPwEWwPMf?=
 =?us-ascii?Q?49+IBYzrqMstuuoNbuV10gCoIo4pvvT1mg51sykETDykX+RPU0Wdh+az4fXg?=
 =?us-ascii?Q?+WTsVHJjVEtY2/bnXHjFo+dOyDh1VmFLGev76IdhT9P6OqmwpjLqf7Zc1g3k?=
 =?us-ascii?Q?ZQX6lHJApDu/VecscU9cznijY/Pn9UgkTl1yUSChA7nj2yILaSBhlrgA1A2f?=
 =?us-ascii?Q?kxZ43wbLZAMT8Jd1yckVh2GaqmcymQy4Cyp4sTDYZsfsXxNHiO5WVOxHEmT1?=
 =?us-ascii?Q?sBtNa3nFgby6HPiCj8Xxp/JUyov7E8BBpip0RGNVe+GpcttFqg8cQbRjXsHI?=
 =?us-ascii?Q?mtpqJsPEABSI5G6D+A5VbbaOnOa79k+VdcUvapXG9wFmx+4nPpNrjd7xAD3p?=
 =?us-ascii?Q?Xe3VK6MPGxq/s6srlzV0nsO9lcyMuvRTwG4P1I1/GSYNr3C0zewMV8jd34RP?=
 =?us-ascii?Q?gGR1yOMGYYJMit0CzHTBn4VB0qRDrZV8MBamP6zRR30BxbTmZ9htcZ/U7wjh?=
 =?us-ascii?Q?+ZCsbVamGZTpY3lLMkATkbdI2b+8E3LpQ5J+X1v67jDSt1qdziGVgfiUrthc?=
 =?us-ascii?Q?ImB6MXjxFlEH5F0+W/poS9GTTcpQIWo=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 722d24a2-6c2f-4689-8679-08def406f6e1
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2026 22:06:28.3626
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mrhoEgB3adT9LFRcoS6//TLa7b+eMxUKDEELLlfmg8DuMyssHRBUDsEEVGkeRoH9BKjOssAzLtPAqh20gc4mO4yXQMCdQ6nhnB7eKly8qhQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6705

An7583 device tree binding schema was more or less blinly copied from
corresponding en7581 schema. As result it's not correct.

There are following issues:
 * i2s pin-function is not really defined for an7583
 * i2s pin-function by mistake was replaced by i2c pin-function in the
   functions/groups checks
 * pcm_spi pin-function defined for less number of pin-groups
 * pwm pin-function should have more pin-groups elements
 * unexisting pins was defined

Fix an7583 schema, so it matches actual pinctrl driver.

Fixes: e6e47d31d3f8 ("dt-bindings: pinctrl: airoha: Document AN7583 Pin Controller")
Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
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

