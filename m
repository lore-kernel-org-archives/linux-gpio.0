Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.69.58
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793631008;
	b=zBad58DPjwQWWkbke9J+GLwxUjiB66+7DKvimfieletvFhRt47YX4ejHDq2OiQg5nrRh
	 s3bVLxl05ScJnrsa7kSk0VmSEgTIwnAGH6tJT918szQjqkWPYHvy0InyO+eshzeXDD2fP
	 Q/vF7Jsv59Efg0V3kU4YF7/Rn6lj4JpK+1Nu5DPqfqAaBtRTjol521CqV/2zZyr2/jaO1
	 U4v03nw5HfdZFQRHqZcZySkYYK2bbb5kT/UUXdIcD2SINv4hOmvC75AJ820Wz91a44LpG
	 VxOgzjZF9IDeYA0Sexnce9gHTWjV5TNAAmduTccOzGsFg8WvJCt2VLSG5MshkRuCYcg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793631008;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
	 X-MS-Exchange-MessageSentRepresentingType:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SharedMailbox-RoutingAgent-Processed:X-LD-Processed:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=0X4mXGhKygq3SXERn4rL52v4k+NZABPwOT13QUOkoIA=;
	b=TZiGylJ6+gWdEDek+1iGrKJif1/a9olHs7e9yClbuZmgK/8Warptli/qFOvhjQHYFiys
	 rhyzm1KKxo+yUTknguzngq8Q5iLaLreAGrZxYIUR79hxQRwJT366j5zEioF6OskQARQM0
	 vkLDauUvXGHAkUraiCV7NcjjMqu132yLNewiFvUPLNatdTZWLLYc/Jt9Xu4zCbirZTdnq
	 HSDqrK//srwk5Phk+NB11qrTigQl/kH94ZTFA1p6Ui17zgwqBLe3QroPC3d4HEYB+DRmU
	 nuotdwO81qAZ8cWBMp9EUy1SAfm+wd9JrBoST1MYZaYvQZfc87vlVOdme17WQ9kiHAg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=RoLKWotl;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.69.58
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010058.outbound.protection.outlook.com [52.101.69.58])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF5FD60A34F5;
	Mon,  2 Nov 2026 14:50:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF5FD60A34F5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=RoLKWotl
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=US6yATeh3UOvhX8AAtu1guU6FP1XXL0YPYvJjFe8S1HewH6QY013iRIuVWFUym5VwXiQsK1Hash/PrJVffH1ItHAn0SptWpf83s33oCoRN6g5lMRkrkD+hdwB2gqC6G33hkI8gSzGPFNTvvbdkudmTI6jRtK7FmxUkvSMsExH7C5nLKUVN8/d8wAuzOjlhjT5NUMGghyxnghqPRtLQiSiuXLQNin8ntZXNi13TQLWreVdkNLgUqYguaMHrk8DiFhPljUoayZtRTJ7PVZlQ/K8iJDFKdC45l0ILZRr1sIUD5YUaoRAHVCXIenjsgKzgN2OxeODrGQLs0QxOPdXM0atA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0X4mXGhKygq3SXERn4rL52v4k+NZABPwOT13QUOkoIA=;
 b=lQ9Kvmt4Bi63Md+a3+gNi7hItIsCcZ8UzixHnIrNwjqBfJ0Sz55PZC+1IrJhIGlBV6HJ3UpUZxIN2INRJVWY8e4TxVzrxKClFqMp1CDT3ek/nxGKEu6zt+kBtHxA6ipHEoBZ0wHxV0SyL11MS6N1OH/lLqdTwiNSgsbeb7sgw3LkjyVLR5/4GWOr6WPokXL3STg5OjXzU17qoiof7VZSnTCCEM93X+836208t6V3qdldc7TFXKgvL+RZJBuQ8TxTDumiq2hhji2gT44ADk9AKqfr62OSuIk+hJ92NkgqnLD9Qt9fLjTcL8xOwO42xEw6fT4LPUp7/Cmg3O6rkqwRJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0X4mXGhKygq3SXERn4rL52v4k+NZABPwOT13QUOkoIA=;
 b=RoLKWotlsY+BvznjtQxLYUS9/1JnF6CstrdbVM5iM/I0unrcNLEmJ/UuEpnQXKK+2jKH41pvFvXMw0djny+W0Y7YnQeTtATjoxCPIuNZmhKtJwMjjMvz6IQVKmnciSqMrYAOlxhoTnfzxCgrxfIfEetdviaDJyiw8mCjN21RotFSTYVeaRvKUlFjL3ZfwBZ92jhG4QZV/Eptz5coECxDxgW1ddstwtou4CFthfZgRiSMRrzDHb+1vTNZBhfIIk8CUve7wcmRrgCOxF5s9A6FqaNzxYNSSbAkWkhOX40ncMCUgFTxrpEQ8JcPuK3uaXnlikQCvMU0u3S7yvtY+TrZ5g==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8179.eurprd04.prod.outlook.com (2603:10a6:20b:3b5::20)
 by GVXPR04MB10633.eurprd04.prod.outlook.com (2603:10a6:150:225::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 14:50:01 +0000
Received: from AM9PR04MB8179.eurprd04.prod.outlook.com
 ([fe80::a551:cde0:6730:1d85]) by AM9PR04MB8179.eurprd04.prod.outlook.com
 ([fe80::a551:cde0:6730:1d85%5]) with mapi id 15.21.0569.011; Mon, 2 Nov 2026
 14:50:01 +0000
Message-ID: <1cb65dfc-78a7-4cdb-bb39-c40b980b2504@oss.nxp.com>
Date: Mon, 2 Nov 2026 16:49:47 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: defconfig: Enable PINCTRL_S32G2
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chester Lin <chester62515@gmail.com>,
 Matthias Brugger <mbrugger@suse.com>,
 Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>,
 Larisa Grigore <larisa.grigore@nxp.com>, Lee Jones <lee@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Dong Aisheng <aisheng.dong@nxp.com>,
 Jacky Bai <ping.bai@nxp.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Srinivas Kandagatla <srini@kernel.org>, Alberto Ruiz <aruizrui@redhat.com>,
 Christophe Lizzi <clizzi@redhat.com>, devicetree@vger.kernel.org,
 Enric Balletbo <eballetb@redhat.com>, Eric Chanudet <echanude@redhat.com>,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 NXP S32 Linux Team <s32@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Vincent Guittot <vincent.guittot@linaro.org>
References: <20261102141635.3768024-1-khristineandreea.barbulescu@oss.nxp.com>
 <2026110233-unlocked-outclass-9584@gregkh>
Content-Language: en-US
From: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
In-Reply-To: <2026110233-unlocked-outclass-9584@gregkh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0134.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b9::8) To AM9PR04MB8179.eurprd04.prod.outlook.com
 (2603:10a6:20b:3b5::20)
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8179:EE_|GVXPR04MB10633:EE_
X-MS-Office365-Filtering-Correlation-Id: 3be45614-7dfa-4232-583f-08df38f09293
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|7416014|19092799006|11063799006|4143699003|56012099006|261009223027099003|261021121427099003|10067099003|18002099003|22082099003|261102123227099002;
X-Microsoft-Antispam-Message-Info:
 fIIj0WBc1FJHNDbitwPSJrStR4SxEwA2RpMqdRBMZ2lLxrOGeUeeDYxuH8FKhvR7QaZT11BVoqdO8o9bxBqu+tHNHIVdW+jplMRMEnfZi01Qlo3UERB7EqFAt+/ouWhAwgJwC7+6uVsFxsWEfW+eLnMJGxAiH0T0OyWNPzRxv2xX5+w6gQSfBBbdV4qmoduqIy6vvUfj+9Zxl6H6k5KZ1f0reefxhwo5sJsaCSBSIrbaIWXspxo0/40l3ylcSnHK6yYRZmQOsHX4u88HaGSUAruUteR01JCkwW3MISkPSW6f22ffhK0eYk49fyotzZakCPVP1gSs+E+M3n6muTa/BG47Y7B+SCBtXMQvKGHz5qptfPExkNYHMc0sLyGz3LlX9e9HZhUexFJdlHvmkTUITx/p0pFF/CcJWo5EyXIWr4tEmZ2qSCyLz4PALgOJnHIA45dg5OdQWkcky+ORIaPCbELiZcldOGyCoqHxZR8+AUBOC4VmfkbRCVA/NuIEgFIX4wTDyC7YLe+joGz4XaL7rvSxgcVZf8vXemZXru6GpxPLPANTi5NcPEM9RAVH/rBy+agGwsTRS0SDugnWUkQL4zd6MGq3JN4P5pUYJtXvqZF6QzFu7jYTjo7Bt3ny2q2nt+aDGBcaYr4Eye3xRudZW58lOTdrEVfqzNVG23s+zxI=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8179.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(7416014)(19092799006)(11063799006)(4143699003)(56012099006)(261009223027099003)(261021121427099003)(10067099003)(18002099003)(22082099003)(261102123227099002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?eDRNM3hGWkNHaEFkNks0VEsvSFZFSVVmR2NDaHk1QTNNb1ZHN0FpaTcrK3lz?=
 =?utf-8?B?ZDNGakk1bDk5cUFoRUJkakJ6N0EzQWFiRUlwSUdRbXJwZXowUWFvN2ROd2dr?=
 =?utf-8?B?ekNiSFpJNDBOUFkza09MZ2trZ0gySWRoSTJIMG5SUzZhR3NVMW5DVjQwRlpH?=
 =?utf-8?B?Y3VJWHl2NGFBczBmckRPMkc1cVlDdDJvUkJ3OXc3MUdQY2VXUWZRdWh5dXlh?=
 =?utf-8?B?Ukl4M3FUNkI2L2d4NFBXK1FqSzUycUJQOTR4aVZKRTc4Y3d6Tm1lK1F2SkVY?=
 =?utf-8?B?RWdXSWZTN2psOXJWc05Ha25oL004TWhMMCtibE4xK0FzNjZiaE80aUpPdTVh?=
 =?utf-8?B?OXM5dG1ReEtmTWIzcFZzN3B5TG5mTzhidlNhREQzM0ViV09BOHZyMWNBYXFH?=
 =?utf-8?B?UDVINEpzVmVuWXcybHdOQkdydnFGZEh0UjB2bS9pVjIxbFh2dWlnWVVxQjl4?=
 =?utf-8?B?VzZVdHJHV1QwS1Q3WnBTaUF0WVM5SWFPMjFuWEFRRnQxM1lCQlhCQ1pXeGk5?=
 =?utf-8?B?QXZZcEdDVG92eUpTSXpNbzVDVmErUUNVVzk3TnRFd3VmNm53aFFtUlQxb2d0?=
 =?utf-8?B?V003MElRNm9GZWdqRDkxWTZiaUpQckRsY2kvSnArUkY5eHAwbjlmMFYxY1l4?=
 =?utf-8?B?aGU0eTIrSHZFKzk4NHhsNE1Ib0FxNUtHaU1iSEVjT3R1QzVmb3E4aXpCZlcy?=
 =?utf-8?B?aTZ1OWJvUVIwT1NmeEI1S2g3TVdFTHVBVUF4QU4vMzY5QjlkT2p2THhHbzBt?=
 =?utf-8?B?ZVpmMDRmd2x6YVVVTitIbkF2RGVwelRmTjZSUVVxbnhVc05CZE53TFJRdG1X?=
 =?utf-8?B?RDhqQ25VN1lxazlNSkVYdzBoajRvbVBnczc3L09OUHdYK0lxWUhrMW95OVNh?=
 =?utf-8?B?VmsvcXRPeTM2TS9BTWZvejNqZ3IxdERGQWJqbDRCNzJUUjlQUVgvSSs3bHhM?=
 =?utf-8?B?VXRGMU1rOHcvdkZkYU9QUjhEK0hEdlJQTk8wNUxjejBsbHdUVCszejc2eGZ6?=
 =?utf-8?B?Mm96RlA2N2NmOW03Y0h6akkwRE5RQmc3VWZmYXVGTWJmVWp2SjZYZTk2MkI3?=
 =?utf-8?B?MUF3TG5nL1VlL1VvZnhJSkZXbjdwSHoyWEpvZitGM0RTYjN3R3dXMjJmbjdZ?=
 =?utf-8?B?aTNWVVpkQVc5bE1mVmdRY1hNdmc0ZFFrR2pvRkxxeFJWbE9aK0tOSlRUNC9L?=
 =?utf-8?B?U1VlbTdkbmJ1Y1A1UDZxRytXUG1zdVU5VTNPemx4K0hCRHBOWGdFQmV4Z3M5?=
 =?utf-8?B?U2pqR081L3BMcUJsRjhCLzYrUWNmOTJFVDZaZzY4akhWMERSdHhsbVdubjd5?=
 =?utf-8?B?TGlYMWN6MzZaV2ZwWGpBbVRMTGUzeXBxUWNDa0hkSkpmTmU3TXEvZFVIYllF?=
 =?utf-8?B?NkprT3ZvMGRQN1VQLzR2VDd1eHVYZU8zNUJKSVRWVG9GVmZvK0pDamNVRi9u?=
 =?utf-8?B?S0FKTnlDUHlNQTJFVmtpYlc3eENYVFVwbmJZNFdYdWZCSThZTFpZZXNKQ3Rw?=
 =?utf-8?B?aGlRRkpVRndJWlFwa2RhK1dMdUhYWU9CM3JrRmMwcS9zZ2xaMXNwQ05HeXFS?=
 =?utf-8?B?OGhUSzJvN3NDTTFWZ1JTRG54TW9ETkxTL1Zicnc2RFVRN1BTK0t6YXJYaVVi?=
 =?utf-8?B?bmxrSEZFc2FaYlRLUmFZVmpIY1pOR1EzTFRXZXpqamVzdDYrZkc4Y0h5bXh0?=
 =?utf-8?B?WDUxdUZVV2taalRMNlVJRThEdnYyWmxUdEpRRkVqakRaNGFCRE51TVlJbUJV?=
 =?utf-8?B?UVQwZ25SaFJGRG1JUC9MQ0o4NFJxRWFuemFCTHczNkliNnBMWUNmYmFqdDVK?=
 =?utf-8?B?UnNHTGFEOS9DTXNtU29sWDl0cWM3K0tub3VMQ2xpOFlOZHFoVkJsaHc1ajNx?=
 =?utf-8?B?NWpFQ3c1WUJoVVFZdVh3ZVRiSzFKMUJsMUxoUWhnd0l3TzcrbkJjY2pMeGMv?=
 =?utf-8?B?V2lBYVpLcmpCR0p6cENucXA4eDl0WmhBcWJiWGhKT3NkOE1aQ1A0dlZPNS9N?=
 =?utf-8?B?MXE5SXE4SWhySVBWY1FMMDF4R2pxRW11VS9pZlhuM1NrU3ZrV0pCQzRnbHQv?=
 =?utf-8?B?MnZncGdlZks0RHdPV3Buc2NyOHlCdmdSQVRiblZQeWNXek9JYVhnTWM4Smhu?=
 =?utf-8?B?NExDUmZ0U3ZDS1RsWnRxdXpzWFhsZHFEQUZqSmE4aWpJaXYza1ZOWG4yL1JP?=
 =?utf-8?B?djl0ZWtqL1ZKV2d2bHQ0ZWFwZU5JR0pYMXZkeGhUYWVaclFNMURsRzIydnpK?=
 =?utf-8?B?TDJ1a1hwb1ZpMG1YSDI0UmhCb1ZjNFNBNXVEYlAvUFNpU3g0Smx2MXhPMWZI?=
 =?utf-8?B?RThKTXFBaGY1dFg4ODUvL3BZemhibW11dDZZcUExQ3Vwb3lMa2o4S0ZnVzFK?=
 =?utf-8?Q?mBzzjqqM9VwUM/KUkhiJLrGQPIMzkIi/Dl4zJ?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3be45614-7dfa-4232-583f-08df38f09293
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8179.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 14:50:01.4314
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v4TFg04MLuhG8w7N+6ULfNcLcI/WxQk+gOHiiVM6nQYUy7/xt8YA83KDkd1ORtc1ec5/wt9/J13+QpFGtxBjSm/Q40i1woKni7ofK3DT72MW8Q+6mMJxWQfC5dAsjZG2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10633

On 11/2/2026 4:24 PM, Greg Kroah-Hartman wrote:
> On Mon, Nov 02, 2026 at 03:16:35PM +0100, Khristine Andreea Barbulescu wrote:
>> Enable the NXP S32G2 pin controller driver in the arm64 defconfig so it
>> no longer requires a manual "make menuconfig" step. The symbol selects
>> PINCTRL_S32CC, pulling in the common S32 pin controller support used
>> across the S32G family.
>>
>> Signed-off-by: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
>> ---
>>  arch/arm64/configs/defconfig | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
>> index 7b4985b29b21..545a2b7db8a5 100644
>> --- a/arch/arm64/configs/defconfig
>> +++ b/arch/arm64/configs/defconfig
>> @@ -704,6 +704,7 @@ CONFIG_PINCTRL_BCM2712=y
>>  CONFIG_PINCTRL_SKY1=y
>>  CONFIG_PINCTRL_IMX_SCMI=y
>>  CONFIG_PINCTRL_IMX91=y
>> +CONFIG_PINCTRL_S32G2=y
> 
> Why?  Shouldn't the normal platform-specific defconfig work for this
> instead?  what defines the arm64 defconfig to require this now for all
> arm74 platforms?
> 
> thanks,
> 
> greg k-h

Hello Greg,

ARCH_S32 is already enabled in the arm64 defconfig, but the supported
S32G boards also depend on this pin controller for their pin muxing.
Without it, some peripherals never finish probing, so a defconfig kernel
cannot boot to rootfs on these boards.

Regards,
Khristine
