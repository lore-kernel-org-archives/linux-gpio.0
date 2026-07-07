Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D327320CD9;
	Tue,  7 Jul 2026 08:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783413019; cv=none; b=CDFsMgW4VrRUkZlSICG1EEEkDCTKll9sxK4FfJ2Bz0T4hrSnSl2MGyRh6uMsPbYyNvgDaMKzB1f5ZSB6T82c1psCUgq+I8LhQBDutTWKR34iYLWLoGZXHEyQNidQjwPC7QXOnzl/ZzWVGcfqpKHkreKUaQTF1m6sF2yIJreJJpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783413019; c=relaxed/simple;
	bh=0JsEOF8bmLSrS4nj0xSMqyWG9RHyn4k19piU0uKu4+4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=LS+npmdtRgdklukDXjeDstsOatOVrS7ScbqWwOh301DGT9o3NFmzricSYCn1TKLBv+pZAP6ADY8pRr9oOj8eHYr1jw8/l9tGQTII+4OGqfV5o1ZZJwoTOj4ZTBpD/bE8/apiUHFWueNEY2SQQjtONh8U5lPGrTTOZx8kX2UiLjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=Ekr3oz76; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="Ekr3oz76"
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6678TQIf81038825, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1783412967; bh=0JsEOF8bmLSrS4nj0xSMqyWG9RHyn4k19piU0uKu4+4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=Ekr3oz76yIfYiCYTNeRUTnHQjFgt6x/RQKMQeC3R3liJVkMk76UVKBF+LypnqDUB/
	 v5Ku0gdH+jSLqVWODS8P3SS0/cW5EfBJHhbc0+Kf8Ons5LmeJm5RVJseOPKoV0vKzR
	 +31GQF2uTqmec135U6IdwJaizCxqVuk+jt5/Mm1tGoYMRQytd29LGHEL/0p/OQsr9c
	 pAeb4yDrjDqokqJMIfww/I6ewgozomGbAmMlx7ZWQ3w0iKv3ekODoJv/AqA9umBWBZ
	 5P9y2RARMocdeaixG8mUG99LhD97B4wggOS/Y/Klz2kmcY2H/BC6gInyRMAKxGyonV
	 XSq8MTKEQ7fZQ==
Received: from mail.realtek.com (rtkexhmbs04.realtek.com.tw[10.21.1.54])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6678TQIf81038825
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 7 Jul 2026 16:29:27 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS04.realtek.com.tw (10.21.1.54) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 7 Jul 2026 16:29:25 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([::1]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::e6fd:5a3f:8946:92c4%10]) with mapi id
 15.02.2562.017; Tue, 7 Jul 2026 16:29:25 +0800
From: =?utf-8?B?WXUtQ2h1biBMaW4gW+ael+elkOWQm10=?= <eleanor.lin@realtek.com>
To: Bartosz Golaszewski <brgl@kernel.org>, "andriy.shevchenko@intel.com"
	<andriy.shevchenko@intel.com>
CC: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
	"linux-realtek-soc@lists.infradead.org"
	<linux-realtek-soc@lists.infradead.org>,
	=?utf-8?B?Q1lfSHVhbmdb6buD6Ymm5pmPXQ==?= <cy.huang@realtek.com>,
	=?utf-8?B?U3RhbmxleSBDaGFuZ1vmmIzogrLlvrdd?= <stanley_chang@realtek.com>,
	=?utf-8?B?SmFtZXMgVGFpIFvmiLTlv5fls7Bd?= <james.tai@realtek.com>, "Bartosz
 Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>, "linusw@kernel.org"
	<linusw@kernel.org>, "robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "afaerber@suse.com" <afaerber@suse.com>,
	"mwalle@kernel.org" <mwalle@kernel.org>,
	=?utf-8?B?VFlfQ2hhbmdb5by15a2Q6YC4XQ==?= <tychang@realtek.com>
Subject: RE: (subset) [PATCH v4 0/4] gpio: realtek: Add support for Realtek
 DHC RTD1625
Thread-Topic: (subset) [PATCH v4 0/4] gpio: realtek: Add support for Realtek
 DHC RTD1625
Thread-Index: AQHdAijOhwVVCHLFCkaSAZ80GLo1NbZP+P+AgBG4dLD//4dbAIAACTuAgAAHBQCAAIdPIA==
Date: Tue, 7 Jul 2026 08:29:25 +0000
Message-ID: <1b84432e6d5f40ceb1597a75f2ecc652@realtek.com>
References: <20260622092335.1166876-1-eleanor.lin@realtek.com>
 <178246069898.6685.11577448681947659397.b4-ty@oss.qualcomm.com>
 <a00c475a6ce0469682305c4b4269b181@realtek.com>
 <CAMRc=Md-iOQ5qb5uPZcKJkpS8fmYscw8TRXqe7rRrJS7acE32w@mail.gmail.com>
 <akyxXxtj8nyCs-yf@ashevche-desk.local>
 <CAMRc=MfD2j3xt1dXojFbyn=Df_9epMgEmLvSdCAfS7BSS6HD6w@mail.gmail.com>
In-Reply-To: <CAMRc=MfD2j3xt1dXojFbyn=Df_9epMgEmLvSdCAfS7BSS6HD6w@mail.gmail.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

