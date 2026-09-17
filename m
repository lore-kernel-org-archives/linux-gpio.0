Received: from pdx-out-005.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-005.esa.us-west-2.outbound.mail-perimeter.amazon.com [52.13.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 049DE3469FC;
	Thu, 17 Sep 2026 07:52:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.13.214.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789631558; cv=fail; b=qJ7ilxZxBcp+GFPRms2GWFHctvZ45E7heT72CX4wolnWgI7sA6FSmugl0c38tMoy3xtkYT2XI8JhGFt5MUTWmlX9OaYOwZIuJgIT6al+/S1Wrv55L5BokwVE7Vo+1URdPIcL3ewEZoVPzJSM4U2K0vvBxzi5bjyX2JBzzDsbjbM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789631558; c=relaxed/simple;
	bh=yfBASLAMDwX+KDQKJKp5lU9w31EfA8OoebjW2ECXlmE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=CRW2EkHsm1tDExIJQqPpkVvaCAdCD+mUgeebsuWOXFYH0iULBjurBaa/Pfy5MmUYbTfJRZWpirYnD5tmAaR0sLcnJfdiZ0S3+h0WnllaOishGMGakxh7lPHQpOzfYCU4dG8DY2D88JJvySjiYFX+6rfcbOuGGuyqeZDSHvolH2I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=SafCDwq8; arc=fail smtp.client-ip=52.13.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="SafCDwq8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1789631557; x=1821167557;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=yfBASLAMDwX+KDQKJKp5lU9w31EfA8OoebjW2ECXlmE=;
  b=SafCDwq8cHNKeZ/XICfmG60lV2xFHlUzLD+aX8jpOBlqo5jHLyhByUad
   Kc1io6LNUAGAE4g8twGSgHXdl2ljAIYb5ytgjwMiA0OrPZtP72xZTmXrB
   hn4UsFRkcs0+zabstr1DgZNTOdfjG0a1uKwIBrI11cIheMCOi4VQ2jXT7
   748LKioweGajVsFSyEj4c6YbytCcDHwGfdc5uNXy0Qyx2h/Gog0/OTamO
   VX72Aiw0TfsTKLKZYPrXr9AjzoqL7BbXolkA/ehQMaulTr43j7KKyhxkE
   z5pCVCyJDx2MGEb/5d2FFAmZn4KX+Wp16Gl+udJKoTEBZxAyPMNoA9etY
   g==;
X-CSE-ConnectionGUID: By/HCuaHTBGPYgtYBJGmqA==
X-CSE-MsgGUID: 9Z/H6+z8QUuuDZbuIGrBRQ==
X-IronPort-AV: E=Sophos;i="6.27,103,1787011200"; 
   d="scan'208";a="28880212"
Received: from ip-10-5-0-115.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.0.115])
  by internal-pdx-out-005.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 07:52:36 +0000
Received: from EX19MTAUWC001.ant.amazon.com [205.251.233.53:8294]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.5.10:2525] with esmtp (Farcaster)
 id 8b5874c9-3f3b-4053-8cc4-e725c95892c3; Thu, 17 Sep 2026 07:52:36 +0000 (UTC)
X-Farcaster-Flow-ID: 8b5874c9-3f3b-4053-8cc4-e725c95892c3
Received: from EX19EXOUWC002.ant.amazon.com (10.250.64.172) by
 EX19MTAUWC001.ant.amazon.com (10.250.64.174) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.46;
 Thu, 17 Sep 2026 07:52:36 +0000
Received: from EX19EXOUWA001.ant.amazon.com (10.250.64.209) by
 EX19EXOUWC002.ant.amazon.com (10.250.64.172) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.46;
 Thu, 17 Sep 2026 07:52:35 +0000
