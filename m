From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: stmfx: Fix compile issue when CONFIG_OF_GPIO is
 not defined
Date: Thu, 23 May 2019 21:18:37 +0200
Message-ID: <CACRpkdZLbMJ5dKiL9J1x=PozBVH777kNNABZi-n0LxD0BOp8mw@mail.gmail.com>
References: <1558338735-8444-1-git-send-email-amelie.delaunay@st.com>
 <20190522054833.GB4574@dell> <eb8425ec-989a-9701-7fee-61bd1d2b93c1@st.com>
 <20190522084133.GF4574@dell> <bc1b5f1d-23b0-141d-f58f-b54ac303fe20@st.com>
 <CACRpkdYmdpwEvCBrL6i1V+Zxd0OSpZmD8BJPSZu9jYNeJkoimQ@mail.gmail.com>
 <08ea97544018430caf53af36677902b7@SFHDAG3NODE2.st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <08ea97544018430caf53af36677902b7@SFHDAG3NODE2.st.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Amelie DELAUNAY <amelie.delaunay@st.com>
Cc: Alexandre TORGUE <alexandre.torgue@st.com>, Randy Dunlap <rdunlap@infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "kbuild-all@01.org" <kbuild-all@01.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Lee Jones <lee.jones@linaro.org>, "linux-stm32@st-md-mailman.stormreply.com" <linux-stm32@st-md-mailman.stormreply.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-gpio@vger.kernel.org

T24gVGh1LCBNYXkgMjMsIDIwMTkgYXQgNDoxMSBQTSBBbWVsaWUgREVMQVVOQVkgPGFtZWxpZS5k
ZWxhdW5heUBzdC5jb20+IHdyb3RlOgo+IE9uIDUvMjIvMTkgMTE6NDggUE0sIExpbnVzIFdhbGxl
aWogd3JvdGU6Cj4gPiBPbiBXZWQsIE1heSAyMiwgMjAxOSBhdCAxMToyMSBBTSBBbWVsaWUgREVM
QVVOQVkgPGFtZWxpZS5kZWxhdW5heUBzdC5jb20+IHdyb3RlOgo+ID4KPiA+PiAuLi9kcml2ZXJz
L3BpbmN0cmwvcGluY3RybC1zdG1meC5jOjQwOToyMDogZXJyb3I6Cj4gPj4g4oCYcGluY29uZl9n
ZW5lcmljX2R0X25vZGVfdG9fbWFwX3BpbuKAmSB1bmRlY2xhcmVkIGhlcmUgKG5vdCBpbiBhIGZ1
bmN0aW9uKQo+ID4+ICAgICAuZHRfbm9kZV90b19tYXAgPSBwaW5jb25mX2dlbmVyaWNfZHRfbm9k
ZV90b19tYXBfcGluLAo+ID4+Cj4gPj4gT0ZfR1BJTyBkZXBlbmRzIG9uIE9GLgo+ID4+Cj4gPj4g
U28gZWl0aGVyCj4gPj4gICAgICAgZGVwZW5kcyBvbiBPRiB8fCAoT0YgJiYgQ09NUElMRV9URVNU
KQo+ID4+IG9yCj4gPj4gICAgICAgZGVwZW5kcyBvbiBPRiB8fCAoT0ZfR1BJTyAmJiBDT01QSUxF
X1RFU1QpCj4gPj4KPiA+PiBhbmQKPiA+Pgo+ID4+ICAgICAgIHNlbGVjdCBPRl9HUElPCj4gPgo+
ID4gSSB3b3VsZCB1c2UganVzdDoKPiA+Cj4gPiBkZXBlbmRzIG9uIE9GX0dQSU8KPiA+Cj4gPiBC
ZWNhdXNlIE9GX0dQSU8gYWxyZWFkeSBkZXBlbmRzIG9uIE9GLCBhbmQKPiA+IGNvbXBpbGUgdGVz
dHMgd2lsbCBub3Qgd29yayB3aXRob3V0IE9GX0dQSU8gd2hpY2gKPiA+IHJlcXVpcmUgT0Ygc28u
Li4KPiA+Cj4gPiBCZXNpZGVzIGl0IGlzIHdoYXQgbW9zdCBvdGhlciBHUElPIGRyaXZlcnMgZG8u
Cj4gPgo+ID4gU28ganVzdCBrZWVwIHRoYXQgb25lIGxpbmUgYW5kIGRyb3AgdGhlIHJlc3QuCj4g
Pgo+ID4gWW91cnMsCj4gPiBMaW51cyBXYWxsZWlqCj4gPgo+Cj4gT2sgc28gSSBjYW4gZ2V0IHJp
ZCBvZiBDT01QSUxFX1RFU1QgPwo+ICAgICAgICAgZGVwZW5kcyBvbiBJMkMKPiAgICAgICAgIGRl
cGVuZHMgb24gT0ZfR1BJTwo+ICAgICAgICAgc2VsZWN0IEdFTkVSSUNfUElOQ09ORgo+ICAgICAg
ICAgc2VsZWN0IEdQSU9MSUJfSVJRQ0hJUAo+ICAgICAgICAgc2VsZWN0IE1GRF9TVE1GWAoKWWVw
IGp1c3QgbGlrZSB0aGF0LgoKPiBCZWNhdXNlIEkndmUgbm8gYXJjaCB0byBiYWxhbmNlIENPTVBJ
TEVfVEVTVC4gT3IgbWF5YmUgc29tZXRoaW5nIGxpa2UKPiAgICAgICAgIGRlcGVuZHMgb24gT0Zf
R1BJTyAmJiAoT0YgfHwgQ09NUElMRV9URVNUKQo+IGV2ZW4gaWYgT0ZfR1BJTyAmJiBPRiBpcyBy
ZWR1bmRhbnQgPwoKQ09NUElMRV9URVNUIGlzIGp1c3QgdG8gbWFrZSBzb21ldGhpbmcgYXZhaWxh
YmxlIGZvciB0ZXN0aW5nCm9uIG90aGVyIGFyY2hpdGVjdHVyZXMsIHN1Y2ggYXMgdGVzdGluZyBB
Uk0tc3BlY2lmaWMgZHJpdmVycwpvbiB4ODYuCgpXaXRoIGp1c3QgT0ZfR1BJTyBhcyBkZXBlbmRl
bmN5LCBpdCB3aWxsIGJlIGNvbXBpbGUgdGVzdGVkIGFueXdheXMKYmVjYXVzZSB4ODYgYWxseWVz
Y29uZmlnIHdpbGwgZW5hYmxlIE9GIGFuZCBPRl9HUElPLCBhbmQgYWxzbwphbGwgdGhlIFNUTUZY
IGRyaXZlcnMuCgpZb3VycywKTGludXMgV2FsbGVpagoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYXJtLWtlcm5lbCBtYWlsaW5nIGxpc3QKbGlu
dXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYXJtLWtlcm5lbAo=
