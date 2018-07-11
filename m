From: Ray Jui <ray.jui@broadcom.com>
Subject: Re: [PATCH -next] pinctrl: nsp: fix potential NULL dereference in
 nsp_pinmux_probe()
Date: Wed, 11 Jul 2018 10:11:38 -0700
Message-ID: <c0163341-1445-76e2-644f-22cab0735f82@broadcom.com>
References: <1531312461-134547-1-git-send-email-weiyongjun1@huawei.com>
 <7b4361a5-f757-179c-57b6-44359801baad@broadcom.com>
 <6c133df2-7dc7-d58b-297a-c27b87e7edd3@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <6c133df2-7dc7-d58b-297a-c27b87e7edd3@arm.com>
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
To: Sudeep Holla <sudeep.holla@arm.com>, Wei Yongjun <weiyongjun1@huawei.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Jon Mason <jonmason@broadcom.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-arm-kernel@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com
List-Id: linux-gpio@vger.kernel.org

CgpPbiA3LzExLzIwMTggMTA6MDEgQU0sIFN1ZGVlcCBIb2xsYSB3cm90ZToKPiAKPiAKPiBPbiAx
MS8wNy8xOCAxNzo0OCwgUmF5IEp1aSB3cm90ZToKPj4KPj4KPj4gT24gNy8xMS8yMDE4IDU6MzQg
QU0sIFdlaSBZb25nanVuIHdyb3RlOgo+Pj4gcGxhdGZvcm1fZ2V0X3Jlc291cmNlKCkgbWF5IGZh
aWwgYW5kIHJldHVybiBOVUxMLCBzbyB3ZSBzaG91bGQKPj4+IGJldHRlciBjaGVjayBpdCdzIHJl
dHVybiB2YWx1ZSB0byBhdm9pZCBhIE5VTEwgcG9pbnRlciBkZXJlZmVyZW5jZQo+Pj4gYSBiaXQg
bGF0ZXIgaW4gdGhlIGNvZGUuCj4+Pgo+Pj4gVGhpcyBpcyBkZXRlY3RlZCBieSBDb2NjaW5lbGxl
IHNlbWFudGljIHBhdGNoLgo+Pj4KPj4+IEBACj4+PiBleHByZXNzaW9uIHBkZXYsIHJlcywgbiwg
dCwgZSwgZTEsIGUyOwo+Pj4gQEAKPj4+Cj4+PiByZXMgPSBwbGF0Zm9ybV9nZXRfcmVzb3VyY2Uo
cGRldiwgdCwgbik7Cj4+PiArIGlmICghcmVzKQo+Pj4gK8KgwqAgcmV0dXJuIC1FSU5WQUw7Cj4+
PiAuLi4gd2hlbiAhPSByZXMgPT0gTlVMTAo+Pj4gZSA9IGRldm1faW9yZW1hcF9ub2NhY2hlKGUx
LCByZXMtPnN0YXJ0LCBlMik7Cj4+Pgo+Pj4gU2lnbmVkLW9mZi1ieTogV2VpIFlvbmdqdW4gPHdl
aXlvbmdqdW4xQGh1YXdlaS5jb20+Cj4+PiAtLS0KPj4KPj4gUmV2aWV3ZWQtYnk6IFJheSBKdWkg
PHJheS5qdWlAYnJvYWRjb20uY29tPgo+Pgo+PiBDaGFuZ2UgbG9va3MgZ29vZCB0byBtZSwgYWx0
aG91Z2ggdGhlIGNoZWNrIGNvdWxkIGhhdmUgYmVlbiBhdm9pZGVkIGlmCj4+ICdkZXZtX2lvcmVt
YXBfcmVzb3VyY2UnIGlzIHVzZWQgb24gdGhlIG5leHQgbGluZSBpbnN0ZWFkIG9mCj4+ICdkZXZt
X2lvcmVtYXBfbm9jYWNoZScsIHdoZXJlIHZhbGlkYXRpb24gb2YgcmVzb3VyY2UgcG9pbnRlciBp
cyBkb25lLgo+Pgo+PiBCdXQgdGhlcmUncyBwcm9iYWJseSBhIHJlYXNvbiB3aHkgJ2Rldm1faW9y
ZW1hcF9ub2NhY2hlJyB3YXMgdXNlZCBpbgo+PiB0aGlzIGNvZGUgaGVyZS4KPj4KPiAKPiBJIGFt
IG5vdCBzdXJlIGFib3V0IHRoYXQuIEJvdGggQVJNIGFuZCBBUk02NCBoYXMgc2FtZSBkZWZpbml0
aW9uIGFzCj4gaW9yZW1wLiBIb3dldmVyLCBhcmNoL2FybS9pbmNsdWRlL2FzbS9pby5oIGRvIG1l
bnRpb246Cj4gImlvcmVtYXBfbm9jYWNoZSgpIGlzIHRoZSBzYW1lIGFzIGlvcmVtYXAoKSBhcyB0
aGVyZSBhcmUgdG9vIG1hbnkgZGV2aWNlCj4gCj4gICBkcml2ZXJzIHVzaW5nIHRoaXMgZm9yIGRl
dmljZSByZWdpc3RlcnMsIGFuZCBkb2N1bWVudGF0aW9uIHdoaWNoIHRlbGxzCj4gCj4gICBwZW9w
bGUgdG8gdXNlIGl0IGZvciBzdWNoIGZvciB0aGlzIHRvIGJlIGFueSBkaWZmZXJlbnQuIgo+IAo+
IFlvdSBjb3VsZCB0ZWNobmljYWxseSB1c2UgZGV2bV9pb3JlbWFwX3Jlc291cmNlIGlmIHlvdSB3
YW50Lgo+IAoKSSBkaWQgbm90IG1lYW4gdGhlIGRpZmZlcmVuY2Ugb24gX25vY2FjaGUsIHdoaWNo
IEknbSBhd2FyZSBpdCdzIHRoZSBzYW1lIApvbiBBUk0vQVJNNjQgYmFzZWQgcGxhdGZvcm1zLgoK
SSBtZWFudCB0aGVyZSdzIGEgcmVhc29uIHdoeSB4eHhfcmVzb3VyY2Ugd2FzIG5vdCB1c2VkLCB3
aGljaCBpcyBtb3N0IApsaWtlbHkgZHVlIHRvIHNvbWUgcmVzb3VyY2UgY29uZmxpY3Qgd2l0aCBh
bm90aGVyIGRyaXZlciBvbiBOU1AuCgpSYXkKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LWFybS1rZXJuZWwgbWFpbGluZyBsaXN0CmxpbnV4LWFy
bS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFybS1rZXJuZWwK
