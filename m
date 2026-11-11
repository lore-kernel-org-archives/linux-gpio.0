Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.69.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794429283;
	b=JEnmXg10wpVnAVT6QtI9InHf42gHBWs6kf7lqHyeqsjFxmpcXzTXucYz8REGhwXhrozg
	 cxSvM/6HTsSCoZl8SlUGjA2bnu8VY5R6PTiPtrJ4uAlQUSIA0uLjwTXhTGul/rwJU6xgb
	 P6WYxWAaBepZN79x8cFyusnS6pDK7Yi7Hxm5FOY+AitSucgFHOlxKMTmLtLygsA4NbHVC
	 mWX7mNZcFROi/DgeIB/v/4QCNB2428elGb1T5x+U4udKEYxqhawx7ViGz9ZDcezg2Yc31
	 g8tEK+B0JoKOYG/m7akx8mnKj1GCcHaytU6/igGBtyMdKUCSVixfOYKXS/Vv45p+7CA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794429283;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=OTd81QmKGgNO+JXS2jLMytzgm+2YlT+9DmllzUvzZsk=;
	b=jET/hxZKcm7djpaIJcAdQXrdvOAbe1U6cMSRI2ME6ZoekAhwRNmudPlwITQH82EAe8Bs
	 pPlPSDgnXXl9yemsZuTxg7v8eH41EDQZ7x6MDfQS8ywhJ3Ir0tcrrF2BqK3jyz71pYtkn
	 xfPz70QPrtvwFdoL7+vLB0ZYptTfrZPw9rdxufjmJbU1+RHBukKIjb/LYB/svGb8hpM6I
	 png8NoQ/U8AGSR8+639Od4iUd9T3rMwcAhauWrkKtYjH+/4XVtV4VvYj7KXLTDAu9Sx55
	 K9s4X5MnSzfWmaWSxwWiXaJsi1fabDnzNGTDRUlD59LKeQFaUZ8gwjMCBApOJwhwlaw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=eNahN4Dm;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.69.52
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010052.outbound.protection.outlook.com [52.101.69.52])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D851606A32A;
	Wed, 11 Nov 2026 20:34:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D851606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=eNahN4Dm
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ahjcSg6DpFysIKab51SmymfG6ghBf2pPQgdJV49V65fP6f/EgQk7US3iTG/zfkCsjnVSOeBRl3OAlf2hDJKUZxWOBPThAUzgaoPN0/yCa5+auRiZ0q6pcmbk5ZbBaRIoWgCMTnNygbxF1riyClfxorr9J86iydc/GbRq7H3ZuZT2Q4n5dTh1a9PwkLl3UdSK6zt6ghuvMfIAY1qXDL8MQnn3BaxB0SaUIOCMD75KoCNMvT+MWaSbcS0/OHJokp8k5XQohkvgsGv+nqg5+7UHnXYVYr070IOwrN7+aOEZxRxP4radzG0VbHdow8viqTlZHVB6AfN/kC9hoZGK4rxWeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OTd81QmKGgNO+JXS2jLMytzgm+2YlT+9DmllzUvzZsk=;
 b=VIyVl2egbEPiN9wX3z+TGPHHgUf/Yo0t8kTKa6XoFsqiB9A15tYs3ZZmyx8PtQY+NNvJ4hRXj5WYvw7KpJDHFEhu2cB1xopa6P6euNcGGvOFUf+XxoM/Jia2JP2gTYq0q0xt6XSIm22Bj/WMR+I94fA5jgOLCJgWUWIh89r7YKeWU6g2YSzybM7yElOdxAYWmmPCWhxBVO8QzKLEW+trBGet0obYXSH65FFeG5VTCDiFLsMzyFccFXOQo4GaIxPbd4gujPkKdKhl7Rx8u4e2oPUzwA19zzE3JAuxGwSnWKz1blf72nyZ57+IY8dd4+MqJbLfnPQprgz8U9o8LqDjCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OTd81QmKGgNO+JXS2jLMytzgm+2YlT+9DmllzUvzZsk=;
 b=eNahN4DmrpN3jzkHNzqsBHl1iF2n5MbrrhZ8GN8k/imV84/Otwulz7WU1VW0XbeQ/ShyQ2pVL4hNUKhKyq73Idk+tRwNYP5I+V4T7b61at7JljvclHLGsvQwdgAjSTiFn3yWIP4ckkAKcGcFyXZMNVoIhqz9QFj9I4hJ6FEOF2/MuXKAB82kkVZKS7eMzO/LxN9oWDUYlwWZy8kjYbwmHavcnOko3OQS45xeCFEJs/Jvp+gzyUQOHnAcSVfSd2NC8tbWbbKdEZapwrGwZuzLNKspjx5nDnEiEHlwcA1PJz6wVkF93ovZjkcJLNEd06bH9XT+rm+UpS+9oV6wNmlb3g==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by CPJPR04MB921366.eurprd04.prod.outlook.com (2603:10a6:380:20c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.9; Wed, 11 Nov
 2026 20:34:39 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0615.007; Wed, 11 Nov 2026
 20:34:39 +0000
From: Frank.Li@oss.nxp.com
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stefan Agner <stefan@agner.ch>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Jacky Bai <ping.bai@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Peng Fan <peng.fan@nxp.com>,
	Daniel Baluta <daniel.baluta@nxp.com>
Subject: Re: (subset) [PATCH v3 00/11] gpio: vf610: fix clocks and misc cleanup
Date: Wed, 11 Nov 2026 15:34:20 -0500
Message-ID: <179442924260.3894326.5558028825122561735.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261105-gpio-vf610-fixes-v3-0-504e19de5ad5@nxp.com>
References: <20261105-gpio-vf610-fixes-v3-0-504e19de5ad5@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH7PR17CA0065.namprd17.prod.outlook.com
 (2603:10b6:510:325::9) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|CPJPR04MB921366:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d5956ca-d398-48ea-019c-08df40333515
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|7416014|376014|23010399003|1800799024|366016|18002099003|22082099003|3023799007|921020|10067099003|261026140227099003|11063799006|261028144727099003|261022105027099003|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	jfpverJoGpcLamiVQU9pJGpNfz/CRnqgrVHLJaZBXPR6WPxQkvhKniI96Bac5oJKPsVeMr89hLnAKk5CQv++3BstTdyRnQQ7uPThoVPXxPLwCrAn1e2qC9Fr75+AbypdDe/Uw73KXzcAlITzykyJtTKqLxWsW5yYD5J11waKdJZs19clHkkUWIKM7H8OksOKolpDvUssQR3NSWM7H3p/GO+Yye5H/bZlwzuhrxbzP1N01tTRrNkUgdaK550G8WlOonVXoFMzija2/Qjmk8Pqvf0xmzlV3Etj4J5pwgOtoKmK/ma0suiLfM16RKyvKj9+GHEAuS88x3xsnCO6vZkqRRQbQiEE5p5oDWJr+QTtGU3ORCYCnh3FMt6dadNeIcR6SXoSyyuJY3uzT72L0jkuS4wD5vBXbDiSnFTh0e3hy2jZfibgqtVe13cKBPjqJjJ2Ee1ib3TRsfRhcCcfRkzjduAWXZLJYU+/hREeoxoS3V6hFz3Mfzu5/i9ZViQHOV+3xndf2rQrANYWRLewimKsrpS8gknF4ic1Vo+nnwjYE+ChlI5Rhvs0kU2X7/g5vH2XS64C87ymx6i+3zpZFolEr5f1oWaDqG/pOeVfdWHnzbhV1z4Urs+P0okDsT4YOhQcE2GvfAbGFSAOqHVYhtOVJ+qyuf4ANR4/HmIdGIisWvtnWl8/YhQ6DXedZr5d7sb2FWHlxqNALbkiN2zhjIsLGQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(7416014)(376014)(23010399003)(1800799024)(366016)(18002099003)(22082099003)(3023799007)(921020)(10067099003)(261026140227099003)(11063799006)(261028144727099003)(261022105027099003)(261009223027099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UGJQZXI5MGJ3U1BDNXJnSFk5SUVMUjFVclFueHNaZEgvUW45VGdxRHl0ZGRl?=
 =?utf-8?B?Rk5TNisvajNFWGd5NUx5cHBsalVabzIvVGgzV25tMnFEL3RSU0lpL3REZUdz?=
 =?utf-8?B?T2RjMkxFUDB0WitCKzBrajdLSWtKcEpzRVJPZEhkbzEyU1FQcEIxYnA0NkdP?=
 =?utf-8?B?UUZrY2FsYnFPemRuYnlFU1JGMXpXQXRhN091c0ltQVF3eDhaZ005TExjUU5h?=
 =?utf-8?B?QmRIRm94N1ByTnlOakRjUXB4RklzU0haQ0ZhaE9lK2psS29rM3NvcWFxeHV6?=
 =?utf-8?B?UjYrQktLa2dUUzRmQmZrcm8vazlMcXZzNG5LS3NVelVGRHdPOFV6LzJYQTBi?=
 =?utf-8?B?c1kyZzBmamZybDV3UXl0U0s2MDJ2Q2NKVmVGYzExamNrSi9HeGdsRXVUcWdi?=
 =?utf-8?B?Z3JXV2VBd1pncTNDYU9Cc0FBSmRnY2E4S1FjYzNaUmRvZFhqREZxUWlwaTB5?=
 =?utf-8?B?ZzNsUlpiQTV3L21pVVdMc2FoL2tIMnFoM3BBOEpod0hhUUpiMG9IV0lLTTNm?=
 =?utf-8?B?OHlha1Yxc0U4VWxGaXhqNkl4YklJZ0p3NUF2WHRJcjRJa1JGa3Nkc3pmdG8y?=
 =?utf-8?B?QjBaU2RwV0hPQjdrWDBlZ0MvNjFYbkU1RStvblZwK1A3RnRCdjVrbXlqM3VJ?=
 =?utf-8?B?QTdacUc5cnlUdVkyT3FRZVVzL0FNZWRyWEpvVnJBai92bmlkU0prY0ZNdmpM?=
 =?utf-8?B?Z25NakkrQmpyMzk3Mkp0RGgwVEhEZit0eXphOXA0bG5YaTZUaVhnOGREL1hC?=
 =?utf-8?B?ZXhsMWtCYTdmNTl1aHQ3YnBFUzNtRmp1c0wwSExPaFIrNzY0V3hIbm5FVlo4?=
 =?utf-8?B?M1ZJVDdHUUZKN3RiVFl3YmVNQzBzQkY1a1l2a2t6N1luNUxycHpXTzUyWGtC?=
 =?utf-8?B?WEZjTUVEU0VsZTBOM0lKcW56SG5oS2ZFeFFtbDVzeXB1TmN2RjY4bU1VUFAr?=
 =?utf-8?B?VEN4YnFKRkgyU0FVa2hpMUZtdWdrQ2lwOCtwajZCMlJNSjdMaU1sbTB2YnFv?=
 =?utf-8?B?OHVvVDhQQjBSU3Q0eERyOGhkOHZtQXk1MnFRS3RiUzQrWjc1aU1tRGtQWWF5?=
 =?utf-8?B?THNkcjJHOWR2Wkl3VTNsMDQ0Tk5FdmpFbnBSYm8xWFNIOHMzbGZpNEpRd2tJ?=
 =?utf-8?B?eGlycXhWT3VXVlRCMlZnZS9lcXQ1bGwrUUt1c3NraW9MOXdYZUdoSmF6RThZ?=
 =?utf-8?B?dmdpeTgrQS9wa1k4bU9YdW1ZUGlKR2lQckgzenZ5b2xldEQ0NUpLU1hMSFZC?=
 =?utf-8?B?OXlGamoycGdMZWlBS2NJRzVuY3JhbGU3ZjR5Sk9vQ2hqRC9WVVJzY25vYmVl?=
 =?utf-8?B?SGdDZW52Y2V5eUtSdHpPZlU1SW5ncHJlcDlHdFdmZnhxK0RMZnFycEYzdGZH?=
 =?utf-8?B?ZzJNeEswZlI2T2htc3FaM1ZtZDh2UTMyUDM2K1R4K0UwYk40YWxlb1p3YVpS?=
 =?utf-8?B?SlVzbVpraGl4b1VqMVpFWHJDNHZrQlgxQnAyYlY2ODZaM1RRcFlScnNTbXhq?=
 =?utf-8?B?VjNSUDUzY3pPcDZRNWVZcitiaGcvWHVYREZtTkFhV202RE5KQWZoVk83QWY3?=
 =?utf-8?B?SE5RYzlCV0V6VDlHL2RXUlVsZ3lHeDAwbFN1RVM2djY4ck44WUk2V0pPUjZK?=
 =?utf-8?B?dmsrQlNPQXJyM0trakxXQmpFcWVRbUN6OUV2STRHbEo1ZFNZZXl6aFozN3RZ?=
 =?utf-8?B?TU9MaDFyRWJaT3NjV0JuV0NyZHNpckpEMkk0UElVSGNnVmRjbU1ZWTRTWFU1?=
 =?utf-8?B?ZElNWmZQblBqcERuZlJPTzVweDc1eHlzUjhWSUNoRVY5NG10Q1FDS3Bta3ha?=
 =?utf-8?B?RFllZWVYcVQ1U0hPazBhYlJ6MzViaE9qTGJjMEhySS9xdllkNWFnM2drRWh6?=
 =?utf-8?B?RForZjBydldYa3NCcXpPcTc3N2pXSFZad3c0d3BGUUFTUXBVWXdUSHBpNTY2?=
 =?utf-8?B?VlNIZlphKzFOdzJXTGttV2FjQTR3Ym8rUkthU25FVnNGNWdCVlNHNExRTzlv?=
 =?utf-8?B?aThpd3BqeExhVXZHR1lpMmJUMEVuZ0tYV0JHQitkU0FrNVBpNVVHS0tJWDdn?=
 =?utf-8?B?eFllcitkanJMcC8zeHZPRkt2elQ1ZUJqMitINUdMU3lwZ3Z1Vk9RQXRveUdh?=
 =?utf-8?B?RWZ3a21lNC9yU0hNakpmSGtCSzd3RTJGS0tKbE5RSnBxb0ovR0JUZTFhYjI2?=
 =?utf-8?B?YTZmWUNsSmdjZVNlM04ra3FSQ0laS3VKZFhaMFZqSktoNHR6MitnRm1YY0ww?=
 =?utf-8?B?anAvbWh0bDdmRjVnaWd1RSt2Uzlld1hpQlE1WFBIeHhGdXNpTXU3Vkx6ZjBI?=
 =?utf-8?B?My9KSVBLb0lSR2F6eGc5TnlyR0JYTVlpQlJiTVlvVWlSTTBFWjF6NklHU3Rp?=
 =?utf-8?Q?Mc8XCqccxJtyDvThBC70bGIGpwTmo5wtuxVmv?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d5956ca-d398-48ea-019c-08df40333515
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 20:34:38.9122
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 06fcgax+YMtzlCY1579p4WUBzDhZTfS3RPH4z5GAeBmekZCwO5+U2BbMVy5GJuc/3n7RutMK2U1ztvGqls37ZjtWCbIYZKqnbfr5sNKllTKUBg2zw/44BRBfSJTTDFGK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CPJPR04MB921366

From: Frank Li <Frank.Li@nxp.com>


On Thu, 05 Nov 2026 11:52:58 +0800, Peng Fan (OSS) wrote:
> Per i.MX8ULP/93/95 and etc reference mannual, there is only one
> clock for a GPIO controller, so drop the 2nd 'port' clock.
> And for i.MX8ULP, the 'port' clock is for digital filter for iomuxc
> PAD, not for gpio controller. If we need to support digital filter,
> we need to add the support in pinctrl driver.
> 
> With binding fixed, to avoid dt-schema failure, correct gpio node for
> i.MX8ULP/93/95/94/952.
> 
> [...]

Applied, thanks!

[07/11] arm64: dts: imx8ulp: fix gpio clocks
        commit: 2348a61b825d9d2519f89f08294e118ed8b33236
[08/11] arm64: dts: imx93: fix gpio clocks
        commit: 3667c33a8da759ccd979c130ada285f2c71b54df
[09/11] arm64: dts: imx95: fix gpio clocks
        commit: fac954d758aa2d2d6c35b48c052ba753f06f856d
[10/11] arm64: dts: imx952: fix gpio clocks
        commit: be166b98288e613f1e63fd39547c5caa0d0156e0
[11/11] arm64: dts: imx94: add clocks for gpio controller
        commit: 7e90daeb6c8d10bd008443451f48a7556f0f74bb

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>
