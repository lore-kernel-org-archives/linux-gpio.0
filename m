Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11022110.outbound.protection.outlook.com [52.101.66.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05760439004;
	Mon, 27 Jul 2026 17:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.110
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785174144; cv=fail; b=O245I8olzxZ6K0rgeYcwtk/Ln2d2h0Cen8yRHSha7wTbL6+tckTAq2Q81wA9zhNFNDHrWCSq6mcM3hZnBCuEUNdZvw06DYsxuNKVoBV6/pQqC76Ru/1BZ+V99IpX/UuQ3fUf40pF6KgmF25GVa89n87dILLFmFBr6IDSOUk8368=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785174144; c=relaxed/simple;
	bh=HjCQpNQFoEasCmskSNyuR65ntmHd27fKCXZuk1zWtf4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=MNDU5ZSMVL2PUO298VmWe3teHrJSUW63BQ4jlzGpBFUxoCI6okA+oLfQ5r1v3H7kXnkNzNAjg74H9XPm9q56I8Mz2AfhS/WCfF7RWUPRb+6bT2ZpSkp3Tev8Yj9Z3c9mE/HqlXv3UVG0MlU33QpEwrDSpXr6Puxc1U5jYNKAd/Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b=AAZInBim; arc=fail smtp.client-ip=52.101.66.110
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=genexis.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b="AAZInBim"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bo7woNoUYOGedmdksfwpQl+y8mgmSiwFHz9hw7rE2OmcdWnPLvVjc8zcHRS2A75XmmauR1mvFuChaxaK+gvw7U8h0sAMRa4kvxzBzjQh9OCVrth+FgQZ/pBMJiJM0tMmVlBMn6YvaCnrYVWfXtGtzX0l+zrr7yjTmQ+P5Z7xRwTN0i0cR2gMacYDjZdX13YsJ4fpEgP3stRdi5zGP9UCaspl4gFcaIgmZQiLSuNBWcKWY/l+ABIWY7NJQOrHEb9J7ln19GHPpMk2bIPBYa0KdrDPYXL/S6kTmh0EVktr0LRRRRl5+4DmJXmhxQnd7Lj0ft/1F3HjHx7UwAZYOHKviA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QyAk/KcinT/HHhe+q73y4GkWn5I7Yq1+uJ1iU0BIGw4=;
 b=U5WHzMtD59dUPBczE1XAe+lfLmSHTYOw/Unu4FgDTnYj4K2tHsWV5AjS4UgESy9NlHMtmv+X3lQF9tRgHlje2g0ho5MxuYKd+qcGgi7ey0MTdq2N/WwtM//ZsTrQKmkDqbQDVbBxmEuGGbkFdNkE1dEbZrHZVBzakQKFW+P3gV8eCcBy6DZnJb1t0cfsHprpagsO57k2crMZYvk7nqphn9bxFja21HfTd+bMXjeA8/LkqmuT+5eSsq0yMhODI+fAvxPfKhbp4dRObV657RoP5XHWYofyLXu5tM2HCyfk6IqYMT070GoZ/Or4NDIISevuR1jXr7Okkogp2TYPWDZ+5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QyAk/KcinT/HHhe+q73y4GkWn5I7Yq1+uJ1iU0BIGw4=;
 b=AAZInBimPOOF16vWfbB4h26+tUroQ3wB/Yen3ii6bU4eMVde4ui2uXIT9PKIYwVgmEDvAVjixuEbaScGLrVXg+xGVJwZTkCzsrEv28I+kGMBx1kb91922zzmrFoWB6A4c7qQTejjVOKOMzu+u8LmvqnVxD9UwX1+O5L9dgy/TwvaIMi1VuuaRhfo8smT8mslmWMzMDQ0i+rgzU+hOVkmQVgYEKfBhNVImJeM7EvgjWhrhanfVVqVcun4RXfjVzBejaQJrKJaGBwCU9ylqaUnZVbpjb0v2BjctSlo/lIEcoEJVqXVxiR5PmqR8UZlRWs3hxhzca7921rXCqKji7y0GA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by PA4PR08MB5888.eurprd08.prod.outlook.com (2603:10a6:102:e8::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Mon, 27 Jul
 2026 17:42:12 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0245.012; Mon, 27 Jul 2026
 17:42:12 +0000
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
Subject: [PATCH v8 11/35] pinctrl: airoha: an7583: fix muxing of non-gpio default pins
Date: Mon, 27 Jul 2026 20:41:17 +0300
Message-ID: <20260727174141.664933-12-mikhail.kshevetskiy@iopsys.eu>
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
X-MS-Office365-Filtering-Correlation-Id: 9c90da3c-33f8-4064-7c4d-08deec0663b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|7416014|366016|23010399003|1800799024|921020|38350700014|18002099003|22082099003|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	8efKQ4/juN860q4rTGf0OD6/CFyolp1IRIG2G/i648HwylciYkOt9gBlnWGGuMqfXzOeUa+qtLP8MtwypX4L17ME2WjmRxEIETMr2i8CxS0aBO1NuHB+ug+rKz/CljdYv0v90eHxNWxWNtf8Ubg1fSBRwllVszN621E2DtYZ5OnlvBPX6H9aWQjvZTGOHdv+f08W/KrVVmp6mpF+ZsK2boFAgiOIMA26krwo96eAxRPux7p7Y+SK0+LFF10cCZInwh0AC1w6U9XCkRtJD/kmjWJUUZAFnplSyvcXMKp8ShvKxJ+qktz0pn9NpjKJuIB01QATo3auUSaE0qee/enHZrprn8vVGmS8qJDoHSAR7qSiCg8301z849eZpxp1ZcaAcwgPTjCr5w0zKlnoivD8994petz62pxz9tbmeXiEzQ/5cahFcDsrOg8s/r4OJXzFjiikKFe1gwVxc0dn+5GGry3S9tFcYHMmgR1eeoHbxd5sg6ZCXEhxuWgrPeUSnCqZQyOvzbFPsgNCNAcobkn68fSup8BDxDEuwC1YZTfXHACz5Jg/JvfoLfjNN7hhULMVZu60iDaB3sGR1kevDyVdBqYqUlAPGOQrXmP+Ckxzu+/+IAanqKpNMLisb52BEph93I1pYBqjQPlgKCY9GJ2mv86hQJVH3hM2dwFThgRg8BbGneX+DAi+5fZte3UJOyJ1SKWjq+qHHjUdYTfltzf7PBq16LCVcFjf0XP0u0XZRxE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(366016)(23010399003)(1800799024)(921020)(38350700014)(18002099003)(22082099003)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?NsEYN1ofZLv6pTG5/+9vWyTfu8Xd15BFG9JZ5+3FgxSCvaVlTCEmJEFN2fkf?=
 =?us-ascii?Q?slR8EAKfYCqOZILrGpYj6Kb+QduoqMfGE74zGX2yyEj1osxdnohGVEYZIlEg?=
 =?us-ascii?Q?NtmcGOYjyKUem3DigQwIzq3l8t0pqbTpC8c0CkyfbbbEOceQDtmCsVUxNdVX?=
 =?us-ascii?Q?Pqff0W+XZNV7qyHL4wiGO3pjEVXT1LSGLD0k/TFH3eeItEnWcaEJ9V6KbI4E?=
 =?us-ascii?Q?21c7yCU9At1qri9JASupjFv2s1qSveIgcYJTy/9uzFSc8jgbLXyDcmHB8WFm?=
 =?us-ascii?Q?agiJBioRC/d6c5enrG66T44IaXyMqKVMLZlJceQixbD/Ls56c5thu5A5qoUc?=
 =?us-ascii?Q?QVQlcEkczXT0DkXTKAZGI4RuHUY8UcJ4V1TSSKGgyj6cjMYpTJD1rpeZNDH+?=
 =?us-ascii?Q?/6V9qCPWI40IHZozN11qrQMgqWATGa42xD7Ck/FFdOaI3uQuNeh3NWtkCeYF?=
 =?us-ascii?Q?xaNK2HOE6FUMf9m4dhG4h5mrUJj6rwTtnUfld9uUs4lcXrFgcFrYbkbAeUaF?=
 =?us-ascii?Q?WRvGTusi3ir/DvvT5GkOPJTkV/QgGLqwep1u3dMvaGJbSkl/j3uYNb/ATyWn?=
 =?us-ascii?Q?LpfgIHNJ1+jfCqZ90uA37NXY0OrWHQFQEoE2kd5ooenfQtBZwgNQcmrSUZb8?=
 =?us-ascii?Q?cRtncmPphV47DT14dItNX/U3ynLxNe99B/GaLfYaAqiwNF5wpKnMiEYgq+qs?=
 =?us-ascii?Q?XI5esoiwlG5guTTZ4D0MKyEDABMyxbKwhC4HvAslR0cSJ+YJRvpaBvgB9X+D?=
 =?us-ascii?Q?aTgeAFLZFeLLySI/Yk+HyONTepCIQkm2hrlGGdQxPhu1P0oshsQLsT90VaO7?=
 =?us-ascii?Q?axOE9uwLtRBVvkokTUyzaBu/F1mecvjqvMQrjZ7sT3t59ixezJHkclwEPJXA?=
 =?us-ascii?Q?MtikrAKARIBk+BQLgnXzAaXZe3QhuTZSS/MhE/5ZbG7UYoEh4jI+dyqN2K4H?=
 =?us-ascii?Q?wSpEjWyHF6HgY1E8U7swvML5/oFMY78bBjMsl1NpV2K9hMRjVZlkgI3ksy0z?=
 =?us-ascii?Q?Op27/TNfY/LEyjoXVXMdfaWAxsDCbK+WOYH1EGvAF6pR9KWiHp9PeBJeYZFl?=
 =?us-ascii?Q?Xk93wh3raHGYr8dvFq+re+EyTQIFcehFsgcsHPpZxd3xutYR0mD6VmiESIm/?=
 =?us-ascii?Q?BcZIFilaXsplztesaW5xGvrOrt8EaeF9MUKA2u4T2jTs5ihqcvvlZjHyL84s?=
 =?us-ascii?Q?aaS/PjW2wuY3TRzUi21h/NtgOJqre31OUm1M0HXyAOIRvakZWFfW37IZ6xWy?=
 =?us-ascii?Q?LxwDbhvNukGEqKfG+kmUEH2t3t3caDj6P9pTOF0On+FEMIKcm29D45zO6Xsv?=
 =?us-ascii?Q?qWkkK/oKeY+QPeYCFjxjRpSvtBI5GMm++MroyWxZ5tZ5ST77+puj/K4kKor9?=
 =?us-ascii?Q?C9QvPATs+shZhpJDhgPbN3sW/mfDjX3+TPvycmakrIiE7zKFbebUi1Qku6bv?=
 =?us-ascii?Q?QRYxZSLgIqJdbeimSpDaEU8rN6BZapkMj5bKV49RW207Qp31w3GGz4Ave7XT?=
 =?us-ascii?Q?MzYPQUSrxVouEl+H0FGPJX/KGZczjWI4fkBzWPZumosGVqTs+xFFKcD94kmG?=
 =?us-ascii?Q?bueOvN7KUd2N9KUO0moP1M/ibnk/hFOIq3L2b2DKTqiWe57JJ45XvJw09++g?=
 =?us-ascii?Q?4g16rAnTtF8zjV00z+6wgH6MJJZF+IJU9eCPuywyd9n0eAr5c9CSgk7KEIWW?=
 =?us-ascii?Q?loNhBc7kxKxJ4dFRcuRSlnRZ8Hs6OcQ3T1+8Glxf7V/4UFM6SAqPtJKGE1sx?=
 =?us-ascii?Q?glfEkPPN0zHNaSUYu5V9hsQMNTY8FPU=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c90da3c-33f8-4064-7c4d-08deec0663b3
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 17:42:12.1137
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L4FfIuzmwzZnOa/PY7rtPo2Q/X5QMyOXl2JjjQhGAyIZIie3ocC4KQUIupEiEYi1ZdHfWM+7vABNKhQXUL+16zHZ82Ee1t3XOjJer+QHXJc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB5888

Current an7583 pinmux implementation have following issues:
 * pins 51 and 52 can't be set as pcie_reset, current pcie_reset code
   will sets pins to gpio mode instead.
 * there is no proper way to set pins 41--54 to gpio mode.
 * pins 41--53 can't be actually set as pwm pins. These pins must be
   muxed to gpio mode as well.

This patch fixes above issues.

Fixes: 3ffeb17a9a27 ("pinctrl: airoha: add support for Airoha AN7583 PINs")
Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
---
 drivers/pinctrl/airoha/pinctrl-airoha.c | 99 +++++++++++++++++++++----
 1 file changed, 86 insertions(+), 13 deletions(-)

diff --git a/drivers/pinctrl/airoha/pinctrl-airoha.c b/drivers/pinctrl/airoha/pinctrl-airoha.c
index 23735ea63d7e0..00fccb258ede7 100644
--- a/drivers/pinctrl/airoha/pinctrl-airoha.c
+++ b/drivers/pinctrl/airoha/pinctrl-airoha.c
@@ -85,6 +85,18 @@
 #define GPIO_SPI_CS1_MODE_MASK			BIT(0)
 
 #define REG_GPIO_PON_MODE			0x021c
+#define AN7583_MDIO_0_GPIO_MODE_MASK		BIT(26)
+#define AN7583_MDC_0_GPIO_MODE_MASK		BIT(25)
+#define AN7583_UART_RXD_GPIO_MODE_MASK		BIT(24)
+#define AN7583_UART_TXD_GPIO_MODE_MASK		BIT(23)
+#define AN7583_SPI_MISO_GPIO_MODE_MASK		BIT(22)
+#define AN7583_SPI_MOSI_GPIO_MODE_MASK		BIT(21)
+#define AN7583_SPI_CS_GPIO_MODE_MASK		BIT(20)
+#define AN7583_SPI_CLK_GPIO_MODE_MASK		BIT(19)
+#define AN7583_I2C1_SDA_GPIO_MODE_MASK		BIT(18)
+#define AN7583_I2C1_SCL_GPIO_MODE_MASK		BIT(17)
+#define AN7583_I2C0_SDA_GPIO_MODE_MASK		BIT(16)
+#define AN7583_I2C0_SCL_GPIO_MODE_MASK		BIT(15)
 #define GPIO_PARALLEL_NAND_MODE_MASK		BIT(14)
 #define GPIO_SGMII_MDIO_MODE_MASK		BIT(13)
 #define GPIO_PCIE_RESET2_MASK			BIT(12)
@@ -783,6 +795,10 @@ static const int an7583_gpio45_pins[] = { 47 };
 static const int an7583_gpio46_pins[] = { 48 };
 static const int an7583_gpio47_pins[] = { 49 };
 static const int an7583_gpio48_pins[] = { 50 };
+static const int an7583_gpio49_pins[] = { 51 };
+static const int an7583_gpio50_pins[] = { 52 };
+static const int an7583_gpio51_pins[] = { 53 };
+static const int an7583_gpio52_pins[] = { 54 };
 static const int an7583_pcie_reset0_pins[] = { 51 };
 static const int an7583_pcie_reset1_pins[] = { 52 };
 
@@ -863,6 +879,10 @@ static const struct pingroup an7583_pinctrl_groups[] = {
 	PINCTRL_PIN_GROUP("gpio46", an7583_gpio46),
 	PINCTRL_PIN_GROUP("gpio47", an7583_gpio47),
 	PINCTRL_PIN_GROUP("gpio48", an7583_gpio48),
+	PINCTRL_PIN_GROUP("gpio49", an7583_gpio49),
+	PINCTRL_PIN_GROUP("gpio50", an7583_gpio50),
+	PINCTRL_PIN_GROUP("gpio51", an7583_gpio51),
+	PINCTRL_PIN_GROUP("gpio52", an7583_gpio52),
 	PINCTRL_PIN_GROUP("pcie_reset0", an7583_pcie_reset0),
 	PINCTRL_PIN_GROUP("pcie_reset1", an7583_pcie_reset1),
 };
@@ -892,6 +912,11 @@ static const char *const pnand_groups[] = { "pnand" };
 static const char *const gpio_groups[] = { "gpio47", "gpio48", "gpio49" };
 static const char *const pcie_reset_groups[] = { "pcie_reset0", "pcie_reset1",
 						 "pcie_reset2" };
+static const char *const an7583_gpio_groups[] = { "gpio39", "gpio40", "gpio41",
+						  "gpio42", "gpio43", "gpio44",
+						  "gpio45", "gpio46", "gpio47",
+						  "gpio48", "gpio49", "gpio50",
+						  "gpio51", "gpio52" };
 static const char *const an7583_pcie_reset_groups[] = { "pcie_reset0", "pcie_reset1" };
 static const char *const pwm_groups[] = { "gpio0", "gpio1",
 					  "gpio2", "gpio3",
@@ -938,7 +963,8 @@ static const char *const an7583_pwm_groups[] = { "gpio0", "gpio1",
 						 "gpio42", "gpio43",
 						 "gpio44", "gpio45",
 						 "gpio46", "gpio47",
-						 "gpio48" };
+						 "gpio48", "gpio49",
+						 "gpio50", "gpio51" };
 static const char *const phy1_led0_groups[] = { "gpio33", "gpio34",
 						"gpio35", "gpio42" };
 static const char *const phy2_led0_groups[] = { "gpio33", "gpio34",
@@ -1484,6 +1510,36 @@ static const struct airoha_pinctrl_func_group pcie_reset_func_group[] = {
 	},
 };
 
+static const struct airoha_pinctrl_func_group an7583_gpio_func_group[] = {
+	AIROHA_PINCTRL_GPIO_EXT("gpio39", GPIO39_FLASH_MODE_CFG,
+				AN7583_I2C0_SCL_GPIO_MODE_MASK),
+	AIROHA_PINCTRL_GPIO_EXT("gpio40", GPIO40_FLASH_MODE_CFG,
+				AN7583_I2C0_SDA_GPIO_MODE_MASK),
+	AIROHA_PINCTRL_GPIO_EXT("gpio41", GPIO41_FLASH_MODE_CFG,
+				AN7583_I2C1_SCL_GPIO_MODE_MASK),
+	AIROHA_PINCTRL_GPIO_EXT("gpio42", GPIO42_FLASH_MODE_CFG,
+				AN7583_I2C1_SDA_GPIO_MODE_MASK),
+	AIROHA_PINCTRL_GPIO_EXT("gpio43", GPIO43_FLASH_MODE_CFG,
+				AN7583_SPI_CLK_GPIO_MODE_MASK),
+	AIROHA_PINCTRL_GPIO_EXT("gpio44", GPIO44_FLASH_MODE_CFG,
+				AN7583_SPI_CS_GPIO_MODE_MASK),
+	AIROHA_PINCTRL_GPIO_EXT("gpio45", GPIO45_FLASH_MODE_CFG,
+				AN7583_SPI_MOSI_GPIO_MODE_MASK),
+	AIROHA_PINCTRL_GPIO_EXT("gpio46", GPIO46_FLASH_MODE_CFG,
+				AN7583_SPI_MISO_GPIO_MODE_MASK),
+	AIROHA_PINCTRL_GPIO_EXT("gpio47", GPIO47_FLASH_MODE_CFG,
+				AN7583_UART_TXD_GPIO_MODE_MASK),
+	AIROHA_PINCTRL_GPIO_EXT("gpio48", GPIO48_FLASH_MODE_CFG,
+				AN7583_UART_RXD_GPIO_MODE_MASK),
+	AIROHA_PINCTRL_GPIO_EXT("gpio49", GPIO49_FLASH_MODE_CFG,
+				GPIO_PCIE_RESET0_MASK),
+	AIROHA_PINCTRL_GPIO_EXT("gpio50", GPIO50_FLASH_MODE_CFG,
+				GPIO_PCIE_RESET1_MASK),
+	AIROHA_PINCTRL_GPIO_EXT("gpio51", GPIO51_FLASH_MODE_CFG,
+				AN7583_MDC_0_GPIO_MODE_MASK),
+	AIROHA_PINCTRL_GPIO("gpio52", AN7583_MDIO_0_GPIO_MODE_MASK),
+};
+
 static const struct airoha_pinctrl_func_group an7583_pcie_reset_func_group[] = {
 	{
 		.name = "pcie_reset0",
@@ -1491,7 +1547,7 @@ static const struct airoha_pinctrl_func_group an7583_pcie_reset_func_group[] = {
 			AIROHA_FUNC_MUX,
 			REG_GPIO_PON_MODE,
 			GPIO_PCIE_RESET0_MASK,
-			GPIO_PCIE_RESET0_MASK
+			0
 		},
 		.regmap_size = 1,
 	}, {
@@ -1500,7 +1556,7 @@ static const struct airoha_pinctrl_func_group an7583_pcie_reset_func_group[] = {
 			AIROHA_FUNC_MUX,
 			REG_GPIO_PON_MODE,
 			GPIO_PCIE_RESET1_MASK,
-			GPIO_PCIE_RESET1_MASK
+			0
 		},
 		.regmap_size = 1,
 	},
@@ -1637,16 +1693,32 @@ static const struct airoha_pinctrl_func_group an7583_pwm_func_group[] = {
 	AIROHA_PINCTRL_PWM_EXT("gpio36", GPIO36_FLASH_MODE_CFG),
 	AIROHA_PINCTRL_PWM_EXT("gpio37", GPIO37_FLASH_MODE_CFG),
 	AIROHA_PINCTRL_PWM_EXT("gpio38", GPIO38_FLASH_MODE_CFG),
-	AIROHA_PINCTRL_PWM_EXT("gpio39", GPIO39_FLASH_MODE_CFG),
-	AIROHA_PINCTRL_PWM_EXT("gpio40", GPIO40_FLASH_MODE_CFG),
-	AIROHA_PINCTRL_PWM_EXT("gpio41", GPIO41_FLASH_MODE_CFG),
-	AIROHA_PINCTRL_PWM_EXT("gpio42", GPIO42_FLASH_MODE_CFG),
-	AIROHA_PINCTRL_PWM_EXT("gpio43", GPIO43_FLASH_MODE_CFG),
-	AIROHA_PINCTRL_PWM_EXT("gpio44", GPIO44_FLASH_MODE_CFG),
-	AIROHA_PINCTRL_PWM_EXT("gpio45", GPIO45_FLASH_MODE_CFG),
-	AIROHA_PINCTRL_PWM_EXT("gpio46", GPIO46_FLASH_MODE_CFG),
-	AIROHA_PINCTRL_PWM_EXT("gpio47", GPIO47_FLASH_MODE_CFG),
-	AIROHA_PINCTRL_PWM_EXT("gpio48", GPIO48_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM_EXT_SEC("gpio39", GPIO39_FLASH_MODE_CFG,
+				   AN7583_I2C0_SCL_GPIO_MODE_MASK),
+	AIROHA_PINCTRL_PWM_EXT_SEC("gpio40", GPIO40_FLASH_MODE_CFG,
+				   AN7583_I2C0_SDA_GPIO_MODE_MASK),
+	AIROHA_PINCTRL_PWM_EXT_SEC("gpio41", GPIO41_FLASH_MODE_CFG,
+				   AN7583_I2C1_SCL_GPIO_MODE_MASK),
+	AIROHA_PINCTRL_PWM_EXT_SEC("gpio42", GPIO42_FLASH_MODE_CFG,
+				   AN7583_I2C1_SDA_GPIO_MODE_MASK),
+	AIROHA_PINCTRL_PWM_EXT_SEC("gpio43", GPIO43_FLASH_MODE_CFG,
+				   AN7583_SPI_CLK_GPIO_MODE_MASK),
+	AIROHA_PINCTRL_PWM_EXT_SEC("gpio44", GPIO44_FLASH_MODE_CFG,
+				   AN7583_SPI_CS_GPIO_MODE_MASK),
+	AIROHA_PINCTRL_PWM_EXT_SEC("gpio45", GPIO45_FLASH_MODE_CFG,
+				   AN7583_SPI_MOSI_GPIO_MODE_MASK),
+	AIROHA_PINCTRL_PWM_EXT_SEC("gpio46", GPIO46_FLASH_MODE_CFG,
+				   AN7583_SPI_MISO_GPIO_MODE_MASK),
+	AIROHA_PINCTRL_PWM_EXT_SEC("gpio47", GPIO47_FLASH_MODE_CFG,
+				   AN7583_UART_TXD_GPIO_MODE_MASK),
+	AIROHA_PINCTRL_PWM_EXT_SEC("gpio48", GPIO48_FLASH_MODE_CFG,
+				   AN7583_UART_RXD_GPIO_MODE_MASK),
+	AIROHA_PINCTRL_PWM_EXT_SEC("gpio49", GPIO49_FLASH_MODE_CFG,
+				   GPIO_PCIE_RESET0_MASK),
+	AIROHA_PINCTRL_PWM_EXT_SEC("gpio50", GPIO50_FLASH_MODE_CFG,
+				   GPIO_PCIE_RESET1_MASK),
+	AIROHA_PINCTRL_PWM_EXT_SEC("gpio51", GPIO51_FLASH_MODE_CFG,
+				   AN7583_MDC_0_GPIO_MODE_MASK),
 };
 
 #define AIROHA_PINCTRL_PHY_LED0(gpio, mux_val, map_mask, map_val)	\
@@ -1900,6 +1972,7 @@ static const struct airoha_pinctrl_func an7583_pinctrl_funcs[] = {
 	PINCTRL_FUNC_DESC("pcm_spi", an7583_pcm_spi),
 	PINCTRL_FUNC_DESC("emmc", emmc),
 	PINCTRL_FUNC_DESC("pnand", pnand),
+	PINCTRL_FUNC_DESC("gpio", an7583_gpio),
 	PINCTRL_FUNC_DESC("pcie_reset", an7583_pcie_reset),
 	PINCTRL_FUNC_DESC("pwm", an7583_pwm),
 	PINCTRL_FUNC_DESC("phy1_led0", an7583_phy1_led0),
-- 
2.53.0

