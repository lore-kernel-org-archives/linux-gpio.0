Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11023105.outbound.protection.outlook.com [52.101.83.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BABF3DDDAC;
	Mon, 27 Jul 2026 07:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.105
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785138194; cv=fail; b=ewFoeqCw9JDeydO/KY6YhDY6RM0YPglNaMb+UGf24PFawCBOwaD7Vw7y537Axb7T/4RMte+nP9jJMm+TFRejgrGDl5y4Fm5Zh4L5M0Xlg26PP5wG4PkrZ9dHRb1SeEqsmoYCRR4rKaqnD5PVBUak07ycFlo4kuvA/fN26PYz03M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785138194; c=relaxed/simple;
	bh=oOXocBZo+HHY+uRsD4r2U3t1SgRjijP8NvlOL0hGVyY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=HHk/mbvM7Yafx24/eSeRs11gARHx8VJeIgwP/cxMxdDL4536dmiRp/hqyF7pphKWVMBuItnsdjvVq1TSCEByEunGj7VV/mTkWzoiflHuXDzWUXNcu4VrKgWM6jTK0Ipadg7F9MBpCnRyoTG0hFCTE8wB79UvTWj9Y/jJ4zKKL2o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b=5QmUdmC1; arc=fail smtp.client-ip=52.101.83.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=genexis.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b="5QmUdmC1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SIKWXcy2QR+sm6tjP5cPhbfZvP72PQBkxs/OTNBpt1WAKzCwoFCDeVey/TQqAs3GvfY3Gw91ViRDE+wb9yKr8pYHcYMqQz4Rg/qNqhosyLH6yWmDEAOpXgBgGlQE4hN0qS6yL9sxmvS9sesbKhYphzzJGMQF8ZtlOTLe8TmpSMQ14RovmmJtWuDof3krGYOA03ZAEBMn3YWNCvPc+gsGgTyGuxEAgMIOSmGxH7yS0rctvghJovvam3jPUxRL/S9tgB3pgycKDrkuW/yM/xdupK6bY0sf9ybp/u0XWIUS/bWVqfNR5TpZDTgp0xUHjYqvAc9ttlVDLRawSF+Oo55S5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JhzyH9XBuDhEst7c5CXWYx3ZDStV9bgZJ6djKZIlDFI=;
 b=fUPtoFdCTVtV1Ez9+1QE3NSjJDLO0JTKLugvlq9pNk9/z6CfOzm3kptzOMFtmuGIzQ57oWsqXqnedZzOC0pcRTbbJjg5UIDZlPX3UrxCbE2a7nUBxigqeYPv/Bt13xwUdjzgEDjvbrit3hk+xuExFqdxmJhwoguGqcMi0VZU6uy0kFPrTARkonGrBGW1yQz4X0K9i+nQSHuO6CS9Jwx055llyY/PZKt8Z93NqDZEeXhnexkI8WQ2H6TSOnD9w+6VTWqc2oifhj/3VYR6W2nTfo0MNkAsptRM+dOASiWSjOLzZeTjgy7hLyHCV2QtVCmSjo3Zj9awM5uAbMXMkhuF3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JhzyH9XBuDhEst7c5CXWYx3ZDStV9bgZJ6djKZIlDFI=;
 b=5QmUdmC1GyoYfzF/Gytwim74R4Bcozh05exoNv7GvNNojBI/dkhv12ZTB1uLHxffOmySYnl9s0VpPi2ZXtjLtHtp8o1cw6Y3aGzYuuTry2EB6YuZTX1vAXYfbQpWavkoP8kzY8ezFSLcxNezl7Br1/bRbtfd8K5URbMIVbJw/OYf5hidT3Heufu7a6dz9j+iE+Bu+dJgCPGbIFmwdkSozWzI32rPfMW5rrdPCLg3q6bFEU4SyKa5Z8p7ODtxCVPlXs/sRtqh3OxIqhg1KOJ0K8D5LWUUG5aAls/fs07CUa1TIp1spYcCnuEyREDtlBsFLX6r6+uEHac8CR6gH5mnbA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by VI1PR08MB5501.eurprd08.prod.outlook.com (2603:10a6:803:138::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Mon, 27 Jul
 2026 07:43:07 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0245.012; Mon, 27 Jul 2026
 07:43:07 +0000
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
Subject: [PATCH v7 12/34] pinctrl: airoha: add missed get_direction() function for gpio_chip
Date: Mon, 27 Jul 2026 10:42:12 +0300
Message-ID: <20260727074234.3761170-13-mikhail.kshevetskiy@iopsys.eu>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260727074234.3761170-1-mikhail.kshevetskiy@iopsys.eu>
References: <20260727074234.3761170-1-mikhail.kshevetskiy@iopsys.eu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR5P281CA0051.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f0::20) To DU2PR08MB10037.eurprd08.prod.outlook.com
 (2603:10a6:10:49a::20)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR08MB10037:EE_|VI1PR08MB5501:EE_
X-MS-Office365-Filtering-Correlation-Id: 96e2e7f2-9cf2-49c9-ace8-08deebb2b2b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|7416014|366016|52116014|376014|18002099003|56012099006|10067099003|22082099003|11063799006|3023799007|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	uqSaFMgZ4GB7lccc2BHa3EGgNfs1cLRaH86ktsssoc9tuXKJKmUtS0+gQs9LgX1OSDq+DnTKNayk19PJsTJRC4d9l5VpLf7zgV7HiYFZawWi4rJj8ql7GiLUcGGH4Gumkv3f25C9g+JzmAkzWYgiFWT9oRrBLMEi6XoNmArMi1csOgCnx0oimsWsNKkacTmKA1pi9BVYUQuiqe9NiyAcTpJth+fhied87EDDP/HjfD7B+rZClGSMbCWJl/16+CPlYAMDyyTwF+cd3cyyZ1A/kJZi7ve+YofMqTKZiNEZmZ0+8s4lymZruXkMOdNDZ0Gh6Oj1jLt9scUOqTKbYbn27I0ddqul59HnGFJbRb3Hcn5s3akmxowP/uvc6D1wWjJoD4CKskwo7cnpAKgZCeYZ6jXvMGBWDpIOK4Hki8G6xtoGyhomiIktobOEBblRJ1GagVKvSW0dh8ZL6iJk3VTShzlZPiVDy9GmRM6ywR1qM8q3FCIu/Nh8/JID7BwT1jnp1Dx2oPLYI9al2s0Dho/UeXpm6/ynTzAmGzwGVGRDJ/rk5n2JwDJhJyMMeZrKqW6rW+ddquwpxHiGxv8DbC/F1+f5jPD9yit+JlQju/sfB+sBa4Q+G/b/XdIEePyed1H7M9gPt0XsQVaJhpBPXpk/YJlGxeAMxEXQiWV0cl8Z6UU7oljxQU26wxi1an69Khsijejh3Nka5SmPjzM+i3Wah+XRo1bNCWwxMDrhknjgdZ4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(7416014)(366016)(52116014)(376014)(18002099003)(56012099006)(10067099003)(22082099003)(11063799006)(3023799007)(921020)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?oXT+vGYoElfp2Fr6/xbh7JVJR7Mhuv0P2W7988OlF5uNqg3UYY06ve8QT4LE?=
 =?us-ascii?Q?wJtbK05G5HPkUk3d7yPVqRR8tsg8piTzVE5Mvy/+DJaq9HC1I4KQy8raPORN?=
 =?us-ascii?Q?WFtH3F0XL3gtcKbhUDl6ubXiqWgZ0eI7MeZ17X8p0m64SU06TU+bHJ7bdF0+?=
 =?us-ascii?Q?T50sSgNS1bqXTE3qnnrCZTelUdvQ5dGDFCXpEhfjicWSRFh+wUaHQjSs963I?=
 =?us-ascii?Q?lKMiU15rL9mhih4SHoiQdUi71R6jLrjNKV3/8dqkWu8m1x1YHqIGZWjggbNO?=
 =?us-ascii?Q?gNRXR7oDDzgyPTJKXTGfNOmwv8fl9n9NWxcMYiRZXs5Ghk5iUV6j+oNvXo5Y?=
 =?us-ascii?Q?+pHcBiKzcsiKEFmHjcJCWNToSHl9+IoPpfO4IeE3hVW+TnP0RcsFU/y3zf0p?=
 =?us-ascii?Q?q92iaMop4qeLcMAIv5LApNt3Rfb5pOS994HNynYAvtUahuzY3zrTz+qJzXrY?=
 =?us-ascii?Q?tjoAFL5DMVmuNYvQ2fdNXM+m+SNLcOuWeFaE2mAXiJvGrt2Hn1jlldVVk2TX?=
 =?us-ascii?Q?llk0BlBt2s09WHVd0Zan+P1/beiogtyeHbAUqf4y3ESYU1tYVvonLBYu/RDn?=
 =?us-ascii?Q?Szp8dJb78FUlBoWgBn0KLXPu+ro1ixx/NXZWceQkvlyySisPDM4HbJN344bY?=
 =?us-ascii?Q?Wx9XjleeY33vQAMCc5ctLHOBCnD/mO6gaiv03GjJrw0wzy7mOGuRpeCaX0tR?=
 =?us-ascii?Q?kFElvqOusZc3dVFtC04c2FMrfhasYmvVgIs7+/zM88y6m3C7Xgg+Y+uUZHoA?=
 =?us-ascii?Q?TOGEWHjsOJrpyEBBc2//WuBaUF+mSPudTmru8L4Ma5TzknSO0EspqaszIYYs?=
 =?us-ascii?Q?FKRTZtxDEzwuo8qgyO0huLj3BvoBCHzMW6pW+gb1ZoHuVQdqj5/sfKyapvNZ?=
 =?us-ascii?Q?MRF1NJxEGiUOpL8/lRcIh6BFum1xYPRCIgmdkiBmUvhy15sYMEQcuGY6tUuq?=
 =?us-ascii?Q?AGBULSi0CFWfwK4f9ZR1S1qN9RRL+qMHKZ/8VzDHMRSbyAqogmIiEasGyOuT?=
 =?us-ascii?Q?KbiEWLGi0Kp6jtAU+P5ftGqUPiEO13Pmc+S0w1Ntu8BADsczIYVG8vWYhbiB?=
 =?us-ascii?Q?GboxdifjECdm/x42FuLTvO1RQ5qKURKr0CVTMnI5gMq+87rEHEvVc2YFk6s8?=
 =?us-ascii?Q?9Dufdj1rdYHr7TeiJCLNkUK5tzLepNfffBfU9WqswayjqFSQSiKBRzqMMCnd?=
 =?us-ascii?Q?3vIO3NF34j8JG172NJGkikUtwRewZXT5m93jBNYkG7hmLTR69q4HGtni9837?=
 =?us-ascii?Q?Eiy8NhXZSOBK8PJ1t5RFKlQIKYrrO0p8LtHDi272esGkb8iK9rfEGRQgs0ai?=
 =?us-ascii?Q?W/q/mkuS3v5oWPtzVKbj0SbV3mv/0YALAmZkO33Yk+rdl1O4xzMkq+p2UAaN?=
 =?us-ascii?Q?Op+j6Irn1G/2qBGKpSfWZHRvObcHncTGzKj8MF+qc5jt881hqqiyfqivuM9S?=
 =?us-ascii?Q?rHTPGb/MztpXQbvoq7bx9Bv1GunxvlV0yf22leU2vk+nYXypdcKCtFnl6oj6?=
 =?us-ascii?Q?xcRcSEjIjpw+2T8uPaQXHslbHeoixBKKh0Stu3TgiVtK6UR0OqJVdfsXyLYK?=
 =?us-ascii?Q?3MnPRruEgoPrG/xWTACA+hf7e9SnrIpakv2ytGY8vE+0fMnNnDOIoI/8HEgX?=
 =?us-ascii?Q?M+HQS2oo/ymixmXCWW2Yn7wGTnR6c8CXSkMl4kK+EY000yfGuIXB+vqqRwfl?=
 =?us-ascii?Q?76Obj9BTiN1/g7pB857KQLC0PlQY9djf5Mrv733teeZryKjwSEZzEzkTX03A?=
 =?us-ascii?Q?AyVCeyMLXzK4Y8gJl7Q5J4GWTFMfp6w=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 96e2e7f2-9cf2-49c9-ace8-08deebb2b2b1
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 07:43:07.0117
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2lx3XyTdofN71TH8ft4AqGsDAlRhPHQ0AokoW00ohHH+kQ1oGblRyFlAUb35zf+4OVx8vZA15947NB658QOQg03UiyGEufpTB4DMbz1jqfM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5501

This patch adds missed get_direction() function for gpio_chip.
Also it reimplements pinconf's get_direction() function using
newly defined function.

Fixes: 1c8ace2d0725 ("pinctrl: airoha: Add support for EN7581 SoC")
Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
---
 drivers/pinctrl/airoha/pinctrl-airoha.c | 41 ++++++++++++++++++-------
 1 file changed, 30 insertions(+), 11 deletions(-)

diff --git a/drivers/pinctrl/airoha/pinctrl-airoha.c b/drivers/pinctrl/airoha/pinctrl-airoha.c
index 820b7b0443851..b52eb39c55ff3 100644
--- a/drivers/pinctrl/airoha/pinctrl-airoha.c
+++ b/drivers/pinctrl/airoha/pinctrl-airoha.c
@@ -2502,6 +2502,27 @@ static int airoha_gpio_get(struct gpio_chip *chip, unsigned int gpio)
 	return err ? err : !!(val & BIT(pin));
 }
 
