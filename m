From: "Tan, Jui Nee" <jui.nee.tan@intel.com>
Subject: RE: [PATCH v11 1/6] drivers/platform/x86/p2sb: New Primary to
 Sideband bridge support driver for Intel SOC's
Date: Mon, 21 Nov 2016 03:52:41 +0000
Message-ID: <0158A29DB680F54A88142ED28D55B1D008323439@PGSMSX107.gar.corp.intel.com>
References: <1479446550-28677-1-git-send-email-jui.nee.tan@intel.com>
         <1479446550-28677-2-git-send-email-jui.nee.tan@intel.com>
 <1479468102.22212.16.camel@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <platform-driver-x86-owner@vger.kernel.org>
In-Reply-To: <1479468102.22212.16.camel@linux.intel.com>
Content-Language: en-US
Sender: platform-driver-x86-owner@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, "mika.westerberg@linux.intel.com" <mika.westerberg@linux.intel.com>, "heikki.krogerus@linux.intel.com" <heikki.krogerus@linux.intel.com>, "tglx@linutronix.de" <tglx@linutronix.de>, "dvhart@infradead.org" <dvhart@infradead.org>, "mingo@redhat.com" <mingo@redhat.com>, "hpa@zytor.com" <hpa@zytor.com>, "x86@kernel.org" <x86@kernel.org>, "ptyser@xes-inc.com" <ptyser@xes-inc.com>, "lee.jones@linaro.org" <lee.jones@linaro.org>, "linus.walleij@linaro.org" <linus.walleij@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Yong, Jonathan" <jonathan.yong@intel.com>, "Yu, Ong Hock" <ong.hock.yu@intel.com>, "Luck, Tony" <tony.luck@intel.com>, "Wan Mohamad, Wan Ahmad Zainie" <wan.ahmad.zainie.wan.mohamad@intel.com>, "Sun, Yunying" <yunying.sun@intel.com>
List-Id: linux-gpio@vger.kernel.org

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQW5keSBTaGV2Y2hlbmtv
IFttYWlsdG86YW5kcml5LnNoZXZjaGVua29AbGludXguaW50ZWwuY29tXQ0KPiBTZW50OiBGcmlk
YXksIE5vdmVtYmVyIDE4LCAyMDE2IDc6MjIgUE0NCj4gVG86IFRhbiwgSnVpIE5lZSA8anVpLm5l
ZS50YW5AaW50ZWwuY29tPjsgbWlrYS53ZXN0ZXJiZXJnQGxpbnV4LmludGVsLmNvbTsNCj4gaGVp
a2tpLmtyb2dlcnVzQGxpbnV4LmludGVsLmNvbTsgdGdseEBsaW51dHJvbml4LmRlOyBkdmhhcnRA
aW5mcmFkZWFkLm9yZzsNCj4gbWluZ29AcmVkaGF0LmNvbTsgaHBhQHp5dG9yLmNvbTsgeDg2QGtl
cm5lbC5vcmc7IHB0eXNlckB4ZXMtaW5jLmNvbTsNCj4gbGVlLmpvbmVzQGxpbmFyby5vcmc7IGxp
bnVzLndhbGxlaWpAbGluYXJvLm9yZw0KPiBDYzogbGludXgtZ3Bpb0B2Z2VyLmtlcm5lbC5vcmc7
IHBsYXRmb3JtLWRyaXZlci14ODZAdmdlci5rZXJuZWwub3JnOw0KPiBsaW51eC1rZXJuZWxAdmdl
ci5rZXJuZWwub3JnOyBZb25nLCBKb25hdGhhbiA8am9uYXRoYW4ueW9uZ0BpbnRlbC5jb20+Ow0K
PiBZdSwgT25nIEhvY2sgPG9uZy5ob2NrLnl1QGludGVsLmNvbT47IEx1Y2ssIFRvbnkgPHRvbnku
bHVja0BpbnRlbC5jb20+Ow0KPiBXYW4gTW9oYW1hZCwgV2FuIEFobWFkIFphaW5pZSA8d2FuLmFo
bWFkLnphaW5pZS53YW4ubW9oYW1hZEBpbnRlbC5jb20+Ow0KPiBTdW4sIFl1bnlpbmcgPHl1bnlp
bmcuc3VuQGludGVsLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MTEgMS82XSBkcml2ZXJz
L3BsYXRmb3JtL3g4Ni9wMnNiOiBOZXcgUHJpbWFyeSB0bw0KPiBTaWRlYmFuZCBicmlkZ2Ugc3Vw
cG9ydCBkcml2ZXIgZm9yIEludGVsIFNPQydzDQo+IA0KPiBPbiBGcmksIDIwMTYtMTEtMTggYXQg
MTM6MjIgKzA4MDAsIFRhbiBKdWkgTmVlIHdyb3RlOg0KPiA+IEZyb206IEFuZHkgU2hldmNoZW5r
byA8YW5kcml5LnNoZXZjaGVua29AbGludXguaW50ZWwuY29tPg0KPiA+DQo+ID4gVGhlcmUgaXMg
YWxyZWFkeSBvbmUgYW5kIGF0IGxlYXN0IG9uZSBtb3JlIHVzZXIgY29taW5nIHdoaWNoIHJlcXVp
cmUNCj4gPiBhbiBhY2Nlc3MgdG8gUHJpbWFyeSB0byBTaWRlYmFuZCBicmlkZ2UgKFAyU0IpIGlu
IG9yZGVyIHRvIGdldCBJTyBvcg0KPiA+IE1NSU8gYmFyIGhpZGRlbiBieSBCSU9TLg0KPiA+IENy
ZWF0ZSBhIGRyaXZlciB0byBhY2Nlc3MgUDJTQiBmb3IgeDg2IGRldmljZXMuDQo+ID4NCj4gPiBT
aWduZWQtb2ZmLWJ5OiBZb25nLCBKb25hdGhhbiA8am9uYXRoYW4ueW9uZ0BpbnRlbC5jb20+DQo+
ID4gU2lnbmVkLW9mZi1ieTogQW5keSBTaGV2Y2hlbmtvIDxhbmRyaXkuc2hldmNoZW5rb0BsaW51
eC5pbnRlbC5jb20+DQo+ID4gLS0tDQo+ID4gQ2hhbmdlcyBpbiBWMTE6DQo+ID4gCS0gTm8gY2hh
bmdlDQo+IA0KPiBBbnkgcGFydGljdWxhciByZWFzb24geW91IGlnbm9yZWQgbXkgY29tbWVudHMg
dG8gdjEwIG9mIHRoaXMgcGF0Y2g/DQo+DQpIaSBBbmR5LA0KSSBhbSBzb3JyeSBmb3IgbWlzc2lu
ZyB5b3VyIGNvbW1lbnRzIGFzIHRoZSBlbWFpbCBmaWx0ZXJlZCBpbnRvIG90aGVyIGZvbGRlciBh
bmQgSSB3YXMgbm90IGF3YXJlIG9mIHRoYXQuIEkgd2lsbCBhcHBsaWVkIHlvdXIgY29tbWVudHMg
aW50byBuZXh0IHBhdGNoIHZlcnNpb24uDQogDQo+IC0tDQo+IEFuZHkgU2hldmNoZW5rbyA8YW5k
cml5LnNoZXZjaGVua29AbGludXguaW50ZWwuY29tPg0KPiBJbnRlbCBGaW5sYW5kIE95DQo=
