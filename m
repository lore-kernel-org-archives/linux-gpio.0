Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11021084.outbound.protection.outlook.com [52.101.70.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9FEE476CE5;
	Tue,  4 Aug 2026 16:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.84
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785859497; cv=fail; b=A2gp52V5w3RFnX6CC+TtA3geMyUCcpG0PtExBcEPVG6fMsYxx4a+95xKKqu0SyPdU0npz8GL95zv/uGFraa1edTH2o1E/bzVFsHuk8beQurNMZuWvp68vF8Def6QTWJrRD64edWpwYL8sq185UY3ufMnUvg5S7Xpi++SLbXkhrk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785859497; c=relaxed/simple;
	bh=HKv1bzUYWtzmMSWBFq148NbD5oJqCA7CXLsApeWl/9k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Nzj3lJ5ozoNfxlPqhojwT9cT9cX8r/tLli2b2h/jtLXnpJL8lhsxNG3wbOZhYHSs/qpbeHa3CFCDcwoya2kvQPHs9y8RwxJTOXE6PtUvNVMna0yw09R3p5OzFx/6E4sQ0M2eS1rSAENXlRp39dD/LEZKEyuI6eyI0YluZOIlHc4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b=JO8WJ7Xq; arc=fail smtp.client-ip=52.101.70.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=genexis.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b="JO8WJ7Xq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LgSQh0NLkLwESSs5BhuLKDKpA4dLPmWlxV9nwTVtan2Eah8h3YFFYyKS/S2U/KSoCZNB951W9abnXRY3BWTIr7O3rtE5y4IEK5USGf/WHd7sJ/clHEKBqX0TZZSaYAj2TQP5XAlF9aG+xyLHNtuGWKUkJZcnAvO4wuedps3mWgs5qVtIzewlFtkpkXzOUbL+gAgK+KDVJDqPcKSqil33ajvh8ZL6s19RrBANVZhyuyk40hw9twELejcmNdj2943Jdx+55oBcbGmOCI428pAd5vVMMOkJzEPu+q7wHqqJbuX33zXuXyb48zkHkrI1ru9UsfsU6JJ1qqrfwGq8FEkifg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OM7bnxxG10zZkq/RqOzHH8UYO5hcbbG6ZLITg3IBwOM=;
 b=cwRb4qQbR5GU7kkxn1zVA44w27L1YgYGcRPpcJzR/IMux+0nuLwRKYrSamYOZQRHsQ0SnKL91r7eTSPJd52UvzOv+0iFO0p67plJ7f58Af01G9F6UFG+QUVkz22QqC7ziuvtgbE94z7Q+1GDC6/icdsBV2A7Djr/XJX3H7faefehmDtUSbr56lqfK5f5eXzaKyq5mSr0d/8MyHlwsb0n1O9HDWYenZLkjWtnv/Xnq/6hX1gAgj1AmaKVXZcN0eZje7yQWKm5CCXtdY6n+RD5jvxzmfTMEUkkLDKKDde+x4PimWWbnvdw2YY/3noTa17ARM/6mCKor81St59A+XJ9jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OM7bnxxG10zZkq/RqOzHH8UYO5hcbbG6ZLITg3IBwOM=;
 b=JO8WJ7Xq+v+1jRVEfso7uqOw+nTU5XjpFUlSJP3/cm1UBNCu5RFJiHUUUlDJ0nLygYBAMl98MWnjNjb+vtO0389oZkcJ6r7INrDoFSMKVPzMRdJ0ZpR7EOL6JUc/NqQrP8OHANa71/0NnhkcuGEGvOTWwKnl8ODg2aNwlJcsZawbkHWTQD2Bkj02gHZfBaxdQkAJqnb+sWx3jmTF6O66kwO4ZzVuhTN3X9MnEb9oFj2l/xo+nZpq8UbrdNNYCNjpDWNjuX2XqFMmJXHN8fUwj83s3zDfwQob+Jwv/6G6Fp+o7GOWkl3p1JC84hJkEsZiJoatPTgjaZ+C080xuOBC6w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by AM8PR08MB5761.eurprd08.prod.outlook.com (2603:10a6:20b:1d0::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Tue, 4 Aug
 2026 16:04:51 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0292.013; Tue, 4 Aug 2026
 16:04:51 +0000
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
Subject: [PATCH v9 12/36] pinctrl: airoha: fix AN7583 MDIO pin mux config
Date: Tue,  4 Aug 2026 19:03:55 +0300
Message-ID: <20260804160419.3592327-13-mikhail.kshevetskiy@iopsys.eu>
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
X-MS-Office365-Filtering-Correlation-Id: bf4c99c7-7c09-437e-ea1a-08def2421d65
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|7416014|23010399003|921020|38350700014|22082099003|18002099003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	FAH7sWnNv/2Tmoip1zAq0O8SFnNrbZBDdCXsYX3DwjrDc/Gll0XmRPnPD6OdX2O7msxTSAX/G10XPDikP3c5sYY3MwN328Sdd8M2V0KyYAuGvX1p0EYMX3sjM6odHZjj/YRDutCVh8tvtWYqqbKJwbAipOIImyqR7eUzVonzvwPjZZNIRQmgul01URlAaBXL+HeoMbxnka3YO23K8HAc+7y8OHyEdNI76KfnYbMLIvAruR5TklmsFe7OocnCRYhC4kDp4844Jb2qHxOQ8pS3eEQhdIiNGkDPU9ohLPFCb/df036mbvoD9LFQ29qgXWITLWGPOqSsgHPWIdsS84WbN1k/JF8fW7t7yIz88PZUvHqTr4ajBDg3Vc56/1XZPwvoatMrV+FBXwmZ/Xh1LIEKXVwoyQMUh6qO3kl6qTxbrAxofc0fOzPZV+3tDrKdxSbrnG0of6COt94bHvhsbkT2785GBPkzf109ZM+b84Rf2Jw//QiO0EK6MXssL5qkWYQ6OUCW7PaxaeXrnfq+ZtoF1wd9G4c/l5+Act4f7Zn3+GZKx8PchobyeoTJaVPpa9oFKmVWt69elKvaW0L4ygquaUUtHesUp/tCaGeGNklNFzQNyb/XdilPLKTr7jPZvbVQ8RegP9U7aqXOa5Tpe6s34fOsbJUr9dZqLe1Qa7h5NiFD5AJ5tqC3N9PZisb+ZpFSz2qHtxF0UVI9LJp5X0VT08V0VQKjhTu7oRidHxucuv3gV26gbi8uEArcRGdZprl5
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(7416014)(23010399003)(921020)(38350700014)(22082099003)(18002099003)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?2fCK2O8h7QV/a0FNGMLUNOFz4lGmcdO3jt6V0Yr1/B7iBl/7N+OTqOeZOIvx?=
 =?us-ascii?Q?idGAcSH1Hog+NDO7ddRo4yt2so/1nHNctWw+uCdIlXHnxF2/ZIpJiNUVGrGU?=
 =?us-ascii?Q?75FXO/4y4FBsJmmDw5yEnToB6bJHqSrnJM2A2Bx89L+RspYUK6Os9ImG1dBW?=
 =?us-ascii?Q?Y9I/rbygOMIookzq/ElixpVAy6nTBk2l369OS6KVqv5LDlPbFSn2Zz2edhCg?=
 =?us-ascii?Q?H8Z5SKDthr97LtlQw61pI1CE91WuCL3y50E32uAfW0jHGyf8NDfpwl1pkz1h?=
 =?us-ascii?Q?8R6/4axdJARXQSpPvlsvmdK84NDCZkKXkqj1GJGl9GbzxGNXBU6HgZ6V2P6V?=
 =?us-ascii?Q?xgrBQa1gSCNOSobER9WV5wroPPPrseFyr4r+s1zfwIxfK7C5uVA6x407GB83?=
 =?us-ascii?Q?2i4+5DvL3nDXNR2h0RhqdOgzLnKl3Wl7q4CZDj6rGJFajh2wL0D4sZU7eLpX?=
 =?us-ascii?Q?kJp3ec9VPTcX+7qnr7hSx6GPLIktklp2COWCRwsv70E30s/ocme925H3mBmp?=
 =?us-ascii?Q?7CdLCKXYpylTqA8sbbW8Zhmh0weYSfAlWM96YxxZXduE9cOKcgGNZhgTcW/O?=
 =?us-ascii?Q?xi6E4T617HC0yeKsQoHaoq/5Tdb3VCm37DXWGWc42q2/bGcP4F8Yb8CXN6LA?=
 =?us-ascii?Q?S3u+6oOmGQQK7/rA5f0njvaKwggC5fVFCciZWVa2/kctp99vkour7c2ZQUMN?=
 =?us-ascii?Q?llB6LLPFf86D+pQKQXjDzHM4vk3fCWXqh/DTUXg+Xor04MDFts1eJsCJL5O4?=
 =?us-ascii?Q?PE6gyMx2Z2RgF5N/oQARiNh93U9yMMJQotv3jK/zMpfdhKW7jwC4sb6MU1ek?=
 =?us-ascii?Q?WHq+7eMeALcLwr5wzq0aOOMbTZDzHWy0wpHUA1y/gRL+D4An86rW7gkgrb3P?=
 =?us-ascii?Q?xGbgajxA8H1dvJsl8T687ljSy63tWuMt4PZMjmgd44wMBvzv8AP/7h3pmUkE?=
 =?us-ascii?Q?oPFhlLa0ALeAFdWtLyMPJdQchnh0jYE0xDuUTTvCjQUco9USUhbB+qGKF3kP?=
 =?us-ascii?Q?YvYJYgHcEm8IuxaLDAvGjOtSG2FGroB/4ddq66R4w4yDLDYWwsjpfgqaI/Rp?=
 =?us-ascii?Q?awJYmchEkFUMcSmPQY+EkQNXV/Qdh6WgK9P3M9z3lyCwwxA0uX+Sv2nn9SEp?=
 =?us-ascii?Q?Pu7Z/b7pPr+FIOrqZ8TFYXvHaj9/oORC8yGZo6g6cxuBMUtB83Rvh1mHEzuK?=
 =?us-ascii?Q?zqlBi+4lp83rQH3zU4dqv01veqlzhi2Ad2aqFY16AK6uJjgIH5CpEVDuVDQ9?=
 =?us-ascii?Q?RvVwzgDS9cucC5caNLG5hDO0R4obdIfTb7+HMuwb7/FsUzyYw+GaAGPFpjvx?=
 =?us-ascii?Q?a+C4kGuMtcP5Iy8VidZNMupn2hTi2Kqf6zTmHorNDtjKmfqLlc+fRjzPXKQm?=
 =?us-ascii?Q?aSwQ5RUp7bqyydGlbdBxP/HV6rhYCwKV+l8lENup0eJTqK7WKKYeRAd9zJcc?=
 =?us-ascii?Q?kzG1FJt211ollsDfjZK93IjIj11Tr9MluOCPewnTcmL/m2GLVU/PjV44gr+8?=
 =?us-ascii?Q?PRLad3tEoPLqOXq4PU0+FqwydcwH1UkPTpVqYirACgRvH+jleixhkyv+76wd?=
 =?us-ascii?Q?3kmtY1ryVoTS0mh9M0CmsKdMg/gaG+pGepZn8Tw7Mv9T2JhP/jP0xiNVmtsQ?=
 =?us-ascii?Q?RewH4jWR7RdWJbr7TZ5EN9pPV7rz6R37Q0nVRWgUqXVGMMr++HMpU8tfneL3?=
 =?us-ascii?Q?xZBpZSy9W1SJuZNYVCGEiYDgl2NpVILUxWZD8rRbEoO3gLhntFXv33h0kLIv?=
 =?us-ascii?Q?Cah/3i3xjZhXMp8kBtPcfVar88EInso=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: bf4c99c7-7c09-437e-ea1a-08def2421d65
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 16:04:50.9865
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XUC5QcY6Tl8xBojNd8VRYKk7V7XgazH4X1qPowHq1ks7qzyc10Q5jdnR7q8Ewj9tPl7euE57Fg3S2H4Lgh52WxcMUwAsOeIJ97ix/8AqWO8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5761

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

