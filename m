From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: [PATCH 1/6] backlight: pwm_bl: Handle gpio that can sleep
Date: Wed, 31 Aug 2016 10:18:12 +0200
Message-ID: <20160831081817.5191-2-maxime.ripard@free-electrons.com>
References: <20160831081817.5191-1-maxime.ripard@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20160831081817.5191-1-maxime.ripard@free-electrons.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Linus Walleij <linus.walleij@linaro.org>, Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <maxime.ripard@free-electrons.com>, Jingoo Han <jingoohan1@gmail.com>, Lee Jones <lee.jones@linaro.org>, Tomi Valkeinen <tomi.valkeinen@ti.com>, Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>, Thierry Reding <thierry.reding@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-gpio@vger.kernel.org, Alexander Kaplan <alex@nextthing.co>, Mylene Josserand <mylene.josserand@free-electrons.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-gpio@vger.kernel.org

U29tZSBiYWNrbGlnaHQgR1BJT3MgbWlnaHQgYmUgY29ubmVjdGVkIHRvIHNvbWUgaTJjIGJhc2Vk
IGV4cGFuZGVycyB3aG9zZQphY2Nlc3MgbWlnaHQgc2xlZXAuCgpTaW5jZSBpdCdzIG5vdCBpbiBh
bnkgY3JpdGljYWwgcGF0aCwgdXNlIHRoZSBjYW5zbGVlcCB2YXJpYW50IG9mIHRoZSBHUElPCkFQ
SS4KClNpZ25lZC1vZmYtYnk6IE1heGltZSBSaXBhcmQgPG1heGltZS5yaXBhcmRAZnJlZS1lbGVj
dHJvbnMuY29tPgotLS0KIGRyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L3B3bV9ibC5jIHwgNCArKy0t
CiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L3B3bV9ibC5jIGIvZHJpdmVycy92aWRlby9i
YWNrbGlnaHQvcHdtX2JsLmMKaW5kZXggYjJiMzY2YmIwZjk3Li4xMjYxNDAwNjIxMWUgMTAwNjQ0
Ci0tLSBhL2RyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L3B3bV9ibC5jCisrKyBiL2RyaXZlcnMvdmlk
ZW8vYmFja2xpZ2h0L3B3bV9ibC5jCkBAIC01NSw3ICs1NSw3IEBAIHN0YXRpYyB2b2lkIHB3bV9i
YWNrbGlnaHRfcG93ZXJfb24oc3RydWN0IHB3bV9ibF9kYXRhICpwYiwgaW50IGJyaWdodG5lc3Mp
CiAJCWRldl9lcnIocGItPmRldiwgImZhaWxlZCB0byBlbmFibGUgcG93ZXIgc3VwcGx5XG4iKTsK
IAogCWlmIChwYi0+ZW5hYmxlX2dwaW8pCi0JCWdwaW9kX3NldF92YWx1ZShwYi0+ZW5hYmxlX2dw
aW8sIDEpOworCQlncGlvZF9zZXRfdmFsdWVfY2Fuc2xlZXAocGItPmVuYWJsZV9ncGlvLCAxKTsK
IAogCXB3bV9lbmFibGUocGItPnB3bSk7CiAJcGItPmVuYWJsZWQgPSB0cnVlOwpAQCAtNzAsNyAr
NzAsNyBAQCBzdGF0aWMgdm9pZCBwd21fYmFja2xpZ2h0X3Bvd2VyX29mZihzdHJ1Y3QgcHdtX2Js
X2RhdGEgKnBiKQogCXB3bV9kaXNhYmxlKHBiLT5wd20pOwogCiAJaWYgKHBiLT5lbmFibGVfZ3Bp
bykKLQkJZ3Bpb2Rfc2V0X3ZhbHVlKHBiLT5lbmFibGVfZ3BpbywgMCk7CisJCWdwaW9kX3NldF92
YWx1ZV9jYW5zbGVlcChwYi0+ZW5hYmxlX2dwaW8sIDApOwogCiAJcmVndWxhdG9yX2Rpc2FibGUo
cGItPnBvd2VyX3N1cHBseSk7CiAJcGItPmVuYWJsZWQgPSBmYWxzZTsKLS0gCjIuOS4yCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
