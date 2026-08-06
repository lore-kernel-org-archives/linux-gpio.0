Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11021080.outbound.protection.outlook.com [40.107.130.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9C23430307;
	Thu,  6 Aug 2026 22:07:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.80
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786054033; cv=fail; b=YoB22fffE/G1EMZSBuKzWFcs0QVWVKSnsFKRR6clsfG2AtdlhpsbQ6w2C2B2bRvO7RMPvzNZiYQb/YcXI0xsHwajdT49YhDleY3VapIWbWbbeSK9W4bDcuSCv3z3onhcwpQS4p8o0KtMZn8iqXS6h6xnFKljsACm/hZHp5kNiEg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786054033; c=relaxed/simple;
	bh=ibXUf1TRwca5HFAMNXxvTgi/r7XJyvm7zTOHyiBLrds=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=rBj9wFcf6qXv2ewQs340zwFXIFgHsrYHwFtjqa79/4uF458rGaryBrpCT1k/msbVfHTZxqnBz62jVm1prubpf/y6ZIn/DCkko6hY/BAKzu8Spg7q4o0/VjlIfYIU2cjTflUjZKf6xetnuR4jQ7IBw2VAh/Z32apOcUsZa/t8WYY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b=yXh6CqN1; arc=fail smtp.client-ip=40.107.130.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=genexis.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b="yXh6CqN1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CyzWd4Suy7OPmKZgeYEyEfxw49n8U9lWMdu6cQiafsLqTurI+5XnzsJr1ms9EVzetZgUJo/EuTHT3f9wez+G9Qxhld2L8qdVcoMacmZykM7OX6PjSj+3GbQVwBgqJbdNFS7FHFXCOGab0vMzTgde+aEtcWWJoQT1MzqzcywqWHgkIoXXi2NdsqdntXRLr3gT1+aj2z9MYGP94bhGFGVUksmrd4ODdDXQaScZD9bcWT3S9X8j3NG0USMsg3E819vSOFOaVhpMgj5SGYF2KoyrFCNKmn1J2uGmPcBvtDAT8i21LTxcrSUO0Utkva3agvrENeJiEv1GiJPVfNMZ8IRKZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KhRkIrDdRK92RD50Gd1PYczuJhXOitD3Dtoc2/SAdvE=;
 b=RGLyU5S+8lUA/sXLNvoMPf3nNvrqLDKuf2ADb1EhmHTo7ouRyiPHDlA7JX3czKgbgl284a+D6VzYbpE3VjJGfRGi/ZZD4mRvBwBC1+hFn9QfGFfIQdnawiklqGrPyKCkYiBmAT6FJ7IEBAiyI1+yJUoZR0sgBnhG2CjUaJ05QGxfWFhUvkqzeZ57tODSydtIU8ayF3scnj4+W9k7ql2Bmj3R83doXGLD1NSuWstk5HXHIDw6jlhizRcb/BEQ16dU7jAvCyUl9rCzHzniVMat3jmxZU3KZVwlrS38L+198NJH0XjK8obtBWd3N6h5ugeS5Cr3nlumNz55tII3MPVubw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KhRkIrDdRK92RD50Gd1PYczuJhXOitD3Dtoc2/SAdvE=;
 b=yXh6CqN16MBUg0Ri7ZQA6skE5SJAT0bM4KGuOnpKQGzj/wPooPKzo+PDhGFXyYcBOO0ri4gJ3xZ126vILb33OVg4/W0lJqY7f6vugfTPtZEViYdKS3tEY1faQFOcBoqRydQp9qk4Ey2jpOyrV9o7MvAnpC3ZCSRplPBwr+4rdRHrANOAn56/R70lbh8RtfReMBwPDgNCvGs72V00GvMZ2Peb5RUE3+g7nB27FMBAtFPhHQRUGVtHclp2RyE5s03SLk173onrr4nh4C/TwZaxbKVuzx/iu1VwY1DOFwDmKwNY8V0WID+QP++dUM7QAumKuDpkOYcAzPSAOxXjjumbug==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by VE1PR08MB5823.eurprd08.prod.outlook.com (2603:10a6:800:1a5::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.23; Thu, 6 Aug
 2026 22:07:05 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0292.013; Thu, 6 Aug 2026
 22:07:05 +0000
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
Subject: [PATCH v11 22/37] pinctrl: airoha: remove not needed irq_type[] array
Date: Fri,  7 Aug 2026 01:06:00 +0300
Message-ID: <20260806220615.4078303-23-mikhail.kshevetskiy@iopsys.eu>
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
X-MS-Office365-Filtering-Correlation-Id: fa3cb38c-205f-4b89-1883-08def4070cc6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|23010399003|366016|1800799024|921020|38350700014|6133799003|10067099003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	JM/FwrZY0IbgxGbC0Mbmfa5PxzcBwEa88qT2Q1LmJ/VTFGROzsOj8k9DnHtfw70h/jPJHBFmZQRZMSppJKmaqarvWaiu2NYbOihdTYAqdknFBGcXH0Oihb7tLv9vQEeljwQCejFy7B3YQMaJIR1ual6twYdzBfh5tnTZVIuuaVcedUtpvlizYVQXFSN5tYQw1HqQ3nc3zXkzih4bkK6s0+55CBFAwZRSY7DK0Q+xddi0t9L7cZzShAaVHyLJEtnzEjTb2zK7M74obSDo65mRLZPrdZa5wMc1jj0wj4wvf5ejfeZWz0REmRBs88wh3mE/WAUuOx/LYxT36SHChf16YFmqsDx+YmVBuXUJbJ3wlHFd53m8+cIbXc0fXeSgVlJfovvsdsjecCZrqmeYzNIkWbZZ40ZrHY2+3vaKnZQkN2m6i7mXWJqWB9hGs4l3IpDLoxZiNWbQvBRLg8eLuupGhZshy2gUF4j3K+N4kZW1uCME0WZ+g5+Do/r7eBKdwv3U5TEmwVe70ZitGMKwsOsL2JXLhWwBT+g2cLEDf8g/SIJnRyHhBqumLnrexgMJ1572BO3ze7BRK4WX4RiU8nSPn9TKyVATp5wiJNuOn2YZ+Kk1idUAzJuwekunsQczvlI6gFOixBWOzx3kX3ybM0pBKm7In067F/LrS84quxNT3r1zby03QP47ZjqSC6O7/r3I6+yjRSMb1lXIbexhDTYur27CGbpvyfhHMKLnEcnLLMe+ReqzxIxlN6A/7Iky7GU7
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(23010399003)(366016)(1800799024)(921020)(38350700014)(6133799003)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/lJJZt0lxgs4Ud9VBs48wBPwBl9gOvRvT2p9/IOtl8Sam4k8YA0ASsiV/SaG?=
 =?us-ascii?Q?kjDmFZqGba0K9VFMJ+1BENJNPC9D6Y9Mr8oQHuDDAE5hy1vy0AilbJxyOVxU?=
 =?us-ascii?Q?xRRupZcwCGS2HDYp9q5Wvf7hEw0YOIw+TQoHBt910xndQ0DU+7/mSGbDSZOv?=
 =?us-ascii?Q?pp9x7O4pMI1a6L9c/nx0Q5d6dPv+UhbXwJ+LFJqdpi5MVvEHngwr6D9E3dJs?=
 =?us-ascii?Q?KQlCeUCQIH4iPbT4zJhjOs0ZnDMad6id42/uHD+lvX70kjQcdLdvt4Uyk+eh?=
 =?us-ascii?Q?Sh8yNLP7GocnsAr3TLnGJQ1zxc14zCbcRnSNrLkXre25kNLpcLrE4TDvsJPk?=
 =?us-ascii?Q?lMAOtpKxAd82g8j9umOyviGVVErt0+RxzvLkFCcjrtgJs1Mg6ZzaRM4WkTQ0?=
 =?us-ascii?Q?k64AR8w8K3YNBsxsqJ6ucxCc7WKS3SECU3QxSg0OUktlvz400ufAJhzG9pBo?=
 =?us-ascii?Q?kQlmmTPEjILZMcNCE5kA+QgTkj3fZvea0d7TYKGe+KM+uY/pFBLxulGl/4uu?=
 =?us-ascii?Q?hZ++rdeqPBNSRIQMhwhllUz7LNNkM3GHCu2gGOsbtKycHziel54b5tG/mk7L?=
 =?us-ascii?Q?/Hl1BRAhHceMFedkIjUjxn3y5pWDYE+8R4wT8AS1kiVN4AhXJjE3ngeInvsx?=
 =?us-ascii?Q?6tQqqbe6n/UeEa3xo1el/xxZwc+VmV7T4lRxJEoJbFjP6Z9lD1qMoiLCJaVo?=
 =?us-ascii?Q?qFNPdR2A4WydS8c1wXmXA/N3sfaEnxZdMn6oxz6yz4ebG4lewWCMSz8YTusj?=
 =?us-ascii?Q?9gq8IPiH5Dnkj7tDXL2KyQa0goGwCe21vQWQNHEHgVoFYJVLTcj6443m0ReD?=
 =?us-ascii?Q?UfEl00t7EohjiScawNgA8Dkzpo4Ddlpc7cXv5OZ3SjDSZWbq9gEEvWTivUCm?=
 =?us-ascii?Q?Md16MUHr473ya7ivI6AZEwrmv04c9Hf4jRop5kv3fu7v13KLVbfMvL0x/B/b?=
 =?us-ascii?Q?7BFqD0TIq0DqjsSJ9+Mdqlxm2Ksib0olc4rJPQQ4RFBfrkC0zuLKGtdF3ATe?=
 =?us-ascii?Q?iNJU9ZLnRID2DLwW9KPaDijmmpgNlsDlAQMOwOSo87V6yWMb0Fww8tHhv5eK?=
 =?us-ascii?Q?YfDsjuAI3epzxfzrZS5KgRYxhxg5dZQ0rttASj/m0mx5X0onHny1U9yZA3qR?=
 =?us-ascii?Q?JQwlUPxq5tP8HeuJ/yT91q2UhcwtqebUQxFvh4L+YQNKWlydouraTkzTGdxp?=
 =?us-ascii?Q?gSLXSTbl1rz/OnT4V80/1PiieTWuDtwWfmovPqYSGDUus5HbTaj0QF97ze5b?=
 =?us-ascii?Q?8MsajAz7mRgOr/gViQWlIZtFt+GL563+FBuWN6a1a34mUNotsGEh0S+XKGhr?=
 =?us-ascii?Q?xS/JNQ4rpfmir8eqPe5gMnyKHdZv5CgFRB7IM+CElq9Lv1NmvY0qGRert7Vi?=
 =?us-ascii?Q?XZvUrBxkg3JNE4sY14ihnGCu/wp5ryP9ZBNRWXSGOd/5HfyCM4IHIR2Gs/zx?=
 =?us-ascii?Q?iaOCS1mbaQQ2yi7DJVuJmEgx8IrAE57dBmhVKL0uk5xdCwz3UtdMFJowcS+3?=
 =?us-ascii?Q?itY1tdZ9uKf081nfE5O4Iup/M2x0mDUeRHoPcFU/Ao3MlRdAP7vbNdOFeBrw?=
 =?us-ascii?Q?hA2dDLNjtS3DHeQwfRT4gCKmM60sqo1DzWhs94IefTCuw0hb9x7DdZw3OI/s?=
 =?us-ascii?Q?s9dQZjyIbXMBU3E+bZUdh6uBM0V8h4RbRTNBmcKeWAO+fmpHYTMQErQ4mu2r?=
 =?us-ascii?Q?ev+ocJO3XXVzNiHpNmTavy6j1SoOJO60PqX6cPSmwoBWl1Mlp98RrBpLuSWy?=
 =?us-ascii?Q?lQa5EG2c4MF67pyo7C0y3Pzokd1PGAI=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: fa3cb38c-205f-4b89-1883-08def4070cc6
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2026 22:07:05.0899
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k+rpiF2/xHQwOLnu0F6+CRDbrMKaDfH/swT0nSvBbKmvk/kO1gb8BEbOTgyrSP0r0KJVsKOs0iwvv1U5LWtZBCze1xlidytSXUU67WvUrFw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5823

irq_type[] array inside airoha_pinctrl_gpiochip structure is not
actually necessary. Use trigger type from 'struct irq_data' instead.

Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
---
 drivers/pinctrl/airoha/pinctrl-airoha.c | 22 ++++++++--------------
 1 file changed, 8 insertions(+), 14 deletions(-)

diff --git a/drivers/pinctrl/airoha/pinctrl-airoha.c b/drivers/pinctrl/airoha/pinctrl-airoha.c
index ddd86f13e4f9d..08715a37f0afa 100644
--- a/drivers/pinctrl/airoha/pinctrl-airoha.c
+++ b/drivers/pinctrl/airoha/pinctrl-airoha.c
@@ -383,8 +383,6 @@ struct airoha_pinctrl_gpiochip {
 	const u32 *status;
 	const u32 *level;
 	const u32 *edge;
-
-	u32 irq_type[AIROHA_NUM_PINS];
 };
 
 struct airoha_pinctrl_confs_info {
@@ -2592,11 +2590,11 @@ static void airoha_irq_unmask(struct irq_data *data)
 	u32 mask = GENMASK(2 * offset + 1, 2 * offset);
 	u32 val = BIT(2 * offset);
 
-	if (WARN_ON_ONCE(data->hwirq >= ARRAY_SIZE(gpiochip->irq_type)))
+	if (WARN_ON_ONCE(data->hwirq >= AIROHA_NUM_PINS))
 		return;
 
 	gpiochip_enable_irq(gc, irqd_to_hwirq(data));
-	switch (gpiochip->irq_type[data->hwirq]) {
+	switch (irqd_get_trigger_type(data)) {
 	case IRQ_TYPE_LEVEL_LOW:
 		val = val << 1;
 		fallthrough;
@@ -2628,7 +2626,7 @@ static void airoha_irq_mask(struct irq_data *data)
 	u8 index = data->hwirq / AIROHA_REG_GPIOCTRL_NUM_PIN;
 	u32 mask = GENMASK(2 * offset + 1, 2 * offset);
 
-	if (data->hwirq >= ARRAY_SIZE(gpiochip->irq_type))
+	if (data->hwirq >= AIROHA_NUM_PINS)
 		return;
 
 	regmap_clear_bits(pinctrl->regmap, gpiochip->level[index], mask);
@@ -2644,7 +2642,7 @@ static void airoha_irq_ack(struct irq_data *data)
 	u8 offset = data->hwirq % AIROHA_PIN_BANK_SIZE;
 	u8 index = data->hwirq / AIROHA_PIN_BANK_SIZE;
 
-	if (data->hwirq >= ARRAY_SIZE(gpiochip->irq_type))
+	if (data->hwirq >= AIROHA_NUM_PINS)
 		return;
 
 	regmap_write(pinctrl->regmap, gpiochip->status[index], BIT(offset));
@@ -2652,28 +2650,24 @@ static void airoha_irq_ack(struct irq_data *data)
 
 static int airoha_irq_type(struct irq_data *data, unsigned int type)
 {
-	struct gpio_chip *gc = irq_data_get_irq_chip_data(data);
-	struct airoha_pinctrl *pinctrl = gpiochip_get_data(gc);
-	struct airoha_pinctrl_gpiochip *gpiochip = &pinctrl->gpiochip;
-
-	if (data->hwirq >= ARRAY_SIZE(gpiochip->irq_type))
+	if (data->hwirq >= AIROHA_NUM_PINS)
 		return -EINVAL;
 
 	if (type == IRQ_TYPE_NONE) {
-		gpiochip->irq_type[data->hwirq] = IRQ_TYPE_NONE;
+		irqd_set_trigger_type(data, type);
 		irq_set_handler_locked(data, handle_bad_irq);
 
 		return 0;
 	}
 
 	if (type == IRQ_TYPE_PROBE) {
-		if (gpiochip->irq_type[data->hwirq])
+		if (irqd_get_trigger_type(data))
 			return 0;
 
 		type = IRQ_TYPE_EDGE_BOTH;
 	}
 
-	gpiochip->irq_type[data->hwirq] = type & IRQ_TYPE_SENSE_MASK;
+	irqd_set_trigger_type(data, type);
 	if (type & IRQ_TYPE_EDGE_BOTH)
 		irq_set_handler_locked(data, handle_edge_irq);
 	else
-- 
2.53.0

