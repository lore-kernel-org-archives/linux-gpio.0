Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11023138.outbound.protection.outlook.com [52.101.72.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 706B3470451;
	Wed,  5 Aug 2026 12:35:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785933308; cv=fail; b=gTmeHx8J7VprzIHLRMP5IvEtdQAK9uXOvFJ0VOkp6/BqGczCMbAtA0I+fksFVJ/aaij1hkv5vL9nVyajhD+VH7MxGpsnyf6aWJVIxxgYhBQY91XTCqP9QL7pY7KvI8nUcHpdfv8B0Ot9x4XZgvJ/tqZgxF6tcwRELnT7dfbHvXc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785933308; c=relaxed/simple;
	bh=fiBYXV5/r+Z2kcvdJuC2fn0AG6ELOks6X1kRPJQ6ZuI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=VZNYweV1iSWX7aiOnbL+T+HC562PtUjCSdg1zoG1aS7nGEo+9iYMDQYToAXqZ5R0rBra+XN3IBtdTsTpi0PDxkXYsWb0BZgcdrW3qew2wc9Aw2GLIi0CLKRhmtM7AbIqpmv94QRIu5FB+Po7DvSpYUFRsQ9b+B87lb79X9d7xH8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b=Qa82bJTv; arc=fail smtp.client-ip=52.101.72.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=genexis.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b="Qa82bJTv"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wvmpkX5D3671hIC+YX1j9U7kcoF90/nW6nLD1bCbDqjCCr88NgzsahiUoHgm/wAifcoioG/oj5TOkeijH5E6OHX71wUM1LEW7dKhu26LijWvDdtgYpgpnE+SWIxTZrxOj2xSQqe1LDe7PndwY0lkCT1LswLpbRODomC10CMdxpiiPfe7YvE9BNFUuuvYJ2dZirhHHdMJupJCN/tGhzGFkeFjscSJUj6ozLwvoDGDz+nah6RWhx183VZIHnFnvZUqR4HVCdWOIua2fXk+PVVUmKMZY3pgkVHb4CJfewa+v4xFmG69OV3FpvgRScEYzBcrHoXQzVoeGzZRki7XFR6lOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pysQx7JlLPPZJ7v2ScZ34NgcHaOf7IXC3Rk5cCb+l1g=;
 b=Ch5UQNxaV8D4uY92DH7ErluA8vpdqkozjlTZBtm5q5CtJiW4LhLdNNvmoK0EWfctShDA8s5rBrmUT3K5+SqGwfNq+Th+CZnU5XviJlFLhZOUMcrCIQkH7hg7aVQmAUWeZn0wZFX5uU/Wed6IWRpeSTMQq/i0Ot16vaoB/xdmAR8WQHN2w9JBRiNmY1giKDmuy5FE3nzEOtmd6wQSX4G86kzXPfjRxYUJd3MjGuo6nK50Lgcw+v2wWWhLpvRQ9LBRn73UiGg/cFSAanNuWgHS0Fea0m3sLEzqiAnLJv7hFw+QHgxsKDzZeC6f/38wsFQXy2NpyUZbCwyj47qYsq+oIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pysQx7JlLPPZJ7v2ScZ34NgcHaOf7IXC3Rk5cCb+l1g=;
 b=Qa82bJTv1amrT1lg0RjL2FoR00inSiAYm3H7BSUqUXzXm4X2I+3GR7jg6uN3D8/ZmoFkOdfwccLKWCgRDgZ/tf90RvPD1sYus/m5ycHHlBpQQdR7sSzld9qAnqn6Z0FfFGSogat8EYttqmy5nCZrTOtjsrkAMSGk4ixrPht2xActxz5pd1QviIKnlC6CHo9ANnFTzdQ9vwXGRGUz7lHFYDRD0W1b+kRth723g1S1fCxLxcQiENQIkkF2qK/7+TD4eutnyfejAqpOiLm3lJpEGMw2sfz07RZPSXq6Dnj3tFUKZfba4vcD+bPzbc5BsO5l2OsOLvWbJAEi00xsYNcEzg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by PAVPR08MB8918.eurprd08.prod.outlook.com (2603:10a6:102:323::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.19; Wed, 5 Aug
 2026 12:34:57 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0292.013; Wed, 5 Aug 2026
 12:34:57 +0000
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
Subject: [PATCH v10 19/36] pinctrl: airoha: fix IRQ mask/unmask code
Date: Wed,  5 Aug 2026 15:33:51 +0300
Message-ID: <20260805123408.3767648-20-mikhail.kshevetskiy@iopsys.eu>
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
X-MS-Office365-Filtering-Correlation-Id: bf45c03e-c939-4c09-5106-08def2edf547
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|7416014|52116014|376014|1800799024|921020|38350700014|56012099006|11063799006|10067099003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	F9gQeoU05e1nikdSU0QnaZd6CwtrUfigDtgAIjh7e7LxusGMRPtXByjdWXLuNDFu3KFkMTXGeW7x8G2+xvAE7e+PlZWdNxlMNcwp/uR/Q29VMgyVlUAIRi3pKHfkKX/pkqfZdt5bwHiXPPdklqTNSqhdCK4FIkGLQwRPsAxZO5NZzm7Clsr0wYcUtPnvO38Oc69Wkxw0G5Bb3HIYwOCoOwMH2992cvZ573Vb5o0cp9UeJRR9snpTAp2myS824U3JIIn0vdV595oLrXY2+Qyi+a1HdX/ImUDK8kupk1KNgyQSsxHQiV/cN6q6fgcmKBdsfVhNN5+ikuFAwO94IyCpKCCkNZIlCMFDvN/FHeRMxBPfGXqbFxGMuQ8eK/95QBGbRIGHgZQu4vEe/97OHd6mBZ8ufuPW2qSOsDd+iE3+UJbHEwhcB7Det/c4XwzaXZLF7HcWdn89kdmGlchxON4LdEhubTKu0it7ZRpIJgm8gwKpJEFCEsc44K0SBpxQCDdjnniIpulPBk2zl3adF0vubzkR07beqm83PL4ljV1AvA9CE03hTBJ0xYjYnIiST43bkaIy792RZOUNfCA4hiCM9LvkVj0TpBkJS9G2SWyXet+nh0/biqMlW3jvMN/CPPENEXWdsz03kU2x19o6sMWiltnr5uM7vavrw4Ltx/CTQeKKi1wNuSW8RPYHydC7BdKrxPsuuzyJiJ2a3m6IE78nz3Nn6P34jHPigfmbIoV1IGYpRN9fr3YtLi39d7/jZu2z
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(7416014)(52116014)(376014)(1800799024)(921020)(38350700014)(56012099006)(11063799006)(10067099003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?GDbRpd4MU64IQBKZaUg6k4ZJbiKohjbZDTuTuYdo+w5HMVVoWm7WxbYuPe61?=
 =?us-ascii?Q?kmRa7C9sd0ttNhcy0m1bCkUY64ERBuzkTaeDtU1+d9n+k4IkFt7LMqpA2nfl?=
 =?us-ascii?Q?ePb2bLRZZfzDML3WnNpjDX413FP2TEc4AQKUAz6/7hiFKsWrLcP3I4AxMO9j?=
 =?us-ascii?Q?vm0hU4VDjIaCn3oeZQ5fmfSP1U7Itiwz+lVo5AUzzBWx9UbcO3E240p3paPX?=
 =?us-ascii?Q?QPRHBOSlpElGklRAumQzLfBabWzoJU2/EqFwMoj/ThkSYlpFklK3ASdV0LSz?=
 =?us-ascii?Q?VH2zOsCqoGKT1TvuM42St78z7RL2g8OUx9MgPRwPT4ADAwEk+uRSc8KH3X5u?=
 =?us-ascii?Q?7Dmx6fdjc8iJjYUF5ZAOlLRkMz7KtJ4vJcWDtyXxZ9+23bDDmrIsQiF4NlSy?=
 =?us-ascii?Q?mdzs4H4iGwERwV4hWvRpVTmtQ7HcINWJm1rVc1ol50S8U1U6spG1kMXXzA6S?=
 =?us-ascii?Q?WMfY0DA1yytkAPG53e920+G6S6HWusnBYVkdApYEla97iV5EYSrBqc8X+4af?=
 =?us-ascii?Q?vcrRAL+MhdgyNMH/u5sFDctTl1bSaS81kYB1HmyIGujeHQTr+ppeeupv/afn?=
 =?us-ascii?Q?k3XTQbPYIh8A2DU2gbt1otX0dghFFMFiitRKb6WpRr5joqa9IxfqGPl8q5Qs?=
 =?us-ascii?Q?KZ8wbXQCJ1wkJfMEG3iqQwzUtyLOeVkHAbKyt13a8xs9SmeXJZZBWBpINSAn?=
 =?us-ascii?Q?TtCvHSgnMiA51hOvcBu35E9irC/4/Bf7+5yLkUz1nKI6U/QhbAE9IB49mwZI?=
 =?us-ascii?Q?ABsi69TmEbtDV5BOpYKAZr+r6nQrLfhdVwuFuKZ1TeThv6Z5cLKypmzAvIuo?=
 =?us-ascii?Q?V51NX6Q02rcNJmZF6RW+EXwITSa+3kIexbMOOvinhbhfvL7lfq77fhtrBj3U?=
 =?us-ascii?Q?I63O1/XA0T+aBeiuyXBy7cnGN2CvflPqazbWSsIMIXu23Kr68IhOSgzBs/ie?=
 =?us-ascii?Q?1upbaNyRyhWgYQ1mZVEhRHU9XoKNGcWPVqrrk9iRsZL4Vf08VqwpYyWcYUjM?=
 =?us-ascii?Q?VEkVSJsnanDJjJ2DSs27M5XaUVDZiUgJZeKrsH0mt6ZO1ZC9DU6PZdpneWce?=
 =?us-ascii?Q?zOF+fjduBy1/jty7fT4lzkYfMlfVtcJBZ+Zo3McZ6kVcTA6HMOoeRlz/ajfS?=
 =?us-ascii?Q?6yKfllihZ+vj0b+5zhmRvoqCUepOuRvyshYUHMlvdG2ENseRf2/7PHJDrFt9?=
 =?us-ascii?Q?PouOPTWd/4WmR9CKIKL5CfcJ2wpXA4HwWRL3kO02Ehnl9OeIARVTl4BrdDiI?=
 =?us-ascii?Q?ctKx6rurRWa0A5ocH01Sa4grlFhbd7pceFn6cc5dSUAOSbVS8g2J4teq4grG?=
 =?us-ascii?Q?0ouIoxYAG2rJjNWOe648Bz/Ca/fuhHf+Y1vx1dtSUldHlHusiSD6AD8cI+pj?=
 =?us-ascii?Q?dEJA+mvLJ1aTiIQwkyAB7f4pDx/HEWBeSEV7W97OzAegBo+Ybj25dzxIePxC?=
 =?us-ascii?Q?jvpRvqOhnWxEINP+DGpxnAvrfrD9lB5lTUrOQNNAAkACG0xU20irXYX5MXWf?=
 =?us-ascii?Q?malxN/Gj06UuzbHD1HuQW/HAFmuUpGWQ8HqaOnBz5hcZaodX3nyXd8omnoTv?=
 =?us-ascii?Q?Kp/je77xqYJJU+lcEjKirb0H7T2DYduPTwoMGPynpiOwIsavo1MhDzsazuSI?=
 =?us-ascii?Q?e6oZ+besz2EOJ9bbXBQiClhMlRrrzqzMQTKJntmM5PGCW8qjsWaNF6hTW3tX?=
 =?us-ascii?Q?MGJmfhqqPnnAgKuMDN+SiQPaMdRZFIe9juamueR9HcGfnAYWpdJ3Y+/bg6r+?=
 =?us-ascii?Q?JRiue5k3mm/RY4aDPPollu5GtHcHtJI=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: bf45c03e-c939-4c09-5106-08def2edf547
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2026 12:34:57.1386
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qf+chnWo6h6KHlbKXx6G7kZzzAd8Uh4cLZ/hdd+ABW6+qpn5N4NynsY4GBEr5VYqu20UmLjG3kVwkr+uV13e93JDcj3JvCI64LluVk/OI04=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB8918

When using IRQCHIP_IMMUTABLE, airoha_irq_unmask() must manually call
gpiochip_enable_irq() and airoha_irq_mask() must call
gpiochip_disable_irq(). Without these calls, gpiolib never sets the
GPIOD_FLAG_IRQ_IS_ENABLED bit. Because this bit is missing,
gpiod_direction_output() will not realize the pin is actively used
as an interrupt.

Fixes: 1c8ace2d0725 ("pinctrl: airoha: Add support for EN7581 SoC")
Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Acked-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/pinctrl/airoha/pinctrl-airoha.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/pinctrl/airoha/pinctrl-airoha.c b/drivers/pinctrl/airoha/pinctrl-airoha.c
index c64f3c9a35acf..993b0d3d993eb 100644
--- a/drivers/pinctrl/airoha/pinctrl-airoha.c
+++ b/drivers/pinctrl/airoha/pinctrl-airoha.c
@@ -2595,6 +2595,7 @@ static void airoha_irq_unmask(struct irq_data *data)
 	if (WARN_ON_ONCE(data->hwirq >= ARRAY_SIZE(gpiochip->irq_type)))
 		return;
 
+	gpiochip_enable_irq(gc, irqd_to_hwirq(data));
 	switch (gpiochip->irq_type[data->hwirq]) {
 	case IRQ_TYPE_LEVEL_LOW:
 		val = val << 1;
@@ -2629,6 +2630,7 @@ static void airoha_irq_mask(struct irq_data *data)
 
 	regmap_clear_bits(pinctrl->regmap, gpiochip->level[index], mask);
 	regmap_clear_bits(pinctrl->regmap, gpiochip->edge[index], mask);
+	gpiochip_disable_irq(gc, irqd_to_hwirq(data));
 }
 
 static int airoha_irq_type(struct irq_data *data, unsigned int type)
-- 
2.53.0

