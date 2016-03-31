From: Martin Schiller <mschiller@tdt.de>
Subject: RE: [PATCH 3/3] pinctrl: lantiq: add a to_irq callback
Date: Thu, 31 Mar 2016 04:44:51 +0000
Message-ID: <165cccb7239e476e953c2e93d8aec9ce@TDT-MS.TDTNET.local>
References: <1451942879-43265-1-git-send-email-blogic@openwrt.org>
	<1451942879-43265-3-git-send-email-blogic@openwrt.org>
	<CACRpkda9mNt8XHhESpgmOFiRrRqMN14uHPmcXcrrJqe1=qxtWg@mail.gmail.com>
	<e607457b3c544ac69ba6295313f2af66@TDT-MS.TDTNET.local>
 <CACRpkdaqCdOC4w7n7oXTAoc6KgZjB1z+SNEEs4bEhObtPF+ntQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mxout51.expurgate.net ([194.37.255.51]:43073 "EHLO
	mxout51.expurgate.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751454AbcCaFXG (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 31 Mar 2016 01:23:06 -0400
In-Reply-To: <CACRpkdaqCdOC4w7n7oXTAoc6KgZjB1z+SNEEs4bEhObtPF+ntQ@mail.gmail.com>
Content-Language: de-DE
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: John Crispin <blogic@openwrt.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

SGkgTGludXMsDQoNCk9uIDAxLzA1LzIwMTYgYXQgMzoxOSBQTSwgTGludXMgV2FsbGVpaiB3cm90
ZToNCj4gT24gVHVlLCBKYW4gNSwgMjAxNiBhdCAxOjU5IFBNLCBNYXJ0aW4gU2NoaWxsZXIgPG1z
Y2hpbGxlckB0ZHQuZGU+IHdyb3RlOg0KPg0KPiA+IEFzIEkgc3VibWl0dGVkIHRoaXMgY2hhbmdl
IGEgZmV3IHdlZWtzIGFnbywgeW91IGFscmVhZHkgYXBwbGllZCB0aGlzIGluIHRoZQ0KPiBsaW51
eC1ncGlvIHRyZWUgaGVyZToNCj4gPiBodHRwczovL2dpdC5rZXJuZWwub3JnL2NnaXQvbGludXgv
a2VybmVsL2dpdC9saW51c3cvbGludXgtDQo+IGdwaW8uZ2l0L2NvbW1pdC9kcml2ZXJzL3BpbmN0
cmwvcGluY3RybC0NCj4geHdheS5jP2g9ZGV2ZWwmaWQ9M2U2NDA3NDNmZWU2ZTZhODJlYWQxZjE2
MzczNzc1NWIyYTk2NTcxMg0KPg0KPiBZZWFoIEkgbm90aWNlZC4uLi4gaGVoZSBpdCBibGV3IHVw
IGluIG15IGZhY2Ugd2hlbiBJIHRyaWVkIHRvIG1lcmdlDQo+IHRoZSBwaW4gY29udHJvbCBhbmQg
R1BJTyB0cmVlcyB0byBzZWUgd2hhdCBoYXBwZW5zIGluIExpbnV4LW5leHQuDQo+IEkgdGhpbmsg
SSBmaWd1cmVkIGl0IG91dCBub3cuLi4NCg0KSSB0aGluayB0aGVyZSBzdGlsbCB3ZW50IHNvbWV0
aGluZyB3cm9uZyB3aXRoIHRoaXMgY29tbWl0Og0KDQpJbiB0aGUgY29tbWl0IGxvZyB5b3UgY2Fu
IHNlZSB0aGF0IHRoaXMgY2hhbmdlcyBhcmUgYWRkZWQgb24gMjAxNS0xMi0xMCBhbmQNCnRoZW4g
cmV2ZXJ0ZWQgb24gMjAxNi0wMS0wNS4NCg0KLSBNYXJ0aW4NCg0K
