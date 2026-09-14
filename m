Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010040.outbound.protection.outlook.com [40.93.198.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 507D1242D88;
	Mon, 14 Sep 2026 01:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789350098; cv=fail; b=oQuGtfNaSPyzCf5cF3n9aIJD6MUcKqMCXsHVv4y8lvgko7GxV9oECeHqWwbs65jKqcVgd6a12wOKZMgTuvKFKaVs1cJpNrlvygbCSc6tBZQx/QQP5NJ9apUqxqvRzrX8U7LXRLcVrE9IpLTkhMNsWKTgFk6VHzjonoN5LAXWXRk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789350098; c=relaxed/simple;
	bh=xMkb/bUM5p5+9FEIdztrbvDHO3OVI5AYlswN5lH/PU4=;
	h=Content-Type:Date:Message-Id:From:To:Cc:Subject:References:
	 In-Reply-To:MIME-Version; b=HwQVbHiOLN+BmBWj30GbrLJ1u3s1JyMVolxD7psYCrQfo9x6f5Ax8KMctmU15F4S3EgA6CiAO7rU6pUzV3lQGGTwFeECJAXunwm/e1YacNAqydShs3iYf4nUQM4RcSgIzmHNA9nPZerQQZ25vCIPo1d+hlouHMNXuP8mZcgB5KE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=uF5hKPPi; arc=fail smtp.client-ip=40.93.198.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="uF5hKPPi"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VUyN6pb8exGA0u71i2uKiXlBEDhI1S7/A8aPMNtNaZfryHaN/nQufwEsrUsPtRrS/2Pf8hzIicPwdAASIvh4zH9Uv4/L2rErm4/dSeOuxscIyEbMyKNvxT7YWUGEQTJQ/CpCJ9utm6NvfC+ijgGSh4YN93WRKOL0ULw/57UumZdye3bY6x+/4ATCZQ+wuZotesesBaWpQ8q4yrzZSM6SQHLx6RrYadOmBcPxv30wkURtagsukVIGX64XY7c0P4GRA+Wv53UfgLLzWtJ0uuuaRcidFqBW7ryUipe+pSIknsqIDi5Uk3+dbPjNuMhw56+tgGFVRf0eVH74vlwaDazsng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xMkb/bUM5p5+9FEIdztrbvDHO3OVI5AYlswN5lH/PU4=;
 b=KDF42At+d9SvIjmYxcdDdcnJdhwnARC/0uc4kz2XFIicVqWMaLr86qmYhoASQQYvmrJLZKTE2V3bj47cqXtqS1fuug85u+NCjWoqhxkuWJvm1Uk3afCRdGMjbm7W+l6gbCwXtte180xaFHz7mnMKs9RrSXtr/Nu455EvKpYZrHdj0tnR24x8n+uxqis83PQKcXUntTamKQRk20WckHzgnGVeEsWHqQl0M9oHoUHc9S417FN7Uth48pxPHNY9FiDBOA2TbnZfgpRKHrvd9sIA3E+FpiqEPQsinFhYw1HRbyDvzBSl5W2m5Kp+2oq8T+IULLUERYLg+EokI3Bm2oDE9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xMkb/bUM5p5+9FEIdztrbvDHO3OVI5AYlswN5lH/PU4=;
 b=uF5hKPPi1lY7HdHVB2B9sn1uoHH1abkFXjpk56SOkfJEKdqy/FbbP6owL7Md2KJc7gRNPNX4+7QIHgrEtuXoygXCGeAzM3R4Mu4Xh4Csa/z3iPnuPU1fECJquega2jKB2JUo7PEwf92SRondcdc5BC2Al7j2mEO4z8tfwY4OvS3ujoaGeP/Skp3c7uJwuToiV7niPhYXsyL55MRE72SuQHfC1IiH28S50ChCJgaXrsPxVcBHuBIKi7BBCq9kkNkQVLZ4TXx55ywKiI1+D8mXfR4mH/4vVu114q7uCLtvmNU68R5rpNurWCGRJTlnOJvmJ3NRaKO5u+NkpH5PX9HiVg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MW4PR12MB6873.namprd12.prod.outlook.com (2603:10b6:303:20c::17)
 by DM6PR12MB4386.namprd12.prod.outlook.com (2603:10b6:5:28f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Mon, 14 Sep
 2026 01:41:32 +0000
Received: from MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1]) by MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1%5]) with mapi id 15.21.0406.007; Mon, 14 Sep 2026
 01:41:32 +0000