Received: from BYAPR08CU003.outbound.protection.outlook.com (10.250.64.168) by
 EX19EXOUWA001.ant.amazon.com (10.250.64.209) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.46
 via Frontend Transport; Thu, 17 Sep 2026 07:52:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GAEww7K44Faoz5IzIGcHRmtUc1h3OsoI0l6O+KD70aXoQZHb+4Klj+YJfns43HEWS/4n2gkp3c52WMEot6HqPk/TTukAr3IjrNyP+git83d1TKbKL4vHzWun9pYRKvJslLDS7S88T/xI3/a12jaUaFNZZKicoeapTlya7YgX7WSio4Eo1ZqFmNnJ8SbFBhmMlHr5StmzoyGD5OhCTA4vgFXqF4tFsb73Im+v2UR9by9U+N7dqo8kkF6hRgyVKgmDm5g30JIQ3Dt+my/GNG4L8s2Zg6Cy60kH/B+rSLnxl4VqAQ+pBZ5rS/+fgObZUFXR0FkSVccY4IS6XUNjQ2kIag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yfBASLAMDwX+KDQKJKp5lU9w31EfA8OoebjW2ECXlmE=;
 b=ZIayRwTHoaD6Oku7Vx5oTwQegbjy1L+ApKG9OMSOUz5Ibpla6Xdo2kbZQ3JvtaK3tZgxj+b4UjRk679VNx3XQnf89MgSjF2xm2FkBDq1Z2jlLxco8Lpagz+vMw4vkV98ayOUF7yhSW85QEwzp0me2GttUBR+cAq/Qec1RJLNEOLiLzVbCk7e1uHJG/wgdo2ybvQu1g6d5mimvbBl90b1C+5LduXsFkY/uQCaxQoz9wMXBeLvKykuDBqHW3LFar3JAXe2dyRKurDcUvTxSvjx3Spu01d1tBrfJOf8fD9iW8UgYhpapDk2wCPQJJKN7BNzRrWWoKkxVzVrIG6jktVJSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amazon.com; dmarc=pass action=none header.from=amazon.com;
 dkim=pass header.d=amazon.com; arc=none
Received: from BY3PR18MB4722.namprd18.prod.outlook.com (2603:10b6:a03:3c9::19)
 by CO6PR18MB4420.namprd18.prod.outlook.com (2603:10b6:303:139::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.12; Thu, 17 Sep
 2026 07:52:33 +0000
Received: from BY3PR18MB4722.namprd18.prod.outlook.com
 ([fe80::e307:5f61:2694:b219]) by BY3PR18MB4722.namprd18.prod.outlook.com
 ([fe80::e307:5f61:2694:b219%4]) with mapi id 15.21.0406.007; Thu, 17 Sep 2026
 07:52:33 +0000
From: "Farber, Eliav" <farbere@amazon.com>
To: Rodolfo Giometti <giometti@enneenne.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
CC: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
	Fabio Estevam <festevam@gmail.com>, Andrew Morton
	<akpm@linux-foundation.org>, Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v2 2/2] pps: clients: gpio: release pins to an inactive
 state on remove and shutdown
Thread-Topic: [PATCH v2 2/2] pps: clients: gpio: release pins to an inactive
 state on remove and shutdown
Thread-Index: AQHdRnl/jkL3afwVQUyH3eVe9J0Fbg==
Date: Thu, 17 Sep 2026 07:52:33 +0000
Message-ID: <BY3PR18MB4722419A4C177B16A2AF1CFCC6B82@BY3PR18MB4722.namprd18.prod.outlook.com>
References: <20260916134744.46354-1-farbere@amazon.com>
 <20260916182641.9768-1-farbere@amazon.com>
 <20260916182641.9768-3-farbere@amazon.com>
 <1b25ba28-c53e-4425-8165-8205eab60e22@enneenne.com>
