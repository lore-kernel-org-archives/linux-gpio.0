Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010060.outbound.protection.outlook.com [52.101.69.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5BDB4343EC;
	Sun, 11 Oct 2026 11:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791719694; cv=fail; b=jUoIckyLaOEjxtyfJaN8iPxQtG08o0WtezuJT1CorfAse8sInhDHkXN/8rQvgpVmTZtMA/IEL1t/Es6CZoqWn8ngrh9EwCDl0Ai43ggqn08ByvK54PSGO12Cl6ocX8tEkOW0yuzch8StNCS8cIGitTY0qfrygzj0lDhbje/hvXo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791719694; c=relaxed/simple;
	bh=nhwTtQ/FOQczLELw2m9IA0iXsPZAvAFkXMEhUkGFE3w=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=NxsSR8p8iUkmK30QX0glP/M22W3naEOFYxJSUlzN5j6MItRacp4o3oKD1gE/V57QIIvDYTd60wvCy6pP9xvlqKAtFit/zksjAB3AjYFA6jywzbQQjSBCbO4ikYJvNdmvby4fnb+hbqpLuR5oKlzYBhB981474eyBorG2cp6nh38=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=aUCOqm+W; arc=fail smtp.client-ip=52.101.69.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="aUCOqm+W"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YGYjwFNwuC0ubSXTucB8dJ8EvaZVivdO+O8mXCOo5sHZxdvSsKIgZSjukZjQHolM8u/cI7cinlMI/6bhBGriYvEQXWEikTJSu4nMogm+3LA8YEOJWCuK6rSgbOkDaBazgcHmYPDAErzVMTyUrZa924Chenjpp5KgsElnMnaged3cklrJEImpZxAxc3Euygr/OE4yYmYHk/e8KmekdHwhkvRsguMt/OvQHnKMqmUn1nrbRLQYeTFzBXBDY8ULUGNkJEmk0Q8AExYsP7gl38M9AH6Wn53hjftH+diiRg3YAyv6/Cc7RU/eVwfeO0uTf5vZbkDH0kE/s5v2s8BW1TJoFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1280nac68NhHDZ7qYrcv7bRsQghdod21/gN+E+YZ9vQ=;
 b=SM9F8uJoBOfZbbdoShQp1W9/tvE38CSpD4f1Vi0ItSUrnugPox9WMLlDrrA9E4QCceAKYDJ0VsrqaLcf9ku4yIjkwZwIo948pa1tgdZWA1T6StA/IGLZBwhcdCDqzoq5uc3vOqKDdL0aCnIql1RK1i4uosApM76tfp/OpXgo/IuSdxVAxAIt07YMeSvKmP+6XkUQCA2rcyjUUlMm/9IObUldA3V0fZsUIygiFoeo0baGsuLt0sxAEBHmVucICtR0uwxHZZSi8d14MlvI0BNKUYaoyyA/aLQn/fOmn4wi5NuH7NwktsHUb8JYrejqC5I+HevYqdHJLdOILuQeIhHUxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1280nac68NhHDZ7qYrcv7bRsQghdod21/gN+E+YZ9vQ=;
 b=aUCOqm+WxhHHZPhGPH5Zb2JiTEEz6jE5tuwbwPtLTAKWXbcDFRAxwQZVyRtY3jV3rzocg4ebRXgStaCtBW2IuAAlJfl1/wz1y0x0tZyb/rMaaClhaA8Hdc75ydUAF6Jli/+BYTxzhxLCeX7PNsDt2hOX/hYNYtg1l97z+j0um1RwipnnQ1vmxtQJlljDHw55TYU/ktyOXtwgIWYeMLfSbKQgba07idXlEPIvWL16rQxCWaRmRjr6vVxm/KLKIPqivaOnfBWQI4sIzJ4jJ2iw83iEIl804CCGjp2zd3Xn3fyz3qpS+gzewNSgo/a2XGUN3+if2tDQkDv5MgRRISkJ/w==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by PAXPR04MB8389.eurprd04.prod.outlook.com (2603:10a6:102:1bf::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.20; Sun, 11 Oct
 2026 11:54:33 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0496.019; Sun, 11 Oct 2026
 11:54:33 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Sun, 11 Oct 2026 19:51:27 +0800
Subject: [PATCH v6 06/13] gpio: mxc: replace of_device_is_compatible() with
 hwdata flags
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261011-gpio-mxc-cleanup-v6-6-cb47ce2ad758@nxp.com>
References: <20261011-gpio-mxc-cleanup-v6-0-cb47ce2ad758@nxp.com>
In-Reply-To: <20261011-gpio-mxc-cleanup-v6-0-cb47ce2ad758@nxp.com>
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
X-ClientProxiedBy: SGAP274CA0020.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b6::32)
 To AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|PAXPR04MB8389:EE_
X-MS-Office365-Filtering-Correlation-Id: b2461a45-ff22-407a-642a-08df278e6a3a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|19092799006|366016|1800799024|23010399003|11063799006|56012099006|18002099003|22082099003|261009223027099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	dDY5ToKUD5Nj8+M5D3rFoQW8pl8AiP5GWn6Y2gaumxjnF35Jm3aSRjjU8dhbAm1XHj2XkF/JrsFems4yNAdPs6mLQ4mHxbAz3OVnG43Etb5I4cgh2LG1WTd07bWzWn2BHMTxo9awS3QNOaYYOKdgwEyhfhJN/V73HFoXqsD/V+vAjigBYNuKNuZbpRIy5Z094xTcqf04w1N3Q4ymyiPmUGgEb7e1y/F9p3+rhGDRz6WrCBtbxwQgIQJ5Im3+veLOhONq4padhcaBQyKk98VNdDaCPfqA0WWe22ARyPLDf3AH5b/xnY5KQMtuhKD/Y1VqSKKsdihHxzSO769UQekVdprePSkxKnwXtU9e/v2613hizK7l/k9Ce631uS5lUZod8/69+jVuXFEoj80ELD5DtGsMPtIL2ACExBn/+cW7JiyznK9hPoAXuzQtcmoZJ0NDVk+NkpvkOsi0QR7XGjQBQOa3DvYe4kRbLMDA4XZL+YwnqGfEwKyQtKT1nBIFfkfrNYjfExolRdjpWl1E7oRamOJB+tJxe+cZrQNpj4B16pFeKgJQMrP6x10Le0PHi2t0izSVWOhmJV5gG4Op5dNv6JIPMZMJI0K6v5mGb1QR3r8VsxC0k1pS74yGY3Q7d4G7zXrWX4f7JQUROdmgD8437Hl0GRrOVpXKBNQ03q016Ec=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(19092799006)(366016)(1800799024)(23010399003)(11063799006)(56012099006)(18002099003)(22082099003)(261009223027099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K2ZwdmZrWVJqbTNEUlZBeGpnd1Rtdmt2QzdxblZjTzJYS2dHQ053REU5RFJy?=
 =?utf-8?B?NFVrazVmdjdwSTRzdTU2K3VVdVUyRFRVWXRkaUpLTWZEQmd1QzB6aWZFRnhW?=
 =?utf-8?B?UEhFS2hhb1lWVXNIaXMyM1BySFJQT0VreHk1b3JsS3pOb0dOVHpVMmlvKy9F?=
 =?utf-8?B?a2FkWjBJU0IzREZXQ1RDcDJNUW1qbUdPeFRNL3Fmb3N0OGZ6V2wvRVQ2QTJw?=
 =?utf-8?B?TmRCdGtUWDIrMHVIdW8yb1QyS3Z2V1JyUEI1MVNOeTZQYWJLb2FXbDVXZEl3?=
 =?utf-8?B?eDZmTjlrOGU0S25rNXBkVjZGTS8vZ1FtWVFpN0l6WFJXTzY1ZEpHV2xqV0FT?=
 =?utf-8?B?SHdZbEFmamhyTWo4SGduM2p5Nkk5NFpFS0JXQWpsaGQzeGh1KzFIZ0JDWG1p?=
 =?utf-8?B?b0ZxYTd5ZGxCT2g5UWdSRjdrNmRJZVg1U0FXZ2lDNy9RdmRjQkJ3ZmVlNFkw?=
 =?utf-8?B?ellBSm5zdDJHR3ZxelZqNExXWEtoV2VZWWVlZDYrU251UWFiUzJ3SWY0bDJ3?=
 =?utf-8?B?VWlEQVlwcUIweVRiYmIyS2lFdmp3UUhKVkxndnpjb2dmSk1HTmkrempKd1Zu?=
 =?utf-8?B?TG8yaTJ5Njd2OHlLQWJGTmVpRXVTMmMydGZUMFF4YzVzZDZPRDlUc1BrYVBH?=
 =?utf-8?B?NzZLQ1lwYk9STGpqTHkxWWhPTk4vcmJZSFc4Rnd3VjExR3NTVk5yMEhOUWIz?=
 =?utf-8?B?RVczc3NBY0lSY3dabVhBNjZLYUFuL0pVbDVwOFpnbkV0ek1PUjROSGhNYWZo?=
 =?utf-8?B?K05lc3RzQjkvZXNTcVpxcytiZy9hc3I4Uk1GSUV2L0xvWFQ1N1AwYjQ2clJr?=
 =?utf-8?B?RHgyYXNjbTJNMGNyVmpJVUtIbFRMZXRHcWVhU21NU2J0c3pVWGhhT2ZpZTdL?=
 =?utf-8?B?cUtpTGtjV3o0ckZ3Q0VndTM0d215MTBSQ2U4KzhFdkNURjBHRERsNnRVWkFt?=
 =?utf-8?B?WnhrSDI0bWZtZ1lXNzk1VkZib0FkR04xMDBveFgzdzlWNXd6cnBCa3RCd2Q4?=
 =?utf-8?B?OFpEOEl3TUpnYWpNS2IvVG16cDF1aGhkT3ZGQlJiV0JWdVE4MTQ3TmQ2OWpa?=
 =?utf-8?B?bGpBL0xsVkNxbzNQaTdNT3RyYzNGelpKdmlWVVZsMUFJSWhIRWxLWGNQQWRO?=
 =?utf-8?B?aUxaT2ZEUytoU1BSeFpGdGRFaER6bWNpRGxraGlPZlVRV05icjMyZS9EMnFQ?=
 =?utf-8?B?WjEwRUU1LzM1Mmd4WHZqQzZzbThSamNHOWVnbVBteWhsTEdzVDlhcDBGd3Ur?=
 =?utf-8?B?d2U0SllDUnhwbXZQUjg4czRtN0pXNzJNSjMvMG45QTdHUUtCc3ZtOFJtK3Rn?=
 =?utf-8?B?czZzV2lVN0dhM016N3FpR0NJWUwzTkV5WndCaHVOU2QzYVRkYmpSSUtEd0Vs?=
 =?utf-8?B?VmdqM3cvNS9vSkQ1UkZRL0Rvam5SUUdwaFpEUko2aEZaUElVbzJUczYvUSta?=
 =?utf-8?B?bm9wUGZISUNJTkxuOVROc0luRjVUd3c0eU5uRk9uazBxQmlRZ2RXOHpCVEFz?=
 =?utf-8?B?allSRm1ITzFnWEUwb1p4eThmeVIxN0xZZ3BjcHAwcktvS0FNVUd0THhwZ3Vl?=
 =?utf-8?B?YWtJeXJQMWdOQ3RjZ0FBaXdDa29zeSs0WUxMVURrQ2lSUGQxUWxka0tTdXFy?=
 =?utf-8?B?aFBBbTFBQU1MN0Q4cjNucHVBREpPeUdmRHNkb3p1UHJHYVByN1RVOFZJSFps?=
 =?utf-8?B?eTU5akdrYzZPU1RuMmoyTkFtWWt3TlZ6T2ZxZW43YVY3a1dRU1c3bERLbDFp?=
 =?utf-8?B?YUhNUWt3bElRRlhzY1BOL3JXZWVZUXpUZ1hFemZ5Qkl4UXowa2FOYm1MT0lI?=
 =?utf-8?B?ZCtYenVHUVJjZ3QwTEtBelYwWHNEWXloVStKQUZicC9jVS8zcE5vMjN6Y0pH?=
 =?utf-8?B?eDFnclVVeFN5NXNPeWo2OUptOTRXQi92bFlrd29nRGlibCtCek5OaTV1eENV?=
 =?utf-8?B?bEJUMm51bHNCZXBKMzJSUWw2Mkk5b3lHVS94bldSaWhOdmdDUVFXTVpSMFlI?=
 =?utf-8?B?RTgyR2szUzlxSDZaMVJiR1ZVak1GSGJKUjZKeVFwZGxPbDBUV3N3WjVMTkZq?=
 =?utf-8?B?dlhEenZScG85S21acDN3QkVyWkM4MEhHOHU2ejQxZkY0dkFzZnRqQmprYkl5?=
 =?utf-8?B?dSt1cG5GcjdpbnNaM1VHQ3F1a3o5WExYRFFJN2tIR0ZBbytTRWtOY0hKOWQr?=
 =?utf-8?B?NDBMeVhsQkd5T1p1UHlkMmNITHAyTndodEJFSHdRblJUUHZmOWpIR3RyTUJq?=
 =?utf-8?B?cVhoNlFVZ2dUdnRGb2duOGNkM3Bhb2dUekJEa1FlODhpUmZPT2lNeFZ2dmNt?=
 =?utf-8?B?cG9iRjJsL3l1WUErTnU1Zm5saUQ2L2NhcGpkU0I0ZVRUeWFjYWJubDJlZWZr?=
 =?utf-8?Q?ME9bmD7SWiCueqRjzsFLprqiZUKjVWBRKRg6H?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2461a45-ff22-407a-642a-08df278e6a3a
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2026 11:54:33.3640
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dYu5j/tZGfFHfVKmhro6DuEVuV68AaU1jPGTiMnfE6dpgREHeaO8L46VU11VTKCKoVhUZmMBepeZuYnpHbUa5pH0o43mewsBeacqszKRbFu+aGzslgrUa4p2kTm8KQ/b
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8389

From: Peng Fan <peng.fan@nxp.com>

Replace the runtime of_device_is_compatible() check for "fsl,imx7d-gpio"
with a flags field in mxc_gpio_hwdata to move the power-off capability
from a per-instance bool populated at probe time to static per-compatible
data.

Introduce MXC_GPIO_HAS_POWER_OFF and a dedicated imx7d_gpio_hwdata
instance that carries it, along with a mxc_gpio_has_power_off() helper
that replaces every former port->power_off test.

While at it, factor the register offsets shared by imx35 and imx7d into
a MXC_GPIO_HW_DATA_COMMON macro to avoid duplicating twelve identical
initializers.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/gpio/gpio-mxc.c | 50 ++++++++++++++++++++++++++++++-------------------
 1 file changed, 31 insertions(+), 19 deletions(-)

diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
index 28578028b9ff..1a35b23747b4 100644
--- a/drivers/gpio/gpio-mxc.c
+++ b/drivers/gpio/gpio-mxc.c
@@ -33,6 +33,8 @@
 #define IMX_SCU_WAKEUP_RISE_EDGE	6
 #define IMX_SCU_WAKEUP_HIGH_LVL		7
 
+#define MXC_GPIO_HAS_POWER_OFF		BIT(0)
+
 /* device type dependent stuff */
 struct mxc_gpio_hwdata {
 	unsigned dr_reg;
@@ -47,6 +49,7 @@ struct mxc_gpio_hwdata {
 	unsigned high_level;
 	unsigned rise_edge;
 	unsigned fall_edge;
+	unsigned int flags;
 };
 
 struct mxc_gpio_reg_saved {
@@ -70,13 +73,26 @@ struct mxc_gpio_port {
 	struct device *dev;
 	unsigned long both_edges;
 	struct mxc_gpio_reg_saved gpio_saved_reg;
-	bool power_off;
 	bool is_pad_wakeup;
 	unsigned long wakeup_pads;
 	u32 pad_type[32];
 	const struct mxc_gpio_hwdata *hwdata;
 };
 
+#define MXC_GPIO_HW_DATA_COMMON	\
+	.dr_reg		= 0x00,	\
+	.gdir_reg	= 0x04,	\
+	.psr_reg	= 0x08,	\
+	.icr1_reg	= 0x0c,	\
+	.icr2_reg	= 0x10,	\
+	.imr_reg	= 0x14,	\
+	.isr_reg	= 0x18,	\
+	.edge_sel_reg	= 0x1c,	\
+	.low_level	= 0x00,	\
+	.high_level	= 0x01,	\
+	.rise_edge	= 0x02,	\
+	.fall_edge	= 0x03
+
 static struct mxc_gpio_hwdata imx1_imx21_gpio_hwdata = {
 	.dr_reg		= 0x1c,
 	.gdir_reg	= 0x00,
@@ -108,20 +124,19 @@ static struct mxc_gpio_hwdata imx31_gpio_hwdata = {
 };
 
 static struct mxc_gpio_hwdata imx35_gpio_hwdata = {
-	.dr_reg		= 0x00,
-	.gdir_reg	= 0x04,
-	.psr_reg	= 0x08,
-	.icr1_reg	= 0x0c,
-	.icr2_reg	= 0x10,
-	.imr_reg	= 0x14,
-	.isr_reg	= 0x18,
-	.edge_sel_reg	= 0x1c,
-	.low_level	= 0x00,
-	.high_level	= 0x01,
-	.rise_edge	= 0x02,
-	.fall_edge	= 0x03,
+	MXC_GPIO_HW_DATA_COMMON,
+};
+
+static struct mxc_gpio_hwdata imx7d_gpio_hwdata = {
+	MXC_GPIO_HW_DATA_COMMON,
+	.flags = MXC_GPIO_HAS_POWER_OFF,
 };
 
+static inline bool mxc_gpio_has_power_off(struct mxc_gpio_port *port)
+{
+	return port->hwdata->flags & MXC_GPIO_HAS_POWER_OFF;
+}
+
 #define GPIO_DR			(port->hwdata->dr_reg)
 #define GPIO_GDIR		(port->hwdata->gdir_reg)
 #define GPIO_PSR		(port->hwdata->psr_reg)
@@ -142,7 +157,7 @@ static const struct of_device_id mxc_gpio_dt_ids[] = {
 	{ .compatible = "fsl,imx21-gpio", .data = &imx1_imx21_gpio_hwdata },
 	{ .compatible = "fsl,imx31-gpio", .data = &imx31_gpio_hwdata },
 	{ .compatible = "fsl,imx35-gpio", .data = &imx35_gpio_hwdata },
-	{ .compatible = "fsl,imx7d-gpio", .data = &imx35_gpio_hwdata },
+	{ .compatible = "fsl,imx7d-gpio", .data = &imx7d_gpio_hwdata },
 	{ .compatible = "fsl,imx8dxl-gpio", .data = &imx35_gpio_hwdata },
 	{ .compatible = "fsl,imx8qm-gpio", .data = &imx35_gpio_hwdata },
 	{ .compatible = "fsl,imx8qxp-gpio", .data = &imx35_gpio_hwdata },
@@ -447,9 +462,6 @@ static int mxc_gpio_probe(struct platform_device *pdev)
 	if (IS_ERR(port->clk))
 		return PTR_ERR(port->clk);
 
-	if (of_device_is_compatible(np, "fsl,imx7d-gpio"))
-		port->power_off = true;
-
 	pm_runtime_get_noresume(&pdev->dev);
 	pm_runtime_set_active(&pdev->dev);
 	pm_runtime_enable(&pdev->dev);
@@ -536,7 +548,7 @@ static int mxc_gpio_probe(struct platform_device *pdev)
 
 static void mxc_gpio_save_regs(struct mxc_gpio_port *port)
 {
-	if (!port->power_off)
+	if (!mxc_gpio_has_power_off(port))
 		return;
 
 	port->gpio_saved_reg.icr1 = readl(port->base + GPIO_ICR1);
@@ -549,7 +561,7 @@ static void mxc_gpio_save_regs(struct mxc_gpio_port *port)
 
 static void mxc_gpio_restore_regs(struct mxc_gpio_port *port)
 {
-	if (!port->power_off)
+	if (!mxc_gpio_has_power_off(port))
 		return;
 
 	writel(port->gpio_saved_reg.icr1, port->base + GPIO_ICR1);

-- 
2.51.0

