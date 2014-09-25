From: "Wang, Yalin" <Yalin.Wang@sonymobile.com>
Subject: RE: [PATCH] gpiolib:change to use irq_alloc_descs_from to alloc
 virqs
Date: Thu, 25 Sep 2014 15:47:15 +0800
Message-ID: <35FD53F367049845BC99AC72306C23D103D6DB491636@CNBJMBX05.corpusers.net>
References: <35FD53F367049845BC99AC72306C23D103CDBFBFB017@CNBJMBX05.corpusers.net>
	<CACRpkdbmnPcDFHu6oLhXQERyFzXD2K1QHH1hRUtci41KuEDdtQ@mail.gmail.com>
	<35FD53F367049845BC99AC72306C23D103D6DB4D6F29@CNBJMBX05.corpusers.net>
	<54216EA5.5010506@ti.com>
 <CACRpkdaM-1btosNFGMJy_U4F6rQfiG7sQXyyM0gyQ6OhC=_c8Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from cnbjrel02.sonyericsson.com ([219.141.167.166]:16245 "EHLO
	cnbjrel02.sonyericsson.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1750877AbaIYHrT (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>);
	Thu, 25 Sep 2014 03:47:19 -0400
In-Reply-To: <CACRpkdaM-1btosNFGMJy_U4F6rQfiG7sQXyyM0gyQ6OhC=_c8Q@mail.gmail.com>
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: 'Linus Walleij' <linus.walleij@linaro.org>, Grygorii Strashko <grygorii.strashko@ti.com>
Cc: "gnurou@gmail.com" <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>

DQo+IEZyb206IExpbnVzIFdhbGxlaWogW21haWx0bzpsaW51cy53YWxsZWlqQGxpbmFyby5vcmdd
DQo+IA0KPiBPbiBUdWUsIFNlcCAyMywgMjAxNCBhdCAyOjU5IFBNLCBHcnlnb3JpaSBTdHJhc2hr
bw0KPiA8Z3J5Z29yaWkuc3RyYXNoa29AdGkuY29tPiB3cm90ZToNCj4gDQo+ID4gTm93IHRoZSAi
aXJxX2Jhc2UiIGlzIHVzZWQgb25seSB0d2ljZSBpbiBncGlvbGliIGNvZGUgYW5kIGJlbG93IGRp
ZmYNCj4gPiBzaG91bGQgYWxsb3cgdG8gZHJvcCBpdCBjb21wbGV0ZWx5IGZyb20gZ3Bpb2xpYiBj
b2RlLg0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3Bpby9ncGlvbGliLmMgYi9kcml2
ZXJzL2dwaW8vZ3Bpb2xpYi5jIGluZGV4DQo+ID4gMTVjYzBiYi4uODE3NjJlZCAxMDA2NDQNCj4g
PiAtLS0gYS9kcml2ZXJzL2dwaW8vZ3Bpb2xpYi5jDQo+ID4gKysrIGIvZHJpdmVycy9ncGlvL2dw
aW9saWIuYw0KPiA+IEBAIC01MjQsNyArNTI0LDcgQEAgc3RhdGljIHZvaWQgZ3Bpb2NoaXBfaXJx
Y2hpcF9yZW1vdmUoc3RydWN0IGdwaW9fY2hpcA0KPiAqZ3Bpb2NoaXApDQo+ID4gICAgICAgICAv
KiBSZW1vdmUgYWxsIElSUSBtYXBwaW5ncyBhbmQgZGVsZXRlIHRoZSBkb21haW4gKi8NCj4gPiAg
ICAgICAgIGlmIChncGlvY2hpcC0+aXJxZG9tYWluKSB7DQo+ID4gICAgICAgICAgICAgICAgIGZv
ciAob2Zmc2V0ID0gMDsgb2Zmc2V0IDwgZ3Bpb2NoaXAtPm5ncGlvOyBvZmZzZXQrKykNCj4gPiAt
ICAgICAgICAgICAgICAgICAgICAgICBpcnFfZGlzcG9zZV9tYXBwaW5nKGdwaW9jaGlwLT5pcnFf
YmFzZSArIG9mZnNldCk7DQo+ID4gKw0KPiA+ICsgaXJxX2Rpc3Bvc2VfbWFwcGluZyhpcnFfZmlu
ZF9tYXBwaW5nKGdwaW9jaGlwLT5pcnFkb21haW4sIG9mZnNldCkpOw0KPiA+ICAgICAgICAgICAg
ICAgICBpcnFfZG9tYWluX3JlbW92ZShncGlvY2hpcC0+aXJxZG9tYWluKTsNCj4gPiAgICAgICAg
IH0NCj4gPg0KPiA+IG5vdCB0ZXN0ZWQuDQo+IA0KPiBJIGxpa2UgdGhlIGxvb2tzIG9mIHRoaXMu
DQo+IA0KPiBHcnlnb3JpaSwgY2FuIHlvdSBzZW5kIGEgcHJvcGVyLCB0ZXN0ZWQgcGF0Y2ggZm9y
IHRoaXM/IFRoYW5zayENCg0KQ291bGQgd2UgYWxzbyByZW1vdmUgZ3Bpb2NoaXAtPmlycV9iYXNl
IGlmIHVzZSB0aGlzIHNvbHV0aW9uPw0KSXQgc2VlbXMgZ3Bpb2NoaXAtPmlycV9iYXNlIGlzIHVz
ZWxlc3MgLg0KDQpUaGFua3MNCg==
