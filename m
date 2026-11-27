Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.74.39
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795788215;
	b=ae+lqoCQ5ocx0Qf5AHtpJmon+Abe5LOu0JBqYbf5eO6sN9firXCMpIM9TLMX+S2wdMto
	 NVpm+0a0Q7z27teb3sk4hAfMY7pp4BlJ1F5NZ65slb4pemSqWHVgRujb/s4BW6wCXmn9W
	 vzE0+7j+ENdy96COpsLv9EnKCXKKztjdQjZoPt0o+uz/hMSjc6notxX/nvvjrr+/lxmw2
	 rzl6LQowSgUYwSSntTodH9N44350o1bz9bXqtkdM+TnJUH7hjFEYsvqkBFXwbPcy1DQ0N
	 cRoScx/VFM58uJTIO1CGPSpcTbMGf2MobtsXP9WqD5w3x/xZpwlmzpKFBgPlmaLXM+g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795788215;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-LD-Processed:
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
	bh=zw3BDxoUMUSM4pfTd8rHkBLWzaP8G9KucdYmFlLZ+Ek=;
	b=rPOqzIFPNddZQzYMz0F3CbamXAgZfpgcO0XOrRgnzOmVKFCWqYuo89GbU5WOTMuK2mJ5
	 kprqGma5lD6hhzBvFUbjOJY8CYjMKHRLjuTfBa8RXgKgmX1PjvVVYhg1Znh4JJHbHdw3p
	 5hA7kTvNC8yZsOwIbqt6IA60TJOhpuXCYyde/svvvDUoJC+yAsi/VplCpgPVIl7gjfygD
	 0jcaJ4oU2jqY1/jSVoIsKF6Q9SjLkJBoAS7QFbpt88n+ysTYtC6srjZB1rKPUzb4xPqej
	 0m39fKnCy3nUlw2o+X9hOqEz5V3N5yZ09XVUrTgdSnVGkS+GZCOTdMTlc8VbeAeHLwg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=renesas.com;
	spf=pass smtp.mailfrom=renesas.com;
	dkim=pass header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=SJk80CWj;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.74.39
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011039.outbound.protection.outlook.com [40.107.74.39])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6563606A31C;
	Fri, 27 Nov 2026 14:03:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6563606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=SJk80CWj
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZXDzPELxi84KZfyXwXxq34wshgyxdQle7fZlC9QwMeeGBazQyh/alb3rtS56uFTQHjpTxmcP2Voe0KangfoF09XQNpVzjZeZ8w0XuzeMknaMcwJc5PvVaJh49eQU3EUM42JVYqWgDt4NUdaKWR0RHkQDnPT1BDSfGimaB7+gnwHmLYicJw7Ps/aJMuM5mGLf+ijEjXRbBQCktm7IjnA9LtG6eX5qBmPCZ2i6SRNvi48YHQI6sQ1agqEAaLRgyVettN9uyV/Jlu8MVxdS/iTUpXYr7GjjQ1XUXA958Pz/2pNdKSQj8ZkVQc6++r3OkkPfDh6+JGRew11VwxPp6C/YbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zw3BDxoUMUSM4pfTd8rHkBLWzaP8G9KucdYmFlLZ+Ek=;
 b=FMzNBfcKQ7oNj70c+l1Yq4vEoSWrxayf9M5vbqhJvL3Cxxr+wZnEZN28nalIqyN02+oSBuiIq+/dcV/Qv+GIXcHdXJHUrggfqCfdEhQJQ/jpd7DXA1U3hPmE0rMJWGptxNkNe5wsFEQGfVYbYNiK8iDhifvPrOn2dSQzsjQgQHnCZIBJYnSu2Kiuwndn0uGT6IFkc2+Kj+rK1Xwtc8jB5PQkS5kK/Hx8pgLWEFmZrjyU4z9ty/gItLw5LzKVJZMdmKspwtewb5rY6tKQ39s3U0wD/IJSItwRcuiuvhid9pVT1C5xjaEURmK8AkdHVPsS2/rb0ZLVK0rLg0w9iuj2xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zw3BDxoUMUSM4pfTd8rHkBLWzaP8G9KucdYmFlLZ+Ek=;
 b=SJk80CWjzYqNfCzIYXI6n0qL8F9XIDSUZTTDxPNzLoCggysrLHm5kKeqJujZT93k6+2fzDsP64tY+NBaNIVyJ0JzHNnBxIC6EiojWYY7gLFafXCEuAOStosWkIamw3nRz/wMpLW9fWmLiVja/lTyjB3MU2E3jUIHQT9TsPH5oGs=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB15118.jpnprd01.prod.outlook.com
 (2603:1096:405:1a1::11) by TYYPR01MB16055.jpnprd01.prod.outlook.com
 (2603:1096:405:2e0::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.4; Fri, 27 Nov
 2026 14:03:31 +0000
Received: from TYYPR01MB15118.jpnprd01.prod.outlook.com
 ([fe80::1116:d56:8164:63b4]) by TYYPR01MB15118.jpnprd01.prod.outlook.com
 ([fe80::1116:d56:8164:63b4%6]) with mapi id 15.21.0662.007; Fri, 27 Nov 2026
 14:03:31 +0000
Message-ID: <5689301f-f7b0-43ce-9555-22faa7af965d@renesas.com>
Date: Fri, 27 Nov 2026 15:03:18 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/7] pinctrl: renesas: rzg2l: Split SoC-specific masks
 in struct rzg2l_register_masks
