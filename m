Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11023106.outbound.protection.outlook.com [52.101.72.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76DEA43FD24;
	Mon, 27 Jul 2026 17:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.106
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785174171; cv=fail; b=Lm/R7yQRaYmutv8FbrOmeTwEgtWK7lpv0lLbkutoiDov+M2IQpdrHcUKqKImrhtbA+P0Rjy0pC/QJWLnVRVqv6fJxfOLGsAN7yXbICrg5pVyelc/AAf6AqihQ5CDIhIFbPIpNqYMzpy/NpNSmejEoQsWsuXzA4Q6DxVR3a+hLVY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785174171; c=relaxed/simple;
	bh=zO5rmcAL/Zh3EfCXZDwl9piDOYoxQ7GjtSDNfG9ljI8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ui6sao5ERR57Wu2YNlF38OQR7c6/Gwkimd6AFsHD+wJZgbepMNG9NwKA3oLsmk7KbIY3iDtGt9E2AS/jgMHvbSmOzVs9coDOvXPiYmEARgxN3diTojs5snlUa176TP0mZu4OvRv9bKq3yd3qazNajTUCA0dskK0cgVtKhwg0ULQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b=0REzG4YX; arc=fail smtp.client-ip=52.101.72.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=genexis.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b="0REzG4YX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RS77uzaGfwg1gkUXoa5mbiHwZ2hj1FfksjB0clQk0+6KCYjbxAar6/CYrwRINa7yWdc2xu/bugT7IVKhyPXEHnc5/b+MEpncgnNlcFr81gV7qIXhe9QK1GmM7Kms6aQnVU5fhqBaSyy4ZBai8r+c0k+U0PzQQNRfsrJSLr8YV//paRHRWBvbHdr74vHgBdnTZ9Aj3kWCsSvd37qUQQSHewZW1lN2sQJ8Zxf8j81yRvuzQIbZi+xfGEZAY5henuRe31h4ioROwlS3XI8UyV+F47qplRktrjLUb5YZEC4mab3ONupTVm+fgZvxdhibSk9pvQdqZFXOQEkdXR+C4gkPaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MrpT6Fod8O552THAIhKFu2hbwaeWqitLk5oufI+Tnys=;
 b=kZadFke+nNYPaRkR8JO3cn3Xrp5ZAwUASUr/iZesXXJwCSK74ZdG8To/IDjadIfNn+LRkHyDb7Nng43vls5X6JEsA7Wu+izqhBeLRah3RoMC7ZAB6Eol0PanKF3GeLnKe0ptGaATknjLzviNcxS240XTyzv0PgGGNyHxFcnz3PXya/JSGIhzHW8JJH6OE5WtzH7PNL9EUksrIactvInXLvvzSHevrAx2j5w0f8vvt0WMyTeRpYGKdOtQfTc5C9Dm864AEkY82L38HiZeSBADUwvLE0e+b1+JR3+BNT75/nVZiKOB8zOIei+tPbPdU+m2yZlyq4MUXIf3eEMPr80C9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MrpT6Fod8O552THAIhKFu2hbwaeWqitLk5oufI+Tnys=;
 b=0REzG4YXDxTZslIKuE0+Dx8iwA42u53ApotGqudXJN9mVEJs/8zSPqi5bGrAt7owuqyiaAVZHyYeapsMpTkywrwSX9awThOHtRbHoLm6ztsPVP5J2jKxGeWT9o8Rjc58g1aayZ99fZlnYuVE2BL4izzvLOTpZWwobSmOScUNmVmLFjEuzn/EGosaloOp79piKWipPiNblzcbMk5JCPlPZ8itg7tx/uN/X052cykXATjRSVYXyON6J9zn0v8IrNeD/9XBjO3eAQFw9CsrMxy1bZKpJ5wX4xBnnJKeWL2lrHMlu4sT86UEJltMSGT0a6cC1OJcX1H/ITKe8sbNL5WmyA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by PA4PR08MB6111.eurprd08.prod.outlook.com (2603:10a6:102:e3::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.12; Mon, 27 Jul
 2026 17:42:42 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0245.012; Mon, 27 Jul 2026
 17:42:41 +0000
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
Subject: [PATCH v8 29/35] pinctrl: airoha: an7583: add support for olt pinmux
Date: Mon, 27 Jul 2026 20:41:35 +0300
Message-ID: <20260727174141.664933-30-mikhail.kshevetskiy@iopsys.eu>
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
X-MS-Office365-Filtering-Correlation-Id: 6d036852-c6e8-4064-0cd2-08deec06757b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|7416014|376014|52116014|366016|11063799006|10067099003|56012099006|18002099003|22082099003|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	ZnmjkvRNVhXBkZmgCaiuVxBW0CPKI3n343dRUPu+IvzjQcHxZy2IhFN3HXqIGFq+Chbbi8ebSofKHyfjK+cESZC3hqloQka5ChZyghgTGxJ8Cc4uGV5AIh8oJuRIgjL2rEZ9P7ryWXQBNscSVKVglsvoJ3MFdg4ThSkAmZqKh917j4HCgLU+Nm6QR03P4vkMim38MdaDcc8trsgzoJe01tPwUHQhrwSj7xv3sxP8XpEe1qNPCAs7X1KkPCVA6p/mcSeQipSKDbEE0oyyjs6WxS2C2ovvIuHCGQxjElT1LmbgyR5TpscX8wzWOGRJwJ5vydoUXLOmJxZrXbDt0Db5dgFLuF2Ve3O/+rDfQsQZ9r57CfiaNJgAV4dKkb2YJc35lIkY7tXOWW3SSucFE/r75JdO0G+N9x7HFCsFYkQE1N+5lUghmjSQ48Gbix5B34cmXE1CFH5vUnADwDjd1iLBqTHFdV59mbU/JJlMwgIIN/NwgaZwdf+p4ynvJDVQTnG0eWHl/GoA7tvGU91Ql330d3TaghoyA3OFsJ9AXMjag6IkyHWqrk/VkovextXq0amckI1uoRKBm79tPrJTdXtuyTNC6QKBvG/cloZ4NQ2ejfLEBxhnyt0OYP/y6S6Q0KUSB0e74mo6peDi3VB4PP2Y0cLp48dY1egzCvlijuWt9ccVpbeBLgrwMxlatNnzYKyFC7YJFeyQhG6vDGnvXOcnvT2909b/AgiwlSw6StwdoZg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(7416014)(376014)(52116014)(366016)(11063799006)(10067099003)(56012099006)(18002099003)(22082099003)(38350700014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?CVYnCY0DMMqFdMyJRyaX3Jo5Pady8bmCS0L8QbEHYPgNvTH8EJ/k6Xvx5tRw?=
 =?us-ascii?Q?RTGnKutyrKyDsIJOp24uWeZH9M90yMbuGggSafSRGpXuuhkkeU3UXJsISZFl?=
 =?us-ascii?Q?XILbXriTt6DnKA7dZA0jhqCC7C1kqq94IlKPNneOM0wQ6YPf0KjqZjp60SPC?=
 =?us-ascii?Q?IOLyBNTLxNU0KfPfnkfEStv5Du0PtKl+VGiPOxJOFemigEhj4xgLBvPU3E9i?=
 =?us-ascii?Q?7k8fqU4Ajfo6bIQFMkRQAQ+poq20tbYIWrULjjJK5kMNgn5Od6lNpx/3fDUS?=
 =?us-ascii?Q?BIqZ8V3lc/XzhMF2BsBli4PcRTOuNekhl+rZc6lCbQ7xJbOuW+ZstKL5NtOE?=
 =?us-ascii?Q?kqr3lfydkqlXI/id4sfRHLv5OxJHxQW5oLyHLgAan4nEHE1uesZy1Rb2Rb18?=
 =?us-ascii?Q?3QV+yoCRC+Ticomzsu9ClHdvainAxUkwr4Uk+Bm3VJJUk3QItbGdQ7qJ8fa9?=
 =?us-ascii?Q?S14EvKE9eo2a4hxT0llXmyE1r+OgcWh27Cp+VfLNBY5dTNjAsekBQG9D4d0y?=
 =?us-ascii?Q?FY1MX4JgU7iSgxzK/2J20JNxqyw/AXJur5kVVSs43W4TqcoaLM+2wJN30tck?=
 =?us-ascii?Q?HFts4t5UCXDce4rTaufr/vTuRlBDRWsgWUiv/txPkWEmW6KqO3h2D9xDTo24?=
 =?us-ascii?Q?dqkg98etCl4Ff4abWNONEWINvSn2NelZ9OH02YRHFOTxfNIrp9qs+FzPANs1?=
 =?us-ascii?Q?LpaHUkYi0Pv0aw+9mMAZfEiS1NS//Yy3OJxXizaaVogzEz1uSL5fUTsuiZSU?=
 =?us-ascii?Q?c2nbr38Q/Yndy+EnQgBNOR39QU/e1uOw1DJvYVuwCM1ct3D41AsVh/fQeRPo?=
 =?us-ascii?Q?bN6SOQv4meUVlJqqL1SgzMSLNEUmrHqi+fNwBCiqcQXiExAlr6O4Mfe/hy+n?=
 =?us-ascii?Q?YefsrWPLtulQh+nMVMm7OufBfRUEBADSyjsO3Xv9p8Uw122Us/+IGRR1xS0j?=
 =?us-ascii?Q?1VuVGWLB2s4jv0FMxWdRtqIStA3u+8u5D/GZwltSE7Sv19/FXdIALou5/ewp?=
 =?us-ascii?Q?CCg18TMlz6n2X9lYdzq5A1PFbKREHK6HZPCcay6gnxAEyaH9mOvE1v2CavB7?=
 =?us-ascii?Q?YAKvuUXi4cKyjmnwZCuStB16FfkkidsR2eO/bzrxL5iTtNq5wFkc8+86ZstR?=
 =?us-ascii?Q?vaFHaNQ8P09oCnU2luI7tzNxWOIHQAHkbMGfHkfxV1sQ2S+XLPaJ5Y62QhGl?=
 =?us-ascii?Q?BfiZ+lQFS+nzeZq/RYmpL4p5OzVfSQI4Zb3XzCzRjuHmek4JIGBf8hJMiG/R?=
 =?us-ascii?Q?rDwHMmO5pIfOXlKC0Yg44hn65fQOnIbQlwzJj6MAjlPOq5k0DMmAxgA7uqBF?=
 =?us-ascii?Q?zEmwYR4sc3YLl4YNXT+vCAOmO54faFOfbnO3CUHtux4qEB2MpDGCaSTDkSAB?=
 =?us-ascii?Q?E3v/vecgpvnNlMzHQZ4cK1AH6KZ94em7PlvBF8KYKdaVo0C5ikXPGzuUMCbC?=
 =?us-ascii?Q?BkfAlzCMbZ/+jpBk8IpS56yFitboJXIP1QN61gMsPsWT45lM7iX/9ciHXC/S?=
 =?us-ascii?Q?1CU+kzLbkMAim/50y/n38QJWO4py03QxdLJx/w/AVdPZbq6bp9qrKmCyzxvB?=
 =?us-ascii?Q?WTb8N1wDQqz5+Yd6sSYAzL0WVqCxoVQarMYkPseOM0DgdIkx8bN+O2w+/GhH?=
 =?us-ascii?Q?ECJtltrFQjcEWCGka2OZBgFexQy1YHd7AwHrLNCnMfnfe6gtUaPSkgbE8EtE?=
 =?us-ascii?Q?gohUYlF0zD9/utYrLd9EuFNZpQjQlG2QWtV/CJfj65dGmiiEuowt8AR/1hES?=
 =?us-ascii?Q?p0a2aPTN6Xj+Wvqq5Z4Jj060yd37YWo=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d036852-c6e8-4064-0cd2-08deec06757b
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 17:42:41.9306
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kYXt2BwRs824pnp5xnVJQvYtFb3O1OQF6FS2qvwJ0cZHY9JSkmsaAgLIcT8VOl/7cK3jC0AwdmvBO5PU9X5LRKfnMTatco9U/wP6Rrg8UQ4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6111

Add support for olt pin function for olt pin group.

Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
---
 drivers/pinctrl/airoha/pinctrl-an7583.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/pinctrl/airoha/pinctrl-an7583.c b/drivers/pinctrl/airoha/pinctrl-an7583.c
index 7e94dcb3b61a5..74f93327d41a1 100644
--- a/drivers/pinctrl/airoha/pinctrl-an7583.c
+++ b/drivers/pinctrl/airoha/pinctrl-an7583.c
@@ -53,6 +53,7 @@
 #define I2C0_SCL_GPIO_MODE_MASK			BIT(15)
 #define GPIO_PARALLEL_NAND_MODE_MASK		BIT(14)
 #define GPIO_SGMII_MDIO_MODE_MASK		BIT(13)
+#define GPIO_OLT_MODE_MASK			BIT(12)
 #define SIPO_RCLK_MODE_MASK			BIT(11)
 #define GPIO_PCIE_RESET1_MASK			BIT(10)
 #define GPIO_PCIE_RESET0_MASK			BIT(9)
@@ -393,6 +394,7 @@ static struct pinctrl_pin_desc pinctrl_pins[] = {
 
 static const int pon_pins[] = { 15, 16, 17, 18, 19, 20 };
 static const int pon_alt_pins[] = { 36, 37, 38, 39, 40 };
+static const int olt_pins[] = { 36, 37, 38, 39, 40 };
 static const int pon_tod_1pps_pins[] = { 32 };
 static const int gsw_tod_1pps_pins[] = { 32 };
 static const int sipo_pins[] = { 34, 35 };
@@ -482,6 +484,7 @@ static const int pcie_reset1_pins[] = { 52 };
 static const struct pingroup pinctrl_groups[] = {
 	PINCTRL_PIN_GROUP("pon", pon),
 	PINCTRL_PIN_GROUP("pon_alt", pon_alt),
+	PINCTRL_PIN_GROUP("olt", olt),
 	PINCTRL_PIN_GROUP("pon_tod_1pps", pon_tod_1pps),
 	PINCTRL_PIN_GROUP("gsw_tod_1pps", gsw_tod_1pps),
 	PINCTRL_PIN_GROUP("sipo", sipo),
@@ -566,6 +569,7 @@ static const struct pingroup pinctrl_groups[] = {
 };
 
 static const char *const pon_groups[] = { "pon", "pon_alt" };
+static const char *const olt_groups[] = { "olt" };
 static const char *const tod_1pps_groups[] = {
 	"pon_tod_1pps", "gsw_tod_1pps"
 };
@@ -648,6 +652,19 @@ static const struct airoha_pinctrl_func_group pon_func_group[] = {
 	},
 };
 
+static const struct airoha_pinctrl_func_group olt_func_group[] = {
+	{
+		.name = "olt",
+		.regmap[0] = {
+			AIROHA_FUNC_MUX,
+			REG_GPIO_PON_MODE,
+			GPIO_OLT_MODE_MASK,
+			GPIO_OLT_MODE_MASK
+		},
+		.regmap_size = 1,
+	},
+};
+
 static const struct airoha_pinctrl_func_group tod_1pps_func_group[] = {
 	{
 		.name = "pon_tod_1pps",
@@ -1171,6 +1188,7 @@ static const struct airoha_pinctrl_func_group phy4_led1_func_group[] = {
 
 static const struct airoha_pinctrl_func pinctrl_funcs[] = {
 	PINCTRL_FUNC_DESC("pon", pon),
+	PINCTRL_FUNC_DESC("olt", olt),
 	PINCTRL_FUNC_DESC("tod_1pps", tod_1pps),
 	PINCTRL_FUNC_DESC("sipo", sipo),
 	PINCTRL_FUNC_DESC("mdio", mdio),
-- 
2.53.0

