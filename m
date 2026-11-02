Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.65.20
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793624649;
	b=Yhr6OVvAvlhsrj+7tggC88u8PTnr4WT0IRpFNjPRGpbLK6o4J46kWaSABWeM4VcieEqh
	 WEACWJXnfno/B4rJa/CyG+mizqvG6Qg/oWYxZEULgSOoq/gnJpzBMHZxP3sDB8v3Lu/RH
	 5LniyeI1eQTjmi4whUyqBOHqh59oQiR8OP7Lemuce2UpXe6zGuT/fFwLd5sw+v5AATWaM
	 zSokIKrpyvayBoXUWN2b0gqHlJgpHkm5ctzDpPVVlcXv6AbR7cCN1A0vF4e02X6gsBccg
	 hUlYI3+wSEo2cBHhi1ImKmC5xvwqQmGQkfJ2rd2M726xzdU4m70EZEzujTr2vTvMdYw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793624649;
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
	bh=eM3DKNSJ9197KhMSUbAI+R8YewD6b8ZZFJPcktleL5s=;
	b=r9mpFeN+PC9JDTfuHwSIQoUImsDYCS5VCeby4G/kOV7jnyfS2WG+Lu7Pot+1nLkNImwd
	 UiI//vQ9ORpJDCmHEjop1lYJ2mh7ym3EyVNJrI63yf0nMBkzs2UiAnVaEYm02wtGQquUf
	 oEGgRIm1MV3r2Vd4ExCRaTXv5lmwcFVQIcUUU/eB+yk5CdaCy27qMtV9paGkjLmTtcH8Y
	 YL8EMO7IpmGJvInLd+XEct6lUXD7sFzlOwVof3FEtXIwom4vyQ3uZSgS/5iz3hP3vV+g5
	 ivg4paQiIll4kyArbaD4+B/8QsF2ESW59rxvGqKpFmVGvd87GoqIduKR265G8bo+Jsw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=lEAiFJzb;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.65.20
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011020.outbound.protection.outlook.com [52.101.65.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81F5460A2624;
	Mon,  2 Nov 2026 13:04:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81F5460A2624
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=lEAiFJzb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yW9sfKLebmyflz5DZ06ZsgNZMmtlKJrG9t4XGrN05K7HBkx/P/i8PYN4Cj9+qoQIj7sS+HENdvCdTOCaHH76UzVdEIPPZlMrKruVOxydYA0uNI3UyA8tfrED8yGsqyBFMZNJnnlmEVJsYGW14LPguqZiT+r1LZBHrvDywlXTi8YJxLZFWMuSLcndwTOimVdKtaHjG2gxLfrkQQ8k7bGzPgkklYTs2R1qGDIDLDKHq0EUYwOwn1suS3kYU0HsD8pOjaeHgsNIDW0H/9BDN5ft93+GEYeh8WS68ys7iqxtqWaSjl949p2AikjM8qPa0pITo1wlc5dAEcHYHs+WL/9yFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eM3DKNSJ9197KhMSUbAI+R8YewD6b8ZZFJPcktleL5s=;
 b=rr2SFcpFXCnrsYAyFghFxx1+zz6TwVmm9skoN3DDW/IdnwbOGG0fymBdStYROTCaLq5686fsbqQfcjAw7wDO5GdYWEUZiGRGUaHReyq46SIXUNIM1W4BvrmVPdX7uyl1BSU2INev/+RjYDbQqYMCzW6gKIYGQuuzNjacjqwAVqFrquYOFIDNtXhAtCFV/44LQW6RkLAtJQahz0Cs4jYSaMlTZB/d9YcM9nGJzaWyc5J7mJf+IM+Ay7xxn8rIu5NXuJoefM64/NSAB/dJnT5bhxxQCAQQA7s17TAJ9WKFmVT/DfmwTiXDrAGJ/O8vQI03XWd5PYGN4kJyw+NUBYsmOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eM3DKNSJ9197KhMSUbAI+R8YewD6b8ZZFJPcktleL5s=;
 b=lEAiFJzbozsffkr2aGEjQNR721Eow0++/lOJ5OYcljnvCcoNc1FhrcmU1P+ypklNYvT6odAb6K8nDo94cOG73oknIVolnhBz0LBNBkvB3pV5ctNblCqoZZl84aAGYngnGaMFySlW+rLGGv5i7bIeUd+rMn/h+1JXE/ysj5lKrm1rswwtFVTPf2YsmyzusFcduw/ZhU85O/munR3bcK/rNEafVZJE0cPND/bDwXtPf6hAGkjeUKlmWFDxqiLf7N7nAV541fHcS8K0ly5Pncyizi9P8xmirf2897QcjLrxsF/3nALWa5FQ8WBXE/VeRy9WKNky48+kcX7M/CE6dV95FQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by MARPR04MB626191.eurprd04.prod.outlook.com (2603:10a6:250:201::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 13:04:05 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0569.011; Mon, 2 Nov 2026
 13:04:05 +0000
Date: Mon, 2 Nov 2026 21:08:54 +0800
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
Subject: Re: [PATCH 01/11] dt-bindings: gpio: vf610: fix clock requirements
 per SoC
Message-ID: <auiLZh+aBGRPivtT@shlinux89>
References: <20261029-gpio-vf610-fixes-v1-0-45b484b4c434@nxp.com>
 <20261029-gpio-vf610-fixes-v1-1-45b484b4c434@nxp.com>
 <20261102-curious-economic-grouse-ccfd6b@quoll>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261102-curious-economic-grouse-ccfd6b@quoll>
X-ClientProxiedBy: SI2P153CA0011.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::14) To AM8PR04MB7874.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|MARPR04MB626191:EE_
X-MS-Office365-Filtering-Correlation-Id: ae70083b-fdf1-4cf1-abbb-08df38e1c601
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|23010399003|19092799006|18002099003|22082099003|56012099006|261021121427099003|4143699003|11063799006|10067099003|261026121527099003;
X-Microsoft-Antispam-Message-Info:
	qTJ/KAGwT/b/BgNJmEfH+AoWB4vVJKWtxdGe1IT6MxQDOKVepA5l3vkVmRVp1g+34bLXvOAslvJox1gFsNC7maKP7UQw28N++/5uDSedOqmmmPLMIHKTVd0BYwmeAQ5vgPLmCvLU2JrbCckL9dUzN9pNE6pOKNnwdr8Zh9DEDBplVTrWolPtDD2Ch+bA/drUcMNljJeOgNRZl8q6bRKdX/keGpb2K77aQXs2y4hFevBz+9ZJ+YAaLhCaGzfD78QtfAL019g4boo5gzvQw2GrkL3gHS/muSacXK+Uduue9IB2bok95oheeubmnW5dIPgNHBy+MHzFwAy0jzUUmoxGY3mZG9unKe7vosPN3D9mo97w8M24xgT51O5C63TY7IuVFV5bowzCnHSc324Eq5tQCIU+Vbwt3M2r+deOyXnWj4uJWXz3rOPxZuICg+CjjqIRbpI727wAy1oHmmvjP4RPJ2kK5/4PQiL+sNoN7yeNtm+377CJMML5c9rhJz39LmaxU0tFyseEZnGgW8KgXyeKwUhYpRG0gQ0CU4uCNcvLIDkHxuxsQR+eVduN14C26SaaFI3xbuS2jgP4nJvD7TFr9L9HbAN5amoTlzVl6uBNkRgzth2fep8PQDJcdRRfI5U0AvK7lpIdYLayBOyQyR8nHqER2WOZy7ZJ/b3GsM9dp90=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(23010399003)(19092799006)(18002099003)(22082099003)(56012099006)(261021121427099003)(4143699003)(11063799006)(10067099003)(261026121527099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?rp0xObV0r4q7jF2F20SPX5IViXzBqhn9eFDCgh/TJnd+GhsTeDxwQFsDpcZC?=
 =?us-ascii?Q?jDjFIYPV4FjbJEmC8+duLgWpR3rFPpH+a430kUBD7SfucKDw+aruBi0M7JWO?=
 =?us-ascii?Q?J8flRE3l8SB1L9EtJWUpvZE5tAHbLyiwdalwenrJlClQJWOweEF+B8g3nnAQ?=
 =?us-ascii?Q?RyN9SEbbHHfP/Da03UZ2cM52MfXGu0Pom8RCjKeNMn37aQRxzPJ6xj0kktnT?=
 =?us-ascii?Q?wq3kNQNVgvmHeHLuGPv+72p317XjksORGvWFz/FTb0FLjY23QFEAdoBwzfiU?=
 =?us-ascii?Q?EYGhTgPQ9T46I3m942uqDF7QkQmxTUtyx3wRqJykE4f/0KIsYnVsiTx/oJCZ?=
 =?us-ascii?Q?mcsU85G10k2Y48zH4g5cPYfq9by5WU3S3rvwEHIwM8XCZRt1kERi2XCzZGPU?=
 =?us-ascii?Q?GyYvC9rqBkKB2EVQU2Qs9v/WSse9FKA/IAeIWfqj/trPNTR71OY+K8lgD+ny?=
 =?us-ascii?Q?Wv5RcwCr1yFJJTvTanEzM2iJbNJAU5tvVo7F22AgVdyOOIPGGQbxqfvpO12X?=
 =?us-ascii?Q?PqPSWfJkHVBrZsLONnBH0wcuqpemGr3DnMXIL40HrX3uPfALnsisr7mDQARg?=
 =?us-ascii?Q?OhkBQSj96jrpu+Mf5KDZBMHkl2S/bdVw//OV9xKQyrShkuGRZzjcmmPhBCRk?=
 =?us-ascii?Q?oQ2s0IT02pJBdAAHIuhNOYBP65y+05AjK2Qekje3llkiTXMk5o6xruLWOMkS?=
 =?us-ascii?Q?c/nWJwIKuqAM8xMgsudL3tGsklJ4FV2mRItwMHx3jCUjyLCyFUZrFaJvl0PZ?=
 =?us-ascii?Q?HjRFWe7ijnEfJIr8jmUNomge4G/D0i/PbgGRgSVH2FOpbZvhJmAb28RzX8Mg?=
 =?us-ascii?Q?qIvV3RDjWIH04eMdpLwb2oSd1HqCL8hLJDNVN3+oag0KN7WGXu6QHIjkFAht?=
 =?us-ascii?Q?uaXXl/yvObhJ0U7pzMQCiI43fOcLI+ENkp3FzJYsQMWRGKJ1mPjoYQIP3arL?=
 =?us-ascii?Q?/YCiS3ln2P9J3RZaFLOyzU/u0xHqoy1dd5Rn8HNVYm00/LZwkDCFL+CMs35w?=
 =?us-ascii?Q?rmlKjdojs6JUxtcr3NpmtUSnb+4xrpnev1/S3tL8RiqPIOfed09FdUeP4NA2?=
 =?us-ascii?Q?9rTQHm+9GpfbeELhyqHHtnfDhFCSIgeYPirol7nxBkyg3+R5SFHhSLJeUAtZ?=
 =?us-ascii?Q?c3y4tLtORnPWhVfZGDQXukMfd5ec4NA/C2uRXfEwA87AKMbGzWp57nncJLln?=
 =?us-ascii?Q?UG4Sryg9eyCAK7tK2z3vdytVz21krGYKl5llZsphkgAVXWKBobYdZdeEWwPM?=
 =?us-ascii?Q?CiUIcueUe7L7WWCviaMDike4kOM2IhpbOEtzvDb85XFkSRJGLKRHAX9++PSN?=
 =?us-ascii?Q?X6P3Enojz8oIU2PZwsIJSYbFlIXT3AfNd3bAZdiHcL4p2inEqwv3TkPMIbu8?=
 =?us-ascii?Q?TcX7rhuCg8KB+NPIXZZzHyCbAu/sNcmptjE4VXarPrCNpusuYswKRjbTaoJn?=
 =?us-ascii?Q?aZ11Sbv7ZNx3ebDs/Wf9pOTCmIOkV0IudoJsOgnin/R1mhjKlUArdMSFgLl7?=
 =?us-ascii?Q?JWld4uvu3fr6lJ87KHEA5Jv4ULCg0SLxLqWQXTRFKtKC2yXhMV4qSMIu4kv/?=
 =?us-ascii?Q?Lb11oXCoRVc9VJnWe1Z1gL0wLH1BUC5efD6hzMjw9Twcp7u9Yo1OrLLheGiS?=
 =?us-ascii?Q?+G6lGcnzbjNg70+5wqgn0F7VLHJTnfTQG6CgtsvUoCyyE6Su9LlGfQB1SsDi?=
 =?us-ascii?Q?2gibX4SdNZkf5VPDmk5HiOpxM1Z3P46VGJ89SUDUUwAYBnFbsNnzISoal9l3?=
 =?us-ascii?Q?2QjoAKLCt0JFHKfy+nRCh67iXZUvARQ3ZDiC8UeBnPm+ceir7Aem?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae70083b-fdf1-4cf1-abbb-08df38e1c601
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 13:04:05.3434
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VEHGixzHKjD844EAucaQWfB9AgzPRxGjqMSKd+RB1HToSKryDq8DMI8p0SAOm5C4D63twFOeua2qbSB8Ppa7HidDXc7oX0uhfkKnmKobGRnStfrOwb3XjdxbzyozzaMa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MARPR04MB626191

On Mon, Nov 02, 2026 at 12:05:47PM +0100, Krzysztof Kozlowski wrote:
>On Thu, Oct 29, 2026 at 09:42:25PM +0800, Peng Fan (OSS) wrote:
>> From: Peng Fan <peng.fan@nxp.com>
>> 
>> The i.MX7ULP GPIO controller needs both the GPIO and PORT clocks,
>> while the i.MX8ULP and its derivatives (i.MX93/94/95/952) only have
>> a single "gpio" clock. The vf610 controller has no gateable clocks,
>
>VF610
>
>> so keep clocks optional there.
>
>You mention VF610, but I do not see corresponding change in the binding.

Since this patch touches several SoCs, so I just pick vf610(leave it in
subject) from the file name gpio-vf610.yaml.

Thanks
Peng
>
>Best regards,
>Krzysztof
>
>
>
