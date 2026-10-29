Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.9
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793281566;
	b=tNBVKfvu6/oagnXndhAVbudHPMSqOV9bVCDjUufCZKXgfqO3XBrDCDmF+zEeUO0PtVq0
	 mcz3wJspMPFAeNqq9duSEYrGs6mCWVNzdsmt8PywwlSYrmV0kT9yRc9QI/6/pZ5Xpnm7G
	 OpHJSeXFPz/wrxPMlQgOuP17u8rb6E+rt4LKA+fgFqUnbUGkRWlR+WSTRZhOlFi+dKFoc
	 PllG0BuBXiSbAn8tt2avO+YPseTMAdjBAEcU3AmIg8A9T1V5IjSW497buNYMfpocfQlx9
	 sz7QoTU0kF0T9sx+hS01hW49CP0gT+YE/qtFR1TpnDl0fovfiYd6GYwW+FikgvUTUAg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793281566;
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
	bh=0t0A1Wxmh4XWIfjcmKKYyWsYPb/wCnIaYX90uhAdNfg=;
	b=fKe71W/cuAHdp3JPhuemSqSiUqES3OHCWbt2h5LiBpBMPX1xK3oJGjIJyBMRApLS0Lma
	 tVofsbn/CKsFxlB9RZqiXix4/h25f3y/F2fUP8a8JyRAsi5f/j42zPalAwHDWmzbFn518
	 4FZEHrD5D7JQcLaENdawXkeJUf8gaRLI7ptRaQX1UjVVPR8q+I5IwrOqtzdDQGsMmepbg
	 cxt9DmBLCfTyZQAIY9sekWNeGzd70Xr6i5qZdCzEauIOlFvVc5ZDctPQroVstn9Vzzz1l
	 HXPKqmlGLUbpsIk+FoAxfdCvP1w6B9aJo2grIIg3StxzSVvuxnDhNtIGUFB8JEDRoEw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=KA6erm0C;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.9
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011009.outbound.protection.outlook.com [52.101.70.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40ECB606A324;
	Thu, 29 Oct 2026 13:46:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40ECB606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=KA6erm0C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pa4/VTPVJObzZNDorbRURsl3iaMGqAahIz259NNVsJFMhKzB7BtVb32ck9wG5DIognZQThIDNH+v8uQJjoAXB8Ajav8aBfd14ofJ/3CdFc4zwCZY9N/Q+gjdqpfLOVHuKj6LEZTNz1NhxZ+Ws01ZIMPwwGUD3qyUnvmzsbWf5bq0vuxAoF5UFbMm7uOHAKUsF8TDpMKX8GlRBociNHHALQMRPBS+2yWJeDkDWOH73Bh4bSlzgPh5c6Pr1Caznudps7pc2Y5PRKVhRNQKCFZc7evZUSxaEMYOkYKD0NECVi8SsNBxCLSrdDQ+TriK/hLEWbZKLfQ10F9F0ec5+68wxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0t0A1Wxmh4XWIfjcmKKYyWsYPb/wCnIaYX90uhAdNfg=;
 b=QkZh78oRQ4mb3dwEZoUjdVHZAvvetRJlE12qgFKvWdQw/A0VqpLHb2EFOKm4h16AjImn84Y8EhooyWjkCIGzPUtppg0ieqAiZ6YH6yJsYuAEoUD0R0SfKfYZdDOflUY6QmlTjyiDG/XjVa1vGz3pBW6v6h8RBA9C1/Sf2p0Vsm1exY+QNPv689DoDcUxetdixgtFiWvdQ0upWdAkHZQT9yUz73xaH96O7Y4ZWORAUnDX7WDEdJ1I7W29CTGsXSfp0qKlMQylDn2laSiZf3NvkrmY+uJ9m5RKACUAEBWSFBNZ8OMFy0acj1k8fO9krvWYK6qRd9ovfTZDZzerQP2uSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0t0A1Wxmh4XWIfjcmKKYyWsYPb/wCnIaYX90uhAdNfg=;
 b=KA6erm0C2IoOkk/v+Ws2Lv68iV43CxL3YDVAkz+cSpFFr3rXUrnKdzyf7HMQNIZTi4jtaSvrNnNTJkkqxmoOo/z+wjJHVwuEMwQSotFix2yjGipmeH+WCR+7d3fdA1gwtrz7Zq1mDDyPTnoxS21nFDZ8MOr1ZMzGyZpm7lUc6nzee+MIGRU4J/fZWqHrCoLIRyFrJ9VENGQrr8risMAedwK4q7Ct7pjJCIfjdRhMKIxDn24nAF3UV+nVhpH1IKw1zCvp4qTi+RnIRi8DTi59YU027hjIRuRFdELdRmus4Jiczuz6H7q79bm7ZQsrCpHP9UIn0Br4dDQW9nfY58Melg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by MRWPR04MB12355.eurprd04.prod.outlook.com (2603:10a6:501:82::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.8; Thu, 29 Oct
 2026 13:46:03 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0569.007; Thu, 29 Oct 2026
 13:46:03 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Thu, 29 Oct 2026 21:42:28 +0800
Subject: [PATCH 04/11] gpio: vf610: use devm_clk_get_optional_enabled for
 clock handling
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261029-gpio-vf610-fixes-v1-4-45b484b4c434@nxp.com>
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
X-ClientProxiedBy: SI1PR02CA0004.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::12) To AM8PR04MB7874.eurprd04.prod.outlook.com
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
X-MS-Office365-Filtering-Correlation-Id: 56f01caf-4a4e-452a-8d63-08df35c2f91e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|7416014|19092799006|921020|11063799006|56012099006|261022075727099003|261028144727099003|10067099003|261009223027099003|261021121427099003|261026140227099003|261022105027099003|261021123027099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	hjjNswi7sO3X+hBLHS+c55SFyWXoGwUILiTt+gWjeUReTQi+IIX1gEjB3M2jrBM9oPRea0WYX7vcjsWUBapr/YhjBQxyD8OeUdE/mKQupIumGjpoK8N7sQQys4PScxzgc1jCnqL+k0cbxVz0F3v1BzSBBZUcfzPuNzCTtbWXBETKgIs6zLhg3FK2HSftmBwSSTraGAE1Zx9N6Bv/fnxg/BqvZgTiuETqSOHpqaqgQTIw+O2yhP1kUzi3eE2A3dibM9QaE1SdqI2MC0GNAFqBdbOriDiYYkGVDUlXmCxA2COn15zt02SzlDnEqD/acNy+ppjZoG1g2DfC3qBh6f/AgAQsstAKiRMjxE+NHVAX+2OdE3zPHsdgZcAL4DKI8qZDUazLbaL45xPlrFsiI2983fJsWSSZ/DJOjzWQ5/nz19wo76sxz7+lO7i85BokZaGiXCZLqQ90esFtiVyYvKciMfMVj9zyFlLTF85ZrgKUZGhz1ThFDiM8o4jJEMeI0/WCXDc7Vz+RZFoduDvl5X8Da/ikyjmINCnlvLq2VxEbFmUF5CJnKLvYi4l5nJaFl57kzIFeTIVgHeF5qCDLVMY1cNhU+j+q555pMlIYWGcty/dcbTDloKELRjKylVDYYFRq+gG1p5hK1DYBCaxgFLabW9skoTV68EEh7VlhGLmHeHARGOkHxndCR6U9vs0XF/0HB/BckwE+hwQYTQSnCDBzzA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(7416014)(19092799006)(921020)(11063799006)(56012099006)(261022075727099003)(261028144727099003)(10067099003)(261009223027099003)(261021121427099003)(261026140227099003)(261022105027099003)(261021123027099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UXUyMThTZXF1aEE0WVVKVlpIZVZvV2pTU1pPZTc1U29aNEoxa3UxNDdhaWVv?=
 =?utf-8?B?UytETkxDTkI0TUZzT24yaEJKTVUrUFJKc2djYmVBVThTTVREYktqOHN4bFhC?=
 =?utf-8?B?MDMyamNlRGZmbHg1UjA5dktUeE5xS0pzQzV1RDh2c0dQalRvdUxheW11ZmtJ?=
 =?utf-8?B?WWFpYnNyMktLcHowT2dHdWlxczViWVd1K1RySm1qVVluUWlmOCtjMmhHQVZC?=
 =?utf-8?B?S3p1OXMxUjFjS2JuNDM2aytIL0hrdVVJTENEeGY3UHlIRXJRUEpuaGpQOVl3?=
 =?utf-8?B?WG8rL0RrKzllOStVMnl4QTVTQWljdi91Z1NmeFFzeU1RNWdYNUQ1S2RHK201?=
 =?utf-8?B?U3hVclN3WDhRZ0FhcXVXYTErQ2N3bmxxSndnblhyQXVCLzVQbGpWOEJrcy82?=
 =?utf-8?B?MWI5UUJESk1QRGZRTzllWDlMNmtOTU9UNHpUZ0xlVWhlSUQyOER0cEFEc3Qz?=
 =?utf-8?B?MjBnWjhzamJSczVUQUQ3UXVmazI2NVBZK2RnbW11SEZZdG1icHVONzFVSEZH?=
 =?utf-8?B?bGdoYVFTUGFvRFJPZHI5OGp1Q09DdVRramM1WE1yZXNFQVNjcXpHS3l4dmpT?=
 =?utf-8?B?NEx0K3Z0bStjZnVLWXJNclZmWWFOeEhCVlNIY1IyVGJGQnpGSzd2MnkyUWgy?=
 =?utf-8?B?K1FoOVBRQ1R0RmJ6OGxmSjdLYzBDdGxRUXlkRXRMMnc2cy9XYXVEbEJiTDRy?=
 =?utf-8?B?OEY3b2pCU1czS2l2NnhmekN1akc1cWpBcnkvczl6ZzlGRHE5RFZhV3BycjA5?=
 =?utf-8?B?TGs5dEJycWhoU2NIS01abXNMaGhSRkM3bU9RaVh0ZmNaWXZ3RjE3dVBqbGtU?=
 =?utf-8?B?SGY2YkN1N0pFVE5PWUc4NkRGc0RkS3NQTG55SlJNbXhWL1locjdpd3g2MXlF?=
 =?utf-8?B?N2FTVDlhMDVTNkhhNXFaL3VmNW9sMTltUFNRMi9YbEc3Z0xBWnBjZkFuOUZm?=
 =?utf-8?B?bjQrTDdwV0FML0RzTGZ5bkNZOEdGSnlRN1liZnY4clh2bFB0c1lucHZJTzVl?=
 =?utf-8?B?ZHFMRVh2eHBzalVpUkxyRHJhNkRDb0tPbnlSa1ZWVVpBRjNUTVI1elJtSU1N?=
 =?utf-8?B?aktVZStYZEFGM0wzanJxODF0RENzVTMwMVVsVGZRNi81VkJleE9TOXQxKzMy?=
 =?utf-8?B?SURrSVpDUGdVaHE2Tk1lRk0rQWcyWlFxa3ZIaWdybWNuckdadElZeE1VTm5M?=
 =?utf-8?B?YXMvck0xV0kxN3YvREVFejBOYzgwT0lZSHBpVVhKd2xRUXBReVNUUGVabjE4?=
 =?utf-8?B?c0lyOHM1OW5sRnNtL0xyWGpJZG1zVjZNZHBOWWlpNExEdStaN3dJb3hiM2JN?=
 =?utf-8?B?dmtVaURSdHRjTStEV1lHTkpFQ1NoQjAvL2tOTW9FZHV0aThWZk1paFdQVzJo?=
 =?utf-8?B?MDRmajd2OUp4VHdqS29naDA1U1MrNGdQMXVYeGJzWks1Z3poUytDYU0zaUEv?=
 =?utf-8?B?NWY4ZURVZVFUQUF5aEdsRGRqTTBrWXVwUnVMWklHWlY5QTVVeGljV3V6OTFi?=
 =?utf-8?B?ZC9YQ3NGbWkyUFFHaXRnWVczYnp5Z2h6SWVlR1g5TVZyb3V4NmpsQjQ3OWVO?=
 =?utf-8?B?TW0xeFR4ay9URVBLOUljVXNHY282Q3daeFNTNWRodmFFaTNDTWN3eU4yQXUr?=
 =?utf-8?B?M0lzbWk2UjVoWmU1bXExVXo1ZHViR3djVC9xWGhlR3FLRmVWenZiRzRCY1dT?=
 =?utf-8?B?VlIyc1lCZ0Zrb3lyV2UxZ2pTVkk5UDI5M1V1MXZVZnc3cFlCYUdJWVNGZUk2?=
 =?utf-8?B?M3FnUHNCY0JBMHUzdDRGNGV2U29kaTZKRnhPd0luRk4xaWRrTDdSbkhSei9Q?=
 =?utf-8?B?ZkNjd2tVaFFMMHE2UWg1My9kTzBKdENEeVh2RnlVVUMxaHVhS09hVmwrcDRt?=
 =?utf-8?B?bmVLSGUwakxNUFV0VXlyWGxsYmhzWUtWQnZNaW4wYnhFczA1RG95ZkVsVXkr?=
 =?utf-8?B?NThNeERDS2lyQVByZmVFWllOUGpjbEdHTUpVS0ZCdTNaNXhaRXdXVGlsblh6?=
 =?utf-8?B?Q1hYNzQxWENja3ZIaDIrSGpUb25JZi9ZMUQvclBTRDE1d2Vxb2lpVFdqcE0z?=
 =?utf-8?B?VWpKenZyaS9ZbmJ0VVNXRGY5eEVuVHd4YXNUR05acW9GUjVSWktLM0cyTW55?=
 =?utf-8?B?L3grOFZmYUNFeUFiTFRUWUlBZ25RWXoyS2RJYVVxbG9ncEliZ2toZkNEVlZH?=
 =?utf-8?B?eG1JZnd4UENXaUhkc0FqOExMWjVEZ05PMGpRUjBQNUpidlh3THdiVml5U3pu?=
 =?utf-8?B?Nmk4YmZaM1kwaHdYazZOS3AzRUtWKzA4QTNJdEhueXlWQkZzeXE3S1NDVURK?=
 =?utf-8?B?K2ZxQWM3a3BpalNYN3ZzK2piYkgrNUNUVWU2aG4wS2NxdmFWeENCNXM0RnNj?=
 =?utf-8?Q?DwT5Oqkns5DJoOXoMl/2wNDkkAVsk5DpFD0+Y?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56f01caf-4a4e-452a-8d63-08df35c2f91e
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2026 13:46:03.2010
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8OLyv/RmN7BH1QwDqly2vgKjyrQkwQdkTCZmYwrQeHOXF0vjH3YhHOTCRceVa/toQIv2b3RzoxF3VR2CgVmNFJpJ3wk7x8KPMD9c8gicD0MfMtksBgdUH0ySgXKpNWOi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRWPR04MB12355

From: Peng Fan <peng.fan@nxp.com>

Replace the manual clock acquisition, enable and cleanup sequences with
devm_clk_get_optional_enabled() for both the port and gpio clocks. The
helper treats a missing clock as NULL and automatically disables and
unprepares the clocks on driver unbind, so the vf610_gpio_disable_clk()
helper is no longer needed.

Unlike the previous code, propagate all errors from the helper,
including clk_prepare_enable() failures. The old code only tolerated
lookup errors and failed probe when enabling the clock failed; continuing
with a disabled clock could fault when accessing the PORT/GPIO registers.
The optional helper already covers the "clock not described" case, so
there is no need to silently ignore other errors.

The clock pointers are only needed during probe now that devm manages
their lifetime, so drop them from struct vf610_gpio_port and use a local
variable instead.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/gpio/gpio-vf610.c | 46 +++++++++-------------------------------------
 1 file changed, 9 insertions(+), 37 deletions(-)

diff --git a/drivers/gpio/gpio-vf610.c b/drivers/gpio/gpio-vf610.c
index eccc79a4d96b..fda3633ee2b3 100644
--- a/drivers/gpio/gpio-vf610.c
+++ b/drivers/gpio/gpio-vf610.c
@@ -34,8 +34,6 @@ struct vf610_gpio_port {
 	void __iomem *gpio_base;
 	const struct fsl_gpio_soc_data *sdata;
 	u8 irqc[VF610_GPIO_PER_PORT];
-	struct clk *clk_port;
-	struct clk *clk_gpio;
 	int irq;
 };
 
@@ -204,11 +202,6 @@ static const struct irq_chip vf610_irqchip = {
 	GPIOCHIP_IRQ_RESOURCE_HELPERS,
 };
 
-static void vf610_gpio_disable_clk(void *data)
-{
-	clk_disable_unprepare(data);
-}
-
 static int vf610_gpio_probe(struct platform_device *pdev)
 {
 	struct gpio_generic_chip_config config;
@@ -216,6 +209,7 @@ static int vf610_gpio_probe(struct platform_device *pdev)
 	struct vf610_gpio_port *port;
 	struct gpio_chip *gc;
 	struct gpio_irq_chip *girq;
+	struct clk *clk;
 	unsigned long flags;
 	int i;
 	int ret;
@@ -259,37 +253,15 @@ static int vf610_gpio_probe(struct platform_device *pdev)
 	if (port->irq < 0)
 		return port->irq;
 
-	port->clk_port = devm_clk_get(dev, "port");
-	ret = PTR_ERR_OR_ZERO(port->clk_port);
-	if (!ret) {
-		ret = clk_prepare_enable(port->clk_port);
-		if (ret)
-			return ret;
-		ret = devm_add_action_or_reset(dev, vf610_gpio_disable_clk,
-					       port->clk_port);
-		if (ret)
-			return ret;
-	} else if (ret == -EPROBE_DEFER) {
-		/*
-		 * Percolate deferrals, for anything else,
-		 * just live without the clocking.
-		 */
-		return ret;
-	}
+	clk = devm_clk_get_optional_enabled(dev, "port");
+	if (IS_ERR(clk))
+		return dev_err_probe(dev, PTR_ERR(clk),
+				     "failed to get/enable port clock\n");
 
-	port->clk_gpio = devm_clk_get(dev, "gpio");
-	ret = PTR_ERR_OR_ZERO(port->clk_gpio);
-	if (!ret) {
-		ret = clk_prepare_enable(port->clk_gpio);
-		if (ret)
-			return ret;
-		ret = devm_add_action_or_reset(dev, vf610_gpio_disable_clk,
-					       port->clk_gpio);
-		if (ret)
-			return ret;
-	} else if (ret == -EPROBE_DEFER) {
-		return ret;
-	}
+	clk = devm_clk_get_optional_enabled(dev, "gpio");
+	if (IS_ERR(clk))
+		return dev_err_probe(dev, PTR_ERR(clk),
+				     "failed to get/enable gpio clock\n");
 
 	gc = &port->chip.gc;
 	flags = GPIO_GENERIC_PINCTRL_BACKEND;

-- 
2.51.0

