Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2118.outbound.protection.partner.outlook.cn [139.219.146.118])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFE1833E36A;
	Wed,  9 Sep 2026 06:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.118
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788936739; cv=fail; b=uOmXDq+1y1inSotoGxULjom2aI1UtJ1YnNfxZO/mjJj+Nu7W3eWmPICzAoZ55r30rKt+3Bo2nTAE3mmoElMHO8f+AtCmMWfO6wOrGjQipNKIKQ/NDPZV5vzoNxtaM8XIjDEjry2xcFLPqDjFmx7QZ2E8RzJBPzpNuM4qrAhFzy0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788936739; c=relaxed/simple;
	bh=wH3tnC1x8QVRnqZUzBW+dfu+TqsW/CuW6tcUfPCyCBg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=WcY2d3THXBk+GIDiT1fNeAMFNOHL/EM/ZUnfugUQ+B9lEaPGxQH4bEoMmeTUajjUUcIRBZjEQz7gpZTFYxwUKqRsGmemBYq6VoQpguVgXnrzNOSYYUz6hxmqevJ+YBGyzObKMnS477Ck7yJe4JM8QA6KKnXU4PYYG4fD2Yu1ykA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.118
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qxz26fLuuY+RQFx1oJsQQu6B8wtoLY46VDjBznZktyI+ASom8P5SXxGeB+0XSn6un4xhlJXe02y9l/Ha5SbsStRq8SWWcsY9UWGC/ajU9pGHZTV8ePOQHzQRoJs5CUCuCWE9E7BV8EuJJxzVQ+1tHiu+TLPNsv79D5f4Ej6mQXpz9Zag84ToeQTYDJGLnHeIIfCiXNu09sZNvUZAdfqBqOfzJP+AJRo+k6uNmMyXzybkPApvG1dFMzZVS3GhprAv18Pq8mi4wcJQTubWK0wHI1gVPR2JMLcCNzcBStX/z7bvcuJjWsJqsu9VULTK2kTG+laugZGNTnYzAQ1ozP5iSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wH3tnC1x8QVRnqZUzBW+dfu+TqsW/CuW6tcUfPCyCBg=;
 b=RZTxBL3vExyBjBrat5ffIBMFn/BQkU5Fhk2//VVJf//CFDXChEbUOUa47nxTP/TNqvwaG6gjw7rWbt33okMGaRD/E4gz84SZjqpb/bZxR3AobxA40SUvyEhXT+5h0/bFNc9waSUk5lU6SRBx8/zLqI9NpVu20qlap2kjzrHFV4dbW6/Et1BAsWNuF0w/X93eMsw4TTW0f2WvTyh5hWStX1tGeDJ2Ow3Nlsm5yv/DAkFsD1DlKqXygQXc2q1vkhWDfGDYPVLDUwEcDEx/otcfgj5HCj4fpyK9nszBrAT0J4gC6n5p5D4MwJm7dkzOtrOeOarkb5lLx5kJbV4L/wwHUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1138.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.18; Wed, 9 Sep
 2026 06:52:06 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0339.017; Wed, 9 Sep 2026 06:52:06 +0000
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
 AQHdN2ImqvaIx8mSbUaeHyzzD+v1QLa0qs+AgAEkaZCAAHWtgIAAA1cAgAABZ4CAAAK9MIAPhrWAgAANmpA=
Date: Wed, 9 Sep 2026 06:52:06 +0000
Message-ID:
 <ZQ4PR01MB1202D6E0502B941B170D1C56F2B02@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
