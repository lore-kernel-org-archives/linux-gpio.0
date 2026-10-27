Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.84.62
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793103237;
	b=B+c2zrEXoq1vu+x39ZR0nsm/sx5QM959/5PFXwxJanEJbXLzrEb8+3RnV48MEXB5zd7o
	 CNxiy6f6tNp/TtGyhfe0KNgQ6maRgj0UjNX4yhT379H0jyTbVbGSwyrPjn1OARSJylIw2
	 uI2IFQGJHZAUH2V5QcrbfSXFbR/CKoz28B1FvDp0pm45cOOIpi3Bup9Pq8AduVj5cnCMN
	 6In4oTHkmuPrO9a1fr19RMgnBmbQXx7LdPqIMtGia3PgXkgA+NdeYYZmg5CSvKD5PGneK
	 2i1aPuoD1JbWLHy1O1/jD37zj8IULmkOG3PNlpvjzIMiCS64TrSrLR+6lbLIXZzQn5Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793103237;
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
	bh=i7vZV1l8y7gUmKCPrxkNHDiI1cZ9akcuXdgZyqHVdWw=;
	b=c0aWzZNGs0FFCs7s2o45AHSqYL63bFeziVAYVoBqEFSAw9TPYAXyKJMKWNWY6HWiaRQr
	 lZVLf1/xfiA1vOu9IEVB1Yu6VCnVp+Ky0T70OUHVajK9+MyU8yhUsvrEc90TfJl3M5R2i
	 Q2nP3xoZDlPK7C+e1T6azcW3+3ZhvFAF6OoBQWudg1TCFJn3X2x59GNR08hXLR6ZHClrf
	 sdAiuOKFYTe31PFqqYCERfzC8Ru22lB2ZE3KhHhciG5rAzPBgMe3SCFzL7c68WldgEGb/
	 0S6tAWIsKaXWvMzDq6Qd/DzrpxpybeBbXVWmH8N0vMWfvdkNzELGi7FmUTCV36PksAQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=qxGYKbRY;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.84.62
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010062.outbound.protection.outlook.com [52.101.84.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCB58606A33B;
	Tue, 27 Oct 2026 12:13:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BCB58606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=qxGYKbRY
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y0pKsnvdkY7emJS5J1AxjtCVf8moDx+vo8E74hVHZbh/t6JNbSP3Q/hLkuk+kgCPfsO2mErbotWmhtGpETyj9T2iwDvtqo4sOy8rNmuEIQEQ+4EFGhzXfIGiIZloOe1khUuV+4V/NNogJBKc7mn3ssfCBwBLUJEfXGLp/tn2ZVAursm879IT/rKbdVnLAQ9MSzdaIkzfPXbZiHT2Tlww1aVRR9hQ9iHkU9mvc04MpUmapGFbQR+ZrYiXfxSAY51aAXojqqoe9x9lGSWi+Aha96tqYyaKvtWmgrYM/Q0IjyUF25pTGIWBPacNGIq+vnijEHW3SBvAHj9xoul9tlKvIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i7vZV1l8y7gUmKCPrxkNHDiI1cZ9akcuXdgZyqHVdWw=;
 b=TJOcIsIR9BJzwhhMPR81sz1FuDNRqJisBIIXm8YXhLJCn6jfo0Glutr+S67jwP/f2vwIa0a9NeaRzsIldNAWUlhEdnFa2etY/Af5+9OjyLPdbztvdXy4zbO2lAUcW6EN0VfB3gdr6g+1Mc2ImnNAklVWu+i3EL2YVudKyhix46EMnnAHi1b1owUJ21P/6mAaxa4KsHtLb9Uz9ugUut02PH1oQ+enUzMIPTx7VCcsBBq/cm9qCAAZVeE2bLB89NtmZCtccKpofjimgX30i9TfGdYXmSqmcNmPq+DGlcOC11LTuHf+4TIdTbqYCYpM16pXgSbTkaRvwPBKojlaVISOaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i7vZV1l8y7gUmKCPrxkNHDiI1cZ9akcuXdgZyqHVdWw=;
 b=qxGYKbRYxiXrbEzEegXh2sG+Um8UIZOi8r2iIUMoKkNXGzbEbvAp5a6aEH4zvQxWMmcAqCMGbzRkHsf7OeWhb57hFdvIjPsKJcNucL+4qcrhyOkbN3aTw23q8vYJJdZAoYtmWNjxnT1ZU8ezSzI32h1ANMPNutOk+Gs0Y5Gw8nCFcGzwPwrMq5KQJwmNPmrsZuAk0+TW/wEas4odiII7J/QXQSxofhcv5fXjtnQNQ1TfgupAdZFDR+L0JalC3eaHqP/Jsyx+R9m0NmU3P6YgWwmoDFhACwH0yuS5roJiYAFrn8rzdmuHqScyK7PE1H3FHJ8MKZZ2DlDtVoG3kKdcgQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by DBAPR04MB7462.eurprd04.prod.outlook.com (2603:10a6:10:1a0::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Tue, 27 Oct
 2026 12:13:54 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0546.021; Tue, 27 Oct 2026
 12:13:54 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Tue, 27 Oct 2026 20:09:38 +0800
Subject: [PATCH v7 11/12] gpio: mxc: use BIT() macro for single-bit
 operations
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261027-gpio-mxc-cleanup-v7-4-v7-11-7b602d70c149@nxp.com>
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
X-ClientProxiedBy: SI1PR02CA0006.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::11) To AM8PR04MB7874.eurprd04.prod.outlook.com
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
X-MS-Office365-Filtering-Correlation-Id: 9e99dbc7-5bde-415d-f4e2-08df3423c4f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|376014|1800799024|23010399003|261026140227099003|11063799006|261026121527099003|261021123027099003|261021121427099003|261009223027099003|56012099006|261022105027099003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	zVzgOV+oduZ2t0bAs4tgGtVIbDwpT9TGz2fBuup2p5YHebzfYx1UYZPFk/2ZQmfGMDFTm7VL++DiCncF3Q341X240rHo1k5IvrNsVDxx78OiMYcuZCQtWN49JBsJAJDw7T3jHJx65GMMS0E44ZTT411DlUcgl8EiulLiFYTJzOx3GQmQhspbBE1NXdSrL8bhdwPGfWrnqCK2I8ZuJNTcocE1CzCaKEBPdq6Aew6D7Xgg/Vr0yA5+IqzjDK5ZKjpxu1p5Ab14Tv+eTw5FSOXs48yZ85JSe9Ns0BQZ6bs0t3je8B56RZk5AuzBOS2GkSYhEzID8o26wQJcvqCHRwZ79MlHJeKU0PZBG8arsDW0pzlOhzZpP/PGu2XpYBaVhZ8PVbM112AjYdOVikVsa8aDtkBHGG6fuuOGrifuBDedSVhKMZKhV/r6uhYxX546Y1W/paeV7ek3ahzYPXccWUuoRnfSnpymdkSEezqKW7VMaXoyON9K3XN/QvPSPTOi87pf0KBiiSTeFrJ+Vd8NvAYwWk1BQIn/Bljq6zEI1VXUuCUp4OW/jlZZp/wxwH30JkgEbim6/NQjFMx/aHmARK4c2prHoLXVo5GnQyf8c0sUKn2mDhVV+AtQ1U7zBdW9NF9oSxA+dbsdL0sBs8WVzZNn7bie2jJC8sC8KeMaG2nz1xU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(376014)(1800799024)(23010399003)(261026140227099003)(11063799006)(261026121527099003)(261021123027099003)(261021121427099003)(261009223027099003)(56012099006)(261022105027099003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cUgveWdzZnRqeUhxMmFsQjc4UUVJTEdxbEx0MDNFQVlmU0FKYWt6U0JzTDFw?=
 =?utf-8?B?N2VWY0VJMExpcTFSeldHdG9WaHlkN0lPb0xGR0tiZ0FKNk5GYzg0bzMzVnRO?=
 =?utf-8?B?ODRIdjF1ME5kNlBrUXdEZ3ZEa0NvNkFPMW5RS1FKQVEyeS8vQ1NkOG0rMWhS?=
 =?utf-8?B?Mi80b3pJcUZxbFc5VTNXQVhhRDQwb0VJV0lRaHhaUjVkVWswZnJxTEpETFhQ?=
 =?utf-8?B?dkRNdk1Jdy8wVWNRdlcwMkdYNWJPTEZaZ1BiUHBKSFhIUHM4ZUxGMGYvSHN6?=
 =?utf-8?B?Y09ZWExBclUxTUZoWlAwMVJERjgrT1FxOEtEQldvNXFTejVFQmNEZ1N2cVpR?=
 =?utf-8?B?UnNXNFhjaVZ0SVJDczlhQUVrVVB5Um1kM0FDWDJLdVQrQXZQK0t6SUhOVGlJ?=
 =?utf-8?B?aWhhc3c2RDBRM05IVXhOTnE1dzlzcXdJazVTVm92RnJYS0dscE1VT0NUYjJx?=
 =?utf-8?B?OGFiRVdMTU9PTG8wUWFmclQ2ell3UUJrWVVsMWxzMTZ5OFZENDBVYUhyUDlr?=
 =?utf-8?B?ZVdrVVZ5WEYxZGViaVI2TG14bGRzbnNGVyt6RkRhVCtBWEgzcHh2UWFjNk9I?=
 =?utf-8?B?VWgwV29NZWdESnQ4dXZUVW1vYWhUOGRkZFJYMVE1Y3lIOFg4OXZQVFJMVGVm?=
 =?utf-8?B?TDVmbkN6eU55UEN6WmpNNlp3WXFnRk84VlVUZSsvVldIb3lvSnRyS3JzVG1Y?=
 =?utf-8?B?NTJWV3BmUFZpWldhdGdSNEpTMGJVTjZnNE9mS3VxcUtmRkt0dGJ0dk00M3hF?=
 =?utf-8?B?QUhTRWd1dzR4NjBuMnFvcDBxaTFPNnZzK1FXbFVBZEpiU0hTOXl5WXU5K2w3?=
 =?utf-8?B?WEFOdUxpS1VUdHEwSmJadEtBVkNMMEdtNHZlU3IxVkZHNW9WUXJ2a05MdTFy?=
 =?utf-8?B?Mkc4UEtYM0hyckRrNmwxNGtxejZNSVRFdzRNNHhLTWZMY3dBUEhkTXZGVldz?=
 =?utf-8?B?emlLRGNiWld3MTJHOVpBT2o1QXJoVm5XclhReVpXWEZzbkpyRGREVkIvKzFE?=
 =?utf-8?B?WWJkOC9PVWRPLzVwMlZwVjRFcEpXbk5QNlg4V1hqK0J3RnV1dXZpRGlHS0dP?=
 =?utf-8?B?alFpMkhHcm5xbGVMNkJoMXdHYWFBVDlKUG1QOTVpbm9yb2plQXlyMVh4Y0du?=
 =?utf-8?B?WXUrWnYwNWlTWlRzSmk0UThVeGtMTzV5U3JEam9La3JSSUdLUEtTSFI3SEZS?=
 =?utf-8?B?Tm1EdUdyZGU0WFJabHZaak9KMVhqUFdaVS9Nb2ZQMzVZcDVUUDF4b0pHK25E?=
 =?utf-8?B?a3FXbDNCc3F4VVJOTW90cDg4RzNiZ3Vnc2lOdFl6QnRaVnlsQUZta1RGR2xv?=
 =?utf-8?B?N1I0aFlQLy9MK0tkMzF0SkpKb0ltbjRGU2syYUlFSEhiZHZtRElSMmlxZ1dH?=
 =?utf-8?B?YWVIN1YrTVVFTi9xS011YktraUNIYXBCVFQ3QW9rL28wZWlKMFdOb0toT29u?=
 =?utf-8?B?bFRIZHRnb3dmZFJBdHc0NjM4TFN2cERheTg5SmRQL0RLeEpiRlcvWHdaRUdS?=
 =?utf-8?B?Y0NsSkc3ZUl6WmQxWCtySXhvMVdDWjRXVzdUU0tUYTkzTmw2UHhHN1laZnJu?=
 =?utf-8?B?MHdibG9lZ2JPcHV3ZjZHMXp2emxTMWtaUU9PY3FsOS9sem9HWDlZd2YvZU1t?=
 =?utf-8?B?UitZTWFmWTNxeDg4d1lrdkRlcC9KdEwzcnNwRFBydFpWRnYxNEFrbWxPVU1K?=
 =?utf-8?B?dEdLWkhFNzNkKy8zOGJYSE80NGp2N1NIQ0cvZ0M0MXpiYnlTazhsVk1kcStU?=
 =?utf-8?B?VzFDaGVGN1loQ1NaMCs2aVl1K1ZscDd0VXd5S3ROYXc2TGVvK2RPZTNCdFFD?=
 =?utf-8?B?c0tJQlF1TlBUQ3Z2ZDFUUmdrUUFmSG5heUhtV202UmI5dnI4OGRhVU4xVTg3?=
 =?utf-8?B?STI0dlh3bmtZdGRGYzgzRE9pQUUreVMvN0NRaXU0TU1lNFFzRE9IQmI5Y29y?=
 =?utf-8?B?Mm00SHhCcHZhTS9tTWFicytqUDF6VVF5UnJUbGRweGlEUnlXUW00dkV5ZjNk?=
 =?utf-8?B?ZTlxeWdwWTVFN0x4WTNyN1FNWnBUZFZDSDFGTnFvUWVzT1JpNktzNk5PeVVZ?=
 =?utf-8?B?WkxiZERqbnpHTjJtM3o0VDRSOGkxNlptTzNaS0ZZakNjMjVKcjNSNHd3OEo1?=
 =?utf-8?B?V0Q1VWxMOE9lSk1hWVpIZVZZQ2RMazY5YVl5UTVTR21Qa2NaTUF6Tm85WEhn?=
 =?utf-8?B?RjdTaDNHTDk1YnVwSVBKNDVVeGxQRjYwcHc4RG5naFR1SG0xQlpHNVpxZXY4?=
 =?utf-8?B?OUZ1dUZQZzk3VTZRNDVFR0FEYnQ3aUI2dHF0bmwzTEFPSzl5UE5QTExOR3FJ?=
 =?utf-8?B?ckR0V01xMndnYlFYRUdpY3JlSWtxdm1la2VRVWNIQ21OUFc5OU1OWVJXSEQv?=
 =?utf-8?Q?U8/LWMFWeeBD0k+3N6/1BKQPlXZ/lO+E0GWFu?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e99dbc7-5bde-415d-f4e2-08df3423c4f2
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2026 12:13:54.4178
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PuPK370bboyzrilNz/aeLCjdid2M1AITC6tGRgb9QPVlw7KMzqrsz/ViR4pbrgXvox60Tf5GSH2qIPxSqctZsHJFtcz5nCt16175GZrcX+P/Klf6dZ663V3w44NuCGv4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7462

From: Peng Fan <peng.fan@nxp.com>

Replace open-coded '1 << n' shifts with the BIT() macro throughout
the driver for consistency and to avoid potential signed-shift issues
when the bit index is 31 (1 << 31 is implementation-defined for
signed int).

No functional change.

Reviewed-by: Linus Walleij <linusw@kernel.org>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/gpio/gpio-mxc.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
index 87460dab67fa..cef0da73b885 100644
--- a/drivers/gpio/gpio-mxc.c
+++ b/drivers/gpio/gpio-mxc.c
@@ -275,17 +275,17 @@ static int gpio_set_irq_type(struct irq_data *d, u32 type)
 		if (GPIO_EDGE_SEL >= 0) {
 			val = readl(port->base + GPIO_EDGE_SEL);
 			if (edge == GPIO_INT_BOTH_EDGES)
-				writel(val | (1 << gpio_idx),
+				writel(val | BIT(gpio_idx),
 				       port->base + GPIO_EDGE_SEL);
 			else
-				writel(val & ~(1 << gpio_idx),
+				writel(val & ~BIT(gpio_idx),
 				       port->base + GPIO_EDGE_SEL);
 		}
 
 		if (edge != GPIO_INT_BOTH_EDGES)
 			icr_update_edge(port, gpio_idx, edge);
 
-		writel(1 << gpio_idx, port->base + GPIO_ISR);
+		writel(BIT(gpio_idx), port->base + GPIO_ISR);
 		port->pad_type[gpio_idx] = type;
 	}
 
@@ -324,7 +324,7 @@ static void mxc_gpio_irq_handler(struct mxc_gpio_port *port, u32 irq_stat)
 
 		generic_handle_domain_irq(port->domain, irqoffset);
 
-		irq_stat &= ~(1 << irqoffset);
+		irq_stat &= ~BIT(irqoffset);
 	}
 }
 

-- 
2.51.0

