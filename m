Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11021121.outbound.protection.outlook.com [52.101.70.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 572353DDDDA;
	Mon, 27 Jul 2026 07:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.121
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785138181; cv=fail; b=ll0vMPi12ZG3V6J2ljJKCd+2n3gHJ5m4CxLeA3ejOl133ZR+QBh05Dxwwi79TW12PlFbNuxxQheT+598XZR3cnSbitGeHngrCtODW6RCjupSfQZH7U/M8Ulu1qv7mwdDWF8dPbhDNlCU1qpX6J1uWQkAaq9wVHJo3zD+JWgIEaU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785138181; c=relaxed/simple;
	bh=4oUwBn3cMj/krcS1RQePfOz0kIWAFlVWOkh7ft2bHDY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ZxhlEeNDlHz2vcWv3YqgIR7Fn/lUAJfyeqA0f39g14Wl8znBUghHkYljm5soyqHcXJrroiSxco3y6mTcQcBSoP/ynbcsLNqodSgDokcJ8LSuX3GRjjvnnOiv36Bxs83WnoXcunm40irpxgg8SpDgNb6rCM+tH38w/oOFdvSOef0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b=yaf5QzVY; arc=fail smtp.client-ip=52.101.70.121
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=genexis.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b="yaf5QzVY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NfekE5vNITsqE3MvlBKHZC9jx5+Nq3g0w81fojK5qmVvyPTbIKGjLMyKecw1Fu/ITjM6R5bQkcuech2k5lri7a5yywB2vEhO0LnsxXikHfZ0831K/bacOU5Mbhc2EBP9QlC87N+SOJHL8o6vCGG00InGfGLq5Npfyt7OrorIKC6ttYml9oaSGxgkZxEbCsGNIwKWfyLSo70CjAjsQgKtWRRNeg13ONwLPCHP7P3Xm9YvusRaHDYt+WP63dk8M6bNhVyv9nn2pe9wBj1IsGi1KW78NdpuWpwbFHccbpRi1yUX/jg8QOEkH2xA1E/GQcmYEK1yqN0yqS/Rfj29GxGibA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t6Tsee1l3/QF1Z54Kbcl+R8/jl5qtvia5eLgcfhjAVA=;
 b=buo2uEfsc+R5L5XQJevV1n8FlZrEGAkmshlHbfojqeorEhJx/p2qHYceOhBed5uwGRHZ2nT0SFaR7MomuOgXGHj6gwouUZykJywVSDvJo/Ugz7Gi9VTSb2czt/I/pMLj4cciZJBzbMjSXM9P65nK5bkd4G1VAsiJvxovgLvB5PBMfJcqnX0tnZfaDR+mzYANt7T8O3bhG3ZOzFgPpLSNGvlkDLO7DJR7ruXX+UEU9427yCUvQfj/dgPsnooOW13qiuQS/RiqVLpRCCBoIeDqSz1TjuKALlt7HGUqu4ZZH5/PGr/u5Xsj36qOmziNKcjjqAUIHr04IZM7PvQyoZXDwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t6Tsee1l3/QF1Z54Kbcl+R8/jl5qtvia5eLgcfhjAVA=;
 b=yaf5QzVYbsjP8hTLMSQJjzZNDEzQZQe5MBnH/8UzWLmqkYK/fWno3TDftQbdFpJWKee+iRjFZHp+h5iHDx+nw2BTRguwMX21Xr8iQJSntBO8MymgLVlShuGSXwrgFb1QaP08hprIP6lYy98+8k5e0bppk/q8iD4WPhf41RrV9LdWl8tiOFS+14pXnuySmexGzIBVPsGzGxVvz6BKZK9vgToAFyKgy7DQS9SdEby3J/1lZNZQ2PYpVMB/fPK03mOmIKXIRMFNd3jtXr/qOycqq3xIz0ckeR6T+BvPcwI8aPWGa+tsc7BtD6rg6fCtrjasQsNhv4+GM9ny0cmDSw+FCA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by PR3PR08MB5868.eurprd08.prod.outlook.com (2603:10a6:102:81::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Mon, 27 Jul
 2026 07:42:51 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0245.012; Mon, 27 Jul 2026
 07:42:51 +0000
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
Subject: [PATCH v7 04/34] pinctrl: airoha: an7581: fix misprint in bitfield name
Date: Mon, 27 Jul 2026 10:42:04 +0300
Message-ID: <20260727074234.3761170-5-mikhail.kshevetskiy@iopsys.eu>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260727074234.3761170-1-mikhail.kshevetskiy@iopsys.eu>
References: <20260727074234.3761170-1-mikhail.kshevetskiy@iopsys.eu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR5P281CA0051.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f0::20) To DU2PR08MB10037.eurprd08.prod.outlook.com
 (2603:10a6:10:49a::20)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR08MB10037:EE_|PR3PR08MB5868:EE_
X-MS-Office365-Filtering-Correlation-Id: 854ef0a4-d32c-4f6c-0cb6-08deebb2a965
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|7416014|52116014|11063799006|56012099006|10067099003|18002099003|22082099003|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	nWvgRe+SG96vzCZuYahg3Y6MKysnUx7XC+Y1LZfZQ9YslGAearGfjNZVuUZ5bAGegnNwpRoIRMChSxNpD2oXnERYWPKTCN6/sSCc+dReFRaoJJmep/iWx/Mnw4NDEzfZhbPcLpnJjXedplyw/euUd/MHCsu475QpK23VUaH7C7LhR7Ct+tJU7nUVJ2O7SpB/FiJi5DQewSJgg3RjK4jh1Jy5xZySfEmPwmtT1UGG5vtiQ/jtGdW8l0fgZhMI6/9Hk/Vtq3pOC9dArazNzUhI6M1HZdxyXOGEO+wPlJFsgxBEnmxM3MpbyygPvKQYAdxAS9LAojEkrn2mWWketaaUNoKuXAlIQBRm6IAiznYpVKn2kbTizXI6djFtF7P2C7zW3rHD5haAvFz/hv6eKi77HrKixcRLHYgnYWloWeAKEgGjJetL2NkwCWAbmENw/UJSL2Fdley0g287uUNmb7NkOO+1xnXWfRZ57P4MX0Y8UjL+8XHDx8Gf/exiQ4bVpWYQnNKfiqfuANgfBkhTNvtRZfvcpNG6kwnVrdRIbkLxFTlL+o6Xyon8hLOjGCdknGDw0KZnmXmAwzOeUwHSk8uMPm0AYoazAEI7i3uxRWp/67cRDBbGgdboCnURe6+UD8AiPMyZ54E3yIgJhxTtL0ludF2CgYV63YR2WGJbskEBBU0KsNgVWpQrIorGaOD8ny9Ssg2z8MPgyWEB26QzTlALnx/s6gdceAPOGKuRBG2KhGtwxVFYQw82Zskio0YzIgvx
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(7416014)(52116014)(11063799006)(56012099006)(10067099003)(18002099003)(22082099003)(38350700014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?K4McTmpSx70OqJEyqbWxk73bhL0s0wdtYwyKcA8jdoAjWc+lpIVFG81Qe5IP?=
 =?us-ascii?Q?no39D1meN39oweN1y83Z/vMxyzSUA4FTIpn6DtKw9nwTR/o+AW7Z1lD6XXZo?=
 =?us-ascii?Q?8e3cpvGur7/bnuJrMa9nVQ71wqlieSopwg/Z3lJ5b6BZaXVStIhadFpisk8H?=
 =?us-ascii?Q?V3NeBbxDWbb8eCydyUq4r4wnGm5X6DPkYaDdyoJ12KTFaE7VHBrxWC1eZrJh?=
 =?us-ascii?Q?xGmA8PVbFgJHxzxbsLbN0CeRBezS1bRPxNaQ4t0cOh8ojTP1ty3ARPUbaGPa?=
 =?us-ascii?Q?7+8oTSyrWtHlhJAtktjKSGSt4381pDabq8vI/Z3hdVIQoEKIyY6H9P5gWtfa?=
 =?us-ascii?Q?/3KPLG3BeVqS8F38G4iYv/wji8sbE4G3MFFeyf//SQbRA++a4gLX0JKOl+jz?=
 =?us-ascii?Q?VW5feJoiBv5s3HsIs+o4iwqVeopWroakSNPKJnIrb6t0QblypzEIKXDzMoXi?=
 =?us-ascii?Q?+B+eXfjJBVHSB1faxxh901d7dTTTrV1AZht+s5DiOvTAqJDFzE1dXX3qEvbZ?=
 =?us-ascii?Q?mea8hPhui2bU0dQNFILgGbZjozm53i2dRqW6VP6ASKUiqgl79wQe211qx3dh?=
 =?us-ascii?Q?u8lqaoFsdU8wcWFxVow+KdHtBmPtGpYxuvC//IYCk//K4cCVAAy1Sd3Oky7N?=
 =?us-ascii?Q?NxlK+n7N9aPGYokYzw7l9eo0shJQwpAyk1dN7XYY8qHZRfpzMDYV55CbbZyg?=
 =?us-ascii?Q?Se/OtpHyYl7kQevA41/tnft9H7SQajjHdZ2dagA63PhFJjx+VEsYoFh8ZLuW?=
 =?us-ascii?Q?3UBjUSHcIt9IgNFV/yoHe80kqUa5TpFi5ny9ekiRRCtl5w20YIAhU5BV6hnh?=
 =?us-ascii?Q?cJ7Z0fn7EsJQ7rGDtri+gsuw0aldNoFOM99Tjqu4QDEI5YA2Ie/LsZdNVqKt?=
 =?us-ascii?Q?SYy4x60t0jKHVmkao8GJHXpi61BR8WZ0S50ayTTkdZ5xhlRabGb/HbCDK5kP?=
 =?us-ascii?Q?lmmbDnBle8EfsRv0nnPa081DHRICD4+il5oXSJPvAG0GIf7iSCczw4MkqaDw?=
 =?us-ascii?Q?31CybO7FjU1n6UzvEvityIwBvQUhQZK1zTZvqsl/M+35t4isLBIX1x137EC1?=
 =?us-ascii?Q?LqTfZ8EkKwPEn2kqxMGjqFI+epu2wmI6A8yIiztDPv0/qzWQThyEaTXq3jJJ?=
 =?us-ascii?Q?AEiY09t9DngpHCVArt3OgcbZXx35OtzCgQhdEaDgvQrphktggFYEd6Y2ysKl?=
 =?us-ascii?Q?BH3uJd+yCIBHrS0zzW+UbwXgytjF94RjN08c8HJjolsZdbtLr6jbMl5/I+5d?=
 =?us-ascii?Q?DRWeYaMtNAVcyWKSPJZCTliTYJEzuXMZ1ZNsROoGLhJT5wC2Vtgp1C/iA3zN?=
 =?us-ascii?Q?pVz4qVXI9VWpUD2fMl5qO0ab42PeAErp4wzJYBaCTDj0I+/x3FrTbiXErBhh?=
 =?us-ascii?Q?NPbmEjzo3RlpN9b/6yzSg4Wh8Aqx7wk/wReUeAgHpHAGOOMrtHmVrl6rkBGY?=
 =?us-ascii?Q?Tvn7iiFVZtL2skcNE99uttK6WY5u7JHRHr0Qu9voZIYgzQUtPt1L9ks6w3mp?=
 =?us-ascii?Q?K43b1bVTvTS1kMZJSJlSQp25O4zeKGQbB+r1d7ycISKVr/mRwojt2Zln5hO9?=
 =?us-ascii?Q?vopT7wCihAS7ouIH+Uum0z7ArqetJFA0sIRIbzDL6e/35Av96g6g7Cl6kcF5?=
 =?us-ascii?Q?MONxYBBc7KL6eBiHZNJLBKhCCiygRNFAdp6hIx07rOelL+3HCSLhbf96kXP+?=
 =?us-ascii?Q?M/tf7pgMfznUT+oEZnC9yi/OZG7ojwrbb1W5dMqq2rZayE/apDgF4WzKGq9j?=
 =?us-ascii?Q?SOHXyfSd1e5MpM6XR5CJnFLasPFuY1c=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 854ef0a4-d32c-4f6c-0cb6-08deebb2a965
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 07:42:51.3894
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2yM94uqotMzD5oN3TfovKx50yXCcvAUWK2HQSnQxzlhZi30DUh3YcxynHdCA6CxWd8nGP8gB2QXhLzsTXCqaS+EOkO9ljT7wspD7psgblVs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5868

Fix misprint in bitfield name of GPIO_2ND_I2C_MODE register

Fixes: 1c8ace2d0725 ("pinctrl: airoha: Add support for EN7581 SoC")
Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
---
 drivers/pinctrl/airoha/pinctrl-airoha.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/airoha/pinctrl-airoha.c b/drivers/pinctrl/airoha/pinctrl-airoha.c
index abfb018f207e5..a3cfee6ace778 100644
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
@@ -1026,8 +1026,8 @@ static const struct airoha_pinctrl_func_group mdio_func_group[] = {
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
@@ -1051,8 +1051,8 @@ static const struct airoha_pinctrl_func_group an7583_mdio_func_group[] = {
 		.regmap[1] = {
 			AIROHA_FUNC_MUX,
 			REG_GPIO_SPI_CS1_MODE,
-			GPIO_MDC_IO_MASTER_MODE_MODE,
-			GPIO_MDC_IO_MASTER_MODE_MODE
+			GPIO_MDC_IO_MASTER_MODE_MASK,
+			GPIO_MDC_IO_MASTER_MODE_MASK
 		},
 		.regmap_size = 2,
 	},
-- 
2.53.0

