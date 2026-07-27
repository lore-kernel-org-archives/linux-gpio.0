Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11023106.outbound.protection.outlook.com [52.101.72.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54ACD43F0A9;
	Mon, 27 Jul 2026 17:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.106
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785174167; cv=fail; b=hWF5JmD5vklFqK8ahR6GcN08v1TRakTrEvpLtR0can18hvrDmeF1QkATgskMyid7Y4XfB7xs0QC9ZSejAP884cs9PP6xZei/VbfG+bwhnNJ0pugm0md5tdS2lmd7U3k2dCQ/GmRwqgrKzJWaVDZwC7z/A57c91FhIfdcSum0jh0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785174167; c=relaxed/simple;
	bh=ETUow2cFM4XqmFySlGSlMJz4pMkMKxQSE19ZF5dzDYg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Oq4vjbu7ioLDrFdF8adSf9km1dNUmz2hcpVNT94bMYSWH6hZOLf8+OwZWVfzthSQIb5JhcfWb+1X9JHxgJdTxHzQaPFOLCV0JcejFceNt5L55dbOdD8Gc//5aPE/F4JYDq8CpniBQ/ndoyqUmrVEJOTnHAeqSoUaqecLZo6H/os=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b=dk/W562K; arc=fail smtp.client-ip=52.101.72.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=genexis.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b="dk/W562K"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rYl+z79fizmCDvSJGzWt7BiHRV79PNoCNER2pQETCbpByTXmKInwiLUuN2neB936GBMI6MPFmnrB7YlPw7QKpngFQdh9kOTiFJoZVDdzJhIGMq5q9nlPz/6zvpGp7KDvc+89knUOiCYUPToIuwiWK+0H4vfUtzsqPeAVLjZTDUeEW0gyYdKX8G2raYwaTA/XHleB/IPMyhqGYDthXwxJoMT9YaBe1T7wCiSLqZEA8g04Mdz1h+T/ZfwAd4IAvdmbq2750RIPk6PGbBFWQ0zC2tpdmkuethd1TLEIwgzrm8FzAlMCiAThtSNQq+1Ao/pMwlAuiVXy5TQiE9sA8nOHHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/pNiEUE8VXNYGtWpSZBCEfv7fEPY0mH8jj7oQdI0MFQ=;
 b=i1XAcQOqE4sBla0xl3zGGcxJQeJtptEL4hF1t9p+gUTpPz3RJpQhHhet6aU8bbwvX2aCoTULY+k75vFL+k/FqzGhS7wDTD8Xp6Tvqb/qqptJNQ4MV1XCcSyk5vef5RueM5GMv0VUzZ78u4V5yMvvizVL0Jl1UGv0Sw24jcikfdeWI/GepIwWTZVpWiJVodXyFOgQWjoHSlHkGWO58RsCHEZ96xL42wasev3OnZxkWDPZYxvkNyCZCHlJIYgegl5XUAkFI2erBajvHDG0A2rjaEgpzpVUdYQT6MtHJaYOk4CrH4GQwMXOHQx//6eDZwpJR4FWjqHoUfsfaYpCLdcauw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/pNiEUE8VXNYGtWpSZBCEfv7fEPY0mH8jj7oQdI0MFQ=;
 b=dk/W562KaNAgIB5P5q+KrTZ9c4fCdVzCInC0WNwBag8YHd9WfAN8mlvMtC/+/lWC/yM6c+CrmBe3k6mIiZrVQAtkDIBE0ettN0FIoZkLA1MW3m3ZcgqwKfewECaDenfZ8S43tqRuhyfV32Q1GYCW1oB0LYgD2DPu1yX12uTzbfAMheTZoQBcQgOmM0BOrLrlZEOZICQkbIV8qLLAR4AdV9WK2Y9KFnz/Om4/InBdC7dwFby0rnXRLUh7Kb7efHdqkUceLl7VcnP+TCZiaxX+5gDE29YqInww0PhnMN4/s0vmkG/y54rW/V+CdbA0BZX3SuKGY10uV/DoGiB2BxrXFw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by PA4PR08MB6111.eurprd08.prod.outlook.com (2603:10a6:102:e3::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.12; Mon, 27 Jul
 2026 17:42:38 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0245.012; Mon, 27 Jul 2026
 17:42:38 +0000
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
Subject: [PATCH v8 27/35] pinctrl: airoha: an7583: add support for pon_alt pinmux
Date: Mon, 27 Jul 2026 20:41:33 +0300
Message-ID: <20260727174141.664933-28-mikhail.kshevetskiy@iopsys.eu>
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
X-MS-TrafficTypeDiagnostic: DU2PR08MB10037:EE_|PA4PR08MB6111:EE_
X-MS-Office365-Filtering-Correlation-Id: 3aad3454-bd0b-4b15-e652-08deec067379
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|7416014|376014|52116014|366016|11063799006|10067099003|56012099006|18002099003|22082099003|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	ULqcOktOhcvn/Z0c0SC3qRZcsNPtTD/3Xkj/ep653Ztf9vShQQylwucXxjbiFyMgH5WK4eh7P5K4J5DuosUZCBo2g6bOOUN0vMZjys8FW3BZo99jCEXG+cMEM7psmn7WgKfZJvpat7B59CdPHJaUK9xx/n0PKHVfGRKOrbbEOj8xVtJHaZOiHOTl+Abd2njd7JegDo92MLXklNBk84ci64iAemvQa0ZG+VeXULKyyxir+GsCv4hI37hyk1dIOhJ71v5yhk2dUxp/xN1oRdFT5By1IJOCoY/uGdWLi1uMp2T1DeH5zA4CifdzogzoWQ66gaco6kyWfBE6ajoNzpqnrsZuFragdByZK368gxHKo5tGlGMATtx99H6F8Hr+3NMKDV1XKEZeQqAHAplX9EGHw8++7X0OingY88UA2d4cj04uoJe6sguS/crke+AaNhTfPAoB7GL5FQUdQi15W7tFvdriWQWoz5U7MmTydOKic4b+sp0Vf2z7S3SsuIs/TgnrJHyWXX7NK2zWeR90Tr36p8KwD4Q8JfcZEhnMdRba9OFDJ3YMnYjXfhzyOOVUaxHsOJD/NWpkKm6HaWGYCT7ZcXkLU9vWE3mV7bv0WTJo4kTV7+nt4G8XRWR1XjVN+3gfu1nh6/HnFfXQPLKNqUyIS3ulv8k6ZQik5rgVQwOuetTCob9ybNSt7foabb/XHL/Nev0f/gQE1b1uw3atOmotm+J3F8TiM4Ei414RdlUCAG0hpFt+dTe+FMHw4lM+xulY
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(7416014)(376014)(52116014)(366016)(11063799006)(10067099003)(56012099006)(18002099003)(22082099003)(38350700014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7hqJgnJTYOx7V/v6DEKNUm7Obsb2cUJUdmZBeL8C5oCoO6pZ26UYugRJL87b?=
 =?us-ascii?Q?Z3apbOpixBON5mJzAlCFm1q9Xp2unhAiZ4T31j6ZA5axcfCI731QMDxcSyhh?=
 =?us-ascii?Q?EpmiDdn7zfFwTLAvYewuqIXJclFGpZ57m8G1rDvBopbmUjxZ5C2Pu9lOEUy1?=
 =?us-ascii?Q?/fIHtXNHxvKQN4PCs9BPz9V99hwgj8S37TU/c5fuzr3PIvKOC2VXTfPiL5Yq?=
 =?us-ascii?Q?PeVnqbzk1ucqY0dA1wfZ17W1QP1bb87tGPG4A3lSrF1WvX31gNhFoGqmPzou?=
 =?us-ascii?Q?g1uY7/jZchA8zYq9e8RKjgrQxE7FXB8eUj3rmz1tN2eYDir80AQdTAaHWeWC?=
 =?us-ascii?Q?gc+S+FoqwaihbzqO9ZfzMhY6ggxl5Ahdyy3Fk2TzvSlgx1rs0YJg+i/srvoj?=
 =?us-ascii?Q?KEhM8oaVhl3Ypb6wMAoA4VKeLLGI8HamGRm9gyweyLw6AlxvYfY5khy0iRL1?=
 =?us-ascii?Q?Nc3BBjpL1l6PPhK6jY0F6Ol/pYzGyDb9n2Xf/Bs6zzZzqgxMlGx4HOs9Vpbw?=
 =?us-ascii?Q?XWL21BfNwUj+seTeRcSv184FEbPqI6IyLSnBpAkRL8weZheG8srZJ9cQtb93?=
 =?us-ascii?Q?xeJhqrFhz/jT4tKeNkmxQWVOc2xKDVPFUzqeqlwAY9vQHF19NQpoZASLDP1v?=
 =?us-ascii?Q?zsCMCMaYjY/hyOAIlTZwXt7tI3ZiqlyWqBxKLJ1/E6ZukFUf4xm5wqOfWNY+?=
 =?us-ascii?Q?cFxZZPeCW4tTNq8G5sBXsklsHgHq5ZkQ2s/XcCYXIlc91lJmniAvDDZWcuBF?=
 =?us-ascii?Q?GFnTzbB5Ckwz18MbxbJ21PQUMVjPKN1U/RYlY4tKVc8EaTaL82WsdZ8n5RH7?=
 =?us-ascii?Q?OgFzLnwYb3ndDWDw1+RnkhvPMO469oesOu+BNknBp9w4xkuXo9H8Cw+kIIAB?=
 =?us-ascii?Q?oLdnU5UZMHBL9MY/tgDEPqYl6+NlZ2K+UxyyK95Ukfkyk9Inkk1GSeGm/zUa?=
 =?us-ascii?Q?WGJFRSfpScyMf1mMgKgXPzCq2K/ySusR/nVXAwT/EaK0aNJlvSWIeEuNnbak?=
 =?us-ascii?Q?LNQGMCACMz3AJWRyT5W0oQnSY+SyGCbOMoGekZZaDJZ4j1qumv6Dxyve/Nul?=
 =?us-ascii?Q?hoy+BnoOPwwXOIdfLXnkDHyoUeQtXAQ9+GP8FBQMWOAPFbzGC4AntU/USE0u?=
 =?us-ascii?Q?fevI/1kZrAOruTTUAjU0oB7VAdojJ/6JJdMNx/u5gnPm6/PbRhGEENKkEY3k?=
 =?us-ascii?Q?qi+MvB8nabFcQY8JWzzbpsQsvFRoF5w5VChsZ+XeZUUXzj0YIFoYFnt0i11g?=
 =?us-ascii?Q?PwZEXPIEqAZni8h49e9hXL8TzDWqeTeuaVi5jPde3G+Ge1OAiNJye3nMof2d?=
 =?us-ascii?Q?59x2ba4QI8bvXU6rqGrBoBsSjugU988jvXM5PWJbprZBlSuO2AxoD6wZ/fSM?=
 =?us-ascii?Q?UQbKGBbPNIJKtUtGK1dFqgdpjoio1F6H4TmwK+v1vEhJko9HRgJn+uQXQfaU?=
 =?us-ascii?Q?ij6jqRb7AYVQ74siKeYSef5U7SNHB+7scUc57khqxGu1ZvNR/dGczuwnPJnj?=
 =?us-ascii?Q?1jZy/DcE9IfRwy35hxSijY4LsjbBSnp21LkQRDCeMhw2mCFnu0k6ZZ01l7gq?=
 =?us-ascii?Q?dRXzxdyU64BWjUg916/P4P3kU+r1/wkjQJTh11/A4H7GMiNfUZudHH0kBl72?=
 =?us-ascii?Q?hh4k+8gwghPtPIQmHSvNnUVUSFRGmPa2InobPq3lckn43Ak4UR1QxN8wask0?=
 =?us-ascii?Q?sqovhvWLPsvHTPVlIh6sOadJTBVQ8RwiC4gGbSbDWlB7HbHOiBXj4NAAzcQB?=
 =?us-ascii?Q?75pAoE7Hya5Y8GfVwl61PGM6Mt2TKMQ=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 3aad3454-bd0b-4b15-e652-08deec067379
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 17:42:38.5919
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eqIxZ3TpevRuYsdPXtuYiw5vWB9FKKTWaJzzKsbVBcB8B56GyIqBp9ngKcnNZtQCvYwItSZyhcNSeCBNcHNlRpaajhInI12+jevbxFHnchE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6111

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

