Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2090.outbound.protection.partner.outlook.cn [139.219.146.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 941FC3AFD0C;
	Mon, 10 Aug 2026 09:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.90
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786355484; cv=fail; b=KxyusOxJoh8jbm1omi3Y8B5I53lEWqR18jBbpe2KF/xUAlHFyDvmI9WWwQOLu1s1h+/KqS+eRBntZbavxIAEkc93KBKWFFtkTlEP0oyIp30DC8Tnr9Zswu02yc2YR8tTy1Cw+NiHkI7+OFGUCYIsNiy96uZN3WNvgG1sWgY/Ke0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786355484; c=relaxed/simple;
	bh=OOj7yMryU815aAVtP720aa9aJR63pRSGTjtdOkWuC+o=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=OgA3AIt01uDWQoLQ93yG1XmKCTO8soNtH7Nhjx68lMQNcZAIrwcD6SItDgVp6SeQ3OXyZ2hZIWUtabyAtvvnUP4MrEtDLhvekK7L1pv3PAbIHbjoevSxZAX8L4hLJ3owYah0nCEzVXf5SBp3NVUNkLmBthkVjShXDjtsBhmtZUQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y+etFNkfQ6LkVj+yi8q01TBMl8JOGfI/TOGDM7Cl7Nd4yvBHMS9o2/nWJx4dCGqdTbK2sDxRkjmy36EsbzPtnMtCc6ZzCkHi4slLQgaWWRT1wYwDNTV5oxOYgQ3p5ecVvANDOherx8S+bcuL0Yh/ivoc/+l2n5aSyuD+tDxd+6eJ6J9qNUpfWe2A9HTA7CB6ab3YQ+QndTq8N6o0H1Hk0JfGnh7xTX9xwYQOj+ijAxaxqWCxgwWV//WkDpLpnnxpmL7vStTe8U08ej+14R2aCOXF4mnRYBbnlrqtDhsdNeyWGIjRuhgDvhA12KiZ+30rhTbG00a583Y0BSDYjqYECg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OOj7yMryU815aAVtP720aa9aJR63pRSGTjtdOkWuC+o=;
 b=Tx7jYXeNhGOkvB8NCe2OLUlT3ONx2wEDA76RZfOnPgkpToOR2u9uZCweZC1VymLnmAlLXaLdUuAgk3xl5IdXzUumFynrgLsalgMzSIiiLj6VAkmkH5cks+PCffB+fa7W97smCs1wr7teg5jNr7SrZTncx/m4QdEKQ3zUqxdGLqoaY936azEN9Gx/iOU/IMLQu5CBDsnuPbEW2aSGFzPKCfRS+YctQwGraBX8XEpleMHzT6jRv1lSVrLaTlYrGRF9nIUVZ26grSQouwbjyZUKzOvdwXizPENIRH5tbs9xNr/rc/C/zLR5XAibRF0VUF/QmdDUIRNzoYXbJhyQ6Tr+jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1172.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:14::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Mon, 10 Aug
 2026 09:51:07 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0292.024; Mon, 10 Aug 2026 09:51:07 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
CC: Linus Walleij <linusw@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
	Paul Walmsley <pjw@kernel.org>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Emil
 Renner Berthing <kernel@esmil.dk>, Alexandre Ghiti <alex@ghiti.fr>, Lianfeng
 Ouyang <lianfeng.ouyang@starfivetech.com>, Albert Ou <aou@eecs.berkeley.edu>,
	Bartosz Golaszewski <brgl@kernel.org>
Subject: Re: [PATCH v5 03/21] dt-bindings: pinctrl: Add
 starfive,jhb100-sys0-pinctrl
Thread-Topic: [PATCH v5 03/21] dt-bindings: pinctrl: Add
 starfive,jhb100-sys0-pinctrl
Thread-Index: AQHdKJKmmncLFStLcUOAd2EEccdBl7aW8JiAgAAZydA=
Date: Mon, 10 Aug 2026 09:51:07 +0000
Message-ID:
 <ZQ4PR01MB120202070B9006984B8677EAF2DE2@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
References: <20260810063650.239303-1-changhuang.liang@starfivetech.com>
 <20260810063650.239303-4-changhuang.liang@starfivetech.com>
 <178634991918.1014951.7989635238440361454.robh@kernel.org>
In-Reply-To: <178634991918.1014951.7989635238440361454.robh@kernel.org>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1172:EE_
x-ms-office365-filtering-correlation-id: 5aa7fc97-9e48-4d34-a986-08def6c4e694
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|7416014|376014|23010399003|18002099003|22082099003|56012099006|3023799007|38070700021|4143699003|10067099003|6133799003;
x-microsoft-antispam-message-info:
 MVG9PrqRFSS7M5AmGD/88FJOXG6GxSN8A9UQlCc6kCXYbJtR3OURetN6ZYdwES59WCCIlc+e/nqe29gAdwNkvhnJequHW01pGyJznZth8oco/9SpAupDf7FL/9jmPfEhEJrPo2tJ+nrITdbQbGt8SmTRMAdx1Nx6cQvEnDxar20YVEEgULZMJ8QAjyEoRbrwqimoj/Z2m3U03tDPAF1fbiI3ZJyH5PyJZ4tAa5VURwvK1HDrK2cyFLaJ0jsZQwZgLEAR8DfKaCAdhZoUCuE2n7bAIUW6jJYiXQz2qJFYUGrHeDd5E4VlcWYGKS/p09Da/cg7Bny8S3KAGat+3sgjg9jNKAXiqx2qDG04KLZxZpP/tD4vfYkS7a0+j6mjPsmfC94HGA10X/jSWh0rlb9inwCgNC3tFFyxhGD/NCxfEHb/qpCQkBzhYqEH72UtTucu55Iwae3bS6dCw34K3n8X9+/CKxY+7oAzuV8Iz3cfuAvO46XyyVEoICnAYI7R8+3+uu/zHmXQg4aKgOucv0HMJH8oWcS+C2LIL+ffz8XXZOtui11sY0uO7EVuWQSvsyE8
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(23010399003)(18002099003)(22082099003)(56012099006)(3023799007)(38070700021)(4143699003)(10067099003)(6133799003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VndtN2ZSdmI3MnFrZklTL3lMQnZxYkV2Rzg5TENUMXlvbldEcHN3Zml3eXMw?=
 =?utf-8?B?VTFIVjZUL3ZQVHhWZjkrd2tVd1RtWmR3TnZMWDVRa3lWVU94U08rM1J2YTRZ?=
 =?utf-8?B?UjFOb3lIRTN0R3ZXdEhoVnBoSmhPbjJyVFgvcVV1YnVFUFY2ZFBGaWlrUnU3?=
 =?utf-8?B?VExyalh6TzJBdFNWNDVicnphRFhFdGt3VWY4L2I5QkNCdEYwbjcwN0JGTCt2?=
 =?utf-8?B?U0FRQ0dPMWlrc2RQTXNodGNlUzVPbG5HSVRwMk1nWXBoV0dZcEh1SzRJQW4y?=
 =?utf-8?B?VGRFb1k2NXJFa0ZDWHBSZUR6Z1U2TFpWdTN1REdwRVJ1bDdxWm5jNUZTTll3?=
 =?utf-8?B?NW9sZW1GMFhPQVJJQ0Z2VTBqWGZwMmU5UWN1V0JYNHNaOHVvUkFpTXdWL3li?=
 =?utf-8?B?OWRIQ1ZmUEV4Z1dVdXVGbFVxN1VLMWJmZTl1QlZRMThJaTdicnJOZ3VIWTR5?=
 =?utf-8?B?RWJhd3h5OHhIbWVwS1hzdmZxRnFIWHFEbW51MWNCWHQ3S2dsc0tjNjB0alhT?=
 =?utf-8?B?THl4OHVkcUJkbXB0UlBQYWVha1FTZUZTSWt3Vk1mRXVBUWhxczJpOHVpb0Z1?=
 =?utf-8?B?aXZUR3pVRm12emRLU3ZNdUhOUjVUQ05sTElSRjBHb0FhRjJ3OHFFZHdFK2Vx?=
 =?utf-8?B?blJZck9qWWxvOW9Cb3N3aG4wSThEVkdLTkdzdkNzckVYTytVVytPTHBjc0ZT?=
 =?utf-8?B?eUhZOWE0dTJlak1wT1JKbHhaejNlOWdFd3hhYXpKaGM2ajJZSVpCSnFzMUJl?=
 =?utf-8?B?WHdWL0FzaCt0TWJWbzJhbngxRTlLNGM3VmJHQ0FlZlZRcTMrMkh5d3NuNmpQ?=
 =?utf-8?B?aXdvQUhQbEQ3MGRGUUw2cFhDSUluZzRGSUVhekJxZCtTVDZucmVxRzJCUVRU?=
 =?utf-8?B?NkVIR2N3SzVBd3l2Qm4xWUhOTDZNTmVHNEZ0QW5RUytiQ0tNSzhFcWNKQVNE?=
 =?utf-8?B?QmFVNFpsanlaM3lINXN1QTRZSVhQZ29hZDR5OWV4MTdVdjhVdTVEUWtma0E5?=
 =?utf-8?B?aWJVZkJvZFBZcGx1bWdQaklKbWFMWVRsaXVJcEJkeXFPUVExVWo0TEROS0Iy?=
 =?utf-8?B?ZXZ3YzUxdDV2OTRYSE5HOTQvVEMwVFBkaExURUFtSnQvNjFIZDlZWHNPWmVk?=
 =?utf-8?B?NkY3bU02SVpPd2EyV1Frd0FQdlhYYTNPcE55cmlyMVFmbEhWbEEwbDdsVjE3?=
 =?utf-8?B?cFM1RkIyVmJReVB4THNnZlZ2UFY5MEZOYWFDOHJDVE5iVWRQU1MvamJaSW9S?=
 =?utf-8?B?b0pteVZCKzFOK3NXVWlvQWwzYVBYYU5BL2Z4OGhiTVc2SVVvYno5OW9hdHdB?=
 =?utf-8?B?ZFkvdzJ0MUNFckttejNHVTk1VVpQL092ZnZGTU1VNUs2QXdhYnhYYzNiVmVH?=
 =?utf-8?B?V25oUVA5V0hSWTVxS2NRRXlLZXBiN3NiNjgrbGlQQXl3MDRYZDgzY0crV1Zl?=
 =?utf-8?B?Q3BSZnFsVThhZDY5QW1kUlA3T2tGN003OVArZWNYWUlJd1ZxMHNsT1E4aWxi?=
 =?utf-8?B?d1IxWVNOZHhaZU90TGN0dW9EVzJ4T0hBUTlxNG1kOGh2SnpJQmNsUzI3cm9r?=
 =?utf-8?B?M0Qydkc0SXJaaFpINUdyMjBUSlBUU3NtN3N5VjFpemxoZjlTYk9ZQk1ReGJn?=
 =?utf-8?B?UW5TdVlUdTlwOWROSW9NVjBPaXNzUE14T0RrWldtTXRaT1haeEpnbVVqOTgy?=
 =?utf-8?B?UHBXNlRrSEFxQmI4VU1kcEZNbDRGOTlXSHE2OHdWZWtSVHNKd3VXTUN3R1lC?=
 =?utf-8?B?dUhJU2h3RXFKdmVQOFlkc0U2Wkp3dG0xd0hVelh4bFJsK0FGaEZEMHlYeXJa?=
 =?utf-8?B?bHV5RHhFSk9aY1dDcGpnRHd1WkIzSHlUNCthU2pUV25lZEFORm5zOHVvZXFR?=
 =?utf-8?B?MVdTRGxhT2FLUTFOcngxdE5VNlliSlo0QUhIakhoWVpFOTU1dG10NmZMWUJM?=
 =?utf-8?B?WnhMS0hGYnFGQzkydDdwMmgzdXpadFJ5WXhPMTBER2t3QXU5a0VuQk93RHhK?=
 =?utf-8?B?TVFRSUM0Z2dvMTJHdkZMUVQ0c21RWjlQRUhXN0pQK3RRNXNJUXNiSHJxVHdY?=
 =?utf-8?B?aENlNDNOd0JLdUVVZ1F4QzRJaXRyaHNlMDFYb05kOElHbHNlTFhpUEk4TjRz?=
 =?utf-8?B?VTZmS0IwbWlUOFN4NVQzenRCYzNDVUI4aHkyVG1kenptazAxenR0anoyY0dv?=
 =?utf-8?B?YUo5WUtpRmNPMnNMVUJqY2dzUll3QkNJVldyb0VMRzhqM2RiYnFldHNlL1FD?=
 =?utf-8?B?bE5CeXdQZ3VGVFp4Z0Nqc0dLdFh6disrYS9LOERaOW9DRE9aWmkxaFppamJQ?=
 =?utf-8?B?dEtIOGZZTU5tZkNoUmR2bTBGekxIejh6Y0FXcGtVOGlKU3dsTE5lMVdveWx4?=
 =?utf-8?Q?0WhPqOuDif3pI0X0=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 5aa7fc97-9e48-4d34-a986-08def6c4e694
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Aug 2026 09:51:07.5183
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CG3iavWKFHr8FR2Pm+qxPayESPA9DeAGGqng3wvYA56JMj/iJrkW07ltf6OIPlS6cE4ar+VEL+GwtD4NZRz3pOqH0pMexk9rWGlExGVTTmu3PoPMN1vnp3iVfB/76M1s
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1172

SGksIFJvYg0KDQo+IE9uIFN1biwgMDkgQXVnIDIwMjYgMjM6MzY6MzIgLTA3MDAsIENoYW5naHVh
bmcgTGlhbmcgd3JvdGU6DQo+ID4gQWRkIHBpbmN0cmwgYmluZGluZ3MgZm9yIFN0YXJGaXZlIEpI
QjEwMCBTb0MgU3lzdGVtLTAoc3lzMCkgcGluY3RybA0KPiA+IGNvbnRyb2xsZXIuDQo+ID4NCj4g
PiBTaWduZWQtb2ZmLWJ5OiBDaGFuZ2h1YW5nIExpYW5nIDxjaGFuZ2h1YW5nLmxpYW5nQHN0YXJm
aXZldGVjaC5jb20+DQo+ID4gLS0tDQo+ID4gIC4uLi9waW5jdHJsL3N0YXJmaXZlLGpoYjEwMC1z
eXMwLXBpbmN0cmwueWFtbCB8IDE2NCArKysrKysrKysrKysrKysrKysNCj4gPiAgLi4uL3BpbmN0
cmwvc3RhcmZpdmUsamhiMTAwLXBpbmN0cmwuaCAgICAgICAgIHwgIDE3ICsrDQo+ID4gIDIgZmls
ZXMgY2hhbmdlZCwgMTgxIGluc2VydGlvbnMoKykNCj4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0DQo+
ID4gRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BpbmN0cmwvc3RhcmZpdmUsamhi
MTAwLXN5czAtcGluY3RybA0KPiA+IC55YW1sICBjcmVhdGUgbW9kZSAxMDA2NDQNCj4gPiBpbmNs
dWRlL2R0LWJpbmRpbmdzL3BpbmN0cmwvc3RhcmZpdmUsamhiMTAwLXBpbmN0cmwuaA0KPiA+DQo+
IA0KPiBNeSBib3QgZm91bmQgZXJyb3JzIHJ1bm5pbmcgJ21ha2UgZHRfYmluZGluZ19jaGVjaycg
b24geW91ciBwYXRjaDoNCj4gDQo+IHlhbWxsaW50IHdhcm5pbmdzL2Vycm9yczoNCj4gDQo+IGR0
c2NoZW1hL2R0YyB3YXJuaW5ncy9lcnJvcnM6DQo+IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9waW5jdHJsL3N0YXJmaXZlLGpoYjEwMC1zeXMwLXBpbmN0cmwuZXhhDQo+IG1wbGUu
ZHRiOiBwaW5jdHJsQDEzMDgwMDAwIChzdGFyZml2ZSxqaGIxMDAtc3lzMC1waW5jdHJsKTogZ3Bp
by1yYW5nZXM6MTogWzRdDQo+IGlzIHRvbyBzaG9ydA0KPiAJZnJvbSBzY2hlbWEgJGlkOiBodHRw
Oi8vZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9ncGlvL2dwaW8ueWFtbA0KPiANCj4gZG9jIHJlZmVy
ZW5jZSBlcnJvcnMgKG1ha2UgcmVmY2hlY2tkb2NzKToNCj4gDQo+IFNlZQ0KPiBodHRwczovL3Bh
dGNod29yay5rZXJuZWwub3JnL3Byb2plY3QvZGV2aWNldHJlZS9wYXRjaC8yMDI2MDgxMDA2MzY1
MC4yMw0KPiA5MzAzLTQtY2hhbmdodWFuZy5saWFuZ0BzdGFyZml2ZXRlY2guY29tDQo+IA0KPiBU
aGUgYmFzZSBmb3IgdGhlIHNlcmllcyBpcyBnZW5lcmFsbHkgdGhlIGxhdGVzdCByYzEuIEEgZGlm
ZmVyZW50IGRlcGVuZGVuY3kNCj4gc2hvdWxkIGJlIG5vdGVkIGluICp0aGlzKiBwYXRjaC4NCj4g
DQo+IElmIHlvdSBhbHJlYWR5IHJhbiAnbWFrZSBkdF9iaW5kaW5nX2NoZWNrJyBhbmQgZGlkbid0
IHNlZSB0aGUgYWJvdmUgZXJyb3IocyksDQo+IHRoZW4gbWFrZSBzdXJlICd5YW1sbGludCcgaXMg
aW5zdGFsbGVkIGFuZCBkdC1zY2hlbWEgaXMgdXAgdG8NCj4gZGF0ZToNCj4gDQo+IHBpcDMgaW5z
dGFsbCBkdHNjaGVtYSAtLXVwZ3JhZGUNCj4gDQo+IFBsZWFzZSBjaGVjayBhbmQgcmUtc3VibWl0
IGFmdGVyIHJ1bm5pbmcgdGhlIGFib3ZlIGNvbW1hbmQgeW91cnNlbGYuIE5vdGUNCj4gdGhhdCBE
VF9TQ0hFTUFfRklMRVMgY2FuIGJlIHNldCB0byB5b3VyIHNjaGVtYSBmaWxlIHRvIHNwZWVkIHVw
IGNoZWNraW5nDQo+IHlvdXIgc2NoZW1hLiBIb3dldmVyLCBpdCBtdXN0IGJlIHVuc2V0IHRvIHRl
c3QgYWxsIGV4YW1wbGVzIHdpdGggeW91cg0KPiBzY2hlbWEuDQoNCkhpIFJvYiwNCg0KUmVnYXJk
aW5nIHRoaXMgbGluazogaHR0cHM6Ly9naXRodWIuY29tL2RldmljZXRyZWUtb3JnL2R0LXNjaGVt
YS9ibG9iL21haW4vZHRzY2hlbWEvc2NoZW1hcy9ncGlvL2dwaW8ueWFtbCNMNzENCg0KSXQgc2Vl
bXMgdGhhdCB0aGUgY29uZmlndXJhdGlvbiB0byBzdXBwb3J0ICNncGlvLWNlbGxzID0gPDM+OyBo
YXMgbm90IGJlZW4gYWRkZWQgaGVyZSB5ZXQsIGlzIHRoYXQgY29ycmVjdD8NCg0KQmVzdCBSZWdh
cmRzLA0KQ2hhbmdodWFuZw0KDQo=
