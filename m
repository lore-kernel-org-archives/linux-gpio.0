Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4C0F23EAAD;
	Mon, 28 Sep 2026 15:01:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790607687; cv=none; b=WAz5k/Tin1f8oMytl2QVXcv3wuZwQUqcXtv8rvjDq2ajFZ2RHEfErjMGBcPxlda+iyXfezbHLG7r4tb1p6rM4ODU8l8AezUupuiwJ2CoXQ/0KdgBPmKV87DrrH1U614rKpT/CTqVYxvSobI56nGPw6UjmdKyo3Omp3FZzu+Jk+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790607687; c=relaxed/simple;
	bh=VmqgzTZXEL2abXYE2ZwSbXtEHIgDV5rMnt4AXizdjxQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=qWgnAPk+1ukiLmO1uDsZHMoTogtE1RDqfJuAUkqs2AGbKrD9ByTcbmgF5WbJjlSrY56pEjDSC8zQF3wLV3mCokmbXfg+NEmIUAOfjlPFoFgUSQPahdnezLuQaJNltBUcrR2Ip6WBTHTSGXcArTLJ0cA8a7k1bbmosc+9K6LPzlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=a6o5sbIH; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="a6o5sbIH"
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 68SF0TgwC500472, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1790607629; bh=VmqgzTZXEL2abXYE2ZwSbXtEHIgDV5rMnt4AXizdjxQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=a6o5sbIH2x2yw8YBJmbd7YZJvkpsImIgnemZspapUG3IzJbVciACNPU6eKQ/nwZ0X
	 5eeMet+zkKkl4UkmjjA1auOWgq74LROKKRvaw2guX9+JmflmqMFOZC50VkH9NZ+Pnf
	 ob7GHs1zBKH/Q9nWCz8NnkUXaQxspEO5ICoyhc+skWfgftgu5jro2ZMv/a8syBQ/o8
	 8pztzpQjZH4vhOwREPuurcRDT7Mo1uHlI6rYaErtPg9dSq3O9ZWw33hfJESfDyJolN
	 IiKjg7JM4XLfy2s+3yI1Z3j7+tyabA/jDblLG1CJBNTMJ+kMhicyWm+XVJ6mXXwGpW
	 JZ7+unULky3zA==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 68SF0TgwC500472
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 28 Sep 2026 23:00:29 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 28 Sep 2026 23:00:29 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([::1]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::b3cc:c263:b82d:e87c%10]) with mapi id
 15.02.2562.049; Mon, 28 Sep 2026 23:00:29 +0800
From: =?big5?B?WXUtQ2h1biBMaW4gW6pMr6enZ10=?= <eleanor.lin@realtek.com>
To: Pengpeng Hou <hppiscas@163.com>, =?big5?B?SmFtZXMgVGFpIFvAuafTrnBd?=
	<james.tai@realtek.com>
CC: "afaerber@suse.com" <afaerber@suse.com>, "linusw@kernel.org"
	<linusw@kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
	"linux-realtek-soc@lists.infradead.org"
	<linux-realtek-soc@lists.infradead.org>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, =?big5?B?VFlfQ2hhbmdbsWmkbLZoXQ==?=
	<tychang@realtek.com>
Subject: RE: [PATCH v2] pinctrl: realtek: rtd1619b: publish the OF module
 alias
Thread-Topic: [PATCH v2] pinctrl: realtek: rtd1619b: publish the OF module
 alias
Thread-Index: AQHdSLEcJX+4NvxkzUaHWGar/UKH9rbkIpVw
Date: Mon, 28 Sep 2026 15:00:29 +0000
Message-ID: <f25e75dabbf64d3a9078ea584aee7986@realtek.com>
References: <20260920033520.12924-1-hppiscas@163.com>
In-Reply-To: <20260920033520.12924-1-hppiscas@163.com>
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

