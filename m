Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11022110.outbound.protection.outlook.com [52.101.66.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2A91435AB5;
	Mon, 27 Jul 2026 17:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.110
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785174138; cv=fail; b=UsyxX6+x0CWGtdrtXA8NofZah0NaCfJ6gW474nqT7VAJGJox77R2kTkgHCLLFeb8LtTDO3/4pDmbq2N639wMQLjqyTvRM9h+cvDRPRd0ULi8C8fzmSFd72WJZYhvLNvRABTBPQJ5LtqUohjtfmTtq8i2n8VbPIjsk+vcYbim7EU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785174138; c=relaxed/simple;
	bh=nTox6Fjk2bMgSam/X+wYlijmg6f6BXTxp8fP5uvoIUg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=iLhLK1yE0363445dJuAmDPva2ju3gNHdL4Eo/Qc05kkRisxB+1DFkn7SinhvudvpWlOe9KKSgtXIJ8mwuTDEjQDXCrJG/ky7LHmpwLgHMJJZIaVHmeNWV1dD4G/PbVjYrK3vRRfJfTDpZjo1bFxv8HgVZdb8QooYtTHs3B0vUuw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b=ZnzygYpe; arc=fail smtp.client-ip=52.101.66.110
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=genexis.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b="ZnzygYpe"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JW/ZNhMpqTWSh6uoFdVkFd8bQR/DjiaWG0+6V4Okyd6qzUzUixqgvrIX8AFRML3TDBreGbL6j15s8CkBRDygiRG2sUOpulpYAmr15EEbQau00dOJoQVjLHVDECHddA+sAKy1cgMRZYbw2L5+nwMvj2nx0a8X3Z4h4Cv19SR/Jf4tU8zBOk+wUFn6lbvNmHsGKOBnZZdhGhWYgwJSam2+8jiOd8/iZppFBYh+V23EAG5sxZIzZ8E9YBEmS+LuzzErbkuSAOG2nCWxELvrpKYjNxUj1vXAEe9E8XK/yzCR78Twkj4pg8wkkVancvb+851xVWMEuJl2XEVqrWt14+sUvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9bOyHj2DQt+P82WguoOS8Sw0q0kv0ECfpt0nFjjKRf4=;
 b=EOSvie+1Myvwo+IieeQIJAVNQbOiT5tkFORl2FJYSH5ZunyFZoHHKGKehaBGoHyesXmTEoQOyhX4NC7N7zVwVyiOPez33wsCzFgzpyBu7Y5xLAovD39Ug7xJrfQRdGJAejYewcnh6jRIjASxPlOiVNQl77ma1iEV67an4fFmmVJ1N7qZl28MMBbvHHqReCjC6aHO6s7OTIzaqPbEVgagfAzC0lX2J/D49XPcRtHqWGUZy+hV0LP+u1f4MFqjg59eSWCDmqYqZHvNZ8sLzUNBmtWwDO/CJGy6DtFJ9YfY0AlyKDl077RFRQ8zKIKAOSGQ1ydxRdxiqisD/0gMQmsXrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9bOyHj2DQt+P82WguoOS8Sw0q0kv0ECfpt0nFjjKRf4=;
 b=ZnzygYpeud8z/l2aVBKNvRFeE9vM9ZtOVWDmdT8W2R/2AVPH4lTDvoRMFU03nvT5tnPdXnxqoMiv4Wk/VXlfWiXrSq49YDaXuzMqb/Zv8yMNsQu0htBbAQ856bNXaXPmKF1UbvBTltJYbCgcj1rZl6P1Xw7hH8T8abJQU0WIC3sGNzhnabHqGhRt37ghshEspXuZtn/hIrgdlCF1d30C7gPjW10cvFohha8krWRLXGfwm8qIS40rOjr/K4lGXX+xu5e03pAvacEaClZTQqTXbP9sZA8+lXe4pqW1RP9kNx1EOBh5dfVYCed2ryv/LEzevbrq4aAIwHIo9gQ6YT6/kA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by PA4PR08MB5888.eurprd08.prod.outlook.com (2603:10a6:102:e8::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Mon, 27 Jul
 2026 17:42:08 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0245.012; Mon, 27 Jul 2026
 17:42:08 +0000
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
Subject: [PATCH v8 09/35] pinctrl: airoha: an7581: fix mux/conf of pcie_reset pins
Date: Mon, 27 Jul 2026 20:41:15 +0300
Message-ID: <20260727174141.664933-10-mikhail.kshevetskiy@iopsys.eu>
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
X-MS-Office365-Filtering-Correlation-Id: 3cf5e05f-c133-4026-a0c1-08deec0661c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|7416014|366016|23010399003|1800799024|921020|38350700014|18002099003|22082099003|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	1oBGtsqO08JxVEGaRKk00c3lWekZy99XAIRyyptmApbMPx6uciIVEre6sjs2rwMGOeAKwn3GLjEXVJp1189vOokkJ348EXrJd2F/z7kGwC15wQjZyFqjmtGgRhSeaCN1U2zTaBmeJo84fBv3eQWQchaYyQeqzuI+DefDh3J7Aox38JMC0GhuBDjBHkR/z+c6PvTco2eU53qJmh6AayKZaQDYn04wyYXzq43+naqA4OStP2o8OL3y49kTRThiaT0UgGP31IoO9P43xy8g+CIshhtp5Ylgye64qI4xlVSbWVo8SxohUOYwrbtRgrQBbds9sa+SJlX/OnQKEN6xPVCTC+XqbK8H0U/F2YCAbJUBGVvp82lVnHq9tA7zuTndLOYj9a0VoQ4fvmjexVjCOqthFfH08p1U1JzgMmzjkmvI0SheLPFOReSSWK56ZIB5cMHgs0k7s0A4pyVjH/s1UXGkKOSTa0FJHwkr4wq6TcB8mf/Ukczq1Nnn7Pvy/wRt2j//rsZJLZrpaUQTnSQJ42n5t79hK6/VPNvxFNe9Q41WshKk+dIHUCb1T+rZBkHBmSBk9RFUutOwhNdIrsIaELZDrA5XsKQ7hyV90JnJJHWepzNz6iioFOyi9tTIsUHUIs/eBY9SSGvxuiMCCCz/Obqu8/CAN+wzz49uee8a5/tk0hvtojIYiH8W6HixJwRWPFWPnM9UC0197BbeXAimMmRAM/V3rT//dMnMHGVYWFVfg0A=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(366016)(23010399003)(1800799024)(921020)(38350700014)(18002099003)(22082099003)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1MPnENwFhrjNbLGx1tW/9dF9tgQrrWOZaOBBaAjX1K6MRg8HzZExW55oZm1a?=
 =?us-ascii?Q?3EaE4uKAeZK9NHPQh7olmPprNlmZKubDlH7OCOTqJxikz/zjSFrJLUb9TY8P?=
 =?us-ascii?Q?2Tz8g8iH+WJXh7DLsCgld44r7+avWgaMPxtyhIF07ZMGlNhLffkkNVz7T5zx?=
 =?us-ascii?Q?Lz5hLz1Vves7wAY+sP+zwxj9d2fH85r4ObOfSStGNETVO4TJKfBim/5Y9qrS?=
 =?us-ascii?Q?ZSSdmeYUFWJx8PfJ4sN5o3BbkgrCx7vpU3p1W40I6YrTmvCAUBM4jpDC0PUY?=
 =?us-ascii?Q?Ptt/nS9wdVeXOzWpkYrEhFVZ3lGRTrPjFm1QIlCdxBUIIjqRG4IXkZWrpJFy?=
 =?us-ascii?Q?Vi7JCsNVhpKzpafljwz9iDjibgjqzg14DH3LzGMC4RAygWm7XcpfqtOh4gh5?=
 =?us-ascii?Q?QIUXAWScen2sdcvCz6Rj5/m6LpPep6EHVeyeBl8RSbETCVdisxz47+EUWEbf?=
 =?us-ascii?Q?1TIb0D4OJobOvNt31zToZM8PaSxB3VQ7y5uwV+ODVlFqGrbqtxYtTZI39c9E?=
 =?us-ascii?Q?RzEdaykLQVUsOepsbNkriKFz7qFQRO+kw4bhmQYEokn4gCtGCQ6dahVM5bLB?=
 =?us-ascii?Q?7+OtFgUdI/XDQB5IfK/KcPnUj72pgcpcjRSgxMJD1Ec8UvLzaNFii6Mod/+h?=
 =?us-ascii?Q?oWKVjC+r0fIoB7yku8FWDCQoyfDk+vRPXfE/F48+wM8jor0kdtHma0ym+ZvA?=
 =?us-ascii?Q?xLuPq/6h4M1IpPAQs5i7ZhP8kNCz4LeXLy68+YIbxDNByf3Tviag0Z1KzcXt?=
 =?us-ascii?Q?rQ+r4EtnJer40B9Luo6fDaDdmRnGYsKeDq6PSY/TtPBeSxEW2//FkSwt3zgg?=
 =?us-ascii?Q?3vmczTZBQ7jFovGvQgem3LgP39E4ZmaBoHM1FvNFQcundB3MUvqkCRxaLKOG?=
 =?us-ascii?Q?+Ww1f9jAjANagx7Z7ran1UOKeaoeLFv/OLMTDZLs64AtBKtouFP1G9+MItvz?=
 =?us-ascii?Q?+IC4n3kRkHt4RPebFzulE7MzMTWCbgUB1OOVn+Cl+fna5pDJKkSAuv12ItCi?=
 =?us-ascii?Q?79g5659JmyKJys+JFb7gNjeYnibcHmmzl3166HMlp8DKwM7iBoKQxQmOpNp+?=
 =?us-ascii?Q?/4aI+5lL93wyrFbL2j4xb1AjXml7Qvs/yumyeqLGigOwd/ghJeC2amvTXdsO?=
 =?us-ascii?Q?M6GoOHDvG/MXyviu/DiL5S/Kt3OzyXP9YOCNHg01ALbzksK62qA12EO5EzgE?=
 =?us-ascii?Q?7ufL92PDbLv69+H/zKd4Q+hrclYS8nDx0hcdIOkLFRyAjFDVGq4tbqRnCw8M?=
 =?us-ascii?Q?KYJ2FgADbxB4XIaclffuvoJWOwPYv6fFm41pSMlTMBkJBUTCkoV6PzgOjMRy?=
 =?us-ascii?Q?TjtmHBzjIFTFa3C1BEFTbdGUZt1rDAUnjBz9Lq5Z79H2WoXxdj9hWivw4BDy?=
 =?us-ascii?Q?9oTb6xs0eVhyVNiGytoo6mGqcploHnKL7M18SewYQUcJ8rccRTF/HR5JByfx?=
 =?us-ascii?Q?KOxIPWF7HslOibZ9HxoA3zRlu3lw/Ss4lSkZQznnQfxPKq4IRRVw8OA5q9/d?=
 =?us-ascii?Q?WH6nb4R/gjTzu2tIphN2WlQpeKXmIlEi4CBdcGlytn3jzOc8j+RVLdcL7FwA?=
 =?us-ascii?Q?+fbH5hDVYsvvUk+CLBXcM1ZaNE//J6keQI6ocbNnGkr58PNSY/QJXBk+f93u?=
 =?us-ascii?Q?tKrQiv6gxdptYebQWnki+SVCOb0vaWDehn0vDDhY/7yPCsh8+yIHV47UClil?=
 =?us-ascii?Q?u/J8lMwFg8LM6/1a+KnTB03GPnJdcHKhnzslZUTWUT3V6FHsyN3XqH0ggrZx?=
 =?us-ascii?Q?gzkqfOCYiru4H29vVqBfD1OMmRC+UJI=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 3cf5e05f-c133-4026-a0c1-08deec0661c4
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 17:42:08.8950
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jNqMFUsYXHuq1U4lkzH99xQqolZ/dFG/FMdwYlGlHjz6Rhtpbl1yRtAs6o2e/UBxGiSA57DrZFg0kzDMDYu5mGNId/gfOmHmgrlriy9aDog=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB5888

In the an7581 case
 * gpio47 and pcie_reset0 shares pin 60,
 * gpio48 and pcie_reset1 shares pin 61,
 * gpio49 and pcie_reset2 shares pin 62.
but current driver treat them as pins 61--63. This is wrong.

Also current an7581 pinmux implementation have following issues:
 * current pcie_reset pin function actually sets corresponding
   pins as gpios.
 * there is no proper way to set pcie_reset pins as gpios.
 * there is no way to set pcie_reset pins as pwm.

This patch fixes above issues.

WARNING:
There is a contradiction in the Airoha documentation. AN7581 programming
guide claims:
 - gpio44 and pcie_reset0 shares the same pin
 - gpio45 and pcie_reset1 shares the same pin
 - gpio46 and pcie_reset2 shares the same pin
While AN7581 datasheet claims:
 - gpio47 and pcie_reset0 shares the same pin
 - gpio48 and pcie_reset1 shares the same pin
 - gpio49 and pcie_reset2 shares the same pin
The datasheet should be considered as a more reliable source.
Thanks to Benjamin Larsson for clarification.

Fixes: 1c8ace2d0725 ("pinctrl: airoha: Add support for EN7581 SoC")
Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
---
 drivers/pinctrl/airoha/pinctrl-airoha.c | 122 +++++++++++++++++++-----
 1 file changed, 97 insertions(+), 25 deletions(-)

diff --git a/drivers/pinctrl/airoha/pinctrl-airoha.c b/drivers/pinctrl/airoha/pinctrl-airoha.c
index 75a5167b67186..23735ea63d7e0 100644
--- a/drivers/pinctrl/airoha/pinctrl-airoha.c
+++ b/drivers/pinctrl/airoha/pinctrl-airoha.c
@@ -470,9 +470,9 @@ static struct pinctrl_pin_desc en7581_pinctrl_pins[] = {
 	PINCTRL_PIN(57, "gpio44"),
 	PINCTRL_PIN(58, "gpio45"),
 	PINCTRL_PIN(59, "gpio46"),
-	PINCTRL_PIN(61, "pcie_reset0"),
-	PINCTRL_PIN(62, "pcie_reset1"),
-	PINCTRL_PIN(63, "pcie_reset2"),
+	PINCTRL_PIN(60, "pcie_reset0"),
+	PINCTRL_PIN(61, "pcie_reset1"),
+	PINCTRL_PIN(62, "pcie_reset2"),
 };
 
 static const int en7581_pon_pins[] = { 49, 50, 51, 52, 53, 54 };
@@ -555,9 +555,12 @@ static const int en7581_gpio43_pins[] = { 56 };
 static const int en7581_gpio44_pins[] = { 57 };
 static const int en7581_gpio45_pins[] = { 58 };
 static const int en7581_gpio46_pins[] = { 59 };
-static const int en7581_pcie_reset0_pins[] = { 61 };
-static const int en7581_pcie_reset1_pins[] = { 62 };
-static const int en7581_pcie_reset2_pins[] = { 63 };
+static const int en7581_gpio47_pins[] = { 60 };
+static const int en7581_gpio48_pins[] = { 61 };
+static const int en7581_gpio49_pins[] = { 62 };
+static const int en7581_pcie_reset0_pins[] = { 60 };
+static const int en7581_pcie_reset1_pins[] = { 61 };
+static const int en7581_pcie_reset2_pins[] = { 62 };
 
 static const struct pingroup en7581_pinctrl_groups[] = {
 	PINCTRL_PIN_GROUP("pon", en7581_pon),
@@ -640,6 +643,9 @@ static const struct pingroup en7581_pinctrl_groups[] = {
 	PINCTRL_PIN_GROUP("gpio44", en7581_gpio44),
 	PINCTRL_PIN_GROUP("gpio45", en7581_gpio45),
 	PINCTRL_PIN_GROUP("gpio46", en7581_gpio46),
+	PINCTRL_PIN_GROUP("gpio47", en7581_gpio47),
+	PINCTRL_PIN_GROUP("gpio48", en7581_gpio48),
+	PINCTRL_PIN_GROUP("gpio49", en7581_gpio49),
 	PINCTRL_PIN_GROUP("pcie_reset0", en7581_pcie_reset0),
 	PINCTRL_PIN_GROUP("pcie_reset1", en7581_pcie_reset1),
 	PINCTRL_PIN_GROUP("pcie_reset2", en7581_pcie_reset2),
@@ -883,6 +889,7 @@ static const char *const an7583_pcm_spi_groups[] = { "pcm_spi",
 static const char *const i2s_groups[] = { "i2s" };
 static const char *const emmc_groups[] = { "emmc" };
 static const char *const pnand_groups[] = { "pnand" };
+static const char *const gpio_groups[] = { "gpio47", "gpio48", "gpio49" };
 static const char *const pcie_reset_groups[] = { "pcie_reset0", "pcie_reset1",
 						 "pcie_reset2" };
 static const char *const an7583_pcie_reset_groups[] = { "pcie_reset0", "pcie_reset1" };
@@ -907,7 +914,8 @@ static const char *const pwm_groups[] = { "gpio0", "gpio1",
 					  "gpio40", "gpio41",
 					  "gpio42", "gpio43",
 					  "gpio44", "gpio45",
-					  "gpio46" };
+					  "gpio46", "gpio47",
+					  "gpio48", "gpio49" };
 static const char *const an7583_pwm_groups[] = { "gpio0", "gpio1",
 						 "gpio2", "gpio3",
 						 "gpio4", "gpio5",
@@ -1406,6 +1414,45 @@ static const struct airoha_pinctrl_func_group pnand_func_group[] = {
 	},
 };
 
+#define AIROHA_PINCTRL_GPIO(gpio, mux_val)			\
+	{							\
+		.name = (gpio),					\
+		.regmap[0] = {					\
+			AIROHA_FUNC_MUX,			\
+			REG_GPIO_PON_MODE,			\
+			(mux_val),				\
+			(mux_val)				\
+		},						\
+		.regmap_size = 1,				\
+	}
+
+#define AIROHA_PINCTRL_GPIO_EXT(gpio, mux_val, smux_val)	\
+	{							\
+		.name = (gpio),					\
+		.regmap[0] = {					\
+			AIROHA_FUNC_PWM_EXT_MUX,		\
+			REG_GPIO_FLASH_MODE_CFG_EXT,		\
+			(mux_val),				\
+			0					\
+		},						\
+		.regmap[1] = {					\
+			AIROHA_FUNC_MUX,			\
+			REG_GPIO_PON_MODE,			\
+			(smux_val),				\
+			(smux_val)				\
+		},						\
+		.regmap_size = 2,				\
+	}
+
+static const struct airoha_pinctrl_func_group gpio_func_group[] = {
+	AIROHA_PINCTRL_GPIO_EXT("gpio47", GPIO47_FLASH_MODE_CFG,
+				GPIO_PCIE_RESET0_MASK),
+	AIROHA_PINCTRL_GPIO_EXT("gpio48", GPIO48_FLASH_MODE_CFG,
+				GPIO_PCIE_RESET1_MASK),
+	AIROHA_PINCTRL_GPIO_EXT("gpio49", GPIO49_FLASH_MODE_CFG,
+				GPIO_PCIE_RESET2_MASK),
+};
+
 static const struct airoha_pinctrl_func_group pcie_reset_func_group[] = {
 	{
 		.name = "pcie_reset0",
@@ -1413,7 +1460,7 @@ static const struct airoha_pinctrl_func_group pcie_reset_func_group[] = {
 			AIROHA_FUNC_MUX,
 			REG_GPIO_PON_MODE,
 			GPIO_PCIE_RESET0_MASK,
-			GPIO_PCIE_RESET0_MASK
+			0
 		},
 		.regmap_size = 1,
 	}, {
@@ -1422,7 +1469,7 @@ static const struct airoha_pinctrl_func_group pcie_reset_func_group[] = {
 			AIROHA_FUNC_MUX,
 			REG_GPIO_PON_MODE,
 			GPIO_PCIE_RESET1_MASK,
-			GPIO_PCIE_RESET1_MASK
+			0
 		},
 		.regmap_size = 1,
 	}, {
@@ -1431,7 +1478,7 @@ static const struct airoha_pinctrl_func_group pcie_reset_func_group[] = {
 			AIROHA_FUNC_MUX,
 			REG_GPIO_PON_MODE,
 			GPIO_PCIE_RESET2_MASK,
-			GPIO_PCIE_RESET2_MASK
+			0
 		},
 		.regmap_size = 1,
 	},
@@ -1484,6 +1531,24 @@ static const struct airoha_pinctrl_func_group an7583_pcie_reset_func_group[] = {
 		.regmap_size = 1,			\
 	}						\
 
+#define AIROHA_PINCTRL_PWM_EXT_SEC(gpio, mux_val, smux_val)	\
+	{							\
+		.name = (gpio),					\
+		.regmap[0] = {					\
+			AIROHA_FUNC_PWM_EXT_MUX,		\
+			REG_GPIO_FLASH_MODE_CFG_EXT,		\
+			(mux_val),				\
+			(mux_val)				\
+		},						\
+		.regmap[1] = {					\
+			AIROHA_FUNC_MUX,			\
+			REG_GPIO_PON_MODE,			\
+			(smux_val),				\
+			(smux_val)				\
+		},						\
+		.regmap_size = 2,				\
+	}
+
 static const struct airoha_pinctrl_func_group pwm_func_group[] = {
 	AIROHA_PINCTRL_PWM("gpio0", GPIO0_FLASH_MODE_CFG),
 	AIROHA_PINCTRL_PWM("gpio1", GPIO1_FLASH_MODE_CFG),
@@ -1528,6 +1593,12 @@ static const struct airoha_pinctrl_func_group pwm_func_group[] = {
 	AIROHA_PINCTRL_PWM_EXT("gpio44", GPIO44_FLASH_MODE_CFG),
 	AIROHA_PINCTRL_PWM_EXT("gpio45", GPIO45_FLASH_MODE_CFG),
 	AIROHA_PINCTRL_PWM_EXT("gpio46", GPIO46_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM_EXT_SEC("gpio47", GPIO47_FLASH_MODE_CFG,
+				   GPIO_PCIE_RESET0_MASK),
+	AIROHA_PINCTRL_PWM_EXT_SEC("gpio48", GPIO48_FLASH_MODE_CFG,
+				   GPIO_PCIE_RESET1_MASK),
+	AIROHA_PINCTRL_PWM_EXT_SEC("gpio49", GPIO49_FLASH_MODE_CFG,
+				   GPIO_PCIE_RESET2_MASK),
 };
 
 static const struct airoha_pinctrl_func_group an7583_pwm_func_group[] = {
@@ -1804,6 +1875,7 @@ static const struct airoha_pinctrl_func en7581_pinctrl_funcs[] = {
 	PINCTRL_FUNC_DESC("i2s", i2s),
 	PINCTRL_FUNC_DESC("emmc", emmc),
 	PINCTRL_FUNC_DESC("pnand", pnand),
+	PINCTRL_FUNC_DESC("gpio", gpio),
 	PINCTRL_FUNC_DESC("pcie_reset", pcie_reset),
 	PINCTRL_FUNC_DESC("pwm", pwm),
 	PINCTRL_FUNC_DESC("phy1_led0", phy1_led0),
@@ -1896,9 +1968,9 @@ static const struct airoha_pinctrl_conf en7581_pinctrl_pullup_conf[] = {
 	PINCTRL_CONF_DESC(57, REG_GPIO_H_PU, BIT(12)),
 	PINCTRL_CONF_DESC(58, REG_GPIO_H_PU, BIT(13)),
 	PINCTRL_CONF_DESC(59, REG_GPIO_H_PU, BIT(14)),
-	PINCTRL_CONF_DESC(61, REG_I2C_SDA_PU, PCIE0_RESET_PU_MASK),
-	PINCTRL_CONF_DESC(62, REG_I2C_SDA_PU, PCIE1_RESET_PU_MASK),
-	PINCTRL_CONF_DESC(63, REG_I2C_SDA_PU, PCIE2_RESET_PU_MASK),
+	PINCTRL_CONF_DESC(60, REG_I2C_SDA_PU, PCIE0_RESET_PU_MASK),
+	PINCTRL_CONF_DESC(61, REG_I2C_SDA_PU, PCIE1_RESET_PU_MASK),
+	PINCTRL_CONF_DESC(62, REG_I2C_SDA_PU, PCIE2_RESET_PU_MASK),
 };
 
 static const struct airoha_pinctrl_conf an7583_pinctrl_pullup_conf[] = {
@@ -2013,9 +2085,9 @@ static const struct airoha_pinctrl_conf en7581_pinctrl_pulldown_conf[] = {
 	PINCTRL_CONF_DESC(57, REG_GPIO_H_PD, BIT(12)),
 	PINCTRL_CONF_DESC(58, REG_GPIO_H_PD, BIT(13)),
 	PINCTRL_CONF_DESC(59, REG_GPIO_H_PD, BIT(14)),
-	PINCTRL_CONF_DESC(61, REG_I2C_SDA_PD, PCIE0_RESET_PD_MASK),
-	PINCTRL_CONF_DESC(62, REG_I2C_SDA_PD, PCIE1_RESET_PD_MASK),
-	PINCTRL_CONF_DESC(63, REG_I2C_SDA_PD, PCIE2_RESET_PD_MASK),
+	PINCTRL_CONF_DESC(60, REG_I2C_SDA_PD, PCIE0_RESET_PD_MASK),
+	PINCTRL_CONF_DESC(61, REG_I2C_SDA_PD, PCIE1_RESET_PD_MASK),
+	PINCTRL_CONF_DESC(62, REG_I2C_SDA_PD, PCIE2_RESET_PD_MASK),
 };
 
 static const struct airoha_pinctrl_conf an7583_pinctrl_pulldown_conf[] = {
@@ -2130,9 +2202,9 @@ static const struct airoha_pinctrl_conf en7581_pinctrl_drive_e2_conf[] = {
 	PINCTRL_CONF_DESC(57, REG_GPIO_H_E2, BIT(12)),
 	PINCTRL_CONF_DESC(58, REG_GPIO_H_E2, BIT(13)),
 	PINCTRL_CONF_DESC(59, REG_GPIO_H_E2, BIT(14)),
-	PINCTRL_CONF_DESC(61, REG_I2C_SDA_E2, PCIE0_RESET_E2_MASK),
-	PINCTRL_CONF_DESC(62, REG_I2C_SDA_E2, PCIE1_RESET_E2_MASK),
-	PINCTRL_CONF_DESC(63, REG_I2C_SDA_E2, PCIE2_RESET_E2_MASK),
+	PINCTRL_CONF_DESC(60, REG_I2C_SDA_E2, PCIE0_RESET_E2_MASK),
+	PINCTRL_CONF_DESC(61, REG_I2C_SDA_E2, PCIE1_RESET_E2_MASK),
+	PINCTRL_CONF_DESC(62, REG_I2C_SDA_E2, PCIE2_RESET_E2_MASK),
 };
 
 static const struct airoha_pinctrl_conf an7583_pinctrl_drive_e2_conf[] = {
@@ -2247,9 +2319,9 @@ static const struct airoha_pinctrl_conf en7581_pinctrl_drive_e4_conf[] = {
 	PINCTRL_CONF_DESC(57, REG_GPIO_H_E4, BIT(12)),
 	PINCTRL_CONF_DESC(58, REG_GPIO_H_E4, BIT(13)),
 	PINCTRL_CONF_DESC(59, REG_GPIO_H_E4, BIT(14)),
-	PINCTRL_CONF_DESC(61, REG_I2C_SDA_E4, PCIE0_RESET_E4_MASK),
-	PINCTRL_CONF_DESC(62, REG_I2C_SDA_E4, PCIE1_RESET_E4_MASK),
-	PINCTRL_CONF_DESC(63, REG_I2C_SDA_E4, PCIE2_RESET_E4_MASK),
+	PINCTRL_CONF_DESC(60, REG_I2C_SDA_E4, PCIE0_RESET_E4_MASK),
+	PINCTRL_CONF_DESC(61, REG_I2C_SDA_E4, PCIE1_RESET_E4_MASK),
+	PINCTRL_CONF_DESC(62, REG_I2C_SDA_E4, PCIE2_RESET_E4_MASK),
 };
 
 static const struct airoha_pinctrl_conf an7583_pinctrl_drive_e4_conf[] = {
@@ -2309,9 +2381,9 @@ static const struct airoha_pinctrl_conf an7583_pinctrl_drive_e4_conf[] = {
 };
 
 static const struct airoha_pinctrl_conf en7581_pinctrl_pcie_rst_od_conf[] = {
-	PINCTRL_CONF_DESC(61, REG_PCIE_RESET_OD, PCIE0_RESET_OD_MASK),
-	PINCTRL_CONF_DESC(62, REG_PCIE_RESET_OD, PCIE1_RESET_OD_MASK),
-	PINCTRL_CONF_DESC(63, REG_PCIE_RESET_OD, PCIE2_RESET_OD_MASK),
+	PINCTRL_CONF_DESC(60, REG_PCIE_RESET_OD, PCIE0_RESET_OD_MASK),
+	PINCTRL_CONF_DESC(61, REG_PCIE_RESET_OD, PCIE1_RESET_OD_MASK),
+	PINCTRL_CONF_DESC(62, REG_PCIE_RESET_OD, PCIE2_RESET_OD_MASK),
 };
 
 static const struct airoha_pinctrl_conf an7583_pinctrl_pcie_rst_od_conf[] = {
-- 
2.53.0

