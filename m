Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11022074.outbound.protection.outlook.com [52.101.66.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30E94379982;
	Mon, 27 Jul 2026 09:02:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.74
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785142970; cv=fail; b=fR/6c/hGjBJHtO9+VsB57MvF3E7mmQ17/RIgOdoL/WMjGuW0m2M/CjAfYieZXW/C2KN41rqlHwK3Fx3mYf9sDu7/BrXnID8nolFrn15PP/1c+whErVXJJ7b5qfDkbGiUvQevyKzwn6vPnxCGENUOBILOVFnPGn7K29FxNkH+s1I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785142970; c=relaxed/simple;
	bh=z/0xuDDAtn7Q+XcvSmEBB0r5SsKK4Kjr6ulYnH7ReVE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=XBRqMRD3ZfexzKQNdOvMBjUwNXWRBvYt/E6Y6UKka/8nLSqlH1XcOFfOd/lva+boMZwagJjI91oKYebRUIpSdu5KzmQDSoQ9fKIohhqMc0R6ztGiISCuTkQmij0YNIMNW+Hzu6uCPfadXeglJZ7Og/koplZtPEG0nQ9Xqm1ac7A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b=wAXsLQmn; arc=fail smtp.client-ip=52.101.66.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=genexis.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b="wAXsLQmn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TmXZKB7PIDgdKtsTAi1zZhC8nHoeS/uk6Xo3ND/cH/NDGCQv/F8izOBDhYkkh3GcRIKp2zzCjydKGx/EXIfWqRBlcwM3TMMdYh96AClr6vCBpFTq4MV0iaZpNIKjaAXQD+nNBmQK+CnkxHmsldfBiAx+CAsHPQvyejj2ktkCmQTWAea2TTRxHnsXAR7v6LPqQ4FDfvPT4lnmMLra0QeUXSpE6i3QX0tVIbCwXWjI3sSCBtsEoVHMGv6iC7RrFAnt/6jCJDRY7qHB5gn+XHIhW41WTGZQ0ICEDelt6lH8ly3CPlsrqUlPFFLZ+O4tTaNEIEHSuCeXznxHBKES0tDNBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GGFo2/QBjT+NpbJ5MxKkPxgM1xIDyCvnunjpOvOPibc=;
 b=Uj5sKO7s6PqzBZ8tj+IR7eUdIhLl2Kvz8n92YPKJWQHwTh/UWeMTsaVkaUlK9ZTvXalhoVjHkfxnd+4X+cjUsTFEfttcFy1zOmAY9SHEaBeaKydkG6k14g5EsuQobKy/arElkuVqocAf0sFxcshDvMPdoXV9oACSoz8cKhwKvt85umf5CtSl+tACjEid5LIlZXX7yqGVK8TfF5LrOlDWHyhjQe77cmX4g0FTkYm3IHqtfKm6cr+aemCphf17K5hirK1dnW7nUL4XrzDH57jPEseT/dOJG1aZPrXhIYmLrsjWvWdRAV/TKWm1ckYmpusFpRtsTb/0wM8cTfIC6pGK9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GGFo2/QBjT+NpbJ5MxKkPxgM1xIDyCvnunjpOvOPibc=;
 b=wAXsLQmn6183JmBXsfV5yyzPjdGNmpzzqjw/KNY35lPaaA2DhE6cf163fE2cMh0BgpFaV7vbAdgX1pv80DdVsWbpGKkduUhgSvkyinyNrqyw1Yyy+sZlUh5OUbIIQ15Q13TRbYP4BqXRFYsvm+wp+PyTjtJhnkZwf14LpoD3ZCNjYttbnBEETbDzDAWDTwIUiAJx5fNAwB8lthsEss6oTBS3CP91sHQB15KFcX27TihSJs9MZBJx6tP6VXU7kTfAtvSFxNmSBKqRW7E2fuDzu4fcONkzNTHCn9UiiWWYoyLhvYviTktjI5eUhUW7SZciAlnLnaJ98AAEnMig+vI5LQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by AS8PR08MB6182.eurprd08.prod.outlook.com (2603:10a6:20b:291::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Mon, 27 Jul
 2026 09:02:44 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0245.012; Mon, 27 Jul 2026
 09:02:44 +0000
Message-ID: <d71b9758-b8b8-463e-8da2-a91d1e98759a@iopsys.eu>
Date: Mon, 27 Jul 2026 12:02:41 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 14/34] pinctrl: airoha: fix potential kenel panic in
 IRQ handling code
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
 Christian Marangi <ansuelsmth@gmail.com>,
 Benjamin Larsson <benjamin.larsson@genexis.eu>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Markus Gothe <markus.gothe@genexis.eu>,
 Matheus Sampaio Queiroga <srherobrine20@gmail.com>
References: <20260727074234.3761170-1-mikhail.kshevetskiy@iopsys.eu>
 <20260727074234.3761170-15-mikhail.kshevetskiy@iopsys.eu>
 <amcXSQ4pfRCJjihI@lore-desk>
From: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Content-Language: en-US, ru-RU
In-Reply-To: <amcXSQ4pfRCJjihI@lore-desk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: GV2PEPF000239DE.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:400::16b) To DU2PR08MB10037.eurprd08.prod.outlook.com
 (2603:10a6:10:49a::20)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR08MB10037:EE_|AS8PR08MB6182:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e6a535f-a2fb-47db-df32-08deebbdd229
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|23010399003|1800799024|6133799003|18002099003|22082099003|3023799007|56012099006|4143699003|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	GufnKdYQwqs3gXo8YCHmhc1wDkDA6nURP0c3Wd25LIT555/VO8TbLkDupuG2ScvG8KA7O8JZ25hjcvdhh7uhB1oaVfQ6LeePxEgTZN+xNOsUIjciHDYOeM1BTwotGkymnGyxKJrvfBrYs/13drlOgnjxZABa53rdizKMemQpXl3EMe2j/Q5q2kwUW1ubW7GdfzvVaD2Ex5sAHC8O34KCaGXkBTlUeRyXTEbfezXnJ1GiDsGS+dnCCP4j0RTQUByCwExmpLPsEDH2OAxMq+Tah2Nozm6Qy8s+6gonPZly4KgZs1J1sQuj2rIeKcrt849fNOGGhjbINhyt8kbWJQ+uhjgusUN/lrJRwqDsbiWvKWKa/rL/6vi8TZQL0XVHLtyX0zqiWU+EwoacPdHjER2IAFnq7ji3Y+YjXenUK8opeQxiLvTt4MqcPM7UQqVH+x2BlUH43VbGkOBVhdht2eXheC/2vQ4kUF/XB2phmKiR9BQWzdyEkttxwVBvNv3sL4zP6e9ZXf7e+MERBBEkx5X7Q9iS5/3KMHiTMsiMxGeG2xzw4Dd5cWkB7g6kh4jlHImpgmmTeizdQWnrNmGnXM8Pgep8cGCraRtNf/T+iIkSPSh2ie7u5K0QLOugdX7lKNSb1cxmKnOogqOGQK6QtRhRDNtEIu3vWHp7dzSENbjj0qM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(23010399003)(1800799024)(6133799003)(18002099003)(22082099003)(3023799007)(56012099006)(4143699003)(11063799006)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ampLYU1kUThiMG5oZFQyUE5NcUVUMzNCcEhxeTlZdURTOTdyUDF0Tk8rT2Jk?=
 =?utf-8?B?OEZ0MWR1UVFkRnZsRHIwck1Qc1JyVytZcW1valVjT1U2NTEyendsY25zcW11?=
 =?utf-8?B?akJSNWdka2piQTVBMzloR1VTQjRlaVYwU2RlQWdzdTZvTEVaR3BsZStDaUdr?=
 =?utf-8?B?MTZlbURCNWFYRVUyRlZLWEg1NHdEejQzSXZEZ2diUEhrcDNZeHhzV1JkcFBU?=
 =?utf-8?B?WjZkcjRIT2M4U3VTL0liVkhvR24vcW1zNHd4NkRxRW5OTU9lTVhTMzVjWmFl?=
 =?utf-8?B?WXhONU9ZaGJod3dSTEJTUFBPbjdUQVJzd21JWHpnR1htWWJWeXRsK21SeUto?=
 =?utf-8?B?MlQ0NHdhR0VrbFJDbnBMUXpmZnNPZmdTeW51WDZsZFI1VnJwK1k1aWxESW1w?=
 =?utf-8?B?bGgxZzY5WWQvOEFBWWNHVW5QSG1nY1l2cjlKM0I4aEN3WFpXR3FyejBvMmhL?=
 =?utf-8?B?QnFWMVkvU3duL1JHWFFCZjl4VGpYUkRnWDNNWGxUZWtJZmlOdXd6VVlVWUVk?=
 =?utf-8?B?OUNtOHRlSkhhTlU0bDF3SHFISUhyaTRRKzZsS3duMy8zbEMvOE9xWWg3c3VM?=
 =?utf-8?B?cG51NVppbVlkQjRlT0ZrMDlLNTRPNU9EQUV1T2VmVjJpa2U2RHBRUEgvRncz?=
 =?utf-8?B?OVN2b3Yza0QwQVpkbzl5enlGM0VlZkwwNVV5cUk2ZXpxU3MzUEorLzk5a0l0?=
 =?utf-8?B?a2NRNXdib1JuQmRrMXdkK2t3TnQ0VFduTDhuODRFNENsSzJRM1lWYmIvZW93?=
 =?utf-8?B?NmtQbFR2U1NFTlRKcmJHRVdud2FQRHl5Kzd5N2hXYVY1MEZzck9NcDFUWHk2?=
 =?utf-8?B?RlpuUFE5L0FFc2pyWnd4RzdwT0tXZkNxTnNobGpKZE8zbUxqK0diZGRIS29a?=
 =?utf-8?B?USs3NTNRcVNJOVBoa2FMNWRSMVpFRW16eDJHaUpmVC9yRkZYc3FvbnE0Si9v?=
 =?utf-8?B?OGNnT1lGY1FzS21odGtKYUJWYWdSams0ekhWK0NsdUIrd2ZnU29pUlM0MG9l?=
 =?utf-8?B?d2VMRTNIcXUwckJlRW05MTIwODdRYnd6QlNYOVpaMHdTb2NhRjZCeFZhMXph?=
 =?utf-8?B?a003Z29JSitkZWJ3ekRrd3NtOGsvdXVWTWFrU0hjZENWVTFrcTZKZngzekEx?=
 =?utf-8?B?Y2FMYjdmY2hMcVBkQ1ZLdFdKU3Ztd0FJVkpvUnFkTVpHT2R2ZEZKekdVdXpm?=
 =?utf-8?B?SGxFZTQvbEhDV1Rpb09QK0ZKbWc4WWZxQlhNWWRXZWw5OHh5YUtzZ0lzSklr?=
 =?utf-8?B?TWp6TDlsbGNiQXBSOHg4c1BGanM1UVBhZk9INjd1Tmtya2xCOWorczNLblUr?=
 =?utf-8?B?UlRCSmMrRlkyZkJIcWRGVXYrYVg3VFFwUDhiVmFYMEdWeWRCWVlkdm04YjBs?=
 =?utf-8?B?WGdvMkc5eDlJQWowSEtVRkp2LzMvQ1Ntb3h4TVFsMXVnUkJ0TWhKK2NPQTg0?=
 =?utf-8?B?U1BSZHBoNHg1UXV1VXN1ZXJTaC9NNmR5OGhRdGFvNU1FQUZnaU5jQUs2eCty?=
 =?utf-8?B?QjBsWlNsc2podjdXL3U3YURHYWplOTNvTTc5T09mYThkcTVMd1JNWDNub0Js?=
 =?utf-8?B?K0o2MFp6YW9SL2RSeGQ0bXFwVEdITFFxWkR3TVI0WG15QXJlSlMrd29Idkdl?=
 =?utf-8?B?UktCWkxFWWEzV2NlTzZLTmhYL3VsbUEyd0FBNGZPazgxQUdhNHh0RWNtUG9F?=
 =?utf-8?B?TFU0aUxEck5jc2MzUFpJRnpHekZEQWU3MW1tVVFRRXF5WWY0aHozdWhkeUJS?=
 =?utf-8?B?dG1xb1Z4ZEs4MXdpdHI3SlNXNWkzM3FnY3FvU1VjZzdMOXI4aGlWNFJtTUYx?=
 =?utf-8?B?cjVZZkhmVDNJWXJGeGYvdHdQQkhjeklEcG1WdVRaaUp6ckYyR3BSdzZpNm1k?=
 =?utf-8?B?SEg1aTRzazd3SnlxQ1Rxb1pHL0NtYnhNUDFNMk44aW5DSVFwdEloRWM3bDJ3?=
 =?utf-8?B?WGhoZEdtcTdjNW9SU24rRU5vaFhGeGdYWEpPYmh4SU10bFRXemFPdmtDSWJh?=
 =?utf-8?B?dFUzZlNaRERmakMzMThGb1g4MnRkNzRwbVJVR3VTL1Rhd1BvMFFnZVJUTVAv?=
 =?utf-8?B?cTZWbmpUOUZJTWJzRlZvY0FReFlZd2VmUVJQNm9WTnZJTVZKc2JMcnhZSVA4?=
 =?utf-8?B?bGhpR1Y4bzJDQVhTRThrOXIvVHI4M1ZtTFZxN2MvelB6Y00zZk9vVVlac0pR?=
 =?utf-8?B?bGhmZHdNbk16OW4rNk93d0g4dHlEakE1TzRtZC9IUE51MmpGTWZXZ3ZaVUtV?=
 =?utf-8?B?MEI2aUVDKzJqU1RrVWthc0dlUy9BaHIxSDJybVBTMDVNamw5OEpwTU0xbUd4?=
 =?utf-8?B?ME84WElRcTdNT2lqOUVUN3FYc0hsNzJFa1gvT3BaWU9KNzkzTjlxQkhHYnBi?=
 =?utf-8?Q?m+1XF85s/QnGdsgY=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e6a535f-a2fb-47db-df32-08deebbdd229
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 09:02:44.2156
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yhUSvLy48yif+U/Y6XzsydpxRdi+2Y2JXBRv3khug8YM79mI205bPixxpXek8OgAY2u6qiMZBPddZrLyG9gmbiRxANFPorRamDp5m1dbUkg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6182


