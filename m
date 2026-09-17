Received: from pdx-out-005.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-005.esa.us-west-2.outbound.mail-perimeter.amazon.com [52.13.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BCF9372662;
	Thu, 17 Sep 2026 07:48:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.13.214.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789631318; cv=fail; b=JpZvWmN/EveL9nz+lPXkOkRH4zHjqmpPGdxocgVp8fYi9i/QiOuCtZPjkQ/ojKgqUIKkDrkydrst1SfeYPLAFYejI3gghla8rEIQ2YO5XwDfL3NIsJFcJd9Sl4BdLaDd6FPrXiVIvZ0cbhOtFA9pMCN6/ckZ8YP3/gCtf4Yi9o0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789631318; c=relaxed/simple;
	bh=d7N1mH9z+GW8vZ2W9IPMhNPEZrxkEC1dtuIkaNHybJ8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=K3CGIzNLhclt9J7mz+g5W+bbzcAkEqEEJTtIRRlCQ7bSWi/nXsGRCCLddnqs1y1DrFcSwbmMykjV3ay46o1nCL0GX4Cass6LFs3bz6MoMiBHsoH6suYEBBlL4smn6xS3eQkXi5ffIoY3LYHUplWRNG6fUal7z83IqYZl2NvyLqk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=n51+bXxN; arc=fail smtp.client-ip=52.13.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="n51+bXxN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1789631316; x=1821167316;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=d7N1mH9z+GW8vZ2W9IPMhNPEZrxkEC1dtuIkaNHybJ8=;
  b=n51+bXxNCYoO5g5z321ABRU1Dcx68N7w7Nc63V0wxVX5Y7VeBm2hsm3g
   M7c4oaBPXOYMK9pZZ4h6W/4Lk/LbGjh5piN+WmqC+oB3rbub3iH/cx4bZ
   gKANu9daA0GFIdvYHxWktBF8km0BiGSC84QDrJOZorQcZnYp0sKa7I1YW
   3yBlDMQ7N590wd0VoY1K+5Q/pl7FF8loG4bu66TXi5vZKCTZak64C6pPf
   r9AoaPekpghtTn6sS958tDgQvx9bdNSsyT7UiPDHc/aqEe8LjEuHqwfEE
   eM+cneecclwmVXGUKI00XXTwpUGvW7GYdB/uMSpI6tq0R/nwGlGpH78H/
   w==;
X-CSE-ConnectionGUID: 5mzQqvpMTAa27SL6lI+qrQ==
X-CSE-MsgGUID: RCgCSnxaT3aTm+ROrxCWHQ==
X-IronPort-AV: E=Sophos;i="6.27,103,1787011200"; 
   d="scan'208";a="28880001"
Received: from ip-10-5-9-48.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.9.48])
  by internal-pdx-out-005.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 07:48:32 +0000
Received: from EX19MTAUWB002.ant.amazon.com [205.251.233.111:27618]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.16.195:2525] with esmtp (Farcaster)
 id 0c47cadb-0a27-4b39-9b68-8d1123109c9c; Thu, 17 Sep 2026 07:48:32 +0000 (UTC)
