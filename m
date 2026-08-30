Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2132.outbound.protection.partner.outlook.cn [139.219.17.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDC702DCBE3;
	Sun, 30 Aug 2026 05:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.132
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788066248; cv=fail; b=ZhvSeApuXzbIBB8Yz1K6DY+JCnVlmXyYn7N7Wkqv6U6xOJvoA5EaXyTThJXMfHDiOWDCce5G4bJgN2hnANf5DUAl2nACKOdaGrls0smH0eJUOi9V1OJs+jCMAlt5SuqmNRhcTwmc4TsI9mk++7vknoCVmKwOHPMTPYFk1niKTl8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788066248; c=relaxed/simple;
	bh=KU1cQ4ARYSVeDeV/Nq+0CzgaIjsJSf+Niq0rIR4IjcI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=CXMt55hIs3xG66A/g5MgZWh7hpKk8h/dMRnnbHAEG/cLfDjrDlWq5tqh4yNv0U1OpIW1C9YZsxPUoWk9KQM5O3EcqCQ9W0g6Byq////Ra5aU1r8xxjKEIYb/3jhiOT+oeuNrKoqaAV6vkEI+uDupVzZ6MXtS5pMaHPglZ/e/Jfs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XMO6mFBMAFrDKOJFcIXOQ+nkO7ov8IUC4b8THGgYQWzice2FauM6bSuyg00hKxhq0Nhw2y0PaxiTvfrJ0NhaAIVxQq+43j8lFVtNMsfIn1l1INlZMwFncxZDAWemR+zICe+jTBz0zOa1EakeDt5iIE22l6hmriDkXA+7GjvWpvApPEXVH2eHAluR5gLCbNYFwbojHkyzCqZcu9dcBfjidpgxhOgpzSFKJ1EMJd6JduALfWNgGBINYVo03PZpGlgEW0vpppBGS6+pJwWPoVKzJBVzwRRIc1IEQA3ZmlRqGPZCro7U6gF6LhIc1iYHvuu/ukPZeBj5dVw48n7OkxIF3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KU1cQ4ARYSVeDeV/Nq+0CzgaIjsJSf+Niq0rIR4IjcI=;
 b=mg23/KmM/h3Lt88sSLQjU3q+YnBLyuCZGXvT08gHfV0m+fxFIzqYNUO+hQwx87jlwkcJl4lhRxZ0c7oLdfXsi4RHpQiQYehcx9poFZHRgbK7fjtpJqGl7DAm27r87/ELtRkMh/QXPQwRWj6HDE33Pa6dV+/3IrEIe7PaPCGKHXa7FnN/M/FlAJS3szmeLBFUQSTfww49bxH/SpbohmlBT41lqUVu2JHMz7JzFx/dNDsoD9BLithy6JtTe7txlWEF3ngF+mKLEmlNgVNh5EfCjumRI5BhxowOnDodqCj1jM952X1fmM7ZKEcSY/plLtrcEqyt3sYR33+7pkPA5gb/lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1330.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:16::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Sun, 30 Aug
 2026 01:29:28 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0315.011; Sun, 30 Aug 2026 01:29:28 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Emil Renner Berthing <kernel@esmil.dk>,
	Paul Walmsley <pjw@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Palmer
 Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>, Philipp Zabel
	<p.zabel@pengutronix.de>, Bartosz Golaszewski <brgl@kernel.org>
CC: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, Lianfeng
 Ouyang <lianfeng.ouyang@starfivetech.com>
Subject: Re: [PATCH v6 03/21] dt-bindings: pinctrl: Add
 starfive,jhb100-sys0-pinctrl
Thread-Topic: [PATCH v6 03/21] dt-bindings: pinctrl: Add
 starfive,jhb100-sys0-pinctrl
Thread-Index: AQHdN2ImqvaIx8mSbUaeHyzzD+v1QLa0qs+AgAEkaZA=
Date: Sun, 30 Aug 2026 01:29:28 +0000
Message-ID:
 <ZQ4PR01MB1202DDBD0436E8F580EB6575F2AA2@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
References: <20260829025720.23915-1-changhuang.liang@starfivetech.com>
 <20260829025720.23915-4-changhuang.liang@starfivetech.com>
 <f474f659-8234-4dfb-85cc-06d2cc295107@kernel.org>
In-Reply-To: <f474f659-8234-4dfb-85cc-06d2cc295107@kernel.org>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1330:EE_
x-ms-office365-filtering-correlation-id: 2dd9f539-3b25-4def-51d0-08df0636226c
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|23010399003|1800799024|366016|38070700021|10067099003|4143699003|921020|22082099003|18002099003|56012099006;
x-microsoft-antispam-message-info:
 oUA45aZ1kDAJDdFcRAWDuk68oOAvk04H0Mjo1A9NwbKg9SMjy71dknqG0qQC8wjjmgcWTsQgIK/9aharMsYBcgqjuiJGuRgOtdQmEG4w3bfB9cDqFdhjsVXyjLkMbq8RD/DjGpEiyAiOa3phw6VLb2Zhu2TMiYREWrxEh9zRKM+w9FEU9ZUQN2U/bd2KM1+TEEwEE4in7NxPKPChwdBre4lMJLubf9Xz3KbpPjPzJ75ifJBUI9O3wxmvZCxq8r3x6URXwHahIULsM3xdhP7OmWJXrGUM6D0WUNGi90CCnObWb5wtv0bYPkGRnjLR/LMsXnYWLywHDO0Rua5Kz6w86rBmFD9LLlVv3XX9+su8wFZ4mkhwIpppao8vKz7KA4JogVYQzMYVZEwwZhC79sRhFH/P69gr55zzr4m+EJtMIAVvDQUotnNmy02SXSoPctqq53jR9PRyXbEgOfp7pOstOhzEnVGBFSutY/nseE5oqabuaC+0dtBYbW7dwpqEBvk4fVUZ9Z0DZ9oGD2ytFRWef6zfRgUOP6ZMWgeUhT7bt4mcvNYmGyR3kcgr35EYUW1vsJfHg6HU9M+i0e1kJy8cIA==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(1800799024)(366016)(38070700021)(10067099003)(4143699003)(921020)(22082099003)(18002099003)(56012099006);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VUxiN2ttRXVhaisvcjhub2MxaTY5blZMekhkMVp1UXlkVGlxTEx1MUR5R0hK?=
 =?utf-8?B?WEp0VnZ4YWRONW1KWUdsQ2ZBNmQ0Y2I2ZHU3VC9rWGdSMTJ5cjlyMFYyUkY5?=
 =?utf-8?B?Q3lBejVRRm1qSitSbVJERTl4MHhjTUcyYngwT1FXaEhTeW9uTDFyWU9oTlJS?=
 =?utf-8?B?aTN1TlNwK3NCdGR4dUExNWdFdnhIUmZlRFF2ejBHZHZIK2ZLbWR5VzBVb21C?=
 =?utf-8?B?TWhwNG9KaDdwaHNwMnF1eEp2OEVOZ2NIL1BXZ1l4K0piVkZXa3ZhRnBVMmhr?=
 =?utf-8?B?d3YxRk85aWRFQnVGS1M4VGxqLytJT3lLUzBkT3BIelNuc2VMbnlNZGJNbHhn?=
 =?utf-8?B?VjlzRlJjbUZ4eGo0NEZ0N0VacmEvdGIyTWJ0M1p4Z245M1ZpVkJEZlhNZnY5?=
 =?utf-8?B?L3c5YWlsNGpEUDJyOTRId3Q0aTFMRm1rSTNHbFpzK2pVUmhFTHhIVmFQUG5M?=
 =?utf-8?B?V2JmaDlqY0FhUWVvNDIxMXNEcmhnakxBYytnUndYWWtkWmVkZStjUWdwOHUz?=
 =?utf-8?B?WDE0eUhVQUVHSDF2YkRFRklvV1J6TlJ1ejB1R2N4WXNaNzFiZllqV0lNUUgw?=
 =?utf-8?B?T0ZabDNNOGpySmtybHg1bUtvUXhwRERmd2VMMzhURS8vTjR0V2VQZURUSUtZ?=
 =?utf-8?B?N3cwTlQrVmVqT2czeTVQZW92Rlp4cjV0TjdQcUVXbjFyYVhQSDNyTDd4QnVk?=
 =?utf-8?B?WEtXR2RjVmM4bjdncGhnaG5xelBCQ012SDFCN2t6UGovVjBxOGJBTUdzaTRn?=
 =?utf-8?B?bWtOVFZvVVFidFRxaHBkZDN2L01xOENRZE50RmEzcWNwM2RDSnpkTFFDajR3?=
 =?utf-8?B?ZkJNNmNsNUs4MVZ1VnlpaEV6MnpMSHQ2ZFFqb0svNTVCSDVha2g5UHZkYTlt?=
 =?utf-8?B?Uk82SW9UdnRqWUtEbXJiNkxpOGlDcXhJemlFZ1h0d0xwV3pSRGVuRWlPSU1X?=
 =?utf-8?B?anlLZzVSUCtQdlF0U0Z2THVQNEQ4Z0U4NHc0aTNxazhUemVkTHNnKzZZak40?=
 =?utf-8?B?b2tETC8rN2h0S0p2YlM1dVFXZFROOG5obVJhcEYrdHhab3lsQkR2cVhVN1JZ?=
 =?utf-8?B?MTdQcW41SjBFYXRPaXFuTEZUaTVKZnZ3TzdsK3pyWHErbTk1ZXFIc2lEcGg5?=
 =?utf-8?B?a0xTNGhJUlFnZDNnWHBKMFdoT2dQRG4xdittakIrTzR6anQ5UXNxc1VCM2lw?=
 =?utf-8?B?VUQrdkdoT1hGd3l6YWN1eURMVFNoVEtCa2RHM3ZrN0p0cjRqRVl0cEZ0dWV5?=
 =?utf-8?B?L3h6cnQza3YrVXVFMXVHa2dHYjRLdi82UUNsQ0RreVhtK3BzdGY2b3RRYVUv?=
 =?utf-8?B?a1kycldVS2JGcmhjSWxwVGVKdE50ZHRmalRtdzMyMVA5SjR6cVRQcDlySHI3?=
 =?utf-8?B?dGV1bWhEcUNsSVRuZzNtWW1IbFpwSzVlNGFqQUVHU2NFRTArMUlNVFM3U0tu?=
 =?utf-8?B?b2FpczBFeUxKRHVFZmtkUDZhSDNGQ3hpTzQwNXR0cW5QRmFudm1jZ2ExYWR1?=
 =?utf-8?B?WnpQenlCYXgzZ01mNFNuQ0FJMitQVG5KcGRuazVsQ1RSYk82dzkvWDBRcTE5?=
 =?utf-8?B?U3dQQUt1ZXU0WjVhd2FXbVdsWFcyYS8vZlZQbzNxR0YvMEFHeXpQeHBOTTBT?=
 =?utf-8?B?Q2kvTmFCeHV0YXRkQ1BrOGNEL3VVZ2JxRUNkWUoyZWt5N3ZrT2MwZkpoUFpT?=
 =?utf-8?B?Rk14bm9OUGlCN1BRYXV0WGJRZ1JUZTJzZDh6WlpLWWVYRHh1RUsveDBJakxD?=
 =?utf-8?B?TXMwUWc3QWFTQjhycWY1V0ZteEhzWHdBbWhHSWIxUERsNVhYUDFMcitncXBV?=
 =?utf-8?B?SDRUZ21ITVQ3bzVmaVo2SEY3TjAvYVpneFhNdGluS1VhYkdWbDVIdXVvanQv?=
 =?utf-8?B?WS9keENUVWpHbUEvNFFrZU54a0xhZkxMeURkdVVIT3d1VUpCNE9wMXA5aUN6?=
 =?utf-8?B?S2QzejF6L3RwQVV6aE1jSWtSVlFlS09JYWZjMktyemZreThJWDBWS1cvSnJo?=
 =?utf-8?B?YWFCbnkrZ0NRYVpKdE02eTQ0UGhWcjFRMHZUekpLS2lBUTkwVVRSaUJBSVB3?=
 =?utf-8?B?UUhUMmlLeUVBbjVYQ3gvVXFlRS9VcEU3SUJKNHFlT1krcElzMk1xUjhJb1F2?=
 =?utf-8?B?SkFlSDhxRGVGZ3kvcEhxZ0d5ajFSRTIwdjYwVElPcW0xQ1lRdlFycUJRMUds?=
 =?utf-8?B?aDUyUTRqOFpTOTFyOGpELzRmcjFlZERld0RqcC9tVHIyNS9scEY4cEpPbTNO?=
 =?utf-8?B?cE5YblBpZm1za3NsY0xhYnJ4U1BlWU9SYWpiZTZqZGdFS2F2eTNPTTJvdm1h?=
 =?utf-8?B?anRmZVBZM1R4UHVtWkR1ZmpFc2hCNXR0aTZvRnFUeDRZaWMxaStEdVBNazlK?=
 =?utf-8?Q?HdD+N3ER95MXc7ig=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 2dd9f539-3b25-4def-51d0-08df0636226c
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Aug 2026 01:29:28.4883
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lDNjc/3/0MB0xOGBKcLTc7ZYAqX+ipPVfj6eqgyCPE2OekpsG8C60wCGKblJAtCPZUrsa/1PuoXHJtE5K1x6eFYnKwwM/xhpblxLq+JwzzaMSpTfXbEf8W2el+gQ2xJR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1330

SGksIEtyenlzenRvZg0KDQpUaGFua3MgZm9yIHRoZSByZXZpZXcuDQoNCj4gT24gMjkvMDgvMjAy
NiAwNDo1NywgQ2hhbmdodWFuZyBMaWFuZyB3cm90ZToNCj4gPiArI2lmbmRlZiBfX0RUX0JJTkRJ
TkdTX1BJTkNUUkxfU1RBUkZJVkVfSkhCMTAwX0hfXw0KPiA+ICsjZGVmaW5lIF9fRFRfQklORElO
R1NfUElOQ1RSTF9TVEFSRklWRV9KSEIxMDBfSF9fDQo+ID4gKw0KPiA+ICsvKiBzeXMwIHBhZCBu
dW1iZXJzICovDQo+ID4gKyNkZWZpbmUgUEFETlVNX1NZUzBfR1BJT19BMAkJCQkwDQo+ID4gKyNk
ZWZpbmUgUEFETlVNX1NZUzBfR1BJT19BMQkJCQkxDQo+ID4gKyNkZWZpbmUgUEFETlVNX1NZUzBf
R1BJT19BMgkJCQkyDQo+ID4gKyNkZWZpbmUgUEFETlVNX1NZUzBfR1BJT19BMwkJCQkzDQo+IA0K
PiBJIGNvdWxkIG5vdCBmaW5kIGhvdyB5b3VyIGRyaXZlciB1c2VzIHRoZXNlLCBzbyBhcmUgeW91
IHN1cmUgaXQncyBhIGJpbmRpbmcNCj4gY29uc3RhbnQgZm9yIHRoZSBTVz8NCg0KWWVzLCB0aGVz
ZSBhcmUgbm90IHVzZWQgaW4gdGhlIGRyaXZlciwgYnV0IGluIFBBVENIIDYvOC8xMC8xMiwgZXRj
Liwgc29tZSBkZWZpbml0aW9ucw0KZm9yIG90aGVyIEdQSU9zIGFyZSBzdGlsbCB1c2VkLiBUaGVy
ZWZvcmUsIEkgaGF2ZSB1bmlmb3JtbHkgZGVmaW5lZCB0aGVtIGluIHRoZSANCmJpbmRpbmcsIGFu
ZCB0aGV5IHdpbGwgYmUgcHJvdmlkZWQgdG8gdGhlIGRldmljZSB0cmVlIGZvciB1c2UgbGF0ZXIu
DQoNCkJlc3QgUmVnYXJkcywNCkNoYW5naHVhbmcNCg0K
