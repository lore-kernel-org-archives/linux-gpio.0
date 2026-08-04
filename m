Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11021084.outbound.protection.outlook.com [52.101.70.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79F4E473C6C;
	Tue,  4 Aug 2026 16:04:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.84
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785859490; cv=fail; b=ZtNugJ6LHv/NEe8VZy30UAbYsD/xXjuAPCHuHvHqwZJKxNfMHv9qcfIzBVV0fEMD6iNanruStSVWxlRM8RMejNJh/HSxFMHZUG9HAQdClCYOzCsSi/WXFcHl4o6eo8kpA+raQF9MCc+SFXpDPtGaX+YWJzVk3jNamsdBiSkuARg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785859490; c=relaxed/simple;
	bh=f2dRAhjqmt7/K8fW6OWaAnR/gZ0i/NNxsLx+m+5rFC4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ayVOwHqa/7rakyb2Jy6f38Ygv5F0QRt0vwwPjEIy3TgdUiqH6tzZYkeC03BEcQM3r1Rih3yWUi1mc/8s1VUKLynt/inBylLEeMsnPDDLrffSOSaOlNyUAUVmRFzSy/HmUwbC64ha9R6ZhtgBtyCariE7gy/Suy3SnFMBTfpaBcg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b=gQshCAM0; arc=fail smtp.client-ip=52.101.70.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=genexis.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b="gQshCAM0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mGrks6dckhHcfVc8oswEWbK21pci63S8VGxeFpljbSFMgVQFMBxIpzDMLlk+k/PXEhL1zPFvuJpDibH9vvZM1E3LAcSmjjPXELojIbmyQZG3YtVvM6MsgSHL7HxI6GsmhcdDstamEvWde+3M3F11/oaIbDgu8QABFOZJ3lEWhVrqBEigm8yPpky07Qnx0sQwkpIVWId7eQRZ7zeloAPaP4TTcuF24SxFuybD/hCVAcefLx3EGZKAjjbYjvX2SfN12mC5+Qu3htLZulwLwI1744XdgefAG5Ag4FCvAhWCEgnooAWzfgFoeh5WxsvekmN0GULKNkr3Qv9yt7DcjKhIrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GeEr4SGOviG0gMkw8h19ohHqQE6B+fffDtBO2M7t2LY=;
 b=OuFDft4bwTvGZEvjysD4bTO60wQD1DL8Ze4TbBZhvUclLEp86EV2GACUVCz8Ez3AvBIBYUMvy0lkgaGh5gCwEvNS6cz/rYwHi9wvaax/3fri1Dp+05JV/zRk07n/rDlICxqV5DgfcoU9/hh8Vkcy+t8SKZsVVr543fI6dOiWIVQeWfTiXoOO1y2JoDvCQON3dqUlGqjKC9gIK4n1e+ieUTRMfY1oLHoRovpkumU6HQPM7gCEuSUEZqD9pgoP91gLO0mU9OvGI0buoyTkRRrAgSSqdtPrLLqgjnTcWWo3N9fFYN1Hpqa6E6kwQ0GknjijMuiB7zQo/YqelScpIXdcsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GeEr4SGOviG0gMkw8h19ohHqQE6B+fffDtBO2M7t2LY=;
 b=gQshCAM0zSY7Xf7av8XTbPlJW8iUwFNPpzlPcH5b8tpfOi/A/1NRSDJlaKhT++U7g8W4gw3R/YY6dEI+0f/tTLrSjP/3oj4uI5bPDk4knxQh/4Ru6YNYv1yqNoccybtOz+Pksffmqnt7hnYvSXRQ4gussPob1+Yhe+0t3oEUBfCCxwPQr3jnCbUwavbRv2sd8eIMVAaYvvS11Qia9z1pErlvcR602mKElLKikGrI/IU0RYZRsH9G5BroL3IyyCRkdJe9LEgboirE632A2G2l7mlOpcQ0lK2qC8zd0+52l+35MEyHzByy1E9DH21iDKYQBKkYUvgbeSypfXkjfijbGw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by AM8PR08MB5761.eurprd08.prod.outlook.com (2603:10a6:20b:1d0::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Tue, 4 Aug
 2026 16:04:43 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0292.013; Tue, 4 Aug 2026
 16:04:43 +0000
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
Subject: [PATCH v9 08/36] pinctrl: airoha: an7583: fix muxing of non-gpio default pins
Date: Tue,  4 Aug 2026 19:03:51 +0300
Message-ID: <20260804160419.3592327-9-mikhail.kshevetskiy@iopsys.eu>
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
X-MS-Office365-Filtering-Correlation-Id: ed4bd81c-9d08-463f-75d5-08def24218fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|7416014|23010399003|921020|38350700014|22082099003|18002099003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	LpCR9IvLwj2Z6RfJpf8MgijxsmepbS7LGcAJ64ZDN5Ulmtpk4dBkBatc8TMi+Vhr0lbhtkkZll6PdBDEs1O7oV8JcpNejBfNuJjDZ30gAWW88rsKnhLxJsTWnB1NGiyQuh4psDLpPK5EINEvcelMmuHDVYKMbNHe0vo7MmtkjS13zaVZPQp44bC7w0/zZPTw+QWbQrq3FCL0XBLLxDqgxNbY0/6+/k4DYgjmM3sgy/iDlfm4zjutkYt2iQ+QRuE5VAFe+XBzCZ6tNzkVwGr6GTiBXLp2o5mvAII2qfIzizz/PzrIT5OTVxe0NCHRffkcXl5YsMKc0ODDWSPXvDdGXUUZOqGhgNd8GkssLxlkTQkzQk8vfkOq70cuoAxOgA/+ocRsTYIsbUKopizd/RJaPQc18shPH/n66kAIcBv4pGmKrbDGGwvNTusap6vIGKeNraYtk/MBcC4yOxgCYC575W/D4PHn7bx8uf7XVNJI9MajVrao6oT1JKHqYrAhA5NuSwAMQcrfJtsx6cKugt+v9H9qsl8lRGvg9YZlwTrGGzHsC7+RiSAJ0HD71bccREEzEjBIVc1hQ+22F0f+2re6wca/5ILFj0OWW0HvXSRn2p+swUG0pSmPkEt13WM0EflauYTkJ1kzV8fgiNLeUdzSdOdjgNHFOPcokf5S4EtlDV/wcKbM/SLqHsjyO4hz6MMsADqDU/0LnINCIrmfIcZV+7CK1qiqmRmjRKprIw4nAeY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(7416014)(23010399003)(921020)(38350700014)(22082099003)(18002099003)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?QZ6PY3p/QVkJSbiphg1b6DN9cmt/08CIqw99ccKIThyd/tOxDa4TPDS2/xxs?=
 =?us-ascii?Q?hD93uYLQ6pjH4hmVEOGe+f+G8cxkYTkGHynphStr1RKaDrLmQRUtYRQrmsQ+?=
 =?us-ascii?Q?JydPqaYwgxbxeiobFZnt7BfLAfPS4eJ8JmkAwXLBom/5BZhpZlD3LN+M/D/q?=
 =?us-ascii?Q?YQ1H1vX9OSDFbJIeHi2BnOT2y9kwmD2hKDwVUv+NQSm3VGDkEWVFiMBbK5Ek?=
 =?us-ascii?Q?FDXsL5QIhj1IulQS/ioZDSleS3LwxBwZ0RDl8O7OPHAzHEdktuARIkwnWOWC?=
 =?us-ascii?Q?crO0LdrSlF5DygSCsVFu7kojRFwjYfvDmSrip4/92hF0OX06lX0BzefhyX9k?=
 =?us-ascii?Q?5nTW8HV/39sN/Chhx1NkOzL2UOETxarprN0QMlGufMZaZPwp0ajpFeYBxWfg?=
 =?us-ascii?Q?WNPcanmiTJKjxED7ZwCiuQwqFCYjTuO6Wv/m0dkplvID+yrMrJYxJgIYT9NQ?=
 =?us-ascii?Q?uta5s1G2WWhmpz98b/o95Ua1Hlh6mJf5j28+9Ir9n/7ZbJmfGG4VGMFEkBvb?=
 =?us-ascii?Q?q36SqjUanyFNftjM6sPLrljA+YSaWEJGznoL9dKY17WnyFMvkgemmHJ9DnK9?=
 =?us-ascii?Q?FicPnJlHI5mXRYiKqs6+lYkSg+UfZ/qsqW34BTXdNm6LcRikKDD1Fpczye0y?=
 =?us-ascii?Q?3CDqKcfl0TnPbFIE0mE9eL+D9vTBU6hC9LzA/ri8VPpVqnYhZVtUb8+w7ZCK?=
 =?us-ascii?Q?XTyGDHPyW1HNdSrV+8VQ2kozUcY8LKWW6A/O6Dwt6Rcc/Un4CXJc4WEIlRiw?=
 =?us-ascii?Q?1NptnMF77Mx5CbWmGC460gVpbrThZffiJCmjIPnl8TYCf0WjGVNejc3iSl6y?=
 =?us-ascii?Q?2EyLlW3z+bTCGYbpKtshbXNEAomgCK4pd2b9SgfHI6f3zMap+sU01ZXHsPc1?=
 =?us-ascii?Q?+2HROMq6KZoa4bVfHLCClTiY+4qsTQSnJL/Kz4/qGqzz1iWq5+C0donbC2IF?=
 =?us-ascii?Q?q5NWiHj2yZcD/4nG2typLhkjhzJTc+g6uCIF/M7QN8oThy9x/oiCNZqmjJ2O?=
 =?us-ascii?Q?MSseVJs7TeKabOMiTuYjxA3C72YgQOE5c5qxBXQ1fbr4e0rOSoBkvNiVlSav?=
 =?us-ascii?Q?CkQfkN765EebxhRMjyKIQ8i09oEQO7j6Zu5y32M+kvV0JYUsJfmZ3FAv1pWU?=
 =?us-ascii?Q?mwV8qs5onRHueV/XSE3eYw8elRIyXKOORXNdLGO6ZpESWBiIzShfvrt2E1Nb?=
 =?us-ascii?Q?eHWL33sVU+E/ABw62U/ZXW4LoCoMxEiJybAdW/d0dBG0S1hggpjrFnSz0BKw?=
 =?us-ascii?Q?7D2rr157Q/b6u2Sz6OD2SgP47CNv2In/FOGTLIAIMAqwkd1C3/K6Yt5rmHmi?=
 =?us-ascii?Q?ldKfmL+VUFNU2pSyh45KuJv7YO6ey4lJaMDCn+YHneF9SCc7BykXmKL2S9ZV?=
 =?us-ascii?Q?Ya0bCnoLOmOLBx3eJrTTKsDMYeACIZfGJfGlsPRjCg/f/ymTTEJbizZp40Ru?=
 =?us-ascii?Q?XAhUZB4BGWXMOb+ClVrVOxGEgGjZ89RVd9yNTDACpAlhAGf6jcHg+JVhTfe4?=
 =?us-ascii?Q?ouPo0Y4+IpxzOBWS+GsemnWeU9SbGcYZMsCBARCCXxUJ6i+wh4g8+E4JcnyF?=
 =?us-ascii?Q?G8oH+fpaU49jmCT5cTxmBlWkATpuEMXHDVmG3Asgq7i/3qkAXV+llmyHxaoa?=
 =?us-ascii?Q?r/gpDaipprNzOkBd4mwHRJt5Ob7oNTgA0d/qvcxzqqClQyflLPQi4yqsQP3o?=
 =?us-ascii?Q?aPL3k9TSx+NSqObwoLFwMhJa93T3Hx0+S6p9a0mvsK9+KtNP2kCi571oQMvs?=
 =?us-ascii?Q?vNae6aWdih7bDkfzmXcCkHQnj53ijUE=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: ed4bd81c-9d08-463f-75d5-08def24218fb
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 16:04:43.6169
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G1xTDuZ77Eg0mkhXHcHANnr+hGqcFz60rkS7sa0dWys6kqJPP7uoMVFp0tOk01hxJSHDh3UvM9XlvTcU5dJCTQkAQiB+//GfThtkNevCeFc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5761

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

