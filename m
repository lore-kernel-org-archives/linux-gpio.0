Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2127.outbound.protection.partner.outlook.cn [139.219.17.127])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2EC839FCCA;
	Sun, 30 Aug 2026 08:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.127
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788079373; cv=fail; b=cu3vXSq6FjSP9rocVRLo1PDspj6qBVMOX+rgf43lzac4cACqNeoJyEGw1pKdRaowyqrvC07/gg+fkK8V3mC0drovgkT6D/EeveEnIFLXMwDIkEDkWSrJgyLwfUh366CNYDHoqriClWehpAlsLuzdPYA4OvKg4F9PIdQrzubgWp0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788079373; c=relaxed/simple;
	bh=WdJ1HIYzM+nzrVH7q9w8TynHhhT832P/rRinNaL4FcU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=pfKHwJYyOYQKOBpGC7nBfcZGjCyN6NXBwCrXJ+NAQnofgX1ujwo0QiTZxoJv7dDqwa43rPBbSS0mTZfzr9h5Lh2gGlerjP0rfm8nRwvl6biKypStHUAlNbRTtA1FdUdkFg6qS/r9SM4++SZbI+I2gNSBELCtCoFibP0ydr09vDE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.127
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TBd03nGo81AIFFP66zu6gB9SKnPd73VnGH3LF1th2vQQhX0ZyUB/xAxpDdYzaz7CAldOFE/p1gQXrX52/TCPEU+eBolEdA3Hehb7ezeO4mGO9HdSbUpdpUz3FZdBDlB7ozQmIz8wBlXpAJLQjka4+H49//w/Nq0usknLDUCSVVohbAOc5P2u8UsCX0NP7Id/HjLPueRi9nSOdRpg8HeLCcLOopm16sFaYZEsvWKL6CJzSCo5A3EYd+O34xdqDgpDBh26GeOjpPGcqBMxFhtwHej0gGZ+/6iztGYw8ghaH2e5mDRF3N/RJGGhV2j9PSvYooyQkIbgqsXxG+thUfP3CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WdJ1HIYzM+nzrVH7q9w8TynHhhT832P/rRinNaL4FcU=;
 b=ExbYR6OyN2lHUs0N7vNegA9Djam2Pl1Qof88yXZDcLUqG2u6nBe75ovfllmHa3AwDlHl0VOug8hwDtyMzVepzZoThkKrGyv+lwMwwcaUTLf+BYX1CEGptjUq4Rz0O34wTbr4MuwuSK6QQundu1k/cnCJnn1Qc61ky1qQbvsq+6HN/wuHnhUbjUiqe+KuPcuVLWNhCUiyC8JG/dED3Oz/+O9CUpRnhtaGBOoZJiM2DaiZsoouQNbtxCXqAL+gDUbB7iO3yjOJ+FwuC6e2JGC0HeHUo7EoHwCPu6txLWDY9IDpNdTs1Nq+nulrHTn07YUIT2NxAa+GtvZaBeOnDfKcIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1267.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:16::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Sun, 30 Aug
 2026 08:42:35 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0315.011; Sun, 30 Aug 2026 08:42:34 +0000
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
Thread-Index: AQHdN2ImqvaIx8mSbUaeHyzzD+v1QLa0qs+AgAEkaZCAAHWtgIAAA1cA
Date: Sun, 30 Aug 2026 08:42:34 +0000
Message-ID:
 <ZQ4PR01MB120205984FB23C0776BD0D0AF2AA2@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
References: <20260829025720.23915-1-changhuang.liang@starfivetech.com>
 <20260829025720.23915-4-changhuang.liang@starfivetech.com>
 <f474f659-8234-4dfb-85cc-06d2cc295107@kernel.org>
 <ZQ4PR01MB1202DDBD0436E8F580EB6575F2AA2@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
 <ac4c6b24-02c7-4dc3-89e4-45aa335255d3@kernel.org>
