From: "=?utf-8?B?6ZmI5Y2O5omN?=" <chenhc@lemote.com>
Subject: Re: [PATCH 1/3] MIPS: Cleanup Loongson-2F's gpio driver
Date: Fri, 27 Mar 2015 18:48:41 +0800
Message-ID: <tencent_50A826023FE57AFD14CB8698@qq.com>
References: <1427337288-8411-1-git-send-email-chenhc@lemote.com>
	<CACRpkdZRr4yLxQy0rps7cqyei519nhL4PXAqnG=zGxLaNK=Ofg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from smtpbg64.qq.com ([103.7.28.238]:35294 "EHLO smtpbg64.qq.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751715AbbC0K4D (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Fri, 27 Mar 2015 06:56:03 -0400
In-Reply-To: <CACRpkdZRr4yLxQy0rps7cqyei519nhL4PXAqnG=zGxLaNK=Ofg@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: =?utf-8?B?TGludXMgV2FsbGVpag==?= <linus.walleij@linaro.org>
Cc: =?utf-8?B?QWxleGFuZHJlIENvdXJib3Q=?= <gnurou@gmail.com>, =?utf-8?B?bGludXgtZ3Bpb0B2Z2VyLmtlcm5lbC5vcmc=?= <linux-gpio@vger.kernel.org>, =?utf-8?B?RnV4aW4gWmhhbmc=?= <zhangfx@lemote.com>, =?utf-8?B?d3V6aGFuZ2ppbg==?= <wuzhangjin@gmail.com>

SGksIExpbnVzLA0KDQpCb3RoIFJhbGYgYW5kIG1lIHRoaW5rIGl0IGlzIGJldHRlciB0byBt
ZXJnZWQgaW4gR1BJTyB0cmVlLg0KDQpIdWFjYWkNCiANCiANCi0tLS0tLS0tLS0tLS0tLS0t
LSBPcmlnaW5hbCAtLS0tLS0tLS0tLS0tLS0tLS0NCkZyb206ICAiTGludXMgV2FsbGVpaiI8
bGludXMud2FsbGVpakBsaW5hcm8ub3JnPjsNCkRhdGU6ICBGcmksIE1hciAyNywgMjAxNSAw
NjoyOSBQTQ0KVG86ICAiSHVhY2FpIENoZW4iPGNoZW5oY0BsZW1vdGUuY29tPjsNCkNjOiAg
IkFsZXhhbmRyZSBDb3VyYm90IjxnbnVyb3VAZ21haWwuY29tPjsgImxpbnV4LWdwaW9Admdl
ci5rZXJuZWwub3JnIjxsaW51eC1ncGlvQHZnZXIua2VybmVsLm9yZz47ICJGdXhpbiBaaGFu
ZyI8emhhbmdmeEBsZW1vdGUuY29tPjsgInd1emhhbmdqaW4iPHd1emhhbmdqaW5AZ21haWwu
Y29tPjsNClN1YmplY3Q6ICBSZTogW1BBVENIIDEvM10gTUlQUzogQ2xlYW51cCBMb29uZ3Nv
bi0yRidzIGdwaW8gZHJpdmVyDQogDQpPbiBUaHUsIE1hciAyNiwgMjAxNSBhdCAzOjM0IEFN
LCBIdWFjYWkgQ2hlbiA8Y2hlbmhjQGxlbW90ZS5jb20+IHdyb3RlOg0KDQo+IFRoaXMgY2xl
YW51cCBpcyBwcmVwYXJlIHRvIG1vdmUgdGhlIGRyaXZlciB0byBkcml2ZXJzL2dwaW8uIEN1
c3RvbQ0KPiBkZWZpbml0aW9ucyBvZiBncGlvX2dldF92YWx1ZSgpL2dwaW9fc2V0X3ZhbHVl
KCkgYXJlIGRyb3BwZWQuDQo+DQo+IEFja2VkLWJ5OiBSYWxmIEJhZWNobGUgPHJhbGZAbGlu
dXgtbWlwcy5vcmc+DQo+IFNpZ25lZC1vZmYtYnk6IEh1YWNhaSBDaGVuIDxjaGVuaGNAbGVt
b3RlLmNvbT4NCg0KTG9va3MgbmVhdCwgYW5kIEkgZG8gd2FudCB0byBjb2xsZWN0IEdQSU8g
ZHJpdmVycyBpbnRvIGRyaXZlcnMvZ3BpbyBpZg0KcG9zc2libGUuDQoNCkNhbiBJIHRha2Ug
dGhpcyBwYXRjaCBpbiB0aGUgR1BJTyB0cmVlIG9yIGRvIHlvdSB3YW50IGl0IGluDQp0aHJv
dWdoIHRoZSBNSVBTIHRyZWU/DQoNCkluIHRoZSBsYXR0ZXIgY2FzZSBBY2tlZC1ieTogTGlu
dXMgV2FsbGVpaiA8bGludXMud2FsbGVpakBsaW5hcm8ub3JnPg0KDQpZb3VycywNCkxpbnVz
IFdhbGxlaWo=

