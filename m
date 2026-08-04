Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11021084.outbound.protection.outlook.com [52.101.70.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4AA04749C0;
	Tue,  4 Aug 2026 16:05:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.84
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785859503; cv=fail; b=aolIaM5URNw6vq1npm8g9/ziPAVhq7tLM3KE8Axq6ZDKz+wf6ULDwR9QFY6JwcynbaN08tj6DgcBc5EWuXmOL57CBTXr4HOtBF0Tzd23e/8i9fzXc+xYAIsTO6FzlWmVUCACRurg1KwgepRTmPkriNbi8BWnyxiOjrlRQqiKH6c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785859503; c=relaxed/simple;
	bh=BO2GCH9XlwbcoznlOyn04a/d53/qqLrCcP9B7JUYwSo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=MW8aVw9T2AntAE0ouY0Y8wckku3hvbFu0kxAhhzMZQxyda0z/dkRubKiWHMVEmA19RoRk/ItdT/zkQB4pTFESHM7pBmX5mg9OayR+mPjtCC7iKQV7LMGuOqsybKoCzgfM84nEg2FvM4LbfYmvSPk9IcZBd2nDPdWd9p6r91j+BY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b=5A1aouUx; arc=fail smtp.client-ip=52.101.70.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=genexis.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b="5A1aouUx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aXeAfuB8vVOguRJ1143QsiAciSbORGtUpDPOAmP6iRp8ereXeoucPMwRjVIX3r9/UKHily8fDo/th/LJAJKNyPwNqmhY8BTBn6WeLmP8sBt+li/E5O7c3eGJnvJPIjr6n+MSgheTGvhd8WZA6Uvx0rUuSPp7RrpYOELXoSuWG4Fr4yDIQhhooa3Boz3xatEWeRMuqkg0r0xkWUhfmpRT7YwsTcSapySN3ry/mdUe6qSJHpwp5jfslCHgN/seq8zLPKoENCaeb+9JppO0a40gK1dPmirF8dWGLxSPiY18L174JSncJD9FPpF6lgwyBz8oznOFwAa2IB7Dub+avY9ojQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j2VNo8K6EidgJyaKJmguPjxugm7VdlTMby+nYNvzpIM=;
 b=RSwo/kDIesBcN7oont1hQOmB9eXiFB7gYl/aA101vFkxAqcph3rxw1CsFkgagHus6zumTs99SWSLuVCB5QABRQf0ux9b00w9H9QJZNoHRlLqaFfgMUWKSaX0N2Hw9sjVdqY5fP0AEWHnJqz26oR1WEfvnvFFG5vuxmyJEGeXf/bl+5hF9upE08CGsx1/pVXp+rga614MWKkyzUas2iEbcsr6pogCr+gb5BMAVuI3hUNgbXnqwWep70Zx/N3IPb91nCMz0kdixHs5RGDR/nhVJtMWrCLjpdjvjU87BJd5fF/h5VzTTmNcXCmkmuzc7MNjLvBSLZnh4WLnbMoYNrJzmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j2VNo8K6EidgJyaKJmguPjxugm7VdlTMby+nYNvzpIM=;
 b=5A1aouUxORbjA7wreheH3vJBZaFx7XaYe7oXWGDcDZHTCa4caKc+Pe1zfcG+C6TiyciBo+nrPO+5Qsp1yoUoTJlTkWqN5O00dqqFPzCq3+zcHJzUr9TiGsrGl5IwiIi6pgihjmKgc58NsNBy/9Ahaq4bBhYc3vXvw29k8AE/zd9lAs+7gaC3rq54AvaA8INPMMsNjX121+gVG3nXLW4SY/riQ5yYS1CfSHuZ9jL3GF36Mtbdb6NIIPaUHL36ViExQz5d8GIhVH7uWFsDArnZSGSXoq4fZ3jACy6iDXpgPHE4iHfKk1QaSoSal/PVsJ+kEvDACV9yaaAIng/HRh1iDw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by AM8PR08MB5761.eurprd08.prod.outlook.com (2603:10a6:20b:1d0::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Tue, 4 Aug
 2026 16:04:56 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0292.013; Tue, 4 Aug 2026
 16:04:56 +0000
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
Subject: [PATCH v9 15/36] pinctrl: airoha: add set_direction() helper for gpio_chip
Date: Tue,  4 Aug 2026 19:03:58 +0300
Message-ID: <20260804160419.3592327-16-mikhail.kshevetskiy@iopsys.eu>
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
X-MS-Office365-Filtering-Correlation-Id: 632d94b4-aba4-4881-215e-08def24220c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|7416014|23010399003|921020|38350700014|22082099003|18002099003|3023799007|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	K3jpOuaoCj5Ic4Uyf0dHY58vC6Uf3qy0JE07ofkd4FEWNieZgp4/mfyFLnMkTJLnwXZxNHZbVV9I2e+xftwl5J9jTIThIdw46FbM6MDbVW8yh82iVildWs9jMKOM6suBeldLn6hCBLG0Y1ng82AB3q1Y3W0AbWrLpQ3VKmViTe3pOpoWDnXJNBxMEIQNIuRdrEjEFNxdymmIOi4l3xagntCx+OnFti9B9G5rK6EQPyu0zgOuWO4vkgs0bBFMKxgTDFPItJaeI+c7hEBD5YpVeatd6xTfdTfBR1YZOo0Qz/oQMguk1dZCCIcjzTbfc/5BB9B7GA5rKenvvD0RNthDNtK3KQ20OdqgMc/aZuWWINN6QphkAZXruQyVCW4XJCqiOH6kfcBFDe+OxebDwpQsL74xaxhR+BxMoW0+qw8OtVZecsDgUV2S1OnE7Bua/A0ewcrIB0snfYPa7PfGW0sY4eUwYTdY7lVfl05ZrASrQzeztdC5ZUiX7pXcX8nlLKtR6oIoAEVTahLgWkNsiag1oBETJTg0gIwBnDinD134/9WRwxfBCxOI7BenwcvxK325nokywj2uG38HG/VIb8rFG6WNtIAase1WdzSyktfWuKxeI2glY9GcS5O8qFFNIKFKPLWY6saUkCYxUMv6UYthNvLVA2stddFnNfq32YPRtVxN3OOwUABooG6upomzG+gglr4HQrcX8a23aP5IWOsfTs9DtTNsqnVdM1khe6psbbClaSqNhrrTra4uePn+Ed5s
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(7416014)(23010399003)(921020)(38350700014)(22082099003)(18002099003)(3023799007)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?R+1awHnCPOiB+h3pIDzPFFKgIyXCglgKi9uI3s8JNZ8MWuXNoI7FvaoeKYzF?=
 =?us-ascii?Q?WAKMOyAFDzyqaG4fRuvBkHQM4JR1Qi+9KTklzyjr7BGhOeVD133EVK0sSiNE?=
 =?us-ascii?Q?24KB54C3e842GieZVO8sEYH23AvhBb6KUwFkQ9ao1zlPvckxZ89JciYlW1V1?=
 =?us-ascii?Q?UCd9xvRNPy7f/iBm+QPUbm3vUvh9CZy616l7AVhbmmk6prL9l6SnpMDiOtTF?=
 =?us-ascii?Q?FqFnrp4Dg4BCNVaKl8pZVVGuM2w9KaKwljAp/m+S9PLB3wFXIZqJuSJlFwKt?=
 =?us-ascii?Q?96sR9258hkp3lMHem98iJ9nrq2l/fwGNIlQzqrFvlaY8re67IhcCQ2UrMAfz?=
 =?us-ascii?Q?b0aw6IGIP9wJRgm36o7fEMwJMCtK/SFcewR7TvXKonfGpDqaIXxrKIHHtDEP?=
 =?us-ascii?Q?sPv5cSRP+91rsEymm6OujK2qWNUakemliLjORvhhWVayq3KACL3bzwt+io5e?=
 =?us-ascii?Q?PnXSK3UDzCEdV9EO6Tapo0U1MPhtGEHiixG/4ctk2AaKCY8pzjNrRbxQAnVR?=
 =?us-ascii?Q?2V/eWIJNgWwVe6hQksMoL0mcjKmfbkK2cl1lgbZFeDlesdpv8EgQze8Ye+zj?=
 =?us-ascii?Q?CLIzt5I27Zut5JG3lkHf0CyXhPXW87AkN7RWyoVRVCHQL3azmiXghAhWiXm2?=
 =?us-ascii?Q?tyvlZnVDI0qaQADU1Hb5CaoCmTxViya3/wEcQDP7cTgGOUBofFF129u+53EX?=
 =?us-ascii?Q?quOzEAttyFeE76bUSvp2dQnNCSMZdEYWjw3+nAvwB5jcKaQGIaXdW4PHd/6x?=
 =?us-ascii?Q?Wmv5VPGY+1oXAyUbOm041Lh6PnWiNNi+U8Lrzwg6G4PjcoZTvB4ix8gia9ex?=
 =?us-ascii?Q?1ISNXEe+cSQz/s/PVICrKAYhiLs+inP0al9gjsEwfI01V3QHr31C8GVi+OD2?=
 =?us-ascii?Q?SupAdItjUGhJzDlbf2whhR+jinv75YiwexAaL0xJYdCRgXzzVj0iR+Aa/oKk?=
 =?us-ascii?Q?WqSC6nOIG34WjY27IahDqG9h1+TeW9XWLBCHkZVg44W8yRhpfNoPxRuwUwof?=
 =?us-ascii?Q?reEi5Ov1pZ3hVh8lxY74pCV6YEJrAs2JlSTgNY5YkWFyDy4Nlcd+ahwImkq4?=
 =?us-ascii?Q?RtNZJoPZy5l+liwHVOgDh6oauQe058Q3w13SoMlz1Rji3ibQVtb3VMLxyjfj?=
 =?us-ascii?Q?kls+FbEjeqjrnji5ytXXE3FIbNULin+sRTbrMfTYAi9UQiwvnoacTp8KyYr+?=
 =?us-ascii?Q?/Jf6xVmetiauC+BwJj+65kOgNIxOe6KUVSahahVvW8IlOvjOzE0BkXu2+VYJ?=
 =?us-ascii?Q?mjniAQlYCProaQG2xNUoKouQ4SFP/x1OBtDRyejhwnwuzHPHc/Ma+jTqul5u?=
 =?us-ascii?Q?V4f/AY/7GOPwtAyQxkwh0HdGB+FSPaODpP877jCdEAbBWTstKUjxm01jhs7b?=
 =?us-ascii?Q?xDaVSi1Q/9bdFp7Syj4TlHuvtD11L2faW7X7obPDbKOyDigndCPzSXwG/TgO?=
 =?us-ascii?Q?A99TXhFCJcfo8kpL0W9lAMXAuxbdIUXG7maW5/3tSfLj5PojXv5aTmg7ub+j?=
 =?us-ascii?Q?F2Xk9Fo8VpTdumjWKfng+Z/0Umibbd2CZqZSonuiLR8EsU+tK0sHuLNLkUAg?=
 =?us-ascii?Q?nJ7FT656/KM1EsLN6nS6FdHG4yxtIH2fZFhnmgKMNIUE8T2yIkJLQCE8ZXYi?=
 =?us-ascii?Q?n2uR3QHgC5X2+QTD1REQZyBiAlRjGDddrG6wGDjCNpzEngBmo85M2mlNHaXV?=
 =?us-ascii?Q?CpBjGgZQhljXUWbrZW7VJrOAm9wE2j0yPlH2sXcH0f4jDYskyL/4FCHyZ3v+?=
 =?us-ascii?Q?6U6BVxoGbBVOuj1yYRyb5un2pMe1yqc=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 632d94b4-aba4-4881-215e-08def24220c4
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 16:04:56.6371
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9PK7KpMmmrSDvE3A4BslVHM/Jgij1YpgMlzMkagidz/FB89oYWL4ziRrOBu//jwLX5zZk30hHrvH6A61SGEsP+0YzBxPHL6GObTrer2MmPw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5761

The patch creates set_direction() helper for gpio_chip abstraction.
It also implements/reimplements some function using newly defined
helper.

This is cosmetic patch used to place gpio_chip specific code together.
No functional changes.

Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
---
 drivers/pinctrl/airoha/pinctrl-airoha.c | 52 ++++++++++++++++---------
 1 file changed, 34 insertions(+), 18 deletions(-)

diff --git a/drivers/pinctrl/airoha/pinctrl-airoha.c b/drivers/pinctrl/airoha/pinctrl-airoha.c
index fa9284ee3b71b..746728d3df901 100644
--- a/drivers/pinctrl/airoha/pinctrl-airoha.c
+++ b/drivers/pinctrl/airoha/pinctrl-airoha.c
@@ -2539,12 +2539,42 @@ static int airoha_gpio_get_direction(struct gpio_chip *chip, unsigned int gpio)
 	return val & mask ? GPIO_LINE_DIRECTION_OUT : GPIO_LINE_DIRECTION_IN;
 }
 
+static int airoha_gpio_set_direction(struct gpio_chip *chip, unsigned int gpio,
+				     bool input)
+{
+	struct airoha_pinctrl *pinctrl = gpiochip_get_data(chip);
+	u32 mask, index;
+	int err;
+
+	/* set output enable */
+	mask = BIT(gpio % AIROHA_PIN_BANK_SIZE);
+	index = gpio / AIROHA_PIN_BANK_SIZE;
+	err = regmap_update_bits(pinctrl->regmap, pinctrl->gpiochip.out[index],
+				 mask, !input ? mask : 0);
+	if (err)
+		return err;
+
+	/* set direction */
+	mask = BIT(2 * (gpio % AIROHA_REG_GPIOCTRL_NUM_PIN));
+	index = gpio / AIROHA_REG_GPIOCTRL_NUM_PIN;
+
+	return regmap_update_bits(pinctrl->regmap,
+				  pinctrl->gpiochip.dir[index], mask,
+				  !input ? mask : 0);
+}
+
+static int airoha_gpio_direction_input(struct gpio_chip *chip,
+				       unsigned int gpio)
+{
+	return airoha_gpio_set_direction(chip, gpio, true);
+}
+
 static int airoha_gpio_direction_output(struct gpio_chip *chip,
 					unsigned int gpio, int value)
 {
 	int err;
 
-	err = pinctrl_gpio_direction_output(chip, gpio);
+	err = airoha_gpio_set_direction(chip, gpio, false);
 	if (err)
 		return err;
 
@@ -2676,7 +2706,7 @@ static int airoha_pinctrl_add_gpiochip(struct airoha_pinctrl *pinctrl,
 	gc->label = dev_name(dev);
 	gc->request = gpiochip_generic_request;
 	gc->free = gpiochip_generic_free;
-	gc->direction_input = pinctrl_gpio_direction_input;
+	gc->direction_input = airoha_gpio_direction_input;
 	gc->direction_output = airoha_gpio_direction_output;
 	gc->get_direction = airoha_gpio_get_direction;
 	gc->set = airoha_gpio_set;
@@ -2759,27 +2789,13 @@ static int airoha_pinmux_set_direction(struct pinctrl_dev *pctrl_dev,
 					unsigned int p, bool input)
 {
 	struct airoha_pinctrl *pinctrl = pinctrl_dev_get_drvdata(pctrl_dev);
-	u32 mask, index;
-	int err, pin;
+	int pin;
 
 	pin = airoha_convert_pin_to_reg_offset(pctrl_dev, range, p);
 	if (pin < 0)
 		return pin;
 
-	/* set output enable */
-	mask = BIT(pin % AIROHA_PIN_BANK_SIZE);
-	index = pin / AIROHA_PIN_BANK_SIZE;
-	err = regmap_update_bits(pinctrl->regmap, pinctrl->gpiochip.out[index],
-				 mask, !input ? mask : 0);
-	if (err)
-		return err;
-
-	/* set direction */
-	mask = BIT(2 * (pin % AIROHA_REG_GPIOCTRL_NUM_PIN));
-	index = pin / AIROHA_REG_GPIOCTRL_NUM_PIN;
-	return regmap_update_bits(pinctrl->regmap,
-				  pinctrl->gpiochip.dir[index], mask,
-				  !input ? mask : 0);
+	return airoha_gpio_set_direction(&pinctrl->gpiochip.chip, pin, input);
 }
 
 static const struct pinmux_ops airoha_pmxops = {
-- 
2.53.0

