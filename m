Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11022110.outbound.protection.outlook.com [52.101.66.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47DD7438472;
	Mon, 27 Jul 2026 17:42:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.110
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785174140; cv=fail; b=K3FvsIiznIMIIGulD7n3xPz3/+rbeZ8ynpw/JGNunkycDfkkfZXcK7WIufCCp06sN4Jzoi1F5VX7ACvnAhhsQ0jNd/YSSwcPismhqvMBqoXsEb3VmnV6dIX2H027q/x1uykSvCpULPwqPytjwi+ZJykQDIbwMJpD1XpWq0wWg2Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785174140; c=relaxed/simple;
	bh=fMVan5Iqfd/ICMWBdK/14fIdpoZwPR7bXP20mlnXhWI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=iTstrebpFsfgF81AEj819z7ossGKTaBJQQlkDkcIEJKzH4hNxg7WKo9t+bjuBZM65UizAlwWhlv4n9zSlor6EThA5EcRJ275+3X9b2mq4FPdS9LthpfcJUyXbKqvQ/t7MNwfkIr3dHOCWslObLyUK0Ky4dLwfl4SkPwrrPH/+R8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b=Rcpzk0xe; arc=fail smtp.client-ip=52.101.66.110
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=genexis.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b="Rcpzk0xe"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ps2o66DBpGGFYLvdyP6kXeRMW5c+RTLa7LL90Y+hr4iaB9DwEPBm04mlAGqKGbiL/7x5/TEBdQtQXrobbDnEmnGKv26Fx8mH65XMILFEOV4Kus3PxhtkSQMeYwidaFZ6ipRHCU1dfdaL1XsVmOzDaKHgnqAwiMdIrR77XBrw+U0kLNQYWBtKrpTIWYVkd1H1c1WbDYbIcfxSQAT6Qq1pl5LKCtJ0Zpo8bn9LrQ87o4znqTPHe//8LoPI+OLZx4yT+8uyZKTDDDLsDA/pyl9T8Ecnni6QmW6nwXRqs5/0t6P0AaqnsO+McrlD7qFBJcOl4+4d/KK7V+8ahF7NDBK1kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eh7ICRCOshSN7S+HPUzEy6bJZx/Ck1ceC+yB3ac3f6M=;
 b=jHOxfs1rQ5RwpFkk48Q413iSfA1uaVsmPczAAmG6+w8iAPRh5dR5PgCz+JaNDq9c8O7+627yXxYpjIFHAGeGxtQ8XBkrTi2x46g7Tw2H14JVwHIbBNqMv+xTuvn9mhJWIuNkFs2u5QUvnFjqWVzxXmxk43/9MxETNdQ8Zo8TkX48vQwFq2A7bFZSkvIdLjunIgihInkGs0LjGw3upjUm3DhVpSb1pVFBser8Mu2F9QSxSIqMLE3TiIiA9MIRm/xjF2mzwp45Mi/iJL2BrV2vRPkIAapcWcVEzVH7Glwrkg25DV8PgYgrBHsVTBjrTPyXU7iIJ86Sal46w3IohkzLqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eh7ICRCOshSN7S+HPUzEy6bJZx/Ck1ceC+yB3ac3f6M=;
 b=Rcpzk0xevOkEvEArhyar6PKlB4Yay2DvtfekPZd7H4cSPmbP2WtLvEIgD/VmEdIhU3QWMclD9Y50SBUTFutpCWQoX5BoXZ4TuXe9zPqR4TakMjwp4g3wAbL01vXtLOxvSVkRrKAwNdqTjtpZfd1bIbD2rAU2yEWBf82kShKkDmXNKPoi7BUWmoyFw6EJo//uyYC3sQvetdcFkqyU/nih04kQsE4L6tZYSgYHnNaUy4PIfw/DSUtFvC5WuPrYgQjxKMouID/50aHjSLchPxtSzrlROtGHdr/taBv69/cf5Lgljh2Mn4TDRylTSETfktFvQo/2idmgKn4yZPllXXgpfw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by PA4PR08MB5888.eurprd08.prod.outlook.com (2603:10a6:102:e8::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Mon, 27 Jul
 2026 17:42:10 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0245.012; Mon, 27 Jul 2026
 17:42:10 +0000
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
Subject: [PATCH v8 10/35] dt-bindings: pinctrl: airoha: en7581: allow configuration of pcie_reset pins as gpio or pwm
Date: Mon, 27 Jul 2026 20:41:16 +0300
Message-ID: <20260727174141.664933-11-mikhail.kshevetskiy@iopsys.eu>
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
X-MS-TrafficTypeDiagnostic: DU2PR08MB10037:EE_|PA4PR08MB5888:EE_
X-MS-Office365-Filtering-Correlation-Id: b6717fbc-1e57-4e94-48c1-08deec0662b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|7416014|366016|23010399003|1800799024|921020|38350700014|18002099003|22082099003|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	W9WBNRhIn3Uct6HFAcqskSeA04X02sbNb9C0G/ZL3me9bWRKn8IWy2Eg6McQY6j1vDKS6Qx/pkGrIjU6mUVNKJto+MtRFpr92uQV/xdJprkJbiih9EE5BIW8BFI1DF19FS8OFFZK5YJnyVIhNk1ziXAjmfwBlIHXyHzklDeIciOOegHasEkQOfK33CoexWQIhVkDNVjEojVo2Yag66iUTk+okgHEkhzis5MrU4qBmdAHkwC+MnUsoaGCAa2bw1jw9qafvp808dQxuB+Pg0hlEud8stm7vReDOgDc03YMd1TIVCbXPOqmj1SQ993Jrscyd3JOuo3ocfnDHZmBtx1VGdfS4JWVBOr0AGEjwQfLsXgLR8Dv6Irq+DM8KQpyjdlB1C3VXItHsL/WbIkrfdsyUIzmr7LILqK8smUGZOayxX0N32yVGhbJnpljpmudHNejPjLoxwgjmoSi7BFrM+WwM0KQgjIeJfB0MnuQJm9MdPPIElAKUz91cVuZPqm4tbeFvLlOeV09t7h3G8X8e6ajl+zbZe44qIUlVOSBcEIjQXvPzuY39QNPAkvxNQpL+fD4ue8wbmykqwI2DNc8E5Xb8JXP9t3KWzzlqxgzuPe65GzODDp32niNXKg+dUr8R9s2Z1BZe4EWKCF+CRS1K8PnKmOpG0JSwsj6qOJkYuK493KZLLOYoXZi7QsGfrFP1CcgyqgxtzzLbIYVqq0H3KghxOg4urBqPg30H6FAqi55wfE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(366016)(23010399003)(1800799024)(921020)(38350700014)(18002099003)(22082099003)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Mn7ils6KAVN6szed19hwmRTrvk+f3ZEsSeY3P4QxKfrAYxETgX6KK4qhxuS2?=
 =?us-ascii?Q?ywgNPx19ebVRH1oYrWIdKDPGqDwVO/FPOMcuBiQkg1YYTAUGJncWkQ/FR6oH?=
 =?us-ascii?Q?Dojf+SydxwCE5CyOrBtnTCCan9ztpcLQAgs4NOiDoadUqlv/pPFigZultxiO?=
 =?us-ascii?Q?JEcRWoJLAMpvKdOnltkYGWHYHD58imfgLZaxcqkJa4PHkYm7whsh7cF6zIG2?=
 =?us-ascii?Q?pDsDR+B5hvJAfzXXXZnh5PNpSklDBsV6NPMhOXZGzoqzA3ORnMvQ2ycnYk5G?=
 =?us-ascii?Q?BEM28+qoNyikjnkZ3Hw1QxmM0xovWc+ltQu9Jshhah9zB190Sgrd7DsWSmYs?=
 =?us-ascii?Q?fSkdTUZCUeRCAqDNcqCvJiTJiLZCtnXQg9oCECQNyTEmGmnrs0ya5v8Ho9BY?=
 =?us-ascii?Q?MAh6RYfMlrAsN1XXPwiu+blZDbr5muzL+dtG1SK6+SrukL0Wx6gRX3pD53wV?=
 =?us-ascii?Q?zl4SCKeHwUWFtgMxvN7XGOvDUyUoEoRWhdYUBMWCz7p7cfINQDiOYqmKfqtx?=
 =?us-ascii?Q?Pw15aOJKtJVbZRgr2mwpEcPMj4Gl9v/lgY49R81974HHX9qDHEOqrzuEo/HA?=
 =?us-ascii?Q?ODK5m3rCFQ3QRP+5uzm538+WaVWf+S9h7YOKClcalTgsfQ63JXAGAV2b0+HU?=
 =?us-ascii?Q?sg4RsXXnqtwcS41Sfg+n4IyDJnUQv7iqVG/hxkkuCNzYETgcyZklmiTl9BLi?=
 =?us-ascii?Q?qstEpeQQwZf2YtzITNLWIzoS5iQvi5DrXTZMxlddFOzhel1Qh2xeOj7ukRoM?=
 =?us-ascii?Q?npgsaP2mKj0aDmtkO1Hmyl8/AOvDeG69yZYRm36mdeFcki8EzQLrWX3EIejV?=
 =?us-ascii?Q?rM5r0wcXljBq3LmrVIdsfAQHmeE4ddFI1MHlJbMLbB6YWD5bhnc0g3yWXn9p?=
 =?us-ascii?Q?ehZ6cHLDuaPNTbzjWxZBDyMmeRRBw+57y2x5+Hz7aijUqfiQ5WtnLV4fe/zX?=
 =?us-ascii?Q?kd0V9x7k885P45Qnbce0G6i53z6NYQe+Zqat9e6glVP7XmjaO3NxXXXExm0T?=
 =?us-ascii?Q?xtagEfQWBMLGRun4QkP7DlXQUiaxfmi00H+hjViXboF3n6WARGFOGTOyiXvf?=
 =?us-ascii?Q?2n78lZCdqCEJvbJB9FTg354iFEu4wlOeowikODfPuhbLaruYNpif9UfGeraJ?=
 =?us-ascii?Q?quKmvYW4Yri/C6nIF85lSHjuGW3zgbP+O/TKaqBJIbek7ropOrn0qmFcOX9W?=
 =?us-ascii?Q?gXcgTB8HAXySNWrMq4/tGrr+15/PkWThucfzJed5jbuGVHj2jYWbBMYHlXUL?=
 =?us-ascii?Q?idWQE3msW5tFfnew16eO0VVtu4CFpvJF47ILolNL1CpH33sAHKU+VBAJAXYo?=
 =?us-ascii?Q?in+Z7EqpNQcP+VutQ07zGTbidxAgvL6OZFYQGrvW+Wcwp1iBZjqQnQwrLUbt?=
 =?us-ascii?Q?KwYWXPG/dF35HdKjllKbJsJx6HI1pYUmw/Zs4hcoHtoY+k+4tARsspmfvCpY?=
 =?us-ascii?Q?cSb15RIUjiJycXhmdm0IqN65KfN4RnTRZZNDVxdyRkVU+vUgZkMsxKjvvjK0?=
 =?us-ascii?Q?QUkN54YHB4Q5zYOJTxnVYYNBE/9VyjmmW0dDtyUc8FGtA88oVWWBlUVQl6si?=
 =?us-ascii?Q?SedCCtL1Mv5VWz+ZC+OWSCEyR7NUp0/5qZk0OoD5xAt4Xq5+zwpGwdxE/JBK?=
 =?us-ascii?Q?CrMc+RiQBmMJCk3d5SN7Q0BIthQ4BBFCDAZYKgCzVSrxlqZgR7r45B/ua9PG?=
 =?us-ascii?Q?3zMdIjrIq6zj2SZpQoVw8IwCaulzycWZRuKQuwpDnSoyacAcYDMTEET1/Jhv?=
 =?us-ascii?Q?6K2qQmbgewccOsPgD7M0zwdiNO5tHX0=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: b6717fbc-1e57-4e94-48c1-08deec0662b8
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 17:42:10.5231
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nINRhhdMLNujKvVh1ugPHKaP2HrwZ8ZtaSS9tsMivv0ipWz7+VU5bQiuyIWSHO3eUgx6EN4K27DynvipL3XAevUBrIyu8DN37Z66vztnefY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB5888

In the an7581 case
 * gpio47 and pcie_reset0 shares the same pin,
 * gpio48 and pcie_reset1 shares the same pin,
 * gpio49 and pcie_reset2 shares the same pin.

This patch defines a way to configure these pins as gpio or pwm.

Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
---
 .../bindings/pinctrl/airoha,en7581-pinctrl.yaml     | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/airoha,en7581-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/airoha,en7581-pinctrl.yaml
index 12dd85b5b4105..1f281d3c47cba 100644
--- a/Documentation/devicetree/bindings/pinctrl/airoha,en7581-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/airoha,en7581-pinctrl.yaml
@@ -61,7 +61,7 @@ patternProperties:
             description:
               A string containing the name of the function to mux to the group.
             enum: [pon, tod_1pps, sipo, mdio, uart, i2c, jtag, pcm, spi,
-                   pcm_spi, i2s, emmc, pnand, pcie_reset, pwm, phy1_led0,
+                   pcm_spi, i2s, emmc, pnand, gpio, pcie_reset, pwm, phy1_led0,
                    phy2_led0, phy3_led0, phy4_led0, phy1_led1, phy2_led1,
                    phy3_led1, phy4_led1]
 
@@ -187,6 +187,14 @@ patternProperties:
               properties:
                 groups:
                   enum: [pnand]
+          - if:
+              properties:
+                function:
+                  const: gpio
+            then:
+              properties:
+                groups:
+                  enum: [gpio47, gpio48, gpio49]
           - if:
               properties:
                 function:
@@ -208,7 +216,8 @@ patternProperties:
                          gpio20, gpio21, gpio22, gpio23, gpio24, gpio25,
                          gpio26, gpio27, gpio28, gpio29, gpio30, gpio31,
                          gpio36, gpio37, gpio38, gpio39, gpio40, gpio41,
-                         gpio42, gpio43, gpio44, gpio45, gpio46]
+                         gpio42, gpio43, gpio44, gpio45, gpio46, gpio47,
+                         gpio48, gpio49]
           - if:
               properties:
                 function:
-- 
2.53.0