PiBPbiBUdWUsIDcgSnVsIDIwMjYgMDk6NTc6MTkgKzAyMDAsICJhbmRyaXkuc2hldmNoZW5rb0Bp
bnRlbC5jb20iDQo+IDxhbmRyaXkuc2hldmNoZW5rb0BpbnRlbC5jb20+IHNhaWQ6DQo+ID4gT24g
VHVlLCBKdWwgMDcsIDIwMjYgYXQgMTI6MjQ6MTZBTSAtMDcwMCwgQmFydG9zeiBHb2xhc3pld3Nr
aSB3cm90ZToNCj4gPj4gT24gVHVlLCA3IEp1bCAyMDI2IDA4OjU1OjI2ICswMjAwLCAiWXUtQ2h1
biBMaW4gW+ael+elkOWQm10iDQo+ID4+IDxlbGVhbm9yLmxpbkByZWFsdGVrLmNvbT4gc2FpZDoN
Cj4gPj4gPj4gT24gTW9uLCAyMiBKdW4gMjAyNiAxNzoyMzozMSArMDgwMCwgWXUtQ2h1biBMaW4g
d3JvdGU6DQo+ID4NCj4gPiBbLi4uXQ0KPiA+DQo+ID4+ID4+IEFwcGxpZWQsIHRoYW5rcyENCj4g
Pj4gPj4NCj4gPj4gPj4gWzEvNF0gZHQtYmluZGluZ3M6IGdwaW86IHJlYWx0ZWs6IEFkZCByZWFs
dGVrLHJ0ZDE2MjUtZ3Bpbw0KPiA+PiA+Pg0KPiA+PiA+PiBodHRwczovL2dpdC5rZXJuZWwub3Jn
L2JyZ2wvYy84ZjMyODA4ZTE1MzBiMjIyOWUwNzY5NWZiMzljNTRmZWU5MTANCj4gPj4gPj4gYmQ0
YSBbMi80XSBncGlvOiBSZXBsYWNlICJkZWZhdWx0IHkiIHdpdGggImRlZmF1bHQgQVJDSF9SRUFM
VEVLIg0KPiA+PiA+PiBpbiBLY29uZmlnDQo+ID4+ID4+DQo+ID4+ID4+IGh0dHBzOi8vZ2l0Lmtl
cm5lbC5vcmcvYnJnbC9jL2I1ZDIzZmNkYjEyOTcyYzUyMmU5NmY5MGFiNDhiZThhMGQ5Nw0KPiA+
PiA+PiAxYjBlIFszLzRdIGdwaW86IHJlYWx0ZWs6IEFkZCBkcml2ZXIgZm9yIFJlYWx0ZWsgREhD
IFJURDE2MjUgU29DDQo+ID4+ID4+DQo+ID4+ID4+IGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvYnJn
bC9jL2E1N2UyN2M0M2IwMzE1ZWU4NmM2ODk2NTEwZDY5YmU1MjU3ZQ0KPiA+PiA+PiAwOTNlDQo+
ID4+ID4NCj4gPj4gPiBUaGFuayB5b3UgZm9yIGFwcGx5aW5nIHRoZSBwYXRjaGVzIQ0KPiA+PiA+
DQo+ID4+ID4gSSdtIGN1cnJlbnRseSB3b3JraW5nIG9uIHY2IG9mIHRoZSBwYXRjaCBzZXJpZXMg
dGhhdCBpbmNvcnBvcmF0ZXMNCj4gPj4gPiBBbmR5J3MgZ3Bpby1yZWdtYXAgcGF0Y2hlcywgYW5k
IGl0IHNob3VsZCBidWlsZCBvbiB0b3Agb2YNCj4gPj4gPiBncGlvL2Zvci1uZXh0LiBIb3dldmVy
LCBJIGhhdmUgYSBjb25mbGljdCB3aXRoIHRoZSBkcml2ZXIgcGF0Y2ggdGhhdCB3YXMNCj4gYWxy
ZWFkeSBhcHBsaWVkLg0KPiA+PiA+DQo+ID4+ID4gQ291bGQgeW91IHBsZWFzZSByZXZlcnQgdGhh
dCBjb21taXQgZnJvbSBncGlvL2Zvci1uZXh0Pw0KPiA+Pg0KPiA+PiBDYW4geW91IGp1c3QgcG9z
dCB0aGUgc2VyaWVzIGFzIGEgZm9sbG93LXVwPyBJIHRyeSB0byBhdm9pZCByZWJhc2VzDQo+ID4+
IHVubGVzcyBhYnNvbHV0ZWx5IG5lY2Vzc2FyeS4NCj4gPg0KPiA+IFdvdWxkIGJlIGp1c3QgbGVh
ZGluZyByZXZlcnRzIGluIHRoZSBzZXJpZXMgYXBwcm9wcmlhdGU/IE90aGVyd2lzZSBpdA0KPiA+
IHdpbGwgZ2l2ZSBhIGxvdCBvZiBhZGRpdGlvbmFsIHdvcmsgZm9yIHBlYW51dHMuDQo+ID4NCj4g
DQo+IFllcywgdGhhdCdzIGFscmlnaHQuIEl0IHdpbGwgbWFrZSB0aGUgcmV2aWV3IGVhc2llci4g
V2UgY2FuIHRoZW4gc3F1YXNoIHRoZQ0KPiByZXZlcnRzIHdpdGggdGhlIG5ldyBwYXRjaGVzIHdo
ZW4gYXBwbHlpbmcuDQo+IA0KDQpVbmRlcnN0b29kLCB0aGFua3MhDQpJJ2xsIGFkZCB0aGUgcmV2
ZXJ0IGFzIHRoZSBmaXJzdCBwYXRjaCBpbiB0aGUgc2VyaWVzLg0KDQpCZXN0IFJlZ2FyZHMsDQpZ
dS1DaHVuDQoNCj4gQmFydA0K
