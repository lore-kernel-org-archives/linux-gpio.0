Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.159.71
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793851055;
	b=gPrt8JUC/w11/Jt/lAkQPcFnNzUpgbcnAwfpWaescPHq4YYwI50SiRWvIhGBELxbiQxY
	 UsgvvL6DX7gGOXtuykfWNUb+aQFRb/zaRU0ku7SgysdH4gC925G4XseOiwghsLV5VIl7k
	 P7Jdj4lpqaUwd3sovtFdRdBz/7iXJ/YckFOiGza8CGRT1U+Yyhhr4gQFOf5SL0yMAepvb
	 j9tLlgfzF0YlNmxmj0Dznsy6oh4tivkY4s2OhwPiAQfoqsKSL+0QNYAJDyW9DHwpf7UVT
	 Qvts1suhV8yQjHAbgWGgo1cyt+N70415kXpVIC+8KN+4e6FUPklA5ki1K8gNNdhDd8g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793851055;
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
	bh=Iunu7JaNfQCSocG7f7rUDVKaJXfUXIxXC2YDktrwME4=;
	b=CTLZWXf8a/ixTdVkwozAtXpPcuXnGwiz17rOBmI01dvDD3c9i/LBKFR/s3YIcFb5goy1
	 Wk2Df7TBbMzHPU+h07pHyz19hynoVAufKmM3XjKAQu9akpDBrYitApOwzES71nM6IJkEP
	 x2v8pbd/F5WS88E2imUOrym/tkoiW0LLeMchh6IYc7SzbKPvwiLerfSV3oEE7rvg1WGA1
	 cuQD9IyoMzKVQlOlQ4rmWCt5RQosSt2UKZ0koxeUAEfM08mDh6i3yBjVsoEs6ZnRiF1tT
	 KbBdostbY3YtJSn8lDGDf1yLlLv9CleO/eheboeeti/7mkBK/8pV6JVse8Ipdd7OIYg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=N5K0tcJJ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.159.71
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013071.outbound.protection.outlook.com [40.107.159.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A22D606D801;
	Thu,  5 Nov 2026 03:57:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0A22D606D801
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=N5K0tcJJ
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CpxQyoP2fGEvWamCDpN1I3Quow/XgMyOq6xmmoxH5K7h/zlaCE6qaS5YQPftXzuJkyy33kvvhNIVDhwqRiPrnO2vPGTevlO4x+Srb/EXk4W//BRo+uone5BbDl0c0zt7JtFcmlT2FHqbU04vIGCrQ9cI8eMqtaqvqK7HjtWPuLddamRfNk+f1WHgtfGELvXiPnHZqyYoV8OChzG1dIl7dR3ERna75hVFN7y6HJlrGu0LDaYmaL5lOeUuDbQmC9qi7HywjBZRg0pMlZgOlJin1aoRLnf70VepcE+9VIImUxrqjzFFneLIioO5E4P+YLGZ9iMz93ahTy76D14713sGiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Iunu7JaNfQCSocG7f7rUDVKaJXfUXIxXC2YDktrwME4=;
 b=aUsr8ajhOfzDmaN6L8JKPMco8xYFZFEkO6cvImPtsVLwc3fjYaooh9qP1U2UB+6zZMATAoqdCwu8j0g/zJUlcTPzQgar/Hwizfh/x/nMWvEwbZdVkxw/uQPssddjJ2NZX32TgB3JfIgCZnD4qQjBRGeBlFsE0J4T5Yc2EDlwknmSkvb7BwVDIuhoRUq8hpzYQop1tim8wFt2cBIbFEAVojfO5jkD+xBy4sgKoZaq8tpYrvsxH0Iz/rgnrqX4JAom+BmyXJEQKJNUXlaoguNCnmrPFbDDgtkMfpcoxmqGgTLAMhcOPtDWkuTTO1HiF9LHAhGMNInNuM309cPxnEzzhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Iunu7JaNfQCSocG7f7rUDVKaJXfUXIxXC2YDktrwME4=;
 b=N5K0tcJJdgFs8zXxjheZRW4zhH3x6Nus18tZqFFZuoiqszA4EzGqW/yaDk5Nk9wr+WQpgK+DcdwAD5xXuPEPWGLeWzBV6V3UBZfi7463waVQVJf6mTp7gn83+1KkuC4oD88GPttqO2uwLnEXpbNeJxo3f6g++0H/cXD9+rhvWp2bIw7M12DDr71rGKdw/8T6Ms8L7GVAdx45/HYbzDGTxKIFEzkHzh3grLx/95RR2BjzCBJ1FAkZfja3aOmKYDxlfP08C2aADl9/oko1zXaClkDc1vzSUXcm8lsTLMfdvi0cx+C2eB4JOKecPtMpgyXsXvnBlVxDuTMLTXKVARym5g==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by DB8PR04MB6922.eurprd04.prod.outlook.com (2603:10a6:10:11f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.9; Thu, 5 Nov 2026
 03:57:32 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0592.009; Thu, 5 Nov 2026
 03:57:32 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Thu, 05 Nov 2026 11:53:09 +0800
Subject: [PATCH v3 11/11] arm64: dts: imx94: add clocks for gpio controller
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-gpio-vf610-fixes-v3-11-504e19de5ad5@nxp.com>
References: <20261105-gpio-vf610-fixes-v3-0-504e19de5ad5@nxp.com>
In-Reply-To: <20261105-gpio-vf610-fixes-v3-0-504e19de5ad5@nxp.com>
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
X-Mailer: b4 0.16.0
X-ClientProxiedBy: SI2PR01CA0038.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::20) To AM8PR04MB7874.eurprd04.prod.outlook.com
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
X-MS-Office365-Filtering-Correlation-Id: 8b7ee535-4096-4d7d-e79d-08df3af0eb2b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|23010399003|376014|1800799024|366016|19092799006|921020|11063799006|56012099006|261021121427099003|261009223027099003|261102123227099003|18002099003|22082099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	zZ7zly7YnR7QBxqAfM5R16MEfZngJFww8JPs6TDzpAwABxMFhIrgvYV3xhb806Wo94Ba1hyImqrjCcO/kECuzzx1tXxx0ITmJ4n6i674M5houpA/DMQ6xFpsEVeNDw/8DarH2MyLtd+1WuyYsDMmX/wFheQDBqwqYleihiBQ2FOs2/ZSkrjXlVoRjjTn+rn+PzvmYxRKEnwVE7s+4bvo1lw0hQ4sJPYNYLO65dYwk3K+qvTNmRjUiA1CsLqGKoR6Rp/iS0rUNMyAfeDzwmDHECnRusWT44mmhOHh2wYRHmq4o0/f9GmfM2urVIaTG44hlyp1VWzSYs81vdBI7rsO8aoRZxzGODIHwgsHc7wWpMbFU7ojyJDFWPSU1MhhuwE+iP3wLPcVxTLCjh1AJjeTS1awcXbRGinq9NgizBTo1HIfpIh0HfzWBu+STu0ukfTn6HAS5Q2rL+MH2+kBnnNL0lNoqDzGUo1PI6jk87IktgAiR8QAGcI9k9/r1TG0+hIjh+SMT6pNiZHs2Dd5+GVAN8eiHZ5T7NvbX6C9kozkofsHqtSBwF2QkRlXrmHeypX3p2sld4xw7cEQS2wlcvt0m7Is5Yl83ivkO3zIohydpu87BRKYOS1HPVIXaJ49qKCL9OT7URguWzv8jZUeCWJdDjQqjNFU7MD0OYDvPCzNWU0QnLek1ZgnObolwcf4cGbd13U8AiNfrfiAbQ3NxOMCjQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(23010399003)(376014)(1800799024)(366016)(19092799006)(921020)(11063799006)(56012099006)(261021121427099003)(261009223027099003)(261102123227099003)(18002099003)(22082099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NklBRjc5WUlPOVVmR1FmY0lxSjlLeWNFeTNDTFJ2SytWSC9udC9FTDVHTXE5?=
 =?utf-8?B?ajY4WFJrQ21xQUZFeWIzSzMwV0JzakcwZzBhUUFBaVhYWnJ2SnZkcnBzZEZ0?=
 =?utf-8?B?bXpCbXBLNXB2Y29lT3B5anpwTyt6VUVCaEd4aTNyazJ2QjJDRW5Ed0J6Z0V6?=
 =?utf-8?B?VGI4K0tBR3NhV0RqWWVORnhhLysyemxWNno4NFpseFhVQlFKMU1RcTdQOHFt?=
 =?utf-8?B?YkM2bTRyNVpkMDZiZjBqTmJobXVNd2FaM1BIbU5ibU9FeGNVcjlrb3lkUHpy?=
 =?utf-8?B?V01MeGJ1THh0NDBqZUg5VTd4ZTlEOFdWU0hYVVg3MVk0VnZvUEZFL21naHF2?=
 =?utf-8?B?c2lTWkQ0UlZ3c1VnZ09ZUkR0ekxVYnYrVHZWUUdxVUJuRWRxT1hIWVlqUHJ4?=
 =?utf-8?B?VFNoMnFSYStjdE95UnYyUFVuaUZlMTJ2WlhGeGF0TW5OM09neXRaQjJQNU9T?=
 =?utf-8?B?OG1YRStGbFp3Zk40VE5tdGQvdG1ZTFUzaDU5UXY1MTlBY1dCbkpDeFBwYm1G?=
 =?utf-8?B?UW5hNTA1ZkN3STU2d1E0MzhqNmEzRkJrcFdwWVhrUGR2UVg5b1lGNnlsMGpo?=
 =?utf-8?B?bTRYT0RuRGdSSjF4czdUTWtIUFIydzhsNEQ1VW5BcDNhOFp0THNJV2s3d3dG?=
 =?utf-8?B?TEZxWGRCaUcwblF6MHJMa1ZrK2taelZnVmd0bkJKVmQvdG1NdWRNUWUyMWZM?=
 =?utf-8?B?Vk5sZGtWVTFQeG9kUDcwNnBWeERsZW5sLzNTL1hhajU0UTFuMUhiMzdnRktX?=
 =?utf-8?B?c2RnSHI5M2VhRlZ4T2krZkppUHhUcEltRURTYklNY3A0a1dvOHNCZjREalRt?=
 =?utf-8?B?aGN2TjRzOXRiYVN1V2tSRVhRa2VrSWpzK2ZnZnBPVGRIS2xLUWxmSW1GTHJ1?=
 =?utf-8?B?Wjh0TnRQWFhDTUJtSEhtS1psZnFvZ2x1OG96N0lVa1BLT0lTVEJHQzk4WmFr?=
 =?utf-8?B?MXdUV0xzMlNiaVdKajd6aytjRlk4Z0t4aFI0cCtnZVpoZFVCcVlNRlFnOXBK?=
 =?utf-8?B?Q0ozQ0hRUnAyZ1ZRZHVhby9QYk5kZEdOdGtKa2R0SUZpdWNocGFiSG5keUxI?=
 =?utf-8?B?Mjc5RVkrZUEyQytkN0ZRVXNHQTljYnptSVZ5NXNtaGlzNS9YNVBQR1IvbXl6?=
 =?utf-8?B?MGl4bys4WitzMGJ0b0U5M2hsN0FsTHc2cUtzRnk0WjJmNVIrMVE1dVV0WC91?=
 =?utf-8?B?YlZwNHAza0dNL2NqcVlqeEdMOWRCeHFRVnNYbmJKV0c4OXdlSld5d2pBVFFJ?=
 =?utf-8?B?NmhoSDdlQlByTDNNdnlxZmlTSEdXV3RwQkFPQU9sTlFhemtOQ3VRZW9JaXlG?=
 =?utf-8?B?d0JNNVJvTk5NM0ppQ2tXVGZGR2Jlak5LRjlWVkVLNDIxbFFZMXNpY2I0ZmtU?=
 =?utf-8?B?VlJNdndrUUFRdHdENzlGVndFOWtQQlpEY254RUdHRzhyeTZrQzhqQ1BPdHow?=
 =?utf-8?B?dzNYdVRRaEpTY3F6U1VVS1RubkFndjhHVnk4QkoxNitXNGFwcmJCUlRSQURp?=
 =?utf-8?B?R20rZnBuSjFRRGV5QXMyTXRuR0NaaXRpSUx2K2VUa0N6WnhwUHd3WVZKeWVS?=
 =?utf-8?B?ZlA0UHpWcFUvY3dLdTF2bzM2ZmhEdEh6UWJ3MHgwWU9vVEhaamM1aDluY3Mv?=
 =?utf-8?B?cFVxWXNFdEJpWWJuemNXTkNTKzU4N3NEajBQeVJhbmN6Y2R0MERtWGpkK0Mx?=
 =?utf-8?B?WHBzZnRMTGRxWnp0L1FyK3ZSZmhiQ2VEVHlmZXJ5Y2FPZjA1T3pSUXEvVGZ5?=
 =?utf-8?B?SmtvMzZzRnBqa1dzOUlRYVNaOWhaR1NWSEd2TWF2emxhSzdCelBlSUZkWDFo?=
 =?utf-8?B?cEJRdFZLYnZIZ0RNemFjNlp6SEcxK0ZkQm1wS1B6WnM3NW5BNFRWUWhJQkhw?=
 =?utf-8?B?R0YyVXhPeTVWU3drZWRnYTc5VDFCTnJTUnVGa3JkQ09BNXEyTHVqWVVadXNn?=
 =?utf-8?B?eWxpQ0VtekdUSURrTGYwekNvVyttOW82R01VTWhZamdQK2g5WXdxc0U3Kzht?=
 =?utf-8?B?YWgzaWFyZElNOVBjU09weUR4SzVjbXFxYzFQYjdZT2o1YUd6VUQ4T0VvZUpQ?=
 =?utf-8?B?dndiK284eWk0b0UxamFLMksxL0kzZTkvTVRzdm8xTEIxa2p6QkRBbWRUWU0v?=
 =?utf-8?B?UnFraGh0VkpZSUV0bWZxNTdZSlNSY0ZqNkpzRWF3Q2V1ZzZYSWE2d2NwejZC?=
 =?utf-8?B?UFRxY2hRc0dSZXlmc2FtTmdBWCs2ZHBEZ1RvVGFxV2c5RFl0Y3QybktvMktS?=
 =?utf-8?B?dERjYjQzb0t6bTdIS2JrN2JtdGtmYnNGUUxwWG04Y1FQRTN3S05tQlNqOWRD?=
 =?utf-8?B?MHBHdW1XOVlkdGtvU0I3NnJXODdhZmduQktCYjNZZTd0b2ZsVDdOWWQ0SnBv?=
 =?utf-8?Q?++i1cQvP76wRSljp/oCcYnNtSR5A6MBc7Il2A?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b7ee535-4096-4d7d-e79d-08df3af0eb2b
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 03:57:32.3041
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U8n/Ac8l5kwzDcE1rAkV36Ho/xZxVxrJotTUJDbuuxXFH3xzcfVE2syMdAOyrZ4diVgEgQrj8tf8pmBCHUsFrqOrHquNf1EKrNiwP0+G6xMU7AhkYcMZ3fShs8VPDgbJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6922

From: Peng Fan <peng.fan@nxp.com>

Per reference mannual:
GPIO receives a single clock, which is used for register access and
synchronization with external pin inputs. So add the gpio clock entry.

Fixes: b0d011d4841b ("arm64: dts: freescale: Add basic dtsi for imx943")
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx94.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx94.dtsi b/arch/arm64/boot/dts/freescale/imx94.dtsi
index 020aa1da3315..90925d48daad 100644
--- a/arch/arm64/boot/dts/freescale/imx94.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx94.dtsi
@@ -861,6 +861,8 @@ gpio2: gpio@43810000 {
 			interrupt-controller;
 			interrupts = <GIC_SPI 54 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 55 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&scmi_clk IMX94_CLK_BUSWAKEUP>;
+			clock-names = "gpio";
 			#gpio-cells = <2>;
 			gpio-controller;
 			gpio-ranges = <&scmi_iomuxc 0 4 32>;
@@ -874,6 +876,8 @@ gpio3: gpio@43820000 {
 			interrupt-controller;
 			interrupts = <GIC_SPI 56 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&scmi_clk IMX94_CLK_BUSWAKEUP>;
+			clock-names = "gpio";
 			#gpio-cells = <2>;
 			gpio-controller;
 			gpio-ranges = <&scmi_iomuxc 0 36 26>;
@@ -887,6 +891,8 @@ gpio4: gpio@43840000 {
 			interrupt-controller;
 			interrupts = <GIC_SPI 58 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 59 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&scmi_clk IMX94_CLK_BUSWAKEUP>;
+			clock-names = "gpio";
 			#gpio-cells = <2>;
 			gpio-controller;
 			gpio-ranges = <&scmi_iomuxc 0 62 4>, <&scmi_iomuxc 4 0 4>,
@@ -901,6 +907,8 @@ gpio5: gpio@43850000 {
 			interrupt-controller;
 			interrupts = <GIC_SPI 60 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 61 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&scmi_clk IMX94_CLK_BUSWAKEUP>;
+			clock-names = "gpio";
 			#gpio-cells = <2>;
 			gpio-controller;
 			gpio-ranges = <&scmi_iomuxc 0 108 32>;
@@ -914,6 +922,8 @@ gpio6: gpio@43860000 {
 			interrupt-controller;
 			interrupts = <GIC_SPI 62 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 63 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&scmi_clk IMX94_CLK_BUSWAKEUP>;
+			clock-names = "gpio";
 			#gpio-cells = <2>;
 			gpio-controller;
 			gpio-ranges = <&scmi_iomuxc 0 66 32>;
@@ -927,6 +937,8 @@ gpio7: gpio@43870000 {
 			interrupt-controller;
 			interrupts = <GIC_SPI 64 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 65 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&scmi_clk IMX94_CLK_BUSWAKEUP>;
+			clock-names = "gpio";
 			#gpio-cells = <2>;
 			gpio-controller;
 			gpio-ranges = <&scmi_iomuxc 0 98 10>, <&scmi_iomuxc 16 152 12>;

-- 
2.51.0

