Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11021102.outbound.protection.outlook.com [52.101.65.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4E1D42B331;
	Thu,  6 Aug 2026 22:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.102
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786054008; cv=fail; b=jU6Bm252DnKWcPrGCP4irO3CUb8UEEh2vsGh1MBO6yeiHmlXbpGpefs5sOSQV6VXVNwY4h38lMVWyCCTVyfb1lFt4b1VPYUkYpWAR4FJaMxXzZbM73wKMMQJNbGzb/PWswJCq6ED+uBOUUbFhZuHFq/8+3EYO3wuUSBlijUGf4A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786054008; c=relaxed/simple;
	bh=bt2sCs2S59VyBr1KWHWu2kV6yVf83iUP5pTj75SOr/w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Cg9KfAAMX8C5oZzXrloJbctMa1CAsgZEKz89MTUMII5dT3rQY9dDus1iw2mJcmmhaAtKw8R+J5w2Cnac9whekqKtdcLtnK4jklGAC+NDmdfmzJQOJt7vnU6c4kvSobZPRpEYUQHFJ0XjcYZHgcPB/yTVlBAs8OzRneAZb15sloM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b=IlITnzsC; arc=fail smtp.client-ip=52.101.65.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=genexis.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b="IlITnzsC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gJHFZ69rjrZ8R3zB5AzPlzldIIUdACoBjKEBjrHCaljlvse8rvJ4/2qNmSoAB8I4JpfagGVLtfeJQI33i0cXb2UvqO59e2JWrz6jBYHGQa8MCI2DUjAsnv+CiXv40sFKUZrSjaKjem4l/RJqu5V/jUc1Du5XI0SBGmfmZuPQG9MyXYvs48uUIsRCSElinWh/+0rKcmq187+NmtP8FAbFzp/Bcz7vFmqYq+beZMfJzww3xkx5bH9MxjSMdJ8jI05o4pbxfZZHVnjC+Xfgcts18MYqY8FxQEdpKuXTu1XY2w+UlYA1SqeHMUj5RKj/H7TgYQobQcwOX2aaUvegSIXfyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1h8jDvueuDWMLAhzDXJvDtsubaKc0SmI89WT4uFyzPU=;
 b=G/V1eukhN5dnDOU+N72CljClx/JcXc5Klr1tSYTKxOsyCQxVe9v4Mteno5QBr8GlmdBS64WSJ2VMwQ2ToTqmAIFiT33QdHvQ3xIPlXFXSUjB2FC/hzXYIK1W/u24kw05/tjC13EPg0xjiVyyibUB5LGgdWGR3IDv2fMP22R7GM8BePusEdbmPNWFSVv1ESEF7A/jxnEOMAA1HBtWi/hDpQTc3dFFb/A/gjH9VPaOqsBBM9thb50gcGkDWs8YyDejsQo/S3udvWxRzjcg3qfMV3VyDA8qAr89vMnDgUHUsxbDBXik/XlDODOlISaIavMvC+aVoYLXKHWWiEvrEMs7uA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1h8jDvueuDWMLAhzDXJvDtsubaKc0SmI89WT4uFyzPU=;
 b=IlITnzsCEh/8rADFnnRz6m1hwXFFVVuGO+pAf8Q5dzfi2boRQvbXx8pgD/kjZC2jH5ASgDf50fOJDfFuQRKUT/ntZEZpxHSGbBrTKHJBZZrZN4IfFdB6ZScRpJXL1xfiaujzrodM+677x0K/yilB7TkFMxw/gj6LDGcwC7sVh/meELYU7NwCaS/U0cPCiynL8cYt58xRGGJ4H5oTXkQoc0tazK1R5In5lejwyTa56LhGIxoZLH0LjnSisO9shO8UfutMwcIBnvRwZmLSETeDypS3R4Xx2ddDvIlhuxzJy1CxJGbwPCSvydJzlaotA3ovjzEK/eYlgRdGtEoSG+CMCg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by AM9PR08MB6705.eurprd08.prod.outlook.com (2603:10a6:20b:300::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Thu, 6 Aug
 2026 22:06:37 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0292.013; Thu, 6 Aug 2026
 22:06:37 +0000
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
Subject: [PATCH v11 07/37] pinctrl: airoha: an7581: fix mux/conf of pcie_reset pins
Date: Fri,  7 Aug 2026 01:05:45 +0300
Message-ID: <20260806220615.4078303-8-mikhail.kshevetskiy@iopsys.eu>
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
X-MS-Office365-Filtering-Correlation-Id: 6b27dc00-3fed-4d2d-2549-08def406fc53
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|52116014|7416014|56012099006|10067099003|11063799006|18002099003|22082099003|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	/st34l6KHoIVhjHDfRKA53z4aAkQNaagBnUgx0dasftGh+XbC9ZA0utR3rPAb0AD2TqXD1sD6IYSGOu3M8pWnIWP5q8LDtzZRItgTa7uFbXLO8gUrTLNVpj00c+p/I3fXXGRNCZlPUANYM+5x2O3YzmI83+9PzO4Y/m+lmRzll4yg1oL/dian3A9dUi8ASq24BAecNp8tL6sZGF/fTrv5HbGVQE66Hw2fqAkBYKNp0iX6uN2O0n7BjRZvIMDwRb7JkM/pGyo6y7GuP0cBWPbJGvjLpkzwn514ltlKs3rYwjsnSOGsHdBKma4rTHTZMdb7hI5Z65x/yMGbISDx++zMsjnhdBW22f3s/cQHXEuJWQ9F/J8H2wwZIu4SJjnHHIjy6nCeeSEZQ2Y8Kgx/+u1Sh4jBo2N5iddNz2tU5x4yVMWLZ7QXGKDXYG9FJomOfIv1/E2im/VGOQlf09UPjc3UizS9ICu4VdtuahmGdwmvs08DC2FuB4fU3jNVL2lA9hbdT9YyfxPQ3Zx2S+Jgcj/kkWT6tEFaABK0KS6s5+7qeBmxYibjOEUvXu6WekActMOwGiH3Pj7M/4D2kwsUVjUXDKz3gzMO7K5PKxcnxwS/m2i8MQtWBSP0kEQKwbSkU6E6o8FH1OGgZJOePVPviEVWPH09fHbzREA3XbfISJpNZ3ZOno4QGYFpVjbKi5TVBGqRFkIkjIOb0uhp6rmdQ0JhO4cFoU1P0XAU8ELcnDa5po=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(52116014)(7416014)(56012099006)(10067099003)(11063799006)(18002099003)(22082099003)(921020)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?gLTVfLFuTkbIugW/XCuFfHiViytlelu+7C/zL0L2sNwjrlMH4kWCVkfG71N4?=
 =?us-ascii?Q?cJsrwgi0jdFH1xwftTaG2QXqVcFfVINdvZIRyMsYPIhyAAXM1w1o2Gj2iyKn?=
 =?us-ascii?Q?/q/9dPZb7V/yzvLgjT1covlltFZqqd/QBWO2lGdOuk/NSThYRcZyrugxp6Vv?=
 =?us-ascii?Q?QlHcXDpVYyhTG0S/kPedYtGFknherAr74DopklsIa5BcTqXQN7SVYfB0RoLV?=
 =?us-ascii?Q?CHsB5LasyvXJCVTp3PnwA7mAoaNA7gc29YxnCtLx/PcQFaqUpr4QjILY2e2K?=
 =?us-ascii?Q?swG3lG+VcvA4h3XiAcMd0l5OpWDF8XGQT29XzXFVB0iW/Uur+pgXyvQefuzS?=
 =?us-ascii?Q?uQtLcDGUVkVSdJX21ihKT4Xj0vSy1H+Kboau/4EwQ/LWFKZUklxz6BO/lQ/L?=
 =?us-ascii?Q?xNj0aNUCgxVjGgaBuMUEp8XOq/k8JUYHQk/cBA85kRY5NoWWC1hUILSPQfcZ?=
 =?us-ascii?Q?G/5Uepg8kzXKxolyw0pQM0I8dOk6PnBJjVBNZSjnjzxLu34zeXucB93+tCv+?=
 =?us-ascii?Q?jGK6oJfVQBP/Olgq6rNCBYZnyv43LIISqLDx974iYIIa/5Io5AIo8Y3mjcFo?=
 =?us-ascii?Q?Xvf1+oSRekRXwRcKeU9NHAaxsBG+ucT1hW5fm9vz6/KV1Bpv4iaUagpzliDk?=
 =?us-ascii?Q?a8+V46RR13PmeD/PMiAdwVGjhfGjS/x5RaaxfEnkye2RxhsL+xqo+6DTtTMW?=
 =?us-ascii?Q?5ghVLYqnoKMxO0ciCZ3Dqgdep+5XiP6BmOmn/EdsxB8Rl2ZyoISlooH4bKg+?=
 =?us-ascii?Q?ZsLZNpJFruO0Fhwzyb7DZG5n/Ms2g8R0Lip8/emzGoVK0GXLn5Lej/bfa+Mz?=
 =?us-ascii?Q?B8OZOfHClZ/OItrvIC5nr41B3xMA0Cjmb7CxxfXtd0E+4nRcOKu1tujT9oL5?=
 =?us-ascii?Q?cVtEm8q7Fnq4hC1d+f87xscqAXTVULKU11Sy2daWlcnA4OpsWVT9FEzw15gC?=
 =?us-ascii?Q?POBZbqdNAsc0B3o5dC9oqOpd1LjLngcL1iu/n89Sijs0kP8Kw3F/phNrAz6V?=
 =?us-ascii?Q?8kjLV1Me6WGxpu8Cp0qXrUhcaYEu6tJF1JGb2cQIPiUt93zRjURypV+8wJbD?=
 =?us-ascii?Q?fBlFdB0RvwlM7brLqJUG6Fzi/R8pcB2Qxpnx6jdvb7nhWvmdrHdt2r4ynHvQ?=
 =?us-ascii?Q?DOo2q3nVTRQOSudzd1ZehfEvVsU80S/XGMsE9KJM+qwWFe7GZMiev4kzFp+h?=
 =?us-ascii?Q?JKCwV0PXYq+t1XpQ9aUrdD3feATbiGAk9k4uDq+9BDxmKUQSmcGbYjan4tbb?=
 =?us-ascii?Q?6usiP8oKSwE3HuEXNRKd1iY9UGOtMHkTVdkEntXXFZkrz0BpGbJj7vGKl5wr?=
 =?us-ascii?Q?fkFFToolxbnYBQx2Z/LJTl48KCLaX+FIIz69OZlz+nZHVuq2enMyYBX0G2zo?=
 =?us-ascii?Q?uVhQBdKkgDDwPiFxLdmVTMjSSkCgbtIqqAn+U85TUfu9GLzv9VCSwnEBYdV1?=
 =?us-ascii?Q?+LHhfETBpagazBULdDZWN3X32XHT6SIsX7s4uSPpNiJJlSBWqAWl7LlTl18K?=
 =?us-ascii?Q?qoReaGnatsEPq10IbyG4Ui6OtPF+czBJ6Mt6B5RslIeEmG1jwi5N8XBpHWLx?=
 =?us-ascii?Q?pfkcS1oTY/myYjrTWRQiCX2X3FYc0UHeL8Ofb8ifduBtB1W8prqEB4YzH/wh?=
 =?us-ascii?Q?55khTRmZS9e7KpoxLuwoSo1I8mr3Atx0lxGc98CZmzdrdCJTRGeHTiuIzdS4?=
 =?us-ascii?Q?X2EEzf9SV2N6YfBGteguz65mW2UrCCoGKMRKnWxlwX9UXjeBu+R4r6oMcZ6a?=
 =?us-ascii?Q?qXixFNEeJB2jzDXQECYzSl92CDhAFwQ=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b27dc00-3fed-4d2d-2549-08def406fc53
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2026 22:06:37.5376
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ye+EPhuD45tXrA2a55Jv4lPFRWpNZ0zpakgFcsfBYrYFZnAtDk+WTi6DmSaREj3/WhngHeORWoI1RjvmqR9dwH/yM5COeyTfgMd/4Vuv0vk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6705

In the an7581 case
 * gpio47 and pcie_reset0 shares pin 60,
 * gpio48 and pcie_reset1 shares pin 61,
 * gpio49 and pcie_reset2 shares pin 62.
but current driver treat them as pins 61--63. This is wrong.

Also current an7581 pinmux implementation have following issues:
 * current pcie_reset pin function actually sets corresponding
   pins as gpios.
 * there is no proper way to set pcie_reset pins as gpios.
 * there is no way to set pcie_reset pins as pwm.

This patch fixes above issues.

WARNING:
There is a contradiction in the Airoha documentation. AN7581 programming
guide claims:
 - gpio44 and pcie_reset0 shares the same pin
 - gpio45 and pcie_reset1 shares the same pin
 - gpio46 and pcie_reset2 shares the same pin
While AN7581 datasheet claims:
 - gpio47 and pcie_reset0 shares the same pin
 - gpio48 and pcie_reset1 shares the same pin
 - gpio49 and pcie_reset2 shares the same pin
The datasheet should be considered as a more reliable source.
Thanks to Benjamin Larsson for clarification.

Fixes: 1c8ace2d0725 ("pinctrl: airoha: Add support for EN7581 SoC")
Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
---
 drivers/pinctrl/airoha/pinctrl-airoha.c | 122 +++++++++++++++++++-----
 1 file changed, 97 insertions(+), 25 deletions(-)

diff --git a/drivers/pinctrl/airoha/pinctrl-airoha.c b/drivers/pinctrl/airoha/pinctrl-airoha.c
index d743d7fdcf0cd..0b54e029c8741 100644
--- a/drivers/pinctrl/airoha/pinctrl-airoha.c
+++ b/drivers/pinctrl/airoha/pinctrl-airoha.c
@@ -470,9 +470,9 @@ static struct pinctrl_pin_desc en7581_pinctrl_pins[] = {
 	PINCTRL_PIN(57, "gpio44"),
 	PINCTRL_PIN(58, "gpio45"),
 	PINCTRL_PIN(59, "gpio46"),
-	PINCTRL_PIN(61, "pcie_reset0"),
-	PINCTRL_PIN(62, "pcie_reset1"),
-	PINCTRL_PIN(63, "pcie_reset2"),
+	PINCTRL_PIN(60, "pcie_reset0"),
+	PINCTRL_PIN(61, "pcie_reset1"),
+	PINCTRL_PIN(62, "pcie_reset2"),
 };
 
 static const int en7581_pon_pins[] = { 49, 50, 51, 52, 53, 54 };
@@ -555,9 +555,12 @@ static const int en7581_gpio43_pins[] = { 56 };
 static const int en7581_gpio44_pins[] = { 57 };
 static const int en7581_gpio45_pins[] = { 58 };
 static const int en7581_gpio46_pins[] = { 59 };
-static const int en7581_pcie_reset0_pins[] = { 61 };
-static const int en7581_pcie_reset1_pins[] = { 62 };
-static const int en7581_pcie_reset2_pins[] = { 63 };
+static const int en7581_gpio47_pins[] = { 60 };
+static const int en7581_gpio48_pins[] = { 61 };
+static const int en7581_gpio49_pins[] = { 62 };
+static const int en7581_pcie_reset0_pins[] = { 60 };
+static const int en7581_pcie_reset1_pins[] = { 61 };
+static const int en7581_pcie_reset2_pins[] = { 62 };
 
 static const struct pingroup en7581_pinctrl_groups[] = {
 	PINCTRL_PIN_GROUP("pon", en7581_pon),
@@ -640,6 +643,9 @@ static const struct pingroup en7581_pinctrl_groups[] = {
 	PINCTRL_PIN_GROUP("gpio44", en7581_gpio44),
 	PINCTRL_PIN_GROUP("gpio45", en7581_gpio45),
 	PINCTRL_PIN_GROUP("gpio46", en7581_gpio46),
+	PINCTRL_PIN_GROUP("gpio47", en7581_gpio47),
+	PINCTRL_PIN_GROUP("gpio48", en7581_gpio48),
+	PINCTRL_PIN_GROUP("gpio49", en7581_gpio49),
 	PINCTRL_PIN_GROUP("pcie_reset0", en7581_pcie_reset0),
 	PINCTRL_PIN_GROUP("pcie_reset1", en7581_pcie_reset1),
 	PINCTRL_PIN_GROUP("pcie_reset2", en7581_pcie_reset2),
@@ -883,6 +889,7 @@ static const char *const an7583_pcm_spi_groups[] = { "pcm_spi",
 static const char *const i2s_groups[] = { "i2s" };
 static const char *const emmc_groups[] = { "emmc" };
 static const char *const pnand_groups[] = { "pnand" };
+static const char *const gpio_groups[] = { "gpio47", "gpio48", "gpio49" };
 static const char *const pcie_reset_groups[] = { "pcie_reset0", "pcie_reset1",
 						 "pcie_reset2" };
 static const char *const an7583_pcie_reset_groups[] = { "pcie_reset0", "pcie_reset1" };
@@ -907,7 +914,8 @@ static const char *const pwm_groups[] = { "gpio0", "gpio1",
 					  "gpio40", "gpio41",
 					  "gpio42", "gpio43",
 					  "gpio44", "gpio45",
-					  "gpio46" };
+					  "gpio46", "gpio47",
+					  "gpio48", "gpio49" };
 static const char *const an7583_pwm_groups[] = { "gpio0", "gpio1",
 						 "gpio2", "gpio3",
 						 "gpio4", "gpio5",
@@ -1406,6 +1414,45 @@ static const struct airoha_pinctrl_func_group pnand_func_group[] = {
 	},
 };
 
+#define AIROHA_PINCTRL_GPIO(gpio, mux_val)			\
+	{							\
+		.name = (gpio),					\
+		.regmap[0] = {					\
+			AIROHA_FUNC_MUX,			\
+			REG_GPIO_PON_MODE,			\
+			(mux_val),				\
+			(mux_val)				\
+		},						\
+		.regmap_size = 1,				\
+	}
+
+#define AIROHA_PINCTRL_GPIO_EXT(gpio, mux_val, smux_val)	\
+	{							\
+		.name = (gpio),					\
+		.regmap[0] = {					\
+			AIROHA_FUNC_PWM_EXT_MUX,		\
+			REG_GPIO_FLASH_MODE_CFG_EXT,		\
+			(mux_val),				\
+			0					\
+		},						\
+		.regmap[1] = {					\
+			AIROHA_FUNC_MUX,			\
+			REG_GPIO_PON_MODE,			\
+			(smux_val),				\
+			(smux_val)				\
+		},						\
+		.regmap_size = 2,				\
+	}
+
+static const struct airoha_pinctrl_func_group gpio_func_group[] = {
+	AIROHA_PINCTRL_GPIO_EXT("gpio47", GPIO47_FLASH_MODE_CFG,
+				GPIO_PCIE_RESET0_MASK),
+	AIROHA_PINCTRL_GPIO_EXT("gpio48", GPIO48_FLASH_MODE_CFG,
+				GPIO_PCIE_RESET1_MASK),
+	AIROHA_PINCTRL_GPIO_EXT("gpio49", GPIO49_FLASH_MODE_CFG,
+				GPIO_PCIE_RESET2_MASK),
+};
+
 static const struct airoha_pinctrl_func_group pcie_reset_func_group[] = {
 	{
 		.name = "pcie_reset0",
@@ -1413,7 +1460,7 @@ static const struct airoha_pinctrl_func_group pcie_reset_func_group[] = {
 			AIROHA_FUNC_MUX,
 			REG_GPIO_PON_MODE,
 			GPIO_PCIE_RESET0_MASK,
-			GPIO_PCIE_RESET0_MASK
+			0
 		},
 		.regmap_size = 1,
 	}, {
@@ -1422,7 +1469,7 @@ static const struct airoha_pinctrl_func_group pcie_reset_func_group[] = {
 			AIROHA_FUNC_MUX,
 			REG_GPIO_PON_MODE,
 			GPIO_PCIE_RESET1_MASK,
-			GPIO_PCIE_RESET1_MASK
+			0
 		},
 		.regmap_size = 1,
 	}, {
@@ -1431,7 +1478,7 @@ static const struct airoha_pinctrl_func_group pcie_reset_func_group[] = {
 			AIROHA_FUNC_MUX,
 			REG_GPIO_PON_MODE,
 			GPIO_PCIE_RESET2_MASK,
-			GPIO_PCIE_RESET2_MASK
+			0
 		},
 		.regmap_size = 1,
 	},
@@ -1484,6 +1531,24 @@ static const struct airoha_pinctrl_func_group an7583_pcie_reset_func_group[] = {
 		.regmap_size = 1,			\
 	}						\
 
+#define AIROHA_PINCTRL_PWM_EXT_SEC(gpio, mux_val, smux_val)	\
+	{							\
+		.name = (gpio),					\
+		.regmap[0] = {					\
+			AIROHA_FUNC_PWM_EXT_MUX,		\
+			REG_GPIO_FLASH_MODE_CFG_EXT,		\
+			(mux_val),				\
+			(mux_val)				\
+		},						\
+		.regmap[1] = {					\
+			AIROHA_FUNC_MUX,			\
+			REG_GPIO_PON_MODE,			\
+			(smux_val),				\
+			(smux_val)				\
+		},						\
+		.regmap_size = 2,				\
+	}
+
 static const struct airoha_pinctrl_func_group pwm_func_group[] = {
 	AIROHA_PINCTRL_PWM("gpio0", GPIO0_FLASH_MODE_CFG),
 	AIROHA_PINCTRL_PWM("gpio1", GPIO1_FLASH_MODE_CFG),
@@ -1528,6 +1593,12 @@ static const struct airoha_pinctrl_func_group pwm_func_group[] = {
 	AIROHA_PINCTRL_PWM_EXT("gpio44", GPIO44_FLASH_MODE_CFG),
 	AIROHA_PINCTRL_PWM_EXT("gpio45", GPIO45_FLASH_MODE_CFG),
 	AIROHA_PINCTRL_PWM_EXT("gpio46", GPIO46_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM_EXT_SEC("gpio47", GPIO47_FLASH_MODE_CFG,
+				   GPIO_PCIE_RESET0_MASK),
+	AIROHA_PINCTRL_PWM_EXT_SEC("gpio48", GPIO48_FLASH_MODE_CFG,
+				   GPIO_PCIE_RESET1_MASK),
+	AIROHA_PINCTRL_PWM_EXT_SEC("gpio49", GPIO49_FLASH_MODE_CFG,
+				   GPIO_PCIE_RESET2_MASK),
 };
 
 static const struct airoha_pinctrl_func_group an7583_pwm_func_group[] = {
@@ -1804,6 +1875,7 @@ static const struct airoha_pinctrl_func en7581_pinctrl_funcs[] = {
 	PINCTRL_FUNC_DESC("i2s", i2s),
 	PINCTRL_FUNC_DESC("emmc", emmc),
 	PINCTRL_FUNC_DESC("pnand", pnand),
+	PINCTRL_FUNC_DESC("gpio", gpio),
 	PINCTRL_FUNC_DESC("pcie_reset", pcie_reset),
 	PINCTRL_FUNC_DESC("pwm", pwm),
 	PINCTRL_FUNC_DESC("phy1_led0", phy1_led0),
@@ -1897,9 +1969,9 @@ static const struct airoha_pinctrl_conf en7581_pinctrl_pullup_conf[] = {
 	PINCTRL_CONF_DESC(57, REG_GPIO_H_PU, BIT(12)),
 	PINCTRL_CONF_DESC(58, REG_GPIO_H_PU, BIT(13)),
 	PINCTRL_CONF_DESC(59, REG_GPIO_H_PU, BIT(14)),
-	PINCTRL_CONF_DESC(61, REG_I2C_SDA_PU, PCIE0_RESET_PU_MASK),
-	PINCTRL_CONF_DESC(62, REG_I2C_SDA_PU, PCIE1_RESET_PU_MASK),
-	PINCTRL_CONF_DESC(63, REG_I2C_SDA_PU, PCIE2_RESET_PU_MASK),
+	PINCTRL_CONF_DESC(60, REG_I2C_SDA_PU, PCIE0_RESET_PU_MASK),
+	PINCTRL_CONF_DESC(61, REG_I2C_SDA_PU, PCIE1_RESET_PU_MASK),
+	PINCTRL_CONF_DESC(62, REG_I2C_SDA_PU, PCIE2_RESET_PU_MASK),
 };
 
 static const struct airoha_pinctrl_conf an7583_pinctrl_pullup_conf[] = {
@@ -2014,9 +2086,9 @@ static const struct airoha_pinctrl_conf en7581_pinctrl_pulldown_conf[] = {
 	PINCTRL_CONF_DESC(57, REG_GPIO_H_PD, BIT(12)),
 	PINCTRL_CONF_DESC(58, REG_GPIO_H_PD, BIT(13)),
 	PINCTRL_CONF_DESC(59, REG_GPIO_H_PD, BIT(14)),
-	PINCTRL_CONF_DESC(61, REG_I2C_SDA_PD, PCIE0_RESET_PD_MASK),
-	PINCTRL_CONF_DESC(62, REG_I2C_SDA_PD, PCIE1_RESET_PD_MASK),
-	PINCTRL_CONF_DESC(63, REG_I2C_SDA_PD, PCIE2_RESET_PD_MASK),
+	PINCTRL_CONF_DESC(60, REG_I2C_SDA_PD, PCIE0_RESET_PD_MASK),
+	PINCTRL_CONF_DESC(61, REG_I2C_SDA_PD, PCIE1_RESET_PD_MASK),
+	PINCTRL_CONF_DESC(62, REG_I2C_SDA_PD, PCIE2_RESET_PD_MASK),
 };
 
 static const struct airoha_pinctrl_conf an7583_pinctrl_pulldown_conf[] = {
@@ -2131,9 +2203,9 @@ static const struct airoha_pinctrl_conf en7581_pinctrl_drive_e2_conf[] = {
 	PINCTRL_CONF_DESC(57, REG_GPIO_H_E2, BIT(12)),
 	PINCTRL_CONF_DESC(58, REG_GPIO_H_E2, BIT(13)),
 	PINCTRL_CONF_DESC(59, REG_GPIO_H_E2, BIT(14)),
-	PINCTRL_CONF_DESC(61, REG_I2C_SDA_E2, PCIE0_RESET_E2_MASK),
-	PINCTRL_CONF_DESC(62, REG_I2C_SDA_E2, PCIE1_RESET_E2_MASK),
-	PINCTRL_CONF_DESC(63, REG_I2C_SDA_E2, PCIE2_RESET_E2_MASK),
+	PINCTRL_CONF_DESC(60, REG_I2C_SDA_E2, PCIE0_RESET_E2_MASK),
+	PINCTRL_CONF_DESC(61, REG_I2C_SDA_E2, PCIE1_RESET_E2_MASK),
+	PINCTRL_CONF_DESC(62, REG_I2C_SDA_E2, PCIE2_RESET_E2_MASK),
 };
 
 static const struct airoha_pinctrl_conf an7583_pinctrl_drive_e2_conf[] = {
@@ -2248,9 +2320,9 @@ static const struct airoha_pinctrl_conf en7581_pinctrl_drive_e4_conf[] = {
 	PINCTRL_CONF_DESC(57, REG_GPIO_H_E4, BIT(12)),
 	PINCTRL_CONF_DESC(58, REG_GPIO_H_E4, BIT(13)),
 	PINCTRL_CONF_DESC(59, REG_GPIO_H_E4, BIT(14)),
-	PINCTRL_CONF_DESC(61, REG_I2C_SDA_E4, PCIE0_RESET_E4_MASK),
-	PINCTRL_CONF_DESC(62, REG_I2C_SDA_E4, PCIE1_RESET_E4_MASK),
-	PINCTRL_CONF_DESC(63, REG_I2C_SDA_E4, PCIE2_RESET_E4_MASK),
+	PINCTRL_CONF_DESC(60, REG_I2C_SDA_E4, PCIE0_RESET_E4_MASK),
+	PINCTRL_CONF_DESC(61, REG_I2C_SDA_E4, PCIE1_RESET_E4_MASK),
+	PINCTRL_CONF_DESC(62, REG_I2C_SDA_E4, PCIE2_RESET_E4_MASK),
 };
 
 static const struct airoha_pinctrl_conf an7583_pinctrl_drive_e4_conf[] = {
@@ -2310,9 +2382,9 @@ static const struct airoha_pinctrl_conf an7583_pinctrl_drive_e4_conf[] = {
 };
 
 static const struct airoha_pinctrl_conf en7581_pinctrl_pcie_rst_od_conf[] = {
-	PINCTRL_CONF_DESC(61, REG_PCIE_RESET_OD, PCIE0_RESET_OD_MASK),
-	PINCTRL_CONF_DESC(62, REG_PCIE_RESET_OD, PCIE1_RESET_OD_MASK),
-	PINCTRL_CONF_DESC(63, REG_PCIE_RESET_OD, PCIE2_RESET_OD_MASK),
+	PINCTRL_CONF_DESC(60, REG_PCIE_RESET_OD, PCIE0_RESET_OD_MASK),
+	PINCTRL_CONF_DESC(61, REG_PCIE_RESET_OD, PCIE1_RESET_OD_MASK),
+	PINCTRL_CONF_DESC(62, REG_PCIE_RESET_OD, PCIE2_RESET_OD_MASK),
 };
 
 static const struct airoha_pinctrl_conf an7583_pinctrl_pcie_rst_od_conf[] = {
-- 
2.53.0