Content-Type: text/plain; charset=UTF-8
Date: Mon, 14 Sep 2026 10:41:29 +0900
Message-Id: <DLENO35F39LL.2YNA66D9FCXYH@nvidia.com>
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Kohei Ito" <koheiito.dev@gmail.com>
Cc: "Bartosz Golaszewski" <brgl@kernel.org>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, <linux-gpio@vger.kernel.org>, "Miguel
 Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 "Daniel Almeida" <daniel.almeida@collabora.com>, "Tamir Duberstein"
 <tamird@kernel.org>, =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Subject: Re: [PATCH 3/3] sample: rust: Add GPIO consumer sample driver
Content-Transfer-Encoding: quoted-printable
References: <20260906-add-rust-gpio-consumer-v1-0-24d192f93760@gmail.com>
 <20260906-add-rust-gpio-consumer-v1-3-24d192f93760@gmail.com>
 <CAMRc=Meei7Z1f1n0M_Hy1LdxG=NVhkFeEiT3=p5QVpw6BTv3EA@mail.gmail.com>
 <6aa662d7.0ca013b1.1575e3.0a60@mx.google.com>
In-Reply-To: <6aa662d7.0ca013b1.1575e3.0a60@mx.google.com>
X-ClientProxiedBy: TY4P301CA0108.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:37b::11) To MW4PR12MB6873.namprd12.prod.outlook.com
 (2603:10b6:303:20c::17)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR12MB6873:EE_|DM6PR12MB4386:EE_
