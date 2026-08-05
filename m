Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11023138.outbound.protection.outlook.com [52.101.72.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CFE646C839;
	Wed,  5 Aug 2026 12:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785933291; cv=fail; b=NnBISZ6ATdjPFuDwSc2m6WBa9MaT8RZzXSl0dUv0tDB52gmPxnmWWPidRDYj+iHeLaIEE7PM5mI4w+wTGxbMlOI/2rZjBatqYVPZJsXeY1m7yYbmjHBbJvr4g9x85TSt4ua3Nbr6n7EBziV1oTJsAYZr/qWtRGCDJlBRvWzHQUc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785933291; c=relaxed/simple;
	bh=HKv1bzUYWtzmMSWBFq148NbD5oJqCA7CXLsApeWl/9k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ZplBq99WI8yfAzRVgnVEZjhSc9svTSpa6FOKOlPsHD24Vuufxr2Yr5PcpywdyeRMECgkh+y9IXaqjQr6AK7N2KbqNVY19Jo0N/v5m4sRDDsICkeIGekEW9qEJ4xILFn+scgtl0pHABxxwFHxZGNHskDC/AyoXwT+J9BP0yadfxg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b=iEz+Rfr4; arc=fail smtp.client-ip=52.101.72.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=genexis.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b="iEz+Rfr4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yGs5ibtOlPt69Fiycw2C6zV9xOtca5q+wPDUPTsyQ6OAxxc3K6zEuLYLuFTxLHukidwY4yYJyDPNkrvT3OrNm8XXCCKXfJ9IPHMtUPXqlfxtoVd7LqBhrwDTcIY/O9dXi6odQG7lIm2d2jw0EV3rR6i8s/A0ySdy/zDwc24ePEVWHZI57XmGXjL4irZF1+18eACXNo41zOpos6HVnk9UvlxyuiQvtlOv3rx3KcEecdEkKuGPIJd+KMfqK0o+nN3uqLgNZEkA9ANMsqVegi8fULV2z4RkNHYrtqfm/bK2joX6rNnH65Os3FLILVAThZABtNoAf8WOL51Vo+rkig+2oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OM7bnxxG10zZkq/RqOzHH8UYO5hcbbG6ZLITg3IBwOM=;
 b=KctIsm3o/qFktnMnnM4dIyF+Tayo76GCPGNGgST+7jyfNLjje+7YUY7Z5dsuF0br4twZUAiPtDh9x2Tqbo9P6RxIldhGpxiY9LnQQJcLXRyNwjSy7bobzJZAzxraUcoNBAXEle2pcqCxEP3T+aQezAybEpvg3SJ/cf2Xr5PIS/48FZfwi5GLbnqJt3AS1qzZZVQf7mS+SnfM/ZVbuypJtfqw6c+Fe0eQhZb5OBvLvaXFUC8IS9b/1P5n8YgqwF1LyZVAe1llEEm+6kYMcYZbZzKA4d4qj5acqISXxV+PxwpCkj9vzCiDmnG3ccYrQJ7HNZPmjWejZvJAYR7e2Nnxng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OM7bnxxG10zZkq/RqOzHH8UYO5hcbbG6ZLITg3IBwOM=;
 b=iEz+Rfr43civYLPh/k3Lx6H+nsUDjOZbDUyRixMgZe2ozTE6Z6HXjLbrAD+ZBQrO7YRCy0JvRrK2IKm6w9Q17gdDTreAHdE9rFVhV/4i0aLQuJcdrWGxvxX0pGZTirGJ6+4Hap5hfXVc9DwR0mbXmx++k1UOhuyT+6PQrLhIafiQzTALIUqNequuoolJNCjUh0YJS8++6Ea0K5cdwuU0+3XE91FfnFtnpP2AiG2vKQu/P2k2DADdqDGqPq0nhLntFBFA4GG/waVQUe4dT4s7IBvRwR3ZG15yZMIxwlgIAgSSuB86pqt6SRtwpyDbbtuC/hDyeMhICvnhIg5Rpooutw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by PAVPR08MB8918.eurprd08.prod.outlook.com (2603:10a6:102:323::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.19; Wed, 5 Aug
 2026 12:34:44 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0292.013; Wed, 5 Aug 2026
 12:34:44 +0000
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
Subject: [PATCH v10 12/36] pinctrl: airoha: fix AN7583 MDIO pin mux config
Date: Wed,  5 Aug 2026 15:33:44 +0300
Message-ID: <20260805123408.3767648-13-mikhail.kshevetskiy@iopsys.eu>
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
X-MS-Office365-Filtering-Correlation-Id: 0dd0cc3d-b11a-402b-f3ec-08def2eded95
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|7416014|52116014|376014|1800799024|921020|38350700014|56012099006|11063799006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	/wW3u1o0wAShG48fgYeW5WC31wjev8NqnUAwxAUenJw5tEZfqiDk3mKn3gH3dP4qfE5+10zx4s1hRzcZxO6ZOVDUxKEfjj+UgwZw8Cosqf6mjXgewmolEcTb+yseoh7J6hUzrXwC+wt5l1KzPM2lv6Rrzj7zbJlvM/ruWgF461ay1+o+6NIIqk/SQX1ZTHwo8U6oDCHEBOpT0HYrVCXVIGzup306tSTf2+lRLvavMRG/vBmZomQG+dvpFxO+E1JNdcuCSsBavlLC3xymKx1pqYR+suvBooHO/TvN0MRM6s5XNZSmbEJ0FJ9MIxUQSHxogMj5b6tnxYXqM3ROg31xaMvxH0nkUZjRt8MjPPcl9qkWvmcMKkdbjG0DwD+lWWd1ePoC+mAVzX4dBr2N1Ya/ERshEZ9RrPz4G8t3NmaKc9FbFnofURbHQ2O5kNSmfQW1Vd14rnZS9n5rPHguhP3ZzeWKzQdjy19mrGKkEk5wFSgovB+FiJWAD0BFroqwQaRK8/HehQumxjM7YUEmt6BEi0p+YC2ogLEyMf8MjVdXz5UXntTvBD/uZk4/G5bM15xzvhvjDbBSMZYsgdF6AFmrDLDp157GhLBFGpsxxAkj0xfB1apySbk4tg7+sBfRoXlVq7CAyIehLpTKPv7iyoQZGwZ2KzXgNYjdaWQd3vvsU8NcmY7sizzuN1sM3/3qXKDDzVRCCtfWyymzXlQEerdG2Y/T3DbnS7RrLsqHILXCaINb6dIVUaXNAf2o7Hmsm8+I
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(7416014)(52116014)(376014)(1800799024)(921020)(38350700014)(56012099006)(11063799006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+81Lhl5OYVjm6zg3+5GV8icM+o4CMnkYHHbA8pjBGQTIinHK8n0qm22TExfS?=
 =?us-ascii?Q?7clpIB6qtSeJcbqsIRcn0AYFtI2Gfulh85ONIRAfpeNSvFHWeBP9YuoYZYB5?=
 =?us-ascii?Q?d0LZems6iwVmAE+rIjLne1RBiL3uWfg9vZhRdfcPhJQdGCICJKYUoKF8XBVf?=
 =?us-ascii?Q?0etPRyGN5wHFyEomWlkoBywPlx3xR8LxQ3CTM9h34mddT1S97/cQg8r4X563?=
 =?us-ascii?Q?FFjeproh97WgXvVoVMJSh8qGldVvt8eqvonWPMJChLkZ63Jnf1Qu9E6B9azW?=
 =?us-ascii?Q?K+Zy76WRN0J4pQEQETp0PGZPxlfnL5+lPIo6i9n6RL/GqkQ1srUroqIvofNx?=
 =?us-ascii?Q?udDgrjFTaSNHOjc+KJDnXEyyiLGP1ic6aVT3/7pyWFUUagBszxpu962IsFIA?=
 =?us-ascii?Q?TezvzBMFoNyPuC1gK96FdkVRS6JAVX2gnOBwtPqPXLMTW+xcWyj7x6sOL57+?=
 =?us-ascii?Q?l5bl/1W0JffFBV6i1kfxKbF9fsoA3TkyK//hB9TmCbkk9p//zMV6YsRGksbG?=
 =?us-ascii?Q?8TuxsHKO9JN4oAEz0qHJ5VwsXWLudvd09gTUZecSovmMzzbdpi9BgdJpZuKe?=
 =?us-ascii?Q?KgE5I9nIJzPxt7YvZVl8rgDiHXgFD7UztQ5mq2p9jHeevvoOuv8IE3JTdR5d?=
 =?us-ascii?Q?nuqPSifU0JQLDVT/DwUysol8aRCnzct6uw0OaW5nmyTHRlIjlD8mu6Txmwyq?=
 =?us-ascii?Q?SAMrEzmA6clru6k6lZgm0sJOEHg6lJeSjByPrCbL2qR9ig2ScdH7wzt6V4HP?=
 =?us-ascii?Q?TTk5xD4KyVHm/1buY05GbceGtddcbJsIAgPoddrGFzl0+msvdc1by6kIWIe4?=
 =?us-ascii?Q?fqqxzjMGlb6WdyxUxv8JoPQRI9a7Z0/ZIkxGZ83reM110uqhL/0i0RE1ICyb?=
 =?us-ascii?Q?DgcARN16g4JNdonbANI2NMc5zx4x7/OsXXHwddCGJSpqrEWDktjR8kcmoHsm?=
 =?us-ascii?Q?vz51cMmqI+XdEDuOoheUAPxtY0VRA4y1x3Az/engp88I9rq27uGFKJISjqly?=
 =?us-ascii?Q?tc52UH6BYGntwJDa3VitN5ATZiSOzjSmlfj28v0z273GZWg5Au/WfNGTWJhb?=
 =?us-ascii?Q?sKLJkPh5yIJT0AMVg1S07F9B2RgVwbxqyLfFUy0TSPLe2cFo3wgsDc6XyQD+?=
 =?us-ascii?Q?A1eFLS/veWRwNESrarld1O5LdWTrU1T0szTl7nPp5yFHUUYnr325QbNm7BdO?=
 =?us-ascii?Q?4t831YYQazxCaXAVMSRGo8d67ZgXB8k4gv+UD83nP03VYu+mGXbUANNUunX/?=
 =?us-ascii?Q?caAXV8/i2rQpDVqAK1YfY7ciFwW30n/SCsMODNWsUp5qqOl1S3X580SGoGYA?=
 =?us-ascii?Q?yM32FYFQmuSV0XoaFPuKNaV8S4eWxD7WgobAyzTvL0oDE24KW5eVTBTRReGp?=
 =?us-ascii?Q?w8ksWijGEydRjLk0lCkrp9fhDUL/UvMk8rU643EESdrhOy+fe35u0BnRO+Lw?=
 =?us-ascii?Q?xlszXUh4PlbbJA6yLiLxhV7AIUOmpgaZpeHRcqPTuGxlOkyX7pwF+9i/vMPm?=
 =?us-ascii?Q?0oZLgeQdynwfeCGeP9swcWVNyLEOg0UWz+dFsF40OyA70qCpBnYnJlcF1WRE?=
 =?us-ascii?Q?K77abWyy+IiZJYVLz2T1iujAaQmBVn3BY+fSZNqW+OXdlZELeFXq7fQz9t0x?=
 =?us-ascii?Q?BCBP5LbjTrV2xowi0dF0n15ArORkcaIJPxdQNRBSRQanArSVQZSMgAOTM3VB?=
 =?us-ascii?Q?bkuDdVOGaWXmll1E3qSd/tlygNdVow+nxvcz+pH+NmAumgGneQl1DeHCm2fX?=
 =?us-ascii?Q?YfO6aGOBlYqAs9WLka9mhYxneM81+Ys=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 0dd0cc3d-b11a-402b-f3ec-08def2eded95
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2026 12:34:44.2018
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UWRIG9qElLed3IgPq46vCl9SfQ4Zv0YeDw5FHpNaoX63yziagpJYx/9i9fjthUqwOg83iCA7oqp8xUirg1rDk76vo2vzi16f0wt93NSTpXc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB8918

From: Daniel Schwierzeck <daniel.schwierzeck@gmail.com>

an7583_mdio_pins[] pointed at pins 43/44 (I2C1_SDA/I2C1_SCL) instead of
pins 53/54 (MDC_0/MDIO_0 respectively GPIO 51/52). Also the MDIO function
group wrote GPIO_SGMII_MDIO_MODE_MASK (bit 13 of REG_GPIO_PON_MODE, an
unrelated SGMII MDIO mode) and GPIO_MDC_IO_MASTER_MODE_MODE (BIT(14),
an EN7581 specific bit from REG_GPIO_2ND_I2C_MODE).

Fix both by setting an7583_mdio_pins[] to { 53, 54 } and rewriting the
function group to clear AN7583_MDC_0_GPIO_MODE_MASK (bit 25) and
AN7583_MDIO_0_GPIO_MODE_MASK (bit 26) of REG_GPIO_PON_MODE. Both bits
are cleared by the hwinit at probe.

Signed-off-by: Daniel Schwierzeck <daniel.schwierzeck@gmail.com>
---
 drivers/pinctrl/airoha/pinctrl-airoha.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/drivers/pinctrl/airoha/pinctrl-airoha.c b/drivers/pinctrl/airoha/pinctrl-airoha.c
index ff77a7832d11b..e5ae703c0e0bf 100644
--- a/drivers/pinctrl/airoha/pinctrl-airoha.c
+++ b/drivers/pinctrl/airoha/pinctrl-airoha.c
@@ -724,7 +724,8 @@ static const int an7583_pon_tod_1pps_pins[] = { 32 };
 static const int an7583_gsw_tod_1pps_pins[] = { 32 };
 static const int an7583_sipo_pins[] = { 34, 35 };
 static const int an7583_sipo_rclk_pins[] = { 34, 35, 33 };
-static const int an7583_mdio_pins[] = { 43, 44 };
+static const int an7583_mdio_pins[] = { 53, 54 };
+static const int an7583_mdio1_pins[] = { 43, 44 };
 static const int an7583_uart2_pins[] = { 34, 35 };
 static const int an7583_uart2_cts_rts_pins[] = { 32, 33 };
 static const int an7583_hsuart_pins[] = { 30, 31 };
@@ -809,6 +810,7 @@ static const struct pingroup an7583_pinctrl_groups[] = {
 	PINCTRL_PIN_GROUP("sipo", an7583_sipo),
 	PINCTRL_PIN_GROUP("sipo_rclk", an7583_sipo_rclk),
 	PINCTRL_PIN_GROUP("mdio", an7583_mdio),
+	PINCTRL_PIN_GROUP("mdio1", an7583_mdio1),
 	PINCTRL_PIN_GROUP("uart2", an7583_uart2),
 	PINCTRL_PIN_GROUP("uart2_cts_rts", an7583_uart2_cts_rts),
 	PINCTRL_PIN_GROUP("hsuart", an7583_hsuart),
@@ -1081,16 +1083,10 @@ static const struct airoha_pinctrl_func_group an7583_mdio_func_group[] = {
 		.regmap[0] = {
 			AIROHA_FUNC_MUX,
 			REG_GPIO_PON_MODE,
-			GPIO_SGMII_MDIO_MODE_MASK,
-			GPIO_SGMII_MDIO_MODE_MASK
-		},
-		.regmap[1] = {
-			AIROHA_FUNC_MUX,
-			REG_GPIO_SPI_CS1_MODE,
-			AN7583_GPIO_MDC_IO_MASTER_MODE_MASK,
-			AN7583_GPIO_MDC_IO_MASTER_MODE_MASK
+			AN7583_MDC_0_GPIO_MODE_MASK | AN7583_MDIO_0_GPIO_MODE_MASK,
+			0
 		},
-		.regmap_size = 2,
+		.regmap_size = 1,
 	},
 };
 
-- 
2.53.0

