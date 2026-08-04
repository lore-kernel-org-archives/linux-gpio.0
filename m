Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11023080.outbound.protection.outlook.com [52.101.72.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 423C447D929;
	Tue,  4 Aug 2026 16:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.80
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785859538; cv=fail; b=OMTmY4Vk8tvrMPHZMjZ5tlcs+VENVRaPT0g7215fSSYWUfG/016mn+L3c+RuK4z4Si6HJnelHdJKCNImgv5a16PqRjPRVdCFE5n6Ah/Y7Vi8UOx15NBizaczrSKFPpiHEJTTJU/el/jTaWkwRrX7uq2v1KwTnpqI+moloySDdVk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785859538; c=relaxed/simple;
	bh=lURN2B5Oy7XhPvdBQi7Dw1pfVH7turW7nZIseMxZJAc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=l2ZxyfUfdG0IgTKZOAsJRz/8ZslLAA4vHfCQJUwFDL1srx/ZmBW83Qo9Rn5b1XdahXkujF4vzN3j+KiuI+O3g/A2HPTBhugc5Y51hVEdSupCJZ6QWahrxEV86jpCW/8bm5wzS+cgVIj9zRmMK8yaIfBBeUQL0qJbvelWPd9X4rA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b=lpoNZbEV; arc=fail smtp.client-ip=52.101.72.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=genexis.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b="lpoNZbEV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iru1G/ijE/qRsMF8xd5t2JkCe0nKQ++6R0kfsB2z+sY750a8hAog+Pa+eXeGsxIKeSVVjavFXknGXF97ETTj/FdE7YEwNTTgbkIwMhx061Vr2q1fQO9d1BkYM/UlKvyZlh69v2eLKzIBumODMyLI30lZQDVcJ+/LrWcqM6L1IyMxtgVpdLKrkeO5Zp/k6RLPzLiK1pTRAfB/Tp7kFkUz0sX8Z92pNKKRAYW3I8yxfIORkUJwOHfqZQumlFa/A4brwieKxVASMIzE5r84ug+l/xXHlxpBuFVzZOKLEh2VJ5s02qOagsFTd2W0P/idHLgKbRoPFsQTVGrntopT74R02A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XPu8nG2S+0l1LQFPC5oQh7DjRyx2N3Ll+tWsylc8nWk=;
 b=eIMdG2EvauFWri/IDVvrSTSgewmFYnf/A2wQLx4WUr1USVzyUgSfmuOU3IJRNUn3J5HqKPSj4IyUZc3xxXPz33fNfViIWTjOtJcKzXp5SP0zjYCega86OTH0i5Nuf6JK0dLnXJTz8maAROKhgD1LtTLMEVdC187IpXUIhtKwopPTmKprn9kk0QQPUN54Wjj85efd3vuMUDwhMfnzr5c0G03G9jm7fvnvDvq5KwiQkXfJBwExa9dlVEQ0Jfu5kZh2Bp3md5ahrkuRiweHFtb6Nnuq3RnTiBTF8YDbItYODYVvcSGtmvufQfuNb4G2eTRL6+phF0+XFGNxv1diYHivUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XPu8nG2S+0l1LQFPC5oQh7DjRyx2N3Ll+tWsylc8nWk=;
 b=lpoNZbEVOKGRn84+UZI9Gkie8hxNXMfQAyVKKne5s+5XUIF7kkg6WIKzTS4j3HfQnii1TF1ezhHed+unJKvcKojv7lmOCzT50ohfWJNGw8oQLRlPdsvIuuMV2FXYLXzEqIRt49k/djDkZbve3RFtSAMS7gEhULqXB/MuVDUV0JhXCMGnGSigJ0+wQUNBVEZcqqGBj08+vsphwmF2JguNY+794JjjxMhTSnmfBkI/4el/Ty03Pt90fu9Xm3LSrHcx4HfFJNSi80PhNrf+y2Xn0KhOwUna6Gj6wy/GTqTPARi+7sMhgBIrxifoi/pQaGd7nBW4/5ivCd8rmHXf7ChMKQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by GV1PR08MB10792.eurprd08.prod.outlook.com (2603:10a6:150:160::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.15; Tue, 4 Aug
 2026 16:05:20 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0292.013; Tue, 4 Aug 2026
 16:05:20 +0000
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
Subject: [PATCH v9 27/36] pinctrl: airoha: an7583: rename registers to match its an7583 names
Date: Tue,  4 Aug 2026 19:04:10 +0300
Message-ID: <20260804160419.3592327-28-mikhail.kshevetskiy@iopsys.eu>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260804160419.3592327-1-mikhail.kshevetskiy@iopsys.eu>
References: <20260804160419.3592327-1-mikhail.kshevetskiy@iopsys.eu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0237.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e9::12) To DU2PR08MB10037.eurprd08.prod.outlook.com
 (2603:10a6:10:49a::20)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR08MB10037:EE_|GV1PR08MB10792:EE_
X-MS-Office365-Filtering-Correlation-Id: ff776434-0370-46dc-afb4-08def2422ed0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|52116014|376014|7416014|1800799024|366016|38350700014|921020|56012099006|11063799006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	Surf3gK+W3EHOU2ugO90T799jb8Eb6RK1lz+jeHtPQ9AhMbxemQSMV5jhGcqpqYwWWDkzsm26C40GCjBWDmMbg38xKJp8ouk729n8ZNtm71D08u3L9oviSi+s5sJn1KII1mYJl+9qPohwAkbQDCd7uaZ435OqYZcw6axo8z6KO0ROFlBH4mhv/zGB4yb3RgC3PLlw2eXitFBMPmQaPc+FPrGvreknOzvdNA0kNDRoiEXcRe+9dyprsn9obI/OypUi/X2CPTTP0xd8G08NbI5JdVhn9SATQZ8tsudMr8MaMW9Olov1ZND8N89Ykd+8obIgjvPiYtLvr5bk0+pSfawGLcJNPNji0awscbQJTyZI2G4Pydp3hKX3tTO6Yt56meT8nNWj/MJcq5p/LaCSFb8NrwUnyLHKFcJkBZ1DXbdjQoE46gSyyvpC2LDNIgyzy+DgKVDt61uDV5usNoGnzGqF2ZiUCi3jg1yfkcSuScmvcBYOZd3Tp5K143DtVz3Pao6LtcXgUNdTHlDIAl6PkXyYbvV42ou4zbu8+gZZEF33n0uDHNE04jYo55wQhsgO6Edxl8icp2ez2dZKWyhxJn53EeZTAMu0D5Xz2v5N83JSzooq8cPJ8c7IfgV5NcjcQ1jcTChp2tHZdFiOUomPXfi3chZlPXBjrzR4asBSYbXv+oFhhjn/pZFy6eJJ0Ch1t3hpqtnIWGsNjLm3TMTmtMBz+f50iZCLIrOSBQdqURIGdc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(52116014)(376014)(7416014)(1800799024)(366016)(38350700014)(921020)(56012099006)(11063799006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?jPN5iBPIMCkyRES8E9vfwFs2sbQUjZo38TbdxyKRKErsAkvWYk7KnhHdc/dC?=
 =?us-ascii?Q?yrxKyERRn9JJVuoxhCK176u6Ocopgj6kNQUrw0kzhPGNnBAVYTq9mkR1dGJY?=
 =?us-ascii?Q?IhOeurd/4Rl32StUuhIIhL/Qh1ICCvlt4Pinsmw/lJ/PEeProQl1n3pmfYr9?=
 =?us-ascii?Q?rqWmIMYYlZuPRsb0kztawsfz16ZatIWlgReN3Q/cBxZycBO/begQgw/qP7I5?=
 =?us-ascii?Q?RWxwknG6yPChdJHV2Fn54AxBk5QO/bJRWUonjLIcDPQZaIKbMwiAgwwQqHj9?=
 =?us-ascii?Q?B+wpqQF44ljBAq8VsQt+gU7Y7xf1l/JGOeyAMLXkXsehhe2emfNGg9M/Ag7N?=
 =?us-ascii?Q?R5IZaWZb9BeLW6V3ZqcqxtZJ7XOLdNvGJ3PKqMWKPP3s8apW3+pK7hnCxVfz?=
 =?us-ascii?Q?HihwpveowxHhHtHEucrVKsD1E4kMLwKBBjRD9ZcsSClh1hHa8J9ZIz/egjaN?=
 =?us-ascii?Q?QD+J7gacaOZhgsM+Jcog/MMueUgYox+0pIMNPJtqbxkcM3S5W6xwnJa7nOmh?=
 =?us-ascii?Q?Bm3Wo7DlfMVxbJrjglA5Ty7FvNpifJr8oGRh0EWn6Srcsa2G4gwRDf2e6xZX?=
 =?us-ascii?Q?4w3XF8Fuf2DBejm3NACCrXDO2Iq8p4D8d9/S+ZVGU/5yNs13DeyWtgCQECM5?=
 =?us-ascii?Q?SkOYKFpvgZT3OGV/L9BRmXMpt65CD8rGKSbtPEUr4UKKgmxXHC6rv+eWvYQj?=
 =?us-ascii?Q?eWua9Sg672PWQQnBdQsIkUshLPbcJ5NQTsQKjfE5sxmzeshQ7qh3y/2B+JuW?=
 =?us-ascii?Q?L2cl3qUlxF/m7r/X5AefAqLdEPMgKyrLeQKOSgttYTZ6ihoYACOlGp32Bx54?=
 =?us-ascii?Q?FgP6cxOADIChnQe9GNpAiCNEBrzl1pC0VTmUJJC5q0Ab+v2OfAA7iBEJyJlK?=
 =?us-ascii?Q?Vo43q3FFLroPQUKkh3BTooqPJkzSY2Aa8C7DuvcGhcdHREwGbXzCYzIfJDFr?=
 =?us-ascii?Q?4DgUQkXy4FJ/Xqbnv6PkIsz9Df2ReSCoG2asge3FsYvZ0oFbj3gzNYZsVH88?=
 =?us-ascii?Q?3snwWWO4MSB7HRRkPwNuRCBEJamp0pjOUHOzVaouMPKTBfPWy+1RiBGn8Vmc?=
 =?us-ascii?Q?bqVjLMXZJ3f8BIffrv+xgLCmSaRyUm/zGAMjXYIWShg8rnzTd1lINliSUY8E?=
 =?us-ascii?Q?yIrURm9hO0TA6cqpbopmdzX9YFO3/Mi2aqkwiN3ouv5hAR6o5d9zNKZTWbbT?=
 =?us-ascii?Q?rOLd/eNgU8quEbAXgq8NnXSM08+8Mlffxet1ZYWx/VJh7Sv5wK5VcPoJ5kaJ?=
 =?us-ascii?Q?/p6kNibUipF9vzn34EW+KzjXSGwG7BfqVUZls2ldGpK+h+QO9ut6nxyyMXBn?=
 =?us-ascii?Q?1Wg8Wgmkin0UcTYXaFI9Gs2h8yDjkhgfKQzTd1dch3IHy0WWz+wtL1Qqvb94?=
 =?us-ascii?Q?NMK2MFjfN07qlgpeKRvAKhkbqgdwl0+JxtmF8nZlCCaKLEh/lXRXzPj4Go50?=
 =?us-ascii?Q?8r/fy2W6TSXeNKpgBJun/ZlDBWCG0a0Nakz5sI9XHoX+yLw6nQLyKk1KV41i?=
 =?us-ascii?Q?BRnjQ/5ZXTIb0TlQC8GHjNv56l1+eOorBm3J9EYylgS1dcXYpbmNkJ5wPGf8?=
 =?us-ascii?Q?weKSmKRVySjNit/vTdwMYJH74rRhJSNMVA690DEf5zyn3BW7SexnHs2lwL3U?=
 =?us-ascii?Q?IR5HRe65bbKlDRfxp/56utPilurFMHb6QY3slV5kQO8BIRiLPHPJJZSA8gdV?=
 =?us-ascii?Q?Xs5/JCupBObsK+0H6tNb++jX0jfc+RGtLDeoNgvkMDT9q++9YiExd/Z07H0m?=
 =?us-ascii?Q?llWAkhDAvbk1ee5iDxBLL3n+NsIk+q0=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: ff776434-0370-46dc-afb4-08def2422ed0
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 16:05:20.1802
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qpa42vJqqHbQ098ec25iQ/bVREuRkp91rKQ7iaMtE/Q0edBUC744gHNiDKPyTc830yHo6fcLKF+4nNjPOxZtfuXMALJ233H1c9+fqo2H0FY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB10792

In the an7581 case the register at 0x1FA20214 is called
RG_GPIO_2ND_I2C_MODE. The same register in the an7583 case is called
RG_SW_TOD_1PPS_MODE.

Let's rename this register to avoid potential confuse.

Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
---
 drivers/pinctrl/airoha/pinctrl-an7583.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/airoha/pinctrl-an7583.c b/drivers/pinctrl/airoha/pinctrl-an7583.c
index 6d195096495fe..44efccce78c55 100644
--- a/drivers/pinctrl/airoha/pinctrl-an7583.c
+++ b/drivers/pinctrl/airoha/pinctrl-an7583.c
@@ -8,7 +8,7 @@
 #include "airoha-common.h"
 
 /* MUX */
-#define REG_GPIO_2ND_I2C_MODE			0x0214
+#define REG_SW_TOD_1PPS_MODE			0x0214
 #define GPIO_LAN3_LED1_MODE_MASK		BIT(10)
 #define GPIO_LAN3_LED0_MODE_MASK		BIT(9)
 #define GPIO_LAN2_LED1_MODE_MASK		BIT(8)
@@ -302,7 +302,7 @@
 		.name = (gpio),						\
 		.regmap[0] = {						\
 			AIROHA_FUNC_MUX,				\
-			REG_GPIO_2ND_I2C_MODE,				\
+			REG_SW_TOD_1PPS_MODE,				\
 			(mux_val),					\
 			(mux_val),					\
 		},							\
@@ -320,7 +320,7 @@
 		.name = (gpio),						\
 		.regmap[0] = {						\
 			AIROHA_FUNC_MUX,				\
-			REG_GPIO_2ND_I2C_MODE,				\
+			REG_SW_TOD_1PPS_MODE,				\
 			(mux_val),					\
 			(mux_val),					\
 		},							\
@@ -643,7 +643,7 @@ static const struct airoha_pinctrl_func_group tod_1pps_func_group[] = {
 		.name = "pon_tod_1pps",
 		.regmap[0] = {
 			AIROHA_FUNC_MUX,
-			REG_GPIO_2ND_I2C_MODE,
+			REG_SW_TOD_1PPS_MODE,
 			PON_TOD_1PPS_MODE_MASK,
 			PON_TOD_1PPS_MODE_MASK
 		},
@@ -652,7 +652,7 @@ static const struct airoha_pinctrl_func_group tod_1pps_func_group[] = {
 		.name = "gsw_tod_1pps",
 		.regmap[0] = {
 			AIROHA_FUNC_MUX,
-			REG_GPIO_2ND_I2C_MODE,
+			REG_SW_TOD_1PPS_MODE,
 			GSW_TOD_1PPS_MODE_MASK,
 			GSW_TOD_1PPS_MODE_MASK
 		},
-- 
2.53.0

