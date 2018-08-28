From: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
Subject: Re: [PATCH 1/2] GPIO: add single-register gpio via creg driver
Date: Tue, 28 Aug 2018 11:04:38 +0000
Message-ID: <1535454277.24765.1.camel@synopsys.com>
References: <20180823150013.21837-1-Eugeniy.Paltsev@synopsys.com>
         <20180823150013.21837-2-Eugeniy.Paltsev@synopsys.com>
         <c5f75b43-6ef3-31e2-0366-b6c8623d3f5d@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <c5f75b43-6ef3-31e2-0366-b6c8623d3f5d@infradead.org>
Content-Language: en-US
Content-ID: <E2E4A5A9F3CE234FA728D27A04B4E36C@internal.synopsys.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "rdunlap@infradead.org" <rdunlap@infradead.org>, "Eugeniy.Paltsev@synopsys.com" <Eugeniy.Paltsev@synopsys.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>
Cc: "Vineet.Gupta1@synopsys.com" <Vineet.Gupta1@synopsys.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Alexey.Brodkin@synopsys.com" <Alexey.Brodkin@synopsys.com>, "linus.walleij@linaro.org" <linus.walleij@linaro.org>
List-Id: linux-gpio@vger.kernel.org

SGkgUmFuZHksDQoNCnRoYW5rcyBmb3IgY29tbWVudHMsIHdpbGwgYmUgZml4ZWQgaW4gcGF0Y2gg
VjIuDQoNCk9uIFRodSwgMjAxOC0wOC0yMyBhdCAwODowOCAtMDcwMCwgUmFuZHkgRHVubGFwIHdy
b3RlOg0KPiBPbiAwOC8yMy8yMDE4IDA4OjAwIEFNLCBFdWdlbml5IFBhbHRzZXYgd3JvdGU6DQo+
ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3Bpby9LY29uZmlnIGIvZHJpdmVycy9ncGlvL0tjb25m
aWcNCj4gPiBpbmRleCA3MWMwYWI0NmYyMTYuLjBmOWNjMTU4MmNhYiAxMDA2NDQNCj4gPiAtLS0g
YS9kcml2ZXJzL2dwaW8vS2NvbmZpZw0KPiA+ICsrKyBiL2RyaXZlcnMvZ3Bpby9LY29uZmlnDQo+
ID4gQEAgLTQzMCw2ICs0MzAsMTUgQEAgY29uZmlnIEdQSU9fUkVHDQo+ID4gIAkgIEEgMzItYml0
IHNpbmdsZSByZWdpc3RlciBHUElPIGZpeGVkIGluL291dCBpbXBsZW1lbnRhdGlvbi4gIFRoaXMN
Cj4gPiAgCSAgY2FuIGJlIHVzZWQgdG8gcmVwcmVzZW50IGFueSByZWdpc3RlciBhcyBhIHNldCBv
ZiBHUElPIHNpZ25hbHMuDQo+ID4gIA0KPiA+ICtjb25maWcgR1BJT19TTlBTX0NSRUcNCj4gPiAr
CWJvb2wgIkdQSU8gdmlhIENSRUcgKENvbnRyb2wgUkVHaXNlcnMpIGRyaXZlciINCj4gDQo+IAkg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIFJFR2lzdGVycykNCj4gDQo+ID4gKwlzZWxlY3Qg
T0ZfR1BJTw0KPiA+ICsJaGVscA0KPiA+ICsJICBUaGlzIGRyaXZlciBzdXBwb3J0cyBHUElPcyB2
aWEgQ1JFRyBvbiB2YXJpb3VzIFN5bm9wc3lzIFNvQ3MuDQo+ID4gKwkgIFRoaXMgaXMgaXMgc2lu
Z2xlLXJlZ2lzdGVyIE1NSU8gZ3BpbyBkcml2ZXIgZm9yIGNvbXBsZXggY2FzZXMNCj4gDQo+IAkg
IFRoaXMgaXMgYSAgICAgICAgICAgICAgICAgIE1NSU8gR1BJTw0KPiANCj4gPiArCSAgd2hlcmUg
b25seSBzZXZlcmFsIGZpZWxkcyBpbiByZWdpc3RlciBiZWxvbmcgdG8gR1BJTyBhbmQNCj4gDQo+
IAkgICAgICAgICAgICAgICAgICAgICAgICAgICAgaW4gYSByZWdpc3Rlcg0KPiANCj4gPiArCSAg
ZWFjaCBHUElPIG93bnMgZmllbGQgd2l0aCBkaWZmZXJlbnQgbGVuZ3RoIGFuZCBvbi9vZmYgdmFs
dWVzLg0KPiANCj4gbWF5YmU6DQo+IAkgICAgICAgICAgICAgICAgIGZpZWxkcyB3aXRoIGRpZmZl
cmVudCBsZW5ndGhzDQo+IA0KPiA+ICsNCj4gPiAgY29uZmlnIEdQSU9fU1BFQVJfU1BJQ1MNCj4g
PiAgCWJvb2wgIlNUIFNQRUFyMTN4eCBTUEkgQ2hpcCBTZWxlY3QgYXMgR1BJTyBzdXBwb3J0Ig0K
PiA+ICAJZGVwZW5kcyBvbiBQTEFUX1NQRUFSDQo+IA0KPiANCi0tIA0KIEV1Z2VuaXkgUGFsdHNl
dg==
