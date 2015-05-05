From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH 19/27] staging: fbtft: Allow compile test of GPIO consumers if
 !GPIOLIB
Date: Tue,  5 May 2015 18:32:35 +0200
Message-ID: <1430843563-18615-19-git-send-email-geert@linux-m68k.org>
References: <1430836404-15513-1-git-send-email-geert@linux-m68k.org>
 <1430843563-18615-1-git-send-email-geert@linux-m68k.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <1430843563-18615-1-git-send-email-geert@linux-m68k.org>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Arnd Bergmann <arnd@arndb.de>
Cc: devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>, Geert Uytterhoeven <geert@linux-m68k.org>
List-Id: linux-gpio@vger.kernel.org

VGhlIEdQSU8gc3Vic3lzdGVtIHByb3ZpZGVzIGR1bW15IEdQSU8gY29uc3VtZXIgZnVuY3Rpb25z
IGlmIEdQSU9MSUIgaXMKbm90IGVuYWJsZWQuIEhlbmNlIGRyaXZlcnMgdGhhdCBkZXBlbmQgb24g
R1BJT0xJQiwgYnV0IHVzZSBHUElPIGNvbnN1bWVyCmZ1bmN0aW9uYWxpdHkgb25seSwgY2FuIHN0
aWxsIGJlIGNvbXBpbGVkIGlmIEdQSU9MSUIgaXMgbm90IGVuYWJsZWQuCgpSZWxheCB0aGUgZGVw
ZW5kZW5jeSBvbiBHUElPTElCIGlmIENPTVBJTEVfVEVTVCBpcyBlbmFibGVkLCB3aGVyZQphcHBy
b3ByaWF0ZS4KClNpZ25lZC1vZmYtYnk6IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgt
bTY4ay5vcmc+CkNjOiBUaG9tYXMgUGV0YXp6b25pIDx0aG9tYXMucGV0YXp6b25pQGZyZWUtZWxl
Y3Ryb25zLmNvbT4KQ2M6IE5vcmFsZiBUcsO4bm5lcyA8bm9yYWxmQHRyb25uZXMub3JnPgpDYzog
ZGV2ZWxAZHJpdmVyZGV2Lm9zdW9zbC5vcmcKLS0tCiBkcml2ZXJzL3N0YWdpbmcvZmJ0ZnQvS2Nv
bmZpZyB8IDMgKystCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9u
KC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9zdGFnaW5nL2ZidGZ0L0tjb25maWcgYi9kcml2ZXJz
L3N0YWdpbmcvZmJ0ZnQvS2NvbmZpZwppbmRleCA2Y2YwYzU4ZjUzOGJjN2EzLi45OTJiMDMwMmEz
YTQ3MDkxIDEwMDY0NAotLS0gYS9kcml2ZXJzL3N0YWdpbmcvZmJ0ZnQvS2NvbmZpZworKysgYi9k
cml2ZXJzL3N0YWdpbmcvZmJ0ZnQvS2NvbmZpZwpAQCAtMSw2ICsxLDcgQEAKIG1lbnVjb25maWcg
RkJfVEZUCiAJdHJpc3RhdGUgIlN1cHBvcnQgZm9yIHNtYWxsIFRGVCBMQ0QgZGlzcGxheSBtb2R1
bGVzIgotCWRlcGVuZHMgb24gRkIgJiYgU1BJICYmIEdQSU9MSUIKKwlkZXBlbmRzIG9uIEZCICYm
IFNQSQorCWRlcGVuZHMgb24gR1BJT0xJQiB8fCBDT01QSUxFX1RFU1QKIAlzZWxlY3QgRkJfU1lT
X0ZJTExSRUNUCiAJc2VsZWN0IEZCX1NZU19DT1BZQVJFQQogCXNlbGVjdCBGQl9TWVNfSU1BR0VC
TElUCi0tIAoxLjkuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZGV2ZWwgbWFpbGluZyBsaXN0CmRldmVsQGxpbnV4ZHJpdmVycHJvamVjdC5vcmcKaHR0
cDovL2RyaXZlcmRldi5saW51eGRyaXZlcnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
dmVyZGV2LWRldmVsCg==
