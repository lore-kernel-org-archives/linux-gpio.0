Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90A1D390613;
	Mon,  7 Sep 2026 06:14:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788761678; cv=none; b=i9Ph6ZbDJEGiQ4OsKN3iRBAd9+RdTKGTacoXONNM7rfATW6+mkKJSa7Ce9TD+1+UX+uYtVxsS8i0P5DNvSeLlRDx1+9LZBryOoFQ3q/MMbnctmwcgIskWTqlE5P3PuJZo8DmHmapQ2BDsHXuomp7kVK/vKkR3LRxsI/srtW1hqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788761678; c=relaxed/simple;
	bh=1u+6otlLYP9PUizxVuTiyaZgAtOo0g9T7ez9cTA60Y0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=aU6n3oNikdXDQGN7K7T+Q3DWvEKQYVMqqu4LUVwRGMX3/B1TC1jssypCWFSHL6QLZ7JclbDICLuJZJV7PGbfhrm4UGH92k8dsjjHmunc8dNM+kRvxU2pRrXHnhe3XuNTm74muO4WsQ5ZB1Y+dG/jjPBjeXGY8t2VklZWG8822Ps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=PTSp/vYD; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="PTSp/vYD"
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6876DfLiA2563156, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1788761621; bh=1u+6otlLYP9PUizxVuTiyaZgAtOo0g9T7ez9cTA60Y0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=PTSp/vYDbglB0UVTkFZc1ZzYbvHwafcOjaj3QrDDaUw6RKUc81GKmE/vWUHeqUmJH
	 G/NG8u7NjCs8aHvpTL2A7hYrR54+btVw1shNRWPQNfo0P1047gusxYrAP/0W1D+VoX
	 AY0WUJ8/GlqJ49SSK4J5xWpas/6kaVt1Iin92X3dUFcI45PldTxW7faefPYFsPNDld
	 WzO8BQ3DcptYdpTKgQwY7nKa7Mjw0OQW2ONcdUY6Gzk+PsZ0shT6OssP3ZiFZocslt
	 8uclbPTHXEtShHBAoRYpzn1JQMz43wvatIn9M4pCg4M1gufKVleJJFCr9yoqN2EFR5
	 yxAnpaI3FJKyg==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6876DfLiA2563156
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 7 Sep 2026 14:13:41 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 7 Sep 2026 14:13:41 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([::1]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::126f:59ad:658:674d%10]) with mapi id
 15.02.2562.043; Mon, 7 Sep 2026 14:13:41 +0800
From: =?utf-8?B?WXUtQ2h1biBMaW4gW+ael+elkOWQm10=?= <eleanor.lin@realtek.com>
To: hpp.iscas <hppiscas@163.com>, =?utf-8?B?SmFtZXMgVGFpIFvmiLTlv5fls7Bd?=
	<james.tai@realtek.com>
CC: =?utf-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.com>, Linus Walleij
	<linusw@kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
	"linux-realtek-soc@lists.infradead.org"
	<linux-realtek-soc@lists.infradead.org>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, =?utf-8?B?VFlfQ2hhbmdb5by15a2Q6YC4XQ==?=
	<tychang@realtek.com>
Subject: RE: [PATCH] pinctrl: realtek: rtd1619b: Publish the OF module alias
Thread-Topic: [PATCH] pinctrl: realtek: rtd1619b: Publish the OF module alias
Thread-Index: AQHdPTy094f4ciS4BkGSvd3QPNG9kbbCpD4A
Date: Mon, 7 Sep 2026 06:13:41 +0000
Message-ID: <84a7569139af472aaf704c6517b04f69@realtek.com>
References: <20260905134418.67619-1-hppiscas@163.com>
In-Reply-To: <20260905134418.67619-1-hppiscas@163.com>
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

