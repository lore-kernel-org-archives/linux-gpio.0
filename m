Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.65.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795171575;
	b=hCHi0+JvuppVivb5kxyDcSkJj3uTBJPx5ivKdVHv4SafAHACAGAZJLY5b+//F7Ye+i83
	 8IrRxt10JPJ21+4TWozxY6/ci9fKfvIwT/3nrSRuFof3Rh6zniENCLoz8nKgDKxc6bFfI
	 hDRK4KfVO0XaBYDtFMWuNdVndORqUR3T77tdRHuvKx0em4DVKimMqGYcmifXhE6c/ATjs
	 /HnQe6fpw0cXugfqWy1wdvpFF0niY9tshOJdCQVu8yWwKPmS85sE7SNGsvoazTo7n0qKm
	 MZ74ux5hRQT3kSOE4PZtWxAafJf97PzXjDlmT7VDNsQoSfG+9f283YzCTVgtipoH0Lg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795171575;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:Date:Subject:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-ClientProxiedBy:MIME-Version:
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
	bh=5VD+SnSQ0H18PuuB69eT53iuS7VHVFOjmVb6eiq5bgI=;
	b=XIqKfS6M8+sjHbhewFEMt1E4H4bFTHV9C9Z5zyZPg4iHmvgY1JOYZz4EhgoClX12JxV4
	 TFwLxw6PIhQD8TPh+rY2k0O+tuZZ5vsXkJ/H5gpbvPhxbGvoIXBCAp28jLLha/oEbLnmo
	 QFpXhvtVYcVzWA7goxGA4D+4+nGUrUjqGusp6xcni9tZf+b0XSewUYLFWLU3UN3phxAu/
	 EcEuaZzn14f3nkN0NwkRYHkH88LTIoOWX90lvU4MEUsSY0Ws7uVwWwGBVUxfMrO3a3Kyr
	 jjHe5Vg8lBf/0YAy7yqbX3vZq8YesLIQASoRZ6WJIYyKa/17KWk/2eau8Z+0tHVThiQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=gfA0gfik;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.65.48
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011048.outbound.protection.outlook.com [52.101.65.48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 297D7606A331;
	Fri, 20 Nov 2026 10:46:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 297D7606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=gfA0gfik
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vm1SY1aZXycpXPcFjODkdRk6hjx+qm/hQMibCQuWIzazBALoeyArV11b2IDXHAJY35yv57h1qeE7lNQo+a4VNmxukW0vcnEbYKwX4WYBdewcjrO/2A3b+VmJsP49N7bZvoUBZuD9yw3VNdZBJYWZaqXkj2gi1nDyomin+k8Sax2T8QNk7n2/wjxJxY5dmB4mtOwgUaqJL8ErNH2AVRyi0wTS7jgrsjJ4fGiazLghZ0Yff33aT6cPOTgW8miYExSsjMbcOLnRy2PsVabe6UQf5tFgN9dR6Y6UtEuXImHtVJTb+D/HXrsQuWuhZHbqaaIjGY7E2p4wNa4K7daU6ec4bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5VD+SnSQ0H18PuuB69eT53iuS7VHVFOjmVb6eiq5bgI=;
 b=cjCvrrneKkdoZf8tl2EXlcLJNC7nj1OtU2Y15vqotkls9jDLNwV7tY8JYuL+AZUe9VAMVYWqMynt/TgbE/PBNEMvSUVX2nW4yXUP0CcMnEgre4dHU17ijchV//7KCPH9QOC5jX+m7tskqF1rwEFKb/pLLDxh3tbAnXrisX9WeSPo4mbWr+k+OjyultPyZ2nWnqatTStc8opKpEKjEmL6eVRF/KRaG4N/5r8oL2jbcBXn2UOr/yGXzG62BizvTJClWo8D4nUTaMUAVwS1FKlnC2Be1QoRgEY5qbGtz4P4umcHCguY8I1iDqRms7NQW5buVLOf+xEG7EeJwTnmlU4PIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5VD+SnSQ0H18PuuB69eT53iuS7VHVFOjmVb6eiq5bgI=;
 b=gfA0gfikEXhRCT2uWkgC49jwdoMP/kkBqv2nfcgSPnP3ukejh4FEkqMkyLVqmWhekpqeqyAgfArCkQDgU5bluvXToA6tyvhFLvyLSfDRnr1EQ1ZuQZuotqZ30gzwzvpiuEuxX7Jq3DCGaSr3nBQXKcVbyrF2aFKmimrJaFLgy3K9NKQnhIJFrK10Co3hX7pPnm9aSjSinMNyGK/GYCKiswU50UDRKIqq78L8ZthX++Bch6lLoT4La5Jj5oSMEeWDHYPRDIkdgUntPW67nMyr4NAibOkNYSOxJgeFBC2hmzv4K3vHeGGiKN+8VFaOdVxPa5t5RXowouc5Fxam7rw6wQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR04MB5807.eurprd04.prod.outlook.com (2603:10a6:803:ec::21)
 by AS8PR04MB8150.eurprd04.prod.outlook.com (2603:10a6:20b:3f0::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.10; Fri, 20 Nov
 2026 10:46:12 +0000
Received: from VI1PR04MB5807.eurprd04.prod.outlook.com
 ([fe80::3da4:2827:d637:37de]) by VI1PR04MB5807.eurprd04.prod.outlook.com
 ([fe80::3da4:2827:d637:37de%7]) with mapi id 15.21.0639.011; Fri, 20 Nov 2026
 10:46:08 +0000
From: joy.zou@oss.nxp.com
Date: Fri, 20 Nov 2026 18:50:53 +0800
Subject: [PATCH v2] pinctrl: imx: Use of_device_id match table for per-SoC
 data
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261120-b4-imx937-frdm-scmi-pinctrl-v2-1-911487a14300@oss.nxp.com>
X-B4-Tracking: v=1; b=H4sIAAwmAGsC/42NQQ6CMBAAv0J6dklbgVJP/sNwsKWVNdKSLhIM4
 e8CfsDjJJOZhZFL6IhdsoUlNyFhDBvIU8Zsdw8PB9huzCSXleBCgykA+1mfFfjU9kC2Rxgw2DG
 9QBnrZO1rXXrFtsKQnMf5qN+aH9PbPJ0d9+RudEhjTJ9jP4nd++80CRDAS1V5I7muCnONRHmYh
 9zGnjXrun4BLIrhctoAAAA=
X-Change-ID: 20261019-b4-imx937-frdm-scmi-pinctrl-7bce28f895f7
To: Peng Fan <peng.fan@nxp.com>, Dong Aisheng <aisheng.dong@nxp.com>, 
 Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>, 
 Jacky Bai <ping.bai@nxp.com>, Ye Li <ye.li@nxp.com>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 NXP S32 Linux Team <s32@nxp.com>, Linus Walleij <linusw@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>
Cc: linux-gpio@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Joy Zou <joy.zou@nxp.com>, Joy Zou <joy.zou@oss.nxp.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: SI1PR02CA0052.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::20) To VI1PR04MB5807.eurprd04.prod.outlook.com
 (2603:10a6:803:ec::21)
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
X-MS-TrafficTypeDiagnostic: VI1PR04MB5807:EE_|AS8PR04MB8150:EE_
X-MS-Office365-Filtering-Correlation-Id: 244e15e5-c123-4edc-5ced-08df46f37ba5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|366016|19092799006|1800799024|921020|10067099003|261021121427099003|261022113327099003|11063799006|56012099006|261021135927099003|261021123027099003|261022115727099003|261022075727099003|261021130227099003|261026130827099003|261026121527099003|261022105027099003|261026140227099003|261028144727099003|261102123227099003|261009223027099003|18002099003|6133799003|13003099007|3023799007;
X-Microsoft-Antispam-Message-Info:
	bpeFEZ5TyOpmXRPldKLhqD1oxcUVKlk3PtG9Nq4gJQqhbzATvo6I+EkqLngbU0W9XqSTSi5XnG1WCMOBJzKuSARQyS7t78x1/kZPcyI1fNRyZTiBnwxuOgvfm0UNDKJ4L3bF0lI8TQ3R0SpGrr8kt4HuBNsnszpQfwHwubXH/JC5sb/uRztNQ8TmncnMKCEJMTBj+nnaJLZ+SXGMCplNA5ip8CEUz0MgeoRwTFFkN0p+YUOUmzrwAF/BqLTkX6GzdAb7l1g+iDbc2gEnHGjTFbED3t+grMVhg18vzZkawxkUxOrHdBeVVF3HT4jqLOjZxr9/LImy7aIFEcvmdB1rMJ0LnWWhdrYNTuc3SRke/2hDszvQ06gP//CWKgRxO88BGR1U+8fwlfS6R5FP/OYXTshd4Bl2nrUoWs+oVM7tMJbUeimyho7TvG5CPKQR6yQTv1Hc6++LCzlBaMhKYMjTTWtvdKYJxxwkva5e6n39LYUQTRgVggdkO2CbHeNhhfWNFfIvek7DQeyysffX8UOQxfW3ge8jgC8T1aOodZ89Ao6+O7FJ8Kz7Ajqn14se2cDNalzjJ5XMT6wHpa1d8WdWPhJPXFLMjh5GGH4PGGDa5AwHYx2sztN9JvqDD9bJjvaSaE4p6ft5z4hAh/YyN4u0exSlCIyxZDOX7DMdwqCgghk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5807.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(19092799006)(1800799024)(921020)(10067099003)(261021121427099003)(261022113327099003)(11063799006)(56012099006)(261021135927099003)(261021123027099003)(261022115727099003)(261022075727099003)(261021130227099003)(261026130827099003)(261026121527099003)(261022105027099003)(261026140227099003)(261028144727099003)(261102123227099003)(261009223027099003)(18002099003)(6133799003)(13003099007)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RUlvZ3dSM0MzcVlhVldqTElhQzFQK2xlYTlyZnlhVHFSbUFKZnRSMzAxb05l?=
 =?utf-8?B?OGxPcEZRdmcrWGhmTTh1elJ5UUs1Y2w0UTBBV0NzWjhYY2pmR0dMZFFUd0Fo?=
 =?utf-8?B?ZXdrVWFkSkQ3L2d4L0pSUkhLZGEvUVZoSkExNitERzlhdlhmYkhKaVN4ekFN?=
 =?utf-8?B?S3d0UE1UaWdhNHBxYldDQTJBeERXN21WRWZpSmhHM3hMc2d1RGhKTkJTWTUv?=
 =?utf-8?B?bVJ2bThzU0I2aG1QeTUvOE9STmJHelRFM0U3NkJkNHJGWEx5V3FOMnM2M2Z5?=
 =?utf-8?B?RUtzNTNlQVM5bzVOamVsNWw4dmNCUEVlT0U5Z09BNFVpMXBwcUFjQnIxajBw?=
 =?utf-8?B?OUgrbEtIOGlzMExkdlZISk1OV1Z4ZEF5TVJqMGgwd2l6anRhQ216dXB6RmxN?=
 =?utf-8?B?TUZvM1dVVEdpTTduSWZBWHdvVTc0enJ6UWFTazBialNzdlhPYnJOUjRPUjNw?=
 =?utf-8?B?Q3Q4RTl6K3A4TExzTTAvZnMrQ1VjQU1BamIrY2VQVE9IWUFmQUpvYlNpNzNi?=
 =?utf-8?B?MkdIWU1SWnZRd0I0YllZSXNCMHg4U1hVY2YvaC9HcXFpWWkydFRtaUpOcnov?=
 =?utf-8?B?T3FFZXllcnl2L2VjeXZ4Nk02SFRLVjFtVGlCb2ZKUWJuaG5mUllkYlpVWG1L?=
 =?utf-8?B?QytBQklWMkQ5cFYzeUhuZnpIWmJqZldMSVc5SEsydllxSEpjcW5sRk9lYlBY?=
 =?utf-8?B?ZUZBN2dvaXNYVFNVcDZiMnpCS0kxM2gzNEVKeWhFUlZ5NTJtZk5OUW9PWHVh?=
 =?utf-8?B?aXB4QjlscmRYZWY4SXVOVFZ4Q21WMzZZUlZBVEJubVpCYU16cXZibDhaVHk2?=
 =?utf-8?B?RThjaDJMN3E2TjNVNnZCU2NpN2JQMDg1ZXBSNkpSMTUzS00xcUd1VmRNV3RZ?=
 =?utf-8?B?RTJVZ25ZL01lc1N2NXhaRjlVbTNDZXlZQlQ1L21oRy9IUUlQa3g5TUJFL0xF?=
 =?utf-8?B?TmZwZ0VqeDNlN29PNmZmS25qRndQL09DVXlwYUtsTVo4aTJ3dHdleDIvZ2JK?=
 =?utf-8?B?alNBQ1pSZ2R6TlhLNlV1blpzK1VNZkd5WnQzaERqZks2b0hBWll0anZ1Y1l6?=
 =?utf-8?B?ZmR4RURxUlRId25CU0pxM1JVT1lKbVFjN1JYYkZkM1lKL1ZEK28yaGlYa3R4?=
 =?utf-8?B?eWVKOGFKK3NNMVdjM1gvNWJjUDJjZ0tFcUttdUxRWXNMYTV1bVlyWm5iaE03?=
 =?utf-8?B?cUdCQVphckNDK3V2d2dsaG5mUnVKUytTSEhYdlpiVnVqVCtGNjFZbjAwSjRk?=
 =?utf-8?B?aEs5OW1mRkF2czZTNzl3K2V2UVZnNHUzQlVoUWIyb3IzTitJalE3bVJLWlUv?=
 =?utf-8?B?U3Q2QVhkeXhQTnA1ekUvTnh0QVNLc1B1bjI1WUZrcG02S2VoZ1BlelpSSHNq?=
 =?utf-8?B?YVY5anZJbTNWOG9SdUw4ZHRXSUN6elhjSFRpZFByTnltWWNtdTBWcGsxVVBY?=
 =?utf-8?B?WDBkVi8rZDdpWjVQNVlnbnMyUDlvalFuaGRHcTJMZjBkbjkvdzQ2V2ZjOGxt?=
 =?utf-8?B?dndMMVZkTmd0QmdJMjZ6QXhYcEZWL1ExWUZIWmM2ajF6NlVqZ3BXVndKTlVx?=
 =?utf-8?B?azNlUm9mMFU3eWU2MXdsWjdzWXVhakNHRTN5TFgxWVQ4RnI1UUl3bGJLc2Vp?=
 =?utf-8?B?Z09lNVZnSDBDZ1dmU0NpZjJCSFh2TVE0d3dtb2hYL2tjTS9PdTF3OGlobGdY?=
 =?utf-8?B?Y2JTZ1FvZWtONElkdHJNb1duSTZCODFnODlZeXV4cEFxWFJjSlkxYmZvcEJ5?=
 =?utf-8?B?Q3JvUGFtWExZaTQzNFZDdWw5N1ZiVTRTSFIvblEwa1JLTThEdUNEL3U3TlBa?=
 =?utf-8?B?SFhheDdIZjlUMnVzOVdmV3FQaUJaQVhWbzNIc1pyRkZvZlJ3NVQzd0FKMGh6?=
 =?utf-8?B?aE9Yb1QwOUFLRGRxb2c2OEN3dUxMa3FmYjBIRGdxb3ZXTHYyTmpwaElTc1l2?=
 =?utf-8?B?Ykx3R0dJYklyZGFQQmRwNWlOdDhKZU5ZTUNTbitYMlk1b0tjdWNHUWw5NVdC?=
 =?utf-8?B?L1pib2cvbkl4N0g0Q1Bhb2RkMzdscm5OcVhmekZ4WHprWENXUjRlS0pwWHpr?=
 =?utf-8?B?RkZxb1FnOGlrb2I0RXFhckdVV3dRYTZ2Q3loNmRwVVR3SlRjbDR5OGs0UDBs?=
 =?utf-8?B?SkwzdFUraER6bG16MlVBbndLV2JHY0RxRHNvandoRVN3TE03QUdoRVpONWpO?=
 =?utf-8?B?eDIvcE5HN0JDMVZBa3pjMUpadVJkMTFBaERKNGd3U0J3TUxnbzF0R2EyUnI0?=
 =?utf-8?B?aHhCVDduS2JyTnRsMGZTWkZCMzR2TmpuNWhYOUJsYUVGN240U0xQTkhmdVE3?=
 =?utf-8?B?Mk50Y2Z0UXk4enQyYVdORTk3K3lGSytPRUpZdldnb1I5ZzFlajlCS0J5SmJk?=
 =?utf-8?Q?NpOt7p/bGPq5e2xVDnfKJILlGMod7NaB9dnrT?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 244e15e5-c123-4edc-5ced-08df46f37ba5
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5807.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 10:46:08.3840
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r9iqiJnDQwTSwTWxCtZzyzOL0A8HfyFGqgXr5lxy0zs0QInJYTEffF8x9ysiZvTIIRKsuizQZ7WS8oqzYUjLOLbzI6sKH31EZFIVlfERJENyyoruxvqSBk/etYw5XWDK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8150

From: Peng Fan <peng.fan@nxp.com>

Replace the hardcoded of_machine_is_compatible() if-else chain and the
static string allowlist with a proper of_device_id match table carrying
per-SoC data via the .data field.

This eliminates the static local variable anti-pattern for daisy_off
(lazy-initialized, shared across instances) and adopts the idiomatic
kernel of_machine_get_match_data() APIs.

A new pinctrl_scmi_imx_data struct captures the daisy register offset
for future extensibility when new SoCs may not use register-offset based
daisy configuration.

No functional changes.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
Signed-off-by: Joy Zou <joy.zou@nxp.com>
---
Replace the hardcoded of_machine_is_compatible() if-else chain and the
static string allowlist with an of_device_id match table that carries the
per-SoC daisy register offset in its .data field.

This drops the lazily-initialized "static uint32_t daisy_off" local and
lets probe do the compatible match and per-SoC data lookup in one step
via of_machine_get_match_data().

No functional change intended.

Signed-off-by: Joy Zou <joy.zou@oss.nxp.com>
---
Changes in v2:
- remove redundant pmx->data check.
- add Reviewed-by tag.
- Link to v1: https://patch.msgid.link/20261019-b4-imx937-frdm-scmi-pinctrl-v1-1-0576fb20964b@oss.nxp.com
---
Changes in v2:
- remove redundant pmx->data check.
- add Reviewed-by tag.
- Link to v1: https://patch.msgid.link/20261019-b4-imx937-frdm-scmi-pinctrl-v1-1-0576fb20964b@oss.nxp.com
---
 drivers/pinctrl/freescale/pinctrl-imx-scmi.c | 52 ++++++++++++++++------------
 1 file changed, 30 insertions(+), 22 deletions(-)

diff --git a/drivers/pinctrl/freescale/pinctrl-imx-scmi.c b/drivers/pinctrl/freescale/pinctrl-imx-scmi.c
index 7c3860f890c9..1d1f2fea3a49 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx-scmi.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx-scmi.c
@@ -28,12 +28,17 @@
 
 #define DRV_NAME "scmi-pinctrl-imx"
 
+struct pinctrl_scmi_imx_data {
+	uint32_t daisy_off;
+};
+
 struct scmi_pinctrl_imx {
 	struct device *dev;
 	struct scmi_protocol_handle *ph;
 	struct pinctrl_dev *pctldev;
 	struct pinctrl_desc pctl_desc;
 	const struct scmi_pinctrl_proto_ops *ops;
+	const struct pinctrl_scmi_imx_data *data;
 };
 
 /* SCMI pin control types, aligned with SCMI firmware */
@@ -59,6 +64,7 @@ static int pinctrl_scmi_imx_dt_node_to_map(struct pinctrl_dev *pctldev,
 					   struct pinctrl_map **map,
 					   unsigned int *num_maps)
 {
+	struct scmi_pinctrl_imx *pmx = pinctrl_dev_get_drvdata(pctldev);
 	struct pinctrl_map *new_map;
 	const __be32 *list;
 	unsigned long *configs = NULL;
@@ -67,20 +73,9 @@ static int pinctrl_scmi_imx_dt_node_to_map(struct pinctrl_dev *pctldev,
 	int mux_reg, conf_reg, input_reg, mux_val, conf_val, input_val;
 	int i, j;
 	uint32_t ncfg;
-	static uint32_t daisy_off;
-
-	if (!daisy_off) {
-		if (of_machine_is_compatible("fsl,imx95")) {
-			daisy_off = IMX95_DAISY_OFF;
-		} else if (of_machine_is_compatible("fsl,imx94")) {
-			daisy_off = IMX94_DAISY_OFF;
-		} else if (of_machine_is_compatible("fsl,imx952")) {
-			daisy_off = IMX952_DAISY_OFF;
-		} else {
-			dev_err(pctldev->dev, "platform not support scmi pinctrl\n");
-			return -EINVAL;
-		}
-	}
+	uint32_t daisy_off;
+
+	daisy_off = pmx->data->daisy_off;
 
 	list = of_get_property(np, "fsl,pins", &size);
 	if (!list) {
@@ -293,11 +288,23 @@ scmi_pinctrl_imx_get_pins(struct scmi_pinctrl_imx *pmx, struct pinctrl_desc *des
 	return 0;
 }
 
-static const char * const scmi_pinctrl_imx_allowlist[] = {
-	"fsl,imx94",
-	"fsl,imx95",
-	"fsl,imx952",
-	NULL
+static const struct pinctrl_scmi_imx_data imx94_pin_data = {
+	.daisy_off = IMX94_DAISY_OFF,
+};
+
+static const struct pinctrl_scmi_imx_data imx95_pin_data = {
+	.daisy_off = IMX95_DAISY_OFF,
+};
+
+static const struct pinctrl_scmi_imx_data imx952_pin_data = {
+	.daisy_off = IMX952_DAISY_OFF,
+};
+
+static const struct of_device_id scmi_pinctrl_imx_data[] = {
+	{ .compatible = "fsl,imx94", .data = &imx94_pin_data, },
+	{ .compatible = "fsl,imx95", .data = &imx95_pin_data, },
+	{ .compatible = "fsl,imx952", .data = &imx952_pin_data, },
+	{ }
 };
 
 static int scmi_pinctrl_imx_probe(struct scmi_device *sdev)
@@ -312,9 +319,6 @@ static int scmi_pinctrl_imx_probe(struct scmi_device *sdev)
 	if (!handle)
 		return -EINVAL;
 
-	if (!of_machine_compatible_match(scmi_pinctrl_imx_allowlist))
-		return -ENODEV;
-
 	pinctrl_ops = handle->devm_protocol_get(sdev, SCMI_PROTOCOL_PINCTRL, &ph);
 	if (IS_ERR(pinctrl_ops))
 		return PTR_ERR(pinctrl_ops);
@@ -323,6 +327,10 @@ static int scmi_pinctrl_imx_probe(struct scmi_device *sdev)
 	if (!pmx)
 		return -ENOMEM;
 
+	pmx->data = of_machine_get_match_data(scmi_pinctrl_imx_data);
+	if (!pmx->data)
+		return -ENODEV;
+
 	pmx->ph = ph;
 	pmx->ops = pinctrl_ops;
 

---
base-commit: adcad7f4e6332cff3d6d7165f41584899f598534
change-id: 20261019-b4-imx937-frdm-scmi-pinctrl-7bce28f895f7

Best regards,
--  
Joy Zou <joy.zou@oss.nxp.com>

