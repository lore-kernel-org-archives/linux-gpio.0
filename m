Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.65.16
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795684699;
	b=4WSsihbOqmKwk7ySFMQz+N5XjdxjRChhJrItf7Dbyp7F6msWO+KmTqppfyuPS5V5FRd2
	 cInkd0viVHCfJ8yymmNad29oCugdPhSRunURTU8GEELcTsu+2ILa/I/GYneQOq3YXvqdn
	 ny+IuPLgWunNfjUFhQbyO9BKHzCRyvWx5gSKKpsEqyhfavFlpHKzsch8zugcBDQIKplxP
	 rNDky2372IkvaRYlpQGc0x3qJKR1T/R4WnqaInJditXBJhjHW1glNE/gHoKxdrdyuMjjd
	 9nZPXIV5GYwifEaOx9Fzq8TyHksOTshS3ojDDH19/BpqR55xl6mYHqCStCrkkVwNfeA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795684699;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
	 X-MS-Exchange-MessageSentRepresentingType:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SharedMailbox-RoutingAgent-Processed:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=rmwQXl/jNc1FjAezHKKMaOGBXkJG2UffQfqSeUpCT5Q=;
	b=lwXGbpLD6j+aMcoeCz+dWpN3tX6y0Y1GLeRb0BR/IBxHUY1x5Jo7Cqihmd2jWpBZq6Eg
	 RlB6TrICuyw3bMWlrD4HVWkkoRf7INMur76L8qWmDAzRu+3/KWdArP0mMNNbS2vAQi3PX
	 FEdzKnQ1ZsMZxE+Dmo0pR5NSNqeHJy4zSx1TsmZO5X1P4TMnmw0/Dd554KTFhPrKIRgJg
	 Xj4vsdfRXM99Mf4/hmQlxMgUkXGbNJKiuOg03Rp3jkw0Z44bJ1ZOJNmoP14DaY742JySy
	 CFzoCpKAM3wIokyZ6Yop68FZgXgCrx145x8lsR/CyYRMcByBk1kDoeZn6utOsnU6XRg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=Dl1a+6De;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.65.16
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011016.outbound.protection.outlook.com [52.101.65.16])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21C4B606A335;
	Thu, 26 Nov 2026 09:18:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 21C4B606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=Dl1a+6De
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c/efjJwyn+tMydVrgl3ASIWGVBypR0k1DmMzY/cVBePdSG0FUA0BCcPHnbXiv7eXtb7vcvdTEgm0JEbaC8uUn42YNGfjuNOHxSikIoEovWlhfJKxZ58T6Kj5sEI5+JTk4DDlie1h3dwYVCzTaniJa6r+dqP+TWxufdnCmsg+Z6OgYjwVJYSUYAQk+ShV7vz0uiSD9I0mDZO45aKomuOIZjJ9u8sBM2WVMzP6buPnhptCXeinGnsA0ml6PAr1ALu5fa/oxZp4Gbcoe0InlRR4rNNaE3wgN26yY/LM5sKmRpzmsKILFvqZ+GRa6HqeyScdzkoEiHzkrtS785E7856S4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rmwQXl/jNc1FjAezHKKMaOGBXkJG2UffQfqSeUpCT5Q=;
 b=WaoUAHupJbD9AYIuVKAT5MvYVhQfVNrkUCFLJ1oJfoSYY0qWZqLCjLzfyH94d6m2XBtEwObb5eTVdct0wQSi+EDbEBLc+amjjND3v9yBWNN7z61b7J1dnYY1B6TfHy+ThO4vztx/e5+X858bKyHUKLCy1wQwszI2/RfJmCUIHV01/U58U1rRLsOQKZO52JZdBkrrgZWp0xcwrLDrFlAToa2IvwS3WWpHIFvWGVIHlkC1W2SJSQt8K1MNw+9f785SlJO6tkdQ5wzW+/gax4LVsG2hn1kPZvtoZsi/R/nyZ8O+OG4jWXalO+KV58/11+aJB2NZrjwxobDfnTd2SONkJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rmwQXl/jNc1FjAezHKKMaOGBXkJG2UffQfqSeUpCT5Q=;
 b=Dl1a+6DejaPCb9ZlBE/7EG2ddRhVmtzsAL30fa57Y2OKxGpjWo0hbHJpK9lWhuzaRxwnEOY3X90MvA+mqNo52ZXYBcDDeuQhjd2QmjvqjME67sJDS4X19qgXeh0JBK2VJ4+IKRdgMY7pWvtNpJIc+usJkV59NHWxM44TMVRv9ChUpioOaaBTQQ7JgWJi4dSg2X4aUb34SvDnob5xLCa6kp2747KEQmF9vsppDT+QobwhgPjynP9a1C7GLfklM6SDl1KJP5PgPacCMVZBRzyPpA2YcMTV0ZuMTLtYVcMGkUcT0xASdXUc3jr9Xx8UFML2td3UHTcI3lZUUDkCU700Sg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8179.eurprd04.prod.outlook.com (2603:10a6:20b:3b5::20)
 by MRWPR04MB12146.eurprd04.prod.outlook.com (2603:10a6:501:97::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.7; Thu, 26 Nov
 2026 09:18:15 +0000
Received: from AM9PR04MB8179.eurprd04.prod.outlook.com
 ([fe80::a551:cde0:6730:1d85]) by AM9PR04MB8179.eurprd04.prod.outlook.com
 ([fe80::a551:cde0:6730:1d85%5]) with mapi id 15.21.0662.004; Thu, 26 Nov 2026
 09:18:15 +0000
Message-ID: <18d8b077-5ebc-4f44-990e-d5e15166363f@oss.nxp.com>
Date: Thu, 26 Nov 2026 11:18:13 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] pinctrl: nxp: s32g2: Enable by default on ARCH_S32
To: Linus Walleij <linusw@kernel.org>
Cc: Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>,
 Frank Li <Frank.Li@nxp.com>, Jacky Bai <ping.bai@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 NXP S32 Linux Team <s32@nxp.com>, Chester Lin <chester62515@gmail.com>,
 Matthias Brugger <mbrugger@suse.com>,
 Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20261112083600.1550204-1-khristineandreea.barbulescu@oss.nxp.com>
 <CAD++jLkEC5eDjLGRCAfv4gQWO-f2WQQ18QThU2_QpWAvSdVi7A@mail.gmail.com>
