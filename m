Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.69.64
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793850985;
	b=s/wcD+Ce8944i0Zp+io5uZa1UOLDCljXACd0KO3cbNRPKwZVX13tcbyFMz44FA3GOoMq
	 P7xXuy+10Z2wM7Jc9zFvcRfZ0F4r+B5l6Mq5Nn+VG1b63t0+oSRcXEtd/kM9CdQsN2OWw
	 l0qnre8MmU/dZPpt1IjTusze8D+2fphR7F6Zqpm2BmSzEZiYXv6U+OwxHeUBetxXA7fCX
	 ZebcTqA3L4pU1KwVJIj3X3DClA30HbE9a+Hwf73sWbvYMDDJXbXL/UdmAaf8sNGIo1/2/
	 tCwW8P0at1jtfwsRJxmUIRwjvjr/OjXMTf1sohELbaQtrTluW0tnRnrk31TvxBewUmg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793850985;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:Subject:Date:
	 Message-Id:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
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
	bh=CLxfxTwIHjGeAMTfZGQXsxSDb6lo0Jy8D8B58Cesj9o=;
	b=dwTpspckadwuif9KLispmNMSG36RJboQtMm2su0IlqyRcaRM2zbLMIHYdB+x1YMwYWdk
	 G3q3GDYzn44P6IC7Iil8bsxr6DRDeMBc7vWwIZrYXAYse4+quqmxNlfxijofJFVzKVJA6
	 mXzf1WxJ6CNbuHlHTiU65OdX2bwVMh04UKXYLBys5XFC2HDlD+52QLRIzmMrqPk9HMcuT
	 MnS+m/H9kL6HSWgcK8c1HgCUNTTh0ANpVLME2BoLdfs9IBmjBc4CU/8C8x6sDpP1+lCLT
	 Ke5Pe3edOS9COPR7sy/9RlfTQk+GEZ5USz7M5MwI0x5k3VgihcHHa+W5KJxDUDpbUNg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=gw3ve7K5;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.69.64
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010064.outbound.protection.outlook.com [52.101.69.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECE2B606A328;
	Thu,  5 Nov 2026 03:56:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ECE2B606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=gw3ve7K5
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ag9uN210KQcy27uHgZa1bJO8N/scBh633YYqrYb3tHLlvye1Xvf31PfrqMCIJXbYA4ZgzOib50YfbrOr5uKHKFEVyMLrhGrLoiSyOf6dbNbLgZg3BBzYotf45gUeQCJh0qVgxpDWWlGQj6F2fUhSFTvZ7s+138ImUX7AXLCTh6PLX6qBj4YOj1wl6ST3025vJh7Yr6nT+9CXUrFDzKgL+aIIWLuTpniHj4cd4e05KUPkta+YpAeTLikP+qn+/M4I5Iz2KQNXUWsmHKVZeXfWgWEpAekqb/sFh0RkzLEteWsdTr4oBYZXGsRwoeaTVmZuFli6O/DRRpwpbFjk0XASuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CLxfxTwIHjGeAMTfZGQXsxSDb6lo0Jy8D8B58Cesj9o=;
 b=ttZNJvG833XMbRyi1fTxHdIbSlnomkPjl1J2yjIDzgZPTkURFyLriu826SWCRFl/sRWbFeVlCXX0dA9PclvmU4HNzkP2qjdqm2FRTD1o1r1KDfLORZUAH6hUP8vg3nJ8MG5LCEirsSZ0dLZNmoXRRBZUXGAvuZVquRtvFPXEvUaisbEkx/XXIQIlLDX2h5EHAL1d/x/RptBmDHhtgAtxgN3F1siv6P33lEnW5YeFmDXsIsFzlLqR1AyYkCPHJZUYMzBiHB9fYV3NtgZiU5Ie68TVyEewR67p+VrEEF342OMSyQr8oI7tV81j5lP/2SZGB7Dj+T1yW4MDDr5jKs1ZpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CLxfxTwIHjGeAMTfZGQXsxSDb6lo0Jy8D8B58Cesj9o=;
 b=gw3ve7K5gFoWrNHEupp5FCPhExU6zCHlUaH0E4i+LP3TnTSbesYekj7UdyBadrLE8zUnP13xbN1gFrWMzJkvN6ZzvLpe7sNwWjxvCUHjsMAcjDLw7gaAe9rEo9jyLlinERKEdYTZVJ/jWVWISl19B/Lvv5a68NcDwiQzOH8IpwuJVqI6S0g/Y7MySHhCQN3Um2AZpnwivcwhJmLidzhXhLcgEdOF0lmVbIy3kisIKCkdycNIZ+1GqpB5ybe++YWrTgZMF6WcX05a484+XUJgafheQidP1Byjli7To7PAj9KgAI4LN1WPkhbSaoIijMUa+3zLO1yBayowKsjyVsZ+kQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by DB8PR04MB6922.eurprd04.prod.outlook.com (2603:10a6:10:11f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.9; Thu, 5 Nov 2026
 03:56:21 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0592.009; Thu, 5 Nov 2026
 03:56:20 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Subject: [PATCH v3 00/11] gpio: vf610: fix clocks and misc cleanup
Date: Thu, 05 Nov 2026 11:52:58 +0800
Message-Id: <20261105-gpio-vf610-fixes-v3-0-504e19de5ad5@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJr962oC/32NOw7CMBAFrxJtjZF/+UDFPRAFdtaJkYgjO1hBU
 e6OHQooEOVo38wuENBbDHAsFvAYbbBuSCB2Bej+OnRIbJsYOOUVo/xAutE6Ek0CYuyMgeiykuJ
 QN6XRLSRt9LgdknW+vDk81A31lDt50dswOf/cfkaWd3/ykRFKZKlkI5XUUsjTMI977e6Q45F/d
 EbFD50nvdY1M0pUyJovfV3XFwgeS5n/AAAA
X-Change-ID: 20261029-gpio-vf610-fixes-c56439785fcd
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
 Peng Fan <peng.fan@nxp.com>, Daniel Baluta <daniel.baluta@nxp.com>
X-Mailer: b4 0.16.0
X-ClientProxiedBy: SI2PR01CA0004.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::22) To AM8PR04MB7874.eurprd04.prod.outlook.com
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
X-MS-Office365-Filtering-Correlation-Id: 3d59e785-e6bc-4489-2a7e-08df3af0c062
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|23010399003|376014|1800799024|366016|19092799006|921020|261028144727099003|11063799006|56012099006|261021123027099003|261021121427099003|261009223027099003|261022105027099003|261026140227099003|261102123227099003|18002099003|6133799003|10067099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	YaGSjsSNyODsfeCdHkoXDUh0ER3tHIoYHm7FUHSlL71SXuZUsC5+02+c/7o1ZCGVurySNMFRZLdNlgSb68P0uL7UroZMEDQVLz1tVSy5wlFtI+hh5xBBNcqo2Eb9Bo6L9gcV6Dr/CFeK05eAjHjnJVf6J8TLVvDRHhuh/+FrjM2PfIpLvQXTfr+gmoGNlZRSzcZcCJa2dsQlT3jJH14yNjz6p+bSXltwCgfdee6KW6D3ddg0FBwHR9W8ly6vdx/YxUWhXzJgj+FXFsWJcj/T47svbeMi1Ev8a9cik+S7TxLAwKbfsX4ApPTAmWbw8SpWUDbOQhDbQzCSOTN+qfkgL8AzxkhZhfW9LCkECD97TfRrv9xQpO66ibXLcs6NThvSZFPb9CBm3SIDtZtX/6mdjRx13xJlOS4N4fg+U4mkM/5Tvr3LI3kzt3RTCu45I/+ZIpOu6araX+GP42UXh6Iwy6gizDsJZY09ZxLH6lnfypr2RBjSus84dQvE2Zgrivoa3NF3pTyIOeAyAeMaZLEb2OuY1N4Ul+BVkt0fL8SZn1kWxaifZ9GbeePNvKJiiSGJwRRNaqVTraeMQSZICGTyDtiTFIteWj65z3HacBjvea3Kbn6rMPL/xTfl5piBNfT95AFUNJZTzBjaEKYb5gl5BlBxvGJl12xtX5FcHMqe89c=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(23010399003)(376014)(1800799024)(366016)(19092799006)(921020)(261028144727099003)(11063799006)(56012099006)(261021123027099003)(261021121427099003)(261009223027099003)(261022105027099003)(261026140227099003)(261102123227099003)(18002099003)(6133799003)(10067099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MldxMVR5b0FxQ21IcUZjY3NnNGVISGRuTDNlOXVMSWd5eThxWlVXeWI0M1Ux?=
 =?utf-8?B?dVFPMjIyTFk4Ti9HTTNWNWtsanJzdjVvYTlMbU5ZUlNXTkhFbmlnNGZld3oz?=
 =?utf-8?B?YWJpSCsrNnhZVDduYm45aTluY1FBQTQwblQ3ckNVRml5U2lkcThnVXZKZzFz?=
 =?utf-8?B?ZU5UeTRUQjMvODRUblVBQ29aSy9LZTlEeUFSYW9IWExlMThGc2xmbXcvS1VQ?=
 =?utf-8?B?d1JkK2NYYzZxRHdGd3U1emE2K1JnbGk0WWo0b3lzVXQrQXM4ZG52RzU4UzRI?=
 =?utf-8?B?ZmhqMVpOeDY3UzQ4ZVBvMVUwSG9hb09jR3NhQ21pdFJsZWl5TGlEc09uRWZU?=
 =?utf-8?B?bjRtcVVJaUVPRWFERS9aMzBmUGk5R0wxYkJVcXZkSUVoVFBtRHNZNHd1Rlpw?=
 =?utf-8?B?alVaU1diRlpFODVIaVYrdWlMbFRhM1FTa2RtbFVlTysrMm1NWVRwOHN4cGRI?=
 =?utf-8?B?NEVNaUlDdlNHaDNzRUMzazRyajV0QnhzOVl0N3BGOWhiakE4aG12WTdMZHcx?=
 =?utf-8?B?dExjN1hNQXZoWXEzRXpIeldGTStIZi9xT0RlcDNEZWVMekcwTWRFeHMxcklK?=
 =?utf-8?B?L0doRWpDdHpVSEFjazk4TklqU1lUWXNkRDFCeHArOGJJQUNuSVlDcXZNMWVh?=
 =?utf-8?B?OWVDUUJVRFJtS2NySFU5bGZnS3Y4ZEd1WlI5dldudFAzbmlWeFRVOTdZdDNV?=
 =?utf-8?B?YWlGc0FEeWpiV3o1NlBsdnRXb1lXVGlBM1I5bllaZnJlUzh2NC9heVUzL0RT?=
 =?utf-8?B?MHNmM0RNS1ZBR3RPT3lhOHlNSEJlRkhBcVd1TjZIM1Jrb2tGZmlndGY4NTFq?=
 =?utf-8?B?QWNVbFUzSXozLzE5Rjh5SEVNb0lpS1FvVVdRQ3MzaHlLa0hkSG5qNFEydVl1?=
 =?utf-8?B?dGpNa3FkbVZvK203S3ZJR2VUQ3lCNEtaY0NCS0I0cUZmejBwc1o4eXB5c053?=
 =?utf-8?B?dGdqMDdYaG1DcDUvOUd6cjEwMFR6VGpCVzhreDE0LzQxQXhUb2R6WXZPQktu?=
 =?utf-8?B?OUNTUGxRYlJzcndSMzU5LzlncEJtK3hQdWZMOHZqWE44NDV6akEvbHExV1l2?=
 =?utf-8?B?b1dNcHFMT2JuQmQreERFSGdZdEw4UUQ5WTByZGRXTlpVRTRwWDZ6b3RCZWs0?=
 =?utf-8?B?Q25TaGllK050dlNsSlVUYU9mSnoyM1pwVEM1d2Z1bHNWRUpzUitKcGdYSFBW?=
 =?utf-8?B?UGJ0Z2k2RDd1bUJKWUFQRG00SVdyems0Wmh1dWdZaUdMTHNzQ2Z3M2hBOTd4?=
 =?utf-8?B?blcrS2hjUGp5ZUFCYWJyL2tmZTdhYmZCZ3Jka01VQkFDMUl1RjR3bFhBMmFi?=
 =?utf-8?B?ZUhGTE54K1FaeGxHUjlkdmtzSmxyczQyL2dKMnphYytoUWdnMkxwL2dmU0hX?=
 =?utf-8?B?UUU1ckZpUnVmMWIyVGZ6RkFsY3hKOTk2Z2YxUXpJK0t1bVZ6dnlYZjFrWXYw?=
 =?utf-8?B?WGxJbzFZOVZsVzN0SHhJVm1DUnhNT3FxN0N3bDVNdEZGYm9Ld1EzZFlEUWlr?=
 =?utf-8?B?YW9UUnBpbjAxTFZRUU1hM1ZGUUdZQjR5Q2hGLzN4RkVpb1BJVWhLcEhiVERp?=
 =?utf-8?B?d012by93NEZ5UGFaczVXbnpVcGh3V2VhQi9sNnZUdzlvNkM2VG5GNVhmVDI1?=
 =?utf-8?B?RXBYWnVBOExRM3B4YUcxMHpoeThMMm03UFMwT1J1aGhQOVNEMlc1Ui9pdWtO?=
 =?utf-8?B?YTBad0NEUjJ1VE5mamJBdEEvSk1ESTFEdUlYUlVTdm90RGhObHd2aWVFZFN3?=
 =?utf-8?B?eTNtM1VkVDZxOTN0YWliNlhMUWpza2w4MUtUVkFCSFlQWEZ1VXRpOUFKMWJV?=
 =?utf-8?B?YWc1VGU0MFZZeWNSeFdqN3J4ZWJSK3J3Ukp6YU5UeW93R2NSblBxaTRKbG01?=
 =?utf-8?B?L0E2citOTC9LVkE4OHJBNVoyaUpJV29obUp6TXBEV2VuaUFmNGtFN3djT04y?=
 =?utf-8?B?c0FjenB4cEhIZVhPMEdWTnBFWXlNZ0ZiVVFlQkN5MDJ0K1hIMGJsc3p2dmk2?=
 =?utf-8?B?cWlvRm9ZNndHTy8yd21GcXR6K05HcHBZRzc4WDdSMXBNRU1TV3RSaWQxOVlD?=
 =?utf-8?B?UzJRRkVyVXdyTGlqaEtWYTlmU3N1YWE3UnBFNVBkc1BYdWpqZTNyQUxHZ25z?=
 =?utf-8?B?eUp4ZXBTL2RVcGk4clFLNzBrd1psRXI2ZFVSNmh4YUJKazU4WEduK0dma3BB?=
 =?utf-8?B?V083b2gzQjFXLzFrMnp0U1h5c2pjY25nazRBTXA4NVpnSWY3Zkp2cWFqWSt3?=
 =?utf-8?B?bnh1L2FrU2t0dHN5Z3NMY0R4L3dCaWlKVjFYR29pZU9ydlBHcXhSWFVJL2Ew?=
 =?utf-8?B?T25rS2RBdFJDQ1kxcmdWSWhib2dNaWtQTVV4Zkl4UHIrdWhTZG5ReFdMbjRR?=
 =?utf-8?Q?PnWykaNPta0xqSnASllvy0N7JtmIGj2hgUdsH?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d59e785-e6bc-4489-2a7e-08df3af0c062
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 03:56:20.7348
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZWcGqetz8+YTCA5ImxXu2zYLdxX5C9uBlo3IRmSNInlo7nzGvvZsOnyzY4sSnpPIXet1ItKmPwFxtdCgKsd4jas/AeMXGf21l1Ukn0El4AM+I0W0n2zzgLFJUadcFVVt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6922

Per i.MX8ULP/93/95 and etc reference mannual, there is only one
clock for a GPIO controller, so drop the 2nd 'port' clock.
And for i.MX8ULP, the 'port' clock is for digital filter for iomuxc
PAD, not for gpio controller. If we need to support digital filter,
we need to add the support in pinctrl driver.

With binding fixed, to avoid dt-schema failure, correct gpio node for
i.MX8ULP/93/95/94/952.

While at here, a few misc gpio driver cleanup patches are also
included, more info could be found in each commit log.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
Changes in v3:
- patch 1: update dt-binding to include vf610 clocks rules, update commit
- patch 6: update commit and subject for MAINTAINER update.
- patch 2, 3: Add () for functions in subject
- Link to v2: https://patch.msgid.link/20261103-gpio-vf610-fixes-v2-0-7c71fb36e184@nxp.com

Changes in v2:
- Drop patch 2 "gpio: vf610: propagate return value to callers"
- Add R-b
- Minor subject/commit style change per Frank and Krzysztof.
- Rebase to linux-next/master
- Link to v1: https://patch.msgid.link/20261029-gpio-vf610-fixes-v1-0-45b484b4c434@nxp.com

---
Peng Fan (11):
      dt-bindings: gpio: vf610: fix clock requirements per SoC
      gpio: vf610: simplify with irq_set_irq_wake()
      gpio: vf610: use devm_clk_get_optional_enabled() for clock handling
      gpio: vf610: drop unneeded header
      gpio: vf610: drop unnecessary wrappers
      MAINTAINERS: Add VF610 GPIO driver support
      arm64: dts: imx8ulp: fix gpio clocks
      arm64: dts: imx93: fix gpio clocks
      arm64: dts: imx95: fix gpio clocks
      arm64: dts: imx952: fix gpio clocks
      arm64: dts: imx94: add clocks for gpio controller

 .../devicetree/bindings/gpio/gpio-vf610.yaml       | 41 ++++++++++++
 MAINTAINERS                                        |  2 +
 arch/arm64/boot/dts/freescale/imx8ulp.dtsi         | 15 ++---
 arch/arm64/boot/dts/freescale/imx91_93_common.dtsi | 20 +++---
 arch/arm64/boot/dts/freescale/imx94.dtsi           | 12 ++++
 arch/arm64/boot/dts/freescale/imx95.dtsi           | 25 +++----
 arch/arm64/boot/dts/freescale/imx952.dtsi          | 25 +++----
 drivers/gpio/gpio-vf610.c                          | 78 +++++-----------------
 8 files changed, 107 insertions(+), 111 deletions(-)
---
base-commit: 8b7179210b22f8e48a82c5ceacb9d56a9c4cfec4
change-id: 20261029-gpio-vf610-fixes-c56439785fcd

Best regards,
--  
Peng Fan <peng.fan@nxp.com>

