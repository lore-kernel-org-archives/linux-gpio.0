Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11023076.outbound.protection.outlook.com [52.101.72.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1084942D770;
	Thu,  6 Aug 2026 22:07:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786054052; cv=fail; b=qCJCOvRslL1kUZNPmUUmcKphS5zMVqWMZeNCUV1Kdr25uDaX1bv3HeNk2pp4bSYf62vyLT58eCha3hTZN4WhBVTbU350GfEvkRS4GUCZePvj0lr/cqDBb7QKBRql9qSDhhOkpOMX9D3AC6Nyk7oFqxaFIy123Yqbpibln16gNO4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786054052; c=relaxed/simple;
	bh=rL5nvTxNqRMTY1eAG4HiOrCLx+2VNbMk9DxbbbEjvyo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=JoMTHWfv5mgZSGL5/wZy5OMHnWClOnYcQQ15oZgCrtKg0+9wt87SJNfJ5Wzq1CuWXYWc+Ud6mZ7gIJLK/v/4n9KZJlWnYTNEaIPaIweMQMMhkJWqlvNbkwkE4UccsM/j4Qb6n1ZDJKLFu08vYicJTAlGmG3TCJ0BRr8xpcdzGyM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b=gAgNFg7h; arc=fail smtp.client-ip=52.101.72.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=genexis.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b="gAgNFg7h"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wwRXEs4R+aobLoGXzVe9gII7q01ZaYBfohw4wh1OZR6+JSTg7WztX4oksU+A4VEkQUf2U6e6MlhvjIUtjQHCeNrP1i4La6oC0T/Lp46xUWXPlpcg+V7ho7EFGIyBYw2MHFJgJ8ND3aZi6BJtDwC9gb11Y+LACBS9RQY5iv14BBzBTEbRGP22TMKmSFMlpwamhCDRyQ7kJV7OYXk0VKXWD2SU0yPxDF7ncrnjVWZFzMjXL83BADmQ+JqjMOXW+8Fa3HJ99cYZrbqKZreyPYhfA+jKMX1wq0c/nz25Fq3VhZ3hvFSbeE2WeFuMgB/Z0yA6tGpuMsGi4Jncn/uCXcSBnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MOzXzO751kPv4t39iFYU2CMScdEyrmOWSo30MsbgxZ0=;
 b=OzPhoxxT2ajdbb9Fb2NoF1Q9D7IJjV24c7Wdb/Noqon8OArIi0J2iCciUE+lV768TTuCOBEGNGN9+qimpCP9olDTIVuN797oFfGT+IeysEfN2/pbAobbvecFgEcet6rlY+f2A36vzZkBKF6hFbBt12cmdovi+2E+KE1fmKXZL4VxCzEzX2wk99qA5OWdcC8fgJkP6MPLEqoGbulibfBLNouSzxE+ussVyaKs0ff3dyXI7csv3vHY8CTB65eYTKWg+mGem21V1xfppAKKCfGuidP1/mBrey8nPsuDmI2qFGFTLydCzTNF/BpLe/VENrV78TV/AJFkFyLdEl+RUKakDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MOzXzO751kPv4t39iFYU2CMScdEyrmOWSo30MsbgxZ0=;
 b=gAgNFg7huyg1OMle92OJd0zLHGY8OSxF8njTgUDdoFzYwl3SZx2OMLw8o5rz2/GkqMNH1M5n2fBZRhyAy2NW9lX483y+4gfJrNxsTEW0GCzhVBqXU5KNFN3rFRcvLENZV4CADHvuHgDNhJJjMXZH3vHLopt7tCffQkXATsYcdEz6RYSY9gxxs1Zb2lI9A4HfYsR7Xhy8TGQRX5mkQ/gthfEQj30WgVTigOrh80Or+/jagBF1YmFapq+6DFcsl9JBUN8ORfFg2imz2k7w+Oxm6wDdA2YYgjaSXysxYFoaCJjU9ml3fsW9wX7DKKtGG2QuR3aQyLu5j3bTkuNqOw9z7A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by VE1PR08MB5823.eurprd08.prod.outlook.com (2603:10a6:800:1a5::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.23; Thu, 6 Aug
 2026 22:07:22 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0292.013; Thu, 6 Aug 2026
 22:07:22 +0000
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
Subject: [PATCH v11 31/37] pinctrl: airoha: an7583: add support for pon_alt pinmux
Date: Fri,  7 Aug 2026 01:06:09 +0300
Message-ID: <20260806220615.4078303-32-mikhail.kshevetskiy@iopsys.eu>
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
X-MS-Office365-Filtering-Correlation-Id: 227ac2c6-660e-4985-dd0e-08def40716f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|23010399003|366016|1800799024|921020|38350700014|10067099003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	8kiAqEjPv49gZjprXzA+DdmwxB76/aiqFUpABmrjWu3G7OykeCGbBIKcecWAxjK062fBVkhJgxd4DOZv26kF8imVlHo+FHAZxVFmBWN33liaOCXXx95iJ/56HnsXhWIBlX87I2FZB4rxAf2giFLRD+TQ7lYpDavcfT6RfZ+i0a7qltpsZ1ZOXnexE3yiTvOW1HYjc3l52DdImRexJd0uhKskaf78IiQS0rFUoboRbQv5A2GNAjcegagjR+Ff+NYBxC+DHtTbYoxSUY756VawUsjmY1aH8qqRHeNWKZcaMnyGTzpSP3SAzbPI1tu55VXQA2pBnXeDRc8RwhzkVgPIZb3xWD9u6/8FJDHezJ9bymY1RYdJ7oulFoJIoM+aWpk4CqMX/GcjmxajMMIXyxW5s7nOfisOHTvqkZEZCgVL4pFbzoDsjc/K1qx/sMgyOXlqkSxv4v1KdFcrS7dnDqS45966qE+NEfuwoMEdcp8jRyh1rMg+m/RTzmxcyO5JD3uYhDCU8e0+hTdly721nQZi284dDrcdDgZhO+9GO8jg5hNOOWf2ujCZT1/1vVJfrQGQLI9domiMo8IuGsJoL0MtHHHtP07FEyLAZSn5TbDJeT3dUHIV7EZ0TqAp4k3VoCZphBzBymhy2t8nloKEpOPKuF4h5prGOeccyOwD3iJ0V121tWoDDLoy2G/eGjjyxxa63EPUSuQXwZCdOAyL2vRbCrVxJmVogvQnel9t9O0Naayej7tponzaS4gCl7dsgxyV
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(23010399003)(366016)(1800799024)(921020)(38350700014)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Mu8s1jDThd+Fp/iouTNwTl4fi5uNGn23caUde5y8192oU9yrAIhKBz3pHiJG?=
 =?us-ascii?Q?cklRUCcCkeepbgInSiUghjppQCqsc5BgcCvHnzIk0er80xfdmij8GW4/DTOI?=
 =?us-ascii?Q?JBLI+olHYiQEcO1TZtBAMMEbcCe8fa3AQdfFZ6mxr5xA29dtNxd2uVsbcniO?=
 =?us-ascii?Q?2Yopd7zqX6+1QLI17AZco+LeMU8cifLYTZdisyyQb1a8+WdcmDd/N3SxZZOo?=
 =?us-ascii?Q?SEbnYLUXDzXDReO99FmEfVsM9VvVJ5NN3hETdgobkZz6h15YRwcZZjDdJTnx?=
 =?us-ascii?Q?pfbVmnK2dmtpSPAXfFF/JA82jDJcb4LuiyEBnnZ+laoGgTojjlJD7fITnfz6?=
 =?us-ascii?Q?K/F5q2bBxYjRSKuCSon3hDuDcH7+gMfIY0OLn1fLgvF+2F9TDPP/BQnT0jQg?=
 =?us-ascii?Q?d6D9ZO6GzVI0eXoRsT0r0JAKqYWaYHCvV/N3RFWgzhBaNo/I6MPiazjBJtQx?=
 =?us-ascii?Q?d/fbp8QM9fJ/Wwmoy2QUbM/MS7tb3VT7kS5LINhnI7l5439uSoQVH45KsjZQ?=
 =?us-ascii?Q?ARCzNLMj6Hyf6ZXiJAgF4vwVhvTVyoN2x86gPbeNDN7ODd+ZKtuKmkSqXw+N?=
 =?us-ascii?Q?iKJvfWrQhGwmPj56c9p1JQYT627ggetBpWqzTRL9rYkahnNUp3DKTkIgiD07?=
 =?us-ascii?Q?auqB3djJjiSh65iGzC8GHrRTM7goiy4wxYzHcDe2wrqXcgRuWvz9wRWIXVY6?=
 =?us-ascii?Q?eKEYyOzoKaryZ8KXsWvXR0Q7YAYUnup0Yq4ffvub7DRrLS/FP2HI36tzqWnY?=
 =?us-ascii?Q?jEKpIfV68e6TF3M09RW9UptByxET3iR21AFgW8L1DGTtreQLFAqhl3MnBYuE?=
 =?us-ascii?Q?pLZCnq5CE4CQ+69Yibb1afMbpjSuN0BQlclIDzVHvTrCLbHRIm8j7haC1YWb?=
 =?us-ascii?Q?8N/TeiJDNytzylnZJ6g1j9/QAOf+RXy5P02qow6ntyq8ifYcGhTO/OihgRED?=
 =?us-ascii?Q?jiyIE7KM/qIYVT52Lq1dlx4bvgF7InnR131NiuODe0f1YM7BEDhxw2Oi0vsJ?=
 =?us-ascii?Q?G3fc9w1cTrv9wDjbgyqI04SwQJsKdOXSGkJGFgnBaxridEpabcplMkjBpuwF?=
 =?us-ascii?Q?F/K0FINaMWfezNufMVhSTMvqJ1glz0Smv+9EL8NQM9OrXoHQ3AGFnAHdpqpz?=
 =?us-ascii?Q?2ZpVa/C3cVqoGarIb6m8cWUuQcxfdLpWvvk3Gr8bpcfHexNEXBAez8iA4AJQ?=
 =?us-ascii?Q?SR1+d/VopJ0yIygkaMJNgiUlVTDrzgbZKMf/WK+pfEbVkd3iYqQwkfPmDHzM?=
 =?us-ascii?Q?VH96NaCnU+6ufQ0uSERDkIyzAaWgBApPmmpufBbQYhFaFhaz0UHyr2FZmIbe?=
 =?us-ascii?Q?cosQrQf/CU+NUZjrznUt03jrsJSmYtbi57wtUR/Fqrd7OJiwl07BeP81q2U/?=
 =?us-ascii?Q?h3wjVaDzwh3DKpAcg5IbMJdqdmByUfd4N+Ha0x7AkZ5HAoKuaptHc1btjq4P?=
 =?us-ascii?Q?JArrlaIkQAFpflhy/38r2RUyqsg+IlQ62Z3hzvsV+yJW9Ewf5uClO7iNL03y?=
 =?us-ascii?Q?Y4GsQlvzH88Xwx3z025uPo4vEa1boonut6OrgW4PTNrwVbWdwlOjbHtKDUZK?=
 =?us-ascii?Q?+QIRmlWWqINvf5hXhy6ETS1wsYOFwYkK9cRkRqD8vudhdfi3JuhrGeY6vX9U?=
 =?us-ascii?Q?tdePZ7JpzkrgwmhMev0carDPvLEHWoHaeIrgtICTFLaB2YD1t+TaQKudgaaY?=
 =?us-ascii?Q?ZnwconXraB+hMMUdGu4zAcgUgxT5W0Kc5EkE+yNGVgHa+kKCBr0chdPvsloe?=
 =?us-ascii?Q?rNyDqbRhSgZvZpMuFj3K3gx2ZxF1gkQ=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 227ac2c6-660e-4985-dd0e-08def40716f8
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2026 22:07:22.2028
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Wz+QkpYlkut2G0KgTQO2fGFSobIZGH2ebO39D0/Tc9LIvXM0Ub6olF3f8qixk6YoiZSrCCIVY6p1oYu6HfzTTRlgj0Wo+yVN/tFVO+icH4g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5823

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

