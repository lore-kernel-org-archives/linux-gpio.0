Received: from pdx-out-010.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-010.esa.us-west-2.outbound.mail-perimeter.amazon.com [52.12.53.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF6C652D2CC;
	Tue, 22 Sep 2026 10:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.12.53.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790071899; cv=fail; b=JhAjg+49j6B55xIYoWBt5bcs84Y/K6NHFwHSAG976QHOUnOdKkVYFHIigyI2LXcXa68GqU8Ds7FOHPKsyaGQQCrMe/umc60UufnGYdG5f0/CCMwLpxuL1ZixxT6PxwCmFBhn2zlKNixD3DDNxNNbbVBFjCRjk8EpBmCB7uWYSFQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790071899; c=relaxed/simple;
	bh=cqyrPTDe+ycPVs9QvX9nvJG+ixZrkjZlam8R3IJU+1A=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=KkcfjytzbAQePxiLN5SwSXekAZvFys09FjwW41wNYdTkC//I3wDewXWR2hSVr26llKjl6pXcobw6E6oGe21HiwKspiAuk3chAMJBpt/uyDbqyb6+QoKlovIwl9s3W9t2diIdKS705YfxGcC2NM23yjzammEpuXK2L5A9RGqzqcE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=NwdJlIlD; arc=fail smtp.client-ip=52.12.53.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="NwdJlIlD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1790071896; x=1821607896;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=cqyrPTDe+ycPVs9QvX9nvJG+ixZrkjZlam8R3IJU+1A=;
  b=NwdJlIlDEFjTefRK7iQXvn/xwZxyvlUZGQcsQAeMwyx/97yKWpTX1BN+
   uo527xAd6z+pCvpO9s7bCb+NEf2UnF1zVq7u5/y1G28ocoUpcSQZ9NHAc
   t7g7fEGY0ms9tDat+sUY5fVBPSc5P5pXGL+YsCSQ3gUzElck9JHm85UwR
   dfVtbvrG1YCO6Kq17/ZWJpq6niR7lPGV3LHCvAtisAk/V7RpobeyTm5Wj
   PSXtNJEavs9zMr54s/75JWgCkKP4gCJh2GJpFOoRVELsri2EF3AVSBLEs
   NNVXrE9SWfyDnA+474Y0VLVn2X+TIAmOOgRaEdPgZKyt5X919P5YFhsDw
   w==;
X-CSE-ConnectionGUID: NjUUNG0GS9al7O3HMtO74Q==
X-CSE-MsgGUID: 1X/NEK8MReqbmyhnseCPgQ==
X-IronPort-AV: E=Sophos;i="6.27,116,1787011200"; 
   d="scan'208";a="29197326"
Received: from ip-10-5-9-48.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.9.48])
  by internal-pdx-out-010.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2026 10:11:32 +0000
Received: from EX19MTAUWB002.ant.amazon.com [205.251.233.48:2558]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.35.200:2525] with esmtp (Farcaster)
 id 9f34a216-0277-454b-9a79-0b516c388ada; Tue, 22 Sep 2026 10:11:32 +0000 (UTC)
