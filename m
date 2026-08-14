Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11023113.outbound.protection.outlook.com [52.101.83.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71A013AC0F6;
	Fri, 14 Aug 2026 19:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.113
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786736312; cv=fail; b=ZI6APfEDR45HEMkCEL3LImu12j0GmIbTw/99EFl6IONseBY3UsM2ZDNkemSmYOmAFsFh5Bv1rXspN9MuV/HDPXOITNq6yx+kPTD7Tv9ECVTAgHEf/GYS6WyrNNuaCTbtpR/jadcYBtdNilcjbJ4kygve9Ri+44ZsvhXsEd4DyEA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786736312; c=relaxed/simple;
	bh=2bkALBbW7NKkAzrxgplGLj/K6w+N06NjQ9ckP+RYjPA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=otUQsiFXh4AmQOcwt7XWiRBGb2f4AZq2uRkx+JxrIc3ZhZT2BGS3Y89k0L9GzZQq35cpWWgx7y2lxlha7eRvMetkdS7+QcP67/yZU+dWBzITSDXoHJoovxW6AQO85splWeStC9jV8ou5mG5IR17pbQkZgboUGfg4LOFYo7M7B0U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=genexis.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (2048-bit key) header.d=genexis.eu header.i=@genexis.eu header.b=YTHqr8uO; arc=fail smtp.client-ip=52.101.83.113
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=genexis.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=genexis.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=genexis.eu header.i=@genexis.eu header.b="YTHqr8uO"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EG68/ihNWSXyqguboTJjzfvqT4CPTaniUEk/eGuXoA/hvRzUTsVeAcN+gUJJlYHcVjtMgg53CBcYrkUVdsDqDOkUpYz5a+KrLMAF+gqVV2I6ZvQv2ZSnSKDu1yzDJo7oFOIo+g4Q7Ov+Tjhe2frm4UB7sFXxZMCFR5QL8eM5NGGjtGOEy1hi5zYgV2U2tT9dBlIPHEHBZamrIauI5+5W5GZspxdOS9KAVG+EPEy5rj1Vbpsc5WNiEXj+ZA5pO8fh4h5Mlfgi4e15yV1P3n+cl63chFYxup0J28TJtAbGC8IxLHvGlSmYpSlu1wV5KSYReLtAPXYbjNXraPzWK0qUtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A4wSOwCiBgisfVO8uVY2zM54EkqH8lMLymzzjg1vXFs=;
 b=Ub/h+lV+nxZGBP6AYW8CuygiC1bH4sOjKbr0O5hp38m2GjivWiQbe6M5+YaaKtNtoSDtJSXEp2hgUGOsW/d9dAAmORdYLlaM9UfgXIJLTfrpSiPprLVf7IqQa6kHtpw6UWmBRXniKMYPQLxemWVWw0updwPduAX+DGx3W23kidEoci4paZdD3JVaBAOPhQmwKMkwyvXZ4V1sLY2paR6/RuqcMBojqAhQsrPNac9F9+EMN/Q84wLQchQqSIL7M4SS+DBGn1POQBEiMOj+btjWpcdTHJ8JfATC3RvBHEerXp9FcVGYsVTK3sCUCmI8SmsEhhRJv3E9syLhoykXaZwEXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=genexis.eu;
 dkim=pass header.d=genexis.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=genexis.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A4wSOwCiBgisfVO8uVY2zM54EkqH8lMLymzzjg1vXFs=;
 b=YTHqr8uOaALXsaoraPqGNEKoSrukpTvvtGOXgnfylNefWzsMdPP8dcZiOMb1ONemUcyrpHpnoU1c2xppuQCREKMKfOKCz+0/nH6AS7trwCHUmP3KBAmRvgXXeaPwt0pWml7unRVQIIfzYmsaYZOQ5ZZ8s/cLkXYfapQhzrk+UXKNQXSkNd0TM/RIhS/kAcwmfohipxAfPYhUiCoZJV8ciPyc0rioxSgGq25CF4mCTa/c4PE8KuVcF1ljnVcVyWa7PL7olMZsg758lzW5E8K5t7Iuw2PNX6M0f5xH4t7tUTDvGGL+VFniUg2toSTQltM91/VfTQDoHrvEJSFxHX0RJw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=genexis.eu;
Received: from DB9PR08MB6697.eurprd08.prod.outlook.com (2603:10a6:10:2ad::14)
 by AS2PR08MB9811.eurprd08.prod.outlook.com (2603:10a6:20b:604::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.15; Fri, 14 Aug
 2026 19:38:25 +0000
Received: from DB9PR08MB6697.eurprd08.prod.outlook.com
 ([fe80::bdec:3e95:6614:441f]) by DB9PR08MB6697.eurprd08.prod.outlook.com
 ([fe80::bdec:3e95:6614:441f%6]) with mapi id 15.21.0315.014; Fri, 14 Aug 2026
 19:38:25 +0000
Message-ID: <1cd344b3-22a3-43d2-83b6-2eb01b3245d3@genexis.eu>
Date: Fri, 14 Aug 2026 21:38:22 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] pinctrl: airoha: limit GPIO interrupts to
 interrupt-capable pins
To: Ahmed Naseef <naseefkm@gmail.com>, linux-gpio@vger.kernel.org
Cc: Christian Marangi <ansuelsmth@gmail.com>,
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Lorenzo Bianconi <lorenzo@kernel.org>,
 Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>,
 Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <cover.1786262697.git.naseefkm@gmail.com>
 <5a7f97adbca73f2bd01393ce0ca840c2a6f43f76.1786262697.git.naseefkm@gmail.com>
Content-Language: en-US
From: Benjamin Larsson <benjamin.larsson@genexis.eu>
In-Reply-To: <5a7f97adbca73f2bd01393ce0ca840c2a6f43f76.1786262697.git.naseefkm@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: GVZP280CA0010.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:272::9) To DB9PR08MB6697.eurprd08.prod.outlook.com
 (2603:10a6:10:2ad::14)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR08MB6697:EE_|AS2PR08MB9811:EE_
