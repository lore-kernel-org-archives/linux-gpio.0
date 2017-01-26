From: "Shevchenko, Andriy" <andriy.shevchenko@intel.com>
Subject: Re: Suspicious debounce handling code in pintctrl-baytrail
Date: Thu, 26 Jan 2017 14:15:21 +0000
Message-ID: <1485440121.2133.344.camel@intel.com>
References: <20170126142020.7bfd1229@endymion>
         <20170126134341.GI17297@lahna.fi.intel.com>
         <20170126150046.2ca78ed6@endymion> <1485439990.2133.343.camel@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga03.intel.com ([134.134.136.65]:32586 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752030AbdAZOPY (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 26 Jan 2017 09:15:24 -0500
In-Reply-To: <1485439990.2133.343.camel@intel.com>
Content-Language: en-US
Content-ID: <6D3B3B9E3745B042BD9C11FF5A8EBE5C@intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: "mika.westerberg@linux.intel.com" <mika.westerberg@linux.intel.com>, "jdelvare@suse.de" <jdelvare@suse.de>
Cc: "Ciocan, Cristina" <cristina.ciocan@intel.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linus.walleij@linaro.org" <linus.walleij@linaro.org>, "heikki.krogerus@linux.intel.com" <heikki.krogerus@linux.intel.com>

T24gVGh1LCAyMDE3LTAxLTI2IGF0IDE2OjEzICswMjAwLCBBbmR5IFNoZXZjaGVua28gd3JvdGU6
DQo+IE9uIFRodSwgMjAxNy0wMS0yNiBhdCAxNTowMCArMDEwMCwgSmVhbiBEZWx2YXJlIHdyb3Rl
Og0KPiA+IEhpIE1pa2EsIGhlbGxvIEFuZHksDQo+ID4gDQoNCj4gPiBBZGRpdGlvbmFsbHksIEkg
c3VzcGVjdCB0aGF0IGluIHRoZSAiZ2V0IiBwYXRoLCB0aGUgZm9sbG93aW5nIGlzDQo+ID4gPiB3
cm9uZzoNCj4gPiA+IA0KPiA+ID4gCWNhc2UgUElOX0NPTkZJR19JTlBVVF9ERUJPVU5DRToNCj4g
PiA+IAkJaWYgKCEoY29uZiAmIEJZVF9ERUJPVU5DRV9FTikpDQo+ID4gPiAJCQlyZXR1cm4gLUVJ
TlZBTDsNCj4gPiA+IA0KPiA+ID4gSSdtIG5vdCBmYW1pbGlhciB3aXRoIHRoZSBwaW5jdHJsIGlu
dGVyZmFjZSBidXQgbXkgdW5kZXJzdGFuZGluZw0KPiA+ID4gb2YNCj4gPiA+IHRoZSBQSU5fQ09O
RklHX0lOUFVUX0RFQk9VTkNFIGRvY3VtZW50YXRpb24gaXMgdGhhdCB0aGUgZHJpdmVyDQo+ID4g
PiBtdXN0DQo+ID4gPiByZXR1cm4gMCBpZiBkZWJvdW5jaW5nIGlzIGRpc2FibGVkLg0KPiA+IA0K
PiA+ID8NCg0KTm8sIHRoaXMgaXMgY29ycmVjdC4NCiIuLi5pZiBpdCBpcyBhdmFpbGFibGUgYnV0
IGRpc2FibGVkIGl0IHNob3VsZCByZXR1cm4gLUVJTlZBTCINCg0KLS0gDQpBbmR5IFNoZXZjaGVu
a28gPGFuZHJpeS5zaGV2Y2hlbmtvQGludGVsLmNvbT4NCkludGVsIEZpbmxhbmQgT3kgLSBCSUMg
MDM1NzYwNi00IC0gV2VzdGVuZGlua2F0dSA3LCAwMjE2MCBFc3Bvbw==
