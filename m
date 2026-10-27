Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.3
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793103198;
	b=AE1XFXtlzWmUkNPpKTHtp3yySUbY5OFxfGwUQ250htEiul2CUJ+nU4Uv0WfKHo2AJ6SY
	 MCL4hyu/LvrHeMvWyiZWBvVystewKNmKp0pOjK112baDzY9dByLW5a15hxXnCWlquM1AG
	 fPXU58XfHxwc0KNYsy3OFBlUyRPVI4+Na3HqLoMChm67I2eYGr+uNVM9CwD/eZZuNBVNt
	 Kv/UmS9yIK8EYaKw6T2tGt/b1wBhMQQJLSFPVsHdZ+j78gubTlo+EwRgwidcbCkJtylvB
	 IlxlJ30QE8A4OtFiMvlEnvo85RCWOzRFgfMHv+kfwTHDYdzhrpgLWstyZdJ7yVr+y0A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793103198;
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
	bh=zIcg/GHz6heth9xtaKsi13C0IYvo5985xROLaBmeF3Y=;
	b=WoaVAAXFyYm5G2dpJg3766ACUKzyF8XJd9v2QAQAgkVRGzz04nwYHQ+C6hVt/LZXXBrr
	 jB3SaIWn99RRXnv/9d3kJ6nKwxHee/1GGfgdPd/W7pWc4pGU7TeogWz18MYVXGsWiueCn
	 i6zGJhBeEmbVs8rPC8HovXoC7K0ca0bHDbwVyp8SimK6cY9LbxV6+7ttlABRwXfXvNx75
	 Nk0cHk0zR8R1vo9VnNyMf4Y4H6pkCXazzxzq3UGfHbtR85FTquLgBO9nhPtcNiU5K6u+w
	 flpIRfbZdIxXgeUciT1TWRVxDu+flBZbplWPZ7bLieJnBZiW/mLlahtGqCs6AHRfDDQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=cXqnRyYL;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.3
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011003.outbound.protection.outlook.com [52.101.70.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6571606A324;
	Tue, 27 Oct 2026 12:13:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6571606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=cXqnRyYL
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SUnBfCx2R1QXcxIAO/BVtWU0evum59GTVJ2jxzthM4Nw4W5TN4eUylVtk/gcHAHERTUqLFKcFf4Vp+tyEgyZf+fwCQBqabaE3LjlyqVgADcEQ5VeQuQB6bUZ/yaUk7oymlYY6mYnqUcZvvvpDvydwmcR1dtVmqI0Jv3c2ee5vErgOm6eJIBcSkpuMi/mwEVr7P7CdQDZdIHMCCT0yTcFJZ+DZdC36eSA8H/iQsFdHVMP1vV86i9jP8CHOHsK5hPjK//sBONt8bbHTFjAgrsAPyoRPVjBFY7fN9c+EqT0NLJXklR+YU+RZEDBwfejXwX1/Qp4x0y3gVowfeiA7yNgLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zIcg/GHz6heth9xtaKsi13C0IYvo5985xROLaBmeF3Y=;
 b=I6aAn1SMnhkRAWyrh1wYufGHivcPiUtBIywEg5rHp0dVlzzWrL0FnPrY2zzQDd1/aBuUUy1m9TDaRjscYmd7L0pJuYgOgRu4oPVL47vVkiTIBRMUE8tKu4sHDyqir9sUiqHberSbF5RWrcfkGoEmlJmCBiY9rGu4mZIV1yGV/UW879V+VIVewtLqey2LM7/r73AnjgWjwLowu0R0A+EXFspBNhXrQr20qrQ3CjxGDxFiROHbFQ1O9iLL+JsAGnTzLUes9WWn7ugRIXg3UUNC0Bn0dixLjNNkUSmn/ZGajCYNGWlQeKAWHRrfoMoChTmeuWJ7lCrsDFFnBuy6Kk/lIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zIcg/GHz6heth9xtaKsi13C0IYvo5985xROLaBmeF3Y=;
 b=cXqnRyYLxXkCpVRDWNH/8Tr+ZGudXck7pjw5KpaPdgwk2t5jQzQc/SGdQwivBzcGZZt1fH26t8AncvmIh36mTkcibXrv4Ku1ADw6e5lHXUrP/x/z0BdXLlZ4QE+DmVIh9cMjk8gnA4rSQrxpB+czG1YU3zDg5wLoD65tveU7iYM5pWLC1Kke2sNolxhBxQ1KkVcOZ2li7GHSAlmSHxK9MW17wtDfBv7NSZQYtJsNPWUiT398Dcn4hO+fyfzlowRKgk+I0Yim+gogaxl4n3YjLR+6P4wMkpHGHHbqAkiWP6NNuNcJSL+EeiJMGinPlVDSK/94gfHgwqeOhNYkICeqqw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by DBAPR04MB7462.eurprd04.prod.outlook.com (2603:10a6:10:1a0::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Tue, 27 Oct
 2026 12:13:15 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0546.021; Tue, 27 Oct 2026
 12:13:14 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Tue, 27 Oct 2026 20:09:32 +0800
Subject: [PATCH v7 05/12] gpio: mxc: convert pad wakeup compatible checks
 to hwdata flags
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261027-gpio-mxc-cleanup-v7-4-v7-5-7b602d70c149@nxp.com>
References: <20261027-gpio-mxc-cleanup-v7-4-v7-0-7b602d70c149@nxp.com>
In-Reply-To: <20261027-gpio-mxc-cleanup-v7-4-v7-0-7b602d70c149@nxp.com>
To: Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: SI3PR02CA0006.apcprd02.prod.outlook.com
 (2603:1096:4:295::13) To AM8PR04MB7874.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|DBAPR04MB7462:EE_
X-MS-Office365-Filtering-Correlation-Id: 83dfbda5-ddd3-4376-6a13-08df3423ad30
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|376014|1800799024|23010399003|11063799006|261021123027099003|261021121427099003|261022075727099003|261009223027099003|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	eGV7xH1RTE9vYV3i5XbUd+meTvRZv5FtLeQ82dv3ERfhTx/9l5lg8yoVa+4PGl+bvxwD6Cantxa3O1PcucNfE1TZ+e4G7HTjQFe4bvzDAsrYviP34nqPvSq34lLgCZQtWoespaIzSIl8GzfoIaTizgnwYR+n9Za0ibHk2ljFK/unupfxAuiHsnaK+iIbUYelYkZJoQEIcJVCi8WYq4cJeFH5snxcz76oZNFnSWGMvX+JsFn4bjf1lI7pI3R0syyMMFZBIOBL1oNWdHr9++tPP4+Y/QUywO65D8ElAu/BuLUEEtWzLOi2uRuVEJEWhEz2PWW4rciW2b4j1JXDd63V9uqejX5uHwblpQh0dorWrvlMrfq1fdKJRwCSqFZdfrPfvrllrGr/xrtes523NAWt0udbXy/WU0qvel2WAxXyZHDJnMl2yJnCRYNhJsEF/eHS8isB+JoqwAznyIpeUM+M/CZ11YQmUX7nzxtBK0k4IME7HNVEDbZqF+ee/fCCaj7+C+vXPSYM8C9EeBsYmYkjVvrbu+Lr1RheMT+0CYcdei/OkrfiCCsM+vC7vn8i3+oExfMoE4PE+geAT/UIRY81nmSgI4ZFEkrPuuzB8HOFP/PTJl3TEF7x1kM5S94cNstz7Cr8BkIcnJKFkti5MMxM647/u03wTNlU5cn160RqUSM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(376014)(1800799024)(23010399003)(11063799006)(261021123027099003)(261021121427099003)(261022075727099003)(261009223027099003)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SlNYR1JPVmJxY1JFYUlQRFNhT21uRERJcUNTQzJWcTF5MnVxTWViRWplZzdw?=
 =?utf-8?B?ZENPcTRLaHlvYVlFS3h5WG9Dbld2WWdMSnZ2TjBhcG1sZTBrYWtwSFRqdUxF?=
 =?utf-8?B?MFhCaU5XL29Pc3E1SHJrV203RHhYcjREY2R0YkFhUm5VeDY3OGpvVzVhb2Vi?=
 =?utf-8?B?N1dlRDg4Mk9IMXNJcGZKMmE2NjAyY3RISDhQdmR1ZEJyRWU0NXZkNUpMalMv?=
 =?utf-8?B?REU0YUI5N3MraFp4Wkg5cm9Sa29uWElsYTNRWFdjVzZVU1NxZi9aT0xRdFh6?=
 =?utf-8?B?bUlyOFF0a3hVanQ3TFpZbnJRUTgxRmlpRkVUWGliOEFBSmFIbzRBWUxzWWNU?=
 =?utf-8?B?WWhPcTFxT2JvdkxDdzJDNXpOYkxJUjU0Z3FBeFk4UGZ1cHhCNFBnWW0wc2Zr?=
 =?utf-8?B?ZzBBZjF5cHFQQldWa3VrTytvUnpZaXNyZW1TVFdHT0ZlUWtkM0pncTdVOVBC?=
 =?utf-8?B?blhYWWJ6ZXdIWmNzNS9yOExFd3R5QUxaeFlFcUt2QzJxdFFoeGhNYlRIN3BO?=
 =?utf-8?B?V2xYWVFoZVFZZnhueG5WYXpncFY1ckVmTGxjeVNnMnBuVmtBK0JnZXc2SGR0?=
 =?utf-8?B?dno5Tjh3K3RyN1lGOHBJcVdaS1VFZ0o1QzFnMVhoUmtGdEIwNFErWjVJTGRq?=
 =?utf-8?B?dDN0YWI5VnIveThTOVY5S09ZcDRjRGhPTHVoS0lZcHNINVd4MVpzQVIxRzNX?=
 =?utf-8?B?UXppL3Fnd1BwbHBYS1BXeGVwY0wwN3BHdGNPYnBEU01FU080cjFEaDFXcVFi?=
 =?utf-8?B?Ykt1S2FsVHYweVJaMnhzWHJ0MUVUVmc5bk5jUWFlS0EvMTJ5Z2d5OWw5Wlpn?=
 =?utf-8?B?dTJEdGdlejh2Tkp4Q0FJL2pROTV1R3NyWjZtbXdOcFMvT3hzSnBEVklBbzF3?=
 =?utf-8?B?M2NUK0dCeXpnT3lOWDQzKzFrb3ZwcE9abXJlN2RIVFZWdEdEWTViajdCbTNy?=
 =?utf-8?B?Y3JYNy9pNlRSa2NPQjVWVjdra0N3c21jTzVla2ZqQ09zdjVETXp5dHZyVGlY?=
 =?utf-8?B?TmJ6Q1BSaGluamg2K2N4OCs0S3JsQzRhenRpQS90VmgxZk5aRWZ1ZUQ1Rnhm?=
 =?utf-8?B?WnBxRHBmMVltWDVlUG5NbVVlajBoVzYzdEVVQ3VONW1nanBqeHhvRU1pS3ZN?=
 =?utf-8?B?VkRtQzYvdEhzbmZBbDV1YVZEb3gvTG5JVnpGMnNZSG1hdzQ1ek83UGNPem4v?=
 =?utf-8?B?RVY0NzBUc0tLa2VicGFzZ0pTSkdkQUc5NWt0MVVtZjdSblJoYW84TkJlNHFn?=
 =?utf-8?B?MVUwVVc0dGRPMlVTM0o1Y1owNzc3L0VFbGRUUk9PVUdYY1pBdnZkNTMxd0dk?=
 =?utf-8?B?WG14VDBsbGt0NmpENHREQ0hVVXZXeHIwbVJIa1JNZXR0Mlc4c1M5aDNKa2tS?=
 =?utf-8?B?YUliUkMvODJ0QnhUSitsdk5hOU41MHVBL0c5TDNmTVhBaVFWbzJ6K3drVEhn?=
 =?utf-8?B?Q2VJeHVkSllXM0tPM3JjVzU5Ym15bmJzSXlwZkJvQmx6VmlONWx6MzdDcjZs?=
 =?utf-8?B?T0h4c2lESWdrM0dwVmQwbmYrZ3VWMmo3NFkvNVMzVXVoRU1iQ0g3dkM0R1cz?=
 =?utf-8?B?NUtsZ3AxOFozS1Q3dW11REQ2VDdReGREOWFJWXoyRGxXclkwalZUODZCdHFS?=
 =?utf-8?B?emF3YUY0MTZkL0FuZnlNT3podnYwRXE3ZzVYVUJmVzhtSUJLUXNzdlNDVk53?=
 =?utf-8?B?d0NPTlVTNDVMSWdyWkE2ZWJVdzR4SHkwRXNPVU1LVWdJVkNVdzI1aXQ1NUxk?=
 =?utf-8?B?cm40RDVSS3ZpSFQ3QXFoWjhESDdVZTFuQ3dzdFpJUHFERGhFNTdhRHlmY3lV?=
 =?utf-8?B?ZWlpQUVMUW5jRzNaYUVKMVJuVFlrM3g2VmxmTURsdGtpNTc0ckpKc1lJQVY0?=
 =?utf-8?B?OHZBTnY0WThOYW51V05wVk40N1ZFVTRLM3NNZVFVS25CcnpwbFFCbEx3UTN2?=
 =?utf-8?B?Q1hIV1BiY1AzYjZrOVJpZ0dSZ09nMFIzT0ZYbnVOaDkwOW1mc3JCbi9EZ2l6?=
 =?utf-8?B?VFptVENBUTNhTjFndVQ4RFJ5bFV6Q3lJNUgrRkFaOEp5L0p6T3lLN3hHNmxH?=
 =?utf-8?B?OWxWQU9zcDF0Vk45czFYLzkvTnd6d0t6MEo0K3lUelZCb01aUnl0cng4eXZC?=
 =?utf-8?B?SjBpa0lMc2FEWENCTVA2VERRcm1UdXNJODdLUEs4R2pScnN4bW55SGlsR2s1?=
 =?utf-8?B?S041UldPOWMyQ3JHZ2hyRUVneGg0TWdOSll1UUp6bC9vUzhQMjFYRldtUk9U?=
 =?utf-8?B?Ny80Q0hJT3VKcHp1UEFRVC9GTTR2RkkxWlE2N2d5NG9jam5rNmRrQkJXUnRT?=
 =?utf-8?B?dFJDR1NwZnkwWHBVQ2Rpd2t5NE9RNnNXT3ZmMGxIRHJOak5NV2IxV0tWbGNS?=
 =?utf-8?Q?lLDJIAThcVhmOBWxkUhHxon5+w31L3SZwYrBK?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83dfbda5-ddd3-4376-6a13-08df3423ad30
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2026 12:13:14.9378
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qmAznPhinAFiQtq51/N26PGJx5DDQ+NLue3bHt0SIpZ4/UzvmCFu+SAVmSmLN91CaG8vwPN+JRQBW5mCl+OTR1l+TYqQXlPVEBzfjYni67PimB0u5etjkYsAk+j3hp0O
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7462

From: Peng Fan <peng.fan@nxp.com>

mxc_gpio_generic_config() and mxc_gpio_set_pad_wakeup() call
of_device_is_compatible() on every invocation to determine pad wakeup
capability and i.MX8QM-specific behavior.  These properties are
invariant for the lifetime of the device.

Extend the hwdata flags scheme introduced in the previous commit with
MXC_GPIO_HAS_PAD_WAKEUP and MXC_GPIO_FALL_EDGE_WAKEUP_BROKEN, adding
dedicated hwdata instances for imx8qm and imx8qxp (also used by imx8dxl).
This replaces the repeated device tree string comparisons in the
suspend/resume path with simple flag tests on static per-compatible
data.

While at it, clean up mxc_gpio_generic_config() to use a local ret
variable for clarity instead of the == 0 comparison.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/gpio/gpio-mxc.c | 46 ++++++++++++++++++++++++++++++++++------------
 1 file changed, 34 insertions(+), 12 deletions(-)

diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
index abff07bd3840..e7c6fbd811a6 100644
--- a/drivers/gpio/gpio-mxc.c
+++ b/drivers/gpio/gpio-mxc.c
@@ -35,6 +35,8 @@
 #define IMX_SCU_WAKEUP_HIGH_LVL		7
 
 #define MXC_GPIO_HAS_POWER_OFF		BIT(0)
+#define MXC_GPIO_HAS_PAD_WAKEUP		BIT(1)
+#define MXC_GPIO_FALL_EDGE_WAKEUP_BROKEN	BIT(2)
 
 /* device type dependent stuff */
 struct mxc_gpio_hwdata {
@@ -133,6 +135,26 @@ static struct mxc_gpio_hwdata imx7d_gpio_hwdata = {
 	.flags = MXC_GPIO_HAS_POWER_OFF,
 };
 
+static struct mxc_gpio_hwdata imx8qm_gpio_hwdata = {
+	MXC_GPIO_HW_DATA_COMMON,
+	.flags = MXC_GPIO_FALL_EDGE_WAKEUP_BROKEN | MXC_GPIO_HAS_PAD_WAKEUP,
+};
+
+static struct mxc_gpio_hwdata imx8qxp_gpio_hwdata = {
+	MXC_GPIO_HW_DATA_COMMON,
+	.flags = MXC_GPIO_HAS_PAD_WAKEUP,
+};
+
+static inline bool mxc_gpio_fall_edge_wakeup_broken(struct mxc_gpio_port *port)
+{
+	return port->hwdata->flags & MXC_GPIO_FALL_EDGE_WAKEUP_BROKEN;
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
@@ -159,9 +181,9 @@ static const struct of_device_id mxc_gpio_dt_ids[] = {
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
@@ -581,15 +603,16 @@ static void mxc_gpio_restore_regs(struct mxc_gpio_port *port)
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
@@ -597,7 +620,6 @@ static bool mxc_gpio_set_pad_wakeup(struct mxc_gpio_port *port, bool enable)
 	unsigned long config;
 	bool ret = false;
 	int i, type;
-	bool is_imx8qm = of_device_is_compatible(port->dev->of_node, "fsl,imx8qm-gpio");
 
 	static const u32 pad_type_map[] = {
 		IMX_SCU_WAKEUP_OFF,		/* 0 */
@@ -618,7 +640,7 @@ static bool mxc_gpio_set_pad_wakeup(struct mxc_gpio_port *port, bool enable)
 		else
 			config = IMX_SCU_WAKEUP_OFF;
 
-		if (is_imx8qm && config == IMX_SCU_WAKEUP_FALL_EDGE) {
+		if (mxc_gpio_fall_edge_wakeup_broken(port) && config == IMX_SCU_WAKEUP_FALL_EDGE) {
 			dev_warn_once(port->dev,
 				      "No falling-edge support for wakeup on i.MX8QM\n");
 			config = IMX_SCU_WAKEUP_OFF;

-- 
2.51.0

