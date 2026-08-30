Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2135.outbound.protection.partner.outlook.cn [139.219.17.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 505D52848BE;
	Sun, 30 Aug 2026 02:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.135
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788055541; cv=fail; b=OdkJN4PbCNTmkHHenigzrZ4NIitSEVDHD5yWbgzqYxnd6J29xuF7wynV9ionFtvfFMOw6LF9eQL/gqvuEUY94ozSP3x+gsU8BuCbNmaUUUlpxTxUBUJh6C4bl0QzzCsUCxuf+x5wal2f1G2kZ8ZhNtUZWG607B7vv9iXPKXMNj4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788055541; c=relaxed/simple;
	bh=YAqtUGGYsV9XshQaKQBpoMdYWtgUEucY9lpKsAWZ9VQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=hdZhcsnmum0mbCAt48/ThGQTZuiYvZg0uzHnQGzhNoahwHacvuwa4soorv2sCo74iVxPozXEa/PgVHjkBbJFeln9weLeEYtWN1NJczgZRimoCg7Uv5ja5o8Qncnyd5EISdswQ6uep1hDx3iOFw7xgivyqI5ZUWMELMNTwQjKtFo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.135
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D9DGkeou1G8V/RRInkGRscSlKCHRzKEcDIST9VHv+kUhkEGDNXbF527CKemZ9AwWWQqnFOpAsfsU2I5WH0uFxsln1tANNEaIFv8E7zFG51/TIot7Dy6+YrFNpIVR9OnPCrCZGIbFGCbZjQMzuN2xYB8ZWyeRsDIOjzfUHFul5mZM1vnPXr1ww6VHyxZan1ugFO9egu0eAz3P7rxRS0ku7xmw1u+ExJHMPsrXU9qN9WNvpOemt0glrVy6kv7ZumSIM+jnaaMKyR4xuscG3W3L2C/lSOBC0n27d+oBvHhnFhcy02s88E51bG9oQUbyt3/7wtmAn84ffmvPRzgHcskpuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YAqtUGGYsV9XshQaKQBpoMdYWtgUEucY9lpKsAWZ9VQ=;
 b=jvk1p/jpl7DI3tcnxSJrx0hM93oWkw9Oov9OnFYWFrRZYxRgtEN0U2Tv2w1ful/qbcAqhvZ2Vc7B+fFYmroTZ75dAQSeYbZzy77xZLT8989kwlwxV3oWS21jDf+f88HkhVCmhV7KJKBwhx70nmZtI94crAlkA0fe+G+NTxcz8SFbS4nL5vU2ToxM4SF9NGjHpHUR53KsoiWfwsIcIGTz68XMdJjCbpOtN7qRX4sLOTIlZmPNPOq6wXreuJN0gVjDtT9I+ib8/TszZi2HIvtSHQeBg+EFQpBvu5EzmeTQxrbQUZlkkRoEIoMfeKwVpkimuC0eSHX7JoD86kOWp66mgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1235.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:15::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.19; Sun, 30 Aug
 2026 01:32:35 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0315.011; Sun, 30 Aug 2026 01:32:35 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
	Linus Walleij <linusw@kernel.org>
CC: Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Palmer Dabbelt
	<palmer@dabbelt.com>, Emil Renner Berthing <kernel@esmil.dk>, Alexandre Ghiti
	<alex@ghiti.fr>, Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>, Albert
 Ou <aou@eecs.berkeley.edu>, Bartosz Golaszewski <brgl@kernel.org>
Subject: Re: [PATCH v5 03/21] dt-bindings: pinctrl: Add
 starfive,jhb100-sys0-pinctrl
Thread-Topic: [PATCH v5 03/21] dt-bindings: pinctrl: Add
 starfive,jhb100-sys0-pinctrl
Thread-Index:
 AQHdKJKmmncLFStLcUOAd2EEccdBl7aW8JiAgAAZydCAAFDGAIAA0XrAgASfjJCAAFQugIAATPHggATOFwCAABFKgIASKYnQgABJXQCAAS4kwA==
Date: Sun, 30 Aug 2026 01:32:35 +0000
Message-ID:
 <ZQ4PR01MB12024ADB335E0E49BFFE1506F2AA2@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
References: <20260810063650.239303-1-changhuang.liang@starfivetech.com>
 <20260810063650.239303-4-changhuang.liang@starfivetech.com>
 <178634991918.1014951.7989635238440361454.robh@kernel.org>
 <ZQ4PR01MB120202070B9006984B8677EAF2DE2@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
 <20260810144012.GA1574021-robh@kernel.org>
 <ZQ4PR01MB12020D2031C400FF805791B7F2DD2@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
 <ZQ4PR01MB120275B9C0CF6BCE8C88261CF2DA2@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
 <20260814-shapeless-onyx-pronghorn-d423a9@quoll>
 <ZQ4PR01MB12022F6D6F71542033CF857BF2DA2@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
 <CAD++jL=Q38HwraN1NEOxLf_hE+k=3Q6JP+DUgQsThfYve0t0RA@mail.gmail.com>
 <20260817134715.GA18207-robh@kernel.org>
 <ZQ4PR01MB1202CB0BB258ED52179F3DF4F2AB2@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
 <bd23268f-dee6-43a0-9f8a-51ae8a272082@kernel.org>
In-Reply-To: <bd23268f-dee6-43a0-9f8a-51ae8a272082@kernel.org>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1235:EE_
x-ms-office365-filtering-correlation-id: 0f1ea456-754f-4a56-37fa-08df063691ce
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|7416014|376014|366016|1800799024|38070700021|10067099003|56012099006|5023799004|4143699003|22082099003|18002099003;
x-microsoft-antispam-message-info:
 bZrdTWc469xR6NhFDpQTL7ve9SHjzcRZ93Ins8gjpqNzwkphzzwki/m5XYVlqzNx3zw3PxhED4NleSRulcwOfK9J9Rn1kwHpMQvBPkN6wW3u1ajWlaX0gCDDH54vdCXKi2CI6G4vk6cKQ9IwonPwFjFAvKwLdNTtVjZJpKZdlpVPhFfMsdJ7/sVusdL1IIfGZEHFFmCIQ4IvyoXUw3AO0pHBO1F3JolTkWJ5C4DWdWozy+i4fgreyx2ce9kQYiit6RmRDYRvkc6kngjviUlAb2gfIviGThtHzGguM5atrkVypUHX2OID7xfqhcs0gZc144s2neub3R2M6q/r/aXPJNhWEqItfte2P2exTe3bB0by4Mj1azGJEZm+ie8rO2dHyEbUND5Zz9GfQlJi4z7GUPX5T368n/r+mkkn0uPpvTBP68WW1qOLMmwH1/bP/Zj1ksT6jf5/H2b/jr1OZ/y3PGWrBySESm5GPRF1L1MzgeKeQhi8H3SDusXBUydtc+wBpO6NqqzVTVRY2wlqVdfQtepYQKkA2uQ3yJ9Q9QweZXnex7ewgN8wunIEsuHiiBaX
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(366016)(1800799024)(38070700021)(10067099003)(56012099006)(5023799004)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?V1VrUm5EbVNKVkFsQ0FsVC9sREl1UWlKNVE4aWxFdkVQTlI2bHNiSFY3VGN4?=
 =?utf-8?B?ZEhJZGhKZ1IrN0p2VlE1SFRmTDZrRUo1Z3RnOU0xNzcvWDBLb3Q0L2pOalhE?=
 =?utf-8?B?WEJJdlNJMzNPS0xFK2Via3ZkeWhjUTY5bE43bnZnZHdlZU9NeVNpakIxUE90?=
 =?utf-8?B?KzFrYldkdlRtRmFuRWd0NDlZWVNEOFdIb2IvUlRDTExmUWxNckJ0SGg1MFRF?=
 =?utf-8?B?YUhMd2Z6YWFMZytVQkpQNXRKeCtWdWNuaHVkK1lOdXIvdkt2Q0E4bHhLczVr?=
 =?utf-8?B?QkZkeWhNblBHMUU5RFBRNGtiZTlNcTB2TzBTcXVzY2c4YmI2dWE0UmVndmIx?=
 =?utf-8?B?cEYwMVhpVU5hakpMSVVUQ1BjR2d1UzZnNUQzQ0dIUkRTUERITHlzcHAvajVi?=
 =?utf-8?B?UWRIaGkrMnF4aXVwVVpITDcwUXlSdG0rRzJEaS9qTGNQN2F5Um12Yk5RVnYx?=
 =?utf-8?B?ZkRjeTdYUXhzV1V2bFBTdGJxMVBac2NTTlIyUm9nQXBIdzlDeFcwTFVOYTJC?=
 =?utf-8?B?K1ZGd1o1R0oySHNpQ1NkcUxOc01sVHpVem9lV0FOR2Nka3pGNjB5ZzgxbkQ3?=
 =?utf-8?B?SC8vaDN4bUJONm1JUURiYzE3bnBhM3JhcjhEeEhBZ2k5R3ZOUWdnZ1pGZFBT?=
 =?utf-8?B?emtZSXZPa2FjTWZsRDlHTmg4ZU8xbkd6N1k4Y2JrVDZZQkVhR2gyQjhEMS9N?=
 =?utf-8?B?NC8rak9qT3EzK2pxdmtlVmN2cXl1cFlHU0szSXA5cXMxMzl1UWlTb0RkZlI4?=
 =?utf-8?B?TzdQR1dFMXp4YmNLelB2eXh6NXh4Q1NGekZxTy9VOHNCUzdBZFlFQU81cVFD?=
 =?utf-8?B?RWoxVU1rV0RZb05EdlRCZTZsL09paXc1bmVMTUxHbnRmK3N2ZXVPc05Kdzdt?=
 =?utf-8?B?RjJlTlBpQmpjelVSVllZUUxRdVR5MlRpbDNVNG1WelJTQk9paE9Hc2c4YTVM?=
 =?utf-8?B?bjYxeTVpYnhWMS9ySFB4RjRGV29sUEFrRkJzUTFkMmJtNDE0TDZ1WGVTTmYv?=
 =?utf-8?B?ZzZWSWtieTJSM3ltRXN0aWtaVFlnd1lYWVk1d3FiVTBkTWw4cjlpL05PNVkr?=
 =?utf-8?B?OHhkRkU1WXJDOU8xRktwNnd5UzlxaHNGcHhxVm5xTkRzTVJzSjRlcEtOK3lZ?=
 =?utf-8?B?TzdwZVdYK3pvK2tVVHc0RWM3ODZ5bmJrOU1DOHZUQmlTOE9RUVNLd0w5clhw?=
 =?utf-8?B?YkJaTHZqd0NiN0I1NzZtMWVjNHpZSGJtYmNoSHVHaUVrYS9oZGdkVU5Nai81?=
 =?utf-8?B?WnVKd2pzcXVBdGRhWUhwNVpVdURoRWJsS0NWT3d4elN0a1kvejEySmZRbjdD?=
 =?utf-8?B?NUdnSzBWcGNYbkVpL2dCWGVnWmxmcjVrNVRKaWhBMUpWbDc1SzgzMVA2VjVP?=
 =?utf-8?B?SkMrdlpkYnZ5U1hGbVhkSzRBQXhySm9YUys5anZyZDBFdmNTWGxuT0hrWTlW?=
 =?utf-8?B?Z0Q0czEvQUd3VlRDUVBLeEUyV3dXcTBxYjJza0JIaFhZZkM2KzcwMG04eHh0?=
 =?utf-8?B?TnpDaHJiUERWYXg4ZUwwbmEyMGdXYy84dDBWbTZjU3l5d1RSNGdYaEY4Z3c3?=
 =?utf-8?B?ZFkxZzZNK2pYcFdxOVBTNVA1UTNTeCtKVTI2U0ViSER3YXNOT0hxc1MyTWdZ?=
 =?utf-8?B?NDFvTS9UUUxJeUVKQTFpZ0lYNnhSaTRSMzBMY0dUSEo2Q3lvUzN4Q2ZJSm5O?=
 =?utf-8?B?NEJMeUNtMW5zZ2FiUTByOFFoQlZNby9QbXZ4MHo4d2w5MElRWThveGZIWWJN?=
 =?utf-8?B?OWkzRFhLaG5lMEVaYmxvaWNRR1NaUVFSK3JFMytiUjBad3RoUzBBT0JqSUJB?=
 =?utf-8?B?QmxvTnNUbFJtT2FDNTROdGlWZklpVjAwVjVWSmUrY01Bd1FTcEtWT0wwQys5?=
 =?utf-8?B?bG1SS2kwQm9Ha0xkUzh1WXoxK1ZRK3BVejBidldyczVJQXlKT2phT1ZYcWRa?=
 =?utf-8?B?aVRsSVpVZUkwNjNRRWxMbTVJOHhZdDJJcTJyd1JyT3g2djNVcEdQejR3dXZa?=
 =?utf-8?B?SW42Zm8xSG4zOVdLMGV0OFh0b3pQOXdRbjVENGtMUTBKTVk1TkdzTFZNMW9B?=
 =?utf-8?B?dnkxK0czV05VYk1tbnplcUJCaEVnQ2lpQitWblJsbzNOK0dvMG1uTTI2NEtQ?=
 =?utf-8?B?YnkreFhsU3hHNEE0RHZyU050MkhHblJpMUIrWnVuOUxGSUQyTUs5UW5Vbklj?=
 =?utf-8?B?c0VneG5ralFFRmh1SytBay93aXd4d2VuSHQxYnRTN1JqamdKNnlzT2d1NFVD?=
 =?utf-8?B?NUhYOWs1L1NmNlNIaDA5bzhMZ2RIb0Q4VVZ1d3gxNERhRWd4amM3MzVsYXNz?=
 =?utf-8?B?ZWRlMlc3OERUVXFSdExLYTQwOTVkUUhENUdVWDI0cjB0VUdtUVczZ0ppa0tl?=
 =?utf-8?Q?Esd47lUbhjgiPJ0A=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f1ea456-754f-4a56-37fa-08df063691ce
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Aug 2026 01:32:35.4040
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4IZu5ojFcdYrvN/rRnW/OCXBXQWykRx9oo8y1yzrJHMVqSdOM+jlDmu2AQ1Wlct9WgS3UlVbiM7vRVv8lfPQ3vi+5mdutAT4ZJMgWlbWiadFU73i6YYuT9GnaZl5++Lx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1235

SGksIEtyenlzenRvZg0KDQpUaGFua3MgZm9yIHRoZSByZXZpZXcuDQoNCj4gT24gMjkvMDgvMjAy
NiAwNTowOCwgQ2hhbmdodWFuZyBMaWFuZyB3cm90ZToNCj4gPiBIaSwgUm9iLCBLcnp5c3p0b2Ys
IENvbm9yDQo+ID4NCj4gPj4gT24gTW9uLCBBdWcgMTcsIDIwMjYgYXQgMDI6NDU6MjJQTSArMDIw
MCwgTGludXMgV2FsbGVpaiB3cm90ZToNCj4gPj4+IE9uIEZyaSwgQXVnIDE0LCAyMDI2IGF0IDE6
MjLigK9QTSBDaGFuZ2h1YW5nIExpYW5nDQo+ID4+PiA8Y2hhbmdodWFuZy5saWFuZ0BzdGFyZml2
ZXRlY2guY29tPiB3cm90ZToNCj4gPj4+DQo+ID4+Pj4+IFlvdSBzdGlsbCBkaWQgbm90IGV4cGxh
aW4gdGhlIGNlbGxzIC0gbmVpdGhlciBpbiByZXBseSBub3IgaW4NCj4gPj4+Pj4gY29tbWl0IC0g
dGh1cyBzdGFydCB3aXRoIHRoYXQuIFdoeSBkbyB5b3UgbmVlZCBpdD8gTXVsdGlwbGUNCj4gPj4+
Pj4gY29udHJvbGxlcnMgaGF2ZSBncm91cHBlZCBwaW5zIG9yIEdQSU9zIGluIHJlZ2lzdGVycywg
c28NCj4gPj4+Pj4gZXhwbGFuYXRpb24NCj4gPj4gImV2ZXJ5IDMyIEdQSU9zIGNvcnJlc3BvbmQg
dG8gb25lIHJlZ2lzdGVyIg0KPiA+Pj4+PiB0ZWxscyBtZSBub3RoaW5nLiBXaHkgd291bGQgdGhh
dCBtYXR0ZXIgaG93IG1hbnkgR1BJT3MgaXMgaW4gb25lDQo+ID4+IHJlZ2lzdGVyPw0KPiA+Pj4+
DQo+ID4+Pj4gU2luY2UgZXZlcnkgMzIgR1BJT3MgY29ycmVzcG9uZCB0byBvbmUgcmVnaXN0ZXIs
IExpbnVzIHN1Z2dlc3RlZCBhdA0KPiA+Pj4+IHRoZQ0KPiA+PiB0aW1lIHRoYXQgSSBjb3VsZCB0
cnkgdXNpbmc6DQo+ID4+Pj4gZ3Bpb3MgPSA8JmdwaW8gW2luc3RhbmNlXSBvZmZzZXQgZmxhZ3M+
OyBncGlvLXJhbmdlcyA9IDwmcGluY3RybA0KPiA+Pj4+IFtncGlvX2luc3RhbmNlXSBncGlvX29m
ZnNldCBwaW5fb2Zmc2V0IGNvdW50PjsNCj4gPj4+Pg0KPiA+Pj4+IFRoZSBhZHZhbnRhZ2Ugb2Yg
dXNpbmcgdGhpcyBpcyB0aGF0IGluIGEgR1BJTyBjb250cm9sbGVyIHdpdGggbW9yZQ0KPiA+Pj4+
IHRoYW4gMzIgR1BJT3MsIGV2ZXJ5IDMyIEdQSU9zIGNhbiBiZSB0cmVhdGVkIGFzIG9uZSBHUElP
IGJhbmsuIFRoaXMNCj4gPj4+PiB3YXksIGluIHRoZSBkcml2ZXIsIGNvbnZlcnRpbmcgcGluX29m
ZnNldCB0byBncGlvX29mZnNldCBkb2VzIG5vdA0KPiA+Pj4+IHJlcXVpcmUgYQ0KPiA+PiBsYXJn
ZSBudW1iZXIgb2YgLzMyIGFuZCAlMzIgb3BlcmF0aW9ucy4NCj4gPj4+Pg0KPiA+Pj4+IHRoZSBm
b2xsb3dpbmcgaXMgTGludXMncyBvcmlnaW5hbCBzdWdnZXN0aW9uIGF0IHRoZSB0aW1lDQo+ID4+
Pj4NCj4gPj4NCj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsL0NBRCsrakw9dHZEQldKSFJH
R0p3NG5ub3hfa2NKS241aHd2d3o5engNCj4gPj4+PiBhZE1SZWR5dlJod0BtYWlsLmdtYWlsLmNv
bS8NCj4gPj4+DQo+ID4+PiBKdXN0IGNvcHkgdGhpcyBleHBsYW5hdGlvbiBpbnRvIHRoZSBjb21t
aXQgc28gaXQgaXMgY2xlYXIgd2h5IHlvdQ0KPiA+Pj4gbmVlZCB0aHJlZSBjZWxscyBmb3IgdGhp
cy4NCj4gPj4NCj4gPj4gIkNhbiB1c2UgZ3Bpb2xpYiIgaXMgbm90IHJlYWxseSBqdXN0aWZpY2F0
aW9uLiBOZWl0aGVyIGlzIGF2b2lkaW5nIGENCj4gPj4gc2hpZnQgYW5kL29yIG1hc2suIEkgc3Vw
cG9zZSB0aGVyZSdzIHNvbWUgaC93IGF0dHJpYnV0ZSBoZXJlIHRvIGp1c3RpZnkgaXQ/DQo+ID4N
Cj4gPiBJJ2xsIGdvIGFoZWFkIGFuZCBzZW5kIG91dCBhIG5ldyB2ZXJzaW9uIHBlciBMaW51cydz
IHN1Z2dlc3Rpb24uIEluDQo+ID4gdGhlIG1lYW50aW1lLCBpZiBhbnlvbmUgaGFzIGFueSBhZGRp
dGlvbmFsIHRob3VnaHRzIG9yIGZ1cnRoZXINCj4gPiBmZWVkYmFjaywgSSdkIGJlIG1vcmUgdGhh
biBoYXBweSB0byBpbmNvcnBvcmF0ZSB0aGVtLiBQbGVhc2UgZG9uJ3QgaGVzaXRhdGUNCj4gdG8g
bGV0IG1lIGtub3chDQo+IA0KPiBZb3UgZ290IGZlZWRiYWNrLi4uIGhhdmluZyB0aGluZ3Mgb3Jn
YW5pemVkIHBlciByZWdpc3RlcnMgZG9lcyBub3QgbWFrZSB0aGVtDQo+IGEgYmFuay4NCg0KT2th
eSwgSSdsbCByZXZlcnQgdG8gdGhlIGluaXRpYWwgYXBwcm9hY2ggb2YgdXNpbmc6DQpncGlvcyA9
IDwmZ3BpbyBvZmZzZXQgZmxhZ3M+OyANCmdwaW8tcmFuZ2VzID0gPCZwaW5jdHJsIGdwaW9fb2Zm
c2V0IHBpbl9vZmZzZXQgY291bnQ+Ow0KDQpCZXN0IFJlZ2FyZHMsDQpDaGFuZ2h1YW5nDQo=
