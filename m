Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11021096.outbound.protection.outlook.com [52.101.52.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 345A17081E;
	Wed,  5 Aug 2026 10:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.96
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785925422; cv=fail; b=Fd4OkBemjLUrLdS5rueNHjkqQOvi+WlRauI/qI0f8G5EgjrNGwPAmyoswJaq8hM6HJBmOJCra0GBDlGKkuJYyB2eNuNd8jC24O8E4Jtj6cWXvyIi179BeFWlN4rcE5aBU11o10gfJzsixqRnxEnmhcB07EPE3iFC7znGjEzQzRg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785925422; c=relaxed/simple;
	bh=/4GhuAHbk26VtGZplbxH5JicCvkkBc3QZ9GH5wV/Ouc=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=L2KUB57wtDHbl7MPVyneDN5qhuGNlA1C6MPAaYl0NRH8e6Ny/5PYx9356TUGX9s+GKJa7at38VQvz1GP+lNMI4ue/TOHKWS9im2+oHR5V6V38wl41ujs/spQvlXGh8Wf1o7jY7IDnEHBF8x7lLwoANC0vcmTtQZ9BwZjWb59Lgo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com; spf=pass smtp.mailfrom=axiado.com; dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b=MVhiju4w; arc=fail smtp.client-ip=52.101.52.96
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axiado.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b="MVhiju4w"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bRdaByS7reppe2mVDnd8LtigFIIQ7BrSyeJcDVazcEVy6U0d8Rh5NFX8ZkuhxMgS7nfbQoKwurbgQXV7moj5cmN7M8jru79oMZ9N7EUBp+5dl+8xIo+J3Bcqcv7SpuGBBskvj8i77OAhuEL++HMI5Ic5a9qDKHf75FrPI7k83pTj7Nt+7JD/4cY6Pq+/TtUS1dsuiBRpgPSJx7K3qs4u6loR1Be98GaixUhkGLMABU8gwX/X6gGif54DHNgPaw8YPQKsQIunKOqx97+75SJzwt2mMRJw37VgJXabTiisA6JlNW/dE/mWHF8Q0UIaUsy1nnR7PmcxL3rpEv26Hgg0BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IfUuSqMcBrhIqZsMEZy/hqlXl/538+C0w++qv/Jl03g=;
 b=cxSzXVYW9AyInGnx4LTMGeBeQmQqgQkNWPPg2dYt9jagWKqfOCQCGLjr8FkfrMW7i4S60kc16x1u4nuVeb9HHujhw9JYEUQGNd6UjrVFve0PyNQowMupcVwPZ8s5OL46lRVHR7mVzPVt3x7Pw7IDwp5lqx5GL4wZCepMlM3QhUIm9Obw3nw1zVKyAyWTDnzzIhmTAoTK7m/P7vgNAFyIrLcS4oOaKOSzcf8Rh+Bj4r5MYJK1g4rUvEhyKz6GamzCoOmIAhWgjZ8Z4b9oS9V1HD/VoOM87sVkBHDqI8zHzUVbQaUMWNyi78Zb2UJf/2NoImY651lfd9UyIiowWX/Mpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axiado.com; dmarc=pass action=none header.from=axiado.com;
 dkim=pass header.d=axiado.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IfUuSqMcBrhIqZsMEZy/hqlXl/538+C0w++qv/Jl03g=;
 b=MVhiju4wb5N5f6Ej+l5NDBFdopKudpfBPLq2a5Gtgz+lVYqQ+D2C6McHXTlCirsNpAfdFUomlBrS8WiaNU4ShXHCUeMryNwtUGmYszy5jm605zEUmUtL8YvUbOjm4XEStM9I+1yfz6r0jOBte2D+Kj3jJVjASajHsqDKgyxmog2Cal4Xvr7k1812DfA2qji0A+eKnWcENgttvjqbz8bC+N/lgtEdt6HMhHPUZSZrkWhxOeNm+aQbjYybxuU7eohtBE293Jj80jviAzcIw+A9KzFXwKubL9jzVX3a1WKZFoQqi7dmuT8+c1ifR7ojwMvfv7FzthcRpz0/U3KUVp7ERw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received: from DM4PR18MB4144.namprd18.prod.outlook.com (2603:10b6:5:38b::8) by
 SAWPR18MB988335.namprd18.prod.outlook.com (2603:10b6:806:4e0::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.17; Wed, 5 Aug
 2026 10:23:38 +0000
Received: from DM4PR18MB4144.namprd18.prod.outlook.com
 ([fe80::cb97:ca8a:e55a:b11]) by DM4PR18MB4144.namprd18.prod.outlook.com
 ([fe80::cb97:ca8a:e55a:b11%6]) with mapi id 15.21.0292.015; Wed, 5 Aug 2026
 10:23:37 +0000
Message-ID: <e9fb5dd2-3fd5-4dba-b26d-c47abe6885a5@axiado.com>
Date: Wed, 5 Aug 2026 12:23:32 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: gpio: Add Axiado SGPIO controller
To: Krzysztof Kozlowski <krzk@kernel.org>, Tzu-Hao Wei <twei@axiado.com>,
 Swark Yang <syang@axiado.com>, Prasad Bolisetty <pbolisetty@axiado.com>,
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Harshit Shah <hshah@axiado.com>,
 SriNavmani A <srinavmani@axiado.com>, Karthikeyan Mitran <kmitran@axiado.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260729-axiado-ax3000-sgpio-controller-v2-0-976f4ed11438@axiado.com>
 <20260729-axiado-ax3000-sgpio-controller-v2-1-976f4ed11438@axiado.com>
 <986fac76-3bcd-4523-a902-701027aff1bf@kernel.org>
Content-Language: en-GB
From: Petar Stepanovic <pstepanovic@axiado.com>
In-Reply-To: <986fac76-3bcd-4523-a902-701027aff1bf@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0178.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9f::7) To DM4PR18MB4144.namprd18.prod.outlook.com
 (2603:10b6:5:38b::8)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR18MB4144:EE_|SAWPR18MB988335:EE_
X-MS-Office365-Filtering-Correlation-Id: 32a8e2ba-9333-4615-dd48-08def2db9cc1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|376014|366016|1800799024|921020|6133799003|22082099003|18002099003|3023799007|56012099006|10067099003|4143699003;
X-Microsoft-Antispam-Message-Info:
	ZbZakDdeqfY8ja4VIp/CVkdNVck55eTRcmwQxetNj7wY2HTL/oTmcX6JGWTK+Xdm2y7I3ns+N3bBbHT2jlVTrlQnkoEM2u5s0p2gMv9eMAcG37LvGE7j950hb8LodAWPMNV+3oc0yUpFK7VedhdTq6hhlwv0d+j45VaauKIpQwadt8/TdGo719pN332umSYIIH9x8r3VlO6RVg4CpAsx1x4kSYWZ7B42l1dAWgjRp7CsD2UQiBxl3pTvEHCmoIpalyuk2teBGz1TFBqbAEV2KAZrruf+Sgc67ZSVA800QHALI90iOimQ8YK264hz59xWWxPBq5lZfX7zPfZK9V2qHWHIbdb2dHYsB/PDdgJfmgZjqnzKy15NFpwfAIZzt9x7HdFoIif9pd0OuX47VLRuGao53Z2MVAy3zdSTquj53a1uD4EoaccBW8nro5dkstw7YjFlxEvEVEEIRubL5WVjuKr+OxDo0euBMjeGj1UMkdmO0XkLFUNS/TMbTcExemSQciHIj5Q8RqrpJn7OJy4saTnbEUxe5rYE3rq3xmrAJE2LgHrnBF59Dj0omNQnQhyiVbHzLPyvf1aQphJ7Zbhb9J8J2+0hsTHlc/H8OJ/eUCPD7S+Lz+YoWSe0NvYXuuAOE3ozdGugjKQK5t9kNRtqL2zIO62hw0Wo18HBblXFtc7cgMdJaLsUeGw7J0if3OXq6qoeU3PnA3oIAZDlm19Pfg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR18MB4144.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(366016)(1800799024)(921020)(6133799003)(22082099003)(18002099003)(3023799007)(56012099006)(10067099003)(4143699003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WVNOa2VTZDBMRUo2Y1diS09nU3ZOa1RZVyt3RGFlZFRUN1ljK25WN1ZYbDQ5?=
 =?utf-8?B?bUI1V2xNbmJWc0dnZkR4RWlQR2o5SUdUcnR4WU5oK3lzOGV2MEoxZUFESDBH?=
 =?utf-8?B?bml1VThObzM0T0c3dThBZUxBVm8vdlB0S282RitJVnh5UlBJdFVZNGhXbWlF?=
 =?utf-8?B?eXZBdnlxaWxkL3p3Q29hZC80L2xVeDBBM2R0YUdiM2JrczJVWnNFQnJDZkpk?=
 =?utf-8?B?STNUOXZSOGI3cThUMElzblRyYVM5eGNiRjRHQnFwbTRMdHdyOTIvN01yNElQ?=
 =?utf-8?B?eDd3cjlQNEVqaHZWRU43VVFaVjJMa3lTZ1pOSlJ5MUk0RzFpby92RWtBWHpw?=
 =?utf-8?B?djFzNDUzQWxYK3dlM20rdUcycnNnekZPY0N4SFl0UXBjbVJqVThNR2Zudnd3?=
 =?utf-8?B?c0tVS2NzNDBMQlNXaFRjQTB2Mlhlblp1K1FEQUJrdG5sYzBvUnJxUVZaMWQ5?=
 =?utf-8?B?dWxxb1I2OW9HMzlickVwL3JQenZuK09WelZNSm1ZUURsMzd1MzVEQlJWTm1X?=
 =?utf-8?B?bldaYStpdSt6cG5nT0gvdWpFa3BHU2pZbjNnNXE0dVJLWDYrcFR0S2ZRYURZ?=
 =?utf-8?B?YkNYWGpudkI0M21tc1NmS21SeTllYXZ4Zld1UlpYTjMzWXlCaEw3V09Sd2hn?=
 =?utf-8?B?OHVjQ2g3WUpPaThqOHdXM3kyS2c1S09sMFBqRTFiTHlwUGNPR2lLYkdML3NE?=
 =?utf-8?B?YmQ4eElTcmYxMkszS3dxYkZPcnI5QWZpMmpaL1RnQjFZZHdTS04vd1lZOHl2?=
 =?utf-8?B?RmNUOTY2SDNEWWFxRHNNMmg5OGkrbFNzODVWNVNGZjM3VzlDZGd3OXJDQ21t?=
 =?utf-8?B?eFRLZWoyQzR5UHYrbDRaNGI5bzI3L0FYRTVBWFBqMjNvUHN3MFZXT3M1Q1Qw?=
 =?utf-8?B?cEthQzN4YnljZndSNUFWTHEyY1c2V1VLakpMMTNwL3NMOWpEMTloYkEvS3pz?=
 =?utf-8?B?UzB5S0lFTHkrTzZMY3RUM2pjYWViOTVLZ2ZIcVFHdjk2L1JHVzlNaTA3dmtE?=
 =?utf-8?B?NWRPRzRPblgrZzYxeXlSU0hNb0UrRUFCYVc1UE1Zcng3QXQ2ZUpBMHZOcXlF?=
 =?utf-8?B?Q3ovanJSYzdNemZWR0NLOGZYaXRQNXF2czN2bEt4eHhxT245czhaRW1EenFU?=
 =?utf-8?B?N0QzbnlNREtLQ0xqVW1LZkdoaWNWVm4zSEFyNzhnMEx6cXJWTjEwc1BSY3h4?=
 =?utf-8?B?MHVZYWxIekcwUDhvd3p0TDU3U08wa2IyNVA2NkVqb1hwdG05MFpCZjhTK0dw?=
 =?utf-8?B?bXZMR1RBRmh1a08rU2VkSWFkN3A3c0tjVml0MzFOMXZWTWEzNWtBemNhdHJ3?=
 =?utf-8?B?MjRNcFZYcGdvRHNXTmRKTFRqSzN1LytkU3dlMHZQeTJhbDc0YjU5OWFjYjZE?=
 =?utf-8?B?a1NBdWVBMng2SU5rQTVkeHZOR05abGRWUGhhNDdxbjQyZ2RZcGc1aWtSajlJ?=
 =?utf-8?B?SDVmTlByeW5sOGF6cTYyNzBZaktkR1pSVEplV2l3NDlTS05SeitiQnNvUSsv?=
 =?utf-8?B?OHZxUkFzUm9WWDVkQk9VNE1wYUl2amlOWXp0MFVNYnlTcTZSUGh3ckpadjVa?=
 =?utf-8?B?cG5LSnlUdit4ZUxQeDNTVWNrRVpEaUtkeXFoeUphMmFVaWhMcFc3NmUxVThN?=
 =?utf-8?B?Y2c4aVQ0UTdyaUgvZ25va0x4WGtWWEdMamtlQVhLSUJONWlDekhaakcwQS96?=
 =?utf-8?B?RXNSUE1ZbkE4d0gydHowdUpTZFVMRjBkLzZ4MHNKdG1DMFNtOTU5OHZWUjJm?=
 =?utf-8?B?dUZKclVMZGJCaEFJRU96QmhNeGk4Y0pxQS9jdVd2b0lUNW85SU5yOXRJSHgy?=
 =?utf-8?B?RDNpSGxhNHVoTkMxaFk0ckJCa2o4UUFQeHoyWlNUOUk5VlB6QjdwajBzVFlo?=
 =?utf-8?B?MGs4bFZSWjhvZkZ3SWxGSFhZTmhaSFAyakN3ZmxrT2xXVHJSdXhlcy9wSzVh?=
 =?utf-8?B?bERZTkRHWFlTek9RT0hzQ21PeXhPbm0rdzQwTUd2bFVuYVBOTjVSZkZaRDZL?=
 =?utf-8?B?UUM2eS9pbnNYMWNVdXRKemVEQ2JYQjVXeG9pUitWUTB2eVh3Z2dlc2FFOWhq?=
 =?utf-8?B?bEcrRXNhVzZ5eWNaSDdNeE1EQTlyMVIvcUFDOC9wY3lWem9taDdJVEVXWSto?=
 =?utf-8?B?UnBLSTY5T3g2QnE0RWtXa2Q0eS9GeHFVRERneVNDV3Erdjd4SXFwcGhWYXNr?=
 =?utf-8?B?c3FieUkza1UwanFiK0haWml0SUhxTHkrZVVNWTJLTHdrN0hlU0RTaTNHZnV3?=
 =?utf-8?B?YmxmMnZhYXVwWVhVOGZaR2cxWlFDUHQ3MXhxRmJQYUFqK05ZWk9qdzNDeFJ6?=
 =?utf-8?B?OGt0dWlwbkpZQlphMGZYU2N0TU1ZT2Jha2Q3NUkxSEtDMTE0Qm8xRmpoYUVy?=
 =?utf-8?Q?TKpv6lGQxBeAmvfo=3D?=
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32a8e2ba-9333-4615-dd48-08def2db9cc1
X-MS-Exchange-CrossTenant-AuthSource: DM4PR18MB4144.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2026 10:23:37.7888
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xepJeYjUYd1leyk8cJe3SIghsQf/EKvBcq1hKLdIoI56ClIuUGNqFKDdcoe9WNbqVAMEkUyOdedO3wn2VPjkGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SAWPR18MB988335


On 7/29/2026 10:03 AM, Krzysztof Kozlowski wrote:
> On 29/07/2026 09:02, Petar Stepanovic wrote:
>> ...
>>
>> +
>> +  bus-frequency:
>> +    description: SGPIO shift clock frequency in Hz
>> +    minimum: 1
> Such property is not allowed. Why you cannot calculate it automatically?
|bus-frequency| specifies the required SGPIO shift-clock frequency, not the
input APB clock frequency.

Although the divider can be calculated automatically, the desired output
frequency cannot be determined from the APB clock alone. Similar to the I2C
bus frequency, the SGPIO communication speed is a board-level parameter that
must be selected to meet the timing requirements of the connected target
devices.

Different external SGPIO devices and board designs may require different
shift-clock frequencies because of device timing limits and signal-integrity
constraints.

The upstream ASPEED SGPIO binding uses the same approach: it provides the
APB clock through |clocks| and uses |bus-frequency| to select the required
SGPIO communication rate. The driver then calculates the corresponding
divider.

Is there a preferred generic property or another mechanism that should be
used for selecting the SGPIO shift-clock frequency?

>> ...
>>
>> +
>> +  ngpios:
>> +    description:
>> +      Number of SGPIO positions. Each position provides one input GPIO and
>> +      one output GPIO.
>> +    enum: [128, 512]
>> +
>> +allOf:
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          const: axiado,ax3000-sgpio
>> +    then:
>> +      properties:
>> +        ngpios:
>> +          const: 128
> else what? 3005 has 512? Then these are implied by compatible, no?

No, the exact number of GPIOs is not implied by the compatible string.
AX3000 supports any valid number of GPIOs up to 128, while AX3005 supports
any valid number up to 512, depending on the target configuration.

The current binding and driver incorrectly restrict |ngpios| to the fixed
values 128 and 512. I will remove this restriction and update the next
version to enforce the appropriate maximum for each compatible.

Best regards,
Petar

