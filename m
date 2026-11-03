Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793709646;
	b=wYEflbGec47hfz4qTLtp/ayrSjqpqjsyMJwYniXyYSTcOqKtdaENEwvv/m5kbfhTHF0W
	 EHpgvqGKWapYcDyb//TeWGB2pdoXbHeh4i9R2ja1tDBN/TyQZL3gPmOZ2rHmy1Y5YRKLV
	 15A31xE/zE87fGn5vqtj7iSdFnA7vfCQeCzfDnxOvsvERZMM/gpg9mAOdnU8zXmB5/cxj
	 KuQ9qBWSsaHGFlZgkXfaJlqltmSKcXG1JimqJ7Mpj2AXb3I+2swgMAB9LJTD1f8UNivOc
	 PMhtGCfvAws6LhVRKzEzDH4q9nztl3jF/tYHLNoql3FSSLTLD9oa6m8FuALo4MYXm8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793709646;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:Received:From:To:CC:Subject:Thread-Topic:Thread-Index:Date:
	 Message-ID:References:In-Reply-To:Accept-Language:Content-Language:
	 x-originating-ip:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=C66MeL5Q72nkzcx+0R2uKtwGLPP0+lTOxNnY0g90WzQ=;
	b=LQdGfPl2PZTn7/l/TZrwlm+FzoF50xgxbhnlrYezaEnu0ie5Yt2HHEsKMEXZbMzzNgLD
	 9o805AL992xalrU/oYGox+zWcNEqsZu5pLrXrUYIu4pP+ipjMW8miAzVhuXQtW8HfsqH0
	 AIj0UQNqiTPpBH5VQOSLGZs5gB62ZXCrYqNJuk/HSAGn8zRxoE1QmtYfm2kzD0dPZ4Lbh
	 K+FjkF7O7tEQwpx2FwzVd87xUK1cTupHptlDKtv/4lNi7gF1qKB3J4sbv/tEDcVbL2QrF
	 owZIjBtC9ImEWe3zYbQdLmMIklgQglr2vpnG6VjimxnPlHSKOhyzIn67toK101MIN+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=OlkHrWYX;
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5C41606A324;
	Tue,  3 Nov 2026 12:40:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A5C41606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=OlkHrWYX
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6A3Ce2q053039991, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1793709602; bh=C66MeL5Q72nkzcx+0R2uKtwGLPP0+lTOxNnY0g90WzQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=OlkHrWYXoNUxtvEqclrNdjw3nDnH5u1ajBuadRUSsGWCrZ0czt+C+bpTzGY41MV2A
	 ndBY4jdcNBb/ADzjH85QmCk3LJCOKk/ndJsiD/ki10jNfdRAyHCewZWyqKn6HHD7tj
	 31HAP4lUBlROFwwEPPamqQjRls+i5/HOc0DLgEzZ/R3/doHJXozzo813ysRm0CdNYY
	 +movWpN9VliMeZr1D5S+VpQ+VfFVURd6wVct/FLEdv2Xf8pIMoL7rhtLwEAgv2hL9g
	 wpd28dNsTAuR3YZg34AoWTF9s85PDSsgYbBiouyRYRgf2ytTcmIKj9if2uzpJShKfF
	 HPBrh0KGkewsQ==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6A3Ce2q053039991
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 3 Nov 2026 20:40:02 +0800
Received: from RTKEXHMBS01.realtek.com.tw (172.21.6.40) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 3 Nov 2026 20:40:03 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS01.realtek.com.tw (172.21.6.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 3 Nov 2026 20:40:02 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef%10]) with mapi id
 15.02.2562.056; Tue, 3 Nov 2026 20:40:02 +0800
From: =?utf-8?B?WXUtQ2h1biBMaW4gW+ael+elkOWQm10=?= <eleanor.lin@realtek.com>
To: "Baek Kyu, Kim" <pocj8ur4in@gmail.com>, Linus Walleij <linusw@kernel.org>
CC: =?utf-8?B?SmFtZXMgVGFpIFvmiLTlv5fls7Bd?= <james.tai@realtek.com>,
	=?utf-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
	"linux-realtek-soc@lists.infradead.org"
	<linux-realtek-soc@lists.infradead.org>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] pinctrl: realtek: Write the encoded slew rate value
Thread-Topic: [PATCH] pinctrl: realtek: Write the encoded slew rate value
Thread-Index: AQHdaRBfL8CcACdIrkWn/iKOgGQaurccSaPA
Date: Tue, 3 Nov 2026 12:40:02 +0000
Message-ID: <727f8462393544b1bb2a816069f16b4e@realtek.com>
References: <20261031081804.218566-1-pocj8ur4in@gmail.com>
In-Reply-To: <20261031081804.218566-1-pocj8ur4in@gmail.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