X-MS-Office365-Filtering-Correlation-Id: 2da19f8c-c968-4dfc-32cc-08df12014dfb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|1800799024|23010399003|7416014|376014|366016|6133799003|56012099006|11063799006|4143699003|18002099003|22082099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	OzEJw5MO+o6cInoaRTDDRzHiT66V0goYRNh63yJDAJcwvkz0Af4ZkGi6I8ckxpXdBHStMp+acZ0Wn1gyzq0bCh53lpccyz1S2kBtk0IrRR54xWYDe0533GOfF7APquLdSkQHC+ktxj9gqbDSveNaOoxthcGmuWaosGfVnmO1NHTS/vPJeG3sCAxctohq4q9ICmHqGpnL1IdL7bOfCb55CQF5ng9424ycJ5FdB38Ngmbjfu0V4lqgR1p8P0h93XjhTJmoAYDsohVpTZ8kncgWJCJxEGktwXLeWfBRPM9k1XOvG/yhTm+YyJeUceJBEOOlyK9dxUqleTXkIF7p24Hkm1Rehw9GNPsvHA5OKvRGh8wwC7Jezmti/YO6DOrIUb3Zwh5x9BuPVcR5waERZaDuQQkWv0wrrKEBf1bRwvKXurkN8H4vwZ2bTPS0C0yv/6wpAhHKoyLZ7FoiLZtz2eRxeSG6rVJ35Gi9AiC8lTraFOAjGOihK+bITfill1hGzqNqLcXfG3Mqb+GEpl3tGItTjhKmWmeXe3yCi59CQvTIqv+HNP01b0PaLS5unb1n1pEj/IAe1jvBnZ0uU3jkig62tybDtLK3HGHrId8OPK74/i7xPL1arWyd2UA/xEdU5DfPcudukPIBod+oP4ovJTf9B437Q+LR41deSnWZ5GBDUmA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR12MB6873.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(23010399003)(7416014)(376014)(366016)(6133799003)(56012099006)(11063799006)(4143699003)(18002099003)(22082099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R1ZJbjRnMWE0VzBZNmZaNTdueHBWVHJaOUp1NVRCeHFPOVZUVVZmTXltUHFo?=
 =?utf-8?B?RDVhbGpPQlFWYW54MjJVZ3ljb1JtTCtSRG5RQldIamVVbmdZSUR4T3ZIaXds?=
 =?utf-8?B?TXBWdWUvbU1LTjZ6NFVOUkhub0ZlNEJlUjNKTE1BdjlzL29lUXVGbFhQU2lO?=
 =?utf-8?B?NEoxbXdPTTdxM1lFSlcreWVNR2pjQXNvVGN2cm5HVmhmYTd2RmxCQ011VVp0?=
 =?utf-8?B?VEI0TWpTRlZSeEpoY0xWbVdrbVBwZ3JTYXplcEN4bnBqQ3ZobVBrOWFxNi90?=
 =?utf-8?B?MnVmZlNxd0lqTURuYXNVbzdrVzI0MVlQN25VSjFUUWg5bGtNUTRHcEYxUEtm?=
 =?utf-8?B?eHUrMXJ4K3V1VHhjQm5rVExyR0tJbk9GQ3o5c3lPN2ZMZGp6Ym9JMFhLYTJi?=
 =?utf-8?B?MHk5N0V1MHBOSzBIUGRnQVNnOC83aVFaaDJVZEdqa29zK0NDTU4zcTBYZnhp?=
 =?utf-8?B?emlnbWpmYy9NSlFWOTUxS2VMUzlRYUFTbUJ5NzhHTTQrTlhZTzdBbWk3V1Mv?=
 =?utf-8?B?WmQ0Sm5XZzNSVENpdVZJQlRPY0RFMHQ3NnROMW5ycmoyV29VSnl5KzhoTE5V?=
 =?utf-8?B?M2pSZVVaRGFxOHhpRkZpTzhyWTFFVFlZaTA4ejRFZDFCRjgzKys4OHRyWWpp?=
 =?utf-8?B?eGFZaElHaytRZjgyK0NRaEdvU3pzVEFVTzQxZGgvUHBmUUsxVkNFaGxGN2hT?=
 =?utf-8?B?WDErVEZwaXVuYVozVUVlYld3NmNub3V0U21iRDBKdmdyOTlkQ3Vsd1ZxdVB6?=
 =?utf-8?B?dDZPT3ZtbCtFL2FraGlFa2swYjBHRG5pMTdXUlQ4aFcwNGE4Q0kwQzlKbUtG?=
 =?utf-8?B?UWROcFdsdHloMENtbmp3Z3RSTTNSdGd6VDg5THJydE83ZHRsdlNYSEt0Q2JI?=
 =?utf-8?B?SGdDeHROdUllV3NtUEExUUR5MFRnOFlUbVQwOExkRmNDZDI0VmxEMU5jYU1V?=
 =?utf-8?B?NlM4bkFPV1JYNERONCtTcHFmaGFZOW1aYnl3TVFvQ3FwTDJMNFd0T1BIVXZw?=
 =?utf-8?B?aTRCU2wyTnhoTmM1TlltSXlxMVNDWUw1RWEvQzdYNytOamJ0REtNMDJzSjA4?=
 =?utf-8?B?Qm94WTNEdEJYWkIzK1c2eWFCVWZ2d21ZK0tBNTRzK0JJYW1Pc3JKZXRuWHJu?=
 =?utf-8?B?aEJwVWlySDNqK0hJNS9WbFJIZWMzNjZnZHVod014YUxvNkhGZEZHMHlzOXlX?=
 =?utf-8?B?TTV2UW5ZUkpGdUtjSVpOOFdrcE1XcWszc2lRWHR4bHBBTmYzRDh6WlVTaFo0?=
 =?utf-8?B?SE1LOG5ZZzZNNHpVVkVlc0c1ekZIRW96SUwySXlVZXdtcFJSK0pGUk8xcEpM?=
 =?utf-8?B?Tlprbi84cDNoZVFmeEJ3RU90cEFNUUVoQjR0ZENJaEV6R1E0bXlTSEZrQitW?=
 =?utf-8?B?WDNVM3dmZkFhRm9LNkxUYVpDdzBrYVFkYys2T0ZKbDNoaDdEeFJsOFdFanRs?=
 =?utf-8?B?cWI2L2g4d3hHZEY2MEY5YXBwM1Y3cGIzTTEzQmpneUEvQ1VLQ2J6TGRMQTYz?=
 =?utf-8?B?aEo3QXBYSVlDTlpVVjZKREI3cks2Qy9GU2Vsc0FxTHlKd1VoWUUvdnd0RmNG?=
 =?utf-8?B?ZnAvbTVSUjRVOVJXRmV4Wk9ia0ZrcGFReVVDTVlQMEF0d1FYZWVsUGQ1V0NS?=
 =?utf-8?B?TWpkdWlqR1hGa0JGNW5wMFRhcW5Ob0kyZWpuOCs4MHRkTE5ENVJPQktlRlJY?=
 =?utf-8?B?N0E0Wm1pak05OVJQT1NmaDkwQkhCVldvVU5ERmQ0Ny9TZlN6R01oRldQWll3?=
 =?utf-8?B?ZnljOGUzVHB1N0w2NGt4dUw3eTFQNlpQUmVmYTJmL01uN1dWWFg4UjhrTC9w?=
 =?utf-8?B?V1B6ZWQzSlpsTWttSW52UjRlcW55Z2JTc0pTd1NlWmRvM0VXN0hLWDIyck5r?=
 =?utf-8?B?eXVYT24rMVYzMGdEc0hndlA5REZYRS9FUzRmVWdqeWF3eDJ5SC8zWE5mUENH?=
 =?utf-8?B?RnhqWGxnSldLVUFubnZrSktIMDhGakMxYmd4eFh5YWlBOUgwWnRRV20yMDhh?=
 =?utf-8?B?UjFUQit3TDlzUlJjbHZnYktZaU80Q1gyM3o4bU52VW83YzNmMmszM3p1ZStP?=
 =?utf-8?B?ck1EN2xLMm9mclBNeVRRRVdmY0VBaGozcmpnUjcrNDNYRGxtZEdnNStxc25B?=
 =?utf-8?B?QWpydlE0aEF0SFEzRXdZc2laaGUvOEdIeEthSmY2RXZETE1yRG04d2xKeFVD?=
 =?utf-8?B?czVOTGljbnlrR0xHZk1WYjlCRm01Qi9uQmQ5WlY3UmtmbEpzRzVMWmtMN1Ev?=
 =?utf-8?B?aTZxRzcrZU1CMnBvZkQ5OEs0b3FNbWdBN0xTbjhUd3QyNGt5NVpOdTc1ZFdh?=
 =?utf-8?B?cHR1dGNyajgwdURGVmVCbWZmN0xxTjErd2hEdjBsMEJ4TlJvaW5Kb0d5R3Ir?=
 =?utf-8?Q?8pwVV7zolETcqqu6yXdevIKlShqLEdqllEhPeTdZfdZdh?=
X-MS-Exchange-AntiSpam-MessageData-1: wQtJAhd/J8Jhmg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2da19f8c-c968-4dfc-32cc-08df12014dfb
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB6873.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 01:41:32.3974
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PDSzpvXtggegoEWIjnqJKeECUu0p5tW9XEZ7MuBcflOm3IS66jH2o+XO0kNuaLcPKc8gdXDl5ZzGUBNsAJVwzg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4386

On Sun Sep 13, 2026 at 5:46 PM JST, Kohei Ito wrote:
> Hi, Bartosz,
>
> On Thu, Sep 10, 2026 at 12:37:17AM -0700, Bartosz Golaszewski wrote:
>> On Sun, 6 Sep 2026 10:45:51 +0200, Kohei Ito <koheiito.dev@gmail.com> sa=
id:
>> > Add a sample driver to demonstrate the use of the Rust GPIO APIs.
>> >
>> > Signed-off-by: Kohei Ito <koheiito.dev@gmail.com>
>> > ---
>>=20
>> I don't like samples as they rarely get built or tested. We seem to alre=
ady
>> have kunit support for rust, wouldn't it make more sense to implement a =
kunit
>> module for rust GPIO abstractions? If we don't have provider abstraction=
s, you
>> should be able to reuse gpio-sim as the GPIO controller for testing just=
 by
>> instantiating simulated GPIO devices.
>
> Thank you for your suggestion.
>
> I assume the kunit module you have in mind would be implemented like
> `gpiolib-kunit.c`. Based on your comment, I agree that a kunit-based
> approach is more appropriate than a sample driver.
>
> However, as far as I know, we don't yet have Rust abstractions for
> platform_device registration and software_node, which are required to
> implement a kunit-based module for testing GPIO consumer APIs. Given the
> current state of Rust for Linux, I think creating a sample driver is a
> more practical approach for now. I would like to consider migrating to a
> kunit-based module as future work.

The problem is that this sample driver never probes, so in effect it is
only ever compile-tested. Without support for the provider API, you need
to include a small C fixture providing a GPIO chip for it to be actually
runtime-tested.

Doing the same using KUnit would involve building the `gpio_chip` using a
bunch of unsafe statements working with the C bindings (which would then
in turn require `gpio/driver.h` to be added), so I guess we'll want to
wait until we have a proper Rust provider API to go that direction.

But if we add a sample driver, we need to make sure it is exercised.
