Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11022091.outbound.protection.outlook.com [52.101.66.91])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB3A742BC32;
	Thu,  6 Aug 2026 22:07:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.91
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786054025; cv=fail; b=XyZshaHkiQGuormsE+fJwUyGPAnmeDJEMbFkAG6SQhABftyQq+XXMc7AJkhzfxSm6TqIQzohdNQfi4ET5awx93hoPrNczgMLl8ULefNMf+8/FPK5C5pJisoAltiRquASQdcVmhPuIdUt/QnvWPNE+Jizzy/A+aVKZV4iXFFoJao=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786054025; c=relaxed/simple;
	bh=HKv1bzUYWtzmMSWBFq148NbD5oJqCA7CXLsApeWl/9k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Vojiaxrm1VFiu7SHBOcMiJEOzAjcwVeSUU6LjAXEkZNqLwLX/MYwLDSoexBcYLllA5bKWP7WHzkP+ds0pe5oR4eSXmuZIJEp5Qy/WmOUzJ+M+KuANCD+Kn3g6EtolEfYvk+hoTQhzjOipdnNavHjEfx0E9BpS+m8G8luOEhjElM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b=y+OEGIsU; arc=fail smtp.client-ip=52.101.66.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=genexis.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b="y+OEGIsU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yXUB/DQVwdSu0HbFyXr8W2uRhVV74/+JHIrHz9MuqQEZryFHPQgtWDzMx1HUGT4yccvVgZV3fmbb7ID2Jwkfs17ryBuMsoSePVJ66k0GDg8ITRP6kEtZmKkvef9h3+SPNfsOm1VRLPa1lbLyofVlAVZ1FzHhBSkGvcBwkfSnvkGf2gPiPCRH2a/5MFhtvOP35zxmiXuHrZtlIfE/JMF7n5JRvnnvsRCjxupdfuv0ZdVZUjrqL2CgurltZXCSojIjk+YwzXl2EM289D/2i5jealhptNeJ2cTo2mOrL+oav2J9wMWzamUYC5lH7LG6oZhjHHYIAOjbWbI3JJVXNzWZAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OM7bnxxG10zZkq/RqOzHH8UYO5hcbbG6ZLITg3IBwOM=;
 b=R6DuHIO6hEbGbBDqtkLOh+1r0k+iJJdDzaWNrMJsZJ7DXUR/eF3F658TI3NP7d9bz1VtUgtazioysjTbdhxHt4SX6AVWcPioT0Wn9XDjaFmHTWgGpcl8EgWBmdYUswPXERQ24dXU63F8CRugAbOTQo/qNM6VTgmnRm30JMcjfLeB/TbsdJ3XLlJaTgkBsHMsrTuhipGCOWKv/03iHATV/61GGoF5+OePmUKfA+diiL+f2mWCPeJUQBylzWhwap/Ux89GqirqPbfQRJJZe86R2Zo2qvs5a4mqyG0oHpUW36OmJnR1Cn0SWg+nS/XpGuPlU5ito+GJGBw1Xh12Ig0mkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OM7bnxxG10zZkq/RqOzHH8UYO5hcbbG6ZLITg3IBwOM=;
 b=y+OEGIsU2Av718/NCWOmpJGQ8SsxaTLM/9lqORQicMutOfKjFOWhFDem/Mio8Sze2kc0ICTnBewX6Tlhb9yMu5X0otMRMhxyWAIBBDvtbTZ/SNNHJdfRk9OtvpNk1C6GYLu51HfVuratbBmsYOONKEL5AMajkexqryEK4J05I/6f5ZoK+dskILJv9T0cLTzpmijSUg6uH9uW398QUAKlbJ54PHtTzXmtisan8bukpC157Sjp/+gQwuiCQlnTGT23f2cKdroaKiLB7tOo7TUe/RF8S0Lma76CYh7ptpLD9aNWLG1lH0OqcW9uCfbEy4X+pEvn4s8XlO/QJeQf2DQiIg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by AM9PR08MB6705.eurprd08.prod.outlook.com (2603:10a6:20b:300::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Thu, 6 Aug
 2026 22:06:48 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0292.013; Thu, 6 Aug 2026
 22:06:48 +0000
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
Subject: [PATCH v11 13/37] pinctrl: airoha: fix AN7583 MDIO pin mux config
Date: Fri,  7 Aug 2026 01:05:51 +0300
Message-ID: <20260806220615.4078303-14-mikhail.kshevetskiy@iopsys.eu>
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
X-MS-TrafficTypeDiagnostic: DU2PR08MB10037:EE_|AM9PR08MB6705:EE_
X-MS-Office365-Filtering-Correlation-Id: b335ebd2-e08a-4c71-046b-08def40702fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|52116014|7416014|56012099006|10067099003|11063799006|18002099003|22082099003|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	ooYIfVvJZ+TJFqzads2FrmRPv0VPU7dglWb3FwD3WRupHcLKcxyqJM9ijblzE8JBXm/Nu31YshkGQuWIbg/pQAbAH730zVKgJ7CbYa5Iz5WZgJjRTwS93rl7Y5ECM755VFBeH8gJol1NQMYZPqe8w38H6XCvE2wpnOJjr8jVXPIU5DfdfDBs4V7rin8NOy732vGds2m+pv4OkSdZ+XYjtpqt/OAuCX6FaP5kVhSChFx4zSlb8aBQ2E78kUQobCM/wc2WHwm7wPjtzxzQUeTBUiGISE8VW7ILbBYfzEVbeaEImhAmjaYnrCZiZXRjzyOnM78kn4LskwCNwBNT+ESq0Ab/OcINP2c8/CuEo9OPs57bkMAOz4iWOSuN1FBbd6uEU5FfamdPhEGSWjaOE/oWVjh+D4GRZskiEGyHN3t/7mEjgrsvQmZuWY0Cd2g48bMPcuibY4A7MbSM3DT9uvKuOUdufE4yHZteC8QMRhpiSYtdbYvS52cfVePCw/JgUi+j8ixMQW0zL/U/CCZMu97nhxwmmSQBUc0RWrX3TQXtEEqAuNlmopWLAwPDRsgUDNn/HFfhIcYFB9QLlvKaaj+Qp397qioPepxFxFg75Thkv//ivftlJD/aDKfhd3nOgWZjRNNUFi6PKFDX7cCC9o1cQSQIS4TljhlKIJTNnuFlSUfLLot4ti8TnJfhg1inSrEFrqL84aYXKgkHr1Vo7Wz0CiJASdbQ0X2+QwzwTkzGWyRgPt9eK914kpDTahAdwsL5
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(52116014)(7416014)(56012099006)(10067099003)(11063799006)(18002099003)(22082099003)(921020)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?OQ2GLa8B2v7uyXRv06CHED95y8QdduUh/8XOPGHQqTqigI0TCywAqEbeUINg?=
 =?us-ascii?Q?aRuhRfr6OTLWbspSf1qq5h8+0yGETJwJE/pLW47PdHKu/1Q+y5AwEb7Hzb2Q?=
 =?us-ascii?Q?gff3COuN7bIWOBPm6XSOWr5vv+EofwcdMYEB0eAT/tl7YVq9wclhBN+UG7K0?=
 =?us-ascii?Q?2gqBdH/2UhLNHVOPmTn4HPAqgMi0mOgnIBJh1VU3JmYImVcld1YcwfzLPliK?=
 =?us-ascii?Q?ihGOopbjDhqGtunXN9JFDvtaLPQNXNNncu/66J9pNOvnH4tO9L012WRvhmsx?=
 =?us-ascii?Q?axGIOa2rD0bsplroiQIiVgAN+izmPYftnzlYQjgfFuWBlcetBNkmA/4m8GS+?=
 =?us-ascii?Q?GlZt8syq3RMTCYzVoo/g8i2l/mSMXyRgxJ7AR2K79wLLv6FX5/CuZKMI7FKC?=
 =?us-ascii?Q?uxfHBesyx5cgF9Pv6BjUr0aRLaLHrK0CGlRfeKioucSXQ2zsp9O7cryv3tXu?=
 =?us-ascii?Q?4oAiPfV5gZNEDLzRb37TYPPG+tagTWlGXKNsVxEsB9EO2P97SqL647EdUWf9?=
 =?us-ascii?Q?S/vkU7s1Tw4NgvyqCOtOEOjGjWWvDayxbbgRgr0tdTe+w8yGpDJK5Ov5ug55?=
 =?us-ascii?Q?TP0ZoBu55SFcf+P/8RZFe6WoEh5/ZkLqlkSNav7Wl4hSHTpO1U4uF1ChGrnc?=
 =?us-ascii?Q?3Vjr8IreTKSNUdQ4NFcI9DHsNxJ9dDwSrBkmhfFj+tT7MePmFScn+LS4JgR2?=
 =?us-ascii?Q?l+gRxImV7TGqdBsdC6u8tYeU4cLdDsxSfln6k8tLSScP/h2E/aRSWTktZ2Kh?=
 =?us-ascii?Q?zzTZovKM3iH9iOUZik+zje/IJVMiiiz+EbXt+MwBfCCLPj4aGsyGR+uaoTZ4?=
 =?us-ascii?Q?U1+9a1t42tXAFzxwyir+T9WVbpsCIe/2mTiSfmOayb7gBEjh4YntourokkCf?=
 =?us-ascii?Q?nqVXQuf1Qqae9r9J5+WTBh8NuCV5Ud4SSQgD+GTerEjBJ8OhLMxIA4dtOIEh?=
 =?us-ascii?Q?TaEuiDUMJgapd1bzdB/U3MoRQnyb5UJG14P3dv0OjgiaLSDdX1CJsM4TOSdy?=
 =?us-ascii?Q?TPiGgrrL8BgEh+nt3nvHv+aw8n5dJIx9mKCwMRFLrFuhOKIoQvqqRtWM5xlq?=
 =?us-ascii?Q?5pVmFmHeKXPrjfBK1OU1Kv/7RCr6r9wXjpnAkeBoxWczzwYxN7d74cE/l7Q1?=
 =?us-ascii?Q?ax7HOA5/OdQgbJOwGsCo9oMTKaKQaqUwAQM0lO94GJoyCcOZATZgzOMiAsc1?=
 =?us-ascii?Q?uuKV3atycG7oXr9wugKeE57Rwxsmms7/5B3wcgvx/iib19dSQSw9yz1G++Kt?=
 =?us-ascii?Q?G9viFF5AC1Clj00ZSYLkUiRXN2Qrwb966nstbe+UKvEtKNjidBt+7ElbRQyt?=
 =?us-ascii?Q?+UzGrG4FjrFQbjKuTcfNvGEMELiJnCVUlShB1cOzztG9OmVJzqc/FofP7PFC?=
 =?us-ascii?Q?pRHjUgnLEe+ONL40E4Ltj2mVi2xHI06FZpq95MEAYpToW4vmWFVq7PoagiVO?=
 =?us-ascii?Q?Jh3eHXx6+zXyRJ5jkB8wvgAM5sI4hQ/1Yo4EJsXqgrE1dAmRp3wBd3z6CGKL?=
 =?us-ascii?Q?Satt3tVoi2LqyVzDIbYF8Gf5i4EcuvNJJuyS/KE+j6Jarkcmf2J1SmHvwpa6?=
 =?us-ascii?Q?BNQXZgEIiN2NnaB2goCY0YczhJqIIPRDM9GT5rBl0gXq0xYjS3qWkTguS9lp?=
 =?us-ascii?Q?LALYfaaXPpUjZD/dUnsABBtUkfJyfsLPpP2sw9sdtNB6ty759YaThYPOcY0L?=
 =?us-ascii?Q?Q6oWeHdeHKoEQy6IcHMgQ7LKRyE2/OlC6MVLoP5kg7DOu29s5ZuX2kMQgUY+?=
 =?us-ascii?Q?8VLgV8lB4lnmnkjYA59hn/bOiylyx1c=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: b335ebd2-e08a-4c71-046b-08def40702fc
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2026 22:06:48.6480
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7IEYk7Q5lOBoNYrOGHAjsyfluQv9mfDVZAttRnKY5HcRxEFvIFys2nANRs6n/62J92oTG4dFu1fW6i/kUAvFRd34oil6PY0BfjBoQG1e1E8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6705

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

