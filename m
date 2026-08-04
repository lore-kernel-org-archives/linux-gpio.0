Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11021116.outbound.protection.outlook.com [52.101.70.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A268D47A88A;
	Tue,  4 Aug 2026 16:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.116
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785859514; cv=fail; b=Sfgoj/O51BwQ5Yw/aDJ5gQk0K1PS0+h6oE5Z6rWm2UElW8KsRVLMNiKkjx2RL6X8pApqV/t4BQgQ+QNDZgUaHMKkjtjITIg/p3VSSzPU5UWXnqTF6iZ/ao7sLw9mhwZCWnHLarZyPwx/hjYREGeYMquO02w3NBmV1bqhMOR9x6o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785859514; c=relaxed/simple;
	bh=D0s7eM/8FtSaKqO+aykEbtc21MjSfQs3xc9+n2uXAZw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=OfAREFWaXRLthanCWIfCqsn9dOlJ3zdxdH5QsIsBxkjvxKM8uM2NF9oECOzJ5i7mwny/Cf9QMzT0wJB387WE0UX6plOg54JQ+2gO5Fb+G064cxgTRjWOi37JD4blkMWhxlK/ZuHyPnkfqYLRruPre+phhfoyt/Wm9EZJhPrbmO0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b=M0WolIbo; arc=fail smtp.client-ip=52.101.70.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=genexis.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b="M0WolIbo"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YxsCbTmyx+IMRg645h1FUjdMS+YwI+ucjap9uqouSfSqLYi6qGwg3Z5bZZIcYR3lf5AlgaL2yRwhWFLGyvAkFhiUOGyk4ioW0IagJrRK+471Be54+0UuCYJZyrPYmZpvYuEFxeNnsguQ/46WREt1PsY1LEBLZegsp0kJZSSL4kuVec3SYBkpUiiy3SpDO0iW+erNuvDsl6VcYpfuwOB03h4bfOQWa33F6GJHtwt5G6nc3JSrNVua6sAOab0Da2UgaOCTA+JvEJ7vaZ4HsuIFFsP8peQa9V6b4pRtVoSnKQzOT+UsRESIgRbYeLKxkKaWLJ1qirlI4mNufvlRBTrkBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mnJorTLL3GDIjHVesAKnTmT6LsYV4ve2vmzHC5gwJus=;
 b=UAmu8t81Aga8ETJNobTiI1q10Zn6TGA9jHIkukssjNyDhCmOuyPevWwVM3KpwigMTGN66SdibtDEGkehyHS8/Hz0TtjyAA3DjNnpfUfur/WNAj8oOqmuIVM/vAjxW7BmozzQ0fWcaijlEDPcpqmlC1jOvWiJ9k6pJCV5GFPAvc7i/gHHoH/dTNHCzTXDGijeuMt91ob/5TtrCuuvISp5IKI9/j188EduiiRetCw7Y+j5N2fSUuBeYAt4CQGC2e1bP1NfIMySmaYIvHCX797eNPe3cR33rmVJQmIvzVpfWoBKIiNQuI3QLFL7DetGQY91/NzUyySy9MDpfdzrrR35qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mnJorTLL3GDIjHVesAKnTmT6LsYV4ve2vmzHC5gwJus=;
 b=M0WolIboEnvVcDgIZnvN+Q4bZdHGSNwTAnDPerZdrdGB7eHVL1jfa1P7Hmq9bJBgHY+IvJxNadgWde8+M1OOt3uiRK8PN6IH3PEP9DwcJtnNzOZ0MlQNQLT6GSJe6HthCVDLhOeKA3q8rIThyzf61/m7qyrIHqsNCKwo54MLZW3dW0uhqPH93qRn6LZ0Ja0IO2VK6XrvPNHzT//dJaMQFVonZYGRwM2CbFqY8dA45yIfxDPmJOFnTiOLAwwbrYqXfOZA865ZjLv8pM7NVj4iUziXqyrXgrAz+6stPbKHUaHN13XKk/9zuCPoMTA4sKoYjA/Tk729/jaOcgJB7bac5g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by GV1PR08MB10792.eurprd08.prod.outlook.com (2603:10a6:150:160::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.15; Tue, 4 Aug
 2026 16:05:06 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0292.013; Tue, 4 Aug 2026
 16:05:06 +0000
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
Subject: [PATCH v9 20/36] pinctrl: airoha: fix edge-triggered interrupts handling
Date: Tue,  4 Aug 2026 19:04:03 +0300
Message-ID: <20260804160419.3592327-21-mikhail.kshevetskiy@iopsys.eu>
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
X-MS-Office365-Filtering-Correlation-Id: 542094a3-9480-4d24-dd64-08def2422659
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|52116014|376014|7416014|1800799024|366016|38350700014|921020|56012099006|11063799006|6133799003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	e54bnQ4KlxbO6Kpp8DZmX0Hp6OOb7MnIsmsRBewMwr0VBW5b4AHljjCR6bUNy8ObSsdXChkNRBlN5zo+m7As5txTvYsjW/ybxC798q8c8508k9vMZHdiLPHQ4TKO/35Hawrx7wbaoiqRZuTpi6KIV044wsdpzACYDYaCf+aiATs8YppKnCwciE9oZeWTb+BpmpOZLz+SJxt15vn49Qi+cv8aLGtdSEEZc29//MTUwk6PXTFFRIzpqjRgJ0gtnv+8CT5qd+NV30qtUsXgJvdsRZO7D4jz0+aDCIXUgWqPzi4ayJ9P3EWtFnDFEjrvyVBTzPs0uwPB5ivbyYrF6i4B7DgAx1B2mo4eNX/8js0FCcxZdiOtxiHgqi51npZuP1BgvYFLZIEWTtBNt4Bl01wSOhaW1ggBSJYWy8vkzdMBVbgAA7vSY4rGaM14vtL0vDAPpsoGbL6+BnzjlFYWi4T4EzN1L2WwDH5qC3x7CoQ9xT37eXSu84XXgW0DqSY7m52Rq/WWq6/qmhxQXfJVQdPWaqiwd8+nxub2Rdg3c6GgBdxBdt1QcrfZwDB7Wq8xwFB2tAf7DYX8rS/T2PEmnaaErAOToD2ji4RubItL93XRToO3RH9jQdB14J7AI2DixgITjfHwsWrpecsp9SUpMMEvkuKr1yWA3Fm+JJH9P8fb8VS8IR/UC4Pi60f5YxoPPXbMdFu1Qu6w6FUI9UTGfR5sHvkDPCmSFyRyQ4pFpRNlY+qfaNHnq+CKEi6kjjWTRz/E
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(52116014)(376014)(7416014)(1800799024)(366016)(38350700014)(921020)(56012099006)(11063799006)(6133799003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?sO6LguJSeVNCeN8EQCV7qxDB/EPMgmPm8JrhonQ+KUCDqBhfS4xtTnlGp2k4?=
 =?us-ascii?Q?rrc/S8eqysVRblxed9C3v0z+mg9YJ9TeHEmQTP7UcCYj/qO1R+xsIknq1/8P?=
 =?us-ascii?Q?YxbzfyVkZSsTz7gZuyI4uSrQytqtLv1iwGuOO3dDEt3cxjv0Hc0YymmvXfWD?=
 =?us-ascii?Q?EstLg6weCrsNVyeMQ/IvWLv8zRcaD7Kpyjlj+PCli83WTGey7MV64vEuUa//?=
 =?us-ascii?Q?jFW0HkVsb/T11dtHhhOZfru5h5op5DDi5psZNT8IEfwJsyLoSaVFC1ExSiKa?=
 =?us-ascii?Q?BN6ehQdvF8iPxAFsIKZkdYLfiNRIhmHAvPEpgLulsyyIw+nrPi1ZSWyl5Qr+?=
 =?us-ascii?Q?CnuZUAT3cW+DmZrci41nT4K16j2EySlcbaEUoZ171xSZeCe+eBdx+TsEpztu?=
 =?us-ascii?Q?HLLCGg/DMnw53w6CINpH1UbA9icijLH4/my8tSsCs1T4Tfk+GsxXlfAdHkzI?=
 =?us-ascii?Q?ZH5jBXBi4FsW9aAbtykrcIXuOunU/hfVtSB+ZMU8OkMAIEFpZ37bB6AWbi9k?=
 =?us-ascii?Q?xOS6Fg7HWzQXd998FAFEnp7BSaqJiWeYXwy8ye+WO8sMMxYyKK5dhgmUqlXL?=
 =?us-ascii?Q?N+dzQlil+WTmMH8NiThNiNsTEOZuzx/hpnkNV1ysD0yMUwFzSS41H0jFLm5Y?=
 =?us-ascii?Q?okqJN9MzfNaPnk/yR6hExgPPbNac+DWYybMW+wPRcDU/rcxax4r8Kij87lNb?=
 =?us-ascii?Q?MgBCoceu4zeJ4xvp8dL+KmUGOj+M+mEg412TxVRd0uc9sLRPZzl7vkOGjfJJ?=
 =?us-ascii?Q?JtEzdUKZT+jBcxkDOo0jKefUZGO0Hj7eh3rsPGYPypFAYpUx8RsUMc1ANqwm?=
 =?us-ascii?Q?qzAjScqfnkAR4H9SC4VsHzMh5ZZ/RxL4gMXd3L1TAHWwykHyh0HEyhztUq4e?=
 =?us-ascii?Q?xsF3vmSRy3c0NOpZO84yrd5P4dU1KFTGQdbV6NiNqAd5Mmzxe3hR5fNLs7Ru?=
 =?us-ascii?Q?AnFrm7QKzNiGLRcB4yVioI5Rj2R1olehcxvLvA9jtqS/WRGlwcGme0e11mlt?=
 =?us-ascii?Q?WNEui2mESg2dZf6wKsoq0CoI/y3blLHM6WRs0e9NV2gRviqP4aryxxQpDINx?=
 =?us-ascii?Q?vsa3hLwzMdBVQ2eStLDDO02XExaixT/gCcX35O2UjtpmC47u7BIVcESpJ/jP?=
 =?us-ascii?Q?lW8b3IK2PLENblUUyMtq+/BruEy1X0I0sLAEG7lMQU4ARXU2jPVnA5fmT1fq?=
 =?us-ascii?Q?4qqWd+fz1gCA0ZpV221+ctD1BitqW9mX1G1WUT44oxMi60GVH664SuyWmltS?=
 =?us-ascii?Q?+BjKNf+HDnrqTiV8/ZaulfaJOG0mVFg9KNxb/l9oFecS8COzEL3AObz/s0De?=
 =?us-ascii?Q?DW97ZviRevwDmCHzRIlijEgILbWJOw+5qUz0eLMaDsYh6Sytthwe4r3zpHCC?=
 =?us-ascii?Q?S78QkE97rUNwntnmhH0H/Wr8KteAP0WPifn/k9WlbamhScG+R9epOYG+PfuU?=
 =?us-ascii?Q?eY1Lsad54WgnbzrnJ00DyQsfIDICcPI6Urhgd2kil4AE/PD6PkDcYJXY1pqG?=
 =?us-ascii?Q?1NGOSoxeA0L33L3FlHxwrKLtKVf34kTQ1ZsT+t3v6UJBkIZB6hBds0OaOruo?=
 =?us-ascii?Q?d9psV+1+hdC13rIGJCi63T5QZ5sw9TSxkDUDfgWMzb9XhobpN7DyPlId8F2J?=
 =?us-ascii?Q?8MqSz0U3xjtNPEb0xB9JXUX9zCy3zDd80LeuadZx1Ujn8cR5bbyzIbSIrmfy?=
 =?us-ascii?Q?WkTJcAEUx/q8tbVT8ed6b4VZ3d5Df1uEID+GadpILAYN2yk83kHq5OztwvQ5?=
 =?us-ascii?Q?ON08nv3QweWrbr9eWYaGk3mVR7lweWQ=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 542094a3-9480-4d24-dd64-08def2422659
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 16:05:06.0297
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fWE3xYzKwhDdJ19XmDFGVNuzxzKQQ3cJUNsDvRRW8Ej+gHZTLAVFdQlYtKawBAQpZzjbVkY2FHna0GUSxNjJWjZebZFLxE/RxZeOgLwhvgo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB10792

Edge-triggered interrupts are handled incorrectly because of
 * no irq_ack() handler was defined,
 * no handle_level_irq() handler was used,

This patch probably fixes an issue

Fixes: 1c8ace2d0725 ("pinctrl: airoha: Add support for EN7581 SoC")
Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Acked-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/pinctrl/airoha/pinctrl-airoha.c | 38 +++++++++++++++++++++----
 1 file changed, 33 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/airoha/pinctrl-airoha.c b/drivers/pinctrl/airoha/pinctrl-airoha.c
index db9701be851c8..45f1af7a99711 100644
--- a/drivers/pinctrl/airoha/pinctrl-airoha.c
+++ b/drivers/pinctrl/airoha/pinctrl-airoha.c
@@ -2628,11 +2628,28 @@ static void airoha_irq_mask(struct irq_data *data)
 	u8 index = data->hwirq / AIROHA_REG_GPIOCTRL_NUM_PIN;
 	u32 mask = GENMASK(2 * offset + 1, 2 * offset);
 
+	if (data->hwirq >= ARRAY_SIZE(gpiochip->irq_type))
+		return;
+
 	regmap_clear_bits(pinctrl->regmap, gpiochip->level[index], mask);
 	regmap_clear_bits(pinctrl->regmap, gpiochip->edge[index], mask);
 	gpiochip_disable_irq(gc, irqd_to_hwirq(data));
 }
 
+static void airoha_irq_ack(struct irq_data *data)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(data);
+	struct airoha_pinctrl *pinctrl = gpiochip_get_data(gc);
+	struct airoha_pinctrl_gpiochip *gpiochip = &pinctrl->gpiochip;
+	u8 offset = data->hwirq % AIROHA_PIN_BANK_SIZE;
+	u8 index = data->hwirq / AIROHA_PIN_BANK_SIZE;
+
+	if (data->hwirq >= ARRAY_SIZE(gpiochip->irq_type))
+		return;
+
+	regmap_write(pinctrl->regmap, gpiochip->status[index], BIT(offset));
+}
+
 static int airoha_irq_type(struct irq_data *data, unsigned int type)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(data);
