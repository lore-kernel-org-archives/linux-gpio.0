Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013007.outbound.protection.outlook.com [52.101.83.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E2B248BD3C;
	Mon, 12 Oct 2026 11:48:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791805708; cv=fail; b=V+Um1GPmqUEdUDOdHVip9BFuQV3/6wG7vunr7L9Q+toRQ8RhIwYE0l7gFR/N/5vRvyETp90TlXakaEbEtWX1amNjRdFNjsU1ZJRdYMnS8dtfuu3nXwSnrBI7P7m1YN8U2gx5sVKhKYYhZ0NFKeisauE8CAOfH9kWS5l+3HL1S9M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791805708; c=relaxed/simple;
	bh=iIGAA3vQLvi166plxm85m1QxdrifmD+rrTNVjy6UF7A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=OdDjEJkYESiBi6JQh9uN1/bvx9Cpehj9qce5MLT9d+X5dj4Nn/s3AKk8f6pw8v2fj26IGtnxz02jrFryMdyk51l80kxhY9NKosKtlvHs6KoC6Kz2grU0gp9g7G0aUg6gIvkfLkEveENHfxMUnHYZOKq7rsDBHx6P4Ytst3niEJg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=afG5JUFL; arc=fail smtp.client-ip=52.101.83.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="afG5JUFL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XXgZA6dGzIMhQfIMc4YS2wzpj12tvIQtbn6leFOZvvq0nkOZVr0fIHlOvHX1PAOaNlJ4LDVn3AP3G6jcqeUKLDCOUszXUcJPkhrHPho8aJe10/JYtJptBt/GyiIRttnw0AjEVaCNUzJfnn30MkfqGqHhDWoQbHNaXCJwf39b32lyP2zCZ3Ojh/YIsoyiQLfCDNGmQkkTyA4kTWSsrwEOMekmsTO/4B9vBcwMhih4m01Yfl4ei5fRQIxlJ27nlbfw7Q8GhDAuy8rNfeu96yiK4hWNYEbylbcxtqnlleoERoxwuLWIl79AXxkn5vt7mKD/Aw2SZatNueae0eIZh2CYAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J8/Tj0wcZLE1F9U9O4Ca79JiDIyYITR9OWta3SpU4Zg=;
 b=hGnHSEAt26XA8oVBC9+cxXS3mBTcuQpwDFqXN/6fiBiaGKACLTxpM/pF98cuZeDxeH66fYHNIWA/PHCLasreH69k4rSsw7VlKKZM6SLdSofSGJTE9OxhgMXOKXGbA9CqSJm4ZX7CJUkWu3WZsx7uzvQrhMPwiVu+aNDyeg8zHIedfHDnezuX3NDXvVCsxdLc0JvLmy34ev++mSa79Biniz1O4ya9ajd3XJ2lM6x0xihg0n8y/mj2djebnQynqXLAfPWVVmKSi25npiVoGB9H8EHYvXiKzH+PNIA3BqPFwaD/qb0yIoSdqPrZXwn8qOj/LUsZHMbBDJ18Pj34voCRyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J8/Tj0wcZLE1F9U9O4Ca79JiDIyYITR9OWta3SpU4Zg=;
 b=afG5JUFLiH6Oaf43d6f6AHy7eG1t4kFqMRgE+U5aVspCC4KNMIazki4NZbaAQ77UleHVXG5qjYvcrp0QErOiacSFmok8aHZoxTsPjrnBP+Id8EAWLx9AWpzzlhKBzdoqsr3eKyAp7p08Q99+oW+iBGS8kehmoGELvDbMwbZSrSj3XRlbaQq7uT2TkcGerNeC/1FqvzjtSsXUZLaAQG82in7pioTRXmeD0LZ2u+mGaR11a9gKC41gsgAemDCTRh1TinhMHfbQPSfpZjNFKf7MaA/G0dbLptwzhcmLmDwo1FEmbnv2yqqedYg8GXLXaLUe8rBjTD2lS5HTxkX31fJjQg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PA4PR04MB7885.eurprd04.prod.outlook.com (2603:10a6:102:ce::14)
 by PA4PR04MB7823.eurprd04.prod.outlook.com (2603:10a6:102:c1::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.21; Mon, 12 Oct
 2026 11:48:21 +0000
Received: from PA4PR04MB7885.eurprd04.prod.outlook.com
 ([fe80::6e41:b858:46f8:c5c7]) by PA4PR04MB7885.eurprd04.prod.outlook.com
 ([fe80::6e41:b858:46f8:c5c7%6]) with mapi id 15.21.0496.020; Mon, 12 Oct 2026
 11:48:21 +0000
Date: Mon, 12 Oct 2026 19:52:55 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shenwei Wang <shenwei.wang@nxp.com>, linux-gpio@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v6 08/13] gpio: mxc: use local dev variable
Message-ID: <aszKF2TIOIIZNq2b@shlinux89>
References: <20261011-gpio-mxc-cleanup-v6-0-cb47ce2ad758@nxp.com>
 <20261011-gpio-mxc-cleanup-v6-8-cb47ce2ad758@nxp.com>
 <CAHp75VeonKZtX8moOdXrmTJbjH5Ew5iVdDDc3KfqQ9r_tvHg1g@mail.gmail.com>
 <asyw9ns870F0g7UD@shlinux89>
 <CAHp75VcO8YEBbt--P8WO-_Vu1O0mR2nsdqeBSG=JgavCEoR3Dg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHp75VcO8YEBbt--P8WO-_Vu1O0mR2nsdqeBSG=JgavCEoR3Dg@mail.gmail.com>
X-ClientProxiedBy: MA5P287CA0257.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1f1::12) To PA4PR04MB7885.eurprd04.prod.outlook.com
 (2603:10a6:102:ce::14)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB7885:EE_|PA4PR04MB7823:EE_
