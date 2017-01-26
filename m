From: "Shevchenko, Andriy" <andriy.shevchenko@intel.com>
Subject: Re: Suspicious debounce handling code in pintctrl-baytrail
Date: Thu, 26 Jan 2017 14:13:11 +0000
Message-ID: <1485439990.2133.343.camel@intel.com>
References: <20170126142020.7bfd1229@endymion>
         <20170126134341.GI17297@lahna.fi.intel.com>
         <20170126150046.2ca78ed6@endymion>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga07.intel.com ([134.134.136.100]:9876 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752531AbdAZONa (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 26 Jan 2017 09:13:30 -0500
In-Reply-To: <20170126150046.2ca78ed6@endymion>
Content-Language: en-US
Content-ID: <9F66BEFE3CB29B49A649D10198BDFD27@intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: "mika.westerberg@linux.intel.com" <mika.westerberg@linux.intel.com>, "jdelvare@suse.de" <jdelvare@suse.de>
Cc: "Ciocan, Cristina" <cristina.ciocan@intel.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linus.walleij@linaro.org" <linus.walleij@linaro.org>, "heikki.krogerus@linux.intel.com" <heikki.krogerus@linux.intel.com>

T24gVGh1LCAyMDE3LTAxLTI2IGF0IDE1OjAwICswMTAwLCBKZWFuIERlbHZhcmUgd3JvdGU6DQo+
IEhpIE1pa2EsIGhlbGxvIEFuZHksDQo+IA0KPiBPbiBUaHUsIDI2IEphbiAyMDE3IDE1OjQzOjQx
ICswMjAwLCBNaWthIFdlc3RlcmJlcmcgd3JvdGU6DQo+ID4gT24gVGh1LCBKYW4gMjYsIDIwMTcg
YXQgMDI6MjA6MjBQTSArMDEwMCwgSmVhbiBEZWx2YXJlIHdyb3RlOg0KDQo+IFRoYW5rcyBmb3Ig
dGhlIHBvaW50ZXIsIEkgd2Fzbid0IGF3YXJlIG9mIHRoYXQgcGF0Y2guIExvb2tzIG92ZXJhbGwN
Cj4gZ29vZCwgYnV0Og0KPiANCj4gKwkJCWNhc2UgMDoNCj4gKwkJCQljb25mICY9IEJZVF9ERUJP
VU5DRV9FTjsNCj4gKwkJCQlicmVhazsNCj4gDQo+IGxvb2tzIHN1c3BpY2lvdXMgdG8gbWUuIEkg
dGhpbmsgfkJZVF9ERUJPVU5DRV9FTiB3YXMgaW50ZW5kZWQ/DQoNClllcyENCg0KPiBGdXJ0aGVy
bW9yZSBJIHdvdWxkIGV4cGVjdCBjb25mIHw9IEJZVF9ERUJPVU5DRV9FTiBpbiB0aGUgb3RoZXIg
Y2FzZXMsDQo+IG90aGVyd2lzZSBkaXNhYmxpbmcgZGVib3VuY2Ugb25jZSB3aWxsIHByZXZlbnQg
eW91IGZyb20gZW5hYmxpbmcgaXQNCj4gZm9yZXZlci4NCg0KWWVzLg0KDQo+IEFsc28gQW5keSdz
IHBhdGNoIGRvZXNuJ3Qgc2VlbSB0byBhZGRyZXNzIG15IHNlY29uZCBwb2ludDoNCj4gDQo+ID4g
QWRkaXRpb25hbGx5LCBJIHN1c3BlY3QgdGhhdCBpbiB0aGUgImdldCIgcGF0aCwgdGhlIGZvbGxv
d2luZyBpcw0KPiA+IHdyb25nOg0KPiA+IA0KPiA+IAljYXNlIFBJTl9DT05GSUdfSU5QVVRfREVC
T1VOQ0U6DQo+ID4gCQlpZiAoIShjb25mICYgQllUX0RFQk9VTkNFX0VOKSkNCj4gPiAJCQlyZXR1
cm4gLUVJTlZBTDsNCj4gPiANCj4gPiBJJ20gbm90IGZhbWlsaWFyIHdpdGggdGhlIHBpbmN0cmwg
aW50ZXJmYWNlIGJ1dCBteSB1bmRlcnN0YW5kaW5nIG9mDQo+ID4gdGhlIFBJTl9DT05GSUdfSU5Q
VVRfREVCT1VOQ0UgZG9jdW1lbnRhdGlvbiBpcyB0aGF0IHRoZSBkcml2ZXIgbXVzdA0KPiA+IHJl
dHVybiAwIGlmIGRlYm91bmNpbmcgaXMgZGlzYWJsZWQuDQo+IA0KPiA/DQoNCkkgbmVlZCB0byBj
aGVjayB0aGlzLg0KDQpJIHdpbGwgYWRkcmVzcyB5b3VyIGNvbW1lbnRzLiBUaGFua3MgZm9yIHJl
cG9ydCENCg0KLS0gDQpBbmR5IFNoZXZjaGVua28gPGFuZHJpeS5zaGV2Y2hlbmtvQGludGVsLmNv
bT4NCkludGVsIEZpbmxhbmQgT3kgLSBCSUMgMDM1NzYwNi00IC0gV2VzdGVuZGlua2F0dSA3LCAw
MjE2MCBFc3Bvbw==
