Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11020114.outbound.protection.outlook.com [52.101.56.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB1423F88BA;
	Thu,  6 Aug 2026 08:26:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.114
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786004786; cv=fail; b=EYt2gHHzkRxjcB7z1c8kF8k5KCQ95suWLcdM1H+UnGy4XT957z4xg+WunICi6dwNYz6I0w2QanhI/nqu5chhUBxKpPTNMcTJ1fIRXjix+Cedoa6Skvwy7fYKZcL/N6CAuu2xRLHz73+VeXmh7TCIcU0cYF3WCo3fzi0fwvuiL1k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786004786; c=relaxed/simple;
	bh=51kxJeEpXVzf9pERyY/WmwuyAKqEM3fKwi/y3RDBn1o=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=p+f6m2j8ozQ4vagFuKNNSbpU7bSymswbKp/Az3Ys7oIHoyoNp7MczaDctv7B2AExH9xmEBA5CqNF6RZtiV/fh0yyNh4LVPJKLL6+3fPrgM2aLDKZ+T2Fe1/QiwHbVZvhk1oEx/HPTgBOb71Z/XVCBvFt8g9xmzFKE/X51rftE6s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com; spf=pass smtp.mailfrom=axiado.com; dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b=MBrRXXRk; arc=fail smtp.client-ip=52.101.56.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axiado.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b="MBrRXXRk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qd8/noKGBBlC5oDnoFyYmD3ka8SVk7FUFz+d1jm9coR0JVXMk0WbcotXmbOLntTvgHQvUmH5pukZVbD40bW9P9p7aBO0yLaLRIH0Rh3IGteFcHAHTluXUILOKcP39plvMJXPfHEMeQ+S+Ca9fu0OCCJk3bPUecVnebI2jq3vgLPVA/DYU/ce4a40/XKMc/0XeQ4i8DrYWZ44Zeoh/cpe1Xh5QCH8k7JyadpAvph79d5JKslc3vRcHGNwoH8pjPZaPkvmTJT9bf4oLJd5voDh/+KW9HpU5Vem85qWvP7CJEreREpHkHcELOHTFy1D8ZL5xvGzJnTJE2f+fSdiAWfx3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NBThnQfwEBeD7+gY+EgsF9bjsoq+S7wtuqXsFgFw8is=;
 b=gunz0bRioPfzNRl/h4jYKmYyvPoBvOJf3ieZfIWdTITfIxY+r14+23qNF21anzTGMW9cvxUs/0OkV/jJIpaYO2ZM4ko84QD+6ymeqTC5F5uaHB7+yqeqA2k6P8yNwPmSRDe5bBwxA0YGIEYeG9CvWa2XdfjlpXXGHQTzeynvcULo1foqyQ/sG/I8LtpIdUTAuHo9+wLvSlzoFShsp/jWvfgmYlRXe98K3P+eaSbyIiI9BP/dz7UH9X1MlTbxiB+cNul5wvkn+ncRZkxtOCq0cQeXpzq/dwoOa462WXr8SfW3lUUgPa8PmXIIOD3hlzwh5C9rKYEjL6QuioZFfYyvJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axiado.com; dmarc=pass action=none header.from=axiado.com;
 dkim=pass header.d=axiado.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NBThnQfwEBeD7+gY+EgsF9bjsoq+S7wtuqXsFgFw8is=;
 b=MBrRXXRkllcuS08N2L7EA7JawQuaTtwUdCPy52V9ZbgqFhZSC7nkM/MhLsR5ZrkOv0clco15K+/zkhvBJf4YLynS1NV/1fFmeMnC+ev52j9HbVJy1r/TkqiUv8Yq0dVcRNW+cQhltWbZ+oCDgmiI1pTx0TTfizqM+JOS3E/A+7k9v0vluOmzzmNkfIWT7aALgh1TQCCX4sF+Byw8nXKxXjvrUus+uepv/Wj08a8BEomlzd9/0fB6OyLWpvfF9LW2vwhUqqHbZHcPRiosmz+KTSQEQaRv/3rB5NtNigqvXlIW4SnS26g4RSC5BtJboBymQiQiEBXaiawMCzIzFY52kw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received: from BL1PPF1B62FD55C.namprd18.prod.outlook.com
 (2603:10b6:20f:fc04::d8c) by SAVPR18MB988314.namprd18.prod.outlook.com
 (2603:10b6:806:4e7::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.19; Thu, 6 Aug
 2026 08:26:13 +0000
Received: from BL1PPF1B62FD55C.namprd18.prod.outlook.com
 ([fe80::89bc:34fe:3f82:b3f2]) by BL1PPF1B62FD55C.namprd18.prod.outlook.com
 ([fe80::89bc:34fe:3f82:b3f2%8]) with mapi id 15.21.0292.018; Thu, 6 Aug 2026
 08:26:07 +0000
Message-ID: <251acfd7-c638-4f25-9a16-359c50fd092d@axiado.com>
Date: Thu, 6 Aug 2026 16:26:01 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: gpio: cdns: keep AX3000 compatible in enum
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jan Kotas <jank@cadence.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260805-ax3005-gpio-keep-enum-follow-up-v1-1-9155fc19b631@axiado.com>
 <b1a713c5-9402-4dea-8263-f1bbb3cf90fd@oss.qualcomm.com>
Content-Language: en-US
From: Swark Yang <syang@axiado.com>
In-Reply-To: <b1a713c5-9402-4dea-8263-f1bbb3cf90fd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TP0P295CA0050.TWNP295.PROD.OUTLOOK.COM (2603:1096:910:3::6)
 To BL1PPF1B62FD55C.namprd18.prod.outlook.com (2603:10b6:20f:fc04::d8c)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PPF1B62FD55C:EE_|SAVPR18MB988314:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d618409-70db-4b38-34e3-08def3945cd7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|23010399003|22082099003|18002099003|4143699003|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	FN3daOfrO9qBSv8RyXVKfh2ocab9Ke5I9gL0WVrTm3pcrivLq4B8ffUvzMGuWkH4wEzfpqkPTTw6iORNfKNOZASgM+nr3pQUeZeVA7vAFjmPYk21Tl5cA4BvYCUJpF4KuuKTwc5l4x0Ev1HXbUj9tQeRXsiJYb3t9RoMceeFzBrAEPAJZ2K5sdjQDOAddNYeMIeyBweXof+vjyJKtzGOEUNPb8wtZuWE1Kgv+CzLZTZyK7cAYBgzifzddfT6zr9AXSYJAddY0q/C8Pz63jbaAKDpwQ76j+QYoZ6LqSVN0z5Po6/0h8lRCU4gUuLxlAiqkVBortZeCNLzaqBK9Lrd/L269bMV2vwoY/29hUkL1FIS+9vVhYEK7HcCUFiuuFGWr8t8YnsK3zuWvc56yLJqxKRYsKRm5OdrfWeh9WAkyRkSCjMsrbazGa2iXLTWFv0UJz0hXe66rndIOoLOy8CyCvZIhvkaRS8PyZwpb8FgyEMUfXUA/TmaJrhITP+di59157uc40Z/4KCjGu/WFw4uW1EDkf0xJJW9IsqoumuYDfvejAKvC3OHTrr08wEfeyukaCNZGkmQo2ETST5LmuCar/2hDuSyJTRgcAx/NN6SQVW+z1w0Mvaj0Cd5POTuXdp10sjvP64A2niI/eYsOvXx3mwjUoylqI60QmE4o26oSPQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PPF1B62FD55C.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(23010399003)(22082099003)(18002099003)(4143699003)(56012099006)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WWVGeDZ2aTdrdFFtYUdFUXFWOWlRYXdhd2gwdmtwT3BwbGlDSUVwWllIejZT?=
 =?utf-8?B?S043QkxzcHlKZWhZSjcwOXl1RExMeU5uSkRiem1kajM4Szd1OUZySkJxNUNh?=
 =?utf-8?B?QVRvQXZRa3hlcjdETnphTzFSeTNQdUwxb0dEUS8xQmFmVDVTdzZuRDRPQlFM?=
 =?utf-8?B?WWdyTDFVVmZmRFErMkdzOTRFRXR1NWZjYjFaRjBBQzIwZW5zWFh0UmtYRFN5?=
 =?utf-8?B?TlU4S2V2ZGVvaTdxVFQ5djZxSHlhb3QxNVFxZGtndStwT1E0dUZIS09acE1n?=
 =?utf-8?B?S0ZXbXYwUE8wejRGMlFtWnBINUtQVUpWNWM4Snp6NXFTUmJVeU04TmM3c09n?=
 =?utf-8?B?ZUhQdU4xT29XcWtSeDl3azNEVm0rN2NRMWdITHhGRXVSUllKVzduN1BlblJp?=
 =?utf-8?B?NDVqaWFWU1lPTHdHWkIrODloWWZFUEIrSWVXMnowdFFCOWxxYkFOUGNndm1k?=
 =?utf-8?B?Y2cxYTlQelR3RzVreXRhODk2ZjdBRS9JUjR2NDNoM2lURW1Idi9ZWHlaalhE?=
 =?utf-8?B?Zlc1UWVtQmthaTh5SWYweFhwcVpFTGpLcDBMbWY0K3R3UUtsaFhmMldHM3pu?=
 =?utf-8?B?alNmeEcvRUE3VzV3ZHcwQWZXMC9VMlJ4RXNpSG5ibGlmMTZNanhwbzZOZkJX?=
 =?utf-8?B?eHo3QjFvc3ViWFRKZnB6cXJRaTJIcitvWjhRTGE3QU1YWWVDMjhKTWIvK3Uy?=
 =?utf-8?B?dWJzdzhzN0RKNE1Pa1Fmb1UwVHRLY1dCVjRPanR5alRRdEs1UjNQRVFnVkd4?=
 =?utf-8?B?UUMzdHJyNnNVMGI4QWcvSnlKYnFvWG0xZm92Q3N4ZVFIUjRFaHpXYnJzZnNu?=
 =?utf-8?B?WmxpbGRRb25DUHB6d25XMkpGWi9zMHhHVUp0VXBPYUx1bGREbzBPcm5UUnB0?=
 =?utf-8?B?QjJ2SEpjZk8xR0NsQnROWHJQUmRDTXU3QTJjbWlPMW13MGMzS2k4b2pYMmlU?=
 =?utf-8?B?ZXRhS3JZYjZ0Ny91ZlRNaWlwK0ljOWRLRS9maWcxMzU1MG9CYUpmUnFpV3Ns?=
 =?utf-8?B?WFdSN1dtWVRraW9nNUw5ejh2TkF3YlQyaWlQSTh2Q2ZUTWpVOHB0cFI4SStJ?=
 =?utf-8?B?dUFOTlFNS3ROVW9nTFJqVkZPNVNrYXN5WXVUT0NHeVhqbHdIOVU0Q01UeG5k?=
 =?utf-8?B?MmUreURGY0EvS00xdko2YlJuckJPT1lMdGJTMEk5c3FMQ0ZoQnU3bXA5enJK?=
 =?utf-8?B?dmU5d0t2U1V1aElqYTE3K0tjamdwVHVtYUFSTGdUOWxkMktyZjIyc0V5d2I5?=
 =?utf-8?B?aTFwTExzSndlaTlJeXltcC9RdmJoK1ZjeDFaWEVzd1RuczVpcEFOSDVLTVFk?=
 =?utf-8?B?SGs1MFpuMy85clQ4VTljTHp3L08xR3U1eEtLOTRFQ0ErQjdzcU1tdFo1WnZL?=
 =?utf-8?B?WGNJL3pBNFN0ZWpVbXl1SVVnM0E5Z0hrOTJUdGNBN3k0MjZSZ3ZJcFJZUHFv?=
 =?utf-8?B?MkFkMWtWMHR2STV4UUg4WGpLandScWdhUzJlTFlQOGR0a1JMQ28rVytJTUV5?=
 =?utf-8?B?Mjd4WmhjK09RWXoxeHpyUmZ4WXY4d25WQjdsQm04K1VUSkdsRXNHVytiK1hO?=
 =?utf-8?B?Q1d4SVBXSUpxOVdSUFBkNW9HRUt4eFF2S3JrQm9saXBEQlJFTGNBQW9TNjdO?=
 =?utf-8?B?dm5UeDI2a003YThJclBwNEdsVk14OUd2clk1TkpzQ1QyRUlOb2pWY0pDam5o?=
 =?utf-8?B?VmVFRWhIOEhmU3VLM1YxSUp4cXhob1J3WWtQOU40QXRNcjhSY2x6TUNKR0pD?=
 =?utf-8?B?a2ljSjNveFR6MGk1RTM2cFNkYVVRQ1VsY2tvSm5RRUc1S3pYWEkrMkVOcHNG?=
 =?utf-8?B?SHYrUHdFRCt0RmZ4di9GQUN4UkdMUi8vL1o1c2hZRzZLNTZMWFI0RDEzV0R4?=
 =?utf-8?B?NHF4Z2ptdVFGSVM4T0J1eDRjMTQ1QitTYWFyYStIVHZaYnZxUklWMjRrZnhl?=
 =?utf-8?B?NTF1OGM0c1daRFhTY1VNc0RUcWdYdlpyRU1peC9lVGdMTmUvRjM4WmVwalJi?=
 =?utf-8?B?bUl4dThCWDJjeWhiTTlXbzBKTmpramlYRitYVzE2b1J3V2lWSmpTQ2RwaTJN?=
 =?utf-8?B?RXNZVlBNYlRKNVZGeG9aU050NXBrcHNZeFd6L0ZIaTlheDd1RzhxeGlFWmxE?=
 =?utf-8?B?L1VTbm0rVEF1R0FDb3ozQ3BMMUZUVnJwbUt4LzVDOE0wNVhCcUpGb2x4SUph?=
 =?utf-8?B?RjYxZ3ROVnJBTlN6MFBWZnZweEZrUnMrSW1CRzBERDJXanRzTllvQlhJRE8r?=
 =?utf-8?B?N1lOUkkwdFEzTHl0TTd4RXlUQUo4czBMQXJlZTQweWJKRXZjaGdMWmVXbERD?=
 =?utf-8?B?UXdYRGQxREw0cFNCUUIzcnNKL09nZUxFSkVEYUVoL3FSLzdid21UQT09?=
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d618409-70db-4b38-34e3-08def3945cd7
X-MS-Exchange-CrossTenant-AuthSource: BL1PPF1B62FD55C.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2026 08:26:07.2731
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X+8d0PbfcGS7AsHVu9iIhEsPjmoxRhAjipocIYDQK4y1krv1R8jNhsQ0P6NS0AMhjHxFG7/16pVl+Z1+Ip50yQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SAVPR18MB988314

On 8/6/2026 2:57 PM, Krzysztof Kozlowski wrote:
> 
> No, I did not suggest such patch.
> 
> I asked to make changes to YOUR patch and I replied within a few hours.
> 
> This is just churn and for sure not suggested by me as standalone commit.
> 
> Best regards,
> Krzysztof

Understood. I misunderstood your review comment. You were asking for
the change to be made to the original patch, rather than suggesting
a standalone follow-up patch.

I should not have added the Suggested-by tag to this patch.
Sorry for the incorrect attribution.

Bartosz, would you prefer that I send a v2 without the Suggested-by tag,
or should this follow-up patch be dropped?

Best Regards,
Swark
