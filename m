Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11023095.outbound.protection.outlook.com [40.107.159.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87F1D435517;
	Mon, 27 Jul 2026 17:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.95
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785174155; cv=fail; b=WXIJxeAtVSDwRkB+j8C8KEUutiJC/2jkYnLxJ+jzQGuRiCnmDtpmbBZwK7+l6ZCvF2nYOcn70/19/UuGnFedj+PPpOo9pY+Wi/JcwtPe6OcgzRDY9iMYWzNPUXZGvgPd0Cl+MpnspRYZdFq4IoA6UY8/ApKjYDv3ZjhlrY1/ne8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785174155; c=relaxed/simple;
	bh=0z8T5h7d6Y1Iig46qMaEriB3KHZiDZEXcybRfXn+sVM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=tbAFNWw+wpesuWdsm++2u/QSSHNjsXYlrqecChFOX/bR4kAAiKDMaf0ZwHXgH38PG2l3LRq087l5C+8d91oZhtJIo7Oco0KRdajxipUQIxUstvCkbpkQdFjCbkhalkseQlrUKCNSmJ9lzYL4kDasXrOKXOwVJA5MuemPwiB4aoE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b=knAmmlWy; arc=fail smtp.client-ip=40.107.159.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=genexis.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b="knAmmlWy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uedB/4B3Rf+8I/nq/6MJWM0i9LO3tBpg0fRQrLdTusg6rpLXfhJ7qvicLc34bdH/b2NApSQXSHe52edyoF0szLpjsHntGPPPdBScFjhyhiJNk2SZe0oXjLXeMBW22UNqs1oo1/cP+cqyt6SY7dV6KhsHlCi6P2ADkvndyR6uYANPw9x2LzcKwPgLpfZ9eHQJsIipI5ZFQTOa7aTUkYkKWBZnRKvKVXiTwUwKGttVf6+ni/bKLaeqeluvnoU0xAc2Xo9RRKUSM/t41agYPKuR9RHH9oXT68S8Zlf55rAWcLL/d1oF+fJW1nMmR7rRonxXSlJuUkhNiyfRtdLs8wXQAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eIkLvgeAgG3KUMhj/xtTp3GiCPBPVXelvLJ+HuNCke0=;
 b=GuzE7ub+wpXtsGfLj0oIZqBwYBcKAzbIauu7Tpf53ix1bCEKJC+o1gM26OomLDUBLLeOOzI+owhpvaOvDUnmnx3Xt9CLzXN3DTiVxLFueAweguL0wKc/fW5VS0AYoYPXQv2Eq2GRAzYinSXVhlwD9AFbMnaJxikhvhXbYYShC6C0e+JZW2D7GMeBx40LLzhcT4jQmiFlqOfYT+vjbA1DEG8vzWjYgu2SlFaM6pRDLNK4knWJaBoz0gwAPRksY1WeLmBpnoKIWh4iZ/4inMdvDYMVjS6b5PwwkGfPyI4auV7RFsWrzjYAeSqGqnuQkKySXh0g9Jwe91eW08aXT0c1lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eIkLvgeAgG3KUMhj/xtTp3GiCPBPVXelvLJ+HuNCke0=;
 b=knAmmlWy3k4X4lhvE8RVy3oADDF7y5O1TQfB0LStWmlfi4uQW/eZsgmy6BBaiNrRRsxtgrQp+glpMMiveIeGdVpSaFc+o754yHLu1gy3dHDSJNIIMhTVKDsEaQ9Fg3Se1NcFcbPVZgoC6hj6kTBKyOEvo7JSpPX80qvSl6SMNGaKk6vMW7CFw49U24BqqSxzs2j9C7T+HQg15nOjMMePupjfYGPCpwou9FUlvOtlMp704nu82LZAk14hn3japQzcxVgnEGHA+ZlM8atPlDp0H/4WGD8bGWEjAkClpYWbea2CDvxHX4hABir5w4HJ0ug7SuBYqEP45UQiQknHyFhmNA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by PA4PR08MB5888.eurprd08.prod.outlook.com (2603:10a6:102:e8::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Mon, 27 Jul
 2026 17:42:23 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0245.012; Mon, 27 Jul 2026
 17:42:23 +0000
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
Subject: [PATCH v8 18/35] pinctrl: airoha: fix edge-triggered interrupts handling
Date: Mon, 27 Jul 2026 20:41:24 +0300
Message-ID: <20260727174141.664933-19-mikhail.kshevetskiy@iopsys.eu>
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
X-MS-TrafficTypeDiagnostic: DU2PR08MB10037:EE_|PA4PR08MB5888:EE_
X-MS-Office365-Filtering-Correlation-Id: 784cabf7-7eb0-448b-7a6c-08deec066a51
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|7416014|366016|23010399003|1800799024|921020|6133799003|38350700014|18002099003|22082099003|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	3Wz93UJ3i+B5+4Ij0MX8KG4lm6sSOZ+RDaLaZQfE8stnBb48M7ZSoVRScBvddwL/qczixU30yvldNkFigpCirx1xnfKtaIc2ptgiTy2MqHHPAYJFekp9+KO0azKTqdD2R97R1R0lyIoy9pq5n5Vu+CWOa6AX1I/kEqXdbfl9cdEVuUc/i+iB91Tvs2yFbN1jVTZC76LI+YQONnKVcBecqFpHotujUg63Gi2TECptIim4AEn2WZuSF2jJkfvKgAXc7GN/aJ4Jl8n1tXPfRx1+BJqwT6gCFZJ/mOth5nTA6Li3Giq6YE9URnSqLA7Xdz2u/Xkpa5ygjNA7s5an5WrEYq64C2a4Ex1b2pwhGxRHDmUXrPzA9C3jVQiN+yUefQ0ofs1xSAdycY/GSq9RVYSnQL5QNtVCYDLYDvoFo5zdQJ1zJA7zHQK/IAT6shrjAyNuy7bsdW6EngrlVqErRHYx2RTfsXoLNeU4SZP46dFWm1ZQgzsjOqgp7k5JBzCVEOOFH16oYRPuqjbQc5qsxGVQSibEq/+qHZI+d6q5F3gW2UWEOjmGWBvJaBjpilDVQDpsGugk2Zg4YguH/3LYS+r1qEJ8RwF7EzJbPtlcay3HHg0ZGlC58evymCabZTIqK6P7tgK9RjSnXBgy7Ag+qZ3S7pVxS2ctQTmDtgcgqaOaw1luvQp7ygReZNuhPn2Vl2mrvRSqZe0HSSDKDo0zc3r8+qGJp/nwAfQdsqLwdDHEx1UIFX+8CIJjW2AiFXuDDSC6
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(366016)(23010399003)(1800799024)(921020)(6133799003)(38350700014)(18002099003)(22082099003)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7Zvmapz/DfxiFnvO9QWRgeypW28B3+kIY43aN2eE1CBkGLt6UHd3/wAvfbLT?=
 =?us-ascii?Q?erSfJPHy+4XzQbS8r+las7t797pegNcz6ZPyqmXjrRPvNL2H99hlM+KeOOEF?=
 =?us-ascii?Q?LKQhkYAwcEjL93HUFP9/4tUJ0xYHBTzdweykjBxXjtiEASiPfzdLuw42Z5P4?=
 =?us-ascii?Q?EF4m27TbFwRcHhQ6uG92vvgwMvkEl5FlZ8YdAFf7MNFGVp08lSVOlGrMQNfC?=
 =?us-ascii?Q?4PUCZnPaVKvuOYGlayrB9Wgo2bADHBL5LS4OBKfvJPoq/bAdAGNWHt8LL/vj?=
 =?us-ascii?Q?lMgpcbFffe8lVyJS1l3ApsJ8Yo3qu/Rr6wuCFCzCvETbtWvsh67YvG/LZEG4?=
 =?us-ascii?Q?LDuzP0jnpLxUE7kp9O8URdyVce3Ijh5APtC0QxqLfRb1OQs5ZQOfqVm8k9jB?=
 =?us-ascii?Q?djeD54mlVyvUgwYvzphAy3ZD1R2WyLy4bugov6WQMmCh0lTxjRwOjZRNxYDE?=
 =?us-ascii?Q?kkNhIfpvxxDFGRtIyH1tx0DU603keXph+h+fK4rXWfVI/d01MZc81JNCf2xH?=
 =?us-ascii?Q?PfmYxB8KkO4tkYN04TJCUo/l0E8dUJA3/EuCaSuKP5zytQ5hUzjyk7w5psC9?=
 =?us-ascii?Q?DuwvAccQe4OIE/3YQLj8g/Ak7/lyNR2Kob/ucEqT5Atz91JHoHy3dEtHWhPC?=
 =?us-ascii?Q?87LBh4HvX3qQ7LuP98awHCkSPttgOTUoLrY/fembccLwxnw7Da/F18O28JWx?=
 =?us-ascii?Q?QkseSbIeBtQHGhKmTlPMlfqIPc1HhU5V4ArlPU7NCbAL+KELggV5MhIjGBwp?=
 =?us-ascii?Q?RSiXS1thSylK38SP99nznfGeonLKX9+ThFo4wsien7bSWavqDi4ly141ouFo?=
 =?us-ascii?Q?+mymitmSPIr+oo53RrMC7+RJP6HKjni2/KhmYnpiA+OPexgeJ/+kiEsKHziz?=
 =?us-ascii?Q?/NpHdUf6d4vqWo7TsEpG0jMZZ56EvJ882G7Zg0j2VWxKZch/gawiHaev50a/?=
 =?us-ascii?Q?+e2XHOPkbsyTdXZHmi1sSIivl+QEPynjJUXdrrO1GsLbVIq0/bOAkGe1xvtq?=
 =?us-ascii?Q?fXxF/2a10IBhT/asiCGvbulFJGuFDPL35g7bB+rSN9v0lpBntBE/AA1Lfqy8?=
 =?us-ascii?Q?79uwd0hgJOHQBj5u448hpvQ4m9D+WBOwZLBR2612qn5GFh31hec15lTZuM4O?=
 =?us-ascii?Q?bJnt1kMSkni4S4Tatgiyl2/PC8fQz8v+n094JCVAuNZ7M4kfioZVxdsW3mpv?=
 =?us-ascii?Q?fC9jkqHHdM8tUX17Tx+zvIbHiTFNRXqAVFKCAQkS9ixEdj7vclph+OHVBtHP?=
 =?us-ascii?Q?j6v/f748cLG9QgqVeoXUZSX9pwQWpCX3w+qlrzD1YGFtl4J1AVK2d7yeLTb5?=
 =?us-ascii?Q?6vsfNm8VFzh/5yuli9eSDV9PYVCOpkvP4FDBqCj97IsJDybfOM5tLncsHAT0?=
 =?us-ascii?Q?OWaNH17/VkKeh9X3Q7H/Gv6gDJ5vbU0cgIa6RWcEXFB4lpVE/qjOGWa9GdrE?=
 =?us-ascii?Q?oEgqvBYIuh+ZlH33/N9jrVHMUiZlD2bcORvSXtGWhZrqmP9quUnLZJohF4lx?=
 =?us-ascii?Q?MQDrERMoONUAYj9HJJPNKC9ktUEaRhS5jAnP9yM9NP5Te96OuyouEJj8n1xd?=
 =?us-ascii?Q?fHE+ci7RGjhN/ytU73eweWei0sPfTLMJaUZzHeZQYYUeYcd3355g33qKd/q4?=
 =?us-ascii?Q?expRfiGQtxR5XIqTMJhUZbDC8cgDwgZci5sL/uwXq1e+Px/4V5wZzP9iUmBs?=
 =?us-ascii?Q?YfGBTzwFtWdRKm2o1YhdFwiN20dPlIzgW6ylILjbrXcoBTSxBzaNZK/tgXot?=
 =?us-ascii?Q?xbc8ZaDlTgywyuP2r/oY0nt5mYMKVZI=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 784cabf7-7eb0-448b-7a6c-08deec066a51
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 17:42:23.2266
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1J5GHfaOIl9HiG+3BpHHmxDBP6qrxWWgDguNaEPwjVh/cQ0ZRoDUNCVD+v1UsOV4132ab4oOtRMHBYcIili0dheYwleFnEDf1sjNfh6f1D8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB5888

Edge-triggered interrupts are handled incorrectly because of
 * no irq_ack() handler was defined,
 * no handle_level_irq() handler was used,

This patch probably fixes an issue

Fixes: 1c8ace2d0725 ("pinctrl: airoha: Add support for EN7581 SoC")
Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Acked-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/pinctrl/airoha/pinctrl-airoha.c | 38 +++++++++++++++++++++----
 1 file changed, 33 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/airoha/pinctrl-airoha.c b/drivers/pinctrl/airoha/pinctrl-airoha.c
index 011a4d447e250..723407a59c05d 100644
--- a/drivers/pinctrl/airoha/pinctrl-airoha.c
+++ b/drivers/pinctrl/airoha/pinctrl-airoha.c
@@ -2608,11 +2608,28 @@ static void airoha_irq_mask(struct irq_data *data)
 	u8 index = data->hwirq / AIROHA_REG_GPIOCTRL_NUM_PIN;
 	u32 mask = GENMASK(2 * offset + 1, 2 * offset);
 
+	if (data->hwirq >= ARRAY_SIZE(gpiochip->irq_type))
+		return;
+
 	regmap_clear_bits(pinctrl->regmap, gpiochip->level[index], mask);
 	regmap_clear_bits(pinctrl->regmap, gpiochip->edge[index], mask);
 	gpiochip_disable_irq(gc, irqd_to_hwirq(data));
 }
 
+static void airoha_irq_ack(struct irq_data *data)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(data);
+	struct airoha_pinctrl *pinctrl = gpiochip_get_data(gc);
+	struct airoha_pinctrl_gpiochip *gpiochip = &pinctrl->gpiochip;
+	u8 offset = data->hwirq % AIROHA_PIN_BANK_SIZE;
+	u8 index = data->hwirq / AIROHA_PIN_BANK_SIZE;
+
+	if (data->hwirq >= ARRAY_SIZE(gpiochip->irq_type))
+		return;
+
+	regmap_write(pinctrl->regmap, gpiochip->status[index], BIT(offset));
+}
+
 static int airoha_irq_type(struct irq_data *data, unsigned int type)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(data);
