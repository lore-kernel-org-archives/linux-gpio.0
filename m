Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11021084.outbound.protection.outlook.com [52.101.70.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2FF0477985;
	Tue,  4 Aug 2026 16:04:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.84
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785859501; cv=fail; b=e+4wtM9N3p6vH4FFkW7abhVeFK92nQ5q+EcA31jrE0iQTtPxoN9vGFB/z06Qs/V1Yn16sRnvoE3UXy4nlbafKyCeHGqW29SZ55S/odMoOBFfKTydlW336NJNtTsk+USDOMl10U0/YI/kbwam+5w70JDaGj4abWj5H76HXenn7ro=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785859501; c=relaxed/simple;
	bh=0m/lSYpYOItkSScDG5P2vHpFBtGR1dFrrccCyc9JVLQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=gfvhpU6jDCLdz92jcTUtFNQdBrJcEQCcvzv23TaXvou34vBqZtI6JdJ/NywHLE9JCAkp3b1lSqZWvKiQeMnsOrMUhI1VLGdeXYVbk9ni9boicog5/uWpDhKlVcV+r1QR2kYdF4eTLj6nF1rCQ7vOLyhvoljn4wgBrLkwBHCM0pU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b=6ENLqXjr; arc=fail smtp.client-ip=52.101.70.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=genexis.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b="6ENLqXjr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RLbwt4WPtPLtMd2Kk0pdyvaMWvmG2WOyrzCbW7cGmLAwaACd6FZktMbgkIz1+yHOf4qIAEQXxm5QIxrWoym8UvpyEjJdESRmxrhWMEfOFJUzOMos9N6kIuNkvc3DW/YjKaeeDKDuwseQSPpW94cKTOVEx59LXU0upA+sdlbvBmIaT4ehuZ4SU/tdeYD3hD1g2vtnm5gkv3E9X7YK1EKLmR4Qq4JB/V/0R+bcD2mlCFIANCJfTakytMZ62iwWg3guLQBJOT7cDrhT/amZoihM6hb/3vrs97O8bw4/7LzrK+RLOxEIZi6ojl2iRwEgwvy/JQzhsHGW4iXC3rcaYDi0ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wOMW1tHK7PUILb0FrJOd8BLv6CBGqBf/8FSOrZEtESI=;
 b=LLw15cXAKp+AhrC/LSBVACXBmJAZ3tggQg32tmtUhp2og9/rhFTTTPLoNomMWDDKXHQOMwZ37uWr4h7oV7hjWCiUKB+EC4XzubBcM8Uo2kdxnqvSPhxiv907HzzyLjJx06/yVBEN324854lfd6Xv8JqZMdYSp+lR8VLqjS7XbNJ+3fe0ccVZVnUbTp2m+voIDgNUL6KGW6sJMAEe0fXBq7S5pJyVk5464XDCyHgz/a9PSNnJXHOOYSPwiindxJBHXP9KFBH6dguVQnfLvuj37Kichf7M3npj5eezuHSVdA5TFWd6U6S5x4gDxMIb9cjDneL2PuQF2qklhYFQHQd7Jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wOMW1tHK7PUILb0FrJOd8BLv6CBGqBf/8FSOrZEtESI=;
 b=6ENLqXjr66fY1YMfs40VmXUUZVJPYdEgbgQc/9PgFeo097MBrkVB2/n8txtwOQGSVv2iOKuym4NkyTVeS9AA3fh9hjuMKM2NaHQuQEkaBIFpC0CfPFNm8N3GZ3MVnBP4QbKPvJyIZPN65ZA3hB9GVAWAze2V/ikqaLOwZvmCunPh4M1xL+7HO+8U44Qb/MWhZrFFtjC/nxNttESRh7VnGxyzLrJ6P80RzBLf6S14zWeJonfP7vFWxXjGLmp3tbql/H/reXwp2Tv48u4zzO0wF6nkcfuEMfn3YC8+ZZjxNs3xQbT46NIGBtsOFRQ4Bcv4OcFHo46DFa8hh7c6VeHFwA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by AM8PR08MB5761.eurprd08.prod.outlook.com (2603:10a6:20b:1d0::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Tue, 4 Aug
 2026 16:04:54 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0292.013; Tue, 4 Aug 2026
 16:04:54 +0000
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
Subject: [PATCH v9 14/36] pinctrl: airoha: add missed get_direction() function for gpio_chip
Date: Tue,  4 Aug 2026 19:03:57 +0300
Message-ID: <20260804160419.3592327-15-mikhail.kshevetskiy@iopsys.eu>
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
X-MS-Office365-Filtering-Correlation-Id: e8a21fbe-201b-49ed-904e-08def2421f9c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|7416014|23010399003|921020|38350700014|22082099003|18002099003|3023799007|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	FoYg7lnanzNsqb1XLG4XqeuTO2Y2Z25ihTgpeNpEA6MGTDwuvI6EmlYxgyRcbrrwJK7thhMjpp/y5tq6E+f0wbKH2YQv7PLRIo/h61pdPVBGHmJ27QvrA3SFXShBoWux+Q3NM+yRKeJS6/0SSO2iCc/Yvqx06xTh5svNR4jarDuPbyX5VGONmjA16VC5fR1ye48Y81YSGdkMOZEZphsP8TWuL0kbakgplARPhMc2Kr0cMRASTHgV6J6faKjr31lvk5EMHhq/s/Fxs7YsfzNptxJUR83aN489Z/3SQGapizv/fA03Pw6wdlCtWCb0WXMoUTIbyKbKobKJ+EpccsVwEbGlzuyyDfedN6g674G+OmeTk71o+xdUmpZH/xrU2Ra53r1N6f2CgduZx4eurn7l/j1/hbvfpDm3Xkt05bwfwH22E0iGv4xCaeRrR5gTIVpt8Amty5U7ZgdCoG6jgWqGnoU/hJV70rBiUvfUCZOqupWUCHduXbTs8GhqL5vY0C0wyoCpa+OoKo40zG4V3KHZRSsc3VW2D3qJs3nuRrEaxcbIKcy9CDq5KzsjT6agB11quAT3/P/OQsmOqDtER8uxOkHih3EzwQV352RgHyM0ekflTonnbkVba3o9N2dcnBlvyfngCo5maeJX/rVo9LOyQs2AMsBT5wdK31w0ARWapk1pIDAmX4fvLqGsPZb+TgpxzCB4+5etqN6g9ssMvgE3r4nOCwpYLnGUJvTD4LgHnIszACz0c+rtTtpgNAw/Qjrc
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(7416014)(23010399003)(921020)(38350700014)(22082099003)(18002099003)(3023799007)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?hvi1LA+L6Mq29vYoYv4bh2TSEeZTqqRhREJ+IdLzEF9IS6U5PRUWvYJ1dItR?=
 =?us-ascii?Q?W7PRBCIzrYOidU4dZ/Td8ZBw1dlbdN/bGkZZ8wgVVZAmfpvXudxF4k3mDVAo?=
 =?us-ascii?Q?mCFbVWOUZUQOAzZM+9qDpoW57HUS7CEq86qszs+ibVEjlAorIgyDWFTMwlkO?=
 =?us-ascii?Q?VDF12B+/CDyWR/MXLK1RzjrPacJsI/81BMH6YUGJwIlrqlePqj1KTRwwYYws?=
 =?us-ascii?Q?ZvhHl6WYM4mOxGHaouZ0UDlHMmYuOfd1puJES/nVCmrFpVePbYVTQ2CtPHMp?=
 =?us-ascii?Q?21R9QBPOo1f6pqGsJcc/NPSfe1ZjKSEcjrwDpqZqaXCbMlyT7lNc5K/uYPk4?=
 =?us-ascii?Q?cqz5sw1PGENodgHqfpav/Ivg11ccYMeVHkCjL6yUWYXZxCVcaOiRBb3fyAmI?=
 =?us-ascii?Q?M4MGNHuhzbPkNo+wJC7JXqhLuw0Xvd/jhFn93+Z/F2Rr9AJ4hs93ynxrhxFl?=
 =?us-ascii?Q?GCoFgDPvTMwLj23AefJVaigEgejErM8je4C9JkRwqvvR5U2wdMMoyN5n7cQq?=
 =?us-ascii?Q?CSp/aj7554srvvrBCq6CbkWerNBCSf5+aYtQsI1sy2CacMHVoADGdpWgToDq?=
 =?us-ascii?Q?dbBQazbpyTg0jnJad02169rGOiUKkNkG5yPZGGao7iZsc3XhF4Fg4GaQd71v?=
 =?us-ascii?Q?hRAPvVvoT8VZebOCW9Xn5hh8BipoKNjuMTijg+8yhR4aO4R5p96Mql0NcduM?=
 =?us-ascii?Q?mup0yMuNzOCtZCHBTDC0jzF9A/WE5JIqhSV4DjJucT6h68ZrWj3TqUPKgEeh?=
 =?us-ascii?Q?ZQL7ZWX+82cQ1JzZ2Nt31UFGmwRMRjxriJjiFj5zjRphj5HK9MnfdLPHtjbF?=
 =?us-ascii?Q?8dEwnPjXq+fAJWxvCW7vvYHLOtYTBJXCC0EfyDgeGbotTaiABbbjTP8YJf6j?=
 =?us-ascii?Q?FCPlQm6otAhtYiUEtxOzkng8SXtmab26Tjq8at7dO/0MkCIkQVyFHiy4TLhZ?=
 =?us-ascii?Q?EzlTYLc95VoNBFLLPTErg5STzfAhoFq1t8nREJClTiCAU5dh/8/9I5JyPtOJ?=
 =?us-ascii?Q?OGXHfS+xoRn47On1/SWbRWxoDF1izmalz7j5WcVk6cQpE0Bzp/VtFirjz67L?=
 =?us-ascii?Q?EE1/COrSUpgjd5RunYKBgAO1x1pHT/HK3j0h5xlKIp3Ob0gfFVGg/Wpbe43o?=
 =?us-ascii?Q?HFmPqST+OkXElzcL2nbu78HWvt0C6byu2MfOfbJG1esIAgwBba7NNvSekJh3?=
 =?us-ascii?Q?88ZZQ2y9LJF/GGMK/oBCN/bP3KkMrzDPYclDmgV9goG5Q6WMjaJMsfjohpgG?=
 =?us-ascii?Q?XtZdejso6RRCgUO6FnGqKv7aXMVWfvyLpOdslMH7mp0tMj1eoKWCY/ZRj1Yy?=
 =?us-ascii?Q?Oz7ly6JdbDYRAEJTsVKVzUp8EKv6Ha1n/ZAupIf1YN5F54ae6De8ZW1335PC?=
 =?us-ascii?Q?/C9k2rr+bleBoNzJ7cpf4Bf30AaPA8uL11IpTOFsx4lJ4V0RIc4NMUITWCun?=
 =?us-ascii?Q?QGW8uMgpKcr28BDBFKqWfaFBS/6TdH47yhBwChgXLlyN8CHH0PV8KdGkKuks?=
 =?us-ascii?Q?07z6J1bAhLFNYutqDkCCa5lBZvZhHh+Hooq06vKtowlKu4Uo8qCQN1CnxTEx?=
 =?us-ascii?Q?021nqtk2Ba6FaHm2n1RNqpkj43TFjEhOh2HNb0Se1J7ZdAWl/KVWazAP8TLK?=
 =?us-ascii?Q?3Fhst7S9DUO3iiqLvhDSpbkU4N+9y3ZqUfK53IPYJC4beHEgTGY7N07T4LsU?=
 =?us-ascii?Q?R3lKE00+ARY6+eZY1JVlSJbmUHcd28AxTOwE2k5rSP3PzdscVSeRy8BXVkGW?=
 =?us-ascii?Q?peKoNjHYrpDgBB+5JRzbbAl9GA9NwHM=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: e8a21fbe-201b-49ed-904e-08def2421f9c
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 16:04:54.7108
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F4fSiQQ04xheEzqak/OCzAuhH45mLZIh84r4qhpM0UqUy0J/n81d4dZ1McbSJyfvhpJ+ZjdYRxxwZYWc+VbhPwF+F/ihmV3QHl2l93sKpTE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5761

This patch adds missed get_direction() function for gpio_chip.
Also it reimplements pinconf's get_direction() function using
newly defined function.

Fixes: 1c8ace2d0725 ("pinctrl: airoha: Add support for EN7581 SoC")
Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
---
 drivers/pinctrl/airoha/pinctrl-airoha.c | 50 +++++++++++++++++--------
 1 file changed, 34 insertions(+), 16 deletions(-)

diff --git a/drivers/pinctrl/airoha/pinctrl-airoha.c b/drivers/pinctrl/airoha/pinctrl-airoha.c
index ad6d24e39c868..fa9284ee3b71b 100644
--- a/drivers/pinctrl/airoha/pinctrl-airoha.c
+++ b/drivers/pinctrl/airoha/pinctrl-airoha.c
@@ -2523,6 +2523,22 @@ static int airoha_gpio_get(struct gpio_chip *chip, unsigned int gpio)
 	return err ? err : !!(val & BIT(pin));
 }
 
+static int airoha_gpio_get_direction(struct gpio_chip *chip, unsigned int gpio)
+{
+	struct airoha_pinctrl *pinctrl = gpiochip_get_data(chip);
+	u32 val, mask;
+	u8 index;
+	int err;
+
+	index = gpio / AIROHA_REG_GPIOCTRL_NUM_PIN;
+	err = regmap_read(pinctrl->regmap, pinctrl->gpiochip.dir[index], &val);
+	if (err)
+		return err;
+
+	mask = BIT(2 * (gpio % AIROHA_REG_GPIOCTRL_NUM_PIN));
+	return val & mask ? GPIO_LINE_DIRECTION_OUT : GPIO_LINE_DIRECTION_IN;
+}
+
 static int airoha_gpio_direction_output(struct gpio_chip *chip,
 					unsigned int gpio, int value)
 {
@@ -2656,19 +2672,13 @@ static int airoha_pinctrl_add_gpiochip(struct airoha_pinctrl *pinctrl,
 	struct device *dev = &pdev->dev;
 	int irq, err;
 
-	chip->data = gpio_data_regs;
-	chip->dir = gpio_dir_regs;
-	chip->out = gpio_out_regs;
-	chip->status = irq_status_regs;
-	chip->level = irq_level_regs;
-	chip->edge = irq_edge_regs;
-
 	gc->parent = dev;
 	gc->label = dev_name(dev);
 	gc->request = gpiochip_generic_request;
 	gc->free = gpiochip_generic_free;
 	gc->direction_input = pinctrl_gpio_direction_input;
 	gc->direction_output = airoha_gpio_direction_output;
+	gc->get_direction = airoha_gpio_get_direction;
 	gc->set = airoha_gpio_set;
 	gc->get = airoha_gpio_get;
 	gc->base = -1;
@@ -2876,21 +2886,18 @@ static int airoha_pinctrl_set_conf(struct airoha_pinctrl *pinctrl,
 static int airoha_pinconf_get_direction(struct pinctrl_dev *pctrl_dev, u32 p)
 {
 	struct airoha_pinctrl *pinctrl = pinctrl_dev_get_drvdata(pctrl_dev);
-	u32 val, mask;
-	int err, pin;
-	u8 index;
+	int ret, pin;
 
 	pin = airoha_convert_pin_to_reg_offset(pctrl_dev, NULL, p);
 	if (pin < 0)
 		return pin;
 
-	index = pin / AIROHA_REG_GPIOCTRL_NUM_PIN;
-	err = regmap_read(pinctrl->regmap, pinctrl->gpiochip.dir[index], &val);
-	if (err)
-		return err;
+	ret = airoha_gpio_get_direction(&pinctrl->gpiochip.chip, pin);
+	if (ret < 0)
+		return ret;
 
-	mask = BIT(2 * (pin % AIROHA_REG_GPIOCTRL_NUM_PIN));
-	return val & mask ? PIN_CONFIG_OUTPUT_ENABLE : PIN_CONFIG_INPUT_ENABLE;
+	return ret == GPIO_LINE_DIRECTION_OUT ?
+	       PIN_CONFIG_OUTPUT_ENABLE : PIN_CONFIG_INPUT_ENABLE;
 }
 
 static int airoha_pinconf_get(struct pinctrl_dev *pctrl_dev,
@@ -3136,6 +3143,17 @@ static int airoha_pinctrl_probe(struct platform_device *pdev)
 	pinctrl->desc.pins = data->pins;
 	pinctrl->desc.npins = data->num_pins;
 
+	/*
+	 * some pinctrl operations (ex: get_direction) might use gpio registers
+	 * before gpio chip abstraction will be completely initialized.
+	 */
+	pinctrl->gpiochip.data = gpio_data_regs;
+	pinctrl->gpiochip.dir = gpio_dir_regs;
+	pinctrl->gpiochip.out = gpio_out_regs;
+	pinctrl->gpiochip.status = irq_status_regs;
+	pinctrl->gpiochip.level = irq_level_regs;
+	pinctrl->gpiochip.edge = irq_edge_regs;
+
 	err = devm_pinctrl_register_and_init(dev, &pinctrl->desc,
 					     pinctrl, &pinctrl->ctrl);
 	if (err)
-- 
2.53.0

