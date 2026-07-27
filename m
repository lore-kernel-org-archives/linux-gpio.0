Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11022110.outbound.protection.outlook.com [52.101.66.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E29243B3C5;
	Mon, 27 Jul 2026 17:42:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.110
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785174150; cv=fail; b=UvjNRzO23tAXPgz5MDGTuFES/Fz7gMFoAWNIF3EHCz/D452jZWZMbesHODSaSE3hp1vDd9b0Vsbb2Divbl5efG3oAnHeWdCbGv0l6ZQKScmRKCOtj/n1HlE99CIeIW9ySKzrI1svOOIia2hkTWonqr573spc5NDGA7fJ2ixFvUc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785174150; c=relaxed/simple;
	bh=hdc95fIa+LX5sZjOsisbEVnRd5yOKeBenKU7+tYQv30=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=NzcA8TOpMsxxjIqKo2ywusONTeEgNkrHvhCne6ynvfTm+5ge/ecgPjEAzCoBuyR02CyZyWzIh9CTKdwNhE/dOwAIzNmgtwaFWxfa0BvumXJSbXuNYH9PYIvIHmbGGCWC6W9xyXCbGdROQJwYowck2dNnRWg2GCgIuJ87w1aJVbY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b=IbTe3+hX; arc=fail smtp.client-ip=52.101.66.110
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=genexis.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b="IbTe3+hX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sITIVAk1VHT6UDYz+oSZD1q1+w0baSormYVZFQxDLhZc/ay2gnfdGxgNTTdM4f0KjJ2BDAvITKsaa4/DiLfnclmIeofFKBLU0PsW27lnSivXC1y37wPgZv9WxYTexGRzErLQTN9PXOnLR8kYZQ4jM7LlVbGHih/ftkYWoooaB+eufh88Twe28ekGcSlvANka2ddwNJ4vKH9O3r4EfPZbD1INiZG7Ggjq8pVNjkVHD2kOQT35zeoZ4HWQpwydFnwttcHcGt7vXiG1NW/O9SYxeHGkNVkOnn/Gr3MlvbQBgjxlJm/NtaT54Il5m8pcMaaOvfUHoJ5/a/XvUALJ7RjivQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7z/sKK8OBJpKiPbJasGwFBjOcUndOFnOOFn48Rv4NpM=;
 b=MG/HNry8wuouALN4mQAKrr5luLL9nMp2FGWEa+dNJrc69tvstIOfYsLq2v3/ctagmhvuiPzfENc3kVEnumukKNAY/lYeRGUssGIiCinG+AxLVplMtxcKQx8dp0+0EBWOta97md6h46oTpYZxglOzuTUAaSKBuAQGLo81GR2PaXWgCnX39p13nuZMa5wB1KcqUQ0RzUOzDGQKwKJ4YeD7Q8YiPHorqJ0g8uWKqFjeccIn8TK36fUTc7/yuQYCkpWwvQ1TRsEKfxT9Vkf/3SDANXWmWcmB2AwjgLl4n4NFsk+e38rgnkp/b43BkpPR7h2BqMrQuI/bqEKpmGEabzTygw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7z/sKK8OBJpKiPbJasGwFBjOcUndOFnOOFn48Rv4NpM=;
 b=IbTe3+hXGMp9qz9BcKKXgxV1iM4+j6WJgL4C6uglKvSSGFP6qXGQ5LCpbYGhNEx8XD+55NNbxk1D3HfrAEVtR8Ri/k+sAyMpU+nYi2/IyNqTRt3usAkeh3LqfOuP2zFjScXZFQUd4m8Y0U/CzY42kUVawycPSc/6p0k8AT7DhjjLmdJy7ml27Urd9tk/9cA51kpxXGN8G/3VUHfjjY5ejRvlB/80SWZYg/L5jESfQQAE1icinOGgmg0vZFz7Di0tgSSKHz59axusiUf88larTda0FXVUc6+lgXN5CHuzBO5XcMY1EoGgAbVpXj9mQUzNjK2JgqgMl1+mEgTfNYUmPQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by PA4PR08MB5888.eurprd08.prod.outlook.com (2603:10a6:102:e8::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Mon, 27 Jul
 2026 17:42:18 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0245.012; Mon, 27 Jul 2026
 17:42:18 +0000
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
Subject: [PATCH v8 15/35] pinctrl: airoha: fix getting gpiochip/pinctrl pointers in the IRQ handling code
Date: Mon, 27 Jul 2026 20:41:21 +0300
Message-ID: <20260727174141.664933-16-mikhail.kshevetskiy@iopsys.eu>
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
X-MS-Office365-Filtering-Correlation-Id: 331930db-6b35-4089-cff5-08deec06676c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|7416014|366016|23010399003|1800799024|921020|6133799003|38350700014|18002099003|22082099003|3023799007|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	pmMXJikl8c4I2VlM/J/YnW08VBRmFZWacunTvtY1Ji8igDXP0mO+0p+AfmBl3g8JpcaO+zi6GUuXeWREv9C9djr6u0otXh+wUt5fne0lZI4WqqWti8vYwuBWR3nZ9Ztvj0Kl+Sjb/+7uTzFEK50flOZUU0Vst6Pk/RL74p+h4nDHd0h3YjBKcvFwBCGybbesSGsF2a27JErRgwQ4WYQkLZTF8T2lbPuesHIyQyeHRTrkcN8LZ6MZ772gTXeAOu2xD3NleRXWEMy5GQ6xQmCfZfi1GLDdN5LEMLV0PDczkrvmTJ6eRvJQRzM13u+b/Ud4wK7pxvivoWicunmbu5DmY11bB5IaOSC5z8oQGAbkM9VsyUPmfxPDcAJ47iGGkPKgyfgQmpsSDb801ETTVAF6Uvx4WItcWpqhyf+C7fAb8IlTf5VUtGnqrdIQox8zbGbUypa9VtXq6/aEnC47FYs8WChlk/Pa6WF7+zVEkq7nzsQsCgSsI/Y4Q/9pZJf1yC0ajU5NBo1SR0CIEQQVRzmyyeQEOfxeXRD6IHkLzxHVDy/nKtPQUggiNtTdjCVdlCSHwIkb1rJWlOuHE6/Z5HqnpzSQOsaNyrGxgXTJq2cqIj+cgqZvyjxbCWSYAroVkFNapHvJZPybTdSfRUGhVlVnREDpDEcETUD71kVwu3BenEi/PeLa29L+ep+8nZSFXb/1CO4EEwbQLd7fLDYioqdxXFAn6qcr+OCzeKdkt1A9DSeslZwz7pY3LQers7EsqCtl
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(366016)(23010399003)(1800799024)(921020)(6133799003)(38350700014)(18002099003)(22082099003)(3023799007)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Rs3FttbvjMMy2DNq170daMFKpWuV5rpOUpB9DQP+OVWc8QKdowoku89v4LbD?=
 =?us-ascii?Q?NYrFhlkke9JBVCtMqCWeoACZgltV0JugLlFb9h4qe4TqC5ygxacv3haSB2Y6?=
 =?us-ascii?Q?HBKxVCJOQdroNNjIJLGHWEh+u1vmQPktgQbigu6j21NJtGQUcobsMWKKrV8M?=
 =?us-ascii?Q?F2+vKENuhKSp9wy87KyuEu9GXEOXLhn0PLuVGtwkyARvKGgeBgb4V/XUAGTN?=
 =?us-ascii?Q?KXw8X6TyOBjaju9AEgZ24165pToUgndRTy4qokmi14fiqRD9VAmZkLgf+Gdk?=
 =?us-ascii?Q?26wXsKCezAT6DN4aj3eiwCl3FX8sokeKReBNgTVxpbJKtHW5vi+skZ577aKO?=
 =?us-ascii?Q?qGX+ld7C03r2SAumki8FxFH7CDjLOJyVBi8lxZ5/gA1XwtJ7UdvSkvdff7sY?=
 =?us-ascii?Q?/juMNsHURr2SvVe3+uQbJJOM62aYXtcY8zIiSFn4Qb/5oJsfZWG3va0OqSZ9?=
 =?us-ascii?Q?ywfDP7FEuVPCTrGxBEUQ+oY0ME841Zc55A1kIKYPrkh+lqk2ZAul8TP6F3Ey?=
 =?us-ascii?Q?+aNrxUF3qOD8nRJ/81BpjS5ZGhdl9LN/4buMhbLph8Pvx0MOqI3vM7lmfe5R?=
 =?us-ascii?Q?t3zobKus1SMWrgqpSTrlJzeLNb1kktkQIzIm9CHQcIGyzWgxESlE/C+o7o1L?=
 =?us-ascii?Q?Afue7KvfGdzkpe63v89fPtNkl3Exq3OsoursZLJ+bOnoVJRwHU/BkuZT/P3Q?=
 =?us-ascii?Q?G+UBeymIujTuqNuBEWhzuEVBdkXoXc9MiHhwTvitni8URvFYjptZPcM1IjGL?=
 =?us-ascii?Q?5dnucCQ5a8Ydiv/TQ9UBsryi7kGgTO3QshHwuZ+Sc4sMuEXdWYlWRQiugroK?=
 =?us-ascii?Q?6FWcUcgaHScSeY+KFENcdNaGBkMmrNnZl2PhhNxVMhM+fBxqkr/wzsoQbuJl?=
 =?us-ascii?Q?Xh/Wc/OlUK8p4Qv6GAZlL2uV83VtMHgjz5Iu0WmGfBxoVORNbYkHVSJ5G2br?=
 =?us-ascii?Q?sPGnGCSf1j1s2Tyi9PtghGAfb+rnStXu95Ra/7TAOIW1/naqp3akdBRdzXTy?=
 =?us-ascii?Q?PcgiXdDcIxqDIfbLDAgcHm4Mydpm6YotC3sgGURADl5jl2nf8Q9QmltjyPbr?=
 =?us-ascii?Q?lFG8Pddyw0PF3dgK6w0nmcs2QTmg8BC2HT5coSQJonjM3fYG2F7LBdZcbVlA?=
 =?us-ascii?Q?5MPDqIN5WwPUazudlgxIcc1lRaLW+I9iCJ7K3zzteANtPqaF735T2BEbt4IP?=
 =?us-ascii?Q?UXfN4etihbsLDtFoOHFjyoGVALHlw8S2aCwa6MXSwSMETH+/dKnjvZfhhaEg?=
 =?us-ascii?Q?DBBLGlvylIvTn6Ls+XciXS7AnlTYKLZMio5hCUFUFRJNqE4x6wngjzxxXt8a?=
 =?us-ascii?Q?hhO/MTpHo48DISo4YBuNocw7BjK8Yc2rLjFJdomEe5t4CinEefvnxP4zTLIl?=
 =?us-ascii?Q?ca67aTaQq3N0mJCgS6+v2prhV8JjUUGXEBom67OKdoJRyx5VXHuPDD9fgO7/?=
 =?us-ascii?Q?JvUW6iKyUFpidjR0WBIDK1yHuEPJ6ghOh1WeZy+8MRt+1epy3cEueTRSkndp?=
 =?us-ascii?Q?E3F5cefBwMD8c8f8Uj82XY4IF1RctxE8bSnhEcrw0MI36+8QAjpxBGPWEOzO?=
 =?us-ascii?Q?G7p92V7Gxj2fCt8d7/IrsZpc972oaOB9qSLO5e8yvfec3uq+TMoXaEgEPaN7?=
 =?us-ascii?Q?/t7U9BW+5Z0tbXCwnR/VfrGwJ8ZCMTMG1dd9d6AN9ClvLPnnmhVvHX/5W6h3?=
 =?us-ascii?Q?t6eBsjdrxznitlg3y3p5PhOX/Hm4dlk4AfwaD8/6Bi+pwTsVQertJ9Lklshd?=
 =?us-ascii?Q?+qGZtnqj0bp3Q7IMWk4O2wl7BP8rA1M=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 331930db-6b35-4089-cff5-08deec06676c
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 17:42:18.4049
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J4MGPpBu0GvNLidD3XP/iXl0ea4s8I9NTJ7GhJ1q7itqvQQLCH77sOO2sIc3SAyXivUBjwN5mXBoE5IgX2dCcT3yD5/BLqeYofZm6AZQ7XY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB5888

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
index c432e9c13c207..a27a3188ca006 100644
--- a/drivers/pinctrl/airoha/pinctrl-airoha.c
+++ b/drivers/pinctrl/airoha/pinctrl-airoha.c
@@ -2564,18 +2564,17 @@ static int airoha_gpio_direction_output(struct gpio_chip *chip,
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
@@ -2601,14 +2600,12 @@ static void airoha_irq_unmask(struct irq_data *data)
 
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
@@ -2616,9 +2613,10 @@ static void airoha_irq_mask(struct irq_data *data)
 
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

