Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793663267;
	b=yKnOgwyonHh9OXxSNR7RNxK5eGsqHZ1W6WH861bZSZ5O5i3B6gHHsZF7eTJyv7SIiAj+
	 t+MiNOaKuxZu9Dtn8pAwg0obwA/OAu0fjn0uajtq5HXK4IGq3wnZ1rMUPM5vvokSCXDqM
	 2iYHVjvy3gV329KWXYKGgOgV3NEEhlWKrxHhxsF8UgfMEz1R6LdYEE/1utA6Fts+rKJKA
	 gajb+MzX6l6lDVeFfnTMNaVIiCt4wNYfkyGevlydPCWnxEp0JREkafh4g/nst7/Y7G5ES
	 GBqjIyTsJEakzxLbW6utr0svu7LhQI+0mujKwAHNUyWtrfK3yKL6oMS+xroAk7Nl8gg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793663267;
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
	bh=0IPEZ5d0pVs4ES7Q+/gElq6g7c/4MJAGdT1+EdlvsX4=;
	b=wKQgCOWTZmeysGP/+XEOLOfRTJjRARDnBsTaShOZ5WFrM8sz8/Yrp+LQRpTkHMcT8RhU
	 8zvUKrzu978/PiUPApECZX4NL6NyF8wHwXswQijr4075NrFXncrR3q2LLt2ZIbQ5RW9ed
	 QTWCqU40RX1BADbT2/jIpal8iTfdnREvUdlK6fxi2Fspq4Gxth89DnlrRhIhV8pTwELIq
	 leqDtbFiWGjp9bvk2zMg4bf+FMzQJdHsDgI8r/amSonUVdehOReSXUdtJ9F31SWTZL7sw
	 gIkvLPKqSdx56LT6MuUQvZuPr1+cmChGjyHoDwZ8a3QyzQ8AmuptuuryjyjvcK3vsog==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b="BN2/Ncwv";
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.45
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011045.outbound.protection.outlook.com [52.101.70.45])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26E5E606A329;
	Mon,  2 Nov 2026 23:47:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26E5E606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=BN2/Ncwv
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mY082GPB1kE0TIBBQKqnSqc0BEPXMopGieeyZuZ5pbs35LB3Fs5Gya12GmOjKO9Mt18eI/Dwb6b5r0tNeBOuE52rHdBkFLr7Mle/aJ56Lna0Uih+A7Y8DW4W+AB6dTjn2wPaCUpROTxxs8ORVsWTk0eaWfMrFtIxax25j2NFD2f6xN7rYzlYQtRxBM5HBKmTJRpIbq7wH712GOz5XC4n2rufa6P0QreQf7zx3wzfdG98jrzzN/X9CKOC4H2j5lxlOgWN8c9BWf//O/++Dk+oT/TsiOB+vD7gqbHMcuLxHobMXZReKQv9MdH8UQ2c5PcLIckONdUd+vkj+L2Kd8AqFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0IPEZ5d0pVs4ES7Q+/gElq6g7c/4MJAGdT1+EdlvsX4=;
 b=Ww5zRhHNYtkAeuekGtML7Zr/Bpmov6WuRRelRNOhISmes3c3w23sS7TddBnxOzxnSLR7Yji1o7hoh2tPFQEv3dSF577WUWc0wQ+37yonYWLWJd9aPfYcX8/DrE7AL2wbsFtb/FqqdEEEGG4apprGti+xqc7UEHBl6tkK2Lr1MVb9ILBP5de4JoQs7mAHI/m1k3jtOb3nkIzwFuGE73u6yBFITa9RZ4PqxifUCf577GmfWI8YvHyG04gaYa7rUFpeGDJmUN/wgKKVY1uPHqZfsD9ZCIb3PIpC0TQnRjKLxKlng52wuWxk2680p/8AlWL/5raJcCMYT3K8U1qEWvx0eQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0IPEZ5d0pVs4ES7Q+/gElq6g7c/4MJAGdT1+EdlvsX4=;
 b=BN2/NcwvZrIGcOjS/j2VmH6kxKz3ByA1cEW6WNn3uW1O2LUeNkIcqRMXsejuq71jjyl4F9NKrJXN6xPPCP1+tU6rb1gi/zOXt12WBCNjCWIjpPmUx3LW29Ufy/PiKgQT3TIQPFWd2cDJ/mVM+O+LtlRrdNBAsjd4aQIGOp2yaUIaOaQ6CecjEd4IHYqkNT6WFyjfNBRUZLHRSBayHUntuvZX6Zag5nA2eRvU78Vmuoydtk8G3u3DWXURJD0SjY0urZ5a2docNXvAyUyobxOGrwZuJGaM0aQlT+5RfDf/Ik5WnwM1eVvLtk5pwkYYPyRSztnMe/vftxYcQHIFJmFYvw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by AM9PR04MB8955.eurprd04.prod.outlook.com (2603:10a6:20b:40a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 23:47:44 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0569.011; Mon, 2 Nov 2026
 23:47:44 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Tue, 03 Nov 2026 07:44:06 +0800
Subject: [PATCH v2 02/11] gpio: vf610: simplify with irq_set_irq_wake()
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-gpio-vf610-fixes-v2-2-7c71fb36e184@nxp.com>
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
 Peng Fan <peng.fan@nxp.com>, Daniel Baluta <daniel.baluta@nxp.com>
X-Mailer: b4 0.15.2
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
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|AM9PR04MB8955:EE_
X-MS-Office365-Filtering-Correlation-Id: f3bf8497-689a-4237-efd3-08df393bb0aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|23010399003|7416014|376014|366016|1800799024|261021121427099003|261021123027099003|10067099003|11063799006|261009223027099003|261102123227099003|22082099003|18002099003|56012099006|921020;
X-Microsoft-Antispam-Message-Info:
	cvGELdqDy6jmLhrrnxMVM6APUMNb4JfRoYXJnqmNaq7LmufDQwjyypNW2dLaR8HML1lMVeItTec7JTIFcGCoPKlDYVelWiJ4DQgSPhIjyeu94Gy6C5kOZBdZ6PT8aJFrHVoXV5asKo061obrazAlqUOIPuCerJ69T6Qvyv4+GZb+/FMf2FJruyxIf84mObzBlejMyluZDRs2wnCd1kQTeVLqn5ejjbbDvqQfz/TTmlzbWeX7o+QybebRt/6pvJlM93ZcuEql4K/A8iONaMXwJxzKnkwrFOjHACcSkhY8bg9GJo1tnTDqSkdOgPmY0SYUVVHQJ35egGywIqyNxhFno4IYpjObq09EtCaUcVncV0m7b67qu0jU+ThrLJQLv7WceotRx9kPmWaHRV/JyDTusgjktaZAQWq9BGXbw3ADHGTthU8eB1fRDxz738wylO24mkFx3BQpAcrh6p4lt4AwBCuLizNIjPPdqCdkb0WK1G9KqGn0kL7MlXKf2pnO3yE9mMf7+vMJ2t0Ft9ZTeAgwI1GUH3aJMBVPz+Z928hOT36c5fwyKETJtrDHI2XPUtn6q2Oio8iRwt70ch6imZ/2IBt/zVm4j3M5wgHk0WRHMPXNouwlaPZ7xIFS5NpNSpAGjbpa9528OJhkLrMuG/GWOZ7khiydZeKPXC6hE3Cfz/CVqllehsI2YOfRVWIkIH+7O95SMKUgXS0HLDJmd78NTg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(23010399003)(7416014)(376014)(366016)(1800799024)(261021121427099003)(261021123027099003)(10067099003)(11063799006)(261009223027099003)(261102123227099003)(22082099003)(18002099003)(56012099006)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UmJxV1pDUnZuS2JPZ2s0elB3MGxkeUhzMHZ2TFNJVzFoY2lEWEIyV3hyMFZu?=
 =?utf-8?B?dXBKY05NUlFwWnlWS0pwQ0h3a3ZLYkNST05GQ2Fldm1xODRudE51U0VldUNO?=
 =?utf-8?B?RDVmTkNxcklmd01MSEUvQW9xZDdyRC9jUmt1YkxFcmYwcGlyTHo4emRMZ3BF?=
 =?utf-8?B?QXdGL29XaUZILzNFV1QrcU1PUWM4WGJxZ05xcUp1ZHBEckQrYnZHUXh4WGFZ?=
 =?utf-8?B?dENtWFhzRnBUcGd3VS8vT3I0bDBRQWJQNHliZzk3MnptM0tXWUFjcGgzcFhh?=
 =?utf-8?B?WERGSDRDMjlHT2RIRHRKTGpRQXdDTEFzUVI3N09uV1JIZGNIMGxHSllRT2p1?=
 =?utf-8?B?dkw0Q0laVkltNmZBb1lIRk1la1hpdm1IbTFIcVQ1Ry9ueEZnbnVSc05oVXpM?=
 =?utf-8?B?R3UrUjJTcVBSTlBTQ1FPQ2NPdnk1ZTZqdEo2aVZodTlEUGZiZnhhb3Y2M2g3?=
 =?utf-8?B?QUZOUTdNaThLdjBBRU9hdlpMd2lWZXdSNjlWVWtGWkxDQVJFanpQODhDMmxi?=
 =?utf-8?B?dExlQ3YwU2ZDd1UxdmVydUgwa3h0bExyZmZMT0VYYmQ2SkZ3eFJjQ21HWWtK?=
 =?utf-8?B?a2dGLzFOQ3Y5MHE5MGprdHNyYWZscWs3OGIwVklhbXdOeUdieVdWczdwV2R3?=
 =?utf-8?B?NlZ5KzN0SFdaQUZ5L0l5STBTSTRWWS9Za0VuOE5oZDVzWGNsOENxODJ5Tmt6?=
 =?utf-8?B?SWdtVVoxRTgxcW5ZeFphRmZhNVRUaEVKZXNwdEtaMXdVUnpJczB1U3R5TG5a?=
 =?utf-8?B?QjVIeEZoQU5VUC8vSW4zVkoxL3E3Ni92KzRRSVl5V3gvUDM4cndNb0gyTkMv?=
 =?utf-8?B?TThwYXdpcHF4eFZzM1lCQk8vdmpYSS80TXNVUWo3aWdCTTZTYjBLVlJqeGd3?=
 =?utf-8?B?ZXc2MzAwbEZIVVQ2a2YzUm5EY1FvUE04cWJ2L1BOWElNLzZlUXRjai8rZGpu?=
 =?utf-8?B?UTR4VUxqeE53UWt1YXJTdGptSUtFYzdmSUFCelA0cWFPWDA0Q0oya2N5UEtx?=
 =?utf-8?B?NUhUZnR5VXhvM3U3eFB0WUFIWlF0VWg0THlybWNaVXg2TTRGSzRVNGp4dVR3?=
 =?utf-8?B?cjZEVDQzK0ZZdUxqYXdFYitmWEJ1M09aRmJFSDlCaGI1YmdnQ2E1T2w1clls?=
 =?utf-8?B?SEdja1l3bThLL3hIRXgrYTlQV21VSFZ6bHJaYnByRWtUMkMvWXdPbU9nSmVU?=
 =?utf-8?B?TjRQdVM1eEtQTkM1RU9lYllEVjMzc2xzVGxPMkR4emRhelc0bS85R29iRU8r?=
 =?utf-8?B?UUNJUTZDMlpUMU11bGtST0Y3ZEU5d3JwRzVmZm1zZjh6bDhZODRFU0daQTc4?=
 =?utf-8?B?T3NIemxnNUx2RzJMcFdDWW9Ra25PSE9IU1JkbkVNaENYNE85dTRuazNYMExO?=
 =?utf-8?B?a3pnMTFEVitmQlFPQ3YzeWFIWGlxMG96Smp0aDF1dVljSzdxNFBvSWYyMGYr?=
 =?utf-8?B?WDJKMHljbmQ5RUJrcUp1SEV3TnFqbHZ6ZlBjZ3lyam55c2FaUEpDSnFScWZJ?=
 =?utf-8?B?Uk03M3pqZ3k1ZmVGYnd2WlVKbHNhUVczZmdoM1BkTlpWSitPL1BNT1Y1RWNT?=
 =?utf-8?B?QXVxZmtZa2dMQllHWnVHWGlvUzM1NHRvQ2JmTS9uZUhpdXZxQjBmNmFhdFJS?=
 =?utf-8?B?ODFodGtZNDlvN3dLNkJYdFA3R1hRRm4xd0xmMDJGcnBJTVNlTTlrM3J6Mm5R?=
 =?utf-8?B?T3lwYlQvQVRCMVpsTXYwcFgwclp5S0NpWS91cXpZRkJSdDZ2dEFFcFVRb2ZK?=
 =?utf-8?B?MDdkNEVmcjBkWnJmRk9iaCsrbEFkRzZQcmw3NzJrRzlnRTV6V2N4MDA0YkFL?=
 =?utf-8?B?ZWc3TmdoMlBjbEJvc2hQRE54YkNJZXI1Z3JIUHltZHQ5eFA3WjAzVDFZM0Z4?=
 =?utf-8?B?bk1sZ1pnN2t5Q0RSUElBaGR1YTRIbWhUSXMrR29YSFAxVGo2WE5kOFdNQk5S?=
 =?utf-8?B?S0VhQ1pQTmFFR0RxTDJPanNycXJJa1VFWlVvS0toWTAyYzBqb1RRd243Zzh5?=
 =?utf-8?B?SVI2a0psSklSQlV0YlA3OVhTV1k4WU0vMmVGSkpiVEhXUTYwbzU4b2dpZy9K?=
 =?utf-8?B?OFdsY2R1OWJreXd3dkxoODhVcGpsQVNvMEtqeEg0WHA5SEYvOC9NZlFsUUdU?=
 =?utf-8?B?R1c4R0hDZnV2RWpMRDJxOE1TSHQxSXF4U0hUS2hEM3ZRVW1ZNkhaUzArMUJD?=
 =?utf-8?B?bkwwdnZrRTF6dm10ZHh4U3lwSG5rR3Fid1NjcXpxNVZUbGIvSkRabW1MNzlJ?=
 =?utf-8?B?WjMrWEJSS2RyV1FkalZDOFhhemc0a2h5SW0zSG5tWVA5Y1ZoT1M1T3EzdDkx?=
 =?utf-8?B?YllMNzhRdWpyM2gvOWthSUhsNFd2QWh6cTZaU05PbkJVQ1VwRWFLaHdJWU0x?=
 =?utf-8?Q?XCSZ2K0er+ZPX9A47SUe7t6ejgWVcSK2UvEEc?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3bf8497-689a-4237-efd3-08df393bb0aa
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 23:47:44.0995
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4w1r/1fqKVmvkT9B1y6kEaiMDBGMQRVcHEE7vKbnJmTf0jBGD9weWEML5tg0j5+6ywSbIZd6sptGcXF1vmhxYojdc0aVCcoO+svfym6irhnwrtBbLN9TQbxQe4JKLlua
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8955

From: Peng Fan <peng.fan@nxp.com>

Replace the manual enable/disable irq wake logic with a single call to
irq_set_irq_wake() to simplify code.

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/gpio/gpio-vf610.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-vf610.c b/drivers/gpio/gpio-vf610.c
index adfa2c2d5873..c1c562071c0d 100644
--- a/drivers/gpio/gpio-vf610.c
+++ b/drivers/gpio/gpio-vf610.c
@@ -189,10 +189,7 @@ static int vf610_gpio_irq_set_wake(struct irq_data *d, u32 enable)
 	struct vf610_gpio_port *port =
 		gpiochip_get_data(irq_data_get_irq_chip_data(d));
 
-	if (enable)
-		enable_irq_wake(port->irq);
-	else
-		disable_irq_wake(port->irq);
+	irq_set_irq_wake(port->irq, enable);
 
 	return 0;
 }

-- 
2.51.0

