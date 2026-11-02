Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.65.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793663297;
	b=rCPKEZAe10S9Mi8ZVk+sFvSTpjhr74+k4dLsUeySjj8z6AVA1Ongh+C9TWc61UX7jiHR
	 jaNiJgMVOHZehAMXoh1vZaDYDGt6ZtAchEmbZid0s+UgCs4zvl5TefZRi72VdpGX8bEyx
	 Nm7dTX0Vw/zxmZ/8Nd7KW1//IoGHbDARRyQy29jApEpsxMbYzxOtPP8StrIh05/jlJ+rO
	 7RAbFZYgULJQuZLSN6vLvbRRFSGQ8spNbPo2xWBnXBkA0umLrw8vBjZU5dfaAhZ2RzzHR
	 ihFsDbB30uCJpIn1tU55dsfR4FtrdVakEXF1MOJH/huM3OHqKtkT1eEWXck3eJA9LCA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793663297;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:Date:Subject:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-ClientProxiedBy:MIME-Version:
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
	bh=e6tZSdUEGsIKyxMSzP2oyxFWhN2xNuA7nwHhPPP1ZaE=;
	b=XYGPexrO3z7CPjFKHH1mg/P3XczrihjoXnGRKPJyL9m8HKKxRJ6xdURYb0Sd8qIUbKTk
	 EIlIjFHdHtbj5Oh/amoqjTAeK5l8+W9bm3Y79L9U+hPuGTyc0/qKRqYBXvyj+r2jeFW5A
	 cpjYg5JggNlCkqZnJXDWRV4osB1lESV7AS/OPrzvvrJ1LkT8PNNlHBBK4mtCZyz18N0UN
	 H5b0xMlDnHjRhL8Gn9d+26HKjX+w5T5otdHbPSvabp7D42i+Nb6CzaXxjY9xrFgl4qF6F
	 WwbOmkip6ZGblIfe5Aaeu+PJ4ucvbnyF7jMQRWNNx4TgmLfxzIy+6xBF+9ZzvNRMmlA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b="x8SKFp/R";
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.65.48
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011048.outbound.protection.outlook.com [52.101.65.48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BDD8606D804;
	Mon,  2 Nov 2026 23:48:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4BDD8606D804
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=x8SKFp/R
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=phKvnobnfn5j1IrJzbzg2CAafM87uKQzOSEaVJFSKk6R3WO0ZktHn4XQ+y4ORwDFeqH5IM3pDj6+FcTihMHf5w6L7p+BxkKU4aMPF2qHv8m/9Dl2/A0bwlSPwjP/WCbib9bRhNUfagsJraRDy+w2QUg3oeE8OEr9OSTLyHi//dmh3bAtUtDSY9Q4shiPjfxDX4CLDeIpL27sqyG3AHDlUpSc19ELqqWLL+vpVLWXeSicSE2l/Sn6uO02aFRiuuxGlLZ8vJ8e5527EfPzMgoqix0tNs1bSR5GHePTtKd9MfaewWESUrar5SjHPX/kGyepWHDC0SKQFEV+tUfST7br4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e6tZSdUEGsIKyxMSzP2oyxFWhN2xNuA7nwHhPPP1ZaE=;
 b=jK7nwiS7LTDgE/Xmkbva1Kzokb4p1H7bLWlGiyEd7+XW3POwBaEQwnru9yyDEzNMTaT4FlRFiiKAdUswG+5CJ3Hnlgkz7mwxavjlDqHdMqOb7frZb047EjOo5fMbLYFpoqWJfE1rztKdGBA3bLHMClhVLBerBZFlnUkzyw4dbgUzaJ4SN+v2FiWGOTFnvqwfkJrpExC2laKeIUjRqq2Yl2MPQ6v0vUl+zcpTMTR77jGagIGRQbjFbfbXHNw2mBBiXgpe7Xmr/pydxJ9RbE4jXf/56Irh4X6gFqqvMBkBvDTnbPPB474hOUW+8165wM0XVE068C+zMfSmBSVpv+xesw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e6tZSdUEGsIKyxMSzP2oyxFWhN2xNuA7nwHhPPP1ZaE=;
 b=x8SKFp/RsuMP+os2Q5bQ8kK3zQiXTjz/HEuHZoQCrXnEGyh/2gmQS0xHVcU6xldC2FE3PHZXKbIGGWeC9abSt99E1uIpi+ApXJqii65jh5VsC7rfW9q61IZVs6djWvpE9S8FfuDUeAt2NAHXxyAoTPpNhKCWLOUmFLyctz8ZRFfSxPnFCdHN49mcxK1kQlQup8Hl38OdzkumuGUo24VdxbYtRPzXSXfYY5jQQ0+uZQ3K2RBEcvxHgEbN4QcU0mTejL2vDycEcfHMMJat/KRLdOrMP4ZAG/RDoCcO6rV2os506pNQqDQDwr6nPnmo2KQJCILy43Pfgl8tIFR9GzIkow==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by GVSPR04MB502304.eurprd04.prod.outlook.com (2603:10a6:150:71b::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 23:48:13 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0569.011; Mon, 2 Nov 2026
 23:48:12 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Tue, 03 Nov 2026 07:44:11 +0800
Subject: [PATCH v2 07/11] arm64: dts: imx8ulp: fix gpio clocks
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-gpio-vf610-fixes-v2-7-7c71fb36e184@nxp.com>
References: <20261103-gpio-vf610-fixes-v2-0-7c71fb36e184@nxp.com>
In-Reply-To: <20261103-gpio-vf610-fixes-v2-0-7c71fb36e184@nxp.com>
To: Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Stefan Agner <stefan@agner.ch>, 
 Dong Aisheng <aisheng.dong@nxp.com>, Jacky Bai <ping.bai@nxp.com>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: SI1PR02CA0025.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::13) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
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
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|GVSPR04MB502304:EE_
X-MS-Office365-Filtering-Correlation-Id: c42db5ad-f0e7-4c66-8324-08df393bc1ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|376014|23010399003|7416014|1800799024|10067099003|22082099003|261102123227099003|18002099003|921020|56012099006|11063799006|261021121427099003|261026121527099003|261021123027099003|261022075727099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	os+gOq7c8VyFmE5R0x0ntmgFrp24WLrGcj7qvUUCk0RFuXieRaMlcdZT9HHWfuVvxnu1fSDxs0jOV94ISkkaigUsaLLnz9yIhJevHLdg3BxXa+OsCKT9UaZlquToGMyaQcn+Gdw708tLPbgvXrOqG1XPevC7tLc7baWOYw9IgpXr1gS4IVG0JLdo3mGnLurT/rnJmQmSafMgiHjjjwZJrwnAQ9j944RUsQVgWqU5T9kRsuaqRL4b8vmdz6HHEYhRMPdTUVneLkRQg1IymjRQpAZGU+dtl6MTpwP8mJIG5Ig80ESvjIh8A4axKIqrXunFKMQTSVwwCJ9RfMtpCUdnksnAcPmaYDttEHFQdjrKO1Wbm9yQ5Y7SP9HLk/0jUPjYdZLSSKK/V9nq+T7P6KD9cgun++aY4ggxk/OP/dVNhiKtQzbeexwo8oFeG51HqW8i20xE6YZkQasGuWlv9MHdig3fm7GINVAS/wJ6LjX3hodL0woV2qaaOqstYkgGB/ssQaDxVxeFT4DWnxjAVmpChRRJH2UO18F9a++EMRn/YSnnuyReMIjSY1ZWTMjFq+g9RV/AmW8Rt7ty3yH61v4iH6ZGlHbtrU3fjKxkZhFnKTunf+QOtV1vcvoc71F9CpDH8Idb/jOru9so3hA0w6qqhwvNWV3hh+B4hIZKLa0leUUEawLZX6AnGj/tySa+xI/BLEVNd57TBdw+o6I+wSvJFA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(376014)(23010399003)(7416014)(1800799024)(10067099003)(22082099003)(261102123227099003)(18002099003)(921020)(56012099006)(11063799006)(261021121427099003)(261026121527099003)(261021123027099003)(261022075727099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VnFLTitWWDJsTUt6VnpSeTFzZk9rWEZzVE13TGVQOWdWanNmTzJLZ05ISnR3?=
 =?utf-8?B?ZWtNNExKeWxoZFJ3NDIvanZiVnMxTFJqTlg2ejJIcGJ0eWMxZ3BadzlhbFhQ?=
 =?utf-8?B?NkZXa1NLdDJGVkFJaGorR3czMm02THA2bkJmTnhqTUQ2UDl3a2J4WFNxV0R3?=
 =?utf-8?B?aU1qd2lMcjVHdXFEaFFMclVWaDdJN3Qva2VCK0tyUnpMUy8yM0lWUU1tMGwr?=
 =?utf-8?B?MEZYTFpWVVhMakVRYkVvSlVHdUgwcmNLR3JiZDBYWkNuNEI5SS96V3Bldm40?=
 =?utf-8?B?ZzNTWFg3QTFNT0gyb0JKNVhma09oeTJqOEJaNFR0eFZPK1RRMDh5YkFzMWhl?=
 =?utf-8?B?V1VCMFJieXg5OG5wdDhneWZQTFk1UWJ0RFR1VWJtYnRvN2t6MThmRzg4Wkh0?=
 =?utf-8?B?ZHovd3czY3NIWE9yMmdKeW9RS25rV0xuOHllL2RZMlZXMWl1OTdoMXFjZUFE?=
 =?utf-8?B?dGVsRjdKMXhiQkg4ZzE1VC9XdHRzM2FHVXBFUHZrUG9FZnBZZ1BtN0M3Mks4?=
 =?utf-8?B?WVcvL01zYnpkdm1YZGZoSloxNjVSNUZaR0NYUGlGTkNQREtBS0NsbC8wbkd4?=
 =?utf-8?B?eHo0bmdoNno1YVpsV0VPeUlEelBOMkhZMFNYT1FERDludGNaUEF1N1MrZm9r?=
 =?utf-8?B?TUN6NCtTdmlEWUR0N2liN1EzckpPMTBHOXRZZzBzYkIvZTNRakhoRkRCRmxR?=
 =?utf-8?B?TzFXaXZ1YzhJMkFiemxsM0gvZkJSRjhJb3VBQVI5QnBQNS9NMVk3RytLMm0v?=
 =?utf-8?B?YWJWR01Nd0RxekZZdVExSVVCTDVkSXVXTS9KVFZwZnd0allKWFEyNENZU0hN?=
 =?utf-8?B?bjJwbDcyVHNaYzNJVnJGM1pXWUYwM1BjVENHQitTZnJrcUNMdGpFTndqZW04?=
 =?utf-8?B?TmxEVVZUTzJEZ2Rtd0VnSE5kNjhRWC9sUWZueEIyY2tuNjNpSFRZT0dPdnpY?=
 =?utf-8?B?dFlYNU5DdTk3cVV6RHNkUkZSeXM5WHhSQmhxd1pyNEk2Z090c3plK2Q3T1Jy?=
 =?utf-8?B?WGNCclhQVGc3M3NaQ1pxK0xFMml0bytLNHFtamk5dEFCZGFic0JnTnExcm1w?=
 =?utf-8?B?ZklkNGRlMUk0R2IwbjlZN3JKbWFFcjh5VE1yeFd0ZnFoeXJEOThjWXI2ZUVh?=
 =?utf-8?B?Q1ZqcFEvYW9xdEpIMmR5RnJQRjgxRGY1SGNpSDVVTzA4SUM1ZnFlNW5Ta0xQ?=
 =?utf-8?B?eVpvdm5ya1BaT08vSE5KRFgycTJQbGR2ZmgxbWNkREFkS3RYT3pSTUxCZk1s?=
 =?utf-8?B?OWFvMVNFdWw2OEZ4Q2g1SWJoTXp4aDBoRjBiQ1M2U05TWW1rWEVxQXN5REUr?=
 =?utf-8?B?anRNM2VWM0Y4TVd6aDZLNGJFVnRGRzJjRGlqcVlacUFLZHFRdktuSnJ3QkFn?=
 =?utf-8?B?dFhsNWtPUC83cm9XaWhCZXZLMmswclAyeWI1RzhSMXl3emVvdloxcDRxKy9q?=
 =?utf-8?B?ZDJHcVhvR0dhVFk4S2p4UVk0MlNxaEo4aDNkVGV1SjBaamlrMDF5WTBGcVlH?=
 =?utf-8?B?UWo0cXdhTWgrcnpDL0xLTXcxM3F2V0lSUEhud2liY1lVdXI5NFFDK1RPSk12?=
 =?utf-8?B?REIybEQyRkhlaHZFMGFFeUM1MmFXcG42MWZ5YWpPVmo5aVBUWVliemtyV1BZ?=
 =?utf-8?B?bGNsMVdlNVFXY3NjNE1kUVM2aWxUZlZ6VVdBam9JdExEbUlialcyemlQRTZZ?=
 =?utf-8?B?dG85SmZZR3pqdkg2Zk9EL3BHWEpTQTVHaFVrZGE3Q3VNekFVNUx3QmhITmdm?=
 =?utf-8?B?OHZwUGMzaGl6MTUyemRkVjNZVzdWUGtiZS8wMFN4Z1RNTU9GYXc1OUpPd2Jy?=
 =?utf-8?B?eFFTUGM3RVVtS053Nmt0aXhoU2E3VVRtUnJxbzVGQzlvV0lmaC9zcGk3eWo2?=
 =?utf-8?B?UnN2eWVUL3drS21Dek85MkRxRHJoTC9CN0hMNGpFRzhRblZ3ck1wVTdNSlZh?=
 =?utf-8?B?b0V1S09mRjhMdHQrMnlmekx0TU1RQWJPejlkbXZaRTdzNTdxb0FETEJlR21E?=
 =?utf-8?B?WGRxSXNRZEVidzRIL2ZDUFlUM2NqM0hZR3N0WnRBaDJjNUdmL3FXU0YzeDRI?=
 =?utf-8?B?cGF1NXV3c0JxWnc0NlhiLzVpam52cVFWSkpDN3k0T0ttNE1EVXZiNjFPZ01N?=
 =?utf-8?B?VjV2TmVsTnc4OWxlZ2NhT0gvZk1aVTY4UUNSYVZ5M3V3K2d2cjROVU5QaEpx?=
 =?utf-8?B?TjZHMk80eWFXeUV0bWhabTFnbW8yeE4ySjFYUlhtTWNudkZXWHFhSEQwZ3FR?=
 =?utf-8?B?MFpPYUN0TVBXQnF1MER3OHptMk5zdUxuMnBBbDhQWk5iMjhjdXpUbElPaEll?=
 =?utf-8?B?ODcwRGlrdVJIeVlTTURGYWJTTlV3Y21Bb1JBVXRHNG1sMzIrNlVzT1lVRFE0?=
 =?utf-8?Q?oA8r4YH4KCIUvwmINGcL720R2ivxmoVwbpYvE?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c42db5ad-f0e7-4c66-8324-08df393bc1ad
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 23:48:12.6213
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PRkpHKeg4zJGnjyEEWB8/wG+iv4VEoUZ4QWJm6j8fvrtFZvdInr5L4O5IrNot0jrZQ1PSQ9TwILvtM+HfcMWgP3/qOVFdxWTSrMKdDo5S4gpnsnkdN6enIUCTlDAIPtK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVSPR04MB502304

From: Peng Fan <peng.fan@nxp.com>

IMX8ULP_CLK_PCTL[E,F] clocks are actually clocks for PAD digital fiter,
not for GPIO. And per Reference mannual[1], 26.3.5 Clocking:
The GPIO module receives a single clock, which is used for register
access and synchronize external pin inputs.

So only drop the 'port' clock.

[1] https://www.nxp.com/docs/en/reference-manual/IMX8ULPRM.pdf

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8ulp.dtsi | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
index ac8293f81c6b..b8006bb6c942 100644
--- a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
@@ -739,9 +739,8 @@ gpioe: gpio@2d000000 {
 					     <GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>;
 				interrupt-controller;
 				#interrupt-cells = <2>;
-				clocks = <&pcc4 IMX8ULP_CLK_RGPIOE>,
-					 <&pcc4 IMX8ULP_CLK_PCTLE>;
-				clock-names = "gpio", "port";
+				clocks = <&pcc4 IMX8ULP_CLK_RGPIOE>;
+				clock-names = "gpio";
 				gpio-ranges = <&iomuxc1 0 32 24>;
 				ngpios = <24>;
 		};
@@ -755,9 +754,8 @@ gpiof: gpio@2d010000 {
 					     <GIC_SPI 132 IRQ_TYPE_LEVEL_HIGH>;
 				interrupt-controller;
 				#interrupt-cells = <2>;
-				clocks = <&pcc4 IMX8ULP_CLK_RGPIOF>,
-					 <&pcc4 IMX8ULP_CLK_PCTLF>;
-				clock-names = "gpio", "port";
+				clocks = <&pcc4 IMX8ULP_CLK_RGPIOF>;
+				clock-names = "gpio";
 				gpio-ranges = <&iomuxc1 0 64 32>;
 				ngpios = <32>;
 		};
@@ -994,9 +992,8 @@ gpiod: gpio@2e200000 {
 				     <GIC_SPI 128 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-controller;
 			#interrupt-cells = <2>;
-			clocks = <&pcc5 IMX8ULP_CLK_RGPIOD>,
-				 <&pcc5 IMX8ULP_CLK_RGPIOD>;
-			clock-names = "gpio", "port";
+			clocks = <&pcc5 IMX8ULP_CLK_RGPIOD>;
+			clock-names = "gpio";
 			gpio-ranges = <&iomuxc1 0 0 24>;
 			ngpios = <24>;
 		};

-- 
2.51.0

