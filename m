Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2123.outbound.protection.partner.outlook.cn [139.219.146.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A994A282F34;
	Sun, 30 Aug 2026 09:12:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.123
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788081146; cv=fail; b=sOLJfsXJbq1cSiwzybvK3ft+0zuPPb9iEJdgnCSGOJDrqurKhETD5Qn74WAMzzgEVW35jm5e5vHYKukn+LOOupHnsZyTmA0gSt9IM2m6lMRM9w1cNsidumicfytUe5tWh0Ccmf7eIb9aL79CcR6RgnecNv/sZdt921J/08q4EHc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788081146; c=relaxed/simple;
	bh=oBcL1CQujGmASYfR018xZc0b7M2A3wvMPHUFodigz70=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=gkvYslxb/2ccuW/F6bK+BGDFnvxHc+MUeCCfGLTTQeOZYbLlLMFPlOgiAhuTp4yu5T6M030WSrmn3aNCO9SRpbQilxYI0kGEwWvpvPiYRXZAjN8R3SraJaGLJgKpwWsL+gD6m5tV9i0Tz6SDuSLXuqcueHEMCRPjTaolZRu1GUg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nRDombBI1900FTcv6a91v70+Rz75VYk7ihUe6tksTNv18LMuLPxahreT1VQprP5BSWaLcuUnIwbkvHMypwJf1U6vfnwkJXPNfNEE/XOkuZ3v1WnwaUrmmDue0MeAYF7LLBtcsSzJ3sPSIfLNcUr5TcvPHRt17HL8tJ71/kbbGQpVbVPnvt9UaVywZ4wEu4SMmXxN6qrgZgXvP643lVLr/bQ8qUDhvpjVEkQl1Z/KWWhoI/7i9QyJTYpgfjhhQNl1kdzY/Pq93KCAHUOyHqi6cflH29UF/2yuwsHJVi1Nc94SqwTM45DFUPBf+TbjLw1HZia7HT/BI+5VwFQJr3+5aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oBcL1CQujGmASYfR018xZc0b7M2A3wvMPHUFodigz70=;
 b=VKM2l0aSv3W4ZzazqA3CPsx46k2U8gXiguRMCrWP2gWppBANZUjK3axTX9JJoUEicoRHt5qId2Q1SwiVk88q9LPOLnDIbSHiFaDiaivvwObDIo9Jungyqc00q3WY0ZRov8mdsOTswQkX8NmgYDgJKArGjnJF0GZaYunZwRzfKF0JTHBtWPC69BP5LfUX40/aU+ug76fE2tXQmN8V2v/yelROgfkAXGVeZpcTedgRuPSGFHG1PwvOOUhfhusVQW6ULlXdp8ijdSI6GB66kqWDX0N+oEo0Ev5aAKSCfGCBEloBM9e4nt5lp9Ik3aa+QMrCQEB5NOX9VP6yqJ7TuqBnzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1219.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:15::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.12; Sun, 30 Aug
 2026 08:57:24 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0315.011; Sun, 30 Aug 2026 08:57:24 +0000
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
Thread-Index:
 AQHdN2ImqvaIx8mSbUaeHyzzD+v1QLa0qs+AgAEkaZCAAHWtgIAAA1cAgAABZ4CAAAK9MA==
Date: Sun, 30 Aug 2026 08:57:24 +0000
Message-ID:
 <ZQ4PR01MB1202123864865439817E1549F2AA2@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
References: <20260829025720.23915-1-changhuang.liang@starfivetech.com>
 <20260829025720.23915-4-changhuang.liang@starfivetech.com>
 <f474f659-8234-4dfb-85cc-06d2cc295107@kernel.org>
 <ZQ4PR01MB1202DDBD0436E8F580EB6575F2AA2@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
 <ac4c6b24-02c7-4dc3-89e4-45aa335255d3@kernel.org>
 <ZQ4PR01MB120205984FB23C0776BD0D0AF2AA2@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
 <08c6dad7-8b0d-4daf-908e-5af875306f0f@kernel.org>
In-Reply-To: <08c6dad7-8b0d-4daf-908e-5af875306f0f@kernel.org>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1219:EE_
x-ms-office365-filtering-correlation-id: bfdab9bb-c993-44cc-9c5c-08df0674b5cf
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|366016|1800799024|23010399003|376014|22082099003|18002099003|10067099003|56012099006|38070700021|4143699003|921020;
x-microsoft-antispam-message-info:
 jG72j6N3cvgQC2VVwZS0gQI5czErSPoejmcgBJMamqRpItoSa05L6vIIGpk6iG2nXn+NFhHbDQv2CoRFKxyt7tXlpmuFbS6s35wTLcrV8ccy+U0p7aOO9p1q6ex8ZMb5j8kv51x4w2pCSWpSHsB6MxRTigDOqaxhsGi2jCzJL4Aab9XcJbaGiPTcsPSte7ZzDTE3e0EMqrgV3+PSihDAa39B/YkioAikKRe5TKpoluasMCiLyPNG+/MSySLwwzECGniPuVW8kxZK7SxjuxHVNrYg4yZvg4a0QknsDR8shQIEBVGPbBI8hdavUmUJiWL5k6VQwQ9TI3PZpTwGpNV4k10EV/3zyPKR/uUskAinnGPsMcHCT44wa8nNuHoekKIhCBoebXR5NDlRe6VikrGuQgodaNJ7k45NjgtSYSZ/RL8L3T7A4HJANL8gB6dY84HSnFZd/rHX/ALi25m7tyWRJbM6hR17KniOCZeqvWuxpzTg/YXZREXFRkiqoN8QIatEmAxD2iuiDdvRD6QVo8h2Zm/H2z8XwTr601a8gPQTczjxSniCbM95TtshNbc8BfPBOM/1w8NCUnSjYmMFVOFEGw==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(1800799024)(23010399003)(376014)(22082099003)(18002099003)(10067099003)(56012099006)(38070700021)(4143699003)(921020);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?K2VyUklTbThuTE5SZVM0VzBFKzV2dWZuc0k1SGFqNlFuVkFqVGwrMm5adzNq?=
 =?utf-8?B?TXN3Z0ZndUFtYnRBNlhCVmNJYWNoTmg5MTBtSjNsdmlGeFE1S3E0ZUFGbEVx?=
 =?utf-8?B?V0lESE9qbjI5U3FTWXdtSE0rdUxRSlRMbitDZVNoK1MyMzloMXhJam9Fdnp2?=
 =?utf-8?B?ZGdHTVNDYlNIS012aGM2SW1OS0U5R0hRODlPYzZPZHpWTVhnYWxyTnQ5VVh1?=
 =?utf-8?B?bkVyZnY2U216cVhPSnhnS3ZUMzRqY2V0QW4wTE92ZnlRVytLSkRVSXVkZmRB?=
 =?utf-8?B?VkNFZVZ1dENjMTJRY2ZYSlFCUHNkeUZSNlZNYTU4V01QckFZVmdPK1JjM2Z6?=
 =?utf-8?B?bkcxTmw4T05jb0VLZEk5VnBqY1htZXdGSzZKeUhBUlBUc0d2aHVUMkxOVzl5?=
 =?utf-8?B?Z3h2K2JHN0l6WHBrTUMzU0hQYXlkcVhxbkJCL0xvNm5ObHBDdDJRNTR3WHB2?=
 =?utf-8?B?MzFkL0hRVjh6NWh6M0owYTBaRHNSTktadlZvUllVOFVHTTQwbzQ0TmNLTS9D?=
 =?utf-8?B?Yy8xbzNDcDhWSGlQaXFScy9kNVlYVVJzaFY0eXU2Q2ZHb0ptckNhUnZ1cUdl?=
 =?utf-8?B?MFFBWHR0Q0Q2TGVHeHhhSHpZRloraGpZbzBoOE1UbjVJNW82eEdzYmVHWHcw?=
 =?utf-8?B?SnFhVENwNGgxMitVRUc4RkRkUnBWR29IWjJyOVIyVmVqRkFMdHQ3VmJMeWVs?=
 =?utf-8?B?dCtCc2VZNEEzYi83Z0JrVVBMaEh5bFdhSnNISHVCaHp3S1puekNHT2hUQjB3?=
 =?utf-8?B?TXN4WFpxZWt5OHh0Y3U5R1ZPc25PcWNJeUR3YXVQcktTNFRZWmY2aDcvbjlY?=
 =?utf-8?B?b0U4cGVGQkthZy94bDUvT1pvRGNkVlFIbUxDM25qRk44d0U2dEwrWHdrOTBL?=
 =?utf-8?B?SFNtYVdIdXRYTi9xSGwxaTJSUHdTclhob0dnRWNoSXVhOGFNdG9EZFllSlc5?=
 =?utf-8?B?L2tnTjF6MExhSUlUSFV2Q3lHbzBhY3FmR0Q0MzZzRTRXaU16MEFGZnZtay9r?=
 =?utf-8?B?c1JwYnRXWkxBbGkwRUUyMzNEdkhiQXRxeVU2Q3BhTVB4YmQrekN3QmJJUEZD?=
 =?utf-8?B?aEppdFZMcUJ0cFdNT3U4b2RxZjl5Qm0yallKQTk4dUFBREduY1FHUHVQY0Y5?=
 =?utf-8?B?eFo5dXRXQU9CUzJSK0JkRW05TDZMZXZtNE5sVzBicEpjVDNQVGFFblloMlky?=
 =?utf-8?B?WmdSTnQ5T3I4ZjBWYzNrNS9wSFMvV3lSS0kxSnJDVzIwbyszbkNhdWNjS3Ey?=
 =?utf-8?B?S0hwVVRETHovK0RXb01VcVp6b1pCV3lOR3dhNzcxTnBLQWRVcUVjblJ5T1Zw?=
 =?utf-8?B?U2pPbXVJRTd6bXZaT1BmWXhkbjFySmJ1a3BZdG5qc21ZMUFLMit3QVc0NTdN?=
 =?utf-8?B?NXNZNk9IOWgzVjJ1QTRWa25PZWxWZldjVzM5UXNncENGeWhnZnlScGVQVTFv?=
 =?utf-8?B?K1pjOHg0T1BQaUNYdk5aMlBtUXlCaHYzdVVZUmdacUZGeE9sdTJYeHFoRTZi?=
 =?utf-8?B?Y2ZrSGltTGUxZGUxTTV4ZU9Rd1Z0elJFallhRlovdllwMzhqK3dwY1JCNm5W?=
 =?utf-8?B?ZXpSUU56dkp3c2svS2E4cXRuWkhaY21pdUtEaHFuVXNzN0tXYjVHYWtUQ0FB?=
 =?utf-8?B?TER2MFVtNnVKa3VIRVUyWXczaTlSRmhLMU9BWkpHSkNrK3BGdTJCM3ZFbDJu?=
 =?utf-8?B?RE5hL0JXRDlTek84a0l1N2t5d20rY2pxOXpGbnI1TWxLanhUN1UveEt0eFM2?=
 =?utf-8?B?QWpIcU4vTmx5eXdiQVgwRkg0d0YxdUszbWg4WGpRa24yTVgzdGQyVWhsbytw?=
 =?utf-8?B?SXN4ZXVJWVdLNDZ2cFpYYVUyQ3oySVR3aVpBb0pHMlFSZEFKT1NVdmhqSkI3?=
 =?utf-8?B?RjBpVSszK2RQWm9ES1ltNG4zTWUwQ3FOMkFTZjFTNUtLK3VoMWZjMk83YVM0?=
 =?utf-8?B?aGIvRFBrRExXbzJVcmxLUW9EYlN4NFQ0Rk5iN1dDbmxxU1F3bjMrQXhKYmhH?=
 =?utf-8?B?bFBJaC9aZkcxMURYWVFRbVFaZmlIY1Q1OTNZU1JNcm92QXFHQnlyYUptZ3Z5?=
 =?utf-8?B?VkZxY2x2c2liOVBRL3QycVR2cXordUJCWVVkRHpxS1ZDeC8ySWI4U0gzSmZu?=
 =?utf-8?B?M1RxREhNb0tWeHR4OStvcDdKUnBvSDRDVUtmTGx0c1ZucEtMeGtYUGg2SGI3?=
 =?utf-8?B?c2RZMTJYM1A1eDZVR2JUYjAwallid0ovTlRMeWNYOHptcHF2Skh6UnZYTDVt?=
 =?utf-8?B?ZW1seFBvWEZ6S0o4eWRJWk9RMGt5ZG9qTW1oWEQvT2o0SnFjL1lBMGRCWUlx?=
 =?utf-8?B?cXR0QXJLOXJGcjIzQUN0WTkwVEVybXZNY29QNVdvWmR2ZTRDVEJoMkx0ckdl?=
 =?utf-8?Q?Nh4jvZN6Mjy4CyDU=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: bfdab9bb-c993-44cc-9c5c-08df0674b5cf
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Aug 2026 08:57:24.5401
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7fAgVtB8fpAytVR6v73/XPcIcFcusBBDK5Pvadgq91FfCA6IR6GTFzFQX7rMhp23dvvnx/K0XSzyajpmRlcmdtaxPf2NuPwH38kq5AQB/ykJeWW66avXw18slTVmutuq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1219

SGksIEtyenlzenRvZg0KDQpUaGFua3MgZm9yIHRoZSByZXZpZXcuDQoNCj4gT24gMzAvMDgvMjAy
NiAxMDo0MiwgQ2hhbmdodWFuZyBMaWFuZyB3cm90ZToNCj4gPiBIaSwgS3J6eXN6dG9mDQo+ID4N
Cj4gPiBUaGFua3MgZm9yIHRoZSByZXZpZXcuDQo+ID4NCj4gPj4gT24gMzAvMDgvMjAyNiAwMzoy
OSwgQ2hhbmdodWFuZyBMaWFuZyB3cm90ZToNCj4gPj4+IEhpLCBLcnp5c3p0b2YNCj4gPj4+DQo+
ID4+PiBUaGFua3MgZm9yIHRoZSByZXZpZXcuDQo+ID4+Pg0KPiA+Pj4+IE9uIDI5LzA4LzIwMjYg
MDQ6NTcsIENoYW5naHVhbmcgTGlhbmcgd3JvdGU6DQo+ID4+Pj4+ICsjaWZuZGVmIF9fRFRfQklO
RElOR1NfUElOQ1RSTF9TVEFSRklWRV9KSEIxMDBfSF9fDQo+ID4+Pj4+ICsjZGVmaW5lIF9fRFRf
QklORElOR1NfUElOQ1RSTF9TVEFSRklWRV9KSEIxMDBfSF9fDQo+ID4+Pj4+ICsNCj4gPj4+Pj4g
Ky8qIHN5czAgcGFkIG51bWJlcnMgKi8NCj4gPj4+Pj4gKyNkZWZpbmUgUEFETlVNX1NZUzBfR1BJ
T19BMAkJCQkwDQo+ID4+Pj4+ICsjZGVmaW5lIFBBRE5VTV9TWVMwX0dQSU9fQTEJCQkJMQ0KPiA+
Pj4+PiArI2RlZmluZSBQQUROVU1fU1lTMF9HUElPX0EyCQkJCTINCj4gPj4+Pj4gKyNkZWZpbmUg
UEFETlVNX1NZUzBfR1BJT19BMwkJCQkzDQo+ID4+Pj4NCj4gPj4+PiBJIGNvdWxkIG5vdCBmaW5k
IGhvdyB5b3VyIGRyaXZlciB1c2VzIHRoZXNlLCBzbyBhcmUgeW91IHN1cmUgaXQncyBhDQo+ID4+
Pj4gYmluZGluZyBjb25zdGFudCBmb3IgdGhlIFNXPw0KPiA+Pj4NCj4gPj4+IFllcywgdGhlc2Ug
YXJlIG5vdCB1c2VkIGluIHRoZSBkcml2ZXIsIGJ1dCBpbiBQQVRDSCA2LzgvMTAvMTIsIGV0Yy4s
DQo+ID4+PiBzb21lIGRlZmluaXRpb25zIGZvciBvdGhlciBHUElPcyBhcmUgc3RpbGwgdXNlZC4g
VGhlcmVmb3JlLCBJIGhhdmUNCj4gPj4+IHVuaWZvcm1seSBkZWZpbmVkIHRoZW0gaW4gdGhlIGJp
bmRpbmcsIGFuZCB0aGV5IHdpbGwgYmUgcHJvdmlkZWQgdG8NCj4gPj4+IHRoZQ0KPiA+PiBkZXZp
Y2UgdHJlZSBmb3IgdXNlIGxhdGVyLg0KPiA+Pg0KPiA+PiBJIGFtIGNvbmZ1c2VkLiBUaGUgZHJp
dmVyIGluIHRoZXNlIHBhdGNoZXMgNi84LzEwLzEyIGRvZXMgaW5jbHVkZSB0aGUNCj4gPj4gaGVh
ZGVyIGJ1dCBkb2VzIG5vdCB1c2UgdGhlbS4gV2h5IGRvIHlvdSBpbmNsdWRlIHVudXNlZCBoZWFk
ZXJzPyBPcg0KPiA+PiB3aGF0IGlzIGV4YWN0bHkgdGhlIHVzZT8NCj4gPg0KPiA+IEknbSBzb3Jy
eSwgSSBtaXNzZWQgb25lIHRoaW5nLiBBY3R1YWxseSwgdGhlIGN1cnJlbnQgcGF0Y2hlcw0KPiA0
LzYvOC8xMC8xMi8xNC8xNi8xOC8yMCBhbGwgdXNlIHRoaXM6DQo+ID4NCj4gPiBGb3IgZXhhbXBs
ZSwgaW4gcGF0Y2ggNDoNCj4gPg0KPiA+IHN0YXRpYyBjb25zdCBzdHJ1Y3QgamhiMTAwX3BpbmN0
cmxfZnVuY19tYXBzIGpoYjEwMF9mdW5jX21hcHNfc3lzMFtdID0gew0KPiA+IAl7IC5mdW5jID0g
ImF1eHB3cmdvb2QiLAkJLnZhbCA9IDEgfSwNCj4gPiAJeyAuZnVuYyA9ICJncGlvIiwJCS52YWwg
PSAwLA0KPiA+IAkgIC5tYXhfcGluID0NCj4gSkhCMTAwX0ZVTkNfTUFQU19NQVhfUElOKFBBRE5V
TV9TWVMwX0dQSU9fQTIpIH0sDQo+ID4gCXsgLmZ1bmMgPSAiZ3BpbyIsCQkudmFsID0gMSwNCj4g
PiAJICAubWF4X3BpbiA9DQo+IEpIQjEwMF9GVU5DX01BUFNfTUFYX1BJTihQQUROVU1fU1lTMF9H
UElPX0EzKSB9LA0KPiA+IAl7IC5mdW5jID0gImhibGVkIiwJCS52YWwgPSAxIH0sDQo+ID4gCXsg
LmZ1bmMgPSAicGUycnN0X291dCIsCQkudmFsID0gMCB9LA0KPiA+IH07DQo+ID4NCj4gPiBUaGVz
ZSBkZWZpbml0aW9ucyBhcmUgdXNlZCBpbiBgc3RydWN0IGpoYjEwMF9waW5jdHJsX2Z1bmNfbWFw
c2Agb3IgYHN0cnVjdA0KPiBwaW52cmVmX2Rlc2NgLg0KPiANCj4gT0ssIEkgd2FzIGxvb2tpbmcg
Zm9yIFBBRE5VTV9TWVMwX0dQSU9fQTAuDQo+IA0KPiBXaHkgZG8geW91IG5lZWQgdW51c2VkIGNv
bnN0YW50cz8gVGhlIGNvbnN0YW50cyBpbiBiaW5kaW5nIGhlYWRlcnMgYXJlDQo+IGludGVyZmFj
ZSBiZXR3ZWVuIERUUyBhbmQgZHJpdmVycywgbm90IGhhcmR3YXJlIHZhbHVlcy4gWW91IGRvIG5v
dCBuZWVkIHRvDQo+IHN0b3JlIHRoZXJlIGhhcmR3YXJlIHZhbHVlcywgc28gd2hhdCBpcyB0aGUg
YmVuZWZpdCBvZiBkZWZpbmluZw0KPiBQQUROVU1fU1lTMF9HUElPX0EwPyBXaHkgY2FuJ3QgUEFE
TlVNX1NZUzBfR1BJT19BMiBzdGFydCBhdCBpbmRleA0KPiAwPw0KDQpIZXJlLCBpdCBpcyBhbHNv
IHByb3ZpZGVkIGZvciB1c2UgYnkgdGhlIGRldmljZSB0cmVlIGxhdGVyLiBGb3IgZXhhbXBsZToN
Cg0KCWF1eHBvd2VyZ29vZDBfcGluczogYXV4cG93ZXJnb29kMC1ncnAgew0KCQlhdXhwb3dlcmdv
b2QwLXBpbnMgew0KCQkJcGlucyA9IDxQQUROVU1fU1lTMF9HUElPX0EwPjsNCgkJCWZ1bmN0aW9u
ID0gImF1eHB3cmdvb2QiOw0KCQkJaW5wdXQtZW5hYmxlOw0KCQl9Ow0KCX07DQoNCglhdXhwb3dl
cmdvb2QxX3BpbnM6IGF1eHBvd2VyZ29vZDEtZ3JwIHsNCgkJYXV4cG93ZXJnb29kMS1waW5zIHsN
CgkJCXBpbnMgPSA8UEFETlVNX1NZUzBfR1BJT19BMT47DQoJCQlmdW5jdGlvbiA9ICJhdXhwd3Jn
b29kIjsNCgkJCWlucHV0LWVuYWJsZTsNCgkJfTsNCgl9Ow0KDQpUaGUgcGlucyBwcm9wZXJ0eSBj
b3JyZXNwb25kcyB0byB0aGUgc3BlY2lmaWMgR1BJTyBvZmZzZXQsIHNvIFBBRE5VTV9TWVMwX0dQ
SU9fQTIgY2Fubm90IHN0YXJ0IGF0IGluZGV4IDAuDQoNCkJlc3QgUmVnYXJkcywNCkNoYW5naHVh
bmcNCg==
