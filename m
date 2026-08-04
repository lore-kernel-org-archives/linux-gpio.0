Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11021116.outbound.protection.outlook.com [52.101.70.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DBDF47D94D;
	Tue,  4 Aug 2026 16:05:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.116
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785859540; cv=fail; b=mIDYkpiJ1XK5Yt+pDPv4PSy8fPgUef+aGnh7xX9/pFewB7kE+Oupyl4pcvQTJGXw1WSPTn3/7zOVdCAsUG/Ly4DHkVY3rc32SziVbPP0Eb1g9NqrsRSAkSd0kpJW/j/cZ/3xpzRYS2bVTHFF8PfjYluDBpDuB7+drfVboWw507M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785859540; c=relaxed/simple;
	bh=rL5nvTxNqRMTY1eAG4HiOrCLx+2VNbMk9DxbbbEjvyo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=vC+rok8pti1KYALEHeSK8qrVpIcyb2AnLJfwuZEf7qpd1i3mo+wWFgoB/OrZq3OvccrijVbwnZnMHgAMp262bIYUgi9AUC9jGroMJ7wMDiKa+EGiyWopPeSIqrXha/bGuJ2LbeO1BJBTDe7xsfqT1o+IZZluez9OlEaFqQ5YPKo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b=tHuFANa8; arc=fail smtp.client-ip=52.101.70.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=genexis.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b="tHuFANa8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vf4EdYbgqF0t5rWnF+llWe7Y3jCaaMhnR/ku6oAULCb6VQ3XGWmYokRkFPqyiC2d8razwl7joz/HA307Q5y2PGm6Zo2fgMheb0GSvBxauiGtKXyhi4NiIpLYGUcWcAbH8lhZppDdqPo3xctIG5VMZKD4ijptkYG0EzYustOyeCQN3A08cxNperDDwQloJb5RZv8tgzdAvkymENloY+qWFRhavjqEwW3vYwoR7bFs3NEN7LkIgpPhsYiecLv9E4q7vLnvhCBy61Ibyfue995zJcQ7gFLdGJaz/G89iT95dukIf+Y/GXLSr+yOS4xuRKf2Imn7iw3/IDalZSmYIfU7aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MOzXzO751kPv4t39iFYU2CMScdEyrmOWSo30MsbgxZ0=;
 b=VpD80M33V/p7a+yGRWHNliPpYA52YrkzXP8HpI5ltQQer7SWSf1lxhJaFa57/IGm1uMDGFjvwhfg9SxxKpCDkkZKHfecSAYd1nGlkkUdUskyVEn6lcmY3Hfw5ARdILnfaoI+umvVdkXOpRVzPnehxC4TfpPc1V2XhnCvxYJFrdlzifiCcpm5xFVdUmnt/KCWLBBLIHfdrroO5WSFhpA6SNKIPp7lRHHOObsTaK6hMGBdNnhKhDuI2FjYKLncZrwd3fgjpA5v9fbwwAUitQ4EGe9K2UPYOoX++tMs6kdnmB57KW/sbMvk3IRpBH4mHz3nFaadk5UitBWcIyyVvdmLCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MOzXzO751kPv4t39iFYU2CMScdEyrmOWSo30MsbgxZ0=;
 b=tHuFANa8nMo2qeMOy6DJUy6rxTYsJEr6bdxQIpr6dLFW2CkSsc82yympGKBXJuImh6NXfhcqpuaf2r+I0378Y+7kLU25BZH+N8fIjOWuT38x+WOEZPLaTTiLQ4l3eCcMUlmT+zWYg0NBZrMy5pF43OmlkjdxRUeZqpy/tlmd50vhszIDpNSpGTFve1tT2QdHbpVfGZ4bBwYz718JCQ49dbwiSyFTMuSCOoNe2vlfDNlGGmPumHNurp6IVeOkCXDHrNQsZCvt6hOhiV90jyawxzz/4K2fH8QV0Rpb1nzeC6MlGxzln0isGWmk+O3jFHnEWQwYrICf1BzUjnsl1TZrJg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by GV1PR08MB10792.eurprd08.prod.outlook.com (2603:10a6:150:160::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.15; Tue, 4 Aug
 2026 16:05:24 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0292.013; Tue, 4 Aug 2026
 16:05:23 +0000
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
Subject: [PATCH v9 29/36] pinctrl: airoha: an7583: add support for pon_alt pinmux
Date: Tue,  4 Aug 2026 19:04:12 +0300
Message-ID: <20260804160419.3592327-30-mikhail.kshevetskiy@iopsys.eu>
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
X-MS-TrafficTypeDiagnostic: DU2PR08MB10037:EE_|GV1PR08MB10792:EE_
X-MS-Office365-Filtering-Correlation-Id: c160e995-8add-4745-dc97-08def2423103
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|52116014|376014|7416014|1800799024|366016|38350700014|921020|56012099006|11063799006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	hOi65rBwGb56W00ttpxoou53SHrQhmqyfwBERmsAOySvVSnbVeK60fTUGKtYmnzEAsJ4yu9usN5NuZ4jY2wn7o6v8HZes4d78pfUWpqnNRjceXQNtdH3ZFfoUuEBlQXQYnOmMcXISvUhOvgobMSss9u6pKznAwaTSl1XBnmYCeQkZL8Dk1wZ7dA135HZD1MlWPhpQ+pgkhlNUx4h37LFxG/jIjLBOO4hcFM30juCuvT7sdWhRghrWUGunatbR5nth2jJ0C6CYKyRuG5USvULW579su1tz6GsdEKc3GX4dT1rJq6W2BSWaC1yxl08v8OnmUbdQ8SPFdcC2AO9i/HCwPMSLqHB9hCsDIPEHtpnS6iugfMPLYDc3bYfKPQnKyvshbhq7PqED94kH2Ysyc6GBtIdZ9TXC0NQGVR/BjLFRU7K1Bg8aeHoJ1hDIs+gemcGFsNajJwCA6XvTc9PFUiOj9AaPmsTcTrL2fI4+hZ66MiKj2VoJQKbT0hSHCpcwghHvQZEIIgOfPzn3UTtYKn0mda4aJYKRrpLzxP3txEf3KnrPiJQGC/fr8QHVGb1/cSmKe9TaKkWOx/CdwkYKu/RqZQTwpdw1ico3XTwmR3ktap9pCnZBmBKG7njB4EIftrK5HljQU174LodF3LyCt6KhOh/9dicbsDyS3SAp71rpy2yiBTEx/U0cyjZvpbiRvA9t6FCGUiw/YVRztDq4/5IwLYSddDg0/H5xl4X2XtxloW0QoDSMXQgBnnHLJ0X1BlM
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(52116014)(376014)(7416014)(1800799024)(366016)(38350700014)(921020)(56012099006)(11063799006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?IwBkby6C8XCa9bCfOLiYvVXrU2yP3RmFSz/FFzJW6CblaQ01Gjo4N2zN32Bu?=
 =?us-ascii?Q?qMDwybm6neys2zleA/rk20Ve6d9124hUtjCtkoLQgLEFnREW4AEMIItO5RLn?=
 =?us-ascii?Q?/TzUC1DnVjbrKhfEMXdFwPL5oKGgd2oH49qsJ2kaIs0EOqjmvQVk6bhEn+sK?=
 =?us-ascii?Q?uDqtoFpGDGXyCgmG/xVeoeHl2mmDsrnLMh3pPosuT5J2ZNSdY/IWJltA3zpa?=
 =?us-ascii?Q?+JLL9iPLorP8iYToQQ/g5nU5LP2rmsmbEdJJKbMneCJ1cXwvftEZ4MocJNxk?=
 =?us-ascii?Q?Ek3A6nMmbcSvQCycBpYiEfpMpJw1U4b5Dw2U8Z1ZBMMNJj58iBfn3rCM2/x6?=
 =?us-ascii?Q?XgqOFQpDZfuIZnaguwDO2wB0zCfTHVbl+dFaJbCiXHX+8ipimXvG0SYbW3oY?=
 =?us-ascii?Q?X56X014e1K34qsqtZ55Xcltrkcqp8BheVo3Ov5p5TNjUkhVXzJh4fy1bpPLX?=
 =?us-ascii?Q?4npq/eme1Qtc7SCNupQ68dgvaTKLHmvh1t4+34pYP4wkfGh3L9UjsMj7Wl98?=
 =?us-ascii?Q?0QQ5w9ZCkTrnBDUPoekx1GcYAbgtpoBu9HrNTR7xdY0pSN38o0/pUxMq7Y28?=
 =?us-ascii?Q?9qrDuuxCATYbmhYBtL8jg5mZo/hl3FoeELT3rqrwwf8iPu1VyZ/mshRDc9zv?=
 =?us-ascii?Q?sjRy8gM57xBKPf4a/KocWy29oKPgWx5GxiRLGf0Z8ppAtU6WbYogaJZKDqb1?=
 =?us-ascii?Q?b9Bo7tOzahCHKbTqEILDo9htRx41JBJzNWZL6P+GT2UTpSiitnk2AbZr7D0M?=
 =?us-ascii?Q?eGzf2rkWRaMls8+s4iwo3L4WnqDFvivfxkI6x58zl9suhCoK8U8o1X2Ivxm0?=
 =?us-ascii?Q?xc1+8wlaLPdwb1oXzMvuj/c7GU3+UEgePFqHVtgcWcplhZGy3tq/urm5kEyf?=
 =?us-ascii?Q?YXY5r16yWdcffi98qdXS5HSv4ffexofb9bWZU7lE8C8p3gP84ixW1oEGU78Q?=
 =?us-ascii?Q?YL+DAOHWp5ThvlZaBgZttrtpaHah3R+DdTQUFTNe25RkrBIYvBQdk5SeeerZ?=
 =?us-ascii?Q?NcensceDOPBqni6ZW8FpLld1AnkrFCuk4CJ5LoEhUT0vf4EPQaO66iB2bh4P?=
 =?us-ascii?Q?X2+N1jv734oSKdhv/i7a+fB+8lKOrvyk0UNYyPkWypR/0wh4r4gFDp9h5aKm?=
 =?us-ascii?Q?nbKe+Dvaejo3OW391atHh59mWQNvOo8H7Y0ly021WyK9RswmD6CjrAxuIVu4?=
 =?us-ascii?Q?lFy0BqyFi6c8qc7mcGLMTWvNlCngPK1HNmyipmfVizzfv/mZSq4x5yKi4Fi0?=
 =?us-ascii?Q?U1r7FyKGOyLwv15HatEhW+4Mns4woshARDSYNNsZQ+I8xCmixsKH2+7QvEQ7?=
 =?us-ascii?Q?j/lMyLnX5bT6+JdeezDSIf9QBQkD6986B9E/rWPKHeZ36eO5WakDQH3a92Eq?=
 =?us-ascii?Q?35yQ/ULF6dr9IYHTsekMh+8MGGtkAFuFhp+kl24TZ8/f1Y58YCbsQDYNPdWb?=
 =?us-ascii?Q?YggQyQoNnDqWsUwa5zJwMLMDUjMkiri8Q4GaAkD2ExaL2BK/7VwwJvdc2l+E?=
 =?us-ascii?Q?5DCCxK0En9KLOWQvcm+Y/an2U6R37J1VciU0J4SOgtDY8R0xCtxrCYoJLcYu?=
 =?us-ascii?Q?qoSBKsQxKQ3jqpLTU7jQ4G2eCQOTuCWlHfUbIyJLRoLB2zvKJSy04qR785bN?=
 =?us-ascii?Q?MbOibyCAPt6OsRDz5c+I834kSz5zp+VEXrJxY+62WR2Gucji7LFTxk9lZnxi?=
 =?us-ascii?Q?rMYzPHc3UuG4DktK1QFaCZRkdkh6NE6TTZoe11Z2/uUgQmBHY5Zw9sKie3mI?=
 =?us-ascii?Q?5hQrlYiYw6iUAADtISjLxCGu2CmoYRg=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: c160e995-8add-4745-dc97-08def2423103
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 16:05:23.8700
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GPD74pmSICVP96rqdAS6iacWQiZf/I+lhf7bQLv5E7zx+gMJzd2MazUEHP+6U3vc/ZvNLUwv0gDnIs10bJ4Pxlq1AjlrBz3TJHaSBOjkwXg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB10792

Add support for pon pin function for pon_alt pin group.

Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
---
 drivers/pinctrl/airoha/pinctrl-an7583.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/airoha/pinctrl-an7583.c b/drivers/pinctrl/airoha/pinctrl-an7583.c
index dc88cbd8746bb..2e145ef5a224c 100644
--- a/drivers/pinctrl/airoha/pinctrl-an7583.c
+++ b/drivers/pinctrl/airoha/pinctrl-an7583.c
@@ -38,6 +38,7 @@
 #define GPIO_SPI_CS1_MODE_MASK			BIT(0)
 
 #define REG_GPIO_PON_MODE			0x021c
+#define GPIO_PON_ALT_MODE_MASK			BIT(27)
 #define MDIO_0_GPIO_MODE_MASK			BIT(26)
 #define MDC_0_GPIO_MODE_MASK			BIT(25)
 #define UART_RXD_GPIO_MODE_MASK			BIT(24)
@@ -391,6 +392,7 @@ static struct pinctrl_pin_desc pinctrl_pins[] = {
 };
 
 static const int pon_pins[] = { 15, 16, 17, 18, 19, 20 };
+static const int pon_alt_pins[] = { 36, 37, 38, 39, 40 };
 static const int pon_tod_1pps_pins[] = { 32 };
 static const int gsw_tod_1pps_pins[] = { 32 };
 static const int sipo_pins[] = { 34, 35 };
@@ -480,6 +482,7 @@ static const int pcie_reset1_pins[] = { 52 };
 
 static const struct pingroup pinctrl_groups[] = {
 	PINCTRL_PIN_GROUP("pon", pon),
+	PINCTRL_PIN_GROUP("pon_alt", pon_alt),
 	PINCTRL_PIN_GROUP("pon_tod_1pps", pon_tod_1pps),
 	PINCTRL_PIN_GROUP("gsw_tod_1pps", gsw_tod_1pps),
 	PINCTRL_PIN_GROUP("sipo", sipo),
@@ -564,7 +567,7 @@ static const struct pingroup pinctrl_groups[] = {
 	PINCTRL_PIN_GROUP("pcie_reset1", pcie_reset1),
 };
 
-static const char *const pon_groups[] = { "pon" };
+static const char *const pon_groups[] = { "pon", "pon_alt" };
 static const char *const tod_1pps_groups[] = {
 	"pon_tod_1pps", "gsw_tod_1pps"
 };
@@ -632,10 +635,19 @@ static const struct airoha_pinctrl_func_group pon_func_group[] = {
 		.regmap[0] = {
 			AIROHA_FUNC_MUX,
 			REG_GPIO_PON_MODE,
-			GPIO_PON_MODE_MASK,
+			GPIO_PON_MODE_MASK | GPIO_PON_ALT_MODE_MASK,
 			GPIO_PON_MODE_MASK
 		},
 		.regmap_size = 1,
+	}, {
+		.name = "pon_alt",
+		.regmap[0] = {
+			AIROHA_FUNC_MUX,
+			REG_GPIO_PON_MODE,
+			GPIO_PON_MODE_MASK | GPIO_PON_ALT_MODE_MASK,
+			GPIO_PON_ALT_MODE_MASK
+		},
+		.regmap_size = 1,
 	},
 };
 
-- 
2.53.0

