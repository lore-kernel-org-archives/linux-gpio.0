Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2138.outbound.protection.partner.outlook.cn [139.219.146.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FDB03603E0;
	Tue,  4 Aug 2026 01:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785806516; cv=fail; b=MF3XTgdU3CyIzBrzvC0Y+BrE3H8ZLyAcE27/rInbVwKn+iFxdWUWfJ4a3PAsdMJOAmCCUjhB2cTsaHFwI5sXLu17NAIurjxVsGcAsYLuT90tGIRmFSwY6M+kjpt/tIvdXBIjxmECmQ+Gtxl9FwOJbhGWOr7sdnGyKQn6cIZTlJM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785806516; c=relaxed/simple;
	bh=8um/eRgqxJERjE5TDC+zNWuPa5ZSVZe+z7TogbGwpFc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=HtAqTPYFA1Q5ReTCK03/8Wegse63GSwkjckiSaVRNguX4KAT5662UguAgO9eeOpqKYoZcYWEP36LYafHRO8W3eHwbq/49zJdFgFycF86TtEXh7Hzva6wcVfEtZKmgfjSPsRUE+qgHtTu//rihlMXs+l3Cy2m9gWM0/+SucOif0g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GsuVIW/lynIbAMUp0CRo25Z++I3rwfaaa4rcltoPq7D8IaURvqNO2/5k9csYN+8PtHAgImBi7jchY4Y1myUXo/QB0SqYe9ujKF3qQtVIJ0myjOMCYulTNuaa3z9MPomcaoQaVx2Vsjvut0FDPWAH4clwUAZhjMyU4tfWi4sG0wJy1eS2ni2/N520VXBB9GNnWPmz9LOg5MDP0b/Zr/1ktkXXFdfd0K/1laWPJh1ebEZb1gX9LqcqiXLGZv0n5MiIaH9geT0XPnQF9Cqa0bFvEktB1r7uTmFil4CT8v65EIXcITyzQ+pX5tvaaR88U0FqMZJhmbb2g/6S+4eNc+80/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8um/eRgqxJERjE5TDC+zNWuPa5ZSVZe+z7TogbGwpFc=;
 b=btyZXG58i/Pt30bI0C/+T19dAAQrWIzyQXDbTL+LNHQSHuZYRQ4mwvDVeVt8C+CAC++d8PJl4atuVPPk9AZO83M0D3H3eV4zaPbTHujMYHPSaQ5YwHCmbzgiz3KRAFAGGYTzo5HtGGXFJA3bqVEFBjSXAQVAWprfvFidSapZRgExV64tCsfK7xlcs5WnnewKAIA9qEul/HOrbnTKctqN5RaNFDcsffYdSxJkUUrOElm0dAtKJufV9FOcEk5OCE5bdMznyDVyVhimISpy1tQX6Y1w7O8Y9pf9F4WItpXG8yGXPVqURNw6h8U4u7t3RTTfhUMlTelWzVrOm2mB6fdBVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1201.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:13::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Tue, 4 Aug
 2026 01:21:42 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0270.017; Tue, 4 Aug 2026 01:21:41 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Emil Renner Berthing <kernel@esmil.dk>,
	Paul Walmsley <pjw@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Palmer
 Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>, Bartosz
 Golaszewski <brgl@kernel.org>
CC: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, Lianfeng
 Ouyang <lianfeng.ouyang@starfivetech.com>
Subject: Re: [PATCH v4 04/21] pinctrl: starfive: Add StarFive JHB100 sys0
 controller driver
Thread-Topic: [PATCH v4 04/21] pinctrl: starfive: Add StarFive JHB100 sys0
 controller driver
Thread-Index: AQHdIYczihHpqGBQtEmjRJKnf0h+hLaMdmEAgAClxbA=
Date: Tue, 4 Aug 2026 01:21:41 +0000
Message-ID:
 <ZQ4PR01MB1202B695C951FF8C30E3508DF2D42@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
References: <20260801072711.153217-1-changhuang.liang@starfivetech.com>
	 <20260801072711.153217-5-changhuang.liang@starfivetech.com>
 <a4a807f1f0a4ea49feb0a3f39474ad0cb0b2ec49.camel@pengutronix.de>
In-Reply-To: <a4a807f1f0a4ea49feb0a3f39474ad0cb0b2ec49.camel@pengutronix.de>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1201:EE_
x-ms-office365-filtering-correlation-id: 7d0ff8eb-79a9-424e-d252-08def1c6bd8f
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|23010399003|366016|1800799024|38070700021|921020|56012099006|10067099003|4143699003|18002099003|22082099003;
x-microsoft-antispam-message-info:
 +NrOQFw9b0oypDmNJwecSjDTT7oM1lPZoA6fBEZnQF6dll9gAM5D7JfwfkLXQt5D5klek2fnMfpvCYGbfh8AgwebLoXb0K/K1GIYlf6U2S6x8zVRg2Iktmh+8crWvIbpi1412uJ5v/42LxiB6uoxHfa3GOhQFHi23jf8SaewuM+EmRSGKscGARLKJnM/tYM0BCXSiMLgCVTvnhvi89e4mHvVB2eetJo0M4gH6LhsYjVgTAKNPt4NqlB7JajwkAMF9vSGjTI/QybaMg3mj4EPGzt8pDcTKyZbxpkjTTawzskw67k7Kw6PbBdg2JitDbQz9FZoTDyoIcEXhSd1GYdVLN13MZh57g7MHqC7AgoXb5N0BxYIW+IEm6pBpgelbdFSlUQLSCtodLF0zIMYZyz3aJPDJfOwdkYRdZ8B5dJpvATTUE48t2dZZvlidpq28p8D2x4NKJSJlHrPpZwZTGiPZQYYZka45uq4nosx7n66iBnM4Z9K3KohChA5jSCdjyqyXxybCGRFYias9SnZk6o6MHNsFDiTgdrQ9ay/tQfX9UXvrZEy0bFgP29YDN2PN+AphUieqCF4mUjEqPhgwQI3mA==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(366016)(1800799024)(38070700021)(921020)(56012099006)(10067099003)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bysvS0lVQldBcElaOGZVSHFkb1I0RTVyOGh3SUxsOXNFdzUvV1NXa2JadktH?=
 =?utf-8?B?Zk5sZFRaczNyVGJlNGo2N2trRjZXcGt0YVhhYXZXR2F3SEJ4d2JFMjhQaERp?=
 =?utf-8?B?S3pUN25ST05GQm5Ld3o0LzF4YWp1cG9kcExFcGttVmowNmFmUFRtZ3VhemRK?=
 =?utf-8?B?OHlSVEFKd1NVNWN6Wk1TREh0emdxNGtLRWROeFZpV2lUVTROcHhSNTYrV1JR?=
 =?utf-8?B?aVMzbG8xVXErMEtRRjMvcU85cnc1OFN4eGUxWjBoMXhuVTNXMFRVSHZRMk1N?=
 =?utf-8?B?WlVwcG1oRlZ3VzhaU2VhMWZYcm40ZWUzOThvNWhsS0pnNk12VFJsaVRmc0Yr?=
 =?utf-8?B?QzdEa01Yck1LSUdGM2NiK3RqL1FWVXVxL2U0TmZjVHpsejRLVHVRa2NlTElV?=
 =?utf-8?B?Y3hDQ2RMRkNFbG9IMnliRjR3VjIrZjdHc3o4UVA3N1BBcnJLYU1Nb1V5QUpy?=
 =?utf-8?B?dFM3ZUsrNzdxYnhaWFQyV3VPYkxHKzZsQ2xIRjRERlJDVThZckVJczdIVjJ6?=
 =?utf-8?B?ejhEWHU4TEJLYzJDTHJsaXVDanFOa3dCS21ZZVZ3OXVSSCszeW9IOENBaDlD?=
 =?utf-8?B?eXh2aHQrWnVia2pLd2Z2YTlzN1ZTcHZKS3I4dE10Wko0L040WC9CbkxmVUtT?=
 =?utf-8?B?L3FwN3ZIT2gxaEUzZ2ZOQW1zQ2d0T0FlL0MzVXdJSXJuYnZjcGQ1bEFOWU5P?=
 =?utf-8?B?cGc3SVNWZkMzdmxXcjdMVTF0SGJCWGdhZXV0NlFwbnJ6ZE9tUjhEeHpzb3JJ?=
 =?utf-8?B?cGJaMzZTTVhOaHlqQ0kxUU96dXJvbWpPOU90Q3lKa25rOXBTK3l4bStyYTJj?=
 =?utf-8?B?cmJhWnZobU5RTHU5MGlzR0hhMWRhTkJpUXNhcGpybFZtYzd4T3M4SElZT1Z1?=
 =?utf-8?B?b1k0ei9EaEl3bWJ5M2hnWGtLWklBNHZXdWl2VzNTekY2WlJ3S0ZVeHh1RENk?=
 =?utf-8?B?ODV6Yy9GZGk0T3VJcFBPTFZONUdkcUFPR2R4YjdjWDcyZUwvYkNadzZSS25t?=
 =?utf-8?B?cm05Zk5OTU9BWkZYVCthQmtGZENXL1lvaVFaaWlVVmpPYTFRdlVqU0Uxc1do?=
 =?utf-8?B?UTRZQStpdldqZ2FzNW1LZUNVY2QwdEV4amxNbnR1b1Y1dFRkM3JXa053dlB3?=
 =?utf-8?B?WEF4b3lvOGNTMER6WHZpZjlqN1IramNEbG9wVVFuYVNzTjMyM00zS0pNU3Nk?=
 =?utf-8?B?dzh1d2dEQUltdnE1NTJIck1ETnM1cUEvU0xTSVR6SWNqS2UxQk5yb0xHZjlq?=
 =?utf-8?B?dXdLcitFZEFEZnVMNUZXd1NOTWdmUVV4d0dGTng1bTRZMVc0NWlvc3J0RmxS?=
 =?utf-8?B?Sm4xK1VMUWVQUnpMOUJFZXdpUC9xMjkxbDl1MnNVKzdmVlVpZFpJK0NUSlpR?=
 =?utf-8?B?VDRwc0tsQlhHTm9qRGFuZUpVbGk1NGpKcUVnM3prL3B3cHhuNnBFdVZrRng2?=
 =?utf-8?B?YjRqNk5IaG1wYUNsVWc1bytzbTVuOHBVQTJQUkp6a0VQTWhmRnBwaG05WitJ?=
 =?utf-8?B?Qkc5RXpXZVl0RTkzb2NLcUt2Rys3RTZiQVJCRnIvK1hxUEtiQnN2MzJhbWl2?=
 =?utf-8?B?M29odUlldktUampiMmx5UnQyaGtrUFBCQ1NXN1VVYy9lMGlGWHB1SGdWM3pF?=
 =?utf-8?B?U3NpMjU2UVhmN0s4c0lSTG1OR3dUWE1kV2c4UUcvZXJDTEkvczdKNlJaM1RV?=
 =?utf-8?B?dnBITTJ5dDlxeGJzM3ZBTDlndHZKQmloam1wSXZCV2p3cTIyV0ZmV2VEOEdE?=
 =?utf-8?B?YjVnWk9qVklQRDZwYUM3VXBITmFqUXNLRFdlMjY1WUpuL3Q1SCtCbFJCQmYx?=
 =?utf-8?B?bE1zQlh0SnZ3ZnFVYXI0UlV4dDJqTTYzQmpkaEdyZXlVbzVjNGVkRlg4d1F5?=
 =?utf-8?B?aVRnVXZocDJmUmozaWRtbkNiK1BucWJjUEkyTFB6TjFFenNnWnJRcWV3NjFF?=
 =?utf-8?B?Um9mTVF5TjZWR2w2VDBiYklJczNjakU0N04yT3pTaHlPQkUzTFFXcDZ6NURw?=
 =?utf-8?B?Q1VrYk9USitnOVpsa3dod2hJc1ZueVFmV3FaVWNicDZmSDF3bmJBVzc2Zkx5?=
 =?utf-8?B?R0I5dWg2MDhONW1rWVl6U0JDekVZU1ltelNGR1MzaHpLRWRDam1VMVlHN3ht?=
 =?utf-8?B?eW9tMVdNQ0cyVWRIYUJ1MEZxOWRNWmtoWU1RK2IzdnQvV1hwVjNDR0tkNjc1?=
 =?utf-8?B?MllEcUQxWDhSQmR6ZXl0ajZjbHZESUtvMDlYN1EvdXBIR2J6RGJyZVpUMjJS?=
 =?utf-8?B?OXpOZm1jT3plYmFmakNIRWFZSnhaRHljbHp2Y25sTHNIT3hVRC9HdlRaWHdK?=
 =?utf-8?B?NEphbHBpdmtpTFVFL2ZMN3ZpU05BTXdLSmR1RjNDTXhqem9FQllqV1ZpcmFx?=
 =?utf-8?Q?l8M460caNIloLVFY=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d0ff8eb-79a9-424e-d252-08def1c6bd8f
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Aug 2026 01:21:41.8881
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6bAWCdAn+Ptg2PJNPB/Df01CcVbhaSaX45myqsN8CHOoPrcL4zW7qicFJQpf8OiYZ744529vD+rJcMLsVPb9hh1h2XFs18fCNg2w35xavSOOVuqOJnND4wASyD4Q8YHd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1201

SGksIFBoaWxpcHANCg0KVGhhbmtzIGZvciB0aGUgcmV2aWV3Lg0KDQo+IE9uIFNhLCAyMDI2LTA4
LTAxIGF0IDAwOjI2IC0wNzAwLCBDaGFuZ2h1YW5nIExpYW5nIHdyb3RlOg0KPiA+IEFkZCBwaW5j
dHJsIGRyaXZlciBmb3IgU3RhckZpdmUgSkhCMTAwIFNvQyBTeXN0ZW0tMChzeXMwKSBwaW5jdHJs
DQo+ID4gY29udHJvbGxlci4NCj4gPg0KPiA+IFNpbXVsdGFuZW91c2x5IGFkZCBhIGdlbmVyaWMg
cGluY3RybCBkcml2ZXIgZnJhbWV3b3JrIGZvciByZWdpc3RlcmluZw0KPiA+IHRoZSBwaW5jdHJs
IG9mIG90aGVyIGRvbWFpbnMgKHN5czEsIHN5czIsIGFuZCBzbyBvbikgaW4gdGhlIEpIQjEwMCBT
b0MuDQo+ID4NCj4gPiBDby1kZXZlbG9wZWQtYnk6IExpYW5mZW5nIE91eWFuZyA8bGlhbmZlbmcu
b3V5YW5nQHN0YXJmaXZldGVjaC5jb20+DQo+ID4gU2lnbmVkLW9mZi1ieTogTGlhbmZlbmcgT3V5
YW5nIDxsaWFuZmVuZy5vdXlhbmdAc3RhcmZpdmV0ZWNoLmNvbT4NCj4gPiBTaWduZWQtb2ZmLWJ5
OiBBbGV4IFNvbyA8eXVrbGluLnNvb0BzdGFyZml2ZXRlY2guY29tPg0KPiA+IFNpZ25lZC1vZmYt
Ynk6IENoYW5naHVhbmcgTGlhbmcgPGNoYW5naHVhbmcubGlhbmdAc3RhcmZpdmV0ZWNoLmNvbT4N
Cj4gPiAtLS0NCj4gPiAgTUFJTlRBSU5FUlMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHwgICAgOSArDQo+ID4gIGRyaXZlcnMvcGluY3RybC9zdGFyZml2ZS9LY29uZmlnICAgICAg
ICAgICAgICB8ICAgMjAgKw0KPiA+ICBkcml2ZXJzL3BpbmN0cmwvc3RhcmZpdmUvTWFrZWZpbGUg
ICAgICAgICAgICAgfCAgICAzICsNCj4gPiAgLi4uL3N0YXJmaXZlL3BpbmN0cmwtc3RhcmZpdmUt
amhiMTAwLXN5czAuYyAgIHwgIDExOSArKw0KPiA+ICAuLi4vc3RhcmZpdmUvcGluY3RybC1zdGFy
Zml2ZS1qaGIxMDAuYyAgICAgICAgfCAxNDU2DQo+ICsrKysrKysrKysrKysrKysrDQo+ID4gIC4u
Li9zdGFyZml2ZS9waW5jdHJsLXN0YXJmaXZlLWpoYjEwMC5oICAgICAgICB8ICAxNTkgKysNCj4g
PiAgNiBmaWxlcyBjaGFuZ2VkLCAxNzY2IGluc2VydGlvbnMoKykNCj4gPiAgY3JlYXRlIG1vZGUg
MTAwNjQ0DQo+ID4gZHJpdmVycy9waW5jdHJsL3N0YXJmaXZlL3BpbmN0cmwtc3RhcmZpdmUtamhi
MTAwLXN5czAuYw0KPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9waW5jdHJsL3N0YXJm
aXZlL3BpbmN0cmwtc3RhcmZpdmUtamhiMTAwLmMNCj4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRy
aXZlcnMvcGluY3RybC9zdGFyZml2ZS9waW5jdHJsLXN0YXJmaXZlLWpoYjEwMC5oDQo+ID4NCj4g
Wy4uLl0NCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9waW5jdHJsL3N0YXJmaXZlL3BpbmN0cmwt
c3RhcmZpdmUtamhiMTAwLXN5czAuYw0KPiA+IGIvZHJpdmVycy9waW5jdHJsL3N0YXJmaXZlL3Bp
bmN0cmwtc3RhcmZpdmUtamhiMTAwLXN5czAuYw0KPiA+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+
ID4gaW5kZXggMDAwMDAwMDAwMDAwLi5lZDIzYzBjNDM5NjANCj4gPiAtLS0gL2Rldi9udWxsDQo+
ID4gKysrIGIvZHJpdmVycy9waW5jdHJsL3N0YXJmaXZlL3BpbmN0cmwtc3RhcmZpdmUtamhiMTAw
LXN5czAuYw0KPiA+IEBAIC0wLDAgKzEsMTE5IEBADQo+IFsuLi5dDQo+ID4gK2ludCBqaGIxMDBf
cGluY3RybF9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KSB7DQo+ID4gKwlzdHJ1
Y3QgZGV2aWNlICpkZXYgPSAmcGRldi0+ZGV2Ow0KPiA+ICsJc3RydWN0IGdwaW9faXJxX2NoaXAg
KmdpcnE7DQo+ID4gKwljb25zdCBzdHJ1Y3QgamhiMTAwX3BpbmN0cmxfZG9tYWluX2luZm8gKmlu
Zm87DQo+ID4gKwlzdHJ1Y3QgamhiMTAwX3BpbmN0cmwgKnNmcDsNCj4gPiArCXN0cnVjdCBwaW5j
dHJsX2Rlc2MgKmpoYjEwMF9waW5jdHJsX2Rlc2M7DQo+ID4gKwljb25zdCBzdHJ1Y3Qgc3RhcmZp
dmVfcGluY3RybF9yZWdzICpwaW5jdHJsX3JlZ3M7DQo+ID4gKwlzdHJ1Y3QgcmVzZXRfY29udHJv
bCAqcnN0Ow0KPiA+ICsJc3RydWN0IGNsayAqY2xrOw0KPiA+ICsJaW50IHJldDsNCj4gPiArDQo+
ID4gKwlpbmZvID0gb2ZfZGV2aWNlX2dldF9tYXRjaF9kYXRhKCZwZGV2LT5kZXYpOw0KPiA+ICsJ
aWYgKCFpbmZvKQ0KPiA+ICsJCXJldHVybiAtRU5PREVWOw0KPiA+ICsNCj4gPiArCXBpbmN0cmxf
cmVncyA9IGluZm8tPnJlZ3M7DQo+ID4gKw0KPiA+ICsJc2ZwID0gZGV2bV9remFsbG9jKGRldiwg
c2l6ZW9mKCpzZnApLCBHRlBfS0VSTkVMKTsNCj4gPiArCWlmICghc2ZwKQ0KPiA+ICsJCXJldHVy
biAtRU5PTUVNOw0KPiA+ICsNCj4gPiArCXNmcC0+YmFzZSA9IGRldm1fcGxhdGZvcm1faW9yZW1h
cF9yZXNvdXJjZShwZGV2LCAwKTsNCj4gPiArCWlmIChJU19FUlIoc2ZwLT5iYXNlKSkNCj4gPiAr
CQlyZXR1cm4gUFRSX0VSUihzZnAtPmJhc2UpOw0KPiA+ICsNCj4gPiArCWNsayA9IGRldm1fY2xr
X2dldF9vcHRpb25hbF9lbmFibGVkKGRldiwgTlVMTCk7DQo+ID4gKwlpZiAoSVNfRVJSKGNsaykp
DQo+ID4gKwkJcmV0dXJuIGRldl9lcnJfcHJvYmUoZGV2LCBQVFJfRVJSKGNsayksICJjb3VsZCBu
b3QgZ2V0ICYgZW5hYmxlDQo+ID4gK2Nsb2NrXG4iKTsNCj4gPiArDQo+ID4gKwlyc3QgPSBkZXZt
X3Jlc2V0X2NvbnRyb2xfYXJyYXlfZ2V0X29wdGlvbmFsX3NoYXJlZChkZXYpOw0KPiANCj4gVGhl
IGR0LWJpbmRpbmcgc3BlY2lmaWVzIGEgc2luZ2xlIHJlc2V0IGNvbnRyb2wuIFdoeSBkb2VzIHRo
aXMgdXNlIHRoZSBhcnJheQ0KPiBBUEk/DQo+IA0KPiBVc2luZyBkZXZtX3Jlc2V0X2NvbnRyb2xf
Z2V0X29wdGlvbmFsX3NoYXJlZF9kZWFzc2VydGVkKCkgY291bGQgc2ltcGxpZnkNCj4gdGhpcyBh
IGxpdHRsZSBiaXQuDQo+IA0KDQpwaW5jdHJsX2FkYyB3aWxsIGhhdmUgMiByZXNldCBsaW5lcywg
b25lIG9mIHdoaWNoIHdpbGwgYmUgc2hhcmVkIHdpdGggdGhlIEFEQy4gDQpSZWZlciB0byB0aGUg
ZHRzIGJlbG93LCBidXQgaXQgaXMgbm90IGN1cnJlbnRseSBpbmNsdWRlZCBpbiB0aGUgY3VycmVu
dCBzZXJpZXMuDQoNCgkJCXBpbmN0cmxfYWRjMDogcGluY3RybEAxMWJjMjgwMCB7DQoJCQkJY29t
cGF0aWJsZSA9ICJzdGFyZml2ZSxqaGIxMDAtcGluY3RybC1hZGMwIjsNCgkJCQlyZXNldHMgPSA8
JnBlcjJjcmcgSkhCMTAwX1BFUjJSU1RfQURDMF9JT01VWF9QUkVTRVROPiwNCgkJCQkJIDwmcGVy
MmNyZyBKSEIxMDBfUEVSMlJTVF9BREMwX1BSRVNFVE4+Ow0KCQkJfTsNCg0KCQkJYWRjMDogYWRj
QDExYmUxNDAwIHsNCgkJCQljb21wYXRpYmxlID0gInN0YXJmaXZlLGpoYjEwMC1hZGMiOw0KCQkJ
CXJlc2V0cyA9IDwmcGVyMmNyZyBKSEIxMDBfUEVSMlJTVF9BREMwX1BSRVNFVE4+Ow0KCQkJfTsN
Cg0KQmVzdCBSZWdhcmRzLA0KQ2hhbmdodWFuZw0KDQo=
