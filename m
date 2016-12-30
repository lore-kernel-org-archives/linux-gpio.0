From: Tony Lindgren <tony@atomide.com>
Subject: Re: [linux-sunxi] [PATCH 1/2] drivers: pinctrl: add driver for
 Allwinner H5 SoC
Date: Fri, 30 Dec 2016 11:42:11 -0800
Message-ID: <20161230194210.GE3940@atomide.com>
References: <20161223125001.1176-1-icenowy@aosc.xyz>
 <1280f095-ab03-93f8-14d2-99d13ba1ce55@arm.com>
 <CACRpkdYQhfid3VRcaj=7as_+Zg=pX3Svp9FJ_W_Ft8nVuoZqKQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <CACRpkdYQhfid3VRcaj=7as_+Zg=pX3Svp9FJ_W_Ft8nVuoZqKQ@mail.gmail.com>
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
Cc: =?utf-8?B?QW5kcsOp?= Przywara <andre.przywara@arm.com>, linux-sunxi <linux-sunxi@googlegroups.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Chen-Yu Tsai <wens@csie.org>, Icenowy Zheng <icenowy@aosc.xyz>, Catalin Marinas <catalin.marinas@arm.com>, Maxime Ripard <maxime.ripard@free-electrons.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-gpio@vger.kernel.org

KiBMaW51cyBXYWxsZWlqIDxsaW51cy53YWxsZWlqQGxpbmFyby5vcmc+IFsxNjEyMzAgMDQ6NTZd
Ogo+IE9uIE1vbiwgRGVjIDI2LCAyMDE2IGF0IDM6MzMgUE0sIEFuZHLDqSBQcnp5d2FyYSA8YW5k
cmUucHJ6eXdhcmFAYXJtLmNvbT4gd3JvdGU6Cj4gCj4gPiBTbyB3aGlsZSB0aGlzIHBhdGNoIHRl
Y2huaWNhbGx5IGxvb2tzIGNvcnJlY3QsIEkgd2FzIHdvbmRlcmluZyBpZiB3ZQo+ID4gc2hvdWxk
IHJlYWxseSBleHBsb3JlIHRoZSBwb3NzaWJpbGl0eSBvZiBtYWtpbmcgdGhlIHdob2xlIG9mIHN1
bnhpCj4gPiBwaW5jdHJsIERUIGNvbnRyb2xsZWQuCj4gPiBJIGJyb3VnaHQgdGhpcyB1cCBhIHdo
aWxlIGFnbywgYnV0IHBlb3BsZSB3ZXJlbid0IG92ZXJseSBlbnRodXNpYXN0aWMKPiA+IGFib3V0
IGl0LCB0aG91Z2ggdGhlaXIgYXJndW1lbnQgd2VyZW4ndCByZWFsbHkgY29udmluY2luZyB0byBt
ZVsxXS4KPiA+Cj4gPiBTbzoKPiA+IEFzIHRoaXMgImRyaXZlciIgaGVyZSBpcyBiYXNpY2FsbHkg
YSB0YWJsZSBsaW5raW5nIEdQSU8gYml0IHNldHRpbmdzCj4gPiAodGhlIGFjdHVhbCBtdXggdmFs
dWUpIHRvIG5hbWVzIGFuZCBldmVyeSBwaW4gd2UgY2FyZSBhYm91dCBuZWVkcyB0byBiZQo+ID4g
ZW51bWVyYXRlZCBpbiB0aGUgRFQgYW55d2F5LCB3aHkgbm90IGp1c3QgYWRkIHNvbWV0aGluZyBs
aWtlOgo+ID4gYWxsd2lubmVyLHBpbm11eCA9IDw0PjsKPiA+IHRvIGVhY2ggcGluKGdyb3VwKSBp
biB0aGUgRFQgYW5kIGdldCByaWQgb2YgdGhpcyAiZHJpdmVyIiBmaWxlIGhlcmUKPiA+IGVudGly
ZWx5Pwo+IAo+IEknbSBvcGVuIHRvIHRoYXQgaWYgeW91IGNhbiB1c2UgcGluY3RybC1zaW5nbGUg
d2hpY2ggaXMgaW4gdGhlIGtlcm5lbAo+IGZvciB0aGlzIHB1cnBvc2Ugb25seSwgYW5kIGlzIHVz
ZWQgd2l0aCBib3RoIE9NQVBzIGFuZCBIaVNpbGljb24uCj4gCj4gSXQgcmVjZW50bHkgd2FzIGlt
cHJvdmVkIGFuZCB3aWxsIGJlIGltcHJvdmVkIG1vcmUgaW4gdGhpcyBjeWNsZSwKPiBzZWUgZm9y
IGV4YW1wbGU6Cj4gY29tbWl0IDQyMTI0YmM1OThmNjRmODRiMzMzNWQ1YTA1ODMwNDIwNzY5NWI4
NGYKPiBwaW5jdHJsOiBJbnRyb2R1Y2UgZ2VuZXJpYyAjcGluY3RybC1jZWxscyBhbmQgcGluY3Ry
bF9wYXJzZV9pbmRleF93aXRoX2FyZ3MKPiAKPiA+ICguLi4pIEFsc28gSSBndWVzcyB0aGUgY29t
bW9uIHN1bnhpCj4gPiBwaW5jdHJsIGRyaXZlciBjb2RlIG5lZWRzIHNvbWUgc2lnbmlmaWNhbnQg
cmV3b3JrLgo+IAo+IEkgd291bGQgZ3Vlc3MgaXMganVzdCBuZWVkcyByZXBsYWNpbmcgd2l0aCBw
aW5jdHJsLXNpbmdsZSBpbiB0aGF0IGNhc2UuCgpBbmQgaWYgcGluY3RybC1zaW5nbGUgd29uJ3Qg
d29yayB0aGVuIGl0IGlzIG5vdyBhbHNvIGJlIGVhc2llciB0byBtYWtlCmhhcmR3YXJlIHNwZWNp
ZmljIGRyaXZlcnMgdG9vIHVzaW5nICNwaW5jdHJsLWNlbGxzICsgR0VORVJJQ19QSU5DVFJMX0dS
T1VQUyArCkdFTkVSSUNfUElOTVVYX0ZVTkNUSU9OUy4KClJlZ2FyZHMsCgpUb255CgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYXJtLWtlcm5l
bCBtYWlsaW5nIGxpc3QKbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYXJtLWtlcm5lbAo=
