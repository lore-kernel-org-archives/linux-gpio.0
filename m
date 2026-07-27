Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11020142.outbound.protection.outlook.com [52.101.84.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 488223ECBC7;
	Mon, 27 Jul 2026 07:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.142
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785138223; cv=fail; b=MSoUfo99PWA4vaMELIbEsKpCtu1OJzuPF8YRV+N5PPwmsHUNEjeupwF1+OY1bD7UnrdXBrNiHiwp60FFcaA78gMsh6cjuiJprC7p3S2bBFXxRN5oBwHmq1ciEFJx0ajynMC1zn9hGmnheDWMIvgezKiIuwREcLEsXox31deRUE4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785138223; c=relaxed/simple;
	bh=ETUow2cFM4XqmFySlGSlMJz4pMkMKxQSE19ZF5dzDYg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Df6cLdtXEb8F0Cv/wSwW2t94L+SvEXHtTE/J+kLINvhFLTyHbW4M0rSIzRLG/nMcYgAW17FYzSHXsIB1NBh1laqU/kCGnQYlUX6+wW1zo6hrnhWRQkWwr3NmgBVP6oRj8PDpL2pAIcjgIITYmnR5hRZB9IK/8pepf4qnU2N1w20=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b=csRxJ0qj; arc=fail smtp.client-ip=52.101.84.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=genexis.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b="csRxJ0qj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fiOTy04cm+de3a6/PKjRqj5LSwrnWLrd0wDXQ0rB9pIUrKDoYmis7ejmXB6lxpOaCrEdGOR/Q2QtAgsvaY4S3lmvQgPgsY8RrycjNkzbFeqy7uUTEaXTTqAZvgwNB0iAacysO34EfXYFvNwHraxr5ls53HhJLVxbo/RCzglGn6/l0rQTGdOf4HYO4wjG5uzpERfestx9YrxYKQOf2Wws5iP6sPMnleFO0yj6fAwUEy94WnOrx5yV8YkpGsr2wqWwrsz1A8WbFEdlMMhaeZWYaMvKnD5bqgetCXWumabAEyaw0zqjyV1mK92gv4Eqz70XiNZYDPYaZKUcSc3nZ+/dnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/pNiEUE8VXNYGtWpSZBCEfv7fEPY0mH8jj7oQdI0MFQ=;
 b=RuzI3EV0iicK9OGSk/DV6PGtgrYN3iJocnIGEGSii3Fn88mIiKZguFtQ9CXfev9EQdSNpONFWJgvM9aaeRq5T4T8CT5ay8IyNwBJ2Y4fyuyy7xyCyIUJ5kCL/pfdSYKR7IIwj7bP/II1DVNu+cpiY32t+goJ6ruzsEi74ZQogYLGz0qqZaiLGPFfukNWiCemqP8dzHKTClg2xCNwf4F4CXA4U+eDtwTPGH8lTdY83b9rhCP1yRWVY9pdeHZuHsRHm+h46iY5Ssqta3Ge4LohzYN8u8cpSLJIxTQaQng0vt8hSAcyBChl5eHicK64l21XjZ+zjXibJS2lB45ESeG4Wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/pNiEUE8VXNYGtWpSZBCEfv7fEPY0mH8jj7oQdI0MFQ=;
 b=csRxJ0qjM7sejCklpAQGB6B9ObjPN8aDIPbsTzqechPpiVMsJ0oOWWl/HlhbMwKXHgEcQAaBhKaOY+rg4CR3OfnFcw0htCTibvEEP7h4EXs1A9zc27nfW/P12YRo26PqzzJXeCf5zhR0iHuDVtf4Bbe2c84oPBb0AAWvpl0bQZRA/11WsPI1G8sGwvYRx1RpTTjncQFqi30xZuvP62yMA+afNbk854OkbQOGU2XmxoUx+IwAGdvjA+VGHWK48B7eJjGFXm862iY+tW43rkGfp/17GLIWsNImHJFMX7ueKfwDo+SmKD5XqZOYRN7knkJRefLxRMB59CKtPRYEDk3tXg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by FRZPR08MB11139.eurprd08.prod.outlook.com (2603:10a6:d10:13b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Mon, 27 Jul
 2026 07:43:36 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0245.012; Mon, 27 Jul 2026
 07:43:36 +0000
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
Subject: [PATCH v7 26/34] pinctrl: airoha: an7583: add support for pon_alt pinmux
Date: Mon, 27 Jul 2026 10:42:26 +0300
Message-ID: <20260727074234.3761170-27-mikhail.kshevetskiy@iopsys.eu>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260727074234.3761170-1-mikhail.kshevetskiy@iopsys.eu>
References: <20260727074234.3761170-1-mikhail.kshevetskiy@iopsys.eu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR5P281CA0051.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f0::20) To DU2PR08MB10037.eurprd08.prod.outlook.com
 (2603:10a6:10:49a::20)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR08MB10037:EE_|FRZPR08MB11139:EE_
X-MS-Office365-Filtering-Correlation-Id: 270c7456-ee5e-49f2-9871-08deebb2c451
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|52116014|366016|376014|7416014|11063799006|56012099006|10067099003|22082099003|18002099003|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	KO61gb1GMyGoyWqYcVG9fSA5agT2CvMgwGsQya3d/E4Dql8Y0SUED2DQp7/MXtsKheH8uP2HxGaKe4kqYgCGVtVmq8IHMcJk421vSH4tLRSIxyQHADPUnDo79/zcikA1IBWFcBaknQJsfhJ6kQeNPOeyZhktClW7H31dmVIlh4jYeu6UuyHSWE0Nn6N/fqFdeHD1EwXltxHRKtnujU7HyAM63ByO4nZTntgk8mhA55pxvEvbjHYej8GO8pNrXzx4o/10d+PfUD41G2h/2AoIlzdIz89gyGRyNYiaq7Cc/GdTJGgUHfiV3ZqsWyks1oUXmrVTN6Lqd0WWeD4SlYKBcsUVqjLunmSsCO+sqWWmsReBv2V1Tzv7BFqS0+Fsw1aGKOmD/UKkiG8it7Hpx3T+C3QH2ZQrfbA2vxSfhgtJTLk6DgZEqeZOTz5ya6yucrNHAEiXGTp26Bn0BzuL4e+rzPNu7ad8VvZPgGJx+ci+DUTwuKz/klc/uNidVYHbwR2xX2TdQ551bW5P/kbOCzl/eoJnbh/iT7j/toKVpa70i7RUzgaebr8TVP/BxWc0rQ9slnbUZb6pBEDiHjl0Wx1Z6Xz6tZMH5h6mL9IctEruRYUVc7RG/ek8waSpeVz4b3j22vFgOACthrSSmUZqqLVrqxsJ9YIIS67z2Y1OOJbjoiYehghJRxHxnaA30Xozl54X6ilN3nh7WFAfDTPXf4Dx+5EX2UItqcfBIuaJFZeer81+/RXXN5sIS15RrqBXOQIC
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(52116014)(366016)(376014)(7416014)(11063799006)(56012099006)(10067099003)(22082099003)(18002099003)(38350700014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?J2Va9ECQjcA1wx9Ro4fzCSuCgduT4wocqmb67XTBk0OdpuXTmQCqL6XUl7Lf?=
 =?us-ascii?Q?6sfbzTExl9eArHY/z2odmq7vARDc668NcurSSFGBblXQ/NqOBtBmIyrrW5Vr?=
 =?us-ascii?Q?ycj4R3PhgYUm0DDTRsoMmfSTxNPVXwliRbH4Gwj+sSN6DEgtnk6wNODBnbW1?=
 =?us-ascii?Q?qYwwiZRW1qB5EVBoKyQZzHhkRePTsMDvlrXZFfZomznFES7TSEPFmkuRFG6v?=
 =?us-ascii?Q?AmwCE0FE9wjH5/keEdGpNvHQ9pJGw7P2eXFZvXPsMrikHpNuIffTu2OSLbEw?=
 =?us-ascii?Q?cUspVHIpjoixTswjmTxn21iHWoXDSXRdKtozxCEQGwhwigTXxduGaaWsOnRW?=
 =?us-ascii?Q?Wh6K2nxuUSP7vBSMV8vH/yFamohAsbmskQ4ITpHID8SyiBoEvawJiz57JsV2?=
 =?us-ascii?Q?IgAvRB8jLxx5EmRyiCVH0V9e8C43IUdqqxJWK210Zyl8XLPDqCsurjEpSbsx?=
 =?us-ascii?Q?kNQ0ZkXPBjaeQ4LZdysCIEFNFzECRp1Iy+vC4M8QS93KlUBFemwRZI1YZZgh?=
 =?us-ascii?Q?FYI/1sUcJhGIolqIQmh+Y16yb5T5jQZsTHAKCgR0GmECaTV2RAw6cYxJwKlV?=
 =?us-ascii?Q?gCbd4QYaeEt8lGjxzOPNjQWFoUgCIpk/LaKisvxz9f4ar13BjbCVubpavTyv?=
 =?us-ascii?Q?1xeHJx0cE3iRhX7LPxuiEin8v8s/nS878ie2dnWSSCvxHFwgEu1fjNV0Z1Xt?=
 =?us-ascii?Q?feEuhI6jWxYS2JJtVGWgkM5NXj0ZEl7DKJKj4Wbgx9tPgyC52vJn9xK2cjBb?=
 =?us-ascii?Q?198vtU53jp7sy5kvaO2q3dtFe10G+Ad/J2cxdzgDfbuIlo+0k/W1jfxT+KnY?=
 =?us-ascii?Q?TAsPH2KrNMK+rQENRZR1Aed4pjp7v3Y15FCfsz9yjJcCgNwK3vEMtNQfsWqq?=
 =?us-ascii?Q?p3+cyOBvf6l+BqnFaEsEkseVS1jnu6iYIuoT4hw9uHmwp1ZRGlhLDm2OorYd?=
 =?us-ascii?Q?H+WbQjULrLp77UyrIRJXiKOqLaXfm1lyiWzWkGx0SejxKirOc2fvx+QKZT64?=
 =?us-ascii?Q?qBbnqzSIO9qNx09n9DA7smmlXEXEDCBdzh+7EgwX4jPgQngbsuG+Xcq2k+kq?=
 =?us-ascii?Q?fWiSywdJtUZXLmFf8mdNbs8OjR3Z4B07ix2Vv6/fmIL7YSJrUb+qW40bjqS6?=
 =?us-ascii?Q?NdXyfyvb2LGNsnVIiRkbSuMZaPcNYX7PDDP40BdmdPtTRuRpiC4KAgDstqt+?=
 =?us-ascii?Q?x7xrVlO6SRtn0zsDO4nQ+fFmqopoCk9IJwRN/Zb+gI/7dCa5e2aYZDVr9QdF?=
 =?us-ascii?Q?y7yDHmhTWwtR0eAMqg5r1gytW14C9ODQTIZI0xjF5jeYbp+siGzg/ewJgaO4?=
 =?us-ascii?Q?bRUAgXghlRIpmxGqlzEToj68IsssGR+HzeOA51Y4xWTc6vTniStuxEJXWxyj?=
 =?us-ascii?Q?UvyO4PN0g+awJb2kqMy1lREC2AxXLZXe78e86yzVkDtywzIa9FFBEcA4Fq8E?=
 =?us-ascii?Q?xxmEEaJImzD5t5OGkFkDGTYZTOuJeYvhXMvnTDP+Mr+Fs0gafJKCSjCfN0oY?=
 =?us-ascii?Q?KCfkuAF5MytIfNgaiTS42CQlc+McXGZ80ygGqng6wjo183ThptQUiUysAgHs?=
 =?us-ascii?Q?tSEdqHFeSwO+xEBP5jhnCpUfKn3UIpBFWdRnhVixVlfJGy5u/An+rJN5+RQt?=
 =?us-ascii?Q?4wKIbcAH9UcXq+S3pSTg0VbPF3tna9vVjVayzHUaBu2p9jgUnHDFYNF3Ppmy?=
 =?us-ascii?Q?TABcnNCrVxAtWBfjfyfAU1sDPKlenliRxxiafXXwZdmX+mCfEdF0dQGw+/8c?=
 =?us-ascii?Q?WPLSlVJtdTVVijrTH6PLmaUUfl9ARYA=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 270c7456-ee5e-49f2-9871-08deebb2c451
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 07:43:36.6603
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xUmLObnH5juYxo0LFr7oGPzlE3l8zS2e+fqEHOFVbc2+Q6Bha8LPLWWnwWqFOuGYWuPX6/RxC7gT93ui9liYJAWEcNlJVa1YhyZDrDWK5RA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRZPR08MB11139

Add support for pon pin function for pon_alt pin group.

Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
---
 drivers/pinctrl/airoha/pinctrl-an7583.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/airoha/pinctrl-an7583.c b/drivers/pinctrl/airoha/pinctrl-an7583.c
index 9b5c7ea5e5472..7e94dcb3b61a5 100644
--- a/drivers/pinctrl/airoha/pinctrl-an7583.c
+++ b/drivers/pinctrl/airoha/pinctrl-an7583.c
@@ -38,6 +38,7 @@
 #define GPIO_SPI_CS1_MODE_MASK			BIT(0)
 
 #define REG_GPIO_PON_MODE			0x021c
+#define GPIO_PON_ALT_MODE_MASK			BIT(27)
 #define MDIO_0_GPIO_MODE_MASK			BIT(26)
 #define MDC_0_GPIO_MODE_MASK			BIT(25)
 #define UART_RXD_GPIO_MODE_MASK			BIT(24)
@@ -391,6 +392,7 @@ static struct pinctrl_pin_desc pinctrl_pins[] = {
 };
 
 static const int pon_pins[] = { 15, 16, 17, 18, 19, 20 };
+static const int pon_alt_pins[] = { 36, 37, 38, 39, 40 };
 static const int pon_tod_1pps_pins[] = { 32 };
 static const int gsw_tod_1pps_pins[] = { 32 };
 static const int sipo_pins[] = { 34, 35 };
@@ -479,6 +481,7 @@ static const int pcie_reset1_pins[] = { 52 };
 
 static const struct pingroup pinctrl_groups[] = {
 	PINCTRL_PIN_GROUP("pon", pon),
+	PINCTRL_PIN_GROUP("pon_alt", pon_alt),
 	PINCTRL_PIN_GROUP("pon_tod_1pps", pon_tod_1pps),
 	PINCTRL_PIN_GROUP("gsw_tod_1pps", gsw_tod_1pps),
 	PINCTRL_PIN_GROUP("sipo", sipo),
@@ -562,7 +565,7 @@ static const struct pingroup pinctrl_groups[] = {
 	PINCTRL_PIN_GROUP("pcie_reset1", pcie_reset1),
 };
 
-static const char *const pon_groups[] = { "pon" };
+static const char *const pon_groups[] = { "pon", "pon_alt" };
 static const char *const tod_1pps_groups[] = {
 	"pon_tod_1pps", "gsw_tod_1pps"
 };
@@ -629,10 +632,19 @@ static const struct airoha_pinctrl_func_group pon_func_group[] = {
 		.regmap[0] = {
 			AIROHA_FUNC_MUX,
 			REG_GPIO_PON_MODE,
-			GPIO_PON_MODE_MASK,
+			GPIO_PON_MODE_MASK | GPIO_PON_ALT_MODE_MASK,
 			GPIO_PON_MODE_MASK
 		},
 		.regmap_size = 1,
+	}, {
+		.name = "pon_alt",
+		.regmap[0] = {
+			AIROHA_FUNC_MUX,
+			REG_GPIO_PON_MODE,
+			GPIO_PON_MODE_MASK | GPIO_PON_ALT_MODE_MASK,
+			GPIO_PON_ALT_MODE_MASK
+		},
+		.regmap_size = 1,
 	},
 };
 
-- 
2.53.0

