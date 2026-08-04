Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11021116.outbound.protection.outlook.com [52.101.70.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC5BD47ACFB;
	Tue,  4 Aug 2026 16:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.116
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785859516; cv=fail; b=IBZpzbJJzd9XN0xMqOOTVkbNQW89LUpWylJGUUzVxZjuc3vTq3kJpQ4NWAKHuEA0N25avy8J6FLE+P/frHsNZf3SsTAgTpeAXlX0ePQFbnsxTbrZ8qnh/PpOMj5pF6JmVlkExw9XrXlpaoycpYnrE64FYvFJU9nJaOxA3J/yn98=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785859516; c=relaxed/simple;
	bh=HMnIltI09ZBVGEQC1EpSpHwarWUnrr+hlFDAV/EdenU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=CLWE2iUeqNWDqYi34JmMWG6ZynKhKRBTP1Tj54KrVD/N7uEXtQMS9jda87zOHa7SbzHDGyKrTyErp6JiR4cU6Qz+xhpQeEvFkzJK/Fivm4jUuU2fa4j1zBPaSjX1H11cr4k1XnslZUHPp6bpB4bLHL8h5QNFSaQRE0zJ+BI2AXY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b=eq5Gb8c1; arc=fail smtp.client-ip=52.101.70.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=genexis.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b="eq5Gb8c1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sjLM5Z86KeNXFriVtZ8HMCn/EYBOc7oX4BDh61r6wSXnaZ6eYrMt885nPez2F+TPvQvmxPBQ+idu5sWbCFpd2M9IzqmOXPYRJqA0k9hBKd2R/A/AEhmXBgAYVNOhJOk5p0RVGckDLSz+ib5eBC3n0m6v8mF90R6EbcqDxcxPSoImbZ84gORc9VIvnaccf46xLBRyaPyw76+9DWmNwn7LuUu2q394AIEEfBkdGUfj0TZ9q3XwXIxFLRYD0uFtpCXSIui3yOMZKJvy+bZM3glESnljRU8wtUBf6jGexFMbC4it/1TMtqSkKObdGd6uccG34BdBy5NqVAfm0y9OMyVSCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I33uDpglcvclDQbZw0UGiNWK7a/sdks26iLZOt6LuyE=;
 b=xbJwCnT6yHZCI1+Nng32dQA8yIUMjhZQCVGiPWOpDqvuPf4yyBuY/0eDPF5vXov2v11AgdE3ziWWPYoa56UfyQJKLrbPD7M3nJvyBdULMNssF+G3cuXkvh4ykHfra8N6tbpsZ/cnst6QF56WNNsC5f+FlbhsjL20smxyCYaMq2EPjW5NgVUPc9uPEFtwTHVP022hpUId3LxlSJy6t80ncmI5sa4w8ELo6pGQr/bP/EWa1+q22JB2ZhNsIQcXZ4WosGnBxpSmPY+AVY6J7tr0h+uJ3OoJgSIUZDjZJGLAHR2KQkqopa89bk4/p6WHbTHLkpGEb1MQ4cqNEmC/L4Ah6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I33uDpglcvclDQbZw0UGiNWK7a/sdks26iLZOt6LuyE=;
 b=eq5Gb8c1Kia7OhDa2xdhHytqxy7RFEd1IqaNe+bZVtwXm9FVnAoMjwu1dTBYcKQh6VcC11Av9S3DLdXfWl4UEqrUMlucgwrk1rHHjq1bSJzKOIwo1U7t2bVsbgXYzQXZLoQWsdGCsUzG44vfEGP84C259aNTXJvI2Nfihw2uUDpYoVO9Z7X7zYt11kVU0zkBJnU5hB0U2yaCu0JIjqxVAoUr3s0jnnOw9vJ7r4F0mmgwM7E07YeiqrVFnWKaJD9Jxus4bnsDY8hhQ3nomgkUXtBuOEaCeYJRmNkG2byhIfIKaOWcz1FahLK3SQnox/GEqhkl5GnVMCh+wlSzpNgI+w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by GV1PR08MB10792.eurprd08.prod.outlook.com (2603:10a6:150:160::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.15; Tue, 4 Aug
 2026 16:05:04 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0292.013; Tue, 4 Aug 2026
 16:05:04 +0000
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
Subject: [PATCH v9 19/36] pinctrl: airoha: fix IRQ mask/unmask code
Date: Tue,  4 Aug 2026 19:04:02 +0300
Message-ID: <20260804160419.3592327-20-mikhail.kshevetskiy@iopsys.eu>
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
X-MS-Office365-Filtering-Correlation-Id: d40e98af-7021-4d70-cd5c-08def2422531
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|52116014|376014|7416014|1800799024|366016|38350700014|921020|56012099006|11063799006|3023799007|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	WhLvTDI6+oXF5icQUjyuhnU+LQpFVC0Rn4TF+FBC/6ewfoK5evqUkhe2q8lYi5ivm2k5oCRCfS+nNE6SxXN+rbLeof3iz0pB9Ja9+aVmIKCyj/LvuDUaA3+quZ1P7Ws5FBerPCcgygu/hIfSa3oQpZCgAmYVxh7Ptz7MaOe9q1l/HRTCh8rXck34ZYm5dtx5fHaba7JpD0afN1lVjjoRz7lHYCXj7NzWRWv3yRSd/SfuC2P/NKvt1NxdBPbmHJ/t2TWF5vhpDIAJmhbbU04BUoQZkgWSH5O8O/hf7gtWQSwEaKnpBNxervy7OUI1shm2+wwKi8vpbf6o3ZS54cdZ6O4ejyH7sOdexd3Ynmm2lzBxXbT7uoZrbBLPLRaG2hE61bdsKXzEfWna7E7HVTmbJc5BPuq3bQwpGqnvxVIeMCgD3G4SvKYmHU07e/ReWXHK/wDxjn0YgJn0Klg7/LyTZe7rUOdbq9KbXP41LPSvy1OjDO//Es+ORkvMi6SDPp6Tw8iEM4QuLjcGe9b968Oqj/BXybH0WRNFDoj63QBev++KNF05eAa7uzvl23t+iLPS6NLU81YXi9n6PB6O6NfxadM7HFCW3dt3B31F/fDcTNG4nNSvKz4E1IUk11MDl/RocCShZLURYDMN23RsK7fWita/h66wogJx/Vv6zNXKsNzN+Nwbr4guEcPuTfVq/FKcwW9F4+Xb8uV/u/0hUBpiqBntkG3vMr9kYdTBcMVE7kMTLbo2+k/p5XEvxFerC/hq
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(52116014)(376014)(7416014)(1800799024)(366016)(38350700014)(921020)(56012099006)(11063799006)(3023799007)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?YF/llMidD4ZDJZdqD9P5MeXYHo+NocheLEyNn41sIf1/JkM+aMbmNxUH7W44?=
 =?us-ascii?Q?2r8ePdRZoDqM8oiVH4VCB88b5ROsNur+CpsBYiow+jPDcOEvFK7hVGOSGWSq?=
 =?us-ascii?Q?DZl1eUpQSffnDbXTKsluKgqgdTikOiWneXMFelmO4bpgzwnZUsbM0mGymXKV?=
 =?us-ascii?Q?WrnhmlU1I+7DmrVv32tE61JC2QL5I8JQ8Wf1Drf7Vqr6eHJ6Y7/DIGypT88R?=
 =?us-ascii?Q?iirNnwgf73xWpXukhPwI9vZtcw+uCdn5d+i0kbrM40jc2+sljg4eNU12Zvgs?=
 =?us-ascii?Q?S7UpujCrr3mOp4lbzVpp7E2BXqW7ekaxa7h/gIHCz8KaGzwfoy9PPJqjh045?=
 =?us-ascii?Q?TtpxNqm1JHYwqwhpEFsDI4pc3YNg4g4AkKLTr2icrotiUoNBBqpMWh/FDd+3?=
 =?us-ascii?Q?IomhrlWihYogJVLSio7RiANpfR+vkFHqUbPwm9TRVRoJqUaBzLrtw2ZEdLuG?=
 =?us-ascii?Q?Cp5dA9b3xegkyluwIvoC8Ik2ZbDJ+ere4Nbnyuap4066yEzwxX0su1GH+U3O?=
 =?us-ascii?Q?aIdJ/nEyP40W+n5U7SAL1Tt88N3GKf7vbUHSY8TR8e8IKp+GsBvNwZKYRwFn?=
 =?us-ascii?Q?qXG4xozF3IjueZ2XrLnkuy9Vd8GkC5/pwdtGNIlPo7lT5ehrCGADf70c3u3R?=
 =?us-ascii?Q?nz9lYXKo8uQPe0yryjwlqgqHKAkBQmbPM3Pzn+RvegWZw5GjkR5LyWA1m0oV?=
 =?us-ascii?Q?4FrjOLdRgsfIN84vrRXN9oCxSWOFESR8glxD/en0zpzLplSkXLdbZUVFvkP6?=
 =?us-ascii?Q?hGEvW60xkDuyPhMjBBhZPMWG1YJD3DnwuXWKH6c5xj1iqtWMpxHZIrkatpq8?=
 =?us-ascii?Q?98Tt+U5PJElO3Z2fMRE4gN5VTdOQylyzTB2YPswKJ5S4HtyDN3tdjZ4cWon5?=
 =?us-ascii?Q?RS3gydX8BpcwUTsR7otD966b/RRN1nfYcAy2FEN7jGDolILEVGgLd4mu0A6c?=
 =?us-ascii?Q?zVxNlkPDGmBDWLLhsGz5oKWn/vti0zckSw33KYd8Aqsf42xPwTWRs6cLEodQ?=
 =?us-ascii?Q?+qwlf2nssBb1k8POX9MjOmWr1a3HmWyyBFcfllDuIjAZGihunFKkFZ5eSj8j?=
 =?us-ascii?Q?NUi/rz7Xi36lJXkIvyBgmtziqo/lQiLrmaNuWiaVjfDkkORU3DHivz9765K3?=
 =?us-ascii?Q?Qjiq9s0RZJ5cRU1NpU+VYHVh1w3HnBhs4sckZF5DQ3C7Jfgw4tVTXRaS06OB?=
 =?us-ascii?Q?jWZVQtzDSKRrKM3o95X2SrS3+lq87CHb8P9FGBh4aPEvT44jVUK0tZTRHgxk?=
 =?us-ascii?Q?OBp84VeJ9tyubedtNOyTKAjPfpdpPXbwpGVfCC+mH97z1Vm4CGF65pvUW0BN?=
 =?us-ascii?Q?HpOU7OdBAr/dS8QgaWvU8OEnpP8N89j4tVxCw4QSAIcXLOdeBXZ+1d3jUysz?=
 =?us-ascii?Q?3SF2PqyE8C/qVlGtjAFHGzHVWiECkT8y6hErSQcSCuzpEK1BWIRdRj8FVJ5z?=
 =?us-ascii?Q?sNFJ5hLwIftziADGEsbVsaqXy8Bd74ypL0o6fTbFX4239thgyggU6aa33bMY?=
 =?us-ascii?Q?2hejq24BWEW4Kgcm99pHuT9DmYWUtuZL6IlBMQ6oZvHhTyo9dEv96/+1ooJ0?=
 =?us-ascii?Q?dMXNjDefkW6/jqO4FzSF5p/z8aRXWlyYn/P15ayJLkclvCPc8zEdaIvF+Tul?=
 =?us-ascii?Q?jmTluGoDg/hk17HyuRHJgNEOpHRvuD3M4H9C3PQ7udZt0QBuMUPhY8pGvOcs?=
 =?us-ascii?Q?enSTxI05ew9KUq8IwrUgyK2vN158OQY0SE8udHS7Xqx0uAtXAN74DLcQOJcB?=
 =?us-ascii?Q?YzeoV+m4mpMADUCAVniJL51VVD8+rTU=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: d40e98af-7021-4d70-cd5c-08def2422531
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 16:05:04.1196
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2pkaOtmfXEMOvYXdaJp2WlnmucCP+oWGaEbAOMpJAZJBl8fhIaC3fqm57IhND+zB8dhyLKkobR0tGHy2h9rbDZKxARuGgIojYkU2FRJMVaA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB10792

When using IRQCHIP_IMMUTABLE, airoha_irq_unmask() must manually call
gpiochip_enable_irq() and airoha_irq_mask() must call
gpiochip_disable_irq(). Without these calls, gpiolib never sets the
GPIOD_FLAG_IRQ_IS_ENABLED bit. Because this bit is missing,
gpiod_direction_output() will not realize the pin is actively used
as an interrupt.

Fixes: 1c8ace2d0725 ("pinctrl: airoha: Add support for EN7581 SoC")
Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Acked-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/pinctrl/airoha/pinctrl-airoha.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/pinctrl/airoha/pinctrl-airoha.c b/drivers/pinctrl/airoha/pinctrl-airoha.c
index b4c61fa811fb1..db9701be851c8 100644
--- a/drivers/pinctrl/airoha/pinctrl-airoha.c
+++ b/drivers/pinctrl/airoha/pinctrl-airoha.c
@@ -2595,6 +2595,7 @@ static void airoha_irq_unmask(struct irq_data *data)
 	if (WARN_ON_ONCE(data->hwirq >= ARRAY_SIZE(gpiochip->irq_type)))
 		return;
 
+	gpiochip_enable_irq(gc, irqd_to_hwirq(data));
 	switch (gpiochip->irq_type[data->hwirq]) {
 	case IRQ_TYPE_LEVEL_LOW:
 		val = val << 1;
@@ -2629,6 +2630,7 @@ static void airoha_irq_mask(struct irq_data *data)
 
 	regmap_clear_bits(pinctrl->regmap, gpiochip->level[index], mask);
 	regmap_clear_bits(pinctrl->regmap, gpiochip->edge[index], mask);
+	gpiochip_disable_irq(gc, irqd_to_hwirq(data));
 }
 
 static int airoha_irq_type(struct irq_data *data, unsigned int type)
-- 
2.53.0

