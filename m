Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2099.outbound.protection.partner.outlook.cn [139.219.146.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C5223C0A03;
	Mon, 27 Jul 2026 06:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.99
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785132008; cv=fail; b=TnQ8OhhAHZ45yg3W3bIu1HrmMvZjxmsGBc1ec3GQn81uq5PzHIrggXIzOAO/53DQQrMpyrNE0Muywu3o1FHk+2oSTlMzjmarLpow32LbStd661GwfZOMyPxqgL0qcOOQ9unACleZtxwA5cj+Y8lu2jS3ycdAqabhQEDq7Jo+680=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785132008; c=relaxed/simple;
	bh=dxfTMHJOIgA1Ct/lF5LgWH+prIhheH0iWT53Wz6vGDk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=mf9KYrgNhh8drWvGeYNynyUGjpeo95hO3x2CuEA4PdS8KyhhaUayVRTAB335o43xL6NOGfiZEUwRzQtgmbfAz0HpEQFRm42yOBqsY8Z0msvVbp8RSEsacy3z2BJ0f6ZQmpND+azx4K0pOS+5P+wSYbGMHQdpebRjUp2SO/Ck5MM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HI7MT4G2XMxMtlUlzaPca5sAgZNDe4zH9o+eDrDAt9z2uhcJBCGfceAjHlQKQUwY3dVX/Vmyi0qxQQ8VE8Pox6HMy3g9oM7B06M85z09Idkm35K0KJ5OCrUQabNcBKJk0Zw91nFJCPEp1HhxtNnJWMLrEwUCcijWYeQSeJGAZGX3QFqJ/tZDChVvE4WSBBP5YjZesa1UMl9NO/V3Xr0w3Hpb2Qk8ctTXNUL+8/FRwbD1cJUSWYCREA990BOV50wg/UeV+DD6U+TtLkCVALWA6wZiVVxGJCUXtIwiku2HL1w6GwEzThHK0BjkxgjjWdI5ciG2SfWBv5nyJW8UDn7SLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dxfTMHJOIgA1Ct/lF5LgWH+prIhheH0iWT53Wz6vGDk=;
 b=FBM9Rc0ScHQH7guU8BBjGwPzWLrcqIQqJQ3eaWnatYt+grZGadcPhCOf263DKIXEiFVwbMz/8bin6+v4D9n6o0Oga3VVhFVGSJd78BkVh2BiYAnf9a46wyQlaeLl5vRrS7X9M6rADaSXxsehYfSkZW+PcM9Nq7OpEcGwHbgcLBDb5lFzXdm/uXnKf2+ul5FOtujgdCn3Ver4DWCKaGjSR6Uqx0aTWZgvaFJugQkhFFfnruWVgqo2dBYd5HnqdC1oHbTP9lBPwGLNfVEsKWp1SFKsWCgvDl8PKs2qIAT2HTkNNMwucWfE0QqVKGQdxPg4k7Vi4fUUpfZKUj7/yG6+0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1316.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:14::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Mon, 27 Jul
 2026 03:26:04 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%2])
 with mapi id 15.21.0245.012; Mon, 27 Jul 2026 03:26:04 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Linus Walleij <linusw@kernel.org>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Emil Renner Berthing <kernel@esmil.dk>,
	Paul Walmsley <pjw@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Palmer
 Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>, Philipp Zabel
	<p.zabel@pengutronix.de>, Bartosz Golaszewski <brgl@kernel.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, Lianfeng
 Ouyang <lianfeng.ouyang@starfivetech.com>
Subject: Re: [PATCH v3 04/21] pinctrl: starfive: Add StarFive JHB100 sys0
 controller driver
Thread-Topic: [PATCH v3 04/21] pinctrl: starfive: Add StarFive JHB100 sys0
 controller driver
Thread-Index: AQHc8x1jj1AWoBKzsESqiyGUJQ5KXbY5RwGAgEUSdKCAAEHjAIACbbtQ
Date: Mon, 27 Jul 2026 03:26:04 +0000
Message-ID:
 <ZQ4PR01MB12021A2E486C8CC1B19603DEF2CC2@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
