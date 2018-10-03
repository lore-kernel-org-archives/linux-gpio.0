From: Leonard Crestez <leonard.crestez@nxp.com>
Subject: Re: [PATCH] ARM: dts: imx6sx-sdb: Fix enet phy regulator
Date: Wed, 3 Oct 2018 11:49:32 +0000
Message-ID: <234ccbfccc26701bd0b9fd9cf2ffb5ad2414adec.camel@nxp.com>
References: <1147be600733a1bcde194f7df61866019f34a531.1538504729.git.leonard.crestez@nxp.com>
         <CACRpkdajdjLUEwv8ABSBuy4dVMXqrUfxVDmu55aEiRAK877urQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdajdjLUEwv8ABSBuy4dVMXqrUfxVDmu55aEiRAK877urQ@mail.gmail.com>
Content-Language: en-US
Content-ID: <868ACE3B74A7CC49A72118AED41532BF@eurprd04.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "linus.walleij@linaro.org" <linus.walleij@linaro.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>
Cc: dl-linux-imx <linux-imx@nxp.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Andy Duan <fugang.duan@nxp.com>, Fabio Estevam <fabio.estevam@nxp.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "broonie@kernel.org" <broonie@kernel.org>, "lgirdwood@gmail.com" <lgirdwood@gmail.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "kernel@pengutronix.de" <kernel@pengutronix.de>
List-Id: linux-gpio@vger.kernel.org

T24gVHVlLCAyMDE4LTEwLTAyIGF0IDIxOjU2ICswMjAwLCBMaW51cyBXYWxsZWlqIHdyb3RlOg0K
PiBPbiBUdWUsIE9jdCAyLCAyMDE4IGF0IDg6MzcgUE0gTGVvbmFyZCBDcmVzdGV6IDwNCj4gbGVv
bmFyZC5jcmVzdGV6QG54cC5jb20+IHdyb3RlOg0KPiANCj4gPiBUaGlzIGlzc3VlIHdhcyBleHBv
c2VkIGJ5IGNvbW1pdCBlZmRmZWIwNzljYzMgKCJyZWd1bGF0b3I6IGZpeGVkOg0KPiA+IENvbnZl
cnQgdG8gdXNlIEdQSU8gZGVzY3JpcHRvciBvbmx5Iikgd2hpY2ggY2F1c2VzIHRoZSAiZ3Bpb3Mi
DQo+ID4gcHJvcGVydHkNCj4gPiB0byBhbHNvIGJlIHBhcnNlZC4gQmVmb3JlIHRoYXQgY29tbWl0
IHRoZSAiZ3Bpb3MiIHByb3BlcnR5IGhhZCBubw0KPiA+IGVmZmVjdCBhbmQgUEhZIHJlc2V0IHdh
cyBvbmx5IGhhbmRsZWQgaW4gdGhlIGJvb3Rsb2FkZXIuDQo+IA0KPiBXb3cgdGhhdCB3YXMgYSB2
ZXJ5IGludGVyZXN0aW5nIG9uZS4NCj4gVHVybmluZyBvdmVyIHRoZXNlIHN0b25lcyBzb21ldGlt
ZXMgZXhwb3NlIHRoZSB3ZWlyZGVzdA0KPiB0aGluZ3MuDQo+IA0KPiBUaGlzIGlzIG9uZSBvZiB0
aGUgcmVhc29ucyB3aHkgd2UgbmVlZCBmb3JtYWwgdmFsaWRhdGlvbiBvZg0KPiBEVFMgZmlsZXM6
IHRoaW5ncyBsb29rIE9LIHRvIHRoZSBodW1hbiBleWUgYW5kIGdldCBtZXJnZWQNCj4gYnV0IHRo
ZXkgYXJlIGp1c3Qgc3ludGFjdGljYWxseSB3cm9uZy4NCj4gDQo+IEkgZ3Vlc3MgSSBjb3VsZCBo
YWNrIHRvIG1ha2UgImdwaW9zIiBiZSBpZ25vcmVkIGJ5IHRoZQ0KPiByZWd1bGF0b3IgR1BJTyBx
dWlya3MgaW4gZ3Bpb2xpYiwgYnV0IEkgdGFrZSBpdCB5b3UgcHJvYmFibHkNCj4gcHJlZmVyIHRv
IGZpeCB1cCB0aGUgcmVhbCBpc3N1ZSBsaWtlIHRoaXMuDQoNCk1heWJlIHlvdSBjb3VsZCBkb2N1
bWVudCBpbiBmaXhlZC1yZWd1bGF0b3IgYmluZGluZ3MgdGhhdCBpdCBub3cNCnN1cHBvcnRzIHRo
ZSBzdGFuZGFyZCAiZ3Bpb3MiIHByb3BlcnR5IGFzIHdlbGw/IFRoZXJlIHN0aWxsIHNlZW1zIHRv
IGJlDQphIHJlc3RyaWN0aW9uIHRoYXQgdGhlIGxpc3QgbXVzdCBjb250YWluIGEgc2luZ2xlIGVs
ZW1lbnQuDQoNCkFueXdheSwgd2hhdCBteSBwYXRjaCBmaXhlcyBpcyBhIGJvYXJkLXNwZWNpZmlj
IGlzc3VlIHdoaWNoIGV4aXN0cyBldmVuDQpvdXRzaWRlIHlvdXIgcGF0Y2g6IHRoZSBlbmV0IHBo
eSByZWd1bGF0b3IgbmV2ZXIgd29ya2VkIGFzIGV4cGVjdGVkLg0KDQotLQ0KUmVnYXJkcywNCkxl
b25hcmQNCg==
