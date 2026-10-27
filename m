Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.65.12
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793103164;
	b=MneKSYvoGHiHocdRh1Fm7ESvWYvNoPEBEbjDU4tX4XqM45lljDoO0JnTC+XjWdWLt9GU
	 XhjPvfBozv/VHR7xh8T62vDfmuiCdy9riltlqxLvGA796bfrI2YdRsPR/aDx68C7ZvxL+
	 TRNYfwet+E/tNA5iggblSHyqleLurH6Z1BYCW2YDYwCaIBZzasQZgsgytnFC/pwsLnhbc
	 pY7we6l5giehlibHiBKvtSk1CE8Wt8Yf9fVojKwG4FJzlookINvDq8Nxu/2yVkXt2JNRY
	 EPn4HaXkFq0EJVxcM22A2TnADx5mk32lFxUZuDq2VX3n8a10UMsC+80tVpYRscb9NLQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793103164;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:Subject:Date:
	 Message-Id:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-ClientProxiedBy:MIME-Version:
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
	bh=M5/9EsZpwWi6OknyfntSInNG/ffh2spM8H7QmZIVqa8=;
	b=C3MPLETtN09AcbqaiwdqUwfZ8ZZkYg1GhB6Sdf59r5eEDrNp7Me+4zlj/XkwD5jXWrO9
	 dEdgPn6hEZkO7pScQDuoy42/NugWMIlpUkIl6ca6bruKywqa2y+8o70767UFwQHLjGW7P
	 en7WjBg22ZKniEPMRB9Q1Cwy8YrCMF0GJLg5rylpT6+mHLKkGDdw9M0LAGu49nA7OYBV3
	 ktxPy4r4DxyQ3zFxoSN37LiCu3VJthUMovQ79YH1tF+e5CM2v0sci+BbtqwBSxh+yW9e8
	 8qBHN9o0S3d5Iwdcs7dWXR3yBSckyJw6UThBNFQB4BOLxJDjnudk1Pj0a4U3jpucxiQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=x2QvveHA;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.65.12
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011012.outbound.protection.outlook.com [52.101.65.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DF11606A31E;
	Tue, 27 Oct 2026 12:12:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3DF11606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=x2QvveHA
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GXquwHG9RJM2vAw63GzHjmR2i50G3KRxsaRDVkCslfndSGkmhK5S+b6seoLj5SsaemGKrI8GiEYYOPVnaW0v4WnWtrGk2Xi0wi9lUSJcs8Oyn7FOrZrAnY43MP2d5uTQCidqWVVGyeKz8vctG89Cpq+Bxkw0A859cCiDNVworL3WbCrZuIFuXKcuBZhv0Wo1ZOMr084L59XRy3ezIj/BBBKLxt5/K2wVb/82zdjhZz+M7Bbd5qHj2WfB4+EevgoHNCkKDQie6R6B44cqSNKcUlYn9OByx2dYPi1EPYMUnRj2BzYbSRJLgRJ63iKr/VYKdc3ZlwlYJQiKqPWSP6IbCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M5/9EsZpwWi6OknyfntSInNG/ffh2spM8H7QmZIVqa8=;
 b=YAXWVVv4JuxO7JoJpqDz3waJwzLdcsW/4cp1/z1dr6MdRfb3YsWxGEo6ozX5tZfZuZFT3JMBx7ftWC1CGYQoV6F1fNMgEPOVWuT39oHxSzS7KzeKlsPp5v4BjdwQFxCq+9QlLPN993ahtQWEuMw4i/wt3FUCQkpevc6OY2cG86H8Nl+856B39ytMv1vKLKgGM8E7VhX7wzJwtfK2ZhkfpSondVXCxKTEO5hZGyw1iZk3Lia0zvfDPPwArP9I1QvOWRCQNdd4znvrx/+lYCjH5dFtSwYdA3nnFpXdq2oCLRLIwv21lgvLR07zKGNehFdba4Xu6XEhHrMVR+ZZ4A7ooQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M5/9EsZpwWi6OknyfntSInNG/ffh2spM8H7QmZIVqa8=;
 b=x2QvveHAM1JIXKdxKQaM+ednZSmS90b/ITvpP0/cCeiYaoAUJSkr8GkjA3QI4eyRjLxX3oXCcRxa9fEcidRmvAebb1CgFjf/A7yJRHH5/P+ZPgdCEk6PyGNjLHeWKb6KM4+tbObnzvpPaLhb+SmEJ+5llscsBwnaPcYRA8LXVGhyZNgfdLXRqQZFvti/hveEXG1C053dXnH0sc3785peKCF2tyjFHSudM3aDK9MwitWEuDBmxw5TNdvuwzYVrRzwDimQxbave3ZayiTwaxkolJtvY/vwW+63Fr4pLR30x0Ksjg4AqKRWABlL+j/QdjNVRkG1sny9kDU/kRCBtic4dQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by DB8PR04MB6827.eurprd04.prod.outlook.com (2603:10a6:10:f8::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Tue, 27 Oct
 2026 12:12:40 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0546.021; Tue, 27 Oct 2026
 12:12:40 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Subject: [PATCH v7 00/12] gpio: mxc: probe cleanup
Date: Tue, 27 Oct 2026 20:09:27 +0800
Message-Id: <20261027-gpio-mxc-cleanup-v7-4-v7-0-7b602d70c149@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAHeU4GoC/yXMQQ6DIBBA0auYWXcSoRWiV2m6sDDoGAUC1ZgY7
 15al2/x/wGZElOGrjog0caZgy/QtwrM2PuBkG0xyFoqUUuNQ+SAy27QzNT7NeKm8YFOCHW3JHX
 TCihtTOR4/3+fr8t5fU9kPr8ZnOcXbl6CkHkAAAA=
X-Change-ID: 20261027-gpio-mxc-cleanup-v7-4-f1163de27591
To: Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Peng Fan <peng.fan@nxp.com>, Andy Shevchenko <andriy.shevchenko@intel.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: SI2PR01CA0016.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::20) To AM8PR04MB7874.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|DB8PR04MB6827:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f15f83e-4ebc-4678-2ab3-08df342398e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|23010399003|1800799024|376014|7416014|366016|18002099003|6133799003|11063799006|56012099006|261026121527099003|261026140227099003|261021121427099003|10067099003|261021123027099003|261009223027099003|261009221227099003|261022075727099003|261022105027099003;
X-Microsoft-Antispam-Message-Info:
	a9ugTQgoJY6S5eGRMXbXr14XBzf1xKRQV8dw5FcFTXaUso58gt4hnOajFyNdPP8M6O72A/nTEOZ7gIbarQTa39m/vwmFz5pffo6eqw4ODnRWZXVdAS/hvJ+uEIY5OeHWhE2MfezrJOqiUwF1uRQW6gPVKG0il2lj0K9FpqEjJMeSY5W17AyMbSiuNMu+Zd1d7u0+JuzMkS6QkdZTeJ1nbm3lbsTOPIXtGp+sNgS5wSGJVHCx1J6CYNPydKyiXHNkSihA+bCwbMXRguQbdvQHFC8PmQYri7ptnnammok5eAZjPwwlKYPk+yYTDG0gSHXfIbbwCtAoDOEB/0bnTKQHJiFRFqc7f3TU9NEP9UgVhM/bZekBHazj4OxLO1oS26Fpx+leh0tOzf4R1IhWwhqQu9YJuU2TT16xDRsko6KsZUsncY+avjtEUCS77u8OLNq6VO5zgpGjozxmHr6osD8SsUvhHUzzD72uQnhlW4X0kEI48uFjEITOo+orSFVWjOMQiN725KZdNbO4ikBP14hYeAA7REy3bzvm0m788GdwzMIhqPsmUHVebgpsi3fUUqeCinYnCeCQQMNJDEBR/vCLe8x1XQOPi39OUyi1uTq94WY2iQuwl8FptMmFvfWG9b/L
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(23010399003)(1800799024)(376014)(7416014)(366016)(18002099003)(6133799003)(11063799006)(56012099006)(261026121527099003)(261026140227099003)(261021121427099003)(10067099003)(261021123027099003)(261009223027099003)(261009221227099003)(261022075727099003)(261022105027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SWtZclFlcmJUeURxSVFteVlDaW1hdjBYSEhvRkFvWW44cGVHa2t3bExvV09B?=
 =?utf-8?B?cGtsQjM3WkdxMXB6REZMeUQ1WU9KZXFiczVzVFpScHB0WHp3cXZIZy8zMnFW?=
 =?utf-8?B?YWZZOUQyMnNvTkgwcVVCZXUzd0RBZUtudmJyRUE4R1E4M0p6TXpZUkJCT2w5?=
 =?utf-8?B?UmNEZGZVQTh4N2ZOWGRJdW92aVdmYkI0MlNEZ0JRWFduV0FDRVpPQjJ4S2Zx?=
 =?utf-8?B?Y0tKSDlTZnBELytxa0c0RG5sYndtZmlvQStGWTFaWXh5eTJvSXNuQ3hQSWhz?=
 =?utf-8?B?M1llQk1Dc1lvR290cFhvMWZkVmxoems5NWwyUTRRT2VKVWEwOGJtODBPemVD?=
 =?utf-8?B?UUk2ckN2d3dWQlAwYlFRZURBWWsxNURMWEZSNjZGY0haQUQvQmhrTjI2QXp4?=
 =?utf-8?B?U0hwemhyR0swR3prbTU1T2Y2V3pPaGUrVjlCK1JEZmwyNUppd09aUlo2NjQ2?=
 =?utf-8?B?QkxpNTlqL2FPV0RGa2RUWG1VUGsrRWxQd1NKQ2UxSmwzbUwxci9IUXd2VG1s?=
 =?utf-8?B?eG5obFdWUWhLRXdCWGp5eEwxeGFNbG5LTm9wam91N0t5TW1GeWhQeWs5SFg2?=
 =?utf-8?B?QWMwQVVsSS9vNkp1ZjBDV2lNZGFSMHFlMVp6bnhSbGw4aUlOMXhkdHgzNTFk?=
 =?utf-8?B?N3JFcDJoODVvUG1KYzRkckhFcDJLVkNiUFBUUFNVTndySmsrQkNwcTYybTNk?=
 =?utf-8?B?MFlUS044Z0VsWlBwait0WkFHWUdVbnFpdWhJZHQvOThRQzVVQ0MrNlUxSUh2?=
 =?utf-8?B?c3VpVVpZeGpFT1J1ZU5nei9wNllyVGx5QzdQMGNvZTNPUUJERWtGNmRENjB4?=
 =?utf-8?B?eU95WU1ibkdhanJBYTZNWUtuTVlZMkJUSENvcDJ1MGs0emhFU2NQL295L0ZM?=
 =?utf-8?B?VWtLbVBuM1UzZ1U5bkoxdlZzdnpMQWdMWldpQTROODFSR0t5WU0wR09rbm1z?=
 =?utf-8?B?NmVLTkl4OUlFWjRnK0JGTTA3K09GdHM4V2ViMUFSL0tobmp1LzZDamRBMnFK?=
 =?utf-8?B?TFl1eFJLNWFDS3kyUDhadHlaMGxac2I1TFgyb3VYbTdoazdocGpZUTdicDVG?=
 =?utf-8?B?WnJ1dGRNeFZFS3NhenpxOXpJbHdXQms3SXYwaHM1RjlhZEZoWElmVmJ6NjBv?=
 =?utf-8?B?bXdWdGVxb0FXck5iN3ZUL0o4YzZHTURObnZwemQ1M1RmZEpVRUx1WXRkYzlT?=
 =?utf-8?B?ZlpORFVtNnBBVE1TWVJvVW1sOXRrRXRCOWl2OXN0b2tnOWRCL0FOdS9vbkFM?=
 =?utf-8?B?aFNRb1pKVVJsOC9ncHR4YzRUMmE0UWhrWnlSYzNjUXRUNVVBdFNEOTdOVjNI?=
 =?utf-8?B?eTkvc2lVcFdtNVFPQVlndGVPNzZZalNCQVlWRHNuQ1NVSlFJaDVBSTVoVk81?=
 =?utf-8?B?eE9CQ2drdk1CWlljL1ozcXY4dnVWMmhqSVFldWw3MHpneXpCNDZueTdxaFU5?=
 =?utf-8?B?eVJyMjdvL295QXNNVHRQR09RT2FkeEN5MjN0Vy9zZkliWTFTdnB5MURkNkdt?=
 =?utf-8?B?TDA1Y1Y3Y1daT3VucEtidzZsQTh2M0pwZEJscVVUTjh1c0NEc1c3SDA3Z1d5?=
 =?utf-8?B?WVhyM2EzbjhPYWJTYWphYmx5NVFYNk5Ud3IyRytzK2dQREZFYjhCU0FxWGNV?=
 =?utf-8?B?WTNSTjZqY2ZVdVl0V2hnZUl1dll3RTdLZ0pYcjBwVUNRUG9qNTBMRWhyQTEr?=
 =?utf-8?B?VWpYb2pEOURsRUx6enZ0OCs5UkVQSEpJUWdGWHhQMGs3RlZ1T05xamZSN0l5?=
 =?utf-8?B?VHNDbE9ERGM5RW40K3RvNytTRGR6bGVTbmJxVnpPdnI0eVF2VmVkaTYyT3Rh?=
 =?utf-8?B?MjN3M2gvRVVzSWpwQ2p4b3hrVTFPZUpkb3hKd1kwcXJTSjNaT1NUSDhNQ1NR?=
 =?utf-8?B?bGx1Y3RDWUo3QjNVWS9SRlhJYnZXbkY5aVpyTVk5S3pUaXRlU2RES3JCRzB3?=
 =?utf-8?B?M290NWNxNFBTdkpDNHNVMVN5ZlpvSVhmNlZJNWtvcXlWRk5iK2VhcHlDZzNS?=
 =?utf-8?B?UUFNbkh1VHhBQ0ZqSGhrRlNzeVJ1aHhDb1A4bWNKeUNlQkhNM2FkaGwreWgv?=
 =?utf-8?B?V0FRc1FjMGJ2MWhYMzNMYXd3OGdDcTU1eEJpZUtac2pQNW1reW5lNG9GQzl3?=
 =?utf-8?B?ejVuTkZ2djQ0eEZzcklEaVdpOVRxRGEwNGcxdWZaMlFMUXV4MzZLSTg1STMz?=
 =?utf-8?B?RjQ0bzEyc29xRGluZk13QktZdkpjK2F4ZXRkVm1kdzJGM3ZXVis0K1kreXlO?=
 =?utf-8?B?d3ZPVVdENTRWWDhyUlN1ZkZEcGJwZlhqTG1iaUdQaHJERHU5Mk8vZWthOXBE?=
 =?utf-8?B?a2kyQ1lBamRaaXY4N2xIcWROOVplekc2TDlnVXJRVmQ3Ymh1N3REM1ZaY3lT?=
 =?utf-8?Q?aOgL91JnAom057Snva+sHbm7UCkeAERy2LgVl?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f15f83e-4ebc-4678-2ab3-08df342398e0
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2026 12:12:40.6469
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0q7DkjqxN4FAQtgfGYuNyT0kqipx+qziDnbr6tXIrBqqRdcYhdup5Rx+d0Zbo1nJ/DC4VWXfjxz5WD6q6SCtl+bhbwkXmYG6Dqp5aEAZqGVDSdKQbRJ8VwJRhLFucYwP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6827

This is the cleanup portion of the gpio-mxc series, following the bug
fixes merged in [1].

For Linus's comment in [2], I will use a follow up patch set to
update pinctrl-imx and gpio-mxc.

Patches 1-2 are wakeup_pads cleanups: consolidate enable/disable_irq_wake
into irq_set_irq_wake(), and use for_each_set_bit() for the pad wakeup
iteration.

Patch 3 fixes bare 'unsigned' to 'unsigned int' per coding style.

Patches 4-5 replace runtime of_device_is_compatible() calls with static
per-compatible hwdata flags, eliminating repeated string comparisons in
the suspend/resume path.

Patch 6 introduces a local dev variable for readability.

Patch 7 uses a driver-local cleanup guard to disable runtime PM and drop
the probe-scoped pm_runtime_get_noresume() reference on error paths.

Patch 8 converts the remaining probe resources to devres.

Patch 9 switches selected probe error paths to dev_err_probe().

Patches 10-11 are cosmetic: MXC_ICR macros with icr_update_edge()/
icr_get_edge() helpers using field_prep/field_get, and BIT() macro for
single-bit shifts.

Patch 12 adds a maintainer entry for the driver.

[1] https://lore.kernel.org/all/179206687877.10309.9401675786609225009.b4-ty@oss.qualcomm.com/#r
[2] https://lore.kernel.org/all/CAD++jL=tKnT0qr5chD-fhxgTM-f9kcdFRsKVBbbqionBp9iTyw@mail.gmail.com/

Changes in v7:
- Drop the three bug-fix patches merged separately; this series contains
  cleanup patches only.
- New patch 3: fix bare 'unsigned' to 'unsigned int' (Andy Shevchenko).
- Patch 7: combine pm_runtime_disable() and pm_runtime_put_noidle() into
  a driver-local cleanup guard, so runtime PM is disabled before the
  probe reference is dropped. Keep the cleanup helper local to gpio-mxc
  instead of adding it to pm_runtime.h.
- Patch 8: convert the remaining probe resources to devres and drop the
  devm_pm_runtime_set_active_enabled() conversion; runtime PM stays
  non-managed.
- Patch 9: also use dev_err_probe() for the platform_irq_count() and
  devm_clk_get_optional_enabled() failures, while leaving helpers that
  already report errors alone.
- Patch 12: add a MAINTAINERS entry for gpio-mxc.
- Link to v6: https://lore.kernel.org/all/20261011-gpio-mxc-cleanup-v6-0-cb47ce2ad758@nxp.com/

Changes in v6:
- Patch 9: use retain_and_null_ptr() instead of no_free_ptr() to disarm
  the pm_runtime cleanup guard, as the return value is unused (Frank Li).
- Minor commit message rewording for patches 10-12.
- Collect R-b from Frank Li.
- Link to v5: https://patch.msgid.link/20261010-gpio-mxc-cleanup-v5-0-1e59e6ddfa00@nxp.com

Changes in v5:
- New patch 2: fix both_edges race using atomic bitops (set_bit/
  clear_bit/test_bit), prompted by review feedback on the BIT() patch.
- Patch 3 (wakeup_pads fix): split the irq_set_irq_wake()
  consolidation and for_each_set_bit() conversion into separate cleanup
  patches (4-5) for bisectability.
- Patch 7 (pad wakeup hwdata): renamed MXC_GPIO_IS_IMX8QM to
  MXC_GPIO_FALL_EDGE_WAKEUP_BROKEN to describe the property, not the
  SoC.
- Patch 9 (new): use __free cleanup guard for pm_runtime_get_noresume()
  balance instead of devm_pm_runtime_get_noresume(), which would cause a
  usage counter underflow on unbind due to the double put (devres +
  success-path pm_runtime_put_autosuspend).
- Patch 10 (devres): dropped devm_pm_runtime_get_noresume(); the __free
  guard from patch 9 handles the usage counter balance.  Fixed stale
  &pdev->dev references that should use the local dev variable.
- Patch 11 (dev_err_probe): fixed &pdev->dev references to use dev.
- Reordered series: moved "use local dev variable" before the devres
  and dev_err_probe patches so the local variable is available.
- Link to v4: https://patch.msgid.link/20261007-gpio-mxc-cleanup-v4-0-c9f5a8b50df9@nxp.com

Changes in v4:
- Just a resend of V3 with below changes.
  Add R-b from Linus for patch 10.
  Update commit for patch 2 and drop empty line and separate
  for_each_set_bit changes into a new patch Per Andy.
- Link to v3: https://lore.kernel.org/all/20261006-gpio-mxc-cleanup-v3-0-129f93302a90@nxp.com/

Changes in v3:
- Patch ("gpio: mxc: convert probe error handling to devres"):
  Replaced pm_runtime_get_noresume() with
  devm_pm_runtime_get_noresume() to fix a PM usage counter leak on
  probe error paths. The non-devm pm_runtime_get_noresume() was not
  balanced by any devres action, so any probe failure after the PM
  block (e.g. -EPROBE_DEFER from devm_gpiochip_add_data()) would
  leave usage_count permanently elevated, preventing runtime suspend
  on re-probe.
  Dropped the explicit pm_runtime_put_noidle() on
  devm_pm_runtime_set_active_enabled() failure - the devres
  registered by devm_pm_runtime_get_noresume() handles the balance
  automatically during probe unwind.
- Patch ("gpio: mxc: use local dev variable"):
  Keep of_device_is_compatible(), only focus on switching &pdev->dev to
  dev.
- Link to v2: https://patch.msgid.link/20261005-gpio-mxc-cleanup-v2-0-bdc3afbb35e2@nxp.com

Changes in V2:
- Reworked compatible-string caching (V1 patch 3) from probe-time bools
  in mxc_gpio_port to static hwdata flags with per-compatible data
  instances.  Split into two patches: one introducing the flags scheme
  with MXC_GPIO_HW_DATA_COMMON macro for power_off (patch 3), one
  extending it to pad_wakeup and imx8qm (patch 4).  (Frank, bot review)
- Replaced devm_pm_runtime_get_noresume() + pm_runtime_set_active() +
  devm_pm_runtime_enable() with devm_pm_runtime_set_active_enabled().
  Keep plain pm_runtime_get_noresume() (non-devm) for the probe-scoped
  reference to avoid usage_count underflow on unbind.  (Frank, bot review)
- Replaced irq_domain_create_legacy() + devm_add_action_or_reset() with
  devm_irq_domain_instantiate().  Squashed with the PM runtime devres
  conversion (V1 patches 4+5) into a single patch (patch 5), since the
  goto labels cannot be removed until both resources are devres-managed.
- Split dev_err_probe() conversion into its own patch (patch 6) for
  bisectability — patch 5 uses bare returns with correct error values.
- Folded gpio_set_wake_irq() assign_bit simplification (V1 patch 9) into
  the wakeup_pads fix (patch 2) where it belongs.
- Used 0x3U (unsigned) in MXC_ICR_MASK() to avoid implementation-defined
  behavior when shifting by 30 bits.
- Replaced linux/of.h with linux/property.h to match the
  of_device_is_compatible() → device_is_compatible() API change (patch 7).
- Added return-value checks for devm_pm_runtime_set_active_enabled().
- Fixed stale error code returns after devm_irq_alloc_descs() and
  devm_irq_domain_instantiate() in the devres conversion patch.
- Link to v1: https://patch.msgid.link/20261003-gpio-mxc-cleanup-v1-0-dad728ce27f2@nxp.com

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
Peng Fan (12):
      gpio: mxc: use irq_set_irq_wake() to simplify code
      gpio: mxc: use for_each_set_bit() to iterate wakeup pads
      gpio: mxc: use 'unsigned int' instead of bare 'unsigned'
      gpio: mxc: replace of_device_is_compatible() with hwdata flags
      gpio: mxc: convert pad wakeup compatible checks to hwdata flags
      gpio: mxc: use local dev variable
      gpio: mxc: use __free guard for runtime PM cleanup
      gpio: mxc: use devres functions to simplify probe code
      gpio: mxc: add dev_err_probe() for error paths to help diagnostics
      gpio: mxc: introduce MXC_ICR macros and use field_prep/field_get
      gpio: mxc: use BIT() macro for single-bit operations
      MAINTAINERS: Add an entry for gpio-mxc

 MAINTAINERS             |   8 ++
 drivers/gpio/gpio-mxc.c | 295 ++++++++++++++++++++++++++++--------------------
 2 files changed, 181 insertions(+), 122 deletions(-)
---
base-commit: f1ac44c32cba88ad65dcecd4a279661d14e93651
change-id: 20261027-gpio-mxc-cleanup-v7-4-f1163de27591

Best regards,
--  
Peng Fan <peng.fan@nxp.com>

