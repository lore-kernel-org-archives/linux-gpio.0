Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013011.outbound.protection.outlook.com [52.101.83.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 054B6547043;
	Fri,  9 Oct 2026 18:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791569327; cv=fail; b=WLPrV2m7qegoYMFtjieZ959tnsIXqFTcNUp0fZqdrnffYVXpWtOoeP6GPg75XGHDQPLFBxkqoQhwN+XO91KgN6ao+l7kZAE7pwtNFX22kCm/NxdRhlWDBabxEuSTsw5EXpWDon+FSA6+Tlo59UQFy7UjG9oHokXAQYmF0dgy5jA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791569327; c=relaxed/simple;
	bh=N7wGlYzOKIapoNcCLyTAll9Y/HZ3i4KGhwzNoknkgb8=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=HiGaXNypEF22+KkdkLZVBfwEVld4iymFhufNzSSVrpeX07lEG0aHDbzaVC/+xWoOl9r9d1e7Kl+utqVXEYZCKt+VOi3GoDJbT3EA/QfaCqFlHoiGaSaYjxKhT4AW8OuSN4fJ/EfFeXc8BFf9fqh581L0GlA13w7XfeU+SqTr3Hk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=IG/m+dVX; arc=fail smtp.client-ip=52.101.83.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="IG/m+dVX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Islngw3+wgP4Qvmz7q3k2BgvWDcLB567Au2+69bLYP1FDICBza78jAdSD86x92J1fSegzPkNXc/wxYLdiupGDQuV4HyLlwKtQZ40DnbdVo5qOSaJElPJy6TsKmt+mDGbupgfd8cFXUFGsKktYyEslw9MlBTgXIZnyFDTHebk3ZvywYhyqZWRaozzc2en+MoKaGG2jeYh0R4Kcl1dvvKDeLcgFpPS3Bk1g4BirLqMd+dFjQILy/EkpKfUFeMSA9ha2po7smcliXsqAXnTWuMZuVOrUEU7yBvQyIfRYqwF7KupdGZorI62/b4IG5bUs932zSaJWz27cDgGNrresTKl6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QgnOHL0CxUb583gTwAwqCeBRHr0rQNvaiV6uxnrasYE=;
 b=Pqgi967EkpKNRizxkVs8abKV22FFHUXr0PDqJ8SRjlZowLE60F4F6K+H36zmuDGYGDigIQ2grRZ2yyyz37M3Htvwl4/e8ouPVP+uxqg+DuHYfBYd5LxBh3NXwEUINaZ5Y7yYCZPda9tQ2vvzezK7GpRpWAAdZ4A61tM7tQKRcesbNruuB+ahUxbEpSqekRmAUc09xOOtCmwTR9wk18X4rcycRvl4Az1JsqGY0aeLuLUQ5LJG7VLO0HW4rSuWKc0f2dEOGlG0ZqN+0E5HWEc0EQjLPOrg4/QD1FCYzbqqSrfM4z4QSNxk/vjatPu+ImFjGiKIxJniYc8vFzwzPhAr+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QgnOHL0CxUb583gTwAwqCeBRHr0rQNvaiV6uxnrasYE=;
 b=IG/m+dVXt3OFs/vdSLiqPUFEDlXyGLhzv8HLwDclQjzrze/aOnVQHFU2RAG3Z1qtgg5ZhBFaal3cpARq2IvGprhaWJJKUd21Ry5iLHaER2liN/7Rhj2B/71Rwm5KHy6q/XmPt5VYjMzcjZKROKsjapdQxSMvxO028aZdDUZnzBy4X46zvQ9Tei3/OwZtW9oBkG5msw5Fco9rB3VtP+RvXtPd8FUrRKk90OctnjIZzvsjgJCd8F7Zn99za8vcdBrHzYmsqpThJMpjCXkwsm7a93LA6BrbofVxIT5idu5D+3KCUHLeWN/aUUasGXGBJsqRAkEWZUye9+aTm14e4gGFjg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by GV2PR04MB11189.eurprd04.prod.outlook.com (2603:10a6:150:27c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Fri, 9 Oct
 2026 18:08:42 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0496.010; Fri, 9 Oct 2026
 18:08:42 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Sat, 10 Oct 2026 02:05:24 +0800
Subject: [PATCH v5 03/13] gpio: mxc: fix wakeup_pads bit operations
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261010-gpio-mxc-cleanup-v5-3-1e59e6ddfa00@nxp.com>
References: <20261010-gpio-mxc-cleanup-v5-0-1e59e6ddfa00@nxp.com>
In-Reply-To: <20261010-gpio-mxc-cleanup-v5-0-1e59e6ddfa00@nxp.com>
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
X-ClientProxiedBy: MA5P287CA0139.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d2::9) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|GV2PR04MB11189:EE_
X-MS-Office365-Filtering-Correlation-Id: 39cdac94-6914-42a5-9d98-08df26305a36
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|1800799024|366016|376014|19092799006|23010399003|56012099006|11063799006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	vbMkhMq4hU2027QlmZ9To5yicFrx/OzGbTF6kHHcvUM5peEqsgwhu4ThcpiZ+q0uba9gSRv0ZbbIkf1ZKopu9AyokaNCE+nKQZ+pe96C3UpIG5LHphXHgN9sT4USPCclbgM+6XWTso1sH08FjobN2TMg8I87EhSctlZLyd01pRRtaZD1Azeu8J/7KSBfoRxi4pipjxP1XJ6J5q7rUlQmp7l5K7Z3rtt8/Z2fO69e/x/aWNC26gGSRgLtqWTha/jVUyKbz0HcD6fy1Z6lPxxZYAVcf+WXJLLpXAwx1qQp9lzmBViOcgV+hdC6mliGVvU5zV7B14lHBgTlKep7RqwnROhz+UWlL9GpPjHu87/TvrgUX+UCI/8LyWo8yq+rxgV26o7T+s4Hsfgoc1BTJl1F51m0jIEITOiU5aJ9ewKy6CPZ/9ysYAcGguKEtwJBCGaRz/kXr5itC3umjVFcTCwxgebVzIkr6D/M0dcm/RPoHLqQPAbRyBgupD8uu3b4H/GqBWS5qDe2uwQ4O0QcjsvgIqtbtLM1OkLsbbPD0anjueRUwpTKZfDBKcofOqQyMydNHbDMFWt75rOAPbQrKxswjKGLFI4FJBeCpW4+uXC8EGh1xJfpfsnthPbQDU7yaQoP9HUtTq4YevMlufdFB6yNMzS7Ch02Olx92VR+QjwBCBg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(366016)(376014)(19092799006)(23010399003)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YUMrRm8rcGxOUjRUdWR3Q2toV05sNnN5cjhxTVlubTViMWZVOXNXMUl1WXdt?=
 =?utf-8?B?Q2hyMW9oTmk0NzIvc3pMck5QQTdLN1RrVmc1bWNGNkd3OEtiU3hoUXlYa3ds?=
 =?utf-8?B?OUJNS0d3NnMzZGxnRmQ4bjFhSzdhR1NBbVE0TU5FOGFqNkg5RG82S3FaUjNS?=
 =?utf-8?B?R2RUQitYV3RyTXc3RXk1Q1RmYUFJd0FuRXVhMC9GSjI2ZUljZkhQMVJxb3FT?=
 =?utf-8?B?Y0pYVDErbXFpbWxUMkw3dkFXbnBxUllYSG9zbTJXSG1HTVRkcmY3RXljTXNR?=
 =?utf-8?B?VDVTOFdWR2ExWjVLVGMraEphbjBUSVhEb1kwRnVha2l5aTBGaExOSzFBRWxw?=
 =?utf-8?B?WmVDeGJqTjdOYldFY2gzUUZZditOdmVtVG10M3g0Yk5HNFc1bUZRU1kwTklQ?=
 =?utf-8?B?U2ZYcHJwczNEcVd1aElueE5PWFZ2Y2FRd0xPWEdEM3g3THdlTlZRckFjUWFN?=
 =?utf-8?B?dDF0NGcwWW5hWUF2OWhMY2lBaEcxK29lYmFMUjRaOXBmV3hYcVN5UVVxSDRD?=
 =?utf-8?B?STNleUZ5cm5MMlRFNUJVZGpkbmN1WmFDUmhVY0FxSGhlSU1uNHpmQ0haY0o0?=
 =?utf-8?B?ZUo4aFdMVHFjYmZDUHQrSWFuQnhlM0VKZUVyQTUzR3Ryb2c2RVhGOVVMSXhZ?=
 =?utf-8?B?YVBaaDNJN0drWmYreVFDT2hUTXZ0Um44blA3SjJqV2ZTK3dNYXRJdk1jcHMx?=
 =?utf-8?B?Z1pRd3dzUUlibWxzWWhxUVNoVUtCWWtTNGdtRWNEZWplS3JWV28xN3BIdVFY?=
 =?utf-8?B?WGxKK3IrdXBsVTJRVzd2cXAxS0d4WTVQRy8wNmFFVzNiaFNVSGlBb1N3b2NM?=
 =?utf-8?B?anVjb0hMbjBEWDdqbzZEckovQVdzYWhYVWVTbXVyN1ZteFBzOFBNME1hTElv?=
 =?utf-8?B?M1VLQmRFSlNXNkxWZGtjc2t1OUxmYnFFZHZud213NzRPRmdrdDVGVk9UeS9o?=
 =?utf-8?B?S3NQMCtqeEoyZmtOWDhPUGwzR1dtOXBjc3piL09zV2Z6WDVSbEgyM3c1eDEr?=
 =?utf-8?B?Kys2Ty9OVUFORlQ1L3lkSW5QQ3l6L3ZDL3BSanJNSEVDNnlDU2lOZkZobkNl?=
 =?utf-8?B?VVJGaGR0UHBvNm1YbG54STlIOTQ1YkhUKzF6V2dDOGZTMUp0ZjZLWjdGeFQw?=
 =?utf-8?B?SG4rYmlmTVhyb3NIRFNEQ2xEOTl2ZXhxeWlkY3gzZmk3Q0JhN1BtRWJvVWIr?=
 =?utf-8?B?MkhTaHFBRVZwUTlUVUhRdUR1THZ3aGh3T1JyOEk4ZzNLQWxrNVBLK2xUVUVn?=
 =?utf-8?B?bHBJZVp6UWJXakkxTUVabkY5aFhYb3pRSWV0WjFHeGtMM3RhamMxTUwyRzh3?=
 =?utf-8?B?YnZXTTh3Y0RuajNaeEdqdks2NFRYT2F4TWhmWWVhby9KcEN0MkpLU2lTVnVp?=
 =?utf-8?B?c21sQ1VFL2xtWExnM2dwUmVYS3JzeC9FUy9OSnduU1lxVThjRjZZYUFsM21z?=
 =?utf-8?B?N21CTmhrZFIrOWlWNFh1M25BWU5KNUltUGV2SHhOU1lLeEcwZGVvNDBYRmRm?=
 =?utf-8?B?ZnNZaWxCUXEyV1VOUGR2NWdtNlFpZnJBdWVZcVdXdU5kR25RVkwvK3BCaEVw?=
 =?utf-8?B?Q0NkbDAyTG8wQ05hRFo5QU1BTjJ2K3dIU2gwT0NYWVBDTWc2TW52RTVwWmYr?=
 =?utf-8?B?a1FUWWdtdU13Q0tFbVNFR2JsOTE0NzhvSnF5ZjUvSERpUWwvSUZ5enNzY3E2?=
 =?utf-8?B?UngxOTAzR0IxMURCZTZ2a2V3SmM1ZU1VRTZWU1NONC92ME92ZHo0anU1YzR2?=
 =?utf-8?B?dW4vYmw1N3k0eVFoSm04M3hpVFNVUE1NQTlvNFMxSndwYURKTis2WXY4Njc1?=
 =?utf-8?B?WFVHWXpnMnp3SVhwR292ZFlOaG9iUVdnbXNxbXJVYThLM1NvVlF6UnpIMnJ3?=
 =?utf-8?B?Q0g1M3hVTENFTEhENytGOXpsZWZLdW5NTHdmZXd0R2ZLSXR2MFM2YUt4N3Iw?=
 =?utf-8?B?dXVsZVJhSEpIclRVTEZHd1BhSjNNVEJQNklSaU1LRURCZTREenprV3gvN2U2?=
 =?utf-8?B?bzd1elhlTm0xdGNIUm9jMmI3R3BtRVZoOFFkN203cWNVam8vZEF2U3dmZEZq?=
 =?utf-8?B?YXpPRGh3UVdEdWZocDJOR1owa0kvc3VJYmFRK2w4dkFmWWsvWmpPME8vUStW?=
 =?utf-8?B?RHBMUE52c01oR1J2Vzg0ZXA4cDBEVnc2Wm9qa3NtRTVBR1dTVU10Zy9jbVVY?=
 =?utf-8?B?ekdXZGgvOTdkRzdYdG02akMrelpOTHN2ZTAxK2toZWt3WlVtY25zVDFrK2Jm?=
 =?utf-8?B?ckltN3Zudm5sR2NHMGlsSENlMXcrN1N3MGNxY00xKzZGcTM0dDJLUHJ3WHRF?=
 =?utf-8?B?a0ZpTG8vbkY4YVltcXk4Um9lTDA2ZlV1UTg3M29ieE1JOXZrVWd5bFlHdHlr?=
 =?utf-8?Q?E6SBhDPTnEQzAl+6TLbrS2av5QbP5g9E6Q8uU?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39cdac94-6914-42a5-9d98-08df26305a36
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2026 18:08:42.6412
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5DysLoGvHc9TZFsbIoUEgqnjnGJ4T2M66PMBIn0jqZXjnaSTGCm+H8a08afO4B7mA7M8cOwcgoPeZKtOpaBhVSm2ylCymx75viC8QjXrLriOX8Yg7ZDRG+JyPPmz5rCD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11189

From: Peng Fan <peng.fan@nxp.com>

gpio_set_wake_irq() can be called concurrently for different pins on
the same port, so use atomic bitops when modifying wakeup_pads.

wakeup_pads is a u32, while assign_bit() operates on unsigned long
pointers. On 64-bit platforms, this causes an 8-byte read-modify-write
on a 4-byte field, corrupting the adjacent is_pad_wakeup. So change
wakeup_pads to unsigned long and reorder to avoid wasting words.

And the enable/disable path unconditionally sets/clears the wakeup_pads
bit even when enable_irq_wake()/disable_irq_wake() fails. Only update
the bit on success.

Fixes: f60c9eac54af ("gpio: mxc: enable pad wakeup on i.MX8x platforms")
Assisted-by: LLM
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/gpio/gpio-mxc.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
index 2f83a0f076bf..29396135717a 100644
--- a/drivers/gpio/gpio-mxc.c
+++ b/drivers/gpio/gpio-mxc.c
@@ -71,8 +71,8 @@ struct mxc_gpio_port {
 	unsigned long both_edges;
 	struct mxc_gpio_reg_saved gpio_saved_reg;
 	bool power_off;
-	u32 wakeup_pads;
 	bool is_pad_wakeup;
+	unsigned long wakeup_pads;
 	u32 pad_type[32];
 	const struct mxc_gpio_hwdata *hwdata;
 };
@@ -330,16 +330,18 @@ static int gpio_set_wake_irq(struct irq_data *d, u32 enable)
 			ret = enable_irq_wake(port->irq_high);
 		else
 			ret = enable_irq_wake(port->irq);
-		port->wakeup_pads |= BIT(gpio_idx);
 	} else {
 		if (port->irq_high && (gpio_idx >= 16))
 			ret = disable_irq_wake(port->irq_high);
 		else
 			ret = disable_irq_wake(port->irq);
-		port->wakeup_pads &= ~BIT(gpio_idx);
 	}
+	if (ret)
+		return ret;
 
-	return ret;
+	assign_bit(gpio_idx, &port->wakeup_pads, enable);
+
+	return 0;
 }
 
 static int mxc_gpio_init_gc(struct mxc_gpio_port *port, int irq_base)

-- 
2.51.0

