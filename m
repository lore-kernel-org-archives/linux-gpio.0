Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5F233B42D4;
	Tue,  7 Jul 2026 06:56:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783407387; cv=none; b=DlIjq0UgaM8EbspLangIlsZkymIJamcnxnETwmvR/zBenXWGt4BCZUVq3LKT6NWpFUjQOiNt6TaqODhMpVCaJjTBBgAlpxI21Rw2K9ROIHRDA0x5yDjEc6t3czN/zixQ1T72l07L4argMOChgY/yL2yzZq/XDI49jDXJ2H+DKcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783407387; c=relaxed/simple;
	bh=mt6rUjgJc+IuOzhtFCcGRB1t052B3wNDIX5do0o14+8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=NfeCACXKz63MdiJPj08/gDvcpKr8SR9XCEUd84/nrCepv5eapSwWpTsbwUoW/+QncCnr0TIFqZukyWlnSX8YkSlok4M31GXoXpsh3EyT9K4jPkQ4f4qB7ds/BEpIBDhaB+VYuJg9cWfXpMFHWG9RT052l5qHk+XQkfhH5TwCBlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=BT1muqJf; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="BT1muqJf"
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6676tP2w9996839, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1783407325; bh=mt6rUjgJc+IuOzhtFCcGRB1t052B3wNDIX5do0o14+8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=BT1muqJfV9uvba4UeuBvFhB489eDtIdc082idO4/M8yYIYlG05iWs0nKwyNt4ETiq
	 oDY1NMvGa9VkFabtoEAsWKXnNhuG7AxF7aLL0ol/5JvrC3iDvK62XJ1l9Km5GvY1RV
	 gnYzNbdM/Bn72XCVI643rwoFWtbzTsUH0V8NeRWC0DhbcWd46Yj/mqTqe76z4uFacu
	 u/6I+RVYsp1qNn4817dJOhZY3cn8bs+3ujhc8QwZIOEx7Tvgm/8DGkd09DBipbvxzB
	 GIUdCP3VQDNcKPAr6T/Bp3efE0IxJrEdw9y1Re00yyLcy1RQ04V4yCz1jzdA7tt4tY
	 /gOU2olcAc4MA==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6676tP2w9996839
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 7 Jul 2026 14:55:25 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 7 Jul 2026 14:55:26 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([::1]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::e6fd:5a3f:8946:92c4%10]) with mapi id
 15.02.2562.017; Tue, 7 Jul 2026 14:55:26 +0800
From: =?utf-8?B?WXUtQ2h1biBMaW4gW+ael+elkOWQm10=?= <eleanor.lin@realtek.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	"linusw@kernel.org" <linusw@kernel.org>, "brgl@kernel.org" <brgl@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"afaerber@suse.com" <afaerber@suse.com>, "mwalle@kernel.org"
	<mwalle@kernel.org>, "andriy.shevchenko@intel.com"
	<andriy.shevchenko@intel.com>, =?utf-8?B?VFlfQ2hhbmdb5by15a2Q6YC4XQ==?=
	<tychang@realtek.com>
CC: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
	"linux-realtek-soc@lists.infradead.org"
	<linux-realtek-soc@lists.infradead.org>,
	=?utf-8?B?Q1lfSHVhbmdb6buD6Ymm5pmPXQ==?= <cy.huang@realtek.com>,
	=?utf-8?B?U3RhbmxleSBDaGFuZ1vmmIzogrLlvrdd?= <stanley_chang@realtek.com>,
	=?utf-8?B?SmFtZXMgVGFpIFvmiLTlv5fls7Bd?= <james.tai@realtek.com>
Subject: RE: (subset) [PATCH v4 0/4] gpio: realtek: Add support for Realtek
 DHC RTD1625
Thread-Topic: (subset) [PATCH v4 0/4] gpio: realtek: Add support for Realtek
 DHC RTD1625
Thread-Index: AQHdAijOhwVVCHLFCkaSAZ80GLo1NbZP+P+AgBG4dLA=
Date: Tue, 7 Jul 2026 06:55:26 +0000
Message-ID: <a00c475a6ce0469682305c4b4269b181@realtek.com>
References: <20260622092335.1166876-1-eleanor.lin@realtek.com>
 <178246069898.6685.11577448681947659397.b4-ty@oss.qualcomm.com>
In-Reply-To: <178246069898.6685.11577448681947659397.b4-ty@oss.qualcomm.com>
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

