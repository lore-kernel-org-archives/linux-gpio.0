Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11021125.outbound.protection.outlook.com [40.107.130.125])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48F1346C844;
	Wed,  5 Aug 2026 12:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.125
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785933292; cv=fail; b=hNUSvV1Fp6GsvDk7rm9t0CQm4cVrJOnH58Qt33WPD1RdVQAm61dNCfUgiblcjTPsISTQOGwL87Flj5unSGKR99MGsmRrv94EzUq0UZPla5fUzjojGzAlZGLrsLkonUTwGrIm/fUWwIZAnjKe4TAv12TanOvnrJMi1+tI4p0Iq/Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785933292; c=relaxed/simple;
	bh=f2dRAhjqmt7/K8fW6OWaAnR/gZ0i/NNxsLx+m+5rFC4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=PrCaVbPc7M7IJaKoJfDG7EUXuofDfKCmlMTYzKyBmQwiG1QI/dARnZnfo2GmGuizjivEYOzGtXZe2DAB+HB7RErWFhuJdac+lDpA2RruNNHLWzV0GcthtErfGre596BsOVTkMoAa4RbLgOvQ51SEhNU3l57cJdnBSkfO1023qmE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b=Xp5ZelAh; arc=fail smtp.client-ip=40.107.130.125
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=genexis.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b="Xp5ZelAh"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZhMINMGlu2hcCr6c55qwr6NVGPkQtGkQPzxBEqwW5jcQGP0dXGa8ifCvHBsI36mbj0eFgO7MbN8Dm6W0X1sQFlWSVjksArAcHBj7PwowMsF9ZyEUW1ovBa9rFXwJEFbUCwvxRhg7+nIbgiJncBps2UnpORy88o2pSOZ7QAigwFMsOtLFu9o56Kib5J1v5d9BplLr1zYs+zp2lTNPhO+BuXxJlLxYM4dnyu3ZBiUP662xmuXQuQffzbscltv9iaOq66utCBXUberJPc3B+mTXad0RWV4Pu31DBUdFk2Ga9a4SoNcvVqChs+Psu0lzdMwQq1WTa9xxKo+zan/LlwGPPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GeEr4SGOviG0gMkw8h19ohHqQE6B+fffDtBO2M7t2LY=;
 b=s3Gt1Vx/zxOgGRez/AFZZ0ixkE74MHMRwbX8aL0KJRbgBJ70fNDih3/dl+2AfkhbYC5MXtRUsp9XoQkB3Fb4umVkSB4ghnQ32daNALkkGlij0KqI8JHJFCn9TcX0+pmwpgEDQ+NWu9p8GrFT4ZCP/pqpwsR9TrF8InYR/foxN4E63EqlQlgcZ7QAcRiNaD/y7Plygsb3TJt3xqQdhlExfx/coIaDae3bnlxS47BcBo1CbqDTK95HaqqK6NN71UYwfGwQZSs1aw5VHEso5zTIUrHxNvRftmYgB+v1cAg4bYSxN9fcp7cLKbLutd7l9G/0vZsPj0Kr14lA4oQcoFXDDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GeEr4SGOviG0gMkw8h19ohHqQE6B+fffDtBO2M7t2LY=;
 b=Xp5ZelAhQ+o8dwpnn0UBJV2UAvaCDmnir/e2w7tDHcKKUW8Ehw8R6XQQ/T067ROZzj/HCByrZ7UisBJjNo6EMz/n8hvNoA6vvOO/KG7r4sdiD+g++J2szIozsETv5LBHz5Sqj7RodWdSTImgocFl6k/MUZz6frAxjaBwa+7vbBdD/9l8fY0LlZODNW5pUiNCnzsP1/kvNeYbOfWfbT3XAWM/SgL8vXk3ur2W/cJzu+Xc/wzXIo90EHm028JI6ijyWonyvZWE6L7bynwGyqQMz4f+ioZ0QH4IQWgcP8qGJd1EodZCMnf3zvGPY6Dld+Db48g/TsD/ZpveZUK6DepOog==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by AS4PR08MB7831.eurprd08.prod.outlook.com (2603:10a6:20b:51b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Wed, 5 Aug
 2026 12:34:37 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0292.013; Wed, 5 Aug 2026
 12:34:36 +0000
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
Subject: [PATCH v10 08/36] pinctrl: airoha: an7583: fix muxing of non-gpio default pins
Date: Wed,  5 Aug 2026 15:33:40 +0300
Message-ID: <20260805123408.3767648-9-mikhail.kshevetskiy@iopsys.eu>
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
X-MS-TrafficTypeDiagnostic: DU2PR08MB10037:EE_|AS4PR08MB7831:EE_
X-MS-Office365-Filtering-Correlation-Id: ed3f4fcd-4c53-46f6-b3c7-08def2ede937
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|376014|366016|1800799024|23010399003|11063799006|56012099006|10067099003|22082099003|18002099003|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	9qGWtmev9VRfjpdycoW9wGqT+GXG4tOzPnyOPnuE0/qzp/dVoF70Cip1MSNXEaDutBRa4WBIxwp6n3J4Sag9gKg+xXk0Lio4dRTzHCMgAMXeXZ7wRZk1gwtV5uGtkI3nFqigehFPM779i+/b67KoSbfJqlbkHOO09q8AVyBaM0fdpGniLmId79RUnAcs1mJDHNJddTgKVe6hBN8huAWO+MgvpztWt71FyKZrZrbqR4rZIZAmhD3VVBhlEb4YDKUvAblL3X8VAct5eJeoePReQXF9QwTpKnDgFET2wD+oy3iX0A7jJZrfx2b9yonq+I9hMIyxztVL7mMYHXveGXl4lhVQL0Xc8/S43Rq2i6ZFdNlJ4e5P56gyjt87sDRUlcRnvDl+HIKuT9ouJC/aBZKiNEfMASEKxrmgDFvY+8dV0XX+l86TH/hggd3Wys5tFmvrK4U9QHRBvY4eCCinpOhw2U5n2XQQMfzY1HoD6Pizuek/fu2CxNzTpEpNNqWqSlYHjsNZhm4WQz4n2edjEXM89HdMZ660A2poeX9VIRaoc8k2e8STEMk+J8wyvrjJpfmQa7mqVrsZ0MJFniDEf93/Yh1RxsFfU8oU29dHV3Rk30Gi+xwRQqI4l9idodSU/7U0tbaqGiyMJor+EVWhvcfvs5NvaLwIF426cMA79AGUvu/Tk1Dv6/kmMeajjxf2CH/NC5w+8tSn9P0OKwr/QJGyogNiCNqAI+V+LVcvdXk7qp0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(366016)(1800799024)(23010399003)(11063799006)(56012099006)(10067099003)(22082099003)(18002099003)(921020)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?uEEWc5jjtT7BQoFfpNvpCPeKwiRZQxtQflTTK8F6jXuEYNKIO40mkj2w+cQS?=
 =?us-ascii?Q?FLyd7bQKiVyoCOPlAEnkBkaHKL20jHmhVh386eXFjpP8TIidqhzEE8OMyxIZ?=
 =?us-ascii?Q?bkanNrk1vineZWIcjr1a32VKeNUOjDmYnc7f92xCNbkhKD7YuykHzjwpeTGc?=
 =?us-ascii?Q?qYdnA3egpwLN6uZtySFADJN5nH9XGdkVi+Zm0LlULJdzO0sUo+LGc+ae/PkA?=
 =?us-ascii?Q?Ff3LAR09Nd1DPR5TzsBN+sDePnzXCi7r9NEHc3sjtqFxY4fsiYNFavJU1e5I?=
 =?us-ascii?Q?FQOI6mwW4M19bD2WmcqhwpMuPH5OsgcJerY1ociO+QOgoxaeUfwrYt5liFvK?=
 =?us-ascii?Q?c1XNIAuimPA41ZYNpGwQrmIDysfDbSLosZv09wnFXuLWpIsTdAzrFucUfAAb?=
 =?us-ascii?Q?//kJlYg8voeXl/0tugL6U1FdvFkZ6pk5WB5AdHCtg3C2fYVxEfVZKpCVl+r/?=
 =?us-ascii?Q?5GtnJArwJQuEJ4nuwkR434rsNeq16Ovwz5koS1l1xVqJkyKINj4ZP/Z8ObaZ?=
 =?us-ascii?Q?j9XNiNE+qbBth+CCRqwDmmESXsHXWxoISFFQ8n88naYLGR5EHnaII1/YlTnu?=
 =?us-ascii?Q?HggB3nN/SMyZSmPWFcALaoURCrYneSGl5ub+QsBsIIlp0uIycfInlj5apjEB?=
 =?us-ascii?Q?s6zU+oA8BwczSOjgo5G5heWmS2u4lXhFbmlVdzAAvEuLkUNDnxczNeoN9Vrq?=
 =?us-ascii?Q?mcuEEYALuIgGz+V/rKiv5yskQnLFCgierGsTTKYmNvsxyhRIrHvfypOsmUrX?=
 =?us-ascii?Q?UK/rEtizrN1M10R5LgG9NwFegNWCa/J98660P+PdaFTd7Qvcv3cGkH5y/UKl?=
 =?us-ascii?Q?0Vwkq4QVhoIjzNj8o4rn/k0zAwFB711/n6DLu2BRioMzZtCh7sw+ZJJGxWPF?=
 =?us-ascii?Q?zFoEnn0Gs2yfUMJPlPSKedV9C3hiA8F68HofEFn4qL0Qx6u/FZkUIdkzyZJS?=
 =?us-ascii?Q?En239mD6jTH+meUnWA7F/+Dk2WPht35EAAGT/R4GIn5KxXfwsVdRozAqTdpH?=
 =?us-ascii?Q?5KLzT0Pa+kaYRZuFxBe6ZGdUIJM9K6dK4+JnIzAZeBhjOgHqHFOjPPkIz5OU?=
 =?us-ascii?Q?EJcMV9Jy7Ry7qvLrzz1Oxjo5129RjuFaaIn4684RYSGZP/Us5aaP3rpaqvd0?=
 =?us-ascii?Q?tqjputy0n0m+4ZfDDSZFujTV5TIWHpdRODg3kkRKGOhkLtPSF/VZZ56UzXnc?=
 =?us-ascii?Q?R/czODvs3fU8nO13vPrU+ePVIkMMpqD8oTUHsSqIfV8O3t5AWT20xIoSi5ai?=
 =?us-ascii?Q?kMzhBGpjpVnVACmaf3STKRD3phuUjXwI2fPtPs1Nm5o5c4yBwju0PkChEExb?=
 =?us-ascii?Q?t6sQvhjlt4uBmclW1uFKZF5U2vD9bNCCaHoAM5jXLIAolMBlj59qgMoKSqme?=
 =?us-ascii?Q?8Ny4KcEmNLM8cwSsyl6Pvp7GRqd8dqPYZkbJ7T4SHxxpA0Kq9LKWYWxCLiWF?=
 =?us-ascii?Q?K+82WkZbcupyoJLfRPnGf98pSdJBRP9boTY1z2WLhxEKMvVZ+TLhn1HvvkpL?=
 =?us-ascii?Q?uDxDbdedabe9Dh2XZZOGfjTTNkIPretKLJP28BH84MN9RAqklyN4/iF3jO8R?=
 =?us-ascii?Q?OJwD2Twane34PzAkCckT/6eXLxBuJKMY/8zWBMhabIf1bKjfa+PbhNUuWzQM?=
 =?us-ascii?Q?/RDeGd0Q2oj46a+mPXxIS7/rfnrfifC8/tjqmhNNb68x0qpaLmdDnO/rzcIA?=
 =?us-ascii?Q?ZxH+fHEuUc7PC/nwjg5aIJ4v9qaQ8mi4xrrCvl24JG4+5rUkYIo1GuRQSe5q?=
 =?us-ascii?Q?DYfr7vk0zvagehrjzh9JF9K0KQVNNLU=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: ed3f4fcd-4c53-46f6-b3c7-08def2ede937
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2026 12:34:36.8747
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Nf0xSkVqQ2QbCzN3bPC/3t8jR2lI1Ufrc8vqQ6YPeoMGod4/8esMT9edXpt3QYwmN8LImiCUyjyUdmrCvYqf7/Lu+4mnXO6/nj4OPNUKMD0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7831

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

