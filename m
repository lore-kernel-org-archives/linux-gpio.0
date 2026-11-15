Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.66.121
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794752613;
	b=d0Ejf1fmtOWEq3QFjbrcmw/vS9b5acAqkETfUQAeFjr4QIWCuuVzfGfeiBpR4ZpMeuvk
	 pnWLIOxL8wA25CR+brwqoycSmap7kUXPyZg1SrOXdvEviHaBF4mKc4UDYWfnOqOAcEo/Q
	 /UzCTmEDDnGyBobF7TMp2rxFGeKRdiXvakvMwH8MrsOdZblPLM+RIHXVEqlKXmIATo/yn
	 PIVdSdwjm+RaVKx6PKEtceFEdHAeYJAVdrqfJRnSpOaBcjjlPnHlvTHkIVQDo9XaMHepr
	 4k9Nyx4ZaeTfef31EQ9ByUH24a9jgzL2Cu5LQQHqMRI+BqOO6XcHaiKtznktxhakyZA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794752613;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 User-Agent:Subject:To:Cc:References:From:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
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
	bh=I8HUhtZ5MwClmBWm0dQaacHBjcMceS8Buz3STUxVffU=;
	b=cF5c5pgCBP/lRQReET7ib1EHhfVNDJ2ZOqtEm+9LWO81EZxVWR4yRzoEtKQHZoNfxpHe
	 dvo8NwlVRdWNqnpw19nrReeka4sIr2d2xl2xnqCj42jwh+ErNU+XayQPhFpllNTOQ4dnn
	 0nGKumY7YjMn8sqUhfx+euYAAYxP7wUmS9oSJSTBXhxed1AngQoTVAvdV5rXfLu/+xAxU
	 PszrecFaplmjhGzzYd0CdyNMpzV9EzZ3iXnfwwdmb8SCH4wc3gZeXojEeTyBOe5HaptAu
	 noqIM9p1nQAiSAtt+d0lrrt+5tGlBMS7aZTI/DK89PiiiB+AcG/CC+CsJIorieT8XeA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=iopsys.eu;
	spf=pass smtp.mailfrom=genexis.eu;
	dkim=pass header.d=iopsys.eu header.i=@iopsys.eu header.a=rsa-sha256 header.s=selector1 header.b=OA561BLd;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.66.121
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11022121.outbound.protection.outlook.com [52.101.66.121])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F05F606A31D;
	Sun, 15 Nov 2026 14:23:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F05F606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=genexis.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=iopsys.eu header.i=@iopsys.eu header.a=rsa-sha256 header.s=selector1 header.b=OA561BLd
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wBvNCFiPB95Nga11OZmTUUXCr+b+zgtWQgcP55cA9W31jEfyOnlYsxHbxueDR6G9AxMzXZ5cLPwbLsEcsh/CCtmz0ZEOCpvDyqWZS7oXnrE94l+WsHy2FaqBcVKy9DBajjLfFvkuzRk4lcZCG1A/coatGNCD9IoB+rLhsGjV2pw9NAovVDaGY1e8Bt6rSLAcS4B9o9XyzF5o6NLFOoS5SWOgFndlhNT0r61OMZXLjGD1iJRm0Iwo1L4zPgcoAS03+wRZo3ZAJFBwg2HYKWdlqH0be01rgRtFxsyWmdceqdK/Qo+v3RzdnI1fHm2WyRVe2k4EK8j3yM5U0dsriPuabQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I8HUhtZ5MwClmBWm0dQaacHBjcMceS8Buz3STUxVffU=;
 b=Mnc634T80x07AAn8WMHuw2Z4BMWMo1DaCeOPDJWnfIzOHpNWLmvcL3SzDAWpRBlNV4Jf8Pfxh4/zeKiXqb4r1N/Knxfz2bo7ybJPipBTRgcEoWDK36OPEwfclDwiIKQOtC5qyjObBLAt8CCfXtALeFJOPwBLrZBEPFoKnqOLpVqDrz43QPAzrWKJnDVbmFgfqATyOY0jdtYRlmaVP+nLGwy7a3LfTcKDUmqVUuizAvPznpEb/y9pm8Pz7P419Ejcff6yCiV0fTgK9mgD1ZmzyjE+7n7hsWPPqT3QOMm/vEnWFJITKbcLUqiUGTnjCbEonSKGzSB/tasGd5ZAFDr5tQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I8HUhtZ5MwClmBWm0dQaacHBjcMceS8Buz3STUxVffU=;
 b=OA561BLdaQLI9Ya7xMfZhAhNxaCEXoO/FODwyOdfDHflVrdk3GMacTLP1Gm/KtXh4IDw/sEAAaaeWlCOZMD6cPR+03hMf5SiNphtVbUv9KoScAm9+ThVkNCeG/8vKEKgfcL8rDDWbDmE4PPpiyymIqPcztpLSHJfy+t0EcP9chu4WesqYvQ4OjZI7oH76kGZ9tZyBuQgNypMAaXRAYAo4CDKTXV/rKvqzZh3kbeAX52p8A56Bvju0ojAagcXQWd7SZNEiyDa1SMT6t101Ocpz2rLERMWTBvd+If4S+WB3G4/0Cw3QEsctysWu4WoX1xJCT6pyOFPccSo98Gv8ISTOQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by DB5PR08MB10163.eurprd08.prod.outlook.com (2603:10a6:10:4a2::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Sun, 15 Nov
 2026 14:23:28 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%3]) with mapi id 15.21.0615.012; Sun, 15 Nov 2026
 14:23:28 +0000
Message-ID: <deffd989-f1cd-437e-be90-c908ecb448f3@iopsys.eu>
Date: Sun, 15 Nov 2026 17:23:24 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/12] pinctrl: airoha: an7583: use force GPIO mode for
 GPIO requests
To: Zhengping Zhang <zhengping.zhang@airoha.com>, linusw@kernel.org,
 lorenzo@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 brgl@kernel.org, naseefkm@gmail.com, benjamin.larsson@genexis.eu,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 lei.dong@airoha.com, ansuelsmth@gmail.com
References: <20261110094339.749110-1-zhengping.zhang@airoha.com>
 <20261110094339.749110-10-zhengping.zhang@airoha.com>
