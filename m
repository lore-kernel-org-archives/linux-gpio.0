Received: from CWXP265CU009.outbound.protection.outlook.com (mail-ukwestazon11021101.outbound.protection.outlook.com [52.101.100.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F8CB2AD37;
	Sun,  6 Sep 2026 13:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.100.101
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788700177; cv=fail; b=hlPuimysb61PYa42Y7vHqndeeKxeFdJHcWRJ96fVkXDYZ7EfshyxPcTj75Frh2d3eYoPfyzx+qrUdTwwO3n1C3Izy4L61v77zrt3j61iKJSc9k2GYRo2iVNpb0OvZg7AXy0KFfrln6PtMacd3cWKtwct8ejjDq/88yzaseqS9pk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788700177; c=relaxed/simple;
	bh=4BKDjb+bowWZPJCCPUvbeqaQs9TZv0150KXUSxQhdQo=;
	h=Content-Type:Date:Message-Id:Subject:From:To:Cc:References:
	 In-Reply-To:MIME-Version; b=nDh0mwYiwFcObynpjiX+UXRS0d/yAUFAiXZFFCO/b6BDVy5epk9clpE7mPrzwYUlm5eFHL9R1ifM0Z6lOM97V4nNxiBvYCL21Uaw3SGkMMwICxaS2NjFN3V04oUcMEI9HnDIf3S3ahktiAKWoD8oTURm8Sj3VP1bMHgrA8llDnA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=JglYVSrV; arc=fail smtp.client-ip=52.101.100.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="JglYVSrV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=doS8vz1Cq7XxtS4V9yXJLabsaqCGo4S4MZPjW95YugS3dZvbVkdIdll90NyqY79a2DqLQcUvGl/BSv1EqM64t5Uy6ezJWjxV8Sbh90kz797vUAMjYEv1QGZeScAJz/TH6N8vnN2G7v9Lmh/umLtE17F4zkyQRVoz7qPL87AogUdJAkymzyvH3VxIWOQM4CSVpMq6FHDHIc5tnVQFyDCeG39V1VbT8aP8IJG9PsJBAbjfmv5AUzEGC1aOcTDnTvkKH15Y7cTlnlyFHmlPoHyFza4Q2f5E8Bp5AoBL+6aS1Rq/cfqDG9dqgxnIAQB/PNN/4inSBrXtzSTd8sbynrkS/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z832ZskXm9VaBKjM3s5eXC5hBWBSUXOITCd6SDnkuG4=;
 b=M2fLrba9C/Ev60/o2ulMRWGZ3XSG/8l31qg+6eoHLZ8XI3sfmPdf6TY2p40rhgKbiODjokVbh44YnPuWFcume9CwOoXxTg7dweM2nF6ucrrd6jbCLTYHx4j4NMKQKqsCgBesI8/K9qQI217BnKyKWtyrDBkvXfkSNgNQI46yaVqOb4mpklWI4JL1lllIVcNBf0muV0aDhZ9YlEZ2pBw2VEkmgXpg5zMEVKbNTCMKzY5aTx0uG8y+T24ye4oSjfk7bsxLI70reKsP5mN7ago6wfwf22hYjkKOBfYniOOg6YCPJ33vWS9B2xp51kp8lN2c7FCiAoNkVGVoh/pBy1ia7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z832ZskXm9VaBKjM3s5eXC5hBWBSUXOITCd6SDnkuG4=;
 b=JglYVSrVSnAjgaoplDKHBLZ7aVGhONYduUhoZd7PMHLuwOKz3gyY5EbF7v5LXEE0cI+Vh39+iAj+M7FKfBYQrTUJlN+CbQn1OA3VhfziFs2Uc7SlUceuGegFeynE4FN2p3cXEVr3MNFaAD8oZGg6ZQTs3GBiz23jYphfrPhQrbY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4ab::19)
 by LO2P265MB3481.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:1a2::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Sun, 6 Sep
 2026 13:09:31 +0000
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1]) by LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1%4]) with mapi id 15.21.0382.014; Sun, 6 Sep 2026
 13:09:31 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 06 Sep 2026 14:09:30 +0100
