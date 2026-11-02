Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=13.216.7.111
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793627926;
	b=YXQTCjJBsgw4NEKEomqcoRVFRQ88fadvZUGAU6OZX0zI07PW6a9pXEgJvTpfZRLITSnu
	 rahc+6rLG4gIZwt235pVKH6DckxxAfhHSqP3JPYMV4FfwcxwQzs32yZlfjmkPKcY/LZDm
	 ZtW60qm032fidIrA+THxY7QyD6pnzJQoGJb5Wn+lheyfLs3tajN1oZeTM3luug15mSJCY
	 3KbA5L4qteSODJA6ANyd1TUXFALztwR1lph6QEkQ3wCDay8RHAiInUBYoAcOM3p0KGxMu
	 y5zDOIs5+QV+Q9QRdEHT7wmqLC8GAlX6f7R49v52cFvQll04NaPiT4w6iNv8DrUaazQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793627926;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:Received:Received:X-Farcaster-Flow-ID:Received:Received:
	 Received:Received:From:To:CC:Subject:Thread-Topic:Thread-Index:Date:
	 Message-ID:References:In-Reply-To:Accept-Language:Content-Language:
	 X-MS-Has-Attach:X-MS-TNEF-Correlator:x-ms-publictraffictype:
	 x-ms-traffictypediagnostic:x-ms-office365-filtering-correlation-id:
	 x-ms-exchange-senderadcheck:x-ms-exchange-antispam-relay:
	 x-microsoft-antispam:x-microsoft-antispam-message-info:
	 x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:
	 X-Exchange-RoutingPolicyChecked:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
	 X-MS-Exchange-CrossTenant-userprincipalname:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-OriginatorOrg;
	bh=xWRWy9CPvKeyPry2QZCCBgclWQ1Pn83P+YbWzbP9jMI=;
	b=WS1fftMBLFL+oQn4eU110OdZ6NbyWNt3fwMCCCG10VgN5PYkFM7QLzU9hmMbybF34ZWt
	 ODSNWzkqANmICMmmi5szhgcGpin/GJOKjic/nvxXKUgXRjX0Cz9oclb7wwEJ7Qy2ksHBQ
	 Xxt7/aC3T0IoURH+jI/l/HE4hAM77fX99Jre9Aye5Am4ne2Hlbjrk9EE9/hAB9KEgHaBP
	 eoylh/fRDsV3lxhgUCmt4VITOZHfB6vjkAqkXNFC4/jfQwUw4hHx5vQcocV0iVHJeqAKG
	 9Jc3EcsPyPZhA4sYWtbFz/QY2koUZUNjKbTm6sm9RAUy3NPQYFvUjg1Zpa5G79aSzbw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amazon.com;
	spf=pass smtp.mailfrom=amazon.com;
	dkim=pass header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=Ior1oR4f;
	arc=pass header.oldest-pass=0 smtp.remote-ip=13.216.7.111
Received: from iad-out-003.esa.us-east-1.outbound.mail-perimeter.amazon.com (iad-out-003.esa.us-east-1.outbound.mail-perimeter.amazon.com [13.216.7.111])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 848F160A3818;
	Mon,  2 Nov 2026 13:58:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 848F160A3818
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=Ior1oR4f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1793627925; x=1825163925;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=xWRWy9CPvKeyPry2QZCCBgclWQ1Pn83P+YbWzbP9jMI=;
  b=Ior1oR4fy4aH+j4ARF92V4eap0xn3mLZjsIkmQe1jAk++UW6hQuKRLnO
   q/AGajcSfvFX3Pv1jHhLdLidF1gqJZGVBXgUd6IGUprDpv1atrz5tT51q
   LUxVZqFExTmHsKNwpToQUoa0yGH50Cbd3MGUvKSKdLeIAuavBbERQb3+S
   pQTrYdf7bGzL1O+/vkdvSAMQIm67eHwmsCPInBwykyxG+5WGBNTx/COf6
   66JSBUQOZQJBqkDH4IpwBN6PqskOqVNUbVmuK4n3CnnY6laTewRo2WAVQ
   vKcP3IW6Ua6AVykj4sEqB0i2S+oiuQ4RoVPbZbvkMRdON6lA3kcpsjcbd
   A==;
X-CSE-ConnectionGUID: XVt58AR0Sr+b6HDhGP4e6A==
X-CSE-MsgGUID: aPkRSKeLQ6ur39RYWXUfEw==
X-IronPort-AV: E=Sophos;i="6.27,191,1787011200"; 
   d="scan'208";a="30826503"
