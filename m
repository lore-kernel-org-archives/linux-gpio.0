Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11023138.outbound.protection.outlook.com [52.101.72.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6015946EC88;
	Wed,  5 Aug 2026 12:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785933299; cv=fail; b=J7q+1PIxfc3u0W3Br8w5Dws/tPGBJ4JHLnVNqjDM21s4duZbqolpqKVrxCLZoehIonKS0UGdimuTsoIebwRLJzHFc3Wfyja+T6nwRCndYNF1oKrtv3TmBW6HAuFZhw+4OR8rR0SKSOj0SkP7ZSOLxyVZnDN5HXpuAAu9D8GxonA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785933299; c=relaxed/simple;
	bh=BO2GCH9XlwbcoznlOyn04a/d53/qqLrCcP9B7JUYwSo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Ewp6nQ/QCWB13wCu8WkWV8Q9+geEIkPbxA5bOFJpcdiiTMVZsiquFK6+MkPIqzNi7ez5ADbPy5sib8RSTsKi2sllONS7P0menxoEHBGRJ1FnkdGqGWh0JUWZvkDe+/eJVEmNMH9Rh3AEJNzNNClSrAutMkQwuPyLc8nimOyE/FE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b=Jxk/nOqE; arc=fail smtp.client-ip=52.101.72.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=genexis.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b="Jxk/nOqE"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AtTuqUXiqpt0pyHa2oSThzmENUzeg+AVkl1MDUc/PXXjoWb+WyvlRcUJsVPYiF1PkUa5hhV939xWcGvZnKpjZOH4Mq1lYOURIDLngrZQLyk6mRmyeCEomSycpWUzXZitYifZjR/2JQoKAvzGY/7OHXgdfRqv/Lpyce+vnXa/PnqiEgUvHznvCXgtcnlzmJacoJ6JC37xukRw1PPNXt0VyiHqNgF1j2zybuBR5R2za5OKQYu3KH3HdhSZkHmuz8VTbPaZygp3Fw/JEzGoFE07jvbc/n7c55Oe4p0PNlEs9tQkGZmdyvjlwwzkhIDu/Mer3XgIIbgwpag8QbWXvjuJXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j2VNo8K6EidgJyaKJmguPjxugm7VdlTMby+nYNvzpIM=;
 b=pn8HPFSGcRValBS8sDMg7hUVzIWlZ2Kp8SGyox0cKntVdc9p56KF7/yymhP0GzYff8f70JX0NfJBlPUHbEDTRM/tOS0DDEfXws1MBNDeZ9T9J4Uw7tjOi1P0EfuQFP4K/rW78KzLEbvFSHyUkvoGWTC3dS5Hy+BaSk2D0XXd/gw6NpQbv/Af6/ZVRhfmVmekOmS9zBisQ1Qx2Nh/LUfcfQi+giLBCTRd20upTrYw/vR/qLBdhzywUitDiBTgxQbQb8hfmWiyQlWwLkf5eSSWvLv+26B846toATBZ49GqpyjIbueA2xdVgcO3qkma0NVDnSXp4WFPpHpe39Vr3bl/2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j2VNo8K6EidgJyaKJmguPjxugm7VdlTMby+nYNvzpIM=;
 b=Jxk/nOqEoe8Ow3S3S5087U1x740X9gqWY8r9Xw+nboBYJJE0KoryCySWmW7NwBvNT7tUp5KBRPQCbToGTBfP9W9yw1lTefUw3Gzjj1cRQn0sMPp2WOIhE3S11n9AZp+mc8EaOTuSx9Ldfd34gv236EmqCoJDI0gRoySGOR26YifXtT54lOG1sDkRnDC/g825jtRfg39SnbLX1Nsv/NiVB315XsAQgyOF+tECp3WmwFK3uaJALzwi7ItopcYdSUc3OUHDt33CEru1Fxwy+Q8iG84prd8cFiI9ZZ1WNd9M1A4R6/kTHxsl8USAs9g9dKFKJC2qeeqoW9ALmmQQmL769A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by PAVPR08MB8918.eurprd08.prod.outlook.com (2603:10a6:102:323::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.19; Wed, 5 Aug
 2026 12:34:49 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0292.013; Wed, 5 Aug 2026
 12:34:49 +0000
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
Subject: [PATCH v10 15/36] pinctrl: airoha: add set_direction() helper for gpio_chip
Date: Wed,  5 Aug 2026 15:33:47 +0300
Message-ID: <20260805123408.3767648-16-mikhail.kshevetskiy@iopsys.eu>
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
X-MS-Office365-Filtering-Correlation-Id: 307985c3-00f1-4824-8ae5-08def2edf0dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|7416014|52116014|376014|1800799024|921020|38350700014|56012099006|11063799006|10067099003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	nGn6sMJQhx5WiiqELEL9uNkKo/IRrfxW0fOuIIhXbJOcWZMcwI2R2JL6RapitLwiwYyJsPdZKVZhugwtAWbpWUnTSfrKHXG+5BvJy/xelfuts6OUDXE2EHrMKNs0zE1XuNHWVanlxFsudiwZLXHFf2dEFf7bSA92EG9d7alH2SXjCHF0pRAq1+LYKpOsGjZmK1Ksr+MWhswD9Ho6zvkHn+wGYeHTAHVfKQRdBM4gQ/wE9uRJTVTQnv+1QYnqiysYSizD29Hica/77JkttbFZvxEsQT/LjmD17LNmZvUBpx3svk2fVYICv4J/ZIa0yjKQflxv638PzNnt8N0Zd9cuwFCsaKBBLLVxnbNxtthyHlP0MAalQxFMMdm8Isc/t3vJxNXOlR9BAV7MPAfy2A/GNK5KW68XGYhZtTTkvOAsSN3ixIdXGmEttU0FaL9BNdqk4JHG+/pXIOedbOGLEkKzN2PdxVYFz7ES5WsbuBmq3/j/LdoYhjNwTEdtJrpUe7FJd7vYM5n7oWDtAftv3mjR+gP3Do+/qiQpIa5ohCYCfY57+Sj+6t6BSLZNiHFDwhnAlY+gweUH/TolFJ/FJgjosSE+WCDimKnnuHu1bq0a8DcyWBJh7NBFrW3iX5OM3BxlY0ekN8/U93WfFRwUlbnM6YXSJ/MEnG3ACt7lzXHkMAsZ+yz8i3erM1EV5jjigIJcLqWpL9MZ5G1HHNPpFKzEJF9dgQoYmYKZdwmnNeuFXflSSKJeZge8WtvqQ2JKfz5n
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(7416014)(52116014)(376014)(1800799024)(921020)(38350700014)(56012099006)(11063799006)(10067099003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?9jHNzjYef4DM02Yv8LiT5UoJao0Kh5d40I3nOfjEzZuNYvbeJaBVqmUfdYyA?=
 =?us-ascii?Q?Bu1p27ybcbn18pKspkM5ZHA/F1pcJYPq8Uv8lQxgf0NMoJq9UMwpu3EcNwF3?=
 =?us-ascii?Q?c0pvKhFWL8NxC2w64x5iywMYREf480pn5aMcSvW0MJ5CcSPBqa67besU8zoD?=
 =?us-ascii?Q?d/j/MmKzUoE6XDOnXlOtsXYE+3CfkHIWiEsDx7Jx3vKneOJjVaTTvQutKk0g?=
 =?us-ascii?Q?qYiqpJOTpFcCrIUg1YHGBDfaTpV1E+II91oRp/4fgfpyE2roIeuGdWLCVspG?=
 =?us-ascii?Q?1FSsTEGEy95TR1bXZtntQ4YFyS5nkOonONCP8xo/FByPb3orrSsJex4ByUHz?=
 =?us-ascii?Q?Cp9Bc3YmQ1Vz9v9/i6f4acM0y+lDutBteBN3EvCox/M+dzJlxC3sxSPCmfg0?=
 =?us-ascii?Q?gVM/1T/JC2zuVq+a5E2ZZyq32x87axopXlOacodXOWOi7ZmVGkxki7ZkNEPj?=
 =?us-ascii?Q?IPO1j2M5C6Z3yCjWt6GmRMrOlz1AqnfBDKVsXZMmV/VB7ScQMfIhiXSczbpA?=
 =?us-ascii?Q?Fn2Abi/Je7v/z6TEK0r/VT5qTeZSTn4mfNU7QKsO3xVmfVEKsBspKC28fJvo?=
 =?us-ascii?Q?DyH/S9nnKMzn7M0kXkOxwJ8kJcJZj014LGOchhJNbS2G+G8ZvxyQvnOo7EGS?=
 =?us-ascii?Q?3QcpTo3+YXRk4MZT1J4CEmalyEkVp5dpirfDrsB5hyEUX3GnqUBJ4Q00QlZB?=
 =?us-ascii?Q?6suyQYv0p4e9CJsxOYocTwVa8AOvrWWzsXodCZ7DbaczthBjQQc9OSsgBuW7?=
 =?us-ascii?Q?cf27gpy6gLfAPf/Gog85czntAsB3hYd1uodzclrdpih43NoJXPoOhP2O+uDV?=
 =?us-ascii?Q?yPl7ZNy3tZ4I666+Bl8eGoEMaeKIQbl6R4ECekuaMMsfdgvdhnx5mKIXoBdB?=
 =?us-ascii?Q?W8BpjNLmSvtyp1fv1I/GzS+UubAeBeyhKBRXHBd1N2qxZwUisX1o/VlEh8X5?=
 =?us-ascii?Q?W/YAfvoUE49TyU+S4xX9OuEkchBRONGFhqd9ByEmQHQ2Yid3bE90zXvBUMIH?=
 =?us-ascii?Q?55KU5h5TFtnDDkxMDp5uoteBoydT1ETEvhLu3uaTdaE0aVh8DcFIr8+U5jy9?=
 =?us-ascii?Q?iT6v878y+1Zp6LwhxeslfV6rIK4p+SwHWVaSr82KhXRio2oRv3lwpIkg4G2X?=
 =?us-ascii?Q?vSoqrIRXPSTTGAlj22vpfoEtiaoRuF66JH9QZkATqh7NbuhGzv/wLHuM7+Bh?=
 =?us-ascii?Q?p9qcx2+18TYcU1KyNj3veS6H/mXpjNn53GT+UVn1Y6RxXZpE6PRN1DC7ZB1y?=
 =?us-ascii?Q?gPngq7rqIhgQ39Ok7Ma0subobbqUuJaNcy/Jo645E9roiLgw6ZQwkqOv0P8l?=
 =?us-ascii?Q?7XD2hWYOXKqRKQWjGwUqwLHIKvOLbWJ03w0qOaqyCamdcgVE+aVk7225uo0s?=
 =?us-ascii?Q?5mu+oM8cGo7vIB2//iM6lWjqG3UrUGnVlzhSXoCVpm8BHC/kXUMSAzAmr1WL?=
 =?us-ascii?Q?R1Bjdqy/A6Wt8BER5LOv56xTRPnIsiWkd/d7kbY3HBvCOzeBiWa5XGeFbWDb?=
 =?us-ascii?Q?5Atda8D62c5ensKQgmwmagyQ4BpFwJF2Tvvd+f88BlR5DKYGPpNlm9TrAv6s?=
 =?us-ascii?Q?lck4gzTL87aec1hjjp8pxZv61Ieded1LoC8wApJqE6eRJu7erSTZGcLmtMkZ?=
 =?us-ascii?Q?LNMz1eW/qPYLB6s5LWWWpKFnd6N8yQtUBEb7UBDywbM/9rRliuj4M2Pju/4s?=
 =?us-ascii?Q?RveBqmfM6+4VRqYyxTL9rEH91kOUVK7Yt0qWahrsrSTeaHEULNZ5iHwQkzf5?=
 =?us-ascii?Q?l4XblIMPBAfxlXDP8SjUe7nd8TRI85Q=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 307985c3-00f1-4824-8ae5-08def2edf0dd
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2026 12:34:49.6780
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BJED+J+yYBtxoy5QAkrYBbQN+5k9Ih3uyYh7XhPq1RB1tn4rho55XSumh03iK+Oq+5efXLPYxIITZDeRd+r0z39U0pIWssvrowuJbUenfJ4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB8918

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

