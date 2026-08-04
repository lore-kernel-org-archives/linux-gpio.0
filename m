Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11021084.outbound.protection.outlook.com [52.101.70.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 437CC4749DB;
	Tue,  4 Aug 2026 16:04:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.84
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785859486; cv=fail; b=bSOxt0ba0wTEgMBstq+dzHAf51hIm9lKdhuePZ/SilY5/VyawNhELvFrQtpBMDDN5L3CKZIBTzd1/GHG9I6HR6rOz72wyYOM3uSwKWJYWBjZwpy0fQRKOQ/Kz5/4TAC9Yhl/qxqTL54jxiuvbpXQCkgp158uHNqJZtTWPB2luEY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785859486; c=relaxed/simple;
	bh=bt2sCs2S59VyBr1KWHWu2kV6yVf83iUP5pTj75SOr/w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Z6oyHuYAnrrqx6OAjXrLmx4STcxcoDQ85nMFbUxuqrhQW07Lhph5Wvdtr4ZDlP7iQ/mtSdqFI3Iy0zKZrHrgoXQUFxF8xC7OzY0KK4/ddl4ofCGVxp5gwQeqOBpAe0tfR4MyU7mRPx4t5ZYPJIrxsTa8txEboUMedFKyDnnrZQE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b=sjROK9BY; arc=fail smtp.client-ip=52.101.70.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=genexis.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b="sjROK9BY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J3HnkEnrDGPVTMbkj/kk3Gh3nTy+X/GjrM3Ln99o2R+dOGX2WwY9UyTq5USuC611izeo17T8vYfYEVGuIpTgDOxQizh4uC9PONankWLFgmjsAIukfanTKXIpHvFJPTGvzwMdp5DJVTGWBiQ3bZ5cz5Ukcbs2U2SucWKLNnVB5+1WJW9rW5KlHzZ6FJHCpIlEaQoeF5tDXj5AzvsRiVdHMhjGMgX9ghnZPLKLXSR37SE1pgsm+aLxntDRWhIaQ0pbr4/m7qMtBnLFbs+YSVeRkDfqhEVJNwn8R+7DCI2stA5xHqGFDfYcGykAUCXyLwBKTdjNJ0GOIDC2eM5jELnr7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1h8jDvueuDWMLAhzDXJvDtsubaKc0SmI89WT4uFyzPU=;
 b=wWi+apWuxHfdeA85Djrm/tB9Ra1goOlXTgZLtgsTVM5lRcwh10CAULFp8xg+Sa/K1/2ZuJteVQyoACPybJMqdj89XBpWwy/z+EMT2GD4VstCXJWHCrWmeKmhDiKxWuMnAisvu4r2Fjke6mpmOgeXjlJZ5QkbpW/mM8D2bFqpPFY+6rOgknpH9q61+vixlTBHhWYH8qUkV+MhfQGvsrqxX+S+LJZbcPuNOR6jvWxgjOV0blqXCxblucbXzYC4Cq7IF6MbsZD/zmQxUCwnh26a+3pYnHzA/8CjBMWY8GRHWiR6qtqAysYmdH1Xwy3rvtirCWEx7nRlGqVazdVVMD6chA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1h8jDvueuDWMLAhzDXJvDtsubaKc0SmI89WT4uFyzPU=;
 b=sjROK9BYAPYTAYcsZJy4tNapoFEsny981n1GobT3GaZWzNPJFREPI26TG+n6tnrVtYqVCUAZ+uNmYdeRSOvAHFrSTVqel9OohcaXcqB2fuuUGjQixjjOsoWThOnJyq/vimbOGe6vQbD2WgF+gVtGRiUTABXuUyi1VIl0IIDW55Vvx/ir9Eg5cCPzGsWRzTOYXWgNoU3tHddooRJqeDGHlkio7CJgR48V6lApr07PcRLa3M1vzsEaQDcEAnFuLB/pBG7AZEqZaHBreKblRi+z10APNkLkwGHe+kL9BzGd1ccLX0ATbyP7p4VUXWEGwA2aOSxnNkUs3rCKZG2uMe0wQQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by AM8PR08MB5761.eurprd08.prod.outlook.com (2603:10a6:20b:1d0::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Tue, 4 Aug
 2026 16:04:39 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0292.013; Tue, 4 Aug 2026
 16:04:39 +0000
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
Subject: [PATCH v9 06/36] pinctrl: airoha: an7581: fix mux/conf of pcie_reset pins
Date: Tue,  4 Aug 2026 19:03:49 +0300
Message-ID: <20260804160419.3592327-7-mikhail.kshevetskiy@iopsys.eu>
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
X-MS-Office365-Filtering-Correlation-Id: 37f1620f-bbc5-4562-0922-08def24216af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|7416014|23010399003|921020|38350700014|22082099003|18002099003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	T/tkO7Q74WznVQPt/RT97lsptk+LijVfp1UkXtbHsF7P2swMDPW8ukZ9jrx50HXmz5UuayJhyi8JeB8iEw3QpllIDlviACIg3JvYgDeA/ieomdG53h/QCU3v1rfIKKBibmq2x0iBKjc3LxViFfMbq/ZWSExbI620cLEF9ZLg+gzzCTB/vQo7dHiYZ/rFUuidrKDHA/Zo5dtmCHC4l5r55jVcuecMvbg2z0kuVpdQfDzFSqOqsLCYtvHRRxRDJppHnOJ8B0hMu1hwT6FQ07Xsw0FpoJZUsMbYWAYlqdZn21jLP0M1gBVbvpBJgPdCxYWdTlW+64uTKpLyBrTJBP2cSTEcm/oGIMtQhpHm1y5phNIAcrTBSXQCl6wEYPVDPjgKmRFinvEq1kZMxOVb3v5pspbGmkNlTDdzCA6GtXgC5VlJL9td16mps1MO7UUOcD1z6AIB7+skFIuMohxAIuGKyoBQPuIZeJStZ+brSsZmJD5NfLplwP7hAGa8XIwNF0+qVYvydnSPqhaRMGu9ZduNK8NEKfm9Y8yTnj2JoDuXVLLw4y0AAILxC8DCHRvzyakLSM2nNlW0TGH4JPzLLtFOiKpM0I5EpMo6pyAow3aixtcXBVnGer14uCJkp1nVzw4CwLh497gwGzEh7EdGGYdv6yim/SX/0PFOxU3TE2SXeJj3Ir6BiwGg06M9XrFk87m/+1K+6mFrX2nX07MKNmFmmUU3Jg66d7rD5fai73MsefU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(7416014)(23010399003)(921020)(38350700014)(22082099003)(18002099003)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?4QEp8T5AuaLoQbcEHwh/RrIeVjY8pM8IZTBVLGXaCDxXmFAe6wxzyAPv9BJG?=
 =?us-ascii?Q?7d7xQb+DaSajxtqp8PIErjl22aJ6p+rY4NEWWL6J8Y9Jgfn35TSZ01Nr1tmr?=
 =?us-ascii?Q?G+69Thb+byIu+nNASQtxqQhBkIcVekUQE4HyOfFUx0D4ApUW5RrfIFiAq3h5?=
 =?us-ascii?Q?KKL+d5CAnBzw6iOH+X4tqSY0m01LC8pRfXmhRDzxpWe02NWA589YqRuhuLb0?=
 =?us-ascii?Q?/nNM2vjEq45lbnWhT7mG8kJkG662o8sbND+CN0mdj30BOSaek1llT+9laX5P?=
 =?us-ascii?Q?vYDMIvkCJhB6ihSpcPzct/p/p5VLv0AcbrFjo49MMDF4lnOwd24SybZsn39i?=
 =?us-ascii?Q?mU1S9EMyDqLZPhNI8MEeAF8+IzVlhGcL7O8qB0BXTO3x0jB/BoWlPBjojvrf?=
 =?us-ascii?Q?MIVy3932TWqRU36vDe5HRVcN6kMipDo7Leqx6kf6ru6HnsikA3REYkoGji0Q?=
 =?us-ascii?Q?spLsHYOR7uooBK7ce2i1DQjxf78ZYPhPoOjbo3efavbxaMrETRwVnqXQkLBI?=
 =?us-ascii?Q?G+QCQiZRALAusBpvUX5kDhy+gdt57ELWx9PQxWgq9yjLtzFe87r0W0xi9dZ4?=
 =?us-ascii?Q?Ff6acyijLRpa6QrExruOi7BCRcdiB13erRg0PKfOFRDuKUvmQJEc5vsn1Cw6?=
 =?us-ascii?Q?BKK41mJ9tRQ6H4e8zAyDm/oRx0DQpBijOQJM1FHIVlPlavJ4JqfEDtYrKz3m?=
 =?us-ascii?Q?ZXJcEm5Trqr47yl77aVtdCSK0a13gaRfxeRi25neylSS10A6a6nVeXCn77Kz?=
 =?us-ascii?Q?5JAoUhvQ7aGzP2OQOiH4i89dJoB0b27pFVUfHcnmMcTCXCZZAWl/UXos+PuI?=
 =?us-ascii?Q?H5YHt5iTibVdL/kno/59Olt9ZkWMxmqoliBBmeX/jNhxaZvMXVqYv337wQ4f?=
 =?us-ascii?Q?1c+GmrBlQ358WPQMnjd2pGTj3yYjsoxDu8q1DPAx3ZGyWIDzEuGswiwsXOE3?=
 =?us-ascii?Q?4FUr1hQ6AuOt4de27zbKpRb/s60pjFa4pU8wpVSqPYY3zcNXZCAYynHQhLdA?=
 =?us-ascii?Q?BHmQyCa/+oco0ANQI4slq2Mmz7Vx8UFTqGyariVaExl6CVSWawF3pxQan75G?=
 =?us-ascii?Q?B0Jr8hYTG+HTmTbLdnmKvtj+g+rer9Gexkf7nsLGPLVBoUDueTASltMBVmXA?=
 =?us-ascii?Q?heN+vEpm23shKbpkbRNFq+JuDq7hHZ2cSMZEhbuEjGNHBqUozr/s1tJ+YecW?=
 =?us-ascii?Q?raEkHXpNDwhlhzsN26rRlVRvJxvjWMEhf4gFKtFW1eqUVS2NwEdILOjcJJpH?=
 =?us-ascii?Q?sZOQmlo501uwabL0ukcgphLV6gd688k8rKyPgw/vik8P0wX1ADtbxSfiIDIG?=
 =?us-ascii?Q?gAQUyMm7XKsGYbOapp6zw3w3bun67VoS/5od9rFojsYpSZpL1C9TNWpUXRsO?=
 =?us-ascii?Q?hlPeevIUj9qHpr4LOSQxaYeKtHYB2Zm9e7hqYQTzptZQjWeG7sHxxGR9AKk4?=
 =?us-ascii?Q?sGyvoPHLGOp24JNYJS5HZov4GKmAogmYV7Z8gvdev6BlfY7n97Dq6Nb5IpsF?=
 =?us-ascii?Q?FkC3LxAGFO1BizFJIS9YQq5HtUFPXcawjvb8W4Hy4PYCphCXdYz2ot3VINYh?=
 =?us-ascii?Q?ykU5KTChqyDRngoJvcsICTT/v5qO1D+LIY+T0K1qNFvhO/qfzFZF6Ii6buMy?=
 =?us-ascii?Q?mDphu0F+fTeGXZg+fuD9r8yy4IkJDJQOauvqPtIh5bikyuV3OdnfS26fG66z?=
 =?us-ascii?Q?3Q89JaZwcJmUWHAIzZA7DsmpDCpJOmPudFI5ne+t07onL8JLClckYyfeNkLY?=
 =?us-ascii?Q?O1dzJjGjWEOAWaOAG/g5lktFJzZ5i30=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 37f1620f-bbc5-4562-0922-08def24216af
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 16:04:39.8096
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zfDAiEl2cUQI6ttrisnWoxLeNB0LUcUGpeho50Zu5jzZ1iL/6pLA2KYkbdR/8866/SVwW3S+Bz5jnV6/Xxc+9AX/kZtVDdYUY5MpINBPRr4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5761

In the an7581 case
 * gpio47 and pcie_reset0 shares pin 60,
 * gpio48 and pcie_reset1 shares pin 61,
 * gpio49 and pcie_reset2 shares pin 62.
but current driver treat them as pins 61--63. This is wrong.

Also current an7581 pinmux implementation have following issues:
 * current pcie_reset pin function actually sets corresponding
   pins as gpios.
 * there is no proper way to set pcie_reset pins as gpios.
 * there is no way to set pcie_reset pins as pwm.

This patch fixes above issues.

WARNING:
There is a contradiction in the Airoha documentation. AN7581 programming
guide claims:
 - gpio44 and pcie_reset0 shares the same pin
 - gpio45 and pcie_reset1 shares the same pin
 - gpio46 and pcie_reset2 shares the same pin
While AN7581 datasheet claims:
 - gpio47 and pcie_reset0 shares the same pin
 - gpio48 and pcie_reset1 shares the same pin
 - gpio49 and pcie_reset2 shares the same pin
The datasheet should be considered as a more reliable source.
Thanks to Benjamin Larsson for clarification.

Fixes: 1c8ace2d0725 ("pinctrl: airoha: Add support for EN7581 SoC")
Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
---
 drivers/pinctrl/airoha/pinctrl-airoha.c | 122 +++++++++++++++++++-----
 1 file changed, 97 insertions(+), 25 deletions(-)

diff --git a/drivers/pinctrl/airoha/pinctrl-airoha.c b/drivers/pinctrl/airoha/pinctrl-airoha.c
index d743d7fdcf0cd..0b54e029c8741 100644
--- a/drivers/pinctrl/airoha/pinctrl-airoha.c
+++ b/drivers/pinctrl/airoha/pinctrl-airoha.c
@@ -470,9 +470,9 @@ static struct pinctrl_pin_desc en7581_pinctrl_pins[] = {
 	PINCTRL_PIN(57, "gpio44"),
 	PINCTRL_PIN(58, "gpio45"),
 	PINCTRL_PIN(59, "gpio46"),
-	PINCTRL_PIN(61, "pcie_reset0"),
-	PINCTRL_PIN(62, "pcie_reset1"),
-	PINCTRL_PIN(63, "pcie_reset2"),
+	PINCTRL_PIN(60, "pcie_reset0"),
+	PINCTRL_PIN(61, "pcie_reset1"),
+	PINCTRL_PIN(62, "pcie_reset2"),
 };
 
 static const int en7581_pon_pins[] = { 49, 50, 51, 52, 53, 54 };
@@ -555,9 +555,12 @@ static const int en7581_gpio43_pins[] = { 56 };
 static const int en7581_gpio44_pins[] = { 57 };
 static const int en7581_gpio45_pins[] = { 58 };
 static const int en7581_gpio46_pins[] = { 59 };
-static const int en7581_pcie_reset0_pins[] = { 61 };
-static const int en7581_pcie_reset1_pins[] = { 62 };
-static const int en7581_pcie_reset2_pins[] = { 63 };
+static const int en7581_gpio47_pins[] = { 60 };
+static const int en7581_gpio48_pins[] = { 61 };
+static const int en7581_gpio49_pins[] = { 62 };
+static const int en7581_pcie_reset0_pins[] = { 60 };
+static const int en7581_pcie_reset1_pins[] = { 61 };
+static const int en7581_pcie_reset2_pins[] = { 62 };
 
 static const struct pingroup en7581_pinctrl_groups[] = {
 	PINCTRL_PIN_GROUP("pon", en7581_pon),
@@ -640,6 +643,9 @@ static const struct pingroup en7581_pinctrl_groups[] = {
 	PINCTRL_PIN_GROUP("gpio44", en7581_gpio44),
 	PINCTRL_PIN_GROUP("gpio45", en7581_gpio45),
 	PINCTRL_PIN_GROUP("gpio46", en7581_gpio46),
+	PINCTRL_PIN_GROUP("gpio47", en7581_gpio47),
+	PINCTRL_PIN_GROUP("gpio48", en7581_gpio48),
+	PINCTRL_PIN_GROUP("gpio49", en7581_gpio49),
 	PINCTRL_PIN_GROUP("pcie_reset0", en7581_pcie_reset0),
 	PINCTRL_PIN_GROUP("pcie_reset1", en7581_pcie_reset1),
 	PINCTRL_PIN_GROUP("pcie_reset2", en7581_pcie_reset2),
@@ -883,6 +889,7 @@ static const char *const an7583_pcm_spi_groups[] = { "pcm_spi",
 static const char *const i2s_groups[] = { "i2s" };
 static const char *const emmc_groups[] = { "emmc" };
 static const char *const pnand_groups[] = { "pnand" };
+static const char *const gpio_groups[] = { "gpio47", "gpio48", "gpio49" };
 static const char *const pcie_reset_groups[] = { "pcie_reset0", "pcie_reset1",
 						 "pcie_reset2" };
 static const char *const an7583_pcie_reset_groups[] = { "pcie_reset0", "pcie_reset1" };
@@ -907,7 +914,8 @@ static const char *const pwm_groups[] = { "gpio0", "gpio1",
 					  "gpio40", "gpio41",
 					  "gpio42", "gpio43",
 					  "gpio44", "gpio45",
-					  "gpio46" };
+					  "gpio46", "gpio47",
+					  "gpio48", "gpio49" };
 static const char *const an7583_pwm_groups[] = { "gpio0", "gpio1",
 						 "gpio2", "gpio3",
 						 "gpio4", "gpio5",
@@ -1406,6 +1414,45 @@ static const struct airoha_pinctrl_func_group pnand_func_group[] = {
 	},
 };
 
+#define AIROHA_PINCTRL_GPIO(gpio, mux_val)			\
+	{							\
+		.name = (gpio),					\
+		.regmap[0] = {					\
+			AIROHA_FUNC_MUX,			\
+			REG_GPIO_PON_MODE,			\
+			(mux_val),				\
+			(mux_val)				\
+		},						\
+		.regmap_size = 1,				\
+	}
+
+#define AIROHA_PINCTRL_GPIO_EXT(gpio, mux_val, smux_val)	\
+	{							\
+		.name = (gpio),					\
+		.regmap[0] = {					\
+			AIROHA_FUNC_PWM_EXT_MUX,		\
+			REG_GPIO_FLASH_MODE_CFG_EXT,		\
+			(mux_val),				\
+			0					\
+		},						\
+		.regmap[1] = {					\
+			AIROHA_FUNC_MUX,			\
+			REG_GPIO_PON_MODE,			\
+			(smux_val),				\
+			(smux_val)				\
+		},						\
+		.regmap_size = 2,				\
+	}
+
+static const struct airoha_pinctrl_func_group gpio_func_group[] = {
+	AIROHA_PINCTRL_GPIO_EXT("gpio47", GPIO47_FLASH_MODE_CFG,
+				GPIO_PCIE_RESET0_MASK),
+	AIROHA_PINCTRL_GPIO_EXT("gpio48", GPIO48_FLASH_MODE_CFG,
+				GPIO_PCIE_RESET1_MASK),
+	AIROHA_PINCTRL_GPIO_EXT("gpio49", GPIO49_FLASH_MODE_CFG,
+				GPIO_PCIE_RESET2_MASK),
+};
+
 static const struct airoha_pinctrl_func_group pcie_reset_func_group[] = {
 	{
 		.name = "pcie_reset0",
@@ -1413,7 +1460,7 @@ static const struct airoha_pinctrl_func_group pcie_reset_func_group[] = {
 			AIROHA_FUNC_MUX,
 			REG_GPIO_PON_MODE,
 			GPIO_PCIE_RESET0_MASK,
-			GPIO_PCIE_RESET0_MASK
+			0
 		},
 		.regmap_size = 1,
 	}, {
@@ -1422,7 +1469,7 @@ static const struct airoha_pinctrl_func_group pcie_reset_func_group[] = {
 			AIROHA_FUNC_MUX,
 			REG_GPIO_PON_MODE,
 			GPIO_PCIE_RESET1_MASK,
-			GPIO_PCIE_RESET1_MASK
+			0
 		},
 		.regmap_size = 1,
 	}, {
@@ -1431,7 +1478,7 @@ static const struct airoha_pinctrl_func_group pcie_reset_func_group[] = {
 			AIROHA_FUNC_MUX,
 			REG_GPIO_PON_MODE,
 			GPIO_PCIE_RESET2_MASK,
-			GPIO_PCIE_RESET2_MASK
+			0
 		},
 		.regmap_size = 1,
 	},
@@ -1484,6 +1531,24 @@ static const struct airoha_pinctrl_func_group an7583_pcie_reset_func_group[] = {
 		.regmap_size = 1,			\
 	}						\
 
+#define AIROHA_PINCTRL_PWM_EXT_SEC(gpio, mux_val, smux_val)	\
+	{							\
+		.name = (gpio),					\
+		.regmap[0] = {					\
+			AIROHA_FUNC_PWM_EXT_MUX,		\
+			REG_GPIO_FLASH_MODE_CFG_EXT,		\
+			(mux_val),				\
+			(mux_val)				\
+		},						\
+		.regmap[1] = {					\
+			AIROHA_FUNC_MUX,			\
+			REG_GPIO_PON_MODE,			\
+			(smux_val),				\
+			(smux_val)				\
+		},						\
+		.regmap_size = 2,				\
+	}
+
 static const struct airoha_pinctrl_func_group pwm_func_group[] = {
 	AIROHA_PINCTRL_PWM("gpio0", GPIO0_FLASH_MODE_CFG),
 	AIROHA_PINCTRL_PWM("gpio1", GPIO1_FLASH_MODE_CFG),
@@ -1528,6 +1593,12 @@ static const struct airoha_pinctrl_func_group pwm_func_group[] = {
 	AIROHA_PINCTRL_PWM_EXT("gpio44", GPIO44_FLASH_MODE_CFG),
 	AIROHA_PINCTRL_PWM_EXT("gpio45", GPIO45_FLASH_MODE_CFG),
 	AIROHA_PINCTRL_PWM_EXT("gpio46", GPIO46_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM_EXT_SEC("gpio47", GPIO47_FLASH_MODE_CFG,
+				   GPIO_PCIE_RESET0_MASK),
+	AIROHA_PINCTRL_PWM_EXT_SEC("gpio48", GPIO48_FLASH_MODE_CFG,
+				   GPIO_PCIE_RESET1_MASK),
+	AIROHA_PINCTRL_PWM_EXT_SEC("gpio49", GPIO49_FLASH_MODE_CFG,
+				   GPIO_PCIE_RESET2_MASK),
 };
 
 static const struct airoha_pinctrl_func_group an7583_pwm_func_group[] = {
@@ -1804,6 +1875,7 @@ static const struct airoha_pinctrl_func en7581_pinctrl_funcs[] = {
 	PINCTRL_FUNC_DESC("i2s", i2s),
 	PINCTRL_FUNC_DESC("emmc", emmc),
 	PINCTRL_FUNC_DESC("pnand", pnand),
+	PINCTRL_FUNC_DESC("gpio", gpio),
 	PINCTRL_FUNC_DESC("pcie_reset", pcie_reset),
 	PINCTRL_FUNC_DESC("pwm", pwm),
 	PINCTRL_FUNC_DESC("phy1_led0", phy1_led0),
@@ -1897,9 +1969,9 @@ static const struct airoha_pinctrl_conf en7581_pinctrl_pullup_conf[] = {
 	PINCTRL_CONF_DESC(57, REG_GPIO_H_PU, BIT(12)),
 	PINCTRL_CONF_DESC(58, REG_GPIO_H_PU, BIT(13)),
 	PINCTRL_CONF_DESC(59, REG_GPIO_H_PU, BIT(14)),
-	PINCTRL_CONF_DESC(61, REG_I2C_SDA_PU, PCIE0_RESET_PU_MASK),
-	PINCTRL_CONF_DESC(62, REG_I2C_SDA_PU, PCIE1_RESET_PU_MASK),
-	PINCTRL_CONF_DESC(63, REG_I2C_SDA_PU, PCIE2_RESET_PU_MASK),
+	PINCTRL_CONF_DESC(60, REG_I2C_SDA_PU, PCIE0_RESET_PU_MASK),
+	PINCTRL_CONF_DESC(61, REG_I2C_SDA_PU, PCIE1_RESET_PU_MASK),
+	PINCTRL_CONF_DESC(62, REG_I2C_SDA_PU, PCIE2_RESET_PU_MASK),
 };
 
 static const struct airoha_pinctrl_conf an7583_pinctrl_pullup_conf[] = {
@@ -2014,9 +2086,9 @@ static const struct airoha_pinctrl_conf en7581_pinctrl_pulldown_conf[] = {
 	PINCTRL_CONF_DESC(57, REG_GPIO_H_PD, BIT(12)),
 	PINCTRL_CONF_DESC(58, REG_GPIO_H_PD, BIT(13)),
 	PINCTRL_CONF_DESC(59, REG_GPIO_H_PD, BIT(14)),
-	PINCTRL_CONF_DESC(61, REG_I2C_SDA_PD, PCIE0_RESET_PD_MASK),
-	PINCTRL_CONF_DESC(62, REG_I2C_SDA_PD, PCIE1_RESET_PD_MASK),
-	PINCTRL_CONF_DESC(63, REG_I2C_SDA_PD, PCIE2_RESET_PD_MASK),
+	PINCTRL_CONF_DESC(60, REG_I2C_SDA_PD, PCIE0_RESET_PD_MASK),
+	PINCTRL_CONF_DESC(61, REG_I2C_SDA_PD, PCIE1_RESET_PD_MASK),
+	PINCTRL_CONF_DESC(62, REG_I2C_SDA_PD, PCIE2_RESET_PD_MASK),
 };
 
 static const struct airoha_pinctrl_conf an7583_pinctrl_pulldown_conf[] = {
@@ -2131,9 +2203,9 @@ static const struct airoha_pinctrl_conf en7581_pinctrl_drive_e2_conf[] = {
 	PINCTRL_CONF_DESC(57, REG_GPIO_H_E2, BIT(12)),
 	PINCTRL_CONF_DESC(58, REG_GPIO_H_E2, BIT(13)),
 	PINCTRL_CONF_DESC(59, REG_GPIO_H_E2, BIT(14)),
-	PINCTRL_CONF_DESC(61, REG_I2C_SDA_E2, PCIE0_RESET_E2_MASK),
-	PINCTRL_CONF_DESC(62, REG_I2C_SDA_E2, PCIE1_RESET_E2_MASK),
-	PINCTRL_CONF_DESC(63, REG_I2C_SDA_E2, PCIE2_RESET_E2_MASK),
+	PINCTRL_CONF_DESC(60, REG_I2C_SDA_E2, PCIE0_RESET_E2_MASK),
+	PINCTRL_CONF_DESC(61, REG_I2C_SDA_E2, PCIE1_RESET_E2_MASK),
+	PINCTRL_CONF_DESC(62, REG_I2C_SDA_E2, PCIE2_RESET_E2_MASK),
 };
 
 static const struct airoha_pinctrl_conf an7583_pinctrl_drive_e2_conf[] = {
@@ -2248,9 +2320,9 @@ static const struct airoha_pinctrl_conf en7581_pinctrl_drive_e4_conf[] = {
 	PINCTRL_CONF_DESC(57, REG_GPIO_H_E4, BIT(12)),
 	PINCTRL_CONF_DESC(58, REG_GPIO_H_E4, BIT(13)),
 	PINCTRL_CONF_DESC(59, REG_GPIO_H_E4, BIT(14)),
-	PINCTRL_CONF_DESC(61, REG_I2C_SDA_E4, PCIE0_RESET_E4_MASK),
-	PINCTRL_CONF_DESC(62, REG_I2C_SDA_E4, PCIE1_RESET_E4_MASK),
-	PINCTRL_CONF_DESC(63, REG_I2C_SDA_E4, PCIE2_RESET_E4_MASK),
+	PINCTRL_CONF_DESC(60, REG_I2C_SDA_E4, PCIE0_RESET_E4_MASK),
+	PINCTRL_CONF_DESC(61, REG_I2C_SDA_E4, PCIE1_RESET_E4_MASK),
+	PINCTRL_CONF_DESC(62, REG_I2C_SDA_E4, PCIE2_RESET_E4_MASK),
 };
 
 static const struct airoha_pinctrl_conf an7583_pinctrl_drive_e4_conf[] = {
@@ -2310,9 +2382,9 @@ static const struct airoha_pinctrl_conf an7583_pinctrl_drive_e4_conf[] = {
 };
 
 static const struct airoha_pinctrl_conf en7581_pinctrl_pcie_rst_od_conf[] = {
-	PINCTRL_CONF_DESC(61, REG_PCIE_RESET_OD, PCIE0_RESET_OD_MASK),
-	PINCTRL_CONF_DESC(62, REG_PCIE_RESET_OD, PCIE1_RESET_OD_MASK),
-	PINCTRL_CONF_DESC(63, REG_PCIE_RESET_OD, PCIE2_RESET_OD_MASK),
+	PINCTRL_CONF_DESC(60, REG_PCIE_RESET_OD, PCIE0_RESET_OD_MASK),
+	PINCTRL_CONF_DESC(61, REG_PCIE_RESET_OD, PCIE1_RESET_OD_MASK),
+	PINCTRL_CONF_DESC(62, REG_PCIE_RESET_OD, PCIE2_RESET_OD_MASK),
 };
 
 static const struct airoha_pinctrl_conf an7583_pinctrl_pcie_rst_od_conf[] = {
-- 
2.53.0

