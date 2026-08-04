Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11021116.outbound.protection.outlook.com [52.101.70.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 277A847CA66;
	Tue,  4 Aug 2026 16:05:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.116
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785859520; cv=fail; b=ZZMhdNMpHqsbcz3OqzF9HhsVyK/oXA33skYpJsiEJCPnu+vwJS5ZtXhASxeO+uvm336j/62Ai15Gt9yvi6aVXe5tffWWaEpIXnpJnmtovFs60IRhgKxUhLhi+e+Df+8ZA7c8oVKCKdZJ1pXbrQacdsSRQch9MD0j9ZWuMGF4wcQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785859520; c=relaxed/simple;
	bh=kw81D+1o2dzyigvTcOM1/nAGeTdnJSosZp/rtdWL1+o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=k/+mxC47WZMqMrRvO+p0GdFXBeR+J3BtWnhvRyVy99M+JKAkwh+vDEeouy5nb3w89cSuncPktfREdbcxqzgnoNoWonw4FRdxwv11lOEflizgp1y82wTW2tJdkR8b7sZ2zC9raWY+O8nWsh6fmckCAYWIKN7LIQ9gLzJtDXFWQOM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b=j/1vUKvG; arc=fail smtp.client-ip=52.101.70.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=genexis.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b="j/1vUKvG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tpeqyKmNrJxgD/bBqAfHKrVLYBakRZpgFZ+MqIzvN1MCNmjzPk5cYGvzZbmO8BPiC0P8MMm6AKoJRGzLNU5cAHDS5XJIYq7MMW/QvEhN6JLzFRgWydO8kYJEAENnfM+Lwm87RTgJF1sDlUzzg7PER0P9uyvcTBtfCyyewdt+QuSSOa5oJvx+ds7Nc7BLebVLQAsyD6rfZJW6FnAMKiS4XaqanOlqQYVzIYW58YYf5oVNJj5lwyKCtAqR+qI2wayFi6uXem/U2fM8/ZIADtSpFojuN0d5uoA3MGZeYmettx3btiUpbRAgIoaPL2D9Y1+q9CeAXLEPnb6sOspFt/iB7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MmWZoTAOa9wh4fw6zCA76jkaAr9caxVyb8dEOoHctF8=;
 b=KN8TZaNqk/atGu0Mk/87HraQBB0q/bYdYMiMsyzhkYnHvKvRw8xJrdmBtRQYvT+o1bfglQcaSkcb2R66Fo4BVlhaNaN3CQ4+j4hzUNSXa1HF88UCW59oUm03q3E+yKuKZHSw1VSSVlie4mMWzOzoX0elBD8yAWRTi6EACTAJ7jidRJ21ERuqDuG7ab32+rf8bLOPUaDm1ejwmfZsWtnlAWUOqxredD0p3jLQ0qoy4cisf4/Y3mp5UTbMWi1HiuHXaoFHwWSBO7cxQkVBIcRRG/86cNc29upImvD44+Yd//I4h575ZDywDw2bbEaP8FVsfoix6IkKTnTs0qjAJYG9bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MmWZoTAOa9wh4fw6zCA76jkaAr9caxVyb8dEOoHctF8=;
 b=j/1vUKvG8FBj4eVy6c50IuDn5peDwtKaSTiWlncA1mNORIXg1DRnrQT6x685JQsPbGtQMhcIzg7O2l7zPKSTtZDiIbqfYfY7iPIBtJ6Bv7TKDyIEMG9MITFGZQjZRAhGp7jxleJnRfD/kbzDkVKSGL+C7h3PAITXYwPCJDA6dcKX7wJD18A3soTJqffGOhatfKMiR9Nz4BLPkcCvBWw8GDy0kW/oFU4+SrlQQyqe8R/gpme2UR7hjv95POuf+/awekTPboyehtOWFY1iFOimzPedZuf5doLx4E/Vs21YziNMEx0VIqqmEIN94gwDjgRDNlmTxQwAlZvkhKxO3Ysfkg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by GV1PR08MB10792.eurprd08.prod.outlook.com (2603:10a6:150:160::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.15; Tue, 4 Aug
 2026 16:05:10 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0292.013; Tue, 4 Aug 2026
 16:05:09 +0000
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
Subject: [PATCH v9 22/36] pinctrl: airoha: statically allocate gpio regs structure
Date: Tue,  4 Aug 2026 19:04:05 +0300
Message-ID: <20260804160419.3592327-23-mikhail.kshevetskiy@iopsys.eu>
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
X-MS-Office365-Filtering-Correlation-Id: e3c89b0a-d952-438a-0339-08def242289d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|52116014|376014|7416014|1800799024|366016|38350700014|921020|56012099006|11063799006|3023799007|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	GOC+3Bk0/LBdG8ty3pliYcpv9ZSpPUrLJ1Fa6fvq4iXo0Jen5OcKwZnp8FRHraj9Sder9XhWcP2q4nfacID5HabO6IjDisQwGZ4t3XtWWGoPy1JAGGXnGKSc7OTA1ZXrNKJZ6zt2JMgKzCJzhEaAKOo5zAvdvjviFPWbRT9o0ivfDOM03HfH6Z0R5KUotjg4jiX60UxoWdNQvIoB9cGz0GTz+GY6G5Oab7NlU4PXNG+s0aCNczr4OE53xxswsSSuMuyzIpKV7jOvmjn+mAVjyfbWkvxePkNpEcmKk/wfBeJhOJ4JAd+8oWjhMgbS01h8C+XuMaMegM9ucnV82LOsW4lNZkEQwrh8Ok6Pm6bDPo1mUfNiGaB5Jctn8J4n7cLzpPMDhMTXGDsgnghnpQhWg99x3JquUQJ4r9L8PJJyPZtuXeTQSf2YUAPCAeTewK/6zcqElEi8fFK5o66KVzvtvyddXmWd7sB7ugcY0NDx/4Y5oKJX50xoyCLrKPo/DuNrUeyal0i4DoEjLR3J6cbn4AVR48r4rrL3VHdyUVsjB1D7mxeN8CTR3ptitHebb7JVCy2tHeiD3SBrMPJb82M2owwF294Yv7fl6DVEjxJ2aS4Jmqvvc9gSw1ZdvHD+RXolftIANqOb6EaRe0ZHUgRVEiJJ4fLSgHkFtzfED80yJyAiGFn3a8Yb5E3QKHNZKEu4b5JKidufCy5uP4wRASlO9o9sM45giObHoV40aTr0Ga9JfbVp6my2FqedYskGkeNb
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(52116014)(376014)(7416014)(1800799024)(366016)(38350700014)(921020)(56012099006)(11063799006)(3023799007)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Ji2WCquUe/1HgH0HRiw1fqvKeK0WC2o+Jj7iKg1Y08giQ8qeffoZIeMHZ4fR?=
 =?us-ascii?Q?CQAPusLzpnHL5SsjkvdJyDBfi7t8nZIwO25VNWEyirtde5GVPaowFSBWdARJ?=
 =?us-ascii?Q?bxI1ELm6DDLd05TvuJ5MZh8QUCyNGtJMRhZIz4nEp1duB/ZSo+vCQlx88gGt?=
 =?us-ascii?Q?CEFJjzqfc3Ve+/UnN+uhUIcAA3Df7Pg9oezBAp/bE0p38iYL8ojKqJOUSD6L?=
 =?us-ascii?Q?FkU+4PABjPtDsEuPSmtmESpM+9kPSRg1nyQlMXVK2cnR4tHahELWqvPBx8Ap?=
 =?us-ascii?Q?BMis+4XSg67X5zzrOO12fd1g3MvuoPFgLXF5EqQW612v2Hi+EWGBcCMDFPrZ?=
 =?us-ascii?Q?bTbL6R4v27gX+7NA/ZuV9wqhsUQj5mJsK1l62hn6w0hY6HLW4j3H8Jf5GKGH?=
 =?us-ascii?Q?LnZV3g/zwgKVfSxfXY48rUI8UWJ/n8XmKpDGojaGEmAI39/s5illrqDuhdNL?=
 =?us-ascii?Q?iwXgMtX8VBijRKe7qRQ1HsW5P3fxnfZHJw8EXuq0lCxYBfP6fQ8xCwJPcMg4?=
 =?us-ascii?Q?hc3w1ww89F1eScwe93QSbQgQyze011Y8iWtkixdSqrupS6bsQxn9H8YYaJ5k?=
 =?us-ascii?Q?3m3fayXwtYsDmW/njqUFxwkowdbb94SExDHECOFFT5HtJaBCQQWIdn7NRF+8?=
 =?us-ascii?Q?C/GQlp7EA/47C6pSQwwjQKn+1pDxcd0yfkN0kj03dsfuYDFIF1ArRALbWLOb?=
 =?us-ascii?Q?Vi7XjoLHcQinfMHxTUE/0dGrvLUkLqldsYX4Q/Hpzx7Q45ieZ1BJBnj2S0DF?=
 =?us-ascii?Q?ndoqMVxPNRiIrdQMYKMjVUa1u3067XNJ59RAqO2yYmw9kZolkuTzHXK9onUJ?=
 =?us-ascii?Q?T3oFG1K1L+FZ+eV9FKVZdes9ytn6B/PVdUZY4tRfq/rnhqUxvfNSamu98uvJ?=
 =?us-ascii?Q?cPMUNz6NzSNcAfTv04/AEmZIo/iJCZnamxZGq8n63iSGNp/OSsmI0NYTFm2U?=
 =?us-ascii?Q?plLKgZT9ThRxvETCVyOccGAI+1fvmyKjFylo2FDMUGvoR2S6xx4S5v3qze6+?=
 =?us-ascii?Q?xT72xizj+6KKnWB6HAF+LstdllyNLvuD1AwVb0HxZcedwkpwIkhg6j9MDFVb?=
 =?us-ascii?Q?wtgWR693AFq1fknA2KTE8qWtR9TBEnFyieod9dlT2By7S2yFg2cqeiG1dXTB?=
 =?us-ascii?Q?P5dL9NoUSrr7CxnGFbiCv15xtQb1VpUMSwSEtHnze8b6W1Gg8vfENKD9GXmM?=
 =?us-ascii?Q?m0wumpEA48elbfHeazrPfya5Q6BWSXaMyPhK1alQaVOlrVVaVodQwGewwWZI?=
 =?us-ascii?Q?QOvwm51CgNiYM3apei4nk6O5nRTarGiMHYktiA57aAASUa0dGdNDeD335COK?=
 =?us-ascii?Q?MX8dsdFkQJ0SnU+RIS0W0kPmEnREegR8dax+IoAYl1AK5OzqUsjBjQl143A6?=
 =?us-ascii?Q?aM40pzRkLhD6UvjdBT+YA0DT7Pog8KXmRjNuRCD/qy1gG5n0rGEeTTmm3cPJ?=
 =?us-ascii?Q?YQa5i/f07e/fHTVnK9JNelcD6GYF+fxFYeFDmLxNa1HH++eooN+OhlQChPRL?=
 =?us-ascii?Q?dkL8SjPSIvmaaf81NLrHh8Pxo2Q5d+P3c13tf8gi2AQIBEo2/JVrhNEgyynG?=
 =?us-ascii?Q?EqhBHai0okls1yYh1xduS59GU9CXT1YEbGJQ+1pn5LvDS1sr8w3Gra9o6d/y?=
 =?us-ascii?Q?Tjnkbxwd4s91xoXkPzuJPJNHrhYEoX+kFBQsdbfjzO6rGjEL9z4EOyTWmiAh?=
 =?us-ascii?Q?Mv3Be+caf+z70BEqFvT33kWY2XxPuRRAwFwzL7ihsoahs0EppQMbD0fkyvTY?=
 =?us-ascii?Q?0UlJiVfhQZPWpwuM4YeWhR+ucuB66Cg=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: e3c89b0a-d952-438a-0339-08def242289d
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 16:05:09.8642
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fV1EF6MIxdVZhlBF/xUpDg9l09Lw9VEhM6xtKoLWq2b38B+9KnFfEyqOsx+a8KR+zVHQoAgPJkNYKKsYIDUnZfT3ePOVtfwVpxtlRXCBWWA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB10792

just a small refactoring to collect all gpio register information
in the one statically allocated structure.

Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
---
 drivers/pinctrl/airoha/pinctrl-airoha.c | 92 ++++++++++++-------------
 1 file changed, 46 insertions(+), 46 deletions(-)

diff --git a/drivers/pinctrl/airoha/pinctrl-airoha.c b/drivers/pinctrl/airoha/pinctrl-airoha.c
index d7759fb3bd1c2..3caeb0aa1c0ac 100644
--- a/drivers/pinctrl/airoha/pinctrl-airoha.c
+++ b/drivers/pinctrl/airoha/pinctrl-airoha.c
@@ -303,6 +303,17 @@
 #define AIROHA_PIN_BANK_SIZE			(AIROHA_NUM_PINS / 2)
 #define AIROHA_REG_GPIOCTRL_NUM_PIN		(AIROHA_NUM_PINS / 4)
 
+struct airoha_gpiochip_regs {
+	/* gpio */
+	const u32 *data;
+	const u32 *dir;
+	const u32 *out;
+	/* irq */
+	const u32 *status;
+	const u32 *level;
+	const u32 *edge;
+};
+
 static const u32 gpio_data_regs[] = {
 	REG_GPIO_DATA,
 	REG_GPIO_DATA1
@@ -339,6 +350,15 @@ static const u32 irq_edge_regs[] = {
 	REG_GPIO_INT_EDGE3
 };
 
+static struct airoha_gpiochip_regs airoha_gpiochip_regs = {
+	.data = gpio_data_regs,
+	.dir = gpio_dir_regs,
+	.out = gpio_out_regs,
+	.status = irq_status_regs,
+	.level = irq_level_regs,
+	.edge = irq_edge_regs,
+};
+
 struct airoha_pinctrl_reg {
 	u32 offset;
 	u32 mask;
@@ -372,19 +392,6 @@ struct airoha_pinctrl_conf {
 	struct airoha_pinctrl_reg reg;
 };
 
-struct airoha_pinctrl_gpiochip {
-	struct gpio_chip chip;
-
-	/* gpio */
-	const u32 *data;
-	const u32 *dir;
-	const u32 *out;
-	/* irq */
-	const u32 *status;
-	const u32 *level;
-	const u32 *edge;
-};
-
 struct airoha_pinctrl_confs_info {
 	const struct airoha_pinctrl_conf *confs;
 	unsigned int num_confs;
@@ -411,7 +418,8 @@ struct airoha_pinctrl {
 	struct regmap *chip_scu;
 	struct regmap *regmap;
 
-	struct airoha_pinctrl_gpiochip gpiochip;
+	struct gpio_chip gpiochip;
+	struct airoha_gpiochip_regs *gpio_regs;
 };
 
 struct airoha_pinctrl_match_data {
@@ -2504,7 +2512,7 @@ static int airoha_gpio_set(struct gpio_chip *chip, unsigned int gpio,
 	u8 index = gpio / AIROHA_PIN_BANK_SIZE;
 
 	return regmap_update_bits(pinctrl->regmap,
-				  pinctrl->gpiochip.data[index],
+				  pinctrl->gpio_regs->data[index],
 				  BIT(offset), value ? BIT(offset) : 0);
 }
 
@@ -2516,7 +2524,7 @@ static int airoha_gpio_get(struct gpio_chip *chip, unsigned int gpio)
 	int err;
 
 	err = regmap_read(pinctrl->regmap,
-			  pinctrl->gpiochip.data[index], &val);
+			  pinctrl->gpio_regs->data[index], &val);
 
 	return err ? err : !!(val & BIT(pin));
 }
@@ -2529,7 +2537,8 @@ static int airoha_gpio_get_direction(struct gpio_chip *chip, unsigned int gpio)
 	int err;
 
 	index = gpio / AIROHA_REG_GPIOCTRL_NUM_PIN;
-	err = regmap_read(pinctrl->regmap, pinctrl->gpiochip.dir[index], &val);
+	err = regmap_read(pinctrl->regmap,
+			  pinctrl->gpio_regs->dir[index], &val);
 	if (err)
 		return err;
 
@@ -2547,7 +2556,8 @@ static int airoha_gpio_set_direction(struct gpio_chip *chip, unsigned int gpio,
 	/* set output enable */
 	mask = BIT(gpio % AIROHA_PIN_BANK_SIZE);
 	index = gpio / AIROHA_PIN_BANK_SIZE;
-	err = regmap_update_bits(pinctrl->regmap, pinctrl->gpiochip.out[index],
+	err = regmap_update_bits(pinctrl->regmap,
+				 pinctrl->gpio_regs->out[index],
 				 mask, !input ? mask : 0);
 	if (err)
 		return err;
@@ -2557,7 +2567,7 @@ static int airoha_gpio_set_direction(struct gpio_chip *chip, unsigned int gpio,
 	index = gpio / AIROHA_REG_GPIOCTRL_NUM_PIN;
 
 	return regmap_update_bits(pinctrl->regmap,
-				  pinctrl->gpiochip.dir[index], mask,
+				  pinctrl->gpio_regs->dir[index], mask,
 				  !input ? mask : 0);
 }
 
@@ -2584,7 +2594,7 @@ static void airoha_irq_unmask(struct irq_data *data)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(data);
 	struct airoha_pinctrl *pinctrl = gpiochip_get_data(gc);
-	struct airoha_pinctrl_gpiochip *gpiochip = &pinctrl->gpiochip;
+	struct airoha_gpiochip_regs *gpio_regs = pinctrl->gpio_regs;
 	u8 offset = data->hwirq % AIROHA_REG_GPIOCTRL_NUM_PIN;
 	u8 index = data->hwirq / AIROHA_REG_GPIOCTRL_NUM_PIN;
 	u32 mask = GENMASK(2 * offset + 1, 2 * offset);
@@ -2599,18 +2609,18 @@ static void airoha_irq_unmask(struct irq_data *data)
 		val = val << 1;
 		fallthrough;
 	case IRQ_TYPE_LEVEL_HIGH:
-		regmap_update_bits(pinctrl->regmap, gpiochip->level[index],
+		regmap_update_bits(pinctrl->regmap, gpio_regs->level[index],
 				   mask, val);
 		break;
 	case IRQ_TYPE_EDGE_FALLING:
 		val = val << 1;
 		fallthrough;
 	case IRQ_TYPE_EDGE_RISING:
-		regmap_update_bits(pinctrl->regmap, gpiochip->edge[index],
+		regmap_update_bits(pinctrl->regmap, gpio_regs->edge[index],
 				   mask, val);
 		break;
 	case IRQ_TYPE_EDGE_BOTH:
-		regmap_set_bits(pinctrl->regmap, gpiochip->edge[index], mask);
+		regmap_set_bits(pinctrl->regmap, gpio_regs->edge[index], mask);
 		break;
 	default:
 		break;
@@ -2621,7 +2631,7 @@ static void airoha_irq_mask(struct irq_data *data)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(data);
 	struct airoha_pinctrl *pinctrl = gpiochip_get_data(gc);
-	struct airoha_pinctrl_gpiochip *gpiochip = &pinctrl->gpiochip;
+	struct airoha_gpiochip_regs *gpio_regs = pinctrl->gpio_regs;
 	u8 offset = data->hwirq % AIROHA_REG_GPIOCTRL_NUM_PIN;
 	u8 index = data->hwirq / AIROHA_REG_GPIOCTRL_NUM_PIN;
 	u32 mask = GENMASK(2 * offset + 1, 2 * offset);
@@ -2629,8 +2639,8 @@ static void airoha_irq_mask(struct irq_data *data)
 	if (data->hwirq >= AIROHA_NUM_PINS)
 		return;
 
-	regmap_clear_bits(pinctrl->regmap, gpiochip->level[index], mask);
-	regmap_clear_bits(pinctrl->regmap, gpiochip->edge[index], mask);
+	regmap_clear_bits(pinctrl->regmap, gpio_regs->level[index], mask);
+	regmap_clear_bits(pinctrl->regmap, gpio_regs->edge[index], mask);
 	gpiochip_disable_irq(gc, irqd_to_hwirq(data));
 }
 
@@ -2638,14 +2648,14 @@ static void airoha_irq_ack(struct irq_data *data)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(data);
 	struct airoha_pinctrl *pinctrl = gpiochip_get_data(gc);
-	struct airoha_pinctrl_gpiochip *gpiochip = &pinctrl->gpiochip;
+	struct airoha_gpiochip_regs *gpio_regs = pinctrl->gpio_regs;
 	u8 offset = data->hwirq % AIROHA_PIN_BANK_SIZE;
 	u8 index = data->hwirq / AIROHA_PIN_BANK_SIZE;
 
 	if (data->hwirq >= AIROHA_NUM_PINS)
 		return;
 
-	regmap_write(pinctrl->regmap, gpiochip->status[index], BIT(offset));
+	regmap_write(pinctrl->regmap, gpio_regs->status[index], BIT(offset));
 }
 
 static int airoha_irq_type(struct irq_data *data, unsigned int type)
@@ -2683,12 +2693,12 @@ static irqreturn_t airoha_irq_handler(int irq, void *data)
 	int i;
 
 	for (i = 0; i < ARRAY_SIZE(irq_status_regs); i++) {
-		struct gpio_irq_chip *girq = &pinctrl->gpiochip.chip.irq;
+		struct gpio_irq_chip *girq = &pinctrl->gpiochip.irq;
 		u32 regmap;
 		unsigned long status;
 		int irq;
 
-		if (regmap_read(pinctrl->regmap, pinctrl->gpiochip.status[i],
+		if (regmap_read(pinctrl->regmap, pinctrl->gpio_regs->status[i],
 				&regmap))
 			continue;
 
@@ -2698,7 +2708,7 @@ static irqreturn_t airoha_irq_handler(int irq, void *data)
 
 			generic_handle_domain_irq(girq->domain, offset);
 			regmap_write(pinctrl->regmap,
-				     pinctrl->gpiochip.status[i], BIT(irq));
+				     pinctrl->gpio_regs->status[i], BIT(irq));
 		}
 		handled |= !!status;
 	}
@@ -2719,8 +2729,7 @@ static const struct irq_chip airoha_gpio_irq_chip = {
 static int airoha_pinctrl_add_gpiochip(struct airoha_pinctrl *pinctrl,
 					struct platform_device *pdev)
 {
-	struct airoha_pinctrl_gpiochip *chip = &pinctrl->gpiochip;
-	struct gpio_chip *gc = &chip->chip;
+	struct gpio_chip *gc = &pinctrl->gpiochip;
 	struct gpio_irq_chip *girq = &gc->irq;
 	struct device *dev = &pdev->dev;
 	int irq, err;
@@ -2818,7 +2827,7 @@ static int airoha_pinmux_set_direction(struct pinctrl_dev *pctrl_dev,
 	if (pin < 0)
 		return pin;
 
-	return airoha_gpio_set_direction(&pinctrl->gpiochip.chip, pin, input);
+	return airoha_gpio_set_direction(&pinctrl->gpiochip, pin, input);
 }
 
 static const struct pinmux_ops airoha_pmxops = {
@@ -2931,7 +2940,7 @@ static int airoha_pinconf_get_direction(struct pinctrl_dev *pctrl_dev, u32 p)
 	if (pin < 0)
 		return pin;
 
-	ret = airoha_gpio_get_direction(&pinctrl->gpiochip.chip, pin);
+	ret = airoha_gpio_get_direction(&pinctrl->gpiochip, pin);
 	if (ret < 0)
 		return ret;
 
@@ -3009,7 +3018,7 @@ static int airoha_pinconf_set_pin_value(struct pinctrl_dev *pctrl_dev,
 	if (pin < 0)
 		return pin;
 
-	return airoha_gpio_set(&pinctrl->gpiochip.chip, pin, value);
+	return airoha_gpio_set(&pinctrl->gpiochip, pin, value);
 }
 
 static int airoha_pinconf_set(struct pinctrl_dev *pctrl_dev,
@@ -3201,16 +3210,7 @@ static int airoha_pinctrl_probe(struct platform_device *pdev)
 	pinctrl->desc.pins = data->pins;
 	pinctrl->desc.npins = data->num_pins;
 
-	/*
-	 * some pinctrl operations (ex: get_direction) might use gpio registers
-	 * before gpio chip abstraction will be completely initialized.
-	 */
-	pinctrl->gpiochip.data = gpio_data_regs;
-	pinctrl->gpiochip.dir = gpio_dir_regs;
-	pinctrl->gpiochip.out = gpio_out_regs;
-	pinctrl->gpiochip.status = irq_status_regs;
-	pinctrl->gpiochip.level = irq_level_regs;
-	pinctrl->gpiochip.edge = irq_edge_regs;
+	pinctrl->gpio_regs = &airoha_gpiochip_regs;
 
 	err = devm_pinctrl_register_and_init(dev, &pinctrl->desc,
 					     pinctrl, &pinctrl->ctrl);
-- 
2.53.0

