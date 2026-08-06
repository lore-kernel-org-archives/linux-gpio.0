Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11021080.outbound.protection.outlook.com [40.107.130.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 866F042BEAE;
	Thu,  6 Aug 2026 22:07:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.80
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786054050; cv=fail; b=JcCKusrEv8esIkrjeod+1Kn6EOXf4dLs5Tkovs3jpyOUnFz/dzpndL+M4VSQ+1NH+TxIAqOmeKWpeYC/kXnR0/xGIoSfrr3cQc8hj28E07b59YhCvjyb4fmkzH28acWkm3ff/1PbGHkSq2qQuzRnk8Y84s4GbJQYP656hdz9ASU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786054050; c=relaxed/simple;
	bh=oL0BooMamQG9THpgFtFWaDraOpwSFqU7rdaz4y2jxCc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jUUa/Ce0FY9wTeHmKMiNUwkNpO7jtO5el5jQr3gTA/Jej504BeuANmukEam1Nyz4pRz9NYTNJ2skNgYOVfPp1a3Vzq5Ep2azhkBcSmhJBWD2RdlpbKTkXAK6xU1mCkfvvLGn/0FBnKo4ZUguXe3NCOmiwmvVG1jbymE8d/wdA+g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b=b7fZmXGR; arc=fail smtp.client-ip=40.107.130.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=genexis.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b="b7fZmXGR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xphEkq4IJHbuJe8MAGyIx4zpWFl4FU93nP2IB1J6wdl8L0H1xnJWgBUa9YXfgbRkslLedcKlyYWFfV06/3j3POY2fmisL8s/4tru0Nz/kixgHlcEnU3/yVfl14GmcrURF+XgfOwRvRAP1cZFV3Xqb0SrnfVqjcMO1VWcnF6OW8/XhYq24ea1QJERM6hhJhuUbw1uqw3qXDXQkxp9JQJKcacFeyZ3k9J9+Mtt3ct8QvTxgF5OUm9zy7AwD9DN5FcC99kzK2hB2l5DYo5MaBjlkJpFTQJSjboks6ZWpYkhgTqsN6BLVqdoTs8bU9BTFXKu4QcRl0uwJFA/d+DBUi0nPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kSGWTYGUz+p7AU31oDHQoLQ4cPUghCcaqPQeA6lbcQM=;
 b=I0l5f7TuXi+m+xWewtpa9uxVFehViR5731iRo7Rldyjw4nuheOJh3TcEzMWfl1zraep+kGIk8DMaWma7GNCzMcyIhl+tOkf4fzGGcOgLAZnKjnzDMrlpN7/14AcgbTcRX+gaBpjV6YxVpErxqfpw0l3i48QzOCZFmBb5A+q+8RA6puR2CAcW7rAD8J49M3MrhzT3sMMZUQVLaRJe25fYGmGOWLEx4+tbJy8SrZ+KhHabtvkoyV0JKWGiwNZbMERttVISgXIo+4APqmHz5FcbOMDREr2pxNWPGHoLNj5VzDAhQnFBdM24ZVE4Hm2RifaZW+1FSk5amGPtrio/i+OXpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kSGWTYGUz+p7AU31oDHQoLQ4cPUghCcaqPQeA6lbcQM=;
 b=b7fZmXGR9qRAzousJwFxOFNT5pIg2l7TM3JMUTY3KI3VSLpaMyEuE0xV3sg+7IKsKg6NiYUBMJ0FdUMF4qXh5420NuW+3I2x2got0IvKrwDv1l/+gwx7faaRylQtdgsDZIqEIQnxPBqfAKbB+ElvhFsra0zNcRmFMBDBYHWIpaiHwqySill5v8Kga5rYHUhUtq/PyuYdGdc/JUb5oF638wlXZQOIN+liboocpt7wLpqtnNZU3c8PR3vUrT1otq3lmKyWwEMcCm1lzfjQ6ncGCyylclawaY5PQ91Dp/iNFNjpmS8mfuKrxngCaHhlZh3YeE1b2URgTc6mlew1m7xTDQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by VE1PR08MB5823.eurprd08.prod.outlook.com (2603:10a6:800:1a5::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.23; Thu, 6 Aug
 2026 22:07:20 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0292.013; Thu, 6 Aug 2026
 22:07:20 +0000
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
Subject: [PATCH v11 30/37] pinctrl: airoha: an7583: add support for npu_uart pinmux
Date: Fri,  7 Aug 2026 01:06:08 +0300
Message-ID: <20260806220615.4078303-31-mikhail.kshevetskiy@iopsys.eu>
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
X-MS-Office365-Filtering-Correlation-Id: 8626bbae-f8af-42a4-5cc3-08def40715e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|23010399003|366016|1800799024|921020|38350700014|10067099003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	eGAxP0UD4QtbChI60nvEAr05xsVwCa+v7RWvnLf/hdpQ2J+wvxkyNv1/v6b17ObiCE7srZUGdILZ8vZRvJORo+NNaxQmVA8h4gL1gXJjZYlmwZCf6SbAgVQYhdBR/dMWiFuBR12mcmzyUUSfZAVXSjZN85QU6tSJ/Js2FkXo6BpFm+RnzCVmVAj4vY3YHxoB/RPrz2H7yDKLRvYUjo6ZUZ1lxZSFU2ieOgYlOngYKwuwhDgtkFTpkQVzbwqZyzOQhW1tLFkYaTKHyjmofP059sW/zneTKJpuN6J6+2QOTB8H83eoTxRLofLdlqmRyXC4k9CqrdhYLJznzes5TgyZC/TRGGMB/RsPr7qg1J6MSwV12DMCNzmYltVzjm1UOWWB5oU7q06gb4n6viLxPZXtUQD6evumWd1bECjFmOp87te9wmbCnR24yW55fnOKabAxSEzER88MG+p1rgft7uJr6ZPcL217mUZsrhLp4EKAEuAQt9E4NNZw89MFBDy5OLv+79w+5iPL/aWdFxGmoK4dbnRsISFapJOEwWakOb085ULIxEp0zFg51Ohj2ronnYPrYbTUumJgJrJLIMPWvi1iXseYJ7YznkgZGtbEdidoUTzGDx2xejuQT1uBrWQK7O6XrRpyYRixSOMD/q29kQbN7IRW/QB+Zcgm7Zin3s104QqGauhMhAWxJJJmaKAGt6lazRCsMEcm6Wx5S1C09WNlpelz+etB2h1BCSWZLNICnx6mhvLRl9f31gpsLVCqrAOb
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(23010399003)(366016)(1800799024)(921020)(38350700014)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?JN3F9mT0r3iTbEq3d6zHfVzjxZM90l22keah2eByJPAFNRwyqp1eIdBomjlU?=
 =?us-ascii?Q?COSIlwxx1Ja5tMEpF9eiu3uA0PHxnc+FJUaThunsItV9oHtSTJ408kkUvMTj?=
 =?us-ascii?Q?fJOividR3XwuieoKv12hOqIlmfEQjhsB4jYQHffvmodoOHRCT6Xmosiz2f9+?=
 =?us-ascii?Q?8g+yLE0fWJXT/qT9YoHdDRZsUEr1lF0+CWEFaMset1jTX03PeZ5F0c486cHo?=
 =?us-ascii?Q?aEgLqc+sZXRmlgLoWHyHy96K0Gd90aQgja5+1Jp0My/ol9r2uKuDX3/rhb/K?=
 =?us-ascii?Q?nkO8EbrDYztKLLl+oWFHeVW/mUZbB14XsakWPoD/fa8OdplScmK90L398l5h?=
 =?us-ascii?Q?JzlqXiMzLhhGplY6nvl6jsNWdNxXsU3t7FAPyBOewC9PokLMiDeTG9vKRu/R?=
 =?us-ascii?Q?+LbwK07+6CDLqE1E8u8jD/y8xZ2byjCXD7QG77ttz5uu4egZmTSZQxDOolMS?=
 =?us-ascii?Q?3uVFQJlx9cUDkDcl/M7DGD0XJ2Z8rrbr5BioNa7yEoMbWZGFyX1S/UGhn96W?=
 =?us-ascii?Q?LsP+dtlgLoiGDWxTsMpUinUsa9LSWEDO8IYWgM0l6UTKEvCQMPY9FhObQ4IX?=
 =?us-ascii?Q?AzjhnwHOYOevs3oaSlGi+QZMhSsQcB5IYd4zghP7ldHYD61rWJbzTyRZFjac?=
 =?us-ascii?Q?me/JDHG4A+PzSjtS8/vn5yC82x3dN4p8eS4RPY3L0JW3dtzONLijydHdf05v?=
 =?us-ascii?Q?icVCPH3oVhSmbTlYZRfjbQ0mvfVj6yHufTI4jVj/+G3fnUsqFCcxQ2gPIY56?=
 =?us-ascii?Q?YbnFTtSZ/hzlH5dM3nccW0ywWwBTfi7+5ckowW8qtDBivXAOFHBmQgwsz2yW?=
 =?us-ascii?Q?oK1NNdTcGZ3FmndTT0KdXOMfuk3zG7D/h9cLkIDyFDYdx9aPerLCRqNiF/g3?=
 =?us-ascii?Q?53F9qM+0BsI/wCyHciqHGIsWlP2nkzSsIVmU+OENYN355Q799sG3HvazKngx?=
 =?us-ascii?Q?R0X2cKX1IK4UiswtZkv3DFyJqNb3ueBpwbpNdYx0+WY9JehKBBlhDdfRrnlA?=
 =?us-ascii?Q?pKeJUGxTkZB2rli6MTrgj1hsiEAq0npxIjGPdgJB5DozEwibj/sFmDojIHyh?=
 =?us-ascii?Q?Yr65QBkXUs6Sys/Fc3/sKtUjp9vLQR+q1RoNtyBqU443HVWFYVeXZELdGHCR?=
 =?us-ascii?Q?ZwPYpX6hM5vBRnw6XEP0/NXNQznoSO7a/VoRemwcdiGJ0FG6MaUFfgfhU2QJ?=
 =?us-ascii?Q?Wj6kZRIJpqcw6WwPnzoUxOTRnlG4P9DRcK5axct4OYZu9U9OdqZarEhkmNdE?=
 =?us-ascii?Q?Ni8j7ramFE20TXwxNWP7sJmWka1QHQSAESSsNlvYUVrU8OxlNAU5K1iwznvF?=
 =?us-ascii?Q?4e6oc/m7bkr8D0t7AXHA3CPSVrxLHWk6Hw4tyShyu/PDBCrGW77foRkNyZwD?=
 =?us-ascii?Q?NMsdg6VS9kaOBZ+d0vIYxO+lkn+9HaAyFcPnMOkynOEePvthQMd/un/RcjIR?=
 =?us-ascii?Q?U/yAVlN49aTXBAuAO1cBa09x+tMxW7LnTBs0OKpT9MqJ/8W33nrI6YjEHV1n?=
 =?us-ascii?Q?0EOO6TUD/FEuPsq3jHG2KFE/CxLreEaSexPPFFiULRHZa14mUhvN4MpwORvm?=
 =?us-ascii?Q?vmU5dpqfb1G4vSdO4u/Ptrc3WPay9Amve37OBzKGV1yXBBJSqpVwURzlX9GR?=
 =?us-ascii?Q?7wCMhfcIfYzr6k7WQOH8BKOmAUSYHsFvt2KSR2FrIvv94XqRi/oPv6NUBxId?=
 =?us-ascii?Q?pwqaatHYpaW4Xl1NADgXqWqsG8bO+wLA61mYjXSuQk2uk1mTJ7vaioEsqT9O?=
 =?us-ascii?Q?xgZ7O3nmDT5NinixvRhCvZmgS8/UGcw=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 8626bbae-f8af-42a4-5cc3-08def40715e4
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2026 22:07:20.3685
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i5OenI7+aghgqr4SAQfEvm1Ed+GEma0TAXA9r642vnoMZfrzH5VbMI7YE8ABiixcCQonmbgQgVjENrWRf3bCfNZxUPgRPtvn61GiRga59Cs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5823

Add support for uart pin function for npu_uart pin group.

Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
---
 drivers/pinctrl/airoha/pinctrl-an7583.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/airoha/pinctrl-an7583.c b/drivers/pinctrl/airoha/pinctrl-an7583.c
index 44efccce78c55..dc88cbd8746bb 100644
--- a/drivers/pinctrl/airoha/pinctrl-an7583.c
+++ b/drivers/pinctrl/airoha/pinctrl-an7583.c
@@ -68,6 +68,7 @@
 #define REG_NPU_UART_EN				0x0224
 #define JTAG_UDI_EN_MASK			BIT(4)
 #define JTAG_DFD_EN_MASK			BIT(3)
+#define NPU_UART_EN_MASK			BIT(2)
 
 #define REG_FORCE_GPIO_EN			0x0228
 #define FORCE_GPIO_EN(n)			BIT(n)
@@ -571,7 +572,7 @@ static const char *const sipo_groups[] = { "sipo", "sipo_rclk" };
 static const char *const mdio_groups[] = { "mdio" };
 static const char *const uart_groups[] = {
 	"uart2", "uart2_cts_rts", "hsuart", "hsuart_cts_rts",
-	"uart4", "uart5"
+	"uart4", "uart5", "npu_uart"
 };
 static const char *const i2c_groups[] = { "i2c0", "i2c1" };
 static const char *const jtag_groups[] = { "jtag_udi", "jtag_dfd" };
@@ -751,6 +752,15 @@ static const struct airoha_pinctrl_func_group uart_func_group[] = {
 			GPIO_UART5_MODE_MASK
 		},
 		.regmap_size = 1,
+	}, {
+		.name = "npu_uart",
+		.regmap[0] = {
+			AIROHA_FUNC_MUX,
+			REG_NPU_UART_EN,
+			NPU_UART_EN_MASK,
+			NPU_UART_EN_MASK
+		},
+		.regmap_size = 1,
 	},
 };
 
-- 
2.53.0

