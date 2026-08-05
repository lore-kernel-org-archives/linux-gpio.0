Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11023138.outbound.protection.outlook.com [52.101.72.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2056747045F;
	Wed,  5 Aug 2026 12:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785933310; cv=fail; b=pB368ybsBoI2JJehn8uu4ARvY4I8ggaRP4+CIVSeicew4z9/YFv4Pfl2KQjT1Q3VYYkYKzyvMJ4UcGeB8TJsbEaxky4UEkTJlE8oFzB/bOpeFoVFinQxFuDYhnaumjvYjplm7/NdFbhmvpa2fsQtoG5epeDUM0KYZ1jqIk49oEE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785933310; c=relaxed/simple;
	bh=xZQb+SjVPLelTusqi6yAnMNoyzK8xKmvAUeZfyrDzIg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=YAO3MzFLJuY5t6hMGD0S+aEIm7EGWad2HRabpLw+DUJE60CyZ4KvwIKgf6EhW1zwOvX7uqdi92P8wQIHEWEN6pYisS77FJRw5ys0m5/colZH6Xp82Ti5AIEQirNDKAE1NMKQIyNPnTlEtYeWEEqJL/96AGygVjyyOMTi5Y7Uimg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b=n/DDnKsD; arc=fail smtp.client-ip=52.101.72.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=genexis.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b="n/DDnKsD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SJjU+noI+5TD0P+5QQ/PyKCR4NIRzMYFKqa8aG2f/gNX7dgbbo+N8Y5EZtlE5FQzdRP5epUfO0XJcC3H/MgZC+1zxMVPn0J0fOgRw376cU/I0GO0NQSgD3PKvFs0NdA+gjWPzUlakMFdgxsO1QDO2Z2M9/0HOQ3wp6BUMVHktSmWe6HMnvn4vO2jq4MjsytN40t3SVslD1966EyB/mfCQ6Q6qdUXI2strt7f6VLm47oNtqBqCLpc6NiANhitEjPGjzmGzLOglGpGmFWKoE/cwkMyscFz7tsopyj9fX+rEsK6H/IDeU+4gKxhulPtHOHl1wcCwkfrcJwOgRGuriT9SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X/fkDc7eJh2y+f+7SUYre0Z6IHMvmUHaLWcRygeSWjA=;
 b=mYylN1jgU7/Tt9CQzZFfnYJsQk+8aNeHkgn9M1JteOXPG8Xg2cOoHsAjO+/tCsNGH2JP/WRgWIlOw1A6zQH2ZG1P21zjfB1J5yXtMWNZRI4AsxGvKEOiW1ODJnNs1PFeA8Rtmpe9jQQY6qVTapdoh+uBfrITxg3u+HFRCaKWJqAQegEkMgXfyx1gP2sGIuw7iwjwW/vMAnUmveffJhKqUKXaBAQU2s04Mw40ERrW04OmOsQArrPeKqggPwir6RnFHRgfqajbAXV7KkYSYjRIMP08uDYEhZ3X2q772UKaBupwrldHTEBwAdNETwCuRyLQtdhG9lN14ru00o+I+2YUEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X/fkDc7eJh2y+f+7SUYre0Z6IHMvmUHaLWcRygeSWjA=;
 b=n/DDnKsDvzl+iAQzUSBVF69MvVcDOalLXi2Go8F5KEMQGbbASUvw2LBerzmVzk8pHzmQeGwfGoHj2bnM3MOC4PmB3QWNp4nD77hxrRI9MBEz6kEabS1MeAX5cSDfMWc8kENFoRDZXHtvYr0asYx7NBqwTAGpKLSuixvcY1uFqMKDa8dNldRYM4aKqX7lFv94JiD8K9vyDCpD3zrUwSh68avHKRuEW4MF7LRTqPUQDmzh/+A/x2syveIUbe2Ra8MjCXNWDA6lp6Voo5Ej4liYliboqjGW7IHPenXfmDlGpnFGgyow2PwQP2p7Zg62I5JV615xKrFyKft9UCLG4103GQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by PAVPR08MB8918.eurprd08.prod.outlook.com (2603:10a6:102:323::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.19; Wed, 5 Aug
 2026 12:35:00 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0292.013; Wed, 5 Aug 2026
 12:34:59 +0000
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
Subject: [PATCH v10 20/36] pinctrl: airoha: fix edge-triggered interrupts handling
Date: Wed,  5 Aug 2026 15:33:52 +0300
Message-ID: <20260805123408.3767648-21-mikhail.kshevetskiy@iopsys.eu>
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
X-MS-TrafficTypeDiagnostic: DU2PR08MB10037:EE_|PAVPR08MB8918:EE_
X-MS-Office365-Filtering-Correlation-Id: 26f65639-81f3-40f0-c193-08def2edf664
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|7416014|52116014|376014|1800799024|921020|38350700014|6133799003|56012099006|11063799006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	OfB7NTUmk4Nn/IBSbSXN6hKzonj84iHCuxriCIxY4UpOZ9gBrrjdwKsfut3N94XoU+Na0byJtSc+j03J5wP8Szh8iZC6WhGhorfxnvvezk6RF+KW5s89+1FyjrQVVRcJp1C7CjkbZ8dE7BnJTDlGooMthky2NDsyOfLLNbm8oDOw4u5jTf63NsjOQeeJz9v2CoEJIV6LTN0xPwK1pWOlPy7bTLdDDlnOuLP81ju59Os3xs0o4E6ftwQx1356o3y883raAJ2PxMGrq33DUfyV9zld7d7z1CtjN+QoIIcWlWuNW69exx2IBWyz0uiKnjMbqyP7feRTWdP0JxdrRCrMuNqOG84cklT53l4PhAKM83DShIY/N3z8q2Ae7hc5Cww8GrR/VV119LCJSV8XwD04fgzA9s39gBUZWSPJUTkCEowqkDwAepqLIsvgzQAZ8zhQCQBMzw7F6WYdMicAvZoMV3btz5B1Z6DZFFFrRuotC0aHDt7661OwDYSHiq6Di8slK5cYguBDzQRRibo7ViZKEzNoU6V2fjrqzcRunmrjQ4B8IqLABqN2rKTwvU5NDXWNiqE6apeN98qxOSUQJK0kQKuVwVd0XnuU1FilIkPC3Did4onfhvLwLQzJczuBli6XxIgVkcKN9MtLwyiz4lLvOUM0Rf4XhVwpo0YTK/rhoTN0Eyriz4+YS+c1EYIDFc6aAq/oEyFEi4u7ucu5X4K5MlHSIJDAhkmrGhFdxBA6T/s12iJvG64+Ku/0YiyXVO2V
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(7416014)(52116014)(376014)(1800799024)(921020)(38350700014)(6133799003)(56012099006)(11063799006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?TP9XnbmNN8cEzLZOQNuEXbZ7RRfWOMtZs+ONQshwBbMV051BVf3Iq10rVkL9?=
 =?us-ascii?Q?JnI87RmfwijKz64uLcx4Ewptr8DL9ETALVFoAO7V8UJHfTrPB/hgqjVkYgtX?=
 =?us-ascii?Q?htdiZEX7l1Xzowlk7Nehgs6gikUXZPH1wR2Zdt7SnNeY0A5MhCu8gfgkXy4j?=
 =?us-ascii?Q?CTpHGxjlto77kyleFEL3MeZkDpqTyfq5unUfKiIpg9HTymGDwyrHZMIG6ksz?=
 =?us-ascii?Q?1tLtUlOztAWRF7pYHPYVxgw6rEanlnsW9jKIwmIOdVtC8xpVV41FB6ne+4i8?=
 =?us-ascii?Q?mYkvnPHUg5rCu7cj6rUEZc2WMTcQolQA4yUA4QrehmbqZMNKsiPCei+YvVnJ?=
 =?us-ascii?Q?nwlD5LMPoJBCRU4wPW8JXO6FXJJgefyXdQND/oFOzeoDOYo3npu3aDQn097g?=
 =?us-ascii?Q?tzrSGh2Bm5zyDMY8qkZjFOhgqNW7nwR45Rvrc1GPT0ovnbIjyX1US4viupUN?=
 =?us-ascii?Q?+xirygHTOo8e+4rqAH6ftMooSaijPiaiyheaRkkbBY2BgdcIooTAHM3wec64?=
 =?us-ascii?Q?OD6rdT5cJAMesqA2Y0QTqLIjbHnrYktsQJXCReekFy0jsEOHQSNeia+sFsMC?=
 =?us-ascii?Q?8+4UpVcJ52YRC+teTJhIEX+SbphDF7qhApTRcsTx13LzcJnuMTTQXNtAtrFC?=
 =?us-ascii?Q?XM+gO1Z9XKSrDQXOJSEyXtFa4j5wsYVitum9yZTv99u1b3hQYpX6peei3Zu5?=
 =?us-ascii?Q?SBdNJjImM5isfZkUxjgP84Vr/+FdmWwnPmrA7k25BO03nWYa0+Cxy2kEMNHK?=
 =?us-ascii?Q?/GD1UorLOfASbi4idiidMNO/hZ0rqHWkxliC6TDRnfr6BSJGfeunJ8b99PtZ?=
 =?us-ascii?Q?iVclLEdcq8hrtHAKJGUcNwAr+QTOYm0GSxg7QQd3Gogzzxax33l+2vvgHphK?=
 =?us-ascii?Q?OeuO+uxRIPFH/QaLcBEfJEhEzfi7G/Qrcuxckxrr1c11kwrtLWc+XWaiC9KU?=
 =?us-ascii?Q?Di7xSI0xzNS64qIqzAJaQf4FAuOchhCaymyqje6NHQcSNweEpsSz7xWoyBwp?=
 =?us-ascii?Q?DFWs1UwOkxrU/X66XB6u8Ni3JhLqSfBx7+ZmTRRnpFsNnSDM7BsM5/b1T78a?=
 =?us-ascii?Q?iIOHwzzvMV1eLR22guppnH90gNwgHoewOUlkT7sgGaYLqDrFErgRxkQyGqdO?=
 =?us-ascii?Q?01O7kt2/k0uP15HhxWAX+4dpqmsD3Zlmrctm/H8EGzBAKO/+Sw2YecgmMC9Q?=
 =?us-ascii?Q?IT/RdWQgOGdmFelY4VKIv1jSdQ0vByoy0/yg2RoCtwYB1gt+Cl9FIUH/z4P/?=
 =?us-ascii?Q?x0siu5ybB4w/NBNOauMf4KL/THjYzGIT3/JlYJ4NDMVgJX26gFZU4Xp1mXKD?=
 =?us-ascii?Q?thZQktNyTOPWHzr1PVI6ohf8hFBhXwvz8ITJhK9TPLO0txWkdouHESCCvLMU?=
 =?us-ascii?Q?evCxG5FMmQaY2CRiNH+6EKFTBY6M3AMdFGh3QfBdmk9KHFJQhwUtM5tSxXeX?=
 =?us-ascii?Q?yquSQlfj/LhYXFUZl5cv+9xXwvCt4pvW2dxxKdMlOOF+XzpEUhuBv8p0aMkH?=
 =?us-ascii?Q?P4Uj3xTYNBJHKYelVgc5ti6q8/ckCOBxUYHKyagZHsW5y7Y/JQqbRZQUudx7?=
 =?us-ascii?Q?zdoK28Yu8B/26Pj43py/jjz6UE9bIhFD8BWEzCad7mfYaX8XrhKMizR6hqwV?=
 =?us-ascii?Q?RcrlAAF92G9zL1FTNKQ5oU9bqFqxtielNuYba28Zj+BRJf6ywqEXuverlM9I?=
 =?us-ascii?Q?z37nokCYn5jxVW4HsW4SAEhC5cNVZ5Dlbz4T+ZK/R/DMNTeAdxhV7ozAbZo0?=
 =?us-ascii?Q?5Cgel4EZ9DlvGZseIjr2Oz6OD3mfsE4=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 26f65639-81f3-40f0-c193-08def2edf664
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2026 12:34:58.9990
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UbWW3c1v8BqvxoyxhMX1RUybrYqVgFuVMegdzKEs0am7oHQMZgdlxIxsz4F6LqJ+FgPNQVEzX+JNjITQm55OASUBbow3JbKeNAT02tUcJ9M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB8918

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
index 993b0d3d993eb..ddd86f13e4f9d 100644
--- a/drivers/pinctrl/airoha/pinctrl-airoha.c
+++ b/drivers/pinctrl/airoha/pinctrl-airoha.c
@@ -2628,11 +2628,28 @@ static void airoha_irq_mask(struct irq_data *data)
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
@@ -2642,13 +2659,25 @@ static int airoha_irq_type(struct irq_data *data, unsigned int type)
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
@@ -2673,8 +2702,7 @@ static irqreturn_t airoha_irq_handler(int irq, void *data)
 		for_each_set_bit(irq, &status, AIROHA_PIN_BANK_SIZE) {
 			u32 offset = irq + i * AIROHA_PIN_BANK_SIZE;
 
-			generic_handle_irq(irq_find_mapping(girq->domain,
-							    offset));
+			generic_handle_domain_irq(girq->domain, offset);
 			regmap_write(pinctrl->regmap,
 				     pinctrl->gpiochip.status[i], BIT(irq));
 		}
@@ -2688,7 +2716,7 @@ static const struct irq_chip airoha_gpio_irq_chip = {
 	.name = "airoha-gpio-irq",
 	.irq_unmask = airoha_irq_unmask,
 	.irq_mask = airoha_irq_mask,
-	.irq_mask_ack = airoha_irq_mask,
+	.irq_ack = airoha_irq_ack,
 	.irq_set_type = airoha_irq_type,
 	.flags = IRQCHIP_SET_TYPE_MASKED | IRQCHIP_IMMUTABLE,
 	GPIOCHIP_IRQ_RESOURCE_HELPERS,
@@ -2716,7 +2744,7 @@ static int airoha_pinctrl_add_gpiochip(struct airoha_pinctrl *pinctrl,
 	gc->ngpio = AIROHA_NUM_PINS;
 
 	girq->default_type = IRQ_TYPE_NONE;
-	girq->handler = handle_simple_irq;
+	girq->handler = handle_bad_irq;
 	gpio_irq_chip_set_chip(girq, &airoha_gpio_irq_chip);
 
 	irq = platform_get_irq(pdev, 0);
-- 
2.53.0

