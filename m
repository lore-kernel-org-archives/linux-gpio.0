Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11021102.outbound.protection.outlook.com [52.101.65.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E7A242A170;
	Thu,  6 Aug 2026 22:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.102
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786053997; cv=fail; b=F5hZMWdnTBOQ1Pw+1/iQeTEjBFVqqilxnn3x3f7RJjpvVBtUDRgufwapY3rH/5/KljCBM4JudeJ7J7CQqRs1A1wz4tf8ppLMTFdFQ22ayK40hH7L/yrOcneGEy8YCfsImFOv5+AgzXrVdgH9dWQiPofpVvmj6DmcuXQk8TfQzcw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786053997; c=relaxed/simple;
	bh=UimW22y4fVxkVdM6pgSU1MuQMtmRpg5a/bnEe0YiFoE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=JeaiZ71CHkoO7ZNmILmn1nZ1Qd7fDYcsYkerecxvmlUcpZTs3Tby+Z296ZcxTN65KwQqMrRLzbZjjsJ6g9dA3Ir2oZbXvor8Lj9ZshcMeaUof+BGvy+486/yvouij2Uk0Tv9rgnzL4rks60Xi94cVjFGAL8CvNFP+VB+/KevlH0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b=ZRJMiD7f; arc=fail smtp.client-ip=52.101.65.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=genexis.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b="ZRJMiD7f"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DU84p332B5RgqOcqzWRcfJNUv8JvANg9UkaWnDVkSorwBKPkAEBMrAwq3PKmAeOQZ/b2+k4ktaZcXFedL2MobaSZF6I0QTTW8Lg7i3VDHALZmIwKaZ9gbG6A0AZB5T4sGX8kaYvxzaJTN2tfehcYstsOOut5tY2E/fHen+MnhZkwORBvnrJOTN3JRU3pj+hG9LnBloAWsqTZtjAW8rNYnryn+KaGfl2QV1VZxw5USnhNFXSJ2ajdWteF1P1obhLtSZPcQFKExj9NwLI0LoCP+bXzvcHQ2Id0KkcQa0/esRMs5lYwkNDtPCOTlONV9zoXHA8+vsIzW3kPLc1zyCesJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y8WM4489ZxUoA58n5FSRElPnVk1Rtke2MsT8nMSq2E4=;
 b=mk0UlUf2DtnfL5yaU4CcZfE1+kra972yRS3OS8I/YehCY918CoH5QOztexvKZ+mv2xSFL7IOXw887zu+rQgo9DEDdctFTKw7fyXKLrq3RGRQzR0g9x6i7PJYJ93Hm1TEQdA1lrA3FAMPN5T/UcYMLvRJGFX/RvQUl8BGtES8Dzhjm8SOLYyaQKBNYSwDeIu1gsZtW10oa5s2VVbDTFteElhUXq62+H8PE9FRfDIkaYNL3DRWCNzrrnsA8qYSdI9sn5NvUwxmYFoZxUYzvI9QwRSHotnT5iqRftSJSheDppQjFl3VsSWKC0XaCMGkscZp8zXKy0sz+C4hySIA3VcNGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y8WM4489ZxUoA58n5FSRElPnVk1Rtke2MsT8nMSq2E4=;
 b=ZRJMiD7f0DlN/qZaTb4dzwP0gwgI3jr8kBWKDup7yKN6PKb25x7VMu9Hi+kQDRzlulPR79MlVswFClRgY87POi3o8LC4Cz0kAJideOc3+RJuddiqSWz4oRVRnL6QuIHeVHmVcym9+duIl09CrGsixqgP30VQjvv8WZjPa1ExLxkW/jiSj6xLv9BIeK8jtuZgN9A9o31ONWrC1ueasZTNbIiWQ6sRdhFq4PhZ9vktlR1H5oWVp5hYj4i0lB2zJARCl6BogKiSLDxBmZSqzK4RcMsJ24mI+1VkQgkZNpjStElGbRupuf3atw0giR0fbMcdMfRhhR5bPLvrLsxfMoUelg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by AM9PR08MB6705.eurprd08.prod.outlook.com (2603:10a6:20b:300::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Thu, 6 Aug
 2026 22:06:30 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0292.013; Thu, 6 Aug 2026
 22:06:30 +0000
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
Subject: [PATCH v11 03/37] pinctrl: airoha: fix mdio bitfield names
Date: Fri,  7 Aug 2026 01:05:41 +0300
Message-ID: <20260806220615.4078303-4-mikhail.kshevetskiy@iopsys.eu>
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
X-MS-TrafficTypeDiagnostic: DU2PR08MB10037:EE_|AM9PR08MB6705:EE_
X-MS-Office365-Filtering-Correlation-Id: edfa0cfb-c735-4e2e-f5d6-08def406f7f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|52116014|7416014|56012099006|10067099003|11063799006|18002099003|22082099003|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	GknH9tVVcPjYarcj3131ccr1JSEWQqtSzBsVEXR+uUXJvVRsanM57kDJ1KIHErvma/UEOjkut2XXDKKAvqIAe/EkwHZ14PabGXYn8VRdzvKVH/naUjPKVxp/VSeNIuRE8/ametzwy2RrR6N8J6uF/wdEgPw34eitgrzMIDW81GXkYscllW65zYlQCXoecBF9LIrRJDIq7Hb+0plE9zwjpldVVJYm9v+kfBYBXwm4m9BvdmVf0ydPBcepl0DY6Q6S3lAXn+Pkov9/mt8JsNvC1mMSaVXF2K7t/wuu7NbYlNQ0P+QEY6ryd3XDPRIz3PdmPg2FF3zq+i17inHOTLdnmloykhy7g0f3pxmjzMk87/jalLU/wvE6xWdOVdBWoUFPsJesONrf3YsInLbwEBx6lryryQTzAQ7+J8zMwPJJE5E1MWhyGR1mYUWc44DmoZOyqakC/VbuRmkyDCBTejFmzGrH0/pYLWhfgBeC9Dh7ksVVZ1unTTvWHsLWEwBBewrEacJpaYrnnIWPVJ8TFQS1FpRFWAecA3GncMFYMecSufPMWoUkOJT3zpCJv+WsnHI8fc2ZC5fW2nSgBm0PxsmVPp/X7U2npL27AjzyVTZB8spPo+baSu+3LmnZ2AalTMaiX2Bx0boHKf2zXVLD8DgXANGq+XGC6akR+2xB0Ab0r54cCD7isiFIPg9ElMXZ2nTc81p+TFyZtvX9/TcmuzkK3yo5Lvptk2x3eDHecdkaHIQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(52116014)(7416014)(56012099006)(10067099003)(11063799006)(18002099003)(22082099003)(921020)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?d5GXhALJwujUwo+lxBvalUSP53KRXSfrUEzQHtijd/ZhDrflOO8ZsmHWK4vR?=
 =?us-ascii?Q?IY652AXUTOmfJuGKqArnNUqkEDo/yCydZ+FNk6ac7qTTW/YUVqs08lP3zgbA?=
 =?us-ascii?Q?6TJ7gmw67QCBOt3KIHVNrewuVqc+IH2mGKZ/dAtPXosNPwsjtszDsi0/bx9P?=
 =?us-ascii?Q?ko8At25rRmcb6UbXJT5sEcVxf+dHLA56WXmuPzO/frqu785tkcOk70q/oBP6?=
 =?us-ascii?Q?Jk0Tep+zCTT/IH0zB6WnQv9XeggJuZmPRBqfuii6IteExwGX8UMNkE60Wric?=
 =?us-ascii?Q?vT6ECqtDYgjnwKqB7w5zJl9qTJLqyg5SpldILiEwMHMqWOcZBJws9GdltoL0?=
 =?us-ascii?Q?xzQdUGxujjq8z3+7LbhF3XxF+2zq/r74GCNWibCjAshw1zVi6EA9kYLPO4ly?=
 =?us-ascii?Q?BmpW0Dpn4qmHKE2x9TeiYnVlgMaM6L0o27uw4Rl5brQb5ZQjAI/3SfSae3s+?=
 =?us-ascii?Q?OP95XkaYghxWQyWgOCBJVTB9GKXSvxSu3Z/kMvxuc998wlTYDK/+N0iCTpKt?=
 =?us-ascii?Q?OOJ1bOl9qXLibY47X0+580JKOjdbgnz1b3nQJg3R7hAhCSlVTyL0DjnN0SKW?=
 =?us-ascii?Q?vTBbsIxHj9xSk6z6VB3/cz/L2WbD5fFxiZx0Ef0F+742fAcXD9IVxtxINqp5?=
 =?us-ascii?Q?WFVfHB5KIKvsRqgFzco1T/ffdyfk+M6IHN9XjC6uhY3W6m3ZQmw0UppY0T41?=
 =?us-ascii?Q?TaesmLYAfQKbS/jr2y8PgQRAh8t2piRda3uuEXjBujMhavzHD9yvalyxU61c?=
 =?us-ascii?Q?bpBfc/HfhQpyHPRMGAJ2ZX2ET5DOsREgS/+wKF+mfbu0ftnZSull+/LpszA+?=
 =?us-ascii?Q?jT3VPW2fK7iNaG0njvjtrOYbhWJOfw4+icnfEZFo7FH3H55I2PPGx8l+Xglx?=
 =?us-ascii?Q?l1PNLPuY9W/mrQVLjsL+qRQEGs8tmdwDVH+vCHvEQuHDoHRlMaZW7/tPOhTs?=
 =?us-ascii?Q?hEscVYp6E2GyxuH+SQ/gglKj0pFMkbD48pEpeApexNnrtQGtbJ+ZxwZ4Gs09?=
 =?us-ascii?Q?fdkCePc5kJsUOEPrUxMMSNl68AV6iW9XPmJ9yoAiMMRJN8DgH8iIA1v6Y3yz?=
 =?us-ascii?Q?YXsnjKZvj+4es2OQxe3Miuxfk8xgWmhkCAf0C43sVvbqQG0Y/ho/hqGm2E3e?=
 =?us-ascii?Q?MWfIH3hUTLT54IR1duDrojs4pE5g2/ezErO1WlqZKzXpG/ivIK6ZKtAUU3A7?=
 =?us-ascii?Q?K/2lkHvo9WdHLvMOrlDGwqHR3QEmiY3f6DsmMDv6NA04dsKchPryMBpUoZpr?=
 =?us-ascii?Q?h7TWO79YBp3LvZHVTeZ4OLsEKSU9JblPEN8YzPaL7dNYvukSfe+p0O+8PHLl?=
 =?us-ascii?Q?shqxBV9EKR5XJ8yd+rs9BtQPjMFWvXHozVes01OgkrRLDJZ84ZBJx87Fcc6B?=
 =?us-ascii?Q?rcDBfDSgApm4R9XYAR7C8ulF4YWfzEFUpeehQPYmUOnuztWsnFWOgljYB/qO?=
 =?us-ascii?Q?fohIFccsL68cKq4/heI+Ach3XL4iPE7JPlIREVS5xfd/ejggpvHNVprxZyUb?=
 =?us-ascii?Q?Oka2nRZrocEtySLi/Rv8y1pDlP2vlHAenYnJTsgupxiy9ZPEsXBOir3Pre9X?=
 =?us-ascii?Q?LFpaGoqLoKmzsYCMxEfvs0ELV9zs0nBaygqmFw1sH40ZYOQjz1udKALQLdLj?=
 =?us-ascii?Q?u/Qxmg1IJ3friJBmj6oapWQvvDMh0ZAG9F6331uRzdrRSdKMF7rxwtO0zs40?=
 =?us-ascii?Q?V3qQkdjeeXqjD8THvdHXFlGgRQB147Obae5aWA4SN8YD7DKV9qmba05BDIeV?=
 =?us-ascii?Q?fEsleOJCfgCH9/Udo7m/JTOzGozjDr8=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: edfa0cfb-c735-4e2e-f5d6-08def406f7f9
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2026 22:06:30.1955
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ebgLwW5QVu3Bu/AGoePk2I3iW1AZX2vOe24TSivrJniXSe6rttD7M1QOC3yOpcEATRNlwvD2XJNCqTafqPkliBB7RKpAFCoSBRadsz8DAmo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6705

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

