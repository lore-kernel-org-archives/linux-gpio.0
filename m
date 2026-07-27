Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11020118.outbound.protection.outlook.com [52.101.69.118])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65679438498;
	Mon, 27 Jul 2026 17:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.118
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785174207; cv=fail; b=DjEfMQheHv4R9QqAIGnalJsKx76J0OAJSAMJuysKHfjkOvBRmR0F13Fm600bLMRSI94tdCWDS0jPEygcKAJCL3NS6PlUM35bdvsbyr4tD/BHlbTVURH7DNMyS/GpSHC6mPvbI1wEbylKq9CgiT/QhQlPoc/MXn5R9qHMhyujv14=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785174207; c=relaxed/simple;
	bh=0nUcWFFyZRnuvRUkaqL/J2R0TIYFDuqbc954gDE+ncM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Rp63hSFg36aIy2Nydd98HyCpqx5QZcus5KLkZZC+YC2zBBDbxMO4TsnyEXLp/98qahdVI82mO4w4ui3ddpzh2hjrgpizVrk7JftXfSoAHFujMuEx3C/tMyEnNA2nKvkvBe9SzjKsamuTIp+hfRaTSJu7tfrhSYqxlP9yzz9GIsA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b=Dm9FlKCi; arc=fail smtp.client-ip=52.101.69.118
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=genexis.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b="Dm9FlKCi"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JubFBQ9eJdB4AcOfhRM4DYJuQn6wX39Goa+St+qYO1STgl7EFsoyN6y3y/juegJKOLJovhzH0aovI7pn/cLTeRO5BXjeJJxl62dKge4xrijnMG3ghLnYqgkmlo+fOvy/PVHhC3XqFNuR0OhOu67nExFjxerWgy5wfyzBRnOUiXH6yszl/9qCWtVF88O/eWtrp3Yw0gnNKKvzeON2RLGfzsjT0IMmZNISme9Y2hm0OWQxQd0tUr3fNmzkAqCXLcC0dIdZABbbKBlBY3HFgRDpSSae2CZiRRw1Kr+O8QT7GvRU4eBWK6ehpHuIRbj4iSsnlq3MHeLi/rz02Y9iXvaeOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IgxH3ZGIUp5bPzzvI5h+pMSMfF2jtqY7D70baLiunFU=;
 b=fN304cYevn/tZkKH8ALnuqUBKiH7BKSAgiLRvCePsG9e4YcdBPWKWDOhQVfCwDdFAaKt9Qld/j1UTeil28fy8+3NlkbUxFhh7BqPHrXZ7ZzEzw0bqsI65clcB1HjO7rbtEkF0CwDMt6g9jqFqnq72TpQeZf9pBJH8GlNY4LtV48h3qzpqldCJORBxcNBkymVfHTukBEZv6cm7g0hU3e5ivddoKIWtNiuLPkw4oWbaBfstUvPyqw7QLMeisXH57JZUCzMgjG8YvVtNTqRAWUOFPjkt4Xkg66k1Byrd7L//31kEN9/pOXy62k+qQO8nxzcX+8u9ypjbgxtBKVpCH8K/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IgxH3ZGIUp5bPzzvI5h+pMSMfF2jtqY7D70baLiunFU=;
 b=Dm9FlKCi677jC3h6YPYXmh9OkchkdaUX/eOsdBLN/jU4p0E9JZ24ClZ4g4t7d/iK9e/GUPDZJB7xqreAeCFE7wsBVtdpKMVbi/Cl835bIWGwp+ynqsxILPSOew0a04O+klSmSE7S97kYOVmPoVmeBnucg1eu7p3O2+iRY+Xs+kntZZ9DW8tP87XFdnO6/RotCetdiFcH0xbbG818y3fas3NWOt6SurHaN+HlVKHFkLczrkKNexOQOq60CP2fCQTmr25piqAT4Nv4aAXLJAYFCg5M/K6r9uZzfLiqWj93hz+R5xIZ7U4xSrrk+ajZBKlPqQyIWdVaUk8YxTbuexuV7w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by PA4PR08MB6111.eurprd08.prod.outlook.com (2603:10a6:102:e3::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.12; Mon, 27 Jul
 2026 17:43:14 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0245.012; Mon, 27 Jul 2026
 17:43:14 +0000
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
Subject: [PATCH v8 32/35] pinctrl: airoha: try to find chip scu node by phandle first
Date: Mon, 27 Jul 2026 20:41:38 +0300
Message-ID: <20260727174141.664933-33-mikhail.kshevetskiy@iopsys.eu>
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
X-MS-Office365-Filtering-Correlation-Id: 738b3b76-f31b-4e89-9473-08deec06786b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|7416014|376014|52116014|366016|11063799006|10067099003|56012099006|18002099003|22082099003|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	WE7Jwcen8HDhleGGyzfiiS5I+pN7qNvEKD/GzB5JrsngVH51h/o6KIos+KjZUKL0TCLBldv5bGNum3YMadUzPbBIHEmjpWtvEgQNEjlYBjsp+bDFa7Bg+pSQ72AEvp3y0jrJVcui1R8Eex7wH9jNSb2TcBjP9sMsRmJaevh7tlxwCahiiptU1TJUUBGs/aRLD6BwK5okyuVM/1HCRlAD4x7//VOXVKmJ2UYC436yjZIBJukSTbj+4mdZbWmga+SSKqgMlbML2NfC4VQ0vMIF/jw5+Q6bGNRhU3gaiIq+V4OVlZFqeQx/YRmUdntBDpVjogCzQNo7LHx1rrWJw2tZRejdrzPmz06ijsQCQb0R7TJsPlrJjh7FXbjhlP0QF7+ml3bPbRELSxRIW5N8UL8qmHZ1mp/pLHr0rzKK3iWqlQ2BMSZwEUS+yhcRRwU3y0gFnT0SbtuWfxiyboIsp4lvpvrnAKWoRFoU9ndN33MVCmv4WlNYts3iH/bCuDjuMiRFH/JMGqKI3FoshE6YrGDXsGq2z+VyuQ+H2X545rL794mnTWr5vF/nUDRyjrS2oIlzt652Tw97udzqXi+wWROGoP0u7Qp1Idm6LsJMUQ/gMJC7W0l2yw1KmUvFTSDxvebsk3BuDKs5LRtqP+fP+x9uQzd0D7S9Ax0uzwKvBSRTOP3VN97QPgwyNd1PAwU/5aBfUS7WDYkOcLC7qfORebnvck/0d7TEzuKuiEvTg9SABfsiIQrXZOReexD20cro4wlW
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(7416014)(376014)(52116014)(366016)(11063799006)(10067099003)(56012099006)(18002099003)(22082099003)(38350700014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?t5GKzFEHko+jHgt4y+Ab+qQgecCC+VGgM8YgsVZBhcc0S28rGyUO+5q83b2a?=
 =?us-ascii?Q?8UfM77RZBiIBjyfycRJdno6E2cg4HVoaPPrw9NthEgMFfB24VtBr4HVCClP9?=
 =?us-ascii?Q?40YU47OqxobmyGnliYzJdZ/GQQvVK7xsoWTcrXtBolYa7fWOAGY/O8xaT7oK?=
 =?us-ascii?Q?6sgHWL+D4l7JOxW9QFZ/LJsIELTsESIIF8To0YAibj88Il6WL4/xdXxLkxLb?=
 =?us-ascii?Q?FCR3awiIS7r+yr3bzpl2R1joDwNM1cvm2Y4o5V6U/B9rHQ5962L8t9fBDlN1?=
 =?us-ascii?Q?CfJRY9WokX3KmUGzPdhhk6SODZhKVHor+KXDZkJi0ccyBqUQ+3mTEuEQHrbO?=
 =?us-ascii?Q?Omp8PBA66742dCvyxtROr0PzJN2S7tijRJGhUE3AuB99kANQUmLPyvwn1x2O?=
 =?us-ascii?Q?cNtBqOaO4+7dZ09QSZ6tEqhkjNTPVH1+PoRqGpdX33ck7IReEKpd/sm7Mhto?=
 =?us-ascii?Q?/TPvolulDUUztEHjg/JArRpdMLf/qLSYmU3lYwCqdQCaSZS+pJjAkjDVdMRO?=
 =?us-ascii?Q?rj1DgjnKGFPRH8BI12sW+bz9M6GKJEfuQAZlTK/lNeK8BfdMPgLu/YPu+Qh4?=
 =?us-ascii?Q?FQ8AkgJZkQzLnxQTHLOvKyz9I7lEG2QCShahUdZ85eV/+5aiGVhu7etDzyvH?=
 =?us-ascii?Q?qkzhljkpuRNA0dEs4lurxh8JzVqngEwDvwCMuH5kEeWsTe7c4tZw3krsgAD7?=
 =?us-ascii?Q?qT9k7i1NlFFd3RstzEUieO+p76+uWZPBpfRFPQ8mE+Tut224wq/xSMYrkDRP?=
 =?us-ascii?Q?eNJTbNj+WYGNYDnL/hgSsc/2SYdaC2T3fHYEUGdwaeZAPiUOcYdiw2XLIA2P?=
 =?us-ascii?Q?EaR3pLMcP70ZdFSurEZGXqSCPDdLoqgXWoh3XXLfQwARunjaeL4lw8Oxv3UJ?=
 =?us-ascii?Q?UYO8tbiAHT8Ff3pytCCsudy4kxbxct3JfSO+rJ1e0IRnHjO3Ab9H3+z1ZoT6?=
 =?us-ascii?Q?0NNCViX2xQ/ORN1JGkhuFQMekwm995vliEMO2MQglyu/UoVlB7ySw4VmHVJi?=
 =?us-ascii?Q?0uYJ2tvKDFfwiT99LoEztndAotE6GMiJGUUeKSgExrfFQUla2KFCUqjt+aFo?=
 =?us-ascii?Q?PyrqcASi/kS2QOyItLAm0BALpZvcLu/a9+4XMEVzF4GyKrJrf7GEarFqFjVm?=
 =?us-ascii?Q?2+4FNGXoTyYgBY+VneQ2Xky3wxSewPTMQPPAA9xpIQG0XBG7TPUaC0KAAYin?=
 =?us-ascii?Q?2u27ZlAoVJvzHkGUrPmd5ttd9RRA83keo28bHsg2a1dDJOg6Qx/VZCVpe+Wp?=
 =?us-ascii?Q?dW4t2MOSa94HBoBf5l8Pyt2iI4kMX//RQy9nqTulLv1ca+gMc/RcDAjz290Z?=
 =?us-ascii?Q?M056YEG8J1M4a4tMppPX9NXR0ed9TbEdJKNsxloP5GgS9sCBrM6Cpxs5z+at?=
 =?us-ascii?Q?nX/mH4f9qwcXE0EcTKDcw6oX3r8ckjZvpz8FZBNAxBKBD++VC149rWYQHJJy?=
 =?us-ascii?Q?cOe+O1XjLBLI4YhKbVKM1u0Okf12nvT82FfyshyTn0PGrNMztfPY+JXTP/Vx?=
 =?us-ascii?Q?BkWI5jaSVTFEwfkAS8u474AQGAmMjMswRgP64UPVhoy2mhNxklteORmuqvSF?=
 =?us-ascii?Q?z0EZU5KXC2nbtg400tkIkzV773fWwibWvrcvn1riwuNbXnHTYgwrrGPG5tvo?=
 =?us-ascii?Q?DRGkbg/5a1VzInFQ35Ga9M3tGTTjL4+S08ZYQwAlUpgDk/cnPkHcWriM5r2p?=
 =?us-ascii?Q?6xO6sZkqsAMhuITN6f8rfMRTyqwzYLNFrygVDWK3baA42dY3ANDymm7ygyiI?=
 =?us-ascii?Q?rAT0bq6KZ1RtnLRzcl2GYr7uF/3QF/E=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 738b3b76-f31b-4e89-9473-08deec06786b
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 17:42:46.9088
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DsQqZV67HSTbM4hpuksnJOXELSjWTbZaDTF5PceQ35jBBGM2AbK6QPD/B1Zd74fWytrwAAqlpNqvuOmtY5KXKu0crwOVLZ8eH5pe7OIOqkA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6111

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
index cfa6603aee33a..3e48de9d7e275 100644
--- a/drivers/pinctrl/airoha/airoha-common.h
+++ b/drivers/pinctrl/airoha/airoha-common.h
@@ -132,6 +132,7 @@ struct airoha_pinctrl {
 };
 
 struct airoha_pinctrl_match_data {
+	const char *chip_scu_compatible;
 	const char *pinctrl_name;
 	struct module *pinctrl_owner;
 	const struct pinctrl_pin_desc *pins;
diff --git a/drivers/pinctrl/airoha/pinctrl-airoha.c b/drivers/pinctrl/airoha/pinctrl-airoha.c
index 35caa7843a8f5..18fee3f84b047 100644
--- a/drivers/pinctrl/airoha/pinctrl-airoha.c
+++ b/drivers/pinctrl/airoha/pinctrl-airoha.c
@@ -760,9 +760,12 @@ int airoha_pinctrl_probe(struct platform_device *pdev)
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
index 5056ad5138fe7..6a202b25355fa 100644
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
index 74f93327d41a1..6d3ef32acf627 100644
--- a/drivers/pinctrl/airoha/pinctrl-an7583.c
+++ b/drivers/pinctrl/airoha/pinctrl-an7583.c
@@ -1442,6 +1442,7 @@ static const struct airoha_pinctrl_conf pinctrl_pcie_rst_od_conf[] = {
 };
 
 static const struct airoha_pinctrl_match_data pinctrl_match_data = {
+	.chip_scu_compatible = "airoha,en7581-chip-scu",
 	.pinctrl_name = KBUILD_MODNAME,
 	.pinctrl_owner = THIS_MODULE,
 	.pins = pinctrl_pins,
diff --git a/drivers/pinctrl/airoha/pinctrl-en7523.c b/drivers/pinctrl/airoha/pinctrl-en7523.c
index 7f434c9bce923..a6202f6313d5b 100644
--- a/drivers/pinctrl/airoha/pinctrl-en7523.c
+++ b/drivers/pinctrl/airoha/pinctrl-en7523.c
@@ -1072,6 +1072,7 @@ static const struct airoha_pinctrl_conf pinctrl_drive_e4_conf[] = {
 };
 
 static const struct airoha_pinctrl_match_data pinctrl_match_data = {
+	.chip_scu_compatible = "airoha,en7523-chip-scu",
 	.pinctrl_name = KBUILD_MODNAME,
 	.pinctrl_owner = THIS_MODULE,
 	.pins = pinctrl_pins,
-- 
2.53.0

