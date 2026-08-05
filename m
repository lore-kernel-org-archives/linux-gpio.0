Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11023138.outbound.protection.outlook.com [52.101.72.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 227FE46C4D3;
	Wed,  5 Aug 2026 12:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785933290; cv=fail; b=lWLOSm/1fiHmvvqyN/UPi1AefqbTyJFLAZ6lI1bmi2hZAItZfJ5gDX5oHNphaVi9cycQG5os9rO+wWN0oAB+ZdlYYXmqOzo8Vt3iDOdFm/X85Ys9hctLNI73PzQ8hnVkV5EjBkuG5e1qNaL/B3LAUHOhC5sidy2uqgu9eX9KYY8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785933290; c=relaxed/simple;
	bh=4C/RMWG30NsNQGseHFbVfJY8KM7CftHDDIkUnb28Uyw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=dbPZiOlGHzzh/+hpB9RZLRlA1dA663j9+2iSSID3aq6ZAiWnzes2SH+apRZ/XgUcnyHNcgW4xnCYlbYetRzvkqExQjdbTcsQlBHyDFTSu384fGoD+oNuMqR4bjzTLZBnK/iB/wdnC9sb5NFvHpGxxbw0O563BaLNIYWaxThYFjM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b=rtI4ZPJ6; arc=fail smtp.client-ip=52.101.72.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=genexis.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b="rtI4ZPJ6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Pp8uKP947VGZJN/2McMmdqnOapPcJZQYgE1yg/bqAhzwgnOoODhj2m7elYMyLxi2bqRk4lAZUpXiaiVi++hRqRlu+q/nJlWhs0c5fnOMcc3ofK6hgrZxE0jzIoyZ7aHsxvkd16VcHZh93j7iLRTacFa3iPli4f6MHC+8RxqEol03q1V4087OT59jSm/8CAV2OBmIsrjLrPSNUlkGpyihDPN1KaJ71A0RDo19cD/GOAg0A8NITgrZCRsvzRYq2tQrea6mrXMvrKKrSOYy/qW57HvLqPL3J+qXFPZnSpP8O7RGsv5Wzq16PfLBjiA41ohAkGuD4h9DCv+4tUGkizoYIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oBj0IHire2KuEO9ACnbQOuA7Xwq0cNeUv4zo1WsCD5c=;
 b=rjmSgi/wbRKZd6FdhshdbwngmiqVJCJ6NLdHQyZlaqd3MOfoAEa0sEHuRozI4L47crlyUbUp667w17Z0GoLKl99U4by9Bj9ymEas8gdkECEw5y8dm6DfUhACBKq3su4PJzecXPxrVxQ36UYxasw7NcKgKT+Hgy1Y8OwDB/907/QxU6/Xh63XoV3TM1vC32K2afWLrpheZEiP7Ad4xd+Pt3P3njEPHcGzk7/13iWFWnAn8gJ2PDnsBo+YtvRMcRgqO1UUmNWaVMSJIuAUDkz8OriDK06iV7BM+eIKtCe7SfNbTUAyO0Bu/QsHCaKeuKHr8Rkb1/VKObNT4BlBQ/HBzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oBj0IHire2KuEO9ACnbQOuA7Xwq0cNeUv4zo1WsCD5c=;
 b=rtI4ZPJ6rWoxC8kNVOWQiCYwN83unCfVbbMLpqAkFiGwjZSGkQJ30+SCZo2DORS1N9eRbY1mMJjqTpZyd6p/BVESJA+8XiKKICV8X9HBMDr2eVeTlOPqbJWuvt2oW9nHvgIiKsVqS9xPZhISa4qlNNp380dWyXiKV3G6Jala07bzpNMdOQSSkFPlFSTCK3hoCsifLEHG/JkozuWHSad7Guu3hSPF0RzX/riUlRGeFS2NfVdLtfMTnBMP+5CRcdYSjo40potZKdJ8JIbipBtjIVal9HV8nY0Bp63DlR7cn4hOqnM9EqhHZXxnwAPBR5qXDfVYL//oG9MmPZkw6z8iDg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by PAVPR08MB8918.eurprd08.prod.outlook.com (2603:10a6:102:323::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.19; Wed, 5 Aug
 2026 12:34:42 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0292.013; Wed, 5 Aug 2026
 12:34:42 +0000
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
Subject: [PATCH v10 11/36] pinctrl: airoha: fix I2C pin mux config for AN7583
Date: Wed,  5 Aug 2026 15:33:43 +0300
Message-ID: <20260805123408.3767648-12-mikhail.kshevetskiy@iopsys.eu>
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
X-MS-Office365-Filtering-Correlation-Id: 6e7fcd77-3b78-49e4-656c-08def2edec81
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|7416014|52116014|376014|1800799024|921020|38350700014|56012099006|11063799006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	SalhpBqqRzVvEEd8XgN9cD6Uq035nCEK8ZgzLVDXNyoMAU82kH1tifr4TQbcEIyz6XQ6yEhEtZTBd9UJ98naRY24iClmp0+rP8bClQirmEv3RmdQWWBS8767sXj8g3WwRbq4+qUhEk/qXy7E2lj5JGmLq7EjUMaEDWTCmYcXOJhoCi2s4JGckoZJBrkMvwitagaASLtRAJ7ratziep040446nSuQdhyoQJ6+55A5IcZsGQey7rDRSrXV9+kDMe26fsV6UVRiC4JOO7db+6w2Vvq1ioA/gN8qX8Md5P2bYBUfpd6BDrwy3vBXZNWBGTZvRRh0s3ESfZC5CYmreBqzXXQIqN//hGl+hvcbEw+6kLRufZYiQRodpqDRL5bJXNw8B4MPwMqCtlH4/BsQidWtP2QHAgB97QTOknZLOKe0zvj1RFeOD4lLe+QI9yt+mUFK5b5u2dOxEQn+gSM0sT/yvCgEPW+szzOpofHcUjEo35WZ1fkoYSFV3Z0Owv2NV6bIYjFi6xKCwJLbN1gf4RVyP4Cr20YFwzOxmLCIqIVwg0x9TnXMGMRtkE92HdjWFowDtBjP7eB07okbsGO79+bFq3ZnYPIKmHwdEXcRp9qwoVsyc/4sBMTsImQ83lXXRZ5/JbHfrJEd7VkX9sZtQTquB5jDt0CiN1N/IyNAgIaIhYCbQ4E/nV7Bzmb1RX8tgB8l3nZSXaPYmnfWfmDMf++PUiVO7GLEUQLNr6vECnM4dTJI2+sp7eKNnR9s5szSm9j7
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(7416014)(52116014)(376014)(1800799024)(921020)(38350700014)(56012099006)(11063799006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?HeTvh1Q78Z+K+OEaMmKsMHVhL7ON7FpDVPCUxwiqkoE/yh4V20rZu2xsj83O?=
 =?us-ascii?Q?WFC8ebEZ68lxQfL3K+sF06shQz8YDBqinJxusAOINKfPTqMHaRJcSJahggdx?=
 =?us-ascii?Q?DR5kKl3YMm24Nt5/uTaPlt4rCpuY1cQUAK1eRDO0lGaaAWVNSwsNEHfXo9DU?=
 =?us-ascii?Q?87WGawpiZ/BUDIbutctc7cunu1Sbu+aOQ79cGd6VaSWL40E6IgoimHKiTgC5?=
 =?us-ascii?Q?oF0hU7CzluxI0ptRURG8QwMLC17JozNMW9beEkU/uf+Ute+2EjWQyFRXgR7E?=
 =?us-ascii?Q?Hq2PcC0IFkXk6ZLmfkz5vJfcyvoPhpblcvYPIfo47xpXIf+GY6a3rF1ExuVZ?=
 =?us-ascii?Q?YQbdSFVRLIURoMrFFxUN/vKEVPHPZLgddE38ofVCJsp2/qDZkwOmFZNbH8JQ?=
 =?us-ascii?Q?lzEb1aBYVKv1qyo9C3H6/7ybjTdoooTwMz9MKfM4P2fxTtFrsgr2n688QR9m?=
 =?us-ascii?Q?h+08L/Yc81LAsPzhJBmFvclWhAkBpXNBeSFmvRfGD6KnA11N+APfO/+yCopj?=
 =?us-ascii?Q?F4ABeNCBlIMakHNy9qNsOhKn7sqIDfKhScSXNrRI3E5/RTPSGlVmRx6OZZKJ?=
 =?us-ascii?Q?44CpUoJLgtCq95S6oIDk17Ba3giej2APUQnJkPMgYQ1U3r79iNKyYB0CQznQ?=
 =?us-ascii?Q?r0WjeHl/GHbMNolsScVn34GpBy4M9XRORKVs4I65KpTk4vIQRV85C+n6A6vn?=
 =?us-ascii?Q?JXUzR82eOOKMc6HXXF/zaMw0zDzER8jOxFYeJmyYFJJxj5qKJG1QbiKfEpNK?=
 =?us-ascii?Q?MIDXcmFvk+jVkqxKfxGcoXF58iDhEArFWrdJjZJYzjjH2jazNeFXXEsN2z/a?=
 =?us-ascii?Q?gSQduJuvJXQFiA8YjkDGuDAKq+wLzU3c7WN7B2AbV2yboxDzrmef9omBc1qI?=
 =?us-ascii?Q?5WMCW3WSnWyK2cSg50DODJuqBt2UiBKcAgdweusulNJar2lYa6w2N0Soz9PP?=
 =?us-ascii?Q?4WkshOy1y4MvBxHFymZGPM1oqL118DkMBZK8ZsmAFpr3zRzD8+jnQFVom9p3?=
 =?us-ascii?Q?e09qnWCUnlXyTjDzdBnWstSQY79DScmlp22fWx5ypGipjoZEOyoln4ApUGTz?=
 =?us-ascii?Q?ac11ndbePztPdkkTL/cD3N7sRCm2Ta0DiArD/Tmd7bzhvWgWhIRvc2/und0+?=
 =?us-ascii?Q?4WoovskdYlbmIQDZwgz3a5Pq4IRRr/3dhVFHa2Lv+OeAJSJxNrvvSKYjmHl2?=
 =?us-ascii?Q?Y8Q57zdzgWil+r1CjIpZ9xuLKtuKiwj838v80gLn3omN+mGveVgJdMgqtl1B?=
 =?us-ascii?Q?WBDUM5XoN5LX8fQXkOLtybJBUsSbaWYuMsLbUkV1JNxnhFlrWnJ3PdMOyrA7?=
 =?us-ascii?Q?a4Rp9f4+IP4iMxzRFI3vn0Ah0+tZjwL1ZaPCYoeIdRH5L/fGv7W0o6JXjeNG?=
 =?us-ascii?Q?BI4fGBsDIbeyHOrysu17z1Ro0AkwBL2+iAErU6NmizdmhkUJB7u9p2dZH3nF?=
 =?us-ascii?Q?HNomyf7SvXO/giJ3bLVy0kn/qNi8UzmU8rnEsOdWElOHLYewyrTSTCAGrfOz?=
 =?us-ascii?Q?HkmGJytocjCoO2/jw3orz11k3Q4UqG4gJijnZX5BkqeQ5EGm9fR3YApbGzW7?=
 =?us-ascii?Q?l3y9y86eUBSMnAEV/0CjAg99ZOuitJbXezuf/RPhvThkughJzdxkihtmL+Gu?=
 =?us-ascii?Q?X4LLHFg2126U1YaEaEDnV9DVGQtz/9t4xP9JVgKOH0xWnubIuzpWUMk9F8mN?=
 =?us-ascii?Q?P4EytE27FD0T88o8SzAen0+Pp/HobiqAO9hQqAgL+FUE1qiVYVDt44XglC3s?=
 =?us-ascii?Q?EzWOHpwnyvk0p3Mcmpyw2KQNg4b6Au4=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e7fcd77-3b78-49e4-656c-08def2edec81
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2026 12:34:42.3702
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /UDe3DMRW4bldHQEJj3/eaEjwabC4aSlDSOXa7D0zLUgiZTQN9bHp3vclXTXDoDlCv+13IQywnE9dmS9lRsZf3u+TjufiIiRCoWgOQFLZyg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB8918

From: Daniel Schwierzeck <daniel.schwierzeck@gmail.com>

On AN7583 both I2C busses have a pin sharing with GPIO. Also the pin mux
setting is done in REG_GPIO_PON_MODE instead of REG_GPIO_2ND_I2C_MODE.

Add dedicated I2C pin groups and function groups for AN7583. The new
groups must support i2c0 and i2c1.

Signed-off-by: Daniel Schwierzeck <daniel.schwierzeck@gmail.com>
---
 drivers/pinctrl/airoha/pinctrl-airoha.c | 25 ++++++++++++++++++++++++-
 1 file changed, 24 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/airoha/pinctrl-airoha.c b/drivers/pinctrl/airoha/pinctrl-airoha.c
index db6644bcd3aba..ff77a7832d11b 100644
--- a/drivers/pinctrl/airoha/pinctrl-airoha.c
+++ b/drivers/pinctrl/airoha/pinctrl-airoha.c
@@ -896,6 +896,7 @@ static const char *const uart_groups[] = { "uart2", "uart2_cts_rts", "hsuart",
 					   "hsuart_cts_rts", "uart4",
 					   "uart5" };
 static const char *const i2c_groups[] = { "i2c1" };
+static const char *const an7583_i2c_groups[] = { "i2c0", "i2c1" };
 static const char *const jtag_groups[] = { "jtag_udi", "jtag_dfd" };
 static const char *const pcm_groups[] = { "pcm1", "pcm2" };
 static const char *const spi_groups[] = { "spi_quad", "spi_cs1" };
@@ -1165,6 +1166,28 @@ static const struct airoha_pinctrl_func_group i2c_func_group[] = {
 	},
 };
 
+static const struct airoha_pinctrl_func_group an7583_i2c_func_group[] = {
+	{
+		.name = "i2c0",
+		.regmap[0] = {
+			AIROHA_FUNC_MUX,
+			REG_GPIO_PON_MODE,
+			AN7583_I2C0_SCL_GPIO_MODE_MASK | AN7583_I2C0_SDA_GPIO_MODE_MASK,
+			0
+		},
+		.regmap_size = 1,
+	}, {
+		.name = "i2c1",
+		.regmap[0] = {
+			AIROHA_FUNC_MUX,
+			REG_GPIO_PON_MODE,
+			AN7583_I2C1_SCL_GPIO_MODE_MASK | AN7583_I2C1_SDA_GPIO_MODE_MASK,
+			0
+		},
+		.regmap_size = 1,
+	},
+};
+
 static const struct airoha_pinctrl_func_group jtag_func_group[] = {
 	{
 		.name = "jtag_udi",
@@ -1966,7 +1989,7 @@ static const struct airoha_pinctrl_func an7583_pinctrl_funcs[] = {
 	PINCTRL_FUNC_DESC("sipo", sipo),
 	PINCTRL_FUNC_DESC("mdio", an7583_mdio),
 	PINCTRL_FUNC_DESC("uart", uart),
-	PINCTRL_FUNC_DESC("i2c", i2c),
+	PINCTRL_FUNC_DESC("i2c", an7583_i2c),
 	PINCTRL_FUNC_DESC("jtag", jtag),
 	PINCTRL_FUNC_DESC("pcm", pcm),
 	PINCTRL_FUNC_DESC("spi", spi),
-- 
2.53.0

