Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11023076.outbound.protection.outlook.com [52.101.72.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8A2C490C0F;
	Thu,  6 Aug 2026 22:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786054049; cv=fail; b=mWOM6tv08/9s+bvwbeUalMitPzXMZlocHNrwAXj7J1zLTATEjryaIzRzcUTeutHlNvJ6B2dp1PbljRqkfJJ3GD7ciFXIpPNt53c923V+AZK0nGtMuiR3NDYFjCwSA1XsrvOPJlcR1C0NJQ+TGMS53UYsUj+sZLtR6XuK61iHQgY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786054049; c=relaxed/simple;
	bh=lJaaORaJu8I+hGg+pyk2/M61fXN2KWzXLWF+f0oIcyM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=J0a77HO3pzGw/PN6xGBXXend3m7Em8jRxZGIaEpFjTFG1hHm1T5q1scv5ouPPFCOFVfTJtcjP5e4Caayr29xgsJAtkoh+sNuGIXA5e6Q04eqo5CORGsGSIvGYtqMiaNfL2c1R+P87DpGFzff56HoYCamvX7URO87e2OqePoPkzE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b=J0Y9z9v7; arc=fail smtp.client-ip=52.101.72.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=genexis.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b="J0Y9z9v7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Puot21khm7jgEir1esiiY27lAPD98uP4FUSDl4J5b3vBhNe/wkXj91nEX7ZnF/b/vOzX57A9NFyTtu1McMYpKiveiIpyG2L6SxjKR+pn5j1sTYiYvz8FJa4GsTuCat4Epe3/I5qJim8pvJefmeP5q54j8fm9cyAyOycN2rxfw7SicwRy1t/7xVh5/apttws+xRb0FsnKTplmhw8IagUc/Ql6gRNJgPnXzZIU0D2ZJftA6/Wq5YxZ4g24QnfCiJVB1OQzu2Vd86pRHBFrHZcAK+7AqLXim6tPI8aCHlxZFThm1WGjncRJKCvzGf/jJmb133/z1O4MTAQAI+9yJnfMlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dUAVhfk3I1KJ34k3Wmm4OUEpAcMSAHQCFGZ9GbTh+b0=;
 b=JlIkK/IEFgCcdrVTJ5ShDPOnhLtlD8KlUYIeauNvYd++9fhUKlGdaudIpA2Cg1PPvgSXR3aR5WVmEmnv2ysuRGZ916BvomkSnCM0Uvdn1RXAUZ5FMnuJKX0whZQsD6IqrTUhxA5UjgH4NJIZZIwKxrgKbDHZ6HoXWqopHfl4iRyC7OOffuiSKgT4MgObaY1nexpDMjFoJaIiMUGzVlQOBpl2t1/9JZUw+8DnXY6BprxHBQhUpl63xLve1f7Pi+Jxr4vorJ6kCZnSNiJWiL4gIGfOrQEy47Wb7UloZDQN34qg33VBRLyZuoCJNzdeuhbo1rAOu/elfAEegp2C/v8vhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dUAVhfk3I1KJ34k3Wmm4OUEpAcMSAHQCFGZ9GbTh+b0=;
 b=J0Y9z9v7w3uMGh8QaodgqrXgkbOreHO0bF6ejWAxrVtKQJEhAMQMze0fxLeEo4xbC5kIjMsc4YXjBUjQQho5Txea3bo5meM4p3l+vbxL7wwkT6Dk/1tkzkjF+6Za7RpyGlQbvu8KCQZMPxK3aIkIL0eD4GvXPKkAZSu/xqCgwDmT7O0g9L/U6zXbzHfWjfY9CidGrRZQpKECGmCFBH9p1xYHnX29Cb+ERDxTncPxQJ+CjjNW/EotgLh+VYHWSQzOlud9AxJ4yU2gnxnOF4uGLzhQXysHuTguGom0DQpHtVbMhE02pFUBleyZ78apWgldJj5axRSTCxkoaoZ+eiMrqw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by VE1PR08MB5823.eurprd08.prod.outlook.com (2603:10a6:800:1a5::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.23; Thu, 6 Aug
 2026 22:07:18 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0292.013; Thu, 6 Aug 2026
 22:07:18 +0000
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
Subject: [PATCH v11 29/37] dt-bindings: pinctrl: airoha: an7583: add missed features
Date: Fri,  7 Aug 2026 01:06:07 +0300
Message-ID: <20260806220615.4078303-30-mikhail.kshevetskiy@iopsys.eu>
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
X-MS-TrafficTypeDiagnostic: DU2PR08MB10037:EE_|VE1PR08MB5823:EE_
X-MS-Office365-Filtering-Correlation-Id: d3cab7f3-19a8-43cd-06d3-08def40714cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|23010399003|366016|1800799024|921020|38350700014|10067099003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	EsSmO7D+laWmdZ2397TCTRqp+5WEO3PcPII3QXgzB8O5RdkNo3f7KSSGsvL8CDo0LmKn7WLWSoU2riIfhV4gHfTk+nPxv/QwpXXa91ujmajr8FmcljBkZcM/xsPI8TxTdGXURFO/C10G73AbzJADV/bZ7iOqZgrNvzhIg9FOiGi/n3OBO6o581eDUBkXgbFRUg8V/G39dh+dkq7i/A/JzviMqlmhvpiTEUps3D/VlN1TlyqKbuwzJIYQ0KY9/rxkJi+wP8is1Zl8sTj6Yxnuk+FZtmJPkwelkt0bQ98U3sc33rE8WdoXQSW/NNRMYXFWIJKjlXPVaY8fsXN6o4jEtwXdt0MFJ9174eWC3wraD3zEC8zZh+yGSm010+lbeok8CSiZ2/lKAC5Lnqo34HtM1haRlB09ngB3XV4zxaym9HFjljGg7/K4f5czGkrBVgqIgOjyFK/PXa++8RfBLrwlgzv4tL47WX5lFMZLNp9/3NU0oF4FZ6TEeBHnpdKR7upldW5jBx7O7bEjcBPR1fGtOFBvH+5DGDQKmE9u8+G5owcwX5BRRrwXg0hARSgENzmV4hchUk+v8MwMLX8J5tsYKYRr9OIy4sReiLWT2Tr77b6532J1bp4dmpmc5k1dvFR74sLR3f3AHhOdyXyzNlLVnxTjy7+OPD1pZDDCTXPn3wcxMm2X2l0zjjiY775GqheMK4a/0q2RY4EITcxMF1xYDZL+H6TS6r2bklQtjD6r8rfgIrUYdee0+H/5DnRFSFD+
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(23010399003)(366016)(1800799024)(921020)(38350700014)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Sj9FSgPJyIQVTzXx5TdUKTYDihi9EJ0mzDwh6Luy4QNtaGNJcrFG9b4DAEBt?=
 =?us-ascii?Q?kJ1nWHbSWMisKT+ITg8BgoOia2X1MJRSWhbHMmUQ/q2NdrYsn3gnNx1CaY/B?=
 =?us-ascii?Q?2EYXq5jkRl67TuYHHfIYxDx/XemFYHI0LZZU5qyHGQj9vOhzdHWYjAMk9duf?=
 =?us-ascii?Q?iWsaILFaq5vhmFJKgJY/oKNvznk3vBw5/aXnQK66UcxeI9GQIutLWCRMSKj/?=
 =?us-ascii?Q?te3Rd6/rllm0A6ls8Sxquy4AKbwzUbQ/06COGuMFXZcNBog7C8kHNQObKqs2?=
 =?us-ascii?Q?wXyPe6PXUCkt48h5Duv2GaIGI0N88JUFc/PesrX1DfIjn4z6d7gfF+Ae1HrV?=
 =?us-ascii?Q?OKXXa4mlJhAX/Hr52hrTwMblxQhV7Kmn2XbMUgesAsZ5Gqzkrm/SgOFQW24z?=
 =?us-ascii?Q?aF5Y86J2A6EHxvLfhGFMdi/x5EDcv4u+HL2kGLxm6Y4SAj7MTAswyq7hqCfj?=
 =?us-ascii?Q?yrU7FSk5UbA9QIgceMA57RC5wm+0v8ApC3Kb6q1HzfqZGN3/xW8z5dn/hR+x?=
 =?us-ascii?Q?oXohqhuc7zvyDV+KM1tEdopiEOgOYWO01ERMaa49/knrtBTriEBeISOcvfYR?=
 =?us-ascii?Q?BUIwdz0q2f7RPBlnTSlKf8XglgYBuZMg2fu2KJRrK+7wuCNxHNFAH0UizRGu?=
 =?us-ascii?Q?tRUIyUn87LdrTDJWTZ+/7Q92LlOxZJZnxsrhea6IdEySD2RLLuBVCEJ/nwje?=
 =?us-ascii?Q?YlxEkeM/04O8jilBWvMx/kergzzD0LtsepQDYH4pM2b3OC/wVuLb/8sJcqzF?=
 =?us-ascii?Q?sSXoO/7hUFAIA9AUljeZgWUT8FG0y+Eagi4DSBMXPPmlvdgklrIE2ChG7Szb?=
 =?us-ascii?Q?PI9G15Yo7s6G6kNYW5vlDuncU/YrfGN37EUXQgoEmSi32G/BpcX4gBHBzrM+?=
 =?us-ascii?Q?yaRQ1WJvBreSSIdNSSa6BJ9Y6YpuUnOZRI3DH0xE/bKiNvTUakmbAewRY3f7?=
 =?us-ascii?Q?jcJK9oM5FVAgVKH3/IrSRGt67i1SqcyY1phB5S9phygCBgiq5rs5YCgX/ktS?=
 =?us-ascii?Q?rPh+yV9x7z0JH/ryTtsVJ51Zc9a6JMa6nZ7IkrSU98CRCEbRZxXOwuKtFTy3?=
 =?us-ascii?Q?l9WN4z9t19zZZhm6UMgfsnS8OfU0eMomtUOqy7zkIjfuw9dmqOn98MtTLvTV?=
 =?us-ascii?Q?SfVYxkGwMChjCarcBFk3Q7PzuRfl8Jby9VBzgqkHjK5D4tkDjTxL2xGPkHLJ?=
 =?us-ascii?Q?SPIWIroBtrLtPY/oTwr0QeTdyFM1SQuZA6ZBwx/FgejnfhApxv6wii4PyF0g?=
 =?us-ascii?Q?NjXdXOD2ZZpgcJVDf4lS1lkQn9DZ195IXWeH6bHe7j23o7SvukRe2CI1t6yZ?=
 =?us-ascii?Q?ZatDsNFIqYRCHfCs/9Jn3ll2TX3120HCumV4qB0j5Pn9j7waalxTcJIS1R+R?=
 =?us-ascii?Q?MNiBrF9FSMkSz/bIFMLOjA0OztijOpD/9ry6aMqjpbr91ubXDre2Xq6O1zrg?=
 =?us-ascii?Q?Eg9N7m7BH/ry90EkiurFnUIYTl4Up1aZrlio4C+PBbps4gN+wxiMSU3FkmMY?=
 =?us-ascii?Q?Y8aVRjDavQeN+PFq6Z71fr6O7hklNV6EwDzr1PORjEI0MPNTDX/eP5Y+s4Cz?=
 =?us-ascii?Q?J0RGLaHaBcuppE7CP+TVg5IpUmZhbod8hasG7fcbGZTWMI8uM9gbpMi3OE9Q?=
 =?us-ascii?Q?1baoH7SKrlJxUrRyZaWNFAS9O0Z577Vudv80JYhbfycmd9ZJpId4zGsp3ND5?=
 =?us-ascii?Q?LhbBCyoJTowJYvMplzVy4paqukTl/YF5M37h/67z+QyOVBFQYn/6rT6hkngM?=
 =?us-ascii?Q?Gs65plvSiIwB/LdCa1OxSvsmEauJ4zI=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: d3cab7f3-19a8-43cd-06d3-08def40714cb
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2026 22:07:18.5260
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7G3qWDikFKsezdVWcsNkVJcKE/wJ82BZ8ES/A71XAoVLgNqzSMejXrVc0dr6kKf25Q6lp3DGuy0kwF6hSA0lnVzkfUGGtVaU1e0iFLL1qyY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5823

Changes:
* add npu_uart pin-group support for uart pin-function
* add pon_alt pin-group support for pon pin-function
* add support for olt pin group/function

Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../bindings/pinctrl/airoha,an7583-pinctrl.yaml    | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/airoha,an7583-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/airoha,an7583-pinctrl.yaml
index 24f1ac60eea84..aad2e9880ec6c 100644
--- a/Documentation/devicetree/bindings/pinctrl/airoha,an7583-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/airoha,an7583-pinctrl.yaml
@@ -60,7 +60,7 @@ patternProperties:
           function:
             description:
               A string containing the name of the function to mux to the group.
-            enum: [pon, tod_1pps, sipo, mdio, uart, i2c, jtag, pcm, spi,
+            enum: [pon, olt, tod_1pps, sipo, mdio, uart, i2c, jtag, pcm, spi,
                    pcm_spi, emmc, pnand, gpio, pcie_reset, pwm, phy1_led0,
                    phy2_led0, phy3_led0, phy4_led0, phy1_led1, phy2_led1,
                    phy3_led1, phy4_led1]
@@ -81,7 +81,15 @@ patternProperties:
             then:
               properties:
                 groups:
-                  enum: [pon]
+                  enum: [pon, pon_alt]
+          - if:
+              properties:
+                function:
+                  const: olt
+            then:
+              properties:
+                groups:
+                  enum: [olt]
           - if:
               properties:
                 function:
@@ -115,7 +123,7 @@ patternProperties:
                 groups:
                   items:
                     enum: [uart2, uart2_cts_rts, hsuart, hsuart_cts_rts,
-                           uart4, uart5]
+                           uart4, uart5, npu_uart]
                   maxItems: 2
           - if:
               properties:
-- 
2.53.0