X-MS-Office365-Filtering-Correlation-Id: 3454ab5c-1728-48de-978c-08df2856b6e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|19092799006|1800799024|23010399003|11063799006|4143699003|56012099006|22082099003|18002099003|6133799003|10067099003;
X-Microsoft-Antispam-Message-Info:
	38KilsvXUDCjVNdUBM+JjNB5cyaf7WIksEro1QL4I9ho2iBuap7l7g8jrzPL3K41qRpKEGKleJ7VczCGQQjiT2oDRDJG8AWyxPKPq6xUlJKX/eLQs5O3Zy9+CQHCpb2d2sSY71uhnz7VepMZ3XRXE91S9G4aCJH74ELk1JNeZRYxjZWfApZl486Ql+QeSc9aiNsHq4QA18jxTQqmS5NizZMLTYoKAmNxxxRTkOQVykQzIIxsXxuYkjnNJo94giE3hd86r3KZvO1egnWqfhmYKIFJTT0vND+oPwvb0man98eQCwFaN3NSevMuulcwJYtRZsPu1EF8juDVE8QdP/MfibJbtY+v7OP89T8+4WABC0F/Lq7bW7suujjCZmp0JAW2sqFyL81gXahNK+vERQBzOInvJsnFW4mfg82nLxS4kkhiohHTqOjsiJ7s7O6awz1E2UWRrFZCGG+UOJpnC7qCaMyLpvPRMQ+kFPBtiP7DCLN+ezYhuDvNFwunmzAttnKnQptznPFaj5wbrQa/Vm76b7p25ExXw0OQi3avU13Wy4ovDxxDSHkz8Q1O/uzLTFg0ViLMwCP3xCty4pgz4ZZtQHb9zlGIjO9OyW3WkqjAhymkgWYd40Tfh/JSGDJHE/P3+eE9L9tCDy6BAp4q12G5lP4t8sT1DjasY3kBvqV92K4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB7885.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(19092799006)(1800799024)(23010399003)(11063799006)(4143699003)(56012099006)(22082099003)(18002099003)(6133799003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RXlnY2c4WDJhaWt1TWZLWkljbEFTS3hWMHNkQjk5ZFgwSmd0bXo3NDlDVndZ?=
 =?utf-8?B?WVlGNnpHZndEbmphNkF3NmVYWVhnKzdoaHIvNExUTWxWUHN6N28velArY2VG?=
 =?utf-8?B?MVY4em5hbzcvM2FSSVZhZGFRZVA3V1JpWEJieTlIZ0gwVng1NmM0T1Y5bk5h?=
 =?utf-8?B?WkpkTE91UkpZYWkyY3haVktTaUNHWEhXU1Y4RjhqdWI2VS9MMUFoK28vYTlw?=
 =?utf-8?B?aElNTW8wUk1kTGVGV2ZrZEpZOVU3Z2J0RTJ1aG5FTVpnaDNHMHBxUTFDYzJq?=
 =?utf-8?B?RnZ6UzAxOElVajZ4STJQakR0QXNnaTdkalRYV0Y5eUlSa2tjWEwvSCtma1NU?=
 =?utf-8?B?Vy9kSmRvOFE1UmVnb1ZyUnpRR3U1enhubnUrc01FYzJoWXRESjF3M2h3bnZV?=
 =?utf-8?B?cTl4ZjJnbGJhSXZ1RFMveTdoeU5VM3pTaG85MUxvby9VZi9LYjlGMjd4SFhi?=
 =?utf-8?B?alMzeUVPQktMdnBIeGkvdU93MlVwSmlTU2pCVEpGalZSODN5RVlGWG94Uzdu?=
 =?utf-8?B?VVBka0J5RVdkays0L3RyeTV3RE9nZXRCYjZ5UjFYMWNDcitBOVFrQldZeTRW?=
 =?utf-8?B?MGtvM045aS9zUWNJSk0xUFpxVUVqYWR3L1NLajIzSkdrRENtTmprdlN0a2Rk?=
 =?utf-8?B?UEltUlY5SnBKMWt5RUxGZ0FRWUlHS3gybjRkTUp1OXQ1ZlI2VEZVSWQyeHVr?=
 =?utf-8?B?dzlQRnZEYUlmc1pjUFprclhDWFZFaFZUcnpHaEZDMVpwc2M5VWpPdW1MZ3VP?=
 =?utf-8?B?eFdYOFhTWWcxWEVBWmRWVFZmVW9QWitrYit6WGI3NzZlc0hJWVI0SG9kZUhW?=
 =?utf-8?B?aVBxSzFvN1hBOWZtM1RvbnN1MjlPRk95ZTZmWCtyL1d1dFFDZWVKczRkWGth?=
 =?utf-8?B?S3B1WVZqdUNmREV6YThqLzRpRlV2YmdZUFVwR0xDT0E3dWhhRURaMUdNaXlW?=
 =?utf-8?B?cWFMRWJESEhUYlJjTUZ4dFpBekZKc0pwdlhBUnhGb20yZldPWnI4cU1UY3Vx?=
 =?utf-8?B?T2ZmaEFwK2ZzVW1NYk9yUENxOHByMElGVGo5NkVEaTk3Z2hTVnR4SER3K01u?=
 =?utf-8?B?SXQzM1hQTnRvM1k4ZEdHQ3RxbUMwSzlydW1rdjdoREEzeHdtVGx6WFRMZzh2?=
 =?utf-8?B?RkVmeHBXek53b3NCTDQwdG5abUgyOFNRY1UvYUVPMWltTDFJOC94R0l5RThD?=
 =?utf-8?B?Q0Y3eHUyMHJUY2d0bVdyYk1xTVRkNC9UVkRtT0FYZC9jWExvWnRVbllWbVRT?=
 =?utf-8?B?STJnZzZJc0J6S2V5NmsrUjgwbWMydXh0UFFSaXhRaG5md1ZOMUlwWjBEakpQ?=
 =?utf-8?B?OW5QUDhLQU1UMWNlL2ZtL3hYKy9DZzUrd2ZCeGRwWEtmTlpjc1Q3RWRDYVAw?=
 =?utf-8?B?RDJ0NGE3TTMzQndhaWlaNEo4YlMySFIzaXhIS1NwcEtzQ1ZKMEpVVGdjb0dT?=
 =?utf-8?B?YVNnMjhVRGpWQ1ZEbGtpNEdOSlhYSFNkNHJuZkk2em5XaldHdEw4dnVnZFNJ?=
 =?utf-8?B?VEJySHJneS9NR1BsTW1qdWtjVmwvZ244Znh5a1ZtK2toa2FJNklhS2M1OTc4?=
 =?utf-8?B?NThSenpuRzd5L1RuM293T1RTTS90MnVGaXJ6TFJVS1QrU1NsWFBiaENLODJp?=
 =?utf-8?B?K29oaWZzTHlhZDdDNlZrbmxtN2hwSnlheXlYWDRxWkh6U3dUOGRIRXErcnNB?=
 =?utf-8?B?WnM3cHdVMXFlS3ZnNzI2TUlJcFpCbGJ0RlZKSDh4MjFaOWt3Z2hVRllueUd1?=
 =?utf-8?B?czB3NHZCZ255Zy85UU5kaHMwR1IzQWVwZWc2aGsrTEdNK3ROd2V6OWFINm0r?=
 =?utf-8?B?U2NnckdONU1wbEwzRG9RdDJ1dDA3dG5uYjhOY0tkOTRHMjF5M29Vdko2OFdN?=
 =?utf-8?B?RjN0L0RRSDhqU1VLdFltb1AwK2w5MEMwMk8rUmFzQzlEZDZNVGQ2a3JUK0ts?=
 =?utf-8?B?Tk1tNFdZTHU5d2JwS2NOYWF3SlNucmtwRGZUU3QvTWkyRFZmWjlCT3U4ZnBq?=
 =?utf-8?B?eFMwb3p1VTVVWG1aZloydVZxRWgybDc2WnlkbzZKUks2QVAzSUNVYTN4UDUr?=
 =?utf-8?B?YVVQTFduUHNJVjJ2L2ZnNkR4WStmc3lZVnBZNklnN256U0dnRWR4dXJpMUNN?=
 =?utf-8?B?cVA0Q3dtS3ZGUmVQakIvM3J5NTIxMnFpRVlSdnVtT1dPYmpIc1JHM0hJQm1K?=
 =?utf-8?B?eGdOb3dVYWhQOWpMSDJJUWtSS2dJK1A2TE9nZ0hJV2p5VG9wOEJjM3p3NWV1?=
 =?utf-8?B?ODdJc3hDcTY1eGFzai9MNnBtR2xkSFZRN05DWGdiZzU1Q00vNmoyTWl1eEl2?=
 =?utf-8?B?L2Z1bVJUT0djNFNsazk4MnpQMmxVUEVFaS9uYWR1em1NSjJSNHE2TTFURWhv?=
 =?utf-8?Q?Xte+gUrzpcfn/S6YumfevWvvZxJf9c7fY/RW3?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3454ab5c-1728-48de-978c-08df2856b6e7
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB7885.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2026 11:48:21.3120
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MItpWdwSB2NGL0Yc/Ttsk/KzQS+GzR0ahAl7//ToLvaKbni1v2vE6reUR3xOjLg6W739AbNWBAAuyPX2lObSChOj9G1qvKiOo/y8w8tC/qg1v05RZiN5OAZfxqypaegh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7823

On Mon, Oct 12, 2026 at 01:39:41PM +0300, Andy Shevchenko wrote:
>On Mon, Oct 12, 2026 at 1:01 PM Peng Fan <peng.fan@oss.nxp.com> wrote:
>> On Mon, Oct 12, 2026 at 12:30:07PM +0300, Andy Shevchenko wrote:
>> >On Sun, Oct 11, 2026 at 2:54 PM Peng Fan (OSS) <peng.fan@oss.nxp.com> wrote:
>
>...
>
>> >>         struct device_node *np = pdev->dev.of_node;
>> >
>> >Why not this one? Is it even used? Perhaps you want to have
>>
>> of_alias_get_id() is used, there is no counterpart in fwnode api for it.
>>
>> >  struct fwnode_handle *fwnode = dev_fwnode(dev);
>> >
>> >here?
>
>What about using to_of_node() for that one and fwnode for IRQ APIs?
>
>> >> +       struct device *dev = &pdev->dev;
>
>...
>
>> >> -       dev_info(&pdev->dev, "%s failed with errno %d\n", __func__, err);
>> >> +       dev_info(dev, "%s failed with errno %d\n", __func__, err);
>> >
>> >This message simply needs to be killed, with initcall_debug in the
>> >kernel command line you will get something similar from driver core.
>>
>> ok. Let me fold the change in this patch, I would not introduce
>> another patch to just drop this line.
>
>Why not? This is a logically different change. Since the driver was
>not touched for a long time there is a technical debt, you can first
>send fixes separately, followed by a number of the drops like this one
>(remove a noisy line), followed by new features. Make it three patch
>series.

ok. let me first prepare the fixes part.

Thanks
Peng

>
>-- 
>With Best Regards,
>Andy Shevchenko
>
