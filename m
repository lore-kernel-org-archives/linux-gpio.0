Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11023130.outbound.protection.outlook.com [52.101.83.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6547A3E6386;
	Mon, 27 Jul 2026 07:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.130
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785138203; cv=fail; b=ayhMhtCc3iw9GKfJgd2Ii8pieokCRs0dPeKOPzOcBbZtlso5+g9TwbPEHWNx5CrYqa8jYHpfyr0Pf/HT3bRDYia6ICZXEYXR5UmJQnHtQZbfXkBvFuL6hzdRZcD6zAinrOMIOd9IUH7sGb/HvOY14EnbX9Wp/z0P50S/PLLyMk4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785138203; c=relaxed/simple;
	bh=HTqqjiCMJ6JOH0jXY+dTDbtZosLw3ASswH5r1y7Qqs0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Afoov5oCKh+AfeBJHSV8vUbiSVekHjjohcPZw5lUevSK/m5Q5PrAzSNVEjASaSlBolC4AYfaeAgI3OzRu2CeZvvu00DP3i/wsmG9k1zLR+dD53qomhdGU9aPoV/0MKpEWoPHqvHU9lhIzIZngIQ7rx9Og04IzelfXSxAKek2CHc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b=BBgje8mr; arc=fail smtp.client-ip=52.101.83.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=genexis.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b="BBgje8mr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aY6TVvLK5vtAXornVeaBQz6kXZZKBqgcGvQkAr0kYW3AFy0enTUyfTAKsPiib5tbW66R4g6zNK5JbvJ7VlPc85EF+DN9IyAlaAvQHNyHejUMjMLSYmi4H817ImYeXcZ8JazrASqrqxpKYKleY0vjsGN4isjlahVqQxe35l26rkD3zD9YmUbuU51VTji/bBrHhdeHSVKae3/tziKLkLUGlOLglNpqGOpNzFgR1AObDTCHONDRXET9UKOl9t/S/AOnB1Ye3t3jlkzLhVLUpObOmrmunl/4KoLPiHWLpji8UVx0F5tw/exxGcr/7qyL95ltduswhaw9mAdloMnO7y9ZUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rtnmZVGONEFbK+NWOTldHnFOxVlaaQBwy27iFXAQxUA=;
 b=MniyGbL8AV1bvCNlQDlKg60wK7K5b8aqDamfa7o+yEEe+nf5K7LnFRJKW45XNph/wFWQp9c7i8MfTItMNv7SxODldPXh45oM5pbHAYj1hnoJEqbReI7llA9INr9PiLLNyKeKdh2BM+5J/xKPjDsFvvlJGRqZLkPnUJk2mdWLXKYY/WPHQQp6zau+mX1PxZXpz7jTxvL7/tjHjGagTBOR+7+kcviGGf7ZOMa++7ManvA0wVAjGpdvHg6qdGWXULVIWs0Ypqce5mU0Jx93h3Tbp2GscyFYuUFo4GfeYS11NpBKeWYLdmKNmYsB6CT9+VGGYVAxY86FfycoW7sqYYkx4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rtnmZVGONEFbK+NWOTldHnFOxVlaaQBwy27iFXAQxUA=;
 b=BBgje8mrgz8GRUznSlafcVhpXB9DkbvmMI3En9pzZaA1mo8xNrsNCTu71zwpBifkSnm6ZBm9UGR6YMbTctV0QBV6joUQ8SB1yjpoUvKRyy0IlKq8f4XpqBkNQN7NvxSLghkAd++w4klV42r3PHgbY1FIeLT+c0DVRdRvey+ePN1wddn7yOyjabVAboChYbQjfc/wE9ttNI03TKpqA5d6jQTUyaOIHvDz0SyyVZvGXCDLWr5qCL+fSO24mYPWzXuL2rYE0zqUz3uTzPVi1sa23JHH4cg3RJ/gu4a/t46M/XLYQYouk8NPKFXS4/i/sCvS+24wFnCC+5jvVkkj87dSsA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by VI1PR08MB5501.eurprd08.prod.outlook.com (2603:10a6:803:138::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Mon, 27 Jul
 2026 07:43:17 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0245.012; Mon, 27 Jul 2026
 07:43:17 +0000
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
Subject: [PATCH v7 17/34] pinctrl: airoha: fix edge-triggered interrupts handling
Date: Mon, 27 Jul 2026 10:42:17 +0300
Message-ID: <20260727074234.3761170-18-mikhail.kshevetskiy@iopsys.eu>
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
X-MS-TrafficTypeDiagnostic: DU2PR08MB10037:EE_|VI1PR08MB5501:EE_
X-MS-Office365-Filtering-Correlation-Id: 307dc4d4-5c0c-4d54-044f-08deebb2b90c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|7416014|366016|52116014|376014|18002099003|56012099006|10067099003|22082099003|11063799006|6133799003|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	Eb6EDehIeEDLZy3kSrFW4Bm3LYilR9g7aBk4ThBNKknwSNiY/a3q4gCwQGxANop4i6tefx3v4NVcjew1PUcrgUTtdcCnL14aA+Kcx7wc09/2jhWe47pwqo4OXdvT2UUKlLiKrL8kfbjkImKFg2XW8Ce3CaDnucOwzTId2dsG8DE3wZPu0D+gqCNgfOeS9wb2b0hCtq4ha5y93oSqAfalV1dnwXa/t+KuxrH908YJhcKR07BW4LR6Ji73WLY53ganr6Vpycnp231lmGV1W/UlDNTmMkar3lC83UWzW1cN9lbAal1kE+mhRCFS51MVZk7uU0T3QRGQypJfzAqaKWPmBYd/TE061OtDnI3ymUh8fdw8B8CAY+MxtCCEIxZyaEumKtea5dIkm44A072wJkkQGEEu/whkmqEKv7V0jhKwAT3TQmK4lu1i7vU4iuzdbAMVnw8N/pluKiAyXIgrQhkSp4nCZtqt8AAQNHhIPs4ujcbp5cMRIb4BSnAMabua9Tf8iaQ7bQ4GKBPomDA5eetAE99r5weVtEtUc4/5knsQN9ybzPiBPOz3ngn4rO7Qtl1G33QiHGCVBQEbL+67QUk9FdrGN3MuRr53l1QRajFCHYTZ8ML+Oy5BJkcmL154ZBb8Vd9QpEtX8dT+QCW+EPuFhEhn+Paq2wLGXFJS1YOCSNv43jbu7JkGI4Ws1ZMCbXL+4dHetxuYySCZAhEfEmSck6WzQC0GzXtAoM0G1rh/PhM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(7416014)(366016)(52116014)(376014)(18002099003)(56012099006)(10067099003)(22082099003)(11063799006)(6133799003)(921020)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?83j9ds8h04T8JTgjyzBEltLtXlZFePNbrK3ew3Nv7JOO9WjTS0GxR82kZlo6?=
 =?us-ascii?Q?dtfE2XFhbRsnOaNTgsTRzh783wl67YhYQFFrtqeFXFB27AwspPBfVNnKKdjb?=
 =?us-ascii?Q?T6jZxi0MjByT263fxyIEhSwDcCKdKhxC0U6eBDp4IQ6h7ljq3ZbU5puY7hnf?=
 =?us-ascii?Q?+UQEAbgbZRgcWgwCgonSRJnpUE4NGePTyiG6W1Y2e3HEYHhvgZ2ullsy5/x9?=
 =?us-ascii?Q?Aam366cC2pkF/t0N8mV3ZuYh+tpPGzO8/35+sdEHfqtidpqsH07tfXFqKrIZ?=
 =?us-ascii?Q?hKDAvt8KoQAMqKs+EUzPJdgWGr0cL7pbH/QMc3Y6+U+Shr5D96FyeyveJ/tP?=
 =?us-ascii?Q?1tLmNmsNg5TtIfBQvIkIu0dHzD9zUqJXUF7eE+JsvurSNjWlq6GTXglaXcIb?=
 =?us-ascii?Q?n0K33lHfksIIb8RcVKx3fUHUZ+83UvZIuv3bCVeItu66FSvTR26QK9/4WT/k?=
 =?us-ascii?Q?F29CaNIeNadPg7IjxJh5jKUAk5smZb0cpHnrLHTqGuDp8jQRd6WWnVVF5r94?=
 =?us-ascii?Q?Q7XJtHT1rhdhQnGhe1ThUkWEkgAkCym+q6qEn7Sup/FYed7jsDsQHKDppJfm?=
 =?us-ascii?Q?TjP2L/t3HouXjn8dM/jT6SG1m2Q3WYi/5nqlmwGZlhc2bzlSXtdhlYGdDt5V?=
 =?us-ascii?Q?6+FAOSh1je9L5taKnRona+nu0VghwuvApMGnSKLt8C7BMxiDBCfEqHmbLcB3?=
 =?us-ascii?Q?VR+NTdOYhIWlTuqIXlO9bEkCQROIbtgLXpO/+ffTghhrdQQv7sCw8Hz512v6?=
 =?us-ascii?Q?U+TpmCMFs1TZgOlaZfxwCJClmbP8wq5p0akscJFq5+7fEpoPzVa5lulGQv2R?=
 =?us-ascii?Q?44Nj+aAcAogWN110CmDm6Oyx0QapFxxTiSgua0qjEpiQh4FIaxf8NrK7aOES?=
 =?us-ascii?Q?kYdqLNMQc1nwqpqpxaSTIECrMcjnwSXBo0w28eA6NtrFwzWFbeHNGtvt/pBu?=
 =?us-ascii?Q?bGEPeITyw9IUG2t/nrcEFO4z0O0SzvByYpgdfNOw5X570HZtH6mVaQ/vEcDQ?=
 =?us-ascii?Q?r/Lg9O/CaZgVpqmUN1L6+GO+qxJsUokHacRGI6yiBYLiwD1MNWD1usuN80yi?=
 =?us-ascii?Q?lXF0NapRrGsuYsitAqYgDqXE7quYF9dsWkMYc5kYGfOT3/AL+OeNdN3ZTfg5?=
 =?us-ascii?Q?a1jwW3kLl0MTA2HD/pJNJ6sAyVWPeStTv/PYRjLcdl+C+c8Q9+4hNbqY2dOV?=
 =?us-ascii?Q?7VvbDqXl20uZ0kuHGGb9I//8LbU/NyHxOaZoq6NkfKxsWt4Npa8sXqfYaBVd?=
 =?us-ascii?Q?1BtFJDojtvxUean/+W5r3Clby7Q0V3XY5iAWaMbiSJ9BhSAD0kjYWRLrNuuC?=
 =?us-ascii?Q?YGK4hMP9SI9hIn/Mw755PmXDCRviYpAHT4IiUHSyiOjKS1jtYEooTB5paOej?=
 =?us-ascii?Q?wrtdiA7RAXpsFmeW/8fB98W+X7ja3ArkAhR7oK9c/zxxD9awXWdOl4jaTQwI?=
 =?us-ascii?Q?gYeCTJZPtzgeRUEcIZj9EvHR2ZMvFp1Qu84L7lAvySokZcZtXF9JNXfgXNng?=
 =?us-ascii?Q?55sBV5wWtW1rhMzkvWWkGQ2ygVl1nbQPI02xoNIf/I+czMX1qWBEHH9blGfp?=
 =?us-ascii?Q?dM15FEuAwMC+5XiSLT1yfFryLy5PD4WjFA+Azl3vHggkICNmEti1mwzTZ3aF?=
 =?us-ascii?Q?fxiP8h7uQRKw4EsJP7ukQy4sTNJWTIrW2qxAeEW9/Lc9i5RFd+3zOBgdeEna?=
 =?us-ascii?Q?2cGHKAMaHvVU9cns27IrMpoISdVzkQe4gBed0gVdAcr1tNg3WN5cfixOgCcX?=
 =?us-ascii?Q?juMCtTPH4WmavX+5T1yBOajdW4ZNjV4=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 307dc4d4-5c0c-4d54-044f-08deebb2b90c
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 07:43:17.6728
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hV6WaiNlgiNNFo+X0/3/hYlGVy3tooz9PlKQYV4q1e1uvIfNuw5G9Kf7zvSpkRAfEeoxXyfF1j2t7gmOJBu+3P2QvC5hdLl3PgNHqZ1KCzk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5501

Edge-triggered interrupts are handled incorrectly because of
 * no irq_ack() handler was defined,
 * no handle_level_irq() handler was used,

This patch probably fixes an issue

Fixes: 1c8ace2d0725 ("pinctrl: airoha: Add support for EN7581 SoC")
Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
---
 drivers/pinctrl/airoha/pinctrl-airoha.c | 38 +++++++++++++++++++++----
 1 file changed, 33 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/airoha/pinctrl-airoha.c b/drivers/pinctrl/airoha/pinctrl-airoha.c
index d218a1f01648b..df3a1d7c7b571 100644
--- a/drivers/pinctrl/airoha/pinctrl-airoha.c
+++ b/drivers/pinctrl/airoha/pinctrl-airoha.c
@@ -2613,11 +2613,28 @@ static void airoha_irq_mask(struct irq_data *data)
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
@@ -2627,13 +2644,25 @@ static int airoha_irq_type(struct irq_data *data, unsigned int type)
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
@@ -2658,8 +2687,7 @@ static irqreturn_t airoha_irq_handler(int irq, void *data)
 		for_each_set_bit(irq, &status, AIROHA_PIN_BANK_SIZE) {
 			u32 offset = irq + i * AIROHA_PIN_BANK_SIZE;
 
-			generic_handle_irq(irq_find_mapping(girq->domain,
-							    offset));
+			generic_handle_domain_irq(girq->domain, offset);
 			regmap_write(pinctrl->regmap,
 				     pinctrl->gpiochip.status[i], BIT(irq));
 		}
@@ -2673,7 +2701,7 @@ static const struct irq_chip airoha_gpio_irq_chip = {
 	.name = "airoha-gpio-irq",
 	.irq_unmask = airoha_irq_unmask,
 	.irq_mask = airoha_irq_mask,
-	.irq_mask_ack = airoha_irq_mask,
+	.irq_ack = airoha_irq_ack,
 	.irq_set_type = airoha_irq_type,
 	.flags = IRQCHIP_SET_TYPE_MASKED | IRQCHIP_IMMUTABLE,
 	GPIOCHIP_IRQ_RESOURCE_HELPERS,
@@ -2708,7 +2736,7 @@ static int airoha_pinctrl_add_gpiochip(struct airoha_pinctrl *pinctrl,
 	gc->ngpio = AIROHA_NUM_PINS;
 
 	girq->default_type = IRQ_TYPE_NONE;
-	girq->handler = handle_simple_irq;
+	girq->handler = handle_bad_irq;
 	gpio_irq_chip_set_chip(girq, &airoha_gpio_irq_chip);
 
 	irq = platform_get_irq(pdev, 0);
-- 
2.53.0

