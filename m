Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.27
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793281592;
	b=XraDbdNflxGZuh2I0xm57CtLkTZjZZR9Yz1IoA5AHKftJVsZZjfzVqmlvEU1pkGQef+q
	 /2K6PqGEwCPJio41dEc7/SVvab99eAC4iwzIQBgJJvMSe3AhGaskus9RUj68+3y37/TFV
	 aauqI6bjFax41L4T+0BBNACEbzSCZA+YuqHKt1vynQx/TzhqkLHlCJeUCzQGvzlL0Dg4Q
	 FWA5DNQhCgpo6uWGMZK2tRL9Uycv8kdkHTkxf+tpxKJzyoQsunP+gY26qc+jGv77/q+38
	 qBNgfGG3qtijvwxgBMvra/8298cjCarbmrGHZhGU/hA1KlltFWdVqyZ6LucTrGXT3lA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793281592;
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
	b=XGY5WmU6jF+eUKp20JqunCYp/cmNgy8nC072nkA5gYCtz6cXobrUsFU8xzEmLh/C/vqg
	 poabZw2qHDwQtpzo9HRNpE2fdGtKrn24MzcPtX3XSWUyj5fYskYNLA3U+2mXX/izSFCTP
	 rjkJ6KXV8YOhyFyB+37zDgDcc+JrcGpIcDN7Hy9hciJGBJzekOIHcc6iHMPVj1/skJlmm
	 xscPhi6cKX7h0AaRNN8BbIZ56QtAc2NkqmThlcnViNUvtReQm6fm76ErcYCyl18u3nX2F
	 b5yqei1JsgHUEct/qSU3K4v5dIY+VxD3QJASKo+2OFpHYSFiynpTqRoSmkKayQgU7BA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=G0DODvER;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.27
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011027.outbound.protection.outlook.com [52.101.70.27])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D43C9606A32E;
	Thu, 29 Oct 2026 13:46:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D43C9606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=G0DODvER
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b2A6LxlsOOX2jnffwExNThrJQwQXQv1FBWFiiIyluz0ywRf8mc17JB7AduQauX26hkeYMxQX3evTH7I/qOnrCupxALWfKquNzNCcweFjANpaiZP4uor8NXV06xQAoN9Q1t4swKSmULibNkUq+DZ7yHA+hoa6rCt0GlbrBcw0Q9SVtvfEb2xmX2zR003UjG4yVwWMNJK3kYCK2+1JzZb+Ix53pqgOoiI+QqCBg/SQgnSeaVx+k0Z+i2RFEFiH0C9D3v6nNTryoqMaF3kaYgPQxSOQWiSBBTchH8kKJoCpjoOjYCPv0OoJFWpjAZOXqIHp9+vhR0cD8N9GKCaK3WGjRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9iRvSuwf6mJVTWpR529GutK7+dWh/wKMGBnvBidJn0k=;
 b=rsUgzDdpKH22S110FiunvTOht35EIeiqPKLYqEvByrDPvGqmpp6rJ5F9w81DtY2HVa8jf3tCML6qjyCtZjruaWfVM0fkJDY8rt2bWvl1M1FjkUTfZLSWUcZd1vAYhJEPwWhYilSbcvU3sjK3aFJ2iLGaRGB94881fW0Z4Vzuwe3K8NRI//YZ9bZ1oRIx37CclF7ZeQTMJ0349YzPPd9cI9RqMGbDw26KEABaOAncraev/ktAof4H5zTCjgACHrEufe1LXomRbeNXrDO9+isRxP6WaS29xIDtlVR/9khPl6+BQL+MzXntaQlF/eqIFtKPs7hcPzZ3h22mWYxp7bEybA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9iRvSuwf6mJVTWpR529GutK7+dWh/wKMGBnvBidJn0k=;
 b=G0DODvER6JyZ1tQgfqfcK/qTNoyUPNW68rLgdo2doXlI9JKugTeaBXcZuU9C74c/3zRBWUhRK0PVXQARAVsFXNuEqRdWaQ2dAk5SvV5T7/IJ/P5g8KZfl4mzkHXgUaPn+8G2f8gDgABA8kMyc4hAUw9h49uBtxkoKvWGCGepVow/MH8dsj39Bg8zZfB+rI3HJ9I6tIcqNkLKmzGruJ/lc9aNdqvK8FGhB0b0drOwArBzAhsVgcI5TyREgAlVeMeRaPI4SNY2ZuLSMwxMCwC8+wg4rp8CM1t3sQUC8r+udzMlMsx9WoOwXsc3owqBLQuuyXY3GOQ1N2+pxHTf7cKtOw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by DB8PR04MB6892.eurprd04.prod.outlook.com (2603:10a6:10:113::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.8; Thu, 29 Oct
 2026 13:46:27 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0569.007; Thu, 29 Oct 2026
 13:46:27 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Thu, 29 Oct 2026 21:42:32 +0800
Subject: [PATCH 08/11] arm64: dts: imx93: fix gpio clocks
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261029-gpio-vf610-fixes-v1-8-45b484b4c434@nxp.com>
References: <20261029-gpio-vf610-fixes-v1-0-45b484b4c434@nxp.com>
In-Reply-To: <20261029-gpio-vf610-fixes-v1-0-45b484b4c434@nxp.com>
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
X-ClientProxiedBy: SI2PR01CA0040.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::14) To AM8PR04MB7874.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|DB8PR04MB6892:EE_
X-MS-Office365-Filtering-Correlation-Id: 98b7e314-fbbd-4ef0-668d-08df35c307c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|7416014|376014|19092799006|921020|11063799006|56012099006|261009223027099003|261021123027099003|261026121527099003|261021121427099003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	iQQ/4NVzJ5cKJ163ElNkm1XzG03qAy135R/pIHU5nvNPgfQI4jXIfV84KUz/FR3VJcMxre2qQyDjC4zTiglpmLCZqPN6mi+J32ZKGmgJUqnM2gS1jFcthx3YGkho4OlxYcmqA8Smk9aQOD7h+w/FISwfWR2kVun5h9O1KNxtMQeZp4fP2cOpT2yk2NHT3oo6wpl0jZLT417/XZ24ecQ78byRDy6Nq0elcRwASxborw4Cjij2ZAEe26w4az4IDEZFZGy68H1A3vjyY9cmP3UE6DsYJMZvWF+RYJh0ay19Ndb8Xa1yY7kNhAbGeKa5CEEB3N9HWTDzAZV3mz1lOVHGPewptBdnPGJmBPQw/CgpMFRai3DwIIngphAJTJjiT9nnOLyN7tdGSNkifFgg7KCd+xCgb2R0qUmZvuXh2uHua5+r5Svh0mdOHxWKwBHGq4a74skuG6T+TrKbwbNPNDYLhfaI1eyn14yP3Ntv6WdGdoohGNYbwyUf3EymyDrqeN/NGBZolryKqH2jN1XM1UwkPRFKcY6Lf8WPqtAbEUOuy6gIY66TRehQDeu5ZT04HlmnJCEeXBAyt0/Trg7N7QQM2KiSP4azE+uRbolHAOuseaSH6ueSmh9lmnEmBI0jt73ixNWQ5FA1VF+T7iwtoy2M8CUy7lTOQQPbcPaajKFtmniPFIjZdoRw81j5yu+ppPoqdLMgu/GuHKwyaSIZvfhNGA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(7416014)(376014)(19092799006)(921020)(11063799006)(56012099006)(261009223027099003)(261021123027099003)(261026121527099003)(261021121427099003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YmFIOS9OVS9IQUhFTVgxTmpGc2owcGxZZDlOdmRSS1QrNVVDUFFpNkdxNncv?=
 =?utf-8?B?RjdMSkp4NG9TcE10a3pwYUZkL091MG1OR3gxY21WczdwQngyN1Z3YWE4R1Bl?=
 =?utf-8?B?UWNTUUFmbi80a3dpRmdXL0N6c1lGZkNQMWRNVC9KRTRkOVZDbEo1TGxUeE9j?=
 =?utf-8?B?Z3llZmx5SjduYk8wNXVja1ErU01zR1NpaXJCcmdtcnl6VENHU0pHS3JWNmJK?=
 =?utf-8?B?QmsrK2pDbUd3aUgyOGowZUlQRlMyNVNNZG5relg4Y2JmZHBKcC9nb29SSTZj?=
 =?utf-8?B?UjZDbFh0WXNGQTdhUm1JeHJPZi95MmZUcjVHeHFHR0RZZEIwSlJyRWIzMkRu?=
 =?utf-8?B?bXhmbVZib295TVBQc3gybE1NamNtTUE0OEdRTlNDcjFRL0x3bHVEWEZmcXp4?=
 =?utf-8?B?ZjBSZTFmUjdHYzlRWWw5a0VGeGRCYkJaWkVnTld1LzVSS3Zya3JWZzhiUjYv?=
 =?utf-8?B?VlpvZ3hJcll3NTl6T0xmWUVYMHVZSmd6SEV2N3RqNEpxbUwwOEVrYStjZlJT?=
 =?utf-8?B?MFFwYlh2amxKYTNjM2thMXl5aW5ZQmh0aEYxYjJ3ZGU5TmEyeGQxYjF4eEtI?=
 =?utf-8?B?ZW1TdWNXT2xacit6cUJmUklobHVvbFgvVlNRVW9ZU2Z4RlE3SlZEOFNaQVkv?=
 =?utf-8?B?ZTN2MW0yYnoxQ3p3S2lnWnFSQUdhTjAwc3ZMMFFPbERUSldkK1RIbGE0c2g0?=
 =?utf-8?B?dy91REp1KzRqb1p3WlVWaGJKS3VURjlCUWxGcUlVYkZ4YnJWaExVaDJUREJt?=
 =?utf-8?B?N2RDQzJVMjZ0S2FLYi85bklJbnZ4NC9VZW5RZWp1aWhyT2NIUEFYM05LOG11?=
 =?utf-8?B?Z0M1bzhyWTV5UjZmYXhHMGNtVEJhR1NhWElsbW0ybmdqVUs0M21BUHJJRW4w?=
 =?utf-8?B?QnVudW8xL2ZwZkJrVm5FWXVVSVhya0pIWU42MHM4a0IwRURUOVhoQkZLZ1pV?=
 =?utf-8?B?OEN0SVNmbk1ldm9wZmFycnlocUNXbUU5VzhyQkt0SXZJL2RIcElITUt5bktB?=
 =?utf-8?B?T3UvOURZS2FkbVdXWUpyZzgwVUFUcklWU2NtK2V2SXVVY29PWFNwWERYWXcw?=
 =?utf-8?B?VXhMWW9FREZqU1VUL1hBKzRkMzNaZmh6Q1ZvdFNkNGZ0YXAybHBGUzNqck5P?=
 =?utf-8?B?ZHRpODJZeWtoVk1yK2t2L0NldzJpRk15NDU3Q2FxRER0cUUrcGcyaVlyVWcr?=
 =?utf-8?B?S1ZQaWlUNDhqWVltY1ZjWkhoMXh3Z2Y2bzNDcjFzaE9CVVphK2pScjN0Q3FB?=
 =?utf-8?B?ZVJzNlFoeTNORjB1RFNsc3E3eFB0T1p4RnN5aDVqTmdEWTBFQXN4V1VrRktN?=
 =?utf-8?B?djhiTlZuZkZ1aGl4bUc4TEtEVDkzMytqemc1czFvR0ZyM0x1RytEZGQ1OWw5?=
 =?utf-8?B?YlBjdFF5NjFQVVNpK2dlRTE4YjRPMGFPRTFKbUVBNS9WZysrRjJNY29udzFE?=
 =?utf-8?B?SlBESEF5ZXlnWFVXMjVHU1BXbytabXlFelpPVUNtcW1uZW9KSnVnQzRiTGdy?=
 =?utf-8?B?dzNOWVRiTnVJb3JIbHhkbzZ5bmNudzNIaldKZElrRmVZUkFxZXlpaWVzK1cw?=
 =?utf-8?B?WU8vVXNqdmZGSmUxaFRxRDIyajJrc2NmU2x2ckh3dVBvN3BodzBreEhaa0wx?=
 =?utf-8?B?NFhFcnRXYUJtS3pjanRaVHo2NkZZL2V2V1FjeTFPQ3NrOG5FcC96SlZaK0NE?=
 =?utf-8?B?MVdaRFRwR042eHFXdVdmUjlVK05BUVhlVVF1YUM2c3Z1WG15RDk2bFo2R1dX?=
 =?utf-8?B?bFBqamhWUWlMMGdkTEErS3plTThqWjNKS2pBVitsdnNhUTVlN3dZdC9LY2JW?=
 =?utf-8?B?cDJyclFsTHJUNGJyYkowUkhKYjRUcURLbXgwYWNkZk5UY09pR2tmOXdoNVd0?=
 =?utf-8?B?UTlidURXdCtzUWtBK2dQVUMvQW9UQ2M1cXl3SmlDdUg1RFhXdjhxV3FEbzcy?=
 =?utf-8?B?TEZaTGZvM2JFRm9JcGFEb1dQUm0vbGx0MDc4VHlhRWY1VlBCdUV0U3k1OFlU?=
 =?utf-8?B?elEwc1ZraHg5bDZJd25hWDFOeGRBWkpOczVuQmtmSUhYZTEyUWM5K05sUXVP?=
 =?utf-8?B?Q0VEMlNqR0RCaE5KblNBbzNXWDU1OERROHdRem1uUExYNHN6QllXM1lHQ0Na?=
 =?utf-8?B?ZkYxMFE0SHl5WnRLWGExbVFEdEVzRUlLYkY2QlFmdXF1Rk0xZHBmcnUrdVJi?=
 =?utf-8?B?aFlRb0RjRjlTNk51RXBLSkVOZ2ZyLzZ6dytZcC9wMkQrcTRpS0paMnNaZHVl?=
 =?utf-8?B?ZjQySGI1a0JlNlFMWDdZQ0d6aTBUSHZZVjZyWXJ4QVhQVDhxWmhCUDVLSGhM?=
 =?utf-8?B?TlAvY1BqeU5GSlgvTWs5UnRSMGY4L3pQVUg5RjB5WWsvcDR4a0FFbFJmTldq?=
 =?utf-8?Q?NOqLtxv/sPSKhm1G+/TWO+z1eWueVBttMObXg?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98b7e314-fbbd-4ef0-668d-08df35c307c0
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2026 13:46:27.8523
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZJ4W/weNxf+cdLlEBTqGTlYHZN8wM4VKXaC/XhyzbDbE8nl2qe9EHi2Uro0+YOOXmnRLBEd/3fWVlNHgd9+QnWEImhuYcFHFjzqIc5xfa8f1t/16pSXYOUn1ZKWViEck
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6892

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