In-Reply-To: <ac4c6b24-02c7-4dc3-89e4-45aa335255d3@kernel.org>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1267:EE_
x-ms-office365-filtering-correlation-id: cf752893-5080-4073-deb3-08df0672a363
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|23010399003|376014|1800799024|366016|4143699003|10067099003|38070700021|921020|22082099003|18002099003|56012099006;
x-microsoft-antispam-message-info:
 zfQisy5mqxyroxg4UtkkrBU4Dq8x0zDjx31V96LIUdjoORbiqi9UI7FQCdzc6yoc6YZlSQarNmsnOakvshF6plpJZpmOiLZsGSq+cyatUufqYCZZtgOKPZX1EyRfb/Ppidgj386LVLEDM8MxGuINScO4dFOqypH1UDADE4LTphCHQE7Q1fmqFc/CtiNbuxLjs6ula42QaIinWs9SUhX7P7iEKMfIj8s6qTjlGvXJQHbiBkcWrgSpeUvf8GH4eHFYv06/OM6XJR0NPRBiue+JzgsqA7QhHhykhjh2NhKhHy8b3UIpF3NlRQhqzMJ8PJ7mVQgng5lhhThdhp4sSAiP/lwGdgnL0fWtjydK48IMWwGCr34JhfPpvSaWTdd0EAmwBydzBnZ3Yqoykb9P+yR49o79TcGEJYfZWnpz7ucJ+30gIizIDAIRiHf9XwqBzjBwvzn6cfA0dlpGTXEPnXX7S8onFwxGOImfRy+nEpVAWzPSURtLgyOvCXyI9C8cTQY2qlpbbB0K+MPy0j84X9EDTMFFNwGUG8eOpehvctudeb4EhSvWbxWZJgd1jhTun0FG4bW5jLYUKeaaueHa7G0ZXg==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(7416014)(23010399003)(376014)(1800799024)(366016)(4143699003)(10067099003)(38070700021)(921020)(22082099003)(18002099003)(56012099006);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZHdiMFNwNXpjY2FjQm40Vk9SS1lBU3VDVldGRVovMXNrYTBsZTd4cExyekFQ?=
 =?utf-8?B?djFhNnFSclVHK3B1dDVlUW9MVSs4SG9wMUpZWWJpNUxFYndJZE1MaXJvbkFM?=
 =?utf-8?B?a2xBWGlzWmJtMUY2ZUk0aE9jaEV0Z0o5c1hBK2ZMTUl1QVVPVFNSeVpSWkQ0?=
 =?utf-8?B?ak56b3ViYVh5c0Q2RG00c3VqZkNBR3VLb3RoaU92WHA4RHU4Y1JZZmE1d1Vt?=
 =?utf-8?B?a0dvMXZXN29acnlmSUl5UWJ5eFFDaDBjeWlpbDQwQi9HaGdzekp3TzAvcHRr?=
 =?utf-8?B?aGY3eC9hT1Z6OEljbXlZQzRlRW1lNlVQRGxIb2YrWVQ2V2UyMWlHM0lBWVht?=
 =?utf-8?B?dWhEM0Rub2w4SERFNHdUYlhDemFkSFVNSWVmWnowVXVweFdxMjhvTVJrc0p5?=
 =?utf-8?B?SVJITWY2VzJjTmVKdXlHVFdxVlVoMW5PdTVEczE2TXNiUW1OM0JMTU1pQXdY?=
 =?utf-8?B?dXg2dElPK3hnaDJ3T1JGUTB0Q1hZM1A2bWExK3M5Zys2dEd0akZaNEt4MmZw?=
 =?utf-8?B?aklpVmNNRnJxelVMSmNJazZldjAyS1l3MnBPNk1nUE9uUnZybmxxNjE3MThK?=
 =?utf-8?B?WEZ1U0IveWRXQXg1Q1ZUWHF0YVRtVDl6T1pOaVlzc0R3cEY0MGl2UjZ5Tjhp?=
 =?utf-8?B?N2xyY2pvcmdLa29HTk42QURhSXh6cGhwek5HSStHb3JKZXVTQXRFQjRsRUFW?=
 =?utf-8?B?alE4S1FyWlJpdURzWjRBOXJOeUhweXJ6MGVuWTU0azFYSFFIeEo0OUFuTVl6?=
 =?utf-8?B?WU9KWXJVT0V5dGM4Y0twNXc3Z3luRFFIdUs5a0t2blVCMGhRZWswYXhyZ1RJ?=
 =?utf-8?B?Z1Z6ZVdHZTBSK2NEd2dPT2pxS2Vocmo4UXdFeE5xM0x3dWN1aCtWUTNCQ0x6?=
 =?utf-8?B?bWxkR0x4MDlZb3hJSk5HSWQ3b1ZGMytMSkt2eisxMnVhMnNkbGQwR0FrcVRD?=
 =?utf-8?B?WUkrRlhOK2toU2psSWlJbUxEbnNFYnBUT0lrOG1mWWpoeHJGZlRQSmhHQ0hj?=
 =?utf-8?B?NFgrZFdNWStpQURWWnJmUFhEQS9TMWRxMWxZR2x1cThVSmVoYWNudG9PaWJu?=
 =?utf-8?B?OXUxYXpRYVpYSm5jU28yRG9uSkl1RHJMY0p2R3VTYnprNUpySUFzUkQyckgy?=
 =?utf-8?B?N0lUeWxlL1hRWFI4OEVhWWd5RW9KVm9ER2FFUEdtS3ZEQmhPTEozN29UTVk3?=
 =?utf-8?B?aHpZcFVUVGphZVVQaWRLd1FXYTlCRGNLOWVXRjIxUFExa2xEb1dUZ3Rmc0dr?=
 =?utf-8?B?S0kvUCt6eFlWaGh2a1VPUU41bStkTDZHWTViSDZaOHlIV2VVdTNRckRuTTlh?=
 =?utf-8?B?OVpMTkwxNHhLTzhBTkFZd1VlcU9CUnQ3RlBnS3p4dzZ5WFVpZU42ak1UUHlS?=
 =?utf-8?B?YXpzTnd3UVViZnNZNUw1TFpWalplb0dXb1FEM1hUYk1yYkZCM08yL01Hd25I?=
 =?utf-8?B?RXc4cStxYjcyblNSalNFWmt6dWJ3aVF2MnpKQnJmSkoxV25meDVWZTZmRlIr?=
 =?utf-8?B?VW81MkFMYmZweWtYS0x3aXpHTDg0WE5FblBreTEybWlSMTVBdlNLcS9aZEd5?=
 =?utf-8?B?ZzhEU0V6b2VqbWYxVFQ2ZEgrN2ZzRWhsd0lSbXBPKythbHNRTGFRRDRMY3No?=
 =?utf-8?B?allMUmZDWjJPeGFBSXRjT2ZweUZQRUNHbGJDaXlGQWFmbU1WdmZmdm1taHBo?=
 =?utf-8?B?eExENDdZQjBPaFBqMTBDb0h6L04xT3NhM3hsTURTUGdEcEFRNXJsU1hjUy9C?=
 =?utf-8?B?cnhTQVpUdHVyQ2l0UWpUbnhLbFF3TEF4RUZGalhXYk52Q0tONmd0Y1pzVGhG?=
 =?utf-8?B?NXJRdy9QYTBidFNXWlN0c05kY0RJVWxleEpoT0ZqdWtScE44bzhqUVgremZ1?=
 =?utf-8?B?SThTWVJHbTFPR3RXU25zZFZoaGVlK2l4ZWxzVjVYVXM3WHdWaXBUY2diQ21o?=
 =?utf-8?B?WlNmYXR3YTI3ekxINVJuMTEyMlgwNGltV0xDZmJOUUhJL3p6YmVSMDZrTGRQ?=
 =?utf-8?B?bTgxME9MUGhldnpKZFJGZEZMZDJ5SnQyNnAycjhYTk5UMGhVR0d2aUs4UTl1?=
 =?utf-8?B?M3pQd0xRdGJhYWxvVWhnNkJXZmZtNFdsclZBU2NWMWh6QSsvRjJWeUViNVYz?=
 =?utf-8?B?bnRhMkdybEhQa0Rpb1MvTXNSRmpZbXRscUZwWERDb1VqRnpnd2szVGhoTzlE?=
 =?utf-8?B?VGhiWDZRWWpiY04ySWZrSWx6WWFPa0xianRvT0dtYURBWm5WQUFaZUw4T1By?=
 =?utf-8?B?MGV3cVZyUnNlMkRMT1R4RWpDdXpUNFVJNExiZDdVaytKeTEyTGZOWXlHVUlv?=
 =?utf-8?B?NWswc3RweG9Ka0l0Nk04MVRCZStIUHFYbkNTaEZiSWJ3WG5OMmtISStHUW50?=
 =?utf-8?Q?3ueyNxFIeITEGCVM=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: cf752893-5080-4073-deb3-08df0672a363
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Aug 2026 08:42:34.6698
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LOFLop2djNuylBpN+j3zhRRqE/xcsAUrBdR/KVJ/zmIKdKcDPM9QFPm0ByTt1+rPtcpCjytKz41fUuP021z73WsEB61fBEmGmA7ke+8YZ9cQc0rISjNZTPkiaoEF0dY0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1267

