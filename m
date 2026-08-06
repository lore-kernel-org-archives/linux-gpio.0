Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11021080.outbound.protection.outlook.com [40.107.130.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8653C4334B6;
	Thu,  6 Aug 2026 22:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.80
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786054041; cv=fail; b=brVrdaPeU5mnDK6qBoDGROdGIsZyV7InEjf+qtGA0088JgBRBBZJXe8My5DgGEyMTI2TxiZqerPjJ/u5b4+rMkXufAE57xpJ6V2wOgKqagsYfocuyFXSyuCSrn1C2qkUwl9F6+jWpYDuWWYq8Fu1Yg2c7b8dUCjBS2gfBlWTqVs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786054041; c=relaxed/simple;
	bh=w9zEPief1CiwdVO2t/wreY/WXhgqsf2+Y3ZQxsnug5o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=uAaeo1OjpdLQs9iyvcbPQ9o55cLDBN6Vk2YFO+JO2+xEYpsX5FYjJHxxLJcRKKHNcrKOo1v4CDafV4czDJtRqzB83BWgkMENPjCF8i42MqhQevdiVqFb7mY25ZGge+mV3Syrr50v22csNeSxH6i3oALdFiNhFmIZvywPpA6tGdw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b=uoKOeOJ4; arc=fail smtp.client-ip=40.107.130.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=genexis.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b="uoKOeOJ4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aQJA/qFfAb28nPYPEPswBeQ0+05C4pA+Y/pgVCKk7k9py6aSwiHxC3Xo/jZcfjS+BKkhkW7sLenqWoYj2Hg9yp39IvQQlzk9buWd8p8ijZjvULCsJjurAAxajNa4667Lda6CxyXObJ52izPIGAv47k7ihz72Vr2207+1zbtT+z5wtLQYsMc8/yR8QfrNqrQsLd3r41wrdPmMA2tv32Efpa4pJ4plCLLTPUCGLkgx7tGJR3eUWXlJ3HqyJYHR6k4hvAtoNJxkrm865YQuQsEF+nxsV9x8HyAzEKcZRET6Fu9MQ5fPPpXkKfPsNumcHvTnDlapMgGxYP/tyoK4j6uwZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V6Sj7EhGfrDpeCRd5TY9CT7dEc7SRyY0bIpbiVj5VBA=;
 b=f5JW7O9YyqatoijrZbYNzyrLp1IdXwWG+D70g4uagCQvV+Evd4OsbXpZROeTYcdKJ6vGvJhRu5ts6XrrQgx3NhzGmATZkV4/OTsAmvz181vpMoix0F8X2yNFhkYKCSt23rtRRqOYnVhieVpmwgmjn+7ae2qDd/m5RtNAi77VCdlVQBBuQYLFRoMdRrvcMSxl4L8pOJhdspcuDET/UZGZy+pgDFGBJWmDnA+iMzbCTjS1dag383UHMdavaH9WLshnmYiO+jFMuPDGkepHX2uebGz4MnlSioHS6YOxWOao9Y2Bj6Qy2rP1uE+BGcLUlugrH24w7bIqRjXMaLGnhMTR5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V6Sj7EhGfrDpeCRd5TY9CT7dEc7SRyY0bIpbiVj5VBA=;
 b=uoKOeOJ4p9G9byXpDgsrr3fMLhgX/cBoIhkWLF2qiadDOXxxAbzsDct8QMQgnXYvVJ6wZbZ9yjtzTJstIxmfs1n8qGLkGyfXiK7wGnqh2n+egymulFEmeVDBpdhRIeb+q258APHlq2XwqkP6PyIJFXwB02IWd4YVCMuhPfWBOu+qEbJkhLvvbM5373PYRHHa2cZVWqHGZcS7hYh/SeZ9xm/IvYa5FayzMFDpk95VAe/IqHCUHFAAF3cpgRonCcNkb2mwBvppVcm/811hS/H02AKQ2AeRrLFRofS2gk/Vfrj8Ythff8eVt8hetO+NGQx7T+QQB/SCbyHX1Iw65xFIEw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by VE1PR08MB5823.eurprd08.prod.outlook.com (2603:10a6:800:1a5::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.23; Thu, 6 Aug
 2026 22:07:12 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0292.013; Thu, 6 Aug 2026
 22:07:12 +0000
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
Subject: [PATCH v11 26/37] pinctrl: airoha: an7581: remove en7581 prefix from variable names
Date: Fri,  7 Aug 2026 01:06:04 +0300
Message-ID: <20260806220615.4078303-27-mikhail.kshevetskiy@iopsys.eu>
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
X-MS-Office365-Filtering-Correlation-Id: a980a674-d7fa-4c0b-4cc0-08def4071147
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|23010399003|366016|1800799024|921020|38350700014|10067099003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	1g1xruTMeH6VuAdPRVuXzgRE31riSUq3+DC271t1hZaE2yiewQ62d13JbB3dCc8FfaQVFfsdfEVSBvfpnlgieRzUx6x2P8YdqeXaBDPYBEXwgytxWMl3eWL6Oc73Q11x1hH2sd3f80g2yP8Oc636MP0eCgfCylyjQfxrHCwIej9UmsnV8DNl3hc26QkK31xCobcYgMgxdC6WvdZgxY57Y7ukoNKTWJYONMeiganPqAmUO2sivkw2q4Pa9OKefbUGQesYxA8jmjt80LTLv/+fjn/DumUUopOkixnsC0odZT9gMwDxV0VTHVIELDCd3temqlVtJnmRMaS0N1gnkwUlrJttHax2QyaswMmDkqSGh7+PVPmj6UNc+oDjIZFHmd0Na4RQ8bdCqVs0jLyuVw0/t6qjdLOOBFSKp8o2FXvfRa6jfaX24K/C1dxRfqrW3CYvq+3a0eJUZtVXFkJLVu9eogXTvyeOnCMo9zQLwfbQSAopSNTr28qnMAgVsxdXlhCp6ItYJKatCQtLyvsktGnJEngD3ltAYlUJQXOEXCagU4AfRMEOr9IPrLeRwiy4QCaCoqYqIDBjgVUmy5sezg/UpR3Ky5Tp5DNUFmPpwUiqa2dEe2cBn7Yl/3c3KRl6g2EYBl85iu8hNpcSikezWRrZ78LYpKN6yCNCfbiiCb8iW3D/qGmHz8pbJYRM2bdO46T75QsYgg0aGaeX5s+FcxiNDCdl7rwxcXqjizAe4pYN0BM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(23010399003)(366016)(1800799024)(921020)(38350700014)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?u/N1W5mbzLv8V7v0Be0lZsTcq5s4pbX9PPP8r3LiOuhQKTyX/A6JWoaX/B0F?=
 =?us-ascii?Q?/xIjxRsgypV59XkzXoE2N1h9TtPIHZVGiCdCrpgfvT4vdC+xFc9ZExe70arm?=
 =?us-ascii?Q?HApQqBSuVeKDkhxrqjDIlS5qpA3DAIvrWdbjVHHQcYMH93JwAlUWqPlfHKQj?=
 =?us-ascii?Q?7e6gcD/iDrfEzS+HWHyaZfKuUOwxPjgtdYbEzJtXJK9x3D63068uciww2IHh?=
 =?us-ascii?Q?FABbaXudqtdenU8ex4Tg5bPHYbGWCHJBDtNPsNAIXQx6zCKsydK3G2WE5gJo?=
 =?us-ascii?Q?71TyenDX/cb1vBeWd43US+E1ucw1837rIun+eSKl8d24EE6k1u7RkfDhZ+Pv?=
 =?us-ascii?Q?94DiHoMkMP5NyLOdzCKCNEt8Xiomevmk/zxL9UxR3PdlL/f/h5fbzaSHEtYw?=
 =?us-ascii?Q?kkv8a0/7fFavVl+gWCOxU5sK9fl7CUBQePSLe6rctQNAqz/Pv4Bee/vYNouk?=
 =?us-ascii?Q?BiI4ZP462ZonHFKbv8Hoe0EINs4nIkZKpDSeEAHZ51qIsk3/PCRzSrhhb/1/?=
 =?us-ascii?Q?kUlJj0bELfEILe9BTYfqXidH/sCzFe1Mqvt6efKc0px0Yi8mj8IUC2mPlfwr?=
 =?us-ascii?Q?u6mQX3aWoNB+DiFnRuTlfiCJiXKZeICx8mguPgS5D1WkwUOsh2ExX2/RvStZ?=
 =?us-ascii?Q?IcNM4wr0zElWhhUwBboRq91Zne/2x5ULWPMGW/1fQ29dsDZTvOR6QOky9b2K?=
 =?us-ascii?Q?p+Ixu9f6ky+bHFdDLTb01w8JHbHJ6HmoSJOof0ZffSyfzvwHozzj3HNg67b+?=
 =?us-ascii?Q?JdWjZzFQWGihyIlg2JQmPEfHMpt6P5doO6gg5Ar4ppYbuIKnliGs9to5Gv/D?=
 =?us-ascii?Q?DpDydlByrvMl3v/Y1p2kgBV+whE5lJqqgK/Zf180NCx1LWn558Ys5ZbwLg0f?=
 =?us-ascii?Q?Pdnv7Jxcx2BU4gh0PId5AuzLmRxci8R9EZ0uqEzdiiD/KuAvAy4JDyss45WG?=
 =?us-ascii?Q?spkZ1mDdGU1V6WspUL+VW32o6zY/Ggd4LisN8XTxgl9AO0QwTwyiY9B4a6/S?=
 =?us-ascii?Q?JpwFr0Spi6UAvCqlyqjG3VG937wxaJze4aZVjZHmOeJDuWA6dpWAy1vxk1aO?=
 =?us-ascii?Q?RVt8j/u5CX9JYM/ixs6K87Pbi+qaGYffqeIuQ6kqIgE4Q/Lfsz5ckKlQIHOE?=
 =?us-ascii?Q?EW1ai9z8RUfMzXqMvBgYZ1iEisVAeM3RXhXBuVC0VsNQ78w8EFOyHHXE4p5u?=
 =?us-ascii?Q?vs3es71xvad98Wyoak8N11iKhCHGqWNalWjFUqk7RufnRzHKukYrADQza+ub?=
 =?us-ascii?Q?VcL92AB8tBtUh8ISmlBxmcDQfBPMiTGX1G/GcnRG9Vj4y1JbTjjqZgToI/qP?=
 =?us-ascii?Q?/e/b3J9tdCz81GicXgg7Tol7UcVJP7MtPTXiStdhIEJ+5q2BkhIP6Ofl6xxv?=
 =?us-ascii?Q?ce+FJksUbI9kKw/BFHyK+rnq4lKSwCQmnGWDu+5qYMwuPiy5LHbeDEBCRVt/?=
 =?us-ascii?Q?o17FkrvmlEV1u/8S+Bski4NO+AGsBucKSPijwpwfm7VOUV+A9TyQMM8PPwH8?=
 =?us-ascii?Q?EvZfD5xJsw6w0e7EVK/kgPislwDqr4CiLbQEwDhoJVEWVQynoT7tnpdm4846?=
 =?us-ascii?Q?rtW5ruQo+MpsA6PGbcY8r/yUSDj+cTc83vYY3hvaFaVaGJn1CIN4VXM+9eoT?=
 =?us-ascii?Q?IJPXAD/ZFmAfPsbFOQdY9RfLMH8PfQkyoPp2bddaz9t1aJaz/G/AyuF3i9/6?=
 =?us-ascii?Q?5dXKt6Sx1isxzepueiKaFlci/Bmm9yztLMsZ51DInWwwFX6oqp5cSapVkFQP?=
 =?us-ascii?Q?s9cZK6GreZxcuZFZIFXhPm+8drmkzpU=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: a980a674-d7fa-4c0b-4cc0-08def4071147
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2026 22:07:12.6356
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3E9mHJfmk+DALOUpHnz2B7lTw22Pmmvn3p1gwVPKKZVOJiMx4kfrnCAR4U46b2tzvV54dTJwzfpj1QDA7wY3dMkg/jyz1T9JnqmMWEUtlhc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5823

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

