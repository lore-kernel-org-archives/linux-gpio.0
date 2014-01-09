From: Neil Zhang <zhangwm@marvell.com>
Subject: RE: [PATCH] gpio: pxa: fix bug when get gpio value
Date: Thu, 9 Jan 2014 01:32:07 -0800
Message-ID: <175CCF5F49938B4D99B2E3EF7F558EBE540BD53872@SC-VEXCH4.marvell.com>
References: <1389259557-1731-1-git-send-email-zhangwm@marvell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mx0b-0016f401.pphosted.com ([67.231.156.173]:7338 "EHLO
	mx0b-0016f401.pphosted.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1754170AbaAIJcL (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 9 Jan 2014 04:32:11 -0500
In-Reply-To: <1389259557-1731-1-git-send-email-zhangwm@marvell.com>
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Neil Zhang <zhangwm@marvell.com>, "linus.walleij@linaro.org" <linus.walleij@linaro.org>, "gnurou@gmail.com" <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

DQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IE5laWwgWmhhbmcgW21haWx0
bzp6aGFuZ3dtQG1hcnZlbGwuY29tXQ0KPiBTZW50OiAyMDE0xOox1MI5yNUgMTc6MjYNCj4gVG86
IGxpbnVzLndhbGxlaWpAbGluYXJvLm9yZzsgZ251cm91QGdtYWlsLmNvbTsgbGludXgtZ3Bpb0B2
Z2VyLmtlcm5lbC5vcmc7DQo+IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcg0KPiBDYzogTmVp
bCBaaGFuZw0KPiBTdWJqZWN0OiBbUEFUQ0hdIGdwaW86IHB4YTogZml4IGJ1ZyB3aGVuIGdldCBn
cGlvIHZhbHVlDQo+IA0KPiBncGlvX2dldF92YWx1ZSBzaG91bGQgcmV0dXJuIDAgb3IgMS4NCj4g
DQo+IEkgaGF2ZSBjaGVja2VkIG1hY2gtbW1wIC8gbWFjaC1weGEgLyBwbGF0LXB4YSAvIHBsYXQt
b3Jpb24gLyBtYWNoLW9yaW9uNXguDQo+IEl0J3MgT0sgZm9yIGFsbCBvZiB0aGVtIHRvIGNoYW5n
ZSB0aGlzIGZ1bmN0aW9uIHRvIHJldHVybiAwIGFuZCAxLg0KPiANCj4gU2lnbmVkLW9mZi1ieTog
TmVpbCBaaGFuZyA8emhhbmd3bUBtYXJ2ZWxsLmNvbT4NCj4gLS0tDQo+ICBkcml2ZXJzL2dwaW8v
Z3Bpby1weGEuYyB8ICAgIDMgKystDQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCsp
LCAxIGRlbGV0aW9uKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncGlvL2dwaW8tcHhh
LmMgYi9kcml2ZXJzL2dwaW8vZ3Bpby1weGEuYyBpbmRleA0KPiBjYzEzZDFiLi40MmU2ZTY0IDEw
MDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwaW8vZ3Bpby1weGEuYw0KPiArKysgYi9kcml2ZXJzL2dw
aW8vZ3Bpby1weGEuYw0KPiBAQCAtMjYzLDcgKzI2Myw4IEBAIHN0YXRpYyBpbnQgcHhhX2dwaW9f
ZGlyZWN0aW9uX291dHB1dChzdHJ1Y3QgZ3Bpb19jaGlwDQo+ICpjaGlwLA0KPiANCj4gIHN0YXRp
YyBpbnQgcHhhX2dwaW9fZ2V0KHN0cnVjdCBncGlvX2NoaXAgKmNoaXAsIHVuc2lnbmVkIG9mZnNl
dCkgIHsNCj4gLQlyZXR1cm4gcmVhZGxfcmVsYXhlZChncGlvX2NoaXBfYmFzZShjaGlwKSArIEdQ
TFJfT0ZGU0VUKSAmICgxIDw8DQo+IG9mZnNldCk7DQo+ICsJdTMyIGdwbHIgPSByZWFkbF9yZWxh
eGVkKGdwaW9fY2hpcF9iYXNlKGNoaXApICsgR1BMUl9PRkZTRVQpOw0KPiArCXJldHVybiAhIShn
cGxyICYgKDEgPDwgb2Zmc2V0KSk7DQo+ICB9DQo+IA0KPiAgc3RhdGljIHZvaWQgcHhhX2dwaW9f
c2V0KHN0cnVjdCBncGlvX2NoaXAgKmNoaXAsIHVuc2lnbmVkIG9mZnNldCwgaW50IHZhbHVlKQ0K
PiAtLQ0KPiAxLjcuOS41DQoNCkFkZCByaWdodCBMS01MLg0KDQpCZXN0IFJlZ2FyZHMsDQpOZWls
IFpoYW5nDQo=
