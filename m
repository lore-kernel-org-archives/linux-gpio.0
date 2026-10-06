Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010024.outbound.protection.outlook.com [52.101.69.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39B6C4229A6;
	Tue,  6 Oct 2026 12:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791290356; cv=fail; b=Bk/hSJQzoLSgV6JL6mUiuHZVCVoFPh86MhI8N/Bi/r3DofwCHO+7ZvP6rkCW6C0VHNqhWldi5gJi6I2CDxw+ttW/UmU3Uihol2jbSUNeVk3tQ/RHm7+tNrPB/lQIIJ4QBOqCFhP+9sAZLjAuGKdFBrHWLHVmRqvz9MklDthfgPM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791290356; c=relaxed/simple;
	bh=D1ThVORyHN9p27u83is1k6QwHOIHj473B64ArC7pATs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=exT7rvoKVXD+gi/vQ+9rEnKEC86Iq8WS+x1LWBhUiL+ODSWPfveK0hqrRvomc1hfjdsRLfueLp49ytDP1eupRydCawv86WjhI1phgEsw+HTEiJnriAVsgFfbAtUjcAhMK+Ly3kslalgMyl3WA22yAPUbTrOmnps8bEVsn6F2CJY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=fPPDIFJn; arc=fail smtp.client-ip=52.101.69.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="fPPDIFJn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I+rWs1PVYcQotA+1FmuhPta8aY6QW5eQ9ztvNLRy5ldnojhJQXMB2YOwYwvrmCGtJUvkLAOuBkwLloslZB3+oTLuOQ/VBjpc/fAO4LWsP/SBV4P2vwv3VifMbP2IK+OiCtY2HRK3jv0gEcBBpvvC1DLX3rbkxFf3hfWGkaxYJ5w4qwdKT7/HvNOrrM6kA7f+7TJFH+ZVmkWuHOgF7OPbGecYC9fgwunsMmTKmjQsiivPZ3xrLMPJzPa/Do3ld+MO1yHKNcbgdGExwQ6x3nOoHRVC0a6IyOX08RWl25hd3HbFOlCYuHM03V4KC1nJdgw1NlLxoE9mHEuEjIZn7A/8cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qOszpBL7aL9HZ+PxN77VGSprrG1hzLxuzp2r1pkDNlY=;
 b=t1cetyWa0Qk2EzRKuSKADa/81TRvlpKtfuWINh8YsWvCoTfyEt5lcDkwjQFnHVZwk8fm3uYZeDRs3gAcX0azHiu4Hog5kZ2K+bZPDgrm80Ss4dEgCESar26HI8vzP0HmOcIZ5TpZwPA3NezpLrwMAKqJthDwIrqiQPpfcBb23u/bIS9BanjPnwyXrNe0CWg8mw/+HSwtEvNQIJe8vnbjuiPOyoRx0OyquvkaJMgMeSScEpD3nYbI9Md3swbQDtFr4nMMsWISucWA6NszqsTXuB/iynwDVJfQOsncIy+n9BBpWcaZ5YzU2XpI2QrXucIfvbmdbZ4yhj8Nzg2HTGxPeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qOszpBL7aL9HZ+PxN77VGSprrG1hzLxuzp2r1pkDNlY=;
 b=fPPDIFJnr7V7aiAWgGjpTgaBpipuMuEYFXx6he2VH3/YeAr671TsSl1Pd+V9yp484+Py77emzDwSzvzU0w5W9T2s2imlDdcqWLLNAdu2AKXLIsMiiG0OjsgYm7CesmbheVWs32GgAv4vySMrTub6Dan3eNkIevp142fi2b6qmZqs+/V+ALC90rWjj4HdfcM9+rJcaHOLwP0rYdNS3cMZ6+VjZklae4+iHEzPkTB2WwzSAReiYJpg6t9wSwlaLV5F5CVzw+yeDmjy+LkronxeZjWXFrc7/p7PVeZZydtb5PRlM7AYQAW3VdvtScxMcniXwL77/424eo8PB0TIp/V5mw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by MI9PR04MB480781.eurprd04.prod.outlook.com (2603:10a6:290:d3::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Tue, 6 Oct
 2026 12:39:03 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0451.022; Tue, 6 Oct 2026
 12:39:03 +0000
Date: Tue, 6 Oct 2026 20:43:34 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shenwei Wang <shenwei.wang@nxp.com>,
	Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: linux-gpio@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v3 0/9] gpio: mxc: bug fixes and probe cleanup
Message-ID: <asTs9scYht+xg7v5@shlinux89>
References: <20261006-gpio-mxc-cleanup-v3-0-129f93302a90@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261006-gpio-mxc-cleanup-v3-0-129f93302a90@nxp.com>
X-ClientProxiedBy: SI1PR02CA0001.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::15) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|MI9PR04MB480781:EE_
X-MS-Office365-Filtering-Correlation-Id: dbb46a3e-84e6-4010-9c61-08df23a6cdab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|23010399003|376014|19092799006|56012099006|11063799006|18002099003|10067099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	adsSxmjO0tUND2oY66t8gHlTE3RVuwEfiNb3kF9z4hlnfORmyBmjpyfDPzfgbKiGX3Cx9M6Mibf2ydBUjOYibDgjlIIgKPcAqY77AHtkb0aQxQTsKWAG1aY//6X4xNwcJ4i8bkcCUvweYJ1WL/eERr6m0QW9UeH+QZCeY+kIqiPEQjJioAb2UFuWpuUiRq9es333XF1anEaPsmKejeMVQVf9Q+TVmY3QOkto5Efer8mf8PAvfWfLSKQeBszXu9hsmBPlE6uCN0Xz7UHSoFfY5hXe9hXP4QsR+EAR06TY2W8xPcuDTq45pEFfhs/J21aD4s6rH8+i/rSxc5uPhJqmgfEFLWcCKPmld2RjplXmMmU3Y2MkJcFG5Yun/VAPtvVqJ6oBfDz2MsSr6ERV82BjuITp/OaGpp2ndlyM+kd0lHDCNMpP31XAzY2giwDfrXALOlBsGvE1dEBcQRE7Ec/XRqB5uwuOBnUD66IkCp0NWFC6KeE34UjX5mV5XrCXkr54lYaUDMnzRxcZLI387O5xygYKWzQYfKUKZRWquDNdi85FukPij9WW5uF8SZZieD0RgKqp8Irz1JENs7wfLQm/wECvSdoGEDoVu8kP4XUB4SA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(23010399003)(376014)(19092799006)(56012099006)(11063799006)(18002099003)(10067099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZkNQL3E2RXdUdXExeURzWFZTN0d4NE9aY3FUSGh2STRpSGZUYUZkR09RZWY5?=
 =?utf-8?B?OEJlRXpZdVNiSHVBTWNsdnRUckkxR1lTbzZZUDVPenNCSDRwS3BZQ1c2Tktt?=
 =?utf-8?B?d01iTzhoTVdKMy9US3M2ZW9HVzFaK0xSaHRKcjlnUjcwTitwL21jWDdUaFVQ?=
 =?utf-8?B?ekNCS2haTGRzREVLQXh1Ty8vd0EyWmxkc0U1MFhLc2JpK25yMnB5ditOVXZj?=
 =?utf-8?B?RnlDMU50dFc4a3Y1WnZOenpoei9rb0JFWnJOcVRGcDVFREtxRmpvOFpGQ2p4?=
 =?utf-8?B?WDRCZS9Xb1RHK3N3WUNBT0JkV3pLbW0yaGlEbUZHZGJUa2c5Y0U2TEJpQzVW?=
 =?utf-8?B?MDhVYVFEVFdGMkE4T2ZsNWdzNmVIOTcxSmtPYnpkOUNNNnM3cUxzWjhtam56?=
 =?utf-8?B?TGJYRUdnQUpoQmJYOFllVXU2SWVKYlBCM3lYYWhtdWE5YVlVQzIwanhnNHFq?=
 =?utf-8?B?eTB0aXdPRjd2TkFQNzl6V1dCYXcya0tadDBDRFZjOFBzTG1RcmdOclA5Rm02?=
 =?utf-8?B?KzVqWVV3YS9SK2tHckdIbFF5bStOQVJkZjQvMC82cGw2N1NJRTB6aHNpVGwr?=
 =?utf-8?B?QXFJNHloQlBpZEtvVVVQa28rYThDakozNTY1T2dCcm5YTlFJZGVnejMwTUZI?=
 =?utf-8?B?RjAxT0JtTG0vWm00YjBDYVoyVERSWXQvQ2FLOFJxdXNZeVYwa3ZBaysySXg1?=
 =?utf-8?B?dklHenQ0TE9CaS9UZFVUL21ad3VXQTZURGFkeURGVCtLMzlnbWxnQmNrWWNX?=
 =?utf-8?B?MTVRUVZSTnBDbTZDZitRdGFWcUw4bHlCcE1WUTg4ckpNRFR6TmNSNXhUQllB?=
 =?utf-8?B?VWRYODB0RDFtUk52TE43dGtVV1paS0hJa21sazU2UzFnMDlEZ21pUHVYdHRs?=
 =?utf-8?B?Y0pXa0N2OWRPMHRLWmp1OWE5bldQbTUxK3UvMllTT0x4ZXcxVFpCTmNVclJU?=
 =?utf-8?B?bTJ5bXFJY2IvZllVUWhDWmd4d3VRVGJZS2sxeHF6TUtVcEc0amhqKzZVWkhO?=
 =?utf-8?B?R3ZzYmR5OXl3c2cwc2xjYWE1dHJnOVk3R3VoK3RTWDZPb3ZLUzdTY2hvUlJ3?=
 =?utf-8?B?Yk0vZ2kxUk93MGFDblc4VCtOTXRLUGdacHNPeTlGZ0dvbCtrM2NjdUI1d2JG?=
 =?utf-8?B?SnFCTUFUM2NWQUNZNTVtV1J2V29yQVpESnRNOHJQcElFSWp4eDFRU1UwUTcy?=
 =?utf-8?B?SkE1Z054WFBLTmpLOVFMS2UxZWhpSkdiYmt6b01xN0hEZmd2M3VCMmZlakhM?=
 =?utf-8?B?bzBtM2hSWEs4dDZUWDFGYlloNCtvRmFiQWlyaHBsVVc3VzhzdjA5Ry9aUC85?=
 =?utf-8?B?ZXljcXRzVW5oL3BYaFFGeWwxNEFaNXk4eDRwc0duR0txWDJxWGtyV3E4WnQv?=
 =?utf-8?B?Y2RqcytMVFNuR2tLQmVwSTN1aGJNQ0hWSkJIYkhjRkFHS3NSR3R6Yzd4SXk1?=
 =?utf-8?B?c1I3VG1mNWtSRzRwRjZqdFlhY1lKYmpBWG9vdnJ2ZUFUWlltTUJhQ1NNeTJ0?=
 =?utf-8?B?VlhUSER3bXgyL0VDSEJnNFg3aTVpRUk0SVI2SkQ1UmpKSUpCbXVBbzNnTEgy?=
 =?utf-8?B?dmZKS1VSQVhRWGpnSWJzMDhTakhRZFhLeFA1VUY0QlY5Mjg0ckhOaUUvelBm?=
 =?utf-8?B?eWtPQUZWVGxSSWc4NUxpQTJLdk9lUUlVczUrQlp5bHlPdmZ5eUJpY3o3VXNy?=
 =?utf-8?B?Y2hsM3lhNDVlUzRyeER3ZWNOY2d2WVUvMmFSejZjckV0K1dWMk0xNkhyOExO?=
 =?utf-8?B?ZzFWM0lKTGEyODM0SkNQSU9LbjN6YTJVa3NPNklkeHREbkxQTE40MFhCbm9I?=
 =?utf-8?B?akx4eWxrbmJ2K0svekpIS3Rwb2krMEJVK25IL3ljTGUxckJ1cUZQZVJlRmkv?=
 =?utf-8?B?UHZqYXlGSlpCRlRHUnNyYVdleGMyS0lublVzYlMzQVY5V0RhaUxUUEQ2L2t4?=
 =?utf-8?B?Q1NnbDQ5MDNmWHcraHcyU1VNMm1sRy9IMW5SRzRlT3BGbmovcWpCTnJiK0hu?=
 =?utf-8?B?czl5aWNJWmZWYjQvTTVBUC9NRElveWdHSHZNckUyM3BQK0dNS2kxaU1OQXJw?=
 =?utf-8?B?NWZSajZPSGd5ZE0vaWVQZERiRGwyZ002S1FTc2lkbWJWOGgweTFQUG5xYkZx?=
 =?utf-8?B?ckpvSi8wbzI2c1pHc1E1Ulg3Q2ZqV2ZuU3J5QWdjbDJ5TXJOSUE2YVZaUnBK?=
 =?utf-8?B?V0NLNHVDSVNCNlRoY1VWNytmM0JOK3E1TXBLUUxzWEF4Y1d3WnNhMkFxMnZi?=
 =?utf-8?B?a1dzLzhoYWcvZFM2Z01hVkcvZFBITk9FTVJXTi9CaGljUjI1V0Vlbld1cWFC?=
 =?utf-8?B?T0Rxbm1udmdRT1Z4VzFsZkxkVTUrdThnMm9MbUxuN21WRnZ4VlppT2EyVnlE?=
 =?utf-8?Q?uaCGh60NGjIr11yYwU5GEa8eq9DrjcZWtKDVl?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dbb46a3e-84e6-4010-9c61-08df23a6cdab
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2026 12:39:03.5115
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r9bIUsteGWiL+EFA/h1rMLmL1ZngZ3D+24uZtkbMDtKw9XxcXme0pkatmt+y0TgB3XoTc7DjXzOP4dJyqvEIVpgATdNfngLkMYxSFNREOpsSKCgs/hi0mS9yOyP/GWcj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MI9PR04MB480781

