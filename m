Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.195.6
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793933353;
	b=BqEn55JclDu15AcBX+BAnxadqj3MkrLY5ro2yZoAByWSs/6Hwpi4sUAy/RzIhvtKrC2s
	 9m5inQsX24kZrWr54RCc6mxpCTOdwOfusNbll6zulFWjJXAJ2CQJ2okEhihwTQvB4hmk5
	 ZW8AZS+guDKWiH0p4q0lb9IulZemxMMXSNzj3YjeNQWjWFqMpwHPH/bN8n5wEFrSvjSw8
	 g3BpyxiIqy7/rMrPjIXhDH2BMAOdnQN4yLJRWvYs3TpxPzIRVwQvsDRvZzYS/G0WnGEcx
	 a4lRqu0AX7+9N60lKmfvkm8eHAOLt824cowcMyMNwhv4/2LnKWugg/+uvc3NMwqCqiA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793933353;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 User-Agent:Subject:Content-Language:To:Cc:References:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
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
	bh=2fJA9Tzw1qeSQ6Psx1cUNI2kJzYOuXmNi+Z1xp7LtOY=;
	b=13oJouZEfO9KSlj/6B8CsvolQqOV2V/UnDim/hjCUuQVSkKPK3SWBYDNVe9lAOzDwAWP
	 CpqsNcBUNNbAtvJLof/UCALF2AMYakEAcFiZT4MukNvdSGFwlQXKMle8AifK7r+S8iWV1
	 Ii200U6M+ZFqHutmxSXcKwHlWTrZ2jjrC+5w38WfqPlA8xO57knDQ70xs44Fy4Mmcs5i0
	 M2uKHuux4bIuBz4HGRQl1tVL/tG+rUBcA+NzDC8ltSFS59y5rVLqBK/Jja43fhIsHjHPh
	 bHq5ZXbjSo2uyQYpRnWvLF0vsFX5S2sxz/VZhCuQzTaaciaC6RsC3jTRZ/1pw88J8bg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=mwLxhiON;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.195.6
Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012006.outbound.protection.outlook.com [40.93.195.6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DF1A606A31B;
	Fri,  6 Nov 2026 02:49:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6DF1A606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=mwLxhiON
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MkI3ICOGW552sk6/pJtrsJnEpqdHebFZBGUbH0O0bVxwmmjrRjNyY6s8AvYGT+IUBRcDZcyWGLA5MHG0pS96jR3J7WiegH2+jkVOliY9TvQPi90w+DasAONt7ToVYgcT0YsA4fNsEXRXN/nleCnxfrBFaj2gE43Gtwsma9IOePcO7F/j/HIKc8aDiggRq1LVnw1RTVEysVA+KMSE90Rrep3LJwricwqAvuV/7tedXaXWih2BpMCyAn+zKy2KtXhDTdcQ3/2qc24pH/32igseKcqFni5x3d4MbNmukzm6jiG7VJdBHskxEJ4WWMf5qxuutC6uoilY1VJzRZ8ex7NrEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2fJA9Tzw1qeSQ6Psx1cUNI2kJzYOuXmNi+Z1xp7LtOY=;
 b=DCkGEwhMj2wRXIm8m1uA4QSlleMDm5dwMGAA3A5aD1hsYppCXpBmzTmFylUxyEzPN/x0akkzapGR1/0artvsBQVLH+SoUEHntJuF6EDAuoZlv+S5oNFw1Rjjb7FxYL5IKGfx46TRwVgEqE4FbeKgZWxwuMTq0cJ6GtWYOLMaWFbzGcr4eO7TnfVEPE4OiaZojb/Jg0Hw/jTV3b6lWdqE8amPC8dKNbXKCVxW7Lo7ZSpVj95727mxnNAB3dHq1YGF7CgDyugrlHfs0sH1LnQHS3YZGI7Zk/QwCbKFycoMbGcuWCPp9CZy6AKzCtEdgEcVl9Iea8naURJ3sos4ZBKrlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2fJA9Tzw1qeSQ6Psx1cUNI2kJzYOuXmNi+Z1xp7LtOY=;
 b=mwLxhiONF+9ifwbNiXM9gpvn2olFr2TrGQVmVeHRngeN4U54xuF3Rjb4/B4VacYf2bZR/pnZ41d7Eh+eN18mY66JlCFufqkagwTJTJMOb93dxEr7dIOlaIGorkHq5aGNzIrvoaz/+9Jny+XO70YB5+502hX0E6F/yS96WY0hNgY=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB9174.namprd12.prod.outlook.com (2603:10b6:510:2ed::9)
 by BL3PR12MB6593.namprd12.prod.outlook.com (2603:10b6:208:38c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Fri, 6 Nov
 2026 02:49:10 +0000
Received: from PH7PR12MB9174.namprd12.prod.outlook.com
 ([fe80::eaaa:b430:ba9:5dc]) by PH7PR12MB9174.namprd12.prod.outlook.com
 ([fe80::eaaa:b430:ba9:5dc%7]) with mapi id 15.21.0592.009; Fri, 6 Nov 2026
 02:49:09 +0000
Message-ID: <a7668081-54cc-4f8a-9d9b-376365b90dc8@amd.com>
Date: Thu, 5 Nov 2026 20:49:08 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pinctrl: amd: Clear interrupt enable on spurious IRQ and
 skip unhandled EOI
Content-Language: en-US
To: Munique Feitoza <muniquefeitoz4@gmail.com>,
 Linus Walleij <linusw@kernel.org>
Cc: "Mario Limonciello (AMD)" <superm1@kernel.org>,
 Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261030195025.5153-1-muniquefeitoz4@gmail.com>
 <CAD++jLkRYb1Pn2G=cP2yGkSFbuHhzRQ-fDbTygmpxbCsm-02gw@mail.gmail.com>
 <CANA1Db=sBQFR99pw0YUSS9sUcHtHVn-SoUyj3p6Vxa+LLJF_Ug@mail.gmail.com>
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <CANA1Db=sBQFR99pw0YUSS9sUcHtHVn-SoUyj3p6Vxa+LLJF_Ug@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA9PR13CA0142.namprd13.prod.outlook.com
 (2603:10b6:806:27::27) To PH7PR12MB9174.namprd12.prod.outlook.com
 (2603:10b6:510:2ed::9)
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
X-MS-TrafficTypeDiagnostic: PH7PR12MB9174:EE_|BL3PR12MB6593:EE_
X-MS-Office365-Filtering-Correlation-Id: ccfb0490-63a5-4b4d-ecb2-08df3bb0883d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|11063799006|4143699003|56012099006|261021121427099003|261009223027099003|261022105027099003|261022075727099003|261026121527099003|261026140227099003|261102123227099003|261028144727099003|10067099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	q90XGjl1v5P3vNc6crweAuPZ7NFw150BelFHHGzG3GzzpoC0/mZQo+wrXvzxCrrjxnj9j8xhree+ukOVfUtuQQIZ/wyFlNa08bVtCTwxElb4A8+46eHRuuX5RpW+wwdeBs7cc6lZcHwugJ1eoi6p18m8yJZ1AZQmOPDiDwtl3buBYKIpGUiKNctVesmqS+o7DREroj4xbV/CJhDLqXk8LtyvgXQufYz5abQiyYmuZjJAFXlk1Vhbruj1/jxafpvDPxysvdtJ59ngi7iiOB+WE6uOfDuNxPHtfzfDgH0sMmEzxc65YvyN9h2q3fz7iuh0877GUiKp+903je8N+l8W7jx+bozTPSckdLxc9C+mz2KWE/EsGeqpAEhco/11yolrKYP657jLmitFhokd9Vh28YDB36awsxraaoIzBT2YHJzHqVHSKC/a0dVkpFRIT1Cj3ZTM+Ax0EOMnbk3u+0gHO2ZHEzEEkSFY0YvyCM1zLAfa2+43OIKQ5Fl8gIpj5/hfxus2gYkRn/GG1K3x/prPv5tpy/h5EjcfjrvtnzdPw1JRPQpTk0UufZBnlwmNpyH5jrAwHMz09GcaMwiz+KNJJXWbiM8mvUzzqdEVFud6PhizCuAYWvV6Sn7BP83etojQqtIcfOshPc7olsFiSUNCRKvyFxLpJgBF3X2Y3tn42vk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB9174.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(11063799006)(4143699003)(56012099006)(261021121427099003)(261009223027099003)(261022105027099003)(261022075727099003)(261026121527099003)(261026140227099003)(261102123227099003)(261028144727099003)(10067099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U2hBbm1YckxpTXdsWjdwR01vaVBzd3pZNDZDa1QrR21KenJCRzVoTW11eWlL?=
 =?utf-8?B?QmV0OStGVzNMZ0Z3enFZdkNLUFNzaWFWbWJ6SVkrTkhpM1dGTHBuSjJzdXBq?=
 =?utf-8?B?a0x3Q3N2VXRSVG53TTUrZEVScVE4Y0I3b2lpNlFjWlFyOUVEQ01OZEdFbHl4?=
 =?utf-8?B?bVo0UTE3VnZwWWVrb0YwRjczOWJuOTdqcmgxVmxKanNTUk1LeFd1MTFmeC9M?=
 =?utf-8?B?b2F5dTZOMUhKd0NLTXdNdWt1M2ppblQ0WU9tMFFxWGNEMk91Y2JCUVlWL1Ix?=
 =?utf-8?B?RHdXek9Nc1cyeU1iVEk3YkJKUWVSNzdycDloS1RjRkpJcThWVCtXZ3d2Qzhn?=
 =?utf-8?B?QitIRTBlZVVIR09MQm5CM1ZVNzJaL01GaVVXdFEwVjNtd3kySjhCc1JOZlp2?=
 =?utf-8?B?VnllNTRtRm1BdmJTMXFEdVBlMm9vcWViVzdaYmQzVWpmV2hPMFkwaXdEeVQw?=
 =?utf-8?B?UkFXVDBjYTVnbDlHNW9vSjRERnBIV1ZpbmlvR2lGek1UNW1ya2tsR2lReSt6?=
 =?utf-8?B?ZS9vYnlibDlnTzR6ZEY4bExQUmZrMTlBSlVtZ1NXRUxReWwzNnJYWXhncmwx?=
 =?utf-8?B?bExaanR6ZDdmWDJZQWRFd2pLMUp1eVBuR1BxQVZJd1JGQmNuZDFzeWlwYkZ6?=
 =?utf-8?B?aXE4KzRYREJodWZsTFRtckxTVWl5MmJwNWxwdG5CbkhFUEhRbDFuK0dEOUFn?=
 =?utf-8?B?RFo4Q2RGdTA0MXdrTEdqcHVuSkxSeVpPckJIWmVuUUF4QS9DWEFjWSswRTI4?=
 =?utf-8?B?OWVVVUE5cVJrZXdpNjQ0RTJVaGE2UWQ1RXBLSnFlaHg5bE44NUtQaE1GSzgr?=
 =?utf-8?B?eVhHWDZtZHFTYlV3cVB2Y1hRZGh6dDJPVVErbHBWaFprVi9xSndhS2NVUFVS?=
 =?utf-8?B?eTdUMWQ0bjdOUFRkMWR6YVhPZG4vYmhHVW1HNjdEdXQrRlB5WG8xK3JVeVZl?=
 =?utf-8?B?ckVDTHJWK2Ixd1pJRXBoSndsTjl1ZVdQM1FZbzc1bE95ZVRaQ0IrNEVQdDk2?=
 =?utf-8?B?WHQ5ZU5STGl6VXhqQSthS1oyVy9uYmJkYlcyaC94c0lvQVVBbWp4ZlZaQ05E?=
 =?utf-8?B?dGQvaUpuNnBNQ1BESDdlQlYyK3ljcE1rbUYxNkhqdVlKVnd2ZzVNMDcrSVJX?=
 =?utf-8?B?NDViaGVSQWRhOTFzSnpaemQrU3ljN3RKcDZtOXIyc0d1dGNEQk5GcTk2MUJz?=
 =?utf-8?B?Vk5oUVRPMGwrVlVFVnVFZUFRTjhpOHZ6eHI0TjErRFpkSzdQK3h4Z2dDVFlZ?=
 =?utf-8?B?ZnQ1dDlQRFdNbXo5Y05yZHRjMUNMTkxJZzB5TFhLcDJBOE95TU05cDl4VVJy?=
 =?utf-8?B?WkdSTW5WZ3dxYmNkb3JaTnFYN0k4QVFvS0hpVnBXWUk5Umw4SFFvQUJTY2xP?=
 =?utf-8?B?dHBUQktDODlaVEMvQUdzSHZWcHhudFA3c1ZoMVVDQldhZS9xK3dRSGhBT3Zh?=
 =?utf-8?B?bjZ6bjFLUkFDSkJxZzdXVHBaa0JFY01kUVhuWnMrU0N5RDROUzZLVGx5VndQ?=
 =?utf-8?B?STI0Z0hXTkltTnlJUVpYeEU2Q0RCZ3BJWWlEaHJOSlJJRlR2cnIwSmdsSzI2?=
 =?utf-8?B?SDBuT3ZTcHlwNVZ4c3lkSUhTaGhMMk9lcXFSVWRnZFdjSGF6K1JwblBoQkNw?=
 =?utf-8?B?R0UwSTdQVGlJTnhvTjI5blVJS1EzcXpPTzNPczU1cUw4STRXYnlpUGFqa1I3?=
 =?utf-8?B?SlZlK1JGSmJRMHJER0dqTDVrT3NpWHpnQSsxMlptTFJYdXJreDUwU2h2cVEy?=
 =?utf-8?B?QjRtblJXMm53MUxSZ1JMUERVVFZSZVdtSTBtMHVnSndPdDlmdlVmZkJNUmM1?=
 =?utf-8?B?ZTdpSGdKdml1MXZmZ2dlWFVENTBsd1NnWUYzY2tZKzlMZStRb2h2NU1FRjZj?=
 =?utf-8?B?UjlteXVKWVhHc3lDbXhTWHcyYTVadCtXbUUzUkgxWWZUUnYzYkFYVjJiS09a?=
 =?utf-8?B?TzFiTVFEQzZjZlVBcmdSYnc4anFxVDlRYkdUTHZFVEdaOU9FcDZlMjh1VFp4?=
 =?utf-8?B?bFF0dDRDNDBXTXVmUXRDZ0ROTENWSW05M2g3UlNNU1FCUDZUUjR5Wi9XTmNF?=
 =?utf-8?B?WjdleFRtOUp0NmdMYURkTHl2UzVmekJQZmxDY0FPZm5lRGRQMGN2UEYza2p2?=
 =?utf-8?B?R0trN1pLZk5uTHRpTHpFZEk2aWVua1J2eEZOaTR6U3gwM3RJTlYycjBtd1Y2?=
 =?utf-8?B?WXZaY1lNMkdYN25GUENwS2xiQWg5K0doa0Y4ZFVYK0dITDlVSmtXUGQ2eTky?=
 =?utf-8?B?Sm5aMjFZL2hqOGhDQnA2eGxNeGIvbTJ2Y2x5ZnpTZnlYWEJldWk0cEIvaHhL?=
 =?utf-8?B?b3lUUFBBTEhBdDZGR3VGMmRsOWo5SS9rdGRDL292Mjd1K3dpOEVIUT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ccfb0490-63a5-4b4d-ecb2-08df3bb0883d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB9174.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 02:49:09.8529
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nNpvjCXCUmeCh89W6VH2X7ZfK7tYG5tQrZtHq2Wh4W5FuDMJGYcgAaRVqgtYJL+SIRqWtyzWfzNKF5YjAQv/+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6593



On 11/5/26 18:27, Munique Feitoza wrote:
> Hi Mario,
> 
> This is a real issue observed on my desktop system during boot:
> 
> CPU: AMD Ryzen 5 5500
> Motherboard: HA0QING A520 (BIOS 5.17)
> 
> During boot, the system experiences an interrupt storm on the AMD GPIO
> controller (IRQ 7), eventually triggering irq 7: nobody cared and
> leading the kernel to disable the IRQ line entirely:
> 
> ´´´
> irq 7: nobody cared (try booting with the "irqpoll" option)
> CPU: 5 UID: 0 PID: 0 Comm: swapper/5 Not tainted 7.2.14-arch1-1 #1 PREEMPT(full)
> Hardware name: HA0QING A520/A520, BIOS 5.17 04/02/2026
> Call Trace:
>   <IRQ>
>   dump_stack_lvl+0x5d/0x80
>   __report_bad_irq+0x35/0xaa
>   note_interrupt.cold+0x1a/0x58
>   handle_irq_event+0x72/0x90
>   handle_fasteoi_irq+0xb6/0x1f0
>   ...
> handlers:
> [<00000000d546c9c3>] amd_gpio_irq_handler
> Disabling IRQ #7
> ´´´
> 
> Checking /proc/interrupts shows IRQ 7 (pinctrl_amd) accumulating
> around 200,000 unhandled interrupts on core 5 before being disabled.
> 
> When looking into do_amd_gpio_irq_handler(), pins that trigger an
> interrupt but are not registered as IRQ lines
> (!gpiochip_line_is_irq()) only have BIT(INTERRUPT_MASK_OFF) cleared
> while BIT(INTERRUPT_ENABLE_OFF) remains set. Clearing both bits stops
> the spurious interrupt status from re-asserting.
> 
> Best regards,
> Munique Feitoza
Hi,

Thanks for confirming.  Can you please share:
1) your full kernel log
2) an acpidump
3) /sys/kernel/debug/gpio