SGkgQmFydG9zeiwNCg0KPiBPbiBNb24sIDIyIEp1biAyMDI2IDE3OjIzOjMxICswODAwLCBZdS1D
aHVuIExpbiB3cm90ZToNCj4gPiBUaGlzIHNlcmllcyBhZGRzIEdQSU8gc3VwcG9ydCBmb3IgdGhl
IFJlYWx0ZWsgREhDIFJURDE2MjUgU29DLg0KPiA+DQo+ID4gVW5saWtlIHRoZSBleGlzdGluZyBk
cml2ZXIgKGdwaW8tcnRkLmMpIHdoaWNoIHVzZXMgc2hhcmVkIGJhbmsNCj4gPiByZWdpc3RlcnMs
IHRoZSBSVEQxNjI1IGZlYXR1cmVzIGEgcGVyLXBpbiByZWdpc3RlciBhcmNoaXRlY3R1cmUgd2hl
cmUNCj4gPiBlYWNoIEdQSU8gbGluZSBpcyBtYW5hZ2VkIGJ5IGl0cyBvd24gZGVkaWNhdGVkIDMy
LWJpdCBjb250cm9sDQo+ID4gcmVnaXN0ZXIuIFRoaXMgZGlzdGluY3QgaGFyZHdhcmUgZGVzaWdu
IHJlcXVpcmVzIGEgbmV3LCBzZXBhcmF0ZSBkcml2ZXIuDQo+ID4NCj4gPiBbLi4uXQ0KPiANCj4g
QXBwbGllZCwgdGhhbmtzIQ0KPiANCj4gWzEvNF0gZHQtYmluZGluZ3M6IGdwaW86IHJlYWx0ZWs6
IEFkZCByZWFsdGVrLHJ0ZDE2MjUtZ3Bpbw0KPiANCj4gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9i
cmdsL2MvOGYzMjgwOGUxNTMwYjIyMjllMDc2OTVmYjM5YzU0ZmVlOTEwYmQ0YQ0KPiBbMi80XSBn
cGlvOiBSZXBsYWNlICJkZWZhdWx0IHkiIHdpdGggImRlZmF1bHQgQVJDSF9SRUFMVEVLIiBpbiBL
Y29uZmlnDQo+IA0KPiBodHRwczovL2dpdC5rZXJuZWwub3JnL2JyZ2wvYy9iNWQyM2ZjZGIxMjk3
MmM1MjJlOTZmOTBhYjQ4YmU4YTBkOTcxYjBlDQo+IFszLzRdIGdwaW86IHJlYWx0ZWs6IEFkZCBk
cml2ZXIgZm9yIFJlYWx0ZWsgREhDIFJURDE2MjUgU29DDQo+IA0KPiBodHRwczovL2dpdC5rZXJu
ZWwub3JnL2JyZ2wvYy9hNTdlMjdjNDNiMDMxNWVlODZjNjg5NjUxMGQ2OWJlNTI1N2UwOTNlDQo+
IA0KDQpUaGFuayB5b3UgZm9yIGFwcGx5aW5nIHRoZSBwYXRjaGVzIQ0KDQpJJ20gY3VycmVudGx5
IHdvcmtpbmcgb24gdjYgb2YgdGhlIHBhdGNoIHNlcmllcyB0aGF0IGluY29ycG9yYXRlcyBBbmR5
J3MNCmdwaW8tcmVnbWFwIHBhdGNoZXMsIGFuZCBpdCBzaG91bGQgYnVpbGQgb24gdG9wIG9mIGdw
aW8vZm9yLW5leHQuIEhvd2V2ZXIsDQpJIGhhdmUgYSBjb25mbGljdCB3aXRoIHRoZSBkcml2ZXIg
cGF0Y2ggdGhhdCB3YXMgYWxyZWFkeSBhcHBsaWVkLg0KDQpDb3VsZCB5b3UgcGxlYXNlIHJldmVy
dCB0aGF0IGNvbW1pdCBmcm9tIGdwaW8vZm9yLW5leHQ/DQoNCkJlc3QgUmVnYXJkcywNCll1LUNo
dW4NCg0KPiBCZXN0IHJlZ2FyZHMsDQo+IC0tDQo+IEJhcnRvc3ogR29sYXN6ZXdza2kgPGJhcnRv
c3ouZ29sYXN6ZXdza2lAb3NzLnF1YWxjb21tLmNvbT4NCg==