Content-Language: en-US
From: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
In-Reply-To: <CAD++jLkEC5eDjLGRCAfv4gQWO-f2WQQ18QThU2_QpWAvSdVi7A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS4P250CA0023.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:5e3::11) To AM9PR04MB8179.eurprd04.prod.outlook.com
 (2603:10a6:20b:3b5::20)
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8179:EE_|MRWPR04MB12146:EE_
X-MS-Office365-Filtering-Correlation-Id: bbdb96fe-eda2-4b69-6ab6-08df4b9e33a6
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|19092799006|261026121527099003|10067099003|11063799006|4143699003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	wLsVjeVORMq0JRTaU+QO29kBi7gmMHku8U+QoT6nbe06cfcPCX0sH2H5e1Zgd7NkDzNV8hmfyZY/f0JK4VLoyQpDzCNUUIkrJArJlUS3xhywK8uTnkPZ9dRtrAwT0rFwC03W2YaQ+oo8+DpUMbaakUWOeIgVwQK2qOmeiGs6O3PaMN+zWhjMW+nHEqDByQGXMxlFP5WeNjMpvAnAfZmUzW01EzBS8nh0mk1FI33UbmQlObnhFNQwHkP602D7b+hevJITMJ+uObkiVfVab7NkSRR6AjmK6oh6RmFDKizjuxRDUGohKfisZa3IfdXrjBUTNncdYThBaqlwbliv+yEUZwkx39ixVZSSmcsdjzU8SWtL9kFrxbpC7G8abkKxhIlN1hOTZZxQesmLcze4eTGfEggHgHnQa9FsfBYFmZ65JjtC6Fp24kmMlIgdBlrjbJGEoSu1O7GvvNUaaTfSuwndTZJfMfyTAOC1bATgPiK0IfVWuTHi0ACEvbmKY/LBj3EjKXzUgRv8+//KGPwbMxsl8/FBRFcc/dKCTSzxIjzeguNWdD3HXqQr1/AtCDgkLFPxsRTfm/cGgQH3qEH/8vpxzK0W1xJ/sup39uAv0r+TbCEEWYGejNILYCsSSqpqaWC7muauvj+6qnWHGW2Im/fC2utChCdBvgo2/2YR+EbRNYs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8179.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(19092799006)(261026121527099003)(10067099003)(11063799006)(4143699003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dkVpRm1Ld2ZOQ3p0dkFrVlBqeUQ1Z2JvU0NUMUdjamt6VlFGcVgzcityT1pD?=
 =?utf-8?B?SkpJOHFkbXhFdEpreUNsaDhmem5EQVVSSFIxd2N2OEM0dU9yZmZkOFpYekEr?=
 =?utf-8?B?ZzIxbDVOVjVEcjA0RFVrc3ZGYUR4U3oxOGpIRnE3UG90SW0zSFZ2QXNUU0ty?=
 =?utf-8?B?ZFR5M1VYQk44WFQvb1F4M3p5WStOSUg3aTZaWXBzWE0yRDk5aklqZDI0T3dm?=
 =?utf-8?B?b1hEMm1RYWw4cU8xd01oU3BWZk1Lb085cVBqTnBCbjE4VjIwUlN5ZVFIb25C?=
 =?utf-8?B?anREL1dvVGIzbnB0aS95d1VGS2xLR01OZmw5dWlBam1yRDVCU2QybUdVZy9P?=
 =?utf-8?B?SmJxMHBVcnpZcHhtRnRabVVTNm1OTnN6Q3RTZFlidkJVSDFHRVI2ZTljMTdr?=
 =?utf-8?B?VnRZYUZhSk9UNkdYaWswVFVXZ1ZCZHNJMHJGV25UcEc1dHNoc3AyREQvY2s1?=
 =?utf-8?B?Z1R0Mko0TldIMllGbC9QY3QwSVRwZURDSmYyTVVpbGY2d3NpK1IvVjcwV0sv?=
 =?utf-8?B?b29zWmUvTTc4bGliTmFKdEc4MjFFbmpIRVV2NloveC9vYWlPK1RYU1d3Z3lL?=
 =?utf-8?B?Lyt2Ump5TXFhTi9OQ09yZ0pab0dkeHRIZE1ob01xY3M4YWYrUVVraEpIQTFS?=
 =?utf-8?B?VGVTZyttTjBxdHNWTENTdTc2SVNqTmwzTExBM0NsaXhxYUtQY3I4cUhvdjhz?=
 =?utf-8?B?eUU3VUF0SEVHR2c4UkdwYkNYTVE4dllKeDd0eTMrUjVNbUxKbFVKbnM1b1py?=
 =?utf-8?B?M0FlSDNUUVBodENJNTlZL01GTWYwbDRpZk9xUDZYbldkYzZHL0lWbjloMjRa?=
 =?utf-8?B?VTFpUmlEOFlPMklRQ3FjakRlQW1RMGlZa1RQaEQvc3AyM0syTWRWVTRNTmRZ?=
 =?utf-8?B?Z3Ridm5RZ3pWZ0RwblJYbi82bi90ZnMxZDUxeTUxVUJNY3Y1a1lrS01raVdv?=
 =?utf-8?B?QzFCWXlocFE2akNEZm4zaEtmcFZPZXlHanE5L2RQK016Um83alhBUUdyZzFz?=
 =?utf-8?B?MjBKQ2JkMklJOEYyZTl5Y2tYNUllaDdtdTcwMlJndWx6SVhUMWs0MkxLMFgy?=
 =?utf-8?B?c3hZMGw0SU1WYXJPNHFxVFQwWDY5OFhCaFFic0ZLODNCbWk2S2w2aE5QK29T?=
 =?utf-8?B?VUdpTC9jSFJ0b2s2VTFlcXhXT0xDd0duTmZuNGliQUIvR2xpbS9SR1pTTkV3?=
 =?utf-8?B?UUFYc2kxMDN6aDBYaVBXMHdqd3ZQc1M1bktxNC9JMFNhUHhCclB6cEJOeTl5?=
 =?utf-8?B?a3Z0cXdHcFkzdHMwTUl0UHRsL2lsTTJQTmlXSjhBbTFYVFdCNWZLbFdEU2pr?=
 =?utf-8?B?YUM0OE9JbG15Nlh2WjY3SlFzUFdNaEFlSjVWSitIdjNKZXFxajVMa0w5UXV4?=
 =?utf-8?B?VXJxMWVkNlJndUR0RnN3aW9PeUg0cE1nTlczTHF6RE9zTEFIWjJndkFMTFND?=
 =?utf-8?B?TndUb1RGakFDc0JQd29XalVYUHhKVFN0czVsVFRRdGtyeGhGaHIyQmdsWGVF?=
 =?utf-8?B?SXFCSnpRUTVVNHJaclZ6aURNalljcEloanFLdC8vOFJKWTJURDFkTmtIaGZQ?=
 =?utf-8?B?dEhyTWNjM09pMldhV2c2cGNwbkRXQmljRnhUUXlJYVFuc2FiMnVMckNTNlY2?=
 =?utf-8?B?VHVTeUZTamdkNS9xS0Y0cFkxWXBVTWd2SlVjSXFla09EM2JmQmdSMlZoWWN2?=
 =?utf-8?B?WTBHenI3U0dza0ozeGZaYzRFdGVIZnhRTXdNTUdab0kyV0RyQjAwdmJUZGtV?=
 =?utf-8?B?VVNuTTBRRFE5elo3TWptUmIxcXhqK2c4YTFBTnlUM1FTNktGS3RRODQ3RXpa?=
 =?utf-8?B?SW02NlRoQ1lHSlNTSmJCcE81Q3lKWlFVK3NKOFlJbmUySjFXemo2WmhlbTRx?=
 =?utf-8?B?d3RXRkQ1VWd6ZW1vWDJ0UFF2SEdFbXd4aW1zQlZxMElSVCthaStsbDJBUkM4?=
 =?utf-8?B?YXhPOWlsc05hdWM4R3V5ZlFPckFuUlZEeHF1ZjFCM293VDNFMXMrTS8ybURz?=
 =?utf-8?B?U3Y4MGt2UHIrR2kydlQ4U1ZjTVlKS2ZlRzVnZ3VOd01WUkszTi9USTBLQy9z?=
 =?utf-8?B?TEc1TDI4ZjBSeWJoK1o0b1FPRUgyWkVyTHh2Z0wzcGo2eGQyN2VkR1JzL3Nx?=
 =?utf-8?B?bGRUdzEwdkIwY3dSOXhqQUlCblhQcGpkTm8vL3BhaTdXb3RQQXhoOEhQY3B4?=
 =?utf-8?B?eFlzbXRHUUZ3RXNjczJmazVTMlo2bE11YWR1Y0ZaYVJaMXp3Wmc0aE1SeXl5?=
 =?utf-8?B?TGRpYzBicTErTE1UbHdTckZQUmZCVS9USVBtTWF1ejNubHlQMi9KVkNWTjlr?=
 =?utf-8?B?SFhsd0VqeS9UTWFQbHM5THNFdldaNDBhMUVON0FPVWhOUitIekE4NHo2V2s5?=
 =?utf-8?Q?jfaKm4BK4T+QUk5QH3sTWIeg5Ixlyhhpd+cHB?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bbdb96fe-eda2-4b69-6ab6-08df4b9e33a6
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8179.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2026 09:18:15.6836
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4pyRB4iLvgk3aT11zKd9XQDgsIt7ZE0Y8y4zbiR+QazHZG4ItFDd3SXAfQpXx1AEUxgZe31Xoc6mxNdm+lOSvJVoM1UN4d4ponUdIrYW6qA7f2gtyUsR1Xncqb3pHmhe
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRWPR04MB12146

