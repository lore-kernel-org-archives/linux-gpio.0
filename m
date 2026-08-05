Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11023138.outbound.protection.outlook.com [52.101.72.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5947B47012F;
	Wed,  5 Aug 2026 12:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785933304; cv=fail; b=IDMshrIEv+K0fvxsA18cyxg+Uzv1CIX9p7u1CnB3u14y8/twqsO51XE5e5rNsN5Kwd9oPDYyVXorDlRHZGPmnNvyUyjOABajiKNzS0orMJPOEvJH12joRfufNu3uyTLoWVh0O/80qky9rI4WxxKBmY35Zgl+UGR/R0actSXWxSg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785933304; c=relaxed/simple;
	bh=cDZ9wzSKykiLB4ehvTeQvew4umiMY0xUpu9wtKvTxSo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=BEq07TjwZuVtwCZ0djA5KkhfvouZCM/emeh656frEF/MoZKH5VEM7p4lRmkk9DQxZ1yra7kHg0VXkmHVg0TCgTkIshqGtY/FYqFPMEn2x4GjbN0XLpQ27VmWfRUpEuVe80dZ7/Bjf4I0PfDjk37zoJDtGrEKxuz+gRI4StE2jaw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b=y5Lnfyru; arc=fail smtp.client-ip=52.101.72.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=genexis.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b="y5Lnfyru"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y1p2exv5dyIe6qPAh1RBK1fTBuxy00z743H1jVY8TLCpeeJBGTOW3zPGhrROzpEE0Pn4bD8z8R2qseco+x8i/uktqZWtCnPMMc8F93jm9Mq1Qydx1zss1w9Mj4W2mUWOz0/HDzKEitq7CcpSkrLzp7KqxKHaVga4HGOYVj31pMYwjwH++Atl49tTpH+J4Ox4ygju3WghW/ddynh0hnYXuS+yFOAOx1SUnEmyfQC24K5LuzG62R1xE/4+GANHZF399arE3WvdXQtt2i9KMkjeJn+i/9AOPjjzHu+3wCn9bTUOfoIan+xErE/uuDhM9GZhxXhM+Veb5AnVh6HhTUMkEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SSMKXgi53rkYy+vsB+7Uk8nMjeQ2TMynDU88jmtLCfA=;
 b=EzAGUZ6P3Fz8525dL3KHzwipsqdJ/5Er7Q2pJfs9HXud43VEbZvapz6wglKtwyJimxVVT/R6VWignWj1yPA4Q/Uf6Tw253gf2osjTqDigOP/vlL7XnGoYg9ogP//A8UWuizBer2RHioeucyEKX1MY3hllJvPHas4OKbUaSc7s4RlhJdJqZ8xrsuVSDyYqQ8/GTo3Kyz07nQOZdbKmCRoywY4jx0debBxcN3c4jGkUTRcyMlrGJrMzSkSPCqsoq3o4ft8Wl+t3P7A7F+FzMyL0+hf+R05E9Jh6TjI8iqVBmR2ICoNEn6rzwEEDd5T6ijGQxUDsgLZHy9aSYOjKOlreA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SSMKXgi53rkYy+vsB+7Uk8nMjeQ2TMynDU88jmtLCfA=;
 b=y5LnfyruprBRBis/hu5BaSZ9VQ0ZT0zQPBlqrDN3KHdCs7QZuNGM4lJvDMiY464RsK5/At/tZsO1e5xMTHQuJaLfj+wk7chb2sasJsVsKuZc6miAXvYpXPGmoFpRFlct6/BpqJV/Q/FQpjGBvV251tEIfyJTQMqdm3CszSa2XSAzg3qceZ3oTN8VvlpOI5pDdqqhHnHRgBbIp0Eo41vxs41K05YfP5ofosX7xScwc8BiakBrQUwiNsu+ANHCuYpaRsU5kowKfWEwLPljcOXXqvJMmMLzOgPj9/0Hsfn7Jpqs+tmFVw5L//bOBSXmJBljdjI4WFo3TJ9xkVNPC+buiw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by PAVPR08MB8918.eurprd08.prod.outlook.com (2603:10a6:102:323::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.19; Wed, 5 Aug
 2026 12:34:53 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0292.013; Wed, 5 Aug 2026
 12:34:53 +0000
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
Subject: [PATCH v10 17/36] pinctrl: airoha: fix getting gpiochip/pinctrl pointers in the IRQ handling code
Date: Wed,  5 Aug 2026 15:33:49 +0300
Message-ID: <20260805123408.3767648-18-mikhail.kshevetskiy@iopsys.eu>
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
X-MS-Office365-Filtering-Correlation-Id: b4146d2f-8bde-4b47-dd27-08def2edf30e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|7416014|52116014|376014|1800799024|921020|38350700014|6133799003|56012099006|11063799006|10067099003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	Bbsjs2zxY8oi6RRU6d94lS9r00CGQ0bFUHWVoBSWoklTum0y/gub9tvCMBkirtyrCUP4l0sujRE/kcoxMJ9Sjd6DwLpZ/6Z4qcf1YHUb86iizIV42+Gj2D5FXY9fwuGpkaYYdHLNpXGF8FQtJ271yyB3RhllTPG0KBb/9f0iatiZZruxM/voBJ928FbN0hV/K6wBjSuKaKfeZ3uOXfDqBlQTWHBmJJYeBJzZfrI4UKBEim/errPtIqgTfhoL8YPKKs9HMu3AACVqo+b0SbXvhxYmjJAdab5bftCX6XWuZVcE0cBh6r8MOYC64HdJfUffxfilIQuzySxQXmwVpDmvS55NjvJnzZuzhnC5RqsKEhEadVXT2YhXBWACnKNINFu9FAQG9bXL2aeAHLe54rE0kVCZ/Xpwzz+CSLgqbTJAM7BdRJVQaJ6cWw3SvdMR7iiOdHnuLJNopzl6V7uECbOHyqcztxjvwI1M31FmYpNpjHuQvBP4B4h7JiRDnxI/PkyjQzmdXxuVPTDgYrKUkZXfgv6cQ5YO4D875Yvn0McYLm7BqqI9ahn1HZaDxpwe6vF8K6+sYbcchQYjB59MQ21OYSANho+DEnJQ9ZlY9MwKbCarMr5vM9Bx+gvO/85qLoH6LrvL/+3Ccg8DIO63curiW7XBO7jR5UP+EcVgpUeZMkfr0WBizGyCClHMa9uX7j2umpTQdoc7tELj8tgrzg4A6f9xvwLxBJmh9WR7l4Pjdjh3RvUwvI1q8DZsrhcscEvf
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(7416014)(52116014)(376014)(1800799024)(921020)(38350700014)(6133799003)(56012099006)(11063799006)(10067099003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?9lJoYEZLEJqWQZ8CAZdY7u6vbWiH802FpNmGt+Df98QSeJF8Ue5+Guavf9Z2?=
 =?us-ascii?Q?gkj2MfzS3oHcg3dqk5SYIrjtRPJ4wWgpwXYi1TxrjcZS+5OAvOh9N34AFaP8?=
 =?us-ascii?Q?z0aV4P1gcLqklcJkYJVxrF1XAIKblwylTxALIV+QO+BG1/QpW5joVx2R/mXV?=
 =?us-ascii?Q?5gPHrXp5WjPDE4uZptvAc7Rrf0fTcCNjv0WBpaPjbh8KjKvfly1xkrs59p5Z?=
 =?us-ascii?Q?ZFeYfLMUsAKi/+naI4/Tkh4m7NyaijtosPxydKKu4qgivRZyFXKwboeD7KAb?=
 =?us-ascii?Q?SmoKAzKjmSis2HpUE5Cp5qk/4e12UmUDnrfjtmAjabunMLbKoZG5DAqMAgTK?=
 =?us-ascii?Q?8L35tNZb4/26YfnK3XqjUk+v9XYmTofbzEVsq2x7ZQazxWkRp+2wV0dsk+sD?=
 =?us-ascii?Q?h6drenJie+r9EDcT+W13LfCMAoOSmpbz+zPTQ9TRLNl77RD/5Qxuuje3aE+E?=
 =?us-ascii?Q?A8vrxHaxIAFJ2PwUd6MvtfnZfNohSRmff3IImURu27hNTQXJzmRDhON5n3qD?=
 =?us-ascii?Q?fheXGq+m7CtofAgv1ibDmUvIj0CsIMOO7D/9V7w93vuOVP3gs1b28yQkt06X?=
 =?us-ascii?Q?991b0ofi10onuSyucXUuFIou7ydNuJIOTyswBLEI/HsoroEkMZeDB8dKyEmO?=
 =?us-ascii?Q?N+fmsEwAfUPedQiZUMDn9tr4AnlHVWpXK5aTG4I2O1kO6FWk+qMD+XZfR8H9?=
 =?us-ascii?Q?CIYOoveSJtivo9XlrR60cV9j1NVElrYrsRTSHW/29IUX8Vxp9CQmUCrkyqY9?=
 =?us-ascii?Q?Uy4sPr+r5fDss8Q3HMT8LE84rFlUoe5Kx0yix6niieOpsqwJif/eZHEtd3uA?=
 =?us-ascii?Q?CfWhP3aogZADOeCQaER3MfWu+H1X0z7df7FBNSa5W2Hd8ONs0qKH7bZh5y48?=
 =?us-ascii?Q?1o7FUKfy3L/s2ttsAoC54QCOB4hwJKT7dwcBtIXYcsl3l3Vz8kximyJB6wah?=
 =?us-ascii?Q?YuASxlrnGuEVsC+Su/IXBUiXyfPp4qgJOBRciF1UtYwl4Cy7yDyrQz110ufc?=
 =?us-ascii?Q?HF0wnPFmWHONe9t2YW23RV1DyxXLRThtivQKQ1b0wY6Jtec85CD0aKa6Un1H?=
 =?us-ascii?Q?VtnHfsq+ho/u2FOso33AuDoFBfHCpzG0ZGoczL9rk0MFCStdwOJ42ppPQlKG?=
 =?us-ascii?Q?Fsr0S8Oc9hksyw2G5gyhZLtd/ZpAbhTtD91A0DBWprb/R8ciiOuTok06ktgx?=
 =?us-ascii?Q?1S2lLjdGepVOQZabaUk3L5yMgQqNsSKBfoHqNik/AUeg/gi0JwSfoBRvbfz+?=
 =?us-ascii?Q?Jx4/VAAsch8BTTEpnpv4gsGIEjQI0YXJRhO8UyVjPPrB8kxAqemS+5iL1fpu?=
 =?us-ascii?Q?ujSypVN7vdYy5W2e2ZdrBzOYG7c03obap4bgd5mC+g6KMt9q9OABCy8F9yVO?=
 =?us-ascii?Q?T5/LBNo1QumYMpD7hRCwzJKxFSNBjui/y5hYUR4xWvoDwgj3fnWWH9Yy4mBZ?=
 =?us-ascii?Q?K7vwO8QtcwS5WwrjX5e242myt5rGSi7JjMFLhFLMXmGvo3v3AsBvZEAg+nAg?=
 =?us-ascii?Q?beL/yF5Ey73LEdUlvdkGdsAeV8+eWBKrwo7u32RJldivfEoTO0vzP6XFm5Qp?=
 =?us-ascii?Q?HZEmXXK2W0ahgFuV+gqtanCP1A13o1HXTz9zxX0l2kEDMZRfEgoMDMa5X3NX?=
 =?us-ascii?Q?qZvrPAgmS3FRo/wiiGLbylg1Hvu7BtoGdJV7ULWQeRkCzRZ1ppAKlH5mpGQn?=
 =?us-ascii?Q?kUwF87omO4Wu/IZv03/XT8KHyUHp3yxBU4CeaouXqusSHxggoX+9qV7nzIZ2?=
 =?us-ascii?Q?C6DrCUzApiGzhrazlClzBaMicS5rUxk=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: b4146d2f-8bde-4b47-dd27-08def2edf30e
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2026 12:34:53.3796
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sx6zpAv6nDzGKbt41db/nmItDFbTnrFDY7ihrm9bHXffumMOpld3T3vyyFjOAQTFVXrQMWzJtdJIYichSfjqbPuN6ipv44WC6Sq1bQzeemo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB8918

airoha_irq_unmask(), airoha_irq_mask(), airoha_irq_type() functions
impements brain damaged logic to retrieve gpiochip and pinctrl pointers.

Details:

    gpiochip = irq_data_get_irq_chip_data(data);

will initialize gpiochip variable with data->chip_data value. This value
initialized inside gpiochip_irq_map() function

    static int gpiochip_irq_map(struct irq_domain *d, unsigned int irq,
			        irq_hw_number_t hwirq)
    {
	struct gpio_chip *gc = d->host_data;
        ...
	irq_set_chip_data(irq, gc);
	...
    }

Thus gpiochip variable of 'struct airoha_pinctrl_gpiochip *' type will be
initialized with a pointer to a variable of 'struct gpio_chip' type.

Luckily, gpio_chip is the first element of airoha_pinctrl_gpiochip, so
gpiochip pointer will get a correct value.

This patch implements correct logic of getting gpiochip and pinctrl
pointers.

Fixes: 1c8ace2d0725 ("pinctrl: airoha: Add support for EN7581 SoC")
Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
---
 drivers/pinctrl/airoha/pinctrl-airoha.c | 20 +++++++++-----------
 1 file changed, 9 insertions(+), 11 deletions(-)

diff --git a/drivers/pinctrl/airoha/pinctrl-airoha.c b/drivers/pinctrl/airoha/pinctrl-airoha.c
index e4bfbd1571233..0f2837320d1ca 100644
--- a/drivers/pinctrl/airoha/pinctrl-airoha.c
+++ b/drivers/pinctrl/airoha/pinctrl-airoha.c
@@ -2584,18 +2584,17 @@ static int airoha_gpio_direction_output(struct gpio_chip *chip,
 /* irq callbacks */
 static void airoha_irq_unmask(struct irq_data *data)
 {
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(data);
+	struct airoha_pinctrl *pinctrl = gpiochip_get_data(gc);
+	struct airoha_pinctrl_gpiochip *gpiochip = &pinctrl->gpiochip;
 	u8 offset = data->hwirq % AIROHA_REG_GPIOCTRL_NUM_PIN;
 	u8 index = data->hwirq / AIROHA_REG_GPIOCTRL_NUM_PIN;
 	u32 mask = GENMASK(2 * offset + 1, 2 * offset);
-	struct airoha_pinctrl_gpiochip *gpiochip;
-	struct airoha_pinctrl *pinctrl;
 	u32 val = BIT(2 * offset);
 
-	gpiochip = irq_data_get_irq_chip_data(data);
 	if (WARN_ON_ONCE(data->hwirq >= ARRAY_SIZE(gpiochip->irq_type)))
 		return;
 
-	pinctrl = container_of(gpiochip, struct airoha_pinctrl, gpiochip);
 	switch (gpiochip->irq_type[data->hwirq]) {
 	case IRQ_TYPE_LEVEL_LOW:
 		val = val << 1;
@@ -2621,14 +2620,12 @@ static void airoha_irq_unmask(struct irq_data *data)
 
 static void airoha_irq_mask(struct irq_data *data)
 {
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(data);
+	struct airoha_pinctrl *pinctrl = gpiochip_get_data(gc);
+	struct airoha_pinctrl_gpiochip *gpiochip = &pinctrl->gpiochip;
 	u8 offset = data->hwirq % AIROHA_REG_GPIOCTRL_NUM_PIN;
 	u8 index = data->hwirq / AIROHA_REG_GPIOCTRL_NUM_PIN;
 	u32 mask = GENMASK(2 * offset + 1, 2 * offset);
-	struct airoha_pinctrl_gpiochip *gpiochip;
-	struct airoha_pinctrl *pinctrl;
-
-	gpiochip = irq_data_get_irq_chip_data(data);
-	pinctrl = container_of(gpiochip, struct airoha_pinctrl, gpiochip);
 
 	regmap_clear_bits(pinctrl->regmap, gpiochip->level[index], mask);
 	regmap_clear_bits(pinctrl->regmap, gpiochip->edge[index], mask);
@@ -2636,9 +2633,10 @@ static void airoha_irq_mask(struct irq_data *data)
 
 static int airoha_irq_type(struct irq_data *data, unsigned int type)
 {
-	struct airoha_pinctrl_gpiochip *gpiochip;
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(data);
+	struct airoha_pinctrl *pinctrl = gpiochip_get_data(gc);
+	struct airoha_pinctrl_gpiochip *gpiochip = &pinctrl->gpiochip;
 
-	gpiochip = irq_data_get_irq_chip_data(data);
 	if (data->hwirq >= ARRAY_SIZE(gpiochip->irq_type))
 		return -EINVAL;
 
-- 
2.53.0

