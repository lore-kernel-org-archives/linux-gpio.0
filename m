Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11022091.outbound.protection.outlook.com [52.101.66.91])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96217421246;
	Thu,  6 Aug 2026 22:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.91
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786054020; cv=fail; b=FRYaP83ja/ZYSTMbA9glbn0JUCvxLpg5Vb3glZcPCfiPdghaZTx6GopFD3gjwQF7Q+dlum7WjNqmyKFnOHntotaKCHR1Wxrg2yUqqbd9hy/EQbYn3QaSQCfu0GaBMwgBhbmCJWMuL4TsS0/X0dGMLFVl8SdepJ5Dq6A1g1Q49vg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786054020; c=relaxed/simple;
	bh=f2dRAhjqmt7/K8fW6OWaAnR/gZ0i/NNxsLx+m+5rFC4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ZynfiHKH3erkJdONxHyidjuC/MLOndNbLrXnlnWRgWR9QSa74s3z108bntVwcqtkfzfGSrgwSnpsYYPkHbmqzTxkjdrEwpuL9rmWqnyj03TJPa0c/tm9EpYxcpq2XCtWnEaYMf83whcauvcUyPSkrjQi2QwLDqS9f9J/OB3Hx7Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b=n0T6Habl; arc=fail smtp.client-ip=52.101.66.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=genexis.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b="n0T6Habl"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lq7twBHpXIsixl6DPsHpqa0gRQpSWJlEaDNlCmio5XZIFyEouhMxpiCDxfIcfznT4dejMPlL2oCz1uiFsh8qJaY8j3PeTCprJ6ig3RdcNDra0S8Aqc/9ZKpoOJqZgohirU1V+YzeSox6eFvtFtYVvgGk1DFHohKcerGtjF5jhzXbrKC4S9m4sr2nFtmk1goy/RCmKxUrDdiEYG91/E8Y2TXIyNn3j62iEwANvGCrTuoj/ZLkLKxthrN+skyGLF5/6Un6LUvWyfiw0uMrZJqHfslj8zKVjzYMUtpQ4SgXVLiXM0gzC0M5mjO7NpJKRP6czB2m22WQIJXix4Qf443zAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GeEr4SGOviG0gMkw8h19ohHqQE6B+fffDtBO2M7t2LY=;
 b=j+nZN7zpWSFxZT0D6B3D1GZKmJT57FWLxXp/oMzboKk2ZD6bd1faDQda3GTCmtoII8MuGMc7OGKPqiAAlmCM3aU/uas30cVKJX42QpLLB9sZHa2QGDxeYVGRogE6bT4SEaMt732GuPZgE+cZjXXjGB6S6TfuBt233CL7Qn7nsV4mwJlKje93h3telHX4lDLTZ54I+pTBviC+A7vroQS3sZ6DDQeKUcxpgNwc8QeEnQ7AIYaOhn8SFJOtS82pdylAh9ntEvs6xvh/qJkKpe35GrGuqVy9rWviUAtEubuVlaWaGNvG4mTfRj01jU9uu7lr22+pP1EwedzyBgdy9fhzwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GeEr4SGOviG0gMkw8h19ohHqQE6B+fffDtBO2M7t2LY=;
 b=n0T6HablFNrwkjaILTqFaURpGSDFRkKyCyuUcG2VhFOE93TScpPBLqA7jRHMUDworQlLOJWQzMPxnLnlpq7Mnvg3tLhrj7xtScOq1KPHtOvyGdwT8p3uegYcJOXXEwTKGFR6frfaRO9NmsyzpUW7Kgw/mCxzjt0rChZSnwrQqGHJKFXoWQOpdmvSM7CRL4/hNK1IxO8BVNJkQ+dUbxbNjTuCn8qfM3CsMk+FJNzXCOQ+y+WJmFbqtlG8nM7BKiHqHU/BUuARIa3VVj0IhARM001T2XELkhD4rGEkJPd4eHzrfsaQc6n6oGrX1055t8o1vDp1zzo5JFeF+l1wR3LyRA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by AM9PR08MB6705.eurprd08.prod.outlook.com (2603:10a6:20b:300::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Thu, 6 Aug
 2026 22:06:41 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0292.013; Thu, 6 Aug 2026
 22:06:41 +0000
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
Subject: [PATCH v11 09/37] pinctrl: airoha: an7583: fix muxing of non-gpio default pins
Date: Fri,  7 Aug 2026 01:05:47 +0300
Message-ID: <20260806220615.4078303-10-mikhail.kshevetskiy@iopsys.eu>
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
X-MS-Office365-Filtering-Correlation-Id: 8177146c-0b39-48b8-c86e-08def406fe95
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|52116014|7416014|56012099006|10067099003|11063799006|18002099003|22082099003|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	UZtcC7sh68ZUQyKr1k4iSPqcRw25oO6vHp4/LfTbBlYGBzv0CHhkC9Akl+CX1srIdt+ZPsbDVnkSg7cGNT/GDlWoiaAiPC+7ToXTrx1Aqr0FwCGZWfPe5oKT68OqzPS2qfDLmvw7bjirJKHZT+aO6rQBCZmFwPE2wJk3Y8N7HggAV16aX/G/rRKBXfO5GVX52A0UzUYsnJwZ/KJpoQTOAhrlp2RwxBnhMcYmSRnVqipiUej+/LNI7G9FfgyyBONX0WT7Zh5CPHdM2rFrmOsKtrxRCCf6uaIsAVqfd9SQQexEbxPSe8uz7xRN5zj1chLaYyUYKN5HG2q/EY01ElbQxeRi+IzgRIvEeBEsVQptsjEub+OpE5lPed2MD0JLHIrH5KcDiouVszLZ6sQuxC9RoQXx3UolyKMhdmwS/7n7wYYu932o/sPNdPaRY3z/C2prHTFfGSR1GC1Do0ioM4SLDqQudoy+FIxY2UanyyO59AMLBHsv+bC3ptbryiaH89+kh4P1PDSwEeiOEr7/QZnUvb/xV84N+KekiUlRpenHlbOy0x+OTMvGOU/1/5NtzDWu/S44kXWzNKrUzUTGPBG6BDZls74lQmPDdFvVvMTdhMeRwxTVxDhFVkJ2pdtdKk+3HTq4zWwPJwPK+LEF2NnANrQTs3rhYo3g5kcqd2aSTmngObhzz0rWcKeAxszWt5VYRH1z0iZ1buD4HvjLi6cx24Vf7K6mKe5KNDQupvhRDNI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(52116014)(7416014)(56012099006)(10067099003)(11063799006)(18002099003)(22082099003)(921020)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?38+QGfj7GPQZ1xuwTqT5lOGeDhcVEMgyP/54lkAMipdIWldxxiFipC5FjkRt?=
 =?us-ascii?Q?Gx7UdDWTcFrzpzicNHU3Z0qbHRLcOhGkpOj3HwnWxawQEC1faLQPQX9kP1Rj?=
 =?us-ascii?Q?PdkZhRl5KykadUY19NvFpYWLYOfGya/ZZeRR+JsonS3zjkzEcUi+puEGUYqN?=
 =?us-ascii?Q?Cvme0Scfaq+doRu9gC3QsTgYYMJagzxp98U4aHVSzLQ9XGNjdw/whnUeCjO1?=
 =?us-ascii?Q?MwUgFpuENpRyWfwadRXEkg2UefJWAIgWQrPIfa58lRhN3eVq3ZlAepdSYmJA?=
 =?us-ascii?Q?5H7cR7PJqhQzF+I516Qm6GJu7yzdpn3xhZVJZGr+tdklM1zNyC2e5FnetgBr?=
 =?us-ascii?Q?tZjbWY9MXnjuQF9WwPHYLI6nN7eeUspWNdJf1hrlWDUT+1C+n4nsw22+oOyy?=
 =?us-ascii?Q?e2VPy8MGDa0vp7uBddyQ5k8GJekfi13ZZ8hPupZLYepyKVxAphjnz4FUk4lT?=
 =?us-ascii?Q?u60GjkMBNZhFxEZnS0ShFJz4T5WS64wd2bnb/dimsFxqWCYCULI7xtMbeLrV?=
 =?us-ascii?Q?rraL8U8TArOvoRrXOfEJgL0mw2IfXAcx8Qg43gZ2lwZuXP3eEBdYJdpdx4r0?=
 =?us-ascii?Q?M8JyDBfHXbiwBHZARmxMMcQufvwr3bbdpuIIfILWokzJHOvKBDMTFRIMm1s+?=
 =?us-ascii?Q?iuuuXtjW6QmIwNhLGEVCuRElvRa+LTamxD3XULnwVAw+l7pUmzpNAqEbUDff?=
 =?us-ascii?Q?mhVbETMSN3VKuoBCa+yZtqfCkns7PaxA+t+vt9vXfByp/GTE8zhQ9V+iCm2p?=
 =?us-ascii?Q?amh47yn+QmlG5F3uS8DIsLplpOVQ7ynLrET56009vlIUOfMafiNlSFmOn+VW?=
 =?us-ascii?Q?lwG4trcB+rjbfsBm7em2AqGkkm19r4PMLc/iVZjKkxkpJpGlt+EUbsjIMCYJ?=
 =?us-ascii?Q?+xt/k60y85ElaIRZ437nNm/PjtnePm0cZodVENxqvo2JZIHdpK4Wx4TfTNAo?=
 =?us-ascii?Q?5P9pYGzwTHNjKlXa7LGxLS7zVnbcB8aXs9KU4aof1luOwDIQXWsyINZNnMfa?=
 =?us-ascii?Q?3RpGsyARoDmpOhPWIt2zmNxvI/p+gyVSraPzZArauIBkP7fTo0OmjSvvX7lm?=
 =?us-ascii?Q?7IOO5vVJXI/ANTlKOd03thAzvmMaY7S3gcUAO6L6cn+0HZRUJlc7PnGHpwxF?=
 =?us-ascii?Q?eSOWrJN7iCUuWWBBcCNEi4VK4WT1hErQ0SlfWxdOoJ1Nw2JpA9l79P2x13wc?=
 =?us-ascii?Q?J4RENK4xvWgP3aODT+rag6b+ZX46P+Or+aC09y7rJXpNVsbQG9Pq0bK2D+YI?=
 =?us-ascii?Q?VHdWo0IQ6jKdgKcs0+dE0capWJZXV5kw6KsT5cjw6u44/rwlqHqZWlTTH36m?=
 =?us-ascii?Q?1KkyY6tlcaY+6TdgD61dg/WWutuTZHAO1P6RDhkeEB3s4vQvHXGMM0B3bx24?=
 =?us-ascii?Q?0gZKiZdmkFFYdjtJT5oyRqUIPZEirqaSP0DoQ3UxrARxB99BdpzjiEOWVaPH?=
 =?us-ascii?Q?lwy5d8lQc31AtKmizTvEN1L08Pk+mO4CvVPtww4gKtTlEWqcqvcO0EoheN5x?=
 =?us-ascii?Q?OF/k3mAeOCCHHqHb5rgb0V1ytGdoDg0Jaucfp2e83OY7FfzTGH+yNUAFIG+3?=
 =?us-ascii?Q?fMtwcH0PGTYIBWJNPQVvK0f/13Ja42b9HoutYBOTqYJyzSo8pcJ4ZXZxKfIW?=
 =?us-ascii?Q?WewRTf/9I69dtSMSjNOYxwFRQJeLhCGmFbdGsuH3iC4l/KTL44SpuqJFBaAU?=
 =?us-ascii?Q?NlYeN7dEezcrNpr63nMzaPGFrjfLDvRejbqXbYc323TLuZl4Q9AU4V45EhJt?=
 =?us-ascii?Q?xC4hUT9ISwU2BKDADpiVgOcRKWih+Mk=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 8177146c-0b39-48b8-c86e-08def406fe95
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2026 22:06:41.2827
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YRcOaTvaEfyb/RcszRxWyJJ1PjfaQ6BTveA7KhIWiXp2zglvmOFwCHe1Z6DjkZZPMXVE7ldSs+B+3JLmDGv/YvNWIevMV7IiFvlj0FCh41c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6705

Current an7583 pinmux implementation have following issues:
 * pins 51 and 52 can't be set as pcie_reset, current pcie_reset code
   will sets pins to gpio mode instead.
 * there is no proper way to set pins 41--54 to gpio mode.
 * pins 41--53 can't be actually set as pwm pins. These pins must be
   muxed to gpio mode as well.

This patch fixes above issues.

Fixes: 3ffeb17a9a27 ("pinctrl: airoha: add support for Airoha AN7583 PINs")
Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
---
 drivers/pinctrl/airoha/pinctrl-airoha.c | 99 +++++++++++++++++++++----
 1 file changed, 86 insertions(+), 13 deletions(-)

diff --git a/drivers/pinctrl/airoha/pinctrl-airoha.c b/drivers/pinctrl/airoha/pinctrl-airoha.c
index 0b54e029c8741..89979a2c0e357 100644
--- a/drivers/pinctrl/airoha/pinctrl-airoha.c
+++ b/drivers/pinctrl/airoha/pinctrl-airoha.c
@@ -85,6 +85,18 @@
 #define GPIO_SPI_CS1_MODE_MASK			BIT(0)
 
 #define REG_GPIO_PON_MODE			0x021c
+#define AN7583_MDIO_0_GPIO_MODE_MASK		BIT(26)
+#define AN7583_MDC_0_GPIO_MODE_MASK		BIT(25)
+#define AN7583_UART_RXD_GPIO_MODE_MASK		BIT(24)
+#define AN7583_UART_TXD_GPIO_MODE_MASK		BIT(23)
+#define AN7583_SPI_MISO_GPIO_MODE_MASK		BIT(22)
+#define AN7583_SPI_MOSI_GPIO_MODE_MASK		BIT(21)
+#define AN7583_SPI_CS_GPIO_MODE_MASK		BIT(20)
+#define AN7583_SPI_CLK_GPIO_MODE_MASK		BIT(19)
+#define AN7583_I2C1_SDA_GPIO_MODE_MASK		BIT(18)
+#define AN7583_I2C1_SCL_GPIO_MODE_MASK		BIT(17)
+#define AN7583_I2C0_SDA_GPIO_MODE_MASK		BIT(16)
+#define AN7583_I2C0_SCL_GPIO_MODE_MASK		BIT(15)
 #define GPIO_PARALLEL_NAND_MODE_MASK		BIT(14)
 #define GPIO_SGMII_MDIO_MODE_MASK		BIT(13)
 #define GPIO_PCIE_RESET2_MASK			BIT(12)
@@ -783,6 +795,10 @@ static const int an7583_gpio45_pins[] = { 47 };
 static const int an7583_gpio46_pins[] = { 48 };
 static const int an7583_gpio47_pins[] = { 49 };
 static const int an7583_gpio48_pins[] = { 50 };
+static const int an7583_gpio49_pins[] = { 51 };
+static const int an7583_gpio50_pins[] = { 52 };
+static const int an7583_gpio51_pins[] = { 53 };
+static const int an7583_gpio52_pins[] = { 54 };
 static const int an7583_pcie_reset0_pins[] = { 51 };
 static const int an7583_pcie_reset1_pins[] = { 52 };
 
@@ -863,6 +879,10 @@ static const struct pingroup an7583_pinctrl_groups[] = {
 	PINCTRL_PIN_GROUP("gpio46", an7583_gpio46),
 	PINCTRL_PIN_GROUP("gpio47", an7583_gpio47),
 	PINCTRL_PIN_GROUP("gpio48", an7583_gpio48),
+	PINCTRL_PIN_GROUP("gpio49", an7583_gpio49),
+	PINCTRL_PIN_GROUP("gpio50", an7583_gpio50),
+	PINCTRL_PIN_GROUP("gpio51", an7583_gpio51),
+	PINCTRL_PIN_GROUP("gpio52", an7583_gpio52),
 	PINCTRL_PIN_GROUP("pcie_reset0", an7583_pcie_reset0),
 	PINCTRL_PIN_GROUP("pcie_reset1", an7583_pcie_reset1),
 };
@@ -892,6 +912,11 @@ static const char *const pnand_groups[] = { "pnand" };
 static const char *const gpio_groups[] = { "gpio47", "gpio48", "gpio49" };
 static const char *const pcie_reset_groups[] = { "pcie_reset0", "pcie_reset1",
 						 "pcie_reset2" };
+static const char *const an7583_gpio_groups[] = { "gpio39", "gpio40", "gpio41",
+						  "gpio42", "gpio43", "gpio44",
+						  "gpio45", "gpio46", "gpio47",
+						  "gpio48", "gpio49", "gpio50",
+						  "gpio51", "gpio52" };
 static const char *const an7583_pcie_reset_groups[] = { "pcie_reset0", "pcie_reset1" };
 static const char *const pwm_groups[] = { "gpio0", "gpio1",
 					  "gpio2", "gpio3",
@@ -938,7 +963,8 @@ static const char *const an7583_pwm_groups[] = { "gpio0", "gpio1",
 						 "gpio42", "gpio43",
 						 "gpio44", "gpio45",
 						 "gpio46", "gpio47",
-						 "gpio48" };
+						 "gpio48", "gpio49",
+						 "gpio50", "gpio51" };
 static const char *const phy1_led0_groups[] = { "gpio33", "gpio34",
 						"gpio35", "gpio42" };
 static const char *const phy2_led0_groups[] = { "gpio33", "gpio34",
@@ -1484,6 +1510,36 @@ static const struct airoha_pinctrl_func_group pcie_reset_func_group[] = {
 	},
 };
 
+static const struct airoha_pinctrl_func_group an7583_gpio_func_group[] = {
+	AIROHA_PINCTRL_GPIO_EXT("gpio39", GPIO39_FLASH_MODE_CFG,
+				AN7583_I2C0_SCL_GPIO_MODE_MASK),
+	AIROHA_PINCTRL_GPIO_EXT("gpio40", GPIO40_FLASH_MODE_CFG,
+				AN7583_I2C0_SDA_GPIO_MODE_MASK),
+	AIROHA_PINCTRL_GPIO_EXT("gpio41", GPIO41_FLASH_MODE_CFG,
+				AN7583_I2C1_SCL_GPIO_MODE_MASK),
+	AIROHA_PINCTRL_GPIO_EXT("gpio42", GPIO42_FLASH_MODE_CFG,
+				AN7583_I2C1_SDA_GPIO_MODE_MASK),
+	AIROHA_PINCTRL_GPIO_EXT("gpio43", GPIO43_FLASH_MODE_CFG,
+				AN7583_SPI_CLK_GPIO_MODE_MASK),
+	AIROHA_PINCTRL_GPIO_EXT("gpio44", GPIO44_FLASH_MODE_CFG,
+				AN7583_SPI_CS_GPIO_MODE_MASK),
+	AIROHA_PINCTRL_GPIO_EXT("gpio45", GPIO45_FLASH_MODE_CFG,
+				AN7583_SPI_MOSI_GPIO_MODE_MASK),
+	AIROHA_PINCTRL_GPIO_EXT("gpio46", GPIO46_FLASH_MODE_CFG,
+				AN7583_SPI_MISO_GPIO_MODE_MASK),
+	AIROHA_PINCTRL_GPIO_EXT("gpio47", GPIO47_FLASH_MODE_CFG,
+				AN7583_UART_TXD_GPIO_MODE_MASK),
+	AIROHA_PINCTRL_GPIO_EXT("gpio48", GPIO48_FLASH_MODE_CFG,
+				AN7583_UART_RXD_GPIO_MODE_MASK),
+	AIROHA_PINCTRL_GPIO_EXT("gpio49", GPIO49_FLASH_MODE_CFG,
+				GPIO_PCIE_RESET0_MASK),
+	AIROHA_PINCTRL_GPIO_EXT("gpio50", GPIO50_FLASH_MODE_CFG,
+				GPIO_PCIE_RESET1_MASK),
+	AIROHA_PINCTRL_GPIO_EXT("gpio51", GPIO51_FLASH_MODE_CFG,
+				AN7583_MDC_0_GPIO_MODE_MASK),
+	AIROHA_PINCTRL_GPIO("gpio52", AN7583_MDIO_0_GPIO_MODE_MASK),
+};
+
 static const struct airoha_pinctrl_func_group an7583_pcie_reset_func_group[] = {
 	{
 		.name = "pcie_reset0",
@@ -1491,7 +1547,7 @@ static const struct airoha_pinctrl_func_group an7583_pcie_reset_func_group[] = {
 			AIROHA_FUNC_MUX,
 			REG_GPIO_PON_MODE,
 			GPIO_PCIE_RESET0_MASK,
-			GPIO_PCIE_RESET0_MASK
+			0
 		},
 		.regmap_size = 1,
 	}, {
@@ -1500,7 +1556,7 @@ static const struct airoha_pinctrl_func_group an7583_pcie_reset_func_group[] = {
 			AIROHA_FUNC_MUX,
 			REG_GPIO_PON_MODE,
 			GPIO_PCIE_RESET1_MASK,
-			GPIO_PCIE_RESET1_MASK
+			0
 		},
 		.regmap_size = 1,
 	},
@@ -1637,16 +1693,32 @@ static const struct airoha_pinctrl_func_group an7583_pwm_func_group[] = {
 	AIROHA_PINCTRL_PWM_EXT("gpio36", GPIO36_FLASH_MODE_CFG),
 	AIROHA_PINCTRL_PWM_EXT("gpio37", GPIO37_FLASH_MODE_CFG),
 	AIROHA_PINCTRL_PWM_EXT("gpio38", GPIO38_FLASH_MODE_CFG),
-	AIROHA_PINCTRL_PWM_EXT("gpio39", GPIO39_FLASH_MODE_CFG),
-	AIROHA_PINCTRL_PWM_EXT("gpio40", GPIO40_FLASH_MODE_CFG),
-	AIROHA_PINCTRL_PWM_EXT("gpio41", GPIO41_FLASH_MODE_CFG),
-	AIROHA_PINCTRL_PWM_EXT("gpio42", GPIO42_FLASH_MODE_CFG),
-	AIROHA_PINCTRL_PWM_EXT("gpio43", GPIO43_FLASH_MODE_CFG),
-	AIROHA_PINCTRL_PWM_EXT("gpio44", GPIO44_FLASH_MODE_CFG),
-	AIROHA_PINCTRL_PWM_EXT("gpio45", GPIO45_FLASH_MODE_CFG),
-	AIROHA_PINCTRL_PWM_EXT("gpio46", GPIO46_FLASH_MODE_CFG),
-	AIROHA_PINCTRL_PWM_EXT("gpio47", GPIO47_FLASH_MODE_CFG),
-	AIROHA_PINCTRL_PWM_EXT("gpio48", GPIO48_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM_EXT_SEC("gpio39", GPIO39_FLASH_MODE_CFG,
+				   AN7583_I2C0_SCL_GPIO_MODE_MASK),
+	AIROHA_PINCTRL_PWM_EXT_SEC("gpio40", GPIO40_FLASH_MODE_CFG,
+				   AN7583_I2C0_SDA_GPIO_MODE_MASK),
+	AIROHA_PINCTRL_PWM_EXT_SEC("gpio41", GPIO41_FLASH_MODE_CFG,
+				   AN7583_I2C1_SCL_GPIO_MODE_MASK),
+	AIROHA_PINCTRL_PWM_EXT_SEC("gpio42", GPIO42_FLASH_MODE_CFG,
+				   AN7583_I2C1_SDA_GPIO_MODE_MASK),
+	AIROHA_PINCTRL_PWM_EXT_SEC("gpio43", GPIO43_FLASH_MODE_CFG,
+				   AN7583_SPI_CLK_GPIO_MODE_MASK),
+	AIROHA_PINCTRL_PWM_EXT_SEC("gpio44", GPIO44_FLASH_MODE_CFG,
+				   AN7583_SPI_CS_GPIO_MODE_MASK),
+	AIROHA_PINCTRL_PWM_EXT_SEC("gpio45", GPIO45_FLASH_MODE_CFG,
+				   AN7583_SPI_MOSI_GPIO_MODE_MASK),
+	AIROHA_PINCTRL_PWM_EXT_SEC("gpio46", GPIO46_FLASH_MODE_CFG,
+				   AN7583_SPI_MISO_GPIO_MODE_MASK),
+	AIROHA_PINCTRL_PWM_EXT_SEC("gpio47", GPIO47_FLASH_MODE_CFG,
+				   AN7583_UART_TXD_GPIO_MODE_MASK),
+	AIROHA_PINCTRL_PWM_EXT_SEC("gpio48", GPIO48_FLASH_MODE_CFG,
+				   AN7583_UART_RXD_GPIO_MODE_MASK),
+	AIROHA_PINCTRL_PWM_EXT_SEC("gpio49", GPIO49_FLASH_MODE_CFG,
+				   GPIO_PCIE_RESET0_MASK),
+	AIROHA_PINCTRL_PWM_EXT_SEC("gpio50", GPIO50_FLASH_MODE_CFG,
+				   GPIO_PCIE_RESET1_MASK),
+	AIROHA_PINCTRL_PWM_EXT_SEC("gpio51", GPIO51_FLASH_MODE_CFG,
+				   AN7583_MDC_0_GPIO_MODE_MASK),
 };
 
 #define AIROHA_PINCTRL_PHY_LED0(gpio, mux_val, map_mask, map_val)	\
@@ -1901,6 +1973,7 @@ static const struct airoha_pinctrl_func an7583_pinctrl_funcs[] = {
 	PINCTRL_FUNC_DESC("pcm_spi", an7583_pcm_spi),
 	PINCTRL_FUNC_DESC("emmc", emmc),
 	PINCTRL_FUNC_DESC("pnand", pnand),
+	PINCTRL_FUNC_DESC("gpio", an7583_gpio),
 	PINCTRL_FUNC_DESC("pcie_reset", an7583_pcie_reset),
 	PINCTRL_FUNC_DESC("pwm", an7583_pwm),
 	PINCTRL_FUNC_DESC("phy1_led0", an7583_phy1_led0),
-- 
2.53.0

