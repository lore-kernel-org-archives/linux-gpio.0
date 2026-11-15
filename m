Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.84.134
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794752484;
	b=Sa47zydYwDPbOwTZF0q1MMM+dv6vPnDuk/k+GLzCy+mc48X1QlEZuRZtvl3ccPOnkBze
	 HciBGLY/TNs/6QdswkErtKjqA7YGpzj304X8u7Re733MHDXkqo69nVV28bDcHpDFsIf4+
	 ZPM5LopKQYvi8BtDRQFSunfgYMeE76Spdoy7o0Z1uFlYC3m9vOjd90XNkS+4ZXU1zkwbx
	 yXuj8CaGa4sOeSQgung2cq8GFAYfGMftdM2cT901m81xIrrBnidAzskSr96N2ng9jIVjH
	 8Z4lQOIqTA9o5z7koN+9KWUt5JtVMcUwfC1gp7mjbWrGd7llcVh0+QQVX6xvDI9G56Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794752484;
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
	bh=S3SC3nUnVBqJrdJf/pXrieXFn0tqzJamlswYtfgiKLY=;
	b=ZVlQrsdL4QCtJkUQCr7ynfmzPHSnrHz7Mlc483/o3YkbHx2VAsE8YiSs56kqBIE4ApkU
	 fD4J1ftFoH2f3OpvJDIDs0Vbov3ClfImkFhqUb1EbHY/HD8yksQbUQWuURSFUjnfGzUJo
	 SAg8UBLNjGc1QXEQdaiCmFrY72qkK3hdksZ7G1H1qmI/d8Xu3c9xOP3/nshIXfrtQV8De
	 I4T/7KL/c3X6j7pLEN+w6tMzbYuzk0zwWlfsrAXoxHx/j5K6Nyn45QwRF7ud9bNMcXauz
	 8dGl/Q+gT7MYt988lZzkKIjGkqQ0JAxZGM8Zl894ThQgxlUHmdMUPw+xk2tlbQYDg9g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=iopsys.eu;
	spf=pass smtp.mailfrom=genexis.eu;
	dkim=pass header.d=iopsys.eu header.i=@iopsys.eu header.a=rsa-sha256 header.s=selector1 header.b=0CFgKXRe;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.84.134
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11020134.outbound.protection.outlook.com [52.101.84.134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A891E606A31F;
	Sun, 15 Nov 2026 14:21:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A891E606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=genexis.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=iopsys.eu header.i=@iopsys.eu header.a=rsa-sha256 header.s=selector1 header.b=0CFgKXRe
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OIeY/cUXGEZNPyJz27H+a82KMBGTURLjO34CvBYuyLHlEbgCnuUmfaTbhGPDTErzfykUXGbWZZs/GiFMBqSWPv71VbERjyuihURulpwsNCSlk5LPeEBJV3dQ5cO4y8/+h+k8yLiHaihJGrwWtZa6PbOWZASeR0y/CDFOBi0fs1SKCX+fxdbGA/85EaghehZ6qhV4EsUmysZzeg10vg12eDzEZ29S7b4/F8/RfthM5RKZhmk+eWHCkAsArbUV1BjkrQYstsUfIwFej81gOE+GO3x5eankPd/A+VHLJdpsMJNHHZbE5Igg3nKUvZV1g0kXEd/adVBbeWP0xOVjz5XqRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S3SC3nUnVBqJrdJf/pXrieXFn0tqzJamlswYtfgiKLY=;
 b=T8yxh9IAfvnONxeaeVfcIHTggjE8MSqmExTO9kxhnJRkjzsfanXZcce0VjxsTEuLW4KtqbSpIFFVz3md4F9Uo4T8FAIFHq+WZ1OJ7jvkdm/hgBmYJjWjDe8ccrCxtCqFo39p18/7beLCXksYZglkkMw4ZUynnCUOpePrg1UjdId1rvtysioxcOtmRZJa6ISvh/IARhOnZmRPQXIGqiX9wmO05Nk8quQYKn/dXMLkFYu5aHGg6757GgFExVqvCWzSjczWgaIFJ9mgLK+MvfM1aTaCsif3uLdRR65ph7dvMYwm9YhJIBJvzWKc4qsAiKycJQH7IEtW0sqnhnoJxnd+uQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S3SC3nUnVBqJrdJf/pXrieXFn0tqzJamlswYtfgiKLY=;
 b=0CFgKXRegEboiylJ7WNPKZZM5A2xRlky3P6ZcmpdoxaKFYO/ZbukKEMx39B66i1C3JMdlvWHDYo8+MHY0gJq+94VzFX0aE35qi3OcFttAoXWN0u/VK3QnCodLlSeQ9dLMdTruSMKiTF0nypZ8KoJ+wCmWmH3UDGGIYRMafZoeb8y5q3sZo4vFQFJ9HhVU1N/dQn9ufxJcwSYkAwPBLwTYdQPtdy9eC20sXL8F3jDgStybGNPrXyDrwTwHweeaM3Hfr4sigrYOA6tlV+3zwREqLafTUIZErNx1EXuRd+1vzZApZjS6G7yNi1pRkt4Xt1ezriKfwfDCCdX3/0+ZSsviA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by PA1PR08MB11622.eurprd08.prod.outlook.com (2603:10a6:102:556::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Sun, 15 Nov
 2026 14:21:19 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%3]) with mapi id 15.21.0615.012; Sun, 15 Nov 2026
 14:21:18 +0000
Message-ID: <80e72b60-3128-4594-a4bf-bb184ffc754b@iopsys.eu>
Date: Sun, 15 Nov 2026 17:21:15 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/12] pinctrl: airoha: an7581: select force GPIO mode on
 GPIO requests
To: Zhengping Zhang <zhengping.zhang@airoha.com>, linusw@kernel.org,
 lorenzo@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 brgl@kernel.org, naseefkm@gmail.com, benjamin.larsson@genexis.eu,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 lei.dong@airoha.com, ansuelsmth@gmail.com
References: <20261110094339.749110-1-zhengping.zhang@airoha.com>
 <20261110094339.749110-6-zhengping.zhang@airoha.com>
