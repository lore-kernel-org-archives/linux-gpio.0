Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013060.outbound.protection.outlook.com [40.93.196.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9210E47C0EE;
	Tue, 22 Sep 2026 13:32:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790083980; cv=fail; b=A8T/wT3z+xEDNXzzLKaJdNQPJF07MKBotG2o3uivC0fYlTZ9in05a55yvT6fmRTuwHXTqZKnuzezcRRjTDYkIH3SB5eEfzFT+KJ7ptUnK3N99quVMlh1X+pqS9VlTYETktkQjKhLEs8icT9Mnmbb8jlVjJj1g2ih72oTLAXUpeA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790083980; c=relaxed/simple;
	bh=4RDfvenx1DgRBn9S+3i5jsZuvM15Y1kxtNxmaalO5GU=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=a4PpSE0xFYmJ1NbX57LcXBYKmlE4rE3xU3JrXjoq8VMzQFdIEa6PazJRqsrCnwon5ktEtieF2Eoh6kckAV8dcoA0sF1j6SE5yvvnQ0SX2o24ye78BHeezfZu4uFAg96/nDS6vW4Smgivdu0K65lLQfLbaoYMDcwmjtXu8SngGMM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=dNLTgiNA; arc=fail smtp.client-ip=40.93.196.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="dNLTgiNA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q4r9tSz/g7skvOXtyC4N+1W42qmDZYTGp617Q0lqy4EK9PJORFhPUjED1MRmItE+DTd5dzY05gKTY1EeOrKwzLx6jxL6sVLpjpzxEXfZ5PuIE7D0wdaa2Jj20e5FwtPGm2hrsxEVoPlBAZrf2mi0L+vdNt3KFhSGjn9Hfso8L8fJMF8isxrhqfTm0KC/uBVOPHwWNidNymNcjwFWdj5fmfjx4pgWNtDOnNk4zAchNxNQKyJaw9B85P5m+HtPBOlMXBVml/ea2v73jPrYXzzmQ9LrxyrxYRl+Ilg8vr6gmkeKaPslRG2ceAeoi6xcCYZodVUuUV03TAU/OBRp92U03A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4RDfvenx1DgRBn9S+3i5jsZuvM15Y1kxtNxmaalO5GU=;
 b=IQY9fwZk3q4MazWh/5KRqXn2wpz67yh1ex8wvMIjDajldedUTwzDciw5hj/WJQ95as6qxhZNbfydX6D/m2BoM2TQegXMUDgU/MlKCWvQtd2CFca89SkaG30IosJpl8yQnfueNCCXyZI7t2vNdRSRG7eXEZ7OC/K3gy1dhxi6vBsN3+LKiodR2WpBvZKRLxbw3pruYmtuzcPHlj9F8cPPG7AsX99l4k+IEG4GvozpfbFQEb2C1IfqvQIa2dv99tOgl22ljqEV8H8ciiiq0iylB/l6GHuYsgw6fLAT0BBe8xY9sHGa8XTxBWPwMhBHPSN8cPNcFdcBHaaBpqVQTPQXhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4RDfvenx1DgRBn9S+3i5jsZuvM15Y1kxtNxmaalO5GU=;
 b=dNLTgiNAroa3wKnflBuHo9OdAkT63TrRaEOFuXGVxJEhNLIXO8I2i66pB1I9kyPI5QDIqBEL9U+rT+fdQ5uWquoGvLb7j6sAfMdV2gxgQMagCkZ+rvyURvBp43alVwZNbc1aHm9mfb3KuOKdP/+SwB3nectREUjp2jBqZOeflqAn+TbSOSnXiQc95vPzIf82Kq0dmPKj3CJKuK1ocSy6RSHn20MxXSuXOTAyAlyIgy9T/dcRDjjtjOXiPEztc7194xyk0CW1uvZTPZpAt6tbA8g/ibK/6+qTj2iwx3A9YfZnj/akzA85TZCf2W1NOkHH/nM9GAGZ1FA0KOh2c95Y5A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MW4PR12MB6873.namprd12.prod.outlook.com (2603:10b6:303:20c::17)
 by BL1PR12MB5732.namprd12.prod.outlook.com (2603:10b6:208:387::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.14; Tue, 22 Sep
 2026 13:32:54 +0000
Received: from MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1]) by MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1%5]) with mapi id 15.21.0451.014; Tue, 22 Sep 2026
 13:32:52 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 22 Sep 2026 22:32:49 +0900
