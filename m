Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11023095.outbound.protection.outlook.com [40.107.159.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F9C443E09A;
	Mon, 27 Jul 2026 17:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.95
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785174161; cv=fail; b=bMz3R7sjvPWRv0TGN7wP9iMrOE4SrGiSXjT2j2a19RfmzM0Ev/0OkB4+T+wAWMsWz+6LN7XUh6uuXhKRE/ZX/zZKJxtr1nr5pJJJ9GR8YnDKbv/HACBK34wRL5uCLBdX/zaK+AMGLHkJ39VKAajkDT0+sSvB2qeB5fZl3SpM7Og=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785174161; c=relaxed/simple;
	bh=34rvXX1c1PNQqxFFfwDUCf5spuUeEWpaXj1A5rK+45s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=B9pGO/oAeEerXJj8EDK3rrPiKsVRivgGv2vEqsDVcOSJrKs30ERxOnzZ5SOiRGfhIkwMF0oOiGpPbFtDP3iYIVXzK51+BjOKm+bG9bcpcVCc7S4t8r0kau+FuqXv8vpyPtgp+cAUQ+qh/pJutp5kIh2IQR2hRxdgTwhVnWvSMs4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b=WKPL9vU6; arc=fail smtp.client-ip=40.107.159.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=genexis.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b="WKPL9vU6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GziMQtH2NsgDuq0Z03HgbYs4NJVGSwfjlPbX94ioie7VqCNTQNvFa9Fnz/vvZ5kqKGFJ0PxvMc1p+qN759DsXTeiHNg/3Yqi3nRwi1uTXiIkSjsbZc9GdokHRPiUurhW6I+n1M/SbIyOPdq74g7geZNQMcQjYRaGscd5PDUUzakZxI7cq4ztzOC2pA/k+hFSv6+E5nrRfIROK9kHajMtUhKyqsxXfPfRDxu/brydAp5AUf/QJPyteRBFFBHT4nzZ21h43Fr9zCA/5VAxRulFrJ1wof983WZWhRgAGXfH0HUzPpkrPr272ZC9xW4H1AwrQG7/UFmFE5/z92Bi7GV9QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cvR7XanS+U9OrUvWqeitYVFfDCg6bJCIJWXyDZmm51c=;
 b=MiNOXNh/kdU/FtndYTocn6+htgGGvUjwO9dqc3CjSFGFUSiMaa4da5cZn/PbAYjBS7Drzj81/Jvi2CbPAtQH/ZKZgQ1xHjmsrWXs88E391L4d/q7eCAcKIuM0PeRoXOxwR27Fc6rhRTI7mQS5dcT3+izVc2XSGvb3uXqc9fCS4vFKXRthn2lDmuZvk23sHsak5xPa/6X110evNAcjpZQB/TpHlDahESGvjhx/UcTkWUsJKQSvF4L2n+dSWbMNI+PWqsXjlbGeiuV7MX7Q6RiO4/3i7+5SYt2cfr7LLqxs8l2iQOl2eP7gLhhiP//wv6EW+Ap5XAAant1kfXTRXxFVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cvR7XanS+U9OrUvWqeitYVFfDCg6bJCIJWXyDZmm51c=;
 b=WKPL9vU6ITKM58rFUIr5rll2L7nQITCndd9mCiwBmtAiBVD6a7Z12jolhHEw6PSZYGn6ORkpZKQqJcQngrNcfIX/diuu1Km8Hm5vj8Gm5MnBKi4vUpbgTRd3OEjrSYIABL/O2LCFNzxITHAXkriNs9r0PmNN2XPgPN9EdN9OmjvSPbftxFQEsewVkK6W8O9wj3vOTuCMcXv6KIcYXxDlbR3zy6koIH2+h94i4k58D+AZmoaGqxpWiNqsdZHofCX8Z31cENN8pURzlb940WRKT8OB8lt+5BshB9isrwP+5d5eXPS/ZlRFyr7wvt15kAYNPRh7McXFPzPvyFqIlP9SwA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by PA4PR08MB5888.eurprd08.prod.outlook.com (2603:10a6:102:e8::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Mon, 27 Jul
 2026 17:42:30 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0245.012; Mon, 27 Jul 2026
 17:42:30 +0000
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
Subject: [PATCH v8 22/35] pinctrl: airoha: an7581: remove en7581 prefix from variable names
Date: Mon, 27 Jul 2026 20:41:28 +0300
Message-ID: <20260727174141.664933-23-mikhail.kshevetskiy@iopsys.eu>
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
X-MS-TrafficTypeDiagnostic: DU2PR08MB10037:EE_|PA4PR08MB5888:EE_
X-MS-Office365-Filtering-Correlation-Id: a61dc2d1-9f9c-40ea-0ec3-08deec066e4d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|7416014|366016|23010399003|1800799024|921020|38350700014|18002099003|22082099003|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	C6+2XbOOZwFWpSE7kyaY680TFlr6+SKoKSXCaPHgukXSd8ALkncY1/1tIEa5kfydjS97u1Mv3zCuMohtl4m/O/D1OvMhMmfyGbDrF67oXgKhF6LeVj83J/QB8LSYykAN6LXAdwQlpuJYHGGVTje5wCwPC/LlG+yLvVeYeEGce5hzm2TfVrdAAR5Y2n8KO1fWXGIS25hkp5lOEyCVPdt0dZ/d/kMu0JWYTeFPcq65a4mLn7R4XH+c6vtm3E63GVuIS05u8rmIo2TPv2ZfrXU39o8CMOCx4rx7V4urqH7WCiKAVrc3YRpcHsa2SRV2IMX/TS4sLIGhGyje7CLqFRXhoYiImwKszwB3o7LiRvh/eQDavisyE5NgMZ38JdfMT6NYIKLUV5HFvejNrAIDK8Kqs+YzNcMb8eR/LOyBNuuz7ICQYQYsJZNhfczvjZzEaO7E2xmN0iI3CfwNMl+ru+wXv6KWzp60YA6htG2eYQ4fcU2b6dOKen5If0WBbgVOAqJ89rIiiejPCzAZ4WTIcXmQiQQnSoF9KjHjmGddQlkUX69N/vIqQswAPftbBfsZd2jXgNx0BrTOi6eJHse6AB2xJBgE/RVPbW3zZUUio54U7oaM3CJCE/QVwzLM25Om+45QYtcmb6DJiEEdvpO/hn6ObFOWytmvwqJzN5rUPfcZgvWjropUve6B22XHO7wGdjIYeu95gWjNYuWryAGOAggHgyksoA2RIaQzJol34R86lsE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(366016)(23010399003)(1800799024)(921020)(38350700014)(18002099003)(22082099003)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?SABkAaFn+dda8vm/7sNXGU+dXZKLrVIYVHu3ahT9HDwHiTz8vQfRnXdPPFB1?=
 =?us-ascii?Q?Z7oep7TEFZ69sf/Y9jWVM4omNyUYET88iFFmTEk2OjjTtS20Jpg68M4/BevZ?=
 =?us-ascii?Q?f7+IieIh9KM0AO/XPI6GhMRiat4G1b63mm+h8RHJOWEa56OVcR0s77aeyQS/?=
 =?us-ascii?Q?TMHz8UyjTnKwFTMEW+umLcS1ctJmai7lYu67egZ6+VwHrc/PjzKgwGVNGk5x?=
 =?us-ascii?Q?/sx43+iIZRpGnXzsubOmiO9cBevIOjxQ0wL+T2RoKjYNnII/9ELmef1v+t9G?=
 =?us-ascii?Q?Kxl5b6IULffl8hK6aQouXCpeFIU0ahq1/Ye5IQ7MDx+35k08OdY/O/aNNxaU?=
 =?us-ascii?Q?f+R+GrlQwgoybXvWBc0WE6bGglFxxkhnUGurn1D3hWnC210smAXOMso43lML?=
 =?us-ascii?Q?WaTSZ0LKKN3lnQT5FImtnp3SjzvspSRaidvW8vZF7ST2ctO9UOk0FNXUM7py?=
 =?us-ascii?Q?qyeBCrjXtxVZDN+T6HJ7gWi8am4qfDJ+E6udbuD1/QJmaiR0jI/VurGaNhze?=
 =?us-ascii?Q?mKMCvXDkAwqc5MrBl37qRp42p3dUS0pHfjjiMqx2DXqIdUwz4MjAvoVwDeR7?=
 =?us-ascii?Q?b0LRbz18GUvOzdiBq33GRYcK5xsSuODXswGvYEkCfa47/KGru7p/Tf7WdT17?=
 =?us-ascii?Q?Cta9Tt466sGhHeRqYGcWxkAuvsVn1UtH+M/ab6FF5EvzmezOexFZeZwX1VSv?=
 =?us-ascii?Q?DeMlqBVwIexTRz6mVaDl2WE0wm+OesLiQ32UXKo8Ztp4lANKyRZevzvdFaYe?=
 =?us-ascii?Q?ti2HzdV+xECSq/iwOtjWGHXSgHVKxHKlhNjLg5i5BomN8iJQ8kFnWzAYbKkx?=
 =?us-ascii?Q?Tfagv2Fi/KewKZQoRjJc0FZmJiLBissI2cGFjKWIrzl1byl21Dc8Xmks+b6p?=
 =?us-ascii?Q?cvNdIRhlBHL95YsaRmN01czwUmYrTqy1o/LU23mZfNxu6NPsrBQ44kcYAK5z?=
 =?us-ascii?Q?14tWxzjDRnoe3Lrt8zaiQ4JNnxLAqMpa9dgmIip5vQqhVvu0Tl/Z3nDVEKiN?=
 =?us-ascii?Q?ht/57+05Jq5ef6OPGOXCjNW+s+bVb1vggVpY2lo8u/91/+YLUh7gJt1Gpgst?=
 =?us-ascii?Q?m5eZYPffJ3WyEwwDBb+2WUBwoJ3m8Ay+6H2cAxbxJKrR2ohLcH4dUzEyqAR0?=
 =?us-ascii?Q?FQdSHE9NhyS7Rq8TX3kUedqLb2IVM3vrfLNz5WEYEzBfaVFfaHurFYqSFF+C?=
 =?us-ascii?Q?0iejEVcCcituybEQE7I2Zu9AXZKMxCOedieJz8BErO68VE5vtyeoQVFsr0t+?=
 =?us-ascii?Q?3o8O7QTCNL2HlzB+9GUxR/s7yBsKptbYlR5i5eBHZX4vjsV8LTxfX8E7i1if?=
 =?us-ascii?Q?wgxCjdItNcYivDfCo74vImf6oaSF5IZerZ7lWqkR/TaxoXTclmtGWfo4dxh6?=
 =?us-ascii?Q?2qwiOX0FGzz7Di+Rqmx2zzriO5imza3HBgNXzXWeow2Busc+OCeDQs8KoJXv?=
 =?us-ascii?Q?5oLHrxcuxvkfQylus849KjLs/hHT/MmQ3UmyFUtdJT7mhq0uX7kXYBmLF37K?=
 =?us-ascii?Q?e7teCqQDGDfQi28ux0P8VEnZEprUvqWBLzISqeHbOMUFq6q407vzajYnZ4Ev?=
 =?us-ascii?Q?NfXUW/WqpL5/hXupm25UXJPdU7jQE+XC9te7fOKQ2SvRYpav+K1AbL+BNS/b?=
 =?us-ascii?Q?DZRoHKvRvAliwX6rSkeoKizHB7zk1BOzz8OFmrwF/3c9a4ILuKfHAv2b6h6a?=
 =?us-ascii?Q?yTYVCboxhbrI/PBkZpVzqEPWlyVbMIf0TBgdJSTJAK77YW40qUakMNGJrut/?=
 =?us-ascii?Q?V1uEpr3v+Wjk4/bMsYrDkxNd3Mjqkbo=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: a61dc2d1-9f9c-40ea-0ec3-08deec066e4d
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 17:42:29.9267
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vQYqhKQG0ijfHSBRJnilVm0MLfHn1i4+A5Z4a8Q2XuR/ku5UgNo+w4NyhSZyuu22yQGsS67TczGia0go11XZqUEq+q+xd0Ns0ady/WXlRW4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB5888

We have only an7581 specific code in the pinctrl-an7581 kernel module,
so 'en7581_' prefix is not necessary anymore. Remove it.

Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
---
 drivers/pinctrl/airoha/pinctrl-an7581.c | 398 ++++++++++++------------
 1 file changed, 199 insertions(+), 199 deletions(-)

diff --git a/drivers/pinctrl/airoha/pinctrl-an7581.c b/drivers/pinctrl/airoha/pinctrl-an7581.c
index 07a7ba1bc3a08..5056ad5138fe7 100644
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