SGksDQoNCj4gVGhlIFJURDE2MTlCIHBpbmN0cmwgZHJpdmVyIGlzIGEgc2VwYXJhdGUgdHJpc3Rh
dGUgb2JqZWN0IHVzaW5nDQo+IA0KPiBydGQxNjE5Yl9waW5jdHJsX29mX21hdGNoLiBUaGUgZ2Vu
ZXJpYyBSZWFsdGVrIHBpbmN0cmwgc3VwcG9ydCBkb2VzIG5vdA0KPiANCj4gcHVibGlzaCBhbiBh
bGlhcyBmb3IgdGhpcyBTb0MgbW9kdWxlLg0KPiANCj4gDQo+IA0KPiBFeHBvcnQgdGhlIGV4aXN0
aW5nIE9GIHRhYmxlIHdoaWxlIHJldGFpbmluZyB0aGUgaW5pdGlhbGl6YXRpb24gb3JkZXIuDQo+
IA0KPiANCj4gDQo+IEZpeGVzOiBjNzkxMGY2YWNhNTYgKCJwaW5jdHJsOiByZWFsdGVrOiBBZGQg
cGluY3RybCBkcml2ZXIgZm9yIFJURDE2MTlCIikNCj4gDQo+IFNpZ25lZC1vZmYtYnk6IGhwcC5p
c2NhcyA8aHBwaXNjYXNAMTYzLmNvbT4NCj4gDQoNClBsZWFzZSB1c2UgeW91ciByZWFsIG5hbWUu
DQoNCj4gLS0tDQo+IA0KPiAgZHJpdmVycy9waW5jdHJsL3JlYWx0ZWsvcGluY3RybC1ydGQxNjE5
Yi5jIHwgMSArDQo+IA0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspDQo+IA0KPiAN
Cj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3BpbmN0cmwvcmVhbHRlay9waW5jdHJsLXJ0ZDE2
MTliLmMNCj4gYi9kcml2ZXJzL3BpbmN0cmwvcmVhbHRlay9waW5jdHJsLXJ0ZDE2MTliLmMNCj4g
DQo+IGluZGV4IGIwN2U1MGQuLmUwM2UxZmIgMTAwNjQ0DQo+IA0KPiAtLS0gYS9kcml2ZXJzL3Bp
bmN0cmwvcmVhbHRlay9waW5jdHJsLXJ0ZDE2MTliLmMNCj4gDQo+ICsrKyBiL2RyaXZlcnMvcGlu
Y3RybC9yZWFsdGVrL3BpbmN0cmwtcnRkMTYxOWIuYw0KPiANCj4gQEAgLTE1NzUsNiArMTU3NSw3
IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkDQo+IHJ0ZDE2MTliX3BpbmN0cmxf
b2ZfbWF0Y2hbXSA9IHsNCj4gDQo+ICAgICAgICAgeyAuY29tcGF0aWJsZSA9ICJyZWFsdGVrLHJ0
ZDE2MTliLXBpbmN0cmwiLCB9LA0KPiANCj4gICAgICAgICB7fSwNCj4gDQo+ICB9Ow0KPiANCj4g
K01PRFVMRV9ERVZJQ0VfVEFCTEUob2YsIHJ0ZDE2MTliX3BpbmN0cmxfb2ZfbWF0Y2gpOw0KPiAN
Cj4gDQo+IA0KPiAgc3RhdGljIHN0cnVjdCBwbGF0Zm9ybV9kcml2ZXIgcnRkMTYxOWJfcGluY3Ry
bF9kcml2ZXIgPSB7DQo+IA0KPiAgICAgICAgIC5kcml2ZXIgPSB7DQo+IA0KDQpUaGUgY29kZSBs
b29rcyBnb29kIHRvIG1lLCBidXQgJ2dpdCBhbScgZmFpbGVkIHRvIGFwcGx5IHRoZSBtYm94LiAN
Ckkgbm90aWNlZCA9MEQgaW4geW91ciBwYXRjaCwgd2hpY2ggbWlnaHQgYmUgdGhlIHJlYXNvbiBp
dCBmYWlsZWQuDQoNCkJlc3QgUmVnYXJkcywNCll1LUNodW4NCg==
