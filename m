Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11021083.outbound.protection.outlook.com [52.101.70.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 880A041F35D;
	Mon, 27 Jul 2026 17:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.83
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785174131; cv=fail; b=UXxY57mzQQUSMs2iuJm2+UQFvFxuigssC8Z9neD3hwQhlgMTgyAkyQEti+JdRLidqIgyPDDSwoNUvSmZZ6EQLw9qZRJvHTSxOJUnxKShOIJmn9mB4e/hl3vSbHTCGBb5PxyhMTCnmNGvnnoj72nMmZwEZS+Ap4H1Ci0ogGNoXFo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785174131; c=relaxed/simple;
	bh=UimW22y4fVxkVdM6pgSU1MuQMtmRpg5a/bnEe0YiFoE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=LYaTf7LAKFlRlFmsv4/WHhViPbRYk4UpPPidL2zmXvW6wm5yR/6flEw7STjxcZfTRBZxuosk6HMbnn4EmUJYJocexJJOAZhAyN7sZO5Zsk6xbhHNLXdd5i35ks2HP9FXh+nhm6APezp06VQi5Xl3TnCp4UW63kGGJhPo3R2FHjs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b=dESXH7s0; arc=fail smtp.client-ip=52.101.70.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=genexis.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b="dESXH7s0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pSCEOQDPpmEZQbigJnOZHiBGKJ67OZu2UMgCBa8Zc5kg9BCk+aaNB+K526g7v3/rkrSED4qaL15P6FQ0dGDzYSQIXdFxS290+eAd33fN9bw05YzDcfuBlpTcZEfa1cLmtZCkr3KOPWT+asmSjGSDHJ5mmsbV35XtIeuNVuNtpFLIsfTAmkzFyQTuqdPU2dr0yFxw3Uy2URAV38y8v5MqNjfdMGwbCaMlSOxLdFh/rG1Np4S2iE8ctHrsxr083SxJ12mpVSHaHqmsUcSTb5EPGYyWkGVHzL2zULGSsesVHEexgfnE5/Es+nJoMGURMUt2IIAfS5EFdDL9Qsg8HTTlow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y8WM4489ZxUoA58n5FSRElPnVk1Rtke2MsT8nMSq2E4=;
 b=Jp+YWoFacBGBHhZ1BzOdVrbcs0wz7I8WjypKLOd8wvQNUoAGMZPG4eTGWr0nQN/2QSswzjSm0FryR2ue2JkahSeE0B90zjKfe425ZNmdyRntcfpYkOnTDpF1jz5+yUs99RvtLGmG0KgRXo7qsNM+xI/xdwXueTYDaP6IY5NiB+awfZRM5WVyYC1o+U6H9V8yECYtKAcdiDqJugpthfPmdnjFX9JYKGpOKZTf8/Mjw5BXJxVakiMj/wmQEeh6MYdVFQqFG4rnaUGHseavhTFpkDzpnOoKhK2oCb4GMjrHEQHMvU6InCo+Wc4l1rojMSSzVYk+EoU5mW6B51zc2eIuEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y8WM4489ZxUoA58n5FSRElPnVk1Rtke2MsT8nMSq2E4=;
 b=dESXH7s0vIIr3ZqFtBjXR179CiRufXv8+AZXtEc9pQ9G+PEjXa8hPjTnrpSTUkb6vTjTCoWVkz8WLT7+5PG/KmvFEfQSWwEFuxL4KtzrFBZdqx6cE+6uQYwmyIDPTrKNFLwxtEs2D5zUFb6qHzKxmrRrIPP7x3H8koJo2I90eTe+goAA3HR8AZYsAWdFzK5GnHWkZZryWTuOCfREvvu0t/VmEGud3gordYI5jN429SRMg1CSFPs/m12S7c/ZTfwwgeH/6qA8lsds/cPTDsUWtjW25q9EdmH4ompJwM4gzMIgTDTK27NN9AnAajkJVL28D35r/m8u0YUnCRGFQxXSMQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by AS1PR08MB7537.eurprd08.prod.outlook.com (2603:10a6:20b:481::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Mon, 27 Jul
 2026 17:42:01 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0245.012; Mon, 27 Jul 2026
 17:42:00 +0000
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
Subject: [PATCH v8 04/35] pinctrl: airoha: fix mdio bitfield names
Date: Mon, 27 Jul 2026 20:41:10 +0300
Message-ID: <20260727174141.664933-5-mikhail.kshevetskiy@iopsys.eu>
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
X-MS-TrafficTypeDiagnostic: DU2PR08MB10037:EE_|AS1PR08MB7537:EE_
X-MS-Office365-Filtering-Correlation-Id: f3dae933-1530-4fea-c3ab-08deec065cff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|366016|23010399003|1800799024|38350700014|921020|56012099006|10067099003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	4Ds0YymdW/jIrY36R9ULJZ3wrlctKV9VPDJ8zhl6R0qP5In8ZB57qTgImX5MLxqWF8RFkD85uCbze1yBTFWh3V1ve5gu5z49y/4WkqUD4B5D89yw0iW9TF/Y9obaAQaaaqShH8ZzrbyaQutyCzRjT39ME5jH2/p69QyxrntFF5hP96/wnsqFkLqAfQa4pnawugaWyTBVCrTCPbTAp9XHomSLxLeYujjVdbeL1+CrQBmK5LDBpVDx9oxF5vGnLqyWX4ZFKrO/z30DSnUePif4suqZn3JDugu0qXM2IlMDNZ/BZzb0uUpnL3miCzOPSDC8fi9JNDBVoK4q5THrYM6djy4rYx+gq3xwyyWRPBucX9UKZOkWrmwhtkBExdbrGSzbsovkGQ8Rc4d2XnUWgODN4EmHEEL9a71nJs9/IaYHIOo5CRUGiL4LkKIbhNQFTqyP/HQ/or040/bTy8ND6vLGrUYRaEPOXlfYqqrCCFLSWGorzphBLVJdOsupANMTQKGYFRvhp93NgcWVXKZqX9yAG+HeB8uw7k60t1n3dJEPUNZux3BkdPkozqbzJtAFtPbum38O2Ux7E4pBRA23lowinpMKzlIEr4jTmAoBH9V+x3Ka/nf8VkitnJsxcYF0LWHL4VH6OHlljxnET/6uGZeO0NDsA0Xd2xnhQD6e+k15MH0RlqA9RlesdsdLTDvwezP1p01aBdqS7bVP8Fi+igbwztuJbxezp/OCnWbzJcbmV2E=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(366016)(23010399003)(1800799024)(38350700014)(921020)(56012099006)(10067099003)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?fHGAasXC6MuQdGZStGTXLg7GRaOlnI0Sogjuu6BRKKRwXwRMIx/I076XPzB4?=
 =?us-ascii?Q?VZ7mENMjHHswdtOLHIFsIeqBOE8HkkoGe+1Adw6MsJSaQBjFiXGKfs22IDaE?=
 =?us-ascii?Q?yCgTt7u9HXQYNhF3vwGKDsESo5yRZ2MRfuGWsublx2C5HsJPi8KqIrRBvRpb?=
 =?us-ascii?Q?GwNsM9tMQw42t2CCwjZe0IqwaFvcYLUGYy7GbB8ZqdY5jAkjz86sppcOSp4S?=
 =?us-ascii?Q?iAe1ega5RQGBETsSB0OerNuKGElFq43Vuun9s5kvKdBl5FbLqXtS4MFO2jUq?=
 =?us-ascii?Q?yyFR2QwjxYlNLAoRFH0/DsFM4DBsAGS+WxzrNZ1j3CH27q10t7CRn6Eplmxo?=
 =?us-ascii?Q?X7Y6jYXcBiRdLXLMIeGTXaNzt/oL6aXhpyk8w0vBtN7pM4bj1KS7cxihRBEg?=
 =?us-ascii?Q?OzLCQOcj9e5YTYOfKxfUTf29NNt/eHpZfd/P+IG0/5QBJX1AlKd8bd4ZoTNG?=
 =?us-ascii?Q?qLhuELBGhyvRHLXu0WBkJd/+cbRAsQ9vpzsI+dV4y2R2FGbx9cYJ2Zf190NR?=
 =?us-ascii?Q?b8Ok6W4MiNgtFPumAW9gcfAGQywZdveVfNP6u2umi8FVmLR1AmxMS7pC12iD?=
 =?us-ascii?Q?v76bZiBjfKvx8bhx1LyS0DDk99em/qWs0Xy/vqv/o+2RYTxLFHjaJZ0W3w1B?=
 =?us-ascii?Q?teU6V3ufWvT/a3mChc3vdKJ0q0AbnfmJ0WcvMwhv9AV+/bpOaCllYNL7TG4Z?=
 =?us-ascii?Q?8DCjzTYRbR0rQ8zxPQLtB7qdqJOx19duXuyFNrG2ltiW1vjT+H1XXqQ+lp8L?=
 =?us-ascii?Q?+yZn1+h7SmBQKBzIidEjHiPSDp0gt5S/9THlkGv0CuRxprbrzSNcTebw42E4?=
 =?us-ascii?Q?uo6m5MDuefkfQDVG3zWFeGcoQdBh1J1GHmvyNsdW1fe3mD8DokSPkb/2fTVD?=
 =?us-ascii?Q?pnkJxT6YF5s42IgljyN2XH0Jr4p8boRLWWAn/YjevVGKzhtMDq4Eh1hVH6q/?=
 =?us-ascii?Q?H+P2Pa3v56mprP22/OdjdZI1D00EkGIuEohH7Dmgq1jaTSjYbl8VE7PEhRa7?=
 =?us-ascii?Q?TPVQZ+OBxrwk0bFVLA8DgxC3BCxT+Q6or0lvfxtdVTP2v5rdJFWyIK1b9xIE?=
 =?us-ascii?Q?PamNBlJIGpPYSdYpl0ecRX5X3Ww9IBEHJyitNf7MJOubFw+SkLgOkww5Scj4?=
 =?us-ascii?Q?nwzOY10KV98TMZGO7FRzrw4zChQU8DYqu4Rr5Rtz62Qj1FLaxyjClfOVbOTi?=
 =?us-ascii?Q?TW+UbG0Y/jTAML5T3t3nqSL27yHn+Y0edQVuIbFhtGi8nDEDQnblBvz4hJ5N?=
 =?us-ascii?Q?la9Oertk2Yyy9KaJ08qbhHxflBwlAYu80c/NVzDIgdE0zcBsZbJFwYyrbpGX?=
 =?us-ascii?Q?tDEWJbEku7e3R+jKws98BPqHZkl3c9wouJj+e4lYdJMO+AiYrirkQb1l8zQx?=
 =?us-ascii?Q?HI+QgIG9XWfLYyNhokTgoAwPvvd9SQMnNg2nHAHMYbWmmpqFJbBvx9JtzmlS?=
 =?us-ascii?Q?Tggv3Gz5069LhMUrAD3UvGhZwKXqhAP5ItWJvd3MrtYBvgGsXVvcTmW4K+U6?=
 =?us-ascii?Q?pWIojeQzByNUqoPevv1oVhMLJIs22Dm7vOU7SjItvR55GM2l7ICVtpUIvHXP?=
 =?us-ascii?Q?tNFdWAdk7rKevFPgCdW6ds8ipEe4V83+E1MfdQnIkYmuiYWTBr7Bo4WkNlAT?=
 =?us-ascii?Q?i3whqLSmr08Fu2L4qUZwzapbh+D23/DN410gFTZrb2U/vRq3Eguxudco2t/K?=
 =?us-ascii?Q?T3zd5LQ42He7gEyLlQoynzIuti5UTRUuifcXSvgMmlxuya9QHotJGrIYe0bi?=
 =?us-ascii?Q?Tp4YcsaNOBnNMGxYw1ambajkNLkXTRs=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: f3dae933-1530-4fea-c3ab-08deec065cff
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 17:42:00.8931
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UVl4HeOdg4hLsz17Yp3omZsjoJQXWcThJojHHUupqc6WMvkXD0Rt8BOE4vs5+fkTLNy6DqTz34H0pLx53qGrnJonELXtXIbk2HSHgteZy0I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR08MB7537

Fix misprint in mdio bitfield name of GPIO_2ND_I2C_MODE register.

While at it also fix an7583 mdio. It should use an7583 specific
mdio bitfield.

Fixes: 1c8ace2d0725 ("pinctrl: airoha: Add support for EN7581 SoC")
Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Acked-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/pinctrl/airoha/pinctrl-airoha.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/airoha/pinctrl-airoha.c b/drivers/pinctrl/airoha/pinctrl-airoha.c
index abfb018f207e5..e8c018620f1e9 100644
--- a/drivers/pinctrl/airoha/pinctrl-airoha.c
+++ b/drivers/pinctrl/airoha/pinctrl-airoha.c
@@ -49,7 +49,7 @@
 
 /* MUX */
 #define REG_GPIO_2ND_I2C_MODE			0x0214
-#define GPIO_MDC_IO_MASTER_MODE_MODE		BIT(14)
+#define GPIO_MDC_IO_MASTER_MODE_MASK		BIT(14)
 #define GPIO_I2C_MASTER_MODE_MODE		BIT(13)
 #define GPIO_I2S_MODE_MASK			BIT(12)
 #define GPIO_I2C_SLAVE_MODE_MODE		BIT(11)
@@ -66,6 +66,7 @@
 #define GPIO_2ND_I2C_MODE_MASK			BIT(0)
 
 #define REG_GPIO_SPI_CS1_MODE			0x0218
+#define AN7583_GPIO_MDC_IO_MASTER_MODE_MASK	BIT(22)
 #define GPIO_PCM_SPI_CS4_MODE_MASK		BIT(21)
 #define GPIO_PCM_SPI_CS3_MODE_MASK		BIT(20)
 #define GPIO_PCM_SPI_CS2_MODE_P156_MASK		BIT(19)
@@ -1026,8 +1027,8 @@ static const struct airoha_pinctrl_func_group mdio_func_group[] = {
 		.regmap[0] = {
 			AIROHA_FUNC_MUX,
 			REG_GPIO_2ND_I2C_MODE,
-			GPIO_MDC_IO_MASTER_MODE_MODE,
-			GPIO_MDC_IO_MASTER_MODE_MODE
+			GPIO_MDC_IO_MASTER_MODE_MASK,
+			GPIO_MDC_IO_MASTER_MODE_MASK
 		},
 		.regmap[1] = {
 			AIROHA_FUNC_MUX,
@@ -1051,8 +1052,8 @@ static const struct airoha_pinctrl_func_group an7583_mdio_func_group[] = {
 		.regmap[1] = {
 			AIROHA_FUNC_MUX,
 			REG_GPIO_SPI_CS1_MODE,
-			GPIO_MDC_IO_MASTER_MODE_MODE,
-			GPIO_MDC_IO_MASTER_MODE_MODE
+			AN7583_GPIO_MDC_IO_MASTER_MODE_MASK,
+			AN7583_GPIO_MDC_IO_MASTER_MODE_MASK
 		},
 		.regmap_size = 2,
 	},
-- 
2.53.0

