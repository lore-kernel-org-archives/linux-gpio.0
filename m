From: Phil Edworthy <phil.edworthy@renesas.com>
Subject: RE: [PATCH v3 3/3] ARM: dts: r9a06g032: Add pinctrl node
Date: Wed, 19 Sep 2018 09:27:43 +0000
Message-ID: <TY1PR01MB1769B445E15C05F342ABCCACF51C0@TY1PR01MB1769.jpnprd01.prod.outlook.com>
References: <20180917163609.30457-1-phil.edworthy@renesas.com>
 <20180917163609.30457-4-phil.edworthy@renesas.com>
 <20180919091524.rgbk4m6ht34idkpd@verge.net.au>
 <TY1PR01MB17690D4C023EB9B4A5164A2AF51C0@TY1PR01MB1769.jpnprd01.prod.outlook.com>
 <CAMuHMdXhDcfXe7ohuO2s4MKHFPc-Z4TRjaTJv-MG0MHga=2viQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAMuHMdXhDcfXe7ohuO2s4MKHFPc-Z4TRjaTJv-MG0MHga=2viQ@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Simon Horman <horms@verge.net.au>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Jacopo Mondi <jacopo@jmondi.org>, Linus Walleij <linus.walleij@linaro.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

SGkgR2VlcnQsDQoNCk9uIDE5IFNlcHRlbWJlciAyMDE4IDEwOjI0IEdlZXJ0IFV5dHRlcmhvZXZl
biB3cm90ZToNCj4gT24gV2VkLCBTZXAgMTksIDIwMTggYXQgMTE6MTggQU0gUGhpbCBFZHdvcnRo
eSAgd3JvdGU6DQo+ID4gT24gMTkgU2VwdGVtYmVyIDIwMTggMTA6MTUgU2ltb24gSG9ybWFuIHdy
b3RlOg0KPiA+ID4gT24gTW9uLCBTZXAgMTcsIDIwMTggYXQgMDU6MzY6MDlQTSArMDEwMCwgUGhp
bCBFZHdvcnRoeSB3cm90ZToNCj4gPiA+ID4gVGhpcyBwcm92aWRlcyBhIHBpbmN0cmwgZHJpdmVy
IGZvciB0aGUgUmVuZXNhcyBSOUEwNkcwMzIgU29DDQo+ID4gPiA+DQo+ID4gPiA+IEJhc2VkIG9u
IGEgcGF0Y2ggb3JpZ2luYWxseSB3cml0dGVuIGJ5IE1pY2hlbCBQb2xsZXQgYXQgUmVuZXNhcy4N
Cj4gPiA+ID4NCj4gPiA+ID4gU2lnbmVkLW9mZi1ieTogUGhpbCBFZHdvcnRoeSA8cGhpbC5lZHdv
cnRoeUByZW5lc2FzLmNvbT4NCj4gPiA+DQo+ID4gPiBUaGFua3MgUGhpbCwgSSB3aWxsIGRlZmVy
IHRoaXMgcGF0Y2ggcGVuZGluZyBhY2NlcHRhbmNlIG9mIHRoZSBiaW5kaW5ncy4NCj4gPiA+IFBs
ZWFzZSBjb250aW51ZSB0byByZXBvc3QgdGhpcyBwYXRjaCB3aXRoIHVwZGF0ZXMgdG8gdGhlIGJp
bmRpbmdzIG9yDQo+ID4gPiBvdGhlcndpc2UgcGluZyBtZSBvbmNlIHRoZXkgaGF2ZSBiZWVuIGFj
Y2VwdGVkLg0KPiA+IFRoYW5rcywgaG93ZXZlciBJIHdpbGwgc2VuZCBhIG5ldyB2ZXJzaW9uIG9m
IHRoaXMgcGF0Y2ggdG8gcmVtb3ZlIHRoZQ0KPiA+IGNsb2NrLW5hbWVzIHByb3AgYXMgaXQgaXMg
bm90IG5lZWRlZC4NCj4gDQo+IEkgaGF2ZW4ndCByZXZpZXdlZCB0aGUgYmluZGluZ3MgcGF0Y2gg
eWV0LCBidXQgaXQncyBhIGdvb2QgaWRlYSB0byBoYXZlDQo+IGNsb2NrLW5hbWVzLCBldmVuIGZv
ciBhIHNpbmdsZSBjbG9jay4NCj4gSXQgbWFrZXMgbGlmZSBlYXNpZXIgaWYgdGhlIHNhbWUgbW9k
dWxlIGlzIHJldXNlZCBvciBlbmhhbmNlZCBpbiBhIGxhdGVyIFNvQywNCj4gd2l0aCBtb3JlIGNs
b2NrIGlucHV0cy4NCk9rLCBJJ2xsIHB1dCBpdCBiYWNrIDopDQoNCkkgc2hvdWxkIGJlIGFibGUg
dG8gZ2V0IGEgbmV3IHZlcnNpb24gb3V0IHRvZGF5IHNvIHlvdSBtYXkgd2FudCB0byBkZWxheQ0K
eW91ciByZXZpZXcgdW50aWwgdGhlbi4NCg0KVGhhbmtzDQpQaGlsDQo=