X-Farcaster-Flow-ID: 0c47cadb-0a27-4b39-9b68-8d1123109c9c
Received: from EX19EXOUWA002.ant.amazon.com (10.250.64.216) by
 EX19MTAUWB002.ant.amazon.com (10.250.64.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.46;
 Thu, 17 Sep 2026 07:48:32 +0000
Received: from EX19EXOUWB002.ant.amazon.com (10.250.64.247) by
 EX19EXOUWA002.ant.amazon.com (10.250.64.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.46;
 Thu, 17 Sep 2026 07:48:32 +0000
Received: from PH0PR07CU006.outbound.protection.outlook.com (10.250.64.206) by
 EX19EXOUWB002.ant.amazon.com (10.250.64.247) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.46
 via Frontend Transport; Thu, 17 Sep 2026 07:48:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c/gVwybKQwuENUMsif0kDCk3Imxo2BSUVisBCi8V1kUb7rnlNamKZa41eEJIjpOyrSXESy4HAYHDcLi8Z72uklc8eaz/k0EiIOUjp5ZzT4AGfp3zNybDhF0uR5y1afC3vrcVKaVYE7NKsE/9R8K0KXa9RsbSeIFnXrJMghHFGoQ7R4ZYpKrm8YYf65bDns8MsLUPhxaxqqwQI8EvDI170rEvdEgJVk4Tu4baA4Y51GmLaxOFuSHkRsJRydz9cCXexOuVD54MMv3/iBEMqORt8p0Hc79Yoy0GojoboMQRndYJFzqk5bmzTq3vkmTSn+silMdRjDrPLES7nOlXG6EzDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d7N1mH9z+GW8vZ2W9IPMhNPEZrxkEC1dtuIkaNHybJ8=;
 b=qSGF5rLdqPwxddEw9kGvvcFjFoErrNb9xFdRIV+1IHjo8KInpg2u+UeVw4/ABGqCuiH+NvqlFwbz54GvUiarFqBDmGNxF1dTEqlItyygibs9bfteVx+puLzvT0nBzvC784xKZaSGCRK7ZgwjcHdPYjpp2bEkMF0DTgGz4IxwzkIUdqf7Axrb7LRgG3XkeaVad33m0TXVAqh7kFZKzzibSJ59F5Di/w19uEdS3D/ld5w+OkOMZtLS+JUyk1PNyN6wnGuFa0tcZLD1ZKGL4jGXMO/BKNq2KmkoAokQVf/XZBMws/gN4JUfBxkEmGmwe5tnq2SubBJy8HzJZScaCM9Xsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amazon.com; dmarc=pass action=none header.from=amazon.com;
 dkim=pass header.d=amazon.com; arc=none
Received: from BY3PR18MB4722.namprd18.prod.outlook.com (2603:10b6:a03:3c9::19)
 by SA5PR18MB927602.namprd18.prod.outlook.com (2603:10b6:806:474::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Thu, 17 Sep
 2026 07:48:30 +0000
Received: from BY3PR18MB4722.namprd18.prod.outlook.com
 ([fe80::e307:5f61:2694:b219]) by BY3PR18MB4722.namprd18.prod.outlook.com
 ([fe80::e307:5f61:2694:b219%4]) with mapi id 15.21.0406.007; Thu, 17 Sep 2026
 07:48:30 +0000
From: "Farber, Eliav" <farbere@amazon.com>
To: Rodolfo Giometti <giometti@enneenne.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
CC: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
	Fabio Estevam <festevam@gmail.com>, Andrew Morton
	<akpm@linux-foundation.org>, Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v2 1/2] dt-bindings: pps: pps-gpio: document optional
 pinctrl states
Thread-Topic: [PATCH v2 1/2] dt-bindings: pps: pps-gpio: document optional
 pinctrl states
Thread-Index: AQHdRnjuUZeGYNJw40+qpO6HeDgNiw==
Date: Thu, 17 Sep 2026 07:48:29 +0000
Message-ID: <BY3PR18MB47222E5923622B6831A98316C6B82@BY3PR18MB4722.namprd18.prod.outlook.com>
References: <20260916134744.46354-1-farbere@amazon.com>
 <20260916182641.9768-1-farbere@amazon.com>
 <20260916182641.9768-2-farbere@amazon.com>
 <34ecbb41-0cf9-417b-9562-fc31726d8a35@enneenne.com>
In-Reply-To: <34ecbb41-0cf9-417b-9562-fc31726d8a35@enneenne.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amazon.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY3PR18MB4722:EE_|SA5PR18MB927602:EE_
x-ms-office365-filtering-correlation-id: ced15c47-70b8-4e78-ba60-08df149010ef
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|23010399003|376014|1800799024|7416014|366016|56012099006|18002099003|22082099003|38070700021|4143699003|11063799006|10067099003;
x-microsoft-antispam-message-info: rflRgEUUz+7Dhhjsyfeud0w2AWJxwXL6Bpmvgb4FuSeBRz8GvBCDP9+Wld+YVh40NDKZTSs+9l9+wTI1vhA2yljqjMJzYRjwgBENhrulvWGIDvmPSQV/ePhMgDrtMAUWWi2pJ45AFf3xgfzj3F69zC1mbfxHpCvyYJCtj1dAIUhHYZzXCBEtiz/Pab9cOfBp76ZVdVzLBhil2FUCg5oaYhJtKgJtyaG+9ValMyGNGE1Nl2QNbJa7AwXWtkmB0YP6S3mLvBgzXAeCNMpHfL+T9NMMfPxLrskhPqS8qM1XkkH1OhHB1xjtfaz3oacSVFDZWm+UC2aAzU46Vl0fOPJzeMB3LlSoD8YETszRfADOVSmRq0hy7BRriIKHXdxLGbVsOkO6Zum+UREz36F3UL4jdyUbghiPv7jacDUGDoei9qa+vlPT344MZg2BF6GWPAE8ZLMCK5yVUiTzs7YX619b+8ZcTULmOw70k0J1o9YzTxNVG9bOhowiPz2h+Iz468ViORN1opZv9LtWb7CQ+BoEeusuAjmcKzr+3f1UeGc7V4zqM31dTujmEesd3sjbXNwBF8Tr/Te0rqKbMakLxAsul/x4jK0mmGrbZoKq3FoICUhlNfScS74UjAiPBFhTRtpk/jLtsCfpANEOd1H6MopoA9ST2Ngj5dSS0c5E0PEFi1Jk1ETt0Hs+hXcSvJUqJLAk3uuICr6jGBSH0Gz252vT1cHWFzomS920eeAJdhEZeYM=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY3PR18MB4722.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(7416014)(366016)(56012099006)(18002099003)(22082099003)(38070700021)(4143699003)(11063799006)(10067099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?N3djZlZWc1hUaWlCODV5K1RXTDFZbm9MUWt4SFdWbmRTTGJmOUVDQzZ5SllZ?=
 =?utf-8?B?SHJhRWdCZ1p4cFJOcU9OaXEvaWJMbnFIS3MzYmxQS043Sm4wUG5UUDNNWDN1?=
 =?utf-8?B?SEVwTVdJT1EyS3lVUUNLZTE0Q1MvN2dQaWtjK2p2enBXRTc4M0dnUWRlMHlq?=
 =?utf-8?B?L1lURXo2MlUrbHcyb0tnUFYzVjg1ekpWS213NVhLeWZ0UThLRlcvRnh0NHF3?=
 =?utf-8?B?M2VuWjNOSTNhc0RoQWtKTFJuMjJQK1Y3OXJaY2tCbFliaHQ4aHh4NWNNVzN0?=
 =?utf-8?B?aUN4QWpDcTQ1THdhVW5qRC9LMFZwOHcycEhYdVVXdlRnRVViUzh6RTVxUmVR?=
 =?utf-8?B?S2wwTGRkMFZsam9mbFNvOFIrRkxVMkhNTVdLT0lVVXdvaFZqKzM0Z2hnZm9V?=
 =?utf-8?B?NXg2cXJLME1rRDgyYktTaDAwYS9BdUZhM2tnckNtMVJYRGFDcW9vMGhDcG9Q?=
 =?utf-8?B?c0d2U0tXOHgzUVRwb3R3cjdnckFoakdhRWY2dU1YS1NZWnFBUVdjd3p5MVRE?=
 =?utf-8?B?b2lpeUlqUm9va21mN01QTjlxZ05oWkdxQW8vTEw3SzkxRnovdWJ4MTFQcFN3?=
 =?utf-8?B?aElCU05vOTVKK3VKbTRoeDJBemlRc2hYTTY4NDZ1aHpMQ2g1WTZLTHRaVkoy?=
 =?utf-8?B?MDVJNTlPZkkrYU01WlhrY2F1MUd0YU5NejExQld0dlJIUERtSHA2NDZjdWll?=
 =?utf-8?B?VWhIV0hYNGt4UWdPNDFycVNqRmJibkhNODFIVkE0eXJJRkx6c1hIQmFKZUVp?=
 =?utf-8?B?R3QxcFpWMks3R1l1SnBSc21WVUNVN2FJM0owOFNtbTNXYk1YNE9WOGh2c2dT?=
 =?utf-8?B?eDZhYStXY1Z2Zzd1d1psb2ZHSEx3S09yaHRLTkU2QUNDUjFSR3ZLRlhWQXpQ?=
 =?utf-8?B?ajcwSG53TzBvY0p0dHRSeFVma216U3MyUWZWQ042dnNPVFU4K2k4ZDhuUi9E?=
 =?utf-8?B?dXIzNWtmNVpSMFdFd0IvL1pWRC81YjV5OXpYcVZldm85RzZkRjRwYys3SGF3?=
 =?utf-8?B?emFrV0FVTTI4b21jSGE4NXNQSjVIVFIvam00amQwb2NtanVNWWVxeTgrWEZ2?=
 =?utf-8?B?QlBieWtGOGcvR2JTbE1OVTdqTTU2QmUrREZLY0tjV0NNYXF2WlVJeUc0WG1m?=
 =?utf-8?B?d3R4MFpnTlFrZWE2LzZKMlQ2SDRzSFVleEVmZmJIWG1ZLzRnSWhoVUdpWmVJ?=
 =?utf-8?B?QzRYVUwzZVZGdlpLczdTRzBHdmp1VkRHeHloYTdkaWNhMzVEd0tCS2t0YjZw?=
 =?utf-8?B?SHc0aGxWdU9WcnhFeWlqanU2VldnTmU1NjdROFlQSmNGRUwvVlNMV1AzMktr?=
 =?utf-8?B?SzZrcHB0TmdvVzU2cnZtYlh2QWtwSmcvUUlXWFlWQlNQSnJETmRIcFp4cnZI?=
 =?utf-8?B?cVl4eWRrQmJHTk9EU3FIalU0T1M2RnFnVVBsaU1Oa09WY1c2V1Y3REF2MkhR?=
 =?utf-8?B?dDBwKzU5elVySGlyQ2NhMEd4eUNPNlJwTlRjaWFsdnF5RnlURmwxams4WWpM?=
 =?utf-8?B?WUJtWkg5a3pkMDVMTHl5UUdXMkNyT25CSXhUb3BBbjUweFJPMVZzdHN3SkU5?=
 =?utf-8?B?clJ5MW9XSDRrY2JWNkdnN01XRVJkdXRkTTFzT1VrWlRzdkc2S0gzTXVacFJt?=
 =?utf-8?B?QTVldWVLdVdiY3ZLUVFlTERCUTlmR204NjVISjVkaTdQcitXL3pQVW55SlZF?=
 =?utf-8?B?ZFBxSkUzdXIxZnVxQys2djZUYU9Jai9MSlN5Umh4NE5TUFdheGdBbkNlVXB0?=
 =?utf-8?B?RDcvSnhvdTNYUFNCc0dra1d3UGNXemNxSjkvV0lFeEVnazk4cERQNE02S1Jk?=
 =?utf-8?B?U3kySlFEVDdndXBqaFR1TjloeDkwa3dyRUpaWTZLRHNmZDJraFJZVHRIOVNz?=
 =?utf-8?B?Um1MR3o5OStmRW8vcEtCN1I4bjkxZFpzOW5GYW8xNllWdE8zNHI2VXBPN2E1?=
 =?utf-8?B?WjBoWUJKdHowUk5CWWJ2T0gwcDBnY01aVGRLZUZuUEJ5am1zdDNkQm44SkpG?=
 =?utf-8?B?Q3ROSXVoaVN2anlOeHpEMjgvaG4yemNSQUtnTU1RckxYeGVGcktaeFNTajht?=
 =?utf-8?B?WEdvek5xQldWTlpZMFRmRVVHZ0x1UVU5em5VU25lbS9zaStVV2R1cnVxczYx?=
 =?utf-8?B?MWJ0VWQxWlpCQ2ZSd1h5eVFtOHI5MWRvZDhCUXMyMXFUd2NpaHJ3dys0VmhK?=
 =?utf-8?B?Y1RJVVFzbWxzdGRIQkt3T0FoYW9RUDdPT09UdWhneFdIZWVHczhVSGJWY01j?=
 =?utf-8?B?ZjMrV0lPSVNiM2lCTFRzdzVieHI3MkpISW9uRkFQMEdkb3FCclpQUDE4aE9q?=
 =?utf-8?Q?lEDQrhicaIRKlS74NJ?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: bEkk9jEghxeqXR7gjhsSjqZKcCqf3Szytd8omHcC1o5DAVIhFLGYK6yJr5KJGxf+/dOhPnIcmE+hVvVoUgEDwLNOvYdIVGeBP/ongCoHbxiuLeAOxIYKt1nfHtA5qWgUpAl5i6kulCV+ROQq+PRTcZqb1uTIYqiGBzLssWss3H1d6QIoFTjWnLp3wooB1JtcdK9F5lmqFIdvA/58h1CaNKsJtztwgjecw8nat4FqOgLcjbFa0aTHWgxxxqKR37fvbfOHqmGFLiaxYmOAdJEDipwbgSqp6SzL+kO954hLw6zoEgJLkTSjFadYfu3ut17cuJxmNm0YAzXbYZ2qrt1OKw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY3PR18MB4722.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ced15c47-70b8-4e78-ba60-08df149010ef
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Sep 2026 07:48:30.1677
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5280104a-472d-4538-9ccf-1e1d0efe8b1b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KD845QgJVdOp+L8HYBMqoKCsaoxXndAPvdaPieMrKKDmqsTfgk+liSGFBZsHiRlRzxym1V0NMxYpeLo1xIcLJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PR18MB927602
X-OriginatorOrg: amazon.com

T24gMTYvMDkvMjAyNiwgUm9kb2xmbyBHaW9tZXR0aSB3cm90ZToNCj4+ICsgICAgICBiYWNrIHRv
IHRoZWlyIGFsdGVybmF0ZSBmdW5jdGlvbi4gQXMgImluYWN0aXZlIiBpcyB0aGUgc3RhdGUgdG8g
cmVzdG9yZQ0KPj4gKyAgICAgIGFmdGVyICJkZWZhdWx0IiwgaXQgbWF5IG9ubHkgYXBwZWFyIGFz
IHRoZSBzZWNvbmQgZW50cnkuDQo+DQo+IFRoZSBkcml2ZXIgbG9va3MgdGhlIHN0YXRlcyB1cCBi
eSBuYW1lLCBub3QgYnkgaW5kZXgsIGFuZCBvbmx5IHJlcXVpcmVzDQo+IHRoYXQgImRlZmF1bHQi
IGV4aXN0cy4gV2h5IHlvdSBzYXkgdGhhdD8NCg0KWW91J3JlIHJpZ2h0LCB0aGF0IHdhcyB3cm9u
Zy4gVGhlIGRyaXZlciBsb29rcyBib3RoIHN0YXRlcyB1cCBieSBuYW1lDQoocGluY3RybF9sb29r
dXBfc3RhdGUoKSksIHNvICJpbmFjdGl2ZSIgY2FuIGJlIGF0IGFueSBpbmRleDsgaXQgb25seQ0K
cmVxdWlyZXMgdGhhdCBhICJkZWZhdWx0IiBzdGF0ZSBhbHNvIGV4aXN0cy4gSSdsbCBkcm9wIHRo
ZSAic2Vjb25kDQplbnRyeSIgd29yZGluZy4NCg0KPj4gKyAgICBtaW5JdGVtczogMQ0KPj4gKyAg
ICBpdGVtczoNCj4+ICsgICAgICAtIGNvbnN0OiBkZWZhdWx0DQo+PiArICAgICAgLSBjb25zdDog
aW5hY3RpdmUNCj4NCj4gQUZBSUsgdGhlIHR1cGxlIHJ1bGVzIG91dCBbImRlZmF1bHQiLCAic2xl
ZXAiXSBhbmQgWyJpbml0IiwgImRlZmF1bHQiXQ0KPiBmb3IgZ29vZCwgYW5kIHRoaXMgaXMgQUJJ
Lg0KDQpBZ3JlZWQsIHRoZSB0dXBsZSBpcyB0b28gc3RyaWN0IGFuZCB3b3VsZCBiYWtlIHRoYXQg
aW4uIEluIHYzIEkgZHJvcCBpdA0KYW5kIG9ubHkgYXNzZXJ0IHRoYXQgYSAiZGVmYXVsdCIgc3Rh
dGUgaXMgcHJlc2VudDoNCg0KICAgIG1pbkl0ZW1zOiAxDQogICAgY29udGFpbnM6DQogICAgICBj
b25zdDogZGVmYXVsdA0KDQpzbyBbImRlZmF1bHQiLCAic2xlZXAiXSwgWyJpbml0IiwgImRlZmF1
bHQiXSwgZXRjLiBhbGwgcmVtYWluIHZhbGlkLCBhbmQNCnRoZSBkZXNjcmlwdGlvbiBqdXN0IG5v
dGVzIHRoYXQgYW4gb3B0aW9uYWwgImluYWN0aXZlIiBzdGF0ZSwgaWYgcHJlc2VudCwNCnJlcXVp
cmVzICJkZWZhdWx0IiBhbmQgbWF5IGFwcGVhciBpbiBhbnkgcG9zaXRpb24uDQoNClRoYW5rcywN
CkVsaWF2DQo=