X-MS-Office365-Filtering-Correlation-Id: 0fa40f5c-3046-4a31-7797-08defa3b9ae8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|23010399003|366016|6133799003|56012099006|10067099003|11063799006|22082099003|18002099003|4143699003;
X-Microsoft-Antispam-Message-Info:
	HUX7J51P0Na4nFHVMrggQM31Au54j0q5rS+SQpYjnMseOP0gdljpGFI1j1DZZEsNbUUC+QZ+wjUNNfljiY7AJAXHb2jeU8dB10nDlYdx6b9Wf72C7Wv/4KViG31A/L6X1DUrFhv5fShuClALk+bImC4cjNwlJZ3IIUagTeK10GuWnw+0NX9WIVQe+HrUF+nNDJ9+4TNGnxkTBiTUvTBw9SOm/6AIVWL7SdiiQd1Hkw/sFvwOIw25oexnDdoyAxHLh3o8pT8iJXccrgBqo6+AAeVIjt32DbvNIFp/5fJxPzm6saXgLr42qzxOvBj6CmQiRctq8nhC2MluAbhsZKKBU9ZcclvJ+YH3B32kuOCCN8TPOsz6+AO2X+iPyoNvXRfc0zfMFRHD21dEBhCkEqzDxA1haCT7amoMqwrtIpb0QHxyJ29i+Nv+pYycgWrjcHL7ifvsXhHbxoYJrazEuZjF9BIyEax3ryKC5ltoFQziTydesz7NPhmuZa8Q9n/HEzumdkzczN0eHYK4nzc7xNp4cr+udo1jcD2wA5mOwj0PTqYsrf/b4EFQ/d1bkZActMq8VFOD/5heolUv42TnHNjGxvxM3Pij+WuU1JcU5SM+hzuL7KAdj6F4VxDDyj0n9avlaAR9lP4ZfaxpGi/LEdUEK0nV8fUoPkXLpyReD5PL7kI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6697.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(23010399003)(366016)(6133799003)(56012099006)(10067099003)(11063799006)(22082099003)(18002099003)(4143699003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MFB1SVBYSGJrRUNPTWMwVCtMRDVKeHZ1RkxjSzkwR2ltSFduZHpkQkxLK0Qv?=
 =?utf-8?B?a0ZEbE40Tk1TWldkVVc4UzRrWTVNT0JCWXk4YzRMM2hnK2llaXBxMFpGOG9Y?=
 =?utf-8?B?ZHkvK3ptNE5TSXAxeXNQRnhzandGVmRSZ2VjVWZhZWFROGt4WCtkSDdrdkNF?=
 =?utf-8?B?TWpQYjBFU3V0NlkxU2lBT0lsWWVha1BNWjRCZTAwdVBSM3c0ejRyTldjODNE?=
 =?utf-8?B?TWgrOTVxbUVscFgzTndYenFrOHl3L1hiU2xlTTdnZHl5ejVRZDR3anVNRngr?=
 =?utf-8?B?cVZnVE1UMS91bktPVDhTcFRFS2NsQnVKbFowMDl2MmJIdlhaVVdnd3A0UVNh?=
 =?utf-8?B?N0diRWY5UGFXZ2dsWDBWVG0vdG5lcTAybmNDNGNDY2FiMG01VEQ1V1VVRzZY?=
 =?utf-8?B?ekxNVEsrMjF3ZU5DOURtbnYwWWFJK3oxc3ovNS96aWVTM2ZuQ210Vjg3UTI3?=
 =?utf-8?B?cnArQlozS2g3WWQrMjlyTDJud21VaTcrREV3R3RhZ005dGI1SnNkeHhWQisy?=
 =?utf-8?B?NXlXVlAzT3kxdUsxbU0zOEZiaFNBZ1RpQjU4WmFpZUo4eDZ2STR1UG1ocEhj?=
 =?utf-8?B?eitpTkcrQWdVUkNCWS9wd2hOQ09TckNOa2cvazBMQm5iUzcxbG8vemtLWFFm?=
 =?utf-8?B?YUxMdWNoZnpUVDlZc0RDcFpaaTNydll6VEwxVm1UM3NZVUJtamc2Wk5ERGJi?=
 =?utf-8?B?VnBSb1hhNGcyUVlTWnVGRG1jRnZUQzNWRTBDOW1NblBSM1JYUDJ2NUhEV3Zy?=
 =?utf-8?B?UFdOQnZlTm1PSFJBZWNTRG8rc3dGazhjdjhUVlhVdWlmOGNSNUs4dkRPaCtY?=
 =?utf-8?B?WkRxVndEbFdsUmZhZXEveUZPTzljUEtsbVpaU3RjV1V5VEdkeUtPM2dKdi9a?=
 =?utf-8?B?M3o4dk02c0QyYTc5cjcvR3BrSVlYWml5TWRDYzNzb2lDMGZvWFgvN0RGTUFk?=
 =?utf-8?B?c0RvUEhKV21xU2dKS0tjbUJuUGxVVUExV2dhSUVIMHBRY2dHY1lvL1FYLzVL?=
 =?utf-8?B?clRwQnp6MytnbUhqSTN2WmtGZWpXTlBtYlhkaDgxNTRrN2V0ZDZWUThPekt5?=
 =?utf-8?B?SERQYzc4YTZzempCUjVZdXpxOHNxeXdlWk5BMXVzSWRscmx5R0VEWmQ4U0dH?=
 =?utf-8?B?Tmx5Ti9Hb0Q3ckZnYXRUZTlHWXo5SGJIN1gzbGM5di9HK0tWaTZJMFdnTmtL?=
 =?utf-8?B?bUJwMlJqcEEzeGtTVGY3aFpJYWNPZzBOREZzWHJQWXFpV25waFFoWk5KSE04?=
 =?utf-8?B?TC9pSk51UytqS0NRNzBqcDZYNHV6dzZNTnB6OElRMXZXMXRMYTI2dEVqUVJF?=
 =?utf-8?B?RC8vVlM0OHBDSmJlUTB5UDRFcmVrL21tT1o3ajB6QUpZWFFuMGkyMEc1bGxV?=
 =?utf-8?B?c2hjczFGUW9QZmlyN0pEZUNHcGxZbFUzRDBiTnpHb0RGUmFYbS9mWEZiWE52?=
 =?utf-8?B?WnJwZ0NzdG05TkZnTjM3WSs4V3hxckVUdlpwcjVzb0VIWWdRMWxGUXFMQ3VE?=
 =?utf-8?B?a3ViS2ZHMWpNL2RTZUJZeXZPR2RqdUFJM2kzZ1BEZ0RLVnpLVzdMY1NXZ1c5?=
 =?utf-8?B?Z0hGM1hpVUJESmUrWk1KYllWamlTbGVQQ3RLNldsc0JBMHVsb0J3Y2VJcWl4?=
 =?utf-8?B?VS8xUXlnQUd6d0JxQnMxRVU5RldCTUZ6dUgrdHgrUXNBVjdCWkl2SWpmMVRp?=
 =?utf-8?B?NXgzTjM0SEJkK0t0UEFzOVladHVDRWhzRFpFQWhlUklOTEllYW5jRlVQVGdl?=
 =?utf-8?B?Y2F5NGVIU3ppbnNaRkZQd3dOU1FCU2VnMlNXdnNGKzd1M2gxR21QeDdMcXBn?=
 =?utf-8?B?ekhEMFRjWU8zM0o2ODFNcGdEMS83OHVWNDBuSndCenpWODRDM21HZlN1T2t0?=
 =?utf-8?B?alJKZEptcE0xcnpVdmZyWks2YnJGSlIzK3oyTS9KYmo0em44UDdOdTcvOFhD?=
 =?utf-8?B?K3BjWUNmNTBzcUNnQkFmdFYzRWhHamE2UmxNYi9DUDRCcENQRnZObjloOEJa?=
 =?utf-8?B?OEdoTzl1YW84RWdkN1p6ekFxSEN6WWt1VUZTbFZrVDhPMGVXSnpncW85S1Jp?=
 =?utf-8?B?ZEVaTWVFRlViY2hHZlF3d1c0Yy9oVGc1SWFldDh3dDR6d3F1UWloZHFWZFJP?=
 =?utf-8?B?WlBnenowSzFQOGlIS21NMGtFN0MzV2ladUdXcVlBQk5aU29oS2pnNnBsQzFp?=
 =?utf-8?B?bElVSmVaaVVZV2JvUWNBcWFXeDR0eStubWE5RHpmeU90T0NZK1BtZGRjcW1n?=
 =?utf-8?B?NHA0QTNFYU55SFBLWWlNYzR5R2swM1dDK2JlVU03bXBNOTg0SFNzMTlZWWxI?=
 =?utf-8?B?OElKY1l5SUhNanNNY1UzMXRFUHdwbGttZzlRYzRzT0FQY0hhYUR4NFk3UnJ1?=
 =?utf-8?Q?u+a5wf9KV1iwS/+k=3D?=
X-OriginatorOrg: genexis.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fa40f5c-3046-4a31-7797-08defa3b9ae8
X-MS-Exchange-CrossTenant-AuthSource: DB9PR08MB6697.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2026 19:38:25.0407
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eWYi44CztijwJ1GlxYTisIeIJb46r8T1mQt8POuns0RrKEJmN0lzIe+bs9aKBlqx60RSXUTMJeVNUEZht8F3LmIdtq3uNs6eWfdhWvM2uqk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9811

Hi.

On 09/08/2026 10:04, Ahmed Naseef wrote:
> The driver assumes that every one of the AIROHA_NUM_PINS GPIOs can raise
> an interrupt. That holds for the SoCs supported so far, but not for every
> member of the family: on EN7528 only GPIO0-GPIO15 are wired to the
> interrupt controller.
> 
> Without this the driver hands out interrupts for GPIOs that can never
> fire, and the interrupt handler reads status registers that are not
> backed by any pin.
> 
> Add a num_irq_pins field to the per-SoC match data and use it to bound
> the interrupt callbacks and to size the loop in the interrupt handler.
> Feed it to gpiolib through gpio_irq_chip::init_valid_mask as well, so
> that gpiod_to_irq() fails for a pin that cannot be an interrupt source
> instead of deferring the failure to request_irq().
> 
> Signed-off-by: Ahmed Naseef <naseefkm@gmail.com>
> ---
>   drivers/pinctrl/airoha/airoha-common.h  |  3 +++
>   drivers/pinctrl/airoha/pinctrl-airoha.c | 33 +++++++++++++++++++++----
>   drivers/pinctrl/airoha/pinctrl-an7563.c |  1 +
>   drivers/pinctrl/airoha/pinctrl-an7581.c |  1 +
>   drivers/pinctrl/airoha/pinctrl-an7583.c |  1 +
>   drivers/pinctrl/airoha/pinctrl-en7523.c |  1 +
>   6 files changed, 35 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/pinctrl/airoha/airoha-common.h b/drivers/pinctrl/airoha/airoha-common.h
> index c1acbfb7426e..16f7abcdfb83 100644
> --- a/drivers/pinctrl/airoha/airoha-common.h
> +++ b/drivers/pinctrl/airoha/airoha-common.h
> @@ -127,6 +127,7 @@ struct airoha_pinctrl {
>   
>   	struct gpio_chip gpiochip;
>   	struct airoha_gpiochip_regs *gpio_regs;
> +	unsigned int num_irq_pins;
>   };
>   
>   struct airoha_pinctrl_match_data {
> @@ -140,6 +141,8 @@ struct airoha_pinctrl_match_data {
>   	const struct airoha_pinctrl_func *funcs;
>   	const unsigned int num_funcs;
>   	const struct airoha_pinctrl_confs_info confs_info[AIROHA_PINCTRL_CONFS_MAX];
> +	/* number of GPIOs wired to the interrupt controller */
> +	const unsigned int num_irq_pins;
>   };
>   
>   int airoha_pinctrl_probe(struct platform_device *pdev);
> diff --git a/drivers/pinctrl/airoha/pinctrl-airoha.c b/drivers/pinctrl/airoha/pinctrl-airoha.c
> index f505a3f69c5d..52a768c859b7 100644
> --- a/drivers/pinctrl/airoha/pinctrl-airoha.c
> +++ b/drivers/pinctrl/airoha/pinctrl-airoha.c
> @@ -213,7 +213,7 @@ static void airoha_irq_unmask(struct irq_data *data)
>   	u32 mask = GENMASK(2 * offset + 1, 2 * offset);
>   	u32 val = BIT(2 * offset);
>   
> -	if (WARN_ON_ONCE(data->hwirq >= AIROHA_NUM_PINS))
> +	if (WARN_ON_ONCE(data->hwirq >= pinctrl->num_irq_pins))
>   		return;
>   
>   	gpiochip_enable_irq(gc, irqd_to_hwirq(data));
> @@ -249,7 +249,7 @@ static void airoha_irq_mask(struct irq_data *data)
>   	u8 index = data->hwirq / AIROHA_REG_GPIOCTRL_NUM_PIN;
>   	u32 mask = GENMASK(2 * offset + 1, 2 * offset);
>   
> -	if (data->hwirq >= AIROHA_NUM_PINS)
> +	if (data->hwirq >= pinctrl->num_irq_pins)
>   		return;
>   
>   	regmap_clear_bits(pinctrl->regmap, gpio_regs->level[index], mask);
> @@ -265,7 +265,7 @@ static void airoha_irq_ack(struct irq_data *data)
>   	u8 offset = data->hwirq % AIROHA_PIN_BANK_SIZE;
>   	u8 index = data->hwirq / AIROHA_PIN_BANK_SIZE;
>   
> -	if (data->hwirq >= AIROHA_NUM_PINS)
> +	if (data->hwirq >= pinctrl->num_irq_pins)
>   		return;
>   
>   	regmap_write(pinctrl->regmap, gpio_regs->status[index], BIT(offset));
> @@ -273,7 +273,10 @@ static void airoha_irq_ack(struct irq_data *data)
>   
>   static int airoha_irq_type(struct irq_data *data, unsigned int type)
>   {
> -	if (data->hwirq >= AIROHA_NUM_PINS)
> +	struct gpio_chip *gc = irq_data_get_irq_chip_data(data);
> +	struct airoha_pinctrl *pinctrl = gpiochip_get_data(gc);
> +
> +	if (data->hwirq >= pinctrl->num_irq_pins)
>   		return -EINVAL;
>   
>   	if (type == IRQ_TYPE_NONE) {
> @@ -304,9 +307,11 @@ static irqreturn_t airoha_irq_handler(int irq, void *data)
>   {
>   	struct airoha_pinctrl *pinctrl = data;
>   	bool handled = false;
> +	unsigned int nbanks;
>   	int i;
>   
> -	for (i = 0; i < ARRAY_SIZE(irq_status_regs); i++) {
> +	nbanks = DIV_ROUND_UP(pinctrl->num_irq_pins, AIROHA_PIN_BANK_SIZE);
> +	for (i = 0; i < nbanks; i++) {
>   		struct gpio_irq_chip *girq = &pinctrl->gpiochip.irq;
>   		u32 regmap;
>   		unsigned long status;
> @@ -340,6 +345,22 @@ static const struct irq_chip airoha_gpio_irq_chip = {
>   	GPIOCHIP_IRQ_RESOURCE_HELPERS,
>   };
>   
> +/*
> + * Mark the GPIOs that are not wired to the interrupt controller as not
> + * valid, so that gpiod_to_irq() fails for them with -ENXIO instead of
> + * handing out an interrupt that can never fire.
> + */
> +static void airoha_gpio_init_valid_mask(struct gpio_chip *gc,
> +					unsigned long *valid_mask,
> +					unsigned int ngpios)
> +{
> +	struct airoha_pinctrl *pinctrl = gpiochip_get_data(gc);
> +	unsigned int num_irq_pins = pinctrl->num_irq_pins;
> +
> +	if (num_irq_pins < ngpios)
> +		bitmap_clear(valid_mask, num_irq_pins, ngpios - num_irq_pins);
> +}

I'm not sure if there is something that gives a sane error log if this 
trigger. Maybe make it explicit?

Either way:
Reviewed-by: Benjamin Larsson <benjamin.larsson@genexis.eu>

> +
>   static int airoha_pinctrl_add_gpiochip(struct airoha_pinctrl *pinctrl,
>   					struct platform_device *pdev)
>   {
> @@ -362,6 +383,7 @@ static int airoha_pinctrl_add_gpiochip(struct airoha_pinctrl *pinctrl,
>   
>   	girq->default_type = IRQ_TYPE_NONE;
>   	girq->handler = handle_bad_irq;
> +	girq->init_valid_mask = airoha_gpio_init_valid_mask;
>   	gpio_irq_chip_set_chip(girq, &airoha_gpio_irq_chip);
>   
>   	irq = platform_get_irq(pdev, 0);
> @@ -848,6 +870,7 @@ int airoha_pinctrl_probe(struct platform_device *pdev)
>   	pinctrl->grps = data->grps;
>   	pinctrl->funcs = data->funcs;
>   	pinctrl->confs_info = data->confs_info;
> +	pinctrl->num_irq_pins = data->num_irq_pins;
>   
>   	err = pinctrl_enable(pinctrl->ctrl);
>   	if (err)
> diff --git a/drivers/pinctrl/airoha/pinctrl-an7563.c b/drivers/pinctrl/airoha/pinctrl-an7563.c
> index 40cbbe90cc46..f011c6c9ccce 100644
> --- a/drivers/pinctrl/airoha/pinctrl-an7563.c
> +++ b/drivers/pinctrl/airoha/pinctrl-an7563.c
> @@ -1069,6 +1069,7 @@ static const struct airoha_pinctrl_match_data pinctrl_match_data = {
>   	.num_grps = ARRAY_SIZE(pinctrl_groups),
>   	.funcs = pinctrl_funcs,
>   	.num_funcs = ARRAY_SIZE(pinctrl_funcs),
> +	.num_irq_pins = AIROHA_NUM_PINS,
>   	.confs_info = {
>   		[AIROHA_PINCTRL_CONFS_PULLUP] = {
>   			.confs = pinctrl_pullup_conf,
> diff --git a/drivers/pinctrl/airoha/pinctrl-an7581.c b/drivers/pinctrl/airoha/pinctrl-an7581.c
> index 2fcf88106e11..bfb777594811 100644
> --- a/drivers/pinctrl/airoha/pinctrl-an7581.c
> +++ b/drivers/pinctrl/airoha/pinctrl-an7581.c
> @@ -1441,6 +1441,7 @@ static const struct airoha_pinctrl_match_data pinctrl_match_data = {
>   	.num_grps = ARRAY_SIZE(pinctrl_groups),
>   	.funcs = pinctrl_funcs,
>   	.num_funcs = ARRAY_SIZE(pinctrl_funcs),
> +	.num_irq_pins = AIROHA_NUM_PINS,
>   	.confs_info = {
>   		[AIROHA_PINCTRL_CONFS_PULLUP] = {
>   			.confs = pinctrl_pullup_conf,
> diff --git a/drivers/pinctrl/airoha/pinctrl-an7583.c b/drivers/pinctrl/airoha/pinctrl-an7583.c
> index 2c3a75c35915..1cd0f442ddc1 100644
> --- a/drivers/pinctrl/airoha/pinctrl-an7583.c
> +++ b/drivers/pinctrl/airoha/pinctrl-an7583.c
> @@ -1471,6 +1471,7 @@ static const struct airoha_pinctrl_match_data pinctrl_match_data = {
>   	.num_grps = ARRAY_SIZE(pinctrl_groups),
>   	.funcs = pinctrl_funcs,
>   	.num_funcs = ARRAY_SIZE(pinctrl_funcs),
> +	.num_irq_pins = AIROHA_NUM_PINS,
>   	.confs_info = {
>   		[AIROHA_PINCTRL_CONFS_PULLUP] = {
>   			.confs = pinctrl_pullup_conf,
> diff --git a/drivers/pinctrl/airoha/pinctrl-en7523.c b/drivers/pinctrl/airoha/pinctrl-en7523.c
> index 5aa39bacf460..b0c5e60f0aeb 100644
> --- a/drivers/pinctrl/airoha/pinctrl-en7523.c
> +++ b/drivers/pinctrl/airoha/pinctrl-en7523.c
> @@ -1113,6 +1113,7 @@ static const struct airoha_pinctrl_match_data pinctrl_match_data = {
>   	.num_grps = ARRAY_SIZE(pinctrl_groups),
>   	.funcs = pinctrl_funcs,
>   	.num_funcs = ARRAY_SIZE(pinctrl_funcs),
> +	.num_irq_pins = AIROHA_NUM_PINS,
>   	.confs_info = {
>   		[AIROHA_PINCTRL_CONFS_PULLUP] = {
>   			.confs = pinctrl_pullup_conf,

