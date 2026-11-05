Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.162.3
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793850990;
	b=tf6IYhHQzulLTX2LRPngwsRyTFQbdL/MU6d7FkLEt0Tj8C6toO85H2946C6ZI/yXXPgP
	 +4bOHYM3qb5zmPQV5CppbVo2rq3VAedfX6oZcVFqSBF0Mp7KgzyHMzRhVHvmjrGq4/G/y
	 dcb+6Tqmrzfivat1lhXI6103F8IXiBa5KcQMlesWGl9cqlRPmcnvVApRFswUC7u3IOvJ6
	 616Sjv3MFwxHF3ZcP8b6F+AWydToiKNgrfghhulGad6KOR5VvrNwRgE3ZPDNn7iJqd3K1
	 z5u34cS7mXkcmPHABByTaa1VwKvuciI+sNussHpzCqng5SwnxBXRNG675f5QZ8cqerA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793850990;
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
	bh=Sm9TSk2antp6PWx6zryzNJNxLl2FGB16QS/ARLrHGjs=;
	b=VD7Nd8ZdqYI8NkgVNdLY9q1jgjZwqwI6rfW4TLfz09hvgPbVntS3mFXppAIw7k+TNvIH
	 Uf7PxJ59nQ/a7jWnU2X4WKeKBBpYDmuNbBvSRvrZ/MIpqcBIYLIbFVTS6csUoDcr3D3Y8
	 pdTpLK7EwYBkzoQAMErMnurWG/C3BAURxjNlCwJnuHEh+Uqo6Q+PtkG2FmhR6pGo8CQRc
	 ElmmuWL2dwxLzeiDCwu9Bx8+EyrYgtUXyvmRj1OXxPx3+4DkdDrLRqkImARmeV4isfmMs
	 NtGaysBOySFH8OFZr4rA/jzAlJ39hbpnvnStC1sI5KLhCsR0lXlXecnR2L2q6ULy78A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=CLeBQE3J;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.162.3
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013003.outbound.protection.outlook.com [40.107.162.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F028606A31B;
	Thu,  5 Nov 2026 03:56:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F028606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=CLeBQE3J
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NblMdFOjXuKsBxaxA0aL4V48YcGiBsrPe5iTuZaRBbbZjVyi5AulUzwS/NfELUHuUA3R7NtkdTZudmG7J7cefcaGpJOl0tiHejKRsVgh5D6Vm2bnxuX0jZyhMut4M2yxPGNeQzgwihEnPMsNyOpQp4K21iRmKLvOvT1SYWJkd7sfCX7s+PKtOblYohtGiGwPTsB5sqH5Y9phPmwwGDKEPenxLkKQF4XePr92sMCDgR88kv5ony/3SP+Fb3IuZ/Y4yswDzrLBKTZDthE7x/AKzYs70rAYr0xWX2SDnLeRtB5/j9rI4zk91FLuJISVDC5F4NkmwsMv7u4eDTNkXT3csQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Sm9TSk2antp6PWx6zryzNJNxLl2FGB16QS/ARLrHGjs=;
 b=EfoGelS0uwvYUcM8iTRj19KiDkeErPc/3+bVLdxGt/XoXXZKTgVy6nAuCJjo8vqdBfVq4iZjEPWrxAcAVZ54Q3/nNqO/GVTeEOI551letBBldtWOWIHx20v3TiFoSgWUIJfmONO/ElXpK/znYWIe09GG1R1wXCsKOuo/msU1pswFMC42MTvkoft96nyV4f4AFG8WgTPRedv8zUPVdMSpKTwSDBZvmfYDm7Ax+B6mqyQaW9qAUQU2C9XV7+/PXOWCYFB8vgvks5VOzLwMuS4ttAadiN9Ay3AvcDSt1RZzbfejod98dUZf/Xiqs6YtpoSiB0gCwJutc5YSGZ6IqmwLrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sm9TSk2antp6PWx6zryzNJNxLl2FGB16QS/ARLrHGjs=;
 b=CLeBQE3JLn3i7nPEjSyF0E37PuwKAt6DHpE96FZ5BkE9Jq3HXdOZCVm0kn88YPWAFSOaxD1k1Yt54tDqWS52Bs6xDCSQZK6G0gm8NZixFwIFCRG21KeWbSLGTn7A2nry+59qJy7rZdiCm5OMLqp5pxVeGohJnZjQYzCypsUsQlfZnUMGzIQADHyfxXmiqdJPjMV3xfVDbiPh1LiMWxTFdoVUaRoTuZOeUTUHBn4KvqPUFt/MCNQ0+vXxBH7yRU0FTQi9ViPNhSNQM9p0k/n9euM+3RhkJo6je8r2Rr3Ii0U3yeCH2P/q46OYIVgXTaHCYdV5UYXpafopXbCtEC1jaw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by DB8PR04MB6922.eurprd04.prod.outlook.com (2603:10a6:10:11f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.9; Thu, 5 Nov 2026
 03:56:27 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0592.009; Thu, 5 Nov 2026
 03:56:27 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Thu, 05 Nov 2026 11:52:59 +0800
Subject: [PATCH v3 01/11] dt-bindings: gpio: vf610: fix clock requirements
 per SoC
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-gpio-vf610-fixes-v3-1-504e19de5ad5@nxp.com>
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
X-ClientProxiedBy: SI2PR06CA0013.apcprd06.prod.outlook.com
 (2603:1096:4:186::18) To AM8PR04MB7874.eurprd04.prod.outlook.com
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
X-MS-Office365-Filtering-Correlation-Id: 4f15c242-8c3f-486f-ca2d-08df3af0c454
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|23010399003|376014|1800799024|366016|19092799006|921020|261028144727099003|11063799006|56012099006|261021121427099003|261009223027099003|261026121527099003|261022105027099003|261026140227099003|261102123227099003|18002099003|22082099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	Dltg43ZVAYI23nG3RkWooaEaRdAkjST4phd3NVO2jKzVCPGn48sHNMLHONLsquvr7anqZa9Wx3/oib/yXN4ekpWA/bBG7QZrFyMtXbiPnV2mycV4vBPe6QQGWdj6tCmX/N5w1sRY7H4etsytrCyY7GkurtGSSBZzEqh0cgnGbg25QQRMXdX74oqvWi9aMOwhN5RQmIciPINpQZ+xSRQs1ezVlcaGzyzoB+3yp0mz7l2zNAybShgDYBLItcy6o1t3v+T1MISUgZU7fBatGMBbhHg1qYSYBE+sXWpANS35C56QmSYaOQeovubuhA/WC/agu6GEZJdaTMGnma2Fhy39QVZYzwbwZc3JOjUzb3b7vBXwK86athJTJeQLStldHuR/xPTPUeGB5+efIQ1gMrqgVQo0OGQhMKkvtCD5K9Cs0/BeFtTLikjpLxJphsedNDSKszqE9fy1vvtgg3qJgwVhJxTUBZ1u6DMoGv7sCZM+486u5QXeo3rcgiyIQN8Uhwtk0t2wGUf/wr89DPPPj11RDe2t1iqq7JO/gsfC4c6bHDgcNxYY0DE41LmH9tb+QHN9Vs0V8kcYqmJcNKrWSn3i67NabBnanyp0NnQR73jet+VGpRew9MksF60IhW0VaBw0Zr1JJfKrwjX9EHX+LlqdSF5PocpmIbOd/g9k2r7IMc2l1FHmT0dz6VDD5nZvGW+71p5lQpa1D27+0u2P1ZZJ7A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(23010399003)(376014)(1800799024)(366016)(19092799006)(921020)(261028144727099003)(11063799006)(56012099006)(261021121427099003)(261009223027099003)(261026121527099003)(261022105027099003)(261026140227099003)(261102123227099003)(18002099003)(22082099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SU9MRG14bi85eXhIVE5BeEIxUVpqdzVPdk9OTUdvMUhUUnpZK1ZDTXYxK1JN?=
 =?utf-8?B?OUU3QzJLZFFzLzVmSitWZXhzMVViam1iRXNUTWRlMDNjNUVyd00xRzh3VFd6?=
 =?utf-8?B?Y2dQeE5Vb25Qci9iemlLMGJYUzU0b0xvdWxOTUxhQjNxTTZ1NTczSUVMRzdl?=
 =?utf-8?B?RERyaFJXZlBMOUMyKzNXcndpeWxVU0xQMVhFckpiZ3dkekNkUFRiRjJBZGNv?=
 =?utf-8?B?bDJuSkZXNXozQ2VTd3AwbXFBVUhhbGU1TzQyNk1FOHNnbzI5cllneS9qU0gv?=
 =?utf-8?B?UlRLeWRPajlUUVY3SWJnUWphVXBlaWF3Y20xLzB1SlNGS0NDMUV3dmJTNWtt?=
 =?utf-8?B?b2pYay94azBRZGdtTFpkN3hPdWxtUi9VUTFQaGF4aVB4eC9FNnVpUVRCQmR2?=
 =?utf-8?B?cWsyOEVRcnBCNVhYSU9iNFNiR2NSR3JWWXZLdDI5azJlVFBoVVNvRG5qV2pU?=
 =?utf-8?B?VFIreHJLMmROSTJERmpaMWd4TjVCUnFTUTB6bUZBYlNJTElyNG8vMzd0dXBE?=
 =?utf-8?B?MTl4dmtqVHI3OU5LUHlZcUpxbU5ock9CT1V3Qkllb01KZUxtMUk2WkZzS1k5?=
 =?utf-8?B?QXlWanYzOGh4Mk1MZ1hPVlNvdTRpRnF2RmVLRDUzOHZQYk5NVUpTc2tPcUEr?=
 =?utf-8?B?cERGbmRySEZzaDVCVFd2Rmp6VzVJbG9UNTUxK1ZveC9tSFhMb1lXU2ZHMTZL?=
 =?utf-8?B?b2NwN0xWMHAwaGJRVUhRZVI2Q1dEZVY1Mk9LK1lpWEpTL1ZZQVlmRVJZZ2Nw?=
 =?utf-8?B?YXZHaWQzd3VZY0dsc2dJMU5tWjZJK1dhb3h1MWRWVmlZQWd1ZmdVMkQyRUti?=
 =?utf-8?B?TFFmeTlLK1ZENE1QdXIvbWxQM2NueDAvc21UTyt1Z1V1MXVVRTJyWjg1bjY3?=
 =?utf-8?B?YzN3VWFOdDFnS0FFSVpVM1FJM2Z1NVhiUzBzSEVTekJkakFPQUxzd0tvN2hn?=
 =?utf-8?B?VWYwOWZoREFWNkhDVWVwdWx6SlVlb3NzZlIxL3BKNUpVdHVQK3lmV2hxODVp?=
 =?utf-8?B?YXQ1cnFoQzZUSFh3eUh5VFJkNldHVXQ2RUVVWEI3S21lRmdmR3VWZDVzRTNv?=
 =?utf-8?B?M3JQOTlCY1hWd2tjVmJJNTlhVXFwTTRuRnByeWFtS0Y0MXNuUFNDMXdHQnFq?=
 =?utf-8?B?WHl5RUROMWFpZ3RqTTlSY3ZjelI5d2EyRmNScG5sR2Z6MDY5MDN3dmlpNWdU?=
 =?utf-8?B?Wk53OHZpUUpOTHNtSkx6R3BKZ3ZCQ1RvWEo4cE9rVnZNZWlydlpGNXByTkFU?=
 =?utf-8?B?ZzluOXRnZ0FzTXluWW5QMWlFSXdSSk8vcmMrQUV4c0NIM0Q2RFlLLzhpRHp6?=
 =?utf-8?B?WDZ6ZjY4K2luZHJlQ1JRbE9YSk1VOHZwYTRoQXZ1bnZvRFVvNk1ZeTQzdCtL?=
 =?utf-8?B?VnBaR0VFK3pqUm5TZXJGVzVTRHVKWGRpak1TZ2YySFlDZ3EwaGZuSUhlQndS?=
 =?utf-8?B?SzhyZ2RjMDFKdWdRTjVKR0M3Z2ZOd0xjZFBKa080UmlzcktJL292STd5L054?=
 =?utf-8?B?WUdLc2RXV1BFMks2Z3JyNTVRaVJLNmw3RTR3VzVrMXhTMXhmY1NRTXVkdEgy?=
 =?utf-8?B?cGlYQTdXWVVvOTZnNDNEZHh5R0loV24wRk9lajU5YWU3YVN5TzR0MlZ5QVFN?=
 =?utf-8?B?NXNzZ2dUbHJ2bjRhK0NZY3hUOXROTWdDUUY1Z2pReDNkNkpCM3VhbzVyblkx?=
 =?utf-8?B?RTBwUmRiMmVrS3BPcHRLS0huZ1dYNHl6WWUxakYwTGhWVjJ1aW5HUXU4eWFa?=
 =?utf-8?B?cWxjbjJRbW9kU3MyTWJlY2o4dW9OaDFiT3VCYjkyQlBGRVYyM1FjRTRrbFZZ?=
 =?utf-8?B?SUtmT2czeWtEM3ZHL0p1cGxTL2dBcjhJOENEMFVvbVhSRXQvcXVrRFdGSlBK?=
 =?utf-8?B?MHpQbGFQVmVza1RjZFA1VllmZ3E0YUV6dlV2b3FiRnE3N0kybVM5MFl4NDV0?=
 =?utf-8?B?ckxRUE9WMmNPRDRVWWpOeklROUVhZysvSlMvT2k1cTQzdEJ3M0p5dTZHcUs0?=
 =?utf-8?B?UzIzRDI1UXhHMHRnOUJuUjZtWW5hUUU0SER0ekRNZXlYWDRrWFMxWHJUd2Vq?=
 =?utf-8?B?T1NybUR6K254MlZyMzU4dXMxdFhRdWdwVGVkeW10SWNkR3VMMnVnN21RbTVl?=
 =?utf-8?B?UW1MSnZyL1h4RS9telNJUHJmanNrckh1aElST0YveERKdjNSOWEySW1sV0Fs?=
 =?utf-8?B?a0RFSmlHZWtKdUliWHBjMDZxRlplZzVtTWpkRWQvdTRxNE5wcEJvdWEwcWRP?=
 =?utf-8?B?UmdtY21zK2l1cTZUbUdZYzVVM05WM3lIdjUrRlJKVzU3YXJDcjJjcSs3YnE1?=
 =?utf-8?B?UGhvWElaT29XRmVoTEJ3dC8xYkhmZDJuMnRVNnEzQkJjK3NML3VQSUQvanky?=
 =?utf-8?Q?DalF26FHT2jWMY41X7FMXkZTkDUce/sKEohkW?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f15c242-8c3f-486f-ca2d-08df3af0c454
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 03:56:27.3156
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Dh+vjLgWhe9Sk9kMypTiziuJknZy8GqgwVKXPoKyF2AE8VNsIswsD5k+s4uM6VlqqftLTu6UrklJtR3Ijrb/9RwPl/wLrPvTKq7ush6KZVE6Znz2Gdkgz0NEtMsw/6ko
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6922

From: Peng Fan <peng.fan@nxp.com>

The i.MX7ULP GPIO controller needs both the GPIO and PORT clocks,
while the i.MX8ULP and its derivatives (i.MX93/94/95/952) only have
a single "gpio" clock. The VF610 controller has no gateable clocks,
so force clocks and clock-names false.

Fixes: c61d8b5791ab ("dt-bindings: gpio: gpio-vf610: Add imx8ulp compatible string")
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 .../devicetree/bindings/gpio/gpio-vf610.yaml       | 41 ++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpio/gpio-vf610.yaml b/Documentation/devicetree/bindings/gpio/gpio-vf610.yaml
index a31f64b6d40b..d1d5315ee164 100644
--- a/Documentation/devicetree/bindings/gpio/gpio-vf610.yaml
+++ b/Documentation/devicetree/bindings/gpio/gpio-vf610.yaml
@@ -57,11 +57,13 @@ properties:
     maxItems: 32
 
   clocks:
+    minItems: 1
     items:
       - description: SoC GPIO clock
       - description: SoC PORT clock
 
   clock-names:
+    minItems: 1
     items:
       - const: gpio
       - const: port
@@ -117,6 +119,45 @@ allOf:
           items:
             - description: GPIO register base address
 
+  - if:
+      properties:
+        compatible:
+          const: fsl,vf610-gpio
+    then:
+      properties:
+        clocks: false
+        clock-names: false
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: fsl,imx7ulp-gpio
+    then:
+      properties:
+        clocks:
+          minItems: 2
+        clock-names:
+          minItems: 2
+      required:
+        - clocks
+        - clock-names
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: fsl,imx8ulp-gpio
+    then:
+      properties:
+        clocks:
+          maxItems: 1
+        clock-names:
+          maxItems: 1
+      required:
+        - clocks
+        - clock-names
+
 additionalProperties: false
 
 examples:

-- 
2.51.0

