Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11021121.outbound.protection.outlook.com [52.101.70.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 773563E4504;
	Mon, 27 Jul 2026 07:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.121
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785138198; cv=fail; b=iLbNXcsSkMBk7e0Rclf+8NdLI34i3MflwM8GRWADCkVflafmU6cPindjCzE9Axqq0Z0HZEv82kcGZT8vSQCNrSabapkKE2YbdYyMxGdDPBB/DdaUhjiVA0hiyNoWZ43wk1TA419bQ6aYlTSTE+KmI5kuUaZNOX3wgC0380wG7FU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785138198; c=relaxed/simple;
	bh=S0l9qHbI45vzlpD6CjIQMdnpiciiOASIHS4uI+DKwHA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=RUcS6v3AOxnDPnUep5QaHJdFK6L773GkNoZjBL1wIW7oszZtuUV9dtlO4T31YlZgmJXTZOxZDMVnw9vvs5+W1sRak5rnxH7A6gfFWV5rcA5wx5cFAXM5rSHc7y7XIhHee7JXtcMwSD9HGQCRDreCC5VbX79erL9gbj3+JvFZHIc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b=sPbck9um; arc=fail smtp.client-ip=52.101.70.121
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=genexis.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b="sPbck9um"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uJJAP3eTp2JQ9D/jY6SuGhKzTksROqMfXPFpV4iY7kZxnk8xaMV8kXEg8WhB3G1Eyv0lkfav90BykltWO8rNdHiUc2MlFFjdimqJexaMS5l7IYDDzOedc/6uwpgYBf7rRCV5jWP5uy7Dr/Qd7P+LGss96tWJwHfuDRbW6QsxS3pZYtKdQp+MezY9Hups3g1fufb+eHghuwAo66KkrM6YtRfhzRc108slmOgkwGkw3wi1An8NgG0Vk8SD9xnTqSZ3vLXJdbPMQfMd6Zc3XSyzZHwR1nr9AHhLmShem20Uy6qS/Q4mxjOXSSQ5lAWJmhjJ9pix8J2TdHq9wiHjsRhsTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vzg3J7HZCQOnpVkhfJtQ+WPlCfsRgtcaeb/LAYZvVDY=;
 b=f7J3PeShBXC0+5XlqmkBb52ML39mosID4hdzqmwWfv+kwmDuNYealUoB6vmfUJg4V8uZyGX0tyWn/DqfLVRXlwNd2X7UjFoo2WItLgay2lDdvBhAYzaneY5bA+fr4z6mGFTO0iWrm/UnA7WtWhw/HkyRe6XbftvdSASRwEis7MZetX6NlMYzcKOK7X/Xk91J84whkmq83AOcQuvvKVnafeFtMxMxqEww9X+MwE5AwAkaDiF+kEelO7kIP1nk+4y+rHuFrn6W8j2SCwui29RmZ4gbtiyJxNeUihhqsAwPj+5X8439Gjvm0ccBtw7OQKzoOl8p/peXbpcLklbCgMfLPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vzg3J7HZCQOnpVkhfJtQ+WPlCfsRgtcaeb/LAYZvVDY=;
 b=sPbck9um8zYtVOKlTVarq/2iEuY9qlPpbRA1Es3hhVIc59zlOjBYsSVXtHLafv5Yby/Rvz7I+1DPjJVQmTfBEhmkWbQANHCceuW0ixgb/YcDpHSOvJBKDrYiXOHwKjLkh4ZKUtf8mJlqG/JnOznIhGx8vfEPsXJm7kXmtbNYBWNnF2bYXSkyPpYc2yy0gdixlyGBwseWCSC6gk3ENxwjo748jAUZgV6ShxSfhxasl+BgZVh/r6XaZ1zvoVYawUmzxjec+0lstoqxYBVYj0PVYEzi6eVpCPtdrXnGPIL9IvGTkJzZdmPQfBgjP6nRptnbHS9tMmYC7XBoPQzFBDOZIQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by PR3PR08MB5868.eurprd08.prod.outlook.com (2603:10a6:102:81::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Mon, 27 Jul
 2026 07:43:09 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0245.012; Mon, 27 Jul 2026
 07:43:09 +0000
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
Subject: [PATCH v7 13/34] pinctrl: airoha: add set_direction() helper for gpio_chip
Date: Mon, 27 Jul 2026 10:42:13 +0300
Message-ID: <20260727074234.3761170-14-mikhail.kshevetskiy@iopsys.eu>
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
X-MS-TrafficTypeDiagnostic: DU2PR08MB10037:EE_|PR3PR08MB5868:EE_
X-MS-Office365-Filtering-Correlation-Id: d5bfdd6e-6b8b-4ec2-9b4d-08deebb2b3df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|7416014|52116014|11063799006|56012099006|10067099003|18002099003|22082099003|3023799007|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	WsCQ5IuQIVw2wjWBdic7ggMU800tfPx3wXFqUYXWmzpnDOdDgwXiMr4Ue5ifkFj+ccTErSd/NZ9evjpLffmatC6r9e5/u4CcKw/rLClydjjN2x+HU4YokXsm6Ql+0GGyMCD8tU1MTFMxhnY15Xnl3h1zS6WjzRfykxvj0mAwEXt1wGV27ly4D5UQc9YXM9A845MlFcuizKJzOoj8FBAALH3q6kgJbtbAgSxgXWzuoCvMbznfrLkO9H2cItd50lm2GvTqfcBPMrpMBPyFgVRcVCQnxNqUt5r6W1pATGhnDxvV7Ed5FDbjpvMd4jsj05W2EynICT3Mpxvf2whsY6+/1oNTJzU3ZU/yZh24FdW0jnGr5Ue2pi3YIaJNQiLdturFgS/D5AwXIrhvcurrzripIRieh/6v96xSby5KM7JVn2IpsG+wtYHXrx2wakft8kc+0Jigg/Nj5UiAVzOABWa2Vtcf4AjJ7aTiOSLYOxaMhrC4FBDepHHWweJogRmGI3cOmJvNM9MbDKzcIY8cKZdUFprIj4Y7TpJfkQbA6kvTY8keapw9uDKK81iMDyItJVsHUfUPKLgtqxZT5FnZ/MzvXHK7QW5MvXajjhB6iQ0sJvsCnxo0aQW8Leffu6S1QehIK9P6e/xce4yCmIlGiEXvyfKucIRn9geH9A6jrnIpIFDI84iM76KDSeClIa3x2vGrQDbH3Jue7RcsQOWwMHk88/EOFKV/8eBMYWwSpPjdwxo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(7416014)(52116014)(11063799006)(56012099006)(10067099003)(18002099003)(22082099003)(3023799007)(38350700014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?oYtSP+eAKmmtD8EP9pDwYjCiCmMl7WSD1NFft1N24ZMcZtT459VD3IZnLSRB?=
 =?us-ascii?Q?3u3Lq5JSLRRa9nkbOZpOrDKzo2y06+Oi3Jf0WdSJQQ9U6PIXjn8504FbjYzi?=
 =?us-ascii?Q?5BXNNO1wXZ79WjZRnFwHV0cSk9InvxwmI62XXqghRhgKpNGuy0IX+DAg6HzQ?=
 =?us-ascii?Q?71ZLEPXWDB8Kv+5GYn4C0JKNtBHQAWhDxwr31flZjfobgXFHZAUcVeXx4s0T?=
 =?us-ascii?Q?cV7rcj7p4gBw7enrZMbRT7ZPOfXxBH91+167a6N8n2SZ5A0YfjH+4Ae2QDuX?=
 =?us-ascii?Q?kQ7pj8i2WjXpbNDdmcyqx5gAF4GL17dnj5LLK+UjMs7el1e4p7e61lrhQhlV?=
 =?us-ascii?Q?bL8Eknm3AKNmRqhLAOgA9+BSo5KQ5ZYIR+NQOoSAeB4keYYMRZs4jkMKKFnh?=
 =?us-ascii?Q?P+c/HmPEVJ7H7m2QiCR0UuGxOjFCuCTLRtHANNS6RgeI1s6h4GxXBTBqFscM?=
 =?us-ascii?Q?5FJl7cko3MD/ywSlu4kSFWg63AY35XBGGSrns7+kUKXv2jPuCLHiV3UrQBN6?=
 =?us-ascii?Q?hEZuT3IvX/NEa/5IoToc2wP3fqeQ2wnPl4ZQRVOYM4isWg+sPHzHiQptsC+j?=
 =?us-ascii?Q?qIYhzurIS3dMreul3LFqqnPyrdjlSS1bHXbGzj7iuUkXNyHOZoqBEo2alLby?=
 =?us-ascii?Q?hsUxMF6WATzTFYCILd0RLmdff9nHdZWNPgHfhGEgGNy/vcVBBR12pt95Wj4f?=
 =?us-ascii?Q?G1t3Fr+JX42/1HSoQC36Etz0Ni9RoBCboBT7hYHn2anUofjyUAeeeTcgNTPJ?=
 =?us-ascii?Q?c2zaYYPS3IExIa8V0VsPgOV6ZQfthZ7n51BVnwgkMKNamqOij6NPrnMBQ2zI?=
 =?us-ascii?Q?Z22wOST6Dgu8TqOKsgKI184xbcE/bFNEWVzRLrMEkCqkse8BySQo2Wp+eFnq?=
 =?us-ascii?Q?oOFrV9flT5fqgOV0EMjU193gDkqq5QsLBdfuMO5Il6Iv6vF5drb7AkkgkmqQ?=
 =?us-ascii?Q?1l81DxzNwkwiUl1U2vvntYxL2wxahoJcwUeFmGxnNELrAscSIUcfd+oi/6c0?=
 =?us-ascii?Q?fuA4eWuF9apVqDiK1Apev+ZYp2Q1rfc4F/aOTQGj/cqnN9IEoLybQkgGQ3wg?=
 =?us-ascii?Q?eCvrVHhLFteAA1GzyrnLQTqOswc63zVZrSCy7VmhAhGpwWSXaH7YbVQqsZeC?=
 =?us-ascii?Q?oJWYlyjVIqPtLrmL3rmz76DYy5pTKIyfLTmz2AZRyC01iSiBXL1voyVAO82I?=
 =?us-ascii?Q?7AzvV4uXKyU5A8x5RoFAb89BH1d+mWvITTPCf0q0aYBqcPeWdPu9yZ9KTbii?=
 =?us-ascii?Q?7G2ocijXR7RFup8W44oKY4BcoCOjtgQB6EMEKEdygST7bSfrL13JubIM4Z/e?=
 =?us-ascii?Q?vF7S9n0w9hIKE/vJXoYACMGzizJHyw1/iGKkJQ9amsmLcLp/CJ1NCpAUnyBI?=
 =?us-ascii?Q?HuTXmGY9N+0hYIOwyFVJ1tetcyRkLHnwHqQSURlp7ZgcQqVdafEu+Mu5Sqdf?=
 =?us-ascii?Q?QzqDUxog8AxMFO7M0cuqIaX4+JaTUDB3+nuwrDeFU30Jtwra+Vcvt+BBkTaF?=
 =?us-ascii?Q?vi1f53IcIBXV9mdBjcuvFl5NhIyUQQ9VgrvQ6f9wDOp/pjJKOsxWLCRSjcpV?=
 =?us-ascii?Q?0WktvJg2xZ4Mx3CUdCdm2Kc37aj4gsxqRmBu4J3rQNJ0WUvCtGloiCWfHTeR?=
 =?us-ascii?Q?d3zZAPBg3EHdqPcUkuEMCsSLpQF7Jp/0wmbL3Z1529CvHrtjnP/YsOIrrFUA?=
 =?us-ascii?Q?NfompS1+Cf6nDl/Rzs2kF14rsO97nVEWpFkQIkYlrdNaOnflxJknsmhGAdkk?=
 =?us-ascii?Q?HdOwym072LmsfkdlT6MhMMKCd3EIMm4=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: d5bfdd6e-6b8b-4ec2-9b4d-08deebb2b3df
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 07:43:08.9327
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 86rqnEtWwuYJWBhQTR65RUcwYyWCSSNny4vUbouW9tSTvHe1BgqXZctVyqhIqKyIMYKqs6UsZOK/2RGQ4828fVRwjvZp83OEKbDZuPrMH/0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5868

The patch creates set_direction() helper for gpio_chip abstraction.
It also implements/reimplements some function using newly defined
helper.

This is cosmetic patch used to place gpio_chip specific code together.
No functional changes.

Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
---
 drivers/pinctrl/airoha/pinctrl-airoha.c | 59 ++++++++++++++++---------
 1 file changed, 38 insertions(+), 21 deletions(-)

diff --git a/drivers/pinctrl/airoha/pinctrl-airoha.c b/drivers/pinctrl/airoha/pinctrl-airoha.c
index b52eb39c55ff3..faad5d3ada31c 100644
--- a/drivers/pinctrl/airoha/pinctrl-airoha.c
+++ b/drivers/pinctrl/airoha/pinctrl-airoha.c
@@ -2523,12 +2523,43 @@ static int airoha_gpio_get_direction(struct gpio_chip *chip, unsigned int gpio)
 	return (val & mask) ? GPIO_LINE_DIRECTION_OUT : GPIO_LINE_DIRECTION_IN;
 }
 
+static int airoha_gpio_set_direction(struct gpio_chip *chip, unsigned int gpio,
+				     bool input)
+{
+	struct airoha_pinctrl *pinctrl = gpiochip_get_data(chip);
+	u32 mask, index;
+	int err, field_shift;
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
+	field_shift = 2 * (gpio % AIROHA_REG_GPIOCTRL_NUM_PIN);
+	mask = GENMASK(field_shift + 1, field_shift);
+	index = gpio / AIROHA_REG_GPIOCTRL_NUM_PIN;
+
+	return regmap_update_bits(pinctrl->regmap,
+				  pinctrl->gpiochip.dir[index],
+				  mask, !input ? BIT(field_shift) : 0);
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
 
@@ -2667,7 +2698,7 @@ static int airoha_pinctrl_add_gpiochip(struct airoha_pinctrl *pinctrl,
 	gc->label = dev_name(dev);
 	gc->request = gpiochip_generic_request;
 	gc->free = gpiochip_generic_free;
-	gc->direction_input = pinctrl_gpio_direction_input;
+	gc->direction_input = airoha_gpio_direction_input;
 	gc->direction_output = airoha_gpio_direction_output;
 	gc->get_direction = airoha_gpio_get_direction;
 	gc->set = airoha_gpio_set;
@@ -2750,27 +2781,13 @@ static int airoha_pinmux_set_direction(struct pinctrl_dev *pctrl_dev,
 					unsigned int p, bool input)
 {
 	struct airoha_pinctrl *pinctrl = pinctrl_dev_get_drvdata(pctrl_dev);
-	u32 mask, index;
-	int err, pin;
+	int gpio;
 
-	pin = airoha_convert_pin_to_reg_offset(pctrl_dev, range, p);
-	if (pin < 0)
-		return pin;
-
-	/* set output enable */
-	mask = BIT(pin % AIROHA_PIN_BANK_SIZE);
-	index = pin / AIROHA_PIN_BANK_SIZE;
-	err = regmap_update_bits(pinctrl->regmap, pinctrl->gpiochip.out[index],
-				 mask, !input ? mask : 0);
-	if (err)
-		return err;
+	gpio = airoha_convert_pin_to_reg_offset(pctrl_dev, range, p);
+	if (gpio < 0)
+		return gpio;
 
-	/* set direction */
-	mask = BIT(2 * (pin % AIROHA_REG_GPIOCTRL_NUM_PIN));
-	index = pin / AIROHA_REG_GPIOCTRL_NUM_PIN;
-	return regmap_update_bits(pinctrl->regmap,
-				  pinctrl->gpiochip.dir[index], mask,
-				  !input ? mask : 0);
+	return airoha_gpio_set_direction(&pinctrl->gpiochip.chip, gpio, input);
 }
 
 static const struct pinmux_ops airoha_pmxops = {
-- 
2.53.0