@@ -2642,13 +2659,25 @@ static int airoha_irq_type(struct irq_data *data, unsigned int type)
 	if (data->hwirq >= ARRAY_SIZE(gpiochip->irq_type))
 		return -EINVAL;
 
+	if (type == IRQ_TYPE_NONE) {
+		gpiochip->irq_type[data->hwirq] = IRQ_TYPE_NONE;
+		irq_set_handler_locked(data, handle_bad_irq);
+
+		return 0;
+	}
+
 	if (type == IRQ_TYPE_PROBE) {
 		if (gpiochip->irq_type[data->hwirq])
 			return 0;
 
-		type = IRQ_TYPE_EDGE_RISING | IRQ_TYPE_EDGE_FALLING;
+		type = IRQ_TYPE_EDGE_BOTH;
 	}
+
 	gpiochip->irq_type[data->hwirq] = type & IRQ_TYPE_SENSE_MASK;
+	if (type & IRQ_TYPE_EDGE_BOTH)
+		irq_set_handler_locked(data, handle_edge_irq);
+	else
+		irq_set_handler_locked(data, handle_level_irq);
 
 	return 0;
 }
@@ -2673,8 +2702,7 @@ static irqreturn_t airoha_irq_handler(int irq, void *data)
 		for_each_set_bit(irq, &status, AIROHA_PIN_BANK_SIZE) {
 			u32 offset = irq + i * AIROHA_PIN_BANK_SIZE;
 
-			generic_handle_irq(irq_find_mapping(girq->domain,
-							    offset));
+			generic_handle_domain_irq(girq->domain, offset);
 			regmap_write(pinctrl->regmap,
 				     pinctrl->gpiochip.status[i], BIT(irq));
 		}
@@ -2688,7 +2716,7 @@ static const struct irq_chip airoha_gpio_irq_chip = {
 	.name = "airoha-gpio-irq",
 	.irq_unmask = airoha_irq_unmask,
 	.irq_mask = airoha_irq_mask,
-	.irq_mask_ack = airoha_irq_mask,
+	.irq_ack = airoha_irq_ack,
 	.irq_set_type = airoha_irq_type,
 	.flags = IRQCHIP_SET_TYPE_MASKED | IRQCHIP_IMMUTABLE,
 	GPIOCHIP_IRQ_RESOURCE_HELPERS,
@@ -2716,7 +2744,7 @@ static int airoha_pinctrl_add_gpiochip(struct airoha_pinctrl *pinctrl,
 	gc->ngpio = AIROHA_NUM_PINS;
 
 	girq->default_type = IRQ_TYPE_NONE;
-	girq->handler = handle_simple_irq;
+	girq->handler = handle_bad_irq;
 	gpio_irq_chip_set_chip(girq, &airoha_gpio_irq_chip);
 
 	irq = platform_get_irq(pdev, 0);
-- 
2.53.0

