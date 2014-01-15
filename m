From: Neil Zhang <zhangwm@marvell.com>
Subject: RE: [PATCH] gpio: pxa: normalize the return value for gpio_get
Date: Wed, 15 Jan 2014 00:26:43 -0800
Message-ID: <175CCF5F49938B4D99B2E3EF7F558EBE540C390509@SC-VEXCH4.marvell.com>
References: <1389333783-3372-1-git-send-email-zhangwm@marvell.com>
 <CACRpkda=4AhOWDYu7ENcovTo_+oSKKVU+eqkHD9W-3bDMv2MUQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mx0a-0016f401.pphosted.com ([67.231.148.174]:43616 "EHLO
	mx0a-0016f401.pphosted.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751719AbaAOI0r (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>);
	Wed, 15 Jan 2014 03:26:47 -0500
In-Reply-To: <CACRpkda=4AhOWDYu7ENcovTo_+oSKKVU+eqkHD9W-3bDMv2MUQ@mail.gmail.com>
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

DQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IExpbnVzIFdhbGxlaWogW21h
aWx0bzpsaW51cy53YWxsZWlqQGxpbmFyby5vcmddDQo+IFNlbnQ6IDIwMTTE6jHUwjE1yNUgMTU6
NTgNCj4gVG86IE5laWwgWmhhbmcNCj4gQ2M6IEFsZXhhbmRyZSBDb3VyYm90OyBsaW51eC1ncGlv
QHZnZXIua2VybmVsLm9yZzsgbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZw0KPiBTdWJqZWN0
OiBSZTogW1BBVENIXSBncGlvOiBweGE6IG5vcm1hbGl6ZSB0aGUgcmV0dXJuIHZhbHVlIGZvciBn
cGlvX2dldA0KPiANCj4gT24gRnJpLCBKYW4gMTAsIDIwMTQgYXQgNzowMyBBTSwgTmVpbCBaaGFu
ZyA8emhhbmd3bUBtYXJ2ZWxsLmNvbT4gd3JvdGU6DQo+IA0KPiA+IEl0IHdvdWxkIGJlIGNvbnZl
bmllbnQgdG8gbm9ybWFsaXplIHRoZSByZXR1cm4gdmFsdWUgZm9yIGdwaW9fZ2V0Lg0KPiA+DQo+
ID4gSSBoYXZlIGNoZWNrZWQgbWFjaC1tbXAgLyBtYWNoLXB4YSAvIHBsYXQtcHhhIC8gcGxhdC1v
cmlvbiAvIG1hY2gtb3Jpb241eC4NCj4gPiBJdCdzIE9LIGZvciBhbGwgb2YgdGhlbSB0byBjaGFu
Z2UgdGhpcyBmdW5jdGlvbiB0byByZXR1cm4gMCBhbmQgMS4NCj4gPg0KPiA+IFNpZ25lZC1vZmYt
Ynk6IE5laWwgWmhhbmcgPHpoYW5nd21AbWFydmVsbC5jb20+DQo+IA0KPiBCYWggSSB1cGRhdGVk
IHRoZSBjb21taXQgbWVzc2FnZSBhIGJpdCAuLi4geW91IGRyb3BwZWQgdGhlDQo+IGdwaW86IHB4
YTogZXRjIGZyb20gdGhlIHByZXZpb3VzIHBhdGNoLCBub3QgZ29vZCBidXQgZG9uJ3Qgd29ycnkg
SSBmaXhlZCBpdCB1cC4NCj4gDQpUaGFua3MhDQoNCj4gWW91cnMsDQo+IExpbnVzIFdhbGxlaWoN
Cg0KQmVzdCBSZWdhcmRzLA0KTmVpbCBaaGFuZw0K
