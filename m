Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2123.outbound.protection.partner.outlook.cn [139.219.146.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F297C492183;
	Thu,  3 Sep 2026 11:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.123
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788435844; cv=fail; b=meOd6J0c8SwNVPTS6NzbwOSs4r0CJKTL1TlGoozvvCVK2kTTgz2JVPbrSxkSye1tVD7LMfnQWt5aIQPzpVuTd8NbrsB4eD51rDt18QwFS5TVhUkE9clx7WKg2aeirOsGwIkR2alF3OisDOBYQ3jEwy3Wh+vCWH5ZS6YYVHPEB+I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788435844; c=relaxed/simple;
	bh=5tdMJxmY8P0zN4MUAekcTzQTZtv3DYA/c2Zx/Qc2f8o=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=MN9ODG6jKAzknX4iFgbmoSuOq3zNs23pemjk2rBusdoOQkF98Dn2YDtvOvDWcjEDZDoFLIKjHR/nVKYSeLnqYAUTd8uOhA8Vr7P1g8mxfvDKkjs2I3JTCl0Ax2ajeRsDv3+RM4WHheSyKNAofICHrdZpZPfZdgF8sRE5dfkdqrE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mvvMMadBndGLCWQd/97iMV1ZKXq2QQX1/AmYn5uW2b3pFGXu9/2HCRdyqECqwmhn2D/tYcRDgEsy4DogBbeLItfdwQzQxe876Zg3G7CQzmvqS0RSx9LvaEuJeWRcU0yHSn6lXf4ZoGxsqIb5F6oQQQFltnkICzaWDoZ3cIdOYWotnt4NVAagbrhwMRDyL7R0Ws3A6rVqJ2SlSw5r/QHuzPruIubtS74Z5qGIRP1YZJ1Gkl/zsfqlnRUywFA4bRsOfYoomH2+KMD9ZKTYUD8Rq9ndBmQf0S4KO7sOYICB7BkR2/kVaSpTXV/AaZcLPGBWcFkLYQTIVzh7ZyqP1kYfZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5tdMJxmY8P0zN4MUAekcTzQTZtv3DYA/c2Zx/Qc2f8o=;
 b=HZQF45l3q+9NR8w2khgG34z8S8deloObMEODXjGwvs4CDCSImqkUMTWSMia78IVdd+gdP9xyh+6+oe1HbcZqJo9sXw0w+IH/BHVgd2kQpHan5bGtI29VSZTaNmchxlQodBjkRtxVcVj5k/osEKNr7e6zPwz50mIIBw6peZ598awvcBoTC/TzeonabAgV49qC08/ktqw0g0FP8wEgt20rSJXH2UPEu1xiq6tki1psemyMZ5irUjTj/1Z+dbT3CF6s4w9UTWyB3I1O4NjHsqdeC/nv9c0H24B86lwTuz+J/H1oyfz+KGbXi6f0iLXjfImpfPZzy9DEUTu7Gt+LnB2OHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1170.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.19; Thu, 3 Sep
 2026 11:29:19 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0315.011; Thu, 3 Sep 2026 11:29:19 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"linusw@kernel.org" <linusw@kernel.org>
Subject: Re: [PATCH v1 2/2] soc: starfive: Add JHB100 UART Routing driver
Thread-Topic: [PATCH v1 2/2] soc: starfive: Add JHB100 UART Routing driver
Thread-Index:
 AQHdOEv9x2zENbRKZkCU2oev0UH3Y7a2RHqAgAEc0jCAAEiSAIAAAe4ggAC+rwCAAIoJsIADqQ6AgAAgwIA=
Date: Thu, 3 Sep 2026 11:29:19 +0000
Message-ID:
 <ZQ4PR01MB1202111E86A9DE7AC32E017CF2B62@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
References: <20260830065118.51551-1-changhuang.liang@starfivetech.com>
 <20260830065118.51551-3-changhuang.liang@starfivetech.com>
 <417251d0-c2cc-4e10-940d-b75ab20acdec@kernel.org>
 <ZQ4PR01MB12022D97EFD74D5A80DBBE34F2A92@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
 <5f99fc90-02e0-40ab-8d1f-c2e7bcce7a5e@kernel.org>
 <ZQ4PR01MB1202FB18CF51DB252C393D0FF2A92@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
 <20260831-dramatic-phrasing-beb1b360cd58@spud>
 <ZQ4PR01MB12029CCB91CB5673761C6F95F2A82@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
 <20260903-precise-diamond-loris-ae2da7@quoll>
In-Reply-To: <20260903-precise-diamond-loris-ae2da7@quoll>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1170:EE_
x-ms-office365-filtering-correlation-id: aaeaf35c-9f9e-464e-50ff-08df09ae9860
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|10067099003|4143699003|56012099006|22082099003|18002099003|38070700021;
x-microsoft-antispam-message-info:
 72yNGCX3q3jYBmBgR/5/zsDwJ/kLCV5/ijWrs+ND/esv13xceCsI5qwm2QBb2VeilKusLZxnwfRqKMj2jTxd1a7cLn166eJEjmTtk70yAlUAUsJ/TH46k+cv2geAjL4+XQLyRd/iWwGpwLBp9PShgnvwi1NKPTHlfPRrrf8mGNmO0gBfqOl3dqmKuKCmbBT1fVeNpQxt9OGk8lI6rLUKAfm1ezrXIBXTov8GX3kEkWKl8PV0p6mVwpTzJ7k47L4e3sAWLO4TulMral2iiJHdVx2Dcyg9JMsjqwWv3C3aI1kasIAUtv9rDmHDi8U0KJOEWRmKGT1isTgmbyC9bjza+8P5+henK0tIaZUjpk3ERmcINNNJ2+UO2wS0XnNdRv36C4DIaN7wea/t9+9eUO2n+MUCzjIMdT0Zl2ti4f0VE0g+Y+RvPHpdnnhNl+nq/fTXOvCokD7eqFtSMqXsSCNS4b/8DG60XpZsEmjnBkmspDtALxV6o4aZi9367rPajwE0LdMpxnpoGXBqzpZwQ49RQA7886m1XEG7f3IYX6zea2tuOcAxMPiiltDlmtJF6hH+
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(10067099003)(4143699003)(56012099006)(22082099003)(18002099003)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bVN1MTZud3A5Rk8yOEg4R3d1SytQRE9UbmpQR1B2MDFhY21CZzFnbzJ4QUtZ?=
 =?utf-8?B?RXA2WC9WSkhoUURHZXd0SDU3WWp2dVpwQW81Z2NQdE50MFh6dEpEVDhvUWFk?=
 =?utf-8?B?bHJoSHUzbUlRME85Qzd0czhUNTdMTUw2VGs2SjFXMEcxWGduTDRBcXhzWXha?=
 =?utf-8?B?OTF5N1lVTG9zajFBOTlReGpkTDlJNUFtOU8yUnFrMWtsMEJmbWRGd1Q3blJs?=
 =?utf-8?B?Yk9KcU16WW1DVmVCb00zeVJaVmIrRE1ncDdUQWQrWXN1RVdTUmU5aUNHTlhy?=
 =?utf-8?B?NHpQS3dMUkdXdllUbXR3S0MwekFTeFh2RCtvKzlKaUpFNVJWZElPR3pieG5L?=
 =?utf-8?B?Mmt3WFJ2QjBCTVE3REZPdGNyZk94WU5UZmo5QnV4V1kwYnllZERta2hMUUNn?=
 =?utf-8?B?RUE1Z1FzSHBjY3EwWVVNREdLaFU0ZVdPMHFibmpKdDlUVm12RVkxc3dQTmZM?=
 =?utf-8?B?Q3FmWndLZkZFQ3R1MStNVzczd0dwVVkwVWMxVzdkTWVsWk44Sy84bHhzMGE3?=
 =?utf-8?B?UEdKNFlyVSt6ZE9LdG05L3NhYVRhSWxMREdDaUNmL3M1ZkdBWmhGZzVhcDZq?=
 =?utf-8?B?Q2luNHZWMkgwQVpYTWY0cTBjQVFRUVBtajdqNXArVU9UUlBmMUpPakVUazR4?=
 =?utf-8?B?S2FQaGdpMVI2VEw3UnFDQ0IzUFYxcjVabUF5UFVYQW9CWWhhRDBuMzNuaXVK?=
 =?utf-8?B?T1V0ZG01dVlyTDhwRDVIWFd2eGdDcE1Pd0g5Q1dqRkQvZEVGcXZCaTMrekdG?=
 =?utf-8?B?MWIwSXFaQzdQVnJzUXZEZkxtc0hTQXAwTWtweHl5MUJ2a3gzK3k5R2pqWGFG?=
 =?utf-8?B?cTNnNFg3Mmh2NGNVZTVlZk5mMnlmVXNjMkV5RzROMWlhcHdzVmF1S2NnbEtB?=
 =?utf-8?B?UXYwQ2hEWkF5NUE4SEM2UjZQYmo5NUZBOEgxaW9GNm5sRXczOFUwTk5iM3p4?=
 =?utf-8?B?elJOcVdlZ29ka21TWGJmSnJaVWRKNVB4U2E3WU9jaFFZMEJGSytUb1dWeEFO?=
 =?utf-8?B?NXA5MTVzd1lNLys1ajA0WkQyQmRiOVRYamJkMW9seU1iams3UFJSdTVMMjRT?=
 =?utf-8?B?Tkp2UmhaTDFCT1dacVFWVFV6UFh1VnIyMmY5ejN5WEtFbnhzVmlsZlV0LzR5?=
 =?utf-8?B?RVhFcE9XcTVsNDlBZnhzbFdvTFA3ZmhKUXRjOHpMNU5JV1JGYm0xOGVQNmRL?=
 =?utf-8?B?Mk4yZzkwWnBSQkl0eXYyVVA0dUVoQ1ltRGtlWWkxVE96RGZaVU1MRmRRNmtt?=
 =?utf-8?B?NVc2UjkzMVQ4ciszSEIycVc1L3ZPVlIxZmlGM2VFb2VpbWpzZUMwMjRsbjBL?=
 =?utf-8?B?QUhOSFh4YnAzYXNpU1dxa1ZjSG5xQlV6ZmN4eVRpalJCK3NvSGZxQlVWT1Jh?=
 =?utf-8?B?SmRnSjI3VTJ5QUVlR3lOdUIvMVpyN2RaZFFKcG9UR3lDUUpwTTRwY0ZqeUFr?=
 =?utf-8?B?SUhLb3pNODUwQ0lhZzV6S2tIQldBbDkyZ1BhNUtUYWxWenVBYkhacjFoc1U0?=
 =?utf-8?B?aGZNQ013T2RHTVlTMFdqZWtGdnF4KzU0STJETXBSWmh0QWpiQlBUbDU4UkhO?=
 =?utf-8?B?bW1CZzZWcXpwRjIzS3NoMzhmalREODN2NWJFZUVvaEIrdUxLc1kyMkF5S0J3?=
 =?utf-8?B?S0hHVm9MTTBlcUV4UHZiMWFaQ0lyZ20renR3OS9FYTFjVnVFd3B2V3UzSGsx?=
 =?utf-8?B?RlNhQnk4cmpZcUI4ZVNUZmpIZlhXeVhnTDJhak9GRXlIT1JOYkJ4VHdRNHR4?=
 =?utf-8?B?SlUyUUNIaVppZDljRnFoZnNTci9ZMTZPcGN6VEkyWUFWMUtxU1dNNi9aQjV2?=
 =?utf-8?B?eFVlekp6OFlGWDdXMFdlL2ZmeXBxbFRxU2FtMXBBUGg1NW9zNTFwQzRGUDlH?=
 =?utf-8?B?R3ZLUldDMk9hR0I3Yk1jQkFycDUrTTVTczRNbEl2ZkttN3ZvMUhCa3Bhck85?=
 =?utf-8?B?allDdnE4RDJFQmgybVhYQ0pzQlBaeE1PZWtxQkJRc1NncmxVNXlvMHg5MVZW?=
 =?utf-8?B?RksyWkZ3TjZoaml2bXp5TlhxcXZsazRQVUloR01Ha0J5cXNVaW5lV2MyQVRH?=
 =?utf-8?B?QWk4ZGpNS3pZOWhwTU9JdHhHMHhkc3R4aDZwbk9vQTBFTXNDVEJJZENTeUJl?=
 =?utf-8?B?b28rdml0T0hJTmkrMUIyWFVNTVlmTHBOdWRNbXZEV1ByaG9yU0ZHNEtPWlFO?=
 =?utf-8?B?d1VQSWhaZ3VGQ2hoRFBZZktpeFZEYnVodnhUWHQzeXM1aVAydDRnSWxRaFEr?=
 =?utf-8?B?K0RGVS9RK1FtRzV0L1FvYlN3aWx0T1VjT3lEblk3QVhkQi9wbHQ1Q1NiUk9J?=
 =?utf-8?B?NDNuMzRBY0wrN1dNOWt4T2FxNDJyMXgxN1RybjQwQUVmSlNTN2ZNWlBHMTli?=
 =?utf-8?Q?yVzC74bZQutfQQ50=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: aaeaf35c-9f9e-464e-50ff-08df09ae9860
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Sep 2026 11:29:19.4967
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YcDJ1oC55DF7cAD2WEPsgzvrqJbvCK8cQzj/zZCEjBWy6GZf37Vxa0V8sEwFPYfwHpGri3Ou2mYDi105VWzO66SH+TVaLf6PcrOSinWVEd2zxpOmQvbLKAuuOgVmB1lm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1170

SGksIEtyenlzenRvZg0KDQpUaGFua3MgZm9yIHRoZSByZXZpZXcuDQoNCj4gT24gVHVlLCBTZXAg
MDEsIDIwMjYgYXQgMDE6Mzg6MTVBTSArMDAwMCwgQ2hhbmdodWFuZyBMaWFuZyB3cm90ZToNCj4g
PiA+ID4gPiA+IEkgbWF5IGhhdmUgbWlzdW5kZXJzdG9vZCBzb21ldGhpbmfvvIxwbGVhc2UgY29y
cmVjdCBtZSBpZiBJJ20NCj4gd3Jvbmc6DQo+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gSSBoYXZl
IGZvdW5kIHR3byBzdWJzeXN0ZW1zIHJlbGF0ZWQgdG8gbXVsdGlwbGV4aW5nIHNvIGZhcjoNCj4g
PiA+ID4gPiA+DQo+ID4gPiA+ID4gPiAvZHJpdmVycy9waW5jdHJsIGFuZCAvZHJpdmVycy9tdXgu
IEhvd2V2ZXIsIG5laXRoZXIgb2YgdGhlbQ0KPiA+ID4gPiA+ID4gc2VlbXMgdG8gcHJvdmlkZSBh
IHVzZXItc3BhY2UgaW50ZXJmYWNlIGZvciBzd2l0Y2hpbmcgbXVsdGlwbGV4aW5nDQo+IHZhbHVl
cy4NCj4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiBEbyB5b3UgaGF2ZSBhbnkgc3VnZ2VzdGlvbnMg
b24gdGhpcz8NCj4gPiA+ID4gPg0KPiA+ID4gPiA+IHBpbmN0cmwgaGFzIHNvbWUgaW50ZXJmYWNl
LCBub3Qgc3VyZSBpZiB3cml0YWJsZSwgdGhvdWdoLiBJZg0KPiA+ID4gPiA+IGludGVyZmFjZSBp
cyBtaXNzaW5nLCBpdCBzaG91bGQgYmUgYWRkZWQgdmlhIHN1Y2ggc3Vic3lzdGVtLg0KPiA+ID4g
Pg0KPiA+ID4gPiBPa2F5LCB0aGlzIG5lZWRzIGEgYml0IG1vcmUgdGltZSBmb3IgZGVlcGVyIHJl
c2VhcmNoLg0KPiA+ID4gPg0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gQWxz
bywgY291bGQgeW91IGNvbmZpcm0gd2hldGhlciB0aGUgaW1wbGVtZW50YXRpb24gaW4NCj4gPiA+
ID4gPiA+IGRyaXZlcnMvc29jL2FzcGVlZC9hc3BlZWQtdWFydC1yb3V0aW5nLmMNCj4gPiA+ID4g
PiA+IGlzIHRoZXJlIGZvciBoaXN0b3JpY2FsIHJlYXNvbnM/DQo+ID4gPiA+ID4NCj4gPiA+ID4g
PiBJIHN1cHBvc2VkIHNuZWFrZWQgaW4gd2l0aG91dCBTb0MgbWFpbnRhaW5lcnMgbm90aWNpbmcu
DQo+ID4gPg0KPiA+ID4NCj4gPiA+IE15IGZpcnN0IHJlYWN0aW9uIHdoZW4gdGhpcyBmbGV3IGJ5
IG92ZXIgdGhlIHdlZWtlbmQgd2FzIHdoZXRoZXIgaXQNCj4gPiA+IHNob3VsZCBiZSBpbiB0aGUg
cGluY3RybCBzdWJzeXN0ZW0uIEkga25vdyB0aGVyZSdzIG5vIHN5c2ZzDQo+ID4gPiBpbnRlcmZh
Y2UgdGhlcmUsIGJ1dCBJIGRvbid0IGV2ZW4gc2VlIGFuIGV4cGxhbmF0aW9uIGZvciB3aHkgY2hh
bmdpbmcgdGhpcw0KPiBhdCBydW50aW1lIGlzIGEgcmVxdWlyZW1lbnQuDQo+ID4gPg0KPiA+ID4g
SSdkIGhhdmUgdGhvdWdodCB0aGF0IGVhY2ggQk1DIHdvdWxkIG9ubHkgaGF2ZSBvbmUgaG9zdCwg
YW5kIHNvDQo+ID4gPiBzaW5jZSB5b3UndmUgZ290IGxpa2UgMTIgdWFydHMgdGhlcmUnZCBiZSBl
bm91Z2ggZm9yIGEgcGVybWFuZW50IHJvdXRpbmcuDQo+ID4gPg0KPiA+ID4gRXZlbiB3aXRob3V0
IGEgcGVybWFuZW50IHJvdXRpbmcsIHRoZSBkcml2ZXIgY29uc3VtaW5nIHRoZSBwaW5jdHJsDQo+
ID4gPiBzaG91bGQgYmUgYWJsZSBwZXJmb3JtIHRoZSBzd2l0Y2hpbmcgKHVhcnQgaW4gdGhpcyBj
YXNlKSB3aGVuZXZlciBpdCB3YXMNCj4gbmVlZGVkPw0KPiA+DQo+ID4gSSBjYW4gZ2l2ZSB5b3Ug
YW4gZXhhbXBsZToNCj4gPg0KPiA+IEJNQyB0eXBpY2FsbHkgaGFzIGEgdXNlIGNhc2UgbGlrZSB0
aGlzLg0KPiA+DQo+ID4gV2hlbiBzb21lIGN1c3RvbWVycyB1c2Ugb3VyIFNvQyB0byBkZXNpZ24g
dGhlaXIgb3duIGJhc2Vib2FyZHMsIGluDQo+ID4gb3JkZXIgdG8gc2F2ZSBJL08gcmVzb3VyY2Vz
LCB0aGV5IHVzdWFsbHkgcmVzZXJ2ZSBvbmx5IG9uZSBwaW4sIElPNiwNCj4gPiB3aGljaCBieSBk
ZWZhdWx0IHJvdXRlcyBVQVJUNiB0byBJTzYgZm9yIHRoZSBCTUMgY29uc29sZS4gSG93ZXZlciwN
Cj4gPiBzb21ldGltZXMgd2hlbiB0aGV5IHdhbnQgdG8gY2hlY2sgdGhlIGRhdGEgZnJvbSB0aGUg
SG9zdCBVQVJUIChVQVJUMCksDQo+ID4gdGhleSBuZWVkIGEgdXNlciBpbnRlcmZhY2UgdG8gcm91
dGUgVUFSVDAgdG8gSU82IHNvIHRoYXQgdGhleSBjYW4gdmlldyB0aGUNCj4gVUFSVDAgZGF0YS4N
Cj4gDQo+IFNvIHRoZSBwaW4gaXMgcGh5c2ljYWxseSBtdWx0aXBsZXhlZCBhbmQgdXNlciB3YW50
cyB0byBjaGFuZ2UgaXQgb25seSBmb3JtIHRpbWUNCj4gdG8gdGltZT8gSU9XLCB1c2VycyBhY2Nl
cHQgdGhhdCB0aGV5IHdpbGwgbG9vcyB0aGUgQk1DIGNvbnNvbGUgbG9ncyBvciBob3N0DQo+IGNv
bnNvbGUgbG9ncyB0aGUgbW9tZW50IHRoZXkgc3dpdGNoIHRoZSBVQVJUPw0KDQpZZXMsIHR5cGlj
YWxseSB0aGV5IGFyZSB1c2VkIGluIHRpbWUtc2hhcmluZyBtb2RlLiBBZnRlciBzd2l0Y2hpbmcg
dG8gdGhlIGhvc3QgVUFSVCwgDQp5b3UgbmVlZCB0byBzd2l0Y2ggYmFjayB0byB0aGUgQk1DIGNv
bnNvbGUsIHVzdWFsbHkgdmlhIHRoZSBuZXR3b3JrIFNTSCBjb25zb2xlLg0KDQo+IEFueXdheSwg
YXMgeW91IHBvaW50ZWQgb3V0IHRoZXJlIGlzIGFscmVhZHkgb25lIGNvZGUgbGlrZSB0aGlzIC0g
QXNwZWVkDQo+IC0gdGh1cyB0aGlzIGlzIGEgc2Vjb25kIG9uZSBhbmQgdGhhdCBtYWtlcyBpdCBy
ZWFzb25hYmxlIHRvIG1ha2UgYSBwcm9wZXINCj4gY29tbW9uIHVzZXItc3BhY2UgQVBJLg0KPiAN
Cj4gSnVzdCBsaWtlIGluIGVudGlyZSByZXN0IG9mIGtlcm5lbCBkZXZlbG9wbWVudCAtIHdlIGRv
IG5vdCBtdWx0aXBsZSBpbnRlcmZhY2VzDQo+IG9yIGZyYW1ld29ya3MgcGVyIGVhY2ggZHJpdmVy
LCBidXQgdXNlIGEgY29tbW9uIHBhcnQuIFRoYXQgZGUtZHVwbGljYXRpb24gaXMNCj4gdGhlIGJp
Z2dlc3QgZGlmZmVyZW5jZSBjb21wYXJpbmcgdG8gZG93bnN0cmVhbSBhcHByb2FjaGVzIGFuZCBj
b21wYXJpbmcNCj4gdG8gYWxsIHRoZSBwZW9wbGUgdHJpZWQgdG8gc2VuZCB1cyB3aXRoIGFyZ3Vt
ZW50cyAiYnV0IEkgd2FudCB0byBzb2x2ZSBteQ0KPiBwcm9ibGVtIiAoaWYgeW91IGRpc2FncmVl
LCB0aGVuIHBsZWFzZSB3YXRjaCBvbGQgR3JlZydzIHRhbGs6IEkgZG9uJ3Qgd2FudCB5b3VyDQo+
IGNvZGUpLg0KPiANCg0KR290IGl0LiBJIG5lZWQgdG8gc3BlbmQgc29tZSB0aW1lIGxvb2tpbmcg
aW50byBpdC4NCg0KQmVzdCBSZWdhcmRzLA0KQ2hhbmdodWFuZw0KDQo=
