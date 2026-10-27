Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.83.31
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793103233;
	b=jVeH0Lcbx3xnSQ+ebiTcarGPl2ErFqvr7fYIr7z84dTULkXnBmDcavmqcQdXaVGDhnpd
	 +4vEhJ2WOX8/jH5ShqIzLdkBSly2J10OLIhp2PIfLJllK5gNnlsyYG2M6jBIp9NiLWprG
	 ROnsPtgprxOCSspoTzMLjP5GKb+ZskUfFVxAdgmswIUVn/YDiIvb22Zb8vATIWcOQGRHh
	 xFHTGZDc6KpKkMj+nVArRDyx5RgxKSqKFxnOlJqC2OOc/o2M9JtgPUnGquoHaTjrkxIdU
	 /m6Mzho+u1Kl243EzAV/6TvD2qSkH8yUqK3/4pjva3RCR8TcmQHCSUJVPGV8nELW3NA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793103233;
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
	bh=YZVMmro61KcVizqRosp6Atg2N2TkDy78/wpvgdKwaoQ=;
	b=FYg/phLGaC0fnQJnT+yNfOh4g294h1mJWiBrzbv7L1SmfXg2klxnGBkseyYTF9PQI2mv
	 IAYbsepAKcE43kjPE7Ri8GmjfQBM+oJpM46crHvfvlloI34cid7bOSJ37KFHuauSG9jdN
	 tvcKvCCniYjg+3k9hIhl+ogRu045SUIUFEa0Ivq7xeSgfCuR//gJ2u+poJtQpUQHFcWu5
	 pBzQCMhXetDaumDhAK/Y12vz2pzgFQF0+qwqbgGywhYDmLw1EUuknk8/y1+R0ouVRbI/s
	 5ZWJLy+D92i6te+JICQB0Eas4oUTrL1LxGKsxIOajYKsbrmKdMwfBCa7adjYv83AJGQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=JBYdZZNl;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.83.31
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013031.outbound.protection.outlook.com [52.101.83.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDEE560A6F62;
	Tue, 27 Oct 2026 12:13:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BDEE560A6F62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=JBYdZZNl
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oNaQmdvBVE9acXjXDsVJzhWmpc06ViZ3D4tBb47PzjG8Q/eeIEwN4O4gn1k5e22HNPLO8EkTeaqMV36VuvND12Tke9ktQmXWIGe6Jw7Ane+CZO6npvA4DAbyvHJ4faAaiRPnjn0FxL1r4DUbkjRD2TtR79JNRjl4m217v3NlIsroL7nAHqSnYoziZJrL5BC2VIiZ1Elx/S99aEehwg2IpGGpNHDx4QCOAsYd+Xub91WuNRvl5HtB+4jE27pZd6bwlqZ6GWjbHHarGaVoPNOINAOhR6fqZPyh0MyF2YEpFQ/QYQAIJMlbFca2Xwb8AjiVbVcojKvNSEMcngN0StLj9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YZVMmro61KcVizqRosp6Atg2N2TkDy78/wpvgdKwaoQ=;
 b=WPaDKxfUlD0OZj3QXi6mgRTwLHEidovUnqUTNj847yPGnMHLnva002aqmhFI4sLAb6r/U8jQkh0o23363iCtll6cRa69EbKWoM7juRwpgpyfBVPqQ99CzW11cEOhFiXyqQWhMp8XOR85uBtPsEK3ahUkYmJJoSHDO7mPXPrWt6dgPZFm5t5Z4mglKImf4+HRejGERgA8SwwC8aJ/hhGO4JYy+P2NAs6KgYC1T9ZOfAD6JEYThUeYFDJS4g5Xf+ZuWyf6c61NsFCNBLsHJG+yPR3hSGi5alDAwPb6tLUuOwWhFn1LB3z9QqAAPAicYF2BVL0dR2vg39monucDwOqAbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YZVMmro61KcVizqRosp6Atg2N2TkDy78/wpvgdKwaoQ=;
 b=JBYdZZNl2JobyJNaZQPEgQvKqCxxkXKkl0GYbdNgBgV2eD9Y4cwosRbhkL1/rWtsjd94nWse0Pc0WfewK2v8O2t+LZGz45gNULL11qy9f6ElvOM/zUrr1DxnU2CprKdLWbRBLJxu1IsRec2bJWaPPCAGFNk1GteHBbgn2ji9I/vpJGm8mZNoTojkNyvGNyffKjjFQtlqmoej5QNMMeAGp3k7Amcwjxu/75pKFyvWd/D0Ofl+prqoAya63A0LkVaBEKYkruNQzy/wIajbuS6qTdknzr/RMj7ptLhbWbt9BzV2WcKc+hf+WtWsQS0zM14dW7xDeB8Jblg/aWztCDgEQg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by DBAPR04MB7462.eurprd04.prod.outlook.com (2603:10a6:10:1a0::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Tue, 27 Oct
 2026 12:13:49 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0546.021; Tue, 27 Oct 2026
 12:13:48 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Tue, 27 Oct 2026 20:09:37 +0800
Subject: [PATCH v7 10/12] gpio: mxc: introduce MXC_ICR macros and use
 field_prep/field_get
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261027-gpio-mxc-cleanup-v7-4-v7-10-7b602d70c149@nxp.com>
References: <20261027-gpio-mxc-cleanup-v7-4-v7-0-7b602d70c149@nxp.com>
In-Reply-To: <20261027-gpio-mxc-cleanup-v7-4-v7-0-7b602d70c149@nxp.com>
To: Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: SI1PR02CA0018.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::7) To AM8PR04MB7874.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|DBAPR04MB7462:EE_
X-MS-Office365-Filtering-Correlation-Id: e090211e-7f10-4f54-d4ca-08df3423c184
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|376014|1800799024|23010399003|11063799006|261021123027099003|261021121427099003|261022115727099003|261022075727099003|261009223027099003|56012099006|10067099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	se8XU6HMhf5TnjYAJuPzq0hQWa5YaxSnRL0zbuG3XMsropqp+mnAjE5eIiAAzngksmDdJz3LEzkEiErrXYLJZGY+xmYPFowCmIfAqRLBsfCOfSqQl+msSlBCvnABlDaeHcmLCK7VqvxeDVXZsPzlhAKo2+ubicue4omYdKSGUYXDmnTJuTA1ViGfBDV4zEPo00LA2nnr24lgmQgfMp88joKm6r6+aqWzpUzKa6/3y7lkUxD6Iqhrb3xSkIbUAev6zVzK/g8E0TWedGmpsH08SjT78kFRxMiRNNIojM33xtgAcTw5ysKay/faY59TOTDyY4cmw/AekFuTZnu0CfPq3QyADKcBYnkCp/cRCInPCBL3luSJDstJeuDUdjVC1QjJEth8ik3esCzjrWRx4VLTwhRvEKfi0H8PAO8XxCv5NxDdwFM+qc6n+tujf33cgHtiORDgNvlphmvSj+qv2E0Y+tnPG6G3kr1hgak/q2mioHvbRKU2uf5/2gGhXTcTzI1GQI2rQvVXF+H/dG1FZCN6khxm4w0AnRziZm1f3zc2pqnZ85spkdqyvX+Pq6uraeV0ZtT/90zKUkxKirHteaWNLhp8J66xW+aMp7G6FqsMSayEtmVOIAtzO3dCdp0QrWCZUbUVfwa4AALx03+M46mydoeYsMUEdaYzTGqmDBnROhs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(376014)(1800799024)(23010399003)(11063799006)(261021123027099003)(261021121427099003)(261022115727099003)(261022075727099003)(261009223027099003)(56012099006)(10067099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aVo5R0VYcmRnbVQ2anJIeEZXWWVDZEZiOVNUMlFHSWRzdml5dUY3S2Vaa3Nl?=
 =?utf-8?B?M1pOL2Y0RU5qUkMvSnlhMnJJV0dLc1ZDZzc0R3VyOXFacG5IeDZoUnpNRTJF?=
 =?utf-8?B?cVlRY0VmSWIrd0JjUDlPelI5TklRZkE3UTNKaVRTblZiVGpWSEZUQ29ISzMv?=
 =?utf-8?B?U2NQV0VTWlFTUG91bk9lZ2xadVdhWU02a1ZLWk91VFU2eStHdm5zK3RVcUdz?=
 =?utf-8?B?YXk2QmZpNm9UNTlua1hkTlRIRXNUNTJyWVlGV3VDRVhWSTFTNkZiOG5JQmI5?=
 =?utf-8?B?Q2REdG5JU29GS0VOOW1BVEwxUVBhaVhIdjFQdmtXSk5USGNyQlBsK1VLSGdS?=
 =?utf-8?B?d2pJOVRISWMwaXF0Q0l3bFhxcTZVZEphVGxOUnhLK0s3WW1QcDBlUU5vcGxO?=
 =?utf-8?B?c2dPd2JQNHc4Y0lRbmtFN280QUlHa0JKa1dudUJXMlkycWRTS0ZFNCsrVUxR?=
 =?utf-8?B?bEpoRWpiZm85d3JrdE9mWnJUOC94dEV3UExEczdHS3dmRUhpRGhCRXBDT21T?=
 =?utf-8?B?SHlDUGhJZDREcVhZRUVXVlFFTDlLWjYvM2hHd1R2NFZoMkhJRVF1OEtFa0NS?=
 =?utf-8?B?S3JkSEJ6dmEzaC9UUkN6dlJnNkovWS8xalh3Q1FJZHNPRnovaW9rTDd5Nzla?=
 =?utf-8?B?NFBFRDhJZlpUZXFnSHUrbXNaaFREWWdYQjNqUldUSnNWb3g1UlRwbTJrNTlN?=
 =?utf-8?B?YUlDRUh2NzI5VmhTU2VST2dGMjBXWUxDTGRJOEtLbXEwQWxJMjlqTi9DSTBL?=
 =?utf-8?B?SkJBOGFCak1qTFMyUG5BRlM0cFJ5RFlQYmR4Ym02VUJucmhmSmEzQzVtNUE0?=
 =?utf-8?B?U1lPWStCMk90MG55V1JoMU44ZEg4WGpWU0k2QUtaRVFiTStrZ2V0aTY1RFQy?=
 =?utf-8?B?Z0VQcW1WN1lGUm5xSzBwQVNEd3pOenRlam44M24zTzJzZ0xMSWV2Tm5MejM4?=
 =?utf-8?B?TkRYRGxwUEI5QjJ3UTBXWmYzSWRVZEU3b2F4QXdUcURtNVpROEwrOEhXbFBQ?=
 =?utf-8?B?OWRpSy9rNHg1aTZscExIMkpablVTdGxCb2dtMmVlQlhMbm85Yjl1T0VacmVD?=
 =?utf-8?B?YmlJV3FTa0w3Ty82dWtPSTBwb0VLMmRuZ293dG5sQy9IaGVHTk5Pbk8xS0VX?=
 =?utf-8?B?TE1GK2ZZTGRKYXIzalhlNHBHZllOVkx4TWx0K2cvMlI3SFRTdHhPU0VPTzJF?=
 =?utf-8?B?N004WTNOY0dSUVJzWHhVRk5ReDlSRDR5ZkFPMWpJQVYydnM3UkN4anBoQnEr?=
 =?utf-8?B?akF2SFh6Wks1dk5mWWZVU3VITE1vV0hET1IrNHpxdERkcTMzd29rZWN3MUdV?=
 =?utf-8?B?WTgxOEg1b2JMZEFiVTlmZGhCSkJuLzRMVUpTNmhJMHFmS09nK2JIeDhkTUoz?=
 =?utf-8?B?a3VDeVdlOGgzRW1JQzN3cmM3Qk90czJOTnZQbVp5YldRdGtaNGZNVDFab0Yz?=
 =?utf-8?B?WWYvYlVvc3k3bllkcUtyYWJKYjl3Sncyb3JDT0FIQnN3QzNhaTJXQ1Yxbkhh?=
 =?utf-8?B?eHVEZWRjSEZHOEJjMXBiaFBnRm55WmpOOEM3TGg2Z3kxNGtZdnRzVmdzQUtM?=
 =?utf-8?B?TFVrRFVoZi9WMVZzZFB3eHJnQ0dLRHNyMFJnNndUVXBmYmMwOTN5RmJUVTVJ?=
 =?utf-8?B?eGRQUExMVktnT0s2RGNFeC9taEpHT2VYZGlDUlppQjd3MnZEc1ltblNSRm96?=
 =?utf-8?B?NGs0YkpQUms3cDRHSHZSS2NnN1ZtZDZyK1huNXluM0QyRFhOUWpMRTYvWnhL?=
 =?utf-8?B?bnRlNGRrUi81ZC9zL2lQY2dwcVRzOGJrQzcvMFdDbmNudDc2a21ja2ZnbEo2?=
 =?utf-8?B?TWxWeitCbDdZdlJwNnZNVWRlc2t3eHdXWTRKTjdLdUtpNWlxVHBkdUpmWmp4?=
 =?utf-8?B?V01SNVdHRFhReHJQYVVYWmk4YStKSEFFUkFqRjU0NHgzazI3bTFFbU5jVVlP?=
 =?utf-8?B?bVFaME9pRmdHTDU0VHlKbWJNdnJpN1VjOUw3U3RJSGp0S0dCaGt5cW9obGFS?=
 =?utf-8?B?WlpaRE1ETTdSVVpiZWZtTkNmM3RoS0trQ1ZFd1dUQ3p0OWJ4RWJDVXhuVE9I?=
 =?utf-8?B?LzhtTDFrL1lHZDluWnl5b1JySC9vZ2g0cEtpZVRrdzRuek1ZSmhoQWZzY0VI?=
 =?utf-8?B?VktGOVZTUCt4K3MySjhGWDlYTzdxK2IyMzVVYy9GUi9mT0lRMFpwaTMxSG1Y?=
 =?utf-8?B?L01Jb2tjR3BDWnBzWFRlU2xtcWpldUtiMFFqRHJ4WTRnWUtpQmlONjQzdDRr?=
 =?utf-8?B?b3J5MWVFK2ZVbzVGSS83TmRYVjltOU9WK0VaZjFudlVMWXo0b1VJYVVmTE0x?=
 =?utf-8?B?eUoycUx4aWpaOG1mL05GcktsU0p4ZG0wRWdZbmViZE1ReThud1QvZnROZ0xz?=
 =?utf-8?Q?hHvGRlpTDQDShYeqc9it+6Y4MZpFd90izdaGZ?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e090211e-7f10-4f54-d4ca-08df3423c184
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2026 12:13:48.8681
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YqG+wQUL+2h8BO2EwMPSLhx4HpwHfNES2KLBlad20TquYQ1/HHRzUQcXTb9icB7WD7HNEVq3vzCPs28uhH8KrmZJzNX0T+7+8HWDBuDYcKzjpRYq7rQv25U62lylXyGn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7462

From: Peng Fan <peng.fan@nxp.com>

Both gpio_set_irq_type() and mxc_flip_edge() open-code the same ICR
register selection and 2-bit field shift/mask arithmetic with magic
numbers (0x10, 0xf, 0x3).

Introduce two macros:
  - MXC_ICR_REG(gpio):  selects ICR1 (pins 0-15) or ICR2 (pins 16-31)
  - MXC_ICR_MASK(gpio): 2-bit mask at the correct position

Use 0x3U in MXC_ICR_MASK() to avoid implementation-defined behavior
when shifting by 30 bits (pin 15 or 31).

Extract the read-modify-write pattern into icr_update_edge()
and the edge readback into icr_get_edge(), using field_prep() and
field_get() for the shift/extract operations.

No functional change.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/gpio/gpio-mxc.c | 42 +++++++++++++++++++++++++-----------------
 1 file changed, 25 insertions(+), 17 deletions(-)

diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
index f816822e36ad..87460dab67fa 100644
--- a/drivers/gpio/gpio-mxc.c
+++ b/drivers/gpio/gpio-mxc.c
@@ -7,6 +7,7 @@
 // Authors: Daniel Mack, Juergen Beisert.
 // Copyright (C) 2004-2010 Freescale Semiconductor, Inc. All Rights Reserved.
 
+#include <linux/bitfield.h>
 #include <linux/bitops.h>
 #include <linux/cleanup.h>
 #include <linux/clk.h>
@@ -189,6 +190,9 @@ static inline bool mxc_gpio_has_power_off(struct mxc_gpio_port *port)
 #define GPIO_INT_FALL_EDGE	(port->hwdata->fall_edge)
 #define GPIO_INT_BOTH_EDGES	0x4
 
+#define MXC_ICR_REG(gpio)	(GPIO_ICR1 + (((gpio) & 0x10) >> 2))
+#define MXC_ICR_MASK(gpio)	(0x3U << (((gpio) & 0xf) << 1))
+
 static const struct of_device_id mxc_gpio_dt_ids[] = {
 	{ .compatible = "fsl,imx1-gpio", .data =  &imx1_imx21_gpio_hwdata },
 	{ .compatible = "fsl,imx21-gpio", .data = &imx1_imx21_gpio_hwdata },
@@ -211,14 +215,28 @@ static LIST_HEAD(mxc_gpio_ports);
 
 /* Note: This driver assumes 32 GPIOs are handled in one register */
 
+static void icr_update_edge(struct mxc_gpio_port *port, u32 gpio, u32 edge)
+{
+	void __iomem *reg = port->base;
+	u32 val;
+
+	reg += MXC_ICR_REG(gpio);
+	val = readl(reg) & ~MXC_ICR_MASK(gpio);
+	writel(val | field_prep(MXC_ICR_MASK(gpio), edge), reg);
+}
+
+static u32 icr_get_edge(struct mxc_gpio_port *port, u32 gpio)
+{
+	return field_get(MXC_ICR_MASK(gpio), readl(port->base + MXC_ICR_REG(gpio)));
+}
+
 static int gpio_set_irq_type(struct irq_data *d, u32 type)
 {
 	struct irq_chip_generic *gc = irq_data_get_irq_chip_data(d);
 	struct mxc_gpio_port *port = gc->private;
-	u32 bit, val;
+	u32 val;
 	u32 gpio_idx = d->hwirq;
 	int edge;
-	void __iomem *reg = port->base;
 
 	clear_bit(gpio_idx, &port->both_edges);
 	switch (type) {
@@ -264,12 +282,8 @@ static int gpio_set_irq_type(struct irq_data *d, u32 type)
 				       port->base + GPIO_EDGE_SEL);
 		}
 
-		if (edge != GPIO_INT_BOTH_EDGES) {
-			reg += GPIO_ICR1 + ((gpio_idx & 0x10) >> 2); /* lower or upper register */
-			bit = gpio_idx & 0xf;
-			val = readl(reg) & ~(0x3 << (bit << 1));
-			writel(val | (edge << (bit << 1)), reg);
-		}
+		if (edge != GPIO_INT_BOTH_EDGES)
+			icr_update_edge(port, gpio_idx, edge);
 
 		writel(1 << gpio_idx, port->base + GPIO_ISR);
 		port->pad_type[gpio_idx] = type;
@@ -280,17 +294,11 @@ static int gpio_set_irq_type(struct irq_data *d, u32 type)
 
 static void mxc_flip_edge(struct mxc_gpio_port *port, u32 gpio)
 {
-	void __iomem *reg = port->base;
-	u32 bit, val;
-	int edge;
+	u32 edge;
 
 	guard(gpio_generic_lock_irqsave)(&port->gen_gc);
 
-	reg += GPIO_ICR1 + ((gpio & 0x10) >> 2); /* lower or upper register */
-	bit = gpio & 0xf;
-	val = readl(reg);
-	edge = (val >> (bit << 1)) & 3;
-	val &= ~(0x3 << (bit << 1));
+	edge = icr_get_edge(port, gpio);
 	if (edge == GPIO_INT_HIGH_LEV) {
 		edge = GPIO_INT_LOW_LEV;
 		pr_debug("mxc: switch GPIO %d to low trigger\n", gpio);
@@ -302,7 +310,7 @@ static void mxc_flip_edge(struct mxc_gpio_port *port, u32 gpio)
 		       gpio, edge);
 		return;
 	}
-	writel(val | (edge << (bit << 1)), reg);
+	icr_update_edge(port, gpio, edge);
 }
 
 /* handle 32 interrupts in one status register */

-- 
2.51.0