On 11/25/2026 8:43 PM, Linus Walleij wrote:
> On Thu, Nov 12, 2026 at 9:36 AM Khristine Andreea Barbulescu
> <khristineandreea.barbulescu@oss.nxp.com> wrote:
> 
>> The SIUL2 pin controller provides the pin muxing used by peripherals on
>> the supported S32G boards: the S32G2-based S32G274A-EVB and
>> S32G274A-RDB2, and the S32G3-based S32G399A-RDB3. Without the driver
>> some peripherals never finish probing and a defconfig kernel cannot
>> boot to rootfs on these boards.
>>
>> As the driver is required by every supported S32G board, make
>> PINCTRL_S32G2 default to ARCH_S32 so it is enabled out of the box,
>> while keeping the prompt so it can still be disabled on ARCH_S32
>> platforms that do not need it.
>>
>> Signed-off-by: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
> 
> This doesn't apply to my "devel" branch (or -next)
> maybe I already merged an older version of the patch?
> 
> In that case send an incremental patch instead, thanks!
> 
> Yours,
> Linus Walleij

Hi Linus,

Yes, you already applied v3 (commit 1af2f0054a9e "pinctrl: nxp: s32g2: Enable by default on ARCH_S32")
for v7.5. Please disregard v4.

Thank you!

Best regards, Khristine

