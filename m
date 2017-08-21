From: Bart Van Assche <Bart.VanAssche@wdc.com>
Subject: Re: [PATCH 1/4] bitops: Introduce assign_bit()
Date: Mon, 21 Aug 2017 16:18:44 +0000
Message-ID: <1503332323.2571.5.camel@wdc.com>
References: <cover.1503319573.git.lukas@wunner.de>
         <5487a5f7d1a4be1bb13e7d1f392281d18c0e935e.1503319573.git.lukas@wunner.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:65221 "EHLO
        esa4.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753684AbdHUQTe (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 21 Aug 2017 12:19:34 -0400
In-Reply-To: <5487a5f7d1a4be1bb13e7d1f392281d18c0e935e.1503319573.git.lukas@wunner.de>
Content-Language: en-US
Content-ID: <0427FB30D3CE494CBEEFC372E9EE16C4@namprd04.prod.outlook.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: "lukas@wunner.de" <lukas@wunner.de>, "linus.walleij@linaro.org" <linus.walleij@linaro.org>
Cc: "agk@redhat.com" <agk@redhat.com>, "phil@raspberrypi.org" <phil@raspberrypi.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "m.duckeck@kunbus.de" <m.duckeck@kunbus.de>, "snitzer@redhat.com" <snitzer@redhat.com>

T24gTW9uLCAyMDE3LTA4LTIxIGF0IDE1OjEyICswMjAwLCBMdWthcyBXdW5uZXIgd3JvdGU6DQo+
IFsgLi4uIF0NCj4gQ2M6IEJhcnQgVmFuIEFzc2NoZSA8YmFydC52YW5hc3NjaGVAd2RjLmNvbT4N
Cj4gQ2M6IEFsYXNkYWlyIEtlcmdvbiA8YWdrQHJlZGhhdC5jb20+DQo+IENjOiBNaWtlIFNuaXR6
ZXIgPHNuaXR6ZXJAcmVkaGF0LmNvbT4NCj4gU2lnbmVkLW9mZi1ieTogTHVrYXMgV3VubmVyIDxs
dWthc0B3dW5uZXIuZGU+DQoNClRoaXMgQ2MtbGlzdCBpcyBpbmNvbXBsZXRlLiBQcmV2aW91cyA8
bGludXgvYml0b3BzLmg+IHBhdGNoZXMgd2VudCBpbiB0aHJvdWdoDQpBbmRyZXcgTW9ydG9uJ3Mg
dHJlZSBzbyBJIHRoaW5rIGFuIGFjayBmcm9tIEFuZHJldyBNb3J0b24gaXMgbmVlZGVkIGJlZm9y
ZSB0aGlzDQpwYXRjaCBjYW4gYmUgc2VudCB0byBMaW51cyBUb3J2YWxkcy4gUGxlYXNlIGFsc28g
Q2Mgb3RoZXIgZnJlcXVlbnQgY29udHJpYnV0b3JzDQp0byB0aGlzIGhlYWRlciBmaWxlLCBlLmcu
IEluZ28gTW9sbmFyIGFuZCBQZXRlciBaaWpsc3RyYS4gUGxlYXNlIGFsc28gY29uc2lkZXINCnRv
IENjIHRoZSBMS01MIGZvciB0aGlzIHBhdGNoIG9yIGV2ZW4gZm9yIHRoZSBlbnRpcmUgc2VyaWVz
Lg0KDQo+ICsvKioNCj4gKyAqIGFzc2lnbl9iaXQgLSBBc3NpZ24gdmFsdWUgdG8gYSBiaXQgaW4g
bWVtb3J5DQo+ICsgKiBAdmFsdWU6IHRoZSB2YWx1ZSB0byBhc3NpZ24NCj4gKyAqIEBucjogdGhl
IGJpdCB0byBzZXQNCj4gKyAqIEBhZGRyOiB0aGUgYWRkcmVzcyB0byBzdGFydCBjb3VudGluZyBm
cm9tDQo+ICsgKi8NCj4gK3N0YXRpYyBfX2Fsd2F5c19pbmxpbmUgdm9pZCBhc3NpZ25fYml0KGJv
b2wgdmFsdWUsIGxvbmcgbnIsDQo+ICsJCQkJICAgICAgIHZvbGF0aWxlIHVuc2lnbmVkIGxvbmcg
KmFkZHIpDQo+ICt7DQo+ICsJaWYgKHZhbHVlKQ0KPiArCQlzZXRfYml0KG5yLCBhZGRyKTsNCj4g
KwllbHNlDQo+ICsJCWNsZWFyX2JpdChuciwgYWRkcik7DQo+ICt9DQo+ICsNCj4gK3N0YXRpYyBf
X2Fsd2F5c19pbmxpbmUgdm9pZCBfX2Fzc2lnbl9iaXQoYm9vbCB2YWx1ZSwgbG9uZyBuciwNCj4g
KwkJCQkJIHZvbGF0aWxlIHVuc2lnbmVkIGxvbmcgKmFkZHIpDQo+ICt7DQo+ICsJaWYgKHZhbHVl
KQ0KPiArCQlfX3NldF9iaXQobnIsIGFkZHIpOw0KPiArCWVsc2UNCj4gKwkJX19jbGVhcl9iaXQo
bnIsIGFkZHIpOw0KPiArfQ0KDQpXaHkgaGFzIF9fYWx3YXlzX2lubGluZSBiZWVuIHNwZWNpZmll
ZD8gV2hhdCBtYWtlcyB5b3UgdGhpbmsgdGhhdCB5b3Uga25vdw0KYmV0dGVyIHRoYW4gdGhlIGNv
bXBpbGVyIHdoZXRoZXIgb3Igbm90IHRoZXNlIGZ1bmN0aW9ucyBzaG91bGQgYmUgaW5saW5lZD8N
Cg0KVGhhbmtzLA0KDQpCYXJ0Lg==
