Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11020095.outbound.protection.outlook.com [52.101.84.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A1B342376A;
	Thu,  6 Aug 2026 22:06:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.95
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786054022; cv=fail; b=JJsZTaq3aH74y4Rud7pJKad/79K8g3LJ4XzI3BYK58ptVW4twKl4SJslSceu56mVIJEnXAlHQZMZDwQBN80rNgqJjkKx8W2vVs+cLrfUjwOfqEDwEtUR/9xqkbUGPFsOZvXQKdrtdWmE+TzVaI4tkkH0PbavmeliUWfE85Ojvg8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786054022; c=relaxed/simple;
	bh=BO2GCH9XlwbcoznlOyn04a/d53/qqLrCcP9B7JUYwSo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=i6aSU/gw/CVFp83oKKY8phQfwSaEcVZ13VPg2a56fM64x60eq7itGI4j99xXTJe1/iamIZcDnMLA+0EJaydpYH9N/PWdY+i0zl0kfkvs+OysLQuZTGmQ7Jm+g2ZJrSESlduxrD9HHpHNA5J/3hzfQrl6RXr0VMaZt/nt6DazEiE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b=gdDdfNZ2; arc=fail smtp.client-ip=52.101.84.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=genexis.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b="gdDdfNZ2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AmoiCfSqmwBMJ5NBrkoVwGo7B1NKX4m05oL7Fg6hKCSsPXXUKkUtmiMLPPxPjilbKBvW9siLbItjqHkrZ01y4lYMGtg5iT6wjGHaORobLVryWMCUpmVd2je1HzmtFlIppnv5WAIeOYIbBPhNkJejSc3gcl8s5KLm2vdqOc6wI/udaYGL1FaZg3MnnLgNljYDcia1o1IEDiSHBLA3Qyo5j8IfKKSE/OooPG4XQA8HWYXwtSoRFTT3dW/0zh0mhs9ls7zjLZZ6UhS821rXVId0bZhjWLGlhFg+8HDRcJsc/Yt0z3IPpIt9IDiZrIoH3C5x4lCQ3hAz9lz4x7kRW6bmuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j2VNo8K6EidgJyaKJmguPjxugm7VdlTMby+nYNvzpIM=;
 b=ODy4rxUkwGbUyUjWxm671kmYtwaVbyfyDbE0lYfVsAc3PZ9/0ahShVYtZ83Z9AOjDm/7lRyZrJXMZM9fwd6y+yMsGFpcLK1c9Y0Ubsg0tMo3IWfTKE3T5p+PDS67lPP9UMCoDM8rgnFFUHy7xJSaP9PUWvWcZqH3AfnsenBpQDU2Otui7903gTepjJ/9bCqiod2dJVS0zaxJfLLBwIvNKQsXYrnVHngjOjNlT7XpNVxFe9qX3lcpQOGWWFcpoEXSSpV9fe4QZ2OKbXb+JzJApN7NOxCF4kGqZAftbJDBsPCU4ZCFJC3bMCvjtNPSipXuNKPdgq1a0wEXDld4FDsA4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j2VNo8K6EidgJyaKJmguPjxugm7VdlTMby+nYNvzpIM=;
 b=gdDdfNZ21eIqiXlDgFAlD/HendV20C1i3TdMzCrTxT6hemVBGPbfdehNzCF/EF3wBaMyLc0DRzF97o60K3oLWaclUXK4o/onFnk0YsfQExO9aIoHM9VAd1+Hb4SMUE8xRqd2mGLRmnKJGIC/zLDLGyTLA0AD35QbBy6BxY/O1nXUiblETUf1xO06qHV8V3hDrCFGgN0gcMfYpgntp/QxujXHV/DVGvIpcCigkk5aM1+9UeWuOo1ZDPaoAI6xysCY8sQQcNAWvMsQVuhf3nQvsntrSuMpNCJWkNyAXFzuJUTnFVx+Zp8eh1xcjJCWFOWxvFg6YQpob2tQcfQPMrpF3w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by VE1PR08MB5823.eurprd08.prod.outlook.com (2603:10a6:800:1a5::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.23; Thu, 6 Aug
 2026 22:06:54 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0292.013; Thu, 6 Aug 2026
 22:06:54 +0000
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
Subject: [PATCH v11 16/37] pinctrl: airoha: add set_direction() helper for gpio_chip
Date: Fri,  7 Aug 2026 01:05:54 +0300
Message-ID: <20260806220615.4078303-17-mikhail.kshevetskiy@iopsys.eu>
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
X-MS-Office365-Filtering-Correlation-Id: 01be1666-e8dd-4453-571a-08def4070641
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|23010399003|366016|1800799024|921020|38350700014|10067099003|56012099006|11063799006|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	3pYqaWJ3g+ZLxOgxaDq1EEn/ou6ANsZBVLi9kDO9e7NQS0GxV6fOZQThHQeXzrelaJTibnYN/8PmJd2yyepBkASdfjf8bKnSzIty8lTIQZPo3pMptWlQLA+ka+qwX719l4ewGPfGu7NRhoD9nk627dMJARARry3PLuoDAHyShV0GwF2bJjheX/3lo5StFt1TpoP+3//FgGqvtDFWi0OqbYg4LjCZSUfjWgf+FWLdOcpHn6nj4WcBBp0KFw8mBbTFLvsbmjXYzC+RB+HdFDvr6IWBD0JvEitSufs42cXfEaeffBHqlMnVA9CheZNjeCy8mZ4dQ8cnTl61cXOtXtVTWt5/AdVqvrHD2hlfMKAjok/3+F/NBIsa/mx4N1jX694edkY3xIkZfUrg1OmblYdSg2RPITQdIY1Mlj5Rf0WWb78dJNBIGYVmrLB1tFoCEa7puxHqr2jmAf8Ya0tSFsSdcPpDoDaCXYihA8l4dN2jynwFElffC0Bqf6iWDJstJx1BY5bn8R/bmPhjMSYUaDu6nr/0PetVYbdfd+SHLat2R6Kevu6Cjq7EsHCFcqDPMi8N5spKWpjHc6ziqEg4+mHUwf9ZEmXmZopdWdt672iJwee5o3tr+9Xvj8cCK402zkHLBKaXQeQ2EbzwDust0sQCcIFtmBu2EsqHFOBb9X5xFFl5BD+ZFNBASSjSA7epaAhbZiOB5JQ4gJSZDqbNT3mSky36rQMIHm8S8ZVJ1XrCgtD0Kja/QTykOhEPWtT6uTqq
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(23010399003)(366016)(1800799024)(921020)(38350700014)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?NSBZQ0A+tiLj+WXDAgaC4PVHp/dwPZeMoaqh+yPMyK9tYSokqxWcmZu93hDU?=
 =?us-ascii?Q?eYcw+bL5akT2SaPBc4DY9otb7h0llHcGMMUIBcIAppXKKMAt9OsAxZsRzhG+?=
 =?us-ascii?Q?XIIZto9Jqh6hY3NxYLvSKB5dMjzDGGKFolmWlRXPx39v6uuzqX+jyM5ytAO6?=
 =?us-ascii?Q?d3iGKD19hrE+iV0fFaeR3JPXZvArZt7QGJTj23ew5GZQ+DX+z1KO0SP1WlWU?=
 =?us-ascii?Q?7eL6M+XvhwYqWXahZPzTyEJdXvSsm0LIKqN4GEBrbQfPadZTIDgshL/+1OcF?=
 =?us-ascii?Q?5gRDFUMsg4mGtokRXnQkSyUkGucqL+HP2ZABgelUpltuW40iphO3hvm8HSMU?=
 =?us-ascii?Q?2uwFUjWcS+BvMNAWTvDc9ssMRdpgBLnxN0R3YMq8kd+7mworxu1twBry6MhL?=
 =?us-ascii?Q?ejz2VLMRC1MJReIpSkbKqqGekcVK/6u6jI++RnRBHrkzN98aVpK4pfCtUjO4?=
 =?us-ascii?Q?pZL7zsefZt+n4Q4kNkfbB97HlUvx/BSPlgHuoNIERdpz63o7LTmWG/lIjiCO?=
 =?us-ascii?Q?i8tn1WaiDlFnRW+Zr/lPn76IfkBYbKcy7apiFsAnto8t2iB8URoGhhHzeVMT?=
 =?us-ascii?Q?9LZesSUMzczhSkZ+G+fCKdm/icXBQQ2WJnsj7mLGueFA0jZEeks9F68TCZnt?=
 =?us-ascii?Q?RaS4ARdS3pVQjb6m2OsgWTmOVj1S5mEp/ThYoynUV8v6F1JAZ6pjMMfhb9In?=
 =?us-ascii?Q?r+HsllpoERt3iS5wvA1UPjLPsRcF5Wr5YS7WV//p8L9mrBASw2UV29vyToSg?=
 =?us-ascii?Q?SHZ4P79IkdgePK+ScJPO12yHyHaRCWrsWilis9mL3S2W0UPEWfXdLP11m7zy?=
 =?us-ascii?Q?roT+04s4d1aisxQ4fvE9FKPTrdKeDgACUXbNrAY8/a/IPXKmlff5XNNOgEgl?=
 =?us-ascii?Q?Kt6XRpdZYqBwFjhtgjLpc2uYYUjgtsTFzYDBjguNDZLvYYE8W7FXSosCEhJ3?=
 =?us-ascii?Q?xsvRWXS42IacVUL8ZI3eKIMMq/RS7XfOYAiN5D91flHl0SRAg2JKlasE8iVn?=
 =?us-ascii?Q?/dLAkT9fR0gp0giXMyT7PKNsr68ZplgRfxZhBszB9dDj41+3X+mfA/XU/tmZ?=
 =?us-ascii?Q?j7AeLABj9uYfklognF3sEMi3yHAyNvmpiz5NHfajN1VNdQIb2rPK9xBvppGY?=
 =?us-ascii?Q?27vhD51NkVllSnWH/srmqpkAV7IbCqCx4tBie7/yZjoPAJVdOlwa4ggiEaLA?=
 =?us-ascii?Q?moJ2O6j/cmtOjHGPx39Kfynkz8QfkKhBdJg100FuJOZ3CH6QpbzdFZmugdNo?=
 =?us-ascii?Q?byZXynCKDWEHao8oF8w0hUxQfdvb9apBMGn8WRri5PXcqklJGdTrDgWahks3?=
 =?us-ascii?Q?t6jwrcAD6hURq2/9fxt+7oJPKTa9mLHLsJQTdDwuEWCcr/LQCvGhfQI9HGTB?=
 =?us-ascii?Q?OsbSOsDx8ffPnqQbUyMapAyFz9Dc2NSqmeMjUizpeIlQEEoFOsF4JnkIgxah?=
 =?us-ascii?Q?3CIrVUiQrW/tcVNCLfXXBu8AcjwqPDz7LvbPESCfF5/3MTn0yTY0UzL1hksn?=
 =?us-ascii?Q?jFA+1E62azdQN8YTIDNNt4agzf/4/3zO67D6LdU0Zl1mDUzQfB0K4OPMb+C4?=
 =?us-ascii?Q?qaLEV/OxvJP+Jhnj9XSsK3gUWlsUCqse7/eV71ZgETk6iMz+BlI5hOeUbCzW?=
 =?us-ascii?Q?KYZObY8GHoYJ4irwsbQN/6ubf6ZOUOxIENXJRZUEC4Clx+2NToSx38TQzZHc?=
 =?us-ascii?Q?pVz92qQRDb7PvrkW++ASRUiDeHmZjFI1Wq76NEiqmUDSMAk/moE5owwqQ7Oi?=
 =?us-ascii?Q?3ymTOpWAaDqGoGnn99Wi3evyW20QIFw=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 01be1666-e8dd-4453-571a-08def4070641
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2026 22:06:54.1580
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /JTIaDdUSMAUwwTZTWkaFPBFHlWmb2aXvC5W0GCpGOvl/7v8KaHO0XH2Y6SkeKsDKXM/bRG/92VEX+VW/WsdQLu20rjOFo+R8ptv9zWYXJU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5823

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

