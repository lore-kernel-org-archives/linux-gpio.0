From: Gregory CLEMENT <gregory.clement@free-electrons.com>
Subject: Re: [PATCH 1/6] pinctrl: dt-bindings: Add documentation for Armada
 37xx pin controllers
Date: Wed, 22 Mar 2017 12:42:04 +0100
Message-ID: <87d1d9fshf.fsf@free-electrons.com>
References: <20161222172501.16121-1-gregory.clement@free-electrons.com>
 <20161222172501.16121-2-gregory.clement@free-electrons.com>
 <CACRpkdY_yUpo1nkbr0T-FZVSRFynuLSZ_6etho0hHk+otaUiYw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CACRpkdY_yUpo1nkbr0T-FZVSRFynuLSZ_6etho0hHk+otaUiYw@mail.gmail.com>
 (Linus Walleij's message of "Fri, 30 Dec 2016 09:35:27 +0100")
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Andrew Lunn <andrew@lunn.ch>, Jason Cooper <jason@lakedaemon.net>, Hua Jing <jinghua@marvell.com>, Omri Itach <omrii@marvell.com>, Nadav Haklai <nadavh@marvell.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Victor Gu <xigu@marvell.com>, Terry Zhou <bjzhou@marvell.com>, Marcin Wojtas <mw@semihalf.com>, Wilson Ding <dingwei@marvell.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: linux-gpio@vger.kernel.org

SGkgTGludXMsCiAKIE9uIHZlbi4sIGTDqWMuIDMwIDIwMTYsIExpbnVzIFdhbGxlaWogPGxpbnVz
LndhbGxlaWpAbGluYXJvLm9yZz4gd3JvdGU6Cgo+IE9uIFRodSwgRGVjIDIyLCAyMDE2IGF0IDY6
MjQgUE0sIEdyZWdvcnkgQ0xFTUVOVAo+IDxncmVnb3J5LmNsZW1lbnRAZnJlZS1lbGVjdHJvbnMu
Y29tPiB3cm90ZToKPgo+PiBEb2N1bWVudCB0aGUgZGV2aWNlIHRyZWUgYmluZGluZyBmb3IgdGhl
IHBpbiBjb250cm9sbGVycyBmb3VuZCBvbiB0aGUKPj4gQXJtYWRhIDM3eHggU29Dcy4KPj4KPj4g
U2lnbmVkLW9mZi1ieTogR3JlZ29yeSBDTEVNRU5UIDxncmVnb3J5LmNsZW1lbnRAZnJlZS1lbGVj
dHJvbnMuY29tPgo+ICguLi4pCj4KPj4gK1JlcXVpcmVkIHByb3BlcnRpZXMgZm9yIHBpbmN0cmwg
ZHJpdmVyOgo+PiArLSBjb21wYXRpYmxlOiAgIm1hcnZlbGwsYXJtYWRhMzcxMC1zYi1waW5jdHJs
IiBmb3IgdGhlIHNvdXRoIGJyaWRnZQo+PiArICAgICAgICAgICAgICAgIm1hcnZlbGwsYXJtYWRh
MzcxMC1uYi1waW5jdHJsIiBmb3IgdGhlIG5vcnRoIGJyaWRnZQo+PiArLSByZWc6IFRoZSBmaXJz
dCBzZXQgb2YgcmVnaXN0ZXIgYXJlIGZvciBwaW5jdHJsL2dwaW8gYW5kIHRoZSBzZWNvbmQKPj4g
KyAgc2V0IGZvciB0aGUgaW50ZXJydXB0IGNvbnRyb2xsZXIKPj4gKy0gaW50ZXJydXB0czogbGlz
dCBvZiB0aGUgaW50ZXJydXB0IHVzZSBieSB0aGUgZ3Bpbwo+Cj4gV2hpbGUgdGhpcyBtYWtlcyBz
ZW5zZSBvbiBpdHMgb3duLCBpdCBkb2Vzbid0IG1hdGNoIHRoZSBjb2RlIHlvdSBzZW50Lgo+Cj4g
VGhlIGNvZGUgdXNlcyBzeXNjb24gYW5kIHJlZ21hcCBpbnNpZGUgYSBzaW1wbGUtbWZkIG5vZGUs
IG5vdCByZWcuCj4KPiBQbGVhc2UgY2xhcmlmeSBob3cgdGhpcyB3b3JrcyBzbyB3ZSBjYW4gc2Vl
IHdoYXQgaXMgZ29pbmcgb24uCj4KPiBUaGUgc3lzY29uIHBhcnQgZG9lc24ndCBzZWVtIG9wdGlv
bmFsIGF0IGFsbC4KCk9LIGRvbmUuCgo+Cj4gWW91cnMsCj4gTGludXMgV2FsbGVpagoKLS0gCkdy
ZWdvcnkgQ2xlbWVudCwgRnJlZSBFbGVjdHJvbnMKS2VybmVsLCBkcml2ZXJzLCByZWFsLXRpbWUg
YW5kIGVtYmVkZGVkIExpbnV4CmRldmVsb3BtZW50LCBjb25zdWx0aW5nLCB0cmFpbmluZyBhbmQg
c3VwcG9ydC4KaHR0cDovL2ZyZWUtZWxlY3Ryb25zLmNvbQoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYXJtLWtlcm5lbCBtYWlsaW5nIGxpc3QK
bGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYXJtLWtlcm5lbAo=