Message-Id: <DLLVT33ESJA5.1XE4J08AEZNMX@nvidia.com>
Cc: "Kohei Ito" <koheiito.dev@gmail.com>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, <linux-gpio@vger.kernel.org>, "Miguel
 Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 "Daniel Almeida" <daniel.almeida@collabora.com>, "Tamir Duberstein"
 <tamird@kernel.org>, =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Subject: Re: [PATCH 3/3] sample: rust: Add GPIO consumer sample driver
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Bartosz Golaszewski" <brgl@kernel.org>
References: <20260906-add-rust-gpio-consumer-v1-0-24d192f93760@gmail.com>
 <20260906-add-rust-gpio-consumer-v1-3-24d192f93760@gmail.com>
 <CAMRc=Meei7Z1f1n0M_Hy1LdxG=NVhkFeEiT3=p5QVpw6BTv3EA@mail.gmail.com>
 <6aa662d7.0ca013b1.1575e3.0a60@mx.google.com>
 <DLENO35F39LL.2YNA66D9FCXYH@nvidia.com>
 <CAMRc=McV2YKgbmnknLZTSGoSa_9eCHDiOLzuPPyPHHnj=vRuvw@mail.gmail.com>
 <6ab12d24.a3d4836d.3b68e.d0f8@mx.google.com>
 <CAMRc=MfZckBMT-4PEDxr-PjRbUPO4FY3OZw8ks3w+uoEyixbAQ@mail.gmail.com>
In-Reply-To: <CAMRc=MfZckBMT-4PEDxr-PjRbUPO4FY3OZw8ks3w+uoEyixbAQ@mail.gmail.com>
X-ClientProxiedBy: TYCP286CA0360.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:7c::6) To MW4PR12MB6873.namprd12.prod.outlook.com
 (2603:10b6:303:20c::17)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR12MB6873:EE_|BL1PR12MB5732:EE_