PiBydGRfcGNvbmZfcGFyc2VfY29uZigpIG1hcHMgc2xldy1yYXRlIGFyZ3VtZW50cyAxLCAxMCwg
MjAgYW5kIDMwIHRvIHRoZQ0KPiB0d28tYml0IGZpZWxkIHZhbHVlcyAwLCAxLCAyIGFuZCAzLiBI
b3dldmVyLCBpdCBzaGlmdHMgdGhlIG9yaWdpbmFsIGFyZ3VtZW50IGludG8NCj4gdGhlIHJlZ2lz
dGVyIHZhbHVlIGluc3RlYWQgb2YgdXNpbmcgdGhlIGNvbXB1dGVkIGVuY29kaW5nLg0KPiBBZnRl
ciBtYXNraW5nLCB0aGVzZSBhcmd1bWVudHMgd3JpdGUgMSwgMiwgMCBhbmQgMiByZXNwZWN0aXZl
bHkuIEluIHBhcnRpY3VsYXIsDQo+IHRoZSBkaXN0aW5jdCAxMCBhbmQgMzAgc2V0dGluZ3Mgd3Jp
dGUgdGhlIHNhbWUgZmllbGQgdmFsdWUuDQo+IA0KPiBVc2Ugc2V0X3ZhbCB3aGVuIGNvbnN0cnVj
dGluZyB0aGUgcmVnaXN0ZXIgdmFsdWUgc28gdGhhdCBib3RoIGluZGl2aWR1YWwgcGluDQo+IGFu
ZCBncm91cCBjb25maWd1cmF0aW9uIGFwcGx5IHRoZSBleGlzdGluZyBjb252ZXJzaW9uLiBMZWF2
ZSBhcmd1bWVudA0KPiB2YWxpZGF0aW9uLCBmaWVsZCBvZmZzZXRzLCBtYXNrcyBhbmQgcmVnbWFw
IGVycm9yIGhhbmRsaW5nIHVuY2hhbmdlZC4NCj4gDQo+IEZpeGVzOiBkY2M5MzM0NDM1YjAgKCJw
aW5jdHJsOiByZWFsdGVrOiBhZGQgc3VwcG9ydCBmb3Igc2xldyByYXRlLCBpbnB1dCB2b2x0YWdl
DQo+IGFuZCBoaWdoIFZJTCIpDQo+IFNpZ25lZC1vZmYtYnk6IEJhZWsgS3l1LCBLaW0gPHBvY2o4
dXI0aW5AZ21haWwuY29tPg0KDQpSZXZpZXdlZC1ieTogWXUtQ2h1biBMaW4gPGVsZWFub3IubGlu
QHJlYWx0ZWsuY29tPg0KVGVzdGVkLWJ5OiBZdS1DaHVuIExpbiA8ZWxlYW5vci5saW5AcmVhbHRl
ay5jb20+DQoNClRoYW5rcyENCll1LUNodW4NCg0KPiAtLS0NCj4gQW4gYXJtNjQgUUVNVSBrZXJu
ZWwgZXhlcmNpc2VkIHRoZSBSVEQxNjI1IE1BSU4yIHBpbiBhbmQgZ3JvdXANCj4gc3RhdGUtc2Vs
ZWN0aW9uIHBhdGhzIHVzaW5nIHRoZSByZWFsIHBpbmN0cmwgY2FsbGJhY2tzIGFuZCBhIHN5bnRo
ZXRpYyByZWdtYXANCj4gYmFja2VuZC4gQSBzbGV3LXJhdGUgcmVxdWVzdCBvZiAxMCB3cm90ZSBm
aWVsZCB2YWx1ZSAyIGJlZm9yZSB0aGUgY2hhbmdlIGFuZCAxDQo+IGFmdGVyIGl0LCB3aGlsZSBh
ZGphY2VudCBiaXRzIHdlcmUgcHJlc2VydmVkLiBObyBib2FyZCBkZXZpY2UgdHJlZSwgcGh5c2lj
YWwNCj4gTU1JTyBvciBzaWduYWwgdGltaW5nIHdhcyB0ZXN0ZWQuDQo+IA0KPiAgZHJpdmVycy9w
aW5jdHJsL3JlYWx0ZWsvcGluY3RybC1ydGQuYyB8IDIgKy0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAx
IGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
cGluY3RybC9yZWFsdGVrL3BpbmN0cmwtcnRkLmMNCj4gYi9kcml2ZXJzL3BpbmN0cmwvcmVhbHRl
ay9waW5jdHJsLXJ0ZC5jDQo+IGluZGV4IDYwMjIyMzM5NzI2YjQuLjY1NmMyODFjNTU3YWMgMTAw
NjQ0DQo+IC0tLSBhL2RyaXZlcnMvcGluY3RybC9yZWFsdGVrL3BpbmN0cmwtcnRkLmMNCj4gKysr
IGIvZHJpdmVycy9waW5jdHJsL3JlYWx0ZWsvcGluY3RybC1ydGQuYw0KPiBAQCAtNDM4LDcgKzQz
OCw3IEBAIHN0YXRpYyBpbnQgcnRkX3Bjb25mX3BhcnNlX2NvbmYoc3RydWN0IHJ0ZF9waW5jdHJs
DQo+ICpkYXRhLA0KPiAgICAgICAgICAgICAgICAgc3Jfb2ZmID0gY29uZmlnX2Rlc2MtPmJhc2Vf
Yml0ICsNCj4gY29uZmlnX2Rlc2MtPnNsZXdfcmF0ZV9vZmZzZXQ7DQo+ICAgICAgICAgICAgICAg
ICByZWdfb2ZmID0gY29uZmlnX2Rlc2MtPnJlZ19vZmZzZXQ7DQo+ICAgICAgICAgICAgICAgICBt
YXNrID0gMHgzIDw8IHNyX29mZjsNCj4gLSAgICAgICAgICAgICAgIHZhbCA9IGFyZyA8PCBzcl9v
ZmY7DQo+ICsgICAgICAgICAgICAgICB2YWwgPSBzZXRfdmFsIDw8IHNyX29mZjsNCj4gICAgICAg
ICAgICAgICAgIGJyZWFrOw0KPiANCj4gICAgICAgICBjYXNlIFBJTl9DT05GSUdfSU5QVVRfVk9M
VEFHRV9VVjoNCj4gLS0NCj4gMi41NS4wDQoNCg==
