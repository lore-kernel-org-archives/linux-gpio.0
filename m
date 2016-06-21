From: "Tan, Jui Nee" <jui.nee.tan@intel.com>
Subject: RE: [PATCH v3 1/3] pinctrl/broxton: enable platform device in the
 absent of ACPI enumeration
Date: Tue, 21 Jun 2016 05:02:57 +0000
Message-ID: <0158A29DB680F54A88142ED28D55B1D008244AE1@PGSMSX107.gar.corp.intel.com>
References: <1465282553-28396-1-git-send-email-jui.nee.tan@intel.com>
 <1465282553-28396-2-git-send-email-jui.nee.tan@intel.com>
 <CACRpkdbdVNH+3KPHPX6ZytkvHH_-jdc1gja2f9NbEdTq=89aiA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga02.intel.com ([134.134.136.20]:5447 "EHLO mga02.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753540AbcFUFDY (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Tue, 21 Jun 2016 01:03:24 -0400
In-Reply-To: <CACRpkdbdVNH+3KPHPX6ZytkvHH_-jdc1gja2f9NbEdTq=89aiA@mail.gmail.com>
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, "x86@kernel.org" <x86@kernel.org>, "ptyser@xes-inc.com" <ptyser@xes-inc.com>, Lee Jones <lee.jones@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Yong, Jonathan" <jonathan.yong@intel.com>, "Yu, Ong Hock" <ong.hock.yu@intel.com>, "Voon, Weifeng" <weifeng.voon@intel.com>, "Wan Mohamad, Wan Ahmad Zainie" <wan.ahmad.zainie.wan.mohamad@intel.com>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTGludXMgV2FsbGVpaiBb
bWFpbHRvOmxpbnVzLndhbGxlaWpAbGluYXJvLm9yZ10NCj4gU2VudDogVHVlc2RheSwgSnVuZSAx
NCwgMjAxNiAzOjA5IFBNDQo+IFRvOiBUYW4sIEp1aSBOZWUgPGp1aS5uZWUudGFuQGludGVsLmNv
bT4NCj4gQ2M6IE1pa2EgV2VzdGVyYmVyZyA8bWlrYS53ZXN0ZXJiZXJnQGxpbnV4LmludGVsLmNv
bT47IEhlaWtraSBLcm9nZXJ1cw0KPiA8aGVpa2tpLmtyb2dlcnVzQGxpbnV4LmludGVsLmNvbT47
IEFuZHkgU2hldmNoZW5rbw0KPiA8YW5kcml5LnNoZXZjaGVua29AbGludXguaW50ZWwuY29tPjsg
VGhvbWFzIEdsZWl4bmVyDQo+IDx0Z2x4QGxpbnV0cm9uaXguZGU+OyBJbmdvIE1vbG5hciA8bWlu
Z29AcmVkaGF0LmNvbT47IEguIFBldGVyIEFudmluDQo+IDxocGFAenl0b3IuY29tPjsgeDg2QGtl
cm5lbC5vcmc7IHB0eXNlckB4ZXMtaW5jLmNvbTsgTGVlIEpvbmVzDQo+IDxsZWUuam9uZXNAbGlu
YXJvLm9yZz47IGxpbnV4LWdwaW9Admdlci5rZXJuZWwub3JnOyBsaW51eC0NCj4ga2VybmVsQHZn
ZXIua2VybmVsLm9yZzsgWW9uZywgSm9uYXRoYW4gPGpvbmF0aGFuLnlvbmdAaW50ZWwuY29tPjsg
WXUsDQo+IE9uZyBIb2NrIDxvbmcuaG9jay55dUBpbnRlbC5jb20+OyBWb29uLCBXZWlmZW5nDQo+
IDx3ZWlmZW5nLnZvb25AaW50ZWwuY29tPjsgV2FuIE1vaGFtYWQsIFdhbiBBaG1hZCBaYWluaWUN
Cj4gPHdhbi5haG1hZC56YWluaWUud2FuLm1vaGFtYWRAaW50ZWwuY29tPg0KPiBTdWJqZWN0OiBS
ZTogW1BBVENIIHYzIDEvM10gcGluY3RybC9icm94dG9uOiBlbmFibGUgcGxhdGZvcm0gZGV2aWNl
IGluIHRoZQ0KPiBhYnNlbnQgb2YgQUNQSSBlbnVtZXJhdGlvbg0KPiANCj4gT24gVHVlLCBKdW4g
NywgMjAxNiBhdCA4OjU1IEFNLCBUYW4gSnVpIE5lZSA8anVpLm5lZS50YW5AaW50ZWwuY29tPiB3
cm90ZToNCj4gDQo+ID4gVGhpcyBpcyB0byBjYXRlciB0aGUgbmVlZCBmb3Igbm9uLUFDUEkgc3lz
dGVtIHdoZXJlYnkgYSBwbGF0Zm9ybQ0KPiA+IGRldmljZSBoYXMgdG8gYmUgY3JlYXRlZCBpbiBv
cmRlciB0byBiaW5kIHdpdGggdGhlIEFwb2xsbyBMYWtlIFBpbmN0cmwNCj4gPiBHUElPIHBsYXRm
b3JtIGRyaXZlci4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFRhbiBKdWkgTmVlIDxqdWkubmVl
LnRhbkBpbnRlbC5jb20+DQo+IA0KPiBZb3UgZm9yZ290IHRvIHB1dCBtZSBvbiB0aGUgVG86IGxp
bmUgZm9yIHRoZSBwYXRjaCBzbyBpdCdzIG9ubHkgbHVjayB0aGF0IEkgc2F3IGl0Lg0KPiAoRXZl
cnkgb25jZSBvbiBhIGJsdWUgbW9vbiBJIHJlYWQgdGhlIGxpbnV4LWdwaW8gbGlzdCBkaXJlY3Rs
eS4uLikNCj4gDQo+IFBhdGNoIGFwcGxpZWQgd2l0aCBNaWthJ3MgQUNLLg0KPiANCj4gWW91cnMs
DQo+IExpbnVzIFdhbGxlaWoNCk9oLCBJJ20gc29ycnkuIEkgd2lsbCBhZGQgeW91ciBuYW1lIGlu
IHRoZSBzdWJzZXF1ZW50IHBhdGNoL21haWwuIA0K
