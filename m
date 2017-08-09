From: Timur Tabi <timur@codeaurora.org>
Subject: Re: [PATCH 2/3] [v3] pinctrl: qcom: disable GPIO groups with no pins
Date: Wed, 9 Aug 2017 14:02:42 -0500
Message-ID: <d0b16753-b202-5756-1cba-1cd083af52ed@codeaurora.org>
References: <1501179565-26466-1-git-send-email-timur@codeaurora.org>
 <1501179565-26466-3-git-send-email-timur@codeaurora.org>
 <CACRpkdZj+tnMcEpic6PrQS-qMJDodmc_uFJVudxc=USCTXpyKg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CACRpkdZj+tnMcEpic6PrQS-qMJDodmc_uFJVudxc=USCTXpyKg@mail.gmail.com>
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
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, David Brown <david.brown@linaro.org>, Andy Gross <andy.gross@linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-gpio@vger.kernel.org

T24gMDcvMzEvMjAxNyAwODozNiBBTSwgTGludXMgV2FsbGVpaiB3cm90ZToKPj4gVG8gc3VwcG9y
dCBzcGFyc2UgR1BJTyBtYXBzLCBwaW5jdHJsLW1zbSBjbGllbnQgZHJpdmVycyBjYW4gc3BlY2lm
eQo+PiB0aGF0IGEgZ2l2ZW4gR1BJTyBoYXMgYSBwaW4gY291bnQgb2YgemVyby4gIFRoZXNlIEdQ
SU9zIHdpbGwgYmUKPj4gY29uc2lkZXJlZCAiaGlkZGVuIi4gIEFueSBhdHRlbXB0IHRvIGNsYWlt
IHRoZSBHUElPIHdpbGwgZmFpbCwgYW5kIHRoZXkKPj4gd2lsbCBub3QgYmUgbGlzdGVkIGluIGRl
YnVnZnMuCj4+Cj4+IER1cmluZyBhIGtleGVjIHNodXRkb3duLCBtYWNoaW5lX2tleGVjX21hc2tf
aW50ZXJydXB0cygpIHdpbGwgYXR0ZW1wdAo+PiB0byBkaXNhYmxlIGFsbCBJUlFzLCBldmVuIHRo
b3NlIHRoYXQgYXJlbid0IGVuYWJsZWQuICBUaGlzIGluY2x1ZGVzCj4+IEdQSU9zIHRoYXQgYXJl
IHVuYXZhaWxhYmxlIChucGlucyA9PSAwKSwgc28gYWRkIGEgY2hlY2sgdG8gdGhlIGlycSBtYXNr
Cj4+IGFuZCB1bm1hc2sgZnVuY3Rpb25zLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBUaW11ciBUYWJp
PHRpbXVyQGNvZGVhdXJvcmEub3JnPgoKPiBJJ20gd2FpdGluZyBmb3IgQmrDtnJuJ3MgcmV2aWV3
IG9mIHRoZSB0d28gcmVtYWluaW5nIHBhdGNoZXMuCgpCasO2cm4sIGRvIHlvdSBoYXZlIHRpbWUg
dG8gcmV2aWV3IHRoZXNlIHBhdGNoZXM/ICBJJ20gaG9waW5nIHRvIGdldCB0aGVtIAppbnRvIDQu
MTQuCgotLSAKUXVhbGNvbW0gRGF0YWNlbnRlciBUZWNobm9sb2dpZXMsIEluYy4gYXMgYW4gYWZm
aWxpYXRlIG9mIFF1YWxjb21tClRlY2hub2xvZ2llcywgSW5jLiAgUXVhbGNvbW0gVGVjaG5vbG9n
aWVzLCBJbmMuIGlzIGEgbWVtYmVyIG9mIHRoZQpDb2RlIEF1cm9yYSBGb3J1bSwgYSBMaW51eCBG
b3VuZGF0aW9uIENvbGxhYm9yYXRpdmUgUHJvamVjdC4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFybS1rZXJuZWwgbWFpbGluZyBsaXN0Cmxp
bnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFybS1rZXJuZWwK
