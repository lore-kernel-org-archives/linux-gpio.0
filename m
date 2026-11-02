Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793663309;
	b=cNboSUpj3tR+USVI0dM7APGSjoIpGNGgdGIrvvp9l5pK7Ez3PsHirVr+406J64s8U1Qy
	 ESG7t4ELEa9Q1FJQmgN0rBjBpkCaIDUflxn3MY2S3P38Y9kgHLKjhh6/3FQbJJ00AHLYN
	 r39hixVoM8HkiIHs0e9PZuh7k/qc4T6d4OoNt5h2JSbP9Lc6tYkoIkxzTXOOSdLO9PG65
	 /+sZz6MX5/9Bw+SR2PXMt8f2IePhaQZsOdKMSelebNnzfzqu2W50rP31RTDPJntuUwvB0
	 p1ENDj42jxZ1pbs/hfhbvEgJ1U0B3bWSFrTlpP/lcBnePqNYtZvCiUROa4Znvqp2zGA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793663309;
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
	bh=9mnMYM+8YJOMil47wR8Yzg99Y5U1P46zE2Ux13yx0wI=;
	b=uWwk4L0KWNGZWH0okhN93QGdCY0fdIzaX46iHHP8dlWes/7RGJABtKaweJPb8AF18sE4
	 VJqRwodU2o0JFZv9go1ftPEqaDBTYCP6RfBzSZ3lAv8vHIk1yJQYml57kgfBGVlORsnGJ
	 mednSDKsVfzidc02SmnjrRNmoCyhG6/1TGFkYrFYicWKrcmU77fRG0ljYku0iAntdWCOr
	 /2s6awqPvbvWDHzETZZpvfoEIA1YgTT4oOMxCG7iNBv8FRE6wCHYwIP2NnETqo0CgWd/2
	 M9NfZ94mFOAB5pQHJHSU+fkc+dqsFgJNViAQZiSc06QdjfH03JeC+Gpk+EKFKs/XCdQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b="XPtt5/B4";
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.52
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011052.outbound.protection.outlook.com [52.101.70.52])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BFC3606A329;
	Mon,  2 Nov 2026 23:48:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3BFC3606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=XPtt5/B4
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dODDjiqY4b6FUb7NYJEvMWHNp4APh3IeYXxAt0Mgvsh9VClKsr/dy99EbbKH1HAAKsaaxS7NTv2Pv/lCphikzDgRW8ScK8LNZWjQ3ktHVagSwA9jllXC4hSUKCKM9L5Uolmt9I7V5fQgQKRQBy4hIXezyCJflkMY8Bs+VbEPRjfiraAz7GQxTPHwXF7X5L173Oays1qYbUIuCAuuG8msdh3msIAo0Nf0sdWs3pKcaqjWeWzqCtrjqt0XaSTIXZih8ysiSl6S22mJDiN8/vnBOJtqyanyB/MMQ9nOGxNzztotRadS1rJB/V6uL/o6H39bp7djmY2ZBZHI0MhrdpzM/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9mnMYM+8YJOMil47wR8Yzg99Y5U1P46zE2Ux13yx0wI=;
 b=vymiE0PkZEdL9/vQAOZ5vQpwZq8tNAxKu6Ezgc3488iefd/kkb/cY9xeEL3riTVbQF9tkSEN5etEx5FgnAyq9q0NBnrgwBIaOZUhBWooyuO/tqOV/wg807+y7SF8VQaO6EyELgRB5fqFKSjr6usWiAYKAQ2GX/AMpznlECfRvuyj2nPkmVSYVnI25Zo28FYsyCaOPXXTGFbONq/HcLyRvIxdP4oSpyqcwOOOVlvnT4WKvUu9l9aapw21S+TIT0vXU64VwCeX3Fj0D37N8spo8E/Wqw8GjEH2XKYY6MRzd6nxcivmelptVj26Me6KWIcwKxzDsyOxXcTHk1DoDhld0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9mnMYM+8YJOMil47wR8Yzg99Y5U1P46zE2Ux13yx0wI=;
 b=XPtt5/B4EFKhkn63JLg1lgQWgqWcafBV20VLdz53ZOcuyLdmS/1aibK4OqUtIY3ftHMRZ1Xvz7pXBcKuXXSYTWXDX4YOy51vOq2O0Ig10MbkcBdznG1OPDzNaNxKq/WqLwdllkRexDL1PF4iUEVAX360y5n+hL9PRovoTFRK5yXJs/yOmsp4WnxIxy5WSGr5ZHCCS8Jb8o5/izaObAwKzwQLQlSCbFLp6EHy0MKm4PwucAzL0y6k+6sUI4aJFlVdra9ZY9be4udvnBSxvlO0HatJ6aN2XfErge/OK3xbAOJSktBkZgo1V+A2/6upHift2B6rDlickHjz57gQ8LkBcQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by GVXPR04MB11585.eurprd04.prod.outlook.com (2603:10a6:150:2c1::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 23:48:25 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0569.011; Mon, 2 Nov 2026
 23:48:25 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Tue, 03 Nov 2026 07:44:13 +0800
Subject: [PATCH v2 09/11] arm64: dts: imx95: fix gpio clocks
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-gpio-vf610-fixes-v2-9-7c71fb36e184@nxp.com>
References: <20261103-gpio-vf610-fixes-v2-0-7c71fb36e184@nxp.com>
In-Reply-To: <20261103-gpio-vf610-fixes-v2-0-7c71fb36e184@nxp.com>
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
X-ClientProxiedBy: SI3PR03CA0011.apcprd03.prod.outlook.com
 (2603:1096:4:297::6) To AM8PR04MB7874.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|GVXPR04MB11585:EE_
X-MS-Office365-Filtering-Correlation-Id: a6290358-1b3d-42ba-6f6e-08df393bc94f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|1800799024|366016|376014|19092799006|23010399003|10067099003|22082099003|56012099006|261102123227099003|18002099003|261009223027099003|921020|261021123027099003|261021121427099003|11063799006|261026121527099003;
X-Microsoft-Antispam-Message-Info:
	N+1L3nKoDZdpmguVZFOKwhiVZcsZDjlzzm1ComfifeZR3B6heV4bcHgvWShDyuVjCrmIg7EJidH8tXUbl/+fbw+qWX+ZogC9e/KR4AZHkW7hkvNdwq/8s+mOT7K1i59+MjcEf3EaGBSf63Ra8UfM48diBHu9QabFYGc8oF0RyBiA3AaEzoJ0szrTb47a9sBaflW7gEHiy3vEQkxV9RfmA34uT4eIpcs27R+tyz9r5p4IIrnCiTxxkWOUtZfTU30Xo1mW43H9H4UZtkJpFX8lc8tw0KpJfWwydZUOUhCqOqFilFHHSstAir1QYMmkiBA8+gP59ON/rPyeWYs6CADDbwr/JRlo/TuGvufwQNoEqnOOqPGcVxh7qtrsUTmmJbgOMYZdbysuvylfDzMSTDmxvYHDdcIl4/kW4UtrRCu8abGi41QbcZmg77X2Hb9rUUK6Ya4+gUFow+iB6BgG+RmG46zShX+HXwis28R/6zXC8BW3vNql046gciA3Li5oRIXyryMUWXZ+BoreOOzwHLmlJBavkgu6QSEKwglz9CdCIg8FgrURDHeBZNRe2wOqqijlUSi5k7XUpJiiVZFgx5E4Ejh7Kba0UG53nwhLHwSAz7/oFEZialka8x9kYyGyP4ve2nQD44VVLf4UmxFznz0CZJBwtJc/7DcAFZMTKR4U50kureoRTa9VEvG7ByLMIqwK50Kd9VW4aTbQOJcb0eSfSA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(366016)(376014)(19092799006)(23010399003)(10067099003)(22082099003)(56012099006)(261102123227099003)(18002099003)(261009223027099003)(921020)(261021123027099003)(261021121427099003)(11063799006)(261026121527099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bFZjM1doRzcvR3VhWjlTNVB3RTdpbUp3NHdzSklSNDg4QlNKb1lUT0NrL25H?=
 =?utf-8?B?T1JGL1VrWXhRTUpod2QzSWlNWjJtaU1QeGVzK3ZVc3gyY0dwb2hyV3liM25X?=
 =?utf-8?B?TkZzVmUxTzhSMVY2ZkV3M0VJWGdob0VMY1VhTFFYWjNqazdvWEV2UDBBRURj?=
 =?utf-8?B?MUxRd1FPT25mUlFDMFZ3S1dKVGZxVHBOUkRWWGhiUGpmV0VxVXkvNDVVNWhl?=
 =?utf-8?B?TlRranZiOVVSUHkzdVBHQW5udDhRZFZMUjR1ODlvRmMzcXYwUVJRUTZTSEt5?=
 =?utf-8?B?TUxOMjJmRURBR3hScVpkd2NuNlNyVFNjTk5COVMzYkJtQUFyRmhldkhkZmpR?=
 =?utf-8?B?Z0UrUEtyaGlkN0pVdnlsdUxwQkc4VW9KeDBtenhMSjRWZTNSNmd2RHZ2ajNW?=
 =?utf-8?B?L0UzSXVHc1FhMFM3ZlVXcjk3UjJETkYrRUtZT0pscC91d3A5ZVp4UmxUOTBE?=
 =?utf-8?B?K0dsck1tZG83K2xOZGs0aTBLQWtoaVJIOG9ubVlKOEZNZ2ozajhDWDdFZjdS?=
 =?utf-8?B?czQvaWRuVmN1TEROTEJkakRRM1dIWXdTbU5RSGJUVlh0Zms4cU13TCtYNnpn?=
 =?utf-8?B?SWsyKzJwTGZvWjNOREt2Y0JPVVRMYnhaMnhOZzRxN1EzeTY0TUJOYjcvcXda?=
 =?utf-8?B?ZzMxckJodU5JQlFqdTlVQ0drVndsb0VBaFdLYTRJL21QMkIzWWZwNHFqZWlH?=
 =?utf-8?B?ZXBvS21vd3lVNnJkS0FsS2ZFV21uc2tvQmx2dXJ2TXNuVjF4c1MrQjBXSStR?=
 =?utf-8?B?cEhXckVDempzSTFNRy9ORTNFeElmR2dxcEx1U0I1U0NqOHJyZUZldDNqNktl?=
 =?utf-8?B?aWZ3ZjVXTlgzQ0Rta20wMEg2Sk5DVVdrelVmZkE1b2syajVxRmJ3WVdkV2tv?=
 =?utf-8?B?UzZkTnlZUnkrRWMrb0hGdHNvN2F2WjNTdlFxUUcraktCQ3Y0d2pzSEZBY1li?=
 =?utf-8?B?OEJxMG1FQ29FbHBHcGRHRElXa25BMTkzVGs1L0tBZnN6R1QvK1kydkYyeWlD?=
 =?utf-8?B?NXN2Vmp5R3RVdlQxSWNQZURUbkdvYnFNYUVhOGNYVmxXSzRPV0JUQXNqb2N0?=
 =?utf-8?B?R21JMkQrTjZmSXFYajUrODNLby9DSTJabXF3ekZINWpGRk0yUU9lUjc4YXhs?=
 =?utf-8?B?ZGZFL3djL3pVVCs0NVFUdWtOVmhLNWFKdUMyUkpFYmwvRDhTOEYvVVhRWUI3?=
 =?utf-8?B?VVZHLzRkYzdWRXEzdm5jaVk2VmM0VlgyNis1Nk44UTVqNXVnWHlLbkxIMGdG?=
 =?utf-8?B?WnJLZFUrZGFRUFBGbGdDU2NUamhrS1JSSTRtZU1zblgwUkw0SS9VaVNtN01D?=
 =?utf-8?B?N20zblhKM2prVVVFamJUS0tWSjJRWkRLVDNhaHdrMW14dUVlWHVlbVJlZnlP?=
 =?utf-8?B?MUtUa0JGUGhPQWltYkRrMGpZdVN1SHExVU5pZXhKenBDaXZXY1hpSjFSTTF3?=
 =?utf-8?B?S0VNU1FJNHVleEV3VnJPYzYxVDlhLzBxTkEwWGtRMDFWMEJaNjRCUXBXbkhU?=
 =?utf-8?B?ODJuR1lhZ05JczhNNTY0QVd5NElpbk9FbzNPR2xYcllIZXdWU0hMWHZ3eTNV?=
 =?utf-8?B?T1hJY2ZHeTNTd3JQREZxZmpFL1Y4aW83OThFeGNiSCtuRVRLR0ViTzNqYWNW?=
 =?utf-8?B?N1ZYLyszeG9uZVhEaERkNkhSWkVTYUtyUWUyQTQvWldLKzJ3bmpUVXhNMm9T?=
 =?utf-8?B?OWRDbHRqQWpxQUxRejBZOUVScVpvUWpUUnRQQjYrVlFIU1c2TkxHVkpzSXoy?=
 =?utf-8?B?N0wvMGI1Rnc4ZmZ0ZDU2T3hpeFJ1WGM5QXJzZDdJWUcycEptZzRpQ2lxYlpa?=
 =?utf-8?B?c1VXT0FtMnpPRG90bkVKUEl0OHNBSkdIajBiZVl2OCtqWHV4aStoRlJabWlr?=
 =?utf-8?B?ZVMyZjFkVWtJb21LMFZNL2p2SmNkaXFodmxlVWUwd3dsRkxnSldRcVZsa21C?=
 =?utf-8?B?NnpsMS9FN0d3Y3dlWWJid0R5bThZNU1aY3ZLVmVvcm92MnZCZjdRUHFkOC94?=
 =?utf-8?B?UHhndk9pYnlIaVUxYU1DNjB6SWNlV25jTUFxZldxZDh2QTdwOFl5TlZhVDIx?=
 =?utf-8?B?N2dEVjZBUkJQeEFTb00vL3FtSGJBZC9wa3IzZ21HTGlZN1hCeGdadkNlMndH?=
 =?utf-8?B?NW1FRVc3Q3B0N0hoYkIzWG5CcXkyU1dLVDJFTWxIVVVNQ0VOWlJqakZBekFB?=
 =?utf-8?B?dk4xMmhIbUVzWjUyS01GKzNTUlZxaEFPek8vSDY1WlJudTBMZG91eVBpS3hw?=
 =?utf-8?B?LzJkQ29pM0NVb1VEYVVxbGJ5Y2VoSUZmT0Vua09DQ0dHeFFsNGw1TVdvaXZv?=
 =?utf-8?B?MC9NNWpWaStIWWdjeElVR1dzVm50ZktORlFnbmM0NS9iT29IY2hCUEVhMmVN?=
 =?utf-8?Q?ukKFZ6bDbOjNPzAveCzcFWOYljOifGGai3YPd?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6290358-1b3d-42ba-6f6e-08df393bc94f
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 23:48:25.4452
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dWxAKKoMzHzN0snK5w1rga8+aZiKC0ZxqPDNAZ+xl8xFLTetZ4iW3GntzJQkNDoqz5qmQs20aiFuAk+33FFnaBDfzzl+O6vrGwwG7ZV2NUu7uYIyzleSLAGJzc4EnI72
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB11585

From: Peng Fan <peng.fan@nxp.com>

Per reference mannual [1], 69.3.5 Clocking:
GPIO receives a single clock, which is used for register access and
synchronization with external pin inputs. So drop the 'port' clock.

[1] https://www.nxp.com/docs/en/reference-manual/IMX95RM.pdf

Fixes: 5e3cbb8e4256 ("arm64: dts: freescale: add i.MX95 basic dtsi")
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx95.dtsi | 25 ++++++++++---------------
 1 file changed, 10 insertions(+), 15 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/dts/freescale/imx95.dtsi
index d20c2498b9aa..0398de491553 100644
--- a/arch/arm64/boot/dts/freescale/imx95.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
@@ -1300,9 +1300,8 @@ gpio2: gpio@43810000 {
 				     <GIC_SPI 50 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-controller;
 			#interrupt-cells = <2>;
-			clocks = <&scmi_clk IMX95_CLK_BUSWAKEUP>,
-				 <&scmi_clk IMX95_CLK_BUSWAKEUP>;
-			clock-names = "gpio", "port";
+			clocks = <&scmi_clk IMX95_CLK_BUSWAKEUP>;
+			clock-names = "gpio";
 			gpio-ranges = <&scmi_iomuxc 0 4 32>;
 			ngpios = <32>;
 		};
@@ -1316,9 +1315,8 @@ gpio3: gpio@43820000 {
 				     <GIC_SPI 52 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-controller;
 			#interrupt-cells = <2>;
-			clocks = <&scmi_clk IMX95_CLK_BUSWAKEUP>,
-				 <&scmi_clk IMX95_CLK_BUSWAKEUP>;
-			clock-names = "gpio", "port";
+			clocks = <&scmi_clk IMX95_CLK_BUSWAKEUP>;
+			clock-names = "gpio";
 			gpio-ranges = <&scmi_iomuxc 0 104 8>, <&scmi_iomuxc 8 74 18>,
 				      <&scmi_iomuxc 26 42 2>, <&scmi_iomuxc 28 0 4>;
 			ngpios = <32>;
@@ -1333,9 +1331,8 @@ gpio4: gpio@43840000 {
 				     <GIC_SPI 54 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-controller;
 			#interrupt-cells = <2>;
-			clocks = <&scmi_clk IMX95_CLK_BUSWAKEUP>,
-				 <&scmi_clk IMX95_CLK_BUSWAKEUP>;
-			clock-names = "gpio", "port";
+			clocks = <&scmi_clk IMX95_CLK_BUSWAKEUP>;
+			clock-names = "gpio";
 			gpio-ranges = <&scmi_iomuxc 0 46 28>, <&scmi_iomuxc 28 44 2>;
 			ngpios = <30>;
 		};
@@ -1349,9 +1346,8 @@ gpio5: gpio@43850000 {
 				     <GIC_SPI 56 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-controller;
 			#interrupt-cells = <2>;
-			clocks = <&scmi_clk IMX95_CLK_BUSWAKEUP>,
-				 <&scmi_clk IMX95_CLK_BUSWAKEUP>;
-			clock-names = "gpio", "port";
+			clocks = <&scmi_clk IMX95_CLK_BUSWAKEUP>;
+			clock-names = "gpio";
 			gpio-ranges = <&scmi_iomuxc 0 92 12>, <&scmi_iomuxc 12 36 6>;
 			ngpios = <18>;
 		};
@@ -1689,9 +1685,8 @@ gpio1: gpio@47400000 {
 				     <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-controller;
 			#interrupt-cells = <2>;
-			clocks = <&scmi_clk IMX95_CLK_M33>,
-				 <&scmi_clk IMX95_CLK_M33>;
-			clock-names = "gpio", "port";
+			clocks = <&scmi_clk IMX95_CLK_M33>;
+			clock-names = "gpio";
 			gpio-ranges = <&scmi_iomuxc 0 112 16>;
 			ngpios = <16>;
 			status = "disabled";

-- 
2.51.0

