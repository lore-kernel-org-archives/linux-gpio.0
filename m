From: "Tan, Jui Nee" <jui.nee.tan@intel.com>
Subject: RE: [PATCH v7 2/6] mfd: lpc_ich: Rename lpc-ich driver
Date: Fri, 7 Oct 2016 07:39:12 +0000
Message-ID: <0158A29DB680F54A88142ED28D55B1D0082F77D6@PGSMSX107.gar.corp.intel.com>
References: <1475056343-31907-1-git-send-email-jui.nee.tan@intel.com>
 <1475056343-31907-3-git-send-email-jui.nee.tan@intel.com>
 <20160930003119.GD13971@dell>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga01.intel.com ([192.55.52.88]:9213 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1754169AbcJGHjR (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 7 Oct 2016 03:39:17 -0400
In-Reply-To: <20160930003119.GD13971@dell>
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: "mika.westerberg@linux.intel.com" <mika.westerberg@linux.intel.com>, "heikki.krogerus@linux.intel.com" <heikki.krogerus@linux.intel.com>, "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>, "tglx@linutronix.de" <tglx@linutronix.de>, "mingo@redhat.com" <mingo@redhat.com>, "hpa@zytor.com" <hpa@zytor.com>, "x86@kernel.org" <x86@kernel.org>, "ptyser@xes-inc.com" <ptyser@xes-inc.com>, "linus.walleij@linaro.org" <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Yong, Jonathan" <jonathan.yong@intel.com>, "Yu, Ong Hock" <ong.hock.yu@intel.com>, "Luck, Tony" <tony.luck@intel.com>, "Wan Mohamad, Wan Ahmad Zainie" <wan.ahmad.zainie.wan.mohamad@intel.com>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTGVlIEpvbmVzIFttYWls
dG86bGVlLmpvbmVzQGxpbmFyby5vcmddDQo+IFNlbnQ6IEZyaWRheSwgU2VwdGVtYmVyIDMwLCAy
MDE2IDg6MzEgQU0NCj4gVG86IFRhbiwgSnVpIE5lZSA8anVpLm5lZS50YW5AaW50ZWwuY29tPg0K
PiBDYzogbWlrYS53ZXN0ZXJiZXJnQGxpbnV4LmludGVsLmNvbTsgaGVpa2tpLmtyb2dlcnVzQGxp
bnV4LmludGVsLmNvbTsNCj4gYW5kcml5LnNoZXZjaGVua29AbGludXguaW50ZWwuY29tOyB0Z2x4
QGxpbnV0cm9uaXguZGU7IG1pbmdvQHJlZGhhdC5jb207DQo+IGhwYUB6eXRvci5jb207IHg4NkBr
ZXJuZWwub3JnOyBwdHlzZXJAeGVzLWluYy5jb207DQo+IGxpbnVzLndhbGxlaWpAbGluYXJvLm9y
ZzsgbGludXgtZ3Bpb0B2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LQ0KPiBrZXJuZWxAdmdlci5rZXJu
ZWwub3JnOyBZb25nLCBKb25hdGhhbiA8am9uYXRoYW4ueW9uZ0BpbnRlbC5jb20+OyBZdSwgT25n
DQo+IEhvY2sgPG9uZy5ob2NrLnl1QGludGVsLmNvbT47IEx1Y2ssIFRvbnkgPHRvbnkubHVja0Bp
bnRlbC5jb20+OyBXYW4NCj4gTW9oYW1hZCwgV2FuIEFobWFkIFphaW5pZSA8d2FuLmFobWFkLnph
aW5pZS53YW4ubW9oYW1hZEBpbnRlbC5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjcgMi82
XSBtZmQ6IGxwY19pY2g6IFJlbmFtZSBscGMtaWNoIGRyaXZlcg0KPiANCj4gT24gV2VkLCAyOCBT
ZXAgMjAxNiwgVGFuIEp1aSBOZWUgd3JvdGU6DQo+IA0KPiA+IFRoaXMgcGF0Y2ggZm9sbG93cyB0
aGUgZXhhbXBsZSBvZiBtZmQvd204MzF4IHRvIHJlbmFtZSB0aGUgZHJpdmVyIGZyb20NCj4gPiAi
bHBjX2ljaCIgdG8gImxwY19pY2gtY29yZSIuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBUYW4g
SnVpIE5lZSA8anVpLm5lZS50YW5AaW50ZWwuY29tPg0KPiA+IC0tLQ0KPiA+IENoYW5nZXMgaW4g
Vjc6DQo+ID4gCS0gTm8gY2hhbmdlDQo+ID4NCj4gPiBDaGFuZ2VzIGluIFY2Og0KPiA+IAktIG5v
bmUsIGp1c3QgYSBzdWJqZWN0IGxpbmUgYW5kIGNvbW1pdCBtZXNzYWdlIGNoYW5nZS4NCj4gPg0K
PiA+ICBkcml2ZXJzL21mZC9NYWtlZmlsZSAgICAgICAgICAgICAgICAgICAgICB8IDEgKw0KPiA+
ICBkcml2ZXJzL21mZC97bHBjX2ljaC5jID0+IGxwY19pY2gtY29yZS5jfSB8IDANCj4gPiAgMiBm
aWxlcyBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQ0KPiA+ICByZW5hbWUgZHJpdmVycy9tZmQve2xw
Y19pY2guYyA9PiBscGNfaWNoLWNvcmUuY30gKDEwMCUpDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9tZmQvTWFrZWZpbGUgYi9kcml2ZXJzL21mZC9NYWtlZmlsZSBpbmRleA0KPiA+IDJi
YTNiYTMuLjI2MGY0NmYgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9tZmQvTWFrZWZpbGUNCj4g
PiArKysgYi9kcml2ZXJzL21mZC9NYWtlZmlsZQ0KPiA+IEBAIC0xNTUsNiArMTU1LDcgQEAgb2Jq
LSQoQ09ORklHX1BNSUNfQURQNTUyMCkJKz0gYWRwNTUyMC5vDQo+ID4gIG9iai0kKENPTkZJR19N
RkRfS0VNUExEKQkrPSBrZW1wbGQtY29yZS5vDQo+ID4gIG9iai0kKENPTkZJR19NRkRfSU5URUxf
UVVBUktfSTJDX0dQSU8pCSs9IGludGVsX3F1YXJrX2kyY19ncGlvLm8NCj4gPiAgb2JqLSQoQ09O
RklHX0xQQ19TQ0gpCQkrPSBscGNfc2NoLm8NCj4gPiArbHBjX2ljaC1vYmpzCQk6PSBscGNfaWNo
LWNvcmUubw0KPiANCj4gUGxlYXNlIHVzZSB1bmRlcnNjb3JlcyBPUiBvYmxpcXVlcywgbm90IGJv
dGguDQo+IA0KTm90ZWQuIEkgd2lsbCBzZW5kIG91dCBhbm90aGVyIHBhdGNoLXNldCB3aXRoIGZp
bGVuYW1lIGxwY19pY2hfY29yZS4NCj4gPiAgb2JqLSQoQ09ORklHX0xQQ19JQ0gpCQkrPSBscGNf
aWNoLm8NCj4gPiAgb2JqLSQoQ09ORklHX01GRF9SREMzMjFYKQkrPSByZGMzMjF4LXNvdXRoYnJp
ZGdlLm8NCj4gPiAgb2JqLSQoQ09ORklHX01GRF9KQU5aX0NNT0RJTykJKz0gamFuei1jbW9kaW8u
bw0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL21mZC9scGNfaWNoLmMgYi9kcml2ZXJzL21mZC9s
cGNfaWNoLWNvcmUuYw0KPiA+IHNpbWlsYXJpdHkgaW5kZXggMTAwJSByZW5hbWUgZnJvbSBkcml2
ZXJzL21mZC9scGNfaWNoLmMgcmVuYW1lIHRvDQo+ID4gZHJpdmVycy9tZmQvbHBjX2ljaC1jb3Jl
LmMNCj4gDQo+IC0tDQo+IExlZSBKb25lcw0KPiBMaW5hcm8gU1RNaWNyb2VsZWN0cm9uaWNzIExh
bmRpbmcgVGVhbSBMZWFkIExpbmFyby5vcmcg4pSCIE9wZW4gc291cmNlDQo+IHNvZnR3YXJlIGZv
ciBBUk0gU29DcyBGb2xsb3cgTGluYXJvOiBGYWNlYm9vayB8IFR3aXR0ZXIgfCBCbG9nDQo=