References: <20260603055347.66845-1-changhuang.liang@starfivetech.com>
 <20260603055347.66845-5-changhuang.liang@starfivetech.com>
 <CAD++jL=Qd8ADR_kX2Q7msM4Dd0xFayPGM4ZzB3uv2ufvkuybtQ@mail.gmail.com>
 <ZQ4PR01MB120228AD03507B4836EFE19DF2CE2@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
 <CAD++jLnNa6HsS5q5aYHxCLkQdZ3eh09PspO=eZx-4=p4EFr4PA@mail.gmail.com>
In-Reply-To:
 <CAD++jLnNa6HsS5q5aYHxCLkQdZ3eh09PspO=eZx-4=p4EFr4PA@mail.gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1316:EE_
x-ms-office365-filtering-correlation-id: 60ec883d-8cbb-4d6e-f183-08deeb8eca24
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|366016|1800799024|7416014|376014|10067099003|4143699003|6133799003|56012099006|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info:
 qHerjFOgSCk15+WWX21IkNOX5hXCgJVBDRs0AZB4rCvGbZy49t6DJfmf0WerrSiqhN40D94wqjrF0JpMd4mkss1KiEvkoM+yJjhWSh3/hPDmCP1TJmDFihfNDgijOD6FpwzXh1YvcYMKrhNHXWOaDsAj79Rqbr7JNsR83QOiN9yXz5MLRQZCv2t7jdOfbBMFgrLgFeitZv+fLryeloJ0l69O7WbYDOGb2bPGLUvAUTwR4o8qKIeWa2T2vV7xzxteRThYvjL9Gg4YZoJXrBK3JqDmj/zI9XZau3IkfQtUvTnYpUWDJIJyiwE/+D44zFpTdIW7b3ZdNhNnhSw8XW6tyY9GAF++oE1n9PYmNumIord8Or70DrifWWSd+CwjwbqaBEg8H31EK6n648hJr/SPQW4CZPWaJdKhboZBW8PZ6GxVTehBZgvVssCwNXyyW9VQNEWRePSe4fJzy9QkEew6E6JcvxoS74IUbJv0xZ5Xn+ivKQUotBcl/SFt7xlmKuHohbCNgr1ujnXXlsLrnr130njM42v6+NJJs//ZqTZKbymxsIFEpCmI19UkSYInjJRS
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(7416014)(376014)(10067099003)(4143699003)(6133799003)(56012099006)(18002099003)(22082099003)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?aFh4QWtJNTA0OGtxYmc1UEI0MFN3UC90SWNkWDBSVzJMMmtZNVZ4TDFJV0NO?=
 =?utf-8?B?MmppTVpaZ21Kc0JTdzhKWGdiYlRkb2pLcWVvOVRabmc1d2lLMU9JMW5GTE9x?=
 =?utf-8?B?dElpdzgzWGptR0FYYjV3RWpRWXNkQWFLK1UxNWlHbUtJb2dnZTN3clY5dk9h?=
 =?utf-8?B?dTFpb0pjSEpoMzVmZDM2NThkeG53UERMZ3RCTG53Uk5naEFsamVYYWd2QWpx?=
 =?utf-8?B?QTBINkF5Si9lbndBdVB2UEdVcGhHbE44SWo4Y1pTMUNEcnJNYnpzNGNiYmN0?=
 =?utf-8?B?NEo3UlRqZENDT1E5aFN0bVoza1F2S09jUFlsV0NzaHhINmcwbDVmR0RXRHlT?=
 =?utf-8?B?WE1nKyt6eStwakJNbmpTRWpRWDV1SXE2M2haS0JmT3NVTHF6SUhwUEtodXpn?=
 =?utf-8?B?a1MxZFk5OHVPMVgwaC80UEV4RzkyTks1MytwUW1GeitKb2pxTFhCNzFINmxr?=
 =?utf-8?B?MjFuMVA5amFsL0huOHNldjBpWGdSSDFSaUJkek5UZDZTNWNGQU9tSDRHNXk3?=
 =?utf-8?B?VVF3TnZmNVhBajZvR3hJeXo3WmptejkrVnBRdnFuNDRNVDhCUHNwSFM5K3FP?=
 =?utf-8?B?TXBjYWlhbU9Ec25vVm90dE1WaC9jRWpodmRMcmhzU1ZMMDBCd1laN252U3Jp?=
 =?utf-8?B?ZHAvRWs3VnF0cUx1UHV0YkdsVm45TkRMMm10djhjL3dYalFmRFNuU2lnMjAw?=
 =?utf-8?B?WEYyZ0RvdHpOSkdlcWZVY1U0M1NnS3dLWHB5dUJQQmNxekRacjVtWmUyaHox?=
 =?utf-8?B?cGNObExXdU92T1FPdXJaUlJVOGZncEFJanFkZmRrOURjeU9iSHl6NkVFN0tN?=
 =?utf-8?B?MSt1Qm5wUVppMEM3UTRZdWJTSTJhKys1ek4zTUprQjJXbkxpU216eEVITi9r?=
 =?utf-8?B?T3pnTzlkS3RrajFpekJ1VmhvRUNGMVh6SkNPaG9sK2twQ21SQ0JOckRqQUVS?=
 =?utf-8?B?SUdJK29hUFVvcTBjU0lORFJrYk9Fb1JSVlljK1NzM01uWThmSnR2NXBkYlBk?=
 =?utf-8?B?cG9NTWFyNkhEeWZ1YnB3ZlBReGxnOVlZMDJyTTVKSVFIeEhZeDZsKzZHZVVl?=
 =?utf-8?B?ZTBJOGhyT1FIRTk2cFR6ZTZZTy9WK2hsR1ZrcWVPME5YYU5raGpDb3lHVnR2?=
 =?utf-8?B?S0ZKQ2JMM2dFTlR0dnRxSmJaRVBKVm9jNUJRRzlCaDI4TUVydDY5Ylora0Rl?=
 =?utf-8?B?cVJuMlc1OUcyVjNsbDlZYVgrakpwa2dzTkhRSFlDSUljMEgyRzltbHVvejVp?=
 =?utf-8?B?NFFvTGwxWnlKSEhyVys3MlA5elphVkRYRTc2L2RDWElXeXBON0VzY21ORXBv?=
 =?utf-8?B?dmNkbGJYZGk5VmptL0Z0NVNZM29XYUtUSXAzbW82NG1qaDV0VVEyVnYrRG11?=
 =?utf-8?B?T2hicnltMVBNZHYyNDNEN0xPTkRkWkNvK1RLcytyWWJHYVZPK2NhbDhpejZP?=
 =?utf-8?B?QVdrZ0pUYlFRR01zOWNxeEZQTXBCeXFUcTM2RGU3K2JlU0VybFdhSEhlVUIx?=
 =?utf-8?B?Mnd1dWtFQUliUUxNZzZyQkxzWjVKbE1HVld3bVprSXV1d2tUMFl2Wm0yUk51?=
 =?utf-8?B?R3pxZTlzajRKcTU3YS9nblZvMkVFMkJwRVBZN0E1dDRKc2gwbC9qelRCWFJI?=
 =?utf-8?B?dSt1dTFhWjBxTHlPbEQ2dUFnVCs3alRlb2NnWS81VDdQN0dnM3MvZXdSYWRG?=
 =?utf-8?B?L0wwQjRkOGJ0b1dSV3lacHFoTmNEdTd0RTVaS05GTGxka1Flb1pIMkZVQUtK?=
 =?utf-8?B?MVlFeU11NVI2OXM5SHlyeHA0cGVRSlMvLzA5RVB0TDdBaWlydmdOc3RHSHZF?=
 =?utf-8?B?QWtWQklQYmFYYVZGMWlNTU4yMm9MaHBpOFlwZlBUZTROd3BscDg5K1JhRXpz?=
 =?utf-8?B?T2w3ajc2QWdUejZEOEFpZVBrQkx3ek9lTlU1QkhxeDJkczdxNlR4OGZSZGo3?=
 =?utf-8?B?WE5rTGdxMzBPUzlmL3BVaW05cnJiTVRoNnF5cVByTi8wZklKYnhyUWhqa1dF?=
 =?utf-8?B?NnhwRldZRjBqSDhzMHhVS2tkNlg5c1pINmZ1ZVlCcHdjUDJzQ3dDY2xoU2Nn?=
 =?utf-8?B?RlF5d1hiaW85UThnNHM4RGo3VmpyZHcxb21qQ2NBOVlPVlNrWVU3TkhHMDlx?=
 =?utf-8?B?SEh5QkJTQnJiRzN2WEY2emI5RVltT0hZZmJsRHFBa0FyMWRBT3VVVWtDaC9z?=
 =?utf-8?B?RnZFNlliWEFJaVV2UHBpVVBERTVLZG44WXlWQldEWnQwTm9KTDhoUzR6Y3pl?=
 =?utf-8?B?VXhkK1lLZEViOUtieDF0UzlMbGRDNXZOdEE0Q2trajM5amphMDVLQUQ0MmMr?=
 =?utf-8?B?K1ZIeUtNR09nVndiZ0c2VVo2ZXMvTjE1Wm1zcCtyTCszZk9XZHEyVjIzUDMw?=
 =?utf-8?Q?OUD2ImkGIPW/Pj5Q=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 60ec883d-8cbb-4d6e-f183-08deeb8eca24
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jul 2026 03:26:04.1960
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: n0EJOMN7ADndDcq01IZ+pF54uh3JiyDfwpWdozHbNnAaKXvScVUseIELr0IjQEqRsDywq0zTn+TfzG8I1wDNHJxwzK4eQioekhJsEhxQCGCSE4+uYzytOr7SWCo+tVxp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1316

