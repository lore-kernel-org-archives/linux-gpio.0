Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11021084.outbound.protection.outlook.com [52.101.70.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BC73473C80;
	Tue,  4 Aug 2026 16:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.84
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785859478; cv=fail; b=jw16sXUHEQbJKjSZvbuKLFMcN5PkGNscO6gQxZBEl2k5Q90GgRP/koBnDtsaIzvA+Bw3aSWBqJZ99IDhYDwUrttyXKf1oEekxx2AEjQku1aE5v3JaS4X2wT9JDE52nS8qRkKFFNwtgSX01OjEn/L7kRBKyebzKNCgviYJ8JLu8Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785859478; c=relaxed/simple;
	bh=zg934RrwikIyLYT1Z6PLwkfaapeTfMsMDTmmHJ1rquQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=CZlIV7EVH4fwGdAiHrDDMJvw5T48SW1E1TErAC6odJpww74CiNJo+1/6LXDQbCRQSKLQQZdpQfLAORPU3gWSz2VWVpFcJ0ZIOKIafkn4SHobIVefEfxROPU+Bmkn/wh084wruV6G+r2maDTJbRId2nFIALZQMevVEhS2mDq1s+M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b=jJZNHc3D; arc=fail smtp.client-ip=52.101.70.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=genexis.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b="jJZNHc3D"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k5eLsTiYY04uN6qe1iU2kf3vy+CynOZwAD8xEMm0ckM58rR9WFqBcxsmpVSPkc7RTfeqIUxhLaeYRrnZCUHahLhwbAZI/e0B5mOnmJEjT/qJldQjyJuxbaJMWM3fnXZ5iR5N7Dap9uTRiyx04MU4bA7fHnVHpS+YCKgezFwwtfFF0j1nOZ564pxurmu/r6GebEhD/PGbHHfAqjGiq26wDJrAvP3l7chtOIlf55qq0LHsnh2jwEwlDoReQYCmpuJGyI2aIwat1RJ1/cyQ0tL02bherOdrIffERP+E+QoeozvF9dJm8fNFZoCmqAfwcqRkAvSmjCOLICh+TkCGp8TN4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vQAPX6Ef16d9WcjMIdXvoLizd3siScE7CRnBHygewkw=;
 b=aI9UFxN0elZmKH2R5AyH0B6TZ4S16zk+UJFdN95jc6Z4hQGFHtU0GOF2WOz2EaxuQ/9Qj4OMaW9I3cyNTDLKwcVywHcpeAZabUANYBLFssmeaXkm+TkX3Fpk7fm+9bJzX1daF5+i6SrJ7Fm9/Abl6DVAFV44ZRQWEcqQ642Rv0Ij1wa/yYQGjF5yz0Y60wZFNmb+XfteHtexSzLJd0nS2myfD3Y5TpW96waaxVRuOPRHvjq7f0bA//11CmNaQYafynrTtcDeumRvT+4d2wQ9K9v0jVkN45XafD8YgB7l9WQT+8GHHEZm4tkuvrqfI2ndXEUKnD+kuak5rsWZwFVBiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vQAPX6Ef16d9WcjMIdXvoLizd3siScE7CRnBHygewkw=;
 b=jJZNHc3D4C4K1ncVFnY+LU/5tfGwqVUucHa/Pg/npN3lVPn+AucKiA38C4AqtcnVnqqNPzkthxg0BxRELHQ7xc9zeyz1UfCxTB3DCPkabfnQKy0l8msAMKQjBaPsXo0SLK05RB37Bll8O5HwMJqXjubtoFw61WjRH2ni5sfY9s287BhR952k+FfaQGhTfdkx9Y8TskXMfmK22UMI9JTxvb0rCSFAc7/TDhN7zZH4nQ7Th9Bvq1Wa1taJ8w1aq54L3rT0t9tW3Clcw6MaQIx1xQeJwVC0uZJ1cYzb+28JVDSZ8cUQT0IT1bFDlO0DtPFda03rSY7CzcXbjdvmOjXE4g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by AM8PR08MB5761.eurprd08.prod.outlook.com (2603:10a6:20b:1d0::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Tue, 4 Aug
 2026 16:04:32 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0292.013; Tue, 4 Aug 2026
 16:04:32 +0000
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
Subject: [PATCH v9 02/36] dt-bindings: pinctrl: airoha: an7583: fix device tree binding schema
Date: Tue,  4 Aug 2026 19:03:45 +0300
Message-ID: <20260804160419.3592327-3-mikhail.kshevetskiy@iopsys.eu>
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
X-MS-TrafficTypeDiagnostic: DU2PR08MB10037:EE_|AM8PR08MB5761:EE_
X-MS-Office365-Filtering-Correlation-Id: ede91975-d423-4ee7-88b8-08def2421224
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|7416014|23010399003|921020|38350700014|6133799003|22082099003|18002099003|3023799007|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	/dYp/w3umUSIKp22gcVhjmJK4rDQ3mEZJgJZJiIhcNmKflH/Iz5v7dOeMXSSYoQkzHolKDUK7culG7Cxf0nuftOKXVwFSStGLGvux0YZsdYPJ4Ml7lK4ryV38CXAwA+mOSUw1Eqh4Xds31bleGW5Sjn3Pk/pAQ00Q3pnMEwBXeQHlqHptjxTE1EPbreGYr+crnv0j9bQArEsYg+PNwq4h1m7vUp8IJtqCWjK9Qv6LlloiEw434q5DvqNLacRpAQjEzYsnviKZf68s/N8fAF1F0fZfRPwPININ7+Rh1z8+0Nqm6G0SMmSh6/QGLCVNAHMqFktfKDAVRnqoq9WTetZYVfJdK0yX2OXmSj5Gyb6RYRMuEESlQHWSVhM+QopbOaNpnpyaAznBgzsIjG3luG5Fqz6slErB4ckvMN09qQI/iNFdOUcEGr0wOFkdO1a91RCr0JgvxOmAr2f2EnHb3VxcQI3YGXzbqEMOdViw3Pb+4llIyMD6mzBNn8MQH/6DhBCENTH3jTp3sYbmfmyeNT4H2W9AiLXkK9muPdb6K2SjDjhvXy11H6D0VO8g2xkJNvXLeiskCh37Gb26wL15eo3mzUmKkJRkEXldcpU/NwK/ndukx8RYJQDRV3e7VaOHHvqw5eP0Z5nc6FhvUgUfs2d2hram7YQSRAsBaKeOqQVuj1Xhbw9ipOugqaoQ17tiQE6nDATXL7AZSNybdBY3hwX8tiaGrRpyquylDoav8ohS23t510Q2C61WCHHq9eVMgpk
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(7416014)(23010399003)(921020)(38350700014)(6133799003)(22082099003)(18002099003)(3023799007)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?kOQjPpVClTEA0899JH8qS+BMabrSqsqY6U8+AYVskzRzSaVL6HSJWesIwS4e?=
 =?us-ascii?Q?NdbtpcVApFhb8ERQgesYz4zJJTgSEkDjNL/q23MGqF3ER5kK22DQfBor7V+O?=
 =?us-ascii?Q?s5aLRkNOYltHT42lAgOIMfSd6wQG+fobIY7xqwDXwAJtGIu57sH/u146qSVf?=
 =?us-ascii?Q?dAtQpY5TsrY3kIMAYkyXKg4RI+ncR8cyy5gS0OvAMeK1fbIiz4UnzXlZXFUa?=
 =?us-ascii?Q?bf61w7ZO3GdG8yX3CPhN3cHrX0RegMJQ8oQAsUtlnHgcz9e60TfKw5OaEGwU?=
 =?us-ascii?Q?pvTSK2pvd6JjuC6HGc/MvKfqSrFyfUxYDqG5SWipwhsBARCi98Oxkjhr272y?=
 =?us-ascii?Q?SZLBQjJrT6PGbPIq5vC0B9+2rE6prA3B0Ov+t2FdlKcioDXCGB0J5fHqtfk4?=
 =?us-ascii?Q?PgKtATjT3eYfDjX+7ma7yDE3tmZq3aSxnjww9fyrUXRaShzgTCtvU7UBWNfV?=
 =?us-ascii?Q?jXoSgwZro1lNB62X03Ko19Ss0Gclla241a4b059bC6E/9oFpf4yhnB+55OTy?=
 =?us-ascii?Q?eyV1SHWSVFu0SEvJIL/Vsa16kkO0oMcCH6FFaMEEXSae3iwxsCGzMyfebdZT?=
 =?us-ascii?Q?RUyXdL55ZLAFIaPPAtZI0faj9HiBEjTxO2MFodiMOrZg7smSwFzOse12szFb?=
 =?us-ascii?Q?2d2vHNBVNj7K2siMk9D4urU0La9bbC7eMg/GkQ7EnbGW8oZoTyVevu8C7C4m?=
 =?us-ascii?Q?yecKjXCnzZWfKMmEO+sqYSqv/tV9zXqVuLBqH2V/N2lEG1qocq1i1NEEWqjP?=
 =?us-ascii?Q?z2LPyeJo083QBtk49XMQjVLEUqFS38S0oT2W+7bhLhRh2hch7Mzv34upcWgD?=
 =?us-ascii?Q?J193Pk5yXfdk5K5NuRUCRkfgukPoJ71CCq9uhnAmBYYU/ZPyef0Hn7O25/+/?=
 =?us-ascii?Q?aDXS6/nhOpCuSZinZS2iHfImRWKkw5ZY2kF/rE5TJZitJmX3ekl7w9Lnj4If?=
 =?us-ascii?Q?W6qSNw7jU5bCfqkIsBpUMbP0rC3Tq8avXz7bwrHO5KqCWpyAKe0g+6X6fuYZ?=
 =?us-ascii?Q?zTRd7epC/mRQ3JJG6kTQvWXVeYPNT6tMvebIEkUxOSsXjmuzsss0Rxe6SYaq?=
 =?us-ascii?Q?/Z5WxhaWG1IaMmiXewLOxVKeI0aL77slAO/IQG1OuQWntbowOectVaPQuKLi?=
 =?us-ascii?Q?CZCCVY1BEvFUYl4D1CfbYqeXm7ngnPilEZxMpDI1iFJnOKDi/4kNlUQRp+7G?=
 =?us-ascii?Q?xx6Hc2lzRuz6iXoHKGtXS1mL0Wic5oBdAeFNNmBRgr5sQ05uyIpoELEQB2X5?=
 =?us-ascii?Q?fw68WArnspvHOQtasONg3u1r1l/du272BoMnrrhWjzrAarqU5VVU6QPDshuY?=
 =?us-ascii?Q?gqtY+O52NE3dO3rKkzsATX9YGt8B0TZETP4Z4Is0PpQV5n2p4QgqopACsOfm?=
 =?us-ascii?Q?uhK6RRVWfbCnCNIKVvB0Jdis3LOyLu3RyDWIPZoDaTbUVHQM2u/habtkTe7k?=
 =?us-ascii?Q?o+8KZtIbSjQz8sOEEe4yLsI3YGlu9WJwg9qwJwsixTFg5RgJZICiw0guicX1?=
 =?us-ascii?Q?cSsOiK7usvyGyoh9LdyHHc+vVQPD7T6PWa6j/J2LraHJXZfC0Tq06YUWtGy5?=
 =?us-ascii?Q?CmkFTsuK6NJOfhs/fmxFF8lqq6I8yV/am5ss+WCXEpeci+t2O+yABCJ8ooep?=
 =?us-ascii?Q?sweZte89LO7XHIBxfai/0S0qdY10Xm4nN+FeIBxtSKdHk0Bqu30jYqNjk+St?=
 =?us-ascii?Q?t2PcaJYdbKNHzwwXde5oTaauphun7u4n9x/l4EKNFqVTe87f9KstjPFBpp6D?=
 =?us-ascii?Q?O21twnvgOpFSEMuj46LwlFXoE63J3iI=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: ede91975-d423-4ee7-88b8-08def2421224
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 16:04:32.1697
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RMpNRb/IKyqeDmwlqtcOFSILZSCs5LP6N0CQqjiY/TcB1pAnNCZFOeOlLmBqW27e7kPlTLsZN7wWlEkdEnzp8VM1IXFpDC0ZJZJ6fKsBhfY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5761

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

