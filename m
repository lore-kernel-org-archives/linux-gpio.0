Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.0
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793663315;
	b=XoMJPcOqGveHxlW1XkyBxdvMrl/pCxaPwcubMhnPF5WA/fNhRuEpnT/lRCgxblY3WnmJ
	 Jhlhc0AZd4JgdCdtF8WP3e0XTxCtz6c8S7HstIHNIAHWHGUaz0A/WoA2zV/XKbwGSwkl/
	 4KyMPmrQC1x9muu2BW/fg44uBHlp0R5EzpI4rHzN4A0VwYghnj6inVoYVpmC6SQtSN5Hp
	 NSp3VOfZMr/6aBFFeNpPFucf6K07vfJw0jdZdxt2M8IyOMNMQZajTpD9issETamGEOheA
	 zPd2wDeazBK+Qric2uYdMz2IvfD/1QZYFCpFn4iAdHenLFpxjB51lMxk4tEhK7Uv/KQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793663315;
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
	bh=4mYhrlMHKr+fAA722B37HCx3ojL4nfTuWAdTF2uVlqo=;
	b=g9J5eFPCT2NrOKalJzQXyJGJ8jmlxzo3z0IwVOWHaJ0U3BRVkoPDYqjZKghUrQm2Jw0l
	 IJAuy7Z4p/CnbVuE9rIZa2IXaWL7PHgLvVK81jF5ufIDFRsh4Pw9qQVVAHLKTWT794ymq
	 eaNBDxT8o/9xI7JBR35pEIKaKBVpgnOmLxbEIGDA/P65tV+vxqV//Pi+opsOphH/zi+lA
	 dt4ywA341hBqzXIB83a/jp8TfsN3UU6/vJ0RB7TwWv810rx8QlWh/gLIwW8ywV5wkd1L1
	 NqF92q9h1UV3R9QhPy1RlXZLznWbSpv5PaNseAZYqXc0RR+6yvnxJWX7eSujgIl9sVA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=GU7kQKju;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.0
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011000.outbound.protection.outlook.com [52.101.70.0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C76A606A33C;
	Mon,  2 Nov 2026 23:48:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C76A606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=GU7kQKju
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CCbmft9/hHt8nJLuYV04MmrWeT01qa3ka0LoqEVJybRpeZJI7+3v7flV5nXsn7A98Ljl4gObadNG9D39jJvxkhv+a5FpHr1I6yUHh9YelVKJkN6kOYLX0MSAUb/P5g/nhCHEFH1kpBZX5TjQcX56D+g/FGlH3WGG6r0psilGooX5qWxMgJI9EltoYut+lAkPZm+FjggvC+Bm+dfm6F4dWEJpaAVL3XKsJmh6nbbvRQck17LYExI0qNa2NdhfjxWKlu3XHu/5yQYEnbc8oWV5vEemVzIdi3TPZ1w1jhT2axFbJaUydepjK5y5T7VQW9gbDD8snk1kx1uXA/wESSXN3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4mYhrlMHKr+fAA722B37HCx3ojL4nfTuWAdTF2uVlqo=;
 b=sYqG/DVkWZ70kOAsKc2hPoZXiDDaMx/2zPkymPo83DeJJ5jLPkbYPBpLlZw6ndmKZbrd/8oxKKDgeQAc7NGHhVF0CAO59ndK+tGi4DkdD4h9sBre1RqM5vvw9FvxOj2BCyWKT5EMEVU4YXCJSK+69HOJe+L0RR7PsvVlc/sLydxIsZwvn+y5CnhftPATR03A+tJ5SQipKOurtrd/axYbRa7Svp52vV9LDPzsdQowojkDgEb7ImGl9iadRuwTJkzD5iScU4DemNGHyc2yvue9rCKR63bFuKLePJlrPfrJAQMC42OKJ7MDAPF9O5pmfprlgGfOXe5i/jycokLPBZC20Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4mYhrlMHKr+fAA722B37HCx3ojL4nfTuWAdTF2uVlqo=;
 b=GU7kQKjuFIRxkdeQVcnH+oUdw6cbcC1tif0uQqpkoVbz6+b2fK/048829VfM873bIySowuNfHkgiXsGDaRAZAV8eLVj3t1fr48rxiAdHXTDsSx1K49OC787Kdv7Gp9c5ez7nPNRTmWLQmRKKx4qtJdOhZa24ngLO3D4XNQ0whs+Ywa9plUZVp81vLA+hxr1M0ojHKatUs0ynQXwZbQlGPdaduxmjYh+gO5J9oCnSZoSH45O6tq4rv/eLZltU6y8nEzHizrIBv3LGMnyJVfC9G203RZLeS92XMTBzrxg2/RobtR9610HgqcSNAoTNHH2lTrfX8JL1lVwNDkdcDf3q1w==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by PA1PR04MB12221.eurprd04.prod.outlook.com (2603:10a6:102:562::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 23:48:31 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0569.011; Mon, 2 Nov 2026
 23:48:31 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Tue, 03 Nov 2026 07:44:14 +0800
Subject: [PATCH v2 10/11] arm64: dts: imx952: fix gpio clocks
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-gpio-vf610-fixes-v2-10-7c71fb36e184@nxp.com>
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
X-ClientProxiedBy: SG2P153CA0046.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c6::15)
 To AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
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
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|PA1PR04MB12221:EE_
X-MS-Office365-Filtering-Correlation-Id: 8844f35a-a2e4-40a4-a804-08df393bcccc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|366016|1800799024|376014|23010399003|19092799006|18002099003|22082099003|56012099006|261102123227099003|10067099003|261009223027099003|921020|261021121427099003|261021123027099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	0tTijYVOeMHAZeUozkPVNzmDrZ8tVmT5UjVdY0y7glQLSLuK6PnHnGRXAIppMN+xLmIDUxn05wemP2qhE1q+Bz32c4JwoTV3RgwYmN04YtW9q7V6bO263K6l9m/MSUFgV7aCDD9h74VKw5p9kxUClrsx5l4MbW2YPhtcwATzfavL0/tTwL+kZsWh+E/s2CYKM4yXMkL0yaGy+uxg1MbhuuNyG8iCm5/faShmgo/lWRH0BLRvBPFCnGeRTVjHr/7LaZhXnSe+jPtXDXNgoJ8s54WKzxvqRhKZ97N85OMQYi0d/NMF+PHsAD3GtNdt+zm2uvoQeR1YSujYecyFndD9JclYitPHfpgkpe5OL/fLWIKZih1FyLGbpDz36IpQP4TjxOaNdybV3dYrR64ui2Qv+umaxbmJILWOx+gIJyjFbEvSM4xqy8yYOYDRszURwSXWx7rl+QzV8IKYmdHmzN6j9z/xRJTTdCue2oZXQdubYIUnKSrGr58R7PKuCz2sDPWvweoLu0sMw8hbfPwT6mzMITa8NqQH6B9XzqW9mcS4QIos/bUaGWb+/kTucTKHQ0+XgJx9DenV0c0OpMRXq/sUzzu7VVxtjJL4FSRYqdFLxsF0lIVbVgqIb9NzLTxeSH+kSVd+DKQoun70FmNo7hgq67CnCONqWqaTutPucJSIkelMoOi00w1Gz2z1B8JkgrbLUKvA4stDuFw7IsreV9eE/g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(1800799024)(376014)(23010399003)(19092799006)(18002099003)(22082099003)(56012099006)(261102123227099003)(10067099003)(261009223027099003)(921020)(261021121427099003)(261021123027099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TysrMTZ0MHh1djdHdno4c21GZGpkeElnYTVqRWJhUkJ0REFzbVVSaHBva0Rm?=
 =?utf-8?B?RFBtT3dMZFpLY0U5QjlkMVo5RUdZUEhDWXhxNG8wV0MxanBzVHFqNVpUdDJK?=
 =?utf-8?B?QXJnWnNxRGd2MmxGdXZza3pOQ0w1eHYxYUxoRmppeXU2VWRmUlNzcVA3ckN6?=
 =?utf-8?B?a0N2MjNpVGI0eDBQOVQ0MjdRTzhxNXJYRVFMbUFaMVVpNWZQQWVGQ0xndUVn?=
 =?utf-8?B?alV2RTVoTE8wNFhXWFBkSWhVMkRCY2Q5V0IzZ1lsazFtZ3o3cTZ5M21vMzVH?=
 =?utf-8?B?a21ma2NSK0tZSFBLZzhabTBDYUhVL3BGWWhhRHJoTUE3V1VKQ2IxbXRzT2c5?=
 =?utf-8?B?M3RlSVFKOWJwTGw4cUNmallobXMvMzU3OVowWDQrTmVHOU5SNmpFcXBSU1NE?=
 =?utf-8?B?aVBpS0VCVGUvRktHVjFUdXBUVVhJWWJWUUJoKzE4NGhvU2R1Q0V0ZHRJWFpp?=
 =?utf-8?B?c1RJRE9kb0ltUk9DK3ZFQWNVZUhRNkZlV3ZocDExOUQxNmc0K1RTYmtsSlZB?=
 =?utf-8?B?bXVBVC9OY21ZSmw2eWg3M2tNaklUNmVRcGxNNFZjYmxWWk5uNERDZ2pScTQ4?=
 =?utf-8?B?SFVtMkNUb0VZVGwxVXorWkhIVm5MbUdaTG1sUmdxQ0R4SzVQS0dISS9KSHB5?=
 =?utf-8?B?aDhIK1dWTUJMb1hCYVhGL0QvMFRLUzFKTkZ5WFZyR213WjBoRkpZeWhCdzBS?=
 =?utf-8?B?WFR1cXptSzRWemx5anM0QklFWDFSOHB3cUd3cnk3VU9LNFpXTTVtbDZMVTl0?=
 =?utf-8?B?S2dGc2xQUU9LcVpJcjN6YmNZNWhGNXpmODZGLzMxTHFDeDUzbUNuR3Q0bXhX?=
 =?utf-8?B?dUhhbmZmRjFlZG5JdXZTWGxmbXA2UGRlMlluTHB5d0YyaXlPVXNpQlRuUi8w?=
 =?utf-8?B?MTdUbjEvclRKQlY3T29lMHRWMTdpS3lpNTN5cWFFSVNoTkpsbjdXeXptUlRt?=
 =?utf-8?B?bWcyUG9tNVFQUG5uTHVlS1lDeGpFS3NIYXlOQlFSQVpEdFg4bkpaTnArY0lS?=
 =?utf-8?B?OVhyVmtlWFVLYUNKRE8ycXphM1R0Ym1OWHdCbE84eUFqVS9KUXAzbU43MkR4?=
 =?utf-8?B?elpHWGNFUTRPenRBL1VaL2NKZzl6VHlxaUt0RFlNZTVJWFVJQXM3ekZKZkFI?=
 =?utf-8?B?S0dKR1R3N0hVcFF5WURKYi9waTJidGR6SzVKSjlEdkc0OVdhdDVpMzlZNGIv?=
 =?utf-8?B?WHFyYWNtbW5RTWQxNG10ZWdJQUtSSUplSHc0T0hmdVM5TFJuLzNNK3NlTTdQ?=
 =?utf-8?B?VE1abEJDT09xZXRTYkljV0VqRTNZMVQ4WExKaHVIa045M1RLcUFkL1AwdHBD?=
 =?utf-8?B?cVh0K2NHRXJ1bDRjNDlkT1JKTk40SzZlSlJzUUR2TDN3R20ySVpOUjNDMUI5?=
 =?utf-8?B?ZmxxeDVEN05NVHRoZHBuWTB6OHI1MkdFNFp3OElKeVkySXVJRzdKWHJJNlBO?=
 =?utf-8?B?QTREb1pjdlA1Z3VjbHRmZXAyZEc0eXY2SU95TUtlb05IVHZ2OVVnaC9iR1ZU?=
 =?utf-8?B?STQ4UjdlT2daWXczZmNvYVNOWGFmaTNvVjQ1M3ozeXNzUnZhSFJoR1RiSHdG?=
 =?utf-8?B?T0t0a2c1VU80a1k5TVUwN1pURVRQeFBDM3dSWEVvc1gyWVJEUWRHc1lPZmds?=
 =?utf-8?B?UzhTbW04K2czUTJOVDBUQmhkOE9aY0o2UXV5bUJ3T0I2enRNMElWRFVkemgy?=
 =?utf-8?B?bFdKRnlyVGhRbWJpRlhRUkIzdGx3VGNoQU9keHRYRzJIZVlwZUFwQ2NwbEs0?=
 =?utf-8?B?bGRkMm82RnJ1dE9JTlhqeklnZWFGZi9iTDRVN09ySzhDZ0hJa2k5aXNtUVEy?=
 =?utf-8?B?L2g2SHFHaGtVbUl0VEZPaHlDMGtXRHloWUdobmlzdlozbUx4Zlk4QjNVU3lJ?=
 =?utf-8?B?dWMyY0dDRnZjZkxmcDRQbW5SMmFrdTloMTROS3IxcUdHVVprWnBSYUlXR3Yz?=
 =?utf-8?B?N3NOVHlEOHNkNVRRSFFTcVhjb0VhRERmZEh5OUYxL0lOaTJxRXFKM0Vkam1P?=
 =?utf-8?B?SU93bVBNVmJwY1dCVGVFMFV3VjlnSitBTjdGYjdFWWJ6Q3dCdUd4TXp1SExM?=
 =?utf-8?B?NFRBNXpaWW5YNW4vVVNIT2NXNTlmcDVPb3pwU1B0bzNVQW96Ylg4Q2dHZ0ta?=
 =?utf-8?B?Mk9XdkdSa05BOUtncTJyb2NIUjB3bElnSFBqemR3MlFreFhURkcrMlJYWHJj?=
 =?utf-8?B?MHFLREt3MEl5THFYTDF5dnJhNjRub2VCWnNpUm5SV0dtU21YYko0UDNPOERu?=
 =?utf-8?B?RXJpSUw1OW9Ea2lta1JBeldiVE1sb1NjQW9hQmQvc2JYRnlFbk9mQkl3TkV2?=
 =?utf-8?B?c05pdVNHWWg3eTRCRllXSWdGVUNQZzJZb3l3b1JsUlJDWFQ0SmhYbktaelpJ?=
 =?utf-8?Q?dQonHgAYO+nqFicJpyvkV9OXnLORsrdpiDSGm?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8844f35a-a2e4-40a4-a804-08df393bcccc
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 23:48:31.4534
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t1AhyZmDcLRJ7muYbTM5/mSzOW6Dpanfl553e1SVW34KMZG3v2KbUPqtS1Q7R+jgh1eB4QZc65ZnusjA+83KiDeUx5zrCxbtUKxEi12tWNsXs1ifQW+fR2jACuZ/NIsI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB12221

From: Peng Fan <peng.fan@nxp.com>

Per reference mannual:
GPIO receives a single clock, which is used for register access and
synchronization with external pin inputs. So drop the 'port' clock.

Fixes: b516a4dd6a1f ("arm64: dts: freescale: Add initial device tree for i.MX952")
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx952.dtsi | 25 ++++++++++---------------
 1 file changed, 10 insertions(+), 15 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx952.dtsi b/arch/arm64/boot/dts/freescale/imx952.dtsi
index 1154b66dadb2..22f02f48298f 100644
--- a/arch/arm64/boot/dts/freescale/imx952.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx952.dtsi
@@ -1024,9 +1024,8 @@ gpio2: gpio@43810000 {
 				     <GIC_SPI 50 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-controller;
 			#interrupt-cells = <2>;
-			clocks = <&scmi_clk IMX952_CLK_BUSWAKEUP>,
-				 <&scmi_clk IMX952_CLK_BUSWAKEUP>;
-			clock-names = "gpio", "port";
+			clocks = <&scmi_clk IMX952_CLK_BUSWAKEUP>;
+			clock-names = "gpio";
 			gpio-ranges = <&scmi_iomuxc 0 4 32>;
 			ngpios = <32>;
 		};
@@ -1040,9 +1039,8 @@ gpio3: gpio@43820000 {
 				     <GIC_SPI 52 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-controller;
 			#interrupt-cells = <2>;
-			clocks = <&scmi_clk IMX952_CLK_BUSWAKEUP>,
-				 <&scmi_clk IMX952_CLK_BUSWAKEUP>;
-			clock-names = "gpio", "port";
+			clocks = <&scmi_clk IMX952_CLK_BUSWAKEUP>;
+			clock-names = "gpio";
 			gpio-ranges = <&scmi_iomuxc 0 115 8>, <&scmi_iomuxc 8 85 18>,
 				      <&scmi_iomuxc 26 53 2>, <&scmi_iomuxc 28 0 4>;
 			ngpios = <32>;
@@ -1057,9 +1055,8 @@ gpio4: gpio@43840000 {
 				     <GIC_SPI 54 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-controller;
 			#interrupt-cells = <2>;
-			clocks = <&scmi_clk IMX952_CLK_BUSWAKEUP>,
-				 <&scmi_clk IMX952_CLK_BUSWAKEUP>;
-			clock-names = "gpio", "port";
+			clocks = <&scmi_clk IMX952_CLK_BUSWAKEUP>;
+			clock-names = "gpio";
 			gpio-ranges = <&scmi_iomuxc 0 57 28>, <&scmi_iomuxc 28 55 2>;
 			ngpios = <30>;
 		};
@@ -1073,9 +1070,8 @@ gpio5: gpio@43850000 {
 				     <GIC_SPI 56 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-controller;
 			#interrupt-cells = <2>;
-			clocks = <&scmi_clk IMX952_CLK_BUSWAKEUP>,
-				 <&scmi_clk IMX952_CLK_BUSWAKEUP>;
-			clock-names = "gpio", "port";
+			clocks = <&scmi_clk IMX952_CLK_BUSWAKEUP>;
+			clock-names = "gpio";
 			gpio-ranges = <&scmi_iomuxc 0 103 12>, <&scmi_iomuxc 12 36 6>;
 			ngpios = <18>;
 		};
@@ -1411,9 +1407,8 @@ gpio1: gpio@47400000 {
 				     <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-controller;
 			#interrupt-cells = <2>;
-			clocks = <&scmi_clk IMX952_CLK_M33>,
-				 <&scmi_clk IMX952_CLK_M33>;
-			clock-names = "gpio", "port";
+			clocks = <&scmi_clk IMX952_CLK_M33>;
+			clock-names = "gpio";
 			gpio-ranges = <&scmi_iomuxc 0 123 16>;
 			ngpios = <16>;
 			status = "disabled";

-- 
2.51.0

