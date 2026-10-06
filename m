Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013035.outbound.protection.outlook.com [40.107.159.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8049841166E;
	Tue,  6 Oct 2026 12:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791290072; cv=fail; b=TJxINtCZUD0IVpcm58U9WhkFl4JWxTnFSNVmrMRcVSbVm7R8zkZv0Vvd8ZxZu1BGHaW1CoTzvPcBOlc2rcJDCz3pJMZNLL0ktovcKahHWO4sFW+sYzSdnnKSvFkF98T4SnS8VBRGCJ4yh844xndseCxyGOKU64QsMrFmqordD2Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791290072; c=relaxed/simple;
	bh=piEhlNjE9nPqnm0OJcbURMKUkzzUfhDKdc76irfcwdg=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=W9mq5awF0S9zT2jqUxmQDFgY73Az+kpJ7Tq2I8u4Dn3bjvhkWC0hhL4C9l460CS9HUjvK2H3+o1ELiQZjjivS4+wusBz2auBhQpOrEn0drOY300llw+wvHKTQRK9aeGQmCCkdrENAGQCu3rNAQgHjAUknIiaPudBoj2gJFxmmbI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=u33M7bXg; arc=fail smtp.client-ip=40.107.159.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="u33M7bXg"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eN6lRwJFU5KDiCBDM94PGXiJ4EdKfCaSrV2yVMJPrKVSjy6/XohW9xESyqOGImDnL2xLrAeMJqyBfVFRSlwPO5LBMxk+C+EiZpkdkboNIjTzeKI2UFDeuHIS46nqJ84kDbDJ3uGUUOXS9Wq58Fpjr6TTTCFVW+tQzNWHh1e1lm2aq2Zz9hMit+QGTyC0NkquTnnZ6gL7Ad9tceBdgkSDQNPndMfNsxABlAMkpySC6Ff7GX1e2VYhFvQqlrfHs6VArAnNR4aG389kl+piGUcY39+/tsifv7E4gL514hgVgASAVCQqTykA/x0s6iugukMyEIN4UzeCDr+8AjqD5qWhgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X7+kEYLjZj3kFP5TrCIWr1sXoAmtaqkd+3y4t354s6I=;
 b=OAantXXWE7MYvc/ZX/d6RfUdGilQYtMsM6UUx6bqzvONJ5sg2uWsQhDCK7iFDErlhsAXU4mi/v89gawu20/TB+sColKXNEC4fCZe0c9vJsdbUMRaFfewybyy4HmcFMmB7NLnjsz1yu/DDOBN47oJqh8BHjbNCWbVJJTs4zwduHLfg7+Ix8gBLP9OELwg417pKT5xu/VCT7XIIrBLnVjp/TTADw8W+GWgQfaXNWhuiwoek+c4Dj/xgSoXoexTZXO8EDyeb5valkt0MRJc9z9+Yd11vRfQk+c1zFP92JRxnKRZzbDrEtSIyBhUJXL/l24Ri55l7NW+peWD6hxuaKVQEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X7+kEYLjZj3kFP5TrCIWr1sXoAmtaqkd+3y4t354s6I=;
 b=u33M7bXgZ8O5gBiXDJ6Y+Wi8fQs/P1IlorgXziu+7HVEqZ9CJSd2NgiVufzYYuRuspA6EmYgKH4z44gaVcHew80EeKPEKLhLaus5MWak28bEMrWjq1MrI6vYP1eJO0yPk7FiG+bUDSl7XXolzAXo3cef6JiY2SMxC+wzJc2IQ8mWf3nxT4chfCpHvYQJGGgi/XgDYXl8ksJWLZiQqXkpaE2zYwI5yMKBU3FBYG5XU6WBT/pf3ykoH+kaqX8rsOp5NsdAD9t05820iEIdb9jnp4L4bgpagpbd8Vlk+Y4+J1VJE/KVwrD2iHEqTbI/T4tc9on4ll8WNW1JHg6dfBLhzQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by FRWPR04MB11246.eurprd04.prod.outlook.com (2603:10a6:d10:171::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Tue, 6 Oct
 2026 12:34:17 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0451.022; Tue, 6 Oct 2026
 12:34:17 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Tue, 06 Oct 2026 20:31:09 +0800
Subject: [PATCH v3 4/9] gpio: mxc: convert pad wakeup compatible checks to
 hwdata flags
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261006-gpio-mxc-cleanup-v3-4-129f93302a90@nxp.com>
References: <20261006-gpio-mxc-cleanup-v3-0-129f93302a90@nxp.com>
In-Reply-To: <20261006-gpio-mxc-cleanup-v3-0-129f93302a90@nxp.com>
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
X-ClientProxiedBy: MA5PR01CA0202.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b0::9) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|FRWPR04MB11246:EE_
X-MS-Office365-Filtering-Correlation-Id: 68e69075-d5d1-4341-e54f-08df23a62346
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|19092799006|366016|7416014|376014|18002099003|22082099003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	6rxivdAr8gg4ZJrhwi3OlzYo6bRZb9X55gJQQOFkHFVBzLZEkaaj23CM7EorcMpC5ydbf+bQKTTSSrSUf+22UfHEeLfow3k3I6AKXSfROTqtAfXZ/gLpbVolZChKVs/PkrCFsTsmvNokztmvFenO+yyu3rO1Bd8pYU3gBW0okPvTIyzRYtzR2Wtiz/6XDp9M6UdA7EWgy2CTHRhMnFZwOxJztTW154h/qhRz5zfpJVczRtFbRlc8R2U1JAuZEy1FOC5ipZ0LY+Kq5GeQqif3NJiqbOdv9vy2N3HVzQjx9fMbuzDt1xCWnhXNyreUKB3+1soNMClWelh/kZYY8UtBFDtF0dY5AHU5RNxSObkTzFHe/G1u6SeY04nEreVp+arPkE1jauKDXBEgw0NU5iQiU0nZwP605i8G7+XcJd7jP6Mbno8sYvFR6HW4Z/ylR7vwgatjyTPm+itCQKeLhwZS37Wlg/ZX3dRW856kZlwAV9oXQr3FI1QIEb7WEI/wN5weEBtVrPH/hL9ZZ9U1mCsrBaYwSK2dLrZcYrXCCISnDTJbzTrEymRoglASA0HixIhzxp6grtMStBq5sIXuhVFU0neBWt6xYuPVRMpeisNri962gacbZAJynNdS5J4eTIAE+hnSYYfENgthWw4ApDGPrsPI24Qop1QyVrg0OQWuGyg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(19092799006)(366016)(7416014)(376014)(18002099003)(22082099003)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Znc3MEZWeWQyZGJVdFo1Q0lrZ2NzVnNML0lJYkQwZ0ZWNmQ3N1dwU0VOZDdi?=
 =?utf-8?B?d0tlZmttbU0zbk9Sb2dyL1Y1by8ySnJyOHhPVThMUG1DbWM5M2xuTWlFbmNi?=
 =?utf-8?B?cStUdVJubk52WXludmNDQ0RRYTJoeUwrZTNGeC9LUkovMXlLcm15Vk01MWVM?=
 =?utf-8?B?UG4yanhtRHVGbld6WXkxdS9vVnBxcndxajhHb1dNR2puNmVVdElHREtkNklu?=
 =?utf-8?B?eXVkejlKalpKMW9CcjBnR0NYcFpDRnpXWWRhVGNRT0luRHJrUUh5UVFmOWxv?=
 =?utf-8?B?a1J3cEl5QkcvOFBBaXdzei8wcUwxQjJPcVBxYjZCNFN1RHpJRE12ZDVlRFJv?=
 =?utf-8?B?cWtkT3hPbGVSNGpQUTdXY2RXOWl1aGFyM2szcFcvNi9YL1lmQmFWcVJEVzVk?=
 =?utf-8?B?b011Ujd4WklLQ3E2bXVxUHJRTjg2NFBScmcyWW9hczZhY0M4REw3aE93RmlW?=
 =?utf-8?B?cXNabUxnMFJXMWEzREw2Nzk3Zk5POVd0aHFVcWVuNTJPTFoxNWVkdDJPcUZr?=
 =?utf-8?B?UjFubkQvK01RTE9KQnE1TEcyekNjbk0xTkR1WkdQVUZzU2J5bkxoMDZkS2V2?=
 =?utf-8?B?YWx5Q2Y5OEF2MzE4Ui9XVkJXVGNDb2VtbHNyTjhlbWJ4SG9GNFFDRnFKa3Fl?=
 =?utf-8?B?eDlLMGxRSHN0aWQwM21Ndk16a1FsODRKVVRyRDNta0RSTnBGTUJhenFFelFq?=
 =?utf-8?B?dzhtWFRsTXkrakFSOGhtNnZQSWFlaERTSnNNWjBjc0Q0aUlNYzI0Vk0vWE9k?=
 =?utf-8?B?aDk1aUM4Rkp3VEhITWttdHZ1MG5NR2MxU0hBTm9GY0dObmR4VEoyNEx2cFJZ?=
 =?utf-8?B?VHJBck1iSmJzMm15SnVKY1VDQXlpN05IdGplaGx3eFV6ODdIbDlxYXZFTlFV?=
 =?utf-8?B?Yi93WkpONVlISHAxMUM0YWJqcm9SbWV5TjlNK2FHVjJZekFTbzgyVWV6eEZv?=
 =?utf-8?B?elBqQ0hWdzkrN2hYd011RlA1U0NZSCsrN0NScklUUWpNU1dqZ243NkoyS0dD?=
 =?utf-8?B?NmhsdmZCdXhIQzN5UlF0eVUzL3NuRnZ2YTg0MmdXUXdMK3BabXlRWTYzNXV3?=
 =?utf-8?B?QkNydEpwTDR2NzhZM3NBSVlEdXVoV0xkb2JsQjkrc3ZGYUlMZjQ3WHNHOEZj?=
 =?utf-8?B?S1RhOG5IajRxMS9KUDdsNEtybHFubWxqRGVmSUFLNXZyd1Z3ZWlTMFBzUHRm?=
 =?utf-8?B?UUtsSERyWHJXZzRTZ3U0bkVkTWpjeDl0MTI0WmpRcEhlUTU0bnU2d1BzYXZM?=
 =?utf-8?B?ZUVtVWdScE1wY1JVaUNDUndUUGRDdlltUExxRmJON0hKU2p1WEJwZ2NMQ2pj?=
 =?utf-8?B?cnUyWDdkMExOTnhSMVh6OXB1V0J4Q2U4T21HZmFVQTNaRmFVQTkxVDZzL2NE?=
 =?utf-8?B?cFljREE1VWFYVStJb3V0NERQeVYrYmRzYkM1cFhram1DSU04clZTcEFDSi83?=
 =?utf-8?B?YVlsRHdsTktGeUF0L2lTRHhsK3N4b0ZjSWtuVDBoWTFZL3lDM3FZeEpVejk1?=
 =?utf-8?B?cDdHeDN1NnowNGFWSnFCTHY1UmdsRHI3RiswK2dEOEI4b1p2UkF2a2NEN3cy?=
 =?utf-8?B?czB0Q0I1ck9MQ0ZQcUlkT25ROU05NnhSa1ZtQmp2a1Q5VCtyUU9ZNGhzMFpG?=
 =?utf-8?B?WVFjd1VsRlpRUFZHR3NZL2w0MlIyby9DTGt3V2JydVF0a0pJcEF4MkFXQytp?=
 =?utf-8?B?TnhZSUtENy9lbDF4TlBSTnlyUDdEalhIbE55REVvWm8rM0hEaTBPR3hjQXpo?=
 =?utf-8?B?TkJvMWFoT0laNHhXeGg4U0tWUEVMbi81MnFqMTVOZDN6MEhIbnJqMTdjQ2x3?=
 =?utf-8?B?MG56R3k5RUhEV3dhQ1Fob2pVUjFQOFFFTmlpa2dINkI2Uk56S2N5R1pucTYr?=
 =?utf-8?B?dmx3aWJaNHRBajAxMkxFMnJoV0pCSHVSWVhaSVp1Z2lwMHZ3V1NTMlg2ZjZF?=
 =?utf-8?B?b2lTMUJrMUpla1o5M25OWGRVZkUydC9GTng5YklSOGw3RHJKT1U5SHRrU0Mr?=
 =?utf-8?B?OVlyaGZKTmVvTkRkZFc5dW5zVFNHdVdZTGlzTnQrRXZDRjNhS2dpU1lqbEtS?=
 =?utf-8?B?NlFEa0sxY3VpOVp1aExlTVEwWGxpSU1TNmNWeVBBcGphc2xnMFRsNHVBY1cv?=
 =?utf-8?B?ODh4TFhMN3E5RzNpbW13bVlVM2cwQnVFTUFCd2hMamd0Q3piR3lTKy9GNWt2?=
 =?utf-8?B?L0FxdHFOU2QvZGw4SXIvYll4bzRwMVNwTno4c1B0M0pNNDVVREpJeDZsRzQ3?=
 =?utf-8?B?S09YZFpQRm1ZL3NIRHNIOU1HN3pLT21wckczRVc1cStLTFRVeHlEbnQ3V3Bq?=
 =?utf-8?B?aSt1SG5QdVZJa2JwbklSbU12clB4VE4wVTJITVJhbVJEcTZnSVlMcnV1amV4?=
 =?utf-8?Q?zdhXwLTvLN7hqdcITRg4wtUWxou+nS7MYw/T2?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68e69075-d5d1-4341-e54f-08df23a62346
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2026 12:34:17.5977
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K6sGDvJJc2m0+0UYnhQ6rHnbRsWcO3fbVcDlXzGuas0no1f+6SIEi/b5Gqg/bwOVNbSgvOExyEqdw/R9gYBxvbFKQiGBYsgVP3X0pPRIby9/KfpQ1OQ2lprUnLMxbGUT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRWPR04MB11246

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