Received: from ip-10-4-7-229.ec2.internal (HELO smtpout.naws.us-east-1.prod.farcaster.email.amazon.dev) ([10.4.7.229])
  by internal-iad-out-003.esa.us-east-1.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2026 13:58:41 +0000
Received: from EX19MTAUEC002.ant.amazon.com [52.94.133.130:28250]
 by smtpin.naws.us-east-1.prod.farcaster.email.amazon.dev [10.0.29.208:2525] with esmtp (Farcaster)
 id c6de0066-d8ef-4eec-bf00-2eaae2de64c7; Mon, 2 Nov 2026 13:58:41 +0000 (UTC)
X-Farcaster-Flow-ID: c6de0066-d8ef-4eec-bf00-2eaae2de64c7
Received: from EX19EXOUEC002.ant.amazon.com (10.252.135.179) by
 EX19MTAUEC002.ant.amazon.com (10.252.135.253) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56;
 Mon, 2 Nov 2026 13:58:41 +0000
Received: from BL2PR08CU001.outbound.protection.outlook.com (10.252.135.42) by
 EX19EXOUEC002.ant.amazon.com (10.252.135.179) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56
 via Frontend Transport; Mon, 2 Nov 2026 13:58:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qYTCSd3aITZoVJuILC8iEJFkaP4Cm5XWjMdz6xWMhUUQsIjsPWd2KlCeBg2rtzYdHpdjcGvP/8cwQq1GPaszyWh+A1/yfbB9bvuBChcBucdGXs6qdPi1xq+eCp9pptNsqONSm4MOaLh3G3OqoSoksSPokZFQHQS0PX2Ma7Qn8BDRpobT9VGFYn55BSbR+fUO9mMvM4BAuXgOhIoxRtNtxvJEJKPZPyHbo3a4PXz0nQuqWauMPcwAH9cz5tXrS6OUqjTQ7w1+EjO965w80aq0tX7Po14fihgm9+4mkZMzYVGgmgagRiOhtkBmVuo9FwaSa9Bm0Sx77QcVv/tbcDhHKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xWRWy9CPvKeyPry2QZCCBgclWQ1Pn83P+YbWzbP9jMI=;
 b=mDPB7iyZK6LAenX3CaH1Hrw4hdclbg3/FbBbAo+QDCNePI+hca2wAb7wh41cNB9jOu04SJGyDMMX0ZhIkQ8fI4vCe6zbPu9R1PuxPxuE7Kstmpk9yKryzB5WfvS/6RRbOcATCcuiu/I8a0CiFVInPU+c+PJl5ZQ3BvzvPiYRz6WNNXOwjCgMPrd/v3m0tlxrCUVGdydwedfKRCSBDiI3/n1CdEP9asLFlWc1WU3dtGUq/96V7IQb1/W7zm7dZBlOcHh4t9sxPlXN6dJ73HFF6oavl3FjDrKSwbK5qDR4RGn/+EE4wcP+hIPA77wB0jv9heGPrbj8kT0mPQtzIPN/LA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amazon.com; dmarc=pass action=none header.from=amazon.com;
 dkim=pass header.d=amazon.com; arc=none
Received: from BY3PR18MB4722.namprd18.prod.outlook.com (2603:10b6:a03:3c9::19)
 by BL1PPFA76386D1D.namprd18.prod.outlook.com (2603:10b6:20f:fc04::db3) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 13:58:38 +0000
Received: from BY3PR18MB4722.namprd18.prod.outlook.com
 ([fe80::e307:5f61:2694:b219]) by BY3PR18MB4722.namprd18.prod.outlook.com
 ([fe80::e307:5f61:2694:b219%4]) with mapi id 15.21.0451.022; Mon, 2 Nov 2026
 13:58:37 +0000
From: "Farber, Eliav" <farbere@amazon.com>
To: Rodolfo Giometti <giometti@enneenne.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>
CC: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
	Fabio Estevam <festevam@gmail.com>, Takashi Sakamoto
	<o-takashi@sakamocchi.jp>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v6 0/4] pps-gpio: restore pin mux on unbind and shutdown
Thread-Topic: [PATCH v6 0/4] pps-gpio: restore pin mux on unbind and shutdown
Thread-Index: AQHdatJBj+KqtGODS0u3i0VCZHZPkA==
Date: Mon, 2 Nov 2026 13:58:37 +0000
Message-ID: <BY3PR18MB472266A3C1AEC2268780A854C66A2@BY3PR18MB4722.namprd18.prod.outlook.com>
References: <20260922103051.5257-1-farbere@amazon.com>
 <20260923182243.41060-1-farbere@amazon.com>
 <4a62a294-ae53-455b-bc00-d16088684682@enneenne.com>
