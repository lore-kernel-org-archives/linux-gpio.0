From: Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [PATCH] mfd: intel_soc_pmic_core: Terminate
	panel	control GPIO lookup table correctly
Date: Mon, 25 Apr 2016 10:40:57 +0300
Message-ID: <8737qam8za.fsf@intel.com>
References: <1461353935-8078-1-git-send-email-ville.syrjala@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <intel-gfx-bounces@lists.freedesktop.org>
In-Reply-To: <1461353935-8078-1-git-send-email-ville.syrjala@linux.intel.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: ville.syrjala@linux.intel.com, linux-gpio@vger.kernel.org
Cc: Alexandre Courbot <gnurou@gmail.com>, Samuel Ortiz <sameo@linux.intel.com>, Shobhit Kumar <shobhit.kumar@intel.com>, intel-gfx@lists.freedesktop.org, stable@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>, Lee Jones <lee.jones@linaro.org>, Linus Walleij <linus.walleij@linaro.org>
List-Id: linux-gpio@vger.kernel.org

T24gRnJpLCAyMiBBcHIgMjAxNiwgdmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20gd3JvdGU6
Cj4gRnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4K
Pgo+IEdQSU8gbG9va3VwIHRhYmxlcyBhcmUgc3VwcG9zZWQgdG8gYmUgemVybyB0ZXJtaW5hdGVk
LiBMZXQncyBkbyB0aGF0Cj4gYW5kIGF2b2lkIGFjY2lkZW50YWxseSB3YWxraW5nIG9mZiB0aGUg
ZW5kLgo+Cj4gQ2M6IFNob2JoaXQgS3VtYXIgPHNob2JoaXQua3VtYXJAaW50ZWwuY29tPgo+IENj
OiBTYW11ZWwgT3J0aXogPHNhbWVvQGxpbnV4LmludGVsLmNvbT4KPiBDYzogTGludXMgV2FsbGVp
aiA8bGludXMud2FsbGVpakBsaW5hcm8ub3JnPgo+IENjOiBBbGV4YW5kcmUgQ291cmJvdCA8Z251
cm91QGdtYWlsLmNvbT4KPiBDYzogVGhpZXJyeSBSZWRpbmcgPHRoaWVycnkucmVkaW5nQGdtYWls
LmNvbT4KPiBDYzogTGVlIEpvbmVzIDxsZWUuam9uZXNAbGluYXJvLm9yZz4KPiBDYzogc3RhYmxl
QHZnZXIua2VybmVsLm9yZwo+IEZpeGVzOiA2MWRkMmNhMmQ0NGUgKCJtZmQ6IGludGVsX3NvY19w
bWljX2NvcmU6IEFkZCBsb29rdXAgdGFibGUgZm9yIFBhbmVsIENvbnRyb2wgYXMgR1BJTyBzaWdu
YWwiKQo+IFNpZ25lZC1vZmYtYnk6IFZpbGxlIFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51
eC5pbnRlbC5jb20+CgpSZXZpZXdlZC1ieTogSmFuaSBOaWt1bGEgPGphbmkubmlrdWxhQGludGVs
LmNvbT4KCj4gLS0tCj4gIGRyaXZlcnMvbWZkL2ludGVsX3NvY19wbWljX2NvcmUuYyB8IDEgKwo+
ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L21mZC9pbnRlbF9zb2NfcG1pY19jb3JlLmMgYi9kcml2ZXJzL21mZC9pbnRlbF9zb2NfcG1pY19j
b3JlLmMKPiBpbmRleCBkOWUxNWNmN2M2YzguLjEyZDZlYmI0YWU1ZCAxMDA2NDQKPiAtLS0gYS9k
cml2ZXJzL21mZC9pbnRlbF9zb2NfcG1pY19jb3JlLmMKPiArKysgYi9kcml2ZXJzL21mZC9pbnRl
bF9zb2NfcG1pY19jb3JlLmMKPiBAQCAtMzUsNiArMzUsNyBAQCBzdGF0aWMgc3RydWN0IGdwaW9k
X2xvb2t1cF90YWJsZSBwYW5lbF9ncGlvX3RhYmxlID0gewo+ICAJLnRhYmxlID0gewo+ICAJCS8q
IFBhbmVsIEVOL0RJU0FCTEUgKi8KPiAgCQlHUElPX0xPT0tVUCgiZ3Bpb19jcnlzdGFsY292ZSIs
IDk0LCAicGFuZWwiLCBHUElPX0FDVElWRV9ISUdIKSwKPiArCQl7IH0sCj4gIAl9LAo+ICB9OwoK
LS0gCkphbmkgTmlrdWxhLCBJbnRlbCBPcGVuIFNvdXJjZSBUZWNobm9sb2d5IENlbnRlcgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpJbnRlbC1nZnggbWFp
bGluZyBsaXN0CkludGVsLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1nZngK
