Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11023076.outbound.protection.outlook.com [52.101.72.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F219431A31;
	Thu,  6 Aug 2026 22:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786054037; cv=fail; b=KzHhRXDfuSn8rH6f4XHkASw/c4vDptAuzzhaQ15pkVfe27aXas5qfPCbOJIqCALiOyOJT8qQo8WPAWRRpCzIZZHBDg8KxNKuL8YuJ8+YNKmVwbvhfueHD8iYL+v9u9Amb+6evv1KK+yPp5/ru4VckkTM8fsjCwxCJOqGDnAVEHY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786054037; c=relaxed/simple;
	bh=1fXvwl+zIUfT8ob6DiWPSrnliQlwIoSbcWpGhp7/TcM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Tedd3lSChEbGhui9JEqzGdwRuQ+HxQWV8H+EpA7LfHRCHH0KXiTHD+aYLCFI5ETdysJoQQ6hqlv9+sTJHC/XBUCeFDfRAtvuPcslUhtXfOmxnyCU0kxYlo4Rfp2Pab57k8H44/uEhAT/GSt7OqQ4Go4zEv9Y9GdwPF9XNLkyl6w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b=lDaJcZgb; arc=fail smtp.client-ip=52.101.72.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=genexis.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b="lDaJcZgb"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YFxm+djWPBRxzeoI3ba1iGNmYdctrjMQ+kFYPO2+uV6/6WIN3EaG4AiB4gZ62Zx9JD1sGqjBrdfTqWKO9hYts6F9QfD/XN5//XZKdQTAsMJNRWDJfOsYx5fFuTe81aq4CNLOoN/vxJ/60qbVXSWSbPjMzbHTCfLso6a9Ft7Hd+a4/0tfHAYiPI68QwKq/HdhYype5exdSoHGpywQFtexAVD4PbQ29fywCDVOmTYBdpddKWi4jlJKHHRgo/aAwR23MU7zZ07jx3bsuTyPyKXTHB4SO/ZzPgYTUcwGQhYWKQoRlvs/hR1nr7URho9QPvreCtmqxbO2vivCTkKJZ+iYeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x96+8V+Q2xksE07KImWBg62a2bDDqZeYwIHugITR8/s=;
 b=TdBx9UOQr21OvAtnw3uwyEqNBDn1UTYgYfqdnK4Iq4bkEZWSUoxuPTfBUe4jmcCFNFU+VdZ+dXp5PX/I3jAXQsniIhjThvsktc1DLFE4p5nmk8SSD/P83/5kMZdMrmI3rPq+u3a49oR77hEllfjH0oMeMdPrpo9IHWjlfsdQ7Wi94OvpaTqRKSGp8fOmrCE/4tnrZPAlRNB52u+UIaDbz46wt8EzNaYY2ICyEq1qG9/KQ7eA2yfNKPGzWhtssefETnOVMCtgGy8/SBEBNFW3drDQF8wGgAMI/zFXnJTN7NWk5mbJaYCKf9PLBIqZ03vv88s6P1QOB4g5hxCtgQFnyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x96+8V+Q2xksE07KImWBg62a2bDDqZeYwIHugITR8/s=;
 b=lDaJcZgbaBggGPxKvama0jDFNddt7I+XajXBoqjFy8PgJGUwTT1cERCJ7Lx0gMKa5aBriBz8TjHLnj9DhKdVIvq559m+rGgzqcxT2J+xfwL0wC3JDm+Lnr6j8Ja+TDltw+oVYybahAugu5vzxZzdC+MBQh4dk6l6wuy/p5aikOh6eT0HRClf1q9+vqu5ikwmtuXyhxB9oR3GKSKCElPxzt3khzLHrju9EGY16Ws0cTm2cm1gFC9nC4APWWItQ5C72hi2loLgkj5D/26qpSNyJDUC3ObXWpCoEeXwR60h4c4pwF4zkF9uAwe7UP5x7oWn/LQqvo+Ujcf7c9Kc5i+iow==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by VE1PR08MB5823.eurprd08.prod.outlook.com (2603:10a6:800:1a5::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.23; Thu, 6 Aug
 2026 22:07:07 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0292.013; Thu, 6 Aug 2026
 22:07:06 +0000
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
Subject: [PATCH v11 23/37] pinctrl: airoha: statically allocate gpio regs structure
Date: Fri,  7 Aug 2026 01:06:01 +0300
Message-ID: <20260806220615.4078303-24-mikhail.kshevetskiy@iopsys.eu>
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
X-MS-Office365-Filtering-Correlation-Id: 7ea3cb6b-d17f-40ac-7500-08def4070ddb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|23010399003|366016|1800799024|921020|38350700014|10067099003|56012099006|11063799006|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	cFX7OPIqiLts4borkw+OngjGzu0RWgU9qShfG/5YUW43O8qRrPAISDprPnDKRMlRrUX9ZMJTZZSBBusDGM95z27pbh7errV42SUmRSMtMPTEVrwF0LM/dmMglYCpKZSU87E2jdt6IzQHeHaaFVWt3LNWGTf+2i10higoYU6aB5RevglWvMT75O67u477gwVl2u7FKidXhp+yelHM5AkIzew5kS3B7pN3/wKBNWpWGV0JEQ8FXlXhOo7RdZoMEGsfkhiHJrrOV23KND8SeaNPy8GZV7T86+8FxHn3YAi+sgRoKjxjzd9D7WEsEvlJU28DN+YOLutx3ZMeW6jiP8uEYfTPqLIVJLJ03IOmIc4ai9+D3I10ggb/CxqUMlH4m4NnV4g1ZZUV4UbHK9D+uId/IBwSjiLkV1IlLm05H41tbM8liLc2yTaVfPhh+28c7RgCAn+MgoGrEPFJClPPKtVv2md4SZ6BDzK1vLzKOwO3nOEt2YYpkH5CD1SHVkYl9NOMh0aYqP1PZmcMVP3BpLseD90VlYbaKFPtsfkoQl1BghmtVMZ20D8Da3NdhJz2+2ei67l8IlRYL3yo8nD+NdwRJyD8y5Mx5WfN6bM9vCQxkodMIsBbevgnioksxUY1hF5bazL3N4pZHFRalleBGyx7/a/pn/aelHziatHSvT+0+80gQXMNLXAmmBGgSkGLItSeZf4wdpiSjD2FDH24339rL9GaHODOnucvq9Jw2HoprX4SwrPBn8xASnof237+eRcW
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(23010399003)(366016)(1800799024)(921020)(38350700014)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?oyD0mqCHeTnCEpxMKDATeMdHgF+uAakVr733kmUWk4dhRIGGGIPlG3jG54PX?=
 =?us-ascii?Q?J/+Ru3tQ7nbav7nUU586KsBr02w7+kNE/yBdZeDc44PF3sody/row0NG2x8E?=
 =?us-ascii?Q?PM7+kYsL4/EkN0Ljs3Wl6zPIWorPJyzDDSKFN1YjTw1ozyYLHPHqpxF3Ta3B?=
 =?us-ascii?Q?aU3f4UF13EvTooVoyM3tDtSheaUtg181RBgupniWCc7QSeLHSVx4+DfTjykz?=
 =?us-ascii?Q?M7zJ9GSvi3LMAOo9Cm/+GJLdQw72j6Sh4LcIDXS61GRsmAvcBXf2Fpo5y+WO?=
 =?us-ascii?Q?VNi9WG6610qlxwN0i502Tj+6qDpXsD5Th+wizP6SrJwlA/tGM0Z84QOg/2Es?=
 =?us-ascii?Q?8U17/cZ6dCh3atQVQRzT2aTwJK920LOKcnhdKeYfTtlYSsGxEmMGftcsS8xO?=
 =?us-ascii?Q?2B9cTAGiqL5QXcT5z5FauvWqR52ZWASMlOz30HR2WRGrt7AY2XTufl6eTS7F?=
 =?us-ascii?Q?SpXiPuoWnn44fk/7gMyWCJEvtyoxxXW95NUquuno3jvDu21qB1lvGqf5ZDT0?=
 =?us-ascii?Q?RcgRRLP5GILpv++2ZGU2INiTHzH8wE2feTe3drJVi+jDsL5TvbQ0hsPazxdB?=
 =?us-ascii?Q?jJ9r4bxrH+5mFkUkkK/WVB45oACjhMH3GCdjCAQDhnUcXeLTeKz30gHl0Oxo?=
 =?us-ascii?Q?CSqprVbexjDXMDtEsJmaN5WRy6fOQzGcc3bFLvdCnr9dZ68uLLrMH1CvhHx7?=
 =?us-ascii?Q?kiBHAl9JSZ0iOgwr3DKpidQNLzldJ6Lueq8/TJO19FGD6qKY2tHggqdSvbRL?=
 =?us-ascii?Q?NJ2SDrMiBYCKrucwngOA3eMGLMDgMv/jB/bz+WgK6wIomXy4+y1WyuOo2rad?=
 =?us-ascii?Q?qPKqLqWfZWrg0VoYLMIOEyII+FpsXa4HZLEol0xHyAJg/+pzmEnuHe7OzQ0B?=
 =?us-ascii?Q?tJkMi7spmJ2QX/cix+Iflw28OY5rTZz76lMNmfEwrtawRdh0tPYeAeWV0RjO?=
 =?us-ascii?Q?JVo0j1Ed5AnSul3VSzlvLQd5Cy1agYHeqFSKi6mHq8mxGUmBdf4erionWVVh?=
 =?us-ascii?Q?IdAUV9XpiBiJBGzpmHIXSJgLdvnhpZwEmg1ydwCeblUL0vQYudyij8afATTZ?=
 =?us-ascii?Q?XnzWCY813T44bSuSBbAFdVcM97qhaJrNr5UTf93724330MxmADsjyom1pzyb?=
 =?us-ascii?Q?20NGeRAR03hPdl8EjcGJ0yfcL4snm2U89NyKxLJuFo5SFX7bTFSSD6FlQ9Ze?=
 =?us-ascii?Q?iEoXOyi1iWjl4VtEwlTmorFPf7ueYVk0/uPQR9AeOG21lJdjf0cKMOFajDBQ?=
 =?us-ascii?Q?Hivpf2nRnn7weJRNz9pDJfLgemvj4sndvZyHeuNTtVF2DDhf5kHdZjlKBuGq?=
 =?us-ascii?Q?Ai0dEua5ixViunEUWsYnYNkLcrgy8N2mio/ZAgj/X5zzIODb1uKl55n14L83?=
 =?us-ascii?Q?x+VYW7ZAUGRH8KARE/UMyDbzylRS/BJvU8phhA2Y7EW9ky9kcRj/d8m+PMBk?=
 =?us-ascii?Q?fjCxGL+jw280bowP0cJDZbniFCQ9yVq/Bu8yvXI5hRnZaOf+pHKHXbZPfkeW?=
 =?us-ascii?Q?tti3xM8jgry7uo/Syxi2jbVWlsGjptk5i94nw3WNEjeFNTl3/GtiLachLGS/?=
 =?us-ascii?Q?C2W/Xd1X1CHxxj7NRkIcV8tgjj3QCO7Tm1T1ychPEQhUFl0KVWjhQ301i/ay?=
 =?us-ascii?Q?Fkk7GsG1FmYWJT7VjdUzoJkjdvYA3/AvKnKc+O4NBnRheDiavoYFfzoraAYC?=
 =?us-ascii?Q?byDj70d7lsZNzucvkyfm7BKGaW7b4vBr3dQkgfuPITyC64hwYHHN3wqmvs3T?=
 =?us-ascii?Q?PhYD6diX8VEYrqJTx8gzuwkIQ0tic7M=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ea3cb6b-d17f-40ac-7500-08def4070ddb
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2026 22:07:06.9058
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PZ69CI9jpDhACfs+6Dn9OJEkccyDK/qsArG1cXXYRajjqKTl3iTQ7rD15T4BK6v29O2KQiJ1tUSGGHqlxyLaH2g24xqLOQrE88R5FFBzJrg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5823

just a small refactoring to collect all gpio register information
in the one statically allocated structure.

Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
---
 drivers/pinctrl/airoha/pinctrl-airoha.c | 92 ++++++++++++-------------
 1 file changed, 46 insertions(+), 46 deletions(-)

diff --git a/drivers/pinctrl/airoha/pinctrl-airoha.c b/drivers/pinctrl/airoha/pinctrl-airoha.c
index 08715a37f0afa..641b547a3276a 100644
--- a/drivers/pinctrl/airoha/pinctrl-airoha.c
+++ b/drivers/pinctrl/airoha/pinctrl-airoha.c
@@ -303,6 +303,17 @@
 #define AIROHA_PIN_BANK_SIZE			(AIROHA_NUM_PINS / 2)
 #define AIROHA_REG_GPIOCTRL_NUM_PIN		(AIROHA_NUM_PINS / 4)
 
+struct airoha_gpiochip_regs {
+	/* gpio */
+	const u32 *data;
+	const u32 *dir;
+	const u32 *out;
+	/* irq */
+	const u32 *status;
+	const u32 *level;
+	const u32 *edge;
+};
+
 static const u32 gpio_data_regs[] = {
 	REG_GPIO_DATA,
 	REG_GPIO_DATA1
@@ -339,6 +350,15 @@ static const u32 irq_edge_regs[] = {
 	REG_GPIO_INT_EDGE3
 };
 
+static struct airoha_gpiochip_regs airoha_gpiochip_regs = {
+	.data = gpio_data_regs,
+	.dir = gpio_dir_regs,
+	.out = gpio_out_regs,
+	.status = irq_status_regs,
+	.level = irq_level_regs,
+	.edge = irq_edge_regs,
+};
+
 struct airoha_pinctrl_reg {
 	u32 offset;
 	u32 mask;
@@ -372,19 +392,6 @@ struct airoha_pinctrl_conf {
 	struct airoha_pinctrl_reg reg;
 };
 
-struct airoha_pinctrl_gpiochip {
-	struct gpio_chip chip;
-
-	/* gpio */
-	const u32 *data;
-	const u32 *dir;
-	const u32 *out;
-	/* irq */
-	const u32 *status;
-	const u32 *level;
-	const u32 *edge;
-};
-
 struct airoha_pinctrl_confs_info {
 	const struct airoha_pinctrl_conf *confs;
 	unsigned int num_confs;
@@ -411,7 +418,8 @@ struct airoha_pinctrl {
 	struct regmap *chip_scu;
 	struct regmap *regmap;
 
-	struct airoha_pinctrl_gpiochip gpiochip;
+	struct gpio_chip gpiochip;
+	struct airoha_gpiochip_regs *gpio_regs;
 };
 
 struct airoha_pinctrl_match_data {
@@ -2504,7 +2512,7 @@ static int airoha_gpio_set(struct gpio_chip *chip, unsigned int gpio,
 	u8 index = gpio / AIROHA_PIN_BANK_SIZE;
 
 	return regmap_update_bits(pinctrl->regmap,
-				  pinctrl->gpiochip.data[index],
+				  pinctrl->gpio_regs->data[index],
 				  BIT(offset), value ? BIT(offset) : 0);
 }
 
@@ -2516,7 +2524,7 @@ static int airoha_gpio_get(struct gpio_chip *chip, unsigned int gpio)
 	int err;
 
 	err = regmap_read(pinctrl->regmap,
-			  pinctrl->gpiochip.data[index], &val);
+			  pinctrl->gpio_regs->data[index], &val);
 
 	return err ? err : !!(val & BIT(pin));
 }
@@ -2529,7 +2537,8 @@ static int airoha_gpio_get_direction(struct gpio_chip *chip, unsigned int gpio)
 	int err;
 
 	index = gpio / AIROHA_REG_GPIOCTRL_NUM_PIN;
-	err = regmap_read(pinctrl->regmap, pinctrl->gpiochip.dir[index], &val);
+	err = regmap_read(pinctrl->regmap,
+			  pinctrl->gpio_regs->dir[index], &val);
 	if (err)
 		return err;
 
@@ -2547,7 +2556,8 @@ static int airoha_gpio_set_direction(struct gpio_chip *chip, unsigned int gpio,
 	/* set output enable */
 	mask = BIT(gpio % AIROHA_PIN_BANK_SIZE);
 	index = gpio / AIROHA_PIN_BANK_SIZE;
-	err = regmap_update_bits(pinctrl->regmap, pinctrl->gpiochip.out[index],
+	err = regmap_update_bits(pinctrl->regmap,
+				 pinctrl->gpio_regs->out[index],
 				 mask, !input ? mask : 0);
 	if (err)
 		return err;
@@ -2557,7 +2567,7 @@ static int airoha_gpio_set_direction(struct gpio_chip *chip, unsigned int gpio,
 	index = gpio / AIROHA_REG_GPIOCTRL_NUM_PIN;
 
 	return regmap_update_bits(pinctrl->regmap,
-				  pinctrl->gpiochip.dir[index], mask,
+				  pinctrl->gpio_regs->dir[index], mask,
 				  !input ? mask : 0);
 }
 
@@ -2584,7 +2594,7 @@ static void airoha_irq_unmask(struct irq_data *data)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(data);
 	struct airoha_pinctrl *pinctrl = gpiochip_get_data(gc);
-	struct airoha_pinctrl_gpiochip *gpiochip = &pinctrl->gpiochip;
+	struct airoha_gpiochip_regs *gpio_regs = pinctrl->gpio_regs;
 	u8 offset = data->hwirq % AIROHA_REG_GPIOCTRL_NUM_PIN;
 	u8 index = data->hwirq / AIROHA_REG_GPIOCTRL_NUM_PIN;
 	u32 mask = GENMASK(2 * offset + 1, 2 * offset);
@@ -2599,18 +2609,18 @@ static void airoha_irq_unmask(struct irq_data *data)
 		val = val << 1;
 		fallthrough;
 	case IRQ_TYPE_LEVEL_HIGH:
-		regmap_update_bits(pinctrl->regmap, gpiochip->level[index],
+		regmap_update_bits(pinctrl->regmap, gpio_regs->level[index],
 				   mask, val);
 		break;
 	case IRQ_TYPE_EDGE_FALLING:
 		val = val << 1;
 		fallthrough;
 	case IRQ_TYPE_EDGE_RISING:
-		regmap_update_bits(pinctrl->regmap, gpiochip->edge[index],
+		regmap_update_bits(pinctrl->regmap, gpio_regs->edge[index],
 				   mask, val);
 		break;
 	case IRQ_TYPE_EDGE_BOTH:
-		regmap_set_bits(pinctrl->regmap, gpiochip->edge[index], mask);
+		regmap_set_bits(pinctrl->regmap, gpio_regs->edge[index], mask);
 		break;
 	default:
 		break;
@@ -2621,7 +2631,7 @@ static void airoha_irq_mask(struct irq_data *data)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(data);
 	struct airoha_pinctrl *pinctrl = gpiochip_get_data(gc);
-	struct airoha_pinctrl_gpiochip *gpiochip = &pinctrl->gpiochip;
+	struct airoha_gpiochip_regs *gpio_regs = pinctrl->gpio_regs;
 	u8 offset = data->hwirq % AIROHA_REG_GPIOCTRL_NUM_PIN;
 	u8 index = data->hwirq / AIROHA_REG_GPIOCTRL_NUM_PIN;
 	u32 mask = GENMASK(2 * offset + 1, 2 * offset);
@@ -2629,8 +2639,8 @@ static void airoha_irq_mask(struct irq_data *data)
 	if (data->hwirq >= AIROHA_NUM_PINS)
 		return;
 
-	regmap_clear_bits(pinctrl->regmap, gpiochip->level[index], mask);
-	regmap_clear_bits(pinctrl->regmap, gpiochip->edge[index], mask);
+	regmap_clear_bits(pinctrl->regmap, gpio_regs->level[index], mask);
+	regmap_clear_bits(pinctrl->regmap, gpio_regs->edge[index], mask);
 	gpiochip_disable_irq(gc, irqd_to_hwirq(data));
 }
 
@@ -2638,14 +2648,14 @@ static void airoha_irq_ack(struct irq_data *data)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(data);
 	struct airoha_pinctrl *pinctrl = gpiochip_get_data(gc);
-	struct airoha_pinctrl_gpiochip *gpiochip = &pinctrl->gpiochip;
+	struct airoha_gpiochip_regs *gpio_regs = pinctrl->gpio_regs;
 	u8 offset = data->hwirq % AIROHA_PIN_BANK_SIZE;
 	u8 index = data->hwirq / AIROHA_PIN_BANK_SIZE;
 
 	if (data->hwirq >= AIROHA_NUM_PINS)
 		return;
 
-	regmap_write(pinctrl->regmap, gpiochip->status[index], BIT(offset));
+	regmap_write(pinctrl->regmap, gpio_regs->status[index], BIT(offset));
 }
 
 static int airoha_irq_type(struct irq_data *data, unsigned int type)
@@ -2683,12 +2693,12 @@ static irqreturn_t airoha_irq_handler(int irq, void *data)
 	int i;
 
 	for (i = 0; i < ARRAY_SIZE(irq_status_regs); i++) {
-		struct gpio_irq_chip *girq = &pinctrl->gpiochip.chip.irq;
+		struct gpio_irq_chip *girq = &pinctrl->gpiochip.irq;
 		u32 regmap;
 		unsigned long status;
 		int irq;
 
-		if (regmap_read(pinctrl->regmap, pinctrl->gpiochip.status[i],
+		if (regmap_read(pinctrl->regmap, pinctrl->gpio_regs->status[i],
 				&regmap))
 			continue;
 
@@ -2698,7 +2708,7 @@ static irqreturn_t airoha_irq_handler(int irq, void *data)
 
 			generic_handle_domain_irq(girq->domain, offset);
 			regmap_write(pinctrl->regmap,
-				     pinctrl->gpiochip.status[i], BIT(irq));
+				     pinctrl->gpio_regs->status[i], BIT(irq));
 		}
 		handled |= !!status;
 	}
@@ -2719,8 +2729,7 @@ static const struct irq_chip airoha_gpio_irq_chip = {
 static int airoha_pinctrl_add_gpiochip(struct airoha_pinctrl *pinctrl,
 					struct platform_device *pdev)
 {
-	struct airoha_pinctrl_gpiochip *chip = &pinctrl->gpiochip;
-	struct gpio_chip *gc = &chip->chip;
+	struct gpio_chip *gc = &pinctrl->gpiochip;
 	struct gpio_irq_chip *girq = &gc->irq;
 	struct device *dev = &pdev->dev;
 	int irq, err;
@@ -2818,7 +2827,7 @@ static int airoha_pinmux_set_direction(struct pinctrl_dev *pctrl_dev,
 	if (pin < 0)
 		return pin;
 
-	return airoha_gpio_set_direction(&pinctrl->gpiochip.chip, pin, input);
+	return airoha_gpio_set_direction(&pinctrl->gpiochip, pin, input);
 }
 
 static const struct pinmux_ops airoha_pmxops = {
@@ -2931,7 +2940,7 @@ static int airoha_pinconf_get_direction(struct pinctrl_dev *pctrl_dev, u32 p)
 	if (pin < 0)
 		return pin;
 
-	ret = airoha_gpio_get_direction(&pinctrl->gpiochip.chip, pin);
+	ret = airoha_gpio_get_direction(&pinctrl->gpiochip, pin);
 	if (ret < 0)
 		return ret;
 
@@ -3009,7 +3018,7 @@ static int airoha_pinconf_set_pin_value(struct pinctrl_dev *pctrl_dev,
 	if (pin < 0)
 		return pin;
 
-	return airoha_gpio_set(&pinctrl->gpiochip.chip, pin, value);
+	return airoha_gpio_set(&pinctrl->gpiochip, pin, value);
 }
 
 static int airoha_pinconf_set(struct pinctrl_dev *pctrl_dev,
@@ -3212,16 +3221,7 @@ static int airoha_pinctrl_probe(struct platform_device *pdev)
 	pinctrl->desc.pins = data->pins;
 	pinctrl->desc.npins = data->num_pins;
 
-	/*
-	 * some pinctrl operations (ex: get_direction) might use gpio registers
-	 * before gpio chip abstraction will be completely initialized.
-	 */
-	pinctrl->gpiochip.data = gpio_data_regs;
-	pinctrl->gpiochip.dir = gpio_dir_regs;
-	pinctrl->gpiochip.out = gpio_out_regs;
-	pinctrl->gpiochip.status = irq_status_regs;
-	pinctrl->gpiochip.level = irq_level_regs;
-	pinctrl->gpiochip.edge = irq_edge_regs;
+	pinctrl->gpio_regs = &airoha_gpiochip_regs;
 
 	err = devm_pinctrl_register_and_init(dev, &pinctrl->desc,
 					     pinctrl, &pinctrl->ctrl);
-- 
2.53.0