On 7/27/26 11:31, Lorenzo Bianconi wrote:
>> airoha_irq_unmask(), airoha_irq_mask(), airoha_irq_type() functions
>> gets invalid pointers when initialize gpiochip and pinctrl variables.
>> Generally this should lead to kernel panic.
>>
>> Details:
>>
>>     gpiochip = irq_data_get_irq_chip_data(data);
>>
>> will initialize gpiochip variable with data->chip_data value. This value
>> initialized inside gpiochip_irq_map() function
>>
>>     static int gpiochip_irq_map(struct irq_domain *d, unsigned int irq,
>> 			        irq_hw_number_t hwirq)
>>     {
>> 	struct gpio_chip *gc = d->host_data;
>>         ...
>> 	irq_set_chip_data(irq, gc);
>> 	...
>>     }
>>
>> Thus gpiochip variable of 'struct airoha_pinctrl_gpiochip *' type will be
>> initialized with a pointer to unrelated variable of 'struct gpio_chip'
>> type.
>>
>> pinctrl pointer derived from the gpiochip variable
>>
>>     pinctrl = container_of(gpiochip, struct airoha_pinctrl, gpiochip);
>>
>> thus it will get wrong value as well.
>>
>> So any access to the data pointed by gpiochip and pinctrl variables is
>> extremelly dangerous.
>>
>> This patch implements correct logic of getting gpiochip and pinctrl
>> pointers.
>>
>> Fixes: 1c8ace2d0725 ("pinctrl: airoha: Add support for EN7581 SoC")
>> Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
>> ---
>>  drivers/pinctrl/airoha/pinctrl-airoha.c | 20 +++++++++-----------
>>  1 file changed, 9 insertions(+), 11 deletions(-)
>>
>> diff --git a/drivers/pinctrl/airoha/pinctrl-airoha.c b/drivers/pinctrl/airoha/pinctrl-airoha.c
>> index faad5d3ada31c..6cf4ed5976fb0 100644
>> --- a/drivers/pinctrl/airoha/pinctrl-airoha.c
>> +++ b/drivers/pinctrl/airoha/pinctrl-airoha.c
>> @@ -2569,18 +2569,17 @@ static int airoha_gpio_direction_output(struct gpio_chip *chip,
>>  /* irq callbacks */
>>  static void airoha_irq_unmask(struct irq_data *data)
>>  {
>> +	struct gpio_chip *gc = irq_data_get_irq_chip_data(data);
>> +	struct airoha_pinctrl *pinctrl = gpiochip_get_data(gc);
>> +	struct airoha_pinctrl_gpiochip *gpiochip = &pinctrl->gpiochip;
>>  	u8 offset = data->hwirq % AIROHA_REG_GPIOCTRL_NUM_PIN;
>>  	u8 index = data->hwirq / AIROHA_REG_GPIOCTRL_NUM_PIN;
>>  	u32 mask = GENMASK(2 * offset + 1, 2 * offset);
>> -	struct airoha_pinctrl_gpiochip *gpiochip;
>> -	struct airoha_pinctrl *pinctrl;
>>  	u32 val = BIT(2 * offset);
>>  
>> -	gpiochip = irq_data_get_irq_chip_data(data);
> I agree the proposed approach is more standard and I am fine with it, but can
> you please provide more details about how it can panic?
>
> gpio_chip is the first element of airoha_pinctrl_gpiochip so it is fine to cast
> irq_data_get_irq_chip_data() return value to airoha_pinctrl_gpiochip, right?

Sorry, you are right, the will be no panic unless structure fields will
be reordered.
I'll fix commit message


>
> Regards,
> Lorenzo
>
>>  	if (WARN_ON_ONCE(data->hwirq >= ARRAY_SIZE(gpiochip->irq_type)))
>>  		return;
>>  
>> -	pinctrl = container_of(gpiochip, struct airoha_pinctrl, gpiochip);
>>  	switch (gpiochip->irq_type[data->hwirq]) {
>>  	case IRQ_TYPE_LEVEL_LOW:
>>  		val = val << 1;
>> @@ -2606,14 +2605,12 @@ static void airoha_irq_unmask(struct irq_data *data)
>>  
>>  static void airoha_irq_mask(struct irq_data *data)
>>  {
>> +	struct gpio_chip *gc = irq_data_get_irq_chip_data(data);
>> +	struct airoha_pinctrl *pinctrl = gpiochip_get_data(gc);
>> +	struct airoha_pinctrl_gpiochip *gpiochip = &pinctrl->gpiochip;
>>  	u8 offset = data->hwirq % AIROHA_REG_GPIOCTRL_NUM_PIN;
>>  	u8 index = data->hwirq / AIROHA_REG_GPIOCTRL_NUM_PIN;
>>  	u32 mask = GENMASK(2 * offset + 1, 2 * offset);
>> -	struct airoha_pinctrl_gpiochip *gpiochip;
>> -	struct airoha_pinctrl *pinctrl;
>> -
>> -	gpiochip = irq_data_get_irq_chip_data(data);
>> -	pinctrl = container_of(gpiochip, struct airoha_pinctrl, gpiochip);
>>  
>>  	regmap_clear_bits(pinctrl->regmap, gpiochip->level[index], mask);
>>  	regmap_clear_bits(pinctrl->regmap, gpiochip->edge[index], mask);
>> @@ -2621,9 +2618,10 @@ static void airoha_irq_mask(struct irq_data *data)
>>  
>>  static int airoha_irq_type(struct irq_data *data, unsigned int type)
>>  {
>> -	struct airoha_pinctrl_gpiochip *gpiochip;
>> +	struct gpio_chip *gc = irq_data_get_irq_chip_data(data);
>> +	struct airoha_pinctrl *pinctrl = gpiochip_get_data(gc);
>> +	struct airoha_pinctrl_gpiochip *gpiochip = &pinctrl->gpiochip;
>>  
>> -	gpiochip = irq_data_get_irq_chip_data(data);
>>  	if (data->hwirq >= ARRAY_SIZE(gpiochip->irq_type))
>>  		return -EINVAL;
>>  
>> -- 
>> 2.53.0
>>
