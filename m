From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 4/6] gpio: gemini: rename to match
	Faraday IP
Date: Wed, 22 Mar 2017 09:42:48 +0100
Message-ID: <CACRpkda0TpcUsEW6wiHzhueSckz_WTfbDgpixdgCNvodHDmpyw@mail.gmail.com>
References: <20170312232818.26304-1-linus.walleij@linaro.org>
 <20170312232818.26304-4-linus.walleij@linaro.org>
 <CACmBeS2OC6X_Rb5qaVEGMY4mPyHwnib-=pm-g=+73J6ZSRDgLw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <openwrt-devel-bounces@lists.openwrt.org>
In-Reply-To: <CACmBeS2OC6X_Rb5qaVEGMY4mPyHwnib-=pm-g=+73J6ZSRDgLw@mail.gmail.com>
List-Unsubscribe: <https://lists.openwrt.org/cgi-bin/mailman/options/openwrt-devel>,
 <mailto:openwrt-devel-request@lists.openwrt.org?subject=unsubscribe>
List-Archive: <http://lists.openwrt.org/pipermail/openwrt-devel/>
List-Post: <mailto:openwrt-devel@lists.openwrt.org>
List-Help: <mailto:openwrt-devel-request@lists.openwrt.org?subject=help>
List-Subscribe: <https://lists.openwrt.org/cgi-bin/mailman/listinfo/openwrt-devel>,
 <mailto:openwrt-devel-request@lists.openwrt.org?subject=subscribe>
Errors-To: openwrt-devel-bounces@lists.openwrt.org
Sender: "openwrt-devel" <openwrt-devel-bounces@lists.openwrt.org>
To: Jonas Jensen <jonas.jensen@gmail.com>
Cc: openwrt-devel@openwrt.org, Alexandre Courbot <gnurou@gmail.com>, Paulius Zaleckas <paulius.zaleckas@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Janos Laube <janos.dev@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-gpio@vger.kernel.org

T24gVHVlLCBNYXIgMjEsIDIwMTcgYXQgMTE6NTkgQU0sIEpvbmFzIEplbnNlbiA8am9uYXMuamVu
c2VuQGdtYWlsLmNvbT4gd3JvdGU6Cgo+IFZlcmlmaWVkIG9uIFVDLTcxMTItTFggYnkgYnV6emlu
ZyB0aGUgYnV6emVyIGFuZCB3cml0aW5nIHRoZSBSVEMgKHNlZQo+IGxvZyBbMV0gZm9yIG5leHQt
MjAxNzAzMTApOgo+Cj4gWzFdIGh0dHBzOi8vYml0YnVja2V0Lm9yZy9LYXNyZXluL2xpbnV4LW5l
eHQvY29tbWl0cy9jNjNmM2MyMjE1ZjZmZDEwNmZmMGVjNmY5ODY0Yjg1YjdiZTU2NWFjCj4KPiBb
ICAgIDAuMDAwMDAwXSBMaW51eCB2ZXJzaW9uIDQuMTEuMC1yYzEtbmV4dC0yMDE3MDMxMC0wMDAw
NC1nYzYzZjNjMgo+IChpQGlsZGphcm4pIChnY2MgdmVyc2lvbiA0LjkuMSAoY3Jvc3N0b29sLU5H
IDEuMjAuMCkgKSAjNDQ2MSBQUkVFTVAKPiBUIFR1ZSBNYXIgMjEgMTE6NDM6MjkgQ0VUIDIwMTcK
PiAuLgo+IGVjaG8gMjQgPiAvc3lzL2NsYXNzL2dwaW8vZXhwb3J0Cj4gZWNobyBvdXQgPiAvc3lz
L2NsYXNzL2dwaW8vZ3BpbzI0L2RpcmVjdGlvbgo+IGVjaG8gMSA+IC9zeXMvY2xhc3MvZ3Bpby9n
cGlvMjQvdmFsdWUKPiBlY2hvIDAgPiAvc3lzL2NsYXNzL2dwaW8vZ3BpbzI0L3ZhbHVlCj4gLi4K
PiBkYXRlICslWSVtJWQlaCVtIC1zICIyMDEwMDEyMDIzMjMiCj4gaHdjbG9jayAtdwo+IHJlYm9v
dAo+IC4uCj4gWyAgICA0LjUyMDAwMF0gbW94YXJ0LXJ0YyA5MDAwMDAwMC5zb2M6cnRjOiBzZXR0
aW5nIHN5c3RlbSBjbG9jayB0bwo+IDIwMTAtMDEtMjAgMjM6MjM6MjAgVVRDICgxMjY0MDI5ODAw
KQoKTmljZSEgSGF2ZSB5b3UgdGVzdGVkIG15IG5ldyBHUElPIGNoYXJhY3RlciBkZXZpY2UgdG9v
bHMgZnJvbQp0b29scy9ncGlvLyogaW4gdGhlIGtlcm5lbCB0cmVlPwoKPiBUZXN0ZWQtYnk6IEpv
bmFzIEplbnNlbiA8am9uYXMuamVuc2VuQGdtYWlsLmNvbT4KClRoYW5rcyBtYW4uIEkgaGF2ZSBv
bmx5IGEgZmV3IG1vcmUgb3IgdGhlc2UsIEkgbWlnaHQgc2F2ZSBzb21lCmZvciB0aGUgbmV4dCBr
ZXJuZWwgY3ljbGUuIDspCgpZb3VycywKTGludXMgV2FsbGVpagpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpvcGVud3J0LWRldmVsIG1haWxpbmcgbGlzdApv
cGVud3J0LWRldmVsQGxpc3RzLm9wZW53cnQub3JnCmh0dHBzOi8vbGlzdHMub3BlbndydC5vcmcv
Y2dpLWJpbi9tYWlsbWFuL2xpc3RpbmZvL29wZW53cnQtZGV2ZWwK
