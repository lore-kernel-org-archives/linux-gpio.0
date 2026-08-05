Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11023138.outbound.protection.outlook.com [52.101.72.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08D7E46D080;
	Wed,  5 Aug 2026 12:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785933296; cv=fail; b=hKP4xWXvY0SVQbxfHf87+yuF7gRpVJHI1lbfNUK+QS2kUEjj7X/SiaLZuQcB/khaNS8A8YYHC1siQiJLTm8AUnenWneOS4e3Z9/L7UMhrOO/lV+0UuNCjA4R8bAzrBVD9zUqB0Eb1D9VKnJiHWCbZQ/8e/EK3lbrCX/a6GyWhBo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785933296; c=relaxed/simple;
	bh=0m/lSYpYOItkSScDG5P2vHpFBtGR1dFrrccCyc9JVLQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ahrovhx2PNO4jQvTLRINTgd51mtXRJ77CsLFcpDTnp4afc3Eazx+xuPhm9gg5FODpyG5IME91S6G+KF2oF4XHIjhtpmmGGYrAZnldFYAadkZQ0FGTychuwhiwSUVPBRvdXUhTpc3aPA9xK4cZ8aDopaBr6chCrQEH9BBrZabByw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b=Ig3T8e+K; arc=fail smtp.client-ip=52.101.72.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=genexis.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b="Ig3T8e+K"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MKNg6yejqencbk877XEljFDwWzzlC25k6XqsVH5qfxK/fuWHhVPar661QNzg7xyPI3FatLzs+Q104TPFmyybnY1pheLeTuqh3lLMxWa9DFJIfGGhLnVavrIBa1WdkOiOGqUddearS39jZROI2aR3xChr2K73mXE6KvfmlG/mLraEwQRDgCFQP8tgtQ8kM2DxI49pI9JjK9vDfMaj5MnSPzaTm+BDpWogBSrreC9KnH84uLMWfD7Z+OwtcTvhLxK8V+a2zwEGW+2PCf101GQuYyzxWvANsny2zFEieI7K3s4pbxme32V6+4edBobTmV7JFU1BSKXXCTxL9PLB0bjkUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wOMW1tHK7PUILb0FrJOd8BLv6CBGqBf/8FSOrZEtESI=;
 b=JDnndsD6arDCUIXGUo8BXo14Ogp2L/QpVolYv/jABrNw0mlskeUpkzMUbMbyZ+slBWV98FPUzcSjZGl2QDF4qvMFXIhYndeOTJh3z64aUnsmNX3bK8rUtCT9XbGSjExRixOLtWbC95ZlKNaoFJRaQQzBMzmsoKSz0ORxyrPy+tPmekpjxrnN/savTw3kJZPJpkqYwe/Mfj9QGb6M4Jsa64DeUN5m8vzKa5uXz241TcwgN8Qm49oZzVMt7V6nwXG/PfGZZMQ7KbkRf8ieZ4Zc3eU9sY7k/883v3MFEMEJ7arRFk1ANqVEMwVhVrk8sBO7C7TkVs2K82NrcdPgdvUOZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wOMW1tHK7PUILb0FrJOd8BLv6CBGqBf/8FSOrZEtESI=;
 b=Ig3T8e+KI4MecMzUwaLmnac0HojnbK28/gJ/UgGQculcPmOwz3Ps95JYvT/2cEd0sB7QZSZGu01ewipoEGd8OIqqINmpNaSFo444dv9on2vczUCPaWq5h2VtK4oNAAub0kM1TxCvnLUgBDcXTDO5TY4WTej49O4UDJD2TJXElNyhU4M+2eoNYiJrimpmheYJgnIx7iqZw48UvFV2yHmd3q32oi5KZsnRdUxn4FP5SGRWspa6mIQshMDJSE+TrI4rOaMJPgrlhVKb68g7ipL1HzDhH6SyGp67fKVwj3ma95us1g4GyK8TEq9YDvUE9Po80+ZvE7Sk4CJTGwm7ebv8Pg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by PAVPR08MB8918.eurprd08.prod.outlook.com (2603:10a6:102:323::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.19; Wed, 5 Aug
 2026 12:34:47 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0292.013; Wed, 5 Aug 2026
 12:34:47 +0000
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
Subject: [PATCH v10 14/36] pinctrl: airoha: add missed get_direction() function for gpio_chip
Date: Wed,  5 Aug 2026 15:33:46 +0300
Message-ID: <20260805123408.3767648-15-mikhail.kshevetskiy@iopsys.eu>
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
X-MS-Office365-Filtering-Correlation-Id: 9971d643-556f-4d4e-f591-08def2edefc4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|7416014|52116014|376014|1800799024|921020|38350700014|56012099006|11063799006|10067099003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	T6+Ey/hM0hpyWLH8vmf2LpXwdYHw8ggmTv80weqq1pLaBUJbLqNElb+rbi07n5fYAXPYJAXDCCzZNNQUDWrUhKhIKEgd6ruQI/6ZnmsfNPt8fdmqQYhLLeB6S/nErUvxLWwPCMbOGvwW9QdUQDoQCe0JlgdGp5m9SH/ZRG/dX8eHKOGc+J26ehCzpCbY2zROrWOVKW3H6JsPGBbke09yUYfkeSZBZiPRxKIPxx5Oj1gW2bgvZTrKq7axSAf9U0d27qFw4M+BbJpcxRjG5YuP+OjstJO8HhEyONzL5tAkv+MW0KdBxPnYq4Ogb1Cja0iwohpt7iLA7jJmlwSYjPVojsB5YfB46eI1l/vXaGQgDj/5sPCAeJdbpHTr2aNN64dLycgjmYWZSHpApMEjs/SFyGh0lL8XGjebVOyyPqS+RnR0p28DdKOHPGygnkOoOgfUyiM8SKRi7Wp+8HN8c9ZVJvZXqOo3UdQcjjNsX3waa+phe/HeN61P1/IWQoX1tvm6I+m2ZNoWA2y7HQj7x2/z3tPhAwngXCttZI4H29ggMVSAvBhg8U3UdHJDqid/FZBcv7UfH8ijnNjviXWh2nsgj6eTgA35lU5cS6JACnkBRYuWFDhcUPxuafoMHRvIpaM7+PR9lKn3di+c5Pk85C+3sNDD5LHXxnUWaV7bQ55FBTc1+BMihAuepWJyEavlWfylUogyr2e4J8zAQvuPXNdn6J0c9mCcoib1KRQFDQgNg9d9udIB44RpkHW7UZmfJmvZ
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(7416014)(52116014)(376014)(1800799024)(921020)(38350700014)(56012099006)(11063799006)(10067099003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7DXGZB874bTsMVixpPgcE85gN7fVS+vJDNSc5E5MOpJ8dN07KAiVUx7Z718P?=
 =?us-ascii?Q?qCf2HUBp96YfOGlbcuPOvRaNuIwrR1NiOMw4TRyrrE4DxvgLks+n7cLqvwKg?=
 =?us-ascii?Q?yaL2eTr//DlveastLv7DUuSmaTZw+LqSvVi4/IILCiA869xT5yL0AQws/y1t?=
 =?us-ascii?Q?dKOmpBiCUzPOMP+1WXSSdwXgfPtEns9o7O7GaJKPTVwcxovH5Wcc1ed9ldlZ?=
 =?us-ascii?Q?k7krIKTk4h26b+8nmeS/9db8hdMKyG3DfYAfd09nkItJCjgvNrXZ3UeQ8CQ6?=
 =?us-ascii?Q?z6kCToT35weVKrjf5JKPsHjP52YzTig4I64yC1tam/aR40gHFEaz9BXOfQp4?=
 =?us-ascii?Q?XCbc74XNEfDlcaCMyjHRQXjNjyoOa35qa80sXv436WuedwonVhFnZz8EBO2U?=
 =?us-ascii?Q?BDZZnjPLQtNBmwjKPVQ9IgRfOYQD75ZVfENNv91XYc8yNEsTyQpK+2hKsNjU?=
 =?us-ascii?Q?eLpqxXPFB4KYVQiQBfOg0ZmZIbpGpEa1tFIrlA/CPvTKt6bV26GKd2v/Cuwz?=
 =?us-ascii?Q?4TjAPO1h4dqWOB3CAle5ZVrig2U6X+HuzBPdEePtoqW0hZgBpi24tAQBpz/b?=
 =?us-ascii?Q?4B4MCTmnT5FdzXn4OxTqhHf9NrVsGFp4ziu+NhSHFqk2hNt90pV7zIYoTHoD?=
 =?us-ascii?Q?jvktCyqI4W0OJR3STpalxbu8kPwR2/DYGTJJpXfilR2CozZDgxM3FtDzFOT7?=
 =?us-ascii?Q?4e/FCBJ1m9GFE8ilAPtQK/maZnjZByJriLzQSXlbmpXM8O48NfHsxvtq9NCv?=
 =?us-ascii?Q?NnyJJxk4lXOIho4mLCPxb5VKF+8YHjEKV2HW93wH1TP5g/yYHRqKmDyGvljY?=
 =?us-ascii?Q?Fjqf+WbYjm8TtF7HZO2b1w3u4dsKVu6AKG01nbpL6pLVVzWLknOOR29Y/tGa?=
 =?us-ascii?Q?yrcERIbIYWVtFXQLqdhpcyJ3eAAv+nKbqwjJToDHD0HcwhNGwO4aUuuOZtZY?=
 =?us-ascii?Q?ToQOt+ZiD7kMGYfUeWsbblZPa6m4kUnhPpK91+y6LUxWD1K3yx9x8Jn3CCky?=
 =?us-ascii?Q?GOPST1s6VHue+H2AIvnlzxh6S9pAqJ4YLChApq6aXw8yUc1CFSuJujitGGt8?=
 =?us-ascii?Q?TrW3joJUld3yz8J3Nt7QwIGE8Qof9iDz8XuH9wKClrdndONUmi1A1ega6ZDi?=
 =?us-ascii?Q?iRwWrsLlCzW8M5JyUOibvZ6yLigngCwxwxN+DEn0rgoVRrxSS/tob0b4BLFe?=
 =?us-ascii?Q?HCgjSXNw+2vfStkhqX5RYrK9hK7DZV8v+MNexrZD+My9CDpZPfF6SOOyZaGk?=
 =?us-ascii?Q?i4w+NXI2ZECsaIgzC87GR4iYEcjsIGkzMO5hmKZsJATdCzkUh0WGu5nohnQk?=
 =?us-ascii?Q?EoZk2oR8n4TYBvs+67AWwGU49kdeYEezZbwxvrHcxhT+EdsXa20wpCN2Yd1W?=
 =?us-ascii?Q?1klztPW8J9/uT2TTOE3R9g8SvPzNQukDKNjKrw0iVnRHgCdEbtwPkaM/tQGb?=
 =?us-ascii?Q?QZA97yG6lyAY5zdR+rgTHngvZBkLgUOEGByHYkUqCxh+bOUtNF4SdvMu2MlG?=
 =?us-ascii?Q?UV7LNnva1fjThvpgoI9mvAf/cGNdp2CvS1H/2SIWiY9L+wgre2Jysgm/qNW0?=
 =?us-ascii?Q?+lIvFdbeqym1SMs5QQnNUgttIyqm7iUGMo1Vk5ard/6b8CdKHFPN+gjVv401?=
 =?us-ascii?Q?XnKkGHGfJWhVKDPERoOOPkzHufQN5gcQRR6gF4qZSsflCK80xiI1wJVGbPgw?=
 =?us-ascii?Q?tTufaNKWhwUqCQXRb9PoJ+FOajkQLrKxJKPMulEzWTce58hOBViLN2GEcuXJ?=
 =?us-ascii?Q?bpy2ANcSCoYfhcttV8QISQPtd+niQ+o=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 9971d643-556f-4d4e-f591-08def2edefc4
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2026 12:34:47.8752
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PjOrZzdgnLeo9lHNpV7JChiacR2/WNxOuXVnpXIeyeumGT+dPH8fr0qAIh4CpB3W6IIxFmcWPJtyothzP8Hywovt6LnTMcdEhW91kNYOksY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB8918

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

