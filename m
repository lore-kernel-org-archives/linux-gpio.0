Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E82D5318EDA;
	Fri,  3 Jul 2026 08:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783067246; cv=none; b=m6SdwtMmmYiPRWsWZPKjuV0qgawmqy16bVU0Zk+FvxwgM70a79TTe0ZQdoIc3DrWWfiRrmd2ccL6hIx5eBbzrZK0Vng/LVKeqahouuM0TzLPgJsSl7BpqKNkNXPjadwzolPpwM0bGWWwhfyMw3ZLa6G+0fYm+PpmZiAsJVlo8Qo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783067246; c=relaxed/simple;
	bh=tHkSW3aoO+AfImEN3aJtccdWDZbhGz/juQGcD1gsN9E=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=BsJ88o8PLUDY6ljC1dxgznm3/w0BexHKrQMOQugaCK0TYVN6uQ18sdlrtAwYRwnecbyBOvAj7wOIuCsMUYY4malZ6hZINiJlxPxWDgjF9AsgCA4PtzLEA2Xmr4ZXL6YV8/jOaWw1y637pFdxqO9O64fEJDRgOqRcff+duPbO2g4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=por4sV+q; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="por4sV+q"
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6638H5JV02547732, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1783066625; bh=tHkSW3aoO+AfImEN3aJtccdWDZbhGz/juQGcD1gsN9E=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=por4sV+qFN/zM91tIEwpwI6axSMcLuqkClnV8z4AtL3dowJA1ra5pkLO7aJWdIiRG
	 VdgNWVYN8gyXYEp9HLMxFPhY9sOA4TR/Dgm5EjiV5C4YKA3sJGmLJVg4Oy8kLFj7cu
	 24gXxygT15+A5bRrseNd2Ou1ytQ8Ne59th+Lr9XK2wibZAU6MGfn5JtuM1JnBlnsjs
	 d/XA8HFWhUYDGTaKnvPQEZTGwYzndnb5BQPSiFlvqSP3u2QMq72ZKwBnijv+KKWhqL
	 j43CmL9YpGoVE1pBVO1oNazHTN0FtnM0oLugS54gUoOm7isACVidYYsrx1FUx7wDCp
	 j5G/+s7EXV8Ag==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6638H5JV02547732
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 3 Jul 2026 16:17:05 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 3 Jul 2026 16:17:04 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([::1]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::e6fd:5a3f:8946:92c4%10]) with mapi id
 15.02.2562.017; Fri, 3 Jul 2026 16:17:04 +0800
From: =?big5?B?WXUtQ2h1biBMaW4gW6pMr6enZ10=?= <eleanor.lin@realtek.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Mark Brown
	<broonie@kernel.org>, Mathieu Dubois-Briand
	<mathieu.dubois-briand@bootlin.com>, Bartosz Golaszewski <brgl@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"driver-core@lists.linux.dev" <driver-core@lists.linux.dev>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki"
	<rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, Linus Walleij
	<linusw@kernel.org>, Michael Walle <mwalle@kernel.org>, "William Breathitt
 Gray" <wbg@kernel.org>, =?big5?B?Q1lfSHVhbmdbtsDgsq7LXQ==?=
	<cy.huang@realtek.com>, =?big5?B?U3RhbmxleSBDaGFuZ1up96h8vHdd?=
	<stanley_chang@realtek.com>, =?big5?B?SmFtZXMgVGFpIFvAuafTrnBd?=
	<james.tai@realtek.com>, =?big5?B?VFlfQ2hhbmdbsWmkbLZoXQ==?=
	<tychang@realtek.com>
Subject: RE: [PATCH v1 0/4] gpio: regmap: Keep tracking IRQ requests and
 releases
Thread-Topic: [PATCH v1 0/4] gpio: regmap: Keep tracking IRQ requests and
 releases
