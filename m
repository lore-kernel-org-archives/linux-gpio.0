From: "Gao, Bin" <bin.gao@intel.com>
Subject: RE: [PATCH v2 1/1] gpio: gpio-wcove: fix GPIO IRQ status mask
Date: Wed, 26 Apr 2017 16:42:02 +0000
Message-ID: <4460FA1017EA3844B646E90DA4E984057E358D94@ORSMSX112.amr.corp.intel.com>
References: <CAHp75VefVpwf-Ooom9Am3Gfmc8zR31fqWxTzYXest_+YTOk2yg@mail.gmail.com>
 <3257d22879148692da6887f89843389bd37ee877.1493060870.git.sathyanarayanan.kuppuswamy@linux.intel.com>
 <CACRpkda-GxRLJ=RHhDLRiu_ub=mpibQ7UPXg0=p-7jwJKpK5kg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga01.intel.com ([192.55.52.88]:56690 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751633AbdDZQmG (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 26 Apr 2017 12:42:06 -0400
In-Reply-To: <CACRpkda-GxRLJ=RHhDLRiu_ub=mpibQ7UPXg0=p-7jwJKpK5kg@mail.gmail.com>
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "sathyaosid@gmail.com" <sathyaosid@gmail.com>

T24gV2VkLCBBcHJpbCAyNiwgMjAxNyBhdCA3OjI2IEFNLCBMaW51cyBXYWxsZWlqIHdyb3RlOg0K
Pk9uIE1vbiwgQXByIDI0LCAyMDE3IGF0IDk6MTUgUE0sDQo+PHNhdGh5YW5hcmF5YW5hbi5rdXBw
dXN3YW15QGxpbnV4LmludGVsLmNvbT4gd3JvdGU6DQo+DQo+PiBGcm9tOiBLdXBwdXN3YW15IFNh
dGh5YW5hcmF5YW5hbiANCj4+IDxzYXRoeWFuYXJheWFuYW4ua3VwcHVzd2FteUBsaW51eC5pbnRl
bC5jb20+DQo+Pg0KPj4gQWNjb3JkaW5nIHRvIFdoaXNrZXkgQ292ZSBQTUlDIHNwZWMsIGJpdCA3
IG9mIEdQSU9JUlEwX1JFRyBiZWxvbmdzIHRvIA0KPj4gYmF0dGVyeSBJTy4gU28gd2Ugc2hvdWxk
IHNraXAgdGhpcyBiaXQgd2hlbiBjaGVja2luZyBmb3IgR1BJTyBJUlEgDQo+PiBwZW5kaW5nIHN0
YXR1cy4gT3RoZXJ3aXNlLCB3Y292ZV9ncGlvX2lycV9oYW5kbGVyKCkgbWlnaHQgZ28gaW50byB0
aGUgDQo+PiBpbmZpbml0ZSBsb29wIHVudGlsIElSUSAicGVuZGluZyIgc3RhdHVzIGJlY29tZXMg
MC4gVGhpcyBwYXRjaCBmaXhlcyB0aGlzIGlzc3VlLg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IEt1
cHB1c3dhbXkgU2F0aHlhbmFyYXlhbmFuIA0KPj4gPHNhdGh5YW5hcmF5YW5hbi5rdXBwdXN3YW15
QGxpbnV4LmludGVsLmNvbT4NCj4NCj5Mb29rcyBmaW5lIHRvIG1lLCB0ZW50YXRpdmVseSBhcHBs
aWVkLg0KPg0KPkJpbiwgTWlrYSwgQW5keSwgT0s/DQo+DQo+WW91cnMsDQo+TGludXMgV2FsbGVp
ag0KDQpMb29rcyByZWFzb25hYmxlIHRvIG1lLg0KDQpUaGFua3MsDQpCaW4NCg==
