From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 4/6] gpio: gemini: rename to match
	Faraday IP
Date: Thu, 23 Mar 2017 13:47:20 +0100
Message-ID: <CACRpkdY0Nj19KgYXfs5GZQrbxSJ-6zZkdo+bYo7Ss_Qo7EgP_Q@mail.gmail.com>
References: <20170312232818.26304-1-linus.walleij@linaro.org>
 <20170312232818.26304-4-linus.walleij@linaro.org>
 <CACmBeS2OC6X_Rb5qaVEGMY4mPyHwnib-=pm-g=+73J6ZSRDgLw@mail.gmail.com>
 <CACRpkda0TpcUsEW6wiHzhueSckz_WTfbDgpixdgCNvodHDmpyw@mail.gmail.com>
 <CACmBeS23APp1=+0Cypyx9OujhekUTF7w5QbwE_9zt_go3GdUPw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <openwrt-devel-bounces@lists.openwrt.org>
In-Reply-To: <CACmBeS23APp1=+0Cypyx9OujhekUTF7w5QbwE_9zt_go3GdUPw@mail.gmail.com>
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

T24gV2VkLCBNYXIgMjIsIDIwMTcgYXQgMTE6MjEgQU0sIEpvbmFzIEplbnNlbiA8am9uYXMuamVu
c2VuQGdtYWlsLmNvbT4gd3JvdGU6Cj4gT24gMjIgTWFyY2ggMjAxNyBhdCAwOTo0MiwgTGludXMg
V2FsbGVpaiA8bGludXMud2FsbGVpakBsaW5hcm8ub3JnPiB3cm90ZToKCj4+IE5pY2UhIEhhdmUg
eW91IHRlc3RlZCBteSBuZXcgR1BJTyBjaGFyYWN0ZXIgZGV2aWNlIHRvb2xzIGZyb20KPj4gdG9v
bHMvZ3Bpby8qIGluIHRoZSBrZXJuZWwgdHJlZT8KPgo+IEkgaGFkIG5vdCBhbmQgdGhhbmtzIGZv
ciBwb2ludGluZyB0aGF0IG91dCwgbHNncGlvIGxpc3RzIGFsbCBhdmFpbGFibGUKPiBncGlvcyAo
dGhvdWdoIG1vc3Qgb2YgdGhlbSBhcmUgdW5uYW1lZCksIGFuZCBncGlvLWhhbW1lciBzdWNjZXNz
ZnVsbHkKPiB0b2dnbGVkIGJ1enplciBvbi9vZmYuCgpOaWNlLgoKPiBHUElPIGNoaXA6IGdwaW9j
aGlwMCwgIkZUR1BJTzAxMCIsIDMyIEdQSU8gbGluZXMKPiAgICAgICAgIGxpbmUgIDA6IHVubmFt
ZWQgdW51c2VkIFtvdXRwdXRdCj4gICAgICAgICBsaW5lICAxOiB1bm5hbWVkIHVudXNlZCBbb3V0
cHV0XQo+ICAgICAgICAgbGluZSAgMjogdW5uYW1lZCB1bnVzZWQgW291dHB1dF0KPiAgICAgICAg
IGxpbmUgIDM6IHVubmFtZWQgdW51c2VkIFtvdXRwdXRdCgpCVFcgeW91IGNhbiBuYW1lIGFsbCB0
aGUgInVubmFtZWQiIGxpbmVzIGJ5IHVzaW5nCmdwaW8tbGluZS1uYW1lcyBpbiB0aGUgZ3BpbyBu
b2RlIG9mIHRoZSBkZXZpY2UgdHJlZSwgYy5mLgpjb21taXQgM2ExNjg5ZWE3NTI0MzY5MTdjNWNl
NDQ4NzUyN2VkNmM0NDQ2MzBlZQoKPiAgICAgICAgIGxpbmUgMjQ6IHVubmFtZWQgdW51c2VkIFtv
dXRwdXRdCj4gICAgICAgICBsaW5lIDI1OiB1bm5hbWVkIHVudXNlZAo+ICAgICAgICAgbGluZSAy
NjogdW5uYW1lZCB1bnVzZWQKPiAgICAgICAgIGxpbmUgMjc6IHVubmFtZWQgInJlYWR5LWxlZCIg
W2tlcm5lbCBvdXRwdXQgYWN0aXZlLWxvd10KKC4uLikKPgo+IC4vZ3Bpby1oYW1tZXIgLW4gZ3Bp
b2NoaXAwIC1vIDI0Cj4gSGFtbWVyIGxpbmVzIFsyNF0gb24gZ3Bpb2NoaXAwLCBpbml0aWFsIHN0
YXRlczogWzBdCj4gW3xdIFsyNDogMV0KPgo+IC4vZ3Bpby1oYW1tZXIgLW4gZ3Bpb2NoaXAwIC1v
IDI3Cj4gRmFpbGVkIHRvIGlzc3VlIEdFVCBMSU5FSEFORExFIElPQ1RMICgtMTYpCgpTbyBmaW5h
bGx5IHdoZW4gdGhlIGtlcm5lbCBpcyB1c2luZyBhIEdQSU8gbGluZSB5b3UgY2FuJ3QgdXNlIGl0
CmZyb20gdXNlcnNwYWNlIGF0IHRoZSBzYW1lIHRpbWUuIC0xNiBpcyAtRUJVU1kuCgpZb3VycywK
TGludXMgV2FsbGVpagpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpvcGVud3J0LWRldmVsIG1haWxpbmcgbGlzdApvcGVud3J0LWRldmVsQGxpc3RzLm9wZW53
cnQub3JnCmh0dHBzOi8vbGlzdHMub3BlbndydC5vcmcvY2dpLWJpbi9tYWlsbWFuL2xpc3RpbmZv
L29wZW53cnQtZGV2ZWwK
