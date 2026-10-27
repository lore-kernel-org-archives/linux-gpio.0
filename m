Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.37
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793103205;
	b=4tO8B3/tdO2R2Gg1v9rUqFtrDOWYWqpY4grrDsja7NlqRF0BBGkR4cOeof0l7QcH9MIH
	 vyHpdX/QfBkn+MhsQpNduCG5wzcercBUm72vWA+OxOSWboF0G9cirezHKJ3NWYJdCTXdE
	 6cV9wsMmQlNFtsplXfskakijPpmve1dSaeRGOmbLUDIAHvV68h/gqwIJMxdyug3/dJOnK
	 qxl/kbUuOQmOJaGOh0kUD1cfpjZEUMXGVpuWtcN2Tysaks+UUAb8QIL1Lz7/x+LoNBgWC
	 oASZjLj8Rpb3qaaRgxeuZcGNzbhvBmSg2qrI0ls/tIcSRjcPEULzzLzdtxl/cK+qNZA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793103205;
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
	bh=CaZC0x1g0mG/p2BuKGwvqdq6KuHMhnyQ9MvmIGa8wQc=;
	b=nXghUEfESCkZlyALyOy9Fo+0PTunMqTUGD3667RHo3Vi8ObwRAelqcMcIzY7sjVjWPtn
	 WtXmA+JfffWQumjK4GYNcfl+jwXxJiAO9vwjNgujJEiUu9nUJmMo4ayOjapGsX/eK/2D0
	 pxm/TwW9lLlFKHDwZGsM89a2ajT85B7xgYZbBFm1lXcINzDVnma0b1aIM/QKUfiQkdsbq
	 TNWo9htK2q7v+PQegfcU9yafDyheBmJWyX4ZGg2ixk9/Pu0czBf4e6Qev6hBtFLJpkZle
	 vEF/jMpozYcPV1T73zEF7YLULcYxyO65rDr7nUGkVnpiX2/xgoBJ7AVHKA0KAa7hU2Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=UDBTX2UI;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.37
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011037.outbound.protection.outlook.com [40.107.130.37])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98FE4606A339;
	Tue, 27 Oct 2026 12:13:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 98FE4606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=UDBTX2UI
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bm4t0vfP8wvqXk8xUs5LxU7sS212c0MD6waUVLt7xPx2SORda0rK7hY/O2nBXQp/G5Ij2wNGSKkbhQAyFw626XYvY1rZw2+F5mpnJKtl7VWkQ+/N8iK4Y5vD9ZRsg2ipIfk7MeCbKTSQn0vqjGtwPRNHShWh6N3Yni5AxTumzXSLBa8TZFZivzjDJuzZVbxTQdBa0yCAfQ4MF+zw26kyzf8E/2cbRgJQU2LfuBWExgw+KqDwNGzH32oZOdVoy9dxwyss4gLz0T4CC8fhwpJJggP3Hd/0JhFU8Avmts+WFoZl9aJkXWlbiqYfJU1JdT7VNkEmOyamTXmMyt+9fp8YpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CaZC0x1g0mG/p2BuKGwvqdq6KuHMhnyQ9MvmIGa8wQc=;
 b=a9f7u+NGD7X1d4yBl4DFlQHHMJ4RDbLUSql86gHWUuuCVwp5glQPNllk7AP1d2hknkFLUf0xSAfRNwO8McPEAxLgIkEiL9vfDhYMYg/dmrpIuAvgM18BfPxkzgQFx8GNGH5e19oku50FcysnM6q0JljiUKxerC0fhZUqmGTfNq/MUXeDYucYldQOZpwqkulKxvAUHMZ9AvQS8A0BgEUOXjRJFSVw3duyMvlNWwvW5KnATUbAwTEUIo+jipssjE/E+4SAzsFbHwfL1qSs/g7kddsuwrjWHUG+4CXPzn4Vh9+d1eUdMhZep2Aeg8rbGEPGkJ542mWqV46WH4ptKw+wXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CaZC0x1g0mG/p2BuKGwvqdq6KuHMhnyQ9MvmIGa8wQc=;
 b=UDBTX2UI596c+k1TrB7awsU6417D09JqZO3F3mRqh59EzXwKN3AdjLgEEXWeqY+byJvqb13fyL0yeORKt0OewYmLRGynUN/3j2UzIXoXbs/LbnYfpdL0ogkkM58b7/xMwZKCuVuNykoTkw1SODVgUEofmpoUm3ghECGiOjcML5X9OSn/k8OGMGaXRQkeset721iE61rCHqs4uAASgtU27TNKYhguIQU7IkuixXKDK5ufCQh4MRufXnizPM2F7geIyoo1YaoDEazHsyioyWCwjEmE5NRzKcK+iUsjGQ2hhxjYTsUGQS1M303retXYLjJqr4e4ypg9oPZwja/c3YKn9w==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by DBAPR04MB7462.eurprd04.prod.outlook.com (2603:10a6:10:1a0::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Tue, 27 Oct
 2026 12:13:21 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0546.021; Tue, 27 Oct 2026
 12:13:21 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Tue, 27 Oct 2026 20:09:33 +0800
Subject: [PATCH v7 06/12] gpio: mxc: use local dev variable
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261027-gpio-mxc-cleanup-v7-4-v7-6-7b602d70c149@nxp.com>
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
X-ClientProxiedBy: SI3PR01CA0010.apcprd01.prod.exchangelabs.com
 (2603:1096:4:296::16) To AM8PR04MB7874.eurprd04.prod.outlook.com
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
X-MS-Office365-Filtering-Correlation-Id: 61c1f156-d591-401c-376b-08df3423b14b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|376014|1800799024|23010399003|261026140227099003|11063799006|261026121527099003|261021123027099003|261021121427099003|261022075727099003|261009221227099003|261009223027099003|56012099006|261022105027099003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	dNRFnIqkcrGCKgsrtg3tx16icqM2I2A092OFRA8vLCtym4mPtbz2Vfm5o8gPSa7juriz0r5lT+BrGrpl/ONmewf6wsSTzVYZ0C+iG+DWaiF51OQGYOG/hovzo6GOAYV/0qnc2KP+8bXbWN/DNAfOAJBBNM4/oxGoEO0DjeUpO+jsrEKxuVI/q0bIBiiB0qINULR7lcwmjJ71p2XAhkN7qsl0fQ3UmYkV3CqhU7Lm/BNzXIGcx7474eQmj1vjlWAwLVDgZaT6448jD68r8Jk4j+l7kpltyAFugGbYoeqnS6wxLz49A5TqoJfpMSZ7pkvrV+d1rlOz+e6VxsXJtXmRjwhwmus7HZquAhnYLFnfI0ME4rzwAjirGNP/l2TqlEj7a+qTn3k7Hkjl5wk3Q1ItTcKl6nMZYfQK+uwMBKRDA0nYxb1w/TVblPp4FDx9bRDtY/SrLC1np1ViKBNos2y/jC/B8GtRxZnKZ1BtW7p+npoSYgROs+4PmbMCBBe4TzgC7brZzlEKu3CzdBNFOq0+DvlGlfUtXFPnBgLIDPpRw4Dm7fSpfMiQv5FceZqM3nGbtnhY3NtaXAC8yCoFuHgc0rTdvgRDZb1Rb9pXn1UjpN1VwqAQUH+IeudwT0iz5sDrqqkqcvOvRR26SzdKJMAL8yg8qO8uRzPzwro1xWJjbok=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(376014)(1800799024)(23010399003)(261026140227099003)(11063799006)(261026121527099003)(261021123027099003)(261021121427099003)(261022075727099003)(261009221227099003)(261009223027099003)(56012099006)(261022105027099003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ODRWOWNxWnV2S0lJWTR0VGdpbVlqTzhYOWJ2VW9Sd1AwQUhWaEdhemU1eUpV?=
 =?utf-8?B?S1gxNWpzZ3lpdnRiMGxtMDFHeTZXSkxjZEJ4b2RiV2gxNE9XNE9TT3djZEdW?=
 =?utf-8?B?S3VIaStiZStwbzJQdkNyTExUcCtxVXl2SDkrUWRvR2JmdEtKd0cvQjgvVzdJ?=
 =?utf-8?B?VFlkSEVMRG9rNXh5cWFwL1A3SVZPNWgxNWxkbk5wNEFyZFJtTGp4bXQxRmJl?=
 =?utf-8?B?cVdnUkhWZitYaS9nRkd5V3JpcVpsbFdVWFhJVHhjUTloZXZ1WEdpZkNacUxp?=
 =?utf-8?B?S3hpMDVsRStTMkN4SzMzalIvQjk4Zi9PMFhKSVYrT0htMzVKRmNtaWJEUUVy?=
 =?utf-8?B?aUFTT2tScE02elM5NG5pOC9TdnlLQURSUnd6aUhFSmdZNEtXK2xrbTZ3Q0pq?=
 =?utf-8?B?bk80MXd0dDdLUG9KMFFQbnRCNDVvY2gvMnhFK3M1SW5Cai83d0N4OU9mOGlo?=
 =?utf-8?B?UVFCMEZYRjRSMlpZZ2p5VEtJOS9wVzg3MUlnVTF1SnZMZWRiVnhUV2ZoQTBV?=
 =?utf-8?B?aDB3YU5jZzMxblkrL0xiQzJaSE16eTNMNXptQnMzRE9wdVArdVZNdElFeUJa?=
 =?utf-8?B?d3lUa0haeFRMa2dRRUNOdU1VYy84M1ZKamNOdFI2NlhlN0hLVlJ5NGQ3aGNK?=
 =?utf-8?B?UzlsUVlaeGxwTWU2OUVFSUJDcHhJOGVKR1NXd1lXaktkRFZrNERxRXBwV1Zy?=
 =?utf-8?B?TzRva0tlcjZJM0VjbnE1bGIxaUdDb0tuT2FyQ1I5L2FYTy9tQmdzVHVwd1hG?=
 =?utf-8?B?VzFNcnRnVFNjK1hCektTbVdtSEJQNVIrYUxhN2RHY1I3UEEzckZ1U0ppbW9s?=
 =?utf-8?B?V3hTcXZ3RjlkRTMrUy8wU2hKMjM4elhhOU9SREo2amN4UDF3eWE2aFlZWlVn?=
 =?utf-8?B?UmVhWjNEWGVGS0M0SXF2MkYraXdsY3lhV2dNMysrU01HY0krUUJjMEx4TGhL?=
 =?utf-8?B?cXlGOEgxZVdlam5WSlMzZHliV0FPcDhpejBTeFFlWVp6YUQyU0dHUm1TODMv?=
 =?utf-8?B?M2g5VnFJb2RCek9mWnk2Qjl5a0UraW1LVzhsNTlBUVNucitYUHdzeXI5TnVy?=
 =?utf-8?B?U0tCdEszZy8zS0FvSGdwSVA4eGZjYjlkQW5ha1lMb1ZsWDVGUzFwK1o4V3dr?=
 =?utf-8?B?enVGZ0gxMGRkNk14aTNMVnZ5YUllN2RNOHJZSGM0U3BxeXI0aXZhL0MzSkg0?=
 =?utf-8?B?bFlXYTlEVnFMWDEvcVBjQzRXcGNkZWFMNWpYbXhXb0NRanZwc0FEZEtPMFN0?=
 =?utf-8?B?TndsS1hYdDVsRFNnMTM0eGNsNVlmaVd6NTJKcFNPNXZFVHZMcnNsa0lDcHB5?=
 =?utf-8?B?alcwckZIcURBSW9iNGZNOVRNY3pIT2pjdko1ellWandmZzBrd2ZKWm5ibDlU?=
 =?utf-8?B?ZjJ5R2NFanhwMWd3QzZZQStPbi9IZEZjVG40b0ZTbEwxTTRwdm9ZK1BtR1Rk?=
 =?utf-8?B?aTFRSGdFUk9pMVNNVFpwdHhlNzFFM3k1UkQvUVBzblFPckIxVGt1WUtDNm5G?=
 =?utf-8?B?cVFRdm1yZWdvWitBQzNQS0lVdjZ3eVhicnoyamE0U2NhOHZ6Y2U5TVd4aUh4?=
 =?utf-8?B?RWxqK2tmekF4SjlwdUs5aTFEeWplSk1ZU3RUNUhKa3lFb1FuWW9OaFQ0TXB2?=
 =?utf-8?B?ZVJRQXUxSXB2emhTdVp6WENONkZxTU9QdUhobHJTRVh6d3UrQ29XenI1T3Za?=
 =?utf-8?B?enhrVTY1cTFsNWczaU5udkZvU3JqYndxVytQQVB0WDhuNXU3OVdzV1hIQkJW?=
 =?utf-8?B?bTE0Tk40bUIzcUxzNGdnZitiWjJFSVBIZVlIclprK05mRGVvY24xd0RZOWFT?=
 =?utf-8?B?bE5yVEd3bS9PejN1NC8wRUpSeGE4THkwbjE3dDBWcE1hZWYvV0phWDdGOG42?=
 =?utf-8?B?QW1qVllIOXNCYU42dTBsVm4ydjNTYUJpalQ2N1JycmdOVzEzKzVkWDRaUUN3?=
 =?utf-8?B?elJvNFdVNWc3WGJ0cDRMa2h6RXI1cCtXekJkRlE5STNnNzZDcG9HeUsxZHND?=
 =?utf-8?B?WXZkZE94aUV1WjBaVGREdVVWcFZsaWk2YlBlYWFxbVhhUXJ1dDZLaWNwYW4x?=
 =?utf-8?B?Vk03VVYvSTVpcGJ3Y3EwMjdSSFJCS1pLK0MxdnNHYnBnSnByaEw2dTd1dHUv?=
 =?utf-8?B?Wk9JV3FLK0w2SGZBcDNPd3RnU0s0cjcySGdIakpBQm9rZ0Q1VDZZM1h3aWk4?=
 =?utf-8?B?bTFKZldLVG03QlhwczRFV0xqZXRHTFZiTVEyaUs1Yk5xcHZ0ck9KeXRWMnNI?=
 =?utf-8?B?bE9NaTlRcW5WOXl0cXJoZWFyNlNLQmRwckRHL1NJWlFHMnVNU2FwaWdqOVJL?=
 =?utf-8?B?a0xWc3ZPTlI0cGw2clkxY3pDejlpOXlFd2lDQWFTUG1QSmNuTG0rTUFKK1Nw?=
 =?utf-8?Q?OCsXashh7xY68xx65oBzpnFAFH7f7JuXdOL19?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 61c1f156-d591-401c-376b-08df3423b14b
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2026 12:13:21.4075
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0uTcStxn9Jfyxk2AERCy69x+33diEfOg6W4dSKNnts64pUr2Hr0epBuHI1CGCXQFGs2eIHTXqOELYf9UaEHI/J3jH/guypL0U+15y9JMWHXRs7v1pl8O/ptaI6KYSyal
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7462

From: Peng Fan <peng.fan@nxp.com>

Introduce a local 'struct device *dev' variable to replace repeated
'&pdev->dev' dereferences throughout mxc_gpio_probe(), improving
readability.

No functional change.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/gpio/gpio-mxc.c | 33 +++++++++++++++++----------------
 1 file changed, 17 insertions(+), 16 deletions(-)

diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
index e7c6fbd811a6..21c74b244c1f 100644
--- a/drivers/gpio/gpio-mxc.c
+++ b/drivers/gpio/gpio-mxc.c
@@ -450,17 +450,18 @@ static int mxc_gpio_probe(struct platform_device *pdev)
 {
 	struct gpio_generic_chip_config config = { };
 	struct device_node *np = pdev->dev.of_node;
+	struct device *dev = &pdev->dev;
 	struct mxc_gpio_port *port;
 	int irq_count;
 	int irq_base;
 	int err;
 
-	port = devm_kzalloc(&pdev->dev, sizeof(*port), GFP_KERNEL);
+	port = devm_kzalloc(dev, sizeof(*port), GFP_KERNEL);
 	if (!port)
 		return -ENOMEM;
 
-	port->dev = &pdev->dev;
-	port->hwdata = device_get_match_data(&pdev->dev);
+	port->dev = dev;
+	port->hwdata = device_get_match_data(dev);
 
 	port->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(port->base))
@@ -481,13 +482,13 @@ static int mxc_gpio_probe(struct platform_device *pdev)
 		return port->irq;
 
 	/* the controller clock is optional */
-	port->clk = devm_clk_get_optional_enabled(&pdev->dev, NULL);
+	port->clk = devm_clk_get_optional_enabled(dev, NULL);
 	if (IS_ERR(port->clk))
 		return PTR_ERR(port->clk);
 
-	pm_runtime_get_noresume(&pdev->dev);
-	pm_runtime_set_active(&pdev->dev);
-	pm_runtime_enable(&pdev->dev);
+	pm_runtime_get_noresume(dev);
+	pm_runtime_set_active(dev);
+	pm_runtime_enable(dev);
 
 	/* disable the interrupt and clear the status */
 	writel(0, port->base + GPIO_IMR);
@@ -504,7 +505,7 @@ static int mxc_gpio_probe(struct platform_device *pdev)
 	} else
 		port->mx_irq_handler = mx3_gpio_irq_handler;
 
-	config.dev = &pdev->dev;
+	config.dev = dev;
 	config.sz = 4;
 	config.dat = port->base + GPIO_PSR;
 	config.set = port->base + GPIO_DR;
@@ -527,20 +528,20 @@ static int mxc_gpio_probe(struct platform_device *pdev)
 	else /* silence boot time warning */
 		port->gen_gc.gc.base = -1;
 
-	irq_base = devm_irq_alloc_descs(&pdev->dev, -1, 0, 32, numa_node_id());
+	irq_base = devm_irq_alloc_descs(dev, -1, 0, 32, numa_node_id());
 	if (irq_base < 0) {
 		err = irq_base;
 		goto out_bgio;
 	}
 
-	port->domain = irq_domain_create_legacy(dev_fwnode(&pdev->dev), 32, irq_base, 0,
+	port->domain = irq_domain_create_legacy(dev_fwnode(dev), 32, irq_base, 0,
 						&irq_domain_simple_ops, NULL);
 	if (!port->domain) {
 		err = -ENODEV;
 		goto out_bgio;
 	}
 
-	irq_domain_set_pm_device(port->domain, &pdev->dev);
+	irq_domain_set_pm_device(port->domain, dev);
 
 	/* gpio-mxc can be a generic irq chip */
 	err = mxc_gpio_init_gc(port, irq_base);
@@ -552,7 +553,7 @@ static int mxc_gpio_probe(struct platform_device *pdev)
 	 * chip visible to consumers immediately, so the IRQ domain and
 	 * generic irq chip must be ready before any to_irq() call.
 	 */
-	err = devm_gpiochip_add_data(&pdev->dev, &port->gen_gc.gc, port);
+	err = devm_gpiochip_add_data(dev, &port->gen_gc.gc, port);
 	if (err)
 		goto out_irqdomain_remove;
 
@@ -561,16 +562,16 @@ static int mxc_gpio_probe(struct platform_device *pdev)
 	mxc_update_irq_chained_handler(port, true);
 
 	platform_set_drvdata(pdev, port);
-	pm_runtime_put_autosuspend(&pdev->dev);
+	pm_runtime_put_autosuspend(dev);
 
 	return 0;
 
 out_irqdomain_remove:
 	irq_domain_remove(port->domain);
 out_bgio:
-	pm_runtime_disable(&pdev->dev);
-	pm_runtime_put_noidle(&pdev->dev);
-	dev_info(&pdev->dev, "%s failed with errno %d\n", __func__, err);
+	pm_runtime_disable(dev);
+	pm_runtime_put_noidle(dev);
+	dev_info(dev, "%s failed with errno %d\n", __func__, err);
 	return err;
 }
 

-- 
2.51.0

