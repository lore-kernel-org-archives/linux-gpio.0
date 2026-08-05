Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11020103.outbound.protection.outlook.com [52.101.69.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10D2D43CE76;
	Wed,  5 Aug 2026 12:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.103
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785933278; cv=fail; b=PMVkeaRJ4Pa6iUUIw3eaYUxx6nkh2/P4HXSHTDFPbUX9wIv/1B6aDH94xgDolEIE0tmn07vSW6eiQSRczPzfh0QVMrFqB+QIBooQYe1WGUk+ZSxD6Zw57DhhxSI8KwcugGI2fpLdiEEseGA89nEGPj793Gxpmz2uBNCVs8ATGGY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785933278; c=relaxed/simple;
	bh=+Un6wmkesaLrBNw1dxcs333w5WTejT5lb19+KaeL8CE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=hJRyj48Ht/OWtBGtVLZP+iqs3P5ivquxewVzZ2GaacS4KLKqVbSHqRYS//fSDQol221LV7Nl2dgMv7D74B5HCZhswhB1JRJsgFl2g7xVHtQ0SfA0YAVqYYBhLKMGK5yQ9PKcSktgQM93EPzJZ6w+cswhk+mxiTwmcTcVxVKpPHk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b=xXF9St7F; arc=fail smtp.client-ip=52.101.69.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=genexis.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b="xXF9St7F"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xR4ejhFjKf79OlIFiarvTIP08CicOS894/yFrNjflrUNu+NUtKYMmPhZhHi+KhhR4l0bf+4dSdl1ElQM//YZIdXCbAEgTX1aTcCx4xBAp10ZIJ12exUrvKnnYOLEz9aZgGtbaQhPTlu1MWG3rPXIMcMosAWTQ79dfriX6lXO5MAdjE8EfSy/m9P4T2R5uQlT8zNCeb7CRefoQVuqo7XunUNjzdJAs/zsUfn3XOzPBjHT++R4uRzd4RL04LRaseHvynNgXM03dV3mw4OW608JR7bwz7qAHM/qZCtUYgrD6DNk1m9PfycL98OMJLfsR+ZFZ958AY1bMc27IBwl3sGMDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dh/kFi69mYW9kmuBoFljUEeL5HuzM8hl9++Y0TTJcUU=;
 b=eShmnJ07bgnSiOVQhEU+s4ia7myGWPbbunXg20kf5rg0R+7OCge1VU71Ia9zn7QYOZtK21RQbOCB3o393IlwD/rBqaZFItHBeBnCADV0TAl66cRRjy1c9bbYBnOphMmfbIr2ouax2E7pNPvsBzQUTNCz2KB7nAMHyEhvjn2L6klDzS86+/7nY7sk6+O6D6ZhoVq1uTARKOpG9/zQf+cbDCpgPANrwS7xPfyFXpX+e+fcWbdiMMuoIu8m2J1ypTC3wxCtF/3vozfa17TPCp6qQfjeiAbAnckYECNXJu7wTMJaUkWStEI31DfLyti08o2zqIk+uf3FZ6FoHI9q0J1zAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dh/kFi69mYW9kmuBoFljUEeL5HuzM8hl9++Y0TTJcUU=;
 b=xXF9St7Fwrnue79OtIawDinsXS16i4Q63WohWkr3qzhBtRztJ+sRNGo6OHDLxWSo0zL4E0QjE+QfLWwUVdJTYTHenWjkYoyI7Fw1oYdIVM61JIfjzeuQhYRQu/zMws6lnjvggK4L0ecdId/aYoilO2mabswtu8s+QPhU3Y/aS7t9gRqifJyme7xCtVCxFq1XjulWnsh1EuCJBeayQm/78MCFDzl2n08oNF3ekteVtCCaalS388ONPsjt2qV2xbIRxbxB7mKtLVdIHIWGRtSiYd6JNq6vhKTykVvQOg8pGdRm77ElmWdpKPM3lXxGaXrYqYx/H9E4C4B7hFzFOe4T+A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by PA6PR08MB10830.eurprd08.prod.outlook.com (2603:10a6:102:3d3::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Wed, 5 Aug
 2026 12:34:29 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0292.013; Wed, 5 Aug 2026
 12:34:29 +0000
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
Subject: [PATCH v10 04/36] pinctrl: airoha: an7581: fix pinconf of i2c_scl/i2c_sda pins
Date: Wed,  5 Aug 2026 15:33:36 +0300
Message-ID: <20260805123408.3767648-5-mikhail.kshevetskiy@iopsys.eu>
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
X-MS-TrafficTypeDiagnostic: DU2PR08MB10037:EE_|PA6PR08MB10830:EE_
X-MS-Office365-Filtering-Correlation-Id: 495940fd-aaf6-4191-bec9-08def2ede4c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|23010399003|7416014|366016|921020|38350700014|56012099006|11063799006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	lCeyRGMqRXorkvoHQ0lnbiyfsJxcE0Fq0gZ9cE5f+f40N8AJvIx4CKoeyvDtcpXvOIOl4lmnnmqL3U8tY+5DnrJoh7DUSk0qGJL3Dsu95DnuHA6myOImGY0Vlbc4MKAE32UXa+n4R227WzT+SOnXHwFunqTRCvxJzoMaeYky1iD/Hxxuw55/Z42qFk8SwZktQbqko+4JvDh8WrI9Vx1KoMGGPy5cWaOMjLk8MsNfRe8ugnjdUWt50hllTHB0zduO30eKnOqVbr67iMgaeAomubzhBqsY2TKZ0qUmaDKDrrbZot0kARvvtSVBUQy94IlM1ZUGSwNBeRIGc5fxZUTaHx5OixN0IIBhADn6pIrrWbt3iY+UFK64Su21Qu3tY14ersY1+pOpTFXuob+xoKlwfsiJT/O3BByQ+JGSkYY3izTH+3a2d53PC5/9kgwIi582m2vQKgbqO06/jnPuYs3Ohgf4diXvVb3VuJrgxg+8aJt8RFK01rv+b/IQobU7LhFu8ixUyO/idD49u/v0kzG2TcF2jtKTpoAVAxjnStFlBfqV/K06YMuU41a+EZU9A6fLR2zZuzgBxDh1T08rBG/h1ixjZSVf8b6AxuN73uwBr/sfQmr4UnNBih88e4tROLK+t/LXE58XjG97yevaBoBcSmzFFPuB8bZLugGZghOSZNAB4XzFRo7a3VlQMUMeSXMJcMN24n4+YJ4vSacvEyBvSdyAJlahxy6UTtfRDo+fvsNrxjC/snnxHIUPs/57y10i
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(23010399003)(7416014)(366016)(921020)(38350700014)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?lno/QE43mwnXZY8VWeWq8DTmsZNU4uoyCzvj/imSLcoQSDKaQR3ejPLXgEtT?=
 =?us-ascii?Q?SmTIETnTMn7UMzRKUGtQ0R/WDdpF9stRiap8oOKXxk5XtuDvDxOi1piheLdV?=
 =?us-ascii?Q?WkWh2IWCsg8f11I6AvUD64FUk55Ml1LBD8Le7s0RvWw8/vRuljoeFUHpcPje?=
 =?us-ascii?Q?H/x/jCheJhht39xNhcAprtX+RMfIan0VNxM+zYCX33WRMXAo9EyJWgE/ZRam?=
 =?us-ascii?Q?tpnc0n03bRlNUko5KnKyn6AU412d3n0JtGgKynEGJPs1rIIIJr85sH8LC88F?=
 =?us-ascii?Q?kjW0loFg4Bhij+WqA794+3rrDuOz6HKDxB/VKKsk5udYuheokYXWa62NTHr/?=
 =?us-ascii?Q?zfTsh34XTW1KX7XHmLM3Deeodb5C/Ut2DmZ4ZnKKAzRwFSMbr3ntykxHKH6x?=
 =?us-ascii?Q?+rTMCFXNIm6APmhTRviHqWpTpq8J3xLbZ1+soP9p/34b4hIlQdS8FOYbjPOg?=
 =?us-ascii?Q?E02CgNMfI1da8fe7b8KG8IhKAjj4bQqf5MUvD51VZZhLSvnmzJYCnubrEYTJ?=
 =?us-ascii?Q?7lsaIB1Ps9JiTYttWi43BAWlVdmE/M0wtaLq8PUX8s8fs/WN3YcAA4Inf8nl?=
 =?us-ascii?Q?CIu/OlRNaJ1spAfwHiaWti5Odb9IlAy4e30JJCWFC6PVm+bf0yIjYm59LSvT?=
 =?us-ascii?Q?Gas/27DyXCpkCDFuUuj6alqRab2t0AW1kr+ZIu0i0AENx8s5oVVK4823bjH0?=
 =?us-ascii?Q?FpoIngH9CyiTAM8finyROKI84Gt+dIQYZqlP5xI4kf3i5qDeCs0+HOaDJAzH?=
 =?us-ascii?Q?69JDQply0evPDQSkDhMRDsfPylauipfu/MRILcnpiRNQ9MozZylYDiPPRN6/?=
 =?us-ascii?Q?HaVobfC8Z12C0rqYKQKNShti1kEJdlD5vZppVEZ4wYiXzKk7e28nPQZ8hX5C?=
 =?us-ascii?Q?iVzZZY8lF2c2ftd0tHVyV5PI4u1a3DreTs9RD42anu2PViGaXC23Wc1oFj+f?=
 =?us-ascii?Q?V9Wk+ITiINqvTnRHXEiTLOM7H47GFdt58qlbZHISFtdFVdvzLKVJwNq8FYu4?=
 =?us-ascii?Q?I47jU24HJ9M1WYrr3P9kKifxemrDGFwOEk3ysR+V/yoGdP4v2o6fiSv+Adfs?=
 =?us-ascii?Q?R3vdS9kKHXfdqvgoCMpaQqIUwP2kN4psbvikNaYaL8QojWYNOZD8SWNDW94p?=
 =?us-ascii?Q?l6k51kck+uoeTbwb2x93u9npHS35Wp4QTYLH4660ruh59gOjfrp3lwkdRqE8?=
 =?us-ascii?Q?MdOcVWBNma8ukgwoRW8lTqM3kBPamGKGfq5UJhsuXQ1BVt95ZpEXvlLIcXxS?=
 =?us-ascii?Q?Mdsx4KV0GRLm2SRFStORoa6PwGqO6DdeL5JI8Veq2vpgL9D/GGfrgM3jGZXd?=
 =?us-ascii?Q?ksWuCgiFSxlt0uDJE5U7rpdEkelvQR7HuaR5SKNI9kQoSACVEvxM9GXOtlG5?=
 =?us-ascii?Q?TFUuLqvx6fh8l9GD0NM5CFTVMR7n51jvhCgTKNZrUksf3bsOJP+c16DYD9WN?=
 =?us-ascii?Q?qp4ux+zhPapCopQRNKwmS0k8bAYwOiSkCzCdfb1ybUJuOv51C1CSC552Vshi?=
 =?us-ascii?Q?7qKU2lxNM4Cme86da9eWOTmnbcjWZU0H439cTV809yI16lp8/igKlCOSskc2?=
 =?us-ascii?Q?H3oYv18+cVbFYcIw4beqtQyhTDjr8jDJ8rbnmSWrid3MCcJjqKuG9SaW/esS?=
 =?us-ascii?Q?k+M/eXnAP+nWTsOwpCjrlNIpS8D6SP+64tPDWBavpyAqKpSXeiCqhpAmgKMI?=
 =?us-ascii?Q?z6dKzbG6lgXQa7PrCE0YORVQ6WukfghQWKWSQJ2rRuJbcuSTtkZc+TuvPuBP?=
 =?us-ascii?Q?TNJzWDCnKMyEHxePLvZh/ESvJWTactw=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 495940fd-aaf6-4191-bec9-08def2ede4c1
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2026 12:34:29.3978
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xstJSFW8i/KPS2M5ThdXpz6h84UNlj5CQjXBNqQgeF/rjoPHEhGsAV7BMNCcLCTmcnW4c5XX3cA871c4fo/uBgc1xxr1m7n0vuO1zelEm/o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR08MB10830

Pinconfs of i2c_sda/i2c_scl pins are swapped, this needs to be fixed.

Fixes: 1c8ace2d0725 ("pinctrl: airoha: Add support for EN7581 SoC")
Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
---
 drivers/pinctrl/airoha/pinctrl-airoha.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/pinctrl/airoha/pinctrl-airoha.c b/drivers/pinctrl/airoha/pinctrl-airoha.c
index e8c018620f1e9..36d14103798b1 100644
--- a/drivers/pinctrl/airoha/pinctrl-airoha.c
+++ b/drivers/pinctrl/airoha/pinctrl-airoha.c
@@ -1844,8 +1844,8 @@ static const struct airoha_pinctrl_func an7583_pinctrl_funcs[] = {
 static const struct airoha_pinctrl_conf en7581_pinctrl_pullup_conf[] = {
 	PINCTRL_CONF_DESC(0, REG_I2C_SDA_PU, UART1_TXD_PU_MASK),
 	PINCTRL_CONF_DESC(1, REG_I2C_SDA_PU, UART1_RXD_PU_MASK),
-	PINCTRL_CONF_DESC(2, REG_I2C_SDA_PU, I2C_SDA_PU_MASK),
-	PINCTRL_CONF_DESC(3, REG_I2C_SDA_PU, I2C_SCL_PU_MASK),
+	PINCTRL_CONF_DESC(2, REG_I2C_SDA_PU, I2C_SCL_PU_MASK),
+	PINCTRL_CONF_DESC(3, REG_I2C_SDA_PU, I2C_SDA_PU_MASK),
 	PINCTRL_CONF_DESC(4, REG_I2C_SDA_PU, SPI_CS0_PU_MASK),
 	PINCTRL_CONF_DESC(5, REG_I2C_SDA_PU, SPI_CLK_PU_MASK),
 	PINCTRL_CONF_DESC(6, REG_I2C_SDA_PU, SPI_MOSI_PU_MASK),
@@ -1961,8 +1961,8 @@ static const struct airoha_pinctrl_conf an7583_pinctrl_pullup_conf[] = {
 static const struct airoha_pinctrl_conf en7581_pinctrl_pulldown_conf[] = {
 	PINCTRL_CONF_DESC(0, REG_I2C_SDA_PD, UART1_TXD_PD_MASK),
 	PINCTRL_CONF_DESC(1, REG_I2C_SDA_PD, UART1_RXD_PD_MASK),
-	PINCTRL_CONF_DESC(2, REG_I2C_SDA_PD, I2C_SDA_PD_MASK),
-	PINCTRL_CONF_DESC(3, REG_I2C_SDA_PD, I2C_SCL_PD_MASK),
+	PINCTRL_CONF_DESC(2, REG_I2C_SDA_PD, I2C_SCL_PD_MASK),
+	PINCTRL_CONF_DESC(3, REG_I2C_SDA_PD, I2C_SDA_PD_MASK),
 	PINCTRL_CONF_DESC(4, REG_I2C_SDA_PD, SPI_CS0_PD_MASK),
 	PINCTRL_CONF_DESC(5, REG_I2C_SDA_PD, SPI_CLK_PD_MASK),
 	PINCTRL_CONF_DESC(6, REG_I2C_SDA_PD, SPI_MOSI_PD_MASK),
@@ -2078,8 +2078,8 @@ static const struct airoha_pinctrl_conf an7583_pinctrl_pulldown_conf[] = {
 static const struct airoha_pinctrl_conf en7581_pinctrl_drive_e2_conf[] = {
 	PINCTRL_CONF_DESC(0, REG_I2C_SDA_E2, UART1_TXD_E2_MASK),
 	PINCTRL_CONF_DESC(1, REG_I2C_SDA_E2, UART1_RXD_E2_MASK),
-	PINCTRL_CONF_DESC(2, REG_I2C_SDA_E2, I2C_SDA_E2_MASK),
-	PINCTRL_CONF_DESC(3, REG_I2C_SDA_E2, I2C_SCL_E2_MASK),
+	PINCTRL_CONF_DESC(2, REG_I2C_SDA_E2, I2C_SCL_E2_MASK),
+	PINCTRL_CONF_DESC(3, REG_I2C_SDA_E2, I2C_SDA_E2_MASK),
 	PINCTRL_CONF_DESC(4, REG_I2C_SDA_E2, SPI_CS0_E2_MASK),
 	PINCTRL_CONF_DESC(5, REG_I2C_SDA_E2, SPI_CLK_E2_MASK),
 	PINCTRL_CONF_DESC(6, REG_I2C_SDA_E2, SPI_MOSI_E2_MASK),
@@ -2195,8 +2195,8 @@ static const struct airoha_pinctrl_conf an7583_pinctrl_drive_e2_conf[] = {
 static const struct airoha_pinctrl_conf en7581_pinctrl_drive_e4_conf[] = {
 	PINCTRL_CONF_DESC(0, REG_I2C_SDA_E4, UART1_TXD_E4_MASK),
 	PINCTRL_CONF_DESC(1, REG_I2C_SDA_E4, UART1_RXD_E4_MASK),
-	PINCTRL_CONF_DESC(2, REG_I2C_SDA_E4, I2C_SDA_E4_MASK),
-	PINCTRL_CONF_DESC(3, REG_I2C_SDA_E4, I2C_SCL_E4_MASK),
+	PINCTRL_CONF_DESC(2, REG_I2C_SDA_E4, I2C_SCL_E4_MASK),
+	PINCTRL_CONF_DESC(3, REG_I2C_SDA_E4, I2C_SDA_E4_MASK),
 	PINCTRL_CONF_DESC(4, REG_I2C_SDA_E4, SPI_CS0_E4_MASK),
 	PINCTRL_CONF_DESC(5, REG_I2C_SDA_E4, SPI_CLK_E4_MASK),
 	PINCTRL_CONF_DESC(6, REG_I2C_SDA_E4, SPI_MOSI_E4_MASK),
-- 
2.53.0

