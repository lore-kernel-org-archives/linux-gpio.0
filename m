From: Krzysztof Halasa <khc@pm.waw.pl>
Subject: Re: [PATCH 1/3] IXP4xx: Fix Goramo Multilink GPIO conversion.
Date: Mon, 24 Mar 2014 21:36:25 +0100
Message-ID: <m3mwgf72ra.fsf@intrepid.localdomain>
References: <m3siq9iyt2.fsf@intrepid.localdomain>
 <m3bnwxiwhj.fsf@intrepid.localdomain>
 <CACRpkdaNdQjgAJv=mxn6MXS+kGKFoE4wmNHxYt_5WdM9sa6vxA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CACRpkdaNdQjgAJv=mxn6MXS+kGKFoE4wmNHxYt_5WdM9sa6vxA@mail.gmail.com>
 (Linus Walleij's message of "Mon, 24 Mar 2014 16:27:47 +0100")
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
Cc: Russell King - ARM Linux <linux@arm.linux.org.uk>, Arnd Bergmann <arnd@arndb.de>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "arm@kernel.org" <arm@kernel.org>, Simon =?utf-8?B?S8OlZ3N0csO2bQ==?= <simon.kagstrom@netinsight.net>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-gpio@vger.kernel.org

TGludXMgV2FsbGVpaiA8bGludXMud2FsbGVpakBsaW5hcm8ub3JnPiB3cml0ZXM6Cgo+PiBhcmNo
L2FybS9tYWNoLWl4cDR4eC9nb3JhbW9fbWxyLmM6NDE2OiBlcnJvcjogJ0lYUDRYWF9HUElPX09V
VCcgdW5kZWNsYXJlZAo+PiBhcmNoL2FybS9tYWNoLWl4cDR4eC9nb3JhbW9fbWxyLmM6NDIxOiBl
cnJvcjogJ0lYUDRYWF9HUElPX0lOJyB1bmRlY2xhcmVkCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEty
enlzenRvZiBIYcWCYXNhIDxraGNAcG0ud2F3LnBsPgo+Cj4gQWx0ZXJuYXRpdmVseSBjYW4geW91
IHNlbmQgdGhpcyBmb3IgZml4ZXMgdG8gYXJtQGtlcm5lbC5vcmcgd2l0aCBDYzoKPiBzdGFibGUg
YWRkZWQgS3J6eXN6dG9mPwoKR2l2ZW4gdGhlIHBsYXRmb3JtJ3Mgc3BlY2lmaWNzLCBJIGd1ZXNz
IGl0J3MgZW5vdWdoIHRvIGp1c3QgZml4IGl0IGluCm1haW5saW5lLgotLSAKS3J6eXN6dG9mIEhh
bGFzYQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtYXJtLWtlcm5lbCBtYWlsaW5nIGxpc3QKbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
YXJtLWtlcm5lbAo=