X-Farcaster-Flow-ID: 9f34a216-0277-454b-9a79-0b516c388ada
Received: from EX19EXOUWC001.ant.amazon.com (10.250.64.135) by
 EX19MTAUWB002.ant.amazon.com (10.250.64.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.49;
 Tue, 22 Sep 2026 10:11:31 +0000
Received: from PH0PR07CU006.outbound.protection.outlook.com (10.250.64.168) by
 EX19EXOUWC001.ant.amazon.com (10.250.64.135) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.49
 via Frontend Transport; Tue, 22 Sep 2026 10:11:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gKxhYFWPTd+pMvg53vf0gwg237hXQ9Y5g98MPL6MQpCvzW6YiZ6S2k8jfuN2o1nBvEJi5XitdB1UFF8bfAgIqIgBQbMCE/FNvu3rDfr6CJBh3t7I4LpAMhoF0yPXvuGrtr54LgFHfGY1UUqZ8ZKnML79+UZ+f+Cw1/mkDveYiMdtOrFMqelPpATGYyHneAcWKpyVjsC7i7ELt85E5zdDyL5G/esIUCzzmGsbRCZgXzVRUcTFdXoTykRY2iKYN70pNmZKaK/6MXDjOEsnsqRPwkZJiFNaJkcu9Dp7dCwvP1jS/9AQ3khMVpKKxwhwzEMK+SFxMkZqa29Z4IfJteqX6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cqyrPTDe+ycPVs9QvX9nvJG+ixZrkjZlam8R3IJU+1A=;
 b=FHlcO13dHRLXWoDU4GPQXHc49M960tSCMCyC6mNBJ8Dt/qGX/cTJDu3zlHAL75VuX3OiawYkWkn+NfnHcq5WDi177IIqTEf2GqhlnA4MJfaaZivzf5vyC0ZVkszCBdUVSRjrAY9Q9yk9HeaSG+467/70HU/uAnbieDExr6roMP+CYAAS1qTm65Kq/VYsAAYjXRQGZGuxHX4hD2CKC04AXRraavfoAkjee4kFAp+oQegdKY1MHGNdz5EOjprTerIR6+SLGpbAtB6Q2gXlRXoQiUkJfImVLkOBJhdTiPMwVIB2ks8jdYxYC5KD8zxnU+uIsrTWvOgHi9ScYM7Mvf4Mag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amazon.com; dmarc=pass action=none header.from=amazon.com;
 dkim=pass header.d=amazon.com; arc=none
Received: from BY3PR18MB4722.namprd18.prod.outlook.com (2603:10b6:a03:3c9::19)
 by PH0PR18MB4508.namprd18.prod.outlook.com (2603:10b6:510:e6::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.13; Tue, 22 Sep
 2026 10:11:28 +0000
Received: from BY3PR18MB4722.namprd18.prod.outlook.com
 ([fe80::e307:5f61:2694:b219]) by BY3PR18MB4722.namprd18.prod.outlook.com
 ([fe80::e307:5f61:2694:b219%4]) with mapi id 15.21.0451.012; Tue, 22 Sep 2026
 10:11:28 +0000
From: "Farber, Eliav" <farbere@amazon.com>
To: Rodolfo Giometti <giometti@enneenne.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
CC: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
	Fabio Estevam <festevam@gmail.com>, Andrew Morton
	<akpm@linux-foundation.org>, Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v4 2/3] dt-bindings: pps: pps-gpio: document optional
 pinctrl states
Thread-Topic: [PATCH v4 2/3] dt-bindings: pps: pps-gpio: document optional
 pinctrl states
Thread-Index: AQHdSnq74loLIZcKhEKq97T0xo/fgA==
Date: Tue, 22 Sep 2026 10:11:28 +0000
Message-ID: <BY3PR18MB472251A6A2459901298A590CC6832@BY3PR18MB4722.namprd18.prod.outlook.com>
References: <20260917075611.47881-1-farbere@amazon.com>
 <20260919171157.5502-3-farbere@amazon.com>
 <01f30877-07df-460a-94f0-e655485b156b@enneenne.com>
In-Reply-To: <01f30877-07df-460a-94f0-e655485b156b@enneenne.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amazon.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY3PR18MB4722:EE_|PH0PR18MB4508:EE_
x-ms-office365-filtering-correlation-id: 39462c9b-62da-4319-e0ca-08df1891de0e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|7416014|23010399003|1800799024|38070700021|10067099003|11063799006|4143699003|56012099006|18002099003|22082099003;
x-microsoft-antispam-message-info: OrS5Cct2Gd6ptyak+2gVFOTo4S+MlK25kMTgpenUhWuh7nLV9bAXVtPmZ2iWjXblhG2uJpemvfXD135KK6oyk0f9eiY1b22Q6MLIA2/NQ+NcKbobzDv2rNxyQiu3Uafz3Dw+Ea1G+xV4dP9jjO9v7aO1VF+RiBdxhJhewBrVN/e+kK7jgc7UXz9phBLpoygJ91gY3sQeOvz5e2ioqpezMiF8+1WP2qZAu7lJpDk6CtwAaIp5tCsInQWp7QYochKTViJWeGdP+ZZML95ImK53hT5cCU5dSUmj0o9tm7/DdiRjfBWkK4t4k3vd9ylnKphetWdd5kLTArm/KAtctO1OaPo6EBCcp53CA2abVB4sWKji9RD8ABrfVPy8HLFpp0eqWqFpSNItZDrhV66bon5e13xK6Quytt6kyaNvB6S8ncLYY/T1iT6Gi3Vi7iqbI42Ly/IHkj/GdtBvxgPF/zJ8n/5UyOJlr69tfkwPvRaKjyQPlf69MKoEFoibKD2lG15wkrNkk2SFkizlUfWHc7pvxWiRJwSqNV97CMnSh16/WZIxeHY8d60J2AOGd2rJJn8qqaCa4rOd1M0p/D3YNCuJ7Oo7Vu5CRB7qeZO0Tp3TOtOjf0yv2LmA43nR3JYU/d7PdS/B+T4NKRLZ9QZFfFYuk/TMfkwKOOrSjJ3D4Oot4YdicdirB9SF5KfuIc9VYoQPGKDB5hyQx0q7E9tqwKD9A+/q+C60nLJRt/ehLinrjYc=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY3PR18MB4722.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(23010399003)(1800799024)(38070700021)(10067099003)(11063799006)(4143699003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WGhvck9VR0NwcWJ1ZGdscUV4eTBzcmJmVHlBWXdZY20xa0xGOW5hR3ZScGVl?=
 =?utf-8?B?ZVo4b29iQXRQSGk2VEUzWVk2K2JWNGhLN20xQ0tYQW9JdlRhd2lFMW1kSUdC?=
 =?utf-8?B?UkR2L2paN05jWkpLblVYb0pVMk5xZUxwOVV0aVIvWDQ1RnFiSkd6ejNxVk9t?=
 =?utf-8?B?SGgxdVpsZE95NTgzL3VjQS9BeVNsOVJRQUxhdDNzaVhmR1Q0bi90ODFwQ2l3?=
 =?utf-8?B?ZDMrQTJ4SDdmU3ZTSk5ud05rVjhMSnlyME43ZzlIVnNwUDFCdTFjaktZMGdR?=
 =?utf-8?B?Ry84SGZNZ0s5Nlg4WjJ4YVZYQkJuZFRzWGZiWU8rNzZtMVkzak5iYnhITFdq?=
 =?utf-8?B?NThOaUlWb05FbnUrVjhVUUYrOVdDMXY4bDB1S1VBZkoxL0lFYURtYmlkTTFq?=
 =?utf-8?B?UHUxUEtBcjMxa1lzSEcxcVNvYUZjcFRjQlFoOEg4dmJGTXo4cHVqczJrdGxp?=
 =?utf-8?B?UWFieUY1VHZKNnM2dVVCYjFraXFkajRvTnltS0Y2R1B6dG4zUDd1OG5aNUI2?=
 =?utf-8?B?WVZQSlo3NiszVTZKdG50ZzhJMWFSckhXRHVYcEdxbk5JdjJ1QzUrWGsyK0hs?=
 =?utf-8?B?OWNCbk1TbldLSjBDSDNxT29YNDBpODJvSlJrMTREMVRXcVk2Z1N1ZDBPMVd2?=
 =?utf-8?B?dFpjeHd0YkRxNHd3em1KQlowL0txUjg3OGhPNFlrUTRnSFdVakQyOHFFNWtW?=
 =?utf-8?B?cU0yQi9mLzRkVjlTRkdBVFU4dk1ncFRoeGtnWUVtNFREQUJncU9sRlZicGUy?=
 =?utf-8?B?ZXRhM3dpSEVGanB3ZW42a3M3VGZHNkRtZDc0TUhsa0JWVElacjRaZTRMUm5o?=
 =?utf-8?B?ZUx4UlVFTFJkcXRrNlV4ZytPcWp5RUxUYzV5anBIazRPd1VVRnQ1eWFIK2xI?=
 =?utf-8?B?VWhpeHdrWHFWbUJobWRFbE1SMGpBc2tLYW14OTNORVFzS3NWbTFCM0ZOTE0r?=
 =?utf-8?B?THBrSm5WN00wQjNvZjArTGFNVXVuOWgyQ2owdUtxL05vcWVLc1Y5QXRRbU1P?=
 =?utf-8?B?WTV5VVhTcjdVSHJETFFxdnpXektvSmhVR2dwNklIUXpZN0hSVFJPWXdqczFY?=
 =?utf-8?B?c1NGYnVrMVlwTTRiM2ZVTU1wTzQ5SGVoZlBqdXFWR2p0MjQzandnOVVETU1n?=
 =?utf-8?B?UHFkRGFxY01OcGhZVWtTSGprS09zYzEzODVMVGtSZGFQZHB3dDFyam16RnFB?=
 =?utf-8?B?czcvMHU3SC84ZGdxelJOT1RFd2poQ1d5K2hUSEhjQlZQTjc2Vm1TQnJsZnM2?=
 =?utf-8?B?VjdjUWN3Y3NkYk4zRkhPSGttd2tRTE9Lam9ma2ZDaG5aeFp2WXZpaG8zS1ZY?=
 =?utf-8?B?RlphSFhZbW9CQjcvL1VWbzQvZktWODI4Z2Q0UUhqVkRnaUVseUVsRFFYaWg2?=
 =?utf-8?B?aVRScEZ1bE5CYkt1SGZyYnZCenhtNmNNcFVGWVpDU3hLQy91VERDUEx5cFJM?=
 =?utf-8?B?Qmx3NEJ5YkdBa3A0eGU4aytYUVpGd3JMK04wNUF0QnQ0OVZXUnRsQlVGTDgz?=
 =?utf-8?B?amVWbmZyUHE5QWVRTysvK0NCc2JBOWVKdTl4YnRvZS9VL2xZam5HNEQ0TXNt?=
 =?utf-8?B?MmdZTVdXWFNTWlJwZDh1N3VBYnpudUFuQzNNTVZ5UEVWcjRZTll0cnlaOW1Z?=
 =?utf-8?B?OG5yK3haMWxabklUS2VrOUtwaS9RNVNjWlJJdWFvaXJaM25pU3BISE1Lcy9N?=
 =?utf-8?B?dGRzTkJGRnBSMGpTeWtxRHJaOEhLck5vckVocENORUR6bHVOYVM3QTZoS0xM?=
 =?utf-8?B?RFFCV2J3azFFdDZHNXVFaFUrYUkrS3lKWXJwdk1nNlQ5dnRRTFVkaTN2aFcx?=
 =?utf-8?B?NytnZVNiQk9UbXNpNXlBVWlpbWgyNXhGcXZlOThKMnZZYW8xdGJ4bFNNYkVV?=
 =?utf-8?B?dXlLVDBSQ0NEMGYxa1JocDkzOHU5UlM0bTRocU11UkZtdEhpcFcvcGVXYWw4?=
 =?utf-8?B?SHdwSDFLQXN4eVczZml5NUwyalgvTHJaNkNOS2IvV09STVl4Uy9JM0t1ZEpr?=
 =?utf-8?B?V2dLeW14OVVDWmdVNzZwMEFqaXZTTU43VTRoVVpvYU9KdWpiMnFKNGVUZEJE?=
 =?utf-8?B?YWpTQlF1Zk93Z25yWjFhNTdYSDlVMlZnclQzTUp0S3NlSHVVYTdWVVpmc3VL?=
 =?utf-8?B?dlgzVSt6eGN4ekFQWkFudVlhYkhLVDdKbVhqbW9ZdTI1ZHprMFNtZ2hCZXRP?=
 =?utf-8?B?UDV1Y24yNlByc1VaSEdYanlzS3J0eTd4TlhOSGZhMlhTcFFPb2dhVnBwR1VU?=
 =?utf-8?B?Q1ZwVFM3Y2VrVzFuWUg0T0RjM3QyVEVGZklvQm1XNTJWdXBrUklYL3JBeDZF?=
 =?utf-8?Q?1HdAsdBE+lhSoyzfu1?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: JOaLBlcw1/cJ/FudlyPKXCG0HPktRXVs0E2ZogvejkhuUiuyIO6WLS9wLPtr9MqvGXPuqHExQ3B+QlVoaZqa1yGOQUEF+Pf3wPY0pfowv46CCTyHMllSplnWVVM1iaGC31R4pD4HN0od+rYoJ4WFZv/PUonfaQ1UvNJPDJR50sHxS/dpAu+b1OKb/9+sai9pB6UZBfz4WLx51LtsWj3MVnuG7YlYq8yNLYHWd6oYV6Y8tDdc9iVzsxWjsG8BLG4CvAplBzhi4g/sUV5PoG2jLSkgUr73OD5dmZPTX+3Vx2ML4sfB12N3pI+6pMgQVtuwL2MxAPDWR36pJQVu9xOgpQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY3PR18MB4722.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39462c9b-62da-4319-e0ca-08df1891de0e
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Sep 2026 10:11:28.4172
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5280104a-472d-4538-9ccf-1e1d0efe8b1b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7UsHpNIPVkV+yB++VOpILiFp/Wj1wra7ImkLPZDet4YK+yOwbKVaoFXyPItqU7xyYjtS7A1q4rJ1X4eJmxRMAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR18MB4508
X-OriginatorOrg: amazon.com

T24gTW9uLCBTZXAgMjIsIDIwMjYgYXQgMDk6NDA6MDBBTSArMDIwMCwgUm9kb2xmbyBHaW9tZXR0
aSB3cm90ZToNCj4gT24gU2F0LCBTZXAgMTksIDIwMjYgYXQgMDU6MTE6NTZQTSArMDAwMCwgRWxp
YXYgRmFyYmVyIHdyb3RlOg0KPiA+ICsgICAgbWluSXRlbXM6IDENCj4gPiArICAgIGl0ZW1zOg0K
PiA+ICsgICAgICAtIGNvbnN0OiBkZWZhdWx0DQo+ID4gKyAgICAgIC0gY29uc3Q6IGluYWN0aXZl
DQo+DQo+IEp1c3QgdG8gY2xvc2Ugd2hhdCBJIHJlcG9ydGVkIG9uIHYzOiBJIHJhbiB0aGUgYmlu
ZGluZyBjaGVjayBvbiB0aGlzDQo+IG9uZSBhbmQgdGhlICJbJ2RlZmF1bHQnLCAnaW5hY3RpdmUn
XSBpcyB0b28gbG9uZyIgZmFpbHVyZSBpcyBnb25lLCBzbw0KPiBjb25zaWRlciBteSBvYmplY3Rp
b24gd2l0aGRyYXduLiAgVGhlIGJpbmRpbmcgaXRzZWxmIGlzIFJvYidzIGNhbGwuDQoNClJpZ2h0
LCB0aGUgdjQgcmV3b3JrIHRvIHRoZSBvcmRlcmVkICJpdGVtcyIgbGlzdCAocGVyIFJvYikgZml4
ZWQgdGhhdC4NCnY1IGNhcnJpZXMgdGhlIGJpbmRpbmcgdW5jaGFuZ2VkLg0KDQpUaGFua3MsDQpF
bGlhdg0K
