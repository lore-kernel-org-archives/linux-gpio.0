Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793103226;
	b=4Hkm9pMaEGknW/ZFsym2HM1vnDUafPgkPG2UFMy1FKdH/OHHkc2pQo87xBQCY5TNlur9
	 26jZiv0a7KvHZ1CeO3iHGZxoKjeOwn3O63RV1Hvn0yD13d4ij37x54AwwaC+CvH7fte8Q
	 PMZ8H64gnMvQNZApcNS258DNkPit9+ZP6OlfRN7YCx090xDwyiOD0wFNRRtvZApBGnANM
	 s46Xrv7exYeewyFT+Otmwnwy760vGnyxaP+MMJmQjwjd+fjWenHZURGDvhxLyydJECiSl
	 jqDAApLjuFklgn8gr+9+5OHiSve3aALSsP79QI2aDl/gWA08Krrv21770VEtSZBPQ4Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793103226;
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
	bh=09yZOD+jKhvlveWARMhu4GJ3tjX4o/vQkS9i3NxtNuo=;
	b=RCFu2r1mMjWY6UYXPDs0laFD+SOqoXf/7qBskdYj/IkT1gv5caL53prSiFD8jZlcqqD3
	 fRkATh+fUTNadpDaEhAUZT6j7pFyKzialKBCV2i/k+8vY03560RJPJTIJ3bVAZnDmh4Ng
	 zlwzymFWdr12uYRSDqeaRiaFdXEsAOtK91L3IIrUwLHAe3zj58RoFMMaFtR1IiKWoU/R6
	 L1pMLrk5SnjqtDGxQfUFI7KVQ0ORs7bHGuzXK8gA5CTmSrcHfONpcaaNKjYiNCLXywLyR
	 jMmd6nrx5GdveS1dzKF+mFPGga8QbjVEwYKaEk8QrnA/Xq26A/peKjKwfKkN04BuHkQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=G2YFMOlG;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.18
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011018.outbound.protection.outlook.com [52.101.70.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 515F960A6F48;
	Tue, 27 Oct 2026 12:13:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 515F960A6F48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=G2YFMOlG
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k+AFu+Gy9p2tXJHmHYH3d6UxK9O/jVnyiNThPiw9tr75v/OKjtdIe5NlnD+yoizy0PpdeO7xs6zSftYBBrm6Tx/Zxtte7qkJOt5ApImEhBzTZNlw9xJ8BWYxixHaGo51dHyex//j54+dxJiLB9HO1lazMLwtGzLrav5ywrkIQbnnltQ3Je4CvV8Omk+cbjXxOjD5Xy6vD6RzCj74RVLpUDY3HmxnzNKUh3K4wUfmdszHoQjqJsCGsB2AQd98Bv71Ejpvu5SkyHGh/29ieLqMRBTLk+FFgNaZ9luyk4J89vRdcWHHnGY/+runs97f8UcmdULNXc+FQAOk8YCFurZk7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=09yZOD+jKhvlveWARMhu4GJ3tjX4o/vQkS9i3NxtNuo=;
 b=CGuz8K9+Rbnpmo7OHzJGDLpJcKMNpBWCjALLIUAt7egHsIyPSh+POHUgNx/ksU3yjgbpF4kp4N9qwgOQc8Vuc4IVJ04LGGwPnybO4LdyQ6+1MLuxjuJlwKWMYUQxT7VbtjgevloqNJEyA0CVu73XbnmGBpkIN3xPObHTxrnnwLKoE8biDnSp4RUGxS3feolXS/1ff4DDSQv5nqqHLpurr6kZrgl/SicwqnlgzBW0E2v02JYLlPRFSkpNS2m6LGRvQeRk1Ff6TMiA8lG7SI4sIOUxEsifuOzWC/LN85kH9m8/bJF+gB2rqeAHqmhjTxG+71y9mCyfN4Tl63bTlnNOlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=09yZOD+jKhvlveWARMhu4GJ3tjX4o/vQkS9i3NxtNuo=;
 b=G2YFMOlGjHMGqBxfBSRW9yHSNnhPDQWI13HSQpDU0AFTZai0BoOlSdVtF2+KqnNUcdrBnAva+8DASpQXwctMG7GPp1BVpmsI+GAes7NtE1E5is2m+VUvR8ryryBaeavxE8VCL4pJoY06XjqZgjfo5BcgJfrf00+MNHZ4Qm/3LIWO+CF6laTOdyc5WTb3SAAX3KSrW9XN98V+2GhOw6zyrN2z3gWAvcuS6smwtByIDFbuDeJg6+2C804r2rKnPRDIeYbsxnVBZ3dB2aGmxCa5cW4g9iTbmUC1uLxKLZwwT3ERSUPX4GPPajtl2AaUBZgaQQQ/byY2NEdHc/sG5nWldw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by DBAPR04MB7462.eurprd04.prod.outlook.com (2603:10a6:10:1a0::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Tue, 27 Oct
 2026 12:13:43 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0546.021; Tue, 27 Oct 2026
 12:13:42 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Tue, 27 Oct 2026 20:09:36 +0800
Subject: [PATCH v7 09/12] gpio: mxc: add dev_err_probe() for error paths to
 help diagnostics
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261027-gpio-mxc-cleanup-v7-4-v7-9-7b602d70c149@nxp.com>
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
X-ClientProxiedBy: SI2P153CA0005.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::11) To AM8PR04MB7874.eurprd04.prod.outlook.com
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
X-MS-Office365-Filtering-Correlation-Id: 83bd3921-fda5-42c3-778c-08df3423be05
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|376014|1800799024|23010399003|261026140227099003|11063799006|261026121527099003|261021123027099003|261021121427099003|261009223027099003|56012099006|261022105027099003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	mShRRODClAimuU0a6l+0z1FLfCbDE87/mHpqP8rNPNXZYp7JujpfpfGkkkOLYuxmtf2Ve6tZwNYydCew8YcrRHr8ptc642exTZPdrTsGeX94wLHJjqxvYArRdEKicoUyd+Tx8CW1A6PT94G1CO4HETHQaoZbfUbhTML1BLxGQHfrtvEm4HnyArpMol9nmwy8JoUmlFokKMGe88iIyasDfV246A1BmCYCqCLwlb71A1UoRnxZAuWSLjCAsYR6XQcI6gkyB7knqlxNb5xlZrKNJY+NgjTjTZhcTPgH+qA3urMEtZmTdY6x5kF0oti4lj/Y+eszy0N4QO0in5vqtk/7ogGay/MSmTrck/YodVbxLq/ZzdeTdYrhNkYy6MqBc0YlphcQCFnnQw9Rf4xeA6ijuEzGRJ4fWgayK69emCjYjOCJ3bmInKZqmqKx64tDmmde65tWobGckqDBlCjim4Lm/DQSIOEbhe7vRAWLH9kEokNJ+SgXKonr4EvotX+t7jh7NarRPLaKEx7LndNyfQVoPuiL2pIbokPtr+SeysrbGIwEqHqH5eLZkmtzrdkHCAG67rxD4GvFiXz8g0/60yfCNBmVELxCNsFGhZWXkU3GOfFDfjbripoEWvm0om4jHJWYnaafghGNqH8QtXYQrXUxfMZni6caPcidDLXfkO5dLew=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(376014)(1800799024)(23010399003)(261026140227099003)(11063799006)(261026121527099003)(261021123027099003)(261021121427099003)(261009223027099003)(56012099006)(261022105027099003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?emdHVmVZVzc3eXhySDlQZzZlNzA2aVhwOHM4K0xmN0N4c2RVZnUwcXBVZ2ty?=
 =?utf-8?B?YW14VXRhR3VBNk9tQXlCNFluV1JtU3VXc1M0Y0llTTRVYWJvbUFDaDkrVEEr?=
 =?utf-8?B?cmI0QzcxNXBGVS9uUTdCbERHTEMvRmF2SGFTdXdxM1p2WVNlREQwZVpqZm1F?=
 =?utf-8?B?cXltRFVUeEFNOWk0RDcwQ3BXNDdzbFBUeE5vaTFNQUdLbWh4QXRKM05NSzNr?=
 =?utf-8?B?aUI3a3k0cGlZV3JzS2VzS1AzTkJLRTZaZDdGeCt6TEpqazBiZFM2TkgvYjlo?=
 =?utf-8?B?YWY2clZ1UFZvZkwycU0zREJJODVOenNpTy80NWhYMmlRcDRJSVhPYTBWaHFr?=
 =?utf-8?B?c3ZJZ0tuQWYyRCt0QkpWQWRPTUVvSHU1Z0Q5NG0yYnBHdDJYYVFROXhmME1X?=
 =?utf-8?B?VnJQQUMrYjREWENzbzRhaHdlSVdkYVk1bFIxM0pDNEhjelgrTXRPQVg1M0Rp?=
 =?utf-8?B?WXNoM3d2SEcyVzJMQmRkN0VPdVZWY2RXZEJWR1c3eEVHWnNXVy9EaE92SXpJ?=
 =?utf-8?B?a2ViamNvTmNkVktzdFMvZjhNY3RDRWs4ZzNpRFk1MFltRDVoVmZNMDlrK2xI?=
 =?utf-8?B?ZzUwajF1bzQ4aXMxQy9JNVB6dmdpcTdzVE5CbU45WDc0aFpyQU1OZXBscm1U?=
 =?utf-8?B?VUsxY1JVZG51cHdTRy9IeTlMVDU1am5RTDRiZEhvTTFmQkQ0bGxtdm8wWm85?=
 =?utf-8?B?NlRqQkdhV1dxdjJGMTlWa1BTRW1nRFR1YXdqMHNJUG1BWnpXK3NFaGd5cHBF?=
 =?utf-8?B?bW1aaFEwT2ltTDk0STBYZmxmMFFQTk1VUlkwV2RObndLOVRBMGZvbUdXb2Qv?=
 =?utf-8?B?VkZPVFBQSnhkQkdEbllEQU15QzY2cGt4cnZSbFNoMHBjamRoelB4REFqMjFD?=
 =?utf-8?B?SkFxWkZMcGx4ekh3Rk1mOEVvd0pVODRNdmdpZUdRNUI5ZnZNampRTTZQem5o?=
 =?utf-8?B?VlJQWThlTlFBS0pwZk1jeHNpSEMxd1JYek5CcCtNc2hZRjFtY1hMVzN2RzFu?=
 =?utf-8?B?NnhWUmE3MTFhNCtIMmZMeGZ0cFM2K1dkREJKZW1oMGtiUExzMklzMFBRNVlX?=
 =?utf-8?B?YUpERGVkMTRFWHpheXh0QysyMllXaXZtRE1QVjY1eURmN3FLejRZYmNwSnBa?=
 =?utf-8?B?VzVNZlhJN1VmL0ZZWjJBeDY1cVR6ZFVsZ1U1U0wzMXRQQmtrdnZPb0l3dXF4?=
 =?utf-8?B?a01LanMyV0dlQStRZnMxSkpNbHJzeVB6WHFVQk1INDM1R1pyOTE2eEkzdmVr?=
 =?utf-8?B?ei9RQU5kU1FDVmtxSU5teEhpa29mUW1sSytsbENpUlJFUFRWTmZDallaZGFT?=
 =?utf-8?B?WUJ2U1ZOR3d3QVBZMEIxeU5yMTNvclA1dWpwZXlNUUtTcGo3MFIvUG1BRks0?=
 =?utf-8?B?NUI3aDQ2RmdEQjBEWTExTStyc3B4VThUckJsSkcrRVZTNHdWYjVzbzk5MXV2?=
 =?utf-8?B?b0xYMGREYmNVL1kxVk1SanQ4TzlpWVAzL0ZyVkc1QjI2ZzQrUXNGamsyVjZh?=
 =?utf-8?B?cSs2NEkvTHd5NFFNNmVidzQrTkRtUjZNNW1XclZRcWNNbnlydGszeDNkTnIx?=
 =?utf-8?B?SVB1TDZMQys5NEdMRUVRdVJVZWxkNjQrR3RxM0g5VVFZeTRpazNWRHN4c1NU?=
 =?utf-8?B?UjZPZEx6WnpjenZUMlllTUp2SEZROVVvSThETHREWEFYTnZ2Rk8xZ0luNGU2?=
 =?utf-8?B?b2hncTZhamM5NkNZTW5FaDlMVVpNVnVmYlFxeThPdVQ5bndYVXNxR1hqNkZD?=
 =?utf-8?B?c0c4THZxYXZjejlzK0lzQ3kzM2owRXY1NUhLYXp0S2g1aW9aWUtDR0ZBZXZm?=
 =?utf-8?B?b1NSMkV1UVFCa3d0WHA4alFOOTI1YS9OYnU1TTF6UnBhT2s1S3dYMnhrMVhT?=
 =?utf-8?B?ZWlOM1FqakdXOGRBNjNoaE9LalpGOTE0MUEyNkIzcWY2SWxaYTVNN25oOWxQ?=
 =?utf-8?B?ejFocHk1bmJpelRCMTFESlp2MmRaVlQzdVMvQU05Njk2a1Q1VnVldTRHUTBk?=
 =?utf-8?B?S0JDdFFHM1Z3YllGcnZBUHVFdHhWYkZ5VHBJTDZFYnRQV015eXdWOFkwUjR6?=
 =?utf-8?B?aFcwbGxkNExLeUloMXF6ZjFBbEpTUDNBeGdEZHJkZTRPNDJkR1RBWGhFVi9q?=
 =?utf-8?B?VTdCQkRqbUxMOUxvM2RRejFMMCtDWER6L1ZSM1M2V2Fhb2U4eXFPdGRBd1VD?=
 =?utf-8?B?anJrMFE2eWlkejhxWStjYjR3dDdCMGxtcHRvUU13NlNGZFN2UGZDcTJZckFk?=
 =?utf-8?B?U29QdnNMZ1FBME44bFNzQll4NitZWjBTYWdxWlRBSG9UZTBLQ0ppQ0QyOFlD?=
 =?utf-8?B?cExKN0wxVDkwUFM4N253dkdQL0JkNHhkZHozL2dKaXNqTzI4b3dhZjRSTTgv?=
 =?utf-8?Q?Cd0cKo/E4fc9pcEDSjQ7pXc9RE7kZ3DSDxN5u?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83bd3921-fda5-42c3-778c-08df3423be05
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2026 12:13:42.9109
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wUV/zWI0/TEcZu453Ww4gSmArpmbEP4kYFdYEAt45Kp1mRp5UTFdRqNzVrlniF2J5+iwp/l2rTLO+ush/XWdiRVFJS9elrdBM2KxUaEF9vs/sbRv/37PhQA+OyCC6/l5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7462

From: Peng Fan <peng.fan@nxp.com>

Use dev_err_probe() on probe error paths that do not already report the
failure, so that deferred probe reasons are recorded consistently.  Leave
the devm_platform_ioremap_resource() and platform_get_irq() paths alone;
those already log their errors.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/gpio/gpio-mxc.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
index eeb7d36e6b44..f816822e36ad 100644
--- a/drivers/gpio/gpio-mxc.c
+++ b/drivers/gpio/gpio-mxc.c
@@ -484,7 +484,7 @@ static int mxc_gpio_probe(struct platform_device *pdev)
 
 	irq_count = platform_irq_count(pdev);
 	if (irq_count < 0)
-		return irq_count;
+		return dev_err_probe(dev, irq_count, "Failed to count irq\n");
 
 	if (irq_count > 1) {
 		port->irq_high = platform_get_irq(pdev, 1);
@@ -499,7 +499,7 @@ static int mxc_gpio_probe(struct platform_device *pdev)
 	/* the controller clock is optional */
 	port->clk = devm_clk_get_optional_enabled(dev, NULL);
 	if (IS_ERR(port->clk))
-		return PTR_ERR(port->clk);
+		return dev_err_probe(dev, PTR_ERR(port->clk), "Failed to get clk\n");
 
 	pm_runtime_get_noresume(dev);
 
@@ -532,7 +532,7 @@ static int mxc_gpio_probe(struct platform_device *pdev)
 
 	err = gpio_generic_chip_init(&port->gen_gc, &config);
 	if (err)
-		return err;
+		return dev_err_probe(dev, err, "Failed to init gpio chip\n");
 
 	port->gen_gc.gc.request = mxc_gpio_request;
 	port->gen_gc.gc.free = mxc_gpio_free;
@@ -548,7 +548,7 @@ static int mxc_gpio_probe(struct platform_device *pdev)
 
 	irq_base = devm_irq_alloc_descs(dev, -1, 0, 32, numa_node_id());
 	if (irq_base < 0)
-		return irq_base;
+		return dev_err_probe(dev, irq_base, "Failed to alloc irq desc\n");
 
 	d_info = (struct irq_domain_info) {
 		.fwnode		= dev_fwnode(dev),
@@ -561,14 +561,15 @@ static int mxc_gpio_probe(struct platform_device *pdev)
 
 	port->domain = devm_irq_domain_instantiate(dev, &d_info);
 	if (IS_ERR(port->domain))
-		return PTR_ERR(port->domain);
+		return dev_err_probe(dev, PTR_ERR(port->domain),
+				     "Failed to create irq domain\n");
 
 	irq_domain_set_pm_device(port->domain, dev);
 
 	/* gpio-mxc can be a generic irq chip */
 	err = mxc_gpio_init_gc(port, irq_base);
 	if (err < 0)
-		return err;
+		return dev_err_probe(dev, err, "Failed to init generic irq chip\n");
 
 	/*
 	 * Register the GPIO chip last: devm_gpiochip_add_data() makes the
@@ -577,7 +578,7 @@ static int mxc_gpio_probe(struct platform_device *pdev)
 	 */
 	err = devm_gpiochip_add_data(dev, &port->gen_gc.gc, port);
 	if (err)
-		return err;
+		return dev_err_probe(dev, err, "Failed to add gpiochip data\n");
 
 	list_add_tail(&port->node, &mxc_gpio_ports);
 

-- 
2.51.0

