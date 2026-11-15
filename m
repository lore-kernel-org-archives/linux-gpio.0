Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.69.77
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794751339;
	b=5k7SF3yEs+KNG8M/oopuFVHW7sNSjPubBzr0MdEktxGUwe7Es6dtHBwXthfnM3JHjzKi
	 UZRztdvtzOdS373GTsx9enZjw+uchZ70w0Gkh/Y9CTqoYv6KC9oxlU+JqSTY3PU0eYLeZ
	 FCplzx6V1ypjGfLSZdxXM0SN11+zgqc/yBfTFw2S6wj6ATAYlf13rNajq1FdSYZbU9lrc
	 UnoLLBAjmg6mGm1BC2a2193BBI3hEitJRMDL6ddBVYlOCOfXJGYUPPojZxSgXw0/F1sqR
	 HtfnW8WDq9EznEzDTkVnQwpvFk3zx+3q90Wvl1uF5S9AVdBDRAZq89C3IJ7JH7wlzDQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794751339;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 User-Agent:Subject:To:Cc:References:From:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
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
	bh=PeuwGqfK6/Zp2pjIJ+3WFnudkM91oIUGx1KkPsRVrIM=;
	b=Lui0cRzspq9/XaEfwQGul/eOJJaePr49xKWTrYin3j85YwkFYwkNJWe3IB4PdbVFtpi0
	 34PlG29okVL2PLgRqj0ucGbiv7uSRxPU7V3cEXruxUovgdI/idDrmuwzO65BytXJG4hV6
	 hmae1OyeMNob3jYzZBhHcCjrKYKQvMhKdHVF3YaA2CPKqWesYb6sAEY3TLjysdPi4c4vd
	 ZelitU/t2OadbcWd327uKXST4QkesXcRdNRSRJcge8gk5m8cbywAnT5oE7/Siec59LCyD
	 40lWCTz+fZ9XnUp5NnDkHnZlmqh1Xdr6tMpsBeNGLlIevueeQl2rOSQ5cwpRJs7rzQw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=iopsys.eu;
	spf=pass smtp.mailfrom=genexis.eu;
	dkim=pass header.d=iopsys.eu header.i=@iopsys.eu header.a=rsa-sha256 header.s=selector1 header.b=nN3FydFg;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.69.77
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11020077.outbound.protection.outlook.com [52.101.69.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA3AE606A32E;
	Sun, 15 Nov 2026 14:02:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA3AE606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=genexis.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=iopsys.eu header.i=@iopsys.eu header.a=rsa-sha256 header.s=selector1 header.b=nN3FydFg
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ktxakIz0Zr6ADxeH9ki/Em/d2e05vmlG1B3iYtkJnquXJqdghluTJg3kZq2fxIZ+1tlcOHigmgj0vOE0bTyHJdLdZ8wm7J4vVfrFQBhelvTnHTBU/LAt/vWmbL4aJscWPaRujoCAbEuB6yxyUP6yah1HhxLHG/ctkcZb1Trw2h1LmOzHRqv08DsDEs6NQ50bRTtYwVOxFDwydtp2uGM4N6d09Kqt6qxoNYa0rwbUN14sIeIrMEY3PlbaG3ZIOvAGoqUYNrETFHWvh1QMjk9UOm4OxQNL28a9LPAWTvWCYtOSZVCzDxgkIy0dGPWDVgjE5Wqy9cKRXsfA2ObtkI5+Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PeuwGqfK6/Zp2pjIJ+3WFnudkM91oIUGx1KkPsRVrIM=;
 b=WR0Yz22YuR8YH51WLq+L6N1SXR7Y4Dz42PZpCYp3lEiOQ6oqqmjJdtk7RaZ4aL2w94Ptz0rvCLPRpoNBHRxM1g9QVNTFkQ2hEpbJxUub0qUyDN5aDqqA4Ze+wVbgHkfK+DFn6dE85Y9Pxbny4sLs2ZU1CF99o/OXpFRkztNXliIv4LJUUKZkZolfM2zcrqGpgN5a05swYNchgXtzeEDPjhjep8PDcFmitMOmtloAEzaSWBnHnkrBHeIS47CSxlSSPhXjUcXLncQBkegjgBML1/JsCHKtBI7iT92INQo3pr9yqxWAVO9WwpDtTvSFeoxNZfVq85vj/ktYS/w2OLG3PQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PeuwGqfK6/Zp2pjIJ+3WFnudkM91oIUGx1KkPsRVrIM=;
 b=nN3FydFgNCpMM7HhzAhDVkWxA6xt514TW2XuKV+/k1JS8Wwsb1UqjAT/B24a4U3XxgIcR45VTnZiBUDLxPicJG+Yz3kRZl4cM9suiERSJK2IRbB/Knm4Vst5f4JGHz4RcKvvNQJM/tD793z4GfGJFulo0o7JpkGiv+W9cszO0l5zWPZvn3j7RFUfNc7egBmx5P4RnrAAlCHtOOiDEXqT1TSxASEcDZtSaRFYHvDR/8XkNX32AdFcaYtddg9XN64rNvEEWXZhCRiT0AgYxetMwNLfT5lw7xGg+Iv+QvG5LRdd3hyeXvzOmQbELjMWsERvFvatdBx+7qLyvF/09PA2yA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by PAWPR08MB8791.eurprd08.prod.outlook.com (2603:10a6:102:334::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.13; Sun, 15 Nov
 2026 14:02:15 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%3]) with mapi id 15.21.0615.012; Sun, 15 Nov 2026
 14:02:15 +0000
