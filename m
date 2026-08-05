Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11023119.outbound.protection.outlook.com [40.93.196.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B542841D4D6;
	Wed,  5 Aug 2026 10:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.119
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785925751; cv=fail; b=lFLBa1FgkmzW2LQynLkZ0y6bE5LO/lhhOZLIoPqJ5YUl06sW1zpeT5Y1CxeX9ZseDX2pdjpgSDIX0Xawc33noLu1YysE2BlIyuTYqv98FLTRNYq8c+RtR5QgwVBx4wvXwSVwJnQDbzjDdog0kUjkER3C7BiSowXZ48sajk1PbxU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785925751; c=relaxed/simple;
	bh=z2RBgMV567W3tgJTGzWWmb1P1oLSn17uQ2Kzysz30+E=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=YVXhUQ6R4TI2bj1/rMspSB2RZ+YBA+37iX6WYOE0tcUYGPAL/BzzgJfD35r3DT+iJOvhz2fr6tuTGHOhggDnbLrnTv9P203uQUD47oGRaDIclBFX7rCYG10ORYv+J0YJ+c9NubfpSLVqzO7B9Zc39tG5XgVFcWeR9IyLR7KgSXc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com; spf=pass smtp.mailfrom=axiado.com; dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b=EYQysU02; arc=fail smtp.client-ip=40.93.196.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axiado.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b="EYQysU02"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WVezJh0zLqSvBFzvDWhH7KL1eA2taLgYfLzdps+qrWxrzaqMd2OsG/sJuff+y18iJtoLK+PXwcoAcpDk/UHqxKtGOmi03fJp+yw/wbMne70T1ew5fZ1qkaLuVID26PZPKJqavIywpVb687mXDzcIJVON1XqurVhVHfUpmehwkeW+adJP/tmS00P6bBoZTKlYVh4TGfNG1F+LDOKlDmaAJjQgFuvs1U+GQs8Yfnr2RZaIYeEWjQDu4YEWkfjiQ6mDBni8Og09Edf4/kDNwI1TKEHPHCz2Y0eRT1DY01HqWPqYRMHCFHZDWsobFeGLRRgxtylkijhSp2av2pFWR6guhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T8xNI+L76ltQrcbXQQKeQqX10hTZZ7hAQdexNU7eyho=;
 b=a1+r04PG/e5gTKp4JM8BJML/QNlirP2/BF6kci9u6StwcZyiAN/ck7rOqnNKOYHbNSMIA9DoFw9T37tG0wj60wzGqtpsxtfua4MgEG1h0DByayVeSNxEzSDiFCSKIQ4yZgmNyE3ZSYS0+7ZdQjRJT+AfGAOGRpHEYVJBpkJzgpzSMuFjqZOdSZawXlAMiJXs8Jb8GtDRU7ZL2jluwiOGTG9B6fm5AOdEkMhDSrBMD1gcxTXhhZ+eXU9sattdL+0hxEOuIhHebY43P4iEPf+Hh0uTWtAdXvC9q3pErTpgIZcN3GoGeegzd9lwGC1h4gLJ90I2QcK5KR4XDhMM1zj3kA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axiado.com; dmarc=pass action=none header.from=axiado.com;
 dkim=pass header.d=axiado.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T8xNI+L76ltQrcbXQQKeQqX10hTZZ7hAQdexNU7eyho=;
 b=EYQysU02+8Sgcfc214aDTn+aMwYUCsLY361UXWwBkU11dJPEqlDxaXITheM9sb2b3M35JkkuJPk77VeV2E+QMXsMwXhUMJF9zG8j42S25nu+1LRPVg9czNLTRNpWyHfEFAnR/Bj4Qf8cci5mQNOIMsnR0IV4okf7ilW5RzT+3ixLqXkr8GcOC2HjWjp8lhZ3/JgkYprO6lH77ZiU/UtvgIlJoINyLZQyOYd1aeQdjgpSEFpOHaStF2X2Sg7qgPhWNNcxEslh99//bl+va6MwnC2VPZ/xRRpOBBFzVv95LWVTL0uC5VHQ07XhTW/COEzI+OQYv63+MnUZrmQAFX1atA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received: from DM4PR18MB4144.namprd18.prod.outlook.com (2603:10b6:5:38b::8) by
 SAWPR18MB988335.namprd18.prod.outlook.com (2603:10b6:806:4e0::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.17; Wed, 5 Aug
 2026 10:29:07 +0000
Received: from DM4PR18MB4144.namprd18.prod.outlook.com
 ([fe80::cb97:ca8a:e55a:b11]) by DM4PR18MB4144.namprd18.prod.outlook.com
 ([fe80::cb97:ca8a:e55a:b11%6]) with mapi id 15.21.0292.015; Wed, 5 Aug 2026
 10:29:07 +0000
Message-ID: <991d11ff-acf5-4a73-8c79-036156dc4821@axiado.com>
Date: Wed, 5 Aug 2026 12:29:03 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] gpio: axiado: add SGPIO controller support
To: Linus Walleij <linusw@kernel.org>
Cc: Tzu-Hao Wei <twei@axiado.com>, Swark Yang <syang@axiado.com>,
 Prasad Bolisetty <pbolisetty@axiado.com>,
 Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Harshit Shah <hshah@axiado.com>,
 SriNavmani A <srinavmani@axiado.com>, Karthikeyan Mitran
 <kmitran@axiado.com>, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260729-axiado-ax3000-sgpio-controller-v2-0-976f4ed11438@axiado.com>
 <20260729-axiado-ax3000-sgpio-controller-v2-2-976f4ed11438@axiado.com>
 <CAD++jLnf5g-ZWKNO=zE6Pv6e=v-zTEDWWpWUq+xayjh6Vrzq7Q@mail.gmail.com>
Content-Language: en-GB
From: Petar Stepanovic <pstepanovic@axiado.com>
In-Reply-To: <CAD++jLnf5g-ZWKNO=zE6Pv6e=v-zTEDWWpWUq+xayjh6Vrzq7Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0179.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9f::15) To DM4PR18MB4144.namprd18.prod.outlook.com
 (2603:10b6:5:38b::8)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR18MB4144:EE_|SAWPR18MB988335:EE_
