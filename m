Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.159.67
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793714131;
	b=TxHnsYh3vWcquYAt8TZpPkEmTWoLQYhEr0GK4qRM8/qNC6LSHsi5jAbe5PmSGJaP6fIs
	 S3gJMUyLlo0dSg6W4DneFInLJVNKbT2gdKonjGoLi6sIyPGNo2btCSTwQVuOPMV3Bms3R
	 E9tKwTz5Erza4Te4IOBGUmRJ1igZtu2VaDkTIGzoONrnzMCBk1AWeGNgZaPOLxPF+8Xsb
	 DaTe96Y5bnckXYT1NxciRNtlr17NiAzXNCzyS+2sET1M9DTr/yXiGkgXTWks8eWe4kUMH
	 NAXTwINK3ZmkLsiD6hS1lv7+5l9cwgf/XJXDRHuyDgObuMCc8A7C9nXevH5uGaLF3sg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793714131;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:Content-Type:Content-Disposition:
	 In-Reply-To:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
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
	bh=15iPNMX76hPZfMDL2Kjo5BCd7jlwqSVRqvQ4YmPHZ9w=;
	b=399S8NAPATHFoTrtrEuuUZz3DOh5Ctl/HCrbpgzlrRX2Uv8Ixfw4uTIsql5yM5Pq8TUE
	 AqkC1N2bznNnXHIY9V9tCMkwdZ4VOl8dhwQrWHcIMyDNFr0cexqZX7uavMrnOHqhiqeHl
	 Wk3IqKX3cuKZhYEJSorU0glR+7oS7DBkU6zk7e8TTcXydSithlzP+aHQyvQwa/jk6xHas
	 IAoJ/YhJrdPcDCKbhFahrgUYoymOlHFEQji2oPuZ5gl+pi7yF7bTggbwCkZ+ovdLCQ/7v
	 W2SCGmlhS9Jhh9WqRA3o7mk/kRlefd2ho/bmLAegjXjtmMH0uZOHijy6/eLuBEFEDAQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=PT+R5cD6;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.159.67
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013067.outbound.protection.outlook.com [40.107.159.67])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1925D606D80E;
	Tue,  3 Nov 2026 13:55:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1925D606D80E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=PT+R5cD6
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SCEp57ZTDbh4szoNUMwfWR9xHCzvp0yNBhAE6ZSruibLBxEcOWARTms01JVMmkiKNJSCC1Jtp6XGB83oYIuMVmNv2adEi8qQuGCNExzGGA2O8RzmQ2Lrw2ijDDBMmcVJdiikx0J0+88GcumoQb6prNabNmQSPgjX4gijyu5pB2bGnjVbaXmYBz4me6/2XgJApziXQ3OUb+tXWaTTkDc/xQeHAE7cklYr6UNrk/JDT+WNlWzQXTTGd8ANwHNuC3dT9pMuGoyXXRp0VWlXK81sIkRgdFomuri3/3FBEgRt8MbvXwarm3sdEVeO8auJht7bGoQOFGlvzLc4iqXV0neKcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=15iPNMX76hPZfMDL2Kjo5BCd7jlwqSVRqvQ4YmPHZ9w=;
 b=lcPlCVDJ4YCiZ7sX2LiYZUk6j5aD8P29vp/A0mV48c+rVeHeVXHhDoVVEQSUJ8CM7qMy8SbRTzYPXE2vXpTmnmlHT5HU/OxO6Bzgz+odqvSJuCZSBMofAh3zHLKHdTd6HlcqfeKAUvW09c4b0B+usnTI26vOBunjs9SgSkZj944tq4babavPC7kOO25+5KJjzB+IDKkuEUD2X5ehE+cwwTOAxAAfvto1wmTPXAGoWgGTNhK9dkoRAqquYK1qeX8qLa6z2YLDi9PgCeMSHrOIbsj7CoV76eludDyRZ2lXFo5jNvcCZ6IKdUfGFfSPBQR+auo395PqTkkBDQHgY6WOeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=15iPNMX76hPZfMDL2Kjo5BCd7jlwqSVRqvQ4YmPHZ9w=;
 b=PT+R5cD6S4kPdNTC9xr+SLv8NhbGUSdmGeOU9P7En/jeLdiPAZcSot7J9XFUQvubOP9MZdSTRUv9cITYVRNSrxsPIOzxbOu+xlGF2T0NFA4qx/1kzYDfwTQEUTuTRSm7jZsBlqZjal4F0Z0KCkS0DfgR2+ph3DjUYV1jXK6rQrSqWHJNdO60t30DEpj79ZyjqQqH+93kGMeZHJQs4SrBkejlNTvnZUJVgFvPiRRbRvCZ4Rb0TAn+pJyunogEVN+HVEBx72iUnTV5AWoPi0tyfRlohSEvP/nWD6sOiqTbNnMcG3vODqCxOhzUDTEug9i5ay0bVXGoBGBBilQ7M2CVVg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by DB5PR04MB12177.eurprd04.prod.outlook.com (2603:10a6:10:648::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Tue, 3 Nov
 2026 13:55:27 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0592.007; Tue, 3 Nov 2026
 13:55:27 +0000
Date: Tue, 3 Nov 2026 22:00:17 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Rob Herring <robh@kernel.org>,
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
Subject: Re: [PATCH v2 01/11] dt-bindings: gpio: vf610: fix clock
 requirements per SoC
Message-ID: <auno8f235ZdGQsxZ@shlinux89>
References: <20261103-gpio-vf610-fixes-v2-0-7c71fb36e184@nxp.com>
 <20261103-gpio-vf610-fixes-v2-1-7c71fb36e184@nxp.com>
 <20261103-venomous-hyena-of-fortitude-063eae@quoll>
 <auneixIA0ZtvXukt@shlinux89>
 <80091b45-377b-4736-aabb-c1f3364d7d9f@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <80091b45-377b-4736-aabb-c1f3364d7d9f@kernel.org>
X-ClientProxiedBy: SI2PR04CA0002.apcprd04.prod.outlook.com
 (2603:1096:4:197::17) To AM8PR04MB7874.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|DB5PR04MB12177:EE_
X-MS-Office365-Filtering-Correlation-Id: 2fa49bda-1bd5-4691-b5da-08df39b21d7c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|23010399003|376014|7416014|366016|1800799024|261022105027099003|261026140227099003|261026121527099003|261021121427099003|261028144727099003|10067099003|5023799004|11063799006|261102123227099003|4143699003|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	uuoRGHhgbAz34EKdCyzvm6WR+uMeC1CsNwuzp0echRVxwZEZ2wqoywTm3r2ONJuD+ckvVSCH2BP2RHsvItdxbcZZRz3c20kGZ+PzK1uE32GAYqnKy2quDd++qOLubCed4ofkRRxF2asNVAbZxYckvwNAeUyW9Tt3VA0CR1JMitWL7rA4E0OAdQqVsVkBdsL44AGt5xIDW1+nH2APmxWmri7LRoX7+5cHKFCYYuwd3goJQAdEukddTWst4WRlGkHAqD+A4X58KXhs82BnfR6FR/Dw4/ptTLWSgiECTvf/9185ogHbwpXDLDOEYWOS8H32v2jKN5uj6zb5Rseejz4QXV6v2GAcDJhiFAtyNAWXuoJRK2ppZq+nCMu9oVZHRdB9M+Wtg/IoWqIVL9alHxA33cOUBeR9+a3FyIDHNbcUOlaugYl54Ccpf0yLWrVPdSiKfRvfQo5Xas5BBAWCnCa5joaAzqMi0Kmxv5GpduP8qXyo/g6wd3uFk9yenEYqbVYuxyaXU1FZHlprkKedQRe/oRR671bmGLsC0YTeohgSfWFojtJKDkQUPmwToG+8ToI/rO0w9jsYo2vF25NXPmYQcAgkNEpcT7s4PM6FKRh81aeyv2K1xkid3hWXb9TfwOeOSi6HKTTUJCpCPpARYcdqLu2YSpFeI+ee7N+Mj815X7M=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(23010399003)(376014)(7416014)(366016)(1800799024)(261022105027099003)(261026140227099003)(261026121527099003)(261021121427099003)(261028144727099003)(10067099003)(5023799004)(11063799006)(261102123227099003)(4143699003)(22082099003)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?x2EEqPgC1iAZXRfE6bOjEl+w6cHgS6+6uES8xp4EoM+1uf8g8dRItIjOC6ji?=
 =?us-ascii?Q?/9DB9pncr6XSMEPRMmf7rOuOIVx/JdSsDtx4YI8n80cjr7JO9S6V+1gE2RRW?=
 =?us-ascii?Q?gaOsYUQmcr3iKJIjQftEOUCRngVLvXVuzqGrUUwWiA3Zij0UyawsQdCjVMeJ?=
 =?us-ascii?Q?TqX1U0h6uD2eOPoog9uCGuKzIY/6a2x/hauUaxgxFMjHR1fUozn9Jwdc9Z1p?=
 =?us-ascii?Q?rUZ9uJjHN+QEDibGikYjhnBQppG+f63VrV6PqZGQhxFTZG9R5pEUzG4YvnYY?=
 =?us-ascii?Q?DeR7z02g1N7hKewAcpSzL5Csh8cqxRrrKtoaaM2KLGovY+2aFDV+hGKHGqdi?=
 =?us-ascii?Q?ogyFcTPhJTi70Iz/azFanI5D+7O8LcZi6b2cS4eRjXu5MQSHRoGAf4k5rJA8?=
 =?us-ascii?Q?Y364U8nX7JMlI1zLwikq2O8ZX913D+FLbcydWn8XlCGRG10lqm5byCDNyVNY?=
 =?us-ascii?Q?wjteT4vO658EIXqrwsJVnOA//uIpR7VvBwCZIc+EFTJ5sYo+Y7myFwYl42ki?=
 =?us-ascii?Q?nOC3d/ZruKAanzUEoYXOpGWHjEDHTZYAwXDA9KOqjbfq0dM98sXSuorvxAgu?=
 =?us-ascii?Q?S7vvNF4oRp9XxpuMYHKc8oUnxlgOUr41XSNEVsmxxqyKxhPfNxIkX/giDZYW?=
 =?us-ascii?Q?/a2SXPnknqnm/1qZ3roBUcnsKbKL/qoBKYnzrCNprlEF22tbKWZO55hFaQ2K?=
 =?us-ascii?Q?JAaetVnHSXxqDjAZ2YjA70OqK8NaAD/L/ifO2Npaz2HFSAY4MW2Ch58/sUeO?=
 =?us-ascii?Q?jedJHz8KVMvpj4kmp82oNXn0PbuogoABTyEyBUvvfwGFYP715xNXJbnI5PAn?=
 =?us-ascii?Q?i4biLe404s8qMDVrlP+LfshMqejwIO7Y1X+HiCcXl+jlRXObpc8Wi0FeRECX?=
 =?us-ascii?Q?QJGrFnk66FIeE+gPU4NBRx4T7aoG1M3NCg2UyxQ5MOH2eM84nsPpPejqCc/O?=
 =?us-ascii?Q?G8o84mXvz8eQYIcTkqW+yNI+cafRfESzIRzS7aq+9WOnsd5YuMovWTFBO9OW?=
 =?us-ascii?Q?4n3nuSNmYNrtvaTIaTWu/o9aTuHKttI66Tgtf4Y1AIe1JQj/jRr/RUSuF9MS?=
 =?us-ascii?Q?/IpUN05xCaAt6xAyKrJCaifHJY+HN7q6H36jdaEl2InOHG7H8qspSW/Rz5Hb?=
 =?us-ascii?Q?aC/O+Q2fUnHlF9uyipeQ9hwir7+sFi27cYHGPi06b3tcXMNvOh1mvSUNKDzO?=
 =?us-ascii?Q?dUNnZb4afr50Ng/YekrUfZ7qYqeG4uUhB2sOu78X2s/e7vb96laKFF8UbyTd?=
 =?us-ascii?Q?9XareVPMVydas13fJFNW/QugwjD/UTwZuARhXEMDUk63LbdvKcuD95txX8RG?=
 =?us-ascii?Q?7DXvgu/uTBdpS33SS4NnDkRG5NGvl2mlbBQtnm3Yy6wqzeDr1jEbuRkouGzF?=
 =?us-ascii?Q?GbjscTqLZStEiNJKzR7Giz8kd0d/XLCf9ek+oTorV36hqjTQFkSMl64b+bD/?=
 =?us-ascii?Q?3J2/7+KjAkgz2nXhFUrHQfEtDJfO/cc40A+xjUSe16J6oz84345ca4aXFxw0?=
 =?us-ascii?Q?Bw6McNG5nucyd03F2LWw6BGnL1nH3iIjW8+ZP1ZjYZ075yICw0kpf4TyWFfV?=
 =?us-ascii?Q?myFOzZVy+uC9NWi/mMGDYuTub2hwgBBTE17WAZBCZufarFkyhakIa1sFxzeg?=
 =?us-ascii?Q?PE4W/rwnN3xETAcTdmL6hWlGVI3S2k4BQ1ZC3NBTL32TJ6BlfeHdxpr76nQc?=
 =?us-ascii?Q?2EXn7LG06ADx9MifFzmnsdzLZssg3biH26wT39s3bw8AVMSVqJy8xIZiywgf?=
 =?us-ascii?Q?lwQG18Cr0/G9np4jryjgC7gpCy3PuQOqjla/smBCxp/VveOuqnsT?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fa49bda-1bd5-4691-b5da-08df39b21d7c
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2026 13:55:27.5397
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nKMVyiKF33s/C6R8ldJZu8N1bc1aal/CXoCRA7ZnkuTVS8yPG+7PehbTjY/fNdR0GiYEcsohsiXf0u8KHQfLAiNYKZa7H5+g0bg3emJpUhdE68PmYSVgAjxrwJvwqSsv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR04MB12177

On Tue, Nov 03, 2026 at 02:14:07PM +0100, Krzysztof Kozlowski wrote:
>On 03/11/2026 14:15, Peng Fan wrote:
>> On Tue, Nov 03, 2026 at 12:46:12PM +0100, Krzysztof Kozlowski wrote:
>>> On Tue, Nov 03, 2026 at 07:44:05AM +0800, Peng Fan (OSS) wrote:
>>>> From: Peng Fan <peng.fan@nxp.com>
>>>>
>>>> The i.MX7ULP GPIO controller needs both the GPIO and PORT clocks,
>>>> while the i.MX8ULP and its derivatives (i.MX93/94/95/952) only have
>>>> a single "gpio" clock. The VF610 controller has no gateable clocks,
>>>> so keep clocks optional there.
>>>
>>> Same second comment.
>> 
>> Please suggest what I should use to replace vf610 in the subject.
>> I not find a better idea expect picking "vf610" from the filename.
>
>Subject has nothing to do here. Read again my comment. You say vf610 has
>no clocks, but I do not see corresponding update.

Thanks for quick reply. I see.

In v3, I will include below in the dt-binding patch. please let me know if
it is wrong.

 - if:
     properties:
       compatible:
         const: fsl,vf610-gpio
   then:
     properties:
       clocks: false
       clock-names: false

Thanks
Peng

>
>Best regards,
>Krzysztof
>
>
