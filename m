Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013030.outbound.protection.outlook.com [40.107.162.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95DD04779A7;
	Mon, 12 Oct 2026 10:06:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791799591; cv=fail; b=pVzf++ckXQw2uiMp1m32Ud0AbTu6+DJOJzZ78Wh/K4DyPvXXubItkwYsqgJhn8DGeIdh/x+TUxsr97GH3FhyUtzdRkwShYERGXTjrVe9LzLE7sbeIoQGEjMR6W1qgv509u682u97isI/HZ4Q5RTvjUV1PUz1fNN5J80oFtccDP8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791799591; c=relaxed/simple;
	bh=G7Ksl25FdI2FZerhForQJCcTRoeFCFHOYYbylTtALxE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=tqhvvN6wCdaGvz4Q3ZORiDbC2LZKNguO0v7yBR6RtRx+m0lp77T9q7FYkCFxmQFtJ9kiFOD5O3a2En99n7B5jm3N1COMCIdkbyx3duiGmcSnaqx3ZiTblJI+LYaxuu8sDuit4IZDQvgrpK41zAyIpV9n/HkUSvp92ua20BWNboY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=w1DZykyp; arc=fail smtp.client-ip=40.107.162.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="w1DZykyp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oLGIYc8LKLIF0v3CyKkoaxhPJB7enbCpUKzJ4w3qpv/0g30I2J30CCBTg9t5Nfx+sXvVc91daMLda+MrFGTssuMOc9bINOAW4H6oD2fwy/PPY+psE3/lRZaxAJ0AcI6AZddcpx/DwohJRu/pSYiaFbSToH0r+RWQIi6QzNxkz6QdkIFNsjQPbnqW03dpJMY6kicrGmUqxD98QsdSPphoQqPUsTXpoy3GGLnEKB6SZ3aDy9hS5ouvtseUR4FmzTei7wkea1tzNoO3eSZXULGj38Nj3mCydBHFxgrSvtYcQzo4wVzKsmDz0lqfcfXEAsQR/ylB+xoNJlRhx508Ca1EZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Sok95GciyzUvGBtrlehOqwsOaqRKAHTLKsgerOv8MWY=;
 b=rTNj0TWKoMG4Y4Ze41YwszgnKO/1wAdML9hMcU70gF39WCMaQVdcO36bD+sEAy0MeojdGfOj8OT+W77VPJChXC8xsdB3fgUy//7Q7xa+GLsshQjscVfDLv6aeY0XMiKBg9V5fbcd400A31pNo8EZuYSYuozWI8z8/PMdZYudgbT/71PGYDXMOcPWfv6jfPlGuJvPqfXGrApwE9x/KWCCoNbGn31NX0d/EnarAMM/Y92FtqJ00Z42njJEnlMeu6EPL54E2VE+6n8rVITulzVCv35IjnBNJL1JBQFyFrMCBW2yQY96aULSvjFPKoduV9mgljkQ1giEoUWm/FnfD1GjeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sok95GciyzUvGBtrlehOqwsOaqRKAHTLKsgerOv8MWY=;
 b=w1DZykypTunsxpZPX+7z5dL3bJGLNIOiyFewYm+JiJWJpSdDVuxYCRDRXRl6r4DoVcofeXAHF3QSyvreBJDJOU7ugOTkYHVZMuBeoymdcb/3HFz8VgJM2rEUPFB7LyziqT3FrNzY951RxuwlfwZ48NfPvbeJ+JE25Qm1vOLhmd+ehs7xu6D7t9FDnqxu9zKP52PHrswj1a2wSsDTvk9RNT5j3bCx0qMacUL3GMq41jYJPNeMhCI5XD+KyytcgTCYx3vRcI3tC06v0vmmk2/Wjg71p7SmSkFrg99f5cRaPYlYrnDWdZbETv8IJdjsRN2J0kHJ1tM72Yib0sBED2g/oA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by DBAPR04MB7317.eurprd04.prod.outlook.com (2603:10a6:10:1b3::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.21; Mon, 12 Oct
 2026 10:06:18 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0496.020; Mon, 12 Oct 2026
 10:06:18 +0000
Date: Mon, 12 Oct 2026 18:10:52 +0800
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
Subject: Re: [PATCH v6 09/13] gpio: mxc: use cleanup guard for
 pm_runtime_get_noresume() balance
Message-ID: <asyyLJ3nOUxJ8TKq@shlinux89>
References: <20261011-gpio-mxc-cleanup-v6-0-cb47ce2ad758@nxp.com>
 <20261011-gpio-mxc-cleanup-v6-9-cb47ce2ad758@nxp.com>
 <CAHp75VcktnQVpqLADs5AccUj6U7KLjAatPaSzMX8SXDrbbs6Ng@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHp75VcktnQVpqLADs5AccUj6U7KLjAatPaSzMX8SXDrbbs6Ng@mail.gmail.com>
X-ClientProxiedBy: MA5P287CA0024.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:179::14) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|DBAPR04MB7317:EE_
X-MS-Office365-Filtering-Correlation-Id: 9cd57fad-be64-43e5-dfa1-08df2848752c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|7416014|19092799006|11063799006|56012099006|4143699003|261009221227099003|261009223027099003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	LCWp5LIRuRkhoqSDDiDTrmBcX/VQY+xsK1LLHqqYBZrZF5BVgw7EXsL2lQmQ8cMak3bRftAT89BloGLalmklRP/XwY/lceiJqn4DXu7jjHrXWXIqmE9r1uUkVC+yq+g0xy1uft2u/3xeiuwbS+465yv9DhvOZziobXjKXxoDLNmQ9a4pi9DhQpC3xSBjJD0hMZk4Nej39i3IbRchLPYe8WwKDTRv0eKw9kLalBlRJz0R2dnLH4UcYk6mWRjw15l/ap7yBW8uiCbXc/k5ub70UZRfFHV9xnb34P0/G2zvnT7LLh0LF3ewlRp4a/hP9GIsTu7KptewFpv5/OKRItuQaI1SGBGEzBzRmHuNz0xr4MC0Rp0PsdIX5APzdOo7BdZEi1wDSB//dxhnYcV95sOVPGAatK50Eor4o3SJ5ieMz1iGwWFE4vGo5viJld5T4L7AXrtkE+aeqRcB8fW00r+WNrW2jcWB9VDNtL0mQhMlfEtF2Ob84pLmzTmZqho1IMEFs8eqtw6Gd6nZyk2BAdRipQe/jOD967e2t4X4TCJTrXeWj1X5hRRGuD3KTNs8znMWnvUR6YLd5a8InV25gvLF/Y7Tq6c3iNZjjW8bUpc0f715Q/d0bDQrEYJVCsXuoKxUiM2Uu54Y2kR7EZedbpC0QyXJuOtfxm1wWZmU42TUBQY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(7416014)(19092799006)(11063799006)(56012099006)(4143699003)(261009221227099003)(261009223027099003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UWZ1SEpTZDlUOVJEcWR3UEVYb1hhcUd1OU90L2dXRkdyUk5WN29YRE9PSCsw?=
 =?utf-8?B?WXlqSVM2VzN2dGlzWGhlK1Jxck5Vbks0amh2OFFYWk9ablg3OElzbEEzNHJS?=
 =?utf-8?B?YnI4eFJjY3VRMjN4MXVHaVcrWnZaVGFMeXRFT2lmMXB5VUF3VUZIN1dEam44?=
 =?utf-8?B?TUgrMGdRVnBkUU9haGl3emFzY2l4V0hicWhFYnRKYVdocVdHcktuNi9FOFZ6?=
 =?utf-8?B?TnZqemkvVlltV1RFc3NCdXd3cGRVMnFFQkdVcmNIcnpDWE9ucnFNSjFPTTlH?=
 =?utf-8?B?U3dsTWcwOTZHaWI2VVEralQ0eVZXSmVlMlZ3TEhHcmNpL0tuWkVHNjRxWUJs?=
 =?utf-8?B?OE1GNEF5UnM4Rmh0Y3V6MDgzWjBjTmxFV1k5SzRpNmMzZmpIank2bHQ0N2Ns?=
 =?utf-8?B?SDV6aW5PdWRMWSszclBMV0ZlRGRyK3hWYU9DR3oxbXBSeHg5eE1yTHc2QmxF?=
 =?utf-8?B?RFAxK05wYTZ5UjNJUCt4RTVyMVkzeWpTeldXM2FacStFWmVRLzdTQk9VZXMx?=
 =?utf-8?B?WE01SUdVdlAwblBySW9heUNQNFo4N3FnS25ZazdlcXBqQkhzeHZFQkJwblpu?=
 =?utf-8?B?UkRkQks0R1pQSUwwWVh2c2U1dlo4WkpVT1JLRm4zc25pVTU0WlVOWGltcXho?=
 =?utf-8?B?TzE2enM4ZjczNnFIUXR3U1pXK1hYUVgzK1JEcFFudkhqMWV6WlFYUy9tem9I?=
 =?utf-8?B?endjZlA1QXEzT3lMY3JrWlBsKytNSFVTUWluMWZoN0JCZUx1VWZIemJrV0d6?=
 =?utf-8?B?U1lEYnB3c0pGWmF2M200MlRWY3dTcStIb1FBdEFJMkRQNHJoVmlVUkpvd05l?=
 =?utf-8?B?V05oeGJ2YXFoWWZJK2FxM01MVDQ4MzQwRzgvckJHSC9PbHBwajF2UTJCR2VR?=
 =?utf-8?B?N1hDNFRCcDdBdVJKOTVTUUU0SWR5aWZsVUVwTmh5U25qd3pHRjlHRjJlcnF5?=
 =?utf-8?B?cFRwM1lVbFJVcnRseWkzOVdrN3JUNGwwVCt5cTFONTRGcHBiZUw1K21oaDAv?=
 =?utf-8?B?YTYrTjc0K0pWTG9iSFlHL3pEN0lPY1V6TStPOE96dnpjTGtKcHg1dUxCVVRU?=
 =?utf-8?B?MGZIRG03YW1wMW4ycUtHRnVlZGJxbkppRmlnaHhDTmVJQnBmRjJIek5oVVp1?=
 =?utf-8?B?dThDS3Q5QnArNzZKSzBmNm1TVk5MbGg2UlRqR01aUEVkOWd4a2paczhBOStG?=
 =?utf-8?B?TU1nNTErbGszLzlncFNuS2xrZ2tSV0tocXFiMk1RalpZWGJMY2hSY0YvQ0J3?=
 =?utf-8?B?MzFQT3hvRUUraUsvdWNyWFlYUDh4bjlaSmF5Y2xEaWNuRHd5N1ZWSW1veG9Y?=
 =?utf-8?B?cXRaV0U2dzhXdmhrNGt1SGZNUS9BRnY0Rm5tZTRHNmkzZUpkM0VUV3hXbzh5?=
 =?utf-8?B?NXdyMjBSVzlNRDJIc0ttZklZM1VITk04Y1AvS0JISXhXa241TUJLUGpvZ3Mw?=
 =?utf-8?B?ZExnT3g2TTFNWHVGNDVTM1N1anI4YzA5UlZnR2lvTDlhOW44My9EeHJVNDEv?=
 =?utf-8?B?eGJKYUFYM0ZacXJlK0h0VWtscVJ5MnNnNnNTUzFEamo2R1JRS3BSdndLTEp1?=
 =?utf-8?B?bVpZSGxPelhvOGRvYmtTaTNpREFQYzBPV2swQ2l4UXJyQ3pyWEQ1TXhQdUov?=
 =?utf-8?B?R2ZIWXZuVXQ3OHN4bGo5YmM3Zk4wNFNyZmdSdWFuQ3BSZzJ6RGFNQmo2dlhW?=
 =?utf-8?B?VmxrNWp0V3Q3VlhxUEIxVUQwNGY1L2ZSYnYrbCtxRGpabEtJL3d0U1hyZlg5?=
 =?utf-8?B?Tjg0c3I4V08zeC8zK1VXQ0lYQ2wwcUJNdk1Bd0szeXpLZTJNaFcvdnU4YW51?=
 =?utf-8?B?bjlzUktuSktrR0V6Qy92T0tsdzYvWkhTL0VMN3k4RGgvLzd1TGI4ajVZd2Qy?=
 =?utf-8?B?ZDhHTnU4dU1XajBkSFpsTmhJNHY5M0JUbzZYM0tqb1pwSXBDK1lYanpidnJS?=
 =?utf-8?B?TE0vOWc2L1UycUUvN2k5NElKZS9tSDRVL0ZkczN4Vnk5T2pabFF3eWlJaHlW?=
 =?utf-8?B?M3ovS1h2emFaTnJrTm9Mdi9iMXAxUmVSTnVnRzlNaktHU0kzU1hQTnc2SXVv?=
 =?utf-8?B?OHprd3J5eGxoMDVzcDBTcjFZcisrYjJKRUZ0VTNzQXRqUnhsRmlIRkx5K3FQ?=
 =?utf-8?B?eUlRR3pxNWlQamM1aVF5SEErblozSVUrSzYwTzU5MlJLb1VNOWNyakl4Ykl5?=
 =?utf-8?B?WXowK3luSmRsd3lPVjlncWxWTnJyL05yOHVSZnpHZktESDhkbnJ1Z0RJemJp?=
 =?utf-8?B?blYvUnY4bmxiR2ovbE90RGlpMUFadTN6OHYyZ29ickhmRmZIYjV3T1ZNa1hX?=
 =?utf-8?B?WU9DMENCM3QxQ3hEeGhZL2oxZ2hmMFZxK2tLK0w2amtSdlllNmVERUUzOGRK?=
 =?utf-8?Q?ACqOLjrM3UMdzTdfuGlRNrg2FnlhX2I1n6hpU?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cd57fad-be64-43e5-dfa1-08df2848752c
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2026 10:06:18.1586
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Aj6ESxe7C5yxxwWyKDIkoOtcPLKgIZjG8o5QkrfdGS3DrKc5Ff3WiX6Cl4dqB+l10x2PwUOB4XhVdsEFlMjpRHZUzXSbBA1bgV2X6NEItF5+jFa3JlLKhll/8W5Giyof
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7317

On Mon, Oct 12, 2026 at 12:38:37PM +0300, Andy Shevchenko wrote:
>On Sun, Oct 11, 2026 at 2:54 PM Peng Fan (OSS) <peng.fan@oss.nxp.com> wrote:
>>
>> pm_runtime_get_noresume() in probe must be balanced by
>> pm_runtime_put_noidle() on error paths, or pm_runtime_put_autosuspend()
>> on success. devm_pm_runtime_get_noresume() cannot be used here because
>> its devres action (pm_runtime_put_noidle()) would fire on unbind in
>> addition to the success-path pm_runtime_put_autosuspend(), causing a
>> usage counter underflow.
>>
>> Use a __free guard to automatically call pm_runtime_put_noidle() on
>> error paths, and disarm it with no_free_ptr() before the success-path
>> pm_runtime_put_autosuspend().
>
>...
>
>> +DEFINE_FREE(pm_runtime_put_noidle, struct device *, if (_T) pm_runtime_put_noidle(_T))
>
>Please, split this to a separate patch and move it directly to pm_runtime.h.

Frank raised same suggestion in V5.

I tend to avoid introducing cross-subsystem dependency and use a follow-up
patch to move it to pm_runtime.h

But since you both vote for pm_runtime.h, let me separate it in V7.

Thanks
Peng

>
>-- 
>With Best Regards,
>Andy Shevchenko
>
>
