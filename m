Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11022110.outbound.protection.outlook.com [52.101.66.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D8EA43C7AD;
	Mon, 27 Jul 2026 17:42:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.110
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785174156; cv=fail; b=iiJCl8p3CYoUqtF1iiq9UX4Gu+MDRjmg6ULZ/b+VUvzjA2kSjO6/Ok8t3cXWkVFzohmnTByuQB7jpH/zR6E+XpGvVkricOwFCSXshm4ahycYVb00S6ur16w3/gAj2maeEloDxH03syc1qRAbVLEhThUIbi6iW5YbVqDmChHIDnk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785174156; c=relaxed/simple;
	bh=+O5IoSb3cfQJO6MGIxg23MWtgpWH+8pMUpYzcX8Z/1o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=PbIoHT1e1HzM0Ojl9Wy2+g9aqD/PD1SIeBF34qptMgHtANE5lgWpUaAGRx+nWr/cSsnyAmAguacWaQGRy3FL6rf/FfyI1EsCNd1Qik1RkIvuwRhMvbvsDdTQghnCGGt4IuPxfxkJXPNZNh1YFgjEqNaD/7cisnKHGuP5DqKLoOc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b=bEbo4mEz; arc=fail smtp.client-ip=52.101.66.110
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=genexis.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b="bEbo4mEz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sZLbipd3t7Eqjg2fyp1Mycf74wIKIQJtM+LU2IVWN/OVf4o2UoM8QCmZF1fpH11tuaQlr430sFDA9xWFkYPqArTVeIIyFdf8EqGDhsLoyUm3MM/YSB75ZPBu26+YJ1+e2MaPTaNa4OJf1dEjB6BI2r8il9ZCMJh0DwIWj70Wd9LxuyjM7gtI6+ZNGmiSRBLr9e9N3Ts37dwzM9XOS6TbQDt6nP3IUXcKgWRwZXqoFvlgTNNxVRguWWWTxt7rw70+jX1/4lBn/wrm7oNwmaNcTry++S3tewrHqDCNBW+9TA2QeF1I+ZUYErK8pRnuJLeUH+I38o8TYBDRyIP/KQnCww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T2bAL9C4HMl8+tov4U/TY4bn1ZTDHItpYy+IqsuRiqA=;
 b=r90g1521ojZaVMW18RXHdcmbZC7TLXMY39Yovb3VDbOlBPiHE4kFHZ/73IRThjnm6COcoOH7QV/tPX7l/Uf2iD/CVzoS8Eath3A7eiwdPLpULwtSuMykMcJTO1dCDguZW02yD4ymcbjCPnHlLhU9d8aum7FWXQTSQ0l3yOg82ODEQkv/erzZvpyWciaPFJObR5JRa5gFay5cuc8YaXEHUOTF19kowFFqJSO3krONk+mS2NYxkjfi1wQVu5vbGgjOOJgfHvVVe9LYtkdSRuVfoCzZ0FNR6jsQdUCFKpNYTaUdCJUCY8S92xDwR03GQDwnAJJoYcLtyVx2OhwBMh0KMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T2bAL9C4HMl8+tov4U/TY4bn1ZTDHItpYy+IqsuRiqA=;
 b=bEbo4mEzZXDfRXWtVcMTTrfGKuYi2hRujhbeQ6cNSDUIJSRujOzDpGWRAJ4tYvbzYSBVXDCiojebfmeQ50ohie75KwDvz7lJhtP0vNjpLKNQWHGDJWyC+z1mFcTIIxDznKkcnEXAjcabXf0ct5PXUBQ4jh5Uf9fTE0DYBC64S+xtZr1RXPXzzs3/fdRG58ba9GOI8xAjcNiGnoNwdUHO51IQaVmJp34UuZr8veaEqASmrLID6K6GkMu6/pu8+iP3xonshLHN6Z97lrVuMgbiD6TMJRd4lxvGgwFHtM+Tj8T9x1vmuliZ4gRAWLNZCzWImWIOGxvZXVCLfEt6e94yOQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by PA4PR08MB5888.eurprd08.prod.outlook.com (2603:10a6:102:e8::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Mon, 27 Jul
 2026 17:42:24 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0245.012; Mon, 27 Jul 2026
 17:42:24 +0000
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
Subject: [PATCH v8 19/35] pinctrl: airoha: remove not needed irq_type[] array
Date: Mon, 27 Jul 2026 20:41:25 +0300
Message-ID: <20260727174141.664933-20-mikhail.kshevetskiy@iopsys.eu>
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
X-MS-Office365-Filtering-Correlation-Id: 03d8e9e3-c91a-4b70-c7e7-08deec066b43
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|7416014|366016|23010399003|1800799024|921020|6133799003|38350700014|18002099003|22082099003|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	/uJ1GgpMVI2ehl6e9Ws9CSPRdkMAPLxUAgnKr6ZVYuoF83KoCJNJO0Jj72OeQQzGs/0gRcQmQ6JhTwRP7EN6kIRvUtYphAcuFTvOUQcIIdXyROdNal36qALAF83UJiyZES3hafQRFxiPwi7QVRZUaqzBiVBHVX4WwZxwwbWpm5TniClMVvxRS9OCSDQ5Qv/TCZJQvI94C8JyocYQVPaII8u/zXUSA4Q2W1W/2FmElvN2vA5kOTGyAbzMbMZYJJxCLoh4GthVXNtHebIzFShUHJ/jtCQ5LyVVqd74dHtleR7Y+hEbUcw3G7cGZurmyLJmt5ULN4KVH3fzNZpc85espI0URzsSfOMzfHAxhLmD+e7Xk9ONm5qH2o7/CBKQEU+BxNdPhum6w8N/dzfSmTfasJAq8PI2Fi8dO/KxBgdRWewl2eEnlnAwhLIdVTSj4OQsiUa/NW2BeP/lzE2FhyJ41UYGJmlLFbtpCye/77RtHbACx9H0RPU8RfOiWlnmAv/HQut7gPbnTLAJGvi0wunO3nMg6Ck/bYmlwSDmAaXL23s15rbCuet/uP90CwJHMalMklqcipmlegaaArZelS4VBYsULcy5UD+zYPBGDYl74WCVEvrnXflsA/xGKIfUuBej3gTMNHInIBkkwTlYR/znrOJkrmfF1OhN2FVnFvssdqk9toK8bfnmqOUTpCnCKHBWc3fLm5zQPCCYDUhXhSpPOQRLuxFPjLoF3uPESwwGKzah3zsZXk9knv7wi+tfMtrC
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(366016)(23010399003)(1800799024)(921020)(6133799003)(38350700014)(18002099003)(22082099003)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1xlvK/P/Jy3pbrkvKlyQK2MvIxaPrHvgQ+P0q7wEJuk0t4VacMHcJa+jtmb7?=
 =?us-ascii?Q?ofCmEh+eA66IRbIcuLtn9aX0IMr06qCV0NQMx4gDP/1mQkn69d2BcbMbZ6hy?=
 =?us-ascii?Q?foUd7Lx7jEu/r93t4KfeFKC9kLtAEPIN6yYsX7s1ZukkIot1G30v5xSxXr+3?=
 =?us-ascii?Q?yCnxRF5dUEJ0/X4A8aWQfE0ZIhnKxbiA+P7qijAXWz2p0clXxMouzIDvafFb?=
 =?us-ascii?Q?jEOGe3p8JwtvLNKD3R1pH8aqZwU7jYw7c5zDwyiJz6FX4BiwFP3yl2767j/J?=
 =?us-ascii?Q?PH4U6QITSHwvVDSb5qYfTkh7cmBAIu4mx1S7WQWt2J2MN3Lo/1gtMy4DaU0c?=
 =?us-ascii?Q?AZqQcK+PNirKn5qd1w2ZUucq63GYBR/m5OgmcWxkFYqgWJ2jtvVTjcymkEV0?=
 =?us-ascii?Q?B+Il6m5LlIHWRa71RlFWXmKYKCSOyca0SmC6EjXi5I9+tYL0MDIj6kU54lJ2?=
 =?us-ascii?Q?+87gCY9cl9hHrDVr1jucLq6ZZZobm0M8+ETMHMCFbhA8dQ67lWkEAEdlPZao?=
 =?us-ascii?Q?3gSWvRphukrE91IHcMdie5jcrr3EwAn63+xLVCy/BfDfqE07cwJ/iFdI53Xf?=
 =?us-ascii?Q?ACmQRCPTBxS5ktfkayvlLl2JFaxN4dN6ZhJCltV5CHlOVh/EnkA4MZyx1YGT?=
 =?us-ascii?Q?PAhaMUykby55vJOYFS0KSEF0aZuxuXoT1AWsn6aLUOBjuPGKdMxkEq9Wnxq1?=
 =?us-ascii?Q?AS3Rjog9ZY0P9gfBZx7siK0kX/kRsjOf/Z8bAr1BONMjGidsgpqG83nmO+4B?=
 =?us-ascii?Q?Eu16ETNYE5ooaonr7vwHJqWl+KV5ZWEwWe4/uA5PHDUxIbd6W3P1ruD6Mmn8?=
 =?us-ascii?Q?wbue71cjmPlyzRgAzdJQmXmcecp04ShtwS2apOJOosgWtsJsR2/6ci+EWv8Z?=
 =?us-ascii?Q?uoZfgWq2IXZupZzC0Fwl8fEDLDtCPQ9kHwB4/085PZPjNrk4kMECIwMjuB27?=
 =?us-ascii?Q?w8fl1x5/cmHdRlvE+0EYF4RE9+G22HYT7ROXXen/+erZ3YtTuMgxzfOChM+Z?=
 =?us-ascii?Q?fmLcO+NpvHMpY+dioWfbF4ufMfe0xReYdu9/JOWd0jBeGqXdpXhJzBajTgZh?=
 =?us-ascii?Q?tsOP7lmZ09j1Pc2GM0rGsYAfbgnuPP/mOusTCUpdjw+9xtUvy2LBQRya6oT5?=
 =?us-ascii?Q?tcG8mzN1USxgMhavPHU0EYMhj3zlbeM3deY1lx6Qs22Zcy8gkoLuZk+HJeYP?=
 =?us-ascii?Q?EB5fVGtx+ztJ1BV+RvhV9WSCD70I+XlGr9IYHqyuv0qYgiQRS1x/7Mq4/d1O?=
 =?us-ascii?Q?yClXUif4BRM5a5/+RpAGI823/6PIEmNt4d8LNGTsiKaAJJWqteMxJeLexrr0?=
 =?us-ascii?Q?b1sdBTjEuLbq3IXORYfsZXvMEIJ69FOi1eTsbhKbODqWYpt1FG0P7uWpG+Cu?=
 =?us-ascii?Q?gZPqudKHGeIyHhNSbZdcjvTgBSQCIfWKQ2KTfTjV8KsG/CBQsnPmqDmURLcV?=
 =?us-ascii?Q?zlH1T1TDA54yqFk1lm6dEfDk5EK4Z22cj/dOSv4wEIfH+2wKGa23hMO0lpRt?=
 =?us-ascii?Q?/BWplkfV7OfzLZxqD0zWjEImW+34wY+iMSUCOGuU5fEq65M6XI5CiZ2MLLUA?=
 =?us-ascii?Q?rdXHo1QkY5w9T6C2M7aNCaRuPHF9xt6BL4YB6WdADiWu8aip2+L6nfHitpAs?=
 =?us-ascii?Q?qJQ5z+4V1H53A9xIybtczE8xUxKPEt2jNbi3h+2aoMn/U+u6zZh0U/6QSbrj?=
 =?us-ascii?Q?Dda3i9VERFmXBq3Z3JqTCKRoWLQcIRrgO1B2y6eY/wa9ennjJybvUbyz8MPL?=
 =?us-ascii?Q?EWe9w03G4W/kvSjA0FEFXOjjNo2B1AU=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 03d8e9e3-c91a-4b70-c7e7-08deec066b43
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 17:42:24.8237
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4M4VbkuoNvmRiPCFg0k7OatT73SkHKfko/1MgsXMWPowih8/gLDbmXmyYnVrZ2m+HehVRD88+mC1fHm9IRoNx5i4SEJeH3KrQktXcjK76YU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB5888

irq_type[] array inside airoha_pinctrl_gpiochip structure is not
actually necessary. Use trigger type from 'struct irq_data' instead.

Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
---
 drivers/pinctrl/airoha/pinctrl-airoha.c | 22 ++++++++--------------
 1 file changed, 8 insertions(+), 14 deletions(-)

diff --git a/drivers/pinctrl/airoha/pinctrl-airoha.c b/drivers/pinctrl/airoha/pinctrl-airoha.c
index 723407a59c05d..5bc3f131a69a4 100644
--- a/drivers/pinctrl/airoha/pinctrl-airoha.c
+++ b/drivers/pinctrl/airoha/pinctrl-airoha.c
@@ -383,8 +383,6 @@ struct airoha_pinctrl_gpiochip {
 	const u32 *status;
 	const u32 *level;
 	const u32 *edge;
-
-	u32 irq_type[AIROHA_NUM_PINS];
 };
 
 struct airoha_pinctrl_confs_info {
@@ -2572,11 +2570,11 @@ static void airoha_irq_unmask(struct irq_data *data)
 	u32 mask = GENMASK(2 * offset + 1, 2 * offset);
 	u32 val = BIT(2 * offset);
 
-	if (WARN_ON_ONCE(data->hwirq >= ARRAY_SIZE(gpiochip->irq_type)))
+	if (WARN_ON_ONCE(data->hwirq >= AIROHA_NUM_PINS))
 		return;
 
 	gpiochip_enable_irq(gc, irqd_to_hwirq(data));
-	switch (gpiochip->irq_type[data->hwirq]) {
+	switch (irqd_get_trigger_type(data)) {
 	case IRQ_TYPE_LEVEL_LOW:
 		val = val << 1;
 		fallthrough;
@@ -2608,7 +2606,7 @@ static void airoha_irq_mask(struct irq_data *data)
 	u8 index = data->hwirq / AIROHA_REG_GPIOCTRL_NUM_PIN;
 	u32 mask = GENMASK(2 * offset + 1, 2 * offset);
 
-	if (data->hwirq >= ARRAY_SIZE(gpiochip->irq_type))
+	if (data->hwirq >= AIROHA_NUM_PINS)
 		return;
 
 	regmap_clear_bits(pinctrl->regmap, gpiochip->level[index], mask);
@@ -2624,7 +2622,7 @@ static void airoha_irq_ack(struct irq_data *data)
 	u8 offset = data->hwirq % AIROHA_PIN_BANK_SIZE;
 	u8 index = data->hwirq / AIROHA_PIN_BANK_SIZE;
 
-	if (data->hwirq >= ARRAY_SIZE(gpiochip->irq_type))
+	if (data->hwirq >= AIROHA_NUM_PINS)
 		return;
 
 	regmap_write(pinctrl->regmap, gpiochip->status[index], BIT(offset));
@@ -2632,28 +2630,24 @@ static void airoha_irq_ack(struct irq_data *data)
 
 static int airoha_irq_type(struct irq_data *data, unsigned int type)
 {
-	struct gpio_chip *gc = irq_data_get_irq_chip_data(data);
-	struct airoha_pinctrl *pinctrl = gpiochip_get_data(gc);
-	struct airoha_pinctrl_gpiochip *gpiochip = &pinctrl->gpiochip;
-
-	if (data->hwirq >= ARRAY_SIZE(gpiochip->irq_type))
+	if (data->hwirq >= AIROHA_NUM_PINS)
 		return -EINVAL;
 
 	if (type == IRQ_TYPE_NONE) {
-		gpiochip->irq_type[data->hwirq] = IRQ_TYPE_NONE;
+		irqd_set_trigger_type(data, type);
 		irq_set_handler_locked(data, handle_bad_irq);
 
 		return 0;
 	}
 
 	if (type == IRQ_TYPE_PROBE) {
-		if (gpiochip->irq_type[data->hwirq])
+		if (irqd_get_trigger_type(data))
 			return 0;
 
 		type = IRQ_TYPE_EDGE_BOTH;
 	}
 
-	gpiochip->irq_type[data->hwirq] = type & IRQ_TYPE_SENSE_MASK;
+	irqd_set_trigger_type(data, type);
 	if (type & IRQ_TYPE_EDGE_BOTH)
 		irq_set_handler_locked(data, handle_edge_irq);
 	else
-- 
2.53.0