From: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Content-Language: en-US, ru-RU
In-Reply-To: <20261110094339.749110-6-zhengping.zhang@airoha.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: GV3PEPF0001DDA6.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:401::6cd) To DU2PR08MB10037.eurprd08.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: DU2PR08MB10037:EE_|PA1PR08MB11622:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d011da5-850b-4666-4409-08df4323b729
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|366016|23010399003|10067099003|11063799006|5023799004|4143699003|56012099006|261021123027099003|261021121427099003|261009221227099003|261009223027099003|261102123227099003|261026121527099003|261026140227099003|261022105027099003|261022075727099003|261028144727099003|18002099003|22082099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	NqlJVgnux+P6ZDYSqLW+rGbbmfqlSUyUmpJ2fjxeHxwqg4oLxFciz/kidJxYgqhsHbeHuHA4lBETmhjIXyDbHmBE54auOd56VTLzp8vqA8Jdh1ci9ZFyBvpojWr166AE1yCHMGeGTuu3Hljoy2oHCXaTmkhjSJRjYDBULCWWJQEcp6agw+FkhKLtqHOOMqlTDBtnBGbS/Dcl3dh0/yMUyq7cR4LWewFdGQ6Yi/5oQN0+MkdsbVh+aC26gbbMqaAZr8gE2m+tKwT0vELFNaSTbwImLvxgzjirgtW9B2Fi35RqBUPzJJdO+C74zzMVV9WOkffQwMSViWbHOPNaNqrxoVPEj/ilVlHa4oCy1PWlAR/dLtlXXCndaxLH9pt5j53fosKCB4vl3JkeD9BE9+hFHZiuw9Z9d7q1b4RHvtuNjfxwNMCYtTn1EEO5Eneu+sjJ932j034oanDH4KGjk0vi5jUZqiV4t+NFRC/mmz27mMzn2ZetLT49hQVuYkI7UZ3EsMKns8MXOxxUfYWUKBHqhQi0hI/SCiBVTWQ6MGBdCKOfakYg493EXsP+7DEyNXAXJo3TV48uNrDy5tvqFYz2FPrBkapgKlAFxnMuTf4XfacnK/GYuM27haXlzrqldRV2vyPuPHs37MwcDQ82LAqJNWRafQFC0i7H4kN1Btz/nXY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(23010399003)(10067099003)(11063799006)(5023799004)(4143699003)(56012099006)(261021123027099003)(261021121427099003)(261009221227099003)(261009223027099003)(261102123227099003)(261026121527099003)(261026140227099003)(261022105027099003)(261022075727099003)(261028144727099003)(18002099003)(22082099003)(6133799003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aTNRWVpDU0twQmpwUkhUWmNLWnZwWWhDUHFMQjFjdEFKc1kyVlE0RThSQjhC?=
 =?utf-8?B?T0RMME0wWHhQQVl6ZXhPdmlkcEVDcFVUUHN2eWwrbHRGSHRqUnMwRDdzczZU?=
 =?utf-8?B?d0NjelZrcU0wM0NpOSt3UUxqbE9LTHZvVjB4LzRtMDBNRCs5ZUY5VGFHZnVz?=
 =?utf-8?B?MVZoTTlxWU5hWGpOcTR1ZGRsN3R1Ymd4WUNzWWlFUCtPRCtVMEtnTlZQMjE2?=
 =?utf-8?B?TXFDSFBRd01mSTZIaCtCY0ViRU85aWxqSWYvbnBsQVNlRXJCUUFtTUtyNjU4?=
 =?utf-8?B?V1AwOHA2N2tMaUpOT2xmS3lpaFAzQlYxTm1qTFlzNWtlcytaNDhxNERha1JV?=
 =?utf-8?B?TDlZQzNGTzhPeDgwQ0lVVEUySk9nUG5VakJNd2dFUW1ZZGFCVXN6OEZ6YzhS?=
 =?utf-8?B?SjVkWHdsTzE1WDEvVjU3YTVzYXRYVlQveVBlWnpMNmZYWWJ3bDAvNndIRno3?=
 =?utf-8?B?em05VmR3dWZtaDIvOXRhcHlINUtWY1VjQWlIN0xTODVKb0ZsMXZUNUNKVlQ4?=
 =?utf-8?B?V2Q4UWdxUFQvdDczMXpKL1Y5SHIvcitsbnBkbVdVeS9JeGFRMkdPR2VjUjRH?=
 =?utf-8?B?bHhtZlF1bkxFRmxra1pBaC9IUmR6U3k4Ui9kUlcrWEszdE9mbzljMEZIck53?=
 =?utf-8?B?VmpheU11U3prVGVzVFU5T2xTdHBoYWFHdm1nRTVvcTAxc1FGcC85cXBBMmRt?=
 =?utf-8?B?R0h5UXowTTdyWTF1ekJIS2pXeWppNkM1QlZxWVpIbjBXMjZza0RNRmc3S1dV?=
 =?utf-8?B?SDB6RUZoSXV2TE9OWjNDK1VRY1ZwSWh0S3l0YjY5bEt5d0I2M2N0Tk9DalRE?=
 =?utf-8?B?dXY0bnlla3VEdjU5V1JuYWU4MTQyTEF1UGI0aG9ONjdnb0JaVy8rWG5mSEN1?=
 =?utf-8?B?Y0pYSU1KUEp4NjdTbDM1TnFwTVB4OGMxeDI1Ly9PcHFsV0FpcU1iR2tsellP?=
 =?utf-8?B?STV1dU4wUUpjNFhndlFzNitlT0NiZzNIeFlJWmZyWkdGazFwZFIrZFdya0k5?=
 =?utf-8?B?WlNwOE9VZnZMTnA2ditFLzVlVXlEeGI5M1VESEdtaFlNajJ6YzNUdlNaczdB?=
 =?utf-8?B?R0tVSGNMcHptSmFRbC9ac3BGMjE4Q0w5ODlOMmUrNFMrc1dEVHJObFozT3RY?=
 =?utf-8?B?OWdMZk9BcWF6ZFg1RVVZdDhmWUNvcW5neHR0UEZVeTFiUXIwVjdqQWRVNEdP?=
 =?utf-8?B?YVUrMVczYkpob010a0k2dWtSYmZiYk51NTVpYnFBY0hIRUQ5UFZjbjl3M0RM?=
 =?utf-8?B?YkFHcmNDc1ZvN3ZjRDRsNEU1R2hDdW5qaVZnRFdQVDhzL1AzaFJqemtPQnQ2?=
 =?utf-8?B?WTdSQ054aGZpY0dtQnQ4N0dYeEhMZnZKNWpnUERQb2FNMFQ4dHFqMElHdWdx?=
 =?utf-8?B?ZnlHcG83WDZFUTZtOGp5SWxFU1FlU0RINGViT2FaaFlMT0xRa3Vud3NIMnlr?=
 =?utf-8?B?MERDc3VjSE44KzJvbk0wdDQwZlFSeFh4M0dxeHFkbkxHNk9VOGpBTVJDOW9Z?=
 =?utf-8?B?Q1hTenNNcFZJaGlyVHJ5VVBRRXRsdTZ0RFhzeU5mb0FFNEFEMDNsRDZuVUJi?=
 =?utf-8?B?TUlWM1IrUE5nYy9PRjVnalBJNUdkUVora0xuY0VaN3ZIdUtrd09HY1hKcWh1?=
 =?utf-8?B?MHNPSm1CcGE3OUNwQVgvMWowcWtGV1F4UlhjUGh0TEdRMDZpVTJVUmdqVTJj?=
 =?utf-8?B?MW84SkJ2cGFqRUxyRUZqZ056dUV6RERiZ2xsVG51Uml0K2MrQy8yVEV6RW1a?=
 =?utf-8?B?cDZ1R0JsVWxrdVd3aEMwbmNQUWZzRy9reGJIOG14dGtQYU9BNEFCYlRuQkx1?=
 =?utf-8?B?aiszR2l6S0JiNWZHTlJHUklwU2VOc0s4SVE3OWF6Q1BCMjNVTzM1a3VXcWZF?=
 =?utf-8?B?YzY0SWRlZ1llOENIOEZhWldIdXh2SnZVRzdWRDVSalNNNlkzQVlsWHVqY1R0?=
 =?utf-8?B?dzNuN0JLQ2o0SHRPaUhkV2JPMDFoYVVSTXpXZTBPYWd6YXJhdFVFeEw4eGFP?=
 =?utf-8?B?SmhMVXJMcFk3czUycCs4anlNR2JIajZja09YZWFETWVlQzJGMC8ybWg0a3dZ?=
 =?utf-8?B?UDF3c1h3N1N0NXU4UVRuT3dhMkdkRnBoTHpkUm9QMUlhL0JZcEU0RnQ1NTVY?=
 =?utf-8?B?UjZzVGo0QVJDMFNmUVMyb1ZHZWVkK2krS2NZSmFUbkQ0bGJFZWhKcXA4cTQ4?=
 =?utf-8?B?a2hHVEloYU9udi9TeHBMWTRVbm9FSmxnU3UzRENEVlpBaUJmMzRIUVdoMjFl?=
 =?utf-8?B?KzZTbzdxaDVuMHVJQ3FBZ3I0OExVbHovVUNBL0FSdXR3VkRVYzF4WUhjZ2Qr?=
 =?utf-8?B?bHliN2R1bG5WaTFhZnprbnlybzlUN3ZEcXF4N0VpRnhWWk9xdC93SnYxU3R4?=
 =?utf-8?Q?IvU5cDBlh3yey3HA=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d011da5-850b-4666-4409-08df4323b729
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2026 14:21:18.7630
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Nw/cyignYNC3lYHCqxylUTLfgAa3JgueNZQMdxz8aS6duSCJmazqJyVlS68KprZeb79dgRNWfbV39BpFg60sa+8Wo1KLbbsUYyKg5pWvcEA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR08MB11622

I think it's better does not play with force gpio registers and just
disable (if no conflicts) functions that put selected pin to non-gpio mode.

On 11/10/26 12:43, Zhengping Zhang wrote:
> [You don't often get email from zhengping.zhang@airoha.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>
> Configuring GPIO direction and output data does not select the GPIO
> function at the pad. If the bootloader leaves a shared pad configured
> for an alternate function, a GPIO request can succeed while the pad
> remains controlled by that function. GPIO outputs may then fail to
> drive the pin, and input readings may not reflect the external signal,
> making GPIO behavior depend on the bootloader configuration.
>
> The AN7581 driver currently exposes explicit GPIO mux groups only for
> GPIO47-49 and does not enable the shared GPIO request handling. Extend
> the GPIO groups to GPIO0-49, mark the function as a GPIO-category
> function and enable GPIO request handling and shared mux conflict
> checks through the SoC match data. GPIO consumers can then select the
> pad function without requiring an explicit GPIO pinctrl state in DTS.
> Explicit GPIO states use the same configuration tables.
>
> Use the per-pad force GPIO overrides instead of disabling shared
> alternate-function modes globally. This allows a GPIO request to
> override its own pad without changing the mux settings of other pads
> controlled by the same peripheral mode bits. Select GPIO mode using
> the following SCU register bits, where n is the GPIO number:
>
>   - GPIO1-31: set bit n in register 0x228
>     (GPIO1 -> bit 1, ..., GPIO31 -> bit 31).
>   - GPIO32-46: set bit (n - 32) in register 0x22c
>     (GPIO32 -> bit 0, ..., GPIO46 -> bit 14).
>   - GPIO47-49: set the PCIe reset GPIO selector bits in register
>     0x21c (GPIO47 -> bit 9, GPIO48 -> bit 10, GPIO49 -> bit 12).
>   - GPIO0: clear its PWM selection only; no usable force GPIO bit
>     is documented.
>
> Clear the requested pad's PWM selection when selecting GPIO. For
> GPIO1/2, also disable the I2C and MDIO routing. The existing MDIO
> configuration sets force GPIO bits 1/2 as part of its routing sequence,
> so setting these bits alone is insufficient to switch the pads from
> MDIO to GPIO.
>
> When selecting a peripheral function, clear the force GPIO overrides
> for the pads in its group while retaining the existing mux and LED
> mapping writes. Otherwise, a force bit left by the bootloader or an
> earlier GPIO configuration could keep the pad in GPIO mode even after
> the peripheral mux has been configured. Keep the existing register
> configuration for selecting MDIO and PWM functions unchanged.
>
> Enable the shared conflict checks to reject configurations requiring
> incompatible values for shared mux bits rather than silently changing
> the configuration of an owned group.
>
> Signed-off-by: Zhengping Zhang <zhengping.zhang@airoha.com>
> ---
>  drivers/pinctrl/airoha/pinctrl-an7581.c | 549 ++++++++++++++++++++----
>  1 file changed, 476 insertions(+), 73 deletions(-)
>
> diff --git a/drivers/pinctrl/airoha/pinctrl-an7581.c b/drivers/pinctrl/airoha/pinctrl-an7581.c
> index 3cbdfc31e97e5..b266cc8bc65f4 100644
> --- a/drivers/pinctrl/airoha/pinctrl-an7581.c
> +++ b/drivers/pinctrl/airoha/pinctrl-an7581.c
> @@ -64,6 +64,7 @@
>  #define JTAG_DFD_EN_MASK                       BIT(3)
>
>  #define REG_FORCE_GPIO_EN                      0x0228
> +#define REG_FORCE_GPIO32_EN                    0x022c
>  #define FORCE_GPIO_EN(n)                       BIT(n)
>
>  /* LED MAP */
> @@ -280,7 +281,7 @@
>                 .regmap_size = 2,                               \
>         }
>
> -#define AIROHA_PINCTRL_PHY_LED0(gpio, mux_val, map_mask, map_val)      \
> +#define AIROHA_PINCTRL_PHY_LED0(gpio, mux_val, map_mask, map_val, force_reg, force_mask) \
>         {                                                               \
>                 .name = (gpio),                                         \
>                 .regmap[0] = {                                          \
> @@ -295,10 +296,14 @@
>                         (map_mask),                                     \
>                         (map_val),                                      \
>                 },                                                      \
> -               .regmap_size = 2,                                       \
> +               .regmap[2] = {                                          \
> +                       AIROHA_FUNC_MUX, (force_reg),                   \
> +                       (force_mask), 0                                 \
> +               },                                                      \
> +               .regmap_size = 3,                                       \
>         }
>
> -#define AIROHA_PINCTRL_PHY_LED1(gpio, mux_val, map_mask, map_val)      \
> +#define AIROHA_PINCTRL_PHY_LED1(gpio, mux_val, map_mask, map_val, force_reg, force_mask) \
>         {                                                               \
>                 .name = (gpio),                                         \
>                 .regmap[0] = {                                          \
> @@ -313,7 +318,11 @@
>                         (map_mask),                                     \
>                         (map_val),                                      \
>                 },                                                      \
> -               .regmap_size = 2,                                       \
> +               .regmap[2] = {                                          \
> +                       AIROHA_FUNC_MUX, (force_reg),                   \
> +                       (force_mask), 0                                 \
> +               },                                                      \
> +               .regmap_size = 3,                                       \
>         }
>
>  static struct pinctrl_pin_desc pinctrl_pins[] = {
> @@ -579,7 +588,17 @@ static const char *const pcm_spi_groups[] = {
>  static const char *const i2s_groups[] = { "i2s" };
>  static const char *const emmc_groups[] = { "emmc" };
>  static const char *const pnand_groups[] = { "pnand" };
> -static const char *const gpio_groups[] = { "gpio47", "gpio48", "gpio49" };
> +static const char *const gpio_groups[] = {
> +       "gpio0", "gpio1", "gpio2", "gpio3", "gpio4", "gpio5",
> +       "gpio6", "gpio7", "gpio8", "gpio9", "gpio10", "gpio11",
> +       "gpio12", "gpio13", "gpio14", "gpio15", "gpio16", "gpio17",
> +       "gpio18", "gpio19", "gpio20", "gpio21", "gpio22", "gpio23",
> +       "gpio24", "gpio25", "gpio26", "gpio27", "gpio28", "gpio29",
> +       "gpio30", "gpio31", "gpio32", "gpio33", "gpio34", "gpio35",
> +       "gpio36", "gpio37", "gpio38", "gpio39", "gpio40", "gpio41",
> +       "gpio42", "gpio43", "gpio44", "gpio45", "gpio46", "gpio47",
> +       "gpio48", "gpio49",
> +};
>  static const char *const pcie_reset_groups[] = {
>         "pcie_reset0", "pcie_reset1", "pcie_reset2"
>  };
> @@ -627,7 +646,18 @@ static const struct airoha_pinctrl_func_group pon_func_group[] = {
>                         GPIO_PON_MODE_MASK,
>                         GPIO_PON_MODE_MASK
>                 },
> -               .regmap_size = 1,
> +               .regmap[1] = {
> +                       AIROHA_FUNC_MUX,
> +                       REG_FORCE_GPIO32_EN,
> +                       BIT(4) |
> +                       BIT(5) |
> +                       BIT(6) |
> +                       BIT(7) |
> +                       BIT(8) |
> +                       BIT(9),
> +                       0
> +               },
> +               .regmap_size = 2,
>         },
>  };
>
> @@ -640,7 +670,13 @@ static const struct airoha_pinctrl_func_group tod_1pps_func_group[] = {
>                         PON_TOD_1PPS_MODE_MASK,
>                         PON_TOD_1PPS_MODE_MASK
>                 },
> -               .regmap_size = 1,
> +               .regmap[1] = {
> +                       AIROHA_FUNC_MUX,
> +                       REG_FORCE_GPIO32_EN,
> +                       BIT(1),
> +                       0
> +               },
> +               .regmap_size = 2,
>         }, {
>                 .name = "gsw_tod_1pps",
>                 .regmap[0] = {
> @@ -649,7 +685,13 @@ static const struct airoha_pinctrl_func_group tod_1pps_func_group[] = {
>                         GSW_TOD_1PPS_MODE_MASK,
>                         GSW_TOD_1PPS_MODE_MASK
>                 },
> -               .regmap_size = 1,
> +               .regmap[1] = {
> +                       AIROHA_FUNC_MUX,
> +                       REG_FORCE_GPIO32_EN,
> +                       BIT(1),
> +                       0
> +               },
> +               .regmap_size = 2,
>         },
>  };
>
> @@ -662,7 +704,14 @@ static const struct airoha_pinctrl_func_group sipo_func_group[] = {
>                         GPIO_SIPO_MODE_MASK | SIPO_RCLK_MODE_MASK,
>                         GPIO_SIPO_MODE_MASK
>                 },
> -               .regmap_size = 1,
> +               .regmap[1] = {
> +                       AIROHA_FUNC_MUX,
> +                       REG_FORCE_GPIO_EN,
> +                       BIT(3) |
> +                       BIT(4),
> +                       0
> +               },
> +               .regmap_size = 2,
>         }, {
>                 .name = "sipo_rclk",
>                 .regmap[0] = {
> @@ -671,7 +720,15 @@ static const struct airoha_pinctrl_func_group sipo_func_group[] = {
>                         GPIO_SIPO_MODE_MASK | SIPO_RCLK_MODE_MASK,
>                         GPIO_SIPO_MODE_MASK | SIPO_RCLK_MODE_MASK
>                 },
> -               .regmap_size = 1,
> +               .regmap[1] = {
> +                       AIROHA_FUNC_MUX,
> +                       REG_FORCE_GPIO_EN,
> +                       BIT(3) |
> +                       BIT(4) |
> +                       BIT(30),
> +                       0
> +               },
> +               .regmap_size = 2,
>         },
>  };
>
> @@ -703,7 +760,14 @@ static const struct airoha_pinctrl_func_group uart_func_group[] = {
>                         GPIO_UART2_MODE_MASK,
>                         GPIO_UART2_MODE_MASK
>                 },
> -               .regmap_size = 1,
> +               .regmap[1] = {
> +                       AIROHA_FUNC_MUX,
> +                       REG_FORCE_GPIO32_EN,
> +                       BIT(3) |
> +                       BIT(10),
> +                       0
> +               },
> +               .regmap_size = 2,
>         }, {
>                 .name = "uart2_cts_rts",
>                 .regmap[0] = {
> @@ -712,7 +776,14 @@ static const struct airoha_pinctrl_func_group uart_func_group[] = {
>                         GPIO_UART2_MODE_MASK | GPIO_UART2_CTS_RTS_MODE_MASK,
>                         GPIO_UART2_MODE_MASK | GPIO_UART2_CTS_RTS_MODE_MASK
>                 },
> -               .regmap_size = 1,
> +               .regmap[1] = {
> +                       AIROHA_FUNC_MUX,
> +                       REG_FORCE_GPIO32_EN,
> +                       BIT(1) |
> +                       BIT(2),
> +                       0
> +               },
> +               .regmap_size = 2,
>         }, {
>                 .name = "hsuart",
>                 .regmap[0] = {
> @@ -721,7 +792,14 @@ static const struct airoha_pinctrl_func_group uart_func_group[] = {
>                         GPIO_HSUART_MODE_MASK | GPIO_HSUART_CTS_RTS_MODE_MASK,
>                         GPIO_HSUART_MODE_MASK
>                 },
> -               .regmap_size = 1,
> +               .regmap[1] = {
> +                       AIROHA_FUNC_MUX,
> +                       REG_FORCE_GPIO_EN,
> +                       BIT(15) |
> +                       BIT(16),
> +                       0
> +               },
> +               .regmap_size = 2,
>         },
>         {
>                 .name = "hsuart_cts_rts",
> @@ -731,7 +809,14 @@ static const struct airoha_pinctrl_func_group uart_func_group[] = {
>                         GPIO_HSUART_MODE_MASK | GPIO_HSUART_CTS_RTS_MODE_MASK,
>                         GPIO_HSUART_MODE_MASK | GPIO_HSUART_CTS_RTS_MODE_MASK
>                 },
> -               .regmap_size = 1,
> +               .regmap[1] = {
> +                       AIROHA_FUNC_MUX,
> +                       REG_FORCE_GPIO_EN,
> +                       BIT(13) |
> +                       BIT(14),
> +                       0
> +               },
> +               .regmap_size = 2,
>         }, {
>                 .name = "uart4",
>                 .regmap[0] = {
> @@ -740,7 +825,14 @@ static const struct airoha_pinctrl_func_group uart_func_group[] = {
>                         GPIO_UART4_MODE_MASK,
>                         GPIO_UART4_MODE_MASK
>                 },
> -               .regmap_size = 1,
> +               .regmap[1] = {
> +                       AIROHA_FUNC_MUX,
> +                       REG_FORCE_GPIO_EN,
> +                       BIT(25) |
> +                       BIT(26),
> +                       0
> +               },
> +               .regmap_size = 2,
>         }, {
>                 .name = "uart5",
>                 .regmap[0] = {
> @@ -749,7 +841,14 @@ static const struct airoha_pinctrl_func_group uart_func_group[] = {
>                         GPIO_UART5_MODE_MASK,
>                         GPIO_UART5_MODE_MASK
>                 },
> -               .regmap_size = 1,
> +               .regmap[1] = {
> +                       AIROHA_FUNC_MUX,
> +                       REG_FORCE_GPIO_EN,
> +                       BIT(5) |
> +                       BIT(6),
> +                       0
> +               },
> +               .regmap_size = 2,
>         },
>  };
>
> @@ -762,7 +861,14 @@ static const struct airoha_pinctrl_func_group i2c_func_group[] = {
>                         GPIO_2ND_I2C_MODE_MASK | GPIO_I2C_MASTER_MODE_MODE,
>                         GPIO_2ND_I2C_MODE_MASK | GPIO_I2C_MASTER_MODE_MODE
>                 },
> -               .regmap_size = 1,
> +               .regmap[1] = {
> +                       AIROHA_FUNC_MUX,
> +                       REG_FORCE_GPIO_EN,
> +                       BIT(1) |
> +                       BIT(2),
> +                       0
> +               },
> +               .regmap_size = 2,
>         },
>  };
>
> @@ -775,7 +881,17 @@ static const struct airoha_pinctrl_func_group jtag_func_group[] = {
>                         JTAG_UDI_EN_MASK,
>                         JTAG_UDI_EN_MASK
>                 },
> -               .regmap_size = 1,
> +               .regmap[1] = {
> +                       AIROHA_FUNC_MUX,
> +                       REG_FORCE_GPIO_EN,
> +                       BIT(3) |
> +                       BIT(4) |
> +                       BIT(5) |
> +                       BIT(6) |
> +                       BIT(7),
> +                       0
> +               },
> +               .regmap_size = 2,
>         }, {
>                 .name = "jtag_dfd",
>                 .regmap[0] = {
> @@ -784,7 +900,17 @@ static const struct airoha_pinctrl_func_group jtag_func_group[] = {
>                         JTAG_DFD_EN_MASK,
>                         JTAG_DFD_EN_MASK
>                 },
> -               .regmap_size = 1,
> +               .regmap[1] = {
> +                       AIROHA_FUNC_MUX,
> +                       REG_FORCE_GPIO_EN,
> +                       BIT(3) |
> +                       BIT(4) |
> +                       BIT(5) |
> +                       BIT(6) |
> +                       BIT(7),
> +                       0
> +               },
> +               .regmap_size = 2,
>         },
>  };
>
> @@ -797,7 +923,16 @@ static const struct airoha_pinctrl_func_group pcm_func_group[] = {
>                         GPIO_PCM1_MODE_MASK,
>                         GPIO_PCM1_MODE_MASK
>                 },
> -               .regmap_size = 1,
> +               .regmap[1] = {
> +                       AIROHA_FUNC_MUX,
> +                       REG_FORCE_GPIO_EN,
> +                       BIT(9) |
> +                       BIT(10) |
> +                       BIT(11) |
> +                       BIT(12),
> +                       0
> +               },
> +               .regmap_size = 2,
>         }, {
>                 .name = "pcm2",
>                 .regmap[0] = {
> @@ -806,7 +941,16 @@ static const struct airoha_pinctrl_func_group pcm_func_group[] = {
>                         GPIO_PCM2_MODE_MASK,
>                         GPIO_PCM2_MODE_MASK
>                 },
> -               .regmap_size = 1,
> +               .regmap[1] = {
> +                       AIROHA_FUNC_MUX,
> +                       REG_FORCE_GPIO_EN,
> +                       BIT(5) |
> +                       BIT(6) |
> +                       BIT(7) |
> +                       BIT(8),
> +                       0
> +               },
> +               .regmap_size = 2,
>         },
>  };
>
> @@ -819,7 +963,14 @@ static const struct airoha_pinctrl_func_group spi_func_group[] = {
>                         GPIO_SPI_QUAD_MODE_MASK,
>                         GPIO_SPI_QUAD_MODE_MASK
>                 },
> -               .regmap_size = 1,
> +               .regmap[1] = {
> +                       AIROHA_FUNC_MUX,
> +                       REG_FORCE_GPIO_EN,
> +                       BIT(19) |
> +                       BIT(20),
> +                       0
> +               },
> +               .regmap_size = 2,
>         }, {
>                 .name = "spi_cs1",
>                 .regmap[0] = {
> @@ -828,7 +979,13 @@ static const struct airoha_pinctrl_func_group spi_func_group[] = {
>                         GPIO_SPI_CS1_MODE_MASK,
>                         GPIO_SPI_CS1_MODE_MASK
>                 },
> -               .regmap_size = 1,
> +               .regmap[1] = {
> +                       AIROHA_FUNC_MUX,
> +                       REG_FORCE_GPIO_EN,
> +                       BIT(21),
> +                       0
> +               },
> +               .regmap_size = 2,
>         }, {
>                 .name = "spi_cs2",
>                 .regmap[0] = {
> @@ -868,7 +1025,20 @@ static const struct airoha_pinctrl_func_group pcm_spi_func_group[] = {
>                         GPIO_PCM_SPI_MODE_MASK,
>                         GPIO_PCM_SPI_MODE_MASK
>                 },
> -               .regmap_size = 1,
> +               .regmap[1] = {
> +                       AIROHA_FUNC_MUX,
> +                       REG_FORCE_GPIO_EN,
> +                       BIT(5) |
> +                       BIT(6) |
> +                       BIT(7) |
> +                       BIT(8) |
> +                       BIT(9) |
> +                       BIT(10) |
> +                       BIT(11) |
> +                       BIT(12),
> +                       0
> +               },
> +               .regmap_size = 2,
>         }, {
>                 .name = "pcm_spi_int",
>                 .regmap[0] = {
> @@ -877,7 +1047,13 @@ static const struct airoha_pinctrl_func_group pcm_spi_func_group[] = {
>                         GPIO_PCM_INT_MODE_MASK,
>                         GPIO_PCM_INT_MODE_MASK
>                 },
> -               .regmap_size = 1,
> +               .regmap[1] = {
> +                       AIROHA_FUNC_MUX,
> +                       REG_FORCE_GPIO_EN,
> +                       BIT(1),
> +                       0
> +               },
> +               .regmap_size = 2,
>         }, {
>                 .name = "pcm_spi_rst",
>                 .regmap[0] = {
> @@ -886,7 +1062,13 @@ static const struct airoha_pinctrl_func_group pcm_spi_func_group[] = {
>                         GPIO_PCM_RESET_MODE_MASK,
>                         GPIO_PCM_RESET_MODE_MASK
>                 },
> -               .regmap_size = 1,
> +               .regmap[1] = {
> +                       AIROHA_FUNC_MUX,
> +                       REG_FORCE_GPIO_EN,
> +                       BIT(2),
> +                       0
> +               },
> +               .regmap_size = 2,
>         }, {
>                 .name = "pcm_spi_cs1",
>                 .regmap[0] = {
> @@ -895,7 +1077,13 @@ static const struct airoha_pinctrl_func_group pcm_spi_func_group[] = {
>                         GPIO_PCM_SPI_CS1_MODE_MASK,
>                         GPIO_PCM_SPI_CS1_MODE_MASK
>                 },
> -               .regmap_size = 1,
> +               .regmap[1] = {
> +                       AIROHA_FUNC_MUX,
> +                       REG_FORCE_GPIO_EN,
> +                       BIT(30),
> +                       0
> +               },
> +               .regmap_size = 2,
>         }, {
>                 .name = "pcm_spi_cs2_p128",
>                 .regmap[0] = {
> @@ -904,7 +1092,13 @@ static const struct airoha_pinctrl_func_group pcm_spi_func_group[] = {
>                         GPIO_PCM_SPI_CS2_MODE_P128_MASK,
>                         GPIO_PCM_SPI_CS2_MODE_P128_MASK
>                 },
> -               .regmap_size = 1,
> +               .regmap[1] = {
> +                       AIROHA_FUNC_MUX,
> +                       REG_FORCE_GPIO_EN,
> +                       BIT(27),
> +                       0
> +               },
> +               .regmap_size = 2,
>         }, {
>                 .name = "pcm_spi_cs2_p156",
>                 .regmap[0] = {
> @@ -913,7 +1107,13 @@ static const struct airoha_pinctrl_func_group pcm_spi_func_group[] = {
>                         GPIO_PCM_SPI_CS2_MODE_P156_MASK,
>                         GPIO_PCM_SPI_CS2_MODE_P156_MASK
>                 },
> -               .regmap_size = 1,
> +               .regmap[1] = {
> +                       AIROHA_FUNC_MUX,
> +                       REG_FORCE_GPIO_EN,
> +                       BIT(27),
> +                       0
> +               },
> +               .regmap_size = 2,
>         }, {
>                 .name = "pcm_spi_cs3",
>                 .regmap[0] = {
> @@ -922,7 +1122,13 @@ static const struct airoha_pinctrl_func_group pcm_spi_func_group[] = {
>                         GPIO_PCM_SPI_CS3_MODE_MASK,
>                         GPIO_PCM_SPI_CS3_MODE_MASK
>                 },
> -               .regmap_size = 1,
> +               .regmap[1] = {
> +                       AIROHA_FUNC_MUX,
> +                       REG_FORCE_GPIO_EN,
> +                       BIT(28),
> +                       0
> +               },
> +               .regmap_size = 2,
>         }, {
>                 .name = "pcm_spi_cs4",
>                 .regmap[0] = {
> @@ -931,7 +1137,13 @@ static const struct airoha_pinctrl_func_group pcm_spi_func_group[] = {
>                         GPIO_PCM_SPI_CS4_MODE_MASK,
>                         GPIO_PCM_SPI_CS4_MODE_MASK
>                 },
> -               .regmap_size = 1,
> +               .regmap[1] = {
> +                       AIROHA_FUNC_MUX,
> +                       REG_FORCE_GPIO_EN,
> +                       BIT(29),
> +                       0
> +               },
> +               .regmap_size = 2,
>         },
>  };
>
> @@ -944,7 +1156,16 @@ static const struct airoha_pinctrl_func_group i2s_func_group[] = {
>                         GPIO_I2S_MODE_MASK,
>                         GPIO_I2S_MODE_MASK
>                 },
> -               .regmap_size = 1,
> +               .regmap[1] = {
> +                       AIROHA_FUNC_MUX,
> +                       REG_FORCE_GPIO_EN,
> +                       BIT(13) |
> +                       BIT(14) |
> +                       BIT(15) |
> +                       BIT(16),
> +                       0
> +               },
> +               .regmap_size = 2,
>         },
>  };
>
> @@ -957,7 +1178,20 @@ static const struct airoha_pinctrl_func_group emmc_func_group[] = {
>                         GPIO_EMMC_MODE_MASK,
>                         GPIO_EMMC_MODE_MASK
>                 },
> -               .regmap_size = 1,
> +               .regmap[1] = {
> +                       AIROHA_FUNC_MUX,
> +                       REG_FORCE_GPIO_EN,
> +                       BIT(17) |
> +                       BIT(18) |
> +                       BIT(19) |
> +                       BIT(20) |
> +                       BIT(21) |
> +                       BIT(22) |
> +                       BIT(23) |
> +                       BIT(24),
> +                       0
> +               },
> +               .regmap_size = 2,
>         },
>  };
>
> @@ -970,17 +1204,153 @@ static const struct airoha_pinctrl_func_group pnand_func_group[] = {
>                         GPIO_PARALLEL_NAND_MODE_MASK,
>                         GPIO_PARALLEL_NAND_MODE_MASK
>                 },
> -               .regmap_size = 1,
> +               .regmap[1] = {
> +                       AIROHA_FUNC_MUX,
> +                       REG_FORCE_GPIO_EN,
> +                       BIT(17) |
> +                       BIT(18) |
> +                       BIT(19) |
> +                       BIT(20) |
> +                       BIT(21) |
> +                       BIT(22) |
> +                       BIT(23) |
> +                       BIT(24) |
> +                       BIT(25) |
> +                       BIT(26) |
> +                       BIT(27) |
> +                       BIT(28) |
> +                       BIT(29),
> +                       0
> +               },
> +               .regmap_size = 2,
>         },
>  };
>
> +/* GPIO0 has no force bit. GPIO47-49 retain their native PCIe selectors. */
> +#define AN7581_GPIO_GROUP(n, pwm_mask, force_reg, force_mask)  \
> +       {       \
> +               .name = "gpio" #n,      \
> +               .regmap[0] = {  \
> +                       AIROHA_FUNC_PWM_MUX,    \
> +                       (n) < 16 ? REG_GPIO_FLASH_MODE_CFG :    \
> +                       REG_GPIO_FLASH_MODE_CFG_EXT,    \
> +                       (pwm_mask), 0   \
> +               },      \
> +               .regmap[1] = {  \
> +                       AIROHA_FUNC_MUX, REG_GPIO_2ND_I2C_MODE, \
> +                       (n) == 1 || (n) == 2 ?  \
> +                       GPIO_2ND_I2C_MODE_MASK |        \
> +                       GPIO_I2C_MASTER_MODE_MODE |     \
> +                       GPIO_MDC_IO_MASTER_MODE_MASK : 0, 0     \
> +               },      \
> +               .regmap[2] = {  \
> +                       AIROHA_FUNC_MUX, (force_reg),   \
> +                       (force_mask), (force_mask)      \
> +               },      \
> +               .regmap_size = 3,       \
> +       }
> +
>  static const struct airoha_pinctrl_func_group gpio_func_group[] = {
> -       AIROHA_PINCTRL_GPIO_EXT("gpio47", GPIO47_FLASH_MODE_CFG,
> -                               GPIO_PCIE_RESET0_MASK),
> -       AIROHA_PINCTRL_GPIO_EXT("gpio48", GPIO48_FLASH_MODE_CFG,
> -                               GPIO_PCIE_RESET1_MASK),
> -       AIROHA_PINCTRL_GPIO_EXT("gpio49", GPIO49_FLASH_MODE_CFG,
> -                               GPIO_PCIE_RESET2_MASK),
> +       AN7581_GPIO_GROUP(0, GPIO0_FLASH_MODE_CFG,
> +                           REG_FORCE_GPIO_EN, 0),
> +       AN7581_GPIO_GROUP(1, GPIO1_FLASH_MODE_CFG,
> +                           REG_FORCE_GPIO_EN, BIT(1)),
> +       AN7581_GPIO_GROUP(2, GPIO2_FLASH_MODE_CFG,
> +                           REG_FORCE_GPIO_EN, BIT(2)),
> +       AN7581_GPIO_GROUP(3, GPIO3_FLASH_MODE_CFG,
> +                           REG_FORCE_GPIO_EN, BIT(3)),
> +       AN7581_GPIO_GROUP(4, GPIO4_FLASH_MODE_CFG,
> +                           REG_FORCE_GPIO_EN, BIT(4)),
> +       AN7581_GPIO_GROUP(5, GPIO5_FLASH_MODE_CFG,
> +                           REG_FORCE_GPIO_EN, BIT(5)),
> +       AN7581_GPIO_GROUP(6, GPIO6_FLASH_MODE_CFG,
> +                           REG_FORCE_GPIO_EN, BIT(6)),
> +       AN7581_GPIO_GROUP(7, GPIO7_FLASH_MODE_CFG,
> +                           REG_FORCE_GPIO_EN, BIT(7)),
> +       AN7581_GPIO_GROUP(8, GPIO8_FLASH_MODE_CFG,
> +                           REG_FORCE_GPIO_EN, BIT(8)),
> +       AN7581_GPIO_GROUP(9, GPIO9_FLASH_MODE_CFG,
> +                           REG_FORCE_GPIO_EN, BIT(9)),
> +       AN7581_GPIO_GROUP(10, GPIO10_FLASH_MODE_CFG,
> +                           REG_FORCE_GPIO_EN, BIT(10)),
> +       AN7581_GPIO_GROUP(11, GPIO11_FLASH_MODE_CFG,
> +                           REG_FORCE_GPIO_EN, BIT(11)),
> +       AN7581_GPIO_GROUP(12, GPIO12_FLASH_MODE_CFG,
> +                           REG_FORCE_GPIO_EN, BIT(12)),
> +       AN7581_GPIO_GROUP(13, GPIO13_FLASH_MODE_CFG,
> +                           REG_FORCE_GPIO_EN, BIT(13)),
> +       AN7581_GPIO_GROUP(14, GPIO14_FLASH_MODE_CFG,
> +                           REG_FORCE_GPIO_EN, BIT(14)),
> +       AN7581_GPIO_GROUP(15, GPIO15_FLASH_MODE_CFG,
> +                           REG_FORCE_GPIO_EN, BIT(15)),
> +       AN7581_GPIO_GROUP(16, GPIO16_FLASH_MODE_CFG,
> +                           REG_FORCE_GPIO_EN, BIT(16)),
> +       AN7581_GPIO_GROUP(17, GPIO17_FLASH_MODE_CFG,
> +                           REG_FORCE_GPIO_EN, BIT(17)),
> +       AN7581_GPIO_GROUP(18, GPIO18_FLASH_MODE_CFG,
> +                           REG_FORCE_GPIO_EN, BIT(18)),
> +       AN7581_GPIO_GROUP(19, GPIO19_FLASH_MODE_CFG,
> +                           REG_FORCE_GPIO_EN, BIT(19)),
> +       AN7581_GPIO_GROUP(20, GPIO20_FLASH_MODE_CFG,
> +                           REG_FORCE_GPIO_EN, BIT(20)),
> +       AN7581_GPIO_GROUP(21, GPIO21_FLASH_MODE_CFG,
> +                           REG_FORCE_GPIO_EN, BIT(21)),
> +       AN7581_GPIO_GROUP(22, GPIO22_FLASH_MODE_CFG,
> +                           REG_FORCE_GPIO_EN, BIT(22)),
> +       AN7581_GPIO_GROUP(23, GPIO23_FLASH_MODE_CFG,
> +                           REG_FORCE_GPIO_EN, BIT(23)),
> +       AN7581_GPIO_GROUP(24, GPIO24_FLASH_MODE_CFG,
> +                           REG_FORCE_GPIO_EN, BIT(24)),
> +       AN7581_GPIO_GROUP(25, GPIO25_FLASH_MODE_CFG,
> +                           REG_FORCE_GPIO_EN, BIT(25)),
> +       AN7581_GPIO_GROUP(26, GPIO26_FLASH_MODE_CFG,
> +                           REG_FORCE_GPIO_EN, BIT(26)),
> +       AN7581_GPIO_GROUP(27, GPIO27_FLASH_MODE_CFG,
> +                           REG_FORCE_GPIO_EN, BIT(27)),
> +       AN7581_GPIO_GROUP(28, GPIO28_FLASH_MODE_CFG,
> +                           REG_FORCE_GPIO_EN, BIT(28)),
> +       AN7581_GPIO_GROUP(29, GPIO29_FLASH_MODE_CFG,
> +                           REG_FORCE_GPIO_EN, BIT(29)),
> +       AN7581_GPIO_GROUP(30, GPIO30_FLASH_MODE_CFG,
> +                           REG_FORCE_GPIO_EN, BIT(30)),
> +       AN7581_GPIO_GROUP(31, GPIO31_FLASH_MODE_CFG,
> +                           REG_FORCE_GPIO_EN, BIT(31)),
> +       AN7581_GPIO_GROUP(32, 0,
> +                           REG_FORCE_GPIO32_EN, BIT(0)),
> +       AN7581_GPIO_GROUP(33, 0,
> +                           REG_FORCE_GPIO32_EN, BIT(1)),
> +       AN7581_GPIO_GROUP(34, 0,
> +                           REG_FORCE_GPIO32_EN, BIT(2)),
> +       AN7581_GPIO_GROUP(35, 0,
> +                           REG_FORCE_GPIO32_EN, BIT(3)),
> +       AN7581_GPIO_GROUP(36, GPIO36_FLASH_MODE_CFG,
> +                           REG_FORCE_GPIO32_EN, BIT(4)),
> +       AN7581_GPIO_GROUP(37, GPIO37_FLASH_MODE_CFG,
> +                           REG_FORCE_GPIO32_EN, BIT(5)),
> +       AN7581_GPIO_GROUP(38, GPIO38_FLASH_MODE_CFG,
> +                           REG_FORCE_GPIO32_EN, BIT(6)),
> +       AN7581_GPIO_GROUP(39, GPIO39_FLASH_MODE_CFG,
> +                           REG_FORCE_GPIO32_EN, BIT(7)),
> +       AN7581_GPIO_GROUP(40, GPIO40_FLASH_MODE_CFG,
> +                           REG_FORCE_GPIO32_EN, BIT(8)),
> +       AN7581_GPIO_GROUP(41, GPIO41_FLASH_MODE_CFG,
> +                           REG_FORCE_GPIO32_EN, BIT(9)),
> +       AN7581_GPIO_GROUP(42, GPIO42_FLASH_MODE_CFG,
> +                           REG_FORCE_GPIO32_EN, BIT(10)),
> +       AN7581_GPIO_GROUP(43, GPIO43_FLASH_MODE_CFG,
> +                           REG_FORCE_GPIO32_EN, BIT(11)),
> +       AN7581_GPIO_GROUP(44, GPIO44_FLASH_MODE_CFG,
> +                           REG_FORCE_GPIO32_EN, BIT(12)),
> +       AN7581_GPIO_GROUP(45, GPIO45_FLASH_MODE_CFG,
> +                           REG_FORCE_GPIO32_EN, BIT(13)),
> +       AN7581_GPIO_GROUP(46, GPIO46_FLASH_MODE_CFG,
> +                           REG_FORCE_GPIO32_EN, BIT(14)),
> +       AN7581_GPIO_GROUP(47, GPIO47_FLASH_MODE_CFG,
> +                           REG_GPIO_PON_MODE, GPIO_PCIE_RESET0_MASK),
> +       AN7581_GPIO_GROUP(48, GPIO48_FLASH_MODE_CFG,
> +                           REG_GPIO_PON_MODE, GPIO_PCIE_RESET1_MASK),
> +       AN7581_GPIO_GROUP(49, GPIO49_FLASH_MODE_CFG,
> +                           REG_GPIO_PON_MODE, GPIO_PCIE_RESET2_MASK),
>  };
>
>  static const struct airoha_pinctrl_func_group pcie_reset_func_group[] = {
> @@ -1068,90 +1438,122 @@ static const struct airoha_pinctrl_func_group pwm_func_group[] = {
>
>  static const struct airoha_pinctrl_func_group phy1_led0_func_group[] = {
>         AIROHA_PINCTRL_PHY_LED0("gpio43", GPIO_LAN0_LED0_MODE_MASK,
> -                               LAN0_LED_MAPPING_MASK, LAN0_PHY_LED_MAP(0)),
> +                               LAN0_LED_MAPPING_MASK, LAN0_PHY_LED_MAP(0),
> +                               REG_FORCE_GPIO32_EN, BIT(11)),
>         AIROHA_PINCTRL_PHY_LED0("gpio44", GPIO_LAN1_LED0_MODE_MASK,
> -                               LAN1_LED_MAPPING_MASK, LAN1_PHY_LED_MAP(0)),
> +                               LAN1_LED_MAPPING_MASK, LAN1_PHY_LED_MAP(0),
> +                               REG_FORCE_GPIO32_EN, BIT(12)),
>         AIROHA_PINCTRL_PHY_LED0("gpio45", GPIO_LAN2_LED0_MODE_MASK,
> -                               LAN2_LED_MAPPING_MASK, LAN2_PHY_LED_MAP(0)),
> +                               LAN2_LED_MAPPING_MASK, LAN2_PHY_LED_MAP(0),
> +                               REG_FORCE_GPIO32_EN, BIT(13)),
>         AIROHA_PINCTRL_PHY_LED0("gpio46", GPIO_LAN3_LED0_MODE_MASK,
> -                               LAN3_LED_MAPPING_MASK, LAN3_PHY_LED_MAP(0)),
> +                               LAN3_LED_MAPPING_MASK, LAN3_PHY_LED_MAP(0),
> +                               REG_FORCE_GPIO32_EN, BIT(14)),
>  };
>
>  static const struct airoha_pinctrl_func_group phy2_led0_func_group[] = {
>         AIROHA_PINCTRL_PHY_LED0("gpio43", GPIO_LAN0_LED0_MODE_MASK,
> -                               LAN0_LED_MAPPING_MASK, LAN0_PHY_LED_MAP(1)),
> +                               LAN0_LED_MAPPING_MASK, LAN0_PHY_LED_MAP(1),
> +                               REG_FORCE_GPIO32_EN, BIT(11)),
>         AIROHA_PINCTRL_PHY_LED0("gpio44", GPIO_LAN1_LED0_MODE_MASK,
> -                               LAN1_LED_MAPPING_MASK, LAN1_PHY_LED_MAP(1)),
> +                               LAN1_LED_MAPPING_MASK, LAN1_PHY_LED_MAP(1),
> +                               REG_FORCE_GPIO32_EN, BIT(12)),
>         AIROHA_PINCTRL_PHY_LED0("gpio45", GPIO_LAN2_LED0_MODE_MASK,
> -                               LAN2_LED_MAPPING_MASK, LAN2_PHY_LED_MAP(1)),
> +                               LAN2_LED_MAPPING_MASK, LAN2_PHY_LED_MAP(1),
> +                               REG_FORCE_GPIO32_EN, BIT(13)),
>         AIROHA_PINCTRL_PHY_LED0("gpio46", GPIO_LAN3_LED0_MODE_MASK,
> -                               LAN3_LED_MAPPING_MASK, LAN3_PHY_LED_MAP(1)),
> +                               LAN3_LED_MAPPING_MASK, LAN3_PHY_LED_MAP(1),
> +                               REG_FORCE_GPIO32_EN, BIT(14)),
>  };
>
>  static const struct airoha_pinctrl_func_group phy3_led0_func_group[] = {
>         AIROHA_PINCTRL_PHY_LED0("gpio43", GPIO_LAN0_LED0_MODE_MASK,
> -                               LAN0_LED_MAPPING_MASK, LAN0_PHY_LED_MAP(2)),
> +                               LAN0_LED_MAPPING_MASK, LAN0_PHY_LED_MAP(2),
> +                               REG_FORCE_GPIO32_EN, BIT(11)),
>         AIROHA_PINCTRL_PHY_LED0("gpio44", GPIO_LAN1_LED0_MODE_MASK,
> -                               LAN1_LED_MAPPING_MASK, LAN1_PHY_LED_MAP(2)),
> +                               LAN1_LED_MAPPING_MASK, LAN1_PHY_LED_MAP(2),
> +                               REG_FORCE_GPIO32_EN, BIT(12)),
>         AIROHA_PINCTRL_PHY_LED0("gpio45", GPIO_LAN2_LED0_MODE_MASK,
> -                               LAN2_LED_MAPPING_MASK, LAN2_PHY_LED_MAP(2)),
> +                               LAN2_LED_MAPPING_MASK, LAN2_PHY_LED_MAP(2),
> +                               REG_FORCE_GPIO32_EN, BIT(13)),
>         AIROHA_PINCTRL_PHY_LED0("gpio46", GPIO_LAN3_LED0_MODE_MASK,
> -                               LAN3_LED_MAPPING_MASK, LAN3_PHY_LED_MAP(2)),
> +                               LAN3_LED_MAPPING_MASK, LAN3_PHY_LED_MAP(2),
> +                               REG_FORCE_GPIO32_EN, BIT(14)),
>  };
>
>  static const struct airoha_pinctrl_func_group phy4_led0_func_group[] = {
>         AIROHA_PINCTRL_PHY_LED0("gpio43", GPIO_LAN0_LED0_MODE_MASK,
> -                               LAN0_LED_MAPPING_MASK, LAN0_PHY_LED_MAP(3)),
> +                               LAN0_LED_MAPPING_MASK, LAN0_PHY_LED_MAP(3),
> +                               REG_FORCE_GPIO32_EN, BIT(11)),
>         AIROHA_PINCTRL_PHY_LED0("gpio44", GPIO_LAN1_LED0_MODE_MASK,
> -                               LAN1_LED_MAPPING_MASK, LAN1_PHY_LED_MAP(3)),
> +                               LAN1_LED_MAPPING_MASK, LAN1_PHY_LED_MAP(3),
> +                               REG_FORCE_GPIO32_EN, BIT(12)),
>         AIROHA_PINCTRL_PHY_LED0("gpio45", GPIO_LAN2_LED0_MODE_MASK,
> -                               LAN2_LED_MAPPING_MASK, LAN2_PHY_LED_MAP(3)),
> +                               LAN2_LED_MAPPING_MASK, LAN2_PHY_LED_MAP(3),
> +                               REG_FORCE_GPIO32_EN, BIT(13)),
>         AIROHA_PINCTRL_PHY_LED0("gpio46", GPIO_LAN3_LED0_MODE_MASK,
> -                               LAN3_LED_MAPPING_MASK, LAN3_PHY_LED_MAP(3)),
> +                               LAN3_LED_MAPPING_MASK, LAN3_PHY_LED_MAP(3),
> +                               REG_FORCE_GPIO32_EN, BIT(14)),
>  };
>
>  static const struct airoha_pinctrl_func_group phy1_led1_func_group[] = {
>         AIROHA_PINCTRL_PHY_LED1("gpio33", GPIO_LAN0_LED1_MODE_MASK,
> -                               LAN0_LED_MAPPING_MASK, LAN0_PHY_LED_MAP(0)),
> +                               LAN0_LED_MAPPING_MASK, LAN0_PHY_LED_MAP(0),
> +                               REG_FORCE_GPIO32_EN, BIT(1)),
>         AIROHA_PINCTRL_PHY_LED1("gpio34", GPIO_LAN1_LED1_MODE_MASK,
> -                               LAN1_LED_MAPPING_MASK, LAN1_PHY_LED_MAP(0)),
> +                               LAN1_LED_MAPPING_MASK, LAN1_PHY_LED_MAP(0),
> +                               REG_FORCE_GPIO32_EN, BIT(2)),
>         AIROHA_PINCTRL_PHY_LED1("gpio35", GPIO_LAN2_LED1_MODE_MASK,
> -                               LAN2_LED_MAPPING_MASK, LAN2_PHY_LED_MAP(0)),
> +                               LAN2_LED_MAPPING_MASK, LAN2_PHY_LED_MAP(0),
> +                               REG_FORCE_GPIO32_EN, BIT(3)),
>         AIROHA_PINCTRL_PHY_LED1("gpio42", GPIO_LAN3_LED1_MODE_MASK,
> -                               LAN3_LED_MAPPING_MASK, LAN3_PHY_LED_MAP(0)),
> +                               LAN3_LED_MAPPING_MASK, LAN3_PHY_LED_MAP(0),
> +                               REG_FORCE_GPIO32_EN, BIT(10)),
>  };
>
>  static const struct airoha_pinctrl_func_group phy2_led1_func_group[] = {
>         AIROHA_PINCTRL_PHY_LED1("gpio33", GPIO_LAN0_LED1_MODE_MASK,
> -                               LAN0_LED_MAPPING_MASK, LAN0_PHY_LED_MAP(1)),
> +                               LAN0_LED_MAPPING_MASK, LAN0_PHY_LED_MAP(1),
> +                               REG_FORCE_GPIO32_EN, BIT(1)),
>         AIROHA_PINCTRL_PHY_LED1("gpio34", GPIO_LAN1_LED1_MODE_MASK,
> -                               LAN1_LED_MAPPING_MASK, LAN1_PHY_LED_MAP(1)),
> +                               LAN1_LED_MAPPING_MASK, LAN1_PHY_LED_MAP(1),
> +                               REG_FORCE_GPIO32_EN, BIT(2)),
>         AIROHA_PINCTRL_PHY_LED1("gpio35", GPIO_LAN2_LED1_MODE_MASK,
> -                               LAN2_LED_MAPPING_MASK, LAN2_PHY_LED_MAP(1)),
> +                               LAN2_LED_MAPPING_MASK, LAN2_PHY_LED_MAP(1),
> +                               REG_FORCE_GPIO32_EN, BIT(3)),
>         AIROHA_PINCTRL_PHY_LED1("gpio42", GPIO_LAN3_LED1_MODE_MASK,
> -                               LAN3_LED_MAPPING_MASK, LAN3_PHY_LED_MAP(1)),
> +                               LAN3_LED_MAPPING_MASK, LAN3_PHY_LED_MAP(1),
> +                               REG_FORCE_GPIO32_EN, BIT(10)),
>  };
>
>  static const struct airoha_pinctrl_func_group phy3_led1_func_group[] = {
>         AIROHA_PINCTRL_PHY_LED1("gpio33", GPIO_LAN0_LED1_MODE_MASK,
> -                               LAN0_LED_MAPPING_MASK, LAN0_PHY_LED_MAP(2)),
> +                               LAN0_LED_MAPPING_MASK, LAN0_PHY_LED_MAP(2),
> +                               REG_FORCE_GPIO32_EN, BIT(1)),
>         AIROHA_PINCTRL_PHY_LED1("gpio34", GPIO_LAN1_LED1_MODE_MASK,
> -                               LAN1_LED_MAPPING_MASK, LAN1_PHY_LED_MAP(2)),
> +                               LAN1_LED_MAPPING_MASK, LAN1_PHY_LED_MAP(2),
> +                               REG_FORCE_GPIO32_EN, BIT(2)),
>         AIROHA_PINCTRL_PHY_LED1("gpio35", GPIO_LAN2_LED1_MODE_MASK,
> -                               LAN2_LED_MAPPING_MASK, LAN2_PHY_LED_MAP(2)),
> +                               LAN2_LED_MAPPING_MASK, LAN2_PHY_LED_MAP(2),
> +                               REG_FORCE_GPIO32_EN, BIT(3)),
>         AIROHA_PINCTRL_PHY_LED1("gpio42", GPIO_LAN3_LED1_MODE_MASK,
> -                               LAN3_LED_MAPPING_MASK, LAN3_PHY_LED_MAP(2)),
> +                               LAN3_LED_MAPPING_MASK, LAN3_PHY_LED_MAP(2),
> +                               REG_FORCE_GPIO32_EN, BIT(10)),
>  };
>
>  static const struct airoha_pinctrl_func_group phy4_led1_func_group[] = {
>         AIROHA_PINCTRL_PHY_LED1("gpio33", GPIO_LAN0_LED1_MODE_MASK,
> -                               LAN0_LED_MAPPING_MASK, LAN0_PHY_LED_MAP(3)),
> +                               LAN0_LED_MAPPING_MASK, LAN0_PHY_LED_MAP(3),
> +                               REG_FORCE_GPIO32_EN, BIT(1)),
>         AIROHA_PINCTRL_PHY_LED1("gpio34", GPIO_LAN1_LED1_MODE_MASK,
> -                               LAN1_LED_MAPPING_MASK, LAN1_PHY_LED_MAP(3)),
> +                               LAN1_LED_MAPPING_MASK, LAN1_PHY_LED_MAP(3),
> +                               REG_FORCE_GPIO32_EN, BIT(2)),
>         AIROHA_PINCTRL_PHY_LED1("gpio35", GPIO_LAN2_LED1_MODE_MASK,
> -                               LAN2_LED_MAPPING_MASK, LAN2_PHY_LED_MAP(3)),
> +                               LAN2_LED_MAPPING_MASK, LAN2_PHY_LED_MAP(3),
> +                               REG_FORCE_GPIO32_EN, BIT(3)),
>         AIROHA_PINCTRL_PHY_LED1("gpio42", GPIO_LAN3_LED1_MODE_MASK,
> -                               LAN3_LED_MAPPING_MASK, LAN3_PHY_LED_MAP(3)),
> +                               LAN3_LED_MAPPING_MASK, LAN3_PHY_LED_MAP(3),
> +                               REG_FORCE_GPIO32_EN, BIT(10)),
>  };
>
>  static const struct airoha_pinctrl_func pinctrl_funcs[] = {
> @@ -1168,7 +1570,7 @@ static const struct airoha_pinctrl_func pinctrl_funcs[] = {
>         PINCTRL_FUNC_DESC("i2s", i2s),
>         PINCTRL_FUNC_DESC("emmc", emmc),
>         PINCTRL_FUNC_DESC("pnand", pnand),
> -       PINCTRL_FUNC_DESC("gpio", gpio),
> +       PINCTRL_GPIO_FUNC_DESC("gpio", gpio),
>         PINCTRL_FUNC_DESC("pcie_reset", pcie_reset),
>         PINCTRL_FUNC_DESC("pwm", pwm),
>         PINCTRL_FUNC_DESC("phy1_led0", phy1_led0),
> @@ -1432,6 +1834,7 @@ static const struct airoha_pinctrl_conf pinctrl_pcie_rst_od_conf[] = {
>  };
>
>  static const struct airoha_pinctrl_match_data pinctrl_match_data = {
> +       .check_mux_conflicts = true,
>         .chip_scu_compatible = "airoha,en7581-chip-scu",
>         .pinctrl_name = KBUILD_MODNAME,
>         .pinctrl_owner = THIS_MODULE,
> --
> 2.43.0
>
