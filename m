Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.64
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793281560;
	b=d+n7WeTsG6owYo0r8CQgdR/9jJFzu55lDewkcVb1FzMIReN9hpVcPQ8sYEXiuzUD8tvE
	 3e/7+mlzVplvQ3BjFV71zTiyD3/NrFhYK8b4lQLzo/r4sV4WjH9L+aJ+fW0nndiLvC6Pz
	 8+u9DXPY1LJ5l4Aic2m25TlHOcNqWs/Xvz0gMz3JJ5yZz7DYVvdzq2NIyMInyDHBRzyxz
	 DSroOr3Oo53kRbyYxwcrhhMclz+PgWofs1rB3fryiXM/zsVyu2x2D4UAKvShFFCZBmtdE
	 aVL+q/V6X9bGOOeuyTpPPjit0u+7RzLDgEXu9ItMC6MtFhKUhHAgP47n1tOtgpYk3AQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793281560;
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
	bh=M35slrI/EOoqvSMyu3S48oTYhUWvYbOX5LImlI2u3Yk=;
	b=bQOYQY8fr/ctmNsxOmLf1uSSNS/RROgVmw/1uJuOtE9cX0FK2BlWV15ZZP8Zj6tKmcye
	 Bni0svb0x+ARtgtm/RNv6QvwG8cCGU321m4zaVyWd/AsY8JTuEDRRD0IgJXGu5AUaIz9W
	 9Dpp+8fSfDlzT3LGXwuqeWRUP+sKBxx9+dx5bLvrukcNiYpu4h8b6d/SiG8j/DpBVagbH
	 VJcMMKeVkH6KmZcrLFt7UmCBDLxoMOaBhVgMdOoqQhuXmh7iDdnMqkM3QxbKN6Vs3xa2Z
	 0Zfjl7J8s+tMSSgHQgHepY/Gc4LhysrfpWieenXzjMZa3t2hx/YZin0Gapih5IosGSw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=A4XOVrif;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.64
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011064.outbound.protection.outlook.com [52.101.70.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95D90606A31E;
	Thu, 29 Oct 2026 13:45:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 95D90606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=A4XOVrif
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t7v1PN1IFuBCr1cFLWt2/8PyPjNMCqpC3s/k6SI96H45NDEqTv25MJlrltqXZFNRGftIqcCyqlJl/BFcOOqQ5bWU+yBJhFmqIvJYH34TXU0wF4HwDliVvbmwQjO6b8VFBYDtEEArdZJX9xAwXuUx+pYHQRPNSYASX7q+RXGpxreFmql7PyVP2zEe68baJFD7EJdcxeaeqHFYnpn4SAO3ztrr0MmU/25nGMZGzJSAlZS3SWQ0ARJhtDBLT6wW4B2kByV0MlTD7FauKViEfba08D/gM6PbKZZJ/3u8FAZUWl30WBKqn4zWL0Jaw/32PUHp7cRZDL1Vou5/7EpihTiGiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M35slrI/EOoqvSMyu3S48oTYhUWvYbOX5LImlI2u3Yk=;
 b=cgPNkcR+JcdyE6aoPdbg9M95iaRQ8pBt+WTaIOeAdPwjZW/X/GgURuF2iS4N8hmgOX3roZ5hjzg0uBekrbj9R1HnB9LFOIvMuxiAcRA3EBApmELHPR52nd/ixVMFBCKFE4Lm7umMUWUJLUSjToMHAtGELGh3gNObHAwEfwUzwNcDTQiqnCEbegrPo8Ub1dj5HOEZji09uUHdCKhD4VAsvUFkmhP+oJYhiymL0GgiiZ+JV0/q49dz0lhoDLRA6je2UdYo7TtTlvH1rmPeGGaGMggDxJbp2Xjk3mrVaqOwaLcBjvfhTuH5rmBXqKoX/S5UDwI9ypSpOp72+vF6kvk2/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M35slrI/EOoqvSMyu3S48oTYhUWvYbOX5LImlI2u3Yk=;
 b=A4XOVrif2VbDM+zcQUxpATKGISpilEBaQ3zjgVx4lKz6oRC4UMbL+JKTgHH9zMQhUHF+FRHnh+Exo3zvJLYxWcJPVBLvS6Z8AKQaZxVso7tPIR4KpyqEo1C2T3tVoOCXyALSNkpUwR2Mu/5auZfF/PZqzFTAJu7f9w2QYERiSdirzfD3BkXveu+4jq0Z9RWzObiRIMH8kdNFDkc7g+U+Tp0tLrXdbURtM0i7XOozbWJ9RXvaufYop+Qc6YWYMwVxGg3uZy0H0rrkt/nd5zCjO+1kkZ4TuJbpsSJqumS+5kenCCHZluTD1vWukVQ5bWvYbLH8o5HEtUeAm2rasrOWnw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by MRWPR04MB12355.eurprd04.prod.outlook.com (2603:10a6:501:82::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.8; Thu, 29 Oct
 2026 13:45:56 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0569.007; Thu, 29 Oct 2026
 13:45:56 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Thu, 29 Oct 2026 21:42:27 +0800
Subject: [PATCH 03/11] gpio: vf610: simplify with irq_set_irq_wake
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261029-gpio-vf610-fixes-v1-3-45b484b4c434@nxp.com>
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
X-ClientProxiedBy: SI1PR02CA0003.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::20) To AM8PR04MB7874.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|MRWPR04MB12355:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c69e625-ea8a-40fd-1874-08df35c2f569
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|7416014|19092799006|921020|11063799006|56012099006|10067099003|261009223027099003|261021121427099003|261021123027099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	F809Z/XRaOpbdo9GfYVWPrz3GgoFfcDihiVk08OAwocFXhBOk8kjyRTOLbVOIcXVJvsgDVeT33W0iPWEkxdSEc320uSpxp0K6C+Rbi6Nfi7U60ilQzeQ20CutErBGDQUN6FfWlFUu2ATGwavUCB4mkOv+n7qPwjdhccdC0N5BHK+/0KybyLAqnV0Tp9pOQ0gBy6/q902f3Wa93HNGnfXmFFz+FxnvWHjt/MP3pCPrPeETCNjEHv3yPDKEKlSgPNfvWPjKA4i4VENDbEKcheIlrHN9xnLCgLaBtmAhzpVulJpWtmBqMnpl2TENRXBXga8gKYO8IT2e2ZERwpRmTXao6qaWC7/kQyeCBLsNwTPflDCBmsraEsNCoEHuYXY1XC9jaXGzhVN5YVcuGfVRN+tRzYO1c7lzypOzNa4kbuH0XQy8On3+/FLx7hd6JOTLONCJPaBTdCmovqcEyrqLQGM0ZRReaFfFoSQoIBkARAQJLGlXFnkqHgdJ/NjOWK/YZDZOhCJo2pUcNm4bc86G9tQ0vD7SK+HePpkviUQs9mk107O4DIgidzc4J8AzQ+ZTvUn7gerzTqAma3X/gBcAxvgAFo+MOUd4DVEmYm4Cn9OF8xsdksgxGZUia7NSxX1A2IgvVTc/hcFeb91nIOSG2j/a9/6asN6xn1nDt8adRCGdXH7W/XZTX+QN764WCT/vB7/PJvnAE9lettgZONCmmg5TA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(7416014)(19092799006)(921020)(11063799006)(56012099006)(10067099003)(261009223027099003)(261021121427099003)(261021123027099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VDRyWEoyLzV3VkdEOXNIaDBTSGw1UmQrbi9BV0JWclhadTY1YUpWYm1IZVdR?=
 =?utf-8?B?RXNzanliNDYvMEtIOHZKeURWd05ydnJwMVFPditLYzc1RTlTblFrN0dLVm0y?=
 =?utf-8?B?RUdMSm4xYWJmdExTRFQ2d2NEbnlCOWZvcXNZczNoeUh1SE1hSk1jTDhMaGZk?=
 =?utf-8?B?T0p4NEs3NmE0QXQwNStnRzJNWmhQUUJrWUwzUlJzZHJCa3RVNlhLZmV0UmZj?=
 =?utf-8?B?VUh5UmRTeUM3UzVPVXZ3ZTUzR2oreFJYcWVCY0M5OWtuNkZGQ1pWaURCcWRh?=
 =?utf-8?B?Z0Fubm5pQk1RaEEzN2UrVVFEUUF6MDY2c3l4WWJWalJrOFZwUnFJbzRVL0kx?=
 =?utf-8?B?c2kzRnpYd0FWRkUvZnRLakV5UkVsOURtbFEyNUkwZHhOakpIUU4vV2c4dzJD?=
 =?utf-8?B?WXY3aGtKV3ZCSHRmWGNmcWxLdU1QOFFrVDNScXV0MDFidFF2ekdBNUVWdEJW?=
 =?utf-8?B?ZEhob3VYVE1wL2NlYkRWMGVmcCtXekVONDRaSzUxeUIyZlNFbW5QYWRDYUZJ?=
 =?utf-8?B?UlZOMjVYcUM3dS9WNlQ5QUo4MmdvaVBKWHR5ZGhBc3VWZFhYd3R2a1pLcEYz?=
 =?utf-8?B?eFZDaEF5YmRud1p6RVRQMVhQT3d4ZGErcnB2SWhabi81V2trcjVQNmg1cVZr?=
 =?utf-8?B?dHZ4dVNXdkhmclR0RFpxYmhIMTZsWjJTY3l5V3ZMWDJwOEp6RitiVmYxKzZM?=
 =?utf-8?B?MjhGUWVlRDFQck1rc3NSVW5uMndTVXZoenhnL2ozY2t6V2Jsa2prekQzRjFG?=
 =?utf-8?B?RWIyelluZzg5SzI4RjYvRmNHVWlDUEJtT01PcFRPRU90NDhFVHpreDBQWHdt?=
 =?utf-8?B?STFDYnZhNDVqOWhZcnQya1NnRmJlMkVmVWNEMGJ2MS9HUnM1TGQ2MFJONXd0?=
 =?utf-8?B?dDcvLzVFa1ZUeTZmZXBPSTZhZU5JcDljVzVPNFhRa2ZLN0pWTHFXT21PUnBi?=
 =?utf-8?B?djhVeHVXeGh0dS83WkIvRFZNTXNSa3B2azlQMldEMkx0dHZicS9aUi9Ballw?=
 =?utf-8?B?T0lnRkd1RGxKRUMzay9DRnNOVml1ZFBheFFWaC9GcUx3WFlWTm9sVXNVVUNV?=
 =?utf-8?B?aTN2M0RqYk91M25lbmJQcWVROWJNN3RoQjVQY2psdSt0U1lDRVJFM2tZTU1Z?=
 =?utf-8?B?TENoWlFWMzAweGZlZXpzVzdERlEzRlZUKzdBd3JQRVhOWXhKRHlxZlhxaHA3?=
 =?utf-8?B?amZsdUM3YVl4S0VPQkRIT0l2bUx4VG5jNlZsOHVXNjlFWU1kSjY4TW1XOW84?=
 =?utf-8?B?aWFtdGVwLzQyUzhqNzFWRVlvMlNPeGlzWFV4Z3ovRjVUcklCVERvRDJWYUhV?=
 =?utf-8?B?YWQ5S0FsRFowY3hOME5DN3pmNUc0bWRQQitRc2kwczdMY001ZEFPU1RuM0Ru?=
 =?utf-8?B?eVU4dUpteGRNNU5oNC9EUWJhVVBxaVFaMVd3ajJLM0xTUlY2UmEzYWR1TWk0?=
 =?utf-8?B?SjNnZ2lMUVBpV25TVTI5VG9ZRDhDUEdUbGIwektRajIwcE81djVqZXl1WG9v?=
 =?utf-8?B?bDBZdEJXeFpOOGpEbytoWEUxTFhoNkRJc1VrZ3REYlFPN2pjVkVtWDd0bFJr?=
 =?utf-8?B?d0ZLL2JIYnFydDIvVFFmWmNNMXI5eE9TUVVETWVFSkNYclF3Mmd5VVR6UnNN?=
 =?utf-8?B?bHYwWDJJY2lQeWROc2Q3ajJFVThGSTRDTGZzYkp4eXpnZVIzTUdqcXI1ME9m?=
 =?utf-8?B?aUxxUkg2b0RMYUQwNEowWGRiQ0VsWmdzS1NVci9YTlJrTnowZUJiRnZ0djZy?=
 =?utf-8?B?a2d4dTdCRklSZWdvRTl5MVZwMU83bHRnMStKQjc1dVQzcHYzenFQRTNKRmR6?=
 =?utf-8?B?UE9yK0VkSE5zbVRjQWNaL0FRVkFvdUZRYWxkbDdSSFd6bWJVVHVmbFhBU3Zw?=
 =?utf-8?B?dm1WcGVTbjJhaUtQVStOWHUvcE1DYytCS2xkdEU3RnBSMVJpdS83QmVBU21W?=
 =?utf-8?B?WnowYTNCb1Y0M2o0Z29Da2JpZ0pPSlA2UnlzcjVndUVoRDUwVnpQdU4xVmxS?=
 =?utf-8?B?R3RncTFsUkNxNkZtNjM2VS8yeksyNlIyREQ0dVZsanpxSFdHbzVuZjNWUkt3?=
 =?utf-8?B?MlhIVHRLdFUzczU0cXMwUWxpTXFkeU5UR01CNkp1U1BFQi90UU5KSGd0UjNj?=
 =?utf-8?B?TTNjdThLZWFTZUs5Qlk2MWI2ejJndVE2YUQxbGlYeEpueTRYZ1RMcUlKdnBH?=
 =?utf-8?B?Q0tPdnR5b2pUaWR1aDVhc3N6dkNmYnpSRXZPTGVVM1F5YkxxR3AyY3lJTXpI?=
 =?utf-8?B?L1ZZTmVUQ2NPSUNEYXdKSnFsL3BzN3dZWnA5U0pqNmZsNHZWUldYa1I2Znlj?=
 =?utf-8?B?bkdzVlNobmF5T1J0eXZDQnd2U2ZONkh1dUpGRTZGMVFMQTNSWlJjVHpzN1Aw?=
 =?utf-8?Q?xndoaKiZ1W+3v7wfgPN5FJme86dljUpjCgne2?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c69e625-ea8a-40fd-1874-08df35c2f569
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2026 13:45:56.8149
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w+lW8AbcIiGAmFlMZafQmqwaa2hxHHffiR1AfYLfe3T7aoHuZCYjFFtqUsUm8vdX1WMNu2I3LqdUbmXGo9gkOJTj7lXK/Av0htKgc+Y2hk4IFaq5uKy/28sx48XM9Erz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRWPR04MB12355

From: Peng Fan <peng.fan@nxp.com>

Replace the manual enable/disable irq wake logic with a single call to
irq_set_irq_wake() to simplify code.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/gpio/gpio-vf610.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/gpio/gpio-vf610.c b/drivers/gpio/gpio-vf610.c
index 44b846ff1b93..eccc79a4d96b 100644
--- a/drivers/gpio/gpio-vf610.c
+++ b/drivers/gpio/gpio-vf610.c
@@ -188,14 +188,8 @@ static int vf610_gpio_irq_set_wake(struct irq_data *d, u32 enable)
 {
 	struct vf610_gpio_port *port =
 		gpiochip_get_data(irq_data_get_irq_chip_data(d));
-	int ret;
-
-	if (enable)
-		ret = enable_irq_wake(port->irq);
-	else
-		ret = disable_irq_wake(port->irq);
 
-	return ret;
+	return irq_set_irq_wake(port->irq, enable);
 }
 
 static const struct irq_chip vf610_irqchip = {

-- 
2.51.0