References: <20260829025720.23915-1-changhuang.liang@starfivetech.com>
 <20260829025720.23915-4-changhuang.liang@starfivetech.com>
 <f474f659-8234-4dfb-85cc-06d2cc295107@kernel.org>
 <ZQ4PR01MB1202DDBD0436E8F580EB6575F2AA2@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
 <ac4c6b24-02c7-4dc3-89e4-45aa335255d3@kernel.org>
 <ZQ4PR01MB120205984FB23C0776BD0D0AF2AA2@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
 <08c6dad7-8b0d-4daf-908e-5af875306f0f@kernel.org>
 <ZQ4PR01MB1202123864865439817E1549F2AA2@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
 <95b7ad43-9c68-4830-a35c-7cb29ca9b75f@kernel.org>
In-Reply-To: <95b7ad43-9c68-4830-a35c-7cb29ca9b75f@kernel.org>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1138:EE_
x-ms-office365-filtering-correlation-id: c48e9432-93bb-4cd8-cd0c-08df0e3edcfa
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|23010399003|366016|1800799024|56012099006|4143699003|38070700021|10067099003|921020|18002099003|22082099003;
x-microsoft-antispam-message-info:
 xz6TClkQJXOz2rEAF9sHlS03udZ9f6U0O8STOng6HPTihzC1rfCkHD2n8Zx4axbehxFhNx0SXUVgPvxS1Uaqz9k9FL4zBMnGrxdQ0MWe2BKPoxW4rIQVFieGphJHifU7Kir851F0USN028QayiRPRzTRbSIBDcx/Y0YEUh3zc0zX0/cZy3prLNrcEWvIKxjV+CQbrVTJ7FwiJOURRpWXPM07BXtIUo8u3tG0KwU0X0oClkGAFYfpdIXaqD6yb/UQCXpZTaG7vEnmNgvtV1DnPo2/bNZIM5DbYoQwvq9KEB4tvacsGlG3i/8xK4NF4vxO3z2urHSidrLzGZNJoxdiBPQ5Qcib/7Jz8ShdZ2K/jN25GltmIfWxC5+r326KzXfPag10QEFMq7/16ZTE0SLZuTcffAxBGe/nrxDQqpheYMB6s+dWQCA9s9qnMAA63mkcm0X5Ox+0xoZQsvO5cyr2hwQ4MOIBhm66Wk1dNkI66ESGgIqTMBy5h7Lo+4vTm2MBMDwjTQQxMvSZlsg1HQZ88NhyteCf0fA7J71ifB71Fs5oVBb+pv4R9RqlhrZoqTWAdTyyeeUAW/+Cm6dHo5MQ3w==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(366016)(1800799024)(56012099006)(4143699003)(38070700021)(10067099003)(921020)(18002099003)(22082099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?akhYcUd5ZHBaS2JjaUNRQy9NVEtjSkQ5TzFOT09VRk9VRXdmWlZlbmlEeXF6?=
 =?utf-8?B?bGY4WWVsYUVVQ0xFaFhwSmxFNWxjdzcxMk14S2k3TWlBNUhZUTZLdmZJMy94?=
 =?utf-8?B?dWFESXVyZWtZaWpEUGNEbGNNekhPWTdEVkpmWlMyYWROdmFUNjNiRnBHS1Nk?=
 =?utf-8?B?TFpNZ3A1OWp4cG5pZENxZk9VVEJtTW94L1JTbDdMWWJwdW0wWHNvcTZlY2tY?=
 =?utf-8?B?VFFuZkJyem5IRmV4SWM4Y3p2RU1BUExyYnBLRUxTZ0h3NUxjdTJqZmJzZnRZ?=
 =?utf-8?B?aEVSdFpBV3h1TGpHTFEvdndOWFNKMkFPVE1mbk1mbmFsZ0QyZEF4VDd6aXlI?=
 =?utf-8?B?MVFHMEFjOVUzK0Q1TDY5YXN2U0ZvTSswbUJCcEQ1cUxKVUVpb0lDZCtZQ0Fl?=
 =?utf-8?B?Wmp0L3I2aDRVc0ZaL3lwUngyL0dVVHQxYUtGMHJFWm1CN2xibnpyclIzcVJm?=
 =?utf-8?B?bmUrT1NYdzJicGxCN0NVV1ZXNTFZQzJzTnBRUWRvVGtPU0JKTUVGUjdCeGdJ?=
 =?utf-8?B?RWZhRHQ1N2dLdjBBUTNHenpZQzFXdlQrTUFtaW82VUR2MWlxT1hwbWZyaFV3?=
 =?utf-8?B?c2o2NTNEZktabEx5dVB4VHdrVEt0dDFJclozNWN2OVgyZ205MjJjVS9Wa0l4?=
 =?utf-8?B?dGR2aFJQMUN3YyszWXRxU1YydEhwanVBWUpUTldUalh1TFEyZU9ZK0JyRkZL?=
 =?utf-8?B?MW5nVVE1Z2hBNTJEWEJBYXJITTV3ZExkUys0QnEwWS9jUlhBT1BCdjJET2o2?=
 =?utf-8?B?U2VNaTUyRnZkbjhLSmx4SlZtNDdIQ04vQzhaWEYxRVV4Zi9RYUF3SEFndFJH?=
 =?utf-8?B?cUMybjdyem9TS1lhUDVHWnZ0cEk4QjVNRGFRejRiRjFnaVUwcUVkeGRJZ2s2?=
 =?utf-8?B?RU1hMi9mUWt1U3ptRCtaOTZ4NGpjZDRCcFh5ZXJ0Y1NFWEZLZ3U3Y2tkelhy?=
 =?utf-8?B?OTZPa1RCa3crNVVTek55Q3BXbFJTQVFjQTVxenVLd3FoenJUOHBhdnJwUFJM?=
 =?utf-8?B?azBVa2hKNlh5WVE3a2ovV3ROUkE2ZkluZWhxazc4cWJxUS9TV2c0dkVQWjkz?=
 =?utf-8?B?Y2VzeTlMUzRUb2dWazk4KzRqRUN2cmVXL0YzM1ZoY0xidEdzK1hJeThsek5o?=
 =?utf-8?B?cE5kM3NpeS9KcUF2Sm1LcStIU2tOZ2o0WnF2anl0aENYY0hBZStlR2hWMEov?=
 =?utf-8?B?QnN6RXZmZTY4Q2ljbjRTTmtlWlBEZEs1WWJPSlp3NWdLNFpycjVITXhKZkdT?=
 =?utf-8?B?TVl5Z3FPWHNXVm5GS0hiSU5vSk1hSVp5Y0pUekZUL3UrekY3eHhENng0anBL?=
 =?utf-8?B?TEFBQlY2K3I5empWZ1ZqcTVDYm5BMjNvQUFHd3VDcnFHZldpanpWZUVkU3Q2?=
 =?utf-8?B?MVFCcTA3VFI1RXBwalVuUFB6elAyc0R5bVZMYkJ6OStrZXJVNm95eDlEVi9W?=
 =?utf-8?B?YWFYQXc1UlY0enl0aGRLNDBzU0R4LzllZ2trK2RwUXp3TWlIQWhIM3JHSkkx?=
 =?utf-8?B?WTdIU1ZDa2t5T1M3WnM0RFdiUTFaeTRxMFl0Q3BBWFZENFFMODdXbjU3VDRx?=
 =?utf-8?B?NGJIcXBMMnhsYTNESllKK1c0eTdGajFnMHIrYmYyVjN0WGRjK3YwSHhXaHZS?=
 =?utf-8?B?ZnRlbno3SEZ4UFRWZEhldTgwSzVHOTZudDY5c2psdEl2VVhjelNHUS9NY0Ri?=
 =?utf-8?B?Rmx4d2VPWFZCNHh2UFpQdHZlZ0JBVzF4VnM2RERyL29HaG05V3ZURUMwSlNB?=
 =?utf-8?B?MXAyOW44eFlnTTZZMHphb1lzR3dMaDZleHRRVnRnQmg1d1c1MXdqR3R5VkJR?=
 =?utf-8?B?Ykl0WG91RWFMdWp4N2w0TE9ub0lDUVloZkNsYmR0bXcrQ1djSjF3Ly9RY2Nq?=
 =?utf-8?B?MGVXN1Bnc2tWRjdzUlo3QlM0U0MyN3ZaSnI1a1QyMi9Wb2RTRmt6T2h6K21h?=
 =?utf-8?B?SjdvNTJvSkw0M2ZNT0Y5cXN3dlA2N1dUMmV6a0xFZHlZcUJOOThvUW5NL2NV?=
 =?utf-8?B?clJQZUZpUWFETm1GRTNaRVExUW1iRU5uVm9mQ3FlNUY1azRZTFNuTXV0UXhG?=
 =?utf-8?B?cm5CVktlUjJVQVZKNkgrbnNiSkVzd3VZUkJrM0xkYUFLaFdCbWJMTkVEQ1R6?=
 =?utf-8?B?a1ZBWFkrSHFDWlBQNTUzckpqTFEvT3JWRGUvTlZvaHlhNmZ5cCtueEF1Y1hG?=
 =?utf-8?B?UFVrTkJqazdaRmhFT3JkWmlPdDJIOFVSc2pQcG5CZVVDYnhwcGFhQlZrZmw0?=
 =?utf-8?B?WG1QQm0vME1QT2RMb2ZHV3VrY290REJpT2FHZy9VZThtYVlrR2ZNS2MydXBP?=
 =?utf-8?B?ZUllZzBYdXUyQlFqYmNldVhFY0JXcmRJK3dJckVtbXZJVjRwNzFIQTJzRSs1?=
 =?utf-8?Q?tFNvMmT9DSHM+CPE=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: c48e9432-93bb-4cd8-cd0c-08df0e3edcfa
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Sep 2026 06:52:06.7566
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YjnSHWixTXRE5Foiy9MKxgnOHpHRmnSvWLKsIN5r7Kx7HDYJtwsSiTM/ZPh7qx8SeAq+TeLs3g4/SNh9cumk7sk+HJFVhCVATkWxKeyE3RIG7sVUfPUcz2XlC1E+ZT7i
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1138

SGksIEtyenlzenRvZiwNCg0KPiBPbiAzMC8wOC8yMDI2IDEwOjU3LCBDaGFuZ2h1YW5nIExpYW5n
IHdyb3RlOg0KPiA+IEhpLCBLcnp5c3p0b2YNCj4gPg0KPiA+IFRoYW5rcyBmb3IgdGhlIHJldmll
dy4NCj4gPg0KPiA+PiBPbiAzMC8wOC8yMDI2IDEwOjQyLCBDaGFuZ2h1YW5nIExpYW5nIHdyb3Rl
Og0KPiA+Pj4gSGksIEtyenlzenRvZg0KPiA+Pj4NCj4gPj4+IFRoYW5rcyBmb3IgdGhlIHJldmll
dy4NCj4gPj4+DQo+ID4+Pj4gT24gMzAvMDgvMjAyNiAwMzoyOSwgQ2hhbmdodWFuZyBMaWFuZyB3
cm90ZToNCj4gPj4+Pj4gSGksIEtyenlzenRvZg0KPiA+Pj4+Pg0KPiA+Pj4+PiBUaGFua3MgZm9y
IHRoZSByZXZpZXcuDQo+ID4+Pj4+DQo+ID4+Pj4+PiBPbiAyOS8wOC8yMDI2IDA0OjU3LCBDaGFu
Z2h1YW5nIExpYW5nIHdyb3RlOg0KPiA+Pj4+Pj4+ICsjaWZuZGVmIF9fRFRfQklORElOR1NfUElO
Q1RSTF9TVEFSRklWRV9KSEIxMDBfSF9fDQo+ID4+Pj4+Pj4gKyNkZWZpbmUgX19EVF9CSU5ESU5H
U19QSU5DVFJMX1NUQVJGSVZFX0pIQjEwMF9IX18NCj4gPj4+Pj4+PiArDQo+ID4+Pj4+Pj4gKy8q
IHN5czAgcGFkIG51bWJlcnMgKi8NCj4gPj4+Pj4+PiArI2RlZmluZSBQQUROVU1fU1lTMF9HUElP
X0EwCQkJCTANCj4gPj4+Pj4+PiArI2RlZmluZSBQQUROVU1fU1lTMF9HUElPX0ExCQkJCTENCj4g
Pj4+Pj4+PiArI2RlZmluZSBQQUROVU1fU1lTMF9HUElPX0EyCQkJCTINCj4gPj4+Pj4+PiArI2Rl
ZmluZSBQQUROVU1fU1lTMF9HUElPX0EzCQkJCTMNCj4gPj4+Pj4+DQo+ID4+Pj4+PiBJIGNvdWxk
IG5vdCBmaW5kIGhvdyB5b3VyIGRyaXZlciB1c2VzIHRoZXNlLCBzbyBhcmUgeW91IHN1cmUgaXQn
cw0KPiA+Pj4+Pj4gYSBiaW5kaW5nIGNvbnN0YW50IGZvciB0aGUgU1c/DQo+ID4+Pj4+DQo+ID4+
Pj4+IFllcywgdGhlc2UgYXJlIG5vdCB1c2VkIGluIHRoZSBkcml2ZXIsIGJ1dCBpbiBQQVRDSCA2
LzgvMTAvMTIsDQo+ID4+Pj4+IGV0Yy4sIHNvbWUgZGVmaW5pdGlvbnMgZm9yIG90aGVyIEdQSU9z
IGFyZSBzdGlsbCB1c2VkLiBUaGVyZWZvcmUsDQo+ID4+Pj4+IEkgaGF2ZSB1bmlmb3JtbHkgZGVm
aW5lZCB0aGVtIGluIHRoZSBiaW5kaW5nLCBhbmQgdGhleSB3aWxsIGJlDQo+ID4+Pj4+IHByb3Zp
ZGVkIHRvIHRoZQ0KPiA+Pj4+IGRldmljZSB0cmVlIGZvciB1c2UgbGF0ZXIuDQo+ID4+Pj4NCj4g
Pj4+PiBJIGFtIGNvbmZ1c2VkLiBUaGUgZHJpdmVyIGluIHRoZXNlIHBhdGNoZXMgNi84LzEwLzEy
IGRvZXMgaW5jbHVkZQ0KPiA+Pj4+IHRoZSBoZWFkZXIgYnV0IGRvZXMgbm90IHVzZSB0aGVtLiBX
aHkgZG8geW91IGluY2x1ZGUgdW51c2VkDQo+ID4+Pj4gaGVhZGVycz8gT3Igd2hhdCBpcyBleGFj
dGx5IHRoZSB1c2U/DQo+ID4+Pg0KPiA+Pj4gSSdtIHNvcnJ5LCBJIG1pc3NlZCBvbmUgdGhpbmcu
IEFjdHVhbGx5LCB0aGUgY3VycmVudCBwYXRjaGVzDQo+ID4+IDQvNi84LzEwLzEyLzE0LzE2LzE4
LzIwIGFsbCB1c2UgdGhpczoNCj4gPj4+DQo+ID4+PiBGb3IgZXhhbXBsZSwgaW4gcGF0Y2ggNDoN
Cj4gPj4+DQo+ID4+PiBzdGF0aWMgY29uc3Qgc3RydWN0IGpoYjEwMF9waW5jdHJsX2Z1bmNfbWFw
cyBqaGIxMDBfZnVuY19tYXBzX3N5czBbXSA9DQo+IHsNCj4gPj4+IAl7IC5mdW5jID0gImF1eHB3
cmdvb2QiLAkJLnZhbCA9IDEgfSwNCj4gPj4+IAl7IC5mdW5jID0gImdwaW8iLAkJLnZhbCA9IDAs
DQo+ID4+PiAJICAubWF4X3BpbiA9DQo+ID4+IEpIQjEwMF9GVU5DX01BUFNfTUFYX1BJTihQQURO
VU1fU1lTMF9HUElPX0EyKSB9LA0KPiA+Pj4gCXsgLmZ1bmMgPSAiZ3BpbyIsCQkudmFsID0gMSwN
Cj4gPj4+IAkgIC5tYXhfcGluID0NCj4gPj4gSkhCMTAwX0ZVTkNfTUFQU19NQVhfUElOKFBBRE5V
TV9TWVMwX0dQSU9fQTMpIH0sDQo+ID4+PiAJeyAuZnVuYyA9ICJoYmxlZCIsCQkudmFsID0gMSB9
LA0KPiA+Pj4gCXsgLmZ1bmMgPSAicGUycnN0X291dCIsCQkudmFsID0gMCB9LA0KPiA+Pj4gfTsN
Cj4gPj4+DQo+ID4+PiBUaGVzZSBkZWZpbml0aW9ucyBhcmUgdXNlZCBpbiBgc3RydWN0IGpoYjEw
MF9waW5jdHJsX2Z1bmNfbWFwc2Agb3INCj4gPj4+IGBzdHJ1Y3QNCj4gPj4gcGludnJlZl9kZXNj
YC4NCj4gPj4NCj4gPj4gT0ssIEkgd2FzIGxvb2tpbmcgZm9yIFBBRE5VTV9TWVMwX0dQSU9fQTAu
DQo+ID4+DQo+ID4+IFdoeSBkbyB5b3UgbmVlZCB1bnVzZWQgY29uc3RhbnRzPyBUaGUgY29uc3Rh
bnRzIGluIGJpbmRpbmcgaGVhZGVycw0KPiA+PiBhcmUgaW50ZXJmYWNlIGJldHdlZW4gRFRTIGFu
ZCBkcml2ZXJzLCBub3QgaGFyZHdhcmUgdmFsdWVzLiBZb3UgZG8NCj4gPj4gbm90IG5lZWQgdG8g
c3RvcmUgdGhlcmUgaGFyZHdhcmUgdmFsdWVzLCBzbyB3aGF0IGlzIHRoZSBiZW5lZml0IG9mDQo+
ID4+IGRlZmluaW5nIFBBRE5VTV9TWVMwX0dQSU9fQTA/IFdoeSBjYW4ndCBQQUROVU1fU1lTMF9H
UElPX0EyDQo+IHN0YXJ0IGF0DQo+ID4+IGluZGV4IDA/DQo+ID4NCj4gPiBIZXJlLCBpdCBpcyBh
bHNvIHByb3ZpZGVkIGZvciB1c2UgYnkgdGhlIGRldmljZSB0cmVlIGxhdGVyLiBGb3IgZXhhbXBs
ZToNCj4gPg0KPiA+IAlhdXhwb3dlcmdvb2QwX3BpbnM6IGF1eHBvd2VyZ29vZDAtZ3JwIHsNCj4g
PiAJCWF1eHBvd2VyZ29vZDAtcGlucyB7DQo+ID4gCQkJcGlucyA9IDxQQUROVU1fU1lTMF9HUElP
X0EwPjsNCj4gPiAJCQlmdW5jdGlvbiA9ICJhdXhwd3Jnb29kIjsNCj4gPiAJCQlpbnB1dC1lbmFi
bGU7DQo+ID4gCQl9Ow0KPiA+IAl9Ow0KPiA+DQo+ID4gCWF1eHBvd2VyZ29vZDFfcGluczogYXV4
cG93ZXJnb29kMS1ncnAgew0KPiA+IAkJYXV4cG93ZXJnb29kMS1waW5zIHsNCj4gPiAJCQlwaW5z
ID0gPFBBRE5VTV9TWVMwX0dQSU9fQTE+Ow0KPiA+IAkJCWZ1bmN0aW9uID0gImF1eHB3cmdvb2Qi
Ow0KPiA+IAkJCWlucHV0LWVuYWJsZTsNCj4gPiAJCX07DQo+ID4gCX07DQo+ID4NCj4gPiBUaGUg
cGlucyBwcm9wZXJ0eSBjb3JyZXNwb25kcyB0byB0aGUgc3BlY2lmaWMgR1BJTyBvZmZzZXQsIHNv
DQo+IFBBRE5VTV9TWVMwX0dQSU9fQTIgY2Fubm90IHN0YXJ0IGF0IGluZGV4IDAuDQo+IA0KPiBE
aWQgeW91IGV2ZW4gcmVhZCBteSByZXBseT8gT3IgeW91IGp1c3QgcmVzcG9uZCB3aGF0ZXZlciB0
byB0aWNrIHRoZQ0KPiBjaGVja2JveCBvZiByZXNwb25kaW5nIHRvIG1haW50YWluZXI/DQo+IA0K
PiBBR0FJTjoNCj4gIllvdSBkbyBub3QgbmVlZCB0byBzdG9yZSB0aGVyZSBoYXJkd2FyZSB2YWx1
ZXMiDQo+IA0KPiBEbyB5b3UgdW5kZXJzdGFuZCB0aGUgdGVybSBBQkkgYmV0d2VlbiBzb2Z0d2Fy
ZSBhbmQgRFRTPyBJcyBpbiB0aGlzIHRlcm0NCj4gYW55dGhpbmcgYWJvdXQgeW91ciBhY3R1YWwg
aGFyZHdhcmUgbnVtYmVycz8gTm8uDQoNCllvdSBhcmUgcmlnaHQsIGFuZCBJIG5vdyBzZWUgSSB3
YXMgYW5zd2VyaW5nIGEgZGlmZmVyZW50IHF1ZXN0aW9uIHRoYW4gdGhlIG9uZQ0KWW91IGFza2Vk
LiANCg0KU28gSSdkIGxpa2UgdG8gZG91YmxlLWNoZWNrOiBpbiB0aGUgbmV4dCB2OCB2ZXJzaW9u
LCBJJ2xsIHBsYWNlIHRoZSBjdXJyZW50bHkgdW5tb2RpZmllZCANCmBzdGFyZml2ZSxqaGIxMDAt
cGluY3RybC5oYCB1bmRlciBgYXJjaC9yaXNjdi9ib290L2R0cy9zdGFyZml2ZS9gLiBGb3IgdGhl
IG1hY3JvIA0KZGVmaW5pdGlvbnMgdXNlZCBieSB0aGUgZHJpdmVyIChlLmcuLCBgUEFETlVNX1NZ
UzBfR1BJT19BMmAsIGBQQUROVU1fU1lTMF9HUElPX0EzYCksIA0KSSdtIG5vdCBlbnRpcmVseSBz
dXJlIHdoZXJlIHRvIHB1dCB0aG9zZSBkcml2ZXItdXNlZCBkZWZpbml0aW9ucyBub3cuIE15IHBs
YW4gaXMgdG8gcGxhY2UgDQp0aGVtIGRpcmVjdGx5IGludG8gdGhlIHJlbGV2YW50IGRvbWFpbiAo
YHN5czBgKSBmaWxlIGBwaW5jdHJsLXN0YXJmaXZlLWpoYjEwMC08ZG9tYWluPi5jYC4gDQpXb3Vs
ZCB0aGlzIGNoYW5nZSBiZSBhY2NlcHRhYmxlPw0KDQpCZXN0IFJlZ2FyZHMsDQpDaGFuZ2h1YW5n
DQoNCg==