SGksIEtyenlzenRvZg0KDQpUaGFua3MgZm9yIHRoZSByZXZpZXcuDQoNCj4gT24gMzAvMDgvMjAy
NiAwMzoyOSwgQ2hhbmdodWFuZyBMaWFuZyB3cm90ZToNCj4gPiBIaSwgS3J6eXN6dG9mDQo+ID4N
Cj4gPiBUaGFua3MgZm9yIHRoZSByZXZpZXcuDQo+ID4NCj4gPj4gT24gMjkvMDgvMjAyNiAwNDo1
NywgQ2hhbmdodWFuZyBMaWFuZyB3cm90ZToNCj4gPj4+ICsjaWZuZGVmIF9fRFRfQklORElOR1Nf
UElOQ1RSTF9TVEFSRklWRV9KSEIxMDBfSF9fDQo+ID4+PiArI2RlZmluZSBfX0RUX0JJTkRJTkdT
X1BJTkNUUkxfU1RBUkZJVkVfSkhCMTAwX0hfXw0KPiA+Pj4gKw0KPiA+Pj4gKy8qIHN5czAgcGFk
IG51bWJlcnMgKi8NCj4gPj4+ICsjZGVmaW5lIFBBRE5VTV9TWVMwX0dQSU9fQTAJCQkJMA0KPiA+
Pj4gKyNkZWZpbmUgUEFETlVNX1NZUzBfR1BJT19BMQkJCQkxDQo+ID4+PiArI2RlZmluZSBQQURO
VU1fU1lTMF9HUElPX0EyCQkJCTINCj4gPj4+ICsjZGVmaW5lIFBBRE5VTV9TWVMwX0dQSU9fQTMJ
CQkJMw0KPiA+Pg0KPiA+PiBJIGNvdWxkIG5vdCBmaW5kIGhvdyB5b3VyIGRyaXZlciB1c2VzIHRo
ZXNlLCBzbyBhcmUgeW91IHN1cmUgaXQncyBhDQo+ID4+IGJpbmRpbmcgY29uc3RhbnQgZm9yIHRo
ZSBTVz8NCj4gPg0KPiA+IFllcywgdGhlc2UgYXJlIG5vdCB1c2VkIGluIHRoZSBkcml2ZXIsIGJ1
dCBpbiBQQVRDSCA2LzgvMTAvMTIsIGV0Yy4sDQo+ID4gc29tZSBkZWZpbml0aW9ucyBmb3Igb3Ro
ZXIgR1BJT3MgYXJlIHN0aWxsIHVzZWQuIFRoZXJlZm9yZSwgSSBoYXZlDQo+ID4gdW5pZm9ybWx5
IGRlZmluZWQgdGhlbSBpbiB0aGUgYmluZGluZywgYW5kIHRoZXkgd2lsbCBiZSBwcm92aWRlZCB0
byB0aGUNCj4gZGV2aWNlIHRyZWUgZm9yIHVzZSBsYXRlci4NCj4gDQo+IEkgYW0gY29uZnVzZWQu
IFRoZSBkcml2ZXIgaW4gdGhlc2UgcGF0Y2hlcyA2LzgvMTAvMTIgZG9lcyBpbmNsdWRlIHRoZSBo
ZWFkZXINCj4gYnV0IGRvZXMgbm90IHVzZSB0aGVtLiBXaHkgZG8geW91IGluY2x1ZGUgdW51c2Vk
IGhlYWRlcnM/IE9yIHdoYXQgaXMNCj4gZXhhY3RseSB0aGUgdXNlPw0KDQpJJ20gc29ycnksIEkg
bWlzc2VkIG9uZSB0aGluZy4gQWN0dWFsbHksIHRoZSBjdXJyZW50IHBhdGNoZXMgNC82LzgvMTAv
MTIvMTQvMTYvMTgvMjAgYWxsIHVzZSB0aGlzOg0KDQpGb3IgZXhhbXBsZSwgaW4gcGF0Y2ggNDoN
Cg0Kc3RhdGljIGNvbnN0IHN0cnVjdCBqaGIxMDBfcGluY3RybF9mdW5jX21hcHMgamhiMTAwX2Z1
bmNfbWFwc19zeXMwW10gPSB7DQoJeyAuZnVuYyA9ICJhdXhwd3Jnb29kIiwJCS52YWwgPSAxIH0s
DQoJeyAuZnVuYyA9ICJncGlvIiwJCS52YWwgPSAwLA0KCSAgLm1heF9waW4gPSBKSEIxMDBfRlVO
Q19NQVBTX01BWF9QSU4oUEFETlVNX1NZUzBfR1BJT19BMikgfSwNCgl7IC5mdW5jID0gImdwaW8i
LAkJLnZhbCA9IDEsDQoJICAubWF4X3BpbiA9IEpIQjEwMF9GVU5DX01BUFNfTUFYX1BJTihQQURO
VU1fU1lTMF9HUElPX0EzKSB9LA0KCXsgLmZ1bmMgPSAiaGJsZWQiLAkJLnZhbCA9IDEgfSwNCgl7
IC5mdW5jID0gInBlMnJzdF9vdXQiLAkJLnZhbCA9IDAgfSwNCn07DQoNClRoZXNlIGRlZmluaXRp
b25zIGFyZSB1c2VkIGluIGBzdHJ1Y3QgamhiMTAwX3BpbmN0cmxfZnVuY19tYXBzYCBvciBgc3Ry
dWN0IHBpbnZyZWZfZGVzY2AuDQoNCkJlc3QgUmVnYXJkcywNCkNoYW5naHVhbmcNCg0K