In-Reply-To: <1b25ba28-c53e-4425-8165-8205eab60e22@enneenne.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amazon.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY3PR18MB4722:EE_|CO6PR18MB4420:EE_
x-ms-office365-filtering-correlation-id: e918f683-1080-48a8-7684-08df1490a215
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|23010399003|7416014|1800799024|366016|6133799003|22082099003|18002099003|38070700021|11063799006|5023799004|4143699003|10067099003|56012099006;
x-microsoft-antispam-message-info: uXXfyE1ta8sRuGZDR7b1iN/8sr76adOrtmHoMsNZSAXf14ctwBqdmh86mmH6R0M/uUIdjzkqJKVkXx6mFXoXGFByQ25hb+vdIVFSWH9v97Nr4/+YIr5QYDtNuQu/z+F/RPfbagtiaco7sF1XMIteAMWVh2cCsfajBvV4NSrRouPIXdQNM3otBI0E+FUMdkhQxGhQ07JPvxCmFQt1jHrnV6VVnMNeYbUjkYuwz4xS9OnYeO7ZEcIAkgl/uw5cLPhiJ0f/qNWwcNwRVghpUqJ+9WUu7mxLMg4QsnHn2nSvq/5EeEQJoRYSNr+kAGPahdFpgVa+oCVniU6972Ol1qQibukr/CiYoVfY7qtaCP0AVZ+ijCEfJMVXQURbqT085jbxa76r2plGn4ZVCbyej9+l4fZ+rKgwBdtrP7OtyF7oa225Sb6chpHK6lFhUq526vF18UC0h276NFF1q8KZB78PdcAT7pRAwnzbDAMl4Zh9DBZgJytPVmeUz1uI94Pl2jd215jW9YrreRaPslQgaVNo9yDORT9B9w2pNxxztXA3vVWxgl7pFj6TexLXmF40dwE5Mth1w7ebpTUwyOjZ8IRpc30GLY9f5aNhPYUaIRCagnB8fiU/iu0wynF3sCKxKc8HeEgKcaRIeNBrTgYUL5zXztVyt0erfO6hszYK0WW3ECIUw5ylkXyiZ936sKip34DJT9sGz7PzkAuVgJilv4PRzufa284vYT1i25eKpWnTlUI=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY3PR18MB4722.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(7416014)(1800799024)(366016)(6133799003)(22082099003)(18002099003)(38070700021)(11063799006)(5023799004)(4143699003)(10067099003)(56012099006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WGZSMUMzQWYxYW9OM2FySFZML2t6c0JUbmVlcUVpbXJjZi9qZTRsY2kwbC9C?=
 =?utf-8?B?N2NOcFNqYmlkQnZaSGtaaHpRYXBSYXBlQTN4U2lYblFtcktJbXR2dDFIam44?=
 =?utf-8?B?clZBNWd5dVZjaHR3eUpaOE8vc0ljVjhpUEJmMzJrcmRVTDF6NHplcDllUm1B?=
 =?utf-8?B?L1F0Y2NwNVVnNWRaa1NWUUVKRHdianNkR3lzTks5WmkyMDQ4NGNwUjFtNkcz?=
 =?utf-8?B?NDJDNGloOUpUb0QyV3l2T0tuUG5VTWtUY2F4TURDcXRCWG9kMEQyek1nTm9m?=
 =?utf-8?B?MjI3d0N0VFozMU5LZWl3cVliSEVpQ1phMGJTcnV6bTNKZW1XZUp5VFhtUVgy?=
 =?utf-8?B?Y2lucDk4Wjl3b0tCdTh6aURyaDNXWFJXTmVFZUVsbU9Xd21rRjVCYW91M3VM?=
 =?utf-8?B?aUFhMmF4ZkYvREMrbmNuZVFBeEtkaXBrMzZjWVNqaHZKeVUzNHBOZXZzblRh?=
 =?utf-8?B?Wk40aFA2UGwzTXlLU1UwWDhnQm5hQzVLUUNENWZPM3ZkUzZPd0w0R2JwMzNU?=
 =?utf-8?B?bkJ1ZHpJSC8rKy9hamdBQWNXN1c5MEJkdXZUaUR6MDBtNE5Pa1dnbWtodTNw?=
 =?utf-8?B?R2V1KzAyZFU4QzNpb3hkamN6V05OMnRkQXpncFhoaVZ1aUtscVo4UDhzNHNl?=
 =?utf-8?B?eExIT1Z4OVFmbmFjZDZMd0dxZzYrczVoeDNtQnBPRGk0dmdzeHZrcEF5ZDRa?=
 =?utf-8?B?MURselRlbjZaR1k0UDlnUU5aQ3kzUDZUdWIvNkhCVnFpdmtOcE5sdjhlUlRT?=
 =?utf-8?B?TmhFcnFMcDBuc0Rob0s4bnZ6eFpzWG4wNkQzdnU3TmNraklOeDhzN0FiUHBq?=
 =?utf-8?B?YVZ4RWRPNVZ4cCtXWnZnWEdISjZjbjNyRGpGVVd1S05KeDY5VVFCUU9jOWpk?=
 =?utf-8?B?ajZHZlNYY3VDd2JCMnRESDErSWxZWVEyd2lkTUFLaW91Q3VaUDdNKzZhc1pj?=
 =?utf-8?B?dUV0NmRSKzBPV3dvQVVKeTg5U0Q3UmczNDFwSmw2L29OTFU1cG9Rbk5lbkZp?=
 =?utf-8?B?YmZJV2VJQkNYRVladFRlZG5XcEJjaEVTRnNremMzKys5bmsrSmJHd1IvUm53?=
 =?utf-8?B?RGpJMXVMQ3YxTlc0ZFJQYlZDTFZvZ0h5cVZKK05jN1B1UHhsWHVyb2RUZGpB?=
 =?utf-8?B?cWxSSUd6dUhpd09RSEE4M29EMzJhdTZpRU9wdGtMeWlTVGxLVXJ5QXBHdW5j?=
 =?utf-8?B?Nk5CamNIeHZnWjFlRUFucitHQitWZXJZMHVkUmRIdkUyRmFWVHhHTkJhcjRB?=
 =?utf-8?B?NWVDRnRSNnpSRzYwazVrVTdoNGdONVN2dEpiMGlqZVpnTlpnY1BrVkxSSEVm?=
 =?utf-8?B?NjVaRFdEQklocGt0emVKeDVzREkycFp1OU1wS05VQzJoSVBWdk9zTDNuSU4z?=
 =?utf-8?B?WW9mdnQrSU5ZWmNPWWtnMFBUQ2pyakM2ZVBSRXBSRGZWVDdXUU9UWGN2RTk0?=
 =?utf-8?B?WFlHcXRsOTlWbE9lblR5b3VRdUM0MWxQR3FJQWRLMlh6cy9RaEQ0V1JlSjZN?=
 =?utf-8?B?T0FqZ21CNkJ2TmJJSzlmeHAwcXdvbjRpbWlCbHhNcXA2SS9mcTNrT2hmQWtJ?=
 =?utf-8?B?YytIVDBjMDRuTURpVkhrYU03c2NXRWorTUpUUzNUY2QrZi9Da1hYeHcvWDFi?=
 =?utf-8?B?QnVJOHBGK0Jab3B2QkdaZ3VabEFRTUo4SkZYODVoZ3JPWFRwR0w2dWdZWUJ6?=
 =?utf-8?B?L2Q4NHhPYUNPWk85U21TQ2tnblJJWHhxSjBncVAzTTQvRFQrSVdteWFwbGVy?=
 =?utf-8?B?YWdoSEltU0VNTUhtRTF2WnhjME1EOFlCbTdoUFRTRGFTemJDc3JQbU4ydTZj?=
 =?utf-8?B?cDBkTHBWck12TmpZejNCQ2NLenBMM3E0K2VFZDZNTUp0cUtTWGoyaHFjZGRB?=
 =?utf-8?B?ekQvWFptWS9obDl4eHVHanlxUkt6cFQ1SFlFNmw1S2hUbTR6WjB2Yk4zWU1N?=
 =?utf-8?B?ZC9sQW1tUW5HSEFsSy83T1hzSi9ieFMyRlRHcEtMbkgvcXlwcUM4emZYS25n?=
 =?utf-8?B?VEkyZVpIUXc0ZG9TU3hZQ2N5NFNtMExyRXJRa1pWYmxZT0pBcjdkR0dGU0w4?=
 =?utf-8?B?Um5hak96ZDRJZlpOL3Y2NGJIVHk2UTBzNkN1WFV5TEkxM1l4eDZDR1NLdVU3?=
 =?utf-8?B?SWhiaGEzaURoWEp2Z1ZVNHVjdnlkUFdXaUphK2d4OWN3VHo2Yy9NSTNxdFVO?=
 =?utf-8?B?NEZ6UmFGLzQ4L3h6QU8rb3Q2Z2RPWno2bDdrR08yT0x0aStIUmhLRTZoTFBC?=
 =?utf-8?B?elJpOXJ3R3B3NzhZUG5xOFpSSzl1M0thNStBbVFOTTRSSDMrRXNJaEo5emZI?=
 =?utf-8?Q?VfwwnlkOPiNOdLfq6v?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: G19t0C11pGE1Y5E6znViJNx2Yy90cuRFpgR09Keyp/iKFr+Nrsw3swvaU4Q9BO1naeHXjbLwi+MLewt7Iw7O1Ygvb1/X+3HBFTzNiU1e79Qp2+uj5MyJgbJw3nqklDSP9mPPLbKbVii2IRLxdceI/f5tPbe/OkBTbSJu0yeBeW2wdlmKrmWcJIgpfNzHTuQVfbRNG7i1yfWdiXoiEIbAk9k8QlkkZdQNW2+7GkanrZAYUWZA283/toQTFhGFDc0TCwC8QHOXe6Exk6CuOmp28I1diZFXMMzlPDkWFJdeyjNYpKp0Oe/fkpWiORQNdFLZFZ33hDkWvHtduh3kQTbpgQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY3PR18MB4722.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e918f683-1080-48a8-7684-08df1490a215
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Sep 2026 07:52:33.6782
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5280104a-472d-4538-9ccf-1e1d0efe8b1b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DX2IS+EaJ5rPq/6JvJsCPaAlFxntlqk+Nltdpc+M9ItLP6DHnGqiwmUk4Ev80x389WBJkIBVapUfu0CJXNlG9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR18MB4420
X-OriginatorOrg: amazon.com

T24gMTcvMDkvMjAyNiAxMDoxNCwgUm9kb2xmbyBHaW9tZXR0aSB3cm90ZToNCj4+ICtzdGF0aWMg
aW50IHBwc19ncGlvX2dldF9waW5zKHN0cnVjdCBkZXZpY2UgKmRldikgew0KPj4gKyAgICAgZGF0
YS0+cGluY3RybCA9IGRldm1fcGluY3RybF9nZXQoZGV2KTsNCj4+ICsgICAgIGlmIChJU19FUlIo
ZGF0YS0+cGluY3RybCkpDQo+PiArICAgICAgICAgICAgIHJldHVybiBkZXZfZXJyX3Byb2JlKGRl
diwgUFRSX0VSUihkYXRhLT5waW5jdHJsKSwNCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgImZhaWxlZCB0byBnZXQgcGluY3RybFxuIik7DQo+DQo+IHBpbmN0cmxfZHRfdG9f
bWFwKCkgcmV0dXJucyAtRU5PREVWIHdoZW4gdGhlIG5vZGUgaGFzIG5vIHBpbmN0cmwtMCBhbmQN
Cj4gY3JlYXRlX3BpbmN0cmwoKSBmb3J3YXJkcyBpdC4gU28gdGhpcyBmYWlscyB0aGUgcHJvYmUg
b24gZXZlcnkgcHBzLWdwaW8NCj4gYm9hcmQgdGhhdCBkZXNjcmliZXMgbm8gcGluY3RybCBhdCBh
bGwsIHdoaWNoIGlzIG1vc3Qgb2YgdGhlbTsgeW91cg0KPiBzZXR1cCBoYXMgb25lLCBzbyB0aGUg
dGVzdCBkb2VzIG5vdCBzaG93IGl0LiBTaG91bGRuJ3QgLUVOT0RFViBzaW1wbHkNCj4gbWVhbiAi
bm8gcGluY3RybCBoZXJlLCBub3RoaW5nIHRvIGRvIj8NCg0KQWdyZWVkLCB0aGF0J3MgYSByZWFs
IHJlZ3Jlc3Npb24gZm9yIGJvYXJkcyB3aXRob3V0IHBpbmN0cmwuIEluIHYzDQotRU5PREVWIGlz
IHRyZWF0ZWQgYXMgIm5vIHBpbmN0cmwgZGVzY3JpYmVkIiwgbm90IGFuIGVycm9yLCBhbmQNCmV2
ZXJ5dGhpbmcgZWxzZSAoaW5jbHVkaW5nIC1FUFJPQkVfREVGRVIpIGlzIHN0aWxsIHByb3BhZ2F0
ZWQ6DQoNCiAgICAgICAgZGF0YS0+cGluY3RybCA9IGRldm1fcGluY3RybF9nZXQoZGV2KTsNCiAg
ICAgICAgaWYgKElTX0VSUihkYXRhLT5waW5jdHJsKSkgew0KICAgICAgICAgICAgICAgIC8qDQog
ICAgICAgICAgICAgICAgICogQSBEVCBkZXZpY2Ugd2l0aG91dCAicGluY3RybC0wIiB5aWVsZHMg
LUVOT0RFViwgd2hpY2gNCiAgICAgICAgICAgICAgICAgKiBpcyBub3QgYW4gZXJyb3IgaGVyZTsg
cHJvcGFnYXRlIGFueXRoaW5nIGVsc2UuDQogICAgICAgICAgICAgICAgICovDQogICAgICAgICAg
ICAgICAgaWYgKFBUUl9FUlIoZGF0YS0+cGluY3RybCkgPT0gLUVOT0RFVikgew0KICAgICAgICAg
ICAgICAgICAgICAgICAgZGF0YS0+cGluY3RybCA9IE5VTEw7DQogICAgICAgICAgICAgICAgICAg
ICAgICByZXR1cm4gMDsNCiAgICAgICAgICAgICAgICB9DQogICAgICAgICAgICAgICAgcmV0dXJu
IGRldl9lcnJfcHJvYmUoZGV2LCBQVFJfRVJSKGRhdGEtPnBpbmN0cmwpLA0KICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICJmYWlsZWQgdG8gZ2V0IHBpbmN0cmxcbiIpOw0KICAg
ICAgICB9DQoNCkkndmUgYWxzbyB0ZXN0ZWQgYSBwcHMtZ3BpbyBub2RlIHdpdGggbm8gcGluY3Ry
bCBhdCBhbGwgdG8gY29uZmlybSBwcm9iZSwNCnJlbW92ZSBhbmQgc2h1dGRvd24gYmVoYXZlIGFz
IGJlZm9yZS4NCg0KPj4gK3N0YXRpYyB2b2lkIHBwc19ncGlvX3JlbGVhc2VfcGlucyhzdHJ1Y3Qg
cHBzX2dwaW9fZGV2aWNlX2RhdGEgKmRhdGEpDQo+PiArew0KPj4gKyAgICAgaWYgKGRhdGEtPnBp
bnNfaW5hY3RpdmUpDQo+PiArICAgICAgICAgICAgIHBpbmN0cmxfc2VsZWN0X3N0YXRlKGRhdGEt
PnBpbmN0cmwsIGRhdGEtPnBpbnNfaW5hY3RpdmUpOw0KPj4gK30NCj4NCj4gVGhlIHJldHVybiB2
YWx1ZSBpcyB0aGUgb25seSBzaWduIHRoYXQgdGhlIG11eCB3YXMgbm90IHJlc3RvcmVkLCB3aGlj
aA0KPiBpcyB3aGF0IHRoZSB3aG9sZSBzZXJpZXMgaXMgZm9yLiBXaHkgZHJvcCBpdD8NCg0KWW91
J3JlIHJpZ2h0LiBJbiB2MyB0aGUgZmFpbHVyZSBpcyBsb2dnZWQ7IHRoZSBoZWxwZXIgbm93IHRh
a2VzIHRoZQ0Kc3RydWN0IGRldmljZSBzbyBpdCBjYW4gd2FybiAocmVtb3ZlKCkvc2h1dGRvd24o
KSBhcmUgdm9pZCBhbmQgdGhlIHByb2JlDQplcnJvciBwYXRoIG11c3Qga2VlcCB0aGUgb3JpZ2lu
YWwgZXJyb3IsIHNvIGl0IHdhcm5zIHJhdGhlciB0aGFuDQpwcm9wYWdhdGVzKToNCg0KICAgICAg
ICBzdGF0aWMgdm9pZCBwcHNfZ3Bpb19yZWxlYXNlX3BpbnMoc3RydWN0IGRldmljZSAqZGV2KQ0K
ICAgICAgICB7DQogICAgICAgICAgICAgICAgc3RydWN0IHBwc19ncGlvX2RldmljZV9kYXRhICpk
YXRhID0gZGV2X2dldF9kcnZkYXRhKGRldik7DQogICAgICAgICAgICAgICAgaW50IHJldDsNCg0K
ICAgICAgICAgICAgICAgIGlmICghZGF0YS0+cGluc19pbmFjdGl2ZSkNCiAgICAgICAgICAgICAg
ICAgICAgICAgIHJldHVybjsNCg0KICAgICAgICAgICAgICAgIHJldCA9IHBpbmN0cmxfc2VsZWN0
X3N0YXRlKGRhdGEtPnBpbmN0cmwsIGRhdGEtPnBpbnNfaW5hY3RpdmUpOw0KICAgICAgICAgICAg
ICAgIGlmIChyZXQpDQogICAgICAgICAgICAgICAgICAgICAgICBkZXZfd2FybihkZXYsICJmYWls
ZWQgdG8gc2VsZWN0IGluYWN0aXZlIHBpbmN0cmwgc3RhdGU6ICVkXG4iLA0KICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgcmV0KTsNCiAgICAgICAgfQ0KDQpUaGFua3MsDQpFbGlhdg0K