On a kernel bugzilla?  I'd like to look at a few things.

At least this sure *sounds* like a floating GPIO.

Thanks,>
> On Thu, Nov 5, 2026 at 5:18 AM Linus Walleij <linusw@kernel.org> wrote:
>>
>> On Fri, Oct 30, 2026 at 8:50 PM Munique Feitoza
>> <muniquefeitoz4@gmail.com> wrote:
>>
>>> When do_amd_gpio_irq_handler() detects a spurious interrupt on a pin
>>> that is not configured as an IRQ line (!gpiochip_line_is_irq()), it
>>> currently only clears BIT(INTERRUPT_MASK_OFF) while leaving
>>> BIT(INTERRUPT_ENABLE_OFF) set. Unlike amd_gpio_irq_disable(), leaving
>>> INTERRUPT_ENABLE_OFF enabled allows the pin status bit to keep
>>> re-asserting in WAKE_INT_STATUS_REG0/1. Clear both INTERRUPT_MASK_OFF
>>> and INTERRUPT_ENABLE_OFF when disabling a spurious GPIO IRQ on both
>>> main and RGPIO banks.
>>>
>>> Additionally, if no GPIO interrupt was handled (ret == false), return
>>> early before acquiring gpio_dev->lock and writing EOI_MASK to
>>> WAKE_INT_MASTER_REG. This avoids unnecessary MMIO accesses and spinlock
>>> contention when the IRQ line is shared or asserted by an unhandled
>>> spurious interrupt storm.
>>>
>>> Signed-off-by: Munique Feitoza <muniquefeitoz4@gmail.com>
>>
>> Sashiko comments aside, we really need to put Mario on CC for
>> AMD patches, Mario what about adding yourself to this MAINTAINERS
>> entry:
>>
>> PIN CONTROLLER - AMD
>> M:      Basavaraj Natikar <Basavaraj.Natikar@amd.com>
>> M:      Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>> S:      Maintained
>> F:      drivers/pinctrl/pinctrl-amd.c
>>
>>
>> Yours,
>> Linus Walleij