@@ -2622,13 +2639,25 @@ static int airoha_irq_type(struct irq_data *data, unsigned int type)
 	if (data->hwirq >= ARRAY_SIZE(gpiochip->irq_type))
 		return -EINVAL;
 
+	if (type == IRQ_TYPE_NONE) {
+		gpiochip->irq_type[data->hwirq] = IRQ_TYPE_NONE;
+		irq_set_handler_locked(data, handle_bad_irq);
+
+		return 0;
+	}
+
 	if (type == IRQ_TYPE_PROBE) {
 		if (gpiochip->irq_type[data->hwirq])
 			return 0;
 
-		type = IRQ_TYPE_EDGE_RISING | IRQ_TYPE_EDGE_FALLING;
+		type = IRQ_TYPE_EDGE_BOTH;
 	}
+
 	gpiochip->irq_type[data->hwirq] = type & IRQ_TYPE_SENSE_MASK;
+	if (type & IRQ_TYPE_EDGE_BOTH)
+		irq_set_handler_locked(data, handle_edge_irq);
+	else
+		irq_set_handler_locked(data, handle_level_irq);
 
 	return 0;
 }
@@ -2653,8 +2682,7 @@ static irqreturn_t airoha_irq_handler(int irq, void *data)
 		for_each_set_bit(irq, &status, AIROHA_PIN_BANK_SIZE) {
 			u32 offset = irq + i * AIROHA_PIN_BANK_SIZE;
 
-			generic_handle_irq(irq_find_mapping(girq->domain,
-							    offset));
+			generic_handle_domain_irq(girq->domain, offset);
 			regmap_write(pinctrl->regmap,
 				     pinctrl->gpiochip.status[i], BIT(irq));
 		}
@@ -2668,7 +2696,7 @@ static const struct irq_chip airoha_gpio_irq_chip = {
 	.name = "airoha-gpio-irq",
 	.irq_unmask = airoha_irq_unmask,
 	.irq_mask = airoha_irq_mask,
-	.irq_mask_ack = airoha_irq_mask,
+	.irq_ack = airoha_irq_ack,
 	.irq_set_type = airoha_irq_type,
 	.flags = IRQCHIP_SET_TYPE_MASKED | IRQCHIP_IMMUTABLE,
 	GPIOCHIP_IRQ_RESOURCE_HELPERS,
@@ -2703,7 +2731,7 @@ static int airoha_pinctrl_add_gpiochip(struct airoha_pinctrl *pinctrl,
 	gc->ngpio = AIROHA_NUM_PINS;
 
 	girq->default_type = IRQ_TYPE_NONE;
-	girq->handler = handle_simple_irq;
+	girq->handler = handle_bad_irq;
 	gpio_irq_chip_set_chip(girq, &airoha_gpio_irq_chip);
 
 	irq = platform_get_irq(pdev, 0);
-- 
2.53.0

