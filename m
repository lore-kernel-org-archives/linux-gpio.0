Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11023138.outbound.protection.outlook.com [52.101.72.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D8DA471433;
	Wed,  5 Aug 2026 12:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785933320; cv=fail; b=b/VqNJpDvKomq7F0pKECcM61eKM4QKoV8iye58SArP4wOtDdQ/GyKF5bgdZdgkkN3YeM0UcjDnK610ry7/yTwuGKEUXfTZlJ6wcVrUeh+4fdz/+S68s7faC84I8+tquhTPl0Em4SjqC518UcpduX4FhL5hzLjdlet01K4dyaKUM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785933320; c=relaxed/simple;
	bh=w9zEPief1CiwdVO2t/wreY/WXhgqsf2+Y3ZQxsnug5o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=TWLsZlr+ezS26KU8kmXG4Y5HANWMOeVBMSuf0ODBk4dfbgZC/dCBgWi8E60zaJi5ShJQwSo6n21/rIrlPuX6wn9IuRRpP3F8jvxRxCUjD9kePg4uKqAb3t1120fEioWtUuvLPYcz1lvwNmxDBsYvwkwuuZu6dZ0DdN8eZ23XkWs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b=coZ2AyNY; arc=fail smtp.client-ip=52.101.72.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=genexis.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b="coZ2AyNY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fV5kQUNamD+Oi+SzdNk0bDnbX3wvumLe5hX5j1G2VIaD9n7mCZjb7V2uyf4cpg5r0uX3YxLE2U13omRE3F2G9Rnqz7FPhnbQk1kfbc62EaW0acnUZVbjkMuElwQpcH9sPlYOuVS6HAV72ZKegUW9We1GDEqOEE6ndDUFFsJgVJxKllUqB6UzsKna9EDoaXUMYluirDwBZxhasgzzyIOO4ysSGQCXDiwu8tnJ5uaPgblfXqQqp0evujLtEYnifUxeAq+fwF8nPEBGmnfg7IqejkEaXNp4GWFYiawsJDVFW+316rRdapc+MAci7vUNzvC5QtxI8MyLJYRMHWP2yw2BHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V6Sj7EhGfrDpeCRd5TY9CT7dEc7SRyY0bIpbiVj5VBA=;
 b=GqMSrXXj4iK0YSS/wic886gfY6SCFoBejR4a4UR/kANTrKn7L7cyJD3/7FBwMHce6LxJ9D/WGV1BM0D3Lcd6VMAqWlhWXDKhF2GUZeC7F4putB2tRsvwTlcP1R9qSAsVDzv1obSxmd79Si6DgW3NwPJQMgX0UTS95jqw7yBOWamUQV0MK0S+vF2SAsPT7xBrDefOb1DoilBHPZwFFKLOc48nzjX3DE/R4Vhoxbxm1lUl9YzDcEFGcAyoihMiz6Ie+CO94A/FPb4rVd01Vw14DP45rKU0li4LV1XxgQB9tHQFtpl6eOV1BLVI0ixmVZHOXEKhXzOpRP53qCsS7wrQDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V6Sj7EhGfrDpeCRd5TY9CT7dEc7SRyY0bIpbiVj5VBA=;
 b=coZ2AyNYLovt8BW5c8XwYks0OIufuFY9pV3wP5X+ZmSQovFc6Ld2h43crt/eeU8wZi3biX5ibfZPN7kPhPkPDZ4OIfIiqBOYlMrY7cA3OFFz5SwOSRXTLSUDat/SKXXS6nEBgKssbXHDSh3WrNr3K2dwCHndwRJ5xQLQrgf9LAIgojMc5Yyng/GePz+o6LTZn/tOdFL0uEwc9FxTmRUPI2iZVYmXAVPi15ENN814MmraS8Z9+LDssmPSj6uML5sFKgwIDIgvHg9PXiCpNGPVBJeH9/h41IAW/bWnYyJSXlgA1hKSiOoR9p5+3qUhMiMAzm4iUDColElCZ9/GUXULAw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by PAVPR08MB8918.eurprd08.prod.outlook.com (2603:10a6:102:323::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.19; Wed, 5 Aug
 2026 12:35:09 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0292.013; Wed, 5 Aug 2026
 12:35:08 +0000
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
Subject: [PATCH v10 25/36] pinctrl: airoha: an7581: remove en7581 prefix from variable names
Date: Wed,  5 Aug 2026 15:33:57 +0300
Message-ID: <20260805123408.3767648-26-mikhail.kshevetskiy@iopsys.eu>
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
X-MS-Office365-Filtering-Correlation-Id: f672515e-a4ef-44a5-fe02-08def2edfc09
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|7416014|52116014|376014|1800799024|921020|38350700014|56012099006|11063799006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	MjIqvwI4N2el2VMFQFacFHDJvPo2DVX/mr/YbYRCxR6tnUfHvjgSsL2dh1KClle/vE3mCjAoxB+ZObCOyyrL0LvZ1sxl5X1hEPPj1r+ZV3tNrX1mloLszbKsHHOoIn7YZj3kXUL9q/bm7htvuMwhIeOmupy/8dccCBnsXEXndU/AQ92jNlglN9hA0y7E77SOT7ZntP3RHEmXbI/wtuxBZkXbAjVtYTaqVAYg3l/mvtImrHzuECVwaolwVVCyF5NaOzAWYddT3hy5A0X7VNTTHswGhOpkYLhFWByEiW4flMhqaXJ4faTGksdMvr5jODyUZ4N8e3CRsC6GgMfEfbkJA0A+Nd2kSd7dE4YeJE8LEJk9az2UJQlNfdyKg/+w3qMvEQtD+5HuAyISFLcRlKwuylYVHq3DlqWefaaPKO9nu6BJuKT08Ihlzhvo0hPD2VV3H48omJh/gqvOfukaPkFkzuGjbLiC09OriDmmH4PGqrU9SNYqpnuhiXFcUN2htOpvLWst1Zz1w/Fnf836xnUZEOMfrvgH7qtP6px0d6LarbBfRdtbaMCH356jkh2qag1l9Q6nBlWH/cVfsFW2WbqfKRznh4ZnV3P9x+CFJdVpwSf8eYvoysxXWnic7RX5/bNy9bf4jFMPgPHr//0NglFEmkX7HEPszUkB/qwP0iDUYJHjDIsuCPKj/x8h1qdCtCE/t9dMe1/Vha45lZXS5oykDDEV9oPa1F0AJ90gg1UdWKs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(7416014)(52116014)(376014)(1800799024)(921020)(38350700014)(56012099006)(11063799006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Op+xsi3CNSe4GixjwvRje2WfjHgAKDSjyRPQ9OJYJRKYMJigU+VM1+IrjdR/?=
 =?us-ascii?Q?s2BukQXHlj0ZW0N4pu3CoPZOgIv+a9JES1VrnPny0yz86UeUyIeOkYvp9oo0?=
 =?us-ascii?Q?4Gm7eDY4DQwL5vCbQpBuf3nZh7dAbQSnmuNN6++Fpzr9mRWiRYNehcK7+bb0?=
 =?us-ascii?Q?ktpJsocBjm88Fii6+wOVSUw7ZV7xIN0KZP0z5Q8n3sRJ6MzScT+U0FXQU7hT?=
 =?us-ascii?Q?TuNTOcj09+WAbauDkplNsl5/3iJw5HzVNLc6ad3Nhif2sG7f89SryyBKORGm?=
 =?us-ascii?Q?oqfVumxMz2X5CP+Asmb5y1qAhUgvR7PiXazSKbnZw8oqmIQLs+IzqzIA3ceF?=
 =?us-ascii?Q?5+7qWn0we8AeitNpzzcTe5b+ijBJIVFQ/y4rOnOQqOGR36HcqR8m6qtDp53w?=
 =?us-ascii?Q?1nyBGBJFcTlRSyH1mZ8o01T++AIdYMozqPnSPEd6cuIHm3JEdGyedzhWAH0L?=
 =?us-ascii?Q?vKhwHSWlCx0Y4kQhAK1XlxzGsV/tlKlJxZxCjDQZCoLk++KDbiSYHWuwXafq?=
 =?us-ascii?Q?8IIuCC3Gya7aqG8tQ5jOQnEzNLBOYXys5i8Z9Yoo1piVdfNwd4QAJhvWayqe?=
 =?us-ascii?Q?1ldzcX+ccyTAfnPaY/Emf0uHFRh9kfmddiG/Jyfp23N7y3Afm+jeEeELvtm/?=
 =?us-ascii?Q?2RRkSpzE5Cc3+k4lbg6o4nsSd72xUIrxcmKowPxRSQwwbmB7CHkJJRhnoY/Z?=
 =?us-ascii?Q?Q59bTxL2khydRGyz/wN1M5BV7mLYTMBQu+vi+YtKd7ua1by1dpnnJ6w5W9ov?=
 =?us-ascii?Q?QW1b173q/m+62vttRTXs4dNcbZO10KuOfBbiYFzssNN1fFdo6S5Mx3mK+Csc?=
 =?us-ascii?Q?Cd9hB6D2lV99bNlPI+m3LlS5aYY35CamZkZGFRlXIk7y/6Qg11pyjb/GKBDz?=
 =?us-ascii?Q?VCgRDSFFV0/fOhYU4YRzYqnLNEOStkSA42FkY3VKHmWV2ynkkGhHyFKxVZtZ?=
 =?us-ascii?Q?FYe9+WfBBcntn79qJsgoZdmCPR/Gr4mgEEWmOvZlAuISCXlgDlHxbgKzGSZg?=
 =?us-ascii?Q?n58/yY082GzRAY+fkdDGpyjpQxCCWQrnj1QnO+cLGVB0+89QWVGE/wGcPIEH?=
 =?us-ascii?Q?RAj/GnpNwxetge0UaD/Bs3477neVXX4S5+IZEX44aN/YF+rM4+kOnAZ60CVr?=
 =?us-ascii?Q?NuttZ4pAF+75TynDojG+TGAhjQCv4lYpFsC+ZVv3+tWN1oouEqxkil8mWdk5?=
 =?us-ascii?Q?TYkF2BItucRnYLvon48wKZ5PgPAyTM62lS9uAFDSiLVaB8cfmtCzjA4uSmIf?=
 =?us-ascii?Q?PMayxht7nbuqGJDYoDeRzKnST5qMmYAJsNw9NLZQ4Gk9opUiTuvCoNhuKMkc?=
 =?us-ascii?Q?jUCLor4IwGkaH14mU7pGPiVnH7W3Q59mP2yW+0/2a7huMrDWgat3D6hDTNPP?=
 =?us-ascii?Q?cniwG9Kb2FWzZ4GuCYlmLkiM3jTTSDNvQNIIZFwSG+/ipjLK6n8sbM8Iznsu?=
 =?us-ascii?Q?/eF8llageJFRFMKX17Yf20dUcDSVUMF17phYUOwBdW2VkxHevXxdJerSFqZ1?=
 =?us-ascii?Q?9Aj6yyXeBdIC5EMQaOxbiS+PjSR0DPd1VCQiQ0uJNO4F5eLRBoBLcnPx/Tt7?=
 =?us-ascii?Q?fYQRlVE+x4pwFM4vLPUv3OrgEnNaG5Up5MIosnGfT4yHEs/7uneWuDel5m7W?=
 =?us-ascii?Q?rbaNw0hh4mrg4u1U25/fbwJDDx71TsJpidpU+BaGV6s5BRMTxiJLz+uoyBMu?=
 =?us-ascii?Q?osp9i80DuOAYqNFKw3S/azjYZX+sYlAmozthWJwGiDM2sjY/5y6L/x7m3fPQ?=
 =?us-ascii?Q?2my2lpx5BmhkDecWkIRS1qb/gn2Oz5s=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: f672515e-a4ef-44a5-fe02-08def2edfc09
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2026 12:35:08.4499
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hmqrKLDIuO7BoGy3Hy7k22VoagUekGasvILqd3fC1QMfM4gbUTke85d/gphleAANH4MYJTNRgpWyG9vw9VobThe94lVBekBV7XSGB+lCqko=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB8918

We have only an7581 specific code in the pinctrl-an7581 kernel module,
so 'en7581_' prefix is not necessary anymore. Remove it.

Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
---
 drivers/pinctrl/airoha/pinctrl-an7581.c | 398 ++++++++++++------------
 1 file changed, 199 insertions(+), 199 deletions(-)

diff --git a/drivers/pinctrl/airoha/pinctrl-an7581.c b/drivers/pinctrl/airoha/pinctrl-an7581.c
index 7bb104d805892..cd2a78382bc6a 100644
--- a/drivers/pinctrl/airoha/pinctrl-an7581.c
+++ b/drivers/pinctrl/airoha/pinctrl-an7581.c
@@ -316,7 +316,7 @@
 		.regmap_size = 2,					\
 	}
 
-static struct pinctrl_pin_desc en7581_pinctrl_pins[] = {
+static struct pinctrl_pin_desc pinctrl_pins[] = {
 	PINCTRL_PIN(0, "uart1_txd"),
 	PINCTRL_PIN(1, "uart1_rxd"),
 	PINCTRL_PIN(2, "i2c_scl"),
@@ -377,184 +377,184 @@ static struct pinctrl_pin_desc en7581_pinctrl_pins[] = {
 	PINCTRL_PIN(62, "pcie_reset2"),
 };
 
-static const int en7581_pon_pins[] = { 49, 50, 51, 52, 53, 54 };
-static const int en7581_pon_tod_1pps_pins[] = { 46 };
-static const int en7581_gsw_tod_1pps_pins[] = { 46 };
-static const int en7581_sipo_pins[] = { 16, 17 };
-static const int en7581_sipo_rclk_pins[] = { 16, 17, 43 };
-static const int en7581_mdio_pins[] = { 14, 15 };
-static const int en7581_uart2_pins[] = { 48, 55 };
-static const int en7581_uart2_cts_rts_pins[] = { 46, 47 };
-static const int en7581_hsuart_pins[] = { 28, 29 };
-static const int en7581_hsuart_cts_rts_pins[] = { 26, 27 };
-static const int en7581_uart4_pins[] = { 38, 39 };
-static const int en7581_uart5_pins[] = { 18, 19 };
-static const int en7581_i2c0_pins[] = { 2, 3 };
-static const int en7581_i2c1_pins[] = { 14, 15 };
-static const int en7581_jtag_udi_pins[] = { 16, 17, 18, 19, 20 };
-static const int en7581_jtag_dfd_pins[] = { 16, 17, 18, 19, 20 };
-static const int en7581_i2s_pins[] = { 26, 27, 28, 29 };
-static const int en7581_pcm1_pins[] = { 22, 23, 24, 25 };
-static const int en7581_pcm2_pins[] = { 18, 19, 20, 21 };
-static const int en7581_spi_quad_pins[] = { 32, 33 };
-static const int en7581_spi_pins[] = { 4, 5, 6, 7 };
-static const int en7581_spi_cs1_pins[] = { 34 };
-static const int en7581_pcm_spi_pins[] = { 18, 19, 20, 21, 22, 23, 24, 25 };
-static const int en7581_pcm_spi_int_pins[] = { 14 };
-static const int en7581_pcm_spi_rst_pins[] = { 15 };
-static const int en7581_pcm_spi_cs1_pins[] = { 43 };
-static const int en7581_pcm_spi_cs2_pins[] = { 40 };
-static const int en7581_pcm_spi_cs2_p128_pins[] = { 40 };
-static const int en7581_pcm_spi_cs2_p156_pins[] = { 40 };
-static const int en7581_pcm_spi_cs3_pins[] = { 41 };
-static const int en7581_pcm_spi_cs4_pins[] = { 42 };
-static const int en7581_emmc_pins[] = {
+static const int pon_pins[] = { 49, 50, 51, 52, 53, 54 };
+static const int pon_tod_1pps_pins[] = { 46 };
+static const int gsw_tod_1pps_pins[] = { 46 };
+static const int sipo_pins[] = { 16, 17 };
+static const int sipo_rclk_pins[] = { 16, 17, 43 };
+static const int mdio_pins[] = { 14, 15 };
+static const int uart2_pins[] = { 48, 55 };
+static const int uart2_cts_rts_pins[] = { 46, 47 };
+static const int hsuart_pins[] = { 28, 29 };
+static const int hsuart_cts_rts_pins[] = { 26, 27 };
+static const int uart4_pins[] = { 38, 39 };
+static const int uart5_pins[] = { 18, 19 };
+static const int i2c0_pins[] = { 2, 3 };
+static const int i2c1_pins[] = { 14, 15 };
+static const int jtag_udi_pins[] = { 16, 17, 18, 19, 20 };
+static const int jtag_dfd_pins[] = { 16, 17, 18, 19, 20 };
+static const int i2s_pins[] = { 26, 27, 28, 29 };
+static const int pcm1_pins[] = { 22, 23, 24, 25 };
+static const int pcm2_pins[] = { 18, 19, 20, 21 };
+static const int spi_quad_pins[] = { 32, 33 };
+static const int spi_pins[] = { 4, 5, 6, 7 };
+static const int spi_cs1_pins[] = { 34 };
+static const int pcm_spi_pins[] = { 18, 19, 20, 21, 22, 23, 24, 25 };
+static const int pcm_spi_int_pins[] = { 14 };
+static const int pcm_spi_rst_pins[] = { 15 };
+static const int pcm_spi_cs1_pins[] = { 43 };
+static const int pcm_spi_cs2_pins[] = { 40 };
+static const int pcm_spi_cs2_p128_pins[] = { 40 };
+static const int pcm_spi_cs2_p156_pins[] = { 40 };
+static const int pcm_spi_cs3_pins[] = { 41 };
+static const int pcm_spi_cs4_pins[] = { 42 };
+static const int emmc_pins[] = {
 	4, 5, 6, 30, 31, 32, 33, 34, 35, 36, 37
 };
-static const int en7581_pnand_pins[] = {
+static const int pnand_pins[] = {
 	4, 5, 6, 7, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42
 };
-static const int en7581_gpio0_pins[] = { 13 };
-static const int en7581_gpio1_pins[] = { 14 };
-static const int en7581_gpio2_pins[] = { 15 };
-static const int en7581_gpio3_pins[] = { 16 };
-static const int en7581_gpio4_pins[] = { 17 };
-static const int en7581_gpio5_pins[] = { 18 };
-static const int en7581_gpio6_pins[] = { 19 };
-static const int en7581_gpio7_pins[] = { 20 };
-static const int en7581_gpio8_pins[] = { 21 };
-static const int en7581_gpio9_pins[] = { 22 };
-static const int en7581_gpio10_pins[] = { 23 };
-static const int en7581_gpio11_pins[] = { 24 };
-static const int en7581_gpio12_pins[] = { 25 };
-static const int en7581_gpio13_pins[] = { 26 };
-static const int en7581_gpio14_pins[] = { 27 };
-static const int en7581_gpio15_pins[] = { 28 };
-static const int en7581_gpio16_pins[] = { 29 };
-static const int en7581_gpio17_pins[] = { 30 };
-static const int en7581_gpio18_pins[] = { 31 };
-static const int en7581_gpio19_pins[] = { 32 };
-static const int en7581_gpio20_pins[] = { 33 };
-static const int en7581_gpio21_pins[] = { 34 };
-static const int en7581_gpio22_pins[] = { 35 };
-static const int en7581_gpio23_pins[] = { 36 };
-static const int en7581_gpio24_pins[] = { 37 };
-static const int en7581_gpio25_pins[] = { 38 };
-static const int en7581_gpio26_pins[] = { 39 };
-static const int en7581_gpio27_pins[] = { 40 };
-static const int en7581_gpio28_pins[] = { 41 };
-static const int en7581_gpio29_pins[] = { 42 };
-static const int en7581_gpio30_pins[] = { 43 };
-static const int en7581_gpio31_pins[] = { 44 };
-static const int en7581_gpio32_pins[] = { 45 };
-static const int en7581_gpio33_pins[] = { 46 };
-static const int en7581_gpio34_pins[] = { 47 };
-static const int en7581_gpio35_pins[] = { 48 };
-static const int en7581_gpio36_pins[] = { 49 };
-static const int en7581_gpio37_pins[] = { 50 };
-static const int en7581_gpio38_pins[] = { 51 };
-static const int en7581_gpio39_pins[] = { 52 };
-static const int en7581_gpio40_pins[] = { 53 };
-static const int en7581_gpio41_pins[] = { 54 };
-static const int en7581_gpio42_pins[] = { 55 };
-static const int en7581_gpio43_pins[] = { 56 };
-static const int en7581_gpio44_pins[] = { 57 };
-static const int en7581_gpio45_pins[] = { 58 };
-static const int en7581_gpio46_pins[] = { 59 };
-static const int en7581_gpio47_pins[] = { 60 };
-static const int en7581_gpio48_pins[] = { 61 };
-static const int en7581_gpio49_pins[] = { 62 };
-static const int en7581_pcie_reset0_pins[] = { 60 };
-static const int en7581_pcie_reset1_pins[] = { 61 };
-static const int en7581_pcie_reset2_pins[] = { 62 };
-
-static const struct pingroup en7581_pinctrl_groups[] = {
-	PINCTRL_PIN_GROUP("pon", en7581_pon),
-	PINCTRL_PIN_GROUP("pon_tod_1pps", en7581_pon_tod_1pps),
-	PINCTRL_PIN_GROUP("gsw_tod_1pps", en7581_gsw_tod_1pps),
-	PINCTRL_PIN_GROUP("sipo", en7581_sipo),
-	PINCTRL_PIN_GROUP("sipo_rclk", en7581_sipo_rclk),
-	PINCTRL_PIN_GROUP("mdio", en7581_mdio),
-	PINCTRL_PIN_GROUP("uart2", en7581_uart2),
-	PINCTRL_PIN_GROUP("uart2_cts_rts", en7581_uart2_cts_rts),
-	PINCTRL_PIN_GROUP("hsuart", en7581_hsuart),
-	PINCTRL_PIN_GROUP("hsuart_cts_rts", en7581_hsuart_cts_rts),
-	PINCTRL_PIN_GROUP("uart4", en7581_uart4),
-	PINCTRL_PIN_GROUP("uart5", en7581_uart5),
-	PINCTRL_PIN_GROUP("i2c0", en7581_i2c0),
-	PINCTRL_PIN_GROUP("i2c1", en7581_i2c1),
-	PINCTRL_PIN_GROUP("jtag_udi", en7581_jtag_udi),
-	PINCTRL_PIN_GROUP("jtag_dfd", en7581_jtag_dfd),
-	PINCTRL_PIN_GROUP("i2s", en7581_i2s),
-	PINCTRL_PIN_GROUP("pcm1", en7581_pcm1),
-	PINCTRL_PIN_GROUP("pcm2", en7581_pcm2),
-	PINCTRL_PIN_GROUP("spi", en7581_spi),
-	PINCTRL_PIN_GROUP("spi_quad", en7581_spi_quad),
-	PINCTRL_PIN_GROUP("spi_cs1", en7581_spi_cs1),
-	PINCTRL_PIN_GROUP("pcm_spi", en7581_pcm_spi),
-	PINCTRL_PIN_GROUP("pcm_spi_int", en7581_pcm_spi_int),
-	PINCTRL_PIN_GROUP("pcm_spi_rst", en7581_pcm_spi_rst),
-	PINCTRL_PIN_GROUP("pcm_spi_cs1", en7581_pcm_spi_cs1),
-	PINCTRL_PIN_GROUP("pcm_spi_cs2_p128", en7581_pcm_spi_cs2_p128),
-	PINCTRL_PIN_GROUP("pcm_spi_cs2_p156", en7581_pcm_spi_cs2_p156),
-	PINCTRL_PIN_GROUP("pcm_spi_cs2", en7581_pcm_spi_cs2),
-	PINCTRL_PIN_GROUP("pcm_spi_cs3", en7581_pcm_spi_cs3),
-	PINCTRL_PIN_GROUP("pcm_spi_cs4", en7581_pcm_spi_cs4),
-	PINCTRL_PIN_GROUP("emmc", en7581_emmc),
-	PINCTRL_PIN_GROUP("pnand", en7581_pnand),
-	PINCTRL_PIN_GROUP("gpio0", en7581_gpio0),
-	PINCTRL_PIN_GROUP("gpio1", en7581_gpio1),
-	PINCTRL_PIN_GROUP("gpio2", en7581_gpio2),
-	PINCTRL_PIN_GROUP("gpio3", en7581_gpio3),
-	PINCTRL_PIN_GROUP("gpio4", en7581_gpio4),
-	PINCTRL_PIN_GROUP("gpio5", en7581_gpio5),
-	PINCTRL_PIN_GROUP("gpio6", en7581_gpio6),
-	PINCTRL_PIN_GROUP("gpio7", en7581_gpio7),
-	PINCTRL_PIN_GROUP("gpio8", en7581_gpio8),
-	PINCTRL_PIN_GROUP("gpio9", en7581_gpio9),
-	PINCTRL_PIN_GROUP("gpio10", en7581_gpio10),
-	PINCTRL_PIN_GROUP("gpio11", en7581_gpio11),
-	PINCTRL_PIN_GROUP("gpio12", en7581_gpio12),
-	PINCTRL_PIN_GROUP("gpio13", en7581_gpio13),
-	PINCTRL_PIN_GROUP("gpio14", en7581_gpio14),
-	PINCTRL_PIN_GROUP("gpio15", en7581_gpio15),
-	PINCTRL_PIN_GROUP("gpio16", en7581_gpio16),
-	PINCTRL_PIN_GROUP("gpio17", en7581_gpio17),
-	PINCTRL_PIN_GROUP("gpio18", en7581_gpio18),
-	PINCTRL_PIN_GROUP("gpio19", en7581_gpio19),
-	PINCTRL_PIN_GROUP("gpio20", en7581_gpio20),
-	PINCTRL_PIN_GROUP("gpio21", en7581_gpio21),
-	PINCTRL_PIN_GROUP("gpio22", en7581_gpio22),
-	PINCTRL_PIN_GROUP("gpio23", en7581_gpio23),
-	PINCTRL_PIN_GROUP("gpio24", en7581_gpio24),
-	PINCTRL_PIN_GROUP("gpio25", en7581_gpio25),
-	PINCTRL_PIN_GROUP("gpio26", en7581_gpio26),
-	PINCTRL_PIN_GROUP("gpio27", en7581_gpio27),
-	PINCTRL_PIN_GROUP("gpio28", en7581_gpio28),
-	PINCTRL_PIN_GROUP("gpio29", en7581_gpio29),
-	PINCTRL_PIN_GROUP("gpio30", en7581_gpio30),
-	PINCTRL_PIN_GROUP("gpio31", en7581_gpio31),
-	PINCTRL_PIN_GROUP("gpio32", en7581_gpio32),
-	PINCTRL_PIN_GROUP("gpio33", en7581_gpio33),
-	PINCTRL_PIN_GROUP("gpio34", en7581_gpio34),
-	PINCTRL_PIN_GROUP("gpio35", en7581_gpio35),
-	PINCTRL_PIN_GROUP("gpio36", en7581_gpio36),
-	PINCTRL_PIN_GROUP("gpio37", en7581_gpio37),
-	PINCTRL_PIN_GROUP("gpio38", en7581_gpio38),
-	PINCTRL_PIN_GROUP("gpio39", en7581_gpio39),
-	PINCTRL_PIN_GROUP("gpio40", en7581_gpio40),
-	PINCTRL_PIN_GROUP("gpio41", en7581_gpio41),
-	PINCTRL_PIN_GROUP("gpio42", en7581_gpio42),
-	PINCTRL_PIN_GROUP("gpio43", en7581_gpio43),
-	PINCTRL_PIN_GROUP("gpio44", en7581_gpio44),
-	PINCTRL_PIN_GROUP("gpio45", en7581_gpio45),
-	PINCTRL_PIN_GROUP("gpio46", en7581_gpio46),
-	PINCTRL_PIN_GROUP("gpio47", en7581_gpio47),
-	PINCTRL_PIN_GROUP("gpio48", en7581_gpio48),
-	PINCTRL_PIN_GROUP("gpio49", en7581_gpio49),
-	PINCTRL_PIN_GROUP("pcie_reset0", en7581_pcie_reset0),
-	PINCTRL_PIN_GROUP("pcie_reset1", en7581_pcie_reset1),
-	PINCTRL_PIN_GROUP("pcie_reset2", en7581_pcie_reset2),
+static const int gpio0_pins[] = { 13 };
+static const int gpio1_pins[] = { 14 };
+static const int gpio2_pins[] = { 15 };
+static const int gpio3_pins[] = { 16 };
+static const int gpio4_pins[] = { 17 };
+static const int gpio5_pins[] = { 18 };
+static const int gpio6_pins[] = { 19 };
+static const int gpio7_pins[] = { 20 };
+static const int gpio8_pins[] = { 21 };
+static const int gpio9_pins[] = { 22 };
+static const int gpio10_pins[] = { 23 };
+static const int gpio11_pins[] = { 24 };
+static const int gpio12_pins[] = { 25 };
+static const int gpio13_pins[] = { 26 };
+static const int gpio14_pins[] = { 27 };
+static const int gpio15_pins[] = { 28 };
+static const int gpio16_pins[] = { 29 };
+static const int gpio17_pins[] = { 30 };
+static const int gpio18_pins[] = { 31 };
+static const int gpio19_pins[] = { 32 };
+static const int gpio20_pins[] = { 33 };
+static const int gpio21_pins[] = { 34 };
+static const int gpio22_pins[] = { 35 };
+static const int gpio23_pins[] = { 36 };
+static const int gpio24_pins[] = { 37 };
+static const int gpio25_pins[] = { 38 };
+static const int gpio26_pins[] = { 39 };
+static const int gpio27_pins[] = { 40 };
+static const int gpio28_pins[] = { 41 };
+static const int gpio29_pins[] = { 42 };
+static const int gpio30_pins[] = { 43 };
+static const int gpio31_pins[] = { 44 };
+static const int gpio32_pins[] = { 45 };
+static const int gpio33_pins[] = { 46 };
+static const int gpio34_pins[] = { 47 };
+static const int gpio35_pins[] = { 48 };
+static const int gpio36_pins[] = { 49 };
+static const int gpio37_pins[] = { 50 };
+static const int gpio38_pins[] = { 51 };
+static const int gpio39_pins[] = { 52 };
+static const int gpio40_pins[] = { 53 };
+static const int gpio41_pins[] = { 54 };
+static const int gpio42_pins[] = { 55 };
+static const int gpio43_pins[] = { 56 };
+static const int gpio44_pins[] = { 57 };
+static const int gpio45_pins[] = { 58 };
+static const int gpio46_pins[] = { 59 };
+static const int gpio47_pins[] = { 60 };
+static const int gpio48_pins[] = { 61 };
+static const int gpio49_pins[] = { 62 };
+static const int pcie_reset0_pins[] = { 60 };
+static const int pcie_reset1_pins[] = { 61 };
+static const int pcie_reset2_pins[] = { 62 };
+
+static const struct pingroup pinctrl_groups[] = {
+	PINCTRL_PIN_GROUP("pon", pon),
+	PINCTRL_PIN_GROUP("pon_tod_1pps", pon_tod_1pps),
+	PINCTRL_PIN_GROUP("gsw_tod_1pps", gsw_tod_1pps),
+	PINCTRL_PIN_GROUP("sipo", sipo),
+	PINCTRL_PIN_GROUP("sipo_rclk", sipo_rclk),
+	PINCTRL_PIN_GROUP("mdio", mdio),
+	PINCTRL_PIN_GROUP("uart2", uart2),
+	PINCTRL_PIN_GROUP("uart2_cts_rts", uart2_cts_rts),
+	PINCTRL_PIN_GROUP("hsuart", hsuart),
+	PINCTRL_PIN_GROUP("hsuart_cts_rts", hsuart_cts_rts),
+	PINCTRL_PIN_GROUP("uart4", uart4),
+	PINCTRL_PIN_GROUP("uart5", uart5),
+	PINCTRL_PIN_GROUP("i2c0", i2c0),
+	PINCTRL_PIN_GROUP("i2c1", i2c1),
+	PINCTRL_PIN_GROUP("jtag_udi", jtag_udi),
+	PINCTRL_PIN_GROUP("jtag_dfd", jtag_dfd),
+	PINCTRL_PIN_GROUP("i2s", i2s),
+	PINCTRL_PIN_GROUP("pcm1", pcm1),
+	PINCTRL_PIN_GROUP("pcm2", pcm2),
+	PINCTRL_PIN_GROUP("spi", spi),
+	PINCTRL_PIN_GROUP("spi_quad", spi_quad),
+	PINCTRL_PIN_GROUP("spi_cs1", spi_cs1),
+	PINCTRL_PIN_GROUP("pcm_spi", pcm_spi),
+	PINCTRL_PIN_GROUP("pcm_spi_int", pcm_spi_int),
+	PINCTRL_PIN_GROUP("pcm_spi_rst", pcm_spi_rst),
+	PINCTRL_PIN_GROUP("pcm_spi_cs1", pcm_spi_cs1),
+	PINCTRL_PIN_GROUP("pcm_spi_cs2_p128", pcm_spi_cs2_p128),
+	PINCTRL_PIN_GROUP("pcm_spi_cs2_p156", pcm_spi_cs2_p156),
+	PINCTRL_PIN_GROUP("pcm_spi_cs2", pcm_spi_cs2),
+	PINCTRL_PIN_GROUP("pcm_spi_cs3", pcm_spi_cs3),
+	PINCTRL_PIN_GROUP("pcm_spi_cs4", pcm_spi_cs4),
+	PINCTRL_PIN_GROUP("emmc", emmc),
+	PINCTRL_PIN_GROUP("pnand", pnand),
+	PINCTRL_PIN_GROUP("gpio0", gpio0),
+	PINCTRL_PIN_GROUP("gpio1", gpio1),
+	PINCTRL_PIN_GROUP("gpio2", gpio2),
+	PINCTRL_PIN_GROUP("gpio3", gpio3),
+	PINCTRL_PIN_GROUP("gpio4", gpio4),
+	PINCTRL_PIN_GROUP("gpio5", gpio5),
+	PINCTRL_PIN_GROUP("gpio6", gpio6),
+	PINCTRL_PIN_GROUP("gpio7", gpio7),
+	PINCTRL_PIN_GROUP("gpio8", gpio8),
+	PINCTRL_PIN_GROUP("gpio9", gpio9),
+	PINCTRL_PIN_GROUP("gpio10", gpio10),
+	PINCTRL_PIN_GROUP("gpio11", gpio11),
+	PINCTRL_PIN_GROUP("gpio12", gpio12),
+	PINCTRL_PIN_GROUP("gpio13", gpio13),
+	PINCTRL_PIN_GROUP("gpio14", gpio14),
+	PINCTRL_PIN_GROUP("gpio15", gpio15),
+	PINCTRL_PIN_GROUP("gpio16", gpio16),
+	PINCTRL_PIN_GROUP("gpio17", gpio17),
+	PINCTRL_PIN_GROUP("gpio18", gpio18),
+	PINCTRL_PIN_GROUP("gpio19", gpio19),
+	PINCTRL_PIN_GROUP("gpio20", gpio20),
+	PINCTRL_PIN_GROUP("gpio21", gpio21),
+	PINCTRL_PIN_GROUP("gpio22", gpio22),
+	PINCTRL_PIN_GROUP("gpio23", gpio23),
+	PINCTRL_PIN_GROUP("gpio24", gpio24),
+	PINCTRL_PIN_GROUP("gpio25", gpio25),
+	PINCTRL_PIN_GROUP("gpio26", gpio26),
+	PINCTRL_PIN_GROUP("gpio27", gpio27),
+	PINCTRL_PIN_GROUP("gpio28", gpio28),
+	PINCTRL_PIN_GROUP("gpio29", gpio29),
+	PINCTRL_PIN_GROUP("gpio30", gpio30),
+	PINCTRL_PIN_GROUP("gpio31", gpio31),
+	PINCTRL_PIN_GROUP("gpio32", gpio32),
+	PINCTRL_PIN_GROUP("gpio33", gpio33),
+	PINCTRL_PIN_GROUP("gpio34", gpio34),
+	PINCTRL_PIN_GROUP("gpio35", gpio35),
+	PINCTRL_PIN_GROUP("gpio36", gpio36),
+	PINCTRL_PIN_GROUP("gpio37", gpio37),
+	PINCTRL_PIN_GROUP("gpio38", gpio38),
+	PINCTRL_PIN_GROUP("gpio39", gpio39),
+	PINCTRL_PIN_GROUP("gpio40", gpio40),
+	PINCTRL_PIN_GROUP("gpio41", gpio41),
+	PINCTRL_PIN_GROUP("gpio42", gpio42),
+	PINCTRL_PIN_GROUP("gpio43", gpio43),
+	PINCTRL_PIN_GROUP("gpio44", gpio44),
+	PINCTRL_PIN_GROUP("gpio45", gpio45),
+	PINCTRL_PIN_GROUP("gpio46", gpio46),
+	PINCTRL_PIN_GROUP("gpio47", gpio47),
+	PINCTRL_PIN_GROUP("gpio48", gpio48),
+	PINCTRL_PIN_GROUP("gpio49", gpio49),
+	PINCTRL_PIN_GROUP("pcie_reset0", pcie_reset0),
+	PINCTRL_PIN_GROUP("pcie_reset1", pcie_reset1),
+	PINCTRL_PIN_GROUP("pcie_reset2", pcie_reset2),
 };
 
 static const char *const pon_groups[] = { "pon" };
@@ -1154,7 +1154,7 @@ static const struct airoha_pinctrl_func_group phy4_led1_func_group[] = {
 				LAN3_LED_MAPPING_MASK, LAN3_PHY_LED_MAP(3)),
 };
 
-static const struct airoha_pinctrl_func en7581_pinctrl_funcs[] = {
+static const struct airoha_pinctrl_func pinctrl_funcs[] = {
 	PINCTRL_FUNC_DESC("pon", pon),
 	PINCTRL_FUNC_DESC("tod_1pps", tod_1pps),
 	PINCTRL_FUNC_DESC("sipo", sipo),
@@ -1181,7 +1181,7 @@ static const struct airoha_pinctrl_func en7581_pinctrl_funcs[] = {
 	PINCTRL_FUNC_DESC("phy4_led1", phy4_led1),
 };
 
-static const struct airoha_pinctrl_conf en7581_pinctrl_pullup_conf[] = {
+static const struct airoha_pinctrl_conf pinctrl_pullup_conf[] = {
 	PINCTRL_CONF_DESC(0, REG_I2C_SDA_PU, UART1_TXD_PU_MASK),
 	PINCTRL_CONF_DESC(1, REG_I2C_SDA_PU, UART1_RXD_PU_MASK),
 	PINCTRL_CONF_DESC(2, REG_I2C_SDA_PU, I2C_SCL_PU_MASK),
@@ -1242,7 +1242,7 @@ static const struct airoha_pinctrl_conf en7581_pinctrl_pullup_conf[] = {
 	PINCTRL_CONF_DESC(62, REG_I2C_SDA_PU, PCIE2_RESET_PU_MASK),
 };
 
-static const struct airoha_pinctrl_conf en7581_pinctrl_pulldown_conf[] = {
+static const struct airoha_pinctrl_conf pinctrl_pulldown_conf[] = {
 	PINCTRL_CONF_DESC(0, REG_I2C_SDA_PD, UART1_TXD_PD_MASK),
 	PINCTRL_CONF_DESC(1, REG_I2C_SDA_PD, UART1_RXD_PD_MASK),
 	PINCTRL_CONF_DESC(2, REG_I2C_SDA_PD, I2C_SCL_PD_MASK),
@@ -1303,7 +1303,7 @@ static const struct airoha_pinctrl_conf en7581_pinctrl_pulldown_conf[] = {
 	PINCTRL_CONF_DESC(62, REG_I2C_SDA_PD, PCIE2_RESET_PD_MASK),
 };
 
-static const struct airoha_pinctrl_conf en7581_pinctrl_drive_e2_conf[] = {
+static const struct airoha_pinctrl_conf pinctrl_drive_e2_conf[] = {
 	PINCTRL_CONF_DESC(0, REG_I2C_SDA_E2, UART1_TXD_E2_MASK),
 	PINCTRL_CONF_DESC(1, REG_I2C_SDA_E2, UART1_RXD_E2_MASK),
 	PINCTRL_CONF_DESC(2, REG_I2C_SDA_E2, I2C_SCL_E2_MASK),
@@ -1364,7 +1364,7 @@ static const struct airoha_pinctrl_conf en7581_pinctrl_drive_e2_conf[] = {
 	PINCTRL_CONF_DESC(62, REG_I2C_SDA_E2, PCIE2_RESET_E2_MASK),
 };
 
-static const struct airoha_pinctrl_conf en7581_pinctrl_drive_e4_conf[] = {
+static const struct airoha_pinctrl_conf pinctrl_drive_e4_conf[] = {
 	PINCTRL_CONF_DESC(0, REG_I2C_SDA_E4, UART1_TXD_E4_MASK),
 	PINCTRL_CONF_DESC(1, REG_I2C_SDA_E4, UART1_RXD_E4_MASK),
 	PINCTRL_CONF_DESC(2, REG_I2C_SDA_E4, I2C_SCL_E4_MASK),
@@ -1425,47 +1425,47 @@ static const struct airoha_pinctrl_conf en7581_pinctrl_drive_e4_conf[] = {
 	PINCTRL_CONF_DESC(62, REG_I2C_SDA_E4, PCIE2_RESET_E4_MASK),
 };
 
-static const struct airoha_pinctrl_conf en7581_pinctrl_pcie_rst_od_conf[] = {
+static const struct airoha_pinctrl_conf pinctrl_pcie_rst_od_conf[] = {
 	PINCTRL_CONF_DESC(60, REG_PCIE_RESET_OD, PCIE0_RESET_OD_MASK),
 	PINCTRL_CONF_DESC(61, REG_PCIE_RESET_OD, PCIE1_RESET_OD_MASK),
 	PINCTRL_CONF_DESC(62, REG_PCIE_RESET_OD, PCIE2_RESET_OD_MASK),
 };
 
-static const struct airoha_pinctrl_match_data en7581_pinctrl_match_data = {
+static const struct airoha_pinctrl_match_data pinctrl_match_data = {
 	.pinctrl_name = KBUILD_MODNAME,
 	.pinctrl_owner = THIS_MODULE,
-	.pins = en7581_pinctrl_pins,
-	.num_pins = ARRAY_SIZE(en7581_pinctrl_pins),
-	.grps = en7581_pinctrl_groups,
-	.num_grps = ARRAY_SIZE(en7581_pinctrl_groups),
-	.funcs = en7581_pinctrl_funcs,
-	.num_funcs = ARRAY_SIZE(en7581_pinctrl_funcs),
+	.pins = pinctrl_pins,
+	.num_pins = ARRAY_SIZE(pinctrl_pins),
+	.grps = pinctrl_groups,
+	.num_grps = ARRAY_SIZE(pinctrl_groups),
+	.funcs = pinctrl_funcs,
+	.num_funcs = ARRAY_SIZE(pinctrl_funcs),
 	.confs_info = {
 		[AIROHA_PINCTRL_CONFS_PULLUP] = {
-			.confs = en7581_pinctrl_pullup_conf,
-			.num_confs = ARRAY_SIZE(en7581_pinctrl_pullup_conf),
+			.confs = pinctrl_pullup_conf,
+			.num_confs = ARRAY_SIZE(pinctrl_pullup_conf),
 		},
 		[AIROHA_PINCTRL_CONFS_PULLDOWN] = {
-			.confs = en7581_pinctrl_pulldown_conf,
-			.num_confs = ARRAY_SIZE(en7581_pinctrl_pulldown_conf),
+			.confs = pinctrl_pulldown_conf,
+			.num_confs = ARRAY_SIZE(pinctrl_pulldown_conf),
 		},
 		[AIROHA_PINCTRL_CONFS_DRIVE_E2] = {
-			.confs = en7581_pinctrl_drive_e2_conf,
-			.num_confs = ARRAY_SIZE(en7581_pinctrl_drive_e2_conf),
+			.confs = pinctrl_drive_e2_conf,
+			.num_confs = ARRAY_SIZE(pinctrl_drive_e2_conf),
 		},
 		[AIROHA_PINCTRL_CONFS_DRIVE_E4] = {
-			.confs = en7581_pinctrl_drive_e4_conf,
-			.num_confs = ARRAY_SIZE(en7581_pinctrl_drive_e4_conf),
+			.confs = pinctrl_drive_e4_conf,
+			.num_confs = ARRAY_SIZE(pinctrl_drive_e4_conf),
 		},
 		[AIROHA_PINCTRL_CONFS_PCIE_RST_OD] = {
-			.confs = en7581_pinctrl_pcie_rst_od_conf,
-			.num_confs = ARRAY_SIZE(en7581_pinctrl_pcie_rst_od_conf),
+			.confs = pinctrl_pcie_rst_od_conf,
+			.num_confs = ARRAY_SIZE(pinctrl_pcie_rst_od_conf),
 		},
 	},
 };
 
 static const struct of_device_id airoha_pinctrl_of_match[] = {
-	{ .compatible = "airoha,en7581-pinctrl", .data = &en7581_pinctrl_match_data },
+	{ .compatible = "airoha,en7581-pinctrl", .data = &pinctrl_match_data },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, airoha_pinctrl_of_match);
-- 
2.53.0

