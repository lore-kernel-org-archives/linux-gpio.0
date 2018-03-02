From: Alexandre Torgue <alexandre.torgue@st.com>
Subject: Re: [PATCH 2/2] ARM: pinctrl: stm32: Optimizes and enhances stm32gpio
 irqchip
Date: Fri, 2 Mar 2018 09:14:41 +0100
Message-ID: <3526aa4e-a7cb-4108-5449-d77ae5e355ba@st.com>
References: <1519221027-4028-1-git-send-email-radoslaw.pietrzyk@gmail.com>
 <1519221027-4028-3-git-send-email-radoslaw.pietrzyk@gmail.com>
 <CACRpkdbmmx7y3xJOOy0Dx62tMonkCgZeVzKYzr1B362QZe0fsA@mail.gmail.com>
 <CAFvLkMRRWZKqChFu+7yEDURtM_ZmmB1RMjj8yUwTZndiwySckA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAFvLkMRRWZKqChFu+7yEDURtM_ZmmB1RMjj8yUwTZndiwySckA@mail.gmail.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: =?UTF-8?Q?Rados=c5=82aw_Pietrzyk?= <radoslaw.pietrzyk@gmail.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>, Benjamin Gaignard <benjamin.gaignard@linaro.org>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, Thomas Gleixner <tglx@linutronix.de>, Linux ARM <linux-arm-kernel@lists.infradead.org>
List-Id: linux-gpio@vger.kernel.org

SGkgUmFkb3NsYXcgYW5kIExpbnVzLAoKCk9uIDAzLzAxLzIwMTggMTA6MjQgUE0sIFJhZG9zxYJh
dyBQaWV0cnp5ayB3cm90ZToKPiBJIGRvbid0IGtub3cgaWYgQWxleGFuZHJlIGFncmVlcyBidXQg
SXQgbWlnaHQgYmUgYmV0dGVyIHRvIHRha2UgdjIKPiB3aGVyZSBpcnFfYWNrIGlzIGFkZGVkLgoK
ClNvcnJ5IExpbnVzLCBJIGFncmVlIHdpdGggUm9kb3NsYXcsIHlvdSBuZWVkIHRvIHRha2UgVjIg
YXMgc3RtMzItZXh0aSAKcGF0Y2ggaXMgbGlua2VkIHRvIHBpbmN0cmwgdjIgcGF0Y2guIEkgZ29u
bmEgYWRkIG15IGFja2VkLWJ5LgoKUmVnYXJkcwpBbGV4Cgo+IAo+IDIwMTgtMDMtMDEgMjI6MDQg
R01UKzAxOjAwIExpbnVzIFdhbGxlaWogPGxpbnVzLndhbGxlaWpAbGluYXJvLm9yZz46Cj4+IE9u
IFdlZCwgRmViIDIxLCAyMDE4IGF0IDI6NTAgUE0sIFJhZG9zbGF3IFBpZXRyenlrCj4+IDxyYWRv
c2xhdy5waWV0cnp5a0BnbWFpbC5jb20+IHdyb3RlOgo+Pgo+Pj4gICAgICAgICAgLSByZW1vdmVz
IHVubmVlZGVkIGlycV9jaGlwLmlycV9lb2kgY2FsbGJhY2sKPj4+ICAgICAgICAgIC0gYWRkcyBp
cnFfY2hpcC5pcnFfc2V0X3dha2UgY2FsbGJhY2sgZm9yIHBvc3NpYmxlCj4+PiAgICAgICAgICBp
biB0aGUgZnV0dXJlIEdQSU8gd2FrZXVwCj4+Pgo+Pj4gU2lnbmVkLW9mZi1ieTogUmFkb3NsYXcg
UGlldHJ6eWsgPHJhZG9zbGF3LnBpZXRyenlrQGdtYWlsLmNvbT4KPj4KPj4gUGF0Y2ggYXBwbGll
ZCB3aXRoIEFsZXhhbmRyZSdzIEFDSywgc3RyaXBwaW5nIEFSTSBmcm9tIHRoZQo+PiBjb21taXQg
bWVzc2FnZSwgdGhhbmtzIQo+Pgo+PiBZb3VycywKPj4gTGludXMgV2FsbGVpagoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYXJtLWtlcm5lbCBt
YWlsaW5nIGxpc3QKbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYXJtLWtlcm5lbAo=