From: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Content-Language: en-US, ru-RU
In-Reply-To: <20261110094339.749110-10-zhengping.zhang@airoha.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: GV3PEPF0001DD9B.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:401::6c6) To DU2PR08MB10037.eurprd08.prod.outlook.com
 (2603:10a6:10:49a::20)
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
X-MS-TrafficTypeDiagnostic: DU2PR08MB10037:EE_|DB5PR08MB10163:EE_
X-MS-Office365-Filtering-Correlation-Id: 19751647-7c64-463e-7ce9-08df43240448
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|7416014|366016|1800799024|22082099003|18002099003|6133799003|3023799007|4143699003|11063799006|56012099006|261102123227099003|261026140227099003|261028144727099003|261022075727099003|261021123027099003|261021121427099003|10067099003|261009221227099003|261022105027099003|261009223027099003|261026121527099003;
X-Microsoft-Antispam-Message-Info:
	bfASguABk9qmRVM3n1bpSUklooskc+XeEBrVUrI0IiuoW+mEsODylNajEJc+YtSZ42pjkmUb2suqfGcf9UBS9Sf7NKaqSlOI8VDeHXT+dT8JjgMAmOsWx3fvryM3WDUPpt2DBEvCTOOQGLLIyzTZZQHjSWI5shjgoYvMopkas2TxesKqSZcg9jXmijC5kdm1D18Gj2OOy7l571n6fZ6J0PSoayNrTF1rUrv9UQ91y3NgHQOTyEv++4MtuRlcjHnqwlB/qzoqm9h2iB06S/H6CfE6/aKnp+C768xrCRoiCKaOkw9Q+0+h1K/HtY1k6P6j+wT+RSmHwZWteE/EDeeSCkaheo13uvVChORx4rpdx0m5BkOxVh8FwAjy0NP9cW3Sc0qaH5JNcRTbqMT4qU1kNQnchzvxgP8um4WRrunPIk2OrfjrPe2qkK3T1uMs75CJCQg+FQWTo1tqO4MnFQYSANfrD1vtth0S7HU5WjvX0tQ5Z9EdCwXLmydJ8Ko+giRnL2eUkRqqX/nTvhPPrJSnuPGxFPGH9LVA5f/f+yMgIGTv2Xa8I/dYzbtAmqkxuRWzRq9crUNhZXW8o/DhrWneBjokko6ZPV3aP2xFjt6lJKV2Q6F2LpNVjd05LfLYTq0kgsRC4g1EqOl6n/Lzw3e97s+EapuwckafHS4CarmzhQ8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(7416014)(366016)(1800799024)(22082099003)(18002099003)(6133799003)(3023799007)(4143699003)(11063799006)(56012099006)(261102123227099003)(261026140227099003)(261028144727099003)(261022075727099003)(261021123027099003)(261021121427099003)(10067099003)(261009221227099003)(261022105027099003)(261009223027099003)(261026121527099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eVFUTHdzQ0ttRXR0aWFrZ3pYYjlhTkh0bkt1eDkrbHhQdjl1VUUzNVprRGpl?=
 =?utf-8?B?dTlqdDBqY3NPV3NvMFllMm0vY2xGdUI1eEczRWV1cUJRdVd3aDBhNjJZWkhN?=
 =?utf-8?B?WlQ1SjFNN1lGRFkrSlJiZjFXOGI5NDZDZEg5SW41clM5U2pQcFVpT0c1R0pG?=
 =?utf-8?B?SVhwbG5pU1loRmpvL1Bpam1QMzNoTytzeldkLzFwQ3FWRmFtamFGRVkyUUYr?=
 =?utf-8?B?NGRqM1V0elBneEpGcFJkTm9paytQRWZaMUoxekhCcmF6dElFbnhRcVdtU0RL?=
 =?utf-8?B?TkI5enBVc3BQMExNYlVVbmdwSGVYQTE4LzZwRzNORlpQWjJiNUNEQ3dLZ21t?=
 =?utf-8?B?NC9ObzRBUmg2ZlZ2dnBQRDB1eFZGeU5aeDVIOVo3eG1uU3d1bWRJQW95eUcr?=
 =?utf-8?B?MExxVHM3OFc2QUV1dm1wdnlNTXc3bFQxZTk5dERrM1g0a2ozeG1JbDEwSDZa?=
 =?utf-8?B?TncrVEFaRStYTWhTK2ZvSitIRHJ0VHpoazNMTzZKUDFpWDNUR2p0QnhGenVK?=
 =?utf-8?B?ckZSaTc0UHVNZEROV3dNRlI0bFVRMmdieElLRnI2VHVwOHBqMlNJREN5NWZJ?=
 =?utf-8?B?UFJ3dHU0eDEyK0k2Q0xyaGJFajc4M05JTVFSUVBqWU1MZjcyajZRTzc2TllD?=
 =?utf-8?B?WmM5aXg3ZTNBT1N1eXFvSHN3clRzVldJMmh0cHNQRmRRU3kvekFwK3QvQ01R?=
 =?utf-8?B?dXdVTmY5OE9BL0JjNEw2ZTFUT1hCQlZBek5BVVVKank5S3RhUDU2bFhJZWtp?=
 =?utf-8?B?RGhmc2liejN3a2orcmM0NVJGNnh5eTA4RVpFYWxQd3F4VGt4RHVicnE1dG9u?=
 =?utf-8?B?aDhBdkdjQlRQdFU5eTNKZmZHbC9jbmZ5RWNITk9Va1NwTzF6NFlNQ3VoVVo4?=
 =?utf-8?B?M3I4clJaMnJTNkFNeGhQdE5rUzZlMTJWbkRDeTBud2NKKzBWNFZtbEl6TTdx?=
 =?utf-8?B?UDkwbzZzVUxBL0hLYmJuTTFpaDlXYVo1dm1KbG12Sk0xTWVRb1ZaNVhwb0cy?=
 =?utf-8?B?aTRDNW9PWmFKZW9DVDd6ZklIdWdJZm1uaGd3UVYzM1llZHJLem5qWDB6Q2VY?=
 =?utf-8?B?dkF1dzdabjBoRHFpdzhVT3pYcWo5bEZCc0tiZFlVL1poZWVRbll5U0NETnJw?=
 =?utf-8?B?dWR4WloyQ2k1U3BKa1F1UXRRd0dqWWlEdkpIa2dDd1RlSlByOW10RXV2WWdw?=
 =?utf-8?B?U2hFRlBRK0hQSDJVT1FickZZaEROcytkV1JKZGpOT21zV2tFRStTaWtqVzdp?=
 =?utf-8?B?VElkWW1pcTdZUFZHWXhNTG9keWU1aUNqbFpHU3VLalhQdnRranlTWWkwcDlJ?=
 =?utf-8?B?RDk3R0ZSczNiU29KSmhGcFIrVmhVcUN6Z09uTWxndExzcFRhMTJiQ3hiVFJm?=
 =?utf-8?B?eVY4NmtvUGdiakVlUXB5aDJEdCs1aGJaTjJzSlk0QkZReGhzallGSUMwVGh1?=
 =?utf-8?B?N3gyV1JZWnprdGh0b1Z1eXNUQnI1QSt1UTRRNEhYWVh6eEVwTFhiWDZRTGlm?=
 =?utf-8?B?YjB2WENhM2ZqQ0Z6dTBZOFBkbTQyWjJ5clZhYWw3RnlYYjVOa0lpamw5eGpn?=
 =?utf-8?B?eGtwZWFndFluUGx0UlpaYnhwQmppTzdtZENLdms3cFpRM0J5WndWSk5pUDhu?=
 =?utf-8?B?THJqaFdYMWhsNldZUTE5R1M4U2Y4Uys4cllKWUV2dEpUY0pCblpJS1B6Ykp0?=
 =?utf-8?B?VGR5aFNuUkhIc3Vmb3g5VllsejZGRmRjY1VVRTJTRmVKamdHWnhtcldjMlFK?=
 =?utf-8?B?TXlveGxnRURPNnc1VXpLZ2UxZkU5YlR6ajRuYkVjdUp0MWtMbFVnMFFrR1NV?=
 =?utf-8?B?ZjlFRTkrNjNLdjlRbDFYRld0cVdPeUU5eHA1eTl3ZkdyeitRWG9Xb01RWWtz?=
 =?utf-8?B?RDBaWWFtSlpjZVc4VFNFNzU5cExoT0I5MHdDb1FIQkk1WGNJS3dnOElqTFRW?=
 =?utf-8?B?d0dCWDF5Q3N0eDJUaVlNTmtmWFJaTWsvYU9mY1Zkd0FraW54MjRFOFBMVzE3?=
 =?utf-8?B?OWVNTGEyODJTUW95aTRXcStqY1ZMTlN2SDM4UUg1aFdVdzRUVW81Rm1mK1N3?=
 =?utf-8?B?R1c2Z1lESHN6MFZSc3FuYkZDMEZYZFAxK3l6M2NNL08wSlk3b3NZY0tpQUFJ?=
 =?utf-8?B?ZEszdnJ2VzN6aEgyaXN2THQyalJRbXdKRzVqemhxN3dQVDRsbzJFTXRhUEdN?=
 =?utf-8?B?b3N0Y0UzU2FUbXZuZG80NllWckhkVHF3V2Q2STZlL2Y3MXpsa3RPczNxNkF4?=
 =?utf-8?B?SUIyTmRSc1dLWG1QMTdqb3pxT1BjMFZzaElIaGRJU2EwNVNxYWZVbXJnNkN5?=
 =?utf-8?B?MWIzalU4VjFEZVJ5SmVOSndDL0xDd0RENTNOWmd3MElTTHl4NFF3aGt4WWZW?=
 =?utf-8?Q?nXqk+HuqVODYqtqs=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 19751647-7c64-463e-7ce9-08df43240448
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2026 14:23:28.1280
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 47owKmb1mGYD7jK5tG0g7QoCst4s6cvQ8KMgPsQ0GPtQUlUDij3fgvHYSAyEkCVLKS7dzYxbTf5YMFSdz7c6Koupl/jfMhgTmMzARpZdUDs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR08MB10163

I think it's better does not play with force gpio registers and just
disable (if no conflicts) functions that put selected pin to non-gpio mode.


On 11/10/26 12:43, Zhengping Zhang wrote:
> [You don't often get email from zhengping.zhang@airoha.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>
> GPIO requests can leave pads controlled by alternate functions selected
> by the bootloader. Enable the shared GPIO request handling and mux
> conflict checks so GPIO consumers and explicit GPIO pinctrl states
> select the same GPIO group configuration.
>
> Use per-pad GPIO overrides without disabling shared peripheral modes
> on other pads. Select GPIO mode using the following SCU register bits,
> where n is the GPIO number:
>
>   - GPIO1-31: set bit n in register 0x228.
>   - GPIO32-38: set bit (n - 32) in register 0x22c.
>   - GPIO39-48: set bit (n - 24) in register 0x21c.
>   - GPIO49/50: set the PCIe reset GPIO selectors in register
>     0x21c, bits 9/10 respectively.
>   - GPIO51/52: set the MDC/MDIO GPIO selectors in register
>     0x21c, bits 25/26 respectively.
>   - GPIO0: clear its PWM selection only; no force GPIO bit is documented.
>
> Clear the pad's PWM selection when selecting GPIO. When selecting a
> peripheral function, clear the GPIO overrides for its pads so an
> earlier GPIO configuration does not prevent peripheral operation.
> Set the corresponding GPIO override when selecting PWM output.
>
> Exclude the software-controlled TX_DIS/RX_DIS pads from the hardware
> PON mux groups. These signals serve the PON interface but are intended
> to be requested as GPIOs by the PON PHY driver and controlled through
> the GPIO API rather than driven by the PON hardware. This avoids
> ownership conflicts between PON mux selection and GPIO requests.
>
> Signed-off-by: Zhengping Zhang <zhengping.zhang@airoha.com>
> ---
>  drivers/pinctrl/airoha/pinctrl-an7583.c | 721 +++++++++++++++++++-----
>  1 file changed, 572 insertions(+), 149 deletions(-)
>
> diff --git a/drivers/pinctrl/airoha/pinctrl-an7583.c b/drivers/pinctrl/airoha/pinctrl-an7583.c
> index 74628a03ca909..e2f629d9d43cd 100644
> --- a/drivers/pinctrl/airoha/pinctrl-an7583.c
> +++ b/drivers/pinctrl/airoha/pinctrl-an7583.c
> @@ -75,6 +75,7 @@
>  #define NPU_UART_EN_MASK                       BIT(2)
>
>  #define REG_FORCE_GPIO_EN                      0x0228
> +#define REG_FORCE_GPIO32_EN                    0x022c
>  #define FORCE_GPIO_EN(n)                       BIT(n)
>
>  /* LED MAP */
> @@ -260,7 +261,7 @@
>         }
>
>  /* PWM */
> -#define AIROHA_PINCTRL_PWM(gpio, mux_val)                      \
> +#define AIROHA_PINCTRL_PWM(gpio, mux_val, force_reg, force_mask) \
>         {                                                       \
>                 .name = (gpio),                                 \
>                 .regmap[0] = {                                  \
> @@ -269,10 +270,14 @@
>                         (mux_val),                              \
>                         (mux_val)                               \
>                 },                                              \
> -               .regmap_size = 1,                               \
> +               .regmap[1] = {                                  \
> +                       AIROHA_FUNC_MUX, (force_reg),           \
> +                       (force_mask), (force_mask)                      \
> +               },                                              \
> +               .regmap_size = 2,                               \
>         }
>
> -#define AIROHA_PINCTRL_PWM_EXT(gpio, mux_val)                  \
> +#define AIROHA_PINCTRL_PWM_EXT(gpio, mux_val, force_reg, force_mask) \
>         {                                                       \
>                 .name = (gpio),                                 \
>                 .regmap[0] = {                                  \
> @@ -281,10 +286,14 @@
>                         (mux_val),                              \
>                         (mux_val)                               \
>                 },                                              \
> -               .regmap_size = 1,                               \
> +               .regmap[1] = {                                  \
> +                       AIROHA_FUNC_MUX, (force_reg),           \
> +                       (force_mask), (force_mask)                      \
> +               },                                              \
> +               .regmap_size = 2,                               \
>         }
>
> -#define AIROHA_PINCTRL_PWM_EXT_SEC(gpio, mux_val, smux_val)    \
> +#define AIROHA_PINCTRL_PWM_EXT_SEC(gpio, mux_val, smux_val, force_reg, force_mask) \
>         {                                                       \
>                 .name = (gpio),                                 \
>                 .regmap[0] = {                                  \
> @@ -299,10 +308,14 @@
>                         (smux_val),                             \
>                         (smux_val)                              \
>                 },                                              \
> -               .regmap_size = 2,                               \
> +               .regmap[2] = {                                  \
> +                       AIROHA_FUNC_MUX, (force_reg),           \
> +                       (force_mask), (force_mask)                      \
> +               },                                              \
> +               .regmap_size = 3,                               \
>         }
>
> -#define AIROHA_PINCTRL_PHY_LED0(gpio, mux_val, map_mask, map_val)      \
> +#define AIROHA_PINCTRL_PHY_LED0(gpio, mux_val, map_mask, map_val, force_reg, force_mask) \
>         {                                                               \
>                 .name = (gpio),                                         \
>                 .regmap[0] = {                                          \
> @@ -317,10 +330,14 @@
>                         (map_mask),                                     \
>                         (map_val),                                      \
>                 },                                                      \
> -               .regmap_size = 2,                                       \
> +               .regmap[2] = {                                  \
> +                       AIROHA_FUNC_MUX, (force_reg),           \
> +                       (force_mask), 0                 \
> +               },                                              \
> +               .regmap_size = 3,                                       \
>         }
>
> -#define AIROHA_PINCTRL_PHY_LED1(gpio, mux_val, map_mask, map_val)      \
> +#define AIROHA_PINCTRL_PHY_LED1(gpio, mux_val, map_mask, map_val, force_reg, force_mask) \
>         {                                                               \
>                 .name = (gpio),                                         \
>                 .regmap[0] = {                                          \
> @@ -335,7 +352,11 @@
>                         (map_mask),                                     \
>                         (map_val),                                      \
>                 },                                                      \
> -               .regmap_size = 2,                                       \
> +               .regmap[2] = {                                  \
> +                       AIROHA_FUNC_MUX, (force_reg),           \
> +                       (force_mask), 0                 \
> +               },                                              \
> +               .regmap_size = 3,                                       \
>         }
>
>  static struct pinctrl_pin_desc pinctrl_pins[] = {
> @@ -394,8 +415,10 @@ static struct pinctrl_pin_desc pinctrl_pins[] = {
>         PINCTRL_PIN(54, "mdio_0"),
>  };
>
> -static const int pon_pins[] = { 15, 16, 17, 18, 19, 20 };
> -static const int pon_alt_pins[] = { 36, 37, 38, 39, 40 };
> +/* TX_DIS (GPIO15) and RX_DIS (GPIO16) are software GPIOs. */
> +static const int pon_pins[] = { 15, 16, 19, 20 };
> +/* Alternate TX_DIS/RX_DIS (GPIO34-35) remain software GPIOs. */
> +static const int pon_alt_pins[] = { 38, 39, 40 };
>  static const int olt_pins[] = { 36, 37, 38, 39, 40 };
>  static const int pon_tod_1pps_pins[] = { 32 };
>  static const int gsw_tod_1pps_pins[] = { 32 };
> @@ -593,9 +616,15 @@ static const char *const pcm_spi_groups[] = {
>  static const char *const emmc_groups[] = { "emmc" };
>  static const char *const pnand_groups[] = { "pnand" };
>  static const char *const gpio_groups[] = {
> -       "gpio39", "gpio40", "gpio41", "gpio42", "gpio43",
> -       "gpio44", "gpio45", "gpio46", "gpio47", "gpio48",
> -       "gpio49", "gpio50", "gpio51", "gpio52"
> +       "gpio0", "gpio1", "gpio2", "gpio3", "gpio4", "gpio5",
> +       "gpio6", "gpio7", "gpio8", "gpio9", "gpio10", "gpio11",
> +       "gpio12", "gpio13", "gpio14", "gpio15", "gpio16", "gpio17",
> +       "gpio18", "gpio19", "gpio20", "gpio21", "gpio22", "gpio23",
> +       "gpio24", "gpio25", "gpio26", "gpio27", "gpio28", "gpio29",
> +       "gpio30", "gpio31", "gpio32", "gpio33", "gpio34", "gpio35",
> +       "gpio36", "gpio37", "gpio38", "gpio39", "gpio40", "gpio41",
> +       "gpio42", "gpio43", "gpio44", "gpio45", "gpio46", "gpio47",
> +       "gpio48", "gpio49", "gpio50", "gpio51", "gpio52",
>  };
>  static const char *const pcie_reset_groups[] = {
>         "pcie_reset0", "pcie_reset1"
> @@ -644,7 +673,16 @@ static const struct airoha_pinctrl_func_group pon_func_group[] = {
>                         GPIO_PON_MODE_MASK | GPIO_PON_ALT_MODE_MASK,
>                         GPIO_PON_MODE_MASK
>                 },
> -               .regmap_size = 1,
> +               .regmap[1] = {
> +                       AIROHA_FUNC_MUX,
> +                       REG_FORCE_GPIO_EN,
> +                       BIT(13) |
> +                       BIT(14) |
> +                       BIT(17) |
> +                       BIT(18),
> +                       0
> +               },
> +               .regmap_size = 2,
>         }, {
>                 .name = "pon_alt",
>                 .regmap[0] = {
> @@ -653,7 +691,15 @@ static const struct airoha_pinctrl_func_group pon_func_group[] = {
>                         GPIO_PON_MODE_MASK | GPIO_PON_ALT_MODE_MASK,
>                         GPIO_PON_ALT_MODE_MASK
>                 },
> -               .regmap_size = 1,
> +               .regmap[1] = {
> +                       AIROHA_FUNC_MUX,
> +                       REG_FORCE_GPIO32_EN,
> +                       BIT(4) |
> +                       BIT(5) |
> +                       BIT(6),
> +                       0
> +               },
> +               .regmap_size = 2,
>         },
>  };
>
> @@ -666,7 +712,17 @@ static const struct airoha_pinctrl_func_group olt_func_group[] = {
>                         GPIO_OLT_MODE_MASK,
>                         GPIO_OLT_MODE_MASK
>                 },
> -               .regmap_size = 1,
> +               .regmap[1] = {
> +                       AIROHA_FUNC_MUX,
> +                       REG_FORCE_GPIO32_EN,
> +                       BIT(2) |
> +                       BIT(3) |
> +                       BIT(4) |
> +                       BIT(5) |
> +                       BIT(6),
> +                       0
> +               },
> +               .regmap_size = 2,
>         },
>  };
>
> @@ -679,7 +735,13 @@ static const struct airoha_pinctrl_func_group tod_1pps_func_group[] = {
>                         PON_TOD_1PPS_MODE_MASK,
>                         PON_TOD_1PPS_MODE_MASK
>                 },
> -               .regmap_size = 1,
> +               .regmap[1] = {
> +                       AIROHA_FUNC_MUX,
> +                       REG_FORCE_GPIO_EN,
> +                       BIT(30),
> +                       0
> +               },
> +               .regmap_size = 2,
>         }, {
>                 .name = "gsw_tod_1pps",
>                 .regmap[0] = {
> @@ -688,7 +750,13 @@ static const struct airoha_pinctrl_func_group tod_1pps_func_group[] = {
>                         GSW_TOD_1PPS_MODE_MASK,
>                         GSW_TOD_1PPS_MODE_MASK
>                 },
> -               .regmap_size = 1,
> +               .regmap[1] = {
> +                       AIROHA_FUNC_MUX,
> +                       REG_FORCE_GPIO_EN,
> +                       BIT(30),
> +                       0
> +               },
> +               .regmap_size = 2,
>         },
>  };
>
> @@ -701,7 +769,14 @@ static const struct airoha_pinctrl_func_group sipo_func_group[] = {
>                         GPIO_SIPO_MODE_MASK | SIPO_RCLK_MODE_MASK,
>                         GPIO_SIPO_MODE_MASK
>                 },
> -               .regmap_size = 1,
> +               .regmap[1] = {
> +                       AIROHA_FUNC_MUX,
> +                       REG_FORCE_GPIO32_EN,
> +                       BIT(0) |
> +                       BIT(1),
> +                       0
> +               },
> +               .regmap_size = 2,
>         }, {
>                 .name = "sipo_rclk",
>                 .regmap[0] = {
> @@ -710,7 +785,20 @@ static const struct airoha_pinctrl_func_group sipo_func_group[] = {
>                         GPIO_SIPO_MODE_MASK | SIPO_RCLK_MODE_MASK,
>                         GPIO_SIPO_MODE_MASK | SIPO_RCLK_MODE_MASK
>                 },
> -               .regmap_size = 1,
> +               .regmap[1] = {
> +                       AIROHA_FUNC_MUX,
> +                       REG_FORCE_GPIO_EN,
> +                       BIT(31),
> +                       0
> +               },
> +               .regmap[2] = {
> +                       AIROHA_FUNC_MUX,
> +                       REG_FORCE_GPIO32_EN,
> +                       BIT(0) |
> +                       BIT(1),
> +                       0
> +               },
> +               .regmap_size = 3,
>         },
>  };
>
> @@ -736,7 +824,14 @@ static const struct airoha_pinctrl_func_group uart_func_group[] = {
>                         GPIO_UART2_MODE_MASK,
>                         GPIO_UART2_MODE_MASK
>                 },
> -               .regmap_size = 1,
> +               .regmap[1] = {
> +                       AIROHA_FUNC_MUX,
> +                       REG_FORCE_GPIO32_EN,
> +                       BIT(0) |
> +                       BIT(1),
> +                       0
> +               },
> +               .regmap_size = 2,
>         }, {
>                 .name = "uart2_cts_rts",
>                 .regmap[0] = {
> @@ -745,7 +840,14 @@ static const struct airoha_pinctrl_func_group uart_func_group[] = {
>                         GPIO_UART2_MODE_MASK | GPIO_UART2_CTS_RTS_MODE_MASK,
>                         GPIO_UART2_MODE_MASK | GPIO_UART2_CTS_RTS_MODE_MASK
>                 },
> -               .regmap_size = 1,
> +               .regmap[1] = {
> +                       AIROHA_FUNC_MUX,
> +                       REG_FORCE_GPIO_EN,
> +                       BIT(30) |
> +                       BIT(31),
> +                       0
> +               },
> +               .regmap_size = 2,
>         }, {
>                 .name = "hsuart",
>                 .regmap[0] = {
> @@ -754,7 +856,14 @@ static const struct airoha_pinctrl_func_group uart_func_group[] = {
>                         GPIO_HSUART_MODE_MASK | GPIO_HSUART_CTS_RTS_MODE_MASK,
>                         GPIO_HSUART_MODE_MASK
>                 },
> -               .regmap_size = 1,
> +               .regmap[1] = {
> +                       AIROHA_FUNC_MUX,
> +                       REG_FORCE_GPIO_EN,
> +                       BIT(28) |
> +                       BIT(29),
> +                       0
> +               },
> +               .regmap_size = 2,
>         },
>         {
>                 .name = "hsuart_cts_rts",
> @@ -764,7 +873,14 @@ static const struct airoha_pinctrl_func_group uart_func_group[] = {
>                         GPIO_HSUART_MODE_MASK | GPIO_HSUART_CTS_RTS_MODE_MASK,
>                         GPIO_HSUART_MODE_MASK | GPIO_HSUART_CTS_RTS_MODE_MASK
>                 },
> -               .regmap_size = 1,
> +               .regmap[1] = {
> +                       AIROHA_FUNC_MUX,
> +                       REG_FORCE_GPIO_EN,
> +                       BIT(26) |
> +                       BIT(27),
> +                       0
> +               },
> +               .regmap_size = 2,
>         }, {
>                 .name = "uart4",
>                 .regmap[0] = {
> @@ -773,7 +889,14 @@ static const struct airoha_pinctrl_func_group uart_func_group[] = {
>                         GPIO_UART4_MODE_MASK,
>                         GPIO_UART4_MODE_MASK
>                 },
> -               .regmap_size = 1,
> +               .regmap[1] = {
> +                       AIROHA_FUNC_MUX,
> +                       REG_FORCE_GPIO_EN,
> +                       BIT(5) |
> +                       BIT(6),
> +                       0
> +               },
> +               .regmap_size = 2,
>         }, {
>                 .name = "uart5",
>                 .regmap[0] = {
> @@ -782,7 +905,14 @@ static const struct airoha_pinctrl_func_group uart_func_group[] = {
>                         GPIO_UART5_MODE_MASK,
>                         GPIO_UART5_MODE_MASK
>                 },
> -               .regmap_size = 1,
> +               .regmap[1] = {
> +                       AIROHA_FUNC_MUX,
> +                       REG_FORCE_GPIO_EN,
> +                       BIT(21) |
> +                       BIT(22),
> +                       0
> +               },
> +               .regmap_size = 2,
>         }, {
>                 .name = "npu_uart",
>                 .regmap[0] = {
> @@ -791,7 +921,14 @@ static const struct airoha_pinctrl_func_group uart_func_group[] = {
>                         NPU_UART_EN_MASK,
>                         NPU_UART_EN_MASK
>                 },
> -               .regmap_size = 1,
> +               .regmap[1] = {
> +                       AIROHA_FUNC_MUX,
> +                       REG_FORCE_GPIO_EN,
> +                       BIT(5) |
> +                       BIT(6),
> +                       0
> +               },
> +               .regmap_size = 2,
>         },
>  };
>
> @@ -826,7 +963,17 @@ static const struct airoha_pinctrl_func_group jtag_func_group[] = {
>                         JTAG_UDI_EN_MASK,
>                         JTAG_UDI_EN_MASK
>                 },
> -               .regmap_size = 1,
> +               .regmap[1] = {
> +                       AIROHA_FUNC_MUX,
> +                       REG_FORCE_GPIO_EN,
> +                       BIT(20) |
> +                       BIT(21) |
> +                       BIT(22) |
> +                       BIT(23) |
> +                       BIT(24),
> +                       0
> +               },
> +               .regmap_size = 2,
>         }, {
>                 .name = "jtag_dfd",
>                 .regmap[0] = {
> @@ -835,7 +982,17 @@ static const struct airoha_pinctrl_func_group jtag_func_group[] = {
>                         JTAG_DFD_EN_MASK,
>                         JTAG_DFD_EN_MASK
>                 },
> -               .regmap_size = 1,
> +               .regmap[1] = {
> +                       AIROHA_FUNC_MUX,
> +                       REG_FORCE_GPIO_EN,
> +                       BIT(20) |
> +                       BIT(21) |
> +                       BIT(22) |
> +                       BIT(23) |
> +                       BIT(24),
> +                       0
> +               },
> +               .regmap_size = 2,
>         },
>  };
>
> @@ -848,7 +1005,17 @@ static const struct airoha_pinctrl_func_group pcm_func_group[] = {
>                         GPIO_PCM1_MODE_MASK,
>                         GPIO_PCM1_MODE_MASK
>                 },
> -               .regmap_size = 1,
> +               .regmap[1] = {
> +                       AIROHA_FUNC_MUX,
> +                       REG_FORCE_GPIO_EN,
> +                       BIT(8) |
> +                       BIT(9) |
> +                       BIT(10) |
> +                       BIT(11) |
> +                       BIT(12),
> +                       0
> +               },
> +               .regmap_size = 2,
>         }, {
>                 .name = "pcm2",
>                 .regmap[0] = {
> @@ -857,7 +1024,17 @@ static const struct airoha_pinctrl_func_group pcm_func_group[] = {
>                         GPIO_PCM2_MODE_MASK,
>                         GPIO_PCM2_MODE_MASK
>                 },
> -               .regmap_size = 1,
> +               .regmap[1] = {
> +                       AIROHA_FUNC_MUX,
> +                       REG_FORCE_GPIO_EN,
> +                       BIT(22) |
> +                       BIT(26) |
> +                       BIT(27) |
> +                       BIT(28) |
> +                       BIT(29),
> +                       0
> +               },
> +               .regmap_size = 2,
>         },
>  };
>
> @@ -879,7 +1056,14 @@ static const struct airoha_pinctrl_func_group spi_func_group[] = {
>                         GPIO_SPI_QUAD_MODE_MASK,
>                         GPIO_SPI_QUAD_MODE_MASK
>                 },
> -               .regmap_size = 1,
> +               .regmap[1] = {
> +                       AIROHA_FUNC_MUX,
> +                       REG_FORCE_GPIO_EN,
> +                       BIT(23) |
> +                       BIT(24),
> +                       0
> +               },
> +               .regmap_size = 2,
>         }, {
>                 .name = "spi_cs1",
>                 .regmap[0] = {
> @@ -888,7 +1072,13 @@ static const struct airoha_pinctrl_func_group spi_func_group[] = {
>                         GPIO_SPI_CS1_MODE_MASK,
>                         GPIO_SPI_CS1_MODE_MASK
>                 },
> -               .regmap_size = 1,
> +               .regmap[1] = {
> +                       AIROHA_FUNC_MUX,
> +                       REG_FORCE_GPIO_EN,
> +                       BIT(25),
> +                       0
> +               },
> +               .regmap_size = 2,
>         }, {
>                 .name = "spi_cs2",
>                 .regmap[0] = {
> @@ -928,7 +1118,20 @@ static const struct airoha_pinctrl_func_group pcm_spi_func_group[] = {
>                         GPIO_PCM_SPI_MODE_MASK,
>                         GPIO_PCM_SPI_MODE_MASK
>                 },
> -               .regmap_size = 1,
> +               .regmap[1] = {
> +                       AIROHA_FUNC_MUX,
> +                       REG_FORCE_GPIO_EN,
> +                       BIT(8) |
> +                       BIT(9) |
> +                       BIT(10) |
> +                       BIT(11) |
> +                       BIT(26) |
> +                       BIT(27) |
> +                       BIT(28) |
> +                       BIT(29),
> +                       0
> +               },
> +               .regmap_size = 2,
>         }, {
>                 .name = "pcm_spi_int",
>                 .regmap[0] = {
> @@ -946,7 +1149,13 @@ static const struct airoha_pinctrl_func_group pcm_spi_func_group[] = {
>                         GPIO_PCM_RESET_MODE_MASK,
>                         GPIO_PCM_RESET_MODE_MASK
>                 },
> -               .regmap_size = 1,
> +               .regmap[1] = {
> +                       AIROHA_FUNC_MUX,
> +                       REG_FORCE_GPIO_EN,
> +                       BIT(12),
> +                       0
> +               },
> +               .regmap_size = 2,
>         }, {
>                 .name = "pcm_spi_cs1",
>                 .regmap[0] = {
> @@ -955,7 +1164,13 @@ static const struct airoha_pinctrl_func_group pcm_spi_func_group[] = {
>                         GPIO_PCM_SPI_CS1_MODE_MASK,
>                         GPIO_PCM_SPI_CS1_MODE_MASK
>                 },
> -               .regmap_size = 1,
> +               .regmap[1] = {
> +                       AIROHA_FUNC_MUX,
> +                       REG_FORCE_GPIO_EN,
> +                       BIT(22),
> +                       0
> +               },
> +               .regmap_size = 2,
>         }, {
>                 .name = "pcm_spi_cs2",
>                 .regmap[0] = {
> @@ -995,7 +1210,20 @@ static const struct airoha_pinctrl_func_group emmc_func_group[] = {
>                         GPIO_EMMC_MODE_MASK | EMMC_GPIO_MODE_MASK,
>                         GPIO_EMMC_MODE_MASK
>                 },
> -               .regmap_size = 1,
> +               .regmap[1] = {
> +                       AIROHA_FUNC_MUX,
> +                       REG_FORCE_GPIO_EN,
> +                       BIT(5) |
> +                       BIT(6) |
> +                       BIT(7) |
> +                       BIT(20) |
> +                       BIT(21) |
> +                       BIT(22) |
> +                       BIT(23) |
> +                       BIT(24),
> +                       0
> +               },
> +               .regmap_size = 2,
>         },
>  };
>
> @@ -1005,41 +1233,155 @@ static const struct airoha_pinctrl_func_group pnand_func_group[] = {
>                 .regmap[0] = {
>                         AIROHA_FUNC_MUX,
>                         REG_GPIO_PON_MODE,
> -                       GPIO_PARALLEL_NAND_MODE_MASK,
> +                       GPIO_PARALLEL_NAND_MODE_MASK | SPI_GPIO_MODE_MASK,
>                         GPIO_PARALLEL_NAND_MODE_MASK
>                 },
> -               .regmap_size = 1,
> +               .regmap[1] = {
> +                       AIROHA_FUNC_MUX,
> +                       REG_FORCE_GPIO_EN,
> +                       BIT(5) |
> +                       BIT(6) |
> +                       BIT(7) |
> +                       BIT(20) |
> +                       BIT(21) |
> +                       BIT(22) |
> +                       BIT(23) |
> +                       BIT(24) |
> +                       BIT(25) |
> +                       BIT(26) |
> +                       BIT(27) |
> +                       BIT(28) |
> +                       BIT(29),
> +                       0
> +               },
> +               .regmap_size = 2,
>         },
>  };
>
> +/* Force overrides select individual pads without disabling shared buses. */
> +#define AN7583_GPIO_GROUP(n, pwm_mask, force_reg, force_mask)  \
> +       {                                                               \
> +               .name = "gpio" #n,                                      \
> +               .regmap[0] = {                                          \
> +                       AIROHA_FUNC_PWM_MUX,                            \
> +                       (n) < 16 ? REG_GPIO_FLASH_MODE_CFG :            \
> +                       REG_GPIO_FLASH_MODE_CFG_EXT,                    \
> +                       (pwm_mask), 0                                   \
> +               },                                                      \
> +               .regmap[1] = {                                          \
> +                       AIROHA_FUNC_MUX, (force_reg),                   \
> +                       (force_mask), (force_mask)                      \
> +               },                                                      \
> +               .regmap_size = 2,                                       \
> +       }
> +
>  static const struct airoha_pinctrl_func_group gpio_func_group[] = {
> -       AIROHA_PINCTRL_GPIO_EXT("gpio39", GPIO39_FLASH_MODE_CFG,
> -                               I2C0_SCL_GPIO_MODE_MASK),
> -       AIROHA_PINCTRL_GPIO_EXT("gpio40", GPIO40_FLASH_MODE_CFG,
> -                               I2C0_SDA_GPIO_MODE_MASK),
> -       AIROHA_PINCTRL_GPIO_EXT("gpio41", GPIO41_FLASH_MODE_CFG,
> -                               I2C1_SCL_GPIO_MODE_MASK),
> -       AIROHA_PINCTRL_GPIO_EXT("gpio42", GPIO42_FLASH_MODE_CFG,
> -                               I2C1_SDA_GPIO_MODE_MASK),
> -       AIROHA_PINCTRL_GPIO_EXT("gpio43", GPIO43_FLASH_MODE_CFG,
> -                               SPI_CLK_GPIO_MODE_MASK),
> -       AIROHA_PINCTRL_GPIO_EXT("gpio44", GPIO44_FLASH_MODE_CFG,
> -                               SPI_CS_GPIO_MODE_MASK),
> -       AIROHA_PINCTRL_GPIO_EXT("gpio45", GPIO45_FLASH_MODE_CFG,
> -                               SPI_MOSI_GPIO_MODE_MASK),
> -       AIROHA_PINCTRL_GPIO_EXT("gpio46", GPIO46_FLASH_MODE_CFG,
> -                               SPI_MISO_GPIO_MODE_MASK),
> -       AIROHA_PINCTRL_GPIO_EXT("gpio47", GPIO47_FLASH_MODE_CFG,
> -                               UART_TXD_GPIO_MODE_MASK),
> -       AIROHA_PINCTRL_GPIO_EXT("gpio48", GPIO48_FLASH_MODE_CFG,
> -                               UART_RXD_GPIO_MODE_MASK),
> -       AIROHA_PINCTRL_GPIO_EXT("gpio49", GPIO49_FLASH_MODE_CFG,
> -                               GPIO_PCIE_RESET0_MASK),
> -       AIROHA_PINCTRL_GPIO_EXT("gpio50", GPIO50_FLASH_MODE_CFG,
> -                               GPIO_PCIE_RESET1_MASK),
> -       AIROHA_PINCTRL_GPIO_EXT("gpio51", GPIO51_FLASH_MODE_CFG,
> -                               MDC_0_GPIO_MODE_MASK),
> -       AIROHA_PINCTRL_GPIO("gpio52", MDIO_0_GPIO_MODE_MASK),
> +       AN7583_GPIO_GROUP(0, GPIO0_FLASH_MODE_CFG,
> +                           REG_FORCE_GPIO_EN, 0),
> +       AN7583_GPIO_GROUP(1, GPIO1_FLASH_MODE_CFG,
> +                           REG_FORCE_GPIO_EN, BIT(1)),
> +       AN7583_GPIO_GROUP(2, GPIO2_FLASH_MODE_CFG,
> +                           REG_FORCE_GPIO_EN, BIT(2)),
> +       AN7583_GPIO_GROUP(3, GPIO3_FLASH_MODE_CFG,
> +                           REG_FORCE_GPIO_EN, BIT(3)),
> +       AN7583_GPIO_GROUP(4, GPIO4_FLASH_MODE_CFG,
> +                           REG_FORCE_GPIO_EN, BIT(4)),
> +       AN7583_GPIO_GROUP(5, GPIO5_FLASH_MODE_CFG,
> +                           REG_FORCE_GPIO_EN, BIT(5)),
> +       AN7583_GPIO_GROUP(6, GPIO6_FLASH_MODE_CFG,
> +                           REG_FORCE_GPIO_EN, BIT(6)),
> +       AN7583_GPIO_GROUP(7, GPIO7_FLASH_MODE_CFG,
> +                           REG_FORCE_GPIO_EN, BIT(7)),
> +       AN7583_GPIO_GROUP(8, GPIO8_FLASH_MODE_CFG,
> +                           REG_FORCE_GPIO_EN, BIT(8)),
> +       AN7583_GPIO_GROUP(9, GPIO9_FLASH_MODE_CFG,
> +                           REG_FORCE_GPIO_EN, BIT(9)),
> +       AN7583_GPIO_GROUP(10, GPIO10_FLASH_MODE_CFG,
> +                           REG_FORCE_GPIO_EN, BIT(10)),
> +       AN7583_GPIO_GROUP(11, GPIO11_FLASH_MODE_CFG,
> +                           REG_FORCE_GPIO_EN, BIT(11)),
> +       AN7583_GPIO_GROUP(12, GPIO12_FLASH_MODE_CFG,
> +                           REG_FORCE_GPIO_EN, BIT(12)),
> +       AN7583_GPIO_GROUP(13, GPIO13_FLASH_MODE_CFG,
> +                           REG_FORCE_GPIO_EN, BIT(13)),
> +       AN7583_GPIO_GROUP(14, GPIO14_FLASH_MODE_CFG,
> +                           REG_FORCE_GPIO_EN, BIT(14)),
> +       AN7583_GPIO_GROUP(15, GPIO15_FLASH_MODE_CFG,
> +                           REG_FORCE_GPIO_EN, BIT(15)),
> +       AN7583_GPIO_GROUP(16, GPIO16_FLASH_MODE_CFG,
> +                           REG_FORCE_GPIO_EN, BIT(16)),
> +       AN7583_GPIO_GROUP(17, GPIO17_FLASH_MODE_CFG,
> +                           REG_FORCE_GPIO_EN, BIT(17)),
> +       AN7583_GPIO_GROUP(18, GPIO18_FLASH_MODE_CFG,
> +                           REG_FORCE_GPIO_EN, BIT(18)),
> +       AN7583_GPIO_GROUP(19, GPIO19_FLASH_MODE_CFG,
> +                           REG_FORCE_GPIO_EN, BIT(19)),
> +       AN7583_GPIO_GROUP(20, GPIO20_FLASH_MODE_CFG,
> +                           REG_FORCE_GPIO_EN, BIT(20)),
> +       AN7583_GPIO_GROUP(21, GPIO21_FLASH_MODE_CFG,
> +                           REG_FORCE_GPIO_EN, BIT(21)),
> +       AN7583_GPIO_GROUP(22, GPIO22_FLASH_MODE_CFG,
> +                           REG_FORCE_GPIO_EN, BIT(22)),
> +       AN7583_GPIO_GROUP(23, GPIO23_FLASH_MODE_CFG,
> +                           REG_FORCE_GPIO_EN, BIT(23)),
> +       AN7583_GPIO_GROUP(24, GPIO24_FLASH_MODE_CFG,
> +                           REG_FORCE_GPIO_EN, BIT(24)),
> +       AN7583_GPIO_GROUP(25, GPIO25_FLASH_MODE_CFG,
> +                           REG_FORCE_GPIO_EN, BIT(25)),
> +       AN7583_GPIO_GROUP(26, GPIO26_FLASH_MODE_CFG,
> +                           REG_FORCE_GPIO_EN, BIT(26)),
> +       AN7583_GPIO_GROUP(27, GPIO27_FLASH_MODE_CFG,
> +                           REG_FORCE_GPIO_EN, BIT(27)),
> +       AN7583_GPIO_GROUP(28, GPIO28_FLASH_MODE_CFG,
> +                           REG_FORCE_GPIO_EN, BIT(28)),
> +       AN7583_GPIO_GROUP(29, GPIO29_FLASH_MODE_CFG,
> +                           REG_FORCE_GPIO_EN, BIT(29)),
> +       AN7583_GPIO_GROUP(30, GPIO30_FLASH_MODE_CFG,
> +                           REG_FORCE_GPIO_EN, BIT(30)),
> +       AN7583_GPIO_GROUP(31, GPIO31_FLASH_MODE_CFG,
> +                           REG_FORCE_GPIO_EN, BIT(31)),
> +       AN7583_GPIO_GROUP(32, 0,
> +                           REG_FORCE_GPIO32_EN, BIT(0)),
> +       AN7583_GPIO_GROUP(33, 0,
> +                           REG_FORCE_GPIO32_EN, BIT(1)),
> +       AN7583_GPIO_GROUP(34, 0,
> +                           REG_FORCE_GPIO32_EN, BIT(2)),
> +       AN7583_GPIO_GROUP(35, 0,
> +                           REG_FORCE_GPIO32_EN, BIT(3)),
> +       AN7583_GPIO_GROUP(36, GPIO36_FLASH_MODE_CFG,
> +                           REG_FORCE_GPIO32_EN, BIT(4)),
> +       AN7583_GPIO_GROUP(37, GPIO37_FLASH_MODE_CFG,
> +                           REG_FORCE_GPIO32_EN, BIT(5)),
> +       AN7583_GPIO_GROUP(38, GPIO38_FLASH_MODE_CFG,
> +                           REG_FORCE_GPIO32_EN, BIT(6)),
> +       AN7583_GPIO_GROUP(39, GPIO39_FLASH_MODE_CFG,
> +                           REG_GPIO_PON_MODE, I2C0_SCL_GPIO_MODE_MASK),
> +       AN7583_GPIO_GROUP(40, GPIO40_FLASH_MODE_CFG,
> +                           REG_GPIO_PON_MODE, I2C0_SDA_GPIO_MODE_MASK),
> +       AN7583_GPIO_GROUP(41, GPIO41_FLASH_MODE_CFG,
> +                           REG_GPIO_PON_MODE, I2C1_SCL_GPIO_MODE_MASK),
> +       AN7583_GPIO_GROUP(42, GPIO42_FLASH_MODE_CFG,
> +                           REG_GPIO_PON_MODE, I2C1_SDA_GPIO_MODE_MASK),
> +       AN7583_GPIO_GROUP(43, GPIO43_FLASH_MODE_CFG,
> +                           REG_GPIO_PON_MODE, SPI_CLK_GPIO_MODE_MASK),
> +       AN7583_GPIO_GROUP(44, GPIO44_FLASH_MODE_CFG,
> +                           REG_GPIO_PON_MODE, SPI_CS_GPIO_MODE_MASK),
> +       AN7583_GPIO_GROUP(45, GPIO45_FLASH_MODE_CFG,
> +                           REG_GPIO_PON_MODE, SPI_MOSI_GPIO_MODE_MASK),
> +       AN7583_GPIO_GROUP(46, GPIO46_FLASH_MODE_CFG,
> +                           REG_GPIO_PON_MODE, SPI_MISO_GPIO_MODE_MASK),
> +       AN7583_GPIO_GROUP(47, GPIO47_FLASH_MODE_CFG,
> +                           REG_GPIO_PON_MODE, UART_TXD_GPIO_MODE_MASK),
> +       AN7583_GPIO_GROUP(48, GPIO48_FLASH_MODE_CFG,
> +                           REG_GPIO_PON_MODE, UART_RXD_GPIO_MODE_MASK),
> +       AN7583_GPIO_GROUP(49, GPIO49_FLASH_MODE_CFG,
> +                           REG_GPIO_PON_MODE, GPIO_PCIE_RESET0_MASK),
> +       AN7583_GPIO_GROUP(50, GPIO50_FLASH_MODE_CFG,
> +                           REG_GPIO_PON_MODE, GPIO_PCIE_RESET1_MASK),
> +       AN7583_GPIO_GROUP(51, GPIO51_FLASH_MODE_CFG,
> +                           REG_GPIO_PON_MODE, MDC_0_GPIO_MODE_MASK),
> +       AN7583_GPIO_GROUP(52, 0,
> +                           REG_GPIO_PON_MODE, MDIO_0_GPIO_MODE_MASK),
>  };
>
>  static const struct airoha_pinctrl_func_group pcie_reset_func_group[] = {
> @@ -1065,155 +1407,235 @@ static const struct airoha_pinctrl_func_group pcie_reset_func_group[] = {
>  };
>
>  static const struct airoha_pinctrl_func_group pwm_func_group[] = {
> -       AIROHA_PINCTRL_PWM("gpio0", GPIO0_FLASH_MODE_CFG),
> -       AIROHA_PINCTRL_PWM("gpio1", GPIO1_FLASH_MODE_CFG),
> -       AIROHA_PINCTRL_PWM("gpio2", GPIO2_FLASH_MODE_CFG),
> -       AIROHA_PINCTRL_PWM("gpio3", GPIO3_FLASH_MODE_CFG),
> -       AIROHA_PINCTRL_PWM("gpio4", GPIO4_FLASH_MODE_CFG),
> -       AIROHA_PINCTRL_PWM("gpio5", GPIO5_FLASH_MODE_CFG),
> -       AIROHA_PINCTRL_PWM("gpio6", GPIO6_FLASH_MODE_CFG),
> -       AIROHA_PINCTRL_PWM("gpio7", GPIO7_FLASH_MODE_CFG),
> -       AIROHA_PINCTRL_PWM("gpio8", GPIO8_FLASH_MODE_CFG),
> -       AIROHA_PINCTRL_PWM("gpio9", GPIO9_FLASH_MODE_CFG),
> -       AIROHA_PINCTRL_PWM("gpio10", GPIO10_FLASH_MODE_CFG),
> -       AIROHA_PINCTRL_PWM("gpio11", GPIO11_FLASH_MODE_CFG),
> -       AIROHA_PINCTRL_PWM("gpio12", GPIO12_FLASH_MODE_CFG),
> -       AIROHA_PINCTRL_PWM("gpio13", GPIO13_FLASH_MODE_CFG),
> -       AIROHA_PINCTRL_PWM("gpio14", GPIO14_FLASH_MODE_CFG),
> -       AIROHA_PINCTRL_PWM("gpio15", GPIO15_FLASH_MODE_CFG),
> -       AIROHA_PINCTRL_PWM_EXT("gpio16", GPIO16_FLASH_MODE_CFG),
> -       AIROHA_PINCTRL_PWM_EXT("gpio17", GPIO17_FLASH_MODE_CFG),
> -       AIROHA_PINCTRL_PWM_EXT("gpio18", GPIO18_FLASH_MODE_CFG),
> -       AIROHA_PINCTRL_PWM_EXT("gpio19", GPIO19_FLASH_MODE_CFG),
> -       AIROHA_PINCTRL_PWM_EXT("gpio20", GPIO20_FLASH_MODE_CFG),
> -       AIROHA_PINCTRL_PWM_EXT("gpio21", GPIO21_FLASH_MODE_CFG),
> -       AIROHA_PINCTRL_PWM_EXT("gpio22", GPIO22_FLASH_MODE_CFG),
> -       AIROHA_PINCTRL_PWM_EXT("gpio23", GPIO23_FLASH_MODE_CFG),
> -       AIROHA_PINCTRL_PWM_EXT("gpio24", GPIO24_FLASH_MODE_CFG),
> -       AIROHA_PINCTRL_PWM_EXT("gpio25", GPIO25_FLASH_MODE_CFG),
> -       AIROHA_PINCTRL_PWM_EXT("gpio26", GPIO26_FLASH_MODE_CFG),
> -       AIROHA_PINCTRL_PWM_EXT("gpio27", GPIO27_FLASH_MODE_CFG),
> -       AIROHA_PINCTRL_PWM_EXT("gpio28", GPIO28_FLASH_MODE_CFG),
> -       AIROHA_PINCTRL_PWM_EXT("gpio29", GPIO29_FLASH_MODE_CFG),
> -       AIROHA_PINCTRL_PWM_EXT("gpio30", GPIO30_FLASH_MODE_CFG),
> -       AIROHA_PINCTRL_PWM_EXT("gpio31", GPIO31_FLASH_MODE_CFG),
> -       AIROHA_PINCTRL_PWM_EXT("gpio36", GPIO36_FLASH_MODE_CFG),
> -       AIROHA_PINCTRL_PWM_EXT("gpio37", GPIO37_FLASH_MODE_CFG),
> -       AIROHA_PINCTRL_PWM_EXT("gpio38", GPIO38_FLASH_MODE_CFG),
> +       AIROHA_PINCTRL_PWM("gpio0", GPIO0_FLASH_MODE_CFG,
> +                               REG_FORCE_GPIO_EN, 0),
> +       AIROHA_PINCTRL_PWM("gpio1", GPIO1_FLASH_MODE_CFG,
> +                               REG_FORCE_GPIO_EN, BIT(1)),
> +       AIROHA_PINCTRL_PWM("gpio2", GPIO2_FLASH_MODE_CFG,
> +                               REG_FORCE_GPIO_EN, BIT(2)),
> +       AIROHA_PINCTRL_PWM("gpio3", GPIO3_FLASH_MODE_CFG,
> +                               REG_FORCE_GPIO_EN, BIT(3)),
> +       AIROHA_PINCTRL_PWM("gpio4", GPIO4_FLASH_MODE_CFG,
> +                               REG_FORCE_GPIO_EN, BIT(4)),
> +       AIROHA_PINCTRL_PWM("gpio5", GPIO5_FLASH_MODE_CFG,
> +                               REG_FORCE_GPIO_EN, BIT(5)),
> +       AIROHA_PINCTRL_PWM("gpio6", GPIO6_FLASH_MODE_CFG,
> +                               REG_FORCE_GPIO_EN, BIT(6)),
> +       AIROHA_PINCTRL_PWM("gpio7", GPIO7_FLASH_MODE_CFG,
> +                               REG_FORCE_GPIO_EN, BIT(7)),
> +       AIROHA_PINCTRL_PWM("gpio8", GPIO8_FLASH_MODE_CFG,
> +                               REG_FORCE_GPIO_EN, BIT(8)),
> +       AIROHA_PINCTRL_PWM("gpio9", GPIO9_FLASH_MODE_CFG,
> +                               REG_FORCE_GPIO_EN, BIT(9)),
> +       AIROHA_PINCTRL_PWM("gpio10", GPIO10_FLASH_MODE_CFG,
> +                               REG_FORCE_GPIO_EN, BIT(10)),
> +       AIROHA_PINCTRL_PWM("gpio11", GPIO11_FLASH_MODE_CFG,
> +                               REG_FORCE_GPIO_EN, BIT(11)),
> +       AIROHA_PINCTRL_PWM("gpio12", GPIO12_FLASH_MODE_CFG,
> +                               REG_FORCE_GPIO_EN, BIT(12)),
> +       AIROHA_PINCTRL_PWM("gpio13", GPIO13_FLASH_MODE_CFG,
> +                               REG_FORCE_GPIO_EN, BIT(13)),
> +       AIROHA_PINCTRL_PWM("gpio14", GPIO14_FLASH_MODE_CFG,
> +                               REG_FORCE_GPIO_EN, BIT(14)),
> +       AIROHA_PINCTRL_PWM("gpio15", GPIO15_FLASH_MODE_CFG,
> +                               REG_FORCE_GPIO_EN, BIT(15)),
> +       AIROHA_PINCTRL_PWM_EXT("gpio16", GPIO16_FLASH_MODE_CFG,
> +                               REG_FORCE_GPIO_EN, BIT(16)),
> +       AIROHA_PINCTRL_PWM_EXT("gpio17", GPIO17_FLASH_MODE_CFG,
> +                               REG_FORCE_GPIO_EN, BIT(17)),
> +       AIROHA_PINCTRL_PWM_EXT("gpio18", GPIO18_FLASH_MODE_CFG,
> +                               REG_FORCE_GPIO_EN, BIT(18)),
> +       AIROHA_PINCTRL_PWM_EXT("gpio19", GPIO19_FLASH_MODE_CFG,
> +                               REG_FORCE_GPIO_EN, BIT(19)),
> +       AIROHA_PINCTRL_PWM_EXT("gpio20", GPIO20_FLASH_MODE_CFG,
> +                               REG_FORCE_GPIO_EN, BIT(20)),
> +       AIROHA_PINCTRL_PWM_EXT("gpio21", GPIO21_FLASH_MODE_CFG,
> +                               REG_FORCE_GPIO_EN, BIT(21)),
> +       AIROHA_PINCTRL_PWM_EXT("gpio22", GPIO22_FLASH_MODE_CFG,
> +                               REG_FORCE_GPIO_EN, BIT(22)),
> +       AIROHA_PINCTRL_PWM_EXT("gpio23", GPIO23_FLASH_MODE_CFG,
> +                               REG_FORCE_GPIO_EN, BIT(23)),
> +       AIROHA_PINCTRL_PWM_EXT("gpio24", GPIO24_FLASH_MODE_CFG,
> +                               REG_FORCE_GPIO_EN, BIT(24)),
> +       AIROHA_PINCTRL_PWM_EXT("gpio25", GPIO25_FLASH_MODE_CFG,
> +                               REG_FORCE_GPIO_EN, BIT(25)),
> +       AIROHA_PINCTRL_PWM_EXT("gpio26", GPIO26_FLASH_MODE_CFG,
> +                               REG_FORCE_GPIO_EN, BIT(26)),
> +       AIROHA_PINCTRL_PWM_EXT("gpio27", GPIO27_FLASH_MODE_CFG,
> +                               REG_FORCE_GPIO_EN, BIT(27)),
> +       AIROHA_PINCTRL_PWM_EXT("gpio28", GPIO28_FLASH_MODE_CFG,
> +                               REG_FORCE_GPIO_EN, BIT(28)),
> +       AIROHA_PINCTRL_PWM_EXT("gpio29", GPIO29_FLASH_MODE_CFG,
> +                               REG_FORCE_GPIO_EN, BIT(29)),
> +       AIROHA_PINCTRL_PWM_EXT("gpio30", GPIO30_FLASH_MODE_CFG,
> +                               REG_FORCE_GPIO_EN, BIT(30)),
> +       AIROHA_PINCTRL_PWM_EXT("gpio31", GPIO31_FLASH_MODE_CFG,
> +                               REG_FORCE_GPIO_EN, BIT(31)),
> +       AIROHA_PINCTRL_PWM_EXT("gpio36", GPIO36_FLASH_MODE_CFG,
> +                               REG_FORCE_GPIO32_EN, BIT(4)),
> +       AIROHA_PINCTRL_PWM_EXT("gpio37", GPIO37_FLASH_MODE_CFG,
> +                               REG_FORCE_GPIO32_EN, BIT(5)),
> +       AIROHA_PINCTRL_PWM_EXT("gpio38", GPIO38_FLASH_MODE_CFG,
> +                               REG_FORCE_GPIO32_EN, BIT(6)),
>         AIROHA_PINCTRL_PWM_EXT_SEC("gpio39", GPIO39_FLASH_MODE_CFG,
> -                                  I2C0_SCL_GPIO_MODE_MASK),
> +                                  I2C0_SCL_GPIO_MODE_MASK,
> +                               REG_FORCE_GPIO_EN, 0),
>         AIROHA_PINCTRL_PWM_EXT_SEC("gpio40", GPIO40_FLASH_MODE_CFG,
> -                                  I2C0_SDA_GPIO_MODE_MASK),
> +                                  I2C0_SDA_GPIO_MODE_MASK,
> +                               REG_FORCE_GPIO_EN, 0),
>         AIROHA_PINCTRL_PWM_EXT_SEC("gpio41", GPIO41_FLASH_MODE_CFG,
> -                                  I2C1_SCL_GPIO_MODE_MASK),
> +                                  I2C1_SCL_GPIO_MODE_MASK,
> +                               REG_FORCE_GPIO_EN, 0),
>         AIROHA_PINCTRL_PWM_EXT_SEC("gpio42", GPIO42_FLASH_MODE_CFG,
> -                                  I2C1_SDA_GPIO_MODE_MASK),
> +                                  I2C1_SDA_GPIO_MODE_MASK,
> +                               REG_FORCE_GPIO_EN, 0),
>         AIROHA_PINCTRL_PWM_EXT_SEC("gpio43", GPIO43_FLASH_MODE_CFG,
> -                                  SPI_CLK_GPIO_MODE_MASK),
> +                                  SPI_CLK_GPIO_MODE_MASK,
> +                               REG_FORCE_GPIO_EN, 0),
>         AIROHA_PINCTRL_PWM_EXT_SEC("gpio44", GPIO44_FLASH_MODE_CFG,
> -                                  SPI_CS_GPIO_MODE_MASK),
> +                                  SPI_CS_GPIO_MODE_MASK,
> +                               REG_FORCE_GPIO_EN, 0),
>         AIROHA_PINCTRL_PWM_EXT_SEC("gpio45", GPIO45_FLASH_MODE_CFG,
> -                                  SPI_MOSI_GPIO_MODE_MASK),
> +                                  SPI_MOSI_GPIO_MODE_MASK,
> +                               REG_FORCE_GPIO_EN, 0),
>         AIROHA_PINCTRL_PWM_EXT_SEC("gpio46", GPIO46_FLASH_MODE_CFG,
> -                                  SPI_MISO_GPIO_MODE_MASK),
> +                                  SPI_MISO_GPIO_MODE_MASK,
> +                               REG_FORCE_GPIO_EN, 0),
>         AIROHA_PINCTRL_PWM_EXT_SEC("gpio47", GPIO47_FLASH_MODE_CFG,
> -                                  UART_TXD_GPIO_MODE_MASK),
> +                                  UART_TXD_GPIO_MODE_MASK,
> +                               REG_FORCE_GPIO_EN, 0),
>         AIROHA_PINCTRL_PWM_EXT_SEC("gpio48", GPIO48_FLASH_MODE_CFG,
> -                                  UART_RXD_GPIO_MODE_MASK),
> +                                  UART_RXD_GPIO_MODE_MASK,
> +                               REG_FORCE_GPIO_EN, 0),
>         AIROHA_PINCTRL_PWM_EXT_SEC("gpio49", GPIO49_FLASH_MODE_CFG,
> -                                  GPIO_PCIE_RESET0_MASK),
> +                                  GPIO_PCIE_RESET0_MASK,
> +                               REG_FORCE_GPIO_EN, 0),
>         AIROHA_PINCTRL_PWM_EXT_SEC("gpio50", GPIO50_FLASH_MODE_CFG,
> -                                  GPIO_PCIE_RESET1_MASK),
> +                                  GPIO_PCIE_RESET1_MASK,
> +                               REG_FORCE_GPIO_EN, 0),
>         AIROHA_PINCTRL_PWM_EXT_SEC("gpio51", GPIO51_FLASH_MODE_CFG,
> -                                  MDC_0_GPIO_MODE_MASK),
> +                                  MDC_0_GPIO_MODE_MASK,
> +                               REG_FORCE_GPIO_EN, 0),
>  };
>
>  static const struct airoha_pinctrl_func_group phy1_led0_func_group[] = {
>         AIROHA_PINCTRL_PHY_LED0("gpio1", GPIO_LAN0_LED0_MODE_MASK,
> -                               LAN0_LED_MAPPING_MASK, LAN0_PHY_LED_MAP(0)),
> +                               LAN0_LED_MAPPING_MASK, LAN0_PHY_LED_MAP(0),
> +                               REG_FORCE_GPIO_EN, BIT(1)),
>         AIROHA_PINCTRL_PHY_LED0("gpio2", GPIO_LAN1_LED0_MODE_MASK,
> -                               LAN1_LED_MAPPING_MASK, LAN1_PHY_LED_MAP(0)),
> +                               LAN1_LED_MAPPING_MASK, LAN1_PHY_LED_MAP(0),
> +                               REG_FORCE_GPIO_EN, BIT(2)),
>         AIROHA_PINCTRL_PHY_LED0("gpio3", GPIO_LAN2_LED0_MODE_MASK,
> -                               LAN2_LED_MAPPING_MASK, LAN2_PHY_LED_MAP(0)),
> +                               LAN2_LED_MAPPING_MASK, LAN2_PHY_LED_MAP(0),
> +                               REG_FORCE_GPIO_EN, BIT(3)),
>         AIROHA_PINCTRL_PHY_LED0("gpio4", GPIO_LAN3_LED0_MODE_MASK,
> -                               LAN3_LED_MAPPING_MASK, LAN3_PHY_LED_MAP(0)),
> +                               LAN3_LED_MAPPING_MASK, LAN3_PHY_LED_MAP(0),
> +                               REG_FORCE_GPIO_EN, BIT(4)),
>  };
>
>  static const struct airoha_pinctrl_func_group phy2_led0_func_group[] = {
>         AIROHA_PINCTRL_PHY_LED0("gpio1", GPIO_LAN0_LED0_MODE_MASK,
> -                               LAN0_LED_MAPPING_MASK, LAN0_PHY_LED_MAP(1)),
> +                               LAN0_LED_MAPPING_MASK, LAN0_PHY_LED_MAP(1),
> +                               REG_FORCE_GPIO_EN, BIT(1)),
>         AIROHA_PINCTRL_PHY_LED0("gpio2", GPIO_LAN1_LED0_MODE_MASK,
> -                               LAN1_LED_MAPPING_MASK, LAN1_PHY_LED_MAP(1)),
> +                               LAN1_LED_MAPPING_MASK, LAN1_PHY_LED_MAP(1),
> +                               REG_FORCE_GPIO_EN, BIT(2)),
>         AIROHA_PINCTRL_PHY_LED0("gpio3", GPIO_LAN2_LED0_MODE_MASK,
> -                               LAN2_LED_MAPPING_MASK, LAN2_PHY_LED_MAP(1)),
> +                               LAN2_LED_MAPPING_MASK, LAN2_PHY_LED_MAP(1),
> +                               REG_FORCE_GPIO_EN, BIT(3)),
>         AIROHA_PINCTRL_PHY_LED0("gpio4", GPIO_LAN3_LED0_MODE_MASK,
> -                               LAN3_LED_MAPPING_MASK, LAN3_PHY_LED_MAP(1)),
> +                               LAN3_LED_MAPPING_MASK, LAN3_PHY_LED_MAP(1),
> +                               REG_FORCE_GPIO_EN, BIT(4)),
>  };
>
>  static const struct airoha_pinctrl_func_group phy3_led0_func_group[] = {
>         AIROHA_PINCTRL_PHY_LED0("gpio1", GPIO_LAN0_LED0_MODE_MASK,
> -                               LAN0_LED_MAPPING_MASK, LAN0_PHY_LED_MAP(2)),
> +                               LAN0_LED_MAPPING_MASK, LAN0_PHY_LED_MAP(2),
> +                               REG_FORCE_GPIO_EN, BIT(1)),
>         AIROHA_PINCTRL_PHY_LED0("gpio2", GPIO_LAN1_LED0_MODE_MASK,
> -                               LAN1_LED_MAPPING_MASK, LAN1_PHY_LED_MAP(2)),
> +                               LAN1_LED_MAPPING_MASK, LAN1_PHY_LED_MAP(2),
> +                               REG_FORCE_GPIO_EN, BIT(2)),
>         AIROHA_PINCTRL_PHY_LED0("gpio3", GPIO_LAN2_LED0_MODE_MASK,
> -                               LAN2_LED_MAPPING_MASK, LAN2_PHY_LED_MAP(2)),
> +                               LAN2_LED_MAPPING_MASK, LAN2_PHY_LED_MAP(2),
> +                               REG_FORCE_GPIO_EN, BIT(3)),
>         AIROHA_PINCTRL_PHY_LED0("gpio4", GPIO_LAN3_LED0_MODE_MASK,
> -                               LAN3_LED_MAPPING_MASK, LAN3_PHY_LED_MAP(2)),
> +                               LAN3_LED_MAPPING_MASK, LAN3_PHY_LED_MAP(2),
> +                               REG_FORCE_GPIO_EN, BIT(4)),
>  };
>
>  static const struct airoha_pinctrl_func_group phy4_led0_func_group[] = {
>         AIROHA_PINCTRL_PHY_LED0("gpio1", GPIO_LAN0_LED0_MODE_MASK,
> -                               LAN0_LED_MAPPING_MASK, LAN0_PHY_LED_MAP(3)),
> +                               LAN0_LED_MAPPING_MASK, LAN0_PHY_LED_MAP(3),
> +                               REG_FORCE_GPIO_EN, BIT(1)),
>         AIROHA_PINCTRL_PHY_LED0("gpio2", GPIO_LAN1_LED0_MODE_MASK,
> -                               LAN1_LED_MAPPING_MASK, LAN1_PHY_LED_MAP(3)),
> +                               LAN1_LED_MAPPING_MASK, LAN1_PHY_LED_MAP(3),
> +                               REG_FORCE_GPIO_EN, BIT(2)),
>         AIROHA_PINCTRL_PHY_LED0("gpio3", GPIO_LAN2_LED0_MODE_MASK,
> -                               LAN2_LED_MAPPING_MASK, LAN2_PHY_LED_MAP(3)),
> +                               LAN2_LED_MAPPING_MASK, LAN2_PHY_LED_MAP(3),
> +                               REG_FORCE_GPIO_EN, BIT(3)),
>         AIROHA_PINCTRL_PHY_LED0("gpio4", GPIO_LAN3_LED0_MODE_MASK,
> -                               LAN3_LED_MAPPING_MASK, LAN3_PHY_LED_MAP(3)),
> +                               LAN3_LED_MAPPING_MASK, LAN3_PHY_LED_MAP(3),
> +                               REG_FORCE_GPIO_EN, BIT(4)),
>  };
>
>  static const struct airoha_pinctrl_func_group phy1_led1_func_group[] = {
>         AIROHA_PINCTRL_PHY_LED1("gpio8", GPIO_LAN0_LED1_MODE_MASK,
> -                               LAN0_LED_MAPPING_MASK, LAN0_PHY_LED_MAP(0)),
> +                               LAN0_LED_MAPPING_MASK, LAN0_PHY_LED_MAP(0),
> +                               REG_FORCE_GPIO_EN, BIT(8)),
>         AIROHA_PINCTRL_PHY_LED1("gpio9", GPIO_LAN1_LED1_MODE_MASK,
> -                               LAN1_LED_MAPPING_MASK, LAN1_PHY_LED_MAP(0)),
> +                               LAN1_LED_MAPPING_MASK, LAN1_PHY_LED_MAP(0),
> +                               REG_FORCE_GPIO_EN, BIT(9)),
>         AIROHA_PINCTRL_PHY_LED1("gpio10", GPIO_LAN2_LED1_MODE_MASK,
> -                               LAN2_LED_MAPPING_MASK, LAN2_PHY_LED_MAP(0)),
> +                               LAN2_LED_MAPPING_MASK, LAN2_PHY_LED_MAP(0),
> +                               REG_FORCE_GPIO_EN, BIT(10)),
>         AIROHA_PINCTRL_PHY_LED1("gpio11", GPIO_LAN3_LED1_MODE_MASK,
> -                               LAN3_LED_MAPPING_MASK, LAN3_PHY_LED_MAP(0)),
> +                               LAN3_LED_MAPPING_MASK, LAN3_PHY_LED_MAP(0),
> +                               REG_FORCE_GPIO_EN, BIT(11)),
>  };
>
>  static const struct airoha_pinctrl_func_group phy2_led1_func_group[] = {
>         AIROHA_PINCTRL_PHY_LED1("gpio8", GPIO_LAN0_LED1_MODE_MASK,
> -                               LAN0_LED_MAPPING_MASK, LAN0_PHY_LED_MAP(1)),
> +                               LAN0_LED_MAPPING_MASK, LAN0_PHY_LED_MAP(1),
> +                               REG_FORCE_GPIO_EN, BIT(8)),
>         AIROHA_PINCTRL_PHY_LED1("gpio9", GPIO_LAN1_LED1_MODE_MASK,
> -                               LAN1_LED_MAPPING_MASK, LAN1_PHY_LED_MAP(1)),
> +                               LAN1_LED_MAPPING_MASK, LAN1_PHY_LED_MAP(1),
> +                               REG_FORCE_GPIO_EN, BIT(9)),
>         AIROHA_PINCTRL_PHY_LED1("gpio10", GPIO_LAN2_LED1_MODE_MASK,
> -                               LAN2_LED_MAPPING_MASK, LAN2_PHY_LED_MAP(1)),
> +                               LAN2_LED_MAPPING_MASK, LAN2_PHY_LED_MAP(1),
> +                               REG_FORCE_GPIO_EN, BIT(10)),
>         AIROHA_PINCTRL_PHY_LED1("gpio11", GPIO_LAN3_LED1_MODE_MASK,
> -                               LAN3_LED_MAPPING_MASK, LAN3_PHY_LED_MAP(1)),
> +                               LAN3_LED_MAPPING_MASK, LAN3_PHY_LED_MAP(1),
> +                               REG_FORCE_GPIO_EN, BIT(11)),
>  };
>
>  static const struct airoha_pinctrl_func_group phy3_led1_func_group[] = {
>         AIROHA_PINCTRL_PHY_LED1("gpio8", GPIO_LAN0_LED1_MODE_MASK,
> -                               LAN0_LED_MAPPING_MASK, LAN0_PHY_LED_MAP(2)),
> +                               LAN0_LED_MAPPING_MASK, LAN0_PHY_LED_MAP(2),
> +                               REG_FORCE_GPIO_EN, BIT(8)),
>         AIROHA_PINCTRL_PHY_LED1("gpio9", GPIO_LAN1_LED1_MODE_MASK,
> -                               LAN1_LED_MAPPING_MASK, LAN1_PHY_LED_MAP(2)),
> +                               LAN1_LED_MAPPING_MASK, LAN1_PHY_LED_MAP(2),
> +                               REG_FORCE_GPIO_EN, BIT(9)),
>         AIROHA_PINCTRL_PHY_LED1("gpio10", GPIO_LAN2_LED1_MODE_MASK,
> -                               LAN2_LED_MAPPING_MASK, LAN2_PHY_LED_MAP(2)),
> +                               LAN2_LED_MAPPING_MASK, LAN2_PHY_LED_MAP(2),
> +                               REG_FORCE_GPIO_EN, BIT(10)),
>         AIROHA_PINCTRL_PHY_LED1("gpio11", GPIO_LAN3_LED1_MODE_MASK,
> -                               LAN3_LED_MAPPING_MASK, LAN3_PHY_LED_MAP(2)),
> +                               LAN3_LED_MAPPING_MASK, LAN3_PHY_LED_MAP(2),
> +                               REG_FORCE_GPIO_EN, BIT(11)),
>  };
>
>  static const struct airoha_pinctrl_func_group phy4_led1_func_group[] = {
>         AIROHA_PINCTRL_PHY_LED1("gpio8", GPIO_LAN0_LED1_MODE_MASK,
> -                               LAN0_LED_MAPPING_MASK, LAN0_PHY_LED_MAP(3)),
> +                               LAN0_LED_MAPPING_MASK, LAN0_PHY_LED_MAP(3),
> +                               REG_FORCE_GPIO_EN, BIT(8)),
>         AIROHA_PINCTRL_PHY_LED1("gpio9", GPIO_LAN1_LED1_MODE_MASK,
> -                               LAN1_LED_MAPPING_MASK, LAN1_PHY_LED_MAP(3)),
> +                               LAN1_LED_MAPPING_MASK, LAN1_PHY_LED_MAP(3),
> +                               REG_FORCE_GPIO_EN, BIT(9)),
>         AIROHA_PINCTRL_PHY_LED1("gpio10", GPIO_LAN2_LED1_MODE_MASK,
> -                               LAN2_LED_MAPPING_MASK, LAN2_PHY_LED_MAP(3)),
> +                               LAN2_LED_MAPPING_MASK, LAN2_PHY_LED_MAP(3),
> +                               REG_FORCE_GPIO_EN, BIT(10)),
>         AIROHA_PINCTRL_PHY_LED1("gpio11", GPIO_LAN3_LED1_MODE_MASK,
> -                               LAN3_LED_MAPPING_MASK, LAN3_PHY_LED_MAP(3)),
> +                               LAN3_LED_MAPPING_MASK, LAN3_PHY_LED_MAP(3),
> +                               REG_FORCE_GPIO_EN, BIT(11)),
>  };
>
>  static const struct airoha_pinctrl_func pinctrl_funcs[] = {
> @@ -1230,7 +1652,7 @@ static const struct airoha_pinctrl_func pinctrl_funcs[] = {
>         PINCTRL_FUNC_DESC("pcm_spi", pcm_spi),
>         PINCTRL_FUNC_DESC("emmc", emmc),
>         PINCTRL_FUNC_DESC("pnand", pnand),
> -       PINCTRL_FUNC_DESC("gpio", gpio),
> +       PINCTRL_GPIO_FUNC_DESC("gpio", gpio),
>         PINCTRL_FUNC_DESC("pcie_reset", pcie_reset),
>         PINCTRL_FUNC_DESC("pwm", pwm),
>         PINCTRL_FUNC_DESC("phy1_led0", phy1_led0),
> @@ -1473,6 +1895,7 @@ static const struct airoha_pinctrl_conf pinctrl_pcie_rst_od_conf[] = {
>  };
>
>  static const struct airoha_pinctrl_match_data pinctrl_match_data = {
> +       .check_mux_conflicts = true,
>         .chip_scu_compatible = "airoha,en7581-chip-scu",
>         .pinctrl_name = KBUILD_MODNAME,
>         .pinctrl_owner = THIS_MODULE,
> --
> 2.43.0
>