+static int airoha_gpio_get_direction(struct gpio_chip *chip, unsigned int gpio)
+{
+	struct airoha_pinctrl *pinctrl = gpiochip_get_data(chip);
+	u32 mask, index, val;
+	int err, field_shift;
+
+	field_shift = 2 * (gpio % AIROHA_REG_GPIOCTRL_NUM_PIN);
+	mask = GENMASK(field_shift + 1, field_shift);
+	index = gpio / AIROHA_REG_GPIOCTRL_NUM_PIN;
+
+	err = regmap_read(pinctrl->regmap,
+			  pinctrl->gpiochip.dir[index], &val);
+	if (err)
+		return err;
+
+	if ((val & mask) > BIT(field_shift))
+		return -EINVAL;
+
+	return (val & mask) ? GPIO_LINE_DIRECTION_OUT : GPIO_LINE_DIRECTION_IN;
+}
+
 static int airoha_gpio_direction_output(struct gpio_chip *chip,
 					unsigned int gpio, int value)
 {
@@ -2648,6 +2669,7 @@ static int airoha_pinctrl_add_gpiochip(struct airoha_pinctrl *pinctrl,
 	gc->free = gpiochip_generic_free;
 	gc->direction_input = pinctrl_gpio_direction_input;
 	gc->direction_output = airoha_gpio_direction_output;
+	gc->get_direction = airoha_gpio_get_direction;
 	gc->set = airoha_gpio_set;
 	gc->get = airoha_gpio_get;
 	gc->base = -1;
@@ -2855,21 +2877,18 @@ static int airoha_pinctrl_set_conf(struct airoha_pinctrl *pinctrl,
 static int airoha_pinconf_get_direction(struct pinctrl_dev *pctrl_dev, u32 p)
 {
 	struct airoha_pinctrl *pinctrl = pinctrl_dev_get_drvdata(pctrl_dev);
-	u32 val, mask;
-	int err, pin;
-	u8 index;
+	int err, gpio;
 
-	pin = airoha_convert_pin_to_reg_offset(pctrl_dev, NULL, p);
-	if (pin < 0)
-		return pin;
+	gpio = airoha_convert_pin_to_reg_offset(pctrl_dev, NULL, p);
+	if (gpio < 0)
+		return gpio;
 
-	index = pin / AIROHA_REG_GPIOCTRL_NUM_PIN;
-	err = regmap_read(pinctrl->regmap, pinctrl->gpiochip.dir[index], &val);
-	if (err)
+	err = airoha_gpio_get_direction(&pinctrl->gpiochip.chip, gpio);
+	if (err < 0)
 		return err;
 
-	mask = BIT(2 * (pin % AIROHA_REG_GPIOCTRL_NUM_PIN));
-	return val & mask ? PIN_CONFIG_OUTPUT_ENABLE : PIN_CONFIG_INPUT_ENABLE;
+	return err == GPIO_LINE_DIRECTION_OUT ?
+	       PIN_CONFIG_OUTPUT_ENABLE : PIN_CONFIG_INPUT_ENABLE;
 }
 
 static int airoha_pinconf_get(struct pinctrl_dev *pctrl_dev,
-- 
2.53.0

