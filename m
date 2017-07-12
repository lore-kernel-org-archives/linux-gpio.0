From: "A.s. Dong" <aisheng.dong@nxp.com>
Subject: RE: [PATCH V4 0/7] pinctrl: imx: add imx7ulp pinctrl support
Date: Wed, 12 Jul 2017 13:54:47 +0000
Message-ID: <AM3PR04MB30694430A0C0AA437DA1CE680AF0@AM3PR04MB306.eurprd04.prod.outlook.com>
References: <1498046395-30001-1-git-send-email-aisheng.dong@nxp.com>
 <AM3PR04MB306A0A86603EF133C37852480D60@AM3PR04MB306.eurprd04.prod.outlook.com>
 <CACRpkdbeqiGJAD5idGPJXpN2VEnOVnExzHripnfFwaneRHAuGA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-eopbgr30069.outbound.protection.outlook.com ([40.107.3.69]:23683
        "EHLO EUR03-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1752305AbdGLNyu (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 12 Jul 2017 09:54:50 -0400
In-Reply-To: <CACRpkdbeqiGJAD5idGPJXpN2VEnOVnExzHripnfFwaneRHAuGA@mail.gmail.com>
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "stefan@agner.ch" <stefan@agner.ch>, Jacky Bai <ping.bai@nxp.com>, Andy Duan <fugang.duan@nxp.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBMaW51cyBXYWxsZWlqIFttYWls
dG86bGludXMud2FsbGVpakBsaW5hcm8ub3JnXQ0KPiBTZW50OiBXZWRuZXNkYXksIEp1bHkgMTIs
IDIwMTcgODowMCBQTQ0KPiBUbzogQS5zLiBEb25nDQo+IENjOiBsaW51eC1hcm0ta2VybmVsQGxp
c3RzLmluZnJhZGVhZC5vcmc7IHNoYXduZ3VvQGtlcm5lbC5vcmc7DQo+IHN0ZWZhbkBhZ25lci5j
aDsgSmFja3kgQmFpOyBBbmR5IER1YW47IGtlcm5lbEBwZW5ndXRyb25peC5kZTsgbGludXgtDQo+
IGdwaW9Admdlci5rZXJuZWwub3JnDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggVjQgMC83XSBwaW5j
dHJsOiBpbXg6IGFkZCBpbXg3dWxwIHBpbmN0cmwgc3VwcG9ydA0KPiANCj4gT24gTW9uLCBKdWwg
MywgMjAxNyBhdCAxMjozNiBQTSwgQS5zLiBEb25nIDxhaXNoZW5nLmRvbmdAbnhwLmNvbT4gd3Jv
dGU6DQo+IA0KPiA+IElzIHRoZSBzZXJpZXMgZ290IG1pc3NlZD8NCj4gPg0KPiA+IEkgc2F3IHlv
dSBvbmx5IHBpY2tlZCB0aGUgcmV2aXNlZCBwYXRjaCAxLg0KPiA+DQo+ID4gT3IgZG8gSSBuZWVk
IHJlc2VuZCBpdD8NCj4gDQo+IENhbiB5b3UgcGxlYXNlOg0KPiANCj4gLSBSZWJhc2Ugb24gdjQu
MTMtcmMxIG9uY2UgaXQgaXMgb3V0DQo+IA0KPiAtIEluY2x1ZGUgdGhlIGV4cGxpY2l0IEFDS3Mg
ZnJvbSBTaGF3biBhbmQgU3RlcGhhbiBBZ25lciBvbg0KPiAgIHRoZSBwYXRjaGVzLCBhbHNvIG1h
a2Ugc3VyZSBhbGwgcGF0Y2hlcyBoYXZlIEFDS3MuDQo+IA0KDQpPZiBjb3Vyc2UuDQpFeGNlcHQg
dHdvIG5ldyBpbnRyb2R1Y2VkIHBhdGNoZXMoUGF0Y2ggMyBhbmQgNykgaW4gdGhpcyBzZXJpZXMu
DQpBbGwgaGF2ZSBBQ0tzIGFscmVhZHkuDQoNClJlZ2FyZHMNCkRvbmcgQWlzaGVuZw0KDQo+IEkg
YW0gc29ycnkgaWYgSSBtaXNzZWQgaXQsIGl0IG1heSBiZSBkdWUgdG8gdGhhdCBJIGhhZCBhIGhh
cmQgdGltZSB0byBzZWUNCj4gd2hpY2ggcGF0Y2hlcyB3ZXJlIEFDS2VkIGFuZCBub3QuDQo+IA0K
PiBZb3VycywNCj4gTGludXMgV2FsbGVpag0K
