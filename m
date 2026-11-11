Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.72.20
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794414486;
	b=5rVAkRWG3M6LK2J4Ye3mlnmZiq+S+w/kOHlk+vhXmqX0sBSfLEB5aMI6+lgYdAzQ+LkG
	 Sr1bl0JtG4zVN7PSlgBvaxZiQXQ/Uhl81mVBQOrJcnFf36+gIK2PP6JlJMwy45Qx+W11o
	 nFXntAGmP8Jt8qpWBqTvZnIlhi/whh0RQmwjYcj/uUCTLbmpYsQMjmOUFAUBOMuuzEoQq
	 qYmnMhFu4nT3YQ1268lmut8JHBsgPV7T3P2c7rL53M78o1RWH2apUWbhJvTgBojT7L+kx
	 N0qW9gQmt11eMPX4FRR0TWJOOnbOF0jMZL/YyOubNMYeOOC8MuLjmluzLuVIoSyru+w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794414486;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To:X-ClientProxiedBy:MIME-Version:
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
	bh=ybLOGaA1nN6cBj/Hon0/pxOTuN9BCR4YiCDi/L8J89I=;
	b=Yq8SdIFE/Z2bh+AL52BfuPVv4molOxcENKdAlot36egia9VrWuF6PgrbmOuqxGKvpG48
	 K2C1m+WoFSeVt0Qe7VlUw5sIWUobcTZ8FKfgD8wYzvNnQu5cWdYLNc41JaZqYDPbwDvkB
	 h2AWBloAgtYVFpfzaXSIfpyECtYZqvdj0irdsez4eACOP4LV8aa+3kQGcVXJhogjvpYWH
	 mU48JxiVUfAGtVkmzPKK/ZA5CmuwBtBC6hXuH1oo4hrvCF0hM/WwggNKhr6GY7s3EEfTB
	 /EE5J/C5rLfTb7F8HZ1Ho5fur6WkoCCfWDnZhPLdagguTsQ+CGK7iTxKuHfU1aAMZEw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=MTP3fi0j;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.72.20
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013020.outbound.protection.outlook.com [52.101.72.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC42A606A335;
	Wed, 11 Nov 2026 16:28:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BC42A606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=MTP3fi0j
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=quq8FPWuH13EVK+mE1tiQZFQmd8JlMdMdQ36thteUKleGnaGF/SlJ/jcB4OekHRyHyGfFhXPVmQgvH7dm3gWIvCbe4RDZuAp/Bh0bhYAMYLLdK/Nz0AYiX3uH+GbXKE5S7twL/SfTQyw8Gypog28kbMACI2tJIGRT/32tdZ6EQGd1caX5/r4lOEZEcxroz6C40TRBzhboFYcFSQAIfuPP8m8Z8C6y76Wz292VYocDQtvlIYAfisgVBaSlu9O4L79YYJdiKBtIOnCcBtkQC/xk4/ft+PbNun9GkjF8fhsElnsXOZonfAg6L5q49OwHz7w6xJy7MDRk+A4YsGHrr0SdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ybLOGaA1nN6cBj/Hon0/pxOTuN9BCR4YiCDi/L8J89I=;
 b=tC/osCaIoavxbXyzzOduPqgGXnVoZz1f5up/0xgBvT9E2Z0CCrN62DFU0v2WSOYeZcM4N/gYtAIea3pUHxIEYxRC7BjXOKbhhJkY/EO8y+Ad/CfdZZp6G/Qx1cZKL2zzcNkFb5GEdAzZZ7DHrPD52XMoPE7kU9iyQGsnTF5nq0H7jUd8cxhNWmlWlaW+BeDQ4DAczdrSDMk2VVsxU0Jm6tZKUeapNfBLa8Fg7ilLEXjwfr2Izi7c/z8xvJIcDsT6rkwXIusPHdXs+32sYkWZdrWZNmd3bwFd6m9Q2OxFUefOwK+3dt7l3tPp6asuS1UCfRo7tAu/XLecc5EoqkFEVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ybLOGaA1nN6cBj/Hon0/pxOTuN9BCR4YiCDi/L8J89I=;
 b=MTP3fi0j7Rq9MM7imje2YQTXEF3kJ9dpfNUjgKArnqF27kIMEeNNH9FVypLZcwJ27NRud8T0txWzL9SZpPQq222kJ5yxl+dpHHZSccxkKp77lv8WZNVpjGIyGDuDIgM38VNZV1p6ObwVtNYURC83kOYZQBqdO9FhQU5megAogL2gk1vKB9azgLCB9Jm5T6Q4uvWn3f/dN9T1MMkh+dNLvPkyfItej2K+CYCTxjDPlkWlh4ughwqS4Sn+XpAamD2euLzYlgjv+Z9Ab1DLU+NLpAErgDY7CDA7RPrq5XBbY+vwAq73TguRXcWeZtSw/3BuNkwTrWHHizcxYu0tv0eVxA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by GVXPR04MB519196.eurprd04.prod.outlook.com (2603:10a6:150:395::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Wed, 11 Nov
 2026 16:28:02 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0615.007; Wed, 11 Nov 2026
 16:28:01 +0000
Date: Wed, 11 Nov 2026 11:27:51 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Rob Herring <robh@kernel.org>
Cc: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
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
Subject: Re: [PATCH v3 01/11] dt-bindings: gpio: vf610: fix clock
 requirements per SoC
Message-ID: <avSXh92mu8jd2kMG@lizhi-Precision-Tower-5810>
References: <20261105-gpio-vf610-fixes-v3-0-504e19de5ad5@nxp.com>
 <20261105-gpio-vf610-fixes-v3-1-504e19de5ad5@nxp.com>
 <CAL_JsqJYx1TJA7aWUi=XR20Bn7ZqFZWG6jVT2b0+ZLe9RWoZMQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAL_JsqJYx1TJA7aWUi=XR20Bn7ZqFZWG6jVT2b0+ZLe9RWoZMQ@mail.gmail.com>
X-ClientProxiedBy: PH7P220CA0134.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:327::34) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|GVXPR04MB519196:EE_
X-MS-Office365-Filtering-Correlation-Id: 13e8cea4-95e1-4951-6090-08df4010c140
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|19092799006|23010399003|7416014|1800799024|366016|22082099003|18002099003|3023799007|11063799006|4143699003|56012099006|261009223027099003|261102123227099003|261021121427099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	tvfEu0gUjXLvNAiMj9ICxBx2729GKBgKi7UnRVmhAmKRVKz52tVa0NpSqejjShEK+vHFEE44BRpMdw3kFA82ezczYNUcSpkYDFiOjnr6ppRkL54NGL0VU3PN9ri8OjYrAr7runVtk+Q9NLiwOB25uuG2xg2vwvgjEXZoHg//TYK2o0hIMTW6Md7mfp5jjYAapnL6jw3U6I6NV4IiQVQpROUIt3YwOj2fTLelobGCToKOBKWWFMA8uactHwteOOUiMiteFcYTHNPYVJhG2c3CSI/O7NS15FHB6V/VIWQkAYGKaOe/IytWoIgZaqcvn38J8LWIBHyWzkJU1HFH/ji43tHKmfeUXVu7Fj7E9E5kOtfTU8ZfPO0KuOz0foo5eH7VZqi2nAV1DWL1XR4wvmnEW1QaXkW4Mg2r7JnZ15HQTEyzHkpDL+gtS91Cblh/wtoEtas2uMu3exa4cOFuxmbHSopmpQSSI4xWIGmkUyV91m6BVbOp6ERC63rTvRUt8mRceIlx5kmNdXo0ZXegnTn/BkRDWXa8DvZAZnrojpt9BTEYihNuiXr160TA6OGgiSewFzAhxQ3LFu2ujwjp7GSa0nN5JHIDIugUbPUpVLd3EThBApW8ydz67D3pnKpMpLknJr0ZwKS/2aScCUst23mQM7zhQUjBXfLgE31EQi2z0gg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(19092799006)(23010399003)(7416014)(1800799024)(366016)(22082099003)(18002099003)(3023799007)(11063799006)(4143699003)(56012099006)(261009223027099003)(261102123227099003)(261021121427099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RWZ6TWYzbXlGWmxQY3A2VHM2NTNQYi9WM1VjRnU0aVlpbmw2MDBuRVJiRnBz?=
 =?utf-8?B?M3QrcmpUamdDMnFSQVd0d09OL2IyR0dLWnZrTDgvTGtzb2xvelhBRXpJRnVI?=
 =?utf-8?B?V2ZTUmlONjAweStncjNiaEtLaHFHZnY5MkNhZ0FUSGNUMnh1RDZLS3dzemtQ?=
 =?utf-8?B?dkdSaDd0NDlyNUdLc2VwVFVpNnlPRVprVXEyZnJkcGQ5SWJsa1hscnRLNk9O?=
 =?utf-8?B?V0s2NENHU3BqSjdIMXhqQXBaN0M1V0ROaFd0WTU5eURDNVVqczRVaUpCQmMx?=
 =?utf-8?B?aUlMMnNDSjQ1eFlSMHFsWllWSEovN3NJdEQrWU5iMHZtek0yYjdRb05tSWdY?=
 =?utf-8?B?Nk4xV00ycFZOUzdId0oyaTNqdlNDOEpoc0RSV3pFRFhNTHh0a0RLOUJNWFBN?=
 =?utf-8?B?RUV2dDUwMkhZUStKWmlJYmlqR084UlMwVm9UTEhoWU8xUk5IVWIrMUFqWjR1?=
 =?utf-8?B?UGJ1MG9kR0Z3a0JVZkVWd0sza3YwY3RTUStvNmErblp1S2lEdGxxT2ZNZ0xz?=
 =?utf-8?B?OFZLaE0vUm5LaDB6TFRzYThZbCtYZFlxaFBhY2NQVmlyWWFRQ0pEVHIya0Rv?=
 =?utf-8?B?VkFXeGdPSUhKYktMc0VKVDJQWUQzVSttRzRVTlBIT1M2SmNUK2psdmQwSnFv?=
 =?utf-8?B?a1FsZE5lSzg5UENIS2lDaVAwbkl2YmMvVkhvZkhQbElOL0syc0JYVVZ3ekJa?=
 =?utf-8?B?SisrVFpjMEZiWkY4ZThlbHZhUXlaNTZwa1dwaWVTRnd1NWZRaW4rTTNzbDU3?=
 =?utf-8?B?dUtDS2RBcUtmSmtIK0gwVDQyMTRNRmJRaVBnL1Z5VThGZjVWbW9oTU9rU081?=
 =?utf-8?B?anFLaFBGaVBoc0tReUc5aTgvSXcvbVhXb0preU94WDNLbEpXYTdvWUZtVEpD?=
 =?utf-8?B?Y3RkU25SdXZSNGZWc0JLMHVrWWo0SFIyNFpXNi8zaEpVakUwMXZhcVVtTHJw?=
 =?utf-8?B?dkpYME1PeXdaNzhUMmE5LzZleWl5VVltcTN1VndhWVpBeTl5WWgrbHFQdkFn?=
 =?utf-8?B?N1FQN1R1d3lpd1pITEl5dmNrTlNHMGdsclphaDBkaC9vVklGT2d6TmV0ZHRY?=
 =?utf-8?B?d0lKV0VnOXJSRnFqOExKZEp0ak94WUY0bk8rZGR6N3V0eDl3K3dCbENBN0dF?=
 =?utf-8?B?YmR5ZHJBalpmOHE3U1pBZGRPNWN4YlNzY1RKeDZSeXZyYmZlWkx0cEZsQ3l5?=
 =?utf-8?B?Q2VTdXFEWTU2NzhFcmo1djhqaDl2ZEN2RG10Y3ZaV1k4U0hzUHFUR2pEWHpM?=
 =?utf-8?B?eUExVW1YVHU1ZHl0NURYTnNZdlhHQ1ZUcGd1dWVaWk8vam5LMjRYUzBHdVRa?=
 =?utf-8?B?OE1qZWE0VW1zZXF1YXBkZXBQYUFzc1I2SUFpeW1lbE1IeVRPbVlIeFlMVUlK?=
 =?utf-8?B?SjBxdDgxZWpYNE93ZlVsVE13SThHWVRielRFbXdWRXYzcTRyQ1BYc0szMG5S?=
 =?utf-8?B?eTl0UFFJQjhpRDl1amdYcGpOVElrM2xLV2l3ZjdYY3NlYWlDOG1SVEcrYUpI?=
 =?utf-8?B?NnYyeUt2b1l4WUh2UGhVYTIxVmhNV21jd2t0NE1UbWUza3QwUFdGMlpTQ2lR?=
 =?utf-8?B?RS9CbFJPUEIwQmZQeWRtTGJ4bHhvalowdlA0c3BxSDJhWGlDWDZubmcrdURB?=
 =?utf-8?B?MGl6dEpLQVV4bWhGODVDMEZ5TUVidGNYSENyejVocmRUZUNGTVQrbnhKVC9N?=
 =?utf-8?B?aWhvWmJvNkNOVDdCYUNmZG9SZko1MElFeWVQUnhVb2RQTWplSElpL0ViMUZw?=
 =?utf-8?B?dGJCdy8ybVArYkRTbElmanRnS2JZazBsREw1b3lNWk9NcFpMd0ptMS9PYmtr?=
 =?utf-8?B?UGQrRUI4VU5nNElmL0t6b2tZeXhMNGNXbW9ud2kyOGxXNjBONTVOY0toWGdJ?=
 =?utf-8?B?L1djU25qZmhTRElwdkZ4d05kOU5mZUVmbE55ajU1R2ZBYWVqa2JxSS9lTVA5?=
 =?utf-8?B?c1BQVHdNTmdRTG9zYkFPbGRlRUtXTEtvK3IzaHJaaHNVZFcyd0lZbGZjSEw1?=
 =?utf-8?B?OUJBc2NIdlgwSFI3a2xxWXhsQVJTMVpnUWY3a1JEZHlIV0daT1pmc01lWVVC?=
 =?utf-8?B?MU1IbDJXZlNuMWUwMHN3dkVUNHpHOStHTzl2ZjM5dkp2bU5MZ21yajZaOS9v?=
 =?utf-8?B?ZzFYdzVNcmtTSEdHUDhRWEJFdDY1b0JvNDJRWmd0SzV3TjJGYmJ5cmE5MTJv?=
 =?utf-8?B?S3B6MExhY0VuZ3lLanBIdUJaYVRELzE3WFp5THJlc1BFN1BmM3I0YjVYUkwv?=
 =?utf-8?B?cWhQaHEzV2J2UGwrN3FGUUVxbkl6ZE9DUFZZeEZtanFNU3FwbFFkTkRNRzhN?=
 =?utf-8?B?eXNPYldnaGxKRmsrUDRpbDFRd25CVWpCRXk3a1h2SFd3L2RpSDdsQVN4NnZq?=
 =?utf-8?Q?Zg5WuJm6FuwKxNcUwgzRSKhtpPa/UuLnQ0ewW?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13e8cea4-95e1-4951-6090-08df4010c140
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 16:28:01.6675
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N7wUHns1tSwa7zxKvgVJG4jI2qjBJaWOExbwueZBK1tekWBHD+JVFvlug9HkEhu8U0/f8apgvBVH2Ez3YiUiH8cUaGjf/jARMc8Yzr3lJqM7wQlTqjqqn17CmymMH/1x
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB519196

On Wed, Nov 11, 2026 at 08:35:04AM -0600, Rob Herring wrote:
> On Wed, Nov 4, 2026 at 9:56 PM Peng Fan (OSS) <peng.fan@oss.nxp.com> wrote:
> >
> > From: Peng Fan <peng.fan@nxp.com>
> >
> > The i.MX7ULP GPIO controller needs both the GPIO and PORT clocks,
> > while the i.MX8ULP and its derivatives (i.MX93/94/95/952) only have
> > a single "gpio" clock. The VF610 controller has no gateable clocks,
> > so force clocks and clock-names false.
> >
> > Fixes: c61d8b5791ab ("dt-bindings: gpio: gpio-vf610: Add imx8ulp compatible string")
> > Signed-off-by: Peng Fan <peng.fan@nxp.com>
> > ---
> >  .../devicetree/bindings/gpio/gpio-vf610.yaml       | 41 ++++++++++++++++++++++
> >  1 file changed, 41 insertions(+)
>
> Now a bunch of warnings in linux-next. Breaking binding changes like
> this need to be applied with the .dts changes.
>
> arch/arm64/boot/dts/freescale:952:50
>    Schema warnings:50
>      60 gpio@47400000 (fsl,imx93-gpio): clock-names: ["gpio","port"]

I will apply dts change.

Frank
