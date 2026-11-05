Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.162.24
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793851037;
	b=Ib8hAajY7CcZYCuiMm/TQXaX9gBclJSnjJBfRV8l/BzEpABBeEPTZLTbBLV74AHbkVqs
	 ivqw6nwPXL9M/rcj+roTRorJH30/9nB3mfOUnFj7mhteIYXX5N5C2BPhRil3iEjfBAk0K
	 35DEAzbbdx1jrTEMKsvJva4MvVnt5g7qBAeLVxGnq/fduvIrw3h1rtwhaZLDAZNIzs5rf
	 xHorHydXRhZcbH04v0S2pr2gKPAENRmZ6+81E52BU0I4Z+eLq34+5f89480hRNsKGuAbS
	 U9cn1D2FQfK2os8ojcsImId3aksHqqsnmjJKN3zFDxOGfUZ7dgH97cRo+I+9sR7ABKA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793851037;
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
	bh=9iRvSuwf6mJVTWpR529GutK7+dWh/wKMGBnvBidJn0k=;
	b=Rf5u9hyjZTeE1rXJLDT7qGgK0Vsp76AlsPNqiGCwuCMylCdoptDEO+KWw9Af2Wx8Wd1q
	 GECvYQCBHpxZz4ohfRfMFd3yoU95E1NgiixJMx8Dv02/o+CqkrwuJP0MrH2lqanEl/hoR
	 XPngCE2Scm6LD2p4I0fbLuNbYv8Z92jy+tTwlMHF/AzmzA+dZ9xi7kTvqyBC7qNYzTA/h
	 l1iBK/uWs/UyVY5V1EuS4zTE6bDnJ8eoPfYp5+gkxWYTeJwJ+fXAYlwypS/PBgds4M6IY
	 a4AO7dw1W4MGTt8RJbrynBhuNjLBl4ga7zlwbhyt6QVRyVKNTGQHIG7OqT8xkIttcJQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=rp5d6k1b;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.162.24
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013024.outbound.protection.outlook.com [40.107.162.24])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A54E606A31B;
	Thu,  5 Nov 2026 03:57:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7A54E606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=rp5d6k1b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t+o2CG9LSTQ1Y8WZ43snJZJdwoI52bx4HKknA0QlycqqyykXMORYzf08uSdc6mWUBLkY/dFZZeSfw0GiTgw4Gr1s3Ac2FoOAKGw3aJSzdQ23AncNYy/0P0f3FFOZe2oq1uSI7H3ivDDu1S/tHoHm89MDSDVoJihnBLH/Suzai8i8hSf3tEe52OpDSSwsWWcGxOODdnS5258oRjxgtxWXYGbzLVHieewrjqTgF0DLIv3PIKKJg5BBXdAW/fGTrx0aBgZyzEyQFKGx7bO49lmMo99qL2xtdWMjthLGDH9vS5aMk7jVYm0OfMHYndT1RpqeRAgK2pQKfaW6mt6SvNO+5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9iRvSuwf6mJVTWpR529GutK7+dWh/wKMGBnvBidJn0k=;
 b=Ew3OYnGrYOvJ18sQz01de5z8F+J61qFlkjEtUMvlCBMgfr6LQwBoAKCi4dcZkJvbxWMUEXBDd2aBI287nHp3blcOm1YkUhSNdeoCd7X7q4+kuc+/eP/PUzEBBMV8txPLlhcrXeMhKr0LTgYvr1P77otYpFSTIo6iKzREhgh22i+Mn1de1RdlXqEWtmsUmLd9mffSBw9V4YW72wXdSMWshSDNtnULkFJAaw5Or3mb/cvQYtnU+x8CLo3LT7mnZUvAUvQuKbUeJZHS+H8uZeeWmPKXVCRfD0vMPWQ+JNOo59jU3PZQ7A8zm+TF6QtXbupGoDat+HLkNdwd+qfL36QPmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9iRvSuwf6mJVTWpR529GutK7+dWh/wKMGBnvBidJn0k=;
 b=rp5d6k1b0/WymXVnMesyevXjwEpKhiPxxURmZZ4EwgZeS+4JI/kNHnmrpNCoTCFVTpnawyaCneHjgOq7MJZ/HxUMOsN6m+C0YaTy9N4mLIfp2z54jkXqgAYp3B+kYLl7tLHZSepUx921b7gUI8BAwyJPhNLez29Ybxyy7o94X9lOluzf32tNP8BlEWiEJVXrpI7gpIZBe7a9QSO8ZEX4Me0Bz2Ft+SUuGq8kvWcoznRrRlbYLZkuj5v9yg94gMi9SwzaEFYkfjS+PTr5Bk3o+UXCsGqSGNWhtS7eazgrcdpwdaERk1u8721qbuthQP2WS01xn8VjyIPUz0WCH5hsGA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by DB8PR04MB6922.eurprd04.prod.outlook.com (2603:10a6:10:11f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.9; Thu, 5 Nov 2026
 03:57:12 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0592.009; Thu, 5 Nov 2026
 03:57:12 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Thu, 05 Nov 2026 11:53:06 +0800
Subject: [PATCH v3 08/11] arm64: dts: imx93: fix gpio clocks
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-gpio-vf610-fixes-v3-8-504e19de5ad5@nxp.com>
References: <20261105-gpio-vf610-fixes-v3-0-504e19de5ad5@nxp.com>
In-Reply-To: <20261105-gpio-vf610-fixes-v3-0-504e19de5ad5@nxp.com>
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
X-Mailer: b4 0.16.0
X-ClientProxiedBy: SI1PR02CA0051.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::6) To AM8PR04MB7874.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|DB8PR04MB6922:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d60fe51-c77a-428d-6e5a-08df3af0df85
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|23010399003|376014|1800799024|366016|19092799006|921020|11063799006|56012099006|261021123027099003|261021121427099003|261009223027099003|261026121527099003|261102123227099003|18002099003|22082099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	RucRL/eKgAssLp2eQ2GXcJyAAn00y0rCKsmWHPeYKhDeNlBrO/GN1RLY1rAsncm4jQTo6vtzYF0LC07g0T08qrSCuBA+pHMG4L6gXfSPeC3CVfUgQQDjZBNfEWm2OV5f+cFzxl7JPTTS0GiV02wR9WPfZlXFFI00LuoQYfjy/IpPe1YJE0SABFj5Q72dnnqG0B2BD2D5XC8BrH/p8wSKMVhmanLW5BWYrerzYEuodMb1uEHQZ/zPElz7g7NxTWsPn1+D6cTneLWvG1p5qhZaCcNrEgQGMUqOOBoXDptlh916LNFE3Fk8j1whxKBmQKsF/jv7DsvddDSte6s1r+2zoBKu6MlATM14yKaN8y5+QwRVr+n5paB2BFktx73cHiaUVm9ntIwbYVGN/4rCRnM/3kdjPVYMZhANrPpfh4tH2TjhnHrZooKDl4JlSckH/YE+ICTYM5++HeBJzcvcWdZriKjaKDsmnks7UTJrIkOkRNpq1jXVTN0NtysghE0M6G7g14PrxwRDV5YBGxwTP0jMae8lmB0bTfDM2I/Y1Jl52lx4M3on1AFPnlw5QH6iQ8UH5eem/Rcko06h+a+OLrk9zoR9iz7B2wZwA4PPullnPcDxeYp8HkePkRT8Hsegce0UWB9s3FjfkaksYQCmSpFGWtZcRO3Lnvy1pu6QBvGrmWL8Gj4z2/iWqEEDDpht6wAASQZOewal+BOs59FBgLu30Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(23010399003)(376014)(1800799024)(366016)(19092799006)(921020)(11063799006)(56012099006)(261021123027099003)(261021121427099003)(261009223027099003)(261026121527099003)(261102123227099003)(18002099003)(22082099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dENvMWs1aStYQzJBNG1WTXB0UEtpelk0Uk0xTjkxOUR4SWtoYW41bWkwQm1N?=
 =?utf-8?B?WHJsUnpOYjJncjhsMzhWSHpsTE5HSG4rZzJ2b0ZCYUV1UUtHSmpmNFl3dkdG?=
 =?utf-8?B?QngzY0JUVHpsSGFCdTN5ZUducldHYzBQcHdjbmVnOUJ6Y0Z5eWtVc2hkb1d1?=
 =?utf-8?B?YU0zbHJqc05ZbHNRbWNiL0xhYm9JblJYT2tUK1hsUUlhWmhINktQanRWcVpX?=
 =?utf-8?B?eVJTNXJMSStTM2Rib3E3a041cGVJRkJWc3B2QVI3MEl6SmZBckN5WnFTYzgv?=
 =?utf-8?B?Z09Cc2E0VkRpM1ZHUklOWWh2blVHaVhnZW1ad0NGNjNvRnUxOGxvVEo5S1Zy?=
 =?utf-8?B?WjdyeWFZZStlMVVIR01RaHQ4eE9SK3FpWWp6RlI0OGx0Rm9QNUpSNU16MGdK?=
 =?utf-8?B?OFZrZGMvQTdoY1pTalFRNmRLRzgwYkRVWWxLOVhYSlhva0t4Z2V5anBTTDJk?=
 =?utf-8?B?ZnZmd3F5ZWk2MVc0MXdJY25YTmQ2ZUxpTzVJSTJaZDByTXRhanphN2pnbEdT?=
 =?utf-8?B?TUFyRDVtY2N5MXZnUTFGQmkvUGhQbXFlN1RhZWRML3VjOHI3Yk5HUG1IQ25t?=
 =?utf-8?B?WThsTXM3UE53VlBxeHFBVmw3R0taKzB0bXJnWENiVktSOFpOd3MzM1BURjdj?=
 =?utf-8?B?bGM0YWFJZzhmZ0tRbDRscjlHWDhZeHZIODNXNVI3Nit3KzcrZlhoeGhRS3Zn?=
 =?utf-8?B?QktnNWJsZXVyUFBCTWs1b1lZbjd3MVlENlNUOE44bGpPR3REOEhzT2ltbzVH?=
 =?utf-8?B?Z25ndXlWNmZ3dUpPRjA2VXMrTjZWMmtDcStIUVhCazVBdFZjOHJvMFNjRklL?=
 =?utf-8?B?UUYyMGZEc1ZCNUlnNWZmZDdWWHFHdE1MbzRYWG5lZWRmSWVDLzZkdzI4L0hz?=
 =?utf-8?B?K1cza1FxRi9LUndtVGlJR01hcEN4ckJpU0lnVEN2RnZaUWoyRmNueHZybW55?=
 =?utf-8?B?OXY3WXpoN0ZrTWcxc2pPNGVWK1BXbXduZXc2UENlM1oxQkM1eVkrNVgyL2F4?=
 =?utf-8?B?UFpBMnlSa2V0VGdPd1F2eTcrSXBaYTJnN0QyNmpGTENmK0ZSc1hSWEhmaWZa?=
 =?utf-8?B?QTlJU1dUNGt1cHFlenFKdXBoZmZtbVVCSFc4UExVV0lVSUI2M1VXcjJRcTd6?=
 =?utf-8?B?S2ZzUHJKaGU0blJmcFNyaFg0Qlh6SzZTT1QvNFR1Zlp6bG9RcDBhTDExV05i?=
 =?utf-8?B?YklZK25ya2xUdjlRZEpTc1gzTHpNRTgzeVFRVlRJbE5LU1FCbEdOdTR1TkhS?=
 =?utf-8?B?S0dsdm9ZcVR6QlVHNjhhQ1FDendhc3I4WFlGZ0VRdHRtY3FwV1NhS09YdjJt?=
 =?utf-8?B?YW45L1Mvd1ZXV0cwV1V0dlJyL1dGd2tubktIdmRvWHJydkM3YUJHbWJQT05p?=
 =?utf-8?B?UGJydXJGV09rQlc4U1FUV1BYQktqekc4U2ZtNlp4c3QrdUp4QmF6MzRycnR1?=
 =?utf-8?B?cFFOWE5TWUtZREs3SmY3WVFKWGdyRkhJY2NPaXpwTGhFZTc4K0h2VDdBK3Rx?=
 =?utf-8?B?T2dkV1dBUDlzSFJZd3drK1E1VTAxenlvbW9rMGtUdjJ3YmtXNTFhZ0sraU9o?=
 =?utf-8?B?VHg5QnpybTJqSGZmY1ozdFJncXdWdGJ5SUtHRFQ0N29LcVZEZytuN2pwVldq?=
 =?utf-8?B?WTIwcE1WaEd5V2UxMEhraGpHUUZLanpoT01uQU4zL3dWUXZwN29nblFFclI3?=
 =?utf-8?B?TXZXS0x3VVJFa3p3RG9Kd3dDOVU4eFdFemFTemhnRVNLUFpCclZ0dm1QTmFL?=
 =?utf-8?B?eUJ2WDE4bTFQR2M0YnNia3JaRXdvTkxZeWoxYUphSVRRYlJyWTZ3eTVNbXlN?=
 =?utf-8?B?Q1dacGlMaFBSVk9heHF6NUorTEI3SEV3SUl0Z1JBMk9CUERXblhqVlFjUVQv?=
 =?utf-8?B?R1BscVFKOXJIMEJBd1NoOUxqVHBRVlV0TjM5cGJZUi9Ec0krbER6SU02ZkJQ?=
 =?utf-8?B?cVQ3WnJibE9YNEIyaEozRnZLRlVGOS9IMWllM21BTlpIbFpWSXVrZ2t4QVVW?=
 =?utf-8?B?YndhdjRHa01uMEZjYnhqbU5FN21sSVRtaHNJK2l0L2dpYUQzV0ZDUkUwT1NY?=
 =?utf-8?B?SHBrQmpwZ0JsNlZyN29veSs0a2pUcXlwMWUyZXBpQW91ZFB6aVdhclJSa3ZU?=
 =?utf-8?B?RTU3Vi8zMWlTREJRUm1OcGozbWJyNlVOWWVXZEdrREg0RG02NWZDaWdnSXIz?=
 =?utf-8?B?emJCYmJUZUU1NW9WT0Vma0VPd0ZTRm90bUQ2RERYWE4wUnpQYW8vWk1OZmk0?=
 =?utf-8?B?ZlovQlkrVXBuNXYvcTNXV1FreHVrbnA5WnNZcjRKSVZrOXRHVm9KcWdFWmFS?=
 =?utf-8?B?WXc2UWltbFB3RUJFTHFFNGw0YlFCRHBxaFJzYzlESTVFSm1UaHJYOW1MSXBJ?=
 =?utf-8?Q?AqXj4wGvylXEqcDXFI3QffjMMmj/ktuu8YETg?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d60fe51-c77a-428d-6e5a-08df3af0df85
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 03:57:12.7764
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KjaYUrhnzmBteDI5/u/Siv1p4WAZWqX6ymQX3mCxQLLTl7uOlvivL3DHDa/degoiFiApX8vWRgu9KVat9CWMoVffPF4W9Qb/nHqBx1UgGHLpOhEi7XE+mh52Q9Omh0au
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6922

From: Peng Fan <peng.fan@nxp.com>

Per reference mannual [1], 28.3.5 Clocking:
GPIO receives a single clock, which is used for register access and
synchronization with external pin inputs. So drop the 'port' clock.

[1] https://www.nxp.com/docs/en/reference-manual/IMX93RM.pdf

Fixes: e41ba6957139 ("arm64: dts: imx93: add gpio clk")
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx91_93_common.dtsi | 20 ++++++++------------
 1 file changed, 8 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx91_93_common.dtsi b/arch/arm64/boot/dts/freescale/imx91_93_common.dtsi
index a68ffd04ee08..cf73dab17637 100644
--- a/arch/arm64/boot/dts/freescale/imx91_93_common.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx91_93_common.dtsi
@@ -1034,9 +1034,8 @@ gpio2: gpio@43810000 {
 				     <GIC_SPI 58 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-controller;
 			#interrupt-cells = <2>;
-			clocks = <&clk IMX93_CLK_GPIO2_GATE>,
-				 <&clk IMX93_CLK_GPIO2_GATE>;
-			clock-names = "gpio", "port";
+			clocks = <&clk IMX93_CLK_GPIO2_GATE>;
+			clock-names = "gpio";
 			gpio-ranges = <&iomuxc 0 4 30>;
 			ngpios = <30>;
 		};
@@ -1050,9 +1049,8 @@ gpio3: gpio@43820000 {
 				     <GIC_SPI 60 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-controller;
 			#interrupt-cells = <2>;
-			clocks = <&clk IMX93_CLK_GPIO3_GATE>,
-				 <&clk IMX93_CLK_GPIO3_GATE>;
-			clock-names = "gpio", "port";
+			clocks = <&clk IMX93_CLK_GPIO3_GATE>;
+			clock-names = "gpio";
 			gpio-ranges = <&iomuxc 0 84 8>, <&iomuxc 8 66 18>,
 				      <&iomuxc 26 34 2>, <&iomuxc 28 0 4>;
 			ngpios = <32>;
@@ -1067,9 +1065,8 @@ gpio4: gpio@43830000 {
 				     <GIC_SPI 190 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-controller;
 			#interrupt-cells = <2>;
-			clocks = <&clk IMX93_CLK_GPIO4_GATE>,
-				 <&clk IMX93_CLK_GPIO4_GATE>;
-			clock-names = "gpio", "port";
+			clocks = <&clk IMX93_CLK_GPIO4_GATE>;
+			clock-names = "gpio";
 			gpio-ranges = <&iomuxc 0 38 28>, <&iomuxc 28 36 2>;
 			ngpios = <30>;
 		};
@@ -1083,9 +1080,8 @@ gpio1: gpio@47400000 {
 				     <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-controller;
 			#interrupt-cells = <2>;
-			clocks = <&clk IMX93_CLK_GPIO1_GATE>,
-				 <&clk IMX93_CLK_GPIO1_GATE>;
-			clock-names = "gpio", "port";
+			clocks = <&clk IMX93_CLK_GPIO1_GATE>;
+			clock-names = "gpio";
 			gpio-ranges = <&iomuxc 0 92 16>;
 			ngpios = <16>;
 		};

-- 
2.51.0