PiBQSU5DVFJMX1JURDE2MTlCIGlzIHRyaXN0YXRlLCBhbmQgdGhlIGRyaXZlciB1c2VzIHRoZSBy
ZWFsdGVrLHJ0ZDE2MTliLXBpbmN0cmwNCj4gY29tcGF0aWJsZSB0byBtYXRjaCBpdHMgZGV2aWNl
cy4gSG93ZXZlciwgdGhlIE9GIHRhYmxlIGlzIG5vdCBleHBvcnRlZCwgc28gYQ0KPiBtb2R1bGFy
IGJ1aWxkIGRvZXMgbm90IGFkdmVydGlzZSB0aGlzIGFsaWFzIGZvciBhdXRvbWF0aWMgbW9kdWxl
IGxvYWRpbmcuDQo+IA0KPiBBZGQgdGhlIE9GIGV4cG9ydCB3aXRob3V0IGNoYW5naW5nIHByb2Jl
IG9yIHJlZ2lzdHJhdGlvbiBvcmRlcmluZy4NCj4gDQo+IFRoZSBpc3N1ZSB3YXMgZm91bmQgYnkg
b3VyIHN0YXRpYy1hbmFseXNpcyB0b29sLg0KPiANCj4gRml4ZXM6IGM3OTEwZjZhY2E1NiAoInBp
bmN0cmw6IHJlYWx0ZWs6IEFkZCBwaW5jdHJsIGRyaXZlciBmb3IgUlREMTYxOUIiKQ0KPiBBc3Np
c3RlZC1ieTogZ3B0IDUNCj4gU2lnbmVkLW9mZi1ieTogUGVuZ3BlbmcgSG91IDxocHBpc2Nhc0Ax
NjMuY29tPg0KDQpBY2tlZC1ieTogWXUtQ2h1biBMaW4gPGVsZWFub3IubGluQHJlYWx0ZWsuY29t
Pg0KDQo+IC0tLQ0KPiBDaGFuZ2VzIHNpbmNlIHYxOg0KPiBodHRwczovL2xvcmUua2VybmVsLm9y
Zy9hbGwvMjAyNjA5MDUxMzQ0MTguNjc2MTktMS1ocHBpc2Nhc0AxNjMuY29tLw0KPiBVc2UgdGhl
IGZ1bGwgYXV0aG9yIG5hbWUgYW5kIHJlZ2VuZXJhdGUgdGhlIHBsYWluLXRleHQgaW5saW5lIGRp
ZmYgd2l0aG91dA0KPiBlbWJlZGRlZCBjYXJyaWFnZSByZXR1cm5zLg0KPiANCj4gIGRyaXZlcnMv
cGluY3RybC9yZWFsdGVrL3BpbmN0cmwtcnRkMTYxOWIuYyB8ICAgIDEgKw0KPiAgMSBmaWxlIGNo
YW5nZWQsIDEgaW5zZXJ0aW9uKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9waW5jdHJs
L3JlYWx0ZWsvcGluY3RybC1ydGQxNjE5Yi5jDQo+IGIvZHJpdmVycy9waW5jdHJsL3JlYWx0ZWsv
cGluY3RybC1ydGQxNjE5Yi5jDQo+IGluZGV4IGIwN2U1MGQ2MzU2ZC4uZTAzZTFmYjA5ODk5IDEw
MDY0NA0KPiAtLS0gYS9kcml2ZXJzL3BpbmN0cmwvcmVhbHRlay9waW5jdHJsLXJ0ZDE2MTliLmMN
Cj4gKysrIGIvZHJpdmVycy9waW5jdHJsL3JlYWx0ZWsvcGluY3RybC1ydGQxNjE5Yi5jDQo+IEBA
IC0xNTc1LDYgKzE1NzUsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZA0KPiBy
dGQxNjE5Yl9waW5jdHJsX29mX21hdGNoW10gPSB7DQo+ICAgICAgICAgeyAuY29tcGF0aWJsZSA9
ICJyZWFsdGVrLHJ0ZDE2MTliLXBpbmN0cmwiLCB9LA0KPiAgICAgICAgIHt9LA0KPiAgfTsNCj4g
K01PRFVMRV9ERVZJQ0VfVEFCTEUob2YsIHJ0ZDE2MTliX3BpbmN0cmxfb2ZfbWF0Y2gpOw0KPiAN
Cj4gIHN0YXRpYyBzdHJ1Y3QgcGxhdGZvcm1fZHJpdmVyIHJ0ZDE2MTliX3BpbmN0cmxfZHJpdmVy
ID0gew0KPiAgICAgICAgIC5kcml2ZXIgPSB7DQo+IA0KPiBiYXNlLWNvbW1pdDogNTE4ZTViNzk0
YzA2YzBmMGViNDBkZjNlMjAyMjc0YTY2MjAyYzEzNw0KPiAtLQ0KPiAyLjUwLjEgKEFwcGxlIEdp
dC0xNTUpDQoNCg==
