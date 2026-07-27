Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11022110.outbound.protection.outlook.com [52.101.66.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C96A43A7E4;
	Mon, 27 Jul 2026 17:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.110
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785174147; cv=fail; b=PZhFClkjG0ZqM1yo18oUwbqV0nw86ogVFSf44Lkemlz17IuB7ELZBm/pfBTreTBWonVKKLj/uec140Lgn4dbSUi5sg+tFYyQ5jyBlRsideMuqr9EXXsQ9StxE/YR2ccjPIASCMDmuDEgcl6or73BuolEh1SXa6VZ3lCaWKTljtc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785174147; c=relaxed/simple;
	bh=qiUp4sinv8ZidqNno3UU5DuimDzi85yx0VHf/NKxW6c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=qshDEZeGMa5tPyJA1Ss8PwIj6NEgscHKyCjSwLNVfZrhepHFWf3ci746e2sfCqiSsYZEu1Kqf9hen8Y6oSQ/mo4x4xaa0bEYJfNwnHGm8Rpu9JouJXznwUxVHgiouSnzBI5H118lzr8v1654PiWhe4akLDhwVn8Z+gfaYw9CLVo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b=ME/Ks6a+; arc=fail smtp.client-ip=52.101.66.110
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=genexis.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b="ME/Ks6a+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WbP3wli7I57EE7p0MlP/axbZxreVe1TbfxIOHZVGg6TG5rUbN9qfI6cF3uXRsx1pmeqoxh03S5tUw1oK16tl0egKneQJVFIEtYTsLi+A7OTqkPHAAw6e89XQDprKg5qKuY1kA58NFlcmlVckLAQM1l/+V1ZbCZJwNhSEzEVQkIF7MMmVI/zn83AWi17Xn9xGYlg4qWuvpcYte2e0iC0UKdWwpCLLIPpqw0d5cS749y16GDSSY7Y90xJjBIErOV5yfDLocYz3WuIN5CbJp4UwL+ebwirZUZn4lk3ToBQD+fweK43+oV1Pd4ygMbP9Dq2xHIwyxi1LpHEl/k1PRr3htQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g4vJ3F/lVmCpZfpoqnPAyDjNqIqxvYJlKdNf9q3bDGk=;
 b=TfN1yLz7c1QfhAh726T0n0n+9CiLu0l6hB75OHvVJGOgTXYftQ4+VX1z6ejQIZ5vjtSEbTlToTdbGWXW+7QiAu4gCKUrfabXu5ijQcPdm9musE22IhBF7dST+RnJkMySBcjbLPWV4olbv1pETaE3NI5IGfSFbWVMLaIiQbZ5uNWP9+SlA2TON9aG09TlLdG6WwT2HBgWnlCKe4nM+ef8d3wWGQWNfcathZ55t7xokhq7D/+wvsmnv4Evssp9pF5+1O+YKPRBo+/lC+qfhMjYM/wX+pXWwjmDvl1bCUYLP9tUtERosC6eAeG68mpewQuSMFLDT+JGjxtL1pTR/gBRvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g4vJ3F/lVmCpZfpoqnPAyDjNqIqxvYJlKdNf9q3bDGk=;
 b=ME/Ks6a+y/OzKNrxyE4MIn7shj+bsEQ1Ure4Xca/J9HmODk4Cs7gBp2XpX1sHpQqJQeOwf69gViHQii8RNafxv8iHCfJgwcsVesyc5CKoBmLEESctU/jJQ1nQLnNmcRitohFZci/jYySmDk2o1iH0NxNJ8Ae50V6BndzoUkMWg8E8BEaZNNY6puiflpLOSuMo58s96hMLiBNrFhXYGSnpbBBsoTleXEt9wpKir8X7KaW/iMW1mZELI1JyIoVle0ULU6wmq3OkVjjS3EBXygAL8zmvQLJo90kgry1nHfTcnZBiM9Y1iB0XPc8Hio8z6ruUYWp1vBZH/CZGT7T3jyuqg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by PA4PR08MB5888.eurprd08.prod.outlook.com (2603:10a6:102:e8::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Mon, 27 Jul
 2026 17:42:16 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0245.012; Mon, 27 Jul 2026
 17:42:16 +0000
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
Subject: [PATCH v8 14/35] pinctrl: airoha: add set_direction() helper for gpio_chip
Date: Mon, 27 Jul 2026 20:41:20 +0300
Message-ID: <20260727174141.664933-15-mikhail.kshevetskiy@iopsys.eu>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260727174141.664933-1-mikhail.kshevetskiy@iopsys.eu>
References: <20260727174141.664933-1-mikhail.kshevetskiy@iopsys.eu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS4P189CA0064.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:659::24) To DU2PR08MB10037.eurprd08.prod.outlook.com
 (2603:10a6:10:49a::20)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR08MB10037:EE_|PA4PR08MB5888:EE_
X-MS-Office365-Filtering-Correlation-Id: dfb69381-8a98-4466-ca90-08deec06667c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|7416014|366016|23010399003|1800799024|921020|38350700014|18002099003|22082099003|3023799007|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	E67/nHM8KJjLU4cXaO0hQkfv++H5Q50n1/+ziywWO/fR93FHgMT1LAZddqgXCnIts2PjLkfwdgjhNgS56qySqcN4xEOVkWfPp2/RWwm3c3rtDPENYVpKe+B03rN/6/TxUaOqmm64eZcJGjIkxfIKyjFJiREGOTzGxYxmisfg7OFAmhRh5MpCnVbwjZQ6vG43t3CNKXrV4neiSADnK7lh5jybBDI+iUAX8e0Q8R3KZtPeAw4XAzKlPwKkmu1+p53SkWK9rSEGLEEqgHiboFFaX4b8cz89TPfJ/ombcRf2cijTlEJWPEznwClALazV+FltgEtnlncDHVlpEIFcjyfK+zKWe2j0Zu1Z1aAPt1Y7BxW5HHOETE7uNJQIyrisf9wKCo1O8EzdArTgAIZXjAecv7Vug7Dpkl/Xxcsc0AB6fYm6KFAbiwmoH8w3gbY4axfCJCCdFL4WgeqTs6dZRMsWlrjz2z5yCG10h3/33mE2l42SIhCewgdmcloLx1Mtiq3GKOZOKtp54lrTDSrZG9Xl+qE69Rw3rM8inRcZxwWsIoLu2G9lcJd2bjSvy2GV+4RTUCaWOv0wOodXHvS2xwsuPxyH2bLv1CzNa1SJtFLzdDSpfYI0DGizwotLYr/lF/nmOiqPK537RRWZ1DBsvslpMafeeNKuKJWytltW14xF8LKzUAWP3z7zuFWqirJ9OlJqdOovR4BNTgnFLlwo8k7rfsprQFofIoXUy01j/clmWeMiQSSbCTv+kz0BHtm/fBC4
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(366016)(23010399003)(1800799024)(921020)(38350700014)(18002099003)(22082099003)(3023799007)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?9+XLdPT7KHo/V5h4/TYsytytT9QigbXfVA6TrLlJjy/4ENyxD9CUyBLtPOng?=
 =?us-ascii?Q?YyKN2Satm/+mkWxGUCDjznreLirOB7q5NiBKw5yE22pdVwqwPfXXoLo+v/6j?=
 =?us-ascii?Q?F8mzAu6+RHrC4mwkWvi2jagrAHLGZ9jmxfsM9E5Oi39e5/9s14oVkxTGI5fq?=
 =?us-ascii?Q?mI9sqCBST06WGIyNu6FJen5yavub8cUZ/9yGYdz0+nwSCGzrRDr+6ey/VjXR?=
 =?us-ascii?Q?2dZVLIkN/xLb5uhecJFYRczlZNU/N+tFFsgz+Tiz89z2/co4qFO4o497ZM2F?=
 =?us-ascii?Q?fWP1KpTkg/Wil+T/V/32qIXu2DN2jvPfJIQXQZVUVy/uHS9ZWoD5ULR/7xoq?=
 =?us-ascii?Q?IL833Hqb+EjwgW+92GoRSf+uqALec8r+Hy5OAbZheiLFzYVVxnX61VAyz+XN?=
 =?us-ascii?Q?fiCFfuVmAqspmh50sZlmj7PwQQKvMfloNRIFbSyqkEgOKYzD28v74STqBHRO?=
 =?us-ascii?Q?OFVeKqvJBsdKawiKu7O33Di1hWYXUGGlkwV4x8V/fvrOjOckbGggJNV4puK3?=
 =?us-ascii?Q?USuL1ogPX2LtDTYBkWxtUBgwJDvDgUpWg1BqQL8Bm2ZiEE+SKAz99C/GKcMq?=
 =?us-ascii?Q?OF7iwnQz+SmDobUCl3f2yKkDa3ovIwzcHVuuJw0h0scQR1agkkuyhGIrA4Ja?=
 =?us-ascii?Q?NKnHA9J8qvvS3t2opcB+i0Q1EzAdymoPDw7T1AZfKUHrX4Ab2Tq+1ZunAsfs?=
 =?us-ascii?Q?c9rhCiQTGOHMsQ7El/1tQBIUuc/3h1tc4Qx9oOYpK0tS16iAplrvhN+JDaa1?=
 =?us-ascii?Q?wgBHiLvL7z7UIGjvXWfBUPO83B6xz0LHGXhI/2Hy96r8SIW+GekQ/ZvmEXiB?=
 =?us-ascii?Q?xudV9ka684pGbPpZBjKfENQQBPAjAV0kW5jk7WI6SZ6C+vsSa+EPU9bk0SYy?=
 =?us-ascii?Q?cPd9bqzJJoQ5wY1+aHBFz2F7lCokBnh49S+jfu8sBpQmCBWtgrVLW0wf32Gh?=
 =?us-ascii?Q?bNByv4P50GgbbC1GFVAK/EOstgW2HgX6+7ob+sStbfLRw10vdUfLMN17BO0k?=
 =?us-ascii?Q?jg8/5cwDqEmTJQZjnV5Bdb1JPt8JnMP2K0xG9u57jhdubRHCEzVnDbvieuvX?=
 =?us-ascii?Q?TU4XY6sxW0Vvh4inrQ09KlGwgPNpHYNav8aklM7ZAv2MoSYgwhwcSgYZ9xFZ?=
 =?us-ascii?Q?GFiWNyumZNJPJMYYCPF5Z3GZAzc1ScCDEDD7ZQP4IpG/KSlCC3RxtgjckdJb?=
 =?us-ascii?Q?cSSHms4J9vL8Nn2hsKxG6f5KC7w7txNxB4+5HXTOz1oPYl5yCOOBUXxDeBeq?=
 =?us-ascii?Q?2TvA1kJd10fNlkuzykONQTDcRfcW/ND4p+xLw1uwU/gwqfImpElqjOlTir1L?=
 =?us-ascii?Q?5icF2EPPOWshBJJ+ssWEPknSmucyWnYJrekJv73QPEh8uIKGQnIhSAECRVU4?=
 =?us-ascii?Q?8DgYfjXCJC5cagbwcyuQwXJkxfueAEpVrX3V4l8B3BbZCHQJjUdW9Uy0TQWx?=
 =?us-ascii?Q?25Lgw4UgE59EgqIJoP5gOSFE8mZW6CaYG33lEQ55dzJlSRZzj8zZnfYjov7W?=
 =?us-ascii?Q?DIFNHyvOb5/wwIqbVvn5pIC2LHLO1J62KMHy6o3FjWBoFZH6/vF+6/r33iQW?=
 =?us-ascii?Q?UOYRDEFxBfApytc3SMAOuTqGJ5GDxqlIFkSvqkOgwplfXYtXkDam19+oJBGO?=
 =?us-ascii?Q?0SLGkrpVSwasGTVWF+Fd8U/DoHBKdm/ak1YeQJOUHCJTU0bKJNocqUbMTeUQ?=
 =?us-ascii?Q?D1iSDubcvTzMBhr20oGZL2kh6WYl2qwjXeSFzcbOL7yAfFcCjTC6/IecQaOf?=
 =?us-ascii?Q?U2TiE4VhLEK4HMWod9lAFQD+g7CF2k8=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: dfb69381-8a98-4466-ca90-08deec06667c
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 17:42:16.7909
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OUpzkDfw6v6ZVVo0W9ztkawAmNhrUKfMasQxAYxnGWq9hC+4WIiEif6bjDwLiu7f/oUYvma8Jt54+OM/X1J5NE/tLBPxQd/IY9PejVKLDzc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB5888

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
index 070b5e3c5cb2e..c432e9c13c207 100644
--- a/drivers/pinctrl/airoha/pinctrl-airoha.c
+++ b/drivers/pinctrl/airoha/pinctrl-airoha.c
@@ -2519,12 +2519,42 @@ static int airoha_gpio_get_direction(struct gpio_chip *chip, unsigned int gpio)
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
 
@@ -2663,7 +2693,7 @@ static int airoha_pinctrl_add_gpiochip(struct airoha_pinctrl *pinctrl,
 	gc->label = dev_name(dev);
 	gc->request = gpiochip_generic_request;
 	gc->free = gpiochip_generic_free;
-	gc->direction_input = pinctrl_gpio_direction_input;
+	gc->direction_input = airoha_gpio_direction_input;
 	gc->direction_output = airoha_gpio_direction_output;
 	gc->get_direction = airoha_gpio_get_direction;
 	gc->set = airoha_gpio_set;
@@ -2746,27 +2776,13 @@ static int airoha_pinmux_set_direction(struct pinctrl_dev *pctrl_dev,
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