SGksIExpbnVzDQoNClRoYW5rcyBmb3IgdGhlIHJldmlldy4NCg0KPiBPbiBTYXQsIEp1bCAyNSwg
MjAyNiBhdCAxMjoyNeKAr1BNIENoYW5naHVhbmcgTGlhbmcNCj4gPGNoYW5naHVhbmcubGlhbmdA
c3RhcmZpdmV0ZWNoLmNvbT4gd3JvdGU6DQo+ID4gPiBPbiBXZWQsIEp1biAzLCAyMDI2IGF0IDc6
NTTigK9BTSBDaGFuZ2h1YW5nIExpYW5nDQo+ID4gPiA8Y2hhbmdodWFuZy5saWFuZ0BzdGFyZml2
ZXRlY2guY29tPiB3cm90ZToNCj4gDQo+ID4gPiA+ICtzdGF0aWMgdW5zaWduZWQgaW50IGpoYjEw
MF9ncGlvX3RvX3BpbihzdHJ1Y3QgZ3Bpb19jaGlwICpnYywNCj4gPiA+ID4gK3Vuc2lnbmVkIGlu
dCBncGlvKSB7DQo+ID4gPiA+ICsgICAgICAgc3RydWN0IGpoYjEwMF9ncGlvX2JhbmsgKmJhbmsg
PSBqaGIxMDBfZ2NfdG9fYmFuayhnYyk7DQo+ID4gPiA+ICsNCj4gPiA+ID4gKyAgICAgICByZXR1
cm4gYmFuay0+aWQgKiBKSEIxMDBfTlJfR1BJT1NfUEVSX0JBTksgKyBncGlvOyB9DQo+ID4gPg0K
PiA+ID4gVGhpcyB1c3VhbGx5IHRlbGxzIG1lIHRoYXQgR1BJT19HRU5FUklDIGNhbiBiZSB1c2Vk
IGJ1dCBtYXliZSB0aGlzDQo+ID4gPiBoYXMgYmVlbiBkaXNjdXNzZWQgYmVmb3JlLi4uDQo+ID4N
Cj4gPiBIZXJlLCB0aGUgbWFpbiBwdXJwb3NlIGlzIHRvIGNvbnZlcnQgR1BJT3MgaW50byBwaW5z
IGZvciBjb25maWd1cmluZw0KPiA+IGNlcnRhaW4gcGluY3RybCBzZXR0aW5ncy4gSSBoYXZlbid0
IGZvdW5kIHRoZSBwYXJ0IHdoZXJlIEdQSU9fR0VORVJJQyBjYW4NCj4gYXNzaXN0IHdpdGggdGhp
cy4NCj4gPiBDYW4geW91IHBvaW50IGl0IG91dCBmb3IgbWU/IFRoYW5rIHlvdSB2ZXJ5IG11Y2gu
DQo+IA0KPiBOb3JtYWxseSBHUElPIGNoaXBzIHVzZSB0aGUgLmNvbmZpZygpIGNhbGxiYWNrIHdo
ZW4geW91IHdhbnQgdG8gc2V0IHBpbg0KPiBjb25maWcgZm9yIGEgY2VydGFpbiBwaW4gaW4gYSBw
aW5jdHJsIGJhY2tlbmQuDQo+IA0KPiBTZWUgRG9jdW1lbnRhdGlvbi9kcml2ZXItYXBpL2dwaW8v
ZHJpdmVyLnJzdDoNCj4gDQo+ICJUaGUgLnNldF9jb25maWcoKSBjYWxsYmFjayB1c2VzIHRoZSBz
YW1lIGVudW1lcmF0b3JzIGFuZCBjb25maWd1cmF0aW9uDQo+IHNlbWFudGljcyBhcyB0aGUgZ2Vu
ZXJpYyBwaW4gY29udHJvbCBkcml2ZXJzLiBUaGlzIGlzIG5vdCBhIGNvaW5jaWRlbmNlOiBpdCBp
cw0KPiBwb3NzaWJsZSB0byBhc3NpZ24gdGhlIC5zZXRfY29uZmlnKCkgdG8gdGhlIGZ1bmN0aW9u
IGdwaW9jaGlwX2dlbmVyaWNfY29uZmlnKCkNCj4gd2hpY2ggd2lsbCByZXN1bHQgaW4gcGluY3Ry
bF9ncGlvX3NldF9jb25maWcoKSBiZWluZyBjYWxsZWQgYW5kIGV2ZW50dWFsbHkNCj4gZW5kaW5n
IHVwIGluIHRoZSBwaW4gY29udHJvbCBiYWNrLWVuZCAiYmVoaW5kIiB0aGUgR1BJTyBjb250cm9s
bGVyLCB1c3VhbGx5DQo+IGNsb3NlciB0byB0aGUgYWN0dWFsIHBpbnMuIFRoaXMgd2F5IHRoZSBw
aW4gY29udHJvbGxlciBjYW4gbWFuYWdlIHRoZSBiZWxvdw0KPiBsaXN0ZWQgR1BJTyBjb25maWd1
cmF0aW9ucy4NCj4gDQo+IElmIGEgcGluIGNvbnRyb2xsZXIgYmFjay1lbmQgaXMgdXNlZCwgdGhl
IEdQSU8gY29udHJvbGxlciBvciBoYXJkd2FyZQ0KPiBkZXNjcmlwdGlvbiBuZWVkcyB0byBwcm92
aWRlICJHUElPIHJhbmdlcyIgbWFwcGluZyB0aGUgR1BJTyBsaW5lIG9mZnNldHMgdG8NCj4gcGlu
IG51bWJlcnMgb24gdGhlIHBpbiBjb250cm9sbGVyIHNvIHRoZXkgY2FuIHByb3Blcmx5IGNyb3Nz
LXJlZmVyZW5jZSBlYWNoDQo+IG90aGVyLiINCj4gDQo+IE1heWJlIHRoaXMgaXMgd2hhdCB5b3Un
cmUgbG9va2luZyBmb3I/DQoNCkkgd2lsbCB0ZXN0IHRoaXMgbmV3IG1ldGhvZC4gSXQgbG9va3Mg
dmVyeSBtZWFuaW5nZnVsLiBUaGFuayB5b3UgdmVyeSBtdWNoLg0KDQpCZXN0IFJlZ2FyZHMsDQpD
aGFuZ2h1YW5nDQo=
