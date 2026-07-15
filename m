Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013016.outbound.protection.outlook.com [52.101.72.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 961AD3BD22B;
	Wed, 15 Jul 2026 19:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784144165; cv=fail; b=dEdZ9y9gsru3giURNN5lHsySPdWZ9QxjfZhSfV1PIMklg7/o0q5bsgGiD7lBjciNm63mxWyN7Tl83TGfnu1zLZjnCn49w8NhDqdBp6ykUVqhQzyn7D+m3f6bH4LM0B0yU0Qv98Xl/96U+tChJSd0hUUwUom51cdxD3B2K/jopzY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784144165; c=relaxed/simple;
	bh=pZde6xQMYnVpVl7wzlN2bAJbG19lGav1QVRB0eVQG30=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=sHURsfd4YxulTIAS5fNqktwUW2KhzPL5xTunHIgCIKMWDxfpDi7ovd1PUJWMxiUmOY9Xs5jCdYGtPVIaFTycyTcd+WcgidMEJCk5uaTDJvEc1Xz9DjasKKMCgo+yZ/d0bnw4f0nMJ3hnHqsKDvXffR6+f0hR5s/OJ0fNheaGgJI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=L09zCFHb; arc=fail smtp.client-ip=52.101.72.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="L09zCFHb"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Za9Zx6j3Pkz9N5Ew8+SXyBR7vzDjtr+JQoExtkUD8DYtKsGPzRUF2903Tf3RZ7OY8PuUfusdAML1qJMHsom2AwVDfTbH82wHei/fUSvxjKSuPeDDt5KLn2W566WTPW5jAJmiOjM2wAOyuKA0dSHX9SqqHjAUhd8EgcXH4frjcdTD4J1P/JUVGCTEwggKqj1n7cDn6/T8Bl+sXnGQea9OzITgvcy29sKg+RPSAwYLGncnvRo5IywmDy7NixBpxEz7WTQ44sAGYavE8xz2lUe2/SCApnQ0KBBePlGGbDZ+xYyC7zd2UysnEBL+YMH9cSOy+Km6Lie2y9Rb7cdBuyKO6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E/tlHhYKVrtL4/dHjTfUP8DIuJpFT77j57Yy3h4F8ck=;
 b=LJByLwjWgHjNG2lVTxkHPFUoILyK9n/4ZYXQCtiD3uynEMaM826xDQKsHxraasB29ZiEwTqU1mXiAkfR8r8O5rzBO1VptjqU5LIJr12Xi+jADaA8AZesXRqSTc5ev0uBpuFdQj6LopVhA5oIXQFl5lcNEjWzEPNXxJbeSig3jJA15Aed9LgCuEHpot18Jio3cZoXOUsxsPc2t18ovQx81TQHWQjkpO9/6sado6p969Tn7qehn709KLVL00rw5Uy8XyQdCaE2wECfFnYCgXYdDIocd5ejno5hVFN+3IdxyoSFkFsH/U32TInWFUIFl2Ji+CHfVQZa9oSMlgccP3NBdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E/tlHhYKVrtL4/dHjTfUP8DIuJpFT77j57Yy3h4F8ck=;
 b=L09zCFHbD3C2i+Eb/raE6wf5f/QJpzMb/poZwabKOLTtp7OAzW0iNBxSvLysbyFEfp9dDvF8+2OsJog+fQI0BiwayZmFfQevwoj1BFS2o0xB2vduMJKHhQVCap6XK8LMRClCBN5/4lSj92gECtu8goeTXLcZTPUABMfEsPgZu3iPOVXON9qcsfrSy73UjPh3r1vCQk2yAyBExN5FOR33sHcjCLVcaMb2lWczP0bFe1/fGOAhEtyNzsvDeOUb6Kbx93A2m4kIX1/+2xtc8oW8OqrkbnVNninu23ThhLZr6cFq6kYNqkNH9DriIFOxk/iIPDNQEgO07uaZ0K5znKIPOw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AM8PR04MB7826.eurprd04.prod.outlook.com (2603:10a6:20b:234::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.19; Wed, 15 Jul
 2026 19:36:00 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0223.011; Wed, 15 Jul 2026
 19:36:00 +0000
From: Frank.Li@oss.nxp.com
To: Linus Walleij <linusw@kernel.org>,
	linux-gpio@vger.kernel.org (open list:PIN CONTROL SUBSYSTEM),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev,
	Frank Li <Frank.Li@nxp.com>
Subject: [PATCH 1/1] pinctrl: pinctrl-generic-mux: use mux_state_try_select()
Date: Wed, 15 Jul 2026 15:35:45 -0400
Message-ID: <20260715193546.2852108-1-Frank.Li@oss.nxp.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SN7PR04CA0117.namprd04.prod.outlook.com
 (2603:10b6:806:122::32) To DU4PR04MB11791.eurprd04.prod.outlook.com
 (2603:10a6:10:623::11)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AM8PR04MB7826:EE_
X-MS-Office365-Filtering-Correlation-Id: 86afffaa-3357-4a68-89de-08dee2a84bcb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|1800799024|366016|23010399003|376014|10067099003|11063799006|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info:
	nGm/hc3RwzqRwy1h7XU7dw40HLh09SkMvz/dscrdFUe08SKXnJyE0479BOgLT8M5FgqiIKagu0n8AIHu8ZzAxe/woRDNrQJ5hvF/h+VbRoEO5xbIUR6gtGt1gmzhlgKdzMR/2Q0Q32opK/PWW8tWyXylpzCpojkTm237ccv8NFBBge6KEd7apJOixZVix4UBrGlFhketLInTLjwIeDpT4bojdem3Wj7EVk1Gjqf+4u/iSdPX05EWULsrhNv+wBq+1cWwPWBJQZp8H7AV7iV6dUhdvE4juzIzMM2F4FFWr2y/f1Ngs4vQNy/d8YayobMB9XzdQtoCwoCXg1QIBrg7ZDo+k26aQpLepPdxh5tGxEBJN39Kiu1YI70Y22ciAzLGONiFaLbzz2qU1hUkOzdEpoOcqWVYjeEYFQQUCjLZdl9tQo75wDsnE1nwJ0P4zaLhy4pJ5IYysotExs8YkPFNEs8QZXIPL8DmFCj3iW/qYWm6wiNGG1OlywSPNf9BA2RoxVIXaYXlFdgGRFuwTK5dR0/12PIVmkYz63txn9X6BUoTa3nZeBYHYxzE1RVGtbDkWY0qx/r/nBAwweguEtXY7Q/+LFT7WESg2LKPnnh6A/4axzoEfr/0FRgZpz2nkTjpEZG9gwCK2UxIQ7ZLzJzhBIlIEib/G+3nv182Dk48OY0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(366016)(23010399003)(376014)(10067099003)(11063799006)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?auLdDw7NddFRQeT43N2Cpc2Zz8iUNk/ULknqr7UpvAgKiFS5+BfJ1wdGj+Uv?=
 =?us-ascii?Q?p+O9YfMCtG/WfXW5AyL0rgmt9LyHRRQch+IKtqyEbsQUu7TQ7lyOm0+XQJoV?=
 =?us-ascii?Q?I9gEx2wSvFc9Sf8lr34kBzofUVwFu+Vfb3RT0pPnvSJ1nw/kcnHHSQStV4gE?=
 =?us-ascii?Q?6CPoS8RomIcISFcK9IWqYMMHIKoF/x6DO4svHGbK8tVPZ2aeQjBcFSv5wgVt?=
 =?us-ascii?Q?Nfzp02Rov3cjiQh1fO/zAX5hzv1Fkn7Zf4SR+W8I/AzZ4Bru/nTnDYjVifnt?=
 =?us-ascii?Q?+M1n4tsc8usmlGQoTVGQPi0lp6C5cJ7DHyi7gD5sW5iPyW1l2Y2jWWfeNnwh?=
 =?us-ascii?Q?3an7jicEoG9bhfaNCu80yciH2ppF9WyxRXqfZV3SI9febt4H7TZDaTN0cjPs?=
 =?us-ascii?Q?9r0gxZjvZk+OxWKgIBGp0pbXWiikc++AQGLYcaiCzWZ3ctYJk3NzAgl1xS1S?=
 =?us-ascii?Q?P8L6V9THMWp7vRp30A04+Fp4yHRGCgcSMxtceU9YEPVOnmdMU0UNATD4gtsc?=
 =?us-ascii?Q?dfvq86mwy+jvcimT8gig40tzm3Yb49phljh2HUsTMpYzaHxBwI1yketkYwNZ?=
 =?us-ascii?Q?AAAngGTgQNdFrL95EZdwhU8flcdiW70oiY3RySjdJpeSqSXKQ8yOQvkk4A2A?=
 =?us-ascii?Q?HL9+cmVNI5fwfHGQLVFdfZYg9c/DU/v/rQ/trCidrNiR6n4INjhTw0x8EawX?=
 =?us-ascii?Q?hKqPsF6OKLMBAAMEMreXW0SLRGbQnjM2y11NIgyGD7quaktg4uB6q6aBj0is?=
 =?us-ascii?Q?d8QWcwko/2+n6n4XBHnnkXIf3rrlgCkGQ7WDZnNx8CxCuep7n5NT+M3n9KRz?=
 =?us-ascii?Q?qU45zQbXFkcHS+eK2EYKYH8+srurDt+z9laLIPKClM71eVQFuAnBBcxQLbcv?=
 =?us-ascii?Q?rP1xyRwnAPw8IORpC8Cy5dhbYqFoaS5ndezXLKt5r44qNSM48k5qibjWhI0p?=
 =?us-ascii?Q?bt6tUTmSmpXmEKmRyuy7rJKqdw+CGxQ+92kJeD0P2E7popgPJM+1GHonuUKR?=
 =?us-ascii?Q?3mB+67gloJ5Dq/iTM4es0Vo7oARfuIAcksrbluesbR6099UJMpKzdZmD8Ofi?=
 =?us-ascii?Q?oqnitSOJTjHwUCy2w5e9t/qieWMcJVGldElEamZRJG6xPhjVBRYdFBOxLBI8?=
 =?us-ascii?Q?LoC7RZKNJVhqrQIWUsMqBEnaTyY5EC8MHQJhEFMCCCD0qvdHPKAijTlBDdpg?=
 =?us-ascii?Q?ob/E2PR207j/IT66kxmysoLQxmjIQ8j1ZHUVhWVnl1r2MlDmukbpZPQW2wJr?=
 =?us-ascii?Q?yyCuB68uBJ72yWbPfZ+CamNVmlX7mp3Hts/BY4fZLxJIhUVLpI7VPr/tCIs2?=
 =?us-ascii?Q?iIsnLU2efoBAy4R1R6D3DouhboyCxOM32DPwO7hyJQgBBJrXITvb0RjYlg6g?=
 =?us-ascii?Q?w8atY3t2mRL78EutOfhMB8+e2xGdNTK+e/4EEOgatfPQr/bOYU+hw1zQ4MPH?=
 =?us-ascii?Q?0lKLiEj2x8v4XD9m3Kg6E1FBTRqzzZZXS9igQaHCCLj1Cr2guHoUeaW8sLZi?=
 =?us-ascii?Q?0LhVV3iF7OBjPt1gJKnPknUsqTBFVAwE2j+2twhho37brXQFY/hMfMj2kp9i?=
 =?us-ascii?Q?dvXs8yMQCy/7zLiTM8ZP4rKyjKDnJXtUq9rQ2Cqrt7sqMwh2rUyZBRYEBi4+?=
 =?us-ascii?Q?oplF+wONbZ0rgQh9CNH3FWgMqw7jZgR3mckEcGiPixIuz8Z+YsQQjE/3KvdR?=
 =?us-ascii?Q?7Jh5pKr9UeFhvLexM91ddntHHXd79hu2ws0i+Zpw4wpyKodny1ML0zas5x/g?=
 =?us-ascii?Q?P5xrdXO4o4h+e+t9M+kIug/U5QTIOOvElpm/GwkOxKaKVhVqEoXH?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86afffaa-3357-4a68-89de-08dee2a84bcb
X-MS-Exchange-CrossTenant-AuthSource: DU4PR04MB11791.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2026 19:35:59.9145
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oM6EpPIMKuwQF/QM78opgx7LILd+J/LAG7xXqGi9CZU8hxcxAnwN8JM+IsOzDWDkWWGRFemJ0DVoSN5Q5ypYj72r/foX3ZqIBWHEwyrHmQfQzkHfSrWoxh+W3IGGXldK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7826

From: Frank Li <Frank.Li@nxp.com>

Use mux_state_try_select() instead of mux_state_select() so that the
consumer driver does not block during probe when the mux state has
already been selected.

mux_state_try_select() returns -EBUSY if the requested state is already
selected, allowing the driver to handle the condition without waiting.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
Previous earily version pinctrl-generic-mux manage this resouce to avoid
call mux_state_select(). But review or respin patch, remove these check.
anyways mux_state_try_select() better method.
---
 drivers/pinctrl/pinctrl-generic-mux.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-generic-mux.c b/drivers/pinctrl/pinctrl-generic-mux.c
index da5a5ec015833..202b72351efb7 100644
--- a/drivers/pinctrl/pinctrl-generic-mux.c
+++ b/drivers/pinctrl/pinctrl-generic-mux.c
@@ -93,7 +93,7 @@ static int mux_pinmux_set_mux(struct pinctrl_dev *pctldev,
 	function = pinmux_generic_get_function(pctldev, func_selector);
 	func = function->data;
 
-	ret = mux_state_select(func->mux_state);
+	ret = mux_state_try_select(func->mux_state);
 	if (ret)
 		return ret;
 
-- 
2.43.0

