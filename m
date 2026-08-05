Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11020103.outbound.protection.outlook.com [52.101.69.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A04CD3C09F4;
	Wed,  5 Aug 2026 12:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.103
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785933275; cv=fail; b=fNM4yJDXsBg+Y6aeEmewj/2b8cYFLveN91nWupSnBURmqEb5dINocQf4rTQGdnBFJr8tjUfl/JbPBeGH7L5eWnm4KoeQzmlmvBSCkjM/CsdnfI2CdSvNLJTmCU9uskC38vfWY40qf4knR/SRDS2QrVeMikWnuiYsWCNLi4yWzpQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785933275; c=relaxed/simple;
	bh=UimW22y4fVxkVdM6pgSU1MuQMtmRpg5a/bnEe0YiFoE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ruxANOxbmd/fNLrSHS2Ey7hDCjEWrjrQqYnJ/AnXoAGi+hVuNV+JLmUu98pLs/0xH7O3HD6+B9DXCjezAP5IZoyeEnb1Ikv9tEwVju86M7EAif56txMGBEKTZjzoziRvS0fILbrLU9gRFblMLgXrP1niVfJMcq/tG+HINK7gS8w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b=AxM0rxl8; arc=fail smtp.client-ip=52.101.69.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=genexis.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b="AxM0rxl8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S7uoqGCc1b+aGiqMpKEaa3yaCZtGGGRd3BVWExmurb2j2veQtoJSnos4EoXM0wBF74+xyRXnLYZTnbIGTkBWNNt/XvpxJzDRyRh2gmBwq9Cu1ORVvRWi1jIbzv8Dv/W6yhG97xWMhiVGhdxcInGdoZQxkGsz3NNfuee2jbvBZhyWVjvXw+6IvXY4c4SceN01NsuQ7V4ub28DOz+VrMxGOLdmnPfsQNYIcPiYVRS1PqmudEeUMyEygCc5Z1hVJEEIOrlc1t72uWFky4xVjP+glhm60OEejx2L8UOqnMjRsAaGmojg404kgwwuUCxl9T3sPWshm7KxuCkUhAeUCLPbjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y8WM4489ZxUoA58n5FSRElPnVk1Rtke2MsT8nMSq2E4=;
 b=PA7RrfZNweg7n2HP8/p2O6H5czx/eN+YG6/IyIwvKVC1AohH5mz8PtyrfD0F7jkBLpHCjdFWX1afYn5TnEyX0EuMECCbnzLvuqcwv3J63iCxuO2+CxWmuyltGrPHAJwCf2sWqay38UP9/bFKymnqjNaj4jNlo4hLZRLOhP/7v9GksHfJJ2FsVSf+AeoukGuyeZ4rpQw4Dr/Gjm+F16f9L0S39sYXwTCT5tQdJdM7xjZykdwtwC5xEA77JMLTU5eJtjxTrq3uwOo3cjyaLD4qr2wwzpzf7hW37k1a+VOwdzUObL6+97gn8vuZMe7DaNNemH7NyxmzRQmMhAJ4BmMQFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y8WM4489ZxUoA58n5FSRElPnVk1Rtke2MsT8nMSq2E4=;
 b=AxM0rxl8FdQ4DZzGfmkT4SVdffjSrVRC4oYwWUUea9xwAvMpvDYFgSdmi4u1yZSMuV8gvHyQbq0U8+3bOLi/yEZP1YJDNjnpHx0mR4WCz7vZYU9wYnm5TwYmzDL20bgZ6vooSSECYmU4detXjy35WTMmAj7hx+PQoMj/Ho/47AF9K2kSNnDPY2e2IgRZXr0fAgylyMXU17P8e4mVR5LyQRtwDAbtBthHIamUrQE+N2C/JOdue2ixZdDzV3SWMuqELj/mZkbcidLCRVLR0q6tNcV4Vxm2EXa8hg3E+XmaZAgLNQf20uIB7qmnKTC73oRh9C2aj+ZtmNXU7vIVxglkHA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by PA6PR08MB10830.eurprd08.prod.outlook.com (2603:10a6:102:3d3::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Wed, 5 Aug
 2026 12:34:27 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0292.013; Wed, 5 Aug 2026
 12:34:27 +0000
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
Subject: [PATCH v10 03/36] pinctrl: airoha: fix mdio bitfield names
Date: Wed,  5 Aug 2026 15:33:35 +0300
Message-ID: <20260805123408.3767648-4-mikhail.kshevetskiy@iopsys.eu>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260805123408.3767648-1-mikhail.kshevetskiy@iopsys.eu>
References: <20260805123408.3767648-1-mikhail.kshevetskiy@iopsys.eu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0065.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ce::8) To DU2PR08MB10037.eurprd08.prod.outlook.com
 (2603:10a6:10:49a::20)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR08MB10037:EE_|PA6PR08MB10830:EE_
X-MS-Office365-Filtering-Correlation-Id: fa2fe9d9-d0a4-48d1-9378-08def2ede39c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|23010399003|7416014|366016|921020|38350700014|56012099006|11063799006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	MxfizlZCjiclyN6zmC5dv5vDVSPM+982TRZA8Xk4LiHPj6mEtrjxj9jvQxBTfjU/VXZi5DoOs4SSDfzicN5sdXqnixPxFwonIBmrpVvcxQXIDuA85JGAY7Sha+irmHOt/wv92FtmsrViBSzhNWm/tk2ghCGvVK+mYOVt3w4jXfIdY7ID80sU7ZQy/DowZMVZMgrr1DwKcMXW5MocI3LCDkiLUaaovo/gjEkWx48cYR6TxdEDosp26hCuvMZ0DXezVT/MvN94H5/L2K64u3T4Y6JcUZulH+SQMmDQDD9/zPsuCkCooBHGjE5GXBW+HCq4JEeJ6x/hUJ3CyagjCrDHKA5KM2yAMRMcLHtWioSu2LhZew0R5nCrLNLVbJ2RSxko/WoOFSFhIpK1Gye+zoJE1aHgut+fu5+2HZFsYJEkLag99PUPJp5kQWaj1TnFEpPAbvZDFpyhXly1UjdGPQSogqVEhj3p7dquFC8ewHtxs3MS/vS4AvtsGKik+5NBQ1fNnwN4rVx53PYSG40XOOO5v6a0mNCg3iSSBQzzpDTsSF4Myaj+sQScgRhQiLOKol3JsyRYDpY7/YDvNzvLxN6rAzQxMXYbWfD3XGdjXUZ52Ab2eao4FFvlFr5jKezRuTfqUIqYFvYdpIOCZ5D6wxqmStVo1cRuH3tlPtIo3ugj7rtxkGJbv4kpwFfRGXpPKduua9cvPnrgG1wnoz5EkQjGEmgNmxqlru2LSAiPe04aGp0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(23010399003)(7416014)(366016)(921020)(38350700014)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?tACSnqpI2puMT58iba0jvmVcpg8hR5NtNO5dLMhGhnCVrf5ReScqoEQgQKV6?=
 =?us-ascii?Q?PcZJLmUyZYrGxmbfNfYNfijm0GP8MZtxqQKOqJKW50rI+DGVbvn7RLNMoC/V?=
 =?us-ascii?Q?qIolx836N4Ne03Wg9lx0qlXBWNHLMfKQKx2in8HcHwlnCVz3dyy3owR7uSa0?=
 =?us-ascii?Q?ZvrwxWrbSAd70eDPkNjN3WVqek4kJjmAiqHv/SUsb0loJ2Zkew+VAn6J8IgR?=
 =?us-ascii?Q?VR3mZT8nkJYCsN6MZgSEVkRIZP5yqsAc58e/7JE3CMnZD2qCqUpgx9BkqNHk?=
 =?us-ascii?Q?wl2VT+oMuzrcJlp5Au4tThDG0Z4BIiSIheRaImHdrPjBmfe6Y66ezGF6YSsg?=
 =?us-ascii?Q?O9KIV5Y6s74Vry8whYIiW9cVgENF0+CcgngWKeRJOFERpyYlV5ImIlWTrWiY?=
 =?us-ascii?Q?MTUYIPZt9R2olbh+lFHacVEInZQcArhaR0dMD3l91gpPbLhELQHr6xeXbMqN?=
 =?us-ascii?Q?A1sKlIWooo6z7+DYv0Uw1wu75D68UJ2EsWxkoHicwjDvx5JNc+2pMlVEoZV1?=
 =?us-ascii?Q?IMlzXFfxU7lcPxzrNEUWlufwj/Tru8LMUg38OLBrGXvZoojN39Gu6iNQcmyh?=
 =?us-ascii?Q?Sx7gl/oQ74UqjDBlHGAqsZh7eKMEc/ylVSHABXuqdM2inkHFhFhu2vddt2Vh?=
 =?us-ascii?Q?xvKHR+JVBupyY6NRPhLRsKvJ3czgutpy6p1r1DSXvDEoqxtFpCUnvULDeRZf?=
 =?us-ascii?Q?0Yh4B7qkGFr+CoTemzXecH9ETLuSElKGTxTYWB5L2kPKdEsEYAPCChDBU3Vd?=
 =?us-ascii?Q?tavUFg8g82fQVJSunQvP3I9sTpB/XtWRC3TlxUH4g4IJuqX5fQZcp0SEcwmA?=
 =?us-ascii?Q?0wOPdSGo1v/uLveaxebv2eIAkeIBrZ0y8U/JU12Z1BF3/zse8M5mpY/CHeui?=
 =?us-ascii?Q?6SB3loIa+AA3kKD5YqqE7MeuaunLtwLglcfCZOG4EAHO9UJeug9DtN2wnZ29?=
 =?us-ascii?Q?QLkRf4Gb6AjlHZ644rmpTKP6+jrTYlSxYhSMmo9H5uJOgTAgALpM4Om3aQHA?=
 =?us-ascii?Q?KlfzSZiaK4peuD4wd4I4CiqsmMj8425RUH26TcmYyDN54AbVFYn9sjUORgnm?=
 =?us-ascii?Q?fHgc5NXG6Xt3jvxmOplI4NEaMAh4ZMD/RDB5x7OG6mJPSe0Bptpg9Bf03b7L?=
 =?us-ascii?Q?thB09Xu3O9yZwEGO0VTyY6hqVWQL5iWz1syuIgVdbIGiLRMXGotzER0cRPOt?=
 =?us-ascii?Q?5N+DECO5GHZrrOYSaEkNxmgvwXOXwaauPbo9qmPOXPAdLC3yY/HIqUoNJCHW?=
 =?us-ascii?Q?9hi7xR+05NKgMCzMtCHxpUfe6ZEkgYki0DRfBPvDQOWkDCj3okVN1ijHMF0W?=
 =?us-ascii?Q?UmQTehoxmFfHh8QEq+Gx5H8nUyJtoJ/4EOgxg85pN4VW6j8tNuGM2EPCulYJ?=
 =?us-ascii?Q?DpkvpfV8l8u89xJcqpq9mu66s4Mt8SQnmclb+PiloUjGoJZ5PbtNvY6kGzU8?=
 =?us-ascii?Q?egPaG4GS1bFI1JLLvM1arjAfUmiPOQ24df1w429vXaY2jSl29uLuugFddC/l?=
 =?us-ascii?Q?BxJ4giiY6d2wuPAyZ3IhkpwTLA943/amhyx4qmBcu6m152pzlDoj3kSKX8lu?=
 =?us-ascii?Q?CIusTc5L/pvIUUcphsGDhgnTG3QO3AXmaeYAE65cwa5OSN5hSYMF1ngrWj71?=
 =?us-ascii?Q?W4FxA9TevZkJFOMwJKrFgCZNoBnMke6MkfvnZaXU1t4/2BoG6p+c4UIYxFOa?=
 =?us-ascii?Q?WeDKErE2dmdtn4/L9upD+kq3OpRJW1Ul/Ufd4xPSVwwYAdXsrhLqvF8DCcrd?=
 =?us-ascii?Q?WZpLgxcPkEsT5ecGeUjv/GijyBc1mUw=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: fa2fe9d9-d0a4-48d1-9378-08def2ede39c
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2026 12:34:27.4600
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sXr+rUS9vEfW24u1cj/V5WokTubfD1ihsfIMGjqfB7FfzgGs/x6LpF4bYIcTsNTqoFyCzwH7pQciMQUTJlrzcuK49eABCsNcziIRppn2Spw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR08MB10830

Fix misprint in mdio bitfield name of GPIO_2ND_I2C_MODE register.

While at it also fix an7583 mdio. It should use an7583 specific
mdio bitfield.

Fixes: 1c8ace2d0725 ("pinctrl: airoha: Add support for EN7581 SoC")
Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Acked-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/pinctrl/airoha/pinctrl-airoha.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/airoha/pinctrl-airoha.c b/drivers/pinctrl/airoha/pinctrl-airoha.c
index abfb018f207e5..e8c018620f1e9 100644
--- a/drivers/pinctrl/airoha/pinctrl-airoha.c
+++ b/drivers/pinctrl/airoha/pinctrl-airoha.c
@@ -49,7 +49,7 @@
 
 /* MUX */
 #define REG_GPIO_2ND_I2C_MODE			0x0214
-#define GPIO_MDC_IO_MASTER_MODE_MODE		BIT(14)
+#define GPIO_MDC_IO_MASTER_MODE_MASK		BIT(14)
 #define GPIO_I2C_MASTER_MODE_MODE		BIT(13)
 #define GPIO_I2S_MODE_MASK			BIT(12)
 #define GPIO_I2C_SLAVE_MODE_MODE		BIT(11)
@@ -66,6 +66,7 @@
 #define GPIO_2ND_I2C_MODE_MASK			BIT(0)
 
 #define REG_GPIO_SPI_CS1_MODE			0x0218
+#define AN7583_GPIO_MDC_IO_MASTER_MODE_MASK	BIT(22)
 #define GPIO_PCM_SPI_CS4_MODE_MASK		BIT(21)
 #define GPIO_PCM_SPI_CS3_MODE_MASK		BIT(20)
 #define GPIO_PCM_SPI_CS2_MODE_P156_MASK		BIT(19)
@@ -1026,8 +1027,8 @@ static const struct airoha_pinctrl_func_group mdio_func_group[] = {
 		.regmap[0] = {
 			AIROHA_FUNC_MUX,
 			REG_GPIO_2ND_I2C_MODE,
-			GPIO_MDC_IO_MASTER_MODE_MODE,
-			GPIO_MDC_IO_MASTER_MODE_MODE
+			GPIO_MDC_IO_MASTER_MODE_MASK,
+			GPIO_MDC_IO_MASTER_MODE_MASK
 		},
 		.regmap[1] = {
 			AIROHA_FUNC_MUX,
@@ -1051,8 +1052,8 @@ static const struct airoha_pinctrl_func_group an7583_mdio_func_group[] = {
 		.regmap[1] = {
 			AIROHA_FUNC_MUX,
 			REG_GPIO_SPI_CS1_MODE,
-			GPIO_MDC_IO_MASTER_MODE_MODE,
-			GPIO_MDC_IO_MASTER_MODE_MODE
+			AN7583_GPIO_MDC_IO_MASTER_MODE_MASK,
+			AN7583_GPIO_MDC_IO_MASTER_MODE_MASK
 		},
 		.regmap_size = 2,
 	},
-- 
2.53.0