Ignore this V3 patchset. This is not a complete version.

Thanks
Peng

On Tue, Oct 06, 2026 at 08:31:05PM +0800, Peng Fan (OSS) wrote:
>This series cleans up the gpio-mxc driver in several incremental steps:
>bug fixes, converting runtime state to static per-compatible data,
>modernizing resource management with devres, and cleaning up
>register access patterns.
>
>Patches 1-2 are bug fixes:
>  - Fix a race where the chained IRQ handler is installed before probe
>    completes, allowing interrupts to fire on a half-initialized port.
>  - Fix wakeup_pads bit operations that used wrong set_bit/clear_bit
>    logic, folding in the assign_bit() simplification from V1.
>
>Patches 3-4 replace runtime of_device_is_compatible() calls with static
>per-compatible hwdata flags, eliminating repeated string comparisons in
>the suspend/resume path.
>
>Patches 5-6 convert probe error handling to devres and dev_err_probe().
>
>Patches 7-9 are cosmetic cleanups: local dev variable, MXC_ICR macros
>with field_prep/field_get, and BIT() macro for single-bit shifts.
>
>Signed-off-by: Peng Fan <peng.fan@nxp.com>
>---
>Changes in v3:
>- Patch 5/8 ("gpio: mxc: convert probe error handling to devres"):
>  Replaced pm_runtime_get_noresume() with
>  devm_pm_runtime_get_noresume() to fix a PM usage counter leak on
>  probe error paths. The non-devm pm_runtime_get_noresume() was not
>  balanced by any devres action, so any probe failure after the PM
>  block (e.g. -EPROBE_DEFER from devm_gpiochip_add_data()) would
>  leave usage_count permanently elevated, preventing runtime suspend
>  on re-probe.
>  Dropped the explicit pm_runtime_put_noidle() on
>  devm_pm_runtime_set_active_enabled() failure - the devres
>  registered by devm_pm_runtime_get_noresume() handles the balance
>  automatically during probe unwind.
>- Patch 6/8 ("gpio: mxc: use local dev variable"):
>  Keep of_device_is_compatible(), only focus on switching &pdev->dev to
>  dev.
>- Link to v2: https://patch.msgid.link/20261005-gpio-mxc-cleanup-v2-0-bdc3afbb35e2@nxp.com
>
>Changes in V2:
>- Reworked compatible-string caching (V1 patch 3) from probe-time bools
>  in mxc_gpio_port to static hwdata flags with per-compatible data
>  instances.  Split into two patches: one introducing the flags scheme
>  with MXC_GPIO_HW_DATA_COMMON macro for power_off (patch 3), one
>  extending it to pad_wakeup and imx8qm (patch 4).  (Frank, bot review)
>- Replaced devm_pm_runtime_get_noresume() + pm_runtime_set_active() +
>  devm_pm_runtime_enable() with devm_pm_runtime_set_active_enabled().
>  Keep plain pm_runtime_get_noresume() (non-devm) for the probe-scoped
>  reference to avoid usage_count underflow on unbind.  (Frank, bot review)
>- Replaced irq_domain_create_legacy() + devm_add_action_or_reset() with
>  devm_irq_domain_instantiate().  Squashed with the PM runtime devres
>  conversion (V1 patches 4+5) into a single patch (patch 5), since the
>  goto labels cannot be removed until both resources are devres-managed.
>- Split dev_err_probe() conversion into its own patch (patch 6) for
>  bisectability — patch 5 uses bare returns with correct error values.
>- Folded gpio_set_wake_irq() assign_bit simplification (V1 patch 9) into
>  the wakeup_pads fix (patch 2) where it belongs.
>- Used 0x3U (unsigned) in MXC_ICR_MASK() to avoid implementation-defined
>  behavior when shifting by 30 bits.
>- Replaced linux/of.h with linux/property.h to match the
>  of_device_is_compatible() → device_is_compatible() API change (patch 7).
>- Added return-value checks for devm_pm_runtime_set_active_enabled().
>- Fixed stale error code returns after devm_irq_alloc_descs() and
>  devm_irq_domain_instantiate() in the devres conversion patch.
>- Link to v1: https://patch.msgid.link/20261003-gpio-mxc-cleanup-v1-0-dad728ce27f2@nxp.com
>
>---
>Peng Fan (9):
>      gpio: mxc: fix race between chained IRQ handler install and probe completion
>      gpio: mxc: fix wakeup_pads bit operations
>      gpio: mxc: replace of_device_is_compatible() with hwdata flags
>      gpio: mxc: convert pad wakeup compatible checks to hwdata flags
>      gpio: mxc: convert probe error handling to devres
>      gpio: mxc: switch probe error paths to dev_err_probe()
>      gpio: mxc: use local dev variable
>      gpio: mxc: introduce MXC_ICR macros and use field_prep/field_get
>      gpio: mxc: use BIT() macro for single-bit operations
>
> drivers/gpio/gpio-mxc.c | 257 +++++++++++++++++++++++++++---------------------
> 1 file changed, 145 insertions(+), 112 deletions(-)
>---
>base-commit: f0406245cb9855e6318335a8a223551354291a46
>change-id: 20261003-gpio-mxc-cleanup-e49cc626c51e
>
>Best regards,
>--  
>Peng Fan <peng.fan@nxp.com>
>
>
