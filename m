From: Sudeep Holla <sudeep.holla@arm.com>
Subject: Re: [PATCH -next] pinctrl: nsp: fix potential NULL dereference in
 nsp_pinmux_probe()
Date: Wed, 11 Jul 2018 18:01:07 +0100
Message-ID: <6c133df2-7dc7-d58b-297a-c27b87e7edd3@arm.com>
References: <1531312461-134547-1-git-send-email-weiyongjun1@huawei.com>
 <7b4361a5-f757-179c-57b6-44359801baad@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <7b4361a5-f757-179c-57b6-44359801baad@broadcom.com>
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
To: Ray Jui <ray.jui@broadcom.com>, Wei Yongjun <weiyongjun1@huawei.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Jon Mason <jonmason@broadcom.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, kernel-janitors@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Sudeep Holla <sudeep.holla@arm.com>
List-Id: linux-gpio@vger.kernel.org

CgpPbiAxMS8wNy8xOCAxNzo0OCwgUmF5IEp1aSB3cm90ZToKPiAKPiAKPiBPbiA3LzExLzIwMTgg
NTozNCBBTSwgV2VpIFlvbmdqdW4gd3JvdGU6Cj4+IHBsYXRmb3JtX2dldF9yZXNvdXJjZSgpIG1h
eSBmYWlsIGFuZCByZXR1cm4gTlVMTCwgc28gd2Ugc2hvdWxkCj4+IGJldHRlciBjaGVjayBpdCdz
IHJldHVybiB2YWx1ZSB0byBhdm9pZCBhIE5VTEwgcG9pbnRlciBkZXJlZmVyZW5jZQo+PiBhIGJp
dCBsYXRlciBpbiB0aGUgY29kZS4KPj4KPj4gVGhpcyBpcyBkZXRlY3RlZCBieSBDb2NjaW5lbGxl
IHNlbWFudGljIHBhdGNoLgo+Pgo+PiBAQAo+PiBleHByZXNzaW9uIHBkZXYsIHJlcywgbiwgdCwg
ZSwgZTEsIGUyOwo+PiBAQAo+Pgo+PiByZXMgPSBwbGF0Zm9ybV9nZXRfcmVzb3VyY2UocGRldiwg
dCwgbik7Cj4+ICsgaWYgKCFyZXMpCj4+ICvCoMKgIHJldHVybiAtRUlOVkFMOwo+PiAuLi4gd2hl
biAhPSByZXMgPT0gTlVMTAo+PiBlID0gZGV2bV9pb3JlbWFwX25vY2FjaGUoZTEsIHJlcy0+c3Rh
cnQsIGUyKTsKPj4KPj4gU2lnbmVkLW9mZi1ieTogV2VpIFlvbmdqdW4gPHdlaXlvbmdqdW4xQGh1
YXdlaS5jb20+Cj4+IC0tLQo+IAo+IFJldmlld2VkLWJ5OiBSYXkgSnVpIDxyYXkuanVpQGJyb2Fk
Y29tLmNvbT4KPiAKPiBDaGFuZ2UgbG9va3MgZ29vZCB0byBtZSwgYWx0aG91Z2ggdGhlIGNoZWNr
IGNvdWxkIGhhdmUgYmVlbiBhdm9pZGVkIGlmCj4gJ2Rldm1faW9yZW1hcF9yZXNvdXJjZScgaXMg
dXNlZCBvbiB0aGUgbmV4dCBsaW5lIGluc3RlYWQgb2YKPiAnZGV2bV9pb3JlbWFwX25vY2FjaGUn
LCB3aGVyZSB2YWxpZGF0aW9uIG9mIHJlc291cmNlIHBvaW50ZXIgaXMgZG9uZS4KPiAKPiBCdXQg
dGhlcmUncyBwcm9iYWJseSBhIHJlYXNvbiB3aHkgJ2Rldm1faW9yZW1hcF9ub2NhY2hlJyB3YXMg
dXNlZCBpbgo+IHRoaXMgY29kZSBoZXJlLgo+IAoKSSBhbSBub3Qgc3VyZSBhYm91dCB0aGF0LiBC
b3RoIEFSTSBhbmQgQVJNNjQgaGFzIHNhbWUgZGVmaW5pdGlvbiBhcwppb3JlbXAuIEhvd2V2ZXIs
IGFyY2gvYXJtL2luY2x1ZGUvYXNtL2lvLmggZG8gbWVudGlvbjoKImlvcmVtYXBfbm9jYWNoZSgp
IGlzIHRoZSBzYW1lIGFzIGlvcmVtYXAoKSBhcyB0aGVyZSBhcmUgdG9vIG1hbnkgZGV2aWNlCgog
ZHJpdmVycyB1c2luZyB0aGlzIGZvciBkZXZpY2UgcmVnaXN0ZXJzLCBhbmQgZG9jdW1lbnRhdGlv
biB3aGljaCB0ZWxscwoKIHBlb3BsZSB0byB1c2UgaXQgZm9yIHN1Y2ggZm9yIHRoaXMgdG8gYmUg
YW55IGRpZmZlcmVudC4iCgpZb3UgY291bGQgdGVjaG5pY2FsbHkgdXNlIGRldm1faW9yZW1hcF9y
ZXNvdXJjZSBpZiB5b3Ugd2FudC4KCi0tIApSZWdhcmRzLApTdWRlZXAKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFybS1rZXJuZWwgbWFpbGlu
ZyBsaXN0CmxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFybS1rZXJuZWwK
