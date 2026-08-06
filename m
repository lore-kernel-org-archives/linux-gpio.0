Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11023076.outbound.protection.outlook.com [52.101.72.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7984C430CD1;
	Thu,  6 Aug 2026 22:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786054035; cv=fail; b=AULzfszjZUG7e8UTCQTBWOwm9eqwRqHhIe224XtLTu/lb1t8Zg9+EvZ/ogwkyvA0PLgET4P+GKOeS0+e/p5eFNvDnMlL3RejP3Sfm+/62QwM/opPB6uY5pB2g1hDeRYIMN43yZMa2eDG/SAWKijsVRLS1gpAnlkhiHAyNel6akA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786054035; c=relaxed/simple;
	bh=xZQb+SjVPLelTusqi6yAnMNoyzK8xKmvAUeZfyrDzIg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=M2LYSjuwhQpKgpkBOVCWnePdiASiab2eHvNlAw2O05MAJ451B2qp3vb5ky9bdXTBJMioXppNIisaLhuhhn2blZT+K37EqWYPGTMuT11gN/Q3zqglJC5irj3ysaM7E0NWj+Z9QpgcF+gAGcunUNj1euFaBZXev83wvPoNmUhqLVc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b=RFZObq0l; arc=fail smtp.client-ip=52.101.72.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=genexis.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b="RFZObq0l"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MBazwJIYZ+zgfbnx7I9DPsCd2kPxsRHTbQ4R6lbuGsALe2ooscu4/BV64pVaE8bNShuwmks800OibglWZSzxJihe3FX7KLnOfV456Dd7PFowSmqYO1bpLaGamjWWJaZdDwQtGOQ89xaM5ljgD9YoYte7Dnwui6YW435DRbIhRgKc+tbRM7N7s5dzgUqkLuaISXZ8hK0JUmX4Pt44xv7RHt/C2Vow6wqzsROcUw21uahhb1SywMPrW1KGg4HphrFK+Y6QR4wiy6oRWueOXP08vOYhKb7MOEMThU8GaSIZB9/BojOZRCqaqQs+G2bB3BG26GS4/lcaSo61N9UTmIZoXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X/fkDc7eJh2y+f+7SUYre0Z6IHMvmUHaLWcRygeSWjA=;
 b=OjeImRVoPbTdcbJYeFebcJfAZj6v0z29a7CJpIWxnsK9uj5vN/5Y0vBJyG4pSFWtdsWcoiShEAqeXWeDEIkMrAa/2u83uOjC5WyeO5Bzv+hXzQqWqq+DKe3vb0FI/iIpZoLDOjsTDPWe3X+z1xDm9C0ZQjlPhHcapWz6dAYa1mmjGFYOCxGgD+VaGYMhzJxNYv4w8dbcJ/iopFSauBM8Kt44N19FAkIK34LFQvsy7/pthiA6RYlhpdKBcCUZpPGonz1C4LYsfhhL8QcjLUDCHX4j2MOLjpw4sbO5LrucJ7zzkxC5TOYyBjJI8ou56SJZBkqlAknimC5KKqN6pp35lQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X/fkDc7eJh2y+f+7SUYre0Z6IHMvmUHaLWcRygeSWjA=;
 b=RFZObq0lrYEUCJKCveHuEQcmj4HWcgcvzua1I5oj8NXRHjn7GnviTJMxn3UsXMzORltPIJv+lWwxc2UVbX57IZjwDKdNVmX1wXCOp1Wtj3C8Vxe7VUMLBrEA1Jj3MC/uHNxrQDPTdzNhE3+n/ExYzapuEWkzirSxCD80hzQY+wsOue05ANijZaLbLAYwmXLx/ugC0Bl5InP8i85RR834X//i6LDVxsHSFyO8Tm2A/Em0y36aEf25x3twbJ4v8zFQ865u9V0LyDWlpviA8uAf3G+LLki2jkhtmNIQxJ0GmXfosRQI9Xk1KKgYOHF3Q1sVeacLaDfCYwxJXbbv3ZaXZg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by VE1PR08MB5823.eurprd08.prod.outlook.com (2603:10a6:800:1a5::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.23; Thu, 6 Aug
 2026 22:07:03 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0292.013; Thu, 6 Aug 2026
 22:07:03 +0000
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
Subject: [PATCH v11 21/37] pinctrl: airoha: fix edge-triggered interrupts handling
Date: Fri,  7 Aug 2026 01:05:59 +0300
Message-ID: <20260806220615.4078303-22-mikhail.kshevetskiy@iopsys.eu>
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
X-MS-TrafficTypeDiagnostic: DU2PR08MB10037:EE_|VE1PR08MB5823:EE_
X-MS-Office365-Filtering-Correlation-Id: 5490def0-512f-400f-19a3-08def4070bb4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|23010399003|366016|1800799024|921020|38350700014|6133799003|10067099003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	z15cBaqX8Zh5LQd3OfRFE0Q6QzzHWc0Om+/M39KhrJGUIGv+ZdaLit0U8fVutJLmVApPzxPtgHQmlY9uKVGb1T1Oh9HfvTLyhBs7cRApKEJAN+Kx3TAh43/wwT/n6Hbweh05q6ZOWDols6SluH8ShdHKBXZc5QigEgnq4w26JhDYIfBu8jz8HxFd31Td6IfgyGCZv/r0DzXowAa4mxE2mOeimEhRDjgY+D/1l32xRzkrAMhe2h5K5cy2Y34WDXPXOxnGehtqxx2Y1jYDFEXzdGHIAgZSSzdGjrEHa2jxzNOvi9J1xZjuHOa7Gijb+0OIhY6YqYbWRqgAxavg0luFByY5d4fImZ3q5zegm7oNTfw0YY5HI7o8vOYNBfBqZSjK2pnyVs+CwfpFx/2qDXihtZxbfJ4BpfuAoZys9TYzvT8zgrlEy5o6neMQ+b/Qn2Ty9Vh8zY3Wv4bZbnAYgytfLyHgGBL223ZskTiaizxp7U7lQAn8Y9s0856Mc7Q39bfsq/HMt+EEkW1e67bZ+X8OHsNPmUnNF8tG5ZF3xrtf6uw/NgLPczeIfRTvCSJENc/MzNhgT+sRZ9X5uYFheTbbVr2Y99Z1B8FuFG8UkDS/uKPk6+0/K+zlPdaRYQHtD8KP1WMHn9+aO22INsbc3p8neDE/2Tw4KVLlKdo42wnnjMP9gHbK5XgQ4ngsa/YF2/CMFQ+mPoA6Ewon8GdLrbfRwKoT3WuTovqxYjedJVL1DbSEVjeN7FLOfIzz1lZc28qp
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(23010399003)(366016)(1800799024)(921020)(38350700014)(6133799003)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?mI2BgKyAkJ9Y3m4quvDWvuI4AWzyZC+6/CnXp75yxa/cJWm71SjY+a0KLDSY?=
 =?us-ascii?Q?X9fv6DVcAhL5RcybI1ut5i/gcYbms7h/TWWlbxHD2Gj5jVUo2mZpoNkNSmbO?=
 =?us-ascii?Q?aQdkaYdkuOeO20FAcUEaf1f3S0Qs2Hxz2nwfCblEVrALzdX3RRPxf78vi7rh?=
 =?us-ascii?Q?Mculv70FcujpXeupTds3HO0Ac8cUTsl23b4OT3gDOcheNxpztyjXdBu1dRse?=
 =?us-ascii?Q?L9oURs9/dF6hob8oSXLo3KTu9LjIO3jhwhZoxmCgMZmiqq1KhL2mBkkRx+48?=
 =?us-ascii?Q?6h5oYLOChj6puRRp+6f2ki9iWZFyrbZSEC/g8AdSqLUmMRysdVVXA/lXdkgo?=
 =?us-ascii?Q?eATq4OAD1EusRV4FQpYVCOR3ciKz/hkQyebzLARfBInf6jRLpA0iAkFrbZ8m?=
 =?us-ascii?Q?nC1WAOSZABxz88uUOjybePI64hRgxQVsXSmeRF2Ui+HtGqp1uWUAbI9ZAAxc?=
 =?us-ascii?Q?aF11JHtY3JVSpL7f8lt76PBiswpuZSbKQfr4FRk73HpkSI0yGjgTVqNFCrDF?=
 =?us-ascii?Q?WjzQjFDfAG7OC3J63kLbWZtE6gcaDgyHd4sjtIixdWvQsuQAcOiHytkPeTrq?=
 =?us-ascii?Q?tf2WHNKblR9hDsk0JMtQfYKSjDQl0bNLX/A8RytodxqV/DD4BKLBzOm3hn0S?=
 =?us-ascii?Q?cyvSiCNzJ2cj4doROiaQz2XCSeReedxuKRHAXE6UrRxn7bw3wEoTofAYNkGa?=
 =?us-ascii?Q?ZY7lZ61KO/MWCdbB/zEHYeNQd8zrp6zbUBw/4Nzai6g31jVSv0ug+6nrT1j0?=
 =?us-ascii?Q?zpHSidoBB3wTPURa8H1mqLa555WybPLnXDxIFP3HKFa6XZapMmY53KhdetCP?=
 =?us-ascii?Q?rSKo65muD8qv1VwCYJ2IPTW60PKYVJ67wxtKwhbJEUm7z/pH+SCbFPgqZy3R?=
 =?us-ascii?Q?hVdsqp9bIizdyl7w7XZbALOHpzHl0aHpNrn6+gchsG6rhjyzkevYe+6WAiSh?=
 =?us-ascii?Q?caoW1hcWM37jAmzjEFeulUVuxZzLZIW5gM9nw/IFfoe8n8bbRGcgOyA0ap/L?=
 =?us-ascii?Q?qsYTG21JVMHwUYsDj9sUoZhWtjfJlvE4f50NSoMnJOPRZZIMo/aw+1xIH3pp?=
 =?us-ascii?Q?1X+Q0t2qugm8z1cnnsGyqeH/LHR+lBmXkXPmFHe/7OjcnPV+S/Kxt78C4tEj?=
 =?us-ascii?Q?BeiCVPirHIzwqnT/NfQnwCI8+yuRX1ht77mZE21OHNGFmxi5a21Gmgn/L6IF?=
 =?us-ascii?Q?9EGML58HHphWXfCmQwuU7iOfShvmygs/PAuLFbi95cp+3TqYxiNMlFImyrjg?=
 =?us-ascii?Q?tXYa0sJ62nBm7IfPYO1okcL1Y+DZeYhl0KsgcXNGhfOzhj2ikfcZa8N9ZEpZ?=
 =?us-ascii?Q?ppkgqrWbdNsDcUL2zn7D7iHJKunRflIRckGgb+hmMBs0wS/FV00Sbb5wNMFj?=
 =?us-ascii?Q?Td6S4VKB1RkJprXyCfzVhOLlTmiBNO2uHvXo9FHgysP62A2px0QbQZx3dH6w?=
 =?us-ascii?Q?SphO260faWnPDyNcBjT69nQAfeG66gGnODRO+jGnIa8udqQCM/tfh8XfFlWd?=
 =?us-ascii?Q?mOy6T2NoS2oOEMhw0svEJuhGgeQts0joZ9HGC+FZ/VouuT8oZjY7e+FnWxmG?=
 =?us-ascii?Q?CJOhcx88gdchwxIKpLB39zvoH7he3ruEpV39N9iSvtLXoa32hIfkBjkVvhVC?=
 =?us-ascii?Q?H6QjFfHiySXaa46GegAxMNi54BC4/K5qzGlJ8AzptZu3dvcztZ9j9fscwHHs?=
 =?us-ascii?Q?jVlvtj5Ag5nZFo0MSWhyG8bR1wz0S0QMFOOnXj025U3j6p5yql+AEUqqKz7o?=
 =?us-ascii?Q?XnB8PgQ23pHE/KqmGP7HQZKyC/fMJng=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 5490def0-512f-400f-19a3-08def4070bb4
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2026 22:07:03.2719
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UUoIdE/FFsGSR4zK0gnOwfdJ4TwghPsMObDbxpY4HT0sWhpf4gQ7fsIL6Lo6ZlqYXjlHCogL9AQyXBARjNDd1/qKQaxgSXDFS+TbFayRE6Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5823

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

