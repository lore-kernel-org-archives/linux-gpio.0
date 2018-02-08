From: "Wang, Dongsheng" <dongsheng.wang@hxt-semitech.com>
Subject: Re: Re: [PATCH] gpiolib: friendly debug information for consumer
Date: Thu, 8 Feb 2018 05:51:15 +0000
Message-ID: <em531be740-6077-46d0-a751-d73384bb1804@bjl0091>
References: <1516685317-12867-1-git-send-email-dongsheng.wang@hxt-semitech.com>
 <CACRpkdY+oF3atnuXZE2h_sdbiX5LMWZwvNEpJDvUuf0kx2pxPA@mail.gmail.com>
Reply-To: "Wang, Dongsheng" <dongsheng.wang@hxt-semitech.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mx01.hxt-semitech.com.96.203.223.in-addr.arpa ([223.203.96.7]:56085
        "EHLO barracuda.hxt-semitech.com" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1750793AbeBHFvJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 8 Feb 2018 00:51:09 -0500
In-Reply-To: <CACRpkdY+oF3atnuXZE2h_sdbiX5LMWZwvNEpJDvUuf0kx2pxPA@mail.gmail.com>
Content-Language: en-US
Content-ID: <4ECA248499FD81488D9A578F1B9E1A52@hxt-semitech.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Thierry Reding <treding@nvidia.com>, Grygorii Strashko <grygorii.strashko@ti.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

SGkgTGludXMsDQoNClRoYW5rcyBmb3IgeW91ciBmZWVkYmFjay4NCg0KT24gMjAxOC8yLzcgMjE6
MDQ6MDcsICJMaW51cyBXYWxsZWlqIiA8bGludXMud2FsbGVpakBsaW5hcm8ub3JnPiB3cm90ZToN
Cg0KPkhpIFdhbmcsDQo+DQo+dGhhbmsgeW91IGZvciB5b3VyIHBhdGNoIQ0KPg0KPk9uIFR1ZSwg
SmFuIDIzLCAyMDE4IGF0IDY6MjggQU0sIFdhbmcgRG9uZ3NoZW5nDQo+PGRvbmdzaGVuZy53YW5n
QGh4dC1zZW1pdGVjaC5jb20+IHdyb3RlOg0KPg0KPj5tZGlvYnVzIGFsd2F5cyB0cnkgdG8gZ2V0
ICJyZXNldCIgY29uc3VtZXIsIGJ1dCBub3QgYWxsIHBsYXRmb3Jtcw0KPj5oYXZlIHRoaXMgY2Fw
YWJpbGl0eS4gImZhaWxlZCIgbWFrZXMgb2JzZXJ2ZXIgY29uZnVzZSB3aGVuIGENCj4+Y29uc3Vt
ZXIgY2FuIG5vdCBmaW5kLg0KPj4NCj4+U2lnbmVkLW9mZi1ieTogV2FuZyBEb25nc2hlbmcgPGRv
bmdzaGVuZy53YW5nQGh4dC1zZW1pdGVjaC5jb20+DQo+DQo+QnV0IHRoZSBtZXNzYWdlIGlzIGNv
cnJlY3Q/DQo+DQo+Pi0gICAgICAgICAgICAgICBkZXZfZGJnKGRldiwgImxvb2t1cCBmb3IgR1BJ
TyAlcyBmYWlsZWRcbiIsIGNvbl9pZCk7DQo+DQo+VGhpcyBpcyBoYXBwZW5pbmcuDQo+DQo+SSB3
b3VsZCBiZSBtb3JlIGluY2xpbmVkIHRvIGFncmVlIGlmIGl0IHdhcyBkZXZfZXJyKCkgYnV0IHRo
aXMgaXMNCj5ub3QgZXZlbiBpbmZvLCBpdCBpcyBkZWJ1ZyBpbmZvLg0KPg0KZGV2X2RiZyBpcyBv
ZnRlbiB1c2VkIHdoZW4gd2UgZGV2ZWxvcCBjb2RlLiBJJ3ZlIGJlZW4gYXNrZWQgcmVjZW50bHkN
CmFib3V0IHRoaXMgR1BJTyAiZmFpbGVkIiwgYW5kIG90aGVycyBtYXkgYmUgbGVzcyBmYW1pbGlh
ciB3aXRoIEdQSU8uDQpJJ20gYWxzbyBub3QgZmFtaWxpYXIgd2l0aCBpdCwganVzdCBkbyBzb21l
IHF1aWNrIHJlc2VhcmNoIGhlcmUuIDopDQpTbyB0aGVtIGNvbmZ1c2Ugd2h5IGtlcm5lbCBnb3Qg
dGhpcy4gSW4gZmFjdCwgdGhlcmUgaXMgbm8gc3VjaCBHUElPDQpmZWF0dXJlKGV4dGVybmFsIFBI
WSByZXNldCBHUElPKSBvbiBvdXIgcGxhdGZvcm0uIFRoZXJlZm9yZSwgSSBwcmVmZXINCm5vdCB0
byB1c2UgdGhlIHdvcmQgImZhaWxlZCIuDQoNCk1heSBiZSAiTm8gR1BJTyBjb25zdW1lciAlcyBm
b3VuZCIgaXMgYmV0dGVyPw0KDQoNCkNoZWVycywNCi1Eb25nc2hlbmcNCg0KPg0KPj4rICAgICAg
ICAgICAgICAgZGV2X2RiZyhkZXYsICJDYW4gbm90IGRldGVjdCBHUElPIGNvbnN1bWVyICVzXG4i
LCANCj4+Y29uX2lkKTsNCj4NCj5UaGlzIGlzIG5vdCBhYm91dCBhbnkgImRldGVjdGlvbiIsIGl0
IGlzIGFib3V0IGxvb2tpbmcgc29tZXRoaW5nDQo+dXAuDQo+DQo+DQo+DQo+WW91cnMsDQo+TGlu
dXMgV2FsbGVpag==
