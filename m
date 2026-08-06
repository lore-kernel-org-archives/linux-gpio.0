Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11023093.outbound.protection.outlook.com [40.107.159.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B02F3499F2E;
	Thu,  6 Aug 2026 22:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.93
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786054063; cv=fail; b=PCaq/r8bAJ1hLvXDTP49IRkk52PqKWEJfwJcGcyTmLdMhPILIFnYZKVfqGHP9V8C971s9VcHCwqu1TTBztakrxoN6hGDGCQH4ql9JcmQH+0oiBivpbZWHZIPe4E3XumtXzeD6Y1NAYDDse4zaP9dF2wJVSyEP7aqQZufvOsMEsk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786054063; c=relaxed/simple;
	bh=3bFWHbzXLIXFGJOtadv7RMfqBxWuJQm+bJOGo7hP2LE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=MK3znGlCrVyt7l2r5MKydl7ic/G0ulBb9UoHV/yL4SXkSQXSccqHWnykRb8CFBiRqOgnZMNikqfLFiOAwQ5Qf6VWQyG5vVHONB+Z5+Bgnm16EJ0MPEpKGOvqvUnf5ldAeyvvohwvQDQknlC1d9SuEFWM7nLpLLbiXayCBIKybQQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b=MQ9zYcUe; arc=fail smtp.client-ip=40.107.159.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=genexis.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b="MQ9zYcUe"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NPiHLkZb4rsnumbF0CDePMEaDoMySo7aRf5Q/Ztq/GvH82wSzXQeYenFcKUbc1csnNJUQ/NvUTOF+6vbdNU8CUbf+/bTgk+IEzqu4Tc9ZAVHTxhAlZyfuc4wlDN3QiyG4oZwVh8tHg0rMjGW3Oqcv6dQZ0pyNfJmxFHhpvo/BwO7QIS7E2f2vhmEfTRvdvV9h/5EzIMZ/Nv8dEwZVZ/SsmEhsYlbeep/o4ZwDm8+no+fxp8Fbo9MLkHLEaFh1NCwTF9TGRtpqKhv5WzfiOb3j/rGlCimJpysz9GkRc67Fa3SC+v1bM6OiJKMWCF8Ab2h02DRd1sXvhJoSabNWqq3rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9Z7RNLkxIT80k+IBX/KM1Vhl7f2kqCl+TGnvKdSYTGQ=;
 b=yVe/TVerQ4uP1VYqfv1MYf4c8+Dr6MXadoowWP17vSKfTfn27LkBGGRusTiFTFvHJaxyirmUR2njFp/8LFJ4DRdAe3BzFwymNXQKQhUknzxvftc1M9og+Kt09xdaotN6eCmzrBGv2dafGnF3m/lxPyM1mzNA8Kg2bvnf8/uaR+LLNfCjUzlzDc6nXFSvEEgT8WIZ4E62aoPn8os+7IjhGiStajopftGqu/R9mZAJinULeyuTGC10Cxy/OojKv+e2NX7Za/50ZRHZfd0/t6h7tbx7oyee1dB1fYqR26Vkk0WTkZezifxFmooaGMV03elE7mf7cTrHKWYaGgdIhC5hcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9Z7RNLkxIT80k+IBX/KM1Vhl7f2kqCl+TGnvKdSYTGQ=;
 b=MQ9zYcUeW8O9TdxOMIjr9bhQdAbzvjcwTu68d5qgD2qd59Yr+Zi6uHPQ0NdXQ7pa3D6wzClXncDGXzEPpA5SwcFaQB3e1oa9fp2GHCvnRRAaEwKE+W2/e4H9gSfggYfm8M410lq+g88pdijhvK68c6k3MbfegG28ydCeVu1yd5LqoDIirbbCXSYv+pXZ4wjkj3PXYFZiJUWVqkn87DMje+eqDveUwRCAd0JeTrWVd/9VIa3+dVVZPNqZkxkVJhQ8JzHxhJAM8m2wkmUJynJtHMw6BiIRCSJzbB28yMD77DqAd06q66ud2dSZt0RdX46zoAncW2L5b/wOlIuzK5ftYQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by GV2PR08MB9374.eurprd08.prod.outlook.com (2603:10a6:150:d0::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.19; Thu, 6 Aug
 2026 22:07:29 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0292.013; Thu, 6 Aug 2026
 22:07:29 +0000
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
Subject: [PATCH v11 35/37] pinctrl: airoha: try to find chip scu node by phandle first
Date: Fri,  7 Aug 2026 01:06:13 +0300
Message-ID: <20260806220615.4078303-36-mikhail.kshevetskiy@iopsys.eu>
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
X-MS-TrafficTypeDiagnostic: DU2PR08MB10037:EE_|GV2PR08MB9374:EE_
X-MS-Office365-Filtering-Correlation-Id: 146ace16-efbd-45b1-3942-08def4071b58
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|52116014|23010399003|366016|1800799024|921020|38350700014|10067099003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	Tt9FFjTmR5Pec1g7cHVUbnTv7ZfMDao9E50pRvi/8BuZttVpCN547c0sADw1wVVgNwc9s5bKJPVNzSLHIT8zota1IUQtlTtn0whWIS4e3quWMCQX0UfupEs5geN6BK9zs7MXzjvfAkB2udAKhDBxVSltjzDc9r2kTnG9rpNz/FviSg6ZxmvajmzzeohXovEleHbqI5w7rEzdLnmQDdSJOuAmfKOHNnZqjZlH1RuZVtlUy3golXAlxMa9aBFcvKXoxryDBIsPO9ERXlJtIne1rvDs2mo2iiK2tx/zAsR29G231LpSV9YONBenvkr6loFwo3d8Avo626tf3siX6gakpXQrQTLBFnHChD9XYjoAxWc+9cF2IImVtQcKG9nFyL7uWZv5xABS0+z+aFB4goKQxOM3RR5UofP28yzhXvera3d9HLUk5FEPnzeFNZaSjF5S0jyk/s6NZjQ3rEUaZWuaBBwkkI94VwWlDQ/TiE/z9EvnuqfkemrtffTWsfoJozteYK/Kv4JE8dZm6gvtSNRKhVoNlj36ReyXTevuLIIaBkR4LpCCIA3rHS8CkgNYC0B3Edg3JJ8mHCDnI2aCBeF18H2lJSRDhrvJ6ue/RPsNhnOa9ZTS2Drvtk0p0CEChqML1Bwuau+/+aYZx4pY3sAp3muyopNSbiSZKD/YiHaAezm6d2y9KvgYpGtvPYMMGFn1Wm7JlKoNXOvadgBq3tNlv2GeBS5Wal7i2HfnDZ21oRcCNg8UZViuDZbP/MZx6dUJ
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(23010399003)(366016)(1800799024)(921020)(38350700014)(10067099003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?VeM7yszozN5iszIEdCR+XeUxOdetrzF1m5iiEPaBsg7zOG7fL9j1SjwihQHt?=
 =?us-ascii?Q?SeC2ij6Ey80XPzLycjqbji/QCNDLXM3+pJ3csMnI2VQg1pcAEE7U/L9ZK07c?=
 =?us-ascii?Q?TvHnNeAX9mAI9aw2qYNxmcsINRiyFMc776Ihyqi1C651pk44/w6K3cdmOEb8?=
 =?us-ascii?Q?98ebYPTTDH90nPQBbTeUzYgu6ju+kiBPDJ8p/XtBSBvgrmgoGJv/BCJotdqM?=
 =?us-ascii?Q?PYHNj8K+9h9nCiPDTeedHrA7X4AC938BoxdUyxKeQAKicYwZL37Zz1jEZHI8?=
 =?us-ascii?Q?1HLqcSJozX1y2NjSULO39Y5RssCmnRMAuky0Ejzo78HAWnuuQDOL+NF13SwZ?=
 =?us-ascii?Q?mZkVmGILPZT9q5edliR7Nu1xOBOijsfC1bAEY6hPrKqd3DuBzyQR3z1DYjcc?=
 =?us-ascii?Q?RmLjumT8OwVNtUOk7uTF5WNO2OXBSZl/pusLbPSrN9j5QMyAnWEhxoMGyzAH?=
 =?us-ascii?Q?/KFaERaPyamSDDqgNCRZ5uiKWwg7RTpZmazelVVtQHxxzaSMtKKq6zIU4nNo?=
 =?us-ascii?Q?r6lJYdNf8kDqAZg67V+hyF8AOFnscaYFvd+OzoKr2eTVBx1/KhJgcMgPesUZ?=
 =?us-ascii?Q?dQMTzC/eMCYMlpwWXJVGYy3xccA4lySSF0jFbhZUQsDu6D+83F6jEw8UT8ve?=
 =?us-ascii?Q?8lWeiqFX6eoTyQLDJfoQ64Az1HHU8kuFLSiBgjQLp/1EG3Fn0J+pDy+vtB15?=
 =?us-ascii?Q?wAU+CFUz0PngDNZGOlOdUvNpgHliEmiWGmLqlKGzkRM8vmS2UiJ4sR7sKRVO?=
 =?us-ascii?Q?zU12Kg5Dha7rV0TFNXWIAuRbByODboMqacx3PeFT6e31foL3MZcdpdR48g8S?=
 =?us-ascii?Q?6IgGgtm8A3CS7Y/hq3TawyxrHJ06iA9j7k/N9pQqFvwes+s6ouyjEogAEYbA?=
 =?us-ascii?Q?QcUVxYIekk05ztDChPks2uVnJlxn9DANEb/mZjvk085vYW/DshZk2sm1bSnA?=
 =?us-ascii?Q?M6knmQ5BHClW1Ruv/xrLpIAcKmD8+AlAcu6pjxrdO6ZAcaK6msddvzXgLPv4?=
 =?us-ascii?Q?+UTqty4iVqeOXf2h9DMoECG+ZCbgPJWpu0Ero8amC56o4nIDE8ebS1HU1KAB?=
 =?us-ascii?Q?L3zlwElWzXm6kxubpCh8YlleFzhnHrpxMksy/rwbbEK2IYB2O92cmeNgxJcc?=
 =?us-ascii?Q?9VVsaWP9z+xCsQmGDriFxp8FEz3p0jsjvCVYjSMW1Kdqs/q9kf3stHI3Nq15?=
 =?us-ascii?Q?ZTWBDVB0vqcBQBUBWar5pjC77u6gS8UQo6bs8c0NN8kkCToK+fg3D4FaEfn5?=
 =?us-ascii?Q?g9xusyPZsQPyv9LtRlzmbCU28wRmBRzvOGSZhVDKesScIc65TRiQFo2BSsmK?=
 =?us-ascii?Q?p316K5SFVdbXNLrD9Zq94ecsftT8G6ThhBWI/kt7GcMvdgS0jlCag2rVKUNY?=
 =?us-ascii?Q?U2XWaDxN2Nq/e0hchXkjH3mb/PgN1LtJW3YrIlutaLU84QEkOoyFqzRxnFeU?=
 =?us-ascii?Q?uHDcDuhptBzvV/ChEBaSJ48up19hhyEMxqe8yHEqRYOTfho3i6oCwsBiPQ2t?=
 =?us-ascii?Q?TON5gdtQ0lhGZjVtTk6Fl8MYGeP/JMnFweQYBRFSffqlJJ+SFDK8hr7J76pP?=
 =?us-ascii?Q?/6W4O25SWgxtrLT55O0Xe8UwjxVdVQZ9lye6uCAfZPntYZmBmEYJCufImuJU?=
 =?us-ascii?Q?nwHV785SIYd1p5IrZ2nJSqcY2lUevHSmJFhoSXhLkCgZRY7QMrLGe1PHaVxY?=
 =?us-ascii?Q?I4CwjkFOnEXG3svqx3vDl25hPMgbMzwa43jrSKqAbWqz4FHRw4Dwk3lBvWt/?=
 =?us-ascii?Q?BvUrbNDRmrv6Uo40UGd0hDORi3pXd5E=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 146ace16-efbd-45b1-3942-08def4071b58
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2026 22:07:29.5311
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9hMmuPp1Akt8WxQl+2v4j0thG7RU/cB8bN19Y0v+Sr1ekZ9ZC8B72nTwO1j/LfHMMmBPiGehvAlQF8UXVqiKF55mScfppZ0Fk9Zl3h6aJ94=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB9374

The "airoha,en7581-chip-scu" is not a good compatible string in the en7523
case. Let's search chip scu regmap with "airoha,chip-scu" phangle first
and fallback to SoC specific chip scu compatible string on failure.

Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
---
 drivers/pinctrl/airoha/airoha-common.h  | 1 +
 drivers/pinctrl/airoha/pinctrl-airoha.c | 9 ++++++---
 drivers/pinctrl/airoha/pinctrl-an7581.c | 1 +
 drivers/pinctrl/airoha/pinctrl-an7583.c | 1 +
 drivers/pinctrl/airoha/pinctrl-en7523.c | 1 +
 5 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/airoha/airoha-common.h b/drivers/pinctrl/airoha/airoha-common.h
index e6b60c8f9fa73..c1acbfb7426e8 100644
--- a/drivers/pinctrl/airoha/airoha-common.h
+++ b/drivers/pinctrl/airoha/airoha-common.h
@@ -130,6 +130,7 @@ struct airoha_pinctrl {
 };
 
 struct airoha_pinctrl_match_data {
+	const char *chip_scu_compatible;
 	const char *pinctrl_name;
 	struct module *pinctrl_owner;
 	const struct pinctrl_pin_desc *pins;
diff --git a/drivers/pinctrl/airoha/pinctrl-airoha.c b/drivers/pinctrl/airoha/pinctrl-airoha.c
index e2de134624a78..d3f59c9fc1c47 100644
--- a/drivers/pinctrl/airoha/pinctrl-airoha.c
+++ b/drivers/pinctrl/airoha/pinctrl-airoha.c
@@ -790,9 +790,12 @@ int airoha_pinctrl_probe(struct platform_device *pdev)
 	if (IS_ERR(pinctrl->regmap))
 		return PTR_ERR(pinctrl->regmap);
 
-	map = syscon_regmap_lookup_by_compatible("airoha,en7581-chip-scu");
-	if (IS_ERR(map))
-		return PTR_ERR(map);
+	map = syscon_regmap_lookup_by_phandle(pdev->dev.of_node, "airoha,chip-scu");
+	if (IS_ERR_OR_NULL(map)) {
+		map = syscon_regmap_lookup_by_compatible(data->chip_scu_compatible);
+		if (IS_ERR(map))
+			return PTR_ERR(map);
+	}
 
 	pinctrl->chip_scu = map;
 
diff --git a/drivers/pinctrl/airoha/pinctrl-an7581.c b/drivers/pinctrl/airoha/pinctrl-an7581.c
index cd2a78382bc6a..2fcf88106e11d 100644
--- a/drivers/pinctrl/airoha/pinctrl-an7581.c
+++ b/drivers/pinctrl/airoha/pinctrl-an7581.c
@@ -1432,6 +1432,7 @@ static const struct airoha_pinctrl_conf pinctrl_pcie_rst_od_conf[] = {
 };
 
 static const struct airoha_pinctrl_match_data pinctrl_match_data = {
+	.chip_scu_compatible = "airoha,en7581-chip-scu",
 	.pinctrl_name = KBUILD_MODNAME,
 	.pinctrl_owner = THIS_MODULE,
 	.pins = pinctrl_pins,
diff --git a/drivers/pinctrl/airoha/pinctrl-an7583.c b/drivers/pinctrl/airoha/pinctrl-an7583.c
index 031a8b36e0024..2c3a75c35915c 100644
--- a/drivers/pinctrl/airoha/pinctrl-an7583.c
+++ b/drivers/pinctrl/airoha/pinctrl-an7583.c
@@ -1462,6 +1462,7 @@ static const struct airoha_pinctrl_conf pinctrl_pcie_rst_od_conf[] = {
 };
 
 static const struct airoha_pinctrl_match_data pinctrl_match_data = {
+	.chip_scu_compatible = "airoha,en7581-chip-scu",
 	.pinctrl_name = KBUILD_MODNAME,
 	.pinctrl_owner = THIS_MODULE,
 	.pins = pinctrl_pins,
diff --git a/drivers/pinctrl/airoha/pinctrl-en7523.c b/drivers/pinctrl/airoha/pinctrl-en7523.c
index 91490418e9ab1..5aa39bacf460c 100644
--- a/drivers/pinctrl/airoha/pinctrl-en7523.c
+++ b/drivers/pinctrl/airoha/pinctrl-en7523.c
@@ -1104,6 +1104,7 @@ static const struct airoha_pinctrl_conf pinctrl_drive_e4_conf[] = {
 };
 
 static const struct airoha_pinctrl_match_data pinctrl_match_data = {
+	.chip_scu_compatible = "airoha,en7523-chip-scu",
 	.pinctrl_name = KBUILD_MODNAME,
 	.pinctrl_owner = THIS_MODULE,
 	.pins = pinctrl_pins,
-- 
2.53.0

