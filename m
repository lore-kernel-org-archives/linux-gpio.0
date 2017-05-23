From: "A.S. Dong" <aisheng.dong@nxp.com>
Subject: RE: [PATCH V2 0/5] pinctrl: imx: add generic pin config and imx7ulp
 support
Date: Tue, 23 May 2017 09:17:19 +0000
Message-ID: <DBXPR04MB320028F986D2E9B1FE1DDBB80F90@DBXPR04MB320.eurprd04.prod.outlook.com>
References: <1495177545-23006-1-git-send-email-aisheng.dong@nxp.com>
 <CACRpkdY2--+JCaPA0zBGrF66DwgOPd6m4=QvCgkO50x35TCzzw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-eopbgr30081.outbound.protection.outlook.com ([40.107.3.81]:61161
        "EHLO EUR03-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S935239AbdEWJRW (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 23 May 2017 05:17:22 -0400
In-Reply-To: <CACRpkdY2--+JCaPA0zBGrF66DwgOPd6m4=QvCgkO50x35TCzzw@mail.gmail.com>
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Shawn Guo <shawnguo@kernel.org>, Stefan Agner <stefan@agner.ch>, Jacky Bai <ping.bai@nxp.com>, Andy Duan <fugang.duan@nxp.com>, Sascha Hauer <kernel@pengutronix.de>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBMaW51cyBXYWxsZWlqIFttYWls
dG86bGludXMud2FsbGVpakBsaW5hcm8ub3JnXQ0KPiBTZW50OiBUdWVzZGF5LCBNYXkgMjMsIDIw
MTcgMzo0MSBQTQ0KPiBUbzogQS5TLiBEb25nDQo+IENjOiBsaW51eC1ncGlvQHZnZXIua2VybmVs
Lm9yZzsgbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnOw0KPiBTaGF3biBHdW87
IFN0ZWZhbiBBZ25lcjsgSmFja3kgQmFpOyBBbmR5IER1YW47IFNhc2NoYSBIYXVlcg0KPiBTdWJq
ZWN0OiBSZTogW1BBVENIIFYyIDAvNV0gcGluY3RybDogaW14OiBhZGQgZ2VuZXJpYyBwaW4gY29u
ZmlnIGFuZA0KPiBpbXg3dWxwIHN1cHBvcnQNCj4gDQo+IE9uIEZyaSwgTWF5IDE5LCAyMDE3IGF0
IDk6MDUgQU0sIERvbmcgQWlzaGVuZyA8YWlzaGVuZy5kb25nQG54cC5jb20+IHdyb3RlOg0KPiAN
Cj4gPiBUaGlzIHBhdGNoIHNlcmllcyBpbnRlbmRzIHRvIGFkZCB0aGUgZ2VuZXJpYyBwaW4gY29u
ZmlnIHN1cHBvcnQgZm9yDQo+ID4gaW14IHBsYXRmb3Jtcy4NCj4gDQo+IEkgYXBwbGllZCBwYXRj
aGVzIDEsMiwzIGFzIHlvdSd2ZSBzZWVuLCBzbyBwbGVhc2UgcmViYXNlIG9uIG15ICJkZXZlbCIN
Cj4gYnJhbmNoIGluIHBpbiBjb250cm9sIGFuZCBvbmx5IHJlc2VuZCB0aGUgdGhpbmdzIHdlIGFy
ZSBzdGlsbCBkaXNjdXNzaW5nLg0KPiANCg0KR290IGl0LCB0aGFua3MgZm9yIHRoZSByZW1pbmRl
ci4NCg0KPiBJIHNlZSB0aGVyZSBhcmUgc29tZSBvdGhlciBwYXRjaGVzIGZseWluZyBmb3IgaW14
IHBpbiBjb250cm9sIGFuZCBHUElPLCBpZg0KPiB0aGUgcGF0Y2hlcyBhcmUgZGVwZW5kZW50IG9u
IGVhY2ggb3RoZXIgY29uc2lkZXIgcHV0dGluZyBpdCBhbGwgaW50byBvbmUNCj4gc2VyaWVzLiBJ
ZiB0aGV5IGFyZSBub3QgZGVwZW5kZW50LCB0aGVuIGRvbid0Lg0KPiANCg0KSSB3aWxsIGNvbnNp
ZGVyIGl0Lg0KDQpSZWdhcmRzDQpEb25nIEFpc2hlbmcNCg==
