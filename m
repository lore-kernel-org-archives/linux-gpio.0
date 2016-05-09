From: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH] mfd: intel_soc_pmic_core: Terminate panel
 control GPIO lookup table correctly
Date: Mon, 9 May 2016 08:57:03 +0200
Message-ID: <20160509065703.GL27098@phenom.ffwll.local>
References: <1461353935-8078-1-git-send-email-ville.syrjala@linux.intel.com>
 <CACRpkdasFcEAzDtHGU+unrsstyX+o1Ft=HAh22Esm5Z3KZ=2ug@mail.gmail.com>
 <20160502081938.GG14148@phenom.ffwll.local>
 <20160504073217.GB1503@dell.home>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <intel-gfx-bounces@lists.freedesktop.org>
Content-Disposition: inline
In-Reply-To: <20160504073217.GB1503@dell.home>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: Lee Jones <lee.jones@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, Samuel Ortiz <sameo@linux.intel.com>, Shobhit Kumar <shobhit.kumar@intel.com>, Linus Walleij <linus.walleij@linaro.org>, stable <stable@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Thierry Reding <thierry.reding@gmail.com>, intel-gfx <intel-gfx@lists.freedesktop.org>
List-Id: linux-gpio@vger.kernel.org

T24gV2VkLCBNYXkgMDQsIDIwMTYgYXQgMDg6MzI6MTdBTSArMDEwMCwgTGVlIEpvbmVzIHdyb3Rl
Ogo+IE9uIE1vbiwgMDIgTWF5IDIwMTYsIERhbmllbCBWZXR0ZXIgd3JvdGU6Cj4gCj4gPiBPbiBG
cmksIEFwciAyOSwgMjAxNiBhdCAxMTozMTo0NEFNICswMjAwLCBMaW51cyBXYWxsZWlqIHdyb3Rl
Ogo+ID4gPiBPbiBGcmksIEFwciAyMiwgMjAxNiBhdCA5OjM4IFBNLCAgPHZpbGxlLnN5cmphbGFA
bGludXguaW50ZWwuY29tPiB3cm90ZToKPiA+ID4gCj4gPiA+ID4gRnJvbTogVmlsbGUgU3lyasOk
bMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KPiA+ID4gPgo+ID4gPiA+IEdQSU8g
bG9va3VwIHRhYmxlcyBhcmUgc3VwcG9zZWQgdG8gYmUgemVybyB0ZXJtaW5hdGVkLiBMZXQncyBk
byB0aGF0Cj4gPiA+ID4gYW5kIGF2b2lkIGFjY2lkZW50YWxseSB3YWxraW5nIG9mZiB0aGUgZW5k
Lgo+ID4gPiA+Cj4gPiA+ID4gQ2M6IFNob2JoaXQgS3VtYXIgPHNob2JoaXQua3VtYXJAaW50ZWwu
Y29tPgo+ID4gPiA+IENjOiBTYW11ZWwgT3J0aXogPHNhbWVvQGxpbnV4LmludGVsLmNvbT4KPiA+
ID4gPiBDYzogTGludXMgV2FsbGVpaiA8bGludXMud2FsbGVpakBsaW5hcm8ub3JnPgo+ID4gPiA+
IENjOiBBbGV4YW5kcmUgQ291cmJvdCA8Z251cm91QGdtYWlsLmNvbT4KPiA+ID4gPiBDYzogVGhp
ZXJyeSBSZWRpbmcgPHRoaWVycnkucmVkaW5nQGdtYWlsLmNvbT4KPiA+ID4gPiBDYzogTGVlIEpv
bmVzIDxsZWUuam9uZXNAbGluYXJvLm9yZz4KPiA+ID4gPiBDYzogc3RhYmxlQHZnZXIua2VybmVs
Lm9yZwo+ID4gPiA+IEZpeGVzOiA2MWRkMmNhMmQ0NGUgKCJtZmQ6IGludGVsX3NvY19wbWljX2Nv
cmU6IEFkZCBsb29rdXAgdGFibGUgZm9yIFBhbmVsIENvbnRyb2wgYXMgR1BJTyBzaWduYWwiKQo+
ID4gPiA+IFNpZ25lZC1vZmYtYnk6IFZpbGxlIFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51
eC5pbnRlbC5jb20+Cj4gPiA+IAo+ID4gPiBBY2tlZC1ieTogTGludXMgV2FsbGVpaiA8bGludXMu
d2FsbGVpakBsaW5hcm8ub3JnPgo+ID4gCj4gPiBBcHBsaWVkIHRvIGRybS1pbnRlbCB0cmVlcywg
dGhhbmtzIGZvciBwYXRjaCwgcmV2aWV3cyZhY2tzLgo+IAo+IERvIHdoYXQgbm93PyAgSG93IGNh
biB5b3UgYXBwbHkgYSBwYXRjaCBmb3IgYSBzdWJzeXN0ZW0geW91IGRvbid0IGhhdmUKPiByZXNw
b25zaWJpbGl0eSBmb3I/ICBUaGlzIGlzIGJvdW5kIHRvIGNhdXNlIG1lcmdlIGNvbmZsaWN0cy4K
Ck9oIGNyYXAsIEkgdGhvdWdodCBMaW51cycgYWNrIHdhcyBmb3IgdGhlIG1mZCBzdHVmZiBhbmQg
ZGlkbid0IGJvdGhlcgpkb3VibGUtY2hlY2tpbmcgd2l0aCBNQUlOVEFJTlRFUlMuIFNob3VsZCBJ
IHRocm93IGl0IG91dCBhZ2FpbiBhbmQgeW91J2xsCnBpY2sgaXQgdXAsIG9yIG9rIGFzIHN1Y2g/
CgpUaGFua3MsIERhbmllbAotLSAKRGFuaWVsIFZldHRlcgpTb2Z0d2FyZSBFbmdpbmVlciwgSW50
ZWwgQ29ycG9yYXRpb24KaHR0cDovL2Jsb2cuZmZ3bGwuY2gKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KSW50ZWwtZ2Z4IG1haWxpbmcgbGlzdApJbnRlbC1n
ZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vaW50ZWwtZ2Z4Cg==