Thread-Index: AQHdCiQKzeh3cCu86UShMtVfIwgPZ7Zbc8Hw
Date: Fri, 3 Jul 2026 08:17:04 +0000
Message-ID: <dfe56aa625c54f95ab4baf2fff2776ae@realtek.com>
References: <20260702130903.1790633-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20260702130903.1790633-1-andriy.shevchenko@linux.intel.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

SGkgQW5keSwNCg0KVGhhbmtzIGZvciB5b3VyIHBhdGNoZXMhDQoNCj4gRHVyaW5nIHRoZSByZXZp
ZXcgb2YgdGhlIHYzIFsxXSBvZiB0aGUgc2VyaWVzIHRoYXQgYWRkcyBhIGRyaXZlciBmb3IgUmVh
bHRlayBESEMNCj4gUlREMTYyNSBTb0MgR1BJTyB0aGUgZ2FwIGluIHRoZSBHUElPIHJlZ21hcCBp
bXBsZW1lbnRhdGlvbiBoYXMgYmVlbg0KPiBkaXNjb3ZlcmVkLCBpZCBlc3QgdGhlIElSUSBjaGlw
IHRoYXQgaXMgY3JlYXRlZCBieSByZWdtYXAgSVJRIGRvZXNuJ3QgaGF2ZSBJUlENCj4gcmVxdWVz
dCBhbmQgcmVsZWFzZSBjYWxsYmFja3MgYW5kIGhlbmNlIGluIHRlcm1zIG9mIEdQSU8gZG9lcyBu
b3QgdHJhY2sgaWYgYW55DQo+IGxpbmUgaXMgbG9ja2VkIGFzIElSUS4gVGhpcyBtaWdodCBsZWFk
IHRvIHVuZGVzaXJlZCBhbmQgbW9zdCBsaWtlbHkgZmF1bHR5DQo+IGJlaGF2aW91ci4gVGhpcyBz
ZXJpZXMgaXMgdG8gZmlsbCB0aGF0IGdhcC4gQ3VycmVudGx5IGl0IG9ubHkgZml4ZXMgdGhlIG9u
bHkgdXNlciBvZg0KPiB0aGUgYXV0b21hdGljIElSUSBjaGlwIGNyZWF0aW9uIGZhY2lsaXR5IHBy
b3ZpZGVkIGJ5IEdQSU8gcmVnbWFwLCBidXQgYWxzbw0KPiBwcm92aWRlcyB0aGUgZXhwb3J0ZWQg
Y2FsbGJhY2tzIGZvciBvdGhlcnMgdG8gYmUgcG9zc2libGUgdG8gY2FsbCB0aGVtIGZyb20NCj4g
Y3VzdG9taXNlZCB2ZXJzaW9ucyBvZiB0aGUgY2FsbGJhY2tzIGluIHRoZSByZXNwZWN0aXZlIGRy
aXZlcnMuDQo+IA0KPiBNb3N0IG9mIHRoZSBhZmZlY3RlZCBkcml2ZXJzIGlmIEkgYW0gbm90IG1p
c3Rha2VuIGFyZSB0aGUgSW5kdXN0cmlhbCBQQzEwNCBvbmVzLA0KPiBoZW5jZSBJIENjJ2VkIFdp
bGxpYW0gdG8gbG9vayBhdCB0aGlzIGFuZCBwZXJoYXBzIGV2ZW4gdGVzdC4NCj4gDQo+IFl1LUNo
dW4sIGNhbiB5b3UgZ2l2ZSBhIHRyeSB3aXRoIHlvdXIgdjMgYmFzZWQgb24gdGhpcyBzZXJpZXM/
IEkgYmVsaWV2ZSB3ZSBjYW4NCj4gdXNlIHJlZ21hcCBhcHByb2FjaCBhZnRlciBhbGwuDQo+IA0K
DQpJIHRlc3RlZCB0aGVtIG9uIHRoZSBydGQxNjI1IFNvQyBib2FyZCBhbmQgaXQgbG9va3MgZ29v
ZC4gSWYgbm8gb25lIGVsc2UNCmhhcyBhbnkgaXNzdWVzIHdpdGggQW5keSdzIHBhdGNoIHNlcmll
cywgSSdsbCBzZW5kIG91dCB2Niwgd2hpY2ggd2lsbCBiZQ0KYmFzZWQgb24gbXkgdjMgYW5kIHRo
aXMgc2VyaWVzLg0KDQpCZXN0IFJlZ2FyZHMsDQpZdS1DaHVuDQoNCj4gVGhlIG1lcmdlIHN0cmF0
ZWd5IGlzIHRvIGdvIHZpYSBHUElPIHRyZWUgd2l0aCB0aGUgaW1tdXRhYmxlIGJyYW5jaCBvciB0
YWcNCj4gcHJvdmlkZWQgZm9yIHRoZSBmaXJzdCBwYXRjaCB0aGF0IGNhbiBiZSBkb25lIGJ5IHJl
Z21hcCB0cmVlIGZvciBvdGhlcnMgdG8NCj4gY29uc3VtZS4gT2YgY291cnNlLCB0aGVyZSBhcmUg
cG9zc2libGUgb3B0aW9ucywgSSdtIGFsbCBlYXJzIGlmIHlvdSB0aGluayBpdCB3aWxsDQo+IGJl
IGJldHRlciBpbiBhbnkgb3RoZXIgd2F5Lg0KPiANCj4gTGluazoNCj4gaHR0cHM6Ly9sb3JlLmtl
cm5lbC5vcmcvYWxsLzIwMjYwNTEyMDMzMzE3LjE2MDI1MzctMS1lbGVhbm9yLmxpbkByZWFsdGVr
LmNvDQo+IG0vIFsxXQ0KPiANCj4gQW5keSBTaGV2Y2hlbmtvICg0KToNCj4gICByZWdtYXAtaXJx
OiBQcm92aWRlIElSUSByZXNvdXJjZSByZXF1ZXN0IGFuZCByZWxlYXNlIGNhbGxiYWNrcw0KPiAg
IGdwaW86IHJlZ21hcDogUHJvdmlkZSBkZWZhdWx0IElSUSByZXNvdXJjZSByZXF1ZXN0IGFuZCBy
ZWxlYXNlDQo+ICAgICBjYWxsYmFja3MNCj4gICBncGlvOiByZWdtYXA6IEFwcGx5IGRlZmF1bHQg
cmVzb3VyY2UgY2FsbGJhY2tzIGZvciByZWdtYXAgSVJRIGNoaXANCj4gICBncGlvOiByZWdtYXA6
IE9yZGVyIGtlcm5lbC1kb2MgZGVzY3JpcHRpb25zIHdpdGggdGhlIGFjdHVhbCBhcHBlYXJhbmNl
DQo+IA0KPiAgZHJpdmVycy9iYXNlL3JlZ21hcC9yZWdtYXAtaXJxLmMgfCAyMiArKysrKysrKysr
KysrKysrKysrKysrDQo+ICBkcml2ZXJzL2dwaW8vZ3Bpby1tYXg3MzYwLmMgICAgICB8ICA3ICsr
KystLS0NCj4gIGRyaXZlcnMvZ3Bpby9ncGlvLXJlZ21hcC5jICAgICAgIHwgMjUgKysrKysrKysr
KysrKysrKysrKysrKysrKw0KPiAgaW5jbHVkZS9saW51eC9ncGlvL3JlZ21hcC5oICAgICAgfCAy
MSArKysrKysrKysrKystLS0tLS0tLS0NCj4gIGluY2x1ZGUvbGludXgvcmVnbWFwLmggICAgICAg
ICAgIHwgIDIgKysNCj4gIDUgZmlsZXMgY2hhbmdlZCwgNjUgaW5zZXJ0aW9ucygrKSwgMTIgZGVs
ZXRpb25zKC0pDQo+IA0KPiAtLQ0KPiAyLjUwLjENCg0K
