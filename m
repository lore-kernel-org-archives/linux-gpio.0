Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.65.17
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793888035;
	b=OFDqi5ooWIJ+L/1HqphC+lMUIHcnIr8xcJdsWzzfeMEMNH6vUJAvenbE/JHVHyvgBHBe
	 /ITJGDTiRqhizJLGjpkhnDh5Zd5aRQA8dnmg9ylcDteiBhodsQMZo6MZobK1Ybkhtd3xZ
	 y7vy2S1Cv/5/3CWLhRy8MQRKwYUFhNQJHkhaQPDK2pBQRJ/oXTOrJoW5oqcKJTAa6XPDE
	 v3zu/b6DW/h1ciA6n2hJEK0r6C2gR0Zw6MvmCLGARcN4IR2/zKiptZ4K9/ylGN0hVWWzs
	 l5MLYu7Hfog/OE+1wJCvxJP8orLG/aiRCR73oMM9yl1FDhnH6zIMPN1OnaLk2TfXOxw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793888035;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:Content-Type:Content-Transfer-Encoding:
	 X-ClientProxiedBy:MIME-Version:
	 X-MS-Exchange-MessageSentRepresentingType:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SharedMailbox-RoutingAgent-Processed:
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
	bh=EVOaY6lzupMU17CGEp/mLo45HJwn4/IzgMCVwxJi9Rs=;
	b=BAovcMa/ODn2ntsbh8VOOCSttHU+bzMv8xqR3pfAf7DEbhpblwkE8lDycw1RdMnVjZyg
	 0yeabk1kK3hZ6OFTxoayvyoDpB98xhyC9/u9wf91WUF8fuwpq6VQDizhY+xPGiVrt0152
	 /7EXuJjOQ3sVhcyiK7bRCxAax7b4ClSJG2dQHyePeIsEGCt+q9MpuSUtb69Yi+Q+8DBhs
	 2jtl4fciszrnQlIXdqE8VIjvuNkgRgA10fr7AoHYT1ovdxEdf66psetiv7IX6JT4prbqB
	 drkB0SHJ3vScOj10ftV8veHJaJpU/01TPgQPqu1+Sy3/yw4eqSFoaUJNHMRqFH7g5sA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=F3bvxBvw;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.65.17
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011017.outbound.protection.outlook.com [52.101.65.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E77A9606A31B;
	Thu,  5 Nov 2026 14:13:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E77A9606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=F3bvxBvw
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QQCJ/EAXZFxy+/y7x8IGMP8sYo1QOa5gg6e8QbIl43/H22GH+IMlUbhcX4HpJuTqixdo/VufHJqvhdN1g9ggAxLEevssFwCvc7D+tbozGwtpf/txkw9wcJhUQ5mkHt3SaboEsekgyleBaiCRURCoWF207xYOggRFyvSHPiOFUi7m0kzpQFMD1ErGEGOmUYn7FhB/WIm8JRgGuisZm4uV1x8pFt3717StsIT7ireFn5enQSzBYH9oKNNWTm6/dGxz86V5b3UWtF11LiqCgtjK7fhMvZxPmJ6YMwDDRHjB1Oy6NVQz4Qp2k9z3An79SMYDyjyaQaluxGeMiVfJSEfVFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EVOaY6lzupMU17CGEp/mLo45HJwn4/IzgMCVwxJi9Rs=;
 b=Yb6k+nDctsmiSSLF2MHy2IBPGatgVZkbiSWb0pnyeMMGjbkgsV9w4BxB5cmw6pwP998Rx7Lo6e357uFlk7arLqTZUz8Nvng83KPU3szHdZrMOVUc9MEZMT/OAPQfjeNG4JFUlL9IBSS7nn5dyxD+iuRF7mbMu1rWSOOOpTXajILaXdODoBwcuoSmEhf+6UhJN+WGefF4UwYuZX+X7HXrDdSEcW40MkQpB7Fe0BawPp/+5uZ8fJutVoc+uMWO8AMW+MlmhhE8xz8OZ/sSh+pRZLPzfQj/5TsvE9rFnZfePs0H5ovznulEnaJey42RxUTU1u/dYbPIv3Xgt2tYDsb4Xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EVOaY6lzupMU17CGEp/mLo45HJwn4/IzgMCVwxJi9Rs=;
 b=F3bvxBvwB1sUsLd2vDhbr8wMMRfRlHOu9MCaEcgZF4meRZAzEAetzIJEzWfDnkq0acjZ4inQaZ0DxhjBBD10yDHo5TgirO3je2ztpePEMuCpgYwoo0+hldc9fHxE2yED+37VpN152sbe8z0dz+CDmiv5J6R8ONOtn7tOaG1H3Oao9QXLyHUPBlKmsybCt+TUl6d/J9A0OZ1Hw4+M5fkkvR9RPJrOrcI+Qv0lqfgHNcsz4itoztADBUfy8OsEbxebZlhcJ0334a3B5hhckOBJRbKbeso8Us4qTywO9vUONe/H65OnaUO7D0KZS/3GnfIKwz2Yzh+h7qkn5PubbrpsVg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8179.eurprd04.prod.outlook.com (2603:10a6:20b:3b5::20)
 by DU4PR04MB11029.eurprd04.prod.outlook.com (2603:10a6:10:590::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.9; Thu, 5 Nov 2026
 14:13:49 +0000
Received: from AM9PR04MB8179.eurprd04.prod.outlook.com
 ([fe80::a551:cde0:6730:1d85]) by AM9PR04MB8179.eurprd04.prod.outlook.com
 ([fe80::a551:cde0:6730:1d85%5]) with mapi id 15.21.0592.009; Thu, 5 Nov 2026
 14:13:49 +0000
From: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
To: Dong Aisheng <aisheng.dong@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Jacky Bai <ping.bai@nxp.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Linus Walleij <linusw@kernel.org>
Cc: Chester Lin <chester62515@gmail.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Matthias Brugger <mbrugger@suse.com>,
	NXP S32 Linux Team <s32@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: [PATCH v3] pinctrl: nxp: s32g2: Enable by default on ARCH_S32
Date: Thu,  5 Nov 2026 15:13:47 +0100
Message-Id: <20261105141347.488850-1-khristineandreea.barbulescu@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS4PR09CA0025.eurprd09.prod.outlook.com
 (2603:10a6:20b:5d4::15) To AM9PR04MB8179.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: AM9PR04MB8179:EE_|DU4PR04MB11029:EE_
X-MS-Office365-Filtering-Correlation-Id: f96b80f0-f326-4a90-91cc-08df3b470353
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|376014|23010399003|366016|1800799024|6133799003|10067099003|18002099003|261102123227099003|11063799006|261021121427099003|261022075727099003|56012099006|261009223027099003|261021123027099003;
X-Microsoft-Antispam-Message-Info:
	rIsxZWT91HoLN81a3JztVy2/7O7PmkPYsbTNP3WEQd6OwMnYX0jsNkR0lh8bgFQqRazAaM6dSwTYeAmm8GXQI8D62cvly9lTrgtxRi4+ya9XtYu3FVmVhf6Naq0rIyZbWZityWB+xz/oHPzBxbypOWdc8JooFKJsyPpSLXVV7O8GAvRP+tGPOFs194OtiLTX365nfv85CxN9bI1wcJ6t+6TcQm/QJW3iEdx7bFhhzzMB8FSh9LWrOUdsUm7NuoGKaXZHloCOpg4yp9QYRhmp9/UWX+MOnjlmsILWhjMufrtC7OASVJ35Cgq7VWtNUykDTwDelehgfhrBF/qc50pNAZzckP//kqLDIqEBD8JwuBwgGgucpEWpTYOS7Si5NdqkLmN3ypqIoSbubq+J/bSArIt5vcXiVbUEL6qZDJPp+c6hz5MohGP4usuPGdQGyg6fi9V8dCSFfC1zVJ+UK9SSrY6Pk4QeWz2bTY+eApiLL5ZxlDkUGxf9BQjLngy0o+6+lbFLcoh4eQfAOuCdWcHRp547/gurNNyCx7Pz7ZYONqZE24VjLtgxSR17ByoJ672bESbqKADZ0gf90KhXv0WvigT1AQ0JZMXp418cccY+AtKH7isyAbmQLLqfU189WxwjLgHVCf2rSZkpNsK5RumjFQHpbhxQ0DGHC10rgd9imKI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8179.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(23010399003)(366016)(1800799024)(6133799003)(10067099003)(18002099003)(261102123227099003)(11063799006)(261021121427099003)(261022075727099003)(56012099006)(261009223027099003)(261021123027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y0lwMEs2ODUyL1VrYzZoVnhIaDkxZjRQR0tFZ1JLZFlTRmE4ajU2Mjg0SHR1?=
 =?utf-8?B?OTRBWER6aWV6S0poelluZlVXSEx4SXdCbHpVeitWUHd2WEs1ZTlYdm1VbU8x?=
 =?utf-8?B?djc3RGZxT3JQOEcvWndMWHVHamFQT0J0djVqbzMxN3BQemhaUElCbmNuVHd1?=
 =?utf-8?B?Z3p6TTZCbnRPb1BCSU9FSm9MeWg4N2JucmI2RlBXeVBoT2tsaVdONzczVDhV?=
 =?utf-8?B?bmhXdVVoWEhYdEo1Ukh1OFp5K25ncWdmK21pSVNPc2dLTlFSTUFtZ2Uvc0xG?=
 =?utf-8?B?TnRjQXByZk5HT2o1VER5Um1nNEFZaytXSjRKSlZzRXZZMGxobXFUb0lSdFd3?=
 =?utf-8?B?bjRsdnVQWmxSMFYxTXBZTVpwbkJESnVEWDJHRHhNcFUxVjhqdGdhYmpCS05Y?=
 =?utf-8?B?cUYvUWlxTUNBbkhueHhqbUtSZHpmZjdiWDI4Tk1MTlhmSGtHOUNFTk0vSjF0?=
 =?utf-8?B?Qmg0RHc5VFlBOU9BaGlwNEgraTlUeHV5ZG9adXFFaWJ3NHlNMUhVQUJjVDNl?=
 =?utf-8?B?RXRuQnA5UEZ1Qm4wcm1qN3N6cGg0cXVveVZXenloSVlDTURDek1VekFEMHJ0?=
 =?utf-8?B?WkRMMk5aWVlibC9SbWtyK1FPQVJaR3p6WVlkVE1pM3JYYUVEeVFFVUJXR1dS?=
 =?utf-8?B?aEhtYUdaQkthZWhnMGtLT2xtZlNSKzU0dEhqTDVmZ3ZXeXJuY1FZQTlTd3BM?=
 =?utf-8?B?b24zZmVwZEw1NWl2NUtnOEFXUzZDQmlXUldtUDRIaitFVFVvTldRMnBxVzlD?=
 =?utf-8?B?UDQ3OUhnMGdCcjc3MXM0NGN1NGk5ZHlZeGRnZUJVSzdab0N1WmVCNFhsZGhO?=
 =?utf-8?B?TW9XR2dmWEtLT0Nrd1NNMnJDUXd1K0UvbXlMZDRTRW5odm9DTXZYTWRvU2Jw?=
 =?utf-8?B?Ym1ZOGhGUGUwNDRhUGJSWnBxbURoTHJ3OFZaYXhhZ3NWcjNRWFF5alBwZ1dt?=
 =?utf-8?B?b29KaFJEdjJuTlc0ME1yY0dETklYNnNscjRiZWh5Qjl3azRENFFkbkxyeU1L?=
 =?utf-8?B?eHQyZkdmU0NYUU45eWRoSXdvcGlqQ2laODN6TCtMTmdNQzFOcW0xNjAzU1M2?=
 =?utf-8?B?UHVFTHBZNU5vR1hpbVQ0Y1lMNG5vVzExbzNyWjBYMVB3V2JoVDEyMy9SWThT?=
 =?utf-8?B?dXU0RHZZMHdud2NFQVNZZTRncVNJME9KNU05ZVVVSFJOVkV6NXNSbmdFQk5T?=
 =?utf-8?B?QTR1NkRObkxCcmw3OTlWTnl4N0ltNVVtSVp1OFlyRUtmMUdZY05Nek5oZ01Z?=
 =?utf-8?B?U2R4TUFVWVVEUlRaaVA4a0ZJYllTc3hiTWUrb0tsZDVUYnRobm53YkthZjNq?=
 =?utf-8?B?ZWR4S0lacUJqaGwvc3RtTW5wMWJ4SUErWVlaSmlxRnowM1JRak04TkVrQVI3?=
 =?utf-8?B?NFMrSnJ0Tzc0SjJpbk5lSW1CZkRDcU9MUXU0S2FlcDh6dG9HVlgwdlBoVmNu?=
 =?utf-8?B?bkhjb1N4QkdNcmtjRlBOQTd4dUJ4RDRjZFhkaEM1RGNTdlRtWHdLZWtBeHhS?=
 =?utf-8?B?dWVCOE1ZelVmaW0rVFpjem5sK1UrWC9LdE02VnBTaHc2c3RIbnBoZlZGYTdP?=
 =?utf-8?B?aklVMldGVWZXUVNEWTcrdWVKRy9ldlYvNU9sOUhPSmxReFFxOExWeEMxK3dx?=
 =?utf-8?B?bENuK0dROWhUODhCanRMdVdNOHBpeExVTjVFcStZTzUzc29wdi9HeExaOVJ5?=
 =?utf-8?B?V1pPSGp6UUh3M281N2RmZlZBU1VIdTVUd1NPeHFuTkVTejl6bFdoSjNNM1M3?=
 =?utf-8?B?cmgzc2NKeEludVFTYm54OHYzY1ZYa255RFVWZ3pOb1VhMFJCbys3WnJNRERE?=
 =?utf-8?B?NjdVVTRDdjFYdkZrYzNMa1ZzTVc5cEpTamlFcVNmZGFRMHRHNnp6S052b3lJ?=
 =?utf-8?B?d1EveENzWGJmUnNGRVZjV0w5QUFOK2pjMVFXcHBGZG1vb25aRzR0WWNmMjVH?=
 =?utf-8?B?SHNjYkxOQ1cyTUg0d0hqTVNkNS85QS91UGlqdWxQajVsUFIwT0svbkpCcWtC?=
 =?utf-8?B?eEpDUko3K2t5T3laZkdHSW5MeUN5dkM1Y0RtNDMzbGd6WEprU3RBR2dOWDdD?=
 =?utf-8?B?YmpRRnVYK2M4WURhNDBiVCtBMVFhZjNyVWVRMWdsbWRUNlVRN0hEQlE3akY0?=
 =?utf-8?B?RitxTStyc1hMZkNkMnZETitrMFpvTEpGSG9MOWs4TS9Tc3NTQVNFRDFnSjkw?=
 =?utf-8?B?Q0RnTEpBcVNYRUlkSTlFMC95N2xsb29EY1FvUDc2aE1mTzRKdktMdVZva2xD?=
 =?utf-8?B?dVJsSVdjUWVvTmdXVVNKRHBUV1M1SzNKbDRldlpPTDV1dDlUeFhSUmVQU2N2?=
 =?utf-8?B?NW9BTktLWDhydFZ1QlJ1SHF1bjVtcXpTMnBDTkUzZjhKOXZMd09DZXlJT0Nl?=
 =?utf-8?Q?kc4f80t5BXmFwiFhNwk0F6rYFzCAHHeqeU3Iu?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f96b80f0-f326-4a90-91cc-08df3b470353
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8179.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 14:13:49.6099
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Mo6K/PypW9csTNDofDtwePb0bM7Ukvphu19oUemDNTfa3u+UFP1oxlmY/0kHsDe1OWg2HeiWZE3cJLfb7P93qsWLD8UWjcT0Jxrc3PxFtQMTwvOlaKwuomEmzjM23iAm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB11029

The SIUL2 pin controller provides the pin muxing used by peripherals on
the supported S32G boards: the S32G2-based S32G274A-EVB and
S32G274A-RDB2, and the S32G3-based S32G399A-RDB3. Without the driver
some peripherals never finish probing and a defconfig kernel cannot
boot to rootfs on these boards.

As the driver is required by every supported S32G board rather than
being optional, make PINCTRL_S32G2 default to ARCH_S32 and keep the
user prompt only under COMPILE_TEST.

Signed-off-by: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
---
v3 -> v2:
- add the Signed-off-by tag

v2 -> v1:
- list the S32G boards that need the pinctrl driver
in the commit message
- drop the v1 arm64 defconfig change
- default to ARCH_S32 in Kconfig instead

 drivers/pinctrl/nxp/Kconfig | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/nxp/Kconfig b/drivers/pinctrl/nxp/Kconfig
index abca7ef97003..d6d97c944b94 100644
--- a/drivers/pinctrl/nxp/Kconfig
+++ b/drivers/pinctrl/nxp/Kconfig
@@ -8,8 +8,14 @@ config PINCTRL_S32CC
 	select REGMAP_MMIO
 
 config PINCTRL_S32G2
+	bool "NXP S32G2 pinctrl driver" if COMPILE_TEST
 	depends on ARCH_S32 && OF
-	bool "NXP S32G2 pinctrl driver"
+	default ARCH_S32
 	select PINCTRL_S32CC
 	help
-	  Say Y here to enable the pinctrl driver for NXP S32G2 family SoCs
+	  Enable the SIUL2 pin controller driver for NXP S32G2 family SoCs.
+
+	  This controller provides the pin muxing and configuration needed by
+	  peripherals on the S32G274A-EVB, S32G274A-RDB2 and S32G399A-RDB3
+	  boards, so every S32G defconfig build requires it to reach rootfs.
+	  It is therefore enabled by default on ARCH_S32.
-- 
2.34.1

