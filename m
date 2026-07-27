Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11023095.outbound.protection.outlook.com [40.107.159.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6162742F6EB;
	Mon, 27 Jul 2026 17:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.95
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785174149; cv=fail; b=bcHUKofgo1mkWabgeeaRpFf1NUKVFb1wy+o6Y1dsJafz7OaFt3VDWp5LizkTLheGJTnlnSFmF208rW41siEu5ltVv5W+yNRvllX9ZcjFiBqXz4CqHxrweMoE0O/nUQFHfZFW/ie02prrp3wSJNmeYX7/TRPn+yp1N5y5V8Uyfgs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785174149; c=relaxed/simple;
	bh=eLLWiPmCTg6AC7KSUCXDrdTJq3JVPbDmR7JWxUBY8TE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=r+nhcX7apX8bB4vIKVMB54j2ti0/zVo7FtU9OmyadvR1cuAOAWtg+S8EHfMG1sqtLO75QGg2HllxI7+A5oh9TwWzLy38u7enLml+gGLgUzBCcruQGqrgOkvjnJFP2LjNNzMhqj0tnQG5aFP/74RZto/SueMYY0QgfwdiV3O/7H8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b=Hu3oleLp; arc=fail smtp.client-ip=40.107.159.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=genexis.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b="Hu3oleLp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FsuXJjTCpUf5Vkvr/06guB+QzFJFDfho/CeLq/TK5w7HgItDq3lqnV3twsrqiEw2G3DopcaWE2BQrjDow1jaWbTskEjzwLEP+EX0l5y0shBA4vI1lXEAUJZNrrfCWXZhqZpMdThvh63aVKvSduvNSgBa3bnqacWcDi+4MN82Q/sJEpIPMXA6bzQGYp7F3klRDkEhBB6/myU3kcej0p8JHkYhvqkyGncnofNCJAUgWlctrzj7eS/qXtQQZIYOwlONAXB4DcqhG7bbKp78TQl5aLVtzc3DassLX7xBspBrc800huHJ1u/3W2b2jfbTatUmANsx4WFkcGki8rioLRVFKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tulo4KqJ4QmXiUKJ7mENIFneItgJbS8OLdoXMkMcSKA=;
 b=kXLce0VitsYn7ZfvoJbxkyxJ1s8DBDbLceqWuoAJ1lzaFzmOVXaOKQjbFqlZlNUIsts10xLXYMu0RvRj+rWZi/9xk4+xVy6pFk1GqQMh8e+UnejXS7X1NTMfCSItNHQWycxE84fWKeU6JWwosxQnsAT2Di649g6rqVivVtobICHev4FgM28J9ZiC0oUr/9m8RRTJ4PmeCcNlO/2/nfBrlGtcMUTY1Y1nspZrN5XpmGJSUNyY3fyEQQUePJySlTFI1GkGu4KRlWtmm4vvwI7QGz8nxvZeGf8FQwt6RTEv6yaORdF2MIbgyu+pZDsdVBT1J+Z33s+qgxPwlh18tUhfMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tulo4KqJ4QmXiUKJ7mENIFneItgJbS8OLdoXMkMcSKA=;
 b=Hu3oleLppJWJPsk9JElYbNalhwoQkilwgXcEMuOpvdHPQ0YGw2zowR+fX+6nHMWSP4CL3ALdwD9O/cVtsfKH7bquvab+xLJDEXzZSvHx9c5jm8vHOpNck4sqgT2pDbC4krENPVLuErVmL357f2UHlOQqZqqHPec7pTSMWxOJhN0JXAgmJwIuCet15Ly7qymoVbIB3yz3tGC4QcnSvA/a5SLvTE7qm7k86h3ztk/3pLBwmP7Q3Wl3yAUVklC5QIm6WOCQdI5QgOvM9BLIV2Ax3NO+G8aUYZH5HKTHZETDbZZ6NUDwUePuPDXATYtZ5eGAIImRxiQH7EuZVekMquHVJA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by PA4PR08MB5888.eurprd08.prod.outlook.com (2603:10a6:102:e8::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Mon, 27 Jul
 2026 17:42:15 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0245.012; Mon, 27 Jul 2026
 17:42:15 +0000
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
Subject: [PATCH v8 13/35] pinctrl: airoha: add missed get_direction() function for gpio_chip
Date: Mon, 27 Jul 2026 20:41:19 +0300
Message-ID: <20260727174141.664933-14-mikhail.kshevetskiy@iopsys.eu>
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
X-MS-Office365-Filtering-Correlation-Id: bb962bae-e00d-4f51-e05e-08deec06658e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|7416014|366016|23010399003|1800799024|921020|38350700014|18002099003|22082099003|3023799007|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	MX3BoXKJdfKbNcz6zZW6AtEBGOJ4O+iQWfyz/xXV2Nab1unA4tak+Yu7KuFvpCntM9Au92NHXDXmhzSSntpgb7YznyYsmSHDuUZxIOzBGz3rlr0hAba8C2msUhSwwJtXM7moIMBrTGK0O4j0BasWYoZHuboDopBaom9Kh5jsgyRApAdt2Mh+KEaJ18bf4gb7ir/7JsqdYOktX69VeDFeyiwVa7ElsPI6GwT1rSEEw1Bsyc7gsFzuw85/t+mbBSgXBb81vT88c5oMAyh7yruYG2yeEgt4LePCPat/2KKW01zg3kiG3c2gl3Y5tH9Y39JoCTYzijuHndCZ5aSIoULmMSIIVhSuBAQIGtQ/c1TQj0yAQTj5sXfcToqWUlhskaWeAmt37ZpCXoxtdrXEVAw7Az6Iq+vSNDTquecqxk3RBn8aYzdYYjZoIP5Ef05t7HyAF0Vcn96xzru3/EuZAmWOy63X5HmpaiKA60qJnbkgyfIyCEJnqtGQk3WG1kvaVFFYOqvS1avi6Cbo/XvBWuQGvkRlcehFAADvzT2V6dXa98Ef4PNdrzhMYA/JtsUPixefstnghukwb7YEby9fuujuk1Sfek6QnWcTEx3N/FEoU3zASMV7kebKaSIaZXcm/kJ38czJwq6tTiFbbfQAZJiUXvNvGFLs9NOY5Jc4DHYt8SEYslp3jnZ0Lyr330mU6+n0O3Xa65rgEVeI+NbtB3WoMqfcmYtQezw5WFkYP8QiYwCqQLF29Ez2seiJZ0yNzJVi
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(366016)(23010399003)(1800799024)(921020)(38350700014)(18002099003)(22082099003)(3023799007)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Xb01c2cZY+0tT+X4Dm2IRiZFqIn7Jp/sZApAjMgzzZ95xO1ndQcabI2P6L7Q?=
 =?us-ascii?Q?afqOegvnQK93nxkQXFHDYX8lMWjlEi9Y5e8kNJpj+bixdH7EGAOUbm4CUnEZ?=
 =?us-ascii?Q?//rRIE8U0Fk9xP5L2s8yX8CK0oCyjMSlrSrcCeojnQJFRLXX6x/8wnzzvCXO?=
 =?us-ascii?Q?Pv8Boj+CN1Jyr9dDUoNKnGKi/N/64S3Qvk6/gpD2SidI4X1o45N+msQ4V+Sf?=
 =?us-ascii?Q?hnkTddgnv+oNTFYhtV/UdCwfe3j9k1wn2pyLq92qBHnJE+JbnUcwMYNmAZPc?=
 =?us-ascii?Q?zrshcJYo9uG0R30kxBqWuUAYmUm6a4uCFb5Q/B3EzaNsjFtlyas8hcsDxvCX?=
 =?us-ascii?Q?FEu6tP0qR1h6PMh0IYF5e5L9myo6HmETlXnS/4DVl9fmHsN0sW0mcxtagdqu?=
 =?us-ascii?Q?/ps4dwFCxlQt/iq+ECDHdu0N7NqALpoXHTRyMDgMApa/Yi8ZfqgE5ybiDYh4?=
 =?us-ascii?Q?x1caN9+BLIHHDdVGvEF4H34j5btNxue6q9AINM1WtbtVvpp+vFWa3X+uuTBD?=
 =?us-ascii?Q?lljA809vN/xhsYhrLHxeHSrS8QmLfWnYsocAp5ImOX4LMgNWTUX8R38CS+op?=
 =?us-ascii?Q?/jlqc+8sLfVj7l080HzX4y5TevlNtrtuHjjZguS33IDKB9NtJtQ/3/T9lf1m?=
 =?us-ascii?Q?r0EpeY6lPv7qbKWSUpuRCNWN0fDPS/c9L7WZuO7jfdTwGwh8joUvhVM63Nta?=
 =?us-ascii?Q?XYuEs7x0Aj8neL+C5+t1aScj8SBc/20eRnxs/Oc+h1wwXZdJQlInKm8E2/Hf?=
 =?us-ascii?Q?Lwx5GpD0W+g3rXHIcv+dY5UVUctWrco+llT8Aw6VTK1C0ApmOBU8fauXAGLY?=
 =?us-ascii?Q?th8Q1rwyzVuyk6rXnTpH4doLvcSc4k/qgPsv48UWDXhtj3N/uwmWBvv3skSn?=
 =?us-ascii?Q?p9188rxwmQf4mntEPBSQtHSLPCX+pmRh+JSyINy5CQQ9uzmfFYiwHLujwddA?=
 =?us-ascii?Q?+Bu3esnMwMyQmDCZgjq65XxTCyzztGcAXL3fDGtFlXEI4P8kqlhCbcqlNk+s?=
 =?us-ascii?Q?W5aptWVkKwBuCyNq6BXonUlOwsaWZyjL5eQiLbfRQRZ8NibBRQSHg+VBccKE?=
 =?us-ascii?Q?JQi1bjyouTiRc3WLGCNdORvDNnVAMNh/stCyAFPRfgouvCI6DXHNu5Wgmnks?=
 =?us-ascii?Q?9Ago4B0RDigHvmf39F29P4J1/MKvR6aRrrzxNngh2Swp9GnAwu7HtHd24moa?=
 =?us-ascii?Q?n8ktA+zLSU047vX5e9x2Z5/E71mczxL55lRkWBl2pHuclzczJcgnAPv2Q7Jm?=
 =?us-ascii?Q?dFrehzxgkTb1l0wxAW8VdnfhlXXcKmguJPvKt5smui4SmkV+CcD4F3P7OaDU?=
 =?us-ascii?Q?SSsKAqSNj9AnFrg6S1h3rWrRjJMpX6ioNWvywYXHzWkD6AfsXe2xIFemHfad?=
 =?us-ascii?Q?F78+hT9RXWx1+Ah5cTVxcG477vhZJbVfYG8CezsH4R4R+2v2bKFenlqPoISF?=
 =?us-ascii?Q?krw+dWHhED5KmSlCCiwQf2S+wMo7YChzxKKHtc9Zpu4a+Y1qaYRRR+14VICz?=
 =?us-ascii?Q?gT1AG75tXfZQkjT91aGai55ThjAwQ6FhajgO5L//auuso8EsM4pZXqqj1Cf9?=
 =?us-ascii?Q?BpltaRzIQBgvQaFNZopKi+Ep9/v5b5sc0LUheeF5+9wXEUJyLqsv/C4psY+H?=
 =?us-ascii?Q?6UWxj1fG8lVO8gZpSsVxfWfkGPUiCfbXzrUYxtShuoxbBnVVM0+8UZxuXSdn?=
 =?us-ascii?Q?jUZJC2OSHTS3ljLnTbf1GSotrG0PMXrM2oKCvoO9EbYMg8ysTziwAPAIK4a8?=
 =?us-ascii?Q?0gQSKtOsjEBXfaI/GbjCYmZRiIJ+pxQ=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: bb962bae-e00d-4f51-e05e-08deec06658e
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 17:42:15.2174
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Cpo79KcPzgFA7hh1P2v2bJD8XXVT6tu2VN7YVhkUsp0p7NkPocLXdU9QCpxzXBEt2WCi111L+yVmEw7YKO16zdP2QSjgG4e/6oHrjzAvEK4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB5888

This patch adds missed get_direction() function for gpio_chip.
Also it reimplements pinconf's get_direction() function using
newly defined function.

Fixes: 1c8ace2d0725 ("pinctrl: airoha: Add support for EN7581 SoC")
Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
---
 drivers/pinctrl/airoha/pinctrl-airoha.c | 32 ++++++++++++++++++-------
 1 file changed, 23 insertions(+), 9 deletions(-)

diff --git a/drivers/pinctrl/airoha/pinctrl-airoha.c b/drivers/pinctrl/airoha/pinctrl-airoha.c
index 00fccb258ede7..070b5e3c5cb2e 100644
--- a/drivers/pinctrl/airoha/pinctrl-airoha.c
+++ b/drivers/pinctrl/airoha/pinctrl-airoha.c
@@ -2503,6 +2503,22 @@ static int airoha_gpio_get(struct gpio_chip *chip, unsigned int gpio)
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
@@ -2649,6 +2665,7 @@ static int airoha_pinctrl_add_gpiochip(struct airoha_pinctrl *pinctrl,
 	gc->free = gpiochip_generic_free;
 	gc->direction_input = pinctrl_gpio_direction_input;
 	gc->direction_output = airoha_gpio_direction_output;
+	gc->get_direction = airoha_gpio_get_direction;
 	gc->set = airoha_gpio_set;
 	gc->get = airoha_gpio_get;
 	gc->base = -1;
@@ -2856,21 +2873,18 @@ static int airoha_pinctrl_set_conf(struct airoha_pinctrl *pinctrl,
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
-- 
2.53.0

