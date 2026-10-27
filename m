Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.69
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793103211;
	b=2PolHI9kFBfNWtPD84Y66ewRy4xGIsJ6Od7yKrI+imSg/1jEqEwaR/tkGfgL2lLYVe0l
	 p3VrHHcf54pmya8F2KgA29CltbW/gr+OE75YQWM8pSH3noXBjxw+l/xsXprJo12r+gUIo
	 CjuFNXmx5fpdmxBKvFG8MHwUR9B2yA52vYEMxdsdPcyDJKvCdxfF1SlLtyytRU23TfkaA
	 s00kz23xMu3SG97bGcvGUKakzlKVkWKGpOD4H8fqfa5NuM2B2goBHZHi/Pti4hyt1R5x7
	 6xqW7wW33ZVmQ1bEM3sV5qkUtJvkfCaS3MO4jzxRZ9pHvsyUTh1up2MIYhapBxbr6ZA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793103211;
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
	bh=Yopc8iRlPwx9QiclX5KhwkDVR9Xi/rHhmebOByH1+7g=;
	b=iodAr/X1zpP4ENr60QSmz+a004OJGGBdUJ2QjWiUYf1NXlcPu7IrxE+uwg0zwvibdD6y
	 untUlFL2cMoKLre9ys/dlsbaXWjgd1zy1WRGRQGLTcd3rQbWRGOPQ/WINvF9ubCD08N58
	 Td0fv87Zk/7FJqLXsedV+Xb09+lnifhIwreVS6nsb9o11mekrQT5idqOPPcGYRO8DjwZe
	 h4hWB5wTXA+qt2WTjZci9xm5wbxus+sNLWhnN4dkxtDNCgsj2BX070EWW5X5Cg8Z2/aSg
	 EXU+g7l2Dxp3PDI3zVexcLHaL45k0dKw30KxNvbnIeGm5hBc9PzM+N1HwUekdxyY+5A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=uv6FT5B1;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.69
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011069.outbound.protection.outlook.com [52.101.70.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A9DB60A3806;
	Tue, 27 Oct 2026 12:13:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0A9DB60A3806
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=uv6FT5B1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Tf6ZtpMVY4J8d2+QVCZnYde/6QAHFr4eezqgT0lGCT0ESYT5nfX2L2YmxiNBXDDwaTUBLiXL0VLx0cJdT6qolesfvERMwIzamPJBrUmXLzWIjLCIzeI8KhXwmAou35beKVChvxve5tpjtikEkYKjtvEp5vHvKdQBuDkWUkOyNYth6Di6Rsd20ZRJanE+mDJdmBgdPVKq0Vou87vRN563BAeICQbP/BguZMgqXsB+WEySnwRTi6af8lF3U1TGc1Dk7uxl1z6NW1YNXdwzW/H36H4jRk4SdR7LW2RMIxYXcnb+KI0/NcZemu5MUslq6/FeXZD89fZcVhBgbqxlk0DzZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yopc8iRlPwx9QiclX5KhwkDVR9Xi/rHhmebOByH1+7g=;
 b=s+/kH/L+JZNJqFUt51gfokVByAm5OGpSej2/AaQih+bpiVkx2fQOqGIVlTo/+WubxXjswoc/zB+10cTuPOiUT601QozIYol8icbM9uzKcDdkw1vlcOBL4sWQrnrEH/QSRTEPIn2rPEZ3TC2y8/Qltwx2FBlLZtUf8B2Hc7EQafTFI+a6JxdOxD3KSi2mHxQXkNFvqwXujOP/ymsephYqtnA/Tcrna+jzJDhCV8DJnbY3C3p0rKDDWC72oxPoRswRxJfguQOWZLVJbEd9AFdnVbUucF/DTr0gviIBnGs79dTOreXRjr1zXkoJdoqcXfRSs96EVqypC9R0A1/mphzL8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yopc8iRlPwx9QiclX5KhwkDVR9Xi/rHhmebOByH1+7g=;
 b=uv6FT5B1mdLrzwgdOJWf3kRxPwBGu6CnxCuc2MPKnr9j5o1pXQ8c0GObw5NwhR/T/Ff4SK6b2HrbRYBMhrTsBbSlbgr4ADE6mH+TUk9mDD7oYGDZGGdMOxR+FQpiCA6vIH85Z4XtLD6KV2nWsm4x2r8hIMI47zYB/hI/ik3ETedVI2avnT7jcbBRAf2f5w1QJKN4pz+6ibWLE8HJ/hU1K9pGFNsUwmO7ELaS2TF9XT21GszDHBVl7zuNqa48HSZpJafJiYxFKbKkkuy3j9yhtFFGY0HICejaAcp1nI6kZ8AUpaHYkeJeEE0a/oSxX9gEdMafrUnuad1NzueQrr+9Zg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by DBAPR04MB7462.eurprd04.prod.outlook.com (2603:10a6:10:1a0::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Tue, 27 Oct
 2026 12:13:28 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0546.021; Tue, 27 Oct 2026
 12:13:28 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Tue, 27 Oct 2026 20:09:34 +0800
Subject: [PATCH v7 07/12] gpio: mxc: use __free guard for runtime PM
 cleanup
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261027-gpio-mxc-cleanup-v7-4-v7-7-7b602d70c149@nxp.com>
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
X-ClientProxiedBy: SI2PR04CA0007.apcprd04.prod.outlook.com
 (2603:1096:4:197::19) To AM8PR04MB7874.eurprd04.prod.outlook.com
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
X-MS-Office365-Filtering-Correlation-Id: 14a56ac6-4382-4b1a-103e-08df3423b589
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|376014|1800799024|23010399003|261026140227099003|11063799006|261026121527099003|261021123027099003|261021121427099003|261009221227099003|261009223027099003|56012099006|261022105027099003|10067099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	4omvFSr7xvHPu1u1Icsww3nBsLeenZjCHd1veHPCfdKZxp6dnLBpGA8nabuhcZzjExRckOMGZhfdWUMEXvozdNK897GlJ1dFstNvqpJzwz/MwWYiGAF+ohIdsG8t5Ca3TZ5gELnoiDiF2OzVRBtZk5w8nPQI7Z5SWKNd77pPPKq0EvQAS9YRr06oIbKKZf8J0lJ1CsR4/tJtMxSD8Jl0SvslXagaMIyO23nSI6sLwIO8o85cGAJWs/KVaRyf6W+gUmbMdD8PSMcoJxxxaDDUxEWLc7SHg9MDkiZat4GOPmtgHpOTQj8nkE/Eqw15MOT8XSFNR2jJKIwIXKYaKGom+11jvGDll+bruyeRDCPzxNuRc4WVdH64qq5dZacvjc1RfNWVipNxLEyLVJBGyXN4jl6Dl3k5miUQteDUAFepq7wI5tsDH/WzcDbMmrsop1U2ZpwIYmnmp1Khd4xoDxBYnN7GeGcBJRJsLYrkH8ho6ad5/scneJSJvGkCAcuxWyQYaThYnO4TZ5BLVuro7F+XTPPDdE2FwSmZP6w5YJKMRvpWC1Ue13JyPLQO5OkAc9nruQ7AvoAIBPa06P+NEEv/4ugR9492WNydK2QCa9K7gVkqFHE5Beg3f76o+vG65xAtOVujfuMs2uKiQNWUgoUhCDarfLiFio2QbSnODbfE5Mk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(376014)(1800799024)(23010399003)(261026140227099003)(11063799006)(261026121527099003)(261021123027099003)(261021121427099003)(261009221227099003)(261009223027099003)(56012099006)(261022105027099003)(10067099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RGNmUTFGcElVT3liYlRBOTlqOU9leGFaN0kydHZVdVAwdVUvSUI0WVBZSE1J?=
 =?utf-8?B?bXB1cHNTU2hMTks2T2pVYXYxcWhIL2FydDVuaEt2eFE4MnNZQlJvZEdOU3k4?=
 =?utf-8?B?blF2UERKUlIzSEUyUFZ0dk9sbUljdU9uZUlmRERTMUhleFpGdyt2UGJBWUNS?=
 =?utf-8?B?NEZIMDlFamN3eWN3N2RXbC8wdGlDTTc0NFVBRGZwdjM3Q05rZGFIT0VPazRX?=
 =?utf-8?B?TWlCdDIzcGx2R2NuSG1lT1BGeldzUkdOMlF2UTh5OXNodzJjU0lIb2hKcHZq?=
 =?utf-8?B?UUkvYThiK0l4dXc0U3NIaU1jZjZCU2xhaSsralhHZ3J5MEd0UHNxcU1aaXQr?=
 =?utf-8?B?UHVzV0lvR1d1QTh6MWwxbkN3T05lTnVXRmZ4TmRjZ1luNUxrYng5bms4em12?=
 =?utf-8?B?YjhPbmFhYWo3NE5Fbjd6RDJLM3NPUzFkcFpLK2E3VTAybDlRMzZsOWMvbUQx?=
 =?utf-8?B?ZDdCWXJTcHNmbW1HT1ZaNXR4VUNIai8wS25BVnBKMVZuS01zbEVaTXBIUGJ0?=
 =?utf-8?B?RDJXdFdkTVRYODMvcFRVU3BIb1lVeDM2V0RaUC9CSTNoY0J0b09BVWtYb3E3?=
 =?utf-8?B?T1A4dTh0M3F2dW9FU2tzRGRSQmp6WEZJdVNObjVoY210T050aVdzQVBUanhr?=
 =?utf-8?B?MlE5ZWsyUG96d1VqUVh6SmVQWnVLRVRqNXpnNFYrR3RTemU1SUdqcVR1YmlI?=
 =?utf-8?B?bTYwcTZWTXcwamVoL1hQeTRUOC9GeEVvQ3c3OHZxVVNOUWFRemt0VXJOSWJT?=
 =?utf-8?B?T2Z4WkVySnlIcHBkK2F3Z0dKRlNYUW02TzhrTGpCY25qa1dXMkFmVU1pMHho?=
 =?utf-8?B?VFJQVThPbjdwMWdLV09zNldwU2NVbUNEcHdoWnM0a2VVODk5c2E1dktXL3lP?=
 =?utf-8?B?YkRVaDdETTY1K08yQnlFdnhnQXdmeSsrWllCU0ZDRU1acWx0ZXNSb1pRSGN5?=
 =?utf-8?B?akpZdjRRS1pwREI4c1plMW50V3lIYVZ5bkd5cDlNcWpmQVVmelZLQmtpOHFJ?=
 =?utf-8?B?eldTR2N2UGZiekE2aUZQTnZyNWo1YTdSVVFvSitTSXpKZW5oVXBjR1VoWXhH?=
 =?utf-8?B?aEpmQVFUZGVLYUVSWVZlRk9NTUhmY2tVZjNkd083VG5qQkdoY2I3d3lBakl5?=
 =?utf-8?B?UWlOM3kxcmFwZE1pNDMwWnNIMzdvelZ4WUwxZHV3MDBwSGVwTEpsTWk2eUR4?=
 =?utf-8?B?YVVhV28vUjVPeFdManNzdXpwbzR3d0laa3NsV0lYWHBMcmQySkVBVHhMNUJQ?=
 =?utf-8?B?aFRQTkNXa1I3SHFMYU1QSUcxSWl2N0UvSjZXa1NJTCs2UWlIM1M4dlVZM0hv?=
 =?utf-8?B?dXVNZEx5VmcrTFhYLzFCeGhRc3VUczBwVHhxdmV3aHZJc0lua2NvejNvMkdR?=
 =?utf-8?B?ZElERzJjYXc3ME1YSVluM1lEWWYxRVJBMjZiV3NZNkxHbXdKc05aSHBxeG5o?=
 =?utf-8?B?bUNjdGd6dHo1cDFsZHBnejVNOUZySFJDL0VjWmZxaTFrOCtYcUI5R0hYaTN5?=
 =?utf-8?B?NWNXMFlzQy9HWkJJQkxQN2ZqdVNyVmtMVmhLU1BXVXpzNFZtcWR3bEpTL0dK?=
 =?utf-8?B?UDczVDNOZFVhdFVtYlFPUmJtYjMvWk5wWFpKZGVOVHZyYlVlNEEzMTV5RFd0?=
 =?utf-8?B?c3VHSWlIY2czbjllN0pJN09ydUlDc2ZORnhZQzdPNHZHamlSa0hGWUtPUnRF?=
 =?utf-8?B?SFJSN2VIYTVmajRPaFErTzQ3YlhYZVBXZXY1azhyN1orTS9ocUIvQ0k0SmZY?=
 =?utf-8?B?ZFdBNjlLYklKZ1EweXVkLys2SUNjdHRPUEMzOU9memFEeUcvTU9EbkZVVWtr?=
 =?utf-8?B?a3RvUk5jNDBFTmF3UkttVXJhZEh3WGFpM3FFUUhZZm14eU5oZ2lNYWt5Y2hq?=
 =?utf-8?B?V01LRUp2WjhzbStNbVh4OHJYQXFXTVVQZmc0bmFaalBEcHF3ekhhaVlIS1Nn?=
 =?utf-8?B?eG9DaUI4TUtmc0FLbkgyMTJTUzFvNkFZTkZpbnJ4blFXdFRVNURWMzV0NTJB?=
 =?utf-8?B?OEJZbWtLMjFwMzJ2ZDJZYnRveHFScmprYnRMOHVibnY1RXYxOWQ5bE41MFlu?=
 =?utf-8?B?d1JZTUNidWd1TFFmejdrYnMyU0dsN3Y0Z09JZFcydFpnaUtkZ3dCUHBteWxq?=
 =?utf-8?B?Y3RJWDZwaDdTUWE3bVhobTI2UVk4MktET0tlc21UaElZOExYZXVDQ2JPU3Y1?=
 =?utf-8?B?Qml2NzNGTldXd1NlRVJsL3hVUUE2dEFYVkJZMW1zRTFmdGdMNTI5VXE2TnRu?=
 =?utf-8?B?ZFUzVEo3OWpabkhYbnRUbzl6TFlyQWxLNkNRNEJyT1FaOElQbDJaOXZyc3Np?=
 =?utf-8?B?VXV0TlVGRlh3YlowaDZTWFFlODgwZkpzMXNHbm4vZEZDeHQybXdFcG1pWXUz?=
 =?utf-8?Q?bNffvWhMqu6v88FqNzC+hahCVbs+xVC8rMQAs?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14a56ac6-4382-4b1a-103e-08df3423b589
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2026 12:13:28.5156
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UwULeITv3AoYbUQWVitHxF++C0ZjE248bXfJq2s9UQreWF6+HL9C+dmM643n5FcGQ/HBX9yxi3WKiwFgxDV545mKzf9gcB8+3E9O7qKqAwWpbbfVHjJ6YFNeSRgIHcMq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7462

From: Peng Fan <peng.fan@nxp.com>

Use a scope-based cleanup guard to disable runtime PM and drop the
probe-scoped pm_runtime_get_noresume() reference on error paths.  Disarm
it with retain_and_null_ptr() before the success-path
pm_runtime_put_autosuspend().

The guard keeps the required order: pm_runtime_disable() runs before
pm_runtime_put_noidle(), so dropping the reference cannot trigger a
runtime suspend callback while probe is still unwinding.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/gpio/gpio-mxc.c | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
index 21c74b244c1f..68857730b5e3 100644
--- a/drivers/gpio/gpio-mxc.c
+++ b/drivers/gpio/gpio-mxc.c
@@ -28,6 +28,20 @@
 #include <linux/of.h>
 #include <linux/bug.h>
 
+static void mxc_gpio_pm_release(struct device *dev)
+{
+	if (!dev)
+		return;
+
+	if (pm_runtime_enabled(dev))
+		pm_runtime_disable(dev);
+
+	pm_runtime_put_noidle(dev);
+}
+
+DEFINE_FREE(mxc_gpio_pm_cleanup, struct device *,
+	    mxc_gpio_pm_release(_T))
+
 #define IMX_SCU_WAKEUP_OFF		0
 #define IMX_SCU_WAKEUP_LOW_LVL		4
 #define IMX_SCU_WAKEUP_FALL_EDGE	5
@@ -487,6 +501,9 @@ static int mxc_gpio_probe(struct platform_device *pdev)
 		return PTR_ERR(port->clk);
 
 	pm_runtime_get_noresume(dev);
+
+	struct device *pm_guard __free(mxc_gpio_pm_cleanup) = dev;
+
 	pm_runtime_set_active(dev);
 	pm_runtime_enable(dev);
 
@@ -562,6 +579,8 @@ static int mxc_gpio_probe(struct platform_device *pdev)
 	mxc_update_irq_chained_handler(port, true);
 
 	platform_set_drvdata(pdev, port);
+
+	retain_and_null_ptr(pm_guard);
 	pm_runtime_put_autosuspend(dev);
 
 	return 0;
@@ -569,8 +588,6 @@ static int mxc_gpio_probe(struct platform_device *pdev)
 out_irqdomain_remove:
 	irq_domain_remove(port->domain);
 out_bgio:
-	pm_runtime_disable(dev);
-	pm_runtime_put_noidle(dev);
 	dev_info(dev, "%s failed with errno %d\n", __func__, err);
 	return err;
 }

-- 
2.51.0

