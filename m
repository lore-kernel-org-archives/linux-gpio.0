Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013054.outbound.protection.outlook.com [40.107.162.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2A3B4A2A7D;
	Mon,  5 Oct 2026 14:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791210288; cv=fail; b=qReFQEH6jPGI6ojC9vWYYbP03vl5DxG9tc9mxAZkIrZKiV6vMunQebfUNzm9bC0CNUFiP/lE0B4OysKVXkQYeig045zIluYSHsgxjabCWbaosKMGjj24G60Aix+waFAijFQJOxQWx5O4V+tJPBL5/0ipYMr0WRClnbTRIzRHSbY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791210288; c=relaxed/simple;
	bh=piEhlNjE9nPqnm0OJcbURMKUkzzUfhDKdc76irfcwdg=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=tExS6907YFMWJe3Oeeeg2+VSGVgm2amhwZgRgOze9MzGNtq1Ls2rUhbzN0RSTsqKW1G3ksOHUPNASzVwdHARQiV9OLl1e3gsfENr+0QZC45FIh1fmNqmdlvx7tFYDwO/AYW9TXtPpzs5vjAi3Bq4oEU/MMwuCbhkRocPS9FZ+4k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=N6tJQpLC; arc=fail smtp.client-ip=40.107.162.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="N6tJQpLC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AoBM4mq2Azj7czrSHWz8dGc/3HafllnKSsJm/O9jDoB7dvVD+yU6YbPb+n0mtwRmJqJH656Y0xRtb8MZGqXWs2Y/ZSRk16DitJMviBLbL4U59gbTegf1IvhUcvQEXDJUvZy9TO4iYLhqXD62whN6gz6mlJQl+i/g+4tQWtDUeoQ0EN3gdf6SIwr1Njlh7A+LwF2RU33rz6X4wdr3tuAm9jmSNDWUKeSjAoto8SkjPY4NK58LI8imAU35WPbd8Lc1FNfGpighqU5KUqXSPyrXpGqme8sfxQQ3um6jiBa2GR6jguu98l+U8r3OUQR0xscGVtQOC3ekUHZX4WYwJLuGjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X7+kEYLjZj3kFP5TrCIWr1sXoAmtaqkd+3y4t354s6I=;
 b=NFyU55wITnnNCmhd8R4Qek7rrpYDmuy1kXxNtCpxI611dd4/+yUmdHAlfhQRUGcHCc1NFCQnxhr97bJ52fIeCDYx3uV/TD+faCOlVJ8Fi+vWKduOgeWtJB5ZF3cDvZazBnbA5oB/d1F953gMjlZyCjisYmOpSCh2PHtUsmIJwIdNQW8lEN74pqRKY0LlBdvJIgs2rzxDLHoczVQqtx+e0Qr1D8iouqUKrr6Vc+zjb86NrUVCZYeMl0nckU1zt7Edh75s8ef2101F82XNefRdXLVztWtoKh1lLlvezroI8z4yJFjJRVn3XTnb3p4CMw3ydGe6FLGbHNBJAPC6/OKffA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X7+kEYLjZj3kFP5TrCIWr1sXoAmtaqkd+3y4t354s6I=;
 b=N6tJQpLCJ+L3ECycFd8Wsj69WFmBfTgIiwApvy0zG8QSO4DFjVN7euXxmfX8D8jnmUR45FMXCkh1Bop7RzFXwOFHV2DqrHmHfkz8sl2802TCUBlzbcsjp0x6oNQuLeOAWTW6M6r4v0nSjQPYiumJ6R1kTdAEMbc8J0+ngRTQoHNvAiunARMTYTuO7FpMsCN9J8LqlE2C+Xpah1SnQyboyA/VHApchY0DJNizr5KuqAuGIWr/X1VJo934dxlGQADiLSwj3Qa3M0ee/UrhtlqymcWBNxMMsGD6ZSz09FuMauWpJmiMK75vhUd0fUOHH9A/CFfZY233s9cf8mTD6sbH+A==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by GV1PR04MB9198.eurprd04.prod.outlook.com (2603:10a6:150:29::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Mon, 5 Oct
 2026 14:24:29 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0451.022; Mon, 5 Oct 2026
 14:24:29 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Mon, 05 Oct 2026 22:21:25 +0800
Subject: [PATCH v2 4/9] gpio: mxc: convert pad wakeup compatible checks to
 hwdata flags
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-gpio-mxc-cleanup-v2-4-bdc3afbb35e2@nxp.com>
References: <20261005-gpio-mxc-cleanup-v2-0-bdc3afbb35e2@nxp.com>
In-Reply-To: <20261005-gpio-mxc-cleanup-v2-0-bdc3afbb35e2@nxp.com>
To: Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Shenwei Wang <shenwei.wang@nxp.com>, 
 Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: linux-gpio@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: SI2PR06CA0018.apcprd06.prod.outlook.com
 (2603:1096:4:186::8) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|GV1PR04MB9198:EE_
X-MS-Office365-Filtering-Correlation-Id: 438ae632-a58c-4f2c-6b3b-08df22ec5e04
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|7416014|376014|19092799006|56012099006|11063799006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	xO9xrCSuWzPzkWZJg3pBNTa1RjZkdT48kWRfSm6BGpNtmSSYWADjqTLz/V1/Mx/XIT8eNgRgEK/N6PmXeFU2hmr8lfIZ7dJtv0tIIWwPMyoOHhZjRRGOAN9RcSU22CtZ+dmaMir0UTZFaY5rTH4Xls9Cq4bZpEEBKP9lRKLPMJp4ZzF2roiRhfR0LqFPznDop1UBzfqDCzatq0kvgB9aLyOs68CJp5sSlVdU1Wd/OG3PazdArR2M/QCVsnhBNdQZsEtHIgv8A3nFT9kX4SWsz5VCUskKvUuirBA0dsLydQcQ9rynGkcV5g09+poK2QAvEkwbhOfj0JzYTbQGTp+Q+1C5O6tD0sVqqKDAdsZwEs8KTVLyqt4D0T3+OBNDrc43QVJXRmWQxiDjInH61bOyC+NINBYXekgF531n5Dzb7XVvZkZYE757kYFQPHGKWU7yatao5Va6dvXT7ZtKlFNiz4NDr9Wini3kZe7E8TYddB0pMgJg99YbN6nTwVyPuqo3ugtaM/lLK7X4eXHGDfrB5Bu65i/wvuSYN8eeh9X/ZA4hGY+dpwYft9dpcviG2X1U3PWFMOIdlGuz2WLmdsntcaclzeLeCX3zlNiHbmu/HkYweYattStAbNEcUmf6wuytLBVX13fkHufStnujqPv3egmNdSY69C/pS5Vcfb7yPLs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(7416014)(376014)(19092799006)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cEd5SkxQLzhSQ3pYUHc0Mk5UU01rNEIwSGZBMmN1dGE1NU1CZWZZdDNUZGxU?=
 =?utf-8?B?SE5oVjFaNS93YWxoQ0k5cWxoa2Z0N0V0VVhXNU05NzdWK2NyR2IwUzBLTlds?=
 =?utf-8?B?R2JkUlMyc21ETlBTL0VBRlM3ak5ZMzAreVA4SU5OUnh1ZCtEZEljbTNwZFNX?=
 =?utf-8?B?REd2OFI3ZlIwSU1LZGZDZ3BaVlNsTW9yRE40Z2pKbzI3ckdSTk1zNm5FV2ZC?=
 =?utf-8?B?djg0RitjaXNJaHNYUzJLV3ltQmxWSk9aRzBsRUxVNE0xY0RVVHk1NC9tVUx5?=
 =?utf-8?B?N0EwemtKYWYxT0djcC9CVDl3MWVldDEyQmN1dzlHWTBQWWt5bzk4NnFvUmpM?=
 =?utf-8?B?YmJYcExtN3VwNnArTTdLSmRpSkE1ek5BcWdRSUZDOGtBQ0ZrZ3Yzd1NURVNE?=
 =?utf-8?B?cmZya0R5U251YmllZWJpV2ltaWcxYWdTNCtYbHdxOHlTMXk5UFVuK0lZV05U?=
 =?utf-8?B?SnNqTlVEUzE5R3Z6WWlKNUFENkxQbFk1bEV4Z3ZSbWdDVURzVXQxNXZSWEE1?=
 =?utf-8?B?aGNJaXE0TmZMNms4TDhaYkZFZm90UGIwMEc5cXdwa0xEa3V5eS9yRjVWNXlF?=
 =?utf-8?B?VTR3T0NvRHZhbGxPQXlDbGtPeUZUOGlHbnR5cjFMV0JGTFJiZnd2UjBrRi9J?=
 =?utf-8?B?OW1XUkY2dnFVNEpZWjhKUVFpYi9jSktpZGg5WkhJNzV6VHQwbEEyWmtrK0E1?=
 =?utf-8?B?Zjk0VG5TaU9oZmVkL24wMTNPZWUyOVZtdUpUYVF4QUl5RlF5YzBhb0FUSXVM?=
 =?utf-8?B?bElwUkV5MkRieHNHT1ZYd0g3cmpMNGluUnhOVDdEandmRE42b1JMRU1HNHhw?=
 =?utf-8?B?TXE5SHVQYlRWUEZPdzIwN0h0TjExaUpBVmtLRHNKWUtEYjN4TCtZbGdrVTk4?=
 =?utf-8?B?d09RYkRFRldRVEhjdDVlMlozMEp4dVZoODI5Q1pXaGJrYmU0QUc1NG84QTVm?=
 =?utf-8?B?MUZQQWpxOXRlYkhOaFBqNEZlN1V6bVE4ZWZxMWJTMElhTTREeE5LVW11NXBW?=
 =?utf-8?B?QjByUFZPVHVvMm0yVGpuSkp4NERNQ1ZPbEVnODFlY05WamxDN01GL1NpYll6?=
 =?utf-8?B?NzFjZnlMa0toaFJBR0NCVnA1MUF0bHFqZGphdXA4NjBybjBTbGFnVS9VdTJF?=
 =?utf-8?B?bHk3Y05STDdjTWl5NGJYV3ZiUGJGV3RFc1N2S1EwTTh1blBucEg1djZVWVpB?=
 =?utf-8?B?UEh2WVBvU2ZvRE9kQ3M0VW5uRWF1WFJDQ002b0xKRnJaNmpoanFkTndFWExo?=
 =?utf-8?B?WmI1NmV1ZFRIKzJZRjJkL3ljSnQrYS85b1NvbFhsNEdFL0g3ZTBqajQ2dW4x?=
 =?utf-8?B?UEdpOUh1cHpxNVVrY2JKbzRheFM3YVJkLzUvQ0RTU25rdCtSbWRZNElkSlpN?=
 =?utf-8?B?bUdzNXREYlRBWmxLZENSS3h3QWl5RUJoWVJoeXNHS0xjdnk5L0ludkpqNmc2?=
 =?utf-8?B?RmRjOFpSRENmeldYWXV6ZmUwWHNUSWtiTmdHVlVla0pQTFdYL1lWdTd1aUNE?=
 =?utf-8?B?d09JWXRxa0pNUUtSMTM3bmxNSkNHdVNJNDdOZk9FR1hHRjQxZVozVFBoMmFO?=
 =?utf-8?B?ZWFocE1BemRXYVNpa1lxRU9uRHFmUEJDanc0SXdxQTBYM3hIYUNCVnU1UXVj?=
 =?utf-8?B?MDlENkpxWis2dVhHNnBPS1FMZ1pkeU1OWk9SWkdZYWxmZG8vZkltSXhmamRy?=
 =?utf-8?B?MU1Ec3lzWjhueEw1eXI1ZHZjTUhrZ3ZFbnFBRHl1TUZlcXlGNy9aWk1aSFpS?=
 =?utf-8?B?c3ZqRmE2T05uTG01RjRFWlFrU04xcVQwcFZXUjVUQWo4STkwVVJTNUw4N01N?=
 =?utf-8?B?VWRlanBTbWdRTjhzSXd0THEwcG1ZUjdkanBoRDFLUVFKVlFpMW1HSkxhdjRP?=
 =?utf-8?B?LzNuZThmb1ljazZiS1Q2VlFQN0Rvay9Md05sWjc3RGQ5VllJNDlHN3hKVGNo?=
 =?utf-8?B?RDBsZ2NZSDRJbTF4ZTlzek1pWVRhN1RXTE1lUk1DMXE3eUlpS3RodnF4Y0lW?=
 =?utf-8?B?VWxZNU0xbm9lY3J5dVpidHRkWnVsRkdMbE1lV3pYRFJjVnZwQVpGWms5R2RE?=
 =?utf-8?B?MFBaTFFGaWFoMEtFSEpNWHFqTm9iWlF0eDBUNlcxQThpSDBYSlRQMjROTHZn?=
 =?utf-8?B?NllJckZXTHZFSVNwL0JTdk5JYjl0dkUwckpBaTgvK2UxeCtCQTRCRDFOVU1z?=
 =?utf-8?B?NURTbkRzMUgydW1OTDJEMFdLSDdXaklWZDc3WSs2cUU5Q0NnblRybkduRldY?=
 =?utf-8?B?SW0yYmVNT0E0RUw3V3RqQ0RrdEExQ0R0WmJIaXZobk9tRDhxeHRPSHpObDBD?=
 =?utf-8?B?eFBZU3lEc2xVNXFnRzJjaXI1RjV0TUpkZmVDTVNveHZSQUMrZzBGVTdITzNt?=
 =?utf-8?Q?5tx/abJqxY3njgyiWMrbj86hNNbQW6zFNy2be?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 438ae632-a58c-4f2c-6b3b-08df22ec5e04
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2026 14:24:29.7682
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dgzdCI9SeTElHwsKKsMo7jYaNndQv3lmgYXMPQa2A1ZAGFzbQlv/XWOX9nB/Q5kr3Myis/YX9ApSOT0JHRYBTjzve3fIiwtlhVhU3LoIC0vVagDezzJQT7HRB6HnILf5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9198

From: Peng Fan <peng.fan@nxp.com>

mxc_gpio_generic_config() and mxc_gpio_set_pad_wakeup() call
of_device_is_compatible() on every invocation to determine pad wakeup
capability and i.MX8QM-specific behavior.  These properties are
invariant for the lifetime of the device.

Extend the hwdata flags scheme introduced in the previous commit with
MXC_GPIO_HAS_PAD_WAKEUP and MXC_GPIO_IS_IMX8QM, adding dedicated
hwdata instances for imx8qm and imx8qxp (also used by imx8dxl).
This replaces the repeated device tree string comparisons in the
suspend/resume path with simple flag tests on static per-compatible
data.

While at it, clean up mxc_gpio_generic_config() to use a local ret
variable for clarity instead of the == 0 comparison.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/gpio/gpio-mxc.c | 46 ++++++++++++++++++++++++++++++++++------------
 1 file changed, 34 insertions(+), 12 deletions(-)

diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
index 5fbbfcebaa8f..1bd9f5beae4a 100644
--- a/drivers/gpio/gpio-mxc.c
+++ b/drivers/gpio/gpio-mxc.c
@@ -34,6 +34,8 @@
 #define IMX_SCU_WAKEUP_HIGH_LVL		7
 
 #define MXC_GPIO_HAS_POWER_OFF		BIT(0)
+#define MXC_GPIO_HAS_PAD_WAKEUP		BIT(1)
+#define MXC_GPIO_IS_IMX8QM		BIT(2)
 
 /* device type dependent stuff */
 struct mxc_gpio_hwdata {
@@ -132,6 +134,26 @@ static struct mxc_gpio_hwdata imx7d_gpio_hwdata = {
 	.flags = MXC_GPIO_HAS_POWER_OFF,
 };
 
+static struct mxc_gpio_hwdata imx8qm_gpio_hwdata = {
+	MXC_GPIO_HW_DATA_COMMON,
+	.flags = MXC_GPIO_IS_IMX8QM | MXC_GPIO_HAS_PAD_WAKEUP,
+};
+
+static struct mxc_gpio_hwdata imx8qxp_gpio_hwdata = {
+	MXC_GPIO_HW_DATA_COMMON,
+	.flags = MXC_GPIO_HAS_PAD_WAKEUP,
+};
+
+static inline bool mxc_gpio_is_imx8qm(struct mxc_gpio_port *port)
+{
+	return port->hwdata->flags & MXC_GPIO_IS_IMX8QM;
+}
+
+static inline bool mxc_gpio_has_pad_wakeup(struct mxc_gpio_port *port)
+{
+	return port->hwdata->flags & MXC_GPIO_HAS_PAD_WAKEUP;
+}
+
 static inline bool mxc_gpio_has_power_off(struct mxc_gpio_port *port)
 {
 	return port->hwdata->flags & MXC_GPIO_HAS_POWER_OFF;
@@ -158,9 +180,9 @@ static const struct of_device_id mxc_gpio_dt_ids[] = {
 	{ .compatible = "fsl,imx31-gpio", .data = &imx31_gpio_hwdata },
 	{ .compatible = "fsl,imx35-gpio", .data = &imx35_gpio_hwdata },
 	{ .compatible = "fsl,imx7d-gpio", .data = &imx7d_gpio_hwdata },
-	{ .compatible = "fsl,imx8dxl-gpio", .data = &imx35_gpio_hwdata },
-	{ .compatible = "fsl,imx8qm-gpio", .data = &imx35_gpio_hwdata },
-	{ .compatible = "fsl,imx8qxp-gpio", .data = &imx35_gpio_hwdata },
+	{ .compatible = "fsl,imx8dxl-gpio", .data = &imx8qxp_gpio_hwdata },
+	{ .compatible = "fsl,imx8qm-gpio", .data = &imx8qm_gpio_hwdata },
+	{ .compatible = "fsl,imx8qxp-gpio", .data = &imx8qxp_gpio_hwdata },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, mxc_gpio_dt_ids);
@@ -576,15 +598,16 @@ static void mxc_gpio_restore_regs(struct mxc_gpio_port *port)
 static bool mxc_gpio_generic_config(struct mxc_gpio_port *port,
 		unsigned int offset, unsigned long conf)
 {
-	struct device_node *np = port->dev->of_node;
+	int ret;
+
+	if (!mxc_gpio_has_pad_wakeup(port))
+		return false;
 
-	if (of_device_is_compatible(np, "fsl,imx8dxl-gpio") ||
-	    of_device_is_compatible(np, "fsl,imx8qxp-gpio") ||
-	    of_device_is_compatible(np, "fsl,imx8qm-gpio"))
-		return (gpiochip_generic_config(&port->gen_gc.gc,
-						offset, conf) == 0);
+	ret = gpiochip_generic_config(&port->gen_gc.gc, offset, conf);
+	if (ret)
+		return false;
 
-	return false;
+	return true;
 }
 
 static bool mxc_gpio_set_pad_wakeup(struct mxc_gpio_port *port, bool enable)
@@ -592,7 +615,6 @@ static bool mxc_gpio_set_pad_wakeup(struct mxc_gpio_port *port, bool enable)
 	unsigned long config;
 	bool ret = false;
 	int i, type;
-	bool is_imx8qm = of_device_is_compatible(port->dev->of_node, "fsl,imx8qm-gpio");
 
 	static const u32 pad_type_map[] = {
 		IMX_SCU_WAKEUP_OFF,		/* 0 */
@@ -613,7 +635,7 @@ static bool mxc_gpio_set_pad_wakeup(struct mxc_gpio_port *port, bool enable)
 		else
 			config = IMX_SCU_WAKEUP_OFF;
 
-		if (is_imx8qm && config == IMX_SCU_WAKEUP_FALL_EDGE) {
+		if (mxc_gpio_is_imx8qm(port) && config == IMX_SCU_WAKEUP_FALL_EDGE) {
 			dev_warn_once(port->dev,
 				      "No falling-edge support for wakeup on i.MX8QM\n");
 			config = IMX_SCU_WAKEUP_OFF;

-- 
2.51.0

