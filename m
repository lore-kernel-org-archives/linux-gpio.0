From: Neil Zhang <zhangwm@marvell.com>
Subject: RE: [PATCH 2/2] gpio: pxa: Make of_device_id array const
Date: Tue, 3 Jun 2014 20:28:48 -0700
Message-ID: <9034CBD80F070943B59700D7F8149ED901021E2255@SC-VEXCH4.marvell.com>
References: <002301cf7f24$9beec360$d3cc4a20$%han@samsung.com>
 <002401cf7f24$cd028b80$6707a280$%han@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mx0a-0016f401.pphosted.com ([67.231.148.174]:15975 "EHLO
	mx0a-0016f401.pphosted.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753413AbaFDD26 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 3 Jun 2014 23:28:58 -0400
In-Reply-To: <002401cf7f24$cd028b80$6707a280$%han@samsung.com>
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Jingoo Han <jg1.han@samsung.com>, 'Linus Walleij' <linus.walleij@linaro.org>
Cc: 'Alexandre Courbot' <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, 'Eric Miao' <eric.y.miao@gmail.com>

DQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEppbmdvbyBIYW4gW21haWx0
bzpqZzEuaGFuQHNhbXN1bmcuY29tXQ0KPiBTZW50OiAyMDE0xOo21MIzyNUgMjA6MTANCj4gVG86
ICdMaW51cyBXYWxsZWlqJw0KPiBDYzogJ0FsZXhhbmRyZSBDb3VyYm90JzsgbGludXgtZ3Bpb0B2
Z2VyLmtlcm5lbC5vcmc7ICdKaW5nb28gSGFuJzsgTmVpbCBaaGFuZzsNCj4gJ0VyaWMgTWlhbycN
Cj4gU3ViamVjdDogW1BBVENIIDIvMl0gZ3BpbzogcHhhOiBNYWtlIG9mX2RldmljZV9pZCBhcnJh
eSBjb25zdA0KPiANCj4gTWFrZSBvZl9kZXZpY2VfaWQgYXJyYXkgY29uc3QsIGJlY2F1c2UgYWxs
IE9GIGZ1bmN0aW9ucyBoYW5kbGUgaXQgYXMgY29uc3QuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBK
aW5nb28gSGFuIDxqZzEuaGFuQHNhbXN1bmcuY29tPg0KPiAtLS0NCj4gIGRyaXZlcnMvZ3Bpby9n
cGlvLXB4YS5jIHwgICAgMiArLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAx
IGRlbGV0aW9uKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncGlvL2dwaW8tcHhhLmMg
Yi9kcml2ZXJzL2dwaW8vZ3Bpby1weGEuYyBpbmRleA0KPiA0MmU2ZTY0Li41MmJiZGEwIDEwMDY0
NA0KPiAtLS0gYS9kcml2ZXJzL2dwaW8vZ3Bpby1weGEuYw0KPiArKysgYi9kcml2ZXJzL2dwaW8v
Z3Bpby1weGEuYw0KPiBAQCAtNDk4LDcgKzQ5OCw3IEBAIHN0YXRpYyBpbnQgcHhhX2dwaW9fbnVt
cyhzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlDQo+ICpwZGV2KSAgfQ0KPiANCj4gICNpZmRlZiBDT05G
SUdfT0YNCj4gLXN0YXRpYyBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIHB4YV9ncGlvX2R0X2lkc1tdID0g
ew0KPiArc3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgcHhhX2dwaW9fZHRfaWRzW10g
PSB7DQo+ICAJeyAuY29tcGF0aWJsZSA9ICJpbnRlbCxweGEyNXgtZ3BpbyIsCS5kYXRhID0gJnB4
YTI1eF9pZCwgfSwNCj4gIAl7IC5jb21wYXRpYmxlID0gImludGVsLHB4YTI2eC1ncGlvIiwJLmRh
dGEgPSAmcHhhMjZ4X2lkLCB9LA0KPiAgCXsgLmNvbXBhdGlibGUgPSAiaW50ZWwscHhhMjd4LWdw
aW8iLAkuZGF0YSA9ICZweGEyN3hfaWQsIH0sDQo+IC0tDQo+IDEuNy4xMC40DQo+IA0KDQpBY2tl
ZC1ieTogTmVpbCBaaGFuZyA8emhhbmd3bUBtYXJ2ZWxsLmNvbT4NCg0KQmVzdCBSZWdhcmRzLA0K
TmVpbCBaaGFuZw0K
