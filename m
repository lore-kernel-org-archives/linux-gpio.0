From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 08/50] pinctrl: berlin: Use devm_pinctrl_register() for
 pinctrl registration
Date: Wed, 24 Feb 2016 18:45:33 +0530
Message-ID: <1456319775-3216-9-git-send-email-ldewangan@nvidia.com>
References: <1456319775-3216-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1456319775-3216-1-git-send-email-ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, corbet-T1hC0tSOHrs@public.gmane.org, lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?q?Antoine=20T=C3=A9nart?= <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-gpio@vger.kernel.org

VXNlIGRldm1fcGluY3RybF9yZWdpc3RlcigpIGZvciBwaW4gY29udHJvbCByZWdpc3RyYXRpb24u
CgpTaWduZWQtb2ZmLWJ5OiBMYXhtYW4gRGV3YW5nYW4gPGxkZXdhbmdhbkBudmlkaWEuY29tPgpD
YzogQW50b2luZSBUw6luYXJ0IDxhbnRvaW5lLnRlbmFydEBmcmVlLWVsZWN0cm9ucy5jb20+Ci0t
LQogZHJpdmVycy9waW5jdHJsL2Jlcmxpbi9iZXJsaW4uYyB8IDMgKystCiAxIGZpbGUgY2hhbmdl
ZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9w
aW5jdHJsL2Jlcmxpbi9iZXJsaW4uYyBiL2RyaXZlcnMvcGluY3RybC9iZXJsaW4vYmVybGluLmMK
aW5kZXggNDZmMmI0OC4uMmQ1ODE2NiAxMDA2NDQKLS0tIGEvZHJpdmVycy9waW5jdHJsL2Jlcmxp
bi9iZXJsaW4uYworKysgYi9kcml2ZXJzL3BpbmN0cmwvYmVybGluL2Jlcmxpbi5jCkBAIC0zMTYs
NyArMzE2LDggQEAgaW50IGJlcmxpbl9waW5jdHJsX3Byb2JlX3JlZ21hcChzdHJ1Y3QgcGxhdGZv
cm1fZGV2aWNlICpwZGV2LAogCQlyZXR1cm4gcmV0OwogCX0KIAotCXBjdHJsLT5wY3RybF9kZXYg
PSBwaW5jdHJsX3JlZ2lzdGVyKCZiZXJsaW5fcGN0cmxfZGVzYywgZGV2LCBwY3RybCk7CisJcGN0
cmwtPnBjdHJsX2RldiA9IGRldm1fcGluY3RybF9yZWdpc3RlcihkZXYsICZiZXJsaW5fcGN0cmxf
ZGVzYywKKwkJCQkJCSBwY3RybCk7CiAJaWYgKElTX0VSUihwY3RybC0+cGN0cmxfZGV2KSkgewog
CQlkZXZfZXJyKGRldiwgImZhaWxlZCB0byByZWdpc3RlciBwaW5jdHJsIGRyaXZlclxuIik7CiAJ
CXJldHVybiBQVFJfRVJSKHBjdHJsLT5wY3RybF9kZXYpOwotLSAKMi4xLjQKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWls
aW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
