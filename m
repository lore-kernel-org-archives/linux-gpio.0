Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793663279;
	b=mmGCxcCKwrIRv03aRsMKnGsbyH362C7awcghAxfZJXbL5aLHIPNUr0bPyWVZw0qERO6H
	 +YU/52+sfTH/6ZKmW9hirg/BmPhV/ENzq+7KIWVas9Xzgcnu/bI9vXZQyY+Azs/6X1WT7
	 iQEZwNZCaITP6SAB4wkeY/TTpOsBbkHnvDp/lGDf5jZQ8cvt03urhDBi3OUW5GKYKsJEy
	 yQM0CO3+gdzqTQBvX9EZ0wR1Hd4yMjCYuBQQAA13ANazuF8IHYSUhUUEruglvgHP2/E+I
	 1jhS0/CIgfedMokJG79ert9uSQsW279BC1QrpSd9Gk0K5oZohGTdD++8JN9NHiOo3vQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793663279;
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
	bh=sjy6vYvXFNTd6ETR5xtpTQMVgsNZMJkwBzP/ZTHQ08E=;
	b=VridRM7j2WjQfYoFXqX9jk7exlheuvXJkGMR/K4ABJDFhkry4szO013baJvjDoJ+JBGG
	 ZJw+NQyUNsS7yvJiy+akqAJDm7De31BZcyY5LCvyCGgV87/MnSRtgMiNw6TQpirPfvl8m
	 oZlqT2URBAFwCYVVR31ZhBGrSG7WmGPMICL48yqRgq+Naelrr2S2/MqNaFNSZt/o4wDaj
	 meRKoFfBJf5zObHzvkBQBSNZ15/6LWdpobu+2LWb6xLyUTtMo8hasJRZGLAmTzguEi9cg
	 azw/hQsUv0UVpppsY6jmrfki+vnMuLFXVlVKu7I6XeZLt7eSGEz5X8DR6dLc3eZnSJQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=WBgc3cFO;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.50
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011050.outbound.protection.outlook.com [52.101.70.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C089D606A333;
	Mon,  2 Nov 2026 23:47:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C089D606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=WBgc3cFO
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rra5EftqwWng0qrv1gsX1pvtygSqi4/Jfz6J9vWH1SKTWmRESgEJFfoWlaby3qHycG0pYC40sxkxZ9x5Zef4Y37zEMSY803ECECqcKDJyWfDCKWWZ+odQggOgh9c5APsCuj2wOSSBhpFsE5gMTxzGDjoGeYaj6eyhtlxE4bCKBL4evhxSfk78V5QdHsU3TPeyb/kSDC6uqPJRvcxwoZvVNbkswvdlNiDTx7DomL8m8yiP2Dz3B2/OJJNbfDU/7QuHGx0iN0baQ6GqSYsVpQkOPCTW4YtQNaZWPFuEhPIs1WTtNR5CcTX3hdwZJhSZOccUvSVPPJfJw/kjdhJ6t+hPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sjy6vYvXFNTd6ETR5xtpTQMVgsNZMJkwBzP/ZTHQ08E=;
 b=jRK+ERCqTfqp0NhVdWI4R47KcxNNi+EEIbtbCxBk8/OP0wsZ13PsSXRwiLC/1h3ndrWRJ3lEpHiRidU2c6nxI1iphUo6kR0goIEEbe53TJyJEkjyAjqVpe7w/he8NRnjoz58ISwwanjYXtlfMdffNDMNDKEKRuITvwaau6HhFXnvPs9q5Gq19FlEzle5Pspy/t8cCKwEItfRKtMis4QhUCbRaW5UBbISvnQRPSfWdvNVmJ/wqMN7OOMM/qK5w9ZOB1YbTC1DJfyJpbu7sGbTAvCDW36sGe2t/lP73EZbXqJUVaoyXY6yEimqYuelIVjOJ1bY5FyRaBfbjbQQ9GYgZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sjy6vYvXFNTd6ETR5xtpTQMVgsNZMJkwBzP/ZTHQ08E=;
 b=WBgc3cFOYLdzkmfT5Bttr85VKSv0BIl0zj9RozrXezQ7iy8OBqqI2xk1WRSVY2zdW3IjIgA2FbCFdx3QsaPGbdtDW33q4Tx+mdPevtlvx9d5wahZHZuXigTPqZH46n7j16QRqrVtrXFjisvgp4v3Bh7VDcxsmLLWA4sGY9NWRbfnf7+R5BgzQ4ZfE0uzVHUNHwPJ3JLIZY8Sg1CGkSFoPwQGuxKHNYVska1SSvu3CbtoIWpOSGQVejkEWNKjCvC028d/6voyb0eNl+Ww1vZJDz1OJVNEGoYUk0lkNpcFK9XGfdc6nuiTVQmE/wu5euWz8NLaR/YXUkCsTXDizasGgg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by CPJPR04MB458518.eurprd04.prod.outlook.com (2603:10a6:380:10::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 23:47:55 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0569.011; Mon, 2 Nov 2026
 23:47:54 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Tue, 03 Nov 2026 07:44:08 +0800
Subject: [PATCH v2 04/11] gpio: vf610: drop unneeded header
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-gpio-vf610-fixes-v2-4-7c71fb36e184@nxp.com>
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
X-ClientProxiedBy: SI2P153CA0034.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::17) To AM8PR04MB7874.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|CPJPR04MB458518:EE_
X-MS-Office365-Filtering-Correlation-Id: dfbfce64-4e76-4723-8202-08df393bb706
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|19092799006|376014|366016|1800799024|23010399003|6133799003|10067099003|22082099003|261102123227099003|18002099003|921020|56012099006|11063799006|261021123027099003|261026121527099003|261021121427099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	bIa6laJnG6P3BJ2F6+IybJaNy3+kLfeIAWXzG8U8QAobW+D82UVwpcNIvzk7xsP7K+rOdL5ayWUktv3CVMifC8dduUVhMak8FjL5TmcYtI38l9ag7Qp50aj14Zruy5wG15OQaCepMxtdlinx7X6hILknuzlairrCMZAY/XpQXUPcWP6xLSlxGRcydOApR3PvfskkE99iW097eH5/bm1H4M5KdbsZgja/DcEixwzdFlzJVeHWrQR8vhtQOsPoNSNG3Xtqc4VK7xAm1Z6Ou4F2yFSRoHYdqhnymt3k/LcCq2NHcxItHV1ZLszuz9aGuYfBQi/BTh60/gcTH5nzygNZjJHLsRRp8sr9kQw23fLiG44sCBVFjehCBXs4Vaxo3hOH1YBbxgNSb9tT8++iwkjTcek8SyXEe+N2Mwwl+cAguA5GyzAGhIzgHMqDEHWxwkI+7JXL1mGmTraEgfdOMvcshebmmzSaOblVImKO7YhL0VFnf+cwpiiLpOwgaEXjPWNgOMngRu6uxRZjqeaL790GQvnS8K4/6RKSEX5HTQf16Tp1zQOosYOzsmVOKFgfh2CWX/3H7hTc1XyR4slren8ACzXHOdeuaZ9skVMdekzrElSnAYnNxV+MsK+yZNuY88BCV3To+9CmxA5B19fFpgFmcyYsTVq3nqoZ2J5LqKY11MwlMBB3qqXIbyCN23ZQCVVtuRYTZHJdTYFzZ755lN+pVA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(19092799006)(376014)(366016)(1800799024)(23010399003)(6133799003)(10067099003)(22082099003)(261102123227099003)(18002099003)(921020)(56012099006)(11063799006)(261021123027099003)(261026121527099003)(261021121427099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?blptckw5cy9xMmMzNW1wREpyR1FHSVYzdThFbUd6T29QcVFJQkl6NVRoQ0U3?=
 =?utf-8?B?cVRpUHRmcm9vemthN2Q0blpTTVdhdnZRb1B0UXJ3N1MvUjdtTERMaWJPTENF?=
 =?utf-8?B?Q0VuUDlCRlVRSUVqbEhTaUpyTXRvSW04a3NCd1VvR2VyRWdrOWFENlBzZFZu?=
 =?utf-8?B?TUY4STRkSnppK0lKbjAyb2Q4R21nOVNEZXNIbzcrYlF2SmtCNk83bmo2SG0x?=
 =?utf-8?B?RXBHaEIzcGR6UkZNTUlrc2hGLzBFTkp3MnNBMXdPR2w1NDU1M09XUTZSSHlt?=
 =?utf-8?B?WTVUcjJpY2RqL0tNYVZGL1hxQm4ydjJ4U1h1cTV2dG9wY3BlMG1pNWZ6SVZl?=
 =?utf-8?B?R1pKTzFSVkZXWG42aWU2M0dkMk5XdkJrM1IveG9rNHR0N291bGYvTkN3b1Z2?=
 =?utf-8?B?WklzbDVxaXFOcUYrRVdRYzRTeWNnT3V0T3A0bkFEOUtoR2ZVSjJlNGQ0ZkJH?=
 =?utf-8?B?N3lTZ1AvZmdRSUdaTFZUbGg1Q2tXNmxteUJ6MGRycnFKc0xJTlBhVFFId3NP?=
 =?utf-8?B?VEVVUHE1NUZuTzZ3ZFZvSzlyN1owaHBkUXpkTlhKKzdvYWo2U001VGhNdWV0?=
 =?utf-8?B?VTE5ak82WVVDQkxyc2ppcG94ZFlkREg0YWJEelF2R2dGallBdFNHNWVFU0JC?=
 =?utf-8?B?dnVzNGo0SDNvbzFrajFPdUkzVklOcldQQnZTVTF4WGJ6RXVYdDlyMWFQcS9Q?=
 =?utf-8?B?aWlqU1d4STBaWS9OME01NUV5UndIeHFUaVJLOUxJUTJud281UEMyL29zVWwz?=
 =?utf-8?B?K1FETlNiZ1pzRHFkcG9seWtYQmtGTWdZWmh2QllhWTk1RUdleHF4Uk9hNEpr?=
 =?utf-8?B?Ty9Xa2R6dVBRS2o4cFNlbEJuN3dzLzVSaUQ3K3lSOTFpYzVsRTdsKzk1dW5o?=
 =?utf-8?B?aVUwd3RXaFg3ZkxmMzRQdEs1VDBjSnY4MVU5SnlmZ1dkMnFtRHExSkIzeXVD?=
 =?utf-8?B?UStrd3ZNWXhoaHk3MCtKVG43WG9DYW5ZNkx0aEJxalRvdFFiMFplTk5QY1Uy?=
 =?utf-8?B?NlpQdHZGRml4a0VITU9NRm52WVNnU1IvdVdYa0JUTzY1TC9rYU9HMmd5elp1?=
 =?utf-8?B?M3dOcGVSdHdWNjhCSXRieUFhZkQ0dVpBWkVUR3RHTnRYdnBuZmpyQnpza0N0?=
 =?utf-8?B?Q0lRdUdtT1FNYngrL1VoNGRjQTh4aEQ5eStDTWJXYkdQMlVIa2txaDIwMFhr?=
 =?utf-8?B?UEh4Q3FibCtmdjUwYWtwakYzeWoyVjg2Q1l4b3RFMjQwUlNmR3pyei9XRito?=
 =?utf-8?B?SVRoaVdlelZIUVVDMlgzSSs4Ly9mdDZRUlF3RTVsb2tnSHlGV2c5WFhiVUx6?=
 =?utf-8?B?RmNNcjBpTXdSQ01zWlJCZ2NQZThYaFJ1NXB2TVMzeFZzdmhmMGJ5R2J4NFQ4?=
 =?utf-8?B?NmpQVEM4cURIMmk5VlRjUEN2Y0JvaWRhMDJvM3JiTWJKY0RvaGtMUy9YcThr?=
 =?utf-8?B?NzhyREFLcUdQUmdBMk1kYWNSVGRiMUIvb2NEMENrM2JENXY5NUVteUpMYWdP?=
 =?utf-8?B?aXlwSHR2c1FsbU82ZU1VcXUrcE9pZlJnbnh6RGlydHJWN0VnNGk1VUg1cUlP?=
 =?utf-8?B?cWRZbHNVNmpHdi9HSGh2aXBMajJnejBkb25IdXlRZCtxUVIvTzFXb01yaldD?=
 =?utf-8?B?aXBPTExhTWpHUWJIOTVNUlplTEc4VHBFMnd3WFZXVVh2Z2lNRDBuZGhEQ0pQ?=
 =?utf-8?B?ckZyQjJSQS9pVEFRME5ZLzN1UGZwbFZZdVNScUErTHJPOTdzTWFTWkRlYkE4?=
 =?utf-8?B?N1Y5RTF0d2w5NnplTi9oZTZ4b1hMQUVxR3EwTzNBMklOV3dONFVVMXRtNGk4?=
 =?utf-8?B?MmVGKy9GdXgvU2N0UXg0bXpoMHRxOUlkbVUvMHRteXhTb0QzeVV0dWxFaGho?=
 =?utf-8?B?S0ViakVCT3JVSkRXZ1Nyd1FhUlZ2MmNEY1ZrUU5mQXZsMUhRYlY3QThrVlp6?=
 =?utf-8?B?T1VHdVFyODYrVXp6WjRJMnBXUHpSN1VheUFYREVPTkVsMi8xT1BkMkwxV1ZU?=
 =?utf-8?B?T0JVbXRqTWV2SE9lOTlCK0l0QlZIWlo2ZE5ZRGVBSVBhdEthQWlGc2xpVnND?=
 =?utf-8?B?NVFMSGZyVVQwbERNbVMzOEdDQ1Ryem5XU2ZxMlI4SmJSY2xjU2RHTDFOZzVz?=
 =?utf-8?B?MzgxVG5leDBURDIxNnM1NHhtcW5EUXFpNWdvVWZ0V2ZoS3IrdzJaT3FXNGk2?=
 =?utf-8?B?S01IUjZCNzNTMWxCNGFZZGxrc1ZZTFB3SHYvV0tETE9HQkpkUUxHOHpibWcw?=
 =?utf-8?B?TXhlUnlZaENvSGlYMm82cHZyRXhzNGVTZEsrcFFDTzhpcDBicC9SK1Y4UWNV?=
 =?utf-8?B?K0pHWlRUWHJxbThiZ1hOWFdjZFhudWU4d2FrSHhEWE1RMVY4ZVVwbHZzWlF1?=
 =?utf-8?Q?B1yyLCvuIO7gK6BdMbQPzIC0P1o4pov/Xs8QK?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dfbfce64-4e76-4723-8202-08df393bb706
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 23:47:54.7908
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mJ7vCatTxudJxwbbIp6LHmTsnJpCgYbtxzuSyrU9F9y7lJMy3AInrPMAwGfhhZDADeLm/BoHK5TqOkyp7oEkkmM500z/Ds+hvjwsiSRS4ZlhjtMtcRP/6PR0e6hGiMgL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CPJPR04MB458518

From: Peng Fan <peng.fan@nxp.com>

Remove the unused pinctrl consumer header since the driver doesn't use
any pinctrl consumer functions.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/gpio/gpio-vf610.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpio/gpio-vf610.c b/drivers/gpio/gpio-vf610.c
index 9ebb4469fd15..d14cd5515293 100644
--- a/drivers/gpio/gpio-vf610.c
+++ b/drivers/gpio/gpio-vf610.c
@@ -16,7 +16,6 @@
 #include <linux/io.h>
 #include <linux/ioport.h>
 #include <linux/irq.h>
-#include <linux/pinctrl/consumer.h>
 #include <linux/platform_device.h>
 #include <linux/property.h>
 

-- 
2.51.0

