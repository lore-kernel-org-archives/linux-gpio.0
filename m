Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013043.outbound.protection.outlook.com [40.107.162.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24CD61A5B8C
	for <linux-gpio@vger.kernel.org>; Fri,  9 Oct 2026 00:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791507160; cv=fail; b=Sq0Vy1Ub8XHGGT8l/2xOLYfDzPNMvjBRs65zPPOWivrMiAdr9QSs0C+1aQ44oGhC/XkKzU2dDXb0x0p++c5FuKgeMZjGMusJBUo/dMVX4YVtZTIVhYVM9lCTvy0lcgP2KB/Dzx83rcPAadzDuOmJVjgUNW4iqdw/eTGgniyo5Gw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791507160; c=relaxed/simple;
	bh=0CEnZlLl6wz37juvu9APsQi+UagpXjVw8QReqJvAJKE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=mrYMVLdFWN576FkC/FG9seeP7pw9r4YkHD+VaoTIkRhDIvnX0Xy6d1R+rdHm9yw3EZCH7QLX3O05auCz0QVvr2HOlwcjjoDBpcihfTh3H9d40Mfic8ErS+s7VY2hbxLF3gsneKsAMzHqgeYrO151Vjfi0tAylU8uhKY2fTXg0JI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=V7amDrP4; arc=fail smtp.client-ip=40.107.162.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="V7amDrP4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r39Gema7qavJL3GH64el/1ODRMJG43Lg4icR2dsT7GPGHsOw2bxzlbBmM8Q+Qon0AwhPtPK3V1USshkiQ8qeHzqfMSdKk1VO6ImeamY8VUFQ6h2vT/W1ySBz0gvIXTeoykDwflwnY7JhBRMXjU97bHc87Je1mglf7q4SN/ySFKafQK8dng4R1FBwONZKU5ebiTSyNiPuPhZgchV1EC2XGS0KB4pUsPhb2Q7eVOLWPKMWiI1lCsnwQqVXupYX8MExKXO/1WQuWMb/JouLK2Kwq1qkduNY7QDqsYkQofy0R9YCbBflFkANM83obw3G38XRaCD0QJqOXGvKNFNGnNrbrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rpE1FTBxADMg5+A7eeiCPf8Vxxtb/yoFlbNtVLk9Udw=;
 b=OtRp75wvsGMfY9mXzRTF394NuzIYULYARbvRe2CLTVNvEbJicr4B3LwbGwKyRHM+CcE1fq+VySXwaWvl0T29uusGncHsadfuMOmgogNtqYj9CV2/ogIav+4oQvirhE+zlCF165lEnS6cPiS2q4/7MOUJsAiPiMPMdNYkNrgI5n2Ffrhy5jOuvTy8k2paq0y2uHZdLFtkuarhWDkPLMIfbNDKgobLkdl0jUgPdy3iB700DHUONpnRHVzi6dkxWee4AL3O+kEpHLJlALA5od+/dK5zf3SN2VZigOD48TDCpFOVKtfMGaK9boMf6s53ficgciFZ9XTewBNitfYPidK0xQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rpE1FTBxADMg5+A7eeiCPf8Vxxtb/yoFlbNtVLk9Udw=;
 b=V7amDrP4EPPpWHNLHk++2zCN3A772vIQk2NhJVLQilWwn/dLW4b1MdpDvUbEucN68PtPcNktyX8tTPacmrQUafpVdp5QOuZDs+28eHrC2LonEcP86XJMXJxew5KIPxPLKoBjn4keDk9w7D5zMmK/PTIhTwfcrlb8hKzISQ9qv/n2QYSirVAy3o4N3owd6AjCh8668GCrkjTaF3XsXTv1oSGR99HbqwIoa2Q9LzwSbk0kfeljvRIbSNRMEEbaBBwpVRN4KodcA8bKamlpwHeuim2ha9lbayWi7ew8niHX/GeVL92QxGDzS7C6DrMscZigXh1lXWh+EDFZsUqeksl2VQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by VI1PR04MB10026.eurprd04.prod.outlook.com (2603:10a6:800:1df::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.16; Fri, 9 Oct
 2026 00:52:35 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0496.010; Fri, 9 Oct 2026
 00:52:35 +0000
Date: Fri, 9 Oct 2026 08:57:07 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: sashiko-reviews@lists.linux.dev, sashiko-bot@kernel.org,
	linux-gpio@vger.kernel.org, imx@lists.linux.dev,
	Frank.Li@kernel.org
Subject: Re: [PATCH v4 01/10] gpio: mxc: fix race between chained IRQ handler
 install and probe completion
Message-ID: <asg749Hk/haiis/i@shlinux89>
References: <20261007-gpio-mxc-cleanup-v4-0-c9f5a8b50df9@nxp.com>
 <20261007-gpio-mxc-cleanup-v4-1-c9f5a8b50df9@nxp.com>
 <sashiko-outbox-162895@kernel.org>
 <CAMRc=MdkYcyCMTz7jf79AiwtYZhTd6riboZ6XV-0+ti_GENQKA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MdkYcyCMTz7jf79AiwtYZhTd6riboZ6XV-0+ti_GENQKA@mail.gmail.com>
X-ClientProxiedBy: MA5PR01CA0122.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1a7::12) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|VI1PR04MB10026:EE_
X-MS-Office365-Filtering-Correlation-Id: e6e02ca0-cb67-4fbe-f06f-08df259f9b84
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|19092799006|23010399003|56012099006|4143699003|5023799004|11063799006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	KnBdQTERjTdVv9IDZxcWFRWpbSvsnTtID0XHguj96O3YFg2d2G9NPpiDXYsZJ7oONMoy/52c69AjbsZraL2TfG5WU2LsDkuEGzkJsN1fttOfwflIUf9Bn2nl5+fzbjjuyeDZ0QayYMfumdckYfotNSMDJBi4yq169VJuuqstX5wWASDrR1+aJsOTRKl4P9tXlO8CgAbQz7VK+sX+edN7RTU4vrwW5L2ChVzcxCJ9lOQgkto01YWMwtS5ZkfjiQfm/9wn9G2IDzE7/2pGXkJQk4eFPJCg0jhpnAEAVECG6H43tJ1+EC1+ZH2U5UNhGSAKmGecsa0RfgsnkoH8Dl1k7wnu7/pcQmF71/8xsxqITNO806mQu6X0o4u8YI2Vj1jTMFkRGEEOGugjCA4vGtXkFNiLe1HNa3/KFivfrcsawe2onGDt2yGSOIsBV4wp2hYJ0ehB5sQTuHzpHzzxzLODiggxXWWQLHue1FukJj940nCtU2SJchUq+JO7Y2B8Bks1AjBXwsNMRnl+MDGx0FAWwMCWgdgILcS+KZVxAxmu7yLgFF+Hw83wa2jqTMltfzc6gfH6lXCnIMzIz6faxZbhiH2zncQv3g3nqzfOatr4IgzluWtNdmLS9XCdSAEXXbRKKN++aGt9FsRba59o/tsidztL5OWodh854CnXzBjqgwg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(19092799006)(23010399003)(56012099006)(4143699003)(5023799004)(11063799006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y0RXWVhxUmZkMW5IMExHMEwzcjN0TUFWZTZ6RlViNnZ4c05mMFU3cVdLRmlt?=
 =?utf-8?B?bXFkOW5RRkhRdVc2enJicmhuRVhjWjJjclh0MEEvYUlyZEpPVG12VElxSVM1?=
 =?utf-8?B?NGNHNGNnVGFGZU1GT2tXWW5ObVpHa2tyWGUrc1B5Sm1ZOXdGSVN3bFgxYTFr?=
 =?utf-8?B?QjM0blFDY0FXYkp3a2EwMXB3bDF4dVZYZmdLeXhMMU9ncUQwZTRkTVdjRkgz?=
 =?utf-8?B?MFRPUHowaXdSVGd0UUo2Nk10UTJLcXlHSk9ySXRwNnc0RnRMOXdlbVRlZDZm?=
 =?utf-8?B?dVkxaW5DK0FXYjhXSUZTVWpyLzMzVnloV0JCQVBWbHlialBIS0JqWVo3U1pZ?=
 =?utf-8?B?bUNRdDczME1hSmRCa1NONTlOZFFZSE90Tm1UbFMralFXRHVqczJyUEFYbzJG?=
 =?utf-8?B?am1jUTNERFBGb2E0MDR1S0FYRkxPN0Fna3BoOHdwdUgxK3JqZEhnVExkSEg3?=
 =?utf-8?B?QlF6QUJjcmd1ZWxhZElnVXRwV2p4VkJBV0tlNHphdjc1bmhyeFVBa2ZCSzJj?=
 =?utf-8?B?U3VCSkFGNll5QTFXR29JdDYwbWZDQU5GU3k1dStJSTJleUVCd3NMSExqNXVO?=
 =?utf-8?B?V0lLTEtMaHVqVUlIdFZYRGNxYUVydlp2ck5xVWtEYlNkNDFNSjVJWGRweUhr?=
 =?utf-8?B?Wmo2WGJkNm9KZVVsa1JHU0h3dlAxTERaNWdhK3NyUWVBKzkxTzFOUU4rbjVB?=
 =?utf-8?B?THZReVVndW43MXp6K2JXTWIxTWFSc2MrdGdsUGhEUDVvRVlzWitrcHpQMHpi?=
 =?utf-8?B?L1RTTlpqN2dIYktVSVNUM3NuOWgrbXhhd2ZteVVJMmRiK3ZKTUliT0ZhSTlZ?=
 =?utf-8?B?T0xGaWp5S1FjbUFRaWFzMWNZZ3JOeVVBWGQzRTNrbUowaW9RdTNJd1Y1MEVL?=
 =?utf-8?B?aEtZQkt6OGh0V25COXFxZzdHRURTcnpTZU1wR1VWZExZR1B6RmRUQUdCeWpu?=
 =?utf-8?B?ZHhwTXQxem9ad3FhTHIwY2Q4NHl6ZWlaY0ZvdVVweDFxWnJobG1sR3VjbkZE?=
 =?utf-8?B?cXVnYlBYYlhBcFk2dnFUK2cyQ0M5TEo0NXhQNzBiKzhTUFU4TldxQlVEdXBR?=
 =?utf-8?B?RTVjN1p1NE5xM0NvZERpQ0UvQWtJMm1SaWNHUFNhSHZUT2h3YkVEYVFHZ1lL?=
 =?utf-8?B?RUhmMWtocUpRUlNOZTZYTG8yRnhldWF1MmtIejBOMFJ4UnUrZENNVXZPeUlE?=
 =?utf-8?B?cVpYa0FJanBBYkc1SWtVbE1seDhNMEw1MUttazNKQTI4TVFxSnYrV1o1UWlU?=
 =?utf-8?B?RkVWTVAxN09qemZISmViSGxQWWJTRzFQbHJxVkxBZDh0dTFHdC9MdGY3aFhJ?=
 =?utf-8?B?MHlMUmdZMVRacldXL2loY24wSHpTZ0NEWlBYbWRjVUFDRW1YR21QaGxEQ0dZ?=
 =?utf-8?B?T3JPMzY2VkZaTll4MXZSa2w5SE5sa3pCa2dlekVoNkI1MjE0dmwzcVpyR3Za?=
 =?utf-8?B?UFh4Q3ludDVzbWRaSGNwQWh3QStFOVJobnBnd0I5bXdnY0hsOTBZR2VhZE16?=
 =?utf-8?B?S0R1NzdSNWdnMXp5cUR6YXVya0xuQXNXeDh1SGF6Q3k5ZWwraStUWjk1Z2Rs?=
 =?utf-8?B?bjlVM3UvUWdwUmNSeWhHSHdZOXI1YUNkZ0FhSitPRXJCZm9kRFNnTDhNeEs4?=
 =?utf-8?B?NlNjdnNWK1I2blhjTStibERoNmZRZkZZaE5IMUVZZS95TDREeUpmRHR5dEJK?=
 =?utf-8?B?YWtVR21LcVR2T3pGVjJFS1JWSVFLZm5HcDROYUFDWG9MT2dUK2Y5d3p4ZFBD?=
 =?utf-8?B?Zk1Gb2IveitpM3FLWGEwMk02bWp0bWtzaVpnYXJhcVhIVlRmR29uQXR5MTJK?=
 =?utf-8?B?Tmx0MzZYVzJtSG9QOW13aVVXNmtTZDUzemJuSEhkTUZqNFhHM2JMS2FvSTJx?=
 =?utf-8?B?YlRhWFZESEtWTEU1elpRaTBqbkM3TzBNNXh2Z1J5SlEwY0RMN2NuZFNuUlY3?=
 =?utf-8?B?dEl0Q0ZvT3NnYXZaakx2ZHlVNDNydjlMekg3cVBIdWpqWTVXTHZsaHJTaVZV?=
 =?utf-8?B?emZIMCs5Y29xME1sODdJUHJ3SEdkcGhjRVg4RlpaQ1JQbHVoN1R0ejhOUWxZ?=
 =?utf-8?B?S0MwcHkxR1lSWDFTTDh1dlRIb29VUTFFdWpQVThJSU5Id0Y5WG90TDdlNE5p?=
 =?utf-8?B?M0xHaFdnb2dmWFhtcE00VWdKQlRZZm9nQVh0OTlyUkIraFoyenJMc1ArTUU3?=
 =?utf-8?B?UmVTYlJJcjR5Q0Fob3ZVczAvTmtCbkErTWlVbkRqR1ZLZmFOOWhFdEljeG5O?=
 =?utf-8?B?cTNnS0xyN3FJck1JMW5nSk50RmhDYzArTlBCOG1JNE0wQzkyUWJHbnlPTVZI?=
 =?utf-8?B?ejY2TjBJY0YybmlzeWlNUSt5Yy9Db3FNQnZ6dTJCTVR1Q0tvWHRJaGprZ1R0?=
 =?utf-8?Q?TI/Lpg27nfmZHRzAyzG/xIBPvjg8EnMjTZrLM?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6e02ca0-cb67-4fbe-f06f-08df259f9b84
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2026 00:52:35.0571
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sVHn3QhiI13auKoWd89xxC+DZN0HpXHgRpe2BpRcFQk8//hkwGqcta5iTiJzou4WyZkAfhMNIRC5yq7IsFW/qEAQQJr8TtJDxX5ilLZbNgOBMcQOwspVQHQm3xnWs8E6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB10026

Hi Bartosz,
On Thu, Oct 08, 2026 at 09:44:40AM +0000, Bartosz Golaszewski wrote:
>On Wed, 7 Oct 2026 12:57:13 +0200, sashiko-bot@kernel.org said:
>> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
>> - [High] gpio: mxc: data race on mxc_gpio_ports list during concurrent probe and shared IRQ
>> --
>>
>> commit bd719d33a26c1f816073bbdb04f543bc3f5ed730
>> Author: Peng Fan <peng.fan@nxp.com>
>>
>> gpio: mxc: fix race between chained IRQ handler install and probe completion
>>
>> mxc_update_irq_chained_handler() is called before the IRQ domain, the
>> generic IRQ chip, and the port list entry are set up. If an interrupt
>> arrives in that window, it leads to a crash or missing port. This commit
>> moves the handler installation after all dependencies are ready.
>>
>>> diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
>>> index 7e2690d92df6f..e05f276a50e8d 100644
>>> --- a/drivers/gpio/gpio-mxc.c
>>> +++ b/drivers/gpio/gpio-mxc.c
>>
>> [ ... ]
>>
>>> @@ -525,6 +523,8 @@ static int mxc_gpio_probe(struct platform_device *pdev)
>>>
>>>  	list_add_tail(&port->node, &mxc_gpio_ports);
>>>
>>
>> [Severity: High]
>> For fsl,imx21-gpio devices, all ports share a single parent IRQ. After the
>> first port probes, the shared chained handler (mx2_gpio_irq_handler)
>> becomes active.
>>
>> When a subsequent port is probed, list_add_tail() mutates the global
>> mxc_gpio_ports list without any spinlocks or RCU primitives.
>>
>
>I think we should switch to list_add_tail_rcu() and list_for_each_entry_rcu()
>first across the driver.

The sashiko report is false alarm per my understanding. imx21 only has
one arm32 uniprocessor. Another CPU does not exist.

Even the single-core IRQ preemption case is safe.
The only real concern on uniprocessor is a hardirq preempting list_add_tail()
mid-update. But list_add_tail() in the kernel uses
WRITE_ONCE(prev->next, new) as the final store, with a compiler barrier
ensuring new->next and new->prev are written first:
// __list_add():
next->prev = new;           // (1) backward link
new->next = next;           // (2) new's forward link → head
new->prev = prev;           // (3) new's backward link → old tail
WRITE_ONCE(prev->next, new); // (4) linearization point — makes new visible
mx2_gpio_irq_handler does forward-only traversal
(list_for_each_entry follows ->next). If the IRQ fires before step 4, the new
entry isn't visible - traversal sees the old list. If it fires after step 4,
new->next already points to head, so traversal terminates correctly.
Both cases are safe.

Thanks,
Peng

>
>Bart
>
