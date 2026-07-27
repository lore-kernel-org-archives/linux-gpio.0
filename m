Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11021121.outbound.protection.outlook.com [52.101.70.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E62E43DEAC8;
	Mon, 27 Jul 2026 07:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.121
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785138185; cv=fail; b=GeDNZ5wT2Naypvl7vLsLbt4y4ANiFLWFhwL6/eIPMEZKFrkUBePRtdlOQOQohLlpjPoUGqmMa4nOisXDeqQ1BJV3uln07lIvWFu6GKYSaDG2tqviQet5uME+lpUDs2CCOeK+syCsTc0arQKd7+4+lwsKY7VZK9qjJ6P/eyb1VGk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785138185; c=relaxed/simple;
	bh=vvpy6zXlYD0mZcMtv/jGucWpG7EpnFJqapUaLAHZViU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=s3Gjxi1QbiMuDa/scnvAPRXpIdO13zfrVNgAjwDISdAMyFZhiIBhwx8gHPcinTXY4XEvR9d5JKmWP+bEW5WWM5wi4tG2OB/HdjapFxk5D4/gWtv6oZyUByc3SwAs5cNlWJ0qKwWmV3SlPpEVEgRBQEIQj5+5/hzA5FC2yp2vNTg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b=bHxGRL6l; arc=fail smtp.client-ip=52.101.70.121
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=genexis.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b="bHxGRL6l"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JrwscNEGZOhjpDIltmsPLfChIy+3GERFy/ClGu2q3OEGnuhMe6pjShS//cDvPYWaKM0VfeahIg6W2hg47pVrsRndrw2W6T5bXW4gKvIA/rCEPVB+NKrIfWT4F5PvMVsNIBJJBlmFBwBrTatmI1wSY8poVKYiGtT1T6G+4iVXJalW+ZX1FCwo9kcCwGNmLqIVRlSfMHHSpKegVr3v8ozn8E8OWea7eMmxNs2J0GgrJjMycll3rdsLS2MP/AumeARTu6su9rlokoCr1b4vX/Jk9j84wwOaTMdW7i9UhqBHmzcifqcpzL0paenz3lTVwNPagF79MOuh3YprxHSVJgkkKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GhSc28vcrU+4TeELSQEDh1oggYKGP8lORgwHjXQbjSA=;
 b=iHgYq86NqkA/eI1wLin3759QDRI+PLevJKNn+dUZxuN9fAwg2EaFgBigyqdTNTPqD/zj+qFOh18X/zQDEKg1xVA2y4VDe472YlcQhs6A6yzH7UIhseurjPvW0kF0TDPwumiH/AjZrVU/UHucBs4DI7Loz476YPgUht+wn82iAupH6xzAlGD1kDdmpJ7Hif5LPmBqjKdTwCRbfmkXSIZFjBiD/C8u4Sh4LVGuHbDuonsP4YoMeWAeII88knltsYmWFpYXOics2ShRRgidA0tme/58f9h51Gvg4BN+LXr+YEW4IzNK8qQGOP/Lb6uOvIJaqy7g+TjJpSuhy/xDZA9z8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GhSc28vcrU+4TeELSQEDh1oggYKGP8lORgwHjXQbjSA=;
 b=bHxGRL6lhGkC/+ZOJWiePx98cni/3aMNeBWkhXPCqqA2GqCdGsMJgGZoMi+cjyPReR5sbhvB/38fB3PJRpN+3TgtVutwwNH1NvwHsjqYgUPPwC61AQ8K+v15O8nQ3bxCkHle+7rJGdjsSSQ5M0qPqyJ/P8xHHfsXo7yqhVU6suFO8l2JN+qCiq7XkE9O0VPD6/6EYT9+b5ZBdC0Xgk1lbkbxvG+z3G6fSlDx+B5UqFN+MMuLVBVMnXc/jdQZqlrz8s52jX6cqUsTX65uewAHPn8jJXM+xQlqyExO1qLgUyTR8jmAXAM5KS0sOlNwZtcVMHPQw+M1OyQ8JNKedPhdDA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by PR3PR08MB5868.eurprd08.prod.outlook.com (2603:10a6:102:81::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Mon, 27 Jul
 2026 07:42:55 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0245.012; Mon, 27 Jul 2026
 07:42:55 +0000
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
Subject: [PATCH v7 06/34] pinctrl: airoha: an7583: there are no muxes to enable i2c buses
Date: Mon, 27 Jul 2026 10:42:06 +0300
Message-ID: <20260727074234.3761170-7-mikhail.kshevetskiy@iopsys.eu>
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
X-MS-Office365-Filtering-Correlation-Id: 69a385ce-8b52-4e4b-0da4-08deebb2abb9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|7416014|52116014|11063799006|56012099006|10067099003|18002099003|22082099003|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	xtmN6f27t+WRuIHY8cZWUeXklEqr38OIsyTB9fkbrXidQL/YzWjyEuW5b46vquxsEpKoerUbe17OE4kcOtH6aMAV7fAl8latU0Igo/LqTZ0UTl46Yls68ArmF3xgn68JPdrqsvWmZzUBPVdH7oSQtCaKe4pktd7EVniQcZmYYWs4C0fjXk7LG7YBx7qcaHdBNUiI9zlJY+gG4McLmz6VJ263ez/BJ8UfFd14roN4Ltz5WcxFzFR70pL6aMfAk87h4DW7Vv02ZyVqYF14giyhHiSVw5yQKzob/Z/TONacQ7ddrhSlCPianKtwY2sA3hxw9QyYgTyNXYNCceziS/XMmCFCBhefCMGQYjIWAHbTqX/3YsWvpVXBoFtCE3fTYkVCZCrW6NHXHX5nwEHdwPaNCOOq8F0hB84Blq5ipLaYbon6XBBSoOCZiOAgoZ25ZlbfFdbmKkJfmD2H5PpEoNnxYDaNWImjHZ4Fv6Gd5RLjJjXwrkNKjwBZhLBxOPKfF8PsJ6E8p5XSpo7psDvaIGlcq0kwlZ5wy6q01HhGki2DgSmrZw4TVq/FZKOBcoPqvMRW04gYYduUUFcZEwhiOCpD9QgWlqRGiKu6Y3XOmjVy1SDNt9Pvyy1XHpsgLQkbBJfBmWNbSkXQ1gzrwEBnjdAx7HiLvNVqv7FC7UefNvm9/WB9FtLOyN23NdU5uUqLXyNxDHeXvEcIZ6TFwgU0RRJB0XRfsA5qhOowgAucxvKIHR8KjodDKuvAlGC7GkYh/TJN
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(7416014)(52116014)(11063799006)(56012099006)(10067099003)(18002099003)(22082099003)(38350700014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?w0R6q/NgOfj68+JigQeBkbOENMcHCXYljvnjWTj/AJrzBl/xtw0fzEIHFnhH?=
 =?us-ascii?Q?epGOLSgiWDBbmlkCYzOOKDs+a5GyZlXnQOfKkQyFJLLLZgvdWNKdviaxwhuD?=
 =?us-ascii?Q?9FgRdSDj1s1wfiK12eDGZbohSNoihYyvNCuWVjP0/eroGeZjpp98MjOdGz/7?=
 =?us-ascii?Q?gNT9Jw+NhnajWxvnHvhtcvjLMKXcOigGt9jGgvjJxENZj/L5a/QX6gnFOLKR?=
 =?us-ascii?Q?wZ3AOtH6HBkc5p0coDxuxAN846p6eTJ9vsdsxubNjQabfebgg67MDwAdjZgC?=
 =?us-ascii?Q?aHwsSPHD3BvED3tooyx1kzzjCvJDwmn2hWMT+IATAcP1KBHADlW3E7yJAVq1?=
 =?us-ascii?Q?z1X1PUWzA/7y04q/irbwVz7SIQA/NA2OfYfAMcARFiyz6N8Jp6/ZcbD8GLJS?=
 =?us-ascii?Q?dhQIJIZjWGoVkrN0cqxVKx8uqo3V0HANlgFroQbHLqo8K1knmZV+DGW4+/HR?=
 =?us-ascii?Q?GnwDCoi53RcK5rWeaePZMGt1s6OImRHBMnADu8JD4cOjbqVqnq2nuo3ujVl9?=
 =?us-ascii?Q?/hZjrSP8+kSKiRGMSLO5epH1K6DoxMt+FAIlXD6RWp9CuiX3itBtD5FV6JYd?=
 =?us-ascii?Q?YZGQ6UENV3xq/3jWRavLiD1Hzr6PtICwdcqWEAoyDEPYCfvEixdnJqStt7Eh?=
 =?us-ascii?Q?/cD7jM6szpmBtv+QgBWYySqCNZ+Xr2xcb9hRWnV99ZY6Bq+G/SaOu6rB9Hmi?=
 =?us-ascii?Q?d3po4K99wjCYEv8t9gonavuebEoo3VfHLFc/d4L3nIlTqxxt/P5g4vDC6lnG?=
 =?us-ascii?Q?UN5Go4pX0xg69qbVMc+y0tRVu4wlLCgw95tweZijYIBOrHjhc8jZ2NkvAHXk?=
 =?us-ascii?Q?qKNhPHBxNwW8zdQeTkR9jwf93/9dFGXCZZd9o334uEjgvadStA81IAKT6mxL?=
 =?us-ascii?Q?xomHzhsp0Lfdte7EKFPHz+DXREqqqF8kYZjovm+vykJRjDTl9M6aJpRq9tfh?=
 =?us-ascii?Q?hgm3n5AWrzdwnAyHY9BAxNNj8/FMAFlt8Rctfm7jJF99YqJfF0w4PBBIqa4A?=
 =?us-ascii?Q?TSdMAT9/00gnb3QxcmnfC8kC28WrsaoJgNwgfgtkz7pAvTEsWrhQNwEfg94T?=
 =?us-ascii?Q?bhXaSUZgUmkDyZHsOuUkyh3y03bpvuT4+breOZ0aA7StbfubeelrWce5W8B7?=
 =?us-ascii?Q?OA5UoXnzRWIMTHVKIxhTP1WT4dE3JoCXX8a+5ZFenTpPKXxygqlNTbbEA8VD?=
 =?us-ascii?Q?rQT2IAzFUjKwMN4g+nCIkoC0/8LD0HNL7icLhNe36XpmeSOTB7tVlb+6zR/5?=
 =?us-ascii?Q?iteCTC/sBhD7WDfmYuDwREJsZkMyAgvGZulySPi5zQ4WsJhf9m9dSuB6Jpi+?=
 =?us-ascii?Q?PGiwGJVQC7nYH8nMYKw5OKOoWC1R9w9cVVPKlEME0D18hAuey2HolBGwA9gS?=
 =?us-ascii?Q?ANQ/qimSS+w2snNoP/OxwbPE1JZ3HdeyGHX1HcJPK/3dBbzuhva/dNFDbKml?=
 =?us-ascii?Q?8iNukRdt5tLj3ZYsYYhi6P3NH3hrSpOVEsycLqY9vPrIHwxF5QXo0VfTjZxC?=
 =?us-ascii?Q?Fgw2pI3FrrhaKi4FDODwLQ2fNfFjDHtgQsxgJK1C55/TI8aDtKyePbyOTmgy?=
 =?us-ascii?Q?7I8/qs882RpCDDoEKDzlc7iToncuqH52aYWDHyVl33AsZzVh6IH02IpTFyzc?=
 =?us-ascii?Q?W/dycroJfPYXERcsrvFnE0kiO32hXyMM+AFuYcUFiFasL8QpM1RMTdbvkunV?=
 =?us-ascii?Q?47pTbj46jbE//GTRjL0fmlpZ4K2PNaxLeJXxj9zM9ki5OiqOMd6Xr632ugrK?=
 =?us-ascii?Q?faOQltA6j0XqASGgQK6hr6XxNy3/5A0=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 69a385ce-8b52-4e4b-0da4-08deebb2abb9
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 07:42:55.2731
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E4+sNQVDdMoOBP0rjwoW/ZUsxRlFua+n5EtgzU9xzUojtDKZQfeQAkRbJDcFxLpJdYkI+SlRFSNoYPYmEkSyO3uAgj6/xQq/p/QYFd92CCQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5868

In the AN7583 case there are no mux bits to enable i2c buses, so i2c pin
function is not necessary.

Fixes: 3ffeb17a9a27 ("pinctrl: airoha: add support for Airoha AN7583 PINs")
Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
---
 drivers/pinctrl/airoha/pinctrl-airoha.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/pinctrl/airoha/pinctrl-airoha.c b/drivers/pinctrl/airoha/pinctrl-airoha.c
index b5cd4f476caea..caa1afcc1697f 100644
--- a/drivers/pinctrl/airoha/pinctrl-airoha.c
+++ b/drivers/pinctrl/airoha/pinctrl-airoha.c
@@ -1821,7 +1821,6 @@ static const struct airoha_pinctrl_func an7583_pinctrl_funcs[] = {
 	PINCTRL_FUNC_DESC("sipo", sipo),
 	PINCTRL_FUNC_DESC("mdio", an7583_mdio),
 	PINCTRL_FUNC_DESC("uart", uart),
-	PINCTRL_FUNC_DESC("i2c", i2c),
 	PINCTRL_FUNC_DESC("jtag", jtag),
 	PINCTRL_FUNC_DESC("pcm", pcm),
 	PINCTRL_FUNC_DESC("spi", spi),
-- 
2.53.0

