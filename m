Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.159.60
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793851010;
	b=oaHslPSie8CSgKC15qNaY2tLxwpBp3TaOTEqbTJpkGNd/OM3NrL0oTxxGfgRchcIr9tS
	 KnAlJhLRBUWLag6Le9exC8mKFRraxSMC32Lypw5i9JQLYAPVhl6kk8Hgj7s+wgKbNvbyQ
	 qHpef+j5/qwwmTra3qM1z54sL5/yy1QTkVYVK47XI63rPnLyDKeQ7xBCAXfwbD2LiMRFQ
	 sgAbvJF75ZyU0e8WVObq0CFLo3YunRYGOxt5tyGR6v0LYQeBPx9dbxFL2B2dgQ+pjQDgA
	 BnhfEs3ZL8YuI8bWQrm3clZ6mJXKfuDRyUkJ4H0csohP+aTki7Uk+qrIiJrogsMp56Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793851010;
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
	bh=sjy6vYvXFNTd6ETR5xtpTQMVgsNZMJkwBzP/ZTHQ08E=;
	b=OduOkyAT3jJLsmqF1WjUnmccviguCJy6A05cHexDacBq15iI9LpUFNKIYmUnVP02JNL7
	 1IobZEtLkYk0tSrATkmB94d4AORvwu6oz5Ud0bKwQsw0mccDx8Tq07u38HHjrmockBhiV
	 Mnqu1rlEUaRPo5LDKka5EEGXgALDb+xWHqgEiUdTt3QD5sZyw3QclpTs9Eve05DRyn2M5
	 APoi3S1gyKY8KTpoSWXEKH94f08OlL0ia9nXI/3aEGcrdoaJLUrNln2Ys1FtLTCTp31hm
	 g1BX/SQGPmE2INclrFO9v8OYmlEkjNvqTsqW96WYnGCZaf1PLeG/7J+iJe1aOvz5ioA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=dTooAyNv;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.159.60
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013060.outbound.protection.outlook.com [40.107.159.60])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53FDC606A32F;
	Thu,  5 Nov 2026 03:56:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53FDC606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=dTooAyNv
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FQBKEMUH36RaVChA5ZTzhEwZceUmlOZlNB+I0ShxHgfI8eSmgK8aJ9ZrcO8bwgxtsrCyRui5oeQvaXjQK8010ovGC3isgx8t+6w14yz+goQsCSPC5MCi/4FJnJ2kHLR4zNn1PkS2No5Du4acFEIuKYnCv0qsvTMuTwvktRADfAvxQHbyk4CbOvh/jw5hnEla55I/RhXxZV2Jku44xcrAppKVI7w0E8WYX603q0tEdbYx1uaMa7CqJ3S5f6eaKvjD2HKmvnQJoHG9hBVy5YArwCcyhp/5clz1JCY4H4au5byglko/DOLC/5BiQO8KOF6UgC1nx7CRfqwxOZNX/JV9lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sjy6vYvXFNTd6ETR5xtpTQMVgsNZMJkwBzP/ZTHQ08E=;
 b=xir4xgFK6RZCNV5bVEXhf55/5jNFhGFzkEqbnAqtc/0E49NeiZQUykRGr5EhCNMy1VwLcATiTMVpvBaYMSshSfh6svWfZDPVxianrAS8dB1gA2aM/j7Z2RCNVjg3obYmF6VfcIsNAMZl2cAwUhpT8XK2FxKUNF5zHRz0R6x2gYztnpQ5zCRCT0AQDxdG07ZWNfwDdKjnYQVwUYDb/6e2U1ytXuNN4rPQ5v9rIGYRRf2Iuk8vLfvEyPfO4LuKYrOOZDUg3xCk93i/3TLEoT+2sruHKbboHzxPV0ONU2jwFH9ejxmqh7pJK1ZzliwkOgWaZSa0TeCXnqDXoFAVsSBs2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sjy6vYvXFNTd6ETR5xtpTQMVgsNZMJkwBzP/ZTHQ08E=;
 b=dTooAyNvYvvh4bUpsJGGF3wYpG8ZHBBuTTEULmIN1Qim2czWhyAVKQNvyjKN9380fSiv5tystZe49sdwyCZMgYGC9xzS+CyMKfvAdl/0wlNsrAEG6FzPtztNr8F2yxB5ZEqFdU8ip/x5gRXA9bCOHCFj7JHB9sP7m/Hnp0+ygj4dazkiJ8Zk6Cv6u+nAun72RfLE/s1EDm4iBY+KmHk/i4KQBX49+DHek+bsHIYtsRP7KAdQFAqrrQ7kLnunmpue9+Jr8hY4dCAJpJWh/aM3dUNlZiYKCIOlxwpjlE8kmwoCz/NkqY0Z6fGGfa4kbvwHUQy2WGiRTygIVnEag0XtZA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by DB8PR04MB6922.eurprd04.prod.outlook.com (2603:10a6:10:11f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.9; Thu, 5 Nov 2026
 03:56:47 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0592.009; Thu, 5 Nov 2026
 03:56:47 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Thu, 05 Nov 2026 11:53:02 +0800
Subject: [PATCH v3 04/11] gpio: vf610: drop unneeded header
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-gpio-vf610-fixes-v3-4-504e19de5ad5@nxp.com>
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
X-ClientProxiedBy: MA5P287CA0324.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:222::19) To AM8PR04MB7874.eurprd04.prod.outlook.com
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
X-MS-Office365-Filtering-Correlation-Id: 57034cf8-2afd-4b4d-6d27-08df3af0d062
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|23010399003|376014|1800799024|366016|19092799006|921020|11063799006|56012099006|261021123027099003|261021121427099003|261009223027099003|261026121527099003|261102123227099003|18002099003|22082099003|6133799003|10067099003;
X-Microsoft-Antispam-Message-Info:
	LmecDYBiPJ5eMVoxDraLThVKMpLYscugo5sMjNbmAwp4CY7Xnd3VY5/Ldxl2m52/A+ibA8V3MwDh7H31lHLfaXFnvPYRxgvDgvt69Y/piJ43vvox/dbATj4Qmq5INqbFWupHBVVE2MTfJ+iZhY2N7jUHg5hk1CktqbpvF3J7OGS97Yij/gnsun2Gw4E4bSa2D9DHaN2AlMjLCLpccs+iXLfx0JevIA2SoCgS4Z8njzWNrYh/hxA1bQgPlgxkTRlt/P9cvgMklcoW7i2TRexuJZNtbgoJW3OBhcwgghxM/ySatGwDRYKIE5NBHQPIMnYxfNg5wdgSkpXA9qgLCdfLzueRzeaofgiBo6Men8PHEAn3dF7Ma4Ru5iDKA7WLv5F2dzj7kCSo2G4qAviuwjmUYCCgTZck3JY42mpAb2eUtPJ0Myg/P6WYE+HeL81IJ0HYj7SgXNWvzNrehhW5cUD09iJq/vHY/34Mx4c59TglKE2GBxjw/0Y/Ua+CTTkkb2Oppa4CR/oijkKPMhqd4FoFKyrqss2/NK/46ZS5Zotn8LI4zmZULuxAjwDZnz1xYMuhkOPCH0eSjT9hwNrMKlyrCVIBhwyUuqkKBc+Nuw9PUNlLHUfZ5+qplM1AZj81uKk1sbCF9cv3FmNfOPVyiSIoB5f81TMkXp4xBteeM/eInEyLjErpk5C6FvsevJbw0KtZ2zGov/R+wcitliMTmDvEWw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(23010399003)(376014)(1800799024)(366016)(19092799006)(921020)(11063799006)(56012099006)(261021123027099003)(261021121427099003)(261009223027099003)(261026121527099003)(261102123227099003)(18002099003)(22082099003)(6133799003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZmtOTXY2SEZRUlQ2YU9HNjU4Z3BYRU9SWFlIN2VHY0VGbXJLSllpSjBrMU5H?=
 =?utf-8?B?Y1pVTzA1YkRWRzY0MHJYN2FFNng0cmdNZXNTN0JOYW85a3BkQitZY01VQnJl?=
 =?utf-8?B?S3Izcjc4VzIrenlGc1JtQjZBekVlTFN3MkpiOHhnb3FkMDRXVkpxUUZkUTF5?=
 =?utf-8?B?eTJxcElwdUdNdHJBb2RVUHZad1ZiVmF1enR4bEZxeEMyWWJwUU5oR3VlazFP?=
 =?utf-8?B?OHZCeVM3ZFhsWWpPVGdwK1dBS21JdnZKbi9UUkdLK3ErVnJsWlhUUk44Mlgv?=
 =?utf-8?B?bmFKcWg5ODFEcnZUQklSYnpRL2YzM2lDZWxRaytWbjRDK1RqS2V0dGpjYm90?=
 =?utf-8?B?aUdEaTdVdjVIUHA5RjhVdWkyKzJsMGt4TVczc25wYXdKbjBrbTdSVmVnUXp0?=
 =?utf-8?B?OFh4K0l5TzFIZjA3QzFucGxEdVY4WmIwTExXSGRNNVZWdFphQ3E3Zzl2QU5H?=
 =?utf-8?B?bWZKUjRZOG50SE13WDZscGhieWhtVFY1NTgzbEhyUmtMUE9XR2NTdW15ZFVX?=
 =?utf-8?B?NWJqOFJ0dUYxRGJsVjgvc0ZxZVdPYjNYRkdLeUhjcVNDK3dNYkJobjY5Qi9w?=
 =?utf-8?B?eGZjL29HQ0F2Tml6NitnMEJxTzgzTHlVcGdseURDczBrUmJFeXZSS3Y5RC9D?=
 =?utf-8?B?M2xHZHNUZ25OUzNPeVZTYlk2YnpBYTM5TnVFeURESTBjUXE0ZWlqQmw1Z0p0?=
 =?utf-8?B?RWw5S1NjN0FRYXFPaVpZZkpRQlBWRllOMVMwUjlQeVA1MU9XUUppRXFvTGx5?=
 =?utf-8?B?SGx0dERKS3RjMDAvMjFmRTJYTkVRV1B2Nno0Sk84ZVQ1Q0xPaERYVnlpcmk4?=
 =?utf-8?B?dVJFZnAvSDFUOStPaFk2bktyQW5vRlUrUWdQWlY4NUc2azhwS3lMNTdtVmFZ?=
 =?utf-8?B?aGluZnhCVnRmd3ZPb2hPVmh0bFB5bUNmc2ZteHhzdjgraFROZnQ0Y1RMdkh4?=
 =?utf-8?B?c3psZVdsQW14SUpJMHI2OEZ6VzZLRFRYZTZxcUVDdVVKQnlzL3VDNWpYM3ZT?=
 =?utf-8?B?cVFkamlsRTRrdkJDeC9iSUp0M0JldFZPVEo4NEI3UDB5WGZxSTdwZncrRzZP?=
 =?utf-8?B?RGxzTzRQRmNGdnRaaGxsajRKZ0hCWkhUNDJaYU1qZ2J3eExoTElCN0pzSEVO?=
 =?utf-8?B?RGJOQUw2ZnZwcjBwazRyYXdZM3UvZXJpVG1yeEZ6UTFvWUdoWUpQSjN0eVN2?=
 =?utf-8?B?TVZEdG55b2dpVjB6VGpFM0ZEYXgzY1MvZlVTUmpKREFvK3hDaHM2WEVHZ0da?=
 =?utf-8?B?UkVtSkFnb2FjSTJobTlLdVRKb2dmK0pjSFF0Sk1nU3Ezb2JFVzVIbTZFaVdl?=
 =?utf-8?B?cHpSWGR5WGRiWWVKNmh1UlFuSEZrcU9wTnkzblhJR0VLeUlDVzdWL3R3TDIy?=
 =?utf-8?B?VDJyUVo4MHJwMkRmV0pvVVEvbnpoTUtQcEpXb21INGZ5L1Q0WE1KWkkrNHBK?=
 =?utf-8?B?UHF6TUNSeW9HRkk0Q3FTZDZKR1Z6bkhkT1BTam9zNGhGR0FHVEJtYmc0ZEQ4?=
 =?utf-8?B?S1ZobmZ4UUw3VGhBQ0hUcGFGdnBFT0NsZDQ0WU1HdGpkN3ZxbS9SOWxTRHpK?=
 =?utf-8?B?eW9nTUwzKzgyYkRsVEZ1c1R6Z3dsVmk2U0VzanFaNkdSOXNYYTFWL3p0QW9s?=
 =?utf-8?B?ZFV6VXBIMjNFYmtSQWI1QlJITDY4S2JsWVEyTGlZaTdBUXBzTnZIS2pYMjRP?=
 =?utf-8?B?UE9XdmlkemRGWGgyTWRuSTljNk1CSVlydnBUZEtGS1B6WkNvY3pPLzByeTJv?=
 =?utf-8?B?L2tIN2RPSUZaazJGc0x6NjZYU0xQYzFLeUJBd0E2bENTbUZtVE1ESVc4aW5h?=
 =?utf-8?B?MlJneWIxRTRUeWRwblNEb3hlZzNGaTNGalAzY05wOUd6em9xaFpmQU9uTVlx?=
 =?utf-8?B?cHVpeDhNSTVWampUMlZSa1FmWGJBaGxndXBicXV5ZjdiWThvSElwTjM0Uito?=
 =?utf-8?B?Wm1rQys4WGVsa0g1OFZJdlFZd3VSUDhGVHhBUTNVMnNNRG53Q2FWSzVDWllp?=
 =?utf-8?B?Y25HSFhRQi9ySTdkcHdscExsZDN1aStZbm41WWtqR2dBR3k4QzJQN2RKaEM2?=
 =?utf-8?B?YW41WlZZL3RZek56b1JBSUhPeVhpOUZ1WElocWZZejRDZlNLdXNPaUo0VEhL?=
 =?utf-8?B?RUhsMGU1LzBocWppVExJL3htckk4VG9uaTJxS2lxNURsekRGY0cxWjY1QTZx?=
 =?utf-8?B?MlpCcW5tbTd4cHplWWtzanZua1hJcnVsTnlxeEc0TXQ1V0p6d1owNjI5M0VL?=
 =?utf-8?B?ZGhMTTYyRWNJaCtwb3RIcHUzTTE2Rko3WXdlZk55UzA3Y3NqSVhRcGtlVGd0?=
 =?utf-8?B?VnkwK0J1VE9nMzNTcEIzUFMvZlptYmVDeklCaXdpajRZSFNja00rUytjM3dF?=
 =?utf-8?Q?RdoVJPusJa2eiP3IRuXf7SXUA/TOhVpW+XGJS?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57034cf8-2afd-4b4d-6d27-08df3af0d062
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 03:56:47.3554
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aHPbdCLPutSYn0Pr+Tn0IgdoaQ4PijbSaOo/wHSUzwae7+/6SGnsxoQyt0eHlv6XNzZjiE5M28EaHzxd6BZ3qahgcGc0cibfnGW+DHXHw5zHRAG/zdEAKg9xvy+TvCA+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6922

From: Peng Fan <peng.fan@nxp.com>

Remove the unused pinctrl consumer header since the driver doesn't use
any pinctrl consumer functions.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/gpio/gpio-vf610.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpio/gpio-vf610.c b/drivers/gpio/gpio-vf610.c
index 9ebb4469fd15..d14cd5515293 100644
--- a/drivers/gpio/gpio-vf610.c
+++ b/drivers/gpio/gpio-vf610.c
@@ -16,7 +16,6 @@
 #include <linux/io.h>
 #include <linux/ioport.h>
 #include <linux/irq.h>
-#include <linux/pinctrl/consumer.h>
 #include <linux/platform_device.h>
 #include <linux/property.h>
 

-- 
2.51.0

