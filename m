From: David Wu <david.wu@rock-chips.com>
Subject: Re: [PATCH 1/2] pinctrl: rockchip: allow specifying the regmap
 location for pin-routes
Date: Wed, 14 Nov 2018 20:15:06 +0800
Message-ID: <62b7937e-0d7e-d142-285e-6dc15e6f5822@rock-chips.com>
References: <20181111210047.30375-1-heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="gbk"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20181111210047.30375-1-heiko@sntech.de>
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
To: Heiko Stuebner <heiko@sntech.de>, linus.walleij@linaro.org
Cc: linux-rockchip@lists.infradead.org, shawn.lin@rock-chips.com, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, =?UTF-8?B?6K645YmR576k?= <jay.xu@rock-chips.com>, linux-arm-kernel@lists.infradead.org, Heiko Stuebner <heiko.stuebner@bq.com>
List-Id: linux-gpio@vger.kernel.org

SGkgSGVpa28sCgrU2iAyMDE4LzExLzEyIMnPzuc1OjAwLCBIZWlrbyBTdHVlYm5lciDQtLXAOgo+
IEZyb206IEhlaWtvIFN0dWVibmVyPGhlaWtvLnN0dWVibmVyQGJxLmNvbT4KPiAKPiBSaWdodCBu
b3cgd2UgZXhwZWN0IHRoZSBwaW4tcm91bnRpbmcgc2V0dGluZ3MgdG8gYmUgaW4gdGhlIHNhbWUg
YXJlYQo+IGFzIHRoZSBpb211eCBzZXR0aW5nIGl0c2VsZi4gQW5kIHdoaWxlIHRoYXQgc2VlbXMg
dG8gYmUgdHJ1ZSBmb3IgYWxsCj4gbmV3ZXIgUm9ja2NoaXAgc29jcywgYmFjayBpbiB0aGUgd2ls
ZCB3ZXN0IGRheXMgb2Ygb2xkIHRoaXMgd2Fzbid0IHRydWUuCj4gCj4gTm93YWRheXMgcGluIHNl
dHRpbmdzIGluIHRoZSBHUkYgbm9ybWFsbHkgc3RheSBpbiB0aGUgR1JGIGFuZCB0aGUgc2FtZQo+
IGlzIHRydWUgZm9yIHBpbnMgY29uZmlndXJlZCBmcm9tIFBNVSByZWdpc3RlcnMuIEJ1dCBvbGQg
c29jcyBsaWtlIHRoZQo+IHJrMzE4OCByZWFsbHkgc3ByaW5rbGUgcGluIHNldHRpbmdzIHNvbWV3
aGF0IHJhbmRvbWx5IHRocm91Z2ggYm90aAo+IGZvciBpdHMgYmFuazAuCj4gCj4gVGhlcmVmb3Jl
IGFkZCB0aGUgb3B0aW9uIHRvIHNwZWNpZnkgYSBsb2NhdGlvbiBmb3IgdGhlIHJvdXRlIHNldHRp
bmcsCj4gc28gdGhhdCB3ZSBjYW4gbWFwIG9sZGVyIHNvY3MgY29ycmVjdGx5LiBXZSdsbCBrZWVw
ICJzYW1lIiBhcyB0aGUKPiBkZWZhdWx0LCBzbyB0aGF0IHdlIG9ubHkgbmVlZCB0byBzcGVjaWZ5
IGEgbG9jYXRpb24gaW4gdGhlIGNvcm5lci1jYXNlcwo+IGRlc2NyaWJlZCBhYm92ZS4KPiAKPiBT
aWduZWQtb2ZmLWJ5OiBIZWlrbyBTdHVlYm5lcjxoZWlrby5zdHVlYm5lckBicS5jb20+CgpWZXJ5
IGdvb2QsIGZvciB0aGUgbWl4ZWQgY2FzZSwgcmVhbGx5IG5lZWQgdG8gZG8gdGhlIHN1cHBsZW1l
bnQuCgpSZXZpZXdlZC1ieTogRGF2aWQgV3UgPGRhdmlkLnd1QHJvY2stY2hpcHMuY29tPgoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFybS1r
ZXJuZWwgbWFpbGluZyBsaXN0CmxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFybS1rZXJu
ZWwK
