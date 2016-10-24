From: Gang Liu <gang.liu@nxp.com>
Subject: RE: [PATCH] gpio: mpc8xxx: Correct irq handler function
Date: Mon, 24 Oct 2016 03:46:47 +0000
Message-ID: <HE1PR0401MB241247DDF05D79E061EAEC2982A90@HE1PR0401MB2412.eurprd04.prod.outlook.com>
References: <1477035088-20587-1-git-send-email-Gang.Liu@nxp.com>
 <CACRpkdbRdfybOPX6WNjH9R90Z1vJE9L0dRDg8HTSvF4kAapdbg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-db5eur01on0063.outbound.protection.outlook.com ([104.47.2.63]:2654
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1751602AbcJXEBl (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 24 Oct 2016 00:01:41 -0400
In-Reply-To: <CACRpkdbRdfybOPX6WNjH9R90Z1vJE9L0dRDg8HTSvF4kAapdbg@mail.gmail.com>
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>, Mingkai Hu <mingkai.hu@nxp.com>, Leo Li <leoyang.li@nxp.com>

IA0KPiBPbiBGcmksIE9jdCAyMSwgMjAxNiBhdCA5OjMxIEFNLCBMaXUgR2FuZyA8R2FuZy5MaXVA
bnhwLmNvbT4gd3JvdGU6DQo+IA0KPiA+IEZyb20gdGhlIGJlZ2lubmluZyBvZiB0aGUgZ3Bpby1t
cGM4eHh4LmMsIHRoZSAiaGFuZGxlX2xldmVsX2lycSINCj4gPiBoYXMgYmVpbmcgdXNlZCB0byBo
YW5kbGUgR1BJTyBpbnRlcnJ1cHRzIGluIHRoZSBQb3dlclBDL0xheWVyc2NhcGUNCj4gPiBwbGF0
Zm9ybXMuIEJ1dCBhY3R1YWxseSwgYWxtb3N0IGFsbCBQb3dlclBDL0xheWVyc2NhcGUgcGxhdGZv
cm1zDQo+ID4gYXNzZXJ0IGFuIGludGVycnVwdCByZXF1ZXN0IHVwb24gZWl0aGVyIGEgaGlnaC10
by1sb3cgY2hhbmdlIG9yIGFueQ0KPiA+IGNoYW5nZSBvbiB0aGUgc3RhdGUgb2YgdGhlIHNpZ25h
bC4NCj4gPg0KPiA+IFNvIHRoZSAiaGFuZGxlX2xldmVsX2lycSIgaXMgbm90IHJlYXNvbmFibGUg
Zm9yIFBvd2VyUEMvTGF5ZXJzY2FwZQ0KPiA+IEdQSU8gaW50ZXJydXB0LCBpdCBzaG91bGQgYmUg
ImhhbmRsZV9lZGdlX2lycSIuIE90aGVyd2lzZSB0aGUgc3lzdGVtDQo+ID4gbWF5IGxvc3Qgc29t
ZSBpbnRlcnJ1cHRzIGZyb20gdGhlIFBJTidzIHN0YXRlIGNoYW5nZXMuDQo+ID4NCj4gPiBTaWdu
ZWQtb2ZmLWJ5OiBMaXUgR2FuZyA8R2FuZy5MaXVAbnhwLmNvbT4NCj4gDQo+IFllcyBhbmQgZXNw
ZWNpYWxseSBzbyBzaW5jZSB0aGlzIGlycWNoaXAgaW1wbGVtZW50cyAuaXJxX2FjaygpIGFuZCB1
bmxlc3MgeW91DQo+IHVzZSB0aGUgZWRnZSBoYW5kbGVyIGl0IHdpbGwgbmV2ZXIgYmUgY2FsbGVk
Lg0KPiANCj4gUGF0Y2ggYXBwbGllZCBmb3IgZml4ZXMsIHRlbGwgbWUgaWYgaXQgYWxzbyBuZWVk
cyB0byBnbyBpbnRvIHN0YWJsZS4NCj4gDQpbTGl1IEdhbmddIHllcywgcGxlYXNlIGFsc28gcHV0
IGl0IGludG8gc3RhYmxlLiBUaGFua3MhDQoNCj4gSWYgeW91IHdhbnQgdG8gbG9vayBjbG9zZXIg
YXQgdGhpcyBkcml2ZXIsIEkgdGhpbmsgaXQgaXMgcG9zc2libGUgdG8gc2ltcGxpZnkgaXQgcXVp
dGUgYQ0KPiBiaXQgYnkgdXNpbmcgR1BJT0xJQl9JUlFDSElQIGxpa2UgYSBmZXcgb3RoZXIgZHJp
dmVycywgZm9yIGV4YW1wbGUgZ3Bpby1wbDA2MS5jLg0KPiBQYXRjaGVzIGFjY2VwdGVkIDopDQo+
IA0KPiBZb3VycywNCj4gTGludXMgV2FsbGVpag0K
