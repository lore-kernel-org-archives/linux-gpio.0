Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11021121.outbound.protection.outlook.com [52.101.70.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FB323E51DE;
	Mon, 27 Jul 2026 07:43:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.121
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785138200; cv=fail; b=P7E4uXmfv6s15Q5hRYHi32ijEG7REgKFbiLcu0J/+PR67OHfnWTKzz27hNng4vDSJoGOBrkCRZ9R630E0vhMBpYnvLyWYeJW0gA5FC0J6LwMZiRFgvhrcv5VXO43SbKvxa60+608qKdGjD83Lnm7p4RTQQGg35NnrooDWYYT+Q4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785138200; c=relaxed/simple;
	bh=++ZLD8bWHE5bzQ2udhZ6gqN/XCCjYCDBvYPG6hQRND4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=LVXwJqgcQhvOK7yWkGk1pZNs5r2ew8aN5SditG46q2o0WdBfMJNzVDBM7HzTldvNMUScyMRpLoXaZ6tIZeoaZQyXqjrIrk+HjZfmcyHbjn7nW5Zo67baQguv478dZVN0D3aeu0kluY8dWY1jgqR2+IcBTVG7DxqZ7kIM5bksIw8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b=IstXP/8H; arc=fail smtp.client-ip=52.101.70.121
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=genexis.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b="IstXP/8H"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gj7Sj630uCDGwHc1lyqfoyPJ1gwoX0ChEWc8zc/DLWV/zw2FUcMGvNYDaeNoKbS8cKrd8QHdu592pjGeYFEMSbAjFBUmAgi2MKZkI9bvGlEXQcbBmWgH72tjGFM7dQOypfQ2yDGeAkRpdCmiuE7jGJG9BbLwpFbspLSs1n006vmJjHOQ+OwtCG2+Osl19Xu/lSPNfjBQKwCei/+fYGEdYYlBFU7gTZ8wtJrNOa779wD2bDB/60puPJY1IiWQxWV+ZI9KY+REg7OKXHqlxl6GooSL9x0gVY/9t8Sq36ya8v+pMGxVjdZPgtH/nLbWNBu8sXi+/NnMJMlAo4GgvpL94w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f57EUSiVNLiQ03ZS/KzFwfgoTB0hLt8svZgifG5NQCc=;
 b=PmNxcI/DufdmmJcs7DDnAKfBeSn+dPqZ5qefwIfaJnvDn7tQvNAEpFhOSgRqLmHiHYakV6JsSucKaO+Lo/u85Yxrx1FiCLU1wMQP/eAF29pVkClXfqhW+JUHskCQmPApA0GLdGIwpQxqErbu11jlokU2IjJ3NA2ZaliK22xus1lSZQAmFHCV0iaZL63jImlm1iYGYhL1QpWwCJOAW/UmlTzMyfR+AH7L3tdABWvaI2NNmTBARnFxxYRqkPejLiPr5cUgY7rZJJrilZMoFzANLiWL1o4tR89ASP77VYluuvSlEW+tRJWW9T0E1Z8CkgsTYr/Pghn0GSInQjcQDaanHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f57EUSiVNLiQ03ZS/KzFwfgoTB0hLt8svZgifG5NQCc=;
 b=IstXP/8H4hO5+WuOrz8a+4nPM8nEwMGmVQyGv0Qw5rt0Azxqu/UzdO0Ce9KkcslCRCnsxhWL5EOjEJ1UvWVr7SYOe7FqYPZRSDAPcPGxrXWyaQEXdg2Jqw9ZUyXzba39cS8BVIbDr+k1FlgYNZVVgpZ0XFWeIt/J/GwwuxvveHAl9eyIhfI0szZU8pr3bOhoUUxlcu5wuZP4g8bwPT2qg70O6Bk1A744481oI/pTUtIKX4q8H+MfuA0e/A5ARorFFUKwNxCy36Wk0WjJtcuNpA0JtZifGbNdSibieXugUbSKxHhAE3/DT33wtmXJoUv6rL531ZDUsQMpGg91SwMmkg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by PR3PR08MB5868.eurprd08.prod.outlook.com (2603:10a6:102:81::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Mon, 27 Jul
 2026 07:43:10 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0245.012; Mon, 27 Jul 2026
 07:43:10 +0000
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
Subject: [PATCH v7 14/34] pinctrl: airoha: fix potential kenel panic in IRQ handling code
Date: Mon, 27 Jul 2026 10:42:14 +0300
Message-ID: <20260727074234.3761170-15-mikhail.kshevetskiy@iopsys.eu>
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
X-MS-TrafficTypeDiagnostic: DU2PR08MB10037:EE_|PR3PR08MB5868:EE_
X-MS-Office365-Filtering-Correlation-Id: 9574ca76-b0e6-408f-7831-08deebb2b4f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|7416014|52116014|11063799006|56012099006|10067099003|6133799003|18002099003|22082099003|3023799007|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	vDCcuQlbdb3CYaxzEj8JuFLK8CiaOCRZPKBgXuK6Kef4FmKX2opP1D+lWfViQWdVoltrGY57GdvV0SbOraknwXaJFVxV9DKhaRNDxDFPwy4Ygwf5F4Xa16GlI/dzFc/7wvsmrgOOuuLFELikx+MrLURt2WGb0vZ4tsQ7bIJXMXuECg9A66W0Sac8XJjancLac+ie4hZbbEHqTo1Z7Ec2Cc5N/5HWDaLeV9ISK1jldgSsjR8XUJbF91G6vs6FL5nzfLuyWy9gsgjuekorqQzuvYT8Rv7h8CMYgOnjkZ3FFGCWndpHEZ0eAwqL51tuBZ4DeZ4FsFD41D2couSJaaC7Te8CrjFrB84HW8/mNZpLBB60sdZPchUtbZFUCi/211vYFhdjpsDR3jidpuX8Ek9ijh3JNabs+iSpP89/1PtUAvfcwNBIq8dyQ7maYd39CiPSafbEoGCjTXhpQAm9Mcp5CWYq0Uyk7qnovrNk3Iao4D9Ik4y8aKg5uLC8py9tm9m49edzYXd9nCHi/yk3FTfaM6DePZfZZdGBwLgBar7rmki+Q5/2QUrZ3Qf3xG9A7v1t5HeKeHsqZ2eY84vOXd5beCGsToEmImLhQKFmp+cUIlzzBUjWCxHhWGsgSO/uSmeQ7WodA8TG5P7MT2ZidF8qx92Q0cdEooX57ylrfUJXCtdOCqQ8+Z4J4J5cd8TQrnoDzHIgPN0aoQJpnaRvpFjD6Prv7KNfEfjoK3a788jnybY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(7416014)(52116014)(11063799006)(56012099006)(10067099003)(6133799003)(18002099003)(22082099003)(3023799007)(38350700014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?J68QyJhvJenOaEfQmLNtebk6n5Onfi4fZjGpVLll1952ZBqN1UfqX8IWLH2O?=
 =?us-ascii?Q?KZTFlO+Cn6qYhm2S+JZVtxNCHu5JrEeW5cSSDpGijN8OrTD5Xu57YdBFhUwA?=
 =?us-ascii?Q?PxP/9w+kY2UIDmxNSGShWihdjGBaHaYvvW7GLw7SzXJkzZRfPePNTUBq2T8j?=
 =?us-ascii?Q?yt874DBPu6NhAmhlO0VUwXSKyDC2lpZJxU6P7qZP0IDYBzzP9LhAcXPp0GDJ?=
 =?us-ascii?Q?WsujsIbSE9LnCpM3kLvbsFSs7x8R7TxqU1RMs6h6Ht6xyLR9hQHlQbgrKjzg?=
 =?us-ascii?Q?70zfjgO6DOhqZNABoMtIuELOckZA0ownrNm+pLKZnlvIfsf75GMI5dwsehYH?=
 =?us-ascii?Q?LIbLzY6N5zWr96bIcth3bhlYr8cbjs+LGyEtDwJJCs0zBOfj0oUALDBziqtX?=
 =?us-ascii?Q?PaxEiWTJa/nEXqylK2cf4/KC2ZoarRbClYYdVdqSg5zjbBl7r2j8+xmHaEE3?=
 =?us-ascii?Q?cMauh8axdsbLkosuWWT/bn5gL5pH0ytO7E1GBBsOvStVrWsk0bG5lP6Yihd1?=
 =?us-ascii?Q?uYmXhMFnwNspuXj/egWB81pd+6obDeW8WbTxUoLzIiSqnkWPFsG+UHIfqqwG?=
 =?us-ascii?Q?5H3OWfZoMarAEedJnUatTP7Jc/DaDGpZnSyydDcKnVtJGuPXLSEIYGlWo9rJ?=
 =?us-ascii?Q?oON1YgYv4E/CiYjjbNUN+O43XhKCXeNYMYVgBmtq2V/E9TgcmayroL1sHH73?=
 =?us-ascii?Q?R36ZfHRhgxvxE68U8FpmOnqwxDHASfJpOVsMN5ieV2DPzr444jErkLOX61bB?=
 =?us-ascii?Q?RTaTB4OgP8FQF2uGT3C+Q/crSMIxwAspmopXO1FTAL2ze491+7s1NTmfOSCw?=
 =?us-ascii?Q?h5Cr7s+ZOUX1Lqtvffb3/nIlRGxR4Un1zFR8J1UHct5EgWB+C40qFzJUBnsL?=
 =?us-ascii?Q?uaElt1Rmn9t13fGCH2ARy4yLhFT3QCQZLSFC6tWTyRMHH8+LFzaJ9uMO9+8K?=
 =?us-ascii?Q?4HTk14+9Fga0P+epOmaZT0yQR0Y+yOf2LmyV2OsULSfq05XN2kyr7FkzdKkW?=
 =?us-ascii?Q?3Cv3FoB6dd0r+/TcCCdq9iinP+1iUgLCdTQyyI0lhbnExX3AylziH5irSDGY?=
 =?us-ascii?Q?mZXSezw01ZTcK02omDP+/r2snLg5RdGCqHIAjvaQGdVF3fxyKtcXb8bpk2cq?=
 =?us-ascii?Q?ZwwSu+SBf8AuEqLJpQOIhwZ5X5Of1TvWWa6Z6dBEP98y2oQM/FhoGUyzG6cC?=
 =?us-ascii?Q?zFILUmjXTY7WJV/4JWeppzZbmi8H1tCeAjy4maBeg5OoM7qSA0FlzyQAo59q?=
 =?us-ascii?Q?51PLUMK1nC5NI3/klOqOdEJ24mRuhsvci4kg2ZiN6NV00YmHzyHyqY/V1FWX?=
 =?us-ascii?Q?ROCG4/I8WXenuNSRmK151c0j7YJaxyAujlYazLUFSUYK+DzxmNtV96iQYeG8?=
 =?us-ascii?Q?4N37YcOmrDo6PinbHFLUGYwIUIe4OOa0DpbYyeaatbUDGVyRnAgD9ZGgGshG?=
 =?us-ascii?Q?nc0oGWvF44nGlnz6lmS4XzutS2ApmB2janjwIv9TbdIR2XDGIgxkexhh/R8B?=
 =?us-ascii?Q?T2V3A2aZ88OXtI0G7Js7AnIVShIFCkMYcuqVOoNHlmUP4RCK9fabpkR/L9RJ?=
 =?us-ascii?Q?Nq5+uQ3rJHX1dHFY9mqADeidedfg2HQdWt5GFc+Wu7A5/kmR51Hrk4AFlCSK?=
 =?us-ascii?Q?O4IzsTMeUF7RkA4+zsQaECi8X/lMOqLXAS5i+NmY6ROphOOMtq2x25JEPcxM?=
 =?us-ascii?Q?94s2uuoOC32EBeb/GJmfAI6uf2A85ygJdMzKDNpuur8GdAgswZBF2VX+dg/+?=
 =?us-ascii?Q?xOa1rKf6xrEYZ2vNFyGsVuBJ66zIc6Y=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 9574ca76-b0e6-408f-7831-08deebb2b4f9
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 07:43:10.8018
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XedsDfx6Nm1K+XPI0yslmSC90ijegmdbKs46eyb84fZjQYeCOAgBFTNIfE9VwuZdXTwQn3zmnnubllf3+9JFehfLRMgW7JKty/ti8N7YfIk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5868

airoha_irq_unmask(), airoha_irq_mask(), airoha_irq_type() functions
gets invalid pointers when initialize gpiochip and pinctrl variables.
Generally this should lead to kernel panic.

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
initialized with a pointer to unrelated variable of 'struct gpio_chip'
type.

pinctrl pointer derived from the gpiochip variable

    pinctrl = container_of(gpiochip, struct airoha_pinctrl, gpiochip);

thus it will get wrong value as well.

So any access to the data pointed by gpiochip and pinctrl variables is
extremelly dangerous.

This patch implements correct logic of getting gpiochip and pinctrl
pointers.

Fixes: 1c8ace2d0725 ("pinctrl: airoha: Add support for EN7581 SoC")
Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
---
 drivers/pinctrl/airoha/pinctrl-airoha.c | 20 +++++++++-----------
 1 file changed, 9 insertions(+), 11 deletions(-)

diff --git a/drivers/pinctrl/airoha/pinctrl-airoha.c b/drivers/pinctrl/airoha/pinctrl-airoha.c
index faad5d3ada31c..6cf4ed5976fb0 100644
--- a/drivers/pinctrl/airoha/pinctrl-airoha.c
+++ b/drivers/pinctrl/airoha/pinctrl-airoha.c
@@ -2569,18 +2569,17 @@ static int airoha_gpio_direction_output(struct gpio_chip *chip,
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
@@ -2606,14 +2605,12 @@ static void airoha_irq_unmask(struct irq_data *data)
 
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
@@ -2621,9 +2618,10 @@ static void airoha_irq_mask(struct irq_data *data)
 
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

