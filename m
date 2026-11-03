Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.84.23
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793711470;
	b=ySWTfygmYb0U7Ca0MxEiGRFfdKqYn0Tl5Dq+PwmDEQ4a/dkl9ELZcdgIyhiJQgFhndd3
	 L7POR2SLkxOVq2UAF0ElCKwLkLE6c8V2q5TQRvgjojUSVtiB5JZiz/4rqsegjCeMMODoy
	 BT/xmL9ujrhQCoQUh7jt7Mc6KeIKy9LV8vnxBmBJr8RlFyIaDFkeDxzRw8CTJSdCLsnzC
	 F+BzdGoGCkm2bEPDeNsQHi6L52NaYkFgRtP7YNqjW0btOhZ7VMvDkZ0NmM5Ci4MdaYij9
	 pr4OMy75xo5fYARAaHYbS6p+l8wkZCFZ+Z7nCckIptCE1vMDpyimU42KAsHK0CbQW2w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793711470;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:Content-Type:Content-Disposition:
	 In-Reply-To:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
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
	bh=GNWTreyFpOnSI6ZMnmMb8NrlhmeTwlZ8i5zobDfSllg=;
	b=ZBSJVRs9V2O43VWbzvgSwaaDeEzeKy90l8WqRZXvxRrZXNoC3FvwuqD+xM1aTl87ZBp0
	 JGxDC5ZB/J8/J2jYvV2qhse/fcOrEKU+EdqiGeDcrNNjks35FB3EOi0XKqbgOKQOYqSRT
	 zGS0O3uclxb43ZaiLq91vKp9wUsjLLqG/z2RchugoJVCrqDiTF65DBY+aToUuoibIo0N0
	 hB6lkcpvvJKepSXvBv3A+amahnpc+Cw7qh11kRMrhugDeY5b0UIxdgDGnSuzZMd6jHQqk
	 +XMdfrc1JAp2qDYmoUa+0CKOvDjr6OlXIQu/v+PaTfp3U9mGhrXnnrEbuelTg7f3t9A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=uigMhrux;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.84.23
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010023.outbound.protection.outlook.com [52.101.84.23])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CAC2606D80E;
	Tue,  3 Nov 2026 13:11:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7CAC2606D80E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=uigMhrux
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KRYAngeDxRwvBGe8Dprw2hOSEpxS3OcrA0dIB6ThlhqVbHTdH2blYvMLqkY2nfE0c44oGOEQfZcc0F2ZneRQBSAibfrE9s7mtjZaoim6sHF9OBdgZpHPPPDwoSoYBxLbONuE+iPGGPZu4NuZucDyojwfxRe9EtKjVGzAgXMhGzbYucGJtqqG5yE53/VDR6IGywxwwymVgh9wXX2DK+qFJIAt0EVjm/PCVK+NZOGYr1b7vQBzz5lEsUf0de5IDlOlArb9KY01LI/ytiOGssDMWbr2YvbFnA8n1Ra4dADXRMLDSf1xpx3ECo8L+sCJfCmojwT3pIRk51I5XpaeOTOpwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GNWTreyFpOnSI6ZMnmMb8NrlhmeTwlZ8i5zobDfSllg=;
 b=ndFHjLmc2Rr8jgkmxJubAuC6MxQp6nyliW9PKW5SiILlR5XWc3o9dpFxazQEeXNnSNacgzrAdSvVe9F3+UCzU9dmj2mRbLdG984nMhO43HJX+zEStRDSn3AARr6vDnV/3vIxUmP4awM9fpKpN/H+yax1gU+xV2ZhpculMqhetkA8pQIDGXUgy4fLhqRsmFyYZvapVHf+3/xsLmXrIjtJVnlwZ/wbWZxh4e17J8JzQo8RFIH550UKFoWyyUx57e5Dlbtbu6UEMIi8j/sbqOPUZ28xEj3LlvGigQ0sN882fTJ6CepoSqUhnjp8+iRrfF3y9PcCT/hicnxZ1+Xh2fN9Hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GNWTreyFpOnSI6ZMnmMb8NrlhmeTwlZ8i5zobDfSllg=;
 b=uigMhruxwYLJx2Zou+aZPuDAEyEWSw6XYnBlORV88+cNHrBT2rNBN4JAC7LPpt9Uvtjin2V7uqxkGkyHYhr7rXNyvoShCiqtoeqD8TbxvmNQHNRorUtoohjC+D0AVaAHo/xfthP11GROMeRMFDyYZ1n0ggY0Sr+DGrk0/WF8B3+qaXGD8Z8ZrH/zfRV6FcCGmrDQJX+/4awdxxop8Fn45NDiuDausilZ69lKw5BTodQ8bT+zvGPw/UvK/+YQcQsXhuLsq6FUzv8a4r7GN0FvETOyOA1Pz2t5vc74UQlZgZ1cAFYIx0WHvsOLpqOtOxOJPnmfawfwIpfSlcBf4DBSrQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by FRWPR04MB11103.eurprd04.prod.outlook.com (2603:10a6:d10:172::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Tue, 3 Nov
 2026 13:11:05 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0592.007; Tue, 3 Nov 2026
 13:11:05 +0000
Date: Tue, 3 Nov 2026 21:15:55 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Stefan Agner <stefan@agner.ch>,
	Dong Aisheng <aisheng.dong@nxp.com>, Jacky Bai <ping.bai@nxp.com>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v2 01/11] dt-bindings: gpio: vf610: fix clock
 requirements per SoC
