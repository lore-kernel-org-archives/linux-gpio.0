From: Martin Schiller <mschiller@tdt.de>
Subject: RE: [PATCH 3/3] pinctrl: lantiq: add a to_irq callback
Date: Tue, 5 Jan 2016 12:59:25 +0000
Message-ID: <e607457b3c544ac69ba6295313f2af66@TDT-MS.TDTNET.local>
References: <1451942879-43265-1-git-send-email-blogic@openwrt.org>
	<1451942879-43265-3-git-send-email-blogic@openwrt.org>
 <CACRpkda9mNt8XHhESpgmOFiRrRqMN14uHPmcXcrrJqe1=qxtWg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mxout51.expurgate.net ([91.198.224.51]:42914 "EHLO
	mxout51.expurgate.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751434AbcAENid (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 5 Jan 2016 08:38:33 -0500
In-Reply-To: <CACRpkda9mNt8XHhESpgmOFiRrRqMN14uHPmcXcrrJqe1=qxtWg@mail.gmail.com>
Content-Language: de-DE
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, John Crispin <blogic@openwrt.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

T24gMDEvMDUvMjAxNiBhdCAxMToxMCBBTSwgTGludXMgV2FsbGVpaiB3cm90ZToNCj4gT24gTW9u
LCBKYW4gNCwgMjAxNiBhdCAxMDoyNyBQTSwgSm9obiBDcmlzcGluIDxibG9naWNAb3BlbndydC5v
cmc+DQo+IHdyb3RlOg0KPg0KPiA+IFRoZSBjYWxsYmFjayBpcyBtaXNzaW5nIHNvIGxldHMgYWRk
IGl0Lg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogSm9obiBDcmlzcGluIDxibG9naWNAb3Blbndy
dC5vcmc+DQo+DQo+IFRoYW5rcyENCj4NCj4gPiArICAgICAgIHJldHVybiAtMTsNCj4gPiArfQ0K
Pg0KPiBJIGNoYW5nZWQgdGhpcyB0byByZXR1cm4gMCBiZWNhdXNlIG9mIHRoaXM6DQo+IGh0dHA6
Ly9sd24ubmV0L0FydGljbGVzLzQ3MDgyMC8NCj4NCj4gUGF0Y2ggYXBwbGllZCB3aXRoIHRoZSBh
Ym92ZSBjaGFuZ2UuDQo+DQo+IFlvdXJzLA0KPiBMaW51cyBXYWxsZWlqDQoNCkBMaW51czoNCkFz
IEkgc3VibWl0dGVkIHRoaXMgY2hhbmdlIGEgZmV3IHdlZWtzIGFnbywgeW91IGFscmVhZHkgYXBw
bGllZCB0aGlzIGluIHRoZSBsaW51eC1ncGlvIHRyZWUgaGVyZToNCmh0dHBzOi8vZ2l0Lmtlcm5l
bC5vcmcvY2dpdC9saW51eC9rZXJuZWwvZ2l0L2xpbnVzdy9saW51eC1ncGlvLmdpdC9jb21taXQv
ZHJpdmVycy9waW5jdHJsL3BpbmN0cmwteHdheS5jP2g9ZGV2ZWwmaWQ9M2U2NDA3NDNmZWU2ZTZh
ODJlYWQxZjE2MzczNzc1NWIyYTk2NTcxMg0KDQo=