Message-Id: <DL89AIIO0EQF.3U7UGK7JIRZ72@garyguo.net>
Subject: Re: [PATCH 1/3] rust: gpio: add GPIO module with common definitions
From: "Gary Guo" <gary@garyguo.net>
To: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>, "Kohei Ito"
 <koheiito.dev@gmail.com>, "Linus Walleij" <linusw@kernel.org>, "Bartosz
 Golaszewski" <brgl@kernel.org>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>,
 "Gary Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 "Daniel Almeida" <daniel.almeida@collabora.com>, "Tamir Duberstein"
 <tamird@kernel.org>, "Alexandre Courbot" <acourbot@nvidia.com>,
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 <linux-gpio@vger.kernel.org>
X-Mailer: aerc 0.22.0
References: <20260906-add-rust-gpio-consumer-v1-0-24d192f93760@gmail.com>
 <20260906-add-rust-gpio-consumer-v1-1-24d192f93760@gmail.com>
 <CANiq72m6YZhqzE7GWEakmsZ35QN5UF_HTcVBavKxbq8cV7yk6A@mail.gmail.com>
In-Reply-To: <CANiq72m6YZhqzE7GWEakmsZ35QN5UF_HTcVBavKxbq8cV7yk6A@mail.gmail.com>
X-ClientProxiedBy: LO4P265CA0116.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c3::16) To LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:4ab::19)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOAP265MB8560:EE_|LO2P265MB3481:EE_
X-MS-Office365-Filtering-Correlation-Id: da75f2c2-fff9-4ed7-c3f2-08df0c1816f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|10070799003|366016|23010399003|1800799024|10067099003|56012099006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	ahDkNPDZCjiAWWANBVTZx0I59Dqd9Lqo3b4MqOWdJjO2jYoCIblP58xNrsepypTBKez5nroNUt9QslZlD5oJAx+BtzzHroODFT7UCA++LJ3+oP1MceB+e0cb2S5iPpTTW5QwVj7UyTBVkMT0Sa89st0BUmr2Hhn9Z508naeaCBazfduCf0WWBzCO+uzPA1v9R2lN0LYSR5RIPp9i1Ah1cjBEdTV0wFB7PczEhb+mvh84S6gAdgiIsuDyfYSJSjw169C/BU4o2gDPQLLryqOpwXsvI0cuXQKXZ6TbcXsEBqsnepwyEiJN0GR532d3QXfYE+epk3jR3wOplL9NDcTeVhHjfN7SYGO6UORunSfvngGGKC9bHCMb9rovXSW5mqX6g5hLXmTo5c8ZICbUfzRE3gxLZZU/ftYN/3zEa022w+gXQcROfQvk4CGSbKfHwVt78tWkFIC3x5jZp1/TM3l2nBXNABLeVJg8ifolJlA02FE13rWi47lg/9H/EUd5eW2orDvY8AwFQDD3inS2ztopPEnVq0yrAkmgU6fRdRDVLKeiDWyhzYHVHpvrGb1fxrC1JnQuGTj0U1UbtRESXlPN9VrG/ceGE+J/mMzyKaMurXOgnl1IxBMzGRqQs1c88/6CHNnT98B3EvDwR9ZPKevcfb3dDkaZEzG9u/bKXDxLC5I=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(10070799003)(366016)(23010399003)(1800799024)(10067099003)(56012099006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RWprU3JycUlGQ0dkVk1VVDc5SUl6NU5PU2d5bEVxNDJmS29aWGNvYXhhMVVn?=
 =?utf-8?B?VEJXMVRXZjAyWVNNcDlRcVA2cHpzazN2Ylh4VnJOVjUrZnJsN0Z5WUFLcmds?=
 =?utf-8?B?UXVvQjJDUm96TmdvVFpzbmJmdVkvS25iWWlpd2kvYnk4REdGZEdRbVdsbTEr?=
 =?utf-8?B?SCtuMkt5WmtyRktqUkl5UHpvRXcwcHUvSnpsRHVIUzRiS3BWMjlObEd3Z05l?=
 =?utf-8?B?ZG13UiszYnVpNWltRmRnalcwM0liNXF3RHJocjRGYTlrRUJvTmpJN1lzVGkz?=
 =?utf-8?B?OGNuMDRaRjJLRnd0cjRWcDFrK2dMTEt5WlVtUGxBUzVXQ3VjdU15NkxJSS9h?=
 =?utf-8?B?NDFacCt0a3BlMWNrOHkzdkJqTkxDbE42VTNWVXMvN29OdmZjM1lyeis4WFgr?=
 =?utf-8?B?N1RwWFJVUFAyNEU1Z3RUczJjTjlJRWpPaG42dE5nZXNHRy81RjVKbS9uV0Zy?=
 =?utf-8?B?aFVjZTJxSHlDSWJzY1dQMm5CUERqczBZRVA4Wk5IbFlheHdHaEVheS9XZkxx?=
 =?utf-8?B?WjJ2c21HS09JdGVwOVkvUXBwRmQyVE1Qa2NZR3BxdnJuK214c25MaUJaaXRw?=
 =?utf-8?B?ek5FVzdFMDY3SUhaWUt2bmVtQ3gwcWlEWHlQNW1hTXpDWk44ZVB2aHBNOXcr?=
 =?utf-8?B?OXZGdWk1SWV4c0Zld2ZqT29ZajVWWmdwVUNBNSt4SmRaZ1hyTmtQMHJPRHF2?=
 =?utf-8?B?NFdKOWlXajNEL0hHOEhzZGxCWDM5bGFnbGxEUStxSWx1cjV3WGFFOFRmbE1z?=
 =?utf-8?B?a1lzTkgxYXFPOUg0b29IbWdnVG5nZksxNE16QUpEY3FZYXVrWVFZOUlCR2lS?=
 =?utf-8?B?OUtsMExZb3F5SFBzU1VxSCt3VGU5Nk51Y1dhN0pLZGY1dGR5VE5XNTFJZkRw?=
 =?utf-8?B?eHMyb2E3eGdjMDE2ZjFUa0NURUNIcTM1UzhpdXlBSEhmL2hvam9LWDArZXQ3?=
 =?utf-8?B?TTlHdWdTL1orWTVEb0NZTWR1TEx0T3ZWaEY4Wnl3K3JpM0tibGQ5L1hNVHRU?=
 =?utf-8?B?c2NuMHhJcmlWUnlFMVJQTURzY3hRTVNIQlFkWFpxMURaMU9scHNBZm9oRS9i?=
 =?utf-8?B?YllBeG5Ec0xjNkVEN0RYMENBbFVrbVNUNU5SWWIvd0hyc1crVFB4WWY0Z0pO?=
 =?utf-8?B?Y2ZaTG9OdDFSUGR3SkhEbjdCZms5Yk9BK0FWZzQxZXI3OFlaL01tYmVrTmRJ?=
 =?utf-8?B?VG16SVBRMEJmeVBGR3R3aUZkNXM2ZFNEZTFUQWZrMzlKTmVKbUN2Z1pzWWJC?=
 =?utf-8?B?bHNCcXhvcS91c1pxcnFQUUpNZ0xMdkcwd2hnM0hzcFpNOG5NVHpjUFJnSXBk?=
 =?utf-8?B?YmtzU2YwRC94MXdWYXBPOXYxRmYwSUdCTHg2Y1pud2Y4QU5VNEpWZ3hwUCtK?=
 =?utf-8?B?L3VZVVNldzBObndaS2k5WXhJWWo0V2hSd090V2pRaDVrcU9aYVJGeEI2ZWRT?=
 =?utf-8?B?ZHppNVZaVTluNEhkVGlHa1ByZkhlT1N0eTJnbUVwdlE2VFJ4VG5mQ01aeTJT?=
 =?utf-8?B?bHU3NUFCRlkvd0t0OW9JRHk4VUM3SFkrOEdFSlg1VWR5YzJlbWhZcmJMQ2VB?=
 =?utf-8?B?dnAybUtOQWdrK0djWWFacDBJSGJqOWMzK201WExaYjljenNHZUpHV1ZMcmRZ?=
 =?utf-8?B?WVlZcy85OEkwOUwzQ3FOUktaaW05VDlrSjE1akJWVm90aU5aYkZhRHBJbnFz?=
 =?utf-8?B?MjJjREloLzB4Y2h1WVBmbUg1Yi9UYzY3TXNsUXhWd2QvZGJWeVZmWG1Wbysz?=
 =?utf-8?B?TVg0L0pQOEJnalJWMUxkSHZScTlwNlZpUkYrK1V6TFRtMmFWVWEvU0x1NEpS?=
 =?utf-8?B?cm45ZmowNWtubnA1STJEWGJGSXRqb1B4bHJVWUpqbHBycGhCVjhsOW9yMytQ?=
 =?utf-8?B?cXY5bVkwY1BsU25DVk1FOGFJNW9meU8zbmVOOTdLMThkVFFLTDUzVWtFTW43?=
 =?utf-8?B?RWJ2NGgyQVFmV0JmZEt0K3ZGd3VNNUdxRTA5Z3plRVdUVVgxTHhFeDFMUTFv?=
 =?utf-8?B?b08rQ2lZam9FaCt1a21lNzBtNHN5c0R0MEk0dTU3QklheWRFWE1Ha0xYMmVQ?=
 =?utf-8?B?NUtneEpqazR5NVpXK2t2WElycWNGNFNSbzgyQmp6UTdQQzJLNEZNYld3dHpD?=
 =?utf-8?B?a3NUMnZVZkF5akVTc3lsRVl1eFZseTh6QVFISGN2akNBOGMvVkQxTEs3N085?=
 =?utf-8?B?T2FBMTZGbTAyK2J6eHNnR2djZWlSVFRtY3dobUViWjVRWXJtYWxwSjN3aVFQ?=
 =?utf-8?B?RTZOaGNsSFgvM3ZEcHdqcGd6TUp2Sms2Ujkzc3d4cU9RbGVkQXpEbW9DNjBj?=
 =?utf-8?B?MmRYeDh4SHdZNTRMWU1hb0lGbXlxUkhjc2ZRdWt6TlFrS0NxcW0zQT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: da75f2c2-fff9-4ed7-c3f2-08df0c1816f1
X-MS-Exchange-CrossTenant-AuthSource: LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2026 13:09:31.4208
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e7kRrenqWp+682Obe8MlMjBf9YbYleLV9rKAilfseY/xoAA1e93tM+qZ02//qllxzRvCrSckNetJVvMtchBo+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO2P265MB3481

On Sun Sep 6, 2026 at 10:56 AM BST, Miguel Ojeda wrote:
> On Sun, Sep 6, 2026 at 10:46=E2=80=AFAM Kohei Ito <koheiito.dev@gmail.com=
> wrote:
>>
>> Add the top-level GPIO module with minimal common definitions. This
>> module is the basis for future Rust GPIO extensions.
>
> Thanks & welcome!
>
> I see you Cc'd linux-gpio, which is good, but the GPIO maintainers
> should be Cc'd too, since they are the ones that will be deciding on
> this -- doing it for you in this one so that they are in the loop.
>
> By the way, it is nice to see GPIO again :) Now that some years have
> passed, how does it compare to
>
>   https://lwn.net/Articles/863459/
>
> ?

This is possibily also a show case for all our I/O projection and register =
macro
work :)

Best,
Gary

