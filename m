From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 1/3] IXP4xx: Fix Goramo Multilink GPIO conversion.
Date: Wed, 26 Mar 2014 23:06:43 +0100
Message-ID: <201403262306.43920.arnd@arndb.de>
References: <m3siq9iyt2.fsf@intrepid.localdomain>
 <m3bnwxiwhj.fsf@intrepid.localdomain>
 <CACRpkdaNdQjgAJv=mxn6MXS+kGKFoE4wmNHxYt_5WdM9sa6vxA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CACRpkdaNdQjgAJv=mxn6MXS+kGKFoE4wmNHxYt_5WdM9sa6vxA@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Russell King - ARM Linux <linux@arm.linux.org.uk>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "arm@kernel.org" <arm@kernel.org>, Simon =?utf-8?q?K=C3=A5gstr=C3=B6m?= <simon.kagstrom@netinsight.net>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Krzysztof Halasa <khc@pm.waw.pl>
List-Id: linux-gpio@vger.kernel.org

T24gTW9uZGF5IDI0IE1hcmNoIDIwMTQsIExpbnVzIFdhbGxlaWogd3JvdGU6Cj4gT24gU3VuLCBN
YXIgMjMsIDIwMTQgYXQgMTozNCBBTSwgS3J6eXN6dG9mIEhhbGFzYSA8a2hjQHBtLndhdy5wbD4g
d3JvdGU6Cj4gCj4gPiBhcmNoL2FybS9tYWNoLWl4cDR4eC9nb3JhbW9fbWxyLmM6IEluIGZ1bmN0
aW9uICdzZXRfc2NsJzoKPiA+IGFyY2gvYXJtL21hY2gtaXhwNHh4L2dvcmFtb19tbHIuYzo4Mjog
ZXJyb3I6IGltcGxpY2l0IGRlY2xhcmF0aW9uIG9mIGZ1bmN0aW9uICdncGlvX2xpbmVfc2V0Jwo+
ID4KPiA+IGFyY2gvYXJtL21hY2gtaXhwNHh4L2dvcmFtb19tbHIuYzogSW4gZnVuY3Rpb24gJ291
dHB1dF9jb250cm9sJzoKPiA+IGFyY2gvYXJtL21hY2gtaXhwNHh4L2dvcmFtb19tbHIuYzoxMTE6
IGVycm9yOiBpbXBsaWNpdCBkZWNsYXJhdGlvbiBvZiBmdW5jdGlvbiAnZ3Bpb19saW5lX2NvbmZp
ZycKPiA+IGFyY2gvYXJtL21hY2gtaXhwNHh4L2dvcmFtb19tbHIuYzoxMTE6IGVycm9yOiAnSVhQ
NFhYX0dQSU9fT1VUJyB1bmRlY2xhcmVkCj4gPgo+ID4gYXJjaC9hcm0vbWFjaC1peHA0eHgvZ29y
YW1vX21sci5jOiBJbiBmdW5jdGlvbiAnaHNzX2RjZF9pcnEnOgo+ID4gYXJjaC9hcm0vbWFjaC1p
eHA0eHgvZ29yYW1vX21sci5jOjE1NTogZXJyb3I6IGltcGxpY2l0IGRlY2xhcmF0aW9uIG9mIGZ1
bmN0aW9uICdncGlvX2xpbmVfZ2V0Jwo+ID4KPiA+IGFyY2gvYXJtL21hY2gtaXhwNHh4L2dvcmFt
b19tbHIuYzogSW4gZnVuY3Rpb24gJ2dtbHJfaW5pdCc6Cj4gPiBhcmNoL2FybS9tYWNoLWl4cDR4
eC9nb3JhbW9fbWxyLmM6NDE2OiBlcnJvcjogJ0lYUDRYWF9HUElPX09VVCcgdW5kZWNsYXJlZAo+
ID4gYXJjaC9hcm0vbWFjaC1peHA0eHgvZ29yYW1vX21sci5jOjQyMTogZXJyb3I6ICdJWFA0WFhf
R1BJT19JTicgdW5kZWNsYXJlZAo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IEtyenlzenRvZiBIYcWC
YXNhIDxraGNAcG0ud2F3LnBsPgo+IAo+IFJldmlld2VkLWJ5OiBMaW51cyBXYWxsZWlqIDxsaW51
cy53YWxsZWlqQGxpbmFyby5vcmc+Cj4gCj4gTWVhIGN1bHBhLgo+IAo+IEFybmQ6IGNhbiB5b3Ug
YXBwbHkgdGhpcyBvbmUgcGF0Y2ggZGlyZWN0bHkgZm9yIEFSTSBTb0MgZml4ZXMgYW5kCj4gQ2M6
IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcgb24gdGhpcyBvbmU/Cj4gCj4gQWx0ZXJuYXRpdmVseSBj
YW4geW91IHNlbmQgdGhpcyBmb3IgZml4ZXMgdG8gYXJtQGtlcm5lbC5vcmcgd2l0aCBDYzoKPiBz
dGFibGUgYWRkZWQgS3J6eXN6dG9mPwoKSSByZXZlcnRlZCBteSBlYXJsaWVyIHBhdGNoIGFuZCBh
cHBsaWVkIHRoaXMgaW5zdGVhZC4gVGhhbmtzIGEgbG90IQoKRGlkIG5vdCBhZGQgYSBzdGFibGUg
dGFnLCBhcyBzdWdnZXN0ZWQgYnkgS3J6eXN6dG9mLgoKCUFybmQKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFybS1rZXJuZWwgbWFpbGluZyBs
aXN0CmxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFybS1rZXJuZWwK
