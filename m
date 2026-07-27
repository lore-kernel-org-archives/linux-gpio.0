Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11021121.outbound.protection.outlook.com [52.101.70.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A5333DD866;
	Mon, 27 Jul 2026 07:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.121
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785138194; cv=fail; b=WAWe8u87MnFS9lAUbMhhNnQpJNNzEzQIixuASfF/vW3GEsMmlykmNWf0BNRmTiM9XvQMcgZHp20gnxOFJ640ajdkHcssJHma9b4s8WPKsoGV+FMb0bSuUdTMqtZhc+xpvqg/Oo8F0WvcWGaE16VegWR+7SGOD7odcUfyR11DsEs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785138194; c=relaxed/simple;
	bh=/iEMuNE9XuePs0wxHTP8a9npZDxETesoyvBCfUvyelk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=g4CQTCcEC8b5PQiX5oHAHPolB+mVQInUxSpPxhMimOeDFhWjJ8KDQTfQ2ls7IV7G7wrJPBZl1Vrc1y4XQq/XNpl6rvXJ5Ol9N2zg0mcPnCkwAjboWy80w5XDOdbVLN49iuhzK0iivU5VCDezPVoGGkStSmnqoSNrpYI7Grk/5WE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b=ErjPxCVZ; arc=fail smtp.client-ip=52.101.70.121
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=genexis.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b="ErjPxCVZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mgwG/ZEYzlRVwGU4te9o6lljHAYgK2K58N9GLhY1TSdsscXUKeoU28MvUFpe60LIXSNryqIbaqHRdj5kH9GqgJpfg638+UopEY6bVhsfdekiQrLCsEO1L8LBe2KoIOGrbvW7jjMpqWhysu460mG8tqYCGr/0mTqlT4ktKHhZkgZPuV2TE9NXuAO6Ha2ijR6ZHZY2ATMG1K16SLD7Whygp8LRM64DN9Anwv6TePbd8kR+wm/un2Q/rCwF283jPBY+vmzzAHYX8J+M59sGU7V9C5eK2FgERsH/8UMQMSPbLzVd1QivMJec9BrxiF9x1Rf+CBl0OkkDG6QiwwF4/NrCMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q1A36mQDq7ilzR+1Fhy22651SU0gVUz1VMrK9TiLbGY=;
 b=fOn9k+lci2+Wr5R2F/SQW8Sg1P7qD6EXPELIZB0Oq/x/80L5gugxKlpI9uZWCZcRPsmcb9Atu/iHHuYz3wEnfDrJt8i6jc4pyjsOGEl30dThX+GYuNa5PzJO5KHk5g7Sgj20xmvCUXEojx6c92A9KGVJ8lnsEndITMPQBe+4Uy0MYQjLGlMII5Jaf0TjeSW5sG6KINcyDXVD1QMpPOiylgXFXppPyM3axvn5jKbP6Z5PNUpvFR9HW3gTB4SKuKtG0ORLAw07UsmfnPKfgxHvGDT/pZLKOKdqBIn6cWbkgj1GiW9uRGnCJsIyC8QQOKZ1Xn+fvlURwEl+LnFRzvjxsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q1A36mQDq7ilzR+1Fhy22651SU0gVUz1VMrK9TiLbGY=;
 b=ErjPxCVZ4uOEnoZ+BUk6022m9Cn3WY4SsM6j9rAeUu3ovrajNCx/aRLGRh3c07lKh7NdZ3M/oVXskrDc5hnU+67FY5e7QAv5jGvG++38FDrbH/n2BOEr00IyITbv3d2JIOES2HISYtjxVkz+QgbxaEtoRhZ2hRVpCTNoO2d/IG0tjNCCJtwXKbCId/Hu6aRUR8RsKD3k6NF8bxyS3jeGZ1HUNAObE8zBjjZtyc88C9JSQScznuJvcOfEzFBln3RohED4VVtYRgnFfedgvAi5YSUro8yq3hKr+w3WiafbbLuFRxeORTQfK/KpBV3fRp5nNL76E3aWl4aEL8VixTMz/w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by PR3PR08MB5868.eurprd08.prod.outlook.com (2603:10a6:102:81::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Mon, 27 Jul
 2026 07:43:03 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0245.012; Mon, 27 Jul 2026
 07:43:03 +0000
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
Subject: [PATCH v7 10/34] pinctrl: airoha: an7583: fix muxing of non-gpio default pins
Date: Mon, 27 Jul 2026 10:42:10 +0300
Message-ID: <20260727074234.3761170-11-mikhail.kshevetskiy@iopsys.eu>
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
X-MS-TrafficTypeDiagnostic: DU2PR08MB10037:EE_|PR3PR08MB5868:EE_
X-MS-Office365-Filtering-Correlation-Id: d933c3a3-fa39-4b00-b118-08deebb2b046
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|7416014|52116014|11063799006|56012099006|10067099003|18002099003|22082099003|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	TGA66zO711YKwzL43bNgnRaUXg9XuZAJl3qyOko1hpGbfDIBzq6SsKX+Q4ykx645R0h9YFh2wu1zLoZgb7BoIMl/YsGaTyiQtJ0BaK8wy6Ll0JsT4TcM5U31Rnc51W21UOKolOgW2/rs5Vbc/i8nAqf5s1Qt4Hl1VY2WUowiL36fvvnMo9FkgZ8N9G/nlcE/7tySVRESCjS0yvsCoPp4x/P2i4vNz8jcbcZcRtrb9kuVvgD52hD5lNimrYuxX57CX85FW+en1UzKM3xr55OhZOhOO8GKJU+IcjCeYFmRoMrJJE6DjW6/c6PrCWyChweV3XWQ+DcR/7wIIrcZogqkifMuQYJYcXN3/xQmzbQguZXIm06+3fdeuA0xjPwg08ZLmOPu1vSXPIA9tH5LD8w+EYZagF3utNpoClK1p/lAGhYmGFsRXnmJiOkFOYckRBy/GWGoBTwTCmhJ2nwdcPM/+woAsjKB7n7E3qXbyo1B+nkcjcmY1gF5TmPpm4m+WdpHqczqxIxexOJ5IZckPgWzDhnknuWu7dYNHKF5KLedvq1+a0IqCQC5kt/Ln1rx3AezyDCpFAMnnFbd8HW/GjKuMGDgBKCf0wH7wNNy5ESH4kZQUBIbAZMd5oiUTeP28WO0syLsX0WNh09HQIQFFaafrFrfHegpc4bEOnf/bCNqz2vrOYj5lHhcM1vsOF7USIPgfRsZ+GiTGRXpNfqgVGERXPJtd4FJAkIDO6Znxn9JcNc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(7416014)(52116014)(11063799006)(56012099006)(10067099003)(18002099003)(22082099003)(38350700014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?GZLuj2TVVL7rfPmWO0jNhxITpdgpwML4GU++4VCN3hORy7ZlNXK5zxxi+7PS?=
 =?us-ascii?Q?EeloHE0ItSwChSU5CmiB2ZxZ3FPVlghGVAZUEkCSnBmtic9jrgxeQ5G+Ga3v?=
 =?us-ascii?Q?z58WCvRrEfWyqNyxlSqFNX7wNA0EYOeu6lWAWb7UghMqcPCengVLZ8QnMCVb?=
 =?us-ascii?Q?/P2C04B2HrCeWBN0Ou/ckmc+XjeOslHUXtKqZmxqTQqo6zjunvuzBIahZ8A7?=
 =?us-ascii?Q?ZhWX7LlNR2ZaAMXbi0hU8zK7BPA3kQyyPz07WJ32xr8rff/CPXZgkJ0hBGJS?=
 =?us-ascii?Q?ibLE8WuRe1bM8rV4e/xskKI3fY4glC08CqJvhPeHtbwoAFQiTPm9X3+rMgkg?=
 =?us-ascii?Q?mCqBfiok4OyhYykdjpwm24mi5tsnmDuOn37vP3dGg90GFn/c5A45fNk8lzeI?=
 =?us-ascii?Q?bNrQlyGmSauVvLWfyGsDEJcBoAQRMCELGemXnRP0Mv2u9ODWBiHP0ZPNbmce?=
 =?us-ascii?Q?SZXmbKLbu7xs/F2dw6g9ozoizTXQETFwuMqhxx/daYnqqtrksMe42LTT3jYH?=
 =?us-ascii?Q?05FrLgTyPFj5TGS1D3TB4JKwCR6CP7a7HlqrHgZR/P8wvoeRURqRP4//+QlX?=
 =?us-ascii?Q?XYx4iaHBmVsQ5aktWnEYA/wNOtwkqnKbGXUjcRJgV6PGAJvNpF/IpVa2IY39?=
 =?us-ascii?Q?qBwVV+Ekp2zLyOxuArwbc61eR667bkZbMcVYA4K4/Wo20x8JNSK+m+aADEI5?=
 =?us-ascii?Q?UO4CYVGi6MHuXM3bKTekQqFSPIwkBCepk/+VSM4z11Ru8PiVD9yAXT60QURG?=
 =?us-ascii?Q?PUZz9Cs+ZuLlx2KmO11PqQg5ZmNV3Ovt0jXFhlQ51gBrStoF7H5ZI5uRZKg9?=
 =?us-ascii?Q?2eAnkAVGEmghg8vuNSCL5U47cAdaM/KlIJtVMEMEMmM/qvGoKArL2BPAccaU?=
 =?us-ascii?Q?NguvWkAkI7lCJrap9Z0Af7DP583enBGGZAPnseBwGj6DHp9Sqh0tgIOE7/Qi?=
 =?us-ascii?Q?d56Vvz3/gV5sWFOMCb1QUGBPubQh4WTwfNvqsjxQ1XDErqgzg/XpilTtoDYL?=
 =?us-ascii?Q?X2g/vMRSNHXB0r7gnH6DaMWgB4tymsEFbae38Ls2weqoM2+J1491Br1DNYT5?=
 =?us-ascii?Q?mFOZuQpWgz8R4O339Gov5bQGS/PWTgJJ1UexARB0669FJ+L5h5HXsfQCSaye?=
 =?us-ascii?Q?u+eKCRZ1VmDKVFpvFFSk13mn4Z94wi9aWbbg3O2u1HZtqOSAW5siuYjPb/lf?=
 =?us-ascii?Q?sVAl4baqwZCDoOMikf4s9MDls1fyWK9YhvWMOpuEXaibn44TFB+5MdsdJQhf?=
 =?us-ascii?Q?xSBtXGA/FiF4gWSejEXwsZ2+5ynGFjIVwnX8hx0ObLBR/I/9WbrX0sl3H1l+?=
 =?us-ascii?Q?srdjnjeGt1rrC//JXlI9aSgD1QIdX/NADStJQqVdlTgLs7fY3gSCYuTbOHzo?=
 =?us-ascii?Q?R/Ju7yFq+5NxK5azqvWm6+LYlreGutsQXR48heVMdygyq6a7cr//fpVnWQ/U?=
 =?us-ascii?Q?y/1VdAClzc2cHmQe1AAsSVOS5ms96T6rUeSbvq2Nzjvg/W5J20u+Wjr8kriy?=
 =?us-ascii?Q?/w7wdG6cqFmVQd6xUwYChEWrfmOjxFS+ibWsdKCMISxCuQwc74cDnG3/hzQZ?=
 =?us-ascii?Q?D2u3yNjMRzaL1uR5kbLY0b/H8e9Pefukg2Btz7zo2kOfGF2QYjP61xbm0WLP?=
 =?us-ascii?Q?ExDPpUolL951iYT7R4u8m0l7kHxuFpdBUysybmfm62dJmrN1qfxHLMgnV0t3?=
 =?us-ascii?Q?6B+w1xdFtA1f1B/xtDEoodgqs8TCtlKzNun5RjTka1e08473/Ced6bQ74ypW?=
 =?us-ascii?Q?ISGlmXViSPL0u5q/tEM+ZfC2S/RTfOI=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: d933c3a3-fa39-4b00-b118-08deebb2b046
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 07:43:02.9700
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kuK+BFKxZkICnCKaxGnLiwEdUI3FkJ6W5iuZ+8rWbp88CbmSdM2606um6UZ0cQFXsNGajqJ3kqZ8o5MG4yrLxbjgnHkCRmsiVV3Y8IbjlbQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5868

Current an7583 pinmux implementation have following issues:
 * pins 51 and 52 can't be set as pcie_reset, current pcie_reset code
   will sets pins to gpio mode instead.
 * there is no proper way to set pins 41--54 to gpio mode.
 * pins 41--53 can't be actually set as pwm pins. These pins must be
   muxed to gpio mode as well.

This patch fixes above issues.

Fixes: 3ffeb17a9a27 ("pinctrl: airoha: add support for Airoha AN7583 PINs")
Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
---
 drivers/pinctrl/airoha/pinctrl-airoha.c | 99 +++++++++++++++++++++----
 1 file changed, 86 insertions(+), 13 deletions(-)

diff --git a/drivers/pinctrl/airoha/pinctrl-airoha.c b/drivers/pinctrl/airoha/pinctrl-airoha.c
index b30b593e9dbf0..820b7b0443851 100644
--- a/drivers/pinctrl/airoha/pinctrl-airoha.c
+++ b/drivers/pinctrl/airoha/pinctrl-airoha.c
@@ -84,6 +84,18 @@
 #define GPIO_SPI_CS1_MODE_MASK			BIT(0)
 
 #define REG_GPIO_PON_MODE			0x021c
+#define AN7583_MDIO_0_GPIO_MODE_MASK		BIT(26)
+#define AN7583_MDC_0_GPIO_MODE_MASK		BIT(25)
+#define AN7583_UART_RXD_GPIO_MODE_MASK		BIT(24)
+#define AN7583_UART_TXD_GPIO_MODE_MASK		BIT(23)
+#define AN7583_SPI_MISO_GPIO_MODE_MASK		BIT(22)
+#define AN7583_SPI_MOSI_GPIO_MODE_MASK		BIT(21)
+#define AN7583_SPI_CS_GPIO_MODE_MASK		BIT(20)
+#define AN7583_SPI_CLK_GPIO_MODE_MASK		BIT(19)
+#define AN7583_I2C1_SDA_GPIO_MODE_MASK		BIT(18)
+#define AN7583_I2C1_SCL_GPIO_MODE_MASK		BIT(17)
+#define AN7583_I2C0_SDA_GPIO_MODE_MASK		BIT(16)
+#define AN7583_I2C0_SCL_GPIO_MODE_MASK		BIT(15)
 #define GPIO_PARALLEL_NAND_MODE_MASK		BIT(14)
 #define GPIO_SGMII_MDIO_MODE_MASK		BIT(13)
 #define GPIO_PCIE_RESET2_MASK			BIT(12)
@@ -782,6 +794,10 @@ static const int an7583_gpio45_pins[] = { 47 };
 static const int an7583_gpio46_pins[] = { 48 };
 static const int an7583_gpio47_pins[] = { 49 };
 static const int an7583_gpio48_pins[] = { 50 };
+static const int an7583_gpio49_pins[] = { 51 };
+static const int an7583_gpio50_pins[] = { 52 };
+static const int an7583_gpio51_pins[] = { 53 };
+static const int an7583_gpio52_pins[] = { 54 };
 static const int an7583_pcie_reset0_pins[] = { 51 };
 static const int an7583_pcie_reset1_pins[] = { 52 };
 
@@ -862,6 +878,10 @@ static const struct pingroup an7583_pinctrl_groups[] = {
 	PINCTRL_PIN_GROUP("gpio46", an7583_gpio46),
 	PINCTRL_PIN_GROUP("gpio47", an7583_gpio47),
 	PINCTRL_PIN_GROUP("gpio48", an7583_gpio48),
+	PINCTRL_PIN_GROUP("gpio49", an7583_gpio49),
+	PINCTRL_PIN_GROUP("gpio50", an7583_gpio50),
+	PINCTRL_PIN_GROUP("gpio51", an7583_gpio51),
+	PINCTRL_PIN_GROUP("gpio52", an7583_gpio52),
 	PINCTRL_PIN_GROUP("pcie_reset0", an7583_pcie_reset0),
 	PINCTRL_PIN_GROUP("pcie_reset1", an7583_pcie_reset1),
 };
@@ -891,6 +911,11 @@ static const char *const pnand_groups[] = { "pnand" };
 static const char *const gpio_groups[] = { "gpio47", "gpio48", "gpio49" };
 static const char *const pcie_reset_groups[] = { "pcie_reset0", "pcie_reset1",
 						 "pcie_reset2" };
+static const char *const an7583_gpio_groups[] = { "gpio39", "gpio40", "gpio41",
+						  "gpio42", "gpio43", "gpio44",
+						  "gpio45", "gpio46", "gpio47",
+						  "gpio48", "gpio49", "gpio50",
+						  "gpio51", "gpio52" };
 static const char *const an7583_pcie_reset_groups[] = { "pcie_reset0", "pcie_reset1" };
 static const char *const pwm_groups[] = { "gpio0", "gpio1",
 					  "gpio2", "gpio3",
@@ -937,7 +962,8 @@ static const char *const an7583_pwm_groups[] = { "gpio0", "gpio1",
 						 "gpio42", "gpio43",
 						 "gpio44", "gpio45",
 						 "gpio46", "gpio47",
-						 "gpio48" };
+						 "gpio48", "gpio49",
+						 "gpio50", "gpio51" };
 static const char *const phy1_led0_groups[] = { "gpio33", "gpio34",
 						"gpio35", "gpio42" };
 static const char *const phy2_led0_groups[] = { "gpio33", "gpio34",
@@ -1483,6 +1509,36 @@ static const struct airoha_pinctrl_func_group pcie_reset_func_group[] = {
 	},
 };
 
+static const struct airoha_pinctrl_func_group an7583_gpio_func_group[] = {
+	AIROHA_PINCTRL_GPIO_EXT("gpio39", GPIO39_FLASH_MODE_CFG,
+				AN7583_I2C0_SCL_GPIO_MODE_MASK),
+	AIROHA_PINCTRL_GPIO_EXT("gpio40", GPIO40_FLASH_MODE_CFG,
+				AN7583_I2C0_SDA_GPIO_MODE_MASK),
+	AIROHA_PINCTRL_GPIO_EXT("gpio41", GPIO41_FLASH_MODE_CFG,
+				AN7583_I2C1_SCL_GPIO_MODE_MASK),
+	AIROHA_PINCTRL_GPIO_EXT("gpio42", GPIO42_FLASH_MODE_CFG,
+				AN7583_I2C1_SDA_GPIO_MODE_MASK),
+	AIROHA_PINCTRL_GPIO_EXT("gpio43", GPIO43_FLASH_MODE_CFG,
+				AN7583_SPI_CLK_GPIO_MODE_MASK),
+	AIROHA_PINCTRL_GPIO_EXT("gpio44", GPIO44_FLASH_MODE_CFG,
+				AN7583_SPI_CS_GPIO_MODE_MASK),
+	AIROHA_PINCTRL_GPIO_EXT("gpio45", GPIO45_FLASH_MODE_CFG,
+				AN7583_SPI_MOSI_GPIO_MODE_MASK),
+	AIROHA_PINCTRL_GPIO_EXT("gpio46", GPIO46_FLASH_MODE_CFG,
+				AN7583_SPI_MISO_GPIO_MODE_MASK),
+	AIROHA_PINCTRL_GPIO_EXT("gpio47", GPIO47_FLASH_MODE_CFG,
+				AN7583_UART_TXD_GPIO_MODE_MASK),
+	AIROHA_PINCTRL_GPIO_EXT("gpio48", GPIO48_FLASH_MODE_CFG,
+				AN7583_UART_RXD_GPIO_MODE_MASK),
+	AIROHA_PINCTRL_GPIO_EXT("gpio49", GPIO49_FLASH_MODE_CFG,
+				GPIO_PCIE_RESET0_MASK),
+	AIROHA_PINCTRL_GPIO_EXT("gpio50", GPIO50_FLASH_MODE_CFG,
+				GPIO_PCIE_RESET1_MASK),
+	AIROHA_PINCTRL_GPIO_EXT("gpio51", GPIO51_FLASH_MODE_CFG,
+				AN7583_MDC_0_GPIO_MODE_MASK),
+	AIROHA_PINCTRL_GPIO("gpio52", AN7583_MDIO_0_GPIO_MODE_MASK),
+};
+
 static const struct airoha_pinctrl_func_group an7583_pcie_reset_func_group[] = {
 	{
 		.name = "pcie_reset0",
@@ -1490,7 +1546,7 @@ static const struct airoha_pinctrl_func_group an7583_pcie_reset_func_group[] = {
 			AIROHA_FUNC_MUX,
 			REG_GPIO_PON_MODE,
 			GPIO_PCIE_RESET0_MASK,
-			GPIO_PCIE_RESET0_MASK
+			0
 		},
 		.regmap_size = 1,
 	}, {
@@ -1499,7 +1555,7 @@ static const struct airoha_pinctrl_func_group an7583_pcie_reset_func_group[] = {
 			AIROHA_FUNC_MUX,
 			REG_GPIO_PON_MODE,
 			GPIO_PCIE_RESET1_MASK,
-			GPIO_PCIE_RESET1_MASK
+			0
 		},
 		.regmap_size = 1,
 	},
@@ -1636,16 +1692,32 @@ static const struct airoha_pinctrl_func_group an7583_pwm_func_group[] = {
 	AIROHA_PINCTRL_PWM_EXT("gpio36", GPIO36_FLASH_MODE_CFG),
 	AIROHA_PINCTRL_PWM_EXT("gpio37", GPIO37_FLASH_MODE_CFG),
 	AIROHA_PINCTRL_PWM_EXT("gpio38", GPIO38_FLASH_MODE_CFG),
-	AIROHA_PINCTRL_PWM_EXT("gpio39", GPIO39_FLASH_MODE_CFG),
-	AIROHA_PINCTRL_PWM_EXT("gpio40", GPIO40_FLASH_MODE_CFG),
-	AIROHA_PINCTRL_PWM_EXT("gpio41", GPIO41_FLASH_MODE_CFG),
-	AIROHA_PINCTRL_PWM_EXT("gpio42", GPIO42_FLASH_MODE_CFG),
-	AIROHA_PINCTRL_PWM_EXT("gpio43", GPIO43_FLASH_MODE_CFG),
-	AIROHA_PINCTRL_PWM_EXT("gpio44", GPIO44_FLASH_MODE_CFG),
-	AIROHA_PINCTRL_PWM_EXT("gpio45", GPIO45_FLASH_MODE_CFG),
-	AIROHA_PINCTRL_PWM_EXT("gpio46", GPIO46_FLASH_MODE_CFG),
-	AIROHA_PINCTRL_PWM_EXT("gpio47", GPIO47_FLASH_MODE_CFG),
-	AIROHA_PINCTRL_PWM_EXT("gpio48", GPIO48_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM_EXT_SEC("gpio39", GPIO39_FLASH_MODE_CFG,
+				   AN7583_I2C0_SCL_GPIO_MODE_MASK),
+	AIROHA_PINCTRL_PWM_EXT_SEC("gpio40", GPIO40_FLASH_MODE_CFG,
+				   AN7583_I2C0_SDA_GPIO_MODE_MASK),
+	AIROHA_PINCTRL_PWM_EXT_SEC("gpio41", GPIO41_FLASH_MODE_CFG,
+				   AN7583_I2C1_SCL_GPIO_MODE_MASK),
+	AIROHA_PINCTRL_PWM_EXT_SEC("gpio42", GPIO42_FLASH_MODE_CFG,
+				   AN7583_I2C1_SDA_GPIO_MODE_MASK),
+	AIROHA_PINCTRL_PWM_EXT_SEC("gpio43", GPIO43_FLASH_MODE_CFG,
+				   AN7583_SPI_CLK_GPIO_MODE_MASK),
+	AIROHA_PINCTRL_PWM_EXT_SEC("gpio44", GPIO44_FLASH_MODE_CFG,
+				   AN7583_SPI_CS_GPIO_MODE_MASK),
+	AIROHA_PINCTRL_PWM_EXT_SEC("gpio45", GPIO45_FLASH_MODE_CFG,
+				   AN7583_SPI_MOSI_GPIO_MODE_MASK),
+	AIROHA_PINCTRL_PWM_EXT_SEC("gpio46", GPIO46_FLASH_MODE_CFG,
+				   AN7583_SPI_MISO_GPIO_MODE_MASK),
+	AIROHA_PINCTRL_PWM_EXT_SEC("gpio47", GPIO47_FLASH_MODE_CFG,
+				   AN7583_UART_TXD_GPIO_MODE_MASK),
+	AIROHA_PINCTRL_PWM_EXT_SEC("gpio48", GPIO48_FLASH_MODE_CFG,
+				   AN7583_UART_RXD_GPIO_MODE_MASK),
+	AIROHA_PINCTRL_PWM_EXT_SEC("gpio49", GPIO49_FLASH_MODE_CFG,
+				   GPIO_PCIE_RESET0_MASK),
+	AIROHA_PINCTRL_PWM_EXT_SEC("gpio50", GPIO50_FLASH_MODE_CFG,
+				   GPIO_PCIE_RESET1_MASK),
+	AIROHA_PINCTRL_PWM_EXT_SEC("gpio51", GPIO51_FLASH_MODE_CFG,
+				   AN7583_MDC_0_GPIO_MODE_MASK),
 };
 
 #define AIROHA_PINCTRL_PHY_LED0(gpio, mux_val, map_mask, map_val)	\
@@ -1899,6 +1971,7 @@ static const struct airoha_pinctrl_func an7583_pinctrl_funcs[] = {
 	PINCTRL_FUNC_DESC("pcm_spi", an7583_pcm_spi),
 	PINCTRL_FUNC_DESC("emmc", emmc),
 	PINCTRL_FUNC_DESC("pnand", pnand),
+	PINCTRL_FUNC_DESC("gpio", an7583_gpio),
 	PINCTRL_FUNC_DESC("pcie_reset", an7583_pcie_reset),
 	PINCTRL_FUNC_DESC("pwm", an7583_pwm),
 	PINCTRL_FUNC_DESC("phy1_led0", an7583_phy1_led0),
-- 
2.53.0