X-MS-Office365-Filtering-Correlation-Id: 28d7eb61-17ff-4200-8d27-08df18ae00b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|7416014|10070799003|366016|56012099006|6133799003|10067099003|11063799006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	44O05s5nQpOfjaBrwaSwfNrcfdvWWmrdMkpmqhssc3LDaXEqX/xWJPpxkjJfc465LTy7u9zfUJBXrSkvlU5chuNu52ldH8hqDuCiB1+nQRhMjGNNdwlwz338xM2jbXJkNf0LgGjBTUXuYca2qkjhJnfNiiPuiOlOmV3NS8XY76b97+eK5h7yU2C8mPL2b509Tt6wFcVt1Jyclvh1rUpEJ7W9si3rxhxSqQIEdZENcNRiGo9w14WLijMIgLUB0xQejHq7fr1znQ5AUi+vBqR6sl23yluN3/owWX0pYJjkDbNANe9HSfKXotYFWDfytnwnWz7i4YDFXIJIYsnP8sFakJ+r+WxbhsY7zLAxZMIIHUHOp7+rfSnEyHMGxbGw9jEzOYO/uKzC17we/P5eNDGTuUzBvyi4jFOtDFb5X52vx5ohtscamK0BlI00Z9zG01AmX8RR1b77GBHiWNt+n3ALVH+4YnwwLbewhukt/MzCvoI1qc9+yoyNn6lBLY3TcF97/hUAJsLTOS9eAWwDqAwT2bJ7QljMFCamwKCuT69dBqkex84S7DFowZRGmTMcvRK4X1o+3xP6vcDxRTGHn+quAyAKH5Af+puwiMA9tGyUbCvfmcDYdklJQVawc5c4rywGcJtlEChZ7md3L3FnKise+gpf7ZtyPnUh734EX6D2foU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR12MB6873.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(7416014)(10070799003)(366016)(56012099006)(6133799003)(10067099003)(11063799006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MW9NWVJ2b3gvalJVdGFrZkRzMUdncENXcUViRVU0SElaaEJWRWlEY3YvTG5T?=
 =?utf-8?B?Qlg1YkdGVllRa3UweE1iUUdpbFVUODVTSzV0N1M5SW02bHZpeW53bUordGtw?=
 =?utf-8?B?MWMxMUJRZHAweGRTQnMrMTZ3OE9tVUNkZGJ2S2ZVN3RlRzQyNGhPaXZRdFY4?=
 =?utf-8?B?S21LY0dDaUNiRGJDbnVwUWpXWDhudHBFRU9SNS9XeTlqakNOOUlENlovL1Jx?=
 =?utf-8?B?OGd1YVdiTE1HVHpjaFRzY0FTWEw1TGdDOXJMa3NiL050V0RaSzFkVzVoNTRx?=
 =?utf-8?B?Yk9VdTgxUXNNeWZBeDd3TkZ4b054RG9PNEJOMzlrcUxUczI5RjF0RTVDa0o3?=
 =?utf-8?B?YmxveGRjUnIrWFNPTWQ1WEZXRGdDSEhRTThSQ2k3RHBOeVZsOE1STm5GWGJN?=
 =?utf-8?B?dlVBK2FERXQvV01hSGR3NnkyT0hTa0tJcHpuQ2Vmd0JpT3NJbE05WmY0OGhh?=
 =?utf-8?B?Z2E5c3R2ZXIwR0NJZVNweVBYcjhWMzRJZjlsZ01mNlFTTUF0b0cvZEhlTFdX?=
 =?utf-8?B?REF6by9zUE5oWlVJbXA1cTFzaEF0dzJZcE14WW5LZjAvYUsyQkFQS2tMS0wv?=
 =?utf-8?B?QXdzSXB6ZDRWWStzL2xvdyt1ZXJrRU1kRGlHYTMyM29NcHNqRVlrRkhEQXlK?=
 =?utf-8?B?VDVKeEpZOURBdkpQV2tDMU15OU5Yb3dqNkNIMTZSTnZ2VXBwV0Rwc0t2SjQr?=
 =?utf-8?B?QlhtZWU2UE5aa3JBQUtVQkFZajlpL2JkUFNaVFJTU2hET0piU3g3VnhBaVk5?=
 =?utf-8?B?K2sxTjZ3TGlnU2RWY1ZYOTd2aWJObTJiR1lhZGxaYWVPcVVKQWJRT3MzMWtP?=
 =?utf-8?B?VUZHVmFsL0ZSdk45SUhiV1BTV0Y4VjV3bzF5MkE4UTIxaFlWSTlpSTJ6UU5E?=
 =?utf-8?B?am5rRnRGMjBqeEtWYTM2TkVaV1ZvUmZVcm5YcjlTMVgyaUorMDhEOXlFY3d2?=
 =?utf-8?B?dU9SZkFnWEFPYXhueTY0ZE95N2R1dG9FQlpHNmdIQklaREZmYUVnZEVlS3dJ?=
 =?utf-8?B?SE5ZWTUxRWg2R1kwZHlBRVVMTTIxZ1BEN0pzYXl5OHlONFdIU1YrbnZjME5J?=
 =?utf-8?B?T2lCNlp1RUU4SFYwWVVyeDdWKzJIanRrWUJ6aTJWdi9zTU5xOUJWN0wyME9o?=
 =?utf-8?B?b1FlWG9OZDZncElicHoxY3pvVUVmRkVFMTJ4c0RRQkk2L0FhTm1VTGkyUC9X?=
 =?utf-8?B?VlVvVzBtRmRhQkpGNHRGMHRSTythM1lXelluYkdlY2U5NVowczZBbElmZzN1?=
 =?utf-8?B?N2lYNWIzd1IvcWNScWNvc2JCeTdCanMzZnhWZ1RBVjE1UEt3V0NSNVMxdGp2?=
 =?utf-8?B?YzdoMlNEd2tJTGozVUVjTWt4YlFnVFMxaWhrd0VzU2d6SGs1VmI0Rks2d29w?=
 =?utf-8?B?RWRRQ2xwcVR1Y3JOVW43VUNheVpHZ1FVa1FPT1B5N3pqU3c1QzNhTjIva1ZR?=
 =?utf-8?B?S0Jqa2EzM1hDYlR4QldaUTBmd2IwR2JNWHlaZ1o0RDBZVEQ5WDlrVDk1MkZ6?=
 =?utf-8?B?SlRlZUJWN3I1QVBFQ3FLMncyZkhWMnBMdVJtMEwzZHNPdmVtdXFZck1uRGtq?=
 =?utf-8?B?MUFHd0Q5V2VzL0ZDNStVQ25Ha3U5WmJ4aW1jQVNpMi90SUFpSjZQdFpyS3Nw?=
 =?utf-8?B?aFJoSU93a1haUTdmT21hSTl2L2lyUzM3dldOQjkreGR2UHVURTk4ZVFJRVhQ?=
 =?utf-8?B?aVVFSFZuTnFYUEpNQ1NzejJjNlNhdDd1SWNtWU5MeTB6NnhaL1dLYWV2NUtC?=
 =?utf-8?B?Q1NDajdDM25XaU5tU0VPeTZZUW5FUHFvMVByY3hzN2g0SHEyRmgyUXhOWjcz?=
 =?utf-8?B?YmRnOGtPcWh5RUhjaG5ON1g4WDJXOWFKZEtEZVQ1ZVNmQ2xoSHNQbDIwekIw?=
 =?utf-8?B?OFEyNzZTM3FoQXE2NFN0R2VleFlCZjhEZ0JwV2FTTXp6cVdWRFNDbEoyL2V6?=
 =?utf-8?B?QlIzT21ycUhwRHlieE9DOFR2K0Nmb2FJUjg3dzNqdGNRUTJNK0Y0dTVDbjVW?=
 =?utf-8?B?YWVrVlA5K1JLTElydnBmampFWE1QL1o1bklXT283a1pRQTBhMGF4cWJ5TWp4?=
 =?utf-8?B?bGhaN2FCT0N5aGM2RXZrNllFc1VTZW9BZUd1Z05ZY2Jhc3hDS1VMZ1ZPNncv?=
 =?utf-8?B?aWZ3dzBMV3pDaHhQVTBwb1JNMWkxVTRUeENUUjF6YjZ2OVJEODFUVFZRVlZx?=
 =?utf-8?B?N0ZVUkQvb3JHajFOMWVEdjArdExxbjc3RW44SHVncW9mczJVZm1lMFlCL2Jq?=
 =?utf-8?B?Tkl3b2JEOEVYYThRVzFBV1FzSFFpQWx3Q1l5TDFJaWI0UkZxOW4zYmhFTG5u?=
 =?utf-8?B?M1F0NkhoaTVINmVqZnZPWEIrUDRGZU4vWXUzUWZtcW9JZE9uaTFjTnpoU3lQ?=
 =?utf-8?Q?VUWAJuAZ2nGhGW2glTWXkPZDn9mDvmy5x1S4aCW1Pb0OY?=
X-MS-Exchange-AntiSpam-MessageData-1: mGYsmYQH8q7uUg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28d7eb61-17ff-4200-8d27-08df18ae00b0
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB6873.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2026 13:32:52.6597
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N5lqyN2ElJdqyvVJg0K86zgIf2h3/bMG6I91PKYp/Tz7lfm0BnRSohVDgiCfwW0IK1gPkbpJ/wsGa+T87cxTqw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5732

On Mon Sep 21, 2026 at 11:38 PM JST, Bartosz Golaszewski wrote:
> On Mon, 21 Sep 2026 15:12:01 +0200, Kohei Ito <koheiito.dev@gmail.com> sa=
id:
>> Hi Bartosz, Alexandre,
>>
>> Thanks both for the feedback.
>>
>> On Mon, Sep 14, 2026 at 04:36:48AM -0400, Bartosz Golaszewski wrote:
>>> On Mon, 14 Sep 2026 03:41:29 +0200, Alexandre Courbot
>>> <acourbot@nvidia.com> said:
>>> > On Sun Sep 13, 2026 at 5:46 PM JST, Kohei Ito wrote:
>>> >> Hi, Bartosz,
>>> >>
>>> >> On Thu, Sep 10, 2026 at 12:37:17AM -0700, Bartosz Golaszewski wrote:
>>> >>> On Sun, 6 Sep 2026 10:45:51 +0200, Kohei Ito <koheiito.dev@gmail.co=
m> said:
>>> >>> > Add a sample driver to demonstrate the use of the Rust GPIO APIs.
>>> >>> >
>>> >>> > Signed-off-by: Kohei Ito <koheiito.dev@gmail.com>
>>> >>> > ---
>>> >>>
>>> >>> I don't like samples as they rarely get built or tested. We seem to=
 already
>>> >>> have kunit support for rust, wouldn't it make more sense to impleme=
nt a kunit
>>> >>> module for rust GPIO abstractions? If we don't have provider abstra=
ctions, you
>>> >>> should be able to reuse gpio-sim as the GPIO controller for testing=
 just by
>>> >>> instantiating simulated GPIO devices.
>>> >>
>>> >> Thank you for your suggestion.
>>> >>
>>> >> I assume the kunit module you have in mind would be implemented like
>>> >> `gpiolib-kunit.c`. Based on your comment, I agree that a kunit-based
>>> >> approach is more appropriate than a sample driver.
>>> >>
>>> >> However, as far as I know, we don't yet have Rust abstractions for
>>> >> platform_device registration and software_node, which are required t=
o
>>> >> implement a kunit-based module for testing GPIO consumer APIs. Given=
 the
>>> >> current state of Rust for Linux, I think creating a sample driver is=
 a
>>> >> more practical approach for now. I would like to consider migrating =
to a
>>> >> kunit-based module as future work.
>>> >
>>> > The problem is that this sample driver never probes, so in effect it =
is
>>> > only ever compile-tested. Without support for the provider API, you n=
eed
>>> > to include a small C fixture providing a GPIO chip for it to be actua=
lly
>>> > runtime-tested.
>>> >
>>> > Doing the same using KUnit would involve building the `gpio_chip` usi=
ng a
>>> > bunch of unsafe statements working with the C bindings (which would t=
hen
>>> > in turn require `gpio/driver.h` to be added), so I guess we'll want t=
o
>>> > wait until we have a proper Rust provider API to go that direction.
>>> >
>>>
>>> No, I was thinking about the gpio-sim module which is implemented as a =
platform
>>> driver which you can describe with a software node and then register to=
 create
>>> a simulated GPIO provider against which the consumer APIs in rust could=
 be
>>> tested.
>>>
>>> To that end, we'd need to just register a platform device from rust and=
 AFAICT,
>>> there are already APIs for that, except for the software nodes.
>>>
>>> Bart
>>
>> I looked into this further, but couldn't find any Rust abstraction for
>> registering a new `platform_device` (no file contains a platform device
>> registration function such as `platform_device_register()`,
>> `platform_device_register_*()`, or `platform_device_alloc()`/
>> `platform_device_add()`). So, we can't write a fully Rust kunit module
>> for the GPIO consumer API, at least for v7.3-rc3.
>>
>
> Right, I must have misremembered this.
>
>> The best approach I think is a combination of a Rust consumer driver and
>> a C kunit module dedicated to testing the consumer driver. This is
>> almost the same as `drivers/gpio/gpiolib-kunit.c`, except that instead
>> of directly exercising the GPIO consumer APIs, the module I'm suggesting
>> exercises them indirectly, through the Rust consumer driver.
>>
>
> Can't you just call a C function registering the platform device from uns=
afe
> rust?

You should be able to. It's a but laborious, but better than not having
tests at all, and acceptable as a temporary solution IMHO.

Of course an even better solution would be to provide a safe abstraction
for registering platform devices. :) I don't know exactly how much work
that would be, but there is already a `platform` module, so supposedly
we wouldn't be starting from absolute scratch.

