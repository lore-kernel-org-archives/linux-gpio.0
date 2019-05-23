From: Amelie DELAUNAY <amelie.delaunay@st.com>
Subject: Re: [PATCH] pinctrl: stmfx: Fix compile issue when CONFIG_OF_GPIO is
 not defined
Date: Thu, 23 May 2019 14:11:11 +0000
Message-ID: <08ea97544018430caf53af36677902b7@SFHDAG3NODE2.st.com>
References: <1558338735-8444-1-git-send-email-amelie.delaunay@st.com>
 <20190522054833.GB4574@dell> <eb8425ec-989a-9701-7fee-61bd1d2b93c1@st.com>
 <20190522084133.GF4574@dell> <bc1b5f1d-23b0-141d-f58f-b54ac303fe20@st.com>
 <CACRpkdYmdpwEvCBrL6i1V+Zxd0OSpZmD8BJPSZu9jYNeJkoimQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdYmdpwEvCBrL6i1V+Zxd0OSpZmD8BJPSZu9jYNeJkoimQ@mail.gmail.com>
Content-Language: en-US
Content-ID: <7D90F5DB4CC7194687CC2E9A6A3EEA8F@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Lee Jones <lee.jones@linaro.org>, Alexandre TORGUE <alexandre.torgue@st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-stm32@st-md-mailman.stormreply.com" <linux-stm32@st-md-mailman.stormreply.com>, "kbuild-all@01.org" <kbuild-all@01.org>, Randy Dunlap <rdunlap@infradead.org>
List-Id: linux-gpio@vger.kernel.org

T24gNS8yMi8xOSAxMTo0OCBQTSwgTGludXMgV2FsbGVpaiB3cm90ZToNCj4gT24gV2VkLCBNYXkg
MjIsIDIwMTkgYXQgMTE6MjEgQU0gQW1lbGllIERFTEFVTkFZIDxhbWVsaWUuZGVsYXVuYXlAc3Qu
Y29tPiB3cm90ZToNCj4gDQo+PiAuLi9kcml2ZXJzL3BpbmN0cmwvcGluY3RybC1zdG1meC5jOjQw
OToyMDogZXJyb3I6DQo+PiDigJhwaW5jb25mX2dlbmVyaWNfZHRfbm9kZV90b19tYXBfcGlu4oCZ
IHVuZGVjbGFyZWQgaGVyZSAobm90IGluIGEgZnVuY3Rpb24pDQo+PiAgICAgLmR0X25vZGVfdG9f
bWFwID0gcGluY29uZl9nZW5lcmljX2R0X25vZGVfdG9fbWFwX3BpbiwNCj4+DQo+PiBPRl9HUElP
IGRlcGVuZHMgb24gT0YuDQo+Pg0KPj4gU28gZWl0aGVyDQo+PiAgICAgICBkZXBlbmRzIG9uIE9G
IHx8IChPRiAmJiBDT01QSUxFX1RFU1QpDQo+PiBvcg0KPj4gICAgICAgZGVwZW5kcyBvbiBPRiB8
fCAoT0ZfR1BJTyAmJiBDT01QSUxFX1RFU1QpDQo+Pg0KPj4gYW5kDQo+Pg0KPj4gICAgICAgc2Vs
ZWN0IE9GX0dQSU8NCj4gDQo+IEkgd291bGQgdXNlIGp1c3Q6DQo+IA0KPiBkZXBlbmRzIG9uIE9G
X0dQSU8NCj4gDQo+IEJlY2F1c2UgT0ZfR1BJTyBhbHJlYWR5IGRlcGVuZHMgb24gT0YsIGFuZA0K
PiBjb21waWxlIHRlc3RzIHdpbGwgbm90IHdvcmsgd2l0aG91dCBPRl9HUElPIHdoaWNoDQo+IHJl
cXVpcmUgT0Ygc28uLi4NCj4gDQo+IEJlc2lkZXMgaXQgaXMgd2hhdCBtb3N0IG90aGVyIEdQSU8g
ZHJpdmVycyBkby4NCj4gDQo+IFNvIGp1c3Qga2VlcCB0aGF0IG9uZSBsaW5lIGFuZCBkcm9wIHRo
ZSByZXN0Lg0KPiANCj4gWW91cnMsDQo+IExpbnVzIFdhbGxlaWoNCj4gDQoNCk9rIHNvIEkgY2Fu
IGdldCByaWQgb2YgQ09NUElMRV9URVNUID8NCglkZXBlbmRzIG9uIEkyQw0KCWRlcGVuZHMgb24g
T0ZfR1BJTw0KCXNlbGVjdCBHRU5FUklDX1BJTkNPTkYNCglzZWxlY3QgR1BJT0xJQl9JUlFDSElQ
DQoJc2VsZWN0IE1GRF9TVE1GWA0KDQpCZWNhdXNlIEkndmUgbm8gYXJjaCB0byBiYWxhbmNlIENP
TVBJTEVfVEVTVC4gT3IgbWF5YmUgc29tZXRoaW5nIGxpa2UgDQoJZGVwZW5kcyBvbiBPRl9HUElP
ICYmIChPRiB8fCBDT01QSUxFX1RFU1QpDQpldmVuIGlmIE9GX0dQSU8gJiYgT0YgaXMgcmVkdW5k
YW50ID8NCg0KUmVnYXJkcywNCkFtZWxpZQ0K
