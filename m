Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11021080.outbound.protection.outlook.com [40.107.130.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4387430CE1;
	Thu,  6 Aug 2026 22:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.80
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786054036; cv=fail; b=pK4rFm/PJQs/qUlLnhBjZOcXG0G2W1fKTcnbN0Ifc6Xs9VzhaDZ6bCDOJXAuzh+6i67eCdomklvJS5lZSlfjnsSNJrh/v+1tKmdgoGN+t5zp3HdiOw5h4/Ss+8o91wlghfKui85DPK/8xKWjCq4BJ0tNTJlU7zVblv10mD+6N6c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786054036; c=relaxed/simple;
	bh=fiBYXV5/r+Z2kcvdJuC2fn0AG6ELOks6X1kRPJQ6ZuI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=WtPp+tOyfLg4NgvgmVH8oDUzBzEdN3QlDfg5ashq+K/P0TQCDSJjCnIRou8u1aolivsAHISPbQ4OKoWfoH+axGA/fGzOK4UIQKVINXgEu19ddWtCDbG+I0Qd3pXN15dz8QMNPPQrDBGmEaTlvtpICRKj5gX1F3TBoto2IS6pcis=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b=SCKF2JPy; arc=fail smtp.client-ip=40.107.130.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=genexis.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b="SCKF2JPy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kStCfkLenldpU2uJ9UfypGsq0kTudgfwvW3xLvp+BlWTDk/BtblTT333f6R4X9ixrg+n65iUTZc+ymph6Wn6YvN6bPwC9vzk65dFvd2zQDOzcTDv+8sRT1q3J0SLI1eV9zVnzt8mqx26dNsBCgAl8pHd+xTkhFfDhHD1fs2KUTW+GO6ZGQ25XczDtfbCunj5UDzZed1DgtvnMVzBhoCBGiwF3J8B/T0LKLgMnfNRbptg/C1+xEKHYahOLOz70Nfo8qovFV7siP4hnhL/2LRZy0RebowLH6Wi1Ix/GUoMmg/4+l+7bV9zud3rnwa47voaK0oQwcWv7eXMpN/NiG1yfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pysQx7JlLPPZJ7v2ScZ34NgcHaOf7IXC3Rk5cCb+l1g=;
 b=RyigeG+fgCIZmfbvWgADu2Keyx2jvysfUIP4cDFU4kwcbDOIxw5ha/CeS4CcFX3qY1RcCrUYXMT3M+YrbUHCvAyxEk/oso4Z84TaFbqIeI2ga9zT0NFfRUAsuOQ0QSIoiRxBVAGYWJpgwRHbyUTiIXCTWXjYR8l9QMFgmQGgoL/FN9A9qfTJO77BiW1Quq2tnljWitF82QvXFwpaVn39t1l3sAArSUkHXgssIL7gQKP/VGDoi0ffnlLEa5JLdY36GiENK8yGvyWjtt1gzCGkTuY5UFuk27HQvG5ShXGwMAHKYRLTCTbCbLqEe7dvR43KKn3X1fBzN0um7G3hEjlEOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pysQx7JlLPPZJ7v2ScZ34NgcHaOf7IXC3Rk5cCb+l1g=;
 b=SCKF2JPyq0NZ/9D3M97Z8uWD+t747E6Euj8VleXxh12+2w4ao9rSlvf5o/QmOfkYXUutNKitxo+xkl/hymweBMs3NKwqTZ4bSfXmAOboaxeAAeFiCFkeiaLMBZV52np8L4ZiT8j3Da2BYYqkC36rvNNqx/Ul4fUkajmblBUBmTPhCjGDWYXvcNmiWru8zNQQuRZ521yWlO5NqrHtBoMW/IW+QWLGTM5qjtBjIzKsM3hb/z/zKwdEUliXj5UtYlT/PBk2U1xSapYfotGZI/BmKkkccXLp2fEoJEjeY+7yoKDZnOJWpU7nl8Q5iPyrvDXmMgm492q13YPs5imm3wS9Kg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by VE1PR08MB5823.eurprd08.prod.outlook.com (2603:10a6:800:1a5::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.23; Thu, 6 Aug
 2026 22:07:01 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0292.013; Thu, 6 Aug 2026
 22:07:01 +0000
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
Subject: [PATCH v11 20/37] pinctrl: airoha: fix IRQ mask/unmask code
Date: Fri,  7 Aug 2026 01:05:58 +0300
Message-ID: <20260806220615.4078303-21-mikhail.kshevetskiy@iopsys.eu>
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
X-MS-Office365-Filtering-Correlation-Id: ab554c7b-edc3-4571-2baa-08def4070aa1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|23010399003|366016|1800799024|921020|38350700014|10067099003|56012099006|11063799006|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	fZcXU4UUzDAtD+PAnCqBLe3QUf+dNuuwM76DCBtyqt38hU0AqxpJJgy154qfHeUVPpFZefyAy7EmIFPy8Iml43DYWZSCjaHFHBlgonQzQAmPY/nJnHekLAmu64UZTQXHyr8T8CEXBUBXZHv88Pd/W6Xyja0nw8ZojF/JDmytJbf8mK+elGdKksL2GWoXKx0cyjiTr5Laweaq4sDrDC4AodSa8aHgn+trV2/GLWG6Ibn1/7+lm3xWtfJA/5+cHmd4psG+CeK5tGkQH85re1XXTo+xjnXjDFW2jXYTZdk22SBMkNDwRAyVlgKzTxGy8VOEGaiYS2qWJKggzP/arOYpHMTkQt9CNS33D3JKOexdisivS2gM+W+Yrr+4lQ3wl0ts11IwcpQKyaqNehHAru1SVAt6k+TUDoltSDWFIZcqeoLry6a9AUeQZFoXjOm2E4GZygXhce5tryA7GCMeqdAom7pXv4NdgFJm03ZsGi4PEB4zkKXsEtyO4SzGFLMmba7IWFeaxJSy/gvq/psLb42rk6Lvv3z8Dnx0KO4ONRqiWDuUWlbY4PT9tk1noLF3hRCYDE/FcmZCL0nDHHr9N8o7plaaslF6TtZKQeIA7PLZtE4Xvvu5FaxS61wl/9YH361EWro4IlKqkXjNt4DreBEy1lEXkZRVejSyZihuZe2rkX6bs3IIq4PDdD4VRDczAZRecskiv1IxS15aZJyAccMRK7I01CyhPbpW0RF1T1CYVdzoOXcw5KWoijM3JoVdPa/m
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(23010399003)(366016)(1800799024)(921020)(38350700014)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6FOZObHPCROl8jxz9PdlBbBDXc1r3Nd6Bm66AOLKoQC2MPStX84Q9RWecf+G?=
 =?us-ascii?Q?2xMWd0pAfi6tzcVKyGb2LLZspQxwd+1EbC56cCFHlN09kD+jXxktlMW4+54B?=
 =?us-ascii?Q?Wrj+T3wC/C0b5nrvMsOFnr5KUVHVI8iqNIuA4z28r/VWgYM5KxpwkYg9AUl0?=
 =?us-ascii?Q?8ezS62NUI/I5xk9whkEFMb8d2Pe7Jm/pG5VKzP5MKawPAMsGd91urVKk9E0U?=
 =?us-ascii?Q?szda7LVG3I1K+a5xYxBbM7xcmNsowus4rFdywaEHvklBZW7j+20Wt4dpVLxb?=
 =?us-ascii?Q?goZd0sWuq9hl8wY4NBby/m3puUIkDYO5NqbKIteY+fH2whbcEFbNn1Fn9jY2?=
 =?us-ascii?Q?l6hXIjWiSCku7Ulua9Hx77MjWIXLH0B82M2xQfDDvXzgveV+Z64mpC8rquFa?=
 =?us-ascii?Q?OJTd5typzS5WWRTh/t7qMp49KDPM4BT+0xQv0AcBlkX84oPCnp2TgKt9Yb4x?=
 =?us-ascii?Q?c8ddnM/ImBkpDSq3QDO0wDqVhii7kw70uv5iIAN75eApU0SVkSE4/aUfzgNS?=
 =?us-ascii?Q?J5hD/O5mSmjiSzI1fxITJ/QPYqcO8iuV6/dZupC5Ipd6WRqaFiayqrG5Sbm7?=
 =?us-ascii?Q?zRl23cYwLBoNtqeqwZub+3vRSemrqlgX/THffj8YMyuGLCDRQqUQA66eVAUV?=
 =?us-ascii?Q?1A+cWb7oNxsEZ+rEJmhh9rxDKOE64Yil/uQgdlMLpYxEimMUuttxS/l/8mU8?=
 =?us-ascii?Q?3XtOWBJMAj+42Qp1vaZ8IKNCTOtzShMOLSC5/Pwug7O8vPqITQh58u86dPvy?=
 =?us-ascii?Q?HtcVjrSU6JIQMImBK1ZaH+dTqV96mYPLvUcCFpVB/LX5byOhOlek+/Xwj9j1?=
 =?us-ascii?Q?ZM7A+zotm2TD6HOUn5mgneoX9pFwbEHmDPZf77AY6rlUXOYGMePmhox0w8ff?=
 =?us-ascii?Q?hTEVtt5Y7UTB0E009WOF0G2Mge5jWmJ1kbYOuJ3LHewUiVhBvdsXVswTaavP?=
 =?us-ascii?Q?l2crV2XS7Ba/7ZaKN9XTdwriw7GUbymAhmW4HyQ0REMPNyZcJO/0KM3PD3u1?=
 =?us-ascii?Q?+16DbwIfmSIBpbJ8Kov2JeGgK6NG0rF6DtDBSjXovdxZUf+cRPTeHJ0tqc0Y?=
 =?us-ascii?Q?UxHBjfDv6VDlP/EV18SBkIlMnPnRmPuedELkDZgbQkzLqYmJkyyhZrbJrHh1?=
 =?us-ascii?Q?zUQx8icIs1LEcGFwx4XN6yiZSn1gplLfSz4FpiBrDesZOKjJ5EERbi2UAixJ?=
 =?us-ascii?Q?68xJW9Q2GTF/ayrb5f5vPouYzYi24hJ1dDjU5Op6pa1i/b1wqKS2Ev2twEZ8?=
 =?us-ascii?Q?EUBqWsXRo2U3MwzLX49BCEeOp+5euDfMvRa7mOfKd/80Wi2l8v8jj13dUMYs?=
 =?us-ascii?Q?jJVS9g8KdkJgVbLV+uXAnNf4GISDXyL8IqF27vIGyBQ22/cvEOpxLkwtYTP3?=
 =?us-ascii?Q?fvkHJmOzE4p3Hl0OMUetz8IrzF8ZSNMVushL3RTKU30JfRn9x9B5UGr7JA2S?=
 =?us-ascii?Q?MpvkAzgGug03II0Hkr7XrmOPeN3YxpmzY2ymRo4xzfqdSLTUxobxNXSSwoWo?=
 =?us-ascii?Q?lRxdgYto4PO4v37Kjc7ZTBiWNOHY3r1I51LSynmmCTjHr7kjJQrrOGGaWI8B?=
 =?us-ascii?Q?i2pJv9wGUikphVk9Ik4o9kLjtbWKN24UI395msHSvnTJM76IWsBortLaxUxB?=
 =?us-ascii?Q?Ikg/O8+ikh6jfcMPH72I/aRaEfmelvsveFVuPb4B4fVaqhwDoimtqth/j9nw?=
 =?us-ascii?Q?jrOoEQRflb7OjJHOyIXP+bpxw9+5nDRnCG8jYSojruj6dwFjF03iEniFYrWL?=
 =?us-ascii?Q?62lj2Gy6pkIeLDrIapfbE8jVSVxujw8=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: ab554c7b-edc3-4571-2baa-08def4070aa1
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2026 22:07:01.4649
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o2294BKcME3b7n9wz590zvVd5Gn5FDRd3LsY4fDmj7Zf/xSkflLMwIfr0oSUCmJ3tl8GKBGUFNBB+Q8Voa921Et9WirNmO06+xx9x7Wn8qs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5823

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