To: claudiu beznea <claudiu.beznea@tuxon.dev>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Stephen Boyd <sboyd@kernel.org>,
 Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>, Linus Walleij <linusw@kernel.org>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org
References: <20261026-divo-ssgrlpcsrc-2966-i3c-v2-0-2e76b87209bb@renesas.com>
 <20261026-divo-ssgrlpcsrc-2966-i3c-v2-5-2e76b87209bb@renesas.com>
 <121cc552-86b6-40de-ba9d-0ae40f8a1ed2@tuxon.dev>
Content-Language: en-US
From: Diogo Ivo <diogo.ivo.sx@renesas.com>
In-Reply-To: <121cc552-86b6-40de-ba9d-0ae40f8a1ed2@tuxon.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0137.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b8::17) To TYYPR01MB15118.jpnprd01.prod.outlook.com
 (2603:1096:405:1a1::11)
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
X-MS-TrafficTypeDiagnostic: TYYPR01MB15118:EE_|TYYPR01MB16055:EE_
X-MS-Office365-Filtering-Correlation-Id: c5ca39c4-92ef-429a-5d42-08df4c8f37b7
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|7416014|921020|261022105027099003|10067099003|56012099006|261026140227099003|261021123027099003|261021121427099003|261028144727099003|261102123227099003|261009223027099003|22082099003|18002099003|11063799006|4143699003|3023799007;
X-Microsoft-Antispam-Message-Info:
	LTITDroOsYtdAb6wcjDELNEinz8oPVGGIG1jmW5V4muWHQUzL8U+UdYKlXeev2QcRwfcISRZAYHqFufuRndMOyKgXVWPUjCYaM5RffNmvi+3dTKLyUtU0mXrfVqI23QZfpLJM3ffMdokDNjO2TDoYaW6bZDKNSXZW2ZqJaRYnfJ4Nt60/DVIUWtXBgxLXp77jo4IPSHRV6VVDI9Cf00nzcwoJ9aC2A2WFXD8jv4TeM+n8oNqbd1nNm+Nur4/ERw5GXbo1Sk20M3d/B8Dkf9+fMTrfgB/7MLkaF1e60c3b/5wmP977dgD+lJVf1rpsXj5Avl5cILtKn/VJebRCzQiNJsUf4rgg5um6HkBDTElAML3iiwntnvuTnA9Tp6JmRYp5cdmY20dylBKmN4V7b6522SA0nTH/HyZ37tXAeArN4azItUA09Eg1PBQDZdM6Ip0Bt19yzZpbsDrXgf8gZSLuM5tR/Cm+sMkfDJtZES/sYL4oEf/9XP1tcWu5X3XSLMebL9aHXYIJaiDQ6MXrFkOi7Vbkp3YEuAgmdTb0WyWK7HHdUlAURvitW5qBt7Y2MBU/M7xPJFMZXakr1+fMtMWZ24Vo63gurckFZDFA1Py2xQBmA8EqMat5RqutOAVxOjU+h5+D3Kx06wKt63rMGHs7RkrreG1NU4sBRhw+n5RcDUhqxqPpmVOIFUCZ5WhK8Gpho3yMlQgvWO8IY4Q2IVM5A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB15118.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(7416014)(921020)(261022105027099003)(10067099003)(56012099006)(261026140227099003)(261021123027099003)(261021121427099003)(261028144727099003)(261102123227099003)(261009223027099003)(22082099003)(18002099003)(11063799006)(4143699003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UjFwUlB1MlJGUXFudFJ6UjQ2emxJc0ZaUGtweXBMK1N5bS9oMjdObzdnYkxw?=
 =?utf-8?B?clRpMWV6TWYycnZaSFpBNlo5NnJlVEtISE9ZNFRUckIwK0hpRGtZK1ZmUy9F?=
 =?utf-8?B?TEhzcDNjdS9OemxpY1hFWEsxWk4xMFVtRW9SMk5nV0hrNnpqVG12ZWh4T2t5?=
 =?utf-8?B?Z1Q0VjRWRndzOXJaUjA5U0JPdUU4QTBwanl1OW9PTzVVTjVBOHk0NUt3REo4?=
 =?utf-8?B?RG40UTh6QlZONENyd0V0SUcvNitoYnp2QmtweTZrSFRPcUlrUnNQd0xDaGFN?=
 =?utf-8?B?Z21kb0l1YWJxR0tycVZLVjJZT0lrTVgyQVEyN29Sakx4QkJ0dHNPaU5hdjNj?=
 =?utf-8?B?NjNjS3ZudnFvblhQNFAxSGZmWnZ0ekVQYkJlajdGQnEvR0FNcTZCd0RVVUJk?=
 =?utf-8?B?U3lMNk5kWklaUVAzdXFkT2xpRFR0MlBjZVZpdS9SVXp0Mnk5QW5zL1FUTjJO?=
 =?utf-8?B?cUh3eG1SbVNUcktFWXRkOHhFMXBrNjBvb3BVTWFpKzVtYUNKazdobTd1bXB2?=
 =?utf-8?B?QXNtenJZWlZtWUNVOHJrQlZKN0J1Um5zV2tkNEdxVmlub3hDeFJreFJpUHZQ?=
 =?utf-8?B?a0wxWFFnbXN6RWozWnhVS0pTVUNHQXROTnM2RjJOYkNHcE9XRTkvSzJDRmU1?=
 =?utf-8?B?bE9rTGNPOU5OWm1NR004M0hwQ0pHOFZIREs3aVdNL1R2Qk9QOHgvdytVN0hP?=
 =?utf-8?B?SzJhdDBFbE93dlBLLzAzbzhrRkhqUUViMkhRK1k2clNlckpyZFg2WUh6aDgw?=
 =?utf-8?B?WHl6b2QrR2d3bmhXS3ZoZ2xPd2RQbVE0dWhiZnBmUHJ1WDVPU0JBVHFuNlI2?=
 =?utf-8?B?K0p1clQ5NVlxcUp5S0p6SW5jWEJpbU13L0VodlgrUEhobFQ0ZHpHaDZkb1Ax?=
 =?utf-8?B?NlZqZEZYVXpvcDBKUEdiUGpvSEZSWUxaOU83d01nOFpTbXdmYUNlRGc3OXQv?=
 =?utf-8?B?RXh1aVhjNzlBWmVYNE5pOXNaazRJcWZ1TXdodTJuTnpSVTdjaFUrd0lxd3Y5?=
 =?utf-8?B?Q0VtSzBNZG5GREpEc0tGRG5pa05tUWQ4bXBBeHFDc3MyM1lBSXluazg3YVd5?=
 =?utf-8?B?WXdROEJRYmJjLzlwUFBvbFRLdWx4UEw3bTdFRmtWSVA1bk51eXJKNytqSUZl?=
 =?utf-8?B?N2Jlc2l2MlZFVy8rR0c3MnNFREN2dWJZSzZ2SmlsWDNweStEZDZITTA2MCti?=
 =?utf-8?B?eGN1WmliQ0hoQVRIcnR5ejFVOHQ1Q0NPZCttNktBOCtBTTlVdlhKQ0FTMmFl?=
 =?utf-8?B?VzVsaVYzVzZHNnRWVjhleUtKK3VJYWROVmJmTDBETVpDdU9FREg1bU1Vakh3?=
 =?utf-8?B?UEE0VXJMWnpodEp0YW5rUTJhaCtmK0txc3VDMkFBOUY1Vkt5cDE4Q3ZobVhW?=
 =?utf-8?B?NWhuQTQyNWpGVWVMZStLNFBQbDhMMTZCUDFoUnc3OElzMktFMHliQ21vMnFD?=
 =?utf-8?B?YmdmTTFBd05YZnRQZUFkblNLSjdrT0hqZlh6YW56Z1V5V0lFS2pLbUY3ZTRj?=
 =?utf-8?B?TkFjUCt1YmVaWWFFdjdENkNLN0R0VHkrczA2UjFzTi8zR0tBMmdocEVRUVlT?=
 =?utf-8?B?MVdXM3gxTGwzV1pxV21oNFlIa2hMMHZOaE9XYlR6Mk52cGprVXgxb0QreW84?=
 =?utf-8?B?V2lOWEVGUGxtY1lTNFVmWithR2J6NE4yY1RPMUpXSkUxL0hUNVZJK09YNExw?=
 =?utf-8?B?bXdrLzhzWEtXQ3dKcTFkMWJSOU9IdVEzWm9USXhSbkNIMXJWck80MVFORzg0?=
 =?utf-8?B?bnR2RGtVanBKVnJWTjgzT2F6QU93bHkzSWlkaDNlUFRobnh1Z2VNVzBVR1Rl?=
 =?utf-8?B?dGdxREloQmZBVSs1VUVlZGNOZCtYY3pzK2hLbVl4TURhdXFDczJiNUZXK2Nm?=
 =?utf-8?B?MERBaE5SN2trTS9jUDBoampMd1hZNmt4MkFCOEx3eWNYN1FvTTNHZXZoZ04z?=
 =?utf-8?B?YlRUVlNPcnlVOGczcWZ4SThFOGdtNHlTTTZtak5TSVlLeHJCTFdkZVNRcWNM?=
 =?utf-8?B?ZFJQNXVCU3dISE5MZkVlL1E5ZlhBTElSaGdLNHE4Sm9vMkJnTnE4dUp2bjBE?=
 =?utf-8?B?NjVBR29rckNBMmFJaVFwaUlPYkx5alpVWUxDZWpocHpHak45SEs2R0RhZ2dR?=
 =?utf-8?B?dG0xQmRLMEFrdmJUMzlQV29JL1EzZDUydy94UHNtQmo3Z1QrL3drS0puY2c3?=
 =?utf-8?B?eHQvcnN0SHdaTDhIWHFGS2ZacEdab0FGR0pmeW5LcEdvMkV2VU9STUltMGpZ?=
 =?utf-8?B?TjhiczUxeCtNcUdQNTRGcU5wQng1Znh0UUVnTWpwTFhVcGhUelFjQ2JRWlAy?=
 =?utf-8?B?cGlORW92WTZEMG92RTc4Qk1jd3JjUzZueHFBbzAvZWlIWW1MaHMvZz09?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5ca39c4-92ef-429a-5d42-08df4c8f37b7
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB15118.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2026 14:03:31.2062
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vn4fSjUB66P2wYqn85XL2U43uqcpAZr+V4fNWIpc9sRlGJ4UdEHaYlDpwOFMd+L3IY5Dmr1c5De2UVLP6MJfZ0Myzbgfsjgak0dvRT2G1uU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB16055

Hi Claudiu,

On 11/27/2026 10:16 AM, claudiu beznea wrote:
> Hi, Diogo,
> 
> On 10/26/26 13:35, Diogo Ivo wrote:
>> struct rzg2l_register_masks declares the masks of the OTHER_POC register
>> of RZ/G3L and of the I3C_SET_POC register of RZ/G3S in two branches of an
>> anonymous union. As both branches share the same storage, initializing 
>> both
>> other_poc_pvdd1833_oth_awo_poc and i3c_set_poc on RZ/G3L would have the
>> designated initializers override each other, ending up with the 
>> I3C_SET_POC
>> value in the PVDD1833_OTH_AWO_POC mask.
>>
>> Split the union into a common area, for masks shared by multiple SoCs, 
>> and
>> per-SoC areas: the RZ/G3S and RZ/G3L I3C_SET_POC mask moves to the common
>> area, and the RZ/G3L OTHER_POC masks stay in a dedicated RZ/G3L area. 
>> This
>> way every mask gets its own member,
> 
>  > and new SoCs can be described by> adding their own struct
>> (possibly inside a union).
> 
> That may be missed by the next person adding it...

Ack, that is a good point. I will add it to v2 if Geert is ok with this 
approach.

>>
>> The existing RZ/G3S data only initializes i3c_set_poc, so it is not
>> affected by this change.
>>
>> Signed-off-by: Diogo Ivo <diogo.ivo.sx@renesas.com>
>> ---
>> Changes in v2:
>>   - No changes
>> ---
>>   drivers/pinctrl/renesas/pinctrl-rzg2l.c | 20 ++++++++------------
>>   1 file changed, 8 insertions(+), 12 deletions(-)
>>
>> diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/ 
>> pinctrl/renesas/pinctrl-rzg2l.c
>> index 9bf3743dc1ce..f73d273df362 100644
>> --- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
>> +++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
>> @@ -278,18 +278,14 @@ struct rzg2l_register_offsets {
>>    * @i3c_set_poc: I3C_SET_POC mask
>>    */
>>   struct rzg2l_register_masks {
>> -    union {
>> -        /* RZ/G3L masks */
>> -        struct {
>> -            u8 other_poc_pvdd1833_oth_awo_poc;
>> -            u8 other_poc_pvdd1833_oth_iso_poc;
>> -            u8 other_poc_wdtovf_n_poc;
>> -        };
>> -
>> -        /* RZ/G3S masks */
>> -        struct {
>> -            u8 i3c_set_poc;
>> -        };
>> +    /* Masks common to multiple SoCs */
>> +    u8 i3c_set_poc; /* RZ/G3S, RZ/G3L */
> 
> I would drop the names of the SoCs close to the i3c_set_poc. That have 
> the opportunity to grow over time. As Geert considers better.

Ok, I will wait for feedback here then but I am ok with dropping the SoC 
names.

>> +
>> +    /* RZ/G3L masks */
>> +    struct {
>> +        u8 other_poc_pvdd1833_oth_awo_poc;
>> +        u8 other_poc_pvdd1833_oth_iso_poc;
>> +        u8 other_poc_wdtovf_n_poc;
>>       };
> 
> OK, we can drop the union but the next SoC addition may be:
> 
> /* New SoC masks */
> struct {
>      u8 x;
>      u8 y;
> };
> 
> If we want to keep the initial form we may need to pay attention.
> 
> Patch is OK for me, just with the mention that we need to pay attention 
> if we want to keep, for the future, the approach before this patch.

Ok, then if Geert is ok with removing the union for now and possibly 
reviving it later I will state this clearly in the commit message.

> 
> Thank you,
> Claudiu

