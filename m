Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11021083.outbound.protection.outlook.com [52.101.70.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72F19435A9A;
	Mon, 27 Jul 2026 17:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.83
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785174136; cv=fail; b=ueFXO16/lHINXc4etOVlOz+g/TN+O/E/zBMT/UFXa62sItKdlcKK8N0VhQsYBHpptu/hfzY+W22ddgUFBLztUtjUt8U0R+/Ujeqzn2ryQVpT1M3Lxr1n1sax5gl4lxpNBhAai0czvEKfX9cq3GqvH98+BGWbt0j2BK+9mec+s6o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785174136; c=relaxed/simple;
	bh=plzH7KgbgSLELmTktEMKa4KIg+7YiDTlJTQFDbxbzqg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jU/HOojgahoKr6SSfFk/zj5qoAjBLzFmuDY+zT4Z7/WJp8iICeoOm5qf5NhtxHyHW2dLxsoj1BL1YrJ2jSWbp7cCUDlpe8eDmdDzOTGh1V8awyUdZfF4o7O+tRN++mSjlyk8cVvvIo4x2UkNBkPo6o2QVFJVHEhd9QBd3eIR9hQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b=shEQAS8V; arc=fail smtp.client-ip=52.101.70.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=genexis.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b="shEQAS8V"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OUBnC+Ovh2fVruDXFwGafa2LFYSnmCobYaut8PJXuebEl5jswLuhfxpO+WzG/AJ27ceX/QHMyD3ImHExtOltEdnGUk+pdifpz6YRuRi8OPZIcdeEMls27nzWT/WutWUTf/qg9Osqs05qZQUpCPpV10mUWppX46NZKfWpOpaY/Jt+aU6I7u/AyFYgvvys8VozWUfJxj3gvsKALowb5ouMiUPS8w0NyM0QOWTEH0TsGcbjNNLMlARLSruiIYTPW3x0wAaZ9CKWcRISNXqwCcSz831Vbd9Q64Ujd4KHWjhs0spJ9hgVEbMmpvkT72ZI76buQOPXEx+VYKqrW73JZa8GCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PSxZlJgvm0vaYYLGPn7Qm0UYPKiRPHbn0QCV3eqAzk8=;
 b=CkAMYWmnS1F5ksj3aq5xr6Me52ZkMnP1KUZ2ZMpdq4O+4S7XoXwXweTbCgBgmVVoM1K33EIH2TrmSJbrjmyaiD5pYJwdf7Ag7V0pV26caIZJmHdGorOazYojLDC39eTXQqadkdxVm0gcnR/NonbQGhtaJZ9BerehnjRA3mhnbJUjJDUG2ZeF3SdxVIsSyiyRFRo79KUX7YMQMZ0nzr4tZHoBACALUeVV2clmYpl3IajomjJZ7sgI/rVQFZU1m/kXDN6sW/K5Oo+IRKyWE02AWMX01gOm52ylEwwUx7QI2fRNFWb2bj5vifkTp5XPNtHMtAL6yAEHhQCAQBTaF9ARoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PSxZlJgvm0vaYYLGPn7Qm0UYPKiRPHbn0QCV3eqAzk8=;
 b=shEQAS8VDOIb0lKxYs39dlWhQw1iNTjQh27hnB6/52JMTYrJtcYxlFqiPZUkJ/3BnQVuSG+9SkyyZ17PyewqtyfLkqfkLFfNg+6G94DYaEieWh4ey15j6GYGkyiftjBAlKsBxXYLU/R4eeKvP6gJL1ttZQ0dctHFIHfKUVAYfKpQ2Bs6Y8SU3T4wp+wNy/kDhlhNGlpaVsHqKh2oMQBuOyCt8q/mBXtzUh065MZRV3q8eGrrpq860XO0XEWT1glyVoavq3I8UMqsp6ahDEdPz5QruCkZI3MOMV3GxL168nXu66idDCzSuImyV5NozvvMVuLQusoqi0I2HRQJXWA1dg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by AS1PR08MB7537.eurprd08.prod.outlook.com (2603:10a6:20b:481::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Mon, 27 Jul
 2026 17:42:04 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0245.012; Mon, 27 Jul 2026
 17:42:04 +0000
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
Subject: [PATCH v8 06/35] pinctrl: airoha: an7583: fix I2C0_SDA_PD register bit order
Date: Mon, 27 Jul 2026 20:41:12 +0300
Message-ID: <20260727174141.664933-7-mikhail.kshevetskiy@iopsys.eu>
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
X-MS-Office365-Filtering-Correlation-Id: d3ced956-15e2-44f5-5903-08deec065eec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|366016|23010399003|1800799024|38350700014|921020|56012099006|10067099003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	lMTPu9zk4AqmnjHOZGM5zWBB74V+VXHB9vQhd8FgiFyLho5r+SLqsg1JhxSDWjnBnxGI8PurvGqL8FNVsz0dL76gZADdfSh00uFXKlG1wXLV/+AtTm3Oo4tKtsepZ8BanEFKghQ7dXVt6570lsqZp2Lu7weizd48UP9fdGdRJ1faKkxUZmjc3vzPryjURFTUOfKwTlmNFI3G+7dDiQgj5O+mgXABPHljqm/p3qMdBVcv+hEp4PrrQ2wzVdJ5KbpUut1JbdcFw6TNs7SdVv5pydtiq0rR4E2KUeV0iHSx1Kwh5uYXOJ31Q93jZ/A/CNagsUaz+CNlwMwQb77++KUComJ+w+2smOPq2VJtan7StSDsGh41COno+hhqavuGYEASnDZHdFot+2yRkkW5OxNc0XtX4ZKzJFjuSP2ep+fXByN5xbv5ID1jV0xonz6vQS9EdJHalQ4eDsJzbxr9o2dPuhb0ezwJmZupAwrvwbMoKDl9m1IdYjjTGNYheZ3AOVhKNrMa2+yWUbbuhFBRQp3rmCil4pcedaLKqUiehC8tqBmA7naOZqpfDFrgPRgR9+eJl6+VM3gz/J7pApyXxfRPWFS8RFAoKC7DBe2/v4ksR/Mq+qIculThJ01sEb3l/L5/yM8aC8oRT3ZUcyoJ/mAmQYs1OOuZyZSTuM2+ICW+Cf6aTxvEOkuFO+kayJT+3T82IQ0FG9xmkKNxaCn+Vf5HVau7qyKbltBvk19LwnJmRd8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(366016)(23010399003)(1800799024)(38350700014)(921020)(56012099006)(10067099003)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?D47qZm/i7Mf1EaNIGlekderUlvNnOrglnNbhww96pKCiRBzBxNZkLzAWjxnK?=
 =?us-ascii?Q?N1zfhn3H4782fIjGwMgjkDJ7fltTvZStBnT+cppsFSaBeVoK2YrQ2o7n1XGi?=
 =?us-ascii?Q?rDQe36Z7QvuzBMh9AWas4YQOjZJSiYe/M6sgik6BWG9Af3lgCQ1TJ68DEFm/?=
 =?us-ascii?Q?ZWVexwUOzMhchLYt+MRby2WoB/Mia5/XLMQgWTOuERL0crZ6LZTZ1HDZfXNe?=
 =?us-ascii?Q?jBtE5nZSoj4SC9ib62gbZZroE4RNzE0ilkrJDzBSPPDsBlxUhqRWxuG8ZCP0?=
 =?us-ascii?Q?gCqsMz3MjQXy83XundyxGir8l0Og4bTfgxcqTJoOssvQAinYygupeKLIrL2B?=
 =?us-ascii?Q?ZuBXupzRbfWVjNqvXqBFCACwG/Kgk4JIuKy87HGUENjxKGVe3J1R/SQGsC5w?=
 =?us-ascii?Q?WAxZfGadTSefEJf+c1vhcFP30T7KFLo2VS5Ebfq7rHrxmWOb81TktNx6E+Ix?=
 =?us-ascii?Q?VbE3TW3zN3b8uGSvjdryq7n+KQBvwWJSeU4Ftka4h7fzq93aN+pqp9Vm+eiM?=
 =?us-ascii?Q?VVV5sx1kseAcYBHoF1qbiG4g097R2qvBER8meXhfopMSEt24cZPd7RpMp3cj?=
 =?us-ascii?Q?+eZDZ61iu66Kk0TF99s+dBSxsybU1Pm7Gg33P5yEgZXxynkyQqOYuU4P55l2?=
 =?us-ascii?Q?uNK+7WbExqDIp/GhRSEbW6m2OkWpbxqlfFYAls5wNiB3WFrBF5Ab8t/NezQS?=
 =?us-ascii?Q?9WC0e3rJWTMDf+lUdM3UA3GJSF2woXEsv4dRPu80Ezj9hM/Sv1m9eGIkeAyx?=
 =?us-ascii?Q?EIiKUgj7X727yHztENzP3A0WSERqfk79/kWOu8//B63HuzwQOI3f/R4Ei0SF?=
 =?us-ascii?Q?BoLI1/pIiM1cBsyjOamJqFihXPq6wRRq7P6Fm2Fl3MhK1PX6E45KfcnMXcGk?=
 =?us-ascii?Q?NYNqISU+/tpS0sWF+KOsAdahlzwGXNhOWILOqWjj8kIBkXdvKNU61xIWBohS?=
 =?us-ascii?Q?wR1bzEYNs9p5P78aKyZlekOWkKd+cpgPBglMPnQQhyNnU5EGmw8kJci6xayj?=
 =?us-ascii?Q?BMnfHwGtp5plie+y1lYrW767i6y5jReGsgfZAQDNiykrCEqOJSZNcBXAeJYn?=
 =?us-ascii?Q?8CHZ+wBHClBI58vYIsPuCw+HHYFMnlYvSddkWS5oDUJiXijWK67aduWT5hIr?=
 =?us-ascii?Q?f9Atz54eYC+NsbaN1wwBafEw3FspRFcXY0fGpvhlkkSGTQcJYeUr30/MpFQI?=
 =?us-ascii?Q?vw4AEY0TtQEO9FxWY55rMp/mR3z4ZXitEmtjh9MBvtwNaogLC6CfoBqlxNRy?=
 =?us-ascii?Q?QKftz+WoNtMVjykVlC8XXAMDo5yiRbC3aYuaH32SmjOMdBNS4yRFumTwhLmo?=
 =?us-ascii?Q?VgZyXVMFvFbewWgeTy1Fa+CSrQZBpqLO5bViMIUguVihdwNIFtyai8jU7lVa?=
 =?us-ascii?Q?pNNMpNYnjA9k7/MOWEFmDrPsO5OqvJT0I39YjUb9fsoUovbPXDpeC7PfvJjf?=
 =?us-ascii?Q?gRpUWjmigRPQ+C6OqmpItW9uuEiTWoLWp1LHLaiPx8pgYRD+6cHHUf8Au2Tq?=
 =?us-ascii?Q?+1y313PftYhbKb+VtMxo+S0FbQnQsT7BY0Oo9BY1X0BGHCaaB+HRtVHBnPi0?=
 =?us-ascii?Q?k9am2OF3FXxpXc2gtiyjM73qyNrNqUfZygN9cbDlA8/eVsfJyQ2yBsHV8A1T?=
 =?us-ascii?Q?JLpZO+6g5ATZ/5nASWO96RnHEsJGA5nJxb+88b77e5u89tbbFWjoatZIEjdo?=
 =?us-ascii?Q?UOBTrYIM6EOvCyekmtljxaca0LXRA+WShhSqubjgwkAVeAHX9dVIBJIRUtHD?=
 =?us-ascii?Q?9uNxYSzBJcMz4QGCSuEgjB7Qg4tc0xg=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: d3ced956-15e2-44f5-5903-08deec065eec
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 17:42:04.1037
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jIpsDCeB29NjckPT3C06OB5oPCdW8UIDtf8csaybuxeN7+kB8lXvjwscXAlKiD/1eFPgSEjcjd+rFt7MbgGuyHnt2EIZPEeB/j15qzXw1Kc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR08MB7537

I2C1_SCL_PD and RG_I2C1_SDA_PD bits are swapped, fix it.

Fixes: 3ffeb17a9a27 ("pinctrl: airoha: add support for Airoha AN7583 PINs")
Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
---
 drivers/pinctrl/airoha/pinctrl-airoha.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/airoha/pinctrl-airoha.c b/drivers/pinctrl/airoha/pinctrl-airoha.c
index 36d14103798b1..d743d7fdcf0cd 100644
--- a/drivers/pinctrl/airoha/pinctrl-airoha.c
+++ b/drivers/pinctrl/airoha/pinctrl-airoha.c
@@ -185,8 +185,8 @@
 #define I2C_SDA_PU_MASK				BIT(0)
 
 #define REG_I2C_SDA_PD				0x0048
-#define AN7583_I2C1_SDA_PD_MASK			BIT(16)
-#define AN7583_I2C1_SCL_PD_MASK			BIT(15)
+#define AN7583_I2C1_SCL_PD_MASK			BIT(16)
+#define AN7583_I2C1_SDA_PD_MASK			BIT(15)
 #define SPI_MISO_PD_MASK			BIT(14)
 #define SPI_MOSI_PD_MASK			BIT(13)
 #define SPI_CLK_PD_MASK				BIT(12)
-- 
2.53.0

