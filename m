Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11023138.outbound.protection.outlook.com [52.101.72.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16B05471266;
	Wed,  5 Aug 2026 12:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785933314; cv=fail; b=UGIzwspMwwM8iq0f+oVjbtVXE81UI+ZPeZMpUiST6YZJ/wxzZurGNLgFRyDhiDPDaG8yMGN4uVhhG4du2iZSX4YET2SNy+gG84Z8Y6HigXjs5Q4a0Xg1xrck1wDj54+iomlEXUcY0B/VY8teJJuCnWsszVAYi5g5Hl3nX92IWrM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785933314; c=relaxed/simple;
	bh=1fXvwl+zIUfT8ob6DiWPSrnliQlwIoSbcWpGhp7/TcM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=STYE6z8KthHsZQ3WuT9aVVTj7q3rLAdJ9kN+Jrk365DVaTKowqmwqujIjt8qKhay8qFobxSZ6uQsgeDTjf5nNSTehVEOm2dy3HiqLVBFjmDKyirpTadJKBFN85XlbSd+DK6TTcLO14Dg/3XsNVaXZA+YxpZhCPxx0cNPrq6nuuw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b=3LbUqPm7; arc=fail smtp.client-ip=52.101.72.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=genexis.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b="3LbUqPm7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yOkHvI337uY8sVY/YwSl4p8H4RZyvHKy3VzZK0/QuYxWWXIOWlfJsE5pQhIU6gBIKbXoVDb+UXzC2GKcrFl+tgvJAtqZSrpTNpXVDtWtMphIlhfcYJcRxB41HKW92EgBL66F+uqq4r7iTJIdrqZpWLaBsq731t/EVyilgwhCVx6zFXtPClcSkh/9RG3Wykw9EjSsszOOizFXeCyANDvmmu5qVr0xYjSyYVlImURPIo/j9PxyMp2jvWAuerGKFsvWo+QTT0r1BxIuesGQY3tD6luQ24bVvngbmL7BwHfSlKmMou3GVCawfl6zzkkYbw3kfeWVg3t1T6FBcFctojNOxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x96+8V+Q2xksE07KImWBg62a2bDDqZeYwIHugITR8/s=;
 b=ahbwyfKO1ChkIZmLJkB4mGS+iJ15r4aeKwMa+mb3ZT4cSVAW9DVfIcIhw5YhmYMksOPLbUNHh2rmrMzTbTwzg4XH5tvaeV7P7g43YpGFlI9qzm6XQH2K2C2VS3AjBFjqg0GuIGupYajkS4mrvuca9ZPRRsMlzNoNEOBDGmY5N07GZG9MdG/+PilUrFQx7rsi4nJgg3EJetwKeJR+TWoOM5laFsulFNqJqJidbRQZ185S6BhtlMxP8sVGomO4p9pWwN8/SFvaUtZh9/dPCZ7bF7Af15kkK0OreODdUA3UfV3alNNzhcljCIPd6H3KHVkcUJH8gAn4ZggWYOT/I9j6cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x96+8V+Q2xksE07KImWBg62a2bDDqZeYwIHugITR8/s=;
 b=3LbUqPm7Vfjvzlui45+rR50gOeZscKJaJfk+yH/WsBwBUP9oBdqAbRr7DpnMSefADix8qARkgOueO4DdZA8y8vivX8xVkhleAG3Xwi36CfKUj63j/1vjlMJPd9jqDdJ4bIsbNigQP7itUt45NkyefXrC5WG0vkIdskXhoKJVzR2PtvUKAPf3ZPjRvoHU1a3BYDPgn3yFSiREccFt42ZCEX106Mw11NRs1ec25tyELiEzY9GqG2dfvZfPIGOh8sSKtn0Agag4TjXPxrmXzGbLXAPmEUZUmuNBig1ApdQ1nWAJ5WBbhEGTKwPluUkHy7f+/2j3xRYbEwJMsRJvtenKBA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by PAVPR08MB8918.eurprd08.prod.outlook.com (2603:10a6:102:323::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.19; Wed, 5 Aug
 2026 12:35:02 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0292.013; Wed, 5 Aug 2026
 12:35:02 +0000
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
Subject: [PATCH v10 22/36] pinctrl: airoha: statically allocate gpio regs structure
Date: Wed,  5 Aug 2026 15:33:54 +0300
Message-ID: <20260805123408.3767648-23-mikhail.kshevetskiy@iopsys.eu>
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
X-MS-Office365-Filtering-Correlation-Id: 5e636f06-46cc-4509-8e04-08def2edf899
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|7416014|52116014|376014|1800799024|921020|38350700014|56012099006|11063799006|10067099003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	ou++zJb0kVAu7IhmGEOrmp6OO5hwf2rKiVRq/5xD3s4JoeLe1MVSTFg5vLhVsIB3gw9MMv/1FpWYXxFiQlzDK6UcyJg/owPpqwKSo/7c++C/mPqD6m/I+bXMF51UaKqTkuvhr4X3e31sd1z4v+IzSGeCeCCLZ+LVZOVVkGwR873O9YnS6/SxKZr7xBRDF4mtFCVzAfhy9ZxDw9jJrIo8qtc4VUmP5+cVVO/jrcRAR55ISTvUR0+beUoHjLOosHhC0FgjqvFD3URjESp/PoXNIyW3RjWSUOMIfFKIC2XMG7Tv8C6x2uljqKYG5Yv14VA5BeBA9WtoCs+5/s+zeiHFsxtJ3oMwR5FRS2QkEPI2m80Oq+9uyuMRoJzKzrZK4nHFK+v5x9YrEGsSW/IUQ+8XjaY1AZM0hss1MxHCquSI570/k5YaH4DzUHMib4jL+Tx3Ck/CwDsT2JiHF52OEhgo1Ql4z61efZo9S+++jA/Ok5S4behY5eLM8sDH7LR09XWc8vhWSg+efF1XEqnkZZpOA2fqVaSLxUUvGFjOu6Ed0NZvgMwIn7DkJLuz3f3IAsNz58nk0XH6UpntRb/0Sv4W2luHvEN5f2aMVdYIWrS4k87uVqAOKiOPwVetK0NsnNtvk4Qn7GoXCcmVy8HjXO+sjkBb522XyRzcrd+n+hPIsIFAoNTfs3D0P3pwAsjPJ/6K6uLeQ7PxDlY4AJW3XhDDRWFFn1SqFut8+sgG6IaMEXdj/aHXkw9NPk2q5MUpmRj+
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(7416014)(52116014)(376014)(1800799024)(921020)(38350700014)(56012099006)(11063799006)(10067099003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?vdyOtw9i6r73ti+LtN6vXYWT9i9J/KUvbf62ET+6g4KU0O+LISIZ1sc0+mmz?=
 =?us-ascii?Q?ZeDZLzuDz2CFy7r7JGYOyavGWC9Ac+ANpw08yByE+AHO9dngRl/nQrU/xBkp?=
 =?us-ascii?Q?ojbsiHXtEd7qbaMqt9YPnCkNO13YDL7qtvyMfKgmI+Rm8aTObwBGRXtiFgzk?=
 =?us-ascii?Q?KLRAetICGIQ36OtFEnowKNHqvizzddeHrqJnvfz/2aRLndsdidv8Z+Ha8Tw2?=
 =?us-ascii?Q?k2Tp2U77z07NEAbhXLFADYa8pNEE5Ese/JwLTgD7mAQZkQ0OyxqVzCXsgNiu?=
 =?us-ascii?Q?GdoflAW8yG0y94BEHjSpSfbmoqda0UPAYytJCu5ITiRCrpH9AEWbDYxEJ6JN?=
 =?us-ascii?Q?J4WmTJyw+/sldh47peRgNnlq31NRAuZLE4kvUVq5OXxFDGGkRBnrmFKWGRPM?=
 =?us-ascii?Q?bUztTxcuVCNHliru4wddVtZLkSddDmgRFi1Nq0yxnbqgmVFreoLj0xHgDUli?=
 =?us-ascii?Q?UhaZ6kbgKRL84iyzW8jiX7Ehp5vIsjb20gsidq6bAH2MVRjC4FEi9EqC1aa2?=
 =?us-ascii?Q?nTKqHEWBy6MYkQpJcyK2Up9sHXjX4HDPbmhOOrRV52NNTeVQptHgv3CmUr7v?=
 =?us-ascii?Q?35apBvA3riwK1ydfOpAJahdyAqiDWRUybmtdUTxji90yZLWWlsgLogCWObwt?=
 =?us-ascii?Q?rvjFSG+J/0BqBkH62OBODv03FEbbOV6dbgtQ+Se8HaCI64xg3+y/YvPqqmPE?=
 =?us-ascii?Q?Qjc7gNbRLcmgoob8kSjjI8VTzXs87gWaPQtCDsVD7MYtFs6DnPNmWYlF26e3?=
 =?us-ascii?Q?gllvq2aKiJ9LwXjOcTi2V/CZiYAUpIfivioYcaXShBSj1umh4dqLwVQqsVNo?=
 =?us-ascii?Q?nvDxoc5Nsi9SxbWVFA4nuNo1cEfg64ue40WN+LRJcv2QSwZniZHB0f/IKdUt?=
 =?us-ascii?Q?yOC8RpaqH9F52vnTuOhPhKBUQwfJE6EMEJjdopP6kimjidxeiKGmxPncn9cR?=
 =?us-ascii?Q?d3DVByo8SeagfbdpgYl/l8BUcwWiCYLIbfxDG+r5LXykpAx0aLLKOluLP0rA?=
 =?us-ascii?Q?3PUWVA+bIwT4FdEjtgebn+3hRpLKq+UpVj95EheMwCafF7B7IZd4l2M0hvHb?=
 =?us-ascii?Q?cNi51iqr37QmBF2Irdf/jieRzd/2gipd4LVnVCQz9osT10bJEG/J7u/vZ4mp?=
 =?us-ascii?Q?fwu6RAhD3U48Rv47vCdY7nJ9hF2hMUqXXjpj2D+VgfBY6hw4NHOzWdp93s9m?=
 =?us-ascii?Q?9QxngsIdRzutDyw3hAVRLeZ4O2VJ+fw1fyoTfJXRC4DHdai6ITn2foH/uDwV?=
 =?us-ascii?Q?htJj7FK/vFQWOh1V3d5xok9p8TT/jFwKi+HBeYadVazFVh5GXJYbRmI/Tg27?=
 =?us-ascii?Q?jQfwZnItqeqsKJaTev8PniE4aXEnut2zaoYNqkU+phEiCruqBua5Vc+yC/mK?=
 =?us-ascii?Q?/vx5QiSBn197z4MQzRjfBK/GEw7Yxa3EN/hmAUp6wAwOOVI/FuBOUfBbxBF4?=
 =?us-ascii?Q?Hd476Z0+RS92i6Zne/ZcOH2SV8si6cHh2d8BDKKOUWDvOQ34+uvcM9njvNF6?=
 =?us-ascii?Q?sP8HnxblvxuA45cE+DbJqbXVUSDa9UnKQ3DHaHms/2hqyLQp4ENB/cALX/Ep?=
 =?us-ascii?Q?zisIcTG9YLV8JtiraAmrMT1xd6TwaNAZfZZejIz885b9gVJeuukhGFM1/SLo?=
 =?us-ascii?Q?P8SYgBTqswwWrWKdzpCzYoFZ13KI7YGV5IkMzDYxdka3iwHpu7SkHrTL0Ala?=
 =?us-ascii?Q?Zvm8mWDsWP5u6JjZZ2W3Ce93khfneJcprEpvCDEqT0tuktni+LsPZMdMV847?=
 =?us-ascii?Q?6myFSbFEsVqngwN2TXIJQ/WfYgFHjXc=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e636f06-46cc-4509-8e04-08def2edf899
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2026 12:35:02.6334
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d7pyQbmPCOrZkXa5jreebaNQJPTvPe1KDEzq4lMycr7FcbKbIeZJs0zVNNqs2Cym80vf8r8UUMA8DFMXZgrWqYA0bIiKASNyM7zT6QbWPp4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB8918

just a small refactoring to collect all gpio register information
in the one statically allocated structure.

Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
---
 drivers/pinctrl/airoha/pinctrl-airoha.c | 92 ++++++++++++-------------
 1 file changed, 46 insertions(+), 46 deletions(-)

diff --git a/drivers/pinctrl/airoha/pinctrl-airoha.c b/drivers/pinctrl/airoha/pinctrl-airoha.c
index 08715a37f0afa..641b547a3276a 100644
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
@@ -3212,16 +3221,7 @@ static int airoha_pinctrl_probe(struct platform_device *pdev)
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

