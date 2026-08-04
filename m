Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11021084.outbound.protection.outlook.com [52.101.70.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECABE479868;
	Tue,  4 Aug 2026 16:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.84
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785859508; cv=fail; b=VE9YuLgwW/Zd/wSqlf2bImFBywLft34Zi7PPhcqENXfn8GCXdsWz/y28v/V11UB8rw6YbIw1ctcBf0dC+63rvvAYYoTwbzJH8rFesfKyo0RPbQe5JNpAqR2JqlfFtdYvhZvYT+Wcl0F16Kl4qnseKnYBYYpcOH2qE/l95seWff0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785859508; c=relaxed/simple;
	bh=SQP3nbXwCUVrsU47trCxNnRO9Pj05kgB2Dyn2Ps0M2s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=RuX7BZwwRlthTAdoHV7ou0Ktncchahw+PdjYZierTjKx+0l8hbG/OEY/b3r5+r83wdDW0iM3nMRo9WmHBMVaDrXg8CVOqq9JsnOqv0Cgbpblwm9AAsVmD6V7KPhlU6yGaiDIXuMnlCY8JPAGYymSoPMyFs5ydWo1uXBSsW8NmEg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b=NEPh0FK/; arc=fail smtp.client-ip=52.101.70.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=genexis.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b="NEPh0FK/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zMEpP+9ixYyZy+D3/jXa1e+aO3qkXKaV8rNHmXST9VjUfuvWwRvXUrrEbuvT5GT+VlGBPaUIDXSkGCdpDyP2mQpe/0HG6DvzejCM7mTNfbtzLyFVoXd540xKxHYYC6auWtoGNZFscRRpEJcCHSM5e4+gaOcs8Bhnx1Pv28tSTQ4mbpdWWYIALLytKWieRLHzlRWNbCknXvlAmTFocfqZ58+C1AFzEY+mPmmz57GTn+kMcpWitHqCAoCShUUwMxlwCGx33pbmJ0A3tTwpPVl5pQh7lhe1LPmwfsTShRKnpQESyWKKoGg3MXmFyqgBnDlFNAlUfx4YcjC7an+KitL11g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sfpKTeL8DRxC/R/oVOslvJEBuIt6oeD9PfbvNtmOuns=;
 b=DK//YO6cpUiOdEXZ77GLIzfvrxZ+mgbFJX6LNtKgvb/kaZWK1iKiMGTc7LXIgjud8nhcL5gD7fFZRT8evDS8CzhwbPuAVt1PYYHZOyS5/ASLn3P0J5LCBk6UKxQrGoZ4F/nu+fn2nHe56994CuSOZaY8YUpyAy0FuiAQF7TB8DcWqD52mV7ZCjrd3BP1X42PZE1ETeRqrM6Qy11jZ9HCvh8wK/0fC4RBLWKepUs1Y/a1fxKIJjGxLWfpQOq6oMzFwYUwecMP9mHzT3N+HTAQdpwb9Sn6gvJylE6JCQuSy1Sf+AX6Jmges93jmBIoQDEelCiRAxRwu0JHYv225aAQrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sfpKTeL8DRxC/R/oVOslvJEBuIt6oeD9PfbvNtmOuns=;
 b=NEPh0FK/oue7YO4gCo/k2AyhYyJHLVdN185/Ds/l1agsUJa6kZDsI9bxiuvPGe8zo3JxPOg9QCMGgphJrOxtInAB8RdmHR8nJjON0CUYjKBL2jPcdm+Y2O4GuROWJEb5BUZO6J2FoGd2tQav5i4ThW/9/hRtxrS/B8V3wlaP0AOAMk55iv58wRyjXQzQr5hUBcx7QczdBYPZP40QsGl+IXGWfWDexunjV+kETqa0df+3RuxRFPE7p1+CQ+sJSQsZw5P9kDQloGk9VCfCnhtBbZRYc+HvR35MHhv9Cof8IqTVOBaSXB+EX274veI97K97Xh9GXzsr2Vii1RlXO7M4oQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by AM8PR08MB5761.eurprd08.prod.outlook.com (2603:10a6:20b:1d0::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Tue, 4 Aug
 2026 16:05:00 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0292.013; Tue, 4 Aug 2026
 16:05:00 +0000
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
Subject: [PATCH v9 17/36] pinctrl: airoha: fix getting gpiochip/pinctrl pointers in the IRQ handling code
Date: Tue,  4 Aug 2026 19:04:00 +0300
Message-ID: <20260804160419.3592327-18-mikhail.kshevetskiy@iopsys.eu>
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
X-MS-TrafficTypeDiagnostic: DU2PR08MB10037:EE_|AM8PR08MB5761:EE_
X-MS-Office365-Filtering-Correlation-Id: 9512da52-a485-43cc-d648-08def24222f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|7416014|23010399003|921020|38350700014|6133799003|22082099003|18002099003|3023799007|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	vv/LgZrWJHrQF/sXMTrvzPRgbO4y1tlglewd6ip+dAIoh/DFHV2GMSAfURMECjPR86bwddoFyw8vXaQMPAMCE7RHFZnoiWxfOjiL8tKJt+wIrXjJk0DkfLEQTzxK5aUQItAnmhkY1xAxwWupBcEMKIBKIeP1qFVnENaFvdinsm7gffAF6O4G49xB9CLpuaIdAx5dWx6oFYjQPUZNps0GYcslyjbDBkEkWTfZZH7Dcd7kd5zQ2eQJLYWONrxX1fDYb+5H65m1AhHNyezTP/FvXmP2bWCh1CPSvBh4AOWRA3U1Hw/ZAtpGxdmdF8VnKpxVBQrjMiKsGbH+eoSNs2CYQj5lkXc9oLQ3cKusQMOi5pW4wb1T+L0nKHnWreAeCro19lUOG70bgqGtWjErDVZoknXuOC2lFin60EpHziXAOE9cJ6CRrw/jEB8WU0s9B2zS/r2XYZbwXbbUydA+VUkH9o01R4qmiIr12Hl+GbpFlXpmuKPsTS7qZXUXyTk92SZoAhWvlnr+hx+Qa+9Sr23dWG2B1l5myzkxiZbe1wk+ehh5AbM1RndLF+fkori8SaUqtlYyieLPTyL6ey8BZbN2NQZyN8LK0OiJDPx5M/njADOt0xfDcsF0wPGU3jMR9LrRM3VWn6/1zrgtiGH9cQd5VPFkSjDYMcn9jWpZBobtkse4VDvEacX4zcrcB9btIFsWmjLdnmLvFr6IgEkS/Bs4VU25Jzto8UOK6hds7jyrmKgO9VTGkTUSfLDSimj6TSo1
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(7416014)(23010399003)(921020)(38350700014)(6133799003)(22082099003)(18002099003)(3023799007)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?OL7oZdPyLIn229qIyoN5aXY/nP9uCILcLhz4ErVXnKWagPtjHuCOfw/95T6v?=
 =?us-ascii?Q?MdONp9QW6NmK+IvyloVcowOsb4x4T1fNg4F5m/zmfKycdvHR+Jb14NU62cJo?=
 =?us-ascii?Q?KQtsTSXn6GtEmPgzuE7hVtJzkcCCgv0NjuvNleKFAST29WsjfYUB7JAEmHd9?=
 =?us-ascii?Q?KpdsePr+cqkZpFFIutsq1qfE3SPUwjNMTEXSiAt8AuHREAVrjdcZxy5uPlwc?=
 =?us-ascii?Q?fDTV0/dhh5GCydDShxkcUGPNuIe9WgA/kzqUQZUvvud5Tqc88zXfQ7LEkt30?=
 =?us-ascii?Q?fy5AZZS7/XVQGf4ZNSTSM6c/gmLDUYeAQGIw9VhSvj7LukNXJuJP8l1WY6k9?=
 =?us-ascii?Q?0SicRZLzOEGNbc5Gr0hkFhlfo/GJVH0n8o+aaoETrmcXQ2bacmy8m3bcf4Sf?=
 =?us-ascii?Q?fvXPeK5O1qwa620VtTLxNpHAYNCMYKzzE5AsZg0TdMcT00G15sQCDYNUnwj9?=
 =?us-ascii?Q?wNJNHo0/1+p8eYQ5TQ2uQsDumijYs2qHk5BWiYYD27KJSbMvJx4lx2L07JNA?=
 =?us-ascii?Q?pJJVe3GmgbKnJtf9r/keVFqeZL+aVpn2eP72Frpe/guHdXonzep7QECfEa8q?=
 =?us-ascii?Q?9S/vFi3ZiQ6kdR1mobUMRZPZ1L0I/gj8jfOvWd2Rppa4VDRRCPrbofabVrVp?=
 =?us-ascii?Q?26G2LjonCs2QN45xjt/AJ77ViXITT36r1UHWMB0kZeA1YNDJbYnjLmLpDH5C?=
 =?us-ascii?Q?seIbf/RLJFg5pcADTKyQdUfXicEwYGBVNglSyJmGWytLcTuWUN5SYoKxFLfF?=
 =?us-ascii?Q?5H46NsRf2yorzazPALdwaYHwKTFIXSypf08ACsSFmdcWo0Gy95tNFToMF6Cu?=
 =?us-ascii?Q?mwqlBCRDvznkYPxmPrABUJAf9PqftZ2lO8mjl4EpVu/IOZL5wob7Xml9/4Yq?=
 =?us-ascii?Q?yleMGp8jG51SQLr7XyH3Yf+C36iZaCAyvKVq0Cgp6NfVgNsurPlkKSZrzPQJ?=
 =?us-ascii?Q?rZiPHeEZuYWf7QAFDkNCrHc1bj5FccP1Hbw5wH5FDZCHL/uA0Qlzr/wRtnCc?=
 =?us-ascii?Q?/gCANu6SjbHYZzalxhHBa3kDDk954O6168qdg+UuqxVJ8cvTTQB1Ibvd5+lX?=
 =?us-ascii?Q?SiPTRS8qYHluUjZNY4O76l7cPiewKt5JLlWda7r0UshBqozYv+aCOru77Eux?=
 =?us-ascii?Q?ChY+4myedfAEGhi+HG4BdXNS8rfa9z9Zx9u1fHwF6I0IaWp04KfgpoMtBsug?=
 =?us-ascii?Q?f3Gp5hfAdpGOCUl/tYjYS1OCNrHnFdpFpDJPrYTriKEL75Fhf4/0pa8TLxN9?=
 =?us-ascii?Q?stjkKZrFECpY4bk+q+NP8jctVwO81FqVjHGEgtc7+2U+4XmbXKu7TaEi7MB2?=
 =?us-ascii?Q?rmSGsk/ApRo4Lij20TEW0vunpMeOdqFdb0YDwpLtr4Y84CtqbcQyofqz06Rb?=
 =?us-ascii?Q?CVBEBBFRt0rhkytDd6IamZ7vswH9UnJRy6fMLPIv02tzQuLrXBjRyvSba6Sn?=
 =?us-ascii?Q?j2xgatgvG1CFvUZjFWnDPgyXCYZwj0wNr5FceGED7M8ZdegSfzUD/kQyDuTI?=
 =?us-ascii?Q?Y9YuVhmPxEMgJWHs6Z2DFIf7HfcZJjlJPtR9WnNncRZ4MsBieLwe83KT887w?=
 =?us-ascii?Q?l8eYzwJAxkhRphnjFI8UZOjRCDtfRNRm7QEqtDF/xSDx+Qe6uvt0P2xhSsXm?=
 =?us-ascii?Q?mVpHosN1ElIWl5xhrjCBPL31v4r4YXsUfCJUG9rjHyDPVdYxEOQ1cWSlm9tv?=
 =?us-ascii?Q?BDJNhP1WwAl1MK9sY4DBm6ikVR/OkR1h06Sd7UU9AwT8BIwNBu0PpuJx8Ieq?=
 =?us-ascii?Q?6DjTgRKVQO9kA7K6t/zcAemnDoNw6zQ=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 9512da52-a485-43cc-d648-08def24222f2
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 16:05:00.2902
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YjL67ilwWhzOEydSGOjRmrFt6VauSXZZTl1yVEH6ZOlxC44shA+2vCDcVB9EFzXeOtEFXnzsMfT5sQ43BPma4lqhOinFkpCk5cdNDS1ppAc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5761

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
index 9a575e22dd562..8895a8123c621 100644
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