X-MS-Office365-Filtering-Correlation-Id: e0cf1b65-7f6e-4404-f45e-08def2dc616f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|6133799003|22082099003|18002099003|3023799007|5023799004|56012099006|10067099003|4143699003;
X-Microsoft-Antispam-Message-Info:
	JI6nf6M0V2V5KM7sg2psOSLUwY9VeXt3Dq32EKprIZax5+KV5+h5EaeAjP010gI7PQ1J5GBxP0lVy1WTlHDuLS1M0BdLCe0ncQA7c22kP1ve12cWsE5fSGRMHlvckzf80569FMAFq39PcbterZzCO6nUbk+DSYirjz8RXlWor8+gEbg+qnITUwAUoPOZ67gjHqcfxzZkB2VIX0JjMc9znfpymVmg1ipwNxgcqBjPnHBbtj7K09dTafZGt/yQWUnYHUxPxvtp+Eyd9ID2e3+c4uSnakgvJuAffUQ/mk80drDS4ZFPgsLFdUh4AvaEGVfgsYBURe0X2b/qMh54bikuMDVXflSnPup67Ary/1YYIHN56Noi5Kd8tBrNY5zzIJhLFfKsvlgdsaOjJPR1/wzWwkvcmaGvIR9TeecsC6s1gUZiR7VSx352UdQ9qbGDqcjHolVIc2VHektDMPkqB1/ED3MZhKiOvFifzYu7E8B+0u2exgmxETfYYOYfzgPn1Rq1QbsMuiNH5VpVq9cXWuQ90bh9voelKXblxKp3IILP3LnvHruLhgLJJQerWS780p3lRhjOPX/Y82LRMquGHx+YtWxxWxZs7PJjqG9U0rPbR8/SywedpOLYaGoeM5NFn9lwJTju7ffwKZ7ePSYnZdpI8++SQbc1hE1czMmVjENxZmk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR18MB4144.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(6133799003)(22082099003)(18002099003)(3023799007)(5023799004)(56012099006)(10067099003)(4143699003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VnNUdEJpQTEzU2M3RzRUVEhDYjBuMzFtUXFxYW1JQThQWUlFcVBKSW91QVlF?=
 =?utf-8?B?dGQxU0NlUUFNc1NhWFBoNStyYUdsNGxjQlhYc1M2RXNxVUg3WXdJN0NKT0dn?=
 =?utf-8?B?ako2c0RaZXhWVFNGUUdLRHpaUzBvV3owcHFzMHRnNUpISW4rUllGd0tYNWhB?=
 =?utf-8?B?dUU0THNRQ3lpK2I1Y2VrOHNlMzI1NDVZT2svSFJpTWRMNkdWY01TZE8rUHlD?=
 =?utf-8?B?Sk1ScTRRTkdNbmFkZDAzSVI0ZmpXYW8zTDkvc3Q5c0JxbFVvUmVUMlVXNkM5?=
 =?utf-8?B?YUo0R3pJL1hXSWk2biszazIyUFlBNnh3Q0dHZWdXUG9ZYmNCOWlyZWRXSmRN?=
 =?utf-8?B?Y1haMVViUkJkeGtMbXdnNW5OS1FNR0dybk1kcnVXMSs2UjdMTk03SnlWVXVj?=
 =?utf-8?B?YWlteVByOWpEczhSdWJVbzhNRTcvMzVCcHFDakF1MG5Mam8xaGJsdG1XZjJL?=
 =?utf-8?B?RGtnd0hNZGN5YmM0cUE1em9JanlEdUpYRmNYYlhxdVBBODlaRWIvRGZWbW9H?=
 =?utf-8?B?cjkyNnZUdVBmU0IwanNoZWJGa3hMVVRFUzdPSUtIRjM3YWNpc21mZDBMekNE?=
 =?utf-8?B?d29QNHl0akJuSVYxZ2g1bHdyU2EyVXBhejZNVG5jL2FYVTQ4M2FSTUswbnJy?=
 =?utf-8?B?T2J3ZTIyUGhCcUhpdzRMenNTeTNvSVpHRG8wUmlkRHhjRHZXL2phZlFPR2Zq?=
 =?utf-8?B?YUFEbW4vM3BWdzVnRlZpaVBqeHhwTmVsVjJIbStxaVlJbWVpMmVTc0JLQ0JY?=
 =?utf-8?B?SFB0d2c1d2lPeXhUTDVDMHdKVjd1aFArSkFwdVNZOGFINUVzdHBXdlkrbzlX?=
 =?utf-8?B?YVdGbEJRcXNWL3k0SnV5eUZIdHlDQ2VvTmRsU2JrcVBOZTZ0WmhLVjNUZDRN?=
 =?utf-8?B?Qnh4YytGYnhMWGtaTkR5YjlsbzBCd1k0d1lhV0ovdmFQN1JLZkdvaERCN2Ix?=
 =?utf-8?B?NlF5WEtYeC81YWtJL21nVzNKV0RQYlRaR213WjVZQ2tqYWxhQ0ZSWnNuVEhJ?=
 =?utf-8?B?QzFNTkhwRnUzMHBIcTZ6ZFExMC95WXRuajk5RmQ3R0lrTkFZSjVkTWRKS3FT?=
 =?utf-8?B?Uzg0emtZSGxXRERaOThRR0FOaGh5Sms5d3dTeUVRNSt5UTZOeEJmK3hELzVS?=
 =?utf-8?B?Ym0yMW1DdFdWNzRaQWc1OG44ZFA0TlRobU5jWWp1SDBLUFhMdWh5UTAvcjNl?=
 =?utf-8?B?NVJFcTBaMjBTTlpqOHZjcnlwQUR6V3BwTkVmdXFCVzFtazVCUUtKU1hFRFB0?=
 =?utf-8?B?ZFF2SzFtRnhQYUV6aUFvNTVVbmR5emFkYXcwSUdYZE8yOURWczhSTTZoL0wy?=
 =?utf-8?B?TGJLOFNZMU40UkNOUWpIdXlIU3ErM0h2ZUZYMVNuMWYrMVZkRk9WOFBDVS9C?=
 =?utf-8?B?RmZDdkF1OE01MnBrUjRsNUZicnk3MGg2ZVM5Rk0vbjhuV0dQdHJGMzlaQmtR?=
 =?utf-8?B?bWY2emRpTUVHTTdWTHdEeEt2ZHBlcmw3UStnUndCaWZTdHhyYTFMa2d1YXk4?=
 =?utf-8?B?enpTbndHemk4a2ZMWWVxMTl1SXRQZWp5bnJncHRGbGdQL2k5K3FGeFJaWXBp?=
 =?utf-8?B?aHhjeHVMZklLM04vTjc5RWFUZTcvSG40dzZuR3RSVWR0NVZLaVNHVGwxeWVa?=
 =?utf-8?B?ckZKTFNUdWpIczJPd0lxY3Izcm9QRE5vMDk4a01jc3E5WUFZVDZOY2lrVG9O?=
 =?utf-8?B?N3R5TXRqdW4xeFNUQ3ZpV1ZKOVRMKzhrVnNzQzUzeHZaTTdHOHBZK3Y4ZW5h?=
 =?utf-8?B?OHFvdHBiUFJlMUNSaE0yVXUrbkVNMURnVjZHOENSelVFM3ZId0xlQ0ZNZnVv?=
 =?utf-8?B?WVhEayttS2lGNnFvNkRRU2swWCs0eTJZSTNxU3lnZkdidHVxMXpCUE85SWs5?=
 =?utf-8?B?bHBoTmE3Vm9KaHUyWVVQaHFGdXdFM01tMSthZnM3dzJXK29md1BMRXg1ZXF6?=
 =?utf-8?B?VTdnbkJZSXpLem9OeFJNTWkzUzdJN3JFREh1NEpPcFhkb2lwS0Voc1V6VEFI?=
 =?utf-8?B?bTY5aVFoK0s5SlRLeFUrT0F0OHVwcCthS3gvaVgwYU4rY1I5RDB1cmtEUFB4?=
 =?utf-8?B?WFkrMU1aTzZsSEFLNkVpeWR4ckNqTjJiL2hyTUQ3SmVoSWdERUgvV1FJd0JF?=
 =?utf-8?B?b1llcHgrdWxUVUl5UVI1ZU5mRzVEZUM1Q1FBVTZhUnRwdnB3em5mcHErTFly?=
 =?utf-8?B?SXN0UWNZUFcxb2FlMS9EUUxUbzk5M2szbjJ0S1h2ODlaRjJqMVI5Y25jZkU3?=
 =?utf-8?B?bEJ5SEZNbWcwR0svYW9YL0wxaGo0NTVWdnVjL08yemNmR09DQ01CUWRod1Fv?=
 =?utf-8?B?UXg5ZHk5ZlkxRmlscm5DYnVscG93L0ZxL0QvanBOQ0x3N0s0L0w2Zz09?=
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e0cf1b65-7f6e-4404-f45e-08def2dc616f
X-MS-Exchange-CrossTenant-AuthSource: DM4PR18MB4144.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2026 10:29:07.6543
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GT2LCCN2Zfi+usiUs+nuO9bRDTx11fB7nAdfO5v8BFRnMeoGgZOaGfOuq7uoz/4hAu8N3sBvYMab6tokn1vsxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SAWPR18MB988335


On 7/29/2026 10:28 PM, Linus Walleij wrote:
> CAUTION: This email originated from outside of the organization. Do not click links or open attachments unless you recognize the sender and know the content is safe.
>
>
> Hi Petar,
>
> thanks for your patch!
>
> On Wed, Jul 29, 2026 at 9:02 AM Petar Stepanovic <pstepanovic@axiado.com> wrote:
>
>> Add support for the Axiado SGPIO controller.
>>
>> Each SGPIO position provides one input GPIO and one output GPIO with
>> fixed directions. The driver registers the controller as a gpio_chip,
>> supports interrupts on input GPIOs, and uses regmap for register access.
>>
>> Signed-off-by: Petar Stepanovic <pstepanovic@axiado.com>
> (...)
>
>> +static int ax3000_sgpio_set(struct gpio_chip *chip, unsigned int offset,
>> +                            int value)
>> +static int ax3000_sgpio_get_direction(struct gpio_chip *chip,
>> +                                     unsigned int offset)
>> +{
>> +       if (!(offset % 2))
>> +               return GPIO_LINE_DIRECTION_IN;
>> +
>> +       return GPIO_LINE_DIRECTION_OUT;
>> +}
> So every second GPIO is input only and every second GPIO is output
> only?
>
> How does this look *phycially* on the outside of the chip?
>
> I'm a bit worried that the input and output would be to the same pin or
> something, in which case they are the same GPIO line.
>
> The cover letter says " Each SGPIO position provides one fixed-direction
> input GPIO and one fixed-direction output GPIO." and I'm suspicious
> about this.
>
> What is an "SGPIO position"?
>
> If a position is something like a physical line controlled by both an
> input and an output driver block, it is the same GPIO line in Linux
> terms, it will be used as output if a LED is connected there and
> it will be used as input if a key is connected there, and we have
> 64 or 128 GPIOs, not 128 or 256.

Yes, every pair consists of one input-only GPIO and one output-only GPIO,
but they do not represent two directions of the same physical pin.

“SGPIO position” refers to one bit slot in the serialized SGPIO frame, not
to a physical SoC pin. For each position, the controller samples one bit
from the dedicated SGPIO data-input signal and transmits an independent bit
through the dedicated SGPIO data-output signal. These are separate physical
signals and are normally connected to separate input and output shift
registers.

Therefore, the input and output associated with a position are independent
GPIO lines in Linux and their directions cannot be changed. For position
|n|, offset |2 * n| represents the input and offset |2 * n + 1| represents
the output. With |N| SGPIO positions, the GPIO controller exposes |2 * N|
GPIO lines.

I agree that the term “SGPIO position” is unclear. I will update the cover
letter and binding description to define it as a serial bit slot and
clarify that each slot carries one independent input bit and one
independent output bit over separate serial data signals.

>
>> +static int ax3000_sgpio_get(struct gpio_chip *chip, unsigned int offset)
>> +{
>> +static int ax3000_sgpio_dir_in(struct gpio_chip *chip, unsigned int offset)
>> +static int ax3000_sgpio_dir_out(struct gpio_chip *chip, unsigned int offset,
> The GPIO line handling looks like:
>
> 1. some translation
> 2. Standard things
>
> which is usually what we use regmap-gpio for, and we have added a few
> features to it recently. Some are even in linux-next, can you check it out
> and see if you could use the library?

Thanks for the suggestion. I checked the recent |gpio-regmap| additions,
and the library appears suitable for the standard GPIO operations in this
driver.

The fixed-direction support can describe the even offsets as input-only
and the odd offsets as output-only, while a custom register/mask
translation callback can map each GPIO pair to the corresponding bit in
the separate input and output register banks.

I will prototype the conversion for the next version. I still need to
verify that the output registers support the read-modify-write access
expected by |gpio-regmap|, since the current driver maintains a software
shadow of the output state. The controller-specific interrupt handling
will remain in the driver and will need to be integrated with the
|gpio-regmap| GPIO chip.

Best regards,
Petar

