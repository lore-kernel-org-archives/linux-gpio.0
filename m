From: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH] mfd: intel_soc_pmic_core: Terminate panel
 control GPIO lookup table correctly
Date: Mon, 2 May 2016 10:19:38 +0200
Message-ID: <20160502081938.GG14148@phenom.ffwll.local>
References: <1461353935-8078-1-git-send-email-ville.syrjala@linux.intel.com>
 <CACRpkdasFcEAzDtHGU+unrsstyX+o1Ft=HAh22Esm5Z3KZ=2ug@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <intel-gfx-bounces@lists.freedesktop.org>
Content-Disposition: inline
In-Reply-To: <CACRpkdasFcEAzDtHGU+unrsstyX+o1Ft=HAh22Esm5Z3KZ=2ug@mail.gmail.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, Samuel Ortiz <sameo@linux.intel.com>, Shobhit Kumar <shobhit.kumar@intel.com>, intel-gfx <intel-gfx@lists.freedesktop.org>, stable <stable@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Lee Jones <lee.jones@linaro.org>
List-Id: linux-gpio@vger.kernel.org

T24gRnJpLCBBcHIgMjksIDIwMTYgYXQgMTE6MzE6NDRBTSArMDIwMCwgTGludXMgV2FsbGVpaiB3
cm90ZToKPiBPbiBGcmksIEFwciAyMiwgMjAxNiBhdCA5OjM4IFBNLCAgPHZpbGxlLnN5cmphbGFA
bGludXguaW50ZWwuY29tPiB3cm90ZToKPiAKPiA+IEZyb206IFZpbGxlIFN5cmrDpGzDpCA8dmls
bGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+Cj4gPgo+ID4gR1BJTyBsb29rdXAgdGFibGVzIGFy
ZSBzdXBwb3NlZCB0byBiZSB6ZXJvIHRlcm1pbmF0ZWQuIExldCdzIGRvIHRoYXQKPiA+IGFuZCBh
dm9pZCBhY2NpZGVudGFsbHkgd2Fsa2luZyBvZmYgdGhlIGVuZC4KPiA+Cj4gPiBDYzogU2hvYmhp
dCBLdW1hciA8c2hvYmhpdC5rdW1hckBpbnRlbC5jb20+Cj4gPiBDYzogU2FtdWVsIE9ydGl6IDxz
YW1lb0BsaW51eC5pbnRlbC5jb20+Cj4gPiBDYzogTGludXMgV2FsbGVpaiA8bGludXMud2FsbGVp
akBsaW5hcm8ub3JnPgo+ID4gQ2M6IEFsZXhhbmRyZSBDb3VyYm90IDxnbnVyb3VAZ21haWwuY29t
Pgo+ID4gQ2M6IFRoaWVycnkgUmVkaW5nIDx0aGllcnJ5LnJlZGluZ0BnbWFpbC5jb20+Cj4gPiBD
YzogTGVlIEpvbmVzIDxsZWUuam9uZXNAbGluYXJvLm9yZz4KPiA+IENjOiBzdGFibGVAdmdlci5r
ZXJuZWwub3JnCj4gPiBGaXhlczogNjFkZDJjYTJkNDRlICgibWZkOiBpbnRlbF9zb2NfcG1pY19j
b3JlOiBBZGQgbG9va3VwIHRhYmxlIGZvciBQYW5lbCBDb250cm9sIGFzIEdQSU8gc2lnbmFsIikK
PiA+IFNpZ25lZC1vZmYtYnk6IFZpbGxlIFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5p
bnRlbC5jb20+Cj4gCj4gQWNrZWQtYnk6IExpbnVzIFdhbGxlaWogPGxpbnVzLndhbGxlaWpAbGlu
YXJvLm9yZz4KCkFwcGxpZWQgdG8gZHJtLWludGVsIHRyZWVzLCB0aGFua3MgZm9yIHBhdGNoLCBy
ZXZpZXdzJmFja3MuCi1EYW5pZWwKLS0gCkRhbmllbCBWZXR0ZXIKU29mdHdhcmUgRW5naW5lZXIs
IEludGVsIENvcnBvcmF0aW9uCmh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkludGVsLWdmeCBtYWlsaW5nIGxpc3QKSW50
ZWwtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2ludGVsLWdmeAo=
