Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11020103.outbound.protection.outlook.com [52.101.69.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D374349CDF;
	Wed,  5 Aug 2026 12:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.103
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785933273; cv=fail; b=HzBBbrH/vN8os1mpp/wuHq9LRr9HU46R0h4G3+c/JxZIM1S7o1EcswU1PTqd90Kq85qFV+tQhB6Dux0lut0E1iKU1RwK806OprWkSJxvFfGOq0QCbrgChB4+avbO9mytSpPqdfuQCSEdoOR6Ij6j5I2xh/g7LMuZFRkQeq6yV3c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785933273; c=relaxed/simple;
	bh=zg934RrwikIyLYT1Z6PLwkfaapeTfMsMDTmmHJ1rquQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=OwXRhZw1wwIko0csgqjDHwMioHg8Zwt5KI5TUh+QpuQiMxe6pST0LM8dEx2CQPpbRmarBcyTNaIWs0Fvai6bZduYqA12K9LduIUc43jsMtOiAkyiME0VPB66Lt05BrbOOjyQiSXNE1gxpVGsya9Ds+Ao2Bbw1hg0Wx38WowWOKI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b=eK9okcYs; arc=fail smtp.client-ip=52.101.69.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=genexis.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b="eK9okcYs"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UodDBsP6nbmeqtu1a31b/Wz2qHwLDJ0JnltQpvIHzdJF2OMO3ZQfYHOSQeED5BzoH3g4F01+06XHFmjZ1lR0GaUrjvg8POIbFSGXlMxz7OjWElgOT7vMqqum3IGLkedcNj3qk3lBXBKi1F3LgER3X8LYA4T0gF2aTQ1G9f8yyfUGUDma2As5fxsUAishU8FlWOMQusYBT3ycNOb/1CstsEDYAJq/OVBluma5IswUJ5Ll9EC/o7c++GChByaX5KJkFw0FPuuDbSkESYUeKE5Jo69aMXZjfzaas374j7QHPzUksDD2GtqNdrev/8O92hxMv2VV2cJa0N2sp0zn+E+MMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vQAPX6Ef16d9WcjMIdXvoLizd3siScE7CRnBHygewkw=;
 b=yQ2KOOQJItpxxbgqIfdjsIbMqhJfGOGGqd/HcrF1PWxr9aJDrJScEbAUe7iCkGm8QCJZLhTbAR6XzpudHQ1BWKiQgjx+5VyA/uJtPL4ptLY371/cqv7XDwJSU5Q69Dp0QgqWAlVOpNOXUH8iS0dYNZNlO2LHMhZ4Wkehos41JX6O/6xvBNJod0VMAVDDhOd71HFflpEOWBD1gE1QMCP10ZqiS3p3m/OOteGzcSaoV0+4BoYZwZ/8DU4zl73YM5Cc4Kqk9EIb/Up/ia2IwkDqOGpYkwxkwXRw5gipDQ3JH2XD3T75BMfasdLmB79aCVoG3dqVBmf0roI8xmGqObljeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vQAPX6Ef16d9WcjMIdXvoLizd3siScE7CRnBHygewkw=;
 b=eK9okcYsPeEe46vwDqeKAYCYoL9JToNqsm/t0K/o7+YM+hk1FFKJEonOE4t8RLaatbVrfW5yP4/aj+rjvsWO6b5t2EBxn0gmdsaQJbi6MHQd5tYubTKLyhgwRR1jLwi9j1glCMREs9UW7spVsheyaJ4+ZJvyArzs88W2ICIJzNeN7+yS948qlJbqFeoPkZTy3xz1K2BinhCMz/slZK/FHoJNuBxLI66jXOPlRbXN75prB5QrQKtMdQ/ZX8fwsRQYWwL0gBzdeaokMxbFXuZwvaH4yoR26R622kFiItAAaq6Ga64wkrn7Iuz39R4MepZtoGBoEYdGAO4k2iYb43sJVw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by PA6PR08MB10830.eurprd08.prod.outlook.com (2603:10a6:102:3d3::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Wed, 5 Aug
 2026 12:34:25 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0292.013; Wed, 5 Aug 2026
 12:34:25 +0000
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
Subject: [PATCH v10 02/36] dt-bindings: pinctrl: airoha: an7583: fix device tree binding schema
Date: Wed,  5 Aug 2026 15:33:34 +0300
Message-ID: <20260805123408.3767648-3-mikhail.kshevetskiy@iopsys.eu>
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
X-MS-TrafficTypeDiagnostic: DU2PR08MB10037:EE_|PA6PR08MB10830:EE_
X-MS-Office365-Filtering-Correlation-Id: e46d5f08-ed30-4ec8-283f-08def2ede250
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|23010399003|7416014|366016|921020|38350700014|3023799007|6133799003|56012099006|11063799006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	P6sqWazyesvlI2U/ffxR7O/At9oBc8J83zXteealUWlioupXtp8JeVxwQHGGb2lwuRPvGNnNmIAxoSk2gKW6MpLUNd4rZS8xxVRDC07eh4p7008dF6UAZrnC0My50JOZpr9s7Tb1SiqCT7cWPdzMNtELndFlXRqA/xSE1+dIwbxgXtofFsd5Uzgy24Ie0IKsapwQPiAvBWvdcD68BwEH87H0+0H+Q+r/nTvhVVda4f/HPk8uM1wa5S/7TDfKZD8/eMeDlInxXXYP4+LsDFxj6TseelLUs1bJG7SsiPgt0YhaSun/dZErwoAu/4HilVk+eFdpdIOoz7jFkU+ESB0Vd/pGFyunQJZmRm5NBQq5due2RCztA1LJ5EmHMblWV4B2Wj9T+n+9HUpO5rgLoPAXV7hlckinYt47W961pj+q6Kf6f8ZWqK1R35brbzWhtCVDPcOINyyF8ffTzLlSYnc6CDwmPchfovkDrxbXDaqCRqFktuU6NSgvk2oOQB7S+TbafIEne+e3YPlX/uP+TJyd+Qk3rQ6HcZ6ouoJ8ajLaDJUwv4vNVGKHNkrQVvVLDUxzA3icOalmNnPgvDBhOg1vwC9DVEw/vQeSCX5ZfB1GxBDli0jGBXd91fhdxS9OgQeVkQ+61SzrvgKS0+z572PT792roVz0JInRbB75b3LmqQ0UKyXi7PAXBBnlelv9l9+GMIoFsrDbh8ki4QrpU2qXsLYgw6Vubp3ke+FQBwCULxl60ka7ZDhIPnFUthuOpnvW
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(23010399003)(7416014)(366016)(921020)(38350700014)(3023799007)(6133799003)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?XfNbj3uJlOqufQ356giGSASJAQ3QsHRV7+O4o/AJnyqDzQNqRu2/N26BwALM?=
 =?us-ascii?Q?tnm/qaGpaakr14FvT45B3iJ0chAkNs3wAWSGM/cbNyJirGGonuFgDnbyCLaR?=
 =?us-ascii?Q?6LfAukxtB4e3lyB918BNibcw/9DiLi3iT8qDG1ZGsSg7Lb9hNPgn/UFGoi8I?=
 =?us-ascii?Q?x7Zuz0tvbU+USiEcnUX/MiJraOFXPaFHVs7YRXo666oobC6iMSu4WHzOLFw3?=
 =?us-ascii?Q?UktKez6y+bqwAj1TWKgIjTeTjD4M0gr2AyR44lAv00Vqh2X985Bl26iCVKSe?=
 =?us-ascii?Q?z8k4KXgn3pvOUdoNlOgdzwZQi9U2WEJFwYksmttGuIcDu21RmUhELfEsq/Ic?=
 =?us-ascii?Q?k4HsbgtItni/TPD8041Gd/leJLxeh+jQof3ekw7JHzcmnMQ4BDShkA6NfDUB?=
 =?us-ascii?Q?DjOaivZGvLlT1k5HiRpybqsG01w5APTCpb2u6VhJcim580OgRPytz6hv2PYL?=
 =?us-ascii?Q?5clHWy5f1PK7qIcgUseui0UeDTNVqu3czHNTlzPnDdfcTkMBIg2w++IugK0y?=
 =?us-ascii?Q?h7jqeQ0XaU1xSSBY+cwXKURhexKXMnv/Ol17gruhlmUBiagyPnoLOHy9bKpx?=
 =?us-ascii?Q?Y6aHCQI22DtiK/1SpYn6W05SKjCR+GUa+QRifDqrw7NDTnttnQ80EliPpdFB?=
 =?us-ascii?Q?w9F4ow7ojwQxeMY9BzAUrMoenOBzOHeV72Jbo3JKV8bzwpmdYixKKq7LDxf+?=
 =?us-ascii?Q?xRcUKs6KUEz8zyo9oDDqEB2X340L4wHR+hKHr7jV1DRUVvwSgGIQ/17GNOL3?=
 =?us-ascii?Q?z0NNtWvZRpjsC7nzVRPSaJRTTWvh9AUy11QHcsYyu/tmXb+NqA+NAsHVn7if?=
 =?us-ascii?Q?p2PaqCJfYkbJimVB0OIQm2IPq6sHJLkgx0QdKwE8DiiX7bMHllanAxWqlk1O?=
 =?us-ascii?Q?/aD+ejn9QOuhG7XBj42WWCxZJ/h0WF+59akriG+7AWRO1h1sIUqyFW1G05IY?=
 =?us-ascii?Q?KBOUP+tFDNXuvnrTZZCzjsRF3+nxnxGBV0iaAG7ySeW0PbaF3WZm68a6rWNO?=
 =?us-ascii?Q?T6NXpv5XoFR371xxU9s7L4BXBwRhuMA0moaF04KZ6oG4wTYH98B/vIurnHRk?=
 =?us-ascii?Q?UeHp0I6yBoNGqvmw4EmklYOQASEI/LQuSLoBNyNP9ow0ARkInBys0VlUMzcr?=
 =?us-ascii?Q?IV7X6p24rwHvbarAEyBeTij/B06OjU/3jSkSA5q7TMzyprmvX86Cy3Sfk0gM?=
 =?us-ascii?Q?OHA5v5QYZQmDMM+aMA5C4yliEI75vpNhf5MM9LKVTglhPEF/xO0EnVzCQ40o?=
 =?us-ascii?Q?CVHVgWZ6MMdPbYnKg085HFqkQugAUvbM4E+dgg5LznPrb0R1zFKFUnIIV+Wv?=
 =?us-ascii?Q?ZqvbBZRPsq8T47MennrFoEOyQJoXnww6Jov3Nbrc7j5c/Em1wmdkbgXZOlTI?=
 =?us-ascii?Q?U+rK6wtUQ6+Kb2A93ptDBXIcZY9dQDA5R5uf6BqphLSonhj4g6Afzmrnj/7E?=
 =?us-ascii?Q?mDrCDCfFxBIuYZVe5auEqNv/LvdfZdhsHKLPe1k8CLpRpSwikpI938JT9UW1?=
 =?us-ascii?Q?4W8qq2i6oosN1UXriN6/PSeNX25MbkI7v+/XQQ9Xh7JPEokJ68HFoJi5E91t?=
 =?us-ascii?Q?9oEKLoar6HKT4sAkHJ6V6XLff26l/J2JzY6E6fbPECDhwrJNWaXQ7bgN7omj?=
 =?us-ascii?Q?K/uDljNTGgUHP7MI2Eawdxf05JjE+ByTnkMHXveH6tIlwUNKsW9+L825WXDI?=
 =?us-ascii?Q?odFJNgWCiRkkcg6g1qJ3awL+kQai24FyJPbZcLXTQViy2hCPE3s0T/qslD4b?=
 =?us-ascii?Q?yx0WH4zBqi1hDllwfjirKN4suVyYkCM=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: e46d5f08-ed30-4ec8-283f-08def2ede250
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2026 12:34:25.3075
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sqtW0lbMPy6+XgwRtZvb5MOtXZSXrigOlNp6vpqzzelacbfwTxu6qVTpwRUL0LD7FlfVxRVYHhQ2JtarX02IiQw5wmyA6m1n0Bz49GSfI8g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR08MB10830

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