In-Reply-To: <4a62a294-ae53-455b-bc00-d16088684682@enneenne.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amazon.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY3PR18MB4722:EE_|BL1PPFA76386D1D:EE_
x-ms-office365-filtering-correlation-id: e3e52aa1-a85a-4ae9-b401-08df38e9648d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|7416014|23010399003|1800799024|10067099003|22082099003|18002099003|56012099006|11063799006|5023799004|4143699003|261021121427099003|261022075727099003|261022113327099003|261026121527099003|38070700021;
x-microsoft-antispam-message-info: KyL8/B8ujGbwbRpqe2uIFRpjFalCrtichBVirdB9Axa9q/8IJuylH0i48SK8owLQ+E+yFCjs+zCFZuF2RTxOl4sTVVqyHG0e1FMAqIkdLeuRflOPJVqS2W3i99LHdN1pbFLg5ta+9f75YKh9kSWeXweKATH0QlxeJWDQF2Ci6F6O5V1+jFnxSFsM8XAw380WQ8POHAH8L4dBlV+sLAbyFVPmAhZ91mCC6VXqg5FTqfVxKE8akpYy//efWvISNdd08BlvxLNzqX6UjRBOLeyf8CzalmM45n+HbWqG9wyiA3FcaclH2e1eljauuiz6ubEWqIbP2sKklZGf5V/frWa8zyB6FiQ8v1U1tc7prp70N01f9qRLBpLBAUkvJyuNEzHfj1eG2Wldrq6GVAtW5azd4VfpNDzHSASm2Lpamn8kRo5b8bKbTMMP8kVgXGy/YiCMt4wEllfvJzJXj62HZfE/RD6nko+wU0DHchrF3AdW7X1Tl1EbyYzTlKYRQ/50TItgjLCf3d1aJ8Ef8bKhPaf54RL2KdiihKofTO1VtmRyEG+qeV9E36bm3SqpXpxc8cFco4Zjf5qq2xPSqD8r9cIv4Ee4cp0uyCyUqWQcQsQ3DtMclqYo0X71CwBrx45juYpxwL8ua6Zy1l50Kg8MYgnggiYkzAbf5IjYhyrpaKoxHcc=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY3PR18MB4722.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(23010399003)(1800799024)(10067099003)(22082099003)(18002099003)(56012099006)(11063799006)(5023799004)(4143699003)(261021121427099003)(261022075727099003)(261022113327099003)(261026121527099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?M1FXeEpvUHduekZtdDg5UVM5QlNoNHorK3AyNVQ5OXJyWE9sU2hYVlZ0UCtB?=
 =?utf-8?B?aW5qSWh4UVZDenZ2RVJ2WW04VGg3MnJiQVFXZEJiU0Zrd3NVeFc5Zm1DenBH?=
 =?utf-8?B?WlRMVTBBUFFLR1k2Y3BFdzEweGkreFNKWUtqcEMvRm9iL1FRNjlib2xPZXpv?=
 =?utf-8?B?QUJmTHF4TVhJK3JnUlRjQU1ocndJUUFVNk1lQVBMMms0Wi9NdkFrQXZ0T3N3?=
 =?utf-8?B?Zm1NTjZldU1ZZ3RUUExGdGw0V3doakNPSnFFcnJEN21yRWVyUVl2dTk1akVC?=
 =?utf-8?B?dEh5NGxhb3VVTlFoZlBJSEN6ZHNUYVFGcE4yc2g4YjVMdVVVMVVxNzlIQStI?=
 =?utf-8?B?MlZPSk9ZVjVURWRac1o3V25YUVBmL2dCOWxqMGdPaUxaSGVtU29jMUlVdWxa?=
 =?utf-8?B?alBwMDJETG5IeXR1ZXRNdXZjRjN6NENZdUYwMGNYcm5xTnd2VWZNREk2cGhx?=
 =?utf-8?B?a25LNlk2K0owUUQ1T1I4Njg5ZnkwdFRqSlMycnJYdDg3cXJwSmFGV1NQNzFv?=
 =?utf-8?B?cGJFOWFSTVZMSm9uUlBBWk5yWVJQT2NmbzEyNEZzbGFuVWFQT1BTZUswVFp0?=
 =?utf-8?B?SmNsdDhwaC9xWS9xT1NQVVBZV05xWGxIV1dMNkR3M21OQzRPUUh6RFV3bHRS?=
 =?utf-8?B?UGQxWXJ5SU9SNkQrcHY5clJaVXl6ZXgvU3Q0VFl3ZWVQcyt6d1YyQVlkY0pG?=
 =?utf-8?B?dThyMnhqTmpCSmtTU0lSZW1vamdJMElncXdTOVlia1FUZFZjRTgvVWYzcVlP?=
 =?utf-8?B?T2FVUEpTS0dPSnNhekVEMkk1cE1HQ2o2amIyK215L2dJNGNIWHlqU2hoL2c2?=
 =?utf-8?B?aFJqTTNSUkpqamNmWkFzWkJVZ0pNYkZvbDJ5NzgrQTRkU1pNQmlnWS8xekh4?=
 =?utf-8?B?RnJrNEpTbmJvdURyWENiREtaME9iTXpGL0pVU29MQUpFY2t1R2EyWGhVT0ZK?=
 =?utf-8?B?a2F4U2Y4aWF1ZXROcXZvK3VUaXd6dWFVSnAyZlhMby80TEZ3T3ZkMisrd3Fz?=
 =?utf-8?B?MWx1SXkzNUZaNG4zelFWV3lhVXk1MkZVYjhycitoazlSNEpZR2R4OWlRYkRl?=
 =?utf-8?B?V1ZibzQyaXRyeHpCZ0pwVndQL1JQU3ZUc0N4MkJFYnJLNkNQTmxieC9pb01x?=
 =?utf-8?B?VlUvbWpEZUJYNVhKd2pYUXNQWTVoT2IvSE5zR05hNysxaEFhaUlTVmNlSXdj?=
 =?utf-8?B?cEcvckVzM0dkbzlGUXhmTDI3TW5MMDl2bTI0V2t3SElrdWFFS0FYb1RMYWdL?=
 =?utf-8?B?U2VGOVJCR255Sm5LTTZKaURXMzN1OHVnT09QREN0Zm04S0ZnSFpGMHJGMGtY?=
 =?utf-8?B?UTVkc2w1T1lrVVRpc1hTL3g4bHFId0lKeWcyREhhVGZoNFpDRHAxNDBQNlJJ?=
 =?utf-8?B?RVpOZWFkNCtpRDdUdTJOVVlRb3VVcm1NeFlRNnRyU3dKV2JxbnJQOEJ6QmFG?=
 =?utf-8?B?SGdQanFTcGdPWi9xNVA5ZHFmSEszMkVUUFJUSGV3K01yOWJZSHh1UXJZSFhq?=
 =?utf-8?B?eUVQZkY1RWdpWktwWFpYSGVBNGRnR1dXUHUrbXd6TTBJS2hySDdyMVRvVzFE?=
 =?utf-8?B?MEFKMnMxQUtqMHBucGN0YzlhdjBUekljdWQwU2VzeTk3dFYxaXNvcmV4RFlX?=
 =?utf-8?B?S2dLMzBnSVRYTW1iNDJHRXBhSjJ6OW5rODEva3pwN25Rc1k0Nk85aEhVRHlF?=
 =?utf-8?B?Uk9KNERqVjR3Q29kRmN2eitMYjBDNng2NElZTUFzQUdXSW4vS3NWb0RFY3hR?=
 =?utf-8?B?SUR4V28vOUp0cnU3eC9tYjhPY0NaeW81TTdrc2lzVVJabTVMZ29QQzdwdzls?=
 =?utf-8?B?MG8yT0VNRlpXUmtUelVYTDVOWHBZYnllWnp3L2d5YXNqbXg2SW9qeEFOL3da?=
 =?utf-8?B?WTNtK0Q1M0RMZ2J1Nzd3ZHFXVDByZGZ6ZUt1Z3M1Y0ZINnlyTElWUGpEWlZN?=
 =?utf-8?B?cGg0R2pnZU9GMXZRNlIwYWpHU1pMUlVRenBzT0lkUEltU1ZodEtlZGhqUGFh?=
 =?utf-8?B?RWRieFJ1djdLM3NUcTZONWdvUUJNR2oxU1NSblpQS0lBMFFlUEZKU0pEd0tw?=
 =?utf-8?B?cEticFNOaWxhRkQ2RG9IVDhjaFNzc0xPUUp3MktLc0lpZGg0SXpabWxJTmNa?=
 =?utf-8?B?M2dCVGhDbnhRdU5ydHRSUEtVQk9NVVU0dDhrSzcycGxFUkx4dUJ1SU9xK09J?=
 =?utf-8?B?V2dFVlN1ZUNzSlBqNmNDWmNhVVNONnhGcVZyTW0rQ3hySlhSaFBVVGY4MWEz?=
 =?utf-8?B?bGM5bjRWaUt3RFRnaFN5M2llc1QzSEpjMENKYytyOC84VXFSUnhsa2tjY2Iw?=
 =?utf-8?Q?JIgVeHhR4LcTb1+mU1?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: LPRAcslDQC8QOb7NO25MQ7R3IhMfHpVHva/3kJMFeCmWiVO0e1G9AT8y8IDiI3gbd3ebDQ/qIY9X2DEQyl1Q6yErn2w5auTN2BLedjsK3D+Yh1KMjioVmpy9lKihfLU4qatw2g92KICo9epGR1RG+Q69KwxLcijX+uGxX8r5/vccwLWTFtd3sp8cNd/lzQ5yq6/sxoIJH3k0dluypA+dNCOV5Miz0NUceqCBgM4p04YIIEpiR0Y1V2drIAumJsehHkubVhr66dO80bJKpsBZCrWYsp1TprfmzWIkoWAJqjSVBjn+eUe8Na+cieU6+trLpj09iEroMyCZ3z+x5UsLJA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY3PR18MB4722.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3e52aa1-a85a-4ae9-b401-08df38e9648d
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Nov 2026 13:58:37.4857
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5280104a-472d-4538-9ccf-1e1d0efe8b1b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YgatY2/MFpOBl8XXGKVDWpdE0QPF92P+5hfeR/OOWH6EDtXO1Y1eV+pi98niZsZIkx/1aqA1LsaGNIld+FBRNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PPFA76386D1D
X-OriginatorOrg: amazon.com