Message-ID: <auneixIA0ZtvXukt@shlinux89>
References: <20261103-gpio-vf610-fixes-v2-0-7c71fb36e184@nxp.com>
 <20261103-gpio-vf610-fixes-v2-1-7c71fb36e184@nxp.com>
 <20261103-venomous-hyena-of-fortitude-063eae@quoll>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261103-venomous-hyena-of-fortitude-063eae@quoll>
X-ClientProxiedBy: SI3PR02CA0014.apcprd02.prod.outlook.com
 (2603:1096:4:295::6) To AM8PR04MB7874.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|FRWPR04MB11103:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e1df739-b660-4e41-6516-08df39abeacc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|1800799024|376014|19092799006|23010399003|18002099003|22082099003|261102123227099003|56012099006|10067099003|261022105027099003|261021121427099003|4143699003|11063799006|261028144727099003|261026140227099003;
X-Microsoft-Antispam-Message-Info:
	KVIwC2TT6i+EKyHkha2RY7EXOHL6hpdVOW7L4odMtz3yD7XyaIrPNFKzWAAf4H19HtwTbWnzVUWwwK1fB3o1Y2A7hAski+uAdX8b6Zhf82tC6SXhjGeTLjfRXwCS+wZ4orTrf1T3w2bYRKnC+3ryXnqtYNvLg2Kk8lz67Cbl1VHmE8D++4vwIk9bFnYcx6qZlV6TsMpu+QFO0IfwPemow3mAifgZUtylV0bObRWqnrjfpC+c9UJKXR/XkmrwxG0LeThGs1TptWl1HZ2/KPSaDReXDbwTIZK3HOlqA9kYpzAU5cWRuDGgjqC2u+NzxRtKqz0Mf6i/iNpRD7ZemzZ+nzZBbuMYPCVPjZyspJmM660SCtNDgLV6nl1qmhxiPMFqI4ABqzptuO8r9MWlbmyyt/gQnCD1OkcrBeRKuNhpDMgIpbm6uyTHkOl3DMFpLOSsD+66DFocayzL1mkrkeuhg7y981Up7wwTKx+PO6d5B7yV4seb0hC7C8GTFhnKJh7/mHNS24nvLM5Ia7syQ7wwszRIdKiZ2EOzsskRNNcVFH0AaKVl4oDT2juYeWde6gXtL9TfVPPx/PrUsEoHW7FVw/UDPaLXy8bPKiAiWGHjrFjFYW5bsn52VpqHwCa8Vg1MAk4dElFJ8GSTqDBCSzVeZVljqIfeFJ0xaqRdsE59TrU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(1800799024)(376014)(19092799006)(23010399003)(18002099003)(22082099003)(261102123227099003)(56012099006)(10067099003)(261022105027099003)(261021121427099003)(4143699003)(11063799006)(261028144727099003)(261026140227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/vRkc6qB/C+tKqWH+y2AJAShdM3A4oVOSiLarefP89RPIwgPABzo84FO2/U8?=
 =?us-ascii?Q?RIPvk/y7tpBFbF47UGoyDkAQg5+upyu6TpHRoCgtxKFW+rb3B9fbbi+oxbS6?=
 =?us-ascii?Q?xQHTNWreqd3d5nW7dQgi8jUT7dT8D1BIFT8hyqHLPXn879qf2KKpJqhXHqvc?=
 =?us-ascii?Q?d5NThq18RRiddKvN/J0r1wSKF4TB/HdbEKbZ8NZS+WU1ojL7qxwnIMCPY8Py?=
 =?us-ascii?Q?W8YHMnpck5v318hJ7PxOsekocW/he1HalE3HVFv+vqN1RVZy+cdup59d71UF?=
 =?us-ascii?Q?leghddqRqvbJmmsr+oE+30ntTnVQXn1Ptg9o0leVt2EUS0pcDwLmKa/Mu3y/?=
 =?us-ascii?Q?2MAoG+tD7X+wK/DgRchs0xt/0MGO+hDqc+VtstAeSmend8yxJTg/x+fARtt5?=
 =?us-ascii?Q?mjWCG10Sw/oyG8IBACcg/C/Ix2Yd8ABpFWwxHfgH1Nhkgz55zgqAr9MflLXb?=
 =?us-ascii?Q?68ggmHOaK2oLSaY3HwWaWTDLWymKtxoR4xNpsIf6whZG3df08+UA6uIStgH5?=
 =?us-ascii?Q?dP6jXwzx+QR61nEie3/WMpz21fd+cUh0pnXY+CpK2a/7fgnnfMsxKcQjEdOE?=
 =?us-ascii?Q?LK6sixpmDaJioH6lwj//iLF7HU/7s3l/uvMqULy6YLh8GLLrTHwpJE/eMIm2?=
 =?us-ascii?Q?DXOFX3+yeSl61Ug44gwWCx1Wy6rtVbpHKdh0DnwkhF/tXvjIJHsJSvWJQmYj?=
 =?us-ascii?Q?Je4ziAIx337VK5Bhk62ekUi5Z0pkz8vhxwVYAsCe1u6z7yD/0nTGKEIRIit0?=
 =?us-ascii?Q?BmcvFY4o20iIJ+mqP00b5iwkk17mvuzT3J0sKMnXA0NSO+TG2MmKY4KLpMwr?=
 =?us-ascii?Q?921bb3VhBvsyMJUaBhmLZyhzbbeSRlQkPs7zEzTyhZ0uYQgJxOAFddv+HqZ5?=
 =?us-ascii?Q?Kjyhw03JGFlRwquBu+7D+Fowl817obFnpd22XdKXkVMw81e/O47T8hK8RlDu?=
 =?us-ascii?Q?1zANyDEfkfJ4JvJSqRXOR/FT8FzLAIxnymS2gewUCjzcoaqa6WzOY6B44Za4?=
 =?us-ascii?Q?REleIUBAK9V9+UddE/fnLU8xGA1U/iO8mTq8PqDv9bBx1TNCIWDyB94+fhxW?=
 =?us-ascii?Q?4FMyAbV/bd6+igHGQe2yOf4m437MmPZrBiT91fHbkE0pxfVMj5wYyKQKxksb?=
 =?us-ascii?Q?CocomRWQUrias3kL/ImhcICn/jEkicrbL1lP91IDblM71qt8I4Oc5vYnr91a?=
 =?us-ascii?Q?Bw+2I180SR4pTO+HdcWRVUsIEOxdktpeR0Rjb3YK/hMmDZpFVthjYRgCRrZp?=
 =?us-ascii?Q?fEO/BIw+GYtUNPKGhDGHeSeuawgBVYv/LRzaTGOWJU+zCAIZeNdxhlbbjwZl?=
 =?us-ascii?Q?yqfAXw1uPWxvMGz6P9UIpwXsOmx8urySOxozzKh8FXPrdcLkmeEkF8h6Ggo9?=
 =?us-ascii?Q?1npxB6Kq5P9LLMYWNEuBGqxedFlxybXVD2IdD5bqJzUVpmHxmUl0DTFofDRF?=
 =?us-ascii?Q?1UKvG2PhQiQ5deHHLsNQTZnLV/1M87+qILc+SiApJ8tKeowSlKdb3SUgwzQ7?=
 =?us-ascii?Q?HxZBc34shu16vS5iG+HnclKu2OlHXOAHniKorOYCyTdg3yQ9nfPUW2Dlo6NA?=
 =?us-ascii?Q?ebp0b6vpC5kMzHVL/aodiJ5NE6IRZwsn6ycEI4j4UiIyXHboQNtrQUlJ+wFZ?=
 =?us-ascii?Q?Zu4GRh9XkT9l1xL/QqmO7Qv2llHksUBSWyE20aTfRf77CxzFOgZyxmKbL2sJ?=
 =?us-ascii?Q?8tQ63VCpf6QVyDZGNYf0ku4ucNU/KzL05quIXhtoWFghZZWZYKsvKtqK5AHR?=
 =?us-ascii?Q?zV2ZTBVPHwVP1zUDEAOw68pxyV9iQ0Lnz0npV43gtSc7B9tIOVqI?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e1df739-b660-4e41-6516-08df39abeacc
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2026 13:11:05.5155
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g+U7SYxDVjL5SynP6NnyM7Xk23HGpJEpuvSObLgnT4TO3+s0SPXlzkEWGo8V71yysY5+YaVmvn+q0mQzkAEgVblznsH9YaR6EKHr58y5wBA9l+45elZSf+96q6OMMvZC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRWPR04MB11103

On Tue, Nov 03, 2026 at 12:46:12PM +0100, Krzysztof Kozlowski wrote:
>On Tue, Nov 03, 2026 at 07:44:05AM +0800, Peng Fan (OSS) wrote:
>> From: Peng Fan <peng.fan@nxp.com>
>> 
>> The i.MX7ULP GPIO controller needs both the GPIO and PORT clocks,
>> while the i.MX8ULP and its derivatives (i.MX93/94/95/952) only have
>> a single "gpio" clock. The VF610 controller has no gateable clocks,
>> so keep clocks optional there.
>
>Same second comment.

Please suggest what I should use to replace vf610 in the subject.
I not find a better idea expect picking "vf610" from the filename.

>
>> 
>> Describe the clock items with minItems/maxItems, require exactly two
>> clocks for i.MX7ULP, and require exactly one "gpio" clock for the
>> +    then:
>> +      properties:
>> +        clocks:
>> +          minItems: 2
>> +          maxItems: 2
>
>So you ignore not only my feedback... Good to know, the more the
>merrier.

Oops. Frank raised this.

Thanks
Peng

>
>Best regards,
>Krzysztof
>
>
