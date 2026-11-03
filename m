Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.20
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793694683;
	b=HQtIx9J5uAbysEnquuYGYF9Q+5yzMAkES+dGm6tCxLiPDf1G38DWj9qs4NK67syYNVgn
	 PWHsUrf5fOgwi4ZVfttSwv4jTsUheMzy8FbjJkTCmYSr9YykktXpL3OtiVNuSUGD7ksDc
	 W87xr3v9/KqUYChaJMtwKUjd4bv3gjxu4snFu+4oU1vx25cqqnhxrJG2BHp2XEE7vcqxN
	 PxCzBoE5Y9J4gFH55zBbeNWqvqUx27++uaEPcewYu1GUVZcAoLKjcqxcmPsDhYXfP8+pf
	 FfoaDroK/k7Gh4o6M7fY4CKavBJOJ0m7x+cVq/e6n5bkuQ5aQ/GvT0I86qcM068xtbA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793694683;
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
	bh=q/mBhlfy80rj6cUX8Jd9WooTu7Q+5/yF3m1Z/y6pSKc=;
	b=gV2zgujgkwyaVQgvvPjsADUdfa5dxQw6bejMGYhpYHNUOw3ixQ7/Q21+5leT+UqMm3U+
	 5JlsgYfzPYpqxFJDw9PYO9LtR9PR0LHD5oZ2u+UgrNJMNQHi4iFlCbbiqotm1JzGowuBN
	 JeiZ+WffaZoUlglpYQztFkW+dNNasrjxlkJebK6mzsIyxunZwVP82bdu8uW2DSkx+/aUl
	 necaK2Z92I2yYNryYKLmQdyN3nmeJWIpjIt28KF/uD0u8qBD0q1OV6O16UEnOKfU0O0z+
	 fuP5AfGyXMcXZ2nRlUBxU5S3xd6elP471Ska0IFzjejZZ0omMMsfoGZos6BVuDjbFlA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=dUWXfFPR;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.20
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011020.outbound.protection.outlook.com [52.101.70.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41ED7606C6A2;
	Tue,  3 Nov 2026 08:31:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41ED7606C6A2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=dUWXfFPR
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YtDBtBnUzeiDB/bGr1tCD8IOsZHUn64f2tcgX0gx6/SbkMDS32s+FkVyRYwtk2TOnTE5ggfywmGwj6D+EmdAOSHN07syYApTbpqCpG6aqnTIyKK3TpZKlSqIGdG1nAQpbIFtNQkBCiNhjX75cRAHswOUF1tTxQ92p8IbODbL50SHE/aTgFhmHx9V/rkYvLuJSxRx+GNi13fyWY7sPOAYGPLMXJFpQ9w390gF5qVtyAvwLvcE7ec0yzszRa/0QPiggXxrUzY7jHXFheReQGV9uwzUzIyBTffyh4gke207jdx8XePOzystEaSXzON4SXJDete6LEbmIyi1BjDl09xqXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q/mBhlfy80rj6cUX8Jd9WooTu7Q+5/yF3m1Z/y6pSKc=;
 b=tiCZKafgky1iDp7THcl/kCMZnfjMuTfBxOAYuCUJlL3K8uf4mlAzWPHOfv7Gm1AlOpucp618fVineJmrpFrqQqYHPGZB+K1dBhJ2CifmRT81IeeSY0j93YD6jLjqZiF5HwGaskoubfgxajCYXrlV8G11MOUXzOFUa7ks8OHr4bVCiSCDqJleiifAOkljilkrfsdCh1m3MeaCatPPz6hKpNPKGa1yzvJyGchBZB6/otvq4LeZBKnuudZGgdwcCmvauQgrs09CH8Jz4dAbReE9KeB5/koJY8/o+owAynrJq6xRNuL/ai6rSghSRzzFR3JS6qZ6al02GwYmXgwJgqQVsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q/mBhlfy80rj6cUX8Jd9WooTu7Q+5/yF3m1Z/y6pSKc=;
 b=dUWXfFPRp51XYeUL2DUlOqOOnscrbjdKQrQUDoIsmJc4yIFKzxnd4lyUj/HVw+7EQx2dmqHyq3XCC4Lg8BtX8pSel+zrl9U2DyzVmVUhzcpgOY7bFaapWN6Wr5Oe72Cza2T5QSiD3/+EyJFLIYqRGKDQSKA19VQr7gcX2rsiHreDy0AHniUANlMaIOKtgT42AlhRCNNyytQKSi9YSQlAIPFeSAPonS80AGIUpiEKbtnZOtsSYS9sxp2ZTGXfd6Y3BdrVDj8rbSXwWCMnBjsxa2gPlhI3PSQNRjVcI11AjW+eyMsoPRllqgrWon/aarQmR3wHZVG/pOzsXDRmIk5jKQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8179.eurprd04.prod.outlook.com (2603:10a6:20b:3b5::20)
 by AMDPR04MB733680.eurprd04.prod.outlook.com (2603:10a6:20b:749::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Tue, 3 Nov 2026
 08:31:18 +0000
Received: from AM9PR04MB8179.eurprd04.prod.outlook.com
 ([fe80::a551:cde0:6730:1d85]) by AM9PR04MB8179.eurprd04.prod.outlook.com
 ([fe80::a551:cde0:6730:1d85%5]) with mapi id 15.21.0592.007; Tue, 3 Nov 2026
 08:31:18 +0000
Message-ID: <c00bab0d-c62e-4b29-ae6d-ae5e851040f1@oss.nxp.com>
Date: Tue, 3 Nov 2026 10:31:14 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: defconfig: Enable PINCTRL_S32G2
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
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
 <1cb65dfc-78a7-4cdb-bb39-c40b980b2504@oss.nxp.com>
 <e8add933-e918-40c9-afa7-d66fd589bb9d@kernel.org>
Content-Language: en-US
From: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
In-Reply-To: <e8add933-e918-40c9-afa7-d66fd589bb9d@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0021.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c9::12) To AM9PR04MB8179.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: AM9PR04MB8179:EE_|AMDPR04MB733680:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a8c4be8-9468-47b8-a4ba-08df3984d527
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|23010399003|7416014|376014|1800799024|366016|19092799006|11063799006|4143699003|56012099006|261009223027099003|261028144727099003|261102123227099003|261022105027099003|261021121427099003|261026121527099003|261026140227099003|10067099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
 AOasZMpXpjntFpffYbhSibnzoRKsj2h59rRWaPTq/ROiJZxG0foTVbhxCQIgARvGQubgGM7f82dOT69Ri3mUx8ziHQY2OpCEe6HYnMc/hLxgopbY0HM/pfzUOorVuZRbHlsT25a8SdoKHaABZ3TxLd+E2f2wkfD3RY50Ikf2tXPZu0V+TaBqbD4rplQEaNdG6vIjT9p4LCi0uo2MR5WFuwrZ4I/d6l2N7eEz1AHBHG/3a+QmtnrNWHcWStf6rO8nkUnhrbrHUYVVzhhSQUIml4H2El0Q6LbJ9/asXciyTI7zBkCtUM8ZxxeMtPJuG/qplqmn659XRzcZPW9ScCDOqGAGryLTJJrgn2X3PBvSPRMEiI/j9xRXoBrJmb2Fgr9DN0ciusPkQ/dWUrQvdg1GACRqgYe7uRgSR3Xua5xOs+QtnAspYDJk7hmCBZ/LXh8I6OxB2Nxlzq8Yc7Ame9Vlc0ZMbd/Om2cB09VDJZHZu0+X9lr8OnuDNzy1ih/7CMt7cHic/aEZbi/3UeT4qHMDry59ek+eZTTzhsbJCSi1qULLRPt4ts92UY0ywabnqFKg5R+wEgzCHCNJl2EXQ+UwwtD5TPV7mAJbfLDecOmUjIJrmbfA+roWtwY6ZaeE6LozrJbcoUmfCAizChJAkikvXnrVR+wuoAL3LiuWFoUYRKQ=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8179.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(1800799024)(366016)(19092799006)(11063799006)(4143699003)(56012099006)(261009223027099003)(261028144727099003)(261102123227099003)(261022105027099003)(261021121427099003)(261026121527099003)(261026140227099003)(10067099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?YXVFbTlLdmQ4TFdXSmhkVWp5emZ6WGtadENleUwyL3QwY0NLbWZQVEYxWjdu?=
 =?utf-8?B?aG9xMjVwWTVRa3ZmRUhVVVMzQW9DdHlCaVRZeVRIalFwdnVGVXFScGF4UHpr?=
 =?utf-8?B?c2puaW12VVY5WnNJV3F2YTZpdC9HNHhGTEFVS3UvTmZhOUt6WjgwOU1IYVhq?=
 =?utf-8?B?Y0NlRy9KZWw1M2d4U2tUMTlHbzhHeGVtMXhMM0FkbkFFK0ZIQzdwSzJhSHVn?=
 =?utf-8?B?eFh3ZnIzY3FIRHlUa3Zuc1I3UnlWR0xiQ2U3aU9tcUJDVm1BTFJ1NkpGWUxG?=
 =?utf-8?B?cjBHdHVWRElCbGx6ZUhlV2MxOFQ5U0pRWlU5OXhhNXFMTnpkM1k2aGF3cTRJ?=
 =?utf-8?B?NnJPOTBRVUhyMnZUN3VHSno3Tm9oMnhTL1FBMnhmeGZ4MkE4WThMZjhoMWRP?=
 =?utf-8?B?K01TQ1RBa1JXZi85emtaRTlnZDhNRnBDWmZzbjhZNWJzRUQ3dDBZNi8vRjR4?=
 =?utf-8?B?LzhUSEIzdENWcEFJZVdnaUlVRzA5L2pQY202VFdnN2tQQlpqaGpzY0RtUUZk?=
 =?utf-8?B?SEpjVjNab1RPd1hueVNESnd3b0JoVXc1bUdnVEpCK1FHOU0vODBmL2lnVE9k?=
 =?utf-8?B?ZW9VZ1dudzJpOFQ3QmEyNXJUdnJWbXN5djJlTmZrKzVhUEFOM05NVnNEZTJY?=
 =?utf-8?B?ZlJ0eUlBUHZMdWZod1JoTzdCd1ovZk5lZ01Hek9GbU56di9iNHZ0cHlWOHVO?=
 =?utf-8?B?b01BeHJNM1lCcWNDcHJDeEthWGdmN1RpWm9rS1ZZNVJxcWhqeFl6Q0huNXhH?=
 =?utf-8?B?bjBKRk94YnFqakNuRWZsb1h3a1Y4dEc2MUF1b2dzc0Fkb0JLL1cwS0RTSEhK?=
 =?utf-8?B?dWJNVjZFMEEvU01ab1hScVBMTEM4dXhOemZZT0lZYjZkdXp0a0FlenE3SHRS?=
 =?utf-8?B?em1DeDdMQ21hMjg0T0hKR21yWWg1WHFaYTBFMXBVZXJzdHpodEJMWHdCL3pa?=
 =?utf-8?B?eGNsNFM3eHNxcDArNFA5TzljeHZVS0NCMlFPcW5rWEZVZjIxbnFRZVpoUVN0?=
 =?utf-8?B?YXROb09KL0FqeU1XVXhHQzFOejNwbitsSzFQZ2tmaE5iUGwzNUtsajJSRWtp?=
 =?utf-8?B?M1gyOW4ra3p2Z0Z5MWdDQThHRGpaV0VwWHArSnNzVlE4Q2JLWkFqY1BNd1Nz?=
 =?utf-8?B?Ry90OUowN2hTWSsycnVZdzZVZzhMU2MxR1VqY2ZIMGFYR1JuSHhzVTNSUjRh?=
 =?utf-8?B?c210bWZRb1JveWlXajVDb09STWl3bG1mbVRQOWdibHdvaW44aXRLZU82cUxI?=
 =?utf-8?B?QTZVOVJITWVnaWtIbjJoMGo5a1M1WlU2Zll3VUFsTEV4QTh1N1pReHVEM1FB?=
 =?utf-8?B?K3ZkejRhVnd0UGJiN3JYb3hCYWV2MldzaEdjNi81NERBbi9kK2NkdUo0V1dy?=
 =?utf-8?B?TTNhQzh3eVRjdVcrQ1grRmVrMGNPM21Gd3RsYmZ2OWw0L3BPb1JZcENCWlg1?=
 =?utf-8?B?Z1NuTFZYR1VSVzZCd2FCYkZaMU9iUVQwTUs2cU9IVmUwSzcvUFBVVW1aYVk3?=
 =?utf-8?B?VlBteUtMTkZ2YnJJTExwQ3haQTJaZVlJdnYwVS9PWm83QjczUGFXdUZndTlP?=
 =?utf-8?B?bmYwNW4rTnA5Y2Rha1JuNERZRnR3T1lKWXc4d0VvYVQ3VzUzT0J1OUltcGlF?=
 =?utf-8?B?MlAwdmlmK0NBK1BsbGNnRFB0UFB3K1RjS1RCMnFYVk84eWFxMDM1eWpnQVpT?=
 =?utf-8?B?bTViRmgzY1MwTlBQNDhVL2U4OWdmSEgvZThQNldFYkd3V1FKMklySXQxZzZN?=
 =?utf-8?B?UG9BTlJXSWxtU01DVlpDQkxpYUhtUnFQMkFDY2xXdXdnRWFlR3ZsUWVpTy8r?=
 =?utf-8?B?MTNzTG9wb3oxUmxkUmxpUHFzdnNyWmpLd0hqTjZMWFRob2cxL0V6bUNKdkFt?=
 =?utf-8?B?Mk9CRnNIYkpSRlhSSnNBWjdwYUhqTVZJb0xIK0hrZXZTYS9YRHRwL0kyM0pB?=
 =?utf-8?B?UThyRHE5Q1loSXdyeGpjSUNGOWpudDFUcmpMOWFxQkkzVGNyWnhveHBiRFhU?=
 =?utf-8?B?TlVxSWNVU2FJdEhtZER3NXdNTzFXQVhTYThRWjhxL1JUeWtRWmRESUpLZ29p?=
 =?utf-8?B?U1FGc09tTUNaVHFzWmNxVkcxM24xNjlXMmxmaFYvNmFlZjg3TTR6WkRob0RQ?=
 =?utf-8?B?MU9xVFU4eXFCdWRzMUZWdlJzWWVNVnlaam9nSWRsdmMxRmE0RDVlUmo2TmFv?=
 =?utf-8?B?ZUxLc1BiR1d2UmlhamhNN0pjRWtDSFlQemdsbnBWVXVpRUR2aCt2TGdieCta?=
 =?utf-8?B?SDlScU9EOXorN0hySW1DWFEzazFGVXhaek00WklNVndCTXN5YlY2bXNFTmNR?=
 =?utf-8?B?RlhZbXBhMmhCbnZnZjJzSE9Wb05vK2RJWEJhem9YU3Jodlo2WnlvWkFyOGR4?=
 =?utf-8?Q?6BuBdf1ePC3SOYRhh8+WkvlQFXbDch+0H2qAU?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a8c4be8-9468-47b8-a4ba-08df3984d527
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8179.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2026 08:31:18.6455
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tQz07t45dlNRM+UFbvnNi+vPYrJgqsE26dnWVsARoOPw9qmvbyBtjtWJl8XDMWW1d1XZjSTZGKTkRjsSzUHNu6bB7FT+d4bePm9mu1q1dGR0fZVPUYbxLIiExcRVv9a7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMDPR04MB733680

On 11/2/2026 4:55 PM, Krzysztof Kozlowski wrote:
> On 02/11/2026 15:49, Khristine Andreea Barbulescu wrote:
>> On 11/2/2026 4:24 PM, Greg Kroah-Hartman wrote:
>>> On Mon, Nov 02, 2026 at 03:16:35PM +0100, Khristine Andreea Barbulescu wrote:
>>>> Enable the NXP S32G2 pin controller driver in the arm64 defconfig so it
>>>> no longer requires a manual "make menuconfig" step. The symbol selects
>>>> PINCTRL_S32CC, pulling in the common S32 pin controller support used
>>>> across the S32G family.
> 
> Well, my standard request - why would we want it? You need to list the
> upstream board(s) needing it. We do not develop defconfig for downstream.
> 
> 

Hello Krzysztof,

The upstream boards needing it are the S32G2-based S32G274A-EVB and
S32G274A-RDB2 and the S32G3-based S32G399A-RDB3. All of them rely on
the SIUL2 pin controller, so a defconfig kernel needs it enabled to boot
to rootfs on these boards.

> Also, odd CC-list, really random.
> 
> Please use scripts/get_maintainers.pl to get a list of necessary people
> and lists to CC (and consider --no-git-fallback argument, so you will
> not CC people just because they made one commit years ago). It might
> happen, that command when run on an older kernel, gives you outdated
> entries. Therefore please be sure you base your patches on recent Linux
> kernel.
> 
> Tools like b4 or scripts/get_maintainer.pl provide you proper list of
> people, so fix your workflow. Tools might also fail if you work on some
> ancient tree (don't, instead use mainline) or work on fork of kernel
> (don't, instead use mainline). Just use b4 and everything should be
> fine, although remember about `b4 prep --auto-to-cc` if you added new
> patches to the patchset.
> 

You're right, generated the list on an outdated tree. Thank you for
the explanations. I'll use latest b4 / get_maintainer.pl for the next
version.

>>>>
>>>> Signed-off-by: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
>>>> ---
>>>>  arch/arm64/configs/defconfig | 1 +
>>>>  1 file changed, 1 insertion(+)
>>>>
>>>> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
>>>> index 7b4985b29b21..545a2b7db8a5 100644
>>>> --- a/arch/arm64/configs/defconfig
>>>> +++ b/arch/arm64/configs/defconfig
>>>> @@ -704,6 +704,7 @@ CONFIG_PINCTRL_BCM2712=y
>>>>  CONFIG_PINCTRL_SKY1=y
>>>>  CONFIG_PINCTRL_IMX_SCMI=y
>>>>  CONFIG_PINCTRL_IMX91=y
>>>> +CONFIG_PINCTRL_S32G2=y
>>>
>>> Why?  Shouldn't the normal platform-specific defconfig work for this
>>> instead?  what defines the arm64 defconfig to require this now for all
>>> arm74 platforms?
>>>
>>> thanks,
>>>
>>> greg k-h
>>
>> Hello Greg,
>>
>> ARCH_S32 is already enabled in the arm64 defconfig, but the supported
>> S32G boards also depend on this pin controller for their pin muxing.
>> Without it, some peripherals never finish probing, so a defconfig kernel
>> cannot boot to rootfs on these boards.
> 
> Greg has valid point, you did not really address it. Explain why it
> should be user-selectable choice in the first place.
> 
> 
> Best regards,
> Krzysztof

Agree, since the driver is required by all S32G boards, it shouldn't need
to be selected manually. In v2 I'll make PINCTRL_S32G2 default to ARCH_S32
in Kconfig, instead of adding it to the defconfig, and also list the upstream
boards needing it in the commit message.

Best regards,
Khristine