T24gMjQvMDkvMjAyNiAxNTo1OSwgUm9kb2xmbyBHaW9tZXR0aSB3cm90ZToNCj4gSSBhcHBsaWVk
IHRoZSBzZXJpZXMgaGVyZSBvbiB2Ny4zLXJjNDogaXQgYXBwbGllcyBjbGVhbmx5LCBjaGVja3Bh
dGNoDQo+IC0tc3RyaWN0IGlzIHF1aWV0IG9uIGFsbCBmb3VyIHBhdGNoZXMsIGFuZCBkcml2ZXJz
L3BwcyBidWlsZHMgd2l0aCBXPTENCj4gYW5kIENPTkZJR19ERUJVR19PQkpFQ1RTX1RJTUVSUz15
LiAgSSBoYXZlIGFja2VkIHRoZSBmb3VyIHBhdGNoZXMNCj4gaW5kaXZpZHVhbGx5Lg0KPg0KPiBB
bmRyZXcsIGNvdWxkIHlvdSBwbGVhc2UgcGljayB0aGlzIHVwPyAgTGludXhQUFMgaGFzIG5vIHRy
ZWUgb2YgaXRzDQo+IG93bi4NCg0KSGkgQW5kcmV3LA0KDQpGb2xsb3dpbmcgdXAgb24gUm9kb2xm
bydzIHJlcXVlc3QgYWJvdmUuIFRoZSBhd2t3YXJkIHBhcnQgaGVyZSBpcyBtaW5lOiB2Ng0KaGFk
IHlvdSBvbiBDYyByYXRoZXIgdGhhbiBUbywgYW5kIEkgcG9zdGVkIGl0IGFzIGEgcmVwbHkgdG8g
djUgcmF0aGVyIHRoYW4NCml0cyBvd24gdGhyZWFkLCBzbyB0aGUgcGF0Y2hlcyBhcmUgYWRkcmVz
c2VkIHRvIG90aGVyIHBlb3BsZSBhbmQgYnVyaWVkDQptaWQtdGhyZWFkLiBIYXBweSB0byBmaXgg
dGhhdCBpZiBpdCBoZWxwcy4NCg0KVGhlIHNlcmllcyBpcyB1bmNoYW5nZWQgc2luY2UgdjYgYW5k
IGhhcyBubyBvdXRzdGFuZGluZyByZXZpZXcgY29tbWVudHMuDQpJIHJlLWNoZWNrZWQgaXQgdG9k
YXkgYW5kIGFsbCBmb3VyIHBhdGNoZXMgc3RpbGwgYXBwbHkgY2xlYW5seSBvbiB2Ny40LXJjMS4N
CnY2IGlzIG5lc3RlZCBpbiB0aGUgdjUgdGhyZWFkLCBoZXJlOg0KDQpodHRwczovL2xvcmUua2Vy
bmVsLm9yZy9hbGwvMjAyNjA5MjIxMDMwNTEuNTI1Ny0xLWZhcmJlcmVAYW1hem9uLmNvbS9ULw0K
DQpUYWdzIGNvbGxlY3RlZCBhZnRlciB2NiB3YXMgcG9zdGVkOg0KDQpQYXRjaCAxOiBBY2tlZC1i
eTogUm9kb2xmbyBHaW9tZXR0aSA8Z2lvbWV0dGlAZW5uZWVubmUuY29tPg0KCQkgUmV2aWV3ZWQt
Ynk6IEJhcnRvc3ogR29sYXN6ZXdza2kgPGJhcnRvc3ouZ29sYXN6ZXdza2lAb3NzLnF1YWxjb21t
LmNvbT4NClBhdGNoIDI6IEFja2VkLWJ5OiBSb2RvbGZvIEdpb21ldHRpIDxnaW9tZXR0aUBlbm5l
ZW5uZS5jb20+DQoJCSBSZXZpZXdlZC1ieTogQmFydG9zeiBHb2xhc3pld3NraSA8YmFydG9zei5n
b2xhc3pld3NraUBvc3MucXVhbGNvbW0uY29tPg0KUGF0Y2ggMzogQWNrZWQtYnk6IFJvZG9sZm8g
R2lvbWV0dGkgPGdpb21ldHRpQGVubmVlbm5lLmNvbT4NCgkJIFJldmlld2VkLWJ5OiBSb2IgSGVy
cmluZyAoQXJtKSA8cm9iaEBrZXJuZWwub3JnPg0KUGF0Y2ggNDogQWNrZWQtYnk6IFJvZG9sZm8g
R2lvbWV0dGkgPGdpb21ldHRpQGVubmVlbm5lLmNvbT4NCgkJIFJldmlld2VkLWJ5OiBMaW51cyBX
YWxsZWlqIDxsaW51c3dAa2VybmVsLm9yZz4NCg0KUGF0Y2hlcyAxIGFuZCAyIGFyZSBmaXhlcyB3
aXRoIEZpeGVzOiB0YWdzOyAzIGFuZCA0IGFyZSB0aGUgZmVhdHVyZS4NCg0KPiBPbmUgbGVmdG92
ZXIgZnJvbSB0aGUgdjUgcmV2aWV3LCBub3QgYSBibG9ja2VyOiB0aGUgbmV3IHNodXRkb3duKCkN
Cj4gcnVucyBvbiBldmVyeSBib2FyZCwgaW5jbHVkaW5nIHRoZSBvbmVzIHRoYXQgZGVzY3JpYmUg
bm8gImluYWN0aXZlIg0KPiBzdGF0ZSBbLi4uXSBJZiB0aGUgc2VyaWVzIG5lZWRzIGEgcmVzcGlu
IGZvciBzb21lIG90aGVyIHJlYXNvbiwgYSBsaW5lDQo+IHRoZXJlIHdvdWxkIGJlIHdvcnRoIGhh
dmluZyAtLSBvdGhlcndpc2UgaXQgaXMgZmluZSBhcyBpdCBzdGFuZHMuDQoNCk5vdGVkLCBhbmQg
bm90aGluZyBpbiB0aGUgY29kZSBkZXBlbmRzIG9uIGl0Lg0KDQpXb3VsZCB5b3UgcmF0aGVyIEkg
cmVwb3N0IGFzIGEgc3RhbmRhbG9uZSB2NyB0aHJlYWQsIHdpdGggdGhhdCBub3RlIGZvbGRlZA0K
aW50byBwYXRjaCA0IGFuZCB0aGUgdGFncyBhYm92ZSBhcHBsaWVkPyBUaGF0IHdvdWxkIGFsc28g
cHV0IHRoZSBwYXRjaGVzIGluDQpmcm9udCBvZiB5b3UgcHJvcGVybHkgYWRkcmVzc2VkLiBIYXBw
eSBlaXRoZXIgd2F5IC0tIGp1c3Qgc2F5IHdoaWNoIHlvdQ0KcHJlZmVyLg0KDQpUaGFua3MsDQpF
bGlhdg0K
