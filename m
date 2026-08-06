Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11020095.outbound.protection.outlook.com [52.101.84.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6716E42E8C1;
	Thu,  6 Aug 2026 22:07:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.95
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786054028; cv=fail; b=Sr6TadQTL+zK9Lnkmy1hSP+DB4vUxI+n9YNljTJACWKEwTFcZvEafKDVtirANcWDEjW/7MAaoJQDKW3LYj64uGvkJKfYx+hwkIRs38it8E3/j2IscSuzouZOx0LZdGHB+ZU03vTQI1zU6ZHJ2VydOgkyW/3OoVadYm1XG71aMB8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786054028; c=relaxed/simple;
	bh=cDZ9wzSKykiLB4ehvTeQvew4umiMY0xUpu9wtKvTxSo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=plSex9mcf6/LUXKXRVQyFGX72RCNA3uUwVxJzKYnbbDemT2e5D7J0qrw3EsjzuKWY0dYvCApFU3mYcGmVDje7Ob6kbdNMV7Qa2qlFwQk0jpEC+j4v/dnZ4kMu4Sjp4udACbAw8UvZAzFpxtiBKgNPTaDQYfuBZNlY1VrgoRNCl0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b=JFGxE9AT; arc=fail smtp.client-ip=52.101.84.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=genexis.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b="JFGxE9AT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QyemWhW2Wuo++MFQ0cQFjVEaRrQtwl6YKle1lsZLoJS3Vj0VnVOrwf7CF8JtQwICC+3lMjXELCocRcQsjbZp9Musxpbz7qs9cbKv812dBsWssRUoeh+gyF4wY1c+41HlZZdPF0dAHDoKznGk9Pc+d1xSNE4TNwpcY7LbT0CTehVM1zFdyAJVgLRUCLyn3Es18DPrn9Lf3bLaacLeFsxSprW5o/3j5vD5J09+8PY+75IN+XsEFuND8uEWorPzP2lJhqp34Mlhz9AZNVw5ymFjsyDiTD85rW+Ry7XaGQ80fScNZUXobqPYnQUtFeigsE3chFapl6CGSDqXZA7It52uwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SSMKXgi53rkYy+vsB+7Uk8nMjeQ2TMynDU88jmtLCfA=;
 b=SjMPhxXZoxZxMyLqtFZwO1wm44i5Wrph8CDJD6v3/jkdxyuYcUJ96RdNqiW5kwaRlqLmHkuCBbsn6fY44VRDzT0Y2dtmFOxmd19c9NJmMLdZoRzEn6MCROWcdgx1HTPfEj6cXyr8n7ZNYaocJ78jS3QO8iZBkkOjjikswGzQao4io7dPGvjLiwUrO3sPTl1l54vO4CKkrwP36GDBLd3X/qaMOCAxInrPdw3IzgrxHw6KGp9Vl/7cc67bWnRFfT+wCr1IrJe3a6oELzxd/MwvsOXDaVGUFFYwzFiAfYbtw4OuCbkD9Y4x+Q/rEkcJJw7QgyABCZi2TaaaZEtkTOLxFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SSMKXgi53rkYy+vsB+7Uk8nMjeQ2TMynDU88jmtLCfA=;
 b=JFGxE9ATeyGaW7CarhN47QpF5HEA87GUewrVB04UGTW1N2AIO3Hoy0oA3rLkGN3ZawTk2bol9d6Fu0CzElwq2R7bVI3+LX4IHSblmBJ1Z0yJCqAvlN9IRpsu/SROooKy0TAHsp2YcbbrjjkZ7sEtRtDdF58jWUQa7jOtGoQz08r6Gg31kvuVf/EZNVnKstI00NsEXOQVCBO2EFnQaaiqLrMSQ4MRv4X+9Yp9J3NXWggNN5kWpgPLob14jjbxUnEw5dLUjamJ4j+HMtYDk/6Jn+7P5TGO8q0EoV7+WJ5yxyiQXKvs1luR8e4LuXud1yigfwx+K6Ao00O6dTcosdzJXQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by VE1PR08MB5823.eurprd08.prod.outlook.com (2603:10a6:800:1a5::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.23; Thu, 6 Aug
 2026 22:06:57 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0292.013; Thu, 6 Aug 2026
 22:06:57 +0000
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
Subject: [PATCH v11 18/37] pinctrl: airoha: fix getting gpiochip/pinctrl pointers in the IRQ handling code
Date: Fri,  7 Aug 2026 01:05:56 +0300
Message-ID: <20260806220615.4078303-19-mikhail.kshevetskiy@iopsys.eu>
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
X-MS-Office365-Filtering-Correlation-Id: 3fe15836-7c83-4f4f-bdd1-08def407086e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|23010399003|366016|1800799024|921020|38350700014|6133799003|10067099003|56012099006|11063799006|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	OMzQ2oWL0EIrZSUMl0FeWhfdOnuHtOXlORGq8NhkZt5N4HhnTkBrFTwhxk8LgzAm0NyAh1aOFxbLkymhwqTKpC00nfnMDbh8dB6MNabZIQE2WguCck4jo10jnPnsZchxwA0KbUL0XupHICFRoIRsSXgkH5kURGYHQ4wlftPFhxCqKYs7TFIgwehX1cyw0CA3bPpfWPoqjmcocSANpMjqjh90fAnHSypDWl1xPGYAwHbZghLFxcNPOFh+ZSej9eF9q5CfzJClxGRrhijy3ReoSZ3HPmFmRU5y4m8hsfzTgFmJwUgdcJNz0lD+VG1e0aGl6TkT4up+DNY6KPSs6Su1W6pI8+F89IhERKirzm0y/q5dNpZ0D6HANepnkDDf6FNSO5NPhcJy5MNuNbejzu0QsclZQKBuR0UxMuTBTsnKhmwZPYt2nSX6n44q3OgrtMT6MZXKLw+N8KiLEsWjd6g8duNoQw73iMVA0yec4+9QDOMQFegHT5D4up/qTOBQUKrx0THDeE2eITghpCEZFFSoHBzYxGF3hZB6rrIWpf/8fa6kdicMLxjo9hyLhg8vjkmGp1cttVlha7Ko+OcCdrODVx5tPUkDe5Un9sDcqWzrsyi5ImPNrLDluAtccB0GqYJHshR792NOxsqHV34J1E8NmR406iO+J1RpYXYejX/cCAmcGeO8qe87VKWCxDAO72zTc8/KnTA++ljcEXZ/f3H+ZTzVyLels3Kn8mXCbOeyKnaf1DJOS40bCPfl2xl0Um9K
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(23010399003)(366016)(1800799024)(921020)(38350700014)(6133799003)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?mVElmGpmav+Mm2vuif4/Zsy2tKM6J/KfoG32x/v1nmR03A7OqFu5p2w9I9NB?=
 =?us-ascii?Q?YAwqsJBpPsWGRlEayOuUwrF35qC5B+9Sa+/NCISSxDZ5Qvsm0P3zgE0CjmwA?=
 =?us-ascii?Q?8OPPIFFVf56AIel2xz1S1XnHlHoF7u8qkz3vPX11bnjiBBgSZjgFAzgTZpu/?=
 =?us-ascii?Q?nZHr8ZKuMt+Xi6Fc+aMUy2+4aLUJYdab64Z5V5kvfEKNbvey7QK8Ceb4UbyJ?=
 =?us-ascii?Q?N29zTGX96TWkJN79SLSNxUuIjanQgmg9PKHw0X5Q7lnlY9pCOad8nZBj+VGI?=
 =?us-ascii?Q?biU4ctagvOoIqtEBL1ym3S8eRkQBRLDxERrW7vo2cHjxqvtPZloFeipt363p?=
 =?us-ascii?Q?j57U2fpcnfXmm4SajJMsXemZAkRvi6BEDvbiCWibFHKX922f+5s7aKXMOL2r?=
 =?us-ascii?Q?IHfbT3WmHqRDzwtekL4eC0pLThwWY2Vn9trAIxShlJ9zuZc02VBmRwBr50Oq?=
 =?us-ascii?Q?yJb9VeVp5KxoAYpyUIbUPhhfD6toGrWY7JPjl137Wpli735FPeFJZjfPQTEx?=
 =?us-ascii?Q?UOoVP9Kcop0hgPaDfLf5gN3WTt6aqoOMM+llkc/2A1aUSvRgYNyD+EDZA7+h?=
 =?us-ascii?Q?QmqhXJRzWtYPLfiYML4iY8qOazgd/u8gfBdIH/H+EDBsznTkk5yBW/mQaxdH?=
 =?us-ascii?Q?GeVEwschIdCgigmCP46BHL8mY1dEjFxZJiKw1Xs4yfvW1l/8CdWZFL4cVWuK?=
 =?us-ascii?Q?eGhpd/o18z4Ot7oX/kV0bRIKgto2TMqLvRM2ZbDEcc/7Uja6Kncz89j8dsBC?=
 =?us-ascii?Q?0GYOttWiNqeZ6RBRASE+u5bTKa10+jQ/IbM43PyGKiX9WAKTG7E7f/yWLQji?=
 =?us-ascii?Q?RtRk0gSH2zIFJMwbOOLApkm7kCvrCI+r+lchvCNmOn51aXqUgKV8P6muyQl1?=
 =?us-ascii?Q?O/5BqxGSOfqEmOwbTLa4lrB+T7vEeuW26MsgkEYlZgQTkrgjDpd0VNbo6WLa?=
 =?us-ascii?Q?48EJtmblfDujW+EYCe4e44lCnfsszYBAJri7p1XOIv/yz7WbyTBCq8tS5OHG?=
 =?us-ascii?Q?+VIDyJ+kuwk56+cjUEjBWIL8Hj4mJE5fYtEOXRUJfS58M0Uh0AoY/JXzY/8l?=
 =?us-ascii?Q?apyZuOt6cc1sh19+AaQ+8LAtnnQ7OkspP71pgAO/8OmtB3RnQzdBCWRlJcvW?=
 =?us-ascii?Q?h/jElyf/9kOwxatI+5pvYTUnVZyqspojfV00Nl0qTOMVSHGrYplmDidDFTyw?=
 =?us-ascii?Q?FUqJym6NQPPII6cDM8gXIftDXPgrHpTW5bvigqdkao5sbQMg7+V14exHp1mq?=
 =?us-ascii?Q?a+eVJsS8vcJEijYQG2hiujg6wCQeKDYzgqHQCWOvCYVfeLro7xFC/jg+suqZ?=
 =?us-ascii?Q?pe4KjeX3MfQ5GvhtpNvEcz/WyT2yK2CTUT+r4NC6Ty+sM0sqV6v5hBxTftr2?=
 =?us-ascii?Q?ztaX2+DrfK4jDXOma+BtklIIPa6SBg3TLHpGhf3nGFJhEtylHhU57aygjNB8?=
 =?us-ascii?Q?KfJFEnVDSTM9gap26O4m8NE4QGfvYYl/3XAwmSYgCP659Zowy3UJuboEO2Gl?=
 =?us-ascii?Q?CX7lCb+tWxHNvmJacqKNFpa8uqRFnfLKRWtFYv233ZoUlCZk2WW85/UcrIQr?=
 =?us-ascii?Q?V4PVA4KbNCdURa/94qMtzhAaxCMCXigi6FuXTKu7g+g9ONlX+RnnC8dBfQew?=
 =?us-ascii?Q?j89Ha9huICP1PYwcgAcn1Au0JFhltAfoLaLMJStpwIyzX9lbyfjmSWAuhZOJ?=
 =?us-ascii?Q?hNodgzv1GjaOjeRspE/4MFjwWPQsSFAIf4AQLrqR+SZ2vfMEGJ+7c65v0TFE?=
 =?us-ascii?Q?A7iSI2eVZD87WLz0icc63/++kyXdQYg=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fe15836-7c83-4f4f-bdd1-08def407086e
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2026 22:06:57.7862
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Uz1j5wzBMuAqlk0u7WuU2+DiE2QE+a3n0/i7OSSF+dLTBfJmjcByMWIc0nS3d+bmdlpkJZbhWxShMz25e1a5O7D8egAd021h2MinEnXqw3s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5823

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

