Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11021084.outbound.protection.outlook.com [52.101.70.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E25CC4746A3;
	Tue,  4 Aug 2026 16:04:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.84
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785859495; cv=fail; b=Ig3AIN9C/gozyl9N2ORIqr7tb05aexYfP91+48cwXjh36OIsJiFESId1RD0T/y0/Ef9zYDAOhYj5H0BJlSJRE14XaUfxntmZNXRnoOajUuIkiQAfGlXL0QuaM4xjv3XPxoWePhGU8Fv8S+Rfd2mqSgP4DlENIBiIndQx0D4JQZU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785859495; c=relaxed/simple;
	bh=4C/RMWG30NsNQGseHFbVfJY8KM7CftHDDIkUnb28Uyw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=E9omo0+dkHiTUTTo9y343V5t+uZ+NGp+UcOYoWSORONwx/VL4ZRIU2cu5fj53BuvULIXIK0d+wImscI828yp/VE4NDWkdHVC0Q8ZhKt4YmunGe2ijyTI5bRMAq/clPYx2w7sez5cHgks5inmEWugTGQxJao4Pvk2gJBBk+5PMUo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b=AJT1OLP6; arc=fail smtp.client-ip=52.101.70.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=genexis.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b="AJT1OLP6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cLBB5OZ3B+MJtQebLL9NjoI19IF4ozmjn+wx5ocW30LFAsLLKk9Mf/xr/huN6xz3W1mn1WrQuimHnj2i8xZaqQY0iyghVlI0VgDCnUNw7b24Jwpiytf5UHESRcrHLnx5Dfnro2L6ejomOVV1q2wkBRnaNsS/1C7oSah5v7PbaefvGYk/be7aSyHFfI/BmpGKXEhx6JPn8+8c4taFMxZyTxEwaymlxpOt9ckNI526Ewi0kbIAV3Ezg22bQM/idbqtWd83V2/1yNrMeY71TBfDPp1QFlACN1pGOt3IKIUlvydCB2+BodvFh2JJY9arPsihH/TvYP8qgdydkYCHHnKNCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oBj0IHire2KuEO9ACnbQOuA7Xwq0cNeUv4zo1WsCD5c=;
 b=jv5Qmibbh3WXfqTccf8bTeDp3RlT8J/7w/MQEbesSSB8gSbKCUhHUzb6GzRbH0btoaP4S1w4Rt6NzphkriVxOaBFXhZiBEU3ylR9tg1exWBhO8dUc8cZkFFI4HPepgvxHlNSXLqgG3GjFRMzYEIBT9sofBerpkcFDrEpwS+YZdjJIz94Tlt5fg9DIqkRHoH9xSMGnU7wZKLYvNQ6rv1MDJbbo9Np/R+6dCOTIvvekHobLZuxWkhYvhtuxqofA9kSoXVfMWzjsVZDYQWEIKwP2cvkDwoilXXuX0KmOjZ5Fq/bUCLV8LLhEKDWIJYvQtTw3L2dROVI7AThogS/WU/O+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oBj0IHire2KuEO9ACnbQOuA7Xwq0cNeUv4zo1WsCD5c=;
 b=AJT1OLP65dvaw8nhOcswBYGoeh8HDFnKJrqaoCUGpkLnGeJHO09UFSCW1y8tzvhrmmpjCchyt8pkX7oJ1XZ1lgSSO7BOz/Ry8E50pHVIy7dIemGs4mJJ0vfCaaxZxwk81lV1M7g5oL+shvOwlvrU7vCE7K17noaehSwnZGC0JtC5+PggrZMoTwvDfio6Y42JbI35BACaHNButB1N9v0Vbby+cHQeNcJuS3Du1UovbZv+J3yzGwZD0gQ59BLTV24fVeBpEdZnIpCFnnFXEU5XOMg+c0SRFAfBfsWxHyBxgkHCfXHYfyhC6bT30SYoA+49rSXnlxkK/5oEKyv5iGXsDA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by AM8PR08MB5761.eurprd08.prod.outlook.com (2603:10a6:20b:1d0::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Tue, 4 Aug
 2026 16:04:49 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0292.013; Tue, 4 Aug 2026
 16:04:49 +0000
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
Subject: [PATCH v9 11/36] pinctrl: airoha: fix I2C pin mux config for AN7583
Date: Tue,  4 Aug 2026 19:03:54 +0300
Message-ID: <20260804160419.3592327-12-mikhail.kshevetskiy@iopsys.eu>
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
X-MS-Office365-Filtering-Correlation-Id: b52a3b19-2ea8-4076-f522-08def2421c54
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|7416014|23010399003|921020|38350700014|22082099003|18002099003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	k5uItUZxeZHMhR5UJNxTp8rM8SHUyuVXlVrzfu/Eb7ormcPYXRO05J2tHhUo+O1OvxyiPfkV/a5hip6qdWFws1UqCef0L6aDhwGwyIAy9EaHGs3T4u/RTZRKSAAO2I1+Bhn/QAXCAVIafTrNev2Vo98h0T3xjkKME4FvmKdPuQogX8M36UZND7pJWmCbU2z5P+6WKCmTOCZrECbWA4Vwe3YnPO1fLX670diKrKYVvLi7Tl3L1umuB0hHbmDWtRhGt9Ig3RdhZGwZmU+hxrMUVEcAMedGQQfCpwSJAoDcD5RggxeCVlGS03gyDsA9GjC/IYko/Jt1akK1/D3utlPErDwIOuNAWZddFfdkOOCrNJU3Uak7lJi+rFA12cGKLQH0n/EMvjny+se9dVttFRV1hFfySLxW2qTfWFsKmmpPuE2keIdhAn8xLrQuERgCBWZ42HRBWgz3+r9JO65f8fVk0mV2G6DTzPWmilOx4dJYzn9qCDmLG4NpCba8pCMo/zz9kDdhaAG7qDdeMU3wE5j2rZBsi37PKCsNvcJq4We+r0aOJrUZqfF0iI9flGQLR4rAI2Rcg907JBni+LEyOZ2rGEM/3i/4HkrrlnYBSKsoRkhDBYwSyoRTTD6YkAtB0Hem6Amn0C/c66TCd6E9PsC8YRnNbTo5CbA++Tl/mK1L3T2fXm8MtMxCKgyeMkIxXSEKpRfK1vl3H/NDYau1FSj2ORg5uPf6nrRZeJolcM35iexL9glxYOrb+isiwoaVPNo8
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(7416014)(23010399003)(921020)(38350700014)(22082099003)(18002099003)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?hLvSxgcTuHBA4M15mKM8EIKjJzBqYUWFm/jRGWausQ75OAEKghmTLdPD8ZST?=
 =?us-ascii?Q?P0hKtWz6fO/e0b5OZIPXAqmvBqdpX3jbLo1pJuJ0lMYib0XkYGuFYYAgIEp8?=
 =?us-ascii?Q?NYPTjgVNQMRGzj+t7vlumtEY7iEZyBK4XIUGX1jYIUKrsF2fGXiflRr8DuXR?=
 =?us-ascii?Q?njMgigpB+fomFdAPsUFkiFMihc//XijIyK3vVr3Dj0Yb0RR1ue8/EBndwgjZ?=
 =?us-ascii?Q?GUr/wcSTksbsVJjB5dh9Wzo1LRQO8xV6fSELNMrZeYrlre7BbroOj7rgOHyF?=
 =?us-ascii?Q?g2cHvjF0WOwaZjRaZB/9jrNEfLFmZlKtpP+wfVNDpXIPnDZSH80Hr2BfzsFT?=
 =?us-ascii?Q?XKYfbQyxjghTCqyd4A0KOxpd4uyAIMz6Mcgqz/LTHTgmNOAgeKTijKZf6tYD?=
 =?us-ascii?Q?fXt+5uvZDrtzMVeOHfG9Vvocfv1PHmZ7Yr4qv9yaOePGMCyqMghTWCfObZt4?=
 =?us-ascii?Q?REZqnb8ni5uBGDdOSHnem4Qb6KtdyGnTvDeJq7aNwp7a6nKWJklflUFCFv2W?=
 =?us-ascii?Q?jjX/+1303mcRxQj3flU9HsTD/6ygla7EbylUhfnPSB35mguyyDis+RWs7Iok?=
 =?us-ascii?Q?oThJATO+hX8inwiOS9NN2ZkPaqCDaLY7yRMIpVuJtbgHCt8WWormuvUFQd2/?=
 =?us-ascii?Q?fVCkFpJP3iJwhfGLsUXi3Z+Y9vqJQ2TbtLiQK18p75Z/xbyRrxeGADEaaBLJ?=
 =?us-ascii?Q?BjwQPs4qWECc8xJFvg1itKHbZfEvTjroYW1Sm4sDHmLqau8UqjepicAv12Km?=
 =?us-ascii?Q?e6Xg3n1/9oHyS8UPlXFo531OVlgRvlH6GNb29TaPtyb0RIRgTvgr9iX5WGBc?=
 =?us-ascii?Q?uvJ8qhBGFktwD0KYNnsaIG7DlQFkEmYjccY9k2Hf6B+gqmcLV9fCEl+DcF8i?=
 =?us-ascii?Q?FaREfYJpNwnvMUIDcfJrQjizLZe8PhOn1o5fo7GRjZ5uqxRrVLiNHsuHMZVz?=
 =?us-ascii?Q?Czj4OVdKOngFIANg0o1/GAIuO/L28gfamk/j/4XRvJiIzP8YMuFFJ2+0X/8E?=
 =?us-ascii?Q?q72oJ/vjtUz19bBC7CqJwKyrtn91aXOAo53nNMV8FGpQ1t+3XznFWoVg64QC?=
 =?us-ascii?Q?VvW8F9sJeEJi0vianHspH7zPHSbKOpTIb5RbB7JzmzPIYbXcQOeYsEiLbdkD?=
 =?us-ascii?Q?xowoOq2OJ8WzjLam3lWsPQ46bWGxGZ5fneHti2keYgZJfmh3CHWcFNr4ovfy?=
 =?us-ascii?Q?J0tt/YNhVX8t8eEzvvKWdLSib2ljY1IHtRiF8rDPEa8PQCry4SzCiOYAESc2?=
 =?us-ascii?Q?AaJxuC/YVmTOGwy2zmATld5GM5eMRjA+lF4TQ5YoB+YqM46fo6MhDTe8YQnb?=
 =?us-ascii?Q?zVCfzAj2ZllXuICa11ALyoJgxESy/H59EnMgdv9w4iA/7N8gXEnbX//CdLYG?=
 =?us-ascii?Q?l7lnLNwUXXK1eo+JALnsgfLyovQCiYqCj7uTr7qBJ+f1fdO9UpqFNgW9OIug?=
 =?us-ascii?Q?mYKIO10M8zNoaGt4aoldjuc1CJK3p99j6aTNty7xbGk/18env30SGBRQMbFy?=
 =?us-ascii?Q?6yLio9exrFWGNeu9gBUxqMuXZZI73CeFAaL9uGAPz1axJn5K2Peu2LLMMQEB?=
 =?us-ascii?Q?OT9TDzVf6d1E45zhb/FgVDqANcktYa6VFWHMCbOxQR6J/2iPLCI+eedxE75B?=
 =?us-ascii?Q?n5gKCL5ajDQUgNQxwAqCWJR9mqSXNy7C641zTY6gpWzPlnIdJrZXOouCv89b?=
 =?us-ascii?Q?8kIySeaTHq0oV7SoX2kcjLrIJ/QsiQW97PbjcMsZM6AYmoLVjFt77dOUhVPe?=
 =?us-ascii?Q?y5FGK1DBPbWcpGAKgqZfyA71wXMAXDc=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: b52a3b19-2ea8-4076-f522-08def2421c54
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 16:04:49.1584
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zZR0kVq+fHhtwT9kHfd9dKdO4WdHb03fI1KjCtovP8+EMGBEnSRbh7HnJroYk8KjpGBVunoM/6cw8MVzjw79UF+TZTmxu5MzzmDDVDXlCHI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5761

From: Daniel Schwierzeck <daniel.schwierzeck@gmail.com>

On AN7583 both I2C busses have a pin sharing with GPIO. Also the pin mux
setting is done in REG_GPIO_PON_MODE instead of REG_GPIO_2ND_I2C_MODE.

Add dedicated I2C pin groups and function groups for AN7583. The new
groups must support i2c0 and i2c1.

Signed-off-by: Daniel Schwierzeck <daniel.schwierzeck@gmail.com>
---
 drivers/pinctrl/airoha/pinctrl-airoha.c | 25 ++++++++++++++++++++++++-
 1 file changed, 24 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/airoha/pinctrl-airoha.c b/drivers/pinctrl/airoha/pinctrl-airoha.c
index db6644bcd3aba..ff77a7832d11b 100644
--- a/drivers/pinctrl/airoha/pinctrl-airoha.c
+++ b/drivers/pinctrl/airoha/pinctrl-airoha.c
@@ -896,6 +896,7 @@ static const char *const uart_groups[] = { "uart2", "uart2_cts_rts", "hsuart",
 					   "hsuart_cts_rts", "uart4",
 					   "uart5" };
 static const char *const i2c_groups[] = { "i2c1" };
+static const char *const an7583_i2c_groups[] = { "i2c0", "i2c1" };
 static const char *const jtag_groups[] = { "jtag_udi", "jtag_dfd" };
 static const char *const pcm_groups[] = { "pcm1", "pcm2" };
 static const char *const spi_groups[] = { "spi_quad", "spi_cs1" };
@@ -1165,6 +1166,28 @@ static const struct airoha_pinctrl_func_group i2c_func_group[] = {
 	},
 };
 
+static const struct airoha_pinctrl_func_group an7583_i2c_func_group[] = {
+	{
+		.name = "i2c0",
+		.regmap[0] = {
+			AIROHA_FUNC_MUX,
+			REG_GPIO_PON_MODE,
+			AN7583_I2C0_SCL_GPIO_MODE_MASK | AN7583_I2C0_SDA_GPIO_MODE_MASK,
+			0
+		},
+		.regmap_size = 1,
+	}, {
+		.name = "i2c1",
+		.regmap[0] = {
+			AIROHA_FUNC_MUX,
+			REG_GPIO_PON_MODE,
+			AN7583_I2C1_SCL_GPIO_MODE_MASK | AN7583_I2C1_SDA_GPIO_MODE_MASK,
+			0
+		},
+		.regmap_size = 1,
+	},
+};
+
 static const struct airoha_pinctrl_func_group jtag_func_group[] = {
 	{
 		.name = "jtag_udi",
@@ -1966,7 +1989,7 @@ static const struct airoha_pinctrl_func an7583_pinctrl_funcs[] = {
 	PINCTRL_FUNC_DESC("sipo", sipo),
 	PINCTRL_FUNC_DESC("mdio", an7583_mdio),
 	PINCTRL_FUNC_DESC("uart", uart),
-	PINCTRL_FUNC_DESC("i2c", i2c),
+	PINCTRL_FUNC_DESC("i2c", an7583_i2c),
 	PINCTRL_FUNC_DESC("jtag", jtag),
 	PINCTRL_FUNC_DESC("pcm", pcm),
 	PINCTRL_FUNC_DESC("spi", spi),
-- 
2.53.0

