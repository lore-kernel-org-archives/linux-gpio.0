Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11023130.outbound.protection.outlook.com [52.101.83.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8552B3E316C;
	Mon, 27 Jul 2026 07:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.130
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785138199; cv=fail; b=tnf4y8m0EUjzTtOfPD18cQGkg/B+ebf3TBTlFxM8J616qiC0jTyOmJmjQPHOHEB0DuYiza/mliyE4GRKR23mBbnXHHh5K/gEgJ5PGHciRjos+JUFCFLcE+yWQksCrJxAV3g0r+ZNfHbGK3hLFo+vYXsbaLTlDalPN5vkHpxJDIk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785138199; c=relaxed/simple;
	bh=NTeuCDLRa3I9308PQiWdFQ6Up+j7A6HMMcWn9DXBEHs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jClpCIA0lAhReUopTYhIZh3od0U72pXDAyAMB/UVBvWE5FP8kRg0kWWL7Ro/LSdjn9/IyjiZtaQYZ0cw3csiskC2cr8jMh8hrDyV2Wlkw8N2tJdkjOQFn+eLcHboXG412iMDTrAAx0vMYD1vJOm2ksy52IK7Ym0D+Ewyup2fK9w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b=yOQ48/um; arc=fail smtp.client-ip=52.101.83.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=genexis.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b="yOQ48/um"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EYFbDXAzDZcejb6YGK8cdzicgUQBJBRXlnxIAajHY56uo6tUFg+NYTFw7Ak6m1ZHd1/8IkuGW2in95exqPXYn8aOp8rxUSOke0MLuQ4pkl8gw78lOGmpiOhR1AbL0bNHZoyEs7DAJJPMO8dQYwqMUJDC8679E4Ej8Yy695L7wiNJnaaSz/zalL7/+JQNmxmfN9CHjubZWgcKhwwUtOxB/J9lI9C6zuFL2Do4HGuCk/urKT6lyh2A/CYkESA3Z1fhHWduea7dj0vakCiFmS8mOHCXSVfTSzZAt4t826a/CVKg3GOD4WN7bInk7lzUu9HLVzRoXEl5trt76XzM4Dfy0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lzT7y0urnKtTvO7CKnAlKHVlomi4YgmctQvTS6EOr6M=;
 b=b6DdX8RA8O5yWAD/FxLKbA3OXSPfcao+/G35gYl0jmBsPJZH3uv4ZSA9PsXm0ef2IyukB97ZZZQ2wadimPelBWqiRdsR2qYXeI878QtbyyP4Y+cH28cfI15PBcMtfxmt+sP60nwGK8ytlcVe8x/Q9wvWaDKGURgdQ9lPDJ0oLQuYmUKOrW5um9bUbgZ11F8aHntpJTtiUuPDmL8gh4c4StDKzjxBYOXDTvwm4apKA+4dzzwnJwZWUvc5sVKjz048rNGuCpPSQ7bjgu16ZEHPJz8c0izGEzx2rbbPthPhg5QEqQmnMVq/Io7vt0YEu585S1r4ZI1kxApuZip/0Q6lKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lzT7y0urnKtTvO7CKnAlKHVlomi4YgmctQvTS6EOr6M=;
 b=yOQ48/umF/SERptaTuXYQZ8LoCCWlTkW0AMpXnp/UM2vmSjn0Hywh5E6CsRHzjhiNeuPok0lk4PRZFk/AwHEuUY077r0jhGxCtrXbnskF499s2tmN6TaJUSwUa3JrQ/cct1eMNRVhvVbDeoPx35dZsVTLe3vzIJliiOkX9yf1p70whevFv+m8AIwSXYYuKCeI80s3P77bSa68cYwiaPeP4aH7NkNHjXQKRih8rVjLqcg2Sh2WOVQ7wGFOPH5lMAF6kfDdYQ1j0vcDwcUO32i772IBEu0PVTPoYrulVTZ6LhfnAbAWgZ4hAMiGo+rRcfIFmBJJ3tEaPJGnSMiBarCkw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by VI1PR08MB5501.eurprd08.prod.outlook.com (2603:10a6:803:138::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Mon, 27 Jul
 2026 07:43:13 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0245.012; Mon, 27 Jul 2026
 07:43:13 +0000
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
Subject: [PATCH v7 15/34] pinctrl: airoha: fix IRQ mask/unmask code
Date: Mon, 27 Jul 2026 10:42:15 +0300
Message-ID: <20260727074234.3761170-16-mikhail.kshevetskiy@iopsys.eu>
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
X-MS-Office365-Filtering-Correlation-Id: 3cb66954-81ff-4da6-2d21-08deebb2b621
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|7416014|366016|52116014|376014|18002099003|56012099006|10067099003|22082099003|11063799006|3023799007|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	euGdvTm6OlQdpTO1CLV1w6fW6HmzYN7PUU6m0kRb5+QirWCa9F2wcLTvPi99FtZ/ntEC4NRzWoQl5PNwSwx/iCZSZaFHFbxsu0O7NfvsFyJSiywIwXq4H7drNaiYY0AQqXyTYmvaRQEO1ekfZm5nbMWa/WRePH+he8HRpCZlVXF0Rhci/iw22HxNS4oNQgs9EPGwQ50oJJIBwd4lvOX5TT1HbZfM5YoUrMLQAhHqXHE62UihWuQs0PTgwqArW0USw+dp7PmSM9GRar6XXtvqNkZRpp45lkxoE5mWgwZclVZ8J2EmpffWNsdUet8ufYq7dpPRSlhYXID2VRIi6HJ2w3IeQUZUst0rjHUgTlkKYlKI2PsrPPPD51LyrrQhlNx+klKmUjtW9MBvfPtN8m7yqMJ9Bqfng8DjnKw1LVFfOxAfXbItiPlqfUVl6rlyI/8oxWfya+Aj+3LRL8n6QpIIaAmYpQWQc9w1zuqA5ti8TLcSo3KgisO/5+eor3qjdYdb0sfRXMhJWQjdr2uOdEI23e9DT22b9ctkp7czkD9y1rueoHnSYYXevIG4X8tR5b42XE9Cx4Dn0bIk/Sedtzb1nvOUK/10oY5qKgY7bsnBCMoyjqOkY3u+C+IP+vtE2lsPDqyQQ0m0SBIPphEkKhQRYMeDJ5K573OWmEpvWrvAAOQoMplZ/viegndpgc3Oo5IioxXhgLB/6WkOB2Y1wDhSpfFzvFN61klXBvpN9GsK23c=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(7416014)(366016)(52116014)(376014)(18002099003)(56012099006)(10067099003)(22082099003)(11063799006)(3023799007)(921020)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?IhoGVxq177g5pg+DeH0sDTIM3mrQesIwtiig91KXQ6LkcLEFHRKK0Ei0vTpi?=
 =?us-ascii?Q?5Mkd8TBM95HaBsuwsRG7BwlGh/7abKRiNPoeu3UOUXe9946be7yUfs2XSF0v?=
 =?us-ascii?Q?LMP7H34m7zz78XST6WcDzvV+Ggr3H3S/PHhhOyNI9wnv3uGXVlBaVYYSisaM?=
 =?us-ascii?Q?liy5eOF1PPC74iEAP7kAwic5jK2CgnxmkyD6NuI5cOkmJB+mFLtlaEBnGoCI?=
 =?us-ascii?Q?SdTlM1AexUEmF4lWPy6ZaVe+AvSJYkS/Niv+D3t55dUIHo36obBq/ApyXaSE?=
 =?us-ascii?Q?ZWkFMm/DwVT3/8tTjTUo+T1Jdihj7TEK6VsTUhgMkxjQCFNHVMvXcLwU7nPN?=
 =?us-ascii?Q?LkJC6Djg++vIF4GwuSs69QoqeXtHDLTXiI6P86cCQ4o0V9rvdxBpTp0EgsKa?=
 =?us-ascii?Q?qnSPw8YQgiK3NTAW9H8DoOYFrfMzhrKC9RPXSz72mn6PmBPeRO0EyE/gnpVg?=
 =?us-ascii?Q?IyWZ9rN/t92DTo5Zz0KrbBvLmIjb3YoRo5jakvZYWxgEQcDexFT87URz4z9P?=
 =?us-ascii?Q?x8IPzoEMhwqtLcTdWEOmtCK2XeIoGZquCRsgdcTE0OekzCNv0z57wz0R6jvD?=
 =?us-ascii?Q?/B3SA4NBykG0Z7h+EUtZWoCsV4+RXyanm7gXNYCHUsgPPM+GjDBopk8gdHsn?=
 =?us-ascii?Q?UuWNWdJeaS2BR7CsBKmzXSDAXCYzfFwh5XxB3tg5T0KP6EgcQossAcRk8Cua?=
 =?us-ascii?Q?Pen9Nll0RYznso7LlF3aDlABQmizAVTRnmCwKRgqOd253y3jXAdgDDoRHr34?=
 =?us-ascii?Q?kuOpJW+fkr5hf8/7vx/0wAM2wj3fYtdiPrs2WPmSVUNbM9b9t613Ns0EKcW0?=
 =?us-ascii?Q?mtEDXpqrc7Itss4SY1+Kiwf03ujU+J9KhgVOgKpEbuEMsDdIucy3jeQ4V3BU?=
 =?us-ascii?Q?V5UmkKBiCaIM1Ad1xlkvMYnqGiMnw0DE2eg04jgETtU1PV8vwMskTb5OfvQk?=
 =?us-ascii?Q?Exrn8imp5OZoAo+0R2Z2/DWok00iv8L587XYi59Wefqc33pHlQiLrScVpxPT?=
 =?us-ascii?Q?pb+DOXOJc0UFxANWPnghPe3k5E8WrbnsxDwK/Q1ERbAnoHMKo0WiqAlkVLFb?=
 =?us-ascii?Q?oGV2I2bAoWfvf8Szz5rlkqUVAHpcps6Z+Jfc+d4Ev/6knxlh4IEwAvjlxTrl?=
 =?us-ascii?Q?3e0DGi3zdFCX6p0ZJRICd3cV7n0ikTuKGC0gi6bN0GDop6FL28Bdpt5Stzi1?=
 =?us-ascii?Q?sQPFIYVu5DUhdJfSxlMPN/olV8uQjLxcLi2+Ses5Ie9oJ0Zh48+88ocy6PAS?=
 =?us-ascii?Q?NxukQIV1btdvjb54GuJotiTa50AzK2lOFnOvahTApJQktEPjWBMI9WJVoL3U?=
 =?us-ascii?Q?TFPAcHXNUk8cjXowa3RqAwgcsvmj6LEQWPKaLvyjCrI+f/a1SyxSXndwzwln?=
 =?us-ascii?Q?+ALE4gTG1SMW7zbZLqHHJ4RfoUpbMONo0ASTzHtNxU8LZjCQid5ggEX5lpNS?=
 =?us-ascii?Q?HKPiIxjJldT+inAbkpixrxX8ADhOrFw95tQ5gbKFqk0jHt1Og5hqz6dIm71b?=
 =?us-ascii?Q?/HUgRvI+3v3xLx1PnKy81o0zkgswvjDStmCQodsocRQkYLPMhlATbyn91710?=
 =?us-ascii?Q?L//Q9OSMSVpTM3nxF2Nctj5yMzg7t3wZdz4wCVT+kcgUuO9cIm9oyF4t0HV9?=
 =?us-ascii?Q?k1k+i2c7fiqKQhNNKABxUDSrB1tcz/MuMNx03FOQ9GGbaIEDMAs40GNOQXCA?=
 =?us-ascii?Q?Sn4CcvikI3CG4HQQizsvf9PCK/HltSpTjlNmp3VagOMg0WxlO0FDvunarm0V?=
 =?us-ascii?Q?OjoI6ktinf4sBvwrdNG8u32VXEVfK8A=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 3cb66954-81ff-4da6-2d21-08deebb2b621
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 07:43:13.5208
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ayB7lQpIChcybUG3C4XQk7hxGCJBxzd3nh7PS6ssz+aYguAFKR0/AM0+tw07LoyCzk/54I46GzOVnGgRD3rFWigj9cR7M/5ky4gXdcS6N/w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5501

When using IRQCHIP_IMMUTABLE, airoha_irq_unmask() must manually call
gpiochip_enable_irq() and airoha_irq_mask() must call
gpiochip_disable_irq(). Without these calls, gpiolib never sets the
GPIOD_FLAG_IRQ_IS_ENABLED bit. Because this bit is missing,
gpiod_direction_output() will not realize the pin is actively used
as an interrupt.

Fixes: 1c8ace2d0725 ("pinctrl: airoha: Add support for EN7581 SoC")
Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
---
 drivers/pinctrl/airoha/pinctrl-airoha.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/pinctrl/airoha/pinctrl-airoha.c b/drivers/pinctrl/airoha/pinctrl-airoha.c
index 6cf4ed5976fb0..f85941ccea560 100644
--- a/drivers/pinctrl/airoha/pinctrl-airoha.c
+++ b/drivers/pinctrl/airoha/pinctrl-airoha.c
@@ -2580,6 +2580,7 @@ static void airoha_irq_unmask(struct irq_data *data)
 	if (WARN_ON_ONCE(data->hwirq >= ARRAY_SIZE(gpiochip->irq_type)))
 		return;
 
+	gpiochip_enable_irq(gc, irqd_to_hwirq(data));
 	switch (gpiochip->irq_type[data->hwirq]) {
 	case IRQ_TYPE_LEVEL_LOW:
 		val = val << 1;
@@ -2614,6 +2615,7 @@ static void airoha_irq_mask(struct irq_data *data)
 
 	regmap_clear_bits(pinctrl->regmap, gpiochip->level[index], mask);
 	regmap_clear_bits(pinctrl->regmap, gpiochip->edge[index], mask);
+	gpiochip_disable_irq(gc, irqd_to_hwirq(data));
 }
 
 static int airoha_irq_type(struct irq_data *data, unsigned int type)
-- 
2.53.0

