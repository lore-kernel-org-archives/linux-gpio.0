From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH] mfd: intel_soc_pmic_core: Terminate panel
 control GPIO lookup table correctly
Date: Wed, 4 May 2016 08:32:17 +0100
Message-ID: <20160504073217.GB1503@dell.home>
References: <1461353935-8078-1-git-send-email-ville.syrjala@linux.intel.com>
 <CACRpkdasFcEAzDtHGU+unrsstyX+o1Ft=HAh22Esm5Z3KZ=2ug@mail.gmail.com>
 <20160502081938.GG14148@phenom.ffwll.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <intel-gfx-bounces@lists.freedesktop.org>
Content-Disposition: inline
In-Reply-To: <20160502081938.GG14148@phenom.ffwll.local>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: Alexandre Courbot <gnurou@gmail.com>, Samuel Ortiz <sameo@linux.intel.com>, Shobhit Kumar <shobhit.kumar@intel.com>, Linus Walleij <linus.walleij@linaro.org>, stable <stable@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Thierry Reding <thierry.reding@gmail.com>, intel-gfx <intel-gfx@lists.freedesktop.org>
List-Id: linux-gpio@vger.kernel.org

T24gTW9uLCAwMiBNYXkgMjAxNiwgRGFuaWVsIFZldHRlciB3cm90ZToKCj4gT24gRnJpLCBBcHIg
MjksIDIwMTYgYXQgMTE6MzE6NDRBTSArMDIwMCwgTGludXMgV2FsbGVpaiB3cm90ZToKPiA+IE9u
IEZyaSwgQXByIDIyLCAyMDE2IGF0IDk6MzggUE0sICA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRl
bC5jb20+IHdyb3RlOgo+ID4gCj4gPiA+IEZyb206IFZpbGxlIFN5cmrDpGzDpCA8dmlsbGUuc3ly
amFsYUBsaW51eC5pbnRlbC5jb20+Cj4gPiA+Cj4gPiA+IEdQSU8gbG9va3VwIHRhYmxlcyBhcmUg
c3VwcG9zZWQgdG8gYmUgemVybyB0ZXJtaW5hdGVkLiBMZXQncyBkbyB0aGF0Cj4gPiA+IGFuZCBh
dm9pZCBhY2NpZGVudGFsbHkgd2Fsa2luZyBvZmYgdGhlIGVuZC4KPiA+ID4KPiA+ID4gQ2M6IFNo
b2JoaXQgS3VtYXIgPHNob2JoaXQua3VtYXJAaW50ZWwuY29tPgo+ID4gPiBDYzogU2FtdWVsIE9y
dGl6IDxzYW1lb0BsaW51eC5pbnRlbC5jb20+Cj4gPiA+IENjOiBMaW51cyBXYWxsZWlqIDxsaW51
cy53YWxsZWlqQGxpbmFyby5vcmc+Cj4gPiA+IENjOiBBbGV4YW5kcmUgQ291cmJvdCA8Z251cm91
QGdtYWlsLmNvbT4KPiA+ID4gQ2M6IFRoaWVycnkgUmVkaW5nIDx0aGllcnJ5LnJlZGluZ0BnbWFp
bC5jb20+Cj4gPiA+IENjOiBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5hcm8ub3JnPgo+ID4gPiBD
Yzogc3RhYmxlQHZnZXIua2VybmVsLm9yZwo+ID4gPiBGaXhlczogNjFkZDJjYTJkNDRlICgibWZk
OiBpbnRlbF9zb2NfcG1pY19jb3JlOiBBZGQgbG9va3VwIHRhYmxlIGZvciBQYW5lbCBDb250cm9s
IGFzIEdQSU8gc2lnbmFsIikKPiA+ID4gU2lnbmVkLW9mZi1ieTogVmlsbGUgU3lyasOkbMOkIDx2
aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KPiA+IAo+ID4gQWNrZWQtYnk6IExpbnVzIFdh
bGxlaWogPGxpbnVzLndhbGxlaWpAbGluYXJvLm9yZz4KPiAKPiBBcHBsaWVkIHRvIGRybS1pbnRl
bCB0cmVlcywgdGhhbmtzIGZvciBwYXRjaCwgcmV2aWV3cyZhY2tzLgoKRG8gd2hhdCBub3c/ICBI
b3cgY2FuIHlvdSBhcHBseSBhIHBhdGNoIGZvciBhIHN1YnN5c3RlbSB5b3UgZG9uJ3QgaGF2ZQpy
ZXNwb25zaWJpbGl0eSBmb3I/ICBUaGlzIGlzIGJvdW5kIHRvIGNhdXNlIG1lcmdlIGNvbmZsaWN0
cy4KCi0tIApMZWUgSm9uZXMKTGluYXJvIFNUTWljcm9lbGVjdHJvbmljcyBMYW5kaW5nIFRlYW0g
TGVhZApMaW5hcm8ub3JnIOKUgiBPcGVuIHNvdXJjZSBzb2Z0d2FyZSBmb3IgQVJNIFNvQ3MKRm9s
bG93IExpbmFybzogRmFjZWJvb2sgfCBUd2l0dGVyIHwgQmxvZwpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpJbnRlbC1nZnggbWFpbGluZyBsaXN0CkludGVs
LWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9pbnRlbC1nZngK
