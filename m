Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11021121.outbound.protection.outlook.com [52.101.70.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B042E3E1713;
	Mon, 27 Jul 2026 07:43:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.121
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785138190; cv=fail; b=DFeI6Hb2IDkeblUt+zwTJKuDOasJt/mrFkVybC/Hl5s20Z21sygvSICu87U9anGeyaZpQKjBkqQlOPwpE1JUtcqCz1828rDb/R2TaUuR4bXisuS3xDaF0qvKvE88xJ20eQRHEx7ITZJ/Fr+4xmEqnkG1xR88x0N0m5d7crnF90I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785138190; c=relaxed/simple;
	bh=MtxcMbsXWgGdt92jPGcRLPkafAe6rPSLwQbl+1q/vug=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=YeRNW++m0Q3qEgJwZZBLD7d533nkAQ9A0eckP+wA7ACnfitS4Yqy8qVDqzdiT9H/4r2TSXiro1oGzC7FotRrsF2ZtOpNKVavKvVfSwgBuWsQ0uMs2xlBVQDsTmlotbRsPVHzQ4K7PTrbmkuzE1FXQA6nlcShV/EfHd/ZOXHtobM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b=rMPfoQ4g; arc=fail smtp.client-ip=52.101.70.121
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=genexis.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b="rMPfoQ4g"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RIUjHmseEIGkOih0zBsmAgQtL3rcljtAlxhrpUlro2zVnGNdxQGlwjL00oVeBr3Rkj953+xqsqj4xaaBo7QDZm/16FSWlHHLAxB2OxD1uplqRRiN+0UKzU3+tIUe2J5ki36Ob6ueDM+AeVxmLgKRakpMM869o8kUwbm5SLzqqpvswqng5YLQP6JwvWTvRfHlhoSiAZIfZiHy016CqugUWFgYWm1lu0wEt57R35L8srpki+zg93ZCaDfS4k8ygT9unYIgaywGMhJRYoSWLm/c6zWio4AWTokHNfLTlfQTwflTkPwLoN00cSboeKrM99eB0toboyU2zfXJSzIqKJ73oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H+oS47L9I/YWN7StmaOkLznchPs0rEn0n0RA7so6mrc=;
 b=jAbsDeoxnEpYQRiVZRaRy8z/OY8V7vyp6k+kysJ8qojLnHSn4C06BLv8nnP2vfJf6aOgHfCtm7ALcfINhzb9a+QQISOFlqlbjME1XTNdyr3QMdK2kXBHBBPnM5dyripl8ro4R+dCgWzcaTc0RJER6LCU/u0iMhtQu8/a8R5zNoWJyoi6Q5qpuNFN+1sX4ibV5I0Z49t8Ner1BcjJFM6Lodb80u1JPyOkYEq1kj9fMMz6N7ZQuBXDFQa3dJlrSqtiE7ngwzD92emcVVyKwVqpbUtXmfn/MBzU62+GsEE7OMbdsTsix1WRJEOeYcMyL0n0RFinTAuMIUHAeu5rqDpBfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H+oS47L9I/YWN7StmaOkLznchPs0rEn0n0RA7so6mrc=;
 b=rMPfoQ4ggVGHNLpMlxH17B44bM6ptY6+KWtQ0Ze/KztY0yWeP8XU56F4RZKhR3fvXgjwpcaQK/eahvngasaCt4P/NIjojwyGWmUZG1TmOzIOOna+skEZ0u5ILHBMRh5I0I8k4ag8sv1hd8P1JqQhBUiLIkTJkhtOM0ytwCebnADexFLI+HSK5OPsEbR48HKoaQPZunxmouU2iigU5zmaWuDcqGaA6T2PuHojvyTHrr2jP0c30aZIQVeCWSCr5wrsUNhI5NPMn0ec3Aj86Jg/eBTxk7Mse1IHzX0+THWCRL1BrsoZ8EhDYg5sOeLhNd5vhT3AMPWwjB7VQx0gLEgb5A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by PR3PR08MB5868.eurprd08.prod.outlook.com (2603:10a6:102:81::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Mon, 27 Jul
 2026 07:42:59 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0245.012; Mon, 27 Jul 2026
 07:42:59 +0000
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
Subject: [PATCH v7 08/34] pinctrl: airoha: an7581: fix mux/conf of pcie_reset pins
Date: Mon, 27 Jul 2026 10:42:08 +0300
Message-ID: <20260727074234.3761170-9-mikhail.kshevetskiy@iopsys.eu>
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
X-MS-Office365-Filtering-Correlation-Id: 5ac0fc62-097c-4d29-ebd2-08deebb2adf9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|7416014|52116014|11063799006|56012099006|10067099003|18002099003|22082099003|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	nikMpvmRuydyhcQG/f004mldBowW4ntmXTsHOcJ5sC1GAPRZ2oC+fMXY5/eEmgMN3GAJ9/YqGaosJ2tQuCBz15oU5mxA3tVfKfZKHhIl9xtQT1xKe8YyzWK4fwCN+ZqH5WV3zCHhNGC+KzWyXfD1Qens7TW1iD6RgnYMIxGCLcWKAoRw0JVEX1oVwzLIu6OUr8Kpa0M/UmVsx9SZpJ0IaHp63zo+ljPQ4ebI9+777Cepx3okmJBdp0aiYjH9NzKrY7tkpRh0nUNVebvmAu85imKUDbyPHt8Io0FEl/a/wlC8aPVoZ0hn/ZnRPKLMQZiNAIypLFaYVt4M9EvKoOfoOAoC3lcnSfzPa0cjOgqrudS6525qCwlQiZf3yY9nFuL7mX/79V/eB5wS+u3cZvLwJJad1XTnW73OwlVWsd+xfQqoQi8i6F7Jm6cWM6520PDbYOEwvPu0T5uMHxHnJdB6xE7X2ZaDkE80bXnPAwv79abkQTBkZotQ5cW3Dm4Q9JWiXsPJoZtNN0nXpCiAzBS102Bc6rlXQG2sYIbF1Ot9DjstYo8bZInPgnDPqlFL07PBuF3w1hWFcAw3YYByDv898qWriaEJpFVJUC5OEZcuXRDaTT6qQ/q/hYZRPaoSzHKXGqHHw0wU/CtDxwVtpjwigk4Ugze/OvcuCxT/7cINraWL45Y4tND8giW2Sdn2518WRtmZY/uDo712YDjjqwF7Fqj3j4m0mGt6+C2HGFgPFZvo3SPGsfVLU0RY6YGyIfam
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(7416014)(52116014)(11063799006)(56012099006)(10067099003)(18002099003)(22082099003)(38350700014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0x423heOpDP835SxhxGgGyiEkv9s+HaXrnqLwC/ux9ZJ+BsnOmRbSAv+AddY?=
 =?us-ascii?Q?08+2Hu67DXL1aWpVt8RyvPCL6zvOXMh0ynLF6Y5wDwrEEmOPsQHEd4bYFzkl?=
 =?us-ascii?Q?5Tg6dEHL1ub2NKkdiQKzHva0g4L/exWZYELCx+TClmBs11KfJEJ6UB0Un4cP?=
 =?us-ascii?Q?vIUImUro8lI8BwnWs4lYE5m7cbR7hWxwHdJudYpgcj7uwkDH4ejx5KQu15C2?=
 =?us-ascii?Q?61GxFBzwYqmGiKiM0dXbw5QyJfQOXXfN3jfGAC7CbAcvScN0l/nF3N+gsmr+?=
 =?us-ascii?Q?nkOpVC04N6Xbc+JqByklCJdVBifrR1R42Bdz8VwpGGmUh9ZWHKSkV6qKXNP7?=
 =?us-ascii?Q?f44O1MVWO5XH+NhcFLrzwxaxoOnsHDnchmaJ3VMivx2lg95oBIqJDR+aaBuj?=
 =?us-ascii?Q?eXWXAxxKDWrpiwMuSD1eWJ/oKPhHsj73Tbtj2Q7h6b4gp935+v6hVuYtRHte?=
 =?us-ascii?Q?I4GIhrlwn0+3L+4oIewkwOB4XqoE2QsMrVFo2pHecFdyUMDuvTsK4+6X5y5i?=
 =?us-ascii?Q?RDrU5iP6V9We3pPhGe4tc45MYuRtwSc1Il1w0NOyK2doZUGqMjdNcL3ueuoq?=
 =?us-ascii?Q?4mPp/KWHYr6Md6Ttg/1ElmKXqj0uqnUU5thYfaUK/Ezj6WljFKqq5Fv9EdYB?=
 =?us-ascii?Q?Et6cLgpMBSwVUSk6okzDGJlWjs/jHl0jIjv8jsRbeGaMllWYv/h2I8yIpE5a?=
 =?us-ascii?Q?gUIF8/84HgHtYlATKSgvr985v6iDd6EDd3im4ntS9B7EN2U3qttMFZ4ToF67?=
 =?us-ascii?Q?PdOrTShtER9GiEprwi9Kgg01lYismigbdPMSdi/lGOXBeXt1sz6Hvhpq1tOC?=
 =?us-ascii?Q?4y/QA5reboJ5w6ML0D4s/FbfC7IV7Kzlhsz8UX4cBOGKytxDLQUJz64Z1C7G?=
 =?us-ascii?Q?ATV8ScO5qTLVWxsExW8vofrj6QFJNgrW6h6VBEyJfEDj6ZOBCur30Wtot1EC?=
 =?us-ascii?Q?b/X4HWPh7wXmQNu/cEdu2ke1JDZ/0eGg1AuKK6nqMdb5c0jGOi5Fd0qIySCa?=
 =?us-ascii?Q?QZv6XbpWQ6b4TxvEXwh3DK3vplxcXStfq+Z31k8Cy9bXb4ZnslGgdr1DMl1P?=
 =?us-ascii?Q?ahtxrZJ6HLZr35+/bNamQ5QFILKkOyM6D/v/JQ9HpbiIehEwpRLB+OgV6T3T?=
 =?us-ascii?Q?AAMtMTPVNMThS9OarlL29CyTR/yJOLfIz0gHAx7FkqhMdSKWRObfUyvAQjXy?=
 =?us-ascii?Q?DqO6oOcFElONLr3TrYWFc8bxRwrW4+BgawJ09pnhcK3m8LuBKLT10x0rhyu0?=
 =?us-ascii?Q?t6jWYKmXH2Km3VgVGbQitk/uQN/n/tE/B/S3wMyYPxpZwBnLq5iYKvrsVu/I?=
 =?us-ascii?Q?DMhfJ565zyu17+9/dOb9rBCcX+U7vC4CPxyePM8rJBj5dBe42sqYCEnqXnGx?=
 =?us-ascii?Q?uX0XB0lMlfp5hSDQNAZkaXJVcBDYVw84780w1s1Ewro6JkHEKZ33CaPtQt0Z?=
 =?us-ascii?Q?l5PcIJvXSkswzyYUj1PRoooD42z7bmpacl4JafLQLYQxYfByAgJgfcy5TEic?=
 =?us-ascii?Q?ZG17XPQsRfk1WSIbiRjfkSlYmVlK5Vb7Woeg3SwJxUpdUK9bX1AkFtL5ezeG?=
 =?us-ascii?Q?81I56su9ktUXzS0Ypjyj9rHWOtVTXu7V8ehMgcgU95c71Shf+cS85sYL6za3?=
 =?us-ascii?Q?NbR2i4R2P80AEhe9qG0twMLG73LmVld3m74haV0tApxB+K/ZSIqqAr5tDmh6?=
 =?us-ascii?Q?rTXIimxrsw0uj5lhFanezo8LzhdkxFeW5UpN4MmJJ5FQv4Ygo5bCVbupHb3C?=
 =?us-ascii?Q?eulXJ0/QauXafZQVIm0uH6ItCkUTUZQ=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ac0fc62-097c-4d29-ebd2-08deebb2adf9
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 07:42:59.0665
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ukDc2oaqGQTEt/65h5S3MjribBh9B99e68hrga7wrvLYn5OZzwn5sshVVmilAEDcSC2DmQKIZjcbbX9B6oLcXGuzcRDI9zlnD/Even2MbXc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5868

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
index caa1afcc1697f..b30b593e9dbf0 100644
--- a/drivers/pinctrl/airoha/pinctrl-airoha.c
+++ b/drivers/pinctrl/airoha/pinctrl-airoha.c
@@ -469,9 +469,9 @@ static struct pinctrl_pin_desc en7581_pinctrl_pins[] = {
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
@@ -554,9 +554,12 @@ static const int en7581_gpio43_pins[] = { 56 };
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
@@ -639,6 +642,9 @@ static const struct pingroup en7581_pinctrl_groups[] = {
 	PINCTRL_PIN_GROUP("gpio44", en7581_gpio44),
 	PINCTRL_PIN_GROUP("gpio45", en7581_gpio45),
 	PINCTRL_PIN_GROUP("gpio46", en7581_gpio46),
+	PINCTRL_PIN_GROUP("gpio47", en7581_gpio47),
+	PINCTRL_PIN_GROUP("gpio48", en7581_gpio48),
+	PINCTRL_PIN_GROUP("gpio49", en7581_gpio49),
 	PINCTRL_PIN_GROUP("pcie_reset0", en7581_pcie_reset0),
 	PINCTRL_PIN_GROUP("pcie_reset1", en7581_pcie_reset1),
 	PINCTRL_PIN_GROUP("pcie_reset2", en7581_pcie_reset2),
@@ -882,6 +888,7 @@ static const char *const an7583_pcm_spi_groups[] = { "pcm_spi",
 static const char *const i2s_groups[] = { "i2s" };
 static const char *const emmc_groups[] = { "emmc" };
 static const char *const pnand_groups[] = { "pnand" };
+static const char *const gpio_groups[] = { "gpio47", "gpio48", "gpio49" };
 static const char *const pcie_reset_groups[] = { "pcie_reset0", "pcie_reset1",
 						 "pcie_reset2" };
 static const char *const an7583_pcie_reset_groups[] = { "pcie_reset0", "pcie_reset1" };
@@ -906,7 +913,8 @@ static const char *const pwm_groups[] = { "gpio0", "gpio1",
 					  "gpio40", "gpio41",
 					  "gpio42", "gpio43",
 					  "gpio44", "gpio45",
-					  "gpio46" };
+					  "gpio46", "gpio47",
+					  "gpio48", "gpio49" };
 static const char *const an7583_pwm_groups[] = { "gpio0", "gpio1",
 						 "gpio2", "gpio3",
 						 "gpio4", "gpio5",
@@ -1405,6 +1413,45 @@ static const struct airoha_pinctrl_func_group pnand_func_group[] = {
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
@@ -1412,7 +1459,7 @@ static const struct airoha_pinctrl_func_group pcie_reset_func_group[] = {
 			AIROHA_FUNC_MUX,
 			REG_GPIO_PON_MODE,
 			GPIO_PCIE_RESET0_MASK,
-			GPIO_PCIE_RESET0_MASK
+			0
 		},
 		.regmap_size = 1,
 	}, {
@@ -1421,7 +1468,7 @@ static const struct airoha_pinctrl_func_group pcie_reset_func_group[] = {
 			AIROHA_FUNC_MUX,
 			REG_GPIO_PON_MODE,
 			GPIO_PCIE_RESET1_MASK,
-			GPIO_PCIE_RESET1_MASK
+			0
 		},
 		.regmap_size = 1,
 	}, {
@@ -1430,7 +1477,7 @@ static const struct airoha_pinctrl_func_group pcie_reset_func_group[] = {
 			AIROHA_FUNC_MUX,
 			REG_GPIO_PON_MODE,
 			GPIO_PCIE_RESET2_MASK,
-			GPIO_PCIE_RESET2_MASK
+			0
 		},
 		.regmap_size = 1,
 	},
@@ -1483,6 +1530,24 @@ static const struct airoha_pinctrl_func_group an7583_pcie_reset_func_group[] = {
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
@@ -1527,6 +1592,12 @@ static const struct airoha_pinctrl_func_group pwm_func_group[] = {
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
@@ -1803,6 +1874,7 @@ static const struct airoha_pinctrl_func en7581_pinctrl_funcs[] = {
 	PINCTRL_FUNC_DESC("i2s", i2s),
 	PINCTRL_FUNC_DESC("emmc", emmc),
 	PINCTRL_FUNC_DESC("pnand", pnand),
+	PINCTRL_FUNC_DESC("gpio", gpio),
 	PINCTRL_FUNC_DESC("pcie_reset", pcie_reset),
 	PINCTRL_FUNC_DESC("pwm", pwm),
 	PINCTRL_FUNC_DESC("phy1_led0", phy1_led0),
@@ -1895,9 +1967,9 @@ static const struct airoha_pinctrl_conf en7581_pinctrl_pullup_conf[] = {
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
@@ -2012,9 +2084,9 @@ static const struct airoha_pinctrl_conf en7581_pinctrl_pulldown_conf[] = {
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
@@ -2129,9 +2201,9 @@ static const struct airoha_pinctrl_conf en7581_pinctrl_drive_e2_conf[] = {
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
@@ -2246,9 +2318,9 @@ static const struct airoha_pinctrl_conf en7581_pinctrl_drive_e4_conf[] = {
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
@@ -2308,9 +2380,9 @@ static const struct airoha_pinctrl_conf an7583_pinctrl_drive_e4_conf[] = {
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

