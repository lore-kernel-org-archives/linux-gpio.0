Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11020142.outbound.protection.outlook.com [52.101.84.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E69BF3F327A;
	Mon, 27 Jul 2026 07:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.142
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785138234; cv=fail; b=Qh5We6tosRKFkpH7cT065mmD8ZcC5DIcJBmzMj6ScfYxaPSJ2Nb3s+S7um14nZM/CypGm7Kk9g/rf3HGKZp9aZp+iNHd16vnjvggPgjf0KY8qYCYjhlQmB9lfrm+/yyRWUqLHlXl+pSVrcsShXp1Lfw3erRQ4JqJCPOhDKuUBAw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785138234; c=relaxed/simple;
	bh=f5CCflsynk/XY3wOoQYk/SQjNIk1GpRRC7HkDGtB0R4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=lSfjRks5XchEwv+WSQAaW/sofESQrkYRsjVl4Kp1nRZz9A8lYD5zpR9m6lWK+/NxdXgvccDXZsttUkny8mqdB4hEoDUFST0xoih3Jj2+DRuPRXO+D0EH/82KBdHxB77ZKQDYVL1bwGmttLJtx6Y03dnSEjP64DDgMc+2R4NM3vQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b=33fIhBdv; arc=fail smtp.client-ip=52.101.84.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=genexis.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b="33fIhBdv"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wrhjMRadRcdSppHOxT64MfR4mmumTDvMNYGT3T1YoF7pOvuaW6uqoYPXEUDrqaJChj42onxI57PQsXGqiB7Xv6t1pA+qOQmjb/JLQalwn8cSrDSWfy3mE5H2rgwfk71qfu9GEiAgcINgLrknJvRdR/Fq/RKX641KIX46iAx3H0THmyZXmM8VyjgGurKKeC6pyAiu3sXxcVCBMb1RAuk9UOaSoFJTm/AOwgmsii0aHR9frO5MkhnnYQ3B21aBrnlAyWF+LRVS0rld25n+rx+I0W0iFH8wGyn6g+8t1elHL6AFjSZ2csvtHGmI73Jed1hP3ozsT3f5SaUTtSRW8k7vUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+Gw6mevuNl3bV/E+u9UjppVXamcJao+i+q266nYDQG4=;
 b=kBBJNin4/YlAE7whIKNbLOn4PfCSStw7KeUniGeqC0z+VOTZQa7ydmWRbLOwRAqLecRAugmOtKfKZNrucAl/NXcJ+BbkfD5iRL4GUPZFBeZhdRMkvPnsnwlZDjau8McOZRmueoU9CUcwd+FXL17TpNxDUfsRZL8impDrIWQge0sgIdwxbtuDqtZlsByhEhyceuwSjreq2x4MKeTv86w00EYh5sZ9VMi8zSJ0Vm9ZiqO3k6aZVwX3wSgO0FGIua3N0DN6WdlxJjdFSukaS9Xm5F7bwcApHbR7TVoL6fQeqWHAbLmsw+th+VPML/MH0bUoEmK26vBNYLSuKITK8a7VIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+Gw6mevuNl3bV/E+u9UjppVXamcJao+i+q266nYDQG4=;
 b=33fIhBdvtVR9s7xxLp/oE7OU9j9Z1oyBeXtkBHuPLrCMj/rIr6Q9zYdxOaWvhq0a+IZNQ3L5DMxQ1P6SMmNN0lxuhg600dAfQGqal0a1mu5dMHbgB9yvFuuC/7j8S3xGvjutvD9KFzlc/YUYaEZrNqqk9uIBI6VgOqndI7rAUZfufuP6eSR5m4dgeNz3W8AnLL/KeARmmMZn2QCwC4y6F3q0uJtt4hL0tKz2Pdmox3y8YliW7/60QTGlPUuzO7/heSFvMmo8JzYdqXLgEGy5w01ZJC8eS1dfEoaHw17kQJF40YZS70m1WJjmdbf3UZ5Gf3yE8a1YimCArQvMM+nOdA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by FRZPR08MB11139.eurprd08.prod.outlook.com (2603:10a6:d10:13b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Mon, 27 Jul
 2026 07:43:47 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0245.012; Mon, 27 Jul 2026
 07:43:47 +0000
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
Subject: [PATCH v7 31/34] pinctrl: airoha: try to find chip scu node by phandle first
Date: Mon, 27 Jul 2026 10:42:31 +0300
Message-ID: <20260727074234.3761170-32-mikhail.kshevetskiy@iopsys.eu>
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
X-MS-Office365-Filtering-Correlation-Id: b6c50c9e-76e4-4a51-bd01-08deebb2ca89
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|52116014|366016|376014|7416014|11063799006|56012099006|10067099003|22082099003|18002099003|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	fNl2MnG5J7LFetD4+cuQKWTBYz1f55XU9bJNB5CjbX9UVdZdbMneZ6D28a53CYfY4jYmZ30B3pEFRckogUVtv72V4BV54qhUAGw3hDek/L48iKPsl6gx3ddbWm/Bw/gHBcip+JfFqxpxzbJfkfEoTxu1PpF80iVrge0QuALBjuzHRXBJsNQZReY4CsK03Tt1+ewsx6nO/YJaPUCcl3S78XkXo3Epl2jcqvOKWqpcdBAVIAuKbTN2LlcVzNG0cs691shnrRtNtu5FbgDpdpXEpOuVnT0zx3ZOn9ap+reoHU1UWgl58Ay6XiJDCTCJ4Anoyyvia842hbpwtKdIRPsu+GUve7vbM4WHmfpTNnlyZqGSuqp//qg+/oHWOzmWemWROkGlLi9qYT45TRtZYKTAPmsT8uUyXrD0vSVmsHy5dJDbw+eYrwHfZvvMr/v622uNnfxTcOnA2nkG4Q8T+WayTFH484p/I/GWIaRdPTz9ySG/D2uSLT+nfnbIJ+j7pPv3hhgFv2j/ikhFXlM6eGcOgP/neiv2GlKMFt1rvv1Xc+xLrK7EDPEpuyCX65L9d7vAWhqLOkrO93Ru3TZHdl+H0lWp7e9/B7/WfaaBY1Z84y3Z0IebyS3hRJGKEABAKHVxqs/NU54k2SIpG700mhn8DLVAKgfzm81/w9HdRNrIEdSf2CJJYi+NXMt20IVFnJR2qmcHGFJOipNupWQHf2bvC+pHOdPFEi6ZK+HGVQsAC2Qzkr97IQtD5lhbExfpQX+P
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(52116014)(366016)(376014)(7416014)(11063799006)(56012099006)(10067099003)(22082099003)(18002099003)(38350700014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?HUkb2cqsn6Po2xMcQ3w2yDsBd5qmwSgBpOyocqnL52hyoIjmUhViKApHsVdw?=
 =?us-ascii?Q?j1icZmeF6XbE7rSDop/w4bEKuKQuZWrJwSf6r4nX/RkI9wY0P89BhNeVNLCI?=
 =?us-ascii?Q?Kl9x9f//6B1Cx67s0KV4IMqMbcGM97hEK2kDFdoRLM/iNmgkGYNxEkcKzf8s?=
 =?us-ascii?Q?Y3SkPngNn04eSdvrpELdZuxEnxiVwhaFXgcNOAMrJc+KYC5HA+kXeoO8MmN9?=
 =?us-ascii?Q?IYkeuOFZQphrXuehXvX/sCcBGM3hmPVwgAeybvlRaRLYyPAEEjNz1f0E7N0n?=
 =?us-ascii?Q?YTj54ybIW8Fhoy/T9W3ySEl0fXqB5ZWgjsMQLNSmm4BfK/3BIljXqjt94jzH?=
 =?us-ascii?Q?zcWFWafMLe4zhthEFkvoeb19+X/FHUYNa7xoXq+0NmM3X0LIJSN9TV1F0ihT?=
 =?us-ascii?Q?ehQmwZNs34TYKSQUicKkgibU5XlRGDMYDNjFWpFRC+C+GNx0GA7ruiB+vabR?=
 =?us-ascii?Q?uQrfKAoG4Mlru/DXh52XA1NGsvcqKM2SUHjBSTk/P5maEREbNe45uW71Kotb?=
 =?us-ascii?Q?MNvHRd3/uotzJLgkkrpdZo27Qaq+Ujer9v4IhaceIILl6wi8nAWFhP8+tPI2?=
 =?us-ascii?Q?RUG+oB7Rz6dVf2BJAnv6hc4PSyUpkzfA1w+ruyCMO/qN2CKr8fTcRK6LK5Vv?=
 =?us-ascii?Q?3A8G8yesdTDGRCERE40KAR/LlmKIcVSId/fRRLwMHTwDgAavdkeLbzogDTxi?=
 =?us-ascii?Q?jlzHXtQSxHlkmj6opehnTixTd0g3VyCoO3dLXHEtAt4k8eRBU3thwYWHv1So?=
 =?us-ascii?Q?jjSt5cfoPtH6ZHTbYWDksZs23qobBuhD5yLDBueanBaqVe/S381EYTElyBZi?=
 =?us-ascii?Q?utPm7L4zFa0cuCIN+hjl1Wre2gp4Cfs1a9c/MYDP8OY51Q0LZOXpH8X98oa7?=
 =?us-ascii?Q?k5K1+dlb9iiIhV1WowtFGY7WBJzESuJw+kLo+/wQDH3Nn7yCwNyN3csR3IjQ?=
 =?us-ascii?Q?K+l9YQlbOgWu3v3WAdtSs/iqDAvLpHYxw9gTYDQb4YU5DNox0W/Y0dNEeH1g?=
 =?us-ascii?Q?fHq2vbBLr6v9oNpDXygP/uQDn17gJJvjAJuwOgBgbbCkyLj+EAJRhoHVs/7m?=
 =?us-ascii?Q?W2vM41piD39U94UY0ZEhwVslcM8YDXSmz58mi7CJN/2EQjhm9iJJLL/8pE48?=
 =?us-ascii?Q?6zw2NuSl4RNH8YVACBmXimlZpqTUiAMsIfAnXhTzwBd+SRP48OxSCIG4JhB3?=
 =?us-ascii?Q?1VCXCtD6HIs6Zrh8KK1/VyZvoS556y3MF4LNvYnDfxFGZSUoL5dYSLp3QdOj?=
 =?us-ascii?Q?/PIW69QmJizhr30Z1DxSqmc/hzESXvZhrtm+cxU1basvf7Z+BZopqqW6L4OK?=
 =?us-ascii?Q?VARROss0yXBiIBAF2ogLgAbM4gKCyiBLmfJOtIrnkzDtxLt0PWnY4q5Htxx2?=
 =?us-ascii?Q?i+yCtWYGgMtX6qVF8Ri4zHgfnv46vkRvcb1XXwR2WHI1vyGKszUn6LHmLYvC?=
 =?us-ascii?Q?4hquy+Vv2jU/d4Z8lsLsioKSSGsqCXoJ0Y6O3qQjFH0fcc5u+xN3vUUC7Z51?=
 =?us-ascii?Q?s0V5ZwgDodE2aquDvF7ApY1+e3Cj1yxObHdCuBzu+/VcNHQPmu1/tlOxcFZX?=
 =?us-ascii?Q?09o/q6AkX15kKCW666yxUFf5xxbQd9yXjjbBISldAV9549aE/AMGDtA7wTyB?=
 =?us-ascii?Q?KUFt6sTzbSEifxR6SSvgNvjJVwR380yB5NdMNWCxnQ1crQpCOfDS7TLrNvma?=
 =?us-ascii?Q?6Qf80FvAQL+hXfAtWlSKS5LJcykQPy9tTrq/MgJ7eLVXAOadNHfTZVIHnQt7?=
 =?us-ascii?Q?GZHEnaD/HmpWbYsgGnuJvAK5U9I+IM0=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: b6c50c9e-76e4-4a51-bd01-08deebb2ca89
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 07:43:47.0087
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dTDJS443+EeR6srEgOv3nfqjPwj3BFnHlvqvG6Y7ol7UP7SUWex1vC1azGCQMWk1tcw1j4AtOX0gmLmuG+H5GzD/r8NuJDHG+VyiQTu4AgE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRZPR08MB11139

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
index f73e90ca860f4..d8555cf32786b 100644
--- a/drivers/pinctrl/airoha/airoha-common.h
+++ b/drivers/pinctrl/airoha/airoha-common.h
@@ -152,6 +152,7 @@ struct airoha_pinctrl {
 };
 
 struct airoha_pinctrl_match_data {
+	const char *chip_scu_compatible;
 	const char *pinctrl_name;
 	struct module *pinctrl_owner;
 	const struct pinctrl_pin_desc *pins;
diff --git a/drivers/pinctrl/airoha/pinctrl-airoha.c b/drivers/pinctrl/airoha/pinctrl-airoha.c
index a46596eb1493b..0fd9457afc501 100644
--- a/drivers/pinctrl/airoha/pinctrl-airoha.c
+++ b/drivers/pinctrl/airoha/pinctrl-airoha.c
@@ -746,9 +746,12 @@ int airoha_pinctrl_probe(struct platform_device *pdev)
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
index 6e53143e91d70..6d6c5f1ee5d23 100644
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

