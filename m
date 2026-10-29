Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.84.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793281608;
	b=PBzms2u+JXkP5N3OYhbsBuockLQ8Sj1q5DmG31ggkDN/cMn5xp24BKB83qJ0V2OLsaDe
	 PNCA+aTENmNT9CB2Hgp8Ua1/MWylJkQiTpVoY/GpK/2mawVtNos77eXqqLVsjtg3oF80U
	 W2f4LmteMm4+H8XV0fnv2iq1ML5Ib7Fb1bLYPk/+yxMPM5JPPscezBOaZLfOqtRMW1WEB
	 O6Z5wR3lFQD7kyIEjHhiZtum2lIvsZI5sMFYh9za8NZJpl7as3gm5ohk3S94zoNoid1FI
	 OS/bK2H8VkQbFgQQm/0ujpakaFMnJ6SPxuN3JdYfk033nsBwksD2LrRzh1PvdUHs+3A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793281608;
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
	bh=Iunu7JaNfQCSocG7f7rUDVKaJXfUXIxXC2YDktrwME4=;
	b=f+ywksnhypnsZfDv+4QDivn14AyZqExXg2rxVA8YGj41SNxV3CIFmlxXqMkCSs9UpTdg
	 yELDqsE+jshJe06aRCGpbT7DPL+iWqAhn3HhTZZE9WwSBJ5UiiYSr4ZcP+U1COi6td/sO
	 e7+R/odeiHaUGUkfTzTlZFk2kdGIsbofIKjNceCOUMoaZ+yh7rF3EaOjeMthRekagpXKa
	 ZfkaGv+Qr9dmi01zqxFiT+6vH6YWr7vY9CHKGfT8c+CEvx9IAxZq4Yy5OYYQZZt//91ql
	 GoskqtNEynPouJ1XFVKk1gZjMU1VW3czlP/7YyOacja7ObD9+C6ChwynplfWVyG5GAA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=bsxi4XhK;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.84.44
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010044.outbound.protection.outlook.com [52.101.84.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 151EC60A2608;
	Thu, 29 Oct 2026 13:46:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 151EC60A2608
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=bsxi4XhK
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a4Xv1z50oVUIymiRlVf15il595854AFPpdfO8WF9iLwD9blUIEDKH2fNji2NFhnF/hQYMYsTReezugaHUF586p2aDynPOhPIq/xd4Qg1+QTYpGZotySq52mcbRJcH03VNzrRy/64CMTrApusV0QOpF2kNN0q3liAZut2L0Ge/UTzTmR8PJVDD+uy872Ir+70taI/aoK3vYRp/9u421NYjPd/cukN0G4WMsEVK/Knbqq4t1cXbFUS839Fw2BaF8NDGzsiGusf4MOsoTIPb3HCXc6PyrKkuVTOtYUYQs0Y4CI6jQ85s2IuIEFjj1zwL2TxEvjbiPzVBbXtYsUAWzxsEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Iunu7JaNfQCSocG7f7rUDVKaJXfUXIxXC2YDktrwME4=;
 b=gC7c53UAWrJLaVtG/PIOGeCcQ6ivRH9zIJgjz7KYLyMPfQgLMZDwIlYxGxpgix5VxtJvGXpWd8TabEre4FjGuqELixylm9lEoJJbk+QqOx2UhpRjTdbD1R7WPg4j2OdhfiYe+QoMR2BAz0ebwe4oDQ4Eo0pB7zt7OaqwpKiv+DvFrl16tA0wu2zuXrBFz9h43bY6rl4FW3Sq16YfNjjEgDsvA+W4XOJa0lsd1wUHHqToQxcYmMHh0cP10Iz4lY+/o5339bzgD5EOm4qZzaRTaHg6v2dM9C7m4ltNCyR9YZDPj0HBtCgoZ+1212NCiWm/phgKuCnLY9FhucydsRGCpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Iunu7JaNfQCSocG7f7rUDVKaJXfUXIxXC2YDktrwME4=;
 b=bsxi4XhKNbU0Zr8N3kQZ15y9Y7xdeRymg3JOeBAhK8nMU9QH4CODIzOZR9DzJ9KWg60cTq4vPT6kssawB23MkNb0ZZoW2YdCdRqfLc/Y2bj3cdKMQbYpNc5miRX1du4Ad09elQnjexzUQ7U1fPHb6B2Gb9gFC+Esuix00l8nZlySBIgU8WX7PD9pzYoSB2GJr72Kt3LMZSqt9lEPAgels+vo+MA0qf2JuOqJhJJFJlUCoctm5YHBYUeFSeu+VDeN1/2FegJumLUQAVbixUDu7y3H5ibkBndyYHoHi/WS98fwKI6TIs9WTlkBQVgoy7gesflmA3S8hjMJ0/4FVVA+dg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by DB8PR04MB6892.eurprd04.prod.outlook.com (2603:10a6:10:113::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.8; Thu, 29 Oct
 2026 13:46:45 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0569.007; Thu, 29 Oct 2026
 13:46:45 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Thu, 29 Oct 2026 21:42:35 +0800
Subject: [PATCH 11/11] arm64: dts: imx94: add clocks for gpio controller
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261029-gpio-vf610-fixes-v1-11-45b484b4c434@nxp.com>
References: <20261029-gpio-vf610-fixes-v1-0-45b484b4c434@nxp.com>
In-Reply-To: <20261029-gpio-vf610-fixes-v1-0-45b484b4c434@nxp.com>
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
X-ClientProxiedBy: SI2P153CA0007.APCP153.PROD.OUTLOOK.COM (2603:1096:4:140::8)
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
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|DB8PR04MB6892:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f75a796-077a-4937-0e3e-08df35c31269
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|7416014|376014|19092799006|921020|11063799006|56012099006|261009223027099003|261021121427099003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	I1/Oduq41qftXlT986uJS9AqH9OMR66guNaOoO7O5jAKD5HNO7yDundB9qnRDQAH41dodVhHAhK7vc2/da1naW1YB7qvkMZWqMHTu9SzTVZGVLlMw0IMR1cW+dRseB0005dSwcbiEyvYemmc9Ipngf+1KjNzkP0WdpeD/LYGGTCEqE1EPZbJSJcGf3PpKVMVQvud2oSLFJobeXuiJtD0x69YBDPv2bfvpN5jG4CPdwoeE4gT5eWXKDsQ7MhbbTA2mROy5/TaifVxH2fLfuA8RMZ4PImXe7kq1u6WsuC/iaeXpPpkBypdHwlYS+F9dHi8hgSdtPjEesejNnqjPuf6JXxUI7a0ma2EVzqpOv1pV/K2YjF/WNj2D+ZFUsPtmfdqKqZ/dmsdK9aIg/s/nl/2sWxEhMQ6a398hSv0F26wZULJiY+o3QQv1GU5B2Uj9vUXvgmRfJPMOJYi/1Ow7c0LGGC/9fQsR8xY0wzT6aEMK30CWYrIDUCYZmq96epGhMkRQd5AnpnjOPX03gunW3QMkQEySabzlRkXrMHF33bH8dFckaGHQ5PD6L5/ubmgIu/Il30msqzRvHRw9WDeETj44apFsDSdHFXp3HnWFL4POQzSqApRtouIup//j4lrGpG/KVMDn3ObPXZEQlEIPn9781M9iQtdchHD0A16+WE3275iO4JgoaOzyg6QGTggxnV55cOvuc6/9GIMo6lhRt3ybQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(7416014)(376014)(19092799006)(921020)(11063799006)(56012099006)(261009223027099003)(261021121427099003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eDliN1duKytaQjZVMUg4V0JyZmFnUVJOeFhEbi9ZVnVWbGw0dHlZa29CMXho?=
 =?utf-8?B?UnJTUWdKcG5scEQrWnJBbkRZeU9jK1pSQ0dYUGZRTGJlcW1wT2o2NzhMYTdw?=
 =?utf-8?B?Qk4zeWt0VnJUSm9hZTUyTlY5VExUdEZkVVpwYSszaldjQ3lMS0VtVDM1d1BW?=
 =?utf-8?B?WTJvSTVicVp1K3h0TG1LaDNOTHdDMDVGRGNmbzlxUytFRjRQdU4weGZocVp6?=
 =?utf-8?B?QmRCWmlydWgwZWZvZlhDVUxpTHBFM2tneHZwUnlKVlhNZTNhcEM4L3g1VVpK?=
 =?utf-8?B?eE9RalkwWEdkOWlaUVlVdzZCdGNrRDd1NVpORkhLY1pobmFyS3lVZzlmUFBB?=
 =?utf-8?B?T0JORTBLRXZLaU1idEIyWXhvdGJYUng2K3IvVFZrMkdtaWdLQ3JzekZQSXNm?=
 =?utf-8?B?bjVoaXhJVzJoM1RubzlvS2dwM00vRFVwTlRIeFBYTGlXam94UGVsN0NMMmQz?=
 =?utf-8?B?T25hZ1RNMkdnZm1CeE1CR0FFckFzT28wdkgrMkU2eEtrbzFaSG1veHBxYVpl?=
 =?utf-8?B?a1BDaytkL0tsbTA3L2JQUElDaHZEUnFudy9HT3NVVTZzYjR2TWtzd2tKQzdn?=
 =?utf-8?B?ZnE4K3RnZ3cvNU1raTdIU2l6c3pUT2Z0cit0ZUlmTWN2b2hGT3BNTnhpN0gx?=
 =?utf-8?B?cmh4aU5kUUxoUExTc0VsWXhPcDkwR2FZSXovZDJ3Y204TFZsTzhKYmhUM29a?=
 =?utf-8?B?UC96T3gySUZ0K3p0QnlhQTZYeGV5UVdNTHJlaDJjSXhyRjBud1BScXVYSHV6?=
 =?utf-8?B?dTdseDFUMHByNWluRUswTTFhWTFobVFhYTFEWHVGVzR6TXpYYUJTdTNyUExn?=
 =?utf-8?B?Y3JTOGthRUFZaXVYS1ZXUDViWmxnbllNWWw3NHhVYXJaZDdJcEF3Zm05R2h6?=
 =?utf-8?B?aEd6NVFQL0J2Ky9iS2tFRW5UTzA3YUg4MGVLVVZyVjNLeldvczhKaERtL0Nn?=
 =?utf-8?B?Q3pWWTEwMHhwU0pXWFYxbXFQZkJraEVPU0xyalp4aUdoVnMvOEJXRXZ0clhj?=
 =?utf-8?B?VkpUL3JxVzlkOU5qK1h4UlZkN0MwYWkyU2hpV1RxelQ3aXB0QkV3Y3FqVnBK?=
 =?utf-8?B?L09jS1pBNlpaczd5dGtzNjRGcVdvdE1BbTR5a0x3cG9Yc2xFc0pZbFFDdWlW?=
 =?utf-8?B?dUtlT2JuNjFhNTM2M0JQWld3c1Y1eldlckdyc1Y3c3JjZW95c0UrQlRRMG9I?=
 =?utf-8?B?QnFaUkt5ME81UzFrdE1sdGtpb015MXJxdnVWSm9tTnRlQTRBVmF1Y05zNjNr?=
 =?utf-8?B?WHFOTXZadHNxc2RmRmdlSWQ4RFNKVWZGaWNXSUJucm1KWmhqS2xkZ25xQXZw?=
 =?utf-8?B?RVE3NVZTSzhtNnVMVFhKOTB0dVMxc2pobGlJdXEyeHFKRVlWM1ZmaW1IZnNE?=
 =?utf-8?B?KzFYZ2trbkR4cjBuRVEwMVZ0Sld4RXBkTWdlWm4xTmVCNytCTm42aHRYRkcw?=
 =?utf-8?B?U1NuZXE2QVoxcERpTnNKZkI4bnJnUjFRbWdKekpwOG1LazRhMDZXZVNjNXZq?=
 =?utf-8?B?L21JSzJkbVA5VzZmREVvYU1SU3VPQVMxQ3dIUFhIa1BqUlJZUEJsaHJnUmk4?=
 =?utf-8?B?Q09VR29pZDJwUU9IVEJyeXdRWThCa29oazNmM2daSm5CTjhtQnJqZlFtSjdk?=
 =?utf-8?B?Tld5aytqTXRaa2NuWUVwK3BpOGE1VmdHTkZ3eElCMW04NXNidzl0Rkc4dWdZ?=
 =?utf-8?B?U3l2bEp1b3NSVlo3bTdYUWJqN3Nvbk1KOEpKMmYyOWNRK2VzYUZCUjVUS2pp?=
 =?utf-8?B?c3lPampJT1ppVnB0VHZqajRtZWxjL05BbHAvZ3lsdnFqcThGYnpQdlVwYkIw?=
 =?utf-8?B?OUI0ckN6WHAzNWpEUG1xWHRBS2dMd2NrSHlRYlFucG5ZUWdsQmVhWFBIYnpM?=
 =?utf-8?B?S3ZWU0tLa2M0RENBUjFpQTBDa0lNQ0RrQUo2NVY3Lzk4T21ScHFmZWM3M2Fp?=
 =?utf-8?B?U2VtRnNRV0c1M2hNSDZ4T1pWaXVZNTBlRldaUUpqSXNTaURyb3F6b0FSbzhq?=
 =?utf-8?B?VmMzUU5BN051Y3BVdWFMdFhQUjZocnNOVkhOV3RDQlMzTkhoYjk2UStMa3F5?=
 =?utf-8?B?YkNmaEsyckpOaGZ3Y0k3QmhicE5FdmtVWGtWTVBwUVoxYnN4K1VaTFdxdTBH?=
 =?utf-8?B?c1N4VE5EdGpoK2RyeHkramo4ZGt6eHJZTDBxaGdJNnhDak1vcWxVbWlyRVdw?=
 =?utf-8?B?b2dYNnBNTTQ4L2YxMC9NMmhUSXhjdGtydDRHbytwdkY2UFcvVXlqMlZXdDVS?=
 =?utf-8?B?TTlrdHZEbUptV1crbmdWQ1pMNGRsY2FtczVCWTNJZG9sbU1ISWJyY0tseCtx?=
 =?utf-8?B?Q2ovUnZQOXdCRkEzR3M3V3B1ZlZMOXZUVXJZbTFjbWFkZjJ1d0VmYldrTFdv?=
 =?utf-8?Q?sB6MNnwVj75IPGjSEYULJzkf4NaqCJNfCLQvt?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f75a796-077a-4937-0e3e-08df35c31269
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2026 13:46:45.5127
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3CWK0Ky6d00jzoTsgqDCeIzVdNy3r0MggbE6KNpPm/CjCT/uq5ZZfciwnnr5etpcxUuXv7Iblzi9frDhiX+EhSUP6y4TJdXajnIQFv5baGaXUk3ZxUdrOLkP/902Iq2f
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6892

From: Peng Fan <peng.fan@nxp.com>

Per reference mannual:
GPIO receives a single clock, which is used for register access and
synchronization with external pin inputs. So add the gpio clock entry.

Fixes: b0d011d4841b ("arm64: dts: freescale: Add basic dtsi for imx943")
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx94.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx94.dtsi b/arch/arm64/boot/dts/freescale/imx94.dtsi
index 020aa1da3315..90925d48daad 100644
--- a/arch/arm64/boot/dts/freescale/imx94.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx94.dtsi
@@ -861,6 +861,8 @@ gpio2: gpio@43810000 {
 			interrupt-controller;
 			interrupts = <GIC_SPI 54 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 55 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&scmi_clk IMX94_CLK_BUSWAKEUP>;
+			clock-names = "gpio";
 			#gpio-cells = <2>;
 			gpio-controller;
 			gpio-ranges = <&scmi_iomuxc 0 4 32>;
@@ -874,6 +876,8 @@ gpio3: gpio@43820000 {
 			interrupt-controller;
 			interrupts = <GIC_SPI 56 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&scmi_clk IMX94_CLK_BUSWAKEUP>;
+			clock-names = "gpio";
 			#gpio-cells = <2>;
 			gpio-controller;
 			gpio-ranges = <&scmi_iomuxc 0 36 26>;
@@ -887,6 +891,8 @@ gpio4: gpio@43840000 {
 			interrupt-controller;
 			interrupts = <GIC_SPI 58 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 59 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&scmi_clk IMX94_CLK_BUSWAKEUP>;
+			clock-names = "gpio";
 			#gpio-cells = <2>;
 			gpio-controller;
 			gpio-ranges = <&scmi_iomuxc 0 62 4>, <&scmi_iomuxc 4 0 4>,
@@ -901,6 +907,8 @@ gpio5: gpio@43850000 {
 			interrupt-controller;
 			interrupts = <GIC_SPI 60 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 61 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&scmi_clk IMX94_CLK_BUSWAKEUP>;
+			clock-names = "gpio";
 			#gpio-cells = <2>;
 			gpio-controller;
 			gpio-ranges = <&scmi_iomuxc 0 108 32>;
@@ -914,6 +922,8 @@ gpio6: gpio@43860000 {
 			interrupt-controller;
 			interrupts = <GIC_SPI 62 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 63 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&scmi_clk IMX94_CLK_BUSWAKEUP>;
+			clock-names = "gpio";
 			#gpio-cells = <2>;
 			gpio-controller;
 			gpio-ranges = <&scmi_iomuxc 0 66 32>;
@@ -927,6 +937,8 @@ gpio7: gpio@43870000 {
 			interrupt-controller;
 			interrupts = <GIC_SPI 64 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 65 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&scmi_clk IMX94_CLK_BUSWAKEUP>;
+			clock-names = "gpio";
 			#gpio-cells = <2>;
 			gpio-controller;
 			gpio-ranges = <&scmi_iomuxc 0 98 10>, <&scmi_iomuxc 16 152 12>;

-- 
2.51.0