Message-ID: <5e681d92-9772-42e3-aae8-47faacf6d850@iopsys.eu>
Date: Sun, 15 Nov 2026 17:02:12 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/12] pinctrl: airoha: an7581: fix PHY LED GPIO group
 assignments
To: Zhengping Zhang <zhengping.zhang@airoha.com>, linusw@kernel.org,
 lorenzo@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 brgl@kernel.org, naseefkm@gmail.com, benjamin.larsson@genexis.eu,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 lei.dong@airoha.com, ansuelsmth@gmail.com
References: <20261110094339.749110-1-zhengping.zhang@airoha.com>
 <20261110094339.749110-5-zhengping.zhang@airoha.com>
From: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Content-Language: en-US, ru-RU
In-Reply-To: <20261110094339.749110-5-zhengping.zhang@airoha.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: GV3PEPF0001DC2A.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:400::107) To DU2PR08MB10037.eurprd08.prod.outlook.com
 (2603:10a6:10:49a::20)
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
X-MS-TrafficTypeDiagnostic: DU2PR08MB10037:EE_|PAWPR08MB8791:EE_
X-MS-Office365-Filtering-Correlation-Id: 2cb0fea9-71c2-42d2-9991-08df43210da5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|366016|23010399003|10067099003|11063799006|4143699003|56012099006|261021123027099003|261021121427099003|261009221227099003|261009223027099003|261102123227099003|261026140227099003|261022105027099003|261026121527099003|261028144727099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	5nUeNOT4N/l9F2sbxnaKO5mYCOeJZ6p8UZGcPDPiZMODEfShktYXZFE9n6vzSb2yW1PVW7x6xt9XAoulJGojV35cHjP2k9OTu1C6k8I94oQWCbm4V2hxjhhSKo4yrXnJLEl1JppcFDqyDraA6ALdiXU4D5q/Q8NI6G4VBowwVy9jqBh+pWT/f3amRoHNY51IIAqzU0mSGMZ/OR0l0TV1c4My3FAt8jDGLuNJ+QaDDQNoSzvWwNC6DWrEa4ZT+EdOn3/Zo2WYQLor1OAIiHON73e4D3noI/gUqy8lhIToMF06vZ3QDyqvJys+lEquE37GMx4f6wmW+wg5feK2Xw6WD/ssuzouk3MX4L5ulowy02EOTpZg09YHgCW1Oa04sXMeARKir0Gf3+20zTkDZJavO39yBu0y/+qK4+pRBI+wbYwjS5oN3jsQwDTSPpN/5Zf9NA3KEHIK6mJNluzHNNMPUJtW2ajZWyZxJkC6YK2wBvnvxB6TXtkA3G3Y6lZL9c/eO1bmZnm2W5kHt6lCYEwV75VO4CJEjRp/BfIOMMjSJzRIW7MBKwUnZKDJhLF3FikjRN2l0BjZYNbLKjHPgTxnqp5dXpojwD8JLPP8aDuY57J/BiENv3jCi5Ru5MP5fALglfx1wcvIl581v1wdHjsoFc93B26LvtLa6jUGfWmj4iM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(23010399003)(10067099003)(11063799006)(4143699003)(56012099006)(261021123027099003)(261021121427099003)(261009221227099003)(261009223027099003)(261102123227099003)(261026140227099003)(261022105027099003)(261026121527099003)(261028144727099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UGQ3UFFFcW53aEdzQXZEdC9ONjUyRk5ka2NZaFdMaHlKczFzeW43a05TdHRU?=
 =?utf-8?B?cVBNWnFGU2s0d1NtQWYrWVBsY0hZb2RObVhWeVJTbTFZMnBJSzBXdGRHbzhQ?=
 =?utf-8?B?SENxK1N3d0NlTDZIcHdaTERGNTdXZkRKbWtSVjZSbVNqOGZSTTRkSjZtOVov?=
 =?utf-8?B?TXNMMUdZdUZPa3F0eE9CdXg4RTgyTWV6RHhDMUxxMVQ0eW5KRDltc0E2Y1E0?=
 =?utf-8?B?WkZuR2NpZVppWHo1RTZ2VkZ1L2ZiR2p4MzNEU29aQU8yL3EvWXVPb0wxbzlX?=
 =?utf-8?B?dTZlSjdhcGZPZzFNZzRTdE4wYUFuU2RrRWVpbUxSTXcwenFCN0JKT29HYVFT?=
 =?utf-8?B?K0E0eTN1YUYyeVY5aEVubldjL0NTTkcvRFgvRVdlV0hXSzdaSlpXeFVJUDVh?=
 =?utf-8?B?amxtRzFYMlVRdEFXVFBCaVZHdHNZb2EzU3ZRZXhPcjVoUFFBMlhTc2ViMG5k?=
 =?utf-8?B?emc0WVNkS1pWOGdzZ2I4VE51VU0zdEgwdnRzNnIzb0xxNjB0QjBoM1dtN2Fz?=
 =?utf-8?B?VW1mWjNmYVBpNUlvbWFFMkF3SWpoTEc0ZmdZMlFyQzZEWTNZeDZ0eFlHRDdK?=
 =?utf-8?B?RnhsanJ5dnpqalNUQkxVRm9GOE5kRjZZTW45RmhyVXhhbVpNdEw5Z2lNaUU3?=
 =?utf-8?B?STZXM0NQWUJqQ3NiZkNneGp5MTU1VmF3SmlqWXdZMEpiUUVjdVlzVGxhODFO?=
 =?utf-8?B?dlhOWHJHM0V6MExKcmNNUTZNTWRnT21yV1hVUGtJeTR0bkkrcUJzaGIwMnlv?=
 =?utf-8?B?bUhKcHlyODVSUTBxVWYyV3ZpVmZnYXJaU0lVVGthaEpkU05qazh0OXFGNWwy?=
 =?utf-8?B?MXh6YXIvUHNESGZZejVBZCtRWExtT1ZteW94L0VaR0dWQ3h3TnJvd3JVTlFW?=
 =?utf-8?B?dStWMURsUFpHaFpQWWhkWEo2WUNaS2k2Mi9QWEF5eUlwVTREV3RJcThMbUVt?=
 =?utf-8?B?amxxU0pRUGtJcGJlaTd4Q1crMXN0b0luSkJDSDZqSStNZUIrZjRnc2dQOWpi?=
 =?utf-8?B?MU5TMEV5d3VCZ3pYeGRsTFZKam9HTWhsV2VkSkd1WkMxeWp3RStzcFkxWUJi?=
 =?utf-8?B?dWszOVdZRmEzME9nVjc1OG1ldXplSnJjaWRPRzdkaVNRNkxrYnF0cmYwSzlS?=
 =?utf-8?B?RFJrNXI5d3I3Vy9UVW1yNzcza2tPMFNTYlVTbnVKQzI2THRXNGlMekFCS1pK?=
 =?utf-8?B?dEpabndyNkVHRjNScllVbmlERk5qbWRtby96dWtWUWhPbFcvemlTMzN3RnBO?=
 =?utf-8?B?cmQ0bjhnei9IOEVPVVplUjhHTFQ3UHNVWHRudFZUbml0bVlJZ0dwMWxRQitk?=
 =?utf-8?B?RWRMUllFVk1Gcmp1VDBvcU1MVGdod2JMcWFydDhacktCZFNXb2ZueUhOeDRy?=
 =?utf-8?B?MTA0VDZVZFd1T1pGSkJMTHZ1eG1Hb1FvL3Y0WHpXeUdjODFPNyswVThONEpJ?=
 =?utf-8?B?Q0dWN2VIYzExUCs3Y0JUS0FRc0pCK0dzOVZKaHUxdW5zdS9EV1g5YW4rcHJj?=
 =?utf-8?B?RkN5bkM2OVE4ZjBhaGE5QlppV1BHbnFjU3BFZExyL01TSklwRVdObkVhNFJm?=
 =?utf-8?B?R045dWVsSUdsWUtYbE1EVUI4czRDcDNEUGFBOFYzVTljdWJmZlNFb1VzeDRa?=
 =?utf-8?B?OHF1bldaTk94QWVUQTFMMVlob1Y1V1NJV3RoYU52ZG93M1gvSCtvSThldXI0?=
 =?utf-8?B?amRpb2lQRSs3ZXZJZm5QcittWWpFeTJJcTBzeURyb3c1a0V6bFVBMUpYSnRa?=
 =?utf-8?B?ckEzSWk5T0hwOEVHVm1MWGdqVCtRNUFDMGpRaTB6Nyt0cmNUeWptY3lOMXRj?=
 =?utf-8?B?RTJMeU5HNFV2NzBLL3N3cWM5UWJVeHd1RG5vR29tTVdrUVcyMTBXNlc3MlVo?=
 =?utf-8?B?cm1ndkFQRjVZNm5GYjdwczNPdE91Y1B5NXVqRUh2Z1Z0SzVZZEVGaE5LczlC?=
 =?utf-8?B?bE13Qk5GTlZxWnVpYmtRS2hrVXVGd1R2ejMxOWpxZXVsSUtaaW9XNm5ScVdL?=
 =?utf-8?B?dlduRUE4d2tiRUI0VXk2a1k4VERrNHlmVUZqSjJiU2FYb0lVMklzS1JWMTRZ?=
 =?utf-8?B?WGl2dXp4NENTWmwwcnA3dFFBcldnYkdBRng5TURkU2ppaUM0RjJtWEVsdVkz?=
 =?utf-8?B?Y3ZrU3h3UGQycUVqdEVKdDhoMU9XVWpVZXh6ZkNIanZqZGtIM3NMdHNGa3NF?=
 =?utf-8?B?aUlvY3A3L2dZRWUxUTIxUVMrNjkzaThEeDRtZmdwMXE0bzNHclF0SGk1eGJ4?=
 =?utf-8?B?QnVZdnloa29XdXJFOEQ2Z3hiREptU2VvOTQ5T2t5dlhNQ1lNUmxYVUtzRmlX?=
 =?utf-8?B?L0VmbldZNHFnZ3lmL2JXdXhVd0NGY1VrK3I5bjVTWlZVYXU4d1kyUzU3aDBv?=
 =?utf-8?Q?xqtWOHds8eTm71+0=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 2cb0fea9-71c2-42d2-9991-08df43210da5
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2026 14:02:15.3667
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UIgi1GEdFURh4sVUM2rj4G5kkPtX+A22X16LU7yVwT8C3w9YA8whg5ScK3J5JzqJ0xLCIiuHLrtx7gbVrJjbRd61WJLDGPhMBRJdvopES1w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB8791

according to an7581 datasheet
* LED0 uses GPIO33-35 and GPIO42 * LED1 uses GPIO43-46 so patch is not
needed

On 11/10/26 12:43, Zhengping Zhang wrote:
> [You don't often get email from zhengping.zhang@airoha.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>
> The PHY LED function tables associate LED0 mux bits with the GPIO pads
> used by LED1, and vice versa. Selecting an LED function therefore
> programs the mux bit for a different pad from the requested group.
>
> The LED mux bits in SCU register 0x214 correspond to these GPIO pads:
>
>                   LAN0    LAN1    LAN2    LAN3
>   LED0 mux bit       3       5       7       9
>   LED0 GPIO         43      44      45      46
>   LED1 mux bit       4       6       8      10
>   LED1 GPIO         33      34      35      42
>
> Correct both the advertised groups and the function-group entries to
> match these assignments. This ensures that the pin claimed by pinctrl
> matches the pad controlled by the selected LED mux bit.
>
> Keep the existing mux masks and PHY source selections in the LED0/1
> mapping registers unchanged.
>
> Signed-off-by: Zhengping Zhang <zhengping.zhang@airoha.com>
> ---
>  drivers/pinctrl/airoha/pinctrl-an7581.c | 80 ++++++++++++-------------
>  1 file changed, 40 insertions(+), 40 deletions(-)
>
> diff --git a/drivers/pinctrl/airoha/pinctrl-an7581.c b/drivers/pinctrl/airoha/pinctrl-an7581.c
> index bfb777594811b..3cbdfc31e97e5 100644
> --- a/drivers/pinctrl/airoha/pinctrl-an7581.c
> +++ b/drivers/pinctrl/airoha/pinctrl-an7581.c
> @@ -594,28 +594,28 @@ static const char *const pwm_groups[] = {
>         "gpio46", "gpio47", "gpio48", "gpio49"
>  };
>  static const char *const phy1_led0_groups[] = {
> -       "gpio33", "gpio34", "gpio35", "gpio42"
> +       "gpio43", "gpio44", "gpio45", "gpio46"
>  };
>  static const char *const phy2_led0_groups[] = {
> -       "gpio33", "gpio34", "gpio35", "gpio42"
> +       "gpio43", "gpio44", "gpio45", "gpio46"
>  };
>  static const char *const phy3_led0_groups[] = {
> -       "gpio33", "gpio34", "gpio35", "gpio42"
> +       "gpio43", "gpio44", "gpio45", "gpio46"
>  };
>  static const char *const phy4_led0_groups[] = {
> -       "gpio33", "gpio34", "gpio35", "gpio42"
> +       "gpio43", "gpio44", "gpio45", "gpio46"
>  };
>  static const char *const phy1_led1_groups[] = {
> -       "gpio43", "gpio44", "gpio45", "gpio46"
> +       "gpio33", "gpio34", "gpio35", "gpio42"
>  };
>  static const char *const phy2_led1_groups[] = {
> -       "gpio43", "gpio44", "gpio45", "gpio46"
> +       "gpio33", "gpio34", "gpio35", "gpio42"
>  };
>  static const char *const phy3_led1_groups[] = {
> -       "gpio43", "gpio44", "gpio45", "gpio46"
> +       "gpio33", "gpio34", "gpio35", "gpio42"
>  };
>  static const char *const phy4_led1_groups[] = {
> -       "gpio43", "gpio44", "gpio45", "gpio46"
> +       "gpio33", "gpio34", "gpio35", "gpio42"
>  };
>
>  static const struct airoha_pinctrl_func_group pon_func_group[] = {
> @@ -1067,90 +1067,90 @@ static const struct airoha_pinctrl_func_group pwm_func_group[] = {
>  };
>
>  static const struct airoha_pinctrl_func_group phy1_led0_func_group[] = {
> -       AIROHA_PINCTRL_PHY_LED0("gpio33", GPIO_LAN0_LED0_MODE_MASK,
> +       AIROHA_PINCTRL_PHY_LED0("gpio43", GPIO_LAN0_LED0_MODE_MASK,
>                                 LAN0_LED_MAPPING_MASK, LAN0_PHY_LED_MAP(0)),
> -       AIROHA_PINCTRL_PHY_LED0("gpio34", GPIO_LAN1_LED0_MODE_MASK,
> +       AIROHA_PINCTRL_PHY_LED0("gpio44", GPIO_LAN1_LED0_MODE_MASK,
>                                 LAN1_LED_MAPPING_MASK, LAN1_PHY_LED_MAP(0)),
> -       AIROHA_PINCTRL_PHY_LED0("gpio35", GPIO_LAN2_LED0_MODE_MASK,
> +       AIROHA_PINCTRL_PHY_LED0("gpio45", GPIO_LAN2_LED0_MODE_MASK,
>                                 LAN2_LED_MAPPING_MASK, LAN2_PHY_LED_MAP(0)),
> -       AIROHA_PINCTRL_PHY_LED0("gpio42", GPIO_LAN3_LED0_MODE_MASK,
> +       AIROHA_PINCTRL_PHY_LED0("gpio46", GPIO_LAN3_LED0_MODE_MASK,
>                                 LAN3_LED_MAPPING_MASK, LAN3_PHY_LED_MAP(0)),
>  };
>
>  static const struct airoha_pinctrl_func_group phy2_led0_func_group[] = {
> -       AIROHA_PINCTRL_PHY_LED0("gpio33", GPIO_LAN0_LED0_MODE_MASK,
> +       AIROHA_PINCTRL_PHY_LED0("gpio43", GPIO_LAN0_LED0_MODE_MASK,
>                                 LAN0_LED_MAPPING_MASK, LAN0_PHY_LED_MAP(1)),
> -       AIROHA_PINCTRL_PHY_LED0("gpio34", GPIO_LAN1_LED0_MODE_MASK,
> +       AIROHA_PINCTRL_PHY_LED0("gpio44", GPIO_LAN1_LED0_MODE_MASK,
>                                 LAN1_LED_MAPPING_MASK, LAN1_PHY_LED_MAP(1)),
> -       AIROHA_PINCTRL_PHY_LED0("gpio35", GPIO_LAN2_LED0_MODE_MASK,
> +       AIROHA_PINCTRL_PHY_LED0("gpio45", GPIO_LAN2_LED0_MODE_MASK,
>                                 LAN2_LED_MAPPING_MASK, LAN2_PHY_LED_MAP(1)),
> -       AIROHA_PINCTRL_PHY_LED0("gpio42", GPIO_LAN3_LED0_MODE_MASK,
> +       AIROHA_PINCTRL_PHY_LED0("gpio46", GPIO_LAN3_LED0_MODE_MASK,
>                                 LAN3_LED_MAPPING_MASK, LAN3_PHY_LED_MAP(1)),
>  };
>
>  static const struct airoha_pinctrl_func_group phy3_led0_func_group[] = {
> -       AIROHA_PINCTRL_PHY_LED0("gpio33", GPIO_LAN0_LED0_MODE_MASK,
> +       AIROHA_PINCTRL_PHY_LED0("gpio43", GPIO_LAN0_LED0_MODE_MASK,
>                                 LAN0_LED_MAPPING_MASK, LAN0_PHY_LED_MAP(2)),
> -       AIROHA_PINCTRL_PHY_LED0("gpio34", GPIO_LAN1_LED0_MODE_MASK,
> +       AIROHA_PINCTRL_PHY_LED0("gpio44", GPIO_LAN1_LED0_MODE_MASK,
>                                 LAN1_LED_MAPPING_MASK, LAN1_PHY_LED_MAP(2)),
> -       AIROHA_PINCTRL_PHY_LED0("gpio35", GPIO_LAN2_LED0_MODE_MASK,
> +       AIROHA_PINCTRL_PHY_LED0("gpio45", GPIO_LAN2_LED0_MODE_MASK,
>                                 LAN2_LED_MAPPING_MASK, LAN2_PHY_LED_MAP(2)),
> -       AIROHA_PINCTRL_PHY_LED0("gpio42", GPIO_LAN3_LED0_MODE_MASK,
> +       AIROHA_PINCTRL_PHY_LED0("gpio46", GPIO_LAN3_LED0_MODE_MASK,
>                                 LAN3_LED_MAPPING_MASK, LAN3_PHY_LED_MAP(2)),
>  };
>
>  static const struct airoha_pinctrl_func_group phy4_led0_func_group[] = {
> -       AIROHA_PINCTRL_PHY_LED0("gpio33", GPIO_LAN0_LED0_MODE_MASK,
> +       AIROHA_PINCTRL_PHY_LED0("gpio43", GPIO_LAN0_LED0_MODE_MASK,
>                                 LAN0_LED_MAPPING_MASK, LAN0_PHY_LED_MAP(3)),
> -       AIROHA_PINCTRL_PHY_LED0("gpio34", GPIO_LAN1_LED0_MODE_MASK,
> +       AIROHA_PINCTRL_PHY_LED0("gpio44", GPIO_LAN1_LED0_MODE_MASK,
>                                 LAN1_LED_MAPPING_MASK, LAN1_PHY_LED_MAP(3)),
> -       AIROHA_PINCTRL_PHY_LED0("gpio35", GPIO_LAN2_LED0_MODE_MASK,
> +       AIROHA_PINCTRL_PHY_LED0("gpio45", GPIO_LAN2_LED0_MODE_MASK,
>                                 LAN2_LED_MAPPING_MASK, LAN2_PHY_LED_MAP(3)),
> -       AIROHA_PINCTRL_PHY_LED0("gpio42", GPIO_LAN3_LED0_MODE_MASK,
> +       AIROHA_PINCTRL_PHY_LED0("gpio46", GPIO_LAN3_LED0_MODE_MASK,
>                                 LAN3_LED_MAPPING_MASK, LAN3_PHY_LED_MAP(3)),
>  };
>
>  static const struct airoha_pinctrl_func_group phy1_led1_func_group[] = {
> -       AIROHA_PINCTRL_PHY_LED1("gpio43", GPIO_LAN0_LED1_MODE_MASK,
> +       AIROHA_PINCTRL_PHY_LED1("gpio33", GPIO_LAN0_LED1_MODE_MASK,
>                                 LAN0_LED_MAPPING_MASK, LAN0_PHY_LED_MAP(0)),
> -       AIROHA_PINCTRL_PHY_LED1("gpio44", GPIO_LAN1_LED1_MODE_MASK,
> +       AIROHA_PINCTRL_PHY_LED1("gpio34", GPIO_LAN1_LED1_MODE_MASK,
>                                 LAN1_LED_MAPPING_MASK, LAN1_PHY_LED_MAP(0)),
> -       AIROHA_PINCTRL_PHY_LED1("gpio45", GPIO_LAN2_LED1_MODE_MASK,
> +       AIROHA_PINCTRL_PHY_LED1("gpio35", GPIO_LAN2_LED1_MODE_MASK,
>                                 LAN2_LED_MAPPING_MASK, LAN2_PHY_LED_MAP(0)),
> -       AIROHA_PINCTRL_PHY_LED1("gpio46", GPIO_LAN3_LED1_MODE_MASK,
> +       AIROHA_PINCTRL_PHY_LED1("gpio42", GPIO_LAN3_LED1_MODE_MASK,
>                                 LAN3_LED_MAPPING_MASK, LAN3_PHY_LED_MAP(0)),
>  };
>
>  static const struct airoha_pinctrl_func_group phy2_led1_func_group[] = {
> -       AIROHA_PINCTRL_PHY_LED1("gpio43", GPIO_LAN0_LED1_MODE_MASK,
> +       AIROHA_PINCTRL_PHY_LED1("gpio33", GPIO_LAN0_LED1_MODE_MASK,
>                                 LAN0_LED_MAPPING_MASK, LAN0_PHY_LED_MAP(1)),
> -       AIROHA_PINCTRL_PHY_LED1("gpio44", GPIO_LAN1_LED1_MODE_MASK,
> +       AIROHA_PINCTRL_PHY_LED1("gpio34", GPIO_LAN1_LED1_MODE_MASK,
>                                 LAN1_LED_MAPPING_MASK, LAN1_PHY_LED_MAP(1)),
> -       AIROHA_PINCTRL_PHY_LED1("gpio45", GPIO_LAN2_LED1_MODE_MASK,
> +       AIROHA_PINCTRL_PHY_LED1("gpio35", GPIO_LAN2_LED1_MODE_MASK,
>                                 LAN2_LED_MAPPING_MASK, LAN2_PHY_LED_MAP(1)),
> -       AIROHA_PINCTRL_PHY_LED1("gpio46", GPIO_LAN3_LED1_MODE_MASK,
> +       AIROHA_PINCTRL_PHY_LED1("gpio42", GPIO_LAN3_LED1_MODE_MASK,
>                                 LAN3_LED_MAPPING_MASK, LAN3_PHY_LED_MAP(1)),
>  };
>
>  static const struct airoha_pinctrl_func_group phy3_led1_func_group[] = {
> -       AIROHA_PINCTRL_PHY_LED1("gpio43", GPIO_LAN0_LED1_MODE_MASK,
> +       AIROHA_PINCTRL_PHY_LED1("gpio33", GPIO_LAN0_LED1_MODE_MASK,
>                                 LAN0_LED_MAPPING_MASK, LAN0_PHY_LED_MAP(2)),
> -       AIROHA_PINCTRL_PHY_LED1("gpio44", GPIO_LAN1_LED1_MODE_MASK,
> +       AIROHA_PINCTRL_PHY_LED1("gpio34", GPIO_LAN1_LED1_MODE_MASK,
>                                 LAN1_LED_MAPPING_MASK, LAN1_PHY_LED_MAP(2)),
> -       AIROHA_PINCTRL_PHY_LED1("gpio45", GPIO_LAN2_LED1_MODE_MASK,
> +       AIROHA_PINCTRL_PHY_LED1("gpio35", GPIO_LAN2_LED1_MODE_MASK,
>                                 LAN2_LED_MAPPING_MASK, LAN2_PHY_LED_MAP(2)),
> -       AIROHA_PINCTRL_PHY_LED1("gpio46", GPIO_LAN3_LED1_MODE_MASK,
> +       AIROHA_PINCTRL_PHY_LED1("gpio42", GPIO_LAN3_LED1_MODE_MASK,
>                                 LAN3_LED_MAPPING_MASK, LAN3_PHY_LED_MAP(2)),
>  };
>
>  static const struct airoha_pinctrl_func_group phy4_led1_func_group[] = {
> -       AIROHA_PINCTRL_PHY_LED1("gpio43", GPIO_LAN0_LED1_MODE_MASK,
> +       AIROHA_PINCTRL_PHY_LED1("gpio33", GPIO_LAN0_LED1_MODE_MASK,
>                                 LAN0_LED_MAPPING_MASK, LAN0_PHY_LED_MAP(3)),
> -       AIROHA_PINCTRL_PHY_LED1("gpio44", GPIO_LAN1_LED1_MODE_MASK,
> +       AIROHA_PINCTRL_PHY_LED1("gpio34", GPIO_LAN1_LED1_MODE_MASK,
>                                 LAN1_LED_MAPPING_MASK, LAN1_PHY_LED_MAP(3)),
> -       AIROHA_PINCTRL_PHY_LED1("gpio45", GPIO_LAN2_LED1_MODE_MASK,
> +       AIROHA_PINCTRL_PHY_LED1("gpio35", GPIO_LAN2_LED1_MODE_MASK,
>                                 LAN2_LED_MAPPING_MASK, LAN2_PHY_LED_MAP(3)),
> -       AIROHA_PINCTRL_PHY_LED1("gpio46", GPIO_LAN3_LED1_MODE_MASK,
> +       AIROHA_PINCTRL_PHY_LED1("gpio42", GPIO_LAN3_LED1_MODE_MASK,
>                                 LAN3_LED_MAPPING_MASK, LAN3_PHY_LED_MAP(3)),
>  };
>
> --
> 2.43.0
>
